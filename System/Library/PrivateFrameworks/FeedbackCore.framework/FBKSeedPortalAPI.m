@interface FBKSeedPortalAPI
+ (NSString)deletedKey;
+ (NSString)itemsKey;
+ (NSString)upsertedKey;
- (FBKForegroundDataClient)foregroundClient;
- (FBKLoginManager)loginManager;
- (FBKSeedPortalAPI)initWithEnvironment:(signed __int16)a3 client:(id)a4;
- (FBKUser)loggedInUser;
- (NSManagedObjectContext)_managedObjectContext;
- (NSMutableArray)deletedResponseIDs;
- (NSURL)teamsURL;
- (id)_filterForValue;
- (id)announcementAcknowledgementURL;
- (id)announcementURLForID:(id)a3;
- (id)appleConnectEnvironment;
- (id)assignURLForTeamID:(id)a3 participantID:(id)a4;
- (id)bugFormURLForID:(id)a3;
- (id)bugFormURLForID:(id)a3 requestPlugIns:(id)a4 appToken:(id)a5;
- (id)bugFormURLForID:(id)a3 teamID:(id)a4;
- (id)closeFeedbackURLForID:(id)a3;
- (id)contentItemsURL;
- (id)contentItemsURLForTeamID:(id)a3;
- (id)createFollowupResponseURLForFeedbackID:(id)a3 followupID:(id)a4;
- (id)createResponseURLForBugFormID:(id)a3;
- (id)createResponseURLForBugFormID:(id)a3 appToken:(id)a4;
- (id)createResponseURLForBugFormID:(id)a3 teamID:(id)a4;
- (id)deleteFollowupURLForFollowupID:(id)a3 feedbackID:(id)a4;
- (id)demoteURLForTeamID:(id)a3;
- (id)enhancedLoggingFollowupResponseURLForFeedbackID:(id)a3;
- (id)envelopedObjectFrom:(id)a3;
- (id)feedbackDetailsURLForFeedbackID:(id)a3;
- (id)feedbackDetailsURLForFollowupID:(id)a3;
- (id)feedbackDetailsURLForFormResponseID:(id)a3;
- (id)feedbackDetailsURLForSurveyFeedbackID:(id)a3;
- (id)feedbackFollowupURLForID:(id)a3;
- (id)feedbackStatusURLForFeedbackID:(id)a3;
- (id)filePromiseDeleteURLForUUID:(id)a3;
- (id)filePromiseDownloadURLForUUID:(id)a3;
- (id)formItemsURLForTeamID:(id)a3 formTat:(id)a4;
- (id)formResponsePutAnswersURLForID:(id)a3;
- (id)formResponseStubURLForID:(id)a3;
- (id)formResponseURLForID:(id)a3;
- (id)formResponseUpdateURLForID:(id)a3 bugFormID:(id)a4;
- (id)generateDeviceTokenForRemoteURL;
- (id)heartbeatURL;
- (id)hostUrl;
- (id)insertContentItemsFromJsonData:(id)a3;
- (id)loginWithAppleConnectURL;
- (id)loginWithAuthKitURL;
- (id)loginWithConfigURL;
- (id)loginWithDSURL;
- (id)managedObjectContext;
- (id)participantsURLForTeamID:(id)a3;
- (id)pendingConsentURL;
- (id)promoteURLForTeamID:(id)a3;
- (id)registerAPNSTokenURL;
- (id)saveChangesIntoContext:(id)a3 URLUsed:(id)a4;
- (id)unregisterAPNSTokenURL;
- (id)unsolicitedFollowupResponseURLForFeedbackID:(id)a3;
- (id)updateAnswerURLForQuestionID:(id)a3 answerID:(id)a4;
- (id)wrapFeedbackIDs:(id)a3;
- (void)_reportUnderlyingError:(id)a3 withFBKErrorCode:(int64_t)a4 withCompletion:(id)a5;
- (void)acknowledgeAnnouncementWithID:(id)a3 success:(id)a4 error:(id)a5;
- (void)assignFeedback:(id)a3 inTeamID:(int64_t)a4 toParticipantID:(int64_t)a5 success:(id)a6 error:(id)a7;
- (void)closeFeedbackItemWithID:(id)a3 withCompletion:(id)a4;
- (void)createFollowupWithType:(unint64_t)a3 forFeedbackWithID:(id)a4 success:(id)a5 error:(id)a6;
- (void)createFormResponseForBugForm:(id)a3 inTeam:(id)a4 appToken:(id)a5 success:(id)a6 error:(id)a7;
- (void)deleteFilePromiseWithUUID:(id)a3 completion:(id)a4;
- (void)deleteFollowupWithID:(id)a3 feedbackID:(id)a4 success:(id)a5 error:(id)a6;
- (void)deleteFormResponseWithID:(id)a3 success:(id)a4 error:(id)a5;
- (void)demoteFeedback:(id)a3 fromTeamID:(int64_t)a4 success:(id)a5 error:(id)a6;
- (void)deregisterAPNSWithDeviceToken:(id)a3 success:(id)a4 error:(id)a5;
- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4;
- (void)didLogOutWithCompletion:(id)a3;
- (void)envelopedDELETEForURL:(id)a3 success:(id)a4 errorHandler:(id)a5;
- (void)envelopedGETForURL:(id)a3 success:(id)a4 errorHandler:(id)a5;
- (void)envelopedPOSTForURL:(id)a3 parameters:(id)a4 success:(id)a5 errorHandler:(id)a6;
- (void)envelopedPUTForURL:(id)a3 parameters:(id)a4 success:(id)a5 errorHandler:(id)a6;
- (void)feedbackForFeedbackID:(id)a3 completion:(id)a4;
- (void)feedbackForFollowupID:(id)a3 completion:(id)a4;
- (void)feedbackForFormResponseID:(id)a3 completion:(id)a4;
- (void)feedbackForSurveyFeedbackID:(id)a3 completion:(id)a4;
- (void)feedbackFromURL:(id)a3 completion:(id)a4;
- (void)fetchAnnouncementForContentItem:(id)a3 withCompletion:(id)a4;
- (void)fetchBugFormWithID:(id)a3 forTeamID:(id)a4 requestPlugIns:(id)a5 appToken:(id)a6 success:(id)a7 error:(id)a8;
- (void)fetchBugFormWithID:(id)a3 forTeamID:(id)a4 success:(id)a5 error:(id)a6;
- (void)getFeedbackFollowupWithID:(id)a3 completion:(id)a4;
- (void)getFeedbackStatusForFeedbackID:(id)a3 completion:(id)a4;
- (void)getFileDownloadURLForFilePromiseUUID:(id)a3 completion:(id)a4;
- (void)getFormResponseStubWithID:(id)a3 withCompletion:(id)a4;
- (void)getParticipantsForTeamID:(int64_t)a3 success:(id)a4 error:(id)a5;
- (void)getRemoteDeviceTokenWithSuccess:(id)a3 error:(id)a4;
- (void)handleDataResponseFor:(id)a3 data:(id)a4 success:(id)a5 errorHandler:(id)a6;
- (void)markCompleteForFormResponseWithID:(id)a3 bugFormID:(id)a4 withFiles:(BOOL)a5 metadata:(id)a6 success:(id)a7 error:(id)a8;
- (void)performHeartbeatWithSuccess:(id)a3 error:(id)a4;
- (void)promoteFeedback:(id)a3 toTeamID:(int64_t)a4 success:(id)a5 error:(id)a6;
- (void)registerAPNSWithRequestDictionary:(id)a3 success:(id)a4 error:(id)a5;
- (void)respondToConsent:(id)a3 didAgree:(BOOL)a4 success:(id)a5 error:(id)a6;
- (void)saveAnswersForFormResponseWithID:(id)a3 answers:(id)a4 success:(id)a5 error:(id)a6;
- (void)seedPortalLoginAsAnonymousUserWithConfigurationToken:(id)a3 success:(id)a4 error:(id)a5;
- (void)seedPortalLoginWithAppleConnectSession:(id)a3 success:(id)a4 error:(id)a5;
- (void)seedPortalLoginWithAuthKitSession:(id)a3 device:(id)a4 authenticationResults:(id)a5 success:(id)a6 error:(id)a7;
- (void)seedPortalLoginWithAuthKitSession:(id)a3 device:(id)a4 idmsToken:(id)a5 alternateDSID:(id)a6 success:(id)a7 error:(id)a8;
- (void)sendFollowupResponseWithData:(id)a3 forFollowupID:(id)a4 feedbackID:(id)a5 success:(id)a6 error:(id)a7;
- (void)setDeletedResponseIDs:(id)a3;
- (void)setForegroundClient:(id)a3;
- (void)setLoggedInUser:(id)a3;
- (void)setLoginManager:(id)a3;
- (void)set_managedObjectContext:(id)a3;
- (void)updateAnnouncementWithID:(id)a3 success:(id)a4 error:(id)a5;
- (void)updateContentItemsForTeam:(id)a3 withCompletion:(id)a4;
- (void)updateContentItemsWithCompletion:(id)a3;
- (void)updateFormItemsForUser:(id)a3 inTeam:(id)a4 formTat:(id)a5 withCompletion:(id)a6;
- (void)updateFormResponseWithID:(id)a3 success:(id)a4 error:(id)a5;
- (void)updateTeamsWithCompletion:(id)a3;
@end

@implementation FBKSeedPortalAPI

- (FBKSeedPortalAPI)initWithEnvironment:(signed __int16)a3 client:(id)a4
{
  uint64_t v5 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FBKSeedPortalAPI;
  v8 = [(FBKSSeedPortalAPI *)&v13 initClient:v7];
  v9 = (FBKSeedPortalAPI *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 6, a4);
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    deletedResponseIDs = v9->_deletedResponseIDs;
    v9->_deletedResponseIDs = (NSMutableArray *)v10;

    [(FBKSSeedPortalAPI *)v9 setEnvironment:v5];
  }

  return v9;
}

- (void)didLogOutWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08890] sharedHTTPCookieStorage];
  v6 = +[FBKSharedConstants portalURL];
  id v7 = [v5 cookiesForURL:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [v5 deleteCookie:*(void *)(*((void *)&v17 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [(FBKSeedPortalAPI *)self setLoggedInUser:0];
  objc_super v13 = [(FBKSeedPortalAPI *)self foregroundClient];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__FBKSeedPortalAPI_didLogOutWithCompletion___block_invoke;
  v15[3] = &unk_2648741D0;
  id v16 = v4;
  id v14 = v4;
  [v13 didLogOutWithCompletion:v15];
}

void __44__FBKSeedPortalAPI_didLogOutWithCompletion___block_invoke(uint64_t a1)
{
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self managedObjectContext];

  if (!v8)
  {
    uint64_t v9 = +[FBKLog net];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[FBKSeedPortalAPI didLogInWithLoginUserInfo:completion:]();
    }
  }
  objc_initWeak(&location, self);
  uint64_t v10 = [(FBKSeedPortalAPI *)self managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke;
  v13[3] = &unk_2648746C0;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 performBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke(id *a1)
{
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained managedObjectContext];
  uint64_t v5 = +[FBKUser entityName];
  id v6 = [a1[4] participantID];
  id v7 = [v4 findFeedbackObjectWithEntityName:v5 remoteID:v6];
  id v8 = objc_loadWeakRetained(v2);
  [v8 setLoggedInUser:v7];

  id v9 = objc_loadWeakRetained(v2);
  uint64_t v10 = [v9 loggedInUser];

  if (!v10)
  {
    id v11 = +[FBKLog net];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_cold_1();
    }
  }
  id v12 = objc_loadWeakRetained(v2);
  objc_super v13 = [v12 foregroundClient];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_21;
  v15[3] = &unk_2648741D0;
  id v14 = a1[4];
  id v16 = a1[5];
  [v13 didLogInWithLoginUserInfo:v14 completion:v15];
}

void __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_21(uint64_t a1)
{
}

- (id)loginWithDSURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"login/with_ds"];

  return v3;
}

