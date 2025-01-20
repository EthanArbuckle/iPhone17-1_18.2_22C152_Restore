@interface DisplayPatternToolViewController
- (BOOL)blueLightStatusActive;
- (BOOL)colorAdaptationStatus;
- (BOOL)isGestureEnded:(id)a3;
- (CBAdaptationClient)adaptationClient;
- (CBBlueLightClient)blueLightClient;
- (CBClient)client;
- (CGPoint)originPoint;
- (CGRect)frameForConfirmation;
- (CGRect)frameForPage:(int)a3;
- (CGRect)rectangle;
- (DADrawableView)drawableView;
- (DSShapeView)borderViewBlack;
- (DSShapeView)borderViewWhite;
- (DisplayPatternToolInputs)inputs;
- (NSArray)testImages;
- (NSMutableArray)allResults;
- (UIPanGestureRecognizer)panGesture;
- (UIProgressView)brightnessIndicator;
- (UITapGestureRecognizer)tapGesture;
- (float)originalScreenBrightness;
- (id)imageViewForPage:(int)a3;
- (id)labelForConfirmation;
- (int)maxNumPages;
- (int64_t)currentTag;
- (unint64_t)currentPanType;
- (void)addPanGesture;
- (void)addTapGesture;
- (void)addedRectangleView;
- (void)animateToBrightness:(float)a3;
- (void)cancelTimerForHideBrightnessIndicator;
- (void)cleanUp;
- (void)didUpdateCurrentImageView:(id)a3;
- (void)disableAdaptationAndBlueLightReduction;
- (void)drawBrightnessIndicator;
- (void)endTestWithStatusCode:(id)a3;
- (void)handleViewDidEndDecelerating:(id)a3;
- (void)handleViewDidScroll:(id)a3;
- (void)hideBrightnessIndicator;
- (void)hideBrightnessIndicatorWithDelay;
- (void)panOccurred:(id)a3;
- (void)parseResults;
- (void)removeResultWithTag:(int64_t)a3;
- (void)removeShape:(id)a3;
- (void)resetBrightness;
- (void)resetColorAdjustmentStates;
- (void)saveAndMaximizeBrightness;
- (void)saveColorAdjustmentStates;
- (void)setAdaptationClient:(id)a3;
- (void)setAllResults:(id)a3;
- (void)setBlueLightClient:(id)a3;
- (void)setBlueLightStatusActive:(BOOL)a3;
- (void)setBorderViewBlack:(id)a3;
- (void)setBorderViewWhite:(id)a3;
- (void)setBrightnessIndicator:(id)a3;
- (void)setClient:(id)a3;
- (void)setColorAdaptationStatus:(BOOL)a3;
- (void)setCurrentPanType:(unint64_t)a3;
- (void)setCurrentTag:(int64_t)a3;
- (void)setDrawableView:(id)a3;
- (void)setInputs:(id)a3;
- (void)setOriginPoint:(CGPoint)a3;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setPanGesture:(id)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setTapGesture:(id)a3;
- (void)setTestImages:(id)a3;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)shuffleImageOrder;
- (void)start;
- (void)tapOccurred:(id)a3;
- (void)updateBrightnessIndicator:(float)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DisplayPatternToolViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v53 = a4;
  v49 = v6;
  [(DisplayPatternToolViewController *)self setInputs:v6];
  v7 = [(DisplayPatternToolViewController *)self inputs];
  v8 = [v7 drawColor];
  [(DisplayViewController *)self setDrawColor:v8];

  [(DisplayViewController *)self setDiagnosticResponder:v53];
  dispatch_semaphore_t v51 = dispatch_semaphore_create(0);
  v50 = +[NSMutableArray array];
  v9 = NSTemporaryDirectory();
  v52 = +[NSURL fileURLWithPath:v9 isDirectory:1];

  v10 = [(DisplayPatternToolViewController *)self inputs];
  v11 = [v10 imageFileNames];
  id v12 = [v11 count];

  if (v12)
  {
    uint64_t v14 = 0;
    id v15 = 0;
    v16 = 0;
    *(void *)&long long v13 = 138412546;
    long long v48 = v13;
    while (1)
    {
      v17 = [(DisplayPatternToolViewController *)self inputs];
      v18 = [v17 imageFileNames];
      v19 = [v18 objectAtIndexedSubscript:v14];

      v20 = +[NSUUID UUID];
      v21 = [v20 UUIDString];
      v22 = [v52 URLByAppendingPathComponent:v21];
      v23 = [v19 pathExtension];
      uint64_t v24 = [v22 URLByAppendingPathExtension:v23];

      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x3032000000;
      v62 = sub_100003A5C;
      v63 = sub_100003A6C;
      id v64 = 0;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100003A74;
      v55[3] = &unk_10000C348;
      id v15 = v19;
      id v56 = v15;
      v58 = &v59;
      v25 = v51;
      v57 = v25;
      [v53 getAsset:v15 completion:v55];
      v16 = (void *)v24;
      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      if (v60[5])
      {
        v26 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v66 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Saving image data to [%@]", buf, 0xCu);
        }

        v27 = (void *)v60[5];
        id v54 = 0;
        unsigned int v28 = [v27 writeToURL:v24 options:268435457 error:&v54];
        id v29 = v54;
        if (v28)
        {
          v30 = objc_opt_new();
          [v30 setFile:v24];
          [v30 setAssetName:v15];
          [v50 setObject:v30 atIndexedSubscript:v14];

          int v31 = 0;
        }
        else
        {
          v33 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v48;
            uint64_t v66 = v24;
            __int16 v67 = 2112;
            id v68 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
          }

          [(DisplayPatternToolViewController *)self endTestWithStatusCode:&off_10000C7B0];
          int v31 = 1;
        }
      }
      else
      {
        v32 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v66 = (uint64_t)v15;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
        }

        [(DisplayPatternToolViewController *)self endTestWithStatusCode:&off_10000C7C8];
        int v31 = 1;
      }

      _Block_object_dispose(&v59, 8);
      if (v31) {
        break;
      }
      v34 = [(DisplayPatternToolViewController *)self inputs];
      v35 = [v34 imageFileNames];
      id v36 = [v35 count];

      if ((unint64_t)v36 <= ++v14) {
        goto LABEL_19;
      }
    }
  }
  else
  {
    v16 = 0;
    id v15 = 0;
LABEL_19:
    id v37 = [v50 copy];
    [(DisplayPatternToolViewController *)self setTestImages:v37];

    v38 = [(DisplayPatternToolViewController *)self inputs];
    unsigned int v39 = [v38 randomizeImageOrder];

    if (v39) {
      [(DisplayPatternToolViewController *)self shuffleImageOrder];
    }
    [(DisplayPatternToolViewController *)self setCurrentTag:1];
    [(DisplayViewController *)self setPage:0];
    [(DisplayPatternToolViewController *)self setCurrentPanType:0];
    id v40 = objc_alloc_init((Class)NSMutableArray);
    [(DisplayPatternToolViewController *)self setAllResults:v40];

    v41 = [(DisplayPatternToolViewController *)self inputs];
    unsigned int v42 = [v41 disableAmbientLightAdaptation];

    if (v42)
    {
      id v43 = objc_alloc_init((Class)CBClient);
      [(DisplayPatternToolViewController *)self setClient:v43];

      v44 = [(DisplayPatternToolViewController *)self client];
      v45 = [v44 blueLightClient];
      [(DisplayPatternToolViewController *)self setBlueLightClient:v45];

      v46 = [(DisplayPatternToolViewController *)self client];
      v47 = [v46 adaptationClient];
      [(DisplayPatternToolViewController *)self setAdaptationClient:v47];
    }
  }
}

