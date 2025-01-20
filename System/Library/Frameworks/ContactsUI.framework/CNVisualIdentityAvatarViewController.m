@interface CNVisualIdentityAvatarViewController
+ (id)descriptorForRequiredKeys;
+ (id)log;
+ (unint64_t)maxContactAvatars;
- (BOOL)_canShowWhileLocked;
- (BOOL)isPerformingTransition;
- (BOOL)shouldDisplayPrimaryAvatarImage;
- (BOOL)shouldUseBadgeButton;
- (BOOL)usingDropAppearance;
- (CAShapeLayer)avatarAlternativeImageViewClippingLayer;
- (CAShapeLayer)avatarClippingLayer;
- (CGRect)avatarFrameForFocusedAvatarInView:(id)a3;
- (CGSize)estimatedSizeThatFits:(CGSize)a3;
- (CGSize)previousSize;
- (CGSize)primaryAvatarSize;
- (CNAvatarAccessoryView)mediaContextBadge;
- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings;
- (CNGroupAvatarLayerLayoutDelegate)layoutDelegate;
- (CNScheduler)callbackQueue;
- (CNScheduler)renderingQueue;
- (CNUIAvatarLayoutLayerItem)avatarLayerItem;
- (CNVisualIdentity)visualIdentity;
- (CNVisualIdentityAvatarLayoutManager)avatarLayoutManager;
- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3;
- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4;
- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5;
- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5 avatarLayoutType:(unint64_t)a6;
- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5 avatarLayoutType:(unint64_t)a6 withLayoutDelegate:(id)a7;
- (CNVisualIdentityContactAvatarProvider)avatarProvider;
- (CNVisualIdentityPrimaryAvatarProvider)primaryAvatarProvider;
- (UIImage)badgeImage;
- (UIImageView)avatarAlternativeImageView;
- (UIImageView)badgeImageView;
- (UIImageView)mediaContextBadgeView;
- (UITapGestureRecognizer)badgeTapGestureRecognizer;
- (UIView)contentView;
- (id)containingCellView;
- (id)layerForPrimaryAvatar;
- (id)pendingViewUpdate;
- (id)primaryAvatarLayer;
- (int64_t)itemCount;
- (void)beginDropAppearance;
- (void)contactDidChange:(id)a3;
- (void)createPrimaryAvatarLayerIfNeeded;
- (void)dealloc;
- (void)endDropAppearance;
- (void)layoutAvatars;
- (void)layoutAvatarsWithIdentifiers:(id)a3;
- (void)layoutPrimaryAvatar;
- (void)loadView;
- (void)logSublayersContent;
- (void)removeAllSublayers;
- (void)removeBadgeTapGestureRecognizer;
- (void)setAvatarAlternativeImageView:(id)a3;
- (void)setAvatarAlternativeImageViewClippingLayer:(id)a3;
- (void)setAvatarClippingLayer:(id)a3;
- (void)setAvatarLayerItem:(id)a3;
- (void)setAvatarLayoutManager:(id)a3;
- (void)setAvatarProvider:(id)a3;
- (void)setBadgeImage:(id)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setBadgeStyleSettings:(id)a3;
- (void)setBadgeTapGestureRecognizer:(id)a3;
- (void)setBadgeTarget:(id)a3 action:(SEL)a4;
- (void)setBadgeViewImage:(id)a3;
- (void)setContentView:(id)a3;
- (void)setIsPerformingTransition:(BOOL)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setMediaContextBadge:(id)a3;
- (void)setMediaContextBadgeView:(id)a3;
- (void)setPendingViewUpdate:(id)a3;
- (void)setPreviousSize:(CGSize)a3;
- (void)setPrimaryAvatarProvider:(id)a3;
- (void)setUsingDropAppearance:(BOOL)a3;
- (void)setVisualIdentity:(id)a3;
- (void)updateAvatarSublayersAndAddToView;
- (void)updateBadgeCropStyle;
- (void)updateBadgeImageViewBackgroundColor;
- (void)updateBadgeImageViewContentMode;
- (void)updateBadgeImageViewPosition;
- (void)updateBadgeStyling;
- (void)updateBadgeTintColor;
- (void)updateBadgeViewFrame;
- (void)updateContactChangesNotifierRegistration;
- (void)updateImageForLayerItem:(id)a3 atIndex:(int64_t)a4 includePlaceholder:(BOOL)a5;
- (void)updateImageForLayerItem:(id)a3 atIndex:(int64_t)a4 includePlaceholder:(BOOL)a5 animated:(BOOL)a6;
- (void)updateImageForPrimaryAvatar;
- (void)updateMediaContextBadgeFrame;
- (void)updateMediaContextBadgeImage;
- (void)updatePrimaryAvatar;
- (void)updateViewForContact:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)visualIdentityDidUpdate:(id)a3;
@end

@implementation CNVisualIdentityAvatarViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_avatarAlternativeImageViewClippingLayer, 0);
  objc_storeStrong((id *)&self->_avatarClippingLayer, 0);
  objc_storeStrong((id *)&self->_avatarAlternativeImageView, 0);
  objc_storeStrong((id *)&self->_avatarLayerItem, 0);
  objc_storeStrong(&self->_pendingViewUpdate, 0);
  objc_storeStrong((id *)&self->_badgeTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_mediaContextBadgeView, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_primaryAvatarProvider, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_avatarLayoutManager, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);

  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
}

- (void)setLayoutDelegate:(id)a3
{
}

- (CNGroupAvatarLayerLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (CNGroupAvatarLayerLayoutDelegate *)WeakRetained;
}

