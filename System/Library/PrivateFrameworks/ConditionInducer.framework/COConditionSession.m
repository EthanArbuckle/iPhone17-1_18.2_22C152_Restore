@interface COConditionSession
+ (BOOL)conditionIsBundledWithFramework:(id)a3;
+ (BOOL)tearDownAllConditionsWithErrors:(id *)a3;
+ (BOOL)updateConditionCache:(BOOL)a3 forCondition:(id)a4 additionalArguments:(id)a5 conditionBundle:(id)a6 error:(id *)a7;
+ (BOOL)writeConditionCache:(id)a3 toFileDescriptor:(int)a4 error:(id *)a5;
+ (id)_loadExternalConditionBundleInfo:(id)a3 supportedConditionData:(id)a4 error:(id *)a5;
+ (id)bundleToDict:(id)a3;
+ (id)conditionsBundledWithFramework;
+ (id)findBundleURLForConditionClass:(id)a3 andError:(id *)a4;
+ (id)getActiveConditions;
+ (id)getBootSessionUUID;
+ (id)getBundleURLsAtPath:(id)a3;
+ (id)listAvailableConditions;
+ (id)loadConditionCacheWithError:(id *)a3;
+ (id)loadInformationDict;
+ (id)prepareInfoDictForBuiltInCondition:(id)a3 error:(id *)a4;
+ (id)removeStaleConditions:(id)a3;
+ (void)conditionsBundledWithFramework;
+ (void)getActiveConditions;
+ (void)getBootSessionUUID;
+ (void)listAvailableConditions;
+ (void)loadInformationDict;
+ (void)logSignpostWithConditionStates;
- (BOOL)_setupBundleAtPath:(id)a3 withError:(id *)a4;
- (BOOL)createStatusBar:(id)a3 conditionClassDescription:(id)a4 withProfileDescription:(id)a5 error:(id *)a6;
- (BOOL)hasActiveCondition;
- (BOOL)loadBundleWithPath:(id)a3 andError:(id *)a4;
- (BOOL)loadProfileForBundle:(id)a3 withError:(id *)a4;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)startConditionWithCallback:(id)a3;
- (BOOL)startConditionWithCallback:(id)a3 andStatusBarNotificationCallback:(id)a4;
- (BOOL)startConditionWithCallback:(id)a3 teardownStartedCallback:(id)a4 teardownFinishedCallback:(id)a5;
- (BOOL)stopConditionWithCallback:(id)a3;
- (BOOL)tearDownWithError:(id *)a3;
- (COCondition)condition;
- (COConditionBundle)bundle;
- (COConditionSession)initWithConditionIdentifier:(id)a3 profile:(id)a4;
- (COConditionSession)initWithConditionIdentifier:(id)a3 profile:(id)a4 additionalArgs:(id)a5;
- (COStatusBar)statusBar;
- (NSArray)additionalArguments;
- (NSMutableDictionary)classDict;
- (NSString)selectedCondition;
- (NSString)selectedProfile;
- (NSString)warning;
- (NSURL)bundleURL;
- (OS_dispatch_queue)setUpQueue;
- (OS_dispatch_queue)tearDownQueue;
- (id)className;
- (id)copyLoadedConditionClassName;
- (id)notifyTeardownBeganCallback;
- (id)statusBarPopupFinishedTeardownCallback;
- (id)userFriendlyNameForSelectedCondition;
- (id)userFriendlyNameForSelectedProfile;
- (void)dealloc;
- (void)freeStatusBar;
- (void)setBundle:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setClassDict:(id)a3;
- (void)setCondition:(id)a3;
- (void)setNotifyTeardownBeganCallback:(id)a3;
- (void)setSetUpQueue:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setStatusBarPopupFinishedTeardownCallback:(id)a3;
- (void)setTearDownQueue:(id)a3;
- (void)setWarning:(id)a3;
- (void)userFriendlyNameForSelectedCondition;
- (void)userFriendlyNameForSelectedProfile;
@end

@implementation COConditionSession

- (id)userFriendlyNameForSelectedCondition
{
  v3 = [(COConditionSession *)self selectedCondition];

  if (v3)
  {
    v4 = [(COConditionSession *)self selectedCondition];
    BOOL v5 = +[COConditionSession conditionIsBundledWithFramework:v4];

    if (v5)
    {
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = [v6 infoDictionary];

      v8 = [v7 objectForKey:@"SupportedConditionData"];
      v9 = [(COConditionSession *)self selectedCondition];
      v10 = [v8 objectForKey:v9];
      v11 = [v10 objectForKey:@"Metadata"];
      v12 = [v11 objectForKey:@"ConditionUserFriendlyName"];

      v13 = 0;
      if (v12) {
        goto LABEL_13;
      }
LABEL_9:
      v12 = NSStringFromClass(v13);
      goto LABEL_13;
    }
    v14 = [(COConditionSession *)self selectedCondition];
    v13 = NSClassFromString(v14);

    if (v13)
    {
      v15 = [MEMORY[0x263F086E0] bundleForClass:v13];
      v7 = [v15 infoDictionary];

      v12 = [v7 objectForKey:@"ConditionUserFriendlyName"];
      if (v12) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionSession userFriendlyNameForSelectedCondition](self);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    -[COConditionSession userFriendlyNameForSelectedCondition]();
  }
  v7 = 0;
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)userFriendlyNameForSelectedProfile
{
  v3 = [(COConditionSession *)self selectedProfile];

  if (v3)
  {
    v4 = [(COConditionSession *)self selectedProfile];
    Class v5 = NSClassFromString(v4);

    if (v5)
    {
      if (objc_opt_respondsToSelector()) {
        [(objc_class *)v5 profileFriendlyName];
      }
      else {
      v6 = NSStringFromClass(v5);
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionSession userFriendlyNameForSelectedProfile](self);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    -[COConditionSession userFriendlyNameForSelectedProfile]();
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)_loadExternalConditionBundleInfo:(id)a3 supportedConditionData:(id)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v10 = [v8 objectForKey:v7];
  id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v10)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 174, -1, 0, @"No class information dict found in Info.plist %s for condition %@", v11, v12, v13, (uint64_t)"SupportedConditionData");
    goto LABEL_27;
  }
  v61 = [v10 objectForKey:@"Profiles"];
  if (!v61)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 180, -1, 0, @"Class information dictionary containing supported profiles for not found for condition %@", v14, v15, v16, (uint64_t)v7);