- (BOOL)isGestureEnded:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 state] == (id)3 || [v3 state] == (id)4 || [v3 state] == (id)5;

  return v4;
}

- (void)start
{
  id v3 = +[UIColor blackColor];
  BOOL v4 = [(DisplayPatternToolViewController *)self view];
  [v4 setBackgroundColor:v3];

  v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-3906.animatedScrollingQueue", v7);
  [(DisplayViewController *)self setAnimatedScrollingQueue:v5];

  [(DisplayPatternToolViewController *)self setupView];
  id v6 = [(DisplayPatternToolViewController *)self inputs];
  LODWORD(v4) = [v6 disableAmbientLightAdaptation];

  if (v4)
  {
    [(DisplayPatternToolViewController *)self saveColorAdjustmentStates];
    [(DisplayPatternToolViewController *)self disableAdaptationAndBlueLightReduction];
  }
  [(DisplayPatternToolViewController *)self addPanGesture];
  [(DisplayPatternToolViewController *)self addTapGesture];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DisplayPatternToolViewController;
  [(DisplayPatternToolViewController *)&v8 viewWillAppear:a3];
  [(DisplayPatternToolViewController *)self saveAndMaximizeBrightness];
  objc_initWeak(&location, self);
  BOOL v4 = [(DisplayViewController *)self animatedScrollingQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003DA4;
  v5[3] = &unk_10000C320;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DisplayPatternToolViewController;
  [(DisplayPatternToolViewController *)&v5 viewDidAppear:a3];
  BOOL v4 = [(DisplayViewController *)self scrollView];
  [v4 becomeFirstResponder];
}

- (void)shuffleImageOrder
{
  id v3 = [(DisplayPatternToolViewController *)self testImages];
  BOOL v4 = (char *)[v3 count];

  objc_super v5 = [(DisplayPatternToolViewController *)self testImages];
  id v8 = [v5 mutableCopy];

  if (v4)
  {
    uint64_t v6 = 0;
    do
    {
      [v8 exchangeObjectAtIndex:v6 withObjectAtIndex:v6 + arc4random_uniform((uint32_t)v4)];
      ++v6;
      --v4;
    }
    while (v4);
  }
  id v7 = [v8 copy];
  [(DisplayPatternToolViewController *)self setTestImages:v7];
}

- (void)setupView
{
  id v3 = [DADrawableView alloc];
  BOOL v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v13 = +[UIColor clearColor];
  uint64_t v14 = [(DisplayViewController *)self drawColor];
  id v15 = -[DADrawableView initWithFrame:rectangleFillColor:rectangleEdgeColor:](v3, "initWithFrame:rectangleFillColor:rectangleEdgeColor:", v13, v14, v6, v8, v10, v12);
  [(DisplayPatternToolViewController *)self setDrawableView:v15];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v16 = [(DisplayPatternToolViewController *)self testImages];
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v19);
        id v21 = objc_alloc((Class)UIView);
        v22 = +[UIScreen mainScreen];
        [v22 bounds];
        id v23 = [v21 initWithFrame:];
        [v20 setDrawingOverlay:v23];

        uint64_t v24 = [v20 drawingOverlay];
        [v24 setUserInteractionEnabled:1];

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v17);
  }

  v46.receiver = self;
  v46.super_class = (Class)DisplayPatternToolViewController;
  [(DisplayViewController *)&v46 setupView];
  v25 = [(DisplayViewController *)self scrollView];
  v26 = [v25 panGestureRecognizer];
  [v26 setMinimumNumberOfTouches:2];

  v27 = [(DisplayPatternToolViewController *)self view];
  [v27 frame];
  double v29 = v28;
  v30 = [(DisplayPatternToolViewController *)self testImages];
  id v31 = [v30 count];
  v32 = [(DisplayPatternToolViewController *)self view];
  [v32 frame];
  double v34 = v33;
  v35 = [(DisplayViewController *)self scrollView];
  [v35 setContentSize:v29 * (double)((unint64_t)v31 + 1) v34];

  id v36 = +[NSBundle mainBundle];
  id v37 = [v36 localizedStringForKey:@"SWIPE_RIGHT_TO_PREVIOUS_SCREEN" value:&stru_10000C660 table:0];
  v38 = [(DisplayViewController *)self confirmPageView];
  [v38 setMessage:v37];

  unsigned int v39 = +[NSBundle mainBundle];
  id v40 = [v39 localizedStringForKey:@"DONE" value:&stru_10000C660 table:0];
  v41 = [(DisplayViewController *)self confirmPageView];
  [v41 setButtonTitle:v40];

  objc_initWeak(&location, self);
  unsigned int v42 = [(DisplayViewController *)self confirmPageView];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10000433C;
  v43[3] = &unk_10000C320;
  objc_copyWeak(&v44, &location);
  [v42 setButtonAction:v43];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

