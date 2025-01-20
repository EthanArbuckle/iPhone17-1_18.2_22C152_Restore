@interface DialerController
+ (BOOL)launchFieldTestIfNeeded:(id)a3;
+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4;
+ (id)callHistoryController;
+ (id)defaultPNGName;
+ (id)mostRecentCallHandleValue;
+ (id)tabBarIconImage;
+ (id)tabBarIconName;
+ (int)tabViewType;
+ (void)playDTMFToneForKey:(unsigned __int8)a3;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)defaultActionIsFaceTimeAudio;
- (BOOL)dialLastDialedNumberByDoubleTap;
- (BOOL)digitsEntered;
- (BOOL)loadedShouldSuppressShowingLastDialedNumberCache;
- (BOOL)requestAudioServicesActivate;
- (BOOL)shouldAnimateCallButton;
- (BOOL)shouldHideDeleteButtonWhenEmpty;
- (BOOL)shouldSnapshot;
- (BOOL)shouldSuppressShowingLastDialedNumber;
- (BOOL)shouldSuppressShowingLastDialedNumberCache;
- (BOOL)wantsCallButtonAnimation;
- (CNContactStore)contactStore;
- (DialerController)initWithDialerType:(int)a3;
- (DialerController)initWithDialerType:(int)a3 contactStore:(id)a4;
- (NSString)lastDialedNumber;
- (NSString)phoneNumberPrefixHint;
- (PHAbstractDialerView)dialerView;
- (PHNumberPadKeyCommandHandler)keyCommandHandler;
- (TUCallProviderManager)callProviderManager;
- (TUContactsDataProvider)contactsDataProvider;
- (TUDTMFSoundPlayer)soundPlayer;
- (TUFeatureFlags)featureFlags;
- (TUSenderIdentity)selectedSenderIdentity;
- (id)contactResultForPhoneNumber:(id)a3;
- (id)defaultCallProvider;
- (id)pseudoNameStringForDestinationID:(id)a3;
- (id)restrictedSubtitleForHandle:(id)a3;
- (int)dialerType;
- (int64_t)backgroundStyle;
- (void)_animateCallButton;
- (void)_callButtonPressed:(id)a3;
- (void)_callButtonPressedActionWithCallProvider:(id)a3;
- (void)_callStatusChanged:(id)a3;
- (void)_clearDisplayIfNecessary;
- (void)_deleteButtonClicked:(id)a3;
- (void)_deleteButtonDown:(id)a3;
- (void)_deleteRepeat;
- (void)_dialVoicemail;
- (void)_dialWithRequest:(id)a3;
- (void)_fadeSubviewsOf:(id)a3 excludingViews:(id)a4 toValue:(double)a5;
- (void)_handleSIMInsertionOrRemoval;
- (void)_phonePad:(id)a3 appendString:(id)a4 suppressClearingDialedNumber:(BOOL)a5;
- (void)_resetButtonAnimation;
- (void)_startDeleteTimer;
- (void)_stopDeleteTimer;
- (void)_stopLookupTimer;
- (void)_updateCallButtonEnabledState:(id)a3;
- (void)_updateCallButtonEnabledState:(id)a3 updateNameNow:(BOOL)a4;
- (void)_updateLCDNameLabelWithAMatchingName:(BOOL)a3;
- (void)_updateLCDNameLabelWithOriginallyPastedString:(id)a3;
- (void)applicationDidResume;
- (void)deactivateAudioServices;
- (void)dealloc;
- (void)dialerView:(id)a3 stringWasPasted:(id)a4;
- (void)dialerViewTextDidChange:(id)a3;
- (void)handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)handleKeyCommand:(id)a3;
- (void)handleSwipeGesture:(id)a3;
- (void)loadView;
- (void)performCallActionForCallProvider:(id)a3;
- (void)performCallActionForCallProvider:(id)a3 video:(BOOL)a4;
- (void)performCallActionForCallProvider:(id)a3 video:(BOOL)a4 senderIdentity:(id)a5;
- (void)performCharacterAddAction:(id)a3;
- (void)performDeleteAction;
- (void)phonePad:(id)a3 appendString:(id)a4;
- (void)phonePad:(id)a3 appendString:(id)a4 playDTMFTone:(BOOL)a5;
- (void)phonePad:(id)a3 dialerCharacterButtonWasHeld:(int64_t)a4;
- (void)phonePad:(id)a3 keyUp:(char)a4;
- (void)phonePad:(id)a3 replaceLastDigitWithString:(id)a4;
- (void)phonePadDeleteLastDigit:(id)a3;
- (void)phonePadDidEndSounds:(id)a3;
- (void)restoreLastDialedNumber;
- (void)searchFor:(id)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5;
- (void)setAudioServicesActivated:(BOOL)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setCallProviderManager:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactsDataProvider:(id)a3;
- (void)setDialLastDialedNumberByDoubleTap:(BOOL)a3;
- (void)setDialerType:(int)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setLoadedShouldSuppressShowingLastDialedNumberCache:(BOOL)a3;
- (void)setPhoneNumberPrefixHint:(id)a3;
- (void)setSelectedSenderIdentity:(id)a3;
- (void)setShouldHideDeleteButtonWhenEmpty:(BOOL)a3;
- (void)setShouldSuppressShowingLastDialedNumber:(BOOL)a3;
- (void)setShouldSuppressShowingLastDialedNumberCache:(BOOL)a3;
- (void)setWantsCallButtonAnimation:(BOOL)a3;
- (void)showOrHideDeleteButton;
- (void)showRestrictedAlertWithMessage:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateIDSStatus;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DialerController

+ (void)playDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Playing DTMF key: %d", (uint8_t *)v7, 8u);
  }

  v5 = +[TUCallCenter sharedInstance];
  v6 = [v5 displayedCallFromCalls:0];

  if ([v6 shouldPlayDTMFTone]) {
    [v6 playDTMFToneForKey:v3];
  }
}

