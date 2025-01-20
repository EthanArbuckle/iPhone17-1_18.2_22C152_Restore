@interface ASCLockupPresenter
+ (__CFString)iconPlaceholderDecoration;
+ (id)log;
- (AMSMutablePromise)pendingRequestedLockup;
- (ASCAppearMetricsPresenter)metricsPresenter;
- (ASCCustomLockupContentProvider)customContentProvider;
- (ASCLockup)lockup;
- (ASCLockupPresenter)initWithView:(id)a3 customContentProvider:(id)a4 offerPresenter:(id)a5 metricsPresenter:(id)a6;
- (ASCLockupPresenter)initWithView:(id)a3 customContentProvider:(id)a4 offerPresenter:(id)a5 metricsPresenter:(id)a6 context:(id)a7;
- (ASCLockupPresenter)initWithView:(id)a3 metricsPresenter:(id)a4;
- (ASCLockupPresenter)initWithView:(id)a3 offerPresenter:(id)a4 metricsPresenter:(id)a5;
- (ASCLockupPresenterObserver)observer;
- (ASCLockupPresenterView)view;
- (ASCLockupRequest)request;
- (ASCLockupViewGroup)group;
- (ASCOfferPresenter)offerPresenter;
- (ASCPresenterContext)context;
- (ASCSignpostSpan)pendingViewRender;
- (BOOL)prefersRightToLeftViewLayout;
- (BOOL)showsPlaceholderContent;
- (id)description;
- (id)viewRenderSpanProvider;
- (void)beginViewRender;
- (void)clearContent;
- (void)daemonDidRebootstrap:(id)a3;
- (void)dealloc;
- (void)endViewRender;
- (void)iconArtwork:(id)a3 didFailFetchWithError:(id)a4;
- (void)iconArtwork:(id)a3 didFetchImage:(id)a4;
- (void)performFollowUpWork:(id)a3;
- (void)performIconFetch;
- (void)performLockupFetch;
- (void)reloadDefaultContent;
- (void)request:(id)a3 didCompleteWithLockup:(id)a4;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestWillFetchLockup:(id)a3;
- (void)retryGroup:(id)a3;
- (void)retryRequestIfNeeded:(id)a3;
- (void)setGroup:(id)a3;
- (void)setLockup:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPendingRequestedLockup:(id)a3;
- (void)setPendingViewRender:(id)a3;
- (void)setRequest:(id)a3;
- (void)setShowsPlaceholderContent:(BOOL)a3;
- (void)setViewRenderSpanProvider:(id)a3;
- (void)showPlaceholderContent;
@end

@implementation ASCLockupPresenter

+ (id)log
{
  self;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, &__block_literal_global_11);
  }
  v0 = (void *)log_log_3;

  return v0;
}

uint64_t __25__ASCLockupPresenter_log__block_invoke()
{
  log_log_3 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCLockupPresenter");

  return MEMORY[0x1F41817F8]();
}

+ (__CFString)iconPlaceholderDecoration
{
  self;

  return @"roundedRect";
}

- (ASCLockupPresenter)initWithView:(id)a3 customContentProvider:(id)a4 offerPresenter:(id)a5 metricsPresenter:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ASCLockupPresenter;
  v17 = [(ASCLockupPresenter *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_view, v12);
    objc_storeStrong((id *)&v18->_context, a7);
    objc_storeStrong((id *)&v18->_offerPresenter, a5);
    objc_storeStrong((id *)&v18->_metricsPresenter, a6);
    objc_storeStrong((id *)&v18->_customContentProvider, a4);
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v20 = +[ASCRebootstrapNotifier sharedNotifier];
    [v19 addObserver:v18 selector:sel_daemonDidRebootstrap_ name:0x1F1E05278 object:v20];
  }
  return v18;
}

- (ASCLockupPresenter)initWithView:(id)a3 customContentProvider:(id)a4 offerPresenter:(id)a5 metricsPresenter:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[ASCPresenterContext sharedContext];
  id v15 = [(ASCLockupPresenter *)self initWithView:v13 customContentProvider:v12 offerPresenter:v11 metricsPresenter:v10 context:v14];

  return v15;
}

