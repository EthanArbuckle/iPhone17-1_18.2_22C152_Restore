@interface FMDMovieProxCardMovieView
+ (Class)layerClass;
- (AVPlayer)player;
- (FMDMovieProxCardMovieView)initWithMovieURL:(id)a3 adjustmentsURL:(id)a4;
- (NSURL)adjustmentsURL;
- (void)setPlayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAdjustments;
@end

@implementation FMDMovieProxCardMovieView

- (FMDMovieProxCardMovieView)initWithMovieURL:(id)a3 adjustmentsURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FMDMovieProxCardMovieView;
  v8 = -[FMDMovieProxCardMovieView initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adjustmentsURL, a4);
    uint64_t v10 = +[AVPlayer playerWithURL:v6];
    player = v9->_player;
    v9->_player = (AVPlayer *)v10;

    [(AVPlayer *)v9->_player setActionAtItemEnd:2];
    v12 = v9->_player;
    v13 = [(FMDMovieProxCardMovieView *)v9 layer];
    [v13 setPlayer:v12];

    [(FMDMovieProxCardMovieView *)v9 updateAdjustments];
  }

  return v9;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  v5 = +[UITraitCollection currentTraitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    [(FMDMovieProxCardMovieView *)self updateAdjustments];
  }
}

- (void)updateAdjustments
{
  v3 = +[UITraitCollection currentTraitCollection];
  [v3 userInterfaceStyle];

  id v6 = [(FMDMovieProxCardMovieView *)self adjustmentsURL];
  id v4 = SFAdjustmentFiltersForAssetTypeAndURL();
  v5 = [(FMDMovieProxCardMovieView *)self layer];
  [v5 setFilters:v4];
}

- (NSURL)adjustmentsURL
{
  return self->_adjustmentsURL;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_adjustmentsURL, 0);
}

@end