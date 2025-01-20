@interface VideoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)accessibilityUpdatePlayerControllerControls;
@end

@implementation VideoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.VideoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStore.ProductLockupCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.VideoView", @"accessibilityUpdatePlayerControllerControls", "v", 0);
}

- (void)accessibilityUpdatePlayerControllerControls
{
  v7.receiver = self;
  v7.super_class = (Class)VideoViewAccessibility;
  [(VideoViewAccessibility *)&v7 accessibilityUpdatePlayerControllerControls];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__VideoViewAccessibility_accessibilityUpdatePlayerControllerControls__block_invoke;
  v5[3] = &unk_265105DB0;
  v6 = @"AppStore.ProductLockupCollectionViewCell";
  id v3 = [(VideoViewAccessibility *)self _accessibilityFindAncestor:v5 startWithSelf:1];
  v4 = v3;
  if (v3) {
    [v3 resetProductLockupCellAccessibilityElements];
  }
}

uint64_t __69__VideoViewAccessibility_accessibilityUpdatePlayerControllerControls__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  MEMORY[0x245641130](v2);
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

@end