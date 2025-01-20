@interface CPShape
- (BOOL)canCombineWith:(id)a3;
- (BOOL)hasFill;
- (BOOL)hasSamePathAs:(id)a3;
- (BOOL)hasStroke;
- (BOOL)isStrokeFor:(id)a3;
- (BOOL)isUprightRectangle;
- (BOOL)isVisible;
- (CGAffineTransform)paintTransform;
- (CGColor)fillColor;
- (CGColor)strokeColor;
- (CGPDFObject)fillObject;
- (CGPDFObject)strokeObject;
- (CGPath)path;
- (CGRect)bounds;
- (CGRect)innerBounds;
- (CGRect)renderedBounds;
- (CPShape)init;
- (CPShape)initWithPDFShape:(CPPDFShape *)a3;
- (double)lineWidth;
- (double)miterLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)string;
- (int)lineCap;
- (int)lineJoin;
- (int)windingRule;
- (int64_t)mcid;
- (unsigned)pathElementCount;
- (unsigned)pdfObjectID;
- (void)accept:(id)a3;
- (void)addShape:(id)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)makeLineFromVertex:(CGPoint)a3 toVertex:(CGPoint)a4;
- (void)recomputeBounds;
- (void)recomputeRenderedBounds;
- (void)setFillColor:(CGColor *)a3;
- (void)setFillObject:(CGPDFObject *)a3;
- (void)setLineCap:(int)a3;
- (void)setLineJoin:(int)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setPaintTransform:(CGAffineTransform *)a3;
- (void)setPath:(CGPath *)a3;
- (void)setPdfObjectID:(unsigned int)a3;
- (void)setStrokeColor:(CGColor *)a3;
- (void)setStrokeObject:(CGPDFObject *)a3;
- (void)setWindingRule:(int)a3;
@end

@implementation CPShape

- (unsigned)pathElementCount
{
  path = self->path;
  if (path)
  {
    int info = 0;
    CGPathApply(path, &info, (CGPathApplierFunction)countElements);
    LODWORD(path) = info;
  }
  return path;
}

- (void)makeLineFromVertex:(CGPoint)a3 toVertex:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v7, v6);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  [(CPShape *)self setPath:Mutable];
  if (Mutable) {
    CFRelease(Mutable);
  }
  self->super.clipIndeCGFloat x = 0;
}

- (id)string
{
  __int16 v3 = 32;
  return (id)[NSString stringWithCharacters:&v3 length:1];
}

- (void)addShape:(id)a3
{
  id v5 = a3;
  [a3 remove];
  [(CPChunk *)self addChildrenOf:a3];
  uint64_t v6 = [a3 zOrder];
  if (v6 > [(CPShape *)self zOrder]) {
    -[CPChunk setInsertionOrder:](self, "setInsertionOrder:", [a3 zOrder]);
  }
  if ([a3 hasFill])
  {
    -[CPShape setWindingRule:](self, "setWindingRule:", [a3 windingRule]);
    -[CPShape setFillColor:](self, "setFillColor:", [a3 fillColor]);
    -[CPShape setFillObject:](self, "setFillObject:", [a3 fillObject]);
  }
  if ([a3 hasStroke])
  {
    [a3 lineWidth];
    -[CPShape setLineWidth:](self, "setLineWidth:");
    [a3 miterLimit];
    -[CPShape setMiterLimit:](self, "setMiterLimit:");
    -[CPShape setLineCap:](self, "setLineCap:", [a3 lineCap]);
    -[CPShape setLineJoin:](self, "setLineJoin:", [a3 lineJoin]);
    -[CPShape setStrokeColor:](self, "setStrokeColor:", [a3 strokeColor]);
    -[CPShape setStrokeObject:](self, "setStrokeObject:", [a3 strokeObject]);
  }
  if ([a3 fillObject] || objc_msgSend(a3, "strokeObject"))
  {
    if (a3) {
      [a3 paintTransform];
    }
    else {
      memset(v7, 0, sizeof(v7));
    }
    [(CPShape *)self setPaintTransform:v7];
  }
}

