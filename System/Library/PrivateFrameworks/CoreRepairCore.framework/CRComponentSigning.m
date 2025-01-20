@interface CRComponentSigning
- (void)bcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6;
- (void)prpcSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6;
- (void)tcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6;
- (void)vcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6;
@end

@implementation CRComponentSigning

- (void)tcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
}

- (void)bcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
}

- (void)vcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  int v46 = -1;
  memset(length, 0, sizeof(length));
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_21FBF7244;
  v40 = sub_21FBF7254;
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
  if (a4)
  {
    if (a5)
    {
      v13 = objc_msgSend_sharedManager(MEMORY[0x263F340C8], v10, v11, v12);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = sub_21FBF7344;
      v35[3] = &unk_26452A570;
      v35[4] = &v43;
      v35[5] = &v51;
      v35[6] = &v47;
      v35[7] = &v36;
      objc_msgSend_signVeridianChallenge_completionHandler_(v13, v14, (uint64_t)a3, (uint64_t)v35);

      v15 = v37[5];
      dispatch_time_t v16 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(v15, v16))
      {
        v27 = handleForCategory(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_21FC5BB80();
        }
      }
      else
      {
        v17 = v44;
        if (a6) {
          *a6 = *((_DWORD *)v44 + 6);
        }
        if (*((_DWORD *)v17 + 6))
        {
          v27 = handleForCategory(0);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_21FC5BB4C();
          }
        }
        else
        {
          CFDataRef v18 = (const __CFData *)v52[3];
          if (v18)
          {
            if (v48[3])
            {
              BytePtr = (char *)CFDataGetBytePtr(v18);
              unsigned int v20 = CFDataGetLength((CFDataRef)v52[3]);
              if (sub_21FBF6894(BytePtr, v20, &length[1], length))
              {
                v27 = handleForCategory(0);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  sub_21FC5BAD4(v27, v28, v29, v30, v31, v32, v33, v34);
                }
              }
              else
              {
                CFDataRef v21 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x263EFFB18]);
                *a4 = v21;
                if (v21)
                {
                  *(void *)&length[1] = 0;
                  v22 = CFDataGetBytePtr((CFDataRef)v48[3]);
                  CFIndex v23 = CFDataGetLength((CFDataRef)v48[3]);
                  CFDataRef v24 = CFDataCreate(0, v22, v23);
                  *a5 = v24;
                  if (v24) {
                    goto LABEL_12;
                  }
                  v27 = handleForCategory(0);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                    sub_21FC5BAA0();
                  }
                }
                else
                {
                  v27 = handleForCategory(0);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                    sub_21FC5BA6C();
                  }
                }
              }
            }
            else
            {
              v27 = handleForCategory(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                sub_21FC5BA38();
              }
            }
          }
          else
          {
            v27 = handleForCategory(0);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_21FC5B9D0();
            }
          }
        }
      }
    }
    else
    {
      v27 = handleForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_21FC5BA04();
      }
    }
  }
  else
  {
    v27 = handleForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B9D0();
    }
  }

LABEL_12:
  v25 = (const void *)v52[3];
  if (v25) {
    CFRelease(v25);
  }
  v26 = (const void *)v48[3];
  if (v26) {
    CFRelease(v26);
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
}

- (void)prpcSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_21FC5C018(v10);
  }

  CFStringGetCStringPtr(@"Savage", 0x8000100u);
  v90 = 0;
  unsigned int v89 = 0;
  uint64_t v88 = 0;
  if (!a4)
  {
    v67 = handleForCategory(0);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B9D0();
    }
    goto LABEL_69;
  }
  if (!a5)
  {
    v67 = handleForCategory(0);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BA04();
    }
    goto LABEL_69;
  }
  uint64_t v11 = handleForCategory(0);
  uint64_t v12 = v11;
  if (!a3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BBB4();
    }

    goto LABEL_70;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_21FC5BFA0((uint64_t)a3, v12);
  }

  uint64_t v14 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v13, @"/private/preboot/active", 1, 0);
  if (!v14)
  {
    v67 = handleForCategory(0);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BBE8();
    }
LABEL_69:

LABEL_70:
    v22 = 0;
    v17 = 0;
LABEL_107:
    int v49 = 1;
    goto LABEL_29;
  }
  v17 = (void *)v14;
  uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v15, @"%s/%@/", v16, "/private/preboot/", v14);
  if (!v18)
  {
    v68 = handleForCategory(0);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BC1C();
    }

    v22 = 0;
    goto LABEL_107;
  }
  v22 = (void *)v18;
  uint64_t DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v19, v20, v21);
  if (!DefaultAMAuthInstallRef)
  {
    v69 = handleForCategory(0);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BC50();
    }
    goto LABEL_106;
  }
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v23, v24, v25)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v26, DefaultAMAuthInstallRef, v27))
  {
    v69 = handleForCategory(0);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BF6C();
    }
    goto LABEL_106;
  }
  CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    v69 = handleForCategory(0);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BC84();
    }
    goto LABEL_106;
  }
  uint64_t v30 = Mutable;
  CFMutableDictionaryRef v31 = CFDictionaryCreateMutable(v28, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v31)
  {
    v69 = handleForCategory(0);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BCB8();
    }
    goto LABEL_106;
  }
  uint64_t v32 = v31;
  v81 = a4;
  CFMutableDictionaryRef v33 = CFDictionaryCreateMutable(v28, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v33)
  {
    v69 = handleForCategory(0);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BCEC();
    }
