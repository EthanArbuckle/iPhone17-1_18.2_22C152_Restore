@interface ButtonSwitchInputViewController
- (BOOL)buttonFailure;
- (BOOL)isInputMonitoringPaused;
- (BOOL)isSecondEvent;
- (BOOL)prefersStatusBarHidden;
- (BOOL)setupTest;
- (BOOL)shouldShowPressHomeLabel;
- (ButtonSwitchInputs)inputs;
- (CHHapticEngine)hapticEngine;
- (DAButtonSwitchState)buttonSwitchState;
- (DSHardwareButtonEventMonitor)buttonEventMonitor;
- (NSMutableArray)allResults;
- (NSTimer)timeoutTimer;
- (UIImage)spriteImage;
- (UIImageView)testImage;
- (int)checkCurrentSwitchState;
- (int)currentSegment;
- (int)currentSegmentActionCount;
- (int)currentState;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)targetButtonEvents;
- (void)cleanUpWithCompletion:(id)a3;
- (void)didReceiveButtonEvent:(unint64_t)a3;
- (void)endTestWithStatusCode:(id)a3;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)noInputTimedOut;
- (void)playHaptic;
- (void)resetTimer;
- (void)setAllResults:(id)a3;
- (void)setButtonEventMonitor:(id)a3;
- (void)setButtonFailure:(BOOL)a3;
- (void)setButtonSwitchState:(id)a3;
- (void)setCurrentSegment:(int)a3;
- (void)setCurrentSegmentActionCount:(int)a3;
- (void)setCurrentState:(int)a3;
- (void)setHapticEngine:(id)a3;
- (void)setInputs:(id)a3;
- (void)setIsInputMonitoringPaused:(BOOL)a3;
- (void)setIsSecondEvent:(BOOL)a3;
- (void)setSpriteImage:(id)a3;
- (void)setTargetButtonEvents:(unint64_t)a3;
- (void)setTestImage:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setupTouchButtonInteractions;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)showNextSegment;
- (void)showTransitionWithRange:(_NSRange)a3 WithCompletionHandler:(id)a4;
- (void)start;
- (void)startTimer;
- (void)teardown;
- (void)timedOut;
@end

