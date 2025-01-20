@interface _MFAtomLayoutView
+ (id)layoutViewWithDelegateView:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CGRect)selectionBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFAtomTextViewAtomLayout)delegateView;
- (UIEdgeInsets)atomInsets;
- (_MFAtomLayoutView)init;
- (_MFAtomLayoutView)initWithCoder:(id)a3;
- (_MFAtomLayoutView)initWithDelegateView:(id)a3;
- (_MFAtomLayoutView)initWithFrame:(CGRect)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)viewForLastBaselineLayout;
- (void)layoutSubviews;
- (void)setDelegateView:(id)a3;
- (void)setMaskBounds:(CGRect)a3;
@end

@implementation _MFAtomLayoutView

+ (id)layoutViewWithDelegateView:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDelegateView:v4];

  return v5;
}

- (_MFAtomLayoutView)initWithDelegateView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MFAtomLayoutView;
  v6 = -[_MFAtomLayoutView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_delegateView = (id *)&v6->_delegateView;
    objc_storeStrong((id *)&v6->_delegateView, a3);
    [*p_delegateView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MFAtomLayoutView *)v7 setAutoresizesSubviews:0];
    [(_MFAtomLayoutView *)v7 addSubview:*p_delegateView];
    v9 = v7;
  }

  return v7;
}

- (_MFAtomLayoutView)init
{
}

- (_MFAtomLayoutView)initWithFrame:(CGRect)a3
{
}

- (_MFAtomLayoutView)initWithCoder:(id)a3
{
  id v5 = a3;
  [(_MFAtomLayoutView *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[_MFAtomLayoutView initWithCoder:]", "MFAtomTextView.m", 1957, "0");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MFAtomLayoutView;
  if (-[_MFAtomLayoutView respondsToSelector:](&v5, sel_respondsToSelector_)) {
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
  v7.super_class = (Class)_MFAtomLayoutView;
  objc_super v5 = -[_MFAtomLayoutView methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(MFAtomTextViewAtomLayout *)self->_delegateView methodSignatureForSelector:a3];
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
  [(_MFAtomLayoutView *)self bounds];
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  BOOL v8 = CGRectEqualToRect(v17, v18);
  v9 = [(_MFAtomLayoutView *)self layer];
  id v14 = v9;
  if (v8)
  {
    [v9 setMask:0];
  }
  else
  {
    uint64_t v10 = [v9 mask];

    id v11 = (id)v10;
    if (!v10)
    {
      id v15 = [MEMORY[0x1E4F39C88] layer];
      v12 = [(_MFAtomLayoutView *)self layer];
      [v12 setMask:v15];

      id v11 = v15;
    }
    id v14 = v11;
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x, y, width, height);
    id v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPath:", objc_msgSend(v13, "CGPath"));
  }
}

- (UIEdgeInsets)atomInsets
{
  objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[_MFAtomLayoutView semanticContentAttribute](self, "semanticContentAttribute"));
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
  return (id)[(MFAtomTextViewAtomLayout *)self->_delegateView viewForLastBaselineLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[MFAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(_MFAtomLayoutView *)self atomInsets];
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
  v15.super_class = (Class)_MFAtomLayoutView;
  [(_MFAtomLayoutView *)&v15 layoutSubviews];
  [(_MFAtomLayoutView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_MFAtomLayoutView *)self atomInsets];
  double v12 = v4 + v11;
  -[MFAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", v8, v10);
  -[MFAtomTextViewAtomLayout setFrame:](self->_delegateView, "setFrame:", v12, v6, v13, v14);
}

- (CGRect)selectionBounds
{
  [(MFAtomTextViewAtomLayout *)self->_delegateView bounds];
  delegateView = self->_delegateView;

  -[_MFAtomLayoutView convertRect:fromView:](self, "convertRect:fromView:", delegateView);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  [(_MFAtomLayoutView *)self layoutIfNeeded];
  -[_MFAtomLayoutView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(_MFAtomLayoutView *)self viewForLastBaselineLayout];
  [v12 bounds];
  -[_MFAtomLayoutView convertRect:fromView:](self, "convertRect:fromView:", v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v12 _baselineOffsetFromBottom];
  double v22 = v21;
  v30.origin.double x = v14;
  v30.origin.double y = v16;
  v30.size.double width = v18;
  v30.size.CGFloat height = v20;
  double MaxY = CGRectGetMaxY(v30);
  double v24 = *MEMORY[0x1E4F1DB28];
  v31.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
  v31.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v31.size.double width = v9;
  v31.size.CGFloat height = v11;
  double v25 = MaxY - CGRectGetMaxY(v31) - v22;

  double v26 = v24;
  double v27 = v25;
  double v28 = v9;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (MFAtomTextViewAtomLayout)delegateView
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