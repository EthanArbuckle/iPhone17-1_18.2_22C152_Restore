@interface MFSignatureTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
@end

@implementation MFSignatureTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFSignatureTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end