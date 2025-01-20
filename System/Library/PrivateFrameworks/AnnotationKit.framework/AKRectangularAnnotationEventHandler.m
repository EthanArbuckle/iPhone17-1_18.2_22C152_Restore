@interface AKRectangularAnnotationEventHandler
- (BOOL)initialHorizontalFlip;
- (BOOL)initialVerticalFlip;
- (CGRect)_rectForModifiedRotatedRect:(CGRect)a3 withOriginal:(CGRect)a4 andRotation:(double)a5;
- (void)_updateModelFlippednessWithCurrentPoint:(CGPoint)a3;
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)setInitialHorizontalFlip:(BOOL)a3;
- (void)setInitialVerticalFlip:(BOOL)a3;
- (void)setupDraggingConstraints;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKRectangularAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v60 = [(AKAnnotationEventHandler *)self annotation];
  v11 = [(AKAnnotationEventHandler *)self pageController];
  [v60 rectangle];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:v60];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  v62.origin.CGFloat x = v13;
  v62.origin.CGFloat y = v15;
  v62.size.CGFloat width = v17;
  v62.size.CGFloat height = v19;
  CGRect v63 = CGRectInset(v62, v21, v23);
  CGFloat height = v63.size.height;
  CGFloat y = v63.origin.y;
  CGFloat x = v63.origin.x;
  CGFloat width = v63.size.width;
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v11);
  double v25 = v64.origin.x;
  double v26 = v64.origin.y;
  double v27 = v64.size.width;
  double v28 = v64.size.height;
  double MinX = CGRectGetMinX(v64);
  v65.origin.CGFloat x = v25;
  v65.origin.CGFloat y = v26;
  v65.size.CGFloat width = v27;
  v65.size.CGFloat height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, MinX, CGRectGetMinY(v65), v25, v26, v27, v28);
  double v53 = v31;
  double v54 = v30;
  v66.origin.CGFloat x = v25;
  v66.origin.CGFloat y = v26;
  v66.size.CGFloat width = v27;
  v66.size.CGFloat height = v28;
  double MaxX = CGRectGetMaxX(v66);
  v67.origin.CGFloat x = v25;
  v67.origin.CGFloat y = v26;
  v67.size.CGFloat width = v27;
  v67.size.CGFloat height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, MaxX, CGRectGetMinY(v67), v25, v26, v27, v28);
  CGFloat v59 = v33;
  double v55 = v34;
  v68.origin.CGFloat x = v25;
  v68.origin.CGFloat y = v26;
  v68.size.CGFloat width = v27;
  v68.size.CGFloat height = v28;
  double v35 = CGRectGetMinX(v68);
  v69.origin.CGFloat x = v25;
  v69.origin.CGFloat y = v26;
  v69.size.CGFloat width = v27;
  v69.size.CGFloat height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, v35, CGRectGetMaxY(v69), v25, v26, v27, v28);
  double v37 = v36;
  double v39 = v38;
  v70.origin.CGFloat x = v25;
  v70.origin.CGFloat y = v26;
  v70.size.CGFloat width = v27;
  v70.size.CGFloat height = v28;
  double v40 = CGRectGetMaxX(v70);
  v71.origin.CGFloat x = v25;
  v71.origin.CGFloat y = v26;
  v71.size.CGFloat width = v27;
  v71.size.CGFloat height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, v40, CGRectGetMaxY(v71), v25, v26, v27, v28);
  double v42 = v41;
  double v44 = v43;
  switch([(AKAnnotationEventHandler *)self initiallyDraggedArea])
  {
    case 1uLL:
    case 8uLL:
      CGFloat v45 = v44;
      CGFloat v46 = v42;
      CGFloat v47 = v53;
      CGFloat v59 = v54;
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      CGFloat v45 = v39;
      CGFloat v46 = v37;
      CGFloat v47 = v55;
      break;
    case 5uLL:
    case 6uLL:
      CGFloat v45 = v53;
      CGFloat v46 = v54;
      CGFloat v47 = v44;
      CGFloat v59 = v42;
      break;
    case 7uLL:
      CGFloat v45 = v55;
      CGFloat v46 = v59;
      CGFloat v47 = v39;
      CGFloat v59 = v37;
      break;
    default:
      CGFloat v46 = *MEMORY[0x263F00148];
      CGFloat v45 = *(double *)(MEMORY[0x263F00148] + 8);
      CGFloat v47 = v45;
      CGFloat v59 = *MEMORY[0x263F00148];
      break;
  }
  v72.origin.CGFloat x = x;
  v72.origin.CGFloat y = y;
  v72.size.CGFloat width = width;
  v72.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v72);
  v73.origin.CGFloat x = x;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v73);
  if ([v60 conformsToAKFlippableAnnotationProtocol])
  {
    id v50 = v60;
    if (objc_opt_respondsToSelector()) {
      uint64_t v51 = [v50 horizontallyFlipped];
    }
    else {
      uint64_t v51 = 0;
    }
    -[AKRectangularAnnotationEventHandler setInitialHorizontalFlip:](self, "setInitialHorizontalFlip:", v51, *(void *)&v53, *(void *)&v54);
    if (objc_opt_respondsToSelector()) {
      uint64_t v52 = [v50 verticallyFlipped];
    }
    else {
      uint64_t v52 = 0;
    }
    [(AKRectangularAnnotationEventHandler *)self setInitialVerticalFlip:v52];
  }
  a3->CGFloat x = v59;
  a3->CGFloat y = v47;
  a4->CGFloat x = v46;
  a4->CGFloat y = v45;
  a5->CGFloat x = MidX;
  a5->CGFloat y = MidY;
}

