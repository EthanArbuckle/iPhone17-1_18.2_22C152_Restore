@interface INAppInfo
+ (BOOL)supportsSecureCoding;
+ (id)_appInfoWithApplicationRecord:(id)a3 applicationExtensionRecords:(id)a4 userActivityTypes:(id)a5;
+ (id)appInfoWithAppProxy:(id)a3;
+ (id)appInfoWithApplicationRecord:(id)a3;
+ (id)appInfoWithData:(id)a3 error:(id *)a4;
+ (id)appInfoWithIntent:(id)a3;
- (BOOL)isRequiresAppLaunchPreflight;
- (BOOL)supportsMultiwindow;
- (INAppInfo)init;
- (INAppInfo)initWithCoder:(id)a3;
- (NSArray)counterpartIdentifiers;
- (NSData)data;
- (NSDictionary)supportedIntentsGroupedByExtensionPoints;
- (NSSet)actionsRestrictedWhileLocked;
- (NSSet)actionsRestrictedWhileProtectedDataUnavailable;
- (NSSet)definedIntents;
- (NSSet)supportedActions;
- (NSSet)supportedActionsByExtensions;
- (NSSet)supportedIntents;
- (NSSet)supportedIntentsByApp;
- (NSSet)supportedMediaCategories;
- (NSString)applicationIdentifier;
- (NSString)companionApplicationIdentifier;
- (NSString)developmentRegion;
- (void)encodeWithCoder:(id)a3;
- (void)setActionsRestrictedWhileLocked:(id)a3;
- (void)setActionsRestrictedWhileProtectedDataUnavailable:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCompanionApplicationIdentifier:(id)a3;
- (void)setCounterpartIdentifiers:(id)a3;
- (void)setDefinedIntents:(id)a3;
- (void)setDevelopmentRegion:(id)a3;
- (void)setRequiresAppLaunchPreflight:(BOOL)a3;
- (void)setSupportedActions:(id)a3;
- (void)setSupportedActionsByExtensions:(id)a3;
- (void)setSupportedIntents:(id)a3;
- (void)setSupportedIntentsByApp:(id)a3;
- (void)setSupportedIntentsGroupedByExtensionPoints:(id)a3;
- (void)setSupportedMediaCategories:(id)a3;
- (void)setSupportsMultiwindow:(BOOL)a3;
@end

