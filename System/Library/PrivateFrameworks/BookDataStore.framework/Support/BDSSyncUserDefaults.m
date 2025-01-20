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
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isUserSignedInToiCloud];

  return v3;
}

+ (BOOL)isCloudKitSyncOptedIn
{
  if (!+[BDSSyncUserDefaults _isServiceEnabledAlternative:kTCCServiceLiverpool])
  {
    if (+[BDSSyncUserDefaults _isServiceDisabledAlternative:kTCCServiceLiverpool])
    {
      if (+[BDSSyncUserDefaults _isServiceEnabledAlternative:kTCCServiceUbiquity])
      {
        uint64_t v3 = sub_1000083A0();
        if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v10[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "isCloudKitSyncOptedIn - liverpool OFF, ubiquity ON --> forcing liverpool ON", (uint8_t *)v10, 2u);
        }

        uint64_t v4 = kTCCServiceLiverpool;
        LOBYTE(v3) = 1;
        uint64_t v5 = 1;
LABEL_17:
        +[BDSSyncUserDefaults _setService:v4 enabled:v5];
        return v3;
      }
    }
    else
    {
      uint64_t v3 = (uint64_t)[a1 _isServiceEnabledAlternative:kTCCServiceUbiquity];
      unsigned int v6 = [a1 _isServiceDisabledAlternative:kTCCServiceUbiquity];
      v7 = sub_1000083A0();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((v3 & 1) != 0 || v6)
      {
        if (v8)
        {
          v10[0] = 67109120;
          v10[1] = v3;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "isCloudKitSyncOptedIn - Setting unknown liverpool value to %{BOOL}d", (uint8_t *)v10, 8u);
        }

        uint64_t v4 = kTCCServiceLiverpool;
        uint64_t v5 = v3;
        goto LABEL_17;
      }
      if (v8)
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "isCloudKitSyncOptedIn - Skip setting unknown liverpool value because ubiquity is also unknown!", (uint8_t *)v10, 2u);
      }
    }
    LOBYTE(v3) = 0;
    return v3;
  }
  LOBYTE(v3) = 1;
  return v3;
}

+ (BOOL)isGlobalICloudDriveSyncOptedIn
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isGlobalICloudDriveSyncOptedIn];

  return v3;
}

+ (id)iCloudIdentity
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 iCloudIdentity];

  return v3;
}

+ (id)makeOSStateHandler
{
  id v2 = [objc_alloc((Class)BUOSStateHandler) initWithTitle:@"BDSSyncUserDefaults" block:&stru_10025FCF8];
  return v2;
}

+ (BOOL)isICloudDriveSyncOptedIn
{
  return +[BDSSyncUserDefaults _isICloudDriveSyncOptedIn];
}

+ (BOOL)_isICloudDriveSyncOptedIn
{
  id v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isPrimaryAccountManagedAppleID];

  return v3 | +[BDSSyncUserDefaults _isServiceEnabledAlternative:kTCCServiceUbiquity];
}

+ (BOOL)_isBundleIdentifierInArray:(__CFArray *)a3
{
  uint64_t v4 = [a1 _booksAppBundleIdentifier];
  CFIndex Count = CFArrayGetCount(a3);
  if (Count)
  {
    unint64_t v6 = Count;
    CFIndex v7 = 0;
    BOOL v8 = 1;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v7);
      CFTypeID v10 = CFGetTypeID(ValueAtIndex);
      if (v10 == CFStringGetTypeID() && CFEqual(ValueAtIndex, v4)) {
        break;
      }
      BOOL v8 = ++v7 < v6;
    }
    while (v6 != v7);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)_isServiceEnabledAlternative:(__CFString *)a3
{
  uint64_t v4 = TCCAccessCopyBundleIdentifiersForService();
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    BOOL v6 = +[BDSSyncUserDefaults _isBundleIdentifierInArray:v4];
    CFRelease(v5);
    return v6;
  }
  else
  {
    BOOL v8 = sub_1000083A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001E45EC((uint64_t)a3, v8);
    }

    return 0;
  }
}

+ (BOOL)_isServiceDisabledAlternative:(__CFString *)a3
{
  uint64_t v4 = TCCAccessCopyBundleIdentifiersDisabledForService();
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    BOOL v6 = +[BDSSyncUserDefaults _isBundleIdentifierInArray:v4];
    CFRelease(v5);
    return v6;
  }
  else
  {
    BOOL v8 = sub_1000083A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001E4664((uint64_t)a3, v8);
    }

    return 1;
  }
}

+ (void)_setService:(__CFString *)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [a1 _booksAppBundleIdentifier];
  int v7 = TCCAccessSetForBundleId();
  BOOL v8 = sub_1000083A0();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v10 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      int v11 = 138543618;
      v12 = a3;
      __int16 v13 = 2114;
      CFStringRef v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Successfully set %{public}@ to %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1001E46DC((uint64_t)a3, v4, v9);
  }
}

+ (id)_booksAppBundleIdentifier
{
  return +[BDSAppBundleIdentifier bdsAppBundleIdentifier];
}

+ (id)_stateForLog
{
  v11[0] = @"isSignedIntoICloud";
  unsigned __int8 v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 isSignedIntoICloud]);
  v12[0] = v3;
  v11[1] = @"isCloudKitSyncOptedIn";
  BOOL v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 isCloudKitSyncOptedIn]);
  v12[1] = v4;
  v11[2] = @"isICloudDriveSyncOptedIn";
  uint64_t v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 isICloudDriveSyncOptedIn]);
  v12[2] = v5;
  v11[3] = @"isGlobalICloudDriveSyncOptedIn";
  BOOL v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 isGlobalICloudDriveSyncOptedIn]);
  v12[3] = v6;
  v11[4] = @"iCloudIdentityExists";
  int v7 = [a1 iCloudIdentity];
  BOOL v8 = +[NSNumber numberWithInt:v7 != 0];
  v12[4] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

@end