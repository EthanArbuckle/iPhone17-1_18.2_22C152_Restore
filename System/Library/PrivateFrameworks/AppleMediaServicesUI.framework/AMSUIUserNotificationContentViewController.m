@interface AMSUIUserNotificationContentViewController
- (AMSMetrics)metrics;
- (AMSUIUserNotificationContentDelegate)delegate;
- (AMSUIUserNotificationContentViewController)initWithNotification:(id)a3 delegate:(id)a4;
- (AMSUserNotification)userNotification;
- (AVPlayerViewController)videoPlayerController;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasAppeared;
- (BOOL)hasPlayedVideo;
- (CGSize)expectedContentSize;
- (NSString)audioSessionCategory;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)textLabel;
- (UILabel)titleLabel;
- (unint64_t)audioSessionCategoryOptions;
- (void)_setupAccessibility;
- (void)dealloc;
- (void)loadView;
- (void)mediaPause;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAudioSessionCategory:(id)a3;
- (void)setAudioSessionCategoryOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setHasPlayedVideo:(BOOL)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewTapped:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIUserNotificationContentViewController

- (AMSUIUserNotificationContentViewController)initWithNotification:(id)a3 delegate:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v69.receiver = self;
  v69.super_class = (Class)AMSUIUserNotificationContentViewController;
  v9 = [(AMSUIUserNotificationContentViewController *)&v69 initWithNibName:0 bundle:0];
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

    uint64_t v19 = [MEMORY[0x263F27D40] internalInstanceUsingBag:v18];
    metrics = v10->_metrics;
    v10->_metrics = (AMSMetrics *)v19;

    v21 = [v7 artworkUrl];

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x263F82828]);
      uint64_t v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      imageView = v10->_imageView;
      v10->_imageView = (UIImageView *)v23;

      v25 = dispatch_get_global_queue(2, 0);
      uint64_t v63 = MEMORY[0x263EF8330];
      uint64_t v64 = 3221225472;
      v65 = __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke;
      v66 = &unk_2643E34D0;
      id v67 = v7;
      v68 = v10;
      dispatch_async(v25, &v63);
    }
    v26 = objc_msgSend(v7, "videoUrl", v63, v64, v65, v66);

    if (v26)
    {
      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2050000000;
      v27 = (void *)getAVPlayerItemClass_softClass;
      uint64_t v73 = getAVPlayerItemClass_softClass;
      if (!getAVPlayerItemClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAVPlayerItemClass_block_invoke;
        v75 = &unk_2643E33D8;
        v76 = &v70;
        __getAVPlayerItemClass_block_invoke((uint64_t)buf);
        v27 = (void *)v71[3];
      }
      id v28 = v27;
      _Block_object_dispose(&v70, 8);
      v29 = [v7 videoUrl];
      v30 = [v28 playerItemWithURL:v29];

      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2050000000;
      v31 = (void *)getAVPlayerViewControllerClass_softClass;
      uint64_t v73 = getAVPlayerViewControllerClass_softClass;
      if (!getAVPlayerViewControllerClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAVPlayerViewControllerClass_block_invoke;
        v75 = &unk_2643E33D8;
        v76 = &v70;
        __getAVPlayerViewControllerClass_block_invoke((uint64_t)buf);
        v31 = (void *)v71[3];
      }
      v32 = v31;
      _Block_object_dispose(&v70, 8);
      v33 = (AVPlayerViewController *)objc_alloc_init(v32);
      videoPlayerController = v10->_videoPlayerController;
      v10->_videoPlayerController = v33;

      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2050000000;
      v35 = (void *)getAVPlayerClass_softClass;
      uint64_t v73 = getAVPlayerClass_softClass;
      if (!getAVPlayerClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAVPlayerClass_block_invoke;
        v75 = &unk_2643E33D8;
        v76 = &v70;
        __getAVPlayerClass_block_invoke((uint64_t)buf);
        v35 = (void *)v71[3];
      }
      id v36 = v35;
      _Block_object_dispose(&v70, 8);
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
        _os_log_impl(&dword_21C134000, v42, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Loading rich notification video", buf, 0x16u);
      }
    }
    v46 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v46;

    [(UILabel *)v10->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_titleLabel setNumberOfLines:0];
    [(UILabel *)v10->_titleLabel setTextAlignment:4];
    [(UILabel *)v10->_titleLabel setLineBreakMode:0];
    uint64_t v48 = *MEMORY[0x263F835D0];
    v49 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v10->_titleLabel setFont:v49];

    v50 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v10->_titleLabel setBackgroundColor:v50];

    v51 = [v7 title];
    [(UILabel *)v10->_titleLabel setText:v51];

    v52 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v10->_subtitleLabel;
    v10->_subtitleLabel = v52;

    [(UILabel *)v10->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v10->_subtitleLabel setTextAlignment:4];
    [(UILabel *)v10->_subtitleLabel setLineBreakMode:0];
    v54 = [MEMORY[0x263F81708] preferredFontForTextStyle:v48];
    [(UILabel *)v10->_subtitleLabel setFont:v54];

    v55 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v10->_subtitleLabel setBackgroundColor:v55];

    v56 = [v7 subtitle];
    [(UILabel *)v10->_subtitleLabel setText:v56];

    v57 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    textLabel = v10->_textLabel;
    v10->_textLabel = v57;

    [(UILabel *)v10->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_textLabel setNumberOfLines:0];
    [(UILabel *)v10->_textLabel setTextAlignment:4];
    [(UILabel *)v10->_textLabel setLineBreakMode:0];
    v59 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v10->_textLabel setFont:v59];

    v60 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v10->_textLabel setBackgroundColor:v60];

    v61 = [v7 informativeText];
    [(UILabel *)v10->_textLabel setText:v61];
  }
  return v10;
}

