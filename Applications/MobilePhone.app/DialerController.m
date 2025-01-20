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

- (DialerController)initWithDialerType:(int)a3 contactStore:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v8 = [(DialerController *)self initWithDialerType:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_contactStore, a4);
  }

  return v9;
}

- (DialerController)initWithDialerType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v15.receiver = self;
  v15.super_class = (Class)DialerController;
  v4 = [(DialerController *)&v15 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(DialerController *)v4 setDialerType:v3];
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_inCallServiceDidAppear, TUCallCenterInCallServiceDidAppearNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];
    v8 = [[PHNumberPadKeyCommandHandler alloc] initWithViewController:v5 selector:"handleKeyCommand:"];
    keyCommandHandler = v5->_keyCommandHandler;
    v5->_keyCommandHandler = v8;

    v10 = (TUDTMFSoundPlayer *)objc_alloc_init((Class)TUDTMFSoundPlayer);
    soundPlayer = v5->_soundPlayer;
    v5->_soundPlayer = v10;

    v5->_backgroundStyle = 0;
    v12 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v12;
  }
  return v5;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

+ (id)tabBarIconName
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"DIALER" value:&stru_100285990 table:@"General"];

  return v3;
}

+ (id)tabBarIconImage
{
  return +[UIImage systemImageNamed:@"circle.grid.3x3.fill"];
}

- (void)setCallProviderManager:(id)a3
{
}

- (void)applicationDidResume
{
  v5.receiver = self;
  v5.super_class = (Class)DialerController;
  [(DialerController *)&v5 applicationDidResume];
  uint64_t v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Calling _resetButtonAnimation in ", v4, 2u);
  }

  [(DialerController *)self _resetButtonAnimation];
}

- (void)_resetButtonAnimation
{
  if ([(DialerController *)self shouldAnimateCallButton])
  {
    uint64_t v3 = [(DialerController *)self dialerView];
    v4 = [v3 callButton];

    objc_super v5 = +[UIColor systemGreenColor];
    [v4 setBackgroundColor:v5];

    v6 = [v4 layer];
    [v6 removeAllAnimations];

    id v7 = [v4 imageView];
    v8 = [v7 layer];
    [v8 removeAllAnimations];

    [v4 setUserInteractionEnabled:1];
    v19[0] = v4;
    v9 = [(DialerController *)self dialerView];
    v10 = [v9 deleteButton];
    v19[1] = v10;
    v11 = +[NSArray arrayWithObjects:v19 count:2];
    id v12 = [v11 mutableCopy];

    v13 = [(DialerController *)self featureFlags];
    LODWORD(v10) = [v13 smartDialerEnabled];

    if (v10)
    {
      v14 = [(DialerController *)self dialerView];
      objc_super v15 = [v14 addContactButton];
      [v12 addObject:v15];
    }
    v16 = [v4 superview];
    [(DialerController *)self _fadeSubviewsOf:v16 excludingViews:v12 toValue:1.0];

    [(DialerController *)self setBackgroundStyle:0 animated:0];
    [(DialerController *)self setWantsCallButtonAnimation:0];
    v17 = PHDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DialerAnimation: called", v18, 2u);
    }
  }
}

- (BOOL)shouldAnimateCallButton
{
  if ([(DialerController *)self wantsCallButtonAnimation]
    && [(DialerController *)self isViewLoaded]
    && ![(DialerController *)self dialerType])
  {
    objc_super v5 = [(DialerController *)self view];
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

- (BOOL)wantsCallButtonAnimation
{
  return self->_wantsCallButtonAnimation;
}

+ (void)playDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Playing DTMF key: %d", (uint8_t *)v7, 8u);
  }

  objc_super v5 = +[TUCallCenter sharedInstance];
  v6 = [v5 displayedCallFromCalls:0];

  if ([v6 shouldPlayDTMFTone]) {
    [v6 playDTMFToneForKey:v3];
  }
}

+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4
{
  return PHStringShouldAutoDialGivenLastCharacter(a3, a4);
}

+ (BOOL)launchFieldTestIfNeeded:(id)a3
{
  return PHLaunchFieldTestApplicationIfNecessaryForDestinationID(a3);
}