LABEL_27:
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v20 = 0;
    v61 = 0;
    if (!a5) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  v20 = [v10 objectForKey:@"Metadata"];
  if (!v20)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 186, -1, 0, @"Class information dictionary containing condition metadata for not found for condition %@", v17, v18, v19, (uint64_t)v7);
    goto LABEL_31;
  }
  if (![v61 count])
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 192, -1, 0, @"Expected at least one supported profile for %@", v21, v22, v23, (uint64_t)v7);
LABEL_31:
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (!a5) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  v24 = [v61 objectAtIndexedSubscript:0];
  v25 = NSClassFromString(v24);
  if (v25)
  {
    id v29 = objc_alloc_init(v25);
    if (v29)
    {
      v33 = v29;
      uint64_t v34 = [v29 userFriendlyNameFromDict:v20];
      if (v34) {
        [v9 setObject:v34 forKey:@"ConditionUserFriendlyName"];
      }
      v53 = (void *)v34;
      v54 = v24;
      v56 = v10;
      id v58 = v8;
      uint64_t v35 = [v33 identifierNameFromDict:v20];
      if (v35) {
        [v9 setObject:v35 forKey:@"ConditionIdentifierName"];
      }
      v52 = (void *)v35;
      v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "isDestructiveFromDict:", v20));
      [v9 setObject:v36 forKey:@"ConditionIsDestructive"];

      v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "isInternalOnlyFromDict:", v20));
      [v9 setObject:v37 forKey:@"ConditionIsInternalOnly"];

      v55 = v20;
      v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "persistsAfterRebootFromDict:", v20));
      v57 = v9;
      [v9 setObject:v38 forKey:@"ConditionPersistsAfterReboot"];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v39 = v61;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v62 objects:v66 count:16];
      v61 = v39;
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v63 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = *(NSString **)(*((void *)&v62 + 1) + 8 * i);
            Class v45 = NSClassFromString(v44);
            if (v45)
            {
              Class v46 = v45;
              if ((![v7 isEqualToString:@"ThermalCondition"]
                 || ![(NSString *)v44 isEqualToString:@"ThermalNominal"])
                && (![v7 isEqualToString:@"GPUPerformanceState"]
                 || ![(NSString *)v44 isEqualToString:@"GPUPerformanceStateDefault"]))
              {
                v47 = (void *)MEMORY[0x263EFF9A0];
                v48 = [(objc_class *)v46 info];
                v49 = [v47 dictionaryWithDictionary:v48];

                [v49 setValue:v44 forKey:@"ConditionBundleProfile"];
                [v60 setValue:v49 forKey:v44];
                [v59 addObject:v49];

                id v39 = v61;
              }
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v62 objects:v66 count:16];
        }
        while (v41);
      }

      id v9 = v57;
      [v57 setObject:v59 forKey:@"ConditionBundleArray"];
      [v57 setObject:v60 forKey:@"ConditionBundleDict"];
      [v57 setObject:v7 forKey:@"ConditionCacheBundlePath"];

      id v50 = 0;
      id v8 = v58;
      v20 = v55;
      v10 = v56;
      v24 = v54;
      goto LABEL_38;
    }
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 203, -1, 0, @"Failed to allocate instance of %@ for condition %@", v30, v31, v32, (uint64_t)v24);
  }
  else
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 198, -1, 0, @"Failed to instantiate principal class %@ for condition %@", v26, v27, v28, (uint64_t)v24);
  }
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  if (!a5) {
    goto LABEL_38;
  }
LABEL_36:
  if (v50)
  {
    id v50 = v50;
    *a5 = v50;
  }
LABEL_38:

  return v9;
}

- (BOOL)setUpWithError:(id *)a3
{
  Class v5 = [(COConditionSession *)self condition];

  if (!v5)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", 261, -1, 0, @"Need a valid condition first", v6, v7, v8, v42);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  Class v5 = [(COConditionSession *)self userFriendlyNameForSelectedProfile];
  if (!v5)
  {
    Class v5 = [(COConditionSession *)self selectedProfile];
  }
  id v9 = [(COConditionSession *)self userFriendlyNameForSelectedCondition];
  id v45 = 0;
  BOOL v10 = [(COConditionSession *)self createStatusBar:@"setting up" conditionClassDescription:v9 withProfileDescription:v5 error:&v45];
  id v11 = v45;

  if (!v10)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", 272, -1, v11, @"Failed to create status bar with title 'Setup'.", v12, v13, v14, v42);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v15 = [(COConditionSession *)self condition];
  int v16 = [v15 active];

  if (v16)
  {
    uint64_t v17 = [(COConditionSession *)self condition];
    [v17 tearDown];
  }
  uint64_t v18 = [(COConditionSession *)self additionalArguments];
  uint64_t v19 = [(COConditionSession *)self condition];
  [v19 setAdditionalArguments:v18];

  v20 = [(COConditionSession *)self condition];
  uint64_t v21 = [(COConditionSession *)self additionalArguments];
  uint64_t v22 = [(COConditionSession *)self bundle];
  id v44 = v11;
  LOBYTE(v18) = +[COConditionSession updateConditionCache:1 forCondition:v20 additionalArguments:v21 conditionBundle:v22 error:&v44];
  id v23 = v44;

  if ((v18 & 1) == 0)
  {
    v36 = @"Failed to update cache.";
    uint64_t v37 = 284;
    v38 = v23;
    goto LABEL_17;
  }
  uint64_t v27 = [(COConditionSession *)self condition];
  char v28 = [v27 setUp];

  if ((v28 & 1) == 0)
  {
    v36 = @"Failed to set up condition.";
    uint64_t v37 = 289;
    v38 = 0;
LABEL_17:
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", v37, -1, v38, v36, v24, v25, v26, v42);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
LABEL_19:
      id v39 = [(COConditionSession *)self userFriendlyNameForSelectedCondition];
      [(COConditionSession *)self createStatusBar:@"tearing down" conditionClassDescription:v39 withProfileDescription:v5 error:0];

      [(COConditionSession *)self tearDownWithError:0];
      BOOL v35 = 0;
      goto LABEL_20;
    }
LABEL_18:
    *a3 = v31;
    goto LABEL_19;
  }
  id v29 = [(COConditionSession *)self userFriendlyNameForSelectedCondition];
  id v43 = v23;
  BOOL v30 = [(COConditionSession *)self createStatusBar:@"running" conditionClassDescription:v29 withProfileDescription:v5 error:&v43];
  id v31 = v43;

  if (!v30)
  {
    uint64_t v41 = createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", 294, -1, v31, @"Failed to create status bar with title 'Running'.", v32, v33, v34, v42);

    id v31 = (id)v41;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  BOOL v35 = 1;
LABEL_20:

  return v35;
}

- (BOOL)tearDownWithError:(id *)a3
{
  Class v5 = [(COConditionSession *)self userFriendlyNameForSelectedProfile];
  uint64_t v6 = [(COConditionSession *)self condition];

  if (v6)
  {
    if (!v5)
    {
      Class v5 = [(COConditionSession *)self selectedProfile];
    }
    BOOL v10 = [(COConditionSession *)self userFriendlyNameForSelectedCondition];
    BOOL v11 = [(COConditionSession *)self createStatusBar:@"tearing down" conditionClassDescription:v10 withProfileDescription:v5 error:a3];

    if (v11)
    {
      uint64_t v12 = [(COConditionSession *)self condition];
      [v12 tearDown];

      uint64_t v13 = [(COConditionSession *)self condition];
      uint64_t v14 = [(COConditionSession *)self additionalArguments];
      uint64_t v15 = [(COConditionSession *)self bundle];
      +[COConditionSession updateConditionCache:0 forCondition:v13 additionalArguments:v14 conditionBundle:v15 error:0];

      [(COConditionSession *)self freeStatusBar];
      id v16 = 0;
      BOOL v17 = 1;
      goto LABEL_11;
    }
    uint64_t v18 = @"Failed to create status bar with title 'Teardown'";
    uint64_t v19 = 331;
    int v20 = -1;
  }
  else
  {
    uint64_t v18 = @"Condition not running.";
    uint64_t v19 = 321;
    int v20 = -10;
  }
  uint64_t v21 = createConditionInducerError((uint64_t)"-[COConditionSession tearDownWithError:]", v19, v20, 0, v18, v7, v8, v9, v23);
  id v16 = v21;
  if (a3)
  {
    id v16 = v21;
    BOOL v17 = 0;
    *a3 = v16;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_11:

  return v17;
}

- (id)className
{
  v3 = [(COConditionSession *)self condition];
  if (v3)
  {
    v4 = [(COConditionSession *)self condition];
    Class v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)getBundleURLsAtPath:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  v3 = [NSURL fileURLWithPath:a3];
  v4 = [MEMORY[0x263F08850] defaultManager];
  v22[0] = *MEMORY[0x263EFF6A8];
  Class v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  uint64_t v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:7 error:0];

  uint64_t v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "pathExtension", (void)v17);
        uint64_t v15 = v14;
        if (v14 && ![v14 caseInsensitiveCompare:@"bundle"]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)bundleToDict:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = [[COConditionBundle alloc] initWithURL:v3];
    Class v5 = v4;
    if (v4)
    {
      id v50 = 0;
      BOOL v6 = [(COConditionBundle *)v4 loadAndReturnError:&v50];
      id v7 = v50;
      id v8 = v7;
      if (v6)
      {
        id v42 = v7;
        id v45 = v3;
        id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v10 = objc_alloc(MEMORY[0x263EFF980]);
        uint64_t v11 = [(COConditionBundle *)v5 conditions];
        uint64_t v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v44 = v5;
        uint64_t v13 = [(COConditionBundle *)v5 conditions];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v47 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              long long v19 = (void *)MEMORY[0x263EFF9A0];
              long long v20 = objc_msgSend(v18, "info", v42);
              uint64_t v21 = [v19 dictionaryWithDictionary:v20];

              uint64_t v22 = NSStringFromClass((Class)v18);
              [v21 setValue:v22 forKey:@"ConditionBundleProfile"];

              [v12 addObject:v21];
              uint64_t v23 = NSStringFromClass((Class)v18);
              [v9 setValue:v21 forKey:v23];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v15);
        }

        uint64_t v24 = v43;
        [v43 setObject:v12 forKey:@"ConditionBundleArray"];
        Class v5 = v44;
        uint64_t v25 = (objc_class *)[(COConditionBundle *)v44 principalClass];
        if (v25)
        {
          id v26 = objc_alloc_init(v25);
          uint64_t v27 = [v26 userFriendlyName];
          if (v27) {
            [v43 setObject:v27 forKey:@"ConditionUserFriendlyName"];
          }
          char v28 = objc_msgSend(v26, "identifierName", v42);
          if (v28) {
            [v43 setObject:v28 forKey:@"ConditionIdentifierName"];
          }
          id v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v26, "isDestructive"));
          [v43 setObject:v29 forKey:@"ConditionIsDestructive"];

          BOOL v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v26, "isInternalOnly"));
          [v43 setObject:v30 forKey:@"ConditionIsInternalOnly"];

          id v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v26, "persistsAfterReboot"));
          [v43 setObject:v31 forKey:@"ConditionPersistsAfterReboot"];

          id v3 = v45;
          uint64_t v32 = v42;
        }
        else
        {
          id v3 = v45;
          uint64_t v32 = v42;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            +[COConditionSession bundleToDict:]();
          }
        }
        objc_msgSend(v43, "setObject:forKey:", v9, @"ConditionBundleDict", v42);

        goto LABEL_29;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[COConditionSession bundleToDict:].cold.4(v3, v8);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      +[COConditionSession bundleToDict:](v3);
    }
    uint64_t v24 = 0;
