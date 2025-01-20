uint64_t MCMContainerContentClassForMBContainerType(int a1)
{
  if ((a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1DAC8[a1 - 1];
  }
}

__CFString *MBStringForContainerType(int a1)
{
  if ((a1 - 1) > 4) {
    return 0;
  }
  else {
    return off_28BB8[a1 - 1];
  }
}

uint64_t sub_583C(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Data/Application"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Data/PluginKitPlugin"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Shared/AppGroup"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"System/Data"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"System/Shared"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id sub_65B8(void *a1)
{
  id v1 = [a1 stringByStandardizingPath];
  uint64_t v2 = [v1 stringByDeletingLastPathComponent];
  v3 = objc_msgSend(v1, "substringFromIndex:", (char *)objc_msgSend(v2, "length") + 1);
  v4 = [v3 stringByAppendingPathComponent:@"PlaceholderEntitlements.plist"];

  return v4;
}

id sub_6E88()
{
  if (qword_2EAB8 != -1) {
    dispatch_once(&qword_2EAB8, &stru_28AF8);
  }
  v0 = (void *)qword_2EAB0;

  return v0;
}

id sub_6EDC()
{
  if (qword_2EAC8 != -1) {
    dispatch_once(&qword_2EAC8, &stru_28B18);
  }
  v0 = (void *)qword_2EAC0;

  return v0;
}

id sub_6F30()
{
  if (qword_2EAD8 != -1) {
    dispatch_once(&qword_2EAD8, &stru_28B38);
  }
  v0 = (void *)qword_2EAD0;

  return v0;
}

void sub_75C4(id a1)
{
  qword_2EA70 = +[NSSet setWithObjects:kCFBundleIdentifierKey, @"ContainerContentClass", kCFBundleVersionKey, @"Path", @"SafeHarborDockingDate", 0];

  _objc_release_x1();
}

void sub_7648(id a1)
{
  qword_2EA80 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &stru_29500, 0);

  _objc_release_x1();
}

void sub_769C(id a1)
{
  sub_6EDC();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[NSSet setWithObjects:@".com.apple.mobile_container_manager.metadata.plist", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  v3 = (void *)qword_2EA90;
  qword_2EA90 = v2;
}

void sub_7738(id a1)
{
  sub_6F30();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[NSSet setWithObjects:@"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", @"Library/Caches/NeverRestore", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  v3 = (void *)qword_2EAA0;
  qword_2EAA0 = v2;
}

void sub_77D4(id a1)
{
  qword_2EAB0 = +[NSSet setWithObjects:@"Documents", @"Library", @"GeoJSON", 0];

  _objc_release_x1();
}

void sub_783C(id a1)
{
  qword_2EAC0 = +[NSSet setWithObjects:@"Library/Caches", @"Library/SyncedPreferences", @"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", @"SystemData/com.apple.chrono", 0];

  _objc_release_x1();
}

void sub_78C0(id a1)
{
  qword_2EAD0 = +[NSSet setWithObjects:@"NewsstandArtwork", @"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", @"SystemData/com.apple.chrono", 0];

  _objc_release_x1();
}

void sub_793C(id a1)
{
  qword_2EAE0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &stru_29500, 0);

  _objc_release_x1();
}

void sub_7990(id a1)
{
  id v4 = sub_6EDC();
  id v1 = +[NSSet setWithObjects:@".com.apple.mobile_container_manager.metadata.plist", @"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  v3 = (void *)qword_2EAF0;
  qword_2EAF0 = v2;
}

void sub_7A34(id a1)
{
  sub_6F30();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[NSSet setWithObjects:@"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  v3 = (void *)qword_2EB00;
  qword_2EB00 = v2;
}

void sub_8588(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_85D8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _configureAppPlaceholderAtPath:*(void *)(a1 + 40) installType:*(void *)(a1 + 80) isDataSeparated:*(unsigned __int8 *)(a1 + 88) migratorCache:*(void *)(a1 + 48)])atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 1u); {
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_B4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_B53C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_B54C(uint64_t a1)
{
}

void sub_B554(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

CFStringRef copyPasswordFromKeychain()
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0;
  }
  uint64_t v1 = Mutable;
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(v1, kSecAttrService, @"BackupAgent");
  CFDictionaryAddValue(v1, kSecAttrAccount, @"BackupPassword");
  CFDictionaryAddValue(v1, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0;
  OSStatus v2 = SecItemCopyMatching(v1, &result);
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = result == 0;
  }
  if (v3)
  {
    id v4 = MBGetDefaultLog();
    v5 = v4;
    if (v2 == -25300)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Couldn't find an encrypted backup password in the keychain.", buf, 2u);
LABEL_13:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v12 = v2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Could not copy encrypted backup password from keychain: %d", buf, 8u);
      goto LABEL_13;
    }

    CFStringRef v8 = 0;
    goto LABEL_15;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)result);
  CFIndex Length = CFDataGetLength((CFDataRef)result);
  CFStringRef v8 = CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 1u);
LABEL_15:
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  CFRelease(v1);
  return v8;
}

void setLockdownEncryptionInfo(uint64_t a1)
{
  if (lockdown_connect())
  {
    int v2 = lockdown_set_value();
    BOOL v3 = MBGetDefaultLog();
    id v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v7) = v2;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Could not set lockdown key for encryption: %d", buf, 8u);
LABEL_10:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v7 = @"WillEncrypt";
      __int16 v8 = 2112;
      uint64_t v9 = a1;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%@ key successfully set to %@", buf, 0x16u);
      goto LABEL_10;
    }

    lockdown_disconnect();
    return;
  }
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Could not connect to lockdown!", buf, 2u);
    _MBLog();
  }
}

void makeLockdownEncryptionInfoConsistentWithKeychain()
{
  v0 = MBGetDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_INFO, "Setting lockdown key to be consistent with the keychain", buf, 2u);
    _MBLog();
  }

  CFStringRef v1 = copyPasswordFromKeychain();
  int v2 = MBGetDefaultLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "setting lockdown encryption info since a password exists in the keychain", v5, 2u);
      _MBLog();
    }

    setLockdownEncryptionInfo((uint64_t)kCFBooleanTrue);
    CFRelease(v1);
  }
  else
  {
    if (v3)
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "clearing lockdown encryption info since a password doesn't exist in the keychain", v4, 2u);
      _MBLog();
    }

    setLockdownEncryptionInfo((uint64_t)kCFBooleanFalse);
  }
}

uint64_t setPasswordInKeychain(const __CFString *a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    BOOL v3 = Mutable;
    CFBooleanRef v4 = kCFBooleanFalse;
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(v3, kSecAttrService, @"BackupAgent");
    CFDictionaryAddValue(v3, kSecAttrAccount, @"BackupPassword");
    CFDictionaryAddValue(v3, kSecReturnData, kCFBooleanFalse);
    if (!a1)
    {
      OSStatus v10 = SecItemDelete(v3);
      if (v10 != -25300)
      {
        OSStatus v11 = v10;
        if (!v10)
        {
          OSStatus v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Encrypted backup password successfully deleted from the keychain", buf, 2u);
            _MBLog();
          }

          uint64_t v9 = 0;
          goto LABEL_31;
        }
        v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          OSStatus v22 = v11;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Could not delete encrypted backup password from the keychain: %d", buf, 8u);
          _MBLog();
        }
      }
      uint64_t v9 = 1;
      goto LABEL_31;
    }
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, a1, 0x8000100u, 0x3Fu);
    if (SecItemCopyMatching(v3, 0))
    {
      CFDictionaryAddValue(v3, kSecValueData, ExternalRepresentation);
      OSStatus v6 = SecItemAdd(v3, 0);
      if (!v6)
      {
        CFBooleanRef v4 = kCFBooleanTrue;
        v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Encrypted backup password successfully added to the keychain", buf, 2u);
          _MBLog();
        }

        uint64_t v9 = 0;
        if (!ExternalRepresentation) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      OSStatus v7 = v6;
      __int16 v8 = MBGetDefaultLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_29:

        uint64_t v9 = 1;
        if (ExternalRepresentation) {
LABEL_30:
        }
          CFRelease(ExternalRepresentation);
LABEL_31:
        setLockdownEncryptionInfo((uint64_t)v4);
        CFRelease(v3);
        return v9;
      }
      *(_DWORD *)buf = 67109120;
      OSStatus v22 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Could not add the encrypted backup password to the keychain: %d", buf, 8u);
    }
    else
    {
      v13 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v13)
      {
        CFDictionaryRef v14 = v13;
        CFDictionaryAddValue(v13, kSecValueData, ExternalRepresentation);
        OSStatus v15 = SecItemUpdate(v3, v14);
        v16 = MBGetDefaultLog();
        v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            OSStatus v22 = v15;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "There was an error updating the backup password in the keychain: %d", buf, 8u);
            _MBLog();
          }

          uint64_t v9 = 1;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Encrypted backup password successfully updated in the keychain", buf, 2u);
            _MBLog();
          }

          uint64_t v9 = 0;
          CFBooleanRef v4 = kCFBooleanTrue;
        }
        CFRelease(v14);
        if (!ExternalRepresentation) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      __int16 v8 = MBGetDefaultLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Could not create a dictionary for the new encrypted backup password", buf, 2u);
    }
    _MBLog();
    goto LABEL_29;
  }
  return 1;
}

