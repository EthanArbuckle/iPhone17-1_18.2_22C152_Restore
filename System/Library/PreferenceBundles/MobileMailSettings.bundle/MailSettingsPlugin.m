@interface MailSettingsPlugin
+ (id)appsLocalizedTitle;
+ (id)localizedStringForSpecifierID:(id)a3;
+ (id)rootDeepLinkURL;
+ (id)rootLocalizedTitle;
+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4;
- (BOOL)_shouldShowDefaultAccountButton;
- (EMDaemonInterface)daemonInterface;
- (MailSettingsPlugin)init;
- (PSSystemPolicyForApp)appPolicy;
- (id)accountTitlesForSpecifier:(id)a3;
- (id)accountValuesForSpecifier:(id)a3;
- (id)addLinkPreviews:(id)a3;
- (id)blockedSenderOptions:(id)a3;
- (id)ccSelf:(id)a3;
- (id)collapseReadMessages:(id)a3;
- (id)confirmDelete:(id)a3;
- (id)conversationViewShowsNewestAtTop:(id)a3;
- (id)currentQuoteLevel:(id)a3;
- (id)defaultSendingAccount:(id)a3;
- (id)enableAutomaticMessageSummarization:(id)a3;
- (id)enableFollowUp:(id)a3;
- (id)enableThreading:(id)a3;
- (id)extensionsEnablement:(id)a3;
- (id)getCurrentSignatureAsynchronously:(id)a3;
- (id)getCurrentSignatureSynchronously:(id)a3;
- (id)getHasHighlightingSafeDomains:(id)a3;
- (id)includeAttachments:(id)a3;
- (id)includeRelatedMessages:(id)a3;
- (id)linesOfPreview:(id)a3;
- (id)linesOfPreviewTitles;
- (id)loadRemoteImages:(id)a3;
- (id)mutedThreadAction:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)showMessageListAvatar:(id)a3;
- (id)showToCC:(id)a3;
- (id)specifiers;
- (id)undoSendDelayTime:(id)a3;
- (void)_mailAccountsDidChange;
- (void)_refreshAccounts;
- (void)_reloadMailAccounts;
- (void)dealloc;
- (void)emitNavigationEventForRootController;
- (void)setAddLinkPreviews:(id)a3 withSpecifier:(id)a4;
- (void)setAppPolicy:(id)a3;
- (void)setCCSelf:(id)a3 withSpecifier:(id)a4;
- (void)setCollapseReadMessages:(id)a3 withSpecifier:(id)a4;
- (void)setConfirmDelete:(id)a3 withSpecifier:(id)a4;
- (void)setConversationViewShowsNewestAtTop:(id)a3 withSpecifier:(id)a4;
- (void)setDaemonInterface:(id)a3;
- (void)setDefaultSendingAccount:(id)a3 withSpecifier:(id)a4;
- (void)setEnableAutomaticMessageSummarization:(id)a3 withSpecifier:(id)a4;
- (void)setEnableFollowUp:(id)a3 withSpecifier:(id)a4;
- (void)setEnableThreading:(id)a3 withSpecifier:(id)a4;
- (void)setIncludeAttachments:(id)a3 withSpecifier:(id)a4;
- (void)setIncludeRelatedMessages:(id)a3 withSpecifier:(id)a4;
- (void)setLinesOfPreview:(id)a3 withSpecifier:(id)a4;
- (void)setLoadRemoteImages:(id)a3 withSpecifier:(id)a4;
- (void)setMutedThreadAction:(id)a3 withSpecifier:(id)a4;
- (void)setShowMessageListAvatar:(id)a3 withSpecifier:(id)a4;
- (void)setShowToCC:(id)a3 withSpecifier:(id)a4;
- (void)setUndoSendDelayTime:(id)a3 withSpecifier:(id)a4;
- (void)signatureDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MailSettingsPlugin

