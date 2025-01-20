@interface PDFDetectedFormField
- (BOOL)canBeMergedWith:(id)a3;
- (CGRect)rect;
- (PDFDetectedFormField)initWithRect:(CGRect)a3 andKind:(int64_t)a4;
- (double)maxX;
- (double)maxY;
- (double)minX;
- (double)minY;
- (double)segmentWidth;
- (int64_t)index;
- (int64_t)kind;
- (int64_t)numberOfSegments;
- (void)setIndex:(int64_t)a3;
- (void)setKind:(int64_t)a3;
- (void)setNumberOfSegments:(int64_t)a3;
- (void)setRect:(CGRect)a3;
- (void)setSegmentWidth:(double)a3;
@end

@implementation PDFDetectedFormField

- (PDFDetectedFormField)initWithRect:(CGRect)a3 andKind:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PDFDetectedFormField;
  result = [(PDFDetectedFormField *)&v10 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
    result->_kind = a4;
  }
  return result;
}

- (double)minX
{
  return CGRectGetMinX(self->_rect);
}

- (double)maxX
{
  return CGRectGetMaxX(self->_rect);
}

- (double)minY
{
  return CGRectGetMinY(self->_rect);
}

- (double)maxY
{
  return CGRectGetMaxY(self->_rect);
}

- (BOOL)canBeMergedWith:(id)a3
{
  id v4 = a3;
  [(PDFDetectedFormField *)self minY];
  double v6 = v5;
  [v4 minY];
  if (v6 == v7 && (-[PDFDetectedFormField maxY](self, "maxY"), double v9 = v8, [v4 maxY], v9 == v10))
  {
    [v4 minX];
    double v12 = v11;
    [(PDFDetectedFormField *)self maxX];
    BOOL v14 = v12 - v13 <= 1.0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (CGRect)rect
{
  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_indeCGFloat x = a3;
}

- (int64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (void)setNumberOfSegments:(int64_t)a3
{
  self->_numberOfSegments = a3;
}

- (double)segmentWidth
{
  return self->_segmentWidth;
}

- (void)setSegmentWidth:(double)a3
{
  self->_segmentWidth = a3;
}

@end