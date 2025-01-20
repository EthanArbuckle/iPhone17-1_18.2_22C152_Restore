@interface PHVideoOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isModeEnabled:(int64_t)a3;
- (BOOL)isShowingMode:(int64_t)a3;
- (BOOL)isShowingOverlay;
- (BOOL)isShowingOverlayForRemoteState;
- (BOOL)isShowingPippedIconViews;
- (BOOL)shouldShowIconViewsWhenPipped;
- (NSMutableArray)modesPriorityQueue;
- (PHVideoOverlayContentView)contentView;
- (PHVideoOverlayInsulatorView)insulatorView;
- (PHVideoOverlayViewControllerDelegate)delegate;
- (int64_t)currentVideoOverlayMode;
- (void)disableVideoOverlayModes;
- (void)handlePIPControllerStateDidChangeNotification:(id)a3;
- (void)hideVideoOverlayAnimated:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentVideoOverlayMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInsulatorView:(id)a3;
- (void)setModesPriorityQueue:(id)a3;
- (void)setVideoOverlayEnabled:(BOOL)a3 forMode:(int64_t)a4;
- (void)setVideoOverlayWithMode:(int64_t)a3 animated:(BOOL)a4;
- (void)showNextVideoOverlayMode;
- (void)showVideoOverlayWithContentView:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation PHVideoOverlayViewController

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)PHVideoOverlayViewController;
  [(PHVideoOverlayViewController *)&v26 viewDidLoad];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(PHVideoOverlayViewController *)self setModesPriorityQueue:v3];

  v4 = [(PHVideoOverlayViewController *)self view];
  [v4 setAlpha:0.0];

  v5 = objc_alloc_init(PHVideoOverlayInsulatorView);
  [(PHVideoOverlayViewController *)self setInsulatorView:v5];

  v6 = [(PHVideoOverlayViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(PHVideoOverlayViewController *)self insulatorView];
  [v15 setBounds:v8, v10, v12, v14];

  v16 = [(PHVideoOverlayViewController *)self view];
  [v16 center];
  double v18 = v17;
  double v20 = v19;
  v21 = [(PHVideoOverlayViewController *)self insulatorView];
  [v21 setCenter:v18, v20];

  v22 = [(PHVideoOverlayViewController *)self insulatorView];
  [v22 setAutoresizingMask:18];

  v23 = [(PHVideoOverlayViewController *)self view];
  v24 = [(PHVideoOverlayViewController *)self insulatorView];
  [v23 addSubview:v24];

  v25 = +[NSNotificationCenter defaultCenter];
  [v25 addObserver:self selector:"handlePIPControllerStateDidChangeNotification:" name:@"PHPIPControllerStateDidChangeNotification" object:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setVideoOverlayEnabled:(BOOL)a3 forMode:(int64_t)a4
{
  BOOL v5 = a3;
  double v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromBOOL();
    double v9 = +[NSNumber numberWithInteger:a4];
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    __int16 v25 = 2112;
    objc_super v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "enabled %@ for mode: %@", buf, 0x16u);
  }
  if (v5)
  {
    double v10 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
    double v11 = +[NSNumber numberWithInteger:a4];
    unsigned __int8 v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {
      double v13 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
      double v14 = +[NSNumber numberWithInteger:a4];
      [v13 addObject:v14];

      v15 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
      v16 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:1];
      v22 = v16;
      double v17 = +[NSArray arrayWithObjects:&v22 count:1];
      [v15 sortUsingDescriptors:v17];
    }
  }
  else if ([(PHVideoOverlayViewController *)self currentVideoOverlayMode] == a4 {
         && ([(PHVideoOverlayViewController *)self modesPriorityQueue],
  }
             double v18 = objc_claimAutoreleasedReturnValue(),
             id v19 = [v18 count],
             v18,
             v19 == (id)1))
  {
    [(PHVideoOverlayViewController *)self disableVideoOverlayModes];
  }
  else
  {
    double v20 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
    v21 = +[NSNumber numberWithInteger:a4];
    [v20 removeObject:v21];
  }
  [(PHVideoOverlayViewController *)self showNextVideoOverlayMode];
}

- (BOOL)isShowingMode:(int64_t)a3
{
  return [(PHVideoOverlayViewController *)self currentVideoOverlayMode] == a3;
}

- (BOOL)isModeEnabled:(int64_t)a3
{
  v4 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
  BOOL v5 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)isShowingOverlay
{
  return [(PHVideoOverlayViewController *)self currentVideoOverlayMode] != 0;
}