- (MailSettingsPlugin)init
{
  v17.receiver = self;
  v17.super_class = (Class)MailSettingsPlugin;
  v2 = [(MailSettingsPlugin *)&v17 init];
  if (v2)
  {
    v3 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    daemonInterface = v2->_daemonInterface;
    v2->_daemonInterface = v3;

    if (!qword_40AD0)
    {
      id v5 = objc_alloc_init((Class)NSNumberFormatter);
      v6 = (void *)qword_40AD0;
      qword_40AD0 = (uint64_t)v5;

      v7 = (void *)qword_40AD0;
      v8 = +[NSLocale autoupdatingCurrentLocale];
      [v7 setLocale:v8];

      [(id)qword_40AD0 setNumberStyle:1];
    }
    v9 = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    signatureLock = v2->_signatureLock;
    v2->_signatureLock = v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"signatureDidChange:" name:@"SignatureEditingPaneSignatureDidChange" object:0];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v12 = (const char *)kMFMailAccountsChangedNotification;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_E280;
    v14[3] = &unk_38D00;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch(v12, &v2->_accountsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)signatureDidChange:(id)a3
{
  [(NSConditionLock *)self->_signatureLock lock];
  signatureLock = self->_signatureLock;

  [(NSConditionLock *)signatureLock unlockWithCondition:0];
}

- (void)dealloc
{
  notify_cancel(self->_accountsChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MailSettingsPlugin;
  [(MailSettingsPlugin *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MailSettingsPlugin;
  [(MailSettingsPlugin *)&v4 viewDidAppear:a3];
  [(MailSettingsPlugin *)self emitNavigationEventForRootController];
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MailSettingsPlugin;
  id v5 = [(MailSettingsPlugin *)&v7 selectSpecifier:v4];
  +[MailSettingsPlugin emitNavigationEventForSpecifier:v4 viewController:v5];

  return v5;
}

- (void)_refreshAccounts
{
  objc_super v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  allMailAccounts = self->_allMailAccounts;
  self->_allMailAccounts = v3;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = +[MailAccount mailAccounts];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [(NSArray *)self->_allMailAccounts addObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9 = +[LocalAccount localAccount];
  if (v9) {
    [(NSArray *)self->_allMailAccounts removeObject:v9];
  }
}

- (void)_reloadMailAccounts
{
  +[MailAccount reloadAccounts];

  [(MailSettingsPlugin *)self _refreshAccounts];
}

- (void)_mailAccountsDidChange
{
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%@: reloading mail accounts", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [(MailSettingsPlugin *)self specifiers];
  [(MailSettingsPlugin *)self _reloadMailAccounts];
  uint64_t v7 = [(MailSettingsPlugin *)self specifiers];
  [(MailSettingsPlugin *)self replaceContiguousSpecifiers:v6 withSpecifiers:v7 animated:0];
}

- (id)linesOfPreviewTitles
{
  id v15 = objc_alloc_init((Class)NSMutableArray);
  +[NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", 0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v5 = +[NSString stringWithFormat:@"%@_LINES", v4];
        id v6 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_39200 table:@"Preferences"];
        int v8 = (void *)qword_40AD0;
        v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue]);
        long long v10 = [v8 stringFromNumber:v9];
        long long v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v10);

        [v15 addObject:v11];
      }
      id v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v2);
  }

  return v15;
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v157 = v3;
  if (![(NSArray *)self->_allMailAccounts count]) {
    [(MailSettingsPlugin *)self _reloadMailAccounts];
  }
  id v4 = [(MailSettingsPlugin *)self appPolicy];

  if (!v4)
  {
    id v5 = objc_alloc((Class)PSSystemPolicyForApp);
    id v6 = [v5 initWithBundleIdentifier:kMFMobileMailBundleIdentifier];
    [(MailSettingsPlugin *)self setAppPolicy:v6];

    uint64_t v7 = [(MailSettingsPlugin *)self appPolicy];
    [v7 setDelegate:self];
  }
  int v8 = [(MailSettingsPlugin *)self appPolicy];
  v150 = [v8 specifiersForPolicyOptions:1115717633 force:0];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v10 = [v9 localizedStringForKey:@"MOBILE_MAIL_SETTINGS_PLACARD" value:&stru_39200 table:@"Preferences"];
  v153 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v153 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v153 setIdentifier:@"MOBILE_MAIL_SETTINGS_PLACARD"];
  [v3 addObject:v153];
  long long v11 = [(MailSettingsPlugin *)self appPolicy];
  long long v12 = [v11 specifiersForPolicyOptions:0x8000000 force:0];

  v139 = v12;
  v154 = [v12 specifierForID:@"ACCOUNTS"];
  if (v154)
  {
    long long v13 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"MAIL_ACCOUNTS" value:&stru_39200 table:@"Preferences"];
    [v154 setName:v14];

    uint64_t v15 = (uint64_t)v154;
  }
  else
  {
    uint64_t v15 = [v12 specifierForID:@"ADD_ACCOUNT"];
  }
  v155 = (void *)v15;
  objc_msgSend(v3, "ps_insertObject:afterObject:");
  [v3 addObjectsFromArray:v150];
  long long v16 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v17 = [v16 localizedStringForKey:@"SECTION_MESSAGE_LIST" value:&stru_39200 table:@"Preferences"];
  long long v18 = +[PSSpecifier groupSpecifierWithName:v17];
  [v3 addObject:v18];

  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    long long v19 = _EFLocalizedString();
    id v20 = _ConfigurePSSpecifier(v3, (uint64_t)v19, (uint64_t)self, (uint64_t)"setEnableAutomaticMessageSummarization:withSpecifier:", (uint64_t)"enableAutomaticMessageSummarization:", 0, 0, 0, 6, 0, 0, 0, 0);
  }
  if (EMBlackPearlIsFeatureEnabled())
  {
    v21 = _EFLocalizedString();
    id v22 = _ConfigurePSSpecifier(v3, (uint64_t)v21, (uint64_t)self, (uint64_t)"setShowMessageListAvatar:withSpecifier:", (uint64_t)"showMessageListAvatar:", 0, 0, 0, 6, 0, 0, 0, 0);
  }
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"SHOW_TOCC_INDICATOR" value:&stru_39200 table:@"Preferences"];
  v25 = _ConfigurePSSpecifier(v3, (uint64_t)v24, (uint64_t)self, (uint64_t)"setShowToCC:withSpecifier:", (uint64_t)"showToCC:", 0, 0, 0, 6, 0, 0, 0, 0);

  v138 = v25;
  [v25 setIdentifier:@"SHOW_TOCC_INDICATOR"];
  v26 = +[NSBundle bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"LINES_OF_PREVIEW" value:&stru_39200 table:@"Preferences"];
  uint64_t v28 = objc_opt_class();
  v29 = [(MailSettingsPlugin *)self linesOfPreviewTitles];
  v30 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v29, @"titles", 0];
  v31 = _ConfigurePSSpecifier(v3, (uint64_t)v27, (uint64_t)self, (uint64_t)"setLinesOfPreview:withSpecifier:", (uint64_t)"linesOfPreview:", 0, 0, v28, 2, 0, v30, 0, &off_3B758);

  v137 = v31;
  [v31 setIdentifier:@"LINES_OF_PREVIEW"];
  v32 = +[NSBundle bundleForClass:objc_opt_class()];
  v33 = [v32 localizedStringForKey:@"SWIPE_OPTIONS" value:&stru_39200 table:@"Preferences"];
  uint64_t v34 = objc_opt_class();
  v35 = _ConfigurePSSpecifier(v3, (uint64_t)v33, 0, 0, 0, 0, 0, v34, 2, 0, 0, 0, 0);

  v136 = v35;
  [v35 setIdentifier:@"SWIPE_OPTIONS"];
  v36 = +[NSBundle bundleForClass:objc_opt_class()];
  v37 = [v36 localizedStringForKey:@"SECTION_MESSAGES" value:&stru_39200 table:@"Preferences"];
  v38 = +[PSSpecifier groupSpecifierWithName:v37];
  [v3 addObject:v38];

  v39 = +[NSBundle bundleForClass:objc_opt_class()];
  if (+[UIDevice mf_isPad]) {
    CFStringRef v40 = @"CONFIRM_MESSAGE_DELETE_LONG";
  }
  else {
    CFStringRef v40 = @"CONFIRM_MESSAGE_DELETE";
  }
  v41 = [v39 localizedStringForKey:v40 value:&stru_39200 table:@"Preferences"];
  v42 = _ConfigurePSSpecifier(v3, (uint64_t)v41, (uint64_t)self, (uint64_t)"setConfirmDelete:withSpecifier:", (uint64_t)"confirmDelete:", 0, 0, 0, 6, 0, 0, 0, 0);

  v135 = v42;
  [v42 setIdentifier:@"ASK_BEFORE_DELETING"];
  v43 = +[NSBundle bundleForClass:objc_opt_class()];
  v44 = [v43 localizedStringForKey:@"TRACKING_PROTECTION" value:&stru_39200 table:@"Preferences"];
  v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v149 = v45;
  [v45 setIdentifier:@"PRIVACY_PROTECTION"];
  [v3 addObject:v45];
  v46 = _EFLocalizedString();
  id v47 = _ConfigurePSSpecifier(v3, (uint64_t)v46, (uint64_t)self, (uint64_t)"setEnableFollowUp:withSpecifier:", (uint64_t)"enableFollowUp:", 0, 0, 0, 6, 0, 0, 0, 0);

  v48 = +[NSBundle bundleForClass:objc_opt_class()];
  v49 = [v48 localizedStringForKey:@"SECTION_THREADING" value:&stru_39200 table:@"Preferences"];
  uint64_t v50 = +[PSSpecifier groupSpecifierWithName:v49];

  v134 = (void *)v50;
  [v3 addObject:v50];
  v51 = +[NSBundle bundleForClass:objc_opt_class()];
  v52 = [v51 localizedStringForKey:@"ORGANIZE_BY_THREAD" value:&stru_39200 table:@"Preferences"];
  v53 = _ConfigurePSSpecifier(v3, (uint64_t)v52, (uint64_t)self, (uint64_t)"setEnableThreading:withSpecifier:", (uint64_t)"enableThreading:", 0, 0, 0, 6, 0, 0, 0, 0);

  v133 = v53;
  [v53 setIdentifier:@"ORGANIZE_BY_THREAD"];
  v54 = +[NSBundle bundleForClass:objc_opt_class()];
  v55 = [v54 localizedStringForKey:@"COLLAPSE_READ_MESSAGES" value:&stru_39200 table:@"Preferences"];
  v56 = _ConfigurePSSpecifier(v3, (uint64_t)v55, (uint64_t)self, (uint64_t)"setCollapseReadMessages:withSpecifier:", (uint64_t)"collapseReadMessages:", 0, 0, 0, 6, 0, 0, 0, 0);

  v132 = v56;
  [v56 setIdentifier:@"COLLAPSE_READ_MESSAGES"];
  v57 = +[NSBundle bundleForClass:objc_opt_class()];
  v58 = [v57 localizedStringForKey:@"SHOW_NEWEST_MESSAGE_AT_TOP" value:&stru_39200 table:@"Preferences"];
  v59 = _ConfigurePSSpecifier(v3, (uint64_t)v58, (uint64_t)self, (uint64_t)"setConversationViewShowsNewestAtTop:withSpecifier:", (uint64_t)"conversationViewShowsNewestAtTop:", 0, 0, 0, 6, 0, 0, 0, 0);

  v131 = v59;
  [v59 setIdentifier:@"MOST_RECENT_MESSAGE_ON_TOP"];
  v60 = +[NSBundle bundleForClass:objc_opt_class()];
  v61 = [v60 localizedStringForKey:@"COMPLETE_THREADS" value:&stru_39200 table:@"Preferences"];
  v62 = _ConfigurePSSpecifier(v3, (uint64_t)v61, (uint64_t)self, (uint64_t)"setIncludeRelatedMessages:withSpecifier:", (uint64_t)"includeRelatedMessages:", 0, 0, 0, 6, 0, 0, 0, 0);

  v130 = v62;
  [v62 setIdentifier:@"COMPLETE_THREADS"];
  v63 = +[NSBundle bundleForClass:objc_opt_class()];
  v64 = [v63 localizedStringForKey:@"MUTED_THREAD_ACTION" value:&stru_39200 table:@"Preferences"];
  v156 = +[PSSpecifier preferenceSpecifierNamed:v64 target:self set:"setMutedThreadAction:withSpecifier:" get:"mutedThreadAction:" detail:objc_opt_class() cell:2 edit:0];

  v162[0] = EMUserDefaultMutedThreadActionMarkAsRead;
  v162[1] = EMUserDefaultMutedThreadActionMoveToArchiveOrDelete;
  v65 = +[NSArray arrayWithObjects:v162 count:2];
  v66 = +[NSBundle bundleForClass:objc_opt_class()];
  v67 = [v66 localizedStringForKey:@"MUTE_ACTION_MARK_AS_READ" value:&stru_39200 table:@"Preferences"];
  v161[0] = v67;
  v68 = +[NSBundle bundleForClass:objc_opt_class()];
  v69 = [v68 localizedStringForKey:@"MUTE_ACTION_ARCHIVE_OR_DELETE" value:&stru_39200 table:@"Preferences"];
  v161[1] = v69;
  v70 = +[NSArray arrayWithObjects:v161 count:2];
  [v156 setValues:v65 titles:v70];

  [v156 setIdentifier:@"MUTED_THREAD_ACTION"];
  [v157 addObject:v156];
  v71 = +[NSBundle bundleForClass:objc_opt_class()];
  v72 = [v71 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS" value:&stru_39200 table:@"Preferences"];
  v148 = +[PSSpecifier preferenceSpecifierNamed:v72 target:self set:0 get:"blockedSenderOptions:" detail:objc_opt_class() cell:2 edit:0];

  [v148 setIdentifier:@"BLOCKED_SENDER_OPTIONS"];
  [v157 addObject:v148];
  v73 = +[NSBundle bundleForClass:objc_opt_class()];
  v74 = [v73 localizedStringForKey:@"BLOCKED_LIST" value:&stru_39200 table:@"Preferences"];
  v152 = +[PSSpecifier preferenceSpecifierNamed:v74 target:self set:0 get:0 detail:0 cell:2 edit:0];

  v75 = PSBundlePathForPreferenceBundle();
  [v152 setProperty:v75 forKey:PSLazilyLoadedBundleKey];

  [v152 setProperty:@"PHBlocklistSettingsListController" forKey:PSDetailControllerClassKey];
  [v152 setProperty:&__kCFBooleanTrue forKey:PSBundleOverridePrincipalClassKey];
  [v152 setControllerLoadAction:"lazyLoadBundle:"];
  [v152 setIdentifier:@"BLOCKED_SENDERS"];
  [v157 addObject:v152];
  v76 = +[NSBundle bundleForClass:objc_opt_class()];
  v77 = [v76 localizedStringForKey:@"SECTION_COMPOSING" value:&stru_39200 table:@"Preferences"];
  v151 = +[PSSpecifier groupSpecifierWithName:v77];

  [v157 addObject:v151];
  v78 = +[NSBundle bundleForClass:objc_opt_class()];
  v79 = [v78 localizedStringForKey:@"AUTOMATICALLY_CC_SELF" value:&stru_39200 table:@"Preferences"];
  v145 = _ConfigurePSSpecifier(v157, (uint64_t)v79, (uint64_t)self, (uint64_t)"setCCSelf:withSpecifier:", (uint64_t)"ccSelf:", 0, 0, 0, 6, 0, 0, 0, 0);

  [v145 setIdentifier:@"ALWAYS_BCC_MYSELF"];
  v80 = +[NSBundle bundleForClass:objc_opt_class()];
  v81 = [v80 localizedStringForKey:@"HIGHLIGHT_ADDRESSES" value:&stru_39200 table:@"Preferences"];
  uint64_t v82 = objc_opt_class();
  v144 = _ConfigurePSSpecifier(v157, (uint64_t)v81, (uint64_t)self, 0, (uint64_t)"getHasHighlightingSafeDomains:", 0, 0, v82, 2, 0, 0, 0, 0);

  [v144 setIdentifier:@"MARK_ADDRESSES"];
  v83 = +[NSBundle bundleForClass:objc_opt_class()];
  v84 = [v83 localizedStringForKey:@"INCREASE_QUOTE_LEVEL" value:&stru_39200 table:@"Preferences"];
  uint64_t v85 = objc_opt_class();
  v143 = _ConfigurePSSpecifier(v157, (uint64_t)v84, (uint64_t)self, (uint64_t)"setCurrentQuoteLevel:withSpecifier:", (uint64_t)"currentQuoteLevel:", 0, 0, v85, 2, 0, 0, 0, 0);

  [v143 setIdentifier:@"INCREASE_QUOTE_LEVEL"];
  v140 = +[NSBundle bundleForClass:objc_opt_class()];
  v146 = [v140 localizedStringForKey:@"INCLUDE_ATTACHMENT_REPLIES" value:&stru_39200 table:@"Preferences"];
  uint64_t v86 = objc_opt_class();
  v128 = +[NSBundle bundleForClass:objc_opt_class()];
  v129 = [v128 localizedStringForKey:@"NEVER" value:&stru_39200 table:@"Preferences"];
  v160[0] = v129;
  v127 = +[NSBundle bundleForClass:objc_opt_class()];
  v87 = [v127 localizedStringForKey:@"WHEN_ADDING" value:&stru_39200 table:@"Preferences"];
  v160[1] = v87;
  v88 = +[NSBundle bundleForClass:objc_opt_class()];
  v89 = [v88 localizedStringForKey:@"ASK" value:&stru_39200 table:@"Preferences"];
  v160[2] = v89;
  v90 = +[NSBundle bundleForClass:objc_opt_class()];
  v91 = [v90 localizedStringForKey:@"ALWAYS" value:&stru_39200 table:@"Preferences"];
  v160[3] = v91;
  v92 = +[NSArray arrayWithObjects:v160 count:4];
  v93 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v92, @"titles", 0];
  v159[0] = @"IncludeAttachmentRepliesNever";
  v159[1] = @"IncludeAttachmentRepliesWhenAdding";
  v159[2] = @"IncludeAttachmentRepliesAsk";
  v159[3] = @"IncludeAttachmentRepliesAlways";
  v94 = +[NSArray arrayWithObjects:v159 count:4];
  v142 = _ConfigurePSSpecifier(v157, (uint64_t)v146, (uint64_t)self, (uint64_t)"setIncludeAttachments:withSpecifier:", (uint64_t)"includeAttachments:", 0, 0, v86, 2, 0, v93, 0, v94);

  [v142 setIdentifier:@"INCLUDE_ATTACHMENTS_WITH_REPLIES"];
  v95 = +[NSBundle bundleForClass:objc_opt_class()];
  v96 = [v95 localizedStringForKey:@"ADD_LINK_PREVIEWS" value:&stru_39200 table:@"Preferences"];
  id v97 = _ConfigurePSSpecifier(v157, (uint64_t)v96, (uint64_t)self, (uint64_t)"setAddLinkPreviews:withSpecifier:", (uint64_t)"addLinkPreviews:", 0, 0, 0, 6, 0, 0, 0, 0);

  v98 = +[NSBundle bundleForClass:objc_opt_class()];
  v99 = [v98 localizedStringForKey:@"SIGNATURE" value:&stru_39200 table:@"Preferences"];
  uint64_t v100 = objc_opt_class();
  v147 = _ConfigurePSSpecifier(v157, (uint64_t)v99, (uint64_t)self, (uint64_t)"setCurrentSignature:withSpecifier:", (uint64_t)"getCurrentSignatureAsynchronously:", 0, 0, v100, 2, 0, 0, 0, 0);

  [v147 setIdentifier:@"SIGNATURE"];
  v101 = +[NSBundle bundleForClass:objc_opt_class()];
  v102 = [v101 localizedStringForKey:@"LOAD_REMOTE_IMAGES" value:&stru_39200 table:@"Preferences"];
  v141 = _ConfigurePSSpecifier(v157, (uint64_t)v102, (uint64_t)self, (uint64_t)"setLoadRemoteImages:withSpecifier:", (uint64_t)"loadRemoteImages:", 0, 0, 0, 6, 0, 0, 0, 0);

  [v141 setIdentifier:@"LOAD_REMOTE_IMAGES"];
  if ([(MailSettingsPlugin *)self _shouldShowDefaultAccountButton])
  {
    if (+[UIDevice mf_isPad])
    {
      v103 = +[NSBundle bundleForClass:objc_opt_class()];
      [v103 localizedStringForKey:@"DEFAULT_DESC_IPAD" value:&stru_39200 table:@"Preferences"];
    }
    else
    {
      v103 = +[NSBundle bundleForClass:objc_opt_class()];
      [v103 localizedStringForKey:@"DEFAULT_DESC_IPHONE" value:&stru_39200 table:@"Preferences"];
    v104 = };
    [v151 setProperty:v104 forKey:PSFooterTextGroupKey];

    v105 = +[NSBundle bundleForClass:objc_opt_class()];
    v106 = [v105 localizedStringForKey:@"DEFAULT_SENDING_ACCOUNT" value:&stru_39200 table:@"Preferences"];
    v107 = +[PSSpecifier preferenceSpecifierNamed:v106 target:self set:"setDefaultSendingAccount:withSpecifier:" get:"defaultSendingAccount:" detail:objc_opt_class() cell:2 edit:0];

    v108 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:MFDefaultSendingAccountKey, @"key", 0];
    [v107 setUserInfo:v108];

    [v107 setProperty:@"accountValuesForSpecifier:" forKey:PSValuesDataSourceKey];
    [v107 setProperty:@"accountTitlesForSpecifier:" forKey:PSTitlesDataSourceKey];
    [v157 addObject:v107];
  }
  v109 = _EFLocalizedString();
  v110 = +[PSSpecifier groupSpecifierWithName:v109];

  [v157 addObject:v110];
  v111 = _EFLocalizedString();
  uint64_t v112 = objc_opt_class();
  v113 = _EFLocalizedString();
  v158[0] = v113;
  v114 = _EFLocalizedString();
  v158[1] = v114;
  v115 = _EFLocalizedString();
  v158[2] = v115;
  v116 = _EFLocalizedString();
  v158[3] = v116;
  v117 = +[NSArray arrayWithObjects:v158 count:4];
  v118 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v117, @"titles", 0];
  v119 = _ConfigurePSSpecifier(v157, (uint64_t)v111, (uint64_t)self, (uint64_t)"setUndoSendDelayTime:withSpecifier:", (uint64_t)"undoSendDelayTime:", 0, 0, v112, 2, 0, v118, 0, &off_3B770);

  [v119 setIdentifier:@"UNDO_SEND_DELAY"];
  if (_os_feature_enabled_impl())
  {
    v120 = +[NSBundle bundleForClass:objc_opt_class()];
    v121 = [v120 localizedStringForKey:@"SECTION_EXTENSIONS" value:&stru_39200 table:@"Preferences"];
    v122 = +[PSSpecifier groupSpecifierWithName:v121];

    [v157 addObject:v122];
    v123 = +[NSBundle bundleForClass:objc_opt_class()];
    v124 = [v123 localizedStringForKey:@"EXTENSIONS_PREFERENCES" value:&stru_39200 table:@"Preferences"];
    v125 = +[PSSpecifier preferenceSpecifierNamed:v124 target:self set:0 get:"extensionsEnablement::" detail:objc_opt_class() cell:2 edit:0];

    [v157 addObject:v125];
  }
  [(MailSettingsPlugin *)self setSpecifiers:v157];

  return v157;
}

