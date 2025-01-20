@interface ASCAppearMetricsPresenter
+ (OS_os_log)log;
- (ASCAppearMetricsPresenter)initWithView:(id)a3;
- (ASCAppearMetricsPresenter)initWithView:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (ASCMetrics)metrics;
- (ASCMetricsActivity)activity;
- (ASCMetricsScrollObserver)scrollObserver;
- (ASCViewModel)model;
- (BOOL)canAppear;
- (BOOL)canDisappear;
- (BOOL)isAppeared;
- (BOOL)isEnabled;
- (BOOL)isEnteringBackground;
- (BOOL)isEnteringForeground;
- (BOOL)isSettingModel;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (UIView)view;
- (void)appearIfNeeded;
- (void)dealloc;
- (void)disappearIfNeeded;
- (void)hostDidEnterBackground;
- (void)hostWillEnterForeground;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActivity:(id)a3;
- (void)setAppeared:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnteringBackground:(BOOL)a3;
- (void)setEnteringForeground:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setScrollObserver:(id)a3;
- (void)setSettingModel:(BOOL)a3;
- (void)viewDidAction;
- (void)viewDidEndRenderWithPredicate:(id)a3;
- (void)viewDidFailRequest:(id)a3 withError:(id)a4;
- (void)viewDidMoveToWindow;
- (void)viewDidRetryFailedRequest;
- (void)viewDidSetHidden;
@end

@implementation ASCAppearMetricsPresenter

+ (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)log_log;

  return (OS_os_log *)v2;
}

uint64_t __32__ASCAppearMetricsPresenter_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCAppearMetricsPresenter");

  return MEMORY[0x1F41817F8]();
}

- (ASCAppearMetricsPresenter)initWithView:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASCAppearMetricsPresenter;
  v11 = [(ASCAppearMetricsPresenter *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_view, v8);
    objc_storeStrong((id *)&v12->_metrics, a4);
    v13 = objc_alloc_init(ASCMetricsActivity);
    activity = v12->_activity;
    v12->_activity = v13;

    *(_WORD *)&v12->_enabled = 1;
    objc_storeStrong((id *)&v12->_notificationCenter, a5);
    [(NSNotificationCenter *)v12->_notificationCenter addObserver:v12 selector:sel_hostDidEnterBackground name:*MEMORY[0x1E4F28278] object:0];
    [(NSNotificationCenter *)v12->_notificationCenter addObserver:v12 selector:sel_hostWillEnterForeground name:*MEMORY[0x1E4F28280] object:0];
    uint64_t v15 = *MEMORY[0x1E4FB2730];
    [(NSNotificationCenter *)v12->_notificationCenter addObserver:v12 selector:sel_hostDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];
    [(NSNotificationCenter *)v12->_notificationCenter addObserver:v12 selector:sel_hostWillEnterForeground name:v15 object:0];
  }

  return v12;
}

- (ASCAppearMetricsPresenter)initWithView:(id)a3
{
  id v4 = a3;
  v5 = +[ASCMetrics sharedMetrics];
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7 = [(ASCAppearMetricsPresenter *)self initWithView:v4 metrics:v5 notificationCenter:v6];

  return v7;
}

- (void)dealloc
{
  v3 = [(ASCAppearMetricsPresenter *)self notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCAppearMetricsPresenter;
  [(ASCAppearMetricsPresenter *)&v4 dealloc];
}

- (void)setScrollObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = (ASCMetricsScrollObserver *)a3;
  v6 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1C2B8D000, v6, OS_LOG_TYPE_INFO, "%{public}@ set scroll observer: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  p_scrollObserver = &self->_scrollObserver;
  id v8 = self->_scrollObserver;
  id v9 = v8;
  if (v5 && v8)
  {
    char v10 = [(ASCMetricsScrollObserver *)v8 isEqual:v5];

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v9 == v5) {
      goto LABEL_14;
    }
  }
  if (*p_scrollObserver) {
    [(ASCMetricsScrollObserver *)*p_scrollObserver removeDelegate:self];
  }
  objc_storeStrong((id *)&self->_scrollObserver, a3);
  if (v5)
  {
    uint64_t v11 = [(ASCAppearMetricsPresenter *)self model];
    if (!v11
      || (v12 = (void *)v11,
          [(ASCAppearMetricsPresenter *)self model],
          v13 = objc_claimAutoreleasedReturnValue(),
          BOOL v14 = [(ASCMetricsScrollObserver *)v5 hasModelAppeared:v13],
          v13,
          v12,
          !v14))
    {
      [(ASCMetricsScrollObserver *)v5 addDelegate:self];
    }
  }
