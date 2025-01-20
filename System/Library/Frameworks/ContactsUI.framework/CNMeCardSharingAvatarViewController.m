@interface CNMeCardSharingAvatarViewController
- (BOOL)hasImage;
- (BOOL)isPosterAnimationPausable;
- (BOOL)isPosterAnimationPaused;
- (BOOL)isWaitingForPosterPreviews;
- (BOOL)needsReload;
- (BOOL)posterPreviewsGenerationTimedOut;
- (BOOL)showsPosterAnimation;
- (CAShapeLayer)circularLayer;
- (CGRect)frameForContainerView;
- (CGSize)portraitScreenSize;
- (CNAvatarImageProvider)fallbackImageProvider;
- (CNAvatarViewController)avatarViewController;
- (CNMeCardSharingAvatarProvider)avatarProvider;
- (CNMeCardSharingAvatarViewController)initWithAvatarProvider:(id)a3;
- (CNMeCardSharingAvatarViewController)initWithAvatarProvider:(id)a3 mode:(int64_t)a4;
- (CNMeCardSharingAvatarViewControllerDelegate)delegate;
- (UIActivityIndicatorView)activityIndicator;
- (UIImageView)imageView;
- (UILabel)addPhotoLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)avatarContainerView;
- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)posterAnimationController;
- (int64_t)mode;
- (void)addPosterAnimationController:(id)a3;
- (void)addPosterAnimationLoadingSpinner;
- (void)configureSubviews;
- (void)didTapAvatarView:(id)a3;
- (void)loadView;
- (void)reload;
- (void)reloadAvatarImage;
- (void)reloadPosterImage;
- (void)removePosterAnimationController;
- (void)removePosterAnimationLoadingSpinner;
- (void)setActivityIndicator:(id)a3;
- (void)setAddPhotoLabel:(id)a3;
- (void)setAvatarContainerView:(id)a3;
- (void)setAvatarProvider:(id)a3;
- (void)setAvatarViewController:(id)a3;
- (void)setCircularLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackImageProvider:(id)a3;
- (void)setHasImage:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setIsWaitingForPosterPreviews:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setNeedsReload:(BOOL)a3;
- (void)setPosterAnimationController:(id)a3;
- (void)setPosterPreviewsGenerationTimedOut:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)togglePosterAnimation;
- (void)updateImageAnimated:(BOOL)a3 newImage:(id)a4 placeHolder:(BOOL)a5 additionalAnimatedChanges:(id)a6;
- (void)updateViewsToUseGeneratedAvatarImage:(id)a3 forSize:(CGSize)a4;
- (void)updateViewsToUseGeneratedImage:(id)a3 forSize:(CGSize)a4 usingFallback:(BOOL)a5;
- (void)updateViewsToUseGeneratedPosterImage:(id)a3 forSize:(CGSize)a4;
- (void)updateWithAvatarProvider:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CNMeCardSharingAvatarViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_fallbackImageProvider, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_posterAnimationController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_addPhotoLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_circularLayer, 0);
  objc_storeStrong((id *)&self->_avatarContainerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setFallbackImageProvider:(id)a3
{
}

- (CNAvatarImageProvider)fallbackImageProvider
{
  return self->_fallbackImageProvider;
}

- (void)setAvatarProvider:(id)a3
{
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setPosterAnimationController:(id)a3
{
}

- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)posterAnimationController
{
  return self->_posterAnimationController;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setAddPhotoLabel:(id)a3
{
}

- (UILabel)addPhotoLabel
{
  return self->_addPhotoLabel;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setCircularLayer:(id)a3
{
}

- (CAShapeLayer)circularLayer
{
  return self->_circularLayer;
}

- (void)setAvatarContainerView:(id)a3
{
}

- (UIView)avatarContainerView
{
  return self->_avatarContainerView;
}

- (void)setPosterPreviewsGenerationTimedOut:(BOOL)a3
{
  self->_posterPreviewsGenerationTimedOut = a3;
}

- (BOOL)posterPreviewsGenerationTimedOut
{
  return self->_posterPreviewsGenerationTimedOut;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setIsWaitingForPosterPreviews:(BOOL)a3
{
  self->_isWaitingForPosterPreviews = a3;
}

- (BOOL)isWaitingForPosterPreviews
{
  return self->_isWaitingForPosterPreviews;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingAvatarViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingAvatarViewControllerDelegate *)WeakRetained;
}

- (void)togglePosterAnimation
{
  id v2 = [(CNMeCardSharingAvatarViewController *)self posterAnimationController];
  [v2 toggleAnimation];
}

- (BOOL)isPosterAnimationPaused
{
  v3 = [(CNMeCardSharingAvatarViewController *)self posterAnimationController];

  if (v3)
  {
    v4 = [(CNMeCardSharingAvatarViewController *)self posterAnimationController];
    char v5 = [v4 isAnimationPaused];

    return v5;
  }
  else
  {
    return +[CNPosterOnboardingSettingsAnimationViewController pausableAnimationStartingValue];
  }
}

- (BOOL)isPosterAnimationPausable
{
  return +[CNPosterOnboardingSettingsAnimationViewController isAnimationPausable];
}

- (BOOL)showsPosterAnimation
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 0;
  }
  else {
    return ![(CNMeCardSharingAvatarViewController *)self posterPreviewsGenerationTimedOut];
  }
}

- (void)didTapAvatarView:(id)a3
{
  id v4 = [(CNMeCardSharingAvatarViewController *)self delegate];
  [v4 avatarViewControllerWasTapped:self];
}

- (void)updateImageAnimated:(BOOL)a3 newImage:(id)a4 placeHolder:(BOOL)a5 additionalAnimatedChanges:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v7) {
    v12 = 0;
  }
  else {
    v12 = v10;
  }
  id v13 = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke;
  aBlock[3] = &unk_1E549A258;
  id v14 = v13;
  BOOL v26 = v8;
  id v23 = v14;
  v24 = self;
  id v15 = v11;
  id v25 = v15;
  v16 = (void (**)(void))_Block_copy(aBlock);
  v17 = v16;
  if (v8)
  {
    v18 = (void *)MEMORY[0x1E4FB1EB0];
    imageView = self->_imageView;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke_2;
    v20[3] = &unk_1E549B8A0;
    v21 = v16;
    [v18 transitionWithView:imageView duration:5243012 options:v20 animations:0 completion:0.5];
  }
  else
  {
    v16[2](v16);
  }
}

