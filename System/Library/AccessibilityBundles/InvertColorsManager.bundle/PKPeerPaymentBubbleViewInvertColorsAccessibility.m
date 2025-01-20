@interface PKPeerPaymentBubbleViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PKPeerPaymentBubbleViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentBubbleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end