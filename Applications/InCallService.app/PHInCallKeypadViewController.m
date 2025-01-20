@interface PHInCallKeypadViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (PHInCallKeypadViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHNumberPadKeyCommandHandler)numberPadKeyCommandHandler;
- (TPDialerNumberPad)keypad;
- (TUDTMFSoundPlayer)soundPlayer;
- (_UIVisualEffectBackdropView)captureView;
- (void)dealloc;
- (void)handleNumberPadCharacter:(char)a3;
- (void)handleNumberPadKeyCommand:(id)a3;
- (void)loadView;
- (void)phonePad:(id)a3 keyDown:(char)a4;
- (void)setCaptureView:(id)a3;
- (void)setKeypad:(id)a3;
- (void)updateKeypadButtonBackgroundMaterial:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PHInCallKeypadViewController

- (PHInCallKeypadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PHInCallKeypadViewController;
  v4 = [(PHInCallKeypadViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[PHNumberPadKeyCommandHandler alloc] initWithViewController:v4 selector:"handleNumberPadKeyCommand:"];
    numberPadKeyCommandHandler = v4->_numberPadKeyCommandHandler;
    v4->_numberPadKeyCommandHandler = v5;

    v7 = (TUDTMFSoundPlayer *)objc_alloc_init((Class)TUDTMFSoundPlayer);
    soundPlayer = v4->_soundPlayer;
    v4->_soundPlayer = v7;
  }
  return v4;
}

- (void)dealloc
{
  [(TPDialerNumberPad *)self->_keypad setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PHInCallKeypadViewController;
  [(PHInCallKeypadViewController *)&v3 dealloc];
}

- (void)updateKeypadButtonBackgroundMaterial:(id)a3
{
  id v4 = a3;
  v5 = [(PHInCallKeypadViewController *)self keypad];

  if (v5)
  {
    v6 = [(PHInCallKeypadViewController *)self keypad];
    v7 = [v6 buttons];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) updateBackgroundMaterial:v4 v13];
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)loadView
{
  objc_super v3 = +[TPDialerNumberPad dialerNumberPadFullCharacters];
  id v4 = +[NSMutableArray array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v11 = [PHInCallNumberPadButton alloc];
        uint64_t v12 = (int)[v10 intValue];
        long long v13 = [(PHInCallKeypadViewController *)self traitCollection];
        id v14 = -[PHInCallNumberPadButton initForCharacter:style:](v11, "initForCharacter:style:", v12, [v13 userInterfaceStyle]);

        long long v15 = [v14 layer];
        [v15 setAllowsGroupBlending:0];

        long long v16 = [v14 layer];
        [v16 setAllowsGroupOpacity:0];

        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v7);
  }

  keypad = self->_keypad;
  if (!keypad)
  {
    v18 = (TPDialerNumberPad *)[objc_alloc((Class)TPDialerNumberPad) initWithButtons:v4];
    v19 = self->_keypad;
    self->_keypad = v18;

    [(TPDialerNumberPad *)self->_keypad setPlaysSounds:1];
    [(TPDialerNumberPad *)self->_keypad setDelegate:self];
    v20 = [(TPDialerNumberPad *)self->_keypad layer];
    [v20 setAllowsGroupBlending:0];

    v21 = [(TPDialerNumberPad *)self->_keypad layer];
    [v21 setAllowsGroupOpacity:0];

    keypad = self->_keypad;
  }
  [(TPDialerNumberPad *)keypad intrinsicContentSize];
  double v23 = v22;
  [(TPDialerNumberPad *)self->_keypad intrinsicContentSize];
  -[TPDialerNumberPad setFrame:](self->_keypad, "setFrame:", 0.0, 0.0, v23, v24);
  v25 = objc_alloc_init(PHTransformableView);
  v26 = +[UIColor clearColor];
  [(PHTransformableView *)v25 setBackgroundColor:v26];

  [(TPDialerNumberPad *)self->_keypad frame];
  -[PHTransformableView setFrame:](v25, "setFrame:");
  [(PHTransformableView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHTransformableView *)v25 addSubview:self->_keypad];
  v27 = +[NSLayoutConstraint constraintWithItem:v25 attribute:8 relatedBy:0 toItem:self->_keypad attribute:8 multiplier:1.0 constant:0.0];
  [(PHTransformableView *)v25 addConstraint:v27];

  v28 = +[NSLayoutConstraint constraintWithItem:v25 attribute:7 relatedBy:0 toItem:self->_keypad attribute:7 multiplier:1.0 constant:0.0];
  [(PHTransformableView *)v25 addConstraint:v28];

  LODWORD(v29) = 1148846080;
  [(PHTransformableView *)v25 setContentHuggingPriority:0 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [(PHTransformableView *)v25 setContentHuggingPriority:1 forAxis:v30];
  LODWORD(v31) = 1148846080;
  [(PHTransformableView *)v25 setContentCompressionResistancePriority:0 forAxis:v31];
  LODWORD(v32) = 1148846080;
  [(PHTransformableView *)v25 setContentCompressionResistancePriority:1 forAxis:v32];
  v33 = [(PHTransformableView *)v25 layer];
  [v33 setAllowsGroupBlending:0];

  v34 = [(PHTransformableView *)v25 layer];
  [v34 setAllowsGroupOpacity:0];

  [(PHInCallKeypadViewController *)self setView:v25];
  id v35 = +[CNKFeatures sharedInstance];
  if (![v35 isButtonLayoutEnabled]) {
    goto LABEL_20;
  }
  v36 = [(PHInCallKeypadViewController *)self captureView];

  if (!v36)
  {
    id v37 = objc_alloc((Class)_UIVisualEffectBackdropView);
    [(TPDialerNumberPad *)self->_keypad frame];
    id v38 = [v37 initWithFrame:];
    [(PHInCallKeypadViewController *)self setCaptureView:v38];

    v39 = [(PHInCallKeypadViewController *)self captureView];
    [v39 setAutoresizingMask:18];

    v40 = self->_keypad;
    v41 = [(PHInCallKeypadViewController *)self captureView];
    [(TPDialerNumberPad *)v40 insertSubview:v41 atIndex:0];

    v42 = [(PHInCallKeypadViewController *)self captureView];
    [v42 setRenderMode:1];

    v43 = [(PHInCallKeypadViewController *)self captureView];
    v44 = [v43 captureGroup];
    [v44 setGroupName:@"InCallKeypadButtonsCaptureGroup"];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v35 = v4;
    id v45 = [v35 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v45)
    {
      id v46 = v45;
      v53 = v25;
      uint64_t v47 = *(void *)v55;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(v35);
          }
          v49 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
          v50 = [v49 backDropVisualEffectView];
          [v50 _setGroupName:@"InCallKeypadButtonsCaptureGroup"];

          v51 = [(PHInCallKeypadViewController *)self captureView];
          v52 = [v49 backDropVisualEffectView];
          [v52 _setCaptureView:v51];
        }
        id v46 = [v35 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v46);
      v25 = v53;
    }
