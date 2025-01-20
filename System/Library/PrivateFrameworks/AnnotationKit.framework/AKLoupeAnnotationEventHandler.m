@interface AKLoupeAnnotationEventHandler
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKLoupeAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v30 = [(AKAnnotationEventHandler *)self pageController];
  v11 = [(AKAnnotationEventHandler *)self annotation];
  if (([(AKAnnotationEventHandler *)self initiallyDraggedArea] & 0xFFFFFFFFFFFFFFFELL) == 0x12)
  {
    +[AKAnnotationPointOfInterestHelper pointForDraggableArea:[(AKAnnotationEventHandler *)self initiallyDraggedArea] onAnnotation:v11 pageControllerForPixelAlignment:v30];
    CGFloat v13 = v12;
    double v29 = v14;
    [v11 rectangle];
    double x = v32.origin.x;
    double y = v32.origin.y;
    double width = v32.size.width;
    double height = v32.size.height;
    CGFloat MidX = CGRectGetMidX(v32);
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    CGFloat MidY = CGRectGetMidY(v33);
    +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v30, x, y, width, height);
    double v21 = v34.origin.x;
    double v22 = v34.origin.y;
    double v23 = v34.size.width;
    double v24 = v34.size.height;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.double x = v21;
    v35.origin.double y = v22;
    v35.size.double width = v23;
    v35.size.double height = v24;
    +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v30, MaxX, CGRectGetMinY(v35), v21, v22, v23, v24);
    CGFloat v28 = v29;
  }
  else
  {
    CGFloat MidX = *MEMORY[0x263F00148];
    CGFloat MidY = *(double *)(MEMORY[0x263F00148] + 8);
    CGFloat v27 = MidY;
    CGFloat v26 = *MEMORY[0x263F00148];
    CGFloat v28 = MidY;
    CGFloat v13 = *MEMORY[0x263F00148];
  }
  a3->double x = v13;
  a3->double y = v28;
  a4->double x = v26;
  a4->double y = v27;
  a5->double x = MidX;
  a5->double y = MidY;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v48 = [(AKAnnotationEventHandler *)self pageController];
  v7 = [(AKAnnotationEventHandler *)self annotation];
  [(AKAnnotationEventHandler *)self initialCenter];
  double v9 = v8;
  double v11 = v10;
  [(AKAnnotationEventHandler *)self initialOtherPoint];
  double v13 = v12;
  double v15 = v14;
  [v7 originalModelBaseScaleFactor];
  double v17 = v16;
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 18)
  {
    +[AKGeometryHelper projectPoint:ontoRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "projectPoint:ontoRayWithFirstPoint:andSecondPoint:", x, y, v9, v11, v13, v15);
    double v19 = v18 - v9;
    double v21 = v20 - v11;
    +[AKGeometryHelper lengthOfVector:](AKGeometryHelper, "lengthOfVector:", v18 - v9, v20 - v11);
    double v23 = v22;
    +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v48, v19, v21, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    BOOL v26 = v25 > 0.0 || v24 < 0.0;
    if (v26) {
      double v27 = v17 * 25.0;
    }
    else {
      double v27 = v23;
    }
    double v28 = v17 * 300.0;
    if (v27 <= v17 * 300.0) {
      double v28 = v27;
    }
    if (v27 < v17 * 25.0) {
      double v28 = v17 * 25.0;
    }
    +[AKLoupeAnnotationImageUpdaterHelper magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:](AKLoupeAnnotationImageUpdaterHelper, "magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:", v7, v48, v9 - v28, v11 - v28, v28 + v28, v28 + v28);
    +[AKLoupeAnnotationImageUpdaterHelper unmagnifiedRectForMagnifiedRect:ofLoupeAnnotation:](AKLoupeAnnotationImageUpdaterHelper, "unmagnifiedRectForMagnifiedRect:ofLoupeAnnotation:", v7);
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      [v7 rectangle];
      v51.origin.double x = v30;
      v51.origin.double y = v32;
      v51.size.double width = v34;
      v51.size.double height = v36;
      if (!CGRectEqualToRect(v50, v51)) {
        objc_msgSend(v7, "setRectangle:", v30, v32, v34, v36);
      }
    }
  }
  else if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 19)
  {
    +[AKGeometryHelper normalizeVector:](AKGeometryHelper, "normalizeVector:", x - v9, y - v11);
    +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v48);
    +[AKGeometryHelper angleOfVector:](AKGeometryHelper, "angleOfVector:", v38, v37);
    double v40 = v39 / 1.57079633;
    double v41 = 1.0;
    if (v40 <= 1.0) {
      double v41 = v40;
    }
    BOOL v26 = v40 < 0.0;
    double v42 = 0.0;
    if (!v26) {
      double v42 = v41;
    }
    double v43 = v42 * 3.5 + 1.5;
    [v7 magnification];
    if (v44 <= 4.125)
    {
      [v7 magnification];
      if (v45 < 2.375 && v43 > 3.25) {
        double v43 = 1.5;
      }
    }
    else if (v43 < 3.25)
    {
      double v43 = 5.0;
    }
    [v7 magnification];
    if (v47 != v43) {
      [v7 setMagnification:v43];
    }
  }
}

@end