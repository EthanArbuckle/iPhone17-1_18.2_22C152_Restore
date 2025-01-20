@interface MCNotificationSettingsPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCNotificationSettingsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)notificationSettings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)validatedNotificationSettings:(id)a3 outError:(id *)a4;
- (void)setNotificationSettings:(id)a3;
@end

@implementation MCNotificationSettingsPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.notificationsettings";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"NOTIFICATION_SETTINGS_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"NOTIFICATION_SETTINGS_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCNotificationSettingsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MCNotificationSettingsPayload;
  v10 = [(MCPayload *)&v32 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    int v11 = [v9 isStub];
    uint64_t v12 = objc_opt_class();
    if (v11)
    {
      id v31 = 0;
      uint64_t v13 = [v8 MCValidateAndRemoveArrayOfClass:v12 withKey:@"NotificationSettings" isRequired:0 outError:&v31];
      id v14 = v31;
      notificationSettings = v10->_notificationSettings;
      v10->_notificationSettings = (NSArray *)v13;
    }
    else
    {
      id v30 = 0;
      notificationSettings = [v8 MCValidateAndRemoveArrayOfClass:v12 withKey:@"NotificationSettings" isRequired:1 outError:&v30];
      id v16 = v30;
      if (v16)
      {
        id v14 = v16;
      }
      else
      {
        id v29 = 0;
        v17 = [(MCNotificationSettingsPayload *)v10 validatedNotificationSettings:notificationSettings outError:&v29];
        id v14 = v29;
        [(MCNotificationSettingsPayload *)v10 setNotificationSettings:v17];
      }
    }

    if (v14)
    {
      v18 = [(MCPayload *)v10 malformedPayloadErrorWithError:v14];
      v19 = v18;
      if (a5) {
        *a5 = v18;
      }
      v20 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        v22 = objc_opt_class();
        id v23 = v22;
        v24 = [v19 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v34 = v22;
        __int16 v35 = 2114;
        id v36 = v24;
        _os_log_impl(&dword_1A13F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
    }
    if ([v8 count])
    {
      v25 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v26 = v25;
        v27 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        __int16 v35 = 2114;
        id v36 = v8;
        _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
  }
  return v10;
}

- (id)validatedNotificationSettings:(id)a3 outError:(id *)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v86 objects:v92 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v72 = v6;
    v71 = a4;
    int v11 = 0;
    uint64_t v12 = *(void *)v87;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v87 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * v13) mutableCopy];
      id v85 = v11;
      v15 = [v14 MCValidateAndRemoveNonZeroLengthStringWithKey:@"BundleIdentifier" isRequired:1 outError:&v85];
      id v16 = v85;

      if (v16)
      {

        id v58 = 0;
        int v11 = v16;
        a4 = v71;
        uint64_t v6 = v72;
        if (v71) {
          goto LABEL_68;
        }
        goto LABEL_69;
      }
      uint64_t v17 = objc_opt_class();
      id v84 = 0;
      v18 = [v14 MCValidateAndRemoveObjectOfClass:v17 withKey:@"NotificationsEnabled" isRequired:0 outError:&v84];
      id v19 = v84;
      if (v19)
      {
        int v11 = v19;
        int v20 = 2;
      }
      else
      {
        uint64_t v21 = objc_opt_class();
        id v83 = 0;
        v74 = [v14 MCValidateAndRemoveObjectOfClass:v21 withKey:@"ShowInNotificationCenter" isRequired:0 outError:&v83];
        id v22 = v83;
        if (v22)
        {
          int v11 = v22;
          int v20 = 2;
        }
        else
        {
          uint64_t v23 = objc_opt_class();
          id v82 = 0;
          v73 = [v14 MCValidateAndRemoveObjectOfClass:v23 withKey:@"ShowInLockScreen" isRequired:0 outError:&v82];
          id v24 = v82;
          if (v24)
          {
            int v11 = v24;
            int v20 = 2;
          }
          else
          {
            uint64_t v25 = objc_opt_class();
            id v81 = 0;
            v70 = [v14 MCValidateAndRemoveObjectOfClass:v25 withKey:@"AlertType" isRequired:0 outError:&v81];
            id v26 = v81;
            if (v26)
            {
              int v11 = v26;
              int v20 = 2;
            }
            else
            {
              uint64_t v27 = objc_opt_class();
              id v80 = 0;
              v69 = [v14 MCValidateAndRemoveObjectOfClass:v27 withKey:@"BadgesEnabled" isRequired:0 outError:&v80];
              id v28 = v80;
              if (v28)
              {
                int v11 = v28;
                int v20 = 2;
              }
              else
              {
                uint64_t v29 = objc_opt_class();
                id v79 = 0;
                v68 = [v14 MCValidateAndRemoveObjectOfClass:v29 withKey:@"SoundsEnabled" isRequired:0 outError:&v79];
                id v30 = v79;
                if (v30)
                {
                  int v11 = v30;
                  int v20 = 2;
                }
                else
                {
                  uint64_t v31 = objc_opt_class();
                  id v78 = 0;
                  v67 = [v14 MCValidateAndRemoveObjectOfClass:v31 withKey:@"ShowInCarPlay" isRequired:0 outError:&v78];
                  id v32 = v78;
                  if (v32)
                  {
                    int v11 = v32;
                    int v20 = 2;
                  }
                  else
                  {
                    uint64_t v33 = objc_opt_class();
                    id v77 = 0;
                    v66 = [v14 MCValidateAndRemoveObjectOfClass:v33 withKey:@"CriticalAlertEnabled" isRequired:0 outError:&v77];
                    id v34 = v77;
                    if (v34)
                    {
                      int v11 = v34;
                      int v20 = 2;
                    }
                    else
                    {
                      uint64_t v35 = objc_opt_class();
                      id v76 = 0;
                      v65 = [v14 MCValidateAndRemoveObjectOfClass:v35 withKey:@"GroupingType" isRequired:0 outError:&v76];
                      id v36 = v76;
                      if (v36)
                      {
                        int v11 = v36;
                        int v20 = 2;
                      }
                      else
                      {
                        uint64_t v37 = objc_opt_class();
                        id v75 = 0;
                        uint64_t v38 = [v14 MCValidateAndRemoveObjectOfClass:v37 withKey:@"PreviewType" isRequired:0 outError:&v75];
                        id v39 = v75;
                        v64 = (void *)v38;
                        if (v39)
                        {
                          int v11 = v39;
                          int v20 = 2;
                        }
                        else if ([v7 containsObject:v15])
                        {
                          v47 = (void *)MEMORY[0x1E4F28C58];
                          v61 = MCErrorArray(@"ERROR_PAYLOAD_MULTIPLE_NOTIFICATION_SETTINGS_FOR_SAME_APP", v40, v41, v42, v43, v44, v45, v46, 0);
                          int v11 = objc_msgSend(v47, "MCErrorWithDomain:code:descriptionArray:errorType:", @"MCPayloadErrorDomain", 2000);
                          int v20 = 2;
                        }
                        else
                        {
                          id v62 = objc_alloc(MEMORY[0x1E4F1CA60]);
                          v90[0] = @"BundleIdentifier";
                          v90[1] = @"NotificationsEnabled";
                          if (v18) {
                            v48 = v18;
                          }
                          else {
                            v48 = (void *)MEMORY[0x1E4F1CC38];
                          }
                          v91[0] = v15;
                          v91[1] = v48;
                          v49 = v74;
                          if (!v74) {
                            v49 = (void *)MEMORY[0x1E4F1CC38];
                          }
                          v90[2] = @"ShowInNotificationCenter";
                          v90[3] = @"ShowInLockScreen";
                          v50 = v73;
                          if (!v73) {
                            v50 = (void *)MEMORY[0x1E4F1CC38];
                          }
                          v91[2] = v49;
                          v91[3] = v50;
                          v51 = &unk_1EF4D09D0;
                          if (v70) {
                            v51 = v70;
                          }
                          v90[4] = @"AlertType";
                          v90[5] = @"BadgesEnabled";
                          v52 = v69;
                          if (!v69) {
                            v52 = (void *)MEMORY[0x1E4F1CC38];
                          }
                          v91[4] = v51;
                          v91[5] = v52;
                          v53 = v68;
                          if (!v68) {
                            v53 = (void *)MEMORY[0x1E4F1CC38];
                          }
                          v90[6] = @"SoundsEnabled";
                          v90[7] = @"ShowInCarPlay";
                          v54 = v67;
                          if (!v67) {
                            v54 = (void *)MEMORY[0x1E4F1CC38];
                          }
                          v91[6] = v53;
                          v91[7] = v54;
                          v55 = (void *)MEMORY[0x1E4F1CC28];
                          if (v66) {
                            v55 = v66;
                          }
                          v90[8] = @"CriticalAlertEnabled";
                          v90[9] = @"GroupingType";
                          v56 = &unk_1EF4D09E8;
                          if (v65) {
                            v56 = v65;
                          }
                          v91[8] = v55;
                          v91[9] = v56;
                          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:10];
                          v63 = (void *)[v62 initWithDictionary:v57];

                          if (v38) {
                            [v63 setObject:v38 forKeyedSubscript:@"PreviewType"];
                          }
                          [v7 addObject:v15];
                          [v72 addObject:v63];
                          int v20 = 0;
                          int v11 = 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      if (v20) {
        break;
      }
      if (v10 == ++v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v86 objects:v92 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }

    a4 = v71;
    uint64_t v6 = v72;
    if (!v11) {
      goto LABEL_67;
    }
    id v58 = 0;
    if (v71) {
      goto LABEL_68;
    }
  }
  else
  {

LABEL_67:
    id v58 = v6;
    int v11 = 0;
    if (a4) {
LABEL_68:
    }
      *a4 = v11;
  }
LABEL_69:
  id v59 = v58;

  return v59;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCNotificationSettingsPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCNotificationSettingsPayload *)self notificationSettings];
  [v3 setObject:v4 forKeyedSubscript:@"NotificationSettings"];

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v2 = objc_opt_new();
  if (![v2 count])
  {

    uint64_t v2 = 0;
  }
  return v2;
}

- (NSArray)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end