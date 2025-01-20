@interface ASCLockupMediaPresenter
+ (id)log;
- (ASCLockup)lockup;
- (ASCLockupMediaPresenter)initWithView:(id)a3 lockupPresenter:(id)a4;
- (ASCLockupMediaPresenter)initWithView:(id)a3 lockupPresenter:(id)a4 context:(id)a5;
- (ASCLockupMediaPresenterBackgroundView)backgroundView;
- (ASCLockupMediaPresenterObserver)observer;
- (ASCLockupMediaPresenterView)view;
- (ASCPendingPromises)pendingArtworkPromises;
- (ASCPresenterContext)context;
- (id)artworkForLockup:(id)a3;
- (id)videoViewForLockup:(id)a3;
- (void)dealloc;
- (void)lockupPresenterDidChange:(id)a3;
- (void)performFollowUpWork:(id)a3;
- (void)performScreenshotsFetch;
- (void)screenshotArtwork:(id)a3 didFailFetchWithError:(id)a4 atIndex:(unint64_t)a5;
- (void)screenshotArtwork:(id)a3 didFetchImage:(id)a4 atIndex:(int64_t)a5;
- (void)setBackgroundView:(id)a3;
- (void)setLockup:(id)a3;
- (void)setObserver:(id)a3;
- (void)videoView:(id)a3 videoStateDidChange:(int64_t)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation ASCLockupMediaPresenter

+ (id)log
{
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, &__block_literal_global_10);
  }
  v2 = (void *)log_log_2;

  return v2;
}

uint64_t __30__ASCLockupMediaPresenter_log__block_invoke()
{
  log_log_2 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCLockupMediaPresenter");

  return MEMORY[0x1F41817F8]();
}

- (ASCLockupMediaPresenter)initWithView:(id)a3 lockupPresenter:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASCLockupMediaPresenter;
  v12 = [(ASCLockupMediaPresenter *)&v20 init];
  if (v12)
  {
    v13 = objc_alloc_init(ASCPendingPromises);
    pendingArtworkPromises = v12->_pendingArtworkPromises;
    v12->_pendingArtworkPromises = v13;

    objc_storeStrong((id *)&v12->_view, a3);
    objc_storeStrong((id *)&v12->_context, a5);
    v15 = [v10 lockup];
    uint64_t v16 = [v15 copy];
    lockup = v12->_lockup;
    v12->_lockup = (ASCLockup *)v16;

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v12 selector:sel_lockupPresenterDidChange_ name:0x1F1E03F58 object:v10];
  }
  return v12;
}

- (ASCLockupMediaPresenter)initWithView:(id)a3 lockupPresenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ASCPresenterContext sharedContext];
  id v9 = [(ASCLockupMediaPresenter *)self initWithView:v7 lockupPresenter:v6 context:v8];

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupMediaPresenter;
  [(ASCLockupMediaPresenter *)&v4 dealloc];
}

- (void)lockupPresenterDidChange:(id)a3
{
  id v5 = [a3 object];
  objc_super v4 = [v5 lockup];
  [(ASCLockupMediaPresenter *)self setLockup:v4];
}

- (void)setLockup:(id)a3
{
  objc_super v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v19 = v4;
  if (v4 && lockup)
  {
    BOOL v6 = [(ASCLockup *)lockup isEqual:v4];
    objc_super v4 = v19;
    if (v6) {
      goto LABEL_11;
    }
  }
  else if (lockup == v4)
  {
    goto LABEL_11;
  }
  id v7 = (ASCLockup *)[(ASCLockup *)v4 copy];
  v8 = self->_lockup;
  self->_lockup = v7;

  id v9 = [(ASCLockupMediaPresenter *)self pendingArtworkPromises];
  int v10 = [v9 hasPromises];

  if (v10)
  {
    id v11 = [(ASCLockupMediaPresenter *)self pendingArtworkPromises];
    [v11 cancelAll];

    v12 = [(ASCLockupMediaPresenter *)self observer];
    [v12 lockupMediaPresenterDidCancelScreenshotsFetchRequest];
  }
  v13 = [(ASCLockupMediaPresenter *)self view];
  if (v19)
  {
    v14 = [(ASCLockup *)v19 screenshots];
    v15 = [(ASCLockup *)v19 trailers];
    [v13 setScreenshots:v14 andTrailers:v15];

    uint64_t v16 = [(ASCLockupMediaPresenter *)self view];
    v17 = [(ASCLockupMediaPresenter *)self videoViewForLockup:v19];
    [v16 setVideoView:v17];

    [(ASCLockupMediaPresenter *)self performScreenshotsFetch];
  }
  else
  {
    [v13 setVideoView:0];

    v18 = [(ASCLockupMediaPresenter *)self view];
    [v18 setScreenshots:0 andTrailers:0];
  }
LABEL_11:

  MEMORY[0x1F41817F8]();
}

