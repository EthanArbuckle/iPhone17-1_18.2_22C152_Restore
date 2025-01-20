@interface _TVTextBadgeAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)_processTextBadgeAXLabel:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _TVTextBadgeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVTextBadge";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)_TVTextBadgeAccessibility;
  v3 = [(_TVTextBadgeAccessibility *)&v6 accessibilityLabel];
  if (!v3)
  {
    v3 = accessibilityLocalizedString(@"unknown.badge");
  }
  v4 = [(_TVTextBadgeAccessibility *)self _processTextBadgeAXLabel:v3];

  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)_processTextBadgeAXLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATV.Search.Product.ADAvailable"])
  {
    v4 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v4;
    objc_super v6 = @"axid.icon.ad";
LABEL_5:
    id v7 = [v4 atvaccessibilityLocalizedString:v6];

    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"ATV.Search.Product.SDHAvailable"])
  {
    v4 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v4;
    objc_super v6 = @"axid.icon.sdh";
    goto LABEL_5;
  }
  id v7 = v3;
LABEL_7:

  return v7;
}

@end