- (BOOL)_shouldShowDefaultAccountButton
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_allMailAccounts;
  unint64_t v3 = 0;
  id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isActive", (void)v9)
          && ([v7 restrictedFromSendingExternally] & 1) == 0)
        {
          if (v3)
          {
            unint64_t v3 = 2;
            goto LABEL_14;
          }
          unint64_t v3 = 1;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v3 > 1;
}

- (id)accountValuesForSpecifier:(id)a3
{
  id v4 = a3;
  if (!self->_allMailAccounts) {
    [(MailSettingsPlugin *)self _reloadMailAccounts];
  }
  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_allMailAccounts;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive", (void)v13)
          && ([v10 restrictedFromSendingExternally] & 1) == 0)
        {
          long long v11 = [v10 uniqueID];
          [v5 addObject:v11];
        }
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)accountTitlesForSpecifier:(id)a3
{
  id v4 = a3;
  if (!self->_allMailAccounts) {
    [(MailSettingsPlugin *)self _reloadMailAccounts];
  }
  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_allMailAccounts;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive", (void)v13)
          && ([v10 restrictedFromSendingExternally] & 1) == 0)
        {
          long long v11 = [v10 displayName];
          [v5 addObject:v11];
        }
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)linesOfPreview:(id)a3
{
  getMailPreferenceValue(EMUserDefaultLinesOfPreviewKey);
  unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3) {
    unint64_t v3 = @"2";
  }

  return v3;
}

