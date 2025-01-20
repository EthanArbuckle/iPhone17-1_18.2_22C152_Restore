@interface CPLPrequelitePreventWipeNotification
+ (void)resetNotificationForLibraryIdentifier:(id)a3;
- (BOOL)_warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3;
- (BOOL)shouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3;
- (CPLPrequelitePreventWipeNotification)initWithLibraryIdentifier:(id)a3 reason:(id)a4;
- (NSDate)ignoreBeforeDate;
- (NSString)defaultsKey;
- (NSString)libraryIdentifier;
- (NSString)reason;
- (id)createRadarURL;
- (void)_save;
@end

@implementation CPLPrequelitePreventWipeNotification

+ (void)resetNotificationForLibraryIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = +[NSUserDefaults standardUserDefaults];
    v4 = sub_1001A573C(v3);

    [v5 removeObjectForKey:v4];
  }
}

- (CPLPrequelitePreventWipeNotification)initWithLibraryIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CPLPrequelitePreventWipeNotification;
  v8 = [(CPLPrequelitePreventWipeNotification *)&v21 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    libraryIdentifier = v8->_libraryIdentifier;
    v8->_libraryIdentifier = v9;

    v11 = (NSString *)[v7 copy];
    reason = v8->_reason;
    v8->_reason = v11;

    v13 = v8->_libraryIdentifier;
    if (v13)
    {
      uint64_t v14 = sub_1001A573C(v13);
      defaultsKey = v8->_defaultsKey;
      v8->_defaultsKey = (NSString *)v14;

      v16 = +[NSUserDefaults standardUserDefaults];
      uint64_t v17 = [v16 objectForKey:v8->_defaultsKey];
      ignoreBeforeDate = v8->_ignoreBeforeDate;
      v8->_ignoreBeforeDate = (NSDate *)v17;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = v8->_ignoreBeforeDate;
        v8->_ignoreBeforeDate = 0;
      }
    }
  }

  return v8;
}

- (void)_save
{
  if (self->_defaultsKey)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    ignoreBeforeDate = self->_ignoreBeforeDate;
    if (ignoreBeforeDate) {
      [v4 setObject:ignoreBeforeDate forKey:self->_defaultsKey];
    }
    else {
      [v4 removeObjectForKey:self->_defaultsKey];
    }
    [v4 synchronize];
  }
}

- (BOOL)_warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_reason)
  {
    id v5 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@.", self->_reason];
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = @"iCloud Photo Library is about to wipe its whole sync state.";
  if (!a3)
  {
LABEL_3:
    uint64_t v6 = [(__CFString *)v5 stringByAppendingString:@"\nThis will trigger a potential lengthy reset sync but should not lose any data."];

    id v5 = (__CFString *)v6;
  }
LABEL_4:
  v34[0] = kCFUserNotificationAlertHeaderKey;
  v34[1] = kCFUserNotificationAlertMessageKey;
  v35[0] = @"iCloud Photo Library";
  v35[1] = v5;
  v34[2] = kCFUserNotificationAlertTopMostKey;
  v35[2] = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  id v8 = [v7 mutableCopy];

  if (v3)
  {
    v32[0] = kCFUserNotificationDefaultButtonTitleKey;
    v32[1] = kCFUserNotificationAlternateButtonTitleKey;
    v33[0] = @"Create Radar";
    v33[1] = @"OK";
    v32[2] = kCFUserNotificationOtherButtonTitleKey;
    v33[2] = @"Not Now";
    v9 = v33;
    v10 = v32;
  }
  else
  {
    v30[0] = kCFUserNotificationDefaultButtonTitleKey;
    v30[1] = kCFUserNotificationAlternateButtonTitleKey;
    v31[0] = @"Not now";
    v31[1] = @"Wipe Local Sync State";
    v30[2] = kCFUserNotificationOtherButtonTitleKey;
    v31[2] = @"Ignore for 1 hour";
    v9 = v31;
    v10 = v30;
  }
  v11 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:3];
  [v8 addEntriesFromDictionary:v11];

  SInt32 error = 0;
  CFUserNotificationRef v12 = CFUserNotificationCreate(0, 60.0, 3uLL, &error, (CFDictionaryRef)v8);
  if (v12)
  {
    v13 = v12;
    if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Waiting for response to message: %@", buf, 0xCu);
      }
    }
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v13, 60.0, &responseFlags);
    CFRelease(v13);
    CFOptionFlags v15 = responseFlags & 3;
    if (!_CPLSilentLogging)
    {
      v16 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = +[NSNumber numberWithUnsignedLong:v15];
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Button pressed is %@", buf, 0xCu);
      }
    }
    ignoreBeforeDate = self->_ignoreBeforeDate;
    self->_ignoreBeforeDate = 0;

    if (v3)
    {
      if (v15 != 2)
      {
        if (v15 != 1)
        {
          v19 = [(CPLPrequelitePreventWipeNotification *)self createRadarURL];
          v20 = +[LSApplicationWorkspace defaultWorkspace];
          [v20 openURL:v19 configuration:0 completionHandler:0];
        }
        goto LABEL_29;
      }
    }
    else if (v15 == 2)
    {
      v23 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
      v24 = self->_ignoreBeforeDate;
      self->_ignoreBeforeDate = v23;
    }
    else if (v15 == 1)
    {
LABEL_29:
      BOOL v22 = 0;
LABEL_32:
      [(CPLPrequelitePreventWipeNotification *)self _save];
      goto LABEL_33;
    }
    BOOL v22 = 1;
    goto LABEL_32;
  }
  if (!_CPLSilentLogging)
  {
    objc_super v21 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = error;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Could not create user notification to prevent wiping database: %d", buf, 8u);
    }
  }
  BOOL v22 = 0;
