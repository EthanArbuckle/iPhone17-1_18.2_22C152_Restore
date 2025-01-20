@interface UIView(MapKitExtras)
- (double)_mapkit_doubleFrame;
- (id)_findNearestViewController;
- (id)_mapKit_mapView;
- (id)_mapkit_currentLayer;
- (uint64_t)_mapkit_countOfSet:()MapKitExtras minusSubset:;
@end

@implementation UIView(MapKitExtras)

- (id)_mapKit_mapView
{
  v1 = [a1 layer];
  v2 = objc_msgSend(v1, "_mapKit_mapLayer");

  if (v2)
  {
    uint64_t Delegate = CALayerGetDelegate();
    if (Delegate)
    {
      v4 = (void *)Delegate;
      if (!MKIsMKView__viewClass) {
        MKIsMKView__viewClass = objc_opt_class();
      }
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_mapkit_currentLayer
{
  v2 = [a1 layer];
  v3 = [v2 presentationLayer];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [a1 layer];
  }
  v5 = v4;

  return v5;
}

- (uint64_t)_mapkit_countOfSet:()MapKitExtras minusSubset:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    uint64_t v8 = 0;
  }
  else
  {
    v9 = (void *)[v5 mutableCopy];
    [v9 minusSet:v6];
    uint64_t v8 = [v9 count];
  }
  return v8;
}

- (double)_mapkit_doubleFrame
{
  v1 = [a1 layer];
  [v1 doubleBounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [v1 superlayer];

  if (v10)
  {
    v11 = [v1 superlayer];
    objc_msgSend(v1, "convertDoubleRect:toLayer:", v11, v3, v5, v7, v9);
    double v3 = v12;
  }
  return v3;
}

- (id)_findNearestViewController
{
  id v1 = a1;
  while (1)
  {
    double v2 = [MEMORY[0x1E4F42FF8] viewControllerForView:v1];
    if (v2) {
      break;
    }
    double v3 = [v1 superview];

    if (v3)
    {
      objc_opt_class();
      id v1 = v3;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        continue;
      }
    }
    goto LABEL_7;
  }
  double v3 = v1;
LABEL_7:

  return v2;
}

@end