- (BOOL)canCombineWith:(id)a3
{
  clipIndeCGFloat x = self->super.clipIndex;
  if (clipIndex != [a3 clipIndex]) {
    goto LABEL_20;
  }
  if ([(CPShape *)self isStrokeFor:a3])
  {
    if (self->strokeObject && [a3 fillObject])
    {
      p_paintTransform = &self->paintTransform;
      if (a3)
      {
        [a3 paintTransform];
        double v7 = v14[3].f64[0];
      }
      else
      {
        memset(&v14[3], 0, 48);
        double v7 = 0.0;
      }
      if (p_paintTransform->a == v7
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&p_paintTransform->b, *(float64x2_t *)((char *)&v14[3] + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)&p_paintTransform->d, *(float64x2_t *)((char *)&v14[4] + 8)))), 0xFuLL))) & 1) != 0)
      {
        tCGFloat y = p_paintTransform->ty;
        double v12 = v14[5].f64[1];
LABEL_23:
        LOBYTE(v8) = ty == v12;
        return v8;
      }
      goto LABEL_20;
    }
  }
  else
  {
    int v8 = [a3 isStrokeFor:self];
    if (!v8) {
      return v8;
    }
    if (self->fillObject && [a3 strokeObject])
    {
      v9 = &self->paintTransform;
      if (a3)
      {
        [a3 paintTransform];
        double v10 = v14[0].f64[0];
      }
      else
      {
        memset(v14, 0, 48);
        double v10 = 0.0;
      }
      if (v9->a == v10
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v9->b, *(float64x2_t *)((char *)v14 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)&v9->d, *(float64x2_t *)((char *)&v14[1] + 8)))), 0xFuLL))) & 1) != 0)
      {
        tCGFloat y = v9->ty;
        double v12 = v14[2].f64[1];
        goto LABEL_23;
      }
LABEL_20:
      LOBYTE(v8) = 0;
      return v8;
    }
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)isVisible
{
  unint64_t fillColor = (unint64_t)self->fillColor;
  BOOL result = fillColor
        && ((fillColor & 0x8000000000000000) == 0
          ? (double Alpha = *(double *)(fillColor + 8 * *(void *)(fillColor + 56) + 56))
          : (double Alpha = CGTaggedColorGetAlpha(fillColor, (uint64_t)a2, v2, v3, v4, v5, v6, v7)),
            Alpha > 0.0)
        || (unint64_t strokeColor = (unint64_t)self->strokeColor) != 0
        && ((strokeColor & 0x8000000000000000) == 0
          ? (double v12 = *(double *)(strokeColor + 8 * *(void *)(strokeColor + 56) + 56))
          : (double v12 = CGTaggedColorGetAlpha(strokeColor, (uint64_t)a2, v2, v3, v4, v5, v6, v7)),
            v12 > 0.0)
        || self->fillObject
        || self->strokeObject != 0;
  return result;
}

- (BOOL)isStrokeFor:(id)a3
{
  if (-[CPShape hasFill](self, "hasFill") || ([a3 hasStroke] & 1) != 0) {
    return 0;
  }

  return [(CPShape *)self hasSamePathAs:a3];
}

- (BOOL)hasSamePathAs:(id)a3
{
  if (CGPathEqualToPath(self->path, *((CGPathRef *)a3 + 23)))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [(CPShape *)self isUprightRectangle];
    if (v5)
    {
      int v5 = [a3 isUprightRectangle];
      if (v5)
      {
        [(CPShape *)self bounds];
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        [a3 bounds];
        LOBYTE(v5) = 0;
        if (vabdd_f64(v7, v17) <= 0.001 && vabdd_f64(v9, v14) <= 0.001)
        {
          BOOL v18 = vabdd_f64(v11, v15) <= 0.001;
          LOBYTE(v5) = vabdd_f64(v13, v16) <= 0.001 && v18;
        }
      }
    }
  }
  return v5;
}

- (void)setPaintTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->paintTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->paintTransform.c = v4;
  *(_OWORD *)&self->paintTransform.tCGFloat x = v3;
}