uint64_t __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    char v5 = [*(id *)(*(void *)(a1 + 40) + 1008) image];
    v6 = *(void **)(a1 + 32);

    if (v5 != v6) {
      [*(id *)(*(void *)(a1 + 40) + 1008) setImage:*(void *)(a1 + 32)];
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 1008) alpha];
  if (v7 != v3) {
    [*(id *)(*(void *)(a1 + 40) + 1008) setAlpha:v3];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

uint64_t __106__CNMeCardSharingAvatarViewController_updateImageAnimated_newImage_placeHolder_additionalAnimatedChanges___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateViewsToUseGeneratedImage:(id)a3 forSize:(CGSize)a4 usingFallback:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v18 = v9;
  if (v9)
  {
    self->_hasImage = 1;
    id v10 = v9;
    BOOL v11 = [(CNMeCardSharingAvatarViewController *)self showsPosterAnimation];
  }
  else
  {
    self->_hasImage = 0;
    if (v5)
    {
      fallbackImageProvider = self->_fallbackImageProvider;
      id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v13 scale];
      -[CNAvatarImageProvider imageForSize:scale:](fallbackImageProvider, "imageForSize:scale:", width, height, v14);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
    BOOL v11 = 0;
  }
  id v15 = [(CNMeCardSharingAvatarViewController *)self viewIfLoaded];
  v16 = [v15 superview];
  [(CNMeCardSharingAvatarViewController *)self updateImageAnimated:v16 != 0 newImage:v10 placeHolder:v11 additionalAnimatedChanges:&__block_literal_global_28_48539];

  v17 = [(CNMeCardSharingAvatarViewController *)self delegate];
  objc_msgSend(v17, "avatarViewControllerDidUpdateImage:needsLayout:", self, -[CNMeCardSharingAvatarViewController posterPreviewsGenerationTimedOut](self, "posterPreviewsGenerationTimedOut"));
}