+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4
{
  return sub_100092368(a3, a4);
}

+ (BOOL)launchFieldTestIfNeeded:(id)a3
{
  return sub_100092A58(a3);
}

- (TUCallProviderManager)callProviderManager
{
  callProviderManager = self->_callProviderManager;
  if (!callProviderManager)
  {
    v4 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    v5 = self->_callProviderManager;
    self->_callProviderManager = v4;

    callProviderManager = self->_callProviderManager;
  }

  return callProviderManager;
}

- (id)defaultCallProvider
{
  v2 = [(DialerController *)self callProviderManager];
  uint64_t v3 = [v2 telephonyProvider];

  return v3;
}

- (void)loadView
{
  dialerView = self->_dialerView;
  if (dialerView)
  {
    [(PHAbstractDialerView *)dialerView removeFromSuperview];
    v4 = self->_dialerView;
    self->_dialerView = 0;
  }
  id v5 = objc_alloc((Class)UIView);
  v6 = +[UIScreen mainScreen];
  [v6 bounds];
  id v16 = [v5 initWithFrame:];

  if ([(DialerController *)self dialerType] && [(DialerController *)self dialerType] == 2)
  {
    v7 = -[PHCarPlayInCallDialerView initWithFrame:]([PHCarPlayInCallDialerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v8 = self->_dialerView;
    self->_dialerView = &v7->super;
  }
  [(PHAbstractDialerView *)self->_dialerView setAutoresizingMask:18];
  [(PHAbstractDialerView *)self->_dialerView setDelegate:self];
  [(PHAbstractDialerView *)self->_dialerView bounds];
  [v16 setFrame:];
  [v16 addSubview:self->_dialerView];
  v9 = [(PHAbstractDialerView *)self->_dialerView callButton];
  [v9 addTarget:self action:"_callButtonPressed:" forControlEvents:64];

  v10 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v10 addTarget:self action:"_deleteButtonClicked:" forControlEvents:64];

  v11 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v11 addTarget:self action:"_deleteButtonDown:" forControlEvents:1];

  v12 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v12 addTarget:self action:"_stopDeleteTimer" forControlEvents:32];

  id v13 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"handleSwipeGesture:"];
  [v13 setDirection:3];
  [v13 setDelegate:self];
  v14 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v14 addGestureRecognizer:v13];

  v15 = [(PHAbstractDialerView *)self->_dialerView phonePadView];
  [v15 setDelegate:self];

  [(DialerController *)self setView:v16];
}

- (BOOL)shouldAnimateCallButton
{
  if ([(DialerController *)self wantsCallButtonAnimation]
    && [(DialerController *)self isViewLoaded]
    && ![(DialerController *)self dialerType])
  {
    id v5 = [(DialerController *)self view];
    v6 = [v5 window];
    NSClassFromString(@"_UIHostedWindow");
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)DialerController;
  [(DialerController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DialerController;
  [(DialerController *)&v7 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v4 addObserver:self selector:"handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling _resetButtonAnimation in ", v6, 2u);
  }

  [(DialerController *)self _resetButtonAnimation];
  [(DialerController *)self requestAudioServicesActivate];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DialerController;
  [(DialerController *)&v5 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  [(DialerController *)self _stopLookupTimer];
  [(DialerController *)self _stopDeleteTimer];
  [(DialerController *)self _clearDisplayIfNecessary];
  [(DialerController *)self deactivateAudioServices];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DialerController;
  -[DialerController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(DialerController *)self setBackgroundStyle:0 animated:v3];
}

- (void)applicationDidResume
{
  v5.receiver = self;
  v5.super_class = (Class)DialerController;
  [(DialerController *)&v5 applicationDidResume];
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Calling _resetButtonAnimation in ", v4, 2u);
  }

  [(DialerController *)self _resetButtonAnimation];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)DialerController;
  id v6 = a4;
  [(DialerController *)&v10 touchesBegan:a3 withEvent:v6];
  objc_super v7 = [v6 touchesForView:self->_dialerView];

  if (!v7)
  {
    v8 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    objc_super v7 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v7 endEditing];
  }
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (void)_resetButtonAnimation
{
  if ([(DialerController *)self shouldAnimateCallButton])
  {
    BOOL v3 = [(DialerController *)self dialerView];
    v4 = [v3 callButton];

    objc_super v5 = +[UIColor systemGreenColor];
    [v4 setBackgroundColor:v5];

    id v6 = [v4 layer];
    [v6 removeAllAnimations];

    objc_super v7 = [v4 imageView];
    v8 = [v7 layer];
    [v8 removeAllAnimations];

    [v4 setUserInteractionEnabled:1];
    v16[0] = v4;
    char v9 = [(DialerController *)self dialerView];
    objc_super v10 = [v9 deleteButton];
    v16[1] = v10;
    v11 = +[NSArray arrayWithObjects:v16 count:2];
    id v12 = [v11 mutableCopy];

    id v13 = [v4 superview];
    [(DialerController *)self _fadeSubviewsOf:v13 excludingViews:v12 toValue:1.0];

    [(DialerController *)self setBackgroundStyle:0 animated:0];
    [(DialerController *)self setWantsCallButtonAnimation:0];
    v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DialerAnimation: called", v15, 2u);
    }
  }
}

- (void)_callStatusChanged:(id)a3
{
  id v4 = a3;
  if ([(DialerController *)self shouldAnimateCallButton])
  {
    objc_super v5 = [v4 object];
    if ([v5 status] == 3)
    {
      id v6 = +[TUCallCenter sharedInstance];
      if ([v6 currentCallCount] == (id)1
        && [v5 isEndpointOnCurrentDevice]
        && ![v5 isEmergency])
      {
        unsigned __int8 v7 = [UIApp isSuspendedEventsOnly];

        if ((v7 & 1) == 0)
        {
          v8 = sub_1000D5130();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)char v9 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Calling _animateCallButton in ", v9, 2u);
          }

          [(DialerController *)self _animateCallButton];
        }
      }
      else
      {
      }
    }
  }
}