uint64_t MBExcludedAppTypeFromAppRecord(void *a1)
{
  id v1 = a1;
  int v2 = [v1 managementDomain];
  unsigned __int8 v3 = [v2 hasPrefix:@"swift-playgrounds"];

  if (v3)
  {
    uint64_t v4 = 2;
  }
  else
  {
    v5 = [v1 appClipMetadata];
    uint64_t v4 = v5 != 0;
  }
  return v4;
}

id sub_D774(void *a1, void *a2)
{
  id v3 = a1;
  v103 = a2;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = [v3 bundleIdentifier];
  if (!v5)
  {
    OSStatus v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = (uint64_t)v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "app.bundleIdentifier is nil: %@", buf, 0xCu);
      id v73 = v3;
      _MBLog();
    }
  }
  [v4 setObject:v5 forKeyedSubscript:v73];
  OSStatus v7 = MBStringForContainerType(1);
  [v4 setObject:v7 forKeyedSubscript:@"ContainerContentClass"];

  __int16 v8 = [v3 bundleVersion];

  if (v8)
  {
    uint64_t v9 = [v3 bundleVersion];
    [v4 setObject:v9 forKeyedSubscript:kCFBundleVersionKey];
  }
  uint64_t v10 = objc_msgSend(v3, "mb_applicationType");
  v85 = (void *)v10;
  if (v10)
  {
    [v4 setObject:v10 forKeyedSubscript:@"ApplicationType"];
  }
  else
  {
    OSStatus v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = v5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "app.applicationType is nil for \"%@\"", buf, 0xCu);
      uint64_t v74 = v5;
      _MBLog();
    }
  }
  OSStatus v12 = objc_msgSend(v3, "mb_bundleURL", v74);
  v84 = v12;
  if (v12)
  {
    v13 = sub_108DC(v12);
    [v4 setObject:v13 forKeyedSubscript:@"Path"];
  }
  else
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = v5;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "app.bundleURL is nil for \"%@\"", buf, 0xCu);
      uint64_t v75 = v5;
      _MBLog();
    }
  }

  CFDictionaryRef v14 = [v3 dataContainerURL];
  v83 = v14;
  if (v14)
  {
    OSStatus v15 = sub_108DC(v14);
    [v4 setObject:v15 forKeyedSubscript:@"Container"];
  }
  else
  {
    OSStatus v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = v5;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "app.dataContainerURL is nil for \"%@\"", buf, 0xCu);
      uint64_t v75 = v5;
      _MBLog();
    }
  }

  v16 = objc_msgSend(v3, "mb_entitlements");
  v86 = v16;
  v87 = v5;
  if (![v16 count])
  {
    v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (v86) {
        v18 = "empty";
      }
      else {
        v18 = "nil";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v125 = (uint64_t)v18;
      __int16 v126 = 2112;
      v127 = v87;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "Found %s entitlements dictionary for %@", buf, 0x16u);
      uint64_t v75 = (uint64_t)v18;
      v79 = v87;
      _MBLog();
    }

    v16 = v86;
  }
  if (v16) {
    [v4 setObject:v16 forKeyedSubscript:@"Entitlements"];
  }
  v19 = objc_msgSend(v3, "applicationExtensionRecords", v75, v79);
  id v20 = [v19 count];

  id v97 = v3;
  v91 = v4;
  if (v20)
  {
    v90 = +[NSMutableArray array];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    v21 = [v3 applicationExtensionRecords];
    id v22 = [v21 countByEnumeratingWithState:&v113 objects:v133 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v114;
      uint64_t v88 = *(void *)v114;
      v89 = v21;
      do
      {
        v25 = 0;
        id v92 = v23;
        do
        {
          if (*(void *)v114 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v113 + 1) + 8 * (void)v25);
          v27 = objc_msgSend(v26, "dataContainerURL", v76, v80, v81, v82);
          v28 = objc_msgSend(v26, "mb_bundleURL");
          v102 = objc_msgSend(v26, "mb_pluginIdentifier");
          v98 = v28;
          if (!v27)
          {
            v48 = MBGetDefaultLog();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v125 = (uint64_t)v102;
            __int16 v126 = 2112;
            v127 = 0;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a data container (%@) - will not be backed up.", buf, 0x16u);
            v76 = v102;
            v80 = 0;
LABEL_70:
            _MBLog();
            goto LABEL_78;
          }
          if (!v28)
          {
            v48 = MBGetDefaultLog();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v125 = (uint64_t)v102;
            __int16 v126 = 2112;
            v127 = 0;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a bundle URL (%@) - will not be backed up.", buf, 0x16u);
            v76 = v102;
            v80 = 0;
            goto LABEL_70;
          }
          if (!v102)
          {
            v48 = MBGetDefaultLog();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v125 = 0;
            __int16 v126 = 2112;
            v127 = 0;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", buf, 0x16u);
            v76 = 0;
            v80 = 0;
            goto LABEL_70;
          }
          uint64_t v29 = sub_108DC(v28);
          uint64_t v30 = sub_108DC(v27);
          v96 = v29;
          if (v29)
          {
            v95 = (void *)v30;
            if (v30)
            {
              v31 = objc_msgSend(v26, "mb_entitlements");
              if (!v31)
              {
                v32 = MBGetDefaultLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v125 = (uint64_t)v102;
                  _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEBUG, "Plugin %@ found without entitlements.", buf, 0xCu);
                  v76 = v102;
                  _MBLog();
                }

                v31 = &__NSDictionary0__struct;
              }
              v93 = v31;
              v94 = v25;
              v99 = +[NSMutableArray array];
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              v33 = [v26 groupContainerURLs];
              id v34 = [v33 countByEnumeratingWithState:&v109 objects:v132 count:16];
              if (v34)
              {
                id v35 = v34;
                uint64_t v36 = *(void *)v110;
                v100 = v33;
                do
                {
                  for (i = 0; i != v35; i = (char *)i + 1)
                  {
                    if (*(void *)v110 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    v38 = *(NSObject **)(*((void *)&v109 + 1) + 8 * i);
                    v39 = objc_msgSend(v26, "groupContainerURLs", v76);
                    v40 = [v39 objectForKeyedSubscript:v38];

                    if (v40)
                    {
                      v41 = sub_108DC(v40);
                      if (v41)
                      {
                        if (MBPathHasVolumePrefix())
                        {
                          v123[0] = v38;
                          v122[0] = kCFBundleIdentifierKey;
                          v122[1] = @"ContainerContentClass";
                          v42 = MBStringForContainerType(3);
                          v122[2] = @"Container";
                          v123[1] = v42;
                          v123[2] = v41;
                          v43 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:3];

                          [v99 addObject:v43];
LABEL_60:

                          goto LABEL_61;
                        }
                        v43 = MBGetDefaultLog();
                        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_60;
                        }
                        *(_DWORD *)buf = 138413058;
                        uint64_t v125 = (uint64_t)v102;
                        __int16 v126 = 2112;
                        v127 = v38;
                        __int16 v128 = 2112;
                        v129 = v41;
                        __int16 v130 = 2112;
                        v131 = v103;
                        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", buf, 0x2Au);
                        v81 = v41;
                        v82 = v103;
                        v33 = v100;
                        v76 = v102;
                        v80 = v38;
                      }
                      else
                      {
                        v43 = MBGetDefaultLog();
                        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_60;
                        }
                        *(_DWORD *)buf = 138412546;
                        uint64_t v125 = (uint64_t)v102;
                        __int16 v126 = 2112;
                        v127 = v38;
                        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", buf, 0x16u);
                        v76 = v102;
                        v80 = v38;
                        v33 = v100;
                      }
                      _MBLog();
                      goto LABEL_60;
                    }
                    v41 = MBGetDefaultLog();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v125 = (uint64_t)v102;
                      __int16 v126 = 2112;
                      v127 = v38;
                      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found without a container - will not be backed up", buf, 0x16u);
                      v76 = v102;
                      v80 = v38;
                      _MBLog();
                    }
LABEL_61:
                  }
                  id v35 = [v33 countByEnumeratingWithState:&v109 objects:v132 count:16];
                }
                while (v35);
              }

              v121[0] = v102;
              v120[0] = kCFBundleIdentifierKey;
              v120[1] = @"ContainerContentClass";
              v44 = MBStringForContainerType(2);
              v121[1] = v44;
              v45 = v95;
              v121[2] = v96;
              v120[2] = @"Path";
              v120[3] = @"Container";
              v121[3] = v95;
              v46 = v93;
              v121[4] = v93;
              v120[4] = @"Entitlements";
              v120[5] = @"GroupContainers";
              v121[5] = v99;
              v47 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:6];

              v48 = v96;
              [v90 addObject:v47];

              uint64_t v4 = v91;
              id v23 = v92;
              uint64_t v24 = v88;
              v21 = v89;
              v25 = v94;
            }
            else
            {
              v46 = MBGetDefaultLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v125 = (uint64_t)v102;
                _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Plugin %@ found with a nil SanitizedFilesystemRepresentation for dataContainerURL - will not be backed up.", buf, 0xCu);
                v76 = v102;
                _MBLog();
              }
              v45 = 0;
              v48 = v96;
            }
          }
          else
          {
            v45 = (void *)v30;
            v46 = MBGetDefaultLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v125 = (uint64_t)v102;
              _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Plugin %@ found with a nil SanitizedFilesystemRepresentation for bundleURL - will not be backed up.", buf, 0xCu);
              v76 = v102;
              _MBLog();
            }
            v48 = 0;
          }

