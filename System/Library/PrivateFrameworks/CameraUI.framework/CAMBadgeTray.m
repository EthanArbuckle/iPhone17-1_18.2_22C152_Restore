@interface CAMBadgeTray
- (CAMBadgeTray)initWithFrame:(CGRect)a3;
- (CAMBadgeTrayDelegate)delegate;
- (CAMElapsedTimeView)elapsedTimeView;
- (CAMFlashBadge)flashBadge;
- (CAMFocusLockBadge)focusLockBadge;
- (CAMLivePhotoBadge)livePhotoBadge;
- (CAMSharedLibraryBadge)sharedLibraryBadge;
- (CAMVideoPausedBadge)videoPausedBadge;
- (CAMVideoStabilizationBadge)videoStabilizationBadge;
- (NSMutableDictionary)_badgeMap;
- (id)_createControlForType:(unint64_t)a3;
- (unint64_t)_badgeFontStyle;
- (unint64_t)visibleBadges;
- (void)_forBadgeTypeInBadgeTypes:(unint64_t)a3 do:(id)a4;
- (void)_layoutBadges:(unint64_t)a3 withVisibleBadges:(unint64_t)a4;
- (void)_loadBadgesIfNeededForTypes:(unint64_t)a3;
- (void)_updateBadgesVisibilityForVisibleBadges:(unint64_t)a3;
- (void)badgeViewDidChangeIntrinsicContentSize:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setVisibleBadges:(unint64_t)a3;
- (void)setVisibleBadges:(unint64_t)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMBadgeTray

- (CAMBadgeTray)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMBadgeTray;
  v3 = -[CAMBadgeTray initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    badgeMap = v3->__badgeMap;
    v3->__badgeMap = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)layoutSubviews
{
  unint64_t v3 = [(CAMBadgeTray *)self visibleBadges];
  [(CAMBadgeTray *)self _layoutBadges:v3 withVisibleBadges:v3];
  [(CAMBadgeTray *)self _updateBadgesVisibilityForVisibleBadges:v3];
}

- (void)_layoutBadges:(unint64_t)a3 withVisibleBadges:(unint64_t)a4
{
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke;
  v13[3] = &unk_263FA5380;
  v13[4] = self;
  v13[5] = &v18;
  v13[6] = &v14;
  [(CAMBadgeTray *)self _forBadgeTypeInBadgeTypes:a4 do:v13];
  double v7 = v19[3];
  uint64_t v8 = v15[3];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  double v12 = 0.0;
  [(CAMBadgeTray *)self bounds];
  double v12 = (v9 - (v7 + (double)(unint64_t)(v8 - 1) * 5.0)) * 0.5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_2;
  v10[3] = &unk_263FA53A8;
  v10[5] = v11;
  v10[6] = a3;
  v10[4] = self;
  [(CAMBadgeTray *)self _forBadgeTypeInBadgeTypes:a4 do:v10];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _badgeMap];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v7 = [v4 objectForKeyedSubscript:v5];

  [v7 intrinsicContentSize];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _badgeMap];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  double v6 = [v4 objectForKeyedSubscript:v5];

  [v6 intrinsicContentSize];
  double v8 = v7;
  if ((a2 & ~*(void *)(a1 + 48)) == 0)
  {
    [*(id *)(a1 + 32) bounds];
    UIRectCenteredYInRectScale();
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    double v8 = v13;
    uint64_t v15 = v14;
    UIRectGetCenter();
    [v6 setCenter:0];
    uint64_t v16 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_3;
    v17[3] = &unk_263FA06F8;
    id v18 = v6;
    uint64_t v19 = v10;
    uint64_t v20 = v12;
    double v21 = v8;
    uint64_t v22 = v15;
    [v16 performWithoutAnimation:v17];
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                              + 5.0
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

uint64_t __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setVisibleBadges:(unint64_t)a3
{
}

- (void)setVisibleBadges:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t visibleBadges = self->_visibleBadges;
  if (visibleBadges != a3)
  {
    BOOL v5 = a4;
    unint64_t v8 = a3 & ~visibleBadges;
    [(CAMBadgeTray *)self _loadBadgesIfNeededForTypes:v8];
    self->_unint64_t visibleBadges = a3;
    if (v5)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke;
      v10[3] = &unk_263FA53D0;
      v10[4] = self;
      v10[5] = v8;
      v10[6] = a3;
      void v10[7] = visibleBadges;
      [MEMORY[0x263F82E00] performWithoutAnimation:v10];
      [(CAMBadgeTray *)self setNeedsLayout];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_3;
      v9[3] = &unk_263FA0208;
      v9[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v9 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      [(CAMBadgeTray *)self setNeedsLayout];
    }
  }
}

uint64_t __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutBadges:*(void *)(a1 + 40) withVisibleBadges:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateBadgesVisibilityForVisibleBadges:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_2;
  v5[3] = &unk_263FA20E0;
  v5[4] = v2;
  return [v2 _forBadgeTypeInBadgeTypes:v3 do:v5];
}

