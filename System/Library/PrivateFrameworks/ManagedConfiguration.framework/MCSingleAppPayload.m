@interface MCSingleAppPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)allowLogout;
- (BOOL)mustInstallNonInteractively;
- (MCSingleAppPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSString)applicationBundleID;
- (id)restrictions;
- (id)subtitle1Description;
- (id)subtitle1Label;
@end

@implementation MCSingleAppPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.app.lock"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SINGLE_APP_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SINGLE_APP_", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSingleAppPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MCSingleAppPayload;
  v10 = [(MCAppWhitelistPayloadBase *)&v82 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_71;
  }
  if ([v9 isStub])
  {
    id v11 = 0;
    goto LABEL_67;
  }
  v12 = [MEMORY[0x1E4F1CA48] array];
  id v81 = 0;
  v13 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"App" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v81];
  id v14 = v81;
  if (v14)
  {
    id v11 = v14;

LABEL_62:
    v44 = [(MCPayload *)v10 malformedPayloadErrorWithError:v11];
    v45 = v44;
    if (a5) {
      *a5 = v44;
    }
    v46 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v47 = v46;
      v48 = objc_opt_class();
      id v49 = v48;
      v50 = [v45 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v84 = v48;
      __int16 v85 = 2114;
      id v86 = v50;
      _os_log_impl(&dword_1A13F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_67;
  }
  id v80 = 0;
  v15 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AllowLogout" isRequired:0 outError:&v80];
  id v11 = v80;
  if (!v11)
  {
    v10->_allowLogout = [v15 BOOLValue];
    uint64_t v16 = [v13 objectForKey:@"Identifier"];
    v71 = (void *)v16;
    if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v11 = +[MCPayload badFieldTypeErrorWithField:@"Identifier"];
LABEL_60:

      goto LABEL_61;
    }
    v60 = v15;
    v62 = v12;
    v18 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v17];
    v61 = v18;
    if (v18)
    {
      v19 = v18;
      v20 = [v18 appTags];
      char v68 = [v20 containsObject:@"hidden"];

      v21 = [v19 bundleType];
      char v22 = [v21 isEqualToString:*MEMORY[0x1E4F22348]];

      v23 = [v19 appState];
      char v24 = [v23 isRestricted];

      v17 = v71;
      int v25 = [v19 isLaunchProhibited];
      if ((v68 & 1) != 0 || (v22 & 1) != 0 || (v24 & 1) != 0 || v25)
      {
        id v11 = +[MCPayload badFieldValueErrorWithField:@"Identifier"];
        v12 = v62;
        v15 = v60;
LABEL_59:

        goto LABEL_60;
      }
    }
    v59 = [MEMORY[0x1E4F1CA60] dictionary];
    [v59 setObject:v17 forKey:@"Identifier"];
    v26 = [v13 objectForKey:@"Options"];
    v12 = v62;
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v11 = +[MCPayload badFieldTypeErrorWithField:@"Options"];
        v15 = v60;
LABEL_58:

        goto LABEL_59;
      }
      v63 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v55 = v26;
      id v27 = v26;
      uint64_t v69 = [v27 countByEnumeratingWithState:&v76 objects:v88 count:16];
      if (v69)
      {
        uint64_t v66 = *(void *)v77;
        v65 = v13;
        while (2)
        {
          for (uint64_t i = 0; i != v69; ++i)
          {
            if (*(void *)v77 != v66) {
              objc_enumerationMutation(v27);
            }
            v29 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            v30 = [v27 objectForKey:v29];
            if (v30)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v11 = +[MCPayload badFieldValueErrorWithField:v29];

                v12 = v62;
                v15 = v60;
                v26 = v55;
                goto LABEL_58;
              }
              id v31 = v27;
              v32 = +[MCAppWhitelistPayloadBase knownOptionsKeys];
              int v33 = [v32 containsObject:v29];

              if (v33)
              {
                [v63 setObject:v30 forKey:v29];
                id v27 = v31;
                v13 = v65;
              }
              else
              {
                v34 = _MCLogObjects;
                id v27 = v31;
                v13 = v65;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v84 = v29;
                  _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_DEFAULT, "Ignoring unknown option: %{public}@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v69 = [v27 countByEnumeratingWithState:&v76 objects:v88 count:16];
          if (v69) {
            continue;
          }
          break;
        }
      }

      if ([v63 count]) {
        [v59 setObject:v63 forKey:@"Options"];
      }

      v12 = v62;
      v26 = v55;
    }
    uint64_t v35 = objc_msgSend(v13, "objectForKey:");
    v57 = (void *)v35;
    if (v35)
    {
      v36 = (void *)v35;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v11 = +[MCPayload badFieldTypeErrorWithField:@"UserEnabledOptions"];
LABEL_56:
        v15 = v60;
LABEL_57:

        goto LABEL_58;
      }
      v56 = v26;
      v58 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v37 = v36;
      uint64_t v70 = [v37 countByEnumeratingWithState:&v72 objects:v87 count:16];
      if (v70)
      {
        uint64_t v67 = *(void *)v73;
        id v64 = v37;
        while (2)
        {
          for (uint64_t j = 0; j != v70; ++j)
          {
            if (*(void *)v73 != v67) {
              objc_enumerationMutation(v37);
            }
            v39 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            v40 = [v37 objectForKey:v39];
            if (v40)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v11 = +[MCPayload badFieldValueErrorWithField:v39];

                v12 = v62;
                v15 = v60;
                v26 = v56;
                goto LABEL_57;
              }
              v41 = +[MCAppWhitelistPayloadBase knownUserEnabledOptionKeys];
              int v42 = [v41 containsObject:v39];

              if (v42)
              {
                [v58 setObject:v40 forKey:v39];
                id v37 = v64;
              }
              else
              {
                v43 = _MCLogObjects;
                id v37 = v64;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v84 = v39;
                  _os_log_impl(&dword_1A13F0000, v43, OS_LOG_TYPE_DEFAULT, "Ignoring unknown option: %{public}@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v70 = [v37 countByEnumeratingWithState:&v72 objects:v87 count:16];
          if (v70) {
            continue;
          }
          break;
        }
      }

      if ([v58 count]) {
        [v59 setObject:v58 forKey:@"UserEnabledOptions"];
      }

      v12 = v62;
      v26 = v56;
    }
    [v12 addObject:v59];
    [(MCAppWhitelistPayloadBase *)v10 setWhitelistedAppsAndOptions:v12];
    id v11 = 0;
    goto LABEL_56;
  }
