@interface PKGroupsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 notify:(BOOL)a6;
@end

@implementation PKGroupsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKGroupsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGroupsController", @"indexOfSeparationGroup", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGroupsController", @"_moveGroup:fromIndex:toIndex:notify:", "v", "@", "Q", "Q", "B", 0);
  [v3 validateClass:@"PKGroupsController" hasInstanceVariable:@"_groups" withType:"NSMutableArray"];
}

- (void)_moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKGroupsControllerAccessibility;
  [(PKGroupsControllerAccessibility *)&v38 _moveGroup:v10 fromIndex:a4 toIndex:a5 notify:v6];
  v11 = [(PKGroupsControllerAccessibility *)self safeArrayForKey:@"_groups"];
  if ([v11 count] > a5)
  {
    v12 = [(PKGroupsControllerAccessibility *)self safeValueForKey:@"indexOfSeparationGroup"];
    uint64_t v13 = [v12 integerValue];

    if (v13 == a5)
    {
      UIAccessibilityNotifications v14 = *MEMORY[0x263F1CDC8];
      v15 = accessibilityLocalizedString(@"top.card.default.announcement");
      UIAccessibilityPostNotification(v14, v15);
LABEL_10:

      goto LABEL_11;
    }
    if (a5 >= a4)
    {
      char v37 = 0;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy_;
      v35 = __Block_byref_object_dispose_;
      id v36 = 0;
      id v29 = v11;
      AXPerformSafeBlock();
      id v20 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      v21 = [v20 passes];

      v22 = [v21 firstObject];
      v15 = __UIAccessibilitySafeClass();

      if (!v37)
      {
        v19 = @"card.moved.front.card";
        goto LABEL_9;
      }
    }
    else
    {
      char v37 = 0;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy_;
      v35 = __Block_byref_object_dispose_;
      id v36 = 0;
      id v30 = v11;
      AXPerformSafeBlock();
      id v16 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      v17 = [v16 passes];

      v18 = [v17 firstObject];
      v15 = __UIAccessibilitySafeClass();

      if (!v37)
      {
        v19 = @"card.moved.behind.card";
LABEL_9:
        v23 = [v15 localizedDescription];
        v24 = [v15 organizationName];
        v25 = __UIAXStringForVariables();

        LODWORD(v23) = *MEMORY[0x263F1CDC8];
        v26 = NSString;
        v27 = accessibilityLocalizedString(v19);
        v28 = objc_msgSend(v26, "stringWithFormat:", v27, v25, @"__AXStringForVariablesSentinel");
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v23, v28);

        goto LABEL_10;
      }
    }
    abort();
  }
LABEL_11:
}

uint64_t __71__PKGroupsControllerAccessibility__moveGroup_fromIndex_toIndex_notify___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48) + 1];

  return MEMORY[0x270F9A758]();
}

uint64_t __71__PKGroupsControllerAccessibility__moveGroup_fromIndex_toIndex_notify___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48) - 1];

  return MEMORY[0x270F9A758]();
}

@end