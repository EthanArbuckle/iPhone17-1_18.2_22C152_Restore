@interface SCNNodeAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityConvertRect:(CGRect)a3 toNode:(id)a4;
- (CGRect)accessibilityFrame;
- (id)_accessibilityConvertSCNVector3Points:(id)a3 toNode:(id)a4;
- (id)_accessibilitySCNVector3BoundingBoxPoints;
- (id)accessibilityContainer;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (id)accessibilityPath;
- (void)dealloc;
@end

@implementation SCNNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SCNNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SCNNode", @"childNodes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SCNNode", @"parentNode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SCNNode", @"name", "@", 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  [(SCNNodeAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SCNNodeAccessibility;
  [(SCNNodeAccessibility *)&v3 dealloc];
}

- (id)accessibilityElements
{
  v8.receiver = self;
  v8.super_class = (Class)SCNNodeAccessibility;
  objc_super v3 = [(SCNNodeAccessibility *)&v8 accessibilityElements];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SCNNodeAccessibility *)self safeArrayForKey:@"childNodes"];
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityContainer
{
  v8.receiver = self;
  v8.super_class = (Class)SCNNodeAccessibility;
  objc_super v3 = [(SCNNodeAccessibility *)&v8 accessibilityContainer];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SCNNodeAccessibility *)self safeValueForKey:@"parentNode"];
  }
  v6 = v5;

  return v6;
}

- (CGRect)_accessibilityConvertRect:(CGRect)a3 toNode:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  -[SCNNodeAccessibility convertPoint:toNode:](self, "convertPoint:toNode:", a4, a3.origin.x, a3.origin.y);
  double v8 = width;
  double v9 = height;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)accessibilityPath
{
  v6.receiver = self;
  v6.super_class = (Class)SCNNodeAccessibility;
  v2 = [(SCNNodeAccessibility *)&v6 accessibilityPath];
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if ([(SCNNodeAccessibility *)self safeBoolForKey:@"isHidden"]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNNodeAccessibility;
  return [(SCNNodeAccessibility *)&v4 isAccessibilityElement];
}

- (CGRect)accessibilityFrame
{
  objc_super v3 = [(SCNNodeAccessibility *)self accessibilityUserDefinedFrame];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 CGRectValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v13 = [(SCNNodeAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
    v14 = [(SCNNodeAccessibility *)self _accessibilitySCNVector3BoundingBoxPoints];
    v15 = [(SCNNodeAccessibility *)self _accessibilityConvertSCNVector3Points:v14 toNode:0];
    objc_opt_class();
    v16 = __UIAccessibilityCastAsSafeCategory();
    v17 = [v16 accessibilityProjectSCNVector3Points:v15];

    if ([v17 count])
    {
      v18 = [MEMORY[0x263F1C478] accessibilityBezierPathWithSCNVector3Points:v17];
      v19 = UIAccessibilityConvertPathToScreenCoordinates(v18, v13);
      [v19 bounds];
      double v6 = v20;
      double v8 = v21;
      double v10 = v22;
      double v12 = v23;
    }
    else
    {
      v18 = [(SCNNodeAccessibility *)self accessibilityContainer];
      [(UIBezierPath *)v18 accessibilityFrame];
      double v6 = v24;
      double v8 = v25;
      double v10 = v26;
      double v12 = v27;
    }
  }
  double v28 = v6;
  double v29 = v8;
  double v30 = v10;
  double v31 = v12;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)accessibilityIdentifier
{
  return (id)[(SCNNodeAccessibility *)self safeValueForKey:@"name"];
}

- (id)_accessibilitySCNVector3BoundingBoxPoints
{
  v2 = objc_opt_new();
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3010000000;
  v53 = &unk_2424C6371;
  uint64_t v54 = 0;
  int v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3010000000;
  v47 = &unk_2424C6371;
  uint64_t v48 = 0;
  int v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v39 = MEMORY[0x263EF8330];
  id v4 = v3;
  AXPerformSafeBlock();
  int v5 = *((unsigned __int8 *)v41 + 24);

  _Block_object_dispose(&v40, 8);
  if (v5)
  {
    LODWORD(v6) = *((_DWORD *)v45 + 8);
    LODWORD(v7) = *((_DWORD *)v45 + 9);
    LODWORD(v8) = *((_DWORD *)v45 + 10);
    double v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v6, v7, v8, v39, 3221225472, __65__SCNNodeAccessibility__accessibilitySCNVector3BoundingBoxPoints__block_invoke, &unk_26514BE00);
    [v2 addObject:v9];

    LODWORD(v10) = *((_DWORD *)v51 + 8);
    LODWORD(v11) = *((_DWORD *)v45 + 9);
    LODWORD(v12) = *((_DWORD *)v45 + 10);
    v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v10, v11, v12);
    [v2 addObject:v13];

    LODWORD(v14) = *((_DWORD *)v51 + 8);
    LODWORD(v15) = *((_DWORD *)v45 + 9);
    LODWORD(v16) = *((_DWORD *)v51 + 10);
    v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v14, v15, v16);
    [v2 addObject:v17];

    LODWORD(v18) = *((_DWORD *)v45 + 8);
    LODWORD(v19) = *((_DWORD *)v45 + 9);
    LODWORD(v20) = *((_DWORD *)v51 + 10);
    double v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v18, v19, v20);
    [v2 addObject:v21];

    LODWORD(v22) = *((_DWORD *)v51 + 8);
    LODWORD(v23) = *((_DWORD *)v51 + 9);
    LODWORD(v24) = *((_DWORD *)v51 + 10);
    double v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v22, v23, v24);
    [v2 addObject:v25];

    LODWORD(v26) = *((_DWORD *)v51 + 8);
    LODWORD(v27) = *((_DWORD *)v51 + 9);
    LODWORD(v28) = *((_DWORD *)v45 + 10);
    double v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v26, v27, v28);
    [v2 addObject:v29];

    LODWORD(v30) = *((_DWORD *)v45 + 8);
    LODWORD(v31) = *((_DWORD *)v51 + 9);
    LODWORD(v32) = *((_DWORD *)v45 + 10);
    v33 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v30, v31, v32);
    [v2 addObject:v33];

    LODWORD(v34) = *((_DWORD *)v45 + 8);
    LODWORD(v35) = *((_DWORD *)v51 + 9);
    LODWORD(v36) = *((_DWORD *)v51 + 10);
    v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v34, v35, v36);
    [v2 addObject:v37];
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v2;
}

