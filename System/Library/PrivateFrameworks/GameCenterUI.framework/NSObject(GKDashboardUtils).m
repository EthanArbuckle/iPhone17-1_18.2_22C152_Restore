@interface NSObject(GKDashboardUtils)
+ (id)_gkNib;
+ (id)_gkNibWithBaseName:()GKDashboardUtils;
+ (id)_gkNibWithPlatformName:()GKDashboardUtils;
+ (id)_gkPlatformNibName;
+ (uint64_t)_gkPlatformNibNameForBaseName:()GKDashboardUtils;
@end

@implementation NSObject(GKDashboardUtils)

+ (id)_gkPlatformNibName
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [a1 _gkPlatformNibNameForBaseName:v3];

  return v4;
}

+ (uint64_t)_gkPlatformNibNameForBaseName:()GKDashboardUtils
{
  return [a3 stringByAppendingString:@"_iOS"];
}

+ (id)_gkNib
{
  v2 = [a1 _gkPlatformNibName];
  v3 = [a1 _gkNibWithPlatformName:v2];

  return v3;
}

+ (id)_gkNibWithBaseName:()GKDashboardUtils
{
  v2 = objc_msgSend(a1, "_gkPlatformNibNameForBaseName:");
  v3 = [a1 _gkNibWithPlatformName:v2];

  return v3;
}

+ (id)_gkNibWithPlatformName:()GKDashboardUtils
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleForClass:a1];
  v7 = [MEMORY[0x1E4FB19F8] nibWithNibName:v5 bundle:v6];

  return v7;
}

@end