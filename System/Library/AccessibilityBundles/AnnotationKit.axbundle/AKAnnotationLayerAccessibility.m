@interface AKAnnotationLayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityExpandAnnotation;
- (BOOL)_accessibilityShrinkAnnotation;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityMakeAnnotation:(id)a3 larger:(BOOL)a4;
- (void)_accessibilityZoomIn:(BOOL)a3;
@end

@implementation AKAnnotationLayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKAnnotationLayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationLayer", @"annotation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationLayer", @"updateContents", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)AKAnnotationLayerAccessibility;
  unint64_t v3 = [(AKAnnotationLayerAccessibility *)&v9 accessibilityTraits];
  v4 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 |= *MEMORY[0x263F81408];
    if ([v4 isEditingText]) {
      v3 |= *MEMORY[0x263F81398];
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = *MEMORY[0x263F21B48];
  if ((isKindOfClass & 1) == 0) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 | v3;

  return v7;
}

- (id)accessibilityLabel
{
  v2 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    unint64_t v3 = __UIAccessibilityCastAsClass();
    uint64_t v4 = [v3 style];
    switch(v4)
    {
      case 3:
        v5 = @"annotation.style.strikethrough";
        goto LABEL_8;
      case 2:
        v5 = @"annotation.style.underline";
        goto LABEL_8;
      case 1:
        v5 = @"annotation.style.highlight";
LABEL_8:
        uint64_t v6 = accessibilityLocalizedString(v5);
        goto LABEL_11;
    }
  }
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  uint64_t v6 = [v3 displayName];
LABEL_11:
  unint64_t v7 = (void *)v6;

  return v7;
}

- (id)accessibilityValue
{
  v46.receiver = self;
  v46.super_class = (Class)AKAnnotationLayerAccessibility;
  unint64_t v3 = [(AKAnnotationLayerAccessibility *)&v46 accessibilityValue];
  uint64_t v4 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v5 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
    uint64_t v6 = __UIAccessibilityCastAsClass();

    [v6 magnification];
    unint64_t v7 = NSString;
    v8 = accessibilityLocalizedString(@"percent.zoom");
    objc_super v9 = AXFormatFloatWithPercentage();
    v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

    v39 = v10;
    v40 = @"__AXStringForVariablesSentinel";
    uint64_t v11 = __UIAXStringForVariables();

    unint64_t v3 = (void *)v11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v12 = __UIAccessibilityCastAsClass();
    v13 = [v12 strokeColor];
    v14 = [v13 accessibilityLabel];

    if ([v12 isDashed])
    {
      v15 = accessibilityLocalizedString(@"stroke.description.dashed");
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "strokeWidth", v39, v40);
    if (v16 >= 10.0)
    {
      [v12 strokeWidth];
      if (v18 <= 20.0)
      {
        v19 = 0;
        goto LABEL_13;
      }
      v17 = @"stroke.description.thickness.thick";
    }
    else
    {
      v17 = @"stroke.description.thickness.thin";
    }
    accessibilityLocalizedString(v17);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v42 = v15;
    v43 = @"__AXStringForVariablesSentinel";
    v39 = v14;
    v40 = v19;
    uint64_t v20 = __UIAXStringForVariables();

    unint64_t v3 = (void *)v20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v21 = __UIAccessibilityCastAsClass();
    v22 = [v21 annotationText];
    v23 = [v21 typingAttributes];
    objc_opt_class();
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
    v25 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v26 = [v23 objectForKeyedSubscript:*MEMORY[0x263F1C240]];
    v27 = __UIAccessibilityCastAsClass();

    if (v25)
    {
      [v25 fontName];
      v28 = v45 = v21;
      v29 = NSString;
      accessibilityLocalizedString(@"stroke.fontsize.value");
      v30 = v44 = v22;
      v31 = NSNumber;
      [v25 pointSize];
      v32 = objc_msgSend(v31, "numberWithDouble:");
      v39 = objc_msgSend(v29, "stringWithFormat:", v30, v32);
      v40 = @"__AXStringForVariablesSentinel";
      v33 = __UIAXStringForVariables();

      v22 = v44;
      v21 = v45;
    }
    else
    {
      v33 = 0;
    }
    v41 = objc_msgSend(v27, "accessibilityLabel", v39, v40, v42, v43);
    uint64_t v34 = __UIAXStringForVariables();

    unint64_t v3 = (void *)v34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v35 = __UIAccessibilityCastAsClass();
    v36 = [v35 color];
    uint64_t v37 = AXColorStringForColor();

    unint64_t v3 = (void *)v37;
  }

  return v3;
}

- (id)accessibilityHint
{
  unint64_t v3 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)AKAnnotationLayerAccessibility;
    uint64_t v4 = [(AKAnnotationLayerAccessibility *)&v7 accessibilityHint];
  }
  else
  {
    uint64_t v4 = accessibilityLocalizedString(@"reposition.hint");
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  return 1;
}

- (void)_accessibilityZoomIn:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  v5 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  [v6 magnification];
  double v8 = -1.0;
  if (v3) {
    double v8 = 1.0;
  }
  objc_msgSend(v6, "setMagnification:", fmax(fmin(v8 + v7, 10.0), 0.0));
  id v9 = (id)[(AKAnnotationLayerAccessibility *)self safeValueForKey:@"updateContents"];
  v10 = NSString;
  uint64_t v11 = accessibilityLocalizedString(@"percent.zoom");
  v12 = AXFormatFloatWithPercentage();
  v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
}

- (id)accessibilityCustomActions
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v6 = accessibilityLocalizedString(@"annotation.action.expand");
    double v7 = (void *)[v5 initWithName:v6 target:self selector:sel__accessibilityExpandAnnotation];

    [v3 addObject:v7];
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    id v9 = accessibilityLocalizedString(@"annotation.action.shrink");
    v10 = (void *)[v8 initWithName:v9 target:self selector:sel__accessibilityShrinkAnnotation];

    [v3 addObject:v10];
  }

  return v3;
}

- (BOOL)_accessibilityExpandAnnotation
{
  BOOL v3 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [(AKAnnotationLayerAccessibility *)self _accessibilityMakeAnnotation:v3 larger:1];
  }

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShrinkAnnotation
{
  BOOL v3 = [(AKAnnotationLayerAccessibility *)self safeValueForKey:@"annotation"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [(AKAnnotationLayerAccessibility *)self _accessibilityMakeAnnotation:v3 larger:0];
  }

  return isKindOfClass & 1;
}

- (void)_accessibilityMakeAnnotation:(id)a3 larger:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 rectangle];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v11 = CGRectGetWidth(v16) / 10.0;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v17) / 10.0;
  if (v4) {
    double v13 = -v11;
  }
  else {
    double v13 = v11;
  }
  if (v4) {
    double v14 = -v12;
  }
  else {
    double v14 = v12;
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = CGRectInset(v18, v13, v14);
  objc_msgSend(v6, "setRectangle:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

  id v15 = (id)[(AKAnnotationLayerAccessibility *)self safeValueForKey:@"updateContents"];
}

@end