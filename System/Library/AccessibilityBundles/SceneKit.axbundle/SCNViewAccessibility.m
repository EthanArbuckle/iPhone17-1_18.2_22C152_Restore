@interface SCNViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySceneKitScene;
- (id)accessibilityElements;
- (id)accessibilityProjectSCNVector3Points:(id)a3;
@end

@implementation SCNViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SCNView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityProjectSCNVector3Points:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  LOBYTE(v19) = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x3010000000;
        v22 = &unk_2424C6371;
        uint64_t v23 = 0;
        int v24 = 0;
        id v18 = v5;
        AXPerformSafeBlock();
        int v9 = *((_DWORD *)v20 + 8);
        int v10 = *((_DWORD *)v20 + 9);
        int v11 = *((_DWORD *)v20 + 10);

        _Block_object_dispose(&v19, 8);
        LODWORD(v12) = v9;
        LODWORD(v13) = v10;
        LODWORD(v14) = v11;
        v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v12, v13, v14);
        [v4 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  return v4;
}

uint64_t __61__SCNViewAccessibility_accessibilityProjectSCNVector3Points___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) SCNVector3Value];
  uint64_t result = objc_msgSend(v2, "projectPoint:");
  v4 = *(_DWORD **)(*(void *)(a1 + 48) + 8);
  v4[8] = v5;
  v4[9] = v6;
  v4[10] = v7;
  return result;
}

- (id)_accessibilitySceneKitScene
{
  return (id)[(SCNViewAccessibility *)self safeValueForKey:@"scene"];
}

- (id)accessibilityElements
{
  id v3 = [(SCNViewAccessibility *)self _accessibilitySceneKitScene];
  char v12 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsSafeCategory();
  char v5 = [v4 accessibilityContainerIsSet];

  if ((v5 & 1) == 0) {
    [v3 setAccessibilityContainer:self];
  }
  v11.receiver = self;
  v11.super_class = (Class)SCNViewAccessibility;
  int v6 = [(SCNViewAccessibility *)&v11 accessibilityElements];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF980], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    int v9 = [(SCNViewAccessibility *)self _accessibilitySortedElementsWithin];
    if (v9) {
      [v8 addObjectsFromArray:v9];
    }
  }

  return v8;
}

@end