@interface AKThoughtBubbleAnnotationEventHandler
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKThoughtBubbleAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  CGPoint v21 = (CGPoint)*MEMORY[0x263F00148];
  CGPoint v22 = v21;
  CGPoint v20 = v21;
  v14 = [(AKAnnotationEventHandler *)self annotation];
  unint64_t v15 = [(AKAnnotationEventHandler *)self initiallyDraggedArea];
  if (v15 - 1 >= 8)
  {
    if (v15 == 14)
    {
      [v14 pointyBitPoint];
      v22.x = v16;
      v22.y = v17;
      [v14 rectangle];
      CGFloat MidX = CGRectGetMidX(v23);
      [v14 rectangle];
      v20.x = MidX;
      v20.y = CGRectGetMidY(v24);
      CGPoint v21 = v20;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AKThoughtBubbleAnnotationEventHandler;
    [(AKRectangularAnnotationEventHandler *)&v19 getInitialDraggedPoint:&v22 otherPoint:&v21 center:&v20 forEvent:v12 orRecognizer:v13];
  }
  *a3 = v22;
  *a4 = v21;
  *a5 = v20;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(AKAnnotationEventHandler *)self annotation];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v88 = 0u;
  [v8 rectangle];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v8 rotationAngle];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v10, v12, v14, v16, -v17);
  double v18 = y * 0.0 + 0.0 * x + 0.0;
  double v19 = v18;
  CGPoint v20 = [(AKAnnotationEventHandler *)self pageController];
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] != 14)
  {
    [v8 rectangle];
    CGFloat v43 = v42;
    CGFloat v80 = v45;
    CGFloat v81 = v44;
    CGFloat v79 = v46;
    v87.receiver = self;
    v87.super_class = (Class)AKThoughtBubbleAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v87, sel_updateModelWithCurrentPoint_options_, a4, x, y);
    if (a4) {
      [(AKAnnotationEventHandler *)self initialCenter];
    }
    else {
      [(AKAnnotationEventHandler *)self initialOtherPoint];
    }
    double v49 = v47;
    double v50 = v48;
    [(AKAnnotationEventHandler *)self lastPositionInModel];
    double v52 = v51 - v49;
    [(AKAnnotationEventHandler *)self lastPositionInModel];
    +[AKGeometryHelper compareVectorDirectionsFirstVector:secondVector:](AKGeometryHelper, "compareVectorDirectionsFirstVector:secondVector:", v52, v53 - v50, v18 - v49, v18 - v50);
    double v55 = v54;
    double v57 = v56;
    if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 8
      || [(AKAnnotationEventHandler *)self initiallyDraggedArea] == 4)
    {
      double v75 = 1.0;
      sdouble x = v55;
    }
    else
    {
      double v75 = v57;
      if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 6
        || [(AKAnnotationEventHandler *)self initiallyDraggedArea] == 2)
      {
        sdouble x = 1.0;
      }
      else
      {
        sdouble x = v55;
      }
    }
    [v8 rectangle];
    CGFloat v59 = v58;
    CGFloat v61 = v60;
    CGFloat v73 = v62;
    CGFloat v64 = v63;
    memset(&v86, 0, sizeof(v86));
    v91.origin.double x = v43;
    v91.origin.double y = v81;
    v91.size.width = v80;
    v91.size.height = v79;
    CGFloat v65 = -CGRectGetMidX(v91);
    v92.origin.double x = v43;
    v92.origin.double y = v81;
    v92.size.width = v80;
    v92.size.height = v79;
    CGFloat MidY = CGRectGetMidY(v92);
    CGAffineTransformMakeTranslation(&v86, v65, -MidY);
    v93.origin.double x = v59;
    v93.origin.double y = v61;
    v93.size.width = v73;
    CGFloat v74 = v64;
    v93.size.height = v64;
    CGFloat sxa = sx * CGRectGetWidth(v93);
    v94.origin.double x = v43;
    v94.origin.double y = v81;
    v94.size.width = v80;
    v94.size.height = v79;
    CGFloat sxb = sxa / CGRectGetWidth(v94);
    v95.origin.double x = v59;
    v95.origin.double y = v61;
    v95.size.width = v73;
    v95.size.height = v64;
    double v67 = v75 * CGRectGetHeight(v95);
    v96.origin.double x = v43;
    v96.origin.double y = v81;
    v96.size.width = v80;
    v96.size.height = v79;
    CGFloat Height = CGRectGetHeight(v96);
    CGAffineTransformMakeScale(&t2, sxb, v67 / Height);
    CGAffineTransform t1 = v86;
    CGAffineTransformConcat(&v85, &t1, &t2);
    CGAffineTransform v86 = v85;
    v97.origin.double x = v59;
    v97.origin.double y = v61;
    v97.size.width = v73;
    v97.size.height = v74;
    CGFloat MidX = CGRectGetMidX(v97);
    v98.origin.double x = v59;
    v98.origin.double y = v61;
    v98.size.width = v73;
    v98.size.height = v74;
    CGFloat v70 = CGRectGetMidY(v98);
    CGAffineTransformMakeTranslation(&v82, MidX, v70);
    CGAffineTransform t1 = v86;
    CGAffineTransformConcat(&v85, &t1, &v82);
    CGAffineTransform v86 = v85;
    [v8 pointyBitPoint];
    float64x2_t v40 = vaddq_f64(*(float64x2_t *)&v86.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v86.c, v71), *(float64x2_t *)&v86.a, v72));
    double v41 = v40.f64[1];
    v39 = v8;
    goto LABEL_20;
  }
  [(AKAnnotationEventHandler *)self initialOtherPoint];
  if ((a4 & 2) != 0)
  {
    double v23 = v21;
    double v24 = v22;
    +[AKGeometryHelper snapVectorTo45Degrees:](AKGeometryHelper, "snapVectorTo45Degrees:", v18 - v21, v18 - v22);
    double v18 = v23 + v25;
    double v19 = v24 + v26;
  }
  +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", 14, v8, v20, v18, v19);
  double v28 = v27;
  double v30 = v29;
  v31 = [v20 geometryHelper];
  objc_msgSend(v31, "contentAlignedPointForPoint:", v28, v30);
  double v33 = v32;
  double v35 = v34;

  [v8 pointyBitPoint];
  if (v37 != v33 || v36 != v35)
  {
    v39 = v8;
    v40.f64[0] = v33;
    double v41 = v35;
LABEL_20:
    objc_msgSend(v39, "setPointyBitPoint:", v40.f64[0], v41);
  }
}

@end