- (void)setLinesOfPreview:(id)a3 withSpecifier:(id)a4
{
}

- (void)setCCSelf:(id)a3 withSpecifier:(id)a4
{
}

- (id)ccSelf:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getEmailPreferenceBoolValue(EMUserDefaultAlwaysBCCSelf)];

  return v3;
}

- (void)setConfirmDelete:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  sub_11574(@"ShowMessageDeleteConfirmation", (uint64_t)[v5 BOOLValue]);
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 notifyMobileMailAskBeforeDeletingChanged];
}

- (id)confirmDelete:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(@"ShowMessageDeleteConfirmation")];

  return v3;
}

- (id)blockedSenderOptions:(id)a3
{
  if (getMailBoolPreferenceValueWithDefault(EMUserDefaultBlockedSenderEnabled, 1))
  {
    unint64_t v3 = +[NSUserDefaults em_userDefaults];
    id v4 = [v3 valueForKey:EMUserDefaultBlockedSenderAction];

    id v5 = (char *)[v4 integerValue];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v5 != (unsigned char *)&dword_0 + 1)) != 0)
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      [v6 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_MARK_AS_BLOCKED" value:&stru_39200 table:@"Preferences"];
    }
    else
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      [v6 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_MOVE_TO_TRASH" value:&stru_39200 table:@"Preferences"];
    id v7 = };
  }
  else
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v4 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_NONE" value:&stru_39200 table:@"Preferences"];
  }

  return v7;
}

