@interface AppleDeviceQueryKeysActionArmory
+ (NSString)key;
+ (id)ZhuGeToDo:(id)a3 withError:(id *)a4;
+ (id)getReportFDRDiagnosticFromOption:(id)a3 withError:(id *)a4;
+ (id)queryBasebandFirmwareSecurityInfo:(id)a3 withError:(id *)a4;
+ (id)queryDisplayUniqueChipIDWithError:(id *)a3;
+ (id)queryFDRDeviceAsidMetadataIsVerified:(id)a3 withError:(id *)a4;
+ (id)queryFDRSealingStatusWithManifestOverride:(id)a3 WithError:(id *)a4;
+ (id)queryFactoryShippingSettingTimeWithError:(id *)a3;
+ (id)queryIOCameraByProperty:(id)a3 withError:(id *)a4;
+ (id)queryIOProperty:(id)a3 fromCriteria:(id)a4 withError:(id *)a5;
+ (id)queryIOPropertyFromPath:(id)a3 andCriteria:(id)a4 withError:(id *)a5;
+ (id)queryMesaProvisionStateWithError:(id *)a3;
+ (id)queryMesaSensorIDSensorSNWithError:(id *)a3;
+ (id)queryMogulIDSN:(id)a3 withError:(id *)a4;
+ (id)queryMogulTouchScreenCertDecoded:(BOOL)a3 withError:(id *)a4;
+ (id)queryNFSecureElementByKey:(id)a3 WithError:(id *)a4;
+ (id)querySPUProperty:(id)a3 withError:(id *)a4;
+ (id)queryScreenSerialNumberByProperty:(id)a3 withError:(id *)a4;
+ (id)querySecureElementIDWithError:(id *)a3;
+ (id)querySysCfgKey:(id)a3 withError:(id *)a4;
+ (id)querySysctlVariableName:(id)a3 dataType:(id)a4 withError:(id *)a5;
+ (id)queryThreadRadioMacAddress64BitWithError:(id *)a3;
+ (id)queryThreadRadioMacAddressForProvisioningWithError:(id *)a3;
+ (id)queryTouchScreenCert:(id *)a3;
+ (id)queryVinylEUICCCSNwithError:(id *)a3;
+ (id)queryWLHWIdentifierInfoByProperty:(id)a3 withError:(id *)a4;
+ (id)queryWLModuleSerialNumberWithError:(id *)a3;
+ (void)setKey:(id)a3;
@end

@implementation AppleDeviceQueryKeysActionArmory

+ (void)setKey:(id)a3
{
}

+ (NSString)key
{
  return (NSString *)(id)_key;
}

+ (id)getReportFDRDiagnosticFromOption:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  v33 = 0;
  v34 = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 159, @"error p-pointer is nil!", v6, v7, v8, v32);
    v27 = 0;
    v26 = 0;
    goto LABEL_18;
  }
  *a4 = 0;
  v10 = [v5 objectForKeyedSubscript:@"ReportFDRDiagnostic_Options"];
  char v11 = isObjectNilOrZhuGeNull(v10);

  v12 = 0;
  if ((v11 & 1) == 0)
  {
    v13 = [v9 objectForKeyedSubscript:@"ReportFDRDiagnostic_Options"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v15 = [v9 objectForKeyedSubscript:@"ReportFDRDiagnostic_Options"];
    v12 = v15;
    if ((isKindOfClass & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 167, @"FDR options is not a dictionary \"%@\"!", v16, v17, v18, (uint64_t)v15);

      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = 9;
      goto LABEL_16;
    }
  }
  if (libFDRLibraryCore_0()
    && libFDRLibraryCore_0()
    && getAMFDRDiagnosticGenerateReportSymbolLoc()
    && libFDRLibraryCore_0()
    && getAMFDRLogSetHandlerSymbolLoc())
  {
    pAMFDRLogSetHandler((uint64_t)fdrDiagnosticLogCallback);
    ReportSymbolLoc = (uint64_t (*)(void *, void **, void **))getAMFDRDiagnosticGenerateReportSymbolLoc();
    if (!ReportSymbolLoc) {
      getFDRDataByFDRClassWithError_cold_1();
    }
    if (ReportSymbolLoc(v12, &v34, &v33))
    {
      v26 = 0;
      v27 = v34;
      goto LABEL_18;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 186, @"AMFDRDiagnosticGenerateReport failed!", v23, v24, v25, v32);
    v26 = v33;
    id v30 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:15 underlyingError:v33];
    v27 = 0;
    goto LABEL_17;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 178, @"Failed to load libFDR.dylib!", v19, v20, v21, v32);
  v28 = (void *)MEMORY[0x263F087E8];
  uint64_t v29 = 13;
LABEL_16:
  id v30 = [v28 errorWithZhuGeErrorCode:v29 underlyingError:0];
  v27 = 0;
  v26 = 0;
LABEL_17:
  *a4 = v30;
LABEL_18:

  return v27;
}

+ (id)queryFDRSealingStatusWithManifestOverride:(id)a3 WithError:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  v41 = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 212, @"error p-pointer is nil!", v6, v7, v8, v39);
    v34 = 0;
    goto LABEL_20;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 218, @"needOverride pointer is nil!", v6, v7, v8, v39);
    v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = 45;
    goto LABEL_19;
  }
  if (!libFDRLibraryCore_0()
    || !libFDRLibraryCore_0()
    || !getAMFDRCreateWithOptionsSymbolLoc()
    || !libFDRLibraryCore_0()
    || !getAMFDRSealingMapVerifySealingSymbolLoc())
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 226, @"Failed to load libFDR.dylib!", v10, v11, v12, v39);
    v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = 13;
LABEL_19:
    [v35 errorWithZhuGeErrorCode:v36 underlyingError:0];
    v34 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  uint64_t v13 = *MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 236, @"CFDictionaryCreateMutable failed!", v15, v16, v17, v39);
    v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = 32;
    goto LABEL_19;
  }
  uint64_t v18 = Mutable;
  CFDictionarySetValue(Mutable, @"DataStore", @"Local");
  uint64_t v19 = [v9 lowercaseString];
  int v20 = [v19 isEqualToString:@"yes"];

  if (v20) {
    CFDictionarySetValue(v18, @"SealingManifestOverride", (const void *)*MEMORY[0x263EFFB40]);
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 245, @"FDR options is %@", v21, v22, v23, (uint64_t)v18);
  AMFDRCreateWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, __CFDictionary *))getAMFDRCreateWithOptionsSymbolLoc();
  if (!AMFDRCreateWithOptionsSymbolLoc) {
    getFDRDataByFDRClassWithError_cold_1();
  }
  uint64_t v25 = AMFDRCreateWithOptionsSymbolLoc(v13, v18);
  if (v25)
  {
    uint64_t v29 = (const void *)v25;
    AMFDRSealingMapVerifySealingSymbolLoc = (uint64_t (*)(const void *, void **))getAMFDRSealingMapVerifySealingSymbolLoc();
    if (!AMFDRSealingMapVerifySealingSymbolLoc) {
      getFDRDataByFDRClassWithError_cold_1();
    }
    if (AMFDRSealingMapVerifySealingSymbolLoc(v29, &v41))
    {
      v34 = (void *)MEMORY[0x263EFFA88];
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 257, @"Didn't successfully verify fdr data sealing status, error %@!", v31, v32, v33, (uint64_t)v41);
      v38 = v41;
      *a4 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:15 underlyingError:v41];

      v34 = 0;
    }
    CFRelease(v29);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 249, @"AMFDRCreateWithOptions failed!", v26, v27, v28, v40);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:15 underlyingError:0];
    v34 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(v18);
LABEL_20:

  return v34;
}

+ (id)queryFDRDeviceAsidMetadataIsVerified:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  id v30 = 0;
  if (a4)
  {
    *a4 = 0;
    if (isObjectNilOrZhuGeNull(v5))
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 286, @"option is nil", v10, v11, v12, v29);
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = 45;
LABEL_17:
      [v13 errorWithZhuGeErrorCode:v14 underlyingError:0];
      uint64_t v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 291, @"option is not a dictionary", v16, v17, v18, v29);
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = 9;
      goto LABEL_17;
    }
    uint64_t v19 = [v9 objectForKeyedSubscript:@"FDRDeviceAsidMetadataIsVerified_Options"];

    if (!libFDRLibraryCore_0()
      || !libFDRLibraryCore_0()
      || !getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc()
      || !libFDRLibraryCore_0()
      || !getAMFDRLogSetHandlerSymbolLoc())
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 301, @"Failed to load libFDR.dylib!", v20, v21, v22, v29);
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = 13;
      goto LABEL_17;
    }
    pAMFDRLogSetHandler((uint64_t)fdrLogCallback);
    AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc = (uint64_t (*)(void *, void **))getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc();
    if (!AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc) {
      getFDRDataByFDRClassWithError_cold_1();
    }
    if (AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc(v19, &v30))
    {
      uint64_t v15 = (void *)MEMORY[0x263EFFA88];
      goto LABEL_18;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 309, @"AMFDRSealingMapVerifyAsidMetadataForDevice failed!", v24, v25, v26, v29);
    uint64_t v28 = v30;
    *a4 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:15 underlyingError:v30];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 280, @"error p-pointer is nil!", v6, v7, v8, v29);
  }
  uint64_t v15 = 0;
LABEL_18:

  return v15;
}

+ (id)queryIOPropertyFromPath:(id)a3 andCriteria:(id)a4 withError:(id *)a5
{
  kern_return_t v85;
  mach_error_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CFMutableDictionaryRef v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  void *v98;
  __CFString *v99;
  __CFDictionary *v100;
  __CFString *v101;
  void *v102;
  char v103;
  void *v104;
  int v105;
  __CFString *v106;
  uint64_t v107;
  int v108;
  __CFString *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  void *v142;
  uint64_t v143;
  CFAllocatorRef allocator;
  id v145;
  id v146;
  CFStringRef key;
  void *v148;
  int v149;
  id v150;
  id CFProperty;
  long long v152;
  long long v153;
  long long v154;
  long long v155;
  CFMutableDictionaryRef properties;
  id v157;
  io_object_t object;
  unsigned char v159[128];
  uint64_t v160;
  uint64_t vars8;

  v160 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v11 = a4;
  object = 0;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 343, @"error p-pointer is nil!", v8, v9, v10, v136);
    uint64_t v12 = 0;
    uint64_t v21 = 0;
    uint64_t v24 = 0;
    uint64_t v27 = 0;
    v34 = 0;
    v55 = 0;
    id v16 = 0;
    CFProperty = 0;
    goto LABEL_19;
  }
  *a5 = 0;
  if (!v7)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 350, @"path pointer is nil!", v8, v9, v10, v136);
    id v56 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    uint64_t v12 = 0;
    uint64_t v21 = 0;
    uint64_t v24 = 0;
    uint64_t v27 = 0;
    v34 = 0;
    v55 = 0;
    id v16 = 0;
LABEL_18:
    CFProperty = 0;
    *a5 = v56;
    goto LABEL_19;
  }
  v157 = 0;
  uint64_t v12 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(IO[a-z]+)://(.+)/(.+)" options:1 error:&v157];
  id v16 = v157;
  if (!v12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 358, @"Creating regEx failed for IO query!", v13, v14, v15, v136);
    id v56 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:v16];
    uint64_t v21 = 0;
LABEL_16:
    uint64_t v24 = 0;
    uint64_t v27 = 0;
    v34 = 0;