@implementation INAppInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedIntentsGroupedByExtensionPoints, 0);
  objc_storeStrong((id *)&self->_definedIntents, 0);
  objc_storeStrong((id *)&self->_supportedMediaCategories, 0);
  objc_storeStrong((id *)&self->_actionsRestrictedWhileProtectedDataUnavailable, 0);
  objc_storeStrong((id *)&self->_actionsRestrictedWhileLocked, 0);
  objc_storeStrong((id *)&self->_supportedActionsByExtensions, 0);
  objc_storeStrong((id *)&self->_supportedIntentsByApp, 0);
  objc_storeStrong((id *)&self->_supportedIntents, 0);
  objc_storeStrong((id *)&self->_supportedActions, 0);
  objc_storeStrong((id *)&self->_developmentRegion, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

+ (id)_appInfoWithApplicationRecord:(id)a3 applicationExtensionRecords:(id)a4 userActivityTypes:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v60 = a5;
  v61 = v7;
  if (!v60)
  {
    id v60 = [MEMORY[0x1E4F1CAD0] set];
  }
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [v7 supportedIntents];
  v59 = [v9 setWithArray:v10];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [v7 intentsRestrictedWhileLocked];
  v57 = [v11 setWithArray:v12];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v14 = [v7 intentsRestrictedWhileProtectedDataUnavailable];
  v58 = [v13 setWithArray:v14];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v16 = [v7 supportedIntentMediaCategories];
  v56 = [v15 setWithArray:v16];

  v63 = [MEMORY[0x1E4F1CA80] set];
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v8;
  uint64_t v18 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v65 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "if_extensionAttributesDictionary");
        v23 = [v22 objectForKeyedSubscript:@"IntentsSupported"];
        if ([v23 count])
        {
          v24 = [v21 extensionPointRecord];
          v25 = [v24 identifier];

          v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
          [v17 setObject:v26 forKeyedSubscript:v25];

          [v63 addObjectsFromArray:v23];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v18);
  }

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  v28 = objc_msgSend(obj, "if_flatMap:", &__block_literal_global_29);
  v29 = [v27 setWithArray:v28];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  v31 = objc_msgSend(obj, "if_flatMap:", &__block_literal_global_31);
  v32 = [v30 setWithArray:v31];

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  v34 = objc_msgSend(obj, "if_flatMap:", &__block_literal_global_33);
  v35 = [v33 setWithArray:v34];

  id v36 = objc_alloc_init((Class)objc_opt_class());
  v37 = v61;
  if (v61)
  {
    v38 = [v61 bundleIdentifier];
    [v36 setApplicationIdentifier:v38];

    v39 = [v61 infoDictionary];
    v40 = [v39 objectForKey:*MEMORY[0x1E4F1CFE8] ofClass:objc_opt_class()];
    [v36 setDevelopmentRegion:v40];

    objc_msgSend(v36, "setSupportsMultiwindow:", objc_msgSend(v61, "supportsMultiwindow"));
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2050000000;
    v41 = (void *)getPDCPreflightManagerClass_softClass;
    uint64_t v72 = getPDCPreflightManagerClass_softClass;
    if (!getPDCPreflightManagerClass_softClass)
    {
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __getPDCPreflightManagerClass_block_invoke;
      v68[3] = &unk_1E5520EB8;
      v68[4] = &v69;
      __getPDCPreflightManagerClass_block_invoke((uint64_t)v68);
      v41 = (void *)v70[3];
    }
    v42 = v41;
    _Block_object_dispose(&v69, 8);
    v43 = (void *)[[v42 alloc] initWithTargetQueue:0];
    objc_msgSend(v36, "setRequiresAppLaunchPreflight:", objc_msgSend(v43, "requiresPreflightForApplicationRecord:", v61));

    v44 = [v61 counterpartIdentifiers];
    [v36 setCounterpartIdentifiers:v44];

    v37 = v61;
  }
  BOOL v45 = v37 == 0;
  [v36 setSupportedIntentsByApp:v59];
  v46 = (void *)[v60 mutableCopy];
  [v46 unionSet:v63];
  [v36 setSupportedActions:v46];

  v47 = objc_msgSend(v61, "in_supportedIntents");
  [v36 setSupportedIntents:v47];

  [v36 setSupportedActionsByExtensions:v63];
  [v36 setSupportedIntentsGroupedByExtensionPoints:v17];
  v48 = (void *)[v60 mutableCopy];
  [v48 minusSet:v63];
  [v48 minusSet:v59];
  [v48 unionSet:v29];
  [v48 unionSet:v32];
  [v48 unionSet:v57];
  [v48 unionSet:v58];
  [v36 setActionsRestrictedWhileLocked:v48];

  v49 = (void *)[v32 mutableCopy];
  [v49 unionSet:v58];
  [v36 setActionsRestrictedWhileProtectedDataUnavailable:v49];

  if (!v45)
  {
    v50 = (void *)MEMORY[0x1E4F1CAD0];
    v51 = [v61 intentDefinitionURLs];
    v52 = [v51 allKeys];
    v53 = [v50 setWithArray:v52];
    [v36 setDefinedIntents:v53];
  }
  v54 = (void *)[v35 mutableCopy];
  [v54 unionSet:v56];
  [v36 setSupportedMediaCategories:v54];

  return v36;
}

- (void)setSupportsMultiwindow:(BOOL)a3
{
  self->_supportsMultiwindow = a3;
}

- (void)setSupportedMediaCategories:(id)a3
{
}

- (void)setSupportedIntentsGroupedByExtensionPoints:(id)a3
{
}

- (void)setSupportedIntentsByApp:(id)a3
{
}

- (void)setSupportedIntents:(id)a3
{
}

- (void)setSupportedActionsByExtensions:(id)a3
{
}

- (void)setSupportedActions:(id)a3
{
}

- (void)setRequiresAppLaunchPreflight:(BOOL)a3
{
  self->_requiresAppLaunchPreflight = a3;
}

- (void)setDevelopmentRegion:(id)a3
{
}

- (void)setDefinedIntents:(id)a3
{
}

