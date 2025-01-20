@interface MRUActivityArtworkView
- (BOOL)adjustsImageWhenLoading;
- (BOOL)currentItemHasChangedSinceArtworkLastSet;
- (BOOL)isEmpty;
- (BOOL)isLoading;
- (BOOL)isOnScreen;
- (BOOL)isPlaying;
- (BOOL)isTransitioning;
- (CCUICAPackageView)packageView;
- (MRUActivityArtworkView)init;
- (NSString)artworkIdentifier;
- (NSString)currentStateName;
- (NSString)itemIdentifier;
- (NSTimer)emptyTimer;
- (UIImage)emptyImage;
- (double)artworkLoadingTimeout;
- (id)description;
- (unint64_t)currentState;
- (void)layoutSubviews;
- (void)setAdjustsImageWhenHighlighted:(BOOL)a3;
- (void)setAdjustsImageWhenLoading:(BOOL)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setArtworkImage:(id)a3;
- (void)setCurrentImage:(id)a3 animated:(BOOL)a4;
- (void)setCurrentItemHasChangedSinceArtworkLastSet:(BOOL)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setCurrentStateName:(id)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setEmptyImage:(id)a3;
- (void)setEmptyTimer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPackageView:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)transitionToImage:(id)a3;
- (void)updatePackageAlphaAnimated:(BOOL)a3;
- (void)updatePackageState;
@end

@implementation MRUActivityArtworkView

- (MRUActivityArtworkView)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRUActivityArtworkView;
  v2 = [(MRUActivityArtworkView *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentState = 0;
    v4 = (CCUICAPackageView *)objc_alloc_init(MEMORY[0x1E4F5ADE0]);
    packageView = v3->_packageView;
    v3->_packageView = v4;

    [(CCUICAPackageView *)v3->_packageView setUserInteractionEnabled:0];
    v6 = +[MRUAssetsProvider packageDescriptionWithName:@"ActivityArtwork"];
    [(CCUICAPackageView *)v3->_packageView setPackageDescription:v6];

    v3->_loading = 1;
    v3->_adjustsImageWhenLoading = 0;
    uint64_t v7 = +[MRUAssetsProvider emptyArtwork];
    emptyImage = v3->_emptyImage;
    v3->_emptyImage = (UIImage *)v7;

    [(MRUActivityArtworkView *)v3 setCurrentImage:0 animated:0];
    v9 = [(MRUArtworkView *)v3 artworkImageView];
    [v9 removeFromSuperview];

    v10 = [(MRUArtworkView *)v3 placeholderBackground];
    [v10 removeFromSuperview];

    v11 = [(MRUArtworkView *)v3 placeholderImageView];
    [v11 removeFromSuperview];

    [(MRUActivityArtworkView *)v3 addSubview:v3->_packageView];
    [(MRUActivityArtworkView *)v3 updatePackageAlphaAnimated:0];
  }
  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p - loading=%u trackChanged=%u transitioning=%u state=%lu>", objc_opt_class(), self, self->_loading, self->_currentItemHasChangedSinceArtworkLastSet, self->_transitioning, self->_currentState];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MRUActivityArtworkView;
  [(MRUArtworkView *)&v9 layoutSubviews];
  [(MRUActivityArtworkView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double v7 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v11);
  if (v7 >= v8) {
    double v7 = v8;
  }
  UIRectCenteredRect();
  -[CCUICAPackageView setFrame:](self->_packageView, "setFrame:");
  [(CCUICAPackageView *)self->_packageView setScale:v7 / 20.0];
}

- (void)setOnScreen:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543618;
      double v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_INFO, "%{public}@ - set onScreen to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    [(MRUActivityArtworkView *)self updatePackageState];
  }
}

- (void)setPlaying:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    self->_playing = a3;
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543618;
      double v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_INFO, "%{public}@ - set playing to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    [(MRUActivityArtworkView *)self updatePackageState];
  }
}

- (void)setLoading:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_loading != a3)
  {
    BOOL v3 = a3;
    self->_loading = a3;
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543618;
      double v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_INFO, "%{public}@ - set loading to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    [(MRUActivityArtworkView *)self updatePackageAlphaAnimated:self->_onScreen];
  }
}

- (void)setAdjustsImageWhenLoading:(BOOL)a3
{
  if (self->_adjustsImageWhenLoading != a3)
  {
    self->_adjustsImageWhenLoading = a3;
    [(MRUActivityArtworkView *)self updatePackageAlphaAnimated:self->_onScreen];
  }
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUActivityArtworkView;
  [(MRUArtworkView *)&v4 setAdjustsImageWhenHighlighted:a3];
  [(MRUActivityArtworkView *)self updatePackageAlphaAnimated:self->_onScreen];
}

- (double)artworkLoadingTimeout
{
  return 0.05;
}

