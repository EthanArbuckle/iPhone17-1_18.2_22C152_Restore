@interface DDPlaceholderAction
- (BOOL)isPlaceholderAction;
- (id)iconName;
- (id)localizedName;
@end

@implementation DDPlaceholderAction

- (id)localizedName
{
  return DDLocalizedString(@"Convert");
}

- (id)iconName
{
  return @"arrow.triangle.swap";
}

- (BOOL)isPlaceholderAction
{
  return 1;
}

@end