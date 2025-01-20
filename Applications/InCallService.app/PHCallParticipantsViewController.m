@interface PHCallParticipantsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsFieldModeSendButton;
- (BOOL)anyLabelDescriptorIsDynamic;
- (BOOL)callIsAboutToEndForStewie;
- (BOOL)handlesCallWaitingCalls;
- (BOOL)isCallRinging;
- (BOOL)isDeviceCapableOfTelephonyCalls;
- (BOOL)isFrontmostCallFaceTimeAudio;
- (BOOL)shouldIgnoreUpdates;
- (BOOL)shouldInsertSpaceBeforeNextOverrideStringCharacter;
- (BOOL)shouldShowCallDetailsViewButton;
- (BOOL)shouldShowInfoButtonForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (BOOL)shouldShowLargeAvatar;
- (BOOL)shouldShowParticipantImageAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (BOOL)shouldShowParticipantLabel;
- (BOOL)shouldShowSingleDurationLabel;
- (BOOL)usesCompactMulticallUI;
- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory;
- (CNKFeatures)features;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSCache)contactsCache;
- (NSMutableArray)callGroups;
- (NSNumberFormatter)numberFormatter;
- (NSString)nameOverrideString;
- (PHCallParticipantsView)participantsView;
- (PHCallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3;
- (PHCallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3 contactsCache:(id)a4;
- (PHCallParticipantsViewControllerDelegate)delegate;
- (TUCall)prioritizedCall;
- (id)callForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)colorForParticipantLabelView:(id)a3;
- (id)colorForStatusLabelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)compactLabelTextForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)contactForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)currentCallGroups;
- (id)customFontForParticipantLabel;
- (id)fontForParticipantLabelView:(id)a3;
- (id)fontForParticipantLabelViewStatusLabel:(id)a3;
- (id)frontmostCall;
- (id)frontmostCallGroup;
- (id)iconInParticipantsView:(id)a3;
- (id)labelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4 allowsDuration:(BOOL)a5;
- (id)localizedSenderIdentityForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)nameForCallGroup:(id)a3;
- (id)nameForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)supplementalParticipantLabelFormatStringAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (unint64_t)bannerButtonsState;
- (unint64_t)numberOfParticipantLabels;
- (unsigned)activityStateForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (void)_updateCallGroups;
- (void)callContinuityChangedNotification:(id)a3;
- (void)callModelChangedNotification:(id)a3;
- (void)callStatusChangedNotification:(id)a3;
- (void)conferenceParticipantsChangedNotification:(id)a3;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)dealloc;
- (void)displayContextChangedNotification:(id)a3;
- (void)fieldModeSendButtonTappedInParticipantsView:(id)a3;
- (void)handleAlertDisconnectingCallsNotification:(id)a3;
- (void)isThirdPartyVideoChangedNotification:(id)a3;
- (void)keypadDataSourceChangedNotification:(id)a3;
- (void)loadView;
- (void)localSenderIdentityAccountUUIDChangedNotification:(id)a3;
- (void)participantTappedAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (void)participantViewCallDetailsGestureRecognizerTapped;
- (void)participantViewInfoButtonTappedAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (void)participantsView:(id)a3 didPerformActionType:(int64_t)a4;
- (void)resetNameOverrideString;
- (void)secondTickNotification:(id)a3;
- (void)setAllowsFieldModeSendButton:(BOOL)a3;
- (void)setBannerAudioRouteButtonSelected:(BOOL)a3;
- (void)setBannerButtonsState:(unint64_t)a3;
- (void)setCallGroups:(id)a3;
- (void)setCallIsAboutToEndForStewie:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlesCallWaitingCalls:(BOOL)a3;
- (void)setNameOverrideString:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setParticipantsView:(id)a3;
- (void)setPrioritizedCall:(id)a3;
- (void)setShouldIgnoreUpdates:(BOOL)a3;
- (void)setShouldInsertSpaceBeforeNextOverrideStringCharacter;
- (void)setShouldInsertSpaceBeforeNextOverrideStringCharacter:(BOOL)a3;
- (void)tuCallHasBeenRedirectedChangedNotification:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCallParticipantsViewController

- (PHCallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3
{
  return [(PHCallParticipantsViewController *)self initWithCallDisplayStyleManager:a3 contactsCache:0];
}

- (PHCallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3 contactsCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHCallParticipantsViewController;
  v9 = [(PHCallParticipantsViewController *)&v15 init];
  if (v9)
  {
    uint64_t v10 = +[CNKFeatures sharedInstance];
    features = v9->_features;
    v9->_features = (CNKFeatures *)v10;

    objc_storeStrong((id *)&v9->_callDisplayStyleManager, a3);
    uint64_t v12 = objc_opt_new();
    labelDescriptorFactory = v9->_labelDescriptorFactory;
    v9->_labelDescriptorFactory = (CNKCallParticipantLabelDescriptorFactory *)v12;

    objc_storeStrong((id *)&v9->_contactsCache, a4);
  }

  return v9;
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v3 = +[PHIntervalTimer oneSecondTimer];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PHCallParticipantsViewController;
  [(PHCallParticipantsViewController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCallParticipantsViewController;
  [(PHCallParticipantsViewController *)&v8 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
  [v4 addObserver:self selector:"callStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v4 addObserver:self selector:"localSenderIdentityAccountUUIDChangedNotification:" name:TUCallLocalSenderIdentityAccountUUIDChangedNotification object:0];
  [v4 addObserver:self selector:"conferenceParticipantsChangedNotification:" name:TUCallCenterConferenceParticipantsChangedNotification object:0];
  [v4 addObserver:self selector:"isThirdPartyVideoChangedNotification:" name:TUCallIsThirdPartyVideoChangedNotification object:0];
  [v4 addObserver:self selector:"callModelChangedNotification:" name:TUCallModelChangedNotification object:0];
  [v4 addObserver:self selector:"displayContextChangedNotification:" name:TUCallDisplayContextChangedNotification object:0];
  [v4 addObserver:self selector:"keypadDataSourceChangedNotification:" name:@"PHInCallKeypadDataSourceChangedNotification" object:0];
  [v4 addObserver:self selector:"callContinuityChangedNotification:" name:TUCallCenterCallContinuityStateChangedNotification object:0];
  [v4 addObserver:self selector:"handleAlertDisconnectingCallsNotification:" name:@"PHAlertDisconnectingCallsNotification" object:0];
  [v4 addObserver:self selector:"tuCallHasBeenRedirectedChangedNotification:" name:TUCallHasBeenRedirectedChangedNotification object:0];
  objc_super v5 = +[TUCallCenter sharedInstance];
  v6 = [v5 conversationManager];
  [v6 addDelegate:self queue:&_dispatch_main_q];

  id v7 = +[PHIntervalTimer oneSecondTimer];
  [v7 addObserver:self selector:"secondTickNotification:"];

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCallParticipantsViewController;
  [(PHCallParticipantsViewController *)&v8 viewDidDisappear:a3];
  v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 currentAudioAndVideoCallCount];

  if (!v5)
  {
    v6 = [(PHCallParticipantsViewController *)self callGroups];
    [v6 removeAllObjects];
  }
  id v7 = +[PHIntervalTimer oneSecondTimer];
  [v7 removeObserver:self];
}

- (void)loadView
{
  v3 = [PHCallParticipantsView alloc];
  v4 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
  id v5 = [(PHCallParticipantsView *)v3 initWithCallDisplayStyleManager:v4];

  [(PHCallParticipantsView *)v5 setDelegate:self];
  [(PHCallParticipantsViewController *)self setParticipantsView:v5];
  [(PHCallParticipantsViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PHCallParticipantsViewController;
  [(PHCallParticipantsViewController *)&v2 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPrioritizedCall:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);
  unsigned __int8 v5 = [WeakRetained isEqualToCall:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_prioritizedCall, obj);
    [(PHCallParticipantsViewController *)self updateCallGroups];
  }
}

- (TUCall)prioritizedCall
{
  if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI]) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);
  }
  else {
    id WeakRetained = 0;
  }

  return (TUCall *)WeakRetained;
}

- (NSMutableArray)callGroups
{
  callGroups = self->_callGroups;
  if (!callGroups)
  {
    v4 = +[NSMutableArray array];
    unsigned __int8 v5 = self->_callGroups;
    self->_callGroups = v4;

    [(PHCallParticipantsViewController *)self _updateCallGroups];
    callGroups = self->_callGroups;
  }

  return callGroups;
}

- (id)currentCallGroups
{
  objc_super v2 = +[TUCallCenter sharedInstance];
  v3 = [v2 currentCallGroups];

  return v3;
}

- (void)_updateCallGroups
{
  if (![(PHCallParticipantsViewController *)self callIsAboutToEndForStewie])
  {
    v4 = [(PHCallParticipantsViewController *)self currentCallGroups];
    unsigned __int8 v5 = [v4 mutableCopy];

    v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PHCallParticipantsViewController *)self callGroups];
      *(_DWORD *)buf = 138412546;
      v130 = v7;
      __int16 v131 = 2112;
      v132 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_updateCallGroups: CACHED: %@ -> CURRENT: %@", buf, 0x16u);
    }
    objc_super v8 = &_ss4Int8VN_ptr;
    v9 = +[TUCallCenter sharedInstance];
    uint64_t v10 = [v9 callWithStatus:1];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      v13 = +[TUCallCenter sharedInstance];
      id v12 = [v13 callWithStatus:2];
    }
    if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI])
    {
      v14 = [(PHCallParticipantsViewController *)self prioritizedCall];

      if (v14)
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        objc_super v15 = v5;
        id v95 = [v15 countByEnumeratingWithState:&v119 objects:v128 count:16];
        if (!v95) {
          goto LABEL_26;
        }
        uint64_t v16 = *(void *)v120;
        id v97 = v12;
        v98 = v5;
LABEL_13:
        v17 = 0;
        while (1)
        {
          uint64_t v18 = v16;
          if (*(void *)v120 != v16) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v119 + 1) + 8 * (void)v17);
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          v96 = v19;
          v20 = [v19 calls];
          id v21 = [v20 countByEnumeratingWithState:&v115 objects:v127 count:16];
          if (v21) {
            break;
          }
LABEL_24:

          v17 = (char *)v17 + 1;
          id v12 = v97;
          unsigned __int8 v5 = v98;
          uint64_t v16 = v18;
          if (v17 == v95)
          {
            objc_super v8 = &_ss4Int8VN_ptr;
            id v95 = [v15 countByEnumeratingWithState:&v119 objects:v128 count:16];
            if (!v95)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_13;
          }
        }
        id v22 = v21;
        uint64_t v23 = *(void *)v116;
LABEL_18:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v116 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v115 + 1) + 8 * v24);
          v26 = [(PHCallParticipantsViewController *)self prioritizedCall];
          LODWORD(v25) = [v25 isEqualToCall:v26];

          if (v25) {
            break;
          }
          if (v22 == (id)++v24)
          {
            id v22 = [v20 countByEnumeratingWithState:&v115 objects:v127 count:16];
            if (!v22) {
              goto LABEL_24;
            }
            goto LABEL_18;
          }
        }
        v38 = sub_1000D5130();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = [(PHCallParticipantsViewController *)self prioritizedCall];
          *(_DWORD *)buf = 138412290;
          v130 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Updated call groups using prioritizedCall: %@", buf, 0xCu);
        }
        v126 = v96;
        v40 = +[NSArray arrayWithObjects:&v126 count:1];
        id v41 = [v40 mutableCopy];
        [(PHCallParticipantsViewController *)self setCallGroups:v41];

        v42 = [(PHCallParticipantsViewController *)self participantsView];
        [v42 updateParticipantsAnimated:1];

        BOOL v43 = [(PHCallParticipantsViewController *)self shouldShowSingleDurationLabel];
        v44 = [(PHCallParticipantsViewController *)self participantsView];
        [v44 setShouldShowSingleDurationLabel:v43];

        v3 = v15;
        id v12 = v97;
        goto LABEL_107;
      }
    }
