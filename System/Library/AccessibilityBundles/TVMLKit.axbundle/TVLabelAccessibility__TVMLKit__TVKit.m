@interface TVLabelAccessibility__TVMLKit__TVKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TVLabelAccessibility__TVMLKit__TVKit

+ (id)safeCategoryTargetClassName
{
  return @"TVLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKTextElement", @"badges", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKTextBadgeAttachment", @"badge", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKViewElement", @"accessibilityText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKImageElement", @"url", "@", 0);
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)TVLabelAccessibility__TVMLKit__TVKit;
  id v3 = [(TVLabelAccessibility__TVMLKit__TVKit *)&v7 accessibilityLabel];
  v4 = [(TVLabelAccessibility__TVMLKit__TVKit *)self _atvaccessibilityITMLAccessibilityContent];
  v5 = [MEMORY[0x263F22278] textByReconcilingClientText:v3 withServerText:v4];

  return v5;
}

@end