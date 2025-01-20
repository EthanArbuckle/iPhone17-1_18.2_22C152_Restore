@interface ENSession
+ (BOOL)checkSharedSessionSettings;
+ (ENSession)sharedSession;
+ (id)bundleSeedID;
+ (id)consumerKey;
+ (id)consumerSecret;
+ (id)developerToken;
+ (id)keychainAccessGroup;
+ (id)sessionHostOverride;
+ (void)setDisableRefreshingNotebooksCacheOnLaunch:(BOOL)a3;
+ (void)setKeychainGroup:(id)a3;
+ (void)setSecurityApplicationGroupIdentifier:(id)a3;
+ (void)setSharedSessionConsumerKey:(id)a3 consumerSecret:(id)a4 optionalHost:(id)a5;
+ (void)setSharedSessionDeveloperToken:(id)a3 noteStoreUrl:(id)a4;
- (BOOL)appNotebookIsLinked;
- (BOOL)handleOpenURL:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isAuthenticationInProgress;
- (BOOL)isBusinessUser;
- (BOOL)isErrorDueToRestrictedAuth:(id)a3;
- (BOOL)isPremiumUser;
- (BOOL)supportsLinkedAppNotebook;
- (EDAMUser)businessUser;
- (EDAMUser)user;
- (ENAuthCache)authCache;
- (ENAuthenticator)authenticator;
- (ENBusinessNoteStoreClient)businessNoteStore;
- (ENNoteStoreClient)primaryNoteStore;
- (ENPreferencesStore)preferences;
- (ENSDKLogging)logger;
- (ENSession)init;
- (ENUserStoreClient)userStore;
- (ENUserStoreClient)userStorePendingRevocation;
- (NSArray)notebooksCache;
- (NSDate)notebooksCacheDate;
- (NSString)businessDisplayName;
- (NSString)primaryAuthenticationToken;
- (NSString)sessionHost;
- (NSString)sourceApplication;
- (NSString)userDisplayName;
- (OS_dispatch_queue)thumbnailQueue;
- (id)authenticationCompletion;
- (id)authenticationTokenForBusinessStoreClient:(id)a3;
- (id)authenticationTokenForLinkedNotebookRef:(id)a3;
- (id)authenticationTokenForNoteRef:(id)a3;
- (id)authorizationBlock;
- (id)credentialStore;
- (id)credentialsForHost:(id)a3;
- (id)currentProfileName;
- (id)noteStoreForLinkedNotebook:(id)a3;
- (id)noteStoreForNoteRef:(id)a3;
- (id)noteStoreForNotebook:(id)a3;
- (id)noteStoreUrlForBusinessStoreClient:(id)a3;
- (id)primaryCredentials;
- (id)shardIdForNoteRef:(id)a3;
- (id)userStoreClientForBootstrapping;
- (id)userStoreUrl;
- (id)validBusinessAuthenticationResult;
- (int)userID;
- (int64_t)businessUploadLimit;
- (int64_t)businessUploadUsage;
- (int64_t)personalUploadLimit;
- (int64_t)personalUploadUsage;
- (void)addCredentials:(id)a3;
- (void)authenticateWithAuthorizationBlock:(id)a3 preferRegistration:(BOOL)a4 completion:(id)a5;
- (void)authenticatorDidAuthenticateWithCredentials:(id)a3 authInfo:(id)a4;
- (void)authenticatorShouldShowAuthorizationUIWithURL:(id)a3 callbackPrefix:(id)a4 completionBlock:(id)a5;
- (void)completeAuthenticationWithError:(id)a3;
- (void)dealloc;
- (void)deleteNote:(id)a3 completion:(id)a4;
- (void)downloadNote:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)downloadThumbnailForNote:(id)a3 maxDimension:(unint64_t)a4 completion:(id)a5;
- (void)findNotesWithSearch:(id)a3 inNotebook:(id)a4 orScope:(unint64_t)a5 sortOrder:(unint64_t)a6 maxResults:(unint64_t)a7 completion:(id)a8;
- (void)findNotes_completeWithContext:(id)a3 error:(id)a4;
- (void)findNotes_findInBusinessScopeWithContext:(id)a3;
- (void)findNotes_findInLinkedScopeWithContext:(id)a3;
- (void)findNotes_findInPersonalScopeWithContext:(id)a3;
- (void)findNotes_listNotebooksWithContext:(id)a3;
- (void)findNotes_nextFindInLinkedScopeWithContext:(id)a3;
- (void)findNotes_processResultsWithContext:(id)a3;
- (void)listNotebooksWithCompletion:(id)a3;
- (void)listNotebooks_cleanCache;
- (void)listNotebooks_completePendingSharedNotebookWithContext:(id)a3;
- (void)listNotebooks_completeWithContext:(id)a3 error:(id)a4;
- (void)listNotebooks_fetchBusinessNotebooksWithContext:(id)a3;
- (void)listNotebooks_fetchSharedBusinessNotebooksWithContext:(id)a3;
- (void)listNotebooks_fetchSharedNotebooksWithContext:(id)a3;
- (void)listNotebooks_listLinkedNotebooksWithContext:(id)a3;
- (void)listNotebooks_listNotebooksWithContext:(id)a3;
- (void)listNotebooks_listSharedNotebooksWithContext:(id)a3;
- (void)listNotebooks_prepareResultsWithContext:(id)a3;
- (void)listNotebooks_processBusinessNotebooksWithContext:(id)a3;
- (void)listNotebooks_processSharedNotebooksWithContext:(id)a3;
- (void)listWritableNotebooksWithCompletion:(id)a3;
- (void)notifyAuthenticationChanged;
- (void)performPostAuthentication;
- (void)refreshUploadUsage;
- (void)saveCredentialStore:(id)a3;
- (void)selectInitialSessionHost;
- (void)setAuthCache:(id)a3;
- (void)setAuthenticationCompletion:(id)a3;
- (void)setAuthenticator:(id)a3;
- (void)setAuthorizationBlock:(id)a3;
- (void)setBusinessNoteStore:(id)a3;
- (void)setBusinessUploadLimit:(int64_t)a3;
- (void)setBusinessUploadUsage:(int64_t)a3;
- (void)setBusinessUser:(id)a3;
- (void)setCurrentProfileNameFromHost:(id)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setNotebooksCache:(id)a3;
- (void)setNotebooksCacheDate:(id)a3;
- (void)setPersonalUploadLimit:(int64_t)a3;
- (void)setPersonalUploadUsage:(int64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setPrimaryAuthenticationToken:(id)a3;
- (void)setPrimaryNoteStore:(id)a3;
- (void)setSessionHost:(id)a3;
- (void)setSourceApplication:(id)a3;
- (void)setSupportsLinkedAppNotebook:(BOOL)a3;
- (void)setThumbnailQueue:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserStore:(id)a3;
- (void)setUserStorePendingRevocation:(id)a3;
- (void)shareNote:(id)a3 completion:(id)a4;
- (void)startup;
- (void)storeClientFailedAuthentication:(id)a3;
- (void)unauthenticate;
- (void)unauthenticateAndRevokeAccessToken:(BOOL)a3;
- (void)unauthenticateWithoutRevokingAccessToken;
- (void)uploadNote:(id)a3 notebook:(id)a4 completion:(id)a5;
- (void)uploadNote:(id)a3 policy:(int64_t)a4 toNotebook:(id)a5 orReplaceNote:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)uploadNote_completeWithContext:(id)a3 error:(id)a4;
- (void)uploadNote_createWithContext:(id)a3;
- (void)uploadNote_determineDestinationWithContext:(id)a3;
- (void)uploadNote_findLinkedAppNotebookWithContext:(id)a3;
- (void)uploadNote_findSharedAppNotebookWithContext:(id)a3;
- (void)uploadNote_updateWithContext:(id)a3;
@end

@implementation ENSession

- (void)authenticateWithAuthorizationBlock:(id)a3 preferRegistration:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v21 = a3;
  v8 = (void (**)(id, void))a5;
  if (v8)
  {
    if ([(ENSession *)self isAuthenticated])
    {
      v8[2](v8, 0);
    }
    else
    {
      v9 = [(ENSession *)self authenticator];

      if (v9)
      {
        v10 = +[ENSession sharedSession];
        v11 = [v10 logger];
        v12 = [NSString stringWithFormat:@"Cannot restart authentication while it is still in progress."];
        [v11 evernoteLogInfoString:v12];

        v13 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:0 userInfo:0];
        ((void (**)(id, void *))v8)[2](v8, v13);
      }
      else
      {
        [(ENSession *)self setUser:0];
        [(ENSession *)self setAuthorizationBlock:v21];
        [(ENSession *)self setAuthenticationCompletion:v8];
        v14 = +[ENSession developerToken];

        if (v14)
        {
          [(ENSession *)self setIsAuthenticated:1];
          v15 = +[ENSession developerToken];
          [(ENSession *)self setPrimaryAuthenticationToken:v15];

          [(ENSession *)self performPostAuthentication];
        }
        else
        {
          v16 = objc_alloc_init(ENOAuthAuthenticator);
          [(ENOAuthAuthenticator *)v16 setDelegate:self];
          v17 = +[ENSession consumerKey];
          [(ENOAuthAuthenticator *)v16 setConsumerKey:v17];

          v18 = +[ENSession consumerSecret];
          [(ENOAuthAuthenticator *)v16 setConsumerSecret:v18];

          v19 = [(ENSession *)self sessionHost];
          [(ENOAuthAuthenticator *)v16 setHost:v19];

          [(ENOAuthAuthenticator *)v16 setSupportsLinkedAppNotebook:[(ENSession *)self supportsLinkedAppNotebook]];
          [(ENOAuthAuthenticator *)v16 setPreferRegistration:v6];
          v20 = +[ENSession sessionHostOverride];
          [(ENOAuthAuthenticator *)v16 setUseWebAuthenticationOnly:v20 != 0];

          [(ENOAuthAuthenticator *)v16 authenticate];
          [(ENSession *)self setAuthenticator:v16];
        }
      }
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"handler required"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorePendingRevocation, 0);
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
  objc_storeStrong((id *)&self->_notebooksCacheDate, 0);
  objc_storeStrong((id *)&self->_notebooksCache, 0);
  objc_storeStrong((id *)&self->_authCache, 0);
  objc_storeStrong((id *)&self->_businessNoteStore, 0);
  objc_storeStrong((id *)&self->_primaryNoteStore, 0);
  objc_storeStrong((id *)&self->_userStore, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_businessUser, 0);
  objc_storeStrong((id *)&self->_primaryAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_sessionHost, 0);
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong(&self->_authorizationBlock, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setUserStorePendingRevocation:(id)a3
{
}

- (ENUserStoreClient)userStorePendingRevocation
{
  return self->_userStorePendingRevocation;
}

- (void)setThumbnailQueue:(id)a3
{
}

- (OS_dispatch_queue)thumbnailQueue
{
  return self->_thumbnailQueue;
}

- (void)setNotebooksCacheDate:(id)a3
{
}

- (NSDate)notebooksCacheDate
{
  return self->_notebooksCacheDate;
}

- (void)setNotebooksCache:(id)a3
{
}

- (NSArray)notebooksCache
{
  return self->_notebooksCache;
}

- (void)setAuthCache:(id)a3
{
}

- (void)setBusinessNoteStore:(id)a3
{
}

- (void)setPrimaryNoteStore:(id)a3
{
}

- (void)setUserStore:(id)a3
{
}

- (void)setPreferences:(id)a3
{
}

- (ENPreferencesStore)preferences
{
  return self->_preferences;
}

- (void)setBusinessUser:(id)a3
{
}

- (EDAMUser)businessUser
{
  return self->_businessUser;
}

- (void)setSupportsLinkedAppNotebook:(BOOL)a3
{
  self->_supportsLinkedAppNotebook = a3;
}

- (BOOL)supportsLinkedAppNotebook
{
  return self->_supportsLinkedAppNotebook;
}

- (void)setPrimaryAuthenticationToken:(id)a3
{
}

- (NSString)primaryAuthenticationToken
{
  return self->_primaryAuthenticationToken;
}

- (void)setUser:(id)a3
{
}

- (EDAMUser)user
{
  return self->_user;
}

- (void)setSessionHost:(id)a3
{
}

- (NSString)sessionHost
{
  return self->_sessionHost;
}

- (void)setAuthenticationCompletion:(id)a3
{
}

- (id)authenticationCompletion
{
  return self->_authenticationCompletion;
}

- (void)setAuthorizationBlock:(id)a3
{
}

- (id)authorizationBlock
{
  return self->_authorizationBlock;
}

- (void)setAuthenticator:(id)a3
{
}

- (ENAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setBusinessUploadLimit:(int64_t)a3
{
  self->_businessUploadLimit = a3;
}

- (int64_t)businessUploadLimit
{
  return self->_businessUploadLimit;
}

- (void)setBusinessUploadUsage:(int64_t)a3
{
  self->_businessUploadUsage = a3;
}

- (int64_t)businessUploadUsage
{
  return self->_businessUploadUsage;
}

- (void)setPersonalUploadLimit:(int64_t)a3
{
  self->_personalUploadLimit = a3;
}

- (int64_t)personalUploadLimit
{
  return self->_personalUploadLimit;
}

- (void)setPersonalUploadUsage:(int64_t)a3
{
  self->_personalUploadUsage = a3;
}

- (int64_t)personalUploadUsage
{
  return self->_personalUploadUsage;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setSourceApplication:(id)a3
{
}

- (void)setLogger:(id)a3
{
}

- (ENSDKLogging)logger
{
  return self->_logger;
}

- (void)storeClientFailedAuthentication:(id)a3
{
  v4 = [a3 object];
  v5 = [(ENSession *)self primaryNoteStore];

  if (v4 == v5)
  {
    BOOL v6 = +[ENSession sharedSession];
    v7 = [v6 logger];
    v8 = [NSString stringWithFormat:@"Primary note store operation failed authentication. Unauthenticating."];
    [v7 evernoteLogErrorString:v8];

    [(ENSession *)self unauthenticate];
  }
}

- (void)authenticatorDidAuthenticateWithCredentials:(id)a3 authInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ENSession *)self setIsAuthenticated:1];
  [(ENSession *)self addCredentials:v7];
  v8 = [v7 host];
  [(ENSession *)self setCurrentProfileNameFromHost:v8];

  v9 = [v7 host];
  [(ENSession *)self setSessionHost:v9];

  v10 = [v7 authenticationToken];

  [(ENSession *)self setPrimaryAuthenticationToken:v10];
  v11 = [v6 objectForKey:@"ENOAuthAuthenticatorAuthInfoAppNotebookIsLinked"];

  LODWORD(v6) = [v11 BOOLValue];
  if (v6)
  {
    v12 = [(ENSession *)self preferences];
    [v12 setObject:MEMORY[0x263EFFA88] forKey:@"AppNotebookIsLinked"];
  }
  [(ENSession *)self performPostAuthentication];
}