LABEL_106:

    goto LABEL_107;
  }
  uint64_t v34 = v33;
  CFDictionarySetValue(v30, (const void *)*MEMORY[0x263F90340], v22);
  CFDictionarySetValue(v30, (const void *)*MEMORY[0x263F90328], (const void *)*MEMORY[0x263EFFB38]);
  CFDictionarySetValue(v30, @"PreflightContext", @"Limited");
  CFDictionarySetValue(v30, @"AuthChallengeOption", a3);
  CFDictionarySetValue(v30, @"PersonalizedFirmwareRootPath", @"/private/var/tmp/usr/standalone/firmware/Savage/");
  CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F90478], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(v30, (const void *)*MEMORY[0x263F90460], v32);
  CFDictionaryAddValue(v34, (const void *)*MEMORY[0x263F90308], v30);
  CFDictionarySetValue(v34, @"BundlePath", v22);
  v35 = handleForCategory(0);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v35, OS_LOG_TYPE_DEFAULT, "Creating Savage Updater", buf, 2u);
  }

  if (!SavageUpdaterCreate())
  {
    v70 = handleForCategory(0);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BD20();
    }

    goto LABEL_107;
  }
  v83 = a6;
  v82 = v17;
  int v36 = 0;
  if (SavageUpdaterIsDone())
  {
LABEL_20:
    uint64_t v37 = v88;
    uint64_t v38 = handleForCategory(0);
    v39 = v38;
    if (!v37)
    {
      v17 = v82;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v92) = v36;
        _os_log_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEFAULT, "SavageUpdater work done. LoopCounter = %d.", buf, 8u);
      }

      CFDataRef v40 = (const __CFData *)sub_21FBF66D8(@"SavageAuthResponse");
      CFDataRef v41 = (const __CFData *)sub_21FBF66D8(@"SavageAuthSalt");
      CFDataRef v42 = v41;
      a6 = v83;
      if (v40)
      {
        if (v41)
        {
          BytePtr = (char *)CFDataGetBytePtr(v40);
          unsigned int Length = CFDataGetLength(v40);
          if (sub_21FBF6894(BytePtr, Length, &v90, &v89))
          {
            v73 = handleForCategory(0);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
              sub_21FC5BE8C(v73, v74, v75, v76, v77, v78, v79, v80);
            }
          }
          else
          {
            CFDataRef v45 = CFDataCreateWithBytesNoCopy(0, v90, v89, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
            *v81 = v45;
            if (v45)
            {
              int v46 = CFDataGetBytePtr(v42);
              CFIndex v47 = CFDataGetLength(v42);
              CFDataRef v48 = CFDataCreate(0, v46, v47);
              *a5 = v48;
              if (v48)
              {
                int v49 = 0;
                goto LABEL_29;
              }
              v73 = handleForCategory(0);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                sub_21FC5BAA0();
              }
            }
            else
            {
              v73 = handleForCategory(0);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                sub_21FC5BA6C();
              }
            }
          }
        }
        else
        {
          v72 = handleForCategory(0);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            sub_21FC5BA38();
          }
        }
      }
      else
      {
        v71 = handleForCategory(0);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          sub_21FC5BE58();
        }
      }
      goto LABEL_107;
    }
    v17 = v82;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BF04();
    }

    int v49 = 1;
    a6 = v83;
  }
  else
  {
    uint64_t v50 = (const void *)*MEMORY[0x263F8C000];
    uint64_t v51 = (const void *)*MEMORY[0x263F902B8];
    while (1)
    {
      value = 0;
      v87 = 0;
      v85[1] = 0;
      v52 = handleForCategory(0);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v92 = v34;
        __int16 v93 = 1024;
        int v94 = v36 + 1;
        _os_log_debug_impl(&dword_21FBF2000, v52, OS_LOG_TYPE_DEBUG, "updaterOptions: %@ updaterLoopCount: %d", buf, 0x12u);
      }

      int v53 = SavageUpdaterExecCommand();
      uint64_t v54 = v88;
      v55 = handleForCategory(0);
      v56 = v55;
      if (!v53 || v54) {
        break;
      }
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v92 = value;
        _os_log_debug_impl(&dword_21FBF2000, v56, OS_LOG_TYPE_DEBUG, "deviceInfoDict: %@", buf, 0xCu);
      }

      CFDictionarySetValue(v34, v50, value);
      v59 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v57, DefaultAMAuthInstallRef, v58);
      v61 = v59;
      if (!v59)
      {
        v64 = handleForCategory(0);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          sub_21FC5BDF0();
        }
        goto LABEL_59;
      }
      v85[0] = 0;
      int BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error = objc_msgSend_getBrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error_(v59, v60, (uint64_t)v34, (uint64_t)&v87, 1, v85);
      v63 = v85[0];
      v64 = v63;
      if (!BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error || !v87 || v63)
      {
        v66 = handleForCategory(0);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_21FC5BE24();
        }

        goto LABEL_59;
      }
      CFDictionarySetValue(v34, v51, v87);
      v65 = handleForCategory(0);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v92 = v34;
        _os_log_debug_impl(&dword_21FBF2000, v65, OS_LOG_TYPE_DEBUG, "perform next stage: %@", buf, 0xCu);
      }

      if (!SavageUpdaterExecCommand() || v88)
      {
        v64 = handleForCategory(0);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          sub_21FC5BD88();
        }
LABEL_59:
        v17 = v82;
        a6 = v83;

        int v49 = 1;
        goto LABEL_29;
      }
      AMSupportSafeRelease();
      AMSupportSafeRelease();

      ++v36;
      if (SavageUpdaterIsDone()) {
        goto LABEL_20;
      }
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BD88();
    }

    int v49 = 1;
    v17 = v82;
    a6 = v83;
  }
LABEL_29:
  if (a6) {
    *a6 = v49;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
}

@end