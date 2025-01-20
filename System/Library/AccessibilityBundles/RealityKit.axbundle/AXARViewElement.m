@interface AXARViewElement
- (AXARViewElement)initWithAccessibilityContainer:(id)a3 entityWrapper:(id)a4;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)_boundingRect;
- (CGRect)accessibilityFrame;
- (id)_accessibilityScrollStatus;
- (id)_arView;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (id)entityWrapper;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation AXARViewElement

- (AXARViewElement)initWithAccessibilityContainer:(id)a3 entityWrapper:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXARViewElement;
  v8 = [(AXARViewElement *)&v11 initWithAccessibilityContainer:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_entityWrapper, a4);
  }

  return v9;
}

- (id)_arView
{
  uint64_t v3 = MEMORY[0x24565D970](@"RealityKit.ARView", a2);

  return (id)[(AXARViewElement *)self _accessibilityAncestorIsKindOf:v3];
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = [(AXARViewElement *)self entityWrapper];
  if ([v3 safeBoolForKey:@"isEntityAccessible"])
  {
    v4 = [(AXARViewElement *)self entityWrapper];
    char v5 = [v4 safeBoolForKey:@"isEntityActive"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (CGRect)_boundingRect
{
  v2 = [(AXARViewElement *)self _arView];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v13 = 0;
    v14 = (double *)&v13;
    uint64_t v15 = 0x4010000000;
    v16 = &unk_2424943D9;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v2;
    AXPerformSafeBlock();
    double v4 = v14[4];
    double v5 = v14[5];
    double v6 = v14[6];
    double v7 = v14[7];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    double v4 = *MEMORY[0x263F001A8];
    double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

void __32__AXARViewElement__boundingRect__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) entityWrapper];
  [v7 calculateScreenBoundingRectIn:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
}

- (CGRect)accessibilityFrame
{
  [(AXARViewElement *)self _boundingRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_opt_class();
  double v11 = [(AXARViewElement *)self _arView];
  id v12 = __UIAccessibilityCastAsClass();

  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  CGRect v34 = CGRectIntersection(v33, v36);
  CGRectIsNull(v34);
  UIAccessibilityFrameForBounds();
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(AXARViewElement *)self _accessibilityGetBlockForAttribute:1];
  CGFloat v4 = (void *)v3;
  if (v3)
  {
    double v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    CGFloat v6 = [(AXARViewElement *)self entityWrapper];
    double v5 = [v6 safeValueForKey:@"entityLabel"];

    [(AXARViewElement *)self _boundingRect];
    if (CGRectIsNull(v11))
    {
      double v9 = accessibilityLocalizedString(@"OFF_SCREEN");
      uint64_t v7 = __UIAXStringForVariables();

      double v5 = (void *)v7;
    }
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  AXPerformSafeBlock();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  if (v2 == *MEMORY[0x263F1CF18]) {
    return *MEMORY[0x263F1CF40];
  }
  else {
    return v2;
  }
}

void __38__AXARViewElement_accessibilityTraits__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entityWrapper];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 entityAccessibilityTraits];
}