- (void)setArtworkImage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRUArtworkView *)self style] == 10)
  {
    v5 = [(MRUArtworkView *)self artworkImage];
    if (v4) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v5 == 0;
    }
    char v7 = !v6;
  }
  else
  {
    char v7 = 0;
  }
  __int16 v8 = MCLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_INFO, "%{public}@ - Artwork will change to nil. Marking needsTransition", buf, 0xCu);
  }

  v22.receiver = self;
  v22.super_class = (Class)MRUActivityArtworkView;
  [(MRUArtworkView *)&v22 setArtworkImage:v4];
  BOOL loading = self->_loading;
  [(MRUActivityArtworkView *)self setLoading:v4 == 0];
  uint64_t v10 = self->_artworkIdentifier;
  CGRect v11 = [(MRUArtworkView *)self imageLoader];
  v12 = [v11 lastVendedArtworkIdentifier];
  objc_super v13 = [v12 stringRepresentation];
  artworkIdentifier = self->_artworkIdentifier;
  self->_artworkIdentifier = v13;

  v15 = self->_artworkIdentifier;
  v16 = v10;
  v17 = v16;
  if (v16 == v15) {
    int v18 = 0;
  }
  else {
    int v18 = [(NSString *)v16 isEqual:v15] ^ 1;
  }

  if ((v7 & 1) != 0 || (self->_currentItemHasChangedSinceArtworkLastSet ? (int v19 = v18) : (int v19 = 0), v19 == 1))
  {
    v20 = MCLogCategoryDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v4;
      _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Transitioning to new image: %{public}@", buf, 0x16u);
    }

    [(MRUActivityArtworkView *)self transitionToImage:v4];
  }
  else
  {
    [(MRUActivityArtworkView *)self updatePackageState];
    v21 = MCLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 1024;
      BOOL v28 = !loading;
      _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Changing image: %{public}@, animated=%{BOOL}u", buf, 0x1Cu);
    }

    [(MRUActivityArtworkView *)self setCurrentImage:v4 animated:!loading];
  }
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  v5 = self->_itemIdentifier;
  if (v5 == v4)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(NSString *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      __int16 v8 = MCLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138543618;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v4;
        _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_INFO, "%{public}@ - Item identifier changed to: %{public}@. Marking needsTransition", (uint8_t *)&v11, 0x16u);
      }

      BOOL v9 = (NSString *)[(NSString *)v4 copy];
      itemIdentifier = self->_itemIdentifier;
      self->_itemIdentifier = v9;

      self->_currentItemHasChangedSinceArtworkLastSet = 1;
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUActivityArtworkView;
  -[MRUArtworkView setHighlighted:](&v6, sel_setHighlighted_);
  BOOL v5 = !a3 && self->_onScreen;
  [(MRUActivityArtworkView *)self updatePackageAlphaAnimated:v5];
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_emptCGFloat y = a3;
    [(MRUActivityArtworkView *)self setCurrentImage:0 animated:1];
    [(MRUActivityArtworkView *)self updatePackageState];
  }
}

- (void)setCurrentImage:(id)a3 animated:(BOOL)a4
{
  objc_super v6 = (UIImage *)a3;
  if (v6)
  {
    [(MRUActivityArtworkView *)self setEmpty:0];
    [(NSTimer *)self->_emptyTimer invalidate];
    emptyTimer = self->_emptyTimer;
    self->_emptyTimer = 0;
  }
  else if (!self->_emptyTimer)
  {
    objc_initWeak(&location, self);
    __int16 v8 = (void *)MEMORY[0x1E4F1CB00];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke;
    v48[3] = &unk_1E5F0DBA8;
    objc_copyWeak(&v49, &location);
    BOOL v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v48 block:5.0];
    uint64_t v10 = self->_emptyTimer;
    self->_emptyTimer = v9;

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  if (self->_empty)
  {
    int v11 = self->_emptyImage;

    objc_super v6 = v11;
  }
  if (self->_currentState) {
    v12 = @"albumart-back";
  }
  else {
    v12 = @"albumart-front";
  }
  packageView = self->_packageView;
  v14 = v12;
  uint64_t v15 = [(CCUICAPackageView *)packageView package];
  v16 = [v15 publishedObjectWithName:v14];

  v17 = [v16 superlayer];
  int v18 = [v17 superlayer];
  [v18 bounds];

  [(UIImage *)v6 size];
  -[MRUArtworkView artworkFrameForSize:availableBounds:](self, "artworkFrameForSize:availableBounds:");
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v27 = [(MRUArtworkView *)self style];
  [(UIImage *)v6 size];
  double v30 = MRUArtworkCornerRadius(v27, v28, v29);
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke_2;
  v39 = &unk_1E5F0DBD0;
  id v31 = v17;
  id v40 = v31;
  uint64_t v43 = v20;
  uint64_t v44 = v22;
  uint64_t v45 = v24;
  uint64_t v46 = v26;
  double v47 = v30;
  id v32 = v16;
  id v41 = v32;
  v33 = v6;
  v42 = v33;
  v34 = (void (**)(void))_Block_copy(&v36);
  v35 = v34;
  if (a4)
  {
    v34[2](v34);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F39CF8], "begin", v36, v37, v38, v39, v40, v41);
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v35[2](v35);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEmpty:1];
  [WeakRetained setEmptyTimer:0];
}