- (void)setVisualIdentity:(id)a3
{
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setUsingDropAppearance:(BOOL)a3
{
  self->_usingDropAppearance = a3;
}

- (BOOL)usingDropAppearance
{
  return self->_usingDropAppearance;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (CGSize)previousSize
{
  double width = self->_previousSize.width;
  double height = self->_previousSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAvatarAlternativeImageViewClippingLayer:(id)a3
{
}

- (CAShapeLayer)avatarAlternativeImageViewClippingLayer
{
  return self->_avatarAlternativeImageViewClippingLayer;
}

- (void)setAvatarClippingLayer:(id)a3
{
}

- (CAShapeLayer)avatarClippingLayer
{
  return self->_avatarClippingLayer;
}

- (void)setAvatarAlternativeImageView:(id)a3
{
}

- (UIImageView)avatarAlternativeImageView
{
  return self->_avatarAlternativeImageView;
}

- (void)setAvatarLayerItem:(id)a3
{
}

- (CNUIAvatarLayoutLayerItem)avatarLayerItem
{
  return self->_avatarLayerItem;
}

- (void)setPendingViewUpdate:(id)a3
{
}

- (id)pendingViewUpdate
{
  return self->_pendingViewUpdate;
}

- (void)setBadgeTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)badgeTapGestureRecognizer
{
  return self->_badgeTapGestureRecognizer;
}

- (void)setBadgeImageView:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setMediaContextBadgeView:(id)a3
{
}

- (UIImageView)mediaContextBadgeView
{
  return self->_mediaContextBadgeView;
}

- (void)setAvatarProvider:(id)a3
{
}

- (CNVisualIdentityContactAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (CNScheduler)callbackQueue
{
  return self->_callbackQueue;
}

- (CNScheduler)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setPrimaryAvatarProvider:(id)a3
{
}

- (CNVisualIdentityPrimaryAvatarProvider)primaryAvatarProvider
{
  return self->_primaryAvatarProvider;
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (void)setAvatarLayoutManager:(id)a3
{
}

- (CNVisualIdentityAvatarLayoutManager)avatarLayoutManager
{
  return self->_avatarLayoutManager;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (id)primaryAvatarLayer
{
  v3 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
  v4 = [v3 layer];

  if (![(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage])
  {
    v5 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    v6 = [v5 avatarLayerItems];
    v7 = [v6 firstObject];
    uint64_t v8 = [v7 layer];

    v4 = (void *)v8;
  }

  return v4;
}

- (CGSize)estimatedSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(CNVisualIdentityAvatarViewController *)self itemCount];
  if (v6 <= 0)
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    uint64_t v7 = v6;
    BOOL v8 = [(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage];
    v9 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    v10 = v9;
    if (v8) {
      objc_msgSend(v9, "avatarFrameInBounds:forItemCount:", v7, 0.0, 0.0, width, height);
    }
    else {
      objc_msgSend(v9, "adHocAvatarFrameInBounds:forItemCount:", v7, 0.0, 0.0, width, height);
    }
    double v13 = v11;
    double v14 = v12;
  }
  double v15 = v13;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)primaryAvatarSize
{
  v2 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGRect)avatarFrameForFocusedAvatarInView:(id)a3
{
  id v4 = a3;
  double v5 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  [v5 avatarFrameForFocusedAvatarInView:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)visualIdentityDidUpdate:(id)a3
{
  id v9 = a3;
  id v4 = [(CNVisualIdentityAvatarViewController *)self layoutDelegate];

  [(CNVisualIdentityAvatarViewController *)self setVisualIdentity:v9];
  if (v4)
  {
    double v5 = [v9 contacts];
    double v6 = objc_msgSend(v5, "_cn_map:", *MEMORY[0x1E4F1AFA0]);
    [(CNVisualIdentityAvatarViewController *)self layoutAvatarsWithIdentifiers:v6];
  }
  else
  {
    double v7 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

    if (v7)
    {
      double v8 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];
      [v8 updatePrimaryAvatarForVisualIdentity:v9];
    }
    [(CNVisualIdentityAvatarViewController *)self layoutAvatars];
    if ([(CNVisualIdentityAvatarViewController *)self shouldUseBadgeButton])
    {
      [(CNVisualIdentityAvatarViewController *)self updateBadgeButtonFrame];
    }
    else
    {
      [(CNVisualIdentityAvatarViewController *)self updateMediaContextBadgeFrame];
      [(CNVisualIdentityAvatarViewController *)self updateBadgeViewFrame];
    }
    double v5 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
    [v5 setImage:0];
  }
}

- (BOOL)shouldDisplayPrimaryAvatarImage
{
  double v3 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

  if (v3)
  {
    id v4 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];
    char v5 = [v4 primaryAvatarShouldDisplay];
  }
  else
  {
    id v4 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
    char v5 = [v4 hasImageDataAvailable];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)endDropAppearance
{
  if ([(CNVisualIdentityAvatarViewController *)self usingDropAppearance])
  {
    [(CNVisualIdentityAvatarViewController *)self setUsingDropAppearance:0];
    [(CNVisualIdentityAvatarViewController *)self layoutAvatars];
  }
}

- (void)beginDropAppearance
{
  if (![(CNVisualIdentityAvatarViewController *)self usingDropAppearance]
    && [(CNVisualIdentityAvatarViewController *)self itemCount] >= 2)
  {
    [(CNVisualIdentityAvatarViewController *)self setUsingDropAppearance:1];
    [(CNVisualIdentityAvatarViewController *)self layoutAvatars];
  }
}

- (id)layerForPrimaryAvatar
{
  double v3 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    [(CNVisualIdentityAvatarViewController *)self createPrimaryAvatarLayerIfNeeded];
    char v5 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
    id v4 = [v5 layer];
  }

  return v4;
}

- (int64_t)itemCount
{
  double v3 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  unint64_t v4 = [v3 maxAvatarCount];

  char v5 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
  BOOL v6 = [v5 contacts];
  unint64_t v7 = [v6 count];

  if (v4 >= v7) {
    return v7;
  }
  else {
    return v4;
  }
}

- (void)updateImageForLayerItem:(id)a3 atIndex:(int64_t)a4 includePlaceholder:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
  double v12 = [v11 contacts];
  double v13 = [v12 objectAtIndexedSubscript:a4];

  uint64_t v44 = 0;
  v45 = (id *)&v44;
  uint64_t v46 = 0x3042000000;
  v47 = __Block_byref_object_copy__16314;
  v48 = __Block_byref_object_dispose__16315;
  id v49 = 0;
  double v14 = [v10 layer];
  [v14 size];
  double v16 = v15;
  double v17 = [v10 layer];
  [v17 size];
  double v19 = v18;

  float v20 = v16;
  double v21 = floorf(v20);
  float v22 = v19;
  double v23 = floorf(v22);
  if (*MEMORY[0x1E4F1DB30] == v21 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v23)
  {
    v31 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      int64_t v32 = [(CNVisualIdentityAvatarViewController *)self itemCount];
      v33 = [(CNVisualIdentityAvatarViewController *)self containingCellView];
      *(_DWORD *)buf = 134218242;
      int64_t v51 = v32;
      __int16 v52 = 2114;
      v53 = v33;
      _os_log_impl(&dword_18B625000, v31, OS_LOG_TYPE_INFO, "Skipping image update for layer with size zero, itemCount: %lu, containingCell:%{public}@", buf, 0x16u);
    }
    [(CNVisualIdentityAvatarViewController *)self logSublayersContent];
  }
  else
  {
    v25 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [MEMORY[0x1E4F5A6B0] publicFingerprintForContact:v13];
      *(_DWORD *)buf = 138543362;
      int64_t v51 = (int64_t)v26;
      _os_log_impl(&dword_18B625000, v25, OS_LOG_TYPE_INFO, "Fetching image for contact %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v10);
    v27 = [v13 identifier];
    [v10 setIdentifier:v27];

    v28 = [(CNVisualIdentityAvatarViewController *)self avatarProvider];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke;
    v37 = &unk_1E5497B48;
    objc_copyWeak(&v40, (id *)buf);
    objc_copyWeak(&v41, &location);
    v39 = &v44;
    id v38 = v13;
    BOOL v42 = a6;
    v29 = objc_msgSend(v28, "avatarImageForContact:withSize:includePlaceholder:imageHandler:", v38, v7, &v34, v21, v23);
    objc_msgSend(v10, "setAvatarImageRendererToken:", v29, v34, v35, v36, v37);

    v30 = [v10 avatarImageRendererToken];
    objc_storeWeak(v45 + 5, v30);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v44, 8);
  objc_destroyWeak(&v49);
}

void __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke_2;
  v6[3] = &unk_1E5497B20;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  unint64_t v4 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v7 = v4;
  id v8 = v3;
  char v12 = *(unsigned char *)(a1 + 64);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_loadWeakRetained((id *)(a1 + 64));
  unint64_t v4 = [v3 avatarImageRendererToken];

  id v5 = [v3 avatarImageRendererToken];
  id v6 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

  if (v4) {
    BOOL v7 = v5 == v6;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = v7;
  uint64_t v9 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [MEMORY[0x1E4F5A6B0] publicFingerprintForContact:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) size];
    id v11 = NSStringFromSize(v30);
    int v23 = 138543874;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v11;
    __int16 v27 = 1024;
    int v28 = v8;
    _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_INFO, "Received image for contact %{public}@, image size:%{public}@, shouldRender:%d", (uint8_t *)&v23, 0x1Cu);
  }
  if (*(void *)(a1 + 40))
  {
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  char v12 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v23) = 0;
  }

  if (v8)
  {
LABEL_15:
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    uint64_t v13 = *MEMORY[0x1E4F3A3D8];
    double v14 = [v3 layer];
    [v14 setContentsGravity:v13];

    [*(id *)(a1 + 40) scale];
    double v16 = v15;
    double v17 = [v3 layer];
    [v17 setContentsScale:v16];

    uint64_t v18 = [*(id *)(a1 + 40) CGImage];
    double v19 = [v3 layer];
    [v19 setContents:v18];

    float v20 = [v3 layer];
    [v20 setAllowsEdgeAntialiasing:1];

    [MEMORY[0x1E4F39CF8] commit];
    if ([WeakRetained shouldDisplayPrimaryAvatarImage] && *(unsigned char *)(a1 + 72))
    {
      double v21 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v21 setDuration:0.3];
      [v21 setFromValue:&unk_1ED915698];
      [v21 setToValue:&unk_1ED9156B0];
      [v21 setRemovedOnCompletion:1];
      float v22 = [v3 layer];
      [v22 addAnimation:v21 forKey:0];
    }
  }
