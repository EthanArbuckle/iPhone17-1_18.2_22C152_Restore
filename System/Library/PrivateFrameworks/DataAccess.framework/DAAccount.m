@interface DAAccount
+ (BOOL)shouldCreateAccountForBackingAccountInfo:(id)a3;
+ (id)_leafAccountTypes;
+ (id)daAccountSubclassWithBackingAccountInfo:(id)a3;
+ (id)oneshotListOfAccountIDs;
+ (void)reacquireClientRestrictions:(id)a3;
- (ACAccount)backingAccountInfo;
- (BOOL)_isIdentityManagedByProfile;
- (BOOL)_reallySearchQueriesRunning;
- (BOOL)accountBoolPropertyForKey:(id)a3;
- (BOOL)accountContainsEmailAddress:(id)a3;
- (BOOL)accountHasSignificantPropertyChangesFromOldAccountInfo:(id)a3;
- (BOOL)accountHasSignificantPropertyChangesWithChangeInfo:(id)a3;
- (BOOL)autodiscoverAccountConfigurationWithConsumer:(id)a3;
- (BOOL)canSaveWithAccountProvider:(id)a3;
- (BOOL)enabledForAnyDADataclasses:(int64_t)a3;
- (BOOL)enabledForDADataclass:(int64_t)a3;
- (BOOL)getFetchingAutomaticallyState;
- (BOOL)handleCertificateError:(id)a3;
- (BOOL)handleTrustChallenge:(id)a3;
- (BOOL)handleTrustChallenge:(id)a3 completionHandler:(id)a4;
- (BOOL)hasXpcActivity;
- (BOOL)isActiveSyncAccount;
- (BOOL)isCalDAVAccount;
- (BOOL)isCalDAVChildAccount;
- (BOOL)isCardDAVAccount;
- (BOOL)isChildAccount;
- (BOOL)isDelegateAccount;
- (BOOL)isDisabled;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (BOOL)isGoogleAccount;
- (BOOL)isHotmailAccount;
- (BOOL)isLDAPAccount;
- (BOOL)isOofSupported;
- (BOOL)isSubscribedCalendarAccount;
- (BOOL)isValidating;
- (BOOL)monitorFolderWithID:(id)a3;
- (BOOL)monitorFoldersWithIDs:(id)a3;
- (BOOL)preflightSaveWithAccountProvider:(id)a3;
- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4;
- (BOOL)resetCertWarnings;
- (BOOL)saveAccountProperties;
- (BOOL)saveAccountPropertiesWithError:(id *)a3;
- (BOOL)saveModifiedPropertiesOnBackingAccount;
- (BOOL)searchQueriesRunning;
- (BOOL)sendEmailsForCalEvents:(id)a3 consumer:(id)a4;
- (BOOL)shouldAutodiscoverAccountProperties;
- (BOOL)shouldCancelTaskDueToOnPowerFetchMode;
- (BOOL)shouldDoInitialAutodiscovery;
- (BOOL)shouldFailAllTasks;
- (BOOL)shouldRemoveDBSyncDataOnAccountChange;
- (BOOL)shouldUseOpportunisticSockets;
- (BOOL)upgradeAccount;
- (BOOL)useSSL;
- (BOOL)useSSLFromDataclassPropertiesForDataclass:(id)a3;
- (BOOL)wasUserInitiated;
- (DAAccount)initWithBackingAccountInfo:(id)a3;
- (DAStatusReport)statusReport;
- (DATaskManager)taskManager;
- (DATrustHandler)trustHandler;
- (NSArray)appIdsForPasswordPrompt;
- (NSArray)emailAddresses;
- (NSData)encryptionIdentityPersistentReference;
- (NSData)identityPersist;
- (NSData)signingIdentityPersistentReference;
- (NSDate)lastQueryStartedTime;
- (NSMutableArray)pendingQueries;
- (NSMutableDictionary)dataclassPropertyURLsByDataclass;
- (NSSet)serverComplianceClasses;
- (NSString)accountDescription;
- (NSString)accountID;
- (NSString)changeTrackingID;
- (NSString)clientToken;
- (NSString)emailAddress;
- (NSString)host;
- (NSString)hostWithoutPath;
- (NSString)password;
- (NSString)preferredAddress;
- (NSString)principalPath;
- (NSString)publicDescription;
- (NSString)scheduleIdentifier;
- (NSString)scheme;
- (NSString)serverRoot;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)username;
- (NSURL)principalURL;
- (OS_dispatch_queue)pendingQueryQueue;
- (__CFData)exceptionsForDigest:(id)a3;
- (__CFURLStorageSession)copyStorageSession;
- (id)accountPropertyForKey:(id)a3;
- (id)accountTypeIdentifier;
- (id)accountsProviderWithDBHelper:(id)a3;
- (id)addUsernameToURL:(id)a3;
- (id)additionalHeaderValues;
- (id)beginDownloadingAttachmentWithUUID:(id)a3 consumer:(id)a4;
- (id)consumerForTask:(id)a3;
- (id)contactsFolders;
- (id)containerProviderWithDBHelper:(id)a3;
- (id)customConnectionProperties;
- (id)dataclassProperties;
- (id)defaultContactsFolder;
- (id)defaultContainerIdentifierForDADataclass:(int64_t)a3;
- (id)defaultEventsFolder;
- (id)defaultNotesFolder;
- (id)defaultToDosFolder;
- (id)deletedItemsFolder;
- (id)description;
- (id)domainOnly;
- (id)draftsFolder;
- (id)eventsFolders;
- (id)exceptionsDict;
- (id)fetchOfficeHoursWithConsumer:(id)a3 error:(id *)a4;
- (id)getAppleIDSession;
- (id)getPendingQueryQueue;
- (id)hostFromDataclassPropertiesForDataclass:(id)a3;
- (id)inboxFolder;
- (id)localizedIdenticalAccountFailureMessage;
- (id)localizedInvalidPasswordMessage;
- (id)notesFolders;
- (id)oauth2Token;
- (id)objectForKeyedSubscript:(id)a3;
- (id)onBehalfOfBundleIdentifier;
- (id)passwordWithExpected:(BOOL)a3;
- (id)performCalendarDirectorySearchForTerms:(id)a3 recordTypes:(id)a4 resultLimit:(unint64_t)a5 consumer:(id)a6;
- (id)protocolVersion;
- (id)reportShareRequestAsJunkForCalendar:(id)a3 consumer:(id)a4;
- (id)requestCalendarAvailabilityForStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 consumer:(id)a7;
- (id)requestGrantedDelegatesListWithConsumer:(id)a3;
- (id)respondToShareRequestForCalendar:(id)a3 withResponse:(int64_t)a4 consumer:(id)a5;
- (id)sentItemsFolder;
- (id)setOfficeHours:(id)a3 withConsumer:(id)a4 error:(id *)a5;
- (id)spinnerIdentifiers;
- (id)stateString;
- (id)toDosFolders;
- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5;
- (id)updateGrantedDelegatePermission:(id)a3 consumer:(id)a4;
- (id)urlFromDataclassPropertiesForDataclass:(id)a3;
- (int)accountIntPropertyForKey:(id)a3;
- (int)daAccountVersion;
- (int)keychainAccessibilityType;
- (int)supportsEmailFlagging;
- (int)supportsMailboxSearch;
- (int)toDosNumberOfPastDaysToSync;
- (int64_t)enabledDataclassesBitmask;
- (int64_t)port;
- (int64_t)portFromDataclassPropertiesForDataclass:(id)a3;
- (void)_dequeueQuery;
- (void)_handleSignificantPropertyChanges:(id)a3;
- (void)_reallyPerformSearchQuery:(id)a3;
- (void)_refreshCredential;
- (void)_setPersistentUUID:(id)a3;
- (void)_webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6;
- (void)accountDidChangeFromOldAccountInfo:(id)a3;
- (void)accountDidChangeWithChangeInfo:(id)a3;
- (void)cancelAllSearchQueries;
- (void)cancelCalendarAvailabilityRequestWithID:(id)a3;
- (void)cancelCalendarDirectorySearchWithID:(id)a3;
- (void)cancelGrantedDelegatesListRequestWithID:(id)a3;
- (void)cancelSearchQuery:(id)a3;
- (void)cancelUpdateGrantedDelegatePermissionRequestWithID:(id)a3;
- (void)checkValidityOnAccountStore:(id)a3 withConsumer:(id)a4;
- (void)checkValidityOnAccountStore:(id)a3 withConsumer:(id)a4 inQueue:(id)a5;
- (void)cleanupAccountFiles;
- (void)clientTokenRequestedByServer;
- (void)dealloc;
- (void)decrementXpcActivityContinueCount;
- (void)discoverInitialPropertiesWithConsumer:(id)a3;
- (void)dropAssertionsAndRenewCredentialsInQueue:(id)a3 withHandler:(id)a4;
- (void)handleValidationError:(id)a3 completion:(id)a4;
- (void)incrementXpcActivityContinueCount;
- (void)performGroupExpansionForPrincipalPath:(id)a3 consumer:(id)a4;
- (void)performSearchQuery:(id)a3;
- (void)performUsingAccountPersona:(id)a3;
- (void)reload;
- (void)removeAccountPropertyForKey:(id)a3;
- (void)removeClientCertificateData;
- (void)removeConsumerForTask:(id)a3;
- (void)removeDBSyncDataForAccountChange:(id)a3;
- (void)removeXpcActivity;
- (void)resetAccountID;
- (void)resetStatusReport;
- (void)resumeMonitoringFoldersWithIDs:(id)a3;
- (void)retrieveOofSettingsForConsumer:(id)a3;
- (void)saveFetchingAutomaticallyState:(BOOL)a3;
- (void)saveXpcActivity:(id)a3;
- (void)setAccountBoolProperty:(BOOL)a3 forKey:(id)a4;
- (void)setAccountDescription:(id)a3;
- (void)setAccountIntProperty:(int)a3 forKey:(id)a4;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setConsumer:(id)a3 forTask:(id)a4;
- (void)setDAAccountVersion:(int)a3;
- (void)setDataclassPropertyURLsByDataclass:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEnabled:(BOOL)a3 forDADataclass:(int64_t)a4;
- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4;
- (void)setEncryptionIdentityPersistentReference:(id)a3;
- (void)setExceptions:(__CFData *)a3 forDigest:(id)a4;
- (void)setHost:(id)a3;
- (void)setIdentityCertificatePersistentID:(id)a3 managedByProfile:(BOOL)a4;
- (void)setIsValidating:(BOOL)a3;
- (void)setLastQueryStartedTime:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setPassword:(id)a3;
- (void)setPendingQueries:(id)a3;
- (void)setPendingQueryQueue:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setPrincipalPath:(id)a3;
- (void)setPrincipalURL:(id)a3;
- (void)setShouldDoInitialAutodiscovery:(BOOL)a3;
- (void)setShouldUseOpportunisticSockets:(BOOL)a3;
- (void)setSigningIdentityPersistentReference:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setStatusReport:(id)a3;
- (void)setTrustHandler:(id)a3;
- (void)setUseSSL:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setWasUserInitiated:(BOOL)a3;
- (void)shutdown;
- (void)stopMonitoringFolderWithID:(id)a3;
- (void)stopMonitoringFolders;
- (void)stopMonitoringFoldersWithIDs:(id)a3;
- (void)suspendMonitoringFoldersWithIDs:(id)a3;
- (void)tearDown;
- (void)updateExistingAccountProperties;
- (void)updateOofSettingsWithParams:(id)a3 consumer:(id)a4;
- (void)webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6;
@end

@implementation DAAccount

- (NSString)accountID
{
  return [(ACAccount *)self->_backingAccountInfo identifier];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_1BA384000, v3, v4, "DAAccount %p is going away...", buf, 0xCu);
  }

  v5 = +[DAAccountMonitor sharedMonitor];
  [v5 unmonitorAccount:self];

  [(DATaskManager *)self->_taskManager shutdown];
  storageSession = self->_storageSession;
  if (storageSession)
  {
    CFRelease(storageSession);
    self->_storageSession = 0;
  }
  [(DAAccount *)self removeXpcActivity];
  v7.receiver = self;
  v7.super_class = (Class)DAAccount;
  [(DAAccount *)&v7 dealloc];
}

