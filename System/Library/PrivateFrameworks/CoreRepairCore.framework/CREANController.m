@interface CREANController
- (BOOL)_writeDataToEAN:(id)a3 withKey:(id)a4;
- (BOOL)calculateDerLength:(id)a3 actualSize:(unint64_t *)a4;
- (BOOL)copyFDREANValues:(id)a3 outgenerationCount:(unsigned int *)a4 outManifesthash:(id *)a5;
- (BOOL)deleteFDRDataFromEANWithDataClass:(id)a3;
- (BOOL)isEANSupported;
- (BOOL)readFDRDataFromEANWithDataClass:(id)a3 outData:(id *)a4 stripPadding:(BOOL)a5;
- (BOOL)setupVersionedFDRWithApTicket:(id)a3;
- (BOOL)stageVersionedFDREANWithdataDir:(id)a3 error:(id *)a4;
- (BOOL)swapEAN:(id)a3 withKey:(id)a4;
- (BOOL)swapVersionedFDR;
- (BOOL)verifyFDRDataFromEANUsingCache:(BOOL)a3 cachedData:(id)a4;
- (BOOL)writeEAN:(id)a3 isImg4:(BOOL)a4;
- (BOOL)writeFDRDataToEANWithdataDir:(id)a3;
- (id)_apticketCopyDataObjectPropertyWithTag:(unint64_t)a3 property:(unint64_t)a4;
- (id)_getDataClassesToWrite;
- (id)_ticketCopyHashDataWithNode:(unsigned int)a3;
- (id)apticketCopyHashData;
- (id)copyCurrentFDREANValuesWithdataDir:(id)a3 error:(id *)a4;
- (id)copyStagedFDREanDataWithdataDir:(id)a3 error:(id *)a4;
- (unint64_t)sizeEAN:(id)a3;
- (unsigned)_getQuerykeyFromDataClass:(id)a3;
- (unsigned)nextEANGenerationCount;
@end

@implementation CREANController

- (BOOL)isEANSupported
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/defaults");
  if (v2)
  {
    io_object_t v3 = v2;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, @"ean-storage-present", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    BOOL v5 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v3);
  }
  else
  {
    v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F210();
    }

    return 0;
  }
  return v5;
}

- (BOOL)writeFDRDataToEANWithdataDir:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  CFStringRef v4 = (const __CFString *)a3;
  id v68 = 0;
  v69 = 0;
  v57 = objc_opt_new();
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v56 = (__CFString *)v4;
  CFURLRef v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFURLPOSIXPathStyle, 1u);
  Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v8 = (const void *)*MEMORY[0x263EFFB38];
  CFDictionarySetValue(Mutable, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
  CFDictionarySetValue(Mutable, @"StripImg4", v8);
  CFDictionarySetValue(Mutable, @"VerifyData", v8);
  CFDictionarySetValue(Mutable, @"DataDirectory", v6);
  v12 = objc_msgSend__getDataClassesToWrite(self, v9, v10, v11);
  v16 = v12;
  if (!v12 || !objc_msgSend_count(v12, v13, v14, v15))
  {
    v49 = v16;
    v51 = handleForCategory(0);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F244();
    }

    v19 = 0;
LABEL_55:
    BOOL v50 = 0;
    goto LABEL_60;
  }
  v55 = v16;
  v17 = handleForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFDataRef v71 = (const __CFData *)v16;
    _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "Writing Following FDR Data Classes to EAN: %@", buf, 0xCu);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v16;
  v19 = 0;
  CFDataRef v20 = 0;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v60, (uint64_t)v74, 16);
  if (!v21) {
    goto LABEL_47;
  }
  uint64_t v22 = *(void *)v61;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v61 != v22) {
        objc_enumerationMutation(obj);
      }
      CFDataRef v24 = *(const __CFData **)(*((void *)&v60 + 1) + 8 * i);
      if (v20) {
        CFRelease(v20);
      }
      v25 = handleForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFDataRef v71 = v24;
        _os_log_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_DEFAULT, "Copying data class: %@ to memory cache", buf, 0xCu);
      }

      if (objc_msgSend_isEqualToString_(v24, v26, @"seal", v27))
      {
        CFDataRef LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
      }
      else if (AMFDRSealingMapEntryHasAttribute())
      {
        v29 = handleForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFDataRef v71 = v24;
          _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
        }

        CFDataRef LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCreateLocalMultiDataBlobForClass();
      }
      else
      {
        CFDataRef LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingManifestCopyLocalDataForClass();
      }
      CFDataRef v20 = LocalMultiDataBlobForClass;
      if (!LocalMultiDataBlobForClass || !CFDataGetLength(LocalMultiDataBlobForClass))
      {
        v31 = v69;
LABEL_29:
        if (v31)
        {

          v69 = 0;
        }
        else
        {
          v31 = v19;
        }
        v35 = handleForCategory(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFDataRef v71 = v24;
          __int16 v72 = 2112;
          v73 = v31;
          _os_log_impl(&dword_21FBF2000, v35, OS_LOG_TYPE_DEFAULT, "Failed to read FDR data instance for: %@ with error %@", buf, 0x16u);
        }

        char FDRDataFromEANWithDataClass_outData_stripPadding = objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v36, (uint64_t)v24, (uint64_t)&v68, 0);
        if (v68) {
          char v40 = FDRDataFromEANWithDataClass_outData_stripPadding;
        }
        else {
          char v40 = 0;
        }
        if (v40)
        {
          if ((objc_msgSend_deleteFDRDataFromEANWithDataClass_(self, v38, (uint64_t)v24, v39) & 1) == 0)
          {
            v52 = handleForCategory(0);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              sub_21FC5F2AC();
            }

            BOOL v50 = 0;
            v19 = v31;
            goto LABEL_59;
          }
          v41 = handleForCategory(0);
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_44;
          }
          *(_DWORD *)buf = 138412290;
          CFDataRef v71 = v24;
          v42 = v41;
          v43 = "Successfully deleted %@ from EAN";
          uint32_t v44 = 12;
        }
        else
        {
          v41 = handleForCategory(0);
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
LABEL_44:

            v19 = v31;
            continue;
          }
          *(_WORD *)buf = 0;
          v42 = v41;
          v43 = "Data class already absent from EAN";
          uint32_t v44 = 2;
        }
        _os_log_impl(&dword_21FBF2000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, v44);
        goto LABEL_44;
      }
      CFIndex Length = CFDataGetLength(v20);
      v31 = v69;
      if (Length > 10000000 || v69) {
        goto LABEL_29;
      }
      v32 = handleForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFDataRef v71 = v20;
        _os_log_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_DEFAULT, "Got instance data %@", buf, 0xCu);
      }

      objc_msgSend_setObject_forKeyedSubscript_(v57, v33, (uint64_t)v20, (uint64_t)v24);
    }
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v60, (uint64_t)v74, 16);
    if (v21) {
      continue;
    }
    break;
  }