- (CGRect)frameForPage:(int)a3
{
  double v4 = (double)a3;
  double v5 = [(DisplayPatternToolViewController *)self view];
  [v5 frame];
  double v7 = v6 * v4;
  double v8 = [(DisplayPatternToolViewController *)self view];
  [v8 frame];
  double v10 = v9;
  double v11 = [(DisplayPatternToolViewController *)self view];
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

- (void)handleViewDidScroll:(id)a3
{
  double v4 = [(DisplayPatternToolViewController *)self inputs];
  unsigned int v5 = [v4 resetBrightnessOnChange];

  if (v5)
  {
    LODWORD(v6) = 1.0;
    [(DisplayPatternToolViewController *)self animateToBrightness:v6];
  }
}

- (void)handleViewDidEndDecelerating:(id)a3
{
  signed int v4 = [(DisplayViewController *)self page];
  signed int v5 = [(DisplayPatternToolViewController *)self maxNumPages];
  double v6 = [(DisplayPatternToolViewController *)self panGesture];
  double v7 = v6;
  if (v4 >= v5)
  {
    [v6 setEnabled:0];

    double v8 = [(DisplayPatternToolViewController *)self tapGesture];
    id v10 = v8;
    uint64_t v9 = 0;
  }
  else
  {
    [v6 setEnabled:1];

    double v8 = [(DisplayPatternToolViewController *)self tapGesture];
    id v10 = v8;
    uint64_t v9 = 1;
  }
  [v8 setEnabled:v9];
}

- (CGRect)frameForConfirmation
{
  id v3 = [(DisplayPatternToolViewController *)self testImages];
  -[DisplayPatternToolViewController frameForPage:](self, "frameForPage:", [v3 count]);
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
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"DISPLAY_TOOL_COMPLETED" value:&stru_10000C660 table:0];

  return v3;
}

