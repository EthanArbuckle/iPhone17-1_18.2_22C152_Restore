@interface CRKContainerCardSectionView
+ (CGSize)sizeThatFitsCardSection:(id)a3 boundingSize:(CGSize)a4;
- (BOOL)interceptsTouches;
- (CGSize)contentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (CRKComposableView)composedSuperview;
- (CRKContainerCardSectionView)initWithFrame:(CGRect)a3;
- (NSString)cardSectionViewIdentifier;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)removeFromComposedSuperview;
- (void)setCardSectionViewIdentifier:(id)a3;
- (void)setComposedSuperview:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentView:(id)a3;
- (void)setInterceptsTouches:(BOOL)a3;
@end

@implementation CRKContainerCardSectionView

+ (CGSize)sizeThatFitsCardSection:(id)a3 boundingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CRKContainerCardSectionView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CRKContainerCardSectionView;
  v3 = -[CRKContainerCardSectionView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v5 = [v4 UUIDString];
    cardSectionViewIdentifier = v3->_cardSectionViewIdentifier;
    v3->_cardSectionViewIdentifier = (NSString *)v5;

    id v7 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    userInputEventInterceptView = v3->_userInputEventInterceptView;
    v3->_userInputEventInterceptView = (UIView *)v8;

    [(UIView *)v3->_userInputEventInterceptView setUserInteractionEnabled:1];
    double v10 = v3->_userInputEventInterceptView;
    double v11 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v10 setBackgroundColor:v11];

    double v12 = [(UIView *)v3->_userInputEventInterceptView layer];
    [v12 setAllowsHitTesting:1];

    v13 = [(UIView *)v3->_userInputEventInterceptView layer];
    [v13 setHitTestsAsOpaque:1];

    [(CRKContainerCardSectionView *)v3 addSubview:v3->_userInputEventInterceptView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->_contentView) {
    -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", result.width, result.height);
  }
  else {
    double height = self->_contentSize.height;
  }
  result.double height = height;
  return result;
}

- (void)setContentView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    id v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    contentView = (UIView *)[(CRKContainerCardSectionView *)self insertSubview:self->_contentView atIndex:0];
    uint64_t v5 = v7;
  }

  MEMORY[0x270F9A758](contentView, v5);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CRKContainerCardSectionView;
  [(CRKContainerCardSectionView *)&v5 layoutSubviews];
  contentView = self->_contentView;
  [(CRKContainerCardSectionView *)self bounds];
  -[UIView setFrame:](contentView, "setFrame:");
  userInputEventInterceptView = self->_userInputEventInterceptView;
  [(CRKContainerCardSectionView *)self bounds];
  -[UIView setFrame:](userInputEventInterceptView, "setFrame:");
}

- (void)removeFromComposedSuperview
{
  id v3 = [(CRKContainerCardSectionView *)self composedSuperview];
  [v3 cardSectionSubviewWantsToBeRemovedFromHierarchy:self];
}

- (void)setInterceptsTouches:(BOOL)a3
{
}

- (BOOL)interceptsTouches
{
  return ![(UIView *)self->_userInputEventInterceptView isHidden];
}

- (CRKComposableView)composedSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedSuperview);

  return (CRKComposableView *)WeakRetained;
}

- (void)setComposedSuperview:(id)a3
{
}

- (NSString)cardSectionViewIdentifier
{
  return self->_cardSectionViewIdentifier;
}

- (void)setCardSectionViewIdentifier:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cardSectionViewIdentifier, 0);
  objc_destroyWeak((id *)&self->_composedSuperview);

  objc_storeStrong((id *)&self->_userInputEventInterceptView, 0);
}

@end