@interface PASetSiriAuthorizationForApp
- (BOOL)_accessForAppID:(id)a3;
- (BOOL)_setAccess:(BOOL)a3 appID:(id)a4;
- (id)_tccAccessInfoForBundle:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation PASetSiriAuthorizationForApp

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(PASetSiriAuthorizationForApp *)self bundleId];
  BOOL v6 = [(PASetSiriAuthorizationForApp *)self _accessForAppID:v5];

  if ([(PASetSiriAuthorizationForApp *)self toggle]) {
    id v7 = (id)(v6 ^ 1);
  }
  else {
    id v7 = [(PASetSiriAuthorizationForApp *)self value];
  }
  unsigned int v8 = [(PASetSiriAuthorizationForApp *)self dryRun];
  if (v6 == v7)
  {
    id v9 = objc_alloc_init((Class)SACommandFailed);
    [v9 setErrorCode:SASettingValueUnchangedErrorCode];
    [v9 setReason:@"Value unchanged, No change was made"];
  }
  else
  {
    id v9 = 0;
  }
  if (v9) {
    char v10 = 1;
  }
  else {
    char v10 = v8;
  }
  if ((v10 & 1) == 0)
  {
    v11 = [(PASetSiriAuthorizationForApp *)self bundleId];
    unsigned __int8 v12 = [(PASetSiriAuthorizationForApp *)self _setAccess:v7 appID:v11];

    if (v12)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = objc_alloc_init((Class)SACommandFailed);
      [v9 setErrorCode:SASettingValueUnchangedErrorCode];
      [v9 setReason:@"TCC permission set failed"];
    }
  }
  v13 = PALogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(PASetSiriAuthorizationForApp *)self bundleId];
    v15 = (void *)v14;
    CFStringRef v16 = @"Set";
    if (v8) {
      CFStringRef v16 = @"Dry Run";
    }
    *(_DWORD *)v24 = 138413314;
    *(void *)&v24[4] = v14;
    *(_WORD *)&v24[12] = 2112;
    *(void *)&v24[14] = v16;
    if (v6) {
      CFStringRef v17 = @"ON";
    }
    else {
      CFStringRef v17 = @"OFF";
    }
    *(_WORD *)&v24[22] = 2112;
    CFStringRef v25 = v17;
    *(_WORD *)v26 = 2112;
    if (v7) {
      CFStringRef v18 = @"ON";
    }
    else {
      CFStringRef v18 = @"OFF";
    }
    *(void *)&v26[2] = v18;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "########## PASetSiriAuthorizationForApp: %@ (%@ / prev: %@ / value: %@ / %@)", v24, 0x34u);
  }
  id v19 = v9;
  id v20 = v19;
  if (!v19)
  {
    id v21 = objc_alloc_init((Class)SASettingBooleanEntity);
    [v21 setValue:v7];
    v22 = +[NSNumber numberWithBool:v6];
    [v21 setPreviousValue:v22];

    id v20 = objc_alloc_init((Class)SASettingSetBoolResponse);
    [v20 setSetting:v21];
  }
  v23 = objc_msgSend(v20, "dictionary", *(_OWORD *)v24, *(void *)&v24[16], v25, *(void *)v26);
  v4[2](v4, v23);
}

- (BOOL)_setAccess:(BOOL)a3 appID:(id)a4
{
  v4 = +[LSBundleProxy bundleProxyForIdentifier:a4];
  CFBundleRef v5 = CFBundleCreate(0, (CFURLRef)[v4 bundleURL]);
  if (v5)
  {
    CFBundleRef v6 = v5;
    BOOL v7 = TCCAccessSetForBundle() != 0;
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_accessForAppID:(id)a3
{
  v4 = +[LSBundleProxy bundleProxyForIdentifier:a3];
  CFBundleRef v5 = [v4 bundleType];
  if ([v5 isEqualToString:LSSystemApplicationType])
  {
    unsigned __int8 v6 = 1;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v7 = [v4 bundleType];
  unsigned __int8 v8 = [v7 isEqualToString:LSInternalApplicationType];

  if ((v8 & 1) == 0)
  {
    CFBundleRef v5 = [(PASetSiriAuthorizationForApp *)self _tccAccessInfoForBundle:v4];
    id v9 = [v5 objectForKeyedSubscript:kTCCServiceSiri];
    char v10 = v9;
    if (v9) {
      unsigned __int8 v6 = [v9 BOOLValue];
    }
    else {
      unsigned __int8 v6 = 0;
    }

    goto LABEL_9;
  }
  unsigned __int8 v6 = 1;
LABEL_10:

  return v6;
}

- (id)_tccAccessInfoForBundle:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleURL];
  if (v4 && (CFBundleRef v5 = CFBundleCreate(0, (CFURLRef)[v3 bundleURL])) != 0)
  {
    CFBundleRef cf = v5;
    CFStringRef v18 = v4;
    unsigned __int8 v6 = (void *)TCCAccessCopyInformationForBundle();
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "objectForKeyedSubscript:", kTCCInfoService, cf);
          v15 = [v13 objectForKeyedSubscript:kTCCInfoGranted];
          [v7 setObject:v15 forKey:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    CFRelease(cf);
    v4 = v18;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end