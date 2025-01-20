@interface SiriUIAceObjectControllerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (id)accessibilityIdentifier;
@end

@implementation SiriUIAceObjectControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIAceObjectControllerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  v2 = [(SiriUIAceObjectControllerCellAccessibility *)self safeValueForKey:@"aceViewController"];
  v3 = [v2 safeValueForKey:@"aceObject"];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = v3;
  AXPerformSafeBlock();
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    id v7 = v4;
    AXPerformSafeBlock();
    id v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

uint64_t __69__SiriUIAceObjectControllerCellAccessibility_accessibilityIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) propertyForKey:@"dialogIdentifier"];

  return MEMORY[0x270F9A758]();
}

uint64_t __69__SiriUIAceObjectControllerCellAccessibility_accessibilityIdentifier__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) propertyForKey:@"$group"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end