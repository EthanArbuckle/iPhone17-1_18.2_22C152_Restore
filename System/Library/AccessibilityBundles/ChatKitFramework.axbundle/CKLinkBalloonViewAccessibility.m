@interface CKLinkBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)accessibilityLabel;
@end

@implementation CKLinkBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKLinkBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLinkBalloonView", @"linkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"tapGestureRecognized:", "v", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKLinkBalloonViewAccessibility *)self safeValueForKey:@"linkView"];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKLinkBalloonViewAccessibility;
    uint64_t v5 = [(CKLinkBalloonViewAccessibility *)&v8 accessibilityLabel];
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

uint64_t __55__CKLinkBalloonViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tapGestureRecognized:0];
}

@end