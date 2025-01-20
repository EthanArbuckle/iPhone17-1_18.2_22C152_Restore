@interface BDSSyncUserDefaults
+ (BOOL)_isBundleIdentifierInArray:(__CFArray *)a3;
+ (BOOL)_isICloudDriveSyncOptedIn;
+ (BOOL)_isServiceDisabledAlternative:(__CFString *)a3;
+ (BOOL)_isServiceEnabledAlternative:(__CFString *)a3;
+ (BOOL)isCloudKitSyncOptedIn;
+ (BOOL)isGlobalICloudDriveSyncOptedIn;
+ (BOOL)isICloudDriveSyncOptedIn;
+ (BOOL)isSignedIntoICloud;
+ (id)_booksAppBundleIdentifier;
+ (id)_stateForLog;
+ (id)iCloudIdentity;
+ (id)makeOSStateHandler;
+ (void)_setService:(__CFString *)a3 enabled:(BOOL)a4;
@end

@implementation BDSSyncUserDefaults

+ (BOOL)isSignedIntoICloud
{
  v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3, v4, v5, v6, v7);
  char isUserSignedInToiCloud = objc_msgSend_isUserSignedInToiCloud(v8, v9, v10, v11, v12, v13, v14, v15);

  return isUserSignedInToiCloud;
}

+ (BOOL)isCloudKitSyncOptedIn
{
  v8 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2, v3, v4, v5, v6, v7);
  char v15 = objc_msgSend_BOOLForKey_(v8, v9, @"BCSyncCloudKit", v10, v11, v12, v13, v14);

  return v15;
}

+ (BOOL)isGlobalICloudDriveSyncOptedIn
{
  v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3, v4, v5, v6, v7);
  char isGlobalICloudDriveSyncOptedIn = objc_msgSend_isGlobalICloudDriveSyncOptedIn(v8, v9, v10, v11, v12, v13, v14, v15);

  return isGlobalICloudDriveSyncOptedIn;
}

+ (id)iCloudIdentity
{
  v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3, v4, v5, v6, v7);
  v16 = objc_msgSend_iCloudIdentity(v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

+ (id)makeOSStateHandler
{
  id v2 = objc_alloc(MEMORY[0x263F2BA60]);
  v8 = objc_msgSend_initWithTitle_block_(v2, v3, @"BDSSyncUserDefaults", (uint64_t)&unk_26E971B70, v4, v5, v6, v7);
  return v8;
}

+ (BOOL)isICloudDriveSyncOptedIn
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x270F9A6D0])(BDSSyncUserDefaults, sel__isICloudDriveSyncOptedIn);
}

+ (BOOL)_isICloudDriveSyncOptedIn
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3, v4, v5, v6, v7);
  int isPrimaryAccountManagedAppleID = objc_msgSend_isPrimaryAccountManagedAppleID(v8, v9, v10, v11, v12, v13, v14, v15);

  v24 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v17, v18, v19, v20, v21, v22, v23);
  int v31 = objc_msgSend_BOOLForKey_(v24, v25, @"BCSyncICloudDrive", v26, v27, v28, v29, v30);

  v39 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v32, v33, v34, v35, v36, v37, v38);
  int v46 = objc_msgSend_BOOLForKey_(v39, v40, @"BCSyncCloudKit", v41, v42, v43, v44, v45);

  v47 = BDSUbiquityLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = @"NO";
    if (isPrimaryAccountManagedAppleID) {
      v49 = @"YES";
    }
    else {
      v49 = @"NO";
    }
    if (v31) {
      v50 = @"YES";
    }
    else {
      v50 = @"NO";
    }
    int v52 = 138412802;
    v53 = v49;
    __int16 v54 = 2112;
    v55 = v50;
    if (v46) {
      v48 = @"YES";
    }
    __int16 v56 = 2112;
    v57 = v48;
    _os_log_impl(&dword_2360BC000, v47, OS_LOG_TYPE_INFO, "BDSSyncUserDefaults: isICloudDriveSyncOptedIn int isPrimaryAccountManagedAppleID = %@ isBCSyncICloudDriveUserDefaults = %@ isBCSyncCloudKitUserDefaults = %@", (uint8_t *)&v52, 0x20u);
  }

  return isPrimaryAccountManagedAppleID | v31 & v46;
}

