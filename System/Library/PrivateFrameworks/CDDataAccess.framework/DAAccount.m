@interface DAAccount
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
- (BOOL)autodiscoverAccountConfigurationWithConsumer:(id)a3;
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
- (BOOL)isDisabled;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (BOOL)isGoogleAccount;
- (BOOL)isHotmailAccount;
- (BOOL)isLDAPAccount;
- (BOOL)isSubscribedCalendarAccount;
- (BOOL)isValidating;
- (BOOL)monitorFolderWithID:(id)a3;
- (BOOL)monitorFoldersWithIDs:(id)a3;
- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4;
- (BOOL)resetCertWarnings;
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
- (NSString)password;
- (NSString)principalPath;
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
- (id)addUsernameToURL:(id)a3;
- (id)additionalHeaderValues;
- (id)beginDownloadingAttachmentWithUUID:(id)a3 consumer:(id)a4;
- (id)consumerForTask:(id)a3;
- (id)customConnectionProperties;
- (id)dataclassProperties;
- (id)defaultContainerIdentifierForDADataclass:(int64_t)a3;
- (id)defaultEventsFolder;
- (id)deletedItemsFolder;
- (id)description;
- (id)domainOnly;
- (id)draftsFolder;
- (id)eventsFolders;
- (id)exceptionsDict;
- (id)getAppleIDSession;
- (id)getPendingQueryQueue;
- (id)hostFromDataclassPropertiesForDataclass:(id)a3;
- (id)inboxFolder;
- (id)localizedIdenticalAccountFailureMessage;
- (id)localizedInvalidPasswordMessage;
- (id)oauth2Token;
- (id)objectForKeyedSubscript:(id)a3;
- (id)onBehalfOfBundleIdentifier;
- (id)passwordWithExpected:(BOOL)a3;
- (id)performCalendarDirectorySearchForTerms:(id)a3 recordTypes:(id)a4 resultLimit:(unint64_t)a5 consumer:(id)a6;
- (id)protocolVersion;
- (id)reportShareRequestAsJunkForCalendar:(id)a3 consumer:(id)a4;
- (id)requestCalendarAvailabilityForStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 consumer:(id)a7;
- (id)respondToShareRequestForCalendar:(id)a3 withResponse:(int64_t)a4 consumer:(id)a5;
- (id)sentItemsFolder;
- (id)spinnerIdentifiers;
- (id)stateString;
- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5;
- (id)urlFromDataclassPropertiesForDataclass:(id)a3;
- (int)accountIntPropertyForKey:(id)a3;
- (int)daAccountVersion;
- (int)keychainAccessibilityType;
- (int)supportsEmailFlagging;
- (int)supportsMailboxSearch;
- (int64_t)enabledDataclassesBitmask;
- (int64_t)port;
- (int64_t)portFromDataclassPropertiesForDataclass:(id)a3;
- (void)_dequeueQuery;
- (void)_reallyPerformSearchQuery:(id)a3;
- (void)_setPersistentUUID:(id)a3;
- (void)_webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6;
- (void)accountDidChangeFromOldAccountInfo:(id)a3;
- (void)cancelAllSearchQueries;
- (void)cancelCalendarAvailabilityRequestWithID:(id)a3;
- (void)cancelCalendarDirectorySearchWithID:(id)a3;
- (void)cancelSearchQuery:(id)a3;
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
- (void)performSearchQuery:(id)a3;
- (void)reload;
- (void)removeAccountPropertyForKey:(id)a3;
- (void)removeClientCertificateData;
- (void)removeConsumerForTask:(id)a3;
- (void)removeXpcActivity;
- (void)resetAccountID;
- (void)resetStatusReport;
- (void)resumeMonitoringFoldersWithIDs:(id)a3;
- (void)saveAccountProperties;
- (void)saveAccountPropertiesWithCompletionHandler:(id)a3;
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
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
  if (os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_1C86FF000, v3, v4, "DAAccount %p is going away...", buf, 0xCu);
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
  return [(DAAccount *)self accountIntPropertyForKey:@"DAAccountVersion2"];
}

- (BOOL)isDisabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(ACAccount *)self->_backingAccountInfo enabledDataclasses];
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
  v3 = [v2 accountDescription];

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

+ (id)daAccountSubclassWithBackingAccountInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[DAAccountLoader sharedInstance];
  id v5 = (objc_class *)[v4 daemonAppropriateAccountClassForACAccount:v3];

  uint64_t v6 = (void *)[[v5 alloc] initWithBackingAccountInfo:v3];
  return v6;
}

- (void)setDAAccountVersion:(int)a3
{
}

