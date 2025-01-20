@interface CKPhotoStackBalloonView
- (BOOL)canPresentTapbackPicker;
- (BOOL)stackView:(id)a3 shouldAutoplayAsset:(id)a4;
- (CGRect)currentAssetFrameInCoordinateSpace:(id)a3;
- (CKAttachmentMessagePartChatItem)currentAssetChatItem;
- (PXRegionOfInterest)currentAssetRegionOfInterest;
- (UIView)currentAssetSnapshot;
- (id)_createStackView;
- (id)transitionViewForCurrentItem:(id)a3 sourceFrame:(CGRect *)a4;
- (void)_additionalItemsCountDidChange;
- (void)_setTapbackManagerOnStackView:(id)a3;
- (void)_updateAdditionalItemsCount;
- (void)configureForMessagePart:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)removeTransitionView;
- (void)stackView:(id)a3 didChangeCurrentAssetReference:(id)a4 isProgrammaticChange:(BOOL)a5 didChangeIndex:(BOOL)a6;
- (void)stackView:(id)a3 didSelectAssetReference:(id)a4;
- (void)stackViewDidSelectAdditionalItemsCard:(id)a3;
- (void)tapbackPileViewTapped:(id)a3 asset:(id)a4;
@end

@implementation CKPhotoStackBalloonView

- (void)prepareForDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)CKPhotoStackBalloonView;
  [(CKGenericPhotoStackBalloonView *)&v4 prepareForDisplay];
  v3 = [(CKGenericPhotoStackBalloonView *)self stackView];
  [(CKPhotoStackBalloonView *)self _setTapbackManagerOnStackView:v3];

  [(CKPhotoStackBalloonView *)self _updateAdditionalItemsCount];
}

- (id)_createStackView
{
  v7.receiver = self;
  v7.super_class = (Class)CKPhotoStackBalloonView;
  v3 = [(CKGenericPhotoStackBalloonView *)&v7 _createStackView];
  [v3 setDelegate:self];
  [v3 setAllowPlayableContentLoading:1];
  objc_super v4 = [v3 tapGestureRecognizer];
  v5 = [(CKBalloonView *)self doubleTapGestureRecognizer];
  [v4 requireGestureRecognizerToFail:v5];

  [(CKPhotoStackBalloonView *)self _setTapbackManagerOnStackView:v3];

  return v3;
}

- (void)_setTapbackManagerOnStackView:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(CKMediaObjectTapbackManager);
  v5 = [(CKGenericPhotoStackBalloonView *)self gradientReferenceView];
  [(CKMediaObjectTapbackManager *)v6 setGradientReferenceView:v5];

  [(CKMediaObjectTapbackManager *)v6 setInvertTapbackTailDirection:1];
  [(CKMediaObjectTapbackManager *)v6 setPhotoGridTapbackPileDelegate:self];
  [v4 setTapbackStatusManager:v6];
}

- (void)_additionalItemsCountDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CKPhotoStackBalloonView;
  [(CKGenericPhotoStackBalloonView *)&v3 _additionalItemsCountDidChange];
  [(CKPhotoStackBalloonView *)self _updateAdditionalItemsCount];
}

- (void)_updateAdditionalItemsCount
{
  id v7 = [(CKGenericPhotoStackBalloonView *)self stackView];
  objc_super v3 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
  uint64_t v4 = [v3 additionalItemsCount];
  uint64_t v6 = v5;

  objc_msgSend(v7, "setAdditionalItemsCount:", v4, v6);
}

- (void)stackView:(id)a3 didSelectAssetReference:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 tapGestureRecognizer];
  [(CKBalloonView *)self tapGestureRecognized:v7];

  if (!CKIsRunningInMacCatalyst())
  {
    v8 = [(CKBalloonView *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(CKBalloonView *)self delegate];
      [v10 photoStackBalloonView:self photoStack:v11 didSelectAssetReference:v6];
    }
  }
}

- (void)stackView:(id)a3 didChangeCurrentAssetReference:(id)a4 isProgrammaticChange:(BOOL)a5 didChangeIndex:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v12 = a4;
  char v9 = [(CKBalloonView *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(CKBalloonView *)self delegate];
    [v11 photoStackBalloonView:self didChangeCurrentAssetReference:v12 isProgrammaticChange:v7 didChangeIndex:v6];
  }
}

