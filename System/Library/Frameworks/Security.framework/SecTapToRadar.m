@interface SecTapToRadar
+ (BOOL)askUserIfTTR:(id)a3;
+ (BOOL)isRateLimited:(id)a3;
+ (id)keyname:(id)a3;
+ (void)disableTTRsEntirely;
+ (void)triggerTapToRadar:(id)a3;
- (BOOL)isRateLimited;
- (NSString)alert;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)radarDescription;
- (NSString)radarnumber;
- (NSString)reason;
- (OS_dispatch_queue)queue;
- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5;
- (void)clearRetryTimestamp;
- (void)setAlert:(id)a3;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarnumber:(id)a3;
- (void)setReason:(id)a3;
- (void)trigger;
- (void)updateRetryTimestamp;
@end

@implementation SecTapToRadar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_radarnumber, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);

  objc_storeStrong((id *)&self->_componentID, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRadarnumber:(id)a3
{
}

- (NSString)radarnumber
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlert:(id)a3
{
}

- (NSString)alert
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentID:(id)a3
{
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)trigger
{
  v3 = [(SecTapToRadar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SecTapToRadar_trigger__block_invoke;
  block[3] = &unk_1E5484B08;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __24__SecTapToRadar_trigger__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x18C12E850]();
  if (os_variant_allows_internal_security_policies())
  {
    if ([(id)objc_opt_class() isRateLimited:*(void *)(a1 + 32)])
    {
      v3 = secLogObjForScope("SecTTR");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = [*(id *)(a1 + 32) alert];
        int v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "Not showing ttr due to ratelimiting: %@", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      if ([(id)objc_opt_class() askUserIfTTR:*(void *)(a1 + 32)]) {
        [(id)objc_opt_class() triggerTapToRadar:*(void *)(a1 + 32)];
      }
      [*(id *)(a1 + 32) updateRetryTimestamp];
    }
  }
}

- (void)clearRetryTimestamp
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.security"];
  v3 = [(id)objc_opt_class() keyname:self];
  [v4 removeObjectForKey:v3];
}

- (void)updateRetryTimestamp
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.security"];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v3 dateByAddingTimeInterval:86400.0];
  int v5 = [(id)objc_opt_class() keyname:self];
  [v6 setObject:v4 forKey:v5];
}

- (BOOL)isRateLimited
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.security"];
  id v4 = [(id)objc_opt_class() keyname:self];
  int v5 = [v3 valueForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v7 = [v5 compare:v6] != -1;
  }
  else
  {
    [v3 removeObjectForKey:v4];
    BOOL v7 = 0;
  }

  return v7;
}

- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SecTapToRadar;
  v12 = [(SecTapToRadar *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_alert, a3);
    objc_storeStrong((id *)&v13->_radarDescription, a4);
    objc_storeStrong((id *)&v13->_radarnumber, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.security.diagnostic-queue", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = v13->_queue;
    v17 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v16, v17);

    componentName = v13->_componentName;
    v13->_componentName = (NSString *)@"Security";

    componentVersion = v13->_componentVersion;
    v13->_componentVersion = (NSString *)@"all";

    componentID = v13->_componentID;
    v13->_componentID = (NSString *)@"606179";

    v21 = v13;
  }

  return v13;
}

+ (BOOL)askUserIfTTR:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1D9D0];
  v16[0] = *MEMORY[0x1E4F1D9E0];
  v16[1] = v3;
  v17[0] = @"Tap-To-Radar";
  v17[1] = @"Go away";
  v16[2] = *MEMORY[0x1E4F1D9A8];
  id v4 = a3;
  int v5 = [v4 alert];
  v17[2] = v5;
  v16[3] = *MEMORY[0x1E4F1D990];
  id v6 = [v4 componentName];

  v17[3] = v6;
  CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  SInt32 error = 0;
  v8 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v7);
  if (v8)
  {
    id v9 = v8;
    *(void *)responseFlags = 0;
    CFUserNotificationReceiveResponse(v8, 180.0, (CFOptionFlags *)responseFlags);
    BOOL v10 = (responseFlags[0] & 3) == 0;
    CFRelease(v9);
  }
  else
  {
    id v11 = secLogObjForScope("SecTTR");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [NSNumber numberWithInt:error];
      *(_DWORD *)responseFlags = 138412290;
      *(void *)&responseFlags[4] = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create notification error %@", responseFlags, 0xCu);
    }
    BOOL v10 = 0;
  }

  return v10;
}

