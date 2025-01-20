@interface CPColumn
- (BOOL)complete;
- (BOOL)hasCentredParagraph;
- (BOOL)isBoxRegion;
- (BOOL)isGraphicalRegion;
- (BOOL)isImageRegion;
- (BOOL)isRowRegion;
- (BOOL)isShapeRegion;
- (CGRect)paddedBounds;
- (CPColumn)init;
- (double)bottomBaseline;
- (double)leftPad;
- (double)maxLeftPad;
- (double)maxRightPad;
- (double)rightPad;
- (double)selectionBottom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)inOrder;
- (int)outOrder;
- (void)accept:(id)a3;
- (void)dealloc;
- (void)setComplete:(BOOL)a3;
- (void)setHasCentredParagraph:(BOOL)a3;
- (void)setHasColumnBreak:(BOOL)a3;
- (void)setMaxLeftPad:(double)a3;
- (void)setMaxRightPad:(double)a3;
@end

@implementation CPColumn

- (void)setComplete:(BOOL)a3
{
  LOBYTE(self->minLeft) = a3;
}

- (BOOL)complete
{
  return LOBYTE(self->minLeft) & 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Column[%@...]", objc_msgSend(-[CPObject firstChild](self, "firstChild"), "description")];
}

- (double)selectionBottom
{
  if (![(CPObject *)self count]) {
    return 0.0;
  }
  id v3 = [(CPObject *)self lastChild];

  [v3 selectionBottom];
  return result;
}

- (CGRect)paddedBounds
{
  [(CPColumn *)self columnBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CPColumn *)self leftPad];
  double v12 = v4 - v11;
  [(CPColumn *)self leftPad];
  double v14 = v13;
  [(CPColumn *)self rightPad];
  double v16 = v8 + v14 + v15;
  double v17 = v12;
  double v18 = v6;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setMaxRightPad:(double)a3
{
  self->maxLeftPad = a3;
  [(CPChunk *)self bounds];
  if (v7 < 0.0 || v8 < 0.0) {
    *(CGRect *)&double v5 = CGRectStandardize(*(CGRect *)&v5);
  }
  self->maxRightPad = v5 + v7 + a3;
}

- (double)maxRightPad
{
  return self->maxLeftPad;
}

- (void)setMaxLeftPad:(double)a3
{
  [(CPChunk *)self bounds];
  if (v7 < 0.0 || v8 < 0.0) {
    *(void *)&double v5 = (unint64_t)CGRectStandardize(*(CGRect *)&v5);
  }
  self->maxRight = v5 - a3;
  *(double *)&self->hasCentredParagraph = a3;
}

- (double)maxLeftPad
{
  return *(double *)&self->hasCentredParagraph;
}

- (double)rightPad
{
  [(CPChunk *)self bounds];
  if (v5 < 0.0 || v6 < 0.0) {
    *(CGRect *)&double v3 = CGRectStandardize(*(CGRect *)&v3);
  }
  return round((self->maxRightPad - (v3 + v5)) * 0.5);
}

- (double)leftPad
{
  return round(*(double *)&self->hasCentredParagraph * 0.5);
}

- (void)setHasCentredParagraph:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 1) = a3;
}

- (BOOL)hasCentredParagraph
{
  return *(&self->super.dirtyNormalizedBounds + 1);
}

- (double)bottomBaseline
{
  if (![(CPObject *)self count]) {
    return 0.0;
  }
  id v3 = [(CPObject *)self lastChild];
  if (!v3) {
    return 0.0;
  }
  double v4 = (void *)[v3 lastChild];

  [v4 baseline];
  return result;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return 0;
}

- (BOOL)isGraphicalRegion
{
  return 0;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (void)setHasColumnBreak:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 2) = a3;
}

- (void)accept:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPColumn;
  return [(CPRegion *)&v4 copyWithZone:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CPColumn;
  [(CPRegion *)&v2 dealloc];
}

- (CPColumn)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPColumn;
  double result = [(CPRotatedRegion *)&v3 init];
  if (result)
  {
    *(&result->super.dirtyNormalizedBounds + 1) = 0;
    *(&result->super.dirtyNormalizedBounds + 2) = 0;
    result->maxLeftPad = 0.0;
    *(void *)&result->hasCentredParagraph = 0;
    result->maxRight = 0.0;
    result->maxRightPad = 0.0;
    LOBYTE(result->minLeft) = 0;
  }
  return result;
}

- (int)inOrder
{
  objc_super v2 = objc_msgSend(-[CPObject firstChild](self, "firstChild"), "flowProperties");

  return [v2 inOrder];
}

- (int)outOrder
{
  objc_super v2 = objc_msgSend(-[CPObject lastChild](self, "lastChild"), "flowProperties");

  return [v2 outOrder];
}

@end