@interface PDFTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (PDFTextSelectionRect)initWithRect:(CGRect)a3 onPage:(id)a4;
- (id)description;
- (int64_t)writingDirection;
- (void)setIsEndingRect:(BOOL)a3;
- (void)setIsStartingRect:(BOOL)a3;
@end

@implementation PDFTextSelectionRect

- (PDFTextSelectionRect)initWithRect:(CGRect)a3 onPage:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDFTextSelectionRect;
  v11 = [(PDFTextSelectionRect *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_rect.origin.CGFloat x = x;
    v11->_rect.origin.CGFloat y = y;
    v11->_rect.size.CGFloat width = width;
    v11->_rect.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_page, a4);
  }

  return v12;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)writingDirection
{
  return -1;
}

- (BOOL)containsStart
{
  return self->_isStartingRect;
}

- (BOOL)containsEnd
{
  return self->_isEndingRect;
}

- (BOOL)isVertical
{
  return 0;
}

- (void)setIsStartingRect:(BOOL)a3
{
  self->_isStartingRect = a3;
}

- (void)setIsEndingRect:(BOOL)a3
{
  self->_isEndingRect = a3;
}

- (id)description
{
  v3 = self->_page;
  v4 = [(PDFPage *)v3 document];
  uint64_t v5 = [v4 indexForPage:v3];

  v6 = "Yes";
  if (self->_isStartingRect) {
    v7 = "Yes";
  }
  else {
    v7 = "No";
  }
  if (!self->_isEndingRect) {
    v6 = "No";
  }
  return (id)[NSString stringWithFormat:@"Page index %d, rect {(%.2f, %.2f),(%.2f, %.2f) }, is start? %s, is end? %s", v5, *(_OWORD *)&self->_rect.origin, *(void *)&self->_rect.size.width, *(void *)&self->_rect.size.height, v7, v6];
}

- (void).cxx_destruct
{
}

@end