- (void)updateViewsToUseGeneratedAvatarImage:(id)a3 forSize:(CGSize)a4
{
}

- (void)updateViewsToUseGeneratedPosterImage:(id)a3 forSize:(CGSize)a4
{
}

- (void)removePosterAnimationController
{
  double v3 = [(CNMeCardSharingAvatarViewController *)self childViewControllers];
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_48541);

  [(CNMeCardSharingAvatarViewController *)self setPosterAnimationController:0];
}

void __70__CNMeCardSharingAvatarViewController_removePosterAnimationController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 willMoveToParentViewController:0];
  uint64_t v2 = [v3 view];
  [v2 removeFromSuperview];

  [v3 removeFromParentViewController];
  [v3 didMoveToParentViewController:0];
}

- (void)addPosterAnimationController:(id)a3
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CNMeCardSharingAvatarViewController *)self setPosterAnimationController:v4];
  BOOL v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [v4 view];
  [v6 setAlpha:0.0];

  double v7 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
  BOOL v8 = [v4 view];
  [v7 addSubview:v8];

  v35 = [v4 view];
  v33 = [v35 leadingAnchor];
  v34 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
  v32 = [v34 leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v38[0] = v31;
  v30 = [v4 view];
  v28 = [v30 trailingAnchor];
  v29 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
  v27 = [v29 trailingAnchor];
  BOOL v26 = [v28 constraintEqualToAnchor:v27];
  v38[1] = v26;
  id v25 = [v4 view];
  id v23 = [v25 topAnchor];
  id v9 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
  id v10 = [v9 topAnchor];
  BOOL v11 = [v23 constraintEqualToAnchor:v10];
  v38[2] = v11;
  v12 = [v4 view];
  id v13 = [v12 bottomAnchor];
  double v14 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
  id v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v38[3] = v16;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v24];
  [(CNMeCardSharingAvatarViewController *)self addChildViewController:v4];
  self->_hasImage = 1;
  v17 = [(CNMeCardSharingAvatarViewController *)self viewIfLoaded];
  id v18 = [v17 superview];
  int64_t mode = self->_mode;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__CNMeCardSharingAvatarViewController_addPosterAnimationController___block_invoke;
  v36[3] = &unk_1E549BF80;
  BOOL v20 = mode == 1;
  v36[4] = self;
  id v37 = v4;
  id v21 = v4;
  [(CNMeCardSharingAvatarViewController *)self updateImageAnimated:v18 != 0 newImage:0 placeHolder:v20 additionalAnimatedChanges:v36];

  v22 = [(CNMeCardSharingAvatarViewController *)self delegate];
  [v22 avatarViewControllerDidUpdateImage:self needsLayout:0];
}

void __68__CNMeCardSharingAvatarViewController_addPosterAnimationController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4FB1618] clearColor];
  [*(id *)(*(void *)(a1 + 32) + 1008) setBackgroundColor:v2];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:1.0];
}

- (CGSize)portraitScreenSize
{
  uint64_t v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  BOOL v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 <= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  if (v4 <= v7) {
    double v9 = v7;
  }
  else {
    double v9 = v4;
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)removePosterAnimationLoadingSpinner
{
  double v3 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];

  if (v3)
  {
    double v4 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    [v4 stopAnimating];

    BOOL v5 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    [v5 removeFromSuperview];

    [(CNMeCardSharingAvatarViewController *)self setActivityIndicator:0];
  }
}