void __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke(uint64_t a1)
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
  block[2] = __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2;
  block[3] = &unk_2643E3360;
  id v10 = v6;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F827E8];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) traitCollection];
  [v4 displayScale];
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
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to find artwork at url", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [(AVPlayerViewController *)self->_videoPlayerController player];
  [v3 removeObserver:self forKeyPath:@"status"];

  v4 = [(AVPlayerViewController *)self->_videoPlayerController player];
  [v4 removeObserver:self forKeyPath:@"timeControlStatus"];

  v5.receiver = self;
  v5.super_class = (Class)AMSUIUserNotificationContentViewController;
  [(AMSUIUserNotificationContentViewController *)&v5 dealloc];
}

- (void)loadView
{
  v25.receiver = self;
  v25.super_class = (Class)AMSUIUserNotificationContentViewController;
  [(AMSUIUserNotificationContentViewController *)&v25 loadView];
  uint64_t v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(AMSUIUserNotificationContentViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [(AMSUIUserNotificationContentViewController *)self view];
  v6 = [(AMSUIUserNotificationContentViewController *)self titleLabel];
  [v5 addSubview:v6];

  id v7 = [(AMSUIUserNotificationContentViewController *)self view];
  id v8 = [(AMSUIUserNotificationContentViewController *)self subtitleLabel];
  [v7 addSubview:v8];

  v9 = [(AMSUIUserNotificationContentViewController *)self view];
  id v10 = [(AMSUIUserNotificationContentViewController *)self textLabel];
  [v9 addSubview:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_viewTapped_];
  [v11 setDelegate:self];
  int v12 = [(AMSUIUserNotificationContentViewController *)self view];
  [v12 addGestureRecognizer:v11];

  v13 = [(AMSUIUserNotificationContentViewController *)self view];
  [v13 setUserInteractionEnabled:1];

  __int16 v14 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];

  if (v14)
  {
    v15 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    [(AMSUIUserNotificationContentViewController *)self addChildViewController:v15];

    uint64_t v16 = [(AMSUIUserNotificationContentViewController *)self view];
    v17 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    v18 = [v17 view];
    [v16 addSubview:v18];

    uint64_t v19 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    [v19 didMoveToParentViewController:self];

    v20 = [(AMSUIUserNotificationContentViewController *)self imageView];

    if (v20)
    {
      v21 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
      id v22 = [v21 contentOverlayView];
      uint64_t v23 = [(AMSUIUserNotificationContentViewController *)self imageView];
      [v22 addSubview:v23];

LABEL_6:
    }
  }
  else
  {
    v24 = [(AMSUIUserNotificationContentViewController *)self imageView];

    if (v24)
    {
      v21 = [(AMSUIUserNotificationContentViewController *)self view];
      id v22 = [(AMSUIUserNotificationContentViewController *)self imageView];
      [v21 addSubview:v22];
      goto LABEL_6;
    }
  }
  [(AMSUIUserNotificationContentViewController *)self _setupAccessibility];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)AMSUIUserNotificationContentViewController;
  -[AMSUIUserNotificationContentViewController setPreferredContentSize:](&v7, sel_setPreferredContentSize_);
  v6 = [(AMSUIUserNotificationContentViewController *)self delegate];
  objc_msgSend(v6, "viewController:didUpdatePreferredContentSize:", self, width, height);
}