LABEL_78:
          v25 = (char *)v25 + 1;
        }
        while (v25 != v23);
        id v23 = [v21 countByEnumeratingWithState:&v113 objects:v133 count:16];
      }
      while (v23);
    }

    [v4 setObject:v90 forKeyedSubscript:@"Plugins"];
    id v3 = v97;
  }
  v49 = objc_msgSend(v3, "groupContainerURLs", v76);
  id v50 = [v49 count];

  if (!v50) {
    goto LABEL_102;
  }
  v51 = +[NSMutableArray array];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v52 = [v3 groupContainerURLs];
  id v53 = [v52 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (!v53) {
    goto LABEL_101;
  }
  id v54 = v53;
  uint64_t v55 = *(void *)v106;
  do
  {
    v56 = 0;
    id v101 = v54;
    do
    {
      if (*(void *)v106 != v55) {
        objc_enumerationMutation(v52);
      }
      v57 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v56);
      v58 = objc_msgSend(v3, "groupContainerURLs", v77, v80, v81);
      v59 = [v58 objectForKeyedSubscript:v57];

      if (v59)
      {
        v60 = sub_108DC(v59);
        if (v60)
        {
          if (MBPathHasVolumePrefix())
          {
            v118[0] = v57;
            v117[0] = kCFBundleIdentifierKey;
            v117[1] = @"ContainerContentClass";
            v61 = MBStringForContainerType(3);
            v117[2] = @"Container";
            v118[1] = v61;
            v118[2] = v60;
            v62 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:3];

            [v51 addObject:v62];
LABEL_98:

            id v3 = v97;
            goto LABEL_99;
          }
          v62 = MBGetDefaultLog();
          if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_98;
          }
          *(_DWORD *)buf = 138412802;
          uint64_t v125 = (uint64_t)v57;
          __int16 v126 = 2112;
          v127 = v60;
          __int16 v128 = 2112;
          v129 = v103;
          _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", buf, 0x20u);
          v80 = v60;
          v81 = v103;
          id v54 = v101;
          v77 = v57;
        }
        else
        {
          v62 = MBGetDefaultLog();
          if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_98;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v125 = (uint64_t)v57;
          _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", buf, 0xCu);
          v77 = v57;
        }
        _MBLog();
        goto LABEL_98;
      }
      v60 = MBGetDefaultLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v125 = (uint64_t)v57;
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ found without a container - will not be backed up", buf, 0xCu);
        v77 = v57;
        _MBLog();
      }
LABEL_99:

      v56 = (char *)v56 + 1;
    }
    while (v54 != v56);
    id v54 = [v52 countByEnumeratingWithState:&v105 objects:v119 count:16];
  }
  while (v54);
LABEL_101:

  uint64_t v4 = v91;
  [v91 setObject:v51 forKeyedSubscript:@"GroupContainers"];

LABEL_102:
  id v63 = objc_msgSend(v3, "isPlaceholder", v77);
  v64 = +[NSNumber numberWithBool:v63];
  [v4 setObject:v64 forKeyedSubscript:@"IsPlaceholder"];

  v65 = [v3 applicationState];
  v66 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v65 isInstalled]);
  [v4 setObject:v66 forKeyedSubscript:@"IsInstalled"];

  if ((v63 & 1) == 0)
  {
    id v104 = 0;
    id v67 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v87 allowPlaceholder:1 error:&v104];
    id v68 = v104;
    if ([v67 hasParallelPlaceholder])
    {
      v69 = MBGetDefaultLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = [v3 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v125 = (uint64_t)v70;
        _os_log_impl(&dword_0, v69, OS_LOG_TYPE_INFO, "%@ has a parallel placeholder", buf, 0xCu);

        v78 = [v3 bundleIdentifier];
        _MBLog();
      }
      v71 = &__kCFBooleanTrue;
    }
    else
    {
      v71 = &__kCFBooleanFalse;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v71, @"IsUpdating", v78);
  }

  return v4;
}

void sub_F8F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_F9E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_FE30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_108DC(void *a1)
{
  id v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 fileSystemRepresentation]);
  if ([v1 hasPrefix:@"/private"])
  {
    uint64_t v2 = [v1 substringFromIndex:objc_msgSend(@"/private", "length")];

    id v1 = (void *)v2;
  }

  return v1;
}

void sub_10F5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10FF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_11258()
{
  v0 = (objc_class *)objc_opt_class();
  Name = class_getName(v0);
  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v3 = dispatch_queue_create(Name, v2);
  uint64_t v4 = (void *)qword_2EB28;
  qword_2EB28 = (uint64_t)v3;
}

void sub_12B50(uint64_t a1)
{
  uint64_t v2 = +[ACAccountStore defaultStore];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) accountIdentifier];
  id v4 = [v2 accountWithIdentifier:v3];

  [*(id *)(a1 + 32) _reloadAccountPropertiesFromACAccount:v4];
}

void sub_12EF4(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.backupd.saveAccount", attr);
  dispatch_queue_t v3 = (void *)qword_2EB38;
  qword_2EB38 = (uint64_t)v2;
}

void sub_12F78(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  if (v2 == [*(id *)(a1 + 32) isEnabledForDataclass:*(void *)(a1 + 40)])
  {
    dispatch_queue_t v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v6 = *(unsigned __int8 *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v4;
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      __int16 v19 = 1024;
      int v20 = v6;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "No need to save the \"%{public}@\" state for account %{public}@: %d", buf, 0x1Cu);
      _MBLog();
    }

    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v7);
  }
  else
  {
    [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 64) forDataclass:*(void *)(a1 + 40)];
    __int16 v8 = +[ACAccountStore defaultStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_13154;
    v10[3] = &unk_28CF8;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    char v14 = *(unsigned char *)(a1 + 64);
    id v13 = *(id *)(a1 + 56);
    [v8 saveAccount:v9 withCompletionHandler:v10];
  }
}

