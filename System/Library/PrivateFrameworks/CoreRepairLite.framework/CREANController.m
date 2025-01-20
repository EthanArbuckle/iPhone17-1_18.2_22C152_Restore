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
    v6 = sub_23993FC14(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_23993FFF0();
    }

    return 0;
  }
  return v5;
}

- (BOOL)writeFDRDataToEANWithdataDir:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  CFStringRef v4 = (const __CFString *)a3;
  id v51 = 0;
  v52 = 0;
  v40 = objc_opt_new();
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v39 = (__CFString *)v4;
  CFURLRef v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFURLPOSIXPathStyle, 1u);
  Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v8 = (const void *)*MEMORY[0x263EFFB38];
  CFDictionarySetValue(Mutable, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
  CFDictionarySetValue(Mutable, @"StripImg4", v8);
  CFDictionarySetValue(Mutable, @"VerifyData", v8);
  CFDictionarySetValue(Mutable, @"DataDirectory", v6);
  v9 = [(CREANController *)self _getDataClassesToWrite];
  v10 = v9;
  if (!v9 || ![v9 count])
  {
    v32 = v10;
    v34 = sub_23993FC14(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_239940024();
    }

    v12 = 0;
LABEL_55:
    BOOL v33 = 0;
    goto LABEL_60;
  }
  v38 = v10;
  v11 = sub_23993FC14(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFDataRef v54 = (const __CFData *)v10;
    _os_log_impl(&dword_239937000, v11, OS_LOG_TYPE_DEFAULT, "Writing Following FDR Data Classes to EAN: %@", buf, 0xCu);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  v12 = 0;
  CFDataRef v13 = 0;
  uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (!v14) {
    goto LABEL_47;
  }
  uint64_t v15 = *(void *)v44;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v44 != v15) {
        objc_enumerationMutation(obj);
      }
      CFDataRef v17 = *(const __CFData **)(*((void *)&v43 + 1) + 8 * i);
      if (v13) {
        CFRelease(v13);
      }
      v18 = sub_23993FC14(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFDataRef v54 = v17;
        _os_log_impl(&dword_239937000, v18, OS_LOG_TYPE_DEFAULT, "Copying data class: %@ to memory cache", buf, 0xCu);
      }

      if ([(__CFData *)v17 isEqualToString:@"seal"])
      {
        CFDataRef LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
      }
      else if (AMFDRSealingMapEntryHasAttribute())
      {
        v20 = sub_23993FC14(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFDataRef v54 = v17;
          _os_log_impl(&dword_239937000, v20, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
        }

        CFDataRef LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCreateLocalMultiDataBlobForClass();
      }
      else
      {
        CFDataRef LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingManifestCopyLocalDataForClass();
      }
      CFDataRef v13 = LocalMultiDataBlobForClass;
      if (!LocalMultiDataBlobForClass || !CFDataGetLength(LocalMultiDataBlobForClass))
      {
        v22 = v52;
LABEL_29:
        if (v22)
        {

          v52 = 0;
        }
        else
        {
          v22 = v12;
        }
        v24 = sub_23993FC14(0);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFDataRef v54 = v17;
          __int16 v55 = 2112;
          v56 = v22;
          _os_log_impl(&dword_239937000, v24, OS_LOG_TYPE_DEFAULT, "Failed to read FDR data instance for: %@ with error %@", buf, 0x16u);
        }

        BOOL v25 = [(CREANController *)self readFDRDataFromEANWithDataClass:v17 outData:&v51 stripPadding:0];
        if (v51) {
          BOOL v26 = v25;
        }
        else {
          BOOL v26 = 0;
        }
        if (v26)
        {
          if (![(CREANController *)self deleteFDRDataFromEANWithDataClass:v17])
          {
            v35 = sub_23993FC14(0);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              sub_23994008C();
            }

            BOOL v33 = 0;
            v12 = v22;
            goto LABEL_59;
          }
          v27 = sub_23993FC14(0);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_44;
          }
          *(_DWORD *)buf = 138412290;
          CFDataRef v54 = v17;
          v28 = v27;
          v29 = "Successfully deleted %@ from EAN";
          uint32_t v30 = 12;
        }
        else
        {
          v27 = sub_23993FC14(0);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
LABEL_44:

            v12 = v22;
            continue;
          }
          *(_WORD *)buf = 0;
          v28 = v27;
          v29 = "Data class already absent from EAN";
          uint32_t v30 = 2;
        }
        _os_log_impl(&dword_239937000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
        goto LABEL_44;
      }
      CFIndex Length = CFDataGetLength(v13);
      v22 = v52;
      if (Length > 10000000 || v52) {
        goto LABEL_29;
      }
      v23 = sub_23993FC14(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFDataRef v54 = v13;
        _os_log_impl(&dword_239937000, v23, OS_LOG_TYPE_DEFAULT, "Got instance data %@", buf, 0xCu);
      }

      [v40 setObject:v13 forKeyedSubscript:v17];
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_47:

  v31 = sub_23993FC14(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239937000, v31, OS_LOG_TYPE_DEFAULT, "Write data classes from memory cache to EAN", buf, 2u);
  }

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = sub_239938810;
  v42[3] = &unk_264DB36F8;
  v42[4] = self;
  v42[5] = &v47;
  [v40 enumerateKeysAndObjectsUsingBlock:v42];
  v32 = v38;
  if (*((unsigned char *)v48 + 24)) {
    goto LABEL_55;
  }
  if ([(CREANController *)self verifyFDRDataFromEANUsingCache:1 cachedData:v40])
  {
    BOOL v33 = 1;
  }
  else
  {
    v37 = sub_23993FC14(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_239940058();
    }

    BOOL v33 = 0;
LABEL_59:
    v32 = v38;
  }
LABEL_60:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  _Block_object_dispose(&v47, 8);
  return v33;
}