LABEL_18:
}

- (void)updateImageForLayerItem:(id)a3 atIndex:(int64_t)a4 includePlaceholder:(BOOL)a5
{
}

- (void)layoutPrimaryAvatar
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

  id v23 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  unint64_t v4 = [(CNVisualIdentityAvatarViewController *)self contentView];
  [v23 avatarFrameForFocusedAvatarInView:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v3)
  {
    uint64_t v13 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];
    double v14 = [v13 viewForPrimaryAvatar];
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
  }
  else
  {
    double v15 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
    double v16 = [v15 layer];
    objc_msgSend(v16, "setFrame:", v6, v8, v10, v12);

    double v17 = (void *)MEMORY[0x1E4FB14C0];
    id v23 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
    unint64_t v4 = [v23 layer];
    [v4 frame];
    double v19 = v18;
    uint64_t v13 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
    double v14 = [v13 layer];
    [v14 frame];
    objc_msgSend(v17, "bezierPathWithOvalInRect:", 0.0, 0.0, v19);
    id v20 = objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 CGPath];
    float v22 = [(CNVisualIdentityAvatarViewController *)self avatarClippingLayer];
    [v22 setPath:v21];
  }
}

- (void)updateImageForPrimaryAvatar
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

  if (!v3 && ![(CNVisualIdentityAvatarViewController *)self usingDropAppearance])
  {
    unint64_t v4 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
    double v5 = [v4 layer];

    double v6 = [(CNVisualIdentityAvatarViewController *)self renderingQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke;
    v8[3] = &unk_1E549BF80;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [v6 performBlock:v8];
  }
}

void __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) visualIdentity];
  id v3 = (id)[v2 avatarImage];

  unint64_t v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke_2;
  v7[3] = &unk_1E549BF80;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 performBlock:v7];
}

