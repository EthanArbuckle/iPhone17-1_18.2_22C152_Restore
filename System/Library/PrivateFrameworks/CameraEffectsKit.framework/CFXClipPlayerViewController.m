@interface CFXClipPlayerViewController
- (CFXClip)clip;
- (CFXClipCompositionDataSource)clipDataSource;
- (JFXAVPlayerViewer)avPlayerView;
- (UIView)placeholderContainerView;
- (UIView)playerContainerView;
- (void)displayCompositionUpdateLoadingView:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)reloadClip;
- (void)reloadClipAndSeekToStart:(BOOL)a3;
- (void)setAvPlayerView:(id)a3;
- (void)setClip:(id)a3;
- (void)setClipDataSource:(id)a3;
- (void)setPlaceholderContainerView:(id)a3;
- (void)setPlayerContainerView:(id)a3;
- (void)updateCompositionForEffectChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CFXClipPlayerViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CFXClipPlayerViewController *)self clip];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(CFXClipPlayerViewController *)self clipDataSource];
    v8 = [v7 clip];
    v9 = [(CFXClipPlayerViewController *)self clip];

    if (v8 != v9) {
      [(CFXClipPlayerViewController *)self reloadClip];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CFXClipPlayerViewController;
  [(CFXClipPlayerViewController *)&v10 viewWillAppear:v3];
}

- (void)reloadClipAndSeekToStart:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CFXClipPlayerViewController *)self clipDataSource];

  v6 = [(CFXClipPlayerViewController *)self clip];
  v7 = v6;
  if (v5)
  {
    v8 = [(CFXClipPlayerViewController *)self clipDataSource];
    [v8 setClip:v7];

    [(JFXCompositionPlayerViewController *)self setNeedsCompositionUpdate];
    if (v3)
    {
      [(JFXCompositionPlayerViewController *)self seekToTime:0];
    }
  }
  else
  {

    if (v7)
    {
      v9 = [CFXClipCompositionDataSource alloc];
      objc_super v10 = [(CFXClipPlayerViewController *)self clip];
      v11 = [(CFXClipCompositionDataSource *)v9 initWithClip:v10];
      [(CFXClipPlayerViewController *)self setClipDataSource:v11];

      id v12 = [(CFXClipPlayerViewController *)self clipDataSource];
      [(JFXCompositionPlayerViewController *)self setClipsDataSource:v12];
    }
  }
}

- (void)reloadClip
{
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
  if (a3)
  {
    [(CFXClipPlayerViewController *)self reloadClip];
  }
  else
  {
    uint64_t v5 = [(CFXClipPlayerViewController *)self clipDataSource];
    [v5 setClip:0];

    [(CFXClipPlayerViewController *)self setClipDataSource:0];
    [(JFXCompositionPlayerViewController *)self setClipsDataSource:0];
  }
}

- (void)updateCompositionForEffectChange
{
  id v3 = [(CFXClipPlayerViewController *)self clip];
  [(JFXCompositionPlayerViewController *)self setNeedsCompositionUpdateForClip:v3];
}

- (void)displayCompositionUpdateLoadingView:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self placeHolderView];
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = (void *)v4;
  v6 = [(JFXCompositionPlayerViewController *)self placeHolderView];
  v7 = [v6 superview];

  if (!v7)
  {
LABEL_10:
    v8 = [(CFXClipPlayerViewController *)self placeholderContainerView];

    if (v8)
    {
      [v20 removeFromSuperview];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:1];
      [(JFXCompositionPlayerViewController *)self setPlaceHolderView:v20];
      v9 = [(CFXClipPlayerViewController *)self playerContainerView];
      [v9 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [(JFXCompositionPlayerViewController *)self placeHolderView];
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

      v19 = [(JFXCompositionPlayerViewController *)self placeHolderView];
      [v19 setAutoresizingMask:18];
    }
  }
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v10 = a3;
  uint64_t v5 = [v10 identifier];
  int v6 = [v5 isEqualToString:@"clipPlayer_embedAVPlayerViewer"];

  if (v6)
  {
    v7 = [v10 destinationViewController];
    int v8 = [v7 conformsToProtocol:&unk_26E834F08];

    if (v8)
    {
      v9 = [v10 destinationViewController];
      [(CFXClipPlayerViewController *)self setAvPlayerView:v9];
    }
  }
}

- (CFXClip)clip
{
  return self->_clip;
}

- (UIView)playerContainerView
{
  return self->_playerContainerView;
}

- (void)setPlayerContainerView:(id)a3
{
}

- (UIView)placeholderContainerView
{
  return self->_placeholderContainerView;
}

- (void)setPlaceholderContainerView:(id)a3
{
}

- (JFXAVPlayerViewer)avPlayerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayerView);
  return (JFXAVPlayerViewer *)WeakRetained;
}

- (void)setAvPlayerView:(id)a3
{
}

- (CFXClipCompositionDataSource)clipDataSource
{
  return self->_clipDataSource;
}

- (void)setClipDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipDataSource, 0);
  objc_destroyWeak((id *)&self->_avPlayerView);
  objc_storeStrong((id *)&self->_placeholderContainerView, 0);
  objc_storeStrong((id *)&self->_playerContainerView, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

@end