void __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _badgeMap];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v5 = [v3 objectForKeyedSubscript:v4];

  [v5 layoutIfNeeded];
}

uint64_t __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  uint64_t v4 = [(CAMBadgeTray *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMBadgeTray *)self setNeedsLayout];
  }
}

- (CAMFlashBadge)flashBadge
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEC58];

  return (CAMFlashBadge *)v3;
}

- (CAMLivePhotoBadge)livePhotoBadge
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEC70];

  return (CAMLivePhotoBadge *)v3;
}

- (CAMFocusLockBadge)focusLockBadge
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEC88];

  return (CAMFocusLockBadge *)v3;
}

- (CAMElapsedTimeView)elapsedTimeView
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDECA0];

  return (CAMElapsedTimeView *)v3;
}

- (CAMSharedLibraryBadge)sharedLibraryBadge
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDECB8];

  return (CAMSharedLibraryBadge *)v3;
}

- (CAMVideoStabilizationBadge)videoStabilizationBadge
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDECD0];

  return (CAMVideoStabilizationBadge *)v3;
}

- (CAMVideoPausedBadge)videoPausedBadge
{
  v2 = [(CAMBadgeTray *)self _badgeMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDECE8];

  return (CAMVideoPausedBadge *)v3;
}

- (id)_createControlForType:(unint64_t)a3
{
  uint64_t v4 = 0;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        id v5 = CAMSharedLibraryBadge;
        break;
      case 0x20uLL:
        id v5 = CAMVideoStabilizationBadge;
        break;
      case 0x40uLL:
        id v5 = CAMVideoPausedBadge;
        break;
      default:
        goto LABEL_14;
    }
LABEL_13:
    uint64_t v4 = (CAMFlashBadge *)objc_alloc_init(v5);
    [(CEKBadgeView *)v4 setDelegate:self];
    [(CAMFlashBadge *)v4 setFontStyle:[(CAMBadgeTray *)self _badgeFontStyle]];
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        uint64_t v4 = objc_alloc_init(CAMFlashBadge);
        [(CEKBadgeView *)v4 setDelegate:self];
        break;
      case 2uLL:
        id v5 = CAMLivePhotoBadge;
        goto LABEL_13;
      case 4uLL:
        id v5 = CAMFocusLockBadge;
        goto LABEL_13;
      case 8uLL:
        uint64_t v4 = objc_alloc_init(CAMElapsedTimeView);
        break;
      default:
        break;
    }
  }
LABEL_14:
  return v4;
}

- (unint64_t)_badgeFontStyle
{
  v2 = +[CAMCaptureCapabilities capabilities];
  unint64_t v3 = [v2 sfCameraFontSupported];

  return v3;
}

- (void)_forBadgeTypeInBadgeTypes:(unint64_t)a3 do:(id)a4
{
  char v4 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  if (v4)
  {
    v5[2](v5, 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2](v5, 2);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[2](v5, 8);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v5[2](v5, 4);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v5[2](v5, 16);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v5[2](v5, 32);
  if ((v4 & 0x40) != 0) {
LABEL_8:
  }
    v5[2](v5, 64);
LABEL_9:
}

- (void)_loadBadgesIfNeededForTypes:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__CAMBadgeTray__loadBadgesIfNeededForTypes___block_invoke;
  v3[3] = &unk_263FA20E0;
  v3[4] = self;
  [(CAMBadgeTray *)self _forBadgeTypeInBadgeTypes:a3 do:v3];
}

void __44__CAMBadgeTray__loadBadgesIfNeededForTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) _badgeMap];
  char v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v5 = [v8 objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _createControlForType:a2];
    id v6 = [NSNumber numberWithUnsignedInteger:a2];
    [v8 setObject:v5 forKeyedSubscript:v6];

    [*(id *)(a1 + 32) addSubview:v5];
    double v7 = [*(id *)(a1 + 32) delegate];
    [v7 badgeTray:*(void *)(a1 + 32) didCreateBadgeForType:a2];
  }
}

- (void)_updateBadgesVisibilityForVisibleBadges:(unint64_t)a3
{
  char v4 = [(CAMBadgeTray *)self _badgeMap];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__CAMBadgeTray__updateBadgesVisibilityForVisibleBadges___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v32__0__NSNumber_8__UIView_16_B24l;
  v5[4] = a3;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __56__CAMBadgeTray__updateBadgesVisibilityForVisibleBadges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  double v6 = 0.0;
  if ((v5 & ~*(void *)(a1 + 32)) == 0) {
    double v6 = 1.0;
  }
  [v7 setAlpha:v6];
}

- (void)badgeViewDidChangeIntrinsicContentSize:(id)a3
{
  [(CAMBadgeTray *)self setNeedsLayout];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__CAMBadgeTray_badgeViewDidChangeIntrinsicContentSize___block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v4 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
}

uint64_t __55__CAMBadgeTray_badgeViewDidChangeIntrinsicContentSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (CAMBadgeTrayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMBadgeTrayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)visibleBadges
{
  return self->_visibleBadges;
}

- (NSMutableDictionary)_badgeMap
{
  return self->__badgeMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end