- (ASCLockupPresenter)initWithView:(id)a3 offerPresenter:(id)a4 metricsPresenter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[ASCPresenterContext sharedContext];
  id v12 = [(ASCLockupPresenter *)self initWithView:v10 customContentProvider:0 offerPresenter:v9 metricsPresenter:v8 context:v11];

  return v12;
}

- (ASCLockupPresenter)initWithView:(id)a3 metricsPresenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ASCPresenterContext sharedContext];
  id v9 = [(ASCLockupPresenter *)self initWithView:v7 customContentProvider:0 offerPresenter:0 metricsPresenter:v6 context:v8];

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupPresenter;
  [(ASCLockupPresenter *)&v4 dealloc];
}

- (BOOL)prefersRightToLeftViewLayout
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "asc_storefrontLocale");
  char v3 = objc_msgSend(v2, "asc_prefersRightToLeftLayout");

  return v3;
}

- (void)setLockup:(id)a3
{
  objc_super v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v25 = v4;
  if (!v4 || !lockup)
  {
    if (lockup == v4) {
      goto LABEL_10;
    }
LABEL_6:
    id v7 = (ASCLockup *)[(ASCLockup *)v4 copy];
    id v8 = self->_lockup;
    self->_lockup = v7;

    if (v25)
    {
      id v9 = [(ASCLockup *)v25 offer];
      id v10 = [(ASCLockupPresenter *)self offerPresenter];
      [v10 setOffer:v9];

      id v11 = [(ASCLockupPresenter *)self metricsPresenter];
      [v11 setModel:v25];

      [(ASCLockupPresenter *)self performIconFetch];
      id v12 = [(ASCLockupPresenter *)self view];
      id v13 = [(ASCLockup *)v25 heading];
      [v12 setHeading:v13];

      id v14 = [(ASCLockupPresenter *)self view];
      id v15 = [(ASCLockup *)v25 title];
      [v14 setTitle:v15];

      id v16 = [(ASCLockupPresenter *)self view];
      v17 = [(ASCLockup *)v25 subtitle];
      [v16 setSubtitle:v17];

      v18 = [(ASCLockupPresenter *)self view];
      objc_msgSend(v18, "setPrefersRightToLeftLayout:", -[ASCLockupPresenter prefersRightToLeftViewLayout](self, "prefersRightToLeftViewLayout"));

      v19 = [(ASCLockupPresenter *)self view];
      v20 = [(ASCLockup *)v25 displayContext];
      [v19 setDisplayContext:v20];

      v21 = [(ASCLockupPresenter *)self view];
      objc_super v22 = [(ASCLockupPresenter *)self customContentProvider];
      v23 = [v22 badgeView];
      [v21 setBadge:v23];
    }
    else
    {
      [(ASCLockupPresenter *)self reloadDefaultContent];
    }
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 postNotificationName:@"ASCLockupPresenterDidChangeNotification" object:self];

    goto LABEL_10;
  }
  BOOL v6 = [(ASCLockup *)lockup isEqual:v4];
  objc_super v4 = v25;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_10:

  MEMORY[0x1F41817F8]();
}

- (void)setGroup:(id)a3
{
  v5 = (ASCLockupViewGroup *)a3;
  BOOL v6 = self->_group;
  id v7 = v6;
  if (v5 && v6)
  {
    char v8 = [(ASCLockupViewGroup *)v6 isEqual:v5];

    if (v8) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v7 == v5) {
      goto LABEL_13;
    }
  }
  if (self->_group)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self name:@"ASCLockupPresenterRetryGroupNotification" object:self->_group];
  }
  objc_storeStrong((id *)&self->_group, a3);
  if (v5)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:self selector:sel_retryGroup_ name:@"ASCLockupPresenterRetryGroupNotification" object:v5];

    id v11 = [(ASCLockupPresenter *)self request];

    if (v11)
    {
      id v12 = +[ASCLockupPresenter log]();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ASCLockupPresenter setGroup:]((uint64_t)self, v12);
      }
    }
  }