- (id)imageViewForPage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)UIImageView);
  [(DisplayPatternToolViewController *)self frameForPage:v3];
  id v6 = [v5 initWithFrame:];
  double v7 = [(DisplayPatternToolViewController *)self testImages];
  uint64_t v8 = (int)v3;
  double v9 = [v7 objectAtIndexedSubscript:(int)v3];
  double v10 = [v9 file];

  double v11 = [v10 path];
  double v12 = +[UIImage imageWithContentsOfFile:v11];
  [v6 setImage:v12];

  double v13 = [(DisplayPatternToolViewController *)self testImages];
  double v14 = [v13 objectAtIndexedSubscript:v8];
  double v15 = [v14 drawingOverlay];
  [v6 addSubview:v15];

  [v6 setUserInteractionEnabled:1];

  return v6;
}

- (int)maxNumPages
{
  v2 = [(DisplayPatternToolViewController *)self testImages];
  int v3 = [v2 count];

  return v3;
}

- (void)didUpdateCurrentImageView:(id)a3
{
  id v5 = a3;
  double v4 = [(DisplayPatternToolViewController *)self drawableView];
  if (v5) {
    [v5 insertSubview:v4 atIndex:0];
  }
  else {
    [v4 removeFromSuperview];
  }
}

- (void)addPanGesture
{
  id v3 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"panOccurred:"];
  [(DisplayPatternToolViewController *)self setPanGesture:v3];

  double v4 = [(DisplayPatternToolViewController *)self inputs];
  unsigned int v5 = [v4 brightnessAdjustable];

  id v6 = [(DisplayPatternToolViewController *)self panGesture];
  double v7 = v6;
  if (v5) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v6 setMaximumNumberOfTouches:v8];

  double v9 = [(DisplayPatternToolViewController *)self panGesture];
  [v9 setMinimumNumberOfTouches:1];

  double v10 = [(DisplayPatternToolViewController *)self panGesture];
  [v10 setDelegate:self];

  id v12 = [(DisplayPatternToolViewController *)self view];
  double v11 = [(DisplayPatternToolViewController *)self panGesture];
  [v12 addGestureRecognizer:v11];
}

- (void)addTapGesture
{
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapOccurred:"];
  [(DisplayPatternToolViewController *)self setTapGesture:v3];

  double v4 = [(DisplayPatternToolViewController *)self tapGesture];
  [v4 setDelegate:self];

  id v6 = [(DisplayPatternToolViewController *)self view];
  unsigned int v5 = [(DisplayPatternToolViewController *)self tapGesture];
  [v6 addGestureRecognizer:v5];
}

