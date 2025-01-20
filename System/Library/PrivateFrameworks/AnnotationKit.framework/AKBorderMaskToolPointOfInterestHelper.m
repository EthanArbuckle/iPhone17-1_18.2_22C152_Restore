@interface AKBorderMaskToolPointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKBorderMaskToolPointOfInterestHelper

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___AKBorderMaskToolPointOfInterestHelper;
  unint64_t v12 = (unint64_t)objc_msgSendSuper2(&v14, sel__concreteDraggableAreaForPoint_onAnnotation_withScale_pageControllerForPixelAlignment_, v11, a6, x, y, a5);
  if (!v12)
  {
    if (+[AKAnnotationRenderer pointIsOnInside:ofAnnotation:](AKAnnotationRenderer, "pointIsOnInside:ofAnnotation:", v11, x, y))
    {
      unint64_t v12 = 20;
    }
    else
    {
      unint64_t v12 = 0;
    }
  }

  return v12;
}

@end