- (void)authenticatorShouldShowAuthorizationUIWithURL:(id)a3 callbackPrefix:(id)a4 completionBlock:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(ENSession *)self authorizationBlock];

  if (v10)
  {
    v11 = [(ENSession *)self authorizationBlock];
    ((void (**)(void, id, id, id))v11)[2](v11, v12, v8, v9);
  }
}

- (id)userStoreClientForBootstrapping
{
  v2 = [(ENSession *)self userStoreUrl];
  v3 = +[ENUserStoreClient userStoreClientWithUrl:v2 authenticationToken:0];

  return v3;
}

- (id)authenticationTokenForLinkedNotebookRef:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ENSession.m" lineNumber:1842 description:@"Cannot authenticate to linked notebook on main thread"];
  }
  id v6 = [v5 sharedNotebookGlobalId];

  if (v6)
  {
    id v7 = [(ENSession *)self authCache];
    id v8 = [v5 guid];
    id v9 = [v7 authenticationResultForLinkedNotebookGuid:v8];

    if (!v9)
    {
      v10 = [v5 noteStoreUrl];
      v11 = [(ENSession *)self primaryAuthenticationToken];
      id v12 = +[ENNoteStoreClient noteStoreClientWithUrl:v10 authenticationToken:v11];

      v13 = [v5 sharedNotebookGlobalId];
      id v9 = [v12 authenticateToSharedNotebookWithGlobalId:v13];

      v14 = [(ENSession *)self authCache];
      v15 = [v5 guid];
      [v14 setAuthenticationResult:v9 forLinkedNotebookGuid:v15];
    }
    v16 = [v9 authenticationToken];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)noteStoreUrlForBusinessStoreClient:(id)a3
{
  v3 = [(ENSession *)self validBusinessAuthenticationResult];
  v4 = [v3 noteStoreUrl];

  return v4;
}

- (id)authenticationTokenForBusinessStoreClient:(id)a3
{
  v3 = [(ENSession *)self validBusinessAuthenticationResult];
  v4 = [v3 authenticationToken];

  return v4;
}

- (id)userStoreUrl
{
  v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@".*:[0-9]+" options:1 error:0];
  v4 = [(ENSession *)self sessionHost];
  id v5 = [(ENSession *)self sessionHost];
  uint64_t v6 = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v5, "length"));

  id v7 = @"http";
  if (!v6) {
    id v7 = @"https";
  }
  id v8 = NSString;
  id v9 = v7;
  v10 = [(ENSession *)self sessionHost];
  v11 = [v8 stringWithFormat:@"%@://%@/edam/user", v9, v10];

  return v11;
}

- (void)setCurrentProfileNameFromHost:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:@"www.evernote.com"])
  {
    v4 = @"Evernote";
  }
  else if ([v6 isEqualToString:@"app.yinxiang.com"])
  {
    v4 = @"Evernote-China";
  }
  else
  {
    v4 = 0;
  }
  id v5 = [(ENSession *)self preferences];
  [v5 setObject:v4 forKey:@"CurrentProfileName"];
}

- (id)currentProfileName
{
  v2 = [(ENSession *)self preferences];
  v3 = [v2 objectForKey:@"CurrentProfileName"];

  return v3;
}

- (id)authenticationTokenForNoteRef:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ENSession.m" lineNumber:1769 description:@"Cannot get auth token on main thread"];
  }
  if (![v5 type])
  {
    id v8 = [(ENSession *)self primaryAuthenticationToken];
    goto LABEL_11;
  }
  if ([v5 type] == 1)
  {
    id v6 = [(ENSession *)self validBusinessAuthenticationResult];
    uint64_t v7 = [v6 authenticationToken];
LABEL_9:
    id v8 = (void *)v7;

    goto LABEL_11;
  }
  if ([v5 type] == 2)
  {
    id v6 = [v5 linkedNotebook];
    uint64_t v7 = [(ENSession *)self authenticationTokenForLinkedNotebookRef:v6];
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)shardIdForNoteRef:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    id v5 = [(ENSession *)self user];
    goto LABEL_7;
  }
  if ([v4 type] == 1)
  {
    id v5 = [(ENSession *)self businessUser];
LABEL_7:
    id v6 = v5;
    uint64_t v7 = [v5 shardId];

    goto LABEL_8;
  }
  if ([v4 type] == 2)
  {
    id v5 = [v4 linkedNotebook];
    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (id)noteStoreForNotebook:(id)a3
{
  id v4 = a3;
  if ([v4 isBusinessNotebook])
  {
    uint64_t v5 = [(ENSession *)self businessNoteStore];
  }
  else
  {
    if ([v4 isLinked])
    {
      id v6 = [v4 linkedNotebook];
      uint64_t v7 = [(ENSession *)self noteStoreForLinkedNotebook:v6];

      goto LABEL_7;
    }
    uint64_t v5 = [(ENSession *)self primaryNoteStore];
  }
  uint64_t v7 = (void *)v5;
LABEL_7:

  return v7;
}

- (id)noteStoreForNoteRef:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    uint64_t v5 = [(ENSession *)self primaryNoteStore];
    goto LABEL_5;
  }
  if ([v4 type] == 1)
  {
    uint64_t v5 = [(ENSession *)self businessNoteStore];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([v4 type] == 2)
  {
    id v8 = [v4 linkedNotebook];
    id v6 = +[ENLinkedNoteStoreClient noteStoreClientForLinkedNotebookRef:v8];

    [v6 setDelegate:self];
  }
  else
  {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

- (id)noteStoreForLinkedNotebook:(id)a3
{
  id v4 = +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:a3];
  uint64_t v5 = +[ENLinkedNoteStoreClient noteStoreClientForLinkedNotebookRef:v4];
  [v5 setDelegate:self];

  return v5;
}

- (ENBusinessNoteStoreClient)businessNoteStore
{
  if (!self->_businessNoteStore && [(ENSession *)self isBusinessUser])
  {
    v3 = +[ENBusinessNoteStoreClient noteStoreClientForBusiness];
    [(ENBusinessNoteStoreClient *)v3 setDelegate:self];
    businessNoteStore = self->_businessNoteStore;
    self->_businessNoteStore = v3;
  }
  uint64_t v5 = self->_businessNoteStore;
  return v5;
}

- (ENNoteStoreClient)primaryNoteStore
{
  primaryNoteStore = self->_primaryNoteStore;
  if (!primaryNoteStore)
  {
    if (DeveloperToken)
    {
      +[ENNoteStoreClient noteStoreClientWithUrl:authenticationToken:](ENNoteStoreClient, "noteStoreClientWithUrl:authenticationToken:", NoteStoreUrl);
      id v4 = (ENNoteStoreClient *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = self->_primaryNoteStore;
      self->_primaryNoteStore = v4;
    }
    else
    {
      id v6 = [(ENSession *)self primaryCredentials];
      uint64_t v5 = v6;
      if (v6)
      {
        uint64_t v7 = [(ENNoteStoreClient *)v6 noteStoreUrl];
        id v8 = [(ENNoteStoreClient *)v5 authenticationToken];
        id v9 = +[ENNoteStoreClient noteStoreClientWithUrl:v7 authenticationToken:v8];
        v10 = self->_primaryNoteStore;
        self->_primaryNoteStore = v9;
      }
    }

    primaryNoteStore = self->_primaryNoteStore;
  }
  return primaryNoteStore;
}

- (ENUserStoreClient)userStore
{
  if (!self->_userStore)
  {
    v3 = [(ENSession *)self primaryAuthenticationToken];

    if (v3)
    {
      id v4 = [(ENSession *)self userStoreUrl];
      uint64_t v5 = [(ENSession *)self primaryAuthenticationToken];
      id v6 = +[ENUserStoreClient userStoreClientWithUrl:v4 authenticationToken:v5];
      userStore = self->_userStore;
      self->_userStore = v6;
    }
  }
  id v8 = self->_userStore;
  return v8;
}

- (void)notifyAuthenticationChanged
{
  BOOL v3 = [(ENSession *)self isAuthenticated];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = v4;
  if (v3) {
    uint64_t v5 = @"ENSessionDidAuthenticateNotification";
  }
  else {
    uint64_t v5 = @"ENSessionDidUnauthenticateNotification";
  }
  [v4 postNotificationName:v5 object:self];
}

- (ENAuthCache)authCache
{
  authCache = self->_authCache;
  if (!authCache)
  {
    id v4 = objc_alloc_init(ENAuthCache);
    uint64_t v5 = self->_authCache;
    self->_authCache = v4;

    authCache = self->_authCache;
  }
  return authCache;
}

- (id)validBusinessAuthenticationResult
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ENSession.m" lineNumber:1656 description:@"Cannot authenticate to business on main thread"];
  }
  id v4 = [(ENSession *)self authCache];
  uint64_t v5 = [v4 authenticationResultForBusiness];

  if (!v5)
  {
    id v6 = [(ENSession *)self userStore];
    uint64_t v5 = [v6 authenticateToBusiness];

    uint64_t v7 = [(ENSession *)self authCache];
    [v7 setAuthenticationResultForBusiness:v5];

    id v8 = [v5 user];
    [(ENSession *)self setBusinessUser:v8];

    id v9 = [(ENSession *)self preferences];
    v10 = [(ENSession *)self businessUser];
    [v9 encodeObject:v10 forKey:@"BusinessUser"];
  }
  return v5;
}