LABEL_17:
    v55 = 0;
    goto LABEL_18;
  }
  uint64_t v17 = objc_msgSend(v12, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  uint64_t v21 = v17;
  if (!v17)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 364, @"Matching regEx failed for IO path \"%@\"!", v18, v19, v20, (uint64_t)v7);
    id v56 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:47 underlyingError:0];
    goto LABEL_16;
  }
  uint64_t v22 = [v17 rangeAtIndex:1];
  uint64_t v24 = objc_msgSend(v7, "substringWithRange:", v22, v23);
  uint64_t v25 = [v21 rangeAtIndex:2];
  uint64_t v27 = objc_msgSend(v7, "substringWithRange:", v25, v26);
  uint64_t v28 = [v21 rangeAtIndex:3];
  uint64_t v30 = objc_msgSend(v7, "substringWithRange:", v28, v29);
  v34 = (void *)v30;
  if (!v11)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 374, @"criteria pointer is nil!", v31, v32, v33, v136);
    id v56 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    goto LABEL_17;
  }
  key = (const __CFString *)v30;
  v35 = [v11 objectForKeyedSubscript:@"fullPath"];

  if (!v35)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 379, @"Lacking of criteria \"fullPath\" service or not!", v36, v37, v38, v136);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
    v55 = 0;
    CFProperty = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_93:
    v34 = (void *)key;
    goto LABEL_19;
  }
  v145 = v27;
  v148 = [v11 objectForKeyedSubscript:@"fullPath"];
  uint64_t v39 = [v148 lowercaseString];
  char v40 = [v39 isEqualToString:@"yes"];

  if ((v40 & 1) == 0)
  {
    properties = 0;
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 395, @"Searching from non-fullPath services.", v41, v42, v43, v136);
    id v58 = v145;
    CFDictionaryRef v59 = IOServiceMatching((const char *)[v58 UTF8String]);
    v142 = v12;
    v143 = (uint64_t)v7;
    if (v59)
    {
      v146 = v58;
      v137 = a5;
      mach_port_t v63 = *MEMORY[0x263F0EC88];
      mach_error_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v59, &object);
      if (!MatchingServices && object)
      {
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 408, @"Find service class: \"%@\"", v65, v66, v67, (uint64_t)v58);
LABEL_37:
        CFProperty = objc_alloc_init(MEMORY[0x263EFF980]);
        MEMORY[0x24C571B20](object);
        uint64_t v83 = IOIteratorNext(object);
        v55 = v148;
        if (v83)
        {
          uint64_t v84 = v83;
          v70 = 0;
          v69 = 0;
          CFMutableDictionaryRef v68 = 0;
          allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          v140 = v16;
          v141 = v11;
          v138 = v24;
          v139 = v21;
          while (1)
          {
            if (!IORegistryEntryInPlane(v84, (const char *)[v24 UTF8String])) {
              goto LABEL_79;
            }
            v149 = v84;
            v85 = IORegistryEntryCreateCFProperties(v84, &properties, allocator, 0);
            if (!v85) {
              break;
            }
            v86 = v85;
            if (v85 != 53)
            {
              v110 = [NSNumber numberWithUnsignedInt:v84];
              mach_error_string(v86);
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 453, @"Failed to get IO properties from service entry %@! %s!", v111, v112, v113, (uint64_t)v110);

              goto LABEL_70;
            }
            v87 = [NSNumber numberWithUnsignedInt:v84];
            mach_error_string(53);
            ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 449, @"Failed to get IO properties from service entry %@! %s, a potential issue!", v88, v89, v90, (uint64_t)v87);

LABEL_79:
            IOObjectRelease(v84);
            uint64_t v84 = IOIteratorNext(object);
            if (!v84) {
              goto LABEL_83;
            }
          }
          v91 = properties;

          v154 = 0u;
          v155 = 0u;
          v152 = 0u;
          v153 = 0u;
          v92 = v11;
          v93 = [v92 countByEnumeratingWithState:&v152 objects:v159 count:16];
          if (!v93)
          {
            v96 = 1;
            goto LABEL_74;
          }
          v94 = v93;
          v95 = *(void *)v153;
          v96 = 1;
          v150 = v92;
LABEL_45:
          v97 = 0;
          while (1)
          {
            if (*(void *)v153 != v95) {
              objc_enumerationMutation(v92);
            }
            v98 = *(void **)(*((void *)&v152 + 1) + 8 * v97);
            if (([v98 isEqualToString:@"fullPath"] & 1) == 0) {
              break;
            }
LABEL_66:
            if (v94 == ++v97)
            {
              v94 = [v92 countByEnumeratingWithState:&v152 objects:v159 count:16];
              if (v94) {
                goto LABEL_45;
              }
LABEL_74:

              id v11 = v141;
              if ([v92 count] == v96)
              {
                v118 = [(__CFDictionary *)v91 objectForKeyedSubscript:key];

                CFMutableDictionaryRef v68 = v91;
                uint64_t v21 = v139;
                id v16 = v140;
                uint64_t v24 = v138;
                if (v118)
                {
                  v122 = [(__CFDictionary *)v68 objectForKeyedSubscript:key];
                  [CFProperty addObject:v122];

                  goto LABEL_78;
                }
                LODWORD(v84) = v149;
                ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 499, @"No property \"%@\" in entry \"%u\"", v119, v120, v121, (uint64_t)key);
LABEL_70:
                v55 = v148;
              }
              else
              {
                CFMutableDictionaryRef v68 = v91;
                uint64_t v21 = v139;
                id v16 = v140;
                uint64_t v24 = v138;
LABEL_78:
                v55 = v148;
                LODWORD(v84) = v149;
              }
              goto LABEL_79;
            }
          }
          v99 = [v92 objectForKeyedSubscript:v98];

          v100 = v91;
          v101 = [(__CFDictionary *)v91 objectForKeyedSubscript:v98];

          v102 = [(__CFString *)v99 lowercaseString];
          v103 = [v102 isEqualToString:@"yes"];

          v69 = @"Yes";
          if ((v103 & 1) != 0
            || ([(__CFString *)v99 lowercaseString],
                v104 = objc_claimAutoreleasedReturnValue(),
                v105 = [v104 isEqualToString:@"no"],
                v104,
                v69 = @"No",
                v105))
          {
          }
          else
          {
            v69 = v99;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v106 = [NSString stringFromData:v101];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v114 = objc_opt_class();
                ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 485, @"Unsupported type \"%@\" for criterion \"%@\"", v115, v116, v117, v114);
                v70 = v101;
                v91 = v100;
LABEL_73:
                v92 = v150;
                goto LABEL_74;
              }
              v70 = v101;
              goto LABEL_64;
            }
            v107 = objc_opt_class();
            if (v107 == objc_opt_class())
            {
              v108 = [(__CFString *)v101 BOOLValue];
              v109 = @"Yes";
              if (!v108) {
                v109 = @"No";
              }
              v106 = v109;
            }
            else
            {
              v106 = [(__CFString *)v101 stringValue];
            }
          }
          v70 = v106;

LABEL_64:
          v91 = v100;
          if (![(__CFString *)v70 isEqualToString:v69]) {
            goto LABEL_73;
          }
          ++v96;
          v92 = v150;
          goto LABEL_66;
        }
        CFMutableDictionaryRef v68 = 0;
        v69 = 0;
        v70 = 0;
LABEL_83:
        v123 = [CFProperty count];
        if (v123 == 1)
        {
          v127 = [CFProperty objectAtIndexedSubscript:0];

          CFProperty = (id)v127;
        }
        else if (!v123)
        {

          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 509, @"Failed to find a non-fullPath service for path \"%@\"", v124, v125, v126, v143);
          [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:21 underlyingError:0];
          CFProperty = 0;
          *v137 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v27 = v146;
        goto LABEL_92;
      }
      mach_error_string(MatchingServices);
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 411, @"Cannot find service class: \"%@\", %s", v71, v72, v73, (uint64_t)v58);
      id v74 = v58;
      CFDictionaryRef v75 = IOServiceNameMatching((const char *)[v74 UTF8String]);
      if (v75)
      {
        mach_error_t v79 = IOServiceGetMatchingServices(v63, v75, &object);
        if (!v79 && object)
        {
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 422, @"Find service name: \"%@\"", v80, v81, v82, (uint64_t)v74);
          goto LABEL_37;
        }
        mach_error_string(v79);
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 425, @"Cannot find service name: \"%@\", %s", v130, v131, v132, (uint64_t)v74);
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 428, @"Failed to find IO entry for \"%@\"!", v133, v134, v135, (uint64_t)v74);
        v128 = (void *)MEMORY[0x263F087E8];
        v129 = 20;
      }
      else
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 416, @"Failed to match the service name \"%@\"!", v76, v77, v78, (uint64_t)v74);
        v128 = (void *)MEMORY[0x263F087E8];
        v129 = 24;
      }
      [v128 errorWithZhuGeErrorCode:v129 underlyingError:0];
      CFProperty = 0;
      CFMutableDictionaryRef v68 = 0;
      v69 = 0;
      v70 = 0;
      *v137 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v146;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 402, @"Failed to match the service class \"%@\"!", v60, v61, v62, (uint64_t)v58);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:24 underlyingError:0];
      CFProperty = 0;
      CFMutableDictionaryRef v68 = 0;
      v69 = 0;
      v70 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v58;
    }
    v55 = v148;
LABEL_92:

    uint64_t v12 = v142;
    id v7 = (id)v143;
    goto LABEL_93;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 524, @"Searching from fullPath service.", v41, v42, v43, v136);
  v44 = [NSString stringWithFormat:@"%@:/%@", v24, v145];
  mach_port_t v45 = *MEMORY[0x263F0EC88];
  id v46 = v44;
  io_registry_entry_t v47 = IORegistryEntryFromPath(v45, (const char *)[v46 UTF8String]);
  if (v47)
  {
    io_object_t v51 = v47;
    v34 = (void *)key;
    CFProperty = (id)IORegistryEntryCreateCFProperty(v47, key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!CFProperty)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 537, @"Cannot create CF property for property \"%@\"!", v52, v53, v54, (uint64_t)key);
      *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:21 underlyingError:0];
    }

    IOObjectRelease(v51);
    uint64_t v27 = v145;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 530, @"Cannot find IO entry from path \"%@\"!", v48, v49, v50, (uint64_t)v46);
    *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:20 underlyingError:0];

    CFProperty = 0;
    uint64_t v27 = v145;
    v34 = (void *)key;
  }
  v55 = v148;
LABEL_19:
  if (object)
  {
    IOObjectRelease(object);
    object = 0;
  }

  return CFProperty;
}