- (DialerController)initWithDialerType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v15.receiver = self;
  v15.super_class = (Class)DialerController;
  id v4 = [(DialerController *)&v15 init];
  objc_super v5 = v4;
  if (v4)
  {
    [(DialerController *)v4 setDialerType:v3];
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_10007BFE0, TUCallCenterInCallServiceDidAppearNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    unsigned __int8 v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];
    v8 = [[PHNumberPadKeyCommandHandler alloc] initWithViewController:v5 selector:"handleKeyCommand:"];
    keyCommandHandler = v5->_keyCommandHandler;
    v5->_keyCommandHandler = v8;

    objc_super v10 = (TUDTMFSoundPlayer *)objc_alloc_init((Class)TUDTMFSoundPlayer);
    soundPlayer = v5->_soundPlayer;
    v5->_soundPlayer = v10;

    v5->_backgroundStyle = 0;
    id v12 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v12;
  }
  return v5;
}

- (DialerController)initWithDialerType:(int)a3 contactStore:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v8 = [(DialerController *)self initWithDialerType:v5];
  char v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_contactStore, a4);
  }

  return v9;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveEveryObserver();
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  [(DialerController *)self _stopLookupTimer];
  [(DialerController *)self _stopDeleteTimer];
  [(PHAbstractDialerView *)self->_dialerView removeFromSuperview];
  [(PHAbstractDialerView *)self->_dialerView setDelegate:0];
  dialerView = self->_dialerView;
  self->_dialerView = 0;

  id v6 = [(PHAbstractDialerView *)self->_dialerView phonePadView];
  [v6 setDelegate:0];

  v7.receiver = self;
  v7.super_class = (Class)DialerController;
  [(DialerController *)&v7 dealloc];
}

+ (int)tabViewType
{
  return 4;
}

+ (id)tabBarIconImage
{
  return +[UIImage systemImageNamed:@"circle.grid.3x3.fill"];
}

+ (id)tabBarIconName
{
  objc_super v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"DIALER" value:&stru_1002D6110 table:@"General"];

  return v3;
}

+ (id)defaultPNGName
{
  return @"DefaultNumericOnlyDialer";
}

- (void)_clearDisplayIfNecessary
{
  if ((*((unsigned char *)self + 32) & 1) != 0
    || (+[TUCallCenter sharedInstance],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 currentCallCount],
        v3,
        v4))
  {
    uint64_t v5 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v5 setText:&stru_1002D6110 needsFormat:0];

    [(DialerController *)self _updateName];
  }
}

- (BOOL)shouldSnapshot
{
  objc_super v2 = [(DialerController *)self presentedViewController];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_stopLookupTimer
{
  [(NSTimer *)self->_lookupTimer invalidate];
  lookupTimer = self->_lookupTimer;
  self->_lookupTimer = 0;
}

- (id)contactResultForPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
  id v6 = [objc_alloc((Class)TUHandle) initWithType:2 value:v4];

  id v7 = [v5 initWithHandle:v6];
  v8 = [(DialerController *)self phoneNumberPrefixHint];
  [v7 setPhoneNumberPrefixHint:v8];

  char v9 = [(DialerController *)self contactsDataProvider];
  objc_super v10 = [v9 executeFetchRequest:v7];

  return v10;
}

+ (id)callHistoryController
{
  if (qword_1003260A8 != -1) {
    dispatch_once(&qword_1003260A8, &stru_1002CF1C0);
  }
  objc_super v2 = (void *)qword_1003260A0;

  return v2;
}

+ (id)mostRecentCallHandleValue
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v2 = [0 remoteParticipantHandles];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 type] == (id)2)
        {
          uint64_t v9 = [v8 value];

          id v5 = (void *)v9;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)lastDialedNumber
{
  if ([(DialerController *)self shouldSuppressShowingLastDialedNumber])
  {
    objc_super v2 = 0;
  }
  else
  {
    objc_super v2 = [(id)objc_opt_class() mostRecentCallHandleValue];
  }

  return (NSString *)v2;
}

- (BOOL)shouldSuppressShowingLastDialedNumber
{
  if (!self->_loadedShouldSuppressShowingLastDialedNumberCache)
  {
    self->_loadedShouldSuppressShowingLastDialedNumberCache = 1;
    id v3 = sub_10000FA3C(@"DialerShouldSuppressShowingLastDialedNumber", TUBundleIdentifierMobilePhoneApplication);
    self->_BOOL shouldSuppressShowingLastDialedNumberCache = [v3 BOOLValue];

    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL shouldSuppressShowingLastDialedNumberCache = self->_shouldSuppressShowingLastDialedNumberCache;
      v7[0] = 67109120;
      v7[1] = shouldSuppressShowingLastDialedNumberCache;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loaded shouldSuppressShowingLastDialedNumber from defaults as %d", (uint8_t *)v7, 8u);
    }
  }
  return self->_shouldSuppressShowingLastDialedNumberCache;
}

- (void)setShouldSuppressShowingLastDialedNumber:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DialerController *)self shouldSuppressShowingLastDialedNumber] != a3)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = [(DialerController *)self shouldSuppressShowingLastDialedNumber];
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting shouldSuppressShowingLastDialedNumber from %d to %d", (uint8_t *)v7, 0xEu);
    }

    uint64_t v6 = +[NSNumber numberWithBool:v3];
    sub_10000FB08(@"DialerShouldSuppressShowingLastDialedNumber", v6, TUBundleIdentifierMobilePhoneApplication);

    self->_BOOL shouldSuppressShowingLastDialedNumberCache = v3;
  }
}

