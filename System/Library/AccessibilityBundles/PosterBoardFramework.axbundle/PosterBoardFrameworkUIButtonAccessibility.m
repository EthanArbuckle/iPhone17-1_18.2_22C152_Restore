@interface PosterBoardFrameworkUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PosterBoardFrameworkUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(PosterBoardFrameworkUIButtonAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"poster.switcher.focus.button"];

  if (v4)
  {
    if ([(PosterBoardFrameworkUIButtonAccessibility *)self overrideUserInterfaceStyle] == 1) {
      v5 = @"poster.switcher.focus.button.linked.label";
    }
    else {
      v5 = @"poster.switcher.focus.button.link.focus.label";
    }
    v6 = accessibilityLocalizedString(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PosterBoardFrameworkUIButtonAccessibility;
    v6 = [(PosterBoardFrameworkUIButtonAccessibility *)&v8 accessibilityLabel];
  }

  return v6;
}

- (id)accessibilityValue
{
  v3 = [(PosterBoardFrameworkUIButtonAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"poster.switcher.focus.button"];

  if (v4
    && [(PosterBoardFrameworkUIButtonAccessibility *)self overrideUserInterfaceStyle] == 1)
  {
    v10 = self;
    v5 = &selRef_accessibilityLabel;
    v6 = &v10;
  }
  else
  {
    v9 = self;
    v5 = &selRef_accessibilityValue;
    v6 = &v9;
  }
  v6[1] = (PosterBoardFrameworkUIButtonAccessibility *)PosterBoardFrameworkUIButtonAccessibility;
  v7 = objc_msgSendSuper2((objc_super *)v6, *v5, v9);

  return v7;
}

@end