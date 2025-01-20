@interface MusicUINavigationButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MusicUINavigationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(MusicUINavigationButtonAccessibility *)self safeValueForKey:@"_accessibilityImagePath"];
  int v4 = [v3 hasPrefix:@"UIButtonBarListIcon"];

  if (v4)
  {
    v5 = accessibilityMusicLocalizedString(@"track.list.button");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MusicUINavigationButtonAccessibility;
    v5 = [(MusicUINavigationButtonAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

@end