- (void)setupDraggingConstraints
{
  id v4 = [(AKAnnotationEventHandler *)self pageController];
  BOOL v3 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v4 currentModelToScreenExifOrientation]);
  switch([(AKAnnotationEventHandler *)self initiallyDraggedArea])
  {
    case 2uLL:
    case 6uLL:
      if (!v3) {
        goto LABEL_5;
      }
      goto LABEL_3;
    case 4uLL:
    case 8uLL:
      if (v3) {
LABEL_5:
      }
        [(AKAnnotationEventHandler *)self setDraggingVerticalOnly:1];
      else {
LABEL_3:
      }
        [(AKAnnotationEventHandler *)self setDraggingHorizontalOnly:1];
      break;
    default:
      break;
  }
}

- (CGRect)_rectForModifiedRotatedRect:(CGRect)a3 withOriginal:(CGRect)a4 andRotation:(double)a5
{
  double width = a4.size.width;
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v23.origin.double x = v9;
  v23.origin.double y = v8;
  v23.size.double width = v7;
  v23.size.double height = v6;
  double MidY = CGRectGetMidY(v23);
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", x, y, width, height, a5);
  double v12 = MidY * 0.0 + 0.0 * MidX + 0.0;
  v24.origin.double x = v9;
  v24.origin.double y = v8;
  v24.size.double width = v7;
  v24.size.double height = v6;
  double v13 = v12 + CGRectGetWidth(v24) * -0.5;
  v25.origin.double x = v9;
  v25.origin.double y = v8;
  v25.size.double width = v7;
  v25.size.double height = v6;
  double v14 = v12 + CGRectGetHeight(v25) * -0.5;
  v26.origin.double x = v9;
  v26.origin.double y = v8;
  v26.size.double width = v7;
  v26.size.double height = v6;
  CGFloat v15 = CGRectGetWidth(v26);
  v27.origin.double x = v9;
  v27.origin.double y = v8;
  v27.size.double width = v7;
  v27.size.double height = v6;
  double v16 = CGRectGetHeight(v27);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.double height = v16;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  char v4 = a4;
  double y = a3.y;
  double x = a3.x;
  CGFloat v8 = [(AKAnnotationEventHandler *)self pageController];
  CGFloat v9 = [(AKAnnotationEventHandler *)self annotation];
  [v9 rectangle];
  double v11 = v10;
  double v99 = v13;
  double v100 = v12;
  double v98 = v14;
  double v15 = 0.0;
  if ([v9 conformsToAKRotatableAnnotationProtocol])
  {
    [v9 rotationAngle];
    double v15 = v16;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v103 = 0u;
  [v9 rectangle];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:");
  double v17 = y * 0.0 + 0.0 * x + 0.0;
  if ([(AKAnnotationEventHandler *)self draggingHorizontalOnly])
  {
    [(AKAnnotationEventHandler *)self initialDraggedPoint];
    double v19 = v18;
  }
  else
  {
    double v19 = y * 0.0 + 0.0 * x + 0.0;
    if ([(AKAnnotationEventHandler *)self draggingVerticalOnly])
    {
      [(AKAnnotationEventHandler *)self initialDraggedPoint];
      double v17 = v20;
    }
  }
  double v101 = v11;
  if (v4)
  {
    [(AKAnnotationEventHandler *)self initialCenter];
    double v42 = v41;
    double v44 = v43;
    double v45 = v17 - v41;
    double v46 = v19 - v43;
    if ([(AKAnnotationEventHandler *)self canLockAspectRatio]
      && ([(AKAnnotationEventHandler *)self alwaysLockAspectRatio]
       || ((((v4 & 2) == 0) ^ [(AKAnnotationEventHandler *)self lockAspectRatioByDefault]) & 1) == 0))
    {
      [(AKAnnotationEventHandler *)self naturalAspectRatioForAnnotation];
      +[AKGeometryHelper snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:](AKGeometryHelper, "snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:", [(AKAnnotationEventHandler *)self draggingVerticalOnly], [(AKAnnotationEventHandler *)self draggingHorizontalOnly], v45, v46, v47);
      double v45 = v48;
      double v46 = v49;
      double v17 = v42 + v48;
      double v19 = v44 + v49;
    }
    double v22 = v42 - v45;
    double v24 = v44 - v46;
  }
  else
  {
    [(AKAnnotationEventHandler *)self initialOtherPoint];
    double v22 = v21;
    double v24 = v23;
    if ([(AKAnnotationEventHandler *)self canLockAspectRatio])
    {
      if ([(AKAnnotationEventHandler *)self alwaysLockAspectRatio])
      {
        [(AKAnnotationEventHandler *)self naturalSizeForAnnotation];
        double v26 = v25;
        double v28 = v27;
        int64_t v29 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v9 originalExifOrientation]);
        +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v29, v26, v28, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
        double v31 = v30;
        double v33 = v32;
        unint64_t v34 = [(AKAnnotationEventHandler *)self initiallyDraggedArea];
        if (v34 == 3) {
          double v35 = -v33;
        }
        else {
          double v35 = v33;
        }
        if (v34 == 7)
        {
          double v35 = v33;
          double v36 = -v31;
        }
        else
        {
          double v36 = v31;
        }
        if (v34 == 1) {
          double v37 = -v33;
        }
        else {
          double v37 = v35;
        }
        if (v34 == 1) {
          double v38 = -v31;
        }
        else {
          double v38 = v36;
        }
        +[AKGeometryHelper projectVector:ontoAspectVector:](AKGeometryHelper, "projectVector:ontoAspectVector:", v17 - v22, v19 - v24, v38, v37, v36);
        double v17 = v22 + v39;
        double v19 = v24 + v40;
      }
      else if (((((v4 & 2) == 0) ^ [(AKAnnotationEventHandler *)self lockAspectRatioByDefault]) & 1) == 0)
      {
        [(AKAnnotationEventHandler *)self naturalAspectRatioForAnnotation];
        +[AKGeometryHelper snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:](AKGeometryHelper, "snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:", [(AKAnnotationEventHandler *)self draggingVerticalOnly], [(AKAnnotationEventHandler *)self draggingHorizontalOnly], v17 - v22, v19 - v24, v83);
        double v85 = v84;
        double v17 = v22 + v86;
        if ([(AKAnnotationEventHandler *)self draggingHorizontalOnly])
        {
          [(AKAnnotationEventHandler *)self naturalAspectRatioForAnnotation];
          double v88 = (v17 - v22) / v87;
          [(AKAnnotationEventHandler *)self initialCenter];
          double v89 = v88 * 0.5;
          double v24 = v90 - v88 * 0.5;
          [(AKAnnotationEventHandler *)self initialCenter];
          double v19 = v89 + v91;
        }
        else
        {
          double v19 = v24 + v85;
          if ([(AKAnnotationEventHandler *)self draggingVerticalOnly])
          {
            [(AKAnnotationEventHandler *)self naturalAspectRatioForAnnotation];
            double v93 = (v19 - v24) * v92;
            [(AKAnnotationEventHandler *)self initialCenter];
            double v94 = v93 * 0.5;
            double v22 = v95 - v94;
            [(AKAnnotationEventHandler *)self initialCenter];
            double v17 = v94 + v96;
          }
        }
      }
    }
  }
  if (v17 != v22 || v19 != v24)
  {
    -[AKRectangularAnnotationEventHandler _updateModelFlippednessWithCurrentPoint:](self, "_updateModelFlippednessWithCurrentPoint:", v17, v19);
    v106.size.double width = v17 - v22;
    v106.size.double height = v19 - v24;
    v106.origin.double x = v22;
    v106.origin.double y = v24;
    CGRect v107 = CGRectStandardize(v106);
    double v51 = v107.origin.x;
    double v52 = v107.origin.y;
    double width = v107.size.width;
    double height = v107.size.height;
    double MidX = CGRectGetMidX(v107);
    v108.origin.double x = v51;
    v108.origin.double y = v52;
    v108.size.double width = width;
    v108.size.double height = height;
    double MidY = CGRectGetMidY(v108);
    v57 = objc_opt_class();
    [(AKAnnotationEventHandler *)self initialCenter];
    objc_msgSend(v57, "annotationRectangleForDraggingBounds:forAnnotation:onPageController:withOriginalCenter:", v9, v8, v51, v52, width, height, v58, v59);
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    if (vabdd_f64(round(v15 / 1.57079633), v15 / 1.57079633) < 0.0005)
    {
      CGRect v68 = [v8 geometryHelper];
      objc_msgSend(v68, "contentAlignedRectForRect:", v61, v63, v65, v67);
      double v61 = v69;
      double v63 = v70;
      double v65 = v71;
      double v67 = v72;
    }
    if (fabs(v15) >= 0.0005)
    {
      -[AKRectangularAnnotationEventHandler _rectForModifiedRotatedRect:withOriginal:andRotation:](self, "_rectForModifiedRotatedRect:withOriginal:andRotation:", v61, v63, v65, v67, v101, v100, v99, v98, *(void *)&v15);
      double v61 = v109.origin.x;
      double v63 = v109.origin.y;
      double v65 = v109.size.width;
      double v67 = v109.size.height;
      double v73 = CGRectGetMidX(v109) - MidX;
      v110.origin.double x = v61;
      v110.origin.double y = v63;
      v110.size.double width = v65;
      v110.size.double height = v67;
      double v74 = CGRectGetMidY(v110) - MidY;
      [(AKAnnotationEventHandler *)self initialDraggedPoint];
      -[AKAnnotationEventHandler setInitialDraggedPoint:](self, "setInitialDraggedPoint:", v73 + v75, v74 + v76);
      [(AKAnnotationEventHandler *)self initialOtherPoint];
      -[AKAnnotationEventHandler setInitialOtherPoint:](self, "setInitialOtherPoint:", v73 + v77, v74 + v78);
      [(AKAnnotationEventHandler *)self initialCenter];
      -[AKAnnotationEventHandler setInitialCenter:](self, "setInitialCenter:", v73 + v79, v74 + v80);
    }
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v61, v63, v65, v67))
    {
      [v9 rectangle];
      v112.origin.double x = v61;
      v112.origin.double y = v63;
      v112.size.double width = v65;
      v112.size.double height = v67;
      if (!CGRectEqualToRect(v111, v112))
      {
        objc_msgSend(v9, "setRectangle:", v61, v63, v65, v67);
        if ([v9 conformsToAKTextAnnotationProtocol])
        {
          id v81 = v9;
          unsigned __int8 v102 = 0;
          LOBYTE(v97) = 0;
          +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, 0, 0, 0, &v102, v81, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v8, 0, v97, 0);
          int v82 = [v81 textIsClipped];
          if (v102 != v82) {
            [v81 setTextIsClipped:v102 != 0];
          }
        }
      }
    }
  }
}

- (void)_updateModelFlippednessWithCurrentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(AKAnnotationEventHandler *)self annotation];
  int v7 = [v6 conformsToAKFlippableAnnotationProtocol];

  if (v7)
  {
    CGFloat v8 = [(AKAnnotationEventHandler *)self annotation];
    if ([v8 conformsToAKRotatableAnnotationProtocol]) {
      [v8 rotationAngle];
    }
    [v8 rectangle];
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:");
    [(AKAnnotationEventHandler *)self initialOtherPoint];
    double v15 = v10;
    double v16 = v9;
    [(AKAnnotationEventHandler *)self initialDraggedPoint];
    double v14 = v11;
    double v13 = v12;
    if (![(AKAnnotationEventHandler *)self draggingVerticalOnly]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "setHorizontallyFlipped:", -[AKRectangularAnnotationEventHandler initialHorizontalFlip](self, "initialHorizontalFlip") ^ (COERCE_UNSIGNED_INT64(y * 0.0 + 0.0 * x + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63 != COERCE_UNSIGNED_INT64(v13 * 0.0 + 0.0 * v14 + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63));
    }
    if (![(AKAnnotationEventHandler *)self draggingHorizontalOnly]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "setVerticallyFlipped:", -[AKRectangularAnnotationEventHandler initialVerticalFlip](self, "initialVerticalFlip") ^ (COERCE_UNSIGNED_INT64(y * 0.0 + 0.0 * x + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63 != COERCE_UNSIGNED_INT64(v13 * 0.0 + 0.0 * v14 + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63));
    }
  }
}

- (BOOL)initialHorizontalFlip
{
  return self->_initialHorizontalFlip;
}

- (void)setInitialHorizontalFlip:(BOOL)a3
{
  self->_initialHorizontalFlip = a3;
}

- (BOOL)initialVerticalFlip
{
  return self->_initialVerticalFlip;
}

- (void)setInitialVerticalFlip:(BOOL)a3
{
  self->_initialVerticalFlip = a3;
}

@end