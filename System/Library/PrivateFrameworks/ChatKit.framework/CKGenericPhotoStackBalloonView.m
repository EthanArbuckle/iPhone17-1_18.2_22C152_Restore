@interface CKGenericPhotoStackBalloonView
+ (id)genericStackViewWithItemAspectRatio:(double)a3;
- (BOOL)_scrollLeadingAnimated:(BOOL)a3;
- (BOOL)_scrollTrailingAnimated:(BOOL)a3;
- (BOOL)pageLeftAnimated:(BOOL)a3;
- (BOOL)pageRightAnimated:(BOOL)a3;
- (BOOL)wantsContactImageLayout;
- (CKGradientReferenceView)gradientReferenceView;
- (PXAssetReference)currentAssetReference;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXMessagesStackView)stackView;
- (PXUIMediaProvider)mediaProvider;
- (double)horizontalContentMargin;
- (double)horizontalContentMarginForSize:(CGSize)a3;
- (id)_createStackView;
- (id)createOverlayImageView;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setDataSourceManager:(id)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setHasOverlay:(BOOL)a3 autoDismiss:(BOOL)a4;
- (void)setHorizontalContentMarginAdjustment:(double)a3 edge:(int64_t)a4;
- (void)setMediaProvider:(id)a3;
- (void)setWantsContactImageLayout:(BOOL)a3;
@end

@implementation CKGenericPhotoStackBalloonView

+ (id)genericStackViewWithItemAspectRatio:(double)a3
{
  v3 = [[CKMessagesCarouselView alloc] initWithItemAspectRatio:a3];

  return v3;
}

- (void)prepareForDisplay
{
  v5.receiver = self;
  v5.super_class = (Class)CKGenericPhotoStackBalloonView;
  [(CKBalloonView *)&v5 prepareForDisplay];
  if (!self->_stackView)
  {
    v3 = [(CKGenericPhotoStackBalloonView *)self _createStackView];
    stackView = self->_stackView;
    self->_stackView = v3;

    [(CKGenericPhotoStackBalloonView *)self addSubview:self->_stackView];
  }
  if (objc_opt_respondsToSelector()) {
    [(PXMessagesStackView *)self->_stackView prepareForDisplay];
  }
}

- (id)createOverlayImageView
{
  return 0;
}

- (void)setHasOverlay:(BOOL)a3 autoDismiss:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKGenericPhotoStackBalloonView;
  [(CKBalloonView *)&v6 setHasOverlay:a3 autoDismiss:a4];
  if (objc_opt_respondsToSelector()) {
    [(PXMessagesStackView *)self->_stackView setSelectionOverlayEnabled:v4];
  }
}

- (PXAssetReference)currentAssetReference
{
  return (PXAssetReference *)[(PXMessagesStackView *)self->_stackView currentAssetReference];
}

- (double)horizontalContentMarginForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v6 = objc_opt_respondsToSelector();
  stackView = self->_stackView;
  if (v6)
  {
    -[PXMessagesStackView horizontalContentMarginForSize:](stackView, "horizontalContentMarginForSize:", width, height);
  }
  else if (objc_opt_respondsToSelector())
  {
    v9 = self->_stackView;
    [(PXMessagesStackView *)v9 horizontalContentMargin];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (void)setHorizontalContentMarginAdjustment:(double)a3 edge:(int64_t)a4
{
  if (objc_opt_respondsToSelector())
  {
    if (a4)
    {
      if (a4 != 1) {
        return;
      }
      double v7 = 0.0;
    }
    else
    {
      double v7 = a3;
      a3 = 0.0;
    }
    [(PXMessagesStackView *)self->_stackView setLeftEdgeHorizontalContentMarginAdjustment:v7];
    stackView = self->_stackView;
    [(PXMessagesStackView *)stackView setRightEdgeHorizontalContentMarginAdjustment:a3];
  }
}

- (BOOL)_scrollTrailingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXMessagesStackView *)self->_stackView currentIndex] + 1;
  stackView = self->_stackView;

  return [(PXMessagesStackView *)stackView scrollToIndex:v5 animated:v3];
}