void sub_13154(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  int v6 = MBGetDefaultLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = *(unsigned __int8 *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      LODWORD(v19) = v10;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Saved the \"%{public}@\" state for account %{public}@: %d", buf, 0x1Cu);
      _MBLog();
    }

    uint64_t v7 = v5;
    uint64_t v5 = 0;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Failed to save \"%{public}@\" state for account %{public}@: %@", buf, 0x20u);
    _MBLog();
  }

  (*(void (**)(void, NSObject *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v13);
}

void sub_136BC(uint64_t a1)
{
  int v2 = +[ACAccountStore defaultStore];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v4 = [v2 accountWithIdentifier:v3];

  if (v4)
  {
    uint64_t v5 = +[ACAccountStore defaultStore];
    [v5 renewCredentialsForAccount:v4 completion:&stru_28D60];
  }
  else
  {
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Unable to retrieve account, cannot renew credentials", v6, 2u);
      _MBLog();
    }
  }
}

void sub_137B0(id a1, int64_t a2, NSError *a3)
{
  uint64_t v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = +[MBServiceAccount _stringForAccountCredentialRenewResult:a2];
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Account credentials %@ (%d)", buf, 0x12u);

    int v6 = +[MBServiceAccount _stringForAccountCredentialRenewResult:a2];
    _MBLog();
  }
}

void sub_13AF4(uint64_t a1)
{
  int v2 = +[ACAccountStore defaultStore];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v4 = [v2 accountWithIdentifier:v3];

  uint64_t v5 = MBGetDefaultLog();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updating account", buf, 2u);
      _MBLog();
    }

    uint64_t v7 = +[ACAccountStore defaultStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_13CF4;
    v10[3] = &unk_28D88;
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    id v12 = *(id *)(a1 + 40);
    objc_msgSend(v7, "aa_updatePropertiesForAppleAccount:completion:", v11, v10);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "No primary account found to update", buf, 2u);
      _MBLog();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      __int16 v9 = +[MBError errorWithCode:1 format:@"No primary account found to update"];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void sub_13CF4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = MBGetDefaultLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Updated account", buf, 2u);
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = +[MBError descriptionForError:v5];
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Error updating account: %@", buf, 0xCu);

    int v10 = +[MBError descriptionForError:v5];
    _MBLog();
  }
  [*(id *)(a1 + 32) _reloadAccountPropertiesFromACAccount:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }
}

void sub_13FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_13FD4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_13FE4(uint64_t a1)
{
}

void sub_13FEC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_14174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1418C(uint64_t a1)
{
  int v2 = +[ACAccountStore defaultStore];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) accountIdentifier];
  id v9 = [v2 accountWithIdentifier:v3];

  if (v9)
  {
    id v4 = [v9 username];
    id v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_14354(uint64_t a1)
{
  int v2 = +[ACAccountStore defaultStore];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) accountIdentifier];
  id v4 = [v2 accountWithIdentifier:v3];

  id v5 = MBGetDefaultLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Re-authenticating account", buf, 2u);
      _MBLog();
    }

    objc_msgSend(v4, "aa_setPassword:", &stru_29500);
    objc_msgSend(v4, "aa_setPassword:", *(void *)(a1 + 40));
    uint64_t v7 = +[ACAccountStore defaultStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1455C;
    v10[3] = &unk_28E28;
    void v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v7 verifyCredentialsForAccount:v4 withHandler:v10];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "No primary account found to update", buf, 2u);
      _MBLog();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = +[MBError errorWithCode:1 format:@"No primary account found to update"];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void sub_1455C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MBGetDefaultLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Authenticated account", buf, 2u);
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = +[MBError descriptionForError:v6];
    *(_DWORD *)buf = 138412290;
    __int16 v16 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Error authenticating account: %@", buf, 0xCu);

    char v14 = +[MBError descriptionForError:v6];
    _MBLog();
  }
  int v10 = +[ACAccountStore defaultStore];
  id v11 = [*(id *)(a1 + 32) accountIdentifier];
  id v12 = [v10 accountWithIdentifier:v11];

  [*(id *)(a1 + 32) _reloadAccountPropertiesFromACAccount:v12];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
  }
}

void sub_14884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_148A8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_14D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_14D70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:AKAuthenticationPasswordKey];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_14FF0(id a1)
{
  qword_2EB50 = (uint64_t)dispatch_queue_create("MBLockdown", 0);
}

uint64_t sub_15118(uint64_t a1)
{
  uint64_t result = lockdown_connect();
  *(void *)(*(void *)(a1 + 32) + 8) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 8) != 0;
  return result;
}

uint64_t sub_151D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v2 + 8);
  if (result)
  {
    uint64_t result = lockdown_disconnect();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 8) = 0;
  return result;
}

void sub_152E4(uint64_t a1, uint64_t a2)
{
}

void sub_152F4(uint64_t a1)
{
}

uint64_t sub_15300(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t result = lockdown_copy_value();
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

uint64_t sub_153FC(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t result = lockdown_save_value();
    if (result)
    {
      int v3 = result;
      id v4 = MBGetDefaultLog();
      uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v8 = v5;
        __int16 v9 = 2112;
        uint64_t v10 = v6;
        __int16 v11 = 1024;
        int v12 = v3;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Failed to save object to lockdown with domain '%@', key '%@': %d", buf, 0x1Cu);
        uint64_t result = _MBLog();
      }
      if (*(void *)(a1 + 72))
      {
        uint64_t result = +[MBError errorWithCode:1 format:@"Failed to save object to lockdown"];
        **(void **)(a1 + 72) = result;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  return result;
}

uint64_t sub_155EC(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"com.apple.mobile.backup"] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:@"com.apple.mobile.ldbackup"] & 1) != 0
    || [*(id *)(a1 + 32) isEqualToString:@"com.apple.purplebuddy"])
  {
    uint64_t v2 = *(__CFString **)(a1 + 32);
    if ([(__CFString *)v2 isEqualToString:@"com.apple.mobile.backup"]) {
      uint64_t v2 = @"com.apple.mobile.ldbackup";
    }
    CFStringRef v3 = (const __CFString *)kMBMobileUserName;
    CFPreferencesSetValue(*(CFStringRef *)(a1 + 40), 0, v2, kMBMobileUserName, kCFPreferencesAnyHost);
    uint64_t result = CFPreferencesSynchronize(v2, v3, kCFPreferencesAnyHost);
    if (!result)
    {
      uint64_t v5 = MBGetDefaultLog();
      uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        int v12 = v2;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Failed to sync preferences for %@ domain (%@)", buf, 0x16u);
        return _MBLog();
      }
    }
  }
  else
  {
    uint64_t result = *(void *)(*(void *)(a1 + 48) + 8);
    if (result)
    {
      uint64_t result = lockdown_remove_value();
      if (result)
      {
        int v7 = result;
        uint64_t v8 = MBGetDefaultLog();
        uint64_t result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (result)
        {
          __int16 v9 = *(__CFString **)(a1 + 32);
          uint64_t v10 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          int v12 = v9;
          __int16 v13 = 2112;
          uint64_t v14 = v10;
          __int16 v15 = 1024;
          int v16 = v7;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to remove object from lockdown with domain '%@', key '%@': %d", buf, 0x1Cu);
          uint64_t result = _MBLog();
        }
        if (*(void *)(a1 + 64))
        {
          uint64_t result = +[MBError errorWithCode:1 format:@"Failed to remove object from lockdown"];
          **(void **)(a1 + 64) = result;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  return result;
}

uint64_t sub_15D38@<X0>(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_19F40();
  __chkstk_darwin();
  __int16 v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    uint64_t v22 = v9;
    if (qword_2E828 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_17468(v8, (uint64_t)qword_2E890);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v11, v18, v8);
    uint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    sub_1A010(22);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v23 = (uint64_t)a1;
    unint64_t v24 = (unint64_t)a2;
    v27._object = (void *)0x8000000000021670;
    v27._countAndFlagsBits = 0xD000000000000014;
    sub_19FB0(v27);
    sub_19F10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(a4, 0, 1, v8);
  }
  if (a3 == 1)
  {
    uint64_t v22 = v9;
    id v12 = [a1 persona];
    id v13 = [v12 personaIdentifier];

    uint64_t v14 = sub_19F90();
    unint64_t v16 = v15;

    if (qword_2E828 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_17468(v8, (uint64_t)qword_2E890);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v11, v17, v8);
    uint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    sub_1A010(22);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v23 = v14;
    unint64_t v24 = v16;
    v26._object = (void *)0x8000000000021670;
    v26._countAndFlagsBits = 0xD000000000000014;
    sub_19FB0(v26);
    sub_19F10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
    sub_16B78(a1, a2, 1);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(a4, 0, 1, v8);
  }
  int v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);

  return v20(a4, 1, 1, v8);
}

unint64_t sub_160BC(void *a1, void *a2, char a3)
{
  unint64_t v5 = 0xD000000000000019;
  if (!a3)
  {
    sub_1A010(43);
    swift_bridgeObjectRelease();
    unint64_t v13 = 0xD000000000000028;
    v16._countAndFlagsBits = (uint64_t)a1;
    v16._object = a2;
    sub_19FB0(v16);
    v17._countAndFlagsBits = 41;
    v17._object = (void *)0xE100000000000000;
    sub_19FB0(v17);
    return v13;
  }
  if (a3 == 1)
  {
    id v6 = a1;
    sub_1A010(50);
    swift_bridgeObjectRelease();
    unint64_t v13 = 0xD00000000000002FLL;
    id v7 = [v6 persona];
    id v8 = [v7 personaIdentifier];

    uint64_t v9 = sub_19F90();
    __int16 v11 = v10;

    v14._countAndFlagsBits = v9;
    v14._object = v11;
    sub_19FB0(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 41;
    v15._object = (void *)0xE100000000000000;
    sub_19FB0(v15);
    sub_16B78(a1, a2, 1);
    return v13;
  }
  return v5;
}

unint64_t sub_16244()
{
  return sub_160BC(*(void **)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_16250(uint64_t a1, uint64_t a2)
{
  return sub_171E8(*(void **)a1, *(void **)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

void sub_16608()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 16) == 1)
  {
    id v3 = *(id *)v1;
    uint64_t v2 = *(void **)(v1 + 8);
    id v4 = [*(id *)v1 persona];
    id v5 = [v4 demotedAppsPlistPath];

    sub_19F90();
    sub_19EF0();
    swift_bridgeObjectRelease();
    sub_16B78(v3, v2, 1);
  }
  else
  {
    sub_19EF0();
  }
}

id sub_16A78()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MigratorConfig()
{
  return self;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_2E860)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2E860);
    }
  }
}

