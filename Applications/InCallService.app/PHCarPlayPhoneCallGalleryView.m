@interface PHCarPlayPhoneCallGalleryView
- (BOOL)isShowingAlertSubtitle;
- (BOOL)phoneCallContainer:(id)a3 cellIsDimmedAtIndex:(unint64_t)a4;
- (CNKCallParticipantLabelDescriptorFactory)labelFactory;
- (MPCarPlayPhoneCallGalleryViewDelegate)delegate;
- (PHCarPlayPhoneCallContainer)container;
- (PHCarPlayPhoneCallGalleryView)initWithFrame:(CGRect)a3;
- (id)mergedCalls;
- (id)mergedStringForMergedCalls;
- (id)phoneCallContainer:(id)a3 avatarViewControllerForViewCellAtIndex:(unint64_t)a4;
- (id)phoneCallContainer:(id)a3 localizedSenderIdentityForViewCellAtIndex:(unint64_t)a4;
- (id)phoneCallContainer:(id)a3 subtitleColorForViewCellAtIndex:(unint64_t)a4;
- (id)phoneCallContainer:(id)a3 subtitleForViewCellAtIndex:(unint64_t)a4;
- (id)phoneCallContainer:(id)a3 titleForViewCellAtIndex:(unint64_t)a4;
- (id)phoneCallForIndex:(unint64_t)a3 isMerged:(BOOL *)a4;
- (id)primaryCalls;
- (unint64_t)numberOfViewCellsForPhoneCallContainer:(id)a3;
- (void)addPrimaryPhoneCall:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)endPhoneCall:(id)a3 animated:(BOOL)a4;
- (void)mergePrimaryPhoneCallsAnimated:(BOOL)a3;
- (void)phoneCallContainer:(id)a3 phoneCallViewTappedAtIndex:(unint64_t)a4;
- (void)phoneCallDataDidChange:(id)a3;
- (void)reloadPhoneCallData;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsShowingAlertSubtitle:(BOOL)a3;
- (void)setIsShowingCallFailure:(BOOL)a3;
- (void)startListeningForCallNotifications;
- (void)stopListeningForCallNotifications;
@end

@implementation PHCarPlayPhoneCallGalleryView

- (PHCarPlayPhoneCallGalleryView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PHCarPlayPhoneCallGalleryView;
  v3 = -[PHCarPlayPhoneCallGalleryView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(PHCarPlayPhoneCallGalleryView *)v3 setBackgroundColor:v4];

    [(PHCarPlayPhoneCallGalleryView *)v3 setOpaque:0];
    v5 = [PHCarPlayPhoneCallContainer alloc];
    [(PHCarPlayPhoneCallGalleryView *)v3 bounds];
    v6 = -[PHCarPlayPhoneCallContainer initWithFrame:](v5, "initWithFrame:");
    container = v3->_container;
    v3->_container = v6;

    uint64_t v8 = objc_opt_new();
    labelFactory = v3->_labelFactory;
    v3->_labelFactory = (CNKCallParticipantLabelDescriptorFactory *)v8;

    [(PHCarPlayPhoneCallGalleryView *)v3 addSubview:v3->_container];
    v10 = _NSDictionaryOfVariableBindings(@"_container", v3->_container, 0);
    v11 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[_container]|" options:0 metrics:0 views:v10];
    [(PHCarPlayPhoneCallGalleryView *)v3 addConstraints:v11];

    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_container]|" options:0 metrics:0 views:v10];
    [(PHCarPlayPhoneCallGalleryView *)v3 addConstraints:v12];

    [(PHCarPlayPhoneCallContainer *)v3->_container setDataSource:v3];
    [(PHCarPlayPhoneCallContainer *)v3->_container setDelegate:v3];
    [(PHCarPlayPhoneCallGalleryView *)v3 startListeningForCallNotifications];
  }
  return v3;
}