LABEL_14:
}

- (void)setModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (ASCViewModel *)a3;
  v5 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543618;
    v18 = self;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@ set model: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  v6 = self->_model;
  v7 = v6;
  if (v4 && v6)
  {
    char v8 = [(ASCViewModel *)v6 isEqual:v4];

    if (v8) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v7 == v4) {
      goto LABEL_22;
    }
  }
  id v9 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1C2B8D000, v9, OS_LOG_TYPE_INFO, "%{public}@ begin setting model", (uint8_t *)&v17, 0xCu);
  }

  [(ASCAppearMetricsPresenter *)self setSettingModel:1];
  if (self->_model) {
    [(ASCAppearMetricsPresenter *)self disappearIfNeeded];
  }
  char v10 = (ASCViewModel *)[(ASCViewModel *)v4 copyWithZone:0];
  model = self->_model;
  self->_model = v10;

  if (v4)
  {
    uint64_t v12 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    if (v12)
    {
      v13 = (void *)v12;
      BOOL v14 = [(ASCAppearMetricsPresenter *)self isAppeared];

      if (v14)
      {
        int v15 = +[ASCAppearMetricsPresenter log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v17 = 138543362;
          v18 = self;
          _os_log_impl(&dword_1C2B8D000, v15, OS_LOG_TYPE_INFO, "%{public}@ model id changed, reset appearance flag", (uint8_t *)&v17, 0xCu);
        }

        [(ASCAppearMetricsPresenter *)self setAppeared:0];
      }
    }
    [(ASCAppearMetricsPresenter *)self appearIfNeeded];
  }
  v16 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1C2B8D000, v16, OS_LOG_TYPE_INFO, "%{public}@ end setting model", (uint8_t *)&v17, 0xCu);
  }

  [(ASCAppearMetricsPresenter *)self setSettingModel:0];
LABEL_22:
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  objc_super v4 = [(ASCAppearMetricsPresenter *)self model];
  v5 = [v4 id];
  [(ASCDescriber *)v3 addObject:v5 withName:@"model.id"];

  [(ASCDescriber *)v3 addBool:[(ASCAppearMetricsPresenter *)self isAppeared] withName:@"isAppeared"];
  v6 = [(ASCAppearMetricsPresenter *)self view];
  v7 = [v6 window];
  [(ASCDescriber *)v3 addBool:v7 != 0 withName:@"isInWindow"];

  char v8 = [(ASCAppearMetricsPresenter *)self view];
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", [v8 isHidden], @"isHidden");

  id v9 = [(ASCAppearMetricsPresenter *)self scrollObserver];
  [(ASCDescriber *)v3 addBool:v9 != 0 withName:@"isInScrollView"];

  char v10 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v10;
}

- (void)hostDidEnterBackground
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ host did enter background", (uint8_t *)&v4, 0xCu);
  }

  [(ASCAppearMetricsPresenter *)self setEnteringBackground:1];
  [(ASCAppearMetricsPresenter *)self disappearIfNeeded];
  [(ASCAppearMetricsPresenter *)self setEnteringBackground:0];
}

- (void)hostWillEnterForeground
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ host will enter foreground", (uint8_t *)&v4, 0xCu);
  }

  [(ASCAppearMetricsPresenter *)self setEnteringForeground:1];
  [(ASCAppearMetricsPresenter *)self appearIfNeeded];
  [(ASCAppearMetricsPresenter *)self setEnteringForeground:0];
}