- (void)setShouldHideDeleteButtonWhenEmpty:(BOOL)a3
{
  self->_shouldHideDeleteButtonWhenEmpty = a3;
  if ([(DialerController *)self shouldHideDeleteButtonWhenEmpty])
  {
    [(DialerController *)self showOrHideDeleteButton];
  }
}

- (void)showOrHideDeleteButton
{
  BOOL v3 = [(DialerController *)self dialerView];
  id v4 = [v3 lcdView];
  id v5 = [v4 text];
  BOOL v6 = [v5 length] == 0;
  id v7 = [(DialerController *)self dialerView];
  __int16 v8 = [v7 deleteButton];
  [v8 setHidden:v6];

  id v12 = [(DialerController *)self dialerView];
  BOOL v9 = [v12 deleteButton];
  if ([v9 isHidden])
  {
    unsigned int v10 = [(DialerController *)self dialerType];

    if (v10 != 1) {
      return;
    }
    id v12 = +[NSNotificationCenter defaultCenter];
    BOOL v9 = [(DialerController *)self dialerView];
    long long v11 = [v9 deleteButton];
    [v12 postNotificationName:@"kPHCarPlayDeleteButtonHideNotification" object:v11];
  }
}

- (void)dialerViewTextDidChange:(id)a3
{
  if (self->_dialerView == a3)
  {
    id v4 = [a3 lcdView];
    id v5 = [v4 text];
    [(DialerController *)self _updateCallButtonEnabledState:v5 updateNameNow:1];

    if ([(DialerController *)self shouldHideDeleteButtonWhenEmpty])
    {
      [(DialerController *)self showOrHideDeleteButton];
    }
  }
}

- (void)dialerView:(id)a3 stringWasPasted:(id)a4
{
  v27 = (PHAbstractDialerView *)a3;
  id v6 = a4;
  if (v6 && self->_dialerView == v27)
  {
    id v7 = [v6 encodedDialerString];
    unsigned __int8 v8 = [v6 isEqualToString:v7];
    BOOL v9 = [(DialerController *)self contactResultForPhoneNumber:v7];
    unsigned int v10 = v9;
    if ((v8 & 1) == 0)
    {
      long long v11 = [v9 contacts];
      id v12 = [v11 count];

      if (!v12)
      {
        v23 = [(PHAbstractDialerView *)self->_dialerView lcdView];
        v24 = +[NSBundle mainBundle];
        v25 = [v24 localizedStringForKey:@"QUOTE_%@_QUOTE" value:&stru_1002D6110 table:@"Dialer"];
        v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v6);
        [v23 setText:v7 needsFormat:1 name:v26 label:0];

        [(DialerController *)self _updateCallButtonEnabledState:v7];
        goto LABEL_13;
      }
    }
    long long v13 = [v10 contacts];
    if ([v13 count])
    {
      long long v14 = [v10 contacts];
      objc_super v15 = [v14 firstObject];
      unsigned __int8 v16 = [v15 isSuggested];

      if ((v16 & 1) == 0)
      {
        v17 = [(PHAbstractDialerView *)self->_dialerView lcdView];
        v18 = [v10 localizedName];
        v19 = [v10 contactLabel];
        [v17 setText:v7 needsFormat:1 name:v18 label:v19];

        goto LABEL_11;
      }
    }
    else
    {
    }
    v17 = [(DialerController *)self pseudoNameStringForDestinationID:v7];
    v20 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v20 setText:v7 needsFormat:1 name:0 label:0];

    if (!v17)
    {
LABEL_12:

      v21 = [(PHAbstractDialerView *)self->_dialerView lcdView];
      v22 = [v21 text];
      [(DialerController *)self _updateCallButtonEnabledState:v22];

LABEL_13:
      goto LABEL_14;
    }
    v18 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v18 setName:v17 numberLabel:0 suggestion:1];
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:
}

- (id)pseudoNameStringForDestinationID:(id)a3
{
  return 0;
}

- (void)_updateCallButtonEnabledState:(id)a3 updateNameNow:(BOOL)a4
{
  BOOL v4 = a4;
  [(DialerController *)self _updateCallButtonEnabledState:a3];

  [(DialerController *)self _updateLCDNameLabelWithAMatchingName:!v4];
}

- (void)_updateLCDNameLabelWithAMatchingName:(BOOL)a3
{
  if (a3
    && ([(PHAbstractDialerView *)self->_dialerView lcdView],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        [v4 text],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_updateName" selector:0 userInfo:0 repeats:0.2];
    lookupTimer = self->_lookupTimer;
    self->_lookupTimer = v6;
  }
  else
  {
    [(DialerController *)self _updateName];
  }
}

- (void)_updateLCDNameLabelWithOriginallyPastedString:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v6 setName:v7 numberLabel:&stru_1002D6110 suggestion:0];
  }
}

- (void)_updateCallButtonEnabledState:(id)a3
{
  id v10 = a3;
  if (self->_lookupTimer) {
    [(DialerController *)self _stopLookupTimer];
  }
  TUNetworkCountryCode();
  int valid = PNIsValidPhoneNumberForCountry();
  char v5 = [(PHAbstractDialerView *)self->_dialerView callButton];
  id v7 = v5;
  if (valid)
  {
    LODWORD(v6) = -1097229926;
  }
  else
  {
    [v5 charge];
    float v9 = fabsf(v8);

    if (v9 < 2.2204e-16) {
      goto LABEL_8;
    }
    char v5 = [(PHAbstractDialerView *)self->_dialerView callButton];
    id v7 = v5;
    double v6 = 0.0;
  }
  [v5 setCharge:v6];

LABEL_8:
}