@implementation ButtonSwitchInputViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v88 = a4;
  [(ButtonSwitchInputViewController *)self setInputs:v6];
  [(ButtonSwitchInputViewController *)self setupTest];
  v7 = [(ButtonSwitchInputViewController *)self inputs];
  v8 = [v7 buttonSwitchSpecification];

  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id location = 0;
    p_id location = &location;
    uint64_t v99 = 0x3032000000;
    v100 = sub_1000077F4;
    v101 = sub_100007804;
    id v102 = 0;
    v10 = [(ButtonSwitchInputViewController *)self inputs];
    v11 = [v10 buttonSwitchSpecification];
    v12 = [v11 asset];
    v13 = [v12 name];
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_10000780C;
    v94[3] = &unk_1000104C8;
    v96 = &location;
    v14 = v9;
    v95 = v14;
    [v88 getAsset:v13 completion:v94];

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    id v15 = p_location[5];
    if (v15)
    {
      id v16 = objc_alloc((Class)UIImage);
      id v17 = [v16 initWithData:p_location[5]];
      [(ButtonSwitchInputViewController *)self setSpriteImage:v17];
    }
    else
    {
      v19 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v35 = [(ButtonSwitchInputViewController *)self inputs];
        v36 = [v35 buttonSwitchSpecification];
        v37 = [v36 asset];
        v38 = [v37 name];
        *(_DWORD *)buf = 138412290;
        v106 = v38;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to download asset %@", buf, 0xCu);
      }
      [(ButtonSwitchInputViewController *)self endTestWithStatusCode:&off_100011190];
    }

    _Block_object_dispose(&location, 8);
    if (v15)
    {
      [(ButtonSwitchInputViewController *)self setTargetButtonEvents:0xFFFFFFFFLL];
      v20 = [(ButtonSwitchInputViewController *)self inputs];
      v21 = [v20 identifier];
      unsigned int v22 = [v21 isEqualToString:@"Home"];

      if (v22)
      {
        [(ButtonSwitchInputViewController *)self setTargetButtonEvents:3];
      }
      else
      {
        v23 = [(ButtonSwitchInputViewController *)self inputs];
        v24 = [v23 identifier];
        unsigned int v25 = [v24 isEqualToString:@"RingerButton"];

        if (v25)
        {
          [(ButtonSwitchInputViewController *)self setTargetButtonEvents:805306368];
        }
        else
        {
          v26 = [(ButtonSwitchInputViewController *)self inputs];
          v27 = [v26 identifier];
          unsigned int v28 = [v27 isEqualToString:@"Ringer"];

          if (v28)
          {
            [(ButtonSwitchInputViewController *)self setTargetButtonEvents:12];
          }
          else
          {
            v29 = [(ButtonSwitchInputViewController *)self inputs];
            v30 = [v29 identifier];
            unsigned int v31 = [v30 isEqualToString:@"Sleep"];

            if (v31)
            {
              [(ButtonSwitchInputViewController *)self setTargetButtonEvents:48];
            }
            else
            {
              v32 = [(ButtonSwitchInputViewController *)self inputs];
              v33 = [v32 identifier];
              unsigned int v34 = [v33 isEqualToString:@"VolumeIncrement"];

              if (v34)
              {
                [(ButtonSwitchInputViewController *)self setTargetButtonEvents:192];
              }
              else
              {
                v39 = [(ButtonSwitchInputViewController *)self inputs];
                v40 = [v39 identifier];
                unsigned int v41 = [v40 isEqualToString:@"VolumeDecrement"];

                if (v41)
                {
                  [(ButtonSwitchInputViewController *)self setTargetButtonEvents:768];
                }
                else
                {
                  v42 = [(ButtonSwitchInputViewController *)self inputs];
                  v43 = [v42 identifier];
                  unsigned int v44 = [v43 isEqualToString:@"DigitalCrown"];

                  if (v44)
                  {
                    [(ButtonSwitchInputViewController *)self setTargetButtonEvents:3072];
                  }
                  else
                  {
                    v45 = [(ButtonSwitchInputViewController *)self inputs];
                    v46 = [v45 identifier];
                    unsigned int v47 = [v46 isEqualToString:@"Side"];

                    if (v47)
                    {
                      [(ButtonSwitchInputViewController *)self setTargetButtonEvents:12288];
                    }
                    else
                    {
                      v48 = [(ButtonSwitchInputViewController *)self inputs];
                      v49 = [v48 identifier];
                      unsigned int v50 = [v49 isEqualToString:@"App"];

                      if (v50)
                      {
                        [(ButtonSwitchInputViewController *)self setTargetButtonEvents:201326592];
                      }
                      else
                      {
                        v51 = [(ButtonSwitchInputViewController *)self inputs];
                        v52 = [v51 identifier];
                        unsigned int v53 = [v52 isEqualToString:@"Camera"];

                        if (v53)
                        {
                          [(ButtonSwitchInputViewController *)self setTargetButtonEvents:0];
                          id v93 = 0;
                          id v54 = [objc_alloc((Class)CHHapticEngine) initAndReturnError:&v93];
                          id v55 = v93;
                          [(ButtonSwitchInputViewController *)self setHapticEngine:v54];

                          if (v55)
                          {
                            v56 = DiagnosticLogHandleForCategory();
                            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                              sub_10000A9C8((uint64_t)v55, v56, v57, v58, v59, v60, v61, v62);
                            }

                            [(ButtonSwitchInputViewController *)self setHapticEngine:0];
                          }
                          else
                          {
                            objc_initWeak(&location, self);
                            v63 = [(ButtonSwitchInputViewController *)self hapticEngine];
                            v91[0] = _NSConcreteStackBlock;
                            v91[1] = 3221225472;
                            v91[2] = sub_10000786C;
                            v91[3] = &unk_1000104F0;
                            objc_copyWeak(&v92, &location);
                            [v63 setResetHandler:v91];

                            v64 = [(ButtonSwitchInputViewController *)self hapticEngine];
                            [v64 setStoppedHandler:&stru_100010530];

                            objc_destroyWeak(&v92);
                            objc_destroyWeak(&location);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v65 = objc_alloc_init((Class)DSHardwareButtonEventMonitor);
      [(ButtonSwitchInputViewController *)self setButtonEventMonitor:v65];

      objc_initWeak(&location, self);
      v66 = [(ButtonSwitchInputViewController *)self buttonEventMonitor];
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_100007A00;
      v89[3] = &unk_1000104F0;
      objc_copyWeak(&v90, &location);
      [v66 startWithPriority:200 completion:v89];

      v67 = [(ButtonSwitchInputViewController *)self inputs];
      v68 = [v67 switchParameters];

      if (v68)
      {
        v69 = [DAButtonSwitchState alloc];
        v70 = [(ButtonSwitchInputViewController *)self inputs];
        v71 = [v70 identifier];
        v72 = [(ButtonSwitchInputViewController *)self inputs];
        v73 = [(DAButtonSwitchState *)v72 switchParameters];
        v74 = -[DAButtonSwitchState initWithIdentifier:startingState:](v69, "initWithIdentifier:startingState:", v71, [v73 startingState]);
        [(ButtonSwitchInputViewController *)self setButtonSwitchState:v74];
      }
      else
      {
        v75 = [(ButtonSwitchInputViewController *)self inputs];
        v76 = [v75 buttonParameters];

        if (!v76)
        {
LABEL_41:
          [(ButtonSwitchInputViewController *)self setIsInputMonitoringPaused:0];
          [(ButtonSwitchInputViewController *)self setButtonFailure:0];
          id v78 = objc_alloc_init((Class)NSMutableArray);
          [(ButtonSwitchInputViewController *)self setAllResults:v78];

          v79 = +[DSTestAutomation sharedInstance];
          unsigned int v80 = [v79 testAutomationEnabled];

          if (v80)
          {
            v103[0] = @"parameters";
            v81 = [(ButtonSwitchInputViewController *)self inputs];
            v82 = [v81 parameters];
            v104[0] = v82;
            v103[1] = @"predicates";
            v83 = [(ButtonSwitchInputViewController *)self inputs];
            v84 = [v83 predicates];
            v104[1] = v84;
            v103[2] = @"specifications";
            v85 = [(ButtonSwitchInputViewController *)self inputs];
            v86 = [v85 specifications];
            v104[2] = v86;
            v87 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
            +[DSTestAutomation postConfiguration:v87];
          }
          objc_destroyWeak(&v90);
          objc_destroyWeak(&location);
          goto LABEL_44;
        }
        v77 = [DAButtonSwitchState alloc];
        v70 = [(ButtonSwitchInputViewController *)self inputs];
        v71 = [v70 identifier];
        v72 = [(DAButtonSwitchState *)v77 initWithIdentifier:v71];
        [(ButtonSwitchInputViewController *)self setButtonSwitchState:v72];
      }

      goto LABEL_41;
    }
  }
  else
  {
    v18 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000A984(v18);
    }

    [(ButtonSwitchInputViewController *)self endTestWithStatusCode:&off_1000111A8];
  }
LABEL_44:
}

- (void)start
{
  [(ButtonSwitchInputViewController *)self setupView];

  [(ButtonSwitchInputViewController *)self setupTouchButtonInteractions];
}

- (BOOL)setupTest
{
  v3 = [(ButtonSwitchInputViewController *)self inputs];
  v4 = [v3 type];
  unsigned int v5 = [v4 isEqualToString:@"Button"];

  id v6 = [(ButtonSwitchInputViewController *)self inputs];
  v7 = v6;
  if (v5)
  {
    v8 = [v6 buttonParameters];

    [(ButtonSwitchInputViewController *)self setCurrentSegment:0xFFFFFFFFLL];
    [(ButtonSwitchInputViewController *)self setIsSecondEvent:0];
  }
  else
  {
    dispatch_semaphore_t v9 = [v6 type];
    unsigned int v10 = [v9 isEqualToString:@"Switch"];

    v11 = [(ButtonSwitchInputViewController *)self inputs];
    v12 = v11;
    if (v10)
    {
      uint64_t v13 = [v11 switchParameters];
    }
    else
    {
      v14 = [v11 type];
      unsigned int v15 = [v14 isEqualToString:@"TouchButton"];

      if (!v15)
      {
        v8 = 0;
        return v8 != 0;
      }
      v12 = [(ButtonSwitchInputViewController *)self inputs];
      uint64_t v13 = [v12 touchButtonParameters];
    }
    v8 = (void *)v13;

    [(ButtonSwitchInputViewController *)self setCurrentSegment:0xFFFFFFFFLL];
  }

  return v8 != 0;
}

- (void)setupView
{
  v3 = +[UIColor whiteColor];
  v4 = [(ButtonSwitchInputViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)UIImageView);
  id v6 = [(ButtonSwitchInputViewController *)self inputs];
  v7 = [v6 buttonSwitchSpecification];
  [v7 position];
  id v8 = [v5 initWithFrame:];
  [(ButtonSwitchInputViewController *)self setTestImage:v8];

  dispatch_semaphore_t v9 = [(ButtonSwitchInputViewController *)self view];
  unsigned int v10 = [(ButtonSwitchInputViewController *)self testImage];
  [v9 addSubview:v10];

  v11 = [(ButtonSwitchInputViewController *)self inputs];
  v12 = [v11 switchParameters];

  if (v12)
  {
    unsigned int v13 = [(ButtonSwitchInputViewController *)self checkCurrentSwitchState];
    v14 = [(ButtonSwitchInputViewController *)self inputs];
    unsigned int v15 = [v14 switchParameters];
    unsigned int v16 = [v15 startingState];

    if (v13 == v16) {
      [(ButtonSwitchInputViewController *)self setCurrentSegment:[(ButtonSwitchInputViewController *)self currentSegment] + 1];
    }
    else {
      [(ButtonSwitchInputViewController *)self endTestWithStatusCode:&off_1000111C0];
    }
  }
  [(ButtonSwitchInputViewController *)self startTimer];

  [(ButtonSwitchInputViewController *)self showNextSegment];
}

- (void)setupTouchButtonInteractions
{
  if (+[CBSUtilities isCheckerBoardActive])
  {
    +[CBSUtilities enableTouchButtonEvents];
  }
  else
  {
    v3 = +[_UIPhysicalButtonConfiguration _cameraCaptureShutterConfigurationWithOptionsProvider:0];
    id v4 = [objc_alloc((Class)_UIPhysicalButtonInteraction) initWithConfigurations:v3 delegate:self];
    id v5 = [(ButtonSwitchInputViewController *)self view];
    [v5 addInteraction:v4];
  }
  id v8 = +[DAHIDEventMonitor sharedInstance];
  [v8 setDelegate:self];
  id v6 = +[NSSet setWithObject:&off_1000111D8];
  unsigned __int8 v7 = [v8 startMonitoringWithHIDEvents:v6];

  if ((v7 & 1) == 0) {
    [(ButtonSwitchInputViewController *)self endTestWithStatusCode:&off_1000111F0];
  }
}

- (void)showNextSegment
{
  [(ButtonSwitchInputViewController *)self setCurrentSegment:[(ButtonSwitchInputViewController *)self currentSegment] + 1];
  [(ButtonSwitchInputViewController *)self setCurrentSegmentActionCount:0];
  id v4 = [(ButtonSwitchInputViewController *)self inputs];
  id v5 = [v4 buttonParameters];
  if (v5)
  {
    id v6 = [(ButtonSwitchInputViewController *)self inputs];
    unsigned __int8 v7 = [v6 buttonParameters];
    id v8 = [v7 segments];
    id v9 = [v8 count];
    if ((unint64_t)v9 <= [(ButtonSwitchInputViewController *)self currentSegment])
    {

      goto LABEL_17;
    }
    v29 = v8;
    v30 = v7;
    unsigned int v31 = v6;
  }
  unsigned int v10 = [(ButtonSwitchInputViewController *)self inputs];
  v11 = [v10 switchParameters];
  if (v11)
  {
    v12 = [(ButtonSwitchInputViewController *)self inputs];
    unsigned int v13 = [v12 switchParameters];
    v2 = [v13 states];
    id v14 = [v2 count];
    if ((unint64_t)v14 <= [(ButtonSwitchInputViewController *)self currentSegment])
    {
      BOOL v23 = 1;
LABEL_13:

      goto LABEL_14;
    }
    v27 = v13;
    unsigned int v28 = v12;
  }
  unsigned int v15 = [(ButtonSwitchInputViewController *)self inputs];
  uint64_t v16 = [v15 touchButtonParameters];
  if (v16)
  {
    id v17 = (void *)v16;
    [(ButtonSwitchInputViewController *)self inputs];
    v18 = v26 = v4;
    [v18 touchButtonParameters];
    unsigned int v25 = v10;
    v20 = v19 = v2;
    v21 = [v20 targetEvents];
    id v22 = [v21 count];
    BOOL v23 = (unint64_t)v22 <= [(ButtonSwitchInputViewController *)self currentSegment];

    v2 = v19;
    unsigned int v10 = v25;

    id v4 = v26;
  }
  else
  {

    BOOL v23 = 0;
  }
  unsigned int v13 = v27;
  v12 = v28;
  if (v11) {
    goto LABEL_13;
  }
LABEL_14:

  if (v5)
  {
  }
  if (!v23)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000081B4;
    block[3] = &unk_100010428;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return;
  }
LABEL_17:
  if ([(ButtonSwitchInputViewController *)self buttonFailure]) {
    v24 = &off_100011208;
  }
  else {
    v24 = &off_100011220;
  }

  [(ButtonSwitchInputViewController *)self endTestWithStatusCode:v24];
}

- (void)showTransitionWithRange:(_NSRange)a3 WithCompletionHandler:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = v7;
  if (length)
  {
    id v9 = [(ButtonSwitchInputViewController *)self testImage];
    unsigned int v10 = [(ButtonSwitchInputViewController *)self spriteImage];
    v11 = [(ButtonSwitchInputViewController *)self inputs];
    v12 = [v11 buttonSwitchSpecification];
    unsigned int v13 = [v12 asset];
    [v13 size];
    id v14 = +[DASpriteImage imagesFromSprite:v10 inRange:location withImageSize:length];
    [v9 setAnimationImages:v14];

    double v15 = (double)length / 60.0;
    uint64_t v16 = [(ButtonSwitchInputViewController *)self testImage];
    [v16 setAnimationRepeatCount:1];

    id v17 = [(ButtonSwitchInputViewController *)self testImage];
    [v17 setAnimationDuration:v15];

    v18 = [(ButtonSwitchInputViewController *)self testImage];
    [v18 startAnimating];

    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000086E0;
    block[3] = &unk_100010580;
    id v21 = v8;
    dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

- (int)checkCurrentSwitchState
{
  return +[DARingerSwitchStateReader readCurrentState];
}

- (void)cleanUpWithCompletion:(id)a3
{
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  unsigned int v10 = sub_1000087E4;
  v11 = &unk_1000105A8;
  v12 = self;
  id v13 = a3;
  id v4 = v13;
  id v5 = objc_retainBlock(&v8);
  id v6 = [(ButtonSwitchInputViewController *)self buttonEventMonitor];

  if (v6)
  {
    id v7 = [(ButtonSwitchInputViewController *)self buttonEventMonitor];
    [v7 stopWithCompletion:v5];
  }
  else
  {
    ((void (*)(void ***))v5[2])(v5);
  }
}

- (void)teardown
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008A2C;
  v4[3] = &unk_100010428;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v3 = v5;
  [(ButtonSwitchInputViewController *)self cleanUpWithCompletion:v4];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)endTestWithStatusCode:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008ACC;
  v4[3] = &unk_100010558;
  void v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)noInputTimedOut
{
  id v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No Input Timeout called", (uint8_t *)buf, 2u);
  }

  id v4 = [(ButtonSwitchInputViewController *)self buttonEventMonitor];

  if (v4)
  {
    id v5 = [(ButtonSwitchInputViewController *)self buttonEventMonitor];
    [v5 removeTarget:self];
  }
  [(ButtonSwitchInputViewController *)self setIsInputMonitoringPaused:1];
  objc_initWeak(buf, self);
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"NO_INPUT_DETECTED" value:&stru_100010E68 table:0];
  id v8 = +[UIAlertController alertControllerWithTitle:0 message:v7 preferredStyle:1];

  uint64_t v9 = +[NSBundle mainBundle];
  unsigned int v10 = [v9 localizedStringForKey:@"RETRY" value:&stru_100010E68 table:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100008F78;
  v21[3] = &unk_1000105D0;
  objc_copyWeak(&v22, buf);
  v21[4] = self;
  v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v21];
  [v8 addAction:v11];

  v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"CONTINUE" value:&stru_100010E68 table:0];
  double v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1000090C8;
  v18 = &unk_1000105D0;
  objc_copyWeak(&v20, buf);
  dispatch_time_t v19 = self;
  id v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&v15];
  [v8 addAction:v14, v15, v16, v17, v18];

  [(ButtonSwitchInputViewController *)self presentViewController:v8 animated:1 completion:0];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(buf);
}

- (void)startTimer
{
  id v3 = [(ButtonSwitchInputViewController *)self inputs];
  id v4 = [v3 type];
  unsigned int v5 = [v4 isEqualToString:@"Button"];

  id v6 = [(ButtonSwitchInputViewController *)self inputs];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 buttonParameters];
LABEL_7:
    id v19 = (id)v8;

    id v14 = v19;
    goto LABEL_8;
  }
  uint64_t v9 = [v6 type];
  unsigned int v10 = [v9 isEqualToString:@"Switch"];

  v11 = [(ButtonSwitchInputViewController *)self inputs];
  id v7 = v11;
  if (v10)
  {
    uint64_t v8 = [v11 switchParameters];
    goto LABEL_7;
  }
  v12 = [v11 type];
  unsigned int v13 = [v12 isEqualToString:@"TouchButton"];

  if (v13)
  {
    id v7 = [(ButtonSwitchInputViewController *)self inputs];
    uint64_t v8 = [v7 touchButtonParameters];
    goto LABEL_7;
  }
  id v14 = 0;
