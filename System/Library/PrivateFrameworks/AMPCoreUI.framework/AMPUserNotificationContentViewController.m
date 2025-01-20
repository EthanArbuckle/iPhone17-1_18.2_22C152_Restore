@interface AMPUserNotificationContentViewController
- (AMPUserNotificationContentDelegate)delegate;
- (AMPUserNotificationContentViewController)initWithNotification:(id)a3 delegate:(id)a4;
- (AMSMetrics)metrics;
- (AMSUserNotification)userNotification;
- (AVPlayerViewController)videoPlayerController;
- (BOOL)hasAppeared;
- (BOOL)hasPlayedVideo;
- (CGSize)expectedContentSize;
- (NSString)audioSessionCategory;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (UILabel)titleLabel;
- (unint64_t)audioSessionCategoryOptions;
- (void)imageViewTapped:(id)a3;
- (void)loadView;
- (void)mediaPause;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAudioSessionCategory:(id)a3;
- (void)setAudioSessionCategoryOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setHasPlayedVideo:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMPUserNotificationContentViewController

- (AMPUserNotificationContentViewController)initWithNotification:(id)a3 delegate:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v63.receiver = self;
  v63.super_class = (Class)AMPUserNotificationContentViewController;
  v9 = [(AMPUserNotificationContentViewController *)&v63 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_userNotification, a3);
    v11 = (void *)MEMORY[0x263F27B40];
    v12 = [MEMORY[0x263F27D40] bagKeySet];
    v13 = [MEMORY[0x263F27D40] bagSubProfile];
    v14 = [MEMORY[0x263F27D40] bagSubProfileVersion];
    [v11 registerBagKeySet:v12 forProfile:v13 profileVersion:v14];

    v15 = (void *)MEMORY[0x263F27B28];
    v16 = [MEMORY[0x263F27D40] bagSubProfile];
    v17 = [MEMORY[0x263F27D40] bagSubProfileVersion];
    v18 = [v15 bagForProfile:v16 profileVersion:v17];

    uint64_t v19 = [objc_alloc(MEMORY[0x263F27D40]) initWithContainerID:@"com.apple.AppleMediaServices" bag:v18];
    metrics = v10->_metrics;
    v10->_metrics = (AMSMetrics *)v19;

    v21 = [v7 artworkUrl];

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x263F1C6D0]);
      uint64_t v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      imageView = v10->_imageView;
      v10->_imageView = (UIImageView *)v23;

      v25 = dispatch_get_global_queue(2, 0);
      uint64_t v57 = MEMORY[0x263EF8330];
      uint64_t v58 = 3221225472;
      v59 = __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke;
      v60 = &unk_264E7C7A0;
      id v61 = v7;
      v62 = v10;
      dispatch_async(v25, &v57);
    }
    v26 = objc_msgSend(v7, "videoUrl", v57, v58, v59, v60);

    if (v26)
    {
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2050000000;
      v27 = (void *)getAVPlayerItemClass_softClass;
      uint64_t v67 = getAVPlayerItemClass_softClass;
      if (!getAVPlayerItemClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAVPlayerItemClass_block_invoke;
        v69 = &unk_264E7C700;
        v70 = &v64;
        __getAVPlayerItemClass_block_invoke((uint64_t)buf);
        v27 = (void *)v65[3];
      }
      id v28 = v27;
      _Block_object_dispose(&v64, 8);
      v29 = [v7 videoUrl];
      v30 = [v28 playerItemWithURL:v29];

      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2050000000;
      v31 = (void *)getAVPlayerViewControllerClass_softClass;
      uint64_t v67 = getAVPlayerViewControllerClass_softClass;
      if (!getAVPlayerViewControllerClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAVPlayerViewControllerClass_block_invoke;
        v69 = &unk_264E7C700;
        v70 = &v64;
        __getAVPlayerViewControllerClass_block_invoke((uint64_t)buf);
        v31 = (void *)v65[3];
      }
      v32 = v31;
      _Block_object_dispose(&v64, 8);
      v33 = (AVPlayerViewController *)objc_alloc_init(v32);
      videoPlayerController = v10->_videoPlayerController;
      v10->_videoPlayerController = v33;

      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2050000000;
      v35 = (void *)getAVPlayerClass_softClass;
      uint64_t v67 = getAVPlayerClass_softClass;
      if (!getAVPlayerClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAVPlayerClass_block_invoke;
        v69 = &unk_264E7C700;
        v70 = &v64;
        __getAVPlayerClass_block_invoke((uint64_t)buf);
        v35 = (void *)v65[3];
      }
      id v36 = v35;
      _Block_object_dispose(&v64, 8);
      v37 = [v36 playerWithPlayerItem:v30];
      [(AVPlayerViewController *)v10->_videoPlayerController setPlayer:v37];

      v38 = [(AVPlayerViewController *)v10->_videoPlayerController player];
      [v38 addObserver:v10 forKeyPath:@"status" options:1 context:0];

      v39 = [(AVPlayerViewController *)v10->_videoPlayerController player];
      [v39 addObserver:v10 forKeyPath:@"timeControlStatus" options:1 context:0];

      v40 = [(AVPlayerViewController *)v10->_videoPlayerController player];
      [v40 replaceCurrentItemWithPlayerItem:v30];

      [(AVPlayerViewController *)v10->_videoPlayerController setUpdatesNowPlayingInfoCenter:0];
      v41 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v41)
      {
        v41 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v42 = [v41 OSLogObject];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = objc_opt_class();
        id v44 = v43;
        v45 = [v7 logKey];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v45;
        _os_log_impl(&dword_23CA6F000, v42, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Loading rich notification video", buf, 0x16u);
      }
    }
    v46 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v46;

    [(UILabel *)v10->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_titleLabel setNumberOfLines:0];
    [(UILabel *)v10->_titleLabel setTextAlignment:4];
    [(UILabel *)v10->_titleLabel setLineBreakMode:0];
    v48 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    [(UILabel *)v10->_titleLabel setFont:v48];

    v49 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v10->_titleLabel setBackgroundColor:v49];

    v50 = [v7 title];
    [(UILabel *)v10->_titleLabel setText:v50];

    v51 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    textLabel = v10->_textLabel;
    v10->_textLabel = v51;

    [(UILabel *)v10->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_textLabel setNumberOfLines:0];
    [(UILabel *)v10->_textLabel setTextAlignment:4];
    [(UILabel *)v10->_textLabel setLineBreakMode:0];
    v53 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [(UILabel *)v10->_textLabel setFont:v53];

    v54 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v10->_textLabel setBackgroundColor:v54];

    v55 = [v7 informativeText];
    [(UILabel *)v10->_textLabel setText:v55];
  }
  return v10;
}