- (BOOL)stackView:(id)a3 shouldAutoplayAsset:(id)a4
{
  return 1;
}

- (void)stackViewDidSelectAdditionalItemsCard:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(CKBalloonView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(CKBalloonView *)self delegate];
    [v6 photoStackBalloonView:self photoStackDidSelectAdditionalItems:v7];
  }
}

- (id)transitionViewForCurrentItem:(id)a3 sourceFrame:(CGRect *)a4
{
  id v6 = a3;
  id v7 = [(CKGenericPhotoStackBalloonView *)self stackView];
  v8 = [v7 currentAssetReference];

  char v9 = [v8 asset];
  char v10 = [v9 mediaObject];

  if (([v10 isEqual:v6] & 1) == 0)
  {
    id v11 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
    id v12 = [v11 mediaObjectDataSource];
    uint64_t v13 = [v12 assetReferenceForMediaObject:v6];

    v14 = [(CKGenericPhotoStackBalloonView *)self stackView];
    [v14 scrollToAssetReference:v13 animated:0];

    v8 = (void *)v13;
  }
  v15 = [v10 transfer];
  int v16 = [v15 isFileURLFinalized];

  if (v16)
  {
    v17 = [(CKGenericPhotoStackBalloonView *)self stackView];
    v18 = [v17 installTransitionSnapshotViewForAssetReference:v8 uncroppedImageFrame:a4];
  }
  else
  {
    v18 = 0;
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    a4->size = v19;
  }

  return v18;
}

- (void)removeTransitionView
{
  id v2 = [(CKGenericPhotoStackBalloonView *)self stackView];
  [v2 removeTransitionSnapshotView];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKPhotoStackBalloonView;
  [(CKGenericPhotoStackBalloonView *)&v5 prepareForReuse];
  objc_super v3 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
  [v3 setMediaObjectDataSource:0];

  uint64_t v4 = [(CKGenericPhotoStackBalloonView *)self stackView];
  objc_msgSend(v4, "setAdditionalItemsCount:", *MEMORY[0x1E4F90E80], *(void *)(MEMORY[0x1E4F90E80] + 8));
}

- (CGRect)currentAssetFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKGenericPhotoStackBalloonView *)self stackView];
  id v6 = [v5 currentAssetReference];
  id v7 = [v5 regionOfInterestForAssetReference:v6];
  [v7 rectInCoordinateSpace:v4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)tapbackPileViewTapped:(id)a3 asset:(id)a4
{
  id v5 = [(CKBalloonView *)self delegate];
  [v5 balloonViewDoubleTapped:self];
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKPhotoStackBalloonView;
  [(CKBalloonView *)&v11 configureForMessagePart:v4];
  id v5 = [(CKGenericPhotoStackBalloonView *)self mediaProvider];
  if (!v5)
  {
    id v6 = objc_alloc_init(CKMediaObjectImageProvider);
    [(CKGenericPhotoStackBalloonView *)self setMediaProvider:v6];
  }
  id v7 = [v4 dataSource];
  double v8 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
  double v9 = v8;
  if (v8)
  {
    [v8 setMediaObjectDataSource:v7];
  }
  else
  {
    double v10 = [[CKMediaObjectAssetDataSourceManager alloc] initWithDataSource:v7];
    [(CKGenericPhotoStackBalloonView *)self setDataSourceManager:v10];
  }
}

- (CKAttachmentMessagePartChatItem)currentAssetChatItem
{
  id v2 = self;
  id v3 = CKPhotoStackBalloonView.currentAssetChatItem.getter();

  return (CKAttachmentMessagePartChatItem *)v3;
}

- (PXRegionOfInterest)currentAssetRegionOfInterest
{
  id v2 = self;
  id v3 = CKPhotoStackBalloonView.currentAssetRegionOfInterest.getter();

  return (PXRegionOfInterest *)v3;
}

- (UIView)currentAssetSnapshot
{
  id v2 = self;
  id v3 = CKPhotoStackBalloonView.currentAssetSnapshot.getter();

  return (UIView *)v3;
}

- (BOOL)canPresentTapbackPicker
{
  id v2 = self;
  id v3 = [(CKGenericPhotoStackBalloonView *)v2 currentAssetReference];

  if (v3) {
  return v3 != 0;
  }
}

@end