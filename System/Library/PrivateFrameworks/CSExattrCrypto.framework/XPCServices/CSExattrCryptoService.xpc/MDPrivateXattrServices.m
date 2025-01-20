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
  if (qword_10001A408 != -1) {
    dispatch_once(&qword_10001A408, &stru_100014CC0);
  }
  return (id)qword_10001A410;
}

- (void)_restoreAttributesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  CFUUIDRef v6 = (const __CFUUID *)[a3 objectForKey:@"uuid"];
  id v7 = [a3 objectForKey:@"keys"];
  id v8 = [a3 objectForKey:@"values"];
  if (v6 != CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x71u, 0x9Fu, 0xB8u, 0xCAu, 0x18u, 0x13u, 0x49u, 0xB0u, 0x8Bu, 0x20u, 0x36u, 0x5Eu, 0xEBu, 0xC3u, 0xEDu, 0x57u))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009B20;
    v9[3] = &unk_100014CE8;
    v9[4] = a4;
    v9[5] = v8;
    [v7 enumerateObjectsUsingBlock:v9];
  }
}

- (void)_restoreAttributesFromPlistBytes:(id)a3 intoDictionary:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009BD8;
  v4[3] = &unk_100014CE8;
  v4[4] = self;
  v4[5] = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

- (id)xidDictWithUUIDs:(id)a3 fromKeyRing:(id)a4
{
  CFUUIDRef v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a4 allKeyUUIDs];
  id v17 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(obj);
        }
        if (a3)
        {
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v7);
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
                id v13 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v24];
                unint64_t v22 = 0;
                unint64_t v23 = 0;
                [a4 digestUUIDBytesWithKey:v8 forUUID:v13 uuidBytes:&v22];
                _MDLabelUUIDEncode(v22, v23, (uint64_t)v25);
                [(NSMutableDictionary *)v6 setObject:v8 forKey:+[NSString stringWithFormat:@"com.apple.metadata.%s", v25]];
              }
            }
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v7 != v17);
      id v17 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v17);
  }
  return v6;
}

- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8 decrypted:(id *)a9
{
  uint64_t v16 = (char *)[a5 count];
  if (v16 != [a4 count]) {
    return 0;
  }
  id v33 = a3;
  id v34 = objc_alloc_init((Class)NSMutableDictionary);
  id v17 = +[MDKeyRing defaultKeyRing];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
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
    id v23 = [v20 mutableCopy];
    [v23 addEntriesFromDictionary:a7];
    a7 = v23;
    goto LABEL_10;
  }
  a7 = v20;
  if (v16)
  {
LABEL_11:
    for (size_t i = 0; i != v16; ++i)
    {
      id v25 = [a5 objectAtIndex:i];
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
      *a9 = [v18 allKeys];
    }
    int v26 = v19;
    if (a8)
    {
      size_t count = xpc_array_get_count(a8);
      id v28 = [objc_alloc((Class)NSMutableArray) initWithCapacity:count];
      if (count)
      {
        for (size_t j = 0; j != count; ++j)
        {
          string = xpc_array_get_string(a8, j);
          if (string)
          {
            id v31 = [objc_alloc((Class)NSString) initWithCString:string encoding:4];
            [v28 addObject:v31];
          }
          else
          {
            NSLog(@"Nil xid_string");
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
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(a8, "count"));
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v69 = [v8 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v69)
  {
    uint64_t v66 = *(void *)v75;
    id v59 = a7;
    id v60 = v10;
    id v58 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v75 != v66) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v74 + 1) + 8 * (void)v11);
        id v13 = [a3 objectForKey:v12];
        if (!v13) {
          NSLog(@"Don't know how to decrypt %@", v12);
        }
        id v14 = [a5 objectForKey:v12];
        if (v14)
        {
          id v15 = v14;
          CFRetain(v14);
          if (!v13) {
            goto LABEL_40;
          }
        }
        else
        {
          id v15 = [a7 copyDesignatedKeyUUID];
          if (!v13) {
            goto LABEL_40;
          }
        }
        uint64_t v16 = (unsigned __int8 *)[v13 bytes];
        id v17 = [v13 length];
        if ((unint64_t)v17 < 0xA)
        {
          NSLog(@"Crypted too small to contain header", v55);
          goto LABEL_39;
        }
        int v18 = *v16;
        if (v18 == 242)
        {
          CFDataRef v24 = (const __CFData *)sub_10000D9AC((uint64_t)a4, (uint64_t)v16, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17);
          if (!v24)
          {
            NSLog(@"Failed to decrypt private attr with %@", v15);
LABEL_39:
            NSLog(@"Bad format? %@", v12);
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
          if (qword_10001A448 != -1) {
            dispatch_once(&qword_10001A448, &stru_100014EF0);
          }
          id v28 = &unk_10001A000;
          CFDataRef v61 = v25;
          id v29 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
          unint64_t v78 = 0;
          if (Length)
          {
            v63 = 0;
            do
            {
              v30 = sub_10000DA3C((uint64_t)BytePtr, &v78, Length);
              if (v30)
              {
                id v31 = v30;
                v32 = sub_10000DA3C((uint64_t)BytePtr, &v78, Length);
                if (v32)
                {
                  id v33 = v32;
                  if (CFGetTypeID(v31) == v28[136])
                  {
                    if (CFEqual(@"mod_date", v31))
                    {
                      CFTypeID v34 = CFGetTypeID(v33);
                      BOOL v35 = v34 == CFDateGetTypeID();
                      id v28 = (void *)&unk_10001A000;
                      if (v35) {
                        v63 = (NSDate *)CFRetain(v33);
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
            while (v78 < Length);
          }
          else
          {
            v63 = 0;
          }
          if (![v29 count])
          {

            id v29 = 0;
          }
          a7 = v59;
          id v10 = v60;
          id v46 = [v29 allKeys];
          id v47 = [v29 allValues];

          if (v46 && v47)
          {
            id v48 = objc_alloc((Class)NSMutableDictionary);
            v49 = v63;
            if (!v63) {
              v49 = +[NSDate distantPast];
            }
            id v29 = objc_msgSend(v48, "initWithObjectsAndKeys:", v46, @"keys", v47, @"values", v49, @"mod_date", 0);
          }
          CFDataRef v20 = v61;
          id v23 = v29;
        }
        else
        {
          if (v18 != 241)
          {
            NSLog(@"Unexpected head %x", *v16);
            goto LABEL_39;
          }
          CFDataRef v19 = (const __CFData *)sub_10000D9AC((uint64_t)a4, (uint64_t)v16, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17);
          if (!v19)
          {
            NSLog(@"Failed to decrypt private label with %@", v15);
            goto LABEL_39;
          }
          CFDataRef v20 = v19;
          long long v21 = CFDataGetBytePtr(v19);
          CFIndex v22 = CFDataGetLength(v20);
          id v23 = objc_alloc_init((Class)NSMutableDictionary);
          if (v22 >= 2 && (CFAllocatorRef v36 = kCFAllocatorDefault, (unint64_t)v22 >= 0x14) && *(_DWORD *)v21 == 1279345228)
          {
            CFDataRef v62 = v20;
            CFUUIDRef v37 = CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, *(CFUUIDBytes *)(v21 + 4));
            v64 = v23;
            [v23 setValue:v37 forKey:@"uuid"];
            CFRelease(v37);
            id v38 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
            id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
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
                CFAllocatorRef v36 = kCFAllocatorDefault;
                CFDateRef v45 = CFDateCreate(kCFAllocatorDefault, v44);
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
            id v10 = v60;
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
        v11 = (char *)v11 + 1;
      }
      while (v11 != v69);
      id v50 = [v8 countByEnumeratingWithState:&v74 objects:v80 count:16];
      id v69 = v50;
    }
    while (v50);
  }
  if ([v10 count])
  {
    [v10 sortUsingComparator:&stru_100014D28];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v51 = [v10 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v71;
      do
      {
        for (size_t i = 0; i != v52; size_t i = (char *)i + 1)
        {
          if (*(void *)v71 != v53) {
            objc_enumerationMutation(v10);
          }
          [(MDPrivateXattrServices *)self _restoreAttributesFromDictionary:*(void *)(*((void *)&v70 + 1) + 8 * i) intoDictionary:a6];
        }
        id v52 = [v10 countByEnumeratingWithState:&v70 objects:v79 count:16];
      }
      while (v52);
    }
  }
}

- (id)copyPrivateXattrsDictionary:(id)a3 cryptoCallback:(id)a4
{
  +[MDKeyRing defaultKeyRing];
  id v7 = [a3 objectForKey:@"xids"];
  id v8 = [a3 objectForKey:@"uuids"];
  id v9 = [a3 objectForKey:@"datas"];
  if (!v8 || !v9 || !v7) {
    return 0;
  }
  return [(MDPrivateXattrServices *)self decryptDataArrayWithCryptoCallback:a4 dataArray:v9 existingXIDArray:v7 uuids:0 xpc_uuids:v8 xids:0];
}

- (id)copyPrivateXattrsFromData:(id)a3 decryptedXids:(id *)a4
{
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
    id v7 = 0;
LABEL_9:
    id v9 = 0;
    id v8 = 0;
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
    id v7 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
    id v7 = 0;
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
    id v8 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
    id v8 = 0;
  }
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  long long v24 = v28;
  uint64_t v25 = v29;
  if (!_MDPlistDictionaryGetPlistObjectForKey()
    || (long long v24 = v26, v25 = v27, _MDPlistGetPlistObjectType() != 240))
  {
    id v9 = 0;
    goto LABEL_25;
  }
  CFDataRef v19 = self;
  long long v24 = v26;
  uint64_t v25 = v27;
  id v10 = (void *)_MDPlistContainerCopyObject();
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v20 + 1) + 8 * (void)v15)];
        [v11 addObject:v16];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v13);
  }
  id v9 = [v11 copy];

  id v17 = 0;
  if (v9 && v8 && v7) {
    id v17 = [(MDPrivateXattrServices *)v19 decryptDataArrayWithCryptoCallback:&stru_100014D68 dataArray:v8 existingXIDArray:v7 uuids:v9 xpc_uuids:0 xids:0 decrypted:a4];
  }
LABEL_26:

  return v17;
}

