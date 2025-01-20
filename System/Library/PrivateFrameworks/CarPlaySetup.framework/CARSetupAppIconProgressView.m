@interface CARSetupAppIconProgressView
- (CARMicaPlayer)micaPlayer;
- (CARSetupAppIconProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)micaPlayerDidStartPlaying:(id)a3;
- (void)micaPlayerDidStopPlaying:(id)a3;
- (void)setMicaPlayer:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation CARSetupAppIconProgressView

- (CARSetupAppIconProgressView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CARSetupAppIconProgressView;
  v3 = -[CARSetupAppIconProgressView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 URLForResource:@"CarPlayProgress" withExtension:@"caar"];
    v6 = [CARMicaPlayer alloc];
    v7 = [v5 path];
    v8 = [(CARSetupAppIconProgressView *)v3 traitCollection];
    [v8 displayScale];
    v9 = -[CARMicaPlayer initWithPath:retinaScale:](v6, "initWithPath:retinaScale:", v7);

    [(CARMicaPlayer *)v9 setDelegate:v3];
    v10 = [(CARSetupAppIconProgressView *)v3 layer];
    [(CARMicaPlayer *)v9 addToLayer:v10 onTop:1 gravity:*MEMORY[0x263F15E18]];

    [(CARSetupAppIconProgressView *)v3 setMicaPlayer:v9];
  }
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CARSetupAppIconProgressView;
  [(CARSetupAppIconProgressView *)&v5 layoutSubviews];
  v3 = [(CARSetupAppIconProgressView *)self micaPlayer];
  v4 = [(CARSetupAppIconProgressView *)self layer];
  [v3 moveAndResizeWithinParentLayer:v4 usingGravity:*MEMORY[0x263F15E18] animate:0];
}

- (void)startAnimating
{
  id v2 = [(CARSetupAppIconProgressView *)self micaPlayer];
  [v2 play];
}

- (void)stopAnimating
{
  id v2 = [(CARSetupAppIconProgressView *)self micaPlayer];
  [v2 pause];
}

- (void)micaPlayerDidStartPlaying:(id)a3
{
  v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_INFO, "started playing app icon progress animation", v4, 2u);
  }
}

- (void)micaPlayerDidStopPlaying:(id)a3
{
  id v3 = a3;
  v4 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_249B58000, v4, OS_LOG_TYPE_INFO, "finished playing app icon progress animation, looping", v5, 2u);
  }

  [v3 setPlaybackTime:1.39];
  [v3 play];
}

- (CARMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end