- (id)loginWithConfigURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"login/with_config"];

  return v3;
}

- (id)registerAPNSTokenURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"notify/register"];

  return v3;
}

- (id)unregisterAPNSTokenURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"notify/unregister"];

  return v3;
}

- (id)bugFormURLForID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"forms/%@.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)bugFormURLForID:(id)a3 requestPlugIns:(id)a4 appToken:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(FBKSeedPortalAPI *)self bugFormURLForID:a3];
  id v11 = v10;
  if (v9)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v10 resolvingAgainstBaseURL:0];
    objc_super v13 = (void *)MEMORY[0x263EFF980];
    id v14 = [v12 queryItems];
    id v15 = [v13 arrayWithArray:v14];

    id v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"app_token" value:v9];
    [v15 addObject:v16];

    if (v8 && [v8 count])
    {
      long long v17 = [v8 componentsJoinedByString:@","];
      long long v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"plugform_ids" value:v17];
      [v15 addObject:v18];
    }
    [v12 setQueryItems:v15];
    long long v19 = [v12 URL];

    long long v20 = Log_1();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v19 absoluteURL];
      int v24 = 138412290;
      v25 = v21;
      _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_DEFAULT, "Using App Token to load Form in: [%@]", (uint8_t *)&v24, 0xCu);
    }
    id v22 = v19;
  }
  else
  {
    id v22 = v10;
  }

  return v22;
}

- (id)formResponseURLForID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"form_responses/%@.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)createResponseURLForBugFormID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"forms/%@/form_responses/start.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)createResponseURLForBugFormID:(id)a3 appToken:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self createResponseURLForBugFormID:a3];
  id v8 = v7;
  if (v6)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v7 resolvingAgainstBaseURL:0];
    uint64_t v10 = (void *)MEMORY[0x263EFF980];
    id v11 = [v9 queryItems];
    id v12 = [v10 arrayWithArray:v11];

    objc_super v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"app_token" value:v6];
    [v12 addObject:v13];

    [v9 setQueryItems:v12];
    id v14 = [v9 URL];

    id v15 = Log_1();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 absoluteURL];
      int v19 = 138412290;
      long long v20 = v16;
      _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "Using App Token to start FormResponse in: [%@]", (uint8_t *)&v19, 0xCu);
    }
    id v17 = v14;
  }
  else
  {
    id v17 = v7;
  }

  return v17;
}

- (id)formResponsePutAnswersURLForID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"form_responses/%@/answers.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)updateAnswerURLForQuestionID:(id)a3 answerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v9 = [NSString stringWithFormat:@"questions/%@/answers/%@.json", v7, v6];

  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (id)formResponseUpdateURLForID:(id)a3 bugFormID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v9 = [NSString stringWithFormat:@"forms/%@/form_responses/%@.json", v6, v7];

  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (id)announcementURLForID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"announcements/%@.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)announcementAcknowledgementURL
{
  v2 = [(FBKSSeedPortalAPI *)self feedbackURL];
  v3 = [v2 URLByAppendingPathComponent:@"acknowledgements.json"];

  return v3;
}

- (id)unsolicitedFollowupResponseURLForFeedbackID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"%@/feedback_followups/add_unsolicited.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)enhancedLoggingFollowupResponseURLForFeedbackID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [NSString stringWithFormat:@"%@/feedback_followups/add_enhanced_logging.json", v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)deleteFollowupURLForFollowupID:(id)a3 feedbackID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v9 = [NSString stringWithFormat:@"%@/feedback_followups/%@.json", v6, v7];

  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (id)createFollowupResponseURLForFeedbackID:(id)a3 followupID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v9 = [NSString stringWithFormat:@"%@/feedback_followups/%@.json", v7, v6];

  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (id)generateDeviceTokenForRemoteURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"/device_token/generate.json"];

  return v3;
}

- (id)heartbeatURL
{
  v2 = [(FBKSSeedPortalAPI *)self feedbackURL];
  v3 = [v2 URLByAppendingPathComponent:@"application_versions/alive.json"];

  return v3;
}

- (id)loginWithAuthKitURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"login/with_authkit"];

  return v3;
}

- (id)loginWithAppleConnectURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"login/with_ac"];

  return v3;
}

- (id)contentItemsURL
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__FBKSeedPortalAPI_contentItemsURL__block_invoke;
  block[3] = &unk_264873FE8;
  block[4] = self;
  if (contentItemsURL_onceToken != -1) {
    dispatch_once(&contentItemsURL_onceToken, block);
  }
  return (id)contentItemsURL_url;
}

void __35__FBKSeedPortalAPI_contentItemsURL__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) feedbackURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"content_items.json"];
  id v4 = (void *)contentItemsURL_url;
  contentItemsURL_url = v3;

  uint64_t v5 = [MEMORY[0x263F08BA0] componentsWithURL:contentItemsURL_url resolvingAgainstBaseURL:0];
  id v6 = (void *)MEMORY[0x263F08BD0];
  id v7 = [*(id *)(a1 + 32) _filterForValue];
  id v8 = [v6 queryItemWithName:@"filter_for" value:v7];
  v12[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v5 setQueryItems:v9];

  uint64_t v10 = [v5 URL];
  id v11 = (void *)contentItemsURL_url;
  contentItemsURL_url = v10;
}

- (id)formResponseStubURLForID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"form_response_details/%@.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)feedbackStatusURLForFeedbackID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@/status.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)feedbackFollowupURLForID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"feedback_followup/%@.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)feedbackDetailsURLForFormResponseID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"feedback_details/form_response/%@.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)feedbackDetailsURLForFeedbackID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"feedback_details/feedback/%@.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)feedbackDetailsURLForFollowupID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"feedback_details/feedback_followup/%@.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)feedbackDetailsURLForSurveyFeedbackID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"feedback_details/survey_feedback/%@.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)closeFeedbackURLForID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@/close.json", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)filePromiseDownloadURLForUUID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"file_promise/%@/download", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (id)pendingConsentURL
{
  v2 = [(FBKSSeedPortalAPI *)self feedbackURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"pending-consents"];

  return v3;
}

- (id)filePromiseDeleteURLForUUID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"file_promise/%@", a3];
  uint64_t v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (void)seedPortalLoginWithAuthKitSession:(id)a3 device:(id)a4 authenticationResults:(id)a5 success:(id)a6 error:(id)a7
{
  uint64_t v12 = *MEMORY[0x263F28FB0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = [v15 objectForKeyedSubscript:v12];
  int v19 = [v18 objectForKeyedSubscript:@"com.apple.gs.beta.auth"];
  long long v20 = [v15 objectForKeyedSubscript:*MEMORY[0x263F28F58]];

  uint64_t v21 = Log_1();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:]();
  }

  id v22 = Log_1();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:]();
  }

  v23 = Log_1();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:]();
  }

  [(FBKSeedPortalAPI *)self seedPortalLoginWithAuthKitSession:v17 device:v16 idmsToken:v19 alternateDSID:v20 success:v14 error:v13];
}

- (void)seedPortalLoginWithAuthKitSession:(id)a3 device:(id)a4 idmsToken:(id)a5 alternateDSID:(id)a6 success:(id)a7 error:(id)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  long long v20 = (void *)MEMORY[0x263F089E0];
  uint64_t v21 = [(FBKSeedPortalAPI *)self loginWithAuthKitURL];
  id v22 = [v20 requestWithURL:v21];

  [v22 setHTTPMethod:@"POST"];
  id v23 = v16;
  if (v23)
  {
    id v31 = v14;
    int v24 = [v14 appleIDHeadersForRequest:v22];
    v25 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v24];
    [v25 setValue:@"application/json" forKey:@"Content-Type"];
    uint64_t v26 = [v15 uniqueDeviceIdentifier];
    [v25 setValue:v26 forKey:@"X-Mme-Device-Id"];

    v27 = [v15 serverFriendlyDescription];
    [v25 setValue:v27 forKey:@"X-Mme-Client-Info"];

    [v25 setValue:v17 forKey:@"X-Mme-ADSID"];
    [v25 setValue:v23 forKey:@"X-Apple-GS-Token"];
    v28 = Log_1();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl(&dword_22A36D000, v28, OS_LOG_TYPE_INFO, "AuthKit headers: %@", buf, 0xCu);
    }

    [v22 setAllHTTPHeaderFields:v25];
    v29 = [(FBKSeedPortalAPI *)self foregroundClient];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __99__FBKSeedPortalAPI_seedPortalLoginWithAuthKitSession_device_idmsToken_alternateDSID_success_error___block_invoke;
    v32[3] = &unk_2648746E8;
    id v33 = v18;
    id v34 = v19;
    [v29 jsonForURLRequest:v22 success:v32 error:v34];

    id v14 = v31;
    goto LABEL_9;
  }
  v30 = Log_1();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:]();
  }

  if (v19)
  {
    int v24 = FBKErrorOfType(16);
    (*((void (**)(id, void *))v19 + 2))(v19, v24);
LABEL_9:
  }
}

void __99__FBKSeedPortalAPI_seedPortalLoginWithAuthKitSession_device_idmsToken_alternateDSID_success_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F3C6A8];
  id v4 = a2;
  id v9 = (id)[[v3 alloc] initWithDictionary:v4];

  uint64_t v5 = [v9 deviceToken];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:10 userInfo:MEMORY[0x263EFFA78]];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

- (id)appleConnectEnvironment
{
  if (+[FBKSharedConstants isProductionEnvironment]) {
    v2 = @"acack";
  }
  else {
    v2 = @"acack-uat";
  }

  return v2;
}