- (id)primaryCredentials
{
  BOOL v3 = [(ENSession *)self sessionHost];
  id v4 = [(ENSession *)self credentialsForHost:v3];

  return v4;
}

- (void)saveCredentialStore:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self preferences];
  [v5 encodeObject:v4 forKey:@"CredentialStore"];
}

- (void)addCredentials:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self credentialStore];
  [v5 addCredentials:v4];

  [(ENSession *)self saveCredentialStore:v5];
}

- (id)credentialsForHost:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self credentialStore];
  id v6 = [v5 credentialsForHost:v4];

  return v6;
}

- (id)credentialStore
{
  BOOL v3 = [(ENSession *)self preferences];
  id v4 = [v3 decodedObjectForKey:@"CredentialStore"];

  if (!v4)
  {
    uint64_t v5 = +[ENCredentialStore loadCredentialsFromAppDefaults];
    if (v5)
    {
      id v4 = (ENCredentialStore *)v5;
      id v6 = [(ENSession *)self preferences];
      [v6 encodeObject:v4 forKey:@"CredentialStore"];
    }
    else
    {
      id v4 = objc_alloc_init(ENCredentialStore);
    }
  }
  return v4;
}

- (BOOL)isErrorDueToRestrictedAuth:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"EDAMErrorCode"];
  int v6 = [v5 intValue];

  uint64_t v7 = [v3 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"parameter"];

  BOOL v9 = v6 == 3 && ([v8 isEqualToString:@"authenticationToken"] & 1) != 0;
  return v9;
}

- (void)downloadThumbnailForNote:(id)a3 maxDimension:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  BOOL v9 = (void (**)(id, void, void *))a5;
  if (!v9)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"handler required"];
    goto LABEL_12;
  }
  if (!v8)
  {
    id v12 = +[ENSession sharedSession];
    v13 = [v12 logger];
    v14 = [NSString stringWithFormat:@"noteRef parameter is required to get download thumbnail"];
    [v13 evernoteLogErrorString:v14];

    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 3;
LABEL_11:
    v17 = [v15 errorWithDomain:@"ENErrorDomain" code:v16 userInfo:0];
    v9[2](v9, 0, v17);

    goto LABEL_12;
  }
  if (![(ENSession *)self isAuthenticated])
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 2;
    goto LABEL_11;
  }
  if (a4 <= 0x12B) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = 0;
  }
  v11 = [(ENSession *)self thumbnailQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke;
  v18[3] = &unk_264E5A880;
  v18[4] = self;
  id v19 = v8;
  v20 = v9;
  unint64_t v21 = v10;
  dispatch_async(v11, v18);

LABEL_12:
}

void __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) authenticationTokenForNoteRef:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) shardIdForNoteRef:*(void *)(a1 + 40)];
  id v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    if (*(void *)(a1 + 56))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"?size=%lu", *(void *)(a1 + 56));
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    BOOL v9 = NSString;
    unint64_t v10 = [*(id *)(a1 + 32) sessionHost];
    uint64_t v11 = [*(id *)(a1 + 40) guid];
    id v12 = (void *)v11;
    v13 = &stru_26F008428;
    if (v8) {
      v13 = v8;
    }
    v14 = [v9 stringWithFormat:@"https://%@/shard/%@/thm/note/%@%@", v10, v4, v11, v13];

    v15 = NSString;
    uint64_t v16 = objc_msgSend(v2, "en_stringByUrlEncoding");
    v17 = [v15 stringWithFormat:@"auth=%@", v16];

    id v18 = objc_alloc(MEMORY[0x263EFC5E8]);
    id v19 = [NSURL URLWithString:v14];
    v20 = (void *)[v18 initWithURL:v19];

    [v20 setHTTPMethod:@"POST"];
    unint64_t v21 = [v17 dataUsingEncoding:4];
    [v20 setHTTPBody:v21];

    objc_msgSend(v20, "addValue:forHTTPHeaderField:", @"application/x-www-form-urlencoded;charset=UTF-8",
      @"Content-Type");
    v22 = NSString;
    v23 = [v20 HTTPBody];
    v24 = objc_msgSend(v22, "stringWithFormat:", @"%lu", objc_msgSend(v23, "length"));
    [v20 addValue:v24 forHTTPHeaderField:@"Content-Length"];

    v25 = [*(id *)(a1 + 32) sessionHost];
    [v20 addValue:v25 forHTTPHeaderField:@"Host"];

    id v37 = 0;
    id v36 = 0;
    v26 = [MEMORY[0x263EFC608] sendSynchronousRequest:v20 returningResponse:&v37 error:&v36];
    id v27 = v37;
    id v28 = v36;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke_2;
    block[3] = &unk_264E5DD30;
    id v33 = v26;
    id v29 = *(id *)(a1 + 48);
    id v34 = v28;
    id v35 = v29;
    id v30 = v28;
    id v31 = v26;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    v1 = *(void (**)(void))(a1[6] + 16);
    v1();
  }
  else
  {
    uint64_t v2 = a1[6];
    if (a1[5])
    {
      uint64_t v3 = *(void (**)(uint64_t, void))(v2 + 16);
      uint64_t v4 = a1[6];
      v3(v4, 0);
    }
    else
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
    }
  }
}

- (void)downloadNote:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if ([(ENSession *)self isAuthenticated])
      {
        uint64_t v11 = [(ENSession *)self noteStoreForNoteRef:v8];
        id v12 = v11;
        if (v9) {
          [v11 setDownloadProgressHandler:v9];
        }
        v13 = [v8 guid];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __46__ENSession_downloadNote_progress_completion___block_invoke;
        v20[3] = &unk_264E5A858;
        id v21 = v12;
        id v22 = v10;
        id v14 = v12;
        [v14 fetchNoteWithGuid:v13 includingContent:1 resourceOptions:1 completion:v20];

        goto LABEL_11;
      }
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = 2;
    }
    else
    {
      v15 = +[ENSession sharedSession];
      uint64_t v16 = [v15 logger];
      v17 = [NSString stringWithFormat:@"noteRef parameter is required to get download note"];
      [v16 evernoteLogErrorString:v17];

      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = 3;
    }
    id v14 = [v18 errorWithDomain:@"ENErrorDomain" code:v19 userInfo:0];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
LABEL_11:

    goto LABEL_12;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"handler required"];
LABEL_12:
}

void __46__ENSession_downloadNote_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setDownloadProgressHandler:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = [[ENNote alloc] initWithServiceNote:v7];
    [*(id *)(a1 + 32) setDownloadProgressHandler:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)findNotes_completeWithContext:(id)a3 error:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 completion];
  if (v8)
  {

    ((void (**)(void, void, id))v6)[2](v6, 0, v8);
  }
  else
  {
    id v7 = [v5 results];

    ((void (**)(void, void *, void))v6)[2](v6, v7, 0);
  }
}

- (void)findNotes_processResultsWithContext:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 requiresLocalMerge])
  {
    uint64_t v4 = [v3 findMetadataResults];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __49__ENSession_findNotes_processResultsWithContext___block_invoke;
    v54[3] = &unk_264E5A830;
    id v55 = v3;
    [v4 sortUsingComparator:v54];
  }
  id v5 = [v3 scopeNotebook];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v7 = [v3 allNotebooks];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v13 = [v12 guid];
          [v6 setObject:v12 forKeyedSubscript:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v9);
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v3 findMetadataResults];
  uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v45)
  {
    v43 = v14;
    uint64_t v44 = *(void *)v47;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
        v17 = objc_alloc_init(ENNoteRef);
        id v18 = [v16 guid];
        [(ENNoteRef *)v17 setGuid:v18];

        uint64_t v19 = [v3 scopeNotebook];
        if (v19
          || ([v16 notebookGuid],
              v20 = objc_claimAutoreleasedReturnValue(),
              [v6 objectForKeyedSubscript:v20],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              v20,
              v19))
        {
          if ([v19 isBusinessNotebook])
          {
            id v21 = v17;
            uint64_t v22 = 1;
            goto LABEL_24;
          }
          if ([v19 isLinked])
          {
            id v21 = v17;
            uint64_t v22 = 2;
LABEL_24:
            [(ENNoteRef *)v21 setType:v22];
            v23 = [v19 linkedNotebook];
            v24 = +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:v23];
            [(ENNoteRef *)v17 setLinkedNotebook:v24];
          }
          else
          {
            [(ENNoteRef *)v17 setType:0];
          }
          v25 = objc_alloc_init(ENSessionFindNotesResult);
          [(ENSessionFindNotesResult *)v25 setNoteRef:v17];
          [(ENSessionFindNotesResult *)v25 setNotebook:v19];
          v26 = [v16 title];
          [(ENSessionFindNotesResult *)v25 setTitle:v26];

          id v27 = (void *)MEMORY[0x263EFF910];
          id v28 = [v16 created];
          id v29 = objc_msgSend(v27, "dateWithEDAMTimestamp:", objc_msgSend(v28, "longLongValue"));
          [(ENSessionFindNotesResult *)v25 setCreated:v29];

          id v30 = (void *)MEMORY[0x263EFF910];
          id v31 = [v16 updated];
          v32 = objc_msgSend(v30, "dateWithEDAMTimestamp:", objc_msgSend(v31, "longLongValue"));
          [(ENSessionFindNotesResult *)v25 setUpdated:v32];

          id v33 = [v16 updateSequenceNum];
          -[ENSessionFindNotesResult setUpdateSequenceNum:](v25, "setUpdateSequenceNum:", [v33 intValue]);

          id v34 = [v16 largestResourceSize];
          -[ENSessionFindNotesResult setHasResources:](v25, "setHasResources:", (int)[v34 intValue] > 0);

          id v14 = v43;
          [v43 addObject:v25];
          if ([v3 maxResults])
          {
            unint64_t v35 = [v43 count];
            if (v35 >= [v3 maxResults])
            {

              goto LABEL_36;
            }
          }
          goto LABEL_28;
        }
        id v36 = [v3 resultGuidsFromBusiness];
        id v37 = [v16 guid];
        char v38 = [v36 containsObject:v37];

        if ((v38 & 1) == 0)
        {
          uint64_t v19 = +[ENSession sharedSession];
          v25 = [v19 logger];
          v39 = [NSString stringWithFormat:@"Found note metadata but can't determine owning notebook by guid. Metadata = %@", v16];
          [(ENSessionFindNotesResult *)v25 evernoteLogErrorString:v39];

LABEL_28:
        }

        ++v15;
      }
      while (v45 != v15);
      uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      uint64_t v45 = v40;
    }
    while (v40);
  }
LABEL_36:

  [v3 setResults:v14];
  [(ENSession *)self findNotes_completeWithContext:v3 error:0];
}

uint64_t __49__ENSession_findNotes_processResultsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) sortAscending];
  if (v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  if (v7) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v5;
  }
  id v10 = v8;
  id v11 = v9;
  if (([*(id *)(a1 + 32) sortOrder] & 2) != 0)
  {
    id v12 = [v10 created];
    uint64_t v15 = [v11 created];
LABEL_12:
    v13 = (void *)v15;
    uint64_t v14 = [v12 compare:v15];
    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) sortOrder] & 4) != 0)
  {
    id v12 = [v10 updated];
    uint64_t v15 = [v11 updated];
    goto LABEL_12;
  }
  id v12 = [v10 title];
  v13 = [v11 title];
  uint64_t v14 = [v12 compare:v13 options:1];