- (void)viewDidMoveToWindow
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [(ASCAppearMetricsPresenter *)self view];
    v5 = [v4 window];
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    int v15 = v5;
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ did move to window %{public}@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v6 = [(ASCAppearMetricsPresenter *)self view];
  v7 = [v6 window];

  if (v7)
  {
    char v8 = [(ASCAppearMetricsPresenter *)self view];
    id v9 = objc_msgSend(v8, "asc_nearestSuperviewPassingTest:", &__block_literal_global_28);

    char v10 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2112;
      int v15 = v9;
      _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "%{public}@ enclosing scroll view is %@", (uint8_t *)&v12, 0x16u);
    }

    if (v9)
    {
      uint64_t v11 = +[ASCMetricsScrollObserver observerForScrollView:v9];
      [(ASCAppearMetricsPresenter *)self setScrollObserver:v11];
    }
    else
    {
      [(ASCAppearMetricsPresenter *)self setScrollObserver:0];
    }
    [(ASCAppearMetricsPresenter *)self appearIfNeeded];
  }
  else
  {
    [(ASCAppearMetricsPresenter *)self setScrollObserver:0];
    [(ASCAppearMetricsPresenter *)self disappearIfNeeded];
  }
}

uint64_t __48__ASCAppearMetricsPresenter_viewDidMoveToWindow__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidSetHidden
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [(ASCAppearMetricsPresenter *)self view];
    int v7 = 138543618;
    char v8 = self;
    __int16 v9 = 1026;
    int v10 = [v4 isHidden];
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ set hidden %{public}d", (uint8_t *)&v7, 0x12u);
  }
  v5 = [(ASCAppearMetricsPresenter *)self view];
  int v6 = [v5 isHidden];

  if (v6) {
    [(ASCAppearMetricsPresenter *)self disappearIfNeeded];
  }
  else {
    [(ASCAppearMetricsPresenter *)self appearIfNeeded];
  }
}

- (void)viewDidAction
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(ASCAppearMetricsPresenter *)self model];
  int v4 = [v3 metrics];

  v5 = +[ASCAppearMetricsPresenter log];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v11 = 138543362;
      int v12 = self;
      _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@ did action", (uint8_t *)&v11, 0xCu);
    }

    v5 = [(ASCAppearMetricsPresenter *)self metrics];
    int v7 = [(ASCAppearMetricsPresenter *)self model];
    char v8 = [v7 metrics];
    __int16 v9 = [(ASCAppearMetricsPresenter *)self activity];
    id v10 = (id)[v5 processViewMetrics:v8 atInvocationPoint:@"click" withActivity:v9];
  }
  else if (v6)
  {
    int v11 = 138543362;
    int v12 = self;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@ has no metrics for action", (uint8_t *)&v11, 0xCu);
  }
}

- (void)viewDidEndRenderWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = [(ASCAppearMetricsPresenter *)self model];

  if (!v5)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v17 initWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot end view render without a model" userInfo:0]);
  }
  BOOL v6 = [(ASCAppearMetricsPresenter *)self scrollObserver];

  if (v6)
  {
    int v7 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    char v8 = [(ASCAppearMetricsPresenter *)self model];
    char v9 = [v7 hasModelRendered:v8];

    if (v9) {
      goto LABEL_10;
    }
    id v10 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    int v11 = [(ASCAppearMetricsPresenter *)self model];
    [v10 modelDidRender:v11];
  }
  int v12 = [(ASCAppearMetricsPresenter *)self model];
  uint64_t v13 = [v12 metrics];

  if (v13)
  {
    __int16 v14 = [(ASCAppearMetricsPresenter *)self metrics];
    id v15 = (id)[v14 processViewRenderWithPredicate:v4];
  }
  else
  {
    uint64_t v16 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ASCAppearMetricsPresenter viewDidEndRenderWithPredicate:]((uint64_t)self, v16);
    }
  }
LABEL_10:
}

