@interface _INSiriAuthorizationManager
+ (BOOL)_isSiriAuthorizationRestricted;
+ (BOOL)_siriEnabled;
+ (id)_tccAccessInfoForBundle:(id)a3;
+ (int64_t)_rawSiriAuthorizationStatusForAppID:(id)a3;
+ (int64_t)_siriAuthorizationStatusForAppID:(id)a3;
+ (int64_t)_siriAuthorizationStatusForAppID:(id)a3 intentSlot:(id)a4;
+ (void)_requestSiriAuthorization:(id)a3 auditToken:(id *)a4;
@end

@implementation _INSiriAuthorizationManager

+ (BOOL)_isSiriAuthorizationRestricted
{
  return TCCAccessRestricted() != 0;
}

+ (void)_requestSiriAuthorization:(id)a3 auditToken:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    if ([a1 _siriEnabled])
    {
      v7 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      long long v8 = *(_OWORD *)&a4->var0[4];
      long long v11 = *(_OWORD *)a4->var0;
      long long v12 = v8;
      block[2] = __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke;
      block[3] = &unk_1E55199E0;
      id v10 = v6;
      dispatch_async(v7, block);
    }
    else
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 2);
    }
  }
}

+ (int64_t)_rawSiriAuthorizationStatusForAppID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 _siriEnabled])
  {
    v5 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:v4];
    id v6 = [v5 bundleType];
    if ([v6 isEqualToString:*MEMORY[0x1E4F22368]])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_6;
      }
      [v5 containingBundle];
      v5 = id v6 = v5;
    }

LABEL_6:
    long long v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315650;
      v19 = "+[_INSiriAuthorizationManager _rawSiriAuthorizationStatusForAppID:]";
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s Resolved appBundleProxy: %@ for appID: %@", (uint8_t *)&v18, 0x20u);
    }
    if (v5)
    {
      v9 = [v5 bundleType];
      if ([v9 isEqualToString:*MEMORY[0x1E4F22380]])
      {
        int64_t v10 = 3;
LABEL_24:

        goto LABEL_25;
      }
      long long v12 = [v5 bundleType];
      char v13 = [v12 isEqualToString:*MEMORY[0x1E4F22350]];

      if ((v13 & 1) == 0)
      {
        v9 = [a1 _tccAccessInfoForBundle:v5];
        v14 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          int v18 = 136315650;
          v19 = "+[_INSiriAuthorizationManager _rawSiriAuthorizationStatusForAppID:]";
          __int16 v20 = 2112;
          id v21 = v5;
          __int16 v22 = 2112;
          id v23 = v9;
          _os_log_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_INFO, "%s TCC access for %@: %@", (uint8_t *)&v18, 0x20u);
        }
        v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FA9B08]];
        v16 = v15;
        if (v15)
        {
          if ([v15 BOOLValue]) {
            int64_t v10 = 3;
          }
          else {
            int64_t v10 = 2;
          }
        }
        else
        {
          int64_t v10 = 0;
        }

        goto LABEL_24;
      }
    }
    int64_t v10 = 3;
LABEL_25:

    goto LABEL_26;
  }
  long long v11 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "+[_INSiriAuthorizationManager _rawSiriAuthorizationStatusForAppID:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Siri is not enabled on this device, therefore Siri cannot be authorized for %@", (uint8_t *)&v18, 0x16u);
  }
  int64_t v10 = 2;
LABEL_26:

  return v10;
}

+ (BOOL)_siriEnabled
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getAFPreferencesClass_softClass_54898;
  uint64_t v11 = getAFPreferencesClass_softClass_54898;
  if (!getAFPreferencesClass_softClass_54898)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getAFPreferencesClass_block_invoke_54899;
    v7[3] = &unk_1E5520EB8;
    v7[4] = &v8;
    __getAFPreferencesClass_block_invoke_54899((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = [v3 sharedPreferences];
  char v5 = [v4 assistantIsEnabled];

  return v5;
}

+ (int64_t)_siriAuthorizationStatusForAppID:(id)a3 intentSlot:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 isEqualToString:@"AutoShortcutNameType"])
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]";
      _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s IntentSlot is App Shortcut, authorizing", (uint8_t *)&buf, 0xCu);
    }
    int64_t v8 = 3;
  }
  else if (v6)
  {
    if (_siriAuthorizationStatusForAppID_intentSlot__onceToken != -1) {
      dispatch_once(&_siriAuthorizationStatusForAppID_intentSlot__onceToken, &__block_literal_global_54909);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v9 = _siriAuthorizationStatusForAppID_intentSlot__queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_12;
    block[3] = &unk_1E5519A50;
    id v12 = v6;
    p_long long buf = &buf;
    id v14 = a1;
    dispatch_sync(v9, block);
    int64_t v8 = *(void *)(*((void *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

+ (int64_t)_siriAuthorizationStatusForAppID:(id)a3
{
  return [a1 _siriAuthorizationStatusForAppID:a3 intentSlot:0];
}

+ (id)_tccAccessInfoForBundle:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 bundleURL];
  if (!v4)
  {
    uint64_t v18 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      v27 = "+[_INSiriAuthorizationManager _tccAccessInfoForBundle:]";
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      id v31 = v3;
      _os_log_error_impl(&dword_18CB2F000, v18, OS_LOG_TYPE_ERROR, "%s Could not lookup TCC info for nil bundleURL: %@ bundle: %@", buf, 0x20u);
    }
    goto LABEL_13;
  }
  CFBundleRef v5 = CFBundleCreate(0, (CFURLRef)[v3 bundleURL]);
  if (!v5)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  CFBundleRef cf = v5;
  id v21 = v4;
  id v6 = (void *)TCCAccessCopyInformationForBundle();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    id v12 = (void *)MEMORY[0x1E4FA9A00];
    char v13 = (void *)MEMORY[0x1E4FA99E8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "objectForKeyedSubscript:", *v12, cf);
        uint64_t v17 = [v15 objectForKeyedSubscript:*v13];
        [v7 setObject:v17 forKey:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v10);
  }

  CFRelease(cf);
  id v4 = v21;
LABEL_14:

  return v7;
}

@end