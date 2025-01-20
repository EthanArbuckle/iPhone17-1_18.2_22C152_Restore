@interface AKArrowShapeAnnotationEventHandler
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKArrowShapeAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  v14 = [(AKAnnotationEventHandler *)self annotation];
  v22.receiver = self;
  v22.super_class = (Class)AKArrowShapeAnnotationEventHandler;
  [(AKArrowAnnotationEventHandler *)&v22 getInitialDraggedPoint:a3 otherPoint:a4 center:a5 forEvent:v13 orRecognizer:v12];

  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 12
    || [(AKAnnotationEventHandler *)self initiallyDraggedArea] == 13)
  {
    v15 = [(AKAnnotationEventHandler *)self pageController];
    +[AKAnnotationPointOfInterestHelper pointForDraggableArea:[(AKAnnotationEventHandler *)self initiallyDraggedArea] onAnnotation:v14 pageControllerForPixelAlignment:v15];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v14 endPoint];
    a3->x = v17;
    a3->y = v19;
    a4->x = v20;
    a4->y = v21;
  }
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(AKAnnotationEventHandler *)self annotation];
  v9 = [(AKAnnotationEventHandler *)self pageController];
  +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", [(AKAnnotationEventHandler *)self initiallyDraggedArea], v8, v9, x, y);
  double v11 = v10;
  double v13 = v12;
  v33.receiver = self;
  v33.super_class = (Class)AKArrowShapeAnnotationEventHandler;
  -[AKArrowAnnotationEventHandler updateModelWithCurrentPoint:options:](&v33, sel_updateModelWithCurrentPoint_options_, a4);
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 12
    || [(AKAnnotationEventHandler *)self initiallyDraggedArea] == 13)
  {
    [v8 startPoint];
    double v15 = v14;
    double v17 = v16;
    [v8 endPoint];
    +[AKGeometryHelper projectPoint:ontoRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "projectPoint:ontoRayWithFirstPoint:andSecondPoint:", v11, v13, v15, v17, v18, v19);
    double v21 = v20;
    double v23 = v22;
    long double v24 = hypot(v11 - v20, v13 - v22);
    double v25 = v24 + v24;
    [v8 endPoint];
    long double v27 = v26 - v21;
    [v8 endPoint];
    objc_msgSend(v8, "setArrowHeadLength:", (double)hypot(v27, v28 - v23));
    if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 12) {
      [v8 setArrowLineWidth:v25];
    }
    else {
      [v8 setArrowHeadWidth:v25];
    }
  }
  if ([v8 conformsToAKTextAnnotationProtocol])
  {
    id v29 = v8;
    unsigned __int8 v32 = 0;
    LOBYTE(v31) = 0;
    +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, 0, 0, 0, &v32, v29, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v9, 0, v31, 0);
    int v30 = [v29 textIsClipped];
    if (v32 != v30) {
      [v29 setTextIsClipped:v32 != 0];
    }
  }
}

@end