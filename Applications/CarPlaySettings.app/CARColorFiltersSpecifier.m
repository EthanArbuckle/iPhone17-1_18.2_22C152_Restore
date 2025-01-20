@interface CARColorFiltersSpecifier
- (CARColorFiltersSpecifier)init;
@end

@implementation CARColorFiltersSpecifier

- (CARColorFiltersSpecifier)init
{
  v3 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS");
  v6.receiver = self;
  v6.super_class = (Class)CARColorFiltersSpecifier;
  v4 = [(CARSettingsCellSpecifier *)&v6 initWithTitle:v3 image:0 accessoryType:1];

  return v4;
}

@end