- (id)_accessibilityScrollStatus
{
  [(AXARViewElement *)self _boundingRect];
  if (CGRectIsNull(v42))
  {
    uint64_t v3 = 0;
  }
  else
  {
    [(AXARViewElement *)self entityWrapper];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    int v40 = 0;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    int v5 = *((_DWORD *)v38 + 6);

    _Block_object_dispose(&v37, 8);
    uint64_t v6 = (void *)MEMORY[0x263F227F0];
    [(AXARViewElement *)self _boundingRect];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(AXARViewElement *)self _arView];
    [v15 accessibilityFrame];
    double v31 = v16;
    LODWORD(v16) = v5;
    double v32 = objc_msgSend(v6, "descriptionForDistance:objectFrame:viewBounds:", v16, v8, v10, v12, v14, *(void *)&v31, v17, v18, v19);
    CGFloat v20 = __UIAXStringForVariables();

    CGRect v33 = objc_msgSend(v4, "safeValueForKey:", @"entityDescription", v32, @"__AXStringForVariablesSentinel");
    uint64_t v3 = __UIAXStringForVariables();

    double v21 = objc_msgSend(v4, "safeValueForKey:", @"rootEntityWrapper", v33, @"__AXStringForVariablesSentinel");
    double v22 = [v21 safeValueForKey:@"entityLabel"];
    if ([v22 length])
    {
      double v23 = NSString;
      double v24 = accessibilityLocalizedString(@"SCENE_LABEL");
      CGRect v34 = objc_msgSend(v23, "localizedStringWithFormat:", v24, v22);
      CGRect v36 = @"__AXStringForVariablesSentinel";
      uint64_t v25 = __UIAXStringForVariables();

      uint64_t v3 = (void *)v25;
    }
    double v26 = objc_msgSend(v21, "safeValueForKey:", @"entityDescription", v34, v36);
    if ([v26 length])
    {
      double v27 = NSString;
      double v28 = accessibilityLocalizedString(@"SCENE_DESCRIPTION");
      v35 = objc_msgSend(v27, "localizedStringWithFormat:", v28, v26);
      uint64_t v29 = __UIAXStringForVariables();

      uint64_t v3 = (void *)v29;
    }
  }

  return v3;
}

void __45__AXARViewElement__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _arView];
  [v3 distanceInMetersFromEntityAccessibilityWrapper:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(AXARViewElement *)self entityWrapper];
  int v4 = [v3 safeBoolForKey:@"entitySupportsAccessibilityActivateAction"];

  if (v4)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    CGFloat v20 = __40__AXARViewElement_accessibilityActivate__block_invoke;
    double v21 = &unk_265149B38;
    double v22 = self;
    AXPerformSafeBlock();
  }
  else
  {
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    double v10 = __40__AXARViewElement_accessibilityActivate__block_invoke_2;
    double v11 = &unk_265149B10;
    double v12 = self;
    double v13 = &v14;
    AXPerformSafeBlock();
    int v5 = *((unsigned __int8 *)v15 + 24);
    _Block_object_dispose(&v14, 8);
    if (!v5)
    {
      v7.receiver = self;
      v7.super_class = (Class)AXARViewElement;
      return [(AXARViewElement *)&v7 accessibilityActivate];
    }
  }
  return 1;
}

void __40__AXARViewElement_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) entityWrapper];
  [v1 entityPerformAccessibilityActivate];
}

void __40__AXARViewElement_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _arView];
  int v2 = [*(id *)(a1 + 32) entityWrapper];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 handleTapForEntityAccessibilityWrapper:v2];
}

- (id)accessibilityCustomContent
{
  int v2 = [(AXARViewElement *)self entityWrapper];
  id v3 = [v2 safeValueForKey:@"entityAccessibilityCustomContent"];

  return v3;
}

- (id)accessibilityCustomActions
{
  int v2 = [(AXARViewElement *)self entityWrapper];
  id v3 = [v2 safeValueForKey:@"entityAccessibilityCustomActions"];

  return v3;
}

- (id)accessibilityCustomRotors
{
  int v2 = [(AXARViewElement *)self entityWrapper];
  id v3 = [v2 safeValueForKey:@"entityAccessibilityCustomRotors"];

  return v3;
}

- (void)accessibilityIncrement
{
}

void __41__AXARViewElement_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) entityWrapper];
  [v1 entityPerformAccessibilityIncrement];
}

- (void)accessibilityDecrement
{
}

void __41__AXARViewElement_accessibilityDecrement__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) entityWrapper];
  [v1 entityPerformAccessibilityDecrement];
}

- (id)entityWrapper
{
  return self->_entityWrapper;
}

- (void).cxx_destruct
{
}

@end