@interface UIKitAccessibilityTextMarker
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIKitAccessibilityTextMarker)initWithData:(id)a3;
@end

@implementation UIKitAccessibilityTextMarker

+ (id)safeCategoryTargetClassName
{
  return @"WebAccessibilityTextMarker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityTextMarker", @"dataRepresentation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityTextMarker", @"initWithData: accessibilityObject:", "@", "@", "@", 0);
}

- (UIKitAccessibilityTextMarker)initWithData:(id)a3
{
  return [(UIKitAccessibilityTextMarker *)self initWithData:a3 accessibilityObject:0];
}

@end