- (void)viewDidFailRequest:(id)a3 withError:(id)a4
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 domain];
  if (![v8 isEqualToString:*MEMORY[0x1E4F281F8]] || objc_msgSend(v7, "code") < 4096)
  {

    goto LABEL_7;
  }
  uint64_t v9 = [v7 code];

  if (v9 > 4224)
  {
LABEL_7:
    v22[0] = @"eventType";
    v22[1] = @"page";
    v23[0] = @"page";
    v23[1] = @"Error";
    v23[2] = @"AppStoreError";
    v22[2] = @"pageType";
    v22[3] = @"pageId";
    int v11 = [v6 id];
    int v12 = [v11 stringValue];
    v23[3] = v12;
    v22[4] = @"pageContext";
    uint64_t v13 = [v6 context];
    v23[4] = v13;
    v22[5] = @"errorDescription";
    __int16 v14 = [v7 localizedDescription];
    v23[5] = v14;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];

    id v15 = [ASCMetricsData alloc];
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] set];
    id v17 = [MEMORY[0x1E4F1CAD0] set];
    v18 = [(ASCMetricsData *)v15 initWithTopic:0 shouldFlush:0 fields:v10 includingFields:v16 excludingFields:v17];

    __int16 v19 = [(ASCAppearMetricsPresenter *)self metrics];
    v20 = [(ASCAppearMetricsPresenter *)self activity];
    id v21 = (id)[v19 processMetricsData:v18 withActivity:v20];

    goto LABEL_8;
  }
  id v10 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ASCAppearMetricsPresenter viewDidFailRequest:withError:]((uint64_t)self, (uint64_t)v7, v10);
  }
LABEL_8:
}

- (void)viewDidRetryFailedRequest
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    int v12 = self;
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ did retry failed request", (uint8_t *)&v11, 0xCu);
  }

  id v4 = [ASCMetricsData alloc];
  v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [(ASCMetricsData *)v4 initWithTopic:0 shouldFlush:0 fields:&unk_1F1E15BA0 includingFields:v5 excludingFields:v6];

  char v8 = [(ASCAppearMetricsPresenter *)self metrics];
  uint64_t v9 = [(ASCAppearMetricsPresenter *)self activity];
  id v10 = (id)[v8 processMetricsData:v7 withActivity:v9];
}