- (void)setBackgroundView:(id)a3
{
}

- (id)videoViewForLockup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 trailers];
  if (!v5) {
    goto LABEL_4;
  }
  BOOL v6 = (void *)v5;
  id v7 = [v4 trailers];
  v8 = [v7 videos];
  id v9 = [v8 firstObject];

  if (v9)
  {
    int v10 = [v4 trailers];
    id v11 = [v10 videos];
    v12 = [v11 firstObject];

    v13 = [ASCScreenshotDisplayConfiguration alloc];
    v14 = [v4 trailers];
    v15 = [v14 mediaPlatform];
    uint64_t v16 = [v15 deviceCornerRadiusFactor];
    v17 = [(ASCScreenshotDisplayConfiguration *)v13 initWithDeviceCornerRadiusFactor:v16];

    v18 = [ASCVideoView alloc];
    v19 = [v12 videoURL];
    objc_super v20 = -[ASCVideoView initWithFrame:videoURL:screenshotDisplayConfiguration:](v18, "initWithFrame:videoURL:screenshotDisplayConfiguration:", v19, v17, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

    [(ASCVideoView *)v20 setDelegate:self];
  }
  else
  {
LABEL_4:
    objc_super v20 = 0;
  }

  return v20;
}

- (void)viewDidLayoutSubviews
{
  v3 = [(ASCLockupMediaPresenter *)self pendingArtworkPromises];
  int v4 = [v3 hasPromises];

  if (v4)
  {
    uint64_t v5 = [(ASCLockupMediaPresenter *)self pendingArtworkPromises];
    [v5 cancelAll];

    BOOL v6 = [(ASCLockupMediaPresenter *)self observer];
    [v6 lockupMediaPresenterDidCancelScreenshotsFetchRequest];
  }

  [(ASCLockupMediaPresenter *)self performScreenshotsFetch];
}

- (id)artworkForLockup:(id)a3
{
  int v4 = [a3 screenshots];
  uint64_t v5 = [(ASCLockupMediaPresenter *)self lockup];
  BOOL v6 = [v5 trailers];
  id v7 = +[__ASCLayoutProxy artworkFrom:v4 and:v6];

  return v7;
}

- (void)performScreenshotsFetch
{
  v3 = [(ASCLockupMediaPresenter *)self observer];
  [v3 lockupMediaPresenterDidBeginScreenshotsFetchRequest];

  int v4 = [(ASCLockupMediaPresenter *)self lockup];
  uint64_t v5 = [(ASCLockupMediaPresenter *)self artworkForLockup:v4];

  BOOL v6 = [(ASCLockupMediaPresenter *)self view];
  [v6 preferredScreenshotSize];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke;
  v11[3] = &unk_1E645DFF8;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v10;
  [v5 enumerateObjectsUsingBlock:v11];
}

void __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  BOOL v6 = [*(id *)(a1 + 32) context];
  uint64_t v7 = [v6 artworkFetcher];
  uint64_t v8 = objc_msgSend(v7, "imageForContentsOfArtwork:withSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

  uint64_t v9 = [*(id *)(a1 + 32) pendingArtworkPromises];
  [v9 addPromise:v8];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_2;
  v15[3] = &unk_1E645DFA8;
  objc_copyWeak(v17, &location);
  id v10 = v5;
  id v16 = v10;
  v17[1] = a3;
  [v8 addSuccessBlock:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_3;
  v12[3] = &unk_1E645DFD0;
  objc_copyWeak(v14, &location);
  id v11 = v10;
  id v13 = v11;
  v14[1] = a3;
  [v8 addErrorBlock:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained screenshotArtwork:*(void *)(a1 + 32) didFetchImage:v4 atIndex:*(void *)(a1 + 48)];
}

void __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained screenshotArtwork:*(void *)(a1 + 32) didFailFetchWithError:v4 atIndex:*(void *)(a1 + 48)];
}

