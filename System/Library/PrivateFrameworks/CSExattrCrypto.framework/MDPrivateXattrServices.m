@interface MDPrivateXattrServices
+ (id)defaultServices;
- (id)copyPrivateXattrsDictionary:(id)a3 cryptoCallback:(id)a4;
- (id)copyPrivateXattrsFromData:(id)a3;
- (id)copyPrivateXattrsFromData:(id)a3 decryptedXids:(id *)a4;
- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8;
- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8 decrypted:(id *)a9;
- (id)xidDictWithUUIDs:(id)a3 allKeyUUIDs:(id)a4;
- (id)xidDictWithUUIDs:(id)a3 fromKeyRing:(id)a4;
- (id)xidDictWithXPCUUIDs:(id)a3 allKeyUUIDs:(id)a4;
- (void)_restoreAttributesFromDictionary:(id)a3 intoDictionary:(id)a4;
- (void)_restoreAttributesFromPlistBytes:(id)a3 intoDictionary:(id)a4;
- (void)digestUUIDBytesWithKey:(id)a3 forUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16];
- (void)digestUUIDBytesWithKey:(id)a3 forXPCUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16];
- (void)extractDecryptedDataWith:(id)a3 cryptoCallback:(id)a4 decryptableXids:(id)a5 intoDict:(id)a6 keyRing:(id)a7 xid:(id)a8;
- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5;
- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 completionHandler:(id)a6;
- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 mergeCallback:(id)a6 completionHandler:(id)a7;
@end

@implementation MDPrivateXattrServices

+ (id)defaultServices
{
  if (defaultServices_once != -1) {
    dispatch_once(&defaultServices_once, &__block_literal_global_3);
  }
  return (id)gDefaultServices;
}

dispatch_queue_t __41__MDPrivateXattrServices_defaultServices__block_invoke()
{
  gDefaultServices = objc_alloc_init(MDPrivateXattrServices);
  dispatch_queue_t result = dispatch_queue_create("com.apple.metadata.MDPrivateXattrServices.gImportQueue", 0);
  gImportQueue = (uint64_t)result;
  return result;
}

- (void)_restoreAttributesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  CFUUIDRef v6 = (const __CFUUID *)[a3 objectForKey:@"uuid"];
  v7 = (void *)[a3 objectForKey:@"keys"];
  uint64_t v8 = [a3 objectForKey:@"values"];
  if (v6 != CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x71u, 0x9Fu, 0xB8u, 0xCAu, 0x18u, 0x13u, 0x49u, 0xB0u, 0x8Bu, 0x20u, 0x36u, 0x5Eu, 0xEBu, 0xC3u, 0xEDu, 0x57u))
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__MDPrivateXattrServices__restoreAttributesFromDictionary_intoDictionary___block_invoke;
    v9[3] = &unk_26525E7C0;
    v9[4] = a4;
    v9[5] = v8;
    [v7 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t __74__MDPrivateXattrServices__restoreAttributesFromDictionary_intoDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
  return [v3 setObject:v4 forKey:a2];
}

- (void)_restoreAttributesFromPlistBytes:(id)a3 intoDictionary:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__MDPrivateXattrServices__restoreAttributesFromPlistBytes_intoDictionary___block_invoke;
  v4[3] = &unk_26525E7C0;
  v4[4] = self;
  v4[5] = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __74__MDPrivateXattrServices__restoreAttributesFromPlistBytes_intoDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _restoreAttributesFromDictionary:a2 intoDictionary:*(void *)(a1 + 40)];
}

- (id)xidDictWithUUIDs:(id)a3 fromKeyRing:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFUUIDRef v6 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)[a4 allKeyUUIDs];
  uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(obj);
        }
        if (a3)
        {
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
          size_t count = xpc_array_get_count(a3);
          if (count)
          {
            size_t v10 = count;
            for (size_t i = 0; i != v10; ++i)
            {
              uuid = xpc_array_get_uuid(a3, i);
              if (uuid)
              {
                memset(v25, 0, sizeof(v25));
                int v26 = 0;
                long long v24 = 0uLL;
                long long v24 = *(_OWORD *)uuid;
                v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v24];
                unint64_t v22 = 0;
                unint64_t v23 = 0;
                [a4 digestUUIDBytesWithKey:v8 forUUID:v13 uuidBytes:&v22];
                _MDLabelUUIDEncode(v22, v23, (uint64_t)v25);
                [v6 setObject:v8, objc_msgSend(NSString, "stringWithFormat:", @"com.apple.metadata.%s", v25) forKey];
              }
            }
          }
        }
        ++v7;
      }
      while (v7 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v17);
  }
  return v6;
}

- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8 decrypted:(id *)a9
{
  uint64_t v16 = [a5 count];
  if (v16 != [a4 count]) {
    return 0;
  }
  id v33 = a3;
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v17 = +[MDKeyRing defaultKeyRing];
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v19 = v17;
  if (a7)
  {
    id v20 = -[MDPrivateXattrServices xidDictWithXPCUUIDs:allKeyUUIDs:](self, "xidDictWithXPCUUIDs:allKeyUUIDs:", a7, [v17 allKeyUUIDs]);
    a7 = v20;
    if (!a6)
    {
LABEL_10:
      if (v16) {
        goto LABEL_11;
      }
      goto LABEL_15;
    }
  }
  else
  {
    id v20 = 0;
    if (!a6) {
      goto LABEL_10;
    }
  }
  id v22 = -[MDPrivateXattrServices xidDictWithUUIDs:allKeyUUIDs:](self, "xidDictWithUUIDs:allKeyUUIDs:", a6, [v19 allKeyUUIDs]);
  a7 = v22;
  if (!v20) {
    goto LABEL_10;
  }
  if (v22)
  {
    unint64_t v23 = (void *)[v20 mutableCopy];
    [v23 addEntriesFromDictionary:a7];
    a7 = v23;
    goto LABEL_10;
  }
  a7 = v20;
  if (v16)
  {
LABEL_11:
    for (uint64_t i = 0; i != v16; ++i)
    {
      uint64_t v25 = [a5 objectAtIndex:i];
      if ([a7 objectForKey:v25]) {
        objc_msgSend(v18, "setObject:forKey:", objc_msgSend(a4, "objectAtIndex:", i), v25);
      }
    }
  }
LABEL_15:
  long long v21 = v34;
  if ([v18 count])
  {
    if (a9) {
      *a9 = (id)[v18 allKeys];
    }
    int v26 = v19;
    if (a8)
    {
      size_t count = xpc_array_get_count(a8);
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:count];
      if (count)
      {
        for (size_t j = 0; j != count; ++j)
        {
          string = xpc_array_get_string(a8, j);
          if (string)
          {
            v31 = (void *)[[NSString alloc] initWithCString:string encoding:4];
            [v28 addObject:v31];
          }
          else
          {
            NSLog(&cfstr_NilXidString.isa);
          }
          int v26 = v19;
        }
      }
      long long v21 = v34;
      [(MDPrivateXattrServices *)self extractDecryptedDataWith:v18 cryptoCallback:v33 decryptableXids:a7 intoDict:v34 keyRing:v26 xid:v28];
    }
    else
    {
      [(MDPrivateXattrServices *)self extractDecryptedDataWith:v18 cryptoCallback:v33 decryptableXids:a7 intoDict:v34 keyRing:v19 xid:a5];
    }
  }

  return v21;
}

- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8
{
  return [(MDPrivateXattrServices *)self decryptDataArrayWithCryptoCallback:a3 dataArray:a4 existingXIDArray:a5 uuids:a6 xpc_uuids:a7 xids:a8 decrypted:0];
}