- (BOOL)upgradeAccount
{
  return 1;
}

- (void)resetAccountID
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 227, @"We shouldn't be resetting our account id, ever" object file lineNumber description];
}

- (NSString)scheduleIdentifier
{
  id v3 = [(DAAccount *)self backingAccountInfo];
  id v4 = [v3 parentAccount];

  if (v4)
  {
    id v5 = [(DAAccount *)self backingAccountInfo];
    uint64_t v6 = [v5 parentAccount];
    objc_super v7 = [v6 identifier];
  }
  else
  {
    objc_super v7 = [(DAAccount *)self persistentUUID];
  }
  return (NSString *)v7;
}

- (void)_setPersistentUUID:(id)a3
{
}

- (NSString)changeTrackingID
{
  v2 = NSString;
  id v3 = [(DAAccount *)self persistentUUID];
  id v4 = [v2 stringWithFormat:@"com.apple.caldavsyncd-%@", v3];

  return (NSString *)v4;
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
  return (a3 & 0x10) != 0 && [(DAAccount *)self enabledForDADataclass:16];
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
  objc_super v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = [(DAAccount *)self displayName];
    long long v10 = [(DAAccount *)self accountID];
    int v15 = 138412546;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1C86FF000, v7, v8, "Account \"%@\" (%@) was toggled for a dataclass. Giving it another chance with the babysitter.", (uint8_t *)&v15, 0x16u);
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
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C86FF000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
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
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C86FF000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
}

- (void)suspendMonitoringFoldersWithIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    Name = sel_getName(a2);
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1C86FF000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)stopMonitoringFolderWithID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    Name = sel_getName(a2);
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1C86FF000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);
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
  v16 = [v9 stringWithFormat:@"AccountID: %@ (\"%@\"", v10, v11, v12, v15];

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
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
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
    _os_log_impl(&dword_1C86FF000, v11, v12, "Added consumer %p for task %p to DAAccount %p, count: %lu", (uint8_t *)&v14, 0x2Au);
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
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    NSUInteger v7 = [(NSMapTable *)self->_consumers count];
    int v8 = 134218496;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    NSUInteger v13 = v7;
    _os_log_impl(&dword_1C86FF000, v5, v6, "Removed consumer for task %p from DAAccount %p, count: %lu", (uint8_t *)&v8, 0x20u);
  }
}

- (NSString)clientToken
{
  v2 = [(DAAccount *)self backingAccountInfo];
  int64_t v3 = [v2 clientToken];

  return (NSString *)v3;
}

- (void)clientTokenRequestedByServer
{
  int64_t v3 = [(DAAccount *)self clientToken];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    objc_msgSend(NSString, "da_newGUID");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [(DAAccount *)self backingAccountInfo];
    [v5 addClientToken:v6];
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
      id v6 = +[DAKeychain sharedKeychain];
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
  id v6 = [(ACAccount *)self->_backingAccountInfo credential];
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
    id v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = [(ACAccount *)self->_backingAccountInfo identifier];
      __int16 v12 = [(ACAccount *)self->_backingAccountInfo username];
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      __int16 v16 = v12;
      _os_log_impl(&dword_1C86FF000, v9, v10, "Calling _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", (uint8_t *)&v13, 0x16u);
    }
    [(ACAccount *)self->_backingAccountInfo setAuthenticated:1];
  }
  else
  {
    [v6 setPassword:0];

    NSUInteger v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1C86FF000, v7, v8, "Someone wanted to set a nil password, we're editing the live ACAccountCredential", (uint8_t *)&v13, 2u);
    }
  }
}

- (id)urlFromDataclassPropertiesForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DAAccount *)self backingAccountInfo];
  id v6 = [v5 parentAccount];
  NSUInteger v7 = [v6 dataclassProperties];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    if (!self->_dataclassPropertyURLsByDataclass)
    {
      id v9 = self;
      objc_sync_enter(v9);
      if (!self->_dataclassPropertyURLsByDataclass)
      {
        os_log_type_t v10 = (NSMutableDictionary *)objc_opt_new();
        dataclassPropertyURLsByDataclass = self->_dataclassPropertyURLsByDataclass;
        self->_dataclassPropertyURLsByDataclass = v10;
      }
      objc_sync_exit(v9);
    }
    __int16 v12 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
    objc_sync_enter(v12);
    int v13 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
    uint64_t v14 = [v13 objectForKeyedSubscript:v4];

    if (!v14)
    {
      __int16 v15 = [(DAAccount *)self backingAccountInfo];
      __int16 v16 = [v15 parentAccount];
      uint64_t v17 = [v16 dataclassProperties];
      __int16 v18 = [v17 objectForKeyedSubscript:v4];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v18 objectForKeyedSubscript:@"url"],
            (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0)
        || ([MEMORY[0x1E4F1CB10] URLWithString:v19],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            v19,
            !v14))
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      }
      __int16 v20 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
      [v20 setObject:v14 forKeyedSubscript:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      uint64_t v14 = 0;
    }
    objc_sync_exit(v12);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
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
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    NSUInteger v7 = [(DAAccount *)self host];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1C86FF000, v5, v6, "Changing Host From %@ to %@", (uint8_t *)&v8, 0x16u);
  }
  [(DAAccount *)self setObject:v4 forKeyedSubscript:@"DAAccountHost"];
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
    int64_t v5 = [(DAAccount *)self emailAddresses];
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
  v2 = [(DAAccount *)self objectForKeyedSubscript:@"DAAccountPrincipalPath"];
  int64_t v3 = objc_msgSend(v2, "da_appendSlashIfNeeded");

  return (NSString *)v3;
}

- (void)setPrincipalPath:(id)a3
{
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
  int64_t v5 = [(DAAccount *)self host];
  int64_t v6 = [(DAAccount *)self port];
  uint64_t v7 = [(DAAccount *)self principalPath];
  int v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = @"/";
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
    id v9 = [v15 host];
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
  v14[3] = &unk_1E6570F50;
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
  block[3] = &unk_1E6570F28;
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
  block[3] = &unk_1E6570F00;
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
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C86FF000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
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
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 715, @"%s MUST be implemented in ALL DAAccount subclasses.  Looks like it's missing in %@", Name, objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)shouldRemoveDBSyncDataOnAccountChange
{
  v2 = [(DAAccount *)self backingAccountInfo];
  char v3 = [v2 parentAccountIdentifier];

  return v3 == 0;
}

- (void)accountDidChangeFromOldAccountInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(DAAccount *)self accountHasSignificantPropertyChangesFromOldAccountInfo:v4])
  {
    os_log_type_t v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v5, v6))
    {
      backingAccountInfo = self->_backingAccountInfo;
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      long long v11 = backingAccountInfo;
      _os_log_impl(&dword_1C86FF000, v5, v6, "Account had significant property change, going to flush local data.\n\nOldProperties %@\n\nNewProperties %@", (uint8_t *)&v8, 0x16u);
    }

    [(DAAccount *)self removeDBSyncData];
    [(DAAccount *)self cleanupAccountFiles];
  }
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
    os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v9, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C86FF000, v9, v11, "Couldn't get a Yahoo cookie. Not setting authentication headers", buf, 2u);
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
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = [(DAAccount *)self backingAccountInfo];
    os_log_type_t v6 = [v5 identifier];
    int v18 = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1C86FF000, v3, v4, "Fetching OAuth Crednetials for Backing Account %@", (uint8_t *)&v18, 0xCu);
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
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    NSUInteger v21 = v8;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1C86FF000, v13, v4, "Account Store Returned A %@ OAuth-token From Crednetials Object %@ AccountID: %@", (uint8_t *)&v18, 0x20u);
  }
  return v12;
}

- (void)tearDown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315394;
    Name = sel_getName(a2);
    __int16 v8 = 2112;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_1C86FF000, v3, v4, "%s being ignored by %@", (uint8_t *)&v6, 0x16u);
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
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    Name = sel_getName(a2);
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_1C86FF000, v4, v5, "%s being ignored by %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)stopMonitoringFolders
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315394;
    Name = sel_getName(a2);
    __int16 v8 = 2112;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_1C86FF000, v3, v4, "%s being ignored by %@", (uint8_t *)&v6, 0x16u);
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

- (void)saveAccountPropertiesWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = [(DAAccount *)self accountDescription];
    __int16 v8 = [(DAAccount *)self accountID];
    int v17 = 138412546;
    *(void *)int v18 = v7;
    *(_WORD *)&v18[8] = 2112;
    *(void *)&v18[10] = v8;
    _os_log_impl(&dword_1C86FF000, v5, v6, "Saving account \"%@\" (%@)", (uint8_t *)&v17, 0x16u);
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
    int v17 = 67109634;
    *(_DWORD *)int v18 = v11;
    *(_WORD *)&v18[4] = 2112;
    *(void *)&v18[6] = v13;
    *(_WORD *)&v18[14] = 2112;
    *(void *)&v18[16] = v15;
    _os_log_impl(&dword_1C86FF000, v9, v6, " _backingAccountInfo.authenticated is %d for Account identifier %@ and username %@", (uint8_t *)&v17, 0x1Cu);
  }
  id v16 = sharedDAAccountStore();
  [v16 saveVerifiedAccount:self->_backingAccountInfo withCompletionHandler:v4];
}