void __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 40) visualIdentity];
  id v3 = [v2 avatarImage];
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(v3, "CGImage"));

  unint64_t v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 40) itemCount];
    uint64_t v6 = [*(id *)(a1 + 40) containingCellView];
    int v10 = 134218242;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_INFO, "Updating image for primary avatar, itemCount: %lu, containingCell:%{public}@", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) visualIdentity];
  id v8 = [v7 avatarImage];

  if (!v8)
  {
    uint64_t v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
    }
  }
}

- (void)createPrimaryAvatarLayerIfNeeded
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];

  if (!v3)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    unint64_t v4 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    objc_msgSend(v8, "setZPosition:", (double)(objc_msgSend(v4, "maxAvatarCount") + 1));

    [v8 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A610]) initWithLayer:v8];
    [(CNVisualIdentityAvatarViewController *)self setAvatarLayerItem:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    [(CNVisualIdentityAvatarViewController *)self setAvatarClippingLayer:v6];

    id v7 = [(CNVisualIdentityAvatarViewController *)self avatarClippingLayer];
    [v8 setMask:v7];
  }
}

- (void)updatePrimaryAvatar
{
  if ([(CNVisualIdentityAvatarViewController *)self usingDropAppearance]) {
    return;
  }
  id v3 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

  if (v3)
  {
    unint64_t v4 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];
    uint64_t v5 = [v4 viewForPrimaryAvatar];

    id v6 = [v5 superview];
    id v7 = [(CNVisualIdentityAvatarViewController *)self view];

    if (v6 != v7)
    {
      id v8 = [(CNVisualIdentityAvatarViewController *)self view];
      uint64_t v9 = [(CNVisualIdentityAvatarViewController *)self contentView];
      [v8 insertSubview:v5 belowSubview:v9];
LABEL_7:
    }
  }
  else
  {
    uint64_t v5 = [(CNVisualIdentityAvatarViewController *)self layerForPrimaryAvatar];
    int v10 = [v5 superlayer];
    uint64_t v11 = [(CNVisualIdentityAvatarViewController *)self view];
    __int16 v12 = [v11 layer];

    if (v10 != v12)
    {
      id v8 = [(CNVisualIdentityAvatarViewController *)self contentView];
      uint64_t v9 = [v8 layer];
      [v9 addSublayer:v5];
      goto LABEL_7;
    }
  }

  [(CNVisualIdentityAvatarViewController *)self updateImageForPrimaryAvatar];

  [(CNVisualIdentityAvatarViewController *)self layoutPrimaryAvatar];
}

- (void)updateAvatarSublayersAndAddToView
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  unint64_t v4 = [v3 avatarLayerItems];
  uint64_t v5 = [v4 count];

  id v6 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  id v7 = [v6 avatarLayerItems];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      int v10 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      uint64_t v11 = [v10 avatarLayerItems];
      __int16 v12 = [v11 objectAtIndexedSubscript:v9];

      uint64_t v13 = [v12 layer];
      uint64_t v14 = [v13 superlayer];

      if (!v14)
      {
        double v15 = [(CNVisualIdentityAvatarViewController *)self contentView];
        double v16 = [v15 layer];
        double v17 = [v12 layer];
        [v16 addSublayer:v17];
      }
      [(CNVisualIdentityAvatarViewController *)self updateImageForLayerItem:v12 atIndex:v9 includePlaceholder:v5 == 1 animated:v14 == 0];

      ++v9;
      double v18 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      double v19 = [v18 avatarLayerItems];
      unint64_t v20 = [v19 count];
    }
    while (v9 < v20);
  }
}