- (int)daAccountVersion
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v3 = [(DAAccount *)self accountIntPropertyForKey:@"DAAccountVersion2"];
  if (!v3)
  {
    v8 = DMGetPreviousBuildVersion();
    v5 = v8;
    if (v8)
    {
      int v9 = [v8 intValue];
      if (v9)
      {
        int v10 = v9;
        v11 = DALoggingwithCategory();
        os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
        BOOL v13 = os_log_type_enabled(v11, v12);
        if (v10 > 14)
        {
          if (v13)
          {
            v21 = [(DAAccount *)self accountID];
            int v22 = 138543618;
            v23 = v21;
            __int16 v24 = 2114;
            v25 = v5;
            _os_log_impl(&dword_1BA384000, v11, v12, "Account %{public}@ has no DAAccountVersion, and the previous build version string (%{public}@) appears new enough not to force migration. Assuming DAAccountVersion 1.", (uint8_t *)&v22, 0x16u);
          }
          int v4 = 1;
          goto LABEL_16;
        }
        if (v13)
        {
          v14 = [(DAAccount *)self accountID];
          int v22 = 138543618;
          v23 = v14;
          __int16 v24 = 2114;
          v25 = v5;
          v15 = "Account %{public}@ has no DAAccountVersion, and the previous build version string (%{public}@) appears o"
                "ld enough that we think we need to migrate. Forcing account migration.";
LABEL_13:
          v17 = v11;
          os_log_type_t v18 = v12;
          uint32_t v19 = 22;
          goto LABEL_14;
        }
      }
      else
      {
        v11 = DALoggingwithCategory();
        os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
        if (os_log_type_enabled(v11, v12))
        {
          v14 = [(DAAccount *)self accountID];
          int v22 = 138543618;
          v23 = v14;
          __int16 v24 = 2114;
          v25 = v5;
          v15 = "Account %{public}@ has no DAAccountVersion, and the previous build version string (%{public}@) could not"
                " be parsed. Forcing account migration.";
          goto LABEL_13;
        }
      }
    }
    else
    {
      v11 = DALoggingwithCategory();
      os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
      if (os_log_type_enabled(v11, v16))
      {
        v14 = [(DAAccount *)self accountID];
        int v22 = 138543362;
        v23 = v14;
        v15 = "Account %{public}@ has no DAAccountVersion, and we have no previous build version. Forcing account migration.";
        v17 = v11;
        os_log_type_t v18 = v16;
        uint32_t v19 = 12;
LABEL_14:
        _os_log_impl(&dword_1BA384000, v17, v18, v15, (uint8_t *)&v22, v19);
      }
    }
    int v4 = 0;
LABEL_16:

    goto LABEL_17;
  }
  int v4 = v3;
  v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    objc_super v7 = [(DAAccount *)self accountID];
    int v22 = 138543618;
    v23 = v7;
    __int16 v24 = 1024;
    LODWORD(v25) = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Account %{public}@ has DAAccountVersion %d", (uint8_t *)&v22, 0x12u);
  }
LABEL_17:

  return v4;
}

- (BOOL)isDisabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(ACAccount *)self->_backingAccountInfo enabledDataclasses];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(ACAccount *)self->_backingAccountInfo isEnabledToSyncDataclass:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (NSString)accountDescription
{
  v2 = [(ACAccount *)self->_backingAccountInfo displayAccount];
  int v3 = [v2 accountDescription];

  return (NSString *)v3;
}

- (DAAccount)initWithBackingAccountInfo:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAAccount;
  uint64_t v6 = [(DAAccount *)&v15 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingAccountInfo, a3);
    [(DAAccount *)v7 _refreshCredential];
    BOOL v8 = [[DATrustHandler alloc] initWithDelegate:v7];
    trustHandler = v7->_trustHandler;
    v7->_trustHandler = v8;

    [(DAAccount *)v7 resetStatusReport];
    long long v10 = [(DAAccount *)v7 persistentUUID];

    if (!v10)
    {
      CFUUIDRef v11 = CFUUIDCreate(0);
      long long v12 = (__CFString *)CFUUIDCreateString(0, v11);
      CFRelease(v11);
      [(DAAccount *)v7 _setPersistentUUID:v12];
    }
    [(DAAccount *)v7 ingestBackingAccountInfoProperties];
    long long v13 = +[DAAccountMonitor sharedMonitor];
    [v13 monitorAccount:v7];

    *(_WORD *)&v7->_hasInitted = 257;
  }

  return v7;
}

- (void)_refreshCredential
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(ACAccount *)self->_backingAccountInfo isPropertyDirty:*MEMORY[0x1E4F17950]])
  {
    int v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = [(ACAccount *)self->_backingAccountInfo identifier];
      *(_DWORD *)buf = 138543362;
      BOOL v8 = v5;
      _os_log_impl(&dword_1BA384000, v3, v4, "Not clearing/refreshing account credentials for account %{public}@ because the credentials have yet to be saved.", buf, 0xCu);
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__DAAccount__refreshCredential__block_invoke;
    v6[3] = &unk_1E6211520;
    v6[4] = self;
    [(DAAccount *)self performUsingAccountPersona:v6];
  }
}

void *__31__DAAccount__refreshCredential__block_invoke(void *result, uint64_t a2)
{
  if (a2)
  {
    v2 = result;
    [*(id *)(result[4] + 8) _clearCachedCredentials];
    return (id)[*(id *)(v2[4] + 8) credential];
  }
  return result;
}

+ (id)daAccountSubclassWithBackingAccountInfo:(id)a3
{
  id v3 = a3;
  os_log_type_t v4 = [v3 accountType];
  id v5 = [v4 identifier];
  if ([v5 isEqualToString:*MEMORY[0x1E4F17798]])
  {
  }
  else
  {
    uint64_t v6 = [v3 accountType];
    objc_super v7 = [v6 identifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F177D0]];

    if (!v8)
    {
      CFUUIDRef v11 = +[DAAccountLoader sharedInstance];
      long long v12 = (objc_class *)[v11 daemonAppropriateAccountClassForACAccount:v3];

      uint64_t v9 = [[v12 alloc] initWithBackingAccountInfo:v3];
      goto LABEL_8;
    }
  }
  if (!ExchangeSyncLibraryCore())
  {
    long long v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [getESAccountClass() esAccountSubclassWithBackingAccountInfo:v3];
LABEL_8:
  long long v10 = (void *)v9;
LABEL_9:

  return v10;
}

+ (BOOL)shouldCreateAccountForBackingAccountInfo:(id)a3
{
  return 1;
}

- (id)accountsProviderWithDBHelper:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F5E940];
  id v4 = a3;
  if ([v3 useContactsFramework])
  {
    id v5 = [v4 contactStore];

    uint64_t v6 = +[DAContactsAccountProvider providerWithContactStore:v5];
  }
  else
  {
    uint64_t v7 = [v4 abDB];

    uint64_t v6 = +[DAContactsAccountProvider providerWithAddressBook:v7];
  }
  return v6;
}

- (id)containerProviderWithDBHelper:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F5E940];
  id v4 = a3;
  if ([v3 useContactsFramework])
  {
    id v5 = [v4 contactStore];

    uint64_t v6 = +[DAContainerProvider providerWithContactStore:v5];
  }
  else
  {
    uint64_t v7 = [v4 abDB];

    uint64_t v6 = +[DAContainerProvider providerWithAddressBook:v7];
  }
  return v6;
}

- (void)setDAAccountVersion:(int)a3
{
}

- (BOOL)upgradeAccount
{
  int v3 = [(DAAccount *)self daAccountVersion];
  if (v3 <= 0)
  {
    [(DAAccount *)self setAccountProperty:MEMORY[0x1E4F1CC28] forKey:@"DAAccountUseTrustedSSLCertificate"];
    [(DAAccount *)self setDAAccountVersion:1];
  }
  return v3 < 1;
}

- (void)resetAccountID
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 324, @"We shouldn't be resetting our account id, ever" object file lineNumber description];
}

- (NSString)scheduleIdentifier
{
  int v3 = [(DAAccount *)self backingAccountInfo];
  id v4 = [v3 parentAccount];

  if (v4)
  {
    id v5 = [(DAAccount *)self backingAccountInfo];
    uint64_t v6 = [v5 parentAccount];
    uint64_t v7 = [v6 identifier];
  }
  else
  {
    uint64_t v7 = [(DAAccount *)self persistentUUID];
  }
  return (NSString *)v7;
}

- (void)_setPersistentUUID:(id)a3
{
}

- (NSString)changeTrackingID
{
  v2 = NSString;
  int v3 = [(DAAccount *)self persistentUUID];
  id v4 = [v2 stringWithFormat:@"com.apple.dataaccessd-%@", v3];

  return (NSString *)v4;
}

- (NSString)publicDescription
{
  int v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACAccount *)self->_backingAccountInfo identifier];
  uint64_t v7 = [v3 stringWithFormat:@"%@ %@", v5, v6];

  return (NSString *)v7;
}

- (void)setAccountDescription:(id)a3
{
  backingAccountInfo = self->_backingAccountInfo;
  id v4 = a3;
  id v5 = [(ACAccount *)backingAccountInfo displayAccount];
  [v5 setAccountDescription:v4];
}

- (NSString)username
{
  return [(ACAccount *)self->_backingAccountInfo username];
}

- (void)setUsername:(id)a3
{
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  return [(ACAccount *)self->_backingAccountInfo isEnabledForDataclass:a3];
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
}

- (BOOL)enabledForAnyDADataclasses:(int64_t)a3
{
  char v3 = a3;
  if ((a3 & 1) == 0) {
    return (v3 & 2) != 0 && [(DAAccount *)self enabledForDADataclass:2]
  }
        || (v3 & 4) != 0 && [(DAAccount *)self enabledForDADataclass:4]
        || (v3 & 8) != 0 && [(DAAccount *)self enabledForDADataclass:8]
        || (v3 & 0x10) != 0 && [(DAAccount *)self enabledForDADataclass:16]
        || (v3 & 0x20) != 0 && [(DAAccount *)self enabledForDADataclass:32];
  BOOL v5 = 1;
  if (![(DAAccount *)self enabledForDADataclass:1]) {
    return (v3 & 2) != 0 && [(DAAccount *)self enabledForDADataclass:2]
  }
        || (v3 & 4) != 0 && [(DAAccount *)self enabledForDADataclass:4]
        || (v3 & 8) != 0 && [(DAAccount *)self enabledForDADataclass:8]
        || (v3 & 0x10) != 0 && [(DAAccount *)self enabledForDADataclass:16]
        || (v3 & 0x20) != 0 && [(DAAccount *)self enabledForDADataclass:32];
  return v5;
}

- (BOOL)enabledForDADataclass:(int64_t)a3
{
  backingAccountInfo = self->_backingAccountInfo;
  id v4 = acDataclassForDADataclass(a3);
  LOBYTE(backingAccountInfo) = [(ACAccount *)backingAccountInfo isEnabledForDataclass:v4];

  return (char)backingAccountInfo;
}

- (void)setEnabled:(BOOL)a3 forDADataclass:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = [(DAAccount *)self displayName];
    long long v10 = [(DAAccount *)self accountID];
    int v15 = 138412546;
    os_log_type_t v16 = v9;
    __int16 v17 = 2114;
    os_log_type_t v18 = v10;
    _os_log_impl(&dword_1BA384000, v7, v8, "Account \"%@\" (%{public}@) was toggled for a dataclass. Giving it another chance with the babysitter.", (uint8_t *)&v15, 0x16u);
  }
  CFUUIDRef v11 = +[DABabysitter sharedBabysitter];
  long long v12 = [(DAAccount *)self accountID];
  [v11 giveAccountWithIDAnotherChance:v12];

  backingAccountInfo = self->_backingAccountInfo;
  v14 = acDataclassForDADataclass(a4);
  [(ACAccount *)backingAccountInfo setEnabled:v5 forDataclass:v14];
}

- (int64_t)enabledDataclassesBitmask
{
  v2 = [(ACAccount *)self->_backingAccountInfo enabledDataclasses];
  int64_t v3 = daDataclassesForACDataclasses(v2);

  return v3;
}

- (id)dataclassProperties
{
  return (id)[(ACAccount *)self->_backingAccountInfo dataclassProperties];
}

- (id)spinnerIdentifiers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DAAccount *)self backingAccountInfo];
  int v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DAAccount *)self backingAccountInfo];
  [v8 setAccountProperty:v7 forKey:v6];
}

- (void)removeAccountPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(DAAccount *)self backingAccountInfo];
  [v5 setAccountProperty:0 forKey:v4];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DAAccount *)self backingAccountInfo];
  [v8 setAccountProperty:v7 forKey:v6];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(DAAccount *)self backingAccountInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)accountBoolPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(DAAccount *)self backingAccountInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

- (void)setAccountBoolProperty:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v9 = [v6 numberWithBool:v4];
  id v8 = [(DAAccount *)self backingAccountInfo];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (int)accountIntPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(DAAccount *)self backingAccountInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 intValue];
  return (int)v4;
}

- (void)setAccountIntProperty:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v9 = [v6 numberWithInt:v4];
  id v8 = [(DAAccount *)self backingAccountInfo];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (void)resumeMonitoringFoldersWithIDs:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
}

- (void)suspendMonitoringFoldersWithIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    Name = sel_getName(a2);
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1BA384000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)stopMonitoringFolderWithID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    Name = sel_getName(a2);
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1BA384000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)stateString
{
  if (objc_opt_respondsToSelector()) {
    [(DAAccount *)self waiterID];
  }
  else {
  int64_t v3 = [(DAAccount *)self accountID];
  }
  uint64_t v4 = +[DABabysitter sharedBabysitter];
  uint64_t v5 = [v4 accountWithIDShouldContinue:v3];
  id v6 = [(DAAccount *)self statusReport];
  [v6 setSyncingAllowed:v5];

  int v7 = [(DAAccount *)self protocolVersion];
  uint64_t v8 = [(DAAccount *)self statusReport];
  [v8 setProtocolVersion:v7];

  __int16 v9 = NSString;
  id v10 = [(DAAccount *)self accountID];
  uint64_t v11 = [(DAAccount *)self displayName];
  long long v12 = [(DAAccount *)self statusReport];
  uint64_t v13 = [(DATaskManager *)self->_taskManager stateString];
  v14 = (void *)v13;
  int v15 = @"No Task Manager initted yet";
  if (v13) {
    int v15 = (__CFString *)v13;
  }
  os_log_type_t v16 = [v9 stringWithFormat:@"AccountID: %@ (\"%@\"", v10, v11, v12, v15];

  return v16;
}