- (CGAffineTransform)paintTransform
{
  long long v3 = *(_OWORD *)&self[5].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[6].a;
  return self;
}

- (void)setLineJoin:(int)a3
{
  self->lineJoin = a3;
}

- (int)lineJoin
{
  return self->lineJoin;
}

- (void)setLineCap:(int)a3
{
  self->lineCap = a3;
}

- (int)lineCap
{
  return self->lineCap;
}

- (void)setMiterLimit:(double)a3
{
  self->miterLimit = a3;
}

- (double)miterLimit
{
  return self->miterLimit;
}

- (void)setLineWidth:(double)a3
{
  if (self->lineWidth != a3)
  {
    self->lineWidth = a3;
    self->super.renderedBounds = CGRectNull;
    self->renderedBoundsComputed = 0;
  }
}

- (double)lineWidth
{
  return self->lineWidth;
}

- (BOOL)hasStroke
{
  return self->strokeColor || self->strokeObject != 0;
}

- (void)setStrokeObject:(CGPDFObject *)a3
{
  self->strokeObject = a3;
}

- (CGPDFObject)strokeObject
{
  return self->strokeObject;
}

- (void)setStrokeColor:(CGColor *)a3
{
  unint64_t strokeColor = self->strokeColor;
  if (strokeColor != a3)
  {
    if (strokeColor) {
      CFRelease(strokeColor);
    }
    self->unint64_t strokeColor = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (CGColor)strokeColor
{
  return self->strokeColor;
}

- (BOOL)hasFill
{
  return self->fillColor || self->fillObject != 0;
}

- (void)setFillObject:(CGPDFObject *)a3
{
  self->fillObject = a3;
}

- (CGPDFObject)fillObject
{
  return self->fillObject;
}

- (void)setFillColor:(CGColor *)a3
{
  unint64_t fillColor = self->fillColor;
  if (fillColor != a3)
  {
    if (fillColor) {
      CFRelease(fillColor);
    }
    self->unint64_t fillColor = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (CGColor)fillColor
{
  return self->fillColor;
}

- (void)setWindingRule:(int)a3
{
  self->windingRule = a3;
}

- (int)windingRule
{
  return self->windingRule;
}

- (void)accept:(id)a3
{
}

- (BOOL)isUprightRectangle
{
  return self->isUprightRectangle;
}

- (CGRect)innerBounds
{
  [(CPShape *)self bounds];
  double x = v3;
  double y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(CPShape *)self hasStroke])
  {
    if (x != INFINITY && y != INFINITY)
    {
      v16.origin.double x = x;
      v16.origin.double y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      CGRect v17 = CGRectInset(v16, self->lineWidth * 0.5, self->lineWidth * 0.5);
      double x = v17.origin.x;
      double y = v17.origin.y;
      CGFloat width = v17.size.width;
      CGFloat height = v17.size.height;
    }
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)recomputeRenderedBounds
{
  v29[2] = *(const CGPath **)MEMORY[0x1E4F143B8];
  p_renderedBounds = &self->super.renderedBounds;
  [(CPShape *)self bounds];
  p_renderedBounds->origin.CGFloat x = v4;
  p_renderedBounds->origin.double y = v5;
  p_renderedBounds->size.double width = v6;
  p_renderedBounds->size.double height = v7;
  self->renderedBoundsComputed = 1;
  double y = p_renderedBounds->origin.y;
  if (p_renderedBounds->origin.x != INFINITY && y != INFINITY)
  {
    if ([(CPShape *)self hasStroke]) {
      CGRect *p_renderedBounds = CGRectInset(*p_renderedBounds, self->lineWidth * -0.5, self->lineWidth * -0.5);
    }
    if (self->super.clipIndex)
    {
      double v10 = CPPDFGetClipPathIntersection(objc_msgSend(-[CPObject page](self, "page"), "PDFContext"), self->super.clipIndex, &v28);
      if (v10)
      {
        double v11 = v10;
        double width = p_renderedBounds->size.width;
        double height = p_renderedBounds->size.height;
        if (width >= 1.0) {
          double v14 = 0.0;
        }
        else {
          double v14 = -1.0;
        }
        if (height >= 1.0) {
          double v15 = 0.0;
        }
        else {
          double v15 = -1.0;
        }
        CGFloat x = p_renderedBounds->origin.x;
        CGFloat v17 = p_renderedBounds->origin.y;
        CGRect v30 = CGRectInset(*(CGRect *)(&width - 2), v14, v15);
        CGFloat v18 = v30.origin.x;
        CGFloat v19 = v30.origin.y;
        CGFloat v20 = v30.size.width;
        CGFloat v21 = v30.size.height;
        Mutable = CGPathCreateMutable();
        v31.origin.CGFloat x = v18;
        v31.origin.double y = v19;
        v31.size.double width = v20;
        v31.size.double height = v21;
        CGPathAddRect(Mutable, 0, v31);
        v29[0] = v11;
        v29[1] = Mutable;
        v23 = CGPathCreateMutable();
        CGPathAddIntersection(v23, v29, 2u);
        PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(v23);
        CGFloat v24 = PathBoundingBox.origin.x;
        CGFloat v25 = PathBoundingBox.origin.y;
        CGFloat v26 = PathBoundingBox.size.width;
        CGFloat v27 = PathBoundingBox.size.height;
        if (v23) {
          CFRelease(v23);
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        if (v14 != 0.0 || v15 != 0.0)
        {
          v33.origin.CGFloat x = v24;
          v33.origin.double y = v25;
          v33.size.double width = v26;
          v33.size.double height = v27;
          CGRect v34 = CGRectIntersection(v33, *p_renderedBounds);
          CGFloat v24 = v34.origin.x;
          CGFloat v25 = v34.origin.y;
          CGFloat v26 = v34.size.width;
          CGFloat v27 = v34.size.height;
        }
        p_renderedBounds->origin.CGFloat x = v24;
        p_renderedBounds->origin.double y = v25;
        p_renderedBounds->size.double width = v26;
        p_renderedBounds->size.double height = v27;
      }
    }
    objc_msgSend(-[CPObject page](self, "page"), "pageCropBox");
    CGRect *p_renderedBounds = CGRectIntersection(v35, *p_renderedBounds);
  }
}

- (CGRect)renderedBounds
{
  if (!self->renderedBoundsComputed)
  {
    double y = self->super.renderedBounds.origin.y;
    BOOL v4 = self->super.renderedBounds.origin.x == INFINITY || y == INFINITY;
    if (v4
      || ((double y = self->super.super.bounds.origin.y, self->super.super.bounds.origin.x != INFINITY)
        ? (BOOL v5 = y == INFINITY)
        : (BOOL v5 = 1),
          v5))
    {
      if (self->path) {
        [(CPShape *)self recomputeRenderedBounds];
      }
    }
  }
  double x = self->super.renderedBounds.origin.x;
  double v7 = self->super.renderedBounds.origin.y;
  double width = self->super.renderedBounds.size.width;
  double height = self->super.renderedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v7;
  result.origin.double x = x;
  return result;
}

- (void)setPath:(CGPath *)a3
{
  path = self->path;
  if (path != a3)
  {
    if (path) {
      CFRelease(path);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->path = a3;
    self->super.super.bounds = CGRectNull;
    self->super.renderedBounds = CGRectNull;
    self->boundsComputed = 0;
    self->renderedBoundsComputed = 0;
    self->isUprightRectangle = 0;
  }
}

- (CGPath)path
{
  return self->path;
}

- (void)setPdfObjectID:(unsigned int)a3
{
  self->pdfObjectID = a3;
}

- (unsigned)pdfObjectID
{
  return self->pdfObjectID;
}

- (int64_t)mcid
{
  return self->mcid;
}

- (void)recomputeBounds
{
  PathBoundingBodouble x = CGPathGetPathBoundingBox(self->path);
  -[CPChunk setBounds:](self, "setBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
  self->isUprightRectangle = CGPathIsCongruentToARect(self->path);
  self->boundsComputed = 1;
}

- (CGRect)bounds
{
  if (!self->boundsComputed)
  {
    double y = self->super.super.bounds.origin.y;
    BOOL v4 = self->super.super.bounds.origin.x == INFINITY || y == INFINITY;
    if (v4 && self->path) {
      [(CPShape *)self recomputeBounds];
    }
  }
  double x = self->super.super.bounds.origin.x;
  double v6 = self->super.super.bounds.origin.y;
  double width = self->super.super.bounds.size.width;
  double height = self->super.super.bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v6;
  result.origin.double x = x;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPShape;
  BOOL v4 = [(CPChunk *)&v9 copyWithZone:a3];
  if (v4)
  {
    path = self->path;
    if (path) {
      CFRetain(self->path);
    }
    v4[23] = path;
    unint64_t fillColor = self->fillColor;
    v4[28] = fillColor;
    if (fillColor) {
      CFRetain(fillColor);
    }
    unint64_t strokeColor = self->strokeColor;
    v4[29] = strokeColor;
    if (strokeColor) {
      CFRetain(strokeColor);
    }
  }
  return v4;
}

- (void)dealloc
{
  [(CPShape *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPShape;
  [(CPGraphicObject *)&v3 dealloc];
}

- (void)finalize
{
  [(CPShape *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPShape;
  [(CPShape *)&v3 finalize];
}

- (void)dispose
{
  if (self->path)
  {
    unint64_t fillColor = self->fillColor;
    if (fillColor) {
      CFRelease(fillColor);
    }
    unint64_t strokeColor = self->strokeColor;
    if (strokeColor) {
      CFRelease(strokeColor);
    }
    path = self->path;
    if (path) {
      CFRelease(path);
    }
    self->path = 0;
  }
}

- (CPShape)init
{
  v5.receiver = self;
  v5.super_class = (Class)CPShape;
  uint64_t v2 = [(CPGraphicObject *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(CPChunk *)v2 setShrinksWithChildren:0];
    v3->miterLimit = 10.0;
    v3->lineCap = 0;
    v3->lineJoin = 0;
    v3->paintTransform = CGAffineTransformIdentity;
  }
  return v3;
}

- (CPShape)initWithPDFShape:(CPPDFShape *)a3
{
  BOOL v4 = [(CPShape *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->mcid = a3->var8;
    v4->pdfObjectID = a3->var1;
    var4 = a3->var4;
    if (var4) {
      CFRetain(a3->var4);
    }
    v5->path = var4;
    -[CPChunk setBounds:](v5, "setBounds:", a3->var0.var0.origin.x, a3->var0.var0.origin.y, a3->var0.var0.size.width, a3->var0.var0.size.height);
    v5->isUprightRectangle = CGPathIsCongruentToARect(v5->path);
    [(CPChunk *)v5 setInsertionOrder:a3->var0.var3];
    var2 = a3->var2;
    long long v8 = *(_OWORD *)&a3->var7.a;
    long long v9 = *(_OWORD *)&a3->var7.tx;
    *(_OWORD *)&v5->paintTransform.c = *(_OWORD *)&a3->var7.c;
    *(_OWORD *)&v5->paintTransform.tdouble x = v9;
    *(_OWORD *)&v5->paintTransform.a = v8;
    if ((a3->var3 & 2) != 0)
    {
      [(CPShape *)v5 setStrokeColor:var2->var2];
      [(CPShape *)v5 setStrokeObject:var2->var13];
      [(CPShape *)v5 setLineWidth:sqrt(fabs(a3->var6.a * a3->var6.d - a3->var6.b * a3->var6.c)) * var2->var5];
      [(CPShape *)v5 setMiterLimit:var2->var4];
      if (var2->var6 <= 2u) {
        -[CPShape setLineCap:](v5, "setLineCap:");
      }
      if (var2->var7 <= 2u) {
        -[CPShape setLineJoin:](v5, "setLineJoin:");
      }
    }
    if (a3->var3)
    {
      [(CPShape *)v5 setFillColor:var2->var0];
      [(CPShape *)v5 setFillObject:var2->var12];
      [(CPShape *)v5 setWindingRule:!a3->var5];
    }
  }
  return v5;
}

@end