- (void)extractDecryptedDataWith:(id)a3 cryptoCallback:(id)a4 decryptableXids:(id)a5 intoDict:(id)a6 keyRing:(id)a7 xid:(id)a8
{
  id v8 = a8;
  uint64_t v82 = *MEMORY[0x263EF8340];
  size_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a8, "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v70 = [v8 countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v70)
  {
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v67 = *(void *)v76;
    id v59 = a7;
    v60 = v10;
    id v58 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v76 != v67) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v75 + 1) + 8 * v11);
        v13 = (void *)[a3 objectForKey:v12];
        if (!v13) {
          NSLog(&cfstr_DonTKnowHowToD.isa, v12);
        }
        v14 = (const void *)[a5 objectForKey:v12];
        if (v14)
        {
          v15 = v14;
          CFRetain(v14);
          if (!v13) {
            goto LABEL_40;
          }
        }
        else
        {
          v15 = (const void *)[a7 copyDesignatedKeyUUID];
          if (!v13) {
            goto LABEL_40;
          }
        }
        uint64_t v16 = (unsigned __int8 *)[v13 bytes];
        unint64_t v17 = [v13 length];
        if (v17 < 0xA)
        {
          NSLog(&cfstr_CryptedTooSmal.isa, v55);
          goto LABEL_39;
        }
        int v18 = *v16;
        if (v18 == 242)
        {
          CFDataRef v24 = (const __CFData *)copyDecryptedData((uint64_t)a4, (uint64_t)v16, (uint64_t)v15, (uint64_t)v16, v17);
          if (!v24)
          {
            NSLog(&cfstr_FailedToDecryp_0.isa, v15);
LABEL_39:
            NSLog(&cfstr_BadFormat.isa, v12);
LABEL_40:
            if (!v15) {
              goto LABEL_42;
            }
LABEL_41:
            CFRelease(v15);
            goto LABEL_42;
          }
          CFDataRef v25 = v24;
          BytePtr = CFDataGetBytePtr(v24);
          unint64_t Length = CFDataGetLength(v25);
          if (_init_private_attributes_once != -1) {
            dispatch_once(&_init_private_attributes_once, &__block_literal_global_121);
          }
          unint64_t v28 = 0x2696BF000uLL;
          CFDataRef v61 = v25;
          v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:0];
          unint64_t v79 = 0;
          if (Length)
          {
            CFTypeRef v63 = 0;
            do
            {
              v30 = copyCFTypeFromBuffer((uint64_t)BytePtr, &v79, Length);
              if (v30)
              {
                v31 = v30;
                v32 = copyCFTypeFromBuffer((uint64_t)BytePtr, &v79, Length);
                if (v32)
                {
                  id v33 = v32;
                  if (CFGetTypeID(v31) == *(void *)(v28 + 1192))
                  {
                    if (CFEqual(@"mod_date", v31))
                    {
                      CFTypeID v34 = CFGetTypeID(v33);
                      BOOL v35 = v34 == CFDateGetTypeID();
                      unint64_t v28 = 0x2696BF000;
                      if (v35) {
                        CFTypeRef v63 = CFRetain(v33);
                      }
                    }
                    else
                    {
                      [v29 setObject:v33 forKey:v31];
                    }
                  }
                  CFRelease(v33);
                }
                CFRelease(v31);
              }
            }
            while (v79 < Length);
          }
          else
          {
            CFTypeRef v63 = 0;
          }
          if (![v29 count])
          {

            v29 = 0;
          }
          a7 = v59;
          size_t v10 = v60;
          uint64_t v46 = [v29 allKeys];
          uint64_t v47 = [v29 allValues];

          if (v46 && v47)
          {
            id v48 = objc_alloc(MEMORY[0x263EFF9A0]);
            uint64_t v49 = (uint64_t)v63;
            if (!v63) {
              uint64_t v49 = [MEMORY[0x263EFF910] distantPast];
            }
            v29 = objc_msgSend(v48, "initWithObjectsAndKeys:", v46, @"keys", v47, @"values", v49, @"mod_date", 0);
          }
          CFDataRef v20 = v61;
          id v23 = v29;
        }
        else
        {
          if (v18 != 241)
          {
            NSLog(&cfstr_UnexpectedHead.isa, *v16);
            goto LABEL_39;
          }
          CFDataRef v19 = (const __CFData *)copyDecryptedData((uint64_t)a4, (uint64_t)v16, (uint64_t)v15, (uint64_t)v16, v17);
          if (!v19)
          {
            NSLog(&cfstr_FailedToDecryp.isa, v15);
            goto LABEL_39;
          }
          CFDataRef v20 = v19;
          long long v21 = CFDataGetBytePtr(v19);
          CFIndex v22 = CFDataGetLength(v20);
          id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          if (v22 >= 2 && (CFAllocatorRef v36 = alloc, (unint64_t)v22 >= 0x14) && *(_DWORD *)v21 == 1279345228)
          {
            CFDataRef v62 = v20;
            CFUUIDRef v37 = CFUUIDCreateFromUUIDBytes(alloc, *(CFUUIDBytes *)(v21 + 4));
            v64 = v23;
            [v23 setValue:v37 forKey:@"uuid"];
            CFRelease(v37);
            v38 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
            v39 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
            if ((unint64_t)v22 >= 0x24)
            {
              unint64_t v40 = (unint64_t)&v21[v22];
              v41 = (CFUUIDBytes *)(v21 + 36);
              v42 = (CFUUIDBytes *)(v21 + 20);
              do
              {
                CFUUIDRef v43 = CFUUIDCreateFromUUIDBytes(v36, *v42);
                CFAbsoluteTime v44 = 0.0;
                if ((unint64_t)&v42[1].byte8 <= v40)
                {
                  CFAbsoluteTime v44 = *(double *)&v41->byte0;
                  v41 = (CFUUIDBytes *)((char *)v42 + 24);
                }
                v42 = v41;
                CFAllocatorRef v36 = alloc;
                CFDateRef v45 = CFDateCreate(alloc, v44);
                [v38 addObject:v43];
                CFRelease(v43);
                [v39 addObject:v45];
                CFRelease(v45);
                v41 = v42 + 1;
              }
              while ((unint64_t)&v42[1] <= v40);
            }
            [v64 setValue:v38 forKey:@"keys"];

            [v64 setValue:v39 forKey:@"values"];
            id v23 = v64;
            a7 = v59;
            size_t v10 = v60;
            id v8 = v58;
            CFDataRef v20 = v62;
          }
          else
          {
            id v8 = v58;
          }
        }
        CFRelease(v20);
        if (!v23) {
          goto LABEL_39;
        }
        [v10 addObject:v23];

        if (v15) {
          goto LABEL_41;
        }
