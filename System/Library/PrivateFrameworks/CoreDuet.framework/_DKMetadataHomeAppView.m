@interface _DKMetadataHomeAppView
+ (id)homeUUID;
+ (id)viewInformation;
+ (id)viewName;
+ (id)viewUUID;
@end

@implementation _DKMetadataHomeAppView

+ (id)homeUUID
{
  return @"homekit.homeUUID";
}

+ (id)viewUUID
{
  return @"homekit.viewUUID";
}

+ (id)viewName
{
  return @"homekit.viewName";
}

+ (id)viewInformation
{
  return @"homekit.viewInformation";
}

@end