- (void)setIncludeAttachments:(id)a3 withSpecifier:(id)a4
{
}

- (id)includeAttachments:(id)a3
{
  unint64_t v3 = getMailPreferenceValueWithDefault(@"IncludeAttachmentReplies", @"IncludeAttachmentRepliesWhenAdding");

  return v3;
}

- (void)setUndoSendDelayTime:(id)a3 withSpecifier:(id)a4
{
}

- (id)undoSendDelayTime:(id)a3
{
  unint64_t v3 = getMailPreferenceValueWithDefault(EMUserDefaultUndoSendDelayTime, &off_3B5D0);

  return v3;
}

- (void)setEnableThreading:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  sub_11574(@"DisableThreading", [v5 BOOLValue] ^ 1);
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 notifyMobileMailOrganizeByThreadChanged];
}

- (id)enableThreading:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(@"DisableThreading") ^ 1];

  return v3;
}

- (void)setCollapseReadMessages:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  sub_11574(@"CollapseReadConversationMessages", (uint64_t)[v4 BOOLValue]);
}

- (id)collapseReadMessages:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValueWithDefault(@"CollapseReadConversationMessages", 1)];

  return v3;
}

- (void)setConversationViewShowsNewestAtTop:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  sub_11574(@"ConversationViewShowsNewestAtTop", (uint64_t)[v4 BOOLValue]);
}