- (BOOL)_writeDataToEAN:(id)a3 withKey:(id)a4
{
  kern_return_t v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned char v47[10];
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t input;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x263EF8340];
  id v6 = a4;
  connect = 0;
  id v7 = a3;
  uint64_t v8 = [v7 length];
  size_t v9 = -(int)v8 & 0xFFFLL;
  input = 0;
  __int16 v55 = 0;
  v56 = 0;
  output = 0;
  outputCnt = 1;
  size_t v10 = v9 + v8;
  v11 = [MEMORY[0x263EFF990] dataWithLength:v9 + v8];
  [v11 setData:v7];

  v12 = malloc_type_malloc(v9, 0x702650DCuLL);
  CFDataRef v13 = v12;
  if (!v12)
  {
    BOOL v26 = sub_23993FC14(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_23994015C();
    }
    goto LABEL_15;
  }
  bzero(v12, v9);
  [v11 appendBytes:v13 length:v9];
  if ([v11 length] != v10)
  {
    BOOL v26 = sub_23993FC14(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_23994038C();
    }
    goto LABEL_15;
  }
  uint64_t v14 = [v11 length];
  uint64_t v15 = [v11 bytes];
  if ((v14 & 0xFFF) != 0)
  {
    BOOL v26 = sub_23993FC14(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_239940318(v26, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_15;
  }
  uint64_t v16 = v15;
  unsigned int v17 = [(CREANController *)self _getQuerykeyFromDataClass:v6];
  if (!v17)
  {
    BOOL v26 = sub_23993FC14(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_239940190();
    }
    goto LABEL_15;
  }
  unsigned int v18 = v17;
  mach_port_t v19 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v20 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v19, v20);
  if (!MatchingService)
  {
    BOOL v26 = sub_23993FC14(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_2399401C4(v26, v36, v37, v38, v39, v40, v41, v42);
    }
LABEL_15:
    io_object_t v22 = 0;
LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  io_object_t v22 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    BOOL v26 = sub_23993FC14(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_2399402A4();
    }
    goto LABEL_16;
  }
  input = v18;
  __int16 v55 = v16;
  v56 = v14;
  v23 = sub_23993FC14(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)uint64_t v47 = HIBYTE(v18);
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = HIWORD(v18);
    v48 = 1024;
    uint64_t v49 = v18 >> 8;
    char v50 = 1024;
    id v51 = v18;
    v52 = 2048;
    v53 = v14;
    _os_log_impl(&dword_239937000, v23, OS_LOG_TYPE_DEFAULT, "Writing EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v24 = IOConnectCallMethod(connect, 2u, &input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  BOOL v25 = sub_23993FC14(0);
  BOOL v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_23994023C();
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v47 = v6;
    _os_log_impl(&dword_239937000, v26, OS_LOG_TYPE_DEFAULT, "Successfully written %@ data to EAN", buf, 0xCu);
  }
  v27 = 1;
LABEL_17:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v22) {
    IOObjectRelease(v22);
  }
  AMSupportSafeFree();

  return v27;
}

- (id)_getDataClassesToWrite
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (![(CREANController *)self isEANSupported])
  {
LABEL_18:
    uint64_t v14 = 0;
    goto LABEL_19;
  }
  io_registry_entry_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
  if (!v4)
  {
    uint64_t v16 = sub_23993FC14(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2399403C0();
    }

    goto LABEL_18;
  }
  io_object_t v5 = v4;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v4, @"syscfg-erly-kbgs-data-class", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    unsigned int v17 = sub_23993FC14(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2399403F4();
    }

    IOObjectRelease(v5);
    goto LABEL_18;
  }
  CFDataRef v7 = CFProperty;
  int64_t Length = CFDataGetLength(CFProperty);
  BytePtr = CFDataGetBytePtr(v7);
  size_t v10 = (char *)malloc_type_malloc(Length, 0x100004077774924uLL);
  if (v10)
  {
    v11 = v10;
    if (Length >= 1)
    {
      int64_t v12 = Length;
      do
      {
        char v13 = *BytePtr++;
        v10[--v12] = v13;
      }
      while (v12);
    }
    uint64_t v14 = (void *)[[NSString alloc] initWithBytes:v10 length:Length encoding:4];
    if (([v14 length] & 3) != 0)
    {
      uint64_t v15 = sub_23993FC14(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        v23 = v14;
        _os_log_impl(&dword_239937000, v15, OS_LOG_TYPE_DEFAULT, "earlyKBGSDataClass %@ length is not multiple of 4", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      if ([v14 length])
      {
        unint64_t v20 = 0;
        do
        {
          v21 = objc_msgSend(v14, "substringWithRange:", v20, 4);
          if (+[CRFDRUtils isDataClassSupported:v21]) {
            [v3 addObject:v21];
          }

          v20 += 4;
        }
        while ([v14 length] > v20);
      }
      if (([v3 containsObject:@"seal"] & 1) == 0
        && +[CRFDRUtils isDataClassSupported:@"seal"])
      {
        [v3 addObject:@"seal"];
      }
    }
  }
  else
  {
    mach_port_t v19 = sub_23993FC14(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_239940428();
    }

    v11 = 0;
    uint64_t v14 = 0;
  }
  IOObjectRelease(v5);
  CFRelease(v7);
  if (v11) {
    free(v11);
  }
LABEL_19:

  return v3;
}

- (BOOL)readFDRDataFromEANWithDataClass:(id)a3 outData:(id *)a4 stripPadding:(BOOL)a5
{
  BOOL v5 = a5;
  input[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  size_t v9 = v8;
  io_connect_t connect = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (!v8 || (uint64_t v10 = [v8 length], !a4) || !v10)
  {
    unsigned int v18 = sub_23993FC14(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_23994045C();
    }
    goto LABEL_12;
  }
  unsigned int v11 = [(CREANController *)self _getQuerykeyFromDataClass:v9];
  if (!v11)
  {
    unsigned int v18 = sub_23993FC14(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_239940190();
    }
    goto LABEL_12;
  }
  unsigned int v12 = v11;
  uint64_t v13 = v11;
  input[0] = v11;
  mach_port_t v14 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v15 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v14, v15);
  if (!MatchingService)
  {
    unsigned int v18 = sub_23993FC14(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_2399401C4(v18, v30, v31, v32, v33, v34, v35, v36);
    }
LABEL_12:
    io_object_t v17 = 0;
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  io_object_t v17 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    unsigned int v18 = sub_23993FC14(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_2399402A4();
    }
    goto LABEL_13;
  }
  if (IOConnectCallScalarMethod(connect, 3u, input, 1u, &output, &outputCnt))
  {
    unsigned int v18 = sub_23993FC14(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_239940560();
    }
    goto LABEL_13;
  }
  v21 = [MEMORY[0x263EFF990] dataWithLength:output];
  int v22 = sub_23993FC14(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)long long v44 = HIBYTE(v12);
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = HIWORD(v12);
    LOWORD(v45) = 1024;
    *(_DWORD *)((char *)&v45 + 2) = v12 >> 8;
    HIWORD(v45) = 1024;
    unsigned int v46 = v12;
    __int16 v47 = 2048;
    uint64_t v48 = output;
    _os_log_impl(&dword_239937000, v22, OS_LOG_TYPE_DEFAULT, "Reading EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v42[0] = v13;
  unsigned int v18 = v21;
  v42[1] = [v18 mutableBytes];
  v42[2] = output;
  if (IOConnectCallScalarMethod(connect, 4u, v42, 3u, 0, 0))
  {
    v37 = sub_23993FC14(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_2399404F8();
    }
    goto LABEL_45;
  }
  if (!v5)
  {
    id v27 = [v18 copy];
    goto LABEL_32;
  }
  unint64_t v38 = 0;
  BOOL v23 = [(CREANController *)self calculateDerLength:v18 actualSize:&v38];
  uint64_t v24 = sub_23993FC14(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v18 length];
    *(_DWORD *)buf = 134218240;
    *(void *)long long v44 = v25;
    *(_WORD *)&v44[8] = 2048;
    unint64_t v45 = v38;
    _os_log_impl(&dword_239937000, v24, OS_LOG_TYPE_DEFAULT, "Image size: %ld DER size: %ld", buf, 0x16u);
  }

  if (!v23)
  {
    v37 = sub_23993FC14(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_2399404C4();
    }
    goto LABEL_45;
  }
  unint64_t v26 = v38;
  if (!v38 || v26 > [v18 length])
  {
    v37 = sub_23993FC14(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_239940490();
    }
LABEL_45:

    goto LABEL_13;
  }
  -[NSObject subdataWithRange:](v18, "subdataWithRange:", 0, v38);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
  id v28 = *a4;
  *a4 = v27;

  v29 = sub_23993FC14(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)long long v44 = v9;
    _os_log_impl(&dword_239937000, v29, OS_LOG_TYPE_DEFAULT, "Successfully read %@ from EAN", buf, 0xCu);
  }

  BOOL v19 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v17) {
    IOObjectRelease(v17);
  }

  return v19;
}