- (void)addPosterAnimationLoadingSpinner
{
  v30[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];

  if (!v3)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [(CNMeCardSharingAvatarViewController *)self setActivityIndicator:v4];

    BOOL v5 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v6 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
    double v7 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    [v6 addSubview:v7];

    v29 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    v27 = [v29 centerXAnchor];
    v28 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
    BOOL v26 = [v28 centerXAnchor];
    id v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v24 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    v22 = [v24 centerYAnchor];
    id v23 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
    id v21 = [v23 centerYAnchor];
    BOOL v20 = [v22 constraintEqualToAnchor:v21];
    v30[1] = v20;
    v19 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    id v18 = [v19 widthAnchor];
    double v8 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
    double v9 = [v8 widthAnchor];
    id v10 = [v18 constraintEqualToAnchor:v9];
    v30[2] = v10;
    BOOL v11 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
    v12 = [v11 heightAnchor];
    id v13 = [(CNMeCardSharingAvatarViewController *)self avatarContainerView];
    double v14 = [v13 heightAnchor];
    id v15 = [v12 constraintEqualToAnchor:v14];
    v30[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  }
  v17 = [(CNMeCardSharingAvatarViewController *)self activityIndicator];
  [v17 startAnimating];
}

- (void)reloadPosterImage
{
  [(UIImageView *)self->_imageView bounds];
  double v5 = v4;
  double v6 = v3;
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == v4 && v7 == v3)
  {
    [(CNMeCardSharingAvatarViewController *)self portraitScreenSize];
    double v5 = v9;
    double v6 = v10;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke;
  aBlock[3] = &unk_1E549B488;
  void aBlock[4] = self;
  BOOL v11 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_4;
  v23[3] = &unk_1E549A198;
  v23[4] = self;
  id v12 = v11;
  id v24 = v12;
  double v25 = v5;
  double v26 = v6;
  id v13 = _Block_copy(v23);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_7;
  v18[3] = &unk_1E549A210;
  v18[4] = self;
  id v14 = v12;
  id v19 = v14;
  id v15 = v13;
  id v20 = v15;
  double v21 = v5;
  double v22 = v6;
  v16 = (void (**)(void))_Block_copy(v18);
  [(CNMeCardSharingAvatarViewController *)self addPosterAnimationLoadingSpinner];
  if (objc_opt_respondsToSelector())
  {
    v16[2](v16);
  }
  else if (objc_opt_respondsToSelector())
  {
    v15[2](v15);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_10;
    block[3] = &unk_1E549A968;
    block[4] = self;
    *(double *)&block[5] = v5;
    *(double *)&block[6] = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_2;
  block[3] = &unk_1E549B488;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsWaitingForPosterPreviews:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v2 = [*(id *)(a1 + 32) avatarProvider];
  double v3 = [*(id *)(a1 + 32) view];
  double v4 = [v3 window];
  double v5 = [v4 windowScene];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_5;
  v6[3] = &unk_1E549A170;
  objc_copyWeak(&v7, &location);
  long long v8 = *(_OWORD *)(a1 + 48);
  [v2 generatePosterImageWithWindowScene:v5 imageHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) removePosterAnimationController];
  [*(id *)(a1 + 32) setIsWaitingForPosterPreviews:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v2 = [*(id *)(a1 + 32) avatarProvider];
  double v3 = [*(id *)(a1 + 32) view];
  double v4 = [v3 window];
  double v5 = [v4 windowScene];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_8;
  v6[3] = &unk_1E549A1E8;
  objc_copyWeak(&v8, &location);
  id v7 = *(id *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 56);
  [v2 generatePosterAnimationControllerWithWindowScene:v5 imageHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViewsToUseGeneratedPosterImage:forSize:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_9;
  block[3] = &unk_1E549A1C0;
  block[4] = WeakRetained;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) removePosterAnimationLoadingSpinner];
  [*(id *)(a1 + 32) setIsWaitingForPosterPreviews:0];
  uint64_t result = [*(id *)(a1 + 32) posterPreviewsGenerationTimedOut];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      return objc_msgSend(v3, "addPosterAnimationController:");
    }
    else
    {
      double v4 = [v3 avatarProvider];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        double v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
        return v6();
      }
      else
      {
        id v7 = *(void **)(a1 + 32);
        double v8 = *(double *)(a1 + 56);
        double v9 = *(double *)(a1 + 64);
        return objc_msgSend(v7, "updateViewsToUseGeneratedPosterImage:forSize:", 0, v8, v9);
      }
    }
  }
  return result;
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_6;
  v6[3] = &unk_1E549A148;
  void v6[4] = WeakRetained;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsWaitingForPosterPreviews:0];
  uint64_t result = [*(id *)(a1 + 32) posterPreviewsGenerationTimedOut];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) removePosterAnimationLoadingSpinner];
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = *(double *)(a1 + 48);
    double v6 = *(double *)(a1 + 56);
    return objc_msgSend(v3, "updateViewsToUseGeneratedPosterImage:forSize:", v4, v5, v6);
  }
  return result;
}