LABEL_47:

  v45 = handleForCategory(0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v45, OS_LOG_TYPE_DEFAULT, "Write data classes from memory cache to EAN", buf, 2u);
  }

  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = sub_21FC11BB4;
  v59[3] = &unk_26452A8F8;
  v59[4] = self;
  v59[5] = &v64;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v57, v46, (uint64_t)v59, v47);
  v49 = v55;
  if (*((unsigned char *)v65 + 24)) {
    goto LABEL_55;
  }
  if (objc_msgSend_verifyFDRDataFromEANUsingCache_cachedData_(self, v48, 1, (uint64_t)v57))
  {
    BOOL v50 = 1;
  }
  else
  {
    v54 = handleForCategory(0);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F278();
    }

    BOOL v50 = 0;
LABEL_59:
    v49 = v55;
  }
LABEL_60:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  _Block_object_dispose(&v64, 8);
  return v50;
}

- (BOOL)_writeDataToEAN:(id)a3 withKey:(id)a4
{
  kern_return_t v44;
  NSObject *v45;
  NSObject *v46;
  BOOL v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned char v67[10];
  __int16 v68;
  unsigned int v69;
  __int16 v70;
  unsigned int v71;
  __int16 v72;
  uint64_t v73;
  uint64_t input;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x263EF8340];
  id v6 = a4;
  connect = 0;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_length(v7, v8, v9, v10);
  uint64_t v12 = -(int)v11 & 0xFFFLL;
  input = 0;
  uint64_t v75 = 0;
  v76 = 0;
  output = 0;
  outputCnt = 1;
  uint64_t v13 = v12 + v11;
  v16 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v14, v12 + v11, v15);
  objc_msgSend_setData_(v16, v17, (uint64_t)v7, v18);

  v19 = malloc_type_malloc(v12, 0x702650DCuLL);
  uint64_t v20 = (uint64_t)v19;
  if (!v19)
  {
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F37C();
    }
    goto LABEL_15;
  }
  bzero(v19, v12);
  objc_msgSend_appendBytes_length_(v16, v21, v20, v12);
  if (objc_msgSend_length(v16, v22, v23, v24) != v13)
  {
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F5AC();
    }
    goto LABEL_15;
  }
  uint64_t v28 = objc_msgSend_length(v16, v25, v26, v27);
  id v29 = v16;
  uint64_t v33 = objc_msgSend_bytes(v29, v30, v31, v32);
  if ((v28 & 0xFFF) != 0)
  {
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F538(v46, v49, v50, v51, v52, v53, v54, v55);
    }
    goto LABEL_15;
  }
  uint64_t v36 = v33;
  unsigned int QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v34, (uint64_t)v6, v35);
  if (!QuerykeyFromDataClass)
  {
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F3B0();
    }
    goto LABEL_15;
  }
  unsigned int v38 = QuerykeyFromDataClass;
  mach_port_t v39 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v40 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v39, v40);
  if (!MatchingService)
  {
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F3E4(v46, v56, v57, v58, v59, v60, v61, v62);
    }
LABEL_15:
    io_object_t v42 = 0;
LABEL_16:
    uint64_t v47 = 0;
    goto LABEL_17;
  }
  io_object_t v42 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F4C4();
    }
    goto LABEL_16;
  }
  input = v38;
  uint64_t v75 = v36;
  v76 = v28;
  v43 = handleForCategory(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)char v67 = HIBYTE(v38);
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = HIWORD(v38);
    id v68 = 1024;
    v69 = v38 >> 8;
    v70 = 1024;
    CFDataRef v71 = v38;
    __int16 v72 = 2048;
    v73 = v28;
    _os_log_impl(&dword_21FBF2000, v43, OS_LOG_TYPE_DEFAULT, "Writing EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  uint32_t v44 = IOConnectCallMethod(connect, 2u, &input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  v45 = handleForCategory(0);
  v46 = v45;
  if (v44)
  {
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F45C();
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)char v67 = v6;
    _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "Successfully written %@ data to EAN", buf, 0xCu);
  }
  uint64_t v47 = 1;
LABEL_17:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v42) {
    IOObjectRelease(v42);
  }
  AMSupportSafeFree();

  return v47;
}

- (id)_getDataClassesToWrite
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!objc_msgSend_isEANSupported(self, v4, v5, v6))
  {
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  io_registry_entry_t v7 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
  if (!v7)
  {
    uint64_t v27 = handleForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F5E0();
    }

    goto LABEL_18;
  }
  io_object_t v8 = v7;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v7, @"syscfg-erly-kbgs-data-class", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F614();
    }

    IOObjectRelease(v8);
    goto LABEL_18;
  }
  CFDataRef v10 = CFProperty;
  CFIndex Length = CFDataGetLength(CFProperty);
  BytePtr = CFDataGetBytePtr(v10);
  uint64_t v13 = (char *)malloc_type_malloc(Length, 0x100004077774924uLL);
  if (v13)
  {
    uint64_t v14 = v13;
    if (Length >= 1)
    {
      CFIndex v15 = Length;
      do
      {
        char v16 = *BytePtr++;
        v13[--v15] = v16;
      }
      while (v15);
    }
    id v17 = [NSString alloc];
    v19 = objc_msgSend_initWithBytes_length_encoding_(v17, v18, (uint64_t)v14, Length, 4);
    if ((objc_msgSend_length(v19, v20, v21, v22) & 3) != 0)
    {
      uint64_t v26 = handleForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 138412290;
        uint64_t v47 = v19;
        _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "earlyKBGSDataClass %@ length is not multiple of 4", (uint8_t *)&v46, 0xCu);
      }
    }
    else
    {
      if (objc_msgSend_length(v19, v23, v24, v25))
      {
        unint64_t v33 = 0;
        do
        {
          v34 = objc_msgSend_substringWithRange_(v19, v31, v33, 4);
          if (objc_msgSend_isDataClassSupported_(CRFDRUtils, v35, (uint64_t)v34, v36)) {
            objc_msgSend_addObject_(v3, v37, (uint64_t)v34, v38);
          }

          v33 += 4;
        }
        while (objc_msgSend_length(v19, v39, v40, v41) > v33);
      }
      if ((objc_msgSend_containsObject_(v3, v31, @"seal", v32) & 1) == 0
        && objc_msgSend_isDataClassSupported_(CRFDRUtils, v42, @"seal", v43))
      {
        objc_msgSend_addObject_(v3, v44, @"seal", v45);
      }
    }
  }
  else
  {
    v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F648();
    }

    uint64_t v14 = 0;
    v19 = 0;
  }
  IOObjectRelease(v8);
  CFRelease(v10);
  if (v14) {
    free(v14);
  }
