@interface AKAnnotationEventHandler
+ (BOOL)allowsDragging;
+ (BOOL)allowsDraggingOfAnnotation:(id)a3;
+ (CGRect)annotationRectangleForDraggingBounds:(CGRect)a3 forAnnotation:(id)a4 onPageController:(id)a5 withOriginalCenter:(CGPoint)a6;
+ (Class)_handlerClassForPlatformForAnnotation:(id)a3;
+ (id)newAnnotationEventHandlerForCurrentPlatformForAnnotation:(id)a3 withPageController:(id)a4;
- (AKAnnotation)annotation;
- (AKPageController)pageController;
- (BOOL)alwaysLockAspectRatio;
- (BOOL)canLockAspectRatio;
- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)draggingHorizontalOnly;
- (BOOL)draggingVerticalOnly;
- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)lockAspectRatioByDefault;
- (BOOL)touchModifiersEnabled;
- (CGPoint)initialCenter;
- (CGPoint)initialDraggedPoint;
- (CGPoint)initialOtherPoint;
- (CGPoint)lastPositionInModel;
- (CGPoint)lastPositionInWindow;
- (CGPoint)modelPointFromPointInWindow:(CGPoint)a3;
- (CGPoint)windowPointFromEvent:(id)a3 orRecognizer:(id)a4;
- (CGSize)naturalSizeForAnnotation;
- (double)naturalAspectRatioForAnnotation;
- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4;
- (unint64_t)initiallyDraggedArea;
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)setAnnotation:(id)a3;
- (void)setDraggingHorizontalOnly:(BOOL)a3;
- (void)setDraggingVerticalOnly:(BOOL)a3;
- (void)setInitialCenter:(CGPoint)a3;
- (void)setInitialDraggedPoint:(CGPoint)a3;
- (void)setInitialOtherPoint:(CGPoint)a3;
- (void)setInitiallyDraggedArea:(unint64_t)a3;
- (void)setLastPositionInModel:(CGPoint)a3;
- (void)setLastPositionInWindow:(CGPoint)a3;
- (void)setPageController:(id)a3;
- (void)setTouchModifiersEnabled:(BOOL)a3;
- (void)setupDraggingConstraints;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKAnnotationEventHandler

+ (id)newAnnotationEventHandlerForCurrentPlatformForAnnotation:(id)a3 withPageController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_handlerClassForPlatformForAnnotation:", v7)), "_initWithAnnotation:andPageController:", v7, v6);

  return v8;
}

- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKAnnotationEventHandler;
  v8 = [(AKAnnotationEventHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AKAnnotationEventHandler *)v8 setPageController:v7];
    [(AKAnnotationEventHandler *)v9 setAnnotation:v6];
  }

  return v9;
}

- (BOOL)canLockAspectRatio
{
  return 1;
}

- (BOOL)alwaysLockAspectRatio
{
  return 0;
}

- (BOOL)lockAspectRatioByDefault
{
  return 0;
}

- (CGSize)naturalSizeForAnnotation
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)naturalAspectRatioForAnnotation
{
  [(AKAnnotationEventHandler *)self naturalSizeForAnnotation];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(AKAnnotationEventHandler *)self annotation];
  uint64_t v8 = [v7 originalExifOrientation];
  if (v8 <= 4) {
    double v9 = v6;
  }
  else {
    double v9 = v4;
  }
  if (v8 <= 4) {
    double v10 = v4;
  }
  else {
    double v10 = v6;
  }
  double v11 = v10 / v9;

  return v11;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v5 = a4;
  double v6 = [(AKAnnotationEventHandler *)self pageController];
  id v7 = [v6 controller];
  [v7 showSelectionMenu:v5];

  return 1;
}

+ (BOOL)allowsDragging
{
  return 1;
}

+ (BOOL)allowsDraggingOfAnnotation:(id)a3
{
  uint64_t v3 = [a1 _handlerClassForPlatformForAnnotation:a3];

  return MEMORY[0x270F9A6D0](v3, sel_allowsDragging);
}

+ (CGRect)annotationRectangleForDraggingBounds:(CGRect)a3 forAnnotation:(id)a4 onPageController:(id)a5 withOriginalCenter:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:v13];
  CGFloat v16 = -v15;
  CGFloat v18 = -v17;
  v29.origin.double x = v12;
  v29.origin.double y = v11;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRect v30 = CGRectInset(v29, v16, v18);
  double v19 = v30.origin.x;
  double v20 = v30.origin.y;
  double v21 = v30.size.width;
  double v22 = v30.size.height;
  CGRect v28 = v30;
  if ([v13 conformsToAKTextAnnotationProtocol])
  {
    LOBYTE(v27) = 0;
    +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", &v28, 0, 0, 0, 0, v13, x, y, v19, v20, v21, v22, v14, 0, v27, 0);
  }

  double v23 = v28.origin.x;
  double v24 = v28.origin.y;
  double v25 = v28.size.width;
  double v26 = v28.size.height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  double v18 = 0.0;
  double v19 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  id v6 = a4;
  id v7 = a3;
  [(AKAnnotationEventHandler *)self getInitialDraggedPoint:&v18 otherPoint:&v16 center:&v14 forEvent:v7 orRecognizer:v6];
  -[AKAnnotationEventHandler setInitialDraggedPoint:](self, "setInitialDraggedPoint:", v18, v19);
  -[AKAnnotationEventHandler setInitialOtherPoint:](self, "setInitialOtherPoint:", v16, v17);
  -[AKAnnotationEventHandler setInitialCenter:](self, "setInitialCenter:", v14, v15);
  [(AKAnnotationEventHandler *)self setupDraggingConstraints];
  [(AKAnnotationEventHandler *)self windowPointFromEvent:v7 orRecognizer:v6];
  double v9 = v8;
  double v11 = v10;

  -[AKAnnotationEventHandler setLastPositionInWindow:](self, "setLastPositionInWindow:", v9, v11);
  [(AKAnnotationEventHandler *)self lastPositionInWindow];
  -[AKAnnotationEventHandler modelPointFromPointInWindow:](self, "modelPointFromPointInWindow:");
  -[AKAnnotationEventHandler setLastPositionInModel:](self, "setLastPositionInModel:");
  CGFloat v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[AKAnnotationEventHandler setTouchModifiersEnabled:](self, "setTouchModifiersEnabled:", [v12 BOOLForKey:@"AKAnnotationEventTouchModifiersEnabled"]);

  return 1;
}

- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = (unint64_t)([v7 state] - 6) < 0xFFFFFFFFFFFFFFFDLL;
      unint64_t v9 = [v7 modifierFlags];
      uint64_t v10 = (v9 >> 16) & 2 | (v9 >> 19) & 1;
      if (!v10)
      {
        if ([(AKAnnotationEventHandler *)self touchModifiersEnabled]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v11 = [v7 additionalNumberOfTouches];
          uint64_t v10 = ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2) | (2 * ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1));
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      [(AKAnnotationEventHandler *)self windowPointFromEvent:v6 orRecognizer:v7];
      double v13 = v12;
      double v15 = v14;
      -[AKAnnotationEventHandler setLastPositionInWindow:](self, "setLastPositionInWindow:");
      -[AKAnnotationEventHandler modelPointFromPointInWindow:](self, "modelPointFromPointInWindow:", v13, v15);
      double v17 = v16;
      double v19 = v18;
      -[AKAnnotationEventHandler updateModelWithCurrentPoint:options:](self, "updateModelWithCurrentPoint:options:", v10);
      -[AKAnnotationEventHandler setLastPositionInModel:](self, "setLastPositionInModel:", v17, v19);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
}

- (void)setupDraggingConstraints
{
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
}

- (CGPoint)windowPointFromEvent:(id)a3 orRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    BOOL v8 = [v5 allTouches];
    if ([v8 count])
    {
      unint64_t v9 = [v8 anyObject];
      [v9 locationInView:0];
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      double v11 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
    }
  }
  else if (v6)
  {
    [v6 akLocationInWindow];
    double v11 = v14;
    double v13 = v15;
  }
  else
  {
    double v11 = *MEMORY[0x263F00148];
    double v13 = *(double *)(MEMORY[0x263F00148] + 8);
    AKLog(@"%s: Expected event or recognizer.");
  }

  double v16 = v11;
  double v17 = v13;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)modelPointFromPointInWindow:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(AKAnnotationEventHandler *)self pageController];
  id v6 = [v5 overlayView];
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v5, "convertPointFromOverlayToModel:");
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

+ (Class)_handlerClassForPlatformForAnnotation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_3:
    double v4 = objc_opt_class();
  }
  else
  {
    double v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (AKAnnotation)annotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAnnotation:(id)a3
{
}

- (unint64_t)initiallyDraggedArea
{
  return self->_initiallyDraggedArea;
}

- (void)setInitiallyDraggedArea:(unint64_t)a3
{
  self->_initiallyDraggedArea = a3;
}

- (BOOL)touchModifiersEnabled
{
  return self->_touchModifiersEnabled;
}

- (void)setTouchModifiersEnabled:(BOOL)a3
{
  self->_touchModifiersEnabled = a3;
}

- (CGPoint)initialDraggedPoint
{
  objc_copyStruct(v4, &self->_initialDraggedPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setInitialDraggedPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_initialDraggedPoint, &v3, 16, 1, 0);
}

- (CGPoint)initialOtherPoint
{
  objc_copyStruct(v4, &self->_initialOtherPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setInitialOtherPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_initialOtherPoint, &v3, 16, 1, 0);
}

- (CGPoint)initialCenter
{
  objc_copyStruct(v4, &self->_initialCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setInitialCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_initialCenter, &v3, 16, 1, 0);
}

- (BOOL)draggingHorizontalOnly
{
  return self->_draggingHorizontalOnly;
}

- (void)setDraggingHorizontalOnly:(BOOL)a3
{
  self->_draggingHorizontalOnldouble y = a3;
}

- (BOOL)draggingVerticalOnly
{
  return self->_draggingVerticalOnly;
}

- (void)setDraggingVerticalOnly:(BOOL)a3
{
  self->_draggingVerticalOnldouble y = a3;
}

- (CGPoint)lastPositionInModel
{
  objc_copyStruct(v4, &self->_lastPositionInModel, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastPositionInModel:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastPositionInModel, &v3, 16, 1, 0);
}

- (CGPoint)lastPositionInWindow
{
  objc_copyStruct(v4, &self->_lastPositionInWindow, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastPositionInWindow:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastPositionInWindow, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_destroyWeak((id *)&self->_pageController);
}

@end