LABEL_13:
  uint64_t v16 = v14;

  return v16;
}

- (void)findNotes_nextFindInLinkedScopeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 linkedNotebooksToSearch];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    int v7 = [v4 linkedNotebooksToSearch];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];

    uint64_t v9 = [v4 linkedNotebooksToSearch];
    [v9 removeObjectAtIndex:0];

    id v10 = [v8 linkedNotebook];
    id v11 = [(ENSession *)self noteStoreForLinkedNotebook:v10];

    id v12 = [v4 noteFilter];
    v13 = (void *)[v12 copy];

    if ([v8 isJoinedPublic])
    {
      uint64_t v14 = [v8 guid];
      [v13 setNotebookGuid:v14];
    }
    uint64_t v15 = [v4 maxResults];
    uint64_t v16 = [v4 resultSpec];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke;
    v22[3] = &unk_264E5E238;
    id v23 = v4;
    v24 = self;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke_2;
    v18[3] = &unk_264E5A808;
    id v19 = v8;
    v20 = self;
    id v21 = v23;
    id v17 = v8;
    [v11 findNotesMetadataWithFilter:v13 maxResults:v15 resultSpec:v16 success:v22 failure:v18];
  }
  else
  {
    [(ENSession *)self findNotes_processResultsWithContext:v4];
  }
}

uint64_t __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 findMetadataResults];
  [v5 addObjectsFromArray:v4];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "findNotes_nextFindInLinkedScopeWithContext:", v7);
}

void __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = +[ENSession sharedSession];
  id v4 = [v3 logger];
  objc_msgSend(NSString, "stringWithFormat:", @"findNotes: Failed to find notes (linked). notebook = %@; %@",
    *(void *)(a1 + 32),
  id v5 = v6);
  [v4 evernoteLogErrorString:v5];

  objc_msgSend(*(id *)(a1 + 40), "findNotes_completeWithContext:error:", *(void *)(a1 + 48), v6);
}

- (void)findNotes_findInLinkedScopeWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 scopeNotebook];

  if (!v5)
  {
    if (([v4 scope] & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    [(ENSession *)self findNotes_processResultsWithContext:v4];
    goto LABEL_21;
  }
  id v6 = [v4 scopeNotebook];
  if (([v6 isLinked] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v7 = [v4 scopeNotebook];
  int v8 = [v7 isBusinessNotebook];

  if (v8) {
    goto LABEL_9;
  }
LABEL_6:
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v4 setLinkedNotebooksToSearch:v9];

  id v10 = [v4 scopeNotebook];

  if (v10)
  {
    id v11 = [v4 linkedNotebooksToSearch];
    id v12 = [v4 scopeNotebook];
    [v11 addObject:v12];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = objc_msgSend(v4, "allNotebooks", 0);
    uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v17 isLinked] && (objc_msgSend(v17, "isBusinessNotebook") & 1) == 0)
          {
            id v18 = [v4 linkedNotebooksToSearch];
            [v18 addObject:v17];
          }
        }
        uint64_t v14 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }

  [(ENSession *)self findNotes_nextFindInLinkedScopeWithContext:v4];
LABEL_21:
}

- (void)findNotes_findInBusinessScopeWithContext:(id)a3
{
  id v5 = a3;
  if ([(ENSession *)self isBusinessUser])
  {
    id v6 = [v5 scopeNotebook];
    if (!v6
      || ([v5 scopeNotebook],
          id v3 = objc_claimAutoreleasedReturnValue(),
          ([v3 isBusinessNotebook] & 1) != 0))
    {
      uint64_t v7 = [v5 scopeNotebook];
      if (v7)
      {

        if (v6)
        {
        }
      }
      else
      {
        char v8 = [v5 scope];
        if (v6)
        {
        }
        if ((v8 & 4) == 0) {
          goto LABEL_11;
        }
      }
      id v9 = [(ENSession *)self businessNoteStore];
      id v10 = [v5 noteFilter];
      uint64_t v11 = [v5 maxResults];
      id v12 = [v5 resultSpec];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke;
      v15[3] = &unk_264E5E238;
      id v16 = v5;
      id v17 = self;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke_2;
      v13[3] = &unk_264E5ED78;
      v13[4] = self;
      id v14 = v16;
      [v9 findNotesMetadataWithFilter:v10 maxResults:v11 resultSpec:v12 success:v15 failure:v13];

      goto LABEL_13;
    }
  }
LABEL_11:
  [(ENSession *)self findNotes_findInLinkedScopeWithContext:v5];
LABEL_13:
}

uint64_t __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 findMetadataResults];
  [v5 addObjectsFromArray:v4];

  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [v4 valueForKeyPath:@"guid"];

  char v8 = [v6 setWithArray:v7];
  [*(id *)(a1 + 32) setResultGuidsFromBusiness:v8];

  uint64_t v10 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  return objc_msgSend(v9, "findNotes_findInLinkedScopeWithContext:", v10);
}

void __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isErrorDueToRestrictedAuth:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "findNotes_findInLinkedScopeWithContext:", *(void *)(a1 + 40));
  }
  else
  {
    id v3 = +[ENSession sharedSession];
    id v4 = [v3 logger];
    id v5 = [NSString stringWithFormat:@"findNotes: Failed to find notes (business). %@", v6];
    [v4 evernoteLogErrorString:v5];

    objc_msgSend(*(id *)(a1 + 32), "findNotes_completeWithContext:error:", *(void *)(a1 + 40), v6);
  }
}

- (void)findNotes_findInPersonalScopeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scopeNotebook];

  if (v5)
  {
    id v6 = [v4 scopeNotebook];
    char v7 = [v6 isLinked];

    if ((v7 & 1) == 0)
    {
LABEL_7:
      char v8 = [(ENSession *)self primaryNoteStore];
      id v9 = [v4 noteFilter];
      uint64_t v10 = [v4 maxResults];
      uint64_t v11 = [v4 resultSpec];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke;
      v14[3] = &unk_264E5E238;
      id v15 = v4;
      id v16 = self;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke_2;
      v12[3] = &unk_264E5ED78;
      v12[4] = self;
      id v13 = v15;
      [v8 findNotesMetadataWithFilter:v9 maxResults:v10 resultSpec:v11 success:v14 failure:v12];

      goto LABEL_8;
    }
  }
  else if (([v4 scope] & 1) != 0 && !-[ENSession appNotebookIsLinked](self, "appNotebookIsLinked"))
  {
    goto LABEL_7;
  }
  [(ENSession *)self findNotes_findInBusinessScopeWithContext:v4];
LABEL_8:
}

uint64_t __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 findMetadataResults];
  [v5 addObjectsFromArray:v4];

  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "findNotes_findInBusinessScopeWithContext:", v7);
}

void __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = +[ENSession sharedSession];
  id v4 = [v3 logger];
  id v5 = [NSString stringWithFormat:@"findNotes: Failed to find notes (personal). %@", v6];
  [v4 evernoteLogErrorString:v5];

  objc_msgSend(*(id *)(a1 + 32), "findNotes_completeWithContext:error:", *(void *)(a1 + 40), v6);
}

- (void)findNotes_listNotebooksWithContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ENSession_findNotes_listNotebooksWithContext___block_invoke;
  v6[3] = &unk_264E5DB20;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [(ENSession *)self listNotebooksWithCompletion:v6];
}

void __48__ENSession_findNotes_listNotebooksWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setAllNotebooks:a2];
    objc_msgSend(*(id *)(a1 + 40), "findNotes_findInPersonalScopeWithContext:", *(void *)(a1 + 32));
  }
  else
  {
    id v5 = +[ENSession sharedSession];
    id v6 = [v5 logger];
    id v7 = [NSString stringWithFormat:@"findNotes: Failed to list notebooks. %@", v8];
    [v6 evernoteLogErrorString:v7];

    objc_msgSend(*(id *)(a1 + 40), "findNotes_completeWithContext:error:", *(void *)(a1 + 32), v8);
  }
}

- (void)findNotesWithSearch:(id)a3 inNotebook:(id)a4 orScope:(unint64_t)a5 sortOrder:(unint64_t)a6 maxResults:(unint64_t)a7 completion:(id)a8
{
  id v39 = a3;
  id v14 = a4;
  id v15 = (void (**)(id, void, void *))a8;
  if (!v15)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"handler required"];
    goto LABEL_37;
  }
  if (![(ENSession *)self isAuthenticated])
  {
    long long v19 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:2 userInfo:0];
    v15[2](v15, 0, v19);

    goto LABEL_37;
  }
  if ((a5 & 8) != 0) {
    a5 = 7;
  }
  if (v14 && a5)
  {
    id v16 = +[ENSession sharedSession];
    id v17 = [v16 logger];
    id v18 = [NSString stringWithFormat:@"No search scope necessary if notebook provided."];
    [v17 evernoteLogInfoString:v18];

    a5 = 0;
LABEL_16:
    unsigned int v38 = 0;
    goto LABEL_20;
  }
  if (v14 || a5)
  {
    if (!a5) {
      goto LABEL_16;
    }
  }
  else
  {
    long long v20 = +[ENSession sharedSession];
    long long v21 = [v20 logger];
    long long v22 = [NSString stringWithFormat:@"Search scope or notebook must be specified. Defaulting to personal scope."];
    [v21 evernoteLogInfoString:v22];

    a5 = 1;
  }
  if ((~(_BYTE)a5 & 5) != 0 && (a5 & 2) == 0) {
    goto LABEL_16;
  }
  if ((a6 & 8) != 0)
  {
    id v23 = +[ENSession sharedSession];
    uint64_t v24 = [v23 logger];
    v25 = [NSString stringWithFormat:@"Cannot sort by relevance across multiple search scopes. Using update date."];
    [v24 evernoteLogErrorString:v25];

    a6 = a6 & 0xFFFFFFFFFFFFFFF3 | 4;
  }
  unsigned int v38 = 1;
LABEL_20:
  v26 = objc_alloc_init(EDAMNotesMetadataResultSpec);
  uint64_t v27 = MEMORY[0x263EFFA88];
  [(EDAMNotesMetadataResultSpec *)v26 setIncludeNotebookGuid:MEMORY[0x263EFFA88]];
  [(EDAMNotesMetadataResultSpec *)v26 setIncludeTitle:v27];
  [(EDAMNotesMetadataResultSpec *)v26 setIncludeCreated:v27];
  [(EDAMNotesMetadataResultSpec *)v26 setIncludeUpdated:v27];
  [(EDAMNotesMetadataResultSpec *)v26 setIncludeUpdateSequenceNum:v27];
  [(EDAMNotesMetadataResultSpec *)v26 setIncludeLargestResourceSize:v27];
  id v28 = objc_alloc_init(EDAMNoteFilter);
  id v29 = [v39 searchString];
  [(EDAMNoteFilter *)v28 setWords:v29];

  if (a6)
  {
    id v30 = &unk_26F0761A0;
    goto LABEL_28;
  }
  if ((a6 & 2) != 0)
  {
    id v30 = &unk_26F0761B8;
    goto LABEL_28;
  }
  if ((a6 & 4) != 0)
  {
    id v30 = &unk_26F0761D0;
    goto LABEL_28;
  }
  if ((a6 & 8) != 0)
  {
    id v30 = &unk_26F0761E8;
LABEL_28:
    [(EDAMNoteFilter *)v28 setOrder:v30];
  }
  char v31 = (a6 & 1) == 0;
  if ((a6 & 0x10000) == 0) {
    char v31 = a6;
  }
  uint64_t v32 = v31 & 1;
  id v33 = [NSNumber numberWithBool:v32];
  [(EDAMNoteFilter *)v28 setAscending:v33];

  if (v14)
  {
    id v34 = [v14 guid];
    [(EDAMNoteFilter *)v28 setNotebookGuid:v34];
  }
  unint64_t v35 = objc_alloc_init(ENSessionFindNotesContext);
  [(ENSessionFindNotesContext *)v35 setCompletion:v15];
  [(ENSessionFindNotesContext *)v35 setScopeNotebook:v14];
  [(ENSessionFindNotesContext *)v35 setScope:a5];
  [(ENSessionFindNotesContext *)v35 setSortOrder:a6];
  [(ENSessionFindNotesContext *)v35 setNoteFilter:v28];
  [(ENSessionFindNotesContext *)v35 setResultSpec:v26];
  [(ENSessionFindNotesContext *)v35 setMaxResults:a7];
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(ENSessionFindNotesContext *)v35 setFindMetadataResults:v36];

  [(ENSessionFindNotesContext *)v35 setRequiresLocalMerge:v38];
  [(ENSessionFindNotesContext *)v35 setSortAscending:v32];
  id v37 = [(ENSessionFindNotesContext *)v35 scopeNotebook];

  if (v37) {
    [(ENSession *)self findNotes_findInPersonalScopeWithContext:v35];
  }
  else {
    [(ENSession *)self findNotes_listNotebooksWithContext:v35];
  }

