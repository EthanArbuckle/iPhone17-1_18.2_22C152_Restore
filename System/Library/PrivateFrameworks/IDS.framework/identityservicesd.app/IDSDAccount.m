@interface IDSDAccount
+ (BOOL)dependentRegistration:(id)a3 hasDependentRegistrationWithURI:(id)a4 token:(id)a5;
+ (void)_sendLocallyWithSendParameters:(id)a3 service:(id)a4 uriToLocalDestination:(id)a5 data:(id)a6 protobuf:(id)a7 threadContext:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10;
+ (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 threadContext:(id)a6 sendParameters:(id)a7;
+ (void)dependentRegistration:(id)a3 findDeviceUniqueID:(id *)a4 btID:(id *)a5 forURI:(id)a6 token:(id)a7 supportsLiveDelivery:(BOOL *)a8;
+ (void)sendMessageWithSendParameters:(id)a3 service:(id)a4 threadContext:(id)a5 willSendBlock:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8;
- (BOOL)_hasBudgetForForcedGDR;
- (BOOL)_isBuddyBlockingRegistration;
- (BOOL)_isPasswordPromptPermissibleDuringAuthentication;
- (BOOL)_issueForcedDependentCheckIfPossible;
- (BOOL)_migrateRegistrationIfNeeded;
- (BOOL)_rebuildRegistrationInfo:(BOOL)a3;
- (BOOL)_stopRegistrationAgent;
- (BOOL)forEachAdhocAccount:(id)a3;
- (BOOL)hasAliasURI:(id)a3;
- (BOOL)hasDependentRegistrationWithURI:(id)a3 token:(id)a4;
- (BOOL)hasEverRegistered;
- (BOOL)hasVettedAliasURI:(id)a3;
- (BOOL)isAdHocAccount;
- (BOOL)isBeingRemoved;
- (BOOL)isDeviceAuthenticated;
- (BOOL)isDeviceRegistered;
- (BOOL)isEnabled;
- (BOOL)isRegistered;
- (BOOL)isRegistrationActive;
- (BOOL)isTemporary;
- (BOOL)isUsableForSending;
- (BOOL)isUserDisabled;
- (BOOL)issuingDependentCheck;
- (BOOL)pendingDependentCheck;
- (BOOL)provisionPseudonymForURI:(id)a3 properties:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6;
- (BOOL)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completionBlock:(id)a6;
- (BOOL)revokePseudonym:(id)a3 requestProperties:(id)a4 completionBlock:(id)a5;
- (BOOL)shouldAutoRegisterAllHandles;
- (BOOL)shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:(id)a3;
- (BOOL)shouldRegisterUsingDSHandle;
- (BOOL)updateKTOptInStatus:(BOOL)a3 withCompletion:(id)a4;
- (BOOL)updateKTOptInStatusWithRequest:(id)a3 withCompletion:(id)a4;
- (BOOL)wasDisabledAutomatically;
- (BOOL)wasRecentlySelectedAlias:(id)a3;
- (CUTDeferredTaskQueue)broadcastAccountInfoChangedTask;
- (IDSDAccount)initWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5;
- (IDSDAccount)initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7;
- (IDSDAccount)superAccount;
- (IDSGameCenterData)gameCenterData;
- (IDSRegistration)primaryRegistration;
- (IDSRegistration)registration;
- (IDSServiceProperties)service;
- (NSArray)dependentRegistrations;
- (NSArray)dependentRegistrationsIncludingCurrentDevice;
- (NSArray)linkedAccounts;
- (NSArray)prefixedURIStringsFromRegistration;
- (NSArray)pseudonyms;
- (NSArray)registeredDevices;
- (NSArray)unprefixedURIStringsFromRegistration;
- (NSDate)expirationDate;
- (NSDate)lastGDRDate;
- (NSDate)lastRegistrationFailureDate;
- (NSDate)lastRegistrationSuccessDate;
- (NSDictionary)accountInfo;
- (NSDictionary)accountSetupInfo;
- (NSDictionary)defaultPairedDependentRegistration;
- (NSDictionary)pseudonymURIMap;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)dsHandle;
- (NSString)dsID;
- (NSString)loginID;
- (NSString)uniqueID;
- (NSString)userUniqueIdentifier;
- (double)_maxSelectedButVettedGracePeriod;
- (id)_allUserIntentWithDefaultReason:(BOOL)a3;
- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingCurrentDevice:(BOOL)a4 includingTinker:(BOOL)a5;
- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingTinker:(BOOL)a4;
- (id)_fromIDFromDevice:(id)a3 withCBUUID:(id)a4 uniqueID:(id)a5;
- (id)_initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8 isAdHocAccount:(BOOL)a9;
- (id)_performedForcedGDRDatePeriod;
- (id)_registrationCert;
- (id)_unprefixedURIStringsFromAccountInfo;
- (id)_uriDictionariesFromAccountInfo;
- (id)_userIntentDictForAlias:(id)a3;
- (id)accountAndAdHocAccounts;
- (id)accountController;
- (id)adHocAccounts;
- (id)appleIDNotificationCenter;
- (id)defaultPairedDependentRegistrationIncludingTinker:(BOOL)a3;
- (id)dependentRegistrationMatchingUUID:(id)a3;
- (id)dependentRegistrationMatchingUUID:(id)a3 includingTinker:(BOOL)a4;
- (id)dependentRegistrationsIncludingTinker:(BOOL)a3;
- (id)fromIDForCBUUID:(id)a3 deviceID:(id)a4;
- (id)initAdHocAccountWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8;
- (id)invisibleAliases;
- (id)newSendMessageContext;
- (id)pairingManager;
- (id)peerIDManager;
- (id)primaryAccount;
- (id)primaryAccountUniqueID;
- (id)primaryServiceName;
- (id)pseudonymForPseudonymURIString:(id)a3;
- (id)pushHandler;
- (id)registrationCenter;
- (id)senderKeyDistributionManager;
- (id)serviceController;
- (id)serviceType;
- (id)smallDescription;
- (id)systemMonitor;
- (id)userDefaults;
- (id)utunDeliveryController;
- (id)vettedAliases;
- (int)_currentForcedGDRCount;
- (int)_neededRegistrationType;
- (int)accountType;
- (int)registrationErrorReason;
- (int)registrationStatus;
- (int64_t)_validationStatusForAlias:(id)a3;
- (int64_t)lastRegistrationFailureError;
- (int64_t)maxRemoteMessagingPayloadSize;
- (int64_t)registrationError;
- (unint64_t)_handleAndConvertFeatureToggleError:(int64_t)a3;
- (unint64_t)_unregistered130RetryInterval;
- (unsigned)currentAliasState:(id)a3;
- (unsigned)unselectReasonForAlias:(id)a3;
- (void)_acceptIncomingPushes;
- (void)_addAliases:(id)a3;
- (void)_addPseudonym:(id)a3;
- (void)_authenticateAccount;
- (void)_broadcastAccountInfoChanged;
- (void)_broadcastAccountMessageBlock:(id)a3;
- (void)_checkRegistration;
- (void)_cleanupAccount;
- (void)_clearForcedGDRCount;
- (void)_clearForcedGDRDate;
- (void)_clearGDRState;
- (void)_deregisterDeviceCenterNotifications;
- (void)_flushTokensForRegisteredURIs:(id)a3;
- (void)_handleKTOptInStatusUpdateError:(int64_t)a3;
- (void)_handlePseudonymProvisionError:(int64_t)a3;
- (void)_identityGenerated:(id)a3;
- (void)_identityRebuilt:(id)a3;
- (void)_ignoreIncomingPushes;
- (void)_incrementForcedGDRCount;
- (void)_issueCriticalDependentCheck;
- (void)_issueDependentCheck;
- (void)_keychainMigrationComplete:(id)a3;
- (void)_needsEncryptionIdentityRoll:(id)a3;
- (void)_notifyClientDelegatesWithBlock:(id)a3;
- (void)_notifyDelegatesAddedLocalDevice:(id)a3;
- (void)_notifyListenersAndSetDependentRegistrations:(id)a3 onRegistrationInfo:(id)a4;
- (void)_notifyListenersWithChanges:(id)a3;
- (void)_notifyRegistrationListenersAccountDidUpdateRegisteredDevices;
- (void)_parseHandlesInfo:(id)a3 currentAliases:(id)a4 currentVettedAliases:(id)a5;
- (void)_processReceivedDependentRegistration:(id)a3 oldDependentRegistrations:(id)a4;
- (void)_rapportSendWithSendParameters:(id)a3 completionBlock:(id)a4;
- (void)_reAuthenticate;
- (void)_refreshRegistration;
- (void)_registerAccount;
- (void)_registerForDeviceCenterNotifications;
- (void)_registrationAbilityChanged:(id)a3;
- (void)_removeAliases:(id)a3 withReason:(unsigned __int8)a4;
- (void)_removeAllPseudonyms;
- (void)_removeAuthenticationCredentials;
- (void)_removeAuthenticationCredentialsIncludingAuthToken:(BOOL)a3;
- (void)_removePseudonym:(id)a3;
- (void)_removePseudonyms:(id)a3;
- (void)_reregister;
- (void)_reregisterAndReProvision;
- (void)_reregisterAndReidentify:(BOOL)a3;
- (void)_resetVariables;
- (void)_retryRegister;
- (void)_saveAndNotifyGDRUpdate;
- (void)_sendLocallyWithSendParameters:(id)a3 uriToLocalDestination:(id)a4 data:(id)a5 protobuf:(id)a6 completionBlock:(id)a7;
- (void)_sendMessageWithSendParametersOnMainThread:(id)a3 filteredDestinations:(id)a4 data:(id)a5 compressedData:(id)a6 protobufToSend:(id)a7 willSendBlock:(id)a8 completionBlock:(id)a9;
- (void)_sendRemotelyWithSendParameters:(id)a3 data:(id)a4 protobuf:(id)a5 willSendBlock:(id)a6 completionBlock:(id)a7;
- (void)_setUserIntentState:(unsigned __int8)a3 forAlias:(id)a4 withReason:(unsigned __int8)a5;
- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8;
- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8 aliasProperties:(id)a9;
- (void)_setupAccount;
- (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 rapportDestinations:(id *)a6 sendParameters:(id)a7;
- (void)_stopTrackingUserIntentOfAlias:(id)a3;
- (void)_unregisterAccount;
- (void)_unvalidateAliases:(id)a3;
- (void)_updateAccountWithAccountInfo:(id)a3;
- (void)_updateCallerIDToTemporaryPhone;
- (void)_updateHandles:(BOOL)a3;
- (void)_updatePerformedForcedGDRDate;
- (void)_updatePhoneNumberCallerID;
- (void)_updatePseudonymsFromEmailInfo:(id)a3;
- (void)_updateRegistrationStatusWithError:(int64_t)a3 info:(id)a4;
- (void)_updateSessionsForAllRegisteredURIs;
- (void)_updateSessionsWithRegisteredURIs:(id)a3;
- (void)_updateSessionsWithRegisteredURIs:(id)a3 retryIfNotRegistered:(BOOL)a4;
- (void)_updateVettedAliases:(id)a3 emailInfo:(id)a4 addToCurrentHandlesIfNeeded:(BOOL)a5;
- (void)_validateAliases:(id)a3;
- (void)_validateAliases:(id)a3 validateAlreadyValid:(BOOL)a4;
- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4;
- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4 interestedSubservices:(id)a5;
- (void)activateRegistration;
- (void)addAliases:(id)a3;
- (void)addRegistrationListener:(id)a3;
- (void)askPeersToClearCacheWithURIs:(id)a3 fromURI:(id)a4 forService:(id)a5;
- (void)authenticateAccount;
- (void)authenticationChanged;
- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedRegionValidation:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 startedAuthenticating:(id)a4;
- (void)center:(id)a3 succeededAuthentication:(id)a4;
- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5;
- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6;
- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8;
- (void)cleanupAccount;
- (void)clearDisplayName;
- (void)deactivateAndPurgeIdentify;
- (void)deactivateRegistration;
- (void)dealloc;
- (void)decryptMessageData:(id)a3 guid:(id)a4 localURI:(id)a5 remoteURI:(id)a6 pushToken:(id)a7 groupID:(id)a8 encryptionType:(int64_t)a9 isLiveRetry:(BOOL)a10 replayKey:(id)a11 completionBlock:(id)a12;
- (void)didAddPairedDevice:(id)a3;
- (void)didRemovePairedDevice:(id)a3;
- (void)didUpdatePairedDevice:(id)a3;
- (void)didUpdateProtocolForPairedDevice:(id)a3;
- (void)findDeviceUniqueID:(id *)a3 btID:(id *)a4 forURI:(id)a5 token:(id)a6 supportsLiveDelivery:(BOOL *)a7;
- (void)gdrReAuthenticateIfNecessary;
- (void)handler:(id)a3 flushCacheForURIs:(id)a4;
- (void)handler:(id)a3 profile:(id)a4 deviceUpdated:(id)a5 service:(id)a6;
- (void)handler:(id)a3 profileHandlesUpdated:(id)a4 status:(id)a5 allowGDR:(id)a6;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)handler:(id)a3 reloadBag:(id)a4;
- (void)loadAliasUserIntentMetadataIfNeeded;
- (void)markAsSelectedAlias:(id)a3;
- (void)markAsUnselectedAlias:(id)a3 withReason:(unsigned __int8)a4;
- (void)markAsUnvettedAlias:(id)a3;
- (void)markAsVettedAlias:(id)a3;
- (void)markAsWasSelectedAlias:(id)a3;
- (void)passwordUpdated;
- (void)reIdentify;
- (void)refreshAdHocServiceNames;
- (void)refreshVettedAliases;
- (void)registerAccount;
- (void)registrationController:(id)a3 deregistrationSucceeded:(id)a4;
- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4;
- (void)registrationController:(id)a3 registrationFailed:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)registrationController:(id)a3 registrationSucceeded:(id)a4;
- (void)registrationController:(id)a3 registrationUpdated:(id)a4;
- (void)registrationController:(id)a3 registrationWillStart:(id)a4;
- (void)registrationControllerNeedsNewRegistration:(id)a3;
- (void)removeAliases:(id)a3;
- (void)removeRegistrationListener:(id)a3;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6;
- (void)reportClientEvent:(id)a3 completionBlock:(id)a4;
- (void)reportMessage:(id)a3 toURI:(id)a4;
- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8;
- (void)reregister;
- (void)resetErrorState;
- (void)retrieveFeatureToggleStateForOptions:(id)a3 completionBlock:(id)a4;
- (void)sendMessage:(id)a3 params:(id)a4 bulkedPayload:(id)a5 fromID:(id)a6 toDestinations:(id)a7 useDictAsTopLevel:(BOOL)a8 dataToEncrypt:(id)a9 encryptPayload:(BOOL)a10 wantsResponse:(BOOL)a11 expirationDate:(id)a12 command:(id)a13 wantsDeliveryStatus:(BOOL)a14 wantsCertifiedDelivery:(BOOL)a15 deliveryStatusContext:(id)a16 messageUUID:(id)a17 priority:(int64_t)a18 localDelivery:(BOOL)a19 disallowRefresh:(BOOL)a20 willSendBlock:(id)a21 completionBlock:(id)a22;
- (void)sendMessageWithSendParameters:(id)a3 willSendBlock:(id)a4 completionBlock:(id)a5;
- (void)sendSenderKeyMessageToDestinations:(id)a3 fromURI:(id)a4 guid:(id)a5 messageData:(id)a6 completionBlock:(id)a7;
- (void)sendServerMessage:(id)a3 command:(id)a4 completionBlock:(id)a5;
- (void)setDisplayName:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGameCenterData:(id)a3;
- (void)setIsBeingRemoved:(BOOL)a3;
- (void)setIsTemporary:(BOOL)a3;
- (void)setIsUserDisabled:(BOOL)a3;
- (void)setLoginID:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPendingDependentCheck:(BOOL)a3;
- (void)setRegistrationStatus:(int)a3 error:(int64_t)a4 alertInfo:(id)a5;
- (void)setUserUniqueIdentifier:(id)a3;
- (void)setWasDisabledAutomatically:(BOOL)a3;
- (void)setupAccountWithCompletionBlock:(id)a3;
- (void)systemDidFinishMigration;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemDidStartBackup;
- (void)systemRestoreStateDidChange;
- (void)unregisterAccount;
- (void)unvalidateAliases:(id)a3;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4;
- (void)updateFeatureToggleStateWithOptions:(id)a3 completionBlock:(id)a4;
- (void)validateAliases:(id)a3;
- (void)validateCredentialsWithDeliveryCompletionBlock:(id)a3;
- (void)validateProfile;
- (void)writeAccountDefaults:(id)a3;
@end

@implementation IDSDAccount

- (void)_cleanupAccount
{
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  char v107 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  char v103 = 0;
  v2 = [(IDSDAccount *)self service];
  v75 = [v2 identifier];

  unsigned int v3 = [v75 isEqualToIgnoringCase:@"com.apple.madrid"];
  unsigned int v4 = [v75 isEqualToIgnoringCase:@"com.apple.ess"];
  unsigned int v5 = [v75 isEqualToIgnoringCase:@"com.apple.private.ac"];
  unsigned int v6 = [v75 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"];
  unsigned int v7 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration];
  unsigned int v8 = [(IDSDAccount *)self accountType];
  BOOL v9 = v8 == 1;
  if (v8 == 1) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = 0;
  }
  unsigned int v71 = v10;
  v11 = +[IDSRegistrationController registeredPhoneNumbers];
  id v12 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v68 = v6;
  unsigned int v69 = v4;
  unsigned int v70 = v3;
  v64 = (void *)kIDSServiceDefaultsVettedAliasesKey;
  v13 = -[NSMutableDictionary objectForKey:](self->_accountInfo, "objectForKey:");
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_10017D088;
  v96[3] = &unk_1009842B8;
  BOOL v99 = v9;
  id v14 = v11;
  id v97 = v14;
  v98 = &v104;
  v15 = objc_msgSend(v13, "__imArrayByApplyingBlock:", v96);

  key = (void *)kIDSServiceDefaultsAliasesKey;
  v16 = -[NSMutableDictionary objectForKey:](self->_accountInfo, "objectForKey:");
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_10017D1A4;
  v88[3] = &unk_1009842E0;
  v93 = &v100;
  v94 = &v104;
  id v73 = v12;
  id v89 = v73;
  v90 = self;
  id v72 = v15;
  id v91 = v72;
  BOOL v95 = v9;
  id v67 = v14;
  id v92 = v67;
  objc_msgSend(v16, "__imArrayByApplyingBlock:", v88);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v18 = [(IDSDAccount *)self unprefixedURIStringsFromRegistration];
  v19 = objc_msgSend(v18, "__imArrayByApplyingBlock:", &stru_100984300);
  v77 = objc_msgSend(v19, "__imSetFromArray");

  v20 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_100984320);
  v76 = objc_msgSend(v20, "__imSetFromArray");

  if (v76 && ([v76 isEqualToSet:v77] & 1) != 0
    || ([(IDSDAccount *)self registration],
        v21 = objc_claimAutoreleasedReturnValue(),
        BOOL v22 = v21 == 0,
        v21,
        v22))
  {
    BOOL v74 = 0;
    v38 = v17;
  }
  else
  {
    id v23 = [v77 mutableCopy];
    [v23 minusSet:v76];
    id v66 = [v76 mutableCopy];
    [v66 minusSet:v77];
    if (!v17) {
      id v17 = objc_alloc_init((Class)NSArray);
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v23;
    id v24 = [obj countByEnumeratingWithState:&v84 objects:v123 count:16];
    uint64_t v25 = (uint64_t)v17;
    BOOL v74 = v24 != 0;
    if (v24)
    {
      uint64_t v26 = *(void *)v85;
      uint64_t v27 = kIDSServiceDefaultsAliasKey;
      uint64_t v28 = kIDSServiceDefaultsAliasStatusKey;
      uint64_t v29 = kIDSServiceDefaultsAliasIsUserVisibleKey;
      do
      {
        v30 = 0;
        v31 = (void *)v25;
        do
        {
          if (*(void *)v85 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v84 + 1) + 8 * (void)v30);
          v121[0] = v27;
          v121[1] = v28;
          v122[0] = v32;
          v122[1] = &off_1009D1758;
          v121[2] = v29;
          v122[2] = &__kCFBooleanFalse;
          v33 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];
          uint64_t v25 = [v31 arrayByAddingObject:v33];

          v30 = (char *)v30 + 1;
          v31 = (void *)v25;
        }
        while (v24 != v30);
        id v24 = [obj countByEnumeratingWithState:&v84 objects:v123 count:16];
      }
      while (v24);
    }

    if ([v66 count]) {
      IMSetAppBoolForKey();
    }
    v34 = +[IMRGLog accountCleanup];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [(IDSDAccount *)self smallDescription];
      unsigned int v36 = [obj count];
      unsigned int v37 = [v66 count];
      *(_DWORD *)buf = 138413314;
      v112 = v35;
      __int16 v113 = 1024;
      unsigned int v114 = v36;
      __int16 v115 = 1024;
      unsigned int v116 = v37;
      __int16 v117 = 2112;
      v118 = v77;
      __int16 v119 = 2112;
      v120 = v76;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Alias set does not match during cleanup {self: %@, registeredButNotStored.count: %d, storedButNotRegistered.count: %d, aliasStrings: %@, aliasesSet: %@}", buf, 0x2Cu);
    }
    v38 = (void *)v25;
  }
  if ((v71 & (v70 | v69 | v5 | v68)) == 0)
  {
    int v46 = 0;
LABEL_31:
    v39 = self;
    goto LABEL_33;
  }
  v39 = self;
  if (!*((unsigned char *)v101 + 24) && [(IDSDAccount *)self isRegistered])
  {
    v40 = +[IMRGLog accountCleanup];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Account is missing sentinel alias, repairing...", buf, 2u);
    }

    id v41 = [objc_alloc((Class)NSMutableArray) initWithArray:v38];
    v109[0] = kIDSServiceDefaultsAliasKey;
    v42 = [kIDSServiceDefaultsSentinelAlias lowercaseString];
    v110[0] = v42;
    v110[1] = &off_1009D1758;
    v109[1] = kIDSServiceDefaultsAliasStatusKey;
    v109[2] = kIDSServiceDefaultsAliasIsUserVisibleKey;
    v110[2] = &__kCFBooleanFalse;
    v43 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:3];

    [v41 addObject:v43];
    id v44 = v41;

    v45 = +[IMRGLog accountCleanup];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Indicating that we need to re-register for alias repair", buf, 2u);
    }

    IMSetAppBoolForKey();
    int v46 = 1;
    v38 = v44;
    goto LABEL_31;
  }
  int v46 = 0;
LABEL_33:
  v47 = (const void *)kIDSServiceDefaultsRegisteredURIs;
  v48 = [(NSMutableDictionary *)v39->_accountInfo objectForKey:kIDSServiceDefaultsRegisteredURIs];

  if (*((unsigned char *)v105 + 24)) {
    int v49 = 1;
  }
  else {
    int v49 = v46;
  }
  if ((v74 | v49 | (v48 != 0)) == 1)
  {
    v50 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (*((unsigned char *)v105 + 24)) {
      int v51 = 1;
    }
    else {
      int v51 = v46;
    }
    if ((v74 | v51) == 1)
    {
      id v52 = v38;
      if (v52) {
        CFDictionarySetValue(v50, key, v52);
      }

      if (((*((unsigned char *)v105 + 24) == 0) & ~v46) == 0)
      {
        id v53 = v72;
        if (v53) {
          CFDictionarySetValue(v50, v64, v53);
        }

        v54 = [(IDSDAccount *)self registration];
        [v54 setVettedEmails:v53];
      }
    }
    if (v48)
    {
      v55 = +[NSNull null];
      if (v55) {
        CFDictionarySetValue(v50, v47, v55);
      }
    }
    v56 = +[IMRGLog accountCleanup];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v50;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "  Cleaning up account!!! -- with changes: %@", buf, 0xCu);
    }

    [(IDSDAccount *)self _writeAccountDefaults:v50 force:1];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v57 = v73;
    id v58 = [v57 countByEnumeratingWithState:&v80 objects:v108 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v81;
      do
      {
        for (i = 0; i != v58; i = (char *)i + 1)
        {
          if (*(void *)v81 != v59) {
            objc_enumerationMutation(v57);
          }
          [(IDSDAccount *)self markAsUnselectedAlias:*(void *)(*((void *)&v80 + 1) + 8 * i) withReason:5];
        }
        id v58 = [v57 countByEnumeratingWithState:&v80 objects:v108 count:16];
      }
      while (v58);
    }
  }
  v61 = [(IDSDAccount *)self pseudonyms];
  objc_msgSend(v61, "__imArrayByFilteringWithBlock:", &stru_100984360);
  v62 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  if ([(__CFDictionary *)v62 count])
  {
    v63 = +[IMRGLog accountCleanup];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v62;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "  Cleaning up expired pseudonyms {pseudonymsToRemove: %@}", buf, 0xCu);
    }

    [(IDSDAccount *)self _removePseudonyms:v62];
  }

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
}

- (void)_resetVariables
{
  char v2 = *((unsigned char *)self + 81);
  *((unsigned char *)self + 80) &= 3u;
  *((unsigned char *)self + 81) = v2 & 0xFC;
}

- (void)_setupAccount
{
  *((unsigned char *)self + 80) |= 2u;
  registrationInfo = self->_registrationInfo;
  self->_registrationInfo = 0;

  [(IDSDAccount *)self _resetVariables];
  [(IDSDAccount *)self _cleanupAccount];
  id v5 = objc_alloc((Class)CUTDeferredTaskQueue);
  unsigned int v6 = im_primary_queue();
  unsigned int v7 = (CUTDeferredTaskQueue *)[v5 initWithCapacity:1 queue:v6 block:&stru_1009843A0];
  broadcastAccountInfoChangedTask = self->_broadcastAccountInfoChangedTask;
  self->_broadcastAccountInfoChangedTask = v7;

  BOOL v9 = +[IDSUTunDeliveryController sharedInstance];
  [v9 addConnectivityDelegate:self];

  unsigned int v10 = +[IDSPairingManager sharedInstance];
  [v10 addDelegate:self];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = +[IDSPeerIDManager sharedInstance];
  objc_copyWeak(&v26, &location);
  id v12 = [(IDSDAccount *)self uniqueID];
  [v11 addCompletionBlock:&v25 forToken:v12];

  int64_t v13 = [(IDSDAccount *)self registrationError];
  int v14 = [(IDSDAccount *)self registrationErrorReason];
  if (v13 == -1)
  {
    int v15 = v14;
    if (v14 != -1)
    {
      uint64_t v16 = sub_100148710(v14);
      id v17 = objc_alloc((Class)NSMutableDictionary);
      uint64_t v18 = kIDSServiceDefaultsRegistrationInfoKey;
      v19 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsRegistrationInfoKey];
      v20 = (__CFDictionary *)[v17 initWithDictionary:v19];

      v21 = +[NSNumber numberWithInteger:v16];
      if (v21) {
        CFDictionarySetValue(v20, kIDSServiceDefaultsRegistrationInfoInternalErrorCodeKey, v21);
      }

      BOOL v22 = +[NSDictionary dictionaryWithObject:v20 forKey:v18];
      [(IDSDAccount *)self _writeAccountDefaults:v22 force:1];

      id v23 = +[IMRGLog registration];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = sub_10014877C(v16);
        *(_DWORD *)buf = 67109634;
        int v29 = v16;
        __int16 v30 = 2112;
        v31 = v24;
        __int16 v32 = 1024;
        int v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Setting registration error to %d (%@) from reason %d", buf, 0x18u);
      }
    }
  }
  *((unsigned char *)self + 80) &= ~2u;
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (IDSDAccount)initWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "IDSDAccount initWithDictionary %@ service %@ uniqueID %@", buf, 0x20u);
  }

  v36.receiver = self;
  v36.super_class = (Class)IDSDAccount;
  id v12 = [(IDSDAccount *)&v36 init];
  if (!v12) {
    goto LABEL_20;
  }
  if (v10)
  {
    if (v9)
    {
      int64_t v13 = [v8 objectForKey:kIDSServiceDefaultsAccountTypeKey];
      int v14 = [v13 intValue];

      if (IDSIsValidAccountType())
      {
        objc_storeStrong((id *)&v12->_uniqueID, a5);
        int v15 = (NSMutableDictionary *)[v8 mutableCopy];
        accountInfo = v12->_accountInfo;
        v12->_accountInfo = v15;

        if (!v12->_accountInfo)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          uint64_t v18 = v12->_accountInfo;
          v12->_accountInfo = (NSMutableDictionary *)Mutable;
        }
        objc_storeStrong((id *)&v12->_service, a4);
        uint64_t v19 = kIDSServiceDefaultsAliasesKey;
        v20 = [v8 objectForKey:kIDSServiceDefaultsAliasesKey];
        __int16 v30 = _NSConcreteStackBlock;
        uint64_t v31 = 3221225472;
        __int16 v32 = sub_10017E624;
        int v33 = &unk_100984458;
        v21 = v12;
        v34 = v21;
        id v35 = v8;
        BOOL v22 = objc_msgSend(v20, "__imArrayByApplyingBlock:", &v30);

        id v23 = objc_msgSend(v22, "count", v30, v31, v32, v33);
        id v24 = v12->_accountInfo;
        if (v23) {
          [(NSMutableDictionary *)v24 setObject:v22 forKey:v19];
        }
        else {
          [(NSMutableDictionary *)v24 removeObjectForKey:v19];
        }
        uint64_t v27 = v12->_accountInfo;
        uint64_t v28 = [v9 pushTopic];
        [(NSMutableDictionary *)v27 setObject:v28 forKey:kIDSServiceDefaultsPushTopicKey];

        [(NSMutableDictionary *)v12->_accountInfo removeObjectForKey:@"AuthToken"];
        [(IDSDAccount *)v21 _setupAccount];

LABEL_20:
        id v26 = v12;
        goto LABEL_21;
      }
      uint64_t v25 = +[IMRGLog warning];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_100713D3C(v14, v25);
      }
    }
    else
    {
      uint64_t v25 = +[IMRGLog warning];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_100713CD4();
      }
    }
  }
  else
  {
    uint64_t v25 = +[IMRGLog warning];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_100713C6C();
    }
  }

  id v26 = 0;
LABEL_21:

  return v26;
}

- (id)_initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8 isAdHocAccount:(BOOL)a9
{
  uint64_t v11 = *(void *)&a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v36 = a7;
  id v18 = a8;
  uint64_t v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v16;
    __int16 v42 = 2112;
    id v43 = v17;
    __int16 v44 = 1024;
    int v45 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "IDSDAccount initWithLoginID %@ service %@ uniqueID %@ accountType %d", buf, 0x26u);
  }

  v37.receiver = self;
  v37.super_class = (Class)IDSDAccount;
  v20 = [(IDSDAccount *)&v37 init];
  if (!v20) {
    goto LABEL_29;
  }
  if (!v17)
  {
    v21 = +[IMRGLog warning];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_100713C6C();
    }
    goto LABEL_32;
  }
  if ((IDSIsValidAccountType() & 1) == 0)
  {
    BOOL v22 = +[IMRGLog warning];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_100713D3C(v11, v22);
    }

    goto LABEL_33;
  }
  if (!v16)
  {
    v21 = +[IMRGLog warning];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_100713CD4();
    }
    goto LABEL_32;
  }
  if (!a9)
  {
    if (![v16 adHocServiceType]) {
      goto LABEL_20;
    }
    v21 = +[IMRGLog warning];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_100713E38();
    }
    goto LABEL_32;
  }
  if (![v18 length])
  {
    v21 = +[IMRGLog warning];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_100713DB4();
    }
LABEL_32:

LABEL_33:
    v34 = 0;
    goto LABEL_34;
  }
  [v16 adHocServiceType];
LABEL_20:
  if ([v36 count])
  {
    id v23 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v36];
    accountInfo = v20->_accountInfo;
    v20->_accountInfo = v23;
  }
  if (!v20->_accountInfo)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v26 = v20->_accountInfo;
    v20->_accountInfo = (NSMutableDictionary *)Mutable;
  }
  objc_storeStrong((id *)&v20->_service, a4);
  objc_storeStrong((id *)&v20->_uniqueID, a5);
  if ([v15 length]) {
    [(IDSDAccount *)v20 setObject:v15 forKey:kIDSServiceDefaultsLoginAsKey];
  }
  uint64_t v27 = [v16 identifier];
  [(IDSDAccount *)v20 setObject:v27 forKey:kIDSServiceDefaultsServiceNameKey];

  uint64_t v28 = [v16 pushTopic];
  [(IDSDAccount *)v20 setObject:v28 forKey:kIDSServiceDefaultsPushTopicKey];

  int v29 = +[NSNumber numberWithInt:v11];
  [(IDSDAccount *)v20 setObject:v29 forKey:kIDSServiceDefaultsAccountTypeKey];

  if (a9)
  {
    __int16 v30 = +[IDSDAccountController sharedInstance];
    uint64_t v31 = [v30 accountWithUniqueID:v18];

    __int16 v32 = [v31 service];
    int v33 = [v32 identifier];
    [(IDSDAccount *)v20 setObject:v33 forKey:kIDSServiceDefaultsPrimaryServiceNameKey];

    [(IDSDAccount *)v20 setObject:v18 forKey:kIDSServiceDefaultsPrimaryAccountKey];
  }
  [(IDSDAccount *)v20 _setupAccount];
LABEL_29:
  v34 = v20;
LABEL_34:

  return v34;
}

- (id)initAdHocAccountWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8
{
  LOBYTE(v9) = 1;
  return [(IDSDAccount *)self _initWithLoginID:a3 service:a4 uniqueID:a5 accountType:*(void *)&a6 accountConfig:a7 primaryAccount:a8 isAdHocAccount:v9];
}

- (IDSDAccount)initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7
{
  LOBYTE(v8) = 0;
  return (IDSDAccount *)[(IDSDAccount *)self _initWithLoginID:a3 service:a4 uniqueID:a5 accountType:*(void *)&a6 accountConfig:a7 primaryAccount:0 isAdHocAccount:v8];
}

- (void)cleanupAccount
{
}

- (void)dealloc
{
  unsigned int v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = uniqueID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc IDSAccount: %@", buf, 0xCu);
  }

  [(CUTDeferredTaskQueue *)self->_broadcastAccountInfoChangedTask cancelPendingExecutions];
  id v5 = +[IDSPeerIDManager sharedInstance];
  unsigned int v6 = [(IDSDAccount *)self uniqueID];
  [v5 removeCompletionBlockForToken:v6];

  unsigned int v7 = +[IDSUTunDeliveryController sharedInstance];
  [v7 removeConnectivityDelegate:self];

  uint64_t v8 = +[IDSPairingManager sharedInstance];
  [v8 removeDelegate:self];

  uint64_t v9 = +[IDSRegistrationController sharedInstance];
  [v9 removeListener:self];

  id v10 = +[IDSSMSRegistrationCenter sharedInstance];
  [v10 removeListener:self];

  uint64_t v11 = +[IDSAppleIDRegistrationCenter sharedInstance];
  [v11 removeListener:self];

  id v12 = +[IDSRegistrationCenter sharedInstance];
  [v12 removeListener:self];

  int64_t v13 = +[IMSystemMonitor sharedInstance];
  [v13 removeListener:self];

  int v14 = +[NSNotificationCenter defaultCenter];
  [v14 removeObserver:self name:0 object:0];

  [(IDSDAccount *)self _ignoreIncomingPushes];
  id v15 = +[IDSDRegistrationPushManager sharedInstance];
  [v15 stopTrackingRegisteredAccountID:self->_uniqueID];

  [(IDSRegistrationPushHandler *)self->_pushHandler removeListener:self];
  [(IDSDAccount *)self _stopRegistrationAgent];
  id v16 = +[IDSRestoreMonitor sharedInstance];
  [v16 removeTarget:self];

  v17.receiver = self;
  v17.super_class = (Class)IDSDAccount;
  [(IDSDAccount *)&v17 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    [(NSMutableDictionary *)self->_accountInfo setObject:v6 forKey:v7];
  }
  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      int64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Missing object %@ or key %@ when changing accountInfo", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (IDSServiceProperties)service
{
  return self->_service;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)userUniqueIdentifier
{
  return (NSString *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsUserUniqueIdentifier];
}

- (void)setUserUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v6 = kIDSServiceDefaultsUserUniqueIdentifier;
    id v7 = a3;
    id v4 = a3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    [(IDSDAccount *)self writeAccountDefaults:v5];

    [(IDSRegistration *)self->_registrationInfo setUserUniqueIdentifier:v4];
    [(IDSRegistration *)self->_registrationInfo saveToKeychain];
  }
}

- (IDSGameCenterData)gameCenterData
{
  id v3 = objc_alloc((Class)IDSGameCenterData);
  id v4 = [(NSMutableDictionary *)self->_accountInfo objectForKey:IDSGameCenterContactsAssociationID];
  id v5 = [(NSMutableDictionary *)self->_accountInfo objectForKey:IDSGameCenterContactsSharingState];
  uint64_t v6 = [(NSMutableDictionary *)self->_accountInfo objectForKey:IDSGameCenterContactsLastUpdatedDate];
  id v7 = [v3 initWithAssociationID:v4 sharingState:v5 lastUpdatedDate:v6];

  return (IDSGameCenterData *)v7;
}

- (void)setGameCenterData:(id)a3
{
  id v9 = a3;
  id v4 = [v9 contactsAssociationID];

  if (v4)
  {
    id v5 = [v9 contactsAssociationID];
    [(IDSDAccount *)self setObject:v5 forKey:IDSGameCenterContactsAssociationID];
  }
  else
  {
    [(NSMutableDictionary *)self->_accountInfo removeObjectForKey:IDSGameCenterContactsAssociationID];
  }
  uint64_t v6 = [v9 contactsSharingState];
  [(IDSDAccount *)self setObject:v6 forKey:IDSGameCenterContactsSharingState];

  id v7 = [v9 contactsLastUpdatedDate];

  if (v7)
  {
    uint64_t v8 = [v9 contactsLastUpdatedDate];
    [(IDSDAccount *)self setObject:v8 forKey:IDSGameCenterContactsLastUpdatedDate];
  }
  else
  {
    [(NSMutableDictionary *)self->_accountInfo removeObjectForKey:IDSGameCenterContactsLastUpdatedDate];
  }
}

- (NSString)loginID
{
  return (NSString *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsLoginAsKey];
}

- (NSString)displayName
{
  return (NSString *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsDisplayNameKey];
}

- (void)setDisplayName:(id)a3
{
  id v4 = (IDSDAccount *)a3;
  if ([(IDSDAccount *)v4 length])
  {
    id v5 = [(IDSDAccount *)self displayName];
    unsigned __int8 v6 = [v5 isEqualToIgnoringCase:v4];

    if ((v6 & 1) == 0)
    {
      id v7 = [(IDSDAccount *)self aliases];
      unsigned int v8 = [v7 containsObject:v4];

      id v9 = +[IMRGLog registration];
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          id v11 = [(IDSDAccount *)self displayName];
          *(_DWORD *)buf = 138412802;
          id v16 = self;
          __int16 v17 = 2112;
          id v18 = v11;
          __int16 v19 = 2112;
          v20 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Display name changed for account: %@    %@ => %@", buf, 0x20u);
        }
        uint64_t v13 = kIDSServiceDefaultsDisplayNameKey;
        int v14 = v4;
        id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
        [(IDSDAccount *)self writeAccountDefaults:v9];
      }
      else if (v10)
      {
        __int16 v12 = [(IDSDAccount *)self aliases];
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requested display name: %@ is not part of valid account aliases: %@, ignoring!", buf, 0x16u);
      }
    }
  }
}

- (void)clearDisplayName
{
  id v3 = [(IDSDAccount *)self displayName];

  if (v3)
  {
    id v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(IDSDAccount *)self displayName];
      *(_DWORD *)buf = 138412290;
      BOOL v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request to clear Display Name on Account, Removing Display name %@", buf, 0xCu);
    }
    uint64_t v7 = kIDSServiceDefaultsDisplayNameKey;
    CFStringRef v8 = &stru_10099BE78;
    unsigned __int8 v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [(IDSDAccount *)self writeAccountDefaults:v6];
  }
}

- (void)setIsUserDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMShouldLog()) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    unsigned __int8 v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(IDSDAccount *)self uniqueID];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account with uniqueID %@ was disabled by user", buf, 0xCu);
    }
  }
  CFStringRef v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3, kIDSServiceDefaultsUserDisabled);
  id v11 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [(IDSDAccount *)self writeAccountDefaults:v9];
}

- (BOOL)isUserDisabled
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsUserDisabled];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int)accountType
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsAccountTypeKey];
  int v3 = [v2 intValue];

  return v3;
}

- (NSString)dsHandle
{
  char v2 = [(IDSDAccount *)self primaryRegistration];
  int v3 = [v2 dsHandle];

  return (NSString *)v3;
}

- (NSString)dsID
{
  return (NSString *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsAuthorizationIDKey];
}

- (void)setLoginID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kIDSServiceDefaultsLoginAsKey;
  unsigned __int8 v6 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsLoginAsKey];
  if (([v4 isEqualToIgnoringCase:v6] & 1) == 0)
  {
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412802;
      __int16 v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting loginID on account { oldLoginID: %@, newLoginID: %@, self: %@ }", (uint8_t *)&v11, 0x20u);
    }

    CFStringRef v8 = [v4 lowercaseString];
    [(IDSDAccount *)self setObject:v8 forKey:v5];

    id v9 = [(IDSDAccount *)self registration];
    [v9 setMainID:v4];

    uint64_t v10 = [(IDSDAccount *)self registration];
    [v10 setVettedEmails:0];

    [(IDSDAccount *)self registerAccount];
  }
}

- (int)registrationStatus
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsRegistrationInfoKey];
  int v3 = [v2 objectForKey:kIDSServiceDefaultsRegistrationInfoStatusKey];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (int)registrationErrorReason
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsRegistrationInfoKey];
  int v3 = [v2 objectForKey:kIDSServiceDefaultsRegistrationInfoErrorCodeKey];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

- (int64_t)registrationError
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsRegistrationInfoKey];
  int v3 = [v2 objectForKey:kIDSServiceDefaultsRegistrationInfoInternalErrorCodeKey];
  id v4 = v3;
  if (v3) {
    int64_t v5 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (BOOL)isTemporary
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsIsTemporary];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsTemporary:(BOOL)a3
{
  if (a3)
  {
    uint64_t v10 = kIDSServiceDefaultsIsTemporary;
    id v4 = +[NSNumber numberWithBool:1];
    int v11 = v4;
    int64_t v5 = &v11;
    unsigned __int8 v6 = &v10;
  }
  else
  {
    uint64_t v8 = kIDSServiceDefaultsIsTemporary;
    id v4 = +[NSNull null];
    id v9 = v4;
    int64_t v5 = &v9;
    unsigned __int8 v6 = &v8;
  }
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v6 count:1];
  [(IDSDAccount *)self writeAccountDefaults:v7];
}

- (NSDate)expirationDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsExpirationDate];
}

- (void)setExpirationDate:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(IDSDAccount *)self expirationDate];
  if (v4)
  {
    uint64_t v21 = kIDSServiceDefaultsExpirationDate;
    id v22 = v4;
    unsigned __int8 v6 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [(IDSDAccount *)self writeAccountDefaults:v6];
  }
  else
  {
    uint64_t v19 = kIDSServiceDefaultsExpirationDate;
    unsigned __int8 v6 = +[NSNull null];
    v20 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [(IDSDAccount *)self writeAccountDefaults:v7];
  }
  unsigned int v8 = [(IDSDAccount *)self isTemporary];
  if (v4 && v8 && !v5)
  {
    id v9 = +[IDSDaemon sharedInstance];
    uint64_t v10 = [(IDSDAccount *)self service];
    int v11 = [v10 pushTopic];
    __int16 v12 = [v9 broadcasterForTopic:v11 ignoreServiceListener:1 messageContext:0];

    __int16 v13 = [(IDSDAccount *)self accountSetupInfo];
    [v12 accountAdded:v13];

    id v14 = +[IDSDAccountController sharedInstance];
    __int16 v15 = [(IDSDAccount *)self uniqueID];
    LODWORD(v11) = [v14 isEnabledAccount:v15];

    if (v11)
    {
      id v16 = [(IDSDAccount *)self uniqueID];
      __int16 v17 = [(IDSDAccount *)self service];
      id v18 = [v17 pushTopic];
      [v12 accountEnabled:v16 onService:v18];
    }
  }
}

- (void)authenticationChanged
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
}

- (BOOL)isRegistered
{
  return [(IDSDAccount *)self registrationStatus] == 5;
}

- (BOOL)shouldAutoRegisterAllHandles
{
  char v2 = [(IDSDAccount *)self service];
  unsigned __int8 v3 = [v2 shouldAutoRegisterAllHandles];

  return v3;
}

- (BOOL)shouldRegisterUsingDSHandle
{
  char v2 = [(IDSDAccount *)self service];
  unsigned __int8 v3 = [v2 shouldRegisterUsingDSHandle];

  return v3;
}

- (BOOL)isEnabled
{
  unsigned __int8 v3 = +[IDSDAccountController sharedInstance];
  id v4 = [(IDSDAccount *)self uniqueID];
  unsigned __int8 v5 = [v3 isEnabledAccount:v4];

  return v5;
}

- (void)setupAccountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (_IMWillLog())
  {
    id v24 = "-[IDSDAccount setupAccountWithCompletionBlock:]";
    _IMAlwaysLog();
  }
  unsigned __int8 v5 = (void (**)(id, IDSDAccount *))objc_msgSend(v4, "copy", v24);

  unsigned __int8 v6 = +[IDSDAccountController sharedInstance];
  uint64_t v7 = [(IDSDAccount *)self uniqueID];
  [v6 enableAccountWithUniqueID:v7];

  unsigned int v8 = [(IDSDAccount *)self registrationStatus];
  unsigned int v9 = v8;
  if (v8 == 5 || v8 == -1)
  {
    uint64_t v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(IDSDAccount *)self uniqueID];
      *(_DWORD *)buf = 67109378;
      LODWORD(v26[0]) = v9;
      WORD2(v26[0]) = 2112;
      *(void *)((char *)v26 + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IDSDAccount status %d, calling handler: %@", buf, 0x12u);
    }
    if (v5) {
      v5[2](v5, self);
    }
    goto LABEL_19;
  }
  if ([(IDSDAccount *)self accountType] != 1) {
    goto LABEL_13;
  }
  if ([(IDSDAccount *)self shouldAutoRegisterAllHandles]
    || [(IDSDAccount *)self shouldRegisterUsingDSHandle])
  {
    [(IDSDAccount *)self registerAccount];
LABEL_13:
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  id v18 = [(IDSDAccount *)self accountInfo];
  uint64_t v19 = [v18 objectForKey:kIDSServiceDefaultsAliasesKey];
  v20 = objc_msgSend(v19, "__imArrayByApplyingBlock:", &stru_100984478);

  id v21 = [v20 count];
  id v22 = +[IMRGLog registration];
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412290;
      v26[0] = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Can configure account with aliases: %@", buf, 0xCu);
    }

    [(IDSDAccount *)self registerAccount];
    [(IDSDAccount *)self addAliases:v20];
    [(IDSDAccount *)self validateAliases:v20];
  }
  else
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "* No aliases to configure, nothing to do here", buf, 2u);
    }
  }
  if (v5)
  {
LABEL_14:
    if (!self->_setupHandlers)
    {
      __int16 v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      setupHandlers = self->_setupHandlers;
      self->_setupHandlers = v12;
    }
    id v14 = [v5 copy];
    __int16 v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100713EA0(v14, self, v15);
    }

    id v16 = self->_setupHandlers;
    id v17 = objc_retainBlock(v14);
    [(NSMutableArray *)v16 addObject:v17];
  }
LABEL_19:
}

- (NSArray)unprefixedURIStringsFromRegistration
{
  if ([(IDSDAccount *)self accountType] == 2)
  {
    unsigned __int8 v3 = [(IDSDAccount *)self registration];
    id v4 = [v3 uris];
    id v5 = [v4 count];

    if (v5)
    {
      unsigned __int8 v6 = [(IDSDAccount *)self prefixedURIStringsFromRegistration];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = [(IDSDAccount *)self primaryRegistration];
    unsigned __int8 v6 = [v7 uris];
  }
  unsigned int v8 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_100984498);

  return (NSArray *)v8;
}

- (NSArray)prefixedURIStringsFromRegistration
{
  char v2 = [(IDSDAccount *)self primaryRegistration];
  unsigned __int8 v3 = [v2 uris];

  return (NSArray *)v3;
}

- (BOOL)hasAliasURI:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(IDSDAccount *)self primaryRegistration];
  unsigned __int8 v6 = [v5 uris];
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)hasVettedAliasURI:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(IDSDAccount *)self vettedAliases];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_registrationCert
{
  char v2 = [(IDSDAccount *)self primaryRegistration];
  unsigned __int8 v3 = [v2 registrationCert];

  return v3;
}

- (BOOL)hasEverRegistered
{
  char v2 = [(IDSDAccount *)self accountInfo];
  unsigned __int8 v3 = [v2 objectForKey:kIDSServiceDefaultsHasEverRegistered];
  BOOL v4 = (int)[v3 intValue] > 0;

  return v4;
}

- (BOOL)isUsableForSending
{
  unsigned __int8 v3 = +[IDSDAccountController sharedInstance];
  BOOL v4 = [(IDSDAccount *)self uniqueID];
  unsigned int v5 = [v3 isEnabledAccount:v4];

  if (!v5) {
    return 0;
  }
  if ([(IDSDAccount *)self accountType] == 2) {
    return 1;
  }
  unsigned int v7 = [(IDSDAccount *)self accountType];
  if (v7 == 1)
  {
    if ([(IDSDAccount *)self isRegistered])
    {
      unsigned int v9 = [(IDSDAccount *)self aliases];
      if ([v9 count])
      {
        if ([v9 count] == (id)1)
        {
          uint64_t v10 = [v9 lastObject];
          unsigned __int8 v11 = [v10 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

          char v6 = v11 ^ 1;
        }
        else
        {
          char v6 = 1;
        }
      }
      else
      {
        char v6 = 0;
      }

      return v6;
    }
    return 0;
  }
  if (v7) {
    return 0;
  }

  return [(IDSDAccount *)self isRegistered];
}

+ (void)dependentRegistration:(id)a3 findDeviceUniqueID:(id *)a4 btID:(id *)a5 forURI:(id)a6 token:(id)a7 supportsLiveDelivery:(BOOL *)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    uint64_t v53 = [v13 lowercaseString];

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v71;
      uint64_t v19 = IDSDevicePropertyPushToken;
      uint64_t v20 = IDSDevicePropertyIdentities;
      uint64_t v62 = IDSDevicePropertyIdentitiesURI;
      uint64_t v61 = IDSDevicePropertyDefaultPairedDevice;
      uint64_t v57 = IDSDevicePropertyPrivateDeviceData;
      uint64_t v56 = IDSDevicePropertyClientData;
      uint64_t v55 = IDSPrivateDeviceDataUniqueID;
      uint64_t v54 = IDSDevicePropertyNSUUID;
      uint64_t v52 = IDSRegistrationPropertySupportsLiveDelivery;
      id v48 = v14;
      id v49 = v12;
      v60 = a5;
      id v58 = a8;
      id v47 = v15;
      uint64_t v44 = IDSDevicePropertyPushToken;
      uint64_t v45 = *(void *)v71;
      uint64_t v43 = IDSDevicePropertyIdentities;
      do
      {
        uint64_t v21 = 0;
        id v46 = v17;
        do
        {
          if (*(void *)v71 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v51 = v21;
          v64 = *(void **)(*((void *)&v70 + 1) + 8 * v21);
          id v22 = [v64 objectForKey:v19];
          BOOL v23 = v22;
          if (v22)
          {
            v50 = v22;
            unsigned int v24 = [v22 isEqualToData:v14];
            BOOL v23 = v50;
            if (v24)
            {
              uint64_t v25 = v64;
              id v26 = [v64 objectForKey:v20];
              long long v66 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id obj = v26;
              id v27 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
              uint64_t v28 = v53;
              uint64_t v30 = v62;
              int v29 = a4;
              if (v27)
              {
                id v31 = v27;
                uint64_t v32 = *(void *)v67;
                uint64_t v59 = *(void *)v67;
                while (2)
                {
                  for (i = 0; i != v31; i = (char *)i + 1)
                  {
                    if (*(void *)v67 != v32) {
                      objc_enumerationMutation(obj);
                    }
                    v34 = [*(id *)(*((void *)&v66 + 1) + 8 * i) objectForKey:v30];
                    id v35 = [v34 lowercaseString];

                    if (v35 && [v35 isEqualToString:v28])
                    {
                      id v36 = [v25 objectForKey:v61];
                      unsigned int v37 = [v36 BOOLValue];

                      if (v37)
                      {
                        id v14 = v48;
                        if (v29) {
                          *int v29 = IDSDeviceDefaultPairedDeviceUniqueID;
                        }
                        id v12 = v49;
                        if (v60) {
                          id *v60 = IDSDeviceDefaultPairedDeviceUniqueID;
                        }

                        id v15 = v47;
                        goto LABEL_35;
                      }
                      id v38 = [v25 objectForKey:v57];
                      id v39 = [v25 _dictionaryForKey:v56];
                      __int16 v40 = [v38 _stringForKey:v55];
                      id v41 = [v25 objectForKey:v54];
                      if (v29) {
                        *int v29 = v40;
                      }
                      if (v60) {
                        id *v60 = v41;
                      }
                      if (v58)
                      {
                        __int16 v42 = [v39 _numberForKey:v52];
                        *id v58 = [v42 BOOLValue];

                        uint64_t v28 = v53;
                      }

                      uint64_t v30 = v62;
                      int v29 = a4;
                      uint64_t v32 = v59;
                      uint64_t v25 = v64;
                    }
                  }
                  id v31 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
                  if (v31) {
                    continue;
                  }
                  break;
                }
              }

              id v14 = v48;
              id v12 = v49;
              id v17 = v46;
              id v15 = v47;
              uint64_t v19 = v44;
              uint64_t v18 = v45;
              uint64_t v20 = v43;
              BOOL v23 = v50;
            }
          }

          uint64_t v21 = v51 + 1;
        }
        while ((id)(v51 + 1) != v17);
        id v17 = [v15 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v17);
    }
LABEL_35:

    id v13 = (id)v53;
  }
}

- (void)findDeviceUniqueID:(id *)a3 btID:(id *)a4 forURI:(id)a5 token:(id)a6 supportsLiveDelivery:(BOOL *)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v12 && v13)
  {
    id v15 = [(IDSDAccount *)self service];
    id v16 = -[IDSDAccount dependentRegistrationsIncludingTinker:](self, "dependentRegistrationsIncludingTinker:", [v15 wantsTinkerDevices]);

    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      unsigned int v24 = v14;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ Asked to look up device unique id for uri %@ and token %@ in our dependent registrations %@", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    [(id)objc_opt_class() dependentRegistration:v16 findDeviceUniqueID:a3 btID:a4 forURI:v12 token:v14 supportsLiveDelivery:a7];
  }
  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      unsigned int v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ Asked to look up device unique id for uri %@ and token %@ - failing", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

+ (BOOL)dependentRegistration:(id)a3 hasDependentRegistrationWithURI:(id)a4 token:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    id v36 = v9;
    unsigned __int8 v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v50 = a1;
      __int16 v51 = 2112;
      id v52 = v8;
      __int16 v53 = 2112;
      uint64_t v54 = v10;
      __int16 v55 = 2112;
      id v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ Asked to look up existence of device with uri %@ and token %@ in our dependent registrations %@", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v30 = v10;
      id v31 = v38;
      id v28 = a1;
      id v29 = v8;
      _IDSLogV();
    }
    uint64_t v12 = objc_msgSend(v8, "lowercaseString", v28, v29, v30, v31);

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v38;
    id v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v44;
      uint64_t v34 = IDSDevicePropertyPushToken;
      uint64_t v32 = IDSDevicePropertyIdentities;
      uint64_t v13 = IDSDevicePropertyIdentitiesURI;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v16 = [v15 objectForKey:v34];
          id v17 = v16;
          if (v16 && [v16 isEqualToData:v36])
          {
            uint64_t v18 = [v15 objectForKey:v32];
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v19 = v18;
            id v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v40;
              while (2)
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(void *)v40 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  __int16 v23 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) objectForKey:v13];
                  unsigned int v24 = [v23 lowercaseString];

                  if (v24 && ([v24 isEqualToString:v12] & 1) != 0)
                  {

                    BOOL v25 = 1;
                    goto LABEL_35;
                  }
                }
                id v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }
          }
        }
        id v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v37);
    }

    BOOL v25 = 0;
LABEL_35:
    id v8 = (id)v12;
    uint64_t v10 = v36;
  }
  else
  {
    id v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v50 = a1;
      __int16 v51 = 2112;
      id v52 = v8;
      __int16 v53 = 2112;
      uint64_t v54 = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ Asked to look up existince of device with uri %@ and token %@ - failing", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)hasDependentRegistrationWithURI:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSDAccount *)self service];
  id v9 = -[IDSDAccount dependentRegistrationsIncludingTinker:](self, "dependentRegistrationsIncludingTinker:", [v8 wantsTinkerDevices]);

  if ([(id)objc_opt_class() dependentRegistration:v9 hasDependentRegistrationWithURI:v6 token:v7])
  {
    unsigned __int8 v10 = 1;
  }
  else if ([(IDSDAccount *)self accountType])
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    unsigned __int8 v11 = +[IDSDAccountController sharedInstance];
    uint64_t v12 = [(IDSDAccount *)self service];
    uint64_t v13 = [v11 appleIDAccountOnService:v12];
    unsigned __int8 v10 = [v13 hasDependentRegistrationWithURI:v6 token:v7];
  }
  return v10;
}

- (id)fromIDForCBUUID:(id)a3 deviceID:(id)a4
{
  id v6 = (IDSDAccount *)a3;
  id v7 = a4;
  unsigned int v8 = [(IDSServiceProperties *)self->_service shouldAllowLiveMessageDelivery];
  id v47 = v7;
  if (v7) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  uint64_t v57 = v6;
  if (v6 || v9)
  {
    unsigned int v52 = v9;
    unsigned __int8 v11 = [(IDSDAccount *)self service];
    uint64_t v12 = -[IDSDAccount dependentRegistrationsIncludingTinker:](self, "dependentRegistrationsIncludingTinker:", [v11 wantsTinkerDevices]);

    uint64_t v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v64 = self;
      __int16 v65 = 2112;
      long long v66 = v6;
      __int16 v67 = 2112;
      id v68 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Asked to look up fromID for CBUUID %@ in %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      long long v45 = v6;
      long long v46 = v12;
      long long v44 = self;
      _IDSLogV();
    }
    if (v6)
    {
      id v14 = +[IDSUTunDeliveryController sharedInstance];
      id v56 = [v14 lockedContinuityPeerID:v6];

      id v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v64 = v56;
        __int16 v65 = 2112;
        long long v66 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found locked peer %@ for cbUUID %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        long long v44 = v56;
        long long v45 = v6;
        _IDSLogV();
      }
      if (!v56)
      {
        id v16 = +[IDSUTunDeliveryController sharedInstance];
        id v17 = [v16 sessionIDforPeer:v57];

        if (v17)
        {
          uint64_t v18 = +[IDSUTunDeliveryController sharedInstance];
          id v56 = [v18 lockedContinuityPeerID:v17];

          id v19 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v64 = v56;
            __int16 v65 = 2112;
            long long v66 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found locked peer %@ for sessionID %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v44 = v56;
            long long v45 = v17;
            _IDSLogV();
          }
        }
        else
        {
          id v20 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v64 = 0;
            __int16 v65 = 2112;
            long long v66 = v57;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Couldn't find locked peer %@ for cbUUID %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v44 = 0;
            long long v45 = v57;
            _IDSLogV();
          }
          id v56 = 0;
        }
      }
    }
    else
    {
      id v56 = 0;
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v12;
    id v21 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v21)
    {
      uint64_t v54 = 0;
      __int16 v55 = 0;
      __int16 v53 = 0;
      uint64_t v50 = IDSDevicePropertyPrivateDeviceData;
      uint64_t v51 = *(void *)v59;
      uint64_t v49 = IDSPrivateDeviceDataUniqueID;
      uint64_t v22 = IDSDevicePropertyNSUUID;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(obj);
          }
          unsigned int v24 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          BOOL v25 = objc_msgSend(v24, "objectForKey:", v50, v44, v45, v46);
          id v26 = [v25 _stringForKey:v49];
          id v27 = +[IDSDAccountController sharedInstance];
          id v28 = [v27 propertiesForDeviceWithUniqueID:v26];
          id v29 = [v28 objectForKey:v22];

          if (v57) {
            unsigned int v30 = [(IDSDAccount *)v29 isEqualToString:v57];
          }
          else {
            unsigned int v30 = 0;
          }
          if (v52) {
            unsigned int v31 = [(IDSDAccount *)v26 isEqualToString:v47];
          }
          else {
            unsigned int v31 = 0;
          }
          if (v56) {
            unsigned int v32 = -[IDSDAccount isEqualToString:](v26, "isEqualToString:");
          }
          else {
            unsigned int v32 = 0;
          }
          if ((v30 | v31) == 1)
          {
            if ((v32 | v31))
            {
              unsigned __int8 v10 = [(IDSDAccount *)self _fromIDFromDevice:v24 withCBUUID:v29 uniqueID:v26];

              goto LABEL_76;
            }
            int v33 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v64 = v29;
              __int16 v65 = 2112;
              long long v66 = v26;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "CBUUID matched, but uniqueID mismatched. Setting fallback device. { cbuuid: %@, uniqueID: %@ }", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v44 = v29;
              long long v45 = v26;
              _IDSLogV();
            }
            id v34 = v24;

            uint64_t v35 = v29;
            id v36 = v26;

            uint64_t v54 = v35;
            __int16 v55 = v34;
            __int16 v53 = v36;
          }
        }
        id v21 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v54 = 0;
      __int16 v55 = 0;
      __int16 v53 = 0;
    }

    unsigned int v37 = [(IDSServiceProperties *)self->_service shouldAllowLiveMessageDelivery];
    if (v55) {
      unsigned int v38 = v37;
    }
    else {
      unsigned int v38 = 0;
    }
    if (v38 == 1)
    {
      long long v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        long long v40 = [(IDSServiceProperties *)self->_service serviceName];
        *(_DWORD *)buf = 138412802;
        v64 = v57;
        __int16 v65 = 2112;
        long long v66 = v56;
        __int16 v67 = 2112;
        id v68 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Did not find any device in dependentRegistrations that matches lockedPeerID. Service supports live delivery, so falling back to device that matches just cbuuid { cbuuid: %@, lockedPeerID: %@, service: %@ }", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [(IDSServiceProperties *)self->_service serviceName];
        long long v46 = v45 = v56;
        long long v44 = v57;
        _IDSLogV();
      }
      unsigned __int8 v10 = -[IDSDAccount _fromIDFromDevice:withCBUUID:uniqueID:](self, "_fromIDFromDevice:withCBUUID:uniqueID:", v55, v54, v53, v44, v45, v46);
    }
    else
    {
      long long v41 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = [obj count];
        *(_DWORD *)buf = 138412802;
        v64 = v57;
        __int16 v65 = 2112;
        long long v66 = v56;
        __int16 v67 = 2048;
        id v68 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Did not find any device in dependentRegistrations that matches {cbuuid: %@, lockedPeerID: %@, count: %ld}", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [obj count];
        _IDSLogV();
      }
      unsigned __int8 v10 = 0;
    }
LABEL_76:
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)_fromIDFromDevice:(id)a3 withCBUUID:(id)a4 uniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IDSServiceProperties *)self->_service adHocServiceType] == 2)
  {
    unsigned __int8 v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 _stringForKey:IDSDevicePropertyIdentifierOverride];
      *(_DWORD *)buf = 138412802;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      unsigned int v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning device fromID for cbuuid {deviceCBUUID: %@, uniqueID: %@, uniqueIDOverride: %@}", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      int v13 = _IDSShouldLog();
      uint64_t v14 = IDSDevicePropertyIdentifierOverride;
      if (v13)
      {
        [v8 _stringForKey:IDSDevicePropertyIdentifierOverride];
        v26 = id v25 = v10;
        id v24 = v9;
        _IDSLogV();
      }
    }
    else
    {
      uint64_t v14 = IDSDevicePropertyIdentifierOverride;
    }
    id v15 = objc_msgSend(v8, "_stringForKey:", v14, v24, v25, v26);
    uint64_t v22 = (void *)_IDSCopyIDForDeviceUniqueID();
  }
  else
  {
    id v15 = [v8 _dataForKey:IDSDevicePropertyPushToken];
    id v16 = [(IDSDAccount *)self service];
    id v17 = [v16 identifier];
    _IDSPrefersPhoneNumbersForServiceIdentifier();

    uint64_t v18 = [(IDSDAccount *)self unprefixedURIStringsFromRegistration];
    id v19 = (void *)_IDSCopyCallerIDWithSelfMessagingHint();
    id v20 = [v19 _bestGuessURIFromCanicalizedID];

    id v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      unsigned int v32 = v15;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Returning token uri fromID for cbuuid {deviceCBUUID: %@, uniqueID: %@, deviceToken: %@, deviceFromID: %@}", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v22 = (void *)_IDSCopyIDForTokenWithURI();
  }

  return v22;
}

- (id)defaultPairedDependentRegistrationIncludingTinker:(BOOL)a3
{
  BOOL v4 = [(IDSDAccount *)self _dependentRegistrationsForDefaultPairedDevice:1 includingTinker:a3];
  unsigned int v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = self;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ Asked to look up default paired device dependent registration in %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v17 = self;
    uint64_t v18 = v4;
    _IDSLogV();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = IDSDevicePropertyDefaultPairedDevice;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "objectForKey:", v9, v17, v18, (void)v19);
        unsigned int v13 = [v12 BOOLValue];

        if (v13)
        {
          id v15 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v25 = self;
            __int16 v26 = 2112;
            id v27 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ found default paired device dependent registration %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          id v14 = v11;
          goto LABEL_21;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_21:

  return v14;
}

- (NSDictionary)defaultPairedDependentRegistration
{
  return (NSDictionary *)[(IDSDAccount *)self defaultPairedDependentRegistrationIncludingTinker:0];
}

- (IDSDAccount)superAccount
{
  unsigned __int8 v3 = [(IDSDAccount *)self service];
  BOOL v4 = [v3 superService];

  if (![v4 length])
  {
    id v10 = 0;
    goto LABEL_15;
  }
  unsigned int v5 = +[IDSDServiceController sharedInstance];
  id v6 = [v5 serviceWithPushTopic:v4];

  unsigned int v7 = [(IDSDAccount *)self accountType];
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v8 = +[IDSDAccountController sharedInstance];
      uint64_t v9 = [v8 appleIDAccountOnService:v6];
    }
    else
    {
      if (v7 != 2)
      {
        id v10 = 0;
        goto LABEL_14;
      }
      uint64_t v8 = +[IDSDAccountController sharedInstance];
      uint64_t v9 = [v8 localAccountOnService:v6];
    }
    goto LABEL_11;
  }
  unsigned __int8 v11 = +[IDSDAccountController sharedInstance];
  uint64_t v8 = [v11 accountsOnService:v6 withType:0];

  if (![v8 count])
  {
    id v10 = 0;
    goto LABEL_12;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001825F8;
  v14[3] = &unk_100983F58;
  v14[4] = self;
  uint64_t v12 = objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v14);
  id v10 = [v12 firstObject];

  if (!v10)
  {
    uint64_t v9 = [v8 firstObject];
LABEL_11:
    id v10 = (void *)v9;
  }
LABEL_12:

LABEL_14:
LABEL_15:

  return (IDSDAccount *)v10;
}

- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingTinker:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v8 = [(IDSDAccount *)self _dependentRegistrationsForDefaultPairedDevice:v5 includingCurrentDevice:0 includingTinker:v4];

  return v8;
}

- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingCurrentDevice:(BOOL)a4 includingTinker:(BOOL)a5
{
  BOOL v136 = a3;
  v155 = self;
  uint64_t v8 = [(IDSDAccount *)self primaryRegistration];
  uint64_t v9 = [v8 dependentRegistrations];

  id v153 = objc_alloc_init((Class)NSMutableArray);
  id v10 = +[IDSPairingManager sharedInstance];
  uint64_t v11 = [v10 pairedDeviceUniqueID];

  uint64_t v12 = +[IDSPairingManager sharedInstance];
  unsigned int v13 = v12;
  BOOL v118 = a5;
  if (a5) {
    [v12 allPairedUniqueIDs];
  }
  else {
  id v14 = [v12 allTraditionallyPairedUniqueIDs];
  }

  v135 = v14;
  id v138 = [objc_alloc((Class)NSMutableSet) initWithSet:v14];
  id v15 = +[IDSPairingManager sharedInstance];
  v134 = [v15 uniqueIDToCbuuidsOfPairingDevicesDictionary];

  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id obj = v9;
  id v16 = [obj countByEnumeratingWithState:&v165 objects:v175 count:16];
  v133 = (void *)v11;
  if (!v16)
  {
    char v125 = 0;
    goto LABEL_73;
  }
  id v17 = v16;
  char v125 = 0;
  uint64_t v18 = *(void *)v166;
  key = (void *)IDSDevicePropertyService;
  uint64_t v145 = IDSDevicePropertyPushToken;
  uint64_t v137 = IDSDevicePropertySubServices;
  v144 = (const void *)IDSDevicePropertyPrivateDeviceData;
  uint64_t v140 = IDSPrivateDeviceDataUniqueID;
  v131 = (void *)IDSDevicePropertyDefaultPairedDevice;
  v130 = (void *)IDSDevicePropertyIsActivePairedDevice;
  v128 = (void *)IDSDevicePropertyDefaultLocalDevice;
  v129 = (void *)IDSDevicePropertyIdentifierOverride;
  v127 = (void *)IDSDevicePropertyStableBluetoothIdentifier;
  v123 = (void *)IDSDevicePropertyPairingProtocolVersion;
  v121 = (void *)IDSDevicePropertyMaxCompatibilityVersion;
  v122 = (void *)IDSDevicePropertyMinCompatibilityVersion;
  v120 = (void *)IDSDeviceServicePropertyMinCompatibilityVersion;
  v124 = (void *)IDSDevicePropertyNSUUID;
  v126 = (void *)IDSDevicePropertyLocallyPresent;
  BOOL v132 = a4;
  uint64_t v142 = *(void *)v166;
  while (2)
  {
    long long v19 = 0;
    id v143 = v17;
    do
    {
      if (*(void *)v166 != v18) {
        objc_enumerationMutation(obj);
      }
      long long v20 = *(void **)(*((void *)&v165 + 1) + 8 * (void)v19);
      long long v21 = objc_msgSend(v20, "objectForKey:", key, context);
      long long v22 = [(IDSDAccount *)v155 primaryServiceName];
      unsigned int v23 = [v22 isEqualToIgnoringCase:v21];

      if (v23)
      {
        id v151 = [v20 objectForKey:v145];
        if (!a4)
        {
          id v24 = [(IDSDAccount *)v155 primaryRegistration];
          id v25 = [v24 pushToken];
          unsigned __int8 v26 = [v151 isEqualToData:v25];

          if (v26) {
            goto LABEL_67;
          }
        }
        id v27 = [(IDSDAccount *)v155 service];
        id v28 = [v27 identifier];

        __int16 v29 = [(IDSDAccount *)v155 service];
        unsigned int v30 = [v29 adHocServiceType];

        if (v30)
        {
          if (v30 != 5)
          {
            __int16 v31 = [v20 objectForKey:v137];
            unsigned int v32 = [v31 containsObject:v28];

            if (!v32)
            {
LABEL_66:
              id v17 = v143;

              uint64_t v18 = v142;
LABEL_67:

              goto LABEL_68;
            }
          }
        }
        v148 = [v20 objectForKey:v144];
        __int16 v33 = [v148 _stringForKey:v140];
        if (v33) {
          [v138 removeObject:v33];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
          id v34 = [v33 isEqualToIgnoringCase:v11];
        }
        else {
          id v34 = 0;
        }
        if ((!v136 | v34) != 1)
        {
LABEL_65:

          goto LABEL_66;
        }
        uint64_t v35 = (__CFDictionary *)[v20 mutableCopy];
        id v36 = v28;
        value = v36;
        if (v36)
        {
          CFDictionarySetValue(v35, key, v36);
          id v36 = value;
        }
        v139 = v28;

        if (v30 && v30 != 5) {
          [(__CFDictionary *)v35 removeObjectForKey:v137];
        }
        unsigned int v37 = +[NSNumber numberWithBool:v34];
        if (v37) {
          CFDictionarySetValue(v35, v131, v37);
        }

        unsigned int v38 = +[NSNumber numberWithBool:v34];
        if (v38) {
          CFDictionarySetValue(v35, v130, v38);
        }

        id v39 = v33;
        if (v33) {
          CFDictionarySetValue(v35, v129, v39);
        }

        long long v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v135 containsObject:v39]);
        if (v40) {
          CFDictionarySetValue(v35, v128, v40);
        }

        long long v41 = [v134 objectForKey:v39];
        id v42 = v41;
        if (v41)
        {
          id v43 = v41;
          CFDictionarySetValue(v35, v127, v43);
        }
        if (!v34)
        {
LABEL_61:
          v63 = +[NSNumber numberWithBool:v34];
          if (v63) {
            CFDictionarySetValue(v35, v126, v63);
          }

          v64 = +[IDSDAccountController sharedInstance];
          __int16 v65 = [v64 propertiesForDeviceWithUniqueID:v39];
          [(__CFDictionary *)v35 addEntriesFromDictionary:v65];

          [v153 addObject:v35];
          if (v136 & v34)
          {

            goto LABEL_73;
          }
          a4 = v132;
          uint64_t v11 = (uint64_t)v133;
          id v28 = v139;
          goto LABEL_65;
        }
        long long v44 = +[IDSPairingManager sharedInstance];
        id v45 = [v44 pairedDevicePairingProtocolVersion];

        if (v45)
        {
          long long v46 = +[NSNumber numberWithUnsignedInt:v45];
          if (v46) {
            CFDictionarySetValue(v35, v123, v46);
          }
        }
        id v47 = +[IDSPairingManager sharedInstance];
        id v48 = [v47 pairedDeviceMinCompatibilityVersion];

        if (v48)
        {
          uint64_t v49 = +[NSNumber numberWithUnsignedInt:v48];
          if (v49) {
            CFDictionarySetValue(v35, v122, v49);
          }
        }
        uint64_t v50 = +[IDSPairingManager sharedInstance];
        id v51 = [v50 pairedDeviceMaxCompatibilityVersion];

        if (v51)
        {
          unsigned int v52 = +[NSNumber numberWithUnsignedInt:v51];
          if (v52) {
            CFDictionarySetValue(v35, v121, v52);
          }
        }
        __int16 v53 = +[IDSPairingManager sharedInstance];
        id v54 = [v53 pairedDeviceServiceMinCompatibilityVersion];

        if (v54)
        {
          __int16 v55 = +[NSNumber numberWithUnsignedInt:v54];
          if (v55) {
            CFDictionarySetValue(v35, v120, v55);
          }
        }
        id v56 = +[IDSPairingManager sharedInstance];
        uint64_t v57 = [v56 pairedDeviceUUIDString];

        if (v57) {
          CFDictionarySetValue(v35, v124, v57);
        }

        long long v58 = [(__CFDictionary *)v35 objectForKey:v144];
        id v59 = [v58 mutableCopy];

        if (v59)
        {
          long long v60 = (__CFDictionary *)v59;
        }
        else
        {
          long long v60 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!v60)
          {
LABEL_60:
            long long v61 = +[IDSPairingManager sharedInstance];
            uint64_t v62 = [v61 pairedDevicePrivateData];
            [(__CFDictionary *)v60 addEntriesFromDictionary:v62];

            char v125 = 1;
            goto LABEL_61;
          }
        }
        CFDictionarySetValue(v35, v144, v60);

        goto LABEL_60;
      }
LABEL_68:

      long long v19 = (char *)v19 + 1;
    }
    while (v17 != v19);
    id v17 = [obj countByEnumeratingWithState:&v165 objects:v175 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_73:

  if (v118)
  {
    unsigned int v66 = 1;
  }
  else
  {
    __int16 v67 = +[IDSPairingManager sharedInstance];
    unsigned int v66 = [v67 activePairedDeviceHasPairingType:0];
  }
  if ((v125 & 1) == 0)
  {
    id v68 = +[IDSPairingManager sharedInstance];
    unsigned int v69 = [v68 isPaired] & v66;

    if (v69 == 1)
    {
      id v70 = objc_alloc((Class)NSMutableDictionary);
      long long v71 = +[IDSPairingManager sharedInstance];
      long long v72 = [v71 pairedDevice];
      long long v73 = (__CFDictionary *)[v70 initWithDictionary:v72];

      BOOL v74 = [(IDSDAccount *)v155 service];
      v75 = [v74 identifier];

      if (v75) {
        CFDictionarySetValue(v73, IDSDevicePropertyService, v75);
      }

      if (v73)
      {
        v76 = +[IDSPairingManager sharedInstance];
        v77 = [v76 pairedDeviceUniqueID];

        [v153 addObject:v73];
        [v138 removeObject:v77];
      }
    }
  }
  if (!v136)
  {
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v78 = v138;
    id v79 = [v78 countByEnumeratingWithState:&v161 objects:v174 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v162;
      long long v82 = (const void *)IDSDevicePropertyService;
      do
      {
        for (i = 0; i != v80; i = (char *)i + 1)
        {
          if (*(void *)v162 != v81) {
            objc_enumerationMutation(v78);
          }
          uint64_t v84 = *(void *)(*((void *)&v161 + 1) + 8 * i);
          id v85 = objc_alloc((Class)NSMutableDictionary);
          long long v86 = +[IDSPairingManager sharedInstance];
          long long v87 = [v86 pairedDeviceForUniqueID:v84];
          v88 = [v87 dictionaryRepresentation];
          id v89 = (__CFDictionary *)[v85 initWithDictionary:v88];

          v90 = [(IDSDAccount *)v155 service];
          id v91 = [v90 identifier];

          if (v91) {
            CFDictionarySetValue(v89, v82, v91);
          }

          if (v89) {
            [v153 addObject:v89];
          }
        }
        id v80 = [v78 countByEnumeratingWithState:&v161 objects:v174 count:16];
      }
      while (v80);
    }
  }
  id v92 = objc_alloc_init((Class)NSMutableDictionary);
  id v149 = objc_alloc_init((Class)NSMutableArray);
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v152 = v153;
  id v93 = [v152 countByEnumeratingWithState:&v157 objects:v173 count:16];
  if (v93)
  {
    id v94 = v93;
    BOOL v95 = 0;
    v96 = 0;
    uint64_t v156 = *(void *)v158;
    uint64_t v97 = IDSDevicePropertyIdentifierOverride;
    uint64_t v98 = IDSDevicePropertyPrivateDeviceData;
    id obja = (id)IDSPrivateDeviceDataUniqueID;
    v154 = v92;
    uint64_t v99 = IDSPrivateDeviceDataRegistrationDate;
    do
    {
      for (j = 0; j != v94; j = (char *)j + 1)
      {
        if (*(void *)v158 != v156) {
          objc_enumerationMutation(v152);
        }
        v101 = *(void **)(*((void *)&v157 + 1) + 8 * (void)j);
        uint64_t v102 = objc_msgSend(v101, "objectForKey:", v97, context);

        if ([v102 length])
        {
          BOOL v95 = v102;
        }
        else
        {
          char v103 = [v101 objectForKey:v98];
          BOOL v95 = [v103 _stringForKey:obja];

          id v92 = v154;
        }
        if ([v95 length])
        {
          uint64_t v104 = [v92 objectForKey:v95];

          if (v104)
          {
            v105 = [v104 objectForKey:v98];
            uint64_t v106 = [v105 objectForKey:v99];
            [v106 doubleValue];
            double v108 = v107;

            v109 = [v101 objectForKey:v98];
            v110 = [v109 objectForKey:v99];
            [v110 doubleValue];
            double v112 = v111;

            if (v108 >= v112)
            {
              __int16 v113 = +[IMRGLog registration];
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v170 = v101;
                _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "Duplicated device %@, ignoring...", buf, 0xCu);
              }
            }
            else
            {
              [v154 setObject:v101 forKey:v95];
              __int16 v113 = +[IMRGLog registration];
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v170 = v104;
                __int16 v171 = 2112;
                v172 = v101;
                _os_log_debug_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEBUG, "Found duplicate device %@, replaced with newer device %@", buf, 0x16u);
              }
            }

            v96 = v104;
            id v92 = v154;
          }
          else
          {
            [v92 setObject:v101 forKey:v95];
            v96 = 0;
          }
        }
        else
        {
          [v149 addObject:v101];
        }
      }
      id v94 = [v152 countByEnumeratingWithState:&v157 objects:v173 count:16];
    }
    while (v94);
  }
  else
  {
    BOOL v95 = 0;
    v96 = 0;
  }

  unsigned int v114 = [v92 allValues];
  [v149 addObjectsFromArray:v114];

  id v115 = v149;

  return v115;
}

- (NSArray)dependentRegistrations
{
  return (NSArray *)[(IDSDAccount *)self _dependentRegistrationsForDefaultPairedDevice:0 includingTinker:0];
}

- (id)dependentRegistrationsIncludingTinker:(BOOL)a3
{
  return [(IDSDAccount *)self _dependentRegistrationsForDefaultPairedDevice:0 includingTinker:a3];
}

- (NSArray)dependentRegistrationsIncludingCurrentDevice
{
  return (NSArray *)[(IDSDAccount *)self _dependentRegistrationsForDefaultPairedDevice:0 includingCurrentDevice:1 includingTinker:0];
}

- (NSArray)registeredDevices
{
  char v2 = [(IDSDAccount *)self dependentRegistrations];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[IDSRegisteredDevice registeredDeviceFromDependentRegistrationDictionary:](IDSRegisteredDevice, "registeredDeviceFromDependentRegistrationDictionary:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)dependentRegistrationMatchingUUID:(id)a3 includingTinker:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(IDSDAccount *)self dependentRegistrationsIncludingTinker:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = IDSDevicePropertyIdentifierOverride;
    uint64_t v20 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v19 = IDSPrivateDeviceDataUniqueID;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "_stringForKey:", v11, v19);
        if (![v14 length])
        {
          id v15 = [v13 objectForKey:v20];
          uint64_t v16 = [v15 _stringForKey:v19];

          long long v14 = (void *)v16;
        }
        if ([v14 isEqualToIgnoringCase:v6])
        {
          id v17 = v13;

          goto LABEL_13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

- (id)dependentRegistrationMatchingUUID:(id)a3
{
  return [(IDSDAccount *)self dependentRegistrationMatchingUUID:a3 includingTinker:0];
}

- (NSDate)lastGDRDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsLastGDRDateKey];
}

- (NSDate)lastRegistrationSuccessDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsLastRegistrationSuccessDateKey];
}

- (NSDate)lastRegistrationFailureDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsLastRegistrationFailureDateKey];
}

- (int64_t)lastRegistrationFailureError
{
  char v2 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsLastRegistrationFailureErrorKey];
  id v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (id)primaryAccount
{
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v3 = +[IDSDAccountController sharedInstance];
    int64_t v4 = [(IDSDAccount *)self primaryAccountUniqueID];
    id v5 = [v3 accountWithUniqueID:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)primaryAccountUniqueID
{
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v3 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsPrimaryAccountKey];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (IDSRegistration)primaryRegistration
{
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v3 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsPrimaryAccountKey];
    int64_t v4 = +[IDSDAccountController sharedInstance];
    id v5 = [v4 accountWithUniqueID:v3];

    id v6 = [v5 registration];
  }
  else
  {
    id v6 = [(IDSDAccount *)self registration];
  }

  return (IDSRegistration *)v6;
}

- (id)primaryServiceName
{
  id v3 = [(NSMutableDictionary *)self->_accountInfo objectForKey:kIDSServiceDefaultsPrimaryServiceNameKey];
  if (![v3 length])
  {
    int64_t v4 = [(IDSDAccount *)self service];
    uint64_t v5 = [v4 identifier];

    id v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)isAdHocAccount
{
  char v2 = [(IDSDAccount *)self accountInfo];
  id v3 = [v2 objectForKey:kIDSServiceDefaultsPrimaryServiceNameKey];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_broadcastAccountMessageBlock:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(IDSDAccount *)self accountAndAdHocAccounts];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyListenersWithChanges:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)IMMessageContext);
    [v5 setShouldBoost:0];
    id v6 = [v4 objectForKey:kIDSServiceDefaultsRegistrationInfoKey];
    if (v6)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100184198;
      v32[3] = &unk_1009844C0;
      id v33 = v5;
      id v34 = v6;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v32];
    }
    id v7 = [v4 objectForKey:kIDSServiceDefaultsAliasesKey];
    if (v7)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1001842D0;
      v29[3] = &unk_1009844C0;
      id v30 = v5;
      id v31 = v7;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v29];
    }
    uint64_t v8 = [v4 objectForKey:kIDSServiceDefaultsVettedAliasesKey];
    if (v8)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      void v26[2] = sub_100184408;
      v26[3] = &unk_1009844C0;
      id v27 = v5;
      id v28 = v8;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v26];
    }
    id v9 = [v4 objectForKey:kIDSServiceDefaultsProfileKey];
    if (v9)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100184540;
      v23[3] = &unk_1009844C0;
      id v24 = v5;
      id v25 = v9;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v23];
    }
    long long v10 = objc_msgSend(v4, "objectForKey:", kIDSServiceDefaultsLoginAsKey, v7);
    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100184678;
      v20[3] = &unk_1009844C0;
      id v21 = v5;
      id v22 = v10;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v20];
    }
    long long v11 = [v4 objectForKey:kIDSServiceDefaultsDisplayNameKey];
    if (v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1001847B0;
      v17[3] = &unk_1009844C0;
      id v18 = v5;
      id v19 = v11;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v17];
    }
    long long v12 = [v4 objectForKey:kIDSServiceDefaultsPseudonymsKey];
    if (v12)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001848E8;
      v14[3] = &unk_1009844C0;
      id v15 = v5;
      id v16 = v12;
      [(IDSDAccount *)self _broadcastAccountMessageBlock:v14];
    }
  }
}

- (void)_broadcastAccountInfoChanged
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100713F60((uint64_t)self, v3);
  }

  [(CUTDeferredTaskQueue *)self->_broadcastAccountInfoChangedTask cancelPendingExecutions];
  id v4 = objc_alloc_init((Class)IMMessageContext);
  [v4 setShouldBoost:0];
  id v5 = +[IDSDaemon sharedInstance];
  id v6 = [(IDSDAccount *)self service];
  id v7 = [v6 pushTopic];
  uint64_t v8 = [v5 broadcasterForTopic:v7 ignoreServiceListener:1 messageContext:v4];

  id v9 = [(IDSDAccount *)self uniqueID];
  long long v10 = [(IDSDAccount *)self accountSetupInfo];
  [v8 account:v9 accountInfoChanged:v10];

  *((unsigned char *)self + 81) &= ~4u;
}

- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4
{
}

- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4 interestedSubservices:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((*((unsigned char *)self + 80) & 2) != 0 && !v6 || (*((unsigned char *)self + 81) & 8) != 0)
  {
    id v19 = +[IMRGLog accountUpdate];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = (*((unsigned __int8 *)self + 80) >> 1) & 1;
      int v21 = (*((unsigned __int8 *)self + 81) >> 3) & 1;
      *(_DWORD *)buf = 136315650;
      __int16 v55 = (IDSDAccount *)"-[IDSDAccount _writeAccountDefaults:force:interestedSubservices:]";
      __int16 v56 = 1024;
      *(_DWORD *)uint64_t v57 = v20;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s returning because duringInit %d isBeingRemoved %d", buf, 0x18u);
    }
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v11 = [v8 allKeys];
    id v12 = [v11 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v12)
    {
      id v13 = v12;
      BOOL v39 = v6;
      long long v40 = v9;
      uint64_t v14 = *(void *)v50;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v17 = [v8 objectForKey:v16];
          id v18 = [(NSMutableDictionary *)self->_accountInfo objectForKey:v16];
          if (([v17 isNull] & 1) != 0
            || !v18
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
LABEL_37:

            if ([(IDSDAccount *)self accountType] != 2)
            {
              id v22 = +[IMRGLog registration];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                __int16 v55 = self;
                __int16 v56 = 2112;
                *(void *)uint64_t v57 = v8;
                *(_WORD *)&v57[8] = 2112;
                CFStringRef v58 = @"YES";
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ - write account defaults: %@  (has changes: %@)", buf, 0x20u);
              }
            }
            [(IDSDAccount *)self _notifyListenersWithChanges:v8];
            id v23 = [v8 mutableCopy];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v24 = [v8 allKeys];
            id v25 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v46;
              do
              {
                for (j = 0; j != v26; j = (char *)j + 1)
                {
                  if (*(void *)v46 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
                  id v30 = [v8 objectForKey:v29];
                  if (([v30 isNull] & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v30 length])
                  {
                    [v23 removeObjectForKey:v29];
                    [(NSMutableDictionary *)self->_accountInfo removeObjectForKey:v29];
                  }
                }
                id v26 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
              }
              while (v26);
            }

            id v9 = v40;
            if ([(IDSDAccount *)self isAdHocAccount])
            {
              id v31 = [(IDSDAccount *)self service];
              unsigned int v32 = [v31 identifier];

              id v33 = [(IDSDAccount *)self primaryServiceName];
              id v34 = [(IDSDAccount *)self service];
              uint64_t v35 = [v34 pushTopic];

              id v36 = [(IDSDAccount *)self primaryAccount];
              unsigned int v37 = [v36 uniqueID];

              if (v32) {
                [v23 setObject:v32 forKey:kIDSServiceDefaultsServiceNameKey];
              }
              if (v33) {
                [v23 setObject:v33 forKey:kIDSServiceDefaultsPrimaryServiceNameKey];
              }
              if (v35) {
                [v23 setObject:v35 forKey:kIDSServiceDefaultsPushTopicKey];
              }
              if (v37) {
                [v23 setObject:v37 forKey:kIDSServiceDefaultsPrimaryAccountKey];
              }
            }
            [(NSMutableDictionary *)self->_accountInfo addEntriesFromDictionary:v23];
            if ((*((unsigned char *)self + 81) & 4) == 0)
            {
              *((unsigned char *)self + 81) |= 4u;
              [(CUTDeferredTaskQueue *)self->_broadcastAccountInfoChangedTask cancelPendingExecutions];
              [(CUTDeferredTaskQueue *)self->_broadcastAccountInfoChangedTask enqueueExecutionWithTarget:self afterDelay:2.0];
            }
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_10018522C;
            v41[3] = &unk_1009826B8;
            id v42 = v40;
            id v43 = v8;
            BOOL v44 = v39;
            [(IDSDAccount *)self forEachAdhocAccount:v41];

            long long v11 = +[IDSDAccountController sharedInstance];
            [v11 delayedSaveSettings];
            goto LABEL_65;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (([v17 isEqualToArray:v18] & 1) == 0) {
              goto LABEL_37;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (([v17 isEqualToDictionary:v18] & 1) == 0) {
                goto LABEL_37;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (([v17 isEqualToSet:v18] & 1) == 0) {
                  goto LABEL_37;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (([v17 isEqualToValue:v18] & 1) == 0) {
                    goto LABEL_37;
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if (([v17 isEqualToAttributedString:v18] & 1) == 0) {
                      goto LABEL_37;
                    }
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (([v17 isEqualToString:v18] & 1) == 0) {
                        goto LABEL_37;
                      }
                    }
                    else if (![v17 isEqual:v18])
                    {
                      goto LABEL_37;
                    }
                  }
                }
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      id v9 = v40;
    }
LABEL_65:
  }
}

- (void)writeAccountDefaults:(id)a3
{
}

- (void)_updateAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v39 = self;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ - update account with defaults: %@", buf, 0x16u);
  }

  BOOL v6 = self;
  if ([(IDSDAccount *)v6 accountType] != 2 && [(IDSDAccount *)v6 isAdHocAccount])
  {
    uint64_t v7 = [(IDSDAccount *)v6 primaryAccount];

    BOOL v6 = (IDSDAccount *)v7;
  }
  id v8 = [v4 objectForKey:kIDSServiceDefaultsAliasesKey];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = objc_alloc((Class)NSSet);
      long long v10 = [(IDSDAccount *)v6 registration];
      long long v11 = [v10 candidateEmails];
      id v12 = (IDSDAccount *)[v9 initWithArray:v11];

      id v13 = (IDSDAccount *)objc_alloc_init((Class)NSMutableSet);
      id v30 = v12;
      uint64_t v29 = (IDSDAccount *)[objc_alloc((Class)NSMutableSet) initWithSet:v12];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v8;
      id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v34;
        uint64_t v18 = kIDSServiceDefaultsAliasKey;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            int v20 = [*(id *)(*((void *)&v33 + 1) + 8 * i) objectForKey:v18];
            [(IDSDAccount *)v13 addObject:v20];
          }
          id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v16);
      }

      [(IDSDAccount *)v29 minusSet:v13];
      [(IDSDAccount *)v13 minusSet:v30];
      int v21 = +[IMRGLog accountUpdate];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Current   aliases: %@", buf, 0xCu);
      }

      id v22 = +[IMRGLog accountUpdate];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v39 = v29;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Aliases to remove: %@", buf, 0xCu);
      }

      id v23 = +[IMRGLog accountUpdate];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v39 = v13;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Aliases to    add: %@", buf, 0xCu);
      }

      id v24 = [(IDSDAccount *)v29 allObjects];
      [(IDSDAccount *)v6 _removeAliases:v24 withReason:6];

      id v25 = [(IDSDAccount *)v29 allObjects];
      [(IDSDAccount *)v6 removeAliases:v25];

      id v26 = [(IDSDAccount *)v13 allObjects];
      [(IDSDAccount *)v6 addAliases:v26];
    }
  }
  [(IDSDAccount *)v6 _writeAccountDefaults:v4 force:0];
  uint64_t v27 = [(IDSDAccount *)v6 linkedAccounts];
  if ([v27 count])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10018579C;
    v31[3] = &unk_1009822F8;
    id v32 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v4];
    id v28 = v32;
    objc_msgSend(v27, "__imForEach:", v31);
  }
}

- (id)accountAndAdHocAccounts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:self];
  id v4 = [(IDSDAccount *)self adHocAccounts];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (BOOL)forEachAdhocAccount:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = +[IDSDServiceController sharedInstance];
  BOOL v6 = [(IDSDAccount *)self service];
  uint64_t v7 = [v6 identifier];
  id v8 = [v5 adHocServicesForIdentifier:v7];

  id v9 = v8;
  id v10 = [v8 count];
  if (v10)
  {
    id v46 = v10;
    long long v47 = v8;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v62;
      p_cache = &OBJC_METACLASS___IDSIMLFanoutFactoryComponent.cache;
      id v54 = v4;
      __int16 v55 = self;
      uint64_t v48 = *(void *)v62;
      do
      {
        id v15 = 0;
        id v49 = v12;
        do
        {
          if (*(void *)v62 != v13) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v15);
          if ([(IDSDAccount *)self accountType] != 1
            && [(IDSDAccount *)self accountType])
          {
            goto LABEL_49;
          }
          if ([v16 adHocServiceType] != 2) {
            goto LABEL_49;
          }
          uint64_t v17 = [v16 pushTopic];
          unsigned int v18 = [v17 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

          if (v18)
          {
            id v19 = [p_cache + 418 sharedInstance];
            unsigned int v20 = [v19 isLocalSetupEnabled];

            if (v20)
            {
LABEL_49:
              if (![v16 disabledOnTinkerWatch]
                || (+[IDSPairingManager sharedInstance],
                    int v21 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v22 = [v21 isCurrentDeviceTinkerConfiguredWatch],
                    v21,
                    !v22))
              {
                if ([v16 enabledOnlyWhenPaired])
                {
                  id v24 = [p_cache + 418 sharedInstance];
                  unsigned int v25 = [v24 isTraditionalLocalSetupEnabled];

                  if (!v25) {
                    goto LABEL_43;
                  }
                }
                long long v52 = v15;
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                id v26 = [p_cache + 418 sharedInstance];
                uint64_t v27 = [v26 accountsOnService:v16];

                id v28 = [v27 countByEnumeratingWithState:&v57 objects:v65 count:16];
                if (!v28) {
                  goto LABEL_42;
                }
                id v29 = v28;
                uint64_t v30 = *(void *)v58;
                __int16 v56 = v27;
                while (2)
                {
                  uint64_t v31 = 0;
LABEL_22:
                  if (*(void *)v58 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  id v32 = *(void **)(*((void *)&v57 + 1) + 8 * v31);
                  unsigned int v33 = [(IDSDAccount *)self accountType];
                  if (v33 == 2)
                  {
                    if ([v32 accountType] != 2) {
                      goto LABEL_35;
                    }
                  }
                  else if (v33 == 1)
                  {
                    if ([v32 accountType] != 1) {
                      goto LABEL_35;
                    }
                    unsigned int v37 = [v32 loginID];
                    unsigned int v38 = [v37 lowercaseString];
                    BOOL v39 = [(IDSDAccount *)self loginID];
                    __int16 v40 = [v39 lowercaseString];
                    if (IMAreObjectsLogicallySame())
                    {

                      uint64_t v27 = v56;
                    }
                    else
                    {
                      id v41 = [v32 loginID];
                      if ([v41 length])
                      {

                        id v4 = v54;
                        uint64_t v27 = v56;
                        goto LABEL_35;
                      }
                      id v42 = [(IDSDAccount *)self loginID];
                      id v53 = [v42 length];

                      self = v55;
                      id v4 = v54;
                      uint64_t v27 = v56;
                      if (v53)
                      {
LABEL_35:
                        if (v29 == (id)++v31)
                        {
                          id v43 = [v27 countByEnumeratingWithState:&v57 objects:v65 count:16];
                          id v29 = v43;
                          if (!v43)
                          {
LABEL_42:

                            uint64_t v13 = v48;
                            id v12 = v49;
                            p_cache = (void **)(&OBJC_METACLASS___IDSIMLFanoutFactoryComponent + 16);
                            id v15 = v52;
                            goto LABEL_43;
                          }
                          continue;
                        }
                        goto LABEL_22;
                      }
                    }
                  }
                  else
                  {
                    if (v33) {
                      goto LABEL_35;
                    }
                    if ([v32 accountType]) {
                      goto LABEL_35;
                    }
                    long long v34 = [(IDSDAccount *)self userUniqueIdentifier];
                    long long v35 = [v32 userUniqueIdentifier];
                    unsigned __int8 v36 = [v34 isEqualToString:v35];

                    self = v55;
                    if ((v36 & 1) == 0) {
                      goto LABEL_35;
                    }
                  }
                  break;
                }
                v4[2](v4, v32);
                goto LABEL_35;
              }
              id v23 = +[IMRGLog registration];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int16 v67 = v16;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not reporting tinker disabled service {service: %@}", buf, 0xCu);
              }
            }
          }
LABEL_43:
          id v15 = (char *)v15 + 1;
        }
        while (v15 != v12);
        id v12 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v12);
    }

    id v10 = v46;
    id v9 = v47;
  }
  BOOL v44 = v10 != 0;

  return v44;
}

- (id)adHocAccounts
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100185F34;
  v7[3] = &unk_1009826E0;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v8;
  if ([(IDSDAccount *)self forEachAdhocAccount:v7]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSArray)linkedAccounts
{
  id v3 = +[IDSDServiceController sharedInstance];
  unsigned int v38 = self;
  id v4 = [(IDSDAccount *)self service];
  id v5 = [v3 linkedServicesForService:v4];

  if ([v5 count])
  {
    id v40 = objc_alloc_init((Class)NSMutableArray);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v31 = v5;
    id obj = v5;
    id v34 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (!v34) {
      goto LABEL_38;
    }
    uint64_t v33 = *(void *)v46;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v6;
        uint64_t v7 = *(void *)(*((void *)&v45 + 1) + 8 * v6);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v8 = +[IDSDAccountController sharedInstance];
        id v9 = [v8 accountsOnService:v7];

        id v10 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
        id v11 = v38;
        if (v10)
        {
          id v12 = v10;
          uint64_t v13 = *(void *)v42;
          uint64_t v37 = *(void *)v42;
          do
          {
            id v14 = 0;
            id v39 = v12;
            do
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v9);
              }
              id v15 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
              unsigned int v16 = [(IDSDAccount *)v11 accountType];
              if (v16 == 2)
              {
                if ([v15 accountType] == 2) {
                  goto LABEL_33;
                }
              }
              else if (v16 == 1)
              {
                unsigned int v20 = v9;
                unsigned int v21 = [v15 accountType];
                BOOL v22 = v21 == 1;
                id v23 = [v15 loginID];
                id v24 = [v23 lowercaseString];
                unsigned int v25 = [(IDSDAccount *)v11 loginID];
                id v26 = [v25 lowercaseString];
                if (IMAreObjectsLogicallySame())
                {
                  id v9 = v20;
                }
                else
                {
                  uint64_t v27 = [v15 loginID];
                  if ([v27 length])
                  {
                    BOOL v22 = 0;
                  }
                  else
                  {
                    unsigned __int8 v36 = [(IDSDAccount *)v38 loginID];
                    id v28 = [v36 length];
                    BOOL v22 = v21 == 1 && v28 == 0;
                  }
                  id v9 = v20;

                  id v11 = v38;
                }
                uint64_t v13 = v37;

                id v12 = v39;
                if (v22) {
LABEL_33:
                }
                  [v40 addObject:v15];
              }
              else if (!v16 && ![v15 accountType])
              {
                uint64_t v17 = [v15 userUniqueIdentifier];
                unsigned int v18 = [(IDSDAccount *)v11 userUniqueIdentifier];
                unsigned int v19 = [v17 isEqualToString:v18];

                id v11 = v38;
                if (v19) {
                  goto LABEL_33;
                }
              }
              id v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v12);
        }

        uint64_t v6 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (!v34)
      {
LABEL_38:

        id v5 = v31;
        goto LABEL_40;
      }
    }
  }
  id v40 = 0;
LABEL_40:

  return (NSArray *)v40;
}

- (NSString)description
{
  id v3 = [(IDSDAccount *)self service];
  id v4 = [(IDSDAccount *)self loginID];
  id v5 = [(IDSDAccount *)self uniqueID];
  [(IDSDAccount *)self accountType];
  uint64_t v6 = _StringForIDSAccountType();
  uint64_t v7 = [(IDSDAccount *)self registration];
  if ([(IDSDAccount *)self isRegistered]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  id v9 = sub_10014877C([(IDSDAccount *)self registrationError]);
  id v10 = [(IDSDAccount *)self linkedAccounts];
  id v11 = [v10 arrayByApplyingSelector:"uniqueID"];
  id v12 = +[NSString stringWithFormat:@"IDSDAccount: %p [Service: %@ Login: %@ UniqueID: %@ Account Type: %@ Registration: %@  Registered: %@  Registration Error: %@  Linked Accounts: %@]", self, v3, v4, v5, v6, v7, v8, v9, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  unsigned int v21 = [(IDSDAccount *)self service];
  unsigned int v20 = [(IDSDAccount *)self loginID];
  id v26 = [(IDSDAccount *)self uniqueID];
  [(IDSDAccount *)self accountType];
  unsigned int v18 = _StringForIDSAccountType();
  id v23 = [(IDSDAccount *)self vettedAliases];
  unsigned int v25 = +[IDSLogFormatter descriptionForArray:v23 options:0];
  BOOL v22 = [(IDSDAccount *)self unprefixedURIStringsFromRegistration];
  uint64_t v17 = +[IDSLogFormatter descriptionForArray:v22 options:0];
  unsigned int v19 = [(IDSDAccount *)self registration];
  id v3 = [v19 debugDescription];
  unsigned int v4 = [(IDSDAccount *)self isRegistered];
  CFStringRef v5 = @"NO";
  if (v4) {
    CFStringRef v5 = @"YES";
  }
  CFStringRef v16 = v5;
  id v15 = sub_10014877C([(IDSDAccount *)self registrationError]);
  id v14 = sub_10014877C([(IDSDAccount *)self lastRegistrationFailureError]);
  uint64_t v13 = [(IDSDAccount *)self lastRegistrationFailureDate];
  uint64_t v6 = [(IDSDAccount *)self lastRegistrationSuccessDate];
  uint64_t v7 = [(IDSDAccount *)self userUniqueIdentifier];
  CFStringRef v8 = [(IDSDAccount *)self linkedAccounts];
  id v9 = [v8 arrayByApplyingSelector:"uniqueID"];
  id v10 = +[IDSLogFormatter descriptionForArray:v9 options:0];
  id v11 = +[NSString stringWithFormat:@"IDSDAccount: %p [Service: %@ Login: %@ UniqueID: %@ Account Type: %@ Vetted Aliases: %@ Aliases: %@ Registration: %@  Registered: %@  Registration Error: %@  Last Registration Failure Error: %@  Last Registration Failure Date: %@  Last Registration Success Date: %@  User Unique ID: %@ Linked Accounts: %@]", self, v21, v20, v26, v18, v25, v17, v3, v16, v15, v14, v13, v6, v7, v10];

  return (NSString *)v11;
}

- (id)smallDescription
{
  unsigned int v4 = [(IDSDAccount *)self service];
  CFStringRef v5 = [v4 identifier];
  uint64_t v6 = [(IDSDAccount *)self loginID];
  [(IDSDAccount *)self accountType];
  uint64_t v7 = _StringForIDSAccountType();
  CFStringRef v8 = [(IDSDAccount *)self uniqueID];
  unsigned int v9 = [(IDSDAccount *)self isRegistered];
  CFStringRef v10 = @"NO";
  if (v9) {
    CFStringRef v10 = @"YES";
  }
  id v11 = +[NSString stringWithFormat:@"<%@:%@:%@:%@:%@>", v5, v6, v7, v8, v10];

  return v11;
}

- (NSDictionary)accountSetupInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(IDSDAccount *)self accountInfo];
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }
  CFStringRef v5 = [(IDSDAccount *)self uniqueID];
  [v3 setObject:v5 forKey:kIDSServiceDefaultsUniqueIDKey];

  uint64_t v6 = [(IDSDAccount *)self service];
  uint64_t v7 = [v6 identifier];
  [v3 setObject:v7 forKey:kIDSServiceDefaultsServiceNameKey];

  CFStringRef v8 = [(IDSDAccount *)self prefixedURIStringsFromRegistration];
  if (v8) {
    [v3 setObject:v8 forKey:kIDSServiceDefaultsRegisteredURIs];
  }

  return (NSDictionary *)v3;
}

- (void)_notifyClientDelegatesWithBlock:(id)a3
{
  id v11 = (void (**)(id, void *))a3;
  if (v11)
  {
    id v5 = objc_alloc_init((Class)IMMessageContext);
    uint64_t v6 = +[IDSDaemon sharedInstance];
    uint64_t v7 = [(IDSDAccount *)self service];
    CFStringRef v8 = [v7 pushTopic];
    unsigned int v9 = [v6 broadcasterForTopic:v8 ignoreServiceListener:1 messageContext:v5];

    v11[2](v11, v9);
  }
}

- (void)_notifyDelegatesAddedLocalDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100186AD8;
  v5[3] = &unk_1009844E8;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  [(IDSDAccount *)self _notifyClientDelegatesWithBlock:v5];
}

- (void)didAddPairedDevice:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForKey:IDSDevicePropertyPairingType];
  id v5 = [v4 integerValue];

  if (!v5) {
    [(IDSDAccount *)self _notifyDelegatesAddedLocalDevice:v6];
  }
}

- (void)didRemovePairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:IDSDevicePropertyPairingType];
  id v6 = [v5 integerValue];

  if (!v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100186E50;
    v7[3] = &unk_1009844E8;
    void v7[4] = self;
    id v8 = v4;
    [(IDSDAccount *)self _notifyClientDelegatesWithBlock:v7];
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = [a3 objectForKey:IDSDevicePropertyPairingType];
  id v5 = [v4 integerValue];

  if (!v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001870D8;
    v6[3] = &unk_1009822F8;
    v6[4] = self;
    [(IDSDAccount *)self _notifyClientDelegatesWithBlock:v6];
  }
}

- (void)didUpdateProtocolForPairedDevice:(id)a3
{
  id v4 = [a3 objectForKey:IDSDevicePropertyPairingType];
  id v5 = [v4 integerValue];

  if (!v5)
  {
    id v6 = [(IDSDAccount *)self service];
    uint64_t v7 = [v6 pushTopic];
    if ([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.bluetoothregistry"])
    {
    }
    else
    {
      id v8 = [(IDSDAccount *)self service];
      unsigned int v9 = [v8 pushTopic];
      unsigned int v10 = [v9 isEqualToIgnoringCase:@"com.apple.private.alloy.bluetoothregistryclassc"];

      if (!v10) {
        return;
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001873F0;
    v11[3] = &unk_1009822F8;
    v11[4] = self;
    [(IDSDAccount *)self _notifyClientDelegatesWithBlock:v11];
  }
}

- (IDSRegistration)registration
{
  return self->_registrationInfo;
}

- (NSDictionary)accountInfo
{
  return &self->_accountInfo->super;
}

- (BOOL)wasDisabledAutomatically
{
  return *((unsigned char *)self + 80) & 1;
}

- (void)setWasDisabledAutomatically:(BOOL)a3
{
  *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xFE | a3;
}

- (BOOL)pendingDependentCheck
{
  return (*((unsigned __int8 *)self + 80) >> 5) & 1;
}

- (void)setPendingDependentCheck:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xDF | v3;
}

- (BOOL)issuingDependentCheck
{
  return (*((unsigned __int8 *)self + 80) >> 3) & 1;
}

- (BOOL)isBeingRemoved
{
  return (*((unsigned __int8 *)self + 81) >> 3) & 1;
}

- (void)setIsBeingRemoved:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 81) = *((unsigned char *)self + 81) & 0xF7 | v3;
}

- (CUTDeferredTaskQueue)broadcastAccountInfoChangedTask
{
  return self->_broadcastAccountInfoChangedTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastAccountInfoChangedTask, 0);
  objc_storeStrong((id *)&self->_localServices, 0);
  objc_storeStrong((id *)&self->_dateOfLastHandlesCheck, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_registrationListeners, 0);
  objc_storeStrong((id *)&self->_setupHandlers, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_registrationInfo, 0);

  objc_storeStrong((id *)&self->_accountInfo, 0);
}

- (id)registrationCenter
{
  return +[IDSRegistrationCenter sharedInstance];
}

- (id)appleIDNotificationCenter
{
  return +[IDSAppleIDNotificationCenter sharedInstance];
}

- (id)accountController
{
  return +[IDSDAccountController sharedInstance];
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (id)systemMonitor
{
  return +[IDSDependencyProvider systemMonitorAdapter];
}

- (id)senderKeyDistributionManager
{
  char v2 = +[IDSDaemon sharedInstance];
  char v3 = [v2 senderKeyDistributionManager];

  return v3;
}

- (id)userDefaults
{
  return +[IMUserDefaults sharedDefaults];
}

- (BOOL)_isBuddyBlockingRegistration
{
  return +[IDSRegistrationController isBuddyBlockingRegistration];
}

- (int)_currentForcedGDRCount
{
  char v2 = [(IDSDAccount *)self userDefaults];
  char v3 = [v2 appValueForKey:@"performedGDROverrides"];
  int v4 = [v3 intValue];

  return v4;
}

- (void)_incrementForcedGDRCount
{
  uint64_t v3 = [(IDSDAccount *)self _currentForcedGDRCount] + 1;
  id v5 = [(IDSDAccount *)self userDefaults];
  int v4 = +[NSNumber numberWithInt:v3];
  [v5 setAppValue:v4 forKey:@"performedGDROverrides"];
}

- (void)_clearForcedGDRCount
{
  id v2 = [(IDSDAccount *)self userDefaults];
  [v2 removeAppValueForKey:@"performedGDROverrides"];
}

- (void)_clearForcedGDRDate
{
  id v2 = [(IDSDAccount *)self userDefaults];
  [v2 removeAppValueForKey:@"last24PeriodGDRPerformed"];
}

- (id)_performedForcedGDRDatePeriod
{
  id v2 = [(IDSDAccount *)self userDefaults];
  uint64_t v3 = [v2 appValueForKey:@"last24PeriodGDRPerformed"];
  [v3 doubleValue];
  double v5 = v4;

  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v5];
  uint64_t v7 = +[NSDate date];
  id v8 = [v6 earlierDate:v7];

  if (v8 == v7) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (void)_updatePerformedForcedGDRDate
{
  id v8 = +[NSDate date];
  uint64_t v3 = [v8 dateByAddingTimeInterval:-86400.0];
  double v4 = [(IDSDAccount *)self _performedForcedGDRDatePeriod];
  double v5 = [v4 earlierDate:v3];

  if (v5 == v4)
  {
    id v6 = [(IDSDAccount *)self userDefaults];
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setAppValue:v7 forKey:@"last24PeriodGDRPerformed"];
  }
}

- (BOOL)_hasBudgetForForcedGDR
{
  uint64_t v4 = +[IDSServerBag sharedInstance];
  uint64_t v3 = [(id)v4 objectForKey:@"md-ids-gdr-day-limit"];

  LODWORD(v4) = IMGetAppIntForKey();
  if ((int)v4 >= 1)
  {
    double v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1007175C4(v4, v5);
    }

    uint64_t v4 = v4;
    goto LABEL_5;
  }
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v3;
      id v7 = [v6 intValue];
      id v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = (int)v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d max forced GDRs", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v15 = (uint64_t)v7;
        _IDSLogV();
      }

      uint64_t v4 = (int)v7;
LABEL_5:

      if (!v4) {
        return v4;
      }
      goto LABEL_21;
    }
  }
  unsigned int v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = 1;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for max GDR per day, using the default: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v15 = 1;
    _IDSLogV();
  }

  uint64_t v4 = 1;
LABEL_21:
  if (v4 <= [(IDSDAccount *)self _currentForcedGDRCount])
  {
    id v10 = [(IDSDAccount *)self _performedForcedGDRDatePeriod];
    uint64_t v4 = +[NSDate date];
    id v11 = [(id)v4 dateByAddingTimeInterval:-86400.0];

    id v12 = [v10 earlierDate:v11];
    LODWORD(v4) = v12 == v10;

    if (v4)
    {
      [(IDSDAccount *)self _clearForcedGDRCount];
      [(IDSDAccount *)self _clearForcedGDRDate];
      id v13 = [(IDSDAccount *)self _performedForcedGDRDatePeriod];
    }
  }
  else
  {
    [(IDSDAccount *)self _incrementForcedGDRCount];
    [(IDSDAccount *)self _updatePerformedForcedGDRDate];
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_updatePhoneNumberCallerID
{
  registrationInfo = self->_registrationInfo;
  if (registrationInfo && ![(IDSRegistration *)registrationInfo registrationType])
  {
    uint64_t v4 = [(IDSRegistration *)self->_registrationInfo phoneNumber];
    if ([v4 length])
    {
      double v5 = IMSingleObjectArray();
      [(IDSDAccount *)self _updateVettedAliases:v5 emailInfo:0 addToCurrentHandlesIfNeeded:1];

      id v6 = +[NSDictionary dictionaryWithObject:v4 forKey:kIDSServiceDefaultsLoginAsKey];
      [(IDSDAccount *)self writeAccountDefaults:v6];

      id v7 = +[NSDictionary dictionaryWithObject:v4 forKey:kIDSServiceDefaultsDisplayNameKey];
      [(IDSDAccount *)self writeAccountDefaults:v7];

      if ((*((unsigned char *)self + 80) & 2) == 0) {
        [(IDSRegistration *)self->_registrationInfo saveToKeychain];
      }
    }
    else
    {
      id v8 = +[NSDictionary dictionaryWithObject:&stru_10099BE78 forKey:kIDSServiceDefaultsLoginAsKey];
      [(IDSDAccount *)self writeAccountDefaults:v8];

      unsigned int v9 = +[NSDictionary dictionaryWithObject:&stru_10099BE78 forKey:kIDSServiceDefaultsDisplayNameKey];
      [(IDSDAccount *)self writeAccountDefaults:v9];

      if ([(IDSDAccount *)self isRegistered])
      {
        id v10 = +[IMRGLog warning];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_10071774C();
        }
      }
    }
    if ([v4 length]
      && (id)[(IDSDAccount *)self _validationStatusForAlias:v4] != (id)3)
    {
      id v12 = +[IMRGLog registration];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100717718();
      }

      id v13 = +[NSArray array];
      id v14 = +[NSDictionary dictionaryWithObject:v13 forKey:kIDSServiceDefaultsAliasesKey];
      [(IDSDAccount *)self writeAccountDefaults:v14];

      uint64_t v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1007176A4();
      }

      CFStringRef v16 = IMSingleObjectArray();
      [(IDSDAccount *)self _addAliases:v16];

      int v17 = +[IMRGLog registration];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100717670();
      }

      [(IDSDAccount *)self _setValidationStatus:3 error:0xFFFFFFFFLL forAlias:v4 info:0 addToCurrentHandlesIfNeeded:1 forceAdd:0];
    }
    else
    {
      id v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10071763C();
      }
    }
  }
}

- (void)_updateCallerIDToTemporaryPhone
{
  uint64_t v3 = [(IDSServiceProperties *)self->_service identifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.madrid"];

  if (v4)
  {
    CFStringRef v5 = @"iMessage";
  }
  else
  {
    id v6 = [(IDSServiceProperties *)self->_service identifier];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.ess"];

    if (!v7) {
      return;
    }
    CFStringRef v5 = @"FaceTime";
  }
  id v8 = IMPreferredAccountMap();
  unsigned int v9 = [v8 objectForKey:v5];
  id v10 = [v9 objectForKey:@"guid"];

  id v11 = [(IDSDAccount *)self accountController];
  id v12 = [v11 appleIDAccountOnService:self->_service];
  id v13 = [v12 uniqueID];

  if (!v10 || ([v10 isEqualToString:v13] & 1) == 0)
  {
    id v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(IDSDAccount *)self uniqueID];
      int v17 = 138412802;
      CFStringRef v18 = v5;
      __int16 v19 = 2112;
      unsigned int v20 = v10;
      __int16 v21 = 2112;
      BOOL v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating preferred account to Home Number {service: %@, oldID: %@, newID: %@}", (uint8_t *)&v17, 0x20u);
    }
    CFStringRef v16 = [(IDSDAccount *)self uniqueID];
    IMUpdatePreferredAccountForService();
  }
}

- (int)_neededRegistrationType
{
  if ([(IDSDAccount *)self accountType]) {
    return 1;
  }
  if ([(IDSDAccount *)self isTemporary]) {
    return 2;
  }
  return 0;
}

- (BOOL)_rebuildRegistrationInfo:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(IDSDAccount *)self isAdHocAccount])
  {
    if ([(IDSDAccount *)self accountType] == 2)
    {
      CFStringRef v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100717810(self);
      }
      goto LABEL_7;
    }
    id v8 = +[IDSRegistrationKeyManager sharedInstance];
    if ([v8 requiresKeychainMigration])
    {
      unsigned int v9 = [(IDSDAccount *)self systemMonitor];
      unsigned int v10 = [v9 isUnderFirstDataProtectionLock];

      if (v10)
      {
        CFStringRef v5 = +[IMRGLog registration];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Under first lock and keychain upgrade pending, not loading registration for this account", buf, 2u);
        }
        BOOL v6 = 1;
        goto LABEL_8;
      }
    }
    else
    {
    }
    if (!self->_registrationInfo)
    {
      unsigned int v20 = +[IMRGLog registration];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1007178A0();
      }
      goto LABEL_34;
    }
    unsigned int v11 = [(IDSDAccount *)self _neededRegistrationType];
    if (v11 == [(IDSRegistration *)self->_registrationInfo registrationType])
    {
      if (!self->_registrationInfo) {
        return 0;
      }
      if (+[IDSRegistrationController systemSupportsRegistrationInfo:](IDSRegistrationController, "systemSupportsRegistrationInfo:"))
      {
        if (self->_registrationInfo)
        {
          if ([(IDSDAccount *)self _neededRegistrationType] == 1)
          {
            id v12 = [(IDSDAccount *)self loginID];
            id v13 = [(IDSRegistration *)self->_registrationInfo email];
            unsigned __int8 v14 = [v12 isEqualToIgnoringCase:v13];

            if ((v14 & 1) == 0)
            {
              unsigned int v20 = +[IMRGLog registration];
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_34;
              }
              id v170 = [(IDSDAccount *)self loginID];
              __int16 v171 = [(IDSRegistration *)self->_registrationInfo email];
              *(_DWORD *)buf = 138412546;
              *(void *)v235 = v170;
              *(_WORD *)&v235[8] = 2112;
              CFStringRef v236 = v171;
              v172 = "Emails are different, we need to rebuild  (%@ vs %@)";
              goto LABEL_220;
            }
          }
          if (!self->_registrationInfo) {
            return 0;
          }
          uint64_t v15 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
          if (!v15) {
            return 0;
          }
          CFStringRef v16 = (void *)v15;
          int v17 = [(IDSRegistration *)self->_registrationInfo pushToken];
          CFStringRef v18 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
          unsigned __int8 v19 = [v17 isEqual:v18];

          if (v19) {
            return 0;
          }
          unsigned int v20 = +[IMRGLog registration];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v170 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
            __int16 v171 = [(IDSRegistration *)self->_registrationInfo pushToken];
            *(_DWORD *)buf = 138412546;
            *(void *)v235 = v170;
            *(_WORD *)&v235[8] = 2112;
            CFStringRef v236 = v171;
            v172 = "Push tokens are different, we need to rebuild  (%@ vs %@)";
LABEL_220:
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v172, buf, 0x16u);
          }
LABEL_34:

          if (!v3) {
            return 1;
          }
          registrationInfo = self->_registrationInfo;
          if (registrationInfo
            && (id)[(IDSRegistration *)registrationInfo registrationStatus] == (id)8)
          {
            id v28 = +[IDSRegistrationController sharedInstance];
            [v28 unregisterInfo:self->_registrationInfo];
          }
          id v29 = self->_registrationInfo;
          uint64_t v30 = self->_registrationInfo;
          self->_registrationInfo = 0;

          uint64_t v31 = +[IDSRegistrationController sharedInstance];
          [v31 cancelActionsForRegistrationInfo:v29];

          id v32 = +[IDSRegistrationController sharedInstance];
          [v32 stopTrackingRegistration:v29];

          p_vtable = &OBJC_METACLASS___IDSAccountIdentityElector.vtable;
          id v34 = +[IDSHeartbeatCenter sharedInstance];
          [v34 removeRegistrationInfo:v29];

          uint64_t v35 = [(IDSDAccount *)self _neededRegistrationType];
          uint64_t v36 = v35;
          if (v35)
          {
            if (v35 == 2)
            {
              uint64_t v38 = [(IDSDAccount *)self userUniqueIdentifier];
            }
            else
            {
              uint64_t v37 = 0;
              if (v35 != 1) {
                goto LABEL_48;
              }
              uint64_t v38 = [(IDSDAccount *)self loginID];
            }
            uint64_t v37 = (__CFString *)v38;
          }
          else
          {
            uint64_t v39 = [(IDSDAccount *)self userUniqueIdentifier];
            id v40 = (void *)v39;
            long long v41 = @"phone-number-registration";
            if (v39) {
              long long v41 = (__CFString *)v39;
            }
            uint64_t v37 = v41;
          }
LABEL_48:

          long long v42 = +[IDSRegistrationKeychainManager sharedInstance];
          long long v43 = [(IDSDAccount *)self serviceType];
          long long v44 = [v42 registrationWithServiceType:v43 registrationType:v36 value:v37];
          long long v45 = self->_registrationInfo;
          self->_registrationInfo = v44;

          [(IDSRegistration *)self->_registrationInfo setShouldAutoRegisterAllHandles:[(IDSDAccount *)self shouldAutoRegisterAllHandles]];
          [(IDSRegistration *)self->_registrationInfo setShouldRegisterUsingDSHandle:[(IDSDAccount *)self shouldRegisterUsingDSHandle]];
          long long v46 = self->_registrationInfo;
          v218 = v37;
          if (v46)
          {
            if (v36 != 1) {
              goto LABEL_78;
            }
            long long v47 = [(IDSRegistration *)v46 regionID];
            long long v48 = IMRGLog_ptr;
            if ([v47 length])
            {
              id v49 = [(IDSRegistration *)self->_registrationInfo regionBasePhoneNumber];
              long long v50 = [(IDSRegistration *)self->_registrationInfo regionServerContext];
              long long v51 = +[NSNumber numberWithInt:3];
              long long v52 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
              id v53 = +[IMRGLog registration];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v235 = v47;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Found pre-existing regionID %@", buf, 0xCu);
              }

              id v54 = +[IMRGLog registration];
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v235 = v49;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Found pre-existing base phone number %@", buf, 0xCu);
              }

              __int16 v55 = +[IMRGLog registration];
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v235 = v50;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Found pre-existing region context %@", buf, 0xCu);
              }

              __int16 v56 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              long long v57 = v47;
              long long v48 = IMRGLog_ptr;
              if (v57) {
                CFDictionarySetValue(v56, kIDSServiceDefaultsProfileRegionIDKey, v57);
              }

              id v58 = v49;
              if (v58) {
                CFDictionarySetValue(v56, kIDSServiceDefaultsProfileBaseNumberKey, v58);
              }

              id v59 = v50;
              if (v59) {
                CFDictionarySetValue(v56, kIDSServiceDefaultsProfileServerContextKey, v59);
              }

              id v60 = v51;
              if (v60) {
                CFDictionarySetValue(v56, kIDSServiceDefaultsProfileValdationStatusKey, v60);
              }

              id v61 = v52;
              if (v61) {
                CFDictionarySetValue(v56, kIDSServiceDefaultsProfileValdationErrorCodeKey, v61);
              }

              long long v62 = +[NSDictionary dictionaryWithObject:v56 forKey:kIDSServiceDefaultsProfileKey];
              [(IDSDAccount *)self _writeAccountDefaults:v62 force:1];

              p_vtable = (void **)(&OBJC_METACLASS___IDSAccountIdentityElector + 24);
            }
            long long v63 = [(IDSRegistration *)self->_registrationInfo vettedEmails];
            v232[0] = _NSConcreteStackBlock;
            v232[1] = 3221225472;
            v232[2] = sub_100201E6C;
            v232[3] = &unk_100980858;
            v232[4] = self;
            objc_msgSend(v63, "__imArrayByApplyingBlock:", v232);
            id v64 = (id)objc_claimAutoreleasedReturnValue();

            __int16 v65 = [(IDSDAccount *)self vettedAliases];
            id v66 = [v65 count];

            if (v66)
            {
              __int16 v67 = self->_registrationInfo;
              id v68 = [(IDSDAccount *)self vettedAliases];
              [(IDSRegistration *)v67 setVettedEmails:v68];
            }
            if ([v64 count])
            {
              unsigned int v69 = +[IMRGLog registration];
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v235 = v64;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Found pre-existing confirmedEmails emails %@", buf, 0xCu);
              }

              id v70 = [v48[40] dictionaryWithObject:v64 forKey:kIDSServiceDefaultsVettedAliasesKey];
              [(IDSDAccount *)self _writeAccountDefaults:v70 force:1];
            }
          }
          else
          {
            long long v47 = +[IMRGLog registration];
            if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_77;
            }
            id v64 = [(IDSDAccount *)self serviceType];
            *(_DWORD *)buf = 138412546;
            *(void *)v235 = v64;
            *(_WORD *)&v235[8] = 2112;
            CFStringRef v236 = v37;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Didn't find a registration in the keychain for %@ %@", buf, 0x16u);
          }
LABEL_77:

          if (!self->_registrationInfo)
          {
            long long v72 = 0;
            goto LABEL_83;
          }
LABEL_78:
          unsigned int v71 = [(IDSDAccount *)self _rebuildRegistrationInfo:0];
          long long v72 = self->_registrationInfo;
          if (!v71)
          {
            if (!v72) {
              goto LABEL_168;
            }
            long long v73 = +[IMRGLog registration];
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v74 = self->_registrationInfo;
              *(_DWORD *)buf = 138412290;
              *(void *)v235 = v74;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Using cached registration info: %@", buf, 0xCu);
            }
LABEL_165:

            v175 = self->_registrationInfo;
            if (v175)
            {
              v176 = [(IDSRegistration *)v175 userUniqueIdentifier];

              v177 = self->_registrationInfo;
              if (!v176)
              {
                v178 = [(IDSDAccount *)self userUniqueIdentifier];
                [(IDSRegistration *)v177 setUserUniqueIdentifier:v178];

                v177 = self->_registrationInfo;
              }
LABEL_169:
              v179 = [(IDSRegistration *)v177 uris];
              if ([v179 count]
                || [(IDSRegistration *)self->_registrationInfo shouldRegisterUsingDSHandle])
              {
              }
              else
              {
                int64_t v212 = [(IDSRegistration *)self->_registrationInfo registrationStatus];

                if (v212 == 8)
                {
                  v213 = +[IMRGLog registration];
                  if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEFAULT, "  We have no URIs registered, and we're not DS based, forcing unregistered", buf, 2u);
                  }

                  [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:0];
                }
              }
              v180 = [(IDSRegistration *)self->_registrationInfo registrationCert];
              if (v180)
              {
              }
              else if ((id)[(IDSRegistration *)self->_registrationInfo registrationStatus] == (id)8)
              {
                v181 = +[IMRGLog registration];
                if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEFAULT, "  We have no registration cert, forcing unregistered", buf, 2u);
                }

                [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:0];
              }
              v182 = [(IDSDAccount *)self accountInfo];
              v183 = (const void *)kIDSServiceDefaultsAuthorizationIDKey;
              v184 = [v182 objectForKey:kIDSServiceDefaultsAuthorizationIDKey];

              v185 = [(IDSRegistration *)self->_registrationInfo profileID];
              if (![v184 length] && objc_msgSend(v185, "length"))
              {
                v186 = +[IMRGLog registration];
                if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v235 = v185;
                  _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_DEFAULT, "Setting profileID %@ onto account", buf, 0xCu);
                }

                v187 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                id v188 = v185;
                if (v188) {
                  CFDictionarySetValue(v187, v183, v188);
                }

                [(IDSDAccount *)self writeAccountDefaults:v187];
              }
              v215 = v185;
              int64_t v189 = [(IDSDAccount *)self registrationError];
              if ([(IDSDAccount *)self shouldRegisterUsingDSHandle])
              {
                v190 = [(IDSRegistration *)self->_registrationInfo dsHandle];
                BOOL v191 = [v190 length] == 0;
              }
              else
              {
                BOOL v191 = 0;
              }
              if ([(IDSRegistration *)self->_registrationInfo registrationType] == 1)
              {
                v192 = [(IDSRegistration *)self->_registrationInfo profileID];
                if (![v192 length]) {
                  BOOL v191 = 1;
                }
              }
              v217 = v184;
              if ((unint64_t)(v189 - 33) > 1)
              {
                if (!v191)
                {
LABEL_200:
                  [(IDSDAccount *)self refreshAdHocServiceNames];
                  v200 = +[IMRGLog registration];
                  if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
                  {
                    v201 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
                    IMLoggingStringForArray();
                    id v202 = (id)objc_claimAutoreleasedReturnValue();
                    v203 = [(IDSDAccount *)self uniqueID];
                    *(_DWORD *)buf = 138412546;
                    *(void *)v235 = v202;
                    *(_WORD *)&v235[8] = 2112;
                    CFStringRef v236 = v203;
                    _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_DEFAULT, "Current aliases: %@   for: %@", buf, 0x16u);
                  }
                  long long v221 = 0u;
                  long long v222 = 0u;
                  long long v219 = 0u;
                  long long v220 = 0u;
                  v204 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
                  id v205 = [v204 countByEnumeratingWithState:&v219 objects:v233 count:16];
                  if (v205)
                  {
                    id v206 = v205;
                    uint64_t v207 = *(void *)v220;
                    do
                    {
                      for (i = 0; i != v206; i = (char *)i + 1)
                      {
                        if (*(void *)v220 != v207) {
                          objc_enumerationMutation(v204);
                        }
                        uint64_t v209 = *(void *)(*((void *)&v219 + 1) + 8 * i);
                        if ([(IDSDAccount *)self _validationStatusForAlias:v209] != -1)
                        {
                          v210 = +[IMRGLog registration];
                          if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)v235 = v209;
                            _os_log_impl((void *)&_mh_execute_header, v210, OS_LOG_TYPE_DEFAULT, " => adding candidate email: %@", buf, 0xCu);
                          }

                          [(IDSRegistration *)self->_registrationInfo addCandidateEmail:v209];
                        }
                      }
                      id v206 = [v204 countByEnumeratingWithState:&v219 objects:v233 count:16];
                    }
                    while (v206);
                  }

                  v211 = +[IDSRegistrationController sharedInstance];
                  [v211 startTrackingActiveRegistration:self->_registrationInfo];

                  BOOL v6 = 1;
                  CFStringRef v5 = v218;
                  goto LABEL_8;
                }
                v194 = +[IMRGLog registration];
                if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
                {
                  v195 = self->_registrationInfo;
                  *(_DWORD *)buf = 138412290;
                  *(void *)v235 = v195;
                  _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, "*** Account needs repair, let's try to pull what we can from accounts (%@)", buf, 0xCu);
                }

                v193 = +[FTPasswordManager sharedInstance];
                v196 = [(IDSRegistration *)self->_registrationInfo profileID];
                v197 = [(IDSRegistration *)self->_registrationInfo email];
                v198 = [v197 lowercaseString];
                v199 = [(IDSRegistration *)self->_registrationInfo serviceType];
                v223[0] = _NSConcreteStackBlock;
                v223[1] = 3221225472;
                v223[2] = sub_100201ED4;
                v223[3] = &unk_100986270;
                v223[4] = self;
                [v193 fetchAuthTokenForProfileID:v196 username:v198 service:v199 outRequestID:0 completionBlock:v223];
              }
              else
              {
                v193 = +[IMRGLog registration];
                if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEFAULT, "Not Attempting Account Repair, This is a managed AppleID", buf, 2u);
                }
              }

              goto LABEL_200;
            }
LABEL_168:
            v177 = 0;
            goto LABEL_169;
          }
LABEL_83:
          if ((id)[(IDSRegistration *)v72 registrationStatus] == (id)8)
          {
            v75 = +[IDSRegistrationController sharedInstance];
            [v75 unregisterInfo:self->_registrationInfo];
          }
          v76 = +[IDSRegistrationController sharedInstance];
          [v76 cancelActionsForRegistrationInfo:self->_registrationInfo];

          v77 = +[IDSRegistrationController sharedInstance];
          [v77 stopTrackingRegistration:self->_registrationInfo];

          id v78 = [p_vtable + 272 sharedInstance];
          [v78 removeRegistrationInfo:self->_registrationInfo];

          id v79 = objc_alloc_init(IDSRegistration);
          id v80 = self->_registrationInfo;
          self->_registrationInfo = v79;

          uint64_t v81 = [(IDSDAccount *)self serviceType];
          [(IDSRegistration *)self->_registrationInfo setServiceType:v81];
          long long v82 = self->_registrationInfo;
          long long v83 = _IDSRegistrationServiceIdentifierFromServiceType();
          [(IDSRegistration *)v82 setServiceIdentifier:v83];

          [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:0];
          [(IDSRegistration *)self->_registrationInfo setRegistrationType:v36];
          uint64_t v84 = self->_registrationInfo;
          id v85 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
          [(IDSRegistration *)v84 setPushToken:v85];

          [(IDSRegistration *)self->_registrationInfo setShouldAutoRegisterAllHandles:[(IDSDAccount *)self shouldAutoRegisterAllHandles]];
          [(IDSRegistration *)self->_registrationInfo setShouldRegisterUsingDSHandle:[(IDSDAccount *)self shouldRegisterUsingDSHandle]];
          long long v86 = self->_registrationInfo;
          long long v87 = [(IDSDAccount *)self userUniqueIdentifier];
          [(IDSRegistration *)v86 setUserUniqueIdentifier:v87];

          if (v36 == 1)
          {
            v88 = self->_registrationInfo;
            id v89 = [(IDSDAccount *)self loginID];
            [(IDSRegistration *)v88 setEmail:v89];
          }
          v90 = [(IDSDAccount *)self accountInfo];
          id v91 = [v90 objectForKey:kIDSServiceDefaultsAuthorizationIDKey];

          v216 = v91;
          if ([v91 length])
          {
            id v92 = [(IDSRegistration *)self->_registrationInfo profileID];
            if ([v92 length])
            {
              id v93 = [(IDSRegistration *)self->_registrationInfo profileID];
              unsigned int v94 = [v91 isEqualToString:v93];

              if (!v94) {
                goto LABEL_95;
              }
            }
            else
            {
            }
            BOOL v95 = +[IMRGLog registration];
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v235 = v91;
              _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Setting profileID %@ onto registration", buf, 0xCu);
            }

            [(IDSRegistration *)self->_registrationInfo setProfileID:v91];
          }
LABEL_95:
          v214 = v81;
          v96 = [(IDSRegistration *)self->_registrationInfo idsUserID];
          if ([v96 length])
          {
            uint64_t v97 = [(IDSRegistration *)self->_registrationInfo idsUserID];
            BOOL v98 = [v97 _FZIDType] != (id)1;
          }
          else
          {
            BOOL v98 = 1;
          }

          if (v36 == 1 && v98)
          {
            uint64_t v99 = [(IDSRegistration *)self->_registrationInfo profileID];
            id v100 = [v99 length];

            if (!v100) {
              goto LABEL_119;
            }
            long long v230 = 0u;
            long long v231 = 0u;
            long long v228 = 0u;
            long long v229 = 0u;
            v101 = +[IDSRegistrationKeychainManager sharedInstance];
            uint64_t v102 = [v101 registrations];

            id v103 = [v102 countByEnumeratingWithState:&v228 objects:v240 count:16];
            if (v103)
            {
              id v104 = v103;
              uint64_t v105 = *(void *)v229;
              while (2)
              {
                for (j = 0; j != v104; j = (char *)j + 1)
                {
                  if (*(void *)v229 != v105) {
                    objc_enumerationMutation(v102);
                  }
                  double v107 = *(void **)(*((void *)&v228 + 1) + 8 * (void)j);
                  double v108 = [v107 registrationCert];
                  if (v108 && [v107 registrationType] == 1)
                  {
                    v109 = [v107 profileID];
                    v110 = [(IDSRegistration *)self->_registrationInfo profileID];
                    unsigned int v111 = [v109 isEqualToIgnoringCase:v110];

                    if (v111)
                    {
                      double v112 = +[IMRGLog registration];
                      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)v235 = v107;
                        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Setting idsUserID (for auth cert), isCDMA, and keyPairSignature on registration using existing registration with the same profileID { keychainRegistration: %@ }", buf, 0xCu);
                      }

                      unsigned int v114 = +[FTDeviceSupport sharedInstance];
                      id v115 = [v114 isC2KEquipment];

                      unsigned int v116 = self->_registrationInfo;
                      __int16 v117 = [v107 idsUserID];
                      [(IDSRegistration *)v116 setIdsUserID:v117];

                      BOOL v118 = self->_registrationInfo;
                      __int16 v119 = +[NSNumber numberWithBool:v115];
                      [(IDSRegistration *)v118 setIsCDMA:v119];

                      v120 = self->_registrationInfo;
                      v121 = +[IDSRegistrationKeyManager sharedInstance];
                      v122 = [v121 keyPairSignature];
                      [(IDSRegistration *)v120 setKeyPairSignature:v122];

                      goto LABEL_117;
                    }
                  }
                  else
                  {
                  }
                }
                id v104 = [v102 countByEnumeratingWithState:&v228 objects:v240 count:16];
                if (v104) {
                  continue;
                }
                break;
              }
            }
LABEL_117:

            LODWORD(v36) = 1;
          }
          if (v36 != 1)
          {
            if (v36 == 2)
            {
              v154 = self->_registrationInfo;
              v155 = [(IDSDAccount *)self loginID];
              [(IDSRegistration *)v154 setMainID:v155];

              uint64_t v156 = self->_registrationInfo;
              long long v157 = [(IDSDAccount *)self loginID];
              long long v158 = [v157 _IDFromFZIDType:0];
              [(IDSRegistration *)v156 setIdsUserID:v158];

              long long v159 = [(IDSDAccount *)self accountController];
              long long v160 = [(IDSDAccount *)self serviceController];
              long long v161 = [v160 iCloudService];
              long long v162 = [v159 appleIDAccountOnService:v161];
              v135 = [v162 loginID];

              [(IDSRegistration *)self->_registrationInfo setEmail:v135];
              [(IDSRegistration *)self->_registrationInfo setNeedsRenewal:1];
            }
            else
            {
              if (v36)
              {
LABEL_162:
                v173 = +[IMRGLog registration];
                if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                {
                  v174 = self->_registrationInfo;
                  *(_DWORD *)buf = 138412290;
                  *(void *)v235 = v174;
                  _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "Created new registration info: %@", buf, 0xCu);
                }

                long long v73 = v214;
                goto LABEL_165;
              }
              v135 = [(IDSRegistration *)self->_registrationInfo mainID];
              if (v135)
              {
                uint64_t v142 = +[IDSRegistrationKeychainManager sharedInstance];
                id v143 = [v142 smsSignatureForID:v135];

                v144 = +[FTDeviceSupport sharedInstance];
                id v145 = [v144 isC2KEquipment];

                v146 = +[IDSRegistrationKeyManager sharedInstance];
                v147 = [v146 keyPairSignature];

                v148 = +[IMRGLog registration];
                if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v149 = @"NO";
                  *(_DWORD *)buf = 138412802;
                  *(void *)v235 = v135;
                  *(_WORD *)&v235[8] = 2112;
                  if (v145) {
                    CFStringRef v149 = @"YES";
                  }
                  CFStringRef v236 = v149;
                  __int16 v237 = 2112;
                  v238 = v147;
                  _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "Setting idsUserID (for auth cert), mainID, isCDMA, and keyPairSignature on phone number registration {mainID: %@, isC2K: %@, keyPairSignature: %@}", buf, 0x20u);
                }

                v150 = self->_registrationInfo;
                id v151 = [v135 _IDFromFZIDType:0];
                [(IDSRegistration *)v150 setIdsUserID:v151];

                id v152 = self->_registrationInfo;
                id v153 = +[NSNumber numberWithBool:v145];
                [(IDSRegistration *)v152 setIsCDMA:v153];

                [(IDSRegistration *)self->_registrationInfo setKeyPairSignature:v147];
              }
              else
              {
                id v143 = 0;
              }
              if ([v143 length]) {
                [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:v143];
              }
            }
LABEL_161:

            goto LABEL_162;
          }
LABEL_119:
          v123 = +[IMRGLog registration];
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            v124 = self->_registrationInfo;
            *(_DWORD *)buf = 138412290;
            *(void *)v235 = v124;
            _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "Rebuilding aliases for: %@", buf, 0xCu);
          }

          long long v226 = 0u;
          long long v227 = 0u;
          long long v224 = 0u;
          long long v225 = 0u;
          char v125 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
          id v126 = [v125 countByEnumeratingWithState:&v224 objects:v239 count:16];
          if (v126)
          {
            id v127 = v126;
            uint64_t v128 = *(void *)v225;
            do
            {
              for (k = 0; k != v127; k = (char *)k + 1)
              {
                if (*(void *)v225 != v128) {
                  objc_enumerationMutation(v125);
                }
                uint64_t v130 = *(void *)(*((void *)&v224 + 1) + 8 * (void)k);
                int64_t v131 = [(IDSDAccount *)self _validationStatusForAlias:v130];
                BOOL v132 = +[IMRGLog registration];
                BOOL v133 = os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT);
                if (v131 == -1)
                {
                  if (v133)
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v235 = v130;
                    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, " => ignoring failed validation email: %@", buf, 0xCu);
                  }
                }
                else
                {
                  if (v133)
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v235 = v130;
                    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, " => adding candidate email: %@", buf, 0xCu);
                  }

                  [(IDSRegistration *)self->_registrationInfo addCandidateEmail:v130];
                }
              }
              id v127 = [v125 countByEnumeratingWithState:&v224 objects:v239 count:16];
            }
            while (v127);
          }

          v134 = [(IDSDAccount *)self accountInfo];
          v135 = [v134 objectForKey:kIDSServiceDefaultsProfileKey];

          BOOL v136 = +[IMRGLog registration];
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v235 = v135;
            _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Existing region profile: %@", buf, 0xCu);
          }

          if ([v135 count])
          {
            uint64_t v137 = [v135 objectForKey:kIDSServiceDefaultsProfileValdationStatusKey];
            unsigned int v138 = [v137 intValue];

            if (v138 == 3)
            {
              v139 = +[IMRGLog registration];
              if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "We have a profile, and it's validated!", buf, 2u);
              }

              uint64_t v140 = [(IDSRegistration *)self->_registrationInfo regionID];
              id v141 = [v140 length];

              if (!v141)
              {
                long long v163 = +[IMRGLog registration];
                if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "No region ID, we'll use our profile's", buf, 2u);
                }

                long long v164 = self->_registrationInfo;
                long long v165 = [v135 objectForKey:kIDSServiceDefaultsProfileRegionIDKey];
                [(IDSRegistration *)v164 setRegionID:v165];

                long long v166 = self->_registrationInfo;
                long long v167 = [v135 objectForKey:kIDSServiceDefaultsProfileBaseNumberKey];
                [(IDSRegistration *)v166 setRegionBasePhoneNumber:v167];

                long long v168 = self->_registrationInfo;
                v169 = [v135 objectForKey:kIDSServiceDefaultsProfileServerContextKey];
                [(IDSRegistration *)v168 setRegionServerContext:v169];
              }
            }
          }
          goto LABEL_161;
        }
        return 0;
      }
      unsigned int v20 = +[IMRGLog registration];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      unsigned int v26 = [(IDSRegistration *)self->_registrationInfo registrationType];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v235 = v26;
      id v23 = "Registration type is not supported: %d";
      id v24 = v20;
      uint32_t v25 = 8;
    }
    else
    {
      unsigned int v20 = +[IMRGLog registration];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      unsigned int v21 = [(IDSDAccount *)self _neededRegistrationType];
      unsigned int v22 = [(IDSRegistration *)self->_registrationInfo registrationType];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v235 = v21;
      *(_WORD *)&v235[4] = 1024;
      *(_DWORD *)&v235[6] = v22;
      id v23 = "Our registration types don't match, needs rebuild  (%d vs %d)";
      id v24 = v20;
      uint32_t v25 = 14;
    }
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    goto LABEL_34;
  }
  CFStringRef v5 = +[IMRGLog warning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100717780(self);
  }
LABEL_7:
  BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (void)refreshAdHocServiceNames
{
  id v33 = objc_alloc_init((Class)NSMutableArray);
  BOOL v3 = [(IDSDAccount *)self accountController];
  unsigned int v4 = [v3 isLocalSetupEnabled];

  CFStringRef v5 = [(IDSDAccount *)self accountController];
  unsigned int v6 = [v5 isTraditionalLocalSetupEnabled];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unsigned int v7 = +[IDSDServiceController sharedInstance];
  id v8 = [(IDSDAccount *)self service];
  unsigned int v9 = [v8 identifier];
  unsigned int v10 = [v7 adHocServicesForIdentifier:v9];

  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v35;
    *(void *)&long long v12 = 138412290;
    long long v32 = v12;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v10);
        }
        CFStringRef v16 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v15);
        unsigned int v17 = objc_msgSend(v16, "adHocServiceType", v32);
        if (v17) {
          BOOL v18 = v17 == 5;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18) {
          goto LABEL_11;
        }
        unsigned int v19 = v17;
        unsigned int v20 = v17 == 2 ? v4 : 1;
        if (v20 != 1) {
          goto LABEL_11;
        }
        if ([(IDSDAccount *)self accountType] == 1)
        {
          if (v19 == 2) {
            goto LABEL_25;
          }
        }
        else
        {
          unsigned int v21 = [(IDSDAccount *)self accountType];
          if (v19 == 2 && v21 == 0)
          {
LABEL_25:
            id v23 = [v16 pushTopic];
            unsigned int v24 = [v23 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

            if (!v24) {
              goto LABEL_11;
            }
          }
        }
        if ([v16 disabledOnTinkerWatch]
          && (+[IDSPairingManager sharedInstance],
              uint32_t v25 = objc_claimAutoreleasedReturnValue(),
              unsigned int v26 = [v25 isCurrentDeviceTinkerConfiguredWatch],
              v25,
              v26))
        {
          uint64_t v27 = +[IMRGLog registration];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v32;
            uint64_t v39 = v16;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Ignoring tinker disabled service {service: %@}", buf, 0xCu);
          }
        }
        else
        {
          if (([v16 enabledOnlyWhenPaired] ^ 1 | v6) != 1) {
            goto LABEL_11;
          }
          uint64_t v27 = [v16 identifier];
          [v33 addObject:v27];
        }

LABEL_11:
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v28 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
      id v13 = v28;
    }
    while (v28);
  }

  if ([v33 count]) {
    [(IDSRegistration *)self->_registrationInfo setAdHocServiceNames:v33];
  }
  id v29 = +[IMRGLog registration];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = IMLoggingStringForArray();
    registrationInfo = self->_registrationInfo;
    *(_DWORD *)buf = 138412546;
    uint64_t v39 = v30;
    __int16 v40 = 2112;
    long long v41 = registrationInfo;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Adding ad hoc service names %@ to %@", buf, 0x16u);
  }
}

- (BOOL)isDeviceRegistered
{
  BOOL v3 = [(IDSDAccount *)self primaryRegistration];
  if ([v3 registrationStatus] == (id)8)
  {
    unsigned int v4 = [(IDSDAccount *)self primaryRegistration];
    CFStringRef v5 = [v4 registrationCert];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isDeviceAuthenticated
{
  id v2 = [(IDSDAccount *)self primaryRegistration];
  BOOL v3 = (uint64_t)[v2 registrationStatus] > 5;

  return v3;
}

- (BOOL)isRegistrationActive
{
  return (*((unsigned __int8 *)self + 81) >> 1) & 1;
}

- (void)_registrationAbilityChanged:(id)a3
{
  unsigned int v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = [(IDSDAccount *)self uniqueID];
    int v8 = 138412290;
    unsigned int v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device Controller says I should maybe try to re-register now: %@", (uint8_t *)&v8, 0xCu);
  }
  [(IDSDAccount *)self _rebuildRegistrationInfo:1];
  if (![(IDSDAccount *)self isDeviceRegistered])
  {
    BOOL v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(IDSDAccount *)self uniqueID];
      int v8 = 138412290;
      unsigned int v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This indeed necessitated a re-register, kicking it off: %@", (uint8_t *)&v8, 0xCu);
    }
    [(IDSDAccount *)self _registerAccount];
  }
}

- (void)_registerForDeviceCenterNotifications
{
  id v3 = +[FTDeviceSupport sharedInstance];
  unsigned int v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_registrationAbilityChanged:" name:FaceTimeDeviceRegistrationStateChangedNotification object:0];

  CFStringRef v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_identityRebuilt:" name:@"__kIDSRegistrationKeyManagerPrivateIdentityRebuiltNotification" object:0];

  BOOL v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_identityGenerated:" name:@"__kIDSRegistrationKeyManagerPrivateIdentityGeneratedNotification" object:0];

  unsigned int v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_keychainMigrationComplete:" name:@"__kIDSRegistrationKeyManagerKeychainMigrationComplete" object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_needsEncryptionIdentityRoll:" name:@"__kIDSRegistrationKeyManagerEncryptionIdentityNeedsRollNotification" object:0];
}

- (void)_deregisterDeviceCenterNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:FaceTimeDeviceRegistrationStateChangedNotification object:0];

  unsigned int v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"__kIDSRegistrationKeyManagerPrivateIdentityRebuiltNotification" object:0];

  CFStringRef v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"__kIDSRegistrationKeyManagerPrivateIdentityGeneratedNotification" object:0];

  BOOL v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"__kIDSRegistrationKeyManagerKeychainMigrationComplete" object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:@"__kIDSRegistrationKeyManagerEncryptionIdentityNeedsRollNotification" object:0];
}

- (void)_identityRebuilt:(id)a3
{
  unsigned int v4 = +[IMRGLog warning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1007178D4();
  }

  [(IDSDAccount *)self reregister];
}

- (void)_identityGenerated:(id)a3
{
  unsigned int v4 = +[IMRGLog warning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    BOOL v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "***** Notified that a new identity was generated -- re-registering { account: %@ }", (uint8_t *)&v5, 0xCu);
  }

  [(IDSDAccount *)self reregister];
}

- (void)_needsEncryptionIdentityRoll:(id)a3
{
  unsigned int v4 = +[IMRGLog warning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100717940();
  }

  [(IDSDAccount *)self reregister];
}

- (void)_keychainMigrationComplete:(id)a3
{
  unsigned int v4 = +[IMRGLog warning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "***** Keychain migration completed", (uint8_t *)&v16, 2u);
  }

  if ([(IDSDAccount *)self isEnabled])
  {
    [(IDSDAccount *)self _rebuildRegistrationInfo:1];
    *((unsigned char *)self + 81) |= 2u;
    [(IDSRegistration *)self->_registrationInfo setIsDisabled:0];
    int v5 = +[IDSRegistrationController sharedInstance];
    [v5 startTrackingActiveRegistration:self->_registrationInfo];

    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
    if (![(IDSRegistration *)self->_registrationInfo registrationType])
    {
      BOOL v6 = +[IDSSMSRegistrationCenter sharedInstance];
      [v6 notePhoneNumberRegistrationReset];
    }
    unsigned __int8 v7 = [(IDSDAccount *)self isDeviceRegistered];
    if ([(IDSRegistration *)self->_registrationInfo needsMigration])
    {
      id v8 = +[IMRGLog registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "****** Forcing Registration, needs migration ******", (uint8_t *)&v16, 2u);
      }

      *((unsigned char *)self + 80) |= 4u;
    }
    else
    {
      if (v7)
      {
        [(IDSDAccount *)self _checkRegistration];
LABEL_22:
        [(IDSDAccount *)self _refreshRegistration];
        return;
      }
      registrationInfo = self->_registrationInfo;
      if (registrationInfo)
      {
        if (![(IDSRegistration *)registrationInfo canRegister])
        {
          uint64_t v14 = +[IMRGLog registration];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = self->_registrationInfo;
            int v16 = 138412290;
            unsigned int v17 = (IDSDAccount *)v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "****** NOT Forcing Registration, we were active, but unregistered, however there's nothing to register: %@ ******", (uint8_t *)&v16, 0xCu);
          }

          goto LABEL_22;
        }
        registrationInfo = self->_registrationInfo;
      }
      long long v12 = [(IDSRegistration *)registrationInfo registrationCert];
      *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xFB | (4 * (v12 != 0));

      id v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        unsigned int v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "****** Forcing Registration, we were active, but unregistered: %@ ******", (uint8_t *)&v16, 0xCu);
      }
    }
    [(IDSDAccount *)self _registerAccount];
    goto LABEL_22;
  }
  unsigned int v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [(IDSDAccount *)self smallDescription];
    int v16 = 138412290;
    unsigned int v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Account %@ is disabled, ignoring...", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_updatePseudonymsFromEmailInfo:(id)a3
{
  id v4 = a3;
  long long v51 = self;
  [(IDSDAccount *)self _removeAllPseudonyms];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v4;
  id v44 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v66;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v66 != v43) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v49 = [v6 objectForKey:@"uri"];
        id v8 = [v6 objectForKey:@"pseudonyms"];
        if ([(IDSDAccount *)v51 accountType] != 1
          || ![v49 _appearsToBePhoneNumber]
          || (+[IDSRegistrationController registeredPhoneNumbers](IDSRegistrationController, "registeredPhoneNumbers"), unsigned int v9 = objc_claimAutoreleasedReturnValue(), v10 = [v9 containsObject:v49], v9, (v10 & 1) == 0))
        {
          long long v46 = v7;
          long long v47 = i;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v45 = v8;
          id v52 = v8;
          id v50 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
          if (v50)
          {
            uint64_t v48 = *(void *)v62;
            do
            {
              for (j = 0; j != v50; j = (char *)j + 1)
              {
                if (*(void *)v62 != v48) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v12 = *(void *)(*((void *)&v61 + 1) + 8 * (void)j);
                uint64_t v14 = [v52 objectForKey:v12];
                id v15 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v12];
                id v16 = objc_alloc((Class)IDSURI);
                unsigned int v17 = [v49 _stripFZIDPrefix];
                id v53 = [v16 initWithUnprefixedURI:v17];

                uint64_t v18 = [v14 objectForKey:@"featureId"];
                __int16 v55 = [v14 objectForKey:@"scopeId"];
                unsigned int v19 = [v14 objectForKey:@"expiry-epoch-seconds"];
                unsigned int v20 = v19;
                context = v13;
                if (v19)
                {
                  id v21 = v19;
                }
                else
                {
                  id v21 = [v14 objectForKey:@"expiry"];
                }
                unsigned int v22 = v21;
                __int16 v56 = (void *)v18;

                id v23 = [v14 objectForKey:@"allowedServices"];
                id v24 = objc_alloc_init((Class)NSMutableSet);
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                id v25 = v23;
                id v26 = [v25 countByEnumeratingWithState:&v57 objects:v69 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v58;
                  do
                  {
                    for (k = 0; k != v27; k = (char *)k + 1)
                    {
                      if (*(void *)v58 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * (void)k);
                      [v24 addObject:v30];
                      uint64_t v31 = [v25 objectForKey:v30];
                      [v24 addObjectsFromArray:v31];
                    }
                    id v27 = [v25 countByEnumeratingWithState:&v57 objects:v69 count:16];
                  }
                  while (v27);
                }

                long long v32 = [(IDSDAccount *)v51 service];
                id v33 = [v32 identifier];
                unsigned int v34 = [v24 containsObject:v33];

                long long v35 = v56;
                if (v34 && v56 && v22 && [v24 count])
                {
                  id v36 = objc_alloc((Class)IDSPseudonymProperties);
                  [v22 doubleValue];
                  double v38 = v37;
                  uint64_t v39 = [v24 allObjects];
                  id v40 = [v36 initWithFeatureID:v56 scopeID:v55 expiryEpoch:v39 allowedServices:v38];

                  id v41 = [objc_alloc((Class)IDSPseudonym) initWithURI:v15 maskedURI:v53 properties:v40];
                  [(IDSDAccount *)v51 _addPseudonym:v41];

                  long long v35 = v56;
                }
              }
              id v50 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
            }
            while (v50);
          }

          unsigned __int8 v7 = v46;
          i = v47;
          id v8 = v45;
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v44);
  }
}

- (void)_updateVettedAliases:(id)a3 emailInfo:(id)a4 addToCurrentHandlesIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = [(IDSDAccount *)self _uriDictionariesFromAccountInfo];
  id v11 = [(IDSDAccount *)self vettedAliases];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10020395C;
  v49[3] = &unk_100986298;
  v49[4] = self;
  id v12 = v8;
  id v50 = v12;
  id v13 = objc_msgSend(v10, "__imArrayByApplyingBlock:", v49);
  if (v12 && v11 && [v12 isEqualToArray:v11] && !objc_msgSend(v13, "count"))
  {
    id v33 = v12;
  }
  else
  {
    id v41 = v10;
    uint64_t v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(IDSDAccount *)self uniqueID];
      *(_DWORD *)buf = 138412802;
      id v57 = v12;
      __int16 v58 = 2112;
      long long v59 = v11;
      __int16 v60 = 2112;
      long long v61 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating vetted aliases to: %@     current: %@   ID: %@", buf, 0x20u);
    }
    id v16 = objc_alloc((Class)IDSHandleListUpdatedMetric);
    unsigned int v17 = [(IDSDAccount *)self service];
    uint64_t v18 = [v17 serviceName];
    id v19 = [v16 initWithService:v18];

    unsigned int v20 = +[IDSCoreAnalyticsLogger defaultLogger];
    uint64_t v39 = v19;
    [v20 logMetric:v19];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v40 = v11;
    id v21 = v11;
    id v22 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          if (([v12 containsObject:v26] & 1) == 0
            && ([v13 containsObject:v26] & 1) == 0)
          {
            [(IDSDAccount *)self markAsUnvettedAlias:v26];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v23);
    }

    [(IDSDAccount *)self _removeAliases:v13 withReason:2];
    id v42 = objc_alloc_init((Class)NSMutableArray);
    if ([v12 count])
    {
      unint64_t v27 = 0;
      char v44 = 0;
      uint64_t v43 = kIDSServiceDefaultsAliasIsUserVisibleKey;
      do
      {
        uint64_t v28 = [v12 objectAtIndexedSubscript:v27];
        if ((unint64_t)[v9 count] <= v27)
        {
          long long v32 = 0;
        }
        else
        {
          id v29 = [v9 objectAtIndexedSubscript:v27];
          uint64_t v30 = [v29 objectForKey:@"is-user-visible"];
          uint64_t v31 = (void *)v30;
          if (v30)
          {
            uint64_t v53 = v43;
            uint64_t v54 = v30;
            char v44 = 1;
            long long v32 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            if (([v31 BOOLValue] & 1) == 0)
            {
              [v42 addObject:v28];
              char v44 = 1;
            }
          }
          else
          {
            long long v32 = 0;
          }
        }
        [(IDSDAccount *)self _setValidationStatus:3 error:0xFFFFFFFFLL forAlias:v28 info:0 addToCurrentHandlesIfNeeded:v5 forceAdd:0 aliasProperties:v32];

        ++v27;
      }
      while (v27 < (unint64_t)[v12 count]);
    }
    else
    {
      char v44 = 0;
    }
    id v33 = [v12 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

    unsigned int v34 = +[IMRGLog registration];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "     Added: %@", buf, 0xCu);
    }

    long long v35 = +[IMRGLog registration];
    id v11 = v40;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v13;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "   Removed: %@", buf, 0xCu);
    }

    if ([v33 count])
    {
      uint64_t v51 = kIDSServiceDefaultsVettedAliasesKey;
      id v52 = v33;
      id v36 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      id v37 = [v36 mutableCopy];

      if (v44) {
        [v37 setObject:v42 forKey:kIDSServiceDefaultsInvisibleAliasesKey];
      }
      [(IDSDAccount *)self writeAccountDefaults:v37];
    }
    else
    {
      id v37 = +[NSNull null];
      double v38 = +[NSDictionary dictionaryWithObject:v37 forKey:kIDSServiceDefaultsVettedAliasesKey];
      [(IDSDAccount *)self writeAccountDefaults:v38];
    }
    unsigned __int8 v10 = v41;
  }
}

- (void)_checkRegistration
{
  if (self->_registrationInfo)
  {
    id v3 = +[IDSRegistrationKeyManager sharedInstance];
    unsigned int v4 = [v3 requiresKeychainMigration];

    BOOL v5 = (id *)IMRGLog_ptr;
    if (v4)
    {
      BOOL v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1007179AC();
      }
      goto LABEL_59;
    }
    unsigned __int8 v7 = [(IDSRegistration *)self->_registrationInfo serviceType];
    if (IDSIsFaceTimeRegistrationServiceType() || IDSIsCallingRegistrationServiceType())
    {
      uint64_t v8 = _IDSInvitationProtocolVersionNumber();
    }
    else
    {
      if (IDSIsiMessageRegistrationServiceType()) {
        _IDSiMessageProtocolVersionNumber();
      }
      else {
      uint64_t v8 = _IDSAlloyProtocolVersionNumber();
      }
    }
    BOOL v6 = v8;
    uint64_t v9 = [(IDSRegistration *)self->_registrationInfo applicationVersion];
    uint64_t v10 = [(IDSRegistration *)self->_registrationInfo IDSVersion];
    long long v47 = [(IDSRegistration *)self->_registrationInfo identityVersion];
    id v11 = [(IDSRegistration *)self->_registrationInfo keyPairSignature];
    if (!v11)
    {
      id v12 = +[IDSRegistrationKeyManager sharedInstance];
      unsigned int v13 = [v12 isMigratedKeyPairSignature];

      if (v13)
      {
        registrationInfo = self->_registrationInfo;
        id v15 = +[IDSRegistrationKeyManager sharedInstance];
        id v16 = [v15 keyPairSignature];
        [(IDSRegistration *)registrationInfo setKeyPairSignature:v16];

        BOOL v5 = (id *)IMRGLog_ptr;
        id v11 = [(IDSRegistration *)self->_registrationInfo keyPairSignature];
        [(IDSRegistration *)self->_registrationInfo saveToKeychain];
        unsigned int v17 = +[IMRGLog registration];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_100717A7C();
        }
      }
      else
      {
        id v11 = 0;
      }
    }
    if (!(v9 | v10))
    {
      uint64_t v18 = +[IMRGLog registration];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:

LABEL_41:
        LOBYTE(v33) = 1;
        goto LABEL_42;
      }
      *(_WORD *)buf = 0;
      id v19 = "Registration protocols are empty, this is probably a new install, we'll force a register";
      goto LABEL_20;
    }
    if (v10)
    {
      id v22 = _IDSIDProtocolVersionNumber();
      unsigned __int8 v23 = [(id)v10 isEqualToNumber:v22];

      if (v23)
      {
        uint64_t v24 = _IDSIdentityVersionNumber();
        unsigned __int8 v25 = [v47 isEqualToNumber:v24];

        if (v25)
        {
          if (v9)
          {
            BOOL v5 = (id *)IMRGLog_ptr;
            if ([(id)v9 isEqualToNumber:v6])
            {
              if (!v11) {
                goto LABEL_68;
              }
              uint64_t v26 = +[IDSRegistrationKeyManager sharedInstance];
              unint64_t v27 = [v26 keyPairSignature];
              unsigned __int8 v44 = [v11 isEqualToString:v27];

              BOOL v5 = (id *)IMRGLog_ptr;
              if ((v44 & 1) == 0)
              {
LABEL_68:
                id v40 = [*v5 registration];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  id v41 = +[IDSRegistrationKeyManager sharedInstance];
                  id v42 = [v41 keyPairSignature];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v49 = (uint64_t)v11;
                  __int16 v50 = 2112;
                  uint64_t v51 = v42;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Registration key pair signatures are different (%@ -> %@), clearing cert - forcing redentification", buf, 0x16u);

                  BOOL v5 = (id *)IMRGLog_ptr;
                }

                [(IDSRegistration *)self->_registrationInfo setRegistrationCert:0];
                goto LABEL_41;
              }
              uint64_t v28 = +[IDSRegistrationKeyManager sharedInstance];
              id v29 = [(IDSDAccount *)self service];
              unsigned int v45 = [v29 applicationKeyIndex];
              uint64_t v30 = [(IDSDAccount *)self service];
              unsigned int v46 = objc_msgSend(v28, "needsPublicDataUpdatedForKeyIndex:ktRegistrationKeyIndex:", v45, objc_msgSend(v30, "ktRegistrationDataIndex"));

              if (v46)
              {
                BOOL v5 = (id *)IMRGLog_ptr;
                uint64_t v18 = +[IMRGLog registration];
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_40;
                }
                *(_WORD *)buf = 0;
                id v19 = "Message Protection Public Data Needs Update, we'll force a re-register";
                goto LABEL_20;
              }
              if ([(IDSDAccount *)self isRegistered])
              {
                uint64_t v33 = [(IDSRegistration *)self->_registrationInfo registrationCert];
                if (!v33)
                {
LABEL_75:
                  BOOL v5 = (id *)IMRGLog_ptr;
LABEL_42:
                  if (IMGetCachedDomainBoolForKey())
                  {
                    unsigned int v34 = [*v5 warning];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
                      sub_100717A14();
                    }

                    long long v35 = +[IDSRegistrationReasonTracker sharedInstance];
                    id v36 = [(IDSRegistration *)self->_registrationInfo userUniqueIdentifier];
                    [v35 setPNRReason:7 forUserUniqueIdentifier:v36];

                    [(IDSRegistration *)self->_registrationInfo setAuthenticationCert:0];
                    if (![(IDSRegistration *)self->_registrationInfo registrationType])
                    {
                      id v37 = +[IDSPACStateTracker sharedInstance];
                      [v37 notePhoneAuthCertLost:2];
                    }
                    if (![(IDSRegistration *)self->_registrationInfo registrationType]) {
                      [(IDSRegistration *)self->_registrationInfo setMainID:0];
                    }
                    [(IDSRegistration *)self->_registrationInfo setUris:0];
                    [(IDSRegistration *)self->_registrationInfo setRegistrationCert:0];
                    [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:0];
                    BOOL v5 = (id *)IMRGLog_ptr;
                  }
                  else
                  {
                    if (!IMGetCachedDomainBoolForKey())
                    {
                      if ((v33 & 1) == 0)
                      {
LABEL_58:

LABEL_59:
                        return;
                      }
LABEL_55:
                      uint64_t v39 = [*v5 warning];
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
                        sub_1007179E0();
                      }

                      [(IDSDAccount *)self _registerAccount];
                      *((unsigned char *)self + 80) |= 4u;
                      goto LABEL_58;
                    }
                    double v38 = [*v5 warning];
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
                      sub_100717A48();
                    }
                  }
                  IMSetDomainBoolForKey();
                  goto LABEL_55;
                }
                uint64_t v43 = [(IDSRegistration *)self->_registrationInfo authenticationCert];

                if (!v43)
                {
                  BOOL v5 = (id *)IMRGLog_ptr;
                  uint64_t v18 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_40;
                  }
                  *(_WORD *)buf = 0;
                  id v19 = "Registered but missing an authentication cert, forcing re-register";
LABEL_20:
                  unsigned int v20 = v18;
                  uint32_t v21 = 2;
LABEL_21:
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
                  goto LABEL_40;
                }
              }
              LOBYTE(v33) = 0;
              goto LABEL_75;
            }
            uint64_t v18 = +[IMRGLog registration];
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v49 = v9;
            __int16 v50 = 2112;
            uint64_t v51 = v6;
            id v19 = "Registration application protocol versions are different, we'll force a server registration   (%@ -> %@)";
          }
          else
          {
            BOOL v5 = (id *)IMRGLog_ptr;
            uint64_t v18 = +[IMRGLog registration];
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v49 = 0;
            __int16 v50 = 2112;
            uint64_t v51 = v6;
            id v19 = "Registration application protocol version is empty, we'll force a server registration   (%@ -> %@)";
          }
          unsigned int v20 = v18;
          uint32_t v21 = 22;
          goto LABEL_21;
        }
        BOOL v5 = (id *)IMRGLog_ptr;
        uint64_t v18 = +[IMRGLog registration];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        uint64_t v31 = _IDSIdentityVersionNumber();
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = (uint64_t)v47;
        __int16 v50 = 2112;
        uint64_t v51 = v31;
        long long v32 = "Registration identity versions different, we'll force a server registration   (%@ -> %@)";
      }
      else
      {
        BOOL v5 = (id *)IMRGLog_ptr;
        uint64_t v18 = +[IMRGLog registration];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        uint64_t v31 = _IDSIDProtocolVersionNumber();
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = v10;
        __int16 v50 = 2112;
        uint64_t v51 = v31;
        long long v32 = "Registration identity protocol versions different, we'll force a server registration   (%@ -> %@)";
      }
    }
    else
    {
      uint64_t v18 = +[IMRGLog registration];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      uint64_t v31 = _IDSIDProtocolVersionNumber();
      *(_DWORD *)buf = 138412546;
      uint64_t v49 = 0;
      __int16 v50 = 2112;
      uint64_t v51 = v31;
      long long v32 = "Registration identity protocol version is empty, we'll force a server registration   (%@ -> %@)";
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v32, buf, 0x16u);

    BOOL v5 = (id *)IMRGLog_ptr;
    goto LABEL_40;
  }
}

- (void)setRegistrationStatus:(int)a3 error:(int64_t)a4 alertInfo:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v9 = sub_100148734(a4);
  uint64_t v10 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v11 = +[NSNumber numberWithInt:v6];
  if (v11) {
    CFDictionarySetValue(v10, kIDSServiceDefaultsRegistrationInfoStatusKey, v11);
  }

  id v12 = +[NSNumber numberWithInt:v9];
  if (v12) {
    CFDictionarySetValue(v10, kIDSServiceDefaultsRegistrationInfoErrorCodeKey, v12);
  }

  unsigned int v13 = +[NSNumber numberWithInteger:a4];
  if (v13) {
    CFDictionarySetValue(v10, kIDSServiceDefaultsRegistrationInfoInternalErrorCodeKey, v13);
  }

  if (v8) {
    CFDictionarySetValue(v10, kIDSServiceDefaultsRegistrationInfoAlertInfoKey, v8);
  }
  uint64_t v14 = +[NSDictionary dictionaryWithObject:v10 forKey:kIDSServiceDefaultsRegistrationInfoKey];
  [(IDSDAccount *)self _writeAccountDefaults:v14 force:1];

  if (v6 == 5 || v6 == -1)
  {
    int64_t v27 = a4;
    id v15 = [(NSMutableArray *)self->_setupHandlers count];
    if ((uint64_t)v15 - 1 >= 0)
    {
      uint64_t v16 = (uint64_t)v15;
      do
      {
        unsigned int v17 = [(NSMutableArray *)self->_setupHandlers objectAtIndex:--v16];
        id v18 = [v17 copy];

        id v19 = +[IMRGLog registration];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = objc_retainBlock(v18);
          *(_DWORD *)buf = 134217984;
          id v29 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling account setup handler %p", buf, 0xCu);
        }
        (*((void (**)(id, IDSDAccount *))v18 + 2))(v18, self);
      }
      while (v16 > 0);
    }
    setupHandlers = self->_setupHandlers;
    self->_setupHandlers = 0;

    if (v6 == -1)
    {
      unsigned __int8 v25 = +[NSDate date];
      uint64_t v26 = +[NSDictionary dictionaryWithObject:v25 forKey:kIDSServiceDefaultsLastRegistrationFailureDateKey];
      [(IDSDAccount *)self writeAccountDefaults:v26];

      unsigned __int8 v23 = +[NSNumber numberWithInteger:v27];
      +[NSDictionary dictionaryWithObject:v23 forKey:kIDSServiceDefaultsLastRegistrationFailureErrorKey];
    }
    else
    {
      id v22 = +[NSDictionary dictionaryWithObject:&__kCFBooleanTrue forKey:kIDSServiceDefaultsHasEverRegistered];
      [(IDSDAccount *)self writeAccountDefaults:v22];

      unsigned __int8 v23 = +[NSDate date];
      +[NSDictionary dictionaryWithObject:v23 forKey:kIDSServiceDefaultsLastRegistrationSuccessDateKey];
    uint64_t v24 = };
    [(IDSDAccount *)self writeAccountDefaults:v24];
  }
}

- (void)_updateRegistrationStatusWithError:(int64_t)a3 info:(id)a4
{
  id v6 = a4;
  if ((id)[(IDSRegistration *)self->_registrationInfo registrationStatus] != (id)8) {
    goto LABEL_20;
  }
  if ([(IDSRegistration *)self->_registrationInfo registrationType] != 1)
  {
    if ([(IDSRegistration *)self->_registrationInfo registrationType]
      && [(IDSRegistration *)self->_registrationInfo registrationType] != 2)
    {
      goto LABEL_12;
    }
    unsigned __int8 v7 = [(IDSRegistration *)self->_registrationInfo phoneNumber];
    uint64_t v9 = IMSingleObjectArray();
    [(IDSDAccount *)self _updateVettedAliases:v9 emailInfo:0 addToCurrentHandlesIfNeeded:1];

    goto LABEL_11;
  }
  unsigned __int8 v7 = [(IDSDAccount *)self aliases];
  if (![v7 count]
    && ![(IDSDAccount *)self shouldAutoRegisterAllHandles]
    && ![(IDSDAccount *)self shouldRegisterUsingDSHandle])
  {

    goto LABEL_62;
  }
  id v8 = [(IDSDAccount *)self dsHandle];
  if (!v8)
  {
    unsigned int v53 = [(IDSDAccount *)self shouldRegisterUsingDSHandle];

    if (!v53) {
      goto LABEL_12;
    }
LABEL_62:
    __int16 v60 = +[IMRGLog registration];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      long long v61 = [(IDSDAccount *)self aliases];
      long long v62 = [(IDSDAccount *)self dsHandle];
      *(_DWORD *)buf = 138412546;
      long long v66 = v61;
      __int16 v67 = 2112;
      long long v68 = v62;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "We were registered but we have no aliases %@ or dsHandle %@", buf, 0x16u);
    }
    long long v63 = [(IDSRegistration *)self->_registrationInfo authenticationToken];

    if (v63) {
      uint64_t v64 = 6;
    }
    else {
      uint64_t v64 = 0;
    }
    [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:v64];
    goto LABEL_12;
  }

LABEL_11:
LABEL_12:
  uint64_t v10 = +[IDSRegistrationKeyManager sharedInstance];
  unsigned __int8 v11 = [v10 requiresKeychainMigration];

  if (v11) {
    goto LABEL_20;
  }
  id v12 = +[IDSRegistrationKeyManager sharedInstance];
  if ([v12 identityPrivateKey])
  {
    unsigned int v13 = +[IDSRegistrationKeyManager sharedInstance];
    id v14 = [v13 identityPublicKey];

    if (v14) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v15 = +[IMRGLog registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v66 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "We were registered, but we're missing our private/public identity keys... will reregister: %@", buf, 0xCu);
  }

  im_dispatch_after_primary_queue();
LABEL_20:
  switch([(IDSRegistration *)self->_registrationInfo registrationStatus])
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      unsigned int v17 = +[IMRGLog registration];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        long long v66 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting account: %@ to failed registration", buf, 0xCu);
      }
      [(IDSDAccount *)self _notifyListenersAndSetDependentRegistrations:0 onRegistrationInfo:self->_registrationInfo];
      [(IDSRegistration *)self->_registrationInfo saveToKeychain];
      id v19 = +[IDSHeartbeatCenter sharedInstance];
      [v19 removeRegistrationInfo:self->_registrationInfo];

      id v20 = +[IDSRegistrationController sharedInstance];
      [v20 cancelActionsForRegistrationInfo:self->_registrationInfo];

      uint32_t v21 = +[IDSRegistrationController sharedInstance];
      [v21 stopTrackingRegistration:self->_registrationInfo];

      id v22 = +[IDSDeviceHeartbeatCenter sharedInstance];
      [v22 accountsChanged];

      [(IDSDAccount *)self setRegistrationStatus:0xFFFFFFFFLL error:a3 alertInfo:v6];
      goto LABEL_45;
    case 0:
      unsigned __int8 v23 = +[IMRGLog registration];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        long long v66 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Setting account: %@ to unregistered", buf, 0xCu);
      }
      if (_os_feature_enabled_impl()
        && ((id)[(IDSDAccount *)self registrationError] == (id)47
         || (id)[(IDSDAccount *)self registrationError] == (id)49
         || (id)[(IDSDAccount *)self registrationError] == (id)48))
      {
        unsigned __int8 v25 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Currently unregistered due to KT server rejection. Updating error.", buf, 2u);
        }
      }
      else
      {
        a3 = -1;
      }
      [(IDSDAccount *)self setRegistrationStatus:1 error:a3 alertInfo:v6];
      uint64_t v54 = +[IDSHeartbeatCenter sharedInstance];
      [v54 removeRegistrationInfo:self->_registrationInfo];

      __int16 v55 = +[IDSRegistrationController sharedInstance];
      [v55 stopTrackingRegistration:self->_registrationInfo];

      __int16 v56 = +[IDSDeviceHeartbeatCenter sharedInstance];
      [v56 accountsChanged];

      [(IDSDAccount *)self _updatePhoneNumberCallerID];
      [(IDSRegistration *)self->_registrationInfo setRegistrationCert:0];
      [(IDSDAccount *)self _notifyListenersAndSetDependentRegistrations:0 onRegistrationInfo:self->_registrationInfo];
      [(IDSRegistration *)self->_registrationInfo saveToKeychain];
      id v57 = [(IDSDAccount *)self service];
      __int16 v58 = [v57 identifier];
      unsigned int v59 = [v58 isEqualToIgnoringCase:@"com.apple.private.alloy.icloudpairing"];

      if (v59)
      {
        long long v35 = [(IDSDAccount *)self accountController];
        [v35 updateDevicePropertiesWithDevices:0];
        break;
      }
      goto LABEL_45;
    case 1:
      uint64_t v16 = +[IMRGLog registration];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      uint64_t v26 = [(IDSDAccount *)self uniqueID];
      unsigned int v27 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
      *(_DWORD *)buf = 138412546;
      long long v66 = v26;
      __int16 v67 = 1024;
      LODWORD(v68) = v27;
      uint64_t v28 = "Setting account: %@ to authenticating  (Reg status: %d) (Waiting for restore)";
      goto LABEL_41;
    case 2:
      uint64_t v16 = +[IMRGLog registration];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      uint64_t v26 = [(IDSDAccount *)self uniqueID];
      unsigned int v29 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
      *(_DWORD *)buf = 138412546;
      long long v66 = v26;
      __int16 v67 = 1024;
      LODWORD(v68) = v29;
      uint64_t v28 = "Setting account: %@ to authenticating  (Reg status: %d) (Waiting for push token)";
      goto LABEL_41;
    case 3:
    case 4:
      uint64_t v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      goto LABEL_42;
    case 5:
      uint64_t v16 = +[IMRGLog registration];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
LABEL_40:
      uint64_t v26 = [(IDSDAccount *)self uniqueID];
      unsigned int v30 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
      *(_DWORD *)buf = 138412546;
      long long v66 = v26;
      __int16 v67 = 1024;
      LODWORD(v68) = v30;
      uint64_t v28 = "Setting account: %@ to authenticating  (Reg status: %d)";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v28, buf, 0x12u);

LABEL_42:
      uint64_t v31 = self;
      uint64_t v32 = 2;
LABEL_43:
      [(IDSDAccount *)v31 setRegistrationStatus:v32 error:-1 alertInfo:v6];
      uint64_t v33 = +[IDSHeartbeatCenter sharedInstance];
      [v33 removeRegistrationInfo:self->_registrationInfo];

      unsigned int v34 = +[IDSRegistrationController sharedInstance];
      [v34 stopTrackingRegistration:self->_registrationInfo];

      long long v35 = +[IDSDeviceHeartbeatCenter sharedInstance];
      [v35 accountsChanged];
      break;
    case 6:
      id v37 = +[IMRGLog registration];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        double v38 = [(IDSDAccount *)self uniqueID];
        unsigned int v39 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
        *(_DWORD *)buf = 138412546;
        long long v66 = v38;
        __int16 v67 = 1024;
        LODWORD(v68) = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Setting account: %@ to authenticated  (Reg status: %d)", buf, 0x12u);
      }
      uint64_t v31 = self;
      uint64_t v32 = 3;
      goto LABEL_43;
    case 7:
      id v40 = +[IMRGLog registration];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = [(IDSDAccount *)self uniqueID];
        unsigned int v42 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
        *(_DWORD *)buf = 138412546;
        long long v66 = v41;
        __int16 v67 = 1024;
        LODWORD(v68) = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Setting account: %@ to registering  (Reg status: %d)", buf, 0x12u);
      }
      [(IDSDAccount *)self setRegistrationStatus:4 error:-1 alertInfo:v6];
      uint64_t v43 = +[IDSHeartbeatCenter sharedInstance];
      [v43 removeRegistrationInfo:self->_registrationInfo];

      unsigned __int8 v44 = +[IDSRegistrationController sharedInstance];
      [v44 stopTrackingRegistration:self->_registrationInfo];

      unsigned int v45 = +[IDSDeviceHeartbeatCenter sharedInstance];
      [v45 accountsChanged];

      [(IDSDAccount *)self _updatePhoneNumberCallerID];
      goto LABEL_45;
    case 8:
      unsigned int v46 = +[IMRGLog registration];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        long long v47 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        long long v66 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Setting account: %@ to registered", buf, 0xCu);
      }
      [(IDSDAccount *)self setRegistrationStatus:5 error:-1 alertInfo:v6];
      [(IDSDAccount *)self _updatePhoneNumberCallerID];
      long long v48 = +[IDSHeartbeatCenter sharedInstance];
      [v48 addRegistrationInfo:self->_registrationInfo];

      uint64_t v49 = +[IDSRegistrationController sharedInstance];
      [v49 startTrackingRegistration:self->_registrationInfo];

      __int16 v50 = +[IDSDeviceHeartbeatCenter sharedInstance];
      [v50 accountsChanged];

      if ([(IDSDAccount *)self accountType]) {
        goto LABEL_45;
      }
      long long v35 = [(IDSDAccount *)self accountController];
      uint64_t v51 = [(IDSDAccount *)self service];
      id v52 = [v35 appleIDAccountOnService:v51];
      [v52 _cleanupAccount];

      break;
    default:
      goto LABEL_45;
  }

LABEL_45:
  [(IDSDAccount *)self _refreshRegistration];
  id v36 = [(IDSDAccount *)self accountController];
  [v36 authKitAccountUpdate:self->_registrationInfo];
}

- (BOOL)_stopRegistrationAgent
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    registrationInfo = self->_registrationInfo;
    int v13 = 138412290;
    id v14 = registrationInfo;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "  Stop Registration Agent for: %@", (uint8_t *)&v13, 0xCu);
  }

  if (self->_registrationInfo)
  {
    BOOL v5 = +[IDSRegistrationController sharedInstance];
    [v5 cancelActionsForRegistrationInfo:self->_registrationInfo];

    id v6 = +[IDSRegistrationController sharedInstance];
    [v6 stopTrackingRegistration:self->_registrationInfo];

    unsigned __int8 v7 = +[IDSHeartbeatCenter sharedInstance];
    [v7 removeRegistrationInfo:self->_registrationInfo];

    id v8 = [(IDSDAccount *)self service];
    uint64_t v9 = [v8 identifier];
    unsigned int v10 = [v9 isEqualToIgnoringCase:@"com.apple.private.alloy.icloudpairing"];

    if (v10)
    {
      unsigned __int8 v11 = [(IDSDAccount *)self accountController];
      [v11 updateDevicePropertiesWithDevices:0];
    }
  }
  return 1;
}

- (void)_reAuthenticate
{
  [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:0];
  [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:0];
  [(IDSRegistration *)self->_registrationInfo saveToKeychain];

  [(IDSDAccount *)self reIdentify];
}

- (void)_reregisterAndReProvision
{
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v3 = +[IMRGLog warning];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v3 = +[IMRGLog warning];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100717AF0(self);
    }
LABEL_7:

    return;
  }
  unsigned int v4 = [(IDSDAccount *)self isAdHocAccount];
  BOOL v5 = +[IMRGLog registration];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      unsigned __int8 v7 = [(IDSDAccount *)self primaryAccount];
      int v9 = 138412290;
      unsigned int v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Forwarding to Primary: %@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(IDSDAccount *)self primaryAccount];
    [v8 _reregisterAndReProvision];
  }
  else
  {
    if (v6)
    {
      int v9 = 138412290;
      unsigned int v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Re-registering and re-provisioning: %@", (uint8_t *)&v9, 0xCu);
    }

    [(IDSRegistration *)self->_registrationInfo setAuthenticationCert:0];
    [(IDSRegistration *)self->_registrationInfo setRegistrationCert:0];
    [(IDSRegistration *)self->_registrationInfo setUris:0];
    [(IDSRegistration *)self->_registrationInfo saveToKeychain];
    [(IDSDAccount *)self _registerAccount];
  }
}

- (void)_removeAuthenticationCredentials
{
}

- (void)_removeAuthenticationCredentialsIncludingAuthToken:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "  ** Removing authentication credentials **", (uint8_t *)&v14, 2u);
  }

  if (![(IDSDAccount *)self isRegistrationActive])
  {
    BOOL v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_9;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    BOOL v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717C04(self);
    }
LABEL_9:

    return;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    unsigned __int8 v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(IDSDAccount *)self primaryAccount];
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " => Forwarding to Primary: %@", (uint8_t *)&v14, 0xCu);
    }
    int v9 = [(IDSDAccount *)self primaryAccount];
    [v9 _removeAuthenticationCredentials];
  }
  else
  {
    unsigned int v10 = [(IDSDAccount *)self systemMonitor];
    unsigned int v11 = [v10 isUnderFirstDataProtectionLock];

    if (v11)
    {
      id v12 = +[IMRGLog registration];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device is still under first data protection lock, changing request to a deferred re-identification", (uint8_t *)&v14, 2u);
      }

      *((unsigned char *)self + 80) |= 0x80u;
    }
    else
    {
      [(IDSRegistration *)self->_registrationInfo setAuthenticationCert:0];
      if (![(IDSRegistration *)self->_registrationInfo registrationType])
      {
        int v13 = +[IDSPACStateTracker sharedInstance];
        [v13 notePhoneAuthCertLost:3];
      }
      if (![(IDSRegistration *)self->_registrationInfo registrationType]) {
        [(IDSRegistration *)self->_registrationInfo setMainID:0];
      }
      [(IDSRegistration *)self->_registrationInfo setRegistrationCert:0];
      [(IDSRegistration *)self->_registrationInfo setUris:0];
      if (v3) {
        [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:0];
      }
      [(IDSRegistration *)self->_registrationInfo saveToKeychain];
    }
  }
}

- (void)_reregisterAndReidentify:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v17 = _os_activity_create((void *)&_mh_execute_header, "Daemon reregister/reidentify account", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v17, &state);
  if (v3)
  {
    BOOL v5 = +[IMRGLog registration];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    BOOL v6 = "  ** Re-identifying from beginning **";
  }
  else
  {
    BOOL v5 = +[IMRGLog registration];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    BOOL v6 = "  ** Re-registering **";
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_7:

  if (![(IDSDAccount *)self isRegistrationActive])
  {
    unsigned __int8 v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_100717CE8();
    }
    goto LABEL_14;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    unsigned __int8 v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_100717C94();
    }
LABEL_14:

    goto LABEL_15;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(IDSDAccount *)self primaryAccount];
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " => Forwarding to Primary: %@", buf, 0xCu);
    }
    unsigned int v10 = [(IDSDAccount *)self primaryAccount];
    [v10 _reregisterAndReidentify:v3];
  }
  else
  {
    unsigned int v11 = [(IDSDAccount *)self systemMonitor];
    unsigned int v12 = [v11 isUnderFirstDataProtectionLock];

    if (v12)
    {
      int v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device is still under first data protection lock, deferring request", buf, 2u);
      }

      if (v3)
      {
        uint64_t v14 = 80;
        char v15 = *((unsigned char *)self + 80) | 0x80;
      }
      else
      {
        uint64_t v14 = 81;
        char v15 = *((unsigned char *)self + 81) | 1;
      }
      *((unsigned char *)&self->super.isa + v14) = v15;
    }
    else
    {
      if (v3) {
        [(IDSDAccount *)self _removeAuthenticationCredentials];
      }
      [(IDSDAccount *)self _registerAccount];
    }
  }
LABEL_15:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_reregister
{
}

- (void)systemDidFinishMigration
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migration is complete, checking to see if we should re-register now", v4, 2u);
  }

  [(IDSDAccount *)self _rebuildRegistrationInfo:1];
  [(IDSDAccount *)self _reregister];
}

- (void)systemDidStartBackup
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System started backup: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)systemRestoreStateDidChange
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unsigned __int8 v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System restore state changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [(IDSDAccount *)self _rebuildRegistrationInfo:1];
  [(IDSDAccount *)self _reregister];
  if ((*((unsigned char *)self + 80) & 0x20) != 0)
  {
    int v4 = +[IMRGLog GDR];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(IDSDAccount *)self uniqueID];
      int v6 = 138412290;
      unsigned __int8 v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "We had a pending GDR, kicking it off now: %@", (uint8_t *)&v6, 0xCu);
    }
    *((unsigned char *)self + 80) &= ~0x20u;
    [(IDSDAccount *)self _issueDependentCheck];
  }
}

- (void)activateRegistration
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v47 = _os_activity_create((void *)&_mh_execute_header, "Daemon activate account registration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v47, &state);
  if (![(IDSDAccount *)self isAdHocAccount] && [(IDSDAccount *)self accountType] != 2)
  {
    if ((*((unsigned char *)self + 81) & 2) != 0) {
      goto LABEL_4;
    }
    [(IDSDAccount *)self _registerForDeviceCenterNotifications];
    int v4 = [(IDSDAccount *)self systemMonitor];
    [v4 addListener:self];

    BOOL v5 = +[IDSRegistrationController sharedInstance];
    [v5 addListener:self];

    int v6 = +[IDSSMSRegistrationCenter sharedInstance];
    [v6 addListener:self];

    unsigned __int8 v7 = +[IDSAppleIDRegistrationCenter sharedInstance];
    [v7 addListener:self];

    id v8 = [(IDSDAccount *)self registrationCenter];
    [v8 addListener:self];

    int v9 = objc_alloc_init(IDSRegistrationPushHandler);
    pushHandler = self->_pushHandler;
    self->_pushHandler = v9;

    [(IDSRegistrationPushHandler *)self->_pushHandler addListener:self];
    [(IDSDAccount *)self _acceptIncomingPushes];
    unsigned int v11 = +[IDSDRegistrationPushManager sharedInstance];
    [v11 startTrackingRegisteredAccountID:self->_uniqueID];

    if (IMGetCachedDomainBoolForKey())
    {
      unsigned int v12 = +[IMRGLog warning];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_100717DE4();
      }

      int v13 = +[IDSRegistrationKeychainManager sharedInstance];
      [v13 removeAllRegistrations];

      IMSetDomainBoolForKey();
    }
    [(IDSDAccount *)self _rebuildRegistrationInfo:1];
    uint64_t v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v45 = v3;
      char v15 = [(IDSDAccount *)self uniqueID];
      id v16 = [(IDSDAccount *)self loginID];
      unsigned int v17 = [(IDSDAccount *)self service];
      id v18 = [v17 identifier];
      if ([(IDSRegistration *)self->_registrationInfo registrationType] == 1) {
        CFStringRef v19 = @"AppleID";
      }
      else {
        CFStringRef v19 = @"Phone Number";
      }
      id v20 = +[FTDeviceSupport sharedInstance];
      uint32_t v21 = [v20 deviceInformationString];
      registrationInfo = self->_registrationInfo;
      *(_DWORD *)buf = 138413570;
      uint64_t v49 = v15;
      __int16 v50 = 2112;
      id v51 = v16;
      __int16 v52 = 2112;
      id v53 = v18;
      __int16 v54 = 2112;
      CFStringRef v55 = v19;
      __int16 v56 = 2112;
      id v57 = v21;
      __int16 v58 = 2112;
      unsigned int v59 = registrationInfo;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "*** Activating registration: %@   Login: %@   Service: %@   Type: %@   Environment: %@   Registration: %@", buf, 0x3Eu);

      BOOL v3 = v45;
    }

    p_registrationInfo = &self->_registrationInfo;
    if (self->_registrationInfo
      && !+[IDSRegistrationController systemSupportsRegistrationInfo:](IDSRegistrationController, "systemSupportsRegistrationInfo:"))
    {
      uint64_t v31 = +[IMRGLog warning];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        sub_100717D68((uint64_t *)&self->_registrationInfo, v31);
      }

      uint64_t v32 = +[IMRGLog warning];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_100717D34();
      }

      unsigned int v27 = [(IDSDAccount *)self accountController];
      uint64_t v28 = [(IDSDAccount *)self uniqueID];
      [(IDSDAccount *)v27 disableAccountWithUniqueID:v28];
      goto LABEL_51;
    }
    *((unsigned char *)self + 81) |= 2u;
    [(IDSRegistration *)*p_registrationInfo setIsDisabled:0];
    uint64_t v24 = +[IDSRegistrationController sharedInstance];
    [v24 startTrackingActiveRegistration:*p_registrationInfo];

    unsigned __int8 v25 = +[IDSServerBag sharedInstance];
    uint64_t v26 = [v25 bagURL];

    if (v26)
    {
      unsigned int v27 = [v26 host];
      uint64_t v28 = [v26 port];
      unsigned int v29 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v27, kIDSServiceDefaultsServerHostKey, v28, kIDSServiceDefaultsServerPortKey, 0);
      [(IDSDAccount *)self _writeAccountDefaults:v29 force:1];
      unsigned int v30 = +[IMRGLog registration];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = v27;
        __int16 v50 = 2112;
        id v51 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Using server: %@:%@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Couldn't get bag url", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      unsigned int v27 = 0;
      uint64_t v28 = 0;
    }
    unsigned int v34 = +[IMRGLog registration];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Priming Server bag", buf, 2u);
    }

    id v35 = +[IDSServerBag sharedInstance];
    id v36 = +[IMRGLog registration];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "...done", buf, 2u);
    }

    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
    if (![(IDSRegistration *)*p_registrationInfo registrationType])
    {
      id v37 = +[IDSSMSRegistrationCenter sharedInstance];
      [v37 notePhoneNumberRegistrationReset];
    }
    unsigned __int8 v38 = [(IDSDAccount *)self isDeviceRegistered];
    if ([(IDSRegistration *)*p_registrationInfo needsMigration])
    {
      unsigned int v39 = +[IMRGLog registration];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "****** Forcing Registration, needs migration ******", buf, 2u);
      }

      *((unsigned char *)self + 80) |= 4u;
    }
    else
    {
      if (v38)
      {
        [(IDSDAccount *)self _checkRegistration];
LABEL_50:
        [(IDSDAccount *)self _refreshRegistration];

LABEL_51:
        goto LABEL_4;
      }
      id v40 = *p_registrationInfo;
      if (*p_registrationInfo)
      {
        if (![(IDSRegistration *)v40 canRegister])
        {
          uint64_t v43 = +[IMRGLog registration];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v44 = (IDSDAccount *)*p_registrationInfo;
            *(_DWORD *)buf = 138412290;
            uint64_t v49 = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "****** NOT Forcing Registration, we were active, but unregistered, however there's nothing to register: %@ ******", buf, 0xCu);
          }

          goto LABEL_50;
        }
        id v40 = *p_registrationInfo;
      }
      id v41 = [(IDSRegistration *)v40 registrationCert];
      *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xFB | (4 * (v41 != 0));

      unsigned int v42 = +[IMRGLog registration];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = self;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "****** Forcing Registration, we were active, but unregistered: %@ ******", buf, 0xCu);
      }
    }
    [(IDSDAccount *)self _registerAccount];
    goto LABEL_50;
  }
  *((unsigned char *)self + 81) |= 2u;
LABEL_4:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)deactivateRegistration
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = _os_activity_create((void *)&_mh_execute_header, "Daemon deactivate account registration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v32, &state);
  if ([(IDSDAccount *)self isAdHocAccount] || [(IDSDAccount *)self accountType] == 2)
  {
    *((unsigned char *)self + 81) &= ~2u;
  }
  else if ((*((unsigned char *)self + 81) & 2) != 0)
  {
    BOOL v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v30 = [(IDSDAccount *)self uniqueID];
      id v4 = [(IDSDAccount *)self loginID];
      BOOL v5 = [(IDSDAccount *)self service];
      id v6 = [v5 identifier];
      if ([(IDSRegistration *)self->_registrationInfo registrationType] == 1) {
        CFStringRef v7 = @"AppleID";
      }
      else {
        CFStringRef v7 = @"Phone Number";
      }
      id v8 = +[FTDeviceSupport sharedInstance];
      int v9 = [v8 deviceInformationString];
      registrationInfo = self->_registrationInfo;
      *(_DWORD *)buf = 138413570;
      unsigned int v34 = v30;
      __int16 v35 = 2112;
      id v36 = v4;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      CFStringRef v40 = v7;
      __int16 v41 = 2112;
      unsigned int v42 = v9;
      __int16 v43 = 2112;
      unsigned __int8 v44 = registrationInfo;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** Deactivating registration: %@   Login: %@   Service: %@   Type: %@   Environment: %@   Registration: %@", buf, 0x3Eu);
    }
    unsigned int v11 = +[IDSRegistrationController sharedInstance];
    [v11 stopTrackingActiveRegistration:self->_registrationInfo];

    unsigned int v12 = +[IDSSMSRegistrationCenter sharedInstance];
    [v12 cancelActionsForRegistrationInfo:self->_registrationInfo];

    [(IDSRegistration *)self->_registrationInfo setVettedEmails:0];
    [(IDSRegistration *)self->_registrationInfo saveToKeychain];
    if ([(IDSDAccount *)self isDeviceRegistered])
    {
      int v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = self->_registrationInfo;
        *(_DWORD *)buf = 138412290;
        unsigned int v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "*** simply marking account as unregistered: %@", buf, 0xCu);
      }

      [(IDSDAccount *)self _unregisterAccount];
    }
    else
    {
      char v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = self->_registrationInfo;
        *(_DWORD *)buf = 138412290;
        unsigned int v34 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "*** removing registration from keychain: %@", buf, 0xCu);
      }

      [(IDSRegistration *)self->_registrationInfo removeFromKeychain];
    }
    [(IDSDAccount *)self _stopRegistrationAgent];
    [(IDSDAccount *)self _ignoreIncomingPushes];
    unsigned int v17 = +[IDSDRegistrationPushManager sharedInstance];
    [v17 stopTrackingRegisteredAccountID:self->_uniqueID];

    *((unsigned char *)self + 81) &= ~2u;
    [(IDSRegistration *)self->_registrationInfo setIsDisabled:1];
    [(IDSDAccount *)self _refreshRegistration];
    id v18 = +[IDSRegistrationController sharedInstance];
    [v18 removeListener:self];

    CFStringRef v19 = +[IDSSMSRegistrationCenter sharedInstance];
    [v19 removeListener:self];

    id v20 = +[IDSAppleIDRegistrationCenter sharedInstance];
    [v20 removeListener:self];

    uint32_t v21 = [(IDSDAccount *)self registrationCenter];
    [v21 removeListener:self];

    id v22 = [(IDSDAccount *)self systemMonitor];
    [v22 removeListener:self];

    [(IDSDAccount *)self _deregisterDeviceCenterNotifications];
    unsigned __int8 v23 = +[IDSRestoreMonitor sharedInstance];
    [v23 removeTarget:self];

    [(IDSRegistrationPushHandler *)self->_pushHandler removeListener:self];
    pushHandler = self->_pushHandler;
    self->_pushHandler = 0;

    dateOfLastHandlesCheck = self->_dateOfLastHandlesCheck;
    self->_dateOfLastHandlesCheck = 0;

    uint64_t v26 = self->_registrationInfo;
    self->_registrationInfo = 0;

    setupHandlers = self->_setupHandlers;
    self->_setupHandlers = 0;

    [(IDSDAccount *)self _resetVariables];
    uint64_t v28 = +[NSNull null];
    unsigned int v29 = +[NSDictionary dictionaryWithObject:v28 forKey:kIDSServiceDefaultsLastGDRDateKey];
    [(IDSDAccount *)self writeAccountDefaults:v29];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_authenticateAccount
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[FTDeviceSupport sharedInstance];
    BOOL v5 = [v4 deviceInformationString];
    int v14 = 138412546;
    char v15 = v5;
    __int16 v16 = 2112;
    unsigned int v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, " => Authenticate (Environment: %@) %@", (uint8_t *)&v14, 0x16u);
  }
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100717E18(self);
      }
    }
    else if ([(IDSDAccount *)self accountType] == 2)
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100717EA8(self);
      }
    }
    else if ([(IDSRegistration *)self->_registrationInfo registrationType])
    {
      CFStringRef v7 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];

      id v6 = +[IMRGLog registration];
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v8)
        {
          registrationInfo = self->_registrationInfo;
          int v14 = 138412290;
          char v15 = registrationInfo;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting auth for: %@", (uint8_t *)&v14, 0xCu);
        }

        unsigned int v10 = self->_registrationInfo;
        unsigned int v11 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
        [(IDSRegistration *)v10 setPushToken:v11];

        [(IDSRegistration *)self->_registrationInfo setRunningSimpleAuthentication:1];
        if ([(IDSRegistration *)self->_registrationInfo registrationStatus] <= 6)
        {
          [(IDSRegistration *)self->_registrationInfo setVettedEmails:0];
          [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:5];
        }
        [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
        id v6 = +[IDSAppleIDRegistrationCenter sharedInstance];
        [v6 authenticateRegistration:self->_registrationInfo requireSilentAuth:[(IDSDAccount *)self _isPasswordPromptPermissibleDuringAuthentication] ^ 1];
      }
      else if (v8)
      {
        unsigned int v12 = [(IDSRegistration *)self->_registrationInfo pushToken];
        int v13 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
        int v14 = 138412546;
        char v15 = v12;
        __int16 v16 = 2112;
        unsigned int v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to authenticate, but haven't received push token yet, waiting... (Mine: %@  APSD: %@)", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100717F38();
      }
    }
  }
  else
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
  }
}

- (BOOL)_isPasswordPromptPermissibleDuringAuthentication
{
  BOOL v3 = [(IDSDAccount *)self service];
  id v4 = [(IDSDAccount *)self serviceController];
  BOOL v5 = [v4 iTunesService];

  if (v3 != v5) {
    return 1;
  }
  CFStringRef v7 = +[FTDeviceSupport sharedInstance];
  unint64_t v8 = (unint64_t)[v7 deviceType];

  if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 6) {
    return 0;
  }

  return [(IDSDAccount *)self hasEverRegistered];
}

- (void)authenticateAccount
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[FTDeviceSupport sharedInstance];
    BOOL v5 = [v4 deviceInformationString];
    int v7 = 138412290;
    unint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client requested re-authenticate (Environment: %@)", (uint8_t *)&v7, 0xCu);
  }
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_9;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717F6C(self);
    }
LABEL_9:

    return;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717FFC(self);
    }
    goto LABEL_9;
  }
  [(IDSDAccount *)self _authenticateAccount];
}

- (void)_retryRegister
{
  BOOL v3 = +[IDSRestoreMonitor sharedInstance];
  [v3 removeTarget:self];

  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retrying registration, to check for backup state", (uint8_t *)&v7, 2u);
  }

  [(IDSDAccount *)self _registerAccount];
  if ((*((unsigned char *)self + 80) & 0x20) != 0)
  {
    BOOL v5 = +[IMRGLog GDR];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(IDSDAccount *)self uniqueID];
      int v7 = 138412290;
      unint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We had a pending GDR, kicking it off now: %@", (uint8_t *)&v7, 0xCu);
    }
    *((unsigned char *)self + 80) &= ~0x20u;
    [(IDSDAccount *)self _issueDependentCheck];
  }
}

- (BOOL)_migrateRegistrationIfNeeded
{
  if ([(IDSRegistration *)self->_registrationInfo registrationType] != 1) {
    return 0;
  }
  BOOL v3 = [(IDSRegistration *)self->_registrationInfo migrationContext];

  if (!v3) {
    return 0;
  }
  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    registrationInfo = self->_registrationInfo;
    *(_DWORD *)buf = 138412290;
    unsigned int v45 = registrationInfo;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating Apple ID based registration info: %@", buf, 0xCu);
  }

  id v6 = [(IDSDAccount *)self loginID];
  id v7 = [v6 _FZBestGuessFZIDType];

  BOOL v8 = v7 != 0;
  if (v7)
  {
    int v9 = self->_registrationInfo;
    unsigned int v10 = [(IDSDAccount *)self loginID];
    [(IDSRegistration *)v9 setEmail:v10];

    unsigned int v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = self->_registrationInfo;
      int v13 = [(IDSDAccount *)self loginID];
      *(_DWORD *)buf = 138412546;
      unsigned int v45 = v12;
      __int16 v46 = 2112;
      long long v47 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rebuilding aliases for: %@ (%@)", buf, 0x16u);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    int v14 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
    id v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          CFStringRef v19 = *(IDSRegistration **)(*((void *)&v39 + 1) + 8 * i);
          int64_t v20 = [(IDSDAccount *)self _validationStatusForAlias:v19];
          uint32_t v21 = +[IMRGLog registration];
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20 == -1)
          {
            if (v22)
            {
              *(_DWORD *)buf = 138412290;
              unsigned int v45 = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, " => ignoring failed validation email: %@", buf, 0xCu);
            }
          }
          else
          {
            if (v22)
            {
              *(_DWORD *)buf = 138412290;
              unsigned int v45 = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, " => adding candidate email: %@", buf, 0xCu);
            }

            [(IDSRegistration *)self->_registrationInfo addCandidateEmail:v19];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v16);
    }

    unsigned __int8 v23 = [(IDSDAccount *)self accountInfo];
    uint64_t v24 = [v23 objectForKey:kIDSServiceDefaultsProfileKey];

    unsigned __int8 v25 = +[IMRGLog registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v45 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Existing region profile: %@", buf, 0xCu);
    }

    if ([(IDSRegistration *)v24 count])
    {
      uint64_t v26 = [(IDSRegistration *)v24 objectForKey:kIDSServiceDefaultsProfileValdationStatusKey];
      unsigned int v27 = [v26 intValue];

      if (v27 == 3)
      {
        uint64_t v28 = +[IMRGLog registration];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "We have a profile, and it's validated!", buf, 2u);
        }

        unsigned int v29 = [(IDSRegistration *)self->_registrationInfo regionID];
        id v30 = [v29 length];

        if (!v30)
        {
          uint64_t v31 = +[IMRGLog registration];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No region ID, we'll use our profile's", buf, 2u);
          }

          uint64_t v32 = self->_registrationInfo;
          uint64_t v33 = [(IDSRegistration *)v24 objectForKey:kIDSServiceDefaultsProfileRegionIDKey];
          [(IDSRegistration *)v32 setRegionID:v33];

          unsigned int v34 = self->_registrationInfo;
          __int16 v35 = [(IDSRegistration *)v24 objectForKey:kIDSServiceDefaultsProfileBaseNumberKey];
          [(IDSRegistration *)v34 setRegionBasePhoneNumber:v35];

          id v36 = self->_registrationInfo;
          __int16 v37 = [(IDSRegistration *)v24 objectForKey:kIDSServiceDefaultsProfileServerContextKey];
          [(IDSRegistration *)v36 setRegionServerContext:v37];
        }
      }
    }

    BOOL v8 = 1;
  }
  [(IDSRegistration *)self->_registrationInfo setMigrationContext:0];
  return v8;
}

- (void)_registerAccount
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v42 = _os_activity_create((void *)&_mh_execute_header, "Daemon register account", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v42, &state);
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[FTDeviceSupport sharedInstance];
    BOOL v5 = [v4 deviceInformationString];
    *(_DWORD *)buf = 138412546;
    CFStringRef v44 = v5;
    __int16 v45 = 2112;
    __int16 v46 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Re-register called (Environment: %@) %@", buf, 0x16u);
  }
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_100717CE8();
    }
    goto LABEL_10;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_10071808C();
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(IDSDAccount *)self primaryAccount];
      *(_DWORD *)buf = 138412290;
      CFStringRef v44 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " => Forwarding to Primary: %@", buf, 0xCu);
    }
    int v9 = [(IDSDAccount *)self primaryAccount];
    [v9 _registerAccount];
  }
  else if (+[IDSRegistrationController canStartRegistrationForAccountType:[(IDSDAccount *)self accountType]])
  {
    uint64_t v10 = +[IDSRestoreMonitor sharedInstance];
    [(id)v10 removeTarget:self];

    [(IDSDAccount *)self _migrateRegistrationIfNeeded];
    unsigned int v11 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
    LOBYTE(v10) = v11 == 0;

    if (v10)
    {
      uint32_t v21 = +[IMRGLog pushToken];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v22 = [(IDSRegistration *)self->_registrationInfo pushToken];
        unsigned __int8 v23 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
        uint64_t v24 = IMGetEnvironmentName();
        *(_DWORD *)buf = 138412802;
        CFStringRef v44 = v22;
        __int16 v45 = 2112;
        __int16 v46 = v23;
        __int16 v47 = 2112;
        long long v48 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Asked to register, but haven't received push token yet, waiting... (Mine: %@  APSD: %@  Env: %@)", buf, 0x20u);
      }
      if (![(IDSRegistration *)self->_registrationInfo registrationStatus])
      {
        [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:2];
        [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
      }
    }
    else
    {
      registrationInfo = self->_registrationInfo;
      int v13 = [(IDSRegistrationPushHandler *)self->_pushHandler pushToken];
      [(IDSRegistration *)registrationInfo setPushToken:v13];

      if ([(IDSRegistration *)self->_registrationInfo registrationStatus] <= 5) {
        [(IDSRegistration *)self->_registrationInfo setVettedEmails:0];
      }
      [(IDSRegistration *)self->_registrationInfo setNeedsMigration:0];
      int v14 = [(IDSDAccount *)self systemMonitor];
      unsigned int v15 = [v14 isUnderFirstDataProtectionLock];

      if (v15)
      {
        id v16 = +[IMRGLog registration];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device is still under first data protection lock, deferring request", buf, 2u);
        }

        *((unsigned char *)self + 81) |= 1u;
      }
      else
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        unsigned __int8 v25 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
        id v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v26)
        {
          uint64_t v28 = *(void *)v38;
          *(void *)&long long v27 = 138412290;
          long long v36 = v27;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v38 != v28) {
                objc_enumerationMutation(v25);
              }
              CFStringRef v30 = *(const __CFString **)(*((void *)&v37 + 1) + 8 * i);
              if ((id)-[IDSDAccount _validationStatusForAlias:](self, "_validationStatusForAlias:", v30, v36) == (id)3)
              {
                uint64_t v31 = [(IDSRegistration *)self->_registrationInfo candidateEmails];
                if ([v31 containsObject:v30])
                {
                }
                else
                {
                  uint64_t v32 = [(IDSRegistration *)self->_registrationInfo confirmedEmails];
                  unsigned __int8 v33 = [v32 containsObject:v30];

                  if ((v33 & 1) == 0)
                  {
                    unsigned int v34 = +[IMRGLog registration];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v36;
                      CFStringRef v44 = v30;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "We were missing candidate alias: %@, adding it", buf, 0xCu);
                    }

                    [(IDSRegistration *)self->_registrationInfo addCandidateEmail:v30];
                  }
                }
              }
            }
            id v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v26);
        }

        __int16 v35 = +[IDSRegistrationController sharedInstance];
        objc_msgSend(v35, "registerInfo:requireSilentAuth:", self->_registrationInfo, -[IDSDAccount _isPasswordPromptPermissibleDuringAuthentication](self, "_isPasswordPromptPermissibleDuringAuthentication") ^ 1);
      }
    }
  }
  else
  {
    uint64_t v17 = +[IMRGLog registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v44 = @"NO";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Asked to register, but haven't completed upgrade/restore, current state: %@", buf, 0xCu);
    }

    [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:1];
    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
    id v18 = +[IDSRestoreMonitor sharedInstance];
    unsigned __int8 v19 = [v18 hasActionForTarget:self];

    if ((v19 & 1) == 0)
    {
      int64_t v20 = +[IDSRestoreMonitor sharedInstance];
      [v20 addTarget:self actionBlock:&stru_1009862B8];
    }
  }
LABEL_11:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)registerAccount
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDAccount *)self uniqueID];
    BOOL v5 = +[FTDeviceSupport sharedInstance];
    id v6 = [v5 deviceInformationString];
    int v8 = 138412546;
    int v9 = v4;
    __int16 v10 = 2112;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client requested re-register: %@ (Environment: %@)", (uint8_t *)&v8, 0x16u);
  }
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_9;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1007180E0(self);
    }
LABEL_9:

    return;
  }
  [(IDSDAccount *)self _registerAccount];
}

- (void)_unregisterAccount
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v11 = _os_activity_create((void *)&_mh_execute_header, "Daemon unregister account", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDAccount *)self uniqueID];
    BOOL v5 = +[FTDeviceSupport sharedInstance];
    id v6 = [v5 deviceInformationString];
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    unsigned int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, " => Deregister: %@ (Environment: %@)", buf, 0x16u);
  }
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_100717CE8();
    }
    goto LABEL_9;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_100718170();
    }
LABEL_9:

    goto LABEL_10;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(IDSDAccount *)self uniqueID];
      objc_claimAutoreleasedReturnValue();
      sub_1007181C4();
    }
    goto LABEL_9;
  }
  int v8 = +[IDSRegistrationController sharedInstance];
  [v8 unregisterInfo:self->_registrationInfo];

  int v9 = +[IDSRegistrationController sharedInstance];
  [v9 stopTrackingRegistration:self->_registrationInfo];

  if (![(IDSRegistration *)self->_registrationInfo registrationType]) {
    [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:0];
  }
  [(IDSDAccount *)self _notifyListenersAndSetDependentRegistrations:0 onRegistrationInfo:self->_registrationInfo];
  [(IDSRegistration *)self->_registrationInfo saveToKeychain];
LABEL_10:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)unregisterAccount
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[FTDeviceSupport sharedInstance];
    BOOL v5 = [v4 deviceInformationString];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client requested de-register (Environment: %@)", (uint8_t *)&v7, 0xCu);
  }
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_9;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100718218(self);
    }
LABEL_9:

    return;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1007182A8(self);
    }
    goto LABEL_9;
  }
  [(IDSDAccount *)self _unregisterAccount];
}

- (void)passwordUpdated
{
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    BOOL v3 = +[IMRGLog warning];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_10;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    BOOL v3 = +[IMRGLog warning];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100718338(self);
    }
LABEL_10:

    return;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    BOOL v3 = +[IMRGLog warning];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1007183C8(self);
    }
    goto LABEL_10;
  }
  if ([(IDSRegistration *)self->_registrationInfo registrationType]
    && [(IDSRegistration *)self->_registrationInfo registrationType] != 2)
  {
    id v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client password updated", buf, 2u);
    }

    if (self->_registrationInfo)
    {
      BOOL v5 = +[IMRGLog registration];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing signature, and re-registering", v7, 2u);
      }

      int64_t v6 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
      [(IDSRegistration *)self->_registrationInfo setAuthenticationCert:0];
      [(IDSRegistration *)self->_registrationInfo setRegistrationStatus:0];
      [(IDSRegistration *)self->_registrationInfo setUris:0];
      [(IDSRegistration *)self->_registrationInfo setRegistrationCert:0];
      if (v6 == 6) {
        [(IDSDAccount *)self _authenticateAccount];
      }
      else {
        [(IDSDAccount *)self _reregister];
      }
      [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
    }
  }
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    int v8 = +[IMRGLog warning];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    int v8 = +[IMRGLog warning];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100718458(self);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    int v8 = +[IMRGLog warning];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007184E8(self);
    }
    goto LABEL_7;
  }
  if ([(IDSRegistration *)self->_registrationInfo registrationType]
    && [(IDSRegistration *)self->_registrationInfo registrationType] != 2)
  {
    int v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client updating auth ID: %@  token: %@", (uint8_t *)&v14, 0x16u);
    }

    [(IDSRegistration *)self->_registrationInfo setProfileID:v6];
    [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:v7];
    __int16 v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "... Saving", (uint8_t *)&v14, 2u);
    }

    [(IDSRegistration *)self->_registrationInfo saveToKeychain];
    unsigned int v11 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    int v8 = v11;
    if (v6) {
      CFDictionarySetValue(v11, kIDSServiceDefaultsAuthorizationIDKey, v6);
    }
    unsigned int v12 = [(IDSDAccount *)self loginID];
    id v13 = IMCanonicalFormForEmail();
    IMSetKeychainAuthToken();

    [(IDSDAccount *)self writeAccountDefaults:v8];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  id v5 = a4;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100718578(self);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100718608(self);
    }
    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v7 = [(IDSRegistration *)self->_registrationInfo pushToken];
  if (v7)
  {
    int v8 = (void *)v7;
    int v9 = [(IDSRegistration *)self->_registrationInfo pushToken];
    unsigned __int8 v10 = [v9 isEqualToData:v5];

    if (v10)
    {
      id v6 = +[IMRGLog pushToken];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = [(IDSRegistration *)self->_registrationInfo pushToken];
        int v20 = 138412546;
        id v21 = v5;
        __int16 v22 = 2112;
        unsigned __int8 v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Informed of push token change to: %@, but no need to reregister (from: %@)", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_7;
    }
  }
  unsigned int v12 = +[IMRGLog pushToken];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(IDSRegistration *)self->_registrationInfo pushToken];
    int v20 = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    unsigned __int8 v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Informed of push token change to: %@, reregistering (from: %@)", (uint8_t *)&v20, 0x16u);
  }
  int v14 = [(IDSDAccount *)self peerIDManager];
  [v14 clearCacheAndPersistImmediately:0];

  [(IDSDAccount *)self _refreshRegistration];
  id v15 = [(IDSDAccount *)self registration];
  unsigned int v16 = [v15 registrationType];

  if (!v16)
  {
    id v17 = +[IDSRegistrationReasonTracker sharedInstance];
    id v18 = [(IDSDAccount *)self userUniqueIdentifier];
    [v17 setPNRReason:12 forUserUniqueIdentifier:v18];

    unsigned __int8 v19 = +[IDSPACStateTracker sharedInstance];
    [v19 notePhoneAuthCertLost:4];
  }
  [(IDSRegistration *)self->_registrationInfo setAuthenticationCert:0];
  [(IDSRegistration *)self->_registrationInfo setPushToken:v5];
  [(IDSDAccount *)self _registerAccount];
LABEL_8:
}

- (void)handler:(id)a3 reloadBag:(id)a4
{
  id v5 = a4;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100718698(self);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100718728(self);
    }
    goto LABEL_7;
  }
  uint64_t v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received reload bag push for: %@", (uint8_t *)&v23, 0xCu);
  }

  if (![v5 length]
    || (_IDSRegistrationServiceTypeForString(),
        int v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:IDSRegistrationServiceTypeiMessage],
        v8,
        v9))
  {
    unsigned __int8 v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " => Reloading iMessage bag", (uint8_t *)&v23, 2u);
    }

    unsigned int v11 = +[IDSServerBag sharedInstanceForBagType:1];
    [v11 forceBagLoad];
  }
  if (![v5 length]
    || (_IDSRegistrationServiceTypeForString(),
        unsigned int v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:IDSRegistrationServiceTypeFaceTime],
        v12,
        v13))
  {
    int v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, " => Reloading FaceTime bag", (uint8_t *)&v23, 2u);
    }

    id v15 = +[IDSServerBag sharedInstanceForBagType:0];
    [v15 forceBagLoad];
  }
  if (![v5 length]
    || (_IDSRegistrationServiceTypeForString(),
        unsigned int v16 = objc_claimAutoreleasedReturnValue(),
        unsigned int v17 = [v16 isEqualToString:IDSRegistrationServiceTypeCalling],
        v16,
        v17))
  {
    id v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " => Reloading FaceTime Audio bag", (uint8_t *)&v23, 2u);
    }

    unsigned __int8 v19 = +[IDSServerBag sharedInstanceForBagType:0];
    [v19 forceBagLoad];
  }
  if (![v5 length]
    || (_IDSRegistrationServiceTypeForString(),
        int v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 isEqualToString:IDSRegistrationServiceTypeMultiway],
        v20,
        v21))
  {
    __int16 v22 = +[IMRGLog registration];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, " => Reloading FaceTime Multiway bag", (uint8_t *)&v23, 2u);
    }

    id v6 = +[IDSServerBag sharedInstanceForBagType:0];
    [v6 forceBagLoad];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_parseHandlesInfo:(id)a3 currentAliases:(id)a4 currentVettedAliases:(id)a5
{
  id v7 = a3;
  id v73 = a4;
  id v77 = a5;
  id v79 = +[IDSRegistrationController registeredPhoneNumbers];
  id v75 = objc_alloc_init((Class)NSMutableArray);
  id v76 = objc_alloc_init((Class)NSMutableArray);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v96 objects:v114 count:16];
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)v97;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v97 != v9) {
        objc_enumerationMutation(obj);
      }
      unsigned int v11 = *(void **)(*((void *)&v96 + 1) + 8 * i);
      unsigned int v12 = [v11 objectForKey:@"uri"];
      unsigned int v13 = [v12 _stripFZIDPrefix];

      int v14 = [v11 objectForKey:@"device-name"];
      id v15 = [v11 objectForKey:@"is-user-visible"];
      unsigned int v16 = [v11 objectForKey:@"status"];
      int v17 = [v16 intValue];

      if (v17 <= 5050)
      {
        if (v17 == 5036)
        {

          [(IDSDAccount *)self _setValidationStatus:1 error:5 forAlias:0 info:0 addToCurrentHandlesIfNeeded:0 forceAdd:0];
          goto LABEL_23;
        }
        if (v17 == 5038)
        {
LABEL_13:

          [(IDSDAccount *)self _setValidationStatus:1 error:4 forAlias:0 info:0 addToCurrentHandlesIfNeeded:0 forceAdd:0];
          goto LABEL_23;
        }
LABEL_22:
        [(IDSDAccount *)self _setValidationStatus:1 error:0 forAlias:v13 info:0 addToCurrentHandlesIfNeeded:0 forceAdd:0];

        goto LABEL_23;
      }
      if (v17 != 5051)
      {
        if (v17 == 5055) {
          goto LABEL_13;
        }
        if (v17 == 5052)
        {

          [(IDSDAccount *)self _setValidationStatus:2 error:0xFFFFFFFFLL forAlias:0 info:0 addToCurrentHandlesIfNeeded:0 forceAdd:0];
LABEL_23:
          unsigned int v13 = 0;
LABEL_24:
          id v18 = +[IMRGLog registration];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v19 = [(IDSDAccount *)self uniqueID];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v13;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not adding registered phone alias to appleID account {uniqueID: %@, phoneAlias: %@}", buf, 0x16u);
          }
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      if (!v13 || ([v79 containsObject:v13] & 1) != 0) {
        goto LABEL_24;
      }
      id v18 = objc_alloc_init((Class)NSMutableDictionary);
      CFDictionarySetValue((CFMutableDictionaryRef)v18, @"uri", v13);
      if (v14) {
        CFDictionarySetValue((CFMutableDictionaryRef)v18, @"device-name", v14);
      }
      if (v15) {
        CFDictionarySetValue((CFMutableDictionaryRef)v18, @"is-user-visible", v15);
      }
      [v75 addObject:v18];
      [v76 addObject:v13];
LABEL_26:
    }
    id v8 = [obj countByEnumeratingWithState:&v96 objects:v114 count:16];
  }
  while (v8);
LABEL_28:

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  unsigned int v111 = sub_10020A5F0;
  double v112 = sub_10020A600;
  id v113 = (id)0xAAAAAAAAAAAAAAAALL;
  id v113 = objc_alloc_init((Class)NSMutableArray);
  long long v72 = objc_msgSend(v77, "__imArrayByApplyingBlock:", &stru_1009862D8);
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_10020A65C;
  v92[3] = &unk_100986300;
  v92[4] = self;
  BOOL v95 = buf;
  id v69 = v77;
  id v93 = v69;
  id v70 = v73;
  id v94 = v70;
  id v78 = objc_msgSend(v76, "__imArrayByApplyingBlock:", v92);
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    id v71 = [v72 arrayByAddingObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
  }
  else
  {
    id v71 = v72;
  }
  int v20 = +[IMRGLog registration];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v101 = 138412290;
    id v102 = v70;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "My current handles: %@", v101, 0xCu);
  }

  unsigned int v21 = +[IMRGLog registration];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v101 = 138412290;
    id v102 = v69;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "My current vetted handles: %@", v101, 0xCu);
  }

  __int16 v22 = +[IMRGLog registration];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v101 = 138412290;
    id v102 = v72;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "My current vetted emails: %@", v101, 0xCu);
  }

  int v23 = +[IMRGLog registration];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v101 = 138412290;
    id v102 = v71;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Asserted Emails: %@", v101, 0xCu);
  }

  id v24 = +[IMRGLog registration];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v101 = 138412290;
    id v102 = v76;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "My new aliases: %@", v101, 0xCu);
  }

  unsigned __int8 v25 = +[IMRGLog registration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v101 = 138412290;
    id v102 = v78;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Newly added: %@", v101, 0xCu);
  }

  if (![v78 count])
  {
    id v26 = +[IMRGLog registration];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_78;
    }
    *(_WORD *)v101 = 0;
    long long v27 = "** No new handles!";
    goto LABEL_77;
  }
  if ([(IDSDAccount *)self shouldAutoRegisterAllHandles])
  {
    id v26 = +[IMRGLog registration];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_78;
    }
    *(_WORD *)v101 = 0;
    long long v27 = " => All handle based account, not showing available notification";
LABEL_77:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, v101, 2u);
    goto LABEL_78;
  }
  if ([(IDSDAccount *)self shouldRegisterUsingDSHandle])
  {
    id v26 = +[IMRGLog registration];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_78;
    }
    *(_WORD *)v101 = 0;
    long long v27 = " => DS handle based account, not showing available notification";
    goto LABEL_77;
  }
  uint64_t v28 = [(IDSDAccount *)self service];
  unsigned int v29 = [v28 shouldShowUsageNotifications];

  if (!v29)
  {
    id v26 = +[IMRGLog registration];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_78;
    }
    *(_WORD *)v101 = 0;
    long long v27 = "** Not showing notification, service is not configured to show them";
    goto LABEL_77;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v26 = v75;
  id v30 = [v26 countByEnumeratingWithState:&v88 objects:v109 count:16];
  if (!v30) {
    goto LABEL_78;
  }
  uint64_t v80 = *(void *)v89;
  BOOL v74 = v26;
  while (2)
  {
    uint64_t v31 = 0;
    while (2)
    {
      if (*(void *)v89 != v80) {
        objc_enumerationMutation(v74);
      }
      uint64_t v32 = *(void **)(*((void *)&v88 + 1) + 8 * v31);
      unsigned __int8 v33 = [v32 objectForKey:@"uri"];
      unsigned int v34 = [v32 objectForKey:@"device-name"];
      if ([v78 containsObject:v33])
      {
        __int16 v35 = +[IDSRegistrationController registeredPhoneNumbers];
        unsigned int v36 = [v35 containsObject:v33];

        if (v36)
        {
          long long v37 = +[IMRGLog registration];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v101 = 0;
            long long v38 = v37;
            long long v39 = " => Not adding, this is my phone number";
            goto LABEL_64;
          }
        }
        else if ([(IDSDAccount *)self wasRecentlySelectedAlias:v33])
        {
          long long v40 = +[IMRGLog registration];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v101 = 138412290;
            id v102 = v33;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Alias was recently selected, just adding {alias: %@}", v101, 0xCu);
          }

          long long v37 = IMSingleObjectArray();
          [(IDSDAccount *)self addAliases:v37];
          [(IDSDAccount *)self validateAliases:v37];
        }
        else
        {
          long long v41 = [(IDSDAccount *)self serviceType];
          long long v37 = _StringForIDSRegistrationServiceType();

          long long v42 = +[IMRGLog registration];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v43 = [(IDSRegistration *)self->_registrationInfo mainID];
            *(_DWORD *)v101 = 138413058;
            id v102 = v33;
            __int16 v103 = 2112;
            id v104 = v34;
            __int16 v105 = 2112;
            uint64_t v106 = v43;
            __int16 v107 = 2112;
            double v108 = v37;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "** Adding notification for %@  on device %@  on apple ID: %@ for service: %@", v101, 0x2Au);
          }
          [(IDSDAccount *)self markAsVettedAlias:v33];
          CFStringRef v44 = [(IDSDAccount *)self appleIDNotificationCenter];
          __int16 v45 = [(IDSDAccount *)self uniqueID];
          __int16 v46 = [(IDSRegistration *)self->_registrationInfo mainID];
          __int16 v47 = [(IDSDAccount *)self serviceType];
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_10020A6F4;
          v87[3] = &unk_100986328;
          v87[4] = self;
          [v44 addAvailableNotificationForSession:v45 appleID:v46 alias:v33 deviceName:v34 serviceType:v47 completionBlock:v87];
        }
      }
      else
      {
        long long v37 = +[IMRGLog registration];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v101 = 0;
          long long v38 = v37;
          long long v39 = " => Not adding, new handles does not contain this alias";
LABEL_64:
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v39, v101, 2u);
        }
      }

      if (v30 != (id)++v31) {
        continue;
      }
      break;
    }
    id v26 = v74;
    id v30 = [v74 countByEnumeratingWithState:&v88 objects:v109 count:16];
    if (v30) {
      continue;
    }
    break;
  }
LABEL_78:

  [(IDSDAccount *)self _updateVettedAliases:v76 emailInfo:v75 addToCurrentHandlesIfNeeded:0];
  if ([(IDSDAccount *)self shouldAutoRegisterAllHandles])
  {
    long long v48 = +[IMRGLog registration];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v101 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, " => We should auto configure all handles", v101, 2u);
    }

    uint64_t v49 = +[IMRGLog registration];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v50 = [(IDSDAccount *)self vettedAliases];
      *(_DWORD *)v101 = 138412290;
      id v102 = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "    Vetted: %@", v101, 0xCu);
    }
    id v51 = +[IMRGLog registration];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v52 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
      *(_DWORD *)v101 = 138412290;
      id v102 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "   Current: %@", v101, 0xCu);
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v53 = [(IDSDAccount *)self vettedAliases];
    id v54 = [v53 countByEnumeratingWithState:&v83 objects:v100 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v84;
      do
      {
        for (j = 0; j != v54; j = (char *)j + 1)
        {
          if (*(void *)v84 != v55) {
            objc_enumerationMutation(v53);
          }
          id v57 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
          __int16 v58 = +[IMRGLog registration];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v101 = 138412290;
            id v102 = v57;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "      Checking: %@", v101, 0xCu);
          }

          unsigned int v59 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
          unsigned __int8 v60 = [v59 containsObject:v57];

          if (v60)
          {
            long long v61 = +[IMRGLog registration];
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v101 = 0;
              long long v62 = v61;
              long long v63 = "      => Already in alias set";
              goto LABEL_100;
            }
            goto LABEL_101;
          }
          uint64_t v64 = +[IMRGLog registration];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v101 = 138412290;
            id v102 = v57;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "         => Not in alias strings: %@", v101, 0xCu);
          }

          if ([*(id *)(*(void *)&buf[8] + 40) containsObject:v57])
          {
            long long v61 = +[IMRGLog registration];
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v101 = 0;
              long long v62 = v61;
              long long v63 = "         => Already in auto register set";
LABEL_100:
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, v63, v101, 2u);
            }
LABEL_101:

            continue;
          }
          long long v65 = +[IMRGLog registration];
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v101 = 138412290;
            id v102 = v57;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "         => Not in auto register: %@", v101, 0xCu);
          }

          [*(id *)(*(void *)&buf[8] + 40) addObject:v57];
        }
        id v54 = [v53 countByEnumeratingWithState:&v83 objects:v100 count:16];
      }
      while (v54);
    }
  }
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    long long v66 = +[IMRGLog registration];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v67 = *(void **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v101 = 138412290;
      id v102 = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "** Auto registering handles: %@", v101, 0xCu);
    }

    [(IDSDAccount *)self _addAliases:*(void *)(*(void *)&buf[8] + 40)];
    [(IDSDAccount *)self _validateAliases:*(void *)(*(void *)&buf[8] + 40) validateAlreadyValid:1];
  }
  else
  {
    long long v68 = +[IMRGLog registration];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v101 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "No handles to auto register", v101, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)_updateHandles:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(IDSDAccount *)self isDeviceAuthenticated])
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(IDSDAccount *)self uniqueID];
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      id v7 = " => Ignoring, we're not authenticated for: %@";
      goto LABEL_8;
    }
LABEL_9:

    return;
  }
  if ([(IDSRegistration *)self->_registrationInfo registrationType] != 1
    && [(IDSRegistration *)self->_registrationInfo registrationType])
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(IDSDAccount *)self uniqueID];
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      id v7 = " => Not updating handles, this is not an apple ID or phone based account for: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v8 = [(IDSDAccount *)self systemMonitor];
  unsigned int v9 = [v8 isUnderFirstDataProtectionLock];

  if (v9)
  {
    unsigned __int8 v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device is still under first data protection lock, deferring request", buf, 2u);
    }

    *((unsigned char *)self + 80) |= 0x40u;
  }
  else
  {
    int v11 = *((unsigned __int8 *)self + 80);
    unsigned int v12 = +[IMRGLog registration];
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 0x10) != 0)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not issuing handle gathering, we're in progress now", buf, 2u);
      }
    }
    else
    {
      if (v13)
      {
        int v14 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        id v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " => Kicking off handle gathering for: %@", buf, 0xCu);
      }
      *((unsigned char *)self + 80) |= 0x10u;
      id v15 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
      id v16 = [v15 copy];

      int v17 = [(IDSDAccount *)self vettedAliases];
      id v18 = [v17 copy];

      unsigned __int8 v19 = +[IMRGLog registration];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "  (currentAliases: %@)", buf, 0xCu);
      }

      int v20 = +[IMRGLog registration];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "  (currentVettedAliases: %@)", buf, 0xCu);
      }

      unsigned int v21 = +[IMRGLog registration];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        id v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "  * Sending handle update request for: %@", buf, 0xCu);
      }
      int v23 = [(IDSDAccount *)self registrationCenter];
      registrationInfo = self->_registrationInfo;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      void v26[2] = sub_10020AC08;
      v26[3] = &unk_100986350;
      void v26[4] = self;
      id v27 = v16;
      id v28 = v18;
      id v25 = v18;
      unsigned int v12 = v16;
      [v23 queryValidatedEmailsForRegistration:registrationInfo allowPasswordPrompt:v3 completionBlock:v26];
    }
  }
}

- (void)handler:(id)a3 profile:(id)a4 deviceUpdated:(id)a5 service:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100718830(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1007188C0(self);
    }
    goto LABEL_7;
  }
  BOOL v13 = +[IMRGLog GDR];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(IDSDAccount *)self uniqueID];
    int v39 = 138413058;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v10;
    __int16 v43 = 2112;
    id v44 = v11;
    __int16 v45 = 2112;
    __int16 v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received device updated push for profile: %@   token: %@   service: %@  for: %@", (uint8_t *)&v39, 0x2Au);
  }
  id v15 = [(IDSDAccount *)self registrationCenter];
  uint64_t v16 = [v15 dateLastRegistered];
  if (v16)
  {
    int v17 = (void *)v16;
    id v18 = [(IDSDAccount *)self registrationCenter];
    unsigned __int8 v19 = [v18 dateLastRegistered];
    [v19 timeIntervalSinceNow];
    double v21 = fabs(v20);

    if (v21 < 10.0)
    {
      __int16 v22 = +[IMRGLog GDR];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring update - we have recent registration events", (uint8_t *)&v39, 2u);
      }

      goto LABEL_8;
    }
  }
  else
  {
  }
  if ([(IDSDAccount *)self _isBuddyBlockingRegistration])
  {
    int v23 = +[IMRGLog GDR];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [(IDSDAccount *)self uniqueID];
      int v39 = 138412290;
      id v40 = v24;
      id v25 = "System not setup, ignoring devices updated push for: %@";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v39, 0xCu);

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  id v26 = [(IDSDAccount *)self systemMonitor];
  unsigned int v27 = [v26 isUnderFirstDataProtectionLock];

  if (v27)
  {
    int v23 = +[IMRGLog GDR];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [(IDSDAccount *)self uniqueID];
      int v39 = 138412290;
      id v40 = v24;
      id v25 = "Device is still under first data protection lock, ignoring for: %@";
      goto LABEL_26;
    }
LABEL_27:

    *((unsigned char *)self + 80) |= 0x20u;
    goto LABEL_8;
  }
  if (![v9 length])
  {
    unsigned int v12 = +[IMRGLog GDR];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [(IDSDAccount *)self uniqueID];
      int v39 = 138412290;
      id v40 = v30;
      uint64_t v31 = "  Empty user ID, ignoring for: %@";
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v39, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  id v28 = [(IDSRegistration *)self->_registrationInfo profileID];
  if ([v9 isEqualToIgnoringCase:v28]) {
    BOOL v29 = [(IDSRegistration *)self->_registrationInfo registrationType] != 2;
  }
  else {
    BOOL v29 = 0;
  }

  uint64_t v32 = [(IDSRegistration *)self->_registrationInfo userID];
  unsigned __int8 v33 = [v9 isEqualToIgnoringCase:v32];

  if (!v29 && (v33 & 1) == 0)
  {
    unsigned int v12 = +[IMRGLog GDR];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [(IDSDAccount *)self uniqueID];
      int v39 = 138412290;
      id v40 = v30;
      uint64_t v31 = "  Unknown profile ID ID, not proceeding for: %@";
      goto LABEL_50;
    }
    goto LABEL_7;
  }
  if (v10)
  {
    unsigned int v34 = [(IDSRegistration *)self->_registrationInfo pushToken];
    unsigned int v35 = [v10 isEqualToData:v34];

    if (v35)
    {
      unsigned int v12 = +[IMRGLog GDR];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(IDSDAccount *)self uniqueID];
        int v39 = 138412290;
        id v40 = v30;
        uint64_t v31 = " => Ignoring a device update from myself for: %@";
        goto LABEL_50;
      }
      goto LABEL_7;
    }
  }
  unsigned __int8 v36 = [(IDSDAccount *)self isDeviceRegistered];
  unsigned int v12 = +[IMRGLog GDR];
  BOOL v37 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v36 & 1) == 0)
  {
    if (v37)
    {
      id v30 = [(IDSDAccount *)self uniqueID];
      int v39 = 138412290;
      id v40 = v30;
      uint64_t v31 = " => Ignoring, we're not registered for: %@";
      goto LABEL_50;
    }
    goto LABEL_7;
  }
  if (v37)
  {
    long long v38 = [(IDSDAccount *)self uniqueID];
    int v39 = 138412290;
    id v40 = v38;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " => Kicking off device and handles gathering for: %@", (uint8_t *)&v39, 0xCu);
  }
  if ([(IDSRegistration *)self->_registrationInfo registrationType] == 1) {
    [(IDSDAccount *)self _updateHandles:1];
  }
  [(IDSDAccount *)self _issueCriticalDependentCheck];
LABEL_8:
}

- (void)handler:(id)a3 profileHandlesUpdated:(id)a4 status:(id)a5 allowGDR:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100718950(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1007189E0(self);
    }
    goto LABEL_7;
  }
  BOOL v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(IDSDAccount *)self uniqueID];
    int v34 = 138413058;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    __int16 v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received handles updated push for profile: %@ allowGDR: %@   status: %@   for: %@", (uint8_t *)&v34, 0x2Au);
  }
  id v15 = [(IDSDAccount *)self registrationCenter];
  uint64_t v16 = [v15 dateLastRegistered];
  if (v16)
  {
    int v17 = (void *)v16;
    id v18 = [(IDSDAccount *)self registrationCenter];
    unsigned __int8 v19 = [v18 dateLastRegistered];
    [v19 timeIntervalSinceNow];
    double v21 = fabs(v20);

    if (v21 < 10.0)
    {
      __int16 v22 = +[IMRGLog registration];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring update - we have recent registration events", (uint8_t *)&v34, 2u);
      }

      goto LABEL_8;
    }
  }
  else
  {
  }
  if ([(IDSDAccount *)self _isBuddyBlockingRegistration])
  {
    unsigned int v12 = +[IMRGLog registration];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    int v23 = [(IDSDAccount *)self uniqueID];
    int v34 = 138412290;
    id v35 = v23;
    id v24 = "System not setup, ignoring handles update push for: %@";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v34, 0xCu);

    goto LABEL_7;
  }
  id v25 = [(IDSDAccount *)self systemMonitor];
  unsigned int v26 = [v25 isUnderFirstDataProtectionLock];

  if (v26)
  {
    unsigned int v27 = +[IMRGLog registration];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [(IDSDAccount *)self uniqueID];
      int v34 = 138412290;
      id v35 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Device is still under first data protection lock, ignoring for: %@", (uint8_t *)&v34, 0xCu);
    }
    *((unsigned char *)self + 80) |= 0x40u;
  }
  else
  {
    if (![v9 length])
    {
      unsigned int v12 = +[IMRGLog registration];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v23 = [(IDSDAccount *)self uniqueID];
      int v34 = 138412290;
      id v35 = v23;
      id v24 = "  Empty user ID, ignoring for: %@";
      goto LABEL_23;
    }
    if (-[IDSDAccount accountType](self, "accountType") || [v9 _FZIDType])
    {
      unsigned int v29 = 1;
    }
    else
    {
      uint64_t v32 = [(IDSDAccount *)self loginID];
      unsigned __int8 v33 = [v9 _stripFZIDPrefix];
      unsigned int v29 = [v32 isEqualToIgnoringCase:v33] ^ 1;
    }
    id v30 = [(IDSRegistration *)self->_registrationInfo profileID];
    unsigned int v31 = [v9 isEqualToIgnoringCase:v30];

    if (!v31 && v29)
    {
      unsigned int v12 = +[IMRGLog registration];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v23 = [(IDSDAccount *)self uniqueID];
      int v34 = 138412290;
      id v35 = v23;
      id v24 = "  Unknown profile ID ID, not proceeding for: %@";
      goto LABEL_23;
    }
    [(IDSDAccount *)self _updateHandles:1];
    if ([(IDSRegistration *)self->_registrationInfo registrationType] != 1)
    {
      unsigned int v12 = +[IMRGLog registration];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v23 = [(IDSDAccount *)self uniqueID];
      int v34 = 138412290;
      id v35 = v23;
      id v24 = "  Not an appleID registration, not perfoming GDR for : %@";
      goto LABEL_23;
    }
    if (!v11 || [v11 BOOLValue]) {
      [(IDSDAccount *)self _issueCriticalDependentCheck];
    }
  }
LABEL_8:
}

- (void)handler:(id)a3 flushCacheForURIs:(id)a4
{
  id v4 = a4;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received flush cache push for uris: %@", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v6;
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = [(IDSDAccount *)self vettedAliases];
        id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            unsigned int v12 = 0;
            do
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v12);
              int v14 = +[IDSDaemon sharedInstance];
              id v15 = [v14 queryUpdateNotifier];
              id v16 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v13];
              id v17 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v7];
              [v15 handleRegistrationUpdateForHash:0 localURI:v16 remoteURI:v17 service:self->_service guid:0 forceUpdate:1];

              unsigned int v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }
}

- (void)_clearGDRState
{
  registrationInfo = self->_registrationInfo;
  id v4 = +[NSDate date];
  [(IDSRegistration *)registrationInfo setDependentRegistrationsTTL:v4];

  [(IDSRegistration *)self->_registrationInfo setDependentRegistrationAuthRetries:&off_1009D18C0];
  [(IDSRegistration *)self->_registrationInfo setDependentRegistrationResponseCode:&off_1009D18C0];
  [(IDSRegistration *)self->_registrationInfo saveToKeychain];
  id v6 = +[IDSDeviceHeartbeatCenter sharedInstance];
  id v5 = [(IDSRegistration *)self->_registrationInfo idsUserID];
  [v6 resetExpiryForUser:v5];
}

- (void)gdrReAuthenticateIfNecessary
{
  if (!self->_registrationInfo || [(IDSDAccount *)self isAdHocAccount]) {
    return;
  }
  BOOL v3 = [(IDSRegistration *)self->_registrationInfo dependentRegistrationResponseCode];
  id v4 = [v3 integerValue];

  id v5 = [(IDSRegistration *)self->_registrationInfo dependentRegistrationAuthRetries];
  id v6 = [v5 unsignedIntValue];

  if ([(IDSDAccount *)self isRegistered])
  {
    uint64_t v7 = [(IDSRegistration *)self->_registrationInfo registrationCert];
    if (v7)
    {
      id v8 = [(IDSRegistration *)self->_registrationInfo authenticationCert];
      BOOL v9 = v8 == 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  id v10 = [(IDSDAccount *)self registrationCenter];
  uint64_t v11 = [v10 gdrCenter];
  if ([v11 shouldReAuthenticateForGDRResultCode:v4 retries:v6])
  {

LABEL_14:
    unsigned int v12 = +[IMRGLog GDR];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(IDSDAccount *)self smallDescription];
      int v23 = 134218498;
      uint64_t v24 = (uint64_t)v4;
      __int16 v25 = 1024;
      LODWORD(v26[0]) = v6;
      WORD2(v26[0]) = 2112;
      *(void *)((char *)v26 + 6) = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Should retry (resultCode %ld) (retries %d) (%@)", (uint8_t *)&v23, 0x1Cu);
    }
    registrationInfo = self->_registrationInfo;
    id v15 = +[NSNumber numberWithUnsignedInt:(v6 + 1)];
    [(IDSRegistration *)registrationInfo setDependentRegistrationAuthRetries:v15];

    id v16 = [(IDSDAccount *)self registration];
    LODWORD(registrationInfo) = [v16 registrationType];

    if (!registrationInfo)
    {
      id v17 = +[IDSRegistrationReasonTracker sharedInstance];
      id v18 = [(IDSDAccount *)self userUniqueIdentifier];
      [v17 setPNRReason:8 forUserUniqueIdentifier:v18];
    }
    [(IDSDAccount *)self _reAuthenticate];
    return;
  }
  if (v4 != (id)1) {
    BOOL v9 = 0;
  }

  if (v9) {
    goto LABEL_14;
  }
  uint64_t v19 = +[IMRGLog GDR];
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v4 == (id)6006)
  {
    if (v20)
    {
      uint64_t v21 = [(IDSDAccount *)self smallDescription];
      int v23 = 134218242;
      uint64_t v24 = 6006;
      __int16 v25 = 2112;
      v26[0] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Should reregister then retry (resultCode %ld) (%@)", (uint8_t *)&v23, 0x16u);
    }
    [(IDSDAccount *)self reregister];
  }
  else
  {
    if (v20)
    {
      __int16 v22 = [(IDSDAccount *)self smallDescription];
      int v23 = 134218498;
      uint64_t v24 = (uint64_t)v4;
      __int16 v25 = 1024;
      LODWORD(v26[0]) = v6;
      WORD2(v26[0]) = 2112;
      *(void *)((char *)v26 + 6) = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Should not retry (resultCode %ld) (retries %d) (%@)", (uint8_t *)&v23, 0x1Cu);
    }
  }
}

- (void)_notifyListenersAndSetDependentRegistrations:(id)a3 onRegistrationInfo:(id)a4
{
  id v17 = self;
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = IDSDevicePropertyService;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "objectForKey:", v11, v17);
        id v15 = [v6 serviceIdentifier];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if (!v9) {
            id v9 = objc_alloc_init((Class)NSMutableArray);
          }
          [v9 addObject:v13];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  objc_msgSend(v6, "setDependentRegistrations:", v9, v17);
  [v18 _notifyRegistrationListenersAccountDidUpdateRegisteredDevices];
}

- (void)_saveAndNotifyGDRUpdate
{
  [(IDSRegistration *)self->_registrationInfo saveToKeychain];
  id v3 = objc_alloc_init((Class)IMMessageContext);
  [v3 setShouldBoost:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10020C2F8;
  v5[3] = &unk_1009844C0;
  id v6 = v3;
  id v7 = self;
  id v4 = v3;
  [(IDSDAccount *)self _broadcastAccountMessageBlock:v5];
}

- (BOOL)_issueForcedDependentCheckIfPossible
{
  if ((*((unsigned char *)self + 80) & 8) != 0) {
    goto LABEL_4;
  }
  BOOL v3 = [(IDSDAccount *)self _hasBudgetForForcedGDR];
  if (v3)
  {
    [(IDSDAccount *)self _issueCriticalDependentCheck];
LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_issueCriticalDependentCheck
{
  [(IDSDAccount *)self _clearGDRState];

  [(IDSDAccount *)self _issueDependentCheck];
}

- (void)_issueDependentCheck
{
  if (self->_registrationInfo && ![(IDSDAccount *)self isAdHocAccount])
  {
    BOOL v3 = [(IDSDAccount *)self systemMonitor];
    unsigned int v4 = [v3 isUnderFirstDataProtectionLock];

    if (v4)
    {
      id v5 = +[IMRGLog GDR];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        id v7 = "Device is still under first data protection lock, deferring request for: %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    if ([(IDSDAccount *)self _isBuddyBlockingRegistration])
    {
      id v5 = +[IMRGLog GDR];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        id v7 = "Not issuing dependancy check, we're not through buddy yet for: %@";
        goto LABEL_9;
      }
LABEL_10:

      *((unsigned char *)self + 80) |= 0x20u;
      return;
    }
    if ((*((unsigned char *)self + 80) & 8) != 0)
    {
      unsigned int v12 = +[IMRGLog GDR];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(IDSDAccount *)self uniqueID];
        *(_DWORD *)buf = 138412290;
        id v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not issuing dependancy check, we're in progress now for: %@", buf, 0xCu);
      }
    }
    else
    {
      *((unsigned char *)self + 80) |= 8u;
      id v8 = +[IMRGLog GDR];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(IDSDAccount *)self uniqueID];
        uint64_t v10 = [(IDSDAccount *)self service];
        uint64_t v11 = [v10 queryService];
        *(_DWORD *)buf = 138412546;
        id v18 = v9;
        __int16 v19 = 2112;
        long long v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Issued dependent registration check for account: %@   service: %@", buf, 0x16u);
      }
      unsigned int v12 = [(IDSDAccount *)self registrationCenter];
      uint64_t v13 = [v12 gdrCenter];
      registrationInfo = self->_registrationInfo;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10020C998;
      v16[3] = &unk_100986378;
      v16[4] = self;
      [v13 getDependentRegistrations:registrationInfo completionBlock:v16];
    }
  }
}

- (void)_processReceivedDependentRegistration:(id)a3 oldDependentRegistrations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IDSDevicePropertyService;
  uint64_t v9 = [v6 objectForKey:IDSDevicePropertyService];
  uint64_t v10 = IDSDevicePropertyPushToken;
  uint64_t v11 = [v6 objectForKey:IDSDevicePropertyPushToken];
  uint64_t v64 = [v6 objectForKey:IDSDevicePropertyName];
  long long v63 = [v6 objectForKey:IDSDevicePropertyHardwareVersion];
  long long v65 = (void *)v9;
  long long v62 = _IDSRegistrationServiceTypeForString();
  __int16 v52 = v6;
  __int16 v58 = [v6 objectForKey:IDSDevicePropertyClientData];
  id v53 = v7;
  if (v7)
  {
    unsigned int v12 = [(IDSRegistration *)self->_registrationInfo pushToken];
    unsigned __int8 v13 = [v11 isEqualToData:v12];

    if ((v13 & 1) == 0)
    {
      __int16 v56 = sub_10020CFE4(v62);
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id obj = v53;
      id v14 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v75;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v75 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            __int16 v19 = [v18 _dataForKey:v10];
            long long v20 = [v18 _stringForKey:v8];
            long long v21 = _IDSRegistrationServiceTypeForString();

            long long v22 = v19;
            if ([v19 isEqualToData:v11]
              && (([v21 isEqualToString:v62] & 1) != 0
               || v56 && [v21 isEqualToString:v56]))
            {
              id v51 = +[IMRGLog GDR];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v80 = v64;
                __int16 v81 = 2112;
                long long v82 = v65;
                __int16 v83 = 2112;
                long long v84 = v63;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, " *** Not notifying for device name: %@  service: %@, we already know about this one!   hardware: %@", buf, 0x20u);
              }

              __int16 v25 = obj;
              long long v26 = v22;
              goto LABEL_47;
            }
          }
          id v15 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      if ([(IDSDAccount *)self accountType] == 1)
      {
        long long v23 = [v52 objectForKey:IDSDevicePropertyIdentities];
        uint64_t v24 = objc_msgSend(v23, "__imArrayByApplyingBlock:", &stru_100986550);
        __int16 v25 = [v24 _IDsFromURIs];

        if ([v25 count])
        {
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v26 = v25;
          id v61 = [v26 countByEnumeratingWithState:&v70 objects:v87 count:16];
          if (v61)
          {
            id obja = v25;
            uint64_t v60 = *(void *)v71;
            long long v27 = (id *)IMRGLog_ptr;
            unsigned int v59 = v11;
            id v57 = v26;
            do
            {
              for (j = 0; j != v61; j = (char *)j + 1)
              {
                if (*(void *)v71 != v60) {
                  objc_enumerationMutation(v57);
                }
                long long v29 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
                long long v30 = [*v27 GDR];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  uint64_t v80 = v64;
                  __int16 v81 = 2112;
                  long long v82 = v65;
                  __int16 v83 = 2112;
                  long long v84 = v29;
                  __int16 v85 = 2112;
                  long long v86 = v63;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, " Queued notification for device name: %@   service: %@  handle: %@ hardware: %@", buf, 0x2Au);
                }

                unsigned int v31 = [(IDSDAccount *)self serviceController];
                uint64_t v32 = [v31 serviceWithIdentifier:v65];

                unsigned __int8 v33 = [(IDSDAccount *)self accountController];
                id v34 = [v33 accountsOnService:v32];

                long long v68 = 0u;
                long long v69 = 0u;
                long long v66 = 0u;
                long long v67 = 0u;
                id v35 = v34;
                id v36 = [v35 countByEnumeratingWithState:&v66 objects:v78 count:16];
                if (v36)
                {
                  id v37 = v36;
                  uint64_t v38 = *(void *)v67;
                  while (2)
                  {
                    for (k = 0; k != v37; k = (char *)k + 1)
                    {
                      if (*(void *)v67 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      __int16 v40 = *(void **)(*((void *)&v66 + 1) + 8 * (void)k);
                      unsigned int v41 = [v40 accountType];
                      if (v41 == [(IDSDAccount *)self accountType])
                      {
                        long long v27 = (id *)IMRGLog_ptr;
                        id v44 = +[IMRGLog GDR];
                        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          uint64_t v80 = v40;
                          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "  Found similar account: %@", buf, 0xCu);
                        }

                        id v42 = [objc_alloc((Class)IDSEndpointCapabilities) initWithCapabilitiesMap:v58];
                        __int16 v45 = +[IMRGLog GDR];
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412802;
                          uint64_t v80 = v64;
                          __int16 v81 = 2112;
                          long long v82 = v62;
                          __int16 v83 = 2112;
                          long long v84 = v29;
                          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, " Adding notification for device name: %@   service: %@  handle: %@", buf, 0x20u);
                        }

                        __int16 v46 = [(IDSDAccount *)self appleIDNotificationCenter];
                        __int16 v47 = [(IDSDAccount *)self uniqueID];
                        long long v48 = [(IDSRegistration *)self->_registrationInfo mainID];
                        if ([v29 length])
                        {
                          [v46 addUsageNotificationForSession:v47 appleID:v48 alias:v29 deviceName:v64 hardwareVersion:v63 deviceCapabilities:v42 serviceType:v62];
                        }
                        else
                        {
                          uint64_t v49 = +[IDSRegistrationController registeredPhoneNumbers];
                          __int16 v50 = [v49 anyObject];
                          [v46 addUsageNotificationForSession:v47 appleID:v48 alias:v50 deviceName:v64 hardwareVersion:v63 deviceCapabilities:v42 serviceType:v62];

                          long long v27 = (id *)IMRGLog_ptr;
                        }

                        goto LABEL_41;
                      }
                    }
                    id v37 = [v35 countByEnumeratingWithState:&v66 objects:v78 count:16];
                    if (v37) {
                      continue;
                    }
                    break;
                  }
                }

                long long v27 = (id *)IMRGLog_ptr;
                id v42 = +[IMRGLog GDR];
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v43 = [v32 serviceName];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v80 = v43;
                  __int16 v81 = 2112;
                  long long v82 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "We don't have an enabled account for service %@ with %@ as an alias, ignoring...", buf, 0x16u);
                }
LABEL_41:
                uint64_t v11 = v59;
              }
              long long v26 = v57;
              id v61 = [v57 countByEnumeratingWithState:&v70 objects:v87 count:16];
            }
            while (v61);
            __int16 v25 = obja;
          }
        }
        else
        {
          long long v26 = +[IMRGLog GDR];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v80 = v64;
            __int16 v81 = 2112;
            long long v82 = v65;
            __int16 v83 = 2112;
            long long v84 = v63;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, " *** Not notifying for device name: %@  service: %@, don't have any valid handles!   hardware: %@", buf, 0x20u);
          }
        }
LABEL_47:
      }
    }
  }
}

- (void)_flushTokensForRegisteredURIs:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[IMRGLog GDR];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v79 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Flushing cache for: %@", buf, 0xCu);
  }

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_10020DEBC;
  v73[3] = &unk_10097E990;
  v73[4] = self;
  id v5 = objc_msgSend(v3, "__imArrayByApplyingBlock:", v73);
  __int16 v45 = v5;
  if (_os_feature_enabled_impl())
  {
    id v42 = v3;
    __int16 v47 = +[NSMutableSet setWithArray:v5];
    id v6 = +[NSMutableSet set];
    [(IDSDAccount *)self accountAndAdHocAccounts];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v70;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v70 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          unsigned int v12 = [(IDSDAccount *)self dsHandle];
          if (v12)
          {
            unsigned __int8 v13 = [(IDSDAccount *)self service];
            id v14 = [v13 identifier];
            id v15 = +[IDSURI URIWithPrefixedURI:v12 withServiceLoggingHint:v14];
            [v47 addObject:v15];
          }
          uint64_t v16 = [v11 service];
          id v17 = [v16 queryService];
          [v6 addObject:v17];
        }
        id v8 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v8);
    }
    id v18 = [(IDSDAccount *)self peerIDManager];
    __int16 v19 = v47;
    long long v20 = [v47 allObjects];
    long long v21 = [v6 allObjects];
    [v18 forgetPeerTokensForURIs:v20 services:v21];

    id v3 = v42;
    id v5 = v45;
  }
  else
  {
    __int16 v19 = [(IDSDAccount *)self accountAndAdHocAccounts];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v46 = [v19 countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v46)
    {
      id v43 = v3;
      uint64_t v44 = *(void *)v66;
      long long v22 = self;
      long long v48 = v19;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v66 != v44) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v65 + 1) + 8 * v23);
          uint64_t v25 = [(IDSDAccount *)v22 dsHandle];
          uint64_t v49 = (void *)v25;
          uint64_t v50 = v23;
          if (v25)
          {
            uint64_t v26 = v25;
            long long v27 = [(IDSDAccount *)v22 service];
            long long v28 = [v27 identifier];
            long long v29 = +[IDSURI URIWithPrefixedURI:v26 withServiceLoggingHint:v28];
            id v30 = [v5 arrayByAddingObject:v29];
          }
          else
          {
            id v30 = v5;
          }
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v53 = v30;
          __int16 v52 = (char *)[v53 countByEnumeratingWithState:&v61 objects:v75 count:16];
          if (v52)
          {
            uint64_t v51 = *(void *)v62;
            do
            {
              unsigned int v31 = 0;
              do
              {
                if (*(void *)v62 != v51) {
                  objc_enumerationMutation(v53);
                }
                id obja = v31;
                uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v31);
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                id v33 = v53;
                id v34 = [v33 countByEnumeratingWithState:&v57 objects:v74 count:16];
                if (v34)
                {
                  id v35 = v34;
                  uint64_t v36 = *(void *)v58;
                  do
                  {
                    for (j = 0; j != v35; j = (char *)j + 1)
                    {
                      if (*(void *)v58 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      uint64_t v38 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
                      id v39 = [(IDSDAccount *)self peerIDManager];
                      __int16 v40 = [v24 service];
                      unsigned int v41 = [v40 queryService];
                      [v39 forgetPeerTokensForURI:v38 fromURI:v32 service:v41];
                    }
                    id v35 = [v33 countByEnumeratingWithState:&v57 objects:v74 count:16];
                  }
                  while (v35);
                }

                unsigned int v31 = obja + 1;
              }
              while (obja + 1 != v52);
              __int16 v52 = (char *)[v33 countByEnumeratingWithState:&v61 objects:v75 count:16];
            }
            while (v52);
          }

          uint64_t v23 = v50 + 1;
          id v5 = v45;
          long long v22 = self;
          __int16 v19 = v48;
        }
        while ((id)(v50 + 1) != v46);
        id v46 = [v48 countByEnumeratingWithState:&v65 objects:v76 count:16];
      }
      while (v46);
      id v3 = v43;
    }
  }
}

- (void)_updateSessionsForAllRegisteredURIs
{
  id v4 = [(IDSDAccount *)self primaryRegistration];
  id v3 = [v4 uris];
  [(IDSDAccount *)self _updateSessionsWithRegisteredURIs:v3];
}

- (void)_updateSessionsWithRegisteredURIs:(id)a3
{
}

- (void)_updateSessionsWithRegisteredURIs:(id)a3 retryIfNotRegistered:(BOOL)a4
{
  BOOL v4 = a4;
  id v36 = a3;
  id v6 = [(IDSDAccount *)self registration];
  uint64_t v7 = (uint64_t)[v6 registrationStatus];

  if (v7 > 7)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10020E5D4;
    v42[3] = &unk_10097E990;
    v42[4] = self;
    id v15 = objc_msgSend(v36, "__imArrayByApplyingBlock:", v42);
    uint64_t v16 = +[IMRGLog GDR];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(IDSDAccount *)self service];
      id v18 = [v17 queryService];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v36;
      __int16 v48 = 2112;
      CFStringRef v49 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating active URIs: %@   service: %@", buf, 0x16u);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v15;
    id v19 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v39;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v23 = [(IDSDAccount *)self peerIDManager];
          uint64_t v24 = [(IDSDAccount *)self service];
          uint64_t v25 = [v24 queryService];
          uint64_t v26 = [(id)v23 activeURIsFromURI:v22 service:v25];

          LOBYTE(v23) = [(__CFString *)v26 count] == 0;
          long long v27 = +[IMRGLog GDR];
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v23)
          {
            if (v28)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v22;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "   No active sessions from: %@", buf, 0xCu);
            }
          }
          else
          {
            if (v28)
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v22;
              __int16 v48 = 2112;
              CFStringRef v49 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "   Sending to active sessions for URI: %@   sessions: %@", buf, 0x16u);
            }

            long long v27 = +[NSDictionary dictionary];
            long long v29 = [v22 unprefixedURI];
            id v30 = +[NSSet setWithArray:v26];
            unsigned int v31 = +[IDSDestination destinationWithDestinations:v30];
            uint64_t v32 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
            LOWORD(v35) = 256;
            LOWORD(v34) = 0;
            LOWORD(v33) = 0;
            -[IDSDAccount sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:](self, "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:", v27, 0, 0, v29, v31, 1, 0, v33, v32, &off_1009D18D8, v34, 0, 0, 300, v35,
              0,
              0);
          }
        }
        id v19 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v8 = +[IMRGLog GDR];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = [(IDSRegistration *)self->_registrationInfo registrationStatus];
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      uint64_t v11 = [(IDSDAccount *)self service];
      unsigned int v12 = [v11 queryService];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v48 = 2112;
      CFStringRef v49 = v10;
      __int16 v50 = 2112;
      id v51 = v36;
      __int16 v52 = 2112;
      id v53 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not registered. Waiting to send the 130 { registrationStatus: %ld, retry: %@, registeredURIs: %@, service: %@ }", buf, 0x2Au);
    }
    if (v4)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v13 = [(IDSDAccount *)self _unregistered130RetryInterval];
      id v14 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10020E580;
      block[3] = &unk_100981968;
      objc_copyWeak(&v45, (id *)buf);
      id v44 = v36;
      dispatch_after(v13, v14, block);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (unint64_t)_unregistered130RetryInterval
{
  return dispatch_time(0, 10000000000);
}

- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![(IDSRegistration *)self->_registrationInfo registrationType])
  {
    unsigned int v12 = [v9 userUniqueIdentifier];
    dispatch_time_t v13 = [(IDSDAccount *)self userUniqueIdentifier];
    unsigned int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      id v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Succeeded SMS identification with info: %@    number: %@  token: %@", (uint8_t *)&v17, 0x20u);
      }

      [(IDSRegistration *)self->_registrationInfo setPhoneNumber:v10];
      [(IDSRegistration *)self->_registrationInfo setMainID:v10];
      [(IDSRegistration *)self->_registrationInfo setAuthenticationToken:v11];
      uint64_t v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating caller ID to phone number: %@", (uint8_t *)&v17, 0xCu);
      }

      [(IDSDAccount *)self _updatePhoneNumberCallerID];
    }
  }
}

- (void)registrationController:(id)a3 registrationWillStart:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v5)
  {
    if (![(IDSDAccount *)self isRegistrationActive])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
      goto LABEL_8;
    }
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100718B68(self);
      }
LABEL_8:

      goto LABEL_9;
    }
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100718BF8(self);
      }
      goto LABEL_8;
    }
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting registration for: %@", (uint8_t *)&v8, 0xCu);
    }

    if ([(IDSRegistration *)v5 registrationStatus] == -1) {
      [(IDSRegistration *)v5 setRegistrationStatus:3];
    }
    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
  }
LABEL_9:
}

- (void)registrationController:(id)a3 registrationUpdated:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v5)
  {
    if (![(IDSDAccount *)self isRegistrationActive])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
      goto LABEL_8;
    }
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100718C88(self);
      }
LABEL_8:

      goto LABEL_9;
    }
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100718D18(self);
      }
      goto LABEL_8;
    }
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating registration for: %@", (uint8_t *)&v8, 0xCu);
    }

    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
  }
LABEL_9:
}

- (void)registrationController:(id)a3 registrationSucceeded:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v7)
  {
    if (![(IDSDAccount *)self isRegistrationActive])
    {
      int v8 = +[IMRGLog warning];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
      goto LABEL_108;
    }
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      int v8 = +[IMRGLog warning];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100718DA8(self);
      }
LABEL_108:

      goto LABEL_109;
    }
    if ([(IDSDAccount *)self accountType] == 2)
    {
      int v8 = +[IMRGLog warning];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100718E38(self);
      }
      goto LABEL_108;
    }
    id v9 = +[IDSRegistrationController sharedInstance];
    id v10 = [v9 trackedRegistrations];
    [v10 containsObjectIdenticalTo:v7];

    id v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100718EC8();
    }

    [(IDSDAccount *)self _refreshRegistration];
    unsigned int v12 = [(IDSRegistration *)self->_registrationInfo registrationType];
    registrationInfo = self->_registrationInfo;
    if (v12)
    {
      if ([(IDSRegistration *)registrationInfo registrationType] == 2
        && ![(IDSDAccount *)self hasEverRegistered])
      {
        [(IDSDAccount *)self _updateCallerIDToTemporaryPhone];
      }
    }
    else
    {
      unsigned int v14 = [(IDSRegistration *)registrationInfo phoneNumber];
      if (v14)
      {
        id v15 = +[NSDictionary dictionaryWithObject:v14 forKey:kIDSServiceDefaultsLoginAsKey];
        [(IDSDAccount *)self writeAccountDefaults:v15];
      }
    }
    uint64_t v16 = [(IDSRegistration *)v7 serviceIdentifier];
    int v17 = IDSIsGameCenterRegistrationServiceType();

    if (v17)
    {
      id v18 = +[IMRGLog registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [(IDSRegistration *)v7 contextInfo];
        *(_DWORD *)buf = 138412290;
        id v102 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Getting GameCenter Data from registration with contextInfo: %@", buf, 0xCu);
      }
      id v20 = [(IDSRegistration *)v7 contextInfo];
      __int16 v21 = [v20 objectForKey:IDSGameCenterContactsLastUpdatedDate];

      if (v21)
      {
        [v21 doubleValue];
        id v22 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
      }
      else
      {
        id v22 = 0;
      }
      id v23 = objc_alloc((Class)IDSGameCenterData);
      uint64_t v24 = [(IDSRegistration *)v7 contextInfo];
      uint64_t v25 = [v24 objectForKey:IDSGameCenterContactsAssociationID];
      uint64_t v26 = [(IDSRegistration *)v7 contextInfo];
      long long v27 = [v26 objectForKey:IDSGameCenterContactsSharingState];
      id v28 = [v23 initWithAssociationID:v25 sharingState:v27 lastUpdatedDate:v22];

      [(IDSDAccount *)self setGameCenterData:v28];
    }
    [(IDSRegistration *)v7 saveToKeychain];
    long long v29 = [(IDSDAccount *)self vettedAliases];
    id v30 = +[IMRGLog registration];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = v7;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Saved: %@", buf, 0xCu);
    }

    unsigned int v31 = +[IMRGLog registration];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "vettedAliases: %@", buf, 0xCu);
    }

    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
    uint64_t v32 = +[IMRGLog registration];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Checking to see if I should confirm aliases for: %@", buf, 0xCu);
    }
    id v79 = v7;
    id v80 = v6;

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v33 = [(IDSDAccount *)self aliases];
    id v34 = [v33 countByEnumeratingWithState:&v93 objects:v100 count:16];
    if (v34)
    {
      id v35 = v34;
      id v36 = 0;
      uint64_t v37 = *(void *)v94;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v94 != v37) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = *(void *)(*((void *)&v93 + 1) + 8 * i);
          if (([(IDSRegistration *)v29 containsObject:v39] & 1) == 0
            && [(IDSDAccount *)self validationStatusForAlias:v39] <= 1)
          {
            if (!v36) {
              id v36 = (IDSRegistration *)objc_alloc_init((Class)NSMutableSet);
            }
            [(IDSRegistration *)v36 addObject:v39];
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v93 objects:v100 count:16];
      }
      while (v35);
    }
    else
    {
      id v36 = 0;
    }

    long long v40 = +[IMRGLog registration];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v102 = v36;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Aliases that are unvalidated: %@", buf, 0xCu);
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v41 = v36;
    id v42 = (char *)[(IDSRegistration *)v41 countByEnumeratingWithState:&v89 objects:v99 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v90;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(void *)v90 != v44) {
            objc_enumerationMutation(v41);
          }
          int IsEmail = IMStringIsEmail();
          __int16 v47 = IMSingleObjectArray();
          if (IsEmail) {
            [(IDSDAccount *)self _validateAliases:v47];
          }
          else {
            [(IDSDAccount *)self _removeAliases:v47 withReason:2];
          }
        }
        id v43 = (char *)[(IDSRegistration *)v41 countByEnumeratingWithState:&v89 objects:v99 count:16];
      }
      while (v43);
    }

    if ([(IDSRegistration *)self->_registrationInfo registrationType] == 1)
    {
      __int16 v48 = +[IMRGLog registration];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v102 = v41;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Aliases that are unvalidated: %@", buf, 0xCu);
      }

      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      CFStringRef v49 = [(IDSRegistration *)self->_registrationInfo uris];
      id v50 = [v49 countByEnumeratingWithState:&v85 objects:v98 count:16];
      if (v50)
      {
        id v51 = v50;
        id v52 = 0;
        uint64_t v53 = *(void *)v86;
        do
        {
          for (k = 0; k != v51; k = (char *)k + 1)
          {
            if (*(void *)v86 != v53) {
              objc_enumerationMutation(v49);
            }
            uint64_t v55 = [*(id *)(*((void *)&v85 + 1) + 8 * (void)k) _stripFZIDPrefix];
            if ([v55 length])
            {
              if (!v52) {
                id v52 = objc_alloc_init((Class)NSMutableArray);
              }
              [v52 addObject:v55];
              __int16 v56 = [(IDSDAccount *)self aliases];
              unsigned __int8 v57 = [v56 containsObject:v55];

              if ((v57 & 1) == 0)
              {
                long long v58 = IMSingleObjectArray();
                [(IDSDAccount *)self _addAliases:v58];
              }
              [(IDSDAccount *)self _setValidationStatus:3 error:0xFFFFFFFFLL forAlias:v55 info:0 addToCurrentHandlesIfNeeded:1 forceAdd:0];
            }
          }
          id v51 = [v49 countByEnumeratingWithState:&v85 objects:v98 count:16];
        }
        while (v51);
      }
      else
      {
        id v52 = 0;
      }

      if ([v52 count])
      {
        uint64_t v59 = +[NSSet setWithArray:v52];
      }
      else
      {
        uint64_t v59 = 0;
      }
      long long v60 = [(IDSDAccount *)self aliases];
      if ([v60 count])
      {
        long long v61 = +[NSMutableSet setWithArray:v60];
      }
      else
      {
        long long v61 = 0;
      }
      objc_msgSend(v61, "minusSet:", v59, v59);
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v62 = v61;
      id v63 = [v62 countByEnumeratingWithState:&v81 objects:v97 count:16];
      if (v63)
      {
        id v64 = v63;
        uint64_t v65 = *(void *)v82;
        uint64_t v66 = kIDSServiceDefaultsSentinelAlias;
        do
        {
          for (m = 0; m != v64; m = (char *)m + 1)
          {
            if (*(void *)v82 != v65) {
              objc_enumerationMutation(v62);
            }
            long long v68 = *(void **)(*((void *)&v81 + 1) + 8 * (void)m);
            if ([v68 isEqualToIgnoringCase:v66])
            {
              uint64_t v69 = 3;
            }
            else
            {
              if ((id)[(IDSDAccount *)self _validationStatusForAlias:v68] == (id)2) {
                continue;
              }
              uint64_t v69 = 1;
            }
            [(IDSDAccount *)self _setValidationStatus:v69 error:0xFFFFFFFFLL forAlias:v68 info:0 addToCurrentHandlesIfNeeded:1 forceAdd:1];
          }
          id v64 = [v62 countByEnumeratingWithState:&v81 objects:v97 count:16];
        }
        while (v64);
      }
    }
    uint64_t v7 = v79;
    id v6 = v80;
    if ((*((unsigned char *)self + 80) & 4) != 0)
    {
      *((unsigned char *)self + 80) &= ~4u;
      long long v70 = +[IMRGLog registration];
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Forcing a handles query request post-register to pull the current state", buf, 2u);
      }

      [(IDSDAccount *)self _updateHandles:1];
    }
    long long v71 = [(IDSDAccount *)self accountInfo];
    long long v72 = (const void *)kIDSServiceDefaultsAuthorizationIDKey;
    int v8 = [v71 objectForKey:kIDSServiceDefaultsAuthorizationIDKey];

    long long v73 = [(IDSRegistration *)self->_registrationInfo profileID];
    if (![v8 length] && [(IDSRegistration *)v73 length])
    {
      long long v74 = +[IMRGLog registration];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v102 = v73;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Finished registering without profileID, setting profileID %@ onto account", buf, 0xCu);
      }

      long long v75 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v76 = v75;
      if (v73) {
        CFDictionarySetValue(v75, v72, v73);
      }
      [(IDSDAccount *)self writeAccountDefaults:v76];
    }
    [(IDSDAccount *)self _issueCriticalDependentCheck];
    long long v77 = +[NSDictionary dictionaryWithObject:&__kCFBooleanTrue forKey:kIDSServiceDefaultsHasEverRegistered];
    [(IDSDAccount *)self writeAccountDefaults:v77];

    goto LABEL_108;
  }
LABEL_109:
}

- (void)registrationController:(id)a3 registrationFailed:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = (IDSRegistration *)a4;
  id v10 = a6;
  if (self->_registrationInfo == v9)
  {
    if (![(IDSDAccount *)self isRegistrationActive])
    {
      id v11 = +[IMRGLog warning];
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
      goto LABEL_80;
    }
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v11 = +[IMRGLog warning];
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
        sub_100718F64(self);
      }
      goto LABEL_80;
    }
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v11 = +[IMRGLog warning];
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
        sub_100718FF4(self);
      }
      goto LABEL_80;
    }
    id v11 = self;
    unsigned int v12 = +[IMRGLog warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10071920C();
    }

    [(IDSDAccount *)v11 _updateRegistrationStatusWithError:a5 info:v10];
    dispatch_time_t v13 = +[IMRGLog warning];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100719188(a5);
    }

    int v14 = 0;
    switch(a5)
    {
      case 29:
        id v20 = +[IMRGLog warning];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_100719120();
        }
        goto LABEL_68;
      case 30:
        id v20 = +[IMRGLog warning];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_1007190EC();
        }
        goto LABEL_68;
      case 31:
      case 36:
      case 38:
        id v15 = +[IMRGLog warning];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_100719084();
        }

        [(IDSRegistration *)v9 removeFromKeychain];
        if ([(IDSRegistration *)v9 registrationType] != 2) {
          goto LABEL_69;
        }
        uint64_t v16 = +[IMRGLog registration];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_66;
        }
        goto LABEL_67;
      case 32:
      case 33:
      case 34:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
        goto LABEL_70;
      case 35:
        id v20 = +[IMRGLog registration];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        __int16 v21 = " => User has disabled SMS Authentication, disabling the account";
        goto LABEL_59;
      case 37:
LABEL_29:
        [(IDSRegistration *)v9 removeFromKeychain];
        if (![(IDSRegistration *)v9 registrationType])
        {
          [(IDSRegistration *)v9 setMainID:0];
          [(IDSRegistration *)v9 setAuthenticationToken:0];
          [(IDSRegistration *)v9 setAuthenticationCert:0];
          id v34 = +[IDSPACStateTracker sharedInstance];
          [v34 notePhoneAuthCertLost:5];

          id v35 = +[IMRGLog registration];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v68 = (int64_t)v9;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, " => Will retry SMS Registration: %@", buf, 0xCu);
          }

          id v36 = +[IMRGLog registration];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v68 = (int64_t)v9;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, " => Resetting status to waiting for auth response: %@", buf, 0xCu);
          }

          [(IDSRegistration *)v9 setRegistrationStatus:4];
          [(IDSDAccount *)v11 _updateRegistrationStatusWithError:-1 info:0];
          uint64_t v37 = +[IDSRegistrationReasonTracker sharedInstance];
          long long v38 = [(IDSRegistration *)v9 userUniqueIdentifier];
          [v37 setPNRReason:6 forUserUniqueIdentifier:v38];

          id v26 = +[IDSSMSRegistrationCenter sharedInstance];
          [v26 sendRegistration:v9];
          goto LABEL_79;
        }
        if ([(IDSRegistration *)v9 registrationType] == 1)
        {
          int v22 = [(IDSRegistration *)v9 retries];
          id v23 = +[IMRGLog registration];
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v22 <= 2)
          {
            id v56 = v10;
            unsigned __int8 v57 = v11;
            if (v24)
            {
              *(_DWORD *)buf = 138412290;
              int64_t v68 = (int64_t)v9;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " => Will retry Authentication: %@", buf, 0xCu);
            }

            [(IDSRegistration *)v9 setRetries:[(IDSRegistration *)v9 retries] + 1];
            [(IDSRegistration *)v9 setRegistrationCert:0];
            [(IDSRegistration *)v9 setAuthenticationToken:0];
            uint64_t v25 = [(IDSRegistration *)v9 confirmedEmails];
            [(IDSRegistration *)v9 setUris:0];
            [(IDSRegistration *)v9 saveToKeychain];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v26 = v25;
            id v27 = [v26 countByEnumeratingWithState:&v62 objects:v66 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v63;
              do
              {
                for (i = 0; i != v28; i = (char *)i + 1)
                {
                  if (*(void *)v63 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  int64_t v31 = *(void *)(*((void *)&v62 + 1) + 8 * i);
                  uint64_t v32 = +[IMRGLog registration];
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    int64_t v68 = v31;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, " => Added confirmed emails: %@", buf, 0xCu);
                  }

                  [(IDSRegistration *)v9 addCandidateEmail:v31];
                }
                id v28 = [v26 countByEnumeratingWithState:&v62 objects:v66 count:16];
              }
              while (v28);
            }

            uint64_t v33 = [(IDSRegistration *)v9 authenticationToken];

            if (!v33)
            {
              [(IDSRegistration *)v9 setRegistrationStatus:3];
              id v11 = v57;
              [(IDSDAccount *)v57 _updateRegistrationStatusWithError:-1 info:0];
              uint64_t v55 = +[IDSAppleIDRegistrationCenter sharedInstance];
              [v55 authenticateRegistration:v9 forceNewToken:1];

              goto LABEL_86;
            }
            id v11 = v57;
            if ([(IDSRegistration *)v9 registrationStatus] >= 6)
            {
              sub_100148904(v9);
LABEL_86:
              id v10 = v56;
              goto LABEL_79;
            }

            int v14 = 0;
            id v10 = v56;
            goto LABEL_70;
          }
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " => Not retrying, max retries hit", buf, 2u);
          }

          [(IDSRegistration *)v9 setRetries:0];
        }
        else if ([(IDSRegistration *)v9 registrationType] == 2)
        {
          uint64_t v16 = +[IMRGLog registration];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
LABEL_66:
            *(_DWORD *)buf = 134218242;
            int64_t v68 = a5;
            __int16 v69 = 2112;
            long long v70 = v9;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, " => Nuking Home Number user {error: %ld, registration: %@}", buf, 0x16u);
          }
LABEL_67:

          long long v40 = +[IDSDaemon sharedInstance];
          long long v41 = [v40 registrationConductor];
          id v42 = [v41 userStore];
          id v43 = [(IDSRegistration *)v9 userUniqueIdentifier];
          id v20 = [v42 userWithUniqueIdentifier:v43];

          uint64_t v44 = +[IDSDaemon sharedInstance];
          id v45 = [v44 registrationConductor];
          id v46 = [v45 userStore];
          [v46 forceRemoveUser:v20 silently:0];

LABEL_68:
        }
LABEL_69:
        int v14 = 0;
LABEL_70:
        [(IDSDAccount *)v11 _stopRegistrationAgent];
        id v47 = objc_alloc_init((Class)IMMessageContext);
        [v47 setShouldBoost:0];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_1002103E4;
        v58[3] = &unk_1009826B8;
        id v26 = v47;
        id v59 = v26;
        long long v60 = v11;
        char v61 = v14;
        [(IDSDAccount *)v11 _broadcastAccountMessageBlock:v58];
        __int16 v48 = +[IMRGLog warning];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v49 = @"NO";
          if (v14) {
            CFStringRef v49 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          int64_t v68 = (int64_t)v49;
          __int16 v69 = 2112;
          long long v70 = v9;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Needs deletion: %@ (%@)", buf, 0x16u);
        }

        id v50 = [(IDSDAccount *)v11 accountController];
        id v51 = [(IDSDAccount *)v11 uniqueID];
        [v50 disablePrimaryAccountWithUniqueID:v51];

        if (v14)
        {
          id v52 = +[IMRGLog warning];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v53 = [(IDSDAccount *)v11 uniqueID];
            *(_DWORD *)buf = 138412290;
            int64_t v68 = (int64_t)v53;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Deleting account ID: %@", buf, 0xCu);
          }
          id v54 = [(IDSDAccount *)v11 accountController];
          [v54 removeAccount:v11];
        }
LABEL_79:

LABEL_80:
        break;
      case 39:
        id v20 = +[IMRGLog registration];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        __int16 v21 = " => User has disabled SMS Registration, disabling the account";
        goto LABEL_59;
      case 47:
      case 48:
      case 49:
        id v20 = +[IMRGLog registration];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        __int16 v21 = " => User has KT enabled, but the account key needs a refresh.";
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
        goto LABEL_68;
      default:
        switch(a5)
        {
          case 1:
            int v14 = 1;
            break;
          case 3:
          case 4:
            int v17 = +[IMRGLog warning];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
              sub_100719154();
            }

            if (IMGetCachedDomainBoolForKey())
            {
              id v18 = +[IMUserNotification userNotificationWithIdentifier:@"Disabled" title:@"FaceTime" message:@"Too many SMS attempts, you can re-enable this in Preferences" defaultButton:@"OK" alternateButton:0 otherButton:0];
              __int16 v19 = +[IMUserNotificationCenter sharedInstance];
              [v19 addUserNotification:v18 listener:0];
            }
            id v20 = +[IDSSMSRegistrationCenter sharedInstance];
            [v20 notePhoneNumberRegistrationReset];
            goto LABEL_68;
          case 5:
          case 12:
            break;
          case 10:
          case 11:
            goto LABEL_29;
          default:
            goto LABEL_70;
        }
        uint64_t v39 = +[IMRGLog warning];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          sub_1007190B8();
        }

        [(IDSRegistration *)v9 removeFromKeychain];
        goto LABEL_70;
    }
  }
}

- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4
{
  if (self->_registrationInfo == a4)
  {
    if (![(IDSDAccount *)self isRegistrationActive])
    {
      id v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
      goto LABEL_11;
    }
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100719284(self);
      }
LABEL_11:

      return;
    }
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100719314(self);
      }
      goto LABEL_11;
    }
    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
  }
}

- (void)registrationController:(id)a3 deregistrationSucceeded:(id)a4
{
  if (self->_registrationInfo == a4)
  {
    if ([(IDSDAccount *)self isRegistrationActive])
    {
      if ([(IDSDAccount *)self isAdHocAccount])
      {
        id v5 = +[IMRGLog warning];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1007193A4(self);
        }
      }
      else if ([(IDSDAccount *)self accountType] == 2)
      {
        id v5 = +[IMRGLog warning];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_100719434(self);
        }
      }
      else
      {
        [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
        id v5 = +[IMRGLog registration];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          registrationInfo = self->_registrationInfo;
          uint64_t v7 = [(IDSDAccount *)self uniqueID];
          int v8 = 138412546;
          id v9 = registrationInfo;
          __int16 v10 = 2112;
          id v11 = v7;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deregistration succeeded for %@ - %@", (uint8_t *)&v8, 0x16u);
        }
      }
    }
    else
    {
      id v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
    }
  }
}

- (void)registrationControllerNeedsNewRegistration:(id)a3
{
  if ([(IDSRegistration *)self->_registrationInfo isDisabled])
  {
    BOOL v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      registrationInfo = self->_registrationInfo;
      int v8 = 138412290;
      id v9 = registrationInfo;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignoring re-identification request, registration is disabled: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if ([(IDSRegistration *)self->_registrationInfo registrationType])
  {
    if ([(IDSRegistration *)self->_registrationInfo registrationType] == 1)
    {
      id v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration controller requested new SMS registration -- noting that we should re-query handles", (uint8_t *)&v8, 2u);
      }

      *((unsigned char *)self + 80) |= 4u;
    }
  }
  else
  {
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Registration controller requested new SMS registration -- starting from scratch", (uint8_t *)&v8, 2u);
    }

    [(IDSDAccount *)self _reregisterAndReidentify:1];
  }
}

- (void)center:(id)a3 startedAuthenticating:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1007194C4(self);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100719554(self);
    }
    goto LABEL_7;
  }
  if (self->_registrationInfo == v5)
  {
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started authenticating for info: %@", (uint8_t *)&v8, 0xCu);
    }

    [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
  }
LABEL_8:
}

- (void)center:(id)a3 succeededAuthentication:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v5)
  {
    if ([(IDSDAccount *)self isRegistrationActive])
    {
      if ([(IDSDAccount *)self isAdHocAccount])
      {
        id v6 = +[IMRGLog warning];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1007195E4(self);
        }
      }
      else if ([(IDSDAccount *)self accountType] == 2)
      {
        id v6 = +[IMRGLog warning];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100719674(self);
        }
      }
      else
      {
        uint64_t v7 = +[IMRGLog registration];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Succeeded authentication for info: %@", (uint8_t *)&v14, 0xCu);
        }

        int v8 = +[IMRGLog registration];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [(IDSRegistration *)v5 profileID];
          int v14 = 138412290;
          id v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating profileID: %@", (uint8_t *)&v14, 0xCu);
        }
        id v6 = objc_alloc_init((Class)NSMutableDictionary);
        __int16 v10 = [(IDSRegistration *)v5 profileID];
        if (v10) {
          CFDictionarySetValue((CFMutableDictionaryRef)v6, kIDSServiceDefaultsAuthorizationIDKey, v10);
        }

        id v11 = [(IDSRegistration *)v5 authenticationToken];
        unsigned int v12 = [(IDSDAccount *)self loginID];
        dispatch_time_t v13 = IMCanonicalFormForEmail();
        IMSetKeychainAuthToken();

        [(IDSDAccount *)self writeAccountDefaults:v6];
        [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
      }
    }
    else
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
    }
  }
}

- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = (IDSRegistration *)a4;
  id v10 = a6;
  if (self->_registrationInfo == v9)
  {
    if ([(IDSDAccount *)self isRegistrationActive])
    {
      if ([(IDSDAccount *)self isAdHocAccount])
      {
        id v11 = +[IMRGLog warning];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100719704(self);
        }
      }
      else if ([(IDSDAccount *)self accountType] == 2)
      {
        id v11 = +[IMRGLog warning];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100719794(self);
        }
      }
      else
      {
        id v11 = objc_alloc_init((Class)NSMutableDictionary);
        unsigned int v12 = +[IMRGLog warning];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_100719824();
        }

        if ([(IDSRegistration *)v9 registrationType] == 1
          && (id v13 = [(IDSRegistration *)v9 registrationStatus], a5 == 17)
          && v13 == (id)8)
        {
          int v14 = +[IMRGLog registration];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Auth failed but we're registered, ignoring...", buf, 2u);
          }
        }
        else
        {
          id v15 = +[IMRGLog registration];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing profileID", v19, 2u);
          }

          uint64_t v16 = +[NSNull null];
          if (v16) {
            CFDictionarySetValue((CFMutableDictionaryRef)v11, kIDSServiceDefaultsAuthorizationIDKey, v16);
          }

          int v17 = [(IDSDAccount *)self serviceType];
          id v18 = [(IDSDAccount *)self loginID];
          IMRemoveKeychainAuthToken();

          [(IDSDAccount *)self writeAccountDefaults:v11];
          if ([v10 count]) {
            [(IDSDAccount *)self setRegistrationStatus:[(IDSDAccount *)self registrationStatus] error:[(IDSDAccount *)self registrationError] alertInfo:v10];
          }
        }
      }
    }
    else
    {
      id v11 = +[IMRGLog warning];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
    }
  }
}

- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5
{
  uint64_t v7 = (IDSRegistration *)a4;
  id v8 = a5;
  if (self->_registrationInfo == v7)
  {
    if (![(IDSDAccount *)self isRegistrationActive])
    {
      id v9 = +[IMRGLog warning];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
      goto LABEL_8;
    }
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v9 = +[IMRGLog warning];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10071989C(self);
      }
LABEL_8:

      goto LABEL_9;
    }
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v9 = +[IMRGLog warning];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10071992C(self);
      }
      goto LABEL_8;
    }
    id v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      int v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Succeeded Validated Email Query info: %@    Emails: %@  (Session: %@)", (uint8_t *)&v12, 0x20u);
    }

    if ([(IDSDAccount *)self accountType] == 1)
    {
      id v11 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &stru_100986398);
      [(IDSDAccount *)self _updateVettedAliases:v11 emailInfo:v8 addToCurrentHandlesIfNeeded:0];
    }
    [(IDSDAccount *)self _updatePseudonymsFromEmailInfo:v8];
  }
LABEL_9:
}

- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_registrationInfo == a4)
  {
    if ([(IDSDAccount *)self isRegistrationActive])
    {
      if ([(IDSDAccount *)self isAdHocAccount])
      {
        __int16 v16 = +[IMRGLog warning];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1007199BC(self);
        }
      }
      else if ([(IDSDAccount *)self accountType] == 2)
      {
        __int16 v16 = +[IMRGLog warning];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100719A4C(self);
        }
      }
      else
      {
        int v17 = +[IMRGLog registration];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v18 = @"NO";
          *(_DWORD *)id v26 = 138413058;
          *(void *)&void v26[4] = v13;
          if (v8) {
            CFStringRef v18 = @"YES";
          }
          *(_WORD *)&v26[12] = 2112;
          *(void *)&v26[14] = v14;
          __int16 v27 = 2112;
          id v28 = v15;
          __int16 v29 = 2112;
          CFStringRef v30 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Succeeded region validation with region ID: %@  phoneNumber: %@  context: %@  verified: %@", v26, 0x2Au);
        }

        __int16 v19 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        __int16 v16 = v19;
        if (v13) {
          CFDictionarySetValue(v19, kIDSServiceDefaultsProfileRegionIDKey, v13);
        }
        if (v14) {
          CFDictionarySetValue((CFMutableDictionaryRef)v16, kIDSServiceDefaultsProfileBaseNumberKey, v14);
        }
        if (v15) {
          CFDictionarySetValue((CFMutableDictionaryRef)v16, kIDSServiceDefaultsProfileServerContextKey, v15);
        }
        if (v8) {
          uint64_t v20 = 3;
        }
        else {
          uint64_t v20 = 1;
        }
        __int16 v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20, *(_OWORD *)v26);
        if (v21) {
          CFDictionarySetValue((CFMutableDictionaryRef)v16, kIDSServiceDefaultsProfileValdationStatusKey, v21);
        }

        int v22 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
        if (v22) {
          CFDictionarySetValue((CFMutableDictionaryRef)v16, kIDSServiceDefaultsProfileValdationErrorCodeKey, v22);
        }

        id v23 = +[NSDictionary dictionaryWithObject:v16 forKey:kIDSServiceDefaultsProfileKey];
        [(IDSDAccount *)self writeAccountDefaults:v23];

        [(IDSRegistration *)self->_registrationInfo setRegionID:v13];
        [(IDSRegistration *)self->_registrationInfo setRegionBasePhoneNumber:v14];
        [(IDSRegistration *)self->_registrationInfo setRegionServerContext:v15];
        if ([(IDSDAccount *)self isDeviceRegistered]) {
          [(IDSRegistration *)self->_registrationInfo saveToKeychain];
        }
        if ([(IDSDAccount *)self isDeviceRegistered]
          || [(IDSDAccount *)self isDeviceAuthenticated])
        {
          [(IDSDAccount *)self _updateRegistrationStatusWithError:-1 info:0];
        }
        BOOL v24 = +[IMRGLog registration];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          registrationInfo = self->_registrationInfo;
          *(_DWORD *)id v26 = 138412290;
          *(void *)&void v26[4] = registrationInfo;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Resulting registration info: %@", v26, 0xCu);
        }
      }
    }
    else
    {
      __int16 v16 = +[IMRGLog warning];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
    }
  }
}

- (void)center:(id)a3 failedRegionValidation:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = (IDSRegistration *)a4;
  id v10 = a6;
  if (self->_registrationInfo == v9)
  {
    if ([(IDSDAccount *)self isRegistrationActive])
    {
      if ([(IDSDAccount *)self isAdHocAccount])
      {
        id v11 = +[IMRGLog warning];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100719ADC(self);
        }
      }
      else
      {
        unsigned int v12 = [(IDSDAccount *)self accountType];
        id v13 = +[IMRGLog warning];
        id v11 = v13;
        if (v12 == 2)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_100719B6C(self);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            int v17 = sub_10014877C(a5);
            int v18 = 138412802;
            __int16 v19 = v9;
            __int16 v20 = 2112;
            __int16 v21 = v17;
            __int16 v22 = 2112;
            id v23 = v10;
            _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed region validation for registration info: %@      error: %@   info: %@", (uint8_t *)&v18, 0x20u);
          }
          id v11 = objc_alloc_init((Class)NSMutableDictionary);
          id v14 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
          if (v14) {
            CFDictionarySetValue((CFMutableDictionaryRef)v11, kIDSServiceDefaultsProfileValdationStatusKey, v14);
          }

          id v15 = +[NSNumber numberWithInt:2];
          if (v15) {
            CFDictionarySetValue((CFMutableDictionaryRef)v11, kIDSServiceDefaultsProfileValdationErrorCodeKey, v15);
          }

          [(IDSRegistration *)self->_registrationInfo setRegionID:0];
          [(IDSRegistration *)self->_registrationInfo setRegionBasePhoneNumber:0];
          [(IDSRegistration *)self->_registrationInfo setRegionServerContext:0];
          if ([(IDSDAccount *)self isDeviceRegistered]) {
            [(IDSRegistration *)self->_registrationInfo saveToKeychain];
          }
          __int16 v16 = +[NSDictionary dictionaryWithObject:v11 forKey:kIDSServiceDefaultsProfileKey];
          [(IDSDAccount *)self writeAccountDefaults:v16];

          if ([v10 count]) {
            [(IDSDAccount *)self setRegistrationStatus:[(IDSDAccount *)self registrationStatus] error:[(IDSDAccount *)self registrationError] alertInfo:v10];
          }
        }
      }
    }
    else
    {
      id v11 = +[IMRGLog warning];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100717B80(self);
      }
    }
  }
}

- (void)_acceptIncomingPushes
{
}

- (void)_ignoreIncomingPushes
{
}

- (id)_unprefixedURIStringsFromAccountInfo
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(IDSDAccount *)self _uriDictionariesFromAccountInfo];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = kIDSServiceDefaultsAliasKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) objectForKey:v8];
        if ([v10 length])
        {
          if (IMStringIsPhoneNumber())
          {
            uint64_t v11 = IMCanonicalizeFormattedString();

            id v10 = (void *)v11;
          }
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_uriDictionariesFromAccountInfo
{
  id v2 = [(IDSDAccount *)self accountInfo];
  id v3 = [v2 objectForKey:kIDSServiceDefaultsAliasesKey];
  BOOL v4 = objc_msgSend(v3, "__imArrayByApplyingBlock:", &stru_1009863B8);

  return v4;
}

- (int64_t)_validationStatusForAlias:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDAccount *)self vettedAliases];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) != 0
    || ([v4 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias] & 1) != 0)
  {
    int64_t v7 = 3;
  }
  else if ([v4 length])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [(IDSDAccount *)self _uriDictionariesFromAccountInfo];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = kIDSServiceDefaultsAliasKey;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v16 = [v15 objectForKey:v13];
          unsigned __int8 v17 = [v16 isEqualToString:v4];

          if (v17)
          {
            int v18 = [v15 objectForKey:kIDSServiceDefaultsAliasStatusKey];
            int64_t v7 = (int)[v18 intValue];

            goto LABEL_16;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    int64_t v7 = 0;
LABEL_16:
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8 aliasProperties:(id)a9
{
  id v41 = a5;
  id v15 = a6;
  id v16 = a9;
  if ([v41 length])
  {
    id v17 = v15;
    unsigned int v18 = [v41 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];
    if (v18) {
      int v19 = -1;
    }
    else {
      int v19 = a4;
    }
    int v38 = v19;
    int64_t v20 = 3;
    if (!v18) {
      int64_t v20 = a3;
    }
    uint64_t v39 = self;
    int64_t v40 = v20;
    long long v21 = [(IDSDAccount *)self _uriDictionariesFromAccountInfo];
    id v22 = [v21 mutableCopy];

    if (![v22 count]) {
      goto LABEL_13;
    }
    uint64_t v23 = 0;
    uint64_t v24 = kIDSServiceDefaultsAliasKey;
    while (1)
    {
      uint64_t v25 = [v22 objectAtIndex:v23];
      id v26 = [v25 objectForKey:v24];
      unsigned __int8 v27 = [v26 isEqualToString:v41];

      if (v27) {
        break;
      }
      if (++v23 >= (unint64_t)[v22 count]) {
        goto LABEL_13;
      }
    }
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v37 = [v22 objectAtIndex:v23];
      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v37 mutableCopy];

      char v29 = 0;
      id v15 = v17;
      if (Mutable) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_13:
      BOOL v28 = v40 == 3 && a7;
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      char v29 = 1;
      id v15 = v17;
      if (!v28 && !a8)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
LABEL_19:
    if (!v22) {
      id v22 = objc_alloc_init((Class)NSMutableArray);
    }
    int64_t v31 = [(IDSDAccount *)v39 invisibleAliases];
    uint64_t v32 = [v31 containsObject:v41] ^ 1;

    uint64_t v33 = +[NSNumber numberWithInteger:v40];
    [(__CFDictionary *)Mutable setObject:v33 forKey:kIDSServiceDefaultsAliasStatusKey];

    [(__CFDictionary *)Mutable setObject:v41 forKey:kIDSServiceDefaultsAliasKey];
    id v34 = +[NSNumber numberWithBool:v32];
    [(__CFDictionary *)Mutable setObject:v34 forKey:kIDSServiceDefaultsAliasIsUserVisibleKey];

    if (v16) {
      [(__CFDictionary *)Mutable addEntriesFromDictionary:v16];
    }
    if (v40 != -1 || v38 == -1)
    {
      [(__CFDictionary *)Mutable removeObjectForKey:kIDSServiceDefaultsAliasValidationErrorCodeKey];
    }
    else
    {
      id v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [(__CFDictionary *)Mutable setObject:v35 forKey:kIDSServiceDefaultsAliasValidationErrorCodeKey];
    }
    if (v29)
    {
      [v22 addObject:Mutable];
      [(IDSDAccount *)v39 markAsSelectedAlias:v41];
    }
    else
    {
      [v22 replaceObjectAtIndex:v23 withObject:Mutable];
    }
    id v36 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v22, kIDSServiceDefaultsAliasesKey, v15, kIDSServiceDefaultsAliasValidationAlertInfoKey, 0);
    [(IDSDAccount *)v39 writeAccountDefaults:v36];

    goto LABEL_31;
  }
LABEL_32:
}

- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8
{
}

- (void)_removeAliases:(id)a3 withReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  int64_t v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(IDSDAccount *)self uniqueID];
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2112;
    int64_t v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " => Remove aliases: %@   for: %@", buf, 0x16u);
  }
  id v9 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_1009863D8);

  id v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to remove aliases: %@", buf, 0xCu);
  }

  if ([v9 count])
  {
    id v11 = [(IDSDAccount *)self _uriDictionariesFromAccountInfo];
    uint64_t v12 = [v11 mutableCopy];

    id v13 = [v12 count];
    if ((uint64_t)v13 - 1 >= 0)
    {
      uint64_t v14 = (uint64_t)v13;
      char v34 = 0;
      uint64_t v15 = kIDSServiceDefaultsAliasKey;
      unsigned int v36 = v4;
      uint64_t v33 = v9;
      uint64_t v35 = kIDSServiceDefaultsAliasKey;
      while (1)
      {
        id v16 = -[NSObject objectAtIndex:](v12, "objectAtIndex:", --v14, v33);
        id v17 = [v16 objectForKey:v15];
        if (([v9 containsObject:v17] & 1) == 0)
        {
          if (![v17 _appearsToBePhoneNumber]) {
            goto LABEL_38;
          }
          unsigned int v18 = [@"+" stringByAppendingString:v17];
          unsigned int v19 = [v9 containsObject:v18];

          if (!v19) {
            goto LABEL_38;
          }
        }
        [v12 removeObjectAtIndex:v14];
        if (v4 == 2) {
          [(IDSDAccount *)self markAsUnvettedAlias:v17];
        }
        else {
          [(IDSDAccount *)self markAsUnselectedAlias:v17 withReason:v4];
        }
        if ((*((unsigned char *)self + 81) & 2) == 0) {
          goto LABEL_38;
        }
        int64_t v20 = [(IDSRegistration *)self->_registrationInfo candidateEmails];
        unsigned int v21 = [v20 containsObject:v17];

        if (v21)
        {
          [(IDSRegistration *)self->_registrationInfo removeCandidateEmail:v17];
          id v22 = +[IMRGLog registration];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v17;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Removing candidate email: %@", buf, 0xCu);
          }
          char v34 = 1;
        }
        else
        {
          id v22 = +[IMRGLog registration];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v17;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Email was candidate, just removing: %@", buf, 0xCu);
          }
        }

        uint64_t v23 = [(IDSRegistration *)self->_registrationInfo confirmedEmails];
        unsigned int v24 = [v23 containsObject:v17];

        uint64_t v25 = +[IMRGLog registration];
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (!v24) {
          break;
        }
        if (v26)
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing confirmed email: %@", buf, 0xCu);
        }

        if ([(IDSDAccount *)self isDeviceRegistered])
        {
          uint64_t v25 = [v17 _bestGuessURI];
          unsigned __int8 v27 = [(IDSRegistration *)self->_registrationInfo uris];
          id v28 = [v27 mutableCopy];

          unsigned int v29 = [v28 containsObject:v25];
          CFStringRef v30 = +[IMRGLog registration];
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          if (v29)
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v17;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Alias is registered, needs re-register for: %@", buf, 0xCu);
            }

            [v28 removeObject:v25];
            [(IDSRegistration *)self->_registrationInfo setUris:v28];
            char v34 = 1;
          }
          else
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v17;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Alias wasn't registered, moving along: %@", buf, 0xCu);
            }
          }
          id v9 = v33;
          uint64_t v15 = v35;

LABEL_37:
          uint64_t v4 = v36;
          goto LABEL_38;
        }
        uint64_t v4 = v36;
        uint64_t v15 = v35;
LABEL_38:

        if (v14 <= 0)
        {
          if (v12) {
            goto LABEL_40;
          }
          goto LABEL_41;
        }
      }
      if (v26)
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Email was unconfirmed, just removing: %@", buf, 0xCu);
      }
      uint64_t v15 = v35;
      goto LABEL_37;
    }
    char v34 = 0;
    if (v12)
    {
LABEL_40:
      uint64_t v32 = +[NSDictionary dictionaryWithObject:v12 forKey:kIDSServiceDefaultsAliasesKey];
      [(IDSDAccount *)self writeAccountDefaults:v32];
    }
LABEL_41:
    if (v34) {
      [(IDSDAccount *)self _reregister];
    }
  }
  else
  {
    uint64_t v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Empty aliases, ignoring", buf, 2u);
    }
  }
}

- (void)removeAliases:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client request to remove aliases: %@", (uint8_t *)&v6, 0xCu);
  }

  [(IDSDAccount *)self _removeAliases:v4 withReason:4];
}

- (void)_addAliases:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Add aliases: %@", buf, 0xCu);
  }

  if ([v4 count])
  {
    int v6 = +[IDSRegistrationController registeredPhoneNumbers];
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request to add aliases: %@", buf, 0xCu);
    }

    uint64_t v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " => Found my phone numbers: %@", buf, 0xCu);
    }

    id v9 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
    id v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = IMLoggingStringForArray();
      *(_DWORD *)buf = 138412290;
      id v38 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " => Current aliases: %@", buf, 0xCu);
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100212E54;
    v33[3] = &unk_100984458;
    id v28 = v6;
    char v34 = v28;
    id v27 = v9;
    id v35 = v27;
    uint64_t v12 = objc_msgSend(v4, "__imArrayByApplyingBlock:", v33);

    id v13 = [(IDSDAccount *)self _uriDictionariesFromAccountInfo];
    id v14 = [v13 mutableCopy];

    if (!v14) {
      id v14 = objc_alloc_init((Class)NSMutableArray);
    }
    BOOL v26 = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObject:v14 forKey:kIDSServiceDefaultsAliasesKey];
    [(IDSDAccount *)self writeAccountDefaults:v15];

    id v16 = [(IDSDAccount *)self vettedAliases];
    id v17 = +[IMRGLog registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, " => Vetted aliases: %@", buf, 0xCu);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = v12;
    id v18 = [v4 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v4);
          }
          id v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v23 = +[IMRGLog registration];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " => Adding alias: %@  (and as candidate)", buf, 0xCu);
          }

          [(IDSRegistration *)self->_registrationInfo addCandidateEmail:v22];
          if ([v16 containsObject:v22]) {
            uint64_t v24 = 3;
          }
          else {
            uint64_t v24 = 0;
          }
          [(IDSDAccount *)self _setValidationStatus:v24 error:0xFFFFFFFFLL forAlias:v22 info:0 addToCurrentHandlesIfNeeded:1 forceAdd:1];
        }
        id v19 = [v4 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v19);
    }

    if ([v4 count]) {
      [(IDSDAccount *)self _reregister];
    }

    uint64_t v25 = v28;
  }
  else
  {
    uint64_t v25 = +[IMRGLog registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Empty alias, ignoring", buf, 2u);
    }
  }
}

- (void)addAliases:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(IDSDAccount *)self uniqueID];
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client request to add aliases: %@  account: %@", (uint8_t *)&v7, 0x16u);
  }
  [(IDSDAccount *)self _addAliases:v4];
}

- (void)_validateAliases:(id)a3 validateAlreadyValid:(BOOL)a4
{
  id v5 = a3;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    int v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    int v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100719BFC(self);
    }
LABEL_7:
    int v7 = v5;
    goto LABEL_8;
  }
  if ([(IDSDAccount *)self accountType] == 2)
  {
    int v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100719C8C(self);
    }
    goto LABEL_7;
  }
  id v8 = [(IDSDAccount *)self _unprefixedURIStringsFromAccountInfo];
  __int16 v9 = [(IDSDAccount *)self unprefixedURIStringsFromRegistration];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1002136F4;
  v41[3] = &unk_100980858;
  int v6 = v8;
  id v42 = v6;
  int v7 = objc_msgSend(v5, "__imArrayByApplyingBlock:", v41);

  id v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = IMLoggingStringForArray();
    *(_DWORD *)buf = 138412290;
    id v44 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to validate aliases: %@", buf, 0xCu);
  }
  uint64_t v12 = +[IMRGLog registration];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = IMLoggingStringForArray();
    *(_DWORD *)buf = 138412290;
    id v44 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " => Current aliases: %@", buf, 0xCu);
  }
  if ([v7 count])
  {
    long long v32 = v9;
    uint64_t v33 = v6;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    long long v31 = v7;
    id v14 = v7;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          int64_t v20 = [(IDSDAccount *)self _validationStatusForAlias:v19];
          unsigned int v21 = +[IMRGLog registration];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v22 = @"NO";
            if (v20 == 3) {
              CFStringRef v22 = @"YES";
            }
            id v44 = v19;
            __int16 v45 = 2112;
            CFStringRef v46 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ is already validated %@", buf, 0x16u);
          }

          if (v20 != 3) {
            [(IDSDAccount *)self _setValidationStatus:1 error:0xFFFFFFFFLL forAlias:v19 info:0 addToCurrentHandlesIfNeeded:0 forceAdd:0];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v16);
    }

    if ([(IDSDAccount *)self isDeviceAuthenticated])
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10021379C;
      v36[3] = &unk_100986400;
      v36[4] = self;
      uint64_t v23 = objc_msgSend(v14, "__imArrayByFilteringWithBlock:", v36);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100213880;
      v34[3] = &unk_100986428;
      v34[4] = self;
      __int16 v9 = v32;
      id v35 = v32;
      uint64_t v24 = objc_msgSend(v14, "__imArrayByFilteringWithBlock:", v34);
      if ([v23 count] || objc_msgSend(v24, "count"))
      {
        uint64_t v25 = [(IDSDAccount *)self systemMonitor];
        unsigned __int8 v26 = [v25 isUnderFirstDataProtectionLock];

        int v6 = v33;
        if (v26)
        {
          id v27 = +[IMRGLog registration];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "We're under first lock, not registering aliases: %@", buf, 0xCu);
          }
        }
        else if ([v24 count])
        {
          [(IDSDAccount *)self _registerAccount];
        }
      }
      else
      {
        long long v30 = +[IMRGLog registration];
        int v6 = v33;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Alias all already validated, registered, returning", buf, 2u);
        }
      }
    }
    else
    {
      long long v29 = +[IMRGLog registration];
      __int16 v9 = v32;
      int v6 = v33;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v14;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Request to validate aliases: %@, but device is not authenticated", buf, 0xCu);
      }
    }
    int v7 = v31;
  }
  else
  {
    id v28 = +[IMRGLog registration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Empty aliases, ignoring", buf, 2u);
    }
  }
LABEL_8:
}

- (void)_validateAliases:(id)a3
{
  id v4 = a3;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if (![(IDSDAccount *)self isAdHocAccount])
  {
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100719DAC(self);
      }
      goto LABEL_7;
    }
    dateOfLastHandlesCheck = self->_dateOfLastHandlesCheck;
    if (dateOfLastHandlesCheck)
    {
      [(NSDate *)dateOfLastHandlesCheck timeIntervalSinceNow];
      if (fabs(v7) < 60.0)
      {
        id v8 = +[IMRGLog registration];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v9 = self->_dateOfLastHandlesCheck;
          int v12 = 138412290;
          id v13 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We've recently queried the vetted handles on the account, we'll use the local vetting status (%@)", (uint8_t *)&v12, 0xCu);
        }

        uint64_t v10 = 0;
        goto LABEL_20;
      }
      id v11 = self->_dateOfLastHandlesCheck;
    }
    else
    {
      id v11 = 0;
    }
    self->_dateOfLastHandlesCheck = 0;

    uint64_t v10 = 1;
LABEL_20:
    [(IDSDAccount *)self _validateAliases:v4 validateAlreadyValid:v10];
    goto LABEL_8;
  }
  id v5 = +[IMRGLog warning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100719D1C(self);
  }
LABEL_7:

LABEL_8:
}

- (void)validateAliases:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(IDSDAccount *)self uniqueID];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client request to validate: %@  account: %@", (uint8_t *)&v8, 0x16u);
  }
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      double v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100719E3C(self);
      }
    }
    else
    {
      if ([(IDSDAccount *)self accountType] != 2)
      {
        [(IDSDAccount *)self _validateAliases:v4];
        goto LABEL_10;
      }
      double v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100719ECC(self);
      }
    }
  }
  else
  {
    double v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
  }

LABEL_10:
}

- (void)_unvalidateAliases:(id)a3
{
  id v4 = a3;
  if (![(IDSDAccount *)self isRegistrationActive])
  {
    id v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
    goto LABEL_7;
  }
  if (![(IDSDAccount *)self isAdHocAccount])
  {
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100719FEC(self);
      }
      goto LABEL_7;
    }
    if ([(IDSDAccount *)self accountType] == 1)
    {
      double v7 = [(IDSDAccount *)self loginID];
      int v8 = [v7 lowercaseString];
    }
    else
    {
      int v8 = 0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002140F0;
    v17[3] = &unk_100980858;
    id v5 = v8;
    id v18 = v5;
    int v6 = objc_msgSend(v4, "__imArrayByApplyingBlock:", v17);

    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request to unlink aliases: %@", buf, 0xCu);
    }

    if ([v6 count])
    {
      if ([(IDSDAccount *)self isDeviceAuthenticated])
      {
        __int16 v10 = [(IDSDAccount *)self vettedAliases];
        [(IDSDAccount *)self _removeAliases:v6 withReason:2];
        if ([v6 count])
        {
          id v11 = +[IMRGLog registration];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating vetted handles to remove: %@", buf, 0xCu);
          }

          id v12 = [v10 mutableCopy];
          if (!v12) {
            id v12 = objc_alloc_init((Class)NSMutableArray);
          }
          [v12 removeObjectsInArray:v6];
          id v13 = +[IMRGLog registration];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, " => Final: %@", buf, 0xCu);
          }

          [(IDSDAccount *)self _updateVettedAliases:v12 emailInfo:0 addToCurrentHandlesIfNeeded:0];
        }
        goto LABEL_32;
      }
      __int16 v10 = +[IMRGLog registration];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        id v14 = "Request to unvalidate aliases: %@, but device is not authenticated";
        id v15 = v10;
        uint32_t v16 = 12;
        goto LABEL_31;
      }
    }
    else
    {
      __int16 v10 = +[IMRGLog registration];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v14 = "Empty aliases, ignoring";
        id v15 = v10;
        uint32_t v16 = 2;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
LABEL_32:

    goto LABEL_8;
  }
  id v5 = +[IMRGLog warning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100719F5C(self);
  }
LABEL_7:
  int v6 = v4;
LABEL_8:
}

- (void)unvalidateAliases:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(IDSDAccount *)self uniqueID];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client request to unvalidate: %@  account: %@", (uint8_t *)&v8, 0x16u);
  }
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      double v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10071A07C(self);
      }
    }
    else
    {
      if ([(IDSDAccount *)self accountType] != 2)
      {
        [(IDSDAccount *)self _unvalidateAliases:v4];
        goto LABEL_10;
      }
      double v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10071A10C(self);
      }
    }
  }
  else
  {
    double v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
  }

LABEL_10:
}

- (void)deactivateAndPurgeIdentify
{
  id v3 = +[IMRGLog warning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_10071A324();
  }

  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      id v4 = +[IMRGLog warning];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10071A19C(self);
      }
    }
    else
    {
      unsigned int v5 = [(IDSDAccount *)self accountType];
      int v6 = +[IMRGLog warning];
      id v4 = v6;
      if (v5 == 2)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10071A22C(self);
        }
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_10071A2F0();
        }

        [(IDSDAccount *)self _unregisterAccount];
        double v7 = +[IMRGLog warning];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          sub_10071A2BC();
        }

        id v4 = +[IDSRegistrationKeyManager sharedInstance];
        [v4 purgeMessageProtectionIdentity];
      }
    }
  }
  else
  {
    id v4 = +[IMRGLog warning];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
  }
}

- (void)validateCredentialsWithDeliveryCompletionBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(IDSDAccount *)self registrationCenter];
  unsigned int v5 = [(IDSDAccount *)self registration];
  [v6 sendValidateCredential:v5 withDeliveryCompletionBlock:v4];
}

- (void)refreshVettedAliases
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client request to refresh valid aliases", buf, 2u);
  }

  if ([(IDSDAccount *)self isDeviceAuthenticated])
  {
    id v4 = [(IDSDAccount *)self registrationCenter];
    [v4 queryValidatedEmailsForRegistration:self->_registrationInfo allowPasswordPrompt:1 completionBlock:0];
  }
  else
  {
    id v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request to refresh valid aliases, but device is not authenticated", v5, 2u);
    }
  }
}

- (void)resetErrorState
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client requested to reset error state.", v4, 2u);
  }

  [(IDSDAccount *)self setRegistrationStatus:[(IDSDAccount *)self registrationStatus] error:-1 alertInfo:0];
}

- (unint64_t)_handleAndConvertFeatureToggleError:(int64_t)a3
{
  if (a3 == 20000) {
    return 5;
  }
  if (a3 != 6005) {
    return 6;
  }
  if (![(IDSDAccount *)self accountType])
  {
    id v4 = +[IDSRegistrationReasonTracker sharedInstance];
    unsigned int v5 = [(IDSDAccount *)self userUniqueIdentifier];
    [v4 setPNRReason:11 forUserUniqueIdentifier:v5];
  }
  id v6 = [(IDSDAccount *)self primaryAccount];
  double v7 = v6;
  if (!v6) {
    id v6 = self;
  }
  [v6 reIdentify];

  return 6;
}

- (void)retrieveFeatureToggleStateForOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(IDSDAccount *)self registrationCenter];
  id v9 = [v7 featureID];

  __int16 v10 = [(IDSDAccount *)self primaryRegistration];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100214868;
  v12[3] = &unk_100986450;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v8 retrieveFeatureToggleStateForFeatureID:v9 registration:v10 completionBlock:v12];
}

- (void)updateFeatureToggleStateWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(IDSDAccount *)self registrationCenter];
  id v9 = [v7 state];
  __int16 v10 = [v7 featureID];

  id v11 = [(IDSDAccount *)self primaryRegistration];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100214ABC;
  v13[3] = &unk_100986450;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v8 updateFeatureToggleState:v9 forFeatureID:v10 registration:v11 completionBlock:v13];
}

- (void)_handlePseudonymProvisionError:(int64_t)a3
{
  if (a3 == 6005)
  {
    if (![(IDSDAccount *)self accountType])
    {
      unsigned int v5 = +[IDSRegistrationReasonTracker sharedInstance];
      id v6 = [(IDSDAccount *)self userUniqueIdentifier];
      [v5 setPNRReason:11 forUserUniqueIdentifier:v6];
    }
    id v7 = [(IDSDAccount *)self primaryAccount];
    id v8 = v7;
    if (!v7) {
      id v7 = self;
    }
    [v7 reIdentify];
  }
}

- (BOOL)provisionPseudonymForURI:(id)a3 properties:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v14 = [v11 allowedServices];
    id v15 = [(IDSDAccount *)self primaryAccount];
    uint32_t v16 = [v15 service];
    uint64_t v17 = [v16 identifier];
    unsigned __int8 v18 = [v14 containsObject:v17];

    if ((v18 & 1) == 0)
    {
      id v19 = [v11 allowedServices];
      id v20 = [(IDSDAccount *)self primaryAccount];
      unsigned int v21 = [v20 service];
      CFStringRef v22 = [v21 identifier];
      uint64_t v23 = [v19 arrayByAddingObject:v22];

      uint64_t v24 = [v11 withUpdatedAllowedServices:v23];

      id v11 = (id)v24;
    }
    uint64_t v25 = [(IDSDAccount *)self primaryAccount];
    unsigned __int8 v26 = [v25 provisionPseudonymForURI:v10 properties:v11 requestProperties:v13 completionBlock:v12];
  }
  else
  {
    id v27 = [(IDSDAccount *)self registrationCenter];
    id v28 = [(IDSDAccount *)self registration];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100214E68;
    v30[3] = &unk_100986478;
    v30[4] = self;
    id v33 = v12;
    id v31 = v10;
    id v11 = v11;
    id v32 = v11;
    unsigned __int8 v26 = [v27 provisionPseudonymFor:v28 withURI:v31 properties:v11 requestProperties:v13 completionBlock:v30];
  }
  return v26;
}

- (BOOL)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v13 = [(IDSDAccount *)self primaryAccount];
    unsigned __int8 v14 = [v13 renewPseudonym:v10 forUpdatedExpiryEpoch:v12 requestProperties:v11 completionBlock:a4];
  }
  else
  {
    id v15 = [(IDSDAccount *)self registrationCenter];
    uint32_t v16 = [(IDSDAccount *)self registration];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002151DC;
    v18[3] = &unk_1009864A0;
    v18[4] = self;
    id v20 = v11;
    id v19 = v10;
    unsigned __int8 v14 = [v15 renewPseudonym:v19 forRegistration:v16 forUpdatedExpiryEpoch:v12 requestProperties:v18 completionBlock:a4];
  }
  return v14;
}

- (BOOL)revokePseudonym:(id)a3 requestProperties:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([(IDSDAccount *)self isAdHocAccount])
  {
    id v11 = [(IDSDAccount *)self primaryAccount];
    unsigned __int8 v12 = [v11 revokePseudonym:v8 requestProperties:v10 completionBlock:v9];
  }
  else
  {
    id v13 = [(IDSDAccount *)self registrationCenter];
    unsigned __int8 v14 = [(IDSDAccount *)self registration];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002154F8;
    v16[3] = &unk_1009864A0;
    v16[4] = self;
    id v18 = v9;
    id v17 = v8;
    unsigned __int8 v12 = [v13 revokePseudonym:v17 forRegistration:v14 requestProperties:v10 completionBlock:v16];
  }
  return v12;
}

- (void)_removeAllPseudonyms
{
  uint64_t v5 = kIDSServiceDefaultsPseudonymsKey;
  uint64_t v3 = +[NSNull null];
  id v6 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [(IDSDAccount *)self _writeAccountDefaults:v4 force:1];
}

- (void)_addPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IDSDAccount *)self accountInfo];
  uint64_t v33 = kIDSServiceDefaultsPseudonymsKey;
  id v6 = objc_msgSend(v5, "objectForKey:");
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSMutableDictionary dictionary];
  }
  id v10 = v9;

  id v11 = [v4 maskedURI];
  unsigned __int8 v12 = [v11 prefixedURI];
  id v13 = [v10 objectForKey:v12];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100215B3C;
  v35[3] = &unk_1009864C8;
  id v14 = v4;
  id v36 = v14;
  id v15 = objc_msgSend(v13, "__imArrayByFilteringWithBlock:", v35);
  id v16 = [v15 mutableCopy];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = +[NSMutableArray array];
  }
  id v19 = v18;

  id v20 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v21 = [v14 URI];
  CFStringRef v22 = [v21 prefixedURI];

  if (v22)
  {
    CFDictionarySetValue(v20, kIDSServiceDefaultsURIKey, v22);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A3E4();
  }

  uint64_t v23 = [v14 properties];
  uint64_t v24 = [v23 dictionaryRepresentation];

  if (v24)
  {
    CFDictionarySetValue(v20, kIDSServiceDefaultsPropertiesKey, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071A358();
  }

  [v19 addObject:v20];
  uint64_t v25 = [v14 maskedURI];
  unsigned __int8 v26 = [v25 prefixedURI];
  [v10 setObject:v19 forKey:v26];

  id v27 = [v14 properties];
  id v28 = [v27 allowedServices];
  id v29 = [v28 mutableCopy];

  long long v30 = [(IDSDAccount *)self service];
  id v31 = [v30 identifier];
  [v29 removeObject:v31];

  uint64_t v37 = v33;
  long long v38 = v10;
  id v32 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  [(IDSDAccount *)self _writeAccountDefaults:v32 force:1 interestedSubservices:v29];
}

- (void)_removePseudonym:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  uint64_t v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[IDSDAccount _removePseudonyms:](self, "_removePseudonyms:", v5, v6);
}

- (void)_removePseudonyms:(id)a3
{
  id v4 = a3;
  id v6 = [(IDSDAccount *)self accountInfo];
  uint64_t v7 = kIDSServiceDefaultsPseudonymsKey;
  id v8 = [v6 objectForKey:kIDSServiceDefaultsPseudonymsKey];

  id v31 = v8;
  id v9 = [v8 mutableCopy];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSMutableDictionary dictionary];
  }
  id v32 = v11;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  id obj = v12;
  if (!v13) {
    goto LABEL_19;
  }
  id v14 = v13;
  uint64_t v27 = v7;
  id v28 = v5;
  LOBYTE(v15) = 0;
  uint64_t v30 = *(void *)v35;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v35 != v30) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      id v19 = [v17 maskedURI];
      id v20 = [v19 prefixedURI];
      unsigned int v21 = [v31 objectForKey:v20];

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100215FB0;
      v33[3] = &unk_1009864C8;
      void v33[4] = v17;
      CFStringRef v22 = objc_msgSend(v21, "__imArrayByFilteringWithBlock:", v33);
      id v23 = [v22 count];
      uint64_t v24 = [v17 maskedURI];
      uint64_t v25 = [v24 prefixedURI];
      if (v23) {
        [v32 setObject:v22 forKey:v25];
      }
      else {
        [v32 removeObjectForKey:v25];
      }

      if (v15)
      {
        BOOL v15 = 1;
      }
      else
      {
        id v26 = [v22 count];
        BOOL v15 = v26 != [v21 count];
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  }
  while (v14);

  uint64_t v5 = v28;
  if (v15)
  {
    uint64_t v38 = v27;
    long long v39 = v32;
    id v12 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [(IDSDAccount *)self _writeAccountDefaults:v12 force:1];
LABEL_19:
  }
}

- (id)pseudonymForPseudonymURIString:(id)a3
{
  id v4 = a3;
  if ([v4 _appearsToBePseudonymID])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(IDSDAccount *)self pseudonyms];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [v9 URI];
          id v11 = [v10 prefixedURI];
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)pseudonyms
{
  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v37 = self;
  uint64_t v3 = [(IDSDAccount *)self accountInfo];
  id v4 = [v3 objectForKey:kIDSServiceDefaultsPseudonymsKey];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  id v28 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v43;
    uint64_t v36 = kIDSServiceDefaultsPropertiesKey;
    uint64_t v34 = kIDSServiceDefaultsURIKey;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v5;
        uint64_t v6 = *(void *)(*((void *)&v42 + 1) + 8 * v5);
        uint64_t v7 = [obj objectForKeyedSubscript:v6];
        uint64_t v33 = +[IDSURI URIWithPrefixedURI:v6];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v35 = v7;
        id v8 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v39;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(v35);
              }
              unsigned __int8 v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              id v14 = objc_alloc((Class)IDSPseudonymProperties);
              long long v15 = [v12 objectForKeyedSubscript:v36];
              id v16 = [v14 initWithDictionaryRepresentation:v15];

              long long v17 = [v16 allowedServices];
              id v18 = [(IDSDAccount *)v37 service];
              id v19 = [v18 identifier];
              unsigned int v20 = [v17 containsObject:v19];

              if (v20)
              {
                unsigned int v21 = [v12 objectForKeyedSubscript:v34];
                CFStringRef v22 = +[IDSURI URIWithPrefixedURI:v21];

                if (v22 && v16)
                {
                  id v23 = [objc_alloc((Class)IDSPseudonym) initWithURI:v22 maskedURI:v33 properties:v16];
                  [v32 addObject:v23];
                }
              }
            }
            id v9 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v31 + 1;
      }
      while ((id)(v31 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v28);
  }

  id v24 = [v32 copy];

  return (NSArray *)v24;
}

- (NSDictionary)pseudonymURIMap
{
  id v29 = objc_alloc_init((Class)NSMutableDictionary);
  long long v39 = self;
  uint64_t v3 = [(IDSDAccount *)self accountInfo];
  id v4 = [v3 objectForKey:kIDSServiceDefaultsPseudonymsKey];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  id v30 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v45;
    uint64_t v38 = kIDSServiceDefaultsPropertiesKey;
    uint64_t v36 = kIDSServiceDefaultsURIKey;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v5;
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * v5);
        uint64_t v7 = [obj objectForKeyedSubscript:v6];
        id v35 = +[IDSURI URIWithPrefixedURI:v6];
        uint64_t v34 = +[NSMutableArray array];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v37 = v7;
        id v8 = [v37 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v41;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(v37);
              }
              unsigned __int8 v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              id v14 = objc_alloc((Class)IDSPseudonymProperties);
              long long v15 = [v12 objectForKeyedSubscript:v38];
              id v16 = [v14 initWithDictionaryRepresentation:v15];

              long long v17 = [v16 allowedServices];
              id v18 = [(IDSDAccount *)v39 service];
              id v19 = [v18 identifier];
              unsigned int v20 = [v17 containsObject:v19];

              if (v20)
              {
                unsigned int v21 = [v12 objectForKeyedSubscript:v36];
                CFStringRef v22 = +[IDSURI URIWithPrefixedURI:v21];

                if (v22 && v16)
                {
                  id v23 = [objc_alloc((Class)IDSPseudonym) initWithURI:v22 maskedURI:v35 properties:v16];
                  [v34 addObject:v23];
                }
              }
            }
            id v9 = [v37 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v9);
        }

        id v24 = [v34 copy];
        [v29 setObject:v24 forKeyedSubscript:v35];

        uint64_t v5 = v33 + 1;
      }
      while ((id)(v33 + 1) != v30);
      id v30 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v30);
  }

  id v25 = [v29 copy];

  return (NSDictionary *)v25;
}

- (BOOL)updateKTOptInStatus:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  if (+[IMUserDefaults keyTransparencyDropOptInMessageBeforeSending]&& CUTIsInternalInstall())
  {
    uint64_t v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dropping Opt In/Out Message before sending to server because user default is set.", buf, 2u);
    }

    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v10 = [(IDSServiceProperties *)self->_service identifier];
    unsigned int v11 = [v10 isEqualToString:@"com.apple.madrid"];

    if (v11)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      unsigned __int8 v12 = [(IDSDAccount *)self vettedAliases];
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            [v8 addObject:v17];
          }
          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v14);
      }
    }
    id v18 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-8004 userInfo:0];
    id v19 = [objc_alloc((Class)IDSKTOptInResult) initWithSuccess:0 optedInOutURIs:v8 serverSMTByURI:v9 error:v18];
    v6[2](v6, v19);

    unsigned __int8 v20 = 0;
  }
  else
  {
    unsigned int v21 = [(IDSDAccount *)self registrationCenter];
    CFStringRef v22 = [(IDSDAccount *)self registration];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100216C20;
    v24[3] = &unk_1009864F0;
    v24[4] = self;
    id v25 = v6;
    unsigned __int8 v20 = [v21 updateKTOptInStatusForRegistration:v22 withOptInStatus:v4 withCompletion:v24];
  }
  return v20;
}

- (BOOL)updateKTOptInStatusWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  if (+[IMUserDefaults keyTransparencyDropOptInMessageBeforeSending]&& CUTIsInternalInstall())
  {
    id v8 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dropping Opt In/Out Message before sending to server because user default is set.", buf, 2u);
    }

    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v11 = [(IDSServiceProperties *)self->_service identifier];
    unsigned int v12 = [v11 isEqualToString:@"com.apple.madrid"];

    if (v12)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = [(IDSDAccount *)self vettedAliases];
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:*(void *)(*((void *)&v27 + 1) + 8 * i)];
            [v9 addObject:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v15);
      }
    }
    id v19 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-8004 userInfo:0];
    id v20 = [objc_alloc((Class)IDSKTOptInResult) initWithSuccess:0 optedInOutURIs:v9 serverSMTByURI:v10 error:v19];
    v7[2](v7, v20);

    unsigned __int8 v21 = 0;
  }
  else
  {
    CFStringRef v22 = [(IDSDAccount *)self registrationCenter];
    id v23 = [(IDSDAccount *)self registration];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100217540;
    v25[3] = &unk_1009864F0;
    v25[4] = self;
    long long v26 = v7;
    unsigned __int8 v21 = [v22 updateKTOptInStatusForRegistration:v23 withOptInOutRequest:v6 withCompletion:v25];
  }
  return v21;
}

- (void)_handleKTOptInStatusUpdateError:(int64_t)a3
{
  if (a3 == 6005)
  {
    uint64_t v5 = [(IDSDAccount *)self primaryAccount];
    id v6 = v5;
    if (!v5) {
      uint64_t v5 = self;
    }
    [v5 reIdentify];
  }
}

- (void)askPeersToClearCacheWithURIs:(id)a3 fromURI:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending 132 to peers to clear their cache { fromURI: %@ service: %@ peerURIs: %@ }", buf, 0x20u);
  }

  if ([v8 count])
  {
    unsigned int v12 = +[NSDictionary dictionary];
    id v13 = [v9 prefixedURI];
    id v14 = [v13 _stripFZIDPrefix];
    id v15 = +[NSSet setWithArray:v8];
    uint64_t v16 = +[IDSDestination destinationWithDestinations:v15];
    LOWORD(v19) = 0;
    LOWORD(v18) = 0;
    LOWORD(v17) = 0;
    -[IDSDAccount sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:](self, "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:", v12, 0, 0, v14, v16, 1, 0, v17, 0, &off_1009D18F0, v18, 0, 0, 300, v19,
      0,
      &stru_100986530);
  }
  else
  {
    unsigned int v12 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No peers to send to { fromURI: %@ service: %@ }", buf, 0x16u);
    }
  }
}

- (void)validateProfile
{
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if ([(IDSDAccount *)self isAdHocAccount])
    {
      uint64_t v3 = +[IMRGLog warning];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10071A470(self);
      }
    }
    else if ([(IDSDAccount *)self accountType] == 2)
    {
      uint64_t v3 = +[IMRGLog warning];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10071A500(self);
      }
    }
    else
    {
      BOOL v4 = [(IDSDAccount *)self accountInfo];
      uint64_t v5 = kIDSServiceDefaultsProfileKey;
      uint64_t v3 = [v4 objectForKey:kIDSServiceDefaultsProfileKey];

      id v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(IDSDAccount *)self uniqueID];
        int v19 = 138412546;
        id v20 = v3;
        __int16 v21 = 2112;
        __int16 v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client request to validate profile info: %@   account: %@", (uint8_t *)&v19, 0x16u);
      }
      id v8 = (const void *)kIDSServiceDefaultsProfileRegionIDKey;
      id v9 = [v3 objectForKey:kIDSServiceDefaultsProfileRegionIDKey];
      id v10 = (const void *)kIDSServiceDefaultsProfileBaseNumberKey;
      unsigned int v11 = [v3 objectForKey:kIDSServiceDefaultsProfileBaseNumberKey];
      unsigned int v12 = +[IDSAppleIDRegistrationCenter sharedInstance];
      unsigned int v13 = [v12 validateRegion:v9 phoneNumber:v11 forRegistration:self->_registrationInfo];

      if (v13)
      {
        id v14 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v15 = v14;
        if (v9) {
          CFDictionarySetValue(v14, v8, v9);
        }
        if (v11) {
          CFDictionarySetValue(v15, v10, v11);
        }
        uint64_t v16 = +[NSNumber numberWithInt:2];
        if (v16) {
          CFDictionarySetValue(v15, kIDSServiceDefaultsProfileValdationStatusKey, v16);
        }

        uint64_t v17 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
        if (v17) {
          CFDictionarySetValue(v15, kIDSServiceDefaultsProfileValdationErrorCodeKey, v17);
        }

        uint64_t v18 = +[NSDictionary dictionaryWithObject:v15 forKey:v5];
        [(IDSDAccount *)self writeAccountDefaults:v18];
      }
    }
  }
  else
  {
    uint64_t v3 = +[IMRGLog warning];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100717B80(self);
    }
  }
}

- (void)_refreshRegistration
{
  id v3 = objc_alloc_init((Class)IMMessageContext);
  [v3 setShouldBoost:0];
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10021839C;
  id v10 = &unk_1009844C0;
  id v5 = v3;
  id v11 = v5;
  unsigned int v12 = self;
  [(IDSDAccount *)self _broadcastAccountMessageBlock:&v7];
  id v6 = +[IDSDaemon sharedInstance];
  [v6 updateTopics];
}

- (void)reregister
{
}

- (void)reIdentify
{
}

- (id)vettedAliases
{
  id v2 = [(IDSDAccount *)self accountInfo];
  id v3 = [v2 objectForKey:kIDSServiceDefaultsVettedAliasesKey];

  return v3;
}

- (id)invisibleAliases
{
  id v2 = [(IDSDAccount *)self accountInfo];
  id v3 = [v2 objectForKey:kIDSServiceDefaultsInvisibleAliasesKey];

  return v3;
}

- (void)markAsSelectedAlias:(id)a3
{
}

- (void)markAsUnselectedAlias:(id)a3 withReason:(unsigned __int8)a4
{
}

- (void)markAsUnvettedAlias:(id)a3
{
  id v4 = a3;
  if (-[IDSDAccount currentAliasState:](self, "currentAliasState:") == 3) {
    [(IDSDAccount *)self _setUserIntentState:4 forAlias:v4 withReason:1];
  }
  else {
    [(IDSDAccount *)self _stopTrackingUserIntentOfAlias:v4];
  }
}

- (void)markAsVettedAlias:(id)a3
{
  id v5 = a3;
  if ([(IDSDAccount *)self currentAliasState:v5] == 4) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [(IDSDAccount *)self _setUserIntentState:v4 forAlias:v5 withReason:1];
}

- (void)markAsWasSelectedAlias:(id)a3
{
}

- (BOOL)wasRecentlySelectedAlias:(id)a3
{
  return [(IDSDAccount *)self currentAliasState:a3] == 4;
}

- (unsigned)currentAliasState:(id)a3
{
  id v3 = [(IDSDAccount *)self _userIntentDictForAlias:a3];
  uint64_t v4 = [v3 objectForKey:kIDSServiceDefaultsAliasIntentStateKey];
  unsigned __int8 v5 = [v4 intValue];

  return v5;
}

- (void)loadAliasUserIntentMetadataIfNeeded
{
  id v2 = [(IDSDAccount *)self _allUserIntentWithDefaultReason:1];
}

- (unsigned)unselectReasonForAlias:(id)a3
{
  id v3 = [(IDSDAccount *)self _userIntentDictForAlias:a3];
  uint64_t v4 = [v3 objectForKey:kIDSServiceDefaultsAliasIntentStateKey];
  unsigned __int8 v5 = [v4 intValue];

  if (v5 == 2)
  {
    id v6 = [v3 objectForKey:kIDSServiceDefaultsAliasIntentInfoKey];
    unsigned __int8 v7 = [v6 intValue];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (id)_userIntentDictForAlias:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IDSDAccount *)self _allUserIntentWithDefaultReason:0];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v15 = 0;
    goto LABEL_16;
  }
  unsigned __int8 v7 = [v6 objectForKey:kIDSServiceDefaultsAliasIntentStateKey];
  unsigned int v8 = [v7 intValue];

  if (v8 != 4)
  {
    id v15 = v6;
    goto LABEL_16;
  }
  id v9 = [v6 objectForKey:kIDSServiceDefaultsAliasIntentTimestampKey];
  if (v9)
  {
    id v10 = +[NSDate date];
    [v10 timeIntervalSinceDate:v9];
    double v12 = v11;
    [(IDSDAccount *)self _maxSelectedButVettedGracePeriod];
    if (v12 >= 0.0 && v12 < v13)
    {
      uint64_t v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(IDSDAccount *)self service];
        uint64_t v18 = [v17 identifier];
        int v19 = [(IDSDAccount *)self loginID];
        int v21 = 138413314;
        __int16 v22 = v18;
        __int16 v23 = 2112;
        __int16 v24 = v19;
        __int16 v25 = 2112;
        id v26 = v4;
        __int16 v27 = 2112;
        long long v28 = v10;
        __int16 v29 = 2112;
        long long v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Grace period is still valid -- returing state {service: %@, loginID: %@, alias: %@, now: %@, then: %@}", (uint8_t *)&v21, 0x34u);
      }
      id v15 = v6;

      goto LABEL_15;
    }
  }
  [(IDSDAccount *)self _stopTrackingUserIntentOfAlias:v4];
  id v15 = 0;
LABEL_15:

LABEL_16:

  return v15;
}

- (void)_setUserIntentState:(unsigned __int8)a3 forAlias:(id)a4 withReason:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = [(IDSDAccount *)self service];
  unsigned __int8 v10 = [v9 shouldAutoRegisterAllHandles];

  if ((v10 & 1) != 0
    || ([v8 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias] & 1) != 0)
  {
    goto LABEL_12;
  }
  double v11 = [(IDSDAccount *)self _allUserIntentWithDefaultReason:0];
  id v12 = [v11 mutableCopy];

  if (v6 == 4)
  {
    v40[0] = kIDSServiceDefaultsAliasIntentStateKey;
    double v13 = +[NSNumber numberWithUnsignedChar:4];
    v41[0] = v13;
    v40[1] = kIDSServiceDefaultsAliasIntentTimestampKey;
    id v14 = +[NSDate date];
    v41[1] = v14;
    id v15 = v41;
    uint64_t v16 = v40;
LABEL_8:
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:2];

    goto LABEL_9;
  }
  if (v5 != 1)
  {
    v38[0] = kIDSServiceDefaultsAliasIntentStateKey;
    double v13 = +[NSNumber numberWithUnsignedChar:v6];
    v39[0] = v13;
    v38[1] = kIDSServiceDefaultsAliasIntentInfoKey;
    id v14 = +[NSNumber numberWithUnsignedChar:v5];
    v39[1] = v14;
    id v15 = v39;
    uint64_t v16 = v38;
    goto LABEL_8;
  }
  uint64_t v36 = kIDSServiceDefaultsAliasIntentStateKey;
  double v13 = +[NSNumber numberWithUnsignedChar:v6];
  id v37 = v13;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
LABEL_9:

  uint64_t v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [(IDSDAccount *)self service];
    id v20 = [v19 identifier];
    int v21 = [(IDSDAccount *)self loginID];
    __int16 v22 = [v12 objectForKey:v8];
    *(_DWORD *)buf = 138413314;
    __int16 v27 = v20;
    __int16 v28 = 2112;
    __int16 v29 = v21;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating user intent state {service: %@, loginID: %@, alias: %@, from: %@, to: %@}", buf, 0x34u);
  }
  [v12 setObject:v17 forKey:v8];
  uint64_t v24 = kIDSServiceDefaultsAliasIntentKey;
  id v25 = v12;
  __int16 v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [(IDSDAccount *)self writeAccountDefaults:v23];

LABEL_12:
}

- (void)_stopTrackingUserIntentOfAlias:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IDSDAccount *)self service];
  unsigned __int8 v6 = [v5 shouldAutoRegisterAllHandles];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = [(IDSDAccount *)self _allUserIntentWithDefaultReason:0];
    id v8 = [v7 mutableCopy];

    [v8 removeObjectForKey:v4];
    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v10 = [(IDSDAccount *)self service];
      double v11 = [v10 identifier];
      id v12 = [(IDSDAccount *)self loginID];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      int v19 = v12;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Stopping user intent tracking {service: %@, loginID: %@, alias: %@}", buf, 0x20u);
    }
    uint64_t v14 = kIDSServiceDefaultsAliasIntentKey;
    id v15 = v8;
    double v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [(IDSDAccount *)self writeAccountDefaults:v13];
  }
}

- (id)_allUserIntentWithDefaultReason:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  uint64_t v5 = [(IDSDAccount *)self service];
  unsigned __int8 v6 = [v5 shouldAutoRegisterAllHandles];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(IDSDAccount *)v4 accountInfo];
    uint64_t v9 = kIDSServiceDefaultsAliasIntentKey;
    id v7 = [v8 objectForKey:kIDSServiceDefaultsAliasIntentKey];

    if (!v7)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v11 = kIDSServiceDefaultsAliasIntentStateKey;
      id v12 = IMRGLog_ptr;
      uint64_t v36 = v9;
      if (v3)
      {
        v54[0] = kIDSServiceDefaultsAliasIntentStateKey;
        v54[1] = kIDSServiceDefaultsAliasIntentInfoKey;
        v55[0] = &off_1009D1908;
        v55[1] = &off_1009D1920;
        double v13 = (_UNKNOWN ***)v55;
        uint64_t v14 = v54;
        uint64_t v15 = 2;
      }
      else
      {
        uint64_t v52 = kIDSServiceDefaultsAliasIntentStateKey;
        uint64_t v53 = &off_1009D1908;
        double v13 = &v53;
        uint64_t v14 = &v52;
        uint64_t v15 = 1;
      }
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:v15];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v17 = [(IDSDAccount *)v4 vettedAliases];
      id v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v43;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v17);
            }
            [v10 setObject:v16 forKey:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          }
          id v19 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v19);
      }
      id v35 = (void *)v16;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v37 = v4;
      __int16 v22 = [(IDSDAccount *)v4 _unprefixedURIStringsFromAccountInfo];
      id v23 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v39;
        uint64_t v26 = kIDSServiceDefaultsSentinelAlias;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            __int16 v28 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
            if (([v28 isEqualToIgnoringCase:v26] & 1) == 0)
            {
              uint64_t v48 = v11;
              CFStringRef v49 = &off_1009D1938;
              [v12[40] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
              uint64_t v29 = v11;
              v31 = __int16 v30 = v12;
              [v10 setObject:v31 forKey:v28];

              id v12 = v30;
              uint64_t v11 = v29;
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v24);
      }

      id v7 = [v10 copy];
      uint64_t v46 = v36;
      id v47 = v7;
      __int16 v32 = [v12[40] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v4 = v37;
      [(IDSDAccount *)v37 writeAccountDefaults:v32];
    }
    uint64_t v33 = +[IMRGLog GDR];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_10071A590(v4, v33);
    }
  }

  return v7;
}

- (double)_maxSelectedButVettedGracePeriod
{
  id v2 = +[IDSServerBag sharedInstance];
  BOOL v3 = [v2 objectForKey:@"max-selected-tracking-grace-period"];

  double v4 = 86400.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v6 = v5;
      id v7 = +[IMRGLog registration];
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 < 0.0 || v6 > 604800.0)
      {
        double v4 = 86400.0;
        if (v8)
        {
          int v10 = 134217984;
          double v11 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server bag overrided grace period outside acceptable range -- ignoring {gracePeriod: %f}", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        if (v8)
        {
          int v10 = 134217984;
          double v11 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server bag overrided default max selected grace period {gracePeriod: %f}", (uint8_t *)&v10, 0xCu);
        }
        double v4 = v6;
      }
    }
  }

  return v4;
}

- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IDSRegistrationController sharedInstance];
  [v8 reportSpamWithMessages:v7 toURI:v6 registration:self->_registrationInfo];
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v18 = +[IDSRegistrationController sharedInstance];
  [v18 reportiMessageUnknownSender:v17 messageID:v16 isBlackholed:v10 isJunked:v9 messageServerTimestamp:v15 toURI:v14 registration:self->_registrationInfo];
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(IDSDAccount *)self registrationCenter];
  [v13 reportAction:a3 ofTempURI:v12 fromURI:v11 registration:self->_registrationInfo withCompletion:v10];
}

- (void)reportMessage:(id)a3 toURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[IDSRegistrationController sharedInstance];
  id v8 = [(IDSDAccount *)self primaryRegistration];
  [v9 reportMessage:v7 toURI:v6 registration:v8];
}

- (void)reportClientEvent:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[IDSRegistrationController sharedInstance];
  id v8 = [(IDSDAccount *)self primaryRegistration];
  [v9 reportClientEvent:v7 registration:v8 completion:v6];
}

- (id)serviceType
{
  id v2 = [(IDSDAccount *)self primaryServiceName];
  BOOL v3 = _IDSRegistrationServiceTypeForString();

  return v3;
}

- (id)pushHandler
{
  return self->_pushHandler;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System did leave first unlock, checking pending items", buf, 2u);
  }

  if ((*((unsigned char *)self + 80) & 0x40) != 0)
  {
    double v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "   We had a pending handle request, kicking off", v13, 2u);
    }

    *((unsigned char *)self + 80) &= ~0x40u;
    if ((*((unsigned char *)self + 80) & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ((*((unsigned char *)self + 80) & 0x20) != 0)
  {
LABEL_9:
    double v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "   We had a dependent reg request, kicking off", v12, 2u);
    }

    *((unsigned char *)self + 80) &= ~0x20u;
LABEL_12:
    [(IDSDAccount *)self _updateHandles:1];
    [(IDSDAccount *)self _issueDependentCheck];
  }
  unsigned int v6 = *((char *)self + 80);
  if ((v6 & 0x80000000) != 0)
  {
    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "   We had a pending re-identify request, kicking off", v11, 2u);
    }

    *((unsigned char *)self + 80) &= ~0x80u;
    id v7 = (char *)self + 81;
  }
  else
  {
    id v7 = (char *)self + 81;
    if ((*((unsigned char *)self + 81) & 1) == 0) {
      return;
    }
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "   We had a pending re-register request, kicking off", v10, 2u);
    }

    *((unsigned char *)self + 80) &= ~0x80u;
  }
  *v7 &= ~1u;
  [(IDSDAccount *)self _reregisterAndReidentify:(v6 >> 7) & 1];
}

- (void)addRegistrationListener:(id)a3
{
  id v4 = a3;
  registrationListeners = self->_registrationListeners;
  id v8 = v4;
  if (!registrationListeners)
  {
    unsigned int v6 = +[NSHashTable weakObjectsHashTable];
    id v7 = self->_registrationListeners;
    self->_registrationListeners = v6;

    id v4 = v8;
    registrationListeners = self->_registrationListeners;
  }
  [(NSHashTable *)registrationListeners addObject:v4];
}

- (void)removeRegistrationListener:(id)a3
{
  [(NSHashTable *)self->_registrationListeners removeObject:a3];
  if (![(NSHashTable *)self->_registrationListeners count])
  {
    registrationListeners = self->_registrationListeners;
    self->_registrationListeners = 0;
  }
}

- (void)_notifyRegistrationListenersAccountDidUpdateRegisteredDevices
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_registrationListeners;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = [(IDSDAccount *)self registeredDevices];
          [v8 account:self didUpdateRegisteredDevices:v9];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)sendSenderKeyMessageToDestinations:(id)a3 fromURI:(id)a4 guid:(id)a5 messageData:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2048;
    id v38 = [v14 length];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Asked to send 133 to destinations: %@ fromURI: %@ GUID: %@ messageData size: %ld", buf, 0x2Au);
  }

  id v17 = +[NSDictionary dictionary];
  id v18 = [v12 prefixedURI];
  id v19 = [v18 _stripFZIDPrefix];
  uint64_t v20 = +[IDSDestination destinationWithDestinations:v11];
  id v21 = IDSGetUUIDData();
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100219F08;
  v28[3] = &unk_1009801B0;
  id v29 = v13;
  id v30 = v15;
  id v22 = v15;
  id v23 = v13;
  LOWORD(v26) = 0;
  LOWORD(v25) = 256;
  LOWORD(v24) = 256;
  -[IDSDAccount sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:](self, "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:", v17, 0, 0, v19, v20, 1, v14, v24, 0, &off_1009D1950, v25, 0, v21, 300, v26,
    0,
    v28);
}

+ (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 threadContext:(id)a6 sendParameters:(id)a7
{
  *(void *)&long long v99 = a5;
  *((void *)&v99 + 1) = a4;
  id v100 = a3;
  id v9 = a6;
  id v113 = a7;
  __int16 v105 = v9;
  double v112 = [v9 dependentRegistrations];
  v120 = [v9 defaultPairedDependentRegistrations];
  __int16 v103 = [v9 appleIDPrimaryDependentRegistrations];
  unsigned int v116 = [v9 serviceIdentifier];
  id v102 = [v9 accountDescription];
  unsigned int v104 = [v9 serviceAllowLocalDelivery];
  unsigned int v101 = [v9 serviceAllowWiProxDelivery];
  if ([v9 serviceAllowLiveMessageDelivery])
  {
    long long v10 = [v9 serviceIdentifier];
    if (sub_1002F5FEC((uint64_t)v10)) {
      unsigned int v107 = 0;
    }
    else {
      unsigned int v107 = sub_1002F60A4() ^ 1;
    }
  }
  else
  {
    unsigned int v107 = 0;
  }
  if (v99 == 0)
  {
    long long v90 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v143 = (uint64_t)v100;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "No output arrays specified for _splitDestinations %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v143 = (uint64_t)a1;
      __int16 v144 = 2112;
      id v145 = v100;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ splitting destinations %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v91 = a1;
      long long v95 = v100;
      _IDSLogV();
    }
    id v109 = objc_alloc_init((Class)NSMutableDictionary);
    id v110 = objc_alloc_init((Class)NSMutableArray);
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id obj = v100;
    id v119 = [obj countByEnumeratingWithState:&v138 objects:v151 count:16];
    if (v119)
    {
      uint64_t v118 = *(void *)v139;
      uint64_t v121 = IDSDefaultPairedDevice;
      uint64_t v115 = IDSDevicePropertyPushToken;
      uint64_t v114 = IDSDevicePropertyIdentities;
      uint64_t v124 = IDSDevicePropertyPrivateDeviceData;
      uint64_t v125 = IDSDevicePropertyIdentifierOverride;
      uint64_t v123 = IDSPrivateDeviceDataUniqueID;
      unsigned int v111 = (void *)IDSDeviceDefaultPairedDeviceUniqueID;
      uint64_t v108 = IDSDevicePairedDeviceID;
      do
      {
        v122 = 0;
        do
        {
          if (*(void *)v139 != v118) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v138 + 1) + 8 * (void)v122);
          id v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v143 = (uint64_t)v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - looking up device for dest %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v91 = v12;
            _IDSLogV();
          }
          unsigned int v14 = objc_msgSend(v12, "isEqualToString:", v121, v91, v95, v97, v98);
          if (v14)
          {
            id v15 = v120;
            if (!v120)
            {
              long long v43 = +[NSDictionary dictionaryWithObjectsAndKeys:@"bt-id", v111, v108, 0];
              [v109 setObject:v43 forKey:v121];

              goto LABEL_188;
            }
            id v16 = v15;
            id v17 = [v15 objectForKey:v115];
            id v18 = [v16 objectForKey:v114];
            id v19 = objc_msgSend(v18, "__imArrayByApplyingBlock:", &stru_1009885D0);

            _IDSPrefersPhoneNumbersForServiceIdentifier();
            uint64_t v20 = (void *)_IDSCopyCallerID();
            id v21 = objc_msgSend(v20, "_URIFromFZIDType:", objc_msgSend(v20, "_FZBestGuessFZIDType"));
            id v22 = (void *)_IDSCopyIDForTokenWithURI();

            id v23 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v143 = (uint64_t)v22;
              __int16 v144 = 2112;
              id v145 = v120;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Resolved destination %@ from default paired device constant device %@.", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v92 = v22;
              long long v95 = v16;
              _IDSLogV();
            }
          }
          else
          {
            id v22 = v12;
          }
          if (objc_msgSend(v22, "hasPrefix:", @"device:", v92))
          {
            uint64_t v24 = [v22 _stripFZIDPrefix];
            uint64_t v25 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v143 = (uint64_t)v24;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "(Class) Destination device uniqueID: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v93 = v24;
              _IDSLogV();
            }
            id v26 = v120;
            if (v120)
            {
              id v27 = v26;
              id v28 = [v26 _stringForKey:v125];
              id v29 = [v27 objectForKey:v124];
              id v30 = [v29 _stringForKey:v123];

              id v31 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v143 = (uint64_t)v28;
                __int16 v144 = 2112;
                id v145 = v30;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "(Class) Default paired device uniqueID override %@   uniqueID %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v93 = v28;
                long long v95 = v30;
                _IDSLogV();
              }
              if ((objc_msgSend(v24, "isEqualToIgnoringCase:", v28, v93) & 1) == 0
                && ![v24 isEqualToIgnoringCase:v30]
                || [v113 sessionForceInternetInvitation])
              {

                goto LABEL_48;
              }

              LOBYTE(v14) = 1;
LABEL_78:

              long long v44 = [v27 objectForKey:v115];
              long long v45 = [v27 objectForKey:v114];
              uint64_t v46 = objc_msgSend(v45, "__imArrayByApplyingBlock:", &stru_1009885F0);

              _IDSPrefersPhoneNumbersForServiceIdentifier();
              id v47 = (void *)_IDSCopyCallerID();
              uint64_t v48 = objc_msgSend(v47, "_URIFromFZIDType:", objc_msgSend(v47, "_FZBestGuessFZIDType"));
              uint64_t v49 = _IDSCopyIDForTokenWithURI();

              id v50 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v143 = v49;
                __int16 v144 = 2112;
                id v145 = v27;
                _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "(Class) Resolved destination %@ from default paired device constant device %@.", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v93 = (id)v49;
                long long v95 = v27;
                _IDSLogV();
              }

              id v28 = v27;
              id v22 = (void *)v49;
            }
            else
            {
LABEL_48:
              id v32 = v112;
              long long v134 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              long long v137 = 0u;
              id v28 = v32;
              id v33 = [v28 countByEnumeratingWithState:&v134 objects:v150 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v135;
LABEL_50:
                uint64_t v35 = 0;
                while (1)
                {
                  if (*(void *)v135 != v34) {
                    objc_enumerationMutation(v28);
                  }
                  id v36 = *(void **)(*((void *)&v134 + 1) + 8 * v35);
                  __int16 v37 = objc_msgSend(v36, "_stringForKey:", v125, v93);
                  id v38 = [v36 objectForKey:v124];
                  long long v39 = [v38 _stringForKey:v123];

                  long long v40 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v143 = (uint64_t)v37;
                    __int16 v144 = 2112;
                    id v145 = v39;
                    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "(Class) Device uniqueID override %@   uniqueID %@", buf, 0x16u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    long long v94 = v37;
                    long long v95 = v39;
                    _IDSLogV();
                  }
                  if ((objc_msgSend(v37, "isEqualToIgnoringCase:", v24, v94) & 1) != 0
                    || [v39 isEqualToIgnoringCase:v24])
                  {
                    break;
                  }

                  if (v33 == (id)++v35)
                  {
                    id v33 = [v28 countByEnumeratingWithState:&v134 objects:v150 count:16];
                    if (v33) {
                      goto LABEL_50;
                    }
                    goto LABEL_62;
                  }
                }
                id v27 = v36;
                long long v41 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v143 = (uint64_t)v27;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "(Class) Found matching device %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  id v93 = v27;
                  _IDSLogV();
                }

                if (v27)
                {
                  LOBYTE(v14) = 0;
                  goto LABEL_78;
                }
              }
              else
              {
LABEL_62:
              }
              long long v42 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v143 = (uint64_t)v24;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "(Class) Didn't find matching device for uniqueID %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v93 = v24;
                _IDSLogV();
              }
              LOBYTE(v14) = 0;
            }
          }
          if (!objc_msgSend(v22, "hasPrefix:", @"token:", v93)) {
            goto LABEL_173;
          }
          id v133 = 0;
          id v51 = [v22 _stripPotentialTokenURIWithToken:&v133];
          id v52 = v133;
          uint64_t v53 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v143 = (uint64_t)v52;
            __int16 v144 = 2112;
            id v145 = v51;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - token %@ and uri %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v91 = v52;
            long long v95 = v51;
            _IDSLogV();
          }
          if (!v52 || !v51)
          {
            id v56 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v143 = (uint64_t)v22;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Malformed destination %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              id v91 = v22;
              _IDSLogTransport();
            }

            goto LABEL_187;
          }
          char v132 = 0;
          if ([v51 localizedCaseInsensitiveContainsString:@"__localURI__"])
          {
            id v54 = v111;
            LOBYTE(v14) = 1;
            id v55 = v54;
          }
          else
          {
            unsigned __int8 v57 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              long long v58 = [v105 serviceIdentifier];
              IDSLoggableDescriptionForHandleOnService();
              id v59 = (id)objc_claimAutoreleasedReturnValue();
              long long v60 = [v105 serviceIdentifier];
              IDSLoggableDescriptionForTokenOnService();
              id v61 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              uint64_t v143 = (uint64_t)v59;
              __int16 v144 = 2112;
              id v145 = v61;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Finding device matching URI %@ and token %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v62 = [v105 serviceIdentifier];
              long long v63 = IDSLoggableDescriptionForHandleOnService();
              long long v64 = [v105 serviceIdentifier];
              IDSLoggableDescriptionForTokenOnService();
              v95 = id v91 = v63;
              _IDSLogV();
            }
            id v130 = 0;
            id v131 = 0;
            objc_msgSend(a1, "dependentRegistration:findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:", v112, &v131, &v130, v51, v52, &v132, v91);
            id v54 = v131;
            id v55 = v130;
            long long v65 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v143 = (uint64_t)v54;
              __int16 v144 = 2112;
              id v145 = v55;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Found deviceID %@ and btID %@ after first try", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v91 = v54;
              long long v95 = v55;
              _IDSLogV();
            }
          }
          if (v54)
          {
            id v66 = v55;
          }
          else
          {
            long long v67 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v143 = (uint64_t)v102;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Did not find deviceID using account %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v91 = v102;
              _IDSLogV();
            }
            id v128 = v55;
            id v129 = 0;
            objc_msgSend(a1, "dependentRegistration:findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:", v103, &v129, &v128, v51, v52, &v132, v91);
            id v54 = v129;
            id v66 = v128;

            int64_t v68 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v143 = (uint64_t)v54;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Found deviceID %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v91 = v54;
              _IDSLogV();
            }
          }
          __int16 v69 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v143 = (uint64_t)v54;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - found device id %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v91 = v54;
            _IDSLogV();
          }
          int v70 = _os_feature_enabled_impl();
          if (v54) {
            int v71 = v70;
          }
          else {
            int v71 = 0;
          }
          if (v71 == 1 && ([v113 liveMessageDelivery] & v107) == 1 && v132)
          {
            long long v72 = +[IDSUTunDeliveryController sharedInstance];
            id v73 = [v72 copyPeerWithID:v54];

            if (([v73 isCloudConnected] & 1) == 0)
            {
              [v113 setLiveMessageDelivery:0];
              long long v74 = im_primary_queue();
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1002F61E0;
              block[3] = &unk_10097E4D0;
              id v127 = v73;
              dispatch_async(v74, block);

              long long v75 = +[IDSUTunController sharedInstance];
              [v75 startGlobalLinkForDevice:v54];

              long long v76 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v143 = (uint64_t)v54;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Using push instead of Live Delivery while GL warms for device id %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v91 = v54;
                _IDSLogV();
              }
            }
          }
          if (qword_100A4C710 != -1) {
            dispatch_once(&qword_100A4C710, &stru_100988610);
          }
          if (!objc_msgSend(v113, "liveMessageDelivery", v91)) {
            goto LABEL_154;
          }
          unsigned int v77 = v107;
          if (!v54) {
            unsigned int v77 = 0;
          }
          if (v77 == 1 && v66)
          {
            if (!v132)
            {
              id v78 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v143 = (uint64_t)v54;
                __int16 v144 = 2112;
                id v145 = v51;
                _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Device does not support live delivery, falling back to push {deviceID: %@, strippedURI: %@}", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v91 = v54;
                long long v95 = v51;
                _IDSLogV();
              }
LABEL_165:
              int v79 = byte_100A4C708;
LABEL_166:
              if (v79)
              {
                long long v82 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "  Local IDS is disabled... not sending locally", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
              }

LABEL_173:
              long long v83 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v143 = (uint64_t)v22;
                _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - no local device for URI %@, adding to remote", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v91 = v22;
                _IDSLogV();
              }
              if (v22) {
                char v84 = v14;
              }
              else {
                char v84 = 1;
              }
              if (v84)
              {
                long long v85 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "(Class) Dest became nil while trying to split destinations.", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  _IDSWarnV();
                  _IDSLogV();
                  _IDSLogTransport();
                }
              }
              else
              {
                [v110 addObject:v22];
              }
              goto LABEL_187;
            }
          }
          else
          {
LABEL_154:
            if (!v104) {
              goto LABEL_165;
            }
            int v79 = byte_100A4C708;
            if (byte_100A4C708 || !v54 || !v66) {
              goto LABEL_166;
            }
            if ((([v54 isEqualToString:v111] | v101) & 1) == 0)
            {
              long long v81 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                uint64_t v143 = (uint64_t)v22;
                __int16 v144 = 2112;
                id v145 = v54;
                __int16 v146 = 2112;
                id v147 = v66;
                __int16 v148 = 2112;
                CFStringRef v149 = @"NO";
                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Not considering %@ for local. DeviceID is %@  (btID: %@)  and we're not already scanning/advertising. Service allows wiprox? %@", buf, 0x2Au);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v97 = v66;
                CFStringRef v98 = @"NO";
                id v91 = v22;
                long long v95 = v54;
                _IDSLogV();
              }
              goto LABEL_165;
            }
          }
          id v80 = +[NSDictionary dictionaryWithObjectsAndKeys:v66, @"bt-id", v54, v108, 0];
          [v109 setObject:v80 forKey:v22];

LABEL_187:
          id v12 = v22;
LABEL_188:

          v122 = (char *)v122 + 1;
        }
        while (v122 != v119);
        id v119 = [obj countByEnumeratingWithState:&v138 objects:v151 count:16];
      }
      while (v119);
    }

    long long v86 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
    {
      long long v87 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v109 count]);
      long long v88 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v110 count]);
      *(_DWORD *)buf = 138412546;
      uint64_t v143 = (uint64_t)v87;
      __int16 v144 = 2112;
      id v145 = v88;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "(Class) Split out local destinations (%@) remote destinations (%@)", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      long long v89 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v109 count]);
      long long v96 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v110 count]);
      _IDSLogV();
    }
    if (*((void *)&v99 + 1)) {
      **((void **)&v99 + 1) = v109;
    }
    if ((void)v99) {
      *(void *)long long v99 = v110;
    }
  }
}

+ (void)_sendLocallyWithSendParameters:(id)a3 service:(id)a4 uriToLocalDestination:(id)a5 data:(id)a6 protobuf:(id)a7 threadContext:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  id v15 = a3;
  id v119 = a4;
  id v122 = a5;
  id v123 = a6;
  id v121 = a7;
  id v16 = a8;
  id v118 = a9;
  id v111 = a10;
  uint64_t v124 = v16;
  id v17 = [v16 subService];
  if ([v17 length]) {
    [v124 subService];
  }
  else {
  id v18 = [v124 servicePushTopic];
  }

  id v19 = [v15 resourcePath];

  uint64_t v20 = [v15 dataToEncrypt];
  id v21 = (char *)[v20 length];
  id v22 = [v123 length];
  id v23 = [v121 data];
  unint64_t v24 = (unint64_t)[v23 length];

  if (v19)
  {
    [v15 setCommand:&off_1009D1D10];
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = &v21[(void)v22 + v24];
  }
  id v26 = v18;
  id v27 = [v15 metricReportIdentifier];

  id v120 = v26;
  if (v27)
  {
    id v28 = objc_alloc((Class)NSString);
    id v29 = [v15 metricReportIdentifier];
    id v120 = [v28 initWithFormat:@"%@-%@", v26, v29];
  }
  id v30 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = [v15 messageUUID];
    id v32 = JWUUIDPushObjectToString();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v26;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "OUTGOING-LOCAL_SEND:%@ SERVICE:%@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v33 = [v15 messageUUID];
    long long v81 = JWUUIDPushObjectToString();
    char v84 = (char *)v26;
    _IDSLogV();
  }
  uint64_t v34 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = [v15 messageUUID];
    *(_WORD *)&unsigned char buf[12] = 2048;
    CFStringRef v36 = @"YES";
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v35;
    if (!v19) {
      CFStringRef v36 = @"NO";
    }
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2112;
    v155 = (uint64_t (*)(uint64_t, uint64_t))v36;
    *(_WORD *)uint64_t v156 = 2112;
    *(void *)&v156[2] = v26;
    *(_WORD *)&v156[10] = 2112;
    *(void *)&v156[12] = v122;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Sending message ID (%@) with data length %lu (resource: %@)  [Topic: %@  Local Device IDs: %@]", buf, 0x34u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    BOOL v37 = v19 == 0;
    uint64_t v38 = objc_msgSend(v15, "messageUUID", v81, v84);
    long long v39 = (void *)v38;
    CFStringRef v40 = @"YES";
    if (v37) {
      CFStringRef v40 = @"NO";
    }
    id v88 = v26;
    id v91 = v122;
    char v84 = v25;
    CFStringRef v86 = v40;
    long long v81 = (void *)v38;
    _IDSLogV();
  }
  if (!objc_msgSend(v124, "accountType", v81, v84, v86, v88, v91)) {
    goto LABEL_25;
  }
  long long v41 = _IDSCopyMyPhoneNumbers();
  long long v42 = [v15 fromID];
  long long v43 = [v42 _stripFZIDPrefix];
  unsigned int v44 = [v41 containsObject:v43];

  if (v44)
  {
LABEL_25:
    ct_green_tea_logger_create_static();
    long long v45 = getCTGreenTeaOsLogHandle();
    uint64_t v46 = v45;
    if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Transmitting phone number", buf, 2u);
    }
  }
  id v47 = [v122 allValues];
  uint64_t v48 = objc_msgSend(v47, "__imArrayByApplyingBlock:", &stru_100988630);
  id v109 = +[NSMutableSet setWithArray:v48];

  uint64_t v108 = +[NSMutableSet set];
  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x2020000000;
  v145[3] = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v155 = sub_1002F710C;
  *(void *)uint64_t v156 = sub_1002F711C;
  *(void *)&v156[8] = 0;
  unsigned int v49 = [v124 serviceAdHocType];
  BOOL v50 = v49 == 5 || v49 == 2;
  if (v49 == 2
    || v49 == 5
    || ([v15 localDelivery] & 1) != 0
    || [v15 requireLocalWiFi])
  {
    id v51 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if ([v15 localDelivery]) {
        CFStringRef v52 = @"YES";
      }
      else {
        CFStringRef v52 = @"NO";
      }
      if (v50) {
        CFStringRef v53 = @"YES";
      }
      else {
        CFStringRef v53 = @"NO";
      }
      unsigned int v54 = [v15 requireLocalWiFi];
      uint64_t v55 = [v15 messageUUID];
      id v56 = (void *)v55;
      if (v54) {
        CFStringRef v57 = @"YES";
      }
      else {
        CFStringRef v57 = @"NO";
      }
      *(_DWORD *)__int16 v146 = 138413058;
      CFStringRef v147 = v52;
      __int16 v148 = 2112;
      CFStringRef v149 = v53;
      __int16 v150 = 2112;
      CFStringRef v151 = v57;
      __int16 v152 = 2112;
      uint64_t v153 = v55;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Ignoring request to fallback forcedLocal %@  localType %@ requireLocalWiFi %@ message %@", v146, 0x2Au);
    }
    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLogTransport()) {
      goto LABEL_66;
    }
    long long v58 = [v15 localDelivery] ? @"YES" : @"NO";
    id v59 = v50 ? @"YES" : @"NO";
    unsigned int v60 = [v15 requireLocalWiFi];
    uint64_t v61 = [v15 messageUUID];
    long long v62 = (void *)v61;
    long long v63 = v60 ? @"YES" : @"NO";
    long long v87 = v63;
    uint64_t v89 = v61;
    long long v82 = v58;
    long long v85 = v59;
    _IDSLogTransport();

    if (!_IDSShouldLog())
    {
LABEL_66:
      __int16 v69 = 0;
      goto LABEL_67;
    }
    if (objc_msgSend(v15, "localDelivery", v58, v59, v87, v89)) {
      CFStringRef v64 = @"YES";
    }
    else {
      CFStringRef v64 = @"NO";
    }
    unsigned int v65 = [v15 requireLocalWiFi];
    uint64_t v66 = [v15 messageUUID];
    long long v67 = (void *)v66;
    if (v65) {
      CFStringRef v68 = @"YES";
    }
    else {
      CFStringRef v68 = @"NO";
    }
    long long v87 = (__CFString *)v68;
    uint64_t v89 = v66;
    long long v82 = (__CFString *)v64;
    long long v85 = v59;
    _IDSLogV();
    __int16 v69 = 0;
  }
  else
  {
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472;
    v133[2] = sub_1002F7124;
    v133[3] = &unk_100988680;
    id v134 = v15;
    id v141 = v111;
    uint64_t v142 = buf;
    id v135 = v108;
    id v136 = v109;
    uint64_t v143 = v145;
    id v137 = v120;
    __int16 v144 = v25;
    id v138 = v119;
    id v139 = v123;
    id v140 = v121;
    __int16 v69 = objc_retainBlock(v133);

    long long v67 = v134;
  }

LABEL_67:
  int v70 = objc_msgSend(v15, "dataToEncrypt", v82, v85, v87, v89);

  if (v70)
  {
    if (v123)
    {
      int v71 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v146 = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Attempt to send both DataToEncrypt and Data, dropping data", v146, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    uint64_t v72 = [v15 dataToEncrypt];

    id v123 = (id)v72;
  }
  id v73 = +[IDSUTunDeliveryController sharedInstance];
  long long v74 = [v15 resourcePath];
  long long v75 = [v15 resourceMetadata];
  id v107 = [v15 priority];
  unsigned int v106 = [v124 dataProtectionClass];
  unsigned __int8 v105 = [v15 nonWaking];
  unsigned __int8 v104 = [v15 nonCloudWaking];
  unsigned __int8 v103 = [v15 requireBluetooth];
  unsigned __int8 v102 = [v15 requireLocalWiFi];
  long long v76 = [v15 queueOneIdentifier];
  unsigned int v77 = [v15 expirationDate];
  unsigned __int8 v101 = [v15 enforceRemoteTimeouts];
  unsigned __int8 v100 = [v15 expectsPeerResponse];
  unsigned __int8 v99 = [v15 wantsAppAck];
  unsigned __int8 v98 = [v15 compressPayload];
  unsigned __int8 v97 = [v15 compressed];
  id v78 = [v15 peerResponseIdentifier];
  unsigned int v116 = [v15 identifier];
  uint64_t v115 = [v15 command];
  __int16 v117 = [v15 fromID];
  uint64_t v114 = [v15 localDestinationDeviceUUID];
  unsigned __int8 v96 = [v15 bypassDuet];
  id v113 = [v15 duetIdentifiersOverride];
  int v79 = [v15 messageType];
  id v95 = [v79 longLongValue];
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_1002F8154;
  v125[3] = &unk_1009886A8;
  id v93 = v15;
  id v126 = v93;
  id v80 = v26;
  id v127 = v80;
  id v94 = v109;
  id v128 = v94;
  id v110 = v108;
  id v129 = v110;
  id v131 = buf;
  char v132 = v145;
  id v112 = v111;
  id v130 = v112;
  LOBYTE(v92) = v96;
  BYTE4(v90) = v97;
  BYTE3(v90) = v98;
  BYTE2(v90) = v99;
  BYTE1(v90) = v100;
  LOBYTE(v90) = v101;
  HIBYTE(v83) = v102;
  BYTE6(v83) = v103;
  BYTE5(v83) = v104;
  BYTE4(v83) = v105;
  LODWORD(v83) = v106;
  objc_msgSend(v73, "sendData:service:protobuf:resourcePath:resourceMetadata:priority:dataProtectionClass:nonWaking:nonCloudWaking:requireBluetooth:requireLocalWiFi:queueOneIdentifier:expirationDate:enforceRemoteTimeouts:expectsPeerResponse:wantsAppAck:compressPayload:compressed:peerResponseIdentifier:messageID:topic:awdTopic:command:fromID:uriToDeviceID:localDeviceDestinationDeviceUUID:bypassDuet:duetIdentifiersOverride:messageType:fallbackBlock:progressBlock:completionBlock:", v123, v119, v121, v74, v75, v107, v83, v76, v77, v90, v78, v116, v80, v120,
    v115,
    v117,
    v122,
    v114,
    v92,
    v113,
    v95,
    v69,
    v118,
    v125);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v145, 8);
}

+ (void)sendMessageWithSendParameters:(id)a3 service:(id)a4 threadContext:(id)a5 willSendBlock:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v204 = a4;
  id v14 = a5;
  id v205 = a6;
  id v202 = a7;
  id v215 = a8;
  unsigned int v200 = [v14 accountType];
  v217 = v14;
  v216 = [v14 serviceIdentifier];
  v203 = [v14 accountDisplayName];
  id v15 = [v14 dependentRegistrations];
  id v16 = [v14 appleIDPrimaryDependentRegistrations];
  id v17 = [v14 primaryRegistrationDSHandle];
  id v18 = [v14 primaryRegistrationURIs];
  [v14 serviceIsDSBased];
  uint64_t v207 = [v14 aliasStrings];
  v210 = [v14 servicePushTopic];
  unsigned int v19 = [v14 shouldIncludeDefaultDevice];
  unsigned int v20 = [v14 serviceWantsReflectedSend];
  unsigned __int8 v195 = [v14 serviceAllowProxyDelivery];
  unsigned int v21 = [v14 serviceUseiMessageCallerID];
  id v22 = [v13 command];
  if ([v22 integerValue] == (id)130) {
    unsigned int v23 = 0;
  }
  else {
    unsigned int v23 = v20;
  }
  if (v23 != 1 || ([v13 isProxiedOutgoingMessage] & 1) != 0)
  {

LABEL_7:
    int v196 = 0;
    goto LABEL_8;
  }

  if (!v19) {
    goto LABEL_7;
  }
  id v31 = [v13 destinations];
  id v32 = [v31 destinationURIs];
  id v33 = [v32 mutableCopy];

  id v34 = IDSDefaultPairedDevice;
  [v33 addObject:v34];
  uint64_t v35 = +[IDSDestination destinationWithStrings:v33];
  [v13 setDestinations:v35];

  CFStringRef v36 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = [v13 destinations];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Adding local device as a destination for this message, Destinations For This Message Are Now %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v156 = [v13 destinations];
    _IDSLogV();
  }
  int v196 = 1;
LABEL_8:
  if (v200 == 2)
  {
    unint64_t v24 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending via account that's type Local -- forcing local delivery.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    objc_msgSend(v13, "setLocalDelivery:", 1, v156);
  }
  uint64_t v25 = objc_msgSend(v13, "destinations", v156);
  id v26 = [v25 destinationURIs];
  id v27 = [v26 allObjects];
  v259[0] = _NSConcreteStackBlock;
  v259[1] = 3221225472;
  v259[2] = sub_1002FA9AC;
  v259[3] = &unk_1009886D0;
  id v264 = a1;
  id v197 = v15;
  id v260 = v197;
  id v198 = v16;
  id v261 = v198;
  id v206 = v17;
  id v262 = v206;
  id v199 = v18;
  id v263 = v199;
  int64_t v212 = objc_msgSend(v27, "__imArrayByApplyingBlock:", v259);

  if (v21)
  {
    id v28 = [v13 originalfromID];
    BOOL v29 = [v28 length] == 0;

    if (v29)
    {
      uint64_t v38 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v203;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Service would like to use iMessage callerID for messages, Attempting to use %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v157 = v203;
        _IDSLogV();
      }
      long long v39 = objc_msgSend(v203, "_stripFZIDPrefix", v157);
      CFStringRef v40 = [v206 _stripFZIDPrefix];
      long long v41 = [v217 pseudonyms];
      long long v42 = (void *)_IDSCopyCallerIDWithPseudonyms();
      [v13 setFromID:v42];
    }
    else
    {
      id v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Service would like to use iMessage callerID for messages however they specified their own FromID, so we will attempt to use that", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  long long v43 = [v13 fromID];
  BOOL v44 = v43 == 0;

  if (v44)
  {
    long long v45 = [v206 _stripFZIDPrefix];
    _IDSPrefersPhoneNumbersForServiceIdentifier();
    uint64_t v46 = (void *)_IDSCopyCallerID();
    [v13 setFromID:v46];
  }
  id v47 = +[IDSPeerIDManager sharedInstance];
  uint64_t v48 = [v212 firstObject];
  unsigned int v49 = +[IDSURI URIWithPrefixedURI:v48 withServiceLoggingHint:v216];
  BOOL v50 = [v13 fromID];
  id v51 = [v50 _bestGuessURI];
  CFStringRef v52 = +[IDSURI URIWithPrefixedURI:v51 withServiceLoggingHint:v216];
  v211 = [v47 senderCorrelationIdentifierForURI:v49 fromURI:v52 service:v216];

  if (v211) {
    [v13 setDestinationCorrelationIdentifier:v211];
  }
  CFStringRef v53 = [v13 data];
  unsigned int v54 = [v13 protobuf];

  if (v54)
  {
    id v55 = objc_alloc((Class)IDSProtobuf);
    id v56 = [v13 protobuf];
    id v214 = [v55 initWithDictionary:v56];
  }
  else
  {
    id v214 = 0;
  }
  CFStringRef v57 = [v13 message];

  if (v57)
  {
    long long v58 = [v13 message];
    id v59 = [v58 objectForKey:IDSMessageResourceTransferURLKey];
    if (v59)
    {

      unsigned int v60 = [v58 objectForKeyedSubscript:IDSMessageResourceTransferMetadataKey];
      uint64_t v61 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v60;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Sending Resource at path %@ with metadata %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v157 = v59;
        long long v159 = v60;
        _IDSLogV();
      }
      objc_msgSend(v13, "setResourcePath:", v59, v157, v159);
      [v13 setResourceMetadata:v60];
      CFStringRef v53 = 0;
    }
    else
    {
      JWEncodeDictionary();
      unsigned int v60 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

      CFStringRef v53 = v60;
    }
  }
  if (!v53)
  {
    uint64_t v66 = v214;
    if (!v214)
    {
      id v209 = 0;
      goto LABEL_87;
    }
    long long v67 = [v214 data];
    id v68 = [v67 length];

    if ([v13 compressPayload])
    {
      __int16 v69 = [v214 data];
      id v209 = [v69 _FTCopyOptionallyGzippedData];

      int v70 = (__CFString *)[v209 length];
      if (v68 > v70)
      {
        int v71 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v68;
          *(_WORD *)&uint8_t buf[8] = 1024;
          *(_DWORD *)&buf[10] = v70;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Compressed protobuf data from: %u  to: %u", buf, 0xEu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v157 = v68;
          long long v159 = v70;
          _IDSLogV();
        }
        uint64_t v72 = objc_msgSend(v214, "data", v157, v159);
        [v214 setUncompressedData:v72];

        [v214 setData:v209];
        CFStringRef v53 = 0;
        uint64_t v65 = 1;
        goto LABEL_86;
      }
    }
    else
    {
      id v209 = 0;
      int v70 = 0;
    }
    long long v74 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v68;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v70;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "Use uncompressed protobuf data (original: %u compressed: %u)", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v157 = v68;
      long long v159 = v70;
      _IDSLogV();
    }
    uint64_t v65 = 0;
    CFStringRef v53 = 0;
    goto LABEL_86;
  }
  id v62 = [v53 length];
  if (![v13 compressPayload])
  {
    id v209 = 0;
    long long v63 = 0;
    goto LABEL_72;
  }
  id v209 = [v53 _FTCopyOptionallyGzippedData];
  long long v63 = (__CFString *)[v209 length];
  if (v62 <= v63)
  {
LABEL_72:
    id v73 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v62;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v63;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "Use uncompressed message data (original: %u compressed: %u)", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v157 = v62;
      long long v159 = v63;
      _IDSLogV();
    }
    uint64_t v65 = 0;
    goto LABEL_86;
  }
  CFStringRef v64 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v62;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = v63;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Compressed message data from: %u  to: %u", buf, 0xEu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v157 = v62;
    long long v159 = v63;
    _IDSLogV();
  }
  id v209 = v209;

  uint64_t v65 = 1;
  CFStringRef v53 = v209;
LABEL_86:
  objc_msgSend(v13, "setCompressed:", v65, v157, v159);
  uint64_t v66 = v53;
LABEL_87:
  v201 = v66;
  id v75 = [v66 length];
  long long v76 = [v214 data];
  id v77 = [v76 length];

  id v78 = [v13 message];

  unint64_t v213 = (unint64_t)v75 + (void)v77;
  if (v78)
  {
    int v79 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      id v186 = [v13 bulkedPayload];
      id v189 = [v13 fromID];
      v192 = [v13 destinations];
      CFStringRef v80 = @"YES";
      if ([v13 useDictAsTopLevel]) {
        CFStringRef v81 = @"YES";
      }
      else {
        CFStringRef v81 = @"NO";
      }
      CFStringRef v182 = v81;
      if ([v13 encryptPayload]) {
        CFStringRef v82 = @"YES";
      }
      else {
        CFStringRef v82 = @"NO";
      }
      CFStringRef v178 = v82;
      if ([v13 wantsResponse]) {
        CFStringRef v83 = @"YES";
      }
      else {
        CFStringRef v83 = @"NO";
      }
      CFStringRef v176 = v83;
      [v13 timeout];
      CFStringRef v85 = v84;
      id v86 = [v13 command];
      if ([v13 wantsDeliveryStatus]) {
        CFStringRef v87 = @"YES";
      }
      else {
        CFStringRef v87 = @"NO";
      }
      if ([v13 wantsCertifiedDelivery]) {
        CFStringRef v88 = @"YES";
      }
      else {
        CFStringRef v88 = @"NO";
      }
      uint64_t v89 = [v13 deliveryStatusContext];
      id v90 = [v13 messageUUID];
      if ([v13 priority] == (id)300)
      {
        CFStringRef v91 = @"URGENT";
      }
      else if ([v13 priority] == (id)200)
      {
        CFStringRef v91 = @"Default";
      }
      else
      {
        CFStringRef v91 = @"Sync";
      }
      if (![v13 localDelivery]) {
        CFStringRef v80 = @"NO";
      }
      unsigned __int8 v105 = (__CFString *)objc_retainBlock(v215);
      *(_DWORD *)buf = 138415874;
      *(void *)&uint8_t buf[4] = v186;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v189;
      *(_WORD *)&buf[22] = 2112;
      v266 = v192;
      *(_WORD *)v267 = 2112;
      *(void *)&v267[2] = v182;
      *(_WORD *)&v267[10] = 2112;
      *(void *)&v267[12] = v178;
      __int16 v268 = 2112;
      CFStringRef v269 = v176;
      __int16 v270 = 2048;
      CFStringRef v271 = v85;
      __int16 v272 = 2112;
      id v273 = v86;
      __int16 v274 = 2112;
      CFStringRef v275 = v87;
      __int16 v276 = 2112;
      CFStringRef v277 = v88;
      __int16 v278 = 2112;
      CFStringRef v279 = v89;
      __int16 v280 = 2112;
      id v281 = v90;
      __int16 v282 = 2112;
      CFStringRef v283 = v91;
      __int16 v284 = 2112;
      CFStringRef v285 = v80;
      __int16 v286 = 2048;
      CFStringRef v287 = v105;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "sendMessage <<Redacted>>  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p", buf, 0x98u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v194 = [v13 bulkedPayload];
      BOOL v191 = [v13 fromID];
      id v188 = [v13 destinations];
      CFStringRef v106 = @"YES";
      if ([v13 useDictAsTopLevel]) {
        CFStringRef v107 = @"YES";
      }
      else {
        CFStringRef v107 = @"NO";
      }
      CFStringRef v184 = v107;
      if ([v13 encryptPayload]) {
        CFStringRef v108 = @"YES";
      }
      else {
        CFStringRef v108 = @"NO";
      }
      CFStringRef v180 = v108;
      if ([v13 wantsResponse]) {
        CFStringRef v109 = @"YES";
      }
      else {
        CFStringRef v109 = @"NO";
      }
      [v13 timeout];
      CFStringRef v111 = v110;
      id v112 = [v13 command];
      if ([v13 wantsDeliveryStatus]) {
        CFStringRef v113 = @"YES";
      }
      else {
        CFStringRef v113 = @"NO";
      }
      if ([v13 wantsCertifiedDelivery]) {
        CFStringRef v114 = @"YES";
      }
      else {
        CFStringRef v114 = @"NO";
      }
      uint64_t v115 = [v13 deliveryStatusContext];
      unsigned int v116 = [v13 messageUUID];
      if ([v13 priority] == (id)300)
      {
        CFStringRef v117 = @"URGENT";
      }
      else if ([v13 priority] == (id)200)
      {
        CFStringRef v117 = @"Default";
      }
      else
      {
        CFStringRef v117 = @"Sync";
      }
      if (![v13 localDelivery]) {
        CFStringRef v106 = @"NO";
      }
      id v128 = (__CFString *)objc_retainBlock(v215);
      CFStringRef v173 = v106;
      CFStringRef v174 = v128;
      __int16 v171 = v116;
      CFStringRef v172 = v117;
      CFStringRef v169 = v114;
      CFStringRef v170 = v115;
      long long v167 = v112;
      CFStringRef v168 = v113;
      CFStringRef v166 = v111;
      CFStringRef v164 = v180;
      CFStringRef v165 = v109;
      long long v161 = v188;
      CFStringRef v163 = v184;
      id v157 = v194;
      long long v159 = v191;
      _IDSLogV();
LABEL_186:
    }
  }
  else
  {
    uint64_t v92 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      id v187 = [v13 bulkedPayload];
      v190 = [v13 fromID];
      id v193 = [v13 destinations];
      CFStringRef v93 = @"YES";
      if ([v13 useDictAsTopLevel]) {
        CFStringRef v94 = @"YES";
      }
      else {
        CFStringRef v94 = @"NO";
      }
      CFStringRef v183 = v94;
      if ([v13 encryptPayload]) {
        CFStringRef v95 = @"YES";
      }
      else {
        CFStringRef v95 = @"NO";
      }
      CFStringRef v179 = v95;
      if ([v13 wantsResponse]) {
        CFStringRef v96 = @"YES";
      }
      else {
        CFStringRef v96 = @"NO";
      }
      CFStringRef v177 = v96;
      [v13 timeout];
      unsigned __int8 v98 = v97;
      unsigned __int8 v99 = [v13 command];
      if ([v13 wantsDeliveryStatus]) {
        CFStringRef v100 = @"YES";
      }
      else {
        CFStringRef v100 = @"NO";
      }
      if ([v13 wantsCertifiedDelivery]) {
        CFStringRef v101 = @"YES";
      }
      else {
        CFStringRef v101 = @"NO";
      }
      id v102 = [v13 deliveryStatusContext];
      unsigned __int8 v103 = [v13 messageUUID];
      if ([v13 priority] == (id)300)
      {
        CFStringRef v104 = @"URGENT";
      }
      else if ([v13 priority] == (id)200)
      {
        CFStringRef v104 = @"Default";
      }
      else
      {
        CFStringRef v104 = @"Sync";
      }
      if (![v13 localDelivery]) {
        CFStringRef v93 = @"NO";
      }
      id v118 = objc_retainBlock(v215);
      *(_DWORD *)buf = 134221826;
      *(void *)&uint8_t buf[4] = v213;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v187;
      *(_WORD *)&buf[22] = 2112;
      v266 = v190;
      *(_WORD *)v267 = 2112;
      *(void *)&v267[2] = v193;
      *(_WORD *)&v267[10] = 2112;
      *(void *)&v267[12] = v183;
      __int16 v268 = 2112;
      CFStringRef v269 = v179;
      __int16 v270 = 2112;
      CFStringRef v271 = v177;
      __int16 v272 = 2048;
      id v273 = v98;
      __int16 v274 = 2112;
      CFStringRef v275 = v99;
      __int16 v276 = 2112;
      CFStringRef v277 = v100;
      __int16 v278 = 2112;
      CFStringRef v279 = v101;
      __int16 v280 = 2112;
      id v281 = v102;
      __int16 v282 = 2112;
      CFStringRef v283 = v103;
      __int16 v284 = 2112;
      CFStringRef v285 = v104;
      __int16 v286 = 2112;
      CFStringRef v287 = v93;
      __int16 v288 = 2048;
      id v289 = v118;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "sendMessage of size %lu  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p", buf, 0xA2u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v194 = [v13 bulkedPayload];
      BOOL v191 = [v13 fromID];
      id v188 = [v13 destinations];
      CFStringRef v119 = @"YES";
      if ([v13 useDictAsTopLevel]) {
        CFStringRef v120 = @"YES";
      }
      else {
        CFStringRef v120 = @"NO";
      }
      CFStringRef v185 = v120;
      if ([v13 encryptPayload]) {
        CFStringRef v121 = @"YES";
      }
      else {
        CFStringRef v121 = @"NO";
      }
      CFStringRef v181 = v121;
      if ([v13 wantsResponse]) {
        CFStringRef v122 = @"YES";
      }
      else {
        CFStringRef v122 = @"NO";
      }
      [v13 timeout];
      uint64_t v124 = v123;
      id v112 = [v13 command];
      if ([v13 wantsDeliveryStatus]) {
        CFStringRef v125 = @"YES";
      }
      else {
        CFStringRef v125 = @"NO";
      }
      if ([v13 wantsCertifiedDelivery]) {
        CFStringRef v126 = @"YES";
      }
      else {
        CFStringRef v126 = @"NO";
      }
      uint64_t v115 = [v13 deliveryStatusContext];
      unsigned int v116 = [v13 messageUUID];
      if ([v13 priority] == (id)300)
      {
        CFStringRef v127 = @"URGENT";
      }
      else if ([v13 priority] == (id)200)
      {
        CFStringRef v127 = @"Default";
      }
      else
      {
        CFStringRef v127 = @"Sync";
      }
      if (![v13 localDelivery]) {
        CFStringRef v119 = @"NO";
      }
      id v128 = (__CFString *)objc_retainBlock(v215);
      CFStringRef v174 = v119;
      v175 = v128;
      CFStringRef v172 = v116;
      CFStringRef v173 = v127;
      CFStringRef v170 = v126;
      __int16 v171 = v115;
      CFStringRef v168 = v112;
      CFStringRef v169 = v125;
      long long v167 = v124;
      CFStringRef v165 = v181;
      CFStringRef v166 = v122;
      CFStringRef v163 = v188;
      CFStringRef v164 = v185;
      long long v159 = v194;
      long long v161 = v191;
      id v157 = (id)v213;
      _IDSLogV();
      goto LABEL_186;
    }
  }
  unsigned __int8 v129 = objc_msgSend(v13, "bypassSizeCheck", v157, v159, v161, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175);
  if (v213 <= 0x500000) {
    char v130 = 1;
  }
  else {
    char v130 = v129;
  }
  if ((v130 & 1) == 0)
  {
    id v141 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v213;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v210;
      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "Payload length %lu for topic %@ is too big to send.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    if (v215) {
      goto LABEL_211;
    }
    goto LABEL_257;
  }
  if (([v13 bypassSizeCheck] & 1) != 0
    || [v13 priority] != (id)300
    || v213 <= 0x100000)
  {
    id v258 = 0;
    id v257 = 0;
    [a1 _splitDestinations:v212 intoLocalDestinations:&v258 remoteDestinations:&v257 threadContext:v217 sendParameters:v13];
    id v131 = v258;
    id v132 = v257;
    id v133 = [v131 allKeys];
    v255[0] = _NSConcreteStackBlock;
    v255[1] = 3221225472;
    v255[2] = sub_1002FAD38;
    v255[3] = &unk_10097E990;
    id v134 = v204;
    id v256 = v134;
    id v135 = objc_msgSend(v133, "__imArrayByApplyingBlock:", v255);

    id v136 = [v13 resourcePath];
    if (v136)
    {
      BOOL v137 = [v132 count] == 0;

      if (!v137)
      {
        id v138 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "Attempt to send a file transfer over IDS to a remote destination over File Transfer API. Setting Command", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        [v13 setCommand:&off_1009D1D10];
      }
    }
    if ([v13 localDelivery]
      && (![v132 count] ? (char v139 = 1) : (char v139 = v195), (v139 & 1) == 0))
    {
      __int16 v144 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v212;
        *(_WORD *)&buf[22] = 2112;
        v266 = (uint64_t (*)(uint64_t, uint64_t))v132;
        _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_ERROR, "Account %@ was asked to send to %@ with forced local delivery but there are unaddressible remote destinations %@ - failing message.", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        long long v160 = v212;
        id v162 = v132;
        id v158 = a1;
        _IDSLogTransport();
      }
      char v140 = 0;
    }
    else
    {
      char v140 = 1;
    }
    if (objc_msgSend(v132, "count", v158, v160, v162) || objc_msgSend(v131, "count"))
    {
      if (v140)
      {
        v254[0] = 0;
        v254[1] = v254;
        v254[2] = 0x2020000000;
        v254[3] = 0;
        uint64_t v250 = 0;
        v251 = &v250;
        uint64_t v252 = 0x2020000000;
        char v253 = -86;
        char v253 = [v131 count] == 0;
        v248[0] = 0;
        v248[1] = v248;
        v248[2] = 0x2020000000;
        char v249 = -86;
        id v145 = v205;
        char v249 = [v132 count] == 0;
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v266 = sub_1002F710C;
        *(void *)v267 = sub_1002F711C;
        *(void *)&v267[8] = 0;
        if (v196)
        {
          __int16 v146 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v247 = 0;
            _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "Setting localLastCall to YES for this proxied outgoing message so that the completion does not rely on the local reflection", v247, 2u);
          }

          id v145 = v205;
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          *((unsigned char *)v251 + 24) = 1;
        }
        if ([v131 count])
        {
          id v147 = [v13 copy];
          __int16 v148 = v147;
          if (v196) {
            [v147 setTimeout:IDSMaxMessageTimeout];
          }
          [v148 setFinalDestinationURIs:v135];
          v239[0] = _NSConcreteStackBlock;
          v239[1] = 3221225472;
          v239[2] = sub_1002FADB4;
          v239[3] = &unk_1009886F8;
          char v246 = v196;
          v242 = &v250;
          v243 = buf;
          v244 = v254;
          id v240 = v13;
          id v241 = v215;
          v245 = v248;
          +[IDSDAccount _sendLocallyWithSendParameters:v148 service:v134 uriToLocalDestination:v131 data:v201 protobuf:v214 threadContext:v217 progressBlock:v202 completionBlock:v239];

          id v145 = v205;
        }
        if (v145)
        {
          v235[0] = _NSConcreteStackBlock;
          v235[1] = 3221225472;
          v235[2] = sub_1002FB108;
          v235[3] = &unk_100988720;
          id v236 = v131;
          id v237 = v135;
          id v238 = v145;
          CFStringRef v149 = objc_retainBlock(v235);
        }
        else
        {
          CFStringRef v149 = 0;
        }
        if ([v132 count])
        {
          __int16 v150 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1002FB238;
          block[3] = &unk_1009887F0;
          unsigned int v233 = v200;
          unsigned __int8 v234 = v195;
          id v219 = v13;
          id v232 = a1;
          id v220 = v134;
          id v221 = v217;
          id v225 = v202;
          id v226 = v215;
          id v222 = v132;
          id v223 = v201;
          id v224 = v214;
          long long v227 = v149;
          long long v228 = v248;
          long long v229 = buf;
          long long v230 = v254;
          long long v231 = &v250;
          dispatch_async(v150, block);
        }
        else
        {
          id v151 = [v131 count];
          if (v205 && v151) {
            (*((void (**)(id, void *, void, void))v205 + 2))(v205, v135, 0, 0);
          }
        }

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v248, 8);
        _Block_object_dispose(&v250, 8);
        _Block_object_dispose(v254, 8);
LABEL_255:

        goto LABEL_256;
      }
    }
    else
    {
      __int16 v152 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v212;
        _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_ERROR, "Account %@ was asked to send to %@ but we were unable to resolve any actual destinations - failing message.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    id v153 = objc_alloc((Class)NSError);
    id v154 = [v153 initWithDomain:IDSSendErrorDomain code:1 userInfo:0];
    if (v215)
    {
      id v155 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:1 error:v154 lastCall:1];
      (*((void (**)(id, id))v215 + 2))(v215, v155);
    }
    goto LABEL_255;
  }
  uint64_t v143 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v213;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v210;
    _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "Payload length %lu for topic %@ is too big to send as urgent", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
  if (v215)
  {
LABEL_211:
    id v142 = objc_alloc((Class)NSError);
    id v131 = [v142 initWithDomain:IDSSendErrorDomain code:8 userInfo:0];
    id v132 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:8 error:v131 lastCall:1];
    (*((void (**)(id, id))v215 + 2))(v215, v132);
LABEL_256:
  }
LABEL_257:
}

- (int64_t)maxRemoteMessagingPayloadSize
{
  BOOL v3 = +[IDSDeliveryController sharedInstance];
  id v4 = [(IDSDAccount *)self service];
  id v5 = objc_msgSend(v3, "effectiveMaxPayloadSizeIfCanUseLargePayload:", objc_msgSend(v4, "canUseLargePayload"));

  return (int64_t)v5;
}

- (id)newSendMessageContext
{
  im_assert_primary_base_queue();
  BOOL v3 = objc_alloc_init(IDSDAccountSendMessageContext);
  id v4 = [(IDSDAccount *)self service];
  id v5 = [v4 identifier];
  [(IDSDAccountSendMessageContext *)v3 setServiceIdentifier:v5];

  uint64_t v6 = [v4 pushTopic];
  [(IDSDAccountSendMessageContext *)v3 setServicePushTopic:v6];

  id v7 = [v4 duetIdentifiers];
  [(IDSDAccountSendMessageContext *)v3 setServiceDuetIdentifiers:v7];

  -[IDSDAccountSendMessageContext setServiceAdHocType:](v3, "setServiceAdHocType:", [v4 adHocServiceType]);
  -[IDSDAccountSendMessageContext setServiceIsDSBased:](v3, "setServiceIsDSBased:", [v4 shouldRegisterUsingDSHandle]);
  -[IDSDAccountSendMessageContext setServiceAllowProxyDelivery:](v3, "setServiceAllowProxyDelivery:", [v4 shouldAllowProxyDelivery]);
  -[IDSDAccountSendMessageContext setServiceAllowLocalDelivery:](v3, "setServiceAllowLocalDelivery:", [v4 allowLocalDelivery]);
  -[IDSDAccountSendMessageContext setServiceAllowWiProxDelivery:](v3, "setServiceAllowWiProxDelivery:", [v4 allowWiProxDelivery]);
  -[IDSDAccountSendMessageContext setServiceAllowLiveMessageDelivery:](v3, "setServiceAllowLiveMessageDelivery:", [v4 shouldAllowLiveMessageDelivery]);
  -[IDSDAccountSendMessageContext setServiceUseiMessageCallerID:](v3, "setServiceUseiMessageCallerID:", [v4 useiMessageCallerID]);
  -[IDSDAccountSendMessageContext setServiceWantsReflectedSend:](v3, "setServiceWantsReflectedSend:", [v4 wantsLocalReflectedSend]);
  -[IDSDAccountSendMessageContext setServiceWantsTinkerDevices:](v3, "setServiceWantsTinkerDevices:", [v4 wantsTinkerDevices]);
  -[IDSDAccountSendMessageContext setSilentlyFailMessagesOnSwitch:](v3, "setSilentlyFailMessagesOnSwitch:", [v4 shouldSilentlyFailMessagesOnSwitch]);
  -[IDSDAccountSendMessageContext setShouldProtectTrafficUsingClassA:](v3, "setShouldProtectTrafficUsingClassA:", [v4 shouldProtectTrafficUsingClassA]);
  -[IDSDAccountSendMessageContext setShouldAllowCloudDelivery:](v3, "setShouldAllowCloudDelivery:", [v4 shouldAllowCloudDelivery]);
  [(IDSDAccountSendMessageContext *)v3 setAccountType:[(IDSDAccount *)self accountType]];
  id v8 = [(IDSDAccount *)self primaryRegistration];
  id v9 = [v8 dsHandle];
  [(IDSDAccountSendMessageContext *)v3 setPrimaryRegistrationDSHandle:v9];

  long long v10 = [(IDSDAccount *)self displayName];
  [(IDSDAccountSendMessageContext *)v3 setAccountDisplayName:v10];

  id v11 = [(IDSDAccount *)self primaryRegistration];
  id v12 = [v11 uris];
  [(IDSDAccountSendMessageContext *)v3 setPrimaryRegistrationURIs:v12];

  [(IDSDAccountSendMessageContext *)v3 setIsRegistrationActive:[(IDSDAccount *)self isRegistrationActive]];
  id v13 = -[IDSDAccount dependentRegistrationsIncludingTinker:](self, "dependentRegistrationsIncludingTinker:", [v4 wantsTinkerDevices]);
  [(IDSDAccountSendMessageContext *)v3 setDependentRegistrations:v13];

  id v14 = -[IDSDAccount defaultPairedDependentRegistrationIncludingTinker:](self, "defaultPairedDependentRegistrationIncludingTinker:", [v4 wantsTinkerDevices]);
  [(IDSDAccountSendMessageContext *)v3 setDefaultPairedDependentRegistrations:v14];

  id v15 = +[IDSDAccountController sharedInstance];
  id v16 = [v15 appleIDAccountOnService:v4];
  id v17 = [v16 dependentRegistrations];
  [(IDSDAccountSendMessageContext *)v3 setAppleIDPrimaryDependentRegistrations:v17];

  id v18 = [(IDSDAccount *)self unprefixedURIStringsFromRegistration];
  [(IDSDAccountSendMessageContext *)v3 setAliasStrings:v18];

  unsigned int v19 = [(IDSDAccount *)self pseudonyms];
  [(IDSDAccountSendMessageContext *)v3 setPseudonyms:v19];

  unsigned int v20 = [(IDSDAccount *)self smallDescription];
  [(IDSDAccountSendMessageContext *)v3 setAccountDescription:v20];

  unsigned int v21 = [(IDSDAccount *)self service];
  -[IDSDAccountSendMessageContext setDataProtectionClass:](v3, "setDataProtectionClass:", [v21 dataProtectionClass]);

  return v3;
}

- (void)_sendMessageWithSendParametersOnMainThread:(id)a3 filteredDestinations:(id)a4 data:(id)a5 compressedData:(id)a6 protobufToSend:(id)a7 willSendBlock:(id)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v55 = a4;
  id v52 = a5;
  id v51 = a6;
  id v53 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = [v15 command];
  if ([v18 integerValue] == (id)130) {
    goto LABEL_7;
  }
  unsigned int v19 = [v15 command];
  if ([v19 integerValue] == (id)120)
  {
LABEL_6:

LABEL_7:
    unsigned int v21 = 0;
    goto LABEL_8;
  }
  unsigned int v20 = [(IDSDAccount *)self service];
  if (![v20 wantsLocalReflectedSend]
    || [v15 isProxiedOutgoingMessage])
  {

    goto LABEL_6;
  }
  unsigned int v21 = [(IDSDAccount *)self shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:v15];

  if (v21)
  {
    id v39 = [v55 mutableCopy];
    id v40 = IDSDefaultPairedDevice;
    [v39 addObject:v40];
    id v41 = v39;

    long long v42 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFStringRef v88 = 138412290;
      *(void *)&void v88[4] = v41;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Adding local device as a destination for this message, Destinations For This Message Are Now %@", v88, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v47 = v41;
      _IDSLogV();
    }

    unsigned int v21 = 1;
    id v55 = v41;
  }
LABEL_8:
  id v86 = 0;
  id v87 = 0;
  id v85 = 0;
  -[IDSDAccount _splitDestinations:intoLocalDestinations:remoteDestinations:rapportDestinations:sendParameters:](self, "_splitDestinations:intoLocalDestinations:remoteDestinations:rapportDestinations:sendParameters:", v55, &v87, &v86, &v85, v15, v47);
  id v22 = v87;
  unsigned int v23 = (uint64_t (*)(uint64_t, uint64_t))v86;
  id v24 = v85;
  uint64_t v25 = [v22 allKeys];
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1002FCD64;
  v84[3] = &unk_10097E990;
  v84[4] = self;
  unsigned int v54 = objc_msgSend(v25, "__imArrayByApplyingBlock:", v84);

  if ([v15 localDelivery]
    && [v23 count]
    && ([(IDSDAccount *)self service],
        id v26 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v27 = [v26 shouldAllowProxyDelivery],
        v26,
        (v27 & 1) == 0))
  {
    uint64_t v38 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFStringRef v88 = 138412802;
      *(void *)&void v88[4] = self;
      *(_WORD *)&v88[12] = 2112;
      *(void *)&v88[14] = v55;
      *(_WORD *)&v88[22] = 2112;
      uint64_t v89 = v23;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Account %@ was asked to send to %@ with forced local delivery but there are unaddressible remote destinations %@ - failing message.", v88, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      id v49 = v55;
      BOOL v50 = v23;
      uint64_t v48 = self;
      _IDSLogTransport();
    }
    char v28 = 0;
  }
  else
  {
    char v28 = 1;
  }
  if (objc_msgSend(v23, "count", v48, v49, v50) || objc_msgSend(v22, "count") || objc_msgSend(v24, "count"))
  {
    if (v28)
    {
      v83[0] = 0;
      v83[1] = v83;
      v83[2] = 0x2020000000;
      v83[3] = 0;
      uint64_t v79 = 0;
      CFStringRef v80 = &v79;
      uint64_t v81 = 0x2020000000;
      char v82 = -86;
      char v82 = [v22 count] == 0;
      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x2020000000;
      char v78 = -86;
      char v78 = [v23 count] == 0;
      *(void *)CFStringRef v88 = 0;
      *(void *)&v88[8] = v88;
      *(void *)&v88[16] = 0x3032000000;
      uint64_t v89 = sub_1002F710C;
      id v90 = sub_1002F711C;
      id v91 = 0;
      if (v21)
      {
        BOOL v29 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Setting localLastCall to YES for this proxied outgoing message so that the completion does not rely on the local reflection", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        *((unsigned char *)v80 + 24) = 1;
      }
      if ([v22 count])
      {
        id v30 = [v15 copy];
        id v31 = v30;
        if (v21) {
          [v30 setTimeout:IDSMaxMessageTimeout];
        }
        [v31 setFinalDestinationURIs:v54];
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_1002FCDF0;
        v68[3] = &unk_100988818;
        char v74 = v21;
        BOOL v75 = [v23 count] == 0;
        int v71 = v88;
        uint64_t v72 = v83;
        int v70 = &v79;
        v68[4] = self;
        id v69 = v17;
        id v73 = v77;
        [(IDSDAccount *)self _sendLocallyWithSendParameters:v31 uriToLocalDestination:v22 data:v52 protobuf:v53 completionBlock:v68];
      }
      if ([v24 count])
      {
        id v32 = objc_msgSend(v24, "__imArrayByApplyingBlock:", &stru_100988838);
        if (v16) {
          (*((void (**)(id, void *, void, void))v16 + 2))(v16, v32, 0, 0);
        }
        id v33 = [v15 copy];
        [v33 setFinalDestinationURIs:v32];
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_1002FD15C;
        v66[3] = &unk_1009828A0;
        id v67 = v17;
        [(IDSDAccount *)self _rapportSendWithSendParameters:v33 completionBlock:v66];
      }
      if (v16)
      {
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1002FD16C;
        v62[3] = &unk_100988720;
        id v63 = v22;
        id v64 = v54;
        id v65 = v16;
        id v34 = objc_retainBlock(v62);
      }
      else
      {
        id v34 = 0;
      }
      if ([v23 count])
      {
        id v35 = [v15 copy];
        CFStringRef v36 = objc_msgSend(v23, "__imArrayByApplyingBlock:", &stru_100988858);
        [v35 setFinalDestinationURIs:v36];

        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1002FD2AC;
        v56[3] = &unk_100988880;
        v56[4] = self;
        long long v58 = v77;
        id v59 = v88;
        unsigned int v60 = v83;
        id v57 = v17;
        uint64_t v61 = &v79;
        [(IDSDAccount *)self _sendRemotelyWithSendParameters:v35 data:v52 protobuf:v53 willSendBlock:v34 completionBlock:v56];
      }
      else
      {
        id v37 = [v22 count];
        if (v16 && v37) {
          (*((void (**)(id, void *, void, void))v16 + 2))(v16, v54, 0, 0);
        }
      }

      _Block_object_dispose(v88, 8);
      _Block_object_dispose(v77, 8);
      _Block_object_dispose(&v79, 8);
      _Block_object_dispose(v83, 8);
      goto LABEL_59;
    }
  }
  else
  {
    long long v43 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFStringRef v88 = 138412546;
      *(void *)&void v88[4] = self;
      *(_WORD *)&v88[12] = 2112;
      *(void *)&v88[14] = v55;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Account %@ was asked to send to %@ but we were unable to resolve any actual destinations - failing message.", v88, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  id v44 = objc_alloc((Class)NSError);
  id v45 = [v44 initWithDomain:IDSSendErrorDomain code:1 userInfo:0];
  if (v17)
  {
    id v46 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:1 error:v45 lastCall:1];
    (*((void (**)(id, id))v17 + 2))(v17, v46);
  }
LABEL_59:
}

- (void)sendServerMessage:(id)a3 command:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IDSDAccount *)self service];
  id v12 = [v11 pushTopic];

  id v13 = [[IDSServerMessage alloc] initWithPayload:v8 command:v9];
  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    BOOL v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending server message: %@   command: %@   account: %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v19 = v9;
    unsigned int v20 = self;
    id v18 = v8;
    _IDSLogV();
  }
  id v15 = +[IDSDeliveryController sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002FD910;
  v21[3] = &unk_1009801B0;
  id v22 = v12;
  id v23 = v10;
  id v16 = v10;
  id v17 = v12;
  [v15 sendIDSMessage:v13 service:0 topic:v17 completionBlock:v21];
}

- (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 rapportDestinations:(id *)a6 sendParameters:(id)a7
{
  id v118 = (IDSDAccount *)a3;
  id v127 = a7;
  uint64_t v115 = a4;
  if (!a4 && !a5 && !a6)
  {
    id v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v155 = v118;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No output arrays specified for _splitDestinations %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    goto LABEL_222;
  }
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v155 = self;
    __int16 v156 = 2112;
    id v157 = v118;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ splitting destinations %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v107 = self;
    CFStringRef v111 = v118;
    _IDSLogV();
  }
  id v120 = objc_alloc_init((Class)NSMutableDictionary);
  id v121 = objc_alloc_init((Class)NSMutableArray);
  id v123 = objc_alloc_init((Class)NSMutableArray);
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id obj = v118;
  id v130 = [(IDSDAccount *)obj countByEnumeratingWithState:&v150 objects:v163 count:16];
  if (v130)
  {
    uint64_t v129 = *(void *)v151;
    uint64_t v131 = IDSDefaultPairedDevice;
    uint64_t v125 = IDSDevicePropertyPushToken;
    uint64_t v124 = IDSDevicePropertyIdentities;
    uint64_t v136 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v137 = IDSDevicePropertyIdentifierOverride;
    uint64_t v135 = IDSPrivateDeviceDataUniqueID;
    CFStringRef v122 = (void *)IDSDeviceDefaultPairedDeviceUniqueID;
    uint64_t v119 = IDSDevicePairedDeviceID;
    do
    {
      id v133 = 0;
      do
      {
        if (*(void *)v151 != v129) {
          objc_enumerationMutation(obj);
        }
        id v11 = (IDSDAccount *)*(id *)(*((void *)&v150 + 1) + 8 * (void)v133);
        id v12 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v155 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - looking up device for dest %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          CFStringRef v107 = v11;
          _IDSLogV();
        }
        LODWORD(v13) = -[IDSDAccount isEqualToString:](v11, "isEqualToString:", v131, v107, v111, v113, v114);
        if (v13)
        {
          id v14 = [(IDSDAccount *)self defaultPairedDependentRegistration];
          id v15 = v14;
          if (!v14)
          {
            id v44 = +[NSDictionary dictionaryWithObjectsAndKeys:@"bt-id", v122, @"device-id", 0];
            [v120 setObject:v44 forKey:v131];

            goto LABEL_191;
          }
          id v16 = [(IDSDAccount *)v14 objectForKey:v125];
          id v17 = [(IDSDAccount *)v15 objectForKey:v124];
          id v18 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_1009888A0);

          id v19 = [(IDSDAccount *)self service];
          unsigned int v20 = [v19 identifier];
          _IDSPrefersPhoneNumbersForServiceIdentifier();

          unsigned int v21 = (void *)_IDSCopyCallerID();
          id v22 = objc_msgSend(v21, "_URIFromFZIDType:", objc_msgSend(v21, "_FZBestGuessFZIDType"));
          id v23 = (IDSDAccount *)_IDSCopyIDForTokenWithURI();

          id v24 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v155 = v23;
            __int16 v156 = 2112;
            id v157 = v15;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Resolved destination %@ from default paired device constant device %@.", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v108 = v23;
            CFStringRef v111 = v15;
            _IDSLogV();
          }
        }
        else
        {
          id v23 = v11;
        }
        if ([(IDSDAccount *)v23 hasPrefix:@"device:", v108])
        {
          id v25 = [(IDSDAccount *)v23 _stripFZIDPrefix];
          __int16 v26 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v155 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(Instance) Destination device uniqueID: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v109 = v25;
            _IDSLogV();
          }
          id v27 = [(IDSDAccount *)self service];
          -[IDSDAccount defaultPairedDependentRegistrationIncludingTinker:](self, "defaultPairedDependentRegistrationIncludingTinker:", [v27 wantsTinkerDevices]);
          __int16 v28 = (IDSDAccount *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            BOOL v29 = [(IDSDAccount *)v28 _stringForKey:v137];
            id v30 = [(IDSDAccount *)v28 objectForKey:v136];
            id v13 = [v30 _stringForKey:v135];

            id v31 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v155 = v29;
              __int16 v156 = 2112;
              id v157 = v13;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "(Instance) Default paired device uniqueID override %@   uniqueID %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v109 = v29;
              CFStringRef v111 = v13;
              _IDSLogV();
            }
            if ((-[IDSDAccount isEqualToIgnoringCase:](v25, "isEqualToIgnoringCase:", v29, v109) & 1) == 0
              && ![(IDSDAccount *)v25 isEqualToIgnoringCase:v13]
              || [v127 sessionForceInternetInvitation])
            {

              goto LABEL_48;
            }

            LOBYTE(v13) = 1;
LABEL_78:

            id v45 = [(IDSDAccount *)v28 objectForKey:v125];
            id v46 = [(IDSDAccount *)v28 objectForKey:v124];
            id v47 = objc_msgSend(v46, "__imArrayByApplyingBlock:", &stru_1009888C0);

            uint64_t v48 = [(IDSDAccount *)self service];
            id v49 = [v48 identifier];
            _IDSPrefersPhoneNumbersForServiceIdentifier();

            BOOL v50 = (void *)_IDSCopyCallerID();
            id v51 = objc_msgSend(v50, "_URIFromFZIDType:", objc_msgSend(v50, "_FZBestGuessFZIDType"));
            uint64_t v52 = _IDSCopyIDForTokenWithURI();

            id v53 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v155 = (IDSDAccount *)v52;
              __int16 v156 = 2112;
              id v157 = v28;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "(Instance) Resolved destination %@ from default paired device constant device %@.", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v109 = (IDSDAccount *)v52;
              CFStringRef v111 = v28;
              _IDSLogV();
            }

            BOOL v29 = v28;
            id v23 = (IDSDAccount *)v52;
          }
          else
          {
LABEL_48:
            id v32 = [(IDSDAccount *)self service];
            id v33 = -[IDSDAccount dependentRegistrationsIncludingTinker:](self, "dependentRegistrationsIncludingTinker:", [v32 wantsTinkerDevices]);

            long long v149 = 0u;
            long long v147 = 0u;
            long long v148 = 0u;
            long long v146 = 0u;
            BOOL v29 = v33;
            id v34 = [(IDSDAccount *)v29 countByEnumeratingWithState:&v146 objects:v162 count:16];
            if (v34)
            {
              uint64_t v35 = *(void *)v147;
LABEL_50:
              uint64_t v36 = 0;
              while (1)
              {
                if (*(void *)v147 != v35) {
                  objc_enumerationMutation(v29);
                }
                id v37 = *(void **)(*((void *)&v146 + 1) + 8 * v36);
                uint64_t v38 = [v37 _stringForKey:v137];
                id v39 = [v37 objectForKey:v136];
                id v40 = [v39 _stringForKey:v135];

                id v41 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v155 = v38;
                  __int16 v156 = 2112;
                  id v157 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "(Instance) Device uniqueID override %@   uniqueID %@", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v109 = v38;
                  CFStringRef v111 = v40;
                  _IDSLogV();
                }
                if ((-[IDSDAccount isEqualToIgnoringCase:](v38, "isEqualToIgnoringCase:", v25, v109) & 1) != 0
                  || [(IDSDAccount *)v40 isEqualToIgnoringCase:v25])
                {
                  break;
                }

                if (v34 == (id)++v36)
                {
                  id v34 = [(IDSDAccount *)v29 countByEnumeratingWithState:&v146 objects:v162 count:16];
                  if (v34) {
                    goto LABEL_50;
                  }
                  goto LABEL_62;
                }
              }
              __int16 v28 = v37;
              long long v42 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v155 = v28;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "(Instance) Found matching device %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                CFStringRef v109 = v28;
                _IDSLogV();
              }

              if (v28)
              {
                LOBYTE(v13) = 0;
                goto LABEL_78;
              }
            }
            else
            {
LABEL_62:
            }
            long long v43 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v155 = v25;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "(Instance) Didn't find matching device for uniqueID %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v109 = v25;
              _IDSLogV();
            }
            LOBYTE(v13) = 0;
          }
        }
        if ([(IDSDAccount *)v23 hasPrefix:@"guest-device:", v109])
        {
          [v123 addObject:v23];
          LOBYTE(v13) = 1;
        }
        if (![(IDSDAccount *)v23 hasPrefix:@"token:"]) {
          goto LABEL_176;
        }
        id v145 = 0;
        unsigned int v54 = [(IDSDAccount *)v23 _stripPotentialTokenURIWithToken:&v145];
        id v132 = (IDSDAccount *)v145;
        id v55 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v155 = v132;
          __int16 v156 = 2112;
          id v157 = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - token %@ and uri %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          CFStringRef v107 = v132;
          CFStringRef v111 = v54;
          _IDSLogV();
        }
        if (!v132 || !v54)
        {
          id v57 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v155 = v23;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Malformed destination %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            _IDSWarnV();
            _IDSLogV();
            CFStringRef v107 = v23;
            _IDSLogTransport();
          }

          goto LABEL_190;
        }
        char v144 = 0;
        if ([(IDSDAccount *)v54 localizedCaseInsensitiveContainsString:@"__localURI__"])
        {
          id v56 = v122;
          LOBYTE(v13) = 1;
          id v128 = v56;
        }
        else
        {
          long long v58 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            IDSLoggableDescriptionForHandleOnService();
            id v59 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue();
            IDSLoggableDescriptionForTokenOnService();
            unsigned int v60 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            id v155 = v59;
            __int16 v156 = 2112;
            id v157 = v60;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Finding device matching URI %@ and token %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v61 = IDSLoggableDescriptionForHandleOnService();
            IDSLoggableDescriptionForTokenOnService();
            v111 = CFStringRef v107 = v61;
            _IDSLogV();
          }
          id v142 = 0;
          id v143 = 0;
          -[IDSDAccount findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:](self, "findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:", &v143, &v142, v54, v132, &v144, v107);
          id v56 = (IDSDAccount *)v143;
          id v128 = (IDSDAccount *)v142;
          id v62 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v155 = v56;
            __int16 v156 = 2112;
            id v157 = v128;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Found deviceID %@ and btID %@ after first try", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v107 = v56;
            CFStringRef v111 = v128;
            _IDSLogV();
          }
        }
        if (!v56)
        {
          id v63 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            id v64 = [(IDSDAccount *)self smallDescription];
            *(_DWORD *)buf = 138412290;
            id v155 = v64;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Did not find deviceID using account %@", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v107 = [(IDSDAccount *)self smallDescription];
            _IDSLogV();
          }
          id v65 = +[IDSDAccountController sharedInstance];
          uint64_t v66 = [(IDSDAccount *)self service];
          id v67 = [v65 appleIDAccountOnService:v66];

          char v140 = v128;
          id v141 = 0;
          [v67 findDeviceUniqueID:&v141 btID:&v140 forURI:v54 token:v132 supportsLiveDelivery:&v144];
          id v56 = (IDSDAccount *)v141;
          id v68 = v140;

          id v69 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            int v70 = [v67 smallDescription];
            *(_DWORD *)buf = 138412546;
            id v155 = v56;
            __int16 v156 = 2112;
            id v157 = v70;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Found deviceID %@ using primary %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            [v67 smallDescription];
            v111 = CFStringRef v107 = v56;
            _IDSLogV();
          }
          id v128 = v68;
        }
        int v71 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v155 = v56;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - found device id %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          CFStringRef v107 = v56;
          _IDSLogV();
        }
        uint64_t v72 = [(IDSDAccount *)self service];
        if ([v72 shouldAllowLiveMessageDelivery])
        {
          id v73 = [(IDSDAccount *)self service];
          char v74 = [v73 identifier];
          if (sub_1002F5FEC((uint64_t)v74)) {
            unsigned int v75 = 0;
          }
          else {
            unsigned int v75 = sub_1002F60A4() ^ 1;
          }
        }
        else
        {
          unsigned int v75 = 0;
        }

        int v76 = _os_feature_enabled_impl();
        if (v56) {
          int v77 = v76;
        }
        else {
          int v77 = 0;
        }
        if (v77 == 1 && ([v127 liveMessageDelivery] & v75) == 1 && v144)
        {
          char v78 = [(IDSDAccount *)self utunDeliveryController];
          id v79 = [v78 copyPeerWithID:v56];

          if (([v79 isCloudConnected] & 1) == 0)
          {
            [v127 setLiveMessageDelivery:0];
            CFStringRef v80 = im_primary_queue();
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002FFB28;
            block[3] = &unk_10097E4D0;
            id v139 = v79;
            dispatch_async(v80, block);

            uint64_t v81 = +[IDSUTunController sharedInstance];
            [v81 startGlobalLinkForDevice:v56];

            char v82 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v155 = v56;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Using push instead of Live Delivery while GL warms for device id %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v110 = v56;
              _IDSLogV();
            }
          }
        }
        if (qword_100A4C720 != -1) {
          dispatch_once(&qword_100A4C720, &stru_1009888E0);
        }
        CFStringRef v83 = objc_msgSend(v127, "sessionID", v110);
        if ([v127 liveMessageDelivery]
          && (v56 ? (unsigned int v84 = v75) : (unsigned int v84 = 0), v84 == 1 && v128))
        {
          if (!v144)
          {
            CFStringRef v95 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v155 = v56;
              __int16 v156 = 2112;
              id v157 = v54;
              _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Device does not support live delivery, falling back to push {deviceID: %@, strippedURI: %@}", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v107 = v56;
              CFStringRef v111 = v54;
              _IDSLogV();
            }
            goto LABEL_169;
          }
          uint64_t v85 = +[NSDictionary dictionaryWithObjectsAndKeys:v128, @"bt-id", v56, v119, 0];
        }
        else
        {
          id v87 = [(IDSDAccount *)self service];
          if (![v87 allowLocalDelivery] || byte_100A4C718 || !v56)
          {

LABEL_169:
            if (byte_100A4C718)
            {
              id v91 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "  Local IDS is disabled... not sending locally", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
            }

LABEL_176:
            uint64_t v92 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v155 = v23;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEBUG, "Splitting out local destinations - no local device for URI %@, adding to remote", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v107 = v23;
              _IDSLogV();
            }
            if (v23) {
              char v93 = (char)v13;
            }
            else {
              char v93 = 1;
            }
            if (v93)
            {
              CFStringRef v94 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "(Instance) Dest became nil while trying to split destinations.", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                _IDSWarnV();
                _IDSLogV();
                _IDSLogTransport();
              }
            }
            else
            {
              [v121 addObject:v23];
            }
            goto LABEL_190;
          }

          if (!v128) {
            goto LABEL_169;
          }
          unsigned int v88 = [(IDSDAccount *)v56 isEqualToString:v122];
          uint64_t v89 = [(IDSDAccount *)self service];
          unsigned int v90 = [v89 allowWiProxDelivery];

          if (!((v88 | v90) & 1 | (v83 != 0)))
          {
            CFStringRef v96 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v97 = [(IDSDAccount *)self service];
              unsigned int v98 = [v97 allowWiProxDelivery];
              *(_DWORD *)buf = 138413058;
              CFStringRef v99 = @"NO";
              if (v98) {
                CFStringRef v99 = @"YES";
              }
              id v155 = v23;
              __int16 v156 = 2112;
              id v157 = v56;
              __int16 v158 = 2112;
              long long v159 = v128;
              __int16 v160 = 2112;
              CFStringRef v161 = v99;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Not considering %@ for local. DeviceID is %@  (btID: %@)  and we're not already scanning/advertising. Service allows wiprox? %@", buf, 0x2Au);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v100 = [(IDSDAccount *)self service];
              if ([v100 allowWiProxDelivery]) {
                CFStringRef v101 = @"YES";
              }
              else {
                CFStringRef v101 = @"NO";
              }
              CFStringRef v113 = v128;
              CFStringRef v114 = v101;
              CFStringRef v107 = v23;
              CFStringRef v111 = v56;
              _IDSLogV();
            }
            goto LABEL_169;
          }
          if (v83) {
            +[NSDictionary dictionaryWithObjectsAndKeys:v128, @"bt-id", v56, v119, v83, @"session-id", 0];
          }
          else {
          uint64_t v85 = +[NSDictionary dictionaryWithObjectsAndKeys:v128, @"bt-id", v56, v119, 0];
          }
        }
        id v86 = (void *)v85;
        [v120 setObject:v85 forKey:v23];

LABEL_190:
        id v11 = v23;
LABEL_191:

        id v133 = (char *)v133 + 1;
      }
      while (v133 != v130);
      id v102 = [(IDSDAccount *)obj countByEnumeratingWithState:&v150 objects:v163 count:16];
      id v130 = v102;
    }
    while (v102);
  }

  unsigned __int8 v103 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v120 count]);
    CFStringRef v104 = (IDSDAccount *)objc_claimAutoreleasedReturnValue();
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v121 count]);
    unsigned __int8 v105 = (IDSDAccount *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v155 = v104;
    __int16 v156 = 2112;
    id v157 = v105;
    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "(Instance) Split out local destinations (%@) remote destinations (%@)", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v106 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v120 count]);
    id v112 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v121 count]);
    _IDSLogV();
  }
  if (v115) {
    *uint64_t v115 = v120;
  }
  if (a5) {
    *a5 = v121;
  }
  if (a6) {
    *a6 = v123;
  }

LABEL_222:
}

- (id)utunDeliveryController
{
  return +[IDSUTunDeliveryController sharedInstance];
}

- (void)_sendLocallyWithSendParameters:(id)a3 uriToLocalDestination:(id)a4 data:(id)a5 protobuf:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v108 = a4;
  id v109 = a5;
  id v105 = a6;
  id v98 = a7;
  im_assert_primary_base_queue();
  CFStringRef v107 = self;
  CFStringRef v106 = [(IDSDAccount *)self service];
  unsigned int v94 = [v106 dataProtectionClass];
  id v13 = [v106 pushTopic];
  id v14 = [v12 resourcePath];

  id v15 = [v12 dataToEncrypt];
  id v16 = (char *)[v15 length];
  id v17 = [v109 length];
  id v18 = [v105 data];
  unint64_t v19 = (unint64_t)[v18 length];

  if (v14)
  {
    [v12 setCommand:&off_1009D1D10];
    unsigned int v20 = 0;
  }
  else
  {
    unsigned int v20 = &v16[(void)v17 + v19];
  }
  id v21 = v13;
  id v22 = [v12 metricReportIdentifier];

  id v23 = v21;
  if (v22)
  {
    id v24 = objc_alloc((Class)NSString);
    id v25 = [v12 metricReportIdentifier];
    id v23 = [v24 initWithFormat:@"%@-%@", v21, v25];
  }
  __int16 v26 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    id v27 = [v12 messageUUID];
    *(_WORD *)&unsigned char buf[12] = 2048;
    CFStringRef v28 = @"YES";
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v27;
    if (!v14) {
      CFStringRef v28 = @"NO";
    }
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    char v140 = (uint64_t (*)(uint64_t, uint64_t))v28;
    *(_WORD *)id v141 = 2112;
    *(void *)&v141[2] = v21;
    *(_WORD *)&v141[10] = 2112;
    *(void *)&v141[12] = v108;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Sending message ID (%@) with data length %lu (resource: %@)  [Topic: %@  Local Device IDs: %@]", buf, 0x34u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    BOOL v29 = v14 == 0;
    uint64_t v30 = [v12 messageUUID];
    id v31 = (void *)v30;
    CFStringRef v32 = @"YES";
    if (v29) {
      CFStringRef v32 = @"NO";
    }
    id v76 = v21;
    id v78 = v108;
    uint64_t v72 = v20;
    CFStringRef v74 = v32;
    uint64_t v69 = v30;
    _IDSLogV();
  }
  if (![(IDSDAccount *)v107 accountType]) {
    goto LABEL_17;
  }
  id v33 = _IDSCopyMyPhoneNumbers();
  id v34 = [v12 fromID];
  uint64_t v35 = [v34 _stripFZIDPrefix];
  unsigned int v36 = [v33 containsObject:v35];

  if (v36)
  {
LABEL_17:
    ct_green_tea_logger_create_static();
    id v37 = getCTGreenTeaOsLogHandle();
    uint64_t v38 = v37;
    if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Transmitting phone number", buf, 2u);
    }
  }
  id v39 = [v108 allValues];
  id v40 = objc_msgSend(v39, "__imArrayByApplyingBlock:", &stru_100988900);
  CFStringRef v96 = +[NSMutableSet setWithArray:v40];

  CFStringRef v95 = +[NSMutableSet set];
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x2020000000;
  v132[3] = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  char v140 = sub_1002F710C;
  *(void *)id v141 = sub_1002F711C;
  *(void *)&v141[8] = 0;
  if (([v12 localDelivery] & 1) != 0
    || [v12 requireLocalWiFi])
  {
    id v41 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      if ([v12 localDelivery]) {
        CFStringRef v42 = @"YES";
      }
      else {
        CFStringRef v42 = @"NO";
      }
      unsigned int v43 = [v12 requireLocalWiFi];
      uint64_t v44 = [v12 messageUUID];
      id v45 = (void *)v44;
      if (v43) {
        CFStringRef v46 = @"YES";
      }
      else {
        CFStringRef v46 = @"NO";
      }
      *(_DWORD *)id v133 = 138412802;
      CFStringRef v134 = v42;
      __int16 v135 = 2112;
      CFStringRef v136 = v46;
      __int16 v137 = 2112;
      uint64_t v138 = v44;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Ignoring request to fallback forcedLocal %@ requireLocalWiFi %@ message %@", v133, 0x20u);
    }
    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLogTransport()) {
      goto LABEL_47;
    }
    id v47 = [v12 localDelivery] ? @"YES" : @"NO";
    unsigned int v48 = [v12 requireLocalWiFi];
    uint64_t v49 = [v12 messageUUID];
    BOOL v50 = (void *)v49;
    id v51 = v48 ? @"YES" : @"NO";
    id v73 = v51;
    uint64_t v75 = v49;
    int v70 = v47;
    _IDSLogTransport();

    if (!_IDSShouldLog())
    {
LABEL_47:
      id v57 = 0;
      goto LABEL_50;
    }
    if (objc_msgSend(v12, "localDelivery", v47, v73, v75)) {
      CFStringRef v52 = @"YES";
    }
    else {
      CFStringRef v52 = @"NO";
    }
    unsigned int v53 = [v12 requireLocalWiFi];
    uint64_t v54 = [v12 messageUUID];
    id v55 = (void *)v54;
    if (v53) {
      CFStringRef v56 = @"YES";
    }
    else {
      CFStringRef v56 = @"NO";
    }
    id v73 = (__CFString *)v56;
    uint64_t v75 = v54;
    int v70 = (__CFString *)v52;
    _IDSLogV();
    id v57 = 0;
  }
  else
  {
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_1003008A8;
    v119[3] = &unk_100988928;
    uint64_t v129 = buf;
    id v120 = v95;
    id v121 = v96;
    id v122 = v12;
    id v123 = v107;
    id v130 = v132;
    id v124 = v23;
    uint64_t v131 = v20;
    id v125 = v106;
    id v128 = v98;
    id v126 = v109;
    id v127 = v105;
    id v57 = objc_retainBlock(v119);

    id v55 = v120;
  }

LABEL_50:
  long long v58 = objc_msgSend(v12, "dataToEncrypt", v70, v73, v75);

  if (v58)
  {
    if (v109)
    {
      id v59 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v133 = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Attempt to send both DataToEncrypt and Data, dropping data", v133, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    uint64_t v60 = [v12 dataToEncrypt];

    id v109 = (id)v60;
  }
  uint64_t v61 = [(IDSDAccount *)v107 utunDeliveryController];
  id v62 = [v12 resourcePath];
  id v63 = [v12 resourceMetadata];
  id v93 = [v12 priority];
  unsigned __int8 v92 = [v12 nonWaking];
  unsigned __int8 v91 = [v12 nonCloudWaking];
  unsigned __int8 v90 = [v12 requireBluetooth];
  unsigned __int8 v89 = [v12 requireLocalWiFi];
  id v64 = [v12 queueOneIdentifier];
  id v65 = [v12 expirationDate];
  unsigned __int8 v88 = [v12 enforceRemoteTimeouts];
  unsigned __int8 v87 = [v12 expectsPeerResponse];
  unsigned __int8 v86 = [v12 wantsAppAck];
  unsigned __int8 v85 = [v12 compressPayload];
  unsigned __int8 v84 = [v12 compressed];
  id v102 = [v12 peerResponseIdentifier];
  CFStringRef v104 = [v12 identifier];
  unsigned __int8 v103 = [v12 command];
  CFStringRef v101 = [v12 fromID];
  CFStringRef v100 = [v12 localDestinationDeviceUUID];
  unsigned __int8 v83 = [v12 bypassDuet];
  CFStringRef v99 = [v12 duetIdentifiersOverride];
  uint64_t v66 = [v12 messageType];
  id v82 = [v66 longLongValue];
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_100301710;
  void v110[3] = &unk_100988950;
  id v80 = v12;
  id v111 = v80;
  id v67 = v21;
  id v112 = v67;
  id v81 = v96;
  id v113 = v81;
  id v97 = v95;
  id v114 = v97;
  uint64_t v115 = v107;
  CFStringRef v117 = buf;
  id v118 = v132;
  id v68 = v98;
  id v116 = v68;
  LOBYTE(v79) = v83;
  BYTE4(v77) = v84;
  BYTE3(v77) = v85;
  BYTE2(v77) = v86;
  BYTE1(v77) = v87;
  LOBYTE(v77) = v88;
  HIBYTE(v71) = v89;
  BYTE6(v71) = v90;
  BYTE5(v71) = v91;
  BYTE4(v71) = v92;
  LODWORD(v71) = v94;
  objc_msgSend(v61, "sendData:service:protobuf:resourcePath:resourceMetadata:priority:dataProtectionClass:nonWaking:nonCloudWaking:requireBluetooth:requireLocalWiFi:queueOneIdentifier:expirationDate:enforceRemoteTimeouts:expectsPeerResponse:wantsAppAck:compressPayload:compressed:peerResponseIdentifier:messageID:topic:awdTopic:command:fromID:uriToDeviceID:localDeviceDestinationDeviceUUID:bypassDuet:duetIdentifiersOverride:messageType:fallbackBlock:progressBlock:completionBlock:", v109, v106, v105, v62, v63, v93, v71, v64, v65, v77, v102, v104, v67, v23,
    v103,
    v101,
    v108,
    v100,
    v79,
    v99,
    v82,
    v57,
    0,
    v110);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v132, 8);
}

- (void)_sendRemotelyWithSendParameters:(id)a3 data:(id)a4 protobuf:(id)a5 willSendBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v228 = a4;
  id v227 = a5;
  id v230 = a6;
  id v232 = (void (**)(id, id))a7;
  unsigned __int8 v234 = [(IDSDAccount *)self service];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v258 = _os_activity_create((void *)&_mh_execute_header, "IDSAccount send remotely", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v258, &state);
  long long v229 = [v234 dataUsageBundleID];
  id v13 = [v234 identifier];
  unsigned int v233 = +[NSString stringWithFormat:@"service-disable-%@", v13];

  if (v233)
  {
    id v14 = +[IDSServerBag sharedInstanceForBagType:1];
    id v15 = [v14 objectForKey:v233];

    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }
  id v226 = v16;
  if ((int)[v16 intValue] < 1)
  {
    id v18 = [v12 fromID];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      id v34 = objc_alloc((Class)NSError);
      id v223 = [v34 initWithDomain:IDSSendErrorDomain code:7 userInfo:0];
      uint64_t v35 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = [v12 destinations];
        id v37 = [v12 fromID];
        *(_DWORD *)buf = 138412546;
        *(void *)id v260 = v36;
        *(_WORD *)&v260[8] = 2112;
        id v261 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failing message to: %@   from: %@    invalid caller ID", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v38 = [v12 destinations];
        CFStringRef v176 = [v12 fromID];
        _IDSWarnV();

        id v39 = objc_msgSend(v12, "destinations", v38, v176);
        CFStringRef v177 = [v12 fromID];
        _IDSLogV();

        id v40 = objc_msgSend(v12, "destinations", v39, v177);
        CFStringRef v178 = [v12 fromID];
        _IDSLogTransport();
      }
      if (!v232) {
        goto LABEL_237;
      }
      id v41 = (__CFDictionary *)[objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:7 error:v223 lastCall:1];
      v232[2](v232, v41);
LABEL_236:

LABEL_237:
      goto LABEL_238;
    }
    unsigned int v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v12 messageUUID];
      JWUUIDPushObjectToString();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = [v234 identifier];
      *(_DWORD *)buf = 138412546;
      *(void *)id v260 = v22;
      *(_WORD *)&v260[8] = 2112;
      id v261 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "OUTGOING-REMOTE_SEND:%@ SERVICE:%@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v24 = [v12 messageUUID];
      id v25 = JWUUIDPushObjectToString();
      [v234 identifier];
      v174 = CFStringRef v168 = v25;
      _IDSLogV();
    }
    if (![(IDSDAccount *)self accountType]) {
      goto LABEL_19;
    }
    __int16 v26 = _IDSCopyMyPhoneNumbers();
    id v27 = [v12 fromID];
    CFStringRef v28 = [v27 _stripFZIDPrefix];
    unsigned int v29 = [v26 containsObject:v28];

    if (v29)
    {
LABEL_19:
      ct_green_tea_logger_create_static();
      uint64_t v30 = getCTGreenTeaOsLogHandle();
      id v31 = v30;
      if (v30)
      {
        CFStringRef v32 = v30;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Transmitting phone number", buf, 2u);
        }
      }
    }
    id v223 = [v12 destinations];
    theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v33 = [v12 command];
    if (v33)
    {
      CFDictionarySetValue(theDict, IDSCommandKey, v33);
    }
    else
    {
      id v42 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071E8AC();
      }
    }
    unsigned int v43 = [v12 commandContext];
    if (v43) {
      CFDictionarySetValue(theDict, IDSCommandContextKey, v43);
    }

    uint64_t v44 = [v12 queueOneIdentifier];
    if (v44) {
      CFDictionarySetValue(theDict, IDSStorageQueueOneIdentifier, v44);
    }

    id v45 = [v12 command];
    if ([v45 integerValue] != (id)227)
    {
      CFStringRef v46 = [v12 command];
      if ([v46 integerValue] != (id)243)
      {
        id v47 = [v12 command];
        if ([v47 integerValue] != (id)242)
        {
          unsigned __int8 v84 = [v12 command];
          BOOL v85 = [v84 integerValue] == (id)250;

          if (!v85) {
            goto LABEL_78;
          }
          goto LABEL_45;
        }
      }
    }

LABEL_45:
    if ([v12 priority] == (id)300
      && ([v12 wantsResponse] & 1) == 0
      && ([v12 fireAndForget] & 1) == 0)
    {
      unsigned int v48 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Urgent priority messages should require a response for reliability", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      [v12 setWantsResponse:1];
    }
    uint64_t v49 = [v12 expirationDate];
    BOOL v50 = v49;
    if (v49)
    {
      [v49 timeIntervalSinceNow];
      if (v51 < 5.0) {
        [v12 setFireAndForget:1];
      }
    }
    if ([v12 wantsResponse] && objc_msgSend(v12, "fireAndForget"))
    {
      CFStringRef v52 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Messages that want a response should not be fireAndForget", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      [v12 setFireAndForget:0];
    }
    if (([v12 wantsResponse] & 1) == 0)
    {
      unsigned int v53 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Disabling IDS-level ack for this message", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      uint64_t v54 = +[NSNumber numberWithInteger:0];
      if (v54)
      {
        CFDictionarySetValue(theDict, @"ack", v54);
      }
      else
      {
        id v55 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071E824();
        }
      }
    }

LABEL_78:
    CFStringRef v56 = [v12 messageUUID];
    BOOL v57 = v56 == 0;

    if (v57)
    {
      long long v58 = +[NSString stringGUID];
      id v59 = IDSGetUUIDData();
      [v12 setMessageUUID:v59];
    }
    if ([v12 wantsDeliveryStatus])
    {
      CFDictionarySetValue(theDict, IDSWantsDeliveryStatusKey, &__kCFBooleanTrue);
      uint64_t v60 = [v12 deliveryStatusContext];
      if (v60) {
        CFDictionarySetValue(theDict, IDSDeliveryStatusContextKey, v60);
      }
    }
    if ([v12 wantsCertifiedDelivery])
    {
      uint64_t v61 = +[NSNumber numberWithInteger:_IDSCertifiedDeliveryVersion()];
      if (v61)
      {
        CFDictionarySetValue(theDict, IDSCertifiedDeliveryVersionKey, v61);
      }
      else
      {
        id v62 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071E798();
        }
      }
    }
    if ([v12 expectsPeerResponse]) {
      CFDictionarySetValue(theDict, IDSExpectsPeerResponseKey, &__kCFBooleanTrue);
    }
    id v63 = [v12 peerResponseIdentifier];

    if (v63)
    {
      id v64 = [v12 peerResponseIdentifier];
      id v65 = IDSGetUUIDData();

      if (v65) {
        CFDictionarySetValue(theDict, IDSPeerResponseIdentifierKey, v65);
      }
    }
    if ([v12 wantsAppAck]) {
      CFDictionarySetValue(theDict, IDSWantsAppAckKey, &__kCFBooleanTrue);
    }
    uint64_t v66 = [v12 originalTimestamp];

    if (v66)
    {
      id v67 = [v12 originalTimestamp];
      if (v67) {
        CFDictionarySetValue(theDict, IDSOriginalTimestampKey, v67);
      }
    }
    if ([v12 isUPlusOne])
    {
      id v68 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isUPlusOne]);
      if (v68) {
        CFDictionarySetValue(theDict, IDSIsUPlusOneKey, v68);
      }
    }
    uint64_t v69 = [v12 isInitiator];

    if (v69)
    {
      int v70 = [v12 isInitiator];
      if (v70) {
        CFDictionarySetValue(theDict, IDSGroupSessionIsInitiatorKey, v70);
      }
    }
    uint64_t v71 = [v12 quickRelayUserType];

    if (v71)
    {
      uint64_t v72 = [v12 quickRelayUserType];
      if (v72) {
        CFDictionarySetValue(theDict, IDSQuickRelayUserTypeKey, v72);
      }
    }
    if ([v12 useDictAsTopLevel])
    {
      id v73 = [v12 message];
      v255[0] = _NSConcreteStackBlock;
      v255[1] = 3221225472;
      v255[2] = sub_10030443C;
      v255[3] = &unk_100980928;
      id v256 = theDict;
      [v73 enumerateKeysAndObjectsUsingBlock:v255];

      id v217 = 0;
      id v74 = v256;
    }
    else
    {
      uint64_t v75 = [v12 bulkedPayload];

      if (v75)
      {
        id v76 = [v12 message];
        id v77 = [v76 count];

        [v12 bulkedPayload];
        if (v77) {
          id v78 = {;
        }
          id v79 = [v78 mutableCopy];

          id v80 = [v12 message];
          [v79 addObject:v80];

          id v74 = v79;
        }
        else
        {
          id v74 = (id)objc_claimAutoreleasedReturnValue();
        }
        unsigned __int8 v86 = JWEncodeArray();
        id v87 = [v86 length];
        if ([v12 compressPayload])
        {
          id v217 = [v86 _FTCopyOptionallyGzippedData];
          id v88 = [v217 length];
          if (v87 > v88)
          {
            unsigned __int8 v89 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)id v260 = v87;
              *(_WORD *)&v260[4] = 1024;
              *(_DWORD *)&v260[6] = v88;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Compressed IDS bulked payload data from:%u  to:%u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v169 = v87;
              v175 = v88;
              _IDSLogV();
            }
            id v217 = v217;

            unsigned __int8 v86 = v217;
          }
        }
        else
        {
          id v217 = 0;
        }
        if ((objc_msgSend(v12, "encryptPayload", v169, v175) & 1) != 0
          || ([v12 dataToEncrypt],
              unsigned __int8 v90 = objc_claimAutoreleasedReturnValue(),
              BOOL v91 = v90 == 0,
              v90,
              !v91))
        {
          unsigned __int8 v92 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "Cannot use encryption with bulked payloads!", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            _IDSWarnV();
            _IDSLogV();
            _IDSLogTransport();
          }
        }
        id v93 = v86;
        if (v93) {
          CFDictionarySetValue(theDict, IDSBulkedPayloadKey, v93);
        }

        CFDictionarySetValue(theDict, IDSIsBulkedPayloadKey, &__kCFBooleanTrue);
      }
      else
      {
        id v74 = v228;
        id v81 = [v12 protobuf];

        if (v81)
        {
          if ([v12 compressed])
          {
            id v82 = [v227 dictionaryRepresentationWithUncompressedData];
            unsigned __int8 v83 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "Local protobuf data is compresed, use uncompressed protobuf data for remote delivery", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
          else
          {
            id v82 = [v227 dictionaryRepresentation];
          }
          unsigned int v94 = JWEncodeDictionary();

          id v95 = [v94 length];
          if ([v12 compressPayload])
          {
            id v217 = [v94 _FTCopyOptionallyGzippedData];
            id v96 = [v217 length];
            if (v95 > v96)
            {
              id v97 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)id v260 = v95;
                *(_WORD *)&v260[4] = 1024;
                *(_DWORD *)&v260[6] = v96;
                _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Compressed protobuf serialized data from: %u  to: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v169 = v95;
                v175 = v96;
                _IDSLogV();
              }
              id v217 = v217;

              unsigned int v94 = v217;
            }
          }
          else
          {
            id v217 = 0;
          }

          id v74 = v94;
        }
        else
        {
          id v217 = 0;
        }
        if (objc_msgSend(v12, "encryptPayload", v169, v175))
        {
          id v98 = [v12 dataToEncrypt];

          if (v98)
          {
            CFStringRef v99 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Using incompatible combination of wantsEncryptedPayload and dataToEncrypt!", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              _IDSLogTransport();
            }
          }
          CFStringRef v100 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEBUG, "Setting IDS payload to be encrypted.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          [v12 setDataToEncrypt:v74];
        }
        else
        {
          CFStringRef v101 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v102 = [v74 length];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)id v260 = v102;
            _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Setting IDS payload with size: %u", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v169 = [v74 length];
            _IDSLogV();
          }
          id v74 = v74;
          if (v74) {
            CFDictionarySetValue(theDict, IDSPayloadKey, v74);
          }
        }
      }
    }

    if ([v12 homeKitPayload])
    {
      id v221 = [v12 fromID];
    }
    else
    {
      unsigned __int8 v103 = [v12 fromID];
      id v221 = [v103 _bestGuessURI];
    }
    id v222 = [(IDSDAccount *)self _registrationCert];
    CFStringRef v104 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
    {
      registrationInfo = self->_registrationInfo;
      id v106 = [(IDSRegistration *)registrationInfo uris];
      *(_DWORD *)buf = 138412802;
      *(void *)id v260 = registrationInfo;
      *(_WORD *)&v260[8] = 2112;
      id v261 = v106;
      __int16 v262 = 2112;
      id v263 = v222;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEBUG, "Registration %@   URIs %@  callerCert %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v107 = self->_registrationInfo;
      v175 = [(IDSRegistration *)v107 uris];
      CFStringRef v182 = v222;
      CFStringRef v170 = v107;
      _IDSLogV();
    }
    id v108 = [(IDSDAccount *)self service];
    id v224 = [v108 pushTopic];

    id v109 = [(IDSDAccount *)self service];
    id v220 = [v109 identifier];

    CFStringRef v110 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      id v111 = [v12 command];
      *(_DWORD *)buf = 138412290;
      *(void *)id v260 = v111;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "!setState command=%@", buf, 0xCu);
    }
    id v112 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      id v113 = [v12 destinations];
      *(_DWORD *)buf = 138412290;
      *(void *)id v260 = v113;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "!setState destinations=%@", buf, 0xCu);
    }
    id v114 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      id v115 = [v12 command];
      id v116 = [v12 messageUUID];
      JWUUIDPushObjectToString();
      id v117 = (id)objc_claimAutoreleasedReturnValue();
      id v118 = [v12 destinations];
      id v119 = [v12 destinations];
      *(_DWORD *)buf = 138413314;
      *(void *)id v260 = v115;
      *(_WORD *)&v260[8] = 2112;
      id v261 = v117;
      __int16 v262 = 2112;
      id v263 = v118;
      __int16 v264 = 2112;
      id v265 = v119;
      __int16 v266 = 2112;
      v267 = v224;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Sending message (c = %@) %@ to filteredDestinations %@ (originally %@) for topic %@", buf, 0x34u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v120 = [v12 command];
      id v121 = [v12 messageUUID];
      id v122 = JWUUIDPushObjectToString();
      id v123 = [v12 destinations];
      CFStringRef v185 = [v12 destinations];
      id v187 = v224;
      CFStringRef v179 = v122;
      CFStringRef v183 = v123;
      __int16 v171 = v120;
      _IDSLogV();
    }
    id v124 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      id v125 = [v12 messageUUID];
      JWUUIDPushObjectToString();
      id v126 = (id)objc_claimAutoreleasedReturnValue();
      id v127 = [v12 finalDestinationURIs];
      IMLoggingStringForArray();
      id v128 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)id v260 = v126;
      *(_WORD *)&v260[8] = 2112;
      id v261 = v128;
      __int16 v262 = 2112;
      id v263 = v224;
      _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "Sending message ID (%@) using push to %@ for topic %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v129 = [v12 messageUUID];
        id v130 = JWUUIDPushObjectToString();
        uint64_t v131 = [v12 finalDestinationURIs];
        CFStringRef v179 = IMLoggingStringForArray();
        CFStringRef v183 = v224;
        __int16 v171 = v130;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v132 = objc_msgSend(v12, "messageUUID", v130, v179, v224);
          id v133 = JWUUIDPushObjectToString();
          CFStringRef v134 = [v12 finalDestinationURIs];
          CFStringRef v179 = IMLoggingStringForArray();
          CFStringRef v183 = v224;
          __int16 v171 = v133;
          _IDSLogV();
        }
      }
    }
    if (v230)
    {
      v253[0] = _NSConcreteStackBlock;
      v253[1] = 3221225472;
      v253[2] = sub_100304448;
      v253[3] = &unk_100980188;
      id v254 = v230;
      id v219 = objc_retainBlock(v253);
    }
    else
    {
      id v219 = 0;
    }
    __int16 v135 = objc_msgSend(v12, "interestingRegistrationProperties", v171, v179, v183, v185, v187);
    if (v135
      || ([v12 requireAllRegistrationProperties],
          (__int16 v135 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      CFStringRef v166 = [v12 requireLackOfRegistrationProperties];
      BOOL v167 = v166 == 0;

      if (v167)
      {
        id v225 = 0;
LABEL_216:
        if (v232)
        {
          v251[0] = _NSConcreteStackBlock;
          v251[1] = 3221225472;
          v251[2] = sub_100304458;
          v251[3] = &unk_100988978;
          uint64_t v252 = v232;
          v218 = objc_retainBlock(v251);
        }
        else
        {
          v218 = 0;
        }
        id v145 = objc_msgSend(v12, "resourcePath", v172, v180, v184);

        if (v145)
        {
          long long v146 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "Attempt to send a file transfer over IDS to a remote destination over File Transfer API. Only MMCS transfer is avaible at this time, uploading file", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          CFDictionarySetValue(theDict, IDSCommandKey, &off_1009D1D10);
          long long v147 = -[IDSDaemon _IMTransferServiceController]_0();
          long long v148 = [v12 resourcePath];
          long long v149 = +[NSString stringGUID];
          v239[0] = _NSConcreteStackBlock;
          v239[1] = 3221225472;
          v239[2] = sub_100304574;
          v239[3] = &unk_1009889A0;
          id v240 = v12;
          id v241 = theDict;
          id v242 = v220;
          v243 = self;
          id v244 = v221;
          id v245 = v222;
          id v246 = v224;
          v247 = v225;
          v248 = v218;
          char v249 = v219;
          uint64_t v250 = v232;
          [v147 sendFilePath:v148 topic:v242 userInfo:0 transferID:v149 sourceAppID:v229 encryptFile:1 progressBlock:0 completionBlock:v239];

          id v150 = v240;
        }
        else
        {
          if (+[IDSRegistrationCacheStateTransportPolicy shouldQueryUpdateOfParams:v12])
          {
            long long v151 = +[IDSDaemon sharedInstance];
            long long v152 = [v151 queryUpdateNotifier];
            id v153 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v221];
            id v154 = [v152 devicesHashForURI:v153 andService:v234];

            if (v154)
            {
              id v155 = v154;
              CFDictionarySetValue(theDict, @"qH", v155);

              __int16 v156 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
              {
                id v157 = [v155 debugDescription];
                *(_DWORD *)buf = 138412802;
                *(void *)id v260 = v157;
                *(_WORD *)&v260[8] = 2112;
                id v261 = v221;
                __int16 v262 = 2112;
                id v263 = v234;
                _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "Added query update hash {hash: %@, fromURI: %@, service: %@}", buf, 0x20u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                [v155 debugDescription];
                CFStringRef v173 = HIDWORD(v181) = HIDWORD(v221);
                _IDSLogV();
              }
            }
          }
          __int16 v158 = (void *)voucher_copy();
          long long v159 = +[IDSDeliveryController sharedInstance];
          __int16 v160 = [v12 messageUUID];
          unint64_t v213 = JWUUIDPushObjectToString();
          int64_t v212 = [v12 dataToEncrypt];
          v211 = [v12 encryptionAttributes];
          unsigned int v203 = [v12 wantsResponse];
          v210 = [v12 expirationDate];
          unsigned __int8 v202 = [v12 enforceRemoteTimeouts];
          v216 = [(IDSDAccount *)self service];
          unsigned __int8 v201 = [v216 canUseLargePayload];
          id v215 = [(IDSDAccount *)self service];
          unsigned __int8 v200 = [v215 sendOnePerToken];
          id v214 = [(IDSDAccount *)self service];
          unsigned __int8 v199 = [v214 allowPartialSendsToSucceed];
          id v198 = [v12 priority];
          unsigned __int8 v197 = [v12 fireAndForget];
          id v209 = [v12 fromShortHandle];
          v208 = [v12 finalDestinationURIs];
          uint64_t v207 = [v12 accessToken];
          unsigned __int8 v196 = [v12 fakeMessage];
          unsigned __int8 v195 = [v12 alwaysSkipSelf];
          unsigned __int8 v194 = [v12 alwaysIncludeSelf];
          id v193 = [v12 forceQuery];
          id v206 = [v12 pushPriority];
          unsigned __int8 v192 = [v12 ignoreMaxRetryCount];
          unsigned __int8 v191 = [v12 disallowRefresh];
          id v205 = [v12 originalTimestamp];
          id v204 = [v12 prioritizedTokenList];
          unsigned __int8 v161 = [v12 wantsFirewallDonation];
          id v162 = [v12 deliveryMinimumTimeDelay];
          CFStringRef v163 = [v12 deliveryMinimumTime];
          CFStringRef v164 = [v12 sendMode];
          CFStringRef v165 = [v12 keyTransparencyURIVerificationMap];
          v235[0] = _NSConcreteStackBlock;
          v235[1] = 3221225472;
          v235[2] = sub_100304FBC;
          v235[3] = &unk_1009856A0;
          id v236 = v12;
          id v150 = v158;
          id v237 = v150;
          id v238 = v232;
          LOBYTE(v190) = v161;
          BYTE1(v189) = v191;
          LOBYTE(v189) = v192;
          BYTE2(v188) = v194;
          BYTE1(v188) = v195;
          LOBYTE(v188) = v196;
          LOBYTE(v186) = v197;
          BYTE3(v181) = v199;
          BYTE2(v181) = v200;
          BYTE1(v181) = v201;
          LOBYTE(v181) = v202;
          objc_msgSend(v159, "sendMessageDictionary:messageID:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:expirationDate:enforceRemoteTimeouts:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:priority:fireAndForget:fromID:fromShortHandle:fromIdentity:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:", theDict, v213, v212, v211, v220, v203, v210, v181, v198, v186, v221, v209,
            v222,
            v208,
            v207,
            v224,
            v225,
            v188,
            v193,
            v206,
            v189,
            v205,
            v204,
            v190,
            v223,
            v162,
            v163,
            v164,
            v165,
            v218,
            v219,
            v235);
        }
        id v41 = theDict;
        goto LABEL_236;
      }
    }
    id v225 = objc_alloc_init(IDSRegistrationProperties);
    CFStringRef v136 = [v12 requireAllRegistrationProperties];
    [(IDSRegistrationProperties *)v225 setRequireAll:v136];

    __int16 v137 = [v12 requireLackOfRegistrationProperties];
    [(IDSRegistrationProperties *)v225 setLackAll:v137];

    if (v230)
    {
      uint64_t v138 = [v12 interestingRegistrationProperties];
      [(IDSRegistrationProperties *)v225 setInteresting:v138];
    }
    id v139 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
    {
      id v140 = [(IDSRegistrationProperties *)v225 requireAll];
      id v141 = [(IDSRegistrationProperties *)v225 lackAll];
      id v142 = [(IDSRegistrationProperties *)v225 interesting];
      *(_DWORD *)buf = 138412802;
      *(void *)id v260 = v140;
      *(_WORD *)&v260[8] = 2112;
      id v261 = v141;
      __int16 v262 = 2112;
      id v263 = v142;
      _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "This send requires %@, a lack of %@, and is interested in %@ registration properties", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v143 = [(IDSRegistrationProperties *)v225 requireAll];
      char v144 = [(IDSRegistrationProperties *)v225 lackAll];
      [(IDSRegistrationProperties *)v225 interesting];
      v184 = CFStringRef v180 = v144;
      CFStringRef v172 = v143;
      _IDSLogV();
    }
    goto LABEL_216;
  }
  id v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)id v260 = v234;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Server has disabled service: %@, dropping this on the floor", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  IMLogBacktrace();
LABEL_238:

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_rapportSendWithSendParameters:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 protobuf];
  if (v8)
  {
  }
  else
  {
    id v9 = [v6 data];

    if (!v9)
    {
      id v12 = [v6 message];
      id v13 = [v6 identifier];
      id v14 = [(IDSDAccount *)self service];
      id v15 = [v14 pushTopic];

      id v16 = [v6 command];
      id v17 = [v6 finalDestinationURIs];
      id v18 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_1009889C0);

      BOOL v19 = +[IDSRapportDeliveryController sharedInstance];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100305500;
      v20[3] = &unk_1009828A0;
      id v21 = v7;
      [v19 sendMessage:v12 messageID:v13 topic:v15 command:v16 destinationIDs:v18 completionBlock:v20];

      goto LABEL_7;
    }
  }
  uint64_t v10 = IDSSendErrorDomain;
  NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
  CFStringRef v23 = @"IDS doesn't support sending protobuf or data to rapport destinations";
  id v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v12 = +[NSError errorWithDomain:v10 code:23 userInfo:v11];

  id v13 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:23 error:v12 lastCall:1];
  if (v7) {
    (*((void (**)(id, id))v7 + 2))(v7, v13);
  }
LABEL_7:
}

- (void)sendMessageWithSendParameters:(id)a3 willSendBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v230 = a4;
  id v232 = a5;
  im_assert_primary_base_queue();
  unsigned int v233 = self;
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if ([(IDSDAccount *)self accountType] == 2)
    {
      id v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending via account that's type Local -- forcing local delivery.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      [v8 setLocalDelivery:1];
    }
    uint64_t v10 = [v8 destinations];
    id v11 = [v10 destinationURIs];
    id v12 = [v11 allObjects];
    v234[0] = _NSConcreteStackBlock;
    v234[1] = 3221225472;
    v234[2] = sub_10030767C;
    v234[3] = &unk_10097E990;
    v234[4] = self;
    id v226 = objc_msgSend(v12, "__imArrayByApplyingBlock:", v234);

    id v13 = [(IDSDAccount *)self service];
    LODWORD(v11) = [v13 useiMessageCallerID];

    if (!v11)
    {
LABEL_33:
      id v37 = [v8 fromID];
      BOOL v38 = v37 == 0;

      if (v38)
      {
        id v39 = [(IDSDAccount *)v233 primaryRegistration];
        id v40 = [v39 dsHandle];
        id v41 = [v40 _stripFZIDPrefix];

        id v42 = [(IDSDAccount *)v233 service];
        [v42 shouldRegisterUsingDSHandle];

        unsigned int v43 = [(IDSDAccount *)v233 service];
        uint64_t v44 = [v43 identifier];
        _IDSPrefersPhoneNumbersForServiceIdentifier();

        id v45 = [(IDSDAccount *)v233 unprefixedURIStringsFromRegistration];
        CFStringRef v46 = (void *)_IDSCopyCallerID();
        [v8 setFromID:v46];
      }
      long long v231 = [v8 data];
      id v47 = [v8 protobuf];

      if (v47)
      {
        id v48 = objc_alloc((Class)IDSProtobuf);
        uint64_t v49 = [v8 protobuf];
        id v229 = [v48 initWithDictionary:v49];
      }
      else
      {
        id v229 = 0;
      }
      BOOL v50 = [v8 message];

      if (v50)
      {
        double v51 = [v8 message];
        CFStringRef v52 = [v51 objectForKey:IDSMessageResourceTransferURLKey];
        if (v52)
        {

          unsigned int v53 = [v51 objectForKeyedSubscript:IDSMessageResourceTransferMetadataKey];
          uint64_t v54 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)id v236 = v52;
            *(_WORD *)&v236[8] = 2112;
            id v237 = v53;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Sending Resource at path %@ with metadata %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v142 = v52;
            os_log_t v146 = v53;
            _IDSLogV();
          }
          objc_msgSend(v8, "setResourcePath:", v52, v142, v146);
          [v8 setResourceMetadata:v53];
          long long v231 = 0;
        }
        else
        {
          JWEncodeDictionary();
          unsigned int v53 = (id)objc_claimAutoreleasedReturnValue();

          long long v231 = v53;
        }
      }
      if (!v231)
      {
        if (!v229)
        {
          id v227 = 0;
          long long v231 = 0;
          id v66 = [0 length];
          goto LABEL_82;
        }
        id v59 = [v229 data];
        id v60 = [v59 length];

        if ([v8 compressPayload])
        {
          uint64_t v61 = [v229 data];
          id v227 = [v61 _FTCopyOptionallyGzippedData];

          id v62 = [v227 length];
          if (v60 > v62)
          {
            id v63 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)id v236 = v60;
              *(_WORD *)&v236[4] = 1024;
              *(_DWORD *)&v236[6] = v62;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Compressed protobuf data from: %u  to: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v142 = v60;
              os_log_t v146 = v62;
              _IDSLogV();
            }
            id v64 = objc_msgSend(v229, "data", v142, v146);
            [v229 setUncompressedData:v64];

            [v229 setData:v227];
            long long v231 = 0;
            uint64_t v58 = 1;
            goto LABEL_81;
          }
        }
        else
        {
          id v62 = 0;
          id v227 = 0;
        }
        id v67 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)id v236 = v60;
          *(_WORD *)&v236[4] = 1024;
          *(_DWORD *)&v236[6] = v62;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Use uncompressed protobuf data (original: %u compressed: %u)", buf, 0xEu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v142 = v60;
          os_log_t v146 = v62;
          _IDSLogV();
        }
        uint64_t v58 = 0;
        long long v231 = 0;
        goto LABEL_81;
      }
      id v55 = [v231 length];
      if ([v8 compressPayload])
      {
        id v227 = [v231 _FTCopyOptionallyGzippedData];
        CFStringRef v56 = [v227 length];
        if (v55 > v56)
        {
          BOOL v57 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)id v236 = v55;
            *(_WORD *)&v236[4] = 1024;
            *(_DWORD *)&v236[6] = v56;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Compressed message data from: %u  to: %u", buf, 0xEu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v142 = v55;
            os_log_t v146 = v56;
            _IDSLogV();
          }
          id v227 = v227;

          uint64_t v58 = 1;
          long long v231 = v227;
LABEL_81:
          objc_msgSend(v8, "setCompressed:", v58, v142, v146);
          id v66 = [v231 length];
LABEL_82:
          id v68 = v66;
          uint64_t v69 = [v229 data];
          id v70 = [v69 length];

          uint64_t v71 = [v8 message];

          unint64_t v228 = (unint64_t)v68 + (void)v70;
          if (!v71)
          {
            id v74 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              id v217 = [v8 bulkedPayload];
              id v220 = [v8 fromID];
              os_log_t loga = [v8 destinations];
              CFStringRef v75 = @"NO";
              if ([v8 useDictAsTopLevel]) {
                CFStringRef v76 = @"YES";
              }
              else {
                CFStringRef v76 = @"NO";
              }
              CFStringRef v214 = v76;
              if ([v8 encryptPayload]) {
                CFStringRef v77 = @"YES";
              }
              else {
                CFStringRef v77 = @"NO";
              }
              CFStringRef v212 = v77;
              if ([v8 wantsResponse]) {
                CFStringRef v78 = @"YES";
              }
              else {
                CFStringRef v78 = @"NO";
              }
              CFStringRef v209 = v78;
              [v8 timeout];
              id v80 = v79;
              id v81 = [v8 command];
              if ([v8 wantsDeliveryStatus]) {
                CFStringRef v82 = @"YES";
              }
              else {
                CFStringRef v82 = @"NO";
              }
              if ([v8 wantsCertifiedDelivery]) {
                CFStringRef v83 = @"YES";
              }
              else {
                CFStringRef v83 = @"NO";
              }
              unsigned __int8 v84 = [v8 deliveryStatusContext];
              id v85 = [v8 messageUUID];
              if ([v8 priority] == (id)300)
              {
                CFStringRef v86 = @"URGENT";
              }
              else if ([v8 priority] == (id)200)
              {
                CFStringRef v86 = @"Default";
              }
              else
              {
                CFStringRef v86 = @"Sync";
              }
              if ([v8 localDelivery]) {
                CFStringRef v75 = @"YES";
              }
              id v87 = (__CFString *)objc_retainBlock(v232);
              *(_DWORD *)buf = 134221826;
              *(void *)id v236 = v228;
              *(_WORD *)&v236[8] = 2112;
              id v237 = v217;
              __int16 v238 = 2112;
              id v239 = v220;
              __int16 v240 = 2112;
              os_log_t v241 = loga;
              __int16 v242 = 2112;
              CFStringRef v243 = v214;
              __int16 v244 = 2112;
              CFStringRef v245 = v212;
              __int16 v246 = 2112;
              CFStringRef v247 = v209;
              __int16 v248 = 2048;
              id v249 = v80;
              __int16 v250 = 2112;
              id v251 = v81;
              __int16 v252 = 2112;
              CFStringRef v253 = v82;
              __int16 v254 = 2112;
              CFStringRef v255 = v83;
              __int16 v256 = 2112;
              CFStringRef v257 = v84;
              __int16 v258 = 2112;
              id v259 = v85;
              __int16 v260 = 2112;
              CFStringRef v261 = v86;
              __int16 v262 = 2112;
              CFStringRef v263 = v75;
              __int16 v264 = 2048;
              CFStringRef v265 = v87;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "sendMessage of size %lu  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p", buf, 0xA2u);
            }
            if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
            {
LABEL_202:
              unsigned __int8 v125 = objc_msgSend(v8, "bypassSizeCheck", v142, v146, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167,
                                        v168,
                                        v169,
                                        v170,
                                        v171);
              if (v228 <= 0x500000) {
                char v126 = 1;
              }
              else {
                char v126 = v125;
              }
              if (v126)
              {
                if (([v8 bypassSizeCheck] & 1) != 0
                  || [v8 priority] != (id)300
                  || v228 <= 0x100000)
                {
                  [(IDSDAccount *)v233 _sendMessageWithSendParametersOnMainThread:v8 filteredDestinations:v226 data:v231 compressedData:v227 protobufToSend:v229 willSendBlock:v230 completionBlock:v232];
LABEL_214:

                  goto LABEL_215;
                }
                CFStringRef v136 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  __int16 v137 = [(IDSDAccount *)v233 service];
                  uint64_t v138 = [v137 pushTopic];
                  *(_DWORD *)buf = 134218242;
                  *(void *)id v236 = v228;
                  *(_WORD *)&v236[8] = 2112;
                  id v237 = v138;
                  _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "Payload length %lu for topic %@ is too big to send as urgent", buf, 0x16u);
                }
                if (os_log_shim_legacy_logging_enabled())
                {
                  id v139 = [(IDSDAccount *)v233 service];
                  id v150 = [v139 pushTopic];
                  _IDSWarnV();

                  id v140 = [(IDSDAccount *)v233 service];
                  long long v151 = [v140 pushTopic];
                  _IDSLogV();

                  id v141 = [(IDSDAccount *)v233 service];
                  long long v152 = [v141 pushTopic];
                  _IDSLogTransport();
                }
                if (!v232) {
                  goto LABEL_214;
                }
              }
              else
              {
                id v127 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                {
                  id v128 = [(IDSDAccount *)v233 service];
                  uint64_t v129 = [v128 pushTopic];
                  *(_DWORD *)buf = 134218242;
                  *(void *)id v236 = v228;
                  *(_WORD *)&v236[8] = 2112;
                  id v237 = v129;
                  _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Payload length %lu for topic %@ is too big to send.", buf, 0x16u);
                }
                if (os_log_shim_legacy_logging_enabled())
                {
                  id v130 = [(IDSDAccount *)v233 service];
                  long long v147 = [v130 pushTopic];
                  _IDSWarnV();

                  uint64_t v131 = [(IDSDAccount *)v233 service];
                  long long v148 = [v131 pushTopic];
                  _IDSLogV();

                  id v132 = [(IDSDAccount *)v233 service];
                  long long v149 = [v132 pushTopic];
                  _IDSLogTransport();
                }
                if (!v232) {
                  goto LABEL_214;
                }
              }
              id v133 = objc_alloc((Class)NSError);
              id v134 = [v133 initWithDomain:IDSSendErrorDomain code:8 userInfo:0];
              id v135 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:8 error:v134 lastCall:1];
              (*((void (**)(id, id))v232 + 2))(v232, v135);

              goto LABEL_214;
            }
            os_log_t logb = [v8 bulkedPayload];
            unint64_t v213 = [v8 fromID];
            id v221 = [v8 destinations];
            CFStringRef v88 = @"NO";
            if ([v8 useDictAsTopLevel]) {
              CFStringRef v89 = @"YES";
            }
            else {
              CFStringRef v89 = @"NO";
            }
            if ([v8 encryptPayload]) {
              CFStringRef v90 = @"YES";
            }
            else {
              CFStringRef v90 = @"NO";
            }
            if ([v8 wantsResponse]) {
              CFStringRef v91 = @"YES";
            }
            else {
              CFStringRef v91 = @"NO";
            }
            [v8 timeout];
            id v93 = v92;
            v210 = [v8 command];
            if ([v8 wantsDeliveryStatus]) {
              CFStringRef v94 = @"YES";
            }
            else {
              CFStringRef v94 = @"NO";
            }
            if ([v8 wantsCertifiedDelivery]) {
              CFStringRef v95 = @"YES";
            }
            else {
              CFStringRef v95 = @"NO";
            }
            v218 = [v8 deliveryStatusContext];
            uint64_t v207 = [v8 messageUUID];
            if ([v8 priority] == (id)300)
            {
              CFStringRef v96 = @"URGENT";
            }
            else if ([v8 priority] == (id)200)
            {
              CFStringRef v96 = @"Default";
            }
            else
            {
              CFStringRef v96 = @"Sync";
            }
            if ([v8 localDelivery]) {
              CFStringRef v88 = @"YES";
            }
            v216 = (__CFString *)objc_retainBlock(v232);
            CFStringRef v165 = v88;
            CFStringRef v166 = v216;
            CFStringRef v163 = v207;
            CFStringRef v164 = v96;
            CFStringRef v161 = v95;
            CFStringRef v162 = v218;
            long long v159 = v210;
            CFStringRef v160 = v94;
            __int16 v158 = v93;
            CFStringRef v156 = v90;
            CFStringRef v157 = v91;
            id v154 = v221;
            CFStringRef v155 = v89;
            os_log_t v146 = logb;
            id v153 = v213;
            id v142 = (id)v228;
            _IDSLogV();
LABEL_201:

            goto LABEL_202;
          }
          OSLogHandleForIDSCategory();
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
LABEL_160:

            if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
              goto LABEL_202;
            }
            os_log_t logb = [v8 message];
            unint64_t v213 = [logb objectForKey:@"c"];
            uint64_t v110 = objc_opt_class();
            id v221 = [v8 message];
            v210 = sub_100307A10(v110, v221, @"fID");
            uint64_t v111 = objc_opt_class();
            v218 = [v8 message];
            uint64_t v207 = sub_100307A10(v111, v218, @"fT");
            v216 = [v8 message];
            unsigned int v203 = [(__CFString *)v216 objectForKey:@"g"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            if (isKindOfClass)
            {
              unsigned __int8 v201 = [v8 message];
              unsigned __int8 v199 = [v201 objectForKey:@"g"];
              unsigned __int8 v197 = +[NSData _IDSDataFromBase64String:v199];
            }
            else
            {
              unsigned __int8 v201 = [v8 message];
              unsigned __int8 v199 = [v201 objectForKey:@"g"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                char v175 = 0;
                unsigned __int8 v197 = 0;
                goto LABEL_174;
              }
              uint64_t v173 = [v8 message];
              unsigned __int8 v197 = [(id)v173 objectForKey:@"g"];
            }
            char v175 = isKindOfClass ^ 1;
LABEL_174:
            unsigned __int8 v191 = JWUUIDPushObjectToString();
            unsigned __int8 v195 = [v8 message];
            uint64_t v189 = [v195 objectForKey:@"t"];
            uint64_t v112 = objc_opt_class();
            id v193 = [v8 message];
            sub_100307A10(v112, v193, @"tID");
            id v187 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFStringRef v185 = [v8 bulkedPayload];
            CFStringRef v183 = [v8 fromID];
            uint64_t v181 = [v8 destinations];
            CFStringRef v113 = @"YES";
            if ([v8 useDictAsTopLevel]) {
              CFStringRef v114 = @"YES";
            }
            else {
              CFStringRef v114 = @"NO";
            }
            CFStringRef v179 = v114;
            if ([v8 encryptPayload]) {
              CFStringRef v115 = @"YES";
            }
            else {
              CFStringRef v115 = @"NO";
            }
            CFStringRef v177 = v115;
            if ([v8 wantsResponse]) {
              CFStringRef v116 = @"YES";
            }
            else {
              CFStringRef v116 = @"NO";
            }
            [v8 timeout];
            id v118 = v117;
            id v119 = [v8 command];
            if ([v8 wantsDeliveryStatus]) {
              CFStringRef v120 = @"YES";
            }
            else {
              CFStringRef v120 = @"NO";
            }
            if ([v8 wantsCertifiedDelivery]) {
              CFStringRef v121 = @"YES";
            }
            else {
              CFStringRef v121 = @"NO";
            }
            id v122 = [v8 deliveryStatusContext];
            id v123 = [v8 messageUUID];
            if ([v8 priority] == (id)300)
            {
              CFStringRef v124 = @"URGENT";
            }
            else if ([v8 priority] == (id)200)
            {
              CFStringRef v124 = @"Default";
            }
            else
            {
              CFStringRef v124 = @"Sync";
            }
            if (![v8 localDelivery]) {
              CFStringRef v113 = @"NO";
            }
            CFStringRef v170 = v113;
            id v171 = objc_retainBlock(v232);
            CFStringRef v168 = v123;
            CFStringRef v169 = v124;
            CFStringRef v166 = v121;
            BOOL v167 = v122;
            CFStringRef v164 = v119;
            CFStringRef v165 = v120;
            CFStringRef v163 = v118;
            CFStringRef v161 = v177;
            CFStringRef v162 = v116;
            long long v159 = v181;
            CFStringRef v160 = v179;
            CFStringRef v157 = v185;
            __int16 v158 = v183;
            CFStringRef v155 = v189;
            CFStringRef v156 = v187;
            id v153 = v207;
            id v154 = v191;
            id v142 = v213;
            os_log_t v146 = v210;
            _IDSLogV();

            if (v175)
            {
            }
            if (isKindOfClass) {

            }
            goto LABEL_201;
          }
          unsigned __int8 v194 = [v8 message];
          id v211 = [v194 objectForKey:@"c"];
          uint64_t v72 = objc_opt_class();
          unsigned __int8 v192 = [v8 message];
          sub_100307A10(v72, v192, @"fID");
          v208 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v73 = objc_opt_class();
          uint64_t v190 = [v8 message];
          sub_100307A10(v73, v190, @"fT");
          id v206 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v188 = [v8 message];
          uint64_t v186 = [v188 objectForKey:@"g"];
          objc_opt_class();
          int v196 = objc_opt_isKindOfClass();
          if (v196)
          {
            CFStringRef v184 = [v8 message];
            CFStringRef v182 = [v184 objectForKey:@"g"];
            CFStringRef v180 = +[NSData _IDSDataFromBase64String:v182];
          }
          else
          {
            CFStringRef v184 = [v8 message];
            CFStringRef v182 = [v184 objectForKey:@"g"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              LODWORD(v173) = 0;
              CFStringRef v180 = 0;
              goto LABEL_133;
            }
            CFStringRef v172 = [v8 message];
            CFStringRef v180 = [v172 objectForKey:@"g"];
          }
          LODWORD(v173) = v196 ^ 1;
LABEL_133:
          JWUUIDPushObjectToString();
          id v198 = (id)objc_claimAutoreleasedReturnValue();
          CFStringRef v178 = [v8 message];
          id v204 = [v178 objectForKey:@"t"];
          uint64_t v97 = objc_opt_class();
          CFStringRef v176 = [v8 message];
          sub_100307A10(v97, v176, @"tID");
          unsigned __int8 v202 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          id v215 = [v8 bulkedPayload];
          id v219 = [v8 fromID];
          id v222 = [v8 destinations];
          CFStringRef v98 = @"YES";
          if ([v8 useDictAsTopLevel]) {
            CFStringRef v99 = @"YES";
          }
          else {
            CFStringRef v99 = @"NO";
          }
          CFStringRef v174 = v99;
          if ([v8 encryptPayload]) {
            CFStringRef v100 = @"YES";
          }
          else {
            CFStringRef v100 = @"NO";
          }
          if ([v8 wantsResponse]) {
            CFStringRef v101 = @"YES";
          }
          else {
            CFStringRef v101 = @"NO";
          }
          [v8 timeout];
          unsigned __int8 v103 = v102;
          unsigned __int8 v200 = [v8 command];
          if ([v8 wantsDeliveryStatus]) {
            CFStringRef v104 = @"YES";
          }
          else {
            CFStringRef v104 = @"NO";
          }
          if ([v8 wantsCertifiedDelivery]) {
            CFStringRef v105 = @"YES";
          }
          else {
            CFStringRef v105 = @"NO";
          }
          id v106 = [v8 deliveryStatusContext];
          id v107 = [v8 messageUUID];
          if ([v8 priority] == (id)300)
          {
            CFStringRef v108 = @"URGENT";
          }
          else if ([v8 priority] == (id)200)
          {
            CFStringRef v108 = @"Default";
          }
          else
          {
            CFStringRef v108 = @"Sync";
          }
          if (![v8 localDelivery]) {
            CFStringRef v98 = @"NO";
          }
          id v109 = objc_retainBlock(v232);
          *(_DWORD *)buf = 138417410;
          *(void *)id v236 = v211;
          *(_WORD *)&v236[8] = 2112;
          id v237 = v208;
          __int16 v238 = 2112;
          id v239 = v206;
          __int16 v240 = 2112;
          os_log_t v241 = v198;
          __int16 v242 = 2112;
          CFStringRef v243 = v204;
          __int16 v244 = 2112;
          CFStringRef v245 = v202;
          __int16 v246 = 2112;
          CFStringRef v247 = v215;
          __int16 v248 = 2112;
          id v249 = v219;
          __int16 v250 = 2112;
          id v251 = v222;
          __int16 v252 = 2112;
          CFStringRef v253 = v174;
          __int16 v254 = 2112;
          CFStringRef v255 = v100;
          __int16 v256 = 2112;
          CFStringRef v257 = v101;
          __int16 v258 = 2048;
          id v259 = v103;
          __int16 v260 = 2112;
          CFStringRef v261 = v200;
          __int16 v262 = 2112;
          CFStringRef v263 = v104;
          __int16 v264 = 2112;
          CFStringRef v265 = v105;
          __int16 v266 = 2112;
          id v267 = v106;
          __int16 v268 = 2112;
          id v269 = v107;
          __int16 v270 = 2112;
          CFStringRef v271 = v108;
          __int16 v272 = 2112;
          CFStringRef v273 = v98;
          __int16 v274 = 2048;
          id v275 = v109;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "sendMessage { c = %@   fID = %@   fT = %@   g = %@   t = %@   tID = %@ } bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p", buf, 0xD4u);

          if (v173)
          {
          }
          if (v196) {

          }
          goto LABEL_160;
        }
      }
      else
      {
        CFStringRef v56 = 0;
        id v227 = 0;
      }
      id v65 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v236 = v55;
        *(_WORD *)&v236[4] = 1024;
        *(_DWORD *)&v236[6] = v56;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "Use uncompressed message data (original: %u compressed: %u)", buf, 0xEu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v142 = v55;
        os_log_t v146 = v56;
        _IDSLogV();
      }
      uint64_t v58 = 0;
      goto LABEL_81;
    }
    id v14 = [v8 originalfromID];
    BOOL v15 = [v14 length] == 0;

    if (v15)
    {
      id v31 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Service would like to use iMessage callerID for messages", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      CFStringRef v32 = [(IDSDAccount *)self displayName];
      BOOL v19 = [v32 _stripFZIDPrefix];

      id v33 = [(IDSDAccount *)self primaryRegistration];
      id v34 = [v33 dsHandle];
      id v24 = [v34 _stripFZIDPrefix];

      uint64_t v35 = [(IDSDAccount *)self service];
      [v35 shouldRegisterUsingDSHandle];

      id v25 = [(IDSDAccount *)self unprefixedURIStringsFromRegistration];
      __int16 v26 = [(IDSDAccount *)self pseudonyms];
      uint64_t v27 = _IDSCopyCallerIDWithPseudonyms();
    }
    else
    {
      id v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Service would like to use iMessage callerID for messages but provided their own FromID, attempting to use that instead", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      id v17 = [(IDSDAccount *)self primaryRegistration];
      id v18 = [v17 dsHandle];
      BOOL v19 = [v18 _stripFZIDPrefix];

      unsigned int v20 = [(IDSDAccount *)self service];
      [v20 shouldRegisterUsingDSHandle];

      id v21 = [v8 fromID];
      NSErrorUserInfoKey v22 = [(IDSDAccount *)self pseudonymForPseudonymURIString:v21];
      BOOL v23 = v22 == 0;

      if (!v23) {
        goto LABEL_32;
      }
      id v24 = [v8 fromID];
      id v25 = [(IDSDAccount *)v233 unprefixedURIStringsFromRegistration];
      __int16 v26 = [(IDSDAccount *)v233 pseudonyms];
      uint64_t v27 = _IDSCopyCallerIDWithPseudonyms();
    }
    id v36 = (void *)v27;
    [v8 setFromID:v27];

LABEL_32:
    goto LABEL_33;
  }
  CFStringRef v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    unsigned int v29 = [(IDSDAccount *)self uniqueID];
    *(_DWORD *)buf = 138412290;
    *(void *)id v236 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Registration is not active on account %@, ignoring...", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v143 = [(IDSDAccount *)self uniqueID];
    _IDSWarnV();

    char v144 = [(IDSDAccount *)self uniqueID];
    _IDSLogV();

    id v145 = [(IDSDAccount *)self uniqueID];
    _IDSLogTransport();
  }
  if (v232)
  {
    id v30 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:9 error:0 lastCall:1];
    (*((void (**)(id, id))v232 + 2))(v232, v30);
  }
LABEL_215:
}

- (void)sendMessage:(id)a3 params:(id)a4 bulkedPayload:(id)a5 fromID:(id)a6 toDestinations:(id)a7 useDictAsTopLevel:(BOOL)a8 dataToEncrypt:(id)a9 encryptPayload:(BOOL)a10 wantsResponse:(BOOL)a11 expirationDate:(id)a12 command:(id)a13 wantsDeliveryStatus:(BOOL)a14 wantsCertifiedDelivery:(BOOL)a15 deliveryStatusContext:(id)a16 messageUUID:(id)a17 priority:(int64_t)a18 localDelivery:(BOOL)a19 disallowRefresh:(BOOL)a20 willSendBlock:(id)a21 completionBlock:(id)a22
{
  BOOL v41 = a8;
  id v42 = a3;
  id v27 = a4;
  id v28 = a5;
  id v43 = a6;
  id v44 = a7;
  id v29 = a9;
  id v45 = a12;
  id v30 = a13;
  id v31 = a16;
  id v32 = a17;
  id v33 = a21;
  id v46 = a22;
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if (!v27) {
      id v27 = objc_alloc_init((Class)IDSSendParameters);
    }
    [v27 setMessage:v42];
    [v27 setBulkedPayload:v28];
    [v27 setFromID:v43];
    [v27 setDestinations:v44];
    [v27 setUseDictAsTopLevel:v41];
    [v27 setDataToEncrypt:v29];
    [v27 setEncryptPayload:a10];
    [v27 setWantsResponse:a11];
    if (v45)
    {
      [v45 timeIntervalSinceNow];
      objc_msgSend(v27, "setTimeout:");
    }
    [v27 setCommand:v30];
    [v27 setWantsDeliveryStatus:a14];
    [v27 setWantsCertifiedDelivery:a15];
    [v27 setDeliveryStatusContext:v31];
    [v27 setMessageUUID:v32];
    [v27 setPriority:a18];
    [v27 setLocalDelivery:a19];
    [v27 setDisallowRefresh:a20];
    [(IDSDAccount *)self sendMessageWithSendParameters:v27 willSendBlock:v33 completionBlock:v46];
    id v34 = v46;
  }
  else
  {
    uint64_t v35 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = [(IDSDAccount *)self uniqueID];
      *(_DWORD *)buf = 138412290;
      id v48 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Registration is not active on account %@, ignoring...", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      BOOL v38 = [(IDSDAccount *)self uniqueID];
      _IDSWarnV();

      id v39 = [(IDSDAccount *)self uniqueID];
      _IDSLogV();

      id v40 = [(IDSDAccount *)self uniqueID];
      _IDSLogTransport();
    }
    if (v46)
    {
      id v37 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:9 error:0 lastCall:1];
      (*((void (**)(id, id))v46 + 2))(v46, v37);
    }
    id v34 = v46;
  }
}

- (void)decryptMessageData:(id)a3 guid:(id)a4 localURI:(id)a5 remoteURI:(id)a6 pushToken:(id)a7 groupID:(id)a8 encryptionType:(int64_t)a9 isLiveRetry:(BOOL)a10 replayKey:(id)a11 completionBlock:(id)a12
{
  id v56 = a3;
  id v54 = a4;
  id v18 = a5;
  id v57 = a6;
  id v19 = a7;
  id v53 = a8;
  id v55 = a11;
  id v20 = a12;
  id v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v56 length];
    id v23 = objc_retainBlock(v20);
    *(_DWORD *)buf = 134219266;
    id v59 = v22;
    __int16 v60 = 2112;
    id v61 = v18;
    __int16 v62 = 2112;
    id v63 = v57;
    __int16 v64 = 2112;
    id v65 = v19;
    __int16 v66 = 2048;
    int64_t v67 = a9;
    __int16 v68 = 2048;
    id v69 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "decryptMessageData length: %lu   myURI %@   fromURI %@   token %@   encryptionType %ld   completionBlock %p", buf, 0x3Eu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v24 = [v56 length];
    int64_t v49 = a9;
    id v50 = objc_retainBlock(v20);
    id v46 = v57;
    id v47 = v19;
    id v41 = v24;
    id v45 = v18;
    _IDSLogV();
  }
  if ([(IDSDAccount *)self isRegistrationActive])
  {
    if (!v18)
    {
      id v25 = [(IDSDAccount *)self loginID];
      __int16 v26 = [v25 _bestGuessURI];
      id v18 = +[IDSURI URIWithPrefixedURI:v26];
    }
    id v27 = [(IDSDAccount *)self primaryRegistration];
    id v28 = [v27 registrationCert];

    int64_t v29 = a9 - 1;
    if (unint64_t)(a9 - 1) < 6 && ((0x39u >> v29))
    {
      uint64_t v51 = qword_1007949D8[v29];
      id v34 = [IDSCryptionContext alloc];
      CFStringRef v52 = +[IDSPushHandler sharedInstance];
      uint64_t v35 = [v52 pushToken];
      id v36 = +[IDSPushToken pushTokenWithData:v35];
      id v37 = [(IDSDAccount *)self service];
      BOOL v38 = [v37 identifier];
      id v32 = [(IDSCryptionContext *)v34 initWithGuid:v54 sendingURI:v57 sendingPushToken:v19 receivingURI:v18 receivingPushToken:v36 service:v38];

      [(IDSCryptionContext *)v32 setMessageType:0];
      id v33 = +[IDSEncryptionController sharedInstance];
      id v39 = [(IDSDAccount *)self service];
      id v40 = [v39 identifier];
      LOBYTE(v48) = 0;
      [(IDSDecryptionMetadata *)v33 publicKeyDecryptData:v56 decryptionContext:v32 identity:v28 service:v40 priority:300 isRetry:a10 replayKey:v55 publicKeyType:v51 completionBlock:v20 avoidMainQueue:v48];
    }
    else
    {
      id v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = +[NSNumber numberWithInteger:a9];
        *(_DWORD *)buf = 138412290;
        id v59 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Invalid encryption type -- failing {encryptionType: %@}", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v43 = +[NSNumber numberWithInteger:a9];
        _IDSWarnV();

        id v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a9, v43);
        _IDSLogV();

        id v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a9, v44);
        _IDSLogTransport();
      }
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSDecryptionErrorDomain, 16, 0, v42);
      id v32 = (IDSCryptionContext *)objc_claimAutoreleasedReturnValue();
      id v33 = [[IDSDecryptionMetadata alloc] initWithEncryptionType:a9];
      (*((void (**)(id, void, void, void, void, IDSCryptionContext *, IDSDecryptionMetadata *))v20 + 2))(v20, 0, 0, 0, 0, v32, v33);
    }
  }
  else
  {
    id v28 = +[IMRGLog warning];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10071E9C0(self, v28);
    }
  }
}

- (id)pairingManager
{
  return +[IDSPairingManager sharedInstance];
}

- (BOOL)shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fromID];
  im_assert_primary_base_queue();
  id v6 = [(IDSDAccount *)self pairingManager];
  unsigned int v7 = [v6 isPaired];

  if (!v7) {
    goto LABEL_15;
  }
  id v8 = [(IDSDAccount *)self pairingManager];
  unsigned __int8 v9 = [v8 isCurrentDeviceTinkerConfiguredWatch];

  if (v9) {
    goto LABEL_15;
  }
  uint64_t v10 = [(IDSDAccount *)self pairingManager];
  unsigned __int8 v11 = [v10 activePairedDeviceHasPairingType:1];

  if (v11) {
    goto LABEL_15;
  }
  id v12 = [(IDSDAccount *)self service];
  unsigned int v13 = [v12 shouldAllowProxyDelivery];

  if (!v13) {
    goto LABEL_15;
  }
  id v14 = [(IDSDAccount *)self service];
  BOOL v15 = [v14 identifier];
  uint64_t v16 = IDSServiceNameiMessage;
  if (![v15 isEqualToString:IDSServiceNameiMessage]) {
    goto LABEL_12;
  }
  id v17 = [v4 command];
  if (![v17 isEqualToNumber:&off_1009D1D40]
    || ([v4 deliveryMinimumTime], (id v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_12:
    goto LABEL_13;
  }
  id v19 = [v4 queueOneIdentifier];

  if (v19)
  {
    id v20 = [(IDSDAccount *)self pairingManager];
    unsigned __int8 v21 = [v20 pairedDeviceSupportsSendLaterMessages];

    if ((v21 & 1) == 0) {
      goto LABEL_15;
    }
  }
LABEL_13:
  id v22 = [(IDSDAccount *)self service];
  id v23 = [v22 identifier];
  if ([v23 isEqualToString:v16])
  {
    id v24 = [v4 command];
    unsigned __int8 v25 = [v24 isEqualToNumber:&off_1009D1D58];

    if (v25)
    {
LABEL_15:
      BOOL v26 = 0;
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v28 = [(IDSDAccount *)self accountController];
  int64_t v29 = [(IDSDAccount *)self service];
  uint64_t v48 = [v28 accountsOnService:v29];

  if ([v48 count] == (id)1)
  {
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Only 1 account exists on this service, We will need to proxy this and include the default paired device as a destination", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    BOOL v26 = 1;
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v48;
    id v46 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v46)
    {
      uint64_t v44 = *(void *)v55;
      uint64_t v43 = IDSDevicePropertyIdentities;
      uint64_t v31 = IDSDevicePropertyIdentitiesURI;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(obj);
          }
          int64_t v49 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "defaultPairedDependentRegistration", v41, v42);
          if (v49)
          {
            id v32 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v49;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Found Default paired device %@ ", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v41 = v49;
              _IDSLogV();
            }
            id v33 = objc_msgSend(v49, "objectForKey:", v43, v41);
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v34 = v33;
            id v35 = [v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
            if (v35)
            {
              uint64_t v36 = *(void *)v51;
              while (2)
              {
                for (j = 0; j != v35; j = (char *)j + 1)
                {
                  if (*(void *)v51 != v36) {
                    objc_enumerationMutation(v34);
                  }
                  BOOL v38 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * (void)j), "_stringForKey:", v31, v41);
                  id v39 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v59 = v38;
                    __int16 v60 = 2112;
                    id v61 = v5;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Comparing %@  To %@ ", buf, 0x16u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    id v41 = v38;
                    id v42 = v5;
                    _IDSLogV();
                  }
                  if (_FTAreIDsEquivalent())
                  {
                    id v40 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "These ID's are the same, We will not be proxying this message", buf, 2u);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                      _IDSLogV();
                    }

                    BOOL v26 = 0;
                    goto LABEL_60;
                  }
                }
                id v35 = [v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
                if (v35) {
                  continue;
                }
                break;
              }
            }
          }
        }
        id v46 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
        BOOL v26 = 1;
      }
      while (v46);
    }
    else
    {
      BOOL v26 = 1;
    }
LABEL_60:
  }
LABEL_16:

  return v26;
}

@end