- (unsigned)_getQuerykeyFromDataClass:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 4)
  {
    unsigned int v4 = bswap32(*(_DWORD *)[v3 UTF8String]);
  }
  else
  {
    id v6 = sub_23993FC14(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2399405C8(v3, v6);
    }

    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)deleteFDRDataFromEANWithDataClass:(id)a3
{
  kern_return_t v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t output;
  uint32_t outputCnt;
  io_connect_t connect;
  uint8_t buf[4];
  void *v28;
  uint64_t input[2];

  input[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  input[0] = 0;
  uint32_t outputCnt = 1;
  io_connect_t connect = 0;
  uint64_t output = 0;
  if (!v4 || ![v4 length])
  {
    mach_port_t v14 = sub_23993FC14(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_23994045C();
    }
    goto LABEL_12;
  }
  unsigned int v6 = [(CREANController *)self _getQuerykeyFromDataClass:v5];
  if (!v6)
  {
    mach_port_t v14 = sub_23993FC14(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_239940190();
    }
    goto LABEL_12;
  }
  unsigned int v7 = v6;
  mach_port_t v8 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v9 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v8, v9);
  if (!MatchingService)
  {
    mach_port_t v14 = sub_23993FC14(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2399401C4(v14, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_12:
    io_object_t v11 = 0;
LABEL_13:
    CFDictionaryRef v15 = 0;
    goto LABEL_14;
  }
  io_object_t v11 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    mach_port_t v14 = sub_23993FC14(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2399402A4();
    }
    goto LABEL_13;
  }
  input[0] = v7;
  unsigned int v12 = IOConnectCallMethod(connect, 5u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  uint64_t v13 = sub_23993FC14(0);
  mach_port_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940650();
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl(&dword_239937000, v14, OS_LOG_TYPE_DEFAULT, "Successfully deleted %@ from EAN", buf, 0xCu);
  }
  CFDictionaryRef v15 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v11) {
    IOObjectRelease(v11);
  }

  return v15;
}