LABEL_20:
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHInCallKeypadViewController;
  [(PHInCallKeypadViewController *)&v4 viewDidAppear:a3];
  [(PHInCallKeypadViewController *)self becomeFirstResponder];
}

- (void)handleNumberPadKeyCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallKeypadViewController *)self numberPadKeyCommandHandler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AB770;
  v6[3] = &unk_1002CFCF0;
  v6[4] = self;
  [v5 handleKeyCommand:v4 receivedCharacterBlock:v6 receivedSpecialCharacterBlock:0];
}

- (void)phonePad:(id)a3 keyDown:(char)a4
{
}

- (void)handleNumberPadCharacter:(char)a3
{
  int v3 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 displayedCallFromCalls:0];

  if ([v5 shouldPlayDTMFTone])
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will play DTMF tone due to phonePad keyDown event, and a supporting displayedCall", buf, 2u);
    }

    [v5 playDTMFToneForKey:v3];
  }
  id v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = +[NSString stringWithFormat:@"%c", v3];
  [v7 postNotificationName:@"PHInCallKeypadDataSourceChangedNotification" object:v8 userInfo:0];
}

- (TPDialerNumberPad)keypad
{
  return (TPDialerNumberPad *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeypad:(id)a3
{
}

- (PHNumberPadKeyCommandHandler)numberPadKeyCommandHandler
{
  return self->_numberPadKeyCommandHandler;
}

- (TUDTMFSoundPlayer)soundPlayer
{
  return self->_soundPlayer;
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_soundPlayer, 0);
  objc_storeStrong((id *)&self->_numberPadKeyCommandHandler, 0);

  objc_storeStrong((id *)&self->_keypad, 0);
}

@end