LABEL_33:

  return v22;
}

- (BOOL)shouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3
{
  if (!self->_libraryIdentifier) {
    return 0;
  }
  BOOL v3 = a3;
  uint64_t v5 = [(CPLPrequelitePreventWipeNotification *)self ignoreBeforeDate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(CPLPrequelitePreventWipeNotification *)self ignoreBeforeDate];
    [v7 timeIntervalSinceNow];
    double v9 = v8;

    if (v9 >= 0.0) {
      return 1;
    }
  }
  return [(CPLPrequelitePreventWipeNotification *)self _warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:v3];
}

- (id)createRadarURL
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = v3;
  if (self->_reason) {
    CFStringRef reason = (const __CFString *)self->_reason;
  }
  else {
    CFStringRef reason = @"CPL wants to wipe its database";
  }
  [v3 setObject:reason forKeyedSubscript:@"Title"];
  [v4 setObject:@"Other Bug" forKeyedSubscript:@"Classification"];
  [v4 setObject:@"com.apple.PhotoLibraryServices.PhotosDiagnostics" forKeyedSubscript:@"ExtensionIdentifiers"];
  [v4 setObject:@"Not Applicable" forKeyedSubscript:@"Reproducibility"];
  [v4 setObject:@"Photos Backend iCloud" forKeyedSubscript:@"ComponentName"];
  [v4 setObject:@"630691" forKeyedSubscript:@"ComponentID"];
  [v4 setObject:@"all" forKeyedSubscript:@"ComponentVersion"];
  if (self->_reason)
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@\nReason: %@.", @"CPL presented a notification warning me that it was about to wipe its database.", self->_reason];
    [v4 setObject:v6 forKeyedSubscript:@"Description"];
  }
  else
  {
    [v4 setObject:@"CPL presented a notification warning me that it was about to wipe its database." forKeyedSubscript:@"Description"];
  }
  id v7 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        CFOptionFlags v15 = [v9 objectForKeyedSubscript:v14];
        v16 = +[NSURLQueryItem queryItemWithName:v14 value:v15];
        [v8 addObject:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }

  [v7 setQueryItems:v8];
  uint64_t v17 = [v7 URL];
  if (!_CPLSilentLogging)
  {
    v18 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Create radar URL: %@", buf, 0xCu);
    }
  }
  return v17;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)ignoreBeforeDate
{
  return self->_ignoreBeforeDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreBeforeDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
}

@end