LABEL_37:
}

- (void)deleteNote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ENSession *)self isAuthenticated])
  {
    id v8 = [(ENSession *)self noteStoreForNoteRef:v6];
    id v9 = [v6 guid];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__ENSession_deleteNote_completion___block_invoke;
    v10[3] = &unk_264E5A7E0;
    id v11 = v7;
    [v8 deleteNoteWithGuid:v9 completion:v10];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
    goto LABEL_5;
  }
LABEL_6:
}

void __35__ENSession_deleteNote_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    id v5 = +[ENSession sharedSession];
    id v6 = [v5 logger];
    id v7 = [NSString stringWithFormat:@"Failed to deleteNote: %@", v11];
    [v6 evernoteLogErrorString:v7];

    id v4 = v11;
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = *(void (**)(void))(v8 + 16);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (!v10) {
      goto LABEL_7;
    }
    id v9 = *(void (**)(void))(v10 + 16);
    id v11 = 0;
  }
  v9();
  id v4 = v11;
LABEL_7:
}

- (void)shareNote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ENSession *)self isAuthenticated])
  {
    uint64_t v8 = [(ENSession *)self noteStoreForNoteRef:v6];
    id v9 = [v6 guid];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__ENSession_shareNote_completion___block_invoke;
    v10[3] = &unk_264E5A7B8;
    id v12 = v7;
    void v10[4] = self;
    id v11 = v6;
    [v8 shareNoteWithGuid:v9 completion:v10];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
    goto LABEL_5;
  }
LABEL_6:
}

void __34__ENSession_shareNote_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[ENSession sharedSession];
    id v7 = [v6 logger];
    uint64_t v8 = [NSString stringWithFormat:@"Failed to shareNote: %@", v5];
    [v7 evernoteLogErrorString:v8];

    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) shardIdForNoteRef:*(void *)(a1 + 40)];
    id v11 = [*(id *)(a1 + 40) guid];
    id v12 = [*(id *)(a1 + 32) sessionHost];
    id v13 = +[ENShareURLHelper shareURLStringForNoteGUID:v11 shardId:v10 shareKey:v15 serviceHost:v12 encodedAdditionalString:0];

    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v13, 0);
    }
  }
}

- (void)uploadNote_completeWithContext:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = [v11 noteStore];
  [v6 setUploadProgressHandler:0];

  id v7 = [v11 completion];

  if (v7)
  {
    uint64_t v8 = [v11 completion];
    uint64_t v9 = (void (**)(void, void, void))v8;
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
    else
    {
      uint64_t v10 = [v11 noteRef];
      ((void (**)(void, void *, void))v9)[2](v9, v10, 0);
    }
  }
}

- (void)uploadNote_createWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 note];
  [v5 setUpdated:0];
  id v6 = [v4 note];
  [v6 setCreated:0];

  id v7 = [v4 note];
  uint64_t v8 = [v7 notebookGuid];

  if (!v8)
  {
    uint64_t v9 = [v4 notebook];
    uint64_t v10 = [v9 guid];
    id v11 = [v4 note];
    [v11 setNotebookGuid:v10];
  }
  id v12 = [v4 progress];

  if (v12)
  {
    id v13 = [v4 progress];
    uint64_t v14 = [v4 noteStore];
    [v14 setUploadProgressHandler:v13];
  }
  id v15 = [v4 noteStore];
  id v16 = [v4 note];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__ENSession_uploadNote_createWithContext___block_invoke;
  v18[3] = &unk_264E5A768;
  id v19 = v4;
  long long v20 = self;
  id v17 = v4;
  [v15 createNote:v16 completion:v18];
}

void __42__ENSession_uploadNote_createWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  if (v13)
  {
    [*(id *)(a1 + 32) setNoteRef:0];
    id v5 = +[ENSession sharedSession];
    id v6 = [v5 logger];
    id v7 = [NSString stringWithFormat:@"Failed to createNote for uploadNote: %@", v13];
    [v6 evernoteLogErrorString:v7];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v10 = v13;
  }
  else
  {
    id v11 = [a2 guid];
    id v12 = [*(id *)(a1 + 32) noteRef];
    [v12 setGuid:v11];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v10 = 0;
  }
  objc_msgSend(v8, "uploadNote_completeWithContext:error:", v9, v10);
}

- (void)uploadNote_findSharedAppNotebookWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self preferences];
  id v6 = [v5 decodedObjectForKey:@"LinkedAppNotebook"];

  id v7 = [(ENSession *)self noteStoreForLinkedNotebook:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__ENSession_uploadNote_findSharedAppNotebookWithContext___block_invoke;
  v9[3] = &unk_264E5A790;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 fetchSharedNotebookByAuthWithCompletion:v9];
}

void __57__ENSession_uploadNote_findSharedAppNotebookWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[ENSession sharedSession];
    id v7 = [v6 logger];
    id v8 = NSString;
    id v13 = v5;
    uint64_t v9 = @"Failed to getSharedNotebookByAuth for uploadNote; turning into NotFound: %@";
LABEL_3:
    id v10 = objc_msgSend(v8, "stringWithFormat:", v9, v13);
    [v7 evernoteLogInfoString:v10];

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:4 userInfo:0];
    objc_msgSend(*(id *)(a1 + 32), "uploadNote_completeWithContext:error:", *(void *)(a1 + 40), v11);

    goto LABEL_6;
  }
  if (!v14)
  {
    id v6 = +[ENSession sharedSession];
    id v7 = [v6 logger];
    id v8 = NSString;
    uint64_t v9 = @"getSharedNotebookByAuth for uploadNote returned empty sharedNotebook; turning into NotFound.";
    goto LABEL_3;
  }
  id v12 = [*(id *)(a1 + 32) preferences];
  [v12 encodeObject:v14 forKey:@"SharedAppNotebook"];

  objc_msgSend(*(id *)(a1 + 32), "uploadNote_determineDestinationWithContext:", *(void *)(a1 + 40));
LABEL_6:
}

- (void)uploadNote_findLinkedAppNotebookWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self primaryNoteStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ENSession_uploadNote_findLinkedAppNotebookWithContext___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listLinkedNotebooksWithCompletion:v7];
}

void __57__ENSession_uploadNote_findLinkedAppNotebookWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[ENSession sharedSession];
    id v7 = [v6 logger];
    id v8 = NSString;
    id v18 = v5;
    uint64_t v9 = @"Failed to listLinkedNotebooks for uploadNote; turning into NotFound: %@";
LABEL_3:
    id v10 = objc_msgSend(v8, "stringWithFormat:", v9, v18);
    [v7 evernoteLogInfoString:v10];

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:4 userInfo:0];
    objc_msgSend(*(id *)(a1 + 32), "uploadNote_completeWithContext:error:", *(void *)(a1 + 40), v11);
    goto LABEL_4;
  }
  if (![v19 count])
  {
    id v6 = +[ENSession sharedSession];
    id v7 = [v6 logger];
    id v8 = NSString;
    uint64_t v9 = @"Cannot find linked app notebook. Perhaps user deleted it?";
    goto LABEL_3;
  }
  if ((unint64_t)[v19 count] >= 2)
  {
    id v12 = +[ENSession sharedSession];
    id v13 = [v12 logger];
    id v14 = [NSString stringWithFormat:@"Expected to find single linked notebook, found %lu", objc_msgSend(v19, "count")];
    [v13 evernoteLogInfoString:v14];
  }
  id v11 = [v19 objectAtIndexedSubscript:0];
  id v15 = [v11 sharedNotebookGlobalId];

  if (v15)
  {
    id v16 = [*(id *)(a1 + 32) preferences];
    [v16 encodeObject:v11 forKey:@"LinkedAppNotebook"];

    objc_msgSend(*(id *)(a1 + 32), "uploadNote_findSharedAppNotebookWithContext:", *(void *)(a1 + 40));
  }
  else
  {
    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:5 userInfo:0];
    objc_msgSend(*(id *)(a1 + 32), "uploadNote_completeWithContext:error:", *(void *)(a1 + 40), v17);
  }
LABEL_4:
}

- (void)uploadNote_updateWithContext:(id)a3
{
  id v4 = a3;
  id v5 = NSNumber;
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "edamTimestamp"));
  id v8 = [v4 note];
  [v8 setUpdated:v7];

  uint64_t v9 = [v4 refToReplace];
  id v10 = [v9 guid];
  id v11 = [v4 note];
  [v11 setGuid:v10];

  id v12 = [v4 progress];

  if (v12)
  {
    id v13 = [v4 progress];
    id v14 = [v4 noteStore];
    [v14 setUploadProgressHandler:v13];
  }
  id v15 = [v4 noteStore];
  id v16 = [v4 note];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__ENSession_uploadNote_updateWithContext___block_invoke;
  v18[3] = &unk_264E5A768;
  id v19 = v4;
  long long v20 = self;
  id v17 = v4;
  [v15 updateNote:v16 completion:v18];
}

void __42__ENSession_uploadNote_updateWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"parameter"];
    int v9 = [v8 isEqualToString:@"Note.guid"];

    if (v9 && [*(id *)(a1 + 32) policy] == 2)
    {
      id v10 = [*(id *)(a1 + 32) note];
      [v10 setGuid:0];

      [*(id *)(a1 + 32) setPolicy:0];
      [*(id *)(a1 + 32) setRefToReplace:0];
      objc_msgSend(*(id *)(a1 + 40), "uploadNote_determineDestinationWithContext:", *(void *)(a1 + 32));
      goto LABEL_8;
    }
    id v11 = +[ENSession sharedSession];
    id v12 = [v11 logger];
    id v13 = [NSString stringWithFormat:@"Failed to updateNote for uploadNote: %@", v6];
    [v12 evernoteLogErrorString:v13];

    uint64_t v15 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    id v16 = v6;
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) refToReplace];
    [*(id *)(a1 + 32) setNoteRef:v17];

    uint64_t v15 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    id v16 = 0;
  }
  objc_msgSend(v14, "uploadNote_completeWithContext:error:", v15, v16);
LABEL_8:
}

