@interface BKUIPearlMovieLoopView
+ (Class)layerClass;
- (AVAsset)assets;
- (AVPlayer)player;
- (BKUIPearlMovieLoopView)initWithFrame:(CGRect)a3 player:(id)a4 asset:(id)a5;
- (BOOL)landscape;
- (BOOL)portrait;
- (UIImage)selfPortraite;
- (UIImageView)imageView;
- selfPortrait;
- (void)addAnimatedSelfPotraitIfNeeded;
- (void)hideAVPlayerReplaceWithSnapshot;
- (void)selfPortrait;
- (void)setAlphaHideOnZero:(double)a3;
- (void)setAssets:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setSelfPortraite:(id)a3;
- (void)unhideAVPlayerRemoveSnapshot;
@end

@implementation BKUIPearlMovieLoopView

- (BKUIPearlMovieLoopView)initWithFrame:(CGRect)a3 player:(id)a4 asset:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BKUIPearlMovieLoopView;
  v14 = -[BKUIPearlMovieLoopView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_player, a4);
    objc_storeStrong((id *)&v15->_assets, a5);
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", x, y, width, height);
    imageView = v15->_imageView;
    v15->_imageView = (UIImageView *)v16;

    v18 = [(BKUIPearlMovieLoopView *)v15 selfPortrait];
    [(UIImageView *)v15->_imageView setImage:v18];

    v19 = [(BKUIPearlMovieLoopView *)v15 playerLayer];
    [v19 setPlayer:v12];

    [(BKUIPearlMovieLoopView *)v15 addAnimatedSelfPotraitIfNeeded];
  }

  return v15;
}

- (void)addAnimatedSelfPotraitIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_FAULT, "BKUIPearlMovieLoopView: adding subview: animated self potrait", v1, 2u);
}

- (void)unhideAVPlayerRemoveSnapshot
{
  id v2 = [(BKUIPearlMovieLoopView *)self imageView];
  [v2 removeFromSuperview];
}

- (void)hideAVPlayerReplaceWithSnapshot
{
  id v3 = [(BKUIPearlMovieLoopView *)self imageView];
  [(BKUIPearlMovieLoopView *)self addSubview:v3];
}

- (BOOL)portrait
{
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v3 userInterfaceIdiom])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(BKUIPearlMovieLoopView *)self traitCollection];
    BOOL v4 = [v5 horizontalSizeClass] == 1;
  }
  v6 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v7 = [v6 orientation] == 1
    || +[BKUIUtils activeInterfaceOrientationForView:self] == 1|| v4;

  return v7;
}

- (BOOL)landscape
{
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v4 = [v3 orientation] == 3
    || +[BKUIUtils activeInterfaceOrientationForView:self] == 3;

  return v4;
}

- (void)setAlphaHideOnZero:(double)a3
{
  -[BKUIPearlMovieLoopView setAlpha:](self, "setAlpha:");

  [(BKUIPearlMovieLoopView *)self setHidden:a3 == 0.0];
}

- selfPortrait
{
  UIImage *selfPortraite;
  void *v4;
  void *v5;
  UIImage *v6;
  id v7;
  UIImage *v8;
  NSObject *v10;
  id v11;
  CMTime v12;
  uint64_t vars8;

  selfPortraite = self->_selfPortraite;
  if (!selfPortraite)
  {
    BOOL v4 = [(BKUIPearlMovieLoopView *)self player];
    CMTimeMake(&v12, 0, 1);
    v5 = [(BKUIPearlMovieLoopView *)self assets];
    v11 = 0;
    objc_msgSend(v4, "bkui_snapshotImageAt:asset:error:", &v12, v5, &v11);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v11;
    v8 = self->_selfPortraite;
    self->_selfPortraite = v6;

    if (v7)
    {
      v10 = _BKUILoggingFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(BKUIPearlMovieLoopView *)v7 selfPortrait];
      }

      __assert_rtn("-[BKUIPearlMovieLoopView selfPortrait]", "BKUIPearlMovieLoopView.m", 115, "false");
    }
    selfPortraite = self->_selfPortraite;
  }

  return selfPortraite;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVAsset)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (UIImage)selfPortraite
{
  return self->_selfPortraite;
}

- (void)setSelfPortraite:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_selfPortraite, 0);
  objc_storeStrong((id *)&self->_assets, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

- (void)selfPortrait
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a1 localizedDescription];
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 code];
  _os_log_fault_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_FAULT, "error could not grab image clip of the av clip description:/n%@ code: %li", (uint8_t *)&v5, 0x16u);
}

@end