LABEL_19:

  return v3;
}

- (BOOL)readFDRDataFromEANWithDataClass:(id)a3 outData:(id *)a4 stripPadding:(BOOL)a5
{
  BOOL v5 = a5;
  input[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v12 = v8;
  io_connect_t connect = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (!v8 || (uint64_t v13 = objc_msgSend_length(v8, v9, v10, v11), !a4) || !v13)
  {
    uint64_t v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F67C();
    }
    goto LABEL_12;
  }
  unsigned int QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v14, (uint64_t)v12, v15);
  if (!QuerykeyFromDataClass)
  {
    uint64_t v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F3B0();
    }
    goto LABEL_12;
  }
  unsigned int v17 = QuerykeyFromDataClass;
  uint64_t v18 = QuerykeyFromDataClass;
  input[0] = QuerykeyFromDataClass;
  mach_port_t v19 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v20 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v19, v20);
  if (!MatchingService)
  {
    uint64_t v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F3E4(v25, v50, v51, v52, v53, v54, v55, v56);
    }
LABEL_12:
    io_object_t v22 = 0;
LABEL_13:
    BOOL v26 = 0;
    goto LABEL_14;
  }
  io_object_t v22 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    uint64_t v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F4C4();
    }
    goto LABEL_13;
  }
  if (IOConnectCallScalarMethod(connect, 3u, input, 1u, &output, &outputCnt))
  {
    uint64_t v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F780();
    }
    goto LABEL_13;
  }
  uint64_t v28 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v23, output, v24);
  id v29 = handleForCategory(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)uint64_t v64 = HIBYTE(v17);
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = HIWORD(v17);
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = v17 >> 8;
    HIWORD(v65) = 1024;
    unsigned int v66 = v17;
    __int16 v67 = 2048;
    uint64_t v68 = output;
    _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "Reading EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v62[0] = v18;
  uint64_t v25 = v28;
  v62[1] = objc_msgSend_mutableBytes(v25, v30, v31, v32);
  v62[2] = output;
  if (IOConnectCallScalarMethod(connect, 4u, v62, 3u, 0, 0))
  {
    v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F718();
    }
    goto LABEL_45;
  }
  if (!v5)
  {
    uint64_t v47 = objc_msgSend_copy(v25, v33, v34, v35);
    goto LABEL_32;
  }
  unint64_t v58 = 0;
  char v36 = objc_msgSend_calculateDerLength_actualSize_(self, v33, (uint64_t)v25, (uint64_t)&v58);
  v37 = handleForCategory(0);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = objc_msgSend_length(v25, v38, v39, v40);
    *(_DWORD *)buf = 134218240;
    *(void *)uint64_t v64 = v41;
    *(_WORD *)&v64[8] = 2048;
    uint64_t v65 = v58;
    _os_log_impl(&dword_21FBF2000, v37, OS_LOG_TYPE_DEFAULT, "Image size: %ld DER size: %ld", buf, 0x16u);
  }

  if ((v36 & 1) == 0)
  {
    v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F6E4();
    }
    goto LABEL_45;
  }
  unint64_t v45 = v58;
  if (!v58 || v45 > objc_msgSend_length(v25, v42, v43, v44))
  {
    v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F6B0();
    }
LABEL_45:

    goto LABEL_13;
  }
  uint64_t v47 = objc_msgSend_subdataWithRange_(v25, v46, 0, v58);
LABEL_32:
  id v48 = *a4;
  *a4 = v47;

  v49 = handleForCategory(0);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v64 = v12;
    _os_log_impl(&dword_21FBF2000, v49, OS_LOG_TYPE_DEFAULT, "Successfully read %@ from EAN", buf, 0xCu);
  }

  BOOL v26 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v22) {
    IOObjectRelease(v22);
  }

  return v26;
}

- (unsigned)_getQuerykeyFromDataClass:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6) == 4)
  {
    id v7 = v3;
    unsigned int v11 = bswap32(*(_DWORD *)objc_msgSend_UTF8String(v7, v8, v9, v10));
  }
  else
  {
    handleForCategory(0);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F7E8(v3, v13, v14, v15);
    }

    unsigned int v11 = 0;
  }

  return v11;
}

- (BOOL)deleteFDRDataFromEANWithDataClass:(id)a3
{
  kern_return_t v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t output;
  uint32_t outputCnt;
  io_connect_t connect;
  uint8_t buf[4];
  void *v33;
  uint64_t input[2];

  input[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v8 = v4;
  input[0] = 0;
  uint32_t outputCnt = 1;
  io_connect_t connect = 0;
  uint64_t output = 0;
  if (!v4 || !objc_msgSend_length(v4, v5, v6, v7))
  {
    mach_port_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F67C();
    }
    goto LABEL_12;
  }
  unsigned int QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v9, (uint64_t)v8, v10);
  if (!QuerykeyFromDataClass)
  {
    mach_port_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F3B0();
    }
    goto LABEL_12;
  }
  unsigned int v12 = QuerykeyFromDataClass;
  mach_port_t v13 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v14 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v13, v14);
  if (!MatchingService)
  {
    mach_port_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F3E4(v19, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_12:
    io_object_t v16 = 0;
LABEL_13:
    CFDictionaryRef v20 = 0;
    goto LABEL_14;
  }
  io_object_t v16 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    mach_port_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F4C4();
    }
    goto LABEL_13;
  }
  input[0] = v12;
  unsigned int v17 = IOConnectCallMethod(connect, 5u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  uint64_t v18 = handleForCategory(0);
  mach_port_t v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F870();
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v33 = v8;
    _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "Successfully deleted %@ from EAN", buf, 0xCu);
  }
  CFDictionaryRef v20 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v16) {
    IOObjectRelease(v16);
  }

  return v20;
}