LABEL_42:
        ++v11;
      }
      while (v11 != v70);
      uint64_t v50 = [v8 countByEnumeratingWithState:&v75 objects:v81 count:16];
      uint64_t v70 = v50;
    }
    while (v50);
  }
  if ([v10 count])
  {
    [v10 sortUsingComparator:&__block_literal_global_32];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v51 = [v10 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v72 != v53) {
            objc_enumerationMutation(v10);
          }
          [(MDPrivateXattrServices *)self _restoreAttributesFromDictionary:*(void *)(*((void *)&v71 + 1) + 8 * i) intoDictionary:a6];
        }
        uint64_t v52 = [v10 countByEnumeratingWithState:&v71 objects:v80 count:16];
      }
      while (v52);
    }
  }
}

uint64_t __103__MDPrivateXattrServices_extractDecryptedDataWith_cryptoCallback_decryptableXids_intoDict_keyRing_xid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 objectForKey:@"mod_date"];
  uint64_t v5 = [a3 objectForKey:@"mod_date"];
  return [v4 compare:v5];
}

- (id)copyPrivateXattrsDictionary:(id)a3 cryptoCallback:(id)a4
{
  +[MDKeyRing defaultKeyRing];
  uint64_t v7 = [a3 objectForKey:@"xids"];
  uint64_t v8 = [a3 objectForKey:@"uuids"];
  uint64_t v9 = [a3 objectForKey:@"datas"];
  if (!v8 || !v9 || !v7) {
    return 0;
  }
  return [(MDPrivateXattrServices *)self decryptDataArrayWithCryptoCallback:a4 dataArray:v9 existingXIDArray:v7 uuids:0 xpc_uuids:v8 xids:0];
}

- (id)copyPrivateXattrsFromData:(id)a3 decryptedXids:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  [a3 bytes];
  [a3 length];
  _MDPlistGetRootPlistObjectFromBytes();
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  long long v24 = 0uLL;
  uint64_t v25 = 0;
  if (!_MDPlistDictionaryGetPlistObjectForKey())
  {
    uint64_t v7 = 0;
LABEL_9:
    uint64_t v9 = 0;
    uint64_t v8 = 0;
LABEL_25:
    id v17 = 0;
    goto LABEL_26;
  }
  long long v24 = v26;
  uint64_t v25 = v27;
  if (_MDPlistGetPlistObjectType() == 240)
  {
    long long v24 = v26;
    uint64_t v25 = v27;
    uint64_t v7 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  long long v24 = v28;
  uint64_t v25 = v29;
  if (!_MDPlistDictionaryGetPlistObjectForKey()) {
    goto LABEL_9;
  }
  long long v24 = v26;
  uint64_t v25 = v27;
  if (_MDPlistGetPlistObjectType() == 240)
  {
    long long v24 = v26;
    uint64_t v25 = v27;
    uint64_t v8 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  long long v24 = v28;
  uint64_t v25 = v29;
  if (!_MDPlistDictionaryGetPlistObjectForKey()
    || (long long v24 = v26, v25 = v27, _MDPlistGetPlistObjectType() != 240))
  {
    uint64_t v9 = 0;
    goto LABEL_25;
  }
  CFDataRef v19 = self;
  long long v24 = v26;
  uint64_t v25 = v27;
  size_t v10 = (void *)_MDPlistContainerCopyObject();
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v20 + 1) + 8 * v15)];
        [v11 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v13);
  }
  uint64_t v9 = (void *)[v11 copy];

  id v17 = 0;
  if (v9 && v8 && v7) {
    id v17 = [(MDPrivateXattrServices *)v19 decryptDataArrayWithCryptoCallback:&__block_literal_global_50 dataArray:v8 existingXIDArray:v7 uuids:v9 xpc_uuids:0 xids:0 decrypted:a4];
  }