- (id)conversationViewShowsNewestAtTop:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(@"ConversationViewShowsNewestAtTop")];

  return v3;
}

- (void)setIncludeRelatedMessages:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  sub_11574(@"ConversationViewExcludesRelatedMessages", [v4 BOOLValue] ^ 1);
}

- (id)includeRelatedMessages:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(@"ConversationViewExcludesRelatedMessages") ^ 1];

  return v3;
}

- (void)setShowMessageListAvatar:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  unsigned int v4 = [v5 BOOLValue];
  sub_11574(EMUserDefaultHideMessageListAvatar, v4 ^ 1);
}

- (id)showMessageListAvatar:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(EMUserDefaultHideMessageListAvatar) ^ 1];

  return v3;
}

- (void)setShowToCC:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  sub_11574(@"ShowToCCIndicators", (uint64_t)[v4 BOOLValue]);
}

- (id)showToCC:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(@"ShowToCCIndicators")];

  return v3;
}

- (void)setEnableFollowUp:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  unsigned int v4 = [v5 BOOLValue];
  sub_11574(EMUserDefaultDisableFollowUp, v4 ^ 1);
}

- (id)enableFollowUp:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(EMUserDefaultDisableFollowUp) ^ 1];

  return v3;
}

- (void)setEnableAutomaticMessageSummarization:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  unsigned int v4 = [v5 BOOLValue];
  sub_11574(EMUserDefaultDisableAutomaticMessageSummarization, v4 ^ 1);
}

- (id)enableAutomaticMessageSummarization:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithBool:getMailBoolPreferenceValue(EMUserDefaultDisableAutomaticMessageSummarization) ^ 1];

  return v3;
}

- (id)currentQuoteLevel:(id)a3
{
  unsigned __int8 MailBoolPreferenceValue = getMailBoolPreferenceValue(@"DisableQuoteIncrease");
  unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (MailBoolPreferenceValue) {
    [v4 localizedStringForKey:@"OFF" value:&stru_39200 table:@"Preferences"];
  }
  else {
  id v6 = [v4 localizedStringForKey:@"ON" value:&stru_39200 table:@"Preferences"];
  }

  return v6;
}

