@interface VMMessageViewController
+ (id)getFTVoiceMailOnVoicemailsChanged:(id)a3;
- (BOOL)markedVoicemailAsRead;
- (BOOL)shouldHandleVoicemailChanges;
- (CNContact)contact;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (MPMessage)voicemailMessage;
- (MPVoicemailManagerProtocol)voicemailManager;
- (NSDateFormatter)dateFormatter;
- (TUMetadataCache)metadataCache;
- (VMMessageHeaderView)headerView;
- (VMMessageView)messageView;
- (VMMessageViewController)initWithContactStore:(id)a3;
- (VMMessageViewController)initWithManager:(id)a3;
- (VMPlayerControlsViewController)playerControlsViewController;
- (id)localizedSubtitleForMessage:(id)a3;
- (id)onVoicemailsChanged;
- (void)dealloc;
- (void)fetchMetadataForMessages:(id)a3;
- (void)handleContactStoreDidChangeNotification:(id)a3;
- (void)handleContentSizeCategoryDidChangeNotification:(id)a3;
- (void)handleCurrentLocaleDidChangeNotification:(id)a3;
- (void)handleSystemTimeZoneDidChangeNotification:(id)a3;
- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3;
- (void)handleVoicemailManagerVoicemailsDidChange;
- (void)loadView;
- (void)reloadData;
- (void)setContact:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setMarkedVoicemailAsRead:(BOOL)a3;
- (void)setMessageView:(id)a3;
- (void)setMetadataCache:(id)a3;
- (void)setOnVoicemailsChanged:(id)a3;
- (void)setPlayerControlsViewController:(id)a3;
- (void)setShouldHandleVoicemailChanges:(BOOL)a3;
- (void)setVoicemailManager:(id)a3;
- (void)setVoicemailMessage:(id)a3;
- (void)viewDidLoad;
@end

@implementation VMMessageViewController

- (VMMessageViewController)initWithManager:(id)a3
{
  return 0;
}

