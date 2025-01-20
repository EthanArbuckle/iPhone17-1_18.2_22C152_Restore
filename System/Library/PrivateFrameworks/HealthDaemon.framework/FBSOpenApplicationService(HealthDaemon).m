@interface FBSOpenApplicationService(HealthDaemon)
+ (uint64_t)hd_canOpenApplication:()HealthDaemon reason:;
+ (uint64_t)hd_defaultService;
+ (void)hd_openApplication:()HealthDaemon optionsDictionary:completion:;
- (void)hd_openApplication:()HealthDaemon optionsDictionary:completion:;
@end

@implementation FBSOpenApplicationService(HealthDaemon)

+ (uint64_t)hd_defaultService
{
  return [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
}

+ (void)hd_openApplication:()HealthDaemon optionsDictionary:completion:
{
  id v16 = a3;
  id v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(a1, "hd_defaultService");
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "hd_openApplication:optionsDictionary:completion:", v16, v8, v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = objc_msgSend(v12, "hk_error:format:", 100, @"Missing default %@", v14);
    v9[2](v9, 0, v15);
  }
}

- (void)hd_openApplication:()HealthDaemon optionsDictionary:completion:
{
  id v8 = (void *)MEMORY[0x1E4F629C8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 optionsWithDictionary:a4];
  [a1 openApplication:v10 withOptions:v11 completion:v9];
}

+ (uint64_t)hd_canOpenApplication:()HealthDaemon reason:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "hd_defaultService");
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 canOpenApplication:v6 reason:a4];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

@end