@interface GKNotificationBannerViewController
- (BOOL)bannerAnimating;
- (BOOL)bannerVisible;
- (BOOL)useShortBanner;
- (BOOL)windowPointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)_hiddenBannerPosition:(CGSize)a3;
- (CGPoint)_visibleBannerCenterPosition:(CGSize)a3;
- (GKNotificationBannerView)bannerView;
- (NSLayoutConstraint)bannerWidthConstraint;
- (NSLayoutConstraint)bannerYPositionConstraint;
- (double)bannerWidthForViewSize:(CGSize)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)addBannerView:(id)a3;
- (void)addConstraintsForBannerView;
- (void)addConstraintsForTVOSBannerView;
- (void)handleWindowPan:(id)a3;
- (void)handleWindowSingleTap:(id)a3;
- (void)hideBannerQuickly:(BOOL)a3;
- (void)setBannerAnimating:(BOOL)a3;
- (void)setBannerView:(id)a3;
- (void)setBannerVisible:(BOOL)a3;
- (void)setBannerWidthConstraint:(id)a3;
- (void)setBannerYPositionConstraint:(id)a3;
- (void)showCurrentBanner;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)windowTouchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation GKNotificationBannerViewController

- (BOOL)useShortBanner
{
  v2 = [(GKNotificationBannerViewController *)self bannerView];
  char v3 = [v2 useShortBanner];

  return v3;
}

- (BOOL)windowPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(GKNotificationBannerViewController *)self view];
  v7 = [v6 subviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 layer];
          v13 = [v12 presentationLayer];
          v14 = objc_msgSend(v13, "hitTest:", x, y);

          if (v14)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

- (void)windowTouchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  v6 = [a3 anyObject];
  v7 = [(GKNotificationBannerViewController *)self view];
  v23 = v6;
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v12 = [(GKNotificationBannerViewController *)self view];
  v13 = [v12 subviews];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v19 = [v18 layer];
          v20 = [v19 presentationLayer];
          uint64_t v21 = objc_msgSend(v20, "hitTest:", v9, v11);

          if (v21)
          {
            v22 = [v18 touchHandler];

            if (v22)
            {
              [v18 _wasTouched:v24];
              [(GKNotificationBannerViewController *)self hideBannerQuickly:0];
            }
          }
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }
}

- (void)handleWindowSingleTap:(id)a3
{
  if ([(GKNotificationBannerViewController *)self bannerVisible])
  {
    [(GKNotificationBannerViewController *)self hideBannerQuickly:1];
  }
}

- (void)handleWindowPan:(id)a3
{
  id v7 = a3;
  if ([(GKNotificationBannerViewController *)self bannerVisible])
  {
    v4 = [(GKNotificationBannerViewController *)self view];
    [v7 translationInView:v4];
    double v6 = v5;

    if (v6 < 0.0) {
      [(GKNotificationBannerViewController *)self hideBannerQuickly:1];
    }
  }
}

- (void)addBannerView:(id)a3
{
  id v8 = a3;
  v4 = [(GKNotificationBannerViewController *)self bannerView];

  if (v4)
  {
    [(GKNotificationBannerViewController *)self setBannerYPositionConstraint:0];
    [(GKNotificationBannerViewController *)self setBannerWidthConstraint:0];
    double v5 = [(GKNotificationBannerViewController *)self bannerView];
    [v5 removeFromSuperview];

    [(GKNotificationBannerViewController *)self setBannerView:0];
  }
  [(GKNotificationBannerViewController *)self setBannerView:v8];
  double v6 = [(GKNotificationBannerViewController *)self view];
  id v7 = [(GKNotificationBannerViewController *)self bannerView];
  [v6 addSubview:v7];

  [(GKNotificationBannerViewController *)self addConstraintsForBannerView];
}

- (void)showCurrentBanner
{
  char v3 = [(GKNotificationBannerViewController *)self bannerView];
  v4 = [(GKNotificationBannerViewController *)self view];
  double v5 = [v4 subviews];
  char v6 = [v5 containsObject:v3];

  if ((v6 & 1) == 0)
  {
    id v7 = [(GKNotificationBannerViewController *)self view];
    [v7 addSubview:v3];
  }
  [(GKNotificationBannerViewController *)self setBannerAnimating:1];
  [(GKNotificationBannerViewController *)self setBannerVisible:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke;
  aBlock[3] = &unk_1E5F63350;
  aBlock[4] = self;
  id v8 = v3;
  id v21 = v8;
  double v9 = _Block_copy(aBlock);
  double v10 = [(GKNotificationBannerViewController *)self view];
  [v10 layoutIfNeeded];

  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  id v17 = v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_3;
  v18[3] = &unk_1E5F63350;
  v18[4] = self;
  id v19 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_4;
  v16[3] = &unk_1E5F631C0;
  id v12 = v9;
  id v13 = v8;
  [v11 animateWithDuration:38 delay:v18 options:v16 animations:0.3 completion:0.0];

  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_5;
  v15[3] = &unk_1E5F62EB0;
  v15[4] = self;
  dispatch_after(v14, MEMORY[0x1E4F14428], v15);
}

void __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBannerAnimating:0];
  [*(id *)(a1 + 40) duration];
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_2;
  block[3] = &unk_1E5F62EB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bannerVisible];
  if (result)
  {
    dispatch_time_t v3 = *(void **)(a1 + 32);
    return [v3 hideBannerQuickly:0];
  }
  return result;
}