- (VMMessageViewController)initWithContactStore:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)VMVoicemailManager);
  v17.receiver = self;
  v17.super_class = (Class)VMMessageViewController;
  v7 = [(VMViewController *)&v17 initWithManager:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_contactStore, a3);
    id v8 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
    v18[0] = v8;
    id v9 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
    v18[1] = v9;
    id v10 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
    v18[2] = v10;
    id v11 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
    v18[3] = v11;
    v12 = +[NSArray arrayWithObjects:v18 count:4];

    v13 = (TUMetadataCache *)[objc_alloc((Class)TUMetadataCache) initWithDataProviders:v12];
    metadataCache = v7->_metadataCache;
    v7->_metadataCache = v13;

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v7 selector:"handleContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
    [v15 addObserver:v7 selector:"handleContentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
    [v15 addObserver:v7 selector:"handleCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v15 addObserver:v7 selector:"handleSystemTimeZoneDidChangeNotification:" name:NSSystemTimeZoneDidChangeNotification object:0];
    [v15 addObserver:v7 selector:"handleTUMetadataCacheDidFinishUpdatingNotification:" name:TUMetadataCacheDidFinishUpdatingNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VMMessageViewController;
  [(PHViewController *)&v4 dealloc];
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)VMMessageViewController;
  [(VMMessageViewController *)&v24 loadView];
  v3 = [(VMMessageViewController *)self view];
  objc_super v4 = +[UIColor dynamicBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc_init(VMMessageView);
  id v6 = [(VMMessageViewController *)self playerControlsViewController];
  v7 = [v6 playerControlsView];
  [(VMMessageView *)v5 setPlayerControlsView:v7];

  [(VMMessageViewController *)self setMessageView:v5];
  [v3 addSubview:v5];
  [(VMMessageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [(VMMessageView *)v5 topAnchor];
  id v9 = [(VMMessageViewController *)self view];
  id v10 = [v9 topAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(VMMessageView *)v5 leadingAnchor];
  v13 = [(VMMessageViewController *)self view];
  v14 = [v13 leadingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(VMMessageView *)v5 heightAnchor];
  objc_super v17 = [(VMMessageViewController *)self view];
  v18 = [v17 heightAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(VMMessageView *)v5 widthAnchor];
  v21 = [(VMMessageViewController *)self view];
  v22 = [v21 widthAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)VMMessageViewController;
  [(VMMessageViewController *)&v4 viewDidLoad];
  v3 = [(VMMessageViewController *)self voicemailMessage];

  if (v3) {
    [(VMMessageViewController *)self reloadData];
  }
}

- (id)onVoicemailsChanged
{
  id onVoicemailsChanged = self->_onVoicemailsChanged;
  if (!onVoicemailsChanged)
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007778;
    v9[3] = &unk_10005D3F8;
    objc_copyWeak(&v10, &location);
    objc_super v4 = objc_retainBlock(v9);
    id v5 = objc_retainBlock(v4);
    id v6 = self->_onVoicemailsChanged;
    self->_id onVoicemailsChanged = v5;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    id onVoicemailsChanged = self->_onVoicemailsChanged;
  }
  id v7 = objc_retainBlock(onVoicemailsChanged);

  return v7;
}

- (MPVoicemailManagerProtocol)voicemailManager
{
  voicemailManager = self->_voicemailManager;
  if (!voicemailManager)
  {
    objc_super v4 = [(VMMessageViewController *)self onVoicemailsChanged];
    id v5 = +[VMMessageViewController getFTVoiceMailOnVoicemailsChanged:v4];
    id v6 = self->_voicemailManager;
    self->_voicemailManager = v5;

    voicemailManager = self->_voicemailManager;
  }

  return voicemailManager;
}

- (void)setVoicemailMessage:(id)a3
{
  id v5 = (MPMessage *)a3;
  if (self->_voicemailMessage != v5)
  {
    id v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting voicemail message (%@).", buf, 0xCu);
    }

    [(VMMessageViewController *)self setShouldHandleVoicemailChanges:0];
    objc_storeStrong((id *)&self->_voicemailMessage, a3);
    if (v5)
    {
      [(VMMessageViewController *)self setShouldHandleVoicemailChanges:1];
      id v7 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
      id v8 = [(VMMessageViewController *)self contactStore];
      v15[0] = v7;
      v15[1] = CNContactPhoneNumbersKey;
      id v9 = +[NSArray arrayWithObjects:v15 count:2];
      id v10 = [(MPMessage *)v5 contactUsingContactStore:v8 withKeysToFetch:v9];

      id v11 = [(MPMessage *)v5 dataURL];
      v12 = [(VMMessageViewController *)self playerControlsViewController];
      [v12 setURL:v11];

      v14 = v5;
      v13 = +[NSArray arrayWithObjects:&v14 count:1];
      [(VMMessageViewController *)self fetchMetadataForMessages:v13];
    }
    else
    {
      id v7 = [(VMMessageViewController *)self playerControlsViewController];
      [v7 setURL:0];
      id v10 = 0;
    }

    [(VMMessageViewController *)self setContact:v10];
  }
}

- (CNContactFormatter)contactFormatter
{
  contactFormatter = self->_contactFormatter;
  if (!contactFormatter)
  {
    objc_super v4 = (CNContactFormatter *)objc_alloc_init((Class)CNContactFormatter);
    [(CNContactFormatter *)v4 setStyle:0];
    id v5 = self->_contactFormatter;
    self->_contactFormatter = v4;

    contactFormatter = self->_contactFormatter;
  }

  return contactFormatter;
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    objc_super v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:3];
    [(NSDateFormatter *)self->_dateFormatter setDoesRelativeDateFormatting:1];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (VMPlayerControlsViewController)playerControlsViewController
{
  playerControlsViewController = self->_playerControlsViewController;
  if (!playerControlsViewController)
  {
    objc_super v4 = [VMPlayerControlsViewController alloc];
    id v5 = [(VMViewController *)self manager];
    id v6 = [(VMViewController *)v4 initWithManager:v5];
    id v7 = self->_playerControlsViewController;
    self->_playerControlsViewController = v6;

    playerControlsViewController = self->_playerControlsViewController;
  }

  return playerControlsViewController;
}

- (void)fetchMetadataForMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(VMMessageViewController *)self metadataCache];

  if (v5)
  {
    id v6 = +[TUMetadataDestinationID metadataDestinationIDsForVMVoicemails:v4];
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      id v10 = [v4 count];
      __int16 v11 = 2048;
      id v12 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu voicemail messages using %lu handles", (uint8_t *)&v9, 0x16u);
    }

    id v8 = [(VMMessageViewController *)self metadataCache];
    [v8 updateCacheWithDestinationIDs:v6];
  }
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007D80;
  block[3] = &unk_10005D420;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)localizedSubtitleForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 senderDestinationID];
  if ([v5 length])
  {
    id v6 = [v4 senderISOCountryCode];
    id v7 = [(VMMessageViewController *)self contact];
    id v8 = +[TUHandle normalizedHandleWithDestinationID:v5];
    int v9 = v8;
    if (v7 && [v8 type] == (id)2)
    {
      id v10 = +[CNPhoneNumber phoneNumberWithDigits:v5 countryCode:v6];
      if (v10)
      {
        __int16 v11 = [v7 labeledValueForPhoneNumber:v10];
      }
      else
      {
        __int16 v11 = 0;
      }
      v13 = [v11 label];
      id v12 = +[CNLabeledValue localizedDisplayStringForLabel:v13 propertyName:CNContactPhoneNumbersKey];
    }
    else
    {
      id v12 = 0;
    }
    if (![v12 length])
    {
      id v14 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v9];
      if (v14)
      {
        v15 = [(VMMessageViewController *)self metadataCache];
        v16 = [v15 metadataForDestinationID:v14];

        objc_super v17 = [v16 metadataForProvider:objc_opt_class()];

        if (![v17 length])
        {
          uint64_t v18 = [v16 metadataForProvider:objc_opt_class()];

          objc_super v17 = (void *)v18;
        }
        if (![v17 length])
        {
          uint64_t v19 = [v16 metadataForProvider:objc_opt_class()];

          objc_super v17 = (void *)v19;
        }

        id v12 = v17;
      }
    }
    v20 = [v4 provider];
    unsigned int v21 = [v20 isEqual:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

    if (v21)
    {
      v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_FaceTime_Audio" value:&stru_10005E8B0 table:@"MPVoicemail"];

      id v12 = (void *)v23;
    }
    if (![v12 length])
    {
      objc_super v24 = +[NSBundle mainBundle];
      uint64_t v25 = [v24 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_SUBTITLE_UNKNOWN" value:&stru_10005E8B0 table:@"MPVoicemail"];

      id v12 = (void *)v25;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)handleContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v6 = [(VMMessageViewController *)self voicemailMessage];
  if (v6)
  {
    id v7 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
    id v8 = [(VMMessageViewController *)self contactStore];
    v11[0] = v7;
    v11[1] = CNContactPhoneNumbersKey;
    int v9 = +[NSArray arrayWithObjects:v11 count:2];
    id v10 = [v6 contactUsingContactStore:v8 withKeysToFetch:v9];
    [(VMMessageViewController *)self setContact:v10];
  }
  [(VMMessageViewController *)self reloadData];
}

- (void)handleContentSizeCategoryDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(VMMessageViewController *)self reloadData];
}