void __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isWaitingForPosterPreviews])
  {
    [*(id *)(a1 + 32) setPosterPreviewsGenerationTimedOut:1];
    [*(id *)(a1 + 32) removePosterAnimationLoadingSpinner];
    [*(id *)(a1 + 32) configureSubviews];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_3;
    block[3] = &unk_1E549B488;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadPosterImage__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAvatarImage];
}

- (void)reloadAvatarImage
{
  [(UIImageView *)self->_imageView bounds];
  if (*MEMORY[0x1E4F1DB30] == v3 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v4)
  {
    double v7 = 200.0;
LABEL_10:
    double v6 = v7;
    goto LABEL_11;
  }
  double v6 = v3;
  double v7 = v4;
  if (v3 != v4)
  {
    if (v3 >= v4) {
      double v7 = v3;
    }
    goto LABEL_10;
  }
LABEL_11:
  objc_initWeak(&location, self);
  avatarProvider = self->_avatarProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke;
  v9[3] = &unk_1E549A170;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&v6;
  v10[2] = *(id *)&v7;
  -[CNMeCardSharingAvatarProvider generateAvatarImageOfSize:imageHandler:](avatarProvider, "generateAvatarImageOfSize:imageHandler:", v9, v6, v7);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke_2;
  v6[3] = &unk_1E549A148;
  void v6[4] = WeakRetained;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __56__CNMeCardSharingAvatarViewController_reloadAvatarImage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViewsToUseGeneratedAvatarImage:forSize:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)reload
{
  if (![(CNMeCardSharingAvatarViewController *)self showsPosterAnimation])
  {
    [(CNMeCardSharingAvatarViewController *)self reloadAvatarImage];
    goto LABEL_5;
  }
  id v3 = [(CNMeCardSharingAvatarViewController *)self view];
  double v4 = [v3 window];
  id v5 = [v4 windowScene];

  if (v5)
  {
    [(CNMeCardSharingAvatarViewController *)self reloadPosterImage];
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = 1;
LABEL_7:

  [(CNMeCardSharingAvatarViewController *)self setNeedsReload:v6];
}

- (void)updateWithAvatarProvider:(id)a3
{
  id v5 = (CNMeCardSharingAvatarProvider *)a3;
  if (self->_avatarProvider != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_avatarProvider, a3);
    [(CNMeCardSharingAvatarViewController *)self reload];
    id v5 = v6;
  }
}