- (void)seedPortalLoginWithAppleConnectSession:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263F089E0];
  id v11 = a3;
  uint64_t v12 = [(FBKSeedPortalAPI *)self loginWithAppleConnectURL];
  id v13 = [v10 requestWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  id v14 = [MEMORY[0x263EFF9A0] dictionary];
  id v15 = [(FBKSeedPortalAPI *)self appleConnectEnvironment];
  [v14 setObject:v15 forKey:*MEMORY[0x263F08128]];

  [v14 setObject:v11 forKey:*MEMORY[0x263F08140]];
  [v14 setObject:@"/" forKey:*MEMORY[0x263F08130]];
  [v14 setObject:@".apple.com" forKey:*MEMORY[0x263F08110]];
  id v16 = [MEMORY[0x263EFF910] date];
  id v17 = [v16 dateByAddingTimeInterval:28800.0];

  [v14 setObject:v17 forKey:*MEMORY[0x263F08118]];
  [v14 setObject:@"TRUE" forKey:*MEMORY[0x263F08138]];
  [v14 setObject:@"TRUE" forKey:*MEMORY[0x263F08108]];
  id v18 = [MEMORY[0x263F08888] cookieWithProperties:v14];
  id v19 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v18, 0);
  long long v20 = [MEMORY[0x263F08888] requestHeaderFieldsWithCookies:v19];
  uint64_t v21 = Log_1();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[FBKSeedPortalAPI seedPortalLoginWithAppleConnectSession:success:error:]();
  }

  [v13 setAllHTTPHeaderFields:v20];
  id v22 = [(FBKSeedPortalAPI *)self foregroundClient];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__FBKSeedPortalAPI_seedPortalLoginWithAppleConnectSession_success_error___block_invoke;
  v25[3] = &unk_2648746E8;
  id v26 = v8;
  id v27 = v9;
  id v23 = v9;
  id v24 = v8;
  [v22 jsonForURLRequest:v13 success:v25 error:v23];
}

void __73__FBKSeedPortalAPI_seedPortalLoginWithAppleConnectSession_success_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F3C6A8];
  id v4 = a2;
  id v9 = (id)[[v3 alloc] initWithDictionary:v4];

  [v9 setIsAppleConnectLogin:1];
  uint64_t v5 = [v9 deviceToken];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:10 userInfo:MEMORY[0x263EFFA78]];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

- (void)seedPortalLoginAsAnonymousUserWithConfigurationToken:(id)a3 success:(id)a4 error:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x263F089E0];
  id v11 = (void (**)(id, id))a5;
  uint64_t v12 = [(FBKSeedPortalAPI *)self loginWithConfigURL];
  id v13 = [v10 requestWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  id v22 = @"config";
  v23[0] = v8;
  id v14 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v21 = 0;
  id v15 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:0 error:&v21];
  id v16 = v21;
  if (v16)
  {
    id v17 = Log_1();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FBKSeedPortalAPI seedPortalLoginAsAnonymousUserWithConfigurationToken:success:error:]();
    }

    v11[2](v11, v16);
  }
  else
  {
    [v13 setHTTPBody:v15];
    [v13 setHTTPContentType:@"application/json; charset=utf-8"];
    id v18 = [(FBKSeedPortalAPI *)self foregroundClient];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __87__FBKSeedPortalAPI_seedPortalLoginAsAnonymousUserWithConfigurationToken_success_error___block_invoke;
    v19[3] = &unk_264874710;
    long long v20 = (void (**)(id, id))v9;
    [v18 jsonForURLRequest:v13 success:v19 error:v11];

    id v11 = v20;
  }
}

void __87__FBKSeedPortalAPI_seedPortalLoginAsAnonymousUserWithConfigurationToken_success_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F3C6A8];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithDictionary:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerAPNSWithRequestDictionary:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(FBKSeedPortalAPI *)self foregroundClient];
  id v11 = [(FBKSeedPortalAPI *)self registerAPNSTokenURL];
  [v12 putToURL:v11 parameters:v10 encoding:2 success:v9 error:v8];
}

- (void)deregisterAPNSWithDeviceToken:(id)a3 success:(id)a4 error:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(FBKSeedPortalAPI *)self foregroundClient];
    id v12 = [(FBKSeedPortalAPI *)self unregisterAPNSTokenURL];
    id v14 = @"deviceToken";
    v15[0] = v10;
    id v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

    [v11 deleteAtURL:v12 parameters:v13 encoding:2 success:v9 error:v8];
  }
}

- (void)updateFormItemsForUser:(id)a3 inTeam:(id)a4 formTat:(id)a5 withCompletion:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v14 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v13];

  if ([v10 teamType])
  {
    id v15 = [v10 ID];
    id v16 = [(FBKSeedPortalAPI *)self formItemsURLForTeamID:v15 formTat:v14];
  }
  else
  {
    id v16 = [(FBKSSeedPortalAPI *)self formItemsURLFormTat:v14];
  }
  objc_initWeak(location, self);
  id v17 = [(FBKSeedPortalAPI *)self foregroundClient];
  BOOL v18 = v11 != 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke;
  v29[3] = &unk_264874760;
  id v19 = v11;
  id v30 = v19;
  objc_copyWeak(&v36, location);
  id v20 = v12;
  id v35 = v20;
  BOOL v37 = v18;
  id v21 = v25;
  id v31 = v21;
  id v22 = v10;
  id v32 = v22;
  id v23 = v16;
  id v33 = v23;
  id v34 = self;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_183;
  v26[3] = &unk_264874788;
  objc_copyWeak(&v28, location);
  id v24 = v20;
  id v27 = v24;
  [v17 jsonForURL:v23 success:v29 error:v26];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (!*(void *)(a1 + 32))
    {
      char v5 = 0;
      goto LABEL_5;
    }
  }
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
LABEL_5:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v7 = WeakRetained;
  if (isKindOfClass & 1) != 0 || (v5)
  {
    id v9 = [WeakRetained managedObjectContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180;
    v12[3] = &unk_264874738;
    id v13 = v3;
    objc_copyWeak(&v19, (id *)(a1 + 80));
    id v18 = *(id *)(a1 + 72);
    char v20 = *(unsigned char *)(a1 + 88);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    id v16 = v10;
    uint64_t v17 = v11;
    [v9 performBlock:v12];

    objc_destroyWeak(&v19);
    id v8 = v13;
  }
  else
  {
    [WeakRetained _reportUnderlyingError:0 withFBKErrorCode:-1001 withCompletion:*(void *)(a1 + 72)];

    id v8 = Log_1();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_cold_1();
    }
  }
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180(uint64_t a1)
{
  v50[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v50[0] = *(void *)(a1 + 32);
    id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
  }
  else
  {
    id v2 = *(id *)(a1 + 32);
  }
  id v3 = v2;
  id v4 = +[FBKManagedLocalIDObject transformJSONArrayIntoLocalIDJSON:v2 uniquingPrefix:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v6 = [WeakRetained managedObjectContext];
  uint64_t v7 = +[FBKManagedFeedbackObject importFromJSONArray:v4 intoContext:v6];

  if (+[FBKSharedConstants isFormItemsDisabled])
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] set];

    uint64_t v7 = (void *)v8;
  }
  if (v7)
  {
    if (*(unsigned char *)(a1 + 88))
    {
      id v9 = [v7 anyObject];
      [v9 setWasFetchedByTat:1];
    }
    id v10 = [*(id *)(a1 + 40) bugFormStubs];

    uint64_t v11 = *(void **)(a1 + 40);
    if (v10)
    {
      id v12 = [v11 bugFormStubs];
      id v13 = [v12 setByAddingObjectsFromSet:v7];
      [*(id *)(a1 + 40) setBugFormStubs:v13];
    }
    else
    {
      [v11 setBugFormStubs:v7];
    }
    id v16 = *(void **)(a1 + 48);
    if (*(unsigned char *)(a1 + 88))
    {
      uint64_t v17 = [v16 forms];
      id v18 = [v17 setByAddingObjectsFromSet:v7];
      [*(id *)(a1 + 48) setForms:v18];
    }
    else
    {
      [v16 setForms:v7];
    }
    [*(id *)(a1 + 48) setDidFetchFormItems:1];
    id v19 = objc_loadWeakRetained((id *)(a1 + 80));
    char v20 = [v19 managedObjectContext];
    id v21 = [v19 saveChangesIntoContext:v20 URLUsed:*(void *)(a1 + 56)];

    if (v21)
    {
      id v22 = Log_1();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180_cold_2();
      }

      id v23 = objc_loadWeakRetained((id *)(a1 + 80));
      [v23 _reportUnderlyingError:v21 withFBKErrorCode:-1003 withCompletion:*(void *)(a1 + 72)];

      goto LABEL_24;
    }
    id v24 = objc_loadWeakRetained((id *)(a1 + 80));
    id v25 = [v24 _managedObjectContext];
    id v48 = 0;
    [v25 save:&v48];
    id v21 = v48;

    if (v21)
    {
      [*(id *)(a1 + 64) _reportUnderlyingError:v21 withFBKErrorCode:-1003 withCompletion:*(void *)(a1 + 72)];
LABEL_24:

      goto LABEL_25;
    }
    v42 = v4;
    v43 = v3;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v7;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          id v32 = objc_loadWeakRetained((id *)(a1 + 80));
          id v33 = [v32 managedObjectContext];
          [v33 refreshObject:v31 mergeChanges:1];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v28);
    }

    id v34 = objc_loadWeakRetained((id *)(a1 + 80));
    id v35 = [v34 managedObjectContext];
    [v35 refreshObject:*(void *)(a1 + 40) mergeChanges:1];

    id v36 = objc_loadWeakRetained((id *)(a1 + 80));
    BOOL v37 = [v36 managedObjectContext];
    v38 = [v36 saveChangesIntoContext:v37 URLUsed:*(void *)(a1 + 56)];

    if (v38)
    {
      v39 = Log_1();
      id v4 = v42;
      id v3 = v43;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180_cold_2();
      }

      id v40 = objc_loadWeakRetained((id *)(a1 + 80));
      [v40 _reportUnderlyingError:v38 withFBKErrorCode:-1003 withCompletion:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v41 = *(void *)(a1 + 72);
      id v4 = v42;
      id v3 = v43;
      if (v41) {
        (*(void (**)(uint64_t, id, void))(v41 + 16))(v41, v26, 0);
      }
    }
  }
  else
  {
    id v14 = Log_1();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180_cold_1();
    }

    id v15 = objc_loadWeakRetained((id *)(a1 + 80));
    [v15 _reportUnderlyingError:0 withFBKErrorCode:-1002 withCompletion:*(void *)(a1 + 72)];
  }
LABEL_25:
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_183(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _reportUnderlyingError:v4 withFBKErrorCode:-1004 withCompletion:*(void *)(a1 + 32)];
}

- (void)updateContentItemsWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(FBKSeedPortalAPI *)self loggedInUser];
  uint64_t v6 = [(FBKSeedPortalAPI *)self managedObjectContext];
  id v7 = +[FBKTeam personalTeamForUser:v5 inContext:v6];

  [(FBKSeedPortalAPI *)self updateContentItemsForTeam:v7 withCompletion:v4];
}