- (void)_fadeSubviewsOf:(id)a3 excludingViews:(id)a4 toValue:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v8 subviews];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v9 containsObject:v15] & 1) == 0) {
          [v15 setAlpha:a5];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  unsigned __int8 v16 = [v8 superview];

  if (v16)
  {
    v17 = [v8 superview];
    [(DialerController *)self _fadeSubviewsOf:v17 excludingViews:v9 toValue:a5];
  }
}

- (void)_animateCallButton
{
  if ([(DialerController *)self shouldAnimateCallButton])
  {
    BOOL v3 = [(DialerController *)self dialerView];
    BOOL v4 = [v3 callButton];

    [v4 setUserInteractionEnabled:0];
    [(DialerController *)self setBackgroundStyle:4 animated:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10007D58C;
    v20[3] = &unk_1002CDDE0;
    v20[4] = self;
    id v5 = v4;
    id v21 = v5;
    +[UIView animateWithDuration:v20 animations:0.50999999];
    if (objc_opt_respondsToSelector()) {
      [v5 performSelector:"_animationWillBegin"];
    }
    double v6 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    [v6 setMass:2.0];
    [v6 setStiffness:300.0];
    [v6 setDamping:50.0];
    [v6 setDuration:0.50999999];
    [v6 setToValue:&off_1002DFA18];
    [v6 setFillMode:kCAFillModeForwards];
    [v6 setRemovedOnCompletion:0];
    id v7 = +[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    id v8 = +[UIColor systemGreenColor];
    id v9 = [v8 CGColor];

    id v10 = +[UIColor systemRedColor];
    id v11 = [v10 CGColor];

    v22[0] = v9;
    v22[1] = v11;
    id v12 = +[NSArray arrayWithObjects:v22 count:2];
    [v7 setValues:v12];

    [v7 setKeyTimes:&off_1002DF758];
    [v7 setDuration:0.254999995];
    [v7 setFillMode:kCAFillModeForwards];
    [v7 setRemovedOnCompletion:0];
    uint64_t v13 = [v5 imageView];
    [v13 setClipsToBounds:0];

    long long v14 = [v5 imageView];
    [v14 setContentMode:4];

    +[CATransaction begin];
    objc_super v15 = [v5 imageView];
    unsigned __int8 v16 = [v15 layer];
    [v16 addAnimation:v6 forKey:@"rollButtonAnimation"];

    v17 = [v5 layer];
    [v17 addAnimation:v7 forKey:@"buttonColorAnimation"];

    +[CATransaction commit];
    long long v18 = sub_1000D5130();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Called ", v19, 2u);
    }
  }
}

- (void)updateIDSStatus
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1001EAB88(a2);
  }
}

- (void)searchFor:(id)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  double v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1001EAB88(a2);
  }
}

- (void)_callButtonPressed:(id)a3
{
  id v5 = [(DialerController *)self callProviderManager];
  BOOL v4 = [v5 telephonyProvider];
  [(DialerController *)self _callButtonPressedActionWithCallProvider:v4];
}

- (void)_callButtonPressedActionWithCallProvider:(id)a3
{
  id v6 = a3;
  [(DialerController *)self setBackgroundStyle:4 animated:1];
  if ([(DialerController *)self digitsEntered])
  {
    BOOL v4 = [(DialerController *)self dialerView];
    id v5 = [v4 lcdView];
    [v5 endEditing];

    [(DialerController *)self setWantsCallButtonAnimation:1];
    [(DialerController *)self performCallActionForCallProvider:v6];
  }
  else
  {
    [(DialerController *)self restoreLastDialedNumber];
  }
}

- (void)showRestrictedAlertWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = TUBundle();
  id v6 = [v5 localizedStringForKey:@"RESTRICTED_CONTENT" value:&stru_1002D6110 table:@"TelephonyUtilities"];
  id v10 = +[UIAlertController alertControllerWithTitle:v6 message:v4 preferredStyle:1];

  id v7 = TUBundle();
  id v8 = [v7 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"TelephonyUtilities"];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  [v10 addAction:v9];

  [(DialerController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)restrictedSubtitleForHandle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
  id v6 = +[TUHandle handleWithDestinationID:v4];
  id v7 = [v5 initWithHandle:v6];

  id v8 = [(DialerController *)self contactsDataProvider];
  id v9 = [v8 executeFetchRequest:v7];

  id v10 = [v9 localizedName];
  if ([v10 length])
  {
    id v11 = [v9 localizedName];
  }
  else
  {
    id v11 = v4;
  }
  id v12 = v11;

  if (![v12 length])
  {
    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"UNKNOWN" value:&stru_1002D6110 table:@"PHCarPlay"];

    id v12 = (void *)v14;
  }
  objc_super v15 = TUBundle();
  unsigned __int8 v16 = [v15 localizedStringForKey:@"DOWNTIME_CALLER_ALTERNATE_%@" value:&stru_1002D6110 table:@"TelephonyUtilities"];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v12);

  return v17;
}

- (void)phonePad:(id)a3 dialerCharacterButtonWasHeld:(int64_t)a4
{
  if (!a4)
  {
    id v5 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    id v6 = [v5 text];
    id v7 = [v6 length];

    if (v7 == (id)1)
    {
      [(DialerController *)self _dialVoicemail];
    }
  }
}

- (void)performCharacterAddAction:(id)a3
{
  id v4 = a3;
  id v6 = [(DialerController *)self dialerView];
  id v5 = [v6 phonePadView];
  [(DialerController *)self phonePad:v5 appendString:v4 playDTMFTone:0];
}

- (void)phonePad:(id)a3 appendString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DialerController *)self setDialLastDialedNumberByDoubleTap:0];
  [(DialerController *)self phonePad:v7 appendString:v6 playDTMFTone:[(DialerController *)self dialerType] == 2];
}

