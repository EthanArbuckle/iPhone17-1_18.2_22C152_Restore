@interface ASCAppLaunchTrampolineURL
+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 localizedName:(id)a5 sourceApplication:(id)a6 topic:(id)a7;
+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 metrics:(id)a5 sourceApplication:(id)a6 topic:(id)a7;
+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7;
+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7 sourceApplication:(id)a8 topic:(id)a9;
+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7 topic:(id)a8;
@end

@implementation ASCAppLaunchTrampolineURL

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7
{
  return (id)[a1 URLWithAdamId:a3 bundleId:a4 widgetId:a5 widgetSize:a6 localizedName:a7 sourceApplication:0 topic:0];
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7 topic:(id)a8
{
  return (id)[a1 URLWithAdamId:a3 bundleId:a4 widgetId:a5 widgetSize:a6 localizedName:a7 sourceApplication:0 topic:a8];
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7 sourceApplication:(id)a8 topic:(id)a9
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v28[0] = a5;
  v27[0] = @"widgetId";
  v27[1] = @"size";
  v15 = NSNumber;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [v15 numberWithInteger:a6];
  v28[1] = v22;
  v28[2] = v21;
  v27[2] = @"targetId";
  v27[3] = @"name";
  v28[3] = v18;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  v24 = [a1 URLWithAdamId:v21 bundleId:v20 metrics:v23 sourceApplication:v17 topic:v16];

  return v24;
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 localizedName:(id)a5 sourceApplication:(id)a6 topic:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_opt_new();
  [v17 setObject:v12 forKeyedSubscript:@"targetId"];
  if (v14) {
    [v17 setObject:v14 forKeyedSubscript:@"name"];
  }
  id v18 = [a1 URLWithAdamId:v12 bundleId:v13 metrics:v17 sourceApplication:v15 topic:v16];

  return v18;
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 metrics:(id)a5 sourceApplication:(id)a6 topic:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (__CFString *)a7;
  id v15 = a5;
  +[ASCEligibility assertCurrentProcessEligibility]();
  id v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:2 error:0];

  id v17 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
  id v18 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  id v19 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];

  if (v14) {
    id v20 = v14;
  }
  else {
    id v20 = &stru_1F1E020F8;
  }
  id v21 = v20;
  if (v13)
  {
    v22 = (__CFString *)v13;
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v24 = [v23 bundleIdentifier];
    v25 = (void *)v24;
    if (v24) {
      v26 = (__CFString *)v24;
    }
    else {
      v26 = &stru_1F1E020F8;
    }
    v22 = v26;
  }
  v27 = [NSString stringWithFormat:@"x-as3-internal://launchapp?appId=%@&bundleId=%@&trampolineMetrics=%@&topic=%@&sourceApplication=%@", v11, v12, v19, v21, v22];
  v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27];

  return v28;
}

@end