+ (void)triggerTapToRadar:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = secLogObjForScope("secttr");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 alert];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "Triggering TTR: %@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = [v3 queue];
  dispatch_assert_queue_V2(v6);

  if (triggerTapToRadar__onceToken != -1) {
    dispatch_once(&triggerTapToRadar__onceToken, &__block_literal_global);
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  CFDictionaryRef v7 = (void *)getLSApplicationWorkspaceClass_softClass;
  uint64_t v36 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v38 = __getLSApplicationWorkspaceClass_block_invoke;
    v39 = &unk_1E5484FA0;
    v40 = &v33;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&buf);
    CFDictionaryRef v7 = (void *)v34[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v33, 8);
  if (v8)
  {
    v29 = v8;
    id v9 = NSString;
    BOOL v10 = [v3 alert];
    id v11 = [v3 radarnumber];
    v32 = [v9 stringWithFormat:@"SFA: %@ - %@", v10, v11];

    v30 = [v32 stringByAddingPercentEncodingWithAllowedCharacters:triggerTapToRadar__queryComponent];
    v12 = NSString;
    v13 = [v3 radarDescription];
    uint64_t v14 = [v3 reason];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = &stru_1ED84D0B0;
    }
    v17 = [v3 radarnumber];
    v31 = [v12 stringWithFormat:@"%@\n%@\nRelated radar: rdar://%@", v13, v16, v17];

    v18 = [v31 stringByAddingPercentEncodingWithAllowedCharacters:triggerTapToRadar__queryComponent];
    v19 = NSString;
    v20 = [v3 componentName];
    v21 = [v20 stringByAddingPercentEncodingWithAllowedCharacters:triggerTapToRadar__queryComponent];
    v22 = [v3 componentVersion];
    objc_super v23 = [v22 stringByAddingPercentEncodingWithAllowedCharacters:triggerTapToRadar__queryComponent];
    v24 = [v3 componentID];
    v25 = [v24 stringByAddingPercentEncodingWithAllowedCharacters:triggerTapToRadar__queryComponent];
    v26 = [v19 stringWithFormat:@"tap-to-radar://new?Title=%@&ComponentName=%@&ComponentVersion=%@&Reproducibility=Not%%20Applicable&ComponentID=%@&Classification=Crash/Hang/Data%%20Loss&Description=%@", v30, v21, v23, v25, v18];

    v27 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
    v28 = [v29 defaultWorkspace];
    [v28 openURL:v27 configuration:0 completionHandler:&__block_literal_global_41];
  }
}

uint64_t __35__SecTapToRadar_triggerTapToRadar___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v1 = (void *)triggerTapToRadar__queryComponent;
  triggerTapToRadar__queryComponent = (uint64_t)v0;

  v2 = (void *)triggerTapToRadar__queryComponent;
  id v3 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  id v4 = (void *)triggerTapToRadar__queryComponent;

  return [v4 removeCharactersInString:@"&"];
}

+ (void)disableTTRsEntirely
{
  SecTTRDisabled = 1;
}

+ (BOOL)isRateLimited:(id)a3
{
  if (SecTTRDisabled) {
    return 1;
  }
  else {
    return [a3 isRateLimited];
  }
}

+ (id)keyname:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 radarnumber];
  int v5 = [v3 stringWithFormat:@"%@-%@", @"NextTTRDate", v4];

  return v5;
}

@end