@interface _UICollectionViewOutlineCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation _UICollectionViewOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICollectionViewOutlineCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNAccountsAndGroupsViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsViewController", @"diffableDataSource", "@", 0);
  [v3 validateClass:@"CNAccountsAndGroupsItem"];
  [v3 validateClass:@"CNAccountsAndGroupsItem" hasProperty:@"selected" customGetter:@"isSelected" customSetter:0 withType:"B"];
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(_UICollectionViewOutlineCellAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_6 startWithSelf:0];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = [v4 safeValueForKey:@"delegate"];
  MEMORY[0x2456487F0](@"CNAccountsAndGroupsViewController");
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 safeValueForKey:@"diffableDataSource"];
    objc_opt_class();
    v7 = __UIAccessibilityCastAsClass();
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    id v27 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __64___UICollectionViewOutlineCellAccessibility_accessibilityTraits__block_invoke_298;
    v18 = &unk_265117EA0;
    v21 = &v22;
    id v8 = v7;
    id v19 = v8;
    v20 = self;
    AXPerformSafeBlock();
    id v9 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    int v10 = [v9 safeBoolForKey:@"selected"];
    v14.receiver = self;
    v14.super_class = (Class)_UICollectionViewOutlineCellAccessibility;
    unint64_t v11 = [(_UICollectionViewOutlineCellAccessibility *)&v14 accessibilityTraits];

    if (v10) {
      unint64_t v12 = *MEMORY[0x263F1CF38] | v11;
    }
    else {
      unint64_t v12 = v11 & ~*MEMORY[0x263F1CF38];
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)_UICollectionViewOutlineCellAccessibility;
    unint64_t v12 = [(_UICollectionViewOutlineCellAccessibility *)&v28 accessibilityTraits];
  }

  return v12;
}

@end