- (BOOL)canAppear
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![(ASCAppearMetricsPresenter *)self isEnabled])
  {
    v3 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v38 = 138543362;
      v39 = self;
      id v4 = "%{public}@ can appear: no, reason: not enabled";
      goto LABEL_7;
    }
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  if ([(ASCAppearMetricsPresenter *)self isAppeared])
  {
    v3 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v38 = 138543362;
      v39 = self;
      id v4 = "%{public}@ can appear: no, reason: already appeared";
LABEL_7:
      _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v38, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v7 = [(ASCAppearMetricsPresenter *)self model];
  char v8 = [v7 metrics];

  if (!v8)
  {
    v3 = +[ASCAppearMetricsPresenter log];
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    int v38 = 138543362;
    v39 = self;
    id v4 = "%{public}@ can appear: no, reason: no metrics";
    goto LABEL_7;
  }
  uint64_t v9 = [(ASCAppearMetricsPresenter *)self view];
  id v10 = [v9 window];

  if (!v10)
  {
    v3 = +[ASCAppearMetricsPresenter log];
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    int v38 = 138543362;
    v39 = self;
    id v4 = "%{public}@ can appear: no, reason: no window";
    goto LABEL_7;
  }
  int v11 = [(ASCAppearMetricsPresenter *)self view];
  int v12 = [v11 isHidden];

  if (v12)
  {
    v3 = +[ASCAppearMetricsPresenter log];
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    int v38 = 138543362;
    v39 = self;
    id v4 = "%{public}@ can appear: no, reason: is hidden";
    goto LABEL_7;
  }
  uint64_t v13 = [(ASCAppearMetricsPresenter *)self scrollObserver];

  if (v13)
  {
    __int16 v14 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    id v15 = [(ASCAppearMetricsPresenter *)self model];
    if ([v14 hasModelAppeared:v15]
      && ![(ASCAppearMetricsPresenter *)self isSettingModel])
    {
      BOOL v37 = [(ASCAppearMetricsPresenter *)self isEnteringForeground];

      if (!v37)
      {
        v3 = +[ASCAppearMetricsPresenter log];
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        int v38 = 138543362;
        v39 = self;
        id v4 = "%{public}@ can appear: no, reason: already appeared in scroll view";
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v16 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    [v16 visibleRect];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v25 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    v26 = [(ASCAppearMetricsPresenter *)self view];
    [v25 centerOfView:v26];
    v41.x = v27;
    v41.y = v28;
    v42.origin.x = v18;
    v42.origin.y = v20;
    v42.size.width = v22;
    v42.size.height = v24;
    BOOL v29 = CGRectContainsPoint(v42, v41);

    if (!v29)
    {
      v3 = +[ASCAppearMetricsPresenter log];
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      int v38 = 138543362;
      v39 = self;
      id v4 = "%{public}@ can appear: no, reason: model is not visible";
      goto LABEL_7;
    }
    v30 = [(ASCAppearMetricsPresenter *)self scrollObserver];
    [v30 contentSize];
    double v32 = v31;
    double v34 = v33;
    uint64_t v35 = MEMORY[0x1E4F1DB30];
    double v36 = *MEMORY[0x1E4F1DB30];

    if (v32 == v36 && v34 == *(double *)(v35 + 8))
    {
      v3 = +[ASCAppearMetricsPresenter log];
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      int v38 = 138543362;
      v39 = self;
      id v4 = "%{public}@ can appear: no, reason: scroll view content size is zero";
      goto LABEL_7;
    }
  }
  v3 = +[ASCAppearMetricsPresenter log];
  BOOL v5 = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v38 = 138543362;
    v39 = self;
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ can appear: yes", (uint8_t *)&v38, 0xCu);
  }
LABEL_9:

  return v5;
}

- (void)appearIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(ASCAppearMetricsPresenter *)self canAppear])
  {
    v3 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      __int16 v14 = self;
      _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@ did appear", (uint8_t *)&v13, 0xCu);
    }

    id v4 = [(ASCAppearMetricsPresenter *)self metrics];
    BOOL v5 = [(ASCAppearMetricsPresenter *)self model];
    id v6 = [v5 metrics];
    id v7 = [(ASCAppearMetricsPresenter *)self activity];
    id v8 = (id)[v4 processViewMetrics:v6 atInvocationPoint:@"appear" withActivity:v7];

    uint64_t v9 = [(ASCAppearMetricsPresenter *)self scrollObserver];

    if (v9)
    {
      id v10 = [(ASCAppearMetricsPresenter *)self scrollObserver];
      int v11 = [(ASCAppearMetricsPresenter *)self model];
      [v10 modelDidAppear:v11];

      int v12 = [(ASCAppearMetricsPresenter *)self scrollObserver];
      [v12 removeDelegate:self];
    }
    [(ASCAppearMetricsPresenter *)self setAppeared:1];
  }
}

- (BOOL)canDisappear
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(ASCAppearMetricsPresenter *)self isEnabled])
  {
    id v10 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      CGFloat v18 = self;
      int v11 = "%{public}@ can disappear: no, reason: not enabled";
      goto LABEL_21;
    }