- (void)setCounterpartIdentifiers:(id)a3
{
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setActionsRestrictedWhileProtectedDataUnavailable:(id)a3
{
}

- (void)setActionsRestrictedWhileLocked:(id)a3
{
}

- (INAppInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)INAppInfo;
  result = [(INAppInfo *)&v3 init];
  if (result) {
    result->_supportsMultiwindow = 0;
  }
  return result;
}

+ (id)appInfoWithApplicationRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = objc_msgSend(v4, "if_userActivityTypes");
  id v7 = [v5 setWithArray:v6];

  id v8 = [v4 applicationExtensionRecords];
  uint64_t v9 = [v8 allObjects];
  v10 = objc_msgSend((id)v9, "if_objectsPassingTest:", &__block_literal_global_4122);
  v11 = (void *)[v10 mutableCopy];

  v12 = [v4 bundleIdentifier];
  LOBYTE(v9) = [v12 hasPrefix:@"com.apple.shortcuts"];

  if (v9)
  {
    v13 = @"com.apple.WorkflowKit.ShortcutsIntents";
  }
  else
  {
    v14 = [v4 bundleIdentifier];
    int v15 = [v14 isEqualToString:@"com.apple.mobiletimer"];

    if (!v15) {
      goto LABEL_6;
    }
    v13 = @"com.apple.mobiletimer-framework.MobileTimerIntents";
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v13 error:0];
  objc_msgSend(v11, "if_addObjectIfNonNil:", v16);

LABEL_6:
  v17 = [a1 _appInfoWithApplicationRecord:v4 applicationExtensionRecords:v11 userActivityTypes:v7];

  return v17;
}

uint64_t __42__INAppInfo_appInfoWithApplicationRecord___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 extensionPointRecord];
  objc_super v3 = [v2 identifier];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.intents-service"];

  return v4;
}

- (NSSet)supportedActionsByExtensions
{
  return self->_supportedActionsByExtensions;
}

+ (id)appInfoWithAppProxy:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  v6 = [v5 bundleIdentifier];
  id v7 = [v4 applicationIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v13 = v10;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F223C8]);
    v12 = [v4 applicationIdentifier];
    id v17 = 0;
    id v13 = (id)[v11 initWithBundleIdentifier:v12 allowPlaceholder:0 error:&v17];
    id v9 = v17;

    if (!v9) {
      goto LABEL_12;
    }
    v14 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "+[INAppInfo appInfoWithAppProxy:]";
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_ERROR, "%s Unable to create app info with application record: %@", buf, 0x16u);
    }
  }

