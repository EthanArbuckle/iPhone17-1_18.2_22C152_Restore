@interface VKMultiSectionFeatureAccessibilityElement
- (VKMultiSectionFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3 feature:(id)a4 ignoreMissingName:(BOOL)a5 useLocalizedLabels:(BOOL)a6;
- (int64_t)_accessibilityMapFeatureType;
- (void)_startUpdatingDescriptionForBuilding:(id)a3;
- (void)_updatePath;
@end

@implementation VKMultiSectionFeatureAccessibilityElement

- (VKMultiSectionFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3 feature:(id)a4 ignoreMissingName:(BOOL)a5 useLocalizedLabels:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKMultiSectionFeatureAccessibilityElement;
  v12 = [(VKFeatureAccessibilityElement *)&v14 initWithAccessibilityContainer:v10 feature:v11 ignoreMissingName:v7 useLocalizedLabels:v6];
  [(VKMultiSectionFeatureAccessibilityElement *)v12 _startUpdatingDescriptionForBuilding:v11];

  return v12;
}

- (int64_t)_accessibilityMapFeatureType
{
  return 3;
}

- (void)_updatePath
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [(VKFeatureAccessibilityElement *)self paths];
  [v3 removeAllObjects];

  [(VKFeatureAccessibilityElement *)self setHitTestPaths:0];
  v4 = (CGRect *)MEMORY[0x263F001A8];
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(VKFeatureAccessibilityElement *)self featureSet];
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v29 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(obj);
        }
        id v11 = [(VKFeatureAccessibilityElement *)self pointsFromFeatureWrapper:*(void *)(*((void *)&v34 + 1) + 8 * v10)];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v12 = v11;
        v13 = 0;
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v31;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v30 + 1) + 8 * v16) CGPointValue];
              double v19 = v17;
              double v20 = v18;
              if (v13)
              {
                objc_msgSend(v13, "addLineToPoint:", v17, v18);
              }
              else
              {
                v13 = objc_opt_new();
                objc_msgSend(v13, "moveToPoint:", v19, v20);
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v14);
        }

        [v13 closePath];
        id v21 = v13;
        v22 = (const CGPath *)[v21 CGPath];
        if (v22)
        {
          v23 = [(VKFeatureAccessibilityElement *)self paths];
          [v23 addObject:v22];

          PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(v22);
          CGFloat x = PathBoundingBox.origin.x;
          CGFloat y = PathBoundingBox.origin.y;
          CGFloat width = PathBoundingBox.size.width;
          CGFloat height = PathBoundingBox.size.height;
          v44.origin.CGFloat x = v5;
          v44.origin.CGFloat y = v6;
          v44.size.CGFloat width = v7;
          v44.size.CGFloat height = v8;
          if (CGRectEqualToRect(*v4, v44))
          {
            double v5 = x;
            double v6 = y;
            double v7 = width;
            double v8 = height;
          }
          else
          {
            v42.origin.CGFloat x = v5;
            v42.origin.CGFloat y = v6;
            v42.size.CGFloat width = v7;
            v42.size.CGFloat height = v8;
            v45.origin.CGFloat x = x;
            v45.origin.CGFloat y = y;
            v45.size.CGFloat width = width;
            v45.size.CGFloat height = height;
            CGRect v43 = CGRectUnion(v42, v45);
            double v5 = v43.origin.x;
            double v6 = v43.origin.y;
            double v7 = v43.size.width;
            double v8 = v43.size.height;
          }
        }

        ++v10;
      }
      while (v10 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  [(VKFeatureAccessibilityElement *)self _mergePaths];
  -[VKMultiSectionFeatureAccessibilityElement setAccessibilityFrame:](self, "setAccessibilityFrame:", v5, v6, v7, v8);
  [(VKFeatureAccessibilityElement *)self _updateElementStatus];
}

- (void)_startUpdatingDescriptionForBuilding:(id)a3
{
  id v4 = a3;
  double v5 = [(VKFeatureAccessibilityElement *)self featureSet];
  if (![v5 count]) {
    goto LABEL_4;
  }
  v19.receiver = self;
  v19.super_class = (Class)VKMultiSectionFeatureAccessibilityElement;
  double v6 = [(VKFeatureAccessibilityElement *)&v19 accessibilityLabel];

  if (!v6)
  {
    double v7 = (float *)GEOMultiSectionFeatureBounds();
    double v8 = [v4 feature];
    uint64_t v9 = [v8 containingTile];
    [v9 geoTileKey];

    VKWorldBoundsFromGEOTileKey();
    AXVKPointForTileGLPoint(v10, v11, v12, v13, (float)(*v7 + v7[2]) * 0.5);
    VKLocationCoordinate2DForVKPoint();
    double v5 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v14 longitude:v15];
    id v16 = objc_alloc_init(MEMORY[0x263F00A40]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __82__VKMultiSectionFeatureAccessibilityElement__startUpdatingDescriptionForBuilding___block_invoke;
    v18[3] = &unk_265162B00;
    v18[4] = self;
    double v17 = (void *)MEMORY[0x245668F10](v18);
    [v16 reverseGeocodeLocation:v5 completionHandler:v17];
    [(VKMultiSectionFeatureAccessibilityElement *)self _accessibilitySetRetainedValue:v16 forKey:@"CLGeocoder"];

LABEL_4:
  }
}

void __82__VKMultiSectionFeatureAccessibilityElement__startUpdatingDescriptionForBuilding___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 firstObject];
  double v6 = *(void **)(a1 + 32);
  id v11 = (id)v5;
  if (a3 || !v5)
  {
    [v6 _accessibilityRemoveValueForKey:@"CLGeocoder"];
  }
  else
  {
    double v7 = [v6 _accessibilityShortAddress:v5 alwaysIncludeLocality:0];
    double v8 = v7;
    if (!v7 || ![v7 length])
    {
      uint64_t v9 = [v11 formattedAddressLines];
      uint64_t v10 = [v9 componentsJoinedByString:@"\n"];

      double v8 = (void *)v10;
    }
    [*(id *)(a1 + 32) setAccessibilityLabel:v8];
  }
}

@end