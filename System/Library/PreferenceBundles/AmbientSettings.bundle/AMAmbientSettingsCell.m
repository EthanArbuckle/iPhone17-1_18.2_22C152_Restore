@interface AMAmbientSettingsCell
+ (double)defaultCellHeight;
+ (id)bundle;
+ (int64_t)cellStyle;
- (BOOL)canReload;
@end

@implementation AMAmbientSettingsCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

+ (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (BOOL)canReload
{
  return 1;
}

@end