LABEL_26:

  return v17;
}

uint64_t __66__MDPrivateXattrServices_copyPrivateXattrsFromData_decryptedXids___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v11 = +[MDKeyRing defaultKeyRing];
  if (a6 == 1)
  {
    return [v11 copyEncryptedData:a5 withKeyUUID:a2 iv1:a3 iv2:a4];
  }
  else
  {
    return [v11 copyDecryptedData:a5 withKeyUUID:a2 iv1:a3 iv2:a4];
  }
}

- (id)copyPrivateXattrsFromData:(id)a3
{
  return [(MDPrivateXattrServices *)self copyPrivateXattrsFromData:a3 decryptedXids:0];
}

- (void)digestUUIDBytesWithKey:(id)a3 forUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long data = 0uLL;
  memset(&v8, 0, sizeof(v8));
  CC_MD5_Init(&v8);
  [a4 getUUIDBytes:&data];
  CC_MD5_Update(&v8, &data, 0x10u);
  [a3 getUUIDBytes:&data];
  CC_MD5_Update(&v8, &data, 0x10u);
  CC_MD5_Final((unsigned __int8 *)&data, &v8);
  *(_OWORD *)a5 = data;
}

- (id)xidDictWithUUIDs:(id)a3 allKeyUUIDs:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a4;
  uint64_t v18 = [a4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * v8);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v10 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(a3);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                digestOneInternal(self, v9, v14, v7);
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }
        digestOneInternal(self, v9, v9, v7);
        ++v8;
      }
      while (v8 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
  return v7;
}

- (void)digestUUIDBytesWithKey:(id)a3 forXPCUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long data = 0uLL;
  memset(&v9, 0, sizeof(v9));
  CC_MD5_Init(&v9);
  bytes = xpc_uuid_get_bytes(a4);
  CC_MD5_Update(&v9, bytes, 0x10u);
  [a3 getUUIDBytes:&data];
  CC_MD5_Update(&v9, &data, 0x10u);
  CC_MD5_Final((unsigned __int8 *)&data, &v9);
  *(_OWORD *)a5 = data;
}

- (id)xidDictWithXPCUUIDs:(id)a3 allKeyUUIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a4;
  uint64_t v8 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __58__MDPrivateXattrServices_xidDictWithXPCUUIDs_allKeyUUIDs___block_invoke;
        applier[3] = &unk_26525E828;
        applier[4] = self;
        applier[5] = v12;
        applier[6] = v7;
        xpc_array_apply(a3, applier);
        digestOneInternal(self, v12, v12, v7);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return v7;
}