LABEL_12:
  if (v13)
  {
    int v15 = [a1 appInfoWithApplicationRecord:v13];
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

id __89__INAppInfo__appInfoWithApplicationRecord_applicationExtensionRecords_userActivityTypes___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "if_extensionAttributesDictionary");
  objc_super v3 = [v2 objectForKeyedSubscript:@"SupportedMediaCategories"];
  id v4 = v3;
  if (!v3) {
    objc_super v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

id __89__INAppInfo__appInfoWithApplicationRecord_applicationExtensionRecords_userActivityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "if_extensionAttributesDictionary");
  objc_super v3 = [v2 objectForKeyedSubscript:@"IntentsRestrictedWhileProtectedDataUnavailable"];
  id v4 = v3;
  if (!v3) {
    objc_super v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

id __89__INAppInfo__appInfoWithApplicationRecord_applicationExtensionRecords_userActivityTypes___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "if_extensionAttributesDictionary");
  objc_super v3 = [v2 objectForKeyedSubscript:@"IntentsRestrictedWhileLocked"];
  id v4 = v3;
  if (!v3) {
    objc_super v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (NSSet)supportedIntents
{
  return self->_supportedIntents;
}

- (void)setCompanionApplicationIdentifier:(id)a3
{
}

- (NSDictionary)supportedIntentsGroupedByExtensionPoints
{
  return self->_supportedIntentsGroupedByExtensionPoints;
}

- (NSSet)definedIntents
{
  return self->_definedIntents;
}

- (NSSet)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (NSSet)actionsRestrictedWhileProtectedDataUnavailable
{
  return self->_actionsRestrictedWhileProtectedDataUnavailable;
}

- (NSSet)actionsRestrictedWhileLocked
{
  return self->_actionsRestrictedWhileLocked;
}

- (NSSet)supportedIntentsByApp
{
  return self->_supportedIntentsByApp;
}

- (NSSet)supportedActions
{
  return self->_supportedActions;
}

- (BOOL)isRequiresAppLaunchPreflight
{
  return self->_requiresAppLaunchPreflight;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (NSString)developmentRegion
{
  return self->_developmentRegion;
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (INAppInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)INAppInfo;
  id v5 = [(INAppInfo *)&v61 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    [(INAppInfo *)v5 setApplicationIdentifier:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionApplicationIdentifier"];
    int v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"counterpartIdentifiers"];
    [(INAppInfo *)v5 setCounterpartIdentifiers:v11];

    v12 = [(INAppInfo *)v5 counterpartIdentifiers];

    if (!v12)
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "if_arrayWithObjectIfNonNil:", v7);
      [(INAppInfo *)v5 setCounterpartIdentifiers:v13];
    }
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developmentRegion"];
    [(INAppInfo *)v5 setDevelopmentRegion:v14];

    int v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"supportedActions"];
    if (v18)
    {
      [(INAppInfo *)v5 setSupportedActions:v18];
    }
    else
    {
      uint64_t v19 = objc_opt_new();
      [(INAppInfo *)v5 setSupportedActions:v19];
    }
    __int16 v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = [v4 decodeObjectOfClasses:v22 forKey:@"supportedIntents"];
    if (v23)
    {
      [(INAppInfo *)v5 setSupportedIntents:v23];
    }
    else
    {
      v24 = objc_opt_new();
      [(INAppInfo *)v5 setSupportedIntents:v24];
    }
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = [v4 decodeObjectOfClasses:v27 forKey:@"supportedIntentsByApp"];
    if (v28)
    {
      [(INAppInfo *)v5 setSupportedIntentsByApp:v28];
    }
    else
    {
      v29 = objc_opt_new();
      [(INAppInfo *)v5 setSupportedIntentsByApp:v29];
    }
    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v33 = [v4 decodeObjectOfClasses:v32 forKey:@"supportedActionsByExtensions"];
    if (v33)
    {
      [(INAppInfo *)v5 setSupportedActionsByExtensions:v33];
    }
    else
    {
      v34 = objc_opt_new();
      [(INAppInfo *)v5 setSupportedActionsByExtensions:v34];
    }
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    v39 = [v4 decodeObjectOfClasses:v38 forKey:@"supportedIntentsGroupedByExtensionPoints"];
    [(INAppInfo *)v5 setSupportedIntentsGroupedByExtensionPoints:v39];

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v43 = [v4 decodeObjectOfClasses:v42 forKey:@"actionsRestrictedWhileLocked"];
    if (v43)
    {
      [(INAppInfo *)v5 setActionsRestrictedWhileLocked:v43];
    }
    else
    {
      v44 = objc_opt_new();
      [(INAppInfo *)v5 setActionsRestrictedWhileLocked:v44];
    }
    BOOL v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v48 = [v4 decodeObjectOfClasses:v47 forKey:@"actionsRestrictedWhileProtectedDataUnavailable"];
    if (v48)
    {
      [(INAppInfo *)v5 setActionsRestrictedWhileProtectedDataUnavailable:v48];
    }
    else
    {
      v49 = objc_opt_new();
      [(INAppInfo *)v5 setActionsRestrictedWhileProtectedDataUnavailable:v49];
    }
    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v53 = [v4 decodeObjectOfClasses:v52 forKey:@"definedIntents"];
    if (v53)
    {
      [(INAppInfo *)v5 setDefinedIntents:v53];
    }
    else
    {
      v54 = objc_opt_new();
      [(INAppInfo *)v5 setDefinedIntents:v54];
    }
    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v58 = [v4 decodeObjectOfClasses:v57 forKey:@"supportedMediaCategories"];
    if (v58)
    {
      [(INAppInfo *)v5 setSupportedMediaCategories:v58];
    }
    else
    {
      v59 = objc_opt_new();
      [(INAppInfo *)v5 setSupportedMediaCategories:v59];
    }
    -[INAppInfo setSupportsMultiwindow:](v5, "setSupportsMultiwindow:", [v4 decodeBoolForKey:@"supportsMultiwindow"]);
    -[INAppInfo setRequiresAppLaunchPreflight:](v5, "setRequiresAppLaunchPreflight:", [v4 decodeBoolForKey:@"requiresAppLaunchPreflight"]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v6 = a3;
  [v6 encodeObject:applicationIdentifier forKey:@"applicationIdentifier"];
  id v5 = [(NSArray *)self->_counterpartIdentifiers firstObject];
  [v6 encodeObject:v5 forKey:@"companionApplicationIdentifier"];

  [v6 encodeObject:self->_counterpartIdentifiers forKey:@"counterpartIdentifiers"];
  [v6 encodeObject:self->_developmentRegion forKey:@"developmentRegion"];
  [v6 encodeObject:self->_supportedActions forKey:@"supportedActions"];
  [v6 encodeObject:self->_supportedIntents forKey:@"supportedIntents"];
  [v6 encodeObject:self->_supportedIntentsByApp forKey:@"supportedIntentsByApp"];
  [v6 encodeObject:self->_supportedActionsByExtensions forKey:@"supportedActionsByExtensions"];
  [v6 encodeObject:self->_supportedIntentsGroupedByExtensionPoints forKey:@"supportedIntentsGroupedByExtensionPoints"];
  [v6 encodeObject:self->_actionsRestrictedWhileLocked forKey:@"actionsRestrictedWhileLocked"];
  [v6 encodeObject:self->_actionsRestrictedWhileProtectedDataUnavailable forKey:@"actionsRestrictedWhileProtectedDataUnavailable"];
  [v6 encodeObject:self->_definedIntents forKey:@"definedIntents"];
  [v6 encodeObject:self->_supportedMediaCategories forKey:@"supportedMediaCategories"];
  [v6 encodeBool:self->_supportsMultiwindow forKey:@"supportsMultiwindow"];
  [v6 encodeBool:self->_requiresAppLaunchPreflight forKey:@"requiresAppLaunchPreflight"];
}

- (NSString)companionApplicationIdentifier
{
  v2 = [(INAppInfo *)self counterpartIdentifiers];
  objc_super v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)appInfoWithIntent:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 extensionBundleId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    v14 = [v4 launchId];
    id v22 = 0;
    INExtractAppInfoFromSiriLaunchId(v14, &v22, 0);
    id v10 = v22;

    id v21 = 0;
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:0 error:&v21];
    id v9 = v21;
    if (v9
      && (int v15 = INSiriLogContextIntents,
          os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[INAppInfo appInfoWithIntent:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Unable to create application record: %@", buf, 0x16u);
      if (v12) {
        goto LABEL_9;
      }
    }
    else if (v12)
    {
LABEL_9:
      uint64_t v13 = [a1 appInfoWithApplicationRecord:v12];
      goto LABEL_10;
    }
    if (v10)
    {
      uint64_t v16 = [_INVCIntentDefinitionManagerClass() appInfoForBundleID:v10];
      v12 = 0;
    }
    else
    {
      v12 = 0;
      uint64_t v16 = 0;
    }
    goto LABEL_11;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F223A0]);
  int v8 = [v4 extensionBundleId];
  id v20 = 0;
  id v9 = (id)[v7 initWithBundleIdentifier:v8 error:&v20];
  id v10 = v20;

  if (v10
    && (id v11 = (void *)INSiriLogContextIntents, os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)))
  {
    id v17 = v11;
    uint64_t v18 = [v4 extensionBundleId];
    *(_DWORD *)buf = 136315650;
    v25 = "+[INAppInfo appInfoWithIntent:]";
    __int16 v26 = 2112;
    id v27 = v18;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s Unable to create application extension record <%@>: %@", buf, 0x20u);

    if (v9) {
      goto LABEL_5;
    }
  }
  else if (v9)
  {
LABEL_5:
    id v23 = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    uint64_t v13 = [a1 _appInfoWithApplicationRecord:0 applicationExtensionRecords:v12 userActivityTypes:0];
LABEL_10:
    uint64_t v16 = (void *)v13;
LABEL_11:

    goto LABEL_14;
  }
  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

+ (id)appInfoWithData:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  id v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

@end