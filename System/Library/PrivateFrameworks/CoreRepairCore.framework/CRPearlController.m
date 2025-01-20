@interface CRPearlController
- (id)_copyCombinedFDRData:(id)a3 withError:(id *)a4;
- (id)decompressPearlFrames;
- (id)updateBrunorDATFirmware;
- (id)updateSavageDATFirmware;
- (id)verifyPSD3;
@end

@implementation CRPearlController

- (id)decompressPearlFrames
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[CRPearlController decompressPearlFrames]";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6);
  int v10 = objc_msgSend_fileExistsAtPath_(v7, v8, @"/var/hardware/Pearl", v9);

  if (v10)
  {
    v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = (const char *)@"/var/hardware/Pearl";
      _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    v16 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v13, v14, v15);
    id v47 = 0;
    int v18 = objc_msgSend_removeItemAtPath_error_(v16, v17, @"/var/hardware/Pearl", (uint64_t)&v47);
    id v19 = v47;

    if (!v18 || v19)
    {
      v43 = handleForCategory(0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_21FC63BEC((uint64_t)v19, v43);
      }

      sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, @"Failed to delete existing Pearl Data", v19);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  id v46 = 0;
  id v19 = (id)objc_msgSend__copyCombinedFDRData_withError_(self, v11, @"prf1", (uint64_t)&v46);
  id v20 = v46;
  v21 = v20;
  if (!v19 || v20)
  {
    v41 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, @"Found no prf1 data", v20);

    id v42 = v41;
LABEL_16:
    id v40 = v42;
    goto LABEL_17;
  }
  id v19 = v19;
  v25 = (const void *)objc_msgSend_bytes(v19, v22, v23, v24);
  size_t v29 = objc_msgSend_length(v19, v26, v27, v28);
  uint64_t v32 = objc_msgSend_cStringUsingEncoding_(@"/private/var/hardware/Pearl", v30, 4, v31);
  uint64_t v33 = sub_21FC59594(v25, v29, v32);
  if (v33)
  {
    uint64_t v35 = v33;
    v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v34, @"BiometricError", (int)v33, 0);
    v39 = objc_msgSend_stringWithFormat_(NSString, v37, @"Failed to decompress Pearl frames, error: 0x%x", v38, v35);
    sub_21FC02E70((void *)0xFFFFFFFFFFFFFFF7, v39, v36);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = handleForCategory(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v45, OS_LOG_TYPE_DEFAULT, "Decompress Pearl frames successfully", buf, 2u);
    }

    id v40 = 0;
  }
LABEL_17:

  return v40;
}

- (id)_copyCombinedFDRData:(id)a3 withError:(id *)a4
{
  buf[3] = *(id *)MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(id *)((char *)buf + 4) = "-[CRPearlController _copyCombinedFDRData:withError:]";
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)buf, 0xCu);
  }

  buf[0] = 0;
  v11[0] = @"GetCombined";
  v11[1] = @"StripImg4";
  v12[0] = MEMORY[0x263EFFA88];
  v12[1] = MEMORY[0x263EFFA80];
  v11[2] = @"VerifyData";
  v12[2] = MEMORY[0x263EFFA80];
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v12, (uint64_t)v11, 3);
  uint64_t v9 = (void *)AMFDRSealingManifestCopyLocalDataForClass();

  if (a4 && buf[0]) {
    *a4 = buf[0];
  }

  return v9;
}

- (id)updateSavageDATFirmware
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  v2 = handleForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v130 = "-[CRPearlController updateSavageDATFirmware]";
    _os_log_impl(&dword_21FBF2000, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v127 = 0;
  v128 = 0;
  uint64_t v126 = 0;
  CStringPtr = CFStringGetCStringPtr(@"Savage", 0x8000100u);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  id v125 = 0;
  v7 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v6, @"/private/preboot/active", 1, &v125);
  id v8 = v125;
  v11 = objc_msgSend_stringWithFormat_(NSString, v9, @"%s/%@/", v10, "/private/preboot/", v7);
  CFURLRef v12 = CFURLCreateWithFileSystemPath(0, @"/tmp/", kCFURLPOSIXPathStyle, 1u);
  v115 = v11;
  v116 = Mutable;
  CFURLRef cf = v12;
  if (!CStringPtr || (CFURLRef v15 = v12) == 0 || (Mutable ? (v16 = v11 == 0) : (v16 = 1), v16))
  {
    v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, @"Failed to allocate resources", 0);
    id v20 = 0;