+ (id)queryIOProperty:(id)a3 fromCriteria:(id)a4 withError:(id *)a5
{
  kern_return_t CFProperties;
  mach_error_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  int v162;
  uint64_t v163;
  int v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  char v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  char v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  char v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  char v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  void *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  int v280;
  int v281;
  int v282;
  CFAllocatorRef allocator;
  IOOptionBits options;
  IOOptionBits optionsa;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
  id v293;
  id v294;
  void *v295;
  id v296;
  io_registry_entry_t entry;
  void *v298;
  void *v299;
  int v300;
  void *v301;
  long long v302;
  long long v303;
  long long v304;
  long long v305;
  io_registry_entry_t parent;
  io_object_t object;
  char v308[128];
  io_name_t name;
  io_name_t className;
  uint64_t v311;
  uint64_t vars8;

  v311 = *MEMORY[0x263EF8340];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  uint64_t v13 = v9;
  object = 0;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 573, @"error p-pointer is nil!", v10, v11, v12, v266);
    uint64_t v15 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    goto LABEL_17;
  }
  *a5 = 0;
  if (!v8)
  {
    uint64_t v24 = @"property pointer is nil!";
    uint64_t v25 = 579;
LABEL_13:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", v25, v24, v10, v11, v12, v266);
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = 45;
LABEL_14:
    id v28 = [v26 errorWithZhuGeErrorCode:v27 underlyingError:0];
    uint64_t v15 = 0;
LABEL_15:
    uint64_t v20 = 0;
LABEL_16:
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    *a5 = v28;
    goto LABEL_17;
  }
  if (!v9)
  {
    uint64_t v24 = @"criteria pointer is nil!";
    uint64_t v25 = 585;
    goto LABEL_13;
  }
  uint64_t v14 = [v9 objectForKeyedSubscript:@"basic"];

  if (!v14)
  {
    uint64_t v30 = [a1 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 591, @"Missing basic criteria for key \"%@\"!", v31, v32, v33, (uint64_t)v30);

    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = 29;
    goto LABEL_14;
  }
  uint64_t v15 = [v13 objectForKeyedSubscript:@"basic"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [a1 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 598, @"Invalid basic criteria type for key \"%@\"!", v35, v36, v37, (uint64_t)v34);

    id v28 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:38 underlyingError:0];
    goto LABEL_15;
  }
  v301 = [v13 objectForKeyedSubscript:@"extra"];
  if ((isObjectNilOrZhuGeNull(v301) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v40 = [a1 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 605, @"Invalid extra criteria type for key \"%@\"!", v41, v42, v43, (uint64_t)v40);

      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:38 underlyingError:0];
      uint64_t v21 = 0;
      id v22 = 0;
      id v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = v301;
      goto LABEL_17;
    }
  }
  id v16 = [v15 objectForKeyedSubscript:@"direction"];
  char v17 = isObjectNilOrZhuGeNull(v16);

  if (v17)
  {
    int v18 = 0;
    int v19 = 1;
  }
  else
  {
    uint64_t v38 = [v15 objectForKeyedSubscript:@"direction"];
    char v39 = [v38 isEqualToString:@"child"];

    if (v39)
    {
      int v19 = 0;
      int v18 = 1;
    }
    else
    {
      v44 = [v15 objectForKeyedSubscript:@"direction"];
      int v45 = [v44 isEqualToString:@"parent"];

      int v19 = v45 ^ 1;
      if (v45) {
        int v18 = 2;
      }
      else {
        int v18 = 0;
      }
    }
  }
  v267 = [a1 key];
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 620, @"Searching property \"%@\" for key \"%@\" with criteria %@", v46, v47, v48, (uint64_t)v8);

  uint64_t v49 = [v15 objectForKeyedSubscript:@"path"];

  if (v49)
  {
    uint64_t v50 = [v15 objectForKeyedSubscript:@"path"];
    io_object_t v51 = [v50 componentsSeparatedByString:@":"];
    uint64_t v20 = v301;
    if ((unint64_t)[v51 count] > 1)
    {
      options = v18;
      v292 = a1;
      uint64_t v71 = [v51 objectAtIndexedSubscript:0];
      mach_port_t v72 = *MEMORY[0x263F0EC88];
      id v73 = v50;
      io_registry_entry_t v74 = IORegistryEntryFromPath(v72, (const char *)[v73 UTF8String]);
      if (v74)
      {
        io_registry_entry_t v75 = v74;
        v290 = v71;
        uint64_t v76 = (const char *)[v290 UTF8String];
        id v23 = (id)IORegistryEntrySearchCFProperty(v75, v76, v8, (CFAllocatorRef)*MEMORY[0x263EFFB08], options);
        uint64_t v80 = [v292 key];
        if (v23)
        {
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 652, @"Found property \"%@\" for key \"%@\" with fullPath", v77, v78, v79, (uint64_t)v8);
        }
        else
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 647, @"Failed to search property \"%@\" for key \"%@\"!", v77, v78, v79, (uint64_t)v8);

          *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:21 underlyingError:0];
        }

        IOObjectRelease(v75);
        id v22 = 0;
        goto LABEL_177;
      }
      v290 = v71;
      uint64_t v52 = [v292 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 637, @"Cannot find IO service entry from path \"%@\" for key \"%@\"!", v86, v87, v88, (uint64_t)v73);
      uint64_t v56 = 20;
    }
    else
    {
      uint64_t v52 = [a1 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 629, @"Invalid full path to search property \"%@\" for key \"%@\"!", v53, v54, v55, (uint64_t)v8);
      v290 = 0;
      uint64_t v56 = 41;
    }

    *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:v56 underlyingError:0];

    id v22 = 0;
LABEL_48:
    id v23 = 0;
    goto LABEL_177;
  }
  uint64_t v57 = [v15 objectForKeyedSubscript:@"servicePlane"];
  uint64_t v20 = v301;
  if (!v57)
  {
    v268 = [a1 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 661, @"Failed to search property \"%@\" for key \"%@\" due to a nil service plane!", v83, v84, v85, (uint64_t)v8);

    id v28 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:26 underlyingError:0];
    goto LABEL_16;
  }
  id v58 = (void *)v57;
  v282 = v19;
  id v22 = [v15 objectForKeyedSubscript:@"parentPlane"];
  if (!v22) {
    id v22 = v58;
  }
  v290 = v58;
  uint64_t v59 = [v15 objectForKeyedSubscript:@"serviceClass"];
  v296 = v22;
  if (v59
    && (uint64_t v60 = (void *)v59,
        [v15 objectForKeyedSubscript:@"serviceName"],
        uint64_t v61 = objc_claimAutoreleasedReturnValue(),
        v61,
        v60,
        v61))
  {
    id v62 = [v15 objectForKeyedSubscript:@"serviceClass"];
    mach_port_t v63 = IOServiceMatching((const char *)[v62 UTF8String]);

    if (!v63)
    {
      v91 = [v15 objectForKeyedSubscript:@"serviceClass"];
      v269 = [a1 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 676, @"Failed step1 of matching \"%@\" for key \"%@\"!", v92, v93, v94, (uint64_t)v91);

      v95 = (void *)MEMORY[0x263F087E8];
      uint64_t v96 = 24;
      goto LABEL_173;
    }
    v64 = [v15 objectForKeyedSubscript:@"serviceName"];
    CFDictionarySetValue(v63, @"IONameMatch", v64);

    CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v63);
    CFRelease(v63);
    CFMutableDictionaryRef v69 = 0;
    v70 = @"service class and name";
  }
  else
  {
    uint64_t v81 = [v15 objectForKeyedSubscript:@"serviceClass"];

    if (v81)
    {
      id v82 = [v15 objectForKeyedSubscript:@"serviceClass"];
      CFDictionaryRef Copy = IOServiceMatching((const char *)[v82 UTF8String]);

      CFMutableDictionaryRef v69 = 0;
      v70 = @"service class";
    }
    else
    {
      v89 = [v15 objectForKeyedSubscript:@"serviceName"];

      if (v89)
      {
        id v90 = [v15 objectForKeyedSubscript:@"serviceName"];
        CFMutableDictionaryRef v69 = IOServiceNameMatching((const char *)[v90 UTF8String]);

        CFDictionaryRef Copy = 0;
        v70 = @"service name";
      }
      else
      {
        v97 = [v15 objectForKeyedSubscript:@"service"];

        if (v97)
        {
          id v98 = [v15 objectForKeyedSubscript:@"service"];
          CFDictionaryRef Copy = IOServiceMatching((const char *)[v98 UTF8String]);

          id v99 = [v15 objectForKeyedSubscript:@"service"];
          CFMutableDictionaryRef v69 = IOServiceNameMatching((const char *)[v99 UTF8String]);

          v70 = @"service class or name";
        }
        else
        {
          CFMutableDictionaryRef v69 = 0;
          CFDictionaryRef Copy = 0;
          v70 = @"service plane";
        }
      }
    }
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 710, @"Trying to get IO iterator with condition of \"%@\"", v66, v67, v68, (uint64_t)v70);
  if ([(__CFString *)v70 isEqualToString:@"service plane"])
  {
    *(_DWORD *)className = *MEMORY[0x263F0EC88];
    mach_error_t v100 = MEMORY[0x24C571B30](*MEMORY[0x263EF87F0], className);
    if (v100)
    {
      mach_error_t v101 = v100;
      v102 = [a1 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 736, @"Failed to get bootstrap main port for key \"%@\"!", v103, v104, v105, (uint64_t)v102);

      v106 = (void *)MEMORY[0x263F087E8];
      v107 = [NSString stringWithUTF8String:mach_error_string(v101)];
      *a5 = [v106 errorWithZhuGeErrorCode:19 underlyingError:v107];

LABEL_60:
      id v22 = v296;
      goto LABEL_48;
    }
    v293 = a1;
    mach_port_t v109 = *(_DWORD *)className;
    id v110 = [NSString stringWithFormat:@"%@:/", v290, v267, v13];
    uint64_t v111 = IORegistryEntryFromPath(v109, (const char *)[v110 UTF8String]);

    if (!v111)
    {
      v262 = [v293 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 744, @"Failed to get plane entry for key \"%@\"!", v263, v264, v265, (uint64_t)v262);

      *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:20 underlyingError:0];
      uint64_t v20 = v301;
      goto LABEL_60;
    }
    mach_error_t v112 = MEMORY[0x24C571B80](v111, [v290 UTF8String], 1, &object);
    id v22 = v296;
    if (v112)
    {
      mach_error_t v113 = v112;
      v270 = [v293 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 751, @"Failed to get io service iterator from \"%@\" for key \"%@\"!", v114, v115, v116, (uint64_t)v70);

      v117 = (void *)MEMORY[0x263F087E8];
      v118 = [NSString stringWithUTF8String:mach_error_string(v113)];
      *a5 = [v117 errorWithZhuGeErrorCode:20 underlyingError:v118];

      uint64_t v20 = v301;
      goto LABEL_48;
    }
    IOObjectRelease(v111);
    mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)className);
    uint64_t v20 = v301;
    a1 = v293;
    goto LABEL_75;
  }
  if (Copy)
  {
    mach_error_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], Copy, &object);
    if (!MatchingServices && object)
    {
      if (v69) {
        CFRelease(v69);
      }
      mach_error_t MatchingServices = 0;
      goto LABEL_73;
    }
  }
  else
  {
    mach_error_t MatchingServices = -536870212;
  }
  if (v69) {
    mach_error_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v69, &object);
  }
LABEL_73:
  if (MatchingServices || !object)
  {
    v274 = [a1 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 728, @"Failed to get io service iterator by \"%@\" for key \"%@\"!", v249, v250, v251, (uint64_t)v70);

    v252 = (void *)MEMORY[0x263F087E8];
    v253 = [NSString stringWithUTF8String:mach_error_string(MatchingServices)];
    *a5 = [v252 errorWithZhuGeErrorCode:20 underlyingError:v253];

    id v23 = 0;
    uint64_t v21 = v290;
    id v22 = v296;
    goto LABEL_17;
  }