- (void)layoutAvatarsWithIdentifiers:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage]
    || [(CNVisualIdentityAvatarViewController *)self usingDropAppearance])
  {
    uint64_t v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int64_t v6 = [(CNVisualIdentityAvatarViewController *)self itemCount];
      id v7 = [(CNVisualIdentityAvatarViewController *)self containingCellView];
      int v59 = 134218242;
      int64_t v60 = v6;
      __int16 v61 = 2114;
      v62 = v7;
      _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, "Laying out avatars with primary avatar image, itemCount: %lu, containingCell:%{public}@", (uint8_t *)&v59, 0x16u);
    }
    if ([(CNVisualIdentityAvatarViewController *)self itemCount] < 2)
    {
      [(CNVisualIdentityAvatarViewController *)self removeAllSublayers];
      [(CNVisualIdentityAvatarViewController *)self updatePrimaryAvatar];
    }
    else
    {
      uint64_t v8 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      int64_t v9 = [(CNVisualIdentityAvatarViewController *)self itemCount];
      int v10 = [(CNVisualIdentityAvatarViewController *)self contentView];
      [v8 updateAvatarLayersWithPrimaryAvatarForItemCount:v9 inView:v10];

      [(CNVisualIdentityAvatarViewController *)self updateAvatarSublayersAndAddToView];
      [(CNVisualIdentityAvatarViewController *)self updatePrimaryAvatar];
      uint64_t v11 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];
      [v11 layoutPrimaryAvatar];
    }
  }
  else
  {
    __int16 v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int64_t v13 = [(CNVisualIdentityAvatarViewController *)self itemCount];
      uint64_t v14 = [(CNVisualIdentityAvatarViewController *)self containingCellView];
      int v59 = 134218242;
      int64_t v60 = v13;
      __int16 v61 = 2114;
      v62 = v14;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_INFO, "Laying out avatars with no primary avatar image, itemCount: %lu, containingCell:%{public}@", (uint8_t *)&v59, 0x16u);
    }
    double v15 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];

    if (v15)
    {
      double v16 = [(CNVisualIdentityAvatarViewController *)self primaryAvatarProvider];
      double v17 = [v16 viewForPrimaryAvatar];
      [v17 removeFromSuperview];
    }
    else
    {
      double v18 = [(CNVisualIdentityAvatarViewController *)self layerForPrimaryAvatar];
      [v18 removeFromSuperlayer];

      double v16 = [(CNVisualIdentityAvatarViewController *)self layerForPrimaryAvatar];
      [v16 setContents:0];
    }

    double v19 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    int64_t v20 = [(CNVisualIdentityAvatarViewController *)self itemCount];
    uint64_t v21 = [(CNVisualIdentityAvatarViewController *)self contentView];
    [v19 updateAvatarLayersForItemCount:v20 inView:v21 identifiers:v4];

    [(CNVisualIdentityAvatarViewController *)self updateAvatarSublayersAndAddToView];
  }
  int64_t v22 = [(CNVisualIdentityAvatarViewController *)self itemCount];
  id v23 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
  v24 = v23;
  if (v22 == 1)
  {

    if (!v24)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [(CNVisualIdentityAvatarViewController *)self setAvatarAlternativeImageView:v25];

      v26 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
      [v26 setContentMode:2];

      id v27 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      [(CNVisualIdentityAvatarViewController *)self setAvatarAlternativeImageViewClippingLayer:v27];

      int v28 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageViewClippingLayer];
      uint64_t v29 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
      NSSize v30 = [v29 layer];
      [v30 setMask:v28];
    }
    v31 = [(CNVisualIdentityAvatarViewController *)self contentView];
    int64_t v32 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
    [v31 addSubview:v32];

    if ([(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage])
    {
      v33 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
      uint64_t v34 = [v33 layer];
      [v34 frame];
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
    }
    else
    {
      v33 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      uint64_t v34 = [v33 avatarLayerItems];
      v43 = [v34 firstObject];
      uint64_t v44 = [v43 layer];
      [v44 frame];
      double v36 = v45;
      double v38 = v46;
      double v40 = v47;
      double v42 = v48;
    }
    id v49 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
    objc_msgSend(v49, "setFrame:", v36, v38, v40, v42);

    v50 = (void *)MEMORY[0x1E4FB14C0];
    v24 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
    int64_t v51 = [v24 layer];
    [v51 frame];
    double v53 = v52;
    uint64_t v54 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageView];
    v55 = [v54 layer];
    [v55 frame];
    objc_msgSend(v50, "bezierPathWithOvalInRect:", 0.0, 0.0, v53);
    id v56 = objc_claimAutoreleasedReturnValue();
    uint64_t v57 = [v56 CGPath];
    v58 = [(CNVisualIdentityAvatarViewController *)self avatarAlternativeImageViewClippingLayer];
    [v58 setPath:v57];
  }
  else
  {
    [v23 removeFromSuperview];
  }
}

- (void)layoutAvatars
{
}

- (void)logSublayersContent
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(CNVisualIdentityAvatarViewController *)self contentView];
  id v3 = [v2 layer];
  id v4 = [v3 sublayers];
  uint64_t v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_42);

  int64_t v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_debug_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEBUG, "Sublayers content: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

id __59__CNVisualIdentityAvatarViewController_logSublayersContent__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  [v3 size];
  id v4 = NSStringFromSize(v9);
  uint64_t v5 = [v3 contents];

  int64_t v6 = [v2 stringWithFormat:@"Layer size:%@, contents:%@", v4, v5];

  return v6;
}

- (id)containingCellView
{
  v2 = [(CNVisualIdentityAvatarViewController *)self view];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (void)updateViewForContact:(id)a3
{
  id v4 = a3;
  [(CNVisualIdentityAvatarViewController *)self setPendingViewUpdate:0];
  if ([(CNVisualIdentityAvatarViewController *)self itemCount] == 1)
  {
    uint64_t v5 = [v4 imageData];
    int64_t v6 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
    [v6 setImageData:v5];

    [v4 cropRect];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
    objc_msgSend(v15, "setCropRect:", v8, v10, v12, v14);

    double v16 = [v4 thumbnailImageData];
    double v17 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
    [v17 setThumbnailImageData:v16];

    double v18 = [v4 fullscreenImageData];
    double v19 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
    [v19 setFullscreenImageData:v18];

    if ([(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage])
    {
      int64_t v20 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      uint64_t v21 = [v20 avatarLayerItems];
      uint64_t v22 = [v21 count];

      if (v22 == 1)
      {
        [(CNVisualIdentityAvatarViewController *)self removeAllSublayers];
        [(CNVisualIdentityAvatarViewController *)self updatePrimaryAvatar];
      }
      [(CNVisualIdentityAvatarViewController *)self updateImageForPrimaryAvatar];
      unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v23 = 0;
    }
  }
  else
  {
    v24 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    id v25 = [v24 avatarLayerItems];
    uint64_t v26 = [v25 count];

    if (!v26) {
      goto LABEL_13;
    }
    id v27 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
    int v28 = [v27 contacts];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __61__CNVisualIdentityAvatarViewController_updateViewForContact___block_invoke;
    v38[3] = &unk_1E549C040;
    id v39 = v4;
    unint64_t v23 = objc_msgSend(v28, "_cn_indexOfFirstObjectPassingTest:", v38);
  }
  uint64_t v29 = [(CNVisualIdentityAvatarViewController *)self view];
  NSSize v30 = [v29 window];

  if (v30)
  {
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      int64_t v32 = [v31 avatarLayerItems];
      unint64_t v33 = [v32 count];

      if (v23 < v33)
      {
        uint64_t v34 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
        double v35 = [v34 avatarLayerItems];
        double v36 = [v35 objectAtIndexedSubscript:v23];

        [(CNVisualIdentityAvatarViewController *)self updateImageForLayerItem:v36 atIndex:v23 includePlaceholder:0 animated:0];
        double v37 = [(CNVisualIdentityAvatarViewController *)self view];
        [v37 setNeedsLayout];
      }
    }
  }
LABEL_13:
}

uint64_t __61__CNVisualIdentityAvatarViewController_updateViewForContact___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  uint64_t v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (void)contactDidChange:(id)a3
{
  id v4 = a3;
  if ([(CNVisualIdentityAvatarViewController *)self isPerformingTransition])
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__CNVisualIdentityAvatarViewController_contactDidChange___block_invoke;
    v5[3] = &unk_1E549B670;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(CNVisualIdentityAvatarViewController *)self setPendingViewUpdate:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CNVisualIdentityAvatarViewController *)self updateViewForContact:v4];
  }
}