- (void)viewWillLayoutSubviews
{
  v64.receiver = self;
  v64.super_class = (Class)AMSUIUserNotificationContentViewController;
  [(AMSUIUserNotificationContentViewController *)&v64 viewWillLayoutSubviews];
  uint64_t v3 = [(AMSUIUserNotificationContentViewController *)self view];
  [v3 frame];
  double v5 = v4;

  double v6 = v5 + -32.0;
  objc_super v7 = [(AMSUIUserNotificationContentViewController *)self titleLabel];
  objc_msgSend(v7, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v9 = v8;

  id v10 = [(AMSUIUserNotificationContentViewController *)self subtitleLabel];
  objc_msgSend(v10, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v12 = v11;

  v13 = [(AMSUIUserNotificationContentViewController *)self textLabel];
  objc_msgSend(v13, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v15 = v14;

  uint64_t v16 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];

  if (v16)
  {
    v17 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    [v17 videoBounds];
    double v19 = v18;
    double v21 = v20;

    if (v19 <= 0.0) {
      double v22 = v5 * 9.0 * 0.0625;
    }
    else {
      double v22 = v5 * v21 / v19;
    }
    v34 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    v35 = [v34 view];
    objc_msgSend(v35, "setFrame:", 0.0, 0.0, v5, v22);

    id v36 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    v37 = [v36 view];
    [v37 frame];
    double v38 = CGRectGetMaxY(v65) + 16.0;

    v39 = [(AMSUIUserNotificationContentViewController *)self imageView];

    if (v39)
    {
      v40 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
      v41 = [v40 view];
      [v41 bounds];
      double v43 = v42;
      double v45 = v44;
      double v63 = v6;
      double v46 = v9;
      double v47 = v12;
      double v48 = v15;
      double v50 = v49;
      double v52 = v51;
      v53 = [(AMSUIUserNotificationContentViewController *)self imageView];
      double v54 = v50;
      double v15 = v48;
      double v12 = v47;
      double v9 = v46;
      double v6 = v63;
      objc_msgSend(v53, "setFrame:", v43, v45, v54, v52);

LABEL_13:
    }
  }
  else
  {
    uint64_t v23 = [(AMSUIUserNotificationContentViewController *)self imageView];

    if (v23)
    {
      v24 = [(AMSUIUserNotificationContentViewController *)self imageView];
      objc_super v25 = [v24 image];
      if (v25)
      {
        v26 = [(AMSUIUserNotificationContentViewController *)self imageView];
        v27 = [v26 image];
        [v27 size];
        double v29 = v28;
        v30 = [(AMSUIUserNotificationContentViewController *)self imageView];
        v31 = [v30 image];
        [v31 size];
        double v33 = v29 / v32;
      }
      else
      {
        double v33 = 0.0;
      }

      v55 = [(AMSUIUserNotificationContentViewController *)self imageView];
      objc_msgSend(v55, "setFrame:", 0.0, 0.0, v5, v5 * v33);

      v40 = [(AMSUIUserNotificationContentViewController *)self imageView];
      [v40 frame];
      double v38 = CGRectGetMaxY(v66) + 16.0;
      goto LABEL_13;
    }
    double v38 = 16.0;
  }
  v56 = [(AMSUIUserNotificationContentViewController *)self titleLabel];
  objc_msgSend(v56, "setFrame:", 16.0, v38, v6, v9);

  v57 = [(AMSUIUserNotificationContentViewController *)self titleLabel];
  [v57 frame];
  double MaxY = CGRectGetMaxY(v67);
  v59 = [(AMSUIUserNotificationContentViewController *)self subtitleLabel];
  objc_msgSend(v59, "setFrame:", 16.0, MaxY, v6, v12);

  v60 = [(AMSUIUserNotificationContentViewController *)self subtitleLabel];
  [v60 frame];
  double v61 = CGRectGetMaxY(v68);
  v62 = [(AMSUIUserNotificationContentViewController *)self textLabel];
  objc_msgSend(v62, "setFrame:", 16.0, v61, v6, v15);

  [(AMSUIUserNotificationContentViewController *)self expectedContentSize];
  -[AMSUIUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMSUIUserNotificationContentViewController;
  [(AMSUIUserNotificationContentViewController *)&v8 viewWillAppear:a3];
  if (![(AMSUIUserNotificationContentViewController *)self hasAppeared])
  {
    double v4 = (void *)MEMORY[0x263F27F18];
    double v5 = [(AMSUIUserNotificationContentViewController *)self userNotification];
    double v6 = [v4 eventForContentEngagementWithNotification:v5];

    objc_super v7 = [(AMSUIUserNotificationContentViewController *)self metrics];
    [v7 enqueueEvent:v6];
  }
  [(AMSUIUserNotificationContentViewController *)self setHasAppeared:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
  id v13 = [v12 player];

  if (v13 == v10)
  {
    if ([v9 isEqualToString:@"status"])
    {
      double v14 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
      double v15 = [v14 player];
      uint64_t v16 = [v15 status];

      if (v16 == 1)
      {
        v17 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
        double v18 = [v17 player];
        [v18 setMuted:0];

        double v19 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
        [v19 setAllowsEnteringFullScreen:0];

        double v20 = [getAVAudioSessionClass() sharedInstance];
        double v21 = [v20 category];
        [(AMSUIUserNotificationContentViewController *)self setAudioSessionCategory:v21];

        double v22 = [getAVAudioSessionClass() sharedInstance];
        -[AMSUIUserNotificationContentViewController setAudioSessionCategoryOptions:](self, "setAudioSessionCategoryOptions:", [v22 categoryOptions]);

        uint64_t v23 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
        v24 = [v23 player];
        [v24 setAllowsExternalPlayback:0];

        [(AMSUIUserNotificationContentViewController *)self expectedContentSize];
        -[AMSUIUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
        objc_super v25 = [MEMORY[0x263F27CB8] sharedConfig];
        if (!v25)
        {
          objc_super v25 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v26 = [v25 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = objc_opt_class();
          id v28 = v27;
          double v29 = [(AMSUIUserNotificationContentViewController *)self userNotification];
          v30 = [v29 logKey];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Ready to play rich notification video", buf, 0x16u);
        }
      }
      v31 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
      double v32 = [v31 player];
      BOOL v33 = [v32 status] == 2;

      if (v33)
      {
        v34 = [MEMORY[0x263F27CB8] sharedConfig];
        if (!v34)
        {
          v34 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v35 = [v34 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = objc_opt_class();
          id v37 = v36;
          double v38 = [(AMSUIUserNotificationContentViewController *)self userNotification];
          v39 = [v38 logKey];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          _os_log_impl(&dword_21C134000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load video at url", buf, 0x16u);
        }
      }
    }
    if ([v9 isEqualToString:@"timeControlStatus"])
    {
      v40 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
      v41 = [v40 player];
      BOOL v42 = [v41 timeControlStatus] == 2;

      if (v42)
      {
        double v43 = [(AMSUIUserNotificationContentViewController *)self imageView];
        [v43 removeFromSuperview];

        double v44 = [getAVAudioSessionClass() sharedInstance];
        uint64_t v52 = 0;
        v53 = &v52;
        uint64_t v54 = 0x2020000000;
        double v45 = (void *)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
        uint64_t v55 = getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
        if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getAVAudioSessionCategoryPlaybackSymbolLoc_block_invoke;
          v57 = &unk_2643E33D8;
          v58 = &v52;
          double v46 = (void *)AVFoundationLibrary();
          double v47 = dlsym(v46, "AVAudioSessionCategoryPlayback");
          *(void *)(v58[1] + 24) = v47;
          getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = *(void *)(v58[1] + 24);
          double v45 = (void *)v53[3];
        }
        _Block_object_dispose(&v52, 8);
        if (!v45) {
          getAIDAServiceTypeCloud_cold_1();
        }
        objc_msgSend(v44, "setCategory:withOptions:error:", *v45, 1, 0, v52);

        if (![(AMSUIUserNotificationContentViewController *)self hasPlayedVideo])
        {
          double v48 = (void *)MEMORY[0x263F27F18];
          double v49 = [(AMSUIUserNotificationContentViewController *)self userNotification];
          double v50 = [v48 eventForVideoPlaybackForNotification:v49];

          double v51 = [(AMSUIUserNotificationContentViewController *)self metrics];
          [v51 enqueueEvent:v50];
        }
        [(AMSUIUserNotificationContentViewController *)self setHasPlayedVideo:1];
      }
    }
  }
}

- (CGSize)expectedContentSize
{
  uint64_t v3 = [(AMSUIUserNotificationContentViewController *)self view];
  [v3 frame];
  double v5 = v4;

  double v6 = [(AMSUIUserNotificationContentViewController *)self titleLabel];
  objc_msgSend(v6, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v8 = v7;

  id v9 = [(AMSUIUserNotificationContentViewController *)self subtitleLabel];
  objc_msgSend(v9, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v11 = v10;

  double v12 = [(AMSUIUserNotificationContentViewController *)self textLabel];
  objc_msgSend(v12, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  double v14 = v13;

  double v15 = [(AMSUIUserNotificationContentViewController *)self imageView];
  uint64_t v16 = [v15 image];

  double v17 = 0.0;
  double v18 = 0.0;
  if (v16)
  {
    double v19 = [(AMSUIUserNotificationContentViewController *)self imageView];
    double v20 = [v19 image];
    [v20 size];
    double v22 = v21;
    uint64_t v23 = [(AMSUIUserNotificationContentViewController *)self imageView];
    v24 = [v23 image];
    [v24 size];
    double v26 = v22 / v25;

    double v18 = v5 * v26;
  }
  v27 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];

  if (v27)
  {
    id v28 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
    [v28 videoBounds];
    double v30 = v29;
    double v32 = v31;

    if (v30 <= 0.0)
    {
      double v17 = v5 * 9.0 * 0.0625;
      double v18 = 0.0;
    }
    else
    {
      double v18 = 0.0;
      double v17 = v5 * v32 / v30;
    }
  }
  double v33 = v14 + v11 + v8 + v18 + v17 + 16.0 + 16.0;
  double v34 = v5;
  result.double height = v33;
  result.double width = v34;
  return result;
}

- (void)mediaPause
{
  uint64_t v3 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
  double v4 = [v3 player];
  [v4 pause];

  id v6 = [getAVAudioSessionClass() sharedInstance];
  double v5 = [(AMSUIUserNotificationContentViewController *)self audioSessionCategory];
  objc_msgSend(v6, "setCategory:withOptions:error:", v5, -[AMSUIUserNotificationContentViewController audioSessionCategoryOptions](self, "audioSessionCategoryOptions"), 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  id v6 = [a4 view];
  double v7 = [v5 view];

  return v6 == v7;
}

- (void)_setupAccessibility
{
  uint64_t v3 = [(AMSUIUserNotificationContentViewController *)self view];
  [v3 setAccessibilityIdentifier:@"userNotificationContent"];

  double v4 = [(AMSUIUserNotificationContentViewController *)self titleLabel];
  [v4 setAccessibilityIdentifier:@"titleLabel"];

  id v5 = [(AMSUIUserNotificationContentViewController *)self textLabel];
  [v5 setAccessibilityIdentifier:@"textLabel"];

  id v6 = [(AMSUIUserNotificationContentViewController *)self subtitleLabel];
  [v6 setAccessibilityIdentifier:@"subtitleLabel"];

  double v7 = [(AMSUIUserNotificationContentViewController *)self imageView];
  [v7 setAccessibilityIdentifier:@"imageView"];

  id v9 = [(AMSUIUserNotificationContentViewController *)self videoPlayerController];
  double v8 = [v9 view];
  [v8 setAccessibilityIdentifier:@"videoPlayer"];
}

- (void)viewTapped:(id)a3
{
  id v3 = [(AMSUIUserNotificationContentViewController *)self delegate];
  [v3 openNotification];
}

- (AMSUIUserNotificationContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIUserNotificationContentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSUserNotification)userNotification
{
  return self->_userNotification;
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

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (AVPlayerViewController)videoPlayerController
{
  return self->_videoPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerController, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end