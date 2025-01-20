@interface ShareAcceptor
- (BOOL)_authenticateUsers:(id *)a3;
- (BOOL)_checkDataclassError:(id *)a3;
- (BOOL)_fallbackFlowDownloadApp:(id *)a3;
- (BOOL)_fallbackFlowDownloadAppUpdate:(id *)a3;
- (BOOL)_fallbackFlowWarnNetworkUnavailable:(id *)a3;
- (BOOL)_fallbackFlowWarnServiceUnavailable:(id *)a3;
- (BOOL)_fallbackFlowWarnShareUnavailable:(id *)a3;
- (BOOL)_fallbackFlowWebRedirect:(id *)a3;
- (BOOL)_fetchMetadata:(id *)a3;
- (BOOL)_getShareName;
- (BOOL)_handleAppleInternalDaemon:(id)a3 response:(id)a4 error:(id *)a5;
- (BOOL)_handlePotentialAppleInternalDaemon:(id *)a3;
- (BOOL)_initiateVettingOfSingleOONMatch:(id *)a3;
- (BOOL)_launchApp:(id *)a3;
- (BOOL)_lookUpRegisteredBundleIDs:(id *)a3;
- (BOOL)_notifyBladeRunner:(id *)a3;
- (BOOL)_promptAppSelection:(id *)a3;
- (BOOL)_promptToOpenAppStoreLink:(id *)a3 alertOptions:(id)a4 appURL:(id)a5;
- (BOOL)_requestSelectionFromMultipleOONMatches:(id *)a3;
- (BOOL)_shouldSendURLToBladeRunner:(id)a3;
- (BOOL)_shouldSendURLToPhotos:(id)a3;
- (BOOL)_shouldShowICloudLoginPrompt:(id)a3;
- (BOOL)_urlHasALongToken:(id)a3;
- (BOOL)_urlIsALegacyiWorkShareURL:(id)a3;
- (BOOL)_urlIsAniWorkShareURL:(id)a3;
- (BOOL)_validateShareURL:(id *)a3;
- (BOOL)_verifySelectedApp:(id *)a3;
- (BOOL)accepting;
- (BOOL)cancelled;
- (BOOL)hasValidConnection;
- (BOOL)isSourceICS;
- (BOOL)makeStateTransition:(id *)a3;
- (BOOL)retrievingDialogShouldDisplay;
- (BOOL)shareNeedsAcceptance;
- (BOOL)shouldShowRetrievingDialogForState:(int64_t)a3;
- (BOOL)shouldTerminateAfterFetchingMetadata;
- (CKContainer)metadataIndicatedContainer;
- (CKContainer)testTargetContainer;
- (CKDeviceToDeviceShareInvitationToken)invitationToken;
- (CKShareMetadata)shareMetadata;
- (CKShareParticipant)singleOONMatch;
- (NSArray)registeredAppBundleIDs;
- (NSArray)registeredDaemonBundleIDs;
- (NSDictionary)localBundleIDsToDisplayNames;
- (NSDictionary)unitTestOverrides;
- (NSError)fallbackFlowCause;
- (NSPersonNameComponents)currentUserNameComponents;
- (NSString)chosenAppBundleID;
- (NSString)currentUserFormattedUsername;
- (NSString)selectedAccountID;
- (NSString)shareName;
- (NSString)webFlowReason;
- (NSURL)url;
- (NSXPCConnection)xpcConnection;
- (RetrievingDialog)retrievingDialog;
- (ShareAcceptor)initWithCloudKitURL:(id)a3;
- (ShareAcceptor)initWithCloudKitURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6;
- (ShareAcceptor)initWithShareMetadata:(id)a3 shareURL:(id)a4;
- (id)_deduplicateBundleToNamesMapping:(id)a3;
- (id)_fetchCurrentUserNameComponents;
- (id)_fetchShareMetadataForAccountID:(id)a3 error:(id *)a4;
- (id)_findStoreDataForBundleIDs:(id)a3 error:(id *)a4;
- (id)_iOSwatchOSHandleMultipleAppStoreCandidates:(id)a3 error:(id *)a4;
- (id)_iosShowAppSelectionDialogWithTitlesDictionary:(id)a3;
- (id)_iosShowVettingAlert;
- (id)_promptForAccountIDChoiceWithAccountIDsByUsername:(id)a3 error:(id *)a4;
- (id)_showVettingAlert;
- (id)_trySelectingOONParticipant;
- (id)chooseFromMultipleBundleIDs;
- (id)fetchMetadata;
- (id)promptForSingleBundleID;
- (int64_t)_checkRepresentativeDataclassEnabled:(id *)a3 appCandidatesPresent:(BOOL)a4;
- (int64_t)_fallbackFlowICloudAccountSettings:(id *)a3 success:(BOOL *)a4;
- (int64_t)_handlePotentialOONMatches;
- (int64_t)_lookUpLocalBundleIDs:(id *)a3 success:(BOOL *)a4;
- (int64_t)initiateVetting;
- (int64_t)state;
- (unint64_t)backgroundTaskID;
- (void)_cancel;
- (void)_extractEmailAddressesFromProperties:(id)a3 into:(id)a4;
- (void)_initiateVettingForParticipantID:(id)a3 address:(id)a4 andThen:(id)a5;
- (void)acceptShareWithCompletionHandler:(id)a3;
- (void)retrievingDialogCancelled;
- (void)setAccepting:(BOOL)a3;
- (void)setBackgroundTaskID:(unint64_t)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setChosenAppBundleID:(id)a3;
- (void)setCurrentUserFormattedUsername:(id)a3;
- (void)setCurrentUserNameComponents:(id)a3;
- (void)setFallbackFlowCause:(id)a3;
- (void)setHasValidConnection:(BOOL)a3;
- (void)setInvitationToken:(id)a3;
- (void)setIsSourceICS:(BOOL)a3;
- (void)setLocalBundleIDsToDisplayNames:(id)a3;
- (void)setMetadataIndicatedContainer:(id)a3;
- (void)setRegisteredAppBundleIDs:(id)a3;
- (void)setRegisteredDaemonBundleIDs:(id)a3;
- (void)setSelectedAccountID:(id)a3;
- (void)setShareMetadata:(id)a3;
- (void)setShareName:(id)a3;
- (void)setShouldTerminateAfterFetchingMetadata:(BOOL)a3;
- (void)setSingleOONMatch:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTestTargetContainer:(id)a3;
- (void)setUnitTestOverrides:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWebFlowReason:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation ShareAcceptor

- (ShareAcceptor)initWithCloudKitURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ShareAcceptor;
  v5 = [(ShareAcceptor *)&v12 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;

    v8 = objc_alloc_init(RetrievingDialog);
    retrievingDialog = v5->_retrievingDialog;
    v5->_retrievingDialog = v8;

    [(RetrievingDialog *)v5->_retrievingDialog setDelegate:v5];
    v5->_state = 0;
    singleOONMatch = v5->_singleOONMatch;
    v5->_singleOONMatch = 0;
  }
  return v5;
}

- (ShareAcceptor)initWithCloudKitURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  objc_super v12 = [(ShareAcceptor *)self initWithCloudKitURL:a3];
  if (v12)
  {
    v13 = (CKDeviceToDeviceShareInvitationToken *)[v10 copy];
    invitationToken = v12->_invitationToken;
    v12->_invitationToken = v13;

    v12->_isSourceICS = a5;
    if (__sTestOverridesAvailable) {
      objc_storeStrong((id *)&v12->_unitTestOverrides, a6);
    }
  }

  return v12;
}

- (ShareAcceptor)initWithShareMetadata:(id)a3 shareURL:(id)a4
{
  id v7 = a3;
  v8 = [(ShareAcceptor *)self initWithCloudKitURL:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_shareMetadata, a3);
  }

  return v9;
}

- (void)_cancel
{
}

- (BOOL)_shouldShowICloudLoginPrompt:(id)a3
{
  uint64_t v3 = qword_10002A748;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10002A748, &stru_100024730);
  }
  v5 = (void *)qword_10002A750;
  v6 = [v4 CKURLSlug];

  id v7 = [v6 lowercaseString];
  LOBYTE(v5) = [v5 containsObject:v7] ^ 1;

  return (char)v5;
}

- (void)setState:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  int64_t state = v4->_state;
  v4->_int64_t state = a3;
  objc_sync_exit(v4);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    v8 = [(ShareAcceptor *)v4 url];
    v9 = [v8 CKURLThroughSlug];
    id v10 = [(ShareAcceptor *)v4 url];
    id v11 = [v10 CKPathAfterSlug];
    objc_super v12 = (&off_100024A00)[state];
    v13 = (&off_100024A00)[a3];
    int v15 = 138544386;
    v16 = v9;
    __int16 v17 = 2160;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2112;
    v20 = v11;
    __int16 v21 = 2080;
    v22 = v12;
    __int16 v23 = 2080;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Share acceptance for URL: %{public}@%{mask.hash}@, state change [%s] -> [%s]", (uint8_t *)&v15, 0x34u);
  }
  if (![(ShareAcceptor *)v4 shouldShowRetrievingDialogForState:a3])
  {
    v14 = [(ShareAcceptor *)v4 retrievingDialog];
    [v14 abort];
  }
}

- (BOOL)shouldShowRetrievingDialogForState:(int64_t)a3
{
  return ((unint64_t)a3 > 0x18) | (0x5FFu >> a3) & 1;
}

- (BOOL)retrievingDialogShouldDisplay
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(ShareAcceptor *)v2 state];
  objc_sync_exit(v2);

  return [(ShareAcceptor *)v2 shouldShowRetrievingDialogForState:v3];
}

- (void)retrievingDialogCancelled
{
}

- (BOOL)_urlIsAniWorkShareURL:(id)a3
{
  uint64_t v3 = qword_10002A758;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10002A758, &stru_100024750);
  }
  v5 = (void *)qword_10002A760;
  v6 = [v4 CKURLSlug];

  id v7 = [v6 lowercaseString];
  LOBYTE(v5) = [v5 containsObject:v7];

  return (char)v5;
}

- (BOOL)_shouldSendURLToBladeRunner:(id)a3
{
  uint64_t v3 = qword_10002A768;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10002A768, &stru_100024770);
  }
  v5 = (void *)qword_10002A770;
  v6 = [v4 CKURLSlug];

  id v7 = [v6 lowercaseString];
  LOBYTE(v5) = [v5 containsObject:v7];

  return (char)v5;
}

- (BOOL)_shouldSendURLToPhotos:(id)a3
{
  uint64_t v3 = qword_10002A778;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10002A778, &stru_100024790);
  }
  v5 = (void *)qword_10002A780;
  v6 = [v4 CKURLSlug];

  id v7 = [v6 lowercaseString];
  LOBYTE(v5) = [v5 containsObject:v7];

  return (char)v5;
}

- (int64_t)_fallbackFlowICloudAccountSettings:(id *)a3 success:(BOOL *)a4
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v7 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = [(ShareAcceptor *)self fallbackFlowCause];
    *(_DWORD *)buf = 138543362;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fallback flow: User either not logged into iCloud or need to update Apple ID settings, error: %{public}@", buf, 0xCu);
  }
  id v10 = [(ShareAcceptor *)self fallbackFlowCause];
  id v11 = [(ShareAcceptor *)self shareMetadata];
  objc_super v12 = [(ShareAcceptor *)self url];
  v13 = +[CKVettingAlerts alertContentForICloudAccountError:v10 shareMetadata:v11 shareURL:v12];

  buf[0] = 0;
  v14 = [(ShareAcceptor *)self url];
  LODWORD(v11) = [(ShareAcceptor *)self _shouldSendURLToBladeRunner:v14];

  if (v11)
  {
    int v15 = [(ShareAcceptor *)self url];
    v16 = [v15 CKShareURLSlugBasedApplicationName];
    __int16 v17 = [v16 lowercaseString];

    +[CKVettingAlerts showICloudAccountSettingAlert:v13 appName:v17 previewRequested:buf isSourceICS:[(ShareAcceptor *)self isSourceICS]];
  }
  else
  {
    +[CKVettingAlerts showICloudAccountSettingAlert:v13 appName:0 previewRequested:buf isSourceICS:[(ShareAcceptor *)self isSourceICS]];
  }
  if (buf[0])
  {
    *a4 = 1;
    [(ShareAcceptor *)self setWebFlowReason:@"notSignedIn"];
    int64_t v18 = 21;
  }
  else
  {
    *a4 = 0;
    if (a3)
    {
      uint64_t v19 = CKUnderlyingErrorDomain;
      v20 = [(ShareAcceptor *)self fallbackFlowCause];
      __int16 v21 = [(ShareAcceptor *)self url];
      *a3 = +[CKPrettyError errorWithDomain:v19, 9, v20, @"Sign-in or change in iCloud Settings required before sharing URL can be processed: %@", v21 code error format];
    }
    int64_t v18 = 24;
  }

  return v18;
}