void __57__CNVisualIdentityAvatarViewController_contactDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateViewForContact:*(void *)(a1 + 32)];
}

- (void)updateContactChangesNotifierRegistration
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self visualIdentity];
  id v4 = [v3 contacts];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__CNVisualIdentityAvatarViewController_updateContactChangesNotifierRegistration__block_invoke;
  v5[3] = &unk_1E549B4B0;
  void v5[4] = self;
  objc_msgSend(v4, "_cn_each:", v5);
}

void __80__CNVisualIdentityAvatarViewController_updateContactChangesNotifierRegistration__block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v5 = [v4 contactChangesNotifier];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v10[0] = v7;
  double v8 = +[CNVisualIdentity descriptorForImageKeys];
  v10[1] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v5 registerObserver:v6 forContact:v3 keysToFetch:v9];
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  if (self->_isPerformingTransition != a3)
  {
    self->_isPerformingTransition = a3;
    if (!a3)
    {
      id v4 = [(CNVisualIdentityAvatarViewController *)self pendingViewUpdate];

      if (v4)
      {
        uint64_t v5 = [(CNVisualIdentityAvatarViewController *)self pendingViewUpdate];
        v5[2]();
      }
    }
  }
}

- (void)updateMediaContextBadgeFrame
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];

  if (v3)
  {
    id v4 = [(CNVisualIdentityAvatarViewController *)self contentView];
    uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];

    uint64_t v6 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    id v7 = [(CNVisualIdentityAvatarViewController *)self contentView];
    [v6 avatarFrameForFocusedAvatarInView:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    if (![(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage])
    {
      double v16 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      double v17 = [(CNVisualIdentityAvatarViewController *)self contentView];
      objc_msgSend(v16, "adHocAvatarFrameInView:forItemCount:", v17, -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount"));
      double v9 = v18;
      double v13 = v19;

      if (v5 != 1) {
        double v9 = v9 + v13 * 0.15;
      }
    }
    int64_t v20 = (void *)MEMORY[0x1E4F5A618];
    id v30 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadge];
    objc_msgSend(v20, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", objc_msgSend(v30, "badgeType"), v5 == 1, v9, v11, v13, v15);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    uint64_t v29 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);
  }
}

- (void)updateMediaContextBadgeImage
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadge];
  id v4 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  [v4 setMediaContextBadge:v3];

  uint64_t v5 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadge];

  uint64_t v6 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
  id v7 = v6;
  if (v5)
  {

    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
      double v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CNVisualIdentityAvatarViewController *)self setMediaContextBadgeView:v9];

      double v10 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];

      double v11 = [(CNVisualIdentityAvatarViewController *)self view];
      double v12 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
      if (v10)
      {
        double v13 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
        [v11 insertSubview:v12 belowSubview:v13];
      }
      else
      {
        [v11 addSubview:v12];
      }
    }
    [(CNVisualIdentityAvatarViewController *)self updateMediaContextBadgeFrame];
    id v7 = [(CNVisualIdentityAvatarViewController *)self avatarProvider];
    double v14 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadge];
    double v15 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
    [v15 bounds];
    double v18 = objc_msgSend(v7, "imageForAvatarAccessoryView:withSize:", v14, v16, v17);
    double v19 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
    [v19 setImage:v18];
  }
  else
  {
    [v6 setImage:0];
  }

  [(CNVisualIdentityAvatarViewController *)self layoutAvatars];

  [(CNVisualIdentityAvatarViewController *)self updateBadgeViewFrame];
}

- (void)setMediaContextBadge:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_mediaContextBadge] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaContextBadge, a3);
    [(CNVisualIdentityAvatarViewController *)self updateMediaContextBadgeImage];
  }
}

- (UIImage)badgeImage
{
  v2 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)updateBadgeViewFrame
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self view];
  BOOL v4 = [v3 effectiveUserInterfaceLayoutDirection] == 1;

  id v5 = (void *)MEMORY[0x1E4F5A618];
  uint64_t v6 = [(CNVisualIdentityAvatarViewController *)self view];
  [(CNVisualIdentityAvatarViewController *)self avatarFrameForFocusedAvatarInView:v6];
  objc_msgSend(v5, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", 1, v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  [(CNVisualIdentityAvatarViewController *)self updateBadgeImageViewPosition];
}

- (void)removeBadgeTapGestureRecognizer
{
  id v3 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  BOOL v4 = [(CNVisualIdentityAvatarViewController *)self badgeTapGestureRecognizer];
  [v3 removeGestureRecognizer:v4];

  [(CNVisualIdentityAvatarViewController *)self setBadgeTapGestureRecognizer:0];
}

- (void)setBadgeTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FB1D38];
  id v7 = a3;
  id v10 = (id)[[v6 alloc] initWithTarget:v7 action:a4];

  double v8 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  [v8 addGestureRecognizer:v10];

  double v9 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  [v9 setUserInteractionEnabled:1];

  [(CNVisualIdentityAvatarViewController *)self setBadgeTapGestureRecognizer:v10];
}

- (void)setBadgeViewImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(CNVisualIdentityAvatarViewController *)self setBadgeImageView:v6];

    id v7 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
    [v7 setClipsToBounds:1];
  }
  double v8 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];

  double v9 = [(CNVisualIdentityAvatarViewController *)self view];
  id v10 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  if (v8)
  {
    double v11 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
    [v9 insertSubview:v10 aboveSubview:v11];
  }
  else
  {
    [v9 addSubview:v10];
  }

  double v12 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  [v12 setImage:v4];

  [(CNVisualIdentityAvatarViewController *)self updateBadgeViewFrame];
}

- (void)setBadgeImage:(id)a3
{
  if (a3)
  {
    -[CNVisualIdentityAvatarViewController setBadgeViewImage:](self, "setBadgeViewImage:");
    [(CNVisualIdentityAvatarViewController *)self updateBadgeImageViewBackgroundColor];
  }
  else
  {
    id v4 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
    [v4 setImage:0];

    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    id v5 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
    [v5 setBackgroundColor:v6];
  }
}

