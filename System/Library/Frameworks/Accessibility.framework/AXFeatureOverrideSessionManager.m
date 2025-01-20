@interface AXFeatureOverrideSessionManager
+ (AXFeatureOverrideSessionManager)sharedInstance;
- (AXFeatureOverrideSessionManager)init;
- (AXUIClient)serverClient;
- (BOOL)endOverrideSession:(id)a3 error:(id *)a4;
- (id)beginOverrideSessionEnablingOptions:(unint64_t)a3 disablingOptions:(unint64_t)a4 error:(id *)a5;
- (void)setServerClient:(id)a3;
@end

@implementation AXFeatureOverrideSessionManager

+ (AXFeatureOverrideSessionManager)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance__shared;

  return (AXFeatureOverrideSessionManager *)v2;
}

uint64_t __49__AXFeatureOverrideSessionManager_sharedInstance__block_invoke()
{
  sharedInstance__shared = objc_alloc_init(AXFeatureOverrideSessionManager);

  return MEMORY[0x270F9A758]();
}

- (AXFeatureOverrideSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXFeatureOverrideSessionManager;
  v2 = [(AXFeatureOverrideSessionManager *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getAXUIClientClass_softClass_0;
    uint64_t v13 = getAXUIClientClass_softClass_0;
    if (!getAXUIClientClass_softClass_0)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getAXUIClientClass_block_invoke_0;
      v9[3] = &unk_2641D86D8;
      v9[4] = &v10;
      __getAXUIClientClass_block_invoke_0((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [[v4 alloc] initWithIdentifier:@"AXFeatureOverrideServer" serviceBundleName:@"AXFeatureOverrideServer"];
    serverClient = v2->_serverClient;
    v2->_serverClient = (AXUIClient *)v5;
  }
  return v2;
}

- (id)beginOverrideSessionEnablingOptions:(unint64_t)a3 disablingOptions:(unint64_t)a4 error:(id *)a5
{
  v39[3] = *MEMORY[0x263EF8340];
  v9 = [AXFeatureOverrideSession alloc];
  uint64_t v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [(AXFeatureOverrideSession *)v9 initWithUUID:v10];

  id v12 = objc_alloc(NSDictionary);
  uint64_t v13 = [(AXFeatureOverrideSession *)v11 uuid];
  v14 = [v13 UUIDString];
  v39[0] = v14;
  v15 = [NSNumber numberWithUnsignedInteger:a3];
  v39[1] = v15;
  v16 = [NSNumber numberWithUnsignedInteger:a4];
  v39[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
  v18 = (void *)[v12 initWithObjects:v17 forKeys:&unk_26C49E900];

  serverClient = self->_serverClient;
  id v32 = 0;
  v20 = [(AXUIClient *)serverClient sendSynchronousMessage:v18 withIdentifier:1 error:&v32];
  id v21 = v32;
  if (v21)
  {
    if (!a5) {
      goto LABEL_12;
    }
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    v23 = AXLocalizedString(@"FEATURE_OVERRIDE_ERROR_APP_NOT_ENTITLED");
    v34 = v23;
    v24 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v25 = v22;
    uint64_t v26 = 1;
    goto LABEL_4;
  }
  if ([v20 count])
  {
    v27 = [v20 objectForKeyedSubscript:@"result"];
    uint64_t v28 = [v27 integerValue];

    if (v28 == 1)
    {
      if (a5)
      {
        v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F08320];
        v23 = AXLocalizedString(@"FEATURE_OVERRIDE_ERROR_OVERRIDE_IS_ALREADY_ACTIVE");
        v38 = v23;
        v24 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v25 = v29;
        uint64_t v26 = 2;
LABEL_4:
        *a5 = [v25 errorWithDomain:@"AXFeatureOverrideSessionErrorDomain" code:v26 userInfo:v24];

        a5 = 0;
      }
    }
    else if (a5)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      v23 = AXLocalizedString(@"FEATURE_OVERRIDE_ERROR_INTERNAL_ERROR");
      v36 = v23;
      v24 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v25 = v30;
      uint64_t v26 = 0;
      goto LABEL_4;
    }
  }
  else
  {
    a5 = v11;
  }
LABEL_12:

  return a5;
}

- (BOOL)endOverrideSession:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  v6 = (objc_class *)NSDictionary;
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [v7 uuid];

  uint64_t v10 = [v9 UUIDString];
  v31[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  id v12 = (void *)[v8 initWithObjects:v11 forKeys:&unk_26C49E918];

  serverClient = self->_serverClient;
  id v26 = 0;
  v14 = [(AXUIClient *)serverClient sendSynchronousMessage:v12 withIdentifier:2 error:&v26];
  id v15 = v26;
  if (v15)
  {
    if (!a4)
    {
LABEL_9:
      BOOL v23 = 0;
      goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    v17 = AXLocalizedString(@"FEATURE_OVERRIDE_ERROR_APP_NOT_ENTITLED");
    uint64_t v28 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = v16;
    uint64_t v20 = 1;
LABEL_8:
    *a4 = [v19 errorWithDomain:@"AXFeatureOverrideSessionErrorDomain" code:v20 userInfo:v18];

    goto LABEL_9;
  }
  if (![v14 count])
  {
    BOOL v23 = 1;
    goto LABEL_10;
  }
  id v21 = [v14 objectForKeyedSubscript:@"result"];
  uint64_t v22 = [v21 integerValue];

  BOOL v23 = 0;
  if (a4 && v22 == 2)
  {
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v17 = AXLocalizedString(@"FEATURE_OVERRIDE_ERROR_OVERRIDE_NOT_FOUND_FOR_UUID");
    v30 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v19 = v24;
    uint64_t v20 = 3;
    goto LABEL_8;
  }
LABEL_10:

  return v23;
}

- (AXUIClient)serverClient
{
  return self->_serverClient;
}

- (void)setServerClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end