- (TUCallProviderManager)callProviderManager
{
  callProviderManager = self->_callProviderManager;
  if (!callProviderManager)
  {
    v4 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    objc_super v5 = self->_callProviderManager;
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
  id v20 = [v5 initWithFrame:];

  if (![(DialerController *)self dialerType])
  {
    [v20 setAutoresizingMask:18];
    v8 = -[PHHandsetDialerView initWithFrame:]([PHHandsetDialerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v9 = self->_dialerView;
    self->_dialerView = &v8->super;

    v10 = +[UIColor clearColor];
    [v20 setBackgroundColor:v10];

    [v20 setOpaque:0];
    goto LABEL_10;
  }
  if ([(DialerController *)self dialerType] == 1)
  {
    [v20 setAutoresizingMask:18];
    id v7 = PHCarPlayDialerView;
  }
  else
  {
    if ([(DialerController *)self dialerType] != 2) {
      goto LABEL_10;
    }
    id v7 = PHCarPlayInCallDialerView;
  }
  v11 = [[v7 alloc] initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v12 = self->_dialerView;
  self->_dialerView = v11;

LABEL_10:
  [(PHAbstractDialerView *)self->_dialerView setAutoresizingMask:18];
  [(PHAbstractDialerView *)self->_dialerView setDelegate:self];
  [(PHAbstractDialerView *)self->_dialerView bounds];
  [v20 setFrame:];
  [v20 addSubview:self->_dialerView];
  v13 = [(PHAbstractDialerView *)self->_dialerView callButton];
  [v13 addTarget:self action:"_callButtonPressed:" forControlEvents:64];

  v14 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v14 addTarget:self action:"_deleteButtonClicked:" forControlEvents:64];

  objc_super v15 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v15 addTarget:self action:"_deleteButtonDown:" forControlEvents:1];

  v16 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v16 addTarget:self action:"_stopDeleteTimer" forControlEvents:32];

  id v17 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"handleSwipeGesture:"];
  [v17 setDirection:3];
  [v17 setDelegate:self];
  v18 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v18 addGestureRecognizer:v17];

  v19 = [(PHAbstractDialerView *)self->_dialerView phonePadView];
  [v19 setDelegate:self];

  [(DialerController *)self setView:v20];
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
  id v5 = PHDefaultLog();
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
  objc_super v2 = [(DialerController *)self featureFlags];
  char v3 = [v2 smartDialerEnabled] ^ 1;

  return v3;
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
          v8 = PHDefaultLog();
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

+ (id)defaultPNGName
{
  return @"DefaultNumericOnlyDialer";
}

- (void)_clearDisplayIfNecessary
{
  if ((*((unsigned char *)self + 48) & 1) != 0
    || (+[TUCallCenter sharedInstance],
        char v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 currentCallCount],
        v3,
        v4))
  {
    objc_super v5 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v5 setText:&stru_100285990 needsFormat:0];

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
  if (callHistoryController_onceToken != -1) {
    dispatch_once(&callHistoryController_onceToken, &__block_literal_global_1);
  }
  objc_super v2 = (void *)callHistoryController_sCallHistoryController;

  return v2;
}

void __41__DialerController_callHistoryController__block_invoke(id a1)
{
  uint64_t v1 = +[TUCallHistoryController sharedControllerWithCoalescingStrategy:1 options:4];
  uint64_t v2 = callHistoryController_sCallHistoryController;
  callHistoryController_sCallHistoryController = v1;

  _objc_release_x1(v1, v2);
}

+ (id)mostRecentCallHandleValue
{
  uint64_t v2 = +[DialerController callHistoryController];
  BOOL v3 = +[NSNumber numberWithUnsignedInt:kCHCallTypeNormal];
  id v4 = +[NSNumber numberWithUnsignedInt:kCHCallStatusCancelled];
  v24[0] = v4;
  id v5 = +[NSNumber numberWithUnsignedInt:kCHCallStatusConnectedOutgoing];
  v24[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v24 count:2];
  id v7 = +[NSPredicate predicateWithFormat:@"callType == %@ AND callStatus IN %@", v3, v6];
  v8 = [v2 recentCallsWithPredicate:v7];
  char v9 = [v8 firstObject];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v10 = [v9 remoteParticipantHandles];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    v13 = 0;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v16 type] == (id)2)
        {
          uint64_t v17 = [v16 value];

          v13 = (void *)v17;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)lastDialedNumber
{
  if ([(DialerController *)self shouldSuppressShowingLastDialedNumber])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [(id)objc_opt_class() mostRecentCallHandleValue];
  }

  return (NSString *)v2;
}