- (BOOL)isShowingOverlayForRemoteState
{
  if (![(PHVideoOverlayViewController *)self currentVideoOverlayMode]) {
    return 0;
  }
  if ((id)[(PHVideoOverlayViewController *)self currentVideoOverlayMode] != (id)6) {
    return 1;
  }
  id v3 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
  BOOL v4 = [v3 count] != (id)1;

  return v4;
}

- (void)showNextVideoOverlayMode
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
    int v10 = 138412290;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "queue: %@", (uint8_t *)&v10, 0xCu);
  }
  BOOL v5 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
  id v6 = [v5 count];

  if (v6)
  {
    double v7 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
    double v8 = [v7 lastObject];
    id v9 = [v8 integerValue];

    if ((id)[(PHVideoOverlayViewController *)self currentVideoOverlayMode] != v9) {
      [(PHVideoOverlayViewController *)self setVideoOverlayWithMode:v9 animated:[(PHVideoOverlayViewController *)self currentVideoOverlayMode] == 0];
    }
  }
  else
  {
    [(PHVideoOverlayViewController *)self hideVideoOverlayAnimated:1];
  }
}

- (void)setVideoOverlayWithMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(PHVideoOverlayViewController *)self setCurrentVideoOverlayMode:a3];
  id v6 = +[PHPIPController defaultPIPController];
  if ([v6 isPipped]) {
    unsigned int v7 = [(PHVideoOverlayViewController *)self shouldShowIconViewsWhenPipped];
  }
  else {
    unsigned int v7 = 0;
  }

  double v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithInteger:[(PHVideoOverlayViewController *)self currentVideoOverlayMode]];
    int v27 = 138412290;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "mode: %@", (uint8_t *)&v27, 0xCu);
  }
  switch([(PHVideoOverlayViewController *)self currentVideoOverlayMode])
  {
    case 0:
      [(PHVideoOverlayViewController *)self setContentView:0];
      goto LABEL_20;
    case 1:
      int v10 = objc_alloc_init(PHVideoOverlayContentView);
      goto LABEL_12;
    case 2:
      if (v7)
      {
        int v10 = [[PHVideoOverlayContentViewIcon alloc] initWithSymbolType:43];
LABEL_12:
        double v11 = v10;
        [(PHVideoOverlayViewController *)self setContentView:v10];
      }
      else
      {
        v21 = [PHVideoOverlayContentViewMessage alloc];
        double v11 = +[NSBundle mainBundle];
        v22 = [v11 localizedStringForKey:@"VIDEO_DEGRADED_TITLE" value:&stru_1002D6110 table:@"InCallService"];
        v23 = +[NSBundle mainBundle];
        v24 = [v23 localizedStringForKey:@"VIDEO_DEGRADED_MESSAGE" value:&stru_1002D6110 table:@"InCallService"];
        __int16 v25 = [(PHVideoOverlayContentViewMessage *)v21 initWithTitle:v22 message:v24];
        [(PHVideoOverlayViewController *)self setContentView:v25];
      }
LABEL_20:
      double v20 = [(PHVideoOverlayViewController *)self contentView];
      [(PHVideoOverlayViewController *)self showVideoOverlayWithContentView:v20 animated:v4];

      return;
    case 3:
      unsigned __int8 v12 = [PHVideoOverlayContentViewTitle alloc];
      double v13 = +[NSBundle mainBundle];
      double v8 = v13;
      CFStringRef v14 = @"PAUSE_OVERLAY";
      goto LABEL_18;
    case 4:
      v15 = [PHVideoOverlayContentViewActivity alloc];
      if (v7)
      {
        v16 = &stru_1002D6110;
        uint64_t v17 = 101;
      }
      else
      {
        double v8 = +[NSBundle mainBundle];
        v16 = [v8 localizedStringForKey:@"VIDEO_RECONNECTING_TITLE" value:&stru_1002D6110 table:@"InCallService"];
        uint64_t v17 = 100;
      }
      objc_super v26 = [(PHVideoOverlayContentViewActivity *)v15 initWithTitle:v16 indicatorStyle:v17];
      [(PHVideoOverlayViewController *)self setContentView:v26];

      if (v7) {
        goto LABEL_20;
      }

      goto LABEL_19;
    case 5:
      unsigned __int8 v12 = [PHVideoOverlayContentViewTitle alloc];
      double v13 = +[NSBundle mainBundle];
      double v8 = v13;
      CFStringRef v14 = @"CAMERA_UNAVAILABLE_OVERLAY";
LABEL_18:
      double v18 = [v13 localizedStringForKey:v14 value:&stru_1002D6110 table:@"InCallService"];
      id v19 = [(PHVideoOverlayContentViewTitle *)v12 initWithTitle:v18];
      [(PHVideoOverlayViewController *)self setContentView:v19];

LABEL_19:
      goto LABEL_20;
    case 6:
    case 7:
      int v10 = [[PHVideoOverlayContentViewTitle alloc] initWithTitle:0];
      goto LABEL_12;
    default:
      goto LABEL_20;
  }
}