LABEL_61:

  if (v11) {
    goto LABEL_62;
  }
LABEL_67:
  if ([v8 count])
  {
    v51 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v52 = v51;
      v53 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v84 = v53;
      __int16 v85 = 2114;
      id v86 = v8;
      _os_log_impl(&dword_1A13F0000, v52, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_71:
  return v10;
}

- (NSString)applicationBundleID
{
  uint64_t v2 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"Identifier"];

  return (NSString *)v4;
}

- (BOOL)mustInstallNonInteractively
{
  return 1;
}

- (id)restrictions
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MCSingleAppPayload;
  uint64_t v3 = [(MCAppWhitelistPayloadBase *)&v10 restrictions];
  uint64_t v4 = (void *)[v3 MCMutableDeepCopy];

  v15[0] = @"allowMultipleAppsInAppLock";
  v13[0] = @"value";
  v13[1] = @"preference";
  v14[0] = MEMORY[0x1E4F1CC28];
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v5;
  v15[1] = @"allowAppLockLogout";
  v11[0] = @"value";
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCSingleAppPayload allowLogout](self, "allowLogout"));
  v11[1] = @"preference";
  v12[0] = v6;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v4 setObject:v8 forKeyedSubscript:@"restrictedBool"];

  return v4;
}

- (id)subtitle1Label
{
  return MCLocalizedFormat(@"SINGLE_APP_LABEL_COLON", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Description
{
  uint64_t v3 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
  uint64_t v4 = [v3 count];

  if (!v4) {
    goto LABEL_3;
  }
  v12 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
  v13 = [v12 objectAtIndex:0];
  id v14 = [v13 objectForKey:@"Identifier"];

  if (!v14)
  {
LABEL_3:
    id v14 = MCLocalizedFormat(@"SINGLE_APP_UNKNOWN", v5, v6, v7, v8, v9, v10, v11, v16);
  }
  return v14;
}

- (BOOL)allowLogout
{
  return self->_allowLogout;
}

@end