LABEL_8:
  id v20 = v14;
  [v14 listenForInputTimeout];
  if (v15 == 0.0)
  {
    [v20 noInputTimeout];
    if (v17 == 0.0) {
      goto LABEL_13;
    }
    [v20 noInputTimeout];
    uint64_t v16 = "noInputTimedOut";
  }
  else
  {
    [v20 listenForInputTimeout];
    uint64_t v16 = "timedOut";
  }
  v18 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, v16, 0, 0);
  [(ButtonSwitchInputViewController *)self setTimeoutTimer:v18];

LABEL_13:
}

- (void)resetTimer
{
  id v3 = [(ButtonSwitchInputViewController *)self inputs];
  id v4 = [v3 buttonParameters];

  unsigned int v5 = [(ButtonSwitchInputViewController *)self inputs];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 buttonParameters];
LABEL_7:
    id v13 = (id)v7;

    v11 = [(ButtonSwitchInputViewController *)self timeoutTimer];
    [v11 invalidate];

    [v13 noInputTimeout];
    v12 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0);
    [(ButtonSwitchInputViewController *)self setTimeoutTimer:v12];

    return;
  }
  uint64_t v8 = [v5 switchParameters];

  uint64_t v9 = [(ButtonSwitchInputViewController *)self inputs];
  id v6 = v9;
  if (v8)
  {
    uint64_t v7 = [v9 switchParameters];
    goto LABEL_7;
  }
  unsigned int v10 = [v9 touchButtonParameters];

  if (v10)
  {
    id v6 = [(ButtonSwitchInputViewController *)self inputs];
    uint64_t v7 = [v6 touchButtonParameters];
    goto LABEL_7;
  }

  [(ButtonSwitchInputViewController *)self endTestWithStatusCode:&off_100011238];
}