LABEL_29:

    goto LABEL_30;
  }
  BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v33) {
    +[COConditionSession bundleToDict:](v33, v34, v35, v36, v37, v38, v39, v40);
  }
  uint64_t v24 = 0;
LABEL_30:

  return v24;
}

- (BOOL)loadProfileForBundle:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(COConditionSession *)self bundle];

  if (v7)
  {
    uint64_t v11 = [(COConditionSession *)self bundle];
    uint64_t v12 = (objc_class *)[v11 classNamed:v6];

    if (v12)
    {
      id v16 = objc_alloc_init(v12);
      [(COConditionSession *)self setCondition:v16];

      long long v17 = [(COConditionSession *)self condition];

      if (v17)
      {
        id v21 = 0;
        BOOL v22 = 1;
        goto LABEL_11;
      }
      createConditionInducerError((uint64_t)"-[COConditionSession loadProfileForBundle:withError:]", 448, -1, 0, @"Failed to instantiate %@", v18, v19, v20, (uint64_t)v6);
    }
    else
    {
      createConditionInducerError((uint64_t)"-[COConditionSession loadProfileForBundle:withError:]", 442, -1, 0, @"Failed to load class %@", v13, v14, v15, (uint64_t)v6);
    }
  }
  else
  {
    createConditionInducerError((uint64_t)"-[COConditionSession loadProfileForBundle:withError:]", 436, -1, 0, @"No bundle loaded for %@", v8, v9, v10, (uint64_t)v6);
  }
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v21 = v21;
    BOOL v22 = 0;
    *a4 = v21;
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_11:

  return v22;
}

- (BOOL)_setupBundleAtPath:(id)a3 withError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!v9)
  {
    id v21 = @"Must supply valid bundle URL to loadBundle";
    uint64_t v22 = 469;
    goto LABEL_11;
  }
  uint64_t v10 = [[COConditionBundle alloc] initWithURL:v9];
  [(COConditionSession *)self setBundle:v10];

  uint64_t v11 = [(COConditionSession *)self bundle];

  if (!v11)
  {
    uint64_t v23 = [v9 path];
    createConditionInducerError((uint64_t)"-[COConditionSession _setupBundleAtPath:withError:]", 475, -1, 0, @"Failed to intialize bundle for %@.", v24, v25, v26, (uint64_t)v23);
    id v27 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
LABEL_12:
      id v27 = v27;
      BOOL v28 = 0;
      *a4 = v27;
      goto LABEL_23;
    }
LABEL_9:
    BOOL v28 = 0;
    goto LABEL_23;
  }
  uint64_t v12 = [(COConditionSession *)self bundle];
  char v13 = [v12 loadAndReturnError:a4];

  if ((v13 & 1) == 0)
  {
    id v21 = @"Failed to load bundle.";
    uint64_t v22 = 480;
LABEL_11:
    createConditionInducerError((uint64_t)"-[COConditionSession _setupBundleAtPath:withError:]", v22, -1, 0, v21, v6, v7, v8, v41);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (a4) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  uint64_t v14 = [(COConditionSession *)self bundle];
  uint64_t v15 = [v14 objectForInfoDictionaryKey:@"ProhibitOnCarryDevice"];
  [(COConditionSession *)self setWarning:v15];

  id v16 = [(COConditionSession *)self warning];

  if (!v16)
  {
    uint64_t v20 = @"Danger! - This condition has potential to corrupt user data";
    uint64_t v19 = self;
    goto LABEL_14;
  }
  long long v17 = [(COConditionSession *)self warning];
  uint64_t v18 = [v17 length];

  if (!v18)
  {
    uint64_t v19 = self;
    uint64_t v20 = 0;
LABEL_14:
    [(COConditionSession *)v19 setWarning:v20];
  }
  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(COConditionSession *)self setClassDict:v29];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  BOOL v30 = [(COConditionSession *)self bundle];
  id v31 = [v30 conditions];

  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v37 = [(COConditionSession *)self classDict];
        uint64_t v38 = [v36 description];
        uint64_t v39 = NSStringFromClass((Class)v36);
        [v37 setValue:v38 forKey:v39];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v33);
  }

  id v27 = 0;
  BOOL v28 = 1;
LABEL_23:

  return v28;
}

+ (id)findBundleURLForConditionClass:(id)a3 andError:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [NSString stringWithUTF8String:"/AppleInternal/Tests/com.apple.ConditionInducer"];
  uint64_t v7 = [v5 pathExtension];
  uint64_t v8 = [v7 caseInsensitiveCompare:@"bundle"];

  if (v8)
  {
    uint64_t v9 = [v5 stringByAppendingPathExtension:@"bundle"];

    id v5 = (id)v9;
  }
  id v10 = objc_alloc(NSURL);
  uint64_t v11 = [NSURL fileURLWithPath:v6 isDirectory:1];
  uint64_t v12 = (void *)[v10 initFileURLWithPath:v5 relativeToURL:v11];

  if (v12)
  {
    id v21 = 0;
    char v16 = [v12 checkResourceIsReachableAndReturnError:&v21];
    id v17 = v21;
    if (v16)
    {
      id v18 = v12;
      goto LABEL_10;
    }
  }
  else
  {
    id v17 = 0;
  }
  uint64_t v19 = v17;
  createConditionInducerError((uint64_t)"+[COConditionSession findBundleURLForConditionClass:andError:]", 524, -1, 0, @"Failed to create bundle URL (%@)", v13, v14, v15, (uint64_t)v5);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v17 = v17;
    id v18 = 0;
    *a4 = v17;
  }
  else
  {
    id v18 = 0;
  }