void __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 32) setCornerRadius:*(double *)(a1 + 88)];
  [*(id *)(a1 + 32) setCornerCurve:*MEMORY[0x1E4F39EA8]];
  uint64_t v2 = [*(id *)(a1 + 48) CGImage];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = *(void **)(a1 + 40);
    [v4 setContents:v3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] grayColor];
    objc_msgSend(*(id *)(a1 + 40), "setContents:", objc_msgSend(v5, "CGColor"));
  }
}

- (void)transitionToImage:(id)a3
{
  self->_currentItemHasChangedSinceArtworkLastSet = 0;
  self->_currentState = self->_currentState == 0;
  [(MRUActivityArtworkView *)self setCurrentImage:a3 animated:0];

  [(MRUActivityArtworkView *)self updatePackageState];
}

- (void)updatePackageState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t currentState = self->_currentState;
  if (self->_loading)
  {
    if (currentState) {
      id v4 = @"back";
    }
    else {
      id v4 = @"front";
    }
    if (self->_playing) {
      id v5 = &stru_1F06524E0;
    }
    else {
      id v5 = @"-paused";
    }
    if (!self->_empty) {
      id v5 = @"-loading";
    }
  }
  else
  {
    if (currentState) {
      id v4 = @"back";
    }
    else {
      id v4 = @"front";
    }
    if (self->_playing) {
      id v5 = &stru_1F06524E0;
    }
    else {
      id v5 = @"-paused";
    }
  }
  objc_super v6 = [NSString stringWithFormat:@"%@%@", v4, v5];
  char v7 = self->_currentStateName;
  if (v6 == v7)
  {
  }
  else
  {
    __int16 v8 = v7;
    char v9 = [(NSString *)v6 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentStateName, v6);
      [(CCUICAPackageView *)self->_packageView setStateName:v6];
      uint64_t v10 = MCLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_INFO, "%{public}@ - Changing package state to: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)updatePackageAlphaAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(MRUArtworkView *)self adjustsImageWhenHighlighted]) {
    int v5 = [(MRUActivityArtworkView *)self isHighlighted];
  }
  else {
    int v5 = 0;
  }
  BOOL v6 = [(MRUActivityArtworkView *)self adjustsImageWhenLoading];
  if (v6) {
    BOOL v6 = [(MRUActivityArtworkView *)self isLoading];
  }
  if (v5 | v6) {
    double v7 = 0.2;
  }
  else {
    double v7 = 1.0;
  }
  __int16 v8 = [(MRUActivityArtworkView *)self packageView];
  [v8 alpha];
  double v10 = vabdd_f64(v9, v7);

  if (v10 > 2.22044605e-16)
  {
    int v11 = MCLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544386;
      uint64_t v15 = self;
      __int16 v16 = 2048;
      double v17 = v7;
      __int16 v18 = 1024;
      BOOL v19 = v3;
      __int16 v20 = 1024;
      BOOL v21 = [(MRUActivityArtworkView *)self isLoading];
      __int16 v22 = 1024;
      int v23 = [(MRUActivityArtworkView *)self isHighlighted];
      _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_INFO, "%{public}@ - Changing package alpha to: %f animated:%{BOOL}u. highlighted:%{BOOL}u loading:%{BOOL}u", buf, 0x28u);
    }

    if (v3)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53__MRUActivityArtworkView_updatePackageAlphaAnimated___block_invoke;
      v13[3] = &unk_1E5F0DBF8;
      v13[4] = self;
      *(double *)&v13[5] = v7;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v13 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      v12 = [(MRUActivityArtworkView *)self packageView];
      [v12 setAlpha:v7];
    }
  }
}

void __53__MRUActivityArtworkView_updatePackageAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) packageView];
  [v2 setAlpha:v1];
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)adjustsImageWhenLoading
{
  return self->_adjustsImageWhenLoading;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (BOOL)currentItemHasChangedSinceArtworkLastSet
{
  return self->_currentItemHasChangedSinceArtworkLastSet;
}

- (void)setCurrentItemHasChangedSinceArtworkLastSet:(BOOL)a3
{
  self->_currentItemHasChangedSinceArtworkLastSet = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_unint64_t currentState = a3;
}

- (NSString)currentStateName
{
  return self->_currentStateName;
}

- (void)setCurrentStateName:(id)a3
{
}

- (NSTimer)emptyTimer
{
  return self->_emptyTimer;
}

- (void)setEmptyTimer:(id)a3
{
}

- (UIImage)emptyImage
{
  return self->_emptyImage;
}

- (void)setEmptyImage:(id)a3
{
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_emptyTimer, 0);
  objc_storeStrong((id *)&self->_currentStateName, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end