- (BOOL)verifyFDRDataFromEANUsingCache:(BOOL)a3 cachedData:(id)a4
{
  BOOL v4 = a3;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unsigned int v6 = sub_23993FC14(0);
  unsigned int v7 = v6;
  if (v5 || !v4)
  {
    BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239937000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from cache...", buf, 2u);
      }

      long long v56 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v53 = 0u;
      unsigned int v7 = v5;
      uint64_t v10 = [v7 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (!v10)
      {
        BOOL v8 = 1;
        goto LABEL_76;
      }
      uint64_t v11 = v10;
      id v45 = v5;
      uint64_t v12 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(v7);
          }
          unint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          CFDictionaryRef v15 = sub_23993FC14(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v59 = v14;
            _os_log_impl(&dword_239937000, v15, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
          }

          unint64_t v52 = 0;
          uint64_t v16 = v7;
          io_object_t v17 = [v7 objectForKey:v14];
          BOOL v18 = [(CREANController *)self readFDRDataFromEANWithDataClass:v14 outData:&v52 stripPadding:1];
          unint64_t v19 = v52;
          unint64_t v20 = sub_23993FC14(0);
          v21 = v20;
          if (!v18 || v19 == 0)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_239940754();
            }
            unsigned int v7 = v16;
            goto LABEL_72;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v59 = v52;
            __int16 v60 = 2112;
            uint64_t v61 = (uint64_t)v17;
            _os_log_impl(&dword_239937000, v21, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
          }

          unsigned int v7 = v16;
          if (([v17 isEqualToData:v52] & 1) == 0)
          {
            v21 = sub_23993FC14(0);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_2399406EC();
            }
LABEL_72:

            goto LABEL_5;
          }
        }
        uint64_t v11 = [v16 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v11) {
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
        _os_log_impl(&dword_239937000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from FDR local store...", buf, 2u);
      }

      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v24 = (const void *)*MEMORY[0x263EFFB38];
      CFDictionarySetValue(Mutable, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
      CFDictionarySetValue(Mutable, @"StripImg4", v24);
      CFDictionarySetValue(Mutable, @"VerifyData", v24);
      unsigned int v7 = [(CREANController *)self _getDataClassesToWrite];
      uint64_t v25 = sub_23993FC14(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v59 = (unint64_t)v7;
        _os_log_impl(&dword_239937000, v25, OS_LOG_TYPE_DEFAULT, "EAN Data classes to verify: %@", buf, 0xCu);
      }

      if (!v7 || ![v7 count])
      {
        long long v44 = sub_23993FC14(0);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_239940788();
        }

        goto LABEL_5;
      }
      id v45 = v5;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = v7;
      uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v49;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v49 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            uint64_t v31 = (void *)MEMORY[0x23ECA8480]();
            unint64_t v52 = 0;
            uint64_t v32 = sub_23993FC14(0);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v59 = (unint64_t)v30;
              _os_log_impl(&dword_239937000, v32, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
            }

            if ([v30 isEqualToString:@"seal"])
            {
              uint64_t LocalMultiDataBlobForClass = AMFDRSealingMapCopyLocalDataForClass();
            }
            else if (AMFDRSealingMapEntryHasAttribute())
            {
              uint64_t v34 = sub_23993FC14(0);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v59 = (unint64_t)v30;
                _os_log_impl(&dword_239937000, v34, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
              }

              uint64_t LocalMultiDataBlobForClass = AMFDRSealingMapCreateLocalMultiDataBlobForClass();
            }
            else
            {
              uint64_t LocalMultiDataBlobForClass = AMFDRSealingManifestCopyLocalDataForClass();
            }
            uint64_t v35 = LocalMultiDataBlobForClass;
            if (!LocalMultiDataBlobForClass)
            {
              uint64_t v36 = sub_23993FC14(0);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v59 = 0;
                _os_log_impl(&dword_239937000, v36, OS_LOG_TYPE_DEFAULT, "Failed to get data class from local store, error: %@", buf, 0xCu);
              }
            }
            if (![(CREANController *)self readFDRDataFromEANWithDataClass:v30 outData:&v52 stripPadding:1])
            {
              v37 = sub_23993FC14(0);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_239937000, v37, OS_LOG_TYPE_DEFAULT, "Failed to read data class from EAN", buf, 2u);
              }
            }
            unint64_t v38 = v35 | v52;
            v39 = sub_23993FC14(0);
            BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
            if (v38)
            {
              if (v40)
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v59 = v52;
                __int16 v60 = 2112;
                uint64_t v61 = v35;
                _os_log_impl(&dword_239937000, v39, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
              }

              if (([(id)v35 isEqualToData:v52] & 1) == 0)
              {
                v41 = sub_23993FC14(0);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  sub_2399407BC();
                }

                unsigned int v7 = obj;

                BOOL v8 = 0;
                id v5 = v45;
                goto LABEL_76;
              }
            }
            else
            {
              if (v40)
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v59 = (unint64_t)v30;
                _os_log_impl(&dword_239937000, v39, OS_LOG_TYPE_DEFAULT, "Data class (%@) both missing in EAN and FDR local store. Continue.", buf, 0xCu);
              }
            }
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
      unsigned int v7 = obj;
    }
    BOOL v8 = 1;
    id v5 = v45;
    goto LABEL_76;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_2399406B8();
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
  v14[0] = [v5 bytes];
  uint64_t v6 = [v5 length];

  v14[1] = v6;
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  int v7 = sub_23993FD14((uint64_t)v14, &v10, &v13);
  if (v7)
  {
    *a4 = 0;
    BOOL v8 = sub_23993FC14(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_239940824();
    }
  }
  else
  {
    *a4 = v11 - v14[0] + v12;
  }
  return v7 == 0;
}

