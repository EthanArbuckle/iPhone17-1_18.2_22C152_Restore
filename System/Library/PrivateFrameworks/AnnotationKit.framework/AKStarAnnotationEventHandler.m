@interface AKStarAnnotationEventHandler
- (BOOL)lockAspectRatioByDefault;
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKStarAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  CGPoint v22 = (CGPoint)*MEMORY[0x263F00148];
  CGPoint v23 = v22;
  CGPoint v21 = v22;
  v14 = [(AKAnnotationEventHandler *)self pageController];
  v15 = [(AKAnnotationEventHandler *)self annotation];
  unint64_t v16 = [(AKAnnotationEventHandler *)self initiallyDraggedArea];
  if (v16 - 1 < 8 || v16 == 17)
  {
    v20.receiver = self;
    v20.super_class = (Class)AKStarAnnotationEventHandler;
    [(AKPolygonAnnotationEventHandler *)&v20 getInitialDraggedPoint:&v23 otherPoint:&v22 center:&v21 forEvent:v12 orRecognizer:v13];
  }
  else if (v16 == 16)
  {
    +[AKAnnotationPointOfInterestHelper pointForDraggableArea:[(AKAnnotationEventHandler *)self initiallyDraggedArea] onAnnotation:v15 pageControllerForPixelAlignment:v14];
    v23.x = v17;
    v23.y = v18;
    [v15 rectangle];
    CGFloat MidX = CGRectGetMidX(v24);
    [v15 rectangle];
    v21.x = MidX;
    v21.y = CGRectGetMidY(v25);
    CGPoint v22 = v21;
  }
  *a3 = v23;
  *a4 = v22;
  *a5 = v21;
}

- (BOOL)lockAspectRatioByDefault
{
  return 1;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double x = a3.x;
  double y = a3.y;
  v6 = [(AKAnnotationEventHandler *)self annotation];
  v7 = [(AKAnnotationEventHandler *)self pageController];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  [v6 rectangle];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v6 rotationAngle];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v9, v11, v13, v15, -v16);
  float64x2_t v17 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x));
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 16)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:[(AKAnnotationEventHandler *)self initiallyDraggedArea] ofDraggableArea:v6 forAnnotation:v7 onPageController:*(_OWORD *)&v17];
    +[AKStarAnnotationRenderer innerRadiusFactorForPoint:inAnnotation:onPageController:](AKStarAnnotationRenderer, "innerRadiusFactorForPoint:inAnnotation:onPageController:", v6, v7);
    objc_msgSend(v6, "setInnerRadiusFactor:");
  }
  else if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 17)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:[(AKAnnotationEventHandler *)self initiallyDraggedArea] ofDraggableArea:v6 forAnnotation:v7 onPageController:*(_OWORD *)&v17];
    objc_msgSend(v6, "setPointCount:", +[AKPolygonPointOfInterestHelper numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:](AKStarShapePointOfInterestHelper, "numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:", v6, v7));
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AKStarAnnotationEventHandler;
    -[AKPolygonAnnotationEventHandler updateModelWithCurrentPoint:options:](&v20, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  }
}

@end