@interface ANUtils
+ (BOOL)isHomeAppInstalled;
+ (BOOL)isInternalBuild;
+ (NSDateFormatter)an_dateFormatterForFilename;
+ (double)machTimeToSeconds:(unint64_t)a3;
+ (unint64_t)secondsToMachTime:(double)a3;
+ (void)asyncDispatchOnGlobalQueue:(id)a3;
@end

@implementation ANUtils

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_3);
  }
  return isInternalBuild_isInternal;
}

uint64_t __26__ANUtils_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  isInternalBuild_isInternal = result;
  return result;
}

+ (NSDateFormatter)an_dateFormatterForFilename
{
  if (an_dateFormatterForFilename_onceToken != -1) {
    dispatch_once(&an_dateFormatterForFilename_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)an_dateFormatterForFilename_dateFormatter;

  return (NSDateFormatter *)v2;
}

uint64_t __38__ANUtils_an_dateFormatterForFilename__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)an_dateFormatterForFilename_dateFormatter;
  an_dateFormatterForFilename_dateFormatter = (uint64_t)v0;

  v2 = (void *)an_dateFormatterForFilename_dateFormatter;
  v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];
  [v2 setLocale:v3];

  v4 = (void *)an_dateFormatterForFilename_dateFormatter;

  return [v4 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
}

+ (BOOL)isHomeAppInstalled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = @"com.apple.Home";
  id v7 = 0;
  v3 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:v2 allowPlaceholder:0 error:&v7];
  id v4 = v7;
  if (v4)
  {
    if (ANLogHandleUtils_once != -1) {
      dispatch_once(&ANLogHandleUtils_once, &__block_literal_global_32);
    }
    v5 = (id)ANLogHandleUtils_logger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v9 = &stru_26D2D46B0;
      __int16 v10 = 2112;
      v11 = v2;
      __int16 v12 = 2112;
      v13 = v3;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_220FAA000, v5, OS_LOG_TYPE_ERROR, "%@Failed to look up bundle record for bundleID (%@), Record: %@ Error: %@", buf, 0x2Au);
    }
  }
  return v3 != 0;
}

+ (double)machTimeToSeconds:(unint64_t)a3
{
  if (machTimeToSeconds__onceToken != -1) {
    dispatch_once(&machTimeToSeconds__onceToken, &__block_literal_global_14);
  }
  LODWORD(v3) = dword_267F42A24;
  return (double)(machTimeToSeconds___timeBaseInfo * a3) / ((double)v3 * 1000000000.0);
}

uint64_t __29__ANUtils_machTimeToSeconds___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimeToSeconds___timeBaseInfo);
}

+ (unint64_t)secondsToMachTime:(double)a3
{
  if (secondsToMachTime__onceToken != -1) {
    dispatch_once(&secondsToMachTime__onceToken, &__block_literal_global_16);
  }
  return (unint64_t)((float)*(unsigned int *)algn_267F42A34
                          * a3
                          * (float)(1000000000.0 / (float)secondsToMachTime___timeBaseInfo));
}

uint64_t __29__ANUtils_secondsToMachTime___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&secondsToMachTime___timeBaseInfo);
}

+ (void)asyncDispatchOnGlobalQueue:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ANUtils_asyncDispatchOnGlobalQueue___block_invoke;
  block[3] = &unk_264587190;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __38__ANUtils_asyncDispatchOnGlobalQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end