LABEL_13:
}

- (void)setRequest:(id)a3
{
  objc_super v4 = (ASCLockupRequest *)a3;
  request = self->_request;
  id v9 = v4;
  if (!v4 || !request)
  {
    if (request == v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v6 = [(ASCLockupRequest *)request isEqual:v4];
  objc_super v4 = v9;
  if (!v6)
  {
LABEL_6:
    id v7 = (ASCLockupRequest *)[(ASCLockupRequest *)v4 copy];
    char v8 = self->_request;
    self->_request = v7;

    [(ASCLockupPresenter *)self performLockupFetch];
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  if (((!self->_showsPlaceholderContent ^ a3) & 1) == 0)
  {
    self->_showsPlaceholderContent = a3;
    [(ASCLockupPresenter *)self reloadDefaultContent];
  }
}

- (void)showPlaceholderContent
{
  char v3 = [(ASCLockupPresenter *)self view];
  objc_super v4 = +[ASCLockupPresenter iconPlaceholderDecoration]();
  [v3 setIconImage:0 withDecoration:v4];

  v5 = [(ASCLockupPresenter *)self view];
  [v5 setHeading:0];

  BOOL v6 = [(ASCLockupPresenter *)self view];
  [v6 setTitle:0];

  id v7 = [(ASCLockupPresenter *)self view];
  [v7 setSubtitle:0];

  char v8 = [(ASCLockupPresenter *)self view];
  objc_msgSend(v8, "setPrefersRightToLeftLayout:", -[ASCLockupPresenter prefersRightToLeftViewLayout](self, "prefersRightToLeftViewLayout"));

  id v9 = [(ASCLockupPresenter *)self view];
  [v9 setBadge:0];

  id v10 = [(ASCLockupPresenter *)self view];
  [v10 setLoading:1];

  id v13 = +[ASCOfferMetadata placeholderMetadata];
  id v11 = [[ASCLocalOffer alloc] initWithMetadata:v13 action:0];
  id v12 = [(ASCLockupPresenter *)self offerPresenter];
  [v12 setOffer:v11];
}

- (void)clearContent
{
  char v3 = [(ASCLockupPresenter *)self offerPresenter];
  [v3 setOffer:0];

  objc_super v4 = [(ASCLockupPresenter *)self metricsPresenter];
  [v4 setModel:0];

  v5 = [(ASCLockupPresenter *)self view];
  [v5 setIconImage:0 withDecoration:@"none"];

  BOOL v6 = [(ASCLockupPresenter *)self view];
  [v6 setHeading:0];

  id v7 = [(ASCLockupPresenter *)self view];
  [v7 setTitle:0];

  char v8 = [(ASCLockupPresenter *)self view];
  [v8 setSubtitle:0];

  id v9 = [(ASCLockupPresenter *)self view];
  [v9 setBadge:0];

  id v10 = [(ASCLockupPresenter *)self view];
  [v10 setLoading:0];
}

- (void)reloadDefaultContent
{
  char v3 = [(ASCLockupPresenter *)self request];
  if (v3 || ([(ASCLockupPresenter *)self lockup], (char v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    objc_super v4 = [(ASCLockupPresenter *)self pendingRequestedLockup];

    if (!v4)
    {
      if ([(ASCLockupPresenter *)self showsPlaceholderContent])
      {
        [(ASCLockupPresenter *)self showPlaceholderContent];
      }
      else
      {
        [(ASCLockupPresenter *)self clearContent];
      }
    }
  }
}

- (void)retryRequestIfNeeded:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(ASCLockupPresenter *)self request];
  if (!v5) {
    goto LABEL_7;
  }
  BOOL v6 = (void *)v5;
  uint64_t v7 = [(ASCLockupPresenter *)self pendingRequestedLockup];
  if (!v7)
  {

    goto LABEL_7;
  }
  char v8 = (void *)v7;
  id v9 = [(ASCLockupPresenter *)self pendingRequestedLockup];
  int v10 = objc_msgSend(v9, "asc_isCanceledOrPending");

  if (v10)
  {
LABEL_7:
    v4[2](v4, 0);
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke;
  v19[3] = &unk_1E645D710;
  v19[4] = self;
  id v11 = (void (**)(void))MEMORY[0x1C8768F90](v19);
  id v12 = [(ASCLockupPresenter *)self group];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v14 = [(ASCLockupPresenter *)self group];
    [v13 postNotificationName:@"ASCLockupPresenterRetryGroupNotification" object:v14];

    v11[2](v11);
    v4[2](v4, 1);
  }
  else
  {
    id v15 = [(ASCLockupPresenter *)self pendingRequestedLockup];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke_2;
    v16[3] = &unk_1E645E078;
    v16[4] = self;
    v17 = v11;
    v18 = v4;
    [v15 resultWithCompletion:v16];
  }
LABEL_8:
}

void __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) metricsPresenter];
  [v1 viewDidRetryFailedRequest];
}

