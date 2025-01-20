@interface AKRectangularPageSizedAnnotationEventHandler
- (CGRect)_validateAnnotationRectForDrag:(CGRect)a3;
- (CGRect)_validateAnnotationRectForResize:(CGRect)a3;
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKRectangularPageSizedAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v14 = [(AKAnnotationEventHandler *)self annotation];
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 20)
  {
    [v14 rectangle];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(AKAnnotationEventHandler *)self windowPointFromEvent:v12 orRecognizer:v13];
    -[AKAnnotationEventHandler modelPointFromPointInWindow:](self, "modelPointFromPointInWindow:");
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    v30.origin.x = v16;
    v30.origin.y = v18;
    v30.size.width = v20;
    v30.size.height = v22;
    CGFloat MidX = CGRectGetMidX(v30);
    v31.origin.x = v16;
    v31.origin.y = v18;
    v31.size.width = v20;
    v31.size.height = v22;
    CGFloat MidY = CGRectGetMidY(v31);
    a3->x = v24;
    a3->y = v26;
    a4->x = MidX;
    a4->y = MidY;
    a5->x = MidX;
    a5->y = MidY;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)AKRectangularPageSizedAnnotationEventHandler;
    [(AKRectangularAnnotationEventHandler *)&v29 getInitialDraggedPoint:a3 otherPoint:a4 center:a5 forEvent:v12 orRecognizer:v13];
  }
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(AKAnnotationEventHandler *)self annotation];
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 20)
  {
    v9 = [(AKAnnotationEventHandler *)self pageController];
    [(AKAnnotationEventHandler *)self initialDraggedPoint];
    double v11 = x - v10;
    double v13 = y - v12;
    [v8 rectangle];
    double v14 = v50.origin.x;
    double v15 = v50.origin.y;
    double width = v50.size.width;
    double height = v50.size.height;
    double MidX = CGRectGetMidX(v50);
    v51.origin.double x = v14;
    v51.origin.double y = v15;
    v51.size.double width = width;
    v51.size.double height = height;
    double MidY = CGRectGetMidY(v51);
    [(AKAnnotationEventHandler *)self initialCenter];
    double v22 = v14 + v11 - (MidX - v20);
    double v23 = v15 + v13 - (MidY - v21);
    CGFloat v24 = [v9 geometryHelper];
    objc_msgSend(v24, "contentAlignedPointForPoint:", v22, v23);
    double v26 = v25;
    double v28 = v27;

    -[AKRectangularPageSizedAnnotationEventHandler _validateAnnotationRectForDrag:](self, "_validateAnnotationRectForDrag:", v26, v28, width, height);
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    [v8 rectangle];
    v54.origin.double x = v30;
    v54.origin.double y = v32;
    v54.size.double width = v34;
    v54.size.double height = v36;
    if (!CGRectEqualToRect(v52, v54)) {
      objc_msgSend(v8, "setRectangle:", v30, v32, v34, v36);
    }
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)AKRectangularPageSizedAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v49, sel_updateModelWithCurrentPoint_options_, a4, x, y);
    [v8 rectangle];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    -[AKRectangularPageSizedAnnotationEventHandler _validateAnnotationRectForResize:](self, "_validateAnnotationRectForResize:");
    double v45 = v53.origin.x;
    double v46 = v53.origin.y;
    double v47 = v53.size.width;
    double v48 = v53.size.height;
    v55.origin.double x = v38;
    v55.origin.double y = v40;
    v55.size.double width = v42;
    v55.size.double height = v44;
    if (!CGRectEqualToRect(v53, v55)) {
      objc_msgSend(v8, "setRectangle:", v45, v46, v47, v48);
    }
  }
}