- (void)phonePad:(id)a3 appendString:(id)a4 playDTMFTone:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(DialerController *)self _phonePad:a3 appendString:v8 suppressClearingDialedNumber:0];
  [(DialerController *)self setBackgroundStyle:4 animated:1];
  if (v5)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will play DTMF tone due to string being appended (%@)", (uint8_t *)&v10, 0xCu);
    }

    +[DialerController playDTMFToneForKey:](DialerController, "playDTMFToneForKey:", [v8 characterAtIndex:0]);
  }
}

- (void)_phonePad:(id)a3 appendString:(id)a4 suppressClearingDialedNumber:(BOOL)a5
{
  id v7 = a4;
  [(DialerController *)self setDialLastDialedNumberByDoubleTap:0];
  id v8 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v13 = [v8 text];

  id v9 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v9 insertStringAtCurrentPosition:v7];

  int v10 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v11 = [v10 text];

  if ([v11 length] == (id)1 && objc_msgSend(v11, "characterAtIndex:", 0) == 44)
  {
    CFStringRef v12 = @"*";
LABEL_7:

    id v11 = (void *)v12;
    goto LABEL_8;
  }
  if ([v11 length] == (id)1 && objc_msgSend(v11, "characterAtIndex:", 0) == 59)
  {
    CFStringRef v12 = @"#";
    goto LABEL_7;
  }
LABEL_8:
  -[DialerController _updateCallButtonEnabledState:updateNameNow:](self, "_updateCallButtonEnabledState:updateNameNow:", v11, [v13 length] == 0);
  *((unsigned char *)self + 32) &= ~1u;
  if (!a5) {
    [(DialerController *)self setShouldSuppressShowingLastDialedNumber:1];
  }
}

- (void)phonePad:(id)a3 replaceLastDigitWithString:(id)a4
{
  id v5 = a4;
  [(DialerController *)self setDialLastDialedNumberByDoubleTap:0];
  id v6 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v6 insertStringAtCurrentPosition:v5 deletingPreviousCharacter:1];

  id v7 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v10 = [v7 text];

  if ([v10 length] == (id)1 && objc_msgSend(v10, "characterAtIndex:", 0) == 44)
  {
    CFStringRef v8 = @"*";
LABEL_7:
    id v9 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v9 setText:v8 needsFormat:1];

    [(DialerController *)self _updateCallButtonEnabledState:v8 updateNameNow:0];
    goto LABEL_8;
  }
  if ([v10 length] == (id)1 && objc_msgSend(v10, "characterAtIndex:", 0) == 59)
  {
    CFStringRef v8 = @"#";
    goto LABEL_7;
  }
LABEL_8:
}

- (void)phonePadDeleteLastDigit:(id)a3
{
  id v4 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v4 deleteCharacter];

  id v5 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v6 = [v5 text];
  [(DialerController *)self _updateCallButtonEnabledState:v6 updateNameNow:0];

  *((unsigned char *)self + 32) &= ~1u;

  [(DialerController *)self setShouldSuppressShowingLastDialedNumber:1];
}

- (NSString)phoneNumberPrefixHint
{
  phoneNumberPrefixHint = self->_phoneNumberPrefixHint;
  if (!phoneNumberPrefixHint)
  {
    id v4 = (void *)CTSettingCopyMyPhoneNumber();
    UIPhonePrefixFromNumber();
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_phoneNumberPrefixHint;
    self->_phoneNumberPrefixHint = v5;

    phoneNumberPrefixHint = self->_phoneNumberPrefixHint;
  }

  return phoneNumberPrefixHint;
}

- (void)handleKeyCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(DialerController *)self dialerView];
  id v6 = [v5 phonePadView];

  id v7 = [(DialerController *)self keyCommandHandler];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007E29C;
  v11[3] = &unk_1002CF1E8;
  v11[4] = self;
  id v12 = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007E338;
  v9[3] = &unk_1002CF210;
  v9[4] = self;
  id v10 = v12;
  id v8 = v12;
  [v7 handleKeyCommand:v4 receivedCharacterBlock:v11 receivedSpecialCharacterBlock:v9];
}

- (void)phonePadDidEndSounds:(id)a3
{
  id v4 = a3;
  if (self->_dialerType == 2 && self->_dtmfPlaying)
  {
    id v5 = v4;
    CTDTMFPlayStop();
    id v4 = v5;
    self->_dtmfPlaying = 0;
  }
}

- (void)phonePad:(id)a3 keyUp:(char)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (self->_dialerType != 2)
  {
    id v7 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    id v8 = [v7 text];
    unsigned int v9 = +[DialerController shouldStringAutoDial:v8 givenLastChar:v4];

    if (v9)
    {
      id v10 = [(DialerController *)self callProviderManager];
      id v11 = [v10 telephonyProvider];

      if (v11)
      {
        [(DialerController *)self performCallActionForCallProvider:v11];
      }
      else
      {
        id v12 = sub_1000D5130();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1001EAC10(v12);
        }
      }
      id v13 = [(PHAbstractDialerView *)self->_dialerView lcdView];
      [v13 setText:&stru_1002D6110 needsFormat:0];
    }
  }
}

- (void)_dialVoicemail
{
  BOOL v3 = [(PHAbstractDialerView *)self->_dialerView phonePadView];
  [v3 cancelTouchTracking];

  uint64_t v4 = [(DialerController *)self callProviderManager];
  id v5 = [v4 voicemailProvider];

  if (v5)
  {
    id v6 = [objc_alloc((Class)TUDialRequest) initWithProvider:v5];
    [v6 setDialType:2];
    id v7 = [(DialerController *)self selectedSenderIdentity];
    id v8 = [v7 accountUUID];
    [v6 setLocalSenderIdentityAccountUUID:v8];

    [v6 setOriginatingUIType:41];
    [(DialerController *)self _dialWithRequest:v6];
  }
  else
  {
    unsigned int v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001EAC54(v9);
    }
  }
}