- (CGRect)frameForContainerView
{
  BOOL v3 = [(CNMeCardSharingAvatarViewController *)self showsPosterAnimation];
  double v4 = [(CNMeCardSharingAvatarViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (v3)
  {
  }
  else
  {

    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.double width = v10;
    v20.size.double height = v12;
    double Width = CGRectGetWidth(v20);
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.double width = v10;
    v21.size.double height = v12;
    double Height = CGRectGetHeight(v21);
    if (Width >= Height) {
      double Width = Height;
    }
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.double width = v10;
    v22.size.double height = v12;
    CGFloat v15 = floor((CGRectGetHeight(v22) - Width) * 0.5);
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.double width = v10;
    v23.size.double height = v12;
    double v6 = floor((CGRectGetWidth(v23) - Width) * 0.5);
    CGFloat v8 = v15;
    CGFloat v10 = Width;
    CGFloat v12 = Width;
  }
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingAvatarViewController;
  [(CNMeCardSharingAvatarViewController *)&v5 viewWillLayoutSubviews];
  [(CNMeCardSharingAvatarViewController *)self frameForContainerView];
  -[UIView setFrame:](self->_avatarContainerView, "setFrame:");
  BOOL v3 = (void *)MEMORY[0x1E4FB14C0];
  [(UIView *)self->_avatarContainerView bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v4 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_circularLayer, "setPath:", [v4 CGPath]);
  [(UIView *)self->_avatarContainerView bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  [(UIView *)self->_avatarContainerView bounds];
  CGRect v7 = CGRectInset(v6, 12.0, 0.0);
  -[UILabel setFrame:](self->_addPhotoLabel, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingAvatarViewController;
  [(CNMeCardSharingAvatarViewController *)&v4 viewIsAppearing:a3];
  if ([(CNMeCardSharingAvatarViewController *)self needsReload]) {
    [(CNMeCardSharingAvatarViewController *)self reload];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingAvatarViewController;
  [(CNMeCardSharingAvatarViewController *)&v5 viewDidLoad];
  BOOL v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapAvatarView_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v3;

  [(UIView *)self->_avatarContainerView addGestureRecognizer:self->_tapGestureRecognizer];
}

- (void)configureSubviews
{
  if ([(CNMeCardSharingAvatarViewController *)self showsPosterAnimation])
  {
    BOOL v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_avatarContainerView setBackgroundColor:v3];

    objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)self->_imageView setBackgroundColor:v4];

    self->_isWaitingForPosterPreviews = [(CNMeCardSharingAvatarViewController *)self showsPosterAnimation];
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4F39C88] layer];
    circularLayer = self->_circularLayer;
    self->_circularLayer = v5;

    CGRect v7 = self->_circularLayer;
    CGFloat v8 = [(UIView *)self->_avatarContainerView layer];
    [v8 setMask:v7];

    [(UIView *)self->_avatarContainerView setClipsToBounds:1];
    id v9 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UIView *)self->_avatarContainerView setBackgroundColor:v9];
  }
}

- (void)loadView
{
  BOOL v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v7, v9, v11);
  id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v17 = (UIView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
  avatarContainerView = self->_avatarContainerView;
  self->_avatarContainerView = v17;

  double v19 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v13, v14, v15, v16);
  imageView = self->_imageView;
  self->_imageView = v19;

  [(UIImageView *)self->_imageView setAlpha:0.0];
  [(CNMeCardSharingAvatarViewController *)self configureSubviews];
  [v21 addSubview:self->_avatarContainerView];
  [(UIView *)self->_avatarContainerView addSubview:self->_imageView];
  [(CNMeCardSharingAvatarViewController *)self setView:v21];
}

- (CNMeCardSharingAvatarViewController)initWithAvatarProvider:(id)a3 mode:(int64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNMeCardSharingAvatarViewController;
  double v8 = [(CNMeCardSharingAvatarViewController *)&v16 initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avatarProvider, a3);
    double v10 = +[CNAvatarImageRendererSettings defaultSettings];
    double v11 = [[CNAvatarImageRenderer alloc] initWithSettings:v10];
    uint64_t v12 = [(CNAvatarImageRenderer *)v11 placeholderImageProvider];
    fallbackImageProvider = v9->_fallbackImageProvider;
    v9->_fallbackImageProvider = (CNAvatarImageProvider *)v12;

    v9->_int64_t mode = a4;
    v9->_needsReload = 1;
    double v14 = v9;
  }
  return v9;
}

- (CNMeCardSharingAvatarViewController)initWithAvatarProvider:(id)a3
{
  return [(CNMeCardSharingAvatarViewController *)self initWithAvatarProvider:a3 mode:0];
}

@end