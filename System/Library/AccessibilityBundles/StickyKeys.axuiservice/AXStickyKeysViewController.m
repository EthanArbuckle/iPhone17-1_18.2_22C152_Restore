@interface AXStickyKeysViewController
- (AXStickyKeysViewController)init;
- (BOOL)_canShowWhileLocked;
- (BOOL)updateWithKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 state:(int64_t)a5;
- (id)_stickyKeysView;
- (id)_stringForKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4;
- (void)_removeCapsLockIfNeeded;
- (void)dealloc;
- (void)loadView;
- (void)resetWithCompletion:(id)a3;
@end

@implementation AXStickyKeysViewController

- (AXStickyKeysViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXStickyKeysViewController;
  v2 = [(AXStickyKeysViewController *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_removeCapsLockIfNeeded" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    v4 = +[AXSettings sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_3FDC;
    v6[3] = &unk_81E0;
    objc_copyWeak(&v7, &location);
    [v4 registerUpdateBlock:v6 forRetrieveSelector:"voiceOverKeyboardModifierChoice" withListener:v2];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)AXStickyKeysViewController;
  [(AXStickyKeysViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = objc_alloc_init(AXStickyKeysView);
  [(AXStickyKeysViewController *)self setView:v3];
}

- (BOOL)updateWithKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 state:(int64_t)a5
{
  id v7 = [(AXStickyKeysViewController *)self _stringForKeycode:a3 usagePage:*(void *)&a4];
  if (v7)
  {
    switch(a5)
    {
      case 2:
        v8 = [(AXStickyKeysViewController *)self _stickyKeysView];
        [v8 highlightStickyKeyString:v7];
        goto LABEL_8;
      case 1:
        v8 = [(AXStickyKeysViewController *)self _stickyKeysView];
        [v8 removeStickyKeyString:v7];
        goto LABEL_8;
      case 0:
        v8 = [(AXStickyKeysViewController *)self _stickyKeysView];
        [v8 addStickyKeyString:v7];
LABEL_8:

        break;
    }
  }

  return v7 != 0;
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AXStickyKeysViewController *)self _stickyKeysView];
  [v5 removeAllStickyKeyStringsWithCompletion:v4];
}

- (id)_stickyKeysView
{
  return [(AXStickyKeysViewController *)self view];
}

- (void)_removeCapsLockIfNeeded
{
  if (!UIAccessibilityIsVoiceOverRunning()
    || (+[AXSettings sharedInstance],
        v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 voiceOverKeyboardModifierChoice],
        v3,
        (v4 & 2) == 0))
  {
    id v5 = [(AXStickyKeysViewController *)self _stickyKeysView];
    [v5 removeStickyKeyString:@"⇪"];
  }
}

- (id)_stringForKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4
{
  if (a4 == 7)
  {
    switch(a3)
    {
      case 0xE0u:
      case 0xE4u:
        unsigned __int8 v4 = "⌃";
        goto LABEL_21;
      case 0xE1u:
      case 0xE5u:
        unsigned __int8 v4 = "⇧";
        goto LABEL_21;
      case 0xE2u:
      case 0xE6u:
        unsigned __int8 v4 = "⌥";
        goto LABEL_21;
      case 0xE3u:
      case 0xE7u:
        unsigned __int8 v4 = "⌘";
LABEL_21:
        id v5 = +[NSString stringWithUTF8String:v4];
        goto LABEL_22;
      default:
        if (a3 != 57
          || !UIAccessibilityIsVoiceOverRunning()
          || (+[AXSettings sharedInstance],
              objc_super v9 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v10 = [v9 voiceOverKeyboardModifierChoice],
              v9,
              (v10 & 2) == 0))
        {
          id v5 = 0;
          goto LABEL_22;
        }
        v8 = &AXStickyKeyViewCapsLockString;
        break;
    }
  }
  else
  {
    id v5 = 0;
    BOOL v7 = a4 == 255 || a4 == 65281;
    if (a3 != 3 || !v7) {
      goto LABEL_22;
    }
    v8 = AXStickyKeyViewFnString;
  }
  id v5 = *v8;
LABEL_22:

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end