- (void)updateContentItemsForTeam:(id)a3 withCompletion:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v28 = a4;
  val = self;
  if ([v6 teamType])
  {
    id v7 = [v6 ID];
    uint64_t v29 = [(FBKSeedPortalAPI *)self contentItemsURLForTeamID:v7];
  }
  else
  {
    uint64_t v29 = [(FBKSeedPortalAPI *)self contentItemsURL];
  }
  uint64_t v8 = +[FBKTargetedSurvey inboxTargetedSurveysWithTeamType:](_TtC12FeedbackCore17FBKTargetedSurvey, "inboxTargetedSurveysWithTeamType:", [v6 teamType]);
  id v30 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v27 = [MEMORY[0x263F08BA0] componentsWithURL:v29 resolvingAgainstBaseURL:0];
    id v9 = (void *)MEMORY[0x263EFF980];
    id v10 = [v27 queryItems];
    uint64_t v11 = [v9 arrayWithArray:v10];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v12 = v30;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = (void *)MEMORY[0x263F08BD0];
          uint64_t v17 = [*(id *)(*((void *)&v42 + 1) + 8 * i) identifier];
          id v18 = [v16 queryItemWithName:@"tats[]" value:v17];

          [v11 addObject:v18];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v13);
    }

    [v27 setQueryItems:v11];
    id v19 = [v27 URL];

    char v20 = Log_1();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[FBKSeedPortalAPI updateContentItemsForTeam:withCompletion:]();
    }
  }
  else
  {
    id v19 = v29;
  }
  id v21 = [v6 ID];
  objc_initWeak(&location, val);
  id v22 = [(FBKSeedPortalAPI *)val foregroundClient];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke;
  v35[3] = &unk_264874800;
  objc_copyWeak(&v40, &location);
  id v39 = v28;
  id v23 = v21;
  id v36 = v23;
  id v24 = v6;
  id v37 = v24;
  id v25 = v19;
  id v38 = v25;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_207;
  v32[3] = &unk_264874828;
  id v26 = v39;
  id v33 = v26;
  objc_copyWeak(&v34, &location);
  [v22 jsonForURL:v25 success:v35 error:v32];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  char v5 = [WeakRetained managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2;
  v7[3] = &unk_2648747D8;
  id v6 = v3;
  id v8 = v6;
  objc_copyWeak(&v13, a1 + 8);
  id v12 = a1[7];
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = a1[6];
  [v5 performBlock:v7];

  objc_destroyWeak(&v13);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"items"];
    id v3 = (id *)(a1 + 72);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    char v5 = [WeakRetained insertContentItemsFromJsonData:v2];

    id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v6 setMinute:-1];
    id v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
    id v9 = [v7 dateByAddingComponents:v6 toDate:v8 options:0];

    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    id v11 = [v10 loggedInUser];
    id v12 = [v11 contentItems];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_3;
    v65[3] = &unk_2648747B0;
    id v56 = v9;
    id v66 = v56;
    id v13 = v5;
    id v67 = v13;
    id v68 = *(id *)(a1 + 40);
    uint64_t v14 = objc_msgSend(v12, "ded_selectItemsPassingTest:", v65);

    id v57 = v13;
    [*(id *)(a1 + 48) setContentItems:v13];
    if ([v14 count])
    {
      id v15 = Log_1();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v14 allObjects];
        uint64_t v17 = [v16 valueForKeyPath:@"ID"];
        id v18 = [v17 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543362;
        uint64_t v71 = (uint64_t)v18;
        _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "Update items while drafting. Found draft content items that we need to keep [%{public}@]", buf, 0xCu);
      }
      [*(id *)(a1 + 48) addContentItems:v14];
    }
    v58 = v14;
    id v19 = objc_loadWeakRetained((id *)(a1 + 72));
    char v20 = [v19 managedObjectContext];
    id v21 = objc_loadWeakRetained((id *)(a1 + 72));
    id v22 = [v21 loggedInUser];
    [v20 refreshObject:v22 mergeChanges:1];

    id v23 = objc_loadWeakRetained((id *)(a1 + 72));
    id v24 = [v23 managedObjectContext];
    id v25 = [v23 saveChangesIntoContext:v24 URLUsed:*(void *)(a1 + 56)];

    if (v25)
    {
      id v26 = Log_1();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_3();
      }

      uint64_t v27 = objc_loadWeakRetained((id *)(a1 + 72));
      [v27 _reportUnderlyingError:v25 withFBKErrorCode:-1003 withCompletion:*(void *)(a1 + 64)];
      uint64_t v29 = v56;
      id v28 = v57;
      goto LABEL_35;
    }
    uint64_t v27 = +[FBKContentItem fetchRequest];
    id v30 = [MEMORY[0x263F08A98] predicateWithFormat:@"teams.@count == 0"];
    [v27 setPredicate:v30];

    id v31 = objc_loadWeakRetained((id *)(a1 + 72));
    id v32 = [v31 managedObjectContext];
    id v64 = 0;
    id v33 = [v32 executeFetchRequest:v27 error:&v64];
    id v25 = v64;

    if (v25)
    {
      id v34 = Log_1();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_2();
      }

      id v35 = objc_loadWeakRetained((id *)(a1 + 72));
      [v35 _reportUnderlyingError:v25 withFBKErrorCode:-1003 withCompletion:*(void *)(a1 + 64)];

      uint64_t v29 = v56;
      id v28 = v57;
      goto LABEL_34;
    }
    v52 = v27;
    id v53 = v6;
    v54 = v2;
    uint64_t v55 = a1;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v36 = v33;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v61 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          long long v42 = Log_1();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            long long v43 = [v41 ID];
            uint64_t v44 = [v43 unsignedLongValue];
            *(_DWORD *)buf = 134217984;
            uint64_t v71 = v44;
            _os_log_impl(&dword_22A36D000, v42, OS_LOG_TYPE_INFO, "Purging old item %lu", buf, 0xCu);
          }
          id v45 = objc_loadWeakRetained(v3);
          long long v46 = [v45 managedObjectContext];
          [v46 deleteObject:v41];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v38);
    }

    id v47 = objc_loadWeakRetained(v3);
    id v48 = [v47 managedObjectContext];
    id v25 = [v47 saveChangesIntoContext:v48 URLUsed:*(void *)(v55 + 56)];

    if (v25)
    {
      v49 = Log_1();
      id v6 = v53;
      id v2 = v54;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_1();
      }

      id v50 = objc_loadWeakRetained(v3);
      [v50 _reportUnderlyingError:v25 withFBKErrorCode:-1003 withCompletion:*(void *)(v55 + 64)];
    }
    else
    {
      uint64_t v51 = *(void *)(v55 + 64);
      id v6 = v53;
      id v2 = v54;
      if (v51)
      {
        id v28 = v57;
        (*(void (**)(uint64_t, id, void))(v51 + 16))(v51, v57, 0);
        id v25 = 0;
        goto LABEL_33;
      }
      id v25 = 0;
    }
    id v28 = v57;
LABEL_33:
    uint64_t v29 = v56;
    uint64_t v27 = v52;
LABEL_34:

LABEL_35:
    return;
  }
  id v59 = objc_loadWeakRetained((id *)(a1 + 72));
  [v59 _reportUnderlyingError:0 withFBKErrorCode:-1001 withCompletion:*(void *)(a1 + 64)];
}

uint64_t __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  char v5 = [v3 createdAt];
  if ([v4 isEarlierThan:v5]
    && [v3 itemType] == 1
    && ([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    id v8 = [v3 teams];
    id v9 = [v8 valueForKeyPath:@"ID"];
    uint64_t v6 = [v9 containsObject:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = Log_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_207_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _reportUnderlyingError:v3 withFBKErrorCode:-1004 withCompletion:*(void *)(a1 + 32)];
  }
}

- (id)insertContentItemsFromJsonData:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(FBKSeedPortalAPI *)self managedObjectContext];
  uint64_t v6 = +[FBKManagedFeedbackObject importFromJSONArray:v4 intoContext:v5];

  id v7 = [(FBKSeedPortalAPI *)self loggedInUser];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setUser:", v7, (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v8;
}

- (void)_reportUnderlyingError:(id)a3 withFBKErrorCode:(int64_t)a4 withCompletion:(id)a5
{
  id v14 = a3;
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"UNEXPECTED_SERVER_DATA_ERROR" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08320]];

  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"UNEXPECTED_SERVER_DATA_ERROR_RECOVERY" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08348]];

  if (v14) {
    [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:a4 userInfo:v8];
  if (v7) {
    v7[2](v7, 0, v13);
  }
}

- (void)fetchBugFormWithID:(id)a3 forTeamID:(id)a4 success:(id)a5 error:(id)a6
{
}

- (void)fetchBugFormWithID:(id)a3 forTeamID:(id)a4 requestPlugIns:(id)a5 appToken:(id)a6 success:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v15) {
    [(FBKSeedPortalAPI *)self bugFormURLForID:v14 teamID:v15];
  }
  else {
  char v20 = [(FBKSeedPortalAPI *)self bugFormURLForID:v14 requestPlugIns:v16 appToken:v17];
  }
  objc_initWeak(&location, self);
  id v21 = [(FBKSeedPortalAPI *)self managedObjectContext];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke;
  v26[3] = &unk_2648748A0;
  objc_copyWeak(&v31, &location);
  id v22 = v14;
  id v27 = v22;
  id v23 = v20;
  id v28 = v23;
  id v24 = v18;
  id v29 = v24;
  id v25 = v19;
  id v30 = v25;
  [v21 performBlock:v26];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v4 = [WeakRetained managedObjectContext];
  char v5 = +[FBKBugForm entityName];
  uint64_t v6 = [v4 findFeedbackObjectWithEntityName:v5 remoteID:a1[4]];

  if (v6)
  {
    id v7 = Log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [a1[4] intValue];
      *(_DWORD *)buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "Deleting stale form [%i]", buf, 8u);
    }

    id v9 = objc_loadWeakRetained(v2);
    uint64_t v10 = [v9 managedObjectContext];
    [v10 deleteObject:v6];
  }
  id v11 = objc_loadWeakRetained(v2);
  id v12 = [v11 foregroundClient];
  id v13 = a1[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_220;
  v14[3] = &unk_264874878;
  objc_copyWeak(&v18, v2);
  id v15 = a1[5];
  id v16 = a1[6];
  id v17 = a1[7];
  [v12 jsonForURL:v13 success:v14 error:a1[7]];

  objc_destroyWeak(&v18);
}

void __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_220(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  char v5 = [WeakRetained managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_2;
  v7[3] = &unk_264874850;
  id v6 = v3;
  id v8 = v6;
  objc_copyWeak(&v12, a1 + 7);
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = a1[6];
  [v5 performBlock:v7];

  objc_destroyWeak(&v12);
}

void __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v5 = [WeakRetained managedObjectContext];
  id v6 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v5];

  id v7 = objc_loadWeakRetained(v3);
  id v8 = [v7 managedObjectContext];
  id v14 = [v7 saveChangesIntoContext:v8 URLUsed:*(void *)(a1 + 40)];

  if (v14)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (!v9) {
      goto LABEL_7;
    }
    id v10 = *(void (**)(void))(v9 + 16);
  }
  else
  {
    id v11 = objc_loadWeakRetained(v3);
    id v12 = [v11 managedObjectContext];
    [v12 refreshObject:v6 mergeChanges:1];

    uint64_t v13 = *(void *)(a1 + 48);
    if (!v13) {
      goto LABEL_7;
    }
    id v10 = *(void (**)(void))(v13 + 16);
  }
  v10();