- (BOOL)shouldSuppressShowingLastDialedNumber
{
  if (!self->_loadedShouldSuppressShowingLastDialedNumberCache)
  {
    self->_loadedShouldSuppressShowingLastDialedNumberCache = 1;
    BOOL v3 = PHPreferencesGetValueInDomain(@"DialerShouldSuppressShowingLastDialedNumber", TUBundleIdentifierMobilePhoneApplication);
    self->_BOOL shouldSuppressShowingLastDialedNumberCache = [v3 BOOLValue];

    id v4 = PHDefaultLog();
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
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = [(DialerController *)self shouldSuppressShowingLastDialedNumber];
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting shouldSuppressShowingLastDialedNumber from %d to %d", (uint8_t *)v7, 0xEu);
    }

    id v6 = +[NSNumber numberWithBool:v3];
    PHPreferencesSetValueInDomain(@"DialerShouldSuppressShowingLastDialedNumber", v6, TUBundleIdentifierMobilePhoneApplication);

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
    id v11 = [v9 deleteButton];
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
  BOOL v6 = (PHAbstractDialerView *)a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (v7 && self->_dialerView == v6)
  {
    BOOL v9 = [v7 encodedDialerString];
    unsigned __int8 v10 = [v8 isEqualToString:v9];
    id v11 = [(DialerController *)self contactResultForPhoneNumber:v9];
    id v12 = [(DialerController *)self featureFlags];
    unsigned int v13 = [v12 smartDialerEnabled];

    if (v13)
    {
      char v14 = v10 ^ 1;
      objc_super v15 = [(PHAbstractDialerView *)self->_dialerView lcdView];
      [v15 setText:v9 needsFormat:1];

      [(DialerController *)self _updateCallButtonEnabledState:v9];
      [(DialerController *)self updateIDSStatus];
      v16 = [v9 unformattedNumberInLatin];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = __47__DialerController_dialerView_stringWasPasted___block_invoke;
      v33[3] = &unk_10027CAD8;
      id v34 = v11;
      v35 = self;
      char v37 = v14;
      id v36 = v8;
      [(DialerController *)self searchFor:v16 shouldRefreshResult:0 completionHandler:v33];

LABEL_15:
      goto LABEL_16;
    }
    if ((v10 & 1) == 0)
    {
      uint64_t v17 = [v11 contacts];
      id v18 = [v17 count];

      if (!v18)
      {
        v29 = [(PHAbstractDialerView *)self->_dialerView lcdView];
        v30 = +[NSBundle mainBundle];
        v31 = [v30 localizedStringForKey:@"QUOTE_%@_QUOTE" value:&stru_100285990 table:@"Dialer"];
        v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v8);
        [v29 setText:v9 needsFormat:1 name:v32 label:0];

        [(DialerController *)self _updateCallButtonEnabledState:v9];
        goto LABEL_15;
      }
    }
    long long v19 = [v11 contacts];
    if ([v19 count])
    {
      long long v20 = [v11 contacts];
      long long v21 = [v20 firstObject];
      unsigned __int8 v22 = [v21 isSuggested];

      if ((v22 & 1) == 0)
      {
        v23 = [(PHAbstractDialerView *)self->_dialerView lcdView];
        v24 = [v11 localizedName];
        v25 = [v11 contactLabel];
        [v23 setText:v9 needsFormat:1 name:v24 label:v25];

        goto LABEL_13;
      }
    }
    else
    {
    }
    v23 = [(DialerController *)self pseudoNameStringForDestinationID:v9];
    v26 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v26 setText:v9 needsFormat:1 name:0 label:0];

    if (!v23)
    {
LABEL_14:

      v27 = [(PHAbstractDialerView *)self->_dialerView lcdView];
      v28 = [v27 text];
      [(DialerController *)self _updateCallButtonEnabledState:v28];

      goto LABEL_15;
    }
    v24 = [(PHAbstractDialerView *)self->_dialerView lcdView];
    [v24 setName:v23 numberLabel:0 suggestion:1];
LABEL_13:

    goto LABEL_14;
  }
LABEL_16:
}

