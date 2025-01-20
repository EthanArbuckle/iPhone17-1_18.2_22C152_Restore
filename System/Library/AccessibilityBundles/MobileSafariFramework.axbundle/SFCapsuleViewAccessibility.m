@interface SFCapsuleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
@end

@implementation SFCapsuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCapsuleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFCapsuleCollectionView" hasInstanceVariable:@"_items" withType:"NSArray"];
  [v3 validateClass:@"SFCapsuleCollectionView" hasInstanceVariable:@"_selectedItemIndex" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCapsuleCollectionViewItem", @"capsuleView", "@", 0);
}

- (BOOL)accessibilityElementsHidden
{
  id v3 = [(SFCapsuleViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245655C80](@"SFCapsuleCollectionView", a2)];
  v4 = [v3 delegate];
  MEMORY[0x245655C80](@"TabGroupSwitcherViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v3 safeArrayForKey:@"_items"];
    unint64_t v8 = [v3 safeIntegerForKey:@"_selectedItemIndex"];
    BOOL v6 = 0;
    if (v8 < [v7 count])
    {
      v9 = [v7 objectAtIndexedSubscript:v8];
      v10 = [v9 safeValueForKey:@"capsuleView"];

      if (v10 != self) {
        BOOL v6 = 1;
      }
    }
  }
  return v6;
}

@end