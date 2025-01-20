@interface AKSpeechBubbleAnnotationEventHandler
- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKSpeechBubbleAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  CGPoint v24 = (CGPoint)*MEMORY[0x263F00148];
  CGPoint v25 = v24;
  CGPoint v23 = v24;
  v14 = [(AKAnnotationEventHandler *)self annotation];
  unint64_t v15 = [(AKAnnotationEventHandler *)self initiallyDraggedArea];
  if (v15 - 1 < 8 || v15 == 14)
  {
    v20.receiver = self;
    v20.super_class = (Class)AKSpeechBubbleAnnotationEventHandler;
    [(AKThoughtBubbleAnnotationEventHandler *)&v20 getInitialDraggedPoint:&v25 otherPoint:&v24 center:&v23 forEvent:v12 orRecognizer:v13];
  }
  else if (v15 == 15)
  {
    v16 = [(AKAnnotationEventHandler *)self pageController];
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:v14 withUpdatedProperties:0 firstPoint:v22 secondPoint:v21];
    if (+[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", [v16 currentModelToScreenExifOrientation]))
    {
      v17 = (CGPoint *)v21;
    }
    else
    {
      v17 = (CGPoint *)v22;
    }
    CGPoint v25 = *v17;
    [v14 rectangle];
    CGFloat MidX = CGRectGetMidX(v26);
    [v14 rectangle];
    CGFloat MidY = CGRectGetMidY(v27);
    v23.x = MidX;
    v23.y = MidY;
    CGPoint v24 = v23;
  }
  *a3 = v25;
  *a4 = v24;
  *a5 = v23;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(AKAnnotationEventHandler *)self annotation];
  memset(&v19[1], 0, 48);
  [v8 rectangle];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v8 rotationAngle];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v10, v12, v14, v16, -v17);
  v18 = [(AKAnnotationEventHandler *)self pageController];
  if ([(AKAnnotationEventHandler *)self initiallyDraggedArea] == 15)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", [(AKAnnotationEventHandler *)self initiallyDraggedArea], v8, v18, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
    +[AKSpeechBubbleAnnotationRenderer pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:](AKSpeechBubbleAnnotationRenderer, "pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:", v8);
    objc_msgSend(v8, "setPointyBitBaseWidthAngle:");
  }
  else
  {
    v19[0].receiver = self;
    v19[0].super_class = (Class)AKSpeechBubbleAnnotationEventHandler;
    -[objc_super updateModelWithCurrentPoint:options:](v19, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  }
}

@end