- (id)copyPrivateXattrsFromData:(id)a3
{
  return [(MDPrivateXattrServices *)self copyPrivateXattrsFromData:a3 decryptedXids:0];
}

- (void)digestUUIDBytesWithKey:(id)a3 forUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
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
  id v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a4;
  id v18 = [a4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      CC_MD5_CTX v8 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v8);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            id v13 = 0;
            do
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(a3);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v13);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                sub_10000BF60(self, v9, v14, v7);
              }
              id v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }
        sub_10000BF60(self, v9, v9, v7);
        CC_MD5_CTX v8 = (char *)v8 + 1;
      }
      while (v8 != v18);
      id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
  return v7;
}

- (void)digestUUIDBytesWithKey:(id)a3 forXPCUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
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
  id v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a4;
  id v8 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_10000C26C;
        applier[3] = &unk_100014D90;
        applier[4] = self;
        applier[5] = v12;
        applier[6] = v7;
        xpc_array_apply(a3, applier);
        sub_10000BF60(self, v12, v12, v7);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return v7;
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 mergeCallback:(id)a6 completionHandler:(id)a7
{
  char v10 = a4;
  if (qword_10001A428 != -1) {
    dispatch_once(&qword_10001A428, &stru_100014DB0);
  }
  uint64_t v12 = dup(a5);
  CFUUIDRef v13 = (const __CFUUID *)[a3 objectForKey:@"uuid"];
  CFUUIDRef v14 = v13;
  if (v13 && (CFTypeID v15 = CFGetTypeID(v13), v15 == CFUUIDGetTypeID()))
  {
    CFUUIDBytes v23 = CFUUIDGetUUIDBytes(v14);
    CFUUIDRef v16 = (const __CFUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:&v23];
  }
  else
  {
    CFUUIDRef v16 = v14;
  }
  CFUUIDRef v17 = v16;
  id v18 = [(id)qword_10001A420 isEqual:v16];
  CFDictionaryRef v19 = MDFSOnlyMDCopyXattrsDictionaryForFD(v12);
  long long v20 = (id)CFDictionaryGetValue(v19, @"_kMDItemEncryptedData");
  CFRelease(v19);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000C554;
  v21[3] = &unk_100014DD8;
  int v22 = v12;
  v21[5] = v20;
  v21[6] = a7;
  v21[4] = v17;
  (*((void (**)(id, const void *, id, id, void, void *))a6 + 2))(a6, v20, a3, v18, v10 & 1, v21);
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 completionHandler:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C81C;
  v6[3] = &unk_100014E20;
  v6[4] = self;
  [(MDPrivateXattrServices *)self updatePrivateXattrParams:a3 flags:a4 forFileDescriptor:*(void *)&a5 mergeCallback:v6 completionHandler:a6];
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5
{
}

@end