- (void)saveAccountProperties
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__DAAccount_saveAccountProperties__block_invoke;
  v2[3] = &unk_1E6570F78;
  v2[4] = self;
  [(DAAccount *)self saveAccountPropertiesWithCompletionHandler:v2];
}

void __34__DAAccount_saveAccountProperties__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1C86FF000, v5, v6, "Error saving account %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)updateExistingAccountProperties
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = sharedDAAccountStore();
  id v4 = [(DAAccount *)self backingAccountInfo];
  id v5 = [v4 identifier];
  os_log_type_t v6 = [v3 accountWithIdentifier:v5];

  if (v6)
  {
    [(DAAccount *)self saveAccountProperties];
  }
  else
  {
    uint64_t v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
    if (os_log_type_enabled(v7, v8))
    {
      backingAccountInfo = self->_backingAccountInfo;
      int v10 = 138412290;
      id v11 = backingAccountInfo;
      _os_log_impl(&dword_1C86FF000, v7, v8, "Not updating non-existing account: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (int)keychainAccessibilityType
{
  v2 = [(ACAccount *)self->_backingAccountInfo accountType];
  char v3 = +[DAKeychain sharedKeychain];
  id v4 = [v2 credentialProtectionPolicy];
  int v5 = [v3 _daKeychainAccessibilityForSecAccessibility:v4];

  return v5;
}

- (id)addUsernameToURL:(id)a3
{
  id v5 = a3;
  os_log_type_t v6 = [v5 user];
  uint64_t v7 = [v6 length];
  if (!v7)
  {
    char v3 = [(DAAccount *)self username];
    if ([v3 length])
    {

LABEL_8:
      id v11 = [(DAAccount *)self username];
      uint64_t v12 = objc_msgSend(v11, "da_stringByAddingPercentEscapesForUsername");
      uint64_t v13 = objc_msgSend(v5, "da_urlBySettingUsername:", v12);

      id v5 = (id)v13;
      goto LABEL_9;
    }
  }
  os_log_type_t v8 = [v5 user];
  uint64_t v9 = [(DAAccount *)self username];
  char v10 = [v8 isEqualToString:v9];

  if (!v7) {
  if ((v10 & 1) == 0)
  }
    goto LABEL_8;
LABEL_9:
  return v5;
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
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = @"No";
    if (v4) {
      uint64_t v9 = @"Yes";
    }
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1C86FF000, v7, v8, "Setting identity certificate. Managed by profile? %@", (uint8_t *)&v11, 0xCu);
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
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = [(DAAccount *)self backingAccountInfo];
  if (![v3 supportsAuthentication]) {
    goto LABEL_5;
  }
  BOOL v4 = [(DAAccount *)self backingAccountInfo];
  if (([v4 isAuthenticated] & 1) != 0 || -[DAAccount isValidating](self, "isValidating"))
  {

LABEL_5:
    goto LABEL_6;
  }
  BOOL v18 = [(DAAccount *)self wasUserInitiated];

  if (!v18)
  {
    uint64_t v7 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v7, v19))
    {
      id v10 = [(DAAccount *)self backingAccountInfo];
      __int16 v20 = [(DAAccount *)v10 identifier];
      int v21 = 138412546;
      __int16 v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v20;
      _os_log_impl(&dword_1C86FF000, v7, v19, "Not attempting request for account %@ because the backing account credential isn't authed %{public}@", (uint8_t *)&v21, 0x16u);

      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_6:
  id v5 = [(DAAccount *)self backingAccountInfo];
  int v6 = objc_msgSend(v5, "aa_isSuspended");

  if (v6)
  {
    uint64_t v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = (DAAccount *)objc_claimAutoreleasedReturnValue();
      int v11 = [(DAAccount *)self backingAccountInfo];
      uint64_t v12 = [v11 identifier];
      int v21 = 138543618;
      __int16 v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1C86FF000, v7, v8, "Not attempting request for account %{public}@ because the backing account needs to verify terms or is suspended. %{public}@", (uint8_t *)&v21, 0x16u);

LABEL_16:
    }
  }
  else
  {
    uint64_t v13 = +[DAKeychain sharedKeychain];
    int v14 = objc_msgSend(v13, "canAccessCredentialsWithAccessibility:", -[DAAccount keychainAccessibilityType](self, "keychainAccessibilityType"));

    if (v14) {
      return 0;
    }
    uint64_t v7 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v7, v16))
    {
      int v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v10 = (DAAccount *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543618;
      __int16 v22 = v10;
      __int16 v23 = 1024;
      LODWORD(v24) = [(DAAccount *)self keychainAccessibilityType];
      _os_log_impl(&dword_1C86FF000, v7, v16, "Not attempting request for account %{public}@ because we don't have access to keychain items with accessibility %d right now", (uint8_t *)&v21, 0x12u);
      goto LABEL_16;
    }
  }