LABEL_85:
    id v49 = 0;
    DefaultAMAuthInstallRef = 0;
    goto LABEL_50;
  }
  objc_msgSend_stringWithFormat_(NSString, v13, @"Faild to read OS Boot hash from %@, error: %@", v14, @"/private/preboot/active", v8);
  id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, v20, 0);
    goto LABEL_85;
  }
  DefaultAMAuthInstallRef = (const void *)objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v17, v18, v19);
  if (!DefaultAMAuthInstallRef)
  {
    v109 = @"Failed to get default AMAuthInstallRef";
LABEL_90:
    v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, v109, 0);
    id v49 = 0;
    goto LABEL_50;
  }
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v21, v22, v23)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v25, (uint64_t)DefaultAMAuthInstallRef, v26))
  {
    v109 = @"Failed to enable SSO";
    goto LABEL_90;
  }
  uint64_t v119 = (uint64_t)DefaultAMAuthInstallRef;
  v113 = v7;
  v112 = (void *)MEMORY[0x223C5C2A0]();
  CFMutableDictionaryRef v27 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v27)
  {
    v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, @"Failed to allocate updater options", 0);
    id v49 = 0;
    uint64_t v32 = v20;
    goto LABEL_49;
  }
  uint64_t v28 = v27;
  CFDictionarySetValue(Mutable, @"RestoreSystemPartition", v11);
  CFDictionarySetValue(Mutable, @"PostFDRSealing", (const void *)*MEMORY[0x263EFFB38]);
  CFDictionarySetValue(Mutable, @"PreflightContext", @"Limited");
  CFDictionaryAddValue(v28, @"Options", Mutable);
  CFDictionarySetValue(v28, @"BundlePath", v15);
  uint64_t v29 = SavageUpdaterCreate();
  objc_msgSend_stringWithFormat_(NSString, v30, @"Failed to create SavageUpdater: %s, error: %@", v31, CStringPtr, 0);
  uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v29 || v128)
  {
    AMSupportSafeRelease();
    v110 = v128;
    v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, v32, v128);

    id v49 = 0;
    goto LABEL_49;
  }
  id v111 = v8;
  if (SavageUpdaterIsDone())
  {
LABEL_45:
    v60 = handleForCategory(0);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v60, OS_LOG_TYPE_DEFAULT, "Savage Updater done", buf, 2u);
    }

    AMSupportSafeRelease();
    AMSupportSafeRelease();
    id v49 = 0;
    v61 = 0;
    goto LABEL_48;
  }
  int v33 = 3;
  v34 = (const void *)*MEMORY[0x263F8C000];
  uint64_t v35 = (const void *)*MEMORY[0x263F90318];
  v117 = (const void *)*MEMORY[0x263F90418];
  v118 = (const void *)*MEMORY[0x263F904E0];
  while (1)
  {
    value = 0;
    v36 = v128;
    if (v128)
    {
      v108 = @"SavageUpdaterIsDone failed";
      goto LABEL_77;
    }
    if (!--v33)
    {
      v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, @"updater not done after 2 iterations", 0);
      goto LABEL_78;
    }
    int v37 = SavageUpdaterExecCommand();
    v36 = v128;
    if (!v37 || v128 || !v127)
    {
      v108 = @"Failed to run SavageUpdaterExecCommand";
LABEL_77:
      v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, v108, v36);