uint64_t __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 0;
  }
  if (!v4)
  {
    uint64_t v5 = +[ASCLockupPresenter log]();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Retrying failed request", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) performLockupFetch];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)performLockupFetch
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(ASCLockupPresenter *)self pendingRequestedLockup];
  if (v4)
  {
    uint64_t v5 = +[ASCLockupPresenter log]();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Canceling previous request", buf, 0xCu);
    }

    [v4 cancel];
    [(ASCLockupPresenter *)self setPendingRequestedLockup:0];
  }
  uint64_t v6 = [(ASCLockupPresenter *)self request];
  if (!v6)
  {
    id v11 = [(ASCLockupPresenter *)self view];
    [v11 setLoading:0];

    [(ASCLockupPresenter *)self reloadDefaultContent];
    goto LABEL_15;
  }
  [(ASCLockupPresenter *)self requestWillFetchLockup:v6];
  uint64_t v7 = [(ASCLockupPresenter *)self group];
  if (v7)
  {
    v2 = [v6 context];
    if ((ASCLockupContextIsContingentPricingContext(v2, v8) & 1) == 0)
    {
      uint64_t v9 = [(ASCLockupPresenter *)self group];
      uint64_t v10 = [v9 lockupWithRequest:v6];

LABEL_11:
      goto LABEL_12;
    }
  }
  id v12 = [(ASCLockupPresenter *)self context];
  id v13 = [v12 lockupFetcher];
  uint64_t v10 = [v13 lockupWithRequest:v6];

  if (v7) {
    goto LABEL_11;
  }
LABEL_12:

  [(ASCLockupPresenter *)self setPendingRequestedLockup:v10];
  id v14 = +[ASCLockupPresenter log]();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl(&dword_1C2B8D000, v14, OS_LOG_TYPE_INFO, "%{public}@: Started new request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __40__ASCLockupPresenter_performLockupFetch__block_invoke;
  v19[3] = &unk_1E645E0A0;
  objc_copyWeak(&v21, (id *)buf);
  id v15 = v6;
  id v20 = v15;
  [v10 addSuccessBlock:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__ASCLockupPresenter_performLockupFetch__block_invoke_2;
  v16[3] = &unk_1E645E0C8;
  objc_copyWeak(&v18, (id *)buf);
  id v17 = v15;
  [v10 addErrorBlock:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

LABEL_15:
}

void __40__ASCLockupPresenter_performLockupFetch__block_invoke(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained request:*(void *)(a1 + 32) didCompleteWithLockup:v4];
}

void __40__ASCLockupPresenter_performLockupFetch__block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained request:*(void *)(a1 + 32) didFailWithError:v4];
}