- (id)_apticketCopyDataObjectPropertyWithTag:(unint64_t)a3 property:(unint64_t)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v60 = 0;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  apTicket = self->apTicket;
  if (!apTicket)
  {
    uint64_t v6 = sub_23993FC14(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_23994088C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_10;
  }
  [(NSData *)apTicket bytes];
  [(NSData *)self->apTicket length];
  if (Img4DecodeInitManifest())
  {
    uint64_t v6 = sub_23993FC14(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[CREANController _apticketCopyDataObjectPropertyWithTag:property:]";
      _os_log_impl(&dword_239937000, v6, OS_LOG_TYPE_DEFAULT, "%s: failed to parse AP ticket as Img4 manifest", buf, 0xCu);
    }
LABEL_10:

    v21 = 0;
    goto LABEL_11;
  }
  if (Img4DecodeGetObjectPropertyData())
  {
    uint64_t v6 = sub_23993FC14(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_23994097C(v6, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_10;
  }
  v21 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];
  if (!v21)
  {
    uint64_t v6 = sub_23993FC14(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_239940904(v6, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_10;
  }
LABEL_11:
  return v21;
}

- (id)copyCurrentFDREANValuesWithdataDir:(id)a3 error:(id *)a4
{
  uint64_t v6 = [NSURL URLWithString:a3];
  if (!self->apTicket)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_2399409F4();
    }
    goto LABEL_13;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239940A28();
    }
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = Mutable;
  CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", (const void *)*MEMORY[0x263EFFB40]);
  uint64_t v9 = (const void *)*MEMORY[0x263EFFB38];
  CFDictionarySetValue(v8, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
  CFDictionaryAddValue(v8, @"VerifyData", v9);
  if (!v6)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239940A5C(v20, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_33;
  }
  CFDictionaryAddValue(v8, @"DataDirectory", v6);
  if (!AMFDRCreateTypeWithOptions())
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239940ACC();
    }
LABEL_33:
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = [(CREANController *)self _apticketCopyDataObjectPropertyWithTag:1718903152 property:1145525076];
  if (!v10)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = 0;
      goto LABEL_15;
    }
    sub_239940B00();
    uint64_t v11 = 0;
LABEL_20:
    uint64_t v16 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = (void *)v10;
  AMFDRSetOption();
  if ((AMFDRDataCopyTrustObject() & 1) == 0)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      uint64_t v16 = 0;
      goto LABEL_21;
    }
    sub_239940B9C();
    goto LABEL_20;
  }
  CFArrayRef v12 = (const __CFArray *)AMFDRSealingMapCopyMultiInstanceForClass();
  CFArrayRef v13 = v12;
  if (!v12 || CFArrayGetCount(v12) < 1)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239940B34();
    }
    goto LABEL_20;
  }
  CFArrayGetValueAtIndex(v13, 0);
  uint64_t v14 = AMFDRSealingMapCopyLocalData();
  if (!v14)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239940B68();
    }
    goto LABEL_20;
  }
  uint64_t v15 = v14;
  uint64_t v16 = objc_opt_new();
  apTicket = self->apTicket;
  uint64_t v18 = [NSNumber numberWithInt:1802793057];
  [v16 setObject:apTicket forKeyedSubscript:v18];

  uint64_t v19 = [NSNumber numberWithInt:1953722996];
  [v16 setObject:0 forKeyedSubscript:v19];

  uint64_t v20 = [NSNumber numberWithInt:1818322291];
  [v16 setObject:v15 forKeyedSubscript:v20];
LABEL_21:

  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  id v21 = v16;

  return v21;
}

- (unint64_t)sizeEAN:(id)a3
{
  input[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(input, 0, 24);
  uint32_t outputCnt = 1;
  io_connect_t connect = 0;
  uint64_t output = 0;
  if (!v4)
  {
    CFArrayRef v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940BD0();
    }
    goto LABEL_18;
  }
  unsigned int v5 = [(CREANController *)self _getQuerykeyFromDataClass:v4];
  if (!v5)
  {
    CFArrayRef v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940C04();
    }
    goto LABEL_18;
  }
  unsigned int v6 = v5;
  mach_port_t v7 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v8 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!MatchingService)
  {
    CFArrayRef v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940C38();
    }
LABEL_18:
    io_object_t v10 = 0;
    goto LABEL_25;
  }
  io_object_t v10 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    CFArrayRef v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940D08();
    }
  }
  else if (connect)
  {
    input[0] = v6;
    if (!IOConnectCallMethod(connect, 3u, input, 3u, 0, 0, &output, &outputCnt, 0, 0)) {
      goto LABEL_7;
    }
    CFArrayRef v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940CA0();
    }
  }
  else
  {
    CFArrayRef v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239940C6C();
    }
  }
LABEL_25:

LABEL_7:
  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v10) {
    IOObjectRelease(v10);
  }
  uint64_t v11 = output;

  return v11;
}

- (BOOL)copyFDREANValues:(id)a3 outgenerationCount:(unsigned int *)a4 outManifesthash:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v25 = 0;
  if (![(CREANController *)self readFDRDataFromEANWithDataClass:v8 outData:&v25 stripPadding:0])
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v27 = v8;
      uint64_t v11 = "Failed to load EAN key: %@";
      goto LABEL_7;
    }
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_18;
  }
  unint64_t v9 = [v25 length];
  if (v9 <= 0x1F)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v27 = v8;
      uint64_t v11 = "Entry too small to be versioned blob: %@";
LABEL_7:
      _os_log_impl(&dword_239937000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  unint64_t v12 = v9;
  CFArrayRef v13 = (_DWORD *)[v25 bytes];
  uint64_t v14 = v13;
  if (*v13 != 1769104486)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940EF4();
    }
    goto LABEL_17;
  }
  if (v13[1] != 1)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940E74();
    }
    goto LABEL_17;
  }
  unsigned int v15 = v13[2];
  if (v15 + 1 <= 1)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940E40();
    }
    goto LABEL_17;
  }
  unsigned int v18 = v13[3];
  if (v18 <= 0x1F)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940D70();
    }
    goto LABEL_17;
  }
  int v19 = v13[4];
  if (!v19)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940DA4();
    }
    goto LABEL_17;
  }
  if (v12 <= v19 + v18)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940E0C();
    }
    goto LABEL_17;
  }
  uint64_t v20 = v13[5];
  if (!v20)
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239940DD8();
    }
    goto LABEL_17;
  }
  uint64_t v21 = 16 * v20;
  if (16 * v20 != v13[7])
  {
    io_object_t v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v23 = v14[5];
      int v24 = v14[7];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)uint64_t v27 = v23;
      *(_WORD *)&v27[4] = 2048;
      *(void *)&v27[6] = 16;
      __int16 v28 = 2048;
      uint64_t v29 = v21;
      __int16 v30 = 1024;
      int v31 = v24;
      _os_log_error_impl(&dword_239937000, v10, OS_LOG_TYPE_ERROR, "FDR info payload is incorrect size.\tExpect: %d * %lu = %zu\tFound: %d", buf, 0x22u);
    }
    goto LABEL_17;
  }
  if (a4) {
    *a4 = v15;
  }
  if (!a5)
  {
    BOOL v16 = 1;
    goto LABEL_19;
  }
  int v22 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v13 + v13[3] length:v13[4]];
  io_object_t v10 = v22;
  BOOL v16 = v22 != 0;
  if (v22)
  {
    io_object_t v10 = v22;
    *a5 = v10;
    BOOL v16 = 1;
  }
LABEL_18:

LABEL_19:
  return v16;
}