LABEL_17:

  return 1;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  Name = sel_getName(a2);
  [v5 handleFailureInMethod:a2, self, @"DAAccount.m", 1009, @"%s MUST be implemented in ALL DAAccount subclasses.  Looks like it's missing in %@", Name, objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)accountHasSignificantPropertyChangesFromOldAccountInfo:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v40[0] = @"DAAccountHost";
  v40[1] = @"DAAccountEmailAddress";
  v40[2] = @"DAAccountPrincipalPath";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  uint64_t v34 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v34)
  {
    id obj = v5;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        os_log_type_t v8 = [(DAAccount *)self backingAccountInfo];
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];
        uint64_t v10 = [v9 length];
        if (v10
          || ([v35 objectForKeyedSubscript:v7],
              char v3 = objc_claimAutoreleasedReturnValue(),
              [v3 length]))
        {
          int v11 = self;
          uint64_t v12 = [(DAAccount *)self backingAccountInfo];
          uint64_t v13 = [v12 objectForKeyedSubscript:v7];
          int v14 = [v35 objectForKeyedSubscript:v7];
          int v15 = [v13 isEqualToString:v14];

          if (v10)
          {

            self = v11;
            if (!v15) {
              goto LABEL_29;
            }
          }
          else
          {

            self = v11;
            if ((v15 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }
        else
        {
        }
      }
      id v5 = obj;
      uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v34);
  }

  os_log_type_t v16 = [(DAAccount *)self backingAccountInfo];
  int v17 = [v16 username];
  uint64_t v18 = [v17 length];
  if (v18
    || ([v35 username], char v3 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "length")))
  {
    os_log_type_t v19 = [(DAAccount *)self backingAccountInfo];
    __int16 v20 = [v19 username];
    int v21 = [v35 username];
    int v22 = [v20 isEqualToString:v21];

    if (v18)
    {

      if (v22) {
        goto LABEL_24;
      }
LABEL_22:
      BOOL v23 = 1;
      goto LABEL_31;
    }

    if ((v22 & 1) == 0) {
      goto LABEL_22;
    }
  }
  else
  {
  }
LABEL_24:
  int v24 = [(DAAccount *)self useSSL];
  uint64_t v25 = [v35 objectForKeyedSubscript:@"DAAccountUseSSL"];
  v26 = v25;
  if (v25) {
    int v27 = [v25 BOOLValue];
  }
  else {
    int v27 = 1;
  }
  id obj = v26;
  if (v27 == v24)
  {
    v28 = [(DAAccount *)self objectForKeyedSubscript:@"DAAccountPort", v26];
    int v29 = [v28 intValue];
    v30 = [v35 objectForKeyedSubscript:@"DAAccountPort"];
    BOOL v23 = v29 != [v30 intValue];
  }
  else
  {
LABEL_29:
    BOOL v23 = 1;
  }

LABEL_31:
  return v23;
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
  block[3] = &unk_1E6570FC0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)copyStorageSession_storageSessionSetupQueue, block);
  return (__CFURLStorageSession *)CFRetain(self->_storageSession);
}

void __31__DAAccount_copyStorageSession__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.dataaccess.StorageSessionSetup", v2);
  v1 = (void *)copyStorageSession_storageSessionSetupQueue;
  copyStorageSession_storageSessionSetupQueue = (uint64_t)v0;
}

void __31__DAAccount_copyStorageSession__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[5])
  {
    char v3 = NSString;
    BOOL v4 = [v2 persistentUUID];
    id v8 = [v3 stringWithFormat:@"com.apple.dataaccessd.%@", v4];

    *(void *)(*(void *)(a1 + 32) + 40) = _CFURLStorageSessionCreate();
    id v5 = (const void *)_CFURLStorageSessionCopyCookieStorage();
    CFHTTPCookieStorageSetCookieAcceptPolicy();
    CFRelease(v5);
    uint64_t v6 = _CFURLStorageSessionCopyCache();
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      CFURLCacheSetMemoryCapacity();
      CFURLCacheSetDiskCapacity();
      CFURLCacheRemoveAllCachedResponses();
      CFRelease(v7);
    }
  }
}