- (void)performIconFetch
{
  char v3 = [(ASCLockupPresenter *)self lockup];
  id v4 = [v3 icon];

  if (v4)
  {
    uint64_t v5 = [v4 decoration];
    int v6 = [v5 isEqualToString:@"none"];

    uint64_t v7 = [(ASCLockupPresenter *)self view];
    if (v6) {
      +[ASCLockupPresenter iconPlaceholderDecoration]();
    }
    else {
    uint64_t v9 = [v4 decoration];
    }
    [v7 setIconImage:0 withDecoration:v9];

    uint64_t v10 = [(ASCLockupPresenter *)self pendingViewRender];

    if (v10)
    {
      id v11 = [(ASCLockupPresenter *)self pendingViewRender];
      +[ASCViewRender resourceRequestDidBeginWithTag:](ASCViewRender, "resourceRequestDidBeginWithTag:", [v11 primaryTag]);
    }
    id v12 = [(ASCLockupPresenter *)self view];
    [v12 preferredIconSize];
    double v14 = v13;
    double v16 = v15;

    id v17 = [(ASCLockupPresenter *)self context];
    id v18 = [v17 artworkFetcher];
    v19 = objc_msgSend(v18, "imageForContentsOfArtwork:withSize:", v4, v14, v16);

    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __38__ASCLockupPresenter_performIconFetch__block_invoke;
    v24[3] = &unk_1E645E0F0;
    objc_copyWeak(&v26, &location);
    id v20 = v4;
    id v25 = v20;
    [v19 addSuccessBlock:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__ASCLockupPresenter_performIconFetch__block_invoke_2;
    v21[3] = &unk_1E645E0C8;
    objc_copyWeak(&v23, &location);
    id v22 = v20;
    [v19 addErrorBlock:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    int v8 = [(ASCLockupPresenter *)self view];
    [v8 setIconImage:0 withDecoration:@"none"];

    [(ASCLockupPresenter *)self endViewRender];
  }
}

void __38__ASCLockupPresenter_performIconFetch__block_invoke(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained iconArtwork:*(void *)(a1 + 32) didFetchImage:v4];
}

void __38__ASCLockupPresenter_performIconFetch__block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained iconArtwork:*(void *)(a1 + 32) didFailFetchWithError:v4];
}

- (void)performFollowUpWork:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)requestWillFetchLockup:(id)a3
{
  [(ASCLockupPresenter *)self beginViewRender];
  id v4 = [(ASCLockupPresenter *)self lockup];

  if (!v4)
  {
    uint64_t v5 = [(ASCLockupPresenter *)self view];
    uint64_t v7 = ASCLocalizedString(@"LOADING", v6);
    [v5 setTitle:v7];

    [(ASCLockupPresenter *)self showPlaceholderContent];
  }
  id v8 = [(ASCLockupPresenter *)self observer];
  [v8 lockupPresenterDidBeginRequest];
}

- (void)request:(id)a3 didCompleteWithLockup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__ASCLockupPresenter_request_didCompleteWithLockup___block_invoke;
  v10[3] = &unk_1E645D8F8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ASCLockupPresenter *)self performFollowUpWork:v10];
}

void __52__ASCLockupPresenter_request_didCompleteWithLockup___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) request];
  char v3 = v2;
  id v4 = *(void **)(a1 + 40);
  if (v2) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {

    if (v3 == v4)
    {
LABEL_10:
      id v9 = +[ASCLockupPresenter log]();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v14 = 138543362;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1C2B8D000, v9, OS_LOG_TYPE_INFO, "%{public}@: Completed request", (uint8_t *)&v14, 0xCu);
      }

      id v11 = [*(id *)(a1 + 32) view];
      [v11 setLoading:0];

      id v12 = [*(id *)(a1 + 32) pendingViewRender];

      if (v12)
      {
        double v13 = [*(id *)(a1 + 32) pendingViewRender];
        +[ASCViewRender rootViewModelPresentWithTag:](ASCViewRender, "rootViewModelPresentWithTag:", [v13 primaryTag]);
      }
      [*(id *)(a1 + 32) setLockup:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) setPendingRequestedLockup:0];
      id v6 = [*(id *)(a1 + 32) observer];
      [v6 lockupPresenterDidFinishRequest];
      goto LABEL_15;
    }
  }
  else
  {
    char v8 = [v2 isEqual:*(void *)(a1 + 40)];

    if (v8) {
      goto LABEL_10;
    }
  }
  id v6 = +[ASCLockupPresenter log]();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v14 = 138543362;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1C2B8D000, v6, OS_LOG_TYPE_INFO, "%{public}@: Ignoring loaded lockup for mismatched request", (uint8_t *)&v14, 0xCu);
  }
