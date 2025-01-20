@interface WKTextRange
+ (id)textRangeWithState:(BOOL)a3 isRange:(BOOL)a4 isEditable:(BOOL)a5 startRect:(CGRect)a6 endRect:(CGRect)a7 selectionRects:(id)a8 selectedTextLength:(unint64_t)a9;
- (BOOL)_isRanged;
- (BOOL)isEditable;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNone;
- (BOOL)isRange;
- (CGRect)endRect;
- (CGRect)startRect;
- (NSArray)selectionRects;
- (id)description;
- (id)end;
- (id)start;
- (unint64_t)selectedTextLength;
- (void)dealloc;
- (void)setEndRect:(CGRect)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setIsNone:(BOOL)a3;
- (void)setIsRange:(BOOL)a3;
- (void)setSelectedTextLength:(unint64_t)a3;
- (void)setSelectionRects:(id)a3;
- (void)setStartRect:(CGRect)a3;
@end

@implementation WKTextRange

- (BOOL)_isRanged
{
  return ![(WKTextRange *)self isEmpty];
}

+ (id)textRangeWithState:(BOOL)a3 isRange:(BOOL)a4 isEditable:(BOOL)a5 startRect:(CGRect)a6 endRect:(CGRect)a7 selectionRects:(id)a8 selectedTextLength:(unint64_t)a9
{
  BOOL v11 = a5;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v16 = a6.size.height;
  double v17 = a6.size.width;
  double v18 = a6.origin.y;
  double v19 = a6.origin.x;
  BOOL v20 = a4;
  BOOL v21 = a3;
  v22 = objc_alloc_init(WKTextRange);
  [(WKTextRange *)v22 setIsNone:v21];
  [(WKTextRange *)v22 setIsRange:v20];
  [(WKTextRange *)v22 setIsEditable:v11];
  -[WKTextRange setStartRect:](v22, "setStartRect:", v19, v18, v17, v16);
  -[WKTextRange setEndRect:](v22, "setEndRect:", x, y, width, height);
  [(WKTextRange *)v22 setSelectedTextLength:a9];
  [(WKTextRange *)v22 setSelectionRects:a8];
  v23 = (void *)CFMakeCollectable(v22);

  return v23;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WKTextRange;
  [(WKTextRange *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(WKTextRange *)self startRect];
  v5 = NSStringFromCGRect(v7);
  [(WKTextRange *)self endRect];
  return (id)[v3 stringWithFormat:@"%@(%p) - start:%@, end:%@", v4, self, v5, NSStringFromCGRect(v8)];
}

- (id)start
{
  [(WKTextRange *)self startRect];
  objc_super v3 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:");
  if ([(WKTextRange *)self isEmpty]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [(WKTextPosition *)v3 setAnchors:v4];
  return v3;
}

- (id)end
{
  [(WKTextRange *)self endRect];
  objc_super v3 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:");
  [(WKTextPosition *)v3 setAnchors:[(WKTextRange *)self isEmpty] | 2];
  return v3;
}

- (BOOL)isEmpty
{
  return ![(WKTextRange *)self isRange];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v5 = [(WKTextRange *)self isRange];
  int v6 = [a3 isRange];
  if (!v5)
  {
    if ((v6 & 1) == 0)
    {
      [(WKTextRange *)self startRect];
      uint64_t v20 = v31;
      uint64_t v22 = v32;
      uint64_t v24 = v33;
      uint64_t v26 = v34;
      [a3 startRect];
      goto LABEL_12;
    }
LABEL_9:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (!v6) {
    return v6;
  }
  [(WKTextRange *)self startRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [a3 startRect];
  v46.origin.double x = v15;
  v46.origin.double y = v16;
  v46.size.double width = v17;
  v46.size.double height = v18;
  v45.origin.double x = v8;
  v45.origin.double y = v10;
  v45.size.double width = v12;
  v45.size.double height = v14;
  int v6 = CGRectEqualToRect(v45, v46);
  if (!v6) {
    return v6;
  }
  [(WKTextRange *)self endRect];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  [a3 endRect];
LABEL_12:
  uint64_t v35 = v27;
  uint64_t v36 = v28;
  uint64_t v37 = v29;
  uint64_t v38 = v30;
  uint64_t v39 = v20;
  uint64_t v40 = v22;
  uint64_t v41 = v24;
  uint64_t v42 = v26;

  LOBYTE(v6) = CGRectEqualToRect(*(CGRect *)&v39, *(CGRect *)&v35);
  return v6;
}

- (CGRect)startRect
{
  double x = self->_startRect.origin.x;
  double y = self->_startRect.origin.y;
  double width = self->_startRect.size.width;
  double height = self->_startRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartRect:(CGRect)a3
{
  self->_startRect = a3;
}

- (CGRect)endRect
{
  double x = self->_endRect.origin.x;
  double y = self->_endRect.origin.y;
  double width = self->_endRect.size.width;
  double height = self->_endRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndRect:(CGRect)a3
{
  self->_endRect = a3;
}

- (BOOL)isNone
{
  return self->_isNone;
}

- (void)setIsNone:(BOOL)a3
{
  self->_isNone = a3;
}

- (BOOL)isRange
{
  return self->_isRange;
}

- (void)setIsRange:(BOOL)a3
{
  self->_isRange = a3;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (unint64_t)selectedTextLength
{
  return self->_selectedTextLength;
}

- (void)setSelectedTextLength:(unint64_t)a3
{
  self->_selectedTextLength = a3;
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (void)setSelectionRects:(id)a3
{
}

@end