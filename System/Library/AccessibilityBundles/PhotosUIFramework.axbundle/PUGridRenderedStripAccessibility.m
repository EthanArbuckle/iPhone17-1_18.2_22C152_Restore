@interface PUGridRenderedStripAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)_axClearData;
- (void)_axGenerateIsElement:(id)a3;
- (void)_axGenerateLabel:(id)a3;
- (void)_axInitializeDataForElement;
- (void)_render;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation PUGridRenderedStripAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUGridRenderedStrip";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axClearData
{
  [(PUGridRenderedStripAccessibility *)self setAccessibilityLabel:0];

  [(PUGridRenderedStripAccessibility *)self _accessibilityRemoveValueForKey:@"IsAXElementSet"];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUGridRenderedStripAccessibility;
  [(PUGridRenderedStripAccessibility *)&v3 layoutSubviews];
  [(PUGridRenderedStripAccessibility *)self _axClearData];
}

- (void)_render
{
  v3.receiver = self;
  v3.super_class = (Class)PUGridRenderedStripAccessibility;
  [(PUGridRenderedStripAccessibility *)&v3 _render];
  [(PUGridRenderedStripAccessibility *)self _axClearData];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  if ([(PUGridRenderedStripAccessibility *)self isAccessibilityElement]
    && (UIAccessibilityPointForPoint(),
        CGFloat v6 = v5,
        CGFloat v8 = v7,
        [(PUGridRenderedStripAccessibility *)self accessibilityFrame],
        v12.x = v6,
        v12.y = v8,
        CGRectContainsPoint(v13, v12)))
  {
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_axGenerateLabel:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 indexOfObject:self];
  if (v4 < 0)
  {
LABEL_6:
    v9 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    while (1)
    {
      CGFloat v6 = [v14 objectAtIndex:v5];
      NSClassFromString(&cfstr_Pxphotossectio.isa);
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      if (v5-- <= 0) {
        goto LABEL_6;
      }
    }
    v10 = [v14 objectAtIndex:v5];
    v9 = [v10 accessibilityLabel];
  }
  if ([v9 length])
  {
    v11 = NSString;
    uint64_t v12 = accessibilityPULocalizedString(@"small.photos.group.with.title");
    CGRect v13 = objc_msgSend(v11, "stringWithFormat:", v12, v9);

    v9 = (void *)v12;
  }
  else
  {
    CGRect v13 = accessibilityPULocalizedString(@"small.photos.group");
  }

  [(PUGridRenderedStripAccessibility *)self setAccessibilityLabel:v13];
}

- (void)_axGenerateIsElement:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 indexOfObject:self];
  uint64_t v5 = v4;
  if (v4 < 1)
  {
    uint64_t v7 = v4;
    goto LABEL_14;
  }
  uint64_t v6 = v4 + 1;
  uint64_t v7 = v4;
  while (1)
  {
    CGFloat v8 = [v11 objectAtIndex:v6 - 2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (([v8 isHidden] & 1) == 0 && objc_msgSend(v8, "isAccessibilityElement")) {
        uint64_t v7 = v6 - 2;
      }
      goto LABEL_10;
    }
    NSClassFromString(&cfstr_Pxphotossectio.isa);
    if (objc_opt_isKindOfClass())
    {
      v9 = [v8 accessibilityLabel];
      uint64_t v10 = [v9 length];

      if (v10) {
        break;
      }
    }
LABEL_10:

    if ((unint64_t)--v6 <= 1) {
      goto LABEL_14;
    }
  }

LABEL_14:
  [(PUGridRenderedStripAccessibility *)self setIsAccessibilityElement:v7 == v5];
  [(PUGridRenderedStripAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"IsAXElementSet"];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"AXPhotoCollectionViewScrolled" object:0];

  v4.receiver = self;
  v4.super_class = (Class)PUGridRenderedStripAccessibility;
  [(PUGridRenderedStripAccessibility *)&v4 dealloc];
}