- (BOOL)_fallbackFlowWarnNetworkUnavailable:(id *)a3
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fallback flow: User is not connected to the internet", v9, 2u);
  }
  v5 = [(ShareAcceptor *)self url];
  v6 = [v5 CKURLSlug];
  id v7 = +[CKVettingAlerts alertContentDictionaryForDeviceOfflineErrorWithURLSlug:v6];
  +[CKVettingAlerts showFailureAlert:v7 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  return 0;
}

- (BOOL)_fallbackFlowWarnServiceUnavailable:(id *)a3
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fallback flow: Service unavailable", v9, 2u);
  }
  v5 = [(ShareAcceptor *)self url];
  v6 = [v5 CKURLSlug];
  id v7 = +[CKVettingAlerts alertContentDictionaryForServiceUnavailableErrorWithURLSlug:v6];
  +[CKVettingAlerts showFailureAlert:v7 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  return 0;
}

- (BOOL)_fallbackFlowWarnShareUnavailable:(id *)a3
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    id v7 = [(ShareAcceptor *)self fallbackFlowCause];
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fallback flow: Share does not exist or user does not have access, due to: %@", buf, 0xCu);
  }
  v8 = [(ShareAcceptor *)self url];
  v9 = +[CKVettingAlerts alertContentForShareMetadataErrorWithURL:v8];
  +[CKVettingAlerts showFailureAlert:v9 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  if (a3)
  {
    id v10 = [(ShareAcceptor *)self url];
    *a3 = +[CKPrettyError errorWithDomain:CKErrorDomain, 1000, @"Share not available for sharing URL: %@", v10 code format];
  }
  return 0;
}

- (BOOL)_fallbackFlowWebRedirect:(id *)a3
{
  id v4 = [(ShareAcceptor *)self url];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    id v7 = [v4 CKURLThroughSlug];
    v8 = [v4 CKPathAfterSlug];
    *(_DWORD *)buf = 138543874;
    v32 = v7;
    __int16 v33 = 2160;
    uint64_t v34 = 1752392040;
    __int16 v35 = 2112;
    v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Opening the share URL %{public}@%{mask.hash}@ explicilty", buf, 0x20u);
  }
  v9 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:0];
  [v9 setScheme:kCKURLComponentsScheme];
  id v10 = [v9 query];
  id v11 = [(ShareAcceptor *)self webFlowReason];

  if (v11)
  {
    if (v10)
    {
      if ([v10 rangeOfString:@"redirectReason"] != (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_16;
      }
      objc_super v12 = [(ShareAcceptor *)self webFlowReason];
      uint64_t v13 = [v10 stringByAppendingFormat:@"&%@=%@", @"redirectReason", v12];
    }
    else
    {
      objc_super v12 = [(ShareAcceptor *)self webFlowReason];
      uint64_t v13 = +[NSString stringWithFormat:@"%@=%@", @"redirectReason", v12];
    }
    int v15 = v13;
    [v9 setQuery:v13];
    goto LABEL_15;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    int v15 = v14;
    objc_super v12 = [(ShareAcceptor *)self url];
    v16 = [v12 CKURLThroughSlug];
    __int16 v17 = [(ShareAcceptor *)self url];
    int64_t v18 = [v17 CKPathAfterSlug];
    *(_DWORD *)buf = 138543874;
    v32 = v16;
    __int16 v33 = 2160;
    uint64_t v34 = 1752392040;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Web flow invoked for: %{public}@%{mask.hash}@, but reason not set", buf, 0x20u);

LABEL_15:
  }
LABEL_16:
  uint64_t v19 = [v9 URL];

  id v20 = objc_alloc_init((Class)_LSOpenConfiguration);
  [v20 setAllowURLOverrides:0];
  __int16 v21 = +[CKVettingAlerts getLaunchingOptionsFromOptions:0 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
  [v20 setFrontBoardOptions:v21];

  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v22 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    __int16 v23 = v22;
    v24 = [v19 CKURLThroughSlug];
    v25 = [v19 CKPathAfterSlug];
    *(_DWORD *)buf = 138544130;
    v32 = v24;
    __int16 v33 = 2160;
    uint64_t v34 = 1752392040;
    __int16 v35 = 2112;
    v36 = v25;
    __int16 v37 = 2112;
    id v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Sending URL to LaunchServices: %{public}@%{mask.hash}@with config: %@", buf, 0x2Au);
  }
  v26 = +[LSApplicationWorkspace defaultWorkspace];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000050DC;
  v29[3] = &unk_1000247B8;
  id v30 = v19;
  id v27 = v19;
  [v26 openURL:v27 configuration:v20 completionHandler:v29];

  return 0;
}

- (id)_iOSwatchOSHandleMultipleAppStoreCandidates:(id)a3 error:(id *)a4
{
  v6 = [a3 allValues];
  id v7 = [v6 firstObject];

  v8 = [v7 objectForKeyedSubscript:@"URL"];
  v9 = [v7 objectForKeyedSubscript:@"Name"];
  if (v8)
  {
    id v10 = [(ShareAcceptor *)self shareMetadata];
    id v11 = +[CKVettingAlerts alertContentForAppDownload:v9 shareMetadata:v10 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
    [(ShareAcceptor *)self _promptToOpenAppStoreLink:a4 alertOptions:v11 appURL:v8];

    objc_super v12 = 0;
  }
  else
  {
    objc_super v12 = +[CKPrettyError errorWithDomain:CKErrorDomain code:1 format:@"Could not find a URL in the App Store data"];
  }

  return v12;
}

- (BOOL)_fallbackFlowDownloadApp:(id *)a3
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    v8 = [(ShareAcceptor *)self registeredAppBundleIDs];
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fallback flow: none of the registered apps installed: %@. Prompting to opening the AppStore link for one of them", buf, 0xCu);
  }
  v9 = [(ShareAcceptor *)self registeredAppBundleIDs];
  id v22 = 0;
  id v10 = [(ShareAcceptor *)self _findStoreDataForBundleIDs:v9 error:&v22];
  id v11 = v22;

  if (v10)
  {
    if (![v10 count])
    {
      __int16 v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"ShareAcceptor.m" lineNumber:505 description:@"Expected to get non-empty result from _findStoreDataForBundleIDs"];
    }
    if ((unint64_t)[v10 count] < 2)
    {
      v16 = [v10 allValues];
      uint64_t v13 = [v16 firstObject];

      v14 = [v13 objectForKeyedSubscript:@"Name"];
      __int16 v17 = [(ShareAcceptor *)self shareMetadata];
      int64_t v18 = +[CKVettingAlerts alertContentForAppDownload:v14 shareMetadata:v17 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
      uint64_t v19 = [v13 objectForKeyedSubscript:@"URL"];
      BOOL v15 = [(ShareAcceptor *)self _promptToOpenAppStoreLink:a3 alertOptions:v18 appURL:v19];
    }
    else
    {
      uint64_t v12 = [(ShareAcceptor *)self _iOSwatchOSHandleMultipleAppStoreCandidates:v10 error:a3];

      if (!v12)
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
      uint64_t v13 = [(ShareAcceptor *)self shareName];
      v14 = +[CKVettingAlerts alertContentForAppStoreAppLookupFailureWithShareName:v13 error:v12];
      +[CKVettingAlerts showFailureAlert:v14 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
      BOOL v15 = 0;
      id v11 = (id)v12;
    }
  }
  else
  {
    uint64_t v13 = [(ShareAcceptor *)self shareName];
    v14 = +[CKVettingAlerts alertContentForAppStoreAppLookupFailureWithShareName:v13 error:v11];
    +[CKVettingAlerts showFailureAlert:v14 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
    BOOL v15 = 0;
  }

LABEL_14:
  return v15;
}

- (BOOL)_fallbackFlowDownloadAppUpdate:(id *)a3
{
  v6 = [(ShareAcceptor *)self chosenAppBundleID];
  id v7 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  v8 = [(ShareAcceptor *)self chosenAppBundleID];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v10 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    uint64_t v12 = [(ShareAcceptor *)self registeredAppBundleIDs];
    *(_DWORD *)buf = 138412546;
    id v27 = v12;
    __int16 v28 = 2114;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fallback flow: one of the registered apps needs an update: %@. Opening the AppStore link for bundle ID %{public}@", buf, 0x16u);
  }
  v25 = v6;
  uint64_t v13 = +[NSArray arrayWithObjects:&v25 count:1];
  id v24 = 0;
  v14 = [(ShareAcceptor *)self _findStoreDataForBundleIDs:v13 error:&v24];
  id v15 = v24;

  if (v14)
  {
    if (![v14 count])
    {
      __int16 v23 = +[NSAssertionHandler currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"ShareAcceptor.m" lineNumber:546 description:@"Expected to get non-empty result from _findStoreDataForBundleIDs"];
    }
    v16 = [v14 allValues];
    __int16 v17 = [v16 firstObject];

    int64_t v18 = [(ShareAcceptor *)self shareMetadata];
    uint64_t v19 = +[CKVettingAlerts alertContentForAppUpdate:v9 shareMetadata:v18 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
    id v20 = [v17 objectForKeyedSubscript:@"URL"];
    BOOL v21 = [(ShareAcceptor *)self _promptToOpenAppStoreLink:a3 alertOptions:v19 appURL:v20];
  }
  else
  {
    __int16 v17 = [(ShareAcceptor *)self shareName];
    int64_t v18 = +[CKVettingAlerts alertContentForAppStoreUpdateLookupFailureWithShareName:v17 appName:v9 error:v15];
    +[CKVettingAlerts showFailureAlert:v18 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
    BOOL v21 = 1;
  }

  return v21;
}

- (id)_findStoreDataForBundleIDs:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (![v7 count])
  {
    BOOL v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"ShareAcceptor.m" lineNumber:559 description:@"Expected at least one bundle ID when querying App Store data"];
  }
  v8 = [v7 componentsJoinedByString:@","];
  v9 = +[NSString stringWithFormat:@"https://itunes.apple.com/lookup?bundleId=%@", v8];

  id v10 = +[NSURL URLWithString:v9];
  id v11 = +[NSMutableDictionary dictionary];
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_100005CAC;
  v31 = sub_100005CBC;
  id v32 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v13 = +[NSURLSession sharedSession];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005CC4;
  v22[3] = &unk_1000247E0;
  id v14 = v11;
  id v23 = v14;
  id v24 = @"https://itunes.apple.com/app/apple-store/id%@?mt=8";
  v26 = &v27;
  id v15 = v12;
  v25 = v15;
  v16 = [v13 dataTaskWithURL:v10 completionHandler:v22];
  [v16 resume];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if ([v14 count])
  {
    id v17 = v14;
    goto LABEL_12;
  }
  int64_t v18 = (void *)v28[5];
  if (v18)
  {
    if (a4)
    {
      id v19 = v18;
LABEL_10:
      id v17 = 0;
      *a4 = v19;
      goto LABEL_12;
    }
  }
  else if (a4)
  {
    id v19 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain code:1024 userInfo:0];
    goto LABEL_10;
  }
  id v17 = 0;
LABEL_12:

  _Block_object_dispose(&v27, 8);

  return v17;
}

- (BOOL)_promptToOpenAppStoreLink:(id *)a3 alertOptions:(id)a4 appURL:(id)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a4;
  id v9 = a5;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v10 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    dispatch_semaphore_t v12 = [(ShareAcceptor *)self registeredAppBundleIDs];
    *(_DWORD *)buf = 138412290;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fallback flow: prompting the user to go to the app store and obtain/update one of the registered apps %@", buf, 0xCu);
  }
  uint64_t v13 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v8);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v13, 604800.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    CFRelease(v13);
    unsigned __int8 v14 = 1;
    if (!a3)
    {
LABEL_8:
      id v16 = 0;
      goto LABEL_9;
    }