- (unsigned)nextEANGenerationCount
{
  unsigned int v9 = 0;
  if ([(CREANController *)self copyFDREANValues:@"fdr1" outgenerationCount:&v9 outManifesthash:0])
  {
    unsigned int v3 = v9;
  }
  else
  {
    unsigned int v3 = 0;
  }
  BOOL v4 = [(CREANController *)self copyFDREANValues:@"fdr2" outgenerationCount:&v9 outManifesthash:0];
  unsigned int v5 = v9;
  if (!v4) {
    unsigned int v5 = 0;
  }
  if (v3 <= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v3;
  }
  if (v3 < v5) {
    unsigned int v5 = v3;
  }
  if (v5 == 1) {
    unsigned int v7 = 2;
  }
  else {
    unsigned int v7 = 1;
  }
  if (v6 == -2) {
    return v7;
  }
  else {
    return v6 + 1;
  }
}

- (id)copyStagedFDREanDataWithdataDir:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  long long v62 = 0u;
  long long v63 = 0u;
  *(_OWORD *)md = 0u;
  *(_OWORD *)bytes = 0u;
  long long v56 = 0u;
  CFDictionaryRef v5 = [(CREANController *)self copyCurrentFDREANValuesWithdataDir:a3 error:a4];
  CFDictionaryRef v6 = v5;
  if (!v5)
  {
    long long v47 = sub_23993FC14(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_239940F78();
    }
    goto LABEL_49;
  }
  size_t Count = CFDictionaryGetCount(v5);
  if (!Count)
  {
    long long v47 = sub_23993FC14(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_239940FAC();
    }
LABEL_49:

    Mutable = 0;
    goto LABEL_50;
  }
  int64_t v8 = Count;
  unsigned int v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  io_object_t v10 = (const void **)malloc_type_calloc(v8, 8uLL, 0x6004044C4A2DFuLL);
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
    long long v53 = (UInt8 *)malloc_type_calloc(v8, 0x10uLL, 0x1000040451B5BE8uLL);
    CFIndex v18 = CFDataGetLength(v17);
    CFIndex v19 = v18;
    uint64_t v20 = v18 & 3;
    if (v18 <= 0) {
      uint64_t v20 = -(-v18 & 3);
    }
    if (v20) {
      uint64_t v21 = v18 - v20 + 4;
    }
    else {
      uint64_t v21 = v18;
    }
    uint64_t v54 = v21;
    *(void *)bytes = 0x169726466;
    unsigned int v22 = [(CREANController *)self nextEANGenerationCount];
    *(_DWORD *)&bytes[8] = v22;
    int v23 = sub_23993FC14(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v22;
      _os_log_impl(&dword_239937000, v23, OS_LOG_TYPE_DEFAULT, "Will use generation count: %u", buf, 8u);
    }

    *(_DWORD *)&bytes[12] = 32;
    CFDataRef theData = v17;
    LODWORD(v56) = CFDataGetLength(v17);
    DWORD1(v56) = v8;
    DWORD2(v56) = v54 + 32;
    HIDWORD(v56) = 16 * v8;
    long long v51 = v9;
    CFIndex v24 = v54 + 32 + 16 * v8;
    if (v8 >= 1)
    {
      id v25 = v53 + 8;
      uint64_t v26 = (const __CFData **)v10;
      uint64_t v27 = (const __CFNumber **)v9;
      int64_t v28 = v8;
      do
      {
        CFDataRef v29 = *v26++;
        CFIndex v30 = CFDataGetLength(v29);
        int v31 = v30;
        if (v30 <= 0) {
          uint64_t v32 = -(-v30 & 3);
        }
        else {
          uint64_t v32 = v30 & 3;
        }
        if (v32) {
          uint64_t v33 = v30 - v32 + 4;
        }
        else {
          uint64_t v33 = v30;
        }
        CFNumberRef v34 = *v27++;
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v34, kCFNumberSInt32Type, buf);
        *(v25 - 2) = *(_DWORD *)buf;
        *(v25 - 1) = v24;
        *id v25 = v31;
        v25 += 4;
        v24 += v33;
        --v28;
      }
      while (v28);
    }
    Mutable = CFDataCreateMutable(allocator, v24);
    CFDataAppendBytes(Mutable, bytes, 32);
    long long v36 = sub_23993FC14(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239937000, v36, OS_LOG_TYPE_DEFAULT, "Added header.", buf, 2u);
    }

    long long v37 = CFDataGetBytePtr(theData);
    CFIndex v38 = CFDataGetLength(theData);
    CFDataAppendBytes(Mutable, v37, v38);
    if (v54 != v19) {
      CFDataIncreaseLength(Mutable, v54 - v19);
    }
    long long v39 = sub_23993FC14(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239937000, v39, OS_LOG_TYPE_DEFAULT, "Added hash.", buf, 2u);
    }

    CFDataAppendBytes(Mutable, v53, 16 * v8);
    long long v40 = sub_23993FC14(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239937000, v40, OS_LOG_TYPE_DEFAULT, "Added payload table.", buf, 2u);
    }

    if (v8 >= 1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v42 = CFDataGetLength((CFDataRef)v10[i]);
        long long v43 = CFDataGetBytePtr((CFDataRef)v10[i]);
        CFDataAppendBytes(Mutable, v43, v42);
        uint64_t v44 = v42 & 3;
        if (v42 <= 0) {
          uint64_t v44 = -(-v42 & 3);
        }
        if (v44) {
          CFDataIncreaseLength(Mutable, 4 - v44);
        }
        long long v45 = sub_23993FC14(0);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v58 = i;
          __int16 v59 = 2048;
          uint64_t v60 = v42;
          _os_log_impl(&dword_239937000, v45, OS_LOG_TYPE_DEFAULT, "Added element %ld. Size: %ld", buf, 0x16u);
        }
      }
    }
    long long v46 = sub_23993FC14(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239937000, v46, OS_LOG_TYPE_DEFAULT, "Success.", buf, 2u);
    }

    unsigned int v9 = v51;
    if (v53) {
      free(v53);
    }
    if (!v51) {
      goto LABEL_43;
    }
  }
  else
  {
    long long v49 = sub_23993FC14(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_239940FE0();
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
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFDictionaryRef v6 = v5;
  io_connect_t connect = 0;
  if (!v5)
  {
    CFAllocatorRef v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_239941014();
    }
    goto LABEL_32;
  }
  if (![v5 count])
  {
    BOOL v21 = 1;
    goto LABEL_27;
  }
  mach_port_t v7 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v8 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!MatchingService)
  {
    CFAllocatorRef v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_239941048();
    }