uint64_t __65__SCNNodeAccessibility__accessibilitySCNVector3BoundingBoxPoints__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) getBoundingBoxMin:*(void *)(*(void *)(a1 + 48) + 8) + 32 max:*(void *)(*(void *)(a1 + 56) + 8) + 32];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityConvertSCNVector3Points:(id)a3 toNode:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  LOBYTE(v23) = 0;
  objc_opt_class();
  double v8 = __UIAccessibilityCastAsClass();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = 0;
        double v24 = &v23;
        uint64_t v25 = 0x3010000000;
        double v26 = &unk_2424C6371;
        uint64_t v27 = 0;
        int v28 = 0;
        id v21 = v8;
        id v22 = v6;
        AXPerformSafeBlock();
        int v12 = *((_DWORD *)v24 + 8);
        int v13 = *((_DWORD *)v24 + 9);
        int v14 = *((_DWORD *)v24 + 10);

        _Block_object_dispose(&v23, 8);
        LODWORD(v15) = v12;
        LODWORD(v16) = v13;
        LODWORD(v17) = v14;
        double v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v15, v16, v17);
        [v7 addObject:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  return v7;
}

uint64_t __69__SCNNodeAccessibility__accessibilityConvertSCNVector3Points_toNode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) SCNVector3Value];
  uint64_t result = objc_msgSend(v2, "convertPosition:toNode:", *(void *)(a1 + 48));
  id v4 = *(_DWORD **)(*(void *)(a1 + 56) + 8);
  v4[8] = v5;
  v4[9] = v6;
  v4[10] = v7;
  return result;
}

@end