LABEL_15:
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v9 = [v7 code];

    if (v9 == 3072) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ASCLockupPresenter_request_didFailWithError___block_invoke;
  v10[3] = &unk_1E645D8F8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  [(ASCLockupPresenter *)self performFollowUpWork:v10];

LABEL_6:
}

void __47__ASCLockupPresenter_request_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  char v3 = [*(id *)(a1 + 32) request];
  id v4 = v3;
  BOOL v5 = (void *)v2[1];
  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {

    if (v4 == v5)
    {
LABEL_10:
      uint64_t v10 = +[ASCLockupPresenter log]();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __47__ASCLockupPresenter_request_didFailWithError___block_invoke_cold_1(v2, a1, v10);
      }

      id v11 = [*(id *)(a1 + 32) view];
      [v11 setLoading:0];

      id v12 = [*(id *)(a1 + 32) offerPresenter];
      [v12 setOffer:0];

      [*(id *)(a1 + 32) setLockup:0];
      [*(id *)(a1 + 32) setPendingViewRender:0];
      id v7 = +[ASCImageRenderer systemImageNamed:@"arrow.counterclockwise.circle" compatibleWithTraitCollection:0];
      double v13 = [*(id *)(a1 + 32) view];
      int v14 = +[ASCLockupPresenter iconPlaceholderDecoration]();
      [v13 setIconImage:v7 withDecoration:v14];

      uint64_t v15 = [*(id *)(a1 + 32) view];
      [v15 setHeading:0];

      uint64_t v16 = [*(id *)(a1 + 32) view];
      [v16 setTitle:0];

      id v17 = [*(id *)(a1 + 32) view];
      id v18 = ASCLocalizedPlatformString(@"VIEW_ERROR");
      [v17 setSubtitle:v18];

      v19 = [*(id *)(a1 + 32) view];
      objc_msgSend(v19, "setPrefersRightToLeftLayout:", objc_msgSend(*(id *)(a1 + 32), "prefersRightToLeftViewLayout"));

      id v20 = [*(id *)(a1 + 32) observer];
      [v20 lockupPresenterDidFailRequestWithError:*(void *)(a1 + 48)];

      id v21 = [*(id *)(a1 + 32) metricsPresenter];
      [v21 viewDidFailRequest:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];

      goto LABEL_13;
    }
  }
  else
  {
    char v9 = [v3 isEqual:v2[1]];

    if (v9) {
      goto LABEL_10;
    }
  }
  id v7 = +[ASCLockupPresenter log]();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *v2;
    int v22 = 138543362;
    uint64_t v23 = v8;
    _os_log_impl(&dword_1C2B8D000, v7, OS_LOG_TYPE_INFO, "%{public}@: Ignoring load error for mismatched request", (uint8_t *)&v22, 0xCu);
  }
LABEL_13:
}

- (void)iconArtwork:(id)a3 didFetchImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__ASCLockupPresenter_iconArtwork_didFetchImage___block_invoke;
  v10[3] = &unk_1E645D8F8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ASCLockupPresenter *)self performFollowUpWork:v10];
}

void __48__ASCLockupPresenter_iconArtwork_didFetchImage___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) lockup];
  char v3 = [v2 icon];
  id v4 = v3;
  BOOL v5 = *(void **)(a1 + 40);
  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    char v7 = v3 == v5;
  }
  else {
    char v7 = objc_msgSend(v3, "isEqual:");
  }

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) view];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [*(id *)(a1 + 40) decoration];
    [v8 setIconImage:v9 withDecoration:v10];

    id v11 = [*(id *)(a1 + 32) pendingViewRender];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) pendingViewRender];
      +[ASCViewRender resourceRequestDidEndWithTag:](ASCViewRender, "resourceRequestDidEndWithTag:", [v12 primaryTag]);
    }
    double v13 = *(void **)(a1 + 32);
    [v13 endViewRender];
  }
  else
  {
    int v14 = +[ASCLockupPresenter log]();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_1C2B8D000, v14, OS_LOG_TYPE_INFO, "%{public}@: Ignoring icon for mismatched lockup", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)iconArtwork:(id)a3 didFailFetchWithError:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ASCLockupPresenter_iconArtwork_didFailFetchWithError___block_invoke;
  v7[3] = &unk_1E645D920;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(ASCLockupPresenter *)self performFollowUpWork:v7];
}

