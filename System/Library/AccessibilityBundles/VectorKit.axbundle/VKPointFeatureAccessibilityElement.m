@interface VKPointFeatureAccessibilityElement
- ($1AB5FA073B851C12C2339EC22442E995)location;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isEqual:(id)a3;
- (CGRect)accessibilityFrame;
- (NSMutableArray)featureIds;
- (VKPointFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (double)_radius;
- (id)_distanceAwayString;
- (id)_poiTypeSuffix;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityPaths;
- (id)trueLabel;
- (int64_t)_accessibilityMapFeatureType;
- (void)setFeatureIds:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation VKPointFeatureAccessibilityElement

- (VKPointFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKPointFeatureAccessibilityElement;
  v5 = [(VKFeatureAccessibilityElement *)&v9 initWithAccessibilityContainer:v4];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    featureIds = v5->_featureIds;
    v5->_featureIds = v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VKPointFeatureAccessibilityElement *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(VKPointFeatureAccessibilityElement *)self location];
      double v7 = v6;
      [(VKPointFeatureAccessibilityElement *)v5 location];
      if (v7 != v8) {
        goto LABEL_11;
      }
      [(VKPointFeatureAccessibilityElement *)self location];
      double v10 = v9;
      [(VKPointFeatureAccessibilityElement *)v5 location];
      if (v10 != v11) {
        goto LABEL_11;
      }
      [(VKPointFeatureAccessibilityElement *)self location];
      double v13 = v12;
      [(VKPointFeatureAccessibilityElement *)v5 location];
      if (v13 != v14) {
        goto LABEL_11;
      }
      int v15 = [(VKFeatureAccessibilityElement *)self style];
      if (v15 != [(VKFeatureAccessibilityElement *)v5 style]) {
        goto LABEL_11;
      }
      v16 = [(VKPointFeatureAccessibilityElement *)self featureIds];
      v17 = [(VKPointFeatureAccessibilityElement *)v5 featureIds];
      char v18 = [v16 isEqualToArray:v17];

      if (v18)
      {
        v19 = [(VKPointFeatureAccessibilityElement *)self accessibilityLabel];
        v20 = [(VKPointFeatureAccessibilityElement *)v5 accessibilityLabel];
        char v21 = [v19 isEqualToString:v20];
      }
      else
      {
LABEL_11:
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityMapFeatureType
{
  if ([(VKFeatureAccessibilityElement *)self isPOI]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (double)_radius
{
  int64_t v2 = [(VKPointFeatureAccessibilityElement *)self _accessibilityMapFeatureType];
  double result = 40.0;
  if ((unint64_t)(v2 - 9) >= 4) {
    return 20.0;
  }
  return result;
}

- (id)accessibilityPath
{
  int64_t v2 = (void *)MEMORY[0x263F1C478];
  v3 = [(VKPointFeatureAccessibilityElement *)self accessibilityPaths];
  id v4 = [v3 objectAtIndex:0];
  v5 = [v2 bezierPathWithCGPath:v4];

  return v5;
}

- (id)accessibilityPaths
{
  v18[1] = *MEMORY[0x263EF8340];
  [(VKPointFeatureAccessibilityElement *)self accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VKPointFeatureAccessibilityElement *)self _radius];
  double v12 = v11;
  double v13 = (void *)MEMORY[0x263F1C478];
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  double MidX = CGRectGetMidX(v20);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  objc_msgSend(v13, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v21), v12, 0.0, 6.28318531);
  id v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = [v15 CGPath];
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

  return v16;
}

- (id)trueLabel
{
  v4.receiver = self;
  v4.super_class = (Class)VKPointFeatureAccessibilityElement;
  int64_t v2 = [(VKFeatureAccessibilityElement *)&v4 accessibilityLabel];

  return v2;
}

- (id)_poiTypeSuffix
{
  unint64_t v2 = [(VKPointFeatureAccessibilityElement *)self _accessibilityMapFeatureType] - 4;
  if (v2 <= 0x17 && ((0xDFFFFFu >> v2) & 1) != 0)
  {
    double v3 = AXVectorKitLocString(off_265162B48[v2]);
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)accessibilityLabel
{
  double v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityLabel", self);
  objc_super v4 = (id *)MEMORY[0x263F81160];
  double v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    CGFloat v6 = [*v4 objectForKeyedSubscript:v3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VKPointFeatureAccessibilityElement;
    CGFloat v6 = [(VKFeatureAccessibilityElement *)&v12 accessibilityLabel];
    double v7 = [(VKPointFeatureAccessibilityElement *)self _poiTypeSuffix];
    if (v7 && [v6 rangeOfString:v7] == 0x7FFFFFFFFFFFFFFFLL)
    {
      CGFloat v10 = v7;
      double v11 = @"__AXStringForVariablesSentinel";
      uint64_t v8 = __UIAXStringForVariables();

      CGFloat v6 = (void *)v8;
    }
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3, v10, v11);
  }

  return v6;
}

- (id)accessibilityIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)VKPointFeatureAccessibilityElement;
  unint64_t v2 = [(VKPointFeatureAccessibilityElement *)&v6 accessibilityIdentifier];
  double v3 = v2;
  if (!v2) {
    unint64_t v2 = @"VKPointFeature";
  }
  objc_super v4 = v2;

  return v4;
}

