@interface AKArrowAnnotationEventHandler
- (CGPoint)_updatedMidPointForAnnotation:(id)a3 withNewStartPt:(CGPoint)a4 andNewEndPt:(CGPoint)a5;
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKArrowAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v37 = [(AKAnnotationEventHandler *)self annotation];
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] != 9)
  {
    if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 10)
    {
      [v37 endPoint];
      CGFloat v12 = v19;
      CGFloat v14 = v20;
      [v37 startPoint];
    }
    else
    {
      if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] != 11)
      {
        CGFloat v16 = *MEMORY[0x263F00148];
        CGFloat v18 = *(double *)(MEMORY[0x263F00148] + 8);
        CGFloat v14 = v18;
        CGFloat v12 = *MEMORY[0x263F00148];
        goto LABEL_9;
      }
      [v37 midPoint];
      CGFloat v12 = v23;
      CGFloat v14 = v24;
      [v37 midPoint];
    }
    v25 = v37;
    CGFloat v16 = v21;
    CGFloat v18 = v22;
    goto LABEL_10;
  }
  [v37 startPoint];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v37 endPoint];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
LABEL_9:
  v25 = v37;
LABEL_10:
  [v25 startPoint];
  double v27 = v26;
  [v37 endPoint];
  double v29 = v28;
  [v37 startPoint];
  CGFloat v31 = v27 + (v29 - v30) * 0.5;
  [v37 startPoint];
  double v33 = v32;
  [v37 endPoint];
  double v35 = v34;
  [v37 startPoint];
  a3->x = v12;
  a3->y = v14;
  a4->x = v16;
  a4->y = v18;
  a5->x = v31;
  a5->y = v33 + (v35 - v36) * 0.5;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  char v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 9
    || [(AKAnnotationEventHandler *)self initiallyDraggedArea] == 10)
  {
    if (v4)
    {
      [(AKAnnotationEventHandler *)self initialCenter];
      double v15 = v14;
      double v17 = v16;
      double v18 = x - v14;
      double v19 = y - v16;
      if ((v4 & 2) != 0)
      {
        +[AKGeometryHelper snapVectorTo45Degrees:](AKGeometryHelper, "snapVectorTo45Degrees:", v18, v19);
        double x = v15 + v18;
        double y = v17 + v19;
      }
      double v10 = v15 - v18;
      double v11 = v17 - v19;
    }
    else
    {
      [(AKAnnotationEventHandler *)self initialOtherPoint];
      double v10 = v8;
      double v11 = v9;
      if ((v4 & 2) != 0)
      {
        +[AKGeometryHelper snapVectorTo45Degrees:](AKGeometryHelper, "snapVectorTo45Degrees:", x - v8, y - v9);
        double x = v10 + v12;
        double y = v11 + v13;
      }
    }
    id v39 = [(AKAnnotationEventHandler *)self pageController];
    double v20 = [v39 geometryHelper];
    objc_msgSend(v20, "contentAlignedPointForPoint:", x, y);
    double v22 = v21;
    double v24 = v23;

    v25 = [v39 geometryHelper];
    objc_msgSend(v25, "contentAlignedPointForPoint:", v10, v11);
    double v27 = v26;
    double v29 = v28;

    if (v22 == v27 && v24 == v29) {
      goto LABEL_31;
    }
    double v30 = [(AKAnnotationEventHandler *)self annotation];
    if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 9)
    {
      -[AKArrowAnnotationEventHandler _updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:](self, "_updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:", v30, v22, v24, v27, v29);
      objc_msgSend(v30, "setMidPoint:");
      [v30 startPoint];
      if (v32 != v22 || v31 != v24) {
        objc_msgSend(v30, "setStartPoint:", v22, v24);
      }
      [v30 endPoint];
      if (v34 == v27 && v33 == v29) {
        goto LABEL_30;
      }
    }
    else
    {
      -[AKArrowAnnotationEventHandler _updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:](self, "_updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:", v30, v27, v29, v22, v24);
      objc_msgSend(v30, "setMidPoint:");
      [v30 startPoint];
      if (v36 != v27 || v35 != v29) {
        objc_msgSend(v30, "setStartPoint:", v27, v29);
      }
      [v30 endPoint];
      if (v38 == v22)
      {
        double v27 = v22;
        double v29 = v24;
        if (v37 == v24)
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {
        double v27 = v22;
        double v29 = v24;
      }
    }
    objc_msgSend(v30, "setEndPoint:", v27, v29);
    goto LABEL_30;
  }
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] != 11) {
    return;
  }
  id v39 = [(AKAnnotationEventHandler *)self annotation];
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 11) {
    objc_msgSend(v39, "setMidPoint:", x, y);
  }
LABEL_31:
}

- (CGPoint)_updatedMidPointForAnnotation:(id)a3 withNewStartPt:(CGPoint)a4 andNewEndPt:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  id v9 = a3;
  [v9 startPoint];
  double v11 = v10;
  double v13 = v12;
  [v9 endPoint];
  long double v15 = v14 - v13;
  long double v17 = v16 - v11;
  double v27 = atan2(v14 - v13, v16 - v11);
  double v18 = hypot(v17, v15);
  long double v19 = x - v8;
  long double v20 = y - v7;
  CGFloat v21 = hypot(v19, v20) / v18;
  [v9 midPoint];
  double v28 = v23;
  double v29 = v22;

  memset(&v36, 0, sizeof(v36));
  CGAffineTransformMakeTranslation(&v36, -v11, -v13);
  CGAffineTransformMakeRotation(&t2, -v27);
  CGAffineTransform t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &t2);
  CGAffineTransform v36 = v35;
  CGAffineTransformMakeScale(&v32, v21, v21);
  CGAffineTransform t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &v32);
  CGAffineTransform v36 = v35;
  long double v24 = atan2(v20, v19);
  CGAffineTransformMakeRotation(&v31, v24);
  CGAffineTransform t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &v31);
  CGAffineTransform v36 = v35;
  CGAffineTransformMakeTranslation(&v30, v8, v7);
  CGAffineTransform t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &v30);
  float64x2_t v25 = vaddq_f64(*(float64x2_t *)&v35.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v35.c, v28), *(float64x2_t *)&v35.a, v29));
  double v26 = v25.f64[1];
  result.double x = v25.f64[0];
  result.double y = v26;
  return result;
}

@end