@interface LPTestingOverrides
+ (BOOL)forceCollapseButtons;
+ (BOOL)forceDisableImageDeduplication;
+ (BOOL)forceEnableAllEntitlements;
+ (BOOL)forceEnableLockdownMode;
+ (BOOL)forceIgnoreAllTCCChecks;
+ (BOOL)forceMonospaceFonts;
+ (BOOL)forceRTL;
+ (BOOL)forceUseSmallerMaximumMetadataSize;
+ (LPTestingLoader)customLoader;
+ (NSArray)additionalAllowedFileURLDirectories;
+ (NSNumber)forceSubsampleImagesToScreenSize;
+ (unint64_t)forceImageLoadingScaleFactor;
+ (void)reset;
+ (void)setAdditionalAllowedFileURLDirectories:(id)a3;
+ (void)setCustomLoader:(id)a3;
+ (void)setForceCollapseButtons:(BOOL)a3;
+ (void)setForceDisableImageDeduplication:(BOOL)a3;
+ (void)setForceEnableAllEntitlements:(BOOL)a3;
+ (void)setForceEnableLockdownMode:(BOOL)a3;
+ (void)setForceIgnoreAllTCCChecks:(BOOL)a3;
+ (void)setForceImageLoadingScaleFactor:(unint64_t)a3;
+ (void)setForceMonospaceFonts:(BOOL)a3;
+ (void)setForceRTL:(BOOL)a3;
+ (void)setForceSubsampleImagesToScreenSize:(id)a3;
+ (void)setForceUseSmallerMaximumMetadataSize:(BOOL)a3;
@end

@implementation LPTestingOverrides

+ (void)reset
{
  _forceRTL = 0;
  _forceImageLoadingScaleFactor = 0;
  v2 = (void *)_forceSubsampleImagesToScreenSize;
  _forceSubsampleImagesToScreenSize = 0;

  _forceEnableAllEntitlements = 0;
  _forceIgnoreAllTCCChecks = 0;
  _forceMonospaceFonts = 0;
  _forceEnableLockdownMode = 0;
  v3 = (void *)_customLoader;
  _customLoader = 0;

  v4 = (void *)_additionalAllowedFileURLDirectories;
  _additionalAllowedFileURLDirectories = 0;

  _forceUseSmallerMaximumMetadataSize = 0;
  _forceDisableImageDeduplication = 0;
  _forceCollapseButtons = 0;
  +[LPResources clearCachedResources];

  +[LPTheme invalidateThemeCache];
}

+ (void)setForceRTL:(BOOL)a3
{
  _forceRTL = a3;
}

+ (BOOL)forceRTL
{
  return _forceRTL;
}

+ (void)setForceImageLoadingScaleFactor:(unint64_t)a3
{
  _forceImageLoadingScaleFactor = a3;
  +[LPResources clearCachedResources];
}

+ (unint64_t)forceImageLoadingScaleFactor
{
  return _forceImageLoadingScaleFactor;
}

+ (void)setForceSubsampleImagesToScreenSize:(id)a3
{
  objc_storeStrong((id *)&_forceSubsampleImagesToScreenSize, a3);
  id v4 = a3;
  +[LPResources clearCachedResources];
}

+ (NSNumber)forceSubsampleImagesToScreenSize
{
  return (NSNumber *)(id)_forceSubsampleImagesToScreenSize;
}

+ (void)setForceEnableAllEntitlements:(BOOL)a3
{
  _forceEnableAllEntitlements = a3;
}

+ (BOOL)forceEnableAllEntitlements
{
  return _forceEnableAllEntitlements;
}

+ (void)setForceIgnoreAllTCCChecks:(BOOL)a3
{
  _forceIgnoreAllTCCChecks = a3;
}

+ (BOOL)forceIgnoreAllTCCChecks
{
  return _forceIgnoreAllTCCChecks;
}

+ (void)setForceMonospaceFonts:(BOOL)a3
{
  _forceMonospaceFonts = a3;
  +[LPTheme invalidateThemeCache];
}

+ (BOOL)forceMonospaceFonts
{
  return _forceMonospaceFonts;
}

+ (void)setForceEnableLockdownMode:(BOOL)a3
{
  _forceEnableLockdownMode = a3;
}

+ (BOOL)forceEnableLockdownMode
{
  return _forceEnableLockdownMode;
}

+ (void)setCustomLoader:(id)a3
{
}

+ (LPTestingLoader)customLoader
{
  return (LPTestingLoader *)(id)_customLoader;
}

+ (void)setAdditionalAllowedFileURLDirectories:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 copy];
  id v4 = (void *)_additionalAllowedFileURLDirectories;
  _additionalAllowedFileURLDirectories = v3;
}

+ (NSArray)additionalAllowedFileURLDirectories
{
  return (NSArray *)(id)_additionalAllowedFileURLDirectories;
}

+ (BOOL)forceUseSmallerMaximumMetadataSize
{
  return _forceUseSmallerMaximumMetadataSize;
}

+ (void)setForceUseSmallerMaximumMetadataSize:(BOOL)a3
{
  _forceUseSmallerMaximumMetadataSize = a3;
}

+ (BOOL)forceDisableImageDeduplication
{
  return _forceDisableImageDeduplication;
}

+ (void)setForceDisableImageDeduplication:(BOOL)a3
{
  _forceDisableImageDeduplication = a3;
}

+ (BOOL)forceCollapseButtons
{
  return _forceCollapseButtons;
}

+ (void)setForceCollapseButtons:(BOOL)a3
{
  _forceCollapseButtons = a3;
}

@end