- (void)_dialWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  *((unsigned char *)self + 32) |= 1u;
  id v6 = +[UIApplication sharedApplication];
  id v7 = [v4 URL];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007E770;
  v9[3] = &unk_1002CDA70;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [v6 openURL:v7 withCompletionHandler:v9];
}

- (void)_deleteRepeat
{
  [(DialerController *)self phonePadDeleteLastDigit:0];
  BOOL v3 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v4 = [v3 text];
  id v5 = [v4 length];

  if (!v5) {
    [(DialerController *)self _stopDeleteTimer];
  }
  *((unsigned char *)self + 32) |= 2u;
}

- (void)_startDeleteTimer
{
  BOOL v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_deleteRepeat" selector:0 userInfo:1 repeats:0.04];
  deleteTimer = self->_deleteTimer;
  self->_deleteTimer = v3;

  [(DialerController *)self _deleteRepeat];
}

- (void)_stopDeleteTimer
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_startDeleteTimer" object:0];
  [(NSTimer *)self->_deleteTimer invalidate];
  deleteTimer = self->_deleteTimer;
  self->_deleteTimer = 0;
}

- (void)handleSwipeGesture:(id)a3
{
}

- (void)_deleteButtonClicked:(id)a3
{
  [(DialerController *)self setDialLastDialedNumberByDoubleTap:0];
  if ((*((unsigned char *)self + 32) & 2) != 0)
  {
    [(DialerController *)self _stopDeleteTimer];
  }
  else
  {
    [(DialerController *)self performDeleteAction];
  }
}

- (void)_deleteButtonDown:(id)a3
{
  *((unsigned char *)self + 32) &= ~2u;
  [(DialerController *)self performSelector:"_startDeleteTimer" withObject:0 afterDelay:0.6];
}

- (BOOL)digitsEntered
{
  objc_super v2 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  BOOL v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)restoreLastDialedNumber
{
  BOOL v3 = +[TUCallCenter sharedInstance];
  if ([v3 currentCallCount])
  {

LABEL_3:
    BOOL v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = +[TUCallCenter sharedInstance];
      BOOL v6 = [v5 currentCallCount] != 0;
      id v7 = [(DialerController *)self lastDialedNumber];
      int v12 = 67109376;
      LODWORD(v13[0]) = v6;
      WORD2(v13[0]) = 1024;
      *(_DWORD *)((char *)v13 + 6) = v7 == 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not updating visible number to saved redialed number because we are in call (%d) or we don't have a redialed number saved (%d)", (uint8_t *)&v12, 0xEu);
    }
    return;
  }
  id v8 = [(DialerController *)self lastDialedNumber];

  if (!v8) {
    goto LABEL_3;
  }
  unsigned int v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(DialerController *)self lastDialedNumber];
    int v12 = 138412290;
    v13[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating visible number to saved redialed number: %@", (uint8_t *)&v12, 0xCu);
  }
  id v11 = [(DialerController *)self lastDialedNumber];
  [(DialerController *)self _phonePad:0 appendString:v11 suppressClearingDialedNumber:1];

  [(DialerController *)self _updateName];
  [(DialerController *)self setDialLastDialedNumberByDoubleTap:1];
}

- (void)performCallActionForCallProvider:(id)a3
{
}

- (void)performCallActionForCallProvider:(id)a3 video:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(DialerController *)self selectedSenderIdentity];
  [(DialerController *)self performCallActionForCallProvider:v6 video:v4 senderIdentity:v7];
}

- (void)performCallActionForCallProvider:(id)a3 video:(BOOL)a4 senderIdentity:(id)a5
{
  BOOL v6 = a4;
  id v25 = a3;
  id v8 = a5;
  unsigned int v9 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v10 = [v9 text];

  if ([v10 length])
  {
    id v11 = [(DialerController *)self dialerView];
    int v12 = [v11 lcdView];
    id v13 = [v12 text];

    if ([(DialerController *)self dialerType] != 1) {
      goto LABEL_5;
    }
    uint64_t v14 = +[TUCallCenter sharedInstance];
    objc_super v15 = [v14 callFilterController];
    unsigned __int8 v16 = +[NSSet setWithObject:v13];
    unsigned int v17 = [v15 shouldRestrictAddresses:v16 forBundleIdentifier:TUBundleIdentifierMobilePhoneApplication];

    if (v17)
    {
      id v18 = [(DialerController *)self restrictedSubtitleForHandle:v13];
      [(DialerController *)self showRestrictedAlertWithMessage:v18];
    }
    else
    {
LABEL_5:
      [(DialerController *)self setShouldSuppressShowingLastDialedNumber:0];
      if (!v25) {
        goto LABEL_14;
      }
      long long v19 = +[NSCharacterSet whitespaceCharacterSet];
      long long v20 = [v10 stringByTrimmingCharactersInSet:v19];
      unsigned __int8 v21 = +[DialerController launchFieldTestIfNeeded:v20];

      if (v21) {
        goto LABEL_14;
      }
      id v18 = [objc_alloc((Class)TUHandle) initWithType:2 value:v10];
      v22 = +[TUDialRequest dialRequestForCallProvider:v25 handle:v18];
      if ([(DialerController *)self dialLastDialedNumberByDoubleTap]) {
        uint64_t v23 = 26;
      }
      else {
        uint64_t v23 = 1;
      }
      [v22 setOriginatingUIType:v23];
      [v22 setPerformDialAssist:[v25 isTelephonyProvider] ^ 1];
      [v22 setPerformLocalDialAssist:0];
      [v22 setVideo:v6];
      if (v8)
      {
        v24 = [v8 accountUUID];
        [v22 setLocalSenderIdentityAccountUUID:v24];
      }
      [(DialerController *)self _dialWithRequest:v22];
    }
LABEL_14:
  }
}

- (void)performDeleteAction
{
  [(DialerController *)self _stopDeleteTimer];

  [(DialerController *)self phonePadDeleteLastDigit:0];
}

