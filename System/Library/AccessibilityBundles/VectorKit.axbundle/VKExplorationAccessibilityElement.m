@interface VKExplorationAccessibilityElement
- (AXVKExplorationVertexElement)vertex;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isCurrent;
- (BOOL)isExplorationElement;
- (CGRect)accessibilityFrame;
- (VKExplorationAccessibilityElement)initWithAccessibilityContainer:(id)a3 andVertex:(id)a4;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityPaths;
- (void)setIsExplorationElement:(BOOL)a3;
- (void)setVertex:(id)a3;
@end

@implementation VKExplorationAccessibilityElement

- (BOOL)isCurrent
{
  v2 = [(VKExplorationAccessibilityElement *)self vertex];
  char v3 = [v2 isCurrent];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if (![(VKExplorationAccessibilityElement *)self isCurrent]) {
    return 1;
  }
  char v3 = [(VKExplorationAccessibilityElement *)self vertex];
  if ([v3 isComputed])
  {
    v4 = [(VKExplorationAccessibilityElement *)self vertex];
    v5 = [v4 roads];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)accessibilityLabel
{
  if ([(VKExplorationAccessibilityElement *)self isCurrent])
  {
    char v3 = [(VKExplorationAccessibilityElement *)self vertex];
    v4 = [v3 roads];
    if ([v4 count])
    {
      v5 = [(VKExplorationAccessibilityElement *)self vertex];
      char v6 = [v5 isComputed];

      if (v6)
      {
        v7 = NSString;
        v8 = AXVectorKitLocString(@"INTERSECTION_INFO_FORMAT");
        v9 = [(VKExplorationAccessibilityElement *)self vertex];
        v10 = [v9 edges];
        uint64_t v11 = [v10 count];
        v12 = [(VKExplorationAccessibilityElement *)self vertex];
        v13 = [v12 accessibilityLabel];
        v14 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v11, v13);

        goto LABEL_19;
      }
    }
    else
    {
    }
    v14 = 0;
    goto LABEL_21;
  }
  v15 = [(VKExplorationAccessibilityElement *)self accessibilityContainer];
  v16 = [v15 accessibilityElementManager];
  v17 = [v16 currentExplorationVertex];

  if (v17)
  {
    v18 = [(VKExplorationAccessibilityElement *)self accessibilityContainer];
    [v18 accessibilityYaw];
    double v20 = v19;

    double v21 = v20 + 360.0;
    if (v20 >= 0.0) {
      double v21 = v20;
    }
    if (v21 >= 0.0) {
      double v22 = v21;
    }
    else {
      double v22 = v21 + 360.0;
    }
    v23 = [(VKExplorationAccessibilityElement *)self vertex];
    [v23 getScreenPoint];
    CGFloat v25 = v24;
    double v27 = v26;

    v28 = [(VKExplorationAccessibilityElement *)self accessibilityContainer];
    v29 = [v28 accessibilityElementManager];
    v30 = [v29 currentExplorationVertex];
    [v30 getScreenPoint];
    CGFloat v32 = v31;
    double v34 = v33;

    v51.y = -v27;
    v52.y = -v34;
    double v48 = 0.0;
    double v49 = 0.0;
    v51.x = v25;
    v52.x = v32;
    AXVKMathGetVectorAndDistanceForPoints(&v49, &v48, v51, v52);
    double v35 = v22 + 360.0 - v49 + dbl_2426CBC50[360.0 - v49 >= 270.0];
    if (v35 > 360.0) {
      double v35 = v35 + -360.0;
    }
    double v49 = v35;
    v8 = AXDescriptionForHeadingInDegrees();
    v36 = [(VKExplorationAccessibilityElement *)self vertex];
    v37 = [(VKExplorationAccessibilityElement *)self accessibilityContainer];
    v38 = [v37 accessibilityElementManager];
    v39 = [v38 currentExplorationVertex];
    v40 = [v36 connectingRoadWith:v39];
    v41 = [v40 trueLabel];

    if (![v41 length])
    {
      uint64_t v42 = AXVectorKitLocString(@"UNNAMED_ROAD");

      v41 = (void *)v42;
    }
    v43 = NSString;
    v44 = AXVectorKitLocString(@"MOVE_ON_FORMAT");
    v14 = objc_msgSend(v43, "stringWithFormat:", v44, v8, v41);

    goto LABEL_20;
  }
  v45 = NSString;
  v8 = AXVectorKitLocString(@"MOVE_TO_FORMAT");
  v9 = [(VKExplorationAccessibilityElement *)self vertex];
  v46 = [v9 accessibilityLabel];
  v14 = objc_msgSend(v45, "stringWithFormat:", v8, v46);

LABEL_19:
LABEL_20:

LABEL_21:

  return v14;
}