LABEL_7:
    id v15 = [(ShareAcceptor *)self fallbackFlowCause];
    *a3 = v15;

    goto LABEL_8;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  int64_t v18 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Redirecting user to the app store with URL %{public}@", buf, 0xCu);
  }
  id v19 = +[CKVettingAlerts getLaunchingOptionsFromOptions:0 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
  id v20 = +[LSApplicationWorkspace defaultWorkspace];
  id v24 = 0;
  unsigned __int8 v14 = [v20 openURL:v9 withOptions:v19 error:&v24];
  id v16 = v24;

  if ((v14 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    BOOL v21 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      id v22 = v21;
      id v23 = [v9 absoluteString];
      *(_DWORD *)buf = 138543618;
      id v27 = v23;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to open store URL %{public}@ with error %@", buf, 0x16u);
    }
  }

  CFRelease(v13);
  if (a3)
  {
    if (v16)
    {
      id v16 = v16;
      *a3 = v16;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

  return v14;
}

- (int64_t)_checkRepresentativeDataclassEnabled:(id *)a3 appCandidatesPresent:(BOOL)a4
{
  if (!a4) {
    return 22;
  }
  if ([(ShareAcceptor *)self _checkDataclassError:a3])
  {
    v5 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v6 = [v5 mutableCopy];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = (id)TCCAccessCopyBundleIdentifiersDisabledForService();
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 removeObjectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v9);
    }

    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    dispatch_semaphore_t v12 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "After filtering out the apps disabled for kTCCServiceLiverpool, new local apps list is %{public}@", buf, 0xCu);
    }
    if ([v6 count])
    {
      int64_t v13 = 3;
    }
    else
    {
      uint64_t v28 = CKUnderlyingErrorDomain;
      uint64_t v33 = CKErrorDisabledAppLocalizedName;
      id v20 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
      BOOL v21 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
      id v22 = [v21 allKeys];
      id v23 = [v22 firstObject];
      id v24 = [v20 objectForKeyedSubscript:v23];
      uint64_t v34 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v26 = +[CKPrettyError errorWithDomain:v28 code:1023 userInfo:v25 format:@"Could not open an app which is disabled in iCloud settings"];
      [(ShareAcceptor *)self setFallbackFlowCause:v26];

      int64_t v13 = 20;
    }
    [(ShareAcceptor *)self setLocalBundleIDsToDisplayNames:v6];
  }
  else
  {
    uint64_t v14 = CKUnderlyingErrorDomain;
    uint64_t v38 = CKErrorDisabledAppLocalizedName;
    id v6 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v7 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v15 = [v7 allKeys];
    id v16 = [v15 firstObject];
    id v17 = [v6 objectForKeyedSubscript:v16];
    v39 = v17;
    int64_t v18 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v19 = +[CKPrettyError errorWithDomain:v14 code:1023 userInfo:v18 format:@"Could not open an app which is disabled in iCloud settings"];
    [(ShareAcceptor *)self setFallbackFlowCause:v19];

    int64_t v13 = 20;
  }

  return v13;
}

- (id)fetchMetadata
{
  v2 = self;
  if (__sTestOverridesAvailable)
  {
    uint64_t v3 = [(ShareAcceptor *)self testTargetContainer];

    if (v3)
    {
      id v80 = 0;
      id v4 = [(ShareAcceptor *)v2 _fetchShareMetadataForAccountID:0 error:&v80];
      id v5 = v80;
      [(ShareAcceptor *)v2 setShareMetadata:v4];
      goto LABEL_46;
    }
  }
  id v6 = objc_opt_new();
  id v7 = [v6 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
  id v8 = [v6 accountsWithAccountType:v7];
  if ([v8 count])
  {
    v70 = v7;
    v67 = v6;
    id v72 = objc_alloc_init((Class)NSMutableDictionary);
    id v73 = objc_alloc_init((Class)NSMutableDictionary);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v69 = v8;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v76 objects:v83 count:16];
    if (v10)
    {
      id v11 = v10;
      id v71 = 0;
      uint64_t v12 = *(void *)v77;
      uint64_t v13 = kAccountDataclassCKDatabaseService;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v77 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (objc_msgSend(v15, "isProvisionedForDataclass:", v13, v67))
          {
            id v16 = [v15 identifier];
            id v75 = 0;
            id v17 = v2;
            int64_t v18 = [(ShareAcceptor *)v2 _fetchShareMetadataForAccountID:v16 error:&v75];
            id v19 = v75;
            id v20 = v19;
            if (v18)
            {
              [v72 setObject:v18 forKeyedSubscript:v16];
              uint64_t v21 = [v15 username];
              id v22 = (void *)v21;
              if (v21) {
                CFStringRef v23 = (const __CFString *)v21;
              }
              else {
                CFStringRef v23 = @"Unknown User";
              }
              [v73 setObject:v16 forKeyedSubscript:v23];
            }
            else if (v19 && !v71)
            {
              id v71 = v19;
            }

            v2 = v17;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v76 objects:v83 count:16];
      }
      while (v11);
    }
    else
    {
      id v71 = 0;
    }

    if ([v72 count] == (id)1)
    {
      v25 = [v72 allKeys];
      v26 = [v25 firstObject];
      [(ShareAcceptor *)v2 setSelectedAccountID:v26];

      id v27 = [v72 allValues];
      uint64_t v28 = [v27 firstObject];
      [(ShareAcceptor *)v2 setShareMetadata:v28];

      id v29 = 0;
      id v6 = v67;
      id v7 = v70;
    }
    else
    {
      id v7 = v70;
      if ((unint64_t)[v72 count] >= 2)
      {
        long long v30 = +[CKBehaviorOptions sharedOptions];
        if ([v30 isAppleInternalInstall])
        {
          long long v31 = +[CKBehaviorOptions sharedOptions];
          [v31 shareURLToAccountIDSystemAcceptationOverrides];
          uint64_t v33 = v32 = v2;
          id v34 = [v33 count];

          v2 = v32;
          id v8 = v69;
          if (v34)
          {
            __int16 v35 = +[CKBehaviorOptions sharedOptions];
            id v36 = [v35 shareURLToAccountIDSystemAcceptationOverrides];
            __int16 v37 = [(ShareAcceptor *)v32 url];
            uint64_t v38 = [v37 absoluteString];
            v39 = [v36 objectForKey:v38];

            if (![v39 length]
              || ([v72 allKeys],
                  v40 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v41 = [v40 containsObject:v39],
                  v40,
                  !v41))
            {
              v58 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain, 1002, @"Cannot fetch share metadata with the provided override iCloud accountID", v67 code format];
              id v5 = [v58 CKClientSuitableError];

              id v4 = 0;
              id v6 = v68;
LABEL_44:

              goto LABEL_45;
            }
            v2 = v32;
            [(ShareAcceptor *)v32 setSelectedAccountID:v39];
            v42 = [v72 objectForKey:v39];
            [(ShareAcceptor *)v32 setShareMetadata:v42];

            id v29 = 0;
            id v6 = v67;
LABEL_35:
            v43 = [(ShareAcceptor *)v2 selectedAccountID];

            if (v43)
            {
              if (ck_log_initialization_predicate != -1) {
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              v44 = (void *)ck_log_facility_ck;
              if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
              {
                v59 = v44;
                v60 = [(ShareAcceptor *)v2 selectedAccountID];
                *(_DWORD *)buf = 138412290;
                v82 = v60;
                _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Selected account ID is %@", buf, 0xCu);
              }
              v45 = [(ShareAcceptor *)v2 selectedAccountID];
              v46 = [(ShareAcceptor *)v2 shareMetadata];
              [v46 setSelectedAccountID:v45];

              v47 = [(ShareAcceptor *)v2 selectedAccountID];
              v48 = [v6 accountWithIdentifier:v47];
              v49 = [v48 accountPropertyForKey:ACAccountPropertyPersonaIdentifier];

              if (v49) {
                CKAdoptPersonaID();
              }
            }
            id v4 = v29;
            id v5 = v4;
            goto LABEL_44;
          }
        }
        else
        {

          id v8 = v69;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        id v6 = v67;
        v51 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v61 = v51;
          v62 = [v72 allValues];
          [v62 firstObject];
          v64 = v63 = v2;
          v65 = [v64 share];
          v66 = [v65 recordID];
          *(_DWORD *)buf = 138543362;
          v82 = v66;
          _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Multiple logged-in accounts are invited on share %{public}@. Dismissing the retrieving diaglog and prompting the user to choose.", buf, 0xCu);

          v2 = v63;
        }
        v52 = [(ShareAcceptor *)v2 retrievingDialog];
        [v52 abort];

        id v74 = 0;
        v53 = [(ShareAcceptor *)v2 _promptForAccountIDChoiceWithAccountIDsByUsername:v73 error:&v74];
        id v54 = v74;
        v55 = v54;
        if (v53)
        {
          [(ShareAcceptor *)v2 setSelectedAccountID:v53];
          v56 = [v72 objectForKeyedSubscript:v53];
          [(ShareAcceptor *)v2 setShareMetadata:v56];

          id v29 = 0;
        }
        else
        {
          if (!v54)
          {
            v57 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain code:1002 format:@"Cannot fetch share metadata without any chosen iCloud account"];
            v55 = [v57 CKClientSuitableError];
          }
          id v29 = v55;
          v55 = v29;
        }

        goto LABEL_35;
      }
      id v29 = v71;
      id v6 = v67;
    }
    id v8 = v69;
    goto LABEL_35;
  }
  id v24 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain code:1002 format:@"Cannot fetch share metadata without any iCloud account logged in"];
  id v5 = [v24 CKClientSuitableError];

  id v4 = 0;
LABEL_45:

LABEL_46:

  return v5;
}

- (id)_promptForAccountIDChoiceWithAccountIDsByUsername:(id)a3 error:(id *)a4
{
  uint64_t v21 = a4;
  id v22 = a3;
  id v5 = [v22 allKeys];
  v24[0] = kCFUserNotificationAlertHeaderKey;
  id v6 = CKLocalizedString();
  v25[0] = v6;
  v24[1] = kCFUserNotificationAlertMessageKey;
  id v7 = CKLocalizedString();
  v25[1] = v7;
  v24[2] = kCFUserNotificationAlternateButtonTitleKey;
  id v8 = [v5 firstObject];
  v25[2] = v8;
  v24[3] = kCFUserNotificationOtherButtonTitleKey;
  id v9 = [v5 lastObject];
  v25[3] = v9;
  v24[4] = kCFUserNotificationDefaultButtonTitleKey;
  id v10 = CKLocalizedString();
  v25[4] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
  uint64_t v12 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v11 bundleIdentifier:0];

  CFDictionaryRef v13 = +[CKVettingAlerts getAlertOptionsFromOptions:v12 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  uint64_t v14 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v13);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 604800.0, &responseFlags);
  CFOptionFlags v15 = responseFlags & 3;
  if ((responseFlags & 3) != 0)
  {
    if (v15 == 2)
    {
      id v17 = [v5 lastObject];
      id v16 = v22;
    }
    else
    {
      id v16 = v22;
      if (v15 != 1)
      {
        int64_t v18 = +[CKPrettyError errorWithDomain:CKErrorDomain code:1 format:@"Could not create a user notification"];
        id v19 = 0;
        goto LABEL_9;
      }
      id v17 = [v5 firstObject];
    }
    id v19 = [v16 objectForKeyedSubscript:v17, v21];

    int64_t v18 = 0;
  }
  else
  {
    int64_t v18 = +[CKPrettyError errorWithDomain:CKErrorDomain code:20 format:@"User cancelled account selection prompt"];
    id v19 = 0;
    id v16 = v22;
  }
LABEL_9:
  CFRelease(v14);
  if (v21 && v18) {
    *uint64_t v21 = v18;
  }

  return v19;
}

- (id)_fetchShareMetadataForAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100005CAC;
  v49 = sub_100005CBC;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100005CAC;
  v43 = sub_100005CBC;
  id v44 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = objc_alloc((Class)CKFetchShareMetadataOperation);
  id v9 = [(ShareAcceptor *)self url];
  v55 = v9;
  id v10 = +[NSArray arrayWithObjects:&v55 count:1];
  id v11 = [v8 initWithShareURLs:v10];

  uint64_t v12 = [(ShareAcceptor *)self invitationToken];

  if (v12)
  {
    CFDictionaryRef v13 = [(ShareAcceptor *)self url];
    v53 = v13;
    uint64_t v14 = [(ShareAcceptor *)self invitationToken];
    id v54 = v14;
    CFOptionFlags v15 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    [v11 setShareInvitationTokensByShareURL:v15];
  }
  [v11 setOverwriteContainerPCSServiceIfManatee:1];
  id v16 = [v11 resolvedConfiguration];
  [v16 setRequestOriginator:2];

  [v11 setShouldFetchRootRecord:0];
  if (__sTestOverridesAvailable)
  {
    id v17 = [(ShareAcceptor *)self unitTestOverrides];
    BOOL v18 = v17 == 0;

    if (!v18)
    {
      id v19 = [(ShareAcceptor *)self unitTestOverrides];
      [v11 addUnitTestOverrides:v19];
    }
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100007900;
  v38[3] = &unk_100024808;
  v38[4] = &v39;
  [v11 setPerShareMetadataBlock:v38];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100007914;
  v35[3] = &unk_100024830;
  __int16 v37 = &v45;
  id v20 = v7;
  id v36 = v20;
  [v11 setFetchShareMetadataCompletionBlock:v35];
  if (!__sTestOverridesAvailable
    || ([(ShareAcceptor *)self testTargetContainer],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        BOOL v22 = v21 == 0,
        v21,
        v22))
  {
    id v24 = [(ShareAcceptor *)self url];
    unsigned int v25 = [(ShareAcceptor *)self _shouldSendURLToBladeRunner:v24];

    if (v25)
    {
      id v26 = objc_alloc((Class)CKContainerID);
      id v27 = [v26 initWithContainerIdentifier:kCKCloudDocsContainerIdentifier environment:1];
    }
    else
    {
      id v27 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.cloudkit" environment:1];
    }
    uint64_t v28 = v27;
    id v29 = objc_alloc_init((Class)CKContainerOptions);
    id v30 = [objc_alloc((Class)CKAccountOverrideInfo) initWithAccountID:v6];
    [v29 setAccountOverrideInfo:v30];
    if (__sTestOverridesAvailable)
    {
      uint64_t v51 = kCKDisplaysSystemAcceptPromptEntitlementKey;
      v52 = &__kCFBooleanTrue;
      long long v31 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      [v29 setFakeEntitlements:v31];
    }
    id v23 = [objc_alloc((Class)CKContainer) initWithContainerID:v28 options:v29];
  }
  else
  {
    id v23 = [(ShareAcceptor *)self testTargetContainer];
  }
  [v23 addOperation:v11];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    long long v32 = (void *)v46[5];
    if (v32) {
      *a4 = v32;
    }
  }
  id v33 = (id)v40[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v33;
}