- (id)description
{
  char v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DAAccount;
  BOOL v4 = [(DAAccount *)&v9 description];
  id v5 = [(DAAccount *)self accountID];
  uint64_t v6 = [(DAAccount *)self persistentUUID];
  uint64_t v7 = [v3 stringWithFormat:@"%@: accountID %@ persistentUUID %@", v4, v5, v6];

  return v7;
}

- (void)shutdown
{
  char v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C86FF000, v3, v4, "Shutting down the task manager", v5, 2u);
  }

  [(DATaskManager *)self->_taskManager shutdown];
}

- (void)reload
{
  char v3 = [(DAAccount *)self dataclassPropertyURLsByDataclass];
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
  char v3 = [v2 identifier];

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
      char v3 = DALoggingwithCategory();
      os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1C86FF000, v3, v4, "Canceling task because conditions for on-power mode no longer exist (xpc_activity)", v6, 2u);
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
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = [(DAAccount *)self accountID];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1C86FF000, v6, v7, "XPC: Saved XPC activity for account %@", (uint8_t *)&v9, 0xCu);
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
    char v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
    if (os_log_type_enabled(v3, v4))
    {
      int continueCount = self->_continueCount;
      uint64_t v6 = [(DAAccount *)self accountID];
      v7[0] = 67109378;
      v7[1] = continueCount;
      __int16 v8 = 2112;
      int v9 = v6;
      _os_log_impl(&dword_1C86FF000, v3, v4, "XPC: Increment XPC activity continue count to %d for account %@", (uint8_t *)v7, 0x12u);
    }
  }
}

- (void)decrementXpcActivityContinueCount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_xpcActivity)
  {
    --self->_continueCount;
    char v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
    if (os_log_type_enabled(v3, v4))
    {
      int continueCount = self->_continueCount;
      uint64_t v6 = [(DAAccount *)self accountID];
      v7[0] = 67109378;
      v7[1] = continueCount;
      __int16 v8 = 2112;
      int v9 = v6;
      _os_log_impl(&dword_1C86FF000, v3, v4, "XPC: Decrement XPC activity continue count to %d for account %@", (uint8_t *)v7, 0x12u);
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
    id v5 = DALoggingwithCategory();
    uint64_t v6 = v5;
    if (v4)
    {
      LOBYTE(v7) = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
      if (os_log_type_enabled(v5, (os_log_type_t)v7))
      {
        __int16 v8 = [(DAAccount *)self accountID];
        int v11 = 138412290;
        uint64_t v12 = v8;
        int v9 = "XPC: Successfully set XPC activity state to XPC_ACTIVITY_STATE_DONE for account %@";
LABEL_7:
        _os_log_impl(&dword_1C86FF000, v6, (os_log_type_t)v7, v9, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      int v7 = *(unsigned __int8 *)(MEMORY[0x1E4F50E48] + 3);
      if (os_log_type_enabled(v5, *(os_log_type_t *)(MEMORY[0x1E4F50E48] + 3)))
      {
        __int16 v8 = [(DAAccount *)self accountID];
        int v11 = 138412290;
        uint64_t v12 = v8;
        int v9 = "XPC: Failed to set XPC activity state to XPC_ACTIVITY_STATE_DONE for account %@";
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
  id v5 = [(DAAccount *)self trustHandler];
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
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 1220, @"Account class %@ MUST implement %s", v5, sel_getName(a2) object file lineNumber description];

  return 0;
}

- (id)localizedInvalidPasswordMessage
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = objc_opt_class();
  [v4 handleFailureInMethod:a2, self, @"DAAccount.m", 1225, @"Account class %@ MUST implement %s", v5, sel_getName(a2) object file lineNumber description];

  return 0;
}

- (void)dropAssertionsAndRenewCredentialsInQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    int v11 = NSStringFromClass(v10);
    BOOL v12 = [(DAAccount *)self wasUserInitiated];
    uint64_t v13 = @"NO";
    if (v12) {
      uint64_t v13 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    int v27 = v11;
    __int16 v28 = 2114;
    int v29 = v13;
    _os_log_impl(&dword_1C86FF000, v8, v9, "DataAccess is renewing credentials for account %{public}@ by forcing-prompt: %{public}@", buf, 0x16u);
  }
  int v14 = [(DAAccount *)self persistentUUID];
  int v15 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v15 dropPowerAssertionsForGroupIdentifier:v14];

  os_log_type_t v16 = sharedDAAccountStore();
  int v17 = [(DAAccount *)self backingAccountInfo];
  BOOL v18 = [(DAAccount *)self wasUserInitiated];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke;
  v22[3] = &unk_1E6571010;
  v22[4] = self;
  id v23 = v6;
  id v24 = v14;
  id v25 = v7;
  id v19 = v7;
  id v20 = v14;
  id v21 = v6;
  [v16 renewCredentialsForAccount:v17 force:v18 reason:0 completion:v22];
}

void __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setWasUserInitiated:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__DAAccount_AuthenticationExtensions__dropAssertionsAndRenewCredentialsInQueue_withHandler___block_invoke_2;
  block[3] = &unk_1E6570FE8;
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v2 reattainPowerAssertionsForGroupIdentifier:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
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
      int v21 = 138543874;
      int v22 = v8;
      if (v9) {
        id v10 = @"YES";
      }
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v11;
      id v12 = "DataAccess failed to renew credentials for account %{public}@ by forcing-prompt: %{public}@ - renewalResult = %ld";
      uint64_t v13 = v4;
      os_log_type_t v14 = v5;
      uint32_t v15 = 32;
LABEL_10:
      _os_log_impl(&dword_1C86FF000, v13, v14, v12, (uint8_t *)&v21, v15);
    }
  }
  else if (v6)
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v16);
    int v17 = [*(id *)(a1 + 40) wasUserInitiated];
    BOOL v18 = @"NO";
    if (v17) {
      BOOL v18 = @"YES";
    }
    int v21 = 138543618;
    int v22 = v8;
    __int16 v23 = 2114;
    id v24 = v18;
    id v12 = "DataAccess successfully renewed credentials for account %{public}@ by forcing-prompt: %{public}@";
    uint64_t v13 = v4;
    os_log_type_t v14 = v5;
    uint32_t v15 = 22;
    goto LABEL_10;
  }

  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48), v19);
}

