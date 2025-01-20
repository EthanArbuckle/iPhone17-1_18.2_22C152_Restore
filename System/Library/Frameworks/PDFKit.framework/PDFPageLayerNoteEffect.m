@interface PDFPageLayerNoteEffect
- (CGRect)pageFrame;
- (id)annotation;
- (void)update;
@end

@implementation PDFPageLayerNoteEffect

- (CGRect)pageFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  [WeakRetained noteBounds];
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

- (id)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);

  return WeakRetained;
}

- (void)update
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->super._private->annotation);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    uint64_t v5 = [(id)WeakRetained markupStyle];
    double v6 = +[PDFAnnotation PDFTextColors];
    id v7 = [v6 objectAtIndex:v5];
    double v8 = (CGColor *)[v7 CGColor];

    double v9 = +[PDFAnnotation PDFTextBorderColors];
    id v10 = [v9 objectAtIndex:v5];
    double v11 = (CGColor *)[v10 CGColor];

    if (!CGColorEqualToColor((CGColorRef)[(PDFPageLayerNoteEffect *)self backgroundColor], v8)) {
      [(PDFPageLayerNoteEffect *)self setBackgroundColor:v8];
    }
    uint64_t WeakRetained = CGColorEqualToColor((CGColorRef)[(PDFPageLayerNoteEffect *)self borderColor], v11);
    uint64_t v4 = v12;
    if ((WeakRetained & 1) == 0)
    {
      uint64_t WeakRetained = [(PDFPageLayerNoteEffect *)self setBorderColor:v11];
      uint64_t v4 = v12;
    }
  }

  MEMORY[0x270F9A758](WeakRetained, v4);
}

@end