- (CKContainer)metadataIndicatedContainer
{
  metadataIndicatedContainer = self->_metadataIndicatedContainer;
  if (!metadataIndicatedContainer)
  {
    id v4 = [(ShareAcceptor *)self selectedAccountID];

    if (v4)
    {
      id v4 = objc_alloc_init((Class)CKContainerOptions);
      id v5 = objc_alloc((Class)CKAccountOverrideInfo);
      id v6 = [(ShareAcceptor *)self selectedAccountID];
      id v7 = [v5 initWithAccountID:v6];

      [v4 setAccountOverrideInfo:v7];
    }
    id v8 = objc_alloc((Class)CKContainer);
    id v9 = [(ShareAcceptor *)self shareMetadata];
    id v10 = [v9 containerID];
    id v11 = (CKContainer *)[v8 initWithContainerID:v10 options:v4];
    uint64_t v12 = self->_metadataIndicatedContainer;
    self->_metadataIndicatedContainer = v11;

    metadataIndicatedContainer = self->_metadataIndicatedContainer;
  }

  return metadataIndicatedContainer;
}

- (BOOL)shareNeedsAcceptance
{
  uint64_t v3 = [(ShareAcceptor *)self shareMetadata];
  if ([v3 participantRole] == (id)1)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(ShareAcceptor *)self shareMetadata];
    BOOL v4 = [v5 participantStatus] != (id)2;
  }
  return v4;
}

- (id)_fetchCurrentUserNameComponents
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100005CAC;
  CFOptionFlags v15 = sub_100005CBC;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(ShareAcceptor *)self metadataIndicatedContainer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007C48;
  v8[3] = &unk_100024858;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  [v4 fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)promptForSingleBundleID
{
  BOOL v4 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  id v5 = [v4 count];

  if (v5 != (id)1)
  {
    uint64_t v51 = +[NSAssertionHandler currentHandler];
    v52 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    [v51 handleFailureInMethod:a2, self, @"ShareAcceptor.m", 920, @"Expected a list with one bundle mapping in it, got this: %@", v52 object file lineNumber description];
  }
  id v6 = [(ShareAcceptor *)self shareMetadata];
  id v7 = [v6 outOfNetworkMatches];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v10 = [v9 allKeys];
    uint64_t v11 = [v10 firstObject];
    [(ShareAcceptor *)self setChosenAppBundleID:v11];

LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_22;
  }
  uint64_t v13 = [(ShareAcceptor *)self currentUserNameComponents];

  if (!v13)
  {
    uint64_t v46 = [(ShareAcceptor *)self _fetchCurrentUserNameComponents];
    if (v46)
    {
      uint64_t v12 = (void *)v46;
      uint64_t v47 = [(ShareAcceptor *)self url];
      v48 = [v47 CKURLSlug];
      v49 = +[CKVettingAlerts alertContentForGenericErrorWithURLSlug:v48];
      +[CKVettingAlerts showFailureAlert:v49 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

      goto LABEL_22;
    }
  }
  uint64_t v14 = [(ShareAcceptor *)self shareMetadata];
  CFOptionFlags v15 = [v14 containerID];
  if ([v15 specialContainerType] == (id)5)
  {
    id v16 = [(ShareAcceptor *)self shareMetadata];
    id v17 = [v16 share];
    BOOL v18 = [v17 objectForKeyedSubscript:CKShareTypeKey];
    unsigned int v19 = [v18 isEqualToString:CKPhotosSharedLibraryShareType];

    if (v19)
    {
      id v20 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
      uint64_t v21 = [v20 allKeys];
      BOOL v22 = [v21 firstObject];
      [(ShareAcceptor *)self setChosenAppBundleID:v22];

      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v23 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Hiding the document open dialog for sharing urls with photos shared library type", buf, 2u);
      }
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v24 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  unsigned int v25 = [v24 allKeys];
  id v26 = [v25 firstObject];

  id v27 = [(ShareAcceptor *)self shareName];
  uint64_t v28 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  id v29 = [v28 allValues];
  id v30 = [v29 firstObject];
  long long v31 = [(ShareAcceptor *)self shareMetadata];
  long long v32 = [(ShareAcceptor *)self currentUserNameComponents];
  id v33 = [(ShareAcceptor *)self currentUserFormattedUsername];
  id v34 = +[CKVettingAlerts alertContentForFirstJoinAlertWithRecordName:v27 appName:v30 bundleID:v26 shareMetadata:v31 currentUserName:v32 currentUserFormattedUsername:v33];

  v54[0] = kCFUserNotificationAlertHeaderKey;
  __int16 v35 = [v34 objectForKeyedSubscript:@"ckVettingAlertTitle"];
  v55[0] = v35;
  v54[1] = kCFUserNotificationAlertMessageKey;
  id v36 = [v34 objectForKeyedSubscript:@"ckVettingAlertBody"];
  v55[1] = v36;
  v54[2] = kCFUserNotificationDefaultButtonTitleKey;
  __int16 v37 = CKLocalizedString();
  v55[2] = v37;
  v54[3] = kCFUserNotificationAlternateButtonTitleKey;
  uint64_t v38 = CKLocalizedString();
  v55[3] = v38;
  uint64_t v39 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
  v40 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v39 bundleIdentifier:v26];

  CFDictionaryRef v41 = +[CKVettingAlerts getAlertOptionsFromOptions:v40 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  v42 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v41);
  *(void *)buf = 0;
  CFUserNotificationReceiveResponse(v42, 604800.0, (CFOptionFlags *)buf);
  if ((buf[0] & 3) != 1)
  {
    if ((buf[0] & 3) != 0)
    {
      uint64_t v12 = +[CKPrettyError errorWithDomain:CKErrorDomain code:1 format:@"Could not create a user notification"];
      goto LABEL_21;
    }
    v43 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v44 = [v43 allKeys];
    uint64_t v45 = [v44 firstObject];
    [(ShareAcceptor *)self setChosenAppBundleID:v45];
  }
  uint64_t v12 = 0;
LABEL_21:
  CFRelease(v42);

LABEL_22:

  return v12;
}

- (BOOL)_getShareName
{
  dispatch_semaphore_t v3 = [(ShareAcceptor *)self shareMetadata];
  BOOL v4 = [v3 share];
  id v5 = [v4 objectForKeyedSubscript:CKShareTitleKey];

  id v6 = [(ShareAcceptor *)self shareMetadata];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 share];
  }
  else
  {
    id v9 = [v6 rootRecord];
    id v10 = [v9 objectForKeyedSubscript:CKShareTitleKey];

    uint64_t v11 = [(ShareAcceptor *)self shareMetadata];
    id v7 = v11;
    if (!v10)
    {
      uint64_t v12 = [v11 share];
      uint64_t v13 = [v12 recordID];
      CFOptionFlags v15 = [v13 recordName];
      [(ShareAcceptor *)self setShareName:v15];

      goto LABEL_6;
    }
    id v8 = [v11 rootRecord];
  }
  uint64_t v12 = v8;
  uint64_t v13 = [v8 objectForKeyedSubscript:CKShareTitleKey];
  [(ShareAcceptor *)self setShareName:v13];
LABEL_6:

  return 1;
}

- (void)_extractEmailAddressesFromProperties:(id)a3 into:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"EmailAddresses"];

  if (v8)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = [v6 objectForKeyedSubscript:@"EmailAddresses"];
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v7 addObject:v14];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(ShareAcceptor *)self _extractEmailAddressesFromProperties:v14 into:v7];
            }
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }
  }
  CFOptionFlags v15 = [v6 objectForKeyedSubscript:@"EmailAddress"];

  if (v15)
  {
    id v16 = [v6 objectForKeyedSubscript:@"EmailAddress"];
    [v7 addObject:v16];
  }
  id v17 = [v6 objectForKeyedSubscript:@"EmailAliases"];

  if (v17)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    BOOL v18 = [v6 objectForKeyedSubscript:@"EmailAliases"];
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        BOOL v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          [(ShareAcceptor *)self _extractEmailAddressesFromProperties:*(void *)(*((void *)&v25 + 1) + 8 * (void)v22) into:v7];
          BOOL v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }
  }
  id v23 = [v6 objectForKeyedSubscript:@"DAAccountEmailAddress"];

  if (v23)
  {
    id v24 = [v6 objectForKeyedSubscript:@"DAAccountEmailAddress"];
    [v7 addObject:v24];
  }
}

- (id)_trySelectingOONParticipant
{
  id v3 = objc_alloc((Class)ACAccountStore);
  BOOL v4 = [(ShareAcceptor *)self chosenAppBundleID];
  id v5 = [v3 initWithEffectiveBundleID:v4];

  id v6 = [v5 allAccountTypes];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100008E60;
  v55[3] = &unk_100024880;
  id v35 = v5;
  id v56 = v35;
  id v36 = [v6 CKFlatMap:v55];

  if ([v36 count])
  {
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    int v54 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_100005CAC;
    v49 = sub_100005CBC;
    id v50 = 0;
    id v7 = +[NSMutableSet set];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = v36;
    id v9 = [v8 countByEnumeratingWithState:&v41 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v42;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v11);
          if ([v12 isEnabledForDataclass:@"com.apple.Dataclass.Mail"])
          {
            uint64_t v13 = [v12 username];

            if (v13)
            {
              uint64_t v14 = [v12 username];
              [v7 addObject:v14];

              if (ck_log_initialization_predicate != -1) {
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              CFOptionFlags v15 = ck_log_facility_ck;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                id v24 = [v12 username];
                *(_DWORD *)buf = 138412290;
                v58 = v24;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Considering username %@ as a vetting candidate", buf, 0xCu);
              }
            }
            id v16 = [v12 ck_accountProperties];

            if (v16)
            {
              id v17 = [v12 accountProperties];
              [(ShareAcceptor *)self _extractEmailAddressesFromProperties:v17 into:v7];

              if (ck_log_initialization_predicate != -1) {
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              BOOL v18 = ck_log_facility_ck;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                long long v25 = [v12 ck_accountProperties];
                *(_DWORD *)buf = 138412546;
                v58 = v25;
                __int16 v59 = 2112;
                v60 = v7;
                _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "After extracting emails from account properties %@ got %@", buf, 0x16u);
              }
            }
            id v19 = [v12 ck_dataclassProperties];
            id v20 = [v19 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];

            if (v20)
            {
              uint64_t v21 = [v12 ck_dataclassProperties];
              BOOL v22 = [v21 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
              [(ShareAcceptor *)self _extractEmailAddressesFromProperties:v22 into:v7];

              if (ck_log_initialization_predicate != -1) {
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              id v23 = ck_log_facility_ck;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                long long v26 = [v12 ck_dataclassProperties];
                long long v27 = [v26 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
                *(_DWORD *)buf = 138412546;
                v58 = v27;
                __int16 v59 = 2112;
                v60 = v7;
                _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "After extracting emails from dataclass properties %@ got %@", buf, 0x16u);
              }
            }
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v41 objects:v61 count:16];
      }
      while (v9);
    }

    long long v28 = [(ShareAcceptor *)self shareMetadata];
    long long v29 = [v28 outOfNetworkMatches];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100008EF0;
    v37[3] = &unk_1000248A8;
    id v30 = v7;
    id v38 = v30;
    uint64_t v39 = &v51;
    v40 = &v45;
    [v29 enumerateObjectsUsingBlock:v37];

    if (*((_DWORD *)v52 + 6) == 1)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      long long v31 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        id v34 = (void *)v46[5];
        *(_DWORD *)buf = 138412290;
        v58 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Found exactly one matching participant for the user's enabled accounts, will use it for vetting: %@", buf, 0xCu);
      }
      id v32 = (id)v46[5];
    }
    else
    {
      id v32 = 0;
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (id)_showVettingAlert
{
  return [(ShareAcceptor *)self _iosShowVettingAlert];
}

- (int64_t)initiateVetting
{
  id v3 = [(ShareAcceptor *)self _trySelectingOONParticipant];
  [(ShareAcceptor *)self setSingleOONMatch:v3];

  BOOL v4 = [(ShareAcceptor *)self singleOONMatch];
  if (v4) {
    int64_t v5 = 13;
  }
  else {
    int64_t v5 = 14;
  }

  return v5;
}

- (BOOL)_initiateVettingOfSingleOONMatch:(id *)a3
{
  int64_t v5 = [(ShareAcceptor *)self singleOONMatch];

  if (!v5)
  {
    id v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"ShareAcceptor.m" lineNumber:1091 description:@"singleOONMatch field is not set"];
  }
  id v6 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  if ([v6 count])
  {
    id v7 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v8 = [v7 allKeys];
    uint64_t v36 = [v8 firstObject];
  }
  else
  {
    id v7 = [(ShareAcceptor *)self registeredAppBundleIDs];
    uint64_t v36 = [v7 firstObject];
  }

  id v9 = [(ShareAcceptor *)self shareName];
  uint64_t v10 = [(ShareAcceptor *)self shareMetadata];
  id v11 = [v10 ownerIdentity];
  uint64_t v12 = [v11 nameComponents];
  uint64_t v13 = [(ShareAcceptor *)self shareMetadata];
  uint64_t v14 = [v13 share];
  CFOptionFlags v15 = [v14 objectForKeyedSubscript:CKShareTypeKey];
  id v16 = (void *)v36;
  CFDictionaryRef v17 = +[CKVettingAlerts alertContentForShortcutVettingBindingPromptWithBundleID:v36 shareName:v9 ownerName:v12 shareType:v15 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  BOOL v18 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v17);
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(v18, 604800.0, responseFlags);
  if ((responseFlags[0] & 3) != 1)
  {
    if ((responseFlags[0] & 3) != 0)
    {
      if (a3)
      {
        *a3 = +[CKPrettyError errorWithDomain:CKErrorDomain code:1 format:@"Could not create a user notification"];
      }
    }
    else
    {
      dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
      id v19 = [(ShareAcceptor *)self singleOONMatch];
      id v20 = [v19 userIdentity];
      uint64_t v21 = [v20 lookupInfo];
      BOOL v22 = [v21 emailAddress];
      id v23 = [(ShareAcceptor *)self singleOONMatch];
      id v24 = [v23 userIdentity];
      long long v25 = [v24 lookupInfo];
      long long v26 = v25;
      if (v22) {
        [v25 emailAddress];
      }
      else {
      id v33 = [v25 phoneNumber];
      }

      uint64_t v41 = 0;
      long long v42 = &v41;
      uint64_t v43 = 0x3032000000;
      long long v44 = sub_100005CAC;
      uint64_t v45 = sub_100005CBC;
      id v46 = 0;
      long long v27 = [(ShareAcceptor *)self singleOONMatch];
      long long v28 = [v27 participantID];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000094E4;
      v37[3] = &unk_100024990;
      void v37[4] = self;
      id v29 = v33;
      id v38 = v29;
      v40 = &v41;
      id v30 = v34;
      uint64_t v39 = v30;
      [(ShareAcceptor *)self _initiateVettingForParticipantID:v28 address:v29 andThen:v37];

      dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
      if (a3) {
        *a3 = (id) v42[5];
      }

      _Block_object_dispose(&v41, 8);
      id v16 = (void *)v36;
    }
  }
  CFRelease(v18);

  return 0;
}