- (void)performFollowUpWork:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)screenshotArtwork:(id)a3 didFetchImage:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ASCLockupMediaPresenter_screenshotArtwork_didFetchImage_atIndex___block_invoke;
  v12[3] = &unk_1E645E020;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(ASCLockupMediaPresenter *)self performFollowUpWork:v12];
}

void __67__ASCLockupMediaPresenter_screenshotArtwork_didFetchImage_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 lockup];
  id v4 = [v2 artworkForLockup:v3];

  unint64_t v5 = *(void *)(a1 + 56);
  if (v5 >= [v4 count])
  {
    uint64_t v7 = +[ASCLockupMediaPresenter log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1C2B8D000, v7, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    BOOL v6 = [v4 objectAtIndexedSubscript:*(void *)(a1 + 56)];
    uint64_t v7 = v6;
    id v8 = *(NSObject **)(a1 + 40);
    if (v6) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (v6 == v8)
      {
LABEL_14:
        id v13 = [*(id *)(a1 + 32) view];
        [v13 setImage:*(void *)(a1 + 48) atIndex:*(void *)(a1 + 56)];

        if (!*(void *)(a1 + 56))
        {
          id v14 = [*(id *)(a1 + 32) backgroundView];
          [v14 setImage:*(void *)(a1 + 48)];
        }
        int64_t v15 = [*(id *)(a1 + 32) pendingArtworkPromises];
        char v16 = [v15 hasPromises];

        if ((v16 & 1) == 0)
        {
          v17 = [*(id *)(a1 + 32) observer];
          [v17 lockupMediaPresenterDidFinishScreenshotsFetchRequest];
        }
        goto LABEL_18;
      }
    }
    else if (-[NSObject isEqual:](v6, "isEqual:"))
    {
      goto LABEL_14;
    }
    id v10 = +[ASCLockupMediaPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", (uint8_t *)&v18, 0xCu);
    }
  }
LABEL_18:
}

- (void)screenshotArtwork:(id)a3 didFailFetchWithError:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ASCLockupMediaPresenter_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke;
  v9[3] = &unk_1E645E048;
  id v10 = v7;
  unint64_t v11 = a5;
  v9[4] = self;
  id v8 = v7;
  [(ASCLockupMediaPresenter *)self performFollowUpWork:v9];
}

void __75__ASCLockupMediaPresenter_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 lockup];
  id v4 = [v2 artworkForLockup:v3];

  unint64_t v5 = *(void *)(a1 + 48);
  if (v5 >= [v4 count])
  {
    id v7 = +[ASCLockupMediaPresenter log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_1C2B8D000, v7, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    BOOL v6 = [v4 objectAtIndexedSubscript:*(void *)(a1 + 48)];
    id v7 = v6;
    id v8 = *(NSObject **)(a1 + 40);
    if (v6) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (v6 == v8) {
        goto LABEL_14;
      }
    }
    else if (-[NSObject isEqual:](v6, "isEqual:"))
    {
LABEL_14:
      id v13 = [*(id *)(a1 + 32) pendingArtworkPromises];
      char v14 = [v13 hasPromises];

      if ((v14 & 1) == 0)
      {
        int64_t v15 = [*(id *)(a1 + 32) observer];
        [v15 lockupMediaPresenterDidFinishScreenshotsFetchRequest];
      }
      goto LABEL_16;
    }
    id v10 = +[ASCLockupMediaPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_16:
}

- (void)videoView:(id)a3 videoStateDidChange:(int64_t)a4
{
  BOOL v6 = [(ASCLockupMediaPresenter *)self observer];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(ASCLockupMediaPresenter *)self observer];
    [v8 lockupMediaPresenterVideoStateDidChange:a4];
  }
}

- (ASCLockupMediaPresenterObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (ASCLockupMediaPresenterObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (ASCLockupMediaPresenterBackgroundView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);

  return (ASCLockupMediaPresenterBackgroundView *)WeakRetained;
}

- (ASCLockupMediaPresenterView)view
{
  return self->_view;
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (ASCPendingPromises)pendingArtworkPromises
{
  return self->_pendingArtworkPromises;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingArtworkPromises, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_backgroundView);

  objc_destroyWeak((id *)&self->_observer);
}

@end