- (void)timedOut
{
}

- (void)didReceiveButtonEvent:(unint64_t)a3
{
  unsigned int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v44 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Recieved hardware button event %x", buf, 8u);
  }

  id v6 = +[NSDate date];
  [v6 timeIntervalSince1970];
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v7 * 1000.0)];

  uint64_t v9 = [(ButtonSwitchInputViewController *)self inputs];
  unsigned int v10 = [v9 buttonParameters];
  v11 = [(ButtonSwitchInputViewController *)self inputs];
  v12 = v11;
  if (v10) {
    [v11 buttonParameters];
  }
  else {
  id v13 = [v11 switchParameters];
  }

  if (v13 && [v13 resetTimer])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009A54;
    block[3] = &unk_100010428;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  id v14 = [(ButtonSwitchInputViewController *)self buttonSwitchState];
  id v36 = 0;
  id v37 = 0;
  unsigned int v15 = [v14 isEventAcceptable:a3 type:&v37 eventType:&v36];
  id v16 = v37;
  id v17 = v36;

  v18 = DiagnosticLogHandleForCategory();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v19)
    {
      *(_DWORD *)buf = 67109120;
      int v44 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Button event %x is unacceptable!", buf, 8u);
    }

    v30 = [(ButtonSwitchInputViewController *)self allResults];
    v40[0] = v16;
    v39[0] = @"type";
    v39[1] = @"identifier";
    unsigned int v31 = [(ButtonSwitchInputViewController *)self inputs];
    v32 = [v31 identifier];
    v40[1] = v32;
    v40[2] = v17;
    v39[2] = @"eventType";
    v39[3] = @"timestamp";
    v40[3] = v8;
    v33 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
    [v30 addObject:v33];

    [(ButtonSwitchInputViewController *)self setButtonFailure:1];