- (BOOL)_requestSelectionFromMultipleOONMatches:(id *)a3
{
  int64_t v5 = [(ShareAcceptor *)self _showVettingAlert];
  id v6 = v5;
  if (v5 && [v5 code] != (id)1)
  {
    id v7 = +[CKVettingAlerts alertContentForGenericInitiateVettingError];
    +[CKVettingAlerts showFailureAlert:v7 isSourceICS:[(ShareAcceptor *)self isSourceICS]];
  }
  if (a3) {
    *a3 = v6;
  }

  return 0;
}

- (id)_iosShowVettingAlert
{
  id v3 = [(ShareAcceptor *)self shareMetadata];
  BOOL v4 = [v3 outOfNetworkMatches];
  id v5 = [v4 count];

  if (!v5)
  {
    __int16 v59 = +[NSAssertionHandler currentHandler];
    v60 = [(ShareAcceptor *)self url];
    [v59 handleFailureInMethod:a2, self, @"ShareAcceptor.m", 1170, @"Vetting initiated for non-OON share, %@", v60 object file lineNumber description];
  }
  v66 = +[NSMutableArray array];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v63 = self;
  id v6 = [(ShareAcceptor *)self shareMetadata];
  id v7 = [v6 outOfNetworkMatches];

  id obj = v7;
  id v67 = [v7 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v81;
    while (2)
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v81 != v65) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v10 = [v9 userIdentity];
        id v11 = [v10 lookupInfo];
        uint64_t v12 = [v11 emailAddress];
        if (v12)
        {
        }
        else
        {
          uint64_t v13 = [v9 userIdentity];
          uint64_t v14 = [v13 lookupInfo];
          CFOptionFlags v15 = [v14 phoneNumber];

          if (!v15)
          {
            uint64_t v41 = CKUnderlyingErrorDomain;
            long long v42 = [v9 userIdentity];
            v40 = [v42 lookupInfo];
            id v43 = +[CKPrettyError errorWithDomain:v41, 8001, @"Got OON participant's lookup info without an email address or phone number: %@", v40 code format];
            goto LABEL_41;
          }
        }
        id v16 = [v9 participantID];
        CFDictionaryRef v17 = [v9 userIdentity];
        BOOL v18 = [v17 lookupInfo];
        id v19 = [v18 emailAddress];
        if (v19)
        {
          id v75 = [v9 userIdentity];
          id v72 = [v75 lookupInfo];
          CFStringRef v20 = [v72 emailAddress];
          v69 = (__CFString *)v20;
        }
        else
        {
          CFStringRef v20 = &stru_100024D18;
        }
        uint64_t v21 = [v9 userIdentity];
        BOOL v22 = [v21 lookupInfo];
        id v23 = [v22 phoneNumber];
        if (v23)
        {
          id v73 = [v9 userIdentity];
          v70 = [v73 lookupInfo];
          v68 = [v70 phoneNumber];
          CFStringRef v24 = v68;
        }
        else
        {
          CFStringRef v24 = &stru_100024D18;
        }
        long long v25 = +[NSString stringWithFormat:@"%@:%@:%@", v16, v20, v24];
        [v66 addObject:v25];

        if (v23)
        {
        }
        if (v19)
        {
        }
      }
      id v67 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
      if (v67) {
        continue;
      }
      break;
    }
  }

  long long v26 = [v66 componentsJoinedByString:@","];
  long long v76 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id obj = v26;
  id v71 = [v26 stringByAddingPercentEncodingWithAllowedCharacters:v76];
  id v74 = [(ShareAcceptor *)v63 shareName];
  long long v27 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  long long v28 = [v74 stringByAddingPercentEncodingWithAllowedCharacters:v27];
  id v29 = [(ShareAcceptor *)v63 shareMetadata];
  id v30 = [v29 share];
  long long v31 = [v30 URL];
  id v32 = [v31 absoluteString];
  id v33 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  dispatch_semaphore_t v34 = [v32 stringByAddingPercentEncodingWithAllowedCharacters:v33];
  id v35 = +[NSString stringWithFormat:@"prefs:root=APPLE_ACCOUNT&aaaction=oonAddressVetting&potentialMatches=%@&sharedItem=%@&shareURL=%@", v71, v28, v34];
  uint64_t v77 = +[NSURL URLWithString:v35];

  uint64_t v36 = [(ShareAcceptor *)v63 localBundleIDsToDisplayNames];
  if ([v36 count])
  {
    [(ShareAcceptor *)v63 localBundleIDsToDisplayNames];
    v38 = __int16 v37 = v63;
    uint64_t v39 = [v38 allKeys];
    v40 = [v39 firstObject];
  }
  else
  {
    [(ShareAcceptor *)v63 registeredAppBundleIDs];
    v38 = __int16 v37 = v63;
    v40 = [v38 firstObject];
  }

  long long v44 = [(ShareAcceptor *)v37 shareName];
  uint64_t v45 = [(ShareAcceptor *)v37 shareMetadata];
  id v46 = [v45 ownerIdentity];
  uint64_t v47 = [v46 nameComponents];
  v48 = [(ShareAcceptor *)v37 shareMetadata];
  v49 = [v48 share];
  id v50 = [v49 objectForKeyedSubscript:CKShareTypeKey];
  CFDictionaryRef v51 = +[CKVettingAlerts alertContentForFullVettingBindingPromptWithBundleID:v40 shareName:v44 ownerName:v47 shareType:v50 isSourceICS:[(ShareAcceptor *)v37 isSourceICS]];

  v52 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v51);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v52, 604800.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    uint64_t v53 = [(ShareAcceptor *)v37 url];
    id v43 = +[CKPrettyError errorWithDomain:CKErrorDomain, 1, @"Share (%@) acceptance cancelled by the user. Email/phone number vetting cancelled.", v53 code format];
    long long v42 = (void *)v77;
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    long long v42 = (void *)v77;
    int v54 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v85 = v77;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Redirecting user to iCloud preferences using URL: %{public}@", buf, 0xCu);
    }
    uint64_t v53 = +[CKVettingAlerts getLaunchingOptionsFromOptions:0 isSourceICS:[(ShareAcceptor *)v63 isSourceICS]];
    v55 = +[LSApplicationWorkspace defaultWorkspace];
    id v78 = 0;
    unsigned __int8 v56 = [v55 openSensitiveURL:v77 withOptions:v53 error:&v78];
    id v43 = v78;

    if ((v56 & 1) == 0)
    {
      if (!v43)
      {
        v61 = +[NSAssertionHandler currentHandler];
        [v61 handleFailureInMethod:a2 object:v63 file:@"ShareAcceptor.m" lineNumber:1214 description:@"openSensitiveURL failed without error"];
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v57 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v85 = (uint64_t)v43;
        _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to open iCloud settings: %@", buf, 0xCu);
      }
    }
  }

  CFRelease(v52);
LABEL_41:

  return v43;
}

- (void)_initiateVettingForParticipantID:(id)a3 address:(id)a4 andThen:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)CKInitiateParticipantVettingOperation);
  uint64_t v12 = [(ShareAcceptor *)self shareMetadata];
  id v13 = [v11 initWithShareMetadata:v12 participantID:v8 address:v9];

  uint64_t v14 = [v13 resolvedConfiguration];
  [v14 setRequestOriginator:2];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_100005CAC;
  v23[4] = sub_100005CBC;
  id v24 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000A218;
  v22[3] = &unk_1000248D0;
  void v22[4] = v23;
  CFOptionFlags v15 = objc_retainBlock(v22);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000A228;
  v19[3] = &unk_1000248F8;
  uint64_t v21 = v23;
  id v16 = v10;
  id v20 = v16;
  CFDictionaryRef v17 = objc_retainBlock(v19);
  BOOL v18 = [(ShareAcceptor *)self metadataIndicatedContainer];
  [v13 retryTimes:2 container:v18 participantVettingInitiatedBlock:v15 participantVettingInitiationCompletionBlock:v17];

  _Block_object_dispose(v23, 8);
}

- (id)_deduplicateBundleToNamesMapping:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 allValues];
  id v5 = +[NSSet setWithArray:v4];
  id v6 = [v5 count];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A38C;
  v9[3] = &unk_100024918;
  BOOL v10 = v6 < [v4 count];
  id v7 = [v3 CKMapKeysAndValues:v9];

  return v7;
}

- (id)chooseFromMultipleBundleIDs
{
  id v3 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  BOOL v4 = [(ShareAcceptor *)self _deduplicateBundleToNamesMapping:v3];

  id v5 = [(ShareAcceptor *)self _iosShowAppSelectionDialogWithTitlesDictionary:v4];

  return v5;
}

- (id)_iosShowAppSelectionDialogWithTitlesDictionary:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = a3;
  id obj = [v20 allValues];
  id v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    BOOL v22 = 0;
    id v5 = 0;
    uint64_t v6 = *(void *)v25;
    id v7 = &CFRelease_ptr;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = objc_alloc((Class)v7[131]);
        id v23 = 0;
        id v11 = [v10 initWithBundleIdentifier:v9 allowPlaceholder:0 error:&v23];
        id v12 = v23;
        if (v11)
        {
          if (!v5
            || ([v11 registrationDate],
                id v13 = v7,
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                id v15 = [v14 compare:v22],
                v14,
                id v7 = v13,
                v15 == (id)1))
          {
            id v16 = v9;

            uint64_t v17 = [v11 registrationDate];

            BOOL v22 = (void *)v17;
            id v5 = v16;
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    BOOL v22 = 0;
    id v5 = 0;
  }

  [(ShareAcceptor *)self setChosenAppBundleID:v5];
  return 0;
}

- (BOOL)_validateShareURL:(id *)a3
{
  id v4 = [(ShareAcceptor *)self url];

  if (!v4)
  {
    id v5 = +[CKPrettyError errorWithDomain:CKErrorDomain code:12 format:@"Asked to accept a nil url"];
    [(ShareAcceptor *)self setFallbackFlowCause:v5];

    [(ShareAcceptor *)self setState:17];
  }
  return 1;
}

- (BOOL)_notifyBladeRunner:(id *)a3
{
  id v4 = [(ShareAcceptor *)self url];
  unsigned int v5 = [(ShareAcceptor *)self _shouldSendURLToBladeRunner:v4];

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.bird" options:0];
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKXPCShareDaemon];
    [v6 setRemoteObjectInterface:v7];

    [v6 resume];
    id v8 = [v6 remoteObjectProxy];
    id v9 = [(ShareAcceptor *)self url];
    [v8 willAcceptShareAtURL:v9];
  }
  return 1;
}