void __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "_visibleBannerCenterPosition:", v3, v4);
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) bannerYPositionConstraint];
  [v7 setConstant:v6];

  id v8 = [*(id *)(a1 + 32) view];
  [v8 layoutIfNeeded];
}

uint64_t __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) bannerView];
  int v3 = [v2 canTransitionToPlayerAvatar];

  double v4 = [*(id *)(a1 + 32) bannerView];
  id v5 = v4;
  if (v3) {
    [v4 transitionToPlayerAvatar];
  }
  else {
    [v4 setCanTransitionToPlayerAvatar:1];
  }
}

- (void)hideBannerQuickly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKNotificationBannerViewController *)self bannerView];
  [(GKNotificationBannerViewController *)self setBannerAnimating:1];
  [(GKNotificationBannerViewController *)self setBannerVisible:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke;
  aBlock[3] = &unk_1E5F63350;
  aBlock[4] = self;
  id v6 = v5;
  id v18 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(GKNotificationBannerViewController *)self view];
  [v8 layoutIfNeeded];

  double v9 = (void *)MEMORY[0x1E4FB1EB0];
  if (v3) {
    double v10 = 0.1;
  }
  else {
    double v10 = 0.3;
  }
  id v14 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_3;
  v15[3] = &unk_1E5F63350;
  v15[4] = self;
  id v16 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_4;
  v13[3] = &unk_1E5F631C0;
  id v11 = v7;
  id v12 = v6;
  [v9 animateWithDuration:38 delay:v15 options:v13 animations:v10 completion:0.0];
}

void __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBannerAnimating:0];
  [*(id *)(a1 + 40) callCompletionHandler];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 32) setBannerView:0];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  BOOL v3 = MEMORY[0x1E4F14428];

  dispatch_after(v2, v3, &__block_literal_global_200);
}

uint64_t __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_2()
{
  v0 = [(id)sBannerWindow bannerSemaphore];

  if (v0)
  {
    v1 = [(id)sBannerWindow bannerSemaphore];
    dispatch_semaphore_signal(v1);
  }
  uint64_t result = GKAtomicDecrement32();
  if (!result)
  {
    objc_sync_enter(@"GKNotificationBannerSyncObject");
    BOOL v3 = (void *)sBannerWindow;
    sBannerWindow = 0;

    return objc_sync_exit(@"GKNotificationBannerSyncObject");
  }
  return result;
}

void __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "_hiddenBannerPosition:", v3, v4);
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) bannerYPositionConstraint];
  [v7 setConstant:v6];

  id v8 = [*(id *)(a1 + 32) view];
  [v8 layoutIfNeeded];
}

uint64_t __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)supportedInterfaceOrientations
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v4 = [v3 windows];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_8;
  }
  double v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v7 = [v6 windows];
  id v8 = [v7 objectAtIndexedSubscript:0];

  double v9 = [(GKNotificationBannerViewController *)self view];
  uint64_t v10 = [v9 window];
  if (v8 == (void *)v10)
  {
  }
  else
  {
    id v11 = (void *)v10;
    id v12 = [v8 rootViewController];

    if (v12)
    {
      id v13 = [v8 rootViewController];
      unint64_t v14 = [v13 supportedInterfaceOrientations];

      if (v14) {
        goto LABEL_11;
      }
    }
  }
  uint64_t v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v14 = [v15 supportedInterfaceOrientationsForWindow:v8];

  if (!v14)
  {
LABEL_8:
    id v8 = [(GKNotificationBannerViewController *)self traitCollection];
    if ([v8 userInterfaceIdiom]) {
      unint64_t v14 = 30;
    }
    else {
      unint64_t v14 = 26;
    }
LABEL_11:
  }
  return v14;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKNotificationBannerViewController;
  -[GKNotificationBannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(GKNotificationBannerViewController *)self bannerView];
  double v9 = [v8 superview];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__GKNotificationBannerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_1E5F641D8;
    v10[4] = self;
    *(double *)&v10[5] = width;
    *(double *)&v10[6] = height;
    [v7 animateAlongsideTransition:v10 completion:0];
  }
}