LABEL_20:
    [(ButtonSwitchInputViewController *)self showNextSegment];
    goto LABEL_24;
  }
  if (v19)
  {
    *(_DWORD *)buf = 67109120;
    int v44 = a3;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Button event %x is acceptable", buf, 8u);
  }

  id v20 = [(ButtonSwitchInputViewController *)self allResults];
  v42[0] = v16;
  v41[0] = @"type";
  v41[1] = @"identifier";
  id v21 = [(ButtonSwitchInputViewController *)self inputs];
  id v22 = [v21 identifier];
  v42[1] = v22;
  v42[2] = v17;
  v41[2] = @"eventType";
  v41[3] = @"timestamp";
  v42[3] = v8;
  BOOL v23 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
  [v20 addObject:v23];

  v24 = [(ButtonSwitchInputViewController *)self inputs];
  unsigned int v25 = [v24 buttonParameters];

  if (!v25)
  {
    unsigned int v34 = [(ButtonSwitchInputViewController *)self inputs];
    v35 = [v34 switchParameters];

    if (!v35) {
      goto LABEL_24;
    }
    [(ButtonSwitchInputViewController *)self setCurrentSegmentActionCount:[(ButtonSwitchInputViewController *)self currentSegmentActionCount] + 1];
    goto LABEL_20;
  }
  if ([(ButtonSwitchInputViewController *)self isSecondEvent])
  {
    [(ButtonSwitchInputViewController *)self setCurrentSegmentActionCount:[(ButtonSwitchInputViewController *)self currentSegmentActionCount] + 1];
    v26 = [(ButtonSwitchInputViewController *)self inputs];
    v27 = [v26 buttonParameters];
    unsigned int v28 = [v27 segments];
    v29 = [v28 objectAtIndexedSubscript:[self currentSegment]];

    LODWORD(v26) = [(ButtonSwitchInputViewController *)self currentSegmentActionCount];
    if ((int)v26 >= (int)[v29 numberOfActions]) {
      [(ButtonSwitchInputViewController *)self showNextSegment];
    }
    [(ButtonSwitchInputViewController *)self setIsSecondEvent:0];
  }
  else
  {
    [(ButtonSwitchInputViewController *)self setIsSecondEvent:1];
  }