LABEL_7:
}

- (void)updateFormResponseWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(FBKSeedPortalAPI *)self formResponseURLForID:a3];
  id v11 = [(FBKSeedPortalAPI *)self foregroundClient];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke;
  v17[3] = &unk_2648748F0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_3;
  v15[3] = &unk_2648743D8;
  id v16 = v20;
  id v12 = v20;
  id v13 = v8;
  id v14 = v10;
  [v11 jsonForURL:v14 success:v17 error:v15];
}

void __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_2;
  v8[3] = &unk_2648748C8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  [v4 performBlock:v8];
}

void __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v3];

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v5 managedObjectContext];
  id v11 = [v5 saveChangesIntoContext:v6 URLUsed:*(void *)(a1 + 48)];

  if (v11)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = *(void (**)(void))(v7 + 16);
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) managedObjectContext];
    [v9 refreshObject:v4 mergeChanges:1];

    uint64_t v10 = *(void *)(a1 + 56);
    if (!v10) {
      goto LABEL_7;
    }
    id v8 = *(void (**)(void))(v10 + 16);
  }
  v8();
LABEL_7:
}

uint64_t __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteFollowupWithID:(id)a3 feedbackID:(id)a4 success:(id)a5 error:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(FBKSeedPortalAPI *)self foregroundClient];
  id v15 = [(FBKSeedPortalAPI *)self deleteFollowupURLForFollowupID:v13 feedbackID:v12];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__FBKSeedPortalAPI_deleteFollowupWithID_feedbackID_success_error___block_invoke;
  v17[3] = &unk_264874918;
  id v18 = v10;
  id v16 = v10;
  [v14 deleteResourceAtURL:v15 success:v17 error:v11];
}

uint64_t __66__FBKSeedPortalAPI_deleteFollowupWithID_feedbackID_success_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteFormResponseWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FBKSeedPortalAPI *)self deletedResponseIDs];
  objc_sync_enter(v11);
  if (v8)
  {
    id v12 = [(FBKSeedPortalAPI *)self deletedResponseIDs];
    [v12 addObject:v8];
  }
  else
  {
    id v12 = Log_1();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FBKSeedPortalAPI deleteFormResponseWithID:success:error:]();
    }
  }

  objc_sync_exit(v11);
  id v13 = [(FBKSeedPortalAPI *)self formResponseURLForID:v8];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__FBKSeedPortalAPI_deleteFormResponseWithID_success_error___block_invoke;
  v16[3] = &unk_264874940;
  objc_copyWeak(&v19, &location);
  id v14 = v10;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [(FBKSeedPortalAPI *)self envelopedDELETEForURL:v13 success:v16 errorHandler:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __59__FBKSeedPortalAPI_deleteFormResponseWithID_success_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained managedObjectContext];
  id v7 = 0;
  [v3 save:&v7];
  id v4 = v7;

  if (v4 && (uint64_t v5 = *(void *)(a1 + 32)) != 0)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

- (void)createFormResponseForBugForm:(id)a3 inTeam:(id)a4 appToken:(id)a5 success:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v13 teamType];
  id v18 = [v12 ID];
  if (v17)
  {
    id v19 = [v13 ID];
    id v20 = [(FBKSeedPortalAPI *)self createResponseURLForBugFormID:v18 teamID:v19];
  }
  else
  {
    id v20 = [(FBKSeedPortalAPI *)self createResponseURLForBugFormID:v18 appToken:v14];
  }

  id v21 = v12;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke;
  v26[3] = &unk_264874990;
  id v27 = v21;
  objc_copyWeak(&v33, &location);
  id v28 = self;
  id v22 = v16;
  id v31 = v22;
  id v23 = v27;
  id v29 = v23;
  id v24 = v20;
  id v30 = v24;
  id v25 = v15;
  id v32 = v25;
  [(FBKSeedPortalAPI *)self envelopedGETForURL:v24 success:v26 errorHandler:v22];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v12 = [WeakRetained managedObjectContext];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2;
  v17[3] = &unk_264874968;
  id v13 = v7;
  uint64_t v14 = *(void *)(a1 + 40);
  id v18 = v13;
  uint64_t v19 = v14;
  id v15 = v8;
  id v20 = v15;
  objc_copyWeak(&v26, (id *)(a1 + 80));
  id v16 = v10;
  id v21 = v16;
  id v24 = *(id *)(a1 + 64);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v25 = *(id *)(a1 + 72);
  [v12 performBlock:v17];

  objc_destroyWeak(&v26);
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v3];

  uint64_t v5 = [*(id *)(a1 + 48) anyObject];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 setFormResponse:v4];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    id v8 = [WeakRetained loggedInUser];
    [v6 setUser:v8];
  }
  else
  {
    id WeakRetained = +[FBKLog net];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_3(v4, WeakRetained);
    }
  }

  id v9 = [v4 managedObjectContext];
  id v10 = [*(id *)(a1 + 56) managedObjectContext];

  id v11 = +[FBKLog model];
  id v12 = v11;
  if (v9 == v10)
  {
    long long v46 = v6;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_INFO, "Form response and bug form context match, continuing.", buf, 2u);
    }

    [v4 setBugForm:*(void *)(a1 + 56)];
    [v4 setCompleted:0];
    uint64_t v14 = [MEMORY[0x263EFF910] date];
    [v4 setCreatedAt:v14];

    [v4 setUploadTask:0];
    id v15 = [v4 answers];
    id v16 = [v15 valueForKey:@"questionID"];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v45 = a1;
    id obj = [*(id *)(a1 + 64) questionGroups];
    uint64_t v49 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v58;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v58 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v17;
          id v18 = *(void **)(*((void *)&v57 + 1) + 8 * v17);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v19 = [v18 questions];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v54;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v54 != v22) {
                  objc_enumerationMutation(v19);
                }
                id v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                id v25 = [v24 ID];
                id v26 = [v16 member:v25];

                if (v26)
                {
                  id v27 = [v4 answers];
                  v52[0] = MEMORY[0x263EF8330];
                  v52[1] = 3221225472;
                  v52[2] = __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_228;
                  v52[3] = &unk_264873E68;
                  v52[4] = v24;
                  id v28 = objc_msgSend(v27, "ded_findWithBlock:", v52);

                  [v28 setQuestion:v24];
                  if (v28)
                  {
                    [v24 addAnswer:v28];
                  }
                  else
                  {
                    id v29 = +[FBKLog model];
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
                      __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_1(buf, v24, &v62, v29);
                    }
                  }
                }
                else
                {
                  id v28 = +[FBKAnswer emptyLocalAnswerForQuestion:v24 inFormResponse:v4];
                  [v28 setQuestion:v24];
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v63 count:16];
            }
            while (v21);
          }

          uint64_t v17 = v50 + 1;
        }
        while (v50 + 1 != v49);
        uint64_t v49 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v49);
    }

    id v30 = (id *)(a1 + 96);
    id v31 = objc_loadWeakRetained((id *)(a1 + 96));
    id v32 = [v31 managedObjectContext];
    int v33 = [v32 hasChanges];

    if (v33)
    {
      id v34 = objc_loadWeakRetained(v30);
      id v35 = [v34 managedObjectContext];
      id v51 = 0;
      [v35 save:&v51];
      id v36 = v51;
    }
    else
    {
      id v36 = 0;
    }
    uint64_t v37 = *(void **)(a1 + 40);
    uint64_t v38 = [v37 managedObjectContext];
    id v13 = [v37 saveChangesIntoContext:v38 URLUsed:*(void *)(v45 + 72)];

    if (v13)
    {
      uint64_t v39 = *(void *)(v45 + 80);
      uint64_t v6 = v46;
      if (v39)
      {
        id v40 = *(void (**)(void))(v39 + 16);
LABEL_40:
        v40();
      }
    }
    else
    {
      uint64_t v41 = [*(id *)(v45 + 40) managedObjectContext];
      id v42 = objc_loadWeakRetained(v30);
      long long v43 = [v42 loggedInUser];
      [v41 refreshObject:v43 mergeChanges:1];

      uint64_t v44 = *(void *)(v45 + 88);
      uint64_t v6 = v46;
      if (v44)
      {
        id v40 = *(void (**)(void))(v44 + 16);
        goto LABEL_40;
      }
    }

    goto LABEL_42;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_2(v4, (id *)(a1 + 56), v12);
  }

  id v13 = FBKErrorOfType(-1002);
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_42:
}

uint64_t __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_228(uint64_t a1, void *a2)
{
  id v3 = [a2 questionID];
  id v4 = [*(id *)(a1 + 32) ID];
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

- (void)saveAnswersForFormResponseWithID:(id)a3 answers:(id)a4 success:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(FBKSeedPortalAPI *)self formResponsePutAnswersURLForID:v10];
  objc_initWeak(&location, self);
  id v15 = +[FBKLog net];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FBKSeedPortalAPI saveAnswersForFormResponseWithID:answers:success:error:]();
  }

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA78];
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke;
  v21[3] = &unk_2648749E0;
  objc_copyWeak(&v27, &location);
  id v17 = v10;
  id v22 = v17;
  id v23 = self;
  id v18 = v13;
  id v25 = v18;
  id v19 = v14;
  id v24 = v19;
  id v20 = v12;
  id v26 = v20;
  [(FBKSeedPortalAPI *)self envelopedPUTForURL:v19 parameters:v16 success:v21 errorHandler:v18];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v11 = [WeakRetained managedObjectContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke_2;
  v15[3] = &unk_2648749B8;
  id v12 = v7;
  id v16 = v12;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  id v17 = v13;
  uint64_t v18 = v14;
  id v20 = *(id *)(a1 + 56);
  objc_copyWeak(&v22, (id *)(a1 + 72));
  id v19 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 64);
  [v11 performBlock:v15];

  objc_destroyWeak(&v22);
}