- (BOOL)verifyFDRDataFromEANUsingCache:(BOOL)a3 cachedData:(id)a4
{
  BOOL v4 = a3;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = handleForCategory(0);
  uint64_t v7 = v6;
  if (v5 || !v4)
  {
    BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from cache...", buf, 2u);
      }

      long long v76 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v73 = 0u;
      uint64_t v7 = v5;
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v73, (uint64_t)v82, 16);
      if (!v11)
      {
        BOOL v8 = 1;
        goto LABEL_76;
      }
      uint64_t v12 = v11;
      id v65 = v5;
      uint64_t v13 = *(void *)v74;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v74 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          io_object_t v16 = handleForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v79 = v15;
            _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
          }

          uint64_t v72 = 0;
          unsigned int v17 = v7;
          CFDictionaryRef v20 = objc_msgSend_objectForKey_(v7, v18, v15, v19);
          int FDRDataFromEANWithDataClass_outData_stripPadding = objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v21, v15, (uint64_t)&v72, 1);
          uint64_t v23 = v72;
          uint64_t v24 = handleForCategory(0);
          uint64_t v25 = v24;
          if (FDRDataFromEANWithDataClass_outData_stripPadding) {
            BOOL v26 = v23 == 0;
          }
          else {
            BOOL v26 = 1;
          }
          if (v26)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_21FC5F974();
            }
            uint64_t v7 = v17;
            goto LABEL_72;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v79 = v72;
            __int16 v80 = 2112;
            uint64_t v81 = (uint64_t)v20;
            _os_log_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
          }

          uint64_t v7 = v17;
          if ((objc_msgSend_isEqualToData_(v20, v27, v72, v28) & 1) == 0)
          {
            uint64_t v25 = handleForCategory(0);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_21FC5F90C();
            }
LABEL_72:

            goto LABEL_5;
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v29, (uint64_t)&v73, (uint64_t)v82, 16);
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from FDR local store...", buf, 2u);
      }

      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v31 = (const void *)*MEMORY[0x263EFFB38];
      CFDictionarySetValue(Mutable, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
      CFDictionarySetValue(Mutable, @"StripImg4", v31);
      CFDictionarySetValue(Mutable, @"VerifyData", v31);
      uint64_t v7 = objc_msgSend__getDataClassesToWrite(self, v32, v33, v34);
      uint64_t v35 = handleForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v79 = (uint64_t)v7;
        _os_log_impl(&dword_21FBF2000, v35, OS_LOG_TYPE_DEFAULT, "EAN Data classes to verify: %@", buf, 0xCu);
      }

      if (!v7 || !objc_msgSend_count(v7, v36, v37, v38))
      {
        uint64_t v64 = handleForCategory(0);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          sub_21FC5F9A8();
        }

        goto LABEL_5;
      }
      id v65 = v5;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id obj = v7;
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v68, (uint64_t)v77, 16);
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v69;
        while (2)
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v69 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            unint64_t v45 = (void *)MEMORY[0x223C5C2A0]();
            uint64_t v72 = 0;
            int v46 = handleForCategory(0);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v79 = (uint64_t)v44;
              _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
            }

            if (objc_msgSend_isEqualToString_(v44, v47, @"seal", v48))
            {
              uint64_t LocalMultiDataBlobForClass = AMFDRSealingMapCopyLocalDataForClass();
            }
            else if (AMFDRSealingMapEntryHasAttribute())
            {
              uint64_t v51 = handleForCategory(0);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v79 = (uint64_t)v44;
                _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
              }

              uint64_t LocalMultiDataBlobForClass = AMFDRSealingMapCreateLocalMultiDataBlobForClass();
            }
            else
            {
              uint64_t LocalMultiDataBlobForClass = AMFDRSealingManifestCopyLocalDataForClass();
            }
            uint64_t v52 = LocalMultiDataBlobForClass;
            if (!LocalMultiDataBlobForClass)
            {
              uint64_t v53 = handleForCategory(0);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v79 = 0;
                _os_log_impl(&dword_21FBF2000, v53, OS_LOG_TYPE_DEFAULT, "Failed to get data class from local store, error: %@", buf, 0xCu);
              }
            }
            if ((objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v50, (uint64_t)v44, (uint64_t)&v72, 1) & 1) == 0)
            {
              uint64_t v54 = handleForCategory(0);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21FBF2000, v54, OS_LOG_TYPE_DEFAULT, "Failed to read data class from EAN", buf, 2u);
              }
            }
            unint64_t v55 = v52 | v72;
            uint64_t v56 = handleForCategory(0);
            BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
            if (v55)
            {
              if (v57)
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v79 = v72;
                __int16 v80 = 2112;
                uint64_t v81 = v52;
                _os_log_impl(&dword_21FBF2000, v56, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
              }

              if ((objc_msgSend_isEqualToData_((void *)v52, v58, v72, v59) & 1) == 0)
              {
                long long v61 = handleForCategory(0);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                  sub_21FC5F9DC();
                }

                uint64_t v7 = obj;

                BOOL v8 = 0;
                id v5 = v65;
                goto LABEL_76;
              }
            }
            else
            {
              if (v57)
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v79 = (uint64_t)v44;
                _os_log_impl(&dword_21FBF2000, v56, OS_LOG_TYPE_DEFAULT, "Data class (%@) both missing in EAN and FDR local store. Continue.", buf, 0xCu);
              }
            }
          }
          uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v60, (uint64_t)&v68, (uint64_t)v77, 16);
          if (v41) {
            continue;
          }
          break;
        }
      }
      uint64_t v7 = obj;
    }
    BOOL v8 = 1;
    id v5 = v65;
    goto LABEL_76;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_21FC5F8D8();
  }
LABEL_5:
  BOOL v8 = 0;
LABEL_76:

  AMSupportSafeRelease();
  return v8;
}

- (BOOL)calculateDerLength:(id)a3 actualSize:(unint64_t *)a4
{
  id v5 = a3;
  v20[0] = objc_msgSend_bytes(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_length(v5, v9, v10, v11);

  v20[1] = v12;
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  int v13 = sub_21FC53360((uint64_t)v20, &v16, &v19);
  if (v13)
  {
    *a4 = 0;
    CFDictionaryRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FA44();
    }
  }
  else
  {
    *a4 = v17 - v20[0] + v18;
  }
  return v13 == 0;
}

- (id)_apticketCopyDataObjectPropertyWithTag:(unint64_t)a3 property:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  memset(v43, 0, sizeof(v43));
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  apTicket = self->apTicket;
  if (!apTicket)
  {
    int v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FAAC(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_10;
  }
  uint64_t v8 = objc_msgSend_bytes(apTicket, a2, a3, a4);
  uint64_t v12 = objc_msgSend_length(self->apTicket, v9, v10, v11);
  if (sub_21FC53204(v8, v12, (uint64_t)v43))
  {
    int v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v42 = "-[CREANController _apticketCopyDataObjectPropertyWithTag:property:]";
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "%s: failed to parse AP ticket as Img4 manifest", buf, 0xCu);
    }
