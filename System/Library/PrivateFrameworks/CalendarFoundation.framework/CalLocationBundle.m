@interface CalLocationBundle
+ (id)_path;
+ (id)bundle;
+ (void)bundle;
@end

@implementation CalLocationBundle

+ (id)bundle
{
  v2 = [(id)objc_opt_class() _path];
  v3 = [MEMORY[0x1E4F28B50] bundleWithPath:v2];
  if (!v3)
  {
    v4 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[CalLocationBundle bundle];
    }
  }

  return v3;
}

+ (id)_path
{
  v2 = __CalSystemRootDirectory();
  v3 = [v2 stringByAppendingString:@"/System/Library/LocationBundles/CalendarLocation.bundle"];

  return v3;
}

+ (void)bundle
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Could not find location bundle at path: [%@].", (uint8_t *)&v2, 0xCu);
}

@end