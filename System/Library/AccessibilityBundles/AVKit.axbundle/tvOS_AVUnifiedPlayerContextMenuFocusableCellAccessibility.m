@interface tvOS_AVUnifiedPlayerContextMenuFocusableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation tvOS_AVUnifiedPlayerContextMenuFocusableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_AVUnifiedPlayerContextMenuFocusableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVUnifiedPlayerContextMenuCell", @"leadingImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVUnifiedPlayerContextMenuCell", @"trailingImageView", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(tvOS_AVUnifiedPlayerContextMenuFocusableCellAccessibility *)self safeUIViewForKey:@"leadingImageView"];
  v4 = [v3 accessibilityLabel];
  v10.receiver = self;
  v10.super_class = (Class)tvOS_AVUnifiedPlayerContextMenuFocusableCellAccessibility;
  v5 = [(tvOS_AVUnifiedPlayerContextMenuFocusableCellAccessibility *)&v10 accessibilityLabel];
  v6 = [(tvOS_AVUnifiedPlayerContextMenuFocusableCellAccessibility *)self safeUIViewForKey:@"trailingImageView"];
  v9 = [v6 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

@end