void __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artworkUrl];
  int v3 = [v2 startAccessingSecurityScopedResource];

  v4 = (void *)MEMORY[0x263EFF8F8];
  v5 = [*(id *)(a1 + 32) artworkUrl];
  v6 = [v4 dataWithContentsOfURL:v5];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) artworkUrl];
    [v7 stopAccessingSecurityScopedResource];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2;
  block[3] = &unk_264E7C778;
  id v10 = v6;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  v5 = objc_msgSend(v2, "imageWithData:scale:", v3);

  if (v5)
  {
    [*(id *)(*(void *)(a1 + 40) + 1016) setImage:v5];
    [*(id *)(*(void *)(a1 + 40) + 1016) setClipsToBounds:1];
    [*(id *)(*(void *)(a1 + 40) + 1016) setContentMode:2];
    [*(id *)(a1 + 40) expectedContentSize];
    objc_msgSend(*(id *)(a1 + 40), "setPreferredContentSize:");
  }
  else
  {
    v6 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v6)
    {
      v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      v9 = *(void **)(a1 + 48);
      id v10 = v8;
      id v11 = [v9 logKey];
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_23CA6F000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to find artwork at url", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)loadView
{
  v23.receiver = self;
  v23.super_class = (Class)AMPUserNotificationContentViewController;
  [(AMPUserNotificationContentViewController *)&v23 loadView];
  uint64_t v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [(AMPUserNotificationContentViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(AMPUserNotificationContentViewController *)self view];
  v6 = [(AMPUserNotificationContentViewController *)self titleLabel];
  [v5 addSubview:v6];

  id v7 = [(AMPUserNotificationContentViewController *)self view];
  id v8 = [(AMPUserNotificationContentViewController *)self textLabel];
  [v7 addSubview:v8];

  v9 = [(AMPUserNotificationContentViewController *)self videoPlayerController];

  if (v9)
  {
    id v10 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    [(AMPUserNotificationContentViewController *)self addChildViewController:v10];

    id v11 = [(AMPUserNotificationContentViewController *)self view];
    int v12 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    v13 = [v12 view];
    [v11 addSubview:v13];

    __int16 v14 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    [v14 didMoveToParentViewController:self];

    v15 = [(AMPUserNotificationContentViewController *)self imageView];

    if (!v15) {
      return;
    }
    uint64_t v16 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    v17 = [v16 contentOverlayView];
    v18 = [(AMPUserNotificationContentViewController *)self imageView];
    [v17 addSubview:v18];
  }
  else
  {
    uint64_t v19 = [(AMPUserNotificationContentViewController *)self imageView];

    if (!v19) {
      return;
    }
    v20 = [(AMPUserNotificationContentViewController *)self view];
    v21 = [(AMPUserNotificationContentViewController *)self imageView];
    [v20 addSubview:v21];

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_imageViewTapped_];
    id v22 = [(AMPUserNotificationContentViewController *)self imageView];
    [v22 addGestureRecognizer:v16];

    v17 = [(AMPUserNotificationContentViewController *)self imageView];
    [v17 setUserInteractionEnabled:1];
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)AMPUserNotificationContentViewController;
  -[AMPUserNotificationContentViewController setPreferredContentSize:](&v7, sel_setPreferredContentSize_);
  v6 = [(AMPUserNotificationContentViewController *)self delegate];
  objc_msgSend(v6, "viewController:didUpdatePreferredContentSize:", self, width, height);
}

- (CGSize)expectedContentSize
{
  uint64_t v3 = [(AMPUserNotificationContentViewController *)self view];
  [v3 frame];
  double v5 = v4;

  v6 = [(AMPUserNotificationContentViewController *)self titleLabel];
  objc_msgSend(v6, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v8 = v7;

  v9 = [(AMPUserNotificationContentViewController *)self textLabel];
  objc_msgSend(v9, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v11 = v10;

  int v12 = [(AMPUserNotificationContentViewController *)self imageView];
  v13 = [v12 image];

  double v14 = 0.0;
  double v15 = 0.0;
  if (v13)
  {
    uint64_t v16 = [(AMPUserNotificationContentViewController *)self imageView];
    v17 = [v16 image];
    [v17 size];
    double v19 = v18;
    v20 = [(AMPUserNotificationContentViewController *)self imageView];
    v21 = [v20 image];
    [v21 size];
    double v23 = v19 / v22;

    double v15 = v5 * v23;
  }
  v24 = [(AMPUserNotificationContentViewController *)self videoPlayerController];

  if (v24)
  {
    v25 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    [v25 videoBounds];
    double v27 = v26;
    double v29 = v28;

    if (v27 <= 0.0)
    {
      double v14 = v5 * 9.0 * 0.0625;
      double v15 = 0.0;
    }
    else
    {
      double v15 = 0.0;
      double v14 = v5 * v29 / v27;
    }
  }
  double v30 = v11 + v8 + v15 + v14 + 16.0 + 16.0;
  double v31 = v5;
  result.double height = v30;
  result.double width = v31;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMPUserNotificationContentViewController;
  [(AMPUserNotificationContentViewController *)&v8 viewWillAppear:a3];
  if (![(AMPUserNotificationContentViewController *)self hasAppeared])
  {
    double v4 = (void *)MEMORY[0x263F27F18];
    double v5 = [(AMPUserNotificationContentViewController *)self userNotification];
    v6 = [v4 eventForContentEngagementWithNotification:v5];

    double v7 = [(AMPUserNotificationContentViewController *)self metrics];
    [v7 enqueueEvent:v6];
  }
  [(AMPUserNotificationContentViewController *)self setHasAppeared:1];
}

- (void)viewWillLayoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)AMPUserNotificationContentViewController;
  [(AMPUserNotificationContentViewController *)&v53 viewWillLayoutSubviews];
  uint64_t v3 = [(AMPUserNotificationContentViewController *)self view];
  [v3 frame];
  double v5 = v4;

  double v6 = v5 + -32.0;
  double v7 = [(AMPUserNotificationContentViewController *)self titleLabel];
  objc_msgSend(v7, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v9 = v8;

  double v10 = [(AMPUserNotificationContentViewController *)self textLabel];
  objc_msgSend(v10, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v12 = v11;

  v13 = [(AMPUserNotificationContentViewController *)self videoPlayerController];

  if (v13)
  {
    double v14 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    [v14 videoBounds];
    double v16 = v15;
    double v18 = v17;

    if (v16 <= 0.0) {
      double v19 = v5 * 9.0 * 0.0625;
    }
    else {
      double v19 = v5 * v18 / v16;
    }
    double v31 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    v32 = [v31 view];
    objc_msgSend(v32, "setFrame:", 0.0, 0.0, v5, v19);

    v33 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
    v34 = [v33 view];
    [v34 frame];
    double v35 = CGRectGetMaxY(v54) + 16.0;

    id v36 = [(AMPUserNotificationContentViewController *)self imageView];

    if (v36)
    {
      v37 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
      v38 = [v37 view];
      [v38 bounds];
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      v47 = [(AMPUserNotificationContentViewController *)self imageView];
      objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

LABEL_13:
    }
  }
  else
  {
    v20 = [(AMPUserNotificationContentViewController *)self imageView];

    if (v20)
    {
      v21 = [(AMPUserNotificationContentViewController *)self imageView];
      double v22 = [v21 image];
      if (v22)
      {
        double v23 = [(AMPUserNotificationContentViewController *)self imageView];
        v24 = [v23 image];
        [v24 size];
        double v26 = v25;
        double v27 = [(AMPUserNotificationContentViewController *)self imageView];
        double v28 = [v27 image];
        [v28 size];
        double v30 = v26 / v29;
      }
      else
      {
        double v30 = 0.0;
      }

      v48 = [(AMPUserNotificationContentViewController *)self imageView];
      objc_msgSend(v48, "setFrame:", 0.0, 0.0, v5, v5 * v30);

      v37 = [(AMPUserNotificationContentViewController *)self imageView];
      [v37 frame];
      double v35 = CGRectGetMaxY(v55) + 16.0;
      goto LABEL_13;
    }
    double v35 = 16.0;
  }
  v49 = [(AMPUserNotificationContentViewController *)self titleLabel];
  objc_msgSend(v49, "setFrame:", 16.0, v35, v6, v9);

  v50 = [(AMPUserNotificationContentViewController *)self titleLabel];
  [v50 frame];
  double MaxY = CGRectGetMaxY(v56);
  v52 = [(AMPUserNotificationContentViewController *)self textLabel];
  objc_msgSend(v52, "setFrame:", 16.0, MaxY, v6, v12);

  [(AMPUserNotificationContentViewController *)self expectedContentSize];
  -[AMPUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)imageViewTapped:(id)a3
{
  id v3 = [(AMPUserNotificationContentViewController *)self delegate];
  [v3 openNotification];
}

- (void)mediaPause
{
  id v3 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
  double v4 = [v3 player];
  [v4 pause];

  id v6 = [getAVAudioSessionClass() sharedInstance];
  double v5 = [(AMPUserNotificationContentViewController *)self audioSessionCategory];
  objc_msgSend(v6, "setCategory:withOptions:error:", v5, -[AMPUserNotificationContentViewController audioSessionCategoryOptions](self, "audioSessionCategoryOptions"), 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
  id v13 = [v12 player];

  if (v13 == v10)
  {
    if ([v9 isEqualToString:@"status"])
    {
      double v14 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
      double v15 = [v14 player];
      uint64_t v16 = [v15 status];

      if (v16 == 1)
      {
        double v17 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
        double v18 = [v17 player];
        [v18 setMuted:0];

        double v19 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
        [v19 setAllowsEnteringFullScreen:0];

        v20 = [getAVAudioSessionClass() sharedInstance];
        v21 = [v20 category];
        [(AMPUserNotificationContentViewController *)self setAudioSessionCategory:v21];

        double v22 = [getAVAudioSessionClass() sharedInstance];
        -[AMPUserNotificationContentViewController setAudioSessionCategoryOptions:](self, "setAudioSessionCategoryOptions:", [v22 categoryOptions]);

        double v23 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
        v24 = [v23 player];
        [v24 setAllowsExternalPlayback:0];

        [(AMPUserNotificationContentViewController *)self expectedContentSize];
        -[AMPUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
        double v25 = [MEMORY[0x263F27CB8] sharedConfig];
        if (!v25)
        {
          double v25 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        double v26 = [v25 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          double v27 = objc_opt_class();
          id v28 = v27;
          double v29 = [(AMPUserNotificationContentViewController *)self userNotification];
          double v30 = [v29 logKey];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          _os_log_impl(&dword_23CA6F000, v26, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Ready to play rich notification video", buf, 0x16u);
        }
      }
      double v31 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
      v32 = [v31 player];
      BOOL v33 = [v32 status] == 2;

      if (v33)
      {
        v34 = [MEMORY[0x263F27CB8] sharedConfig];
        if (!v34)
        {
          v34 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        double v35 = [v34 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = objc_opt_class();
          id v37 = v36;
          v38 = [(AMPUserNotificationContentViewController *)self userNotification];
          double v39 = [v38 logKey];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          _os_log_impl(&dword_23CA6F000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load video at url", buf, 0x16u);
        }
      }
    }
    if ([v9 isEqualToString:@"timeControlStatus"])
    {
      double v40 = [(AMPUserNotificationContentViewController *)self videoPlayerController];
      double v41 = [v40 player];
      BOOL v42 = [v41 timeControlStatus] == 2;

      if (v42)
      {
        double v43 = [(AMPUserNotificationContentViewController *)self imageView];
        [v43 removeFromSuperview];

        double v44 = [getAVAudioSessionClass() sharedInstance];
        uint64_t v52 = 0;
        objc_super v53 = &v52;
        uint64_t v54 = 0x2020000000;
        double v45 = (void *)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
        uint64_t v55 = getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
        if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getAVAudioSessionCategoryPlaybackSymbolLoc_block_invoke;
          uint64_t v57 = &unk_264E7C700;
          uint64_t v58 = &v52;
          double v46 = (void *)AVFoundationLibrary();
          v47 = dlsym(v46, "AVAudioSessionCategoryPlayback");
          *(void *)(v58[1] + 24) = v47;
          getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = *(void *)(v58[1] + 24);
          double v45 = (void *)v53[3];
        }
        _Block_object_dispose(&v52, 8);
        if (!v45) {
          -[AMPUserNotificationContentViewController observeValueForKeyPath:ofObject:change:context:]();
        }
        objc_msgSend(v44, "setCategory:withOptions:error:", *v45, 1, 0, v52);

        if (![(AMPUserNotificationContentViewController *)self hasPlayedVideo])
        {
          v48 = (void *)MEMORY[0x263F27F18];
          v49 = [(AMPUserNotificationContentViewController *)self userNotification];
          v50 = [v48 eventForVideoPlaybackForNotification:v49];

          v51 = [(AMPUserNotificationContentViewController *)self metrics];
          [v51 enqueueEvent:v50];
        }
        [(AMPUserNotificationContentViewController *)self setHasPlayedVideo:1];
      }
    }
  }
}

- (AMSUserNotification)userNotification
{
  return self->_userNotification;
}

- (AMPUserNotificationContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMPUserNotificationContentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (void)setAudioSessionCategory:(id)a3
{
}

- (unint64_t)audioSessionCategoryOptions
{
  return self->_audioSessionCategoryOptions;
}

- (void)setAudioSessionCategoryOptions:(unint64_t)a3
{
  self->_audioSessionCategoryOptions = a3;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)hasPlayedVideo
{
  return self->_hasPlayedVideo;
}

- (void)setHasPlayedVideo:(BOOL)a3
{
  self->_hasPlayedVideo = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (AVPlayerViewController)videoPlayerController
{
  return self->_videoPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerController, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
}

@end