@interface CPAnalyticsPropertyProviderClassLoader
+ (id)_loadDynamicPHPropertyProvider:(id)a3 forPHPhotoLibrary:(id)a4;
+ (id)_loadPHPropertyProvider:(id)a3 forPHPhotoLibrary:(id)a4;
+ (id)mediaPropertyProviderForPHPhotoLibrary:(id)a3;
+ (id)propertyProviderForPHPhotoLibrary:(id)a3;
@end

@implementation CPAnalyticsPropertyProviderClassLoader

+ (id)_loadPHPropertyProvider:(id)a3 forPHPhotoLibrary:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = (NSString *)a3;
  id v6 = a4;
  v7 = NSClassFromString(v5);
  if (!v7)
  {
    v8 = CPAnalyticsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_215355000, v8, OS_LOG_TYPE_ERROR, "Failed to load %@ class", (uint8_t *)&v12, 0xCu);
    }
  }
  if ([(objc_class *)v7 instancesRespondToSelector:sel_initWithPhotoLibrary_]&& [(objc_class *)v7 instancesRespondToSelector:sel_registerSystemProperties_])
  {
    v9 = (void *)[[v7 alloc] initWithPhotoLibrary:v6];
  }
  else
  {
    v10 = CPAnalyticsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_215355000, v10, OS_LOG_TYPE_ERROR, "%@ does not comply with CPAnalyticsPhotoKitPropertyProvider protocol", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

+ (id)_loadDynamicPHPropertyProvider:(id)a3 forPHPhotoLibrary:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [a1 _loadPHPropertyProvider:v6 forPHPhotoLibrary:a4];
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_getDynamicProperty_forEventName_payloadForSystemPropertyExtraction_])
  {
    id v8 = v7;
  }
  else
  {
    v9 = CPAnalyticsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_215355000, v9, OS_LOG_TYPE_ERROR, "%@ does not comply with CPAnalyticsDynamicPropertyProvider protocol", (uint8_t *)&v11, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)propertyProviderForPHPhotoLibrary:(id)a3
{
  return +[CPAnalyticsPropertyProviderClassLoader _loadPHPropertyProvider:@"PHCPAnalyticsCachedPropertyProvider" forPHPhotoLibrary:a3];
}

+ (id)mediaPropertyProviderForPHPhotoLibrary:(id)a3
{
  return +[CPAnalyticsPropertyProviderClassLoader _loadDynamicPHPropertyProvider:@"PHCPAnalyticsMediaPropertyProvider" forPHPhotoLibrary:a3];
}

@end