- (void)_webLoginRequestedAtURL:(id)a3 reasonString:(id)a4 inQueue:(id)a5 completionBlock:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(DAAccount *)self persistentUUID];
  uint64_t v13 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v13 dropPowerAssertionsForGroupIdentifier:v12];

  os_log_type_t v14 = sharedDAAccountStore();
  uint32_t v15 = [(DAAccount *)self backingAccountInfo];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__DAAccount_AuthenticationExtensions___webLoginRequestedAtURL_reasonString_inQueue_completionBlock___block_invoke;
  v19[3] = &unk_1E6571060;
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
  v9[3] = &unk_1E6571038;
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
  v12[3] = &unk_1E6571088;
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
    uint32_t v15 = 0;
    id v16 = 0;
LABEL_10:
    uint64_t v19 = dataaccess_get_global_queue();
    [(DAAccount *)self dropAssertionsAndRenewCredentialsInQueue:v19 withHandler:v6];
    goto LABEL_11;
  }
  os_log_type_t v14 = CDVExtractValuesFromRedirectString();
  uint32_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F5B378]];
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

+ (id)_leafAccountTypes
{
  if (_leafAccountTypes_onceToken != -1) {
    dispatch_once(&_leafAccountTypes_onceToken, &__block_literal_global_491);
  }
  v2 = (void *)_leafAccountTypes__sLeafAccountTypes;
  return v2;
}

uint64_t __56__DAAccount_AuthenticationExtensions___leafAccountTypes__block_invoke()
{
  _leafAccountTypes__sLeafAccountTypes = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F17770]];
  return MEMORY[0x1F41817F8]();
}

+ (id)oneshotListOfAccountIDs
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = +[DAAccount _leafAccountTypes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(obj);
        }
        id v7 = [v3 accountTypeWithAccountTypeIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v7)
        {
          uint64_t v8 = [v3 accountsWithAccountType:v7];
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v18 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * j) identifier];
                if (v13) {
                  [v2 addObject:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v10);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (void)reacquireClientRestrictions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F74240], "sharedManager", a3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(a1, "oneshotListOfAccountIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    uint64_t v9 = MEMORY[0x1E4F1CC08];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 setUserInfo:v9 forClientUUID:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
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
  uint64_t v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = [(DAAccount *)self accountID];
    int v13 = 138412546;
    long long v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1C86FF000, v8, v9, "Downloading attachments is not supported on account ID %@. AttachmentUUID: %@", (uint8_t *)&v13, 0x16u);
  }
  long long v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F50E20] code:70 userInfo:0];
  [v7 downloadFinishedError:v11];

  return 0;
}

- (id)requestCalendarAvailabilityForStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 consumer:(id)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  os_log_type_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v9, v10))
  {
    long long v11 = [(DAAccount *)self accountID];
    int v14 = 138412290;
    __int16 v15 = v11;
    _os_log_impl(&dword_1C86FF000, v9, v10, "Requesting calendar availability is not supported on account with ID [%@].", (uint8_t *)&v14, 0xCu);
  }
  long long v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F50E20] code:81 userInfo:0];
  [v8 calendarAvailabilityRequestFinishedWithError:v12];

  return 0;
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [(DAAccount *)self accountID];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1C86FF000, v4, v5, "Cancelling calendar availability requests is not supported on account with ID [%@].", (uint8_t *)&v7, 0xCu);
  }
}

- (id)performCalendarDirectorySearchForTerms:(id)a3 recordTypes:(id)a4 resultLimit:(unint64_t)a5 consumer:(id)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = [(DAAccount *)self accountID];
    int v13 = 138412290;
    int v14 = v10;
    _os_log_impl(&dword_1C86FF000, v8, v9, "Performing a calendar directory search is not supported on account with ID [%@].", (uint8_t *)&v13, 0xCu);
  }
  long long v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F50E20] code:83 userInfo:0];
  [v7 calendarDirectorySearchFinishedWithError:v11 exceededResultLimit:0];

  return 0;
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_type_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = [(DAAccount *)self accountID];
    int v8 = 138412546;
    os_log_type_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1C86FF000, v5, v6, "Cancelling calendar directory searches is not supported on account with ID [%@].  searchID: [%@]", (uint8_t *)&v8, 0x16u);
  }
}

- (id)respondToShareRequestForCalendar:(id)a3 withResponse:(int64_t)a4 consumer:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  os_log_type_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = [(DAAccount *)self accountID];
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1C86FF000, v9, v10, "Responding to calendar shares is not supported on account ID %@. calendar ID: %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F50E20] code:76 userInfo:0];
  [v8 shareResponseFinishedWithError:v12];

  return 0;
}

- (id)reportShareRequestAsJunkForCalendar:(id)a3 consumer:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = [(DAAccount *)self accountID];
    int v13 = 138412546;
    int v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1C86FF000, v8, v9, "Reporting calendar shares as junk is not supported on account ID %@. calendar ID: %@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F50E20] code:76 userInfo:0];
  [v7 shareResponseFinishedWithError:v11];

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

- (id)getPendingQueryQueue
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(DAAccount *)v2 pendingQueries];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(DAAccount *)v2 setPendingQueries:v4];

    os_log_type_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dataaccess.queryqueue", v5);
    [(DAAccount *)v2 setPendingQueryQueue:v6];

    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2.0];
    [(DAAccount *)v2 setLastQueryStartedTime:v7];
  }
  objc_sync_exit(v2);

  return [(DAAccount *)v2 pendingQueryQueue];
}

- (void)_dequeueQuery
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(DAAccount *)self getPendingQueryQueue];
  uint64_t v8 = 0;
  os_log_type_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(DAAccount *)self pendingQueryQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __37__DAAccount_Searching___dequeueQuery__block_invoke;
  v7[3] = &unk_1E65711C0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  if (*((unsigned char *)v9 + 24))
  {
    os_log_type_t v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = 0x4000000000000000;
      _os_log_impl(&dword_1C86FF000, v5, v6, "Delay pending search for %f seconds", buf, 0xCu);
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
      os_log_type_t v5 = [*(id *)(a1 + 32) pendingQueries];
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
      os_log_type_t v9 = [*(id *)(a1 + 32) pendingQueries];
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
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  os_log_type_t v6 = [(DAAccount *)self pendingQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DAAccount_Searching__performSearchQuery___block_invoke;
  block[3] = &unk_1E65711E8;
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
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 134217984;
      double v23 = v12;
      _os_log_impl(&dword_1C86FF000, v13, v14, "Delay new search for %f seconds", buf, 0xCu);
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
  block[3] = &unk_1E6571210;
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
  uint64_t v18 = __Block_byref_object_copy__0;
  long long v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  unint64_t v4 = [(DAAccount *)self pendingQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__DAAccount_Searching__cancelAllSearchQueries__block_invoke;
  block[3] = &unk_1E6571170;
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
  v6[3] = &unk_1E65711C0;
  v6[4] = self;
  v6[5] = &v7;
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
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    int v9 = 138412290;
    char v10 = self;
    _os_log_impl(&dword_1C86FF000, v5, v6, "Search requested on account %@, which does not support it", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [v4 consumer];
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F50E20] code:10 userInfo:0];
  [v7 searchQuery:v4 finishedWithError:v8];
}

- (BOOL)_reallySearchQueriesRunning
{
  return 0;
}

@end