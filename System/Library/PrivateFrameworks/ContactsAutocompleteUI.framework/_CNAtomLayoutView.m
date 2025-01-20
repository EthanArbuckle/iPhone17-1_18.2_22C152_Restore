@interface _CNAtomLayoutView
+ (id)layoutViewWithDelegateView:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CGRect)selectionBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNAtomTextViewAtomLayout)delegateView;
- (UIEdgeInsets)atomInsets;
- (_CNAtomLayoutView)init;
- (_CNAtomLayoutView)initWithCoder:(id)a3;
- (_CNAtomLayoutView)initWithDelegateView:(id)a3;
- (_CNAtomLayoutView)initWithFrame:(CGRect)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)viewForLastBaselineLayout;
- (void)layoutSubviews;
- (void)setDelegateView:(id)a3;
- (void)setMaskBounds:(CGRect)a3;
@end

@implementation _CNAtomLayoutView

+ (id)layoutViewWithDelegateView:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDelegateView:v4];

  return v5;
}

- (_CNAtomLayoutView)initWithDelegateView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAtomLayoutView;
  v6 = -[_CNAtomLayoutView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_delegateView = (id *)&v6->_delegateView;
    objc_storeStrong((id *)&v6->_delegateView, a3);
    [*p_delegateView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_CNAtomLayoutView *)v7 setAutoresizesSubviews:0];
    [(_CNAtomLayoutView *)v7 addSubview:*p_delegateView];
    v9 = v7;
  }

  return v7;
}

- (_CNAtomLayoutView)init
{
  return 0;
}

- (_CNAtomLayoutView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (_CNAtomLayoutView)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CNAtomLayoutView;
  if (-[_CNAtomLayoutView respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_CNAtomLayoutView;
  objc_super v5 = -[_CNAtomLayoutView methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(CNAtomTextViewAtomLayout *)self->_delegateView methodSignatureForSelector:a3];
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_delegateView;
}

- (void)setMaskBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_CNAtomLayoutView *)self bounds];
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  BOOL v8 = CGRectEqualToRect(v16, v17);
  v9 = [(_CNAtomLayoutView *)self layer];
  id v14 = v9;
  if (v8)
  {
    [v9 setMask:0];
    v10 = v14;
  }
  else
  {
    objc_super v11 = [v9 mask];

    if (!v11)
    {
      objc_super v11 = [MEMORY[0x1E4F39C88] layer];
      v12 = [(_CNAtomLayoutView *)self layer];
      [v12 setMask:v11];
    }
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", x, y, width, height);
    id v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPath:", objc_msgSend(v13, "CGPath"));

    v10 = v11;
  }
}

- (UIEdgeInsets)atomInsets
{
  objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[_CNAtomLayoutView semanticContentAttribute](self, "semanticContentAttribute"));
  double v2 = 0.0;
  double v3 = 2.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return (id)[(CNAtomTextViewAtomLayout *)self->_delegateView viewForLastBaselineLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CNAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(_CNAtomLayoutView *)self atomInsets];
  double v10 = v5 + v8 + v9;
  double v13 = v7 + v11 + v12;
  double v14 = v10;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_CNAtomLayoutView;
  [(_CNAtomLayoutView *)&v15 layoutSubviews];
  [(_CNAtomLayoutView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_CNAtomLayoutView *)self atomInsets];
  double v12 = v4 + v11;
  -[CNAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", v8, v10);
  -[CNAtomTextViewAtomLayout setFrame:](self->_delegateView, "setFrame:", v12, v6, v13, v14);
}

- (CGRect)selectionBounds
{
  [(CNAtomTextViewAtomLayout *)self->_delegateView bounds];
  delegateView = self->_delegateView;

  -[_CNAtomLayoutView convertRect:fromView:](self, "convertRect:fromView:", delegateView);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  [(_CNAtomLayoutView *)self layoutIfNeeded];
  CGFloat v7 = *MEMORY[0x1E4F1DB28];
  CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[_CNAtomLayoutView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(_CNAtomLayoutView *)self viewForLastBaselineLayout];
  [v12 bounds];
  -[_CNAtomLayoutView convertRect:fromView:](self, "convertRect:fromView:", v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v12 _baselineOffsetFromBottom];
  double v22 = v21;
  v31.origin.double x = v14;
  v31.origin.double y = v16;
  v31.size.double width = v18;
  v31.size.CGFloat height = v20;
  double MaxY = CGRectGetMaxY(v31);
  v32.origin.double x = v7;
  v32.origin.double y = rect;
  v32.size.double width = v9;
  v32.size.CGFloat height = v11;
  double v24 = MaxY - CGRectGetMaxY(v32) - v22;

  double v25 = v7;
  double v26 = v24;
  double v27 = v9;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CNAtomTextViewAtomLayout)delegateView
{
  return self->_delegateView;
}

- (void)setDelegateView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end