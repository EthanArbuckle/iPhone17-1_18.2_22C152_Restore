@interface SUItemOfferButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)_reloadButton;
@end

@implementation SUItemOfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUItemOfferButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_reloadButton
{
  v2.receiver = self;
  v2.super_class = (Class)SUItemOfferButtonAccessibility;
  [(SUItemOfferButtonAccessibility *)&v2 _reloadButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"press.buy");
}

- (id)accessibilityLabel
{
  v3 = [(SUItemOfferButtonAccessibility *)self safeValueForKey:@"itemOfferButtonStyle"];
  if ([v3 isEqualToString:*MEMORY[0x263F89740]])
  {
    v9.receiver = self;
    v9.super_class = (Class)SUItemOfferButtonAccessibility;
    v4 = [(SUItemOfferButtonAccessibility *)&v9 accessibilityLabel];
    v7 = accessibilityLocalizedString(@"iTunesPlus");
    v5 = __UIAXStringForVariables();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUItemOfferButtonAccessibility;
    v5 = [(SUItemOfferButtonAccessibility *)&v8 accessibilityLabel];
  }

  return v5;
}

@end