uint64_t __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) managedObjectContext];
    id v5 = +[FBKAnswer _importByQuestionIDFromJSONArray:v2 withFormResponseID:v3 intoContext:v4];

    id v6 = objc_loadWeakRetained((id *)(a1 + 80));
    id v7 = [v6 managedObjectContext];
    uint64_t v13 = [v6 saveChangesIntoContext:v7 URLUsed:*(void *)(a1 + 56)];

    if (v13)
    {
      uint64_t v8 = *(void *)(a1 + 64);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v13);
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 72);
      if (v11) {
        (*(void (**)(void))(v11 + 16))();
      }
    }
  }
  else
  {
    id v9 = FBKErrorOfType(-1001);
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10) {
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)markCompleteForFormResponseWithID:(id)a3 bugFormID:(id)a4 withFiles:(BOOL)a5 metadata:(id)a6 success:(id)a7 error:(id)a8
{
  BOOL v11 = a5;
  v33[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v11) {
    id v19 = &unk_26DE1EA38;
  }
  else {
    id v19 = &unk_26DE1EA60;
  }
  id v20 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v19];
  [v20 addEntriesFromDictionary:v16];
  id v32 = @"form_response";
  v33[0] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  id v22 = [(FBKSeedPortalAPI *)self formResponseUpdateURLForID:v14 bugFormID:v15];
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke;
  v26[3] = &unk_264874A30;
  objc_copyWeak(&v30, &location);
  id v23 = v14;
  id v27 = v23;
  id v24 = v22;
  id v28 = v24;
  id v25 = v17;
  id v29 = v25;
  [(FBKSeedPortalAPI *)self envelopedPUTForURL:v24 parameters:v21 success:v26 errorHandler:v18];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  BOOL v11 = [WeakRetained managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2;
  v13[3] = &unk_264874A08;
  objc_copyWeak(&v18, a1 + 7);
  id v14 = a1[4];
  id v12 = v8;
  id v15 = v12;
  id v16 = a1[5];
  id v17 = a1[6];
  [v11 performBlock:v13];

  objc_destroyWeak(&v18);
}

void __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [WeakRetained managedObjectContext];
  id v5 = +[FBKFormResponse entityName];
  id v6 = [v4 findFeedbackObjectWithEntityName:v5 remoteID:*(void *)(a1 + 32)];

  id v7 = [*(id *)(a1 + 40) anyObject];
  id v8 = v7;
  if (v6)
  {
    [v7 setFormResponse:v6];
  }
  else
  {
    id v9 = +[FBKLog net];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2_cold_1((id *)(a1 + 32), v8, v9);
    }
  }
  uint64_t v10 = [v6 managedObjectContext];
  BOOL v11 = [v6 bugForm];
  [v10 refreshObject:v11 mergeChanges:1];

  id v12 = objc_loadWeakRetained(v2);
  uint64_t v13 = [v12 managedObjectContext];
  id v14 = (id)[v12 saveChangesIntoContext:v13 URLUsed:*(void *)(a1 + 48)];

  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
}

- (void)getFormResponseStubWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self formResponseStubURLForID:v6];
  objc_initWeak(&location, self);
  id v9 = [(FBKSeedPortalAPI *)self foregroundClient];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke;
  v15[3] = &unk_264874A80;
  objc_copyWeak(&v19, &location);
  id v10 = v6;
  id v16 = v10;
  id v18 = v7;
  id v11 = v8;
  id v17 = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_245;
  v13[3] = &unk_2648743D8;
  id v12 = v18;
  id v14 = v12;
  [v9 jsonForURL:v11 success:v15 error:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = [WeakRetained managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_2;
  v7[3] = &unk_264874A58;
  objc_copyWeak(&v12, a1 + 7);
  id v8 = a1[4];
  id v11 = a1[6];
  id v6 = v3;
  id v9 = v6;
  id v10 = a1[5];
  [v5 performBlock:v7];

  objc_destroyWeak(&v12);
}

void __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [WeakRetained deletedResponseIDs];

  objc_sync_enter(v4);
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 deletedResponseIDs];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = Log_1();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) unsignedIntegerValue];
      int v20 = 134217984;
      uint64_t v21 = v9;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Fetched FormResponseStub [%lu] has been deleted. Will not insert", (uint8_t *)&v20, 0xCu);
    }

    id v10 = FBKErrorOfType(-1010);
  }
  else
  {
    id v10 = 0;
  }
  objc_sync_exit(v4);

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = objc_loadWeakRetained(v2);
    id v14 = [v13 managedObjectContext];
    uint64_t v15 = +[FBKManagedFeedbackObject importFromJSONObject:v12 intoContext:v14];

    id v16 = objc_loadWeakRetained(v2);
    id v17 = [v16 managedObjectContext];
    id v18 = (id)[v16 saveChangesIntoContext:v17 URLUsed:*(void *)(a1 + 48)];

    uint64_t v19 = *(void *)(a1 + 56);
    if (v19) {
      (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v15, 0);
    }
  }
}

uint64_t __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_245(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getFeedbackStatusForFeedbackID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self feedbackStatusURLForFeedbackID:v6];
  objc_initWeak(&location, self);
  uint64_t v9 = [(FBKSeedPortalAPI *)self foregroundClient];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke;
  v14[3] = &unk_264874AD0;
  objc_copyWeak(&v17, &location);
  id v16 = v7;
  id v10 = v8;
  id v15 = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_3;
  v12[3] = &unk_2648743D8;
  id v11 = v16;
  id v13 = v11;
  [v9 jsonForURL:v10 success:v14 error:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [WeakRetained managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_2;
  v7[3] = &unk_264874AA8;
  id v6 = v3;
  id v8 = v6;
  objc_copyWeak(&v11, a1 + 6);
  id v10 = a1[5];
  id v9 = a1[4];
  [v5 performBlock:v7];

  objc_destroyWeak(&v11);
}

void __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v4 = [WeakRetained managedObjectContext];
    id v9 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v4];

    id v5 = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = [v5 managedObjectContext];
    id v7 = (id)[v5 saveChangesIntoContext:v6 URLUsed:*(void *)(a1 + 40)];

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v9, 0);
    }
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    [v9 _reportUnderlyingError:0 withFBKErrorCode:-1001 withCompletion:*(void *)(a1 + 48)];
  }
}

uint64_t __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)createFollowupWithType:(unint64_t)a3 forFeedbackWithID:(id)a4 success:(id)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3 == 7)
  {
    uint64_t v13 = [(FBKSeedPortalAPI *)self enhancedLoggingFollowupResponseURLForFeedbackID:v10];
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Wrong Feedback Followup Type", @"%s received invalid type %lu", "-[FBKSeedPortalAPI createFollowupWithType:forFeedbackWithID:success:error:]", a3);
      id v14 = 0;
      goto LABEL_7;
    }
    uint64_t v13 = [(FBKSeedPortalAPI *)self unsolicitedFollowupResponseURLForFeedbackID:v10];
  }
  id v14 = (void *)v13;
LABEL_7:
  id v15 = [(FBKSeedPortalAPI *)self foregroundClient];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke;
  v21[3] = &unk_264874AF8;
  void v21[4] = self;
  id v22 = v14;
  id v23 = v11;
  id v24 = v12;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_3;
  v19[3] = &unk_2648743D8;
  id v20 = v24;
  id v16 = v24;
  id v17 = v11;
  id v18 = v14;
  [v15 postToURL:v18 parameters:MEMORY[0x263EFFA78] encoding:2 success:v21 error:v19];
}

void __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_2;
  v8[3] = &unk_2648748C8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  [v4 performBlock:v8];
}

void __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v13 = 0;
  id v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v13];
  id v4 = v13;
  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 40) managedObjectContext];
    id v6 = +[FBKManagedFeedbackObject importFromJSONObject:v3 intoContext:v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 managedObjectContext];
  id v9 = (id)[v7 saveChangesIntoContext:v8 URLUsed:*(void *)(a1 + 48)];

  if (v4)
  {
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10)
    {
      id v11 = *(void (**)(void))(v10 + 16);
LABEL_9:
      v11();
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      id v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_9;
    }
  }
}

uint64_t __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendFollowupResponseWithData:(id)a3 forFollowupID:(id)a4 feedbackID:(id)a5 success:(id)a6 error:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  id v15 = [(FBKSeedPortalAPI *)self createFollowupResponseURLForFeedbackID:a5 followupID:a4];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke;
  v19[3] = &unk_264874B20;
  void v19[4] = self;
  id v20 = v15;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v15;
  [(FBKSeedPortalAPI *)self envelopedPUTForURL:v18 parameters:v14 success:v19 errorHandler:v16];
}

void __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke_2;
  v8[3] = &unk_2648748C8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  [v4 performBlock:v8];
}

void __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v8 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v3];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 managedObjectContext];
  id v6 = (id)[v4 saveChangesIntoContext:v5 URLUsed:*(void *)(a1 + 48)];

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (void)getFeedbackFollowupWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self feedbackFollowupURLForID:v6];
  objc_initWeak(&location, self);
  id v9 = [(FBKSeedPortalAPI *)self foregroundClient];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke;
  v14[3] = &unk_264874B70;
  objc_copyWeak(&v17, &location);
  id v10 = v8;
  id v15 = v10;
  id v16 = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_3;
  v12[3] = &unk_2648743D8;
  id v11 = v16;
  id v13 = v11;
  [v9 jsonForURL:v10 success:v14 error:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = [WeakRetained managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_2;
  v7[3] = &unk_264874B48;
  id v6 = v3;
  id v8 = v6;
  objc_copyWeak(&v11, a1 + 6);
  id v9 = a1[4];
  id v10 = a1[5];
  [v5 performBlock:v7];

  objc_destroyWeak(&v11);
}

void __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained managedObjectContext];
  id v10 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v5];

  id v6 = objc_loadWeakRetained(v3);
  id v7 = [v6 managedObjectContext];
  id v8 = (id)[v6 saveChangesIntoContext:v7 URLUsed:*(void *)(a1 + 40)];

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v10, 0);
  }
}

uint64_t __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)closeFeedbackItemWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self closeFeedbackURLForID:v6];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke;
  v13[3] = &unk_264874B98;
  objc_copyWeak(&v16, &location);
  id v9 = v8;
  id v14 = v9;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke_2;
  v11[3] = &unk_2648743D8;
  id v10 = v15;
  id v12 = v10;
  [(FBKSeedPortalAPI *)self envelopedPUTForURL:v9 parameters:MEMORY[0x263EFFA78] success:v13 errorHandler:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [v2 managedObjectContext];
  id v5 = [v2 saveChangesIntoContext:v3 URLUsed:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

uint64_t __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)feedbackForFormResponseID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self feedbackDetailsURLForFormResponseID:a3];
  [(FBKSeedPortalAPI *)self feedbackFromURL:v7 completion:v6];
}

- (void)feedbackForFeedbackID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self feedbackDetailsURLForFeedbackID:a3];
  [(FBKSeedPortalAPI *)self feedbackFromURL:v7 completion:v6];
}

- (void)feedbackForFollowupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self feedbackDetailsURLForFollowupID:a3];
  [(FBKSeedPortalAPI *)self feedbackFromURL:v7 completion:v6];
}

- (void)feedbackForSurveyFeedbackID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self feedbackDetailsURLForSurveyFeedbackID:a3];
  [(FBKSeedPortalAPI *)self feedbackFromURL:v7 completion:v6];
}