void __47__DialerController_dialerView_stringWasPasted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__DialerController_dialerView_stringWasPasted___block_invoke_cold_1();
    }
  }
  else
  {
    __int16 v8 = [*(id *)(a1 + 32) contacts];
    BOOL v9 = [v8 count] != 0;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __47__DialerController_dialerView_stringWasPasted___block_invoke_123;
    v10[3] = &unk_10027CAB0;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v5;
    BOOL v13 = v9;
    char v14 = *(unsigned char *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

void __47__DialerController_dialerView_stringWasPasted___block_invoke_123(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) lcdView];
  [v2 setContactSearchResults:*(void *)(a1 + 40) hasCompleteMatch:*(unsigned __int8 *)(a1 + 56)];

  if (![*(id *)(a1 + 40) count] && *(unsigned char *)(a1 + 57))
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 24) lcdView];
    BOOL v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"QUOTE_%@_QUOTE" value:&stru_100285990 table:@"Dialer"];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, *(void *)(a1 + 48));
    [v6 setName:v5 numberLabel:0];
  }
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
    _objc_release_x1(v6, lookupTimer);
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
    [v6 setName:v7 numberLabel:&stru_100285990 suggestion:0];
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

  v16 = [v8 superview];

  if (v16)
  {
    uint64_t v17 = [v8 superview];
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
    v20[2] = __38__DialerController__animateCallButton__block_invoke;
    v20[3] = &unk_10027C940;
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
    [v6 setToValue:&off_10028D0A8];
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

    [v7 setKeyTimes:&off_10028CCC8];
    [v7 setDuration:0.254999995];
    [v7 setFillMode:kCAFillModeForwards];
    [v7 setRemovedOnCompletion:0];
    uint64_t v13 = [v5 imageView];
    [v13 setClipsToBounds:0];

    char v14 = [v5 imageView];
    [v14 setContentMode:4];

    +[CATransaction begin];
    objc_super v15 = [v5 imageView];
    v16 = [v15 layer];
    [v16 addAnimation:v6 forKey:@"rollButtonAnimation"];

    uint64_t v17 = [v5 layer];
    [v17 addAnimation:v7 forKey:@"buttonColorAnimation"];

    +[CATransaction commit];
    long long v18 = PHDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Called ", v19, 2u);
    }
  }
}

void __38__DialerController__animateCallButton__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) superview];
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = *(void *)(a1 + 40);
  id v5 = [v4 dialerView];
  double v6 = [v5 deleteButton];
  v8[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v8 count:2];
  [v2 _fadeSubviewsOf:v3 excludingViews:v7 toValue:0.0];
}

- (void)updateIDSStatus
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "=> %@ called in superclass. Should be implemented in subclass if required", v4, v5, v6, v7, v8);
}

- (void)searchFor:(id)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[DialerController updateIDSStatus](a2);
  }
}

- (void)_callButtonPressed:(id)a3
{
  id v5 = [(DialerController *)self callProviderManager];
  uint64_t v4 = [v5 telephonyProvider];
  [(DialerController *)self _callButtonPressedActionWithCallProvider:v4];
}

- (void)_callButtonPressedActionWithCallProvider:(id)a3
{
  id v6 = a3;
  [(DialerController *)self setBackgroundStyle:4 animated:1];
  if ([(DialerController *)self digitsEntered])
  {
    uint64_t v4 = [(DialerController *)self dialerView];
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
  id v6 = [v5 localizedStringForKey:@"RESTRICTED_CONTENT" value:&stru_100285990 table:@"TelephonyUtilities"];
  id v10 = +[UIAlertController alertControllerWithTitle:v6 message:v4 preferredStyle:1];

  uint64_t v7 = TUBundle();
  uint8_t v8 = [v7 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"TelephonyUtilities"];
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

  uint8_t v8 = [(DialerController *)self contactsDataProvider];
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
    uint64_t v14 = [v13 localizedStringForKey:@"UNKNOWN" value:&stru_100285990 table:@"PHCarPlay"];

    id v12 = (void *)v14;
  }
  objc_super v15 = TUBundle();
  v16 = [v15 localizedStringForKey:@"DOWNTIME_CALLER_ALTERNATE_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
  uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v12);

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
    id v9 = PHDefaultLog();
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
  *((unsigned char *)self + 48) &= ~1u;
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

  *((unsigned char *)self + 48) &= ~1u;

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
  id v5 = a3;
  id v6 = [(DialerController *)self dialerView];
  id v7 = [v6 phonePadView];

  if (!v7)
  {
    CFStringRef v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DialerController.m" lineNumber:708 description:@"dialerView.phonePadView == nil"];
  }
  id v9 = [(DialerController *)self keyCommandHandler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __37__DialerController_handleKeyCommand___block_invoke;
  v13[3] = &unk_10027CB00;
  v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __37__DialerController_handleKeyCommand___block_invoke_2;
  v11[3] = &unk_10027CB28;
  v11[4] = self;
  id v12 = v14;
  id v10 = v14;
  [v9 handleKeyCommand:v5 receivedCharacterBlock:v13 receivedSpecialCharacterBlock:v11];
}

void __37__DialerController_handleKeyCommand___block_invoke(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) soundPlayer];
  [v4 attemptToPlayKey:a2];

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = +[NSString stringWithFormat:@"%c", a2];
  [v6 phonePad:v5 appendString:v7];
}

