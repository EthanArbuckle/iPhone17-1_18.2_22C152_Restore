@interface AKImageAnnotationEventHandler
- (BOOL)lockAspectRatioByDefault;
- (CGSize)naturalSizeForAnnotation;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKImageAnnotationEventHandler

- (BOOL)lockAspectRatioByDefault
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  v2 = [(AKAnnotationEventHandler *)self annotation];
  v3 = [v2 image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKImageAnnotationEventHandler;
  -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v4, sel_updateModelWithCurrentPoint_options_, a4, a3.x, a3.y);
}

@end