LABEL_27:
    if ([v5 count])
    {
      v99 = v5;
      id v27 = v12;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      v28 = [(PHCallParticipantsViewController *)self callGroups];
      id v29 = [v28 countByEnumeratingWithState:&v111 objects:v125 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v112;
        char v32 = 1;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v112 != v31) {
              objc_enumerationMutation(v28);
            }
            v34 = *(void **)(*((void *)&v111 + 1) + 8 * i);
            v35 = [v34 calls];
            id v36 = [v35 count];

            if (v36 && [v34 disconnectedReasonRequiresCallBackUI]) {
              char v32 = 0;
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v111 objects:v125 count:16];
        }
        while (v30);
      }
      else
      {
        char v32 = 1;
      }

      int v37 = v32 & 1;
      id v12 = v27;
      unsigned __int8 v5 = v99;
      objc_super v8 = &_ss4Int8VN_ptr;
    }
    else
    {
      int v37 = 1;
    }
    v45 = [v8[349] sharedInstance];
    v46 = [v45 incomingCall];
    if (v46 && v12 && (unint64_t)[v5 count] >= 2)
    {
      unsigned __int8 v47 = [(PHCallParticipantsViewController *)self handlesCallWaitingCalls];

      if ((v47 & 1) == 0)
      {
        v3 = +[NSMutableArray array];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        v48 = v5;
        id v49 = [v48 countByEnumeratingWithState:&v107 objects:v124 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v108;
          do
          {
            for (j = 0; j != v50; j = (char *)j + 1)
            {
              if (*(void *)v108 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = *(void **)(*((void *)&v107 + 1) + 8 * (void)j);
              if ([v53 status] != 4) {
                [v3 addObject:v53];
              }
            }
            id v50 = [v48 countByEnumeratingWithState:&v107 objects:v124 count:16];
          }
          while (v50);
        }

        if ((v37 & 1) == 0) {
          goto LABEL_92;
        }
        goto LABEL_79;
      }
    }
    else
    {
    }
    v54 = [v8[349] sharedInstance];
    v55 = [v54 incomingCalls];
    if ((unint64_t)[v55 count] <= 1)
    {
      unsigned __int8 v56 = [(PHCallParticipantsViewController *)self handlesCallWaitingCalls];

      if ((v56 & 1) == 0)
      {
        v3 = v5;
        if (!v37) {
          goto LABEL_92;
        }
LABEL_79:
        v63 = [(PHCallParticipantsViewController *)self callGroups];
        id v64 = [v63 count];

        if (!v64) {
          goto LABEL_92;
        }
        v65 = 0;
        while (1)
        {
          v66 = [(PHCallParticipantsViewController *)self callGroups];
          v67 = [v66 objectAtIndex:v65];

          if (([v3 containsObject:v67] & 1) == 0)
          {
            v68 = [v67 calls];
            if ([v68 count] == (id)1)
            {
              unsigned __int8 v69 = [v67 isConferenced];

              if ((v69 & 1) != 0 || (unint64_t)[v3 count] > 1) {
                goto LABEL_91;
              }
              v70 = (char *)[v3 count];
              v71 = v70 >= v65 ? v65 : v70;
              [v3 insertObject:v67 atIndex:v71];
              if ([v67 disconnectedReasonRequiresCallBackUI]) {
                goto LABEL_91;
              }
              dispatch_time_t v72 = dispatch_time(0, 3000000000);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000AD79C;
              block[3] = &unk_1002CDDE0;
              id v101 = v67;
              v102 = self;
              dispatch_after(v72, (dispatch_queue_t)&_dispatch_main_q, block);
              v68 = v101;
            }
          }
LABEL_91:

          ++v65;
          v73 = [(PHCallParticipantsViewController *)self callGroups];
          v74 = (char *)[v73 count];

          if (v74 <= v65) {
            goto LABEL_92;
          }
        }
      }
    }
    else
    {
    }
    v57 = +[NSMutableArray array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v3 = v5;
    id v58 = [v3 countByEnumeratingWithState:&v103 objects:v123 count:16];
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = *(void *)v104;
      while (2)
      {
        for (k = 0; k != v59; k = (char *)k + 1)
        {
          if (*(void *)v104 != v60) {
            objc_enumerationMutation(v3);
          }
          v62 = *(void **)(*((void *)&v103 + 1) + 8 * (void)k);
          if ([v62 status] == 4)
          {
            [v57 addObject:v62];
            goto LABEL_74;
          }
        }
        id v59 = [v3 countByEnumeratingWithState:&v103 objects:v123 count:16];
        if (v59) {
          continue;
        }
        break;
      }
    }
LABEL_74:

    if ([v57 count])
    {

      v3 = v57;
      goto LABEL_92;
    }

    if ((v37 & 1) == 0)
    {
LABEL_92:
      v75 = [(PHCallParticipantsViewController *)self features];
      if ([v75 callManagerEnabled])
      {
        v76 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
        id v77 = [v76 callDisplayStyle];

        if (v77 != (id)3) {
          goto LABEL_97;
        }
      }
      else
      {
      }
      v78 = [v3 __imArrayByFilteringWithBlock:&stru_1002CFDA0];
      v79 = [v78 mutableCopy];

      v3 = v79;
LABEL_97:
      if (![v3 count])
      {
        v80 = +[UIApplication sharedApplication];
        v81 = [v80 delegate];
        v82 = [v81 mostRecentlyDisconnectedAudioCall];

        if (v82)
        {
          id v83 = objc_alloc((Class)TUCallGroup);
          v84 = +[UIApplication sharedApplication];
          v85 = [v84 delegate];
          v86 = [v85 mostRecentlyDisconnectedAudioCall];
          id v87 = [v83 initWithCall:v86];

          [v3 addObject:v87];
        }
      }
      v88 = [(PHCallParticipantsViewController *)self callGroups];
      id v89 = [v88 count];
      if (v89 != [v3 count])
      {
        v90 = [(PHCallParticipantsViewController *)self delegate];
        char v91 = objc_opt_respondsToSelector();

        if ((v91 & 1) == 0)
        {
LABEL_104:
          v92 = sub_1000D5130();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v130 = v3;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Updated call groups: %@", buf, 0xCu);
          }

          [(PHCallParticipantsViewController *)self setCallGroups:v3];
          v93 = [(PHCallParticipantsViewController *)self participantsView];
          [v93 updateParticipantsAnimated:1];

          BOOL v94 = [(PHCallParticipantsViewController *)self shouldShowSingleDurationLabel];
          objc_super v15 = [(PHCallParticipantsViewController *)self participantsView];
          [v15 setShouldShowSingleDurationLabel:v94];
LABEL_107:

          goto LABEL_108;
        }
        v88 = [(PHCallParticipantsViewController *)self delegate];
        [v88 callParticipantsViewController:self willShowMultipleLabel:(unint64_t)-[NSObject count](v3, "count") > 1];
      }

      goto LABEL_104;
    }
    goto LABEL_79;
  }
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Call is about to be ended by presenting Stewie, skip all the updates from now on", buf, 2u);
  }