- (void)updateBadgeImageViewPosition
{
  uint64_t v4 = [(CNVisualIdentityAvatarViewController *)self view];
  uint64_t v5 = [(id)v4 effectiveUserInterfaceLayoutDirection];

  LOBYTE(v4) = [(CNVisualIdentityAvatarViewController *)self shouldDisplayPrimaryAvatarImage];
  id v6 = [(CNVisualIdentityAvatarViewController *)self view];
  [(CNVisualIdentityAvatarViewController *)self avatarFrameForFocusedAvatarInView:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if ((v4 & 1) == 0 && [(CNVisualIdentityAvatarViewController *)self itemCount] >= 2)
  {
    double v15 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
    double v16 = [(CNVisualIdentityAvatarViewController *)self contentView];
    objc_msgSend(v15, "adHocAvatarFrameInView:forItemCount:", v16, -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount"));
    double v8 = v17;
    double v12 = v18;
  }
  double v19 = (void *)MEMORY[0x1E4F5A618];
  id v44 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  [v44 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v28 = [(CNVisualIdentityAvatarViewController *)self badgeStyleSettings];
  uint64_t v29 = [v28 cnuiBadgePosition];
  id v30 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadge];
  if (v30)
  {
    v2 = [(CNVisualIdentityAvatarViewController *)self mediaContextBadgeView];
    [v2 frame];
  }
  else
  {
    uint64_t v31 = *MEMORY[0x1E4F1DB28];
    uint64_t v32 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v33 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    uint64_t v34 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  }
  objc_msgSend(v19, "frameForBadgeWithFrame:onAvatarFrame:withPosition:mediaContextFrame:isRTL:", v29, v5 == 1, v21, v23, v25, v27, v8, v10, v12, v14, v31, v32, v33, v34);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  v43 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

  if (v30) {
}
  }

- (void)updateBadgeImageViewContentMode
{
  id v5 = [(CNVisualIdentityAvatarViewController *)self badgeStyleSettings];
  uint64_t v3 = [v5 contentMode];
  uint64_t v4 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  [v4 setContentMode:v3];
}

- (void)updateBadgeImageViewBackgroundColor
{
  uint64_t v3 = [(CNVisualIdentityAvatarViewController *)self badgeImage];

  if (v3)
  {
    id v6 = [(CNVisualIdentityAvatarViewController *)self badgeStyleSettings];
    uint64_t v4 = [v6 backgroundColor];
    id v5 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
    [v5 setBackgroundColor:v4];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v4 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
    [v4 setBackgroundColor:v6];
  }
}

- (void)updateBadgeCropStyle
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A618];
  id v6 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  uint64_t v4 = [v6 layer];
  id v5 = [(CNVisualIdentityAvatarViewController *)self badgeStyleSettings];
  objc_msgSend(v3, "cropAvatarBadgeLayer:withCropStyle:", v4, objc_msgSend(v5, "cropStyle"));
}

- (void)updateBadgeTintColor
{
  id v5 = [(CNVisualIdentityAvatarViewController *)self badgeStyleSettings];
  uint64_t v3 = [v5 color];
  uint64_t v4 = [(CNVisualIdentityAvatarViewController *)self badgeImageView];
  [v4 setTintColor:v3];
}

- (void)updateBadgeStyling
{
  [(CNVisualIdentityAvatarViewController *)self updateBadgeImageViewPosition];
  [(CNVisualIdentityAvatarViewController *)self updateBadgeTintColor];
  [(CNVisualIdentityAvatarViewController *)self updateBadgeCropStyle];
  [(CNVisualIdentityAvatarViewController *)self updateBadgeImageViewBackgroundColor];

  [(CNVisualIdentityAvatarViewController *)self updateBadgeImageViewContentMode];
}

