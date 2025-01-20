@interface ASCSkeletonTextView
- (ASCContentSkeleton)skeleton;
- (ASCSkeletonTextView)initWithCoder:(id)a3;
- (ASCSkeletonTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)skeletonColor;
- (int64_t)skeletonNumberOfLines;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSkeleton:(id)a3;
- (void)setSkeletonColor:(id)a3;
- (void)setSkeletonNumberOfLines:(int64_t)a3;
@end

@implementation ASCSkeletonTextView

- (ASCSkeletonTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASCSkeletonTextView;
  result = -[ASCSkeletonTextView initWithFrame:textContainer:](&v5, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_skeletonNumberOfLines = 1;
  }
  return result;
}

- (ASCSkeletonTextView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setSkeletonNumberOfLines:(int64_t)a3
{
  if (self->_skeletonNumberOfLines != a3)
  {
    self->_skeletonNumberOfLines = a3;
    [(ASCSkeletonTextView *)self invalidateIntrinsicContentSize];
    [(ASCSkeletonTextView *)self setNeedsDisplay];
  }
}

- (UIColor)skeletonColor
{
  skeletonColor = self->_skeletonColor;
  if (skeletonColor)
  {
    v3 = skeletonColor;
  }
  else
  {
    v3 = [(ASCSkeletonTextView *)self textColor];
  }

  return v3;
}

- (void)setSkeletonColor:(id)a3
{
  v4 = (UIColor *)a3;
  skeletonColor = self->_skeletonColor;
  v9 = v4;
  if (!v4 || !skeletonColor)
  {
    if (skeletonColor == v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v6 = [(UIColor *)skeletonColor isEqual:v4];
  v4 = v9;
  if ((v6 & 1) == 0)
  {
LABEL_6:
    v7 = (UIColor *)[(UIColor *)v4 copy];
    v8 = self->_skeletonColor;
    self->_skeletonColor = v7;

    [(ASCSkeletonTextView *)self setNeedsDisplay];
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (void)setSkeleton:(id)a3
{
  v4 = (ASCContentSkeleton *)a3;
  skeleton = self->_skeleton;
  v9 = v4;
  if (!v4 || !skeleton)
  {
    if (skeleton == v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v6 = [(ASCContentSkeleton *)skeleton isEqual:v4];
  v4 = v9;
  if (!v6)
  {
LABEL_6:
    v7 = (ASCContentSkeleton *)[(ASCContentSkeleton *)v4 copy];
    v8 = self->_skeleton;
    self->_skeleton = v7;

    [(ASCSkeletonTextView *)self invalidateIntrinsicContentSize];
    [(ASCSkeletonTextView *)self setNeedsDisplay];
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (CGSize)intrinsicContentSize
{
  v3 = [(ASCSkeletonTextView *)self skeleton];

  if (v3)
  {
    double v4 = *MEMORY[0x1E4FB30D8];
    objc_super v5 = [(ASCSkeletonTextView *)self skeleton];
    [v5 skeletonHeightFromContext:self];
    double v7 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ASCSkeletonTextView;
    [(ASCSkeletonTextView *)&v12 intrinsicContentSize];
    double v4 = v8;
    double v7 = v9;
  }
  double v10 = v4;
  double v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(ASCSkeletonTextView *)self skeleton];

  if (v6)
  {
    double v7 = [(ASCSkeletonTextView *)self skeleton];
    [v7 skeletonHeightFromContext:self];
    double v9 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASCSkeletonTextView;
    -[ASCSkeletonTextView sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
    double width = v10;
    double v9 = v11;
  }
  double v12 = width;
  double v13 = v9;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(ASCSkeletonTextView *)self skeleton];

  if (v8)
  {
    id v9 = [(ASCSkeletonTextView *)self skeleton];
    objc_msgSend(v9, "drawSkeletonInRect:usingSkeletonContext:", self, x, y, width, height);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASCSkeletonTextView;
    -[ASCSkeletonTextView drawRect:](&v10, sel_drawRect_, x, y, width, height);
  }
}

- (int64_t)skeletonNumberOfLines
{
  return self->_skeletonNumberOfLines;
}

- (ASCContentSkeleton)skeleton
{
  return self->_skeleton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);

  objc_storeStrong((id *)&self->_skeletonColor, 0);
}

@end