LABEL_22:
    BOOL v12 = 0;
    goto LABEL_23;
  }
  if (![(ASCAppearMetricsPresenter *)self isAppeared])
  {
    id v10 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      CGFloat v18 = self;
      int v11 = "%{public}@ can disappear: no, reason: not appeared yet";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v3 = [(ASCAppearMetricsPresenter *)self model];
  id v4 = [v3 metrics];

  if (!v4)
  {
    id v10 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      CGFloat v18 = self;
      int v11 = "%{public}@ can disappear: no, reason: no metrics";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  BOOL v5 = [(ASCAppearMetricsPresenter *)self view];
  uint64_t v6 = [v5 window];
  if (!v6) {
    goto LABEL_8;
  }
  id v7 = (void *)v6;
  id v8 = [(ASCAppearMetricsPresenter *)self view];
  if (([v8 isHidden] & 1) != 0 || -[ASCAppearMetricsPresenter isSettingModel](self, "isSettingModel"))
  {

LABEL_8:
    goto LABEL_9;
  }
  BOOL v14 = [(ASCAppearMetricsPresenter *)self isEnteringBackground];

  if (!v14)
  {
    id v10 = +[ASCAppearMetricsPresenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = [(ASCAppearMetricsPresenter *)self isSettingModel];
      uint64_t v16 = [(ASCAppearMetricsPresenter *)self view];
      int v17 = 138543874;
      CGFloat v18 = self;
      __int16 v19 = 1026;
      BOOL v20 = v15;
      __int16 v21 = 1026;
      int v22 = [v16 isHidden];
      _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "%{public}@ can disappear: no, reason: is not setting model (%{public}d) and window is hidden (%{public}d)", (uint8_t *)&v17, 0x18u);
    }
    goto LABEL_22;
  }
LABEL_9:
  if ([(ASCAppearMetricsPresenter *)self isSettingModel])
  {
    uint64_t v9 = [(ASCAppearMetricsPresenter *)self scrollObserver];

    if (v9)
    {
      id v10 = +[ASCAppearMetricsPresenter log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v17 = 138543362;
        CGFloat v18 = self;
        int v11 = "%{public}@ can disappear: no, reason: is settings model and has scroll observer";
LABEL_21:
        _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, 0xCu);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  id v10 = +[ASCAppearMetricsPresenter log];
  BOOL v12 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    CGFloat v18 = self;
    _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "%{public}@ can disappear: yes", (uint8_t *)&v17, 0xCu);
  }
LABEL_23:

  return v12;
}

- (void)disappearIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ASCAppearMetricsPresenter *)self canDisappear];
  id v4 = +[ASCAppearMetricsPresenter log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138543362;
      BOOL v12 = self;
      _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "%{public}@ did disappear", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v6 = [(ASCAppearMetricsPresenter *)self metrics];
    id v7 = [(ASCAppearMetricsPresenter *)self model];
    id v8 = [v7 metrics];
    uint64_t v9 = [(ASCAppearMetricsPresenter *)self activity];
    id v10 = (id)[v6 processViewMetrics:v8 atInvocationPoint:@"disappear" withActivity:v9];

    [(ASCAppearMetricsPresenter *)self setAppeared:0];
  }
  else
  {
    if (v5)
    {
      int v11 = 138543362;
      BOOL v12 = self;
      _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "%{public}@ can't disappear", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[ASCAppearMetricsPresenter log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@ enclosing scroll view did scroll %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(ASCAppearMetricsPresenter *)self appearIfNeeded];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (ASCMetricsActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (ASCViewModel)model
{
  return self->_model;
}

- (ASCMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isAppeared
{
  return self->_appeared;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (BOOL)isSettingModel
{
  return self->_settingModel;
}

- (void)setSettingModel:(BOOL)a3
{
  self->_settingModel = a3;
}

- (ASCMetricsScrollObserver)scrollObserver
{
  return self->_scrollObserver;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)isEnteringBackground
{
  return self->_enteringBackground;
}

- (void)setEnteringBackground:(BOOL)a3
{
  self->_enteringBackground = a3;
}

- (BOOL)isEnteringForeground
{
  return self->_enteringForeground;
}

- (void)setEnteringForeground:(BOOL)a3
{
  self->_enteringForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_scrollObserver, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_destroyWeak((id *)&self->_view);
}

- (void)viewDidEndRenderWithPredicate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2B8D000, a2, OS_LOG_TYPE_ERROR, "%{public}@ cannot process view render for model with missing metrics data", (uint8_t *)&v2, 0xCu);
}

- (void)viewDidFailRequest:(os_log_t)log withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1C2B8D000, log, OS_LOG_TYPE_DEBUG, "%{public}@ not generating page event for %@", (uint8_t *)&v3, 0x16u);
}

@end