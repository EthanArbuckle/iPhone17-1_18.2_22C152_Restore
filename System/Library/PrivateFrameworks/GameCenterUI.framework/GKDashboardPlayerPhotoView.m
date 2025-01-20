@interface GKDashboardPlayerPhotoView
- (BOOL)canBecomeFocused;
- (BOOL)dimmed;
- (BOOL)focusable;
- (BOOL)hasImage;
- (BOOL)isUsingPlaceholder;
- (BOOL)selected;
- (BOOL)useDarkerPlaceholder;
- (GKDashboardPlayerPhotoView)initWithCoder:(id)a3;
- (GKDashboardPlayerPhotoView)initWithFrame:(CGRect)a3;
- (GKPlayer)player;
- (GKPlayerAvatarViewDelegate)delegate;
- (UIImageView)avatarImageView;
- (int64_t)avatarSize;
- (void)commonInit;
- (void)invalidatePhoto;
- (void)layoutSubviews;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)refreshImageWithCompletionHandler:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAvatarImageView:(id)a3;
- (void)setAvatarSize:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setFocusable:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayer:(id)a3 completionHandler:(id)a4;
- (void)setSelected:(BOOL)a3;
- (void)setUseDarkerPlaceholder:(BOOL)a3;
- (void)setUsingPlaceholder:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation GKDashboardPlayerPhotoView

- (void)commonInit
{
  [(GKDashboardPlayerPhotoView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = objc_opt_new();
  [(GKDashboardPlayerPhotoView *)self setAvatarImageView:v3];

  v4 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  [v4 setAccessibilityIdentifier:@"UIA.GameCenter.GKDashboardPlayerPhotoView.avatarImageView"];

  v5 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  [(GKDashboardPlayerPhotoView *)self addSubview:v5];

  [(GKDashboardPlayerPhotoView *)self setAvatarSize:65537];

  [(GKDashboardPlayerPhotoView *)self setFocusable:0];
}

- (GKDashboardPlayerPhotoView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerPhotoView;
  v3 = [(GKDashboardPlayerPhotoView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GKDashboardPlayerPhotoView *)v3 commonInit];
  }
  return v4;
}

- (GKDashboardPlayerPhotoView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerPhotoView;
  v3 = -[GKDashboardPlayerPhotoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GKDashboardPlayerPhotoView *)v3 commonInit];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)GKDashboardPlayerPhotoView;
  [(GKDashboardPlayerPhotoView *)&v21 layoutSubviews];
  [(GKDashboardPlayerPhotoView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(GKDashboardPlayerPhotoView *)self bounds];
  double v13 = v12 * 0.5;
  v14 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  v15 = [v14 layer];
  [v15 setCornerRadius:v13];

  [(GKDashboardPlayerPhotoView *)self bounds];
  [(GKDashboardPlayerPhotoView *)self _setCornerRadius:v16 * 0.5];
  [(GKDashboardPlayerPhotoView *)self setClipsToBounds:1];
  v17 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  [v17 setClipsToBounds:1];

  v18 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  v19 = [v18 layer];
  [v19 setMasksToBounds:1];

  v20 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  [v20 setContentMode:2];
}

- (BOOL)hasImage
{
  v2 = [(GKDashboardPlayerPhotoView *)self player];
  char v3 = [v2 hasPhoto];

  return v3;
}

- (void)setPlayer:(id)a3
{
}

- (void)setPlayer:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [(GKPlayer *)self->_player internal];
  double v10 = [v9 playerID];
  v11 = [v7 internal];
  double v12 = [v11 playerID];

  if (v10 != v12)
  {
    objc_storeStrong((id *)&self->_player, a3);
    if (v7)
    {
      double v13 = dispatch_get_global_queue(0, 0);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke;
      v15[3] = &unk_1E5F63E30;
      v15[4] = self;
      id v16 = v8;
      dispatch_async(v13, v15);
    }
  }
  if (!self->_player)
  {
    v14 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
    [v14 setImage:0];
  }
}