- (BOOL)_fetchMetadata:(id *)a3
{
  id v4 = [(ShareAcceptor *)self shareMetadata];

  if (v4) {
    return 1;
  }
  unsigned int v5 = [(ShareAcceptor *)self fetchMetadata];
  if (v5)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v6 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      id v8 = [(ShareAcceptor *)self shareMetadata];
      *(_DWORD *)v48 = 138543618;
      *(void *)&v48[4] = v8;
      *(_WORD *)&v48[12] = 2112;
      *(void *)&v48[14] = v5;
      id v9 = "Received share metadata %{public}@, error %@";
      id v10 = v7;
      uint32_t v11 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, v48, v11);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v12 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v7 = v12;
      id v8 = [(ShareAcceptor *)self shareMetadata];
      *(_DWORD *)v48 = 138543362;
      *(void *)&v48[4] = v8;
      id v9 = "Received share metadata %{public}@";
      id v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_11;
    }
  }
  id v13 = [(ShareAcceptor *)self shareMetadata];

  if (v13) {
    goto LABEL_58;
  }
  uint64_t v14 = [v5 domain];
  if ([v14 isEqualToString:CKErrorDomain])
  {
    id v15 = [v5 code];

    if (v15 != (id)2) {
      goto LABEL_17;
    }
    uint64_t v14 = [v5 userInfo];
    id v16 = [v14 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
    uint64_t v17 = [(ShareAcceptor *)self url];
    uint64_t v18 = [v16 objectForKeyedSubscript:v17];

    unsigned int v5 = (void *)v18;
  }

LABEL_17:
  id v19 = [v5 domain];
  if ([v19 isEqualToString:CKErrorDomain])
  {
    if ([v5 code] == (id)9)
    {

LABEL_22:
      uint64_t v21 = [(ShareAcceptor *)self url];
      unsigned int v22 = [(ShareAcceptor *)self _shouldShowICloudLoginPrompt:v21];

      if (v22)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        id v23 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          long long v24 = v23;
          long long v25 = [(ShareAcceptor *)self url];
          long long v26 = [v25 CKURLThroughSlug];
          long long v27 = [(ShareAcceptor *)self url];
          long long v28 = [v27 CKPathAfterSlug];
          *(_DWORD *)v48 = 138543874;
          *(void *)&v48[4] = v26;
          *(_WORD *)&v48[12] = 2160;
          *(void *)&v48[14] = 1752392040;
          *(_WORD *)&v48[22] = 2112;
          v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Got unauthenticated response when fetching share metadata for URL %{public}@%{mask.hash}@, showing login prompt", v48, 0x20u);
        }
        goto LABEL_52;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v38 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = v38;
        v40 = [(ShareAcceptor *)self url];
        uint64_t v41 = [v40 CKURLThroughSlug];
        long long v42 = [(ShareAcceptor *)self url];
        id v43 = [v42 CKPathAfterSlug];
        *(_DWORD *)v48 = 138543874;
        *(void *)&v48[4] = v41;
        *(_WORD *)&v48[12] = 2160;
        *(void *)&v48[14] = 1752392040;
        *(_WORD *)&v48[22] = 2112;
        v49 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Got unauthenticated response when fetching share metadata for URL %{public}@%{mask.hash}@, forwarding to web", v48, 0x20u);
      }
      [(ShareAcceptor *)self setFallbackFlowCause:v5];
      [(ShareAcceptor *)self setWebFlowReason:@"notSignedIn"];
      goto LABEL_48;
    }
    id v20 = [v5 code];

    if (v20 == (id)115) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  id v29 = [v5 domain];
  if (![v29 isEqualToString:CKErrorDomain])
  {

LABEL_31:
    id v32 = [v5 domain];
    if ([v32 isEqualToString:CKErrorDomain])
    {
      if ([v5 code] == (id)3)
      {

LABEL_54:
        [(ShareAcceptor *)self setFallbackFlowCause:v5];
        uint64_t v31 = 18;
        goto LABEL_57;
      }
      id v46 = [v5 code];

      if (v46 == (id)4) {
        goto LABEL_54;
      }
    }
    else
    {
    }
    id v33 = [v5 domain];
    if ([v33 isEqualToString:CKErrorDomain] && objc_msgSend(v5, "code") == (id)12)
    {
      dispatch_semaphore_t v34 = [(ShareAcceptor *)self url];
      unsigned int v35 = [(ShareAcceptor *)self _urlIsALegacyiWorkShareURL:v34];

      if (v35)
      {
        [(ShareAcceptor *)self setFallbackFlowCause:v5];
LABEL_48:
        uint64_t v31 = 21;
        goto LABEL_57;
      }
    }
    else
    {
    }
    uint64_t v36 = [v5 domain];
    if ([v36 isEqualToString:CKErrorDomain])
    {
      id v37 = [v5 code];

      if (v37 == (id)20)
      {
        [(ShareAcceptor *)self setFallbackFlowCause:0];
        uint64_t v31 = 24;
        goto LABEL_57;
      }
    }
    else
    {
    }
    long long v44 = [v5 domain];
    if ([v44 isEqualToString:CKErrorDomain])
    {
      id v45 = [v5 code];

      if (v45 == (id)110)
      {
LABEL_52:
        [(ShareAcceptor *)self setFallbackFlowCause:v5];
        uint64_t v31 = 20;
        goto LABEL_57;
      }
    }
    else
    {
    }
    [(ShareAcceptor *)self setFallbackFlowCause:v5];
    uint64_t v31 = 17;
    goto LABEL_57;
  }
  id v30 = [v5 code];

  if (v30 != (id)6) {
    goto LABEL_31;
  }
  [(ShareAcceptor *)self setFallbackFlowCause:v5];
  uint64_t v31 = 19;
LABEL_57:
  [(ShareAcceptor *)self setState:v31];
LABEL_58:
  if (__sTestOverridesAvailable
    && [(ShareAcceptor *)self shouldTerminateAfterFetchingMetadata])
  {
    [(ShareAcceptor *)self setState:24];
  }

  return 1;
}

- (BOOL)_urlIsALegacyiWorkShareURL:(id)a3
{
  id v4 = a3;
  if ([(ShareAcceptor *)self _urlIsAniWorkShareURL:v4]) {
    BOOL v5 = [(ShareAcceptor *)self _urlHasALongToken:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_urlHasALongToken:(id)a3
{
  id v3 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = v4;
    id v6 = [v3 CKURLThroughSlug];
    id v7 = [v3 CKPathAfterSlug];
    int v25 = 138543874;
    id v26 = v6;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Verifying token length for URL %{public}@%{mask.hash}@", (uint8_t *)&v25, 0x20u);
  }
  id v8 = [objc_alloc((Class)NSURLComponents) initWithURL:v3 resolvingAgainstBaseURL:0];
  id v9 = [v8 path];
  id v10 = [v9 lastPathComponent];

  if ((unint64_t)[v10 length] > 3)
  {
    id v16 = [v10 substringFromIndex:3];
    uint64_t v17 = +[NSData CKDataFromBase64URLSafeString:v16];
    id v18 = [v17 length];
    BOOL v15 = (unint64_t)v18 > 0x10;
    if ((unint64_t)v18 >= 0x11)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v19 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = v19;
        id v22 = [v17 length];
        id v23 = [v3 CKURLThroughSlug];
        long long v24 = [v3 CKPathAfterSlug];
        int v25 = 134218754;
        id v26 = v22;
        __int16 v27 = 2114;
        uint64_t v28 = (uint64_t)v23;
        __int16 v29 = 2160;
        uint64_t v30 = 1752392040;
        __int16 v31 = 2112;
        id v32 = v24;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Found shortSharingTokenData of length (%lu) for the URL %{public}@%{mask.hash}@. Forwarding to the web", (uint8_t *)&v25, 0x2Au);
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint32_t v11 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      id v13 = [v3 CKURLThroughSlug];
      uint64_t v14 = [v3 CKPathAfterSlug];
      int v25 = 138543874;
      id v26 = v13;
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Warn: Couldn't get a short token for the URL %{public}@%{mask.hash}@", (uint8_t *)&v25, 0x20u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_lookUpRegisteredBundleIDs:(id *)a3
{
  id v6 = [(ShareAcceptor *)self url];
  unsigned int v7 = [(ShareAcceptor *)self _shouldSendURLToBladeRunner:v6];

  if (v7)
  {
    id v8 = [(ShareAcceptor *)self shareMetadata];
    id v9 = [v8 outOfNetworkMatches];
    id v10 = [v9 count];

    if (v10)
    {
      uint32_t v11 = [(ShareAcceptor *)self url];
      id v12 = [v11 CKBladerunnerShareURLSlugBasedApplicationBundleID];

      if (!v12)
      {
        uint64_t v30 = +[NSAssertionHandler currentHandler];
        __int16 v31 = [(ShareAcceptor *)self url];
        [v30 handleFailureInMethod:a2, self, @"ShareAcceptor.m", 1559, @"Got nil bundle id for URL: %@", v31 object file lineNumber description];
      }
      long long v44 = v12;
      id v13 = +[NSArray arrayWithObjects:&v44 count:1];
      [(ShareAcceptor *)self setRegisteredAppBundleIDs:v13];
    }
    else
    {
      CFStringRef v45 = @"com.apple.bird";
      id v12 = +[NSArray arrayWithObjects:&v45 count:1];
      [(ShareAcceptor *)self setRegisteredDaemonBundleIDs:v12];
    }

    long long v24 = [(ShareAcceptor *)self url];
    unsigned int v25 = [(ShareAcceptor *)self _urlIsAniWorkShareURL:v24];

    if (v25)
    {
      id v26 = [(ShareAcceptor *)self url];
      __int16 v27 = [(ShareAcceptor *)self shareMetadata];
      uint64_t v28 = [v27 share];
      [v28 setMutableURL:v26];
    }
    return 1;
  }
  uint64_t v14 = [(ShareAcceptor *)self url];
  unsigned int v15 = [(ShareAcceptor *)self _shouldSendURLToPhotos:v14];

  if (v15)
  {
    CFStringRef v43 = @"com.apple.mobileslideshow";
    id v16 = +[NSArray arrayWithObjects:&v43 count:1];
    [(ShareAcceptor *)self setRegisteredAppBundleIDs:v16];

    return 1;
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100005CAC;
  uint64_t v41 = sub_100005CBC;
  id v42 = 0;
  objc_initWeak(&location, self);
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  id v18 = objc_opt_new();
  id v19 = [v18 resolvedConfiguration];
  [v19 setRequestOriginator:2];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000B6D8;
  v32[3] = &unk_100024940;
  objc_copyWeak(&v35, &location);
  dispatch_semaphore_t v34 = &v37;
  id v20 = v17;
  id v33 = v20;
  [v18 setFetchRegisteredBundleIDsCompletionBlock:v32];
  uint64_t v21 = [(ShareAcceptor *)self metadataIndicatedContainer];
  [v21 addOperation:v18];

  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  id v22 = (void *)v38[5];
  BOOL v23 = v22 == 0;
  if (a3 && v22) {
    *a3 = v22;
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);

  return v23;
}

- (BOOL)_handleAppleInternalDaemon:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(ShareAcceptor *)self setState:24];
  if (v9)
  {
    if (a5) {
      *a5 = v9;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v10 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Daemon %{public}@ handled the share successfully, terminating", (uint8_t *)&v12, 0xCu);
    }
  }

  return v9 == 0;
}

- (BOOL)_handlePotentialAppleInternalDaemon:(id *)a3
{
  uint64_t v4 = [(ShareAcceptor *)self registeredDaemonBundleIDs];

  if (v4)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(ShareAcceptor *)self registeredDaemonBundleIDs];
    id v34 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v44;
      *(void *)&long long v5 = 138544130;
      long long v30 = v5;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(obj);
          }
          unsigned int v7 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v6);
          if (ck_log_initialization_predicate != -1) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          id v8 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            id v9 = v8;
            id v10 = [(ShareAcceptor *)self url];
            uint32_t v11 = [v10 CKURLThroughSlug];
            int v12 = [(ShareAcceptor *)self url];
            id v13 = [v12 CKPathAfterSlug];
            *(_DWORD *)buf = v30;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v11;
            *(_WORD *)&buf[22] = 2160;
            uint64_t v50 = 1752392040;
            LOWORD(v51) = 2112;
            *(void *)((char *)&v51 + 2) = v13;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Trying to call daemon %{public}@ for sharing URL %{public}@%{mask.hash}@", buf, 0x2Au);
          }
          id v14 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v7 options:0];
          unsigned int v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKXPCShareDaemon];
          [v14 setRemoteObjectInterface:v15];

          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10000C120;
          v42[3] = &unk_100024670;
          v42[4] = v7;
          [v14 setInvalidationHandler:v42];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10000C1F8;
          v41[3] = &unk_100024670;
          v41[4] = v7;
          [v14 setInterruptionHandler:v41];
          [v14 resume];
          dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          uint64_t v50 = (uint64_t)sub_100005CAC;
          *(void *)&long long v51 = sub_100005CBC;
          *((void *)&v51 + 1) = 0;
          if ([v7 isEqualToString:@"com.apple.bird"]) {
            [(ShareAcceptor *)self setState:9];
          }
          if (ck_log_initialization_predicate != -1) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          dispatch_semaphore_t v17 = ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v47 = 138543362;
            id v48 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Invoking request on xpcconnection %{public}@", v47, 0xCu);
          }
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10000C2D0;
          v38[3] = &unk_100024968;
          v38[4] = v7;
          v40 = buf;
          id v18 = v16;
          uint64_t v39 = v18;
          id v19 = [v14 remoteObjectProxyWithErrorHandler:v38];
          id v20 = [(ShareAcceptor *)self shareMetadata];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10000C3EC;
          v35[3] = &unk_100024990;
          uint64_t v37 = buf;
          void v35[4] = v7;
          v35[5] = self;
          uint64_t v21 = v18;
          uint64_t v36 = v21;
          [v19 handleCloudKitShareMetadata:v20 completionHandler:v35];

          dispatch_time_t v22 = dispatch_time(0, 200000000);
          intptr_t v23 = dispatch_semaphore_wait(v21, v22);
          uint64_t v24 = *(void *)(*(void *)&buf[8] + 40);
          if (!v23) {
            goto LABEL_31;
          }
          if (!v24)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            unsigned int v25 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t v47 = 138543362;
              id v48 = v7;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Daemon %{public}@ seems to have started handling handleCloudKitShareMetadata call. Adjusting state to make sure 'Retrieving...' dialog doesn't show up/gets dismissed", v47, 0xCu);
            }
            -[ShareAcceptor setState:](self, "setState:", 9, v30);
          }
          dispatch_time_t v26 = dispatch_time(0, 60000000000);
          if (!dispatch_semaphore_wait(v21, v26))
          {
            uint64_t v24 = *(void *)(*(void *)&buf[8] + 40);
LABEL_31:
            LOBYTE(v4) = -[ShareAcceptor _handleAppleInternalDaemon:response:error:](self, "_handleAppleInternalDaemon:response:error:", v7, v24, a3, v30);
            int v28 = 0;
            goto LABEL_32;
          }
          if (ck_log_initialization_predicate != -1) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          __int16 v27 = ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v47 = 138543362;
            id v48 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Timed out waiting for daemon to handle share; soldiering on. %{public}@",
              v47,
              0xCu);
          }
          int v28 = 1;