- (void)dealloc
{
  [(PHCarPlayPhoneCallGalleryView *)self stopListeningForCallNotifications];
  [(PHCarPlayPhoneCallContainer *)self->_container setDataSource:0];
  [(PHCarPlayPhoneCallContainer *)self->_container setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PHCarPlayPhoneCallGalleryView;
  [(PHCarPlayPhoneCallGalleryView *)&v3 dealloc];
}

- (void)startListeningForCallNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"phoneCallDataDidChange:" name:@"MPCarPlayInCallViewControllerUpdateClockTickNotification" object:0];
  [v3 addObserver:self selector:"phoneCallDataDidChange:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v3 addObserver:self selector:"phoneCallDataDidChange:" name:TUCallDisplayContextChangedNotification object:0];
}

- (void)stopListeningForCallNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (id)mergedCalls
{
  v2 = [(PHCarPlayPhoneCallGalleryView *)self delegate];
  id v3 = [v2 allConferenceParticipantCalls];

  return v3;
}

- (id)primaryCalls
{
  id v3 = [(PHCarPlayPhoneCallGalleryView *)self delegate];
  v4 = [v3 primaryPhoneCallsForGalleryView:self];

  return v4;
}

- (void)reloadPhoneCallData
{
  [(PHCarPlayPhoneCallGalleryView *)self stopListeningForCallNotifications];
  [(PHCarPlayPhoneCallGalleryView *)self startListeningForCallNotifications];
  id v3 = [(PHCarPlayPhoneCallGalleryView *)self container];
  [v3 reloadData];
}