LABEL_78:
      id v49 = 0;
      goto LABEL_79;
    }
    CFDictionarySetValue(v28, v34, v127);
    CFDictionarySetValue(v28, v35, v127);
    uint64_t v38 = CFDictionaryGetValue((CFDictionaryRef)v127, @"YonkersDeviceInfo");
    v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = @"Savage";
      if (v38) {
        id v40 = @"Yonkers";
      }
      *(_DWORD *)buf = 138412290;
      v130 = (const char *)v40;
      _os_log_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEFAULT, "Patch type: %@", buf, 0xCu);
    }

    v43 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v41, v119, v42);
    v45 = v43;
    if (v38)
    {
      uint64_t v123 = 0;
      id v46 = (id *)&v123;
      unsigned int YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error = objc_msgSend_getYonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error_(v43, v44, (uint64_t)v28, (uint64_t)&value, &v123);
    }
    else
    {
      uint64_t v122 = 0;
      id v46 = (id *)&v122;
      unsigned int YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error = objc_msgSend_getSavageTicketForZenithSavageFWUpdateWithOptions_SavageTicket_error_(v43, v44, (uint64_t)v28, (uint64_t)&value, &v122);
    }
    unsigned int v48 = YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error;
    id v49 = *v46;

    objc_msgSend_stringWithFormat_(NSString, v50, @"Failed to personalize Savage FW, status: %d, error: %@", v51, v48, v49);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v49 || !v48 || !value) {
      break;
    }
    if (v38) {
      v53 = v118;
    }
    else {
      v53 = v117;
    }
    CFDictionaryAddValue(v28, v53, value);
    v54 = handleForCategory(0);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v130 = (const char *)v28;
      _os_log_impl(&dword_21FBF2000, v54, OS_LOG_TYPE_DEFAULT, "Perform next stage, updaterOptions: %@", buf, 0xCu);
    }

    int v55 = SavageUpdaterExecCommand();
    objc_msgSend_stringWithFormat_(NSString, v56, @"Failed to exec SavageUpdater command, result: %@", v57, v126);
    uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v36 = v128;
    if (!v55 || v128)
    {
      v108 = v32;
      goto LABEL_77;
    }
    v58 = handleForCategory(0);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = @"Savage";
      if (v38) {
        v59 = @"Yonkers";
      }
      *(_DWORD *)buf = 138412290;
      v130 = (const char *)v59;
      _os_log_impl(&dword_21FBF2000, v58, OS_LOG_TYPE_DEFAULT, "Update %@ FW Successfully", buf, 0xCu);
    }

    AMSupportSafeRelease();
    AMSupportSafeRelease();
    uint64_t v126 = 0;
    v127 = 0;

    if (SavageUpdaterIsDone()) {
      goto LABEL_45;
    }
  }
  v61 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, v52, 0);
  uint64_t v32 = v52;
LABEL_79:

LABEL_48:
  id v8 = v111;
LABEL_49:
  v7 = v113;
  DefaultAMAuthInstallRef = (const void *)v119;
  id v20 = v32;
LABEL_50:
  v65 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v62, v63, v64);
  int v68 = objc_msgSend_fileExistsAtPath_(v65, v66, @"/tmp/Savage.fw", v67);

  if (v68)
  {
    v72 = handleForCategory(0);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v72, OS_LOG_TYPE_DEFAULT, "Find Savage.fw, deleting...", buf, 2u);
    }

    v76 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v73, v74, v75);
    id v121 = 0;
    char v78 = objc_msgSend_removeItemAtPath_error_(v76, v77, @"/tmp/Savage.fw", (uint64_t)&v121);
    id v79 = v121;

    if ((v78 & 1) == 0)
    {
      v80 = handleForCategory(0);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        sub_21FC63CE4((uint64_t)v79, v80, v81, v82, v83, v84, v85, v86);
      }
    }
  }
  v87 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v69, v70, v71);
  int v90 = objc_msgSend_fileExistsAtPath_(v87, v88, @"/tmp/Yonkers.fw", v89);

  if (v90)
  {
    v91 = handleForCategory(0);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v91, OS_LOG_TYPE_DEFAULT, "Find Yonkers.fw, deleting...", buf, 2u);
    }

    v95 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v92, v93, v94);
    id v120 = 0;
    char v97 = objc_msgSend_removeItemAtPath_error_(v95, v96, @"/tmp/Yonkers.fw", (uint64_t)&v120);
    id v98 = v120;

    if ((v97 & 1) == 0)
    {
      v99 = handleForCategory(0);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
        sub_21FC63C78((uint64_t)v98, v99, v100, v101, v102, v103, v104, v105);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v116) {
    CFRelease(v116);
  }
  if (DefaultAMAuthInstallRef) {
    CFRelease(DefaultAMAuthInstallRef);
  }
  id v106 = v61;

  return v106;
}

