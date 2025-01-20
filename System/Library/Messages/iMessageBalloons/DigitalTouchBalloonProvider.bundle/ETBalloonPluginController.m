@interface ETBalloonPluginController
- (BOOL)_canComposeAfterMediaPlayback;
- (BOOL)_shouldShowCancelButton;
- (BOOL)_shouldShowPlaceholderView;
- (BOOL)_shouldShowSkipButton;
- (BOOL)canShowReplayButton;
- (BOOL)isInteractive;
- (BOOL)wantsEdgeToEdgeLayout;
- (BOOL)wantsOutline;
- (BOOL)wantsTranscriptGroupMonograms;
- (BOOL)wantsTranscriptTimestampDrawer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTranscriptPluginView)pluginContentView;
- (ETBalloonPluginController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4;
- (double)_cornerButtonInset;
- (double)_nonAnimatedMessagePlaybackDuration;
- (double)_rightButtonInset;
- (id)_attachmentPlaceholderImage;
- (id)_placeholderImageURL;
- (id)updateSnapshot;
- (void)_applicationWillResignActive;
- (void)_setShowingPlaceholderView:(BOOL)a3;
- (void)didEndSessionPlayback;
- (void)loadView;
- (void)setDataSource:(id)a3;
- (void)setUpdateSnapshot:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginSessionPlayback;
- (void)willEndSessionPlaybackInterrupted:(BOOL)a3;
@end

@implementation ETBalloonPluginController

- (ETBalloonPluginController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ETBalloonPluginController;
  v6 = [(ETBalloonPluginController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(ETBalloonPluginController *)v6 setComposeDisabled:1];
    [(ETBalloonPluginController *)v7 setAutoPlayOnAppearanceDisabled:1];
    [(ETBalloonPluginController *)v7 setOverrideAudioDefaultToOff:1];
    [(ETBalloonPluginController *)v7 setDataSource:v5];
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  v4 = objc_alloc_init(ETTranscriptPluginView);
  [(ETTranscriptPluginView *)v4 setAutoresizingMask:18];
  v3 = [(ETBalloonPluginController *)self _audioToggleButton];
  [(ETTranscriptPluginView *)v4 trackInteractiveSubview:v3];

  [(ETBalloonPluginController *)self setView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v11 viewWillAppear:a3];
  v4 = [(ETBalloonPluginController *)self dataSource];
  id v5 = [v4 mediaURL];
  if (v5 || ![v4 isLast]) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = [v4 isFromMe];
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_13294;
  v10[3] = &unk_24858;
  v10[4] = self;
  v7 = objc_retainBlock(v10);
  v8 = v7;
  if (v6)
  {
    dispatch_time_t v9 = dispatch_time(0, 500000000);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v6 viewDidDisappear:a3];
  v4 = [(ETBalloonPluginController *)self dataSource];
  -[ETBalloonPluginController _setShowingPlaceholderView:](self, "_setShowingPlaceholderView:", [v4 isPlayed] ^ 1);

  [(UIView *)self->_playedSnapshotView removeFromSuperview];
  playedSnapshotView = self->_playedSnapshotView;
  self->_playedSnapshotView = 0;
}

- (BOOL)_shouldShowPlaceholderView
{
  v3 = [(ETBalloonPluginController *)self dataSource];
  BOOL v4 = ([v3 isPlayed] & 1) == 0
    && ([(ETBalloonPluginController *)self isPlayingMessages] & 1) == 0
    && self->_playedSnapshotView == 0;

  return v4;
}

- (void)_setShowingPlaceholderView:(BOOL)a3
{
  unplayedPlaceholderView = self->_unplayedPlaceholderView;
  if ((((unplayedPlaceholderView == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      id v5 = objc_alloc_init(BalloonPlaceholderView);
      objc_super v6 = self->_unplayedPlaceholderView;
      self->_unplayedPlaceholderView = v5;

      v7 = self->_unplayedPlaceholderView;
      v8 = [(ETBalloonPluginController *)self _attachmentPlaceholderImage];
      [(BalloonPlaceholderView *)v7 setBackgroundImage:v8];

      dispatch_time_t v9 = self->_unplayedPlaceholderView;
      objc_super v10 = [(ETBalloonPluginController *)self canvasView];
      [v10 bounds];
      -[BalloonPlaceholderView setFrame:](v9, "setFrame:");

      v12 = [(ETBalloonPluginController *)self view];
      [(BalloonPlaceholderView *)v12 addSubview:self->_unplayedPlaceholderView];
      objc_super v11 = v12;
    }
    else
    {
      [(BalloonPlaceholderView *)unplayedPlaceholderView removeFromSuperview];
      objc_super v11 = self->_unplayedPlaceholderView;
      self->_unplayedPlaceholderView = 0;
    }
  }
}

- (double)_rightButtonInset
{
  v2 = [(ETBalloonPluginController *)self dataSource];
  if ([v2 isFromMe]) {
    double v3 = 13.0;
  }
  else {
    double v3 = 7.0;
  }

  return v3;
}

- (double)_cornerButtonInset
{
  return 7.0;
}

- (id)_attachmentPlaceholderImage
{
  v2 = [(ETBalloonPluginController *)self _placeholderImageURL];
  double v3 = v2;
  if (!v2) {
    goto LABEL_6;
  }
  BOOL v4 = [v2 pathExtension];
  unsigned int v5 = [v4 isEqualToString:@"cpbitmap"];

  if (v5)
  {
    objc_super v6 = +[CKMultiFrameImage firstFrameImageWithContentsOfCPBitmapURL:v3 error:0];
    goto LABEL_7;
  }
  id v7 = [objc_alloc((Class)NSData) initWithContentsOfURL:v3 options:1 error:0];
  if (v7)
  {
    v8 = v7;
    objc_super v6 = +[UIImage ckImageWithData:v7];
  }
  else
  {
LABEL_6:
    objc_super v6 = 0;
  }
LABEL_7:

  return v6;
}

- (id)_placeholderImageURL
{
  v2 = [(ETBalloonPluginController *)self dataSource];
  double v3 = [v2 mediaURL];

  if (v3)
  {
    BOOL v4 = IMPreviewExtension();
    unsigned int v5 = IMAttachmentPreviewFileURL();
    objc_super v6 = +[NSFileManager defaultManager];
    id v7 = [v5 path];
    unsigned int v8 = [v6 fileExistsAtPath:v7];

    if (v8) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v5 viewDidLayoutSubviews];
  unplayedPlaceholderView = self->_unplayedPlaceholderView;
  BOOL v4 = [(ETBalloonPluginController *)self canvasView];
  [v4 frame];
  -[BalloonPlaceholderView setFrame:](unplayedPlaceholderView, "setFrame:");
}

- (CKTranscriptPluginView)pluginContentView
{
  [(ETBalloonPluginController *)self loadViewIfNeeded];

  return (CKTranscriptPluginView *)[(ETBalloonPluginController *)self view];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = [(ETBalloonPluginController *)self dataSource];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setDataSource:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v6 setDataSource:a3];
  [(ETBalloonPluginController *)self setAutoPlayOnAppearanceDisabled:1];
  BOOL v4 = [(BalloonPlaceholderView *)self->_unplayedPlaceholderView superview];

  if (!v4)
  {
    objc_super v5 = [(ETBalloonPluginController *)self view];
    [(BalloonPlaceholderView *)self->_unplayedPlaceholderView setAlpha:1.0];
    [v5 addSubview:self->_unplayedPlaceholderView];
  }
}

- (void)_applicationWillResignActive
{
  v4.receiver = self;
  v4.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v4 _applicationWillResignActive];
  double v3 = [(ETBalloonPluginController *)self canvasView];
  [v3 setAlwaysPaused:1];

  [(ETBalloonPluginController *)self setPlaybackEnabled:0];
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)wantsTranscriptTimestampDrawer
{
  return 1;
}

- (BOOL)wantsTranscriptGroupMonograms
{
  return 1;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 0;
}

- (BOOL)_shouldShowCancelButton
{
  return 0;
}

- (BOOL)_shouldShowSkipButton
{
  return 0;
}

- (double)_nonAnimatedMessagePlaybackDuration
{
  return 1.0;
}

- (BOOL)wantsOutline
{
  return 0;
}

- (BOOL)canShowReplayButton
{
  return 0;
}

- (void)willBeginSessionPlayback
{
  v7.receiver = self;
  v7.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v7 willBeginSessionPlayback];
  double v3 = [(BalloonPlaceholderView *)self->_unplayedPlaceholderView backgroundImage];

  if (v3) {
    int64_t v4 = 100000000;
  }
  else {
    int64_t v4 = 0;
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_139FC;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willEndSessionPlaybackInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ETBalloonPluginController;
  -[ETBalloonPluginController willEndSessionPlaybackInterrupted:](&v27, "willEndSessionPlaybackInterrupted:");
  if (v3)
  {
    [(ETBalloonPluginController *)self _setShowingPlaceholderView:1];
  }
  else
  {
    dispatch_time_t v5 = [(ETBalloonPluginController *)self dataSource];
    [v5 markAsPlayed];

    objc_super v6 = [(ETBalloonPluginController *)self updateSnapshot];
    if (v6)
    {
      [(ETBalloonPluginController *)self view];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_13CBC;
      v24[3] = &unk_24C68;
      v24[4] = self;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = v7;
      id v26 = v6;
      double v8 = objc_retainBlock(v24);
      double v9 = [v7 snapshotViewAfterScreenUpdates:0];
      playedSnapshotView = self->_playedSnapshotView;
      self->_playedSnapshotView = v9;

      [v7 addSubview:self->_playedSnapshotView];
      double v11 = [(ETBalloonPluginController *)self _playingParentMessage];
      if ([v11 messageType] == 8 && objc_msgSend(v11, "mediaType") == (char *)&dword_0 + 1)
      {
        id v12 = v11;
        v13 = [v12 introMessage];
        if (v13)
        {
          BOOL v14 = 1;
        }
        else
        {
          v15 = [v12 playingMessages];
          BOOL v14 = [v15 count] != 0;
        }
        objc_initWeak(&location, self);
        v16 = dispatch_get_global_queue(2, 0);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_13FD8;
        v18[3] = &unk_24CB8;
        id v19 = v12;
        BOOL v22 = v14;
        v20 = v8;
        id v17 = v12;
        objc_copyWeak(&v21, &location);
        dispatch_async(v16, v18);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        ((void (*)(void *, void))v8[2])(v8, 0);
      }
    }
  }
}

- (void)didEndSessionPlayback
{
  v5.receiver = self;
  v5.super_class = (Class)ETBalloonPluginController;
  [(ETBalloonPluginController *)&v5 didEndSessionPlayback];
  uint64_t v3 = [(ETBalloonPluginController *)self balloonPlaybackCompletion];
  int64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  [(ETBalloonPluginController *)self setBalloonPlaybackCompletion:0];
  [(ETBalloonPluginController *)self setAutoPlayOnAppearanceDisabled:1];
}

- (BOOL)_canComposeAfterMediaPlayback
{
  return 0;
}

- (id)updateSnapshot
{
  return self->_updateSnapshot;
}

- (void)setUpdateSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateSnapshot, 0);
  objc_storeStrong((id *)&self->_playedSnapshotView, 0);

  objc_storeStrong((id *)&self->_unplayedPlaceholderView, 0);
}

@end