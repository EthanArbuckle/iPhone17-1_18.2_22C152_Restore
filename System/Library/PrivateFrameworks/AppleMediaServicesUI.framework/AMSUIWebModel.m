@interface AMSUIWebModel
+ (CGSize)windowSizeFromJSObject:(id)a3 key:(id)a4;
+ (CGSize)windowSizeFromPageModel:(id)a3;
+ (id)backgroundColorFromPageModel:(id)a3;
+ (id)impressionEventFromPageModel:(id)a3 context:(id)a4;
+ (id)navigationBarFromPageModel:(id)a3 context:(id)a4;
+ (id)pageModelFromJSObject:(id)a3 context:(id)a4;
@end

@implementation AMSUIWebModel

+ (id)backgroundColorFromPageModel:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"backgroundColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)impressionEventFromPageModel:(id)a3 context:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:@"impressionEvent"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7) {
    v8 = [[AMSUIWebMetricsEvent alloc] initWithJSObject:v7 context:v5];
  }
  else {
    v8 = 0;
  }

  return v8;
}

+ (id)navigationBarFromPageModel:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [AMSUIWebNavigationBarModel alloc];
  v8 = [v6 objectForKeyedSubscript:@"navigationBar"];

  v9 = [(AMSUIWebNavigationBarModel *)v7 initWithJSObject:v8 context:v5];
  return v9;
}

+ (id)pageModelFromJSObject:(id)a3 context:(id)a4
{
  v24[8] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"modelClass"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v23[0] = @"AMSCameraReaderPageModel";
  v24[0] = objc_opt_class();
  v23[1] = @"AMSDeviceDiagnosticsPageModel";
  v24[1] = objc_opt_class();
  v23[2] = @"AMSDynamicPageModel";
  v24[2] = objc_opt_class();
  v23[3] = @"AMSErrorPageModel";
  v24[3] = objc_opt_class();
  v23[4] = @"AMSLoadingPageModel";
  v24[4] = objc_opt_class();
  v23[5] = @"AMSSafariPageModel";
  v24[5] = objc_opt_class();
  v23[6] = @"AMSRoutePageModel";
  v24[6] = objc_opt_class();
  v23[7] = @"AMSWebPageModel";
  v24[7] = objc_opt_class();
  v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:8];
  v10 = (objc_class *)(id)[v9 objectForKeyedSubscript:v8];
  if (!v10 || (v11 = (void *)[[v10 alloc] initWithJSObject:v5 context:v6]) == 0)
  {
    v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v15 = [v6 logKey];
      int v17 = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid page model: %{public}@", (uint8_t *)&v17, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

+ (CGSize)windowSizeFromPageModel:(id)a3
{
  [a1 windowSizeFromJSObject:a3 key:@"windowSize"];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)windowSizeFromJSObject:(id)a3 key:(id)a4
{
  double v4 = [a3 objectForKeyedSubscript:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  double v6 = 0.0;
  double v7 = 0.0;
  if ((unint64_t)[v5 count] >= 2)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v5 objectAtIndexedSubscript:0];
      [v9 doubleValue];
      double v6 = v10;
    }
    v11 = [v5 objectAtIndexedSubscript:1];
    if (objc_opt_respondsToSelector())
    {
      v12 = [v5 objectAtIndexedSubscript:1];
      [v12 doubleValue];
      double v7 = v13;
    }
  }

  double v14 = v6;
  double v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

@end