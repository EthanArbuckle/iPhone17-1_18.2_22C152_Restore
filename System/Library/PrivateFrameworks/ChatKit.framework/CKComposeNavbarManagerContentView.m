@interface CKComposeNavbarManagerContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKNavigationBarCanvasView)canvasView;
- (void)layoutSubviews;
- (void)setCanvasView:(id)a3;
@end

@implementation CKComposeNavbarManagerContentView

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKComposeNavbarManagerContentView;
  [(CKComposeNavbarManagerContentView *)&v13 layoutSubviews];
  [(CKComposeNavbarManagerContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKComposeNavbarManagerContentView *)self canvasView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(CKComposeNavbarManagerContentView *)self canvasView];
  [v12 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKComposeNavbarManagerContentView;
  -[CKComposeNavbarManagerContentView sizeThatFits:](&v13, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(CKComposeNavbarManagerContentView *)self canvasView];
  objc_msgSend(v8, "sizeThatFits:", v5, v7);
  double v10 = v9;

  double v11 = v5;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CKNavigationBarCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end