void __56__ASCLockupPresenter_iconArtwork_didFailFetchWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) lockup];
  char v3 = [v2 icon];
  id v4 = v3;
  id v5 = *(void **)(a1 + 40);
  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    char v7 = v3 == v5;
  }
  else {
    char v7 = objc_msgSend(v3, "isEqual:");
  }

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    [v8 endViewRender];
  }
  else
  {
    uint64_t v9 = +[ASCLockupPresenter log]();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1C2B8D000, v9, OS_LOG_TYPE_INFO, "%{public}@: Ignoring icon for mismatched lockup", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)beginViewRender
{
  char v3 = [(ASCLockupPresenter *)self request];

  if (v3)
  {
    id v4 = [(ASCLockupPresenter *)self context];
    id v5 = [v4 lockupFetcher];
    BOOL v6 = [(ASCLockupPresenter *)self request];
    uint64_t v7 = [v5 loadedLockupWithRequest:v6];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [(ASCLockupPresenter *)self group];
      uint64_t v10 = [v9 prefetchSpansIfLoaded];

      if (!v10) {
        return;
      }
    }
    else
    {
    }
    int v11 = objc_alloc_init(ASCSignpostSpan);
    [(ASCLockupPresenter *)self setPendingViewRender:v11];

    uint64_t v12 = [(ASCLockupPresenter *)self pendingViewRender];
    uint64_t v13 = [(ASCLockupPresenter *)self request];
    int v14 = [v13 id];
    [v12 addSupplementaryTag:ASCSignpostTagFromID(v14)];

    uint64_t v15 = [(ASCLockupPresenter *)self pendingViewRender];
    [v15 beginEmitting];

    id v16 = [(ASCLockupPresenter *)self pendingViewRender];
    +[ASCViewRender pageRequestedWithTag:](ASCViewRender, "pageRequestedWithTag:", [v16 primaryTag]);
  }
}

- (void)endViewRender
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = [(ASCLockupPresenter *)self pendingViewRender];

  if (v3)
  {
    id v4 = [(ASCLockupPresenter *)self pendingViewRender];
    +[ASCViewRender pageUserReadyWithTag:](ASCViewRender, "pageUserReadyWithTag:", [v4 primaryTag]);

    id v5 = [(ASCLockupPresenter *)self pendingViewRender];
    [v5 endEmitting];

    BOOL v6 = [(ASCLockupPresenter *)self lockup];
    uint64_t v7 = [v6 signpostTags];

    if (v7)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
            int v14 = [(ASCLockupPresenter *)self pendingViewRender];
            objc_msgSend(v14, "addSupplementaryTag:", objc_msgSend(v13, "unsignedLongLongValue"));

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v10);
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = [(ASCLockupPresenter *)self pendingViewRender];
    [v15 addObject:v16];

    uint64_t v17 = [(ASCLockupPresenter *)self group];
    uint64_t v18 = [v17 prefetchSpansIfLoaded];

    if (v18)
    {
      v19 = [(ASCLockupPresenter *)self group];
      id v20 = [v19 prefetchSpansIfLoaded];
      [v15 addObjectsFromArray:v20];
    }
    uint64_t v21 = [(ASCLockupPresenter *)self viewRenderSpanProvider];
    int v22 = (void *)v21;
    if (v21)
    {
      uint64_t v23 = (*(void (**)(uint64_t))(v21 + 16))(v21);
      [v15 addObjectsFromArray:v23];
    }
    uint64_t v24 = [[ASCSignpostPredicate alloc] initWithSpans:v15];
    id v25 = [(ASCLockupPresenter *)self metricsPresenter];
    [v25 viewDidEndRenderWithPredicate:v24];

    [(ASCLockupPresenter *)self setPendingViewRender:0];
  }
}