LABEL_75:
  optionsa = v18;
  v294 = a1;
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  MEMORY[0x24C571B20](object);
  uint64_t v119 = IOIteratorNext(object);
  id v22 = v296;
  if (!v119) {
    goto LABEL_170;
  }
  uint64_t v120 = v119;
  allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v295 = v15;
  do
  {
    v121 = [NSNumber numberWithUnsignedInt:v120];
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 765, @"Trying IO service entry \"%@\"", v122, v123, v124, (uint64_t)v121);

    v125 = [v15 objectForKeyedSubscript:@"parentClass"];
    entry = v120;
    if (v125
      || ([v15 objectForKeyedSubscript:@"parentName"],
          (v125 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_80:
      parent = 0;
      memset(className, 0, sizeof(className));
      memset(name, 0, sizeof(name));
      id v126 = v22;
      if (IORegistryEntryGetParentEntry(v120, (const char *)[v126 UTF8String], &parent))
      {
        v127 = [NSNumber numberWithUnsignedInt:v120];
        v128 = [v294 key];
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 782, @"Failed to get parent entry of entry \"%@\" for key \"%@\"!", v129, v130, v131, (uint64_t)v127);
      }
      else if (IOObjectGetClass(parent, className))
      {
        v127 = [NSNumber numberWithUnsignedInt:v120];
        v128 = [v294 key];
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 788, @"Failed step1 to get parent class of entry \"%@\" for key \"%@\"!", v132, v133, v134, (uint64_t)v127);
      }
      else if (IORegistryEntryGetNameInPlane(parent, (const char *)[v126 UTF8String], name))
      {
        v127 = [NSNumber numberWithUnsignedInt:v120];
        v128 = [v294 key];
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 794, @"Failed step2 to get parent name of entry \"%@\" for key \"%@\"!", v137, v138, v139, (uint64_t)v127);
      }
      else
      {
        v165 = [NSNumber numberWithUnsignedInt:parent];
        v166 = [NSString stringWithUTF8String:className];
        v276 = [NSString stringWithUTF8String:name];
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 798, @"Parent entry is \"%@\", class is \"%@\", name is \"%@\"", v167, v168, v169, (uint64_t)v165);

        v170 = [v15 objectForKeyedSubscript:@"parentClass"];
        if (v170
          && (v171 = (void *)v170,
              [v15 objectForKeyedSubscript:@"parentName"],
              v172 = objc_claimAutoreleasedReturnValue(),
              v172,
              v171,
              v172))
        {
          v173 = [v15 objectForKeyedSubscript:@"parentClass"];
          v174 = [NSString stringWithUTF8String:className];
          if ([v173 isEqualToString:v174])
          {
            v175 = [v15 objectForKeyedSubscript:@"parentName"];
            v176 = [NSString stringWithUTF8String:name];
            v177 = [v175 isEqualToString:v176];

            v136 = @"parent class and name";
            if (v177) {
              goto LABEL_90;
            }
          }
          else
          {
          }
          v127 = [NSNumber numberWithUnsignedInt:entry];
          v128 = [v294 key];
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 803, @"Failed to match parent class and name of entry \"%@\" for key \"%@\"!", v202, v203, v204, (uint64_t)v127);
        }
        else
        {
          v182 = [v15 objectForKeyedSubscript:@"parentClass"];

          if (v182)
          {
            v183 = [v15 objectForKeyedSubscript:@"parentClass"];
            v184 = [NSString stringWithUTF8String:className];
            v185 = [v183 isEqualToString:v184];

            v136 = @"parent class";
            if (v185) {
              goto LABEL_90;
            }
            v127 = [NSNumber numberWithUnsignedInt:entry];
            v128 = [v294 key];
            ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 812, @"Failed to match parent class of entry \"%@\" for key \"%@\"!", v186, v187, v188, (uint64_t)v127);
          }
          else
          {
            v195 = [v15 objectForKeyedSubscript:@"parentName"];

            if (v195)
            {
              v196 = [v15 objectForKeyedSubscript:@"parentName"];
              v197 = [NSString stringWithUTF8String:name];
              v198 = [v196 isEqualToString:v197];

              v136 = @"parent name";
              if (v198) {
                goto LABEL_90;
              }
              v127 = [NSNumber numberWithUnsignedInt:entry];
              v128 = [v294 key];
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 821, @"Failed to match parent name of entry \"%@\" for key \"%@\"!", v199, v200, v201, (uint64_t)v127);
            }
            else
            {
              v237 = [v15 objectForKeyedSubscript:@"parent"];

              if (!v237)
              {
                v136 = @"parent check failed";
                goto LABEL_90;
              }
              v127 = [v15 objectForKeyedSubscript:@"parent"];
              v128 = [NSString stringWithUTF8String:className];
              if ([v127 isEqualToString:v128])
              {
                v136 = @"parent class or name";
                goto LABEL_89;
              }
              v238 = [v15 objectForKeyedSubscript:@"parent"];
              v239 = [NSString stringWithUTF8String:name];
              v240 = [v238 isEqualToString:v239];

              v136 = @"parent class or name";
              if (v240) {
                goto LABEL_90;
              }
              v127 = [NSNumber numberWithUnsignedInt:entry];
              v128 = [v294 key];
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 831, @"Failed to match parent class or name of entry \"%@\" for key \"%@\"!", v241, v242, v243, (uint64_t)v127);
            }
          }
        }
      }
      v136 = @"parent check failed";
LABEL_89:

LABEL_90:
      uint64_t v15 = v295;
      id v22 = v296;
      goto LABEL_91;
    }
    v135 = [v15 objectForKeyedSubscript:@"parent"];

    if (v135) {
      goto LABEL_80;
    }
    v136 = @"parent no check";
LABEL_91:
    LODWORD(v140) = entry;
    if ([(__CFString *)v136 isEqualToString:@"parent check failed"]) {
      goto LABEL_162;
    }
    *(void *)className = 0;
    CFProperties = IORegistryEntryCreateCFProperties(entry, (CFMutableDictionaryRef *)className, allocator, 0);
    if (CFProperties)
    {
      v142 = CFProperties;
      v143 = [NSNumber numberWithUnsignedInt:entry];
      mach_error_string(v142);
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 847, @"Failed to get IO properties from entry \"%@\", %s", v144, v145, v146, (uint64_t)v143);
      goto LABEL_161;
    }
    v143 = *(void **)className;
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v305 = 0u;
    id v140 = v20;
    v291 = v143;
    v288 = [v140 countByEnumeratingWithState:&v302 objects:v308 count:16];
    if (!v288)
    {
      v164 = 0;
      v298 = 0;
      v299 = 0;
      goto LABEL_152;
    }
    v147 = 0;
    v298 = 0;
    v299 = 0;
    v286 = v140;
    v287 = *(void *)v303;
    while (2)
    {
      v148 = 0;
      v280 = v147 + v288;
      v281 = v147;
      do
      {
        if (*(void *)v303 != v287) {
          objc_enumerationMutation(v140);
        }
        v149 = *(void *)(*((void *)&v302 + 1) + 8 * v148);
        v150 = [v140 objectForKeyedSubscript:v149];
        v151 = [v143 objectForKeyedSubscript:v149];

        if (!v151)
        {
          v178 = [NSNumber numberWithUnsignedInt:entry];
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 860, @"\"%@\" doesn't exist in entry \"%@\"", v179, v180, v181, v149);
          goto LABEL_146;
        }
        if ([v150 hasPrefix:@"number:"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v152 = [v150 substringFromIndex:objc_msgSend(@"number:", "length")];

            v153 = objc_alloc_init(MEMORY[0x263F08A30]);
            v154 = [v153 numberFromString:v152];

            if (![v154 isEqualToNumber:v151])
            {
              v271 = [NSNumber numberWithUnsignedInt:entry];
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 876, @"NSNumber \"%@\" of entry \"%@\" is %@ while expecting %@", v192, v193, v194, v149);

              v298 = v154;
LABEL_144:
              v150 = v152;
              goto LABEL_150;
            }

            v298 = v154;
            v299 = v151;
            goto LABEL_122;
          }
          v178 = [NSNumber numberWithUnsignedInt:entry];
          objc_opt_class();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 867, @"\"%@\" of entry \"%@\" is class %@ while expecting NSNumber", v189, v190, v191, v149);
LABEL_146:

          goto LABEL_151;
        }
        if (![v150 hasPrefix:@"BOOL:"])
        {
          if ([v150 hasPrefix:@"data:"])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v178 = [NSNumber numberWithUnsignedInt:entry];
              objc_opt_class();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 901, @"\"%@\" of entry \"%@\" is class %@ while expecting NSData", v211, v212, v213, v149);
              goto LABEL_146;
            }
            v299 = [NSString stringFromData:v151];

            v157 = [v150 substringFromIndex:objc_msgSend(@"data:", "length")];

            if (!v157)
            {
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 909, @"\"%@\" is not a valid data criterion", v158, v159, v160, (uint64_t)v150);
              v298 = 0;
              v151 = v299;
              goto LABEL_151;
            }
            v151 = v299;
            if (([v157 isEqualToString:v299] & 1) == 0)
            {
              v217 = [NSNumber numberWithUnsignedInt:entry];
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 914, @"NSData \"%@\" of entry \"%@\" is %@ while expecting %@", v218, v219, v220, v149);
              goto LABEL_149;
            }
          }
          else
          {
            if (![v150 hasPrefix:@"string:"]) {
              goto LABEL_151;
            }
            v157 = [v150 substringFromIndex:objc_msgSend(@"string:", "length")];

            if (([v157 isEqualToString:v151] & 1) == 0)
            {
              v217 = [NSNumber numberWithUnsignedInt:entry];
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 922, @"NSString \"%@\" of entry \"%@\" is %@ while expecting %@", v214, v215, v216, v149);
LABEL_149:

              v298 = v157;
LABEL_150:
              id v22 = v296;
LABEL_151:

              v164 = v281 + v148;
              v299 = v151;
              uint64_t v15 = v295;
              uint64_t v20 = v301;
              v143 = v291;
              id v140 = v286;
              goto LABEL_152;
            }
            v299 = v151;
          }
          v298 = v157;
          v152 = v150;
          goto LABEL_122;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v178 = [NSNumber numberWithUnsignedInt:entry];
          objc_opt_class();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 882, @"\"%@\" of entry \"%@\" is class %@ while expecting BOOL<NSNumber>", v205, v206, v207, v149);
          goto LABEL_146;
        }
        v152 = [v150 substringFromIndex:objc_msgSend(@"BOOL:", "length")];

        v155 = [v152 lowercaseString];
        if ([v155 isEqualToString:@"yes"])
        {

          v156 = (void *)MEMORY[0x263EFFA88];
        }
        else
        {
          v161 = [v152 lowercaseString];
          v300 = [v161 isEqualToString:@"true"];

          if (v300) {
            v156 = (void *)MEMORY[0x263EFFA88];
          }
          else {
            v156 = (void *)MEMORY[0x263EFFA80];
          }
        }

        v162 = [v156 BOOLValue];
        if (v162 != [v151 BOOLValue])
        {
          v272 = [NSNumber numberWithUnsignedInt:entry];
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 895, @"BOOL \"%@\" of entry \"%@\" is %@ while expecting %@", v208, v209, v210, v149);

          v298 = v156;
          goto LABEL_144;
        }
        v298 = v156;
        v299 = v151;
LABEL_122:

        ++v148;
        uint64_t v15 = v295;
        id v22 = v296;
        v143 = v291;
        id v140 = v286;
      }
      while (v288 != v148);
      v163 = [v286 countByEnumeratingWithState:&v302 objects:v308 count:16];
      v164 = v280;
      v147 = v280;
      uint64_t v20 = v301;
      v288 = v163;
      if (v163) {
        continue;
      }
      break;
    }
LABEL_152:
    v221 = v164;

    if ([v140 count] == v221)
    {
      if (v282)
      {
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 941, @"Checking in self node for property \"%@\"", v222, v223, v224, (uint64_t)v8);
        v225 = [v143 objectForKeyedSubscript:v8];
        id v140 = (id)entry;
      }
      else
      {
        v230 = [NSNumber numberWithUnsignedInt:entry];
        v279 = [NSNumber numberWithUnsignedInt:optionsa];
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 944, @"Checking entry \"%@\", plane \"%@\" for property \"%@\" with direction %@,", v231, v232, v233, (uint64_t)v230);

        v143 = v291;
        id v140 = (id)entry;
        v225 = (void *)IORegistryEntrySearchCFProperty(entry, (const char *)[v290 UTF8String], v8, allocator, optionsa);
      }
      if (v225)
      {
        [v23 addObject:v225];
      }
      else
      {
        v273 = [NSNumber numberWithUnsignedInt:v140];
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 949, @"No property \"%@\" in entry \"%@\"", v234, v235, v236, (uint64_t)v8);

        LODWORD(v140) = entry;
      }
    }
    else
    {
      v226 = v221;
      v225 = [NSNumber numberWithUnsignedInt:entry];
      v289 = [NSNumber numberWithInt:(v226 + 1)];
      v277 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v140, "count"));
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 933, @"Entry \"%@\" failed check at %@/%@", v227, v228, v229, (uint64_t)v225);

      v143 = v291;
      LODWORD(v140) = entry;
    }
LABEL_161:

LABEL_162:
    IOObjectRelease((io_object_t)v140);
    uint64_t v120 = IOIteratorNext(object);
  }
  while (v120);
LABEL_170:
  v244 = [v23 count];
  if (v244 == 1)
  {
    v254 = [v23 objectAtIndexedSubscript:0];

    v275 = [v294 key];
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 965, @"Found 1 property \"%@\" for key \"%@\" with non-fullPath", v255, v256, v257, (uint64_t)v8);

    id v23 = (id)v254;
  }
  else if (v244)
  {
    v258 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v278 = [v294 key];
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 969, @"Found %@ property \"%@\" for key \"%@\" with non-fullPath", v259, v260, v261, (uint64_t)v258);
  }
  else
  {

    v245 = [v294 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]", 959, @"Failed to find a non-fullPath service for key \"%@\"", v246, v247, v248, (uint64_t)v245);

    v95 = (void *)MEMORY[0x263F087E8];
    uint64_t v96 = 21;
