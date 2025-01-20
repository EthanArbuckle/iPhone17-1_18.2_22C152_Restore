@interface LSApplicationProxy(CarouselPreferenceServices)
- (id)cslprf_safeCorrespondingApplicationRecord;
@end

@implementation LSApplicationProxy(CarouselPreferenceServices)

- (id)cslprf_safeCorrespondingApplicationRecord
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [a1 bundleIdentifier];
  v3 = [a1 correspondingApplicationRecord];
  id v8 = 0;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263F01878]), "initWithBundleIdentifier:allowPlaceholder:error:", v2, objc_msgSend(v3, "isPlaceholder"), &v8);
  id v5 = v8;
  if (v5)
  {
    v6 = cslprf_app_library_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v10 = a1;
      __int16 v11 = 2112;
      v12 = v2;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_22F4EA000, v6, OS_LOG_TYPE_INFO, "%@ failed safeCorrespondingApplicationRecord for bundleIdentifier:%@ error:%@", buf, 0x20u);
    }
  }
  return v4;
}

@end