- (BOOL)_scrollLeadingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXMessagesStackView *)self->_stackView currentIndex];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    stackView = self->_stackView;
    LOBYTE(v5) = [(PXMessagesStackView *)stackView scrollToIndex:v6 animated:v3];
  }
  return v5;
}

- (BOOL)pageRightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKGenericPhotoStackBalloonView *)self effectiveUserInterfaceLayoutDirection];
  if (v5 == 1)
  {
    return [(CKGenericPhotoStackBalloonView *)self _scrollLeadingAnimated:v3];
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return [(CKGenericPhotoStackBalloonView *)self _scrollTrailingAnimated:v3];
  }
}

- (BOOL)pageLeftAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKGenericPhotoStackBalloonView *)self effectiveUserInterfaceLayoutDirection];
  if (v5 == 1)
  {
    return [(CKGenericPhotoStackBalloonView *)self _scrollTrailingAnimated:v3];
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return [(CKGenericPhotoStackBalloonView *)self _scrollLeadingAnimated:v3];
  }
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CKGenericPhotoStackBalloonView;
  [(CKBalloonView *)&v22 layoutSubviews];
  [(CKGenericPhotoStackBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  v9 = +[CKUIBehavior sharedBehaviors];
  [v9 stackBalloonVerticalInset];
  double v11 = v10;
  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 smallTranscriptSpace];
  double v14 = v13;

  [(CKGenericPhotoStackBalloonView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  if (CKMainScreenScale_once_22 != -1) {
    dispatch_once(&CKMainScreenScale_once_22, &__block_literal_global_52);
  }
  double v19 = v8 + v14 * -2.0 + v11 * 2.0;
  double v20 = v16 + floor((v18 - v19) * 0.5);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_22 == 0.0) {
    double v21 = 1.0;
  }
  else {
    double v21 = *(double *)&CKMainScreenScale_sMainScreenScale_22;
  }
  -[PXMessagesStackView setFrame:](self->_stackView, "setFrame:", round(v4 * v21) / v21, round(v20 * v21) / v21, round(v6 * v21) / v21, round(v19 * v21) / v21);
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)CKGenericPhotoStackBalloonView;
  [(CKBalloonView *)&v2 prepareForReuse];
}

- (id)_createStackView
{
  id v3 = objc_alloc(MEMORY[0x1E4F90348]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = [(CKGenericPhotoStackBalloonView *)self mediaProvider];
  [v4 setMediaProvider:v5];

  double v6 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
  [v4 setDataSourceManager:v6];

  double v7 = +[CKUIBehavior sharedBehaviors];
  [v7 stackBalloonVerticalInset];
  objc_msgSend(v4, "setVerticalContentInsets:");

  return v4;
}

- (void)setMediaProvider:(id)a3
{
  double v5 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXMessagesStackView *)self->_stackView setMediaProvider:self->_mediaProvider];
    double v5 = v6;
  }
}

- (void)setDataSourceManager:(id)a3
{
  double v5 = (PXAssetsDataSourceManager *)a3;
  p_dataSourceManager = &self->_dataSourceManager;
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager != v5)
  {
    double v8 = v5;
    [(PXAssetsDataSourceManager *)dataSourceManager unregisterChangeObserver:self context:DataSourceManagerObservationContext];
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    [(PXAssetsDataSourceManager *)*p_dataSourceManager registerChangeObserver:self context:DataSourceManagerObservationContext];
    [(PXMessagesStackView *)self->_stackView setDataSourceManager:*p_dataSourceManager];
    double v5 = v8;
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 2) != 0 && (void *)DataSourceManagerObservationContext == a5) {
    [(CKGenericPhotoStackBalloonView *)self _additionalItemsCountDidChange];
  }
}

- (PXMessagesStackView)stackView
{
  return self->_stackView;
}

- (CKGradientReferenceView)gradientReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gradientReferenceView);

  return (CKGradientReferenceView *)WeakRetained;
}

- (void)setGradientReferenceView:(id)a3
{
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  self->_wantsContactImageLayout = a3;
}

- (double)horizontalContentMargin
{
  return self->_horizontalContentMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_destroyWeak((id *)&self->_gradientReferenceView);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end