- (unint64_t)numberOfViewCellsForPhoneCallContainer:(id)a3
{
  id v3 = [(PHCarPlayPhoneCallGalleryView *)self primaryCalls];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)phoneCallContainer:(id)a3 titleForViewCellAtIndex:(unint64_t)a4
{
  char v10 = 0;
  v5 = [(PHCarPlayPhoneCallGalleryView *)self phoneCallForIndex:a4 isMerged:&v10];
  if ([v5 isConversation])
  {
    v6 = +[TUCallCenter sharedInstance];
    v7 = [v6 activeConversationForCall:v5];

    uint64_t v8 = [v7 displayName];
  }
  else if (v5)
  {
    if (v10) {
      [(PHCarPlayPhoneCallGalleryView *)self mergedStringForMergedCalls];
    }
    else {
    uint64_t v8 = [v5 displayName];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)phoneCallContainer:(id)a3 subtitleForViewCellAtIndex:(unint64_t)a4
{
  v6 = [(CNKCallParticipantLabelDescriptorFactory *)self->_labelFactory makeLabel];
  v7 = [(PHCarPlayPhoneCallGalleryView *)self phoneCallForIndex:a4 isMerged:0];
  if (v7)
  {
    id v8 = [v7 canDisplayAlertUI:[self isShowingAlertSubtitle]];
    v9 = [(PHCarPlayPhoneCallGalleryView *)self traitCollection];
    BOOL v10 = [v9 _backlightLuminance] != (id)1;

    labelFactory = self->_labelFactory;
    v12 = [(PHCarPlayPhoneCallGalleryView *)self primaryCalls];
    v13 = -[CNKCallParticipantLabelDescriptorFactory labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:](labelFactory, "labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:", v7, [v12 count], v8, v10);

    objc_super v14 = [v13 strings];
    v15 = [v14 firstObject];

    if ([v13 layoutState] == (id)1)
    {
      uint64_t v16 = [v7 imageURL];
      if (!v16
        || (v17 = (void *)v16,
            [v7 localizedLabel],
            v18 = objc_claimAutoreleasedReturnValue(),
            v18,
            v17,
            !v18))
      {
        uint64_t v19 = [v13 secondaryString];

        v15 = (__CFString *)v19;
      }
    }
  }
  else
  {
    v15 = 0;
    v13 = v6;
  }
  if (v15) {
    v20 = v15;
  }
  else {
    v20 = &stru_1002D6110;
  }
  v21 = v20;

  return v21;
}

- (id)phoneCallContainer:(id)a3 subtitleColorForViewCellAtIndex:(unint64_t)a4
{
  v6 = +[UIColor dynamicLabelColor];
  v7 = [(PHCarPlayPhoneCallGalleryView *)self phoneCallForIndex:a4 isMerged:0];
  if (v7
    && objc_msgSend(v7, "canDisplayAlertUI:", -[PHCarPlayPhoneCallGalleryView isShowingAlertSubtitle](self, "isShowingAlertSubtitle")))
  {
    uint64_t v8 = +[UIColor systemRedColor];

    v6 = (void *)v8;
  }

  return v6;
}

- (id)phoneCallContainer:(id)a3 avatarViewControllerForViewCellAtIndex:(unint64_t)a4
{
  unsigned __int8 v18 = 0;
  id v4 = [(PHCarPlayPhoneCallGalleryView *)self phoneCallForIndex:a4 isMerged:&v18];
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  v6 = [v4 contactIdentifier];
  if ([v6 length])
  {
    int v7 = v18;

    if (v7)
    {
LABEL_4:
      id v8 = 0;
      goto LABEL_17;
    }
    v6 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v5];
    id v9 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v6];
    BOOL v10 = [v5 contactIdentifier];
    v26 = CNContactImageDataAvailableKey;
    v11 = +[NSArray arrayWithObjects:&v26 count:1];
    id v17 = 0;
    v12 = [v9 unifiedContactWithIdentifier:v10 keysToFetch:v11 error:&v17];
    id v13 = v17;

    if (v12 && [v12 imageDataAvailable])
    {
      objc_super v14 = +[CNAvatarViewControllerSettings settingsWithContactStore:v9 threeDTouchEnabled:0];
      id v8 = [objc_alloc((Class)CNAvatarViewController) initWithSettings:v14];
      v25 = v12;
      v15 = +[NSArray arrayWithObjects:&v25 count:1];
      [v8 setContacts:v15];
    }
    else
    {
      if (!v13)
      {
        id v8 = 0;
        goto LABEL_15;
      }
      objc_super v14 = sub_1000D5130();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v20 = v9;
        __int16 v21 = 2112;
        v22 = v5;
        __int16 v23 = 2112;
        id v24 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not retrieve a contact using contact store (%@) call (%@) error (%@)", buf, 0x20u);
      }
      id v8 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  id v8 = 0;
LABEL_16:

LABEL_17:

  return v8;
}

- (id)phoneCallContainer:(id)a3 localizedSenderIdentityForViewCellAtIndex:(unint64_t)a4
{
  if (+[PHDevice isGeminiCapable])
  {
    v6 = [(PHCarPlayPhoneCallGalleryView *)self phoneCallForIndex:a4 isMerged:0];
    int v7 = v6;
    if (v6
      && ([v6 provider],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 prioritizedSenderIdentities],
          id v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 count],
          v9,
          v8,
          (unint64_t)v10 >= 2))
    {
      v11 = [v7 localSenderIdentity];
      v12 = [v11 localizedShortName];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)phoneCallContainer:(id)a3 cellIsDimmedAtIndex:(unint64_t)a4
{
  id v4 = [(PHCarPlayPhoneCallGalleryView *)self phoneCallForIndex:a4 isMerged:0];
  unsigned int v5 = [v4 status];
  unsigned int v6 = (v5 > 4) | (5u >> v5);

  return v6 & 1;
}

- (void)phoneCallContainer:(id)a3 phoneCallViewTappedAtIndex:(unint64_t)a4
{
  id v4 = +[TUCallCenter sharedInstance];
  unsigned int v5 = [v4 currentCallGroups];
  id v6 = [v5 count];

  if ((unint64_t)v6 < 2)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v7 = +[TUCallCenter sharedInstance];
    id v8 = [v7 currentCallGroups];

    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          unsigned int v14 = [v13 isOnHold];
          v15 = +[TUCallCenter sharedInstance];
          uint64_t v16 = v15;
          if (v14) {
            [v15 unholdCall:v13];
          }
          else {
            [v15 holdCall:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v17 = +[TUCallCenter sharedInstance];
    [v17 swapCalls];
  }
}

- (id)mergedStringForMergedCalls
{
  id v3 = [(PHCarPlayPhoneCallGalleryView *)self mergedCalls];
  id v4 = [v3 count];
  unsigned int v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if ((unint64_t)v4 >= 3) {
    CFStringRef v7 = @"CARPLAY_CALLS_%@_%@_AND_OTHERS";
  }
  else {
    CFStringRef v7 = @"CARPLAY_CALLS_%@_AND_%@";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1002D6110 table:@"PHCarPlay"];

  id v9 = [(PHCarPlayPhoneCallGalleryView *)self mergedCalls];
  id v10 = [v9 count];

  if ((unint64_t)v10 < 2)
  {
    id v17 = 0;
  }
  else
  {
    uint64_t v11 = [(PHCarPlayPhoneCallGalleryView *)self mergedCalls];
    v12 = [v11 objectAtIndexedSubscript:0];
    id v13 = [v12 displayFirstName];
    unsigned int v14 = [(PHCarPlayPhoneCallGalleryView *)self mergedCalls];
    v15 = [v14 objectAtIndexedSubscript:1];
    uint64_t v16 = [v15 displayFirstName];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v13, v16);
  }

  return v17;
}

- (id)phoneCallForIndex:(unint64_t)a3 isMerged:(BOOL *)a4
{
  CFStringRef v7 = [(PHCarPlayPhoneCallGalleryView *)self primaryCalls];
  if ((unint64_t)[v7 count] <= a3)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndexedSubscript:a3];
    if (a4)
    {
      id v9 = [(PHCarPlayPhoneCallGalleryView *)self mergedCalls];
      if ((unint64_t)[v9 count] >= 2
        && ([v8 isConferenced] & 1) != 0)
      {
        id v10 = [(PHCarPlayPhoneCallGalleryView *)self delegate];
        uint64_t v11 = [v10 representativePhoneCallForConferenceForGalleryView:self];
        *a4 = v8 == v11;
      }
      else
      {
        *a4 = 0;
      }
    }
  }

  return v8;
}

