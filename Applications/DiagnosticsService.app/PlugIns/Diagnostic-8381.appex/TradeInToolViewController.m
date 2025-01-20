@interface TradeInToolViewController
- (CGRect)frameForConfirmation;
- (CGRect)frameForPage:(int)a3;
- (NSArray)tradeInImages;
- (TradeInToolInputs)inputs;
- (id)imageViewForPage:(int)a3;
- (id)labelForConfirmation;
- (int)maxNumPages;
- (void)didUpdateCurrentImageView:(id)a3;
- (void)endTestWithStatusCode:(id)a3;
- (void)setInputs:(id)a3;
- (void)setTradeInImages:(id)a3;
- (void)setUpViewAccessibilitySettings;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TradeInToolViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36 = v6;
  [(TradeInToolViewController *)self setInputs:v6];
  v38 = v7;
  [(DisplayViewController *)self setDiagnosticResponder:v7];
  dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
  v37 = +[NSMutableArray array];
  v8 = NSTemporaryDirectory();
  v40 = +[NSURL fileURLWithPath:v8 isDirectory:1];

  v9 = [(TradeInToolViewController *)self inputs];
  v10 = [v9 imageFileNames];
  id v11 = [v10 count];

  if (v11)
  {
    uint64_t v13 = 0;
    *(void *)&long long v12 = 138412546;
    long long v35 = v12;
    while (1)
    {
      v14 = [(TradeInToolViewController *)self inputs];
      v15 = [v14 imageFileNames];
      v16 = [v15 objectAtIndexedSubscript:v13];

      v17 = +[NSUUID UUID];
      v18 = [v17 UUIDString];
      v19 = [v40 URLByAppendingPathComponent:v18];
      v20 = [v16 pathExtension];
      v21 = [v19 URLByAppendingPathExtension:v20];

      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_1000044A4;
      v50 = sub_1000044B4;
      id v51 = 0;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000044BC;
      v42[3] = &unk_1000082B0;
      id v22 = v16;
      id v43 = v22;
      v45 = &v46;
      v23 = v39;
      v44 = v23;
      [v38 getAsset:v22 completion:v42];
      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      if (v47[5])
      {
        v24 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v21;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Saving image data to [%@]", buf, 0xCu);
        }

        v25 = (void *)v47[5];
        id v41 = 0;
        unsigned int v26 = [v25 writeToURL:v21 options:268435457 error:&v41];
        id v27 = v41;
        if (v26)
        {
          [v37 addObject:v21];
          int v28 = 0;
        }
        else
        {
          v30 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v35;
            id v53 = v21;
            __int16 v54 = 2112;
            id v55 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
          }

          [(TradeInToolViewController *)self endTestWithStatusCode:&off_100008488];
          int v28 = 1;
        }
      }
      else
      {
        v29 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
        }

        [(TradeInToolViewController *)self endTestWithStatusCode:&off_1000084A0];
        int v28 = 1;
      }

      _Block_object_dispose(&v46, 8);
      if (v28) {
        break;
      }
      v31 = [(TradeInToolViewController *)self inputs];
      v32 = [v31 imageFileNames];
      id v33 = [v32 count];

      if ((unint64_t)v33 <= ++v13) {
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    id v34 = [v37 copy];
    [(TradeInToolViewController *)self setTradeInImages:v34];
  }
}