- (void)showVideoOverlayWithContentView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "view: %@", buf, 0xCu);
  }

  if (v6)
  {
    double v8 = [(PHVideoOverlayViewController *)self insulatorView];
    [v8 setVideoOverlayContentView:v6 animated:v4];

    id v9 = [(PHVideoOverlayViewController *)self view];
    [v9 alpha];
    double v11 = v10;

    if (v11 != 1.0)
    {
      unsigned __int8 v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "animate in the overlay", buf, 2u);
      }

      double v13 = [(PHVideoOverlayViewController *)self delegate];
      [v13 videoOverlayViewController:self isShowingOverlay:1];

      double v14 = 0.150000006;
      if (!v4) {
        double v14 = 0.0;
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001085C;
      v15[3] = &unk_1002CD518;
      v15[4] = self;
      +[UIView animateWithDuration:4 delay:v15 options:0 animations:v14 completion:0.0];
    }
  }
}

- (void)hideVideoOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PHVideoOverlayViewController *)self view];
  [v5 alpha];
  double v7 = v6;

  if (v7 != 0.0)
  {
    double v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "animate out the overlay", buf, 2u);
    }

    double v9 = 0.150000006;
    if (!v3) {
      double v9 = 0.0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000109FC;
    v11[3] = &unk_1002CD518;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010A44;
    v10[3] = &unk_1002CD540;
    v10[4] = self;
    +[UIView animateWithDuration:4 delay:v11 options:v10 animations:v9 completion:0.0];
  }
}

- (void)disableVideoOverlayModes
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "removing all the overlays from queue", v5, 2u);
  }

  BOOL v4 = [(PHVideoOverlayViewController *)self modesPriorityQueue];
  [v4 removeAllObjects];

  [(PHVideoOverlayViewController *)self setCurrentVideoOverlayMode:0];
  [(PHVideoOverlayViewController *)self showNextVideoOverlayMode];
}

- (void)handlePIPControllerStateDidChangeNotification:(id)a3
{
  BOOL v4 = +[PHPIPController defaultPIPController];
  unsigned int v5 = [v4 isPipped];

  if (v5 != [(PHVideoOverlayViewController *)self isShowingPippedIconViews])
  {
    if ([(PHVideoOverlayViewController *)self shouldShowIconViewsWhenPipped])
    {
      int64_t v6 = [(PHVideoOverlayViewController *)self currentVideoOverlayMode];
      if (v6 == 4 || v6 == 2)
      {
        int64_t v7 = [(PHVideoOverlayViewController *)self currentVideoOverlayMode];
        [(PHVideoOverlayViewController *)self setVideoOverlayWithMode:v7 animated:1];
      }
    }
  }
}

- (BOOL)shouldShowIconViewsWhenPipped
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (BOOL)isShowingPippedIconViews
{
  int64_t v3 = [(PHVideoOverlayViewController *)self currentVideoOverlayMode];
  if (v3 == 4)
  {
    int64_t v6 = [(PHVideoOverlayViewController *)self contentView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v4 = [(PHVideoOverlayViewController *)self contentView];
      double v8 = [v4 title];
      char v5 = [v8 length] == 0;

      goto LABEL_6;
    }
LABEL_7:
    char v5 = 0;
    return v5 & 1;
  }
  if (v3 != 2) {
    goto LABEL_7;
  }
  BOOL v4 = [(PHVideoOverlayViewController *)self contentView];
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
LABEL_6:

  return v5 & 1;
}

- (PHVideoOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHVideoOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PHVideoOverlayInsulatorView)insulatorView
{
  return (PHVideoOverlayInsulatorView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInsulatorView:(id)a3
{
}

- (PHVideoOverlayContentView)contentView
{
  return (PHVideoOverlayContentView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentView:(id)a3
{
}

- (int64_t)currentVideoOverlayMode
{
  return self->_currentVideoOverlayMode;
}

- (void)setCurrentVideoOverlayMode:(int64_t)a3
{
  self->_currentVideoOverlayMode = a3;
}

- (NSMutableArray)modesPriorityQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModesPriorityQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modesPriorityQueue, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_insulatorView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end