LABEL_173:
    [v95 errorWithZhuGeErrorCode:v96 underlyingError:0];
    id v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_177:
  uint64_t v21 = v290;
LABEL_17:
  if (object)
  {
    IOObjectRelease(object);
    object = 0;
  }

  return v23;
}

+ (id)querySysctlVariableName:(id)a3 dataType:(id)a4 withError:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v11 = a4;
  memset(v25, 0, sizeof(v25));
  size_t v24 = 128;
  if (a5)
  {
    *a5 = 0;
    if (v7)
    {
      id v12 = v7;
      if (sysctlbyname((const char *)[v12 UTF8String], v25, &v24, 0, 0) != -1)
      {
        uint64_t v13 = [v11 lowercaseString];
        int v14 = [v13 isEqualToString:@"number"];

        if (v14) {
          objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)&v25[0]);
        }
        else {
        uint64_t v15 = [NSString stringWithUTF8String:v25];
        }
        goto LABEL_12;
      }
      __error();
      int v18 = __error();
      strerror(*v18);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysctlVariableName:dataType:withError:]", 1007, @"Cannot look up \"%@\". System errno=%d errstr=%s", v19, v20, v21, (uint64_t)v12);
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = 61;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysctlVariableName:dataType:withError:]", 999, @"name pointer is nil!", v8, v9, v10, v23);
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = 45;
    }
    [v16 errorWithZhuGeErrorCode:v17 underlyingError:0];
    uint64_t v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysctlVariableName:dataType:withError:]", 993, @"error p-pointer is nil!", v8, v9, v10, v23);
    uint64_t v15 = 0;
  }
LABEL_12:

  return v15;
}

+ (id)ZhuGeToDo:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (a4)
  {
    *a4 = 0;
    if (v5)
    {
      id v18 = 0;
      uint64_t v10 = MGQuery(v5, &v18);
      id v14 = v18;
      if (v10) {
        goto LABEL_8;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory ZhuGeToDo:withError:]", 1047, @"Failed to retrive value for \"%@\" from MobileGestalt!", v11, v12, v13, (uint64_t)v9);
      id v15 = v14;
      id v14 = v15;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory ZhuGeToDo:withError:]", 1039, @"name pointer is nil!", v6, v7, v8, v17);
      id v15 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v14 = 0;
      uint64_t v10 = 0;
    }
    *a4 = v15;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory ZhuGeToDo:withError:]", 1033, @"error p-pointer is nil!", v6, v7, v8, v17);
    id v14 = 0;
    uint64_t v10 = 0;
  }
LABEL_8:

  return v10;
}

+ (id)queryIOCameraByProperty:(id)a3 withError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = v6;
  v31[2] = xmmword_265234B78;
  v31[3] = *(_OWORD *)off_265234B88;
  uint64_t v32 = @"AppleH16CamIn";
  v31[0] = xmmword_265234B58;
  v31[1] = *(_OWORD *)&off_265234B68;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      uint64_t v29 = a4;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 64;
      while (1)
      {
        id v14 = v11;

        uint64_t v15 = *(void *)((char *)v31 + v13);
        uint64_t v11 = [NSString stringWithFormat:@"%s://%@/%@", "IOService", v15, v10];

        id v30 = 0;
        id v16 = [a1 queryIOPropertyFromPath:v11 andCriteria:&unk_26FC367C8 withError:&v30];
        id v17 = v30;
        uint64_t v12 = v17;
        if (v16) {
          break;
        }
        id v28 = [v17 ZhuGeDescription];
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]", 1665, @"Failed to query property for %@, error %@", v18, v19, v20, v15);

        v13 -= 8;
        if (v13 == -8)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]", 1669, @"Failed to query property %@! after trying all methods", v21, v22, v23, (uint64_t)v10);
          [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:63 underlyingError:0];
          id v16 = 0;
          *uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
          break;
        }
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]", 1648, @"property pointer is nil!", v7, v8, v9, v27);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      uint64_t v12 = 0;
      id v16 = 0;
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]", 1642, @"error p-pointer is nil!", v7, v8, v9, v27);
    uint64_t v12 = 0;
    id v16 = 0;
    uint64_t v11 = 0;
  }
  id v24 = v16;
  for (uint64_t i = 64; i != -8; i -= 8)

  return v24;
}

+ (id)queryScreenSerialNumberByProperty:(id)a3 withError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = v6;
  v37[0] = 0;
  v37[1] = 0;
  __int16 v38 = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1693, @"error p-pointer is nil!", v7, v8, v9, v30);
    id v14 = 0;
    id v16 = 0;
    uint64_t v13 = 0;
    uint64_t v25 = 0;
    goto LABEL_12;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1699, @"property pointer is nil!", v7, v8, v9, v30);
    id v24 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v14 = 0;
    id v16 = 0;
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  uint64_t v35 = @"basic";
  uint64_t v33 = @"path";
  uint64_t v11 = [NSString stringWithFormat:@"%s:/%@"];
  v34 = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  uint64_t v36 = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

  id v32 = 0;
  id v14 = [a1 queryIOProperty:@"panel-serial-number" fromCriteria:v13 withError:&v32];
  id v15 = v32;
  id v16 = v15;
  if (!v14)
  {
    id v31 = v15;
    id v14 = [a1 queryIOProperty:v10 fromCriteria:v13 withError:&v31];
    id v17 = v31;

    if (!v14)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1717, @"Failed to query property %@! after trying all methods", v18, v19, v20, (uint64_t)v10);
      id v24 = v17;
      id v16 = v24;
      goto LABEL_10;
    }
    id v16 = v17;
  }
  if ((unint64_t)[v14 length] <= 0x11)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1723, @"The size of %@(less than %d) isn't correct: %@!", v21, v22, v23, (uint64_t)v10);
    id v24 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:37 underlyingError:0];
LABEL_10:
    uint64_t v25 = 0;
LABEL_11:
    *a4 = v24;
    goto LABEL_12;
  }
  [v14 getBytes:v37 length:18];
  uint64_t v25 = (void *)[[NSString alloc] initWithBytes:v37 length:18 encoding:4];
  if (!v25)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1732, @"Failed to get ScreenSerialNumber", v27, v28, v29, (uint64_t)"IODeviceTree");
    id v24 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:10 underlyingError:0];
    goto LABEL_11;
  }
LABEL_12:

  return v25;
}

+ (id)queryWLHWIdentifierInfoByProperty:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = [NSDictionary dictionaryWithObjectsAndKeys:@"C"];
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1770, @"error p-pointer is nil!", v7, v8, v9, @"ChipNumber");
    uint64_t v20 = 0;
    uint64_t v11 = 0;
    uint64_t v19 = 0;
    id v15 = 0;
    goto LABEL_14;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1776, @"property pointer is nil!", v7, v8, v9, @"ChipNumber");
    id v31 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    uint64_t v20 = 0;
    uint64_t v11 = 0;
    uint64_t v19 = 0;
    id v15 = 0;
LABEL_13:
    *a4 = v31;
    goto LABEL_14;
  }
  id v34 = 0;
  uint64_t v11 = [a1 queryIOProperty:@"HWIdentifiers" fromCriteria:&unk_26FC36818 withError:&v34];
  id v15 = v34;
  if (!v11)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1790, @"Failed to query WLHWIdentifier for property %@, no matching key found in %s", v12, v13, v14, (uint64_t)v6);
    id v31 = v15;
    id v15 = v31;
LABEL_12:
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1796, @"Failed to query WLHWIdentifier due to mismatch data type, data read %@", v16, v17, v18, (uint64_t)v11);
    id v31 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:38 underlyingError:0];
    goto LABEL_12;
  }
  uint64_t v19 = [v10 objectForKey:v6];
  uint64_t v20 = [v11 objectForKey:v19];

  if (!v20)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1804, @"No data for property %@, field %@", v21, v22, v23, (uint64_t)v6);
    id v31 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
    goto LABEL_13;
  }
  id v24 = [v11 objectForKey:v19];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v26 = NSString;
    uint64_t v27 = [v11 objectForKey:v19];
    uint64_t v20 = objc_msgSend(v26, "stringWithFormat:", @"%d", objc_msgSend(v27, "intValue"));
  }
  else
  {
    uint64_t v20 = [v11 objectForKey:v19];
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1815, @"Read %@, field %@, output %@", v28, v29, v30, (uint64_t)v6);
LABEL_14:
  id v32 = v20;

  return v32;
}

+ (id)queryWLModuleSerialNumberWithError:(id *)a3
{
  id v22 = 0;
  v4 = [a1 queryIOProperty:@"wifi-module-sn" fromCriteria:&unk_26FC36868 withError:&v22];
  id v8 = v22;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [NSString hexStringFromData:v4];
      uint64_t v10 = [v9 uppercaseString];

      if ([v10 length] == 12)
      {
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:output %@"], v11, v12, v13, (uint64_t)v10);
        goto LABEL_10;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:]", 1855, @"Unexpected length of wifi-module-sn: %@, expecting length %d", v11, v12, v13, (uint64_t)v10);

      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = 37;
    }
    else
    {
      uint64_t v15 = objc_opt_class();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:data %@"], v16, v17, v18, v15);
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = 38;
    }
    id v14 = [v19 errorWithZhuGeErrorCode:v20 underlyingError:0];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:]", 1842, @"Failed to query wifi-module-sn from ioreg path %@!", v5, v6, v7, 0);
    id v14 = v8;
  }
  uint64_t v10 = 0;
  *a3 = v14;
LABEL_10:

  return v10;
}

+ (id)querySecureElementIDWithError:(id *)a3
{
  long long v52 = xmmword_247F77490;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__0;
  uint64_t v50 = __Block_byref_object_dispose__0;
  id v51 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2222, @"error p-pointer is nil!", v3, v4, v5, v33);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  *a3 = 0;
  if (isZhuGeInRestoreOS())
  {
    if (MEMORY[0x263F8C670])
    {
      if (!NfRestoreSEList() && BYTE12(v52))
      {
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = (void *)v52;
        goto LABEL_18;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2240, @"Failed to query Secure Element ID!", v28, v29, v30, v33);
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:36 underlyingError:0];
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2231, @"Failed to weak link libnfrestore.dylib, NfRestoreSEList isn't available!", v7, v8, v9, v33);
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:13 underlyingError:0];
    }
  }
  else
  {
    if (objc_opt_class() && objc_opt_class())
    {
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __66__AppleDeviceQueryKeysActionArmory_querySecureElementIDWithError___block_invoke;
      v36[3] = &unk_265234BA8;
      __int16 v38 = &v46;
      uint64_t v39 = &v40;
      uint64_t v11 = v17;
      uint64_t v37 = v11;
      uint64_t v12 = (void *)MEMORY[0x24C572150](v36);
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2258, @"Before invoking sharedHardwareManager() from NearField Framework", v18, v19, v20, v33);
      [MEMORY[0x263F58110] sharedHardwareManager:v12];
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2260, @"After invoking sharedHardwareManager() from NearField Framework", v21, v22, v23, v34);
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v27 = (void *)v47[5];
      if (v27)
      {
        uint64_t v13 = [v27 serialNumber];
      }
      else
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2265, @"Failed to retrieve Secure Element!", v24, v25, v26, v35);
        [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:36 underlyingError:v41[5]];
        uint64_t v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_18;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]", 2245, @"Failed to weak link near field framework!", v14, v15, v16, v33);
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:13 underlyingError:0];
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  *a3 = v10;
LABEL_18:
  id v31 = v13;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v31;
}

void __66__AppleDeviceQueryKeysActionArmory_querySecureElementIDWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]_block_invoke", 2252, @"Entering aHWManagerReady callback", a6, a7, a8, v16);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [MEMORY[0x263F58130] embeddedSecureElementWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySecureElementIDWithError:]_block_invoke", 2255, @"Exiting aHWManagerReady callback", v13, v14, v15, v17);
}