void __89__GKNotificationBannerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) bannerWidthConstraint];

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bannerWidthForViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v4 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) bannerWidthConstraint];
    [v5 setConstant:v4];
  }
  double v6 = [*(id *)(a1 + 32) bannerYPositionConstraint];
  [v6 constant];
  double v8 = v7;

  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 bannerView];
  [v10 bounds];
  objc_msgSend(v9, "_hiddenBannerPosition:", v11, v12);
  double v14 = v13;

  if (v8 != v14)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [v15 bannerView];
    [v16 bounds];
    objc_msgSend(v15, "_visibleBannerCenterPosition:", v17, v18);
    double v20 = v19;
    id v21 = [*(id *)(a1 + 32) bannerYPositionConstraint];
    [v21 setConstant:v20];
  }
  id v22 = [*(id *)(a1 + 32) view];
  [v22 layoutIfNeeded];
}

- (double)bannerWidthForViewSize:(CGSize)a3
{
  double width = a3.width;
  BOOL v5 = [(GKNotificationBannerViewController *)self useShortBanner];
  double v6 = 30.0;
  if (v5) {
    double v6 = 15.0;
  }
  double v7 = width - v6;
  double v8 = [(GKNotificationBannerViewController *)self bannerView];
  [v8 preferredBannerWidth];
  double v10 = v9;

  if (v7 <= v10) {
    return v7;
  }
  else {
    return v10;
  }
}

- (void)addConstraintsForTVOSBannerView
{
  double v3 = [(GKNotificationBannerViewController *)self bannerView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v4 = [(GKNotificationBannerViewController *)self bannerView];
  BOOL v5 = [v4 heightAnchor];
  if ([(GKNotificationBannerViewController *)self useShortBanner])
  {
    uint64_t v6 = 0x4044000000000000;
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38] != 0))
    {
      double v10 = 66.0;
      goto LABEL_11;
    }
    uint64_t v6 = 0x4050000000000000;
  }
  double v10 = *(double *)&v6;
LABEL_11:
  double v11 = [v5 constraintEqualToConstant:v10];
  [v11 setActive:1];

  double v12 = [(GKNotificationBannerViewController *)self bannerView];
  double v13 = [v12 widthAnchor];
  double v14 = [v13 constraintEqualToConstant:640.0];
  [v14 setActive:1];

  uint64_t v15 = [(GKNotificationBannerViewController *)self view];
  id v16 = [v15 trailingAnchor];
  double v17 = [(GKNotificationBannerViewController *)self bannerView];
  double v18 = [v17 trailingAnchor];
  double v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  id v24 = [(GKNotificationBannerViewController *)self view];
  double v20 = [v24 topAnchor];
  id v21 = [(GKNotificationBannerViewController *)self bannerView];
  id v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];
}