- (id)updateBrunorDATFirmware
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  CFStringGetCStringPtr(@"Savage", 0x8000100u);
  uint64_t v71 = 0;
  id v5 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v2, @"/private/preboot/active", 1, 0);
  if (!v5)
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC63D50();
    }
    goto LABEL_61;
  }
  uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, v3, @"%s/%@/", v4, "/private/preboot/", v5);
  if (!v6)
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC63D84();
    }
LABEL_61:
    v30 = 0;
    uint64_t v10 = 0;
    goto LABEL_56;
  }
  uint64_t v10 = (void *)v6;
  uint64_t DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v7, v8, v9);
  if (!DefaultAMAuthInstallRef)
  {
    v25 = handleForCategory(0);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v30 = 0;
      goto LABEL_56;
    }
    sub_21FC63DB8();
    goto LABEL_79;
  }
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v11, v12, v13)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v15, DefaultAMAuthInstallRef, v16))
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_21FC63F28();
      goto LABEL_79;
    }
LABEL_76:
    v30 = 0;
    goto LABEL_56;
  }
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_21FC63DEC();
LABEL_79:
      v30 = 0;
      goto LABEL_56;
    }
    goto LABEL_76;
  }
  uint64_t v19 = Mutable;
  CFMutableDictionaryRef v20 = CFDictionaryCreateMutable(v17, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v20)
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC63E20();
    }
    v30 = 0;
    goto LABEL_56;
  }
  v21 = v20;
  CFDictionarySetValue(v19, @"RestoreSystemPartition", v10);
  CFDictionarySetValue(v19, @"PostFDRSealing", (const void *)*MEMORY[0x263EFFB38]);
  CFDictionarySetValue(v19, @"PreflightContext", @"Limited");
  CFDictionaryAddValue(v21, @"Options", v19);
  if (!SavageUpdaterCreate())
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BD20();
    }
    goto LABEL_55;
  }
  uint64_t v63 = v10;
  uint64_t v64 = v5;
  int v22 = 0;
  if (SavageUpdaterIsDone())
  {
LABEL_10:
    uint64_t v23 = v71;
    uint64_t v24 = handleForCategory(0);
    v25 = v24;
    if (v23)
    {
      uint64_t v10 = v63;
      id v5 = v64;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_21FC5BF04();
      }
      goto LABEL_55;
    }
    uint64_t v10 = v63;
    id v5 = v64;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = v22;
      _os_log_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_DEFAULT, "SavageUpdater work done. LoopCounter = %d.", buf, 8u);
    }

    id v66 = 0;
    int v28 = objc_msgSend_powerCycleSensor_(CRUtils, v26, (uint64_t)&v66, v27);
    id v29 = v66;
    v30 = v29;
    if (!v28 || v29)
    {
      v25 = handleForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_21FC63E88((uint64_t)v30, v25, v57, v58, v59, v60, v61, v62);
      }
      goto LABEL_56;
    }
    uint64_t v31 = 0;
    goto LABEL_16;
  }
  int v33 = (const void *)*MEMORY[0x263F8C000];
  v34 = (const void *)*MEMORY[0x263F904E0];
  key = (void *)*MEMORY[0x263F902B8];
  while (1)
  {
    value = 0;
    uint64_t v70 = 0;
    v68[1] = 0;
    uint64_t v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v73 = v21;
      __int16 v74 = 1024;
      int v75 = v22 + 1;
      _os_log_debug_impl(&dword_21FBF2000, v35, OS_LOG_TYPE_DEBUG, "updaterOptions: %@ updaterLoopCount: %d", buf, 0x12u);
    }

    int v36 = SavageUpdaterExecCommand();
    uint64_t v37 = v71;
    uint64_t v38 = handleForCategory(0);
    v39 = v38;
    if (!v36 || v37)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = value;
      _os_log_debug_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEBUG, "deviceInfoDict: %@", buf, 0xCu);
    }

    CFDictionarySetValue(v21, v33, value);
    id v40 = CFDictionaryGetValue((CFDictionaryRef)value, @"YonkersDeviceInfo");
    v41 = handleForCategory(0);
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (!v40) {
      break;
    }
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "Updating Yonkers ...", buf, 2u);
    }

    v45 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v43, DefaultAMAuthInstallRef, v44);
    v68[0] = 0;
    int YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error = objc_msgSend_getYonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error_(v45, v46, (uint64_t)v21, (uint64_t)&v70, v68);
    v25 = v68[0];

    if (!YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error || (unsigned int v48 = v70) == 0 || v25)
    {
      v39 = handleForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_21FC63EF4();
      }
      goto LABEL_54;
    }
    id v49 = v21;
    uint64_t v50 = v34;