- (void)setBadgeStyleSettings:(id)a3
{
  id v6 = a3;
  if (!-[CNBadgingAvatarBadgeStyleSettings isEqual:](self->_badgeStyleSettings, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
    id v5 = [(CNVisualIdentityAvatarViewController *)self badgeImage];

    if (v5) {
      [(CNVisualIdentityAvatarViewController *)self updateBadgeStyling];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)removeAllSublayers
{
  uint64_t v3 = [(CNVisualIdentityAvatarViewController *)self avatarLayerItem];
  uint64_t v4 = [v3 layer];
  [v4 removeFromSuperlayer];

  id v5 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
  id v6 = [v5 avatarLayerItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      double v9 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      double v10 = [v9 avatarLayerItems];
      double v11 = [v10 objectAtIndexedSubscript:v8];

      double v12 = [v11 layer];
      [v12 removeFromSuperlayer];

      ++v8;
      double v13 = [(CNVisualIdentityAvatarViewController *)self avatarLayoutManager];
      double v14 = [v13 avatarLayerItems];
      unint64_t v15 = [v14 count];
    }
    while (v8 < v15);
  }
}

- (BOOL)shouldUseBadgeButton
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CNVisualIdentityAvatarViewController;
  [(CNVisualIdentityAvatarViewController *)&v14 viewDidLayoutSubviews];
  uint64_t v3 = [(CNVisualIdentityAvatarViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [(CNVisualIdentityAvatarViewController *)self previousSize];
  if (v9 == v5 && v8 == v7)
  {
    double v11 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int64_t v12 = [(CNVisualIdentityAvatarViewController *)self itemCount];
      double v13 = [(CNVisualIdentityAvatarViewController *)self containingCellView];
      *(_DWORD *)buf = 134218242;
      int64_t v16 = v12;
      __int16 v17 = 2114;
      double v18 = v13;
      _os_log_debug_impl(&dword_18B625000, v11, OS_LOG_TYPE_DEBUG, "Skipping layout - no change in view size, itemCount:%lu, containingCell:%{public}@", buf, 0x16u);
    }
    [(CNVisualIdentityAvatarViewController *)self logSublayersContent];
  }
  else
  {
    -[CNVisualIdentityAvatarViewController setPreviousSize:](self, "setPreviousSize:", v5, v7);
    [(CNVisualIdentityAvatarViewController *)self layoutAvatars];
    if ([(CNVisualIdentityAvatarViewController *)self shouldUseBadgeButton])
    {
      [(CNVisualIdentityAvatarViewController *)self updateBadgeButtonFrame];
    }
    else
    {
      [(CNVisualIdentityAvatarViewController *)self updateBadgeViewFrame];
      [(CNVisualIdentityAvatarViewController *)self updateBadgeStyling];
      [(CNVisualIdentityAvatarViewController *)self updateMediaContextBadgeFrame];
    }
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CNVisualIdentityAvatarViewController;
  [(CNVisualIdentityAvatarViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = [(CNVisualIdentityAvatarViewController *)self view];
  [v4 bounds];
  double v5 = objc_msgSend(v3, "initWithFrame:");
  [(CNVisualIdentityAvatarViewController *)self setContentView:v5];

  double v6 = [(CNVisualIdentityAvatarViewController *)self contentView];
  [v6 setAutoresizingMask:18];

  double v7 = [MEMORY[0x1E4FB1618] clearColor];
  double v8 = [(CNVisualIdentityAvatarViewController *)self contentView];
  [v8 setBackgroundColor:v7];

  double v9 = [(CNVisualIdentityAvatarViewController *)self view];
  double v10 = [(CNVisualIdentityAvatarViewController *)self contentView];
  [v9 addSubview:v10];

  [(CNVisualIdentityAvatarViewController *)self updateContactChangesNotifierRegistration];
}

- (void)loadView
{
  id v3 = [CNVisualIdentityAvatarContainerView alloc];
  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  double v5 = -[CNVisualIdentityAvatarContainerView initWithFrame:](v3, "initWithFrame:");

  [(CNVisualIdentityAvatarContainerView *)v5 setDelegate:self];
  [(CNVisualIdentityAvatarViewController *)self setView:v5];
}

- (void)dealloc
{
  id v3 = +[CNUIContactsEnvironment currentEnvironment];
  double v4 = [v3 contactChangesNotifier];
  [v4 unregisterObserver:self forContact:0];

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityAvatarViewController;
  [(CNVisualIdentityAvatarViewController *)&v5 dealloc];
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5 avatarLayoutType:(unint64_t)a6 withLayoutDelegate:(id)a7
{
  id v12 = a7;
  double v13 = [(CNVisualIdentityAvatarViewController *)self initWithVisualIdentity:a3 primaryAvatarProvider:a4 avatarImageRendererSettings:a5];
  if (v13)
  {
    objc_super v14 = [[CNVisualIdentityAvatarLayoutManager alloc] initWithLayoutType:a6 withLayoutDelegate:v12];
    avatarLayoutManager = v13->_avatarLayoutManager;
    v13->_avatarLayoutManager = v14;

    objc_storeWeak((id *)&v13->_layoutDelegate, v12);
    int64_t v16 = v13;
  }

  return v13;
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5 avatarLayoutType:(unint64_t)a6
{
  return [(CNVisualIdentityAvatarViewController *)self initWithVisualIdentity:a3 primaryAvatarProvider:a4 avatarImageRendererSettings:a5 avatarLayoutType:a6 withLayoutDelegate:0];
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNVisualIdentityAvatarViewController;
  id v12 = [(CNVisualIdentityAvatarViewController *)&v26 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_visualIdentity, a3);
    objc_super v14 = [[CNVisualIdentityContactAvatarProvider alloc] initWithSettings:v11];
    avatarProvider = v13->_avatarProvider;
    v13->_avatarProvider = v14;

    int64_t v16 = objc_alloc_init(CNVisualIdentityAvatarLayoutManager);
    avatarLayoutManager = v13->_avatarLayoutManager;
    v13->_avatarLayoutManager = v16;

    objc_storeStrong((id *)&v13->_primaryAvatarProvider, a4);
    double v18 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v19 = [v18 defaultSchedulerProvider];
    uint64_t v20 = [v19 newSerialSchedulerWithName:@"com.apple.contactsui.visualIdentityAvatarView.renderingQueue"];
    renderingQueue = v13->_renderingQueue;
    v13->_renderingQueue = (CNScheduler *)v20;

    uint64_t v22 = [v19 mainThreadScheduler];
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (CNScheduler *)v22;

    double v24 = v13;
  }

  return v13;
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4
{
  return [(CNVisualIdentityAvatarViewController *)self initWithVisualIdentity:a3 primaryAvatarProvider:a4 avatarImageRendererSettings:0];
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3
{
  return [(CNVisualIdentityAvatarViewController *)self initWithVisualIdentity:a3 primaryAvatarProvider:0 avatarImageRendererSettings:0];
}

+ (unint64_t)maxContactAvatars
{
  return [MEMORY[0x1E4F5A618] maxAvatarCountForType:0];
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2_16376 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2_16376, &__block_literal_global_14);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_2_16377;

  return v2;
}

void __65__CNVisualIdentityAvatarViewController_descriptorForRequiredKeys__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v1 = +[CNVisualIdentity descriptorForRequiredKeys];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v3 = [NSString stringWithUTF8String:"+[CNVisualIdentityAvatarViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  objc_super v5 = (void *)descriptorForRequiredKeys_cn_once_object_2_16377;
  descriptorForRequiredKeys_cn_once_object_2_16377 = v4;
}

+ (id)log
{
  if (log_cn_once_token_1_16379 != -1) {
    dispatch_once(&log_cn_once_token_1_16379, &__block_literal_global_16380);
  }
  v2 = (void *)log_cn_once_object_1_16381;

  return v2;
}

void __43__CNVisualIdentityAvatarViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNVisualIdentityAvatarViewController");
  v1 = (void *)log_cn_once_object_1_16381;
  log_cn_once_object_1_16381 = (uint64_t)v0;
}

@end