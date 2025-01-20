@interface CKBalloonImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
@end

@implementation CKBalloonImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBalloonImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKBalloonImageView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonImageView", @"stickerAccessibilityDescription", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  v2 = [(CKBalloonImageViewAccessibility *)self safeValueForKey:@"stickerAccessibilityDescription"];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"Sticker: %@", v2];
  }
  else
  {
    id v3 = @"Sticker";
  }
  v4 = __UIAXStringForVariables();

  return v4;
}

@end