id sub_16B48(id result, id a2, char a3)
{
  if (a3 == 1) {
    return result;
  }
  if (!a3) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void destroy for MigratorConfig.State(uint64_t a1)
{
}

void sub_16B78(void *a1, id a2, char a3)
{
  if (a3 == 1)
  {
  }
  else if (!a3)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t _s18RestorePostProcess14MigratorConfigC5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_16B48(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MigratorConfig.State(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_16B48(*(id *)a2, v4, v5);
  id v6 = *(void **)a1;
  id v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_16B78(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for MigratorConfig.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MigratorConfig.State(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_16B78(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MigratorConfig.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MigratorConfig.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_16D24(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_16D40(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MigratorConfig.State()
{
  return &type metadata for MigratorConfig.State;
}

unint64_t sub_16D68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_173AC(&qword_2E878);
  uint64_t v2 = sub_1A030();
  unsigned int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_173F0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_16E94(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    __int16 v11 = (uint64_t *)(v3[6] + 16 * result);
    *__int16 v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_17458(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_16E94(uint64_t a1, uint64_t a2)
{
  sub_1A090();
  sub_19FA0();
  Swift::Int v4 = sub_1A0A0();

  return sub_16F0C(a1, a2, v4);
}

unint64_t sub_16F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1A070() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1A070() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1A070()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_17054(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v8 = sub_19E60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  __int16 v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    if ((a4 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    if (a2) {
      return a1;
    }
    v13[2] = 2;
    sub_16D68((uint64_t)&_swiftEmptyArrayStorage);
    sub_17354();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13[3] = 22;
    sub_16D68((uint64_t)&_swiftEmptyArrayStorage);
    sub_17354();
  }
  sub_19ED0();
  sub_19E50();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_willThrow();
  return a1;
}

uint64_t sub_171E8(void *a1, void *a2, char a3, unint64_t a4, unint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (a6 == 1)
      {
        sub_17314();
        sub_16B48(a1, a2, 1);
        sub_16B48((id)a4, (id)a5, 1);
        char v10 = sub_19FE0();
        sub_16B78((void *)a4, (id)a5, 1);
        sub_16B78(a1, a2, 1);
        return v10 & 1;
      }
      return 0;
    }
    return a6 == 2 && !(a5 | a4);
  }
  if (a6) {
    return 0;
  }
  if (a1 == (void *)a4 && a2 == (void *)a5) {
    return 1;
  }

  return sub_1A070();
}

unint64_t sub_17314()
{
  unint64_t result = qword_2E868;
  if (!qword_2E868)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2E868);
  }
  return result;
}

unint64_t sub_17354()
{
  unint64_t result = qword_2E870;
  if (!qword_2E870)
  {
    sub_19E60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2E870);
  }
  return result;
}

uint64_t sub_173AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_173F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_173AC(&qword_2E880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_17458(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_17468(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_174A0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_19F40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2E828 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_17468(v4, (uint64_t)qword_2E890);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_1A010(22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a1;
  unint64_t v11 = a2;
  v12._object = (void *)0x8000000000021670;
  v12._countAndFlagsBits = 0xD000000000000014;
  sub_19FB0(v12);
  sub_19F10();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_17640()
{
  uint64_t v0 = sub_19F40();
  sub_195E8(v0, qword_2E890);
  sub_17468(v0, (uint64_t)qword_2E890);
  return sub_19EF0();
}

uint64_t sub_178E8(Swift::Int a1, Swift::Int a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_lock);
  uint64_t v6 = *(os_unfair_lock_s **)(v5 + 16);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_18BA8(&v8, a1, a2);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v5 + 16));
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_17AB0()
{
  return 1;
}

Swift::Int sub_17AB8()
{
  return sub_1A0A0();
}

uint64_t sub_17B10()
{
  return sub_19FA0();
}

Swift::Int sub_17B2C()
{
  return sub_1A0A0();
}

uint64_t sub_17B80@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_29010;
  v7._object = v3;
  Swift::Int v5 = sub_1A040(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_17BD4(void *a1@<X8>)
{
  *a1 = 0x4449656C646E7562;
  a1[1] = 0xE900000000000073;
}

uint64_t sub_17BF4()
{
  return 0x4449656C646E7562;
}

uint64_t sub_17C10@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_29048;
  v8._object = a2;
  Swift::Int v6 = sub_1A040(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_17C68()
{
  return 0;
}

void sub_17C74(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_17C80(uint64_t a1)
{
  unint64_t v2 = sub_18968();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_17CBC(uint64_t a1)
{
  unint64_t v2 = sub_18968();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_17CF8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_173AC(&qword_2E900);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  Swift::String v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18924(a1, a1[3]);
  sub_18968();
  sub_1A0C0();
  Swift::String v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs);
  swift_beginAccess();
  uint64_t v10 = *v8;
  sub_173AC(&qword_2E8F0);
  sub_18A54(&qword_2E908);
  sub_1A060();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_17E90(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_173AC(&qword_2E8E0);
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_lock;
  type metadata accessor for MBUnfairLock();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v2;
  uint64_t v10 = (_DWORD *)swift_slowAlloc();
  *(void *)(v8 + 16) = v10;
  *uint64_t v10 = 0;
  *(void *)&v2[v7] = v8;
  unint64_t v11 = (id *)&v9[OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs];
  *(void *)&v9[OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs] = &_swiftEmptySetSingleton;
  sub_18924(a1, a1[3]);
  sub_18968();
  uint64_t v12 = v20;
  sub_1A0B0();
  if (v12)
  {
    sub_189BC((uint64_t)a1);
    swift_release();
    id v14 = *v11;

    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v20 = v7;
    sub_173AC(&qword_2E8F0);
    sub_18A54(&qword_2E8F8);
    uint64_t v13 = v19;
    sub_1A050();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v13);
    uint64_t v16 = v23;
    swift_beginAccess();
    *unint64_t v11 = v16;

    swift_bridgeObjectRelease();
    v22.receiver = v9;
    v22.super_class = ObjectType;
    id v14 = objc_msgSendSuper2(&v22, "init");
    sub_189BC((uint64_t)a1);
  }
  return v14;
}

id sub_1831C(uint64_t a1)
{
  uint64_t v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_lock;
  type metadata accessor for MBUnfairLock();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v3;
  uint64_t v9 = (_DWORD *)swift_slowAlloc();
  *(void *)(v7 + 16) = v9;
  *uint64_t v9 = 0;
  *(void *)&v3[v6] = v7;
  uint64_t v19 = (id *)&v8[OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs];
  *(void *)&v8[OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs] = &_swiftEmptySetSingleton;
  uint64_t v24 = a1;
  uint64_t v10 = sub_19F50();
  unint64_t v12 = v11;
  if (v2)
  {
    objc_super v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_1A010(27);
    v25._object = (void *)0x8000000000021760;
    v25._countAndFlagsBits = 0xD000000000000015;
    sub_19FB0(v25);
    v26._countAndFlagsBits = sub_19F30();
    sub_19FB0(v26);
    swift_bridgeObjectRelease();
    v27._countAndFlagsBits = 8250;
    v27._object = (void *)0xE200000000000000;
    sub_19FB0(v27);
    uint64_t v21 = v2;
    sub_173AC(&qword_2E910);
    sub_1A020();
    sub_19F70();
    swift_bridgeObjectRelease();
    swift_willThrow();
    uint64_t v13 = sub_19F40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v24, v13);
    swift_release();
    id v17 = *v19;

    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_19E90();
    swift_allocObject();
    sub_18B10(v10, v12);
    sub_19E80();
    sub_18B68(&qword_2E918);
    sub_19E70();
    sub_18AB8(v10, v12);
    sub_18AB8(v10, v12);
    swift_release();
    uint64_t v15 = &v22[OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs];
    swift_beginAccess();
    uint64_t v16 = *(void **)v15;
    swift_bridgeObjectRetain();

    swift_beginAccess();
    id *v19 = v16;

    swift_bridgeObjectRelease();
    v20.receiver = v8;
    v20.super_class = ObjectType;
    id v17 = objc_msgSendSuper2(&v20, "init");
    uint64_t v18 = sub_19F40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v24, v18);
  }
  return v17;
}

uint64_t type metadata accessor for MigratorCache()
{
  return self;
}

id sub_187F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = sub_17E90(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_18844(void *a1)
{
  return sub_17CF8(a1);
}

void *sub_18924(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_18968()
{
  unint64_t result = qword_2E8E8;
  if (!qword_2E8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2E8E8);
  }
  return result;
}

uint64_t sub_189BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_18A0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_18A54(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_18A0C(&qword_2E8F0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18AB8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_18B10(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_18B68(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MigratorCache();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18BA8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1A090();
  swift_bridgeObjectRetain();
  sub_19FA0();
  Swift::Int v8 = sub_1A0A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1A070() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1A070() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_19020(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_18D58()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_173AC(&qword_2E928);
  uint64_t v3 = sub_1A000();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  v31 = v0;
  uint64_t v32 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8) {
      break;
    }
    uint64_t v17 = (void *)(v2 + 56);
    unint64_t v18 = *(void *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v8) {
        goto LABEL_31;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v11);
      if (!v18)
      {
        int64_t v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          uint64_t v1 = v31;
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            int64_t v11 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              goto LABEL_39;
            }
            if (v11 >= v8) {
              goto LABEL_31;
            }
            unint64_t v18 = *(void *)(v32 + 8 * v11);
            ++v19;
            if (v18) {
              goto LABEL_21;
            }
          }
        }
        int64_t v11 = v19;
      }
    }
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    objc_super v20 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    sub_1A090();
    sub_19FA0();
    uint64_t result = sub_1A0A0();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v21;
    v13[1] = v22;
    ++*(void *)(v4 + 16);
  }
  swift_release();
  uint64_t v1 = v31;
  uint64_t v17 = (void *)(v2 + 56);
LABEL_33:
  uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
  if (v30 > 63) {
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v17 = -1 << v30;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_19020(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_18D58();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_191BC();
      goto LABEL_22;
    }
    sub_1935C();
  }
  uint64_t v11 = *v4;
  sub_1A090();
  sub_19FA0();
  uint64_t result = sub_1A0A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1A070(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1A080();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1A070();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_191BC()
{
  uint64_t v1 = v0;
  sub_173AC(&qword_2E928);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_19FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1935C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_173AC(&qword_2E928);
  uint64_t v3 = sub_1A000();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain_n();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          uint64_t result = swift_release_n();
          uint64_t v1 = v0;
          goto LABEL_32;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v18);
        int64_t v11 = v18;
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1A090();
    swift_bridgeObjectRetain();
    sub_19FA0();
    uint64_t result = sub_1A0A0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_33;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t *sub_195E8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t getEnumTagSinglePayload for MigratorCache.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for MigratorCache.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x19740);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_19768()
{
  return 0;
}

ValueMetadata *type metadata accessor for MigratorCache.CodingKeys()
{
  return &type metadata for MigratorCache.CodingKeys;
}

unint64_t sub_19784()
{
  unint64_t result = qword_2E930;
  if (!qword_2E930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2E930);
  }
  return result;
}

unint64_t sub_197DC()
{
  unint64_t result = qword_2E938;
  if (!qword_2E938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2E938);
  }
  return result;
}

unint64_t sub_19834()
{
  unint64_t result = qword_2E940;
  if (!qword_2E940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2E940);
  }
  return result;
}

uint64_t sub_19888()
{
  swift_slowDealloc();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for MBUnfairLock()
{
  return self;
}

uint64_t sub_198F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_19994()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 96));
  return v0;
}

uint64_t sub_19A14()
{
  sub_19994();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for MBUnfairLocked()
{
  return sub_19A84();
}

uint64_t sub_19A84()
{
  return swift_getGenericMetadata();
}

void sub_19AB4()
{
}

void sub_19AE0()
{
}

void sub_19B0C()
{
}

void sub_19B38()
{
}

void sub_19B64()
{
}

void sub_19B90()
{
}

void sub_19BBC()
{
}

void sub_19BE8()
{
}

void sub_19C14()
{
}

void sub_19C40()
{
}

void sub_19C6C()
{
}

void sub_19C98()
{
}

void sub_19CC4()
{
}

void sub_19CF0()
{
}

void sub_19D1C()
{
}

void sub_19D48()
{
}

void sub_19D74()
{
}

void sub_19DA0()
{
}

void sub_19DCC()
{
}

void sub_19DF8()
{
}

void sub_19E24()
{
}

uint64_t sub_19E50()
{
  return POSIXError._nsError.getter();
}

uint64_t sub_19E60()
{
  return type metadata accessor for POSIXError();
}

uint64_t sub_19E70()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_19E80()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_19E90()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_19EA0()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_19EB0()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_19EC0()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_19ED0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_19EE0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_19EF0()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_19F00(NSURL *retstr@<X8>)
{
}

uint64_t sub_19F10()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_19F20()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_19F30()
{
  return URL.path.getter();
}

uint64_t sub_19F40()
{
  return type metadata accessor for URL();
}

uint64_t sub_19F50()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_19F60()
{
  return Data.write(to:options:)();
}

uint64_t sub_19F70()
{
  return NSLog(_:_:)();
}

NSString sub_19F80()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_19F90()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_19FA0()
{
  return String.hash(into:)();
}

void sub_19FB0(Swift::String a1)
{
}

NSSet sub_19FC0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_19FD0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_19FE0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_19FF0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1A000()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_1A010(Swift::Int a1)
{
}

uint64_t sub_1A020()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1A030()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_1A040(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1A050()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1A060()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1A070()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1A080()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1A090()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1A0A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1A0B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1A0C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return _CFURLCreateStringByAddingPercentEscapes(allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, encoding);
}

uint64_t CreateDataSourceForDataClassName()
{
  return _CreateDataSourceForDataClassName();
}

uint64_t DataSourceClearSyncAnchors()
{
  return _DataSourceClearSyncAnchors();
}

uint64_t DataSourceDeleteDataSource()
{
  return _DataSourceDeleteDataSource();
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t MBGroupWaitForever()
{
  return _MBGroupWaitForever();
}

uint64_t MBLocalizations()
{
  return _MBLocalizations();
}

uint64_t MBLocalizedStringFromTable()
{
  return _MBLocalizedStringFromTable();
}

uint64_t MBLogEnableFileLogging()
{
  return _MBLogEnableFileLogging();
}

uint64_t MBPathHasVolumePrefix()
{
  return _MBPathHasVolumePrefix();
}

uint64_t MBSemaphoreWaitForever()
{
  return _MBSemaphoreWaitForever();
}

uint64_t MobileInstallationCopySafeHarbors()
{
  return _MobileInstallationCopySafeHarbors();
}

uint64_t MobileInstallationRegisterSafeHarborForContainerType()
{
  return _MobileInstallationRegisterSafeHarborForContainerType();
}

uint64_t MobileInstallationRemoveSafeHarborForContainerType()
{
  return _MobileInstallationRemoveSafeHarborForContainerType();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _MBLog()
{
  return __MBLog();
}

uint64_t _MBLogFlushDeprecated()
{
  return __MBLogFlushDeprecated();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

uint64_t container_copy_path()
{
  return _container_copy_path();
}

uint64_t container_free_array_of_containers()
{
  return _container_free_array_of_containers();
}

uint64_t container_get_all_with_class_for_current_user()
{
  return _container_get_all_with_class_for_current_user();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_subdirectories_for_class()
{
  return _container_subdirectories_for_class();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t lockdown_connect()
{
  return _lockdown_connect();
}

uint64_t lockdown_copy_value()
{
  return _lockdown_copy_value();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_remove_value()
{
  return _lockdown_remove_value();
}

uint64_t lockdown_save_value()
{
  return _lockdown_save_value();
}

uint64_t lockdown_set_value()
{
  return _lockdown_set_value();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLByInsertingUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByInsertingUser:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__addContainer_toArray_visited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addContainer:toArray:visited:");
}

id objc_msgSend__configureAndIXInstallPlaceholdersInDirectory_isDataSeparated_migratorCache_demotedAppsPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAndIXInstallPlaceholdersInDirectory:isDataSeparated:migratorCache:demotedAppsPlist:");
}

id objc_msgSend__configureAppPlaceholderAtPath_installType_isDataSeparated_migratorCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAppPlaceholderAtPath:installType:isDataSeparated:migratorCache:");
}

id objc_msgSend__containerClassForMBContainerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_containerClassForMBContainerType:");
}

id objc_msgSend__createInstallCoordinatorForPlaceholderAtPath_bundleID_installType_isDataSeparated_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createInstallCoordinatorForPlaceholderAtPath:bundleID:installType:isDataSeparated:error:");
}

id objc_msgSend__defaultSubdirectoriesForMCMContainerType_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultSubdirectoriesForMCMContainerType:withError:");
}

id objc_msgSend__enumerateAppsWithEnumerationOptions_to_persona_dataSeparatedBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:");
}

id objc_msgSend__installCoordinatorForPlaceholder_bundleID_installType_isDataSeparated_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installCoordinatorForPlaceholder:bundleID:installType:isDataSeparated:error:");
}

id objc_msgSend__installedPlaceholderWithBundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedPlaceholderWithBundleID:error:");
}

id objc_msgSend__isEnterpriseAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEnterpriseAccount:");
}

id objc_msgSend__optionsFromACAccount_currentOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_optionsFromACAccount:currentOptions:");
}

id objc_msgSend__placeholderAtPath_bundleID_installType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_placeholderAtPath:bundleID:installType:error:");
}

id objc_msgSend__refreshIsBackupOnCellularEnabledWithCurrentOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshIsBackupOnCellularEnabledWithCurrentOptions:");
}