- (id)accessibilityPath
{
  v2 = (void *)MEMORY[0x263F1C478];
  char v3 = [(VKExplorationAccessibilityElement *)self accessibilityPaths];
  v4 = [v3 objectAtIndex:0];
  v5 = [v2 bezierPathWithCGPath:v4];

  return v5;
}

- (id)accessibilityPaths
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(VKExplorationAccessibilityElement *)self isCurrent]) {
    goto LABEL_14;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  char v3 = [(VKExplorationAccessibilityElement *)self vertex];
  v4 = [v3 neighbors];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (!v5)
  {

LABEL_14:
    [(VKExplorationAccessibilityElement *)self accessibilityFrame];
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    double v26 = (void *)MEMORY[0x263F1C478];
    double MidX = CGRectGetMidX(v39);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    objc_msgSend(v26, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v40), 30.0, 0.0, 6.28318531);
    id v28 = objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v28 CGPath];
    char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];

    goto LABEL_15;
  }
  char v6 = 0;
  uint64_t v7 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(AXVKExplorationVertexElement **)(*((void *)&v30 + 1) + 8 * i);
      if ([(AXVKExplorationVertexElement *)v9 isCurrent])
      {
        [(AXVKExplorationVertexElement *)v9 getScreenPoint];
        double v11 = v10;
        double v13 = v12;
        v14 = [(VKExplorationAccessibilityElement *)self vertex];
        double v15 = AXVKGetWalkingDirectionBetweenVertices(v9, v14);

        v16 = [MEMORY[0x263F1C478] bezierPath];
        double v17 = v15 * 0.0174532925 + 3.14159265;
        double v18 = v17 + -0.261799388;
        double v19 = v17 + 0.261799388;
        objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v11, v13, 1000.0, v17 + -0.261799388, v17 + 0.261799388);
        objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v13, 30.0, v19, v18);
        [v16 closePath];
        id v20 = v16;
        uint64_t v35 = [v20 CGPath];
        uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];

        char v6 = (void *)v21;
      }
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_14;
  }
LABEL_15:

  return v6;
}

- (CGRect)accessibilityFrame
{
  char v3 = [(VKExplorationAccessibilityElement *)self vertex];
  [v3 getScreenPoint];

  v4 = [(VKExplorationAccessibilityElement *)self accessibilityContainer];
  uint64_t v5 = [v4 accessibilityLayerHostingView];

  UIAccessibilityFrameForBounds();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (VKExplorationAccessibilityElement)initWithAccessibilityContainer:(id)a3 andVertex:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKExplorationAccessibilityElement;
  double v8 = [(VKExplorationAccessibilityElement *)&v11 initWithAccessibilityContainer:a3];
  double v9 = v8;
  if (v8)
  {
    v8->_isExplorationElement = 1;
    objc_storeStrong((id *)&v8->_vertex, a4);
  }

  return v9;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(VKExplorationAccessibilityElement *)self isCurrent];
  if (!v3)
  {
    v4 = [(VKExplorationAccessibilityElement *)self accessibilityContainer];
    uint64_t v5 = [v4 accessibilityElementManager];
    double v6 = [(VKExplorationAccessibilityElement *)self vertex];
    [v5 accessibilityMapsExplorationContinueWithVertex:v6];
  }
  return !v3;
}

- (AXVKExplorationVertexElement)vertex
{
  return self->_vertex;
}

- (void)setVertex:(id)a3
{
}

- (BOOL)isExplorationElement
{
  return self->_isExplorationElement;
}

- (void)setIsExplorationElement:(BOOL)a3
{
  self->_isExplorationElement = a3;
}

- (void).cxx_destruct
{
}

@end