- (void)handleCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }

  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = 0;

  [(VMMessageViewController *)self reloadData];
}

- (void)handleSystemTimeZoneDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v8, 0xCu);
  }

  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = 0;

  contactFormatter = self->_contactFormatter;
  self->_contactFormatter = 0;

  [(VMMessageViewController *)self reloadData];
}

- (void)handleVoicemailManagerVoicemailsDidChange
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "handleVoicemailManagerVoicemailsDidChange", (uint8_t *)buf, 2u);
  }

  id v4 = [(VMMessageViewController *)self voicemailMessage];

  if (v4)
  {
    objc_initWeak(buf, self);
    id v5 = [(VMMessageViewController *)self voicemailManager];
    int v6 = [(VMMessageViewController *)self voicemailMessage];
    int v7 = [v6 identifier];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000868C;
    v8[3] = &unk_10005D388;
    objc_copyWeak(&v9, buf);
    [v5 voicemailWithIdentifier:v7 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)reloadData
{
  v3 = [(VMMessageViewController *)self contactStore];
  id v4 = [(VMMessageViewController *)self messageView];
  id v5 = [(VMMessageViewController *)self voicemailMessage];
  [(VMMessageViewController *)self setMarkedVoicemailAsRead:0];
  int v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412546;
    objc_super v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reloading view (%@) with data store (%@).", (uint8_t *)&v16, 0x16u);
  }

  int v7 = [(VMMessageViewController *)self dateFormatter];
  int v8 = [v5 date];
  id v9 = [v7 stringFromDate:v8];

  id v10 = [v5 displayNameUsingContactStore:v3];
  __int16 v11 = [(VMMessageViewController *)self localizedSubtitleForMessage:v5];
  [v4 setLocalizedHeadline:v10];
  [v4 setLocalizedSubheadline:v11];
  [v4 setLocalizedDate:v9];
  id v12 = [v5 transcript];
  if (v12)
  {
    id v13 = [v4 transcriptView];
    [v13 setHideAccessoryViews:1];

    id v14 = [[VMMessageTranscriptViewModel alloc] initWithMPMessage:v5];
    v15 = [v4 transcriptView];
    [v15 setViewModel:v14];
  }
  [v4 setShouldDisplayTranscript:v12 != 0];
  [v4 setNeedsLayout];
  [v4 layoutIfNeeded];
}

- (void)setPlayerControlsViewController:(id)a3
{
}

- (MPMessage)voicemailMessage
{
  return self->_voicemailMessage;
}

- (void)setVoicemailManager:(id)a3
{
}

- (void)setOnVoicemailsChanged:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (BOOL)markedVoicemailAsRead
{
  return self->_markedVoicemailAsRead;
}

- (void)setMarkedVoicemailAsRead:(BOOL)a3
{
  self->_markedVoicemailAsRead = a3;
}

- (VMMessageHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (VMMessageView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (void)setMetadataCache:(id)a3
{
}

- (BOOL)shouldHandleVoicemailChanges
{
  return self->_shouldHandleVoicemailChanges;
}

- (void)setShouldHandleVoicemailChanges:(BOOL)a3
{
  self->_shouldHandleVoicemailChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong(&self->_onVoicemailsChanged, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_voicemailMessage, 0);

  objc_storeStrong((id *)&self->_playerControlsViewController, 0);
}

+ (id)getFTVoiceMailOnVoicemailsChanged:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = sub_100041610();
  swift_retain();
  v15[3] = v5;
  v15[4] = &off_10005DC30;
  v15[0] = sub_100041600();
  type metadata accessor for FaceTimeVoicemailManager(0);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_1000409D0((uint64_t)v15, v5);
  __chkstk_darwin(v7);
  id v9 = (void *)((char *)&v15[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = *v9;
  swift_retain();
  id v12 = (void *)sub_100040A20((uint64_t)sub_1000409C0, v4, v11, v6);
  sub_10001FA54((uint64_t)v15);
  swift_release();
  swift_release();

  return v12;
}

@end