LABEL_10:

    v30 = 0;
    goto LABEL_11;
  }
  sub_21FC52FC8((uint64_t)v43, a3, a4, &v40, &v39);
  if (v22)
  {
    int v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FB9C(v13, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_10;
  }
  v30 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v21, v40, v39);
  if (!v30)
  {
    int v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FB24(v13, v32, v33, v34, v35, v36, v37, v38);
    }
    goto LABEL_10;
  }
LABEL_11:
  return v30;
}

- (id)copyCurrentFDREANValuesWithdataDir:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend_URLWithString_(NSURL, a2, (uint64_t)a3, (uint64_t)a4);
  if (!self->apTicket)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FC14();
    }
    goto LABEL_13;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FC48();
    }
LABEL_13:
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = Mutable;
  CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", (const void *)*MEMORY[0x263EFFB40]);
  BOOL v9 = (const void *)*MEMORY[0x263EFFB38];
  CFDictionarySetValue(v8, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
  CFDictionaryAddValue(v8, @"VerifyData", v9);
  if (!v6)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FC7C(v29, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_33;
  }
  CFDictionaryAddValue(v8, @"DataDirectory", v6);
  if (!AMFDRCreateTypeWithOptions())
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FCEC();
    }
LABEL_33:
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  uint64_t v11 = objc_msgSend__apticketCopyDataObjectPropertyWithTag_property_(self, v10, 1718903152, 1145525076);
  if (!v11)
  {
    uint64_t v29 = handleForCategory(0);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = 0;
      goto LABEL_15;
    }
    sub_21FC5FD20();
    uint64_t v12 = 0;
LABEL_20:
    uint64_t v17 = 0;
    goto LABEL_21;
  }
  uint64_t v12 = (void *)v11;
  AMFDRSetOption();
  if ((AMFDRDataCopyTrustObject() & 1) == 0)
  {
    uint64_t v29 = handleForCategory(0);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      uint64_t v17 = 0;
      goto LABEL_21;
    }
    sub_21FC5FDBC();
    goto LABEL_20;
  }
  CFArrayRef v13 = (const __CFArray *)AMFDRSealingMapCopyMultiInstanceForClass();
  CFArrayRef v14 = v13;
  if (!v13 || CFArrayGetCount(v13) < 1)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FD54();
    }
    goto LABEL_20;
  }
  CFArrayGetValueAtIndex(v14, 0);
  uint64_t v15 = AMFDRSealingMapCopyLocalData();
  if (!v15)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FD88();
    }
    goto LABEL_20;
  }
  uint64_t v16 = v15;
  uint64_t v17 = objc_opt_new();
  apTicket = self->apTicket;
  uint64_t v21 = objc_msgSend_numberWithInt_(NSNumber, v19, 1802793057, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v22, (uint64_t)apTicket, (uint64_t)v21);

  uint64_t v25 = objc_msgSend_numberWithInt_(NSNumber, v23, 1953722996, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v26, 0, (uint64_t)v25);

  uint64_t v29 = objc_msgSend_numberWithInt_(NSNumber, v27, 1818322291, v28);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v30, v16, (uint64_t)v29);
LABEL_21:

  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  id v31 = v17;

  return v31;
}

- (unint64_t)sizeEAN:(id)a3
{
  input[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  memset(input, 0, 24);
  uint32_t outputCnt = 1;
  io_connect_t connect = 0;
  uint64_t output = 0;
  if (!v6)
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FDF0();
    }
    goto LABEL_18;
  }
  unsigned int QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v4, (uint64_t)v6, v5);
  if (!QuerykeyFromDataClass)
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FE24();
    }
    goto LABEL_18;
  }
  unsigned int v8 = QuerykeyFromDataClass;
  mach_port_t v9 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v10 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v9, v10);
  if (!MatchingService)
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FE58();
    }
LABEL_18:
    io_object_t v12 = 0;
    goto LABEL_25;
  }
  io_object_t v12 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FF28();
    }
  }
  else if (connect)
  {
    input[0] = v8;
    if (!IOConnectCallMethod(connect, 3u, input, 3u, 0, 0, &output, &outputCnt, 0, 0)) {
      goto LABEL_7;
    }
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FEC0();
    }
  }
  else
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FE8C();
    }
  }
LABEL_25:

LABEL_7:
  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v12) {
    IOObjectRelease(v12);
  }
  uint64_t v13 = output;

  return v13;
}

- (BOOL)copyFDREANValues:(id)a3 outgenerationCount:(unsigned int *)a4 outManifesthash:(id *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v34 = 0;
  if ((objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v9, (uint64_t)v8, (uint64_t)&v34, 0) & 1) == 0)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v36 = v8;
      uint64_t v15 = "Failed to load EAN key: %@";
      goto LABEL_7;
    }
LABEL_17:
    BOOL v25 = 0;
    goto LABEL_18;
  }
  unint64_t v13 = objc_msgSend_length(v34, v10, v11, v12);
  if (v13 <= 0x1F)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v36 = v8;
      uint64_t v15 = "Entry too small to be versioned blob: %@";
LABEL_7:
      _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  unint64_t v16 = v13;
  id v17 = v34;
  uint64_t v21 = (_DWORD *)objc_msgSend_bytes(v17, v18, v19, v20);
  uint64_t v23 = v21;
  if (*v21 != 1769104486)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60114();
    }
    goto LABEL_17;
  }
  if (v21[1] != 1)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60094();
    }
    goto LABEL_17;
  }
  unsigned int v24 = v21[2];
  if (v24 + 1 <= 1)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60060();
    }
    goto LABEL_17;
  }
  unsigned int v27 = v21[3];
  if (v27 <= 0x1F)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FF90();
    }
    goto LABEL_17;
  }
  int v28 = v21[4];
  if (!v28)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FFC4();
    }
    goto LABEL_17;
  }
  if (v16 <= v28 + v27)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC6002C();
    }
    goto LABEL_17;
  }
  uint64_t v29 = v21[5];
  if (!v29)
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FFF8();
    }
    goto LABEL_17;
  }
  uint64_t v30 = 16 * v29;
  if (16 * v29 != v21[7])
  {
    CFArrayRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v32 = v23[5];
      int v33 = v23[7];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)uint64_t v36 = v32;
      *(_WORD *)&v36[4] = 2048;
      *(void *)&v36[6] = 16;
      __int16 v37 = 2048;
      uint64_t v38 = v30;
      __int16 v39 = 1024;
      int v40 = v33;
      _os_log_error_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_ERROR, "FDR info payload is incorrect size.\tExpect: %d * %lu = %zu\tFound: %d", buf, 0x22u);
    }
    goto LABEL_17;
  }
  if (a4) {
    *a4 = v24;
  }
  if (!a5)
  {
    BOOL v25 = 1;
    goto LABEL_19;
  }
  id v31 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v22, (uint64_t)v21 + v21[3], v21[4]);
  CFArrayRef v14 = v31;
  BOOL v25 = v31 != 0;
  if (v31)
  {
    CFArrayRef v14 = v31;
    *a5 = v14;
    BOOL v25 = 1;
  }