LABEL_32:

          _Block_object_dispose(buf, 8);
          if (!v28) {
            goto LABEL_36;
          }
          id v6 = (char *)v6 + 1;
        }
        while (v34 != v6);
        id v34 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v34);
    }
    LOBYTE(v4) = 1;
LABEL_36:
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4 & 1;
}

- (int64_t)_lookUpLocalBundleIDs:(id *)a3 success:(BOOL *)a4
{
  unsigned int v7 = [(ShareAcceptor *)self registeredAppBundleIDs];

  if (v7)
  {
    id v8 = [(ShareAcceptor *)self registeredAppBundleIDs];
    id v9 = CKSelectLocalAppNamesByBundleIDs();

    [(ShareAcceptor *)self setLocalBundleIDsToDisplayNames:v9];
    *a4 = 1;

    return 10;
  }
  else
  {
    if (a3)
    {
      uint64_t v11 = CKUnderlyingErrorDomain;
      int v12 = [(ShareAcceptor *)self url];
      *a3 = +[CKPrettyError errorWithDomain:v11, 1000, @"No registered bundle IDs exist for share URL: %@", v12 code format];
    }
    *a4 = 0;
    return 24;
  }
}

- (BOOL)_promptAppSelection:(id *)a3
{
  id v6 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
  id v7 = [v6 count];

  if (!v7)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    uint64_t v21 = [(ShareAcceptor *)self url];
    [v20 handleFailureInMethod:a2, self, @"ShareAcceptor.m", 1720, @"Got round to prompting for app selection, but no apps present. Share URL: %@", v21 object file lineNumber description];
  }
  if ([(ShareAcceptor *)self shareNeedsAcceptance]
    || ([(ShareAcceptor *)self localBundleIDsToDisplayNames],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        (unint64_t)v9 >= 2))
  {
    id v10 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v11 = [v10 count];

    if (v11 == (id)1) {
      [(ShareAcceptor *)self promptForSingleBundleID];
    }
    else {
    id v12 = [(ShareAcceptor *)self chooseFromMultipleBundleIDs];
    }
  }
  else
  {
    id v13 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
    id v14 = [v13 allKeys];
    unsigned int v15 = [v14 firstObject];
    [(ShareAcceptor *)self setChosenAppBundleID:v15];

    id v12 = 0;
  }
  dispatch_semaphore_t v16 = [(ShareAcceptor *)self chosenAppBundleID];

  if (!v16)
  {
    if (!v12)
    {
      uint64_t v17 = CKUnderlyingErrorDomain;
      id v18 = [(ShareAcceptor *)self url];
      id v12 = +[CKPrettyError errorWithDomain:v17, 1000, @"No app selected (likely cancellation). While handling sharing URL: %@", v18 code format];
    }
    if (a3)
    {
      id v12 = v12;
      *a3 = v12;
    }
  }

  return v16 != 0;
}

- (BOOL)_authenticateUsers:(id *)a3
{
  uint64_t v5 = [(ShareAcceptor *)self chosenAppBundleID];
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned int v7 = [(ShareAcceptor *)self shareNeedsAcceptance];

    if (v7)
    {
      id v8 = [(ShareAcceptor *)self chosenAppBundleID];
      id v9 = +[APApplication applicationWithBundleIdentifier:v8];

      if (!v9)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        id v14 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to initialize App Protection Subject for some reason. Skipping authentication.", buf, 2u);
        }
        LOBYTE(v11) = 1;
        goto LABEL_18;
      }
      id v10 = +[APGuard sharedGuard];
      id v18 = 0;
      unsigned int v11 = [v10 authenticateSyncForSubject:v9 error:&v18];
      id v12 = v18;

      if (v11 && !v12) {
        goto LABEL_9;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v13 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        dispatch_semaphore_t v16 = v13;
        uint64_t v17 = [(ShareAcceptor *)self chosenAppBundleID];
        *(_DWORD *)buf = 138412546;
        id v20 = v17;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Failed to authenticate user for bundle %@. Error: %@", buf, 0x16u);

        if (!a3) {
          goto LABEL_11;
        }
      }
      else
      {
LABEL_9:
        if (!a3)
        {
LABEL_11:

LABEL_18:
          return v11;
        }
      }
      *a3 = v12;
      goto LABEL_11;
    }
  }
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)_verifySelectedApp:(id *)a3
{
  uint64_t v4 = [(ShareAcceptor *)self chosenAppBundleID];
  id v20 = 0;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v20];
  id v6 = v20;
  if (v6)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    unsigned int v7 = ck_log_facility_ck;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    id v8 = "Failed to initialize LSApplicationRecord for selected app verification with bundle id %@.";
  }
  else
  {
    if (v5)
    {
      id v9 = [v5 infoDictionary];

      if (v9)
      {
        id v10 = [v5 infoDictionary];
        unsigned int v11 = [v10 objectForKey:@"CKSharingSupported" ofClass:objc_opt_class()];
        unsigned __int8 v12 = [v11 BOOLValue];

        if (v12) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    unsigned int v7 = ck_log_facility_ck;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    id v8 = "LSApplicationRecord with bundle id %@ is nil or has no infoDictionary.";
  }
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
LABEL_15:
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
LABEL_17:
  id v13 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    unsigned int v15 = [(ShareAcceptor *)self chosenAppBundleID];
    *(_DWORD *)buf = 138543362;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "User needs to update app %{public}@ to a version that supports sharing", buf, 0xCu);
  }
  [(ShareAcceptor *)self setState:23];
  uint64_t v16 = CKUnderlyingErrorDomain;
  uint64_t v17 = [(ShareAcceptor *)self url];
  id v18 = +[CKPrettyError errorWithDomain:v16, 1000, @"Selected app doesn't support sharing: %@. Share URL %@", v4, v17 code format];
  [(ShareAcceptor *)self setFallbackFlowCause:v18];

LABEL_20:
  return 1;
}

- (BOOL)_checkDataclassError:(id *)a3
{
  id v5 = [(ShareAcceptor *)self metadataIndicatedContainer];
  id v6 = [v5 containerID];
  id v7 = [v6 specialContainerType];

  if (v7 == (id)5) {
    return 1;
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100005CAC;
  unsigned int v25 = sub_100005CBC;
  id v26 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v10 = [(ShareAcceptor *)self metadataIndicatedContainer];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D0C8;
  v13[3] = &unk_1000249B8;
  unsigned int v15 = &v21;
  uint64_t v16 = &v17;
  unsigned int v11 = v9;
  id v14 = v11;
  [v10 representativeDataclassEnabledWithCompletionHandler:v13];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a3 && v22[5])
  {
    *a3 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain code:1000 format:@"Error while querying if our dataclass is enabled"];
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

- (int64_t)_handlePotentialOONMatches
{
  id v3 = [(ShareAcceptor *)self shareMetadata];
  uint64_t v4 = [v3 outOfNetworkMatches];
  id v5 = [v4 count];

  if (!v5) {
    return 15;
  }

  return [(ShareAcceptor *)self initiateVetting];
}

- (BOOL)_launchApp:(id *)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100005CAC;
  uint64_t v24 = sub_100005CBC;
  id v25 = 0;
  id v5 = [(ShareAcceptor *)self shareMetadata];
  id v6 = +[UIHandleCloudKitShareAction cloudKitShareActionWithShareMetadata:v5];

  uint64_t v27 = FBSOpenApplicationOptionKeyActions;
  id v26 = v6;
  id v7 = +[NSArray arrayWithObjects:&v26 count:1];
  int v28 = v7;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

  dispatch_semaphore_t v9 = +[CKVettingAlerts getLaunchingOptionsFromOptions:v8 isSourceICS:[(ShareAcceptor *)self isSourceICS]];

  id v10 = +[FBSOpenApplicationOptions optionsWithDictionary:v9];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  unsigned __int8 v12 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  id v13 = [(ShareAcceptor *)self chosenAppBundleID];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D468;
  v17[3] = &unk_1000249E0;
  uint64_t v19 = &v20;
  id v14 = v11;
  id v18 = v14;
  [v12 openApplication:v13 withOptions:v10 completion:v17];

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  unsigned int v15 = (void *)v21[5];
  if (a3 && v15) {
    *a3 = v15;
  }

  _Block_object_dispose(&v20, 8);
  return v15 == 0;
}