LABEL_10:

  return v18;
}

- (BOOL)loadBundleWithPath:(id)a3 andError:(id *)a4
{
  id v6 = a3;
  id v10 = v6;
  if (!v6)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 543, -1, 0, @"Invalid path to bundle", v7, v8, v9, v30);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v11 = [v6 stringByExpandingTildeInPath];

  if ([v11 hasPrefix:@"/"])
  {
    id v10 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v11];
    id v15 = 0;
    char v16 = 0;
    id v17 = 0;
    if (!v10)
    {
LABEL_12:
      createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 561, -1, 0, @"Failed to create bundle URL (%@)", v12, v13, v14, (uint64_t)v11);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      id v10 = v16;
      if (!a4) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  else
  {
    id v33 = 0;
    id v10 = +[COConditionSession findBundleURLForConditionClass:v11 andError:&v33];
    id v15 = v33;
    if (!v10)
    {
      createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 553, -1, 0, @"Failed to find bundle for (%@)", v19, v20, v21, (uint64_t)v11);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4)
      {
LABEL_17:
        BOOL v27 = 0;
        goto LABEL_18;
      }
LABEL_15:
      id v18 = v18;
      BOOL v27 = 0;
      *a4 = v18;
      goto LABEL_18;
    }
  }
  id v32 = v15;
  char v22 = [v10 checkResourceIsReachableAndReturnError:&v32];
  id v17 = v32;

  if ((v22 & 1) == 0)
  {
    char v16 = v10;
    goto LABEL_12;
  }
  id v31 = v17;
  BOOL v23 = [(COConditionSession *)self _setupBundleAtPath:v10 withError:&v31];
  id v18 = v31;

  if (!v23)
  {
    uint64_t v28 = createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 567, -1, 0, @"Failed to load bundle %@.", v24, v25, v26, (uint64_t)v10);

    id v18 = (id)v28;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  [(COConditionSession *)self setBundleURL:v10];
  BOOL v27 = 1;
LABEL_18:

  return v27;
}

- (BOOL)createStatusBar:(id)a3 conditionClassDescription:(id)a4 withProfileDescription:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if (v10)
  {
    char v16 = [(COConditionSession *)self statusBar];

    if (!v16)
    {
      id v17 = [COStatusBar alloc];
      id v18 = [(COConditionSession *)self notifyTeardownBeganCallback];
      uint64_t v19 = [(COConditionSession *)self statusBarPopupFinishedTeardownCallback];
      uint64_t v20 = [(COStatusBar *)v17 initWithConditionClass:v11 profile:v15 teardownBeganCb:v18 teardownCompleteCb:v19];
      [(COConditionSession *)self setStatusBar:v20];
    }
    uint64_t v21 = [(COConditionSession *)self statusBar];

    if (v21)
    {
      id v22 = 0;
      BOOL v23 = 1;
      goto LABEL_11;
    }
    uint64_t v24 = @"Failed to intialize status bar with title %@.";
    uint64_t v27 = (uint64_t)v10;
    uint64_t v25 = 601;
  }
  else
  {
    uint64_t v24 = @"Must supply an action (e.g. running or setting up) for the status bar";
    uint64_t v25 = 591;
  }
  createConditionInducerError((uint64_t)"-[COConditionSession createStatusBar:conditionClassDescription:withProfileDescription:error:]", v25, -1, 0, v24, v12, v13, v14, v27);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    id v22 = v22;
    BOOL v23 = 0;
    *a6 = v22;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_11:

  return v23;
}

- (void)freeStatusBar
{
}

+ (id)getBootSessionUUID
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(v13, 0, sizeof(v13));
  size_t v12 = 256;
  if (sysctlbyname("kern.bootsessionuuid", v13, &v12, 0, 0))
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      +[COConditionSession getBootSessionUUID];
    }
    id v10 = 0;
  }
  else
  {
    id v10 = [NSString stringWithUTF8String:v13];
  }

  return v10;
}

+ (id)loadConditionCacheWithError:(id *)a3
{
  umask(0);
  uint64_t v4 = open_dprotected_np((const char *)[@"/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist" fileSystemRepresentation], 770, 4, 0);
  if (v4 == -1)
  {
    __error();
    uint64_t v14 = __error();
    strerror(*v14);
    createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 650, -1, 0, @"Failed to open %@: %d (%s)", v15, v16, v17, @"/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = 0;
    uint64_t v13 = 0;
    id v12 = 0;
    id v11 = 0;
    id v10 = 0;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  if (flock(v4, 2))
  {
    createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 656, -1, 0, @"Failed to lock file.", v6, v7, v8, 438);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
    id v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
LABEL_14:
    id v18 = 0;
    goto LABEL_15;
  }
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v5];
  uint64_t v13 = v19;
  if (!v19)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 662, -1, 0, @"Failed to intialize file handle.", v20, v21, v22, 438);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
LABEL_13:
    id v11 = 0;
    id v12 = 0;
    goto LABEL_14;
  }
  id v10 = [v19 readDataToEndOfFile];
  if (!v10)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 668, -1, 0, @"Failed to read file.", v23, v24, v25, 438);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  id v42 = 0;
  id v11 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:&v42];
  id v26 = v42;
  isNSDictionary(v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 677, -1, v26, @"Failed to serialize property list.", v27, v28, v29, 438);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  id v12 = +[COConditionSession removeStaleConditions:v11];
  if ([v12 isEqualToDictionary:v11])
  {
    id v9 = v26;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Stale keys were detected and removed from the condition cache", buf, 2u);
    }
    id v40 = v26;
    BOOL v31 = +[COConditionSession writeConditionCache:v12 toFileDescriptor:v5 error:&v40];
    id v9 = v40;

    if (!v31)
    {
      BOOL v32 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v32) {
        +[COConditionSession loadConditionCacheWithError:](v32, v33, v34, v35, v36, v37, v38, v39);
      }
      goto LABEL_14;
    }
  }
  id v12 = v12;
  id v18 = v12;
LABEL_15:
  flock(v5, 8);
  close(v5);
  if (!a3) {
    goto LABEL_18;
  }
LABEL_16:
  if (!v18) {
    *a3 = v9;
  }
LABEL_18:

  return v18;
}

+ (BOOL)writeConditionCache:(id)a3 toFileDescriptor:(int)a4 error:(id *)a5
{
  id v21 = 0;
  uint64_t v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:100 options:0 error:&v21];
  id v11 = v21;
  if (v7)
  {
    lseek(a4, 0, 0);
    id v12 = v7;
    ssize_t v13 = write(a4, (const void *)[v12 bytes], objc_msgSend(v12, "length"));
    if (v13 == [v12 length])
    {
      BOOL v14 = 1;
      goto LABEL_9;
    }
    uint64_t v15 = @"Failed to write file.";
    uint64_t v16 = 720;
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v15 = @"Failed to serialize property list.";
    uint64_t v16 = 714;
    uint64_t v17 = v11;
  }
  id v18 = createConditionInducerError((uint64_t)"+[COConditionSession writeConditionCache:toFileDescriptor:error:]", v16, -1, v17, v15, v8, v9, v10, v20);

  if (a5)
  {
    id v11 = v18;
    BOOL v14 = 0;
    *a5 = v11;
  }
  else
  {
    BOOL v14 = 0;
    id v11 = v18;
  }
LABEL_9:

  return v14;
}