- (void)setConsumer:(id)a3 forTask:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  consumers = self->_consumers;
  if (!consumers)
  {
    __int16 v9 = (NSMapTable *)objc_opt_new();
    id v10 = self->_consumers;
    self->_consumers = v9;

    consumers = self->_consumers;
  }
  [(NSMapTable *)consumers setObject:v6 forKey:v7];
  uint64_t v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    NSUInteger v13 = [(NSMapTable *)self->_consumers count];
    int v14 = 134218752;
    id v15 = v6;
    __int16 v16 = 2048;
    id v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = self;
    __int16 v20 = 2048;
    NSUInteger v21 = v13;
    _os_log_impl(&dword_1BA384000, v11, v12, "Added consumer %p for task %p to DAAccount %p, count: %lu", (uint8_t *)&v14, 0x2Au);
  }
}

- (id)consumerForTask:(id)a3
{
  return [(NSMapTable *)self->_consumers objectForKey:a3];
}

- (void)removeConsumerForTask:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMapTable *)self->_consumers removeObjectForKey:v4];
  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    NSUInteger v7 = [(NSMapTable *)self->_consumers count];
    int v8 = 134218496;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    NSUInteger v13 = v7;
    _os_log_impl(&dword_1BA384000, v5, v6, "Removed consumer for task %p from DAAccount %p, count: %lu", (uint8_t *)&v8, 0x20u);
  }
}

- (NSString)clientToken
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(DAAccount *)self backingAccountInfo];
  id v4 = [v3 clientToken];

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 134218242;
    id v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Account %p clientToken: %@", (uint8_t *)&v8, 0x16u);
  }

  return (NSString *)v4;
}

- (void)clientTokenRequestedByServer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(DAAccount *)self clientToken];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    uint64_t v5 = objc_msgSend(NSString, "da_newGUID");
    os_log_type_t v6 = [(DAAccount *)self backingAccountInfo];
    [v6 addClientToken:v5];

    NSUInteger v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = 134218242;
      __int16 v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1BA384000, v7, v8, "Account %p clientTokenRequestedByServer, new token: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (id)passwordWithExpected:(BOOL)a3
{
  uint64_t v4 = [(ACAccount *)self->_backingAccountInfo credential];
  uint64_t v5 = [v4 password];

  if (!v5)
  {
    if ([(DAAccount *)self accountBoolPropertyForKey:@"DAAcountWasUpgradedFromLegacyAccount"])
    {
      os_log_type_t v6 = +[DAKeychain sharedKeychain];
      [v6 migratePasswordForAccount:self];

      [(DAAccount *)self setAccountBoolProperty:0 forKey:@"DAAcountWasUpgradedFromLegacyAccount"];
      NSUInteger v7 = [(ACAccount *)self->_backingAccountInfo credential];
      uint64_t v5 = [v7 password];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (NSString)password
{
  int64_t v3 = [(DAAccount *)self identityPersist];
  uint64_t v4 = [(DAAccount *)self passwordWithExpected:v3 == 0];

  return (NSString *)v4;
}

- (void)setPassword:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  os_log_type_t v6 = [(ACAccount *)self->_backingAccountInfo credential];
  NSUInteger v7 = v6;
  if (v5)
  {
    if (v6)
    {
      [v6 setPassword:v4];
    }
    else
    {
      NSUInteger v7 = [objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v4];
      [(ACAccount *)self->_backingAccountInfo setCredential:v7];
    }
    int v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v9, v10))
    {
      __int16 v11 = [(ACAccount *)self->_backingAccountInfo identifier];
      uint64_t v12 = [(ACAccount *)self->_backingAccountInfo username];
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      __int16 v16 = v12;
      _os_log_impl(&dword_1BA384000, v9, v10, "Calling _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", (uint8_t *)&v13, 0x16u);
    }
    [(ACAccount *)self->_backingAccountInfo setAuthenticated:1];
  }
  else
  {
    [v6 setPassword:0];

    NSUInteger v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1BA384000, v7, v8, "Someone wanted to set a nil password, we're editing the live ACAccountCredential", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)performUsingAccountPersona:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(ACAccount *)self->_backingAccountInfo cal_personaIdentifier];
  os_log_type_t v6 = v5;
  if (v5 && [v5 length])
  {
    NSUInteger v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    os_log_type_t v8 = [v7 currentPersona];

    id v20 = 0;
    int v9 = (void *)[v8 copyCurrentPersonaContextWithError:&v20];
    id v10 = v20;
    if (!v9)
    {
      __int16 v15 = DALoggingwithCategory();
      os_log_type_t v17 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v15, v17))
      {
        __int16 v18 = [(ACAccount *)self->_backingAccountInfo identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1BA384000, v15, v17, "Could not get current persona context for account %{public}@, with error %@", buf, 0x16u);

        int v9 = 0;
      }
      __int16 v11 = v10;
      goto LABEL_16;
    }
    __int16 v11 = [v8 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v6];

    if (v11)
    {
      uint64_t v12 = DALoggingwithCategory();
      os_log_type_t v13 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = [(ACAccount *)self->_backingAccountInfo identifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1BA384000, v12, v13, "Could not convert account %{public}@ to persona %@, with error %@", buf, 0x20u);
      }
    }
    __int16 v15 = [v11 domain];
    if (![v15 isEqualToString:@"NSPOSIXErrorDomain"])
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v16 = [v11 code];

    if (v16 == 1)
    {
      __int16 v15 = DALoggingwithCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[DAAccount performUsingAccountPersona:](v15);
      }
      goto LABEL_16;
    }
  }
  else
  {
    int v9 = 0;
    os_log_type_t v8 = 0;
    __int16 v11 = 0;
  }
LABEL_17:
  v4[2](v4, v6);
  if (v8 && v9 && !v11) {
    id v19 = (id)[v8 restorePersonaWithSavedPersonaContext:v9];
  }
}

- (id)urlFromDataclassPropertiesForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DAAccount *)self backingAccountInfo];
  os_log_type_t v6 = [v5 calTopLevelAccount];

  NSUInteger v7 = [v6 dataclassProperties];
  if ([v7 count])
  {
    if (!self->_dataclassPropertyURLsByDataclass)
    {
      os_log_type_t v8 = self;
      objc_sync_enter(v8);
      if (!self->_dataclassPropertyURLsByDataclass)
      {
        int v9 = (NSMutableDictionary *)objc_opt_new();
        dataclassPropertyURLsByDataclass = self->_dataclassPropertyURLsByDataclass;
        self->_dataclassPropertyURLsByDataclass = v9;
      }
      objc_sync_exit(v8);
    }
    __int16 v11 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
    objc_sync_enter(v11);
    uint64_t v12 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
    os_log_type_t v13 = [v12 objectForKeyedSubscript:v4];

    if (!v13)
    {
      uint64_t v14 = [v7 objectForKeyedSubscript:v4];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v14 objectForKeyedSubscript:@"url"],
            (__int16 v15 = objc_claimAutoreleasedReturnValue()) == 0)
        || ([MEMORY[0x1E4F1CB10] URLWithString:v15],
            os_log_type_t v13 = objc_claimAutoreleasedReturnValue(),
            v15,
            !v13))
      {
        os_log_type_t v13 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v16 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
      [v16 setObject:v13 forKeyedSubscript:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      os_log_type_t v13 = 0;
    }
    objc_sync_exit(v11);
  }
  else
  {
    os_log_type_t v13 = 0;
  }

  return v13;
}

- (id)hostFromDataclassPropertiesForDataclass:(id)a3
{
  int64_t v3 = [(DAAccount *)self urlFromDataclassPropertiesForDataclass:a3];
  id v4 = [v3 host];

  return v4;
}

- (BOOL)useSSLFromDataclassPropertiesForDataclass:(id)a3
{
  int64_t v3 = [(DAAccount *)self urlFromDataclassPropertiesForDataclass:a3];
  id v4 = [v3 scheme];
  uint64_t v5 = [v4 lowercaseString];
  char v6 = [v5 isEqualToString:@"https"];

  return v6;
}

- (int64_t)portFromDataclassPropertiesForDataclass:(id)a3
{
  int64_t v3 = [(DAAccount *)self urlFromDataclassPropertiesForDataclass:a3];
  id v4 = [v3 port];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (id)domainOnly
{
  return 0;
}

- (NSString)host
{
  return (NSString *)[(DAAccount *)self objectForKeyedSubscript:@"DAAccountHost"];
}

- (void)setHost:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v5, v6))
  {
    NSUInteger v7 = [(DAAccount *)self host];
    int v8 = 138412546;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Changing Host From %@ to %@", (uint8_t *)&v8, 0x16u);
  }
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"DAAccountHost"];
}

- (NSString)hostWithoutPath
{
  v2 = [(DAAccount *)self host];
  int64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 rangeOfString:@"/"];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [v3 substringToIndex:v4];
    }
    os_log_type_t v6 = v5;
  }
  else
  {
    os_log_type_t v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)useSSL
{
  v2 = [(DAAccount *)self objectForKeyedSubscript:@"DAAccountUseSSL"];
  int64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setUseSSL:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"DAAccountUseSSL"];
}

- (NSString)emailAddress
{
  return (NSString *)[(DAAccount *)self objectForKeyedSubscript:@"DAAccountEmailAddress"];
}

- (void)setEmailAddress:(id)a3
{
  id v4 = a3;
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"DAAccountEmailAddress"];
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"ACUIDisplayUsername"];
}

- (NSArray)emailAddresses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(DAAccount *)self emailAddress];
  v5[0] = v2;
  int64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (BOOL)accountContainsEmailAddress:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(DAAccount *)self emailAddresses];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (![v4 caseInsensitiveCompare:*(void *)(*((void *)&v10 + 1) + 8 * i)])
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSString)preferredAddress
{
  return 0;
}

- (NSData)signingIdentityPersistentReference
{
  return (NSData *)[(DAAccount *)self objectForKeyedSubscript:@"DASigningIdentityPersistentReference"];
}

- (void)setSigningIdentityPersistentReference:(id)a3
{
}

- (NSData)encryptionIdentityPersistentReference
{
  return (NSData *)[(DAAccount *)self objectForKeyedSubscript:@"DAEncryptionIdentityPersistentReference"];
}

- (void)setEncryptionIdentityPersistentReference:(id)a3
{
}

- (int64_t)port
{
  v2 = [(DAAccount *)self objectForKeyedSubscript:@"DAAccountPort"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setPort:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"DAAccountPort"];
}

- (NSString)principalPath
{
  int64_t v3 = [MEMORY[0x1E4F5E990] DAAccountPrincipalPath];
  id v4 = [(DAAccount *)self objectForKeyedSubscript:v3];
  id v5 = objc_msgSend(v4, "da_appendSlashIfNeeded");

  return (NSString *)v5;
}

- (void)setPrincipalPath:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5E990];
  id v5 = a3;
  id v6 = [v4 DAAccountPrincipalPath];
  [(DAAccount *)self setObject:v5 forKeyedSubscript:v6];
}

- (NSString)scheme
{
  if ([(DAAccount *)self useSSL]) {
    v2 = @"https";
  }
  else {
    v2 = @"http";
  }
  return (NSString *)v2;
}

- (NSURL)principalURL
{
  int64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [(DAAccount *)self scheme];
  id v5 = [(DAAccount *)self host];
  int64_t v6 = [(DAAccount *)self port];
  uint64_t v7 = [(DAAccount *)self principalPath];
  int v8 = (void *)v7;
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  else {
    int v9 = @"/";
  }
  long long v10 = objc_msgSend(v3, "da_URLWithScheme:host:port:uri:", v4, v5, v6, v9);

  return (NSURL *)v10;
}

- (void)setPrincipalURL:(id)a3
{
  id v15 = a3;
  id v4 = [v15 scheme];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    int64_t v6 = [v15 scheme];
    -[DAAccount setUseSSL:](self, "setUseSSL:", [v6 isEqualToString:@"http"] ^ 1);
  }
  uint64_t v7 = [v15 host];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    int v9 = [v15 host];
    [(DAAccount *)self setHost:v9];
  }
  long long v10 = [v15 port];

  if (v10)
  {
    long long v11 = [v15 port];
    -[DAAccount setPort:](self, "setPort:", [v11 integerValue]);
  }
  uint64_t v12 = [v15 path];
  long long v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"/";
  }
  [(DAAccount *)self setPrincipalPath:v14];
}

- (void)checkValidityOnAccountStore:(id)a3 withConsumer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dataaccess_get_global_queue();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(DAAccount *)self checkValidityOnAccountStore:v7 withConsumer:v6 inQueue:v8];
}