- (void)panOccurred:(id)a3
{
  id v6 = a3;
  if (![(DisplayViewController *)self isAnimatedScrolling])
  {
    if ([v6 state] == (id)1)
    {
      double v7 = [(DisplayPatternToolViewController *)self view];
      [v6 locationInView:v7];
      -[DisplayPatternToolViewController setOriginPoint:](self, "setOriginPoint:");

      uint64_t v8 = [(DisplayViewController *)self scrollView];
      [v8 setScrollEnabled:0];

      if ([v6 numberOfTouches] == (id)1)
      {
        [(DisplayPatternToolViewController *)self setCurrentPanType:1];
      }
      else if ([v6 numberOfTouches] == (id)2)
      {
        [(DisplayPatternToolViewController *)self setCurrentPanType:2];
        double v9 = [(DisplayPatternToolViewController *)self brightnessIndicator];

        if (v9) {
          [(DisplayPatternToolViewController *)self cancelTimerForHideBrightnessIndicator];
        }
        else {
          [(DisplayPatternToolViewController *)self drawBrightnessIndicator];
        }
      }
    }
    if ([(DisplayPatternToolViewController *)self isGestureEnded:v6]) {
      [(DisplayPatternToolViewController *)self hideBrightnessIndicatorWithDelay];
    }
    if ((id)[(DisplayPatternToolViewController *)self currentPanType] == (id)2)
    {
      if ([v6 numberOfTouches] == (id)2)
      {
        double v10 = [(DisplayPatternToolViewController *)self view];
        [v6 locationInView:v10];
        double v12 = v11;
        double v14 = v13;

        [(DisplayPatternToolViewController *)self originPoint];
        double v16 = (v15 - v14) / 500.0;
        BKSDisplayBrightnessGetCurrent();
        float v18 = v17;
        v19 = [(DisplayViewController *)self diagnosticResponder];
        *(float *)&double v20 = v16 + v18;
        [v19 setScreenToBrightness:0 animate:v20];

        *(float *)&double v21 = v18;
        [(DisplayPatternToolViewController *)self updateBrightnessIndicator:v21];
        v22 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v70 = 134218496;
          double v71 = v18;
          __int16 v72 = 2048;
          double v73 = v16;
          __int16 v74 = 2048;
          double v75 = v16 + v18;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting brightness to (%f + %f) = %f", (uint8_t *)&v70, 0x20u);
        }

        -[DisplayPatternToolViewController setOriginPoint:](self, "setOriginPoint:", v12, v14);
        if ([(DisplayPatternToolViewController *)self isGestureEnded:v6])
        {
          [(DisplayPatternToolViewController *)self setCurrentPanType:0];
          id v23 = [(DisplayViewController *)self scrollView];
          [v23 setScrollEnabled:1];

          uint64_t v24 = [(DisplayPatternToolViewController *)self view];
          [v6 velocityInView:v24];
          double v26 = v25;

          if (v26 > 1350.0)
          {
            double v27 = 0.0;
LABEL_30:
            [(DisplayPatternToolViewController *)self animateToBrightness:v27];
            goto LABEL_49;
          }
          HIDWORD(v27) = -1063970816;
          if (v26 < -1350.0)
          {
            LODWORD(v27) = 1.0;
            goto LABEL_30;
          }
        }
      }
      else if ([(DisplayPatternToolViewController *)self isGestureEnded:v6])
      {
        [(DisplayPatternToolViewController *)self setCurrentPanType:0];
        v30 = [(DisplayViewController *)self scrollView];
        [v30 setScrollEnabled:1];
      }
    }
    else if ([(DisplayPatternToolViewController *)self isGestureEnded:v6])
    {
      [(DisplayPatternToolViewController *)self setCurrentPanType:0];
      double v28 = [(DisplayViewController *)self scrollView];
      [v28 setScrollEnabled:1];

      double v29 = [(DisplayPatternToolViewController *)self drawableView];
      [v29 endDrawing];

      [(DisplayPatternToolViewController *)self addedRectangleView];
    }
    else
    {
      id v31 = [(DisplayPatternToolViewController *)self view];
      [v6 locationInView:v31];
      double v33 = v32;
      double v35 = v34;

      [(DisplayPatternToolViewController *)self originPoint];
      double v37 = vabdd_f64(v36, v33);
      v38 = [(DisplayPatternToolViewController *)self inputs];
      [v38 minimumSquareLength];
      double v40 = v39;
      [(DisplayPatternToolViewController *)self originPoint];
      double v42 = v41;
      if (v37 >= v40)
      {
        int v46 = 0;
        if (v41 >= v33) {
          double v44 = v33;
        }
        else {
          double v44 = v41;
        }
      }
      else
      {
        [(DisplayPatternToolViewController *)self originPoint];
        double v44 = v43;
        if (v33 >= v42)
        {
          int v46 = 0;
        }
        else
        {
          id v3 = [(DisplayPatternToolViewController *)self inputs];
          [v3 minimumSquareLength];
          double v44 = v44 - v45;
          int v46 = 1;
        }
      }
      [(DisplayPatternToolViewController *)self originPoint];
      double v48 = vabdd_f64(v47, v35);
      long long v49 = [(DisplayPatternToolViewController *)self inputs];
      [v49 minimumSquareLength];
      double v51 = v50;
      [(DisplayPatternToolViewController *)self originPoint];
      double v53 = v52;
      if (v48 >= v51)
      {
        int v57 = 0;
        if (v52 >= v35) {
          double v55 = v35;
        }
        else {
          double v55 = v52;
        }
      }
      else
      {
        [(DisplayPatternToolViewController *)self originPoint];
        double v55 = v54;
        if (v35 >= v53)
        {
          int v57 = 0;
        }
        else
        {
          double v4 = [(DisplayPatternToolViewController *)self inputs];
          [v4 minimumSquareLength];
          double v55 = v55 - v56;
          int v57 = 1;
        }
      }
      [(DisplayPatternToolViewController *)self originPoint];
      double v59 = vabdd_f64(v58, v33);
      v60 = [(DisplayPatternToolViewController *)self inputs];
      [v60 minimumSquareLength];
      double v62 = v61;

      if (v59 >= v62) {
        double v62 = v59;
      }
      [(DisplayPatternToolViewController *)self originPoint];
      double v64 = vabdd_f64(v63, v35);
      v65 = [(DisplayPatternToolViewController *)self inputs];
      [v65 minimumSquareLength];
      double v67 = v66;

      if (v64 >= v67) {
        double v68 = v64;
      }
      else {
        double v68 = v67;
      }
      -[DisplayPatternToolViewController setRectangle:](self, "setRectangle:", v44, v55, v62, v68);
      if (v57) {

      }
      if (v46) {
      v69 = [(DisplayPatternToolViewController *)self drawableView];
      }
      [(DisplayPatternToolViewController *)self rectangle];
      [v69 updateDrawing:];
    }
  }
LABEL_49:
}

- (void)tapOccurred:(id)a3
{
  id v20 = a3;
  if (![(DisplayViewController *)self isAnimatedScrolling])
  {
    double v4 = [(DisplayPatternToolViewController *)self view];
    [v20 locationInView:v4];
    -[DisplayPatternToolViewController setOriginPoint:](self, "setOriginPoint:");

    [(DisplayPatternToolViewController *)self originPoint];
    double v6 = v5;
    double v7 = [(DisplayPatternToolViewController *)self inputs];
    [v7 minimumSquareLength];
    double v9 = v6 - v8 * 0.5;
    [(DisplayPatternToolViewController *)self originPoint];
    double v11 = v10;
    double v12 = [(DisplayPatternToolViewController *)self inputs];
    [v12 minimumSquareLength];
    double v14 = v11 - v13 * 0.5;
    double v15 = [(DisplayPatternToolViewController *)self inputs];
    [v15 minimumSquareLength];
    double v17 = v16;
    float v18 = [(DisplayPatternToolViewController *)self inputs];
    [v18 minimumSquareLength];
    -[DisplayPatternToolViewController setRectangle:](self, "setRectangle:", v9, v14, v17, v19);

    [(DisplayPatternToolViewController *)self addedRectangleView];
  }
}