LABEL_18:

LABEL_19:
  return v25;
}

- (unsigned)nextEANGenerationCount
{
  unsigned int v10 = 0;
  if (objc_msgSend_copyFDREANValues_outgenerationCount_outManifesthash_(self, a2, @"fdr1", (uint64_t)&v10, 0))unsigned int v4 = v10; {
  else
  }
    unsigned int v4 = 0;
  int v5 = objc_msgSend_copyFDREANValues_outgenerationCount_outManifesthash_(self, v3, @"fdr2", (uint64_t)&v10, 0);
  unsigned int v6 = v10;
  if (!v5) {
    unsigned int v6 = 0;
  }
  if (v4 <= v6) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = v4;
  }
  if (v4 < v6) {
    unsigned int v6 = v4;
  }
  if (v6 == 1) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = 1;
  }
  if (v7 == -2) {
    return v8;
  }
  else {
    return v7 + 1;
  }
}

- (id)copyStagedFDREanDataWithdataDir:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  long long v65 = 0u;
  long long v66 = 0u;
  *(_OWORD *)md = 0u;
  *(_OWORD *)bytes = 0u;
  long long v59 = 0u;
  CFDictionaryRef v5 = (const __CFDictionary *)objc_msgSend_copyCurrentFDREANValuesWithdataDir_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  CFDictionaryRef v6 = v5;
  if (!v5)
  {
    uint64_t v50 = handleForCategory(0);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_21FC60198();
    }
    goto LABEL_49;
  }
  size_t Count = CFDictionaryGetCount(v5);
  if (!Count)
  {
    uint64_t v50 = handleForCategory(0);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_21FC601CC();
    }
LABEL_49:

    Mutable = 0;
    goto LABEL_50;
  }
  int64_t v8 = Count;
  mach_port_t v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  unsigned int v10 = (const void **)malloc_type_calloc(v8, 8uLL, 0x6004044C4A2DFuLL);
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, "aptk");
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v6, v12);
  if (Value)
  {
    CFDataRef v14 = Value;
    BytePtr = CFDataGetBytePtr(Value);
    CC_LONG Length = CFDataGetLength(v14);
    CC_SHA384(BytePtr, Length, md);
    CFAllocatorRef allocator = v11;
    CFDataRef v17 = CFDataCreate(v11, md, 48);
    CFDictionaryGetKeysAndValues(v6, v9, v10);
    uint64_t v56 = (UInt8 *)malloc_type_calloc(v8, 0x10uLL, 0x1000040451B5BE8uLL);
    CFIndex v18 = CFDataGetLength(v17);
    CFIndex v22 = v18;
    uint64_t v23 = v18 & 3;
    if (v18 <= 0) {
      uint64_t v23 = -(-v18 & 3);
    }
    if (v23) {
      uint64_t v24 = v18 - v23 + 4;
    }
    else {
      uint64_t v24 = v18;
    }
    uint64_t v57 = v24;
    *(void *)bytes = 0x169726466;
    EANGenerationsize_t Count = objc_msgSend_nextEANGenerationCount(self, v19, v20, v21);
    *(_DWORD *)&bytes[8] = EANGenerationCount;
    uint64_t v26 = handleForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = EANGenerationCount;
      _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "Will use generation count: %u", buf, 8u);
    }

    *(_DWORD *)&bytes[12] = 32;
    CFDataRef theData = v17;
    LODWORD(v59) = CFDataGetLength(v17);
    DWORD1(v59) = v8;
    DWORD2(v59) = v57 + 32;
    HIDWORD(v59) = 16 * v8;
    uint64_t v54 = v9;
    CFIndex v27 = v57 + 32 + 16 * v8;
    if (v8 >= 1)
    {
      int v28 = v56 + 8;
      uint64_t v29 = (const __CFData **)v10;
      uint64_t v30 = (const __CFNumber **)v9;
      int64_t v31 = v8;
      do
      {
        CFDataRef v32 = *v29++;
        CFIndex v33 = CFDataGetLength(v32);
        int v34 = v33;
        if (v33 <= 0) {
          uint64_t v35 = -(-v33 & 3);
        }
        else {
          uint64_t v35 = v33 & 3;
        }
        if (v35) {
          uint64_t v36 = v33 - v35 + 4;
        }
        else {
          uint64_t v36 = v33;
        }
        CFNumberRef v37 = *v30++;
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v37, kCFNumberSInt32Type, buf);
        *(v28 - 2) = *(_DWORD *)buf;
        *(v28 - 1) = v27;
        *int v28 = v34;
        v28 += 4;
        v27 += v36;
        --v31;
      }
      while (v31);
    }
    Mutable = CFDataCreateMutable(allocator, v27);
    CFDataAppendBytes(Mutable, bytes, 32);
    __int16 v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEFAULT, "Added header.", buf, 2u);
    }

    int v40 = CFDataGetBytePtr(theData);
    CFIndex v41 = CFDataGetLength(theData);
    CFDataAppendBytes(Mutable, v40, v41);
    if (v57 != v22) {
      CFDataIncreaseLength(Mutable, v57 - v22);
    }
    uint64_t v42 = handleForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v42, OS_LOG_TYPE_DEFAULT, "Added hash.", buf, 2u);
    }

    CFDataAppendBytes(Mutable, v56, 16 * v8);
    uint64_t v43 = handleForCategory(0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v43, OS_LOG_TYPE_DEFAULT, "Added payload table.", buf, 2u);
    }

    if (v8 >= 1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v45 = CFDataGetLength((CFDataRef)v10[i]);
        int v46 = CFDataGetBytePtr((CFDataRef)v10[i]);
        CFDataAppendBytes(Mutable, v46, v45);
        uint64_t v47 = v45 & 3;
        if (v45 <= 0) {
          uint64_t v47 = -(-v45 & 3);
        }
        if (v47) {
          CFDataIncreaseLength(Mutable, 4 - v47);
        }
        uint64_t v48 = handleForCategory(0);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v61 = i;
          __int16 v62 = 2048;
          uint64_t v63 = v45;
          _os_log_impl(&dword_21FBF2000, v48, OS_LOG_TYPE_DEFAULT, "Added element %ld. Size: %ld", buf, 0x16u);
        }
      }
    }
    v49 = handleForCategory(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v49, OS_LOG_TYPE_DEFAULT, "Success.", buf, 2u);
    }

    mach_port_t v9 = v54;
    if (v56) {
      free(v56);
    }
    if (!v54) {
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v52 = handleForCategory(0);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_21FC60200();
    }

    Mutable = 0;
    if (!v9) {
      goto LABEL_43;
    }
  }
  free(v9);