- (void)checkValidityOnAccountStore:(id)a3 withConsumer:(id)a4 inQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [(DAAccount *)self setIsValidating:1];
  long long v11 = [(DAAccount *)self backingAccountInfo];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke;
  v14[3] = &unk_1E6211598;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v12 = v8;
  id v13 = v9;
  [v10 verifyCredentialsForAccount:v11 saveWhenAuthorized:0 withHandler:v14];
}

void __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dataaccess_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_2;
  block[3] = &unk_1E6211570;
  id v8 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v8;
  id v14 = *(id *)(a1 + 48);
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsValidating:0];
  if (*(void *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) backingAccountInfo];
    [v2 takeValuesFromModifiedAccount:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) removeFromCoreDAVLoggingDelegates];
    [*(id *)(a1 + 32) ingestBackingAccountInfoProperties];
    [*(id *)(a1 + 32) addToCoreDAVLoggingDelegates];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_3;
  block[3] = &unk_1E6211548;
  int64_t v3 = *(NSObject **)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 64);
  dispatch_async(v3, block);
}

uint64_t __62__DAAccount_checkValidityOnAccountStore_withConsumer_inQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "account:isValid:validationError:", *(void *)(a1 + 40), *(void *)(a1 + 48) == 0);
}

- (BOOL)saveModifiedPropertiesOnBackingAccount
{
  return 0;
}

- (void)discoverInitialPropertiesWithConsumer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)autodiscoverAccountConfigurationWithConsumer:(id)a3
{
  return 0;
}

- (BOOL)shouldDoInitialAutodiscovery
{
  return ![(DAAccount *)self accountBoolPropertyForKey:@"DAAccountDidAutodiscover"];
}

- (void)setShouldDoInitialAutodiscovery:(BOOL)a3
{
  id v4 = [NSNumber numberWithInt:!a3];
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"DAAccountDidAutodiscover"];
}

- (BOOL)shouldAutodiscoverAccountProperties
{
  if ([(DAAccount *)self shouldDoInitialAutodiscovery]) {
    return 1;
  }
  id v4 = [(DAAccount *)self principalPath];
  if ([v4 length])
  {
    os_log_type_t v5 = [(DAAccount *)self principalPath];
    char v3 = [v5 isEqualToString:@"/"];
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (id)onBehalfOfBundleIdentifier
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  Name = sel_getName(a2);
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 878, @"%s MUST be implemented in ALL DAAccount subclasses.  Looks like it's missing in %@", Name, objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)shouldRemoveDBSyncDataOnAccountChange
{
  v2 = [(DAAccount *)self backingAccountInfo];
  char v3 = [v2 parentAccountIdentifier];

  return v3 == 0;
}

- (void)removeDBSyncDataForAccountChange:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (![(DAAccount *)self shouldRemoveDBSyncDataOnAccountChange]) {
    return;
  }
  id v4 = +[DALocalDBHelper sharedInstanceForAccountType:@"GenericDataAccessAccount" creatingClass:0];
  BOOL v5 = [(DAAccount *)self enabledForDADataclass:2];
  uint64_t v6 = MEMORY[0x1E4F5E9A0];
  if (!v5)
  {
    BOOL v27 = 0;
    goto LABEL_27;
  }
  id v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(v6 + 6);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412290;
    v65 = self;
    _os_log_impl(&dword_1BA384000, v7, v8, "Removing contacts data for account %@, because it has a significant change", buf, 0xCu);
  }

  id v9 = [(DAAccount *)self changeTrackingID];
  [v4 abOpenDBWithClientIdentifier:v9];

  id v10 = [(DAAccount *)self accountsProviderWithDBHelper:v4];
  long long v11 = [(DAAccount *)self accountID];
  id v12 = [v10 fetchedAccountWithExternalIdentifier:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  if (v12)
  {
    id v14 = [(DAAccount *)self containerProviderWithDBHelper:v4];
    id v15 = [v12 externalIdentifier];
    id v16 = [v14 allContainersForAccountWithExternalIdentifier:v15];

    os_log_type_t v17 = DALoggingwithCategory();
    if (os_log_type_enabled(v17, v8))
    {
      uint64_t v18 = [v16 count];
      *(_DWORD *)buf = 134217984;
      v65 = (DAAccount *)v18;
      _os_log_impl(&dword_1BA384000, v17, v8, "Found %ld contacts sources to remove", buf, 0xCu);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v63 count:16];
    uint64_t v21 = v20;
    if (v20)
    {
      v57 = v4;
      uint64_t v22 = *(void *)v60;
      uint64_t v23 = v20;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v60 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          objc_msgSend(v25, "markForDeletion", v57);
          if ([MEMORY[0x1E4F5E940] useContactsFramework]) {
            [v25 updateSaveRequest:v13];
          }
        }
        uint64_t v23 = [v19 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v23);
      uint64_t v26 = 1;
      id v4 = v57;
    }
    else
    {
      uint64_t v26 = 0;
    }

    char v29 = [MEMORY[0x1E4F5E940] useContactsFramework];
    uint64_t v6 = MEMORY[0x1E4F5E9A0];
    if (v29)
    {
      if (v21)
      {
        [v4 addSaveRequest:v13];
        [v4 executeAllSaveRequests];
        int v28 = 1;
      }
      else
      {
        int v28 = 0;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v26 = 0;
    int v28 = 0;
    if ([MEMORY[0x1E4F5E940] useContactsFramework]) {
      goto LABEL_26;
    }
  }
  [v4 abCloseDBAndSave:v26];
  int v28 = v26;
LABEL_26:

  BOOL v27 = v28 != 0;
LABEL_27:
  if ([(DAAccount *)self enabledForDADataclass:4]
    || [(DAAccount *)self enabledForDADataclass:16])
  {
    v30 = DALoggingwithCategory();
    os_log_type_t v31 = *(unsigned char *)(v6 + 6);
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 138412290;
      v65 = self;
      _os_log_impl(&dword_1BA384000, v30, v31, "Removing event / todo data for account %@, because it has a significant change", buf, 0xCu);
    }

    v32 = [(DAAccount *)self accountID];
    v33 = [(DAAccount *)self changeTrackingID];
    [v4 calOpenDatabaseForAccountID:v32 clientID:v33];

    v34 = [(DAAccount *)self accountID];
    [v4 calDatabaseForAccountID:v34];

    [(DAAccount *)self accountID];
    uint64_t v35 = CalDatabaseCopyStoreWithExternalID();
    if (v35)
    {
      v36 = (const void *)v35;
      v37 = (void *)CalStoreCopyCalendars();
      if ([v37 count])
      {
        v38 = DALoggingwithCategory();
        if (os_log_type_enabled(v38, v31))
        {
          uint64_t v39 = [v37 count];
          *(_DWORD *)buf = 134217984;
          v65 = (DAAccount *)v39;
          _os_log_impl(&dword_1BA384000, v38, v31, "Found %ld calendars to remove", buf, 0xCu);
        }

        if ([v37 count])
        {
          unint64_t v40 = 0;
          do
          {
            [v37 objectAtIndexedSubscript:v40];

            CalRemoveCalendar();
            ++v40;
          }
          while (v40 < [v37 count]);
          BOOL v27 = 1;
        }
      }
      v41 = (const void *)CalStoreCopyExternalModificationTag();
      if (v41)
      {
        CFRelease(v41);
        CalStoreSetExternalModificationTag();
        BOOL v27 = 1;
      }
      CFRelease(v36);
    }
    v42 = [(DAAccount *)self accountID];
    [v4 calCloseDatabaseForAccountID:v42 save:v27];
  }
  if ([(DAAccount *)self enabledForDADataclass:32])
  {
    int v43 = [MEMORY[0x1E4F5E940] completelyIgnoreNotes];
    v44 = DALoggingwithCategory();
    v45 = v44;
    if (v43)
    {
      os_log_type_t v46 = *(unsigned char *)(v6 + 3);
      if (os_log_type_enabled(v44, v46))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA384000, v45, v46, "Ignoring Notes orphan check.  You asked for it.", buf, 2u);
      }
    }
    else
    {
      int v47 = *(unsigned __int8 *)(v6 + 6);
      if (os_log_type_enabled(v44, *(os_log_type_t *)(v6 + 6)))
      {
        *(_DWORD *)buf = 138412290;
        v65 = self;
        _os_log_impl(&dword_1BA384000, v45, (os_log_type_t)v47, "Removing notes data for account %@, because it has a significant change", buf, 0xCu);
      }

      v45 = objc_opt_new();
      [v45 enableChangeLogging:0];
      v48 = [(DAAccount *)self accountID];
      v49 = [v45 accountForAccountId:v48];

      if (v49)
      {
        v50 = DALoggingwithCategory();
        if (os_log_type_enabled(v50, (os_log_type_t)v47))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BA384000, v50, (os_log_type_t)v47, "Found a note account to remove", buf, 2u);
        }

        [v45 deleteAccount:v49];
        id v58 = 0;
        char v51 = [v45 save:&v58];
        id v52 = v58;
        if ((v51 & 1) == 0)
        {
          v53 = DALoggingwithCategory();
          os_log_type_t v54 = *(unsigned char *)(v6 + 3);
          if (os_log_type_enabled(v53, v54))
          {
            v55 = [v52 DAExtendedDescription];
            *(_DWORD *)buf = 138412290;
            v65 = v55;
            _os_log_impl(&dword_1BA384000, v53, v54, "Failed to save: %@", buf, 0xCu);
          }
          if ([MEMORY[0x1E4F82D78] databaseIsCorrupt:v52])
          {
            v56 = DALoggingwithCategory();
            if (os_log_type_enabled(v56, v54))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BA384000, v56, v54, "Notes database was corrupted! Non-fatal at this point, but just barely", buf, 2u);
            }
          }
        }
      }
    }
  }
}

- (void)accountDidChangeWithChangeInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(DAAccount *)self accountHasSignificantPropertyChangesWithChangeInfo:v4])
  {
    BOOL v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v5, v6))
    {
      backingAccountInfo = self->_backingAccountInfo;
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      long long v11 = backingAccountInfo;
      _os_log_impl(&dword_1BA384000, v5, v6, "Account had significant property change, going to flush local data.\n\nChangeInfo %@\n\nNewProperties %@", (uint8_t *)&v8, 0x16u);
    }

    [(DAAccount *)self _handleSignificantPropertyChanges:v4];
  }
}

- (void)_handleSignificantPropertyChanges:(id)a3
{
  [(DAAccount *)self removeDBSyncDataForAccountChange:a3];
  [(DAAccount *)self cleanupAccountFiles];
}

- (NSString)serverRoot
{
  return 0;
}

- (NSSet)serverComplianceClasses
{
  return 0;
}

- (BOOL)handleCertificateError:(id)a3
{
  return 0;
}

- (id)additionalHeaderValues
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [(DAAccount *)self backingAccountInfo];
  char v3 = [v2 credential];

  id v4 = [v3 credentialType];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F178D0]];

  if (!v5)
  {
    __int16 v10 = 0;
    goto LABEL_12;
  }
  os_log_type_t v6 = [v3 credentialItemForKey:*MEMORY[0x1E4F179A0]];
  if (v6)
  {
    id v7 = NSString;
    int v8 = [v3 credentialItemForKey:*MEMORY[0x1E4F17998]];
    id v9 = [v7 stringWithFormat:@"Y=%@ T=%@", v6, v8];;

    if (!v9)
    {
      __int16 v10 = 0;
      goto LABEL_11;
    }
    id v14 = @"Cookie";
    v15[0] = v9;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    id v9 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v9, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA384000, v9, v11, "Couldn't get a Yahoo cookie. Not setting authentication headers", buf, 2u);
    }
    __int16 v10 = 0;
  }

LABEL_11:
LABEL_12:

  return v10;
}

- (id)customConnectionProperties
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F19160];
  v8[0] = *MEMORY[0x1E4F19120];
  char v3 = [(DAAccount *)self onBehalfOfBundleIdentifier];
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E4F19068];
  id v4 = [(DAAccount *)self accountID];
  v9[1] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v11[0] = v5;
  os_log_type_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

- (id)oauth2Token
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = [(DAAccount *)self backingAccountInfo];
    os_log_type_t v6 = [v5 identifier];
    int v18 = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_1BA384000, v3, v4, "Fetching OAuth Credential for Backing Account %@", (uint8_t *)&v18, 0xCu);
  }
  id v7 = [(DAAccount *)self backingAccountInfo];
  int v8 = [v7 credential];

  if (v8)
  {
    id v9 = [v8 credentialType];
    if ([v9 isEqualToString:*MEMORY[0x1E4F178B8]])
    {

LABEL_7:
      uint64_t v12 = [v8 oauthToken];
      goto LABEL_9;
    }
    uint64_t v10 = [v8 credentialType];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F178C0]];

    if (v11) {
      goto LABEL_7;
    }
  }
  uint64_t v12 = 0;
LABEL_9:
  id v13 = DALoggingwithCategory();
  if (os_log_type_enabled(v13, v4))
  {
    if (v12) {
      id v14 = @"Valid";
    }
    else {
      id v14 = @"InValid";
    }
    id v15 = [(DAAccount *)self backingAccountInfo];
    id v16 = [v15 identifier];
    int v18 = 138412802;
    id v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v16;
    _os_log_impl(&dword_1BA384000, v13, v4, "Account Store Returned A %@ OAuth-token From Credential Object %@ AccountID: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  return v12;
}

- (void)tearDown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315394;
    Name = sel_getName(a2);
    __int16 v8 = 2112;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_1BA384000, v3, v4, "%s being ignored by %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)monitorFoldersWithIDs:(id)a3
{
  return 0;
}

- (BOOL)monitorFolderWithID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  os_log_type_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:&v8 count:1];

  LOBYTE(self) = -[DAAccount monitorFoldersWithIDs:](self, "monitorFoldersWithIDs:", v6, v8, v9);
  return (char)self;
}

- (void)stopMonitoringFoldersWithIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    Name = sel_getName(a2);
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1BA384000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)stopMonitoringFolders
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315394;
    Name = sel_getName(a2);
    __int16 v8 = 2112;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_1BA384000, v3, v4, "%s being ignored by %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)defaultContainerIdentifierForDADataclass:(int64_t)a3
{
  return 0;
}

- (void)removeClientCertificateData
{
  char v3 = [(DAAccount *)self identityPersist];
  if (v3)
  {
    id v4 = v3;
    if (![(DAAccount *)self _isIdentityManagedByProfile]) {
      _DASecDeleteIdentityByPersistentRef(v4);
    }
    [(DAAccount *)self setIdentityCertificatePersistentID:0 managedByProfile:0];
    char v3 = v4;
  }
}

- (BOOL)saveAccountPropertiesWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = [(DAAccount *)self accountDescription];
    __int16 v8 = [(DAAccount *)self publicDescription];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1BA384000, v5, v6, "Saving account \"%@\" (%{public}@)", buf, 0x16u);
  }
  id v9 = DALoggingwithCategory();
  if (os_log_type_enabled(v9, v6))
  {
    uint64_t v10 = [(DAAccount *)self backingAccountInfo];
    int v11 = [v10 isAuthenticated];
    uint64_t v12 = [(DAAccount *)self backingAccountInfo];
    id v13 = [v12 identifier];
    id v14 = [(DAAccount *)self backingAccountInfo];
    id v15 = [v14 username];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v11;
    *(_WORD *)&uint8_t buf[8] = 2112;
    *(void *)&buf[10] = v13;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v15;
    _os_log_impl(&dword_1BA384000, v9, v6, " _backingAccountInfo.authenticated is %d for Account identifier %@ and username %@", buf, 0x1Cu);
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__DAAccount_saveAccountPropertiesWithError___block_invoke;
  v22[3] = &unk_1E62115C0;
  v22[4] = self;
  v22[5] = &v23;
  v22[6] = buf;
  [(DAAccount *)self performUsingAccountPersona:v22];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v16, v17))
    {
      backingAccountInfo = self->_backingAccountInfo;
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)BOOL v27 = 138412546;
      int v28 = backingAccountInfo;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_impl(&dword_1BA384000, v16, v17, "Error saving account %@: %@", v27, 0x16u);
    }
  }
  if (a3) {
    *a3 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v20 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v23, 8);
  return v20;
}

void __44__DAAccount_saveAccountPropertiesWithError___block_invoke(void *a1)
{
  v2 = sharedDAAccountStore();
  uint64_t v3 = *(void *)(a1[4] + 8);
  id v8 = 0;
  char v4 = [v2 saveVerifiedAccount:v3 error:&v8];
  id v5 = v8;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;

  uint64_t v6 = *(void *)(a1[6] + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)saveAccountProperties
{
  return [(DAAccount *)self saveAccountPropertiesWithError:0];
}

- (void)updateExistingAccountProperties
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedDAAccountStore();
  char v4 = [(DAAccount *)self backingAccountInfo];
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 accountWithIdentifier:v5];

  if (v6)
  {
    [(DAAccount *)self saveAccountProperties];
  }
  else
  {
    int v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v7, v8))
    {
      backingAccountInfo = self->_backingAccountInfo;
      int v10 = 138412290;
      int v11 = backingAccountInfo;
      _os_log_impl(&dword_1BA384000, v7, v8, "Not updating non-existing account: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (int)keychainAccessibilityType
{
  v2 = [(ACAccount *)self->_backingAccountInfo accountType];
  uint64_t v3 = +[DAKeychain sharedKeychain];
  char v4 = [v2 credentialProtectionPolicy];
  int v5 = [v3 _daKeychainAccessibilityForSecAccessibility:v4];

  return v5;
}

- (id)addUsernameToURL:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 user];
  uint64_t v7 = [v6 length];
  if (!v7)
  {
    uint64_t v3 = [(DAAccount *)self username];
    if ([v3 length])
    {

LABEL_8:
      int v11 = [(DAAccount *)self username];
      uint64_t v12 = objc_msgSend(v11, "da_stringByAddingPercentEscapesForUsername");
      uint64_t v13 = objc_msgSend(v5, "da_urlBySettingUsername:", v12);

      id v5 = (id)v13;
      goto LABEL_9;
    }
  }
  os_log_type_t v8 = [v5 user];
  id v9 = [(DAAccount *)self username];
  char v10 = [v8 isEqualToString:v9];

  if (!v7) {
  if ((v10 & 1) == 0)
  }
    goto LABEL_8;
LABEL_9:
  return v5;
}

- (BOOL)preflightSaveWithAccountProvider:(id)a3
{
  if ([(DAAccount *)self canSaveWithAccountProvider:a3])
  {
    char v4 = [(DAAccount *)self backingAccountInfo];
    id v5 = [MEMORY[0x1E4F5E990] DAAccountSavePreflighted];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
  }
  return 1;
}

- (BOOL)canSaveWithAccountProvider:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(void))a3;
  uint64_t v39 = self;
  v38 = [(DAAccount *)self backingAccountInfo];
  id v5 = [v38 accountType];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [MEMORY[0x1E4F5E990] leafAccountTypesToCheckForEquality];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    unint64_t v40 = v6;
    v37 = v4;
    id v9 = v4[2](v4);
    char v10 = [v38 identifier];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    int v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      obj = v11;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          os_log_type_t v17 = [v16 backingAccountInfo];
          int v18 = [v17 identifier];
          if (([v18 isEqualToString:v10] & 1) == 0)
          {
            uint64_t v19 = [v17 accountType];
            BOOL v20 = [v19 identifier];
            int v21 = [v20 isEqualToString:v40];

            if (v21)
            {
              if ([(DAAccount *)v39 isEqualToAccount:v16])
              {
                __int16 v22 = [v38 accountProperties];
                uint64_t v23 = [v22 count];

                if (v23)
                {
                  uint64_t v24 = [MEMORY[0x1E4F5E990] DAAccountIdentifiersToIgnoreForUniquenessCheck];
                  uint64_t v25 = [v38 objectForKeyedSubscript:v24];
                  char v26 = [v25 containsObject:v18];

                  if ((v26 & 1) == 0)
                  {

                    os_log_type_t v31 = obj;
                    char v4 = v37;
                    uint64_t v6 = v40;
                    goto LABEL_21;
                  }
                }
              }
            }
          }
        }
        int v11 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    char v4 = v37;
    uint64_t v6 = v40;
  }
  BOOL v27 = [MEMORY[0x1E4F5E990] leafAccountTypes];
  int v28 = [v27 containsObject:v6];

  if (v28
    && ([MEMORY[0x1E4F5E990] DAAccountDoNotSaveReason],
        __int16 v29 = objc_claimAutoreleasedReturnValue(),
        [v38 objectForKeyedSubscript:v29],
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        v30,
        v29,
        v30))
  {
    os_log_type_t v31 = DALoggingwithCategory();
    os_log_type_t v32 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = [MEMORY[0x1E4F5E990] DAAccountDoNotSaveReason];
      uint64_t v34 = [v38 objectForKeyedSubscript:v33];
      *(_DWORD *)buf = 138412290;
      int v47 = v34;
      _os_log_impl(&dword_1BA384000, v31, v32, "Refusing to save account because DAAccountDoNotSave is set to \"%@\"", buf, 0xCu);
    }
LABEL_21:

    BOOL v35 = 0;
  }
  else
  {
    BOOL v35 = 1;
  }

  return v35;
}

- (NSData)identityPersist
{
  return (NSData *)[(DAAccount *)self objectForKeyedSubscript:@"DAIdentityPersist"];
}

- (void)setIdentityCertificatePersistentID:(id)a3 managedByProfile:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = @"No";
    if (v4) {
      id v9 = @"Yes";
    }
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1BA384000, v7, v8, "Setting identity certificate. Managed by profile? %@", (uint8_t *)&v11, 0xCu);
  }

  [(DAAccount *)self setObject:v6 forKeyedSubscript:@"DAIdentityPersist"];
  char v10 = [NSNumber numberWithBool:v4];
  [(DAAccount *)self setObject:v10 forKeyedSubscript:@"DAIdentityPersistIsManagedByProfile"];
}