id objc_msgSend__registerSafeHarborsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerSafeHarborsAtPath:");
}

id objc_msgSend__reloadAccountPropertiesFromACAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadAccountPropertiesFromACAccount:");
}

id objc_msgSend__reloadAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _reloadAccounts];
}

id objc_msgSend__resetTetheredSyncAnchors(void *a1, const char *a2, ...)
{
  return _[a1 _resetTetheredSyncAnchors];
}

id objc_msgSend__setBackupEnabled_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackupEnabled:account:completion:");
}

id objc_msgSend__setProxiedAppBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setProxiedAppBundleID:");
}

id objc_msgSend__setProxyingForApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setProxyingForApp:");
}

id objc_msgSend__stringForAccountCredentialRenewResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForAccountCredentialRenewResult:");
}

id objc_msgSend__systemContainersWithError_shared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemContainersWithError:shared:");
}

id objc_msgSend__updateBundleIDsToPersonaIDMappingWithConfig_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBundleIDsToPersonaIDMappingWithConfig:error:");
}

id objc_msgSend__writeMigratorCache_config_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeMigratorCache:config:error:");
}

id objc_msgSend_aa_accountClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_accountClass");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_appleAccountWithPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithPersonID:");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isManagedAppleID");
}

id objc_msgSend_aa_isPrimaryEmailVerified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isPrimaryEmailVerified");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aa_setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_setPassword:");
}