- (CGRect)_validateAnnotationRectForResize:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(AKAnnotationEventHandler *)self pageController];
  [v7 maxPageRect];
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v17 = CGRectIntersection(v16, v19);
  double v8 = v17.origin.x;
  double v9 = v17.origin.y;
  CGFloat v10 = v17.size.width;
  CGFloat v11 = v17.size.height;
  if (CGRectIsNull(v17))
  {
    double v9 = y;
    double v8 = x;
  }

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_validateAnnotationRectForDrag:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(AKAnnotationEventHandler *)self pageController];
  [v7 maxPageRect];
  CGFloat v8 = v30.origin.x;
  CGFloat v9 = v30.origin.y;
  CGFloat v10 = v30.size.width;
  CGFloat v11 = v30.size.height;
  double v29 = *MEMORY[0x263F00148];
  double v27 = *(double *)(MEMORY[0x263F00148] + 8);
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  if (CGRectContainsRect(v30, v48))
  {
    CGFloat v12 = height;
    double v13 = v27;
    goto LABEL_14;
  }
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat rect = height;
  double MinX = CGRectGetMinX(v31);
  v32.origin.double x = v8;
  v32.origin.double y = v9;
  v32.size.CGFloat width = v10;
  v32.size.CGFloat height = v11;
  if (MinX < CGRectGetMinX(v32))
  {
    v33.origin.double x = v8;
    v33.origin.double y = v9;
    v33.size.CGFloat width = v10;
    v33.size.CGFloat height = v11;
    double v15 = CGRectGetMinX(v33);
    v34.origin.double x = x;
    v34.origin.double y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = rect;
    double v16 = CGRectGetMinX(v34);
LABEL_7:
    double v29 = v15 - v16;
    goto LABEL_8;
  }
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = rect;
  double MaxX = CGRectGetMaxX(v35);
  v36.origin.double x = v8;
  v36.origin.double y = v9;
  v36.size.CGFloat width = v10;
  v36.size.CGFloat height = v11;
  if (MaxX > CGRectGetMaxX(v36))
  {
    v37.origin.double x = v8;
    v37.origin.double y = v9;
    v37.size.CGFloat width = v10;
    v37.size.CGFloat height = v11;
    double v15 = CGRectGetMaxX(v37);
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = rect;
    double v16 = CGRectGetMaxX(v38);
    goto LABEL_7;
  }
LABEL_8:
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = rect;
  double MaxY = CGRectGetMaxY(v39);
  v40.origin.double x = v8;
  v40.origin.double y = v9;
  v40.size.CGFloat width = v10;
  v40.size.CGFloat height = v11;
  if (MaxY <= CGRectGetMaxY(v40))
  {
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = rect;
    double MinY = CGRectGetMinY(v43);
    v44.origin.double x = v8;
    v44.origin.double y = v9;
    v44.size.CGFloat width = v10;
    v44.size.CGFloat height = v11;
    if (MinY >= CGRectGetMinY(v44))
    {
      double v13 = v27;
      CGFloat v12 = rect;
      goto LABEL_14;
    }
    v45.origin.double x = v8;
    v45.origin.double y = v9;
    v45.size.CGFloat width = v10;
    v45.size.CGFloat height = v11;
    double v19 = CGRectGetMinY(v45);
    v46.origin.double x = x;
    v46.origin.double y = y;
    v46.size.CGFloat width = width;
    CGFloat v12 = rect;
    v46.size.CGFloat height = rect;
    double v20 = CGRectGetMinY(v46);
  }
  else
  {
    v41.origin.double x = v8;
    v41.origin.double y = v9;
    v41.size.CGFloat width = v10;
    v41.size.CGFloat height = v11;
    double v19 = CGRectGetMaxY(v41);
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.CGFloat width = width;
    CGFloat v12 = rect;
    v42.size.CGFloat height = rect;
    double v20 = CGRectGetMaxY(v42);
  }
  double v13 = v19 - v20;
LABEL_14:
  double v22 = y + v13;

  double v23 = x + v29;
  double v24 = v22;
  double v25 = width;
  double v26 = v12;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

@end