id *__37__DialerController_handleKeyCommand___block_invoke_2(id *result, uint64_t a2)
{
  if (a2 == 1) {
    return (id *)[result[4] _callButtonPressed:0];
  }
  if (!a2) {
    return (id *)[result[4] phonePadDeleteLastDigit:result[5]];
  }
  return result;
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
    CFStringRef v8 = [v7 text];
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
        id v12 = PHDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[DialerController phonePad:keyUp:](v12);
        }
      }
      id v13 = [(PHAbstractDialerView *)self->_dialerView lcdView];
      [v13 setText:&stru_100285990 needsFormat:0];
    }
  }
}

- (void)_dialVoicemail
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not perform dial request, the voicemail call provider is nil.", v1, 2u);
}

- (void)_dialWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  *((unsigned char *)self + 48) |= 1u;
  id v6 = +[UIApplication sharedApplication];
  id v7 = [v4 URL];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __37__DialerController__dialWithRequest___block_invoke;
  v9[3] = &unk_10027C8F0;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [v6 openURL:v7 withCompletionHandler:v9];
}

id __37__DialerController__dialWithRequest___block_invoke(id result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__DialerController__dialWithRequest___block_invoke_cold_1(v2, v3);
    }

    return [*(id *)(v2 + 40) setWantsCallButtonAnimation:0];
  }
  return result;
}

- (void)_deleteRepeat
{
  [(DialerController *)self phonePadDeleteLastDigit:0];
  uint64_t v3 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  id v4 = [v3 text];
  id v5 = [v4 length];

  if (!v5) {
    [(DialerController *)self _stopDeleteTimer];
  }
  *((unsigned char *)self + 48) |= 2u;
}

- (void)_startDeleteTimer
{
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_deleteRepeat" selector:0 userInfo:1 repeats:0.04];
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
  if ((*((unsigned char *)self + 48) & 2) != 0)
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
  *((unsigned char *)self + 48) &= ~2u;
  [(DialerController *)self performSelector:"_startDeleteTimer" withObject:0 afterDelay:0.6];
}

- (BOOL)digitsEntered
{
  uint64_t v2 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  uint64_t v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)restoreLastDialedNumber
{
  uint64_t v3 = +[TUCallCenter sharedInstance];
  if ([v3 currentCallCount])
  {

LABEL_3:
    BOOL v4 = PHDefaultLog();
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
  unsigned int v9 = PHDefaultLog();
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
    id v14 = +[TUCallCenter sharedInstance];
    objc_super v15 = [v14 callFilterController];
    v16 = +[NSSet setWithObject:v13];
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
      unsigned __int8 v22 = +[TUDialRequest dialRequestForCallProvider:v25 handle:v18];
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
      v6[2] = __48__DialerController_setBackgroundStyle_animated___block_invoke;
      v6[3] = &__block_descriptor_40_e5_v8__0l;
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

void __48__DialerController_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  id v2 = +[UIApplication sharedApplication];
  [v2 _setBackgroundStyle:*(void *)(a1 + 32)];
}

- (void)handleApplicationDidEnterBackgroundNotification:(id)a3
{
  [(DialerController *)self deactivateAudioServices];
  uint64_t v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Application entered the background. Keypad button tones are disabled.", v4, 2u);
  }
}

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  unsigned int v3 = [(DialerController *)self requestAudioServicesActivate];
  BOOL v4 = PHDefaultLog();
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
  v3[2] = __46__DialerController_setAudioServicesActivated___block_invoke;
  v3[3] = &unk_10027C838;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void __46__DialerController_setAudioServicesActivated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) phonePadView];
  [v2 setPlaysSounds:*(unsigned __int8 *)(a1 + 40)];
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

- (void)setContactStore:(id)a3
{
}

- (PHAbstractDialerView)dialerView
{
  return (PHAbstractDialerView *)objc_getProperty(self, a2, 24, 1);
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
  return (TUSenderIdentity *)objc_getProperty(self, a2, 88, 1);
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

void __47__DialerController_dialerView_stringWasPasted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error searching for contacts: %@", v1, 0xCu);
}

- (void)phonePad:(os_log_t)log keyUp:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not perform dial request, the telephony call provider is nil.", v1, 2u);
}

void __37__DialerController__dialWithRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  unsigned int v3 = [*(id *)(a1 + 32) URL];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not open URL: %@ for DialRequest: %@", v5, 0x16u);
}

@end