- (id)copyLoadedConditionClassName
{
  uint64_t v3 = +[COConditionSession loadConditionCacheWithError:0];
  if (v3)
  {
    uint64_t v4 = [(COConditionSession *)self bundle];
    uint64_t v5 = [v4 bundlePath];
    uint64_t v6 = [v3 objectForKey:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)removeStaleConditions:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = +[COConditionSession getBootSessionUUID];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v3 allKeys];
  uint64_t v20 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v20)
  {
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v7 = 138412802;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v11 = objc_msgSend(v3, "objectForKey:", v10, v19);
        id v12 = [v11 objectForKey:@"ConditionCacheClassBootUUID"];
        if (v12 && [v5 compare:v12 options:1])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            [v11 objectForKeyedSubscript:@"ConditionCacheClassBootUUID"];
            uint64_t v13 = v8;
            BOOL v14 = v6;
            id v15 = v3;
            v17 = uint64_t v16 = v4;
            *(_DWORD *)buf = v19;
            id v26 = v5;
            __int16 v27 = 2112;
            uint64_t v28 = v10;
            __int16 v29 = 2112;
            uint64_t v30 = v17;
            _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "The current boot sesssion is %@. Condition %@ was induced in a previous boot session (%@) and is now no longer running. Removing from cache", buf, 0x20u);

            uint64_t v4 = v16;
            id v3 = v15;
            uint64_t v6 = v14;
            uint64_t v8 = v13;
          }
        }
        else
        {
          [v4 setObject:v11 forKeyedSubscript:v10];
        }
      }
      uint64_t v20 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v20);
  }

  return v4;
}

+ (BOOL)updateConditionCache:(BOOL)a3 forCondition:(id)a4 additionalArguments:(id)a5 conditionBundle:(id)a6 error:(id *)a7
{
  BOOL v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v16 = a6;
  if (!v11)
  {
    uint64_t v32 = @"Invalid input.";
    uint64_t v33 = 773;
    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
  int v18 = [v17 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist"];

  umask(0);
  uint64_t v19 = open_dprotected_np((const char *)[@"/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist" fileSystemRepresentation], 770, 4, 0);
  if (v19 == -1)
  {
    __error();
    uint64_t v34 = __error();
    strerror(*v34);
    uint64_t v32 = @"Failed to open %@: %d (%s)";
    v71 = @"/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist";
    uint64_t v33 = 786;
LABEL_10:
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", v33, -1, 0, v32, v13, v14, v15, (uint64_t)v71);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = 0;
    if (!a7) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v20 = v19;
  id v80 = v12;
  id v81 = v16;
  v79 = a7;
  if (flock(v19, 6))
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 792, -1, 0, @"Failed to lock file.", v21, v22, v23, 438);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0;
    id v26 = 0;
    __int16 v27 = 0;
    uint64_t v28 = 0;
    id v29 = 0;
LABEL_5:
    uint64_t v30 = 0;
    LOBYTE(v31) = 0;
    goto LABEL_6;
  }
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v20];
  uint64_t v31 = (uint64_t)v36;
  if (!v36)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 798, -1, 0, @"Failed to initialize file handle.", v37, v38, v39, 438);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0;
    id v26 = 0;
    __int16 v27 = 0;
    uint64_t v28 = 0;
    id v29 = 0;
    uint64_t v30 = 0;
    goto LABEL_6;
  }
  if (!v18)
  {
    id v44 = 0;
    id v78 = 0;
LABEL_22:
    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v29)
    {
      v76 = 0;
      v77 = (void *)v31;
      goto LABEL_24;
    }
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 826, -1, 0, @"Failed to intialize dictionary.", v48, v49, v50, 438);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    __int16 v27 = 0;
    uint64_t v28 = 0;
    id v26 = (void *)v31;
LABEL_50:
    uint64_t v30 = 0;
    LOBYTE(v31) = 0;
    uint64_t v25 = v78;
    goto LABEL_6;
  }
  id v29 = [v36 readDataToEndOfFile];
  if (!v29)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 805, -1, 0, @"Failed to read file.", v40, v41, v42, 438);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0;
    __int16 v27 = 0;
    uint64_t v28 = 0;
    id v26 = (void *)v31;
    goto LABEL_5;
  }
  id v84 = 0;
  uint64_t v43 = [MEMORY[0x263F08AC0] propertyListWithData:v29 options:0 format:0 error:&v84];
  id v44 = v84;
  id v78 = v29;
  if (!v43) {
    goto LABEL_22;
  }
  id v29 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v43];
  if (!v29)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 817, -1, 0, @"Failed to intialize dictionary.", v45, v46, v47, 438);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v28 = 0;
    id v26 = (void *)v31;
    __int16 v27 = (void *)v43;
    goto LABEL_50;
  }
  v76 = (void *)v43;
  v77 = (void *)v31;
LABEL_24:
  uint64_t v30 = [v11 identifierName];
  if (!v30)
  {
    [v16 bundlePath];
    v51 = id v73 = v44;
    uint64_t v52 = [v51 lastPathComponent];
    uint64_t v30 = [v52 stringByDeletingPathExtension];

    id v44 = v73;
  }
  if (+[COConditionSession conditionIsBundledWithFramework:v30])
  {
    id v83 = v44;
    +[COConditionSession prepareInfoDictForBuiltInCondition:v30 error:&v83];
    v54 = v53 = v44;
    id v72 = v83;

    if (v54) {
      char v74 = [v11 persistsAfterRebootFromDict:v54];
    }
    else {
      char v74 = 1;
    }

    id v44 = v72;
  }
  else
  {
    char v74 = [v11 persistsAfterReboot];
  }
  uint64_t v31 = +[COConditionSession removeStaleConditions:v29];

  if (v10)
  {
    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (!v29)
    {
      createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 851, -1, 0, @"Failed to initialize dictionary.", v55, v56, v57, 438);
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v28 = (void *)v31;
      LOBYTE(v31) = 0;
      id v26 = v77;
      uint64_t v25 = v78;
      __int16 v27 = v76;
      goto LABEL_6;
    }
    id v58 = (void *)v31;
    id v59 = (objc_class *)objc_opt_class();
    id v60 = NSStringFromClass(v59);
    [v29 setObject:v60 forKeyedSubscript:@"ConditionCacheClassName"];

    if ((v74 & 1) == 0)
    {
      v61 = +[COConditionSession getBootSessionUUID];
      [v29 setObject:v61 forKeyedSubscript:@"ConditionCacheClassBootUUID"];
    }
    if (v12) {
      [v29 setObject:v12 forKeyedSubscript:@"ConditionCacheClassArguments"];
    }
    uint64_t v31 = (uint64_t)v58;
    [v58 setObject:v29 forKeyedSubscript:v30];
  }
  else
  {
    [(id)v31 removeObjectForKey:v30];
    id v29 = 0;
  }
  id v82 = v44;
  v75 = (void *)v31;
  BOOL v62 = +[COConditionSession writeConditionCache:v31 toFileDescriptor:v20 error:&v82];
  id v24 = v82;

  if (v62)
  {
    LOBYTE(v31) = 1;
  }
  else
  {
    BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v63) {
      +[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:](v63, v64, v65, v66, v67, v68, v69, v70);
    }
    LOBYTE(v31) = 0;
  }
  id v26 = v77;
  uint64_t v25 = v78;
  uint64_t v28 = v75;
  __int16 v27 = v76;
LABEL_6:
  flock(v20, 8);
  close(v20);

  id v12 = v80;
  id v16 = v81;
  a7 = v79;
  if (!v79) {
    goto LABEL_13;
  }
LABEL_11:
  if ((v31 & 1) == 0) {
    *a7 = v24;
  }
LABEL_13:

  return v31;
}

