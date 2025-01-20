@interface PDFPageLayerAnnotationEffect
- (CGRect)pageFrame;
- (id)UUID;
- (id)annotation;
- (void)drawInContext:(CGContext *)a3;
- (void)update;
@end

@implementation PDFPageLayerAnnotationEffect

- (CGRect)pageFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  [WeakRetained extendedBoundsForAction:0];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)update
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    double v4 = [WeakRetained geometryInterface];
    v5.n128_u64[0] = 0;
    v6.n128_u64[0] = 0;
    objc_msgSend(v4, "convertRectToRootView:fromPageLayer:", v8, PDFRectMake(v5, v6, 1.0, 1.0));
    [(PDFPageLayerAnnotationEffect *)self setContentsScale:v7];
    [(PDFPageLayerAnnotationEffect *)self setNeedsDisplay];

    id WeakRetained = v8;
  }
}

- (id)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);

  return WeakRetained;
}

- (id)UUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  double v3 = [WeakRetained pdfAnnotationUUID];

  return v3;
}

- (void)drawInContext:(CGContext *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  id v5 = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  if (WeakRetained) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    CGContextSaveGState(a3);
    [WeakRetained bounds];
    double v8 = v7;
    double v10 = v9;
    [WeakRetained extendedBoundsForAction:0];
    double v12 = v11;
    double v14 = v13;
    v15 = [v5 page];
    objc_msgSend(v15, "boundsForBox:", objc_msgSend(v5, "displayBox"));
    double v17 = v16;
    double v19 = v18;

    CGContextTranslateCTM(a3, v8 - v12 + v17 - v8, v10 - v14 + v19 - v10);
    BOOL v20 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
    CGContextSetProperty();
    objc_msgSend(WeakRetained, "drawWithBox:inContext:", objc_msgSend(v5, "displayBox"), a3);
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:v20];
    +[PDFAnnotation setAnnotationPageLayerEffectIsFlipped:0];
    CGContextRestoreGState(a3);
  }
}

@end