- (void)_handleSIMInsertionOrRemoval
{
  [(DialerController *)self setPhoneNumberPrefixHint:0];

  [(DialerController *)self setContactsDataProvider:0];
}

- (BOOL)defaultActionIsFaceTimeAudio
{
  return 0;
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a4)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10007F084;
      v6[3] = &unk_1002CD5C8;
      v6[4] = a3;
      +[UIView animateWithDuration:v6 animations:0.5];
    }
    else
    {
      id v5 = +[UIApplication sharedApplication];
      [v5 _setBackgroundStyle:a3];
    }
  }
}

- (void)handleApplicationDidEnterBackgroundNotification:(id)a3
{
  [(DialerController *)self deactivateAudioServices];
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Application entered the background. Keypad button tones are disabled.", v4, 2u);
  }
}

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  unsigned int v3 = [(DialerController *)self requestAudioServicesActivate];
  BOOL v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Application is entering the foreground. Keypad button tones are enabled: %@.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)deactivateAudioServices
{
}

- (BOOL)requestAudioServicesActivate
{
  unsigned int v3 = +[TUCallCenter sharedInstance];
  if ([v3 currentCallCount]) {
    BOOL v4 = self->_dialerType == 2;
  }
  else {
    BOOL v4 = 1;
  }

  [(DialerController *)self setAudioServicesActivated:v4];
  return v4;
}

- (void)setAudioServicesActivated:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10007F2FC;
  v3[3] = &unk_1002CD918;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (CNContactStore)contactStore
{
  unsigned int v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  unsigned int v5 = [v4 isEqualToString:TUBundleIdentifierInCallServiceApplication];

  if (v5)
  {
    int v6 = +[TUCallCenter sharedInstance];
    CFStringRef v7 = [v6 displayedCallFromCalls:0];

    id v8 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v7];
    [v8 setIncludeDonatedContacts:1];
    [v8 setIncludeSuggestedContacts:1];
    unsigned int v9 = (CNContactStore *)[objc_alloc((Class)CNContactStore) initWithConfiguration:v8];
  }
  else
  {
    contactStore = self->_contactStore;
    if (!contactStore)
    {
      id v11 = +[CNContactStore suggestedContactStore];
      int v12 = self->_contactStore;
      self->_contactStore = v11;

      contactStore = self->_contactStore;
    }
    unsigned int v9 = contactStore;
  }

  return v9;
}

- (TUContactsDataProvider)contactsDataProvider
{
  unsigned int v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  unsigned int v5 = [v4 isEqualToString:TUBundleIdentifierInCallServiceApplication];

  if (v5)
  {
    id v6 = objc_alloc((Class)TUContactsDataProvider);
    CFStringRef v7 = [(DialerController *)self contactStore];
    id v8 = (TUContactsDataProvider *)[v6 initWithContactsDataSource:v7];
  }
  else
  {
    contactsDataProvider = self->_contactsDataProvider;
    if (!contactsDataProvider)
    {
      id v10 = objc_alloc((Class)TUContactsDataProvider);
      id v11 = [(DialerController *)self contactStore];
      int v12 = (TUContactsDataProvider *)[v10 initWithContactsDataSource:v11];
      id v13 = self->_contactsDataProvider;
      self->_contactsDataProvider = v12;

      contactsDataProvider = self->_contactsDataProvider;
    }
    id v8 = contactsDataProvider;
  }

  return v8;
}

- (void)setCallProviderManager:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (PHAbstractDialerView)dialerView
{
  return (PHAbstractDialerView *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)shouldHideDeleteButtonWhenEmpty
{
  return self->_shouldHideDeleteButtonWhenEmpty;
}

- (BOOL)shouldSuppressShowingLastDialedNumberCache
{
  return self->_shouldSuppressShowingLastDialedNumberCache;
}

- (void)setShouldSuppressShowingLastDialedNumberCache:(BOOL)a3
{
  self->_BOOL shouldSuppressShowingLastDialedNumberCache = a3;
}

- (BOOL)loadedShouldSuppressShowingLastDialedNumberCache
{
  return self->_loadedShouldSuppressShowingLastDialedNumberCache;
}

- (void)setLoadedShouldSuppressShowingLastDialedNumberCache:(BOOL)a3
{
  self->_loadedShouldSuppressShowingLastDialedNumberCache = a3;
}

- (TUSenderIdentity)selectedSenderIdentity
{
  return (TUSenderIdentity *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelectedSenderIdentity:(id)a3
{
}

- (void)setPhoneNumberPrefixHint:(id)a3
{
}

- (int)dialerType
{
  return self->_dialerType;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

- (BOOL)wantsCallButtonAnimation
{
  return self->_wantsCallButtonAnimation;
}

- (void)setWantsCallButtonAnimation:(BOOL)a3
{
  self->_wantsCallButtonAnimation = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setContactsDataProvider:(id)a3
{
}

- (PHNumberPadKeyCommandHandler)keyCommandHandler
{
  return self->_keyCommandHandler;
}

- (TUDTMFSoundPlayer)soundPlayer
{
  return self->_soundPlayer;
}

- (BOOL)dialLastDialedNumberByDoubleTap
{
  return self->_dialLastDialedNumberByDoubleTap;
}

- (void)setDialLastDialedNumberByDoubleTap:(BOOL)a3
{
  self->_dialLastDialedNumberByDoubleTap = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_soundPlayer, 0);
  objc_storeStrong((id *)&self->_keyCommandHandler, 0);
  objc_storeStrong((id *)&self->_contactsDataProvider, 0);
  objc_storeStrong((id *)&self->_phoneNumberPrefixHint, 0);
  objc_storeStrong((id *)&self->_selectedSenderIdentity, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_lookupTimer, 0);
  objc_storeStrong((id *)&self->_deleteTimer, 0);

  objc_storeStrong((id *)&self->_dialerView, 0);
}

@end