+ (id)prepareInfoDictForBuiltInCondition:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = +[COConditionSession loadInformationDict];
  if (v9)
  {
    BOOL v10 = [NSString stringWithUTF8String:"SupportedConditionData"];
    id v11 = [v9 objectForKey:v10];

    if (!v11)
    {
      createConditionInducerError((uint64_t)"+[COConditionSession prepareInfoDictForBuiltInCondition:error:]", 907, -1, 0, @"Failed to load supported condition data from COCondtionSession", v12, v13, v14, v22);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = 0;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    id v23 = 0;
    uint64_t v15 = +[COConditionSession _loadExternalConditionBundleInfo:v5 supportedConditionData:v11 error:&v23];
    id v19 = v23;
    if (!v15)
    {
      uint64_t v20 = createConditionInducerError((uint64_t)"+[COConditionSession prepareInfoDictForBuiltInCondition:error:]", 913, -1, v19, @"Unable to load data for %@", v16, v17, v18, (uint64_t)v5);

      id v19 = (id)v20;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
  }
  else
  {
    createConditionInducerError((uint64_t)"+[COConditionSession prepareInfoDictForBuiltInCondition:error:]", 901, -1, 0, @"Failed to load Info.plist from COCondtionSession", v6, v7, v8, v22);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    uint64_t v15 = 0;
  }
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (v19) {
    *a4 = v19;
  }
LABEL_10:

  return v15;
}

+ (id)loadInformationDict
{
  BOOL v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 infoDictionary];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[COConditionSession loadInformationDict]();
    }
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)conditionsBundledWithFramework
{
  BOOL v2 = +[COConditionSession loadInformationDict];
  if (v2)
  {
    id v3 = [NSString stringWithUTF8String:"SupportedConditionsiOS"];
    uint64_t v4 = [v2 objectForKey:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[COConditionSession conditionsBundledWithFramework]();
    }
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)conditionIsBundledWithFramework:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[COConditionSession conditionsBundledWithFramework];
  uint64_t v5 = [v4 indexOfObject:v3];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (COConditionSession)initWithConditionIdentifier:(id)a3 profile:(id)a4
{
  return [(COConditionSession *)self initWithConditionIdentifier:a3 profile:a4 additionalArgs:0];
}

- (COConditionSession)initWithConditionIdentifier:(id)a3 profile:(id)a4 additionalArgs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)COConditionSession;
  uint64_t v12 = [(COConditionSession *)&v36 init];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v12->_selectedCondition, a3);
  objc_storeStrong((id *)&v13->_selectedProfile, a4);
  if (!v9 || !v10)
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22) {
      -[COConditionSession initWithConditionIdentifier:profile:additionalArgs:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_10;
  }
  if (([v9 containsString:@"/"] & 1) == 0
    && ![v10 containsString:@"/"])
  {
    objc_storeStrong((id *)&v13->_additionalArguments, a5);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.ConditionInducerFramework.setUp", 0);
    setUpQueue = v13->_setUpQueue;
    v13->_setUpQueue = (OS_dispatch_queue *)v31;

    dispatch_queue_t v33 = dispatch_queue_create("com.apple.ConditionInducerFramework.tearDown", 0);
    tearDownQueue = v13->_tearDownQueue;
    v13->_tearDownQueue = (OS_dispatch_queue *)v33;

LABEL_12:
    uint64_t v30 = v13;
    goto LABEL_13;
  }
  BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v14) {
    -[COConditionSession initWithConditionIdentifier:profile:additionalArgs:](v14, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_10:
  uint64_t v30 = 0;
LABEL_13:

  return v30;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  __int16 v2 = 2114;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to tear down condition: %{public}@ (%{public}@)", v1, 0x16u);
}

void __29__COConditionSession_dealloc__block_invoke(uint64_t a1, void *a2)
{
}

+ (id)listAvailableConditions
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = [NSString stringWithUTF8String:"/AppleInternal/Tests/com.apple.ConditionInducer"];
  uint64_t v4 = +[COConditionSession getBundleURLsAtPath:v3];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v25 = &v43;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v11 = +[COConditionSession bundleToDict:v9];
        if (v11)
        {
          uint64_t v12 = [v9 path];
          [v10 setObject:v12 forKey:@"ConditionCacheBundlePath"];

          [v10 addEntriesFromDictionary:v11];
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          +[COConditionSession listAvailableConditions];
        }
        objc_msgSend(v2, "addObject:", v10, v25);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v6);
  }

  uint64_t v13 = +[COConditionSession conditionsBundledWithFramework];
  BOOL v14 = v13;
  if (v13)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      uint64_t v18 = &_os_log_internal;
      uint64_t v26 = 138412546;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          id v28 = 0;
          uint64_t v21 = +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", v20, &v28, v26);
          id v22 = v28;
          if (v22)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v22 description];
              *(_DWORD *)buf = v26;
              uint64_t v38 = v20;
              __int16 v39 = 2112;
              uint64_t v40 = v23;
              _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Encountered an error loading externally-supported condition %@ from framework: %@", buf, 0x16u);

              uint64_t v18 = &_os_log_internal;
            }
          }
          else
          {
            [v2 addObject:v21];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v16);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[COConditionSession listAvailableConditions]();
  }

  return v2;
}

+ (id)getActiveConditions
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    +[COConditionSession getActiveConditions]();
  }
  id v2 = +[COConditionSession loadConditionCacheWithError:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    +[COConditionSession getActiveConditions]();
  }

  return v2;
}

+ (void)logSignpostWithConditionStates
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[COConditionSession getActiveConditions];
  if (v2) {
    uint64_t v3 = (void *)v2;
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x263EFFA78];
  }
  id v4 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cltm"];
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x263EFFA40]);
  }
  uint64_t v5 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v5))
  {
    uint64_t v6 = [v4 dictionaryRepresentation];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConditionsStateSignpost", "Active Conditions: %{public}@\ncltm settings: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)hasActiveCondition
{
  uint64_t v2 = +[COConditionSession getActiveConditions];
  uint64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)startConditionWithCallback:(id)a3
{
  return [(COConditionSession *)self startConditionWithCallback:a3 teardownStartedCallback:0 teardownFinishedCallback:0];
}

- (BOOL)startConditionWithCallback:(id)a3 andStatusBarNotificationCallback:(id)a4
{
  return [(COConditionSession *)self startConditionWithCallback:a3 teardownStartedCallback:0 teardownFinishedCallback:a4];
}