- (BOOL)_isIdentityManagedByProfile
{
  v2 = [(DAAccount *)self objectForKeyedSubscript:@"DAIdentityPersistIsManagedByProfile"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)exceptionsDict
{
  return [(DAAccount *)self objectForKeyedSubscript:@"DATrustSettingsExceptions"];
}

- (__CFData)exceptionsForDigest:(id)a3
{
  id v4 = a3;
  id v5 = [(DAAccount *)self exceptionsDict];
  id v6 = objc_msgSend(v4, "da_hexString");

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return (__CFData *)v7;
}

- (void)setExceptions:(__CFData *)a3 forDigest:(id)a4
{
  id v10 = a4;
  id v6 = [(DAAccount *)self exceptionsDict];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (a3)
  {
    if (!v7) {
      uint64_t v7 = objc_opt_new();
    }
    os_log_type_t v8 = objc_msgSend(v10, "da_hexString");
    [v7 setObject:a3 forKeyedSubscript:v8];
  }
  else
  {
    if (!v7) {
      goto LABEL_8;
    }
    os_log_type_t v8 = objc_msgSend(v10, "da_hexString");
    [v7 removeObjectForKey:v8];
  }

LABEL_8:
  if ([v7 count]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  [(DAAccount *)self setObject:v9 forKeyedSubscript:@"DATrustSettingsExceptions"];
  [(DAAccount *)self saveAccountProperties];
}

- (void)cleanupAccountFiles
{
  v2 = [(DAAccount *)self copyStorageSession];
  if (v2)
  {
    char v3 = v2;
    uint64_t v4 = _CFURLStorageSessionCopyCookieStorage();
    if (v4)
    {
      id v5 = (const void *)v4;
      CFHTTPCookieStorageDeleteAllCookies();
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  uint64_t v6 = CFURLCacheCopySharedURLCache();
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    CFURLCacheRemoveAllCachedResponses();
    CFRelease(v7);
  }
}

- (BOOL)isChildAccount
{
  v2 = [(DAAccount *)self backingAccountInfo];
  char v3 = [v2 parentAccount];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)resetCertWarnings
{
  v2 = [(DAAccount *)self trustHandler];
  char v3 = [v2 resetCertWarnings];

  return v3;
}

- (void)resetStatusReport
{
  char v3 = objc_opt_new();
  [(DAAccount *)self setStatusReport:v3];

  BOOL v4 = [(DAAccount *)self persistentUUID];
  [(DAStatusReport *)self->_statusReport setPersistentUUID:v4];

  id v5 = [(ACAccount *)self->_backingAccountInfo accountType];
  uint64_t v6 = [v5 identifier];
  [(DAStatusReport *)self->_statusReport setAccountType:v6];

  uint64_t v7 = [(DAAccount *)self accountDescription];
  [(DAStatusReport *)self->_statusReport setDisplayName:v7];

  id v8 = [(DAAccount *)self protocolVersion];
  [(DAStatusReport *)self->_statusReport setProtocolVersion:v8];
}

- (BOOL)shouldFailAllTasks
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  char v3 = [(DAAccount *)self backingAccountInfo];
  if (([v3 supportsAuthentication] & 1) == 0)
  {

    goto LABEL_10;
  }
  BOOL v4 = [(DAAccount *)self backingAccountInfo];
  char v5 = [v4 isAuthenticated];

  if (v5) {
    goto LABEL_10;
  }
  uint64_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = [(DAAccount *)self backingAccountInfo];
    id v9 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1BA384000, v6, v7, "Account %@ (%{public}@) says it is not authenticated. Refreshing to be sure.", buf, 0x16u);
  }
  id v10 = [(DAAccount *)self backingAccountInfo];
  [v10 refresh];

  int v11 = [(DAAccount *)self backingAccountInfo];
  char v12 = [v11 isAuthenticated];

  uint64_t v13 = DALoggingwithCategory();
  BOOL v14 = os_log_type_enabled(v13, v7);
  if (v12)
  {
    if (v14)
    {
      id v15 = [(DAAccount *)self backingAccountInfo];
      id v16 = [v15 identifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1BA384000, v13, v7, "Good news! Account %@ (%{public}@) is now authenticated after refreshing.", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (v14)
  {
    os_log_type_t v32 = [(DAAccount *)self backingAccountInfo];
    id v33 = [v32 identifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v33;
    _os_log_impl(&dword_1BA384000, v13, v7, "Account %@ (%{public}@) is still not authenticated after refreshing.", buf, 0x16u);
  }
  uint64_t v34 = [(DAAccount *)self backingAccountInfo];
  BOOL v35 = [v34 accountProperties];
  v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F578F0]];
  int v37 = [v36 BOOLValue];

  if (v37)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v49 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __31__DAAccount_shouldFailAllTasks__block_invoke;
    v43[3] = &unk_1E62115E8;
    v43[4] = self;
    v43[5] = buf;
    [(DAAccount *)self performUsingAccountPersona:v43];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v38 = DALoggingwithCategory();
      if (os_log_type_enabled(v38, v7))
      {
        uint64_t v39 = [(DAAccount *)self backingAccountInfo];
        unint64_t v40 = [v39 identifier];
        *(_DWORD *)long long v44 = 138412546;
        long long v45 = self;
        __int16 v46 = 2114;
        int v47 = v40;
        _os_log_impl(&dword_1BA384000, v38, v7, "The account %@ (%{public}@) is not marked as authenticated, but it supports authentication, appears to have credentials, and is marked to ignore the isAuthenticated property. We will try to sync this account.", v44, 0x16u);
      }
      _Block_object_dispose(buf, 8);
      goto LABEL_10;
    }
    _Block_object_dispose(buf, 8);
  }
  if (![(DAAccount *)self isValidating]
    && (![(DAAccount *)self wasUserInitiated]
     || [(DAAccount *)self isDelegateAccount]))
  {
    uint64_t v19 = DALoggingwithCategory();
    if (os_log_type_enabled(v19, v7))
    {
      v41 = [(DAAccount *)self backingAccountInfo];
      long long v42 = [v41 identifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      _os_log_impl(&dword_1BA384000, v19, v7, "Not attempting request for account %@ because the backing account credential isn't authed %{public}@", buf, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_10:
  os_log_type_t v17 = [(DAAccount *)self backingAccountInfo];
  int v18 = objc_msgSend(v17, "aa_isSuspended");

  if (v18)
  {
    uint64_t v19 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v19, v20))
    {
      int v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      uint64_t v23 = [(DAAccount *)self backingAccountInfo];
      uint64_t v24 = [v23 identifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1BA384000, v19, v20, "Not attempting request for account %{public}@ because the backing account needs to verify terms or is suspended. %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v25 = +[DAKeychain sharedKeychain];
    int v26 = objc_msgSend(v25, "canAccessCredentialsWithAccessibility:", -[DAAccount keychainAccessibilityType](self, "keychainAccessibilityType"));

    if (v26) {
      return 0;
    }
    uint64_t v19 = DALoggingwithCategory();
    os_log_type_t v28 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v19, v28))
    {
      __int16 v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      int v31 = [(DAAccount *)self keychainAccessibilityType];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1BA384000, v19, v28, "Not attempting request for account %{public}@ because we don't have access to keychain items with accessibility %d right now", buf, 0x12u);
    }
  }
LABEL_17:

  return 1;
}

void __31__DAAccount_shouldFailAllTasks__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) backingAccountInfo];
  v2 = [v3 credential];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)isEqualToAccount:(id)a3
{
  char v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  Name = sel_getName(a2);
  [v5 handleFailureInMethod:a2, self, @"DAAccount.m", 1333, @"%s MUST be implemented in ALL DAAccount subclasses.  Looks like it's missing in %@", Name, objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)accountHasSignificantPropertyChangesWithChangeInfo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  uint64_t v39 = [v35 oldAccountProperties];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v44[0] = @"DAAccountHost";
  v44[1] = @"DAAccountEmailAddress";
  char v5 = [MEMORY[0x1E4F5E990] DAAccountPrincipalPath];
  v44[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];

  uint64_t v38 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v38)
  {
    id obj = v6;
    uint64_t v37 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v9 = [(DAAccount *)self backingAccountInfo];
        id v10 = [v9 objectForKeyedSubscript:v8];
        uint64_t v11 = [v10 length];
        if (v11
          || ([v39 objectForKeyedSubscript:v8],
              id v3 = objc_claimAutoreleasedReturnValue(),
              [v3 length]))
        {
          char v12 = self;
          uint64_t v13 = [(DAAccount *)self backingAccountInfo];
          BOOL v14 = [v13 objectForKeyedSubscript:v8];
          id v15 = [v39 objectForKeyedSubscript:v8];
          int v16 = [v14 isEqualToString:v15];

          if (v11)
          {

            self = v12;
            if (!v16) {
              goto LABEL_21;
            }
          }
          else
          {

            self = v12;
            if ((v16 & 1) == 0)
            {
LABEL_21:
              BOOL v26 = 1;
              os_log_type_t v20 = v35;
              goto LABEL_22;
            }
          }
        }
        else
        {
        }
      }
      uint64_t v6 = obj;
      uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }

  os_log_type_t v17 = [(DAAccount *)self backingAccountInfo];
  int v18 = [v17 username];
  uint64_t v19 = [v18 length];
  os_log_type_t v20 = v35;
  if (!v19)
  {
    id v3 = [v35 oldUsername];
    if (![v3 length])
    {
      int v21 = self;

      goto LABEL_27;
    }
  }
  int v21 = self;
  __int16 v22 = [(DAAccount *)self backingAccountInfo];
  uint64_t v23 = [v22 username];
  uint64_t v24 = [v35 oldUsername];
  int v25 = [v23 isEqualToString:v24];

  if (!v19)
  {

    if (v25) {
      goto LABEL_27;
    }
LABEL_25:
    BOOL v26 = 1;
    goto LABEL_23;
  }

  if (!v25) {
    goto LABEL_25;
  }
LABEL_27:
  int v28 = [(DAAccount *)v21 useSSL];
  __int16 v29 = [v39 objectForKeyedSubscript:@"DAAccountUseSSL"];
  uint64_t v30 = v29;
  if (v29) {
    int v31 = [v29 BOOLValue];
  }
  else {
    int v31 = 1;
  }
  id obj = v30;
  if (v31 == v28)
  {
    os_log_type_t v32 = [(DAAccount *)v21 objectForKeyedSubscript:@"DAAccountPort"];
    int v33 = [v32 intValue];
    uint64_t v34 = [v39 objectForKeyedSubscript:@"DAAccountPort"];
    BOOL v26 = v33 != [v34 intValue];
  }
  else
  {
    BOOL v26 = 1;
  }
LABEL_22:

LABEL_23:
  return v26;
}

- (BOOL)isActiveSyncAccount
{
  return 0;
}

- (BOOL)isLDAPAccount
{
  return 0;
}

- (BOOL)isCalDAVAccount
{
  return 0;
}

- (BOOL)isCardDAVAccount
{
  return 0;
}

- (BOOL)isDelegateAccount
{
  return 0;
}

- (BOOL)isCalDAVChildAccount
{
  return 0;
}

- (BOOL)isHotmailAccount
{
  return 0;
}

- (BOOL)isGoogleAccount
{
  return 0;
}

- (BOOL)isSubscribedCalendarAccount
{
  return 0;
}

- (__CFURLStorageSession)copyStorageSession
{
  if (copyStorageSession_once != -1) {
    dispatch_once(&copyStorageSession_once, &__block_literal_global);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__DAAccount_copyStorageSession__block_invoke_2;
  block[3] = &unk_1E6211630;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)copyStorageSession_storageSessionSetupQueue, block);
  return (__CFURLStorageSession *)CFRetain(self->_storageSession);
}

uint64_t __31__DAAccount_copyStorageSession__block_invoke()
{
  copyStorageSession_storageSessionSetupQueue = (uint64_t)dispatch_queue_create("com.apple.dataaccess.StorageSessionSetup", 0);
  return MEMORY[0x1F41817F8]();
}

void __31__DAAccount_copyStorageSession__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[5])
  {
    id v3 = NSString;
    BOOL v4 = [v2 persistentUUID];
    id v8 = [v3 stringWithFormat:@"com.apple.dataaccessd.%@", v4];

    *(void *)(*(void *)(a1 + 32) + 40) = _CFURLStorageSessionCreate();
    char v5 = (const void *)_CFURLStorageSessionCopyCookieStorage();
    CFHTTPCookieStorageSetCookieAcceptPolicy();
    CFRelease(v5);
    uint64_t v6 = _CFURLStorageSessionCopyCache();
    if (v6)
    {
      os_log_type_t v7 = (const void *)v6;
      CFURLCacheSetMemoryCapacity();
      CFURLCacheSetDiskCapacity();
      CFURLCacheRemoveAllCachedResponses();
      CFRelease(v7);
    }
  }
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DAAccount;
  BOOL v4 = [(DAAccount *)&v9 description];
  char v5 = [(DAAccount *)self accountID];
  uint64_t v6 = [(DAAccount *)self persistentUUID];
  os_log_type_t v7 = [v3 stringWithFormat:@"%@: accountID %@ persistentUUID %@", v4, v5, v6];

  return v7;
}

- (void)shutdown
{
  id v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1BA384000, v3, v4, "Shutting down the task manager", v5, 2u);
  }

  [(DATaskManager *)self->_taskManager shutdown];
}

- (void)reload
{
  id v3 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
  [v3 removeAllObjects];

  os_log_type_t v4 = [(DAAccount *)self backingAccountInfo];
  [v4 reload];

  [(DAAccount *)self removeFromCoreDAVLoggingDelegates];
  [(DAAccount *)self ingestBackingAccountInfoProperties];
  [(DAAccount *)self addToCoreDAVLoggingDelegates];
}

- (id)protocolVersion
{
  return 0;
}

- (id)accountTypeIdentifier
{
  v2 = [(ACAccount *)self->_backingAccountInfo accountType];
  id v3 = [v2 identifier];

  return v3;
}

- (BOOL)shouldCancelTaskDueToOnPowerFetchMode
{
  xpcActivity = self->_xpcActivity;
  if (xpcActivity)
  {
    LODWORD(xpcActivity) = xpc_activity_should_defer(xpcActivity);
    if (xpcActivity)
    {
      id v3 = DALoggingwithCategory();
      os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1BA384000, v3, v4, "Canceling task because conditions for on-power mode no longer exist (xpc_activity)", v6, 2u);
      }

      LOBYTE(xpcActivity) = 1;
    }
  }
  return (char)xpcActivity;
}

- (void)saveXpcActivity:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_type_t v4 = (OS_xpc_object *)a3;
  [(DAAccount *)self removeXpcActivity];
  xpcActivity = self->_xpcActivity;
  self->_xpcActivity = v4;

  self->_continueCount = 0;
  uint64_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = [(DAAccount *)self accountID];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1BA384000, v6, v7, "XPC: Saved XPC activity for account %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)hasXpcActivity
{
  return self->_xpcActivity != 0;
}

- (void)incrementXpcActivityContinueCount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_xpcActivity)
  {
    ++self->_continueCount;
    id v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      int continueCount = self->_continueCount;
      uint64_t v6 = [(DAAccount *)self accountID];
      v7[0] = 67109378;
      v7[1] = continueCount;
      __int16 v8 = 2114;
      int v9 = v6;
      _os_log_impl(&dword_1BA384000, v3, v4, "XPC: Increment XPC activity continue count to %d for account %{public}@", (uint8_t *)v7, 0x12u);
    }
  }
}

- (void)decrementXpcActivityContinueCount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_xpcActivity)
  {
    --self->_continueCount;
    id v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      int continueCount = self->_continueCount;
      uint64_t v6 = [(DAAccount *)self accountID];
      v7[0] = 67109378;
      v7[1] = continueCount;
      __int16 v8 = 2114;
      int v9 = v6;
      _os_log_impl(&dword_1BA384000, v3, v4, "XPC: Decrement XPC activity continue count to %d for account %{public}@", (uint8_t *)v7, 0x12u);
    }
    if (self->_continueCount <= 0) {
      [(DAAccount *)self removeXpcActivity];
    }
  }
}

- (void)removeXpcActivity
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  xpcActivity = self->_xpcActivity;
  if (xpcActivity)
  {
    BOOL v4 = xpc_activity_set_state(xpcActivity, 5);
    char v5 = DALoggingwithCategory();
    uint64_t v6 = v5;
    if (v4)
    {
      LOBYTE(v7) = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
      if (os_log_type_enabled(v5, (os_log_type_t)v7))
      {
        __int16 v8 = [(DAAccount *)self accountID];
        int v11 = 138543362;
        char v12 = v8;
        int v9 = "XPC: Successfully set XPC activity state to XPC_ACTIVITY_STATE_DONE for account %{public}@";
LABEL_7:
        _os_log_impl(&dword_1BA384000, v6, (os_log_type_t)v7, v9, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      int v7 = *(unsigned __int8 *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v5, *(os_log_type_t *)(MEMORY[0x1E4F5E9A0] + 3)))
      {
        __int16 v8 = [(DAAccount *)self accountID];
        int v11 = 138543362;
        char v12 = v8;
        int v9 = "XPC: Failed to set XPC activity state to XPC_ACTIVITY_STATE_DONE for account %{public}@";
        goto LABEL_7;
      }
    }

    uint64_t v10 = self->_xpcActivity;
    self->_xpcActivity = 0;

    self->_int continueCount = 0;
  }
}

- (void)saveFetchingAutomaticallyState:(BOOL)a3
{
  self->_isFetchingAutomatically = a3;
}

- (BOOL)getFetchingAutomaticallyState
{
  return self->_isFetchingAutomatically;
}

