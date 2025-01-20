@interface PKPeerPaymentMessagesContentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PKPeerPaymentMessagesContentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentMessagesContentView";
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