- (id)getCurrentSignatureAsynchronously:(id)a3
{
  id v4 = a3;
  [(NSConditionLock *)self->_signatureLock lock];
  NSInteger v5 = [(NSConditionLock *)self->_signatureLock condition];
  if (v5)
  {
    if (v5 == 1)
    {
      [(NSConditionLock *)self->_signatureLock unlock];
      id v6 = 0;
      goto LABEL_8;
    }
    if (v5 == 2)
    {
      id v6 = [(NSString *)self->_signatureValue copy];
      [(NSConditionLock *)self->_signatureLock unlock];
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    long long v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    long long v11 = sub_12158;
    long long v12 = &unk_38BD8;
    long long v13 = self;
    id v14 = v4;
    dispatch_async(v7, &v9);

    -[NSConditionLock unlockWithCondition:](self->_signatureLock, "unlockWithCondition:", 1, v9, v10, v11, v12, v13);
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)getCurrentSignatureSynchronously:(id)a3
{
  id v5 = a3;
  if (pthread_main_np())
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MailSettingsPlugin.m" lineNumber:865 description:@"Current thread is main"];
  }
  id v6 = +[MFSignatures sharedInstance];
  unsigned int v7 = [v6 useAccountSignatures];

  if (!v7) {
    goto LABEL_23;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = +[MailAccount mailAccounts];
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {

LABEL_23:
    uint64_t v10 = 0;
LABEL_24:
    id v20 = +[MFSignatures sharedInstance];
    long long v19 = [v20 signature];

LABEL_25:
    v21 = +[MFHTMLParser plainTextFromHTMLSnippet:v19];

    id v22 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    long long v18 = [v21 stringByTrimmingCharactersInSet:v22];

    goto LABEL_26;
  }
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ([v14 isActive])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v11)
          {
            id v15 = 0;
            ++v11;
          }
          else
          {
            id v15 = v14;
            unint64_t v11 = 1;
          }

          uint64_t v10 = v15;
        }
      }
    }
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v9);

  if (v11 < 2
    || (long long v16 = (void *)qword_40AD0,
        +[NSNumber numberWithUnsignedInteger:v11],
        long long v17 = objc_claimAutoreleasedReturnValue(),
        [v16 stringFromNumber:v17],
        long long v18 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v18))
  {
    if (v10)
    {
      long long v19 = [v10 customSignature];
      if (v19) {
        goto LABEL_25;
      }
    }
    goto LABEL_24;
  }
LABEL_26:

  return v18;
}

- (id)getHasHighlightingSafeDomains:(id)a3
{
  unint64_t v3 = +[MCProfileConnection sharedConnection];
  id v4 = [v3 effectiveValuesForIntersectionSetting:MCFeatureManagedEmailDomains];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v4) {
    [v5 localizedStringForKey:@"HIGHLIGHT_ADDRESSES_ON" value:&stru_39200 table:@"Preferences"];
  }
  else {
  id v6 = [v5 localizedStringForKey:@"HIGHLIGHT_ADDRESSES_OFF" value:&stru_39200 table:@"Preferences"];
  }

  return v6;
}

- (void)setDefaultSendingAccount:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  sub_113D8(MailDefaultSendingAccountKey, v6);
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 notifyMobileMailDefaultAccountUidChanged];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MFMailDefaultSendingAccountDidChange, 0, 0, 1u);
}

- (id)defaultSendingAccount:(id)a3
{
  unint64_t v3 = +[MailAccount defaultMailAccountForDelivery];
  id v4 = [v3 uniqueID];

  return v4;
}

- (void)setMutedThreadAction:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  sub_113D8(EMUserDefaultMutedThreadActionKey, v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, EMUserDefaultMutedThreadActionDidChangeNotification, 0, 0, 1u);
}

- (id)mutedThreadAction:(id)a3
{
  unint64_t v3 = getMailPreferenceValue(EMUserDefaultMutedThreadActionKey);
  id v4 = v3;
  if (!v3) {
    unint64_t v3 = (void *)EMUserDefaultMutedThreadActionMarkAsRead;
  }
  id v5 = v3;

  return v5;
}

- (id)addLinkPreviews:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithInt:getMailBoolPreferenceValue(EMUserDefaultDisableAddLinkPreviews) ^ 1];

  return v3;
}

- (void)setAddLinkPreviews:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  unsigned int v4 = [v5 BOOLValue];
  sub_11574(EMUserDefaultDisableAddLinkPreviews, v4 ^ 1);
}

- (id)loadRemoteImages:(id)a3
{
  unint64_t v3 = +[NSNumber numberWithInt:getMailBoolPreferenceValue(EMUserDefaultLoadRemoteContentKey) ^ 1];

  return v3;
}

- (void)setLoadRemoteImages:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  unsigned int v4 = [v5 BOOLValue];
  sub_11574(EMUserDefaultLoadRemoteContentKey, v4 ^ 1);
}

- (id)extensionsEnablement:(id)a3
{
  unint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v4 = [v3 localizedStringForKey:@"EXTENSIONS_ENABLED" value:&stru_39200 table:@"Preferences"];

  return v4;
}

- (void)emitNavigationEventForRootController
{
  unint64_t v3 = +[MailSettingsPlugin rootDeepLinkURL];
  unsigned int v4 = +[MailSettingsPlugin appsLocalizedTitle];
  uint64_t v5 = +[MailSettingsPlugin rootLocalizedTitle];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v9 = v4;
    uint64_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [(MailSettingsPlugin *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:kMFMobileMailBundleIdentifier title:v6 localizedNavigationComponents:v8 deepLink:v3];
  }
}