- (ACAccount)backingAccountInfo
{
  return self->_backingAccountInfo;
}

- (DAStatusReport)statusReport
{
  return self->_statusReport;
}

- (void)setStatusReport:(id)a3
{
}

- (BOOL)shouldUseOpportunisticSockets
{
  return self->_shouldUseOpportunisticSockets;
}

- (void)setShouldUseOpportunisticSockets:(BOOL)a3
{
  self->_shouldUseOpportunisticSockets = a3;
}

- (BOOL)wasUserInitiated
{
  return self->_wasUserInitiated;
}

- (void)setWasUserInitiated:(BOOL)a3
{
  self->_wasUserInitiated = a3;
}

- (DATaskManager)taskManager
{
  return self->_taskManager;
}

- (DATrustHandler)trustHandler
{
  return self->_trustHandler;
}

- (void)setTrustHandler:(id)a3
{
}

- (NSArray)appIdsForPasswordPrompt
{
  return self->_appIdsForPasswordPrompt;
}

- (BOOL)isValidating
{
  return self->_isValidating;
}

- (void)setIsValidating:(BOOL)a3
{
  self->_isValidating = a3;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSMutableDictionary)dataclassPropertyURLsByDataclass
{
  return self->_dataclassPropertyURLsByDataclass;
}

- (void)setDataclassPropertyURLsByDataclass:(id)a3
{
}

- (NSMutableArray)pendingQueries
{
  return self->_pendingQueries;
}

- (void)setPendingQueries:(id)a3
{
}

- (OS_dispatch_queue)pendingQueryQueue
{
  return self->_pendingQueryQueue;
}

- (void)setPendingQueryQueue:(id)a3
{
}

- (NSDate)lastQueryStartedTime
{
  return self->_lastQueryStartedTime;
}

- (void)setLastQueryStartedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryStartedTime, 0);
  objc_storeStrong((id *)&self->_pendingQueryQueue, 0);
  objc_storeStrong((id *)&self->_pendingQueries, 0);
  objc_storeStrong((id *)&self->_dataclassPropertyURLsByDataclass, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdsForPasswordPrompt, 0);
  objc_storeStrong((id *)&self->_trustHandler, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_statusReport, 0);
  objc_storeStrong((id *)&self->_backingAccountInfo, 0);
}

- (BOOL)handleTrustChallenge:(id)a3
{
  id v4 = a3;
  char v5 = [(DAAccount *)self trustHandler];
  LOBYTE(self) = [v5 handleTrustChallenge:v4 forAccount:self];

  return (char)self;
}

- (BOOL)handleTrustChallenge:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [(DAAccount *)self trustHandler];
  LOBYTE(self) = [v8 handleTrustChallenge:v7 forAccount:self completionHandler:v6];

  return (char)self;
}

- (id)getAppleIDSession
{
  return 0;
}

- (id)localizedIdenticalAccountFailureMessage
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = objc_opt_class();
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 1544, @"Account class %@ MUST implement %s", v5, sel_getName(a2) object file lineNumber description];

  return 0;
}

- (id)localizedInvalidPasswordMessage
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = objc_opt_class();
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 1549, @"Account class %@ MUST implement %s", v5, sel_getName(a2) object file lineNumber description];

  return 0;
}

- (void)dropAssertionsAndRenewCredentialsInQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = DALoggingwithCategory();
  uint64_t v9 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v8, v10))
  {
    int v11 = (objc_class *)objc_opt_class();
    char v12 = NSStringFromClass(v11);
    BOOL v13 = [(DAAccount *)self wasUserInitiated];
    BOOL v14 = @"NO";
    if (v13) {
      BOOL v14 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    id v44 = v12;
    __int16 v45 = 2114;
    uint64_t v46 = v14;
    _os_log_impl(&dword_1BA384000, v8, v10, "DataAccess is renewing credentials for account %{public}@ by forcing-prompt: %{public}@", buf, 0x16u);
  }
  id v15 = [(DAAccount *)self backingAccountInfo];
  int v16 = [v15 accountProperties];
  uint64_t v17 = *MEMORY[0x1E4F578F0];
  int v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F578F0]];

  if (v18)
  {
    uint64_t v19 = [(DAAccount *)self backingAccountInfo];
    [v19 setAccountProperty:0 forKey:v17];

    os_log_type_t v20 = sharedDAAccountStore();
    int v21 = [(DAAccount *)self backingAccountInfo];
    id v40 = 0;
    char v22 = [v20 saveVerifiedAccount:v21 error:&v40];
    id v23 = v40;

    if ((v22 & 1) == 0)
    {
      uint64_t v24 = DALoggingwithCategory();
      os_log_type_t v25 = *(unsigned char *)(v9 + 3);
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v23;
        _os_log_impl(&dword_1BA384000, v24, v25, "Failed to save account when attempting to remove kDAAccountIgnoreAuthenticatedProperty flag: %@", buf, 0xCu);
      }
    }
  }
  BOOL v26 = [(DAAccount *)self persistentUUID];
  BOOL v27 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v27 dropPowerAssertionsForGroupIdentifier:v26];

  v41[0] = *MEMORY[0x1E4F17A40];
  int v28 = objc_msgSend(NSNumber, "numberWithBool:", -[DAAccount wasUserInitiated](self, "wasUserInitiated"));
  v42[0] = v28;
  v41[1] = *MEMORY[0x1E4F17A30];
  __int16 v29 = objc_msgSend(NSNumber, "numberWithInt:", -[DAAccount wasUserInitiated](self, "wasUserInitiated") ^ 1);
  v42[1] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

  int v31 = sharedDAAccountStore();
  os_log_type_t v32 = [(DAAccount *)self backingAccountInfo];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke;
  v36[3] = &unk_1E6211680;
  v36[4] = self;
  id v37 = v6;
  id v38 = v26;
  id v39 = v7;
  id v33 = v7;
  id v34 = v26;
  id v35 = v6;
  [v31 renewCredentialsForAccount:v32 options:v30 completion:v36];
}

void __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setWasUserInitiated:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke_2;
  block[3] = &unk_1E6211658;
  id v6 = *(NSObject **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v16 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  uint64_t v13 = v8;
  id v9 = *(id *)(a1 + 56);
  id v14 = v5;
  id v15 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v2 reattainPowerAssertionsForGroupIdentifier:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  BOOL v6 = os_log_type_enabled(v4, v5);
  if (v3)
  {
    if (v6)
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = [*(id *)(a1 + 40) wasUserInitiated];
      id v10 = @"NO";
      uint64_t v11 = *(void *)(a1 + 64);
      int v18 = 138543874;
      uint64_t v19 = v8;
      if (v9) {
        id v10 = @"YES";
      }
      __int16 v20 = 2114;
      int v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1BA384000, v4, v5, "DataAccess failed to renew credentials for account %{public}@ by forcing-prompt: %{public}@ - renewalResult = %ld", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    if (v6)
    {
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      int v14 = [*(id *)(a1 + 40) wasUserInitiated];
      id v15 = @"NO";
      if (v14) {
        id v15 = @"YES";
      }
      int v18 = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      int v21 = v15;
      _os_log_impl(&dword_1BA384000, v4, v5, "DataAccess successfully renewed credentials for account %{public}@ by forcing-prompt: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v16 = +[DAKeychain sharedKeychain];
    [v16 removePersistentCredentials];

    id v4 = [*(id *)(a1 + 40) backingAccountInfo];
    [v4 reload];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(DAAccount *)self persistentUUID];
  uint64_t v13 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v13 dropPowerAssertionsForGroupIdentifier:v12];

  int v14 = sharedDAAccountStore();
  id v15 = [(DAAccount *)self backingAccountInfo];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke;
  v19[3] = &unk_1E62116D0;
  v19[4] = self;
  id v20 = v9;
  id v21 = v12;
  id v22 = v10;
  id v16 = v10;
  id v17 = v12;
  id v18 = v9;
  [v14 openAuthenticationURL:v11 forAccount:v15 shouldConfirm:1 completion:v19];
}

void __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setWasUserInitiated:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke_2;
  v9[3] = &unk_1E62116A8;
  BOOL v6 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v13 = a2;
  id v11 = v5;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v2 reattainPowerAssertionsForGroupIdentifier:*(void *)(a1 + 32)];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__DAAccount_AuthenticationExtensions__webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke;
  v12[3] = &unk_1E62116F8;
  id v13 = v10;
  id v11 = v10;
  [(DAAccount *)self _webLoginRequestedAtURL:a3 reasonString:a4 inQueue:a5 completionBlock:v12];
}

void __99__DAAccount_AuthenticationExtensions__webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleValidationError:(id)a3 completion:(id)a4
{
  id v20 = a3;
  BOOL v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [v20 domain];
  if (![v7 isEqualToString:@"DAAccountValidationDomain"])
  {

    goto LABEL_8;
  }
  uint64_t v8 = [v20 code];

  if (v8 != 102)
  {
LABEL_8:
    v6[2](v6, 2, 0);
    goto LABEL_12;
  }
  id v9 = [v20 userInfo];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v11 = [v10 userInfo];
  id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F5B328]];

  id v13 = [v12 CDVObjectForKeyCaseInsensitive:*MEMORY[0x1E4F5B320]];
  if (![v13 length])
  {
    id v15 = 0;
    id v16 = 0;
LABEL_10:
    uint64_t v19 = dataaccess_get_global_queue();
    [(DAAccount *)self dropAssertionsAndRenewCredentialsInQueue:v19 withHandler:v6];
    goto LABEL_11;
  }
  int v14 = CDVExtractValuesFromRedirectString();
  id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F5B378]];
  id v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F5B370]];

  if (!v15) {
    goto LABEL_10;
  }
  id v17 = [(DAAccount *)self principalURL];
  int v18 = [v15 CDVIsSafeRedirectForRequestURL:v17];

  if (!v18) {
    goto LABEL_10;
  }
  uint64_t v19 = dataaccess_get_global_queue();
  [(DAAccount *)self _webLoginRequestedAtURL:v15 reasonString:v16 inQueue:v19 completionBlock:v6];
LABEL_11:

LABEL_12:
}

uint64_t __56__DAAccount_AuthenticationExtensions___leafAccountTypes__block_invoke()
{
  _leafAccountTypes__sLeafAccountTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F17858], *MEMORY[0x1E4F17770], *MEMORY[0x1E4F17778], *MEMORY[0x1E4F177F8], *MEMORY[0x1E4F17818], *MEMORY[0x1E4F177C8], 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)oneshotListOfAccountIDs
{
  v2 = (void *)ExchangeSyncLibraryCore();
  if (v2)
  {
    v2 = [getESAccountClass() oneshotListOfAccountIDs];
  }
  return v2;
}

+ (void)reacquireClientRestrictions:(id)a3
{
  id v3 = a3;
  if (ExchangeSyncLibraryCore()) {
    [getESAccountClass() reacquireClientRestrictions:v3];
  }
}

+ (id)_leafAccountTypes
{
  return (id)[MEMORY[0x1E4F5E990] leafAccountTypes];
}

- (BOOL)accountHasSignificantPropertyChangesFromOldAccountInfo:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F5E938];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v24 = [(DAAccount *)self backingAccountInfo];
  id v7 = [v24 identifier];
  uint64_t v8 = self;
  id v20 = self;
  uint64_t v23 = [(DAAccount *)self backingAccountInfo];
  id v22 = [v23 accountType];
  id v9 = [v22 identifier];
  int v18 = [v5 accountProperties];
  id v21 = [(DAAccount *)self backingAccountInfo];
  id v10 = [v21 username];
  uint64_t v19 = [(DAAccount *)v8 backingAccountInfo];
  id v11 = [v19 credential];
  id v12 = [v11 password];
  id v13 = [v5 username];
  int v14 = [v5 credential];

  id v15 = [v14 password];
  id v16 = (void *)[v6 initWithChangeType:1 accountIdentifier:v7 accountTypeIdentifier:v9 oldAccountProperties:v18 username:v10 password:v12 oldUsername:v13 oldPassword:v15 modifiedDataClasses:0 clientName:0];

  LOBYTE(v10) = [(DAAccount *)v20 accountHasSignificantPropertyChangesWithChangeInfo:v16];
  return (char)v10;
}

- (void)accountDidChangeFromOldAccountInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(DAAccount *)self accountHasSignificantPropertyChangesFromOldAccountInfo:v4])
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
    if (os_log_type_enabled(v5, v6))
    {
      backingAccountInfo = self->_backingAccountInfo;
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = backingAccountInfo;
      _os_log_impl(&dword_1BA384000, v5, v6, "Account had significant property change, going to flush local data.\n\nOldProperties %@\n\nNewProperties %@", (uint8_t *)&v8, 0x16u);
    }

    [(DAAccount *)self _handleSignificantPropertyChanges:0];
  }
}

- (id)defaultEventsFolder
{
  return 0;
}

- (id)eventsFolders
{
  return 0;
}

- (BOOL)sendEmailsForCalEvents:(id)a3 consumer:(id)a4
{
  return 0;
}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 consumer:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    __int16 v10 = [(DAAccount *)self accountID];
    int v13 = 138412546;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BA384000, v8, v9, "Downloading attachments is not supported on account ID %@. AttachmentUUID: %@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:70 userInfo:0];
  [v7 downloadFinishedError:v11];

  return 0;
}

- (id)requestCalendarAvailabilityForStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 consumer:(id)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  os_log_type_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = [(DAAccount *)self accountID];
    int v14 = 138543362;
    __int16 v15 = v11;
    _os_log_impl(&dword_1BA384000, v9, v10, "Requesting calendar availability is not supported on account with ID [%{public}@].", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:81 userInfo:0];
  [v8 calendarAvailabilityRequestFinishedWithError:v12];

  return 0;
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [(DAAccount *)self accountID];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1BA384000, v4, v5, "Cancelling calendar availability requests is not supported on account with ID [%{public}@].", (uint8_t *)&v7, 0xCu);
  }
}

- (id)requestGrantedDelegatesListWithConsumer:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_type_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = [(DAAccount *)self accountID];
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1BA384000, v5, v6, "Requesting granted delegates list is not supported on account with ID [%{public}@].", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:83 userInfo:0];
  [v4 grantedDelegatesListRequestFinishedWithResults:0 error:v8];

  return 0;
}

- (void)cancelGrantedDelegatesListRequestWithID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = [(DAAccount *)self accountID];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1BA384000, v4, v5, "Cancelling granted delegates list requests is not supported on account with ID [%{public}@].", (uint8_t *)&v7, 0xCu);
  }
}

- (id)updateGrantedDelegatePermission:(id)a3 consumer:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_log_type_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = [(DAAccount *)self accountID];
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1BA384000, v6, v7, "Update granted delegate permission is not supported on account with ID [%{public}@].", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:84 userInfo:0];
  [v5 updateGrantedDelegatePermissionFinishedWithError:v9];

  return 0;
}

- (void)cancelUpdateGrantedDelegatePermissionRequestWithID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = [(DAAccount *)self accountID];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1BA384000, v4, v5, "Cancelling update granted delegate permission requests is not supported on account with ID [%{public}@].", (uint8_t *)&v7, 0xCu);
  }
}

- (id)performCalendarDirectorySearchForTerms:(id)a3 recordTypes:(id)a4 resultLimit:(unint64_t)a5 consumer:(id)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    int v10 = [(DAAccount *)self accountID];
    int v13 = 138543362;
    int v14 = v10;
    _os_log_impl(&dword_1BA384000, v8, v9, "Performing a calendar directory search is not supported on account with ID [%{public}@].", (uint8_t *)&v13, 0xCu);
  }
  int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:85 userInfo:0];
  [v7 calendarDirectorySearchFinishedWithError:v11 exceededResultLimit:0];

  return 0;
}

- (void)performGroupExpansionForPrincipalPath:(id)a3 consumer:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_log_type_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = [(DAAccount *)self accountID];
    int v10 = 138543362;
    int v11 = v8;
    _os_log_impl(&dword_1BA384000, v6, v7, "Performing a calendar directory search is not supported on account with ID [%{public}@].", (uint8_t *)&v10, 0xCu);
  }
  os_log_type_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:85 userInfo:0];
  [v5 groupExpansionFinishedWithResults:0 error:v9];
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = [(DAAccount *)self accountID];
    int v8 = 138543618;
    os_log_type_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Cancelling calendar directory searches is not supported on account with ID [%{public}@].  searchID: [%@]", (uint8_t *)&v8, 0x16u);
  }
}

- (id)respondToShareRequestForCalendar:(id)a3 withResponse:(int64_t)a4 consumer:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  os_log_type_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = [(DAAccount *)self accountID];
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1BA384000, v9, v10, "Responding to calendar shares is not supported on account ID %@. calendar ID: %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:76 userInfo:0];
  [v8 shareResponseFinishedWithError:v12];

  return 0;
}

- (id)reportShareRequestAsJunkForCalendar:(id)a3 consumer:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = [(DAAccount *)self accountID];
    int v13 = 138412546;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BA384000, v8, v9, "Reporting calendar shares as junk is not supported on account ID %@. calendar ID: %@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:76 userInfo:0];
  [v7 shareResponseFinishedWithError:v11];

  return 0;
}

- (id)fetchOfficeHoursWithConsumer:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = [(DAAccount *)self accountID];
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1BA384000, v6, v7, "Fetching office hours is not supported on account ID %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:88 userInfo:0];
  }
  return 0;
}

- (id)setOfficeHours:(id)a3 withConsumer:(id)a4 error:(id *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_log_type_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = [(DAAccount *)self accountID];
    int v11 = 138543362;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1BA384000, v7, v8, "Setting office hours is not supported on account ID %{public}@", (uint8_t *)&v11, 0xCu);
  }
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:88 userInfo:0];
  }
  return 0;
}

- (id)defaultContactsFolder
{
  return 0;
}

- (id)contactsFolders
{
  return 0;
}

- (id)inboxFolder
{
  return 0;
}

- (id)sentItemsFolder
{
  return 0;
}

- (id)deletedItemsFolder
{
  return 0;
}

- (id)draftsFolder
{
  return 0;
}

- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4
{
  return 0;
}

- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

- (void)updateOofSettingsWithParams:(id)a3 consumer:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 138412290;
    int v10 = self;
    _os_log_impl(&dword_1BA384000, v6, v7, "Updating oof settings requested on account %@, which does not support it", (uint8_t *)&v9, 0xCu);
  }

  os_log_type_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:10 userInfo:0];
  [v5 settingsRequestFinishedWithResults:0 status:10 error:v8];
}

- (void)retrieveOofSettingsForConsumer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 138412290;
    int v9 = self;
    _os_log_impl(&dword_1BA384000, v5, v6, "Retrieving oof settings requested on account %@, which does not support it", (uint8_t *)&v8, 0xCu);
  }

  os_log_type_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:10 userInfo:0];
  [v4 settingsRequestFinishedWithResults:0 status:10 error:v7];
}

- (BOOL)isOofSupported
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 138412290;
    os_log_type_t v7 = self;
    _os_log_impl(&dword_1BA384000, v3, v4, "Checking if oof settings are supported on account %@, which does not support it", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)getPendingQueryQueue
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DAAccount *)v2 pendingQueries];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(DAAccount *)v2 setPendingQueries:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dataaccess.queryqueue", 0);
    [(DAAccount *)v2 setPendingQueryQueue:v5];

    int v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2.0];
    [(DAAccount *)v2 setLastQueryStartedTime:v6];
  }
  objc_sync_exit(v2);

  return [(DAAccount *)v2 pendingQueryQueue];
}

- (void)_dequeueQuery
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(DAAccount *)self getPendingQueryQueue];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(DAAccount *)self pendingQueryQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __37__DAAccount_Searching___dequeueQuery__block_invoke;
  v7[3] = &unk_1E6211A58;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  if (*((unsigned char *)v9 + 24))
  {
    dispatch_queue_t v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = 0x4000000000000000;
      _os_log_impl(&dword_1BA384000, v5, v6, "Delay pending search for %f seconds", buf, 0xCu);
    }

    [(DAAccount *)self performSelector:sel__dequeueQuery withObject:0 afterDelay:2.0];
  }
  _Block_object_dispose(&v8, 8);
}

void __37__DAAccount_Searching___dequeueQuery__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingQueries];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    unint64_t v4 = 0;
    while (1)
    {
      dispatch_queue_t v5 = [*(id *)(a1 + 32) pendingQueries];
      os_log_type_t v6 = [v5 objectAtIndexedSubscript:0];

      id v7 = [v6 consumer];

      if (v7) {
        id v7 = v6;
      }
      uint64_t v8 = [*(id *)(a1 + 32) pendingQueries];
      [v8 removeObjectAtIndex:0];

      if (v7) {
        break;
      }
      ++v4;
      int v9 = [*(id *)(a1 + 32) pendingQueries];
      unint64_t v10 = [v9 count];

      if (v4 >= v10) {
        goto LABEL_9;
      }
    }
    char v11 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setLastQueryStartedTime:v11];

    [*(id *)(a1 + 32) _reallyPerformSearchQuery:v7];
  }
LABEL_9:
  uint64_t v12 = [*(id *)(a1 + 32) pendingQueries];
  uint64_t v13 = [v12 count];

  if (v13) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)performSearchQuery:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(DAAccount *)self getPendingQueryQueue];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  os_log_type_t v6 = [(DAAccount *)self pendingQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DAAccount_Searching__performSearchQuery___block_invoke;
  block[3] = &unk_1E6211A80;
  void block[4] = self;
  uint64_t v17 = &v18;
  id v7 = v4;
  id v16 = v7;
  dispatch_sync(v6, block);

  if (*((unsigned char *)v19 + 24))
  {
    uint64_t v8 = [(DAAccount *)self lastQueryStartedTime];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    double v11 = v10 + 2.0;
    double v12 = 0.0;
    if (v11 >= 0.0)
    {
      double v12 = v11;
      if (v11 > 2.0) {
        double v12 = 2.0;
      }
    }
    uint64_t v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 134217984;
      double v23 = v12;
      _os_log_impl(&dword_1BA384000, v13, v14, "Delay new search for %f seconds", buf, 0xCu);
    }

    [(DAAccount *)self performSelector:sel__dequeueQuery withObject:0 afterDelay:v12];
  }

  _Block_object_dispose(&v18, 8);
}

void __43__DAAccount_Searching__performSearchQuery___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingQueries];
  uint64_t v3 = [v2 count];

  if (!v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  id v4 = [*(id *)(a1 + 32) pendingQueries];
  [v4 addObject:*(void *)(a1 + 40)];
}

- (void)cancelSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(DAAccount *)self getPendingQueryQueue];
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  os_log_type_t v6 = [(DAAccount *)self pendingQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__DAAccount_Searching__cancelSearchQuery___block_invoke;
  block[3] = &unk_1E6211AA8;
  void block[4] = self;
  id v7 = v4;
  id v9 = v7;
  double v10 = &v11;
  dispatch_sync(v6, block);

  if (*((unsigned char *)v12 + 24)) {
    [(DAAccount *)self _reallyCancelPendingSearchQuery:v7];
  }
  else {
    [(DAAccount *)self _reallyCancelSearchQuery:v7];
  }

  _Block_object_dispose(&v11, 8);
}

void __42__DAAccount_Searching__cancelSearchQuery___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingQueries];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    unint64_t v4 = 0;
    while (1)
    {
      id v5 = [*(id *)(a1 + 32) pendingQueries];
      os_log_type_t v6 = [v5 objectAtIndex:v4];
      int v7 = [v6 isEqual:*(void *)(a1 + 40)];

      if (v7) {
        break;
      }
      ++v4;
      uint64_t v8 = [*(id *)(a1 + 32) pendingQueries];
      unint64_t v9 = [v8 count];

      if (v4 >= v9) {
        return;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v10 = [*(id *)(a1 + 32) pendingQueries];
    [v10 removeObjectAtIndex:v4];
  }
}

- (void)cancelAllSearchQueries
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(DAAccount *)self getPendingQueryQueue];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__2;
  uint64_t v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  unint64_t v4 = [(DAAccount *)self pendingQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__DAAccount_Searching__cancelAllSearchQueries__block_invoke;
  block[3] = &unk_1E62117E8;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(v4, block);

  id v5 = (void *)v16[5];
  if (v5)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          -[DAAccount _reallyCancelPendingSearchQuery:](self, "_reallyCancelPendingSearchQuery:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
      }
      while (v7);
    }
  }
  [(DAAccount *)self _reallyCancelAllSearchQueries];
  _Block_object_dispose(&v15, 8);
}

void __46__DAAccount_Searching__cancelAllSearchQueries__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = [*(id *)(a1 + 32) pendingQueries];
  uint64_t v4 = [v2 arrayWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) pendingQueries];
  [v7 removeAllObjects];
}

- (BOOL)searchQueriesRunning
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [(DAAccount *)self pendingQueryQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__DAAccount_Searching__searchQueriesRunning__block_invoke;
  v6[3] = &unk_1E6211A58;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (*((unsigned char *)v8 + 24)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(DAAccount *)self _reallySearchQueriesRunning];
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__DAAccount_Searching__searchQueriesRunning__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingQueries];
  uint64_t v3 = [v2 count];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (int)supportsMailboxSearch
{
  return 0;
}

- (int)supportsEmailFlagging
{
  return 0;
}

- (void)_reallyPerformSearchQuery:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    int v9 = 138412290;
    char v10 = self;
    _os_log_impl(&dword_1BA384000, v5, v6, "Search requested on account %@, which does not support it", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [v4 consumer];
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5E920] code:10 userInfo:0];
  [v7 searchQuery:v4 finishedWithError:v8];
}

- (BOOL)_reallySearchQueriesRunning
{
  return 0;
}

- (id)defaultToDosFolder
{
  return 0;
}

- (id)toDosFolders
{
  return 0;
}

- (int)toDosNumberOfPastDaysToSync
{
  return 0;
}

- (id)defaultNotesFolder
{
  return 0;
}

- (id)notesFolders
{
  return 0;
}

- (void)performUsingAccountPersona:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BA384000, log, OS_LOG_TYPE_FAULT, "This process needs entitlement com.apple.usermanagerd.persona.background", v1, 2u);
}

@end