LABEL_108:
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    unsigned __int8 v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:1];
    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (void)callStatusChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callStatusChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)localSenderIdentityAccountUUIDChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "localSenderIdentityAccountUUIDChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)conferenceParticipantsChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "conferenceParticipantsChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)isThirdPartyVideoChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "isThirdPartyVideoChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)callModelChangedNotification:(id)a3
{
  id v4 = +[TUCallCenter sharedInstance];
  unsigned int v5 = [v4 isAmbiguous];

  int v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NOT AMBIGUOUS";
    if (v5) {
      CFStringRef v7 = @"AMBIGUOUS";
    }
    int v10 = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callModelChanged: %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = [(PHCallParticipantsViewController *)self shouldShowSingleDurationLabel];
  v9 = [(PHCallParticipantsViewController *)self participantsView];
  [v9 setShouldShowSingleDurationLabel:v8];
}

- (void)displayContextChangedNotification:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "displayNameChanged", v6, 2u);
  }

  unsigned int v5 = [(PHCallParticipantsViewController *)self participantsView];
  [v5 updateParticipants];
}

- (void)secondTickNotification:(id)a3
{
  if ([(PHCallParticipantsViewController *)self anyLabelDescriptorIsDynamic])
  {
    id v4 = [(PHCallParticipantsViewController *)self participantsView];
    [v4 updateParticipants];
  }
}

- (void)callContinuityChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callContinuityChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)handleAlertDisconnectingCallsNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleAlertDisconnectingCallsNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self setCallIsAboutToEndForStewie:1];
}

- (void)tuCallHasBeenRedirectedChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "tuCallHasBeenRedirectedChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHCallParticipantsViewController *)self _updateCallGroups];
}

- (void)keypadDataSourceChangedNotification:(id)a3
{
  id v19 = a3;
  id v4 = [(PHCallParticipantsViewController *)self numberFormatter];
  unsigned int v5 = [v19 object];
  int v6 = [v4 numberFromString:v5];

  if (v6) {
    +[NSNumberFormatter localizedStringFromNumber:v6 numberStyle:0];
  }
  else {
  id v7 = [v19 object];
  }
  BOOL v8 = [(PHCallParticipantsViewController *)self nameOverrideString];

  if (v8)
  {
    if ([(PHCallParticipantsViewController *)self shouldInsertSpaceBeforeNextOverrideStringCharacter])
    {
      v9 = [(PHCallParticipantsViewController *)self nameOverrideString];
      int v10 = +[NSString stringWithFormat:@"%@ %@", v9, v7];
      [(PHCallParticipantsViewController *)self setNameOverrideString:v10];
    }
    else
    {
      CFStringRef v11 = [(PHCallParticipantsViewController *)self nameOverrideString];
      id v12 = [v11 stringByAppendingString:v7];
      [(PHCallParticipantsViewController *)self setNameOverrideString:v12];
    }
  }
  else
  {
    [(PHCallParticipantsViewController *)self setNameOverrideString:v7];
  }
  if ([(PHCallParticipantsViewController *)self allowsFieldModeSendButton])
  {
    v13 = [(PHCallParticipantsViewController *)self nameOverrideString];
    v14 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    objc_super v15 = [v13 stringByTrimmingCharactersInSet:v14];
    BOOL v16 = sub_100092368(v15, (char)[v7 characterAtIndex:0]);

    if (v16)
    {
      v17 = [(PHCallParticipantsViewController *)self participantsView];
      [(PHCallParticipantsViewController *)self fieldModeSendButtonTappedInParticipantsView:v17];
    }
  }
  [(PHCallParticipantsViewController *)self setShouldInsertSpaceBeforeNextOverrideStringCharacter:0];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"setShouldInsertSpaceBeforeNextOverrideStringCharacter" object:0];
  [(PHCallParticipantsViewController *)self performSelector:"setShouldInsertSpaceBeforeNextOverrideStringCharacter" withObject:0 afterDelay:4.0];
  uint64_t v18 = [(PHCallParticipantsViewController *)self participantsView];
  [v18 updateParticipants];
}

- (void)setShouldInsertSpaceBeforeNextOverrideStringCharacter
{
}

- (void)resetNameOverrideString
{
  v3 = [(PHCallParticipantsViewController *)self nameOverrideString];

  if (v3)
  {
    [(PHCallParticipantsViewController *)self setNameOverrideString:0];
    id v4 = [(PHCallParticipantsViewController *)self participantsView];
    [v4 updateParticipantsAnimated:1];

    unsigned int v5 = [(PHCallParticipantsViewController *)self participantsView];
    [v5 layoutIfNeeded];
  }

  [(PHCallParticipantsViewController *)self setAllowsFieldModeSendButton:0];
}

