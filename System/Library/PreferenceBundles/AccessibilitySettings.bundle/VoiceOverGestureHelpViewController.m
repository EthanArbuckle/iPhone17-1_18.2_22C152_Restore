@interface VoiceOverGestureHelpViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)prefersStatusBarHidden;
- (VoiceOverGestureHelpView)gestureHelpView;
- (id)_applicableHelpModes;
- (id)_titleForHelpMode:(int64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_didChooseHelpMode:(id)a3;
- (void)hide;
- (void)loadView;
- (void)setGestureHelpView:(id)a3;
- (void)show;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VoiceOverGestureHelpViewController

- (id)_titleForHelpMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(*(&off_209530 + a3), @"VoiceOverSettings");
  }
  return v4;
}

- (id)_applicableHelpModes
{
  v2 = +[NSMutableArray arrayWithObject:&off_229198];
  uint64_t v3 = +[AXSettings sharedInstance];
  if ([v3 voiceOverHandwritingEnabled]) {
    [v2 addObject:&off_2291B0];
  }
  if ([v3 voiceOverBrailleGesturesEnabled]) {
    [v2 addObject:&off_2291C8];
  }

  return v2;
}

- (void)loadView
{
  id v4 = [objc_allocWithZone((Class)VoiceOverGestureHelpView) initWithDelegate:self];
  [(VoiceOverGestureHelpViewController *)self setGestureHelpView:v4];
  uint64_t v3 = [(VoiceOverGestureHelpViewController *)self gestureHelpView];
  [(VoiceOverGestureHelpViewController *)self setView:v3];
}

- (void)show
{
}

- (void)hide
{
  [(VoiceOverGestureHelpView *)self->_gestureHelpView hide];

  [(VoiceOverGestureHelpViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverGestureHelpViewController;
  [(VoiceOverGestureHelpViewController *)&v4 viewDidAppear:a3];
  [(VoiceOverGestureHelpView *)self->_gestureHelpView layoutSubviews];
  [(VoiceOverGestureHelpViewController *)self show];
  [(VoiceOverGestureHelpViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)viewWillAppear:(BOOL)a3
{
  v31.receiver = self;
  v31.super_class = (Class)VoiceOverGestureHelpViewController;
  [(VoiceOverGestureHelpViewController *)&v31 viewWillAppear:a3];
  objc_super v4 = [(VoiceOverGestureHelpViewController *)self navigationController];
  v5 = [v4 navigationBar];
  v6 = [v5 topItem];

  [v6 setHidesBackButton:1];
  v7 = settingsLocString(@"VOICEOVER_GESTURE_HELP_NAVBAR_TITLE", @"VoiceOverSettings");
  [v6 setTitle:v7];

  id v8 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"hide"];
  [v6 setRightBarButtonItem:v8];
  v9 = [(VoiceOverGestureHelpViewController *)self _applicableHelpModes];
  v10 = +[AXSettings sharedInstance];
  id v11 = [v10 voiceOverHelpMode];

  v12 = +[NSNumber numberWithInteger:v11];
  id v13 = [v9 indexOfObject:v12];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = +[AXSettings sharedInstance];
    [v14 setVoiceOverHelpMode:0];

    id v13 = 0;
  }
  if ((unint64_t)[v9 count] < 2)
  {
    [v6 setLeftBarButtonItem:0];
  }
  else
  {
    id v26 = v8;
    v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v9;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = -[VoiceOverGestureHelpViewController _titleForHelpMode:](self, "_titleForHelpMode:", [*(id *)(*((void *)&v27 + 1) + 8 * i) integerValue]);
          [v15 addObject:v21];
        }
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    id v22 = [objc_alloc((Class)UISegmentedControl) initWithItems:v15];
    [v22 addTarget:self action:"_didChooseHelpMode:" forControlEvents:4096];
    [v22 setSelectedSegmentIndex:v13];
    v23 = [(VoiceOverGestureHelpViewController *)self traitCollection];
    v24 = (char *)[v23 horizontalSizeClass];

    if (v24 == (unsigned char *)&dword_0 + 2)
    {
      id v25 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v22];
      [v6 setLeftBarButtonItem:v25];
      [v6 setTitleView:0];
    }
    else
    {
      [v6 setLeftBarButtonItem:0];
      [v6 setTitleView:v22];
    }

    id v8 = v26;
  }
  [(VoiceOverGestureHelpViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverGestureHelpViewController;
  [(VoiceOverGestureHelpViewController *)&v4 viewWillDisappear:a3];
  [(VoiceOverGestureHelpViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverGestureHelpViewController;
  [(VoiceOverGestureHelpViewController *)&v4 viewDidDisappear:a3];
  [(VoiceOverGestureHelpViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (AXDeviceIsPad()) {
    return 30;
  }
  uint64_t v3 = +[AXSettings sharedInstance];
  objc_super v4 = (char *)[v3 voiceOverHelpMode];

  if (v4 == (unsigned char *)&dword_0 + 2) {
    return 24;
  }
  else {
    return 2;
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverGestureHelpViewController;
  -[VoiceOverGestureHelpViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = [(VoiceOverGestureHelpViewController *)self view];
  [v5 layoutSubviews];
}

- (void)_didChooseHelpMode:(id)a3
{
  objc_super v4 = (char *)[a3 selectedSegmentIndex];
  id v8 = [(VoiceOverGestureHelpViewController *)self _applicableHelpModes];
  if (v4 >= [v8 count]) {
    _AXAssert();
  }
  if (v4 >= [v8 count]) {
    objc_super v4 = (char *)[v8 count] - 1;
  }
  v5 = [v8 objectAtIndexedSubscript:v4];
  id v6 = [v5 integerValue];

  v7 = +[AXSettings sharedInstance];
  [v7 setVoiceOverHelpMode:v6];

  if ((char *)[(VoiceOverGestureHelpViewController *)self supportedInterfaceOrientations] != (char *)&dword_1C + 2)[(VoiceOverGestureHelpViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations]; {
}
  }

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (VoiceOverGestureHelpView)gestureHelpView
{
  return self->_gestureHelpView;
}

- (void)setGestureHelpView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end