+ (BOOL)_isBundleIdentifierInArray:(__CFArray *)a3
{
  objc_msgSend__booksAppBundleIdentifier(a1, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFIndex Count = CFArrayGetCount(a3);
  if (Count)
  {
    unint64_t v11 = Count;
    CFIndex v12 = 0;
    BOOL v13 = 1;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v12);
      CFTypeID v15 = CFGetTypeID(ValueAtIndex);
      if (v15 == CFStringGetTypeID() && CFEqual(ValueAtIndex, v9)) {
        break;
      }
      BOOL v13 = ++v12 < v11;
    }
    while (v11 != v12);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_isServiceEnabledAlternative:(__CFString *)a3
{
  uint64_t v4 = TCCAccessCopyBundleIdentifiersForService();
  if (v4)
  {
    unint64_t v11 = (const void *)v4;
    char isBundleIdentifierInArray = objc_msgSend__isBundleIdentifierInArray_(BDSSyncUserDefaults, v5, v4, v6, v7, v8, v9, v10);
    CFRelease(v11);
    return isBundleIdentifierInArray;
  }
  else
  {
    uint64_t v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361F85FC((uint64_t)a3, v14);
    }

    return 0;
  }
}

+ (BOOL)_isServiceDisabledAlternative:(__CFString *)a3
{
  uint64_t v4 = TCCAccessCopyBundleIdentifiersDisabledForService();
  if (v4)
  {
    unint64_t v11 = (const void *)v4;
    char isBundleIdentifierInArray = objc_msgSend__isBundleIdentifierInArray_(BDSSyncUserDefaults, v5, v4, v6, v7, v8, v9, v10);
    CFRelease(v11);
    return isBundleIdentifierInArray;
  }
  else
  {
    uint64_t v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361F8674((uint64_t)a3, v14);
    }

    return 1;
  }
}

+ (void)_setService:(__CFString *)a3 enabled:(BOOL)a4
{
  BOOL v8 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend__booksAppBundleIdentifier(a1, a2, (uint64_t)a3, a4, v4, v5, v6, v7);
  int v11 = TCCAccessSetForBundleId();
  CFIndex v12 = BDSCloudKitLog();
  BOOL v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = @"NO";
      if (v8) {
        uint64_t v14 = @"YES";
      }
      int v15 = 138543618;
      v16 = a3;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_INFO, "Successfully set %{public}@ to %{public}@.", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_2361F86EC((uint64_t)a3, v8, v13);
  }
}

+ (id)_booksAppBundleIdentifier
{
  return (id)objc_msgSend_bdsAppBundleIdentifier(BDSAppBundleIdentifier, a2, v2, v3, v4, v5, v6, v7);
}

+ (id)_stateForLog
{
  v89[5] = *MEMORY[0x263EF8340];
  v88[0] = @"isSignedIntoICloud";
  uint64_t v9 = NSNumber;
  uint64_t isSignedIntoICloud = objc_msgSend_isSignedIntoICloud(a1, a2, v2, v3, v4, v5, v6, v7);
  __int16 v17 = objc_msgSend_numberWithBool_(v9, v11, isSignedIntoICloud, v12, v13, v14, v15, v16);
  v89[0] = v17;
  v88[1] = @"isCloudKitSyncOptedIn";
  uint64_t v18 = NSNumber;
  uint64_t isCloudKitSyncOptedIn = objc_msgSend_isCloudKitSyncOptedIn(a1, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v33 = objc_msgSend_numberWithBool_(v18, v27, isCloudKitSyncOptedIn, v28, v29, v30, v31, v32);
  v89[1] = v33;
  v88[2] = @"isICloudDriveSyncOptedIn";
  uint64_t v34 = NSNumber;
  uint64_t isICloudDriveSyncOptedIn = objc_msgSend_isICloudDriveSyncOptedIn(a1, v35, v36, v37, v38, v39, v40, v41);
  v49 = objc_msgSend_numberWithBool_(v34, v43, isICloudDriveSyncOptedIn, v44, v45, v46, v47, v48);
  v89[2] = v49;
  v88[3] = @"isGlobalICloudDriveSyncOptedIn";
  v50 = NSNumber;
  uint64_t isGlobalICloudDriveSyncOptedIn = objc_msgSend_isGlobalICloudDriveSyncOptedIn(a1, v51, v52, v53, v54, v55, v56, v57);
  v65 = objc_msgSend_numberWithBool_(v50, v59, isGlobalICloudDriveSyncOptedIn, v60, v61, v62, v63, v64);
  v89[3] = v65;
  v88[4] = @"iCloudIdentityExists";
  v66 = NSNumber;
  v74 = objc_msgSend_iCloudIdentity(a1, v67, v68, v69, v70, v71, v72, v73);
  v81 = objc_msgSend_numberWithInt_(v66, v75, v74 != 0, v76, v77, v78, v79, v80);
  v89[4] = v81;
  v86 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v82, (uint64_t)v89, (uint64_t)v88, 5, v83, v84, v85);

  return v86;
}

@end