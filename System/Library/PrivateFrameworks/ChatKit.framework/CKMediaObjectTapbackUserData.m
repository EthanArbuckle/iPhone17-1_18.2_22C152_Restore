@interface CKMediaObjectTapbackUserData
- (BOOL)invertTailDirection;
- (BOOL)isDisplayedInGridView;
- (BOOL)shouldAnimate;
- (CKGradientReferenceView)gradientReferenceView;
- (CKMediaObjectBackedAsset)asset;
- (CKPhotoGridTapbackPileDelegate)photoGridTapbackPileDelegate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAsset:(id)a3;
- (void)setDisplayedInGridView:(BOOL)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setInvertTailDirection:(BOOL)a3;
- (void)setPhotoGridTapbackPileDelegate:(id)a3;
- (void)setShouldAnimate:(BOOL)a3;
@end

@implementation CKMediaObjectTapbackUserData

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(CKMediaObjectTapbackUserData *)self asset];
  [v4 setAsset:v5];

  v6 = [(CKMediaObjectTapbackUserData *)self gradientReferenceView];
  [v4 setGradientReferenceView:v6];

  objc_msgSend(v4, "setShouldAnimate:", -[CKMediaObjectTapbackUserData shouldAnimate](self, "shouldAnimate"));
  objc_msgSend(v4, "setInvertTailDirection:", -[CKMediaObjectTapbackUserData invertTailDirection](self, "invertTailDirection"));
  objc_msgSend(v4, "setDisplayedInGridView:", -[CKMediaObjectTapbackUserData isDisplayedInGridView](self, "isDisplayedInGridView"));
  v7 = [(CKMediaObjectTapbackUserData *)self photoGridTapbackPileDelegate];
  [v4 setPhotoGridTapbackPileDelegate:v7];

  return v4;
}

- (CKMediaObjectBackedAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (CKGradientReferenceView)gradientReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gradientReferenceView);

  return (CKGradientReferenceView *)WeakRetained;
}

- (void)setGradientReferenceView:(id)a3
{
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (BOOL)invertTailDirection
{
  return self->_invertTailDirection;
}

- (void)setInvertTailDirection:(BOOL)a3
{
  self->_invertTailDirection = a3;
}

- (BOOL)isDisplayedInGridView
{
  return self->_displayedInGridView;
}

- (void)setDisplayedInGridView:(BOOL)a3
{
  self->_displayedInGridView = a3;
}

- (CKPhotoGridTapbackPileDelegate)photoGridTapbackPileDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoGridTapbackPileDelegate);

  return (CKPhotoGridTapbackPileDelegate *)WeakRetained;
}

- (void)setPhotoGridTapbackPileDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoGridTapbackPileDelegate);
  objc_destroyWeak((id *)&self->_gradientReferenceView);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end