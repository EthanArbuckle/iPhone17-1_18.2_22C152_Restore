@interface WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
@end

@implementation WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore

+ (id)safeCategoryTargetClassName
{
  return @"WebAccessibilityObjectWrapper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v3 = [(WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456554A0](@"MFSignatureTextView", a2)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore;
  return [(WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore *)&v5 accessibilityRespondsToUserInteraction];
}

@end