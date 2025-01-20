@interface AKPolygonAdornmentLayer
- (BOOL)needsUpdateWhenDraggingStartsOrEnds;
- (void)updateAdornmentElements;
- (void)updateSublayersWithScale:(double)a3;
@end

@implementation AKPolygonAdornmentLayer

- (BOOL)needsUpdateWhenDraggingStartsOrEnds
{
  return 1;
}

- (void)updateAdornmentElements
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v3 = [(AKPolygonAdornmentLayer *)self sublayers];
  v4 = (AKEllipseLayer *)[v3 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v43;
    while (2)
    {
      for (i = 0; i != v4; i = (AKEllipseLayer *)((char *)i + 1))
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (AKEllipseLayer *)[v3 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v8 = [(AKAdornmentLayer *)self annotation];
  if ([(AKAdornmentLayer *)self currentlyDraggedArea] == 17)
  {
    if (!v4)
    {
      v4 = objc_alloc_init(AKEllipseLayer);
      [v8 rectangle];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      +[AKPolygonPointOfInterestHelper pointsControlPointDistanceFactor];
      double v18 = v17;
      v48.origin.double x = v10;
      v48.origin.double y = v12;
      v48.size.double width = v14;
      v48.size.double height = v16;
      double v19 = v18 * CGRectGetWidth(v48);
      +[AKPolygonPointOfInterestHelper pointsControlPointDistanceFactor];
      double v21 = v20;
      v49.origin.double x = v10;
      v49.origin.double y = v12;
      v49.size.double width = v14;
      v49.size.double height = v16;
      double v22 = v21 * CGRectGetHeight(v49);
      v50.origin.double x = v10;
      v50.origin.double y = v12;
      v50.size.double width = v14;
      v50.size.double height = v16;
      CGFloat v23 = (CGRectGetWidth(v50) - v19) * 0.5;
      v51.origin.double x = v10;
      v51.origin.double y = v12;
      v51.size.double width = v14;
      v51.size.double height = v16;
      CGFloat v24 = (CGRectGetHeight(v51) - v22) * 0.5;
      v52.origin.double x = v10;
      v52.origin.double y = v12;
      v52.size.double width = v14;
      v52.size.double height = v16;
      CGRect v53 = CGRectInset(v52, v23, v24);
      double x = v53.origin.x;
      double y = v53.origin.y;
      double width = v53.size.width;
      double height = v53.size.height;
      v29 = [(AKAdornmentLayer *)self pageController];
      v30 = [v29 geometryHelper];
      objc_msgSend(v30, "convertRect:fromModelToLayer:", self, x, y, width, height);
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;

      double v39 = *(double *)&qword_268922C10;
      [(AKAdornmentLayer *)self currentScaleFactor];
      [(AKEllipseLayer *)v4 setLineWidth:v39 / v40];
      -[AKEllipseLayer setFrame:](v4, "setFrame:", v32, v34, v36, v38);
      [(AKPolygonAdornmentLayer *)self addSublayer:v4];
    }
  }
  else
  {
    [(AKEllipseLayer *)v4 removeFromSuperlayer];
  }
  v41.receiver = self;
  v41.super_class = (Class)AKPolygonAdornmentLayer;
  [(AKAdornmentLayer *)&v41 updateAdornmentElements];
  [MEMORY[0x263F158F8] commit];
}

- (void)updateSublayersWithScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AKPolygonAdornmentLayer *)self sublayers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v6 setLineWidth:*(double *)&qword_268922C10 / a3];
  v10.receiver = self;
  v10.super_class = (Class)AKPolygonAdornmentLayer;
  [(AKAdornmentLayer *)&v10 updateSublayersWithScale:a3];
}

@end