- (void)removeShape:(id)a3
{
  double v4 = [a3 view];
  double v5 = [(DisplayPatternToolViewController *)self inputs];
  double v6 = [v5 drawColor];
  [v4 setBackgroundColor:v6];

  double v7 = +[NSBundle mainBundle];
  double v8 = [v7 localizedStringForKey:@"REMOVE_ITEM" value:&stru_10000C660 table:0];
  double v9 = +[UIAlertController alertControllerWithTitle:v8 message:0 preferredStyle:1];

  double v10 = +[NSBundle mainBundle];
  double v11 = [v10 localizedStringForKey:@"REMOVE" value:&stru_10000C660 table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005384;
  v20[3] = &unk_10000C370;
  id v12 = v4;
  id v21 = v12;
  v22 = self;
  double v13 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v20];
  [v9 addAction:v13];

  double v14 = +[NSBundle mainBundle];
  double v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_10000C660 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000053CC;
  v18[3] = &unk_10000C398;
  id v19 = v12;
  id v16 = v12;
  double v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v18];
  [v9 addAction:v17];

  [(DisplayPatternToolViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)drawBrightnessIndicator
{
  id v3 = [objc_alloc((Class)UIProgressView) initWithProgressViewStyle:0];
  [(DisplayPatternToolViewController *)self setBrightnessIndicator:v3];

  double v4 = [(DisplayPatternToolViewController *)self drawableView];
  [v4 bounds];
  double v6 = v5 * 0.100000001;

  double v7 = [(DisplayPatternToolViewController *)self drawableView];
  [v7 bounds];
  double v9 = v8 * 0.5;

  double v10 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v10 setCenter:v6, v9];

  memset(&v51, 0, sizeof(v51));
  double v11 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  id v12 = v11;
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransformMakeRotation(&t2, -1.57079633);
  CGAffineTransformConcat(&v51, &t1, &t2);

  CGAffineTransformMakeScale(&v47, 1.0, 1.5);
  CGAffineTransform v46 = v51;
  CGAffineTransformConcat(&v48, &v46, &v47);
  double v13 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  CGAffineTransform v45 = v48;
  [v13 setTransform:&v45];

  double v14 = +[UIColor blackColor];
  double v15 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v15 setProgressTintColor:v14];

  id v16 = +[UIColor whiteColor];
  double v17 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v17 setTrackTintColor:v16];

  float v18 = [(DisplayPatternToolViewController *)self drawableView];
  id v19 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v18 addSubview:v19];

  BKSDisplayBrightnessGetCurrent();
  -[DisplayPatternToolViewController updateBrightnessIndicator:](self, "updateBrightnessIndicator:");
  id v20 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  id v21 = [v20 layer];
  [v21 setBorderWidth:1.0];

  id v22 = +[UIColor whiteColor];
  id v23 = [v22 CGColor];
  uint64_t v24 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  double v25 = [v24 layer];
  [v25 setBorderColor:v23];

  double v26 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v26 frame];
  double v28 = v6 - v27 * 0.5 + -2.0;

  double v29 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v29 frame];
  double v31 = v9 - v30 * 0.5 + -2.0;

  double v32 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v32 frame];
  double v34 = v33 + 4.0;

  double v35 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v35 frame];
  double v37 = v36 + 4.0;

  v38 = +[UIColor blackColor];
  double v39 = +[UIColor clearColor];
  double v40 = +[DSShapeView rectangleWithFrame:borderColor:fillColor:borderWidth:](DSShapeView, "rectangleWithFrame:borderColor:fillColor:borderWidth:", v38, v39, 1, v28, v31, v34, v37);
  [(DisplayPatternToolViewController *)self setBorderViewBlack:v40];

  double v41 = [(DisplayPatternToolViewController *)self drawableView];
  double v42 = [(DisplayPatternToolViewController *)self borderViewBlack];
  [v41 addSubview:v42];

  double v43 = [(DisplayPatternToolViewController *)self drawableView];
  double v44 = [(DisplayPatternToolViewController *)self borderViewWhite];
  [v43 addSubview:v44];
}

- (void)updateBrightnessIndicator:(float)a3
{
  id v5 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  *(float *)&double v4 = a3;
  [v5 setProgress:v4];
}

- (void)cancelTimerForHideBrightnessIndicator
{
}