- (id)contactForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  if ([(PHCallParticipantsViewController *)self shouldShowParticipantImageAtIndex:a3 inParticipantsView:a4])
  {
    if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI])
    {
      int v6 = [(PHCallParticipantsViewController *)self frontmostCallGroup];
    }
    else
    {
      BOOL v8 = [(PHCallParticipantsViewController *)self callGroups];
      if ((unint64_t)[v8 count] <= a3)
      {
        int v6 = 0;
      }
      else
      {
        v9 = [(PHCallParticipantsViewController *)self callGroups];
        int v6 = [v9 objectAtIndexedSubscript:a3];
      }
    }
    int v10 = [v6 calls];
    id v11 = [v10 count];

    if (v11 == (id)1)
    {
      id v12 = [v6 calls];
      v13 = [v12 firstObject];

      v14 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v13];
      id v15 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v14];
      BOOL v16 = [v13 contactIdentifier];
      v17 = +[PHAudioCallViewController contactKeysToFetch];
      uint64_t v18 = [(PHCallParticipantsViewController *)self contactsCache];
      id v7 = [v15 contactForIdentifier:v16 keysToFetch:v17 usingCache:v18];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)localizedSenderIdentityForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  if (+[PHDevice isGeminiCapable])
  {
    int v6 = [(PHCallParticipantsViewController *)self callGroups];
    id v7 = [v6 objectAtIndexedSubscript:a3];

    BOOL v8 = [v7 calls];
    v9 = [v8 firstObject];
    int v10 = [v9 provider];
    id v11 = [v10 prioritizedSenderIdentities];
    id v12 = [v11 count];

    if ((unint64_t)v12 < 2)
    {
      BOOL v16 = 0;
    }
    else
    {
      v13 = [v7 calls];
      v14 = [v13 firstObject];
      id v15 = [v14 localSenderIdentity];

      BOOL v16 = [v15 localizedShortName];
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)shouldShowSingleDurationLabel
{
  v3 = +[TUCallCenter sharedInstance];
  if ([v3 isAmbiguous])
  {
    id v4 = [(PHCallParticipantsViewController *)self callGroups];
    if ((unint64_t)[v4 count] < 2)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      unsigned int v5 = +[TUCallCenter sharedInstance];
      int v6 = [v5 callWithStatus:1];
      id v7 = [v6 model];
      unsigned int v8 = [v7 supportsHolding] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)shouldShowInfoButtonForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  int v6 = +[TUCallCenter sharedInstance];
  id v7 = [(PHCallParticipantsViewController *)self callGroups];
  unsigned int v8 = [v7 objectAtIndex:a3];

  if ([v6 currentCallCount])
  {
    v9 = [v8 calls];
    if ((unint64_t)[v9 count] < 2) {
      LOBYTE(v10) = 0;
    }
    else {
      unsigned int v10 = [v6 isAmbiguous] ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  id v11 = [v6 frontmostCall];
  if ([v11 isConversation])
  {
    id v12 = [v6 frontmostCall];
    v13 = [v12 remoteParticipantHandles];
    if ((unint64_t)[v13 count] < 2)
    {
      unsigned __int8 v16 = 0;
    }
    else
    {
      v14 = [v6 frontmostCall];
      id v15 = [v14 provider];
      unsigned __int8 v16 = [v15 isTelephonyProvider];
    }
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v10 | v16;
}

- (BOOL)shouldShowCallDetailsViewButton
{
  if (![(PHCallParticipantsViewController *)self isFrontmostCallFaceTimeAudio]) {
    return 0;
  }
  v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 frontmostCall];
  if ([v4 isConnected])
  {
    unsigned int v5 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
    BOOL v6 = [v5 callDisplayStyle] != (id)3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isFrontmostCallFaceTimeAudio
{
  objc_super v2 = +[TUCallCenter sharedInstance];
  v3 = [v2 frontmostCall];

  if ([v3 isConversation])
  {
    id v4 = [v3 provider];
    if ([v4 isFaceTimeProvider]) {
      unsigned int v5 = [v3 isVideo] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)numberOfParticipantLabels
{
  v3 = +[TUCallCenter sharedInstance];
  if ([v3 isAmbiguous])
  {
    unsigned __int8 v4 = [(PHCallParticipantsViewController *)self shouldShowSingleDurationLabel];

    if ((v4 & 1) == 0)
    {
      unsigned int v5 = [(PHCallParticipantsViewController *)self callGroups];
      id v6 = [v5 count];

      unint64_t v7 = v6 != 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  unsigned int v8 = [(PHCallParticipantsViewController *)self callGroups];
  unint64_t v7 = (unint64_t)[v8 count];

LABEL_6:
  if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI] && v7 > 1) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)nameForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI])
  {
    id v6 = [(PHCallParticipantsViewController *)self frontmostCallGroup];
  }
  else
  {
    unint64_t v7 = [(PHCallParticipantsViewController *)self callGroups];
    id v6 = [v7 objectAtIndexedSubscript:a3];
  }
  unsigned int v8 = [(PHCallParticipantsViewController *)self nameForCallGroup:v6];

  return v8;
}

- (id)nameForCallGroup:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PHCallParticipantsViewController *)self nameOverrideString];
  if (!v5)
  {
    id v6 = [v4 calls];
    if ([v6 count] == (id)1)
    {
      unint64_t v7 = [v4 calls];
      unsigned int v8 = [v7 firstObject];
      unsigned int v9 = [v8 isConversation];

      if (v9)
      {
        unsigned int v10 = +[TUCallCenter sharedInstance];
        id v11 = [v4 calls];
        id v12 = [v11 firstObject];
        v13 = [v10 activeConversationForCall:v12];

        unsigned int v5 = [v13 displayName];

        if (v5) {
          goto LABEL_29;
        }
      }
    }
    else
    {
    }
    if ([v4 status] == 4) {
      goto LABEL_13;
    }
    v14 = +[TUCallCenter sharedInstance];
    if (([v14 isAmbiguous] & 1) == 0)
    {

      goto LABEL_13;
    }
    unsigned __int8 v15 = [(PHCallParticipantsViewController *)self shouldShowSingleDurationLabel];

    if ((v15 & 1) != 0
      || (+[NSBundle mainBundle],
          unsigned __int8 v16 = objc_claimAutoreleasedReturnValue(),
          [v16 localizedStringForKey:@"AMBIGUOUS_CALL_LABEL" value:&stru_1002D6110 table:@"InCallService"], unsigned int v5 = objc_claimAutoreleasedReturnValue(), v16, !v5))
    {
LABEL_13:
      v17 = [(PHCallParticipantsViewController *)self callGroups];
      if ([v17 count] == (id)1 && objc_msgSend(v4, "status") == 1)
      {
        uint64_t v18 = [v4 calls];
        id v19 = [v18 firstObject];
        v20 = [v19 provider];
        if ([v20 isTelephonyProvider])
        {
          id v21 = [v4 calls];
          id v22 = [v21 firstObject];
          uint64_t v23 = [v22 callDirectoryName];
          if (v23)
          {
          }
          else
          {
            uint64_t v31 = [v4 calls];
            char v32 = [v31 firstObject];
            unsigned __int8 v38 = [v32 isBranded];

            if ((v38 & 1) == 0) {
              goto LABEL_20;
            }
          }
          v33 = [v4 calls];
          v34 = [v33 firstObject];
          v35 = [v34 callDurationString];
          if (v35)
          {
            id v36 = [v4 calls];
            int v37 = [v36 firstObject];
            unsigned int v5 = [v37 callDurationString];
          }
          else
          {
            unsigned int v5 = +[NSString localizedStringWithFormat:@"%02d:%02d", 0, 0];
          }

          if (v5) {
            goto LABEL_29;
          }
LABEL_20:
          uint64_t v24 = [(PHCallParticipantsViewController *)self callGroups];
          id v25 = [v24 count];

          if (v25 == (id)2)
          {
            v26 = [v4 calls];
            id v27 = [v26 firstObject];

            if ([v27 isBranded])
            {
              uint64_t v28 = [v27 localizedLabel];
              goto LABEL_25;
            }
            id v29 = [v27 callDirectoryName];

            if (v29)
            {
              uint64_t v28 = [v27 callDirectoryName];
LABEL_25:
              unsigned int v5 = (void *)v28;

              if (v5) {
                goto LABEL_29;
              }
              goto LABEL_28;
            }
          }
LABEL_28:
          unsigned int v5 = [v4 displayName];
          goto LABEL_29;
        }
      }
      goto LABEL_20;
    }
  }
LABEL_29:

  return v5;
}

- (id)callForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  id v6 = +[TUCallCenter sharedInstance];
  if ([v6 isAmbiguous])
  {
    unsigned __int8 v7 = [(PHCallParticipantsViewController *)self shouldShowSingleDurationLabel];

    if ((v7 & 1) == 0)
    {
      unsigned int v8 = [(PHCallParticipantsViewController *)self callGroups];
      uint64_t v9 = [v8 firstObject];
      goto LABEL_6;
    }
  }
  else
  {
  }
  unsigned int v8 = [(PHCallParticipantsViewController *)self callGroups];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
LABEL_6:
  unsigned int v10 = (void *)v9;

  if (![(PHCallParticipantsViewController *)self usesCompactMulticallUI]) {
    goto LABEL_11;
  }
  id v11 = [(PHCallParticipantsViewController *)self callGroups];
  if ((unint64_t)[v11 count] >= 2)
  {
    unsigned int v12 = [v10 status];

    if (v12 != 2) {
      goto LABEL_11;
    }
    [(PHCallParticipantsViewController *)self frontmostCallGroup];
    unsigned int v10 = v11 = v10;
  }

LABEL_11:

  return v10;
}