- (void)feedbackFromURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke;
  v12[3] = &unk_264874B98;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v13 = v8;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_3;
  v10[3] = &unk_2648743D8;
  id v9 = v14;
  id v11 = v9;
  [(FBKSeedPortalAPI *)self envelopedGETForURL:v8 success:v12 errorHandler:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v11 = [WeakRetained managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_2;
  v13[3] = &unk_264874B48;
  id v12 = v7;
  id v14 = v12;
  objc_copyWeak(&v17, a1 + 6);
  id v15 = a1[4];
  id v16 = a1[5];
  [v11 performBlock:v13];

  objc_destroyWeak(&v17);
}

void __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained managedObjectContext];
  id v10 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v5];

  id v6 = objc_loadWeakRetained(v3);
  id v7 = [v6 managedObjectContext];
  id v8 = (id)[v6 saveChangesIntoContext:v7 URLUsed:*(void *)(a1 + 40)];

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v10, 0);
  }
}

uint64_t __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchAnnouncementForContentItem:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  id v8 = [(FBKSeedPortalAPI *)self managedObjectContext];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke;
  v25[3] = &unk_264874BC0;
  id v27 = &v28;
  id v9 = v6;
  id v26 = v9;
  [v8 performBlockAndWait:v25];

  id v10 = [(FBKSeedPortalAPI *)self announcementURLForID:v29[5]];
  objc_initWeak(&location, self);
  id v11 = [(FBKSeedPortalAPI *)self foregroundClient];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_2;
  v19[3] = &unk_264874800;
  objc_copyWeak(&v23, &location);
  id v12 = v7;
  id v22 = v12;
  void v19[4] = self;
  id v13 = v9;
  id v20 = v13;
  id v14 = v10;
  id v21 = v14;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_257;
  v16[3] = &unk_264874788;
  objc_copyWeak(&v18, &location);
  id v15 = v12;
  id v17 = v15;
  [v11 jsonForURL:v14 success:v19 error:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v28, 8);
}

uint64_t __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) ID];

  return MEMORY[0x270F9A758]();
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [WeakRetained managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3;
  v10[3] = &unk_2648747D8;
  id v6 = v3;
  id v11 = v6;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v15 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 48);
  [v5 performBlock:v10];

  objc_destroyWeak(&v16);
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) managedObjectContext];
    id v10 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v3];

    [*(id *)(a1 + 48) setAnnouncement:v10];
    id v4 = objc_loadWeakRetained((id *)(a1 + 72));
    id v5 = [v4 managedObjectContext];
    id v6 = (id)[v4 saveChangesIntoContext:v5 URLUsed:*(void *)(a1 + 56)];

    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v10, 0);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained _reportUnderlyingError:0 withFBKErrorCode:-1001 withCompletion:*(void *)(a1 + 64)];

    id v9 = Log_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3_cold_1();
    }
  }
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_257(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _reportUnderlyingError:v4 withFBKErrorCode:-1004 withCompletion:*(void *)(a1 + 32)];
}

- (void)updateAnnouncementWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(FBKSeedPortalAPI *)self announcementURLForID:a3];
  id v11 = [(FBKSeedPortalAPI *)self foregroundClient];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke;
  v17[3] = &unk_2648748F0;
  void v17[4] = self;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_3;
  v15[3] = &unk_2648743D8;
  id v16 = v20;
  id v12 = v20;
  id v13 = v8;
  id v14 = v10;
  [v11 jsonForURL:v14 success:v17 error:v15];
}

void __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_2;
  v8[3] = &unk_2648748C8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  [v4 performBlock:v8];
}

void __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v8 = +[FBKManagedFeedbackObject importFromJSONObject:v2 intoContext:v3];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 managedObjectContext];
  id v6 = (id)[v4 saveChangesIntoContext:v5 URLUsed:*(void *)(a1 + 48)];

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

uint64_t __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)acknowledgeAnnouncementWithID:(id)a3 success:(id)a4 error:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v17[0] = @"id";
  v17[1] = @"type";
  v18[0] = a3;
  v18[1] = @"Announcement";
  id v9 = NSDictionary;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v13 = [(FBKSeedPortalAPI *)self announcementAcknowledgementURL];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __64__FBKSeedPortalAPI_acknowledgeAnnouncementWithID_success_error___block_invoke;
  v15[3] = &unk_264874BE8;
  id v16 = v8;
  id v14 = v8;
  [(FBKSeedPortalAPI *)self envelopedPOSTForURL:v13 parameters:v12 success:v15 errorHandler:v10];
}

uint64_t __64__FBKSeedPortalAPI_acknowledgeAnnouncementWithID_success_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getRemoteDeviceTokenWithSuccess:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self foregroundClient];
  id v9 = [(FBKSeedPortalAPI *)self generateDeviceTokenForRemoteURL];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __58__FBKSeedPortalAPI_getRemoteDeviceTokenWithSuccess_error___block_invoke;
  v12[3] = &unk_264874C10;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 postToURL:v9 parameters:MEMORY[0x263EFFA78] encoding:0 success:v12 error:v10];
}

void __58__FBKSeedPortalAPI_getRemoteDeviceTokenWithSuccess_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = 0;
  id v3 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v8];
  id v4 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = NSString;
    id v6 = [v3 objectForKeyedSubscript:@"token"];
    id v7 = [v5 stringWithString:v6];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)hostUrl
{
  uint64_t v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)getFileDownloadURLForFilePromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self filePromiseDownloadURLForUUID:a3];
  id v8 = [(FBKSeedPortalAPI *)self foregroundClient];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke;
  v12[3] = &unk_264874C38;
  id v13 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_275;
  v10[3] = &unk_2648743D8;
  id v11 = v13;
  id v9 = v13;
  [v8 dataForURL:v7 successWithResponse:v12 error:v10];
}

void __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 allHeaderFields];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"Location"];

  if (v5)
  {
    id v6 = [NSURL URLWithString:v5];
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = Log_1();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    id v6 = FBKErrorOfType(-1012);
    id v7 = *(void (**)(void))(v9 + 16);
  }
  v7();
}

uint64_t __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_275(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteFilePromiseWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKSeedPortalAPI *)self filePromiseDeleteURLForUUID:a3];
  id v8 = [(FBKSeedPortalAPI *)self foregroundClient];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke;
  v12[3] = &unk_264874918;
  id v13 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2648743D8;
  id v11 = v13;
  id v9 = v13;
  [v8 deleteResourceAtURL:v7 success:v12 error:v10];
}

uint64_t __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performHeartbeatWithSuccess:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self foregroundClient];
  id v9 = [(FBKSeedPortalAPI *)self heartbeatURL];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__FBKSeedPortalAPI_performHeartbeatWithSuccess_error___block_invoke;
  v11[3] = &unk_264874710;
  id v12 = v6;
  id v10 = v6;
  [v8 jsonForURL:v9 success:v11 error:v7];
}

uint64_t __54__FBKSeedPortalAPI_performHeartbeatWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)respondToConsent:(id)a3 didAgree:(BOOL)a4 success:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  void v25[4] = *MEMORY[0x263EF8340];
  id v10 = a5;
  v24[0] = @"type";
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [v12 consentTypeString];
  id v14 = (void *)v13;
  id v15 = @"unknown";
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  v25[0] = v15;
  v24[1] = @"id";
  id v16 = [v12 ID];

  v25[1] = v16;
  v25[2] = MEMORY[0x263EFFA68];
  v24[2] = @"agreement_ids";
  v24[3] = @"agree";
  id v17 = [NSNumber numberWithBool:v7];
  v25[3] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

  id v19 = [(FBKSeedPortalAPI *)self foregroundClient];
  id v20 = [(FBKSeedPortalAPI *)self pendingConsentURL];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__FBKSeedPortalAPI_respondToConsent_didAgree_success_error___block_invoke;
  v22[3] = &unk_264874918;
  id v23 = v10;
  id v21 = v10;
  [v19 postToURL:v20 parameters:v18 encoding:2 success:v22 error:v11];
}

uint64_t __60__FBKSeedPortalAPI_respondToConsent_didAgree_success_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)managedObjectContext
{
  id v3 = [(FBKSeedPortalAPI *)self loginManager];
  uint64_t v4 = [v3 loginState];

  if (v4)
  {
    uint64_t v5 = [(FBKSeedPortalAPI *)self _managedObjectContext];
  }
  else
  {
    id v6 = +[FBKLog net];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "sp2 will return nil managed object context because FBK is logged out", v8, 2u);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_filterForValue
{
  v4.receiver = self;
  v4.super_class = (Class)FBKSeedPortalAPI;
  uint64_t v2 = [(FBKSSeedPortalAPI *)&v4 _filterForValue];

  return v2;
}

- (id)saveChangesIntoContext:(id)a3 URLUsed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKSeedPortalAPI *)self loginManager];
  uint64_t v9 = [v8 loginState];

  if (v9)
  {
    *(void *)buf = 0;
    id v18 = buf;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    id v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__FBKSeedPortalAPI_saveChangesIntoContext_URLUsed___block_invoke;
    v13[3] = &unk_264874C60;
    id v14 = v6;
    id v16 = buf;
    id v15 = v7;
    [v14 performBlockAndWait:v13];
    id v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v11 = +[FBKLog net];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "not logged in, will not save changes", buf, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

void __51__FBKSeedPortalAPI_saveChangesIntoContext_URLUsed___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v3 + 40);
    [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_super v4 = Log_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) path];
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code];
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
      *(_DWORD *)buf = 138544386;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_error_impl(&dword_22A36D000, v4, OS_LOG_TYPE_ERROR, "Error saving to context: [%{public}@] endpoint: [%{public}@] domain: [%{public}@] error code [%li] reason [%{public}@]", buf, 0x34u);
    }
  }
}

- (FBKLoginManager)loginManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loginManager);

  return (FBKLoginManager *)WeakRetained;
}

- (void)setLoginManager:(id)a3
{
}

- (FBKForegroundDataClient)foregroundClient
{
  return self->_foregroundClient;
}

- (void)setForegroundClient:(id)a3
{
}

- (NSMutableArray)deletedResponseIDs
{
  return self->_deletedResponseIDs;
}

- (void)setDeletedResponseIDs:(id)a3
{
}

- (FBKUser)loggedInUser
{
  return self->_loggedInUser;
}

- (void)setLoggedInUser:(id)a3
{
}

- (NSManagedObjectContext)_managedObjectContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__managedObjectContext);

  return (NSManagedObjectContext *)WeakRetained;
}

- (void)set_managedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__managedObjectContext);
  objc_storeStrong((id *)&self->_loggedInUser, 0);
  objc_storeStrong((id *)&self->_deletedResponseIDs, 0);
  objc_storeStrong((id *)&self->_foregroundClient, 0);

  objc_destroyWeak((id *)&self->_loginManager);
}

+ (NSString)upsertedKey
{
  uint64_t v2 = (void *)sub_22A4B3418();

  return (NSString *)v2;
}

+ (NSString)deletedKey
{
  uint64_t v2 = (void *)sub_22A4B3418();

  return (NSString *)v2;
}

+ (NSString)itemsKey
{
  uint64_t v2 = (void *)sub_22A4B3418();

  return (NSString *)v2;
}

