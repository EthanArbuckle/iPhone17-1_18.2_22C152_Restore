@interface CKTypingView
- (CKBaseLayer)baseLayer;
- (CKTypingIndicatorLayerProtocol)indicatorLayer;
- (CKTypingView)initWithFrame:(CGRect)a3;
- (void)setBaseLayer:(id)a3;
- (void)setIndicatorLayer:(id)a3;
@end

@implementation CKTypingView

- (CKTypingView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKTypingView;
  v3 = -[CKTypingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CKBaseLayer);
    baseLayer = v3->_baseLayer;
    v3->_baseLayer = v4;

    v6 = v3->_baseLayer;
    v7 = [(CKTypingView *)v3 layer];
    [v7 bounds];
    -[CKBaseLayer setFrame:](v6, "setFrame:");

    v8 = [(CKTypingView *)v3 layer];
    [v8 addSublayer:v3->_baseLayer];
  }
  return v3;
}

- (void)setIndicatorLayer:(id)a3
{
  v5 = (CKTypingIndicatorLayerProtocol *)a3;
  indicatorLayer = self->_indicatorLayer;
  objc_super v10 = v5;
  if (indicatorLayer != v5)
  {
    [(CKTypingIndicatorLayerProtocol *)indicatorLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_indicatorLayer, a3);
    v7 = self->_indicatorLayer;
    v8 = [(CKTypingView *)self layer];
    [v8 bounds];
    -[CKTypingIndicatorLayerProtocol setFrame:](v7, "setFrame:");

    v9 = [(CKTypingView *)self baseLayer];
    [v9 addSublayer:v10];
  }
}

- (CKTypingIndicatorLayerProtocol)indicatorLayer
{
  return self->_indicatorLayer;
}

- (CKBaseLayer)baseLayer
{
  return self->_baseLayer;
}

- (void)setBaseLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLayer, 0);

  objc_storeStrong((id *)&self->_indicatorLayer, 0);
}

@end