LABEL_43:
  if (v10) {
    free(v10);
  }
LABEL_50:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return Mutable;
}

- (BOOL)writeEAN:(id)a3 isImg4:(BOOL)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  mach_port_t v9 = v5;
  io_connect_t connect = 0;
  if (!v5)
  {
    CFDataRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60234();
    }
    goto LABEL_32;
  }
  if (!objc_msgSend_count(v5, v6, v7, v8))
  {
    BOOL v28 = 1;
    goto LABEL_27;
  }
  mach_port_t v10 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v11 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v10, v11);
  if (!MatchingService)
  {
    CFDataRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60268();
    }
LABEL_32:
    io_object_t v13 = 0;
    goto LABEL_37;
  }
  io_object_t v13 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    CFDataRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC602D0();
    }
  }
  else
  {
    if (connect)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      CFDataRef v14 = v9;
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v39, 16);
      if (v16)
      {
        uint64_t v19 = v16;
        io_object_t v30 = v13;
        int64_t v31 = v9;
        uint64_t v20 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v14);
            }
            uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v14, v17, v22, v18);
            char v25 = objc_msgSend__writeDataToEAN_withKey_(self, v24, (uint64_t)v23, v22);

            uint64_t v26 = handleForCategory(0);
            CFIndex v27 = v26;
            if ((v25 & 1) == 0)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                sub_21FC5F314();
              }

              BOOL v28 = 0;
              goto LABEL_20;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v38 = v22;
              _os_log_impl(&dword_21FBF2000, v27, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
            }
          }
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v32, (uint64_t)v39, 16);
          if (v19) {
            continue;
          }
          break;
        }
        BOOL v28 = 1;
LABEL_20:
        mach_port_t v9 = v31;
        io_object_t v13 = v30;
      }
      else
      {
        BOOL v28 = 1;
      }
      goto LABEL_23;
    }
    CFDataRef v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC6029C();
    }
  }
LABEL_37:
  BOOL v28 = 0;
LABEL_23:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v13) {
    IOObjectRelease(v13);
  }
LABEL_27:

  return v28;
}

- (BOOL)stageVersionedFDREANWithdataDir:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_sizeEAN_(self, v6, @"fdr1", v7);
  uint64_t v11 = v8 | objc_msgSend_sizeEAN_(self, v9, @"fdr2", v10);
  CFNumberRef v12 = handleForCategory(0);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "Preparing to write staged FDR EAN key.", buf, 2u);
    }

    id v30 = 0;
    CFNumberRef v12 = objc_msgSend_copyStagedFDREanDataWithdataDir_error_(self, v14, (uint64_t)v5, (uint64_t)&v30);
    id v16 = v30;
    if (v16 || !v12)
    {
      uint64_t v21 = handleForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_21FC60338();
      }
    }
    else
    {
      char v17 = objc_msgSend__writeDataToEAN_withKey_(self, v15, (uint64_t)v12, @"fdr2");
      uint64_t v18 = handleForCategory(0);
      uint64_t v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v32 = @"fdr2";
          _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
        }

        goto LABEL_12;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_21FC603BC(v19, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    BOOL v20 = 0;
    goto LABEL_20;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
  }
LABEL_12:
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (BOOL)swapEAN:(id)a3 withKey:(id)a4
{
  kern_return_t v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  uint64_t input;
  uint64_t v47;
  uint64_t v48;

  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  io_connect_t connect = 0;
  input = 0;
  uint64_t v47 = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (!v6)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC60434();
    }
    goto LABEL_29;
  }
  if (!v7)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC60468();
    }
    goto LABEL_29;
  }
  unsigned int QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v8, (uint64_t)v6, v9);
  if (!QuerykeyFromDataClass)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC6049C();
    }
    goto LABEL_29;
  }
  unsigned int v14 = QuerykeyFromDataClass;
  unsigned int v15 = objc_msgSend__getQuerykeyFromDataClass_(self, v12, (uint64_t)v10, v13);
  if (!v15)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC604D0();
    }
    goto LABEL_29;
  }
  unsigned int v16 = v15;
  mach_port_t v17 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v18 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v17, v18);
  if (!MatchingService)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC60268();
    }
LABEL_29:
    io_object_t v20 = 0;
LABEL_30:
    uint64_t v25 = 0;
    goto LABEL_14;
  }
  io_object_t v20 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC5FF28();
    }
    goto LABEL_30;
  }
  if (!connect)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC60504();
    }
    goto LABEL_30;
  }
  input = v14;
  uint64_t v47 = v16;
  uint64_t v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    int64_t v31 = HIBYTE(v14);
    long long v32 = 1024;
    uint64_t v33 = HIWORD(v14);
    long long v34 = 1024;
    long long v35 = v14 >> 8;
    uint64_t v36 = 1024;
    CFNumberRef v37 = v14;
    uint64_t v38 = 1024;
    __int16 v39 = HIBYTE(v16);
    uint64_t v40 = 1024;
    CFIndex v41 = HIWORD(v16);
    uint64_t v42 = 1024;
    uint64_t v43 = v16 >> 8;
    uint64_t v44 = 1024;
    uint64_t v45 = v16;
    _os_log_impl(&dword_21FBF2000, v21, OS_LOG_TYPE_DEFAULT, "Swapping EAN key %c%c%c%c and %c%c%c%c", buf, 0x32u);
  }

  uint64_t v22 = IOConnectCallMethod(connect, 6u, &input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  uint64_t v23 = handleForCategory(0);
  uint64_t v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_21FC60538();
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, "EAN key Swap success", buf, 2u);
  }
  uint64_t v25 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v20) {
    IOObjectRelease(v20);
  }

  return v25;
}