+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_opt_class();
  if ([v7 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = v6;
    id v9 = [v5 identifier];
    if (v9)
    {
      uint64_t v10 = +[MailSettingsPlugin appsLocalizedTitle];
      unint64_t v11 = +[MailSettingsPlugin rootLocalizedTitle];
      uint64_t v12 = +[MailSettingsPlugin localizedStringForSpecifierID:v9];
      long long v13 = (void *)v12;
      if (v10 && v12 && v11)
      {
        id v14 = +[MailSettingsPlugin rootDeepLinkURL];
        id v15 = [v14 URLByAppendingPathComponent:v9];

        v17[0] = v10;
        v17[1] = v11;
        long long v16 = +[NSArray arrayWithObjects:v17 count:2];
        objc_msgSend(v8, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", kMFMobileMailBundleIdentifier, v13, v16, v15);
      }
    }
  }
}

+ (id)localizedStringForSpecifierID:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"SIRI_AND_SEARCH"])
    {
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      id v6 = [v5 bundleURL];

      BOOL v7 = @"ASSISTANT_AND_SEARCH";
      CFStringRef v8 = @"AssistantShared";
    }
    else if ([v4 isEqualToString:@"UNDO_SEND_DELAY"])
    {
      uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
      id v6 = [v10 bundleURL];

      BOOL v7 = @"Undo Send Delay";
      CFStringRef v8 = @"Localizable";
    }
    else
    {
      v22[0] = @"ADD_ACCOUNTS";
      v22[1] = @"NOTIFICATIONS";
      v23[0] = @"ADD_ACCOUNT";
      v23[1] = @"NOTIFICATIONS";
      v22[2] = @"PREFERRED_LANGUAGE";
      v22[3] = @"DEFAULT_MAIL_APP";
      v23[2] = @"LANGUAGE";
      v23[3] = @"DEFAULT_MAIL_APP";
      unint64_t v11 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
      uint64_t v12 = [v11 objectForKeyedSubscript:v4];
      if (v12)
      {
        long long v13 = +[NSBundle bundleForClass:objc_opt_class()];
        id v6 = [v13 bundleURL];

        BOOL v7 = v12;
        CFStringRef v8 = @"PSSystemPolicy";
      }
      else
      {
        v20[0] = @"ACCOUNTS";
        v20[1] = @"LINES_OF_PREVIEW";
        v21[0] = @"MAIL_ACCOUNTS";
        v21[1] = @"LINES_OF_PREVIEW";
        v20[2] = @"PRIVACY_PROTECTION";
        v20[3] = @"SWIPE_OPTIONS";
        v21[2] = @"TRACKING_PROTECTION";
        v21[3] = @"SWIPE_OPTIONS";
        v20[4] = @"MUTED_THREAD_ACTION";
        v20[5] = @"BLOCKED_SENDER_OPTIONS";
        v21[4] = @"MUTED_THREAD_ACTION";
        v21[5] = @"BLOCKED_SENDER_OPTIONS";
        v20[6] = @"BLOCKED_SENDERS";
        v20[7] = @"MARK_ADDRESSES";
        v21[6] = @"BLOCKED_LIST";
        v21[7] = @"HIGHLIGHT_ADDRESSES";
        v20[8] = @"INCREASE_QUOTE_LEVEL";
        v20[9] = @"INCLUDE_ATTACHMENTS_WITH_REPLIES";
        v21[8] = @"INCREASE_QUOTE_LEVEL";
        v21[9] = @"INCLUDE_ATTACHMENT_REPLIES";
        v20[10] = @"SIGNATURE";
        v20[11] = @"ORGANIZE_BY_THREAD";
        v21[10] = @"SIGNATURE";
        v21[11] = @"ORGANIZE_BY_THREAD";
        v20[12] = @"SHOW_TOCC_INDICATOR";
        v20[13] = @"ALWAYS_BCC_MYSELF";
        v21[12] = @"SHOW_TOCC_INDICATOR";
        v21[13] = @"AUTOMATICALLY_CC_SELF";
        v20[14] = @"COLLAPSE_READ_MESSAGES";
        v20[15] = @"MOST_RECENT_MESSAGE_ON_TOP";
        v21[14] = @"COLLAPSE_READ_MESSAGES";
        v21[15] = @"SHOW_NEWEST_MESSAGE_AT_TOP";
        v20[16] = @"COMPLETE_THREADS";
        v20[17] = @"ASK_BEFORE_DELETING";
        v21[16] = @"COMPLETE_THREADS";
        v21[17] = @"ASK_BEFORE_DELETING";
        id v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:18];
        BOOL v7 = [v14 objectForKeyedSubscript:v4];
        if (v7)
        {
          id v15 = +[NSBundle bundleForClass:objc_opt_class()];
          id v6 = [v15 bundleURL];

          long long v16 = v7;
          CFStringRef v8 = @"Preferences";
        }
        else
        {
          id v6 = 0;
          CFStringRef v8 = 0;
        }
      }
    }
    id v9 = 0;
    if (v6 && v8 && v7)
    {
      id v17 = objc_alloc((Class)_NSLocalizedStringResource);
      long long v18 = +[NSLocale currentLocale];
      id v9 = [v17 initWithKey:v7 table:v8 locale:v18 bundleURL:v6];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)appsLocalizedTitle
{
  id v2 = objc_alloc((Class)_NSLocalizedStringResource);
  id v3 = +[NSLocale currentLocale];
  unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 bundleURL];
  id v6 = [v2 initWithKey:@"APPS" table:@"Preferences" locale:v3 bundleURL:v5];

  return v6;
}

+ (id)rootLocalizedTitle
{
  id v2 = objc_alloc((Class)_NSLocalizedStringResource);
  id v3 = +[NSLocale currentLocale];
  unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 bundleURL];
  id v6 = [v2 initWithKey:@"MAIL" table:@"Preferences" locale:v3 bundleURL:v5];

  return v6;
}

+ (id)rootDeepLinkURL
{
  return +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilemail"];
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_signatureValue, 0);
  objc_storeStrong((id *)&self->_signatureLock, 0);

  objc_storeStrong((id *)&self->_allMailAccounts, 0);
}

@end