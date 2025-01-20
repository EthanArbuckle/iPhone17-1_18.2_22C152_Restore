@interface _UIStackedImageContainerLayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_accessibilityLayerHostingView;
@end

@implementation _UIStackedImageContainerLayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStackedImageContainerLayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"_UIStackedImageContainerLayer" hasInstanceVariable:@"_scale" withType:"d"];
  [location[0] validateClass:@"_UIStackedImageContainerLayer" hasInstanceVariable:@"_imageLayersContainer" withType:"CALayer"];
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  v47 = self;
  v46[1] = (id)a2;
  v46[0] = -[_UIStackedImageContainerLayerAccessibility _accessibilityLayerHostingView](self);
  long long v48 = 0u;
  long long v49 = 0u;
  if (v46[0])
  {
    [v46[0] accessibilityFrame];
    double v42 = v2;
    double v43 = v3;
    double v44 = v4;
    double v45 = v5;
    id v25 = (id)[(_UIStackedImageContainerLayerAccessibility *)v47 safeValueForKey:@"_scale"];
    [v25 floatValue];
    double v26 = v6;

    double v41 = v26;
    double v7 = v26;
    if (v26 < 1.0)
    {
      double v7 = 1.0;
      double v41 = 1.0;
    }
    id v40 = (id)objc_msgSend(v46[0], "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_58, 1, v7);
    double v39 = 0.0;
    if (v40) {
      double v24 = 1.0;
    }
    else {
      double v24 = v41;
    }
    double v39 = v24;
    *(double *)&long long v49 = v44 * v24;
    *((double *)&v49 + 1) = v45 * v41;
    *(double *)&long long v48 = v42 - (v44 * v24 - v44) / 2.0;
    *((double *)&v48 + 1) = v43 - (v45 * v41 - v45) / 2.0;
    id location = (id)[(_UIStackedImageContainerLayerAccessibility *)v47 valueForKey:@"_imageLayersContainer"];
    if (location)
    {
      [location frame];
      double v34 = v8;
      uint64_t v35 = v9;
      uint64_t v36 = v10;
      uint64_t v37 = v11;
      *(double *)&long long v48 = *(double *)&v48 + v8;
      [location frame];
      uint64_t v30 = v12;
      double v31 = v13;
      uint64_t v32 = v14;
      uint64_t v33 = v15;
      *((double *)&v48 + 1) = *((double *)&v48 + 1) + v13;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    v27.receiver = v47;
    v27.super_class = (Class)_UIStackedImageContainerLayerAccessibility;
    [(_UIStackedImageContainerLayerAccessibility *)&v27 accessibilityFrame];
    *(void *)&long long v28 = v16;
    *((void *)&v28 + 1) = v17;
    *(void *)&long long v29 = v18;
    *((void *)&v29 + 1) = v19;
    long long v48 = v28;
    long long v49 = v29;
  }
  objc_storeStrong(v46, 0);
  double v21 = *((double *)&v48 + 1);
  double v20 = *(double *)&v48;
  double v23 = *((double *)&v49 + 1);
  double v22 = *(double *)&v49;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)_accessibilityLayerHostingView
{
  v11[1] = a1;
  if (a1)
  {
    v11[0] = 0;
    char v9 = 0;
    objc_opt_class();
    id v8 = (id)__UIAccessibilityCastAsClass();
    id v7 = v8;
    objc_storeStrong(&v8, 0);
    id v10 = v7;
    do
    {
      if (!v10) {
        break;
      }
      id obj = (id)[v10 delegate];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong(v11, obj);
        int v5 = 3;
      }
      else
      {
        id v1 = (id)[v10 superlayer];
        id v2 = v10;
        id v10 = v1;

        int v5 = 0;
      }
      objc_storeStrong(&obj, 0);
    }
    while (!v5);
    id v12 = v11[0];
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
  else
  {
    id v12 = 0;
  }
  double v3 = v12;

  return v3;
}

@end