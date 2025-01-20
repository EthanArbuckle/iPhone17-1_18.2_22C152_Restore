@interface AKTextBoxAnnotationEventHandler
- (BOOL)canLockAspectRatio;
- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4;
@end

@implementation AKTextBoxAnnotationEventHandler

- (BOOL)canLockAspectRatio
{
  return 0;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(AKAnnotationEventHandler *)self annotation];
  [v8 rectangle];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v21.receiver = self;
  v21.super_class = (Class)AKTextBoxAnnotationEventHandler;
  -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v21, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  [v8 rectangle];
  v23.origin.double x = v17;
  v23.origin.double y = v18;
  v23.size.width = v19;
  v23.size.height = v20;
  v22.origin.double x = v10;
  v22.origin.double y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  if (!CGRectEqualToRect(v22, v23))
  {
    if (([v8 textIsFixedWidth] & 1) == 0) {
      [v8 setTextIsFixedWidth:1];
    }
    if ([v8 textIsClipped]) {
      [v8 setTextIsClipped:0];
    }
  }
}

@end