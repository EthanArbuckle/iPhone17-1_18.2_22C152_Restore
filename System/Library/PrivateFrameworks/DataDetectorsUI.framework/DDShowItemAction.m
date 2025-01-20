@interface DDShowItemAction
- (id)iconName;
- (id)localizedName;
@end

@implementation DDShowItemAction

- (id)localizedName
{
  return DDLocalizedString(@"Show Item");
}

- (id)iconName
{
  return @"cube.box";
}

@end