- (void)addPrimaryPhoneCall:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(PHCarPlayPhoneCallGalleryView *)self container];
  [v5 reloadDataAnimated:v4];
}

- (void)mergePrimaryPhoneCallsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHCarPlayPhoneCallGalleryView *)self mergedCalls];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= 2)
  {
    CFStringRef v7 = [(PHCarPlayPhoneCallGalleryView *)self container];
    [v7 setNeedsMerge];

    id v8 = [(PHCarPlayPhoneCallGalleryView *)self container];
    [v8 reloadDataAnimated:v3];
  }
}

- (void)endPhoneCall:(id)a3 animated:(BOOL)a4
{
  id v4 = [(PHCarPlayPhoneCallGalleryView *)self container];
  [v4 reloadDataAnimated:1];
}

- (void)setIsShowingCallFailure:(BOOL)a3
{
  id v3 = [(PHCarPlayPhoneCallGalleryView *)self container];
  [v3 reloadData];
}

- (void)setIsShowingAlertSubtitle:(BOOL)a3
{
  if (self->_isShowingAlertSubtitle != a3)
  {
    self->_isShowingAlertSubtitle = a3;
    id v3 = [(PHCarPlayPhoneCallGalleryView *)self container];
    [v3 reloadData];
  }
}

- (void)phoneCallDataDidChange:(id)a3
{
  id v3 = [(PHCarPlayPhoneCallGalleryView *)self container];
  [v3 reloadData];
}

- (MPCarPlayPhoneCallGalleryViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MPCarPlayPhoneCallGalleryViewDelegate *)a3;
}

- (PHCarPlayPhoneCallContainer)container
{
  return (PHCarPlayPhoneCallContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainer:(id)a3
{
}

- (BOOL)isShowingAlertSubtitle
{
  return self->_isShowingAlertSubtitle;
}

- (CNKCallParticipantLabelDescriptorFactory)labelFactory
{
  return self->_labelFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelFactory, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end