- (void)daemonDidRebootstrap:(id)a3
{
  id v4 = [(ASCLockupPresenter *)self request];

  if (v4)
  {
    [(ASCLockupPresenter *)self setLockup:0];
    [(ASCLockupPresenter *)self performLockupFetch];
  }
}

- (void)retryGroup:(id)a3
{
  uint64_t v4 = [(ASCLockupPresenter *)self request];
  if (v4)
  {
    id v10 = (id)v4;
    uint64_t v5 = [(ASCLockupPresenter *)self pendingRequestedLockup];
    if (v5)
    {
      BOOL v6 = (void *)v5;
      uint64_t v7 = [(ASCLockupPresenter *)self pendingRequestedLockup];
      char v8 = objc_msgSend(v7, "asc_isCanceledOrPending");

      if ((v8 & 1) == 0)
      {
        uint64_t v9 = [(ASCLockupPresenter *)self pendingRequestedLockup];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __33__ASCLockupPresenter_retryGroup___block_invoke;
        v11[3] = &unk_1E645E118;
        v11[4] = self;
        [v9 resultWithCompletion:v11];
      }
    }
    else
    {
    }
  }
}

uint64_t __33__ASCLockupPresenter_retryGroup___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a2 && a3)
  {
    uint64_t v3 = result;
    uint64_t v4 = +[ASCLockupPresenter log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(v3 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "%{public}@: Retrying failed request as part of group", (uint8_t *)&v6, 0xCu);
    }

    return [*(id *)(v3 + 32) performLockupFetch];
  }
  return result;
}

- (id)description
{
  uint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  uint64_t v4 = [(ASCLockupPresenter *)self group];
  [(ASCDescriber *)v3 addObject:v4 withName:@"group"];

  uint64_t v5 = [(ASCLockupPresenter *)self lockup];
  int v6 = [v5 id];
  [(ASCDescriber *)v3 addObject:v6 withName:@"lockup.id"];

  uint64_t v7 = [(ASCLockupPresenter *)self request];
  uint64_t v8 = [v7 id];
  [(ASCDescriber *)v3 addObject:v8 withName:@"request.id"];

  uint64_t v9 = [(ASCDescriber *)v3 finalizeDescription];

  return v9;
}

- (ASCLockupPresenterObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (ASCLockupPresenterObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (ASCLockupViewGroup)group
{
  return self->_group;
}

- (ASCLockupRequest)request
{
  return self->_request;
}

- (id)viewRenderSpanProvider
{
  return self->_viewRenderSpanProvider;
}

- (void)setViewRenderSpanProvider:(id)a3
{
}

- (ASCLockupPresenterView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (ASCLockupPresenterView *)WeakRetained;
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCOfferPresenter)offerPresenter
{
  return self->_offerPresenter;
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCCustomLockupContentProvider)customContentProvider
{
  return self->_customContentProvider;
}

- (AMSMutablePromise)pendingRequestedLockup
{
  return self->_pendingRequestedLockup;
}

- (void)setPendingRequestedLockup:(id)a3
{
}

- (ASCSignpostSpan)pendingViewRender
{
  return self->_pendingViewRender;
}

- (void)setPendingViewRender:(id)a3
{
}

- (BOOL)showsPlaceholderContent
{
  return self->_showsPlaceholderContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingViewRender, 0);
  objc_storeStrong((id *)&self->_pendingRequestedLockup, 0);
  objc_storeStrong((id *)&self->_customContentProvider, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
  objc_storeStrong((id *)&self->_offerPresenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_viewRenderSpanProvider, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_lockup, 0);

  objc_destroyWeak((id *)&self->_observer);
}

- (void)setGroup:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
}

void __47__ASCLockupPresenter_request_didFailWithError___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = AMSLogableError();
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1C2B8D000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Request did fail, reason: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end