- (void)envelopedGETForURL:(id)a3 success:(id)a4 errorHandler:(id)a5
{
  uint64_t v8 = sub_22A4B24C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  __int16 v13 = _Block_copy(a5);
  sub_22A4B2488();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  id v16 = self;
  sub_22A40B480((uint64_t)v11, (uint64_t)sub_22A40F960, v14, (uint64_t)sub_22A40F8A8, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)envelopedPUTForURL:(id)a3 parameters:(id)a4 success:(id)a5 errorHandler:(id)a6
{
  uint64_t v9 = sub_22A4B24C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v13 = _Block_copy(a5);
  uint64_t v14 = _Block_copy(a6);
  sub_22A4B2488();
  uint64_t v15 = sub_22A4B33F8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  uint64_t v18 = self;
  sub_22A40BB9C((uint64_t)v12, v15, (uint64_t)sub_22A40F960, v16, (uint64_t)sub_22A40F8A8, v17);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)envelopedPOSTForURL:(id)a3 parameters:(id)a4 success:(id)a5 errorHandler:(id)a6
{
  uint64_t v9 = sub_22A4B24C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v13 = _Block_copy(a5);
  uint64_t v14 = _Block_copy(a6);
  sub_22A4B2488();
  uint64_t v15 = sub_22A4B33F8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  uint64_t v18 = self;
  sub_22A40C084((uint64_t)v12, v15, (uint64_t)sub_22A40F960, v16, (uint64_t)sub_22A40F8A8, v17);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)envelopedDELETEForURL:(id)a3 success:(id)a4 errorHandler:(id)a5
{
  uint64_t v8 = sub_22A4B24C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  __int16 v13 = _Block_copy(a5);
  sub_22A4B2488();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  uint64_t v16 = self;
  sub_22A40C56C((uint64_t)v11, (uint64_t)sub_22A40F960, v14, (uint64_t)sub_22A40F8A8, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)handleDataResponseFor:(id)a3 data:(id)a4 success:(id)a5 errorHandler:(id)a6
{
  uint64_t v9 = sub_22A4B24C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __int16 v13 = _Block_copy(a5);
  uint64_t v14 = _Block_copy(a6);
  sub_22A4B2488();
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  sub_22A4B3968();
  swift_unknownObjectRelease();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  *(void *)(swift_allocObject() + 16) = v14;
  sub_22A40CBB8((uint64_t)v12, (uint64_t)v17, (uint64_t)sub_22A40EFC0, v16, (void (*)(void))sub_22A40EFC8);

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)envelopedObjectFrom:(id)a3
{
  uint64_t v4 = sub_22A4B33F8();
  uint64_t v5 = self;
  sub_22A40E168(v4, (uint64_t)v13);

  swift_bridgeObjectRelease();
  uint64_t v6 = v14;
  if (v14)
  {
    id v7 = __swift_project_boxed_opaque_existential_0(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v7);
    uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    uint64_t v11 = (void *)sub_22A4B3D18();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSURL)teamsURL
{
  uint64_t v3 = sub_22A4B24C8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = self;
  uint64_t v11 = [(FBKSSeedPortalAPI *)v10 feedbackURL];
  sub_22A4B2488();

  sub_22A4B2478();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);

  __int16 v13 = (void *)sub_22A4B2458();
  v12(v9, v3);

  return (NSURL *)v13;
}

- (id)contentItemsURLForTeamID:(id)a3
{
  uint64_t v5 = sub_22A4B24C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  uint64_t v10 = self;
  sub_22A429B28(v9, (uint64_t)v8);

  uint64_t v11 = (void *)sub_22A4B2458();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (id)formItemsURLForTeamID:(id)a3 formTat:(id)a4
{
  uint64_t v7 = sub_22A4B24C8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_22A429E90(v11, a4, (uint64_t)v10);

  uint64_t v14 = (void *)sub_22A4B2458();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)bugFormURLForID:(id)a3 teamID:(id)a4
{
  return sub_22A42A460(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_bugFormURLForID_);
}

- (id)createResponseURLForBugFormID:(id)a3 teamID:(id)a4
{
  return sub_22A42A460(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_createResponseURLForBugFormID_);
}

- (id)promoteURLForTeamID:(id)a3
{
  return sub_22A42A620(self, (uint64_t)a2, a3, 0x6F736A2E65766F6DLL, 0xE90000000000006ELL);
}

- (id)demoteURLForTeamID:(id)a3
{
  return sub_22A42A620(self, (uint64_t)a2, a3, 0x6A2E65746F6D6564, 0xEB000000006E6F73);
}

- (id)participantsURLForTeamID:(id)a3
{
  return sub_22A42A620(self, (uint64_t)a2, a3, 0x7069636974726170, 0xEC00000073746E61);
}

- (id)assignURLForTeamID:(id)a3 participantID:(id)a4
{
  uint64_t v7 = sub_22A4B24C8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_22A42A9B0((uint64_t)v11, v12);

  uint64_t v14 = (void *)sub_22A4B2458();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (void)updateTeamsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_22A42F52C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  FBKSeedPortalAPI.updateTeams(completion:)((uint64_t)v7, v6);
  sub_22A42F47C((uint64_t)v7);
}

- (void)promoteFeedback:(id)a3 toTeamID:(int64_t)a4 success:(id)a5 error:(id)a6
{
  uint64_t v9 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v10 = (uint64_t (*)())_Block_copy(a6);
  uint64_t v11 = sub_22A4B3628();
  if (v9)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v9;
    uint64_t v9 = sub_22A42F964;
    if (v10)
    {
LABEL_3:
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v10;
      uint64_t v10 = sub_22A40F8A8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = self;
  FBKSeedPortalAPI.promoteFeedback(feedbackIDs:toTeamID:success:error:)(v11, a4, (uint64_t)v9, v12, (uint64_t)v10, v13);
  sub_22A42F47C((uint64_t)v10);
  sub_22A42F47C((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)demoteFeedback:(id)a3 fromTeamID:(int64_t)a4 success:(id)a5 error:(id)a6
{
  uint64_t v9 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v10 = (uint64_t (*)())_Block_copy(a6);
  uint64_t v11 = sub_22A4B3628();
  if (v9)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v9;
    uint64_t v9 = sub_22A42F964;
    if (v10)
    {
LABEL_3:
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v10;
      uint64_t v10 = sub_22A40F8A8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = self;
  FBKSeedPortalAPI.demoteFeedback(feedbackIDs:fromTeamID:success:error:)(v11, a4, (uint64_t)v9, v12, (uint64_t)v10, v13);
  sub_22A42F47C((uint64_t)v10);
  sub_22A42F47C((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)getParticipantsForTeamID:(int64_t)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = _Block_copy(a4);
  uint64_t v9 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    uint64_t v8 = sub_22A42F4F8;
    if (v10)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v10;
      uint64_t v10 = sub_22A40F8A8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = self;
  FBKSeedPortalAPI.getParticipants(teamID:success:error:)(a3, (uint64_t)v8, v11, (uint64_t)v10, v12);
  sub_22A42F47C((uint64_t)v10);
  sub_22A42F47C((uint64_t)v8);
}

- (void)assignFeedback:(id)a3 inTeamID:(int64_t)a4 toParticipantID:(int64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v11 = _Block_copy(a6);
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = sub_22A4B3628();
  if (v11)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v11;
    uint64_t v11 = sub_22A42F4C4;
    if (v12)
    {
LABEL_3:
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = v12;
      uint64_t v12 = sub_22A40EFC8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = self;
  FBKSeedPortalAPI.assignFeedback(feedbackIDs:inTeamID:toParticipantID:success:error:)(v13, a4, a5, (uint64_t)v11, v14, (uint64_t)v12, v15);
  sub_22A42F47C((uint64_t)v12);
  sub_22A42F47C((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (id)wrapFeedbackIDs:(id)a3
{
  uint64_t v3 = sub_22A4B3628();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683763A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A4BF070;
  strcpy((char *)(inited + 32), "feedback_ids");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 48) = v3;
  sub_22A41A05C(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268376398);
  uint64_t v5 = (void *)sub_22A4B33E8();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)didLogInWithLoginUserInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_22A36D000, v0, OS_LOG_TYPE_FAULT, "Private queue context is nil after logging in", v1, 2u);
}

void __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Could not fetch private queue context user", v2, v3, v4, v5, v6);
}

- (void)seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "adsid: %{private}@", v2, v3, v4, v5, v6);
}

- (void)seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "BetaToken: %{private}@", v2, v3, v4, v5, v6);
}

- (void)seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "IDMS Tokens: %{private}@", v2, v3, v4, v5, v6);
}

- (void)seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "IDMS Tokens returned did not contain beta.auth token.", v2, v3, v4, v5, v6);
}

- (void)seedPortalLoginWithAppleConnectSession:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "AppleConnect headers: %@", v2, v3, v4, v5, v6);
}

- (void)seedPortalLoginAsAnonymousUserWithConfigurationToken:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Encountered an error serializing JSON: %@", v2, v3, v4, v5, v6);
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "bad data format in forms index", v2, v3, v4, v5, v6);
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "in stub forms loaded", v2, v3, v4, v5, v6);
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_180_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "updateForms core data error [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)updateContentItemsForTeam:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "Using URL with form identifiers [%{public}@]", v2, v3, v4, v5, v6);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Purging old contents failed. [%{public}@]", v2, v3, v4, v5, v6);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Fetching contents to purge failed. [%{public}@]", v2, v3, v4, v5, v6);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Saving contents failed. [%{public}@]", v2, v3, v4, v5, v6);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_207_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "HTTP client returned error. [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)deleteFormResponseWithID:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Given nil FormResponse ID to delete", v2, v3, v4, v5, v6);
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 ID];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl(&dword_22A36D000, a4, OS_LOG_TYPE_FAULT, "No existing answer for question [%{public}@]", a1, 0xCu);
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_2(void *a1, id *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 managedObjectContext];
  uint8_t v6 = [v5 description];
  uint64_t v7 = [*a2 managedObjectContext];
  uint64_t v8 = [v7 description];
  int v9 = 138543618;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "Form response context is %{public}@, but bug form context is %{public}@", (uint8_t *)&v9, 0x16u);
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 ID];
  v4[0] = 67109120;
  v4[1] = [v3 intValue];
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "nil upserted item for new FR [%i]", (uint8_t *)v4, 8u);
}

- (void)saveAnswersForFormResponseWithID:answers:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "Saving answers [%{private}@]", v2, v3, v4, v5, v6);
}

void __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2_cold_1(id *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [*a1 intValue];
  uint8_t v6 = [a2 ID];
  v7[0] = 67109376;
  v7[1] = v5;
  __int16 v8 = 1024;
  int v9 = [v6 intValue];
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "Could not find FR [%i] for upserted Feedback Item [%i]", (uint8_t *)v7, 0xEu);
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "bad data format in announcement fetch", v2, v3, v4, v5, v6);
}

void __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Failed to get download path from redirected link.", v2, v3, v4, v5, v6);
}

@end