LABEL_32:
    io_object_t v10 = 0;
    goto LABEL_37;
  }
  io_object_t v10 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    CFAllocatorRef v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2399410B0();
    }
  }
  else
  {
    if (connect)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      CFAllocatorRef v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        io_object_t v23 = v10;
        CFIndex v24 = v6;
        uint64_t v14 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            CFDataRef v17 = [v11 objectForKeyedSubscript:v16];
            BOOL v18 = [(CREANController *)self _writeDataToEAN:v17 withKey:v16];

            CFIndex v19 = sub_23993FC14(0);
            uint64_t v20 = v19;
            if (!v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                sub_2399400F4();
              }

              BOOL v21 = 0;
              goto LABEL_20;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v31 = v16;
              _os_log_impl(&dword_239937000, v20, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        BOOL v21 = 1;
LABEL_20:
        CFDictionaryRef v6 = v24;
        io_object_t v10 = v23;
      }
      else
      {
        BOOL v21 = 1;
      }
      goto LABEL_23;
    }
    CFAllocatorRef v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_23994107C();
    }
  }
LABEL_37:
  BOOL v21 = 0;
LABEL_23:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v10) {
    IOObjectRelease(v10);
  }
LABEL_27:

  return v21;
}

- (BOOL)stageVersionedFDREANWithdataDir:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = [(CREANController *)self sizeEAN:@"fdr1"];
  unint64_t v7 = v6 | [(CREANController *)self sizeEAN:@"fdr2"];
  CFDictionaryRef v8 = sub_23993FC14(0);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239937000, v8, OS_LOG_TYPE_DEFAULT, "Preparing to write staged FDR EAN key.", buf, 2u);
    }

    id v24 = 0;
    CFDictionaryRef v8 = [(CREANController *)self copyStagedFDREanDataWithdataDir:v5 error:&v24];
    id v10 = v24;
    if (v10 || !v8)
    {
      unsigned int v15 = sub_23993FC14(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_239941118();
      }
    }
    else
    {
      BOOL v11 = [(CREANController *)self _writeDataToEAN:v8 withKey:@"fdr2"];
      uint64_t v12 = sub_23993FC14(0);
      uint64_t v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v26 = @"fdr2";
          _os_log_impl(&dword_239937000, v13, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
        }

        goto LABEL_12;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_23994119C(v13, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    BOOL v14 = 0;
    goto LABEL_20;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239937000, v8, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
  }
LABEL_12:
  BOOL v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)swapEAN:(id)a3 withKey:(id)a4
{
  kern_return_t v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
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
  uint64_t input;
  uint64_t v43;
  uint64_t v44;

  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CFDictionaryRef v8 = v7;
  io_connect_t connect = 0;
  input = 0;
  long long v43 = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (!v6)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239941214();
    }
    goto LABEL_29;
  }
  if (!v7)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239941248();
    }
    goto LABEL_29;
  }
  unsigned int v9 = [(CREANController *)self _getQuerykeyFromDataClass:v6];
  if (!v9)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_23994127C();
    }
    goto LABEL_29;
  }
  unsigned int v10 = v9;
  unsigned int v11 = [(CREANController *)self _getQuerykeyFromDataClass:v8];
  if (!v11)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_2399412B0();
    }
    goto LABEL_29;
  }
  unsigned int v12 = v11;
  mach_port_t v13 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v14 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(v13, v14);
  if (!MatchingService)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239941048();
    }
LABEL_29:
    io_object_t v16 = 0;
LABEL_30:
    uint64_t v21 = 0;
    goto LABEL_14;
  }
  io_object_t v16 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239940D08();
    }
    goto LABEL_30;
  }
  if (!connect)
  {
    uint64_t v20 = sub_23993FC14(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_2399412E4();
    }
    goto LABEL_30;
  }
  input = v10;
  long long v43 = v12;
  uint64_t v17 = sub_23993FC14(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    uint64_t v27 = HIBYTE(v10);
    long long v28 = 1024;
    CFDataRef v29 = HIWORD(v10);
    CFIndex v30 = 1024;
    uint64_t v31 = v10 >> 8;
    uint64_t v32 = 1024;
    uint64_t v33 = v10;
    CFNumberRef v34 = 1024;
    long long v35 = HIBYTE(v12);
    long long v36 = 1024;
    long long v37 = HIWORD(v12);
    CFIndex v38 = 1024;
    long long v39 = v12 >> 8;
    long long v40 = 1024;
    long long v41 = v12;
    _os_log_impl(&dword_239937000, v17, OS_LOG_TYPE_DEFAULT, "Swapping EAN key %c%c%c%c and %c%c%c%c", buf, 0x32u);
  }

  uint64_t v18 = IOConnectCallMethod(connect, 6u, &input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  uint64_t v19 = sub_23993FC14(0);
  uint64_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_239941318();
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239937000, v20, OS_LOG_TYPE_DEFAULT, "EAN key Swap success", buf, 2u);
  }
  uint64_t v21 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v16) {
    IOObjectRelease(v16);
  }

  return v21;
}

