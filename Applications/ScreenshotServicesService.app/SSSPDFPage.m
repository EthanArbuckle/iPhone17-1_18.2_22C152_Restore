@interface SSSPDFPage
- (BOOL)isSaving;
- (double)vellumOpacity;
- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4;
- (void)setIsSaving:(BOOL)a3;
- (void)setVellumOpacity:(double)a3;
@end

@implementation SSSPDFPage

- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4
{
  [(SSSPDFPage *)self vellumOpacity];
  if (v7 < 1.0)
  {
    v17.receiver = self;
    v17.super_class = (Class)SSSPDFPage;
    [(SSSPDFPage *)&v17 drawWithBox:a3 toContext:a4];
  }
  if ([(SSSPDFPage *)self isSaving])
  {
    [(SSSPDFPage *)self boundsForBox:a3];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(SSSPDFPage *)self vellumOpacity];
    CGContextSetRGBFillColor(a4, 1.0, 1.0, 1.0, v16);
    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    CGContextFillRect(a4, v18);
  }
}

- (double)vellumOpacity
{
  return *(double *)&self->_isSaving;
}

- (void)setVellumOpacity:(double)a3
{
  *(double *)&self->_isSaving = a3;
}

- (BOOL)isSaving
{
  return (BOOL)self->super._private;
}

- (void)setIsSaving:(BOOL)a3
{
  LOBYTE(self->super._private) = a3;
}

@end