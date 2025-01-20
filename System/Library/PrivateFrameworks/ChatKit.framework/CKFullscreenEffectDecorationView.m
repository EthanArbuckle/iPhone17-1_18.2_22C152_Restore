@interface CKFullscreenEffectDecorationView
+ (id)decorationViewKind;
+ (id)reuseIdentifier;
- (CKFullscreenEffectView)effectView;
- (void)prepareForReuse;
- (void)setEffectView:(id)a3;
- (void)setupForEffectView:(id)a3;
- (void)tearDownEffectView;
@end

@implementation CKFullscreenEffectDecorationView

+ (id)decorationViewKind
{
  return @"FullscreenEffectDecorationView";
}

+ (id)reuseIdentifier
{
  return @"FullscreenEffectDecorationView-reuseIdentifier";
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKFullscreenEffectDecorationView;
  [(CKFullscreenEffectDecorationView *)&v3 prepareForReuse];
  [(CKFullscreenEffectDecorationView *)self tearDownEffectView];
}

- (void)setupForEffectView:(id)a3
{
  id v4 = a3;
  [(CKFullscreenEffectDecorationView *)self bounds];
  objc_msgSend(v4, "setFrame:");
  [(CKFullscreenEffectDecorationView *)self addSubview:v4];
  [(CKFullscreenEffectDecorationView *)self setEffectView:v4];
}

- (void)tearDownEffectView
{
  objc_super v3 = [(CKFullscreenEffectDecorationView *)self effectView];
  [v3 stopAnimation];

  id v4 = [(CKFullscreenEffectDecorationView *)self effectView];
  [v4 removeFromSuperview];
}

- (CKFullscreenEffectView)effectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_effectView);

  return (CKFullscreenEffectView *)WeakRetained;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end