- (id)labelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4 allowsDuration:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned __int8 v7 = [(PHCallParticipantsViewController *)self callForParticipantAtIndex:a3 inParticipantsView:a4];
  unsigned int v8 = [(PHCallParticipantsViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    unsigned int v10 = [(PHCallParticipantsViewController *)self delegate];
    id v11 = [v10 shouldRenderAlertTextColor];
  }
  else
  {
    id v11 = 0;
  }
  labelDescriptorFactory = self->_labelDescriptorFactory;
  v13 = [(PHCallParticipantsViewController *)self callGroups];
  v14 = -[CNKCallParticipantLabelDescriptorFactory labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:](labelDescriptorFactory, "labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:", v7, [v13 count], v11, v5);

  return v14;
}

- (BOOL)anyLabelDescriptorIsDynamic
{
  unint64_t v3 = [(PHCallParticipantsViewController *)self numberOfParticipantLabels];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 0;
    BOOL v6 = 1;
    do
    {
      unsigned __int8 v7 = [(PHCallParticipantsViewController *)self traitCollection];
      uint64_t v8 = [v7 _backlightLuminance] != (id)1;

      char v9 = [(PHCallParticipantsViewController *)self labelForParticipantAtIndex:v5 inParticipantsView:0 allowsDuration:v8];
      LODWORD(v8) = [v9 isDynamic];

      if (v8) {
        break;
      }
      BOOL v6 = ++v5 < v4;
    }
    while (v4 != v5);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (id)supplementalParticipantLabelFormatStringAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  unint64_t v4 = [(PHCallParticipantsViewController *)self callForParticipantAtIndex:a3 inParticipantsView:a4];
  uint64_t v5 = [v4 supplementalInCallString];
  if (v5 && ([v4 status] | 2) == 3)
  {
    BOOL v6 = +[NSBundle conversationKit];
    unsigned __int8 v7 = [v6 localizedStringForKey:@"%@_FROM_OR_VIA_FORMAT_%@" value:&stru_1002D6110 table:@"CallStatus"];
    uint64_t v8 = +[NSString stringWithFormat:v7, @"%@", v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unsigned)activityStateForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI])
  {
    BOOL v6 = [(PHCallParticipantsViewController *)self frontmostCallGroup];
  }
  else
  {
    unsigned __int8 v7 = [(PHCallParticipantsViewController *)self callGroups];
    BOOL v6 = [v7 objectAtIndexedSubscript:a3];
  }
  uint64_t v8 = +[TUCallCenter sharedInstance];
  unsigned __int8 v9 = [v8 isAmbiguous];

  if (v9) {
    goto LABEL_5;
  }
  if ([v6 status] == 2)
  {
    id v11 = [v6 calls];
    unsigned int v12 = [v11 firstObject];
    unsigned __int8 v13 = [v12 statusIsProvisional];

    if (v13)
    {
      unsigned __int16 v10 = 2;
      goto LABEL_18;
    }
  }
  if ([v6 status] == 5)
  {
    unsigned __int16 v10 = 0;
    goto LABEL_18;
  }
  if ([v6 status] == 6
    && ([v6 calls],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 firstObject],
        unsigned __int8 v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v15 disconnectedReasonRequiresCallBackUI],
        v15,
        v14,
        (v16 & 1) != 0))
  {
LABEL_5:
    unsigned __int16 v10 = 3;
  }
  else if ([v6 status] == 2)
  {
    unsigned __int16 v10 = 1;
  }
  else if ([v6 status] == 6)
  {
    unsigned __int16 v10 = 1;
  }
  else
  {
    unsigned __int16 v10 = 3;
  }
LABEL_18:

  return v10;
}