LABEL_24:
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (BOOL)shouldShowPressHomeLabel
{
  return 0;
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (([(ButtonSwitchInputViewController *)self isCancelled] & 1) == 0
    && ([(ButtonSwitchInputViewController *)self isFinished] & 1) == 0)
  {
    unsigned int v5 = dispatch_get_global_queue(25, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009B30;
    v6[3] = &unk_1000105F8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(v5, v6);
  }
}

- (void)playHaptic
{
  CHHapticPatternKey v24 = CHHapticPatternKeyPattern;
  CHHapticPatternKey v21 = CHHapticPatternKeyEvent;
  v19[0] = CHHapticPatternKeyEventType;
  v19[1] = CHHapticPatternKeyTime;
  v20[0] = CHHapticEventTypeHapticTransient;
  v20[1] = &off_1000112B8;
  v19[2] = CHHapticPatternKeyEventDuration;
  v20[2] = &off_1000112C8;
  id v3 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v22 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  BOOL v23 = v4;
  unsigned int v5 = +[NSArray arrayWithObjects:&v23 count:1];
  unsigned int v25 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  id v18 = 0;
  id v7 = [objc_alloc((Class)CHHapticPattern) initWithDictionary:v6 error:&v18];
  id v8 = v18;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_1000077F4;
  v16[4] = sub_100007804;
  uint64_t v9 = [(ButtonSwitchInputViewController *)self hapticEngine];
  id v15 = v8;
  unsigned int v10 = [v9 createPlayerWithPattern:v7 error:&v15];
  id v11 = v15;

  id v17 = v10;
  v12 = [(ButtonSwitchInputViewController *)self hapticEngine];
  [v12 notifyWhenPlayersFinished:&stru_100010638];

  id v13 = [(ButtonSwitchInputViewController *)self hapticEngine];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000A38C;
  v14[3] = &unk_100010660;
  v14[4] = v16;
  [v13 startWithCompletionHandler:v14];

  _Block_object_dispose(v16, 8);
}

- (int)currentSegment
{
  return self->_currentSegment;
}

- (void)setCurrentSegment:(int)a3
{
  self->_currentSegment = a3;
}

- (int)currentSegmentActionCount
{
  return self->_currentSegmentActionCount;
}

- (void)setCurrentSegmentActionCount:(int)a3
{
  self->_currentSegmentActionCount = a3;
}

- (BOOL)isSecondEvent
{
  return self->_isSecondEvent;
}

- (void)setIsSecondEvent:(BOOL)a3
{
  self->_isSecondEvent = a3;
}

- (int)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (UIImage)spriteImage
{
  return self->_spriteImage;
}

- (void)setSpriteImage:(id)a3
{
}

- (UIImageView)testImage
{
  return self->_testImage;
}

- (void)setTestImage:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (BOOL)buttonFailure
{
  return self->_buttonFailure;
}

- (void)setButtonFailure:(BOOL)a3
{
  self->_buttonFailure = a3;
}

- (unint64_t)targetButtonEvents
{
  return self->_targetButtonEvents;
}

- (void)setTargetButtonEvents:(unint64_t)a3
{
  self->_targetButtonEvents = a3;
}

- (BOOL)isInputMonitoringPaused
{
  return self->_isInputMonitoringPaused;
}

- (void)setIsInputMonitoringPaused:(BOOL)a3
{
  self->_isInputMonitoringPaused = a3;
}

- (CHHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
}

- (DAButtonSwitchState)buttonSwitchState
{
  return self->_buttonSwitchState;
}

- (void)setButtonSwitchState:(id)a3
{
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
}

- (ButtonSwitchInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_buttonSwitchState, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_testImage, 0);

  objc_storeStrong((id *)&self->_spriteImage, 0);
}

@end