- (void)uploadNote_determineDestinationWithContext:(id)a3
{
  id v41 = a3;
  id v4 = objc_alloc_init(ENNoteRef);
  [v41 setNoteRef:v4];

  if ([(ENSession *)self appNotebookIsLinked])
  {
    id v5 = [(ENSession *)self preferences];
    id v6 = [v5 decodedObjectForKey:@"LinkedAppNotebook"];

    if (!v6)
    {
      [(ENSession *)self uploadNote_findLinkedAppNotebookWithContext:v41];
      goto LABEL_18;
    }
    id v7 = [(ENSession *)self noteStoreForLinkedNotebook:v6];
    [v41 setNoteStore:v7];

    id v8 = [v41 noteRef];
    [v8 setType:2];

    int v9 = +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:v6];
    id v10 = [v41 noteRef];
    [v10 setLinkedNotebook:v9];

    id v11 = [(ENSession *)self preferences];
    id v12 = [v11 decodedObjectForKey:@"SharedAppNotebook"];

    id v13 = [v12 notebookGuid];
    id v14 = [v41 note];
    [v14 setNotebookGuid:v13];
  }
  uint64_t v15 = [v41 noteStore];

  if (!v15)
  {
    id v16 = [v41 refToReplace];

    if (v16)
    {
      id v17 = [v41 refToReplace];
      id v18 = [(ENSession *)self noteStoreForNoteRef:v17];
      [v41 setNoteStore:v18];

      id v19 = [v41 refToReplace];
      uint64_t v20 = [v19 type];
      long long v21 = [v41 noteRef];
      [v21 setType:v20];

      long long v22 = [v41 refToReplace];
      id v23 = [v22 linkedNotebook];
      uint64_t v24 = [v41 noteRef];
      [v24 setLinkedNotebook:v23];

LABEL_14:
      goto LABEL_15;
    }
    v25 = [v41 notebook];
    int v26 = [v25 isBusinessNotebook];

    if (v26)
    {
      uint64_t v27 = [(ENSession *)self businessNoteStore];
      [v41 setNoteStore:v27];

      id v28 = [v41 noteRef];
      long long v22 = v28;
      uint64_t v29 = 1;
    }
    else
    {
      id v30 = [v41 notebook];
      int v31 = [v30 isLinked];

      if (v31)
      {
        uint64_t v32 = [v41 notebook];
        id v33 = [v32 linkedNotebook];
        id v34 = [(ENSession *)self noteStoreForLinkedNotebook:v33];
        [v41 setNoteStore:v34];

        unint64_t v35 = [v41 noteRef];
        [v35 setType:2];

        long long v22 = [v41 notebook];
        id v36 = [v22 linkedNotebook];
        id v37 = +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:v36];
        unsigned int v38 = [v41 noteRef];
        [v38 setLinkedNotebook:v37];

        goto LABEL_14;
      }
      id v39 = [(ENSession *)self primaryNoteStore];
      [v41 setNoteStore:v39];

      id v28 = [v41 noteRef];
      long long v22 = v28;
      uint64_t v29 = 0;
    }
    [v28 setType:v29];
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v40 = [v41 refToReplace];

  if (v40) {
    [(ENSession *)self uploadNote_updateWithContext:v41];
  }
  else {
    [(ENSession *)self uploadNote_createWithContext:v41];
  }
LABEL_18:
}

- (void)uploadNote:(id)a3 policy:(int64_t)a4 toNotebook:(id)a5 orReplaceNote:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v40 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, void, void *))a8;
  if (!v17)
  {
    long long v21 = (void *)MEMORY[0x263EFF940];
    uint64_t v22 = *MEMORY[0x263EFF4A0];
    id v23 = @"handler required";
LABEL_7:
    [v21 raise:v22 format:v23];
    goto LABEL_21;
  }
  if (!v40)
  {
    uint64_t v24 = +[ENSession sharedSession];
    v25 = [v24 logger];
    int v26 = [NSString stringWithFormat:@"must specify note"];
    [v25 evernoteLogErrorString:v26];

    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 3;
LABEL_20:
    id v39 = [v27 errorWithDomain:@"ENErrorDomain" code:v28 userInfo:0];
    v17[2](v17, 0, v39);

    goto LABEL_21;
  }
  if ((unint64_t)(a4 - 3) >= 0xFFFFFFFFFFFFFFFELL && !v15)
  {
    id v18 = +[ENSession sharedSession];
    id v19 = [v18 logger];
    uint64_t v20 = [NSString stringWithFormat:@"must specify existing ID when requesting a replacement policy"];
    [v19 evernoteLogErrorString:v20];

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:3 userInfo:0];
    v17[2](v17, 0, v15);
    goto LABEL_21;
  }
  if (!a4 && v15)
  {
    uint64_t v29 = +[ENSession sharedSession];
    id v30 = [v29 logger];
    int v31 = [NSString stringWithFormat:@"Can't use create policy when specifying an existing note ref. Ignoring."];
    [v30 evernoteLogErrorString:v31];

    id v15 = 0;
  }
  if (v14 && ([v14 allowsWriting] & 1) == 0)
  {
    long long v21 = (void *)MEMORY[0x263EFF940];
    uint64_t v22 = *MEMORY[0x263EFF4A0];
    id v23 = @"a specified notebook must not be readonly";
    goto LABEL_7;
  }
  if (![(ENSession *)self isAuthenticated])
  {
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 2;
    goto LABEL_20;
  }
  if (([v40 validateForLimits] & 1) == 0)
  {
    uint64_t v32 = +[ENSession sharedSession];
    id v33 = [v32 logger];
    id v34 = [NSString stringWithFormat:@"Note failed limits validation. Cannot upload. %@", self];
    [v33 evernoteLogErrorString:v34];

    unint64_t v35 = +[ENError noteSizeLimitReachedError];
    v17[2](v17, 0, v35);
  }
  id v36 = objc_alloc_init(ENSessionUploadNoteContext);
  if (v15)
  {
    id v37 = [v15 guid];
    unsigned int v38 = [v40 EDAMNoteToReplaceServiceNoteGUID:v37];
    [(ENSessionUploadNoteContext *)v36 setNote:v38];
  }
  else
  {
    id v37 = [v40 EDAMNote];
    [(ENSessionUploadNoteContext *)v36 setNote:v37];
  }

  [(ENSessionUploadNoteContext *)v36 setRefToReplace:v15];
  [(ENSessionUploadNoteContext *)v36 setNotebook:v14];
  [(ENSessionUploadNoteContext *)v36 setPolicy:a4];
  [(ENSessionUploadNoteContext *)v36 setCompletion:v17];
  [(ENSessionUploadNoteContext *)v36 setProgress:v16];
  [(ENSession *)self uploadNote_determineDestinationWithContext:v36];

LABEL_21:
}

- (void)uploadNote:(id)a3 notebook:(id)a4 completion:(id)a5
{
}

- (void)listNotebooks_cleanCache
{
  [(ENSession *)self setNotebooksCache:0];
  [(ENSession *)self setNotebooksCacheDate:0];
}

- (void)listNotebooks_completeWithContext:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 resultNotebooks];
  [(ENSession *)self setNotebooksCache:v8];

  int v9 = [MEMORY[0x263EFF910] date];
  [(ENSession *)self setNotebooksCacheDate:v9];

  id v11 = [v7 completion];
  id v10 = [v7 resultNotebooks];

  v11[2](v11, v10, v6);
}

- (void)listNotebooks_prepareResultsWithContext:(id)a3
{
  id v9 = a3;
  id v4 = [v9 resultNotebooks];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    id v6 = [v9 resultNotebooks];
    id v7 = [v6 objectAtIndexedSubscript:0];

    if (([v7 isDefaultNotebook] & 1) == 0) {
      [v7 setIsDefaultNotebookOverride:1];
    }
  }
  id v8 = [v9 resultNotebooks];
  [v8 sortUsingComparator:&__block_literal_global_142];

  [(ENSession *)self listNotebooks_completeWithContext:v9 error:0];
}

uint64_t __53__ENSession_listNotebooks_prepareResultsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (void)listNotebooks_processSharedNotebooksWithContext:(id)a3
{
  id v16 = self;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v3 linkedPersonalNotebooks];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = objc_msgSend(v3, "sharedNotebooks", v16);
        id v10 = [v8 guid];
        id v11 = [v9 objectForKey:v10];

        LODWORD(v9) = [v11 isMemberOfClass:objc_opt_class()];
        id v12 = [ENNotebook alloc];
        if (v9) {
          uint64_t v13 = [(ENNotebook *)v12 initWithSharedNotebook:v11 forLinkedNotebook:v8];
        }
        else {
          uint64_t v13 = [(ENNotebook *)v12 initWithPublicNotebook:v11 forLinkedNotebook:v8];
        }
        id v14 = (void *)v13;
        id v15 = [v3 resultNotebooks];
        [v15 addObject:v14];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  [(ENSession *)v16 listNotebooks_prepareResultsWithContext:v3];
}

- (void)listNotebooks_completePendingSharedNotebookWithContext:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 pendingSharedNotebooks] - 1;
  [v5 setPendingSharedNotebooks:v4];
  if (!v4) {
    [(ENSession *)self listNotebooks_processSharedNotebooksWithContext:v5];
  }
}

- (void)listNotebooks_fetchSharedNotebooksWithContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 linkedPersonalNotebooks];
  objc_msgSend(v4, "setPendingSharedNotebooks:", objc_msgSend(v5, "count"));

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setSharedNotebooks:v6];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v4 linkedPersonalNotebooks];
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    id v17 = v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v12 = -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v11, v17);
        uint64_t v13 = [v11 sharedNotebookGlobalId];

        if (v13)
        {
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_3;
          v19[3] = &unk_264E5A720;
          v19[4] = v11;
          id v20 = v4;
          long long v21 = self;
          id v22 = v6;
          [v12 fetchSharedNotebookByAuthWithCompletion:v19];

          id v14 = v20;
        }
        else
        {
          id v15 = [(ENSession *)self userStore];
          id v16 = [v11 username];
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v24[0] = __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke;
          v24[1] = &unk_264E5A6F8;
          id v25 = v4;
          int v26 = self;
          id v27 = v12;
          uint64_t v28 = v11;
          id v29 = v6;
          [v15 fetchPublicUserInfoWithUsername:v16 completion:v23];

          id v14 = v25;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }
}

void __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "listNotebooks_completePendingSharedNotebookWithContext:", v5);
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = [a2 userId];
    uint64_t v8 = [v7 intValue];
    uint64_t v9 = [*(id *)(a1 + 56) uri];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_2;
    v14[3] = &unk_264E5A6D0;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v15 = v10;
    uint64_t v16 = v11;
    id v12 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 56);
    id v17 = v12;
    uint64_t v18 = v13;
    [v6 fetchPublicNotebookWithUserID:v8 publicURI:v9 completion:v14];
  }
}

void __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[ENSession sharedSession];
    uint64_t v7 = [v6 logger];
    uint64_t v8 = [NSString stringWithFormat:@"Failed to get shared notebook for linked notebook record %@", *(void *)(a1 + 32)];
    [v7 evernoteLogErrorString:v8];

    uint64_t v9 = [*(id *)(a1 + 40) linkedPersonalNotebooks];
    [v9 removeObject:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) setError:v5];
  }
  else
  {
    id v10 = *(void **)(a1 + 56);
    uint64_t v11 = [*(id *)(a1 + 32) guid];
    [v10 setObject:v12 forKey:v11];
  }
  objc_msgSend(*(id *)(a1 + 48), "listNotebooks_completePendingSharedNotebookWithContext:", *(void *)(a1 + 40));
}

void __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) setError:a3];
  }
  else
  {
    id v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 56) guid];
    [v5 setObject:v7 forKey:v6];
  }
  objc_msgSend(*(id *)(a1 + 40), "listNotebooks_completePendingSharedNotebookWithContext:", *(void *)(a1 + 32));
}

- (void)listNotebooks_processBusinessNotebooksWithContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [v3 linkedPersonalNotebooks];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        uint64_t v11 = [v3 sharedBusinessNotebooks];
        id v12 = [v10 sharedNotebookGlobalId];
        uint64_t v13 = [v11 objectForKey:v12];

        if (v13)
        {
          id v14 = [v3 businessNotebooks];
          id v15 = [v13 notebookGuid];
          uint64_t v16 = [v14 objectForKey:v15];

          id v17 = [[ENNotebook alloc] initWithSharedNotebook:v13 forLinkedNotebook:v10 withBusinessNotebook:v16];
          uint64_t v18 = [v3 resultNotebooks];
          [v18 addObject:v17];

          long long v19 = [v3 linkedPersonalNotebooks];
          [v19 removeObjectIdenticalTo:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  id v20 = [v3 linkedPersonalNotebooks];
  uint64_t v21 = [v20 count];

  if (v21) {
    [(ENSession *)self listNotebooks_fetchSharedNotebooksWithContext:v3];
  }
  else {
    [(ENSession *)self listNotebooks_prepareResultsWithContext:v3];
  }
}

- (void)listNotebooks_fetchBusinessNotebooksWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self businessNoteStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ENSession_listNotebooks_fetchBusinessNotebooksWithContext___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listNotebooksWithCompletion:v7];
}