- (BOOL)swapVersionedFDR
{
  unint64_t v3 = [(CREANController *)self sizeEAN:@"fdr1"];
  unint64_t v4 = [(CREANController *)self sizeEAN:@"fdr2"];
  if (!(v3 | v4))
  {
    id v5 = sub_23993FC14(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v6 = "Versioned FDR is empty. NO OP";
      id v7 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_239937000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!v3 || !v4)
  {
    id v5 = sub_23993FC14(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_239941380();
    }
    goto LABEL_15;
  }
  BOOL v8 = [(CREANController *)self swapEAN:@"fdr1" withKey:@"fdr2"];
  unsigned int v9 = sub_23993FC14(0);
  id v5 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2399413B4();
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = 0;
    id v6 = "FDR1 is now active.";
    id v7 = (uint8_t *)&v12;
    goto LABEL_9;
  }
LABEL_10:
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (id)_ticketCopyHashDataWithNode:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    BOOL v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2399413E8();
    }

    unsigned int v9 = 0;
    goto LABEL_23;
  }
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a3, @"crypto-hash-method", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFDataRef v5 = CFProperty;
  if (CFProperty)
  {
    if (*(_DWORD *)CFDataGetBytePtr(CFProperty) != 828467315)
    {
      uint64_t v6 = *(void *)CFDataGetBytePtr(v5);
      id v7 = sub_23993FC14(0);
      BOOL v8 = v7;
      if (v6 != 0x3438332D32616873)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_239941450();
        }

        unsigned int v9 = 0;
LABEL_22:
        CFRelease(v5);
        goto LABEL_23;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)io_object_t v16 = 0;
        _os_log_impl(&dword_239937000, v8, OS_LOG_TYPE_DEFAULT, "crypto-hash-method found. Using SHA2-384\n", v16, 2u);
      }

      CC_SHA384([(NSData *)self->apTicket bytes], [(NSData *)self->apTicket length], v16);
      uint64_t v13 = 48;
      goto LABEL_17;
    }
    unsigned int v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_object_t v16 = 0;
      __int16 v12 = "crypto-hash-method found. Using SHA1\n";
      goto LABEL_15;
    }
  }
  else
  {
    unsigned int v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_object_t v16 = 0;
      __int16 v12 = "crypto-hash-method not found, defaulting to SHA1\n";
LABEL_15:
      _os_log_impl(&dword_239937000, v11, OS_LOG_TYPE_DEFAULT, v12, v16, 2u);
    }
  }

  CC_SHA1([(NSData *)self->apTicket bytes], [(NSData *)self->apTicket length], v16);
  uint64_t v13 = 20;
LABEL_17:
  unsigned int v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v16 length:v13];
  if (!v9)
  {
    CFDictionaryRef v14 = sub_23993FC14(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_23994141C();
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
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v3 = sub_23993FC14(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    BOOL v10 = "-[CREANController apticketCopyHashData]";
    _os_log_impl(&dword_239937000, v3, OS_LOG_TYPE_DEFAULT, "entering %s\n", (uint8_t *)&v9, 0xCu);
  }

  if (self->apTicket)
  {
    uint64_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
    if (v4)
    {
      io_object_t v5 = v4;
      uint64_t v6 = [(CREANController *)self _ticketCopyHashDataWithNode:v4];
      IOObjectRelease(v5);
      goto LABEL_11;
    }
    id v7 = sub_23993FC14(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_2399413E8();
    }
  }
  else
  {
    id v7 = sub_23993FC14(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_2399414B8();
    }
  }

  uint64_t v6 = 0;
LABEL_11:
  return v6;
}

- (BOOL)setupVersionedFDRWithApTicket:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = [(CREANController *)self sizeEAN:@"fdr1"];
  unint64_t v7 = [(CREANController *)self sizeEAN:@"fdr2"];
  bzero(v28, 0x1000uLL);
  if (!(v6 | v7))
  {
    BOOL v8 = sub_23993FC14(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239937000, v8, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
    }
    id v9 = 0;
    BOOL v10 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2399415BC();
    }
    goto LABEL_40;
  }
  objc_storeStrong((id *)&self->apTicket, a3);
  uint64_t v13 = sub_23993FC14(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239937000, v13, OS_LOG_TYPE_DEFAULT, "Ensuring FDR1 is valid and active.", buf, 2u);
  }

  if (!self->apTicket)
  {
    BOOL v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2399414EC();
    }
    goto LABEL_40;
  }
  uint64_t v14 = [(CREANController *)self apticketCopyHashData];
  if (!v14)
  {
    BOOL v10 = sub_23993FC14(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239941520();
    }
    goto LABEL_40;
  }
  BOOL v10 = v14;
  id v23 = 0;
  BOOL v15 = [(CREANController *)self copyFDREANValues:@"fdr1" outgenerationCount:0 outManifesthash:&v23];
  id v9 = v23;
  if (v15)
  {
    io_object_t v16 = sub_23993FC14(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v9 convertToHexString];
      *(_DWORD *)buf = 138412290;
      long long v25 = v17;
      _os_log_impl(&dword_239937000, v16, OS_LOG_TYPE_DEFAULT, "FDR1 has hash: %@", buf, 0xCu);
    }
    int v18 = [v10 isEqualToData:v9];
    BOOL v8 = sub_23993FC14(0);
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239937000, v8, OS_LOG_TYPE_DEFAULT, "FDR1 appears to be active.", buf, 2u);
      }
      goto LABEL_5;
    }
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      long long v25 = v10;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_239937000, v8, OS_LOG_TYPE_DEFAULT, "FDR1 boot hash mismatch:%@::%@", buf, 0x16u);
    }
  }
  uint64_t v20 = sub_23993FC14(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239937000, v20, OS_LOG_TYPE_DEFAULT, "FDR1 is not written / valid.", buf, 2u);
  }

  if (v6 || !v7) {
    goto LABEL_6;
  }
  BOOL v8 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v28 length:4096];
  if (![(CREANController *)self _writeDataToEAN:v8 withKey:@"fdr1"])
  {
    uint64_t v21 = sub_23993FC14(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_239941588();
    }
    goto LABEL_39;
  }
  if (![(CREANController *)self swapVersionedFDR])
  {
    uint64_t v21 = sub_23993FC14(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_239941554();
    }
LABEL_39:

LABEL_40:
    BOOL v12 = 0;
    goto LABEL_41;
  }
LABEL_5:

LABEL_6:
  uint64_t v11 = sub_23993FC14(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239937000, v11, OS_LOG_TYPE_DEFAULT, "setupVersionedFDRWithApTicket success", buf, 2u);
  }

  BOOL v12 = 1;
LABEL_41:

  return v12;
}

- (void).cxx_destruct
{
}

@end