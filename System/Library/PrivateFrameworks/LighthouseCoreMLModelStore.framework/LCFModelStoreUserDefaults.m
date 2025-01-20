@interface LCFModelStoreUserDefaults
+ (id)lastTrainedDate;
+ (void)setLastTrainedDate:(id)a3;
@end

@implementation LCFModelStoreUserDefaults

+ (id)lastTrainedDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.LighthouseCoreMLModelStore"];
  v3 = [v2 objectForKey:@"lastTrained"];

  return v3;
}

+ (void)setLastTrainedDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.LighthouseCoreMLModelStore"];
  [v5 setObject:v4 forKey:@"lastTrained"];
}

@end