- (BOOL)makeStateTransition:(id *)a3
{
  BOOL v27 = 1;
  switch([(ShareAcceptor *)self state])
  {
    case 0:
      [(ShareAcceptor *)self setState:1];
      return [(ShareAcceptor *)self _validateShareURL:a3];
    case 1:
      [(ShareAcceptor *)self setState:2];
      return [(ShareAcceptor *)self _notifyBladeRunner:a3];
    case 2:
      [(ShareAcceptor *)self setState:4];
      BOOL v27 = [(ShareAcceptor *)self _fetchMetadata:a3];
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v6 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO)) {
        return v27;
      }
      id v7 = v6;
      BOOL v8 = [(ShareAcceptor *)self shareMetadata];
      dispatch_semaphore_t v9 = [(ShareAcceptor *)self url];
      id v10 = [v9 CKURLThroughSlug];
      dispatch_semaphore_t v11 = [(ShareAcceptor *)self url];
      unsigned __int8 v12 = [v11 CKPathAfterSlug];
      *(_DWORD *)buf = 138413058;
      __int16 v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v10;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v12;
      id v13 = "Share metadata %@ ready, for sharing URL: %{public}@%{mask.hash}@";
      goto LABEL_26;
    case 3:
      [(ShareAcceptor *)self setState:11];
      BOOL v27 = [(ShareAcceptor *)self _promptAppSelection:a3];
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v14 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO)) {
        return v27;
      }
      id v7 = v14;
      BOOL v8 = [(ShareAcceptor *)self chosenAppBundleID];
      dispatch_semaphore_t v9 = [(ShareAcceptor *)self url];
      id v10 = [v9 CKURLThroughSlug];
      dispatch_semaphore_t v11 = [(ShareAcceptor *)self url];
      unsigned __int8 v12 = [v11 CKPathAfterSlug];
      *(_DWORD *)buf = 138544130;
      __int16 v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v10;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v12;
      id v13 = "User wants to open share in app %{public}@, for sharing URL: %{public}@%{mask.hash}@";
      goto LABEL_26;
    case 4:
      [(ShareAcceptor *)self setState:5];
      BOOL v27 = [(ShareAcceptor *)self _getShareName];
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      unsigned int v15 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO)) {
        return v27;
      }
      id v7 = v15;
      uint64_t v16 = [(ShareAcceptor *)self shareName];
      *(_DWORD *)buf = 138412290;
      __int16 v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Share name: %@", buf, 0xCu);

      goto LABEL_28;
    case 5:
      [(ShareAcceptor *)self setState:6];
      BOOL v27 = [(ShareAcceptor *)self _lookUpRegisteredBundleIDs:a3];
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v17 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO)) {
        return v27;
      }
      id v7 = v17;
      BOOL v8 = [(ShareAcceptor *)self registeredAppBundleIDs];
      dispatch_semaphore_t v9 = [(ShareAcceptor *)self registeredDaemonBundleIDs];
      id v10 = [(ShareAcceptor *)self url];
      id v18 = [v10 CKURLThroughSlug];
      uint64_t v19 = [(ShareAcceptor *)self url];
      uint64_t v20 = [v19 CKPathAfterSlug];
      *(_DWORD *)buf = 138413314;
      __int16 v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v9;
      __int16 v32 = 2114;
      uint64_t v33 = (uint64_t)v18;
      __int16 v34 = 2160;
      uint64_t v35 = 1752392040;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registered bundle IDs fetched: apps: %@ / daemons: %{public}@, for sharing URL: %{public}@%{mask.hash}@", buf, 0x34u);

      goto LABEL_27;
    case 6:
      [(ShareAcceptor *)self setState:8];
      return [(ShareAcceptor *)self _handlePotentialAppleInternalDaemon:a3];
    case 7:
      [(ShareAcceptor *)self setState:16];
      return [(ShareAcceptor *)self _launchApp:a3];
    case 8:
      [(ShareAcceptor *)self setState:[(ShareAcceptor *)self _lookUpLocalBundleIDs:a3 success:&v27]];
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v21 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO)) {
        return v27;
      }
      id v7 = v21;
      BOOL v8 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
      dispatch_semaphore_t v9 = [(ShareAcceptor *)self url];
      id v10 = [v9 CKURLThroughSlug];
      dispatch_semaphore_t v11 = [(ShareAcceptor *)self url];
      unsigned __int8 v12 = [v11 CKPathAfterSlug];
      *(_DWORD *)buf = 138544130;
      __int16 v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v10;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v12;
      id v13 = "Local bundle IDs found: %{public}@, for sharing URL: %{public}@%{mask.hash}@";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v13, buf, 0x2Au);

LABEL_27:
LABEL_28:

      return v27;
    case 9:
    case 0x10:
      goto LABEL_45;
    case 0xALL:
      [(ShareAcceptor *)self setState:[(ShareAcceptor *)self _handlePotentialOONMatches]];
      return 1;
    case 0xBLL:
      [(ShareAcceptor *)self setState:12];
      return [(ShareAcceptor *)self _verifySelectedApp:a3];
    case 0xCLL:
      [(ShareAcceptor *)self setState:7];
      return [(ShareAcceptor *)self _authenticateUsers:a3];
    case 0xDLL:
      [(ShareAcceptor *)self setState:24];
      return [(ShareAcceptor *)self _initiateVettingOfSingleOONMatch:a3];
    case 0xELL:
      [(ShareAcceptor *)self setState:24];
      return [(ShareAcceptor *)self _requestSelectionFromMultipleOONMatches:a3];
    case 0xFLL:
      uint64_t v22 = [(ShareAcceptor *)self localBundleIDsToDisplayNames];
      -[ShareAcceptor setState:](self, "setState:", -[ShareAcceptor _checkRepresentativeDataclassEnabled:appCandidatesPresent:](self, "_checkRepresentativeDataclassEnabled:appCandidatesPresent:", a3, [v22 count] != 0));

      return 1;
    case 0x11:
      unsigned __int8 v23 = [(ShareAcceptor *)self _fallbackFlowWarnShareUnavailable:a3];
      goto LABEL_44;
    case 0x12:
      unsigned __int8 v23 = [(ShareAcceptor *)self _fallbackFlowWarnNetworkUnavailable:a3];
      goto LABEL_44;
    case 0x13:
      unsigned __int8 v23 = [(ShareAcceptor *)self _fallbackFlowWarnServiceUnavailable:a3];
      goto LABEL_44;
    case 0x14:
      int64_t v24 = [(ShareAcceptor *)self _fallbackFlowICloudAccountSettings:a3 success:&v27];
      id v25 = self;
      goto LABEL_46;
    case 0x15:
      unsigned __int8 v23 = [(ShareAcceptor *)self _fallbackFlowWebRedirect:a3];
      goto LABEL_44;
    case 0x16:
      unsigned __int8 v23 = [(ShareAcceptor *)self _fallbackFlowDownloadApp:a3];
      goto LABEL_44;
    case 0x17:
      unsigned __int8 v23 = [(ShareAcceptor *)self _fallbackFlowDownloadAppUpdate:a3];
LABEL_44:
      BOOL v27 = v23;
LABEL_45:
      id v25 = self;
      int64_t v24 = 24;
LABEL_46:
      [(ShareAcceptor *)v25 setState:v24];
      break;
    default:
      return v27;
  }
  return v27;
}

- (void)acceptShareWithCompletionHandler:(id)a3
{
  __int16 v32 = (void (**)(id, id))a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if ([(ShareAcceptor *)v4 accepting])
  {
    __int16 v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2 object:v4 file:@"ShareAcceptor.m" lineNumber:2029 description:@"ShareAcceptor isn't meant to be used for multiple accepts."];
  }
  [(ShareAcceptor *)v4 setAccepting:1];
  objc_sync_exit(v4);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [(ShareAcceptor *)v4 url];
    BOOL v8 = [v7 CKURLThroughSlug];
    dispatch_semaphore_t v9 = [(ShareAcceptor *)v4 url];
    id v10 = [v9 CKPathAfterSlug];
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v8;
    __int16 v36 = 2160;
    uint64_t v37 = 1752392040;
    __int16 v38 = 2112;
    uint64_t v39 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Accepting share for url %{public}@%{mask.hash}@", buf, 0x20u);
  }
  dispatch_semaphore_t v11 = [(ShareAcceptor *)v4 retrievingDialog];
  [v11 schedule];

  unsigned __int8 v12 = 0;
  while (1)
  {
    int64_t v13 = [(ShareAcceptor *)v4 state];
    id v33 = v12;
    unsigned int v14 = [(ShareAcceptor *)v4 makeStateTransition:&v33];
    id v15 = v33;

    unsigned int v16 = [(ShareAcceptor *)v4 cancelled];
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v18 = v17;
      uint64_t v19 = [(ShareAcceptor *)v4 url];
      uint64_t v20 = [v19 CKURLThroughSlug];
      uint64_t v21 = [(ShareAcceptor *)v4 url];
      uint64_t v22 = [v21 CKPathAfterSlug];
      unsigned __int8 v23 = (&off_100024A00)[[(ShareAcceptor *)v4 state]];
      CFStringRef v24 = @"false";
      if (v14) {
        CFStringRef v25 = @"true";
      }
      else {
        CFStringRef v25 = @"false";
      }
      *(_DWORD *)buf = 138544898;
      if (v16) {
        CFStringRef v24 = @"true";
      }
      uint64_t v35 = v20;
      __int16 v36 = 2160;
      uint64_t v37 = 1752392040;
      __int16 v38 = 2112;
      uint64_t v39 = v22;
      __int16 v40 = 2080;
      uint64_t v41 = v23;
      __int16 v42 = 2114;
      CFStringRef v43 = v25;
      __int16 v44 = 2114;
      CFStringRef v45 = v24;
      __int16 v46 = 2112;
      id v47 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Share acceptance for URL: %{public}@%{mask.hash}@, completed [%s]. Success=%{public}@, cancelled: %{public}@, error: %@", buf, 0x48u);
    }
    if ((v14 ^ 1 | v16)) {
      break;
    }
    if ([(ShareAcceptor *)v4 state] == v13)
    {
      id v26 = +[NSAssertionHandler currentHandler];
      [v26 handleFailureInMethod:a2 object:v4 file:@"ShareAcceptor.m" lineNumber:2052 description:@"State %s hasn't been advanced" (&off_100024A00)[v13]];
    }
    unsigned __int8 v12 = v15;
    if ((id)[(ShareAcceptor *)v4 state] == (id)24)
    {
      unsigned int v16 = 0;
      break;
    }
  }
  [(ShareAcceptor *)v4 setState:24];
  if (v15) {
    char v27 = 1;
  }
  else {
    char v27 = v14;
  }
  if ((v27 & 1) == 0)
  {
    int64_t v28 = [(ShareAcceptor *)v4 state];
    id v15 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain, 1000, @"Failure accepting share while in [%s]", (&off_100024A00)[v28] code format];
  }
  if (v15) {
    unsigned int v29 = 0;
  }
  else {
    unsigned int v29 = v16;
  }
  if (v29 == 1)
  {
    id v15 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain code:1000 format:@"Acceptance cancelled by the user"];
  }
  v32[2](v32, v15);
}

- (unint64_t)backgroundTaskID
{
  return self->_backgroundTaskID;
}

- (void)setBackgroundTaskID:(unint64_t)a3
{
  self->_backgroundTaskID = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)shouldTerminateAfterFetchingMetadata
{
  return self->_shouldTerminateAfterFetchingMetadata;
}

- (void)setShouldTerminateAfterFetchingMetadata:(BOOL)a3
{
  self->_shouldTerminateAfterFetchingMetadata = a3;
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (CKContainer)testTargetContainer
{
  return self->_testTargetContainer;
}

- (void)setTestTargetContainer:(id)a3
{
}

- (RetrievingDialog)retrievingDialog
{
  return self->_retrievingDialog;
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return self->_invitationToken;
}

- (void)setInvitationToken:(id)a3
{
}

- (NSString)shareName
{
  return self->_shareName;
}

- (void)setShareName:(id)a3
{
}

- (NSArray)registeredAppBundleIDs
{
  return self->_registeredAppBundleIDs;
}

- (void)setRegisteredAppBundleIDs:(id)a3
{
}

- (NSArray)registeredDaemonBundleIDs
{
  return self->_registeredDaemonBundleIDs;
}

- (void)setRegisteredDaemonBundleIDs:(id)a3
{
}

- (NSDictionary)localBundleIDsToDisplayNames
{
  return self->_localBundleIDsToDisplayNames;
}

- (void)setLocalBundleIDsToDisplayNames:(id)a3
{
}

- (NSString)chosenAppBundleID
{
  return self->_chosenAppBundleID;
}

- (void)setChosenAppBundleID:(id)a3
{
}

- (CKShareParticipant)singleOONMatch
{
  return self->_singleOONMatch;
}

- (void)setSingleOONMatch:(id)a3
{
}

- (NSPersonNameComponents)currentUserNameComponents
{
  return self->_currentUserNameComponents;
}

- (void)setCurrentUserNameComponents:(id)a3
{
}

- (NSString)currentUserFormattedUsername
{
  return self->_currentUserFormattedUsername;
}

- (void)setCurrentUserFormattedUsername:(id)a3
{
}

- (void)setMetadataIndicatedContainer:(id)a3
{
}

- (NSString)selectedAccountID
{
  return self->_selectedAccountID;
}

- (void)setSelectedAccountID:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)hasValidConnection
{
  return self->_hasValidConnection;
}

- (void)setHasValidConnection:(BOOL)a3
{
  self->_hasValidConnection = a3;
}

- (BOOL)accepting
{
  return self->_accepting;
}

- (void)setAccepting:(BOOL)a3
{
  self->_accepting = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)fallbackFlowCause
{
  return self->_fallbackFlowCause;
}

- (void)setFallbackFlowCause:(id)a3
{
}

- (NSString)webFlowReason
{
  return self->_webFlowReason;
}

- (void)setWebFlowReason:(id)a3
{
}

- (BOOL)isSourceICS
{
  return self->_isSourceICS;
}

- (void)setIsSourceICS:(BOOL)a3
{
  self->_isSourceICS = a3;
}

- (NSDictionary)unitTestOverrides
{
  return self->_unitTestOverrides;
}

- (void)setUnitTestOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_webFlowReason, 0);
  objc_storeStrong((id *)&self->_fallbackFlowCause, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_selectedAccountID, 0);
  objc_storeStrong((id *)&self->_metadataIndicatedContainer, 0);
  objc_storeStrong((id *)&self->_currentUserFormattedUsername, 0);
  objc_storeStrong((id *)&self->_currentUserNameComponents, 0);
  objc_storeStrong((id *)&self->_singleOONMatch, 0);
  objc_storeStrong((id *)&self->_chosenAppBundleID, 0);
  objc_storeStrong((id *)&self->_localBundleIDsToDisplayNames, 0);
  objc_storeStrong((id *)&self->_registeredDaemonBundleIDs, 0);
  objc_storeStrong((id *)&self->_registeredAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_shareName, 0);
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_retrievingDialog, 0);
  objc_storeStrong((id *)&self->_testTargetContainer, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end