void __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke_2;
  v2[3] = &unk_1E5F639B0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 refreshImageWithCompletionHandler:v2];
}

uint64_t __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setAccessibilityLabel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerPhotoView;
  id v4 = a3;
  [(GKDashboardPlayerPhotoView *)&v6 setAccessibilityLabel:v4];
  double v5 = [(GKDashboardPlayerPhotoView *)self avatarImageView];
  [v5 setAccessibilityLabel:v4];
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
  if (a3) {
    float v3 = 0.5;
  }
  else {
    float v3 = 1.0;
  }
  id v5 = [(GKDashboardPlayerPhotoView *)self layer];
  *(float *)&double v4 = v3;
  [v5 setOpacity:v4];
}

- (void)refreshImageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x1E4F63860];
  objc_super v6 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v7 = (id)GKOSLoggers();
    objc_super v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[GKDashboardPlayerPhotoView refreshImageWithCompletionHandler:](v6, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = (void *)MEMORY[0x1E4F636D8];
  id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardPlayerPhotoView.m", 143, "-[GKDashboardPlayerPhotoView refreshImageWithCompletionHandler:]");
  v17 = [v15 dispatchGroupWithName:v16];

  v18 = [(GKDashboardPlayerPhotoView *)self player];
  v19 = [v18 internal];
  v20 = [v19 playerID];

  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke;
  v31[3] = &unk_1E5F63FC8;
  objc_copyWeak(&v34, &location);
  v31[4] = self;
  id v21 = v20;
  id v32 = v21;
  id v22 = v17;
  id v33 = v22;
  [v22 perform:v31];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_16;
  v26[3] = &unk_1E5F63FF0;
  id v23 = v22;
  id v27 = v23;
  v28 = self;
  id v24 = v21;
  id v29 = v24;
  id v25 = v4;
  id v30 = v25;
  [v23 notifyOnMainQueueWithBlock:v26];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  float v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v6 = [WeakRetained player];
    uint64_t v7 = [a1[4] avatarSize];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5F63FA0;
    id v9 = a1[5];
    uint64_t v10 = v5;
    id v11 = a1[6];
    uint64_t v12 = v3;
    [v6 playerAvatarImageWithSize:v7 completionHandler:v8];
  }
  else
  {
    v3[2](v3);
  }
}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = (NSObject **)MEMORY[0x1E4F63860];
  id v9 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v10 = (id)GKOSLoggers();
    id v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_2(a1, v9, (uint64_t)v6);
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [*(id *)(a1 + 40) player];
  uint64_t v13 = [v12 internal];
  uint64_t v14 = [v13 playerID];
  LODWORD(v11) = [v11 isEqualToString:v14];

  if (v11)
  {
    [*(id *)(a1 + 48) setResult:v6];
  }
  else
  {
    v15 = *v8;
    if (!*v8)
    {
      id v16 = (id)GKOSLoggers();
      v15 = *v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_1(v15, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_16(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];

  if (v2)
  {
    float v3 = [*(id *)(a1 + 32) result];
    [v3 size];
    double v5 = v4;
    [v3 size];
    if (v5 != v6)
    {
      [v3 size];
      double v8 = v7;
      [v3 size];
      if (v8 >= v9) {
        double v10 = v9;
      }
      else {
        double v10 = v8;
      }
      uint64_t v11 = objc_msgSend(v3, "_gkCropImageIntoSquare:", v10, v10);

      float v3 = (void *)v11;
    }
    uint64_t v12 = [*(id *)(a1 + 40) avatarImageView];
    [v12 setImage:v3];
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 48);
    uint64_t v14 = [*(id *)(a1 + 40) player];
    v15 = [v14 internal];
    id v16 = [v15 playerID];
    LODWORD(v13) = [v13 isEqualToString:v16];

    if (!v13) {
      goto LABEL_11;
    }
    float v3 = [*(id *)(a1 + 40) player];
    uint64_t v12 = objc_msgSend(v3, "placeholderImageWithPhotoSize:", objc_msgSend(*(id *)(a1 + 40), "avatarSize"));
    uint64_t v17 = [*(id *)(a1 + 40) avatarImageView];
    [v17 setImage:v12];
  }
LABEL_11:
  uint64_t v18 = [*(id *)(a1 + 40) delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [*(id *)(a1 + 40) delegate];
    [v20 didSetPlayerAvatarImage:*(void *)(a1 + 40)];
  }
  uint64_t v21 = [*(id *)(a1 + 40) delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    uint64_t v23 = [*(id *)(a1 + 40) delegate];
    [v23 avatarContentIsReady];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v25 = *(uint64_t (**)(void))(result + 16);
    return v25();
  }
  return result;
}

- (void)invalidatePhoto
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([(GKDashboardPlayerPhotoView *)self isUserInteractionEnabled])
  {
    double v5 = [(GKDashboardPlayerPhotoView *)self delegate];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
      [(GKDashboardPlayerPhotoView *)self setTintColor:v6];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(GKDashboardPlayerPhotoView *)self isUserInteractionEnabled])
  {
    double v5 = [(GKDashboardPlayerPhotoView *)self delegate];

    if (v5)
    {
      [(GKDashboardPlayerPhotoView *)self setTintColor:0];
      id v6 = [(GKDashboardPlayerPhotoView *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [(GKDashboardPlayerPhotoView *)self delegate];
        [v8 didSelectPlayerAvatarView:self];
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(GKDashboardPlayerPhotoView *)self isUserInteractionEnabled])
  {
    double v5 = [(GKDashboardPlayerPhotoView *)self delegate];

    if (v5)
    {
      [(GKDashboardPlayerPhotoView *)self setTintColor:0];
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKDashboardPlayerPhotoView;
  [(GKDashboardPlayerPhotoView *)&v19 pressesEnded:v6 withEvent:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "type", (void)v15) == 4)
        {
          if ([(GKDashboardPlayerPhotoView *)self isUserInteractionEnabled])
          {
            uint64_t v12 = [(GKDashboardPlayerPhotoView *)self delegate];
            char v13 = objc_opt_respondsToSelector();

            if (v13)
            {
              uint64_t v14 = [(GKDashboardPlayerPhotoView *)self delegate];
              [v14 didSelectPlayerAvatarView:self];
            }
          }
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (BOOL)canBecomeFocused
{
  return self->_focusable;
}

- (GKPlayer)player
{
  return self->_player;
}

- (BOOL)useDarkerPlaceholder
{
  return self->_useDarkerPlaceholder;
}

- (void)setUseDarkerPlaceholder:(BOOL)a3
{
  self->_useDarkerPlaceholder = a3;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (BOOL)isUsingPlaceholder
{
  return self->_usingPlaceholder;
}

- (void)setUsingPlaceholder:(BOOL)a3
{
  self->_usingPlaceholder = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)focusable
{
  return self->_focusable;
}

- (void)setFocusable:(BOOL)a3
{
  self->_focusable = a3;
}

- (GKPlayerAvatarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKPlayerAvatarViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)avatarSize
{
  return self->_avatarSize;
}

- (void)setAvatarSize:(int64_t)a3
{
  self->_avatarSize = a3;
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setAvatarImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_player, 0);
}

- (void)refreshImageWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v4 player];
  uint64_t v8 = [v7 internal];
  uint64_t v9 = [v8 playerID];
  int v10 = 138412802;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  char v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a3;
  _os_log_debug_impl(&dword_1AF250000, v6, OS_LOG_TYPE_DEBUG, "GKDashboardPlayerPhotoView.refreshImageWithCompletionHandler.playerAvatarImageWithSize: currentPlayerID=%@ strongSelf.player.internal.playerID=%@ || image=%@", (uint8_t *)&v10, 0x20u);
}

@end