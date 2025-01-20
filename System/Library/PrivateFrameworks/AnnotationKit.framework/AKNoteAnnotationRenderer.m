@interface AKNoteAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKNoteAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  [a3 rectangle];

  return CGRectInset(*(CGRect *)&v3, -1.0, -1.0);
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = -1.0;
  double v4 = -1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v25 = a3;
  id v10 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v25 forDisplay:v7 pageControllerOrNil:v10];

  [v25 rectangle];
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  CGPathRef v15 = CGPathCreateWithRoundedRect(v27, 1.5, 1.5, 0);
  if (v15)
  {
    v16 = v15;
    id v17 = [v25 fillColor];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v17 CGColor]);
    CGContextSetBlendMode(a4, kCGBlendModeNormal);
    CGContextAddPath(a4, v16);
    CGContextFillPath(a4);
    v18 = [v25 fillColor];
    int64_t v19 = +[AKHighlightAppearanceHelper attributeTagForNoteOfColor:v18];

    if (v19 == 763000
      || (+[AKHighlightAppearanceHelper borderColorForNoteOfHighlightAttributeTag:v19], (v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v22 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.2];
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v22 CGColor]);

      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      CGRect v29 = CGRectInset(v28, 1.0, 1.0);
      v23 = CGPathCreateWithRoundedRect(v29, 0.5, 0.5, 0);
      if (v23)
      {
        v24 = v23;
        CGContextAddPath(a4, v23);
        CGContextFillPath(a4);
        CGPathRelease(v24);
      }
    }
    else
    {
      id v21 = v20;
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v21 CGColor]);
      CGContextSetLineWidth(a4, 1.0);
      CGContextAddPath(a4, v16);
      CGContextStrokePath(a4);
    }
    CGPathRelease(v16);
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [a4 rectangle];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

@end