- (BOOL)startConditionWithCallback:(id)a3 teardownStartedCallback:(id)a4 teardownFinishedCallback:(id)a5
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v81 = (void (**)(id, void))a3;
  id v79 = a4;
  id v80 = a5;
  uint64_t v92 = 0;
  v93[0] = &v92;
  v93[1] = 0x3032000000;
  v93[2] = __Block_byref_object_copy__0;
  v93[3] = __Block_byref_object_dispose__0;
  id v94 = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__0;
  v90[4] = __Block_byref_object_dispose__0;
  id v91 = 0;
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __98__COConditionSession_startConditionWithCallback_teardownStartedCallback_teardownFinishedCallback___block_invoke;
  v89[3] = &unk_264935B50;
  v89[4] = self;
  v89[5] = v90;
  v89[6] = &v92;
  dispatch_block_t block = (dispatch_block_t)MEMORY[0x230F76E70](v89);
  uint64_t v8 = (void *)MEMORY[0x230F76E70](v80);
  id statusBarPopupFinishedTeardownCallback = self->_statusBarPopupFinishedTeardownCallback;
  self->_id statusBarPopupFinishedTeardownCallback = v8;

  id v10 = (void *)MEMORY[0x230F76E70](v79);
  id notifyTeardownBeganCallback = self->_notifyTeardownBeganCallback;
  self->_id notifyTeardownBeganCallback = v10;

  uint64_t v12 = [(COConditionSession *)self selectedCondition];
  LOBYTE(a4) = +[COConditionSession conditionIsBundledWithFramework:v12];

  if ((a4 & 1) == 0)
  {
    uint64_t v16 = [(COConditionSession *)self selectedCondition];
    uint64_t v17 = (id *)(v93[0] + 40);
    id v88 = *(id *)(v93[0] + 40);
    BOOL v18 = [(COConditionSession *)self loadBundleWithPath:v16 andError:&v88];
    objc_storeStrong(v17, v88);

    if (v18)
    {
      uint64_t v19 = [(COConditionSession *)self selectedProfile];
      uint64_t v20 = (id *)(v93[0] + 40);
      id v87 = *(id *)(v93[0] + 40);
      BOOL v21 = [(COConditionSession *)self loadProfileForBundle:v19 withError:&v87];
      objc_storeStrong(v20, v87);

      id v78 = 0;
      if (v21) {
        goto LABEL_25;
      }
LABEL_41:
      BOOL v69 = 0;
      goto LABEL_42;
    }
LABEL_9:
    id v78 = 0;
    goto LABEL_41;
  }
  uint64_t v13 = [(COConditionSession *)self selectedCondition];
  BOOL v14 = (id *)(v93[0] + 40);
  obuint64_t j = *(id *)(v93[0] + 40);
  id v78 = +[COConditionSession prepareInfoDictForBuiltInCondition:v13 error:&obj];
  objc_storeStrong(v14, obj);

  if (!v78)
  {
    id v22 = *(void **)(v93[0] + 40);
    uint64_t v23 = [(COConditionSession *)self selectedCondition];
    uint64_t v27 = createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]", 1124, -1, v22, @"Unable to load data for %@", v24, v25, v26, (uint64_t)v23);
    id v28 = *(void **)(v93[0] + 40);
    *(void *)(v93[0] + 40) = v27;

    goto LABEL_9;
  }
  uint64_t v15 = [v78 valueForKey:@"ConditionIsDestructive"];

  if (v15)
  {
    [(COConditionSession *)self setWarning:@"WARNING! - This condition should only be used on test devices as it can change your data"];
  }
  else
  {
    long long v29 = [(COConditionSession *)self warning];
    BOOL v30 = [v29 length] == 0;

    if (v30) {
      [(COConditionSession *)self setWarning:0];
    }
  }
  id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(COConditionSession *)self setClassDict:v31];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v32 = [v78 objectForKey:@"ConditionBundleDict"];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v82 objects:v101 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v83;
    long long v35 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v83 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(NSString **)(*((void *)&v82 + 1) + 8 * i);
        Class v38 = NSClassFromString(v37);
        if (v38)
        {
          __int16 v39 = [(COConditionSession *)self classDict];
          uint64_t v40 = [(objc_class *)v38 description];
          [v39 setValue:v40 forKey:v37];
        }
        else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          -[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:](v99, (uint64_t)v37, &v100);
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v82 objects:v101 count:16];
    }
    while (v33);
  }

  uint64_t v41 = [(COConditionSession *)self selectedProfile];
  uint64_t v42 = NSClassFromString(v41);

  if (!v42)
  {
    id v60 = [(COConditionSession *)self selectedProfile];
    uint64_t v64 = createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]", 1149, -1, 0, @"Failed to load framework class %@", v61, v62, v63, (uint64_t)v60);
    uint64_t v65 = *(void **)(v93[0] + 40);
    *(void *)(v93[0] + 40) = v64;

    goto LABEL_41;
  }
  id v43 = objc_alloc_init(v42);
  [(COConditionSession *)self setCondition:v43];

  id v44 = [(COConditionSession *)self condition];
  BOOL v45 = v44 == 0;

  if (v45)
  {
    uint64_t v70 = [(COConditionSession *)self selectedProfile];
    uint64_t v74 = createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]", 1156, -1, 0, @"Failed to instantiate framework class %@", v71, v72, v73, (uint64_t)v70);
    v75 = *(void **)(v93[0] + 40);
    *(void *)(v93[0] + 40) = v74;

    goto LABEL_41;
  }
LABEL_25:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Running Setup", buf, 2u);
  }
  uint64_t v46 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v46))
  {
    uint64_t v47 = [(COConditionSession *)self selectedCondition];
    uint64_t v48 = [(COConditionSession *)self selectedProfile];
    *(_DWORD *)buf = 138543618;
    v96 = v47;
    __int16 v97 = 2114;
    v98 = v48;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v46, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "induce-setup", "%{public}@ %{public}@", buf, 0x16u);
  }
  uint64_t v49 = [(COConditionSession *)self setUpQueue];
  dispatch_sync(v49, block);

  uint64_t v50 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v50))
  {
    v51 = [(COConditionSession *)self selectedCondition];
    uint64_t v52 = [(COConditionSession *)self selectedProfile];
    *(_DWORD *)buf = 138543618;
    v96 = v51;
    __int16 v97 = 2114;
    v98 = v52;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "induce-setup", "%{public}@ %{public}@", buf, 0x16u);
  }
  if (*(void *)(v93[0] + 40))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]((uint64_t)v93, v53, v54, v55, v56, v57, v58, v59);
    }
    goto LABEL_41;
  }
  uint64_t v66 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v66))
  {
    uint64_t v67 = [(COConditionSession *)self selectedCondition];
    uint64_t v68 = [(COConditionSession *)self selectedProfile];
    *(_DWORD *)buf = 138543618;
    v96 = v67;
    __int16 v97 = 2114;
    v98 = v68;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v66, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "induce", "%{public}@ %{public}@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setup Complete... Condition Running", buf, 2u);
  }
  BOOL v69 = 1;
LABEL_42:
  if (v81) {
    v81[2](v81, *(void *)(v93[0] + 40));
  }

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(&v92, 8);

  return v69;
}

void __98__COConditionSession_startConditionWithCallback_teardownStartedCallback_teardownFinishedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copyLoadedConditionClassName];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v21 = [v5 selectedCondition];
    uint64_t v9 = createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]_block_invoke", 1103, -1, 0, @"Condition is already running: %@ %@", v6, v7, v8, (uint64_t)v21);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v12 + 40);
    char v13 = [v5 setUpWithError:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if ((v13 & 1) == 0)
    {
      uint64_t v17 = createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]_block_invoke", 1105, -1, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"Setup failed.", v14, v15, v16, v20);
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
}

- (BOOL)stopConditionWithCallback:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = +[COConditionSession getActiveConditions];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Tearing down active condition before we destroy the object: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  uint64_t v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v6 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v6))
  {
    uint64_t v7 = [(COConditionSession *)self selectedCondition];
    uint64_t v8 = [(COConditionSession *)self selectedProfile];
    *(_DWORD *)uint64_t v19 = 138543618;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "induce-teardown", "%{public}@ %{public}@", v19, 0x16u);
  }
  uint64_t v9 = [(COConditionSession *)self tearDownQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__COConditionSession_stopConditionWithCallback___block_invoke;
  v18[3] = &unk_264935BC8;
  v18[4] = self;
  v18[5] = &buf;
  dispatch_sync(v9, v18);

  uint64_t v10 = [(COConditionSession *)self setUpQueue];
  dispatch_sync(v10, &__block_literal_global_1);

  uint64_t v11 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = [(COConditionSession *)self selectedCondition];
    char v13 = [(COConditionSession *)self selectedProfile];
    *(_DWORD *)uint64_t v19 = 138543618;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    id v22 = v13;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "induce-teardown", "%{public}@ %{public}@", v19, 0x16u);
  }
  uint64_t v14 = _copySignpostLowSeverityLogHandle();
  if (os_signpost_enabled(v14))
  {
    uint64_t v15 = [(COConditionSession *)self selectedCondition];
    uint64_t v16 = [(COConditionSession *)self selectedProfile];
    *(_DWORD *)uint64_t v19 = 138543618;
    uint64_t v20 = v15;
    __int16 v21 = 2114;
    id v22 = v16;
    _os_signpost_emit_with_name_impl(&dword_22CE75000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "induce", "%{public}@ %{public}@", v19, 0x16u);
  }
  if (v4 && *(void *)(*((void *)&buf + 1) + 40)) {
    v4[2](v4);
  }
  _Block_object_dispose(&buf, 8);

  return 1;
}