- (void)hideBrightnessIndicatorWithDelay
{
  [(DisplayPatternToolViewController *)self cancelTimerForHideBrightnessIndicator];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005918;
  block[3] = &unk_10000C3C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideBrightnessIndicator
{
  id v3 = [(DisplayPatternToolViewController *)self borderViewBlack];
  [v3 removeFromSuperview];

  double v4 = [(DisplayPatternToolViewController *)self borderViewWhite];
  [v4 removeFromSuperview];

  id v5 = [(DisplayPatternToolViewController *)self brightnessIndicator];
  [v5 removeFromSuperview];

  [(DisplayPatternToolViewController *)self setBorderViewBlack:0];
  [(DisplayPatternToolViewController *)self setBorderViewWhite:0];

  [(DisplayPatternToolViewController *)self setBrightnessIndicator:0];
}

- (void)addedRectangleView
{
  [(DisplayPatternToolViewController *)self rectangle];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(DisplayPatternToolViewController *)self inputs];
  id v12 = [v11 drawColor];
  double v13 = +[UIColor clearColor];
  double v14 = +[DSShapeView rectangleWithFrame:borderColor:fillColor:](DSShapeView, "rectangleWithFrame:borderColor:fillColor:", v12, v13, v4, v6, v8, v10);

  [v14 setTag:[self currentTag]];
  [(DisplayPatternToolViewController *)self setCurrentTag:(char *)[(DisplayPatternToolViewController *)self currentTag] + 1];
  id v15 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"removeShape:"];
  [v14 addGestureRecognizer:v15];

  id v16 = [(DisplayPatternToolViewController *)self testImages];
  double v17 = [v16 objectAtIndexedSubscript:[self page]];
  float v18 = [v17 drawingOverlay];
  [v18 addSubview:v14];

  v33[0] = @"xPos";
  [v14 frame];
  double v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v34[0] = v32;
  v33[1] = @"yPos";
  [v14 frame];
  double v31 = +[NSNumber numberWithDouble:v19];
  v34[1] = v31;
  v33[2] = @"width";
  [v14 frame];
  id v21 = +[NSNumber numberWithDouble:v20];
  v34[2] = v21;
  v33[3] = @"height";
  [v14 frame];
  id v23 = +[NSNumber numberWithDouble:v22];
  v34[3] = v23;
  v33[4] = @"image";
  uint64_t v24 = [(DisplayPatternToolViewController *)self testImages];
  double v25 = [v24 objectAtIndexedSubscript:[self page]];
  double v26 = [v25 assetName];
  v34[4] = v26;
  v33[5] = @"tag";
  double v27 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 tag]);
  v34[5] = v27;
  v33[6] = @"brightness";
  BKSDisplayBrightnessGetCurrent();
  double v28 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v34[6] = v28;
  double v29 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:7];

  double v30 = [(DisplayPatternToolViewController *)self allResults];
  [v30 addObject:v29];
}

- (void)removeResultWithTag:(int64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(DisplayPatternToolViewController *)self allResults];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v11 = [v10 objectForKeyedSubscript:@"tag"];
        id v12 = [v11 integerValue];

        if (v12 == (id)a3)
        {
          double v13 = [(DisplayPatternToolViewController *)self allResults];
          [v13 removeObject:v10];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)saveColorAdjustmentStates
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  double v3 = [(DisplayPatternToolViewController *)self blueLightClient];
  [v3 getBlueLightStatus:v5];

  [(DisplayPatternToolViewController *)self setBlueLightStatusActive:LOBYTE(v5[0])];
  double v4 = [(DisplayPatternToolViewController *)self adaptationClient];
  -[DisplayPatternToolViewController setColorAdaptationStatus:](self, "setColorAdaptationStatus:", [v4 getEnabled]);
}

- (void)resetColorAdjustmentStates
{
  double v3 = [(DisplayPatternToolViewController *)self blueLightClient];
  [v3 setActive:[self blueLightStatusActive]];

  id v4 = [(DisplayPatternToolViewController *)self adaptationClient];
  [v4 setEnabled:[self colorAdaptationStatus]];
}

- (void)disableAdaptationAndBlueLightReduction
{
  double v3 = [(DisplayPatternToolViewController *)self blueLightClient];
  [v3 setActive:0];

  id v4 = [(DisplayPatternToolViewController *)self adaptationClient];
  [v4 setEnabled:0];
}

