@interface CPImage
- (BOOL)isVisible;
- (CGRect)bounds;
- (CGRect)renderedBounds;
- (CPImage)initWithBounds:(CGRect)a3;
- (CPImage)initWithPDFImage:(CPPDFImage *)a3;
- (CPPDFImage)imageData;
- (void)accept:(id)a3;
- (void)recomputeRenderedBounds;
@end

@implementation CPImage

- (BOOL)isVisible
{
  imageData = self->imageData;
  return !imageData || imageData->var7 > 0.0;
}

- (void)accept:(id)a3
{
}

- (void)recomputeRenderedBounds
{
  v19[2] = *(const CGPath **)MEMORY[0x1E4F143B8];
  self->renderedBoundsComputed = 1;
  objc_msgSend(-[CPObject page](self, "page"), "pageCropBox");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (self->super.clipIndex
    && ((double y = self->super.super.bounds.origin.y, self->super.super.bounds.origin.x != INFINITY)
      ? (BOOL v12 = y == INFINITY)
      : (BOOL v12 = 1),
        !v12
     && (v13 = CPPDFGetClipPathIntersection(objc_msgSend(-[CPObject page](self, "page", INFINITY, y), "PDFContext"), self->super.clipIndex, &v18)) != 0))
  {
    v14 = v13;
    Mutable = CGPathCreateMutable();
    CGPathAddRect(Mutable, 0, self->super.super.bounds);
    v19[0] = v14;
    v19[1] = Mutable;
    v16 = CGPathCreateMutable();
    CGPathAddIntersection(v16, v19, 2u);
    p_renderedBounds = &self->super.renderedBounds;
    CGRect *p_renderedBounds = CGPathGetPathBoundingBox(v16);
    if (v16) {
      CFRelease(v16);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    v20.origin.x = v4;
    v20.origin.double y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    CGRect *p_renderedBounds = CGRectIntersection(v20, *p_renderedBounds);
  }
  else
  {
    v21.origin.x = v4;
    v21.origin.double y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    self->super.renderedBounds = CGRectIntersection(v21, self->super.super.bounds);
  }
}

- (CGRect)bounds
{
  double x = self->super.super.bounds.origin.x;
  double y = self->super.super.bounds.origin.y;
  double width = self->super.super.bounds.size.width;
  double height = self->super.super.bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)renderedBounds
{
  if (!self->renderedBoundsComputed)
  {
    double y = self->super.renderedBounds.origin.y;
    if (self->super.renderedBounds.origin.x == INFINITY || y == INFINITY) {
      [(CPImage *)self recomputeRenderedBounds];
    }
  }
  double x = self->super.renderedBounds.origin.x;
  double v6 = self->super.renderedBounds.origin.y;
  double width = self->super.renderedBounds.size.width;
  double height = self->super.renderedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v6;
  result.origin.double x = x;
  return result;
}

- (CPPDFImage)imageData
{
  return self->imageData;
}

- (CPImage)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CPImage;
  CGRect result = [(CPGraphicObject *)&v8 init];
  if (result)
  {
    result->super.super.bounds.origin.CGFloat x = x;
    result->super.super.bounds.origin.CGFloat y = y;
    result->super.super.bounds.size.CGFloat width = width;
    result->super.super.bounds.size.CGFloat height = height;
  }
  return result;
}

- (CPImage)initWithPDFImage:(CPPDFImage *)a3
{
  CGFloat v4 = -[CPImage initWithBounds:](self, "initWithBounds:", a3->var0.var0.origin.x, a3->var0.var0.origin.y, a3->var0.var0.size.width, a3->var0.var0.size.height);
  double v5 = v4;
  if (v4)
  {
    v4->imageData = a3;
    v4->super.clipIndeCGFloat x = a3->var0.var2;
    [(CPChunk *)v4 setInsertionOrder:a3->var0.var3];
  }
  return v5;
}

@end