- (BOOL)shouldShowParticipantImageAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  BOOL v6 = [(PHCallParticipantsViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v8 = [(PHCallParticipantsViewController *)self parentViewController];
  unsigned __int8 v9 = [(PHCallParticipantsViewController *)self features];
  unsigned __int8 v10 = [v9 isHeroImageEnabled];

  if ((v10 & 1) == 0)
  {
    id v11 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
    id v12 = [v11 callDisplayStyle];

    if (v12 != (id)3)
    {
      unsigned __int8 v25 = [v8 isShowingBackgroundImage];

      if ((v25 & 1) == 0) {
        goto LABEL_5;
      }
      return 0;
    }
  }
  unsigned __int8 v13 = [v8 shouldShowCircularAvatar];

  if ((v13 & 1) == 0) {
    return 0;
  }
LABEL_5:
  if ([(PHCallParticipantsViewController *)self usesCompactMulticallUI])
  {
    v14 = [(PHCallParticipantsViewController *)self frontmostCallGroup];
  }
  else
  {
    unsigned __int8 v15 = [(PHCallParticipantsViewController *)self callGroups];
    if ([v15 count])
    {
      unsigned __int8 v16 = [(PHCallParticipantsViewController *)self callGroups];
      v14 = [v16 objectAtIndexedSubscript:a3];
    }
    else
    {
      v14 = 0;
    }
  }
  v17 = [v14 calls];
  uint64_t v18 = [v17 firstObject];

  id v19 = [v18 handle];
  uint64_t v20 = [v19 siriDisplayName];
  if (v20)
  {
    id v21 = (void *)v20;
    id v22 = [v18 handle];
    unsigned __int8 v23 = [v22 shouldHideContact];

    char v24 = v23 ^ 1;
  }
  else
  {

    char v24 = 1;
  }

  return v24;
}

- (BOOL)shouldShowLargeAvatar
{
  unint64_t v3 = [(PHCallParticipantsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(PHCallParticipantsViewController *)self delegate];
  unsigned __int8 v6 = [v5 callParticipantsViewControllerShouldShowLargeAvatar:self];

  return v6;
}

- (BOOL)isCallRinging
{
  objc_super v2 = [(PHCallParticipantsViewController *)self frontmostCallGroup];
  BOOL v3 = [v2 status] == 4;

  return v3;
}

- (BOOL)shouldShowParticipantLabel
{
  BOOL v3 = [(PHCallParticipantsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  uint64_t v5 = [(PHCallParticipantsViewController *)self delegate];
  unsigned __int8 v6 = [v5 participantsViewShouldShowParticipantLabel];

  return v6;
}

- (void)participantTappedAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  unsigned __int8 v6 = [(PHCallParticipantsViewController *)self callGroups];
  if ([v6 count])
  {
    unsigned __int8 v7 = [(PHCallParticipantsViewController *)self callGroups];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
    unsigned __int8 v9 = [v8 calls];
    id v16 = [v9 firstObject];
  }
  else
  {
    id v16 = 0;
  }

  unsigned __int8 v10 = +[TUCallCenter sharedInstance];
  id v11 = [v10 callWithStatus:1];

  if ([v16 isOnHold])
  {
    id v12 = [v11 model];
    unsigned int v13 = [v12 supportsHolding];

    if (v13)
    {
      v14 = +[TUCallCenter sharedInstance];
      [v14 swapCalls];
    }
  }
  unsigned __int8 v15 = [(PHCallParticipantsViewController *)self participantsView];
  [v15 updateParticipantsAnimated:1];
}

- (void)participantViewInfoButtonTappedAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  unsigned __int8 v6 = objc_alloc_init(PHConferenceParticipantsViewController);
  uint64_t v5 = [(PHCallParticipantsViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)participantViewCallDetailsGestureRecognizerTapped
{
  id v3 = [(PHCallParticipantsViewController *)self delegate];
  [v3 callParticipantsViewControllerDidTapCallDetailsGestureRecognizer:self];
}

- (id)compactLabelTextForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  uint64_t v5 = [(PHCallParticipantsViewController *)self callGroups];
  if ((unint64_t)[v5 count] <= a3)
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    unsigned __int8 v6 = [v5 objectAtIndex:a3];
    unsigned __int8 v7 = [v6 calls];
    id v8 = [v7 count];

    if ((unint64_t)v8 < 2)
    {
      unsigned __int8 v10 = 0;
    }
    else
    {
      unsigned __int8 v9 = +[NSBundle mainBundle];
      unsigned __int8 v10 = [v9 localizedStringForKey:@"CONFERENCE" value:&stru_1002D6110 table:@"InCallService"];
    }
  }

  return v10;
}

- (void)setBannerButtonsState:(unint64_t)a3
{
  id v4 = [(PHCallParticipantsViewController *)self view];
  [v4 setBannerButtonsState:a3];
}

- (void)setBannerAudioRouteButtonSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHCallParticipantsViewController *)self view];
  [v4 setBannerAudioRouteButtonSelected:v3];
}

- (id)colorForStatusLabelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  unsigned __int8 v6 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
  unsigned __int8 v7 = +[PHUIConfiguration statusLabelFontColorForCallDisplayStyle:](PHUIConfiguration, "statusLabelFontColorForCallDisplayStyle:", [v6 callDisplayStyle]);

  id v8 = [(PHCallParticipantsViewController *)self callGroups];
  unsigned __int8 v9 = [(PHCallParticipantsViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(PHCallParticipantsViewController *)self delegate];
    id v12 = [(PHCallParticipantsViewController *)self frontmostCall];
    unsigned int v13 = [v11 customColorForStatusLabelWithCall:v12];

    if (v13)
    {
      id v14 = v13;

      unsigned __int8 v7 = v14;
    }
  }
  unsigned __int8 v15 = [(PHCallParticipantsViewController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [(PHCallParticipantsViewController *)self delegate];
    unsigned int v18 = [v17 shouldRenderAlertTextColor];
  }
  else
  {
    unsigned int v18 = 0;
  }
  if ((unint64_t)[v8 count] > a3)
  {
    id v19 = [v8 objectAtIndex:a3];
    if (([v19 isSOS] | v18) == 1)
    {
      uint64_t v20 = +[UIColor systemRedColor];

      unsigned __int8 v7 = (void *)v20;
    }
    if ((v18 & 1) == 0 && [v19 isBranded])
    {
      uint64_t v21 = +[UIColor labelColor];

      unsigned __int8 v7 = (void *)v21;
    }
  }

  return v7;
}

