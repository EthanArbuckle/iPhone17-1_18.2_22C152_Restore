@interface CKPendingMomentSharePhotoStackBalloonView
- (CKPendingMomentSharePhotoStackBalloonView)initWithFrame:(CGRect)a3;
- (id)_createStackView;
- (void)configureForMessagePart:(id)a3;
- (void)handleTap:(id)a3;
- (void)prepareForDisplay;
@end

@implementation CKPendingMomentSharePhotoStackBalloonView

- (CKPendingMomentSharePhotoStackBalloonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_handleTap_];
    [(CKPendingMomentSharePhotoStackBalloonView *)v3 addGestureRecognizer:v4];
  }
  return v3;
}

- (void)prepareForDisplay
{
  v8.receiver = self;
  v8.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  [(CKGenericPhotoStackBalloonView *)&v8 prepareForDisplay];
  v3 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
  v4 = [v3 momentShare];
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke;
    v6[3] = &unk_1E56247E8;
    v6[4] = self;
    id v7 = v4;
    [v7 forceSyncMomentShareWithCompletion:v6];
  }
}

void __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = IMLogHandleForCategory();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_2(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_1(a1, v5);
  }
}

- (id)_createStackView
{
  v4.receiver = self;
  v4.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  v2 = [(CKGenericPhotoStackBalloonView *)&v4 _createStackView];
  [v2 setUserInteractionEnabled:0];
  if (objc_opt_respondsToSelector()) {
    [v2 setProvidesLoadingAppearanceAndBehavior:1];
  }

  return v2;
}

- (void)handleTap:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didTapPendingMomentSharePhotoStackBalloonView:self];
  }
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  [(CKBalloonView *)&v14 configureForMessagePart:v4];
  v5 = [(CKGenericPhotoStackBalloonView *)self mediaProvider];
  if (!v5)
  {
    objc_super v6 = objc_alloc_init(CKPendingMomentShareImageProvider);
    [(CKGenericPhotoStackBalloonView *)self setMediaProvider:v6];
  }
  id v7 = [v4 message];
  objc_super v8 = IMCoreMomentShareURLForMessage();
  v9 = [(CKGenericPhotoStackBalloonView *)self dataSourceManager];
  v10 = v9;
  if (!v9
    || ([v9 momentShareURL],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = CKIsEqual(v11, v8),
        v11,
        (v12 & 1) == 0))
  {
    v13 = [[CKMomentSharePreviewAssetsDataSourceManager alloc] initWithMomentShareURL:v8];
    [(CKGenericPhotoStackBalloonView *)self setDataSourceManager:v13];
  }
}

void __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uuid];
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  objc_super v8 = v4;
  _os_log_debug_impl(&dword_18EF18000, a2, OS_LOG_TYPE_DEBUG, "<%p> Did force sync moment share: %{public}@", (uint8_t *)&v5, 0x16u);
}

void __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) uuid];
  int v7 = 134218498;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "<%p> Failed to force sync moment share: %{public}@, error: %@", (uint8_t *)&v7, 0x20u);
}

@end