+ (id)queryNFSecureElementByKey:(id)a3 WithError:(id *)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v9 = v5;
  __int16 v62 = 0;
  memset(v61, 0, sizeof(v61));
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__0;
  uint64_t v59 = __Block_byref_object_dispose__0;
  id v60 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  long long v52 = __Block_byref_object_copy__0;
  uint64_t v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2372, @"error p-pointer is nil!", v6, v7, v8, v43);
    uint64_t v17 = 0;
LABEL_8:
    uint64_t v18 = 0;
    goto LABEL_34;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2378, @"nfKey pointer is nil!", v6, v7, v8, v43);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    goto LABEL_32;
  }
  if (([&unk_26FC37290 containsObject:v5] & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2384, @"Unknown SE Type \"%@\"!", v10, v11, v12, (uint64_t)v9);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:70 underlyingError:0];
    goto LABEL_32;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2389, @"Querying %@ of Secure Element.", v10, v11, v12, (uint64_t)v9);
  if (isZhuGeInRestoreOS())
  {
    if (!MEMORY[0x263F8C668])
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2399, @"Failed to weak link libnfrestore.dylib, NfRestoreSEEnumerate isn't available!", v13, v14, v15, v44);
      id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:13 underlyingError:0];
LABEL_32:
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      goto LABEL_33;
    }
    if (NfRestoreSEEnumerate())
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2406, @"Failed to query \"%@\"!", v31, v32, v33, (uint64_t)v9);
      id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:36 underlyingError:0];
      goto LABEL_32;
    }
    if ([v9 isEqualToString:@"jcopSESN"])
    {
      unsigned int v37 = LOBYTE(v61[0]);
      __int16 v38 = (char *)v61 + 1;
    }
    else
    {
      if (![v9 isEqualToString:@"systemSESN"]) {
        goto LABEL_31;
      }
      unsigned int v37 = BYTE9(v61[1]);
      __int16 v38 = (char *)&v61[1] + 10;
    }
    if (v37)
    {
      uint64_t v39 = NSString;
      uint64_t v40 = [MEMORY[0x263EFF8F8] dataWithBytes:v38 length:v37];
      uint64_t v17 = [v39 hexStringFromData:v40];

      goto LABEL_8;
    }
LABEL_31:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2420, @"Failed to get valid data for \"%@\" in restoreOS!", v34, v35, v36, (uint64_t)v9);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:36 underlyingError:0];
    goto LABEL_32;
  }
  if (!objc_opt_class() || !objc_opt_class())
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2432, @"Failed to weak link near field framework!", v19, v20, v21, v44);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:13 underlyingError:0];
    goto LABEL_32;
  }
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  uint64_t v23 = (void *)MEMORY[0x263F58110];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __72__AppleDeviceQueryKeysActionArmory_queryNFSecureElementByKey_WithError___block_invoke;
  v45[3] = &unk_265234BA8;
  uint64_t v47 = &v55;
  uint64_t v48 = &v49;
  uint64_t v18 = v22;
  uint64_t v46 = v18;
  [v23 sharedHardwareManager:v45];

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (v56[5])
  {
    if ([v9 isEqualToString:@"jcopSESN"])
    {
      uint64_t v27 = [(id)v56[5] serialNumber];
    }
    else
    {
      if (![v9 isEqualToString:@"systemSESN"])
      {
LABEL_25:
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2461, @"Failed to get valid data for \"%@\" in bootedOS!", v28, v29, v30, (uint64_t)v9);
        id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:36 underlyingError:0];
        goto LABEL_26;
      }
      uint64_t v27 = [(id)v56[5] systemOSSerialNumber];
    }
    uint64_t v17 = (void *)v27;
    if (v27) {
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]", 2449, @"Failed to retrieve Secure Element!", v24, v25, v26, v44);
  id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:36 underlyingError:v50[5]];
LABEL_26:
  uint64_t v17 = 0;
LABEL_33:
  *a4 = v16;
LABEL_34:
  id v41 = v17;
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);

  return v41;
}

void __72__AppleDeviceQueryKeysActionArmory_queryNFSecureElementByKey_WithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]_block_invoke", 2440, @"Entering aHWManagerReady callback", a6, a7, a8, v16);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [MEMORY[0x263F58130] embeddedSecureElementWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryNFSecureElementByKey:WithError:]_block_invoke", 2443, @"Exiting aHWManagerReady callback", v13, v14, v15, v17);
}

+ (id)queryDisplayUniqueChipIDWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0;
    id v15 = 0;
    uint64_t v7 = [a1 queryIOProperty:@"ecid" fromCriteria:&unk_26FC368E0 withError:&v15];
    id v11 = v15;
    if (v7)
    {
      uint64_t v12 = [NSNumber integerFromData:v7 size:8 truncate:1 isSigned:0 needSwap:0];
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryDisplayUniqueChipIDWithError:]", 2501, @"Failed to query IO property \"ecid\" for TCON!", v8, v9, v10, v14);
      id v11 = v11;
      uint64_t v12 = 0;
      *a3 = v11;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryDisplayUniqueChipIDWithError:]", 2483, @"error p-pointer is nil!", v3, v4, v5, v14);
    uint64_t v7 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)querySysCfgKey:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]", 2528, @"error p-pointer is nil!", v6, v7, v8, v25);
    id v10 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_15;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]", 2534, @"key pointer is nil!", v6, v7, v8, v25);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v10 = 0;
    id v14 = 0;
LABEL_13:
    id v15 = 0;
    goto LABEL_14;
  }
  id v26 = 0;
  MGQuery(@"SysCfgDict", &v26);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v26;
  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]", 2542, @"Failed to get sysconfig dictionary!", v11, v12, v13, v25);
    id v16 = v14;
    id v14 = v16;
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"all"])
  {
    id v10 = v10;
    id v15 = v10;
    goto LABEL_15;
  }
  if ([v9 length] != 4)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]", 2554, @"Length of sysconfig key %@ is wrong, expecting 4!", v21, v22, v23, (uint64_t)v20);

    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:37 underlyingError:0];
    goto LABEL_13;
  }
  id v15 = [v10 objectForKeyedSubscript:v9];
  if (v15) {
    goto LABEL_15;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]", 2561, @"Failed to read \"%@\" from sysconfig dictionary", v17, v18, v19, (uint64_t)v9);
  id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:60 underlyingError:0];
LABEL_14:
  *a4 = v16;
LABEL_15:

  return v15;
}

+ (id)queryThreadRadioMacAddressForProvisioningWithError:(id *)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = a3;
    *a3 = 0;
    if ([&unk_26FC372A8 count])
    {
      uint64_t v26 = (uint64_t)v6;
      uint64_t v8 = 0;
      id v9 = 0;
      id v10 = 0;
      while (1)
      {
        uint64_t v11 = v10;
        uint64_t v31 = @"basic";
        uint64_t v12 = v9;
        v29[0] = @"servicePlane";
        v29[1] = @"serviceName";
        v30[0] = @"IODeviceTree";
        uint64_t v13 = objc_msgSend(&unk_26FC372A8, "objectAtIndexedSubscript:", v8, v26);
        v30[1] = v13;
        id v14 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        v32[0] = v14;
        id v10 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];

        id v28 = v12;
        id v15 = [a1 queryIOProperty:@"local-mac-address" fromCriteria:v10 withError:&v28];
        id v9 = v28;

        if (v15) {
          break;
        }
        if ([&unk_26FC372A8 count] <= (unint64_t)++v8)
        {
          id v15 = 0;
          uint64_t v6 = (id *)v26;
          goto LABEL_9;
        }
      }
      if ([v15 length]) {
        uint64_t v19 = [v15 length];
      }
      else {
        uint64_t v19 = 8;
      }
      uint64_t v6 = (id *)v26;
    }
    else
    {
      id v9 = 0;
      id v10 = 0;
      id v15 = 0;
LABEL_9:
      uint64_t v19 = 8;
    }
    id v27 = v9;
    uint64_t v20 = [a1 querySysCfgKey:@"TMac" withError:&v27];
    id v18 = v27;

    if (v20)
    {
      id v24 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v16 = v20;
      uint64_t v17 = objc_msgSend(v24, "initWithBytes:length:", objc_msgSend(v16, "bytes"), v19);
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddressForProvisioningWithError:]", 2610, @"Failed to get TMac from sysconfig dictionary!", v21, v22, v23, v26);
      id v18 = v18;
      id v16 = 0;
      uint64_t v17 = 0;
      *uint64_t v6 = v18;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddressForProvisioningWithError:]", 2585, @"error p-pointer is nil!", v3, v4, v5, v26);
    id v15 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
    id v10 = 0;
    id v18 = 0;
  }

  return v17;
}

+ (id)queryThreadRadioMacAddress64BitWithError:(id *)a3
{
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddress64BitWithError:]", 2632, @"error p-pointer is nil!", v3, v4, v5, v18);
    id v12 = 0;
    id v11 = 0;
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  *a3 = 0;
  id v19 = 0;
  uint64_t v7 = [a1 queryThreadRadioMacAddressForProvisioningWithError:&v19];
  id v11 = v19;
  if (v7)
  {
    if ([v7 length] == 6)
    {
      HIWORD(v18) = -257;
      BYTE4(v18) = 0;
      WORD1(v18) = 0;
      id v12 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:8];
      [v7 getBytes:(char *)&v18 + 2 length:3];
      objc_msgSend(v12, "replaceBytesInRange:withBytes:", 0, 3, (char *)&v18 + 2);
      objc_msgSend(v12, "replaceBytesInRange:withBytes:", 3, 2, (char *)&v18 + 6);
      objc_msgSend(v7, "getBytes:range:", (char *)&v18 + 2, 3, 3);
      objc_msgSend(v12, "replaceBytesInRange:withBytes:", 5, 3, (char *)&v18 + 2);
      goto LABEL_11;
    }
    if ([v7 length] == 8)
    {
      id v12 = v7;
      uint64_t v7 = v12;
      goto LABEL_11;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddress64BitWithError:]", 2668, @"TMac in sysconfig dictionary is with invalid length.", v14, v15, v16, v18);
    id v13 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:60 underlyingError:0];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddress64BitWithError:]", 2640, @"Failed to get TMac from sysconfig dictionary!", v8, v9, v10, v18);
    id v13 = v11;
    id v11 = v13;
  }
  id v12 = 0;
  *a3 = v13;
LABEL_11:

  return v12;
}

+ (id)queryVinylEUICCCSNwithError:(id *)a3
{
  v48[2] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryVinylEUICCCSNwithError:]", 2689, @"error p-pointer is nil!", v3, v4, v5, v44);
    id v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  *a3 = 0;
  if (isZhuGeInRestoreOS())
  {
    if (MEMORY[0x263F8BDE8])
    {
      id v45 = @"DebugArgs";
      uint64_t v46 = @"-l 0xFFFFFFFF -v 99";
      v47[0] = @"BasebandUpdater";
      id v24 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      v47[1] = @"UpdateBaseband";
      v48[0] = v24;
      v48[1] = MEMORY[0x263EFFA88];
      uint64_t v25 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];

      uint64_t v26 = VinyleUICCPerformOperation();
      if (v26)
      {
        uint64_t v27 = v26;
        id v28 = [NSNumber numberWithUnsignedInt:v26];
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryVinylEUICCCSNwithError:]", 2717, @"Failed to get response from eUICC operation! Error code: %@", v29, v30, v31, (uint64_t)v28);

        uint64_t v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v33 = NSString;
        uint64_t v34 = [NSNumber numberWithUnsignedInt:v27];
        uint64_t v35 = [v33 stringWithFormat:@"Vinyl error code: %@", v34];
        *a3 = [v32 errorWithZhuGeErrorCode:4 underlyingError:v35];

        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v34 = 0;
        uint64_t v14 = [0 objectForKeyedSubscript:@"EID"];

        if (v14)
        {
          uint64_t v14 = [0 objectForKeyedSubscript:@"EID"];
        }
        else
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryVinylEUICCCSNwithError:]", 2725, @"Didn't find EID from response of eUICC operation!", v40, v41, v42, v44);
          *a3 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
        }
      }

      id v13 = 0;
      goto LABEL_16;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryVinylEUICCCSNwithError:]", 2698, @"Failed to weak link libVinylNonUpdater.dylib, VinyleUICCPerformOperation isn't available!", v8, v9, v10, v44);
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 13;
  }
  else
  {
    uint64_t v15 = +[AppleDeviceQuerySingletonArmory sharedInstance];
    uint64_t v16 = [v15 helper];
    uint64_t v17 = [v16 keysConfig];
    uint64_t v18 = [a1 key];
    id v13 = [v17 objectForKeyedSubscript:v18];

    if (v13)
    {
      id v19 = [v13 objectForKeyedSubscript:@"CACHEABLE"];
      uint64_t v20 = [v19 BOOLValue];

      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryVinylEUICCCSNwithError:]", 2743, @"ZhuGeBasebandFirmwareUpdateInfo query:%@ isCachable:%s", v21, v22, v23, @"kVinylFwUpdateCsn");
      uint64_t v14 = +[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory query:@"kVinylFwUpdateCsn" isCachable:v20 withError:a3];
      goto LABEL_16;
    }
    uint64_t v36 = [a1 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryVinylEUICCCSNwithError:]", 2737, @"Did not find config of key %@", v37, v38, v39, (uint64_t)v36);

    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 29;
  }
  [v11 errorWithZhuGeErrorCode:v12 underlyingError:0];
  id v13 = 0;
  uint64_t v14 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v14;
}

