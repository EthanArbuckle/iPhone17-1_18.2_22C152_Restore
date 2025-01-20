@interface AKBoxAdornmentLayer
- (BOOL)_drawsBorderForAnnotation:(id)a3;
- (CGRect)_rectangleForAnnotation:(id)a3;
- (void)updateAdornmentElements;
- (void)updateSublayersWithScale:(double)a3;
@end

@implementation AKBoxAdornmentLayer

- (void)updateAdornmentElements
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v3 = [(AKBoxAdornmentLayer *)self sublayers];
  v4 = (AKBoxLayer *)[v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v4; i = (AKBoxLayer *)((char *)i + 1))
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v4 = v7;
          [(AKBoxLayer *)v4 removeFromSuperlayer];
          goto LABEL_11;
        }
      }
      v4 = (AKBoxLayer *)[v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v8 = [(AKAdornmentLayer *)self annotation];
  BOOL v9 = [(AKBoxAdornmentLayer *)self _drawsBorderForAnnotation:v8];

  if (v9)
  {
    if (!v4)
    {
      v10 = [(AKAdornmentLayer *)self annotation];
      v11 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        double v13 = 2.3;
      }
      else {
        double v13 = 0.0;
      }
      if (isKindOfClass) {
        double v14 = 3.0;
      }
      else {
        double v14 = *(double *)&qword_268923788;
      }
      v4 = [[AKBoxLayer alloc] initWithBorderWidth:v14 cornerRadius:v13];
    }
    v15 = [(AKAdornmentLayer *)self annotation];
    [(AKBoxAdornmentLayer *)self _rectangleForAnnotation:v15];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    v44.origin.x = v17;
    v44.origin.y = v19;
    v44.size.width = v21;
    v44.size.height = v23;
    double Width = CGRectGetWidth(v44);
    v45.origin.x = v17;
    v45.origin.y = v19;
    v45.size.width = v21;
    v45.size.height = v23;
    -[AKBoxLayer setBounds:](v4, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v45));
    v46.origin.x = v17;
    v46.origin.y = v19;
    v46.size.width = v21;
    v46.size.height = v23;
    double MidX = CGRectGetMidX(v46);
    v47.origin.x = v17;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    -[AKBoxLayer setPosition:](v4, "setPosition:", MidX, CGRectGetMidY(v47));
    [(AKBoxAdornmentLayer *)self addSublayer:v4];
  }
  v26 = [(AKAdornmentLayer *)self annotation];
  int v27 = [v26 conformsToAKRotatableAnnotationProtocol];

  if (v27)
  {
    long long v32 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x263F000D0];
    long long v31 = *(_OWORD *)&v37.a;
    *(_OWORD *)&v37.c = v32;
    *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v30 = *(_OWORD *)&v37.tx;
    v28 = [(AKAdornmentLayer *)self annotation];
    [v28 rotationAngle];
    CGAffineTransformMakeRotation(&t2, v29);
    *(_OWORD *)&t1.a = v31;
    *(_OWORD *)&t1.c = v32;
    *(_OWORD *)&t1.tx = v30;
    CGAffineTransformConcat(&v37, &t1, &t2);

    CGAffineTransform v34 = v37;
    [(AKBoxLayer *)v4 setAffineTransform:&v34];
  }
  v33.receiver = self;
  v33.super_class = (Class)AKBoxAdornmentLayer;
  [(AKAdornmentLayer *)&v33 updateAdornmentElements];
  [MEMORY[0x263F158F8] commit];
}

- (void)updateSublayersWithScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AKBoxAdornmentLayer *)self sublayers];
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
        BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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

  [v6 setBorderWidthScale:a3];
  v10.receiver = self;
  v10.super_class = (Class)AKBoxAdornmentLayer;
  [(AKAdornmentLayer *)&v10 updateSublayersWithScale:a3];
}

- (BOOL)_drawsBorderForAnnotation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 0;
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      id v6 = [v5 fillColor];
      if (!v6)
      {
        uint64_t v7 = [v5 strokeColor];
        if (v7)
        {
          [v5 strokeWidth];
          char isKindOfClass = v8 <= 0.0;
        }
        else
        {
          char isKindOfClass = 1;
        }
        goto LABEL_15;
      }
    }
    else
    {
      if (![v3 isMemberOfClass:objc_opt_class()])
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_17;
      }
      id v5 = v3;
      id v6 = [v5 annotationText];
      if (v6)
      {
        uint64_t v7 = [v5 annotationText];
        char isKindOfClass = [v7 length] != 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char isKindOfClass = 0;
LABEL_16:

    goto LABEL_17;
  }
  char isKindOfClass = 1;
LABEL_17:

  return isKindOfClass & 1;
}

- (CGRect)_rectangleForAnnotation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  double x = *MEMORY[0x263F001A8];
  double y = *(double *)(MEMORY[0x263F001A8] + 8);
  double width = *(double *)(MEMORY[0x263F001A8] + 16);
  double height = *(double *)(MEMORY[0x263F001A8] + 24);
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v4, 0, x, y, width, height);
    uint64_t v57 = v56;
    uint64_t v59 = v58;
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v4 originalExifOrientation]))
    {
      CGFloat v22 = -1.0;
      CGFloat v23 = -5.0;
    }
    else
    {
      CGFloat v22 = -5.0;
      CGFloat v23 = -1.0;
    }
    uint64_t v18 = v57;
    uint64_t v19 = v59;
    uint64_t v20 = v61;
    uint64_t v21 = v63;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_3:
    [v4 rectangle];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    long long v13 = [(AKAdornmentLayer *)self annotation];
    +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:v13];
    double v15 = v14;
    double v17 = v16;

    uint64_t v18 = v6;
    uint64_t v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    CGFloat v22 = v15;
    CGFloat v23 = v17;
LABEL_4:
    CGRect v64 = CGRectInset(*(CGRect *)&v18, v22, v23);
    double x = v64.origin.x;
    double y = v64.origin.y;
    double width = v64.size.width;
    double height = v64.size.height;
  }
  v28 = [(AKAdornmentLayer *)self pageController];
  CGFloat v29 = [v28 geometryHelper];
  objc_msgSend(v29, "contentAlignedRectForRect:", x, y, width, height);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  if (!+[AKGeometryHelper annotationHasRotation:v4 outAngle:0])
  {
    long long v38 = [v28 geometryHelper];
    objc_msgSend(v38, "screenPixelAlignedRectForRect:", v31, v33, v35, v37);
    double v31 = v39;
    double v33 = v40;
    double v35 = v41;
    double v37 = v42;
  }
  uint64_t v43 = [v28 geometryHelper];
  objc_msgSend(v43, "convertRect:fromModelToLayer:", self, v31, v33, v35, v37);
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  double v52 = v45;
  double v53 = v47;
  double v54 = v49;
  double v55 = v51;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

@end