void __61__ENSession_listNotebooks_fetchBusinessNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[ENSession sharedSession];
    id v8 = [v7 logger];
    uint64_t v9 = [NSString stringWithFormat:@"Error from listNotebooks in business store: %@", v6];
    [v8 evernoteLogErrorString:v9];

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(void *)(a1 + 40), v6);
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 40) setBusinessNotebooks:v10];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v17 = [*(id *)(a1 + 40) businessNotebooks];
          uint64_t v18 = [v16 guid];
          [v17 setObject:v16 forKey:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_processBusinessNotebooksWithContext:", *(void *)(a1 + 40));
  }
}

- (void)listNotebooks_fetchSharedBusinessNotebooksWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self businessNoteStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__ENSession_listNotebooks_fetchSharedBusinessNotebooksWithContext___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listSharedNotebooksWithCompletion:v7];
}

void __67__ENSession_listNotebooks_fetchSharedBusinessNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[ENSession sharedSession];
    id v8 = [v7 logger];
    uint64_t v9 = [NSString stringWithFormat:@"Error from listSharedNotebooks in business store: %@", v6];
    [v8 evernoteLogErrorString:v9];

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(void *)(a1 + 40), v6);
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 40) setSharedBusinessNotebooks:v10];

    id v11 = objc_alloc_init(MEMORY[0x263F08760]);
    [*(id *)(a1 + 40) setSharedBusinessNotebookGuids:v11];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v18 = [*(id *)(a1 + 40) sharedBusinessNotebooks];
          long long v19 = [v17 globalId];
          [v18 setObject:v17 forKey:v19];

          long long v20 = [*(id *)(a1 + 40) sharedBusinessNotebookGuids];
          long long v21 = [v17 notebookGuid];
          [v20 addObject:v21];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_fetchBusinessNotebooksWithContext:", *(void *)(a1 + 40));
  }
}

- (void)listNotebooks_listLinkedNotebooksWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self primaryNoteStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ENSession_listNotebooks_listLinkedNotebooksWithContext___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listLinkedNotebooksWithCompletion:v7];
}

void __58__ENSession_listNotebooks_listLinkedNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5)
  {
    if (![*(id *)(a1 + 32) isErrorDueToRestrictedAuth:v5])
    {
      id v6 = +[ENSession sharedSession];
      uint64_t v7 = [v6 logger];
      id v8 = [NSString stringWithFormat:@"Error from listLinkedNotebooks in user's store: %@", v5];
      [v7 evernoteLogErrorString:v8];

      objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(void *)(a1 + 40), v5);
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (![v13 count])
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_prepareResultsWithContext:", *(void *)(a1 + 40));
    goto LABEL_8;
  }
  uint64_t v9 = [MEMORY[0x263EFF980] arrayWithArray:v13];
  [*(id *)(a1 + 40) setLinkedPersonalNotebooks:v9];

  id v10 = [*(id *)(a1 + 32) businessNoteStore];

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v10) {
    objc_msgSend(v11, "listNotebooks_fetchSharedBusinessNotebooksWithContext:", v12);
  }
  else {
    objc_msgSend(v11, "listNotebooks_fetchSharedNotebooksWithContext:", v12);
  }
LABEL_8:
}

- (void)listNotebooks_listSharedNotebooksWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self primaryNoteStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ENSession_listNotebooks_listSharedNotebooksWithContext___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listSharedNotebooksWithCompletion:v7];
}

void __58__ENSession_listNotebooks_listSharedNotebooksWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    id v4 = +[ENSession sharedSession];
    id v5 = [v4 logger];
    id v6 = [NSString stringWithFormat:@"Error from listSharedNotebooks in user's store: %@", v7];
    [v5 evernoteLogErrorString:v6];

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(void *)(a1 + 40), v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_listLinkedNotebooksWithContext:", *(void *)(a1 + 40));
  }
}

- (void)listNotebooks_listNotebooksWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self primaryNoteStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ENSession_listNotebooks_listNotebooksWithContext___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listNotebooksWithCompletion:v7];
}

void __52__ENSession_listNotebooks_listNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if ([*(id *)(a1 + 32) isErrorDueToRestrictedAuth:v6])
    {
      objc_msgSend(*(id *)(a1 + 32), "listNotebooks_listLinkedNotebooksWithContext:", *(void *)(a1 + 40));
    }
    else
    {
      id v13 = +[ENSession sharedSession];
      uint64_t v14 = [v13 logger];
      uint64_t v15 = [NSString stringWithFormat:@"Error from listNotebooks in user's store: %@", v6];
      [v14 evernoteLogErrorString:v15];

      objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(void *)(a1 + 40), v6);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = [[ENNotebook alloc] initWithNotebook:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          uint64_t v12 = [*(id *)(a1 + 40) resultNotebooks];
          [v12 addObject:v11];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_listSharedNotebooksWithContext:", *(void *)(a1 + 40));
  }
}

- (void)listWritableNotebooksWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__ENSession_listWritableNotebooksWithCompletion___block_invoke;
  v6[3] = &unk_264E5CE88;
  id v7 = v4;
  id v5 = v4;
  [(ENSession *)self listNotebooksWithCompletion:v6];
}

void __49__ENSession_listWritableNotebooksWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
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
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "allowsWriting", (void)v14)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listNotebooksWithCompletion:(id)a3
{
  uint64_t v12 = a3;
  if (!v12)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"handler required"];
    goto LABEL_11;
  }
  if (![(ENSession *)self isAuthenticated])
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:2 userInfo:0];
    uint64_t v9 = (void (*)(void))v12[2];
    goto LABEL_8;
  }
  id v4 = [(ENSession *)self notebooksCache];
  if ([v4 count])
  {
    id v5 = [(ENSession *)self notebooksCacheDate];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    if (v7 > -300.0)
    {
      id v8 = [(ENSession *)self notebooksCache];
      uint64_t v9 = (void (*)(void))v12[2];
LABEL_8:
      v9();

      goto LABEL_11;
    }
  }
  else
  {
  }
  [(ENSession *)self listNotebooks_cleanCache];
  uint64_t v10 = objc_alloc_init(ENSessionListNotebooksContext);
  [(ENSessionListNotebooksContext *)v10 setCompletion:v12];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(ENSessionListNotebooksContext *)v10 setResultNotebooks:v11];

  [(ENSession *)self listNotebooks_listNotebooksWithContext:v10];
LABEL_11:
}

- (BOOL)handleOpenURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ENSession *)self authenticator];

  if (v5)
  {
    double v6 = [(ENSession *)self authenticator];
    char v7 = [v6 handleOpenURL:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)unauthenticateAndRevokeAccessToken:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ENSession sharedSession];
  double v6 = [v5 logger];
  char v7 = [NSString stringWithFormat:@"ENSession is unauthenticating."];
  [v6 evernoteLogInfoString:v7];

  if ([(ENSession *)self isAuthenticated] && v3)
  {
    id v8 = [(ENSession *)self userStore];
    [(ENSession *)self setUserStorePendingRevocation:v8];

    uint64_t v9 = [(ENSession *)self userStorePendingRevocation];
    uint64_t v10 = [(ENSession *)self primaryAuthenticationToken];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__ENSession_unauthenticateAndRevokeAccessToken___block_invoke;
    v14[3] = &unk_264E5EBC8;
    void v14[4] = self;
    [v9 revokeLongSessionWithAuthenticationToken:v10 completion:v14];
  }
  [(ENSession *)self setIsAuthenticated:0];
  [(ENSession *)self setUser:0];
  [(ENSession *)self setPrimaryAuthenticationToken:0];
  [(ENSession *)self setUserStore:0];
  [(ENSession *)self setPrimaryNoteStore:0];
  [(ENSession *)self setBusinessNoteStore:0];
  id v11 = objc_alloc_init(ENAuthCache);
  [(ENSession *)self setAuthCache:v11];

  [(ENSession *)self setNotebooksCache:0];
  [(ENSession *)self setNotebooksCacheDate:0];
  uint64_t v12 = [(ENSession *)self credentialStore];
  [v12 clearAllCredentials];
  [(ENSession *)self saveCredentialStore:v12];
  id v13 = [(ENSession *)self preferences];
  [v13 removeAllItems];

  [(ENSession *)self selectInitialSessionHost];
  [(ENSession *)self notifyAuthenticationChanged];
}

uint64_t __48__ENSession_unauthenticateAndRevokeAccessToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserStorePendingRevocation:0];
}

- (void)unauthenticateWithoutRevokingAccessToken
{
}

- (void)unauthenticate
{
}

- (BOOL)appNotebookIsLinked
{
  uint64_t v2 = [(ENSession *)self preferences];
  BOOL v3 = [v2 objectForKey:@"AppNotebookIsLinked"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int)userID
{
  uint64_t v2 = [(ENSession *)self user];
  BOOL v3 = [v2 id];
  int v4 = [v3 intValue];

  return v4;
}

- (NSString)sourceApplication
{
  sourceApplication = self->_sourceApplication;
  if (sourceApplication)
  {
    BOOL v3 = sourceApplication;
  }
  else
  {
    int v4 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v3 = [v4 bundleIdentifier];
  }
  return v3;
}

- (NSString)businessDisplayName
{
  if ([(ENSession *)self isBusinessUser])
  {
    BOOL v3 = [(ENSession *)self user];
    int v4 = [v3 accounting];
    id v5 = [v4 businessName];
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)userDisplayName
{
  BOOL v3 = [(ENSession *)self user];
  int v4 = [v3 name];
  id v5 = v4;
  if (v4)
  {
    double v6 = v4;
  }
  else
  {
    char v7 = [(ENSession *)self user];
    double v6 = [v7 username];
  }
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = &stru_26F008428;
  }
  uint64_t v9 = v8;

  return v9;
}

- (BOOL)isBusinessUser
{
  uint64_t v2 = [(ENSession *)self user];
  BOOL v3 = [v2 accounting];
  int v4 = [v3 businessId];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isPremiumUser
{
  uint64_t v2 = [(ENSession *)self user];
  BOOL v3 = [v2 privilege];
  BOOL v4 = (int)[v3 intValue] > 2;

  return v4;
}

- (BOOL)isAuthenticationInProgress
{
  uint64_t v2 = [(ENSession *)self authenticator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)completeAuthenticationWithError:(id)a3
{
  id v6 = a3;
  if (v6) {
    [(ENSession *)self unauthenticate];
  }
  BOOL v4 = [(ENSession *)self authenticationCompletion];

  if (v4)
  {
    BOOL v5 = [(ENSession *)self authenticationCompletion];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(ENSession *)self setAuthenticationCompletion:0];
  }
  [(ENSession *)self setAuthenticator:0];
}

- (void)refreshUploadUsage
{
  BOOL v3 = [(ENSession *)self primaryNoteStore];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__ENSession_refreshUploadUsage__block_invoke;
  v6[3] = &unk_264E5A6A8;
  void v6[4] = self;
  [v3 fetchSyncStateWithCompletion:v6];

  if ([(ENSession *)self isBusinessUser])
  {
    BOOL v4 = [(ENSession *)self businessNoteStore];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__ENSession_refreshUploadUsage__block_invoke_2;
    v5[3] = &unk_264E5A6A8;
    v5[4] = self;
    [v4 fetchSyncStateWithCompletion:v5];
  }
}

void __31__ENSession_refreshUploadUsage__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v7 = +[ENSession sharedSession];
    BOOL v3 = [v7 logger];
    BOOL v4 = [NSString stringWithFormat:@"Failed to get personal sync state"];
    [v3 evernoteLogErrorString:v4];
  }
  else
  {
    id v6 = [a2 uploaded];
    objc_msgSend(*(id *)(a1 + 32), "setPersonalUploadUsage:", objc_msgSend(v6, "longLongValue"));

    id v7 = [*(id *)(a1 + 32) user];
    BOOL v3 = [v7 accounting];
    BOOL v4 = [v3 uploadLimit];
    objc_msgSend(*(id *)(a1 + 32), "setPersonalUploadLimit:", objc_msgSend(v4, "longLongValue"));
  }
}