void __48__COConditionSession_stopConditionWithCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  char v4 = [v2 tearDownWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    int v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) code];
    uint64_t v9 = createConditionInducerError((uint64_t)"-[COConditionSession stopConditionWithCallback:]_block_invoke", 1198, v5, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"Teardown failed.", v6, v7, v8, v12);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

+ (BOOL)tearDownAllConditionsWithErrors:(id *)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v36 = +[COConditionSession getActiveConditions];
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = [v36 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v3)
  {

    char v4 = 1;
    goto LABEL_25;
  }
  uint64_t v35 = *(void *)v47;
  char v4 = 1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v47 != v35) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v46 + 1) + 8 * i);
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x3032000000;
      id v43 = __Block_byref_object_copy__0;
      id v44 = __Block_byref_object_dispose__0;
      id v45 = 0;
      uint64_t v7 = [v36 objectForKey:v6];
      uint64_t v8 = [v7 objectForKey:@"ConditionCacheClassName"];
      uint64_t v12 = [v7 objectForKey:@"ConditionCacheClassArguments"];
      if (!v8)
      {
        uint64_t v17 = createConditionInducerError((uint64_t)"+[COConditionSession tearDownAllConditionsWithErrors:]", 1265, -1, 0, @"Missing subclass info for %@, skipping teardown", v9, v10, v11, v6);
        uint64_t v18 = (void *)v41[5];
        v41[5] = v17;

        [v34 setObject:v41[5] forKey:v6];
        char v4 = 0;
        goto LABEL_20;
      }
      uint64_t v16 = [[COConditionSession alloc] initWithConditionIdentifier:v6 profile:v8 additionalArgs:v12];
      if (!v16)
      {
        uint64_t v19 = createConditionInducerError((uint64_t)"+[COConditionSession tearDownAllConditionsWithErrors:]", 1235, -1, 0, @"Failed to instantiate condition session for conditionKey:%@ profile:%@ args:%@", v13, v14, v15, v6);
        uint64_t v20 = (void *)v41[5];
        v41[5] = v19;

        [v34 setObject:v41[5] forKey:v6];
LABEL_18:
        char v4 = 0;
        goto LABEL_19;
      }
      if (+[COConditionSession conditionIsBundledWithFramework:v6])
      {
LABEL_9:
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __54__COConditionSession_tearDownAllConditionsWithErrors___block_invoke;
        v37[3] = &unk_264935D18;
        v37[4] = v6;
        v37[5] = &v40;
        [(COConditionSession *)v16 stopConditionWithCallback:v37];
        goto LABEL_16;
      }
      __int16 v21 = (id *)(v41 + 5);
      id v39 = (id)v41[5];
      BOOL v22 = [(COConditionSession *)v16 loadBundleWithPath:v6 andError:&v39];
      objc_storeStrong(v21, v39);
      if (v22)
      {
        uint64_t v26 = (id *)(v41 + 5);
        id v38 = (id)v41[5];
        BOOL v27 = [(COConditionSession *)v16 loadProfileForBundle:v8 withError:&v38];
        objc_storeStrong(v26, v38);
        if (v27) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v28 = createConditionInducerError((uint64_t)"+[COConditionSession tearDownAllConditionsWithErrors:]", 1247, -1, 0, @"Failed to load bundle", v23, v24, v25, v31);
        [v34 setObject:v28 forKey:v6];

        char v4 = 0;
      }
LABEL_16:
      uint64_t v29 = v41[5];
      if (v29)
      {
        [v34 setObject:v29 forKey:v6];
        goto LABEL_18;
      }
LABEL_19:

LABEL_20:
      _Block_object_dispose(&v40, 8);
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v3);

  if (!((a3 == 0) | v4 & 1))
  {
    char v4 = 0;
    *a3 = v34;
  }
LABEL_25:

  return v4 & 1;
}

void __54__COConditionSession_tearDownAllConditionsWithErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if ([v4 code] == -10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "No need to tear down %@ because it's not running", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (NSString)selectedCondition
{
  return self->_selectedCondition;
}

- (NSString)selectedProfile
{
  return self->_selectedProfile;
}

- (NSArray)additionalArguments
{
  return self->_additionalArguments;
}

- (COCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (COConditionBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSMutableDictionary)classDict
{
  return self->_classDict;
}

- (void)setClassDict:(id)a3
{
}

- (NSString)warning
{
  return self->_warning;
}

- (void)setWarning:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (COStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
}

- (OS_dispatch_queue)setUpQueue
{
  return self->_setUpQueue;
}

- (void)setSetUpQueue:(id)a3
{
}

- (OS_dispatch_queue)tearDownQueue
{
  return self->_tearDownQueue;
}

- (void)setTearDownQueue:(id)a3
{
}

- (id)statusBarPopupFinishedTeardownCallback
{
  return self->_statusBarPopupFinishedTeardownCallback;
}

- (void)setStatusBarPopupFinishedTeardownCallback:(id)a3
{
}

- (id)notifyTeardownBeganCallback
{
  return self->_notifyTeardownBeganCallback;
}

- (void)setNotifyTeardownBeganCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyTeardownBeganCallback, 0);
  objc_storeStrong(&self->_statusBarPopupFinishedTeardownCallback, 0);
  objc_storeStrong((id *)&self->_tearDownQueue, 0);
  objc_storeStrong((id *)&self->_setUpQueue, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_warning, 0);
  objc_storeStrong((id *)&self->_classDict, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_additionalArguments, 0);
  objc_storeStrong((id *)&self->_selectedProfile, 0);

  objc_storeStrong((id *)&self->_selectedCondition, 0);
}

- (void)userFriendlyNameForSelectedCondition
{
  v1 = [a1 selectedCondition];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "Unable to find a class named %@", v3, v4, v5, v6, v7);
}

- (void)userFriendlyNameForSelectedProfile
{
  v1 = [a1 selectedProfile];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "Unable to find a class named %@", v3, v4, v5, v6, v7);
}

+ (void)bundleToDict:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)bundleToDict:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "Failed to intialize bundle for %@.", v3, v4, v5, v6, v7);
}

+ (void)bundleToDict:.cold.3()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v1, "No Principal class set for %@?? Bad!", v2, v3, v4, v5, 2u);
}

+ (void)bundleToDict:(void *)a1 .cold.4(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 path];
  uint64_t v4 = [a2 description];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to load bundle for %@, got error %@", (uint8_t *)&v5, 0x16u);
}

+ (void)getBootSessionUUID
{
}

+ (void)loadConditionCacheWithError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)updateConditionCache:(uint64_t)a3 forCondition:(uint64_t)a4 additionalArguments:(uint64_t)a5 conditionBundle:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)loadInformationDict
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v1, "Failed to load Info bundle for %{public}@", v2, v3, v4, v5, 2u);
}

+ (void)conditionsBundledWithFramework
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v1, "Failed to load Info bundle dictionary for %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithConditionIdentifier:(uint64_t)a3 profile:(uint64_t)a4 additionalArgs:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithConditionIdentifier:(uint64_t)a3 profile:(uint64_t)a4 additionalArgs:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)listAvailableConditions
{
  *(_DWORD *)long long buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to load a valid bundle for %@", buf, 0xCu);
}

+ (void)getActiveConditions
{
  *(_WORD *)id v0 = 0;
  _os_log_debug_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "GETTING Loaded Conditions", v0, 2u);
}

- (void)startConditionWithCallback:(uint64_t)a3 teardownStartedCallback:(uint64_t)a4 teardownFinishedCallback:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startConditionWithCallback:(uint8_t *)buf teardownStartedCallback:(uint64_t)a2 teardownFinishedCallback:(void *)a3 .cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)long long buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to load class from name: %@", buf, 0xCu);
}

@end