- (void)_axInitializeDataForElement
{
  if ([(PUGridRenderedStripAccessibility *)self _accessibilityBoolValueForKey:@"AXDidRegister"])
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__axClearData name:@"AXPhotoCollectionViewScrolled" object:0];

    [(PUGridRenderedStripAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AXDidRegister"];
  }
  objc_super v4 = [(PUGridRenderedStripAccessibility *)self superview];
  uint64_t v5 = [v4 subviews];

  uint64_t v6 = [v5 sortedArrayUsingSelector:sel__accessibilitySimpleSort_];

  [(PUGridRenderedStripAccessibility *)self _axGenerateIsElement:v6];
  v7.receiver = self;
  v7.super_class = (Class)PUGridRenderedStripAccessibility;
  if ([(PUGridRenderedStripAccessibility *)&v7 isAccessibilityElement]) {
    [(PUGridRenderedStripAccessibility *)self _axGenerateLabel:v6];
  }
}

- (BOOL)isAccessibilityElement
{
  if ([(PUGridRenderedStripAccessibility *)self _accessibilityBoolValueForKey:@"IsAXElementSet"])
  {
    v8.receiver = self;
    v8.super_class = (Class)PUGridRenderedStripAccessibility;
    return [(PUGridRenderedStripAccessibility *)&v8 isAccessibilityElement];
  }
  else if ([(PUGridRenderedStripAccessibility *)self isHidden])
  {
    return 0;
  }
  else
  {
    objc_super v4 = [(PUGridRenderedStripAccessibility *)self superview];
    uint64_t v5 = [v4 subviews];

    if ([v5 indexOfObject:self] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v3 = 0;
    }
    else
    {
      [(PUGridRenderedStripAccessibility *)self _axInitializeDataForElement];
      v7.receiver = self;
      v7.super_class = (Class)PUGridRenderedStripAccessibility;
      BOOL v3 = [(PUGridRenderedStripAccessibility *)&v7 isAccessibilityElement];
    }
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  BOOL v3 = [(PUGridRenderedStripAccessibility *)self superview];
  objc_super v4 = [v3 subviews];

  uint64_t v5 = [v4 sortedArrayUsingSelector:sel__accessibilitySimpleSort_];

  uint64_t v6 = [v5 indexOfObject:self];
  [(PUGridRenderedStripAccessibility *)self frame];
  CGFloat x = v7;
  CGFloat y = v9;
  CGFloat width = v11;
  CGFloat height = v13;
  uint64_t v15 = [v5 count];
  if (v6 < v15)
  {
    uint64_t v16 = v15;
    do
    {
      v17 = [v5 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v17 isHidden] & 1) == 0)
        {
          [v17 frame];
          v38.origin.CGFloat x = v18;
          v38.origin.CGFloat y = v19;
          v38.size.CGFloat width = v20;
          v38.size.CGFloat height = v21;
          v33.origin.CGFloat x = x;
          v33.origin.CGFloat y = y;
          v33.size.CGFloat width = width;
          v33.size.CGFloat height = height;
          CGRect v34 = CGRectUnion(v33, v38);
          CGFloat x = v34.origin.x;
          CGFloat y = v34.origin.y;
          CGFloat width = v34.size.width;
          CGFloat height = v34.size.height;
        }
      }
      else
      {
        NSClassFromString(&cfstr_Pxphotossectio.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v17 accessibilityLabel],
              v22 = objc_claimAutoreleasedReturnValue(),
              uint64_t v23 = [v22 length],
              v22,
              v23))
        {

          break;
        }
      }
      ++v6;
    }
    while (v16 != v6);
  }
  v24 = [(PUGridRenderedStripAccessibility *)self superview];
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = UIAccessibilityConvertFrameToScreenCoordinates(v35, v24);
  CGFloat v25 = v36.origin.x;
  CGFloat v26 = v36.origin.y;
  CGFloat v27 = v36.size.width;
  CGFloat v28 = v36.size.height;

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)PUGridRenderedStripAccessibility;
  BOOL v3 = [(PUGridRenderedStripAccessibility *)&v9 accessibilityLabel];

  if (v3)
  {
    objc_super v8 = self;
    objc_super v4 = &v8;
  }
  else
  {
    [(PUGridRenderedStripAccessibility *)self _axInitializeDataForElement];
    double v7 = self;
    objc_super v4 = &v7;
  }
  v4[1] = (PUGridRenderedStripAccessibility *)PUGridRenderedStripAccessibility;
  uint64_t v5 = objc_msgSendSuper2((objc_super *)v4, sel_accessibilityLabel, v7);

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityPULocalizedString(@"small.photos.group.hint");
}

@end