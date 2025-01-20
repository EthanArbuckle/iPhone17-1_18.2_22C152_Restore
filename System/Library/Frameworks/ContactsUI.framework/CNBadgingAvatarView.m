@interface CNBadgingAvatarView
- (BOOL)isDoNotDisturb;
- (BOOL)isMarkedForSyndication;
- (CNAvatarAccessoryView)mediaContextBadge;
- (CNAvatarViewController)avatarViewController;
- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings;
- (CNBadgingAvatarView)initWithAvatarViewController:(id)a3;
- (CNCancelable)likenessBadgeRendererToken;
- (UIImage)badgeImage;
- (UIImageView)badgeImageView;
- (UIImageView)mediaContextBadgeView;
- (id)currentLikenessScope;
- (id)imageRenderer;
- (id)schedulerProvider;
- (void)dealloc;
- (void)layoutSubviews;
- (void)renderLikenessBadge:(id)a3;
- (void)renderMediaContextBadgeImage;
- (void)setAvatarViewController:(id)a3;
- (void)setBadgeImage:(id)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setBadgeStyleSettings:(id)a3;
- (void)setImage:(id)a3 forAccessoryViewType:(unint64_t)a4;
- (void)setIsDoNotDisturb:(BOOL)a3;
- (void)setIsMarkedForSyndication:(BOOL)a3;
- (void)setLikenessBadgeRendererToken:(id)a3;
- (void)setMediaContextBadge:(id)a3;
- (void)setMediaContextBadgeView:(id)a3;
- (void)updateBadgeCropStyle;
- (void)updateBadgeImageViewBackgroundColor;
- (void)updateBadgeImageViewContentMode;
- (void)updateBadgeImageViewFrame;
- (void)updateBadgeImageViewPosition;
- (void)updateBadgeTintColor;
@end

@implementation CNBadgingAvatarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContextBadgeView, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_likenessBadgeRendererToken, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);

  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

- (BOOL)isDoNotDisturb
{
  return self->_isDoNotDisturb;
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (void)setMediaContextBadgeView:(id)a3
{
}

- (UIImageView)mediaContextBadgeView
{
  return self->_mediaContextBadgeView;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (void)setLikenessBadgeRendererToken:(id)a3
{
}

- (CNCancelable)likenessBadgeRendererToken
{
  return self->_likenessBadgeRendererToken;
}

- (void)setBadgeImageView:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)renderLikenessBadge:(id)a3
{
  id v4 = a3;
  v5 = [(CNBadgingAvatarView *)self currentLikenessScope];
  if (v5)
  {
    v6 = [(CNBadgingAvatarView *)self imageRenderer];
    v7 = [(CNBadgingAvatarView *)self schedulerProvider];
    v8 = [v7 backgroundScheduler];
    v9 = [v6 renderedLikenessForBadge:v4 scope:v5 workScheduler:v8];

    uint64_t v23 = 0;
    v24 = (id *)&v23;
    uint64_t v25 = 0x3042000000;
    v26 = __Block_byref_object_copy__48055;
    v27 = __Block_byref_object_dispose__48056;
    id v28 = 0;
    objc_initWeak(&location, self);
    v10 = [(CNBadgingAvatarView *)self schedulerProvider];
    v11 = [v10 mainThreadScheduler];

    v12 = (void *)MEMORY[0x1E4F5A488];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke;
    v17[3] = &unk_1E549A120;
    objc_copyWeak(&v21, &location);
    id v13 = v11;
    id v18 = v13;
    v20 = &v23;
    id v19 = v4;
    v14 = [v12 observerWithResultBlock:v17];
    v15 = [v9 subscribe:v14];
    [(CNBadgingAvatarView *)self setLikenessBadgeRendererToken:v15];

    v16 = [(CNBadgingAvatarView *)self likenessBadgeRendererToken];
    objc_storeWeak(v24 + 5, v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v23, 8);
    objc_destroyWeak(&v28);
  }
}

void __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke_2;
  v9[3] = &unk_1E549A0F8;
  v9[4] = WeakRetained;
  id v10 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v3;
  [v5 performBlock:v9];
}