- (void)saveAndMaximizeBrightness
{
  BKSDisplayBrightnessGetCurrent();
  -[DisplayPatternToolViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  id v4 = [(DisplayViewController *)self diagnosticResponder];
  LODWORD(v3) = 1.0;
  [v4 setScreenToBrightness:0 animate:v3];
}

- (void)resetBrightness
{
  id v3 = [(DisplayViewController *)self diagnosticResponder];
  [(DisplayPatternToolViewController *)self originalScreenBrightness];
  [v3 setScreenToBrightness:0];
}

- (void)animateToBrightness:(float)a3
{
  id v5 = [(DisplayViewController *)self diagnosticResponder];
  *(float *)&double v4 = a3;
  [v5 setScreenToBrightness:1 animate:v4];
}

- (void)cleanUp
{
  [(DisplayPatternToolViewController *)self resetBrightness];
  id v3 = [(DisplayPatternToolViewController *)self inputs];
  unsigned int v4 = [v3 disableAmbientLightAdaptation];

  if (v4)
  {
    [(DisplayPatternToolViewController *)self resetColorAdjustmentStates];
  }
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  [(DisplayPatternToolViewController *)self cleanUp];
  id v5 = [(DisplayPatternToolViewController *)self result];
  [v5 setStatusCode:v4];

  [(DisplayPatternToolViewController *)self parseResults];

  [(DisplayPatternToolViewController *)self setFinished:1];
}

- (void)parseResults
{
  id v3 = [(DisplayPatternToolViewController *)self result];
  id v4 = [v3 statusCode];
  if ([v4 isEqualToNumber:&off_10000C810])
  {

LABEL_4:
    id v27 = [(DisplayPatternToolViewController *)self result];
    [v27 setData:&__NSDictionary0__struct];

    return;
  }
  id v5 = [(DisplayPatternToolViewController *)self result];
  uint64_t v6 = [v5 statusCode];
  unsigned int v7 = [v6 isEqualToNumber:&off_10000C7C8];

  if (v7) {
    goto LABEL_4;
  }
  id v8 = objc_alloc((Class)NSMutableArray);
  double v9 = [(DisplayPatternToolViewController *)self allResults];
  id v10 = [v8 initWithCapacity:[v9 count]];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v11 = [(DisplayPatternToolViewController *)self allResults];
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) mutableCopy];
        [v16 removeObjectForKey:@"tag"];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  [(DisplayPatternToolViewController *)self setAllResults:v17];

  v32[0] = @"displayResX";
  float v18 = +[UIScreen mainScreen];
  [v18 bounds];
  double v20 = +[NSNumber numberWithDouble:v19];
  v33[0] = v20;
  v32[1] = @"displayResY";
  id v21 = +[UIScreen mainScreen];
  [v21 bounds];
  id v23 = +[NSNumber numberWithDouble:v22];
  v33[1] = v23;
  v32[2] = @"anomaliesDetected";
  uint64_t v24 = [(DisplayPatternToolViewController *)self allResults];
  v33[2] = v24;
  double v25 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  double v26 = [(DisplayPatternToolViewController *)self result];
  [v26 setData:v25];
}

- (NSArray)testImages
{
  return self->_testImages;
}

- (void)setTestImages:(id)a3
{
}

- (int64_t)currentTag
{
  return self->_currentTag;
}

- (void)setCurrentTag:(int64_t)a3
{
  self->_currentTag = a3;
}

- (CGRect)rectangle
{
  double x = self->_rectangle.origin.x;
  double y = self->_rectangle.origin.y;
  double width = self->_rectangle.size.width;
  double height = self->_rectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->_rectangle = a3;
}

- (CGPoint)originPoint
{
  double x = self->_originPoint.x;
  double y = self->_originPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginPoint:(CGPoint)a3
{
  self->_originPoint = a3;
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (unint64_t)currentPanType
{
  return self->_currentPanType;
}

- (void)setCurrentPanType:(unint64_t)a3
{
  self->_currentPanType = a3;
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (CBClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

- (void)setBlueLightClient:(id)a3
{
}

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

- (void)setAdaptationClient:(id)a3
{
}

- (BOOL)blueLightStatusActive
{
  return self->_blueLightStatusActive;
}

- (void)setBlueLightStatusActive:(BOOL)a3
{
  self->_blueLightStatusActive = a3;
}

- (BOOL)colorAdaptationStatus
{
  return self->_colorAdaptationStatus;
}

- (void)setColorAdaptationStatus:(BOOL)a3
{
  self->_colorAdaptationStatus = a3;
}

- (DADrawableView)drawableView
{
  return self->_drawableView;
}

- (void)setDrawableView:(id)a3
{
}

- (DisplayPatternToolInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (UIProgressView)brightnessIndicator
{
  return self->_brightnessIndicator;
}

- (void)setBrightnessIndicator:(id)a3
{
}

- (DSShapeView)borderViewWhite
{
  return self->_borderViewWhite;
}

- (void)setBorderViewWhite:(id)a3
{
}

- (DSShapeView)borderViewBlack
{
  return self->_borderViewBlack;
}

- (void)setBorderViewBlack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderViewBlack, 0);
  objc_storeStrong((id *)&self->_borderViewWhite, 0);
  objc_storeStrong((id *)&self->_brightnessIndicator, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_drawableView, 0);
  objc_storeStrong((id *)&self->_adaptationClient, 0);
  objc_storeStrong((id *)&self->_blueLightClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_allResults, 0);

  objc_storeStrong((id *)&self->_testImages, 0);
}

@end