- (void)setLocation:(id)a3
{
  self->_location = ($83A9B0F16167884A9BDC45564D3E7367)a3;
  [(VKFeatureAccessibilityElement *)self _updateElementStatus];
}

- (id)_distanceAwayString
{
  return -[VKFeatureAccessibilityElement _distanceStringForPoint:](self, "_distanceStringForPoint:", self->_location.x, self->_location.y, self->_location.z);
}

- (CGRect)accessibilityFrame
{
  VKLocationCoordinate2DForVKPoint();
  double v4 = v3;
  double v6 = v5;
  double v7 = [(VKPointFeatureAccessibilityElement *)self accessibilityContainer];
  uint64_t v8 = [(VKPointFeatureAccessibilityElement *)self accessibilityContainer];
  objc_msgSend(v7, "convertCoordinate:toPointToLayer:", v8, v4, v6);

  double v9 = [(VKPointFeatureAccessibilityElement *)self accessibilityContainer];
  CGFloat v10 = [v9 accessibilityLayerHostingView];

  UIAccessibilityFrameForBounds();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)accessibilityActivate
{
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  double v7 = __59__VKPointFeatureAccessibilityElement_accessibilityActivate__block_invoke;
  uint64_t v8 = &unk_265162AD8;
  double v9 = self;
  AXPerformBlockOnMainThreadAfterDelay();
  v4.receiver = self;
  v4.super_class = (Class)VKPointFeatureAccessibilityElement;
  return [(VKPointFeatureAccessibilityElement *)&v4 accessibilityActivate];
}

void __59__VKPointFeatureAccessibilityElement_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) accessibilityContainer];
  int v2 = [v4 safeBoolForKey:@"accessibilityIsShowingCalloutAnnotationView"];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) accessibilityContainer];
    double v3 = [v5 safeValueForKey:@"accessibilityCalloutAnnotationView"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityDragSourceDescriptors
{
  v12[1] = *MEMORY[0x263EF8340];
  double v3 = [(VKPointFeatureAccessibilityElement *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v4 = objc_alloc(MEMORY[0x263F1C3B8]);
  id v5 = NSString;
  uint64_t v6 = AXVectorKitLocString(@"DRAG_POI");
  double v7 = [(VKPointFeatureAccessibilityElement *)self accessibilityLabel];
  uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  [(VKPointFeatureAccessibilityElement *)self accessibilityActivationPoint];
  UIAccessibilityPointToPoint();
  double v9 = objc_msgSend(v4, "initWithName:point:inView:", v8, v3);
  v12[0] = v9;
  CGFloat v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  return v10;
}

- ($1AB5FA073B851C12C2339EC22442E995)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  double z = self->_location.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (NSMutableArray)featureIds
{
  return self->_featureIds;
}

- (void)setFeatureIds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end