@interface AKPolygonAnnotationEventHandler
- (BOOL)lockAspectRatioByDefault;
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKPolygonAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  CGPoint v26 = (CGPoint)*MEMORY[0x263F00148];
  CGPoint v27 = v26;
  CGPoint v25 = v26;
  v14 = [(AKAnnotationEventHandler *)self pageController];
  v15 = [(AKAnnotationEventHandler *)self annotation];
  unint64_t v16 = [(AKAnnotationEventHandler *)self initiallyDraggedArea];
  if (v16 - 1 >= 8)
  {
    if (v16 == 17)
    {
      +[AKAnnotationPointOfInterestHelper pointForDraggableArea:[(AKAnnotationEventHandler *)self initiallyDraggedArea] onAnnotation:v15 pageControllerForPixelAlignment:v14];
      v27.CGFloat x = v17;
      v27.CGFloat y = v18;
      [v15 rectangle];
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
      CGFloat MidX = CGRectGetMidX(v28);
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      v25.CGFloat x = MidX;
      v25.CGFloat y = CGRectGetMidY(v29);
      CGPoint v26 = (CGPoint)__PAIR128__(*(unint64_t *)&v25.y, *(unint64_t *)&MidX);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)AKPolygonAnnotationEventHandler;
    [(AKRectangularAnnotationEventHandler *)&v24 getInitialDraggedPoint:&v27 otherPoint:&v26 center:&v25 forEvent:v12 orRecognizer:v13];
  }
  *a3 = v27;
  *a4 = v26;
  *a5 = v25;
}

- (BOOL)lockAspectRatioByDefault
{
  return 1;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(AKAnnotationEventHandler *)self annotation];
  v9 = [(AKAnnotationEventHandler *)self pageController];
  memset(&v19[1], 0, 48);
  [v8 rectangle];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v8 rotationAngle];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v11, v13, v15, v17, -v18);
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 17)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", [(AKAnnotationEventHandler *)self initiallyDraggedArea], v8, v9, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
    objc_msgSend(v8, "setPointCount:", +[AKPolygonPointOfInterestHelper numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:](AKPolygonPointOfInterestHelper, "numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:", v8, v9));
  }
  else
  {
    v19[0].receiver = self;
    v19[0].super_class = (Class)AKPolygonAnnotationEventHandler;
    -[objc_super updateModelWithCurrentPoint:options:](v19, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  }
}

@end