+ (id)queryBasebandFirmwareSecurityInfo:(id)a3 withError:(id *)a4
{
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = +[AppleDeviceQuerySingletonArmory sharedInstance];
    id v11 = [v10 helper];
    uint64_t v12 = [v11 keysConfig];
    id v13 = [a1 key];
    uint64_t v14 = [v12 objectForKeyedSubscript:v13];

    if (v14)
    {
      uint64_t v15 = [v14 objectForKeyedSubscript:@"CACHEABLE"];
      uint64_t v16 = [v15 BOOLValue];

      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryBasebandFirmwareSecurityInfo:withError:]", 2774, @"ZhuGeBasebandFirmwareSecurityInfo query:%@ forceCacheable:%s", v17, v18, v19, (uint64_t)v9);
      uint64_t v20 = +[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory query:v9 forceCacheable:v16 withError:a4];
    }
    else
    {
      uint64_t v21 = [a1 key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryBasebandFirmwareSecurityInfo:withError:]", 2768, @"did not find config of key %@", v22, v23, v24, (uint64_t)v21);

      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
      uint64_t v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryBasebandFirmwareSecurityInfo:withError:]", 2759, @"error pointer is nil", v6, v7, v8, v26);
    uint64_t v20 = 0;
  }

  return v20;
}

+ (id)queryMogulIDSN:(id)a3 withError:(id *)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v9 = v5;
  int v70 = 2;
  uint64_t v68 = 0;
  CFMutableDictionaryRef v69 = 0;
  CFTypeRef cf = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]", 3044, @"error p-pointer is nil!", v6, v7, v8, (uint64_t)outputStruct);
    id v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]", 3049, @"key pointer is nil", v6, v7, v8, (uint64_t)outputStruct);
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = 45;
LABEL_16:
    [v13 errorWithZhuGeErrorCode:v14 underlyingError:0];
    id v11 = 0;
    uint64_t v12 = 0;
    id v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ([v5 isEqualToString:@"mogulAce3"])
  {
    int v10 = 0;
    goto LABEL_9;
  }
  if (([v9 isEqualToString:@"mogulTopModule"] & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]", 3061, @"Unknown Mogul Type", v15, v16, v17, (uint64_t)outputStruct);
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = 38;
    goto LABEL_16;
  }
  int v10 = 1;
LABEL_9:
  int v70 = v10;
  if (!readPropertyFromMogulService(v10, "AppleAuthCPAID", @"IDSN", &cf))
  {
    if (readPropertyFromMogulService(v10, "AppleAuthCP", @"IDSN", &cf))
    {
      uint64_t v21 = @"Successfully read IDSN from AppleAuthCP I2C service.";
      uint64_t v22 = 2933;
      goto LABEL_13;
    }
    uint64_t v68 = isMogulService;
    CFMutableDictionaryRef v69 = &v70;
    mach_port_t IOConnection = getIOConnection(MEMORY[0x263F0EC28], @"IOPortTransportAIDBus", &v68, 1, a4);
    if (!IOConnection)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]", 3078, @"Failed to get a connection for AID Bus!", v31, v32, v33, (uint64_t)outputStruct);
      id v11 = 0;
      goto LABEL_14;
    }
    io_connect_t v34 = IOConnection;
    __int16 v75 = 0;
    size_t v74 = 2;
    *(_DWORD *)&v73[3] = 0;
    *(_DWORD *)id v73 = 0;
    size_t v72 = 7;
    uint64_t input = 5000;
    uint64_t v77 = 0x60100000102E2;
    char v78 = 6;
    char inputStruct = -102;
    mach_error_t v35 = IOConnectCallMethod(IOConnection, 4u, &input, 1u, &inputStruct, 1uLL, 0, 0, &v75, &v74);
    if (v35)
    {
      uint64_t v39 = mach_error_string(v35);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 2978, @"Mogul is not ready via AID, result: %s", v40, v41, v42, (uint64_t)v39);
LABEL_33:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]", 3083, @"Failed to read IDSN via AID", v43, v44, v45, (uint64_t)outputStructa);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:0];
      id v28 = 0;
      uint64_t v12 = 0;
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
      IOServiceClose(v34);
      goto LABEL_17;
    }
    if (v75 == 155)
    {
      mach_error_t v46 = IOConnectCallMethod(v34, 4u, &input, 1u, &v77, 9uLL, 0, 0, v73, &v72);
      if (v46)
      {
        uint64_t v47 = mach_error_string(v46);
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 2989, @"failed to read IDSN data via AID, result: %s", v48, v49, v50, (uint64_t)v47);
        goto LABEL_33;
      }
      if (v73[0] == 227)
      {
        mach_error_t v53 = IOConnectCallMethod(v34, 4u, &input, 1u, &inputStruct, 1uLL, 0, 0, &v75, &v74);
        if (v53)
        {
          uint64_t v57 = mach_error_string(v53);
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 2999, @"cannot get error code, result: %s", v58, v59, v60, (uint64_t)v57);
          goto LABEL_33;
        }
        if (v75 != 155)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 3003, @"failed to get errorcode response: %x", v54, v55, v56, v75);
          goto LABEL_33;
        }
        if (HIBYTE(v75))
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 3007, @"read IDSN failed, errorcode: %x", v54, v55, v56, HIBYTE(v75));
          goto LABEL_33;
        }
        uint64_t v61 = malloc_type_calloc(1uLL, 6uLL, 0xE156FD29uLL);
        if (v61)
        {
          id v28 = v61;
          int v62 = *(_DWORD *)&v73[1];
          *((_WORD *)v61 + 2) = *(_WORD *)&v73[5];
          *uint64_t v61 = v62;
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 3018, @"success read idsnData, first byte: %x", v36, v37, v38, v62);
          uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v28 length:6];
          uint64_t v63 = [NSString hexStringFromData:v12];
          id v11 = [v63 uppercaseString];

          goto LABEL_34;
        }
        uint64_t v51 = @"cannot allocate space for idsn data";
        uint64_t v52 = 3013;
      }
      else
      {
        uint64_t v51 = @"failed to get read memory response";
        uint64_t v52 = 2993;
      }
    }
    else
    {
      uint64_t v51 = @"failed to get errorcode response: %x";
      uint64_t outputStructb = v75;
      uint64_t v52 = 2982;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", v52, v51, v36, v37, v38, outputStructb);
    goto LABEL_33;
  }
  uint64_t v21 = @"Successfully read IDSN from AppleAuthCP AID service.";
  uint64_t v22 = 2929;
LABEL_13:
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "readIDSNAuthCP", v22, v21, v18, v19, v20, (uint64_t)outputStruct);
  CFTypeRef v23 = cf;
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]", 3068, @"Get IDSN from AuthCP: %@", v24, v25, v26, (uint64_t)cf);
  uint64_t v27 = [NSString hexStringFromData:v23];
  id v11 = [v27 uppercaseString];

LABEL_14:
  uint64_t v12 = 0;
  id v28 = 0;
LABEL_17:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v28) {
    free(v28);
  }
LABEL_21:

  return v11;
}

+ (id)queryTouchScreenCert:(id *)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    *a3 = 0;
    if ([&unk_26FC372C0 count])
    {
      uint64_t v9 = 0;
      id v10 = 0;
      id v11 = 0;
      while (1)
      {
        uint64_t v12 = v11;
        uint64_t v30 = @"basic";
        id v13 = v10;
        v29[0] = @"IODeviceTree";
        v28[0] = @"servicePlane";
        v28[1] = @"serviceClass";
        uint64_t v14 = [&unk_26FC372C0 objectAtIndexedSubscript:v9];
        v29[1] = v14;
        void v29[2] = @"IOService";
        v28[2] = @"parentPlane";
        v28[3] = @"parentClass";
        uint64_t v15 = [&unk_26FC372D8 objectAtIndexedSubscript:v9];
        v28[4] = @"direction";
        v29[3] = v15;
        v29[4] = @"child";
        uint64_t v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
        v31[0] = v16;
        id v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];

        id v27 = v13;
        uint64_t v17 = [a1 queryIOProperty:@"AccessoryCertificate" fromCriteria:v11 withError:&v27];
        id v10 = v27;

        uint64_t v18 = [&unk_26FC372D8 objectAtIndexedSubscript:v9];
        uint64_t v19 = [&unk_26FC372C0 objectAtIndexedSubscript:v9];
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryTouchScreenCert:]", 3131, @"querying %@/%@ returned %s and %@", v20, v21, v22, (uint64_t)v18);

        if (v17) {
          break;
        }
        if ([&unk_26FC372C0 count] <= (unint64_t)++v9) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      id v11 = 0;
      id v10 = 0;
LABEL_9:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryTouchScreenCert:]", 3138, @"Failed to get touch screen cert from ioreg", v6, v7, v8, v24);
      id v10 = v10;
      uint64_t v17 = 0;
      *a3 = v10;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryTouchScreenCert:]", 3112, @"error p-pointer is nil!", v3, v4, v5, v24);
    id v11 = 0;
    uint64_t v17 = 0;
    id v10 = 0;
  }

  return v17;
}