- (BOOL)swapVersionedFDR
{
  uint64_t v4 = objc_msgSend_sizeEAN_(self, a2, @"fdr1", v2);
  uint64_t v7 = objc_msgSend_sizeEAN_(self, v5, @"fdr2", v6);
  if (!(v4 | v7))
  {
    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      uint64_t v10 = "Versioned FDR is empty. NO OP";
      uint64_t v11 = (uint8_t *)&v17;
LABEL_9:
      _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!v4 || !v7)
  {
    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC605A0();
    }
    goto LABEL_15;
  }
  char v12 = objc_msgSend_swapEAN_withKey_(self, v8, @"fdr1", @"fdr2");
  uint64_t v13 = handleForCategory(0);
  uint64_t v9 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC605D4();
    }
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = 0;
    uint64_t v10 = "FDR1 is now active.";
    uint64_t v11 = (uint8_t *)&v16;
    goto LABEL_9;
  }
LABEL_10:
  BOOL v14 = 1;
LABEL_16:

  return v14;
}

- (id)_ticketCopyHashDataWithNode:(unsigned int)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC60608();
    }

    uint64_t v9 = 0;
    goto LABEL_23;
  }
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a3, @"crypto-hash-method", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFDataRef v5 = CFProperty;
  if (CFProperty)
  {
    if (*(_DWORD *)CFDataGetBytePtr(CFProperty) != 828467315)
    {
      uint64_t v6 = *(void *)CFDataGetBytePtr(v5);
      uint64_t v7 = handleForCategory(0);
      uint64_t v8 = v7;
      if (v6 != 0x3438332D32616873)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_21FC60670();
        }

        uint64_t v9 = 0;
LABEL_22:
        CFRelease(v5);
        goto LABEL_23;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_21FBF2000, v8, OS_LOG_TYPE_DEFAULT, "crypto-hash-method found. Using SHA2-384\n", v33, 2u);
      }

      uint64_t v27 = (const void *)objc_msgSend_bytes(self->apTicket, v24, v25, v26);
      CC_LONG v31 = objc_msgSend_length(self->apTicket, v28, v29, v30);
      CC_SHA384(v27, v31, v33);
      objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v32, (uint64_t)v33, 48);
      goto LABEL_17;
    }
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v33 = 0;
      char v12 = "crypto-hash-method found. Using SHA1\n";
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v33 = 0;
      char v12 = "crypto-hash-method not found, defaulting to SHA1\n";
LABEL_15:
      _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, v12, v33, 2u);
    }
  }

  __int16 v16 = (const void *)objc_msgSend_bytes(self->apTicket, v13, v14, v15);
  CC_LONG v20 = objc_msgSend_length(self->apTicket, v17, v18, v19);
  CC_SHA1(v16, v20, v33);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v21, (uint64_t)v33, 20);
  uint64_t v9 = LABEL_17:;
  if (!v9)
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC6063C();
    }
  }
  if (v5) {
    goto LABEL_22;
  }
LABEL_23:
  return v9;
}

- (id)apticketCopyHashData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    char v12 = "-[CREANController apticketCopyHashData]";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "entering %s\n", (uint8_t *)&v11, 0xCu);
  }

  if (self->apTicket)
  {
    uint64_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
    if (v4)
    {
      io_object_t v7 = v4;
      uint64_t v8 = objc_msgSend__ticketCopyHashDataWithNode_(self, v5, v4, v6);
      IOObjectRelease(v7);
      goto LABEL_11;
    }
    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC60608();
    }
  }
  else
  {
    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC606D8();
    }
  }

  uint64_t v8 = 0;
LABEL_11:
  return v8;
}

- (BOOL)setupVersionedFDRWithApTicket:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_sizeEAN_(self, v6, @"fdr1", v7);
  uint64_t v11 = objc_msgSend_sizeEAN_(self, v9, @"fdr2", v10);
  bzero(v46, 0x1000uLL);
  if (!(v8 | v11))
  {
    char v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
    }
    id v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC607DC();
    }
    goto LABEL_40;
  }
  objc_storeStrong((id *)&self->apTicket, a3);
  __int16 v17 = handleForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "Ensuring FDR1 is valid and active.", buf, 2u);
  }

  if (!self->apTicket)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC6070C();
    }
    goto LABEL_40;
  }
  uint64_t v21 = objc_msgSend_apticketCopyHashData(self, v18, v19, v20);
  if (!v21)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC60740();
    }
    goto LABEL_40;
  }
  uint64_t v14 = v21;
  id v41 = 0;
  int v23 = objc_msgSend_copyFDREANValues_outgenerationCount_outManifesthash_(self, v22, @"fdr1", 0, &v41);
  id v13 = v41;
  if (v23)
  {
    uint64_t v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = objc_msgSend_convertToHexString(v13, v25, v26, v27);
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v28;
      _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, "FDR1 has hash: %@", buf, 0xCu);
    }
    int isEqualToData = objc_msgSend_isEqualToData_(v14, v29, (uint64_t)v13, v30);
    char v12 = handleForCategory(0);
    BOOL v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (isEqualToData)
    {
      if (v32)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "FDR1 appears to be active.", buf, 2u);
      }
      goto LABEL_5;
    }
    if (v32)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v14;
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "FDR1 boot hash mismatch:%@::%@", buf, 0x16u);
    }
  }
  uint64_t v33 = handleForCategory(0);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "FDR1 is not written / valid.", buf, 2u);
  }

  if (v8 || !v11) {
    goto LABEL_6;
  }
  char v12 = objc_msgSend_dataWithBytesNoCopy_length_(MEMORY[0x263EFF8F8], v34, (uint64_t)v46, 4096);
  if ((objc_msgSend__writeDataToEAN_withKey_(self, v35, (uint64_t)v12, @"fdr1") & 1) == 0)
  {
    __int16 v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_21FC607A8();
    }
    goto LABEL_39;
  }
  if ((objc_msgSend_swapVersionedFDR(self, v36, v37, v38) & 1) == 0)
  {
    __int16 v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_21FC60774();
    }
LABEL_39:

LABEL_40:
    BOOL v16 = 0;
    goto LABEL_41;
  }
LABEL_5:

LABEL_6:
  uint64_t v15 = handleForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v15, OS_LOG_TYPE_DEFAULT, "setupVersionedFDRWithApTicket success", buf, 2u);
  }

  BOOL v16 = 1;
LABEL_41:

  return v16;
}

- (void).cxx_destruct
{
}

@end