- (void)addConstraintsForBannerView
{
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ((GKApplicationLinkedOnOrAfter() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    unint64_t v9 = [v8 statusBarOrientation] - 3;

    if (v9 >= 2) {
      double v10 = v7;
    }
    else {
      double v10 = v5;
    }
    if (v9 < 2) {
      double v5 = v7;
    }
    double v7 = v10;
  }
  double v11 = [(GKNotificationBannerViewController *)self bannerView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  -[GKNotificationBannerViewController bannerWidthForViewSize:](self, "bannerWidthForViewSize:", v5, v7);
  double v13 = v12;
  double v14 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v15 = [(GKNotificationBannerViewController *)self bannerView];
  id v16 = [v14 constraintWithItem:v15 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v13];
  [(GKNotificationBannerViewController *)self setBannerWidthConstraint:v16];

  double v17 = [(GKNotificationBannerViewController *)self bannerView];
  double v18 = [(GKNotificationBannerViewController *)self bannerWidthConstraint];
  [v17 addConstraint:v18];

  double v19 = [(GKNotificationBannerViewController *)self bannerView];
  double v20 = (void *)MEMORY[0x1E4F28DC8];
  id v21 = [(GKNotificationBannerViewController *)self bannerView];
  if ([(GKNotificationBannerViewController *)self useShortBanner])
  {
    *(double *)&uint64_t v22 = 40.0;
LABEL_14:
    double v25 = *(double *)&v22;
    goto LABEL_15;
  }
  v23 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  if (v24 != 1 || (double v25 = 66.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38])
  {
    *(double *)&uint64_t v22 = 64.0;
    goto LABEL_14;
  }
LABEL_15:
  long long v26 = [v20 constraintWithItem:v21 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v25];
  [v19 addConstraint:v26];

  long long v27 = [(GKNotificationBannerViewController *)self view];
  long long v28 = (void *)MEMORY[0x1E4F28DC8];
  v29 = [(GKNotificationBannerViewController *)self bannerView];
  uint64_t v30 = [(GKNotificationBannerViewController *)self view];
  v31 = [v28 constraintWithItem:v29 attribute:9 relatedBy:0 toItem:v30 attribute:9 multiplier:1.0 constant:0.0];
  [v27 addConstraint:v31];

  v32 = [(GKNotificationBannerViewController *)self bannerView];
  [v32 bounds];
  -[GKNotificationBannerViewController _hiddenBannerPosition:](self, "_hiddenBannerPosition:", v33, v34);
  double v36 = v35;

  v37 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(GKNotificationBannerViewController *)self bannerView];
  v39 = [(GKNotificationBannerViewController *)self view];
  v40 = [v37 constraintWithItem:v38 attribute:10 relatedBy:0 toItem:v39 attribute:3 multiplier:1.0 constant:v36];
  [(GKNotificationBannerViewController *)self setBannerYPositionConstraint:v40];

  id v42 = [(GKNotificationBannerViewController *)self view];
  v41 = [(GKNotificationBannerViewController *)self bannerYPositionConstraint];
  [v42 addConstraint:v41];
}

- (CGPoint)_hiddenBannerPosition:(CGSize)a3
{
  double v4 = [(GKNotificationBannerViewController *)self view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v23.origin.double x = v6;
  v23.origin.double y = v8;
  v23.size.double width = v10;
  v23.size.double height = v12;
  CGFloat MidX = CGRectGetMidX(v23);
  v24.origin.double x = v6;
  v24.origin.double y = v8;
  v24.size.double width = v10;
  v24.size.double height = v12;
  double MinY = CGRectGetMinY(v24);
  BOOL v15 = [(GKNotificationBannerViewController *)self useShortBanner];
  double v16 = 20.0;
  if (!v15)
  {
    double v17 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 20.0);
    uint64_t v18 = [v17 userInterfaceIdiom];

    if (v18 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v19 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v19 = 0), v19)) {
      double v16 = 32.0;
    }
    else {
      double v16 = 33.0;
    }
  }
  double v20 = MinY - floor(v16);
  double v21 = MidX;
  result.double y = v20;
  result.double x = v21;
  return result;
}

- (CGPoint)_visibleBannerCenterPosition:(CGSize)a3
{
  double v4 = [(GKNotificationBannerViewController *)self view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(GKNotificationBannerViewController *)self view];
  [v13 safeAreaInsets];
  double v15 = v14;

  v29.origin.double x = v6;
  v29.origin.double y = v8;
  v29.size.double width = v10;
  v29.size.double height = v12;
  CGFloat MidX = CGRectGetMidX(v29);
  v30.origin.double x = v6;
  v30.origin.double y = v8;
  v30.size.double width = v10;
  v30.size.double height = v12;
  double MinY = CGRectGetMinY(v30);
  double v18 = 20.0;
  if (![(GKNotificationBannerViewController *)self useShortBanner])
  {
    BOOL v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    if (v20 != 1 || (double v18 = 33.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38]) {
      double v18 = 32.0;
    }
  }
  BOOL v21 = [(GKNotificationBannerViewController *)self useShortBanner];
  double v22 = 21.0;
  if (!v21)
  {
    CGRect v23 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 21.0);
    uint64_t v24 = [v23 userInterfaceIdiom];

    double v22 = 8.0;
    if (v24 == 1)
    {
      if (*MEMORY[0x1E4F63A38]) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = *MEMORY[0x1E4F63830] == 0;
      }
      if (v25) {
        double v22 = 16.0;
      }
    }
  }
  double v26 = v15 + MinY + floor(v18) + v22;
  double v27 = MidX;
  result.double y = v26;
  result.double x = v27;
  return result;
}

- (GKNotificationBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (BOOL)bannerVisible
{
  return self->_bannerVisible;
}

- (void)setBannerVisible:(BOOL)a3
{
  self->_bannerVisible = a3;
}

- (BOOL)bannerAnimating
{
  return self->_bannerAnimating;
}

- (void)setBannerAnimating:(BOOL)a3
{
  self->_bannerAnimating = a3;
}

- (NSLayoutConstraint)bannerYPositionConstraint
{
  return self->_bannerYPositionConstraint;
}

- (void)setBannerYPositionConstraint:(id)a3
{
}

- (NSLayoutConstraint)bannerWidthConstraint
{
  return self->_bannerWidthConstraint;
}

- (void)setBannerWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bannerYPositionConstraint, 0);

  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end