+ (id)queryMogulTouchScreenCertDecoded:(BOOL)a3 withError:(id *)a4
{
  CFDataRef theData = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]", 3247, @"error p-pointer is nil!", v4, v5, v6, (uint64_t)v31);
    CFDataRef v13 = 0;
    goto LABEL_21;
  }
  BOOL v8 = a3;
  *a4 = 0;
  if (readPropertyFromMogulService(1, "AppleAuthCPAID", @"AccessoryCertificate", &theData))
  {
    uint64_t v12 = 2941;
  }
  else
  {
    if ((readPropertyFromMogulService(1, "AppleAuthCP", @"AccessoryCertificate", &theData) & 1) == 0)
    {
      CFDataRef v13 = theData;
      goto LABEL_15;
    }
    uint64_t v12 = 2945;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "readAccessoryCertificateAuthCP", v12, @"Successfully read AccessoryCertificate from AppleAuthCP AID service.", v9, v10, v11, (uint64_t)v31);
  CFDataRef v13 = theData;
  if (theData)
  {
    if (!v8) {
      goto LABEL_21;
    }
    BytePtr = CFDataGetBytePtr(theData);
    v38[0] = (unint64_t)BytePtr;
    CFIndex Length = CFDataGetLength(v13);
    v38[1] = Length;
    if (BytePtr && Length)
    {
      v37[0] = 0;
      v37[1] = 0;
      v36[0] = 0;
      v36[1] = 0;
      io_connect_t v34 = 0;
      unint64_t v35 = 0;
      unint64_t v33 = 0;
      if (DERDecodeSeqContentInit(v38, v37) || DERDecodeSeqNext(v37, &v33))
      {
        uint64_t v19 = @"fail to strip root sequence";
        uint64_t v20 = 3171;
      }
      else
      {
        if (!DERDecodeSeqContentInit((unint64_t *)&v34, v37))
        {
          if (!DERDecodeSeqNext(v37, &v33))
          {
            CFDataRef v27 = 0;
            CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            while (v33 != 0xA000000000000000)
            {
LABEL_40:
              if (DERDecodeSeqNext(v37, &v33)) {
                goto LABEL_46;
              }
            }
            if (DERDecodeSeqContentInit((unint64_t *)&v34, v36)
              || DERDecodeSeqNext(v36, &v33))
            {
              uint64_t v29 = @"fail to decode content";
              uint64_t v30 = 3191;
            }
            else
            {
              if (!DERDecodeSeqContentInit((unint64_t *)&v34, v36))
              {
                do
                {
                  if (DERDecodeSeqNext(v36, &v33))
                  {
                    if (v27) {
                      goto LABEL_40;
                    }
                    uint64_t v19 = @"did not find plain cert";
                    uint64_t v20 = 3228;
                    goto LABEL_17;
                  }
                }
                while (v33 != 0xA000000000000000);
                if (!v34 || !v35 || v35 >= 0x7D1)
                {
                  uint64_t v29 = @"invalid decoded plain cert: [%p:%zu]";
                  uint64_t v31 = v34;
                  uint64_t v30 = 3216;
                  goto LABEL_45;
                }
                CFDataRef v27 = CFDataCreate(v28, v34, v35);
                if (v27) {
                  goto LABEL_40;
                }
                uint64_t v19 = @"fail to create plain cert";
                uint64_t v20 = 3221;
                goto LABEL_17;
              }
              uint64_t v29 = @"fail to decode SignedData";
              uint64_t v30 = 3207;
            }
LABEL_45:
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "decodePKCS7TouchScreenCert", v30, v29, v16, v17, v18, (uint64_t)v31);
LABEL_46:
            CFRelease(v13);
            CFDataRef theData = v27;
            CFDataRef v13 = v27;
            if (v27) {
              goto LABEL_21;
            }
            goto LABEL_19;
          }
LABEL_18:
          CFRelease(v13);
          CFDataRef theData = 0;
LABEL_19:
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]", 3264, @"Failed to decode AccessoryCertificate", v22, v23, v24, (uint64_t)v31);
          id v21 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:12 underlyingError:0];
          CFDataRef v13 = 0;
          goto LABEL_20;
        }
        uint64_t v19 = @"fail to decode ContentInfo";
        uint64_t v20 = 3183;
      }
    }
    else
    {
      uint64_t v19 = @"null or empty pkcs7 cert content";
      uint64_t v20 = 3165;
    }
LABEL_17:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "decodePKCS7TouchScreenCert", v20, v19, v16, v17, v18, (uint64_t)v31);
    goto LABEL_18;
  }
LABEL_15:
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]", 3254, @"Failed to read AccessoryCertificate of mogul based top module", v9, v10, v11, (uint64_t)v31);
  id v21 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:21 underlyingError:0];
LABEL_20:
  *a4 = v21;
LABEL_21:
  CFDataRef v25 = v13;

  return v25;
}

+ (id)queryMesaSensorIDSensorSNWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(v21, 0, 42);
  uint64_t v20 = 42;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3287, @"error p-pointer is nil!", v3, v4, v5, v19);
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  *a3 = 0;
  uint64_t MesaFDRIdentifier = getMesaFDRIdentifier((char *)v21, (size_t *)&v20);
  if (MesaFDRIdentifier)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3295, @"Failed to get MesaSensorIDSensorSN, returned error 0x%08x", v8, v9, v10, MesaFDRIdentifier);
LABEL_9:
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 4;
    goto LABEL_10;
  }
  if (v20 != 41)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3300, @"MesaSensorIDSensorSNBufferSize %zu, should be %d", v8, v9, v10, v20);
    goto LABEL_9;
  }
  uint64_t v11 = [NSString stringWithUTF8String:v21];
  if (v11) {
    goto LABEL_11;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3306, @"MesaSensorIDSensorSN allocation failed", v12, v13, v14, v19);
  uint64_t v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = 10;
LABEL_10:
  id v17 = [v15 errorWithZhuGeErrorCode:v16 underlyingError:0];
  uint64_t v11 = 0;
  *a3 = v17;
LABEL_11:

  return v11;
}

+ (id)queryMesaProvisionStateWithError:(id *)a3
{
  unsigned int v14 = 0;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaProvisionStateWithError:]", 3323, @"error p-pointer is nil!", v3, v4, v5, v13);
    return 0;
  }
  *a3 = 0;
  uint64_t SensorProvisioningState = getSensorProvisioningState((int *)&v14);
  if (SensorProvisioningState)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaProvisionStateWithError:]", 3331, @"Failed to get MesaProvisioningState, returned error 0x%08x", v8, v9, v10, SensorProvisioningState);
  }
  else
  {
    if (v14 < 0xC) {
      return (id)*((void *)&off_265234BE0 + (int)v14);
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryMesaProvisionStateWithError:]", 3373, @"Unknown sensor state received!", v8, v9, v10, v13);
  }
  id v12 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:0];
  id result = 0;
  *a3 = v12;
  return result;
}

+ (id)querySPUProperty:(id)a3 withError:(id *)a4
{
  input[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  input[0] = 0;
  bzero(v36, 0x2000uLL);
  size_t v35 = 0x2000;
  if (!a4)
  {
    uint64_t v10 = @"error p-pointer is nil!";
    uint64_t v11 = 3413;
LABEL_13:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]", v11, v10, v6, v7, v8, (uint64_t)outputStruct);
    CFDataRef v27 = 0;
    goto LABEL_20;
  }
  *a4 = 0;
  if (v5)
  {
    if ([v5 isEqualToString:@"SNRaw"])
    {
      uint64_t v9 = 228;
LABEL_9:
      input[0] = v9;
      mach_port_t IOConnection = getIOConnection(MEMORY[0x263F0EC30], @"pressure", 0, 0, a4);
      if (IOConnection)
      {
        io_connect_t v18 = IOConnection;
        uint64_t v19 = IOConnectCallMethod(IOConnection, 2u, input, 1u, 0, 0, 0, 0, v36, &v35);
        if (v19)
        {
          mach_error_t v20 = v19;
          id v21 = [NSNumber numberWithInt:v19];
          io_connect_t v34 = [NSString stringWithUTF8String:mach_error_string(v20)];
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]", 3445, @"Failed to get value of property \"%@\" due to %@(%@)!", v22, v23, v24, (uint64_t)v5);

          CFDataRef v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v26 = [NSString stringWithUTF8String:mach_error_string(v20)];
          *a4 = [v25 errorWithZhuGeErrorCode:21 underlyingError:v26];

          CFDataRef v27 = 0;
        }
        else if (v35 <= 0x2000)
        {
          CFDataRef v27 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v36);
        }
        else
        {
          CFAllocatorRef v28 = [NSNumber numberWithUnsignedLong:v35];
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]", 3451, @"Output is too long (%@ > %@) for SPU property \"%@\"!", v29, v30, v31, (uint64_t)v28);

          [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:37 underlyingError:0];
          CFDataRef v27 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        IOServiceClose(v18);
        goto LABEL_20;
      }
      uint64_t v10 = @"Failed to get a connection for pressure!";
      uint64_t v11 = 3437;
      goto LABEL_13;
    }
    if ([v5 isEqualToString:@"PFSN"])
    {
      uint64_t v9 = 218;
      goto LABEL_9;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]", 3429, @"Unsupported SPU property \"%@\"!", v14, v15, v16, (uint64_t)v5);
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = 75;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]", 3419, @"property pointer is nil!", v6, v7, v8, (uint64_t)outputStruct);
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = 45;
  }
  [v12 errorWithZhuGeErrorCode:v13 underlyingError:0];
  CFDataRef v27 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v27;
}

+ (id)queryFactoryShippingSettingTimeWithError:(id *)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v72 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  memset(v61, 0, sizeof(v61));
  memset(v58, 0, sizeof(v58));
  memset(v57, 0, sizeof(v57));
  memset(v56, 0, sizeof(v56));
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, sizeof(v52));
  CFTypeRef cf = 0;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3484, @"error p-pointer is nil!", v3, v4, v5, v49);
    id v10 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    mach_error_t v20 = 0;
    goto LABEL_21;
  }
  *a3 = 0;
  v59[0] = @"CopyAllowUnsealed";
  v59[1] = @"StripImg4";
  v60[0] = MEMORY[0x263EFFA88];
  v60[1] = MEMORY[0x263EFFA80];
  v59[2] = @"VerifyData";
  v60[2] = MEMORY[0x263EFFA80];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];
  id v50 = 0;
  uint64_t v9 = getFDRDataByFDRClassWithError(@"pcrt", v8, &v50);
  id v10 = v50;
  if (!v9)
  {
    id v21 = [a1 key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3496, @"Failed to get pinecrest cert from libFDR for key \"%@\"!", v22, v23, v24, (uint64_t)v21);

    id v25 = v10;
LABEL_18:
    mach_error_t v20 = 0;
    *a3 = v25;
    goto LABEL_19;
  }
  id v11 = v9;
  double v13 = Img4DecodeInit([v11 bytes], objc_msgSend(v11, "length"), (uint64_t)v61);
  if (v12)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", v12, v13);
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3504, @"Img4DecodeInit failed to decode fdrData with der state %@!", v15, v16, v17, (uint64_t)v14);

    io_connect_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 77;
LABEL_17:
    id v25 = [v18 errorWithZhuGeErrorCode:v19 underlyingError:0];
    goto LABEL_18;
  }
  uint64_t v54 = *((void *)&v62 + 1);
  uint64_t v55 = v63;
  uint64_t v26 = DERParseSequence((uint64_t)&v54, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, (unint64_t)v58, 0x30uLL);
  if (v26)
  {
    CFDataRef v27 = [NSNumber numberWithInt:v26];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3512, @"DERParseSequence failed to decode cert chain with der state %@!", v28, v29, v30, (uint64_t)v27);
LABEL_16:

    io_connect_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 12;
    goto LABEL_17;
  }
  uint64_t v31 = DERParseSequence((uint64_t)v58, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, (unint64_t)v56, 0xA0uLL);
  if (v31)
  {
    CFDataRef v27 = [NSNumber numberWithInt:v31];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3518, @"DERParseSequence failed to decode into TBS Cert with der state %@!", v32, v33, v34, (uint64_t)v27);
    goto LABEL_16;
  }
  size_t v35 = DERParseSequenceContent(v57, (unsigned __int16)DERNumValidityItemSpecs, (uint64_t)&DERValidityItemSpecs, (unint64_t)v53, 0x20uLL);
  if (v35 || !*((void *)&v53[0] + 1))
  {
    CFDataRef v27 = [NSNumber numberWithInt:v35];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3524, @"DERParseSequenceContent failed to decode into validity with der state %@!", v40, v41, v42, (uint64_t)v27);
    goto LABEL_16;
  }
  uint64_t v36 = DERDecodeItem((uint64_t)v53, v52);
  if (v36)
  {
    CFDataRef v27 = [NSNumber numberWithInt:v36];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3530, @"DERDecodeItem failed to decode validity notBefore time with der state %@!", v37, v38, v39, (uint64_t)v27);
    goto LABEL_16;
  }
  SecAbsoluteTimeFromDateContentWithError();
  if (cf)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3536, @"SecAbsoluteTimeFromDateContentWithError failed, error = %@", v45, v46, v47, (uint64_t)cf);
    io_connect_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 79;
    goto LABEL_17;
  }
  mach_error_t v20 = CFDateCreate(0, v48);
LABEL_19:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
LABEL_21:
  id v43 = v20;

  return v43;
}

@end