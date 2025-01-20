@interface PUAlbumListTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PUAlbumListTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAlbumListTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(PUAlbumListTableViewCellAccessibility *)self contentView];
  v3 = [v2 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Pualbumlistcel_0.isa)];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(PUAlbumListTableViewCellAccessibility *)self contentView];
  v3 = [v2 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Pualbumlistcel_0.isa)];
  v4 = [v3 accessibilityValue];

  return v4;
}

@end