void __31__ENSession_refreshUploadUsage__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v7 = +[ENSession sharedSession];
    BOOL v3 = [v7 logger];
    BOOL v4 = [NSString stringWithFormat:@"Failed to get business sync state"];
    [v3 evernoteLogErrorString:v4];
  }
  else
  {
    id v6 = [a2 uploaded];
    objc_msgSend(*(id *)(a1 + 32), "setBusinessUploadUsage:", objc_msgSend(v6, "longLongValue"));

    id v7 = [*(id *)(a1 + 32) businessUser];
    BOOL v3 = [v7 accounting];
    BOOL v4 = [v3 uploadLimit];
    objc_msgSend(*(id *)(a1 + 32), "setBusinessUploadLimit:", objc_msgSend(v4, "longLongValue"));
  }
}

- (void)performPostAuthentication
{
  [(ENSession *)self notifyAuthenticationChanged];
  BOOL v3 = [(ENSession *)self authenticationCompletion];
  BOOL v4 = v3 != 0;

  BOOL v5 = [(ENSession *)self userStore];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__ENSession_performPostAuthentication__block_invoke;
  v6[3] = &unk_264E5A680;
  void v6[4] = self;
  BOOL v7 = v4;
  [v5 fetchUserWithCompletion:v6];
}

void __38__ENSession_performPostAuthentication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[ENSession sharedSession];
    BOOL v7 = [v6 logger];
    id v8 = [NSString stringWithFormat:@"Failed to get user info for user: %@", v5];
    [v7 evernoteLogErrorString:v8];

    if (*(unsigned char *)(a1 + 40)) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
    [*(id *)(a1 + 32) completeAuthenticationWithError:v9];
  }
  else
  {
    [*(id *)(a1 + 32) setUser:v11];
    uint64_t v10 = [*(id *)(a1 + 32) preferences];
    [v10 encodeObject:v11 forKey:@"User"];

    [*(id *)(a1 + 32) completeAuthenticationWithError:0];
    if (!disableRefreshingNotebooksCacheOnLaunch) {
      [*(id *)(a1 + 32) listNotebooksWithCompletion:&__block_literal_global_85];
    }
    [*(id *)(a1 + 32) refreshUploadUsage];
  }
}

void __38__ENSession_performPostAuthentication__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (a3)
  {
    id v4 = a3;
    id v5 = +[ENSession sharedSession];
    id v6 = [v5 logger];
    BOOL v7 = [NSString stringWithFormat:@"Error when listing notebooks: %@", v4];

    [v6 evernoteLogErrorString:v7];
  }
  id v8 = +[ENSession sharedSession];
  id v9 = [v8 logger];
  uint64_t v10 = [NSString stringWithFormat:@"Notebooks: %@", v11];
  [v9 evernoteLogInfoString:v10];
}

- (void)selectInitialSessionHost
{
  if ([(id)SessionHostOverride length])
  {
    BOOL v3 = (__CFString *)SessionHostOverride;
LABEL_3:
    [(ENSession *)self setSessionHost:v3];
    return;
  }
  if (NoteStoreUrl)
  {
    objc_msgSend(NSURL, "URLWithString:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v12 host];
    [(ENSession *)self setSessionHost:v4];
  }
  else
  {
    id v5 = [(ENSession *)self currentProfileName];
    int v6 = [v5 isEqualToString:@"Evernote"];

    if (v6)
    {
      BOOL v3 = @"www.evernote.com";
      goto LABEL_3;
    }
    BOOL v7 = [(ENSession *)self currentProfileName];
    int v8 = [v7 isEqualToString:@"Evernote-China"];

    if (v8)
    {
      BOOL v3 = @"app.yinxiang.com";
      goto LABEL_3;
    }
    id v9 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v10 = [v9 localeIdentifier];
    id v12 = [v10 lowercaseString];

    if ([v12 hasPrefix:@"zh-hans"])
    {
      id v11 = @"app.yinxiang.com";
    }
    else
    {
      id v11 = @"app.yinxiang.com";
      if (([v12 isEqualToString:@"zh-cn"] & 1) == 0
        && ![v12 isEqualToString:@"zh"])
      {
        id v11 = @"www.evernote.com";
      }
    }
    [(ENSession *)self setSessionHost:v11];
  }
}

- (void)startup
{
  BOOL v3 = objc_alloc_init(ENSessionDefaultLogger);
  [(ENSession *)self setLogger:v3];

  if (SecurityApplicationGroupIdentifier) {
    +[ENPreferencesStore preferenceStoreWithSecurityApplicationGroupIdentifier:](ENPreferencesStore, "preferenceStoreWithSecurityApplicationGroupIdentifier:");
  }
  else {
  id v4 = +[ENPreferencesStore defaultPreferenceStore];
  }
  [(ENSession *)self setPreferences:v4];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_storeClientFailedAuthentication_ name:ENStoreClientDidFailWithAuthenticationErrorNotification object:0];

  dispatch_queue_t v6 = dispatch_queue_create("evernote-sdk-ios-thumbnail", MEMORY[0x263EF83A8]);
  [(ENSession *)self setThumbnailQueue:v6];

  [(ENSession *)self selectInitialSessionHost];
  if (DeveloperToken)
  {
    [(ENSession *)self setIsAuthenticated:1];
    [(ENSession *)self setPrimaryAuthenticationToken:DeveloperToken];
    [(ENSession *)self performPostAuthentication];
  }
  else
  {
    BOOL v7 = [(ENSession *)self sessionHost];
    id v14 = [(ENSession *)self credentialsForHost:v7];

    if (v14 && ([v14 areValid] & 1) != 0)
    {
      [(ENSession *)self setIsAuthenticated:1];
      int v8 = [v14 authenticationToken];
      [(ENSession *)self setPrimaryAuthenticationToken:v8];

      id v9 = [(ENSession *)self preferences];
      uint64_t v10 = [v9 decodedObjectForKey:@"User"];
      [(ENSession *)self setUser:v10];

      id v11 = [(ENSession *)self preferences];
      id v12 = [v11 decodedObjectForKey:@"BusinessUser"];
      [(ENSession *)self setBusinessUser:v12];

      [(ENSession *)self performPostAuthentication];
    }
    else
    {
      [(ENSession *)self setIsAuthenticated:0];
      id v13 = [(ENSession *)self preferences];
      [v13 removeAllItems];
    }
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ENSession;
  [(ENSession *)&v4 dealloc];
}

- (ENSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENSession;
  uint64_t v2 = [(ENSession *)&v5 init];
  if (v2)
  {
    if (![(id)objc_opt_class() checkSharedSessionSettings])
    {
      BOOL v3 = 0;
      goto LABEL_6;
    }
    [(ENSession *)v2 setSupportsLinkedAppNotebook:1];
    [(ENSession *)v2 startup];
  }
  BOOL v3 = v2;
LABEL_6:

  return v3;
}

+ (id)bundleSeedID
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F171C8], *MEMORY[0x263F171B8], @"bundleSeedID", *MEMORY[0x263F16ED8], &stru_26F008428, *MEMORY[0x263F17090], *MEMORY[0x263EFFB40], *MEMORY[0x263F17518], 0);
  CFDictionaryRef v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFTypeRef result = 0;
  OSStatus v3 = SecItemCopyMatching(v2, &result);
  if (v3 == -25300) {
    OSStatus v3 = SecItemAdd(v2, &result);
  }
  if (v3)
  {
    objc_super v4 = 0;
  }
  else
  {
    objc_super v5 = [(id)result objectForKey:*MEMORY[0x263F16E80]];
    dispatch_queue_t v6 = [v5 componentsSeparatedByString:@"."];
    BOOL v7 = [v6 objectEnumerator];
    objc_super v4 = [v7 nextObject];

    CFRelease(result);
  }

  return v4;
}

+ (BOOL)checkSharedSessionSettings
{
  if (DeveloperToken) {
    BOOL v2 = NoteStoreUrl == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2
    || ConsumerKey
    && ([(id)ConsumerKey isEqualToString:@"your key"] & 1) == 0
    && ConsumerSecret
    && ![(id)ConsumerSecret isEqualToString:@"your secret"])
  {
    return 1;
  }
  NSLog(&stru_26F00EA68.isa, a2, @"Cannot create shared Evernote session without either a valid consumer key/secret pair, or a developer token set");
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", @"Cannot create shared Evernote session without either a valid consumer key/secret pair, or a developer token set" format];
  return 0;
}

+ (id)developerToken
{
  return (id)DeveloperToken;
}

+ (id)consumerSecret
{
  return (id)ConsumerSecret;
}

+ (id)consumerKey
{
  return (id)ConsumerKey;
}

+ (id)sessionHostOverride
{
  return (id)SessionHostOverride;
}

+ (id)keychainAccessGroup
{
  return (id)_keychainAccessGroup;
}

+ (void)setKeychainGroup:(id)a3
{
  objc_storeStrong((id *)&_keychainGroup, a3);
  id v5 = a3;
  id v9 = [a1 bundleSeedID];
  dispatch_queue_t v6 = [v9 stringByAppendingString:@"."];
  uint64_t v7 = [v6 stringByAppendingString:_keychainGroup];
  int v8 = (void *)_keychainAccessGroup;
  _keychainAccessGroup = v7;
}

+ (void)setSecurityApplicationGroupIdentifier:(id)a3
{
}

+ (void)setDisableRefreshingNotebooksCacheOnLaunch:(BOOL)a3
{
  disableRefreshingNotebooksCacheOnLaunch = a3;
}

+ (ENSession)sharedSession
{
  if (sharedSession_onceToken != -1) {
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_34903);
  }
  BOOL v2 = (void *)sharedSession_session;
  return (ENSession *)v2;
}

void __26__ENSession_sharedSession__block_invoke()
{
  v0 = objc_alloc_init(ENSession);
  v1 = (void *)sharedSession_session;
  sharedSession_session = (uint64_t)v0;
}

+ (void)setSharedSessionDeveloperToken:(id)a3 noteStoreUrl:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)DeveloperToken;
  DeveloperToken = (uint64_t)v5;
  id v12 = v5;

  int v8 = (void *)NoteStoreUrl;
  NoteStoreUrl = (uint64_t)v6;
  id v9 = v6;

  uint64_t v10 = (void *)ConsumerKey;
  ConsumerKey = 0;

  id v11 = (void *)ConsumerSecret;
  ConsumerSecret = 0;
}

+ (void)setSharedSessionConsumerKey:(id)a3 consumerSecret:(id)a4 optionalHost:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)ConsumerKey;
  ConsumerKey = (uint64_t)v7;
  id v17 = v7;

  id v11 = (void *)ConsumerSecret;
  ConsumerSecret = (uint64_t)v8;
  id v12 = v8;

  id v13 = (void *)SessionHostOverride;
  SessionHostOverride = (uint64_t)v9;
  id v14 = v9;

  long long v15 = (void *)DeveloperToken;
  DeveloperToken = 0;

  long long v16 = (void *)NoteStoreUrl;
  NoteStoreUrl = 0;
}

@end