- (void)setupView
{
  v29.receiver = self;
  v29.super_class = (Class)TradeInToolViewController;
  [(DisplayViewController *)&v29 setupView];
  [(TradeInToolViewController *)self setShouldShowPressHomeLabel:0];
  v3 = [(DisplayViewController *)self scrollView];
  v4 = [v3 panGestureRecognizer];
  [v4 setMinimumNumberOfTouches:1];

  v5 = [(DisplayViewController *)self scrollView];
  id v6 = [v5 panGestureRecognizer];
  [v6 setMaximumNumberOfTouches:2];

  id v7 = [(TradeInToolViewController *)self view];
  [v7 frame];
  double v9 = v8;
  v10 = [(TradeInToolViewController *)self tradeInImages];
  double v11 = v9 * (double)((unint64_t)[v10 count] + 1);
  long long v12 = [(TradeInToolViewController *)self view];
  [v12 frame];
  double v14 = v13;
  v15 = [(DisplayViewController *)self scrollView];
  [v15 setContentSize:v11, v14];

  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"TRADE_IN_TOOL_COMPLETE_TITLE" value:&stru_100008370 table:0];
  v18 = [(DisplayViewController *)self confirmPageView];
  [v18 setMessage:v17];

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"DONE" value:&stru_100008370 table:0];
  v21 = [(DisplayViewController *)self confirmPageView];
  [v21 setButtonTitle:v20];

  objc_initWeak(&location, self);
  id v22 = [(DisplayViewController *)self confirmPageView];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100004848;
  unsigned int v26 = &unk_100008288;
  objc_copyWeak(&v27, &location);
  [v22 setButtonAction:&v23];

  [(TradeInToolViewController *)self setUpViewAccessibilitySettings];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)setUpViewAccessibilitySettings
{
  v3 = [(DisplayViewController *)self scrollView];
  [v3 setIsAccessibilityElement:1];

  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"TRADE_IN_TOOL_QR_IMAGE_AREA" value:&stru_100008370 table:0];
  id v6 = [(DisplayViewController *)self scrollView];
  [v6 setAccessibilityLabel:v5];

  id v7 = [(DisplayViewController *)self confirmPageView];
  [v7 setIsAccessibilityElement:1];

  double v8 = [(DisplayViewController *)self scrollView];
  double v11 = v8;
  double v9 = +[NSArray arrayWithObjects:&v11 count:1];
  v10 = [(TradeInToolViewController *)self view];
  [v10 setAccessibilityElements:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TradeInToolViewController;
  [(TradeInToolViewController *)&v8 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4 = [(DisplayViewController *)self animatedScrollingQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004AB4;
  v5[3] = &unk_100008288;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TradeInToolViewController;
  [(TradeInToolViewController *)&v6 viewDidAppear:a3];
  v4 = [(DisplayViewController *)self scrollView];
  [v4 becomeFirstResponder];

  LODWORD(v4) = UIAccessibilityScreenChangedNotification;
  v5 = [(DisplayViewController *)self currentImageView];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v5);
}

- (void)start
{
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-8381.animatedScrollingQueue", v4);
  [(DisplayViewController *)self setAnimatedScrollingQueue:v3];

  [(TradeInToolViewController *)self setupView];
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  v5 = [(TradeInToolViewController *)self result];
  [v5 setStatusCode:v4];

  [(TradeInToolViewController *)self setFinished:1];
}

- (CGRect)frameForPage:(int)a3
{
  double v4 = (double)a3;
  v5 = [(TradeInToolViewController *)self view];
  [v5 frame];
  double v7 = v6 * v4;
  objc_super v8 = [(TradeInToolViewController *)self view];
  [v8 frame];
  double v10 = v9;
  double v11 = [(TradeInToolViewController *)self view];
  [v11 frame];
  double v13 = v12;

  double v14 = 0.0;
  double v15 = v7;
  double v16 = v10;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForConfirmation
{
  dispatch_queue_t v3 = [(TradeInToolViewController *)self tradeInImages];
  -[TradeInToolViewController frameForPage:](self, "frameForPage:", [v3 count]);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)labelForConfirmation
{
  return &stru_100008370;
}

- (int)maxNumPages
{
  v2 = [(TradeInToolViewController *)self tradeInImages];
  int v3 = [v2 count];

  return v3;
}

- (id)imageViewForPage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)UIImageView);
  [(TradeInToolViewController *)self frameForPage:v3];
  id v6 = [v5 initWithFrame:];
  double v7 = [(TradeInToolViewController *)self tradeInImages];
  double v8 = [v7 objectAtIndexedSubscript:(int)v3];

  double v9 = [v8 path];
  double v10 = +[UIImage imageWithContentsOfFile:v9];
  [v6 setImage:v10];

  [v6 setIsAccessibilityElement:1];
  if (v3 == 1)
  {
    double v11 = +[NSBundle mainBundle];
    double v12 = v11;
    CFStringRef v13 = @"TRADE_IN_TOOL_LIGHT_QR_CODE";
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    double v11 = +[NSBundle mainBundle];
    double v12 = v11;
    CFStringRef v13 = @"TRADE_IN_TOOL_DARK_QR_CODE";
  }
  double v14 = [v11 localizedStringForKey:v13 value:&stru_100008370 table:0];
  [v6 setAccessibilityLabel:v14];

LABEL_6:
  [v6 setAccessibilityTraits:UIAccessibilityTraitImage];

  return v6;
}

- (void)didUpdateCurrentImageView:(id)a3
{
  id v5 = a3;
  if (a3)
  {
    id v6 = [(DisplayViewController *)self scrollView];
    v22[0] = v6;
    v22[1] = v5;
    double v7 = +[NSArray arrayWithObjects:v22 count:2];
    double v8 = [(TradeInToolViewController *)self view];
    [v8 setAccessibilityElements:v7];

    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v5);
  }
  else
  {
    double v9 = [(DisplayViewController *)self confirmPageView];
    double v10 = [v9 _actionButton];
    v21[0] = v10;
    double v11 = [(DisplayViewController *)self scrollView];
    v21[1] = v11;
    double v12 = +[NSArray arrayWithObjects:v21 count:2];
    CFStringRef v13 = [(TradeInToolViewController *)self view];
    [v13 setAccessibilityElements:v12];

    double v14 = +[NSBundle mainBundle];

    double v15 = [v14 localizedStringForKey:@"ANNOUNCE_TRADE_IN_TOOL_DONE" value:&stru_100008370 table:0];
    double v16 = [(DisplayViewController *)self confirmPageView];
    double v17 = [v16 _actionButton];
    [v17 setAccessibilityLabel:v15];

    v18 = [(DisplayViewController *)self confirmPageView];
    v19 = [v18 _actionButton];
    [v19 becomeFirstResponder];

    LODWORD(v19) = UIAccessibilityLayoutChangedNotification;
    id v5 = [(DisplayViewController *)self confirmPageView];
    v20 = [v5 _actionButton];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v19, v20);
  }
}

- (TradeInToolInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSArray)tradeInImages
{
  return self->_tradeInImages;
}

- (void)setTradeInImages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tradeInImages, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end