LABEL_39:
    CFDictionaryAddValue(v49, v50, v48);
    v56 = handleForCategory(0);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v21;
      _os_log_debug_impl(&dword_21FBF2000, v56, OS_LOG_TYPE_DEBUG, "perform next stage: %@", buf, 0xCu);
    }

    if (!SavageUpdaterExecCommand() || v71)
    {
      v39 = handleForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
LABEL_48:
      }
        sub_21FC5BD88();
LABEL_49:
      v25 = 0;
      goto LABEL_54;
    }
    AMSupportSafeRelease();
    AMSupportSafeRelease();

    ++v22;
    if (SavageUpdaterIsDone()) {
      goto LABEL_10;
    }
  }
  if (v42)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "Updating Brunor ...", buf, 2u);
  }

  v53 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v51, DefaultAMAuthInstallRef, v52);
  id v67 = 0;
  int BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error = objc_msgSend_getBrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error_(v53, v54, (uint64_t)v21, (uint64_t)&v70, 0, &v67);
  v25 = v67;

  if (BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error)
  {
    unsigned int v48 = v70;
    if (v70)
    {
      if (!v25)
      {
        id v49 = v21;
        uint64_t v50 = key;
        goto LABEL_39;
      }
    }
  }
  v39 = handleForCategory(0);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    sub_21FC63E54();
  }
LABEL_54:
  uint64_t v10 = v63;
  id v5 = v64;

LABEL_55:
  v30 = 0;
LABEL_56:

  uint64_t v31 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFBLL, @"Update streaming DAT file failed", 0);
LABEL_16:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v31;
}

- (id)verifyPSD3
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  uint64_t v23 = @"VerifyData";
  v24[0] = MEMORY[0x263EFFA88];
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v24, (uint64_t)&v23, 1);
  v3 = (void *)AMFDRSealingManifestCopyLocalDataForClass();
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = v22 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    uint64_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC63F5C();
    }
LABEL_17:

    CFAllocatorRef v17 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFF5, @"Verify PSD3 failed", 0);
    goto LABEL_10;
  }
  id v6 = v3;
  uint64_t v10 = (const char *)objc_msgSend_bytes(v6, v7, v8, v9);
  size_t v14 = objc_msgSend_length(v6, v11, v12, v13);
  int v15 = sub_21FC58AB8(v10, v14);
  uint64_t v16 = handleForCategory(0);
  uint64_t v19 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC63FC4(v15, v19);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "Verify psd3 successfully", v21, 2u);
  }

  CFAllocatorRef v17 = 0;
LABEL_10:
  AMSupportSafeRelease();

  return v17;
}

@end