id objc_msgSend_aa_updatePropertiesForAppleAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:completion:");
}

id objc_msgSend_aa_useCellularForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_useCellularForDataclass:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accountIdentifier];
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accountWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:error:");
}

id objc_msgSend_accountsQueue(void *a1, const char *a2, ...)
{
  return _[a1 accountsQueue];
}

id objc_msgSend_accountsWithAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsWithAccountType:");
}

id objc_msgSend_addBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBundleID:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return _[a1 appClipMetadata];
}

id objc_msgSend_appDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_appGroupDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appGroupDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_appInstallCoordinators(void *a1, const char *a2, ...)
{
  return _[a1 appInstallCoordinators];
}

id objc_msgSend_appPluginDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appPluginDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_appWithPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appWithPropertyList:");
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return _[a1 appleID];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return _[a1 applicationExtensionRecords];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return _[a1 applicationType];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_authKitAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authKitAccountWithAltDSID:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleDir(void *a1, const char *a2, ...)
{
  return _[a1 bundleDir];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 bundleIDs];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_cancelForReason_client_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelForReason:client:error:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return _[a1 compatibilityObject];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _[a1 connect];
}

id objc_msgSend_containerDir(void *a1, const char *a2, ...)
{
  return _[a1 containerDir];
}

id objc_msgSend_containerIDWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerIDWithName:");
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return _[a1 containerType];
}

id objc_msgSend_containerTypeString(void *a1, const char *a2, ...)
{
  return _[a1 containerTypeString];
}

id objc_msgSend_containerTypeWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerTypeWithName:");
}

id objc_msgSend_containerWithPropertyList_volumeMountPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerWithPropertyList:volumeMountPoint:");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsAtPath:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_coordinatorForAppWithBundleID_withClientID_createIfNotExisting_created_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _[a1 credential];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPlaceholderRestoreDirectory(void *a1, const char *a2, ...)
{
  return _[a1 currentPlaceholderRestoreDirectory];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_datePlacedInSafeHarbor(void *a1, const char *a2, ...)
{
  return _[a1 datePlacedInSafeHarbor];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_demotedAppsPlist(void *a1, const char *a2, ...)
{
  return _[a1 demotedAppsPlist];
}

id objc_msgSend_descriptionForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForError:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return _[a1 didRestoreFromBackup];
}

id objc_msgSend_didRestoreFromCloudBackup(void *a1, const char *a2, ...)
{
  return _[a1 didRestoreFromCloudBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return _[a1 didUpgrade];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_displayNameForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForBundleIdentifier:");
}

id objc_msgSend_displayNameForDomain_isSystemDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForDomain:isSystemDomain:");
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return _[a1 distributorInfo];
}

id objc_msgSend_distributorIsThirdParty(void *a1, const char *a2, ...)
{
  return _[a1 distributorIsThirdParty];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_errorWithCode_error_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithCode:error:format:");
}

id objc_msgSend_errorWithCode_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithCode:format:");
}

id objc_msgSend_estimatedDuration(void *a1, const char *a2, ...)
{
  return _[a1 estimatedDuration];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_getBooleanValueForKey_keyExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBooleanValueForKey:keyExists:");
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return _[a1 groupContainerURLs];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return _[a1 groups];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasAppleAccount(void *a1, const char *a2, ...)
{
  return _[a1 hasAppleAccount];
}

id objc_msgSend_hasParallelPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 hasParallelPlaceholder];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithPersona_account_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersona:account:options:");
}

id objc_msgSend_initWithPersona_accountIdentifier_dsid_altDSID_serviceURL_chunkStoreURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersona:accountIdentifier:dsid:altDSID:serviceURL:chunkStoreURL:options:");
}