uint64_t __58__MDPrivateXattrServices_xidDictWithXPCUUIDs_allKeyUUIDs___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = (void *)a1[6];
  memset(v9, 0, sizeof(v9));
  int v10 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  [v3 digestUUIDBytesWithKey:v4 forXPCUUID:a3 uuidBytes:&v7];
  _MDLabelUUIDEncode(v7, v8, (uint64_t)v9);
  [v5 setObject:v4, objc_msgSend(NSString, "stringWithFormat:", @"com.apple.metadata.%s", v9) forKey];
  return 1;
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 mergeCallback:(id)a6 completionHandler:(id)a7
{
  char v10 = a4;
  if (updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__once != -1) {
    dispatch_once(&updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__once, &__block_literal_global_68);
  }
  uint64_t v12 = dup(a5);
  CFUUIDRef v13 = (const __CFUUID *)[a3 objectForKey:@"uuid"];
  CFUUIDRef v14 = v13;
  if (v13 && (CFTypeID v15 = CFGetTypeID(v13), v15 == CFUUIDGetTypeID()))
  {
    CFUUIDBytes v23 = CFUUIDGetUUIDBytes(v14);
    CFUUIDRef v16 = (const __CFUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v23];
  }
  else
  {
    CFUUIDRef v16 = v14;
  }
  CFUUIDRef v17 = v16;
  uint64_t v18 = [(id)updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__sMDPrivateMDAttributesXattrNSUUID isEqual:v16];
  CFDictionaryRef v19 = MDFSOnlyMDCopyXattrsDictionaryForFD(v12);
  long long v20 = (id)CFDictionaryGetValue(v19, @"_kMDItemEncryptedData");
  CFRelease(v19);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __107__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler___block_invoke_2;
  v21[3] = &unk_26525E850;
  int v22 = v12;
  v21[5] = v20;
  v21[6] = a7;
  v21[4] = v17;
  (*((void (**)(id, const void *, id, uint64_t, void, void *))a6 + 2))(a6, v20, a3, v18, v10 & 1, v21);
}

uint64_t __107__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler___block_invoke()
{
  CFUUIDRef v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xFEu, 0x65u, 0x61u, 0x5Bu, 0xFu, 0xF3u, 0x4Eu, 0x3Du, 0xBBu, 0x10u, 0xA7u, 0xACu, 0x81u, 0x62u, 0x22u, 0x6Eu);
  CFUUIDBytes v2 = CFUUIDGetUUIDBytes(v0);
  uint64_t result = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v2];
  updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__sMDPrivateMDAttributesXattrNSUUID = result;
  return result;
}

void __107__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!(a3 | a4))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = objc_alloc(MEMORY[0x263F087E8]);
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, [v15 initWithDomain:*MEMORY[0x263F08438] code:32 userInfo:0]);
    goto LABEL_24;
  }
  if ([(id)a3 length] && objc_msgSend(a2, "length"))
  {
    int v8 = *(_DWORD *)(a1 + 56);
    uint64_t v9 = (const char *)[a2 UTF8String];
    if ([(id)a3 length])
    {
      char v10 = (const void *)[(id)a3 bytes];
      size_t v11 = [(id)a3 length];
      if (!strcmp(v9, "com.apple.metadata:kMDItemIsShared"))
      {
        CFUUIDRef v13 = "com.apple.metadata:kMDItemIsShared#PS";
      }
      else
      {
        if (strcmp(v9, "com.apple.metadata:kMDItemSharedItemCurrentUserRole"))
        {
          int v12 = v8;
          CFUUIDRef v13 = v9;
LABEL_13:
          fsetxattr(v12, v13, v10, v11, 0, 0);
          goto LABEL_14;
        }
        CFUUIDRef v13 = "com.apple.metadata:kMDItemSharedItemCurrentUserRole#PS";
      }
      int v12 = v8;
      goto LABEL_13;
    }
    fremovexattr(v8, v9, 0);
  }
LABEL_14:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = [(id)a4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation((id)a4);
        }
        long long v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([a2 isEqual:v20] & 1) == 0) {
          fremovexattr(*(_DWORD *)(a1 + 56), (const char *)[v20 UTF8String], 0);
        }
      }
      uint64_t v17 = [(id)a4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
  (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
LABEL_24:
  close(*(_DWORD *)(a1 + 56));
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 completionHandler:(id)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __93__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_completionHandler___block_invoke;
  v6[3] = &unk_26525E878;
  v6[4] = self;
  [(MDPrivateXattrServices *)self updatePrivateXattrParams:a3 flags:a4 forFileDescriptor:*(void *)&a5 mergeCallback:v6 completionHandler:a6];
}

void __93__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7 = (void *)copyUpdatedData(*(void *)(a1 + 32));
  (*(void (**)(uint64_t, void, void *))(a6 + 16))(a6, 0, v7);
}

uint64_t __93__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v11 = +[MDKeyRing defaultKeyRing];
  if (a6 == 1)
  {
    return [v11 copyEncryptedData:a5 withKeyUUID:a2 iv1:a3 iv2:a4];
  }
  else
  {
    return [v11 copyDecryptedData:a5 withKeyUUID:a2 iv1:a3 iv2:a4];
  }
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5
{
}

@end