- (id)colorForParticipantLabelView:(id)a3
{
  id v4 = +[UIColor labelColor];
  uint64_t v5 = [(PHCallParticipantsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unsigned __int8 v7 = [(PHCallParticipantsViewController *)self delegate];
    id v8 = [(PHCallParticipantsViewController *)self frontmostCall];
    unsigned __int8 v9 = [v7 customColorForParticipantLabelWithCall:v8];

    if (v9)
    {
      id v10 = v9;

      id v4 = v10;
    }
  }

  return v4;
}

- (BOOL)usesCompactMulticallUI
{
  BOOL v3 = [(PHCallParticipantsViewController *)self features];
  if ([v3 callManagerEnabled])
  {
    id v4 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
    BOOL v5 = [v4 callDisplayStyle] != (id)3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)fontForParticipantLabelView:(id)a3
{
  id v4 = [a3 updatedParticipantMarqueeLabelFont];
  BOOL v5 = [(PHCallParticipantsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unsigned __int8 v7 = [(PHCallParticipantsViewController *)self delegate];
    unsigned int v8 = [v7 shouldRenderAlertTextFont];

    if (v8)
    {
      unsigned __int8 v9 = +[CNKFeatures sharedInstance];
      unsigned int v10 = [v9 isButtonLayoutEnabled];

      if (v10)
      {
        id v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle];

        id v12 = [v11 fontDescriptor];
        unsigned int v13 = [v12 fontDescriptorWithDesign:UIFontDescriptorSystemDesignDefault];
        id v14 = +[UIFont fontWithDescriptor:v13 size:0.0];

        unsigned __int8 v15 = [v14 fontDescriptor];
        char v16 = [v15 fontDescriptorWithSymbolicTraits:2];
        v17 = +[UIFont fontWithDescriptor:v16 size:96.0];

        id v4 = v11;
        goto LABEL_19;
      }
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned int v18 = [(PHCallParticipantsViewController *)self callGroups];
  id v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v19) {
    goto LABEL_15;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v28;
  while (2)
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v28 != v21) {
        objc_enumerationMutation(v18);
      }
      unsigned __int8 v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if ([(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]
        && [v23 isEmergency])
      {
        double v25 = UIFontWeightBold;
        double v24 = 76.0;
        goto LABEL_18;
      }
      if ([v23 isSOS])
      {
        [v4 pointSize];
        double v25 = UIFontWeightSemibold;
LABEL_18:
        v17 = +[UIFont systemFontOfSize:v24 weight:v25];

        goto LABEL_19;
      }
    }
    id v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_15:

  id v4 = v4;
  v17 = v4;
LABEL_19:

  return v17;
}

- (id)customFontForParticipantLabel
{
  BOOL v3 = [(PHCallParticipantsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(PHCallParticipantsViewController *)self delegate];
    char v6 = [(PHCallParticipantsViewController *)self frontmostCall];
    unsigned __int8 v7 = [v5 customFontForParticipantLabelWithCall:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)fontForParticipantLabelViewStatusLabel:(id)a3
{
  char v4 = [(PHCallParticipantsViewController *)self callDisplayStyleManager];
  BOOL v5 = +[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", [v4 callDisplayStyle]);

  char v6 = [(PHCallParticipantsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0
    && ([(PHCallParticipantsViewController *)self delegate],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 shouldRenderAlertTextFont],
        v8,
        v9))
  {
    [v5 pointSize];
    +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (id)iconInParticipantsView:(id)a3
{
  BOOL v3 = [(PHCallParticipantsViewController *)self callGroups];
  char v4 = [v3 firstObject];

  if (v4
    && ([v4 provider],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isSystemProvider],
        v5,
        (v6 & 1) == 0))
  {
    unsigned int v8 = [v4 provider];
    unsigned int v9 = [v8 bundleIdentifier];
    id v10 = +[UIScreen mainScreen];
    [v10 scale];
    char v7 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 5);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)participantsView:(id)a3 didPerformActionType:(int64_t)a4
{
  unsigned __int8 v6 = [(PHCallParticipantsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PHCallParticipantsViewController *)self delegate];
    [v8 callParticipantsViewController:self didPerformActionType:a4];
  }
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v5 = a4;
  if ([v5 isOneToOneModeEnabled] && (objc_msgSend(v5, "isVideo") & 1) == 0) {
    [(PHCallParticipantsViewController *)self _updateCallGroups];
  }
}

- (void)setAllowsFieldModeSendButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHCallParticipantsViewController *)self participantsView];
  [v4 setAllowsFieldModeSendButton:v3];
}

- (void)fieldModeSendButtonTappedInParticipantsView:(id)a3
{
  id v4 = [(PHCallParticipantsViewController *)self nameOverrideString];
  id v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  unsigned __int8 v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length] && !sub_100092A58(v6))
  {
    char v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Field Mode: Dialing digits %@", (uint8_t *)&v12, 0xCu);
    }

    id v8 = [(PHCallParticipantsViewController *)self callGroups];
    unsigned int v9 = [v8 lastObject];

    id v10 = +[TUCallCenter sharedInstance];
    id v11 = [v9 provider];
    [v10 sendFieldModeDigits:v6 forProvider:v11];
  }
}

- (BOOL)isDeviceCapableOfTelephonyCalls
{
  objc_super v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 isTelephonyDevice];

  return v3;
}

- (id)frontmostCallGroup
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned __int8 v3 = [(PHCallParticipantsViewController *)self callGroups];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      if ([v8 status] == 1) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v10 = [(PHCallParticipantsViewController *)self callGroups];
  id v9 = [v10 firstObject];

LABEL_12:

  return v9;
}

- (id)frontmostCall
{
  objc_super v2 = [(PHCallParticipantsViewController *)self frontmostCallGroup];
  unsigned __int8 v3 = [v2 calls];
  id v4 = [v3 firstObject];

  return v4;
}

- (PHCallParticipantsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHCallParticipantsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)handlesCallWaitingCalls
{
  return self->_handlesCallWaitingCalls;
}

- (void)setHandlesCallWaitingCalls:(BOOL)a3
{
  self->_handlesCallWaitingCalls = a3;
}

- (BOOL)allowsFieldModeSendButton
{
  return self->_allowsFieldModeSendButton;
}

- (BOOL)shouldIgnoreUpdates
{
  return self->_shouldIgnoreUpdates;
}

- (void)setShouldIgnoreUpdates:(BOOL)a3
{
  self->_shouldIgnoreUpdates = a3;
}

- (unint64_t)bannerButtonsState
{
  return self->_bannerButtonsState;
}

- (void)setNumberFormatter:(id)a3
{
}

- (PHCallParticipantsView)participantsView
{
  return (PHCallParticipantsView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParticipantsView:(id)a3
{
}

- (void)setCallGroups:(id)a3
{
}

- (NSString)nameOverrideString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNameOverrideString:(id)a3
{
}

- (BOOL)shouldInsertSpaceBeforeNextOverrideStringCharacter
{
  return self->_shouldInsertSpaceBeforeNextOverrideStringCharacter;
}

- (void)setShouldInsertSpaceBeforeNextOverrideStringCharacter:(BOOL)a3
{
  self->_shouldInsertSpaceBeforeNextOverrideStringCharacter = a3;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 72, 1);
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (BOOL)callIsAboutToEndForStewie
{
  return self->_callIsAboutToEndForStewie;
}

- (void)setCallIsAboutToEndForStewie:(BOOL)a3
{
  self->_callIsAboutToEndForStewie = a3;
}

- (NSCache)contactsCache
{
  return self->_contactsCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_nameOverrideString, 0);
  objc_storeStrong((id *)&self->_callGroups, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_prioritizedCall);
}

@end