id objc_msgSend_initWithPersonaID_didRestoreFromBackup_didRestoreFromCloudBackup_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonaID:didRestoreFromBackup:didRestoreFromCloudBackup:error:");
}

id objc_msgSend_initWithPropertyList_volumeMountPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPropertyList:volumeMountPoint:");
}

id objc_msgSend_initWithSafeHarborDir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSafeHarborDir:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_installTypeForBundleID_demotedAppsPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installTypeForBundleID:demotedAppsPlist:");
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return _[a1 isAuthenticated];
}

id objc_msgSend_isBackupOnCellularEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isBackupOnCellularEnabled];
}

id objc_msgSend_isBeneficiaryForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeneficiaryForAccount:");
}

id objc_msgSend_isDataSeparated(void *a1, const char *a2, ...)
{
  return _[a1 isDataSeparated];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return _[a1 isDataSeparatedPersona];
}

id objc_msgSend_isEmailVerified(void *a1, const char *a2, ...)
{
  return _[a1 isEmailVerified];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledForBackup(void *a1, const char *a2, ...)
{
  return _[a1 isEnabledForBackup];
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return _[a1 isEnterprisePersona];
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 isEphemeralMultiUser];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isNSFileNotFoundError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNSFileNotFoundError:");
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return _[a1 isPersonalPersona];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 isPrimaryAccount];
}

id objc_msgSend_isPrimaryUser(void *a1, const char *a2, ...)
{
  return _[a1 isPrimaryUser];
}

id objc_msgSend_isSafeHarbor(void *a1, const char *a2, ...)
{
  return _[a1 isSafeHarbor];
}

id objc_msgSend_isSystemContainerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemContainerName:");
}

id objc_msgSend_isSystemDomainName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemDomainName:");
}

id objc_msgSend_isSystemSharedContainerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemSharedContainerName:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_logStep_byParty_phase_success_forBundleID_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logStep:byParty:phase:success:forBundleID:description:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_managedPersonas(void *a1, const char *a2, ...)
{
  return _[a1 managedPersonas];
}

id objc_msgSend_managementDomain(void *a1, const char *a2, ...)
{
  return _[a1 managementDomain];
}

id objc_msgSend_mb_accountForPersonaIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mb_accountForPersonaIdentifier:");
}

id objc_msgSend_mb_applicationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mb_applicationType");
}

id objc_msgSend_mb_bundleURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mb_bundleURL");
}

id objc_msgSend_mb_entitlements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mb_entitlements");
}

id objc_msgSend_mb_isContainerized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mb_isContainerized");
}

id objc_msgSend_mb_pluginIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mb_pluginIdentifier");
}

id objc_msgSend_metadataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataWithError:");
}

id objc_msgSend_migratorCacheURL(void *a1, const char *a2, ...)
{
  return _[a1 migratorCacheURL];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_performMigrationWithConfig_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigrationWithConfig:error:");
}

id objc_msgSend_persona(void *a1, const char *a2, ...)
{
  return _[a1 persona];
}

id objc_msgSend_personaAttributesForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForIdentifier:");
}

id objc_msgSend_personaAttributesForPersonaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForPersonaType:");
}

id objc_msgSend_personaAttributesForPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForPersonaUniqueString:");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 personaIdentifier];
}

id objc_msgSend_personaLayoutPathURL(void *a1, const char *a2, ...)
{
  return _[a1 personaLayoutPathURL];
}

id objc_msgSend_personaWithAttributes_volumeMountPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaWithAttributes:volumeMountPoint:");
}

id objc_msgSend_personaWithUMPersona_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaWithUMPersona:error:");
}

id objc_msgSend_personalPersonaIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 personalPersonaIdentifier];
}

id objc_msgSend_personalPersonaWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalPersonaWithError:");
}

id objc_msgSend_placeholderForInstallable_client_installType_metadata_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderForInstallable:client:installType:metadata:error:");
}

id objc_msgSend_placeholderFromSerializedPlaceholder_client_installType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderFromSerializedPlaceholder:client:installType:error:");
}

id objc_msgSend_placeholderInstallationGroup(void *a1, const char *a2, ...)
{
  return _[a1 placeholderInstallationGroup];
}

id objc_msgSend_placeholderRestoreDirectory(void *a1, const char *a2, ...)
{
  return _[a1 placeholderRestoreDirectory];
}

id objc_msgSend_plugins(void *a1, const char *a2, ...)
{
  return _[a1 plugins];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_prepareForBackgroundRestoreWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForBackgroundRestoreWithError:");
}

id objc_msgSend_propertiesForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForDataclass:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_registerSafeHarborWithIdentifier_path_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSafeHarborWithIdentifier:path:type:error:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_renewCredentialsForAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:completion:");
}

id objc_msgSend_restorePreviousSettingsEnabledForMegaBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorePreviousSettingsEnabledForMegaBackup:");
}

id objc_msgSend_restoredBackupDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 restoredBackupDeviceName];
}

id objc_msgSend_safeHarborDirectory(void *a1, const char *a2, ...)
{
  return _[a1 safeHarborDirectory];
}

id objc_msgSend_safeHarborWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeHarborWithPath:");
}

id objc_msgSend_saveAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:withCompletionHandler:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAppAssetPromiseResponsibleClient_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAssetPromiseResponsibleClient:error:");
}

id objc_msgSend_setAppInstallCoordinators_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppInstallCoordinators:");
}

id objc_msgSend_setBundlesIdentifiers_forPersonaWithPersonaUniqueString_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundlesIdentifiers:forPersonaWithPersonaUniqueString:completionHandler:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setChunkStoreURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChunkStoreURL:");
}

id objc_msgSend_setConfigurationCompleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationCompleteWithError:");
}

id objc_msgSend_setCurrentPlaceholderRestoreDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlaceholderRestoreDirectory:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDsid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDsid:");
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forDataclass:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setObject_forDomain_andKey_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forDomain:andKey:withError:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserver:");
}

id objc_msgSend_setPlaceholderInstallationGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderInstallationGroup:");
}

id objc_msgSend_setPlaceholderPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderPromise:error:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRelativePathsNotToBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativePathsNotToBackup:");
}

id objc_msgSend_setRelativePathsNotToRestore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativePathsNotToRestore:");
}

id objc_msgSend_setRelativePathsToBackupAndRestore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativePathsToBackupAndRestore:");
}

id objc_msgSend_setRequestUserConfirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestUserConfirmation:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setServiceURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceURL:");
}

id objc_msgSend_setShouldDigest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDigest:");
}

id objc_msgSend_setShowArchiveOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowArchiveOption:");
}

id objc_msgSend_setSystemAppNotAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemAppNotAllowed:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setWaitForDeletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitForDeletion:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedClient];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldPrepareForBackgroundRestore(void *a1, const char *a2, ...)
{
  return _[a1 shouldPrepareForBackgroundRestore];
}

id objc_msgSend_shouldPreserveSettingsAfterRestore(void *a1, const char *a2, ...)
{
  return _[a1 shouldPreserveSettingsAfterRestore];
}

id objc_msgSend_shouldRegisterSafeHarbors(void *a1, const char *a2, ...)
{
  return _[a1 shouldRegisterSafeHarbors];
}

id objc_msgSend_shouldResetTetheredSyncAnchors(void *a1, const char *a2, ...)
{
  return _[a1 shouldResetTetheredSyncAnchors];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_systemContainerDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemContainerDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_systemSharedContainerDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemSharedContainerDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_uninstallAppWithBundleID_options_disposition_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uninstallAppWithBundleID:options:disposition:error:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_updateAppleAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAppleAccount:");
}

id objc_msgSend_updateApplePassword_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateApplePassword:completionHandler:");
}

id objc_msgSend_updateApplePasswordSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateApplePasswordSync:");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _[a1 user];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return _[a1 userDataDisposition];
}

id objc_msgSend_userDataVolume(void *a1, const char *a2, ...)
{
  return _[a1 userDataVolume];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaUniqueString];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_verifyCredentialsForAccount_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCredentialsForAccount:withHandler:");
}

id objc_msgSend_volumeMountPoint(void *a1, const char *a2, ...)
{
  return _[a1 volumeMountPoint];
}

id objc_msgSend_writeTo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeTo:error:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}