void __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) likenessBadgeRendererToken];

  id v3 = [*(id *)(a1 + 32) likenessBadgeRendererToken];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));

  if (v2) {
    BOOL v5 = v3 == WeakRetained;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 48) badgeType];
    [v6 setImage:v7 forAccessoryViewType:v8];
  }
}

- (void)renderMediaContextBadgeImage
{
  id v3 = [(CNBadgingAvatarView *)self likenessBadgeRendererToken];
  [v3 cancel];

  [(CNBadgingAvatarView *)self setLikenessBadgeRendererToken:0];
  id v4 = [(CNBadgingAvatarView *)self mediaContextBadge];

  if (v4)
  {
    id v7 = [(CNBadgingAvatarView *)self mediaContextBadge];
    [(CNBadgingAvatarView *)self renderLikenessBadge:v7];
  }
  else
  {
    BOOL v5 = [(CNBadgingAvatarView *)self mediaContextBadgeView];
    [v5 removeFromSuperview];

    id v6 = [(CNBadgingAvatarView *)self badgeImage];

    if (v6)
    {
      [(CNBadgingAvatarView *)self updateBadgeImageViewPosition];
    }
  }
}

- (void)setMediaContextBadge:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_mediaContextBadge] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaContextBadge, a3);
    [(CNBadgingAvatarView *)self renderMediaContextBadgeImage];
  }
}

- (void)setIsDoNotDisturb:(BOOL)a3
{
  if (self->_isDoNotDisturb != a3)
  {
    self->_isDoNotDisturb = a3;
    if (a3)
    {
      id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", @"moon.fill", -1, 0, 1, *MEMORY[0x1E4FB28F0]);
      [(CNBadgingAvatarView *)self setBadgeImage:v4];

      id v5 = +[CNBadgingAvatarBadgeStyleSettings doNotDisturbBadgeSettings];
      [(CNBadgingAvatarView *)self setBadgeStyleSettings:v5];
    }
    else
    {
      [(CNBadgingAvatarView *)self setBadgeImage:0];
    }
  }
}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  if (self->_isMarkedForSyndication != a3)
  {
    self->_isMarkedForSyndication = a3;
    if (a3)
    {
      id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.circle.fill"];
      [(CNBadgingAvatarView *)self setBadgeImage:v4];

      id v5 = +[CNBadgingAvatarBadgeStyleSettings markedForSyndicationBadgeSettings];
      [(CNBadgingAvatarView *)self setBadgeStyleSettings:v5];
    }
    else
    {
      [(CNBadgingAvatarView *)self setBadgeImage:0];
    }
  }
}

- (void)updateBadgeImageViewPosition
{
  uint64_t v4 = [(CNBadgingAvatarView *)self effectiveUserInterfaceLayoutDirection];
  id v5 = (void *)MEMORY[0x1E4F5A618];
  id v6 = [(CNBadgingAvatarView *)self badgeImageView];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(CNBadgingAvatarView *)self avatarViewController];
  v16 = [v15 view];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = [(CNBadgingAvatarView *)self badgeStyleSettings];
  uint64_t v26 = [v25 cnuiBadgePosition];
  v27 = [(CNBadgingAvatarView *)self mediaContextBadge];
  if (v27)
  {
    v2 = [(CNBadgingAvatarView *)self mediaContextBadgeView];
    [v2 frame];
  }
  else
  {
    uint64_t v28 = *MEMORY[0x1E4F1DB28];
    uint64_t v29 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v30 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    uint64_t v31 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  }
  objc_msgSend(v5, "frameForBadgeWithFrame:onAvatarFrame:withPosition:mediaContextFrame:isRTL:", v26, v4 == 1, v8, v10, v12, v14, v18, v20, v22, v24, v28, v29, v30, v31);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(CNBadgingAvatarView *)self badgeImageView];
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  if (v27) {
  v41 = [(CNBadgingAvatarView *)self badgeImageView];
  }
  [v41 setAutoresizingMask:18];

  v42 = [(CNBadgingAvatarView *)self badgeStyleSettings];
  unint64_t v43 = [v42 position];

  if (v43 <= 3)
  {
    uint64_t v44 = qword_18B9C3868[v43];
    id v45 = [(CNBadgingAvatarView *)self badgeImageView];
    objc_msgSend(v45, "setAutoresizingMask:", objc_msgSend(v45, "autoresizingMask") | v44);
  }
}

- (void)updateBadgeImageViewContentMode
{
  id v5 = [(CNBadgingAvatarView *)self badgeStyleSettings];
  uint64_t v3 = [v5 contentMode];
  uint64_t v4 = [(CNBadgingAvatarView *)self badgeImageView];
  [v4 setContentMode:v3];
}

- (void)updateBadgeImageViewBackgroundColor
{
  id v5 = [(CNBadgingAvatarView *)self badgeStyleSettings];
  uint64_t v3 = [v5 backgroundColor];
  uint64_t v4 = [(CNBadgingAvatarView *)self badgeImageView];
  [v4 setBackgroundColor:v3];
}

- (void)updateBadgeCropStyle
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A618];
  id v6 = [(CNBadgingAvatarView *)self badgeImageView];
  uint64_t v4 = [v6 layer];
  id v5 = [(CNBadgingAvatarView *)self badgeStyleSettings];
  objc_msgSend(v3, "cropAvatarBadgeLayer:withCropStyle:", v4, objc_msgSend(v5, "cropStyle"));
}

- (void)updateBadgeTintColor
{
  id v5 = [(CNBadgingAvatarView *)self badgeStyleSettings];
  uint64_t v3 = [v5 color];
  uint64_t v4 = [(CNBadgingAvatarView *)self badgeImageView];
  [v4 setTintColor:v3];
}

- (void)setBadgeStyleSettings:(id)a3
{
  id v6 = a3;
  if (!-[CNBadgingAvatarBadgeStyleSettings isEqual:](self->_badgeStyleSettings, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
    id v5 = [(CNBadgingAvatarView *)self badgeImage];

    if (v5)
    {
      [(CNBadgingAvatarView *)self updateBadgeImageViewPosition];
      [(CNBadgingAvatarView *)self updateBadgeTintColor];
      [(CNBadgingAvatarView *)self updateBadgeCropStyle];
      [(CNBadgingAvatarView *)self updateBadgeImageViewBackgroundColor];
      [(CNBadgingAvatarView *)self updateBadgeImageViewContentMode];
    }
  }
}

- (void)setImage:(id)a3 forAccessoryViewType:(unint64_t)a4
{
  id v32 = a3;
  if (a4 < 2)
  {
    id v6 = [(CNBadgingAvatarView *)self badgeImageView];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [(CNBadgingAvatarView *)self setBadgeImageView:v7];

      double v8 = [(CNBadgingAvatarView *)self badgeImageView];
      [v8 setClipsToBounds:1];
    }
    double v9 = [(CNBadgingAvatarView *)self badgeImageView];
    double v10 = [(CNBadgingAvatarView *)self mediaContextBadgeView];

    double v11 = [(CNBadgingAvatarView *)self badgeImageView];
    if (v10)
    {
      double v12 = [(CNBadgingAvatarView *)self mediaContextBadgeView];
      [(CNBadgingAvatarView *)self insertSubview:v11 aboveSubview:v12];
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (a4 == 2)
  {
    double v13 = [(CNBadgingAvatarView *)self mediaContextBadgeView];

    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [(CNBadgingAvatarView *)self setMediaContextBadgeView:v14];
    }
    double v9 = [(CNBadgingAvatarView *)self mediaContextBadgeView];
    v15 = [(CNBadgingAvatarView *)self badgeImageView];

    double v11 = [(CNBadgingAvatarView *)self mediaContextBadgeView];
    if (v15)
    {
      double v12 = [(CNBadgingAvatarView *)self badgeImageView];
      [(CNBadgingAvatarView *)self insertSubview:v11 belowSubview:v12];
      goto LABEL_13;
    }
LABEL_12:
    double v12 = [(CNBadgingAvatarView *)self avatarViewController];
    v16 = [v12 view];
    [(CNBadgingAvatarView *)self insertSubview:v11 aboveSubview:v16];

    goto LABEL_13;
  }
  double v9 = 0;
LABEL_14:
  BOOL v17 = [(CNBadgingAvatarView *)self effectiveUserInterfaceLayoutDirection] == 1;
  double v18 = (void *)MEMORY[0x1E4F5A618];
  double v19 = [(CNBadgingAvatarView *)self avatarViewController];
  double v20 = [v19 view];
  [v20 bounds];
  objc_msgSend(v18, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", a4, v17);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  [v9 setImage:v32];
  objc_msgSend(v9, "setFrame:", v22, v24, v26, v28);
  uint64_t v29 = [(CNBadgingAvatarView *)self mediaContextBadge];
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = [(CNBadgingAvatarView *)self badgeImage];

    if (v31) {
      [(CNBadgingAvatarView *)self updateBadgeImageViewPosition];
    }
  }
}

- (void)updateBadgeImageViewFrame
{
  BOOL v3 = [(CNBadgingAvatarView *)self effectiveUserInterfaceLayoutDirection] == 1;
  uint64_t v4 = (void *)MEMORY[0x1E4F5A618];
  id v5 = [(CNBadgingAvatarView *)self avatarViewController];
  id v6 = [v5 view];
  [v6 bounds];
  objc_msgSend(v4, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", 0, v3);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(CNBadgingAvatarView *)self badgeImageView];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  [(CNBadgingAvatarView *)self updateBadgeImageViewPosition];
}

- (id)schedulerProvider
{
  objc_opt_class();
  BOOL v3 = [(CNBadgingAvatarView *)self avatarViewController];
  uint64_t v4 = [v3 view];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  double v7 = [v6 schedulerProvider];

  return v7;
}

- (id)imageRenderer
{
  objc_opt_class();
  BOOL v3 = [(CNBadgingAvatarView *)self avatarViewController];
  uint64_t v4 = [v3 view];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  double v7 = [v6 imageRenderer];

  return v7;
}

- (id)currentLikenessScope
{
  objc_opt_class();
  BOOL v3 = [(CNBadgingAvatarView *)self avatarViewController];
  uint64_t v4 = [v3 view];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  double v7 = [v6 currentLikenessScope];

  return v7;
}

- (UIImage)badgeImage
{
  v2 = [(CNBadgingAvatarView *)self badgeImageView];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setBadgeImage:(id)a3
{
  if (a3)
  {
    [(CNBadgingAvatarView *)self setImage:a3 forAccessoryViewType:0];
    [(CNBadgingAvatarView *)self updateBadgeImageViewBackgroundColor];
  }
  else
  {
    uint64_t v4 = [(CNBadgingAvatarView *)self badgeImageView];
    [v4 setImage:0];

    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    id v5 = [(CNBadgingAvatarView *)self badgeImageView];
    [v5 setBackgroundColor:v6];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNBadgingAvatarView;
  [(CNBadgingAvatarView *)&v3 layoutSubviews];
  [(CNBadgingAvatarView *)self updateBadgeImageViewFrame];
  [(CNBadgingAvatarView *)self updateBadgeCropStyle];
}

- (void)dealloc
{
  objc_super v3 = [(CNBadgingAvatarView *)self likenessBadgeRendererToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CNBadgingAvatarView;
  [(CNBadgingAvatarView *)&v4 dealloc];
}

- (CNBadgingAvatarView)initWithAvatarViewController:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNBadgingAvatarView;
  id v6 = -[CNBadgingAvatarView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    p_avatarViewController = (id *)&v6->_avatarViewController;
    objc_storeStrong((id *)&v6->_avatarViewController, a3);
    [(CNBadgingAvatarView *)v7 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    BOOL v17 = [*p_avatarViewController view];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    double v18 = [*p_avatarViewController view];
    [v18 setAutoresizingMask:18];

    double v19 = [*p_avatarViewController view];
    [(CNBadgingAvatarView *)v7 addSubview:v19];

    double v20 = v7;
  }

  return v7;
}

@end