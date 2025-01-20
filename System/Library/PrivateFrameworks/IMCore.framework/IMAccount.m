@interface IMAccount
+ (id)_groupSummaryFromGroupList:(id)a3;
+ (id)allBuddyListIMHandles;
+ (id)arrayOfAllIMHandles;
+ (id)nameOfLoginStatus:(unint64_t)a3;
+ (id)passwordForAccount:(id)a3 forServiceName:(id)a4;
+ (id)temporaryPasswordForAccount:(id)a3 forAuthID:(id)a4 forServiceName:(id)a5;
+ (void)removePasswordForAccount:(id)a3 forServiceName:(id)a4;
+ (void)removeTemporaryPasswordForAccount:(id)a3 forServiceName:(id)a4;
+ (void)setPassword:(id)a3 forAccount:(id)a4 forAuthID:(id)a5 forServiceName:(id)a6;
+ (void)setTemporaryPassword:(id)a3 forAccount:(id)a4 forAuthID:(id)a5 forServiceName:(id)a6;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForPreferenceKey:(id)a3;
- (BOOL)_aliasIsVisible:(id)a3;
- (BOOL)_hasSuppressionForCapability:(id)a3;
- (BOOL)_isUsableForSending;
- (BOOL)_updateDisplayName:(id)a3;
- (BOOL)addAlias:(id)a3;
- (BOOL)addAlias:(id)a3 type:(int64_t)a4;
- (BOOL)addAliases:(id)a3;
- (BOOL)addIMHandle:(id)a3 toGroups:(id)a4 atLocation:(int64_t)a5;
- (BOOL)addPeople:(id)a3 toGroups:(id)a4 atLocation:(int64_t)a5;
- (BOOL)allowsMMSRelay;
- (BOOL)allowsSMSRelay;
- (BOOL)allowsVCRelay;
- (BOOL)asleep;
- (BOOL)authenticateAccount;
- (BOOL)autoLogin;
- (BOOL)blockIdleStatus;
- (BOOL)blockOtherAddresses;
- (BOOL)canActivate;
- (BOOL)canSendMessages;
- (BOOL)emailAddressIsID:(id)a3;
- (BOOL)equalID:(id)a3 andID:(id)a4;
- (BOOL)goIdle;
- (BOOL)handlesChatInvites;
- (BOOL)hasAlias:(id)a3;
- (BOOL)hasBeenRemoved;
- (BOOL)hasCapability:(unint64_t)a3;
- (BOOL)hasCheckedDefaultHandleCapabilities;
- (BOOL)hasCustomDescription;
- (BOOL)hasPostedOfflineNotification;
- (BOOL)hasReceivedSync;
- (BOOL)hasSyncedWithRemoteBuddies;
- (BOOL)hasTargetGroupStateBeenMet;
- (BOOL)isActive;
- (BOOL)isApprovedForRelay;
- (BOOL)isAsleep;
- (BOOL)isAwaitingTargetGroupState;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isInvisible;
- (BOOL)isMakoAccount;
- (BOOL)isManaged;
- (BOOL)isOperational;
- (BOOL)isRegistered;
- (BOOL)isSMSRelayCapable;
- (BOOL)justLoggedIn;
- (BOOL)makingChanges;
- (BOOL)needToCheckForWatchedIMHandles;
- (BOOL)registerAccount;
- (BOOL)removeAlias:(id)a3;
- (BOOL)removeAlias:(id)a3 type:(int64_t)a4;
- (BOOL)removeAliases:(id)a3;
- (BOOL)removeIMHandle:(id)a3 fromGroups:(id)a4;
- (BOOL)removePeople:(id)a3 fromGroups:(id)a4;
- (BOOL)removeProfileValueForKey:(id)a3;
- (BOOL)requestNewAuthorizationCredentials;
- (BOOL)setProfileString:(id)a3 forKey:(id)a4;
- (BOOL)setProfileValue:(id)a3 forKey:(id)a4;
- (BOOL)supportsAuthorization;
- (BOOL)supportsCapability:(id)a3;
- (BOOL)supportsCapability:(id)a3 forAlias:(id)a4;
- (BOOL)supportsCapability:(id)a3 forAlias:(id)a4 simID:(id)a5;
- (BOOL)supportsRegistration;
- (BOOL)syncedWithRemoteBuddyList;
- (BOOL)unregisterAccount;
- (BOOL)unvalidateAlias:(id)a3;
- (BOOL)unvalidateAliases:(id)a3;
- (BOOL)updateAuthorizationCredentials:(id)a3 token:(id)a4;
- (BOOL)useMeCardName;
- (BOOL)useSSL;
- (BOOL)validLogin;
- (BOOL)validPort;
- (BOOL)validServer;
- (BOOL)validateAlias:(id)a3;
- (BOOL)validateAliases:(id)a3;
- (BOOL)validateProfile;
- (Class)imHandleClass;
- (IMAccount)initWithService:(id)a3;
- (IMAccount)initWithUniqueID:(id)a3 service:(id)a4;
- (IMHandle)loginIMHandle;
- (IMPeople)buddyList;
- (IMServiceImpl)service;
- (NSArray)aliases;
- (NSArray)aliasesToRegister;
- (NSArray)allowList;
- (NSArray)arrayOfAllIMHandles;
- (NSArray)blockList;
- (NSArray)cachedAllowList;
- (NSArray)cachedBlockList;
- (NSArray)emailDomains;
- (NSArray)groupList;
- (NSArray)groups;
- (NSArray)lastReceivedGroupState;
- (NSArray)targetGroupState;
- (NSArray)vettedAliases;
- (NSAttributedString)myProfile;
- (NSData)myPictureData;
- (NSDate)myIdleSince;
- (NSDictionary)_persistentProperties;
- (NSDictionary)accountPersistentProperties;
- (NSDictionary)accountPreferences;
- (NSDictionary)accountSubtypeInfo;
- (NSDictionary)data;
- (NSDictionary)dictionary;
- (NSDictionary)members;
- (NSDictionary)myNowPlaying;
- (NSDictionary)profile;
- (NSDictionary)profileInfo;
- (NSDictionary)registrationAlertInfo;
- (NSDictionary)registrationFailureAlertInfo;
- (NSMapTable)imHandles;
- (NSMutableDictionary)accountPersistentPropertiesChanges;
- (NSMutableDictionary)accountPreferencesChanges;
- (NSMutableDictionary)coalescedChanges;
- (NSMutableDictionary)dataChanges;
- (NSMutableDictionary)localCache;
- (NSMutableDictionary)myStatusDictionary;
- (NSMutableDictionary)profileChanges;
- (NSMutableDictionary)sortOrders;
- (NSRecursiveLock)lock;
- (NSString)accountDescription;
- (NSString)authorizationID;
- (NSString)authorizationToken;
- (NSString)countryCode;
- (NSString)displayName;
- (NSString)internalName;
- (NSString)keyTransparencyIDQueryListenerID;
- (NSString)login;
- (NSString)loginID;
- (NSString)loginStatusMessage;
- (NSString)myNowPlayingString;
- (NSString)myStatusMessage;
- (NSString)name;
- (NSString)password;
- (NSString)regionID;
- (NSString)server;
- (NSString)serviceName;
- (NSString)shortName;
- (NSString)strippedLogin;
- (NSString)temporaryPassword;
- (NSString)uniqueID;
- (_FZChatRoomValidity)validityOfChatRoomName:(id)a3;
- (id)_aliasInfoForAlias:(id)a3;
- (id)_aliases;
- (id)_imHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4 originalID:(id)a5 countryCode:(id)a6;
- (id)_persistentPropertyForKey:(id)a3;
- (id)_serverWithSSL:(BOOL)a3;
- (id)_statuses;
- (id)accountImage;
- (id)aliasesForType:(int64_t)a3;
- (id)canonicalFormOfID:(id)a3;
- (id)canonicalFormOfID:(id)a3 countryCode:(id)a4;
- (id)chatIDForRoomName:(id)a3;
- (id)defaultChatSuffix;
- (id)description;
- (id)existingIMHandleWithID:(id)a3;
- (id)existingIMHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4;
- (id)existingIMHandleWithID:(id)a3 countryCode:(id)a4;
- (id)existingIMHandleWithInfo:(id)a3;
- (id)existingIMHandleWithInfo:(id)a3 alreadyCanonical:(BOOL)a4;
- (id)groupMembers:(id)a3;
- (id)handlesForCNContact:(id)a3;
- (id)imHandleWithID:(id)a3;
- (id)imHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4;
- (id)imHandleWithID:(id)a3 countryCode:(id)a4;
- (id)imHandleWithInfo:(id)a3;
- (id)imHandleWithInfo:(id)a3 alreadyCanonical:(BOOL)a4;
- (id)memberGroups:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForPreferenceKey:(id)a3;
- (id)profileStringForKey:(id)a3;
- (id)profileValueForKey:(id)a3;
- (id)propertiesForGroup:(id)a3;
- (id)smallImage;
- (id)stringForKey:(id)a3;
- (id)stringForPreferenceKey:(id)a3;
- (int)coalesceCount;
- (int)integerForPreferenceKey:(id)a3;
- (int)numHolding;
- (int64_t)accountType;
- (int64_t)compareAccountNames:(id)a3;
- (int64_t)compareIDs:(id)a3;
- (int64_t)compareLoginStatus:(id)a3;
- (int64_t)compareNames:(id)a3;
- (int64_t)compareServices:(id)a3;
- (int64_t)compareStatus:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (int64_t)invalidSettings;
- (int64_t)port;
- (int64_t)profileStatus;
- (int64_t)profileValidationErrorReason;
- (int64_t)profileValidationStatus;
- (int64_t)registrationFailureReason;
- (int64_t)registrationStatus;
- (int64_t)typeForAlias:(id)a3;
- (int64_t)validationErrorReasonForAlias:(id)a3;
- (int64_t)validationStatusForAlias:(id)a3;
- (unint64_t)capabilities;
- (unint64_t)defaultHandleCapabilities;
- (unint64_t)loginStatus;
- (unint64_t)myStatus;
- (unint64_t)sortOrderForIMHandle:(id)a3 inGroup:(id)a4;
- (unsigned)blockingMode;
- (unsigned)cachedBlockingMode;
- (void)_applyChangesToTemporaryCache:(id)a3;
- (void)_clearImageCache;
- (void)_ensureGroupsExists:(id)a3;
- (void)_invalidateCachedAliases;
- (void)_loadFromDictionary:(id)a3 force:(BOOL)a4;
- (void)_loginWithAutoLogin:(BOOL)a3;
- (void)_markHasSyncedWithRemoteBuddies;
- (void)_notJustLoggedIn;
- (void)_refreshLoginIMHandle;
- (void)_registrationStatusChanged:(id)a3;
- (void)_removeObjectForKey:(id)a3;
- (void)_removePersistentPropertyForKey:(id)a3;
- (void)_resumeBuddyUpdatesNow;
- (void)_serviceDidConnect:(id)a3;
- (void)_serviceDidDisconnect:(id)a3;
- (void)_serviceDidReconnect:(id)a3;
- (void)_setBool:(BOOL)a3 forKey:(id)a4;
- (void)_setInteger:(int64_t)a3 forKey:(id)a4;
- (void)_setLocalCachedObject:(id)a3 forKey:(id)a4;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)_setPersistentPropertyObject:(id)a3 forKey:(id)a4;
- (void)_syncWithRemoteBuddies;
- (void)_updateLogin:(id)a3;
- (void)_updateMyStatus:(unint64_t)a3 message:(id)a4;
- (void)_updateProfileInfo:(id)a3;
- (void)_updateRegistrationStatus:(int)a3 error:(int)a4 info:(id)a5;
- (void)_watchBuddiesIfNecessary;
- (void)accountDidBecomeActive;
- (void)accountDidDeactivate;
- (void)accountWillBeRemoved;
- (void)addBuddyToBuddyList:(id)a3;
- (void)autoLoginAccount;
- (void)beginChanges;
- (void)blockMessages:(BOOL)a3 fromID:(id)a4;
- (void)buddyPictureChanged:(id)a3 imageData:(id)a4 imageHash:(id)a5;
- (void)buddyPropertiesChanged:(id)a3;
- (void)changeBuddyList:(id)a3 add:(BOOL)a4 groups:(id)a5 atLocation:(int64_t)a6;
- (void)clearServiceCaches;
- (void)clearTargetState;
- (void)dealloc;
- (void)deregisterAsIDSIDQueryControllerDelegate;
- (void)disconnectAllIMHandles;
- (void)endChanges;
- (void)enrollDeviceInSMSRelay:(id)a3;
- (void)enrollSelfDeviceInSMSRelay;
- (void)forgetAllWatches;
- (void)groupsChanged:(id)a3 error:(id)a4;
- (void)handleSubscriptionRequestFrom:(id)a3 withMessage:(id)a4;
- (void)holdBuddyUpdates;
- (void)hookupToDaemon;
- (void)idsKTVerifierResultsUpdatedForDestinations:(id)a3 service:(id)a4;
- (void)imHandle:(id)a3 buddyStatusChanged:(BOOL)a4;
- (void)loadFromDictionary:(id)a3;
- (void)loginAccount;
- (void)loginIfActiveRegistered;
- (void)loginStatusChanged:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6;
- (void)logoutAccount;
- (void)nowLoggedOut;
- (void)registerAsIDSIDQueryControllerDelegate;
- (void)registerIMHandle:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectForPreferenceKey:(id)a3;
- (void)removePassword;
- (void)removeTemporaryPassword;
- (void)renameGroup:(id)a3 to:(id)a4;
- (void)reorderGroup:(id)a3 order:(id)a4;
- (void)reorderGroups:(id)a3;
- (void)requestBuddyListAuthorizationFromIMHandle:(id)a3;
- (void)requestProperty:(id)a3 ofIMHandle:(id)a4;
- (void)resetToDefaults;
- (void)resumeBuddyUpdates;
- (void)setAccountDescription:(id)a3;
- (void)setAccountImage:(id)a3;
- (void)setAccountPersistentProperties:(id)a3;
- (void)setAccountPersistentPropertiesChanges:(id)a3;
- (void)setAccountPreferences:(id)a3;
- (void)setAccountPreferencesChanges:(id)a3;
- (void)setAccountSubtypeInfo:(id)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setAliases:(id)a3;
- (void)setAllowList:(id)a3;
- (void)setAllowsVCRelay:(BOOL)a3;
- (void)setAsleep:(BOOL)a3;
- (void)setAutoLogin:(BOOL)a3;
- (void)setBlockIdleStatus:(BOOL)a3;
- (void)setBlockList:(id)a3;
- (void)setBlockOtherAddresses:(BOOL)a3;
- (void)setBlockingMode:(unsigned int)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forPreferenceKey:(id)a4;
- (void)setBuddyList:(id)a3;
- (void)setBuddyListAuthorization:(BOOL)a3 forIMHandle:(id)a4;
- (void)setBuddyProperties:(id)a3 buddyPictures:(id)a4;
- (void)setCachedAllowList:(id)a3;
- (void)setCachedBlockIdleStatus:(BOOL)a3;
- (void)setCachedBlockList:(id)a3;
- (void)setCachedBlockingMode:(unsigned int)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setCoalesceCount:(int)a3;
- (void)setCoalescedChanges:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrentAccountStatus:(id)a3;
- (void)setData:(id)a3;
- (void)setDataChanges:(id)a3;
- (void)setDefaultHandleCapabilities:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setGoIdle:(BOOL)a3;
- (void)setGroups:(id)a3;
- (void)setHasBeenRemoved:(BOOL)a3;
- (void)setHasCheckedDefaultHandleCapabilities:(BOOL)a3;
- (void)setHasPostedOfflineNotification:(BOOL)a3;
- (void)setHasReceivedSync:(BOOL)a3;
- (void)setIMAccountLoginStatus:(unint64_t)a3;
- (void)setIMAccountLoginStatus:(unint64_t)a3 errorMessage:(id)a4;
- (void)setIMAccountLoginStatus:(unint64_t)a3 errorMessage:(id)a4 reason:(int)a5;
- (void)setImHandles:(id)a3;
- (void)setInteger:(int)a3 forPreferenceKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setInvisible:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setJustLoggedIn:(BOOL)a3;
- (void)setKeyTransparencyIDQueryListenerID:(id)a3;
- (void)setLastReceivedGroupState:(id)a3;
- (void)setLocalCache:(id)a3;
- (void)setLock:(id)a3;
- (void)setLogin:(id)a3;
- (void)setLoginID:(id)a3;
- (void)setLoginIMHandle:(id)a3;
- (void)setLoginStatus:(unint64_t)a3;
- (void)setMembers:(id)a3;
- (void)setMyIdleSince:(id)a3;
- (void)setMyNowPlaying:(id)a3;
- (void)setMyPictureData:(id)a3;
- (void)setMyProfile:(id)a3;
- (void)setMyStatus:(unint64_t)a3;
- (void)setMyStatusDictionary:(id)a3;
- (void)setMyStatusMessage:(id)a3;
- (void)setNeedToCheckForWatchedIMHandles:(BOOL)a3;
- (void)setNumHolding:(int)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forPreferenceKey:(id)a4;
- (void)setPassword:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileChanges:(id)a3;
- (void)setProfileStatus:(int64_t)a3;
- (void)setRegistrationAlertInfo:(id)a3;
- (void)setRegistrationFailureReason:(int64_t)a3;
- (void)setRegistrationStatus:(int64_t)a3;
- (void)setService:(id)a3;
- (void)setSmallImage:(id)a3;
- (void)setSortOrders:(id)a3;
- (void)setStrippedLogin:(id)a3;
- (void)setSyncedWithRemoteBuddyList:(BOOL)a3;
- (void)setTargetGroupState:(id)a3;
- (void)setTargetGroupsState:(id)a3;
- (void)setTemporaryPassword:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUseMeCardName:(BOOL)a3;
- (void)setValue:(id)a3 ofExtraProperty:(id)a4 ofIMHandle:(id)a5;
- (void)setVettedAliases:(id)a3;
- (void)setWaitForTargetState;
- (void)startWatchingIMHandle:(id)a3;
- (void)stopWatchingIMHandle:(id)a3;
- (void)syncWithRemoteBuddies;
- (void)systemDidWake;
- (void)systemWillSleep;
- (void)targetGroupStateTimeout;
- (void)unEnrollDeviceInSMSRelay:(id)a3;
- (void)unregisterIMHandleWithID:(id)a3;
- (void)updateCapabilities:(unint64_t)a3;
- (void)updateWithTargetGroups;
- (void)watchBuddiesIfNecessary;
- (void)writeSettings;
@end

@implementation IMAccount

- (BOOL)_isUsableForSending
{
  v5 = (void *)MEMORY[0x1E4F6E560];
  v6 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  v10 = objc_msgSend_accounts(v6, v7, v8, v9);
  LOBYTE(self) = objc_msgSend_isAccountUsableForSendingWithAllAccounts_account_(v5, v11, (uint64_t)v10, (uint64_t)self);

  return (char)self;
}

- (NSString)countryCode
{
  countryCode = self->_countryCode;
  if (countryCode) {
    goto LABEL_21;
  }
  uint64_t v6 = objc_msgSend_accountType(self, a2, v2, v3);
  if (v6 == 1)
  {
    if (IMSharedHelperDeviceIsAltAccount())
    {
      v18 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v15, v16, v17);
      uint64_t v22 = objc_msgSend_ctPhoneNumber(v18, v19, v20, v21);
    }
    else
    {
      if (qword_1EB3F2228 != -1) {
        dispatch_once(&qword_1EB3F2228, &unk_1EF8E3D70);
      }
      v18 = objc_msgSend_sharedInstance((void *)qword_1EB3F2220, v15, v16, v17);
      if (!objc_msgSend_isTelephonyDevice(v18, v23, v24, v25))
      {
        v10 = 0;
        goto LABEL_14;
      }
      uint64_t v22 = objc_msgSend_telephoneNumber(v18, v26, v27, v28);
    }
    v10 = (void *)v22;
LABEL_14:

    if (!objc_msgSend_length(v10, v29, v30, v31))
    {
      uint64_t v35 = objc_msgSend_profileValueForKey_(self, v32, @"Number", v34);

      v10 = (void *)v35;
    }
    uint64_t v14 = objc_msgSend_length(v10, v32, v33, v34);
    goto LABEL_17;
  }
  if (v6 == 2)
  {
    v10 = objc_msgSend_displayName(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_length(v10, v11, v12, v13);
  }
  else
  {
    v10 = 0;
    uint64_t v14 = objc_msgSend_length(0, v7, v8, v9);
  }
LABEL_17:
  if (v14
    && (IMCountryCodeForNumber(),
        v36 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v37 = self->_countryCode,
        self->_countryCode = v36,
        v37,
        !objc_msgSend_length(self->_countryCode, v38, v39, v40)))
  {
    v43 = objc_msgSend_profileValueForKey_(self, v41, @"Number", v42);

    if (objc_msgSend_length(v43, v58, v59, v60))
    {
      IMCountryCodeForNumber();
      v61 = (NSString *)objc_claimAutoreleasedReturnValue();
      v62 = self->_countryCode;
      self->_countryCode = v61;
    }
  }
  else
  {
    v43 = v10;
  }

  countryCode = self->_countryCode;
LABEL_21:
  if (!objc_msgSend_length(countryCode, a2, v2, v3))
  {
    v47 = self->_countryCode;
    self->_countryCode = 0;
  }
  if (self->_countryCode
    || (IMCountryCodeForIncomingTextMessage(),
        v48 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v49 = self->_countryCode,
        self->_countryCode = v48,
        v49,
        self->_countryCode))
  {
    v50 = objc_msgSend_service(self, v44, v45, v46);
    objc_msgSend_setCountryCode_(v50, v51, (uint64_t)self->_countryCode, v52);

    v53 = self->_countryCode;
  }
  else
  {
    v55 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E4F1CA20], v44, v45, v46);
    objc_msgSend_objectForKey_(v55, v56, *MEMORY[0x1E4F1C400], v57);
    v53 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v53;
}

- (void)updateCapabilities:(unint64_t)a3
{
  unint64_t capabilities = self->_capabilities;
  if (capabilities != a3)
  {
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, capabilities, v3);
    v11 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, a3, v10);
    uint64_t v14 = objc_msgSend_dictionaryWithObjectsAndKeys_(v7, v12, (uint64_t)v8, v13, @"__kkOldValueKey", v11, @"__kkNewValueKey", 0);

    self->_unint64_t capabilities = a3;
    v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v15, v16, v17);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v18, v19, @"__kIMAccountCapabilitiesChangedNotification", (uint64_t)self, v14);
  }
}

- (void)setIMAccountLoginStatus:(unint64_t)a3 errorMessage:(id)a4 reason:(int)a5
{
  id v8 = a4;
  IMLogBacktrace();
  int isActive = objc_msgSend_isActive(self, v9, v10, v11);
  unint64_t loginStatus = self->_loginStatus;
  BOOL v16 = a3 == 3 && loginStatus == 4;
  if (loginStatus != a3 && !v16)
  {
    int v17 = isActive;
    self->_unint64_t loginStatus = a3;
    self->_justLoggedIn = a3 == 4;
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v13, (uint64_t)self, (uint64_t)sel__notJustLoggedIn, 0);
    if (v17)
    {
      uint64_t v21 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v18, v19, v20);
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v25 = objc_msgSend_numberWithInteger_(NSNumber, v23, a5, v24);
      uint64_t v28 = objc_msgSend_dictionaryWithObjectsAndKeys_(v22, v26, (uint64_t)v25, v27, @"__kIMAccountLoginStatusChangedReasonKey", v8, @"__kIMAccountLoginStatusChangedErrorMessageKey", 0);
      objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v21, v29, @"__kIMAccountLoginStatusChangedNotification", (uint64_t)self, v28);
    }
    if (a3 > 1)
    {
      self->_hasPostedOfflineNotification = 0;
      if (a3 == 4)
      {
        objc_msgSend__refreshLoginIMHandle(self, v18, v19, v20);
        objc_msgSend_nowLoggedIn(self, v38, v39, v40);
        v44 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v41, v42, v43);
        uint64_t v45 = (void *)MEMORY[0x1E4F1C9E8];
        v48 = objc_msgSend_numberWithInteger_(NSNumber, v46, a5, v47);
        v51 = objc_msgSend_dictionaryWithObjectsAndKeys_(v45, v49, (uint64_t)v48, v50, @"__kIMAccountLoginStatusChangedReasonKey", v8, @"__kIMAccountLoginStatusChangedErrorMessageKey", 0);
        objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v44, v52, @"__kIMAccountLoggedInNotification", (uint64_t)self, v51);
      }
    }
    else
    {
      objc_msgSend_clearTargetState(self, v18, v19, v20);
      objc_msgSend_forgetAllWatches(self, v30, v31, v32);
      if (!self->_hasPostedOfflineNotification)
      {
        v36 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v33, v34, v35);
        objc_msgSend___mainThreadPostNotificationName_object_(v36, v37, @"__kIMAccountLoggedOutNotification", (uint64_t)self);

        self->_hasPostedOfflineNotification = 1;
      }
      objc_msgSend_nowLoggedOut(self, v33, v34, v35);
    }
  }
  if (loginStatus != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_msgSend_statusChangedForAccount_from_to_(WeakRetained, v54, (uint64_t)self, loginStatus, a3);
  }
}

- (void)setIMAccountLoginStatus:(unint64_t)a3 errorMessage:(id)a4
{
}

- (void)setIMAccountLoginStatus:(unint64_t)a3
{
}

- (void)setCurrentAccountStatus:(id)a3
{
  id v4 = a3;
  objc_msgSend_myStatusDictionary(self, v5, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v4)
  {
    uint64_t v11 = objc_msgSend_objectForKey_(v4, v9, *MEMORY[0x1E4F6C630], v10);
    uint64_t v15 = objc_msgSend_intValue(v11, v12, v13, v14);
    uint64_t v17 = IMPersonStatusFromFZPersonStatus(v15, v16);

    uint64_t v20 = objc_msgSend_objectForKey_(v4, v18, *MEMORY[0x1E4F6C638], v19);
    if (v20)
    {
      uint64_t v22 = (__CFString *)v20;
      objc_msgSend__updateMyStatus_message_(self, v21, v17, v20);
    }
    else
    {
      uint64_t v22 = &stru_1EF8E78C8;
      objc_msgSend__updateMyStatus_message_(self, v21, v17, (uint64_t)&stru_1EF8E78C8);
    }
    objc_msgSend_objectForKey_(v4, v23, *MEMORY[0x1E4F6C620], v24);
    uint64_t v27 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v27 != self->_myProfile)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_myProfile, v27);
      }
    }
    objc_msgSend_objectForKey_(v4, v25, *MEMORY[0x1E4F6C610], v26);
    uint64_t v28 = (NSData *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isNull(v28, v29, v30, v31) & 1) != 0 || !objc_msgSend_length(v28, v32, v33, v34))
    {

      uint64_t v28 = 0;
    }
    myPictureData = self->_myPictureData;
    if (v28 != myPictureData && (objc_msgSend_isEqualToData_(v28, v35, (uint64_t)myPictureData, v36) & 1) == 0) {
      objc_storeStrong((id *)&self->_myPictureData, v28);
    }
    objc_msgSend_objectForKey_(v4, v35, *MEMORY[0x1E4F6C590], v36);
    uint64_t v40 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v40 != self->_myIdleSince) {
      objc_storeStrong((id *)&self->_myIdleSince, v40);
    }
    objc_msgSend_objectForKey_(v4, v38, *MEMORY[0x1E4F6C5F8], v39);
    v44 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    myNowPlaying = self->_myNowPlaying;
    if (v44 != myNowPlaying && (objc_msgSend_isEqualToDictionary_(myNowPlaying, v41, (uint64_t)v44, v43) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_myNowPlaying, v44);
      v49 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v46, v47, v48);
      objc_msgSend___mainThreadPostNotificationName_object_(v49, v50, @"__kIMMeNowPlayingInfoChangedNotification", (uint64_t)self);
    }
    v51 = objc_msgSend_myStatusDictionary(self, v41, v42, v43);
    v55 = v51;
    if (v4 && v51)
    {
      v56 = objc_msgSend_myStatusDictionary(self, v52, v53, v54);
      char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v56, v57, (uint64_t)v4, v58);

      v63 = objc_msgSend_mutableCopy(v4, v60, v61, v62);
      objc_msgSend_setMyStatusDictionary_(self, v64, (uint64_t)v63, v65);

      if (isEqualToDictionary) {
        goto LABEL_25;
      }
    }
    else
    {

      v72 = objc_msgSend_mutableCopy(v4, v69, v70, v71);
      objc_msgSend_setMyStatusDictionary_(self, v73, (uint64_t)v72, v74);
    }
    v75 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v66, v67, v68);
    objc_msgSend___mainThreadPostNotificationName_object_(v75, v76, @"__kIMAccountStatusInfoChangedNotification", (uint64_t)self);

LABEL_25:
  }
}

- (NSMutableDictionary)myStatusDictionary
{
  return self->_myStatusDictionary;
}

- (void)loadFromDictionary:(id)a3
{
}

- (id)imHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4
{
  return (id)objc_msgSend__imHandleWithID_alreadyCanonical_originalID_countryCode_(self, a2, (uint64_t)a3, a4, 0, 0);
}

- (id)_imHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4 originalID:(id)a5 countryCode:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v15 = a6;
  if (!v10
    || (objc_msgSend_null(MEMORY[0x1E4F1CA98], v12, v13, v14),
        id v16 = (id)objc_claimAutoreleasedReturnValue(),
        v16,
        v16 == v10))
  {
    uint64_t v20 = 0;
  }
  else
  {
    if (a4)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v21 = objc_msgSend_canonicalFormOfID_(self, v17, (uint64_t)v10, v18);
      if (objc_msgSend_isEqualToString_(v10, v22, v21, v23))
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = IMCleanupPhoneNumber();
      }

      id v10 = (id)v21;
    }
    uint64_t v20 = objc_msgSend_existingIMHandleWithID_alreadyCanonical_(self, v17, (uint64_t)v10, 1);
    if (!v20)
    {
      uint64_t v27 = [IMHandle alloc];
      uint64_t v20 = objc_msgSend_initWithAccount_ID_alreadyCanonical_(v27, v28, (uint64_t)self, (uint64_t)v10, 1);
      uint64_t v32 = objc_msgSend_defaultHandleCapabilities(self, v29, v30, v31);
      if (v32) {
        objc_msgSend__setCapabilities_(v20, v24, v32, v26);
      }
    }
    if (v19)
    {
      uint64_t v33 = objc_msgSend_originalID(v20, v24, v25, v26);
      char isEqualToString = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v19, v35);

      if ((isEqualToString & 1) == 0)
      {
        uint64_t v40 = objc_msgSend_trimmedString(v19, v37, v38, v39);
        if ((unint64_t)objc_msgSend_length(v40, v41, v42, v43) < 4)
        {
        }
        else
        {
          char hasPrefix = objc_msgSend_hasPrefix_(v19, v44, @"+", v45);

          if ((hasPrefix & 1) == 0)
          {
            objc_msgSend__updateOriginalID_(v20, v47, (uint64_t)v19, v48);
            objc_msgSend__setOriginalID_(v20, v49, (uint64_t)v19, v50);
          }
        }
      }
    }
  }

  return v20;
}

- (id)existingIMHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    if (a4)
    {
      id v11 = 0;
    }
    else
    {
      uint64_t v13 = objc_msgSend_canonicalFormOfID_(self, v7, (uint64_t)v6, v9);
      if (objc_msgSend_isEqualToString_(v10, v14, v13, v15))
      {
        id v11 = 0;
      }
      else
      {
        id v11 = IMCleanupPhoneNumber();
      }

      id v10 = (void *)v13;
    }
    objc_msgSend_lock(self->_lock, v7, v8, v9);
    uint64_t v12 = objc_msgSend_objectForKey_(self->_imHandles, v16, (uint64_t)v10, v17);
    objc_msgSend_unlock(self->_lock, v18, v19, v20);
    if (v11)
    {
      uint64_t v24 = objc_msgSend_originalID(v12, v21, v22, v23);
      char isEqualToString = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v11, v26);

      if ((isEqualToString & 1) == 0)
      {
        uint64_t v31 = objc_msgSend_trimmedString(v11, v28, v29, v30);
        if ((unint64_t)objc_msgSend_length(v31, v32, v33, v34) < 4)
        {
        }
        else
        {
          char hasPrefix = objc_msgSend_hasPrefix_(v11, v35, @"+", v36);

          if ((hasPrefix & 1) == 0)
          {
            objc_msgSend__updateOriginalID_(v12, v38, (uint64_t)v11, v39);
            objc_msgSend__setOriginalID_(v12, v40, (uint64_t)v11, v41);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)defaultHandleCapabilities
{
  if (!self->_hasCheckedDefaultHandleCapabilities)
  {
    self->_hasCheckedDefaultHandleCapabilities = 1;
    v5 = objc_msgSend_service(self, a2, v2, v3);
    uint64_t v9 = objc_msgSend_serviceProperties(v5, v6, v7, v8);
    uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, *MEMORY[0x1E4F6C020], v11);

    id v16 = objc_msgSend_service(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_serviceProperties(v16, v17, v18, v19);
    uint64_t v23 = objc_msgSend_objectForKey_(v20, v21, *MEMORY[0x1E4F6C018], v22);

    if (objc_msgSend_intValue(v12, v24, v25, v26)
      || objc_msgSend_intValue(v23, v27, v28, v29))
    {
      uint64_t v30 = objc_msgSend_unsignedLongLongValue(v12, v27, v28, v29);
      unint64_t v34 = objc_msgSend_unsignedLongLongValue(v23, v31, v32, v33) | v30;
    }
    else
    {
      unint64_t v34 = 0;
    }
    self->_defaultHandleCapabilities = v34;
  }
  return self->_defaultHandleCapabilities;
}

- (NSString)uniqueID
{
  uniqueID = self->_uniqueID;
  if (!uniqueID)
  {
    objc_msgSend_stringGUID(NSString, a2, v2, v3);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_uniqueID;
    self->_uniqueID = v6;

    uniqueID = self->_uniqueID;
  }

  return uniqueID;
}

- (IMServiceImpl)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (IMServiceImpl *)WeakRetained;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~objc_msgSend_capabilities(self, a2, a3, v3)) == 0;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)registerIMHandle:(id)a3
{
  id v15 = a3;
  objc_msgSend_lock(self->_lock, v4, v5, v6);
  uint64_t v13 = objc_msgSend_ID(v15, v7, v8, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_objectForKey_(self->_imHandles, v10, (uint64_t)v13, v12);

    if (!v14) {
      objc_msgSend_setObject_forKey_(self->_imHandles, v10, (uint64_t)v15, (uint64_t)v13);
    }
  }
  objc_msgSend_unlock(self->_lock, v10, v11, v12);
}

- (BOOL)isConnected
{
  return self->_loginStatus == 4;
}

- (NSString)serviceName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v6 = objc_msgSend_name(WeakRetained, v3, v4, v5);

  return (NSString *)v6;
}

- (NSArray)aliases
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  aliases = self->_aliases;
  if (aliases)
  {
    uint64_t v5 = aliases;
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    objc_msgSend__aliases(self, a2, v2, v3);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v43, (uint64_t)v47, 16);
    if (v7)
    {
      uint64_t v10 = v7;
      id v11 = 0;
      uint64_t v12 = *(void *)v44;
      uint64_t v13 = *MEMORY[0x1E4F6B708];
      uint64_t v14 = *MEMORY[0x1E4F6C698];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v17 = objc_msgSend_objectForKey_(v16, v8, v13, v9);
          uint64_t v20 = objc_msgSend_objectForKey_(v16, v18, v14, v19);
          uint64_t v24 = objc_msgSend_lowercaseString(v20, v21, v22, v23);
          uint64_t v28 = objc_msgSend_trimmedString(v24, v25, v26, v27);

          if (v28
            && (!v17 || objc_msgSend_BOOLValue(v17, v29, v30, v31))
            && objc_msgSend__aliasIsVisible_(self, v29, (uint64_t)v28, v31))
          {
            objc_msgSend_addObject_(v11, v32, (uint64_t)v28, v33);
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v43, (uint64_t)v47, 16);
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
    }

    unint64_t v34 = (void *)_IDSCopyOrderedAliasStrings();
    objc_msgSend_array(v34, v35, v36, v37);
    uint64_t v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = self->_aliases;
    self->_aliases = v38;

    uint64_t v5 = self->_aliases;
  }

  return v5;
}

- (BOOL)isOperational
{
  uint64_t v5 = (void *)MEMORY[0x1E4F6E560];
  uint64_t v6 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  uint64_t v10 = objc_msgSend_accounts(v6, v7, v8, v9);
  LOBYTE(self) = objc_msgSend_isAccountOperationalWithAllAccounts_account_(v5, v11, (uint64_t)v10, (uint64_t)self);

  return (char)self;
}

- (NSString)strippedLogin
{
  return self->_strippedLogin;
}

- (id)canonicalFormOfID:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!objc_msgSend__appearsToBePhoneNumber(v6, v8, v9, v10)) {
    goto LABEL_9;
  }
  uint64_t v14 = objc_msgSend_service(self, v11, v12, v13);
  int v18 = objc_msgSend__wantsInternationizedNumbers(v14, v15, v16, v17);

  if (!v18) {
    goto LABEL_9;
  }
  if (!objc_msgSend_length(v7, v11, v12, v13))
  {
    uint64_t v22 = objc_msgSend_countryCode(self, v19, v20, v21);

    id v7 = (id)v22;
  }
  uint64_t v23 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
  uint64_t v27 = IMNormalizedPhoneNumberForCFPhoneNumberRef();
  if (v23) {
    CFRelease(v23);
  }
  if (!objc_msgSend_length(v27, v24, v25, v26))
  {

LABEL_9:
    uint64_t v27 = objc_msgSend_lowercaseString(v6, v11, v12, v13);
  }

  return v27;
}

- (id)canonicalFormOfID:(id)a3
{
  return (id)objc_msgSend_canonicalFormOfID_countryCode_(self, a2, (uint64_t)a3, 0);
}

- (void)_loadFromDictionary:(id)a3 force:(BOOL)a4
{
  id v215 = a3;
  objc_msgSend_lock(self->_lock, v7, v8, v9);
  if (!a4
    && v215
    && (data = self->_data) != 0
    && objc_msgSend_isEqualToDictionary_(data, v10, (uint64_t)v215, v12))
  {
    objc_msgSend_unlock(self->_lock, v10, v11, v12);
  }
  else
  {
    int isInvisible = objc_msgSend_isInvisible(self, v10, v11, v12);
    v210 = objc_msgSend_authorizationID(self, v13, v14, v15);
    v212 = objc_msgSend_aliases(self, v16, v17, v18);
    v209 = objc_msgSend_vettedAliases(self, v19, v20, v21);
    v217 = objc_msgSend__aliases(self, v22, v23, v24);
    objc_storeStrong((id *)&self->_data, a3);
    localCache = self->_localCache;
    self->_localCache = 0;

    dataChanges = self->_dataChanges;
    self->_dataChanges = 0;

    objc_msgSend_objectForKey_(v215, v27, @"AccountPrefs", v28);
    uint64_t v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    accountPreferences = self->_accountPreferences;
    self->_accountPreferences = v29;

    vettedAliases = self->_vettedAliases;
    self->_vettedAliases = 0;

    objc_msgSend__invalidateCachedAliases(self, v32, v33, v34);
    uint64_t v37 = objc_msgSend_objectForKey_(v215, v35, *MEMORY[0x1E4F6C738], v36);
    objc_msgSend__updateLogin_(self, v38, (uint64_t)v37, v39);

    uint64_t v42 = objc_msgSend_objectForKey_(v215, v40, *MEMORY[0x1E4F6C758], v41);
    objc_msgSend__updateProfileInfo_(self, v43, (uint64_t)v42, v44);

    v213 = objc_msgSend_objectForKey_(v215, v45, *MEMORY[0x1E4F6C7A0], v46);
    v49 = objc_msgSend_objectForKey_(v213, v47, *MEMORY[0x1E4F6C7A8], v48);
    uint64_t v53 = objc_msgSend_intValue(v49, v50, v51, v52);
    v56 = objc_msgSend_objectForKey_(v213, v54, *MEMORY[0x1E4F6C798], v55);
    uint64_t v60 = objc_msgSend_intValue(v56, v57, v58, v59);
    v63 = objc_msgSend_objectForKey_(v213, v61, *MEMORY[0x1E4F6C790], v62);
    objc_msgSend__updateRegistrationStatus_error_info_(self, v64, v53, v60, v63);

    if (!self->_accountPreferences)
    {
      uint64_t v68 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v69 = self->_accountPreferences;
      self->_accountPreferences = v68;
    }
    uint64_t v70 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v65, v66, v67);
    objc_msgSend___mainThreadPostNotificationName_object_(v70, v71, @"__kIMAccountSettingsChangedNotification", (uint64_t)self);

    v78 = objc_msgSend_authorizationID(self, v72, v73, v74);
    if (v78 == v210)
    {
    }
    else
    {
      v79 = objc_msgSend_authorizationID(self, v75, v76, v77);
      char isEqualToString = objc_msgSend_isEqualToString_(v79, v80, (uint64_t)v210, v81);

      if ((isEqualToString & 1) == 0)
      {
        v86 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v83, v84, v85);
        objc_msgSend___mainThreadPostNotificationName_object_(v86, v87, @"__kIMAccountAuthorizationIDChangedNotification", (uint64_t)self);
      }
    }
    v211 = objc_msgSend_aliases(self, v83, v84, v85);
    if (v212 != v211 && (objc_msgSend_isEqualToArray_(v211, v89, (uint64_t)v212, v91) & 1) == 0)
    {
      id v92 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v95 = objc_msgSend_initWithArray_(v92, v93, (uint64_t)v212, v94);
      id v96 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v99 = objc_msgSend_initWithArray_(v96, v97, (uint64_t)v211, v98);
      id v100 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v103 = objc_msgSend_initWithArray_(v100, v101, (uint64_t)v212, v102);
      objc_msgSend_minusSet_(v103, v104, (uint64_t)v99, v105);
      objc_msgSend_minusSet_(v99, v106, (uint64_t)v95, v107);
      id v108 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (objc_msgSend_count(v99, v109, v110, v111))
      {
        v115 = objc_msgSend_allObjects(v99, v112, v113, v114);
        objc_msgSend_setObject_forKey_(v108, v116, (uint64_t)v115, @"__kIMAccountAliasesAddedKey");
      }
      if (objc_msgSend_count(v103, v112, v113, v114))
      {
        v120 = objc_msgSend_allObjects(v103, v117, v118, v119);
        objc_msgSend_setObject_forKey_(v108, v121, (uint64_t)v120, @"__kIMAccountAliasesRemovedKey");
      }
      if (objc_msgSend_count(v108, v117, v118, v119))
      {
        v125 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v122, v123, v124);
        objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v125, v126, @"__kIMAccountAliasesChangedNotification", (uint64_t)self, v108);
      }
    }
    v127 = objc_msgSend__aliases(self, v89, v90, v91);
    v214 = objc_msgSend_objectForKey_(v215, v128, *MEMORY[0x1E4F6C6A8], v129);
    if ((v214 || v127 != v217 && (objc_msgSend_isEqualToArray_(v127, v130, (uint64_t)v217, v132) & 1) == 0)
      && objc_msgSend_count(v127, v130, v131, v132))
    {
      unint64_t v133 = 0;
      uint64_t v134 = *MEMORY[0x1E4F6C698];
      uint64_t v216 = *MEMORY[0x1E4F6C6A0];
      do
      {
        v135 = objc_msgSend_objectAtIndex_(v127, v130, v133, v132);
        v138 = objc_msgSend_objectForKey_(v135, v136, v134, v137);

        if (objc_msgSend_length(v138, v139, v140, v141))
        {
          if (v133 >= objc_msgSend_count(v217, v142, v143, v144))
          {
            uint64_t v156 = 0;
          }
          else
          {
            v148 = objc_msgSend_objectAtIndex_(v217, v145, v133, v147);
            v151 = objc_msgSend_objectForKey_(v148, v149, v216, v150);
            int v155 = objc_msgSend_intValue(v151, v152, v153, v154);

            uint64_t v156 = v155;
          }
          if (v133 >= objc_msgSend_count(v127, v145, v146, v147))
          {
            uint64_t v167 = 0;
          }
          else
          {
            v159 = objc_msgSend_objectAtIndex_(v127, v157, v133, v158);
            v162 = objc_msgSend_objectForKey_(v159, v160, v216, v161);
            int v166 = objc_msgSend_intValue(v162, v163, v164, v165);

            uint64_t v167 = v166;
          }
          uint64_t v168 = objc_msgSend_validationErrorReasonForAlias_(self, v157, (uint64_t)v138, v158);
          if (v167 != v156)
          {
            uint64_t v169 = v168;
            v170 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v171 = v138;
            if (v171) {
              CFDictionarySetValue(v170, @"__kIMAccountAliasChangedKey", v171);
            }

            v174 = objc_msgSend_numberWithInteger_(NSNumber, v172, v167, v173);
            if (v174) {
              CFDictionarySetValue(v170, @"__kIMAccountNewStatusKey", v174);
            }

            v177 = objc_msgSend_numberWithInteger_(NSNumber, v175, v156, v176);
            if (v177) {
              CFDictionarySetValue(v170, @"__kIMAccountOldStatusKey", v177);
            }

            if (v167 == -1 && v169 != -1)
            {
              v181 = objc_msgSend_numberWithInteger_(NSNumber, v178, v169, v180);
              if (v181) {
                CFDictionarySetValue(v170, @"__kIMAccountAliasValidationStatusFailedReasonKey", v181);
              }

              if (objc_msgSend_count(v214, v182, v183, v184)) {
                objc_msgSend_addEntriesFromDictionary_(v170, v178, (uint64_t)v214, v180);
              }
            }
            v185 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v178, v179, v180);
            objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v185, v186, @"__kIMAccountAliasValidationStatusChangedNotification", (uint64_t)self, v170);
          }
        }

        ++v133;
      }
      while (v133 < objc_msgSend_count(v127, v187, v188, v189));
    }
    if (isInvisible != objc_msgSend_isInvisible(self, v130, v131, v132))
    {
      v193 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v190, v191, v192);
      objc_msgSend___mainThreadPostNotificationName_object_(v193, v194, @"__kIMAccountInvisibilityChangedNotification", (uint64_t)self);
    }
    v195 = objc_msgSend_vettedAliases(self, v190, v191, v192);
    v198 = v195;
    if (v195 != v209 && (objc_msgSend_isEqualToArray_(v195, v196, (uint64_t)v209, v197) & 1) == 0)
    {
      v200 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v196, v199, v197);
      objc_msgSend___mainThreadPostNotificationName_object_(v200, v201, @"__kIMAccountVettedAliasesChangedNotification", (uint64_t)self);
    }
    v202 = objc_msgSend_objectForKey_(v215, v196, *MEMORY[0x1E4F6C708], v197);
    objc_msgSend__updateDisplayName_(self, v203, (uint64_t)v202, v204);

    objc_msgSend_unlock(self->_lock, v205, v206, v207);
  }
}

- (id)_aliases
{
  return (id)objc_msgSend_objectForKey_(self, a2, *MEMORY[0x1E4F6C6B8], v2);
}

- (NSArray)vettedAliases
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  vettedAliases = self->_vettedAliases;
  if (vettedAliases)
  {
    uint64_t v4 = vettedAliases;
  }
  else
  {
    id v6 = objc_msgSend_objectForKey_(self, a2, *MEMORY[0x1E4F6C818], v2);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend__aliasIsVisible_(self, v11, v16, v12, (void)v24)) {
            objc_msgSend_addObject_(v7, v11, v16, v12);
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v13);
    }

    uint64_t v17 = (void *)_IDSCopyOrderedAliasStrings();
    objc_msgSend_array(v17, v18, v19, v20);
    uint64_t v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = self->_vettedAliases;
    self->_vettedAliases = v21;

    uint64_t v4 = self->_vettedAliases;
  }

  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_objectForKey_(self->_localCache, v5, (uint64_t)v4, v6);

  if (v7)
  {
    objc_msgSend_objectForKey_(self->_localCache, v8, (uint64_t)v4, v9);
    uint64_t v14 = LABEL_5:;
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_objectForKey_(self->_dataChanges, v8, (uint64_t)v4, v9);

  if (v10)
  {
    objc_msgSend_objectForKey_(self->_dataChanges, v11, (uint64_t)v4, v13);
    goto LABEL_5;
  }
  objc_msgSend_lock(self->_lock, v11, v12, v13);
  uint64_t v14 = objc_msgSend_objectForKey_(self->_data, v16, (uint64_t)v4, v17);
  objc_msgSend_unlock(self->_lock, v18, v19, v20);
LABEL_6:

  return v14;
}

- (BOOL)isInvisible
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6C4E0], v2);
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v8 = objc_msgSend_BOOLValue(v4, v5, v6, v7);
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (NSString)authorizationID
{
  if (objc_msgSend_supportsAuthorization(self, a2, v2, v3))
  {
    uint64_t v7 = objc_msgSend_objectForKey_(self, v5, *MEMORY[0x1E4F6C6C8], v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)supportsAuthorization
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  char v6 = objc_msgSend_supportsAuthorization(WeakRetained, v3, v4, v5);

  return v6;
}

- (void)_updateRegistrationStatus:(int)a3 error:(int)a4 info:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (NSDictionary *)a5;
  uint64_t v13 = v9;
  if (*(_OWORD *)&self->_registrationStatus == __PAIR128__((int)v6, a3)
    && (!objc_msgSend_count(v9, v10, v11, v12) || self->_registrationAlertInfo))
  {
    registrationAlertInfo = self->_registrationAlertInfo;
    if (v13)
    {
      if (!registrationAlertInfo
        || (objc_msgSend_isEqualToDictionary_(v13, v14, (uint64_t)registrationAlertInfo, v15) & 1) != 0)
      {
        goto LABEL_26;
      }
    }
    else if (!objc_msgSend_count(self->_registrationAlertInfo, v14, (uint64_t)registrationAlertInfo, v15))
    {
      goto LABEL_26;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = objc_msgSend_numberWithInteger_(NSNumber, v18, self->_registrationFailureReason, v19);
      uint64_t v23 = objc_msgSend_numberWithInt_(NSNumber, v21, v6, v22);
      int v40 = 138412546;
      uint64_t v41 = v20;
      __int16 v42 = 2112;
      long long v43 = v23;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Registration failure reason updated from:%@ to:%@", (uint8_t *)&v40, 0x16u);
    }
  }
  self->_int64_t registrationStatus = a3;
  self->_registrationFailureReason = (int)v6;
  p_registrationAlertInfo = (uint64_t *)&self->_registrationAlertInfo;
  if (self->_registrationAlertInfo != v13) {
    objc_storeStrong((id *)&self->_registrationAlertInfo, a5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  int v28 = objc_msgSend_supportsCapability_(WeakRetained, v26, *MEMORY[0x1E4F6E070], v27);

  if (v28) {
    IMSetUserRegistrationFailureIntent();
  }
  id v32 = 0;
  int64_t registrationStatus = self->_registrationStatus;
  if (v6 != -1 && registrationStatus == -1)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v34, self->_registrationFailureReason, v35);
    objc_msgSend_setObject_forKey_(v32, v37, (uint64_t)v36, @"__kIMAccountRegistrationFailedReasonKey");

    int64_t registrationStatus = self->_registrationStatus;
  }
  if (registrationStatus == -1 && objc_msgSend_count((void *)*p_registrationAlertInfo, v29, v30, v31))
  {
    if (!v32) {
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_msgSend_addEntriesFromDictionary_(v32, v29, *p_registrationAlertInfo, v31);
  }
  uint64_t v38 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v38, v39, @"__kIMAccountRegistrationStatusChangedNotification", (uint64_t)self, v32);

LABEL_26:
}

- (void)_updateProfileInfo:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_isEqualToDictionary_(v5, v6, (uint64_t)self->_profile, v7)) {
    goto LABEL_19;
  }
  uint64_t v10 = objc_msgSend_profileValueForKey_(self, v8, @"Region", v9);
  uint64_t v13 = objc_msgSend_profileValueForKey_(self, v11, @"Number", v12);
  uint64_t v17 = objc_msgSend_profileValidationStatus(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_profileValidationErrorReason(self, v18, v19, v20);
  objc_storeStrong((id *)&self->_profile, a3);
  long long v24 = objc_msgSend_profileValueForKey_(self, v22, *MEMORY[0x1E4F6C768], v23);
  self->_profileStatus = (int)objc_msgSend_intValue(v24, v25, v26, v27);

  id v32 = objc_msgSend_profileValueForKey_(self, v28, @"Region", v29);
  if (v32 == v10)
  {
  }
  else
  {
    uint64_t v33 = objc_msgSend_profileValueForKey_(self, v30, @"Region", v31);
    int isEqualToString = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v10, v35);

    if (!isEqualToString)
    {
LABEL_8:
      uint64_t v47 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v37, v38, v39);
      objc_msgSend___mainThreadPostNotificationName_object_(v47, v48, @"__kIMAccountProfileChangedNotification", (uint64_t)self);

      goto LABEL_10;
    }
  }
  __int16 v42 = objc_msgSend_profileValueForKey_(self, v37, @"Number", v39);
  if (v42 != v13)
  {
    long long v43 = objc_msgSend_profileValueForKey_(self, v40, @"Number", v41);
    char v46 = objc_msgSend_isEqualToString_(v43, v44, (uint64_t)v13, v45);

    if (v46) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

LABEL_10:
  if (objc_msgSend_profileValidationStatus(self, v37, v38, v39) != v17
    || objc_msgSend_profileValidationErrorReason(self, v49, v50, v51) != v21)
  {
    countryCode = self->_countryCode;
    self->_countryCode = 0;

    uint64_t v56 = objc_msgSend_profileValidationStatus(self, v53, v54, v55);
    uint64_t v60 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v57, v58, v59);
    uint64_t v61 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v62 = NSNumber;
    uint64_t v66 = objc_msgSend_profileValidationStatus(self, v63, v64, v65);
    v69 = objc_msgSend_numberWithInteger_(v62, v67, v66, v68);
    v75 = objc_msgSend_numberWithInteger_(NSNumber, v70, v17, v71);
    if (v56 == -1)
    {
      uint64_t v77 = NSNumber;
      uint64_t v78 = objc_msgSend_profileValidationErrorReason(self, v72, v73, v74);
      uint64_t v76 = objc_msgSend_numberWithInteger_(v77, v79, v78, v80);
      objc_msgSend_dictionaryWithObjectsAndKeys_(v61, v81, (uint64_t)v69, v82, @"__kIMAccountNewStatusKey", v75, @"__kIMAccountOldStatusKey", v76, @"__kIMAccountProfileValidationStatusFailedReasonKey", 0);
    }
    else
    {
      uint64_t v76 = 0;
      objc_msgSend_dictionaryWithObjectsAndKeys_(v61, v72, (uint64_t)v69, v74, @"__kIMAccountNewStatusKey", v75, @"__kIMAccountOldStatusKey", 0, @"__kIMAccountProfileValidationStatusFailedReasonKey", 0);
    v83 = };
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v60, v84, @"__kIMAccountProfileValidationStatusChangedNotification", (uint64_t)self, v83);

    if (v56 == -1) {
  }
    }

LABEL_19:
}

- (id)profileValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(self->_profileChanges, v5, (uint64_t)v4, v6);
  uint64_t v10 = v7;
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    objc_msgSend_objectForKey_(self->_profile, v8, (uint64_t)v4, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v11;

  return v12;
}

- (int64_t)profileValidationStatus
{
  if (objc_msgSend_accountType(self, a2, v2, v3) == 2) {
    return 3;
  }
  else {
    return self->_profileStatus;
  }
}

- (int64_t)accountType
{
  int64_t result = self->_accountType;
  if (result < 0)
  {
    uint64_t v6 = objc_msgSend_login(self, a2, v2, v3);
    uint64_t v9 = objc_msgSend_rangeOfString_(v6, v7, @"P:", v8);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = objc_msgSend_service(self, v10, v11, v12);
      unsigned int v17 = objc_msgSend_supportsAuthorization(v13, v14, v15, v16);

      int64_t result = v17;
    }
    else
    {
      int64_t result = 2;
    }
    self->_accountType = result;
  }
  return result;
}

- (int64_t)profileValidationErrorReason
{
  uint64_t v3 = objc_msgSend_profileValueForKey_(self, a2, *MEMORY[0x1E4F6C760], v2);
  int64_t v7 = (int)objc_msgSend_intValue(v3, v4, v5, v6);

  return v7;
}

- (void)_updateLogin:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  uint64_t v13 = v5;
  if (self->_loginID != v5)
  {
    self->_accountType = -1;
    objc_storeStrong((id *)&self->_loginID, a3);
    objc_msgSend__stripFZIDPrefix(self->_loginID, v8, v9, v10);
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    strippedLogin = self->_strippedLogin;
    self->_strippedLogin = v11;
  }
  objc_msgSend__refreshLoginIMHandle(self, (const char *)v5, v6, v7);
}

- (void)hookupToDaemon
{
  objc_msgSend__refreshLoginIMHandle(self, a2, v2, v3);
  self->_syncedWithRemoteBuddyList = 0;
  objc_msgSend_requestGroups(self, v5, v6, v7);

  objc_msgSend_syncWithRemoteBuddies(self, v8, v9, v10);
}

- (void)_refreshLoginIMHandle
{
  objc_msgSend_login(self, a2, v2, v3);
  uint64_t v5 = (const char *)objc_claimAutoreleasedReturnValue();
  loginIMHandle = self->_loginIMHandle;
  uint64_t v56 = (char *)v5;
  if (v5)
  {
    if (loginIMHandle)
    {
      uint64_t v9 = objc_msgSend_ID(loginIMHandle, v5, v6, v7);
      char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v9, v10, (uint64_t)v56, v11);

      if (isEqualToIgnoringCase) {
        goto LABEL_14;
      }
      loginIMHandle = self->_loginIMHandle;
    }
  }
  else if (!loginIMHandle)
  {
    goto LABEL_14;
  }
  uint64_t v13 = loginIMHandle;
  uint64_t v14 = self->_loginIMHandle;
  self->_loginIMHandle = 0;

  if (v13)
  {
    uint64_t v18 = objc_msgSend_me(IMMe, v15, v16, v17);
    objc_msgSend_removeLoginIMHandle_(v18, v19, (uint64_t)v13, v20);

    objc_msgSend_resetCNContact(v13, v21, v22, v23);
  }
  if (v56)
  {
    objc_msgSend_imHandleWithID_(self, v15, (uint64_t)v56, v17);
    long long v24 = (IMHandle *)objc_claimAutoreleasedReturnValue();
    long long v25 = self->_loginIMHandle;
    self->_loginIMHandle = v24;

    uint64_t v29 = objc_msgSend_me(IMMe, v26, v27, v28);
    int v32 = objc_msgSend_addLoginIMHandle_(v29, v30, (uint64_t)self->_loginIMHandle, v31);

    if (v32)
    {
      uint64_t v36 = objc_msgSend_me(IMMe, v33, v34, v35);
      int v40 = objc_msgSend_cnContact(v36, v37, v38, v39);

      char v46 = objc_msgSend_cnContactWithKeys_(self->_loginIMHandle, v41, MEMORY[0x1E4F1CBF0], v42);
      if (v40 != v46)
      {
        uint64_t v47 = objc_msgSend_sharedInstance(IMHandleRegistrar, v43, v44, v45);
        uint64_t v48 = self->_loginIMHandle;
        uint64_t v52 = objc_msgSend_identifier(v46, v49, v50, v51);
        objc_msgSend_removeHandleFromCNIDMap_withCNID_(v47, v53, (uint64_t)v48, (uint64_t)v52);

        objc_msgSend_updateCNContact_(self->_loginIMHandle, v54, (uint64_t)v40, v55);
      }
    }
  }

LABEL_14:
}

- (NSString)login
{
  return self->_loginID;
}

- (BOOL)_updateDisplayName:(id)a3
{
  uint64_t v7 = (NSString *)a3;
  displayName = self->_displayName;
  if (displayName != v7
    && (objc_msgSend_isEqualToString_(displayName, v5, (uint64_t)v7, v6) & 1) == 0
    && (objc_msgSend__appearsToBeDSID(v7, v9, v10, v11) & 1) == 0)
  {
    if (!objc_msgSend_length(v7, v12, v13, v14)
      || objc_msgSend_validationStatusForAlias_(self, v17, (uint64_t)v7, v18) == 3
      || (objc_msgSend_supportsRegistration(self, v19, v20, v21) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayName, a3);
      uint64_t v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28, v29);
      objc_msgSend___mainThreadPostNotificationName_object_(v30, v31, @"__kIMAccountDisplayNameChangedNotification", (uint64_t)self);

      BOOL v15 = 1;
      goto LABEL_5;
    }
    long long v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v22, v23, v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB7410((uint64_t)v7, self, v25, v26);
    }
  }
  BOOL v15 = 0;
LABEL_5:

  return v15;
}

- (void)_invalidateCachedAliases
{
  self->_aliases = 0;
  MEMORY[0x1F41817F8]();
}

- (void)setIsActive:(BOOL)a3
{
  self->_int isActive = a3;
  if (a3)
  {
    uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, v3);
    objc_msgSend___mainThreadPostNotificationName_object_(v7, v5, @"__kIMAccountActivatedNotification", (uint64_t)self);
  }
  else
  {
    uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, v3);
    objc_msgSend___mainThreadPostNotificationName_object_(v7, v6, @"__kIMAccountDeactivatedNotification", (uint64_t)self);
  }
}

- (void)accountDidBecomeActive
{
  objc_msgSend_loginIfActiveRegistered(self, a2, v2, v3);

  MEMORY[0x1F4181798](self, sel_hookupToDaemon, v5, v6);
}

- (void)loginIfActiveRegistered
{
  if (!objc_msgSend_loginStatus(self, a2, v2, v3)
    && objc_msgSend_registrationStatus(self, v5, v6, v7) == 5
    && objc_msgSend_isActive(self, v8, v9, v10))
  {
    MEMORY[0x1F4181798](self, sel_setIMAccountLoginStatus_errorMessage_, 4, 0);
  }
}

- (int64_t)registrationStatus
{
  if (!objc_msgSend_supportsRegistration(self, a2, v2, v3)) {
    return 0;
  }
  int isActive = objc_msgSend_isActive(self, v5, v6, v7);
  if (self->_registrationStatus < 5) {
    int v9 = 1;
  }
  else {
    int v9 = isActive;
  }
  if (v9) {
    return self->_registrationStatus;
  }
  else {
    return 1;
  }
}

- (BOOL)supportsRegistration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  char v6 = objc_msgSend_supportsRegistration(WeakRetained, v3, v4, v5);

  return v6;
}

- (unint64_t)loginStatus
{
  return self->_loginStatus;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (unint64_t)myStatus
{
  return self->_myStatus;
}

- (id)imHandleWithID:(id)a3
{
  return (id)objc_msgSend_imHandleWithID_alreadyCanonical_(self, a2, (uint64_t)a3, 0);
}

- (IMAccount)initWithUniqueID:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v75.receiver = self;
  v75.super_class = (Class)IMAccount;
  int v9 = [(IMAccount *)&v75 init];
  if (v9)
  {
    uint64_t v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v9->_lock;
    v9->_lock = v10;

    uint64_t v12 = objc_alloc_init(IMPeople);
    buddyList = v9->_buddyList;
    v9->_buddyList = v12;

    uint64_t v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    accountPreferences = v9->_accountPreferences;
    v9->_accountPreferences = v14;

    objc_storeStrong((id *)&v9->_uniqueID, a3);
    objc_storeWeak((id *)&v9->_service, v8);
    uint64_t v19 = objc_msgSend_serviceProperties(v8, v16, v17, v18);
    uint64_t v22 = objc_msgSend_objectForKey_(v19, v20, *MEMORY[0x1E4F6C0A8], v21);
    v9->_useMeCardName = objc_msgSend_intValue(v22, v23, v24, v25) != 0;

    uint64_t v26 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28B18]);
    myProfile = v9->_myProfile;
    v9->_myProfile = v26;

    objc_msgSend_clearServiceCaches(v9, v28, v29, v30);
    objc_msgSend_syncWithRemoteBuddies(v9, v31, v32, v33);
    uint64_t v37 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v34, v35, v36);
    objc_msgSend_addListener_(v37, v38, (uint64_t)v9, v39);

    long long v43 = objc_msgSend_service(v9, v40, v41, v42);

    if (v43)
    {
      uint64_t v47 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v44, v45, v46);
      uint64_t v51 = objc_msgSend_service(v9, v48, v49, v50);
      objc_msgSend_addObserver_selector_name_object_(v47, v52, (uint64_t)v9, (uint64_t)sel__serviceDidConnect_, @"__k_IMServiceDidConnectNotification", v51);

      uint64_t v56 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v53, v54, v55);
      uint64_t v60 = objc_msgSend_service(v9, v57, v58, v59);
      objc_msgSend_addObserver_selector_name_object_(v56, v61, (uint64_t)v9, (uint64_t)sel__serviceDidReconnect_, @"ServiceDidReconnect", v60);

      uint64_t v65 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v62, v63, v64);
      v69 = objc_msgSend_service(v9, v66, v67, v68);
      objc_msgSend_addObserver_selector_name_object_(v65, v70, (uint64_t)v9, (uint64_t)sel__serviceDidDisconnect_, @"ServiceDidDisconnect", v69);
    }
    objc_msgSend_registerAsIDSIDQueryControllerDelegate(v9, v44, v45, v46);
    if (qword_1EB3F23A0 != -1) {
      dispatch_once(&qword_1EB3F23A0, &unk_1EF8E51B8);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4B32A64;
    block[3] = &unk_1E5B7ACD0;
    uint64_t v74 = v9;
    dispatch_block_t v71 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
    dispatch_async((dispatch_queue_t)qword_1EB3F2390, v71);
  }
  return v9;
}

- (void)syncWithRemoteBuddies
{
  self->_hasReceivedSync = 1;
}

- (void)registerAsIDSIDQueryControllerDelegate
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_service(self, a2, v2, v3);
  char v6 = sub_1A4B330DC(v5);

  if (v6)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = objc_msgSend_uniqueID(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_stringWithFormat_(v10, v12, @"IMAccount+KeyTransparency-%@", v13, v11);
    objc_msgSend_setKeyTransparencyIDQueryListenerID_(self, v15, (uint64_t)v14, v16);

    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = objc_msgSend_keyTransparencyIDQueryListenerID(self, v21, v22, v23);
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v24;
        __int16 v33 = 2112;
        uint64_t v34 = self;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Adding IDSIDQueryControllerDelegate with listenerID %@ for %@", buf, 0x16u);
      }
    }
    uint64_t v25 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6AB38], v17, v18, v19);
    uint64_t v29 = objc_msgSend_keyTransparencyIDQueryListenerID(self, v26, v27, v28);
    objc_msgSend_addDelegate_forService_listenerID_queue_(v25, v30, (uint64_t)self, (uint64_t)v6, v29, MEMORY[0x1E4F14428]);
  }
}

- (void)clearServiceCaches
{
  IMLogBacktrace();
  objc_msgSend_lock(self->_lock, v3, v4, v5);
  id v6 = objc_alloc(MEMORY[0x1E4F28E10]);
  uint64_t v8 = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v6, v7, 0x10000, 5, 0);
  imHandles = self->_imHandles;
  self->_imHandles = v8;

  objc_msgSend_unlock(self->_lock, v10, v11, v12);
  unint64_t loginStatus = self->_loginStatus;
  if (loginStatus)
  {
    self->_unint64_t loginStatus = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_msgSend_statusChangedForAccount_from_to_(WeakRetained, v15, (uint64_t)self, loginStatus, self->_loginStatus);
  }
  sortOrders = self->_sortOrders;
  self->_sortOrders = 0;
}

- (IMHandle)loginIMHandle
{
  return self->_loginIMHandle;
}

- (void)_serviceDidConnect:(id)a3
{
}

- (void)setKeyTransparencyIDQueryListenerID:(id)a3
{
}

- (int64_t)registrationFailureReason
{
  if (objc_msgSend_supportsRegistration(self, a2, v2, v3)) {
    return self->_registrationFailureReason;
  }
  else {
    return -1;
  }
}

- (NSString)myStatusMessage
{
  return self->_myStatusMessage;
}

- (NSData)myPictureData
{
  return self->_myPictureData;
}

- (NSString)myNowPlayingString
{
  return (NSString *)objc_msgSend_objectForKey_(self->_myNowPlaying, a2, *MEMORY[0x1E4F6C578], v2);
}

- (NSDate)myIdleSince
{
  return self->_myIdleSince;
}

- (NSString)keyTransparencyIDQueryListenerID
{
  return self->_keyTransparencyIDQueryListenerID;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMHandleRegistrar, a2, v2, v3);
  objc_msgSend__dumpOutAllIMHandlesForAccount_(v5, v6, (uint64_t)self, v7);

  objc_msgSend_deregisterAsIDSIDQueryControllerDelegate(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v11, v12, v13);
  objc_msgSend_removeListener_(v14, v15, (uint64_t)self, v16);

  uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
  objc_msgSend_removeObserver_name_object_(v20, v21, (uint64_t)self, 0, 0);

  objc_msgSend_lock(self->_lock, v22, v23, v24);
  imHandles = self->_imHandles;
  self->_imHandles = 0;

  data = self->_data;
  self->_data = 0;

  objc_msgSend_unlock(self->_lock, v27, v28, v29);
  v30.receiver = self;
  v30.super_class = (Class)IMAccount;
  [(IMAccount *)&v30 dealloc];
}

- (IMAccount)initWithService:(id)a3
{
  return (IMAccount *)objc_msgSend_initWithUniqueID_service_(self, a2, 0, (uint64_t)a3);
}

- (void)_loginWithAutoLogin:(BOOL)a3
{
  BOOL v4 = a3;
  id v6 = objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  int v10 = *MEMORY[0x1E4F6C528] & objc_msgSend_capabilities(v6, v7, v8, v9);

  if (v10)
  {
    unint64_t v14 = objc_msgSend_loginStatus(self, v11, v12, v13);
    if (objc_msgSend_isActive(self, v15, v16, v17))
    {
      if (v14 <= 3)
      {
        objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = objc_msgSend_uniqueID(self, v21, v22, v23);
        if (v4) {
          objc_msgSend_autoLoginAccount_(v27, v24, (uint64_t)v26, v25);
        }
        else {
          objc_msgSend_loginAccount_(v27, v24, (uint64_t)v26, v25);
        }
      }
    }
  }
}

- (void)autoLoginAccount
{
}

- (void)loginAccount
{
}

- (void)logoutAccount
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  int v9 = *MEMORY[0x1E4F6C528] & objc_msgSend_capabilities(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
    uint64_t v17 = objc_msgSend_uniqueID(self, v14, v15, v16);
    objc_msgSend_logoutAccount_(v13, v18, v17, v19);

    uint64_t v23 = objc_msgSend_service(self, v20, v21, v22);
    LOBYTE(v17) = objc_msgSend_supportsOfflineTransfers(v23, v24, v25, v26);

    if ((v17 & 1) == 0)
    {
      objc_super v30 = objc_msgSend_sharedInstance(IMFileTransferCenter, v27, v28, v29);
      __int16 v33 = objc_msgSend_transfersForAccount_(v30, v31, (uint64_t)self, v32);

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v34 = v33;
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v53, (uint64_t)v57, 16);
      if (v36)
      {
        uint64_t v40 = v36;
        uint64_t v41 = *(void *)v54;
        do
        {
          uint64_t v42 = 0;
          do
          {
            if (*(void *)v54 != v41) {
              objc_enumerationMutation(v34);
            }
            long long v43 = *(void **)(*((void *)&v53 + 1) + 8 * v42);
            uint64_t v44 = objc_msgSend_sharedInstance(IMFileTransferCenter, v37, v38, v39, (void)v53);
            uint64_t v48 = objc_msgSend_guid(v43, v45, v46, v47);
            objc_msgSend_stopTransfer_(v44, v49, (uint64_t)v48, v50);

            ++v42;
          }
          while (v40 != v42);
          uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v53, (uint64_t)v57, 16);
        }
        while (v40);
      }
    }
    if ((unint64_t)objc_msgSend_loginStatus(self, v27, v28, v29, (void)v53) >= 3) {
      objc_msgSend_setIMAccountLoginStatus_(self, v51, 0, v52);
    }
  }
}

- (void)loginStatusChanged:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6
{
  objc_msgSend_setIMAccountLoginStatus_errorMessage_reason_(self, a2, a3, (uint64_t)a4, *(void *)&a5, a6);

  objc_msgSend_setIMAccountLoginStatus_(self, v8, a3, v9);
}

- (void)setLogin:(id)a3
{
  id v18 = a3;
  if (objc_msgSend_accountType(self, v4, v5, v6) != 2)
  {
    int v10 = objc_msgSend_service(self, v7, v8, v9);
    int v14 = objc_msgSend_supportsAuthorization(v10, v11, v12, v13);

    if (v14)
    {
      uint64_t v15 = MEMORY[0x1A62639E0](v18);

      IMGenerateLoginID();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend__setString_forKey_(self, (const char *)v18, (uint64_t)v18, *MEMORY[0x1E4F6C738]);
    objc_msgSend__updateLogin_(self, v16, (uint64_t)v18, v17);
  }
}

- (void)_updateMyStatus:(unint64_t)a3 message:(id)a4
{
  id v7 = a4;
  uint64_t v11 = v7;
  if (!v7 || objc_msgSend_isEqualToString_(v7, v8, (uint64_t)self->_myStatusMessage, v10))
  {
    p_myStatus = &self->_myStatus;
    if (self->_myStatus == a3) {
      goto LABEL_13;
    }
    int v13 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_myStatusMessage, a4);
  p_myStatus = &self->_myStatus;
  int v13 = 1;
  if (self->_myStatus != a3)
  {
LABEL_7:
    int v14 = v13;
    unint64_t *p_myStatus = a3;
    LOBYTE(v13) = 0;
    goto LABEL_8;
  }
  int v14 = 1;
LABEL_8:
  uint64_t v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
  objc_msgSend___mainThreadPostNotificationName_object_(v15, v16, @"__kIMMeStatusChangedNotification", (uint64_t)self);

  if (v13)
  {
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
  objc_msgSend___mainThreadPostNotificationName_object_(v20, v21, @"__kIMAccountStatusChangedNotification", (uint64_t)self);

  if (v14)
  {
LABEL_12:
    uint64_t v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
    objc_msgSend___mainThreadPostNotificationName_object_(v22, v23, @"__kIMAccountStatusMessageChangedNotification", (uint64_t)self);
  }
LABEL_13:
}

- (void)setUniqueID:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  uniqueID = self->_uniqueID;
  p_uniqueID = &self->_uniqueID;
  if (uniqueID != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_uniqueID, a3);
    uint64_t v5 = v8;
  }
}

- (NSString)shortName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v6 = objc_msgSend_shortName(WeakRetained, v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)internalName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v6 = objc_msgSend_internalName(WeakRetained, v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)name
{
  if (self->_useMeCardName)
  {
    uint64_t v4 = objc_msgSend_me(IMMe, a2, v2, v3);
    uint64_t v8 = objc_msgSend_fullName(v4, v5, v6, v7);
  }
  else
  {
    uint64_t v8 = objc_msgSend_accountDescription(self, a2, v2, v3);
  }

  return (NSString *)v8;
}

- (BOOL)equalID:(id)a3 andID:(id)a4
{
  p_service = &self->_service;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_service);
  char v10 = objc_msgSend_equalID_andID_(WeakRetained, v9, (uint64_t)v7, (uint64_t)v6);

  return v10;
}

- (void)writeSettings
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  uint64_t v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7);
  uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_accountForUniqueID_(v8, v13, (uint64_t)v12, v14);

  if (!v15)
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMAccountController, v16, v17, v18);
    objc_msgSend_addAccount_(v19, v20, (uint64_t)self, v21);
  }
  if (objc_msgSend_count(self->_profileChanges, v16, v17, v18))
  {
    uint64_t v25 = objc_msgSend_profileInfo(self, v22, v23, v24);
    objc_msgSend__setObject_forKey_(self, v26, (uint64_t)v25, *MEMORY[0x1E4F6C758]);
  }
  if (objc_msgSend_count(self->_accountPreferencesChanges, v22, v23, v24))
  {
    objc_super v30 = objc_msgSend_accountPreferences(self, v27, v28, v29);
    objc_msgSend__setObject_forKey_(self, v31, (uint64_t)v30, @"AccountPrefs");
  }
  objc_msgSend_dictionary(self, v27, v28, v29);
  uint64_t v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_dataChanges, v33, v34, v35))
  {
    uint64_t v39 = objc_msgSend_sharedInstance(IMDaemonController, v36, v37, v38);
    long long v43 = objc_msgSend_uniqueID(self, v40, v41, v42);
    objc_msgSend_writeAccount_defaults_(v39, v44, (uint64_t)v43, (uint64_t)self->_dataChanges);
  }
  profileChanges = self->_profileChanges;
  self->_profileChanges = 0;

  countryCode = self->_countryCode;
  self->_countryCode = 0;

  accountPreferencesChanges = self->_accountPreferencesChanges;
  self->_accountPreferencesChanges = 0;

  localCache = self->_localCache;
  self->_localCache = 0;

  dataChanges = self->_dataChanges;
  self->_dataChanges = 0;

  data = self->_data;
  self->_data = v32;
  long long v55 = v32;

  objc_msgSend__loadFromDictionary_force_(self, v51, (uint64_t)v55, 1);
  objc_msgSend_unlock(self->_lock, v52, v53, v54);
}

- (void)resetToDefaults
{
  objc_msgSend_setAutoLogin_(self, a2, 1, v2);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend_defaultAccountSettings(WeakRetained, v5, v6, v7);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  localCache = self->_localCache;
  self->_localCache = 0;

  if (objc_msgSend_count(v21, v9, v10, v11))
  {
    dataChanges = self->_dataChanges;
    if (dataChanges)
    {
      objc_msgSend_addEntriesFromDictionary_(dataChanges, v12, (uint64_t)v21, v14);
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v19 = (NSMutableDictionary *)objc_msgSend_initWithDictionary_(v16, v17, (uint64_t)v21, v18);
      uint64_t v20 = self->_dataChanges;
      self->_dataChanges = v19;
    }
  }
  objc_msgSend__invalidateCachedAliases(self, v12, v13, v14);
}

- (BOOL)emailAddressIsID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_emailDomains(self, v5, v6, v7);
  char isEmailAddress_inDomains = objc_msgSend_isEmailAddress_inDomains_(IMService, v9, (uint64_t)v4, (uint64_t)v8);

  return isEmailAddress_inDomains;
}

- (int64_t)compareLoginStatus:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_loginStatus(self, v5, v6, v7);
  unint64_t v12 = objc_msgSend_loginStatus(v4, v9, v10, v11);
  if (v8 == v12)
  {
    int64_t v15 = objc_msgSend_compareAccountNames_(self, v13, (uint64_t)v4, v14);
  }
  else if (v8 > v12)
  {
    int64_t v15 = -1;
  }
  else
  {
    int64_t v15 = 1;
  }

  return v15;
}

- (int64_t)compareAccountNames:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_accountDescription(self, v5, v6, v7);
  unint64_t v12 = objc_msgSend_accountDescription(v4, v9, v10, v11);
  int64_t v17 = objc_msgSend_localizedCaseInsensitiveCompare_(v8, v13, (uint64_t)v12, v14);
  if (!v17) {
    int64_t v17 = objc_msgSend_compareIDs_(self, v15, (uint64_t)v4, v16);
  }

  return v17;
}

- (int64_t)compareStatus:(id)a3
{
  id v4 = a3;
  IMPersonStatus v8 = objc_msgSend_myStatus(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_myStatus(v4, v9, v10, v11);
  int64_t v15 = IMComparePersonStatus(v8, v12);
  if (!v15) {
    int64_t v15 = objc_msgSend_compareAccountNames_(self, v13, (uint64_t)v4, v14);
  }

  return v15;
}

- (int64_t)compareIDs:(id)a3
{
  id v4 = (IMAccount *)a3;
  IMPersonStatus v8 = objc_msgSend_login(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_login(v4, v9, v10, v11);
  int64_t v15 = objc_msgSend_localizedCaseInsensitiveCompare_(v8, v13, (uint64_t)v12, v14);

  int64_t v16 = self > v4;
  if (v15) {
    return v15;
  }
  else {
    return v16;
  }
}

- (int64_t)compareServices:(id)a3
{
  id v4 = a3;
  IMPersonStatus v8 = objc_msgSend_service(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_shortName(v8, v9, v10, v11);
  int64_t v16 = objc_msgSend_service(v4, v13, v14, v15);

  uint64_t v20 = objc_msgSend_shortName(v16, v17, v18, v19);
  int64_t v23 = objc_msgSend_localizedCaseInsensitiveCompare_(v12, v21, (uint64_t)v20, v22);

  return v23;
}

- (BOOL)supportsCapability:(id)a3
{
  return objc_msgSend_supportsCapability_forAlias_simID_(self, a2, (uint64_t)a3, 0, 0);
}

- (BOOL)supportsCapability:(id)a3 forAlias:(id)a4
{
  return objc_msgSend_supportsCapability_forAlias_simID_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (BOOL)supportsCapability:(id)a3 forAlias:(id)a4 simID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_service(self, v11, v12, v13);
  int v17 = objc_msgSend_supportsCapability_(v14, v15, (uint64_t)v8, v16);

  if (v17)
  {
    if (objc_msgSend__hasSuppressionForCapability_(self, v18, (uint64_t)v8, v19))
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
      int64_t v23 = objc_msgSend_objectForKey_(self, v20, *MEMORY[0x1E4F6E138], v21);
      uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v8, v25);
      uint64_t v29 = objc_msgSend_setWithArray_(v22, v27, (uint64_t)v26, v28);

      objc_super v30 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v33 = objc_msgSend_objectForKey_(self, v31, *MEMORY[0x1E4F6E140], v32);
      uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v8, v35);
      uint64_t v39 = objc_msgSend_setWithArray_(v30, v37, (uint64_t)v36, v38);

      uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v44 = objc_msgSend_aliases(self, v41, v42, v43);
      uint64_t v47 = objc_msgSend_setWithArray_(v40, v45, (uint64_t)v44, v46);

      BOOL v52 = (objc_msgSend_isSubsetOfSet_(v47, v48, (uint64_t)v29, v49) & 1) == 0
         && (!v9 || (objc_msgSend_containsObject_(v29, v50, (uint64_t)v9, v51) & 1) == 0)
         && (!v10 || (objc_msgSend_containsObject_(v39, v50, (uint64_t)v10, v51) & 1) == 0);
    }
    else
    {
      BOOL v52 = 1;
    }
  }
  else
  {
    BOOL v52 = 0;
  }

  return v52;
}

- (BOOL)_hasSuppressionForCapability:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F6E138];
  id v5 = a3;
  id v8 = objc_msgSend_objectForKey_(self, v6, v4, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v5, v10);

  uint64_t v14 = objc_msgSend_objectForKey_(self, v12, *MEMORY[0x1E4F6E140], v13);
  int v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v5, v16);

  if (objc_msgSend_count(v11, v18, v19, v20)) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = objc_msgSend_count(v17, v21, v22, v23) != 0;
  }

  return v24;
}

- (BOOL)handlesChatInvites
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  char v6 = objc_msgSend_handlesChatInvites(WeakRetained, v3, v4, v5);

  return v6;
}

- (NSString)password
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_login(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_canonicalFormOfID_(self, v8, (uint64_t)v7, v9);
  uint64_t v14 = objc_msgSend_internalName(self, v11, v12, v13);
  uint64_t v16 = objc_msgSend_passwordForAccount_forServiceName_(v3, v15, (uint64_t)v10, (uint64_t)v14);

  return (NSString *)v16;
}

- (void)setPassword:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    int v46 = 138412290;
    uint64_t v47 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to set password for account: %@", (uint8_t *)&v46, 0xCu);
  }
  if (objc_msgSend_length(v4, v13, v14, v15))
  {
    uint64_t v19 = objc_opt_class();
    uint64_t v23 = objc_msgSend_login(self, v20, v21, v22);
    uint64_t v26 = objc_msgSend_canonicalFormOfID_(self, v24, (uint64_t)v23, v25);
    objc_super v30 = objc_msgSend_authorizationID(self, v27, v28, v29);
    uint64_t v34 = objc_msgSend_internalName(self, v31, v32, v33);
    objc_msgSend_setPassword_forAccount_forAuthID_forServiceName_(v19, v35, (uint64_t)v4, (uint64_t)v26, v30, v34);

    uint64_t v39 = objc_msgSend_sharedInstance(IMDaemonController, v36, v37, v38);
    uint64_t v43 = objc_msgSend_uniqueID(self, v40, v41, v42);
    objc_msgSend_passwordUpdatedAccount_(v39, v44, (uint64_t)v43, v45);
  }
  else
  {
    objc_msgSend_removePassword(self, v16, v17, v18);
  }
}

+ (id)passwordForAccount:(id)a3 forServiceName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9))
  {
    IMGetKeychainPassword();
    id v10 = 0;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)setPassword:(id)a3 forAccount:(id)a4 forAuthID:(id)a5 forServiceName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_msgSend_length(v10, v13, v14, v15) && objc_msgSend_length(v9, v16, v17, v18))
  {
    IMSetKeychainPassword();
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61760], v20, v21, v22);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1A4B577E4;
    v26[3] = &unk_1E5B7B800;
    dispatch_semaphore_t v27 = v19;
    BOOL v24 = v19;
    objc_msgSend_setPasswordForProfileID_username_service_password_outRequestID_completionBlock_(v23, v25, (uint64_t)v11, (uint64_t)v10, v12, v9, 0, v26);

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)removePassword
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend_uniqueID(self, v6, v7, v8);
    int v23 = 138412290;
    BOOL v24 = v9;
    _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_DEFAULT, "Client request to remove password for account: %@", (uint8_t *)&v23, 0xCu);
  }
  id v10 = objc_opt_class();
  uint64_t v14 = objc_msgSend_login(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_canonicalFormOfID_(self, v15, (uint64_t)v14, v16);
  uint64_t v21 = objc_msgSend_internalName(self, v18, v19, v20);
  objc_msgSend_removePasswordForAccount_forServiceName_(v10, v22, (uint64_t)v17, (uint64_t)v21);
}

+ (void)removePasswordForAccount:(id)a3 forServiceName:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (objc_msgSend_length(v9, v6, v7, v8)) {
    IMRemoveKeychainPassword();
  }
}

- (NSString)temporaryPassword
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_login(self, v4, v5, v6);
  id v10 = objc_msgSend_canonicalFormOfID_(self, v8, (uint64_t)v7, v9);
  uint64_t v14 = objc_msgSend_authorizationID(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_internalName(self, v15, v16, v17);
  uint64_t v20 = objc_msgSend_temporaryPasswordForAccount_forAuthID_forServiceName_(v3, v19, (uint64_t)v10, (uint64_t)v14, v18);

  return (NSString *)v20;
}

- (void)setTemporaryPassword:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    int v46 = 138412290;
    uint64_t v47 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to set temporary password for account: %@", (uint8_t *)&v46, 0xCu);
  }
  if (objc_msgSend_length(v4, v13, v14, v15))
  {
    uint64_t v19 = objc_opt_class();
    int v23 = objc_msgSend_login(self, v20, v21, v22);
    uint64_t v26 = objc_msgSend_canonicalFormOfID_(self, v24, (uint64_t)v23, v25);
    objc_super v30 = objc_msgSend_authorizationID(self, v27, v28, v29);
    uint64_t v34 = objc_msgSend_internalName(self, v31, v32, v33);
    objc_msgSend_setTemporaryPassword_forAccount_forAuthID_forServiceName_(v19, v35, (uint64_t)v4, (uint64_t)v26, v30, v34);

    uint64_t v39 = objc_msgSend_sharedInstance(IMDaemonController, v36, v37, v38);
    uint64_t v43 = objc_msgSend_uniqueID(self, v40, v41, v42);
    objc_msgSend_passwordUpdatedAccount_(v39, v44, (uint64_t)v43, v45);
  }
  else
  {
    objc_msgSend_removeTemporaryPassword(self, v16, v17, v18);
  }
}

+ (id)temporaryPasswordForAccount:(id)a3 forAuthID:(id)a4 forServiceName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1A4B3445C;
  uint64_t v29 = sub_1A4B34314;
  id v30 = 0;
  if (objc_msgSend_length(v7, v10, v11, v12))
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61760], v14, v15, v16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1A4B57EA8;
    v22[3] = &unk_1E5B7B828;
    uint64_t v18 = v13;
    int v23 = v18;
    BOOL v24 = &v25;
    objc_msgSend_fetchPasswordForProfileID_username_service_outRequestID_completionBlock_(v17, v19, (uint64_t)v8, (uint64_t)v7, v9, 0, v22);

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v20 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v20;
}

+ (void)setTemporaryPassword:(id)a3 forAccount:(id)a4 forAuthID:(id)a5 forServiceName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_msgSend_length(v10, v13, v14, v15))
  {
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    id v20 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61760], v17, v18, v19);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1A4B580FC;
    v23[3] = &unk_1E5B7B800;
    dispatch_semaphore_t v24 = v16;
    uint64_t v21 = v16;
    objc_msgSend_setPasswordForProfileID_username_service_password_outRequestID_completionBlock_(v20, v22, (uint64_t)v11, (uint64_t)v10, v12, v9, 0, v23);

    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)removeTemporaryPassword
{
  uint64_t v3 = objc_opt_class();
  objc_msgSend_login(self, v4, v5, v6);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = objc_msgSend_canonicalFormOfID_(self, v7, (uint64_t)v15, v8);
  dispatch_semaphore_t v13 = objc_msgSend_internalName(self, v10, v11, v12);
  objc_msgSend_removeTemporaryPasswordForAccount_forServiceName_(v3, v14, (uint64_t)v9, (uint64_t)v13);
}

+ (void)removeTemporaryPasswordForAccount:(id)a3 forServiceName:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (objc_msgSend_length(v9, v6, v7, v8)) {
    IMRemoveTemporaryKeychainPassword();
  }
}

- (void)setInvisible:(BOOL)a3
{
  BOOL v4 = a3;
  if (objc_msgSend_isInvisible(self, a2, a3, v3) != a3)
  {
    unint64_t v9 = objc_msgSend_capabilities(self, v6, v7, v8);
    objc_msgSend__setBool_forKey_(self, v10, (v9 >> 38) & v4, *MEMORY[0x1E4F6C4E0]);
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v15, v14, @"__kIMAccountInvisibilityChangedNotification", (uint64_t)self);
  }
}

- (NSString)accountDescription
{
  id v5 = objc_msgSend_service(self, a2, v2, v3);
  int isPersistent = objc_msgSend_isPersistent(v5, v6, v7, v8);

  if (isPersistent)
  {
    uint64_t v13 = objc_msgSend_service(self, v10, v11, v12);
    objc_msgSend_shortName(v13, v14, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
    uint64_t v18 = v17;

    goto LABEL_9;
  }
  uint64_t v19 = *MEMORY[0x1E4F6C700];
  id v20 = objc_msgSend_stringForKey_(self, v10, *MEMORY[0x1E4F6C700], v12);
  uint64_t v24 = objc_msgSend_length(v20, v21, v22, v23);

  if (v24)
  {
    uint64_t v28 = objc_msgSend_stringForKey_(self, v25, v19, v27);
  }
  else
  {
    uint64_t v29 = objc_msgSend_login(self, v25, v26, v27);
    uint64_t v33 = objc_msgSend_length(v29, v30, v31, v32);

    if (!v33)
    {
      uint64_t v13 = objc_msgSend_objectForKey_(self, v34, *MEMORY[0x1E4F6C008], v36);
      if (objc_msgSend_length(v13, v38, v39, v40))
      {
        id v17 = v13;
      }
      else
      {
        objc_msgSend_uniqueID(self, v41, v42, v43);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_3;
    }
    uint64_t v28 = objc_msgSend_login(self, v34, v35, v36);
  }
  uint64_t v18 = (void *)v28;
LABEL_9:

  return (NSString *)v18;
}

- (void)setAccountDescription:(id)a3
{
  id v16 = a3;
  uint64_t v7 = objc_msgSend_login(self, v4, v5, v6);
  if (objc_msgSend_isEqualToString_(v16, v8, (uint64_t)v7, v9))
  {

    objc_msgSend__setString_forKey_(self, v13, 0, *MEMORY[0x1E4F6C700]);
  }
  else
  {
    uint64_t v14 = objc_msgSend_length(v16, v10, v11, v12);

    if (v14) {
      objc_msgSend__setString_forKey_(self, v15, (uint64_t)v16, *MEMORY[0x1E4F6C700]);
    }
    else {
      objc_msgSend__setString_forKey_(self, v15, 0, *MEMORY[0x1E4F6C700]);
    }
  }
}

- (BOOL)hasCustomDescription
{
  uint64_t v3 = objc_msgSend_stringForKey_(self, a2, *MEMORY[0x1E4F6C700], v2);
  BOOL v7 = objc_msgSend_length(v3, v4, v5, v6) != 0;

  return v7;
}

- (BOOL)autoLogin
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6C6D8], v2);
}

- (void)setAutoLogin:(BOOL)a3
{
}

- (BOOL)useSSL
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6C810], v2);
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_uniqueID(self, a2, v2, v3);
  id v10 = objc_msgSend_service(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_login(self, v11, v12, v13);
  if (objc_msgSend_isActive(self, v15, v16, v17)) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  uint64_t v22 = objc_msgSend_loginStatusMessage(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v5, v23, @"IMAccount: %p [ID: %@ Service: %@ Login: %@ Active: %@ LoginStatus: %@]", v24, self, v6, v10, v14, v21, v22);

  return v25;
}

- (id)_serverWithSSL:(BOOL)a3
{
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F6C7D0];
  if (!a3) {
    uint64_t v5 = (uint64_t *)MEMORY[0x1E4F6C7C0];
  }
  uint64_t v6 = objc_msgSend_stringForKey_(self, a2, *v5, v3);
  if (objc_msgSend_length(v6, v7, v8, v9))
  {
    id v13 = v6;
    goto LABEL_11;
  }
  uint64_t v14 = objc_msgSend_login(self, v10, v11, v12);
  uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);

  if (v18)
  {
    uint64_t v22 = objc_msgSend_login(self, v19, v20, v21);
    uint64_t v25 = objc_msgSend_rangeOfString_(v22, v23, @"@", v24);
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v29 = v25 + 1;
      if (v25 + 1 < (unint64_t)objc_msgSend_length(v22, v26, v27, v28))
      {
        objc_msgSend_substringFromIndex_(v22, v30, v29, v31);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)server
{
  uint64_t v5 = objc_msgSend_useSSL(self, a2, v2, v3);

  return (NSString *)MEMORY[0x1F4181798](self, sel__serverWithSSL_, v5, v6);
}

- (int64_t)port
{
  int v5 = objc_msgSend_useSSL(self, a2, v2, v3);
  uint64_t v8 = (uint64_t *)MEMORY[0x1E4F6C7D8];
  if (!v5) {
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F6C7C8];
  }
  uint64_t v9 = *v8;

  return objc_msgSend_integerForKey_(self, v6, v9, v7);
}

- (BOOL)goIdle
{
  return objc_msgSend_blockIdleStatus(self, a2, v2, v3) ^ 1;
}

- (void)setGoIdle:(BOOL)a3
{
}

- (BOOL)allowsVCRelay
{
  uint64_t v4 = *MEMORY[0x1E4F6C720];
  int v5 = objc_msgSend_objectForKey_(self, a2, *MEMORY[0x1E4F6C720], v2);

  if (!v5) {
    objc_msgSend__setBool_forKey_(self, v6, 1, v4);
  }

  return objc_msgSend_BOOLForKey_(self, v6, v4, v7);
}

- (void)setAllowsVCRelay:(BOOL)a3
{
}

- (BOOL)allowsSMSRelay
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6BFB0], v2);
}

- (BOOL)allowsMMSRelay
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6BFA8], v2);
}

- (BOOL)isSMSRelayCapable
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6BFB8], v2);
}

- (BOOL)canActivate
{
  int v5 = objc_msgSend_service(self, a2, v2, v3);
  BOOL v12 = (objc_msgSend_isDiscontinued(v5, v6, v7, v8) & 1) == 0 && objc_msgSend_invalidSettings(self, v9, v10, v11) == 0;

  return v12;
}

- (BOOL)validLogin
{
  int v5 = objc_msgSend_service(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_serviceProperties(v5, v6, v7, v8);
  BOOL v12 = objc_msgSend_objectForKey_(v9, v10, *MEMORY[0x1E4F6C070], v11);
  int v16 = objc_msgSend_intValue(v12, v13, v14, v15);

  if (v16)
  {
    uint64_t v20 = objc_msgSend_login(self, v17, v18, v19);
    uint64_t v23 = objc_msgSend_canonicalFormOfID_(self, v21, (uint64_t)v20, v22);

    uint64_t v27 = objc_msgSend_service(self, v24, v25, v26);
    uint64_t v31 = objc_msgSend_serviceProperties(v27, v28, v29, v30);
    uint64_t v34 = objc_msgSend_objectForKey_(v31, v32, *MEMORY[0x1E4F6C078], v33);
    if (objc_msgSend_intValue(v34, v35, v36, v37))
    {
      if (objc_msgSend_rangeOfString_(v23, v38, @"@", v39) == 0x7FFFFFFFFFFFFFFFLL)
      {

LABEL_9:
        BOOL v42 = 0;
        goto LABEL_10;
      }
      uint64_t v46 = objc_msgSend_rangeOfString_(v23, v40, @"@", v41);

      if (!v46) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    BOOL v42 = objc_msgSend_length(v23, v43, v44, v45) != 0;
LABEL_10:

    return v42;
  }
  return 1;
}

- (BOOL)validPort
{
  int v5 = objc_msgSend_service(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_serviceProperties(v5, v6, v7, v8);
  BOOL v12 = objc_msgSend_objectForKey_(v9, v10, *MEMORY[0x1E4F6C0B8], v11);

  if (objc_msgSend_port(self, v13, v14, v15) < 1 || objc_msgSend_port(self, v16, v17, v18) >= 0xFFFF) {
    int v19 = objc_msgSend_BOOLValue(v12, v16, v17, v18) ^ 1;
  }
  else {
    LOBYTE(v19) = 1;
  }

  return v19;
}

- (BOOL)validServer
{
  int v5 = objc_msgSend_service(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_serviceProperties(v5, v6, v7, v8);
  BOOL v12 = objc_msgSend_objectForKey_(v9, v10, *MEMORY[0x1E4F6C0B0], v11);

  int v16 = objc_msgSend_server(self, v13, v14, v15);
  if ((unint64_t)objc_msgSend_length(v16, v17, v18, v19) > 2
    || (objc_msgSend_BOOLForKey_(self, v20, *MEMORY[0x1E4F6C6D0], v21) & 1) != 0)
  {
    LOBYTE(v25) = 1;
  }
  else
  {
    int v25 = objc_msgSend_BOOLValue(v12, v22, v23, v24) ^ 1;
  }

  return v25;
}

- (BOOL)isManaged
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6C740], v2);
}

- (int64_t)invalidSettings
{
  if (!objc_msgSend_validLogin(self, a2, v2, v3)) {
    return 1;
  }
  if (objc_msgSend_BOOLForKey_(self, v5, *MEMORY[0x1E4F6C6D0], v6)) {
    return 0;
  }
  if (!objc_msgSend_validServer(self, v7, v8, v9)) {
    return 2;
  }
  if (objc_msgSend_validPort(self, v11, v12, v13)) {
    return 0;
  }
  return 3;
}

- (void)requestProperty:(id)a3 ofIMHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestProperty_ofPerson_account_(v12, v11, (uint64_t)v7, (uint64_t)v6, self->_uniqueID);
}

- (void)setValue:(id)a3 ofExtraProperty:(id)a4 ofIMHandle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_ofProperty_ofPerson_account_(v15, v14, (uint64_t)v10, (uint64_t)v9, v8, self->_uniqueID);
}

- (NSDictionary)dictionary
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  id v8 = (id)objc_msgSend_mutableCopy(self->_data, v5, v6, v7);
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (objc_msgSend_count(self->_dataChanges, v12, v13, v14)) {
    objc_msgSend_addEntriesFromDictionary_(v8, v15, (uint64_t)self->_dataChanges, v17);
  }
  uint64_t v18 = objc_msgSend_accountPreferences(self, v15, v16, v17);
  objc_msgSend_setObject_forKey_(v8, v19, (uint64_t)v18, @"AccountPrefs");

  uint64_t v23 = objc_msgSend_profileInfo(self, v20, v21, v22);
  objc_msgSend_setObject_forKey_(v8, v24, (uint64_t)v23, *MEMORY[0x1E4F6C758]);

  return (NSDictionary *)v8;
}

- (NSArray)emailDomains
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v6 = objc_msgSend_emailDomains(WeakRetained, v3, v4, v5);

  return (NSArray *)v6;
}

- (void)setCachedAllowList:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  if ((objc_msgSend_count(self->_cachedAllowList, v5, v6, v7) || objc_msgSend_count(v4, v8, v9, v10))
    && self->_cachedAllowList != v4)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = v4;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = objc_msgSend_canonicalFormOfID_(self, v14, *(void *)(*((void *)&v27 + 1) + 8 * i), v15, (void)v27);
          objc_msgSend_addObject_(v11, v20, (uint64_t)v19, v21);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v16);
    }

    objc_storeStrong((id *)&self->_cachedAllowList, v11);
    int v25 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v22, v23, v24);
    objc_msgSend___mainThreadPostNotificationName_object_(v25, v26, @"__kIMAccountPrivacySettingsChangedNotification", (uint64_t)self);
  }
}

- (void)setCachedBlockList:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  if ((objc_msgSend_count(self->_cachedBlockList, v5, v6, v7) || objc_msgSend_count(v4, v8, v9, v10))
    && self->_cachedBlockList != v4)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = v4;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = objc_msgSend_canonicalFormOfID_(self, v14, *(void *)(*((void *)&v27 + 1) + 8 * i), v15, (void)v27);
          objc_msgSend_addObject_(v11, v20, (uint64_t)v19, v21);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v16);
    }

    objc_storeStrong((id *)&self->_cachedBlockList, v11);
    int v25 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v22, v23, v24);
    objc_msgSend___mainThreadPostNotificationName_object_(v25, v26, @"__kIMAccountPrivacySettingsChangedNotification", (uint64_t)self);
  }
}

- (void)setCachedBlockingMode:(unsigned int)a3
{
  if (self->_cachedBlockingMode != a3)
  {
    self->_cachedBlockingMode = a3;
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, *(uint64_t *)&a3, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v6, v5, @"__kIMAccountPrivacySettingsChangedNotification", (uint64_t)self);
  }
}

- (void)setCachedBlockIdleStatus:(BOOL)a3
{
  if (self->_blockIdleStatus != a3)
  {
    self->_blockIdleStatus = a3;
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v6, v5, @"__kIMAccountPrivacySettingsChangedNotification", (uint64_t)self);
  }
}

- (void)blockMessages:(BOOL)a3 fromID:(id)a4
{
  BOOL v4 = a3;
  objc_msgSend_canonicalFormOfID_(self, a2, (uint64_t)a4, (uint64_t)a4);
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = objc_msgSend_blockingMode(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_blockList(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_allowList(self, v14, v15, v16);
  uint64_t v20 = v17;
  if (v4)
  {
    if (v9 <= 1)
    {
      if ((objc_msgSend_containsObject_(v13, v18, (uint64_t)v57, v19) & 1) == 0)
      {
        if (!v13)
        {
          uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1C978], v21, v22, v23);
        }
        uint64_t v24 = objc_msgSend_arrayByAddingObject_(v13, v21, (uint64_t)v57, v23);
        objc_msgSend_setBlockList_(self, v25, (uint64_t)v24, v26);
      }
      objc_msgSend_setBlockingMode_(self, v21, 3, v23);
      goto LABEL_32;
    }
    if (v9 == 3)
    {
      if (objc_msgSend_containsObject_(v13, v18, (uint64_t)v57, v19)) {
        goto LABEL_32;
      }
      if (!v13)
      {
        uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1C978], v40, v41, v42);
      }
      long long v30 = objc_msgSend_arrayByAddingObject_(v13, v40, (uint64_t)v57, v42);
      objc_msgSend_setBlockList_(self, v43, (uint64_t)v30, v44);
    }
    else
    {
      if (v9 != 2 || !objc_msgSend_containsObject_(v17, v18, (uint64_t)v57, v19)) {
        goto LABEL_32;
      }
      long long v30 = objc_msgSend_mutableCopy(v20, v33, v34, v35);
      objc_msgSend_removeObject_(v30, v36, (uint64_t)v57, v37);
      objc_msgSend_setAllowList_(self, v38, (uint64_t)v30, v39);
    }
LABEL_31:

    goto LABEL_32;
  }
  if (v9 < 2) {
    goto LABEL_32;
  }
  if (v9 != 4)
  {
    if (v9 == 3)
    {
      if (!objc_msgSend_containsObject_(v13, v18, (uint64_t)v57, v19)) {
        goto LABEL_32;
      }
      long long v30 = objc_msgSend_mutableCopy(v13, v50, v51, v52);
      objc_msgSend_removeObject_(v30, v53, (uint64_t)v57, v54);
      objc_msgSend_setBlockList_(self, v55, (uint64_t)v30, v56);
    }
    else
    {
      if (v9 != 2 || (objc_msgSend_containsObject_(v17, v18, (uint64_t)v57, v19) & 1) != 0) {
        goto LABEL_32;
      }
      if (!v20)
      {
        uint64_t v20 = objc_msgSend_array(MEMORY[0x1E4F1C978], v27, v28, v29);
      }
      long long v30 = objc_msgSend_arrayByAddingObject_(v20, v27, (uint64_t)v57, v29);
      objc_msgSend_setAllowList_(self, v31, (uint64_t)v30, v32);
    }
    goto LABEL_31;
  }
  if ((objc_msgSend_containsObject_(v17, v18, (uint64_t)v57, v19) & 1) == 0)
  {
    uint64_t v47 = IMSingleObjectArray();
    objc_msgSend_setAllowList_(self, v48, (uint64_t)v47, v49);
  }
  objc_msgSend_setBlockingMode_(self, v45, 2, v46);
LABEL_32:
}

- (void)setBlockList:(id)a3
{
  id v11 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_setBlockList_account_(v7, v8, (uint64_t)v11, (uint64_t)self->_uniqueID);

  objc_msgSend_setCachedBlockList_(self, v9, (uint64_t)v11, v10);
}

- (NSArray)blockList
{
  cachedBlockList = self->_cachedBlockList;
  if (cachedBlockList)
  {
    uint64_t v5 = cachedBlockList;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E4F1C978], a2, v2, v3);
    uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setAllowList:(id)a3
{
  id v11 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_setAllowList_account_(v7, v8, (uint64_t)v11, (uint64_t)self->_uniqueID);

  objc_msgSend_setCachedAllowList_(self, v9, (uint64_t)v11, v10);
}

- (NSArray)allowList
{
  cachedAllowList = self->_cachedAllowList;
  if (cachedAllowList)
  {
    uint64_t v5 = cachedAllowList;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E4F1C978], a2, v2, v3);
    uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unsigned)blockingMode
{
  return self->_cachedBlockingMode;
}

- (void)setBlockingMode:(unsigned int)a3
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = objc_msgSend_sharedInstance(IMDaemonController, a2, *(uint64_t *)&a3, v3);
  objc_msgSend_setBlockingMode_account_(v6, v7, v4, (uint64_t)self->_uniqueID);

  MEMORY[0x1F4181798](self, sel_setCachedBlockingMode_, v4, v8);
}

- (void)setBlockIdleStatus:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  objc_msgSend_setBlockIdleStatus_account_(v6, v7, v4, (uint64_t)self->_uniqueID);

  MEMORY[0x1F4181798](self, sel_setCachedBlockIdleStatus_, v4, v8);
}

- (BOOL)blockOtherAddresses
{
  return objc_msgSend_BOOLForKey_(self, a2, *MEMORY[0x1E4F6C6E0], v2);
}

- (void)setBlockOtherAddresses:(BOOL)a3
{
  objc_msgSend__setBool_forKey_(self, a2, a3, *MEMORY[0x1E4F6C6E0]);

  objc_msgSend_writeSettings(self, v4, v5, v6);
}

- (void)clearTargetState
{
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel_targetGroupStateTimeout, 0);
  targetGroupState = self->_targetGroupState;
  self->_targetGroupState = 0;
}

- (BOOL)isAwaitingTargetGroupState
{
  return self->_targetGroupState != 0;
}

+ (id)_groupSummaryFromGroupList:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v29;
    uint64_t v11 = *MEMORY[0x1E4F6C4C0];
    uint64_t v12 = *MEMORY[0x1E4F6C4B8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_objectForKey_(v14, v7, v11, v8);
        uint64_t v18 = objc_msgSend_objectForKey_(v14, v16, v12, v17);
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v23 = v19;
        if (v15) {
          objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v15, v11);
        }
        if (objc_msgSend_count(v18, v20, v21, v22)) {
          objc_msgSend_setObject_forKey_(v23, v24, (uint64_t)v18, v12);
        }
        objc_msgSend_addObject_(v4, v24, (uint64_t)v23, v25);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v9);
  }

  return v4;
}

- (BOOL)hasTargetGroupStateBeenMet
{
  id v4 = objc_msgSend__groupSummaryFromGroupList_(IMAccount, a2, (uint64_t)self->_lastReceivedGroupState, v2);
  uint64_t v7 = objc_msgSend__groupSummaryFromGroupList_(IMAccount, v5, (uint64_t)self->_targetGroupState, v6);
  char isEqualToArray = objc_msgSend_isEqualToArray_(v4, v8, (uint64_t)v7, v9);

  return isEqualToArray;
}

- (void)targetGroupStateTimeout
{
  char hasTargetGroupStateBeenMet = objc_msgSend_hasTargetGroupStateBeenMet(self, a2, v2, v3);
  objc_msgSend_clearTargetState(self, v6, v7, v8);
  if ((hasTargetGroupStateBeenMet & 1) == 0)
  {
    lastReceivedGroupState = self->_lastReceivedGroupState;
    objc_msgSend_groupsChanged_error_(self, v9, (uint64_t)lastReceivedGroupState, 0);
  }
}

- (void)setWaitForTargetState
{
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel_targetGroupStateTimeout, 0);

  objc_msgSend_performSelector_withObject_afterDelay_(self, v3, (uint64_t)sel_targetGroupStateTimeout, 0, 120.0);
}

- (void)updateWithTargetGroups
{
}

- (void)setTargetGroupsState:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  if (self->_targetGroupState != v5)
  {
    uint64_t v10 = v5;
    objc_storeStrong((id *)&self->_targetGroupState, a3);
    if (self->_targetGroupState) {
      objc_msgSend_setWaitForTargetState(self, v6, v7, v8);
    }
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v6, (uint64_t)self, (uint64_t)sel_updateWithTargetGroups, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v9, (uint64_t)sel_updateWithTargetGroups, 0, 0.0);
    uint64_t v5 = v10;
  }
}

- (void)_applyChangesToTemporaryCache:(id)a3
{
  uint64_t v376 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  targetGroupState = self->_targetGroupState;
  if (!targetGroupState) {
    targetGroupState = self->_groups;
  }
  id v9 = (id)objc_msgSend_mutableCopy(targetGroupState, v4, v5, v6);
  uint64_t v12 = objc_msgSend_objectForKey_(v7, v10, *MEMORY[0x1E4F6C4C8], v11);
  v289 = self;
  objc_msgSend_clearTargetState(self, v13, v14, v15);
  id v292 = v7;
  v297 = v12;
  if (objc_msgSend_count(v12, v16, v17, v18))
  {
    id v321 = (id)objc_msgSend_mutableCopy(v9, v19, v20, v21);
    long long v363 = 0u;
    long long v364 = 0u;
    long long v365 = 0u;
    long long v366 = 0u;
    objc_msgSend_allKeys(v12, v22, v23, v24);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v363, (uint64_t)v375, 16);
    if (v26)
    {
      uint64_t v30 = v26;
      uint64_t v31 = *(void *)v364;
      uint64_t v32 = *MEMORY[0x1E4F6C4C0];
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v364 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v363 + 1) + 8 * i);
          if (objc_msgSend_count(v9, v27, v28, v29))
          {
            uint64_t v35 = 0;
            while (1)
            {
              uint64_t v36 = objc_msgSend_objectAtIndex_(v9, v27, v35, v29);
              uint64_t v39 = objc_msgSend_objectForKey_(v36, v37, v32, v38);
              int isEqualToString = objc_msgSend_isEqualToString_(v39, v40, v34, v41);

              if (isEqualToString) {
                break;
              }

              if (++v35 >= (unint64_t)objc_msgSend_count(v9, v46, v47, v48)) {
                goto LABEL_15;
              }
            }
            uint64_t v49 = objc_msgSend_mutableCopy(v36, v43, v44, v45);
            uint64_t v52 = objc_msgSend_objectForKey_(v297, v50, v34, v51);
            objc_msgSend_setObject_forKey_(v49, v53, (uint64_t)v52, v32);

            objc_msgSend_replaceObjectAtIndex_withObject_(v321, v54, v35, (uint64_t)v49);
          }
LABEL_15:
          ;
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v363, (uint64_t)v375, 16);
      }
      while (v30);
    }

    if (v321 != v9)
    {
      id v55 = v321;

      id v9 = v55;
    }
    id v7 = v292;
    uint64_t v12 = v297;
  }
  uint64_t v299 = *MEMORY[0x1E4F6C438];
  v295 = objc_msgSend_objectForKey_(v7, v19, *MEMORY[0x1E4F6C438], v21);
  id v301 = (id)objc_msgSend_count(v295, v56, v57, v58);
  if (!v301) {
    goto LABEL_59;
  }
  if (objc_msgSend_count(v9, v59, v60, v61)) {
    id v65 = (id)objc_msgSend_mutableCopy(v9, v62, v63, v64);
  }
  else {
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v66 = v65;

  uint64_t v69 = 0;
  uint64_t v70 = *MEMORY[0x1E4F6C4C0];
  uint64_t v306 = *MEMORY[0x1E4F6C4B8];
  v316 = v9;
  do
  {
    dispatch_block_t v71 = objc_msgSend_objectAtIndex_(v295, v67, v69, v68);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v77 = v71;
      uint64_t v78 = 0;
    }
    else
    {
      objc_msgSend_objectForKey_(v71, v72, v70, v73);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v78 = objc_msgSend_objectForKey_(v71, v79, v306, v80);
    }
    v322 = v71;
    id obja = v78;
    if (objc_msgSend_count(v9, v74, v75, v76))
    {
      unint64_t v83 = 0;
      id v84 = 0;
      do
      {
        objc_msgSend_objectAtIndex_(v9, v81, v83, v82);
        id v85 = (id)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend_objectForKey_(v85, v86, v70, v87);
        int v91 = objc_msgSend_isEqualToString_(v88, v89, (uint64_t)v77, v90);

        if (v91)
        {
          if (v84 != v85)
          {
            uint64_t v95 = objc_msgSend_mutableCopy(v85, v92, v93, v94);

            id v84 = (id)v95;
          }
          objc_msgSend_replaceObjectAtIndex_withObject_(v66, v92, v83, (uint64_t)v84);
        }

        ++v83;
      }
      while (v83 < objc_msgSend_count(v9, v96, v97, v98));
      if (v77)
      {
        uint64_t v78 = obja;
        if (!v84)
        {
LABEL_39:
          id v84 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          objc_msgSend_addObject_(v66, v99, (uint64_t)v84, v100);
        }
        id v311 = (id)v69;
        objc_msgSend_setObject_forKey_(v84, v81, (uint64_t)v77, v70);
        v103 = objc_msgSend_objectForKey_(v84, v101, v306, v102);
        id v107 = (id)objc_msgSend_mutableCopy(v103, v104, v105, v106);

        if (!v107) {
          id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        objc_msgSend_setObject_forKey_(v84, v108, (uint64_t)v107, v306);
        long long v361 = 0u;
        long long v362 = 0u;
        long long v359 = 0u;
        long long v360 = 0u;
        id v109 = v78;
        uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v110, (uint64_t)&v359, (uint64_t)v374, 16);
        if (v111)
        {
          uint64_t v114 = v111;
          uint64_t v115 = *(void *)v360;
          do
          {
            for (uint64_t j = 0; j != v114; ++j)
            {
              if (*(void *)v360 != v115) {
                objc_enumerationMutation(v109);
              }
              uint64_t v117 = *(void *)(*((void *)&v359 + 1) + 8 * j);
              if ((objc_msgSend_containsObject_(v107, v112, v117, v113) & 1) == 0) {
                objc_msgSend_addObject_(v107, v112, v117, v113);
              }
            }
            uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v112, (uint64_t)&v359, (uint64_t)v374, 16);
          }
          while (v114);
        }

        uint64_t v69 = (uint64_t)v311;
        id v9 = v316;
      }
      uint64_t v78 = obja;
      goto LABEL_53;
    }
    if (v77) {
      goto LABEL_39;
    }
    id v84 = 0;
LABEL_53:

    ++v69;
    uint64_t v12 = v297;
  }
  while ((id)v69 != v301);
  if (v66 != v9)
  {
    id v118 = v66;

    id v9 = v118;
  }

  id v7 = v292;
LABEL_59:
  uint64_t v298 = *MEMORY[0x1E4F6C668];
  uint64_t v119 = objc_msgSend_objectForKey_(v7, v59, *MEMORY[0x1E4F6C668], v61);
  v291 = v119;
  if (objc_msgSend_count(v119, v120, v121, v122))
  {
    v317 = v9;
    v126 = objc_msgSend_mutableCopy(v9, v123, v124, v125);
    v130 = objc_msgSend_nonRetainingArray(MEMORY[0x1E4F1CA48], v127, v128, v129);
    long long v355 = 0u;
    long long v356 = 0u;
    long long v357 = 0u;
    long long v358 = 0u;
    id v302 = v119;
    uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v131, (uint64_t)&v355, (uint64_t)v373, 16);
    if (v323)
    {
      uint64_t v307 = *(void *)v356;
      uint64_t v132 = *MEMORY[0x1E4F6C4C0];
      id v312 = v126;
      do
      {
        unint64_t v133 = 0;
        do
        {
          if (*(void *)v356 != v307) {
            objc_enumerationMutation(v302);
          }
          objb = v133;
          uint64_t v134 = *(void *)(*((void *)&v355 + 1) + 8 * (void)v133);
          long long v351 = 0u;
          long long v352 = 0u;
          long long v353 = 0u;
          long long v354 = 0u;
          id v135 = v126;
          uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v136, (uint64_t)&v351, (uint64_t)v372, 16);
          if (v137)
          {
            uint64_t v140 = v137;
            uint64_t v141 = *(void *)v352;
            do
            {
              for (uint64_t k = 0; k != v140; ++k)
              {
                if (*(void *)v352 != v141) {
                  objc_enumerationMutation(v135);
                }
                uint64_t v143 = *(void **)(*((void *)&v351 + 1) + 8 * k);
                uint64_t v144 = objc_msgSend_objectForKey_(v143, v138, v132, v139);
                int v147 = objc_msgSend_isEqualToString_(v144, v145, v134, v146);

                if (v147) {
                  objc_msgSend_addObject_(v130, v138, (uint64_t)v143, v139);
                }
              }
              uint64_t v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v138, (uint64_t)&v351, (uint64_t)v372, 16);
            }
            while (v140);
          }

          unint64_t v133 = objb + 1;
          v126 = v312;
        }
        while (objb + 1 != (char *)v323);
        uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v148, (uint64_t)&v355, (uint64_t)v373, 16);
      }
      while (v323);
    }

    id v9 = v317;
    if (v317 != v126)
    {
      id v149 = v126;

      id v9 = v149;
    }
    uint64_t v119 = v291;
    id v7 = v292;
    uint64_t v12 = v297;
  }
  v290 = objc_msgSend_objectForKey_(v7, v123, *MEMORY[0x1E4F6C670], v125);
  v152 = objc_msgSend_objectForKey_(v290, v150, *MEMORY[0x1E4F6C448], v151);
  v324 = v152;
  if (objc_msgSend_count(v152, v153, v154, v155))
  {
    id v308 = (id)objc_msgSend_mutableCopy(v9, v156, v157, v158);
    uint64_t v162 = objc_msgSend_count(v308, v159, v160, v161);
    long long v347 = 0u;
    long long v348 = 0u;
    long long v349 = 0u;
    long long v350 = 0u;
    objc_msgSend_allKeys(v152, v163, v164, v165);
    id v313 = (id)objc_claimAutoreleasedReturnValue();
    id objc = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v313, v166, (uint64_t)&v347, (uint64_t)v371, 16);
    if (objc)
    {
      uint64_t v169 = v152;
      uint64_t v318 = *(void *)v348;
      uint64_t v170 = *MEMORY[0x1E4F6C4C0];
      id v303 = (id)*MEMORY[0x1E4F6C4B8];
      do
      {
        for (m = 0; m != objc; m = (char *)m + 1)
        {
          if (*(void *)v348 != v318) {
            objc_enumerationMutation(v313);
          }
          v172 = *(void **)(*((void *)&v347 + 1) + 8 * (void)m);
          v175 = objc_msgSend_objectForKey_(v169, v167, (uint64_t)v172, v168);
          if (v175) {
            BOOL v176 = v162 == 0;
          }
          else {
            BOOL v176 = 1;
          }
          if (!v176)
          {
            uint64_t v177 = 0;
            while (1)
            {
              v178 = objc_msgSend_objectAtIndex_(v9, v173, v177, v174);
              v181 = objc_msgSend_objectForKey_(v178, v179, v170, v180);
              char v184 = objc_msgSend_isEqualToString_(v172, v182, (uint64_t)v181, v183);

              if (v184) {
                break;
              }
              if (v162 == ++v177) {
                goto LABEL_95;
              }
            }
            if (v177 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v185 = objc_msgSend_objectAtIndex_(v308, v173, v177, v174);
              uint64_t v189 = objc_msgSend_mutableCopy(v185, v186, v187, v188);

              uint64_t v192 = objc_msgSend_objectForKey_(v324, v190, (uint64_t)v172, v191);
              objc_msgSend_setObject_forKey_(v189, v193, (uint64_t)v192, (uint64_t)v303);

              objc_msgSend_replaceObjectAtIndex_withObject_(v308, v194, v177, (uint64_t)v189);
            }
          }
LABEL_95:

          uint64_t v169 = v324;
        }
        id objc = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v313, v167, (uint64_t)&v347, (uint64_t)v371, 16);
      }
      while (objc);
    }

    if (v9 != v308)
    {
      id v195 = v308;

      id v9 = v195;
    }
    id v7 = v292;
    uint64_t v12 = v297;

    uint64_t v119 = v291;
  }
  v294 = objc_msgSend_objectForKey_(v7, v156, *MEMORY[0x1E4F6C450], v158);
  uint64_t v293 = objc_msgSend_count(v294, v196, v197, v198);
  if (v293)
  {
    id v204 = (id)objc_msgSend_mutableCopy(v9, v199, v200, v201);
    uint64_t v205 = 0;
    uint64_t v206 = *MEMORY[0x1E4F6C4C0];
    uint64_t v319 = *MEMORY[0x1E4F6C4B8];
    id v304 = (id)*MEMORY[0x1E4F6C4C0];
    v309 = v204;
    do
    {
      uint64_t v296 = v205;
      objc_msgSend_objectAtIndex_(v294, v202, v205, v203);
      id objd = (id)objc_claimAutoreleasedReturnValue();
      v209 = objc_msgSend_objectForKey_(objd, v207, v206, v208);
      if (objc_msgSend_count(v9, v210, v211, v212))
      {
        unint64_t v215 = 0;
        id v314 = v209;
        do
        {
          uint64_t v216 = objc_msgSend_objectAtIndex_(v204, v213, v215, v214);
          v219 = objc_msgSend_objectForKey_(v216, v217, v206, v218);
          int v222 = objc_msgSend_isEqualToString_(v209, v220, (uint64_t)v219, v221);

          if (v222)
          {
            v226 = objc_msgSend_mutableCopy(v216, v223, v224, v225);
            v229 = objc_msgSend_objectForKey_(v226, v227, v319, v228);
            id v233 = (id)objc_msgSend_mutableCopy(v229, v230, v231, v232);

            if (!v233) {
              id v233 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v236 = v9;
            long long v345 = 0u;
            long long v346 = 0u;
            long long v343 = 0u;
            long long v344 = 0u;
            v237 = objc_msgSend_objectForKey_(objd, v234, v299, v235);
            uint64_t v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v238, (uint64_t)&v343, (uint64_t)v370, 16);
            if (v239)
            {
              uint64_t v242 = v239;
              uint64_t v243 = *(void *)v344;
              do
              {
                for (uint64_t n = 0; n != v242; ++n)
                {
                  if (*(void *)v344 != v243) {
                    objc_enumerationMutation(v237);
                  }
                  uint64_t v245 = *(void *)(*((void *)&v343 + 1) + 8 * n);
                  if ((objc_msgSend_containsObject_(v233, v240, v245, v241) & 1) == 0) {
                    objc_msgSend_addObject_(v233, v240, v245, v241);
                  }
                }
                uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v240, (uint64_t)&v343, (uint64_t)v370, 16);
              }
              while (v242);
            }

            long long v341 = 0u;
            long long v342 = 0u;
            long long v339 = 0u;
            long long v340 = 0u;
            v248 = objc_msgSend_objectForKey_(objd, v246, v298, v247);
            uint64_t v250 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v249, (uint64_t)&v339, (uint64_t)v369, 16);
            if (v250)
            {
              uint64_t v253 = v250;
              uint64_t v254 = *(void *)v340;
              do
              {
                for (iuint64_t i = 0; ii != v253; ++ii)
                {
                  if (*(void *)v340 != v254) {
                    objc_enumerationMutation(v248);
                  }
                  uint64_t v256 = *(void *)(*((void *)&v339 + 1) + 8 * ii);
                  if (objc_msgSend_containsObject_(v233, v251, v256, v252)) {
                    objc_msgSend_removeObject_(v233, v251, v256, v252);
                  }
                }
                uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v251, (uint64_t)&v339, (uint64_t)v369, 16);
              }
              while (v253);
            }

            objc_msgSend_setObject_forKey_(v226, v257, (uint64_t)v233, v319);
            id v204 = v309;
            objc_msgSend_replaceObjectAtIndex_withObject_(v309, v258, v215, (uint64_t)v226);

            id v9 = v236;
            uint64_t v206 = (uint64_t)v304;
            v209 = v314;
          }

          ++v215;
        }
        while (v215 < objc_msgSend_count(v9, v259, v260, v261));
      }

      uint64_t v205 = v296 + 1;
    }
    while (v296 + 1 != v293);
    if (v9 != v204)
    {
      id v262 = v204;

      id v9 = v262;
      id v204 = v309;
    }
    uint64_t v12 = v297;
    uint64_t v119 = v291;

    id v7 = v292;
  }
  v263 = objc_msgSend_objectForKey_(v290, v199, *MEMORY[0x1E4F6C4D8], v201);
  if (objc_msgSend_count(v263, v264, v265, v266))
  {
    id v269 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v335 = 0u;
    long long v336 = 0u;
    long long v337 = 0u;
    long long v338 = 0u;
    v300 = v263;
    id v305 = v263;
    v315 = (char *)objc_msgSend_countByEnumeratingWithState_objects_count_(v305, v270, (uint64_t)&v335, (uint64_t)v368, 16);
    if (v315)
    {
      uint64_t v310 = *(void *)v336;
      uint64_t v271 = *MEMORY[0x1E4F6C4C0];
      v320 = v9;
      do
      {
        v272 = 0;
        do
        {
          if (*(void *)v336 != v310) {
            objc_enumerationMutation(v305);
          }
          obje = v272;
          uint64_t v273 = *(void *)(*((void *)&v335 + 1) + 8 * (void)v272);
          long long v331 = 0u;
          long long v332 = 0u;
          long long v333 = 0u;
          long long v334 = 0u;
          id v274 = v9;
          uint64_t v276 = objc_msgSend_countByEnumeratingWithState_objects_count_(v274, v275, (uint64_t)&v331, (uint64_t)v367, 16);
          if (v276)
          {
            uint64_t v279 = v276;
            uint64_t v280 = *(void *)v332;
            do
            {
              for (juint64_t j = 0; jj != v279; ++jj)
              {
                if (*(void *)v332 != v280) {
                  objc_enumerationMutation(v274);
                }
                v282 = *(void **)(*((void *)&v331 + 1) + 8 * jj);
                v283 = objc_msgSend_objectForKey_(v282, v277, v271, v278);
                int v286 = objc_msgSend_isEqualToString_(v283, v284, v273, v285);

                if (v286) {
                  objc_msgSend_addObject_(v269, v277, (uint64_t)v282, v278);
                }
              }
              uint64_t v279 = objc_msgSend_countByEnumeratingWithState_objects_count_(v274, v277, (uint64_t)&v331, (uint64_t)v367, 16);
            }
            while (v279);
          }

          v272 = obje + 1;
          id v9 = v320;
        }
        while (obje + 1 != v315);
        v315 = (char *)objc_msgSend_countByEnumeratingWithState_objects_count_(v305, v287, (uint64_t)&v335, (uint64_t)v368, 16);
      }
      while (v315);
    }

    if (v9 != v269)
    {
      id v288 = v269;

      id v9 = v288;
    }
    uint64_t v119 = v291;
    id v7 = v292;
    uint64_t v12 = v297;
    v263 = v300;
  }
  objc_msgSend_setTargetGroupsState_(v289, v267, (uint64_t)v9, v268);
}

- (void)beginChanges
{
  if ((objc_msgSend_makingChanges(self, a2, v2, v3) & 1) == 0)
  {
    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    coalescedChanges = self->_coalescedChanges;
    self->_coalescedChanges = v5;
  }
  ++self->_coalesceCount;
}

- (BOOL)hasSyncedWithRemoteBuddies
{
  return self->_hasReceivedSync;
}

- (void)_markHasSyncedWithRemoteBuddies
{
  self->_hasReceivedSync = 1;
}

- (void)_ensureGroupsExists:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_groupList(self, v7, v8, v9);
        char v17 = objc_msgSend_containsObject_(v14, v15, v13, v16);

        if ((v17 & 1) == 0)
        {
          uint64_t v18 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v7, v13, v9);
          objc_msgSend_changeBuddyList_add_groups_atLocation_(self, v19, 0, 1, v18, -1);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }
}

- (BOOL)addPeople:(id)a3 toGroups:(id)a4 atLocation:(int64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_msgSend__ensureGroupsExists_(self, v10, (uint64_t)v9, v11);
  if ((a5 & 0x8000000000000000) == 0) {
    goto LABEL_2;
  }
  int hasCapability = objc_msgSend_hasCapability_(self, v12, 0x10000000, v13);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v8;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v34, (uint64_t)v38, 16);
  if (!v19) {
    goto LABEL_3;
  }
  uint64_t v23 = v19;
  int64_t v32 = a5;
  id v33 = v8;
  uint64_t v24 = *(void *)v35;
  char v25 = 1;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v35 != v24) {
        objc_enumerationMutation(v14);
      }
      long long v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if (hasCapability
        && objc_msgSend_authRequestStatus(*(void **)(*((void *)&v34 + 1) + 8 * i), v20, v21, v22))
      {
        objc_msgSend_requestBuddyListAuthorizationFromIMHandle_(self, v20, (uint64_t)v27, v22);
      }
      if (objc_msgSend_isBuddy(v27, v20, v21, v22, v32, v33, (void)v34))
      {
        uint64_t v28 = objc_msgSend_groups(v27, v20, v21, v22);
        char isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v9, v29, (uint64_t)v28, v30);
      }
      else
      {
        char isSubsetOfSet = 0;
      }
      v25 &= isSubsetOfSet;
    }
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v20, (uint64_t)&v34, (uint64_t)v38, 16);
  }
  while (v23);

  LODWORD(a5) = v32;
  id v8 = v33;
  if ((v25 & 1) == 0)
  {
LABEL_2:
    objc_msgSend_arrayByApplyingSelector_(v8, v12, (uint64_t)"ID", v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changeBuddyList_add_groups_atLocation_(self, v15, (uint64_t)v14, 1, v9, (int)a5);
LABEL_3:
  }
  return 1;
}

- (BOOL)removePeople:(id)a3 fromGroups:(id)a4
{
  id v6 = a4;
  id v9 = objc_msgSend_arrayByApplyingSelector_(a3, v7, (uint64_t)"ID", v8);
  objc_msgSend_changeBuddyList_add_groups_atLocation_(self, v10, (uint64_t)v9, 0, v6, 0);

  return 1;
}

- (BOOL)addIMHandle:(id)a3 toGroups:(id)a4 atLocation:(int64_t)a5
{
  id v7 = a4;
  uint64_t v8 = IMSingleObjectArray();
  LOBYTE(a5) = objc_msgSend_addPeople_toGroups_atLocation_(self, v9, (uint64_t)v8, (uint64_t)v7, a5);

  return a5;
}

- (BOOL)removeIMHandle:(id)a3 fromGroups:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_ID(a3, v7, v8, v9);
  uint64_t v11 = IMSingleObjectArray();
  objc_msgSend_changeBuddyList_add_groups_atLocation_(self, v12, (uint64_t)v11, 0, v6, 0);

  return 1;
}

- (void)addBuddyToBuddyList:(id)a3
{
  id v31 = a3;
  uint64_t v7 = objc_msgSend_groupList(self, v4, v5, v6);
  if (v7)
  {
    uint64_t v11 = (void *)v7;
    uint64_t v12 = objc_msgSend_groupList(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);

    if (v16)
    {
      char v17 = IMSingleObjectArray();
      uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v22 = objc_msgSend_groupList(self, v19, v20, v21);
      uint64_t v26 = objc_msgSend___imFirstObject(v22, v23, v24, v25);
      uint64_t v29 = objc_msgSend_setWithObject_(v18, v27, (uint64_t)v26, v28);
      objc_msgSend_addPeople_toGroups_atLocation_(self, v30, (uint64_t)v17, (uint64_t)v29, 0);
    }
  }
}

- (void)changeBuddyList:(id)a3 add:(BOOL)a4 groups:(id)a5 atLocation:(int64_t)a6
{
  BOOL v8 = a4;
  uint64_t v240 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  objc_msgSend_beginChanges(self, v12, v13, v14);
  uint64_t v18 = objc_msgSend_allObjects(v11, v15, v16, v17);
  uint64_t v211 = v18;
  if (objc_msgSend_count(v10, v19, v20, v21))
  {
    id v206 = v11;
    uint64_t v219 = objc_msgSend_count(v18, v22, v23, v24);
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v25, v219, v26);
    id v214 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v29 = a6 >= 0 && v8;
    BOOL v217 = v29;
    BOOL v218 = v8;
    if (v29)
    {
      uint64_t v30 = *MEMORY[0x1E4F6C670];
      uint64_t v34 = objc_msgSend_objectForKey_(self->_coalescedChanges, v27, *MEMORY[0x1E4F6C670], v28);
      if (!v34)
      {
        uint64_t v34 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v31, v32, v33);
        objc_msgSend_setObject_forKey_(self->_coalescedChanges, v35, v34, v30);
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
    v210 = (void *)v34;
    id v73 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v77 = objc_msgSend_count(v10, v74, v75, v76);
    uint64_t v80 = objc_msgSend_initWithCapacity_(v73, v78, v77, v79);
    int v84 = objc_msgSend_count(v10, v81, v82, v83);
    if (v84 >= 1)
    {
      uint64_t v88 = 0;
      if (v84 <= 1uLL) {
        uint64_t v89 = 1;
      }
      else {
        uint64_t v89 = v84;
      }
      do
      {
        uint64_t v90 = objc_msgSend_service(self, v85, v86, v87);
        uint64_t v93 = objc_msgSend_objectAtIndex_(v10, v91, v88, v92);
        id v96 = objc_msgSend_canonicalFormOfID_(v90, v94, (uint64_t)v93, v95);
        objc_msgSend_addObject_(v80, v97, (uint64_t)v96, v98);

        ++v88;
      }
      while (v89 != v88);
    }
    v220 = v80;
    v209 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v85, (uint64_t)v80, v87);
    uint64_t v102 = v210;
    uint64_t v18 = v211;
    if (v219)
    {
      uint64_t v100 = 0;
      uint64_t v223 = *MEMORY[0x1E4F6C4C0];
      uint64_t v216 = *MEMORY[0x1E4F6C4B8];
      v103 = (uint64_t *)MEMORY[0x1E4F6C438];
      if (!v218) {
        v103 = (uint64_t *)MEMORY[0x1E4F6C668];
      }
      uint64_t v212 = *MEMORY[0x1E4F6C448];
      uint64_t v213 = *v103;
      uint64_t v208 = self;
      do
      {
        uint64_t v221 = v100;
        uint64_t v224 = objc_msgSend_objectAtIndex_(v18, v99, v100, v101);
        uint64_t v107 = objc_msgSend_count(self->_groups, v104, v105, v106);
        if (v107)
        {
          uint64_t v110 = v107;
          uint64_t v111 = 0;
          while (1)
          {
            v112 = objc_msgSend_objectAtIndex_(self->_groups, v108, v111, v109);
            uint64_t v115 = objc_msgSend_objectForKey_(v112, v113, v223, v114);
            char isEqualToString = objc_msgSend_isEqualToString_(v115, v116, v224, v117);

            if (isEqualToString) {
              break;
            }

            if (v110 == ++v111) {
              goto LABEL_40;
            }
          }
        }
        else
        {
LABEL_40:
          v112 = 0;
        }
        uint64_t v121 = objc_msgSend_objectForKey_(v112, v108, v216, v109);
        if (v121)
        {
          int v222 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v119, (uint64_t)v121, v120);
        }
        else
        {
          int v222 = 0;
        }
        uint64_t v122 = (void *)v224;
        if (!v218 || (objc_msgSend_isSubsetOfSet_(v209, v119, (uint64_t)v222, v120) & 1) == 0)
        {
          uint64_t v124 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v119, v224, v120, v223, v220, v213, 0);
          objc_msgSend_addObject_(v214, v125, (uint64_t)v124, v126);
        }
        if (v217)
        {
          unint64_t v215 = v121;
          if (v112) {
            objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v119, (uint64_t)v121, v120);
          }
          else {
          v127 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v119, v123, v120);
          }
          long long v235 = 0u;
          long long v236 = 0u;
          long long v233 = 0u;
          long long v234 = 0u;
          id v128 = v220;
          uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v233, (uint64_t)v239, 16);
          if (v130)
          {
            uint64_t v133 = v130;
            uint64_t v134 = *(void *)v234;
            do
            {
              for (uint64_t i = 0; i != v133; ++i)
              {
                if (*(void *)v234 != v134) {
                  objc_enumerationMutation(v128);
                }
                uint64_t v136 = *(void *)(*((void *)&v233 + 1) + 8 * i);
                uint64_t v137 = objc_msgSend_indexOfObject_(v127, v131, v136, v132);
                if (v137 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v141 = v137;
                  objc_msgSend_removeObjectAtIndex_(v127, v138, v137, v140);
                  a6 = (__PAIR128__(a6, v141) - (unint64_t)a6) >> 64;
                }
                if (a6 > (unint64_t)objc_msgSend_count(v127, v138, v139, v140)) {
                  a6 = (int)objc_msgSend_count(v127, v142, v143, v144);
                }
                objc_msgSend_insertObject_atIndex_(v127, v142, v136, a6++);
              }
              uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v131, (uint64_t)&v233, (uint64_t)v239, 16);
            }
            while (v133);
          }

          uint64_t v102 = v210;
          uint64_t v150 = objc_msgSend_objectForKey_(v210, v145, v212, v146);
          if (!v150)
          {
            uint64_t v150 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v147, v148, v149);
            objc_msgSend_setObject_forKey_(v210, v151, (uint64_t)v150, v212);
          }
          uint64_t v122 = (void *)v224;
          objc_msgSend_setObject_forKey_(v150, v147, (uint64_t)v127, v224);

          self = v208;
          uint64_t v18 = v211;
          uint64_t v121 = v215;
        }

        uint64_t v100 = v221 + 1;
      }
      while (v221 + 1 != v219);
    }
    uint64_t v59 = v220;
    if (objc_msgSend_count(v214, v99, v100, v101))
    {
      uint64_t v154 = *MEMORY[0x1E4F6C450];
      objc_msgSend_objectForKey_(self->_coalescedChanges, v152, *MEMORY[0x1E4F6C450], v153);
      id v157 = (id)objc_claimAutoreleasedReturnValue();
      if (!v157)
      {
        id v157 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_msgSend_setObject_forKey_(self->_coalescedChanges, v158, (uint64_t)v157, v154);
      }
      objc_msgSend_addObjectsFromArray_(v157, v155, (uint64_t)v214, v156);
    }
    id v11 = v206;
    goto LABEL_91;
  }
  if (objc_msgSend_count(v11, v22, v23, v24))
  {
    uint64_t v207 = v11;
    uint64_t v39 = (id *)MEMORY[0x1E4F6C438];
    if (!v8) {
      uint64_t v39 = (id *)MEMORY[0x1E4F6C668];
    }
    id v214 = *v39;
    objc_msgSend_objectForKey_(self->_coalescedChanges, v40, (uint64_t)v214, v41);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v45 = v8;
    if (!v44)
    {
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend_setObject_forKey_(self->_coalescedChanges, v46, (uint64_t)v44, (uint64_t)v214);
    }
    objc_msgSend_addObjectsFromArray_(v44, v42, (uint64_t)v18, v43);
    uint64_t v50 = objc_msgSend_groupList(self, v47, v48, v49);
    uint64_t v54 = objc_msgSend_mutableCopy(v50, v51, v52, v53);

    id v58 = v44;
    uint64_t v59 = v54;
    if (!v45)
    {
      objc_msgSend_removeObjectsInArray_(v54, v55, (uint64_t)v18, v57);
      goto LABEL_88;
    }
    unint64_t v60 = objc_msgSend_count(v54, v55, v56, v57);
    if ((a6 & 0x8000000000000000) == 0)
    {
      if (v60 <= a6) {
        goto LABEL_88;
      }
      long long v231 = 0u;
      long long v232 = 0u;
      long long v229 = 0u;
      long long v230 = 0u;
      id v64 = v207;
      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v229, (uint64_t)v238, 16);
      if (v66)
      {
        uint64_t v69 = v66;
        uint64_t v70 = *(void *)v230;
        do
        {
          for (uint64_t j = 0; j != v69; ++j)
          {
            if (*(void *)v230 != v70) {
              objc_enumerationMutation(v64);
            }
            uint64_t v72 = *(void *)(*((void *)&v229 + 1) + 8 * j);
            if (objc_msgSend_containsObject_(v59, v67, v72, v68)) {
              objc_msgSend_insertObject_atIndex_(v59, v67, v72, a6);
            }
          }
          uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v229, (uint64_t)v238, 16);
        }
        while (v69);
      }
      goto LABEL_87;
    }
    if (!v60) {
      goto LABEL_78;
    }
    uint64_t v159 = 0;
    uint64_t v160 = *MEMORY[0x1E4F6C4D0];
    while (1)
    {
      uint64_t v161 = objc_msgSend_objectAtIndex_(v59, v61, v159, v63);
      uint64_t v164 = objc_msgSend_propertiesForGroup_(self, v162, (uint64_t)v161, v163);
      uint64_t v167 = objc_msgSend_objectForKey_(v164, v165, v160, v166);
      if (v167)
      {
        id v171 = v167;
        if (!objc_msgSend_intValue(v167, v168, v169, v170))
        {

          if ((v159 & 0x80000000) == 0
            && objc_msgSend_count(v59, v189, v190, v191) > (unint64_t)v159)
          {
            uint64_t v18 = v211;
            if (objc_msgSend_count(v211, v192, v193, v194))
            {
              unint64_t v195 = 0;
              int v196 = v159;
              do
              {
                uint64_t v197 = objc_msgSend_objectAtIndex_(v211, v61, v195, v63);
                char v200 = objc_msgSend_containsObject_(v59, v198, (uint64_t)v197, v199);

                if ((v200 & 1) == 0)
                {
                  id v204 = objc_msgSend_objectAtIndex_(v211, v201, v195, v203);
                  objc_msgSend_insertObject_atIndex_(v59, v205, (uint64_t)v204, v196);

                  ++v196;
                }
                ++v195;
              }
              while (v195 < objc_msgSend_count(v211, v201, v202, v203));
            }
LABEL_88:
            uint64_t v183 = objc_msgSend_groupList(self, v61, v62, v63);
            char isEqualToArray = objc_msgSend_isEqualToArray_(v59, v184, (uint64_t)v183, v185);

            if ((isEqualToArray & 1) == 0) {
              objc_msgSend_reorderGroups_(self, v187, (uint64_t)v59, v188);
            }
            id v11 = v207;
            uint64_t v102 = v58;
LABEL_91:

            break;
          }
LABEL_78:
          long long v227 = 0u;
          long long v228 = 0u;
          long long v225 = 0u;
          long long v226 = 0u;
          id v64 = v211;
          uint64_t v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v175, (uint64_t)&v225, (uint64_t)v237, 16);
          if (v176)
          {
            uint64_t v179 = v176;
            uint64_t v180 = *(void *)v226;
            do
            {
              for (uint64_t k = 0; k != v179; ++k)
              {
                if (*(void *)v226 != v180) {
                  objc_enumerationMutation(v64);
                }
                uint64_t v182 = *(void *)(*((void *)&v225 + 1) + 8 * k);
                if ((objc_msgSend_containsObject_(v59, v177, v182, v178) & 1) == 0) {
                  objc_msgSend_addObject_(v59, v177, v182, v178);
                }
              }
              uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v177, (uint64_t)&v225, (uint64_t)v237, 16);
            }
            while (v179);
          }
LABEL_87:

          uint64_t v18 = v211;
          goto LABEL_88;
        }
      }
      if (++v159 >= (unint64_t)objc_msgSend_count(v59, v172, v173, v174)) {
        goto LABEL_78;
      }
    }
  }
  objc_msgSend_endChanges(self, v36, v37, v38);
}

- (void)renameGroup:(id)a3 to:(id)a4
{
  id v46 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_groupList(self, v7, v8, v9);
  int v13 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v46, v12);

  if (v13)
  {
    objc_msgSend_beginChanges(self, v14, v15, v16);
    uint64_t v20 = objc_msgSend_groupList(self, v17, v18, v19);
    uint64_t v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);

    uint64_t v28 = objc_msgSend_sharedInstance(IMDaemonController, v25, v26, v27);
    objc_msgSend_renameGroup_to_account_(v28, v29, (uint64_t)v46, (uint64_t)v6, self->_uniqueID);

    uint64_t v30 = *MEMORY[0x1E4F6C4C8];
    long long v36 = objc_msgSend_objectForKey_(self->_coalescedChanges, v31, *MEMORY[0x1E4F6C4C8], v32);
    if (!v36)
    {
      long long v36 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v33, v34, v35);
      objc_msgSend_setObject_forKey_(self->_coalescedChanges, v37, (uint64_t)v36, v30);
    }
    objc_msgSend_setObject_forKey_(v36, v33, (uint64_t)v6, (uint64_t)v46);
    uint64_t v40 = objc_msgSend_indexOfObject_(v24, v38, (uint64_t)v46, v39);
    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_replaceObjectAtIndex_withObject_(v24, v41, v40, (uint64_t)v6);
      objc_msgSend_reorderGroups_(self, v44, (uint64_t)v24, v45);
    }
    objc_msgSend_endChanges(self, v41, v42, v43);
  }
}

- (void)reorderGroup:(id)a3 order:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_groupList(self, v7, v8, v9);
  int v13 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v34, v12);

  if (v13)
  {
    objc_msgSend_beginChanges(self, v14, v15, v16);
    uint64_t v17 = *MEMORY[0x1E4F6C670];
    uint64_t v23 = objc_msgSend_objectForKey_(self->_coalescedChanges, v18, *MEMORY[0x1E4F6C670], v19);
    if (!v23)
    {
      uint64_t v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22);
      objc_msgSend_setObject_forKey_(self->_coalescedChanges, v24, (uint64_t)v23, v17);
    }
    uint64_t v25 = *MEMORY[0x1E4F6C448];
    BOOL v29 = objc_msgSend_objectForKey_(v23, v20, *MEMORY[0x1E4F6C448], v22);
    if (!v29)
    {
      BOOL v29 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v26, v27, v28);
      objc_msgSend_setObject_forKey_(v23, v30, (uint64_t)v29, v25);
    }
    objc_msgSend_setObject_forKey_(v29, v26, (uint64_t)v6, (uint64_t)v34);
    objc_msgSend_endChanges(self, v31, v32, v33);
  }
}

- (void)reorderGroups:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v26 = v4;
    uint64_t v8 = objc_msgSend_groupList(self, v5, v6, v7);
    char isEqualToArray = objc_msgSend_isEqualToArray_(v26, v9, (uint64_t)v8, v10);

    id v4 = v26;
    if ((isEqualToArray & 1) == 0)
    {
      objc_msgSend_beginChanges(self, v12, v13, v14);
      uint64_t v15 = *MEMORY[0x1E4F6C670];
      uint64_t v21 = objc_msgSend_objectForKey_(self->_coalescedChanges, v16, *MEMORY[0x1E4F6C670], v17);
      if (!v21)
      {
        uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v18, v19, v20);
        objc_msgSend_setObject_forKey_(self->_coalescedChanges, v22, (uint64_t)v21, v15);
      }
      objc_msgSend_setObject_forKey_(v21, v18, (uint64_t)v26, *MEMORY[0x1E4F6C4D8]);
      objc_msgSend_endChanges(self, v23, v24, v25);

      id v4 = v26;
    }
  }
}

- (id)propertiesForGroup:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_count(self->_groups, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = 0;
    uint64_t v13 = *MEMORY[0x1E4F6C4C0];
    while (1)
    {
      uint64_t v14 = objc_msgSend_objectAtIndex_(self->_groups, v9, v12, v10);
      uint64_t v17 = objc_msgSend_objectForKey_(v14, v15, v13, v16);
      if (objc_msgSend_length(v17, v18, v19, v20))
      {
        if (objc_msgSend_isEqualToString_(v17, v21, (uint64_t)v4, v22)) {
          break;
        }
      }

      if (v11 == ++v12) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)groupMembers:(id)a3
{
  id v4 = objc_msgSend_propertiesForGroup_(self, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6C4B8], v6);

  return v7;
}

- (NSArray)groupList
{
  uint64_t v5 = objc_msgSend_count(self->_groups, a2, v2, v3);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v11 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v6, v5, v7);
    uint64_t v12 = 0;
    uint64_t v13 = *MEMORY[0x1E4F6C4C0];
    do
    {
      uint64_t v14 = objc_msgSend_objectAtIndex_(self->_groups, v9, v12, v10);
      uint64_t v17 = objc_msgSend_objectForKey_(v14, v15, v13, v16);
      if (objc_msgSend_length(v17, v18, v19, v20)) {
        objc_msgSend_addObject_(v11, v21, (uint64_t)v17, v22);
      }

      ++v12;
    }
    while (v8 != v12);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return (NSArray *)v11;
}

- (id)memberGroups:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_members, a2, (uint64_t)a3, v3);
}

- (void)endChanges
{
  int coalesceCount = self->_coalesceCount;
  if (coalesceCount <= 0)
  {
    uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, @"IMAccount.m", 2167, @"%@ Unmatched endCoalescedChanges", self);

    int coalesceCount = self->_coalesceCount;
  }
  self->_int coalesceCount = coalesceCount - 1;
  if ((objc_msgSend_makingChanges(self, a2, v2, v3) & 1) == 0)
  {
    if (objc_msgSend_count(self->_coalescedChanges, v6, v7, v8))
    {
      objc_msgSend__applyChangesToTemporaryCache_(self, v9, (uint64_t)self->_coalescedChanges, v10);
      uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
      objc_msgSend_changeGroups_account_(v14, v15, (uint64_t)self->_coalescedChanges, (uint64_t)self->_uniqueID);
    }
    coalescedChanges = self->_coalescedChanges;
    self->_coalescedChanges = 0;
  }
}

- (BOOL)makingChanges
{
  return self->_coalesceCount > 0;
}

- (void)holdBuddyUpdates
{
  objc_msgSend_beginChanges(self, a2, v2, v3);
  int numHolding = self->_numHolding;
  if (!numHolding)
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
    uint64_t v13 = objc_msgSend_uniqueID(self, v10, v11, v12);
    objc_msgSend_holdBuddyUpdatesAccount_(v9, v14, (uint64_t)v13, v15);

    int numHolding = self->_numHolding;
  }
  self->_int numHolding = numHolding + 1;
}

- (void)_resumeBuddyUpdatesNow
{
  int numHolding = self->_numHolding;
  if (numHolding <= 0)
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, @"IMAccount.m", 2195, @"imbalanced update: called a resume without calling a holdBuddyUpdate!");

    int numHolding = self->_numHolding;
  }
  self->_int numHolding = numHolding - 1;
  objc_msgSend_endChanges(self, a2, v2, v3);
  if (!self->_numHolding)
  {
    objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    objc_msgSend_resumeBuddyUpdatesAccount_(v18, v13, (uint64_t)v12, v14);
  }
}

- (void)resumeBuddyUpdates
{
}

- (void)buddyPropertiesChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_existingIMHandleWithInfo_(self, v7, *(void *)(*((void *)&v12 + 1) + 8 * v11), v8);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }
}

- (void)buddyPictureChanged:(id)a3 imageData:(id)a4 imageHash:(id)a5
{
  uint64_t v16 = (char *)a4;
  id v8 = a5;
  uint64_t v11 = objc_msgSend_existingIMHandleWithID_(self, v9, (uint64_t)a3, v10);
  if (objc_msgSend_length(v16, v12, v13, v14))
  {
    long long v15 = v16;
  }
  else
  {

    long long v15 = 0;
  }
  uint64_t v17 = (char *)v15;
  objc_msgSend_setCustomPictureData_key_(v11, v15, (uint64_t)v15, (uint64_t)v8);
}

- (void)setBuddyProperties:(id)a3 buddyPictures:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v6 = a4;
  if (!self->_hasReceivedSync)
  {
    id v77 = v6;
    self->_syncedWithRemoteBuddyList = 1;
    objc_msgSend__markHasSyncedWithRemoteBuddies(self, v7, v8, v9);
    uint64_t ShouldHidePeople = objc_msgSend_setShouldHidePeople_(self->_buddyList, v10, 0, v11);
    context = (void *)MEMORY[0x1A6264150](ShouldHidePeople);
    uint64_t v76 = self;
    uint64_t v16 = objc_msgSend_arrayOfAllIMHandles(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_copy(v16, v17, v18, v19);

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id obj = v20;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v86, (uint64_t)v92, 16);
    if (v25)
    {
      uint64_t v26 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v87 != v26) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend_beginNotificationQueue(*(void **)(*((void *)&v86 + 1) + 8 * i), v22, v23, v24);
        }
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v86, (uint64_t)v92, 16);
      }
      while (v25);
    }

    id v73 = objc_msgSend_allKeys(v74, v28, v29, v30);
    if (objc_msgSend_count(v73, v31, v32, v33))
    {
      uint64_t v37 = objc_msgSend_allValues(v74, v34, v35, v36);
      objc_msgSend_buddyPropertiesChanged_(v76, v38, (uint64_t)v37, v39);
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v40 = objc_msgSend_allKeys(v77, v34, v35, v36);
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v82, (uint64_t)v91, 16);
    if (v44)
    {
      uint64_t v45 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v83 != v45) {
            objc_enumerationMutation(v40);
          }
          uint64_t v47 = *(void *)(*((void *)&v82 + 1) + 8 * j);
          uint64_t v48 = objc_msgSend_objectForKey_(v77, v42, v47, v43);
          uint64_t v51 = objc_msgSend_objectForKey_(v48, v49, @"data", v50);
          uint64_t v54 = objc_msgSend_objectForKey_(v48, v52, @"key", v53);
          uint64_t v57 = objc_msgSend_existingIMHandleWithID_(v76, v55, v47, v56);
          objc_msgSend_setCustomPictureData_key_(v57, v58, (uint64_t)v51, (uint64_t)v54);
        }
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v42, (uint64_t)&v82, (uint64_t)v91, 16);
      }
      while (v44);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v59 = obj;
    uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v78, (uint64_t)v90, 16);
    if (v64)
    {
      uint64_t v65 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v79 != v65) {
            objc_enumerationMutation(v59);
          }
          objc_msgSend_releaseNotificationQueue(*(void **)(*((void *)&v78 + 1) + 8 * k), v61, v62, v63);
        }
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v61, (uint64_t)&v78, (uint64_t)v90, 16);
      }
      while (v64);
    }

    uint64_t v70 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v67, v68, v69);
    objc_msgSend___mainThreadPostNotificationName_object_(v70, v71, @"__kIMAccountPropertiesAndPicturesLoadedNotification", (uint64_t)v76);

    id v6 = v77;
  }
}

- (void)_registrationStatusChanged:(id)a3
{
  countryCode = self->_countryCode;
  self->_countryCode = 0;

  objc_msgSend_loginIfActiveRegistered(self, v5, v6, v7);
}

- (void)_serviceDidReconnect:(id)a3
{
}

- (void)_serviceDidDisconnect:(id)a3
{
}

- (void)accountWillBeRemoved
{
  if (!self->_hasBeenRemoved)
  {
    self->_hasBeenRemoved = 1;
    loginIMHandle = self->_loginIMHandle;
    if (loginIMHandle)
    {
      objc_msgSend__stopRetainingAccount_(loginIMHandle, a2, (uint64_t)self, v2);
      objc_msgSend_me(IMMe, v5, v6, v7);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeLoginIMHandle_(v10, v8, (uint64_t)self->_loginIMHandle, v9);
    }
  }
}

- (void)accountDidDeactivate
{
  if ((unint64_t)objc_msgSend_loginStatus(self, a2, v2, v3) >= 2)
  {
    MEMORY[0x1F4181798](self, sel_setIMAccountLoginStatus_errorMessage_, 0, 0);
  }
}

- (BOOL)isApprovedForRelay
{
  id v4 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  char hasRelayApprovedAccount = objc_msgSend_hasRelayApprovedAccount(v4, v5, v6, v7);

  return hasRelayApprovedAccount;
}

- (BOOL)isRegistered
{
  return ((uint64_t (*)(void, char *, IMAccount *))MEMORY[0x1F4181798])(MEMORY[0x1E4F6E560], sel_isAccountRegistered_, self);
}

- (BOOL)canSendMessages
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__aliases(self, a2, v2, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v4;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v37 = v4;
      uint64_t v13 = *(void *)v41;
      uint64_t v14 = *MEMORY[0x1E4F6B708];
      uint64_t v15 = *MEMORY[0x1E4F6C698];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend_objectForKey_(v17, v10, v14, v11);
          uint64_t v22 = v18;
          if (v18 && (objc_msgSend_BOOLValue(v18, v19, v20, v21) & 1) == 0)
          {
          }
          else
          {
            uint64_t v23 = objc_msgSend_objectForKey_(v17, v19, v15, v21);
            uint64_t v27 = objc_msgSend_lowercaseString(v23, v24, v25, v26);
            id v31 = objc_msgSend_trimmedString(v27, v28, v29, v30);
            char IsVisible = objc_msgSend__aliasIsVisible_(self, v32, (uint64_t)v31, v33);

            if (IsVisible)
            {
              BOOL v35 = 1;
              goto LABEL_16;
            }
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v40, (uint64_t)v44, 16);
      }
      while (v12);
      BOOL v35 = 0;
LABEL_16:
      id v4 = v37;
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {
    BOOL v35 = 1;
  }

  return v35;
}

- (NSDictionary)registrationFailureAlertInfo
{
  return self->_registrationAlertInfo;
}

- (BOOL)registerAccount
{
  int v8 = objc_msgSend_supportsRegistration(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
    uint64_t v13 = objc_msgSend_uniqueID(self, v10, v11, v12);
    objc_msgSend_registerAccount_(v9, v14, (uint64_t)v13, v15);
  }
  return v8;
}

- (BOOL)unregisterAccount
{
  int v8 = objc_msgSend_supportsRegistration(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
    uint64_t v13 = objc_msgSend_uniqueID(self, v10, v11, v12);
    objc_msgSend_unregisterAccount_(v9, v14, (uint64_t)v13, v15);
  }
  return v8;
}

+ (id)nameOfLoginStatus:(unint64_t)a3
{
  if (!qword_1EB3F23E0[0])
  {
    qword_1EB3F23E0[0] = @"Offline";

    id v4 = (void *)qword_1EB3F23E8;
    qword_1EB3F23E8 = @"Disconnected";

    uint64_t v5 = (void *)qword_1EB3F23F0;
    qword_1EB3F23F0 = @"Disconnecting...";

    uint64_t v6 = (void *)qword_1EB3F23F8;
    qword_1EB3F23F8 = @"Connecting...";

    uint64_t v7 = (void *)qword_1EB3F2400;
    qword_1EB3F2400 = @"Connected";
  }
  int v8 = (void *)qword_1EB3F23E0[a3];

  return v8;
}

- (void)_notJustLoggedIn
{
  self->_justLoggedIuint64_t n = 0;
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend___mainThreadPostNotificationName_object_(v6, v5, @"__kIMAccountNoLongerJustLoggedInNotification", (uint64_t)self);
}

- (NSString)loginStatusMessage
{
  uint64_t v3 = objc_opt_class();
  unint64_t loginStatus = self->_loginStatus;

  return (NSString *)objc_msgSend_nameOfLoginStatus_(v3, v4, loginStatus, v5);
}

- (BOOL)isConnecting
{
  int isActive = objc_msgSend_isActive(self, a2, v2, v3);
  if (isActive) {
    LOBYTE(isActive) = (unint64_t)objc_msgSend_loginStatus(self, v6, v7, v8) >= 2
  }
                    && (unint64_t)objc_msgSend_loginStatus(self, v9, v10, v11) < 4;
  return isActive;
}

- (void)_syncWithRemoteBuddies
{
  *(_WORD *)&self->_syncedWithRemoteBuddyList = 257;
}

- (void)groupsChanged:(id)a3 error:(id)a4
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSArray *)a3;
  uint64_t v153 = v7;
  id v150 = a4;
  if (!v150)
  {
    if (!v7) {
      goto LABEL_84;
    }
LABEL_6:
    uint64_t v15 = v7;
    if (self->_targetGroupState != v7)
    {
      if (self->_lastReceivedGroupState != v7) {
        objc_storeStrong((id *)&self->_lastReceivedGroupState, a3);
      }
      uint64_t v15 = v7;
      if (objc_msgSend_isAwaitingTargetGroupState(self, v8, v9, v10))
      {
        if (!objc_msgSend_hasTargetGroupStateBeenMet(self, v16, v17, v18)) {
          goto LABEL_84;
        }
        objc_msgSend_clearTargetState(self, v19, v20, v21);
        uint64_t v15 = v7;
      }
    }
    context = (void *)MEMORY[0x1A6264150]();
    groups = self->_groups;
    if (groups == v15 || (objc_msgSend_isEqualToArray_(v7, v22, (uint64_t)groups, v23) & 1) != 0)
    {
LABEL_83:
      objc_msgSend_watchBuddiesIfNecessary(self, v22, (uint64_t)groups, v23);
      goto LABEL_84;
    }
    uint64_t v25 = objc_msgSend_buddyList(self, v22, (uint64_t)groups, v23);
    objc_msgSend_beginCoalescedChanges(v25, v26, v27, v28);

    objc_storeStrong((id *)&self->_groups, a3);
    id v151 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v154 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v33 = objc_msgSend_count(self->_groups, v30, v31, v32);
    uint64_t v156 = objc_msgSend_dictionaryWithCapacity_(v29, v34, v33, v35);
    id obj = (id)objc_msgSend_count(self->_groups, v36, v37, v38);
    if (obj)
    {
      uint64_t v41 = 0;
      uint64_t v155 = *MEMORY[0x1E4F6C4C0];
      uint64_t v152 = *MEMORY[0x1E4F6C4B8];
      do
      {
        uint64_t v160 = v41;
        uint64_t v162 = objc_msgSend_objectAtIndex_(self->_groups, v39, v41, v40);
        uint64_t v44 = v162;
        if (!v162 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v45 = objc_msgSend_objectForKey_(v162, v42, v155, v43);
          uint64_t v51 = objc_msgSend_objectForKey_(v162, v46, v152, v47);
          if (!v51 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v52 = objc_msgSend_count(v51, v48, v49, v50);
            id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v164 = v52;
            if (v52)
            {
              for (uint64_t i = 0; v164 != i; ++i)
              {
                uint64_t v57 = objc_msgSend_objectAtIndex_(v51, v53, i, v54);
                objc_msgSend_objectForKey_(v156, v58, (uint64_t)v57, v59);
                id v60 = (id)objc_claimAutoreleasedReturnValue();
                if (v60)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    goto LABEL_26;
                  }
                }
                id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                objc_msgSend_setObject_forKey_(v156, v63, (uint64_t)v60, (uint64_t)v57);
LABEL_26:
                uint64_t v64 = objc_msgSend_imHandleWithID_(self, v61, (uint64_t)v57, v62);
                uint64_t v69 = objc_msgSend_objectForKey_(self->_sortOrders, v65, (uint64_t)v45, v66);
                if (v64)
                {
                  objc_msgSend_addObject_(v55, v67, (uint64_t)v64, v68);
                  uint64_t v72 = objc_msgSend_indexOfObjectIdenticalTo_(v55, v70, (uint64_t)v64, v71);
                  if (v72 != objc_msgSend_indexOfObjectIdenticalTo_(v69, v73, (uint64_t)v64, v74)) {
                    objc_msgSend_addObject_(v154, v67, (uint64_t)v64, v68);
                  }
                }
                if ((objc_msgSend_containsObject_(v60, v67, (uint64_t)v45, v68) & 1) == 0) {
                  objc_msgSend_addObject_(v60, v75, (uint64_t)v45, v76);
                }
              }
            }
            objc_msgSend_setObject_forKey_(v151, v53, (uint64_t)v55, (uint64_t)v45);
          }
          uint64_t v44 = v162;
        }

        uint64_t v41 = v160 + 1;
      }
      while ((id)(v160 + 1) != obj);
    }
    uint64_t v161 = self->_members;
    uint64_t v165 = objc_msgSend_mutableCopy(v156, v77, v78, v79);
    objc_storeStrong((id *)&self->_members, v156);
    if (v161)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_39;
      }
    }
    uint64_t v161 = 0;
LABEL_39:
    if (v165)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_43:
        long long v176 = 0u;
        long long v177 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        objc_msgSend_allKeys(v161, v80, v81, v82);
        id obja = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v83, (uint64_t)&v174, (uint64_t)v180, 16);
        if (v163)
        {
          uint64_t v159 = *(void *)v175;
          do
          {
            for (uint64_t j = 0; j != v163; ++j)
            {
              if (*(void *)v175 != v159) {
                objc_enumerationMutation(obja);
              }
              uint64_t v87 = *(void *)(*((void *)&v174 + 1) + 8 * j);
              long long v88 = (void *)MEMORY[0x1E4F1CAD0];
              long long v89 = objc_msgSend_objectForKey_(v161, v84, v87, v85);
              uint64_t v92 = objc_msgSend_setWithArray_(v88, v90, (uint64_t)v89, v91);

              uint64_t v93 = (void *)MEMORY[0x1E4F1CAD0];
              id v96 = objc_msgSend_objectForKey_(v165, v94, v87, v95);
              v99 = objc_msgSend_setWithArray_(v93, v97, (uint64_t)v96, v98);

              if (!v99)
              {
                v99 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v100, v101, v102);
              }
              uint64_t v103 = objc_msgSend_count(v92, v100, v101, v102);
              uint64_t v107 = objc_msgSend_count(v99, v104, v105, v106);
              v112 = objc_msgSend_imHandleWithID_(self, v108, v87, v109);
              if ((v103 != 0) == (v107 == 0))
              {
                if (v103) {
                  BOOL v113 = v107 == 0;
                }
                else {
                  BOOL v113 = 0;
                }
                if (v113) {
                  objc_msgSend_imHandle_buddyStatusChanged_(self, v110, (uint64_t)v112, 0);
                }
                else {
                  objc_msgSend_imHandle_buddyStatusChanged_(self, v110, (uint64_t)v112, 1);
                }
              }
              if ((objc_msgSend_isEqualToSet_(v92, v110, (uint64_t)v99, v111) & 1) == 0
                && self->_syncedWithRemoteBuddyList
                && self->_hasReceivedSync)
              {
                objc_msgSend_postNotificationName_(v112, v114, @"__kIMHandleGroupsChangedNotification", v115);
              }
              objc_msgSend_removeObjectForKey_(v165, v114, v87, v115);
            }
            uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v84, (uint64_t)&v174, (uint64_t)v180, 16);
          }
          while (v163);
        }

        long long v172 = 0u;
        long long v173 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        uint64_t v119 = objc_msgSend_allKeys(v165, v116, v117, v118);
        uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v170, (uint64_t)v179, 16);
        if (v123)
        {
          uint64_t v124 = *(void *)v171;
          do
          {
            for (uint64_t k = 0; k != v123; ++k)
            {
              if (*(void *)v171 != v124) {
                objc_enumerationMutation(v119);
              }
              uint64_t v126 = objc_msgSend_imHandleWithID_(self, v121, *(void *)(*((void *)&v170 + 1) + 8 * k), v122);
              objc_msgSend_imHandle_buddyStatusChanged_(self, v127, (uint64_t)v126, 1);
              if (self->_syncedWithRemoteBuddyList && self->_hasReceivedSync) {
                objc_msgSend_postNotificationName_(v126, v128, @"__kIMHandleGroupsChangedNotification", v129);
              }
            }
            uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v121, (uint64_t)&v170, (uint64_t)v179, 16);
          }
          while (v123);
        }

        objc_storeStrong((id *)&self->_sortOrders, v151);
        long long v168 = 0u;
        long long v169 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        id v130 = v154;
        uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v166, (uint64_t)v178, 16);
        if (v134)
        {
          uint64_t v135 = *(void *)v167;
          do
          {
            for (uint64_t m = 0; m != v134; ++m)
            {
              if (*(void *)v167 != v135) {
                objc_enumerationMutation(v130);
              }
              objc_msgSend_postNotificationName_(*(void **)(*((void *)&v166 + 1) + 8 * m), v132, @"__kIMHandleSortOrderChangedNotification", v133);
            }
            uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v132, (uint64_t)&v166, (uint64_t)v178, 16);
          }
          while (v134);
        }

        if (!self->_syncedWithRemoteBuddyList) {
          objc_msgSend__syncWithRemoteBuddies(self, v137, v138, v139);
        }
        uint64_t v140 = objc_msgSend_buddyList(self, v137, v138, v139);
        objc_msgSend_endCoalescedChanges(v140, v141, v142, v143);

        int v147 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v144, v145, v146);
        objc_msgSend___mainThreadPostNotificationName_object_(v147, v148, @"__kIMAccountGroupsChangedNotification", (uint64_t)self);

        goto LABEL_83;
      }
    }
    uint64_t v165 = 0;
    goto LABEL_43;
  }
  objc_msgSend_clearTargetState(self, v8, v9, v10);
  if (v7) {
    goto LABEL_6;
  }
  if (objc_msgSend_isAwaitingTargetGroupState(self, v8, v9, v10))
  {
    objc_msgSend_clearTargetState(self, v11, v12, v13);
    objc_msgSend_groupsChanged_error_(self, v14, (uint64_t)self->_lastReceivedGroupState, 0);
  }
LABEL_84:
}

- (int64_t)compareNames:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_serviceName(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_serviceName(v4, v9, v10, v11);

  int64_t v15 = objc_msgSend_localizedCompareToString_(v8, v13, (uint64_t)v12, v14);
  return v15;
}

- (void)_clearImageCache
{
  id smallImage = self->_smallImage;
  self->_id smallImage = 0;

  id accountImage = self->_accountImage;
  self->_id accountImage = 0;
}

- (NSArray)arrayOfAllIMHandles
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  if (objc_msgSend_count(self->_imHandles, v5, v6, v7))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_count(self->_imHandles, v12, v13, v14);
    uint64_t v18 = objc_msgSend_initWithCapacity_(v11, v16, v15, v17);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v19 = self->_imHandles;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v35, (uint64_t)v39, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v19);
          }
          uint64_t v27 = objc_msgSend_objectForKey_(self->_imHandles, v22, *(void *)(*((void *)&v35 + 1) + 8 * i), v23, (void)v35);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27, v29);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v35, (uint64_t)v39, 16);
      }
      while (v24);
    }

    uint64_t v33 = objc_msgSend_copy(v18, v30, v31, v32);
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend_unlock(self->_lock, v8, v9, v10, (void)v35);

  return (NSArray *)v33;
}

- (Class)imHandleClass
{
  return (Class)objc_opt_class();
}

- (id)imHandleWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6C5C8], v6);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_imHandleWithID_(self, v7, (uint64_t)v9, v8);
    uint64_t v13 = v10;
    if (v10) {
      objc_msgSend_propertiesChanged_(v10, v11, (uint64_t)v4, v12);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)existingIMHandleWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6C5C8], v6);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_existingIMHandleWithID_(self, v7, (uint64_t)v9, v8);
    uint64_t v13 = v10;
    if (v10) {
      objc_msgSend_propertiesChanged_(v10, v11, (uint64_t)v4, v12);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)imHandleWithInfo:(id)a3 alreadyCanonical:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x1E4F6C5C8], v8);
  if (v10)
  {
    id v11 = objc_msgSend_imHandleWithID_alreadyCanonical_(self, v9, (uint64_t)v10, v4);
    uint64_t v14 = v11;
    if (v11) {
      objc_msgSend_propertiesChanged_(v11, v12, (uint64_t)v6, v13);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)existingIMHandleWithInfo:(id)a3 alreadyCanonical:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x1E4F6C5C8], v8);
  if (v10)
  {
    id v11 = objc_msgSend_existingIMHandleWithID_alreadyCanonical_(self, v9, (uint64_t)v10, v4);
    uint64_t v14 = v11;
    if (v11) {
      objc_msgSend_propertiesChanged_(v11, v12, (uint64_t)v6, v13);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)existingIMHandleWithID:(id)a3
{
  return (id)objc_msgSend_existingIMHandleWithID_alreadyCanonical_(self, a2, (uint64_t)a3, 0);
}

- (id)imHandleWithID:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (v6)
  {
    if (objc_msgSend_length(v6, v7, v8, v9) == 1
      && (objc_msgSend_isEqualToString_(v6, v11, @"+", v12) & 1) != 0)
    {
      uint64_t v13 = 0;
      id v14 = v6;
    }
    else
    {
      uint64_t v15 = objc_msgSend_canonicalFormOfID_countryCode_(self, v11, (uint64_t)v6, (uint64_t)v10);
      if (objc_msgSend_isEqualToString_(v6, v16, (uint64_t)v15, v17))
      {
        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v18 = IMCleanupPhoneNumber();
      }
      id v14 = v15;

      uint64_t v13 = objc_msgSend_existingIMHandleWithID_alreadyCanonical_(self, v19, (uint64_t)v14, 1);
      if (!v13)
      {
        uint64_t v23 = [IMHandle alloc];
        uint64_t v13 = objc_msgSend_initWithAccount_ID_alreadyCanonical_(v23, v24, (uint64_t)self, (uint64_t)v14, 1);
        uint64_t v28 = objc_msgSend_defaultHandleCapabilities(self, v25, v26, v27);
        if (v28) {
          objc_msgSend__setCapabilities_(v13, v20, v28, v22);
        }
      }
      if (v18)
      {
        uint64_t v29 = objc_msgSend_originalID(v13, v20, v21, v22);
        char isEqualToString = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)v18, v31);

        if ((isEqualToString & 1) == 0)
        {
          long long v36 = objc_msgSend_trimmedString(v18, v33, v34, v35);
          if ((unint64_t)objc_msgSend_length(v36, v37, v38, v39) < 4)
          {
          }
          else
          {
            char hasPrefix = objc_msgSend_hasPrefix_(v18, v40, @"+", v41);

            if ((hasPrefix & 1) == 0)
            {
              objc_msgSend__updateOriginalID_(v13, v43, (uint64_t)v18, v44);
              objc_msgSend__setOriginalID_(v13, v45, (uint64_t)v18, v46);
            }
          }
        }
      }
    }
  }
  else
  {
    id v14 = 0;
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)existingIMHandleWithID:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v9 = a4;
  if (v6 && (objc_msgSend_isEqualToString_(v6, v7, @"+", v8) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend_canonicalFormOfID_countryCode_(self, v10, (uint64_t)v6, (uint64_t)v9);
    if (objc_msgSend_isEqualToString_(v6, v13, (uint64_t)v12, v14))
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = IMCleanupPhoneNumber();
    }
    objc_msgSend_lock(self->_lock, v15, v16, v17);
    imHandles = self->_imHandles;
    uint64_t v21 = objc_msgSend_canonicalFormOfID_countryCode_(self, v20, (uint64_t)v6, (uint64_t)v9);
    id v11 = objc_msgSend_objectForKey_(imHandles, v22, (uint64_t)v21, v23);

    objc_msgSend_unlock(self->_lock, v24, v25, v26);
    if (v18)
    {
      uint64_t v30 = objc_msgSend_originalID(v11, v27, v28, v29);
      char isEqualToString = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v18, v32);

      if ((isEqualToString & 1) == 0)
      {
        long long v37 = objc_msgSend_trimmedString(v18, v34, v35, v36);
        if ((unint64_t)objc_msgSend_length(v37, v38, v39, v40) < 4)
        {
        }
        else
        {
          char hasPrefix = objc_msgSend_hasPrefix_(v18, v41, @"+", v42);

          if ((hasPrefix & 1) == 0)
          {
            objc_msgSend__updateOriginalID_(v11, v44, (uint64_t)v18, v45);
            objc_msgSend__setOriginalID_(v11, v46, (uint64_t)v18, v47);
          }
        }
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (unint64_t)sortOrderForIMHandle:(id)a3 inGroup:(id)a4
{
  sortOrders = self->_sortOrders;
  id v6 = a3;
  id v9 = objc_msgSend_objectForKey_(sortOrders, v7, (uint64_t)a4, v8);
  unint64_t v12 = objc_msgSend_indexOfObjectIdenticalTo_(v9, v10, (uint64_t)v6, v11);

  return v12;
}

- (void)setBuddyListAuthorization:(BOOL)a3 forIMHandle:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_ID(v6, v10, v11, v12);

  objc_msgSend_acceptSubscriptionRequest_from_account_(v15, v14, v4, (uint64_t)v13, self->_uniqueID);
}

- (void)requestBuddyListAuthorizationFromIMHandle:(id)a3
{
  id v4 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_ID(v4, v8, v9, v10);

  objc_msgSend_requestSubscriptionTo_account_(v13, v12, (uint64_t)v11, (uint64_t)self->_uniqueID);
}

- (id)handlesForCNContact:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMHandleRegistrar, v4, v5, v6);
  uint64_t v11 = objc_msgSend_identifier(v3, v8, v9, v10);

  uint64_t v14 = objc_msgSend_handlesForCNIdentifier_(v7, v12, (uint64_t)v11, v13);
  uint64_t v18 = objc_msgSend_allObjects(v14, v15, v16, v17);

  return v18;
}

- (void)_watchBuddiesIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_arrayOfAllIMHandles(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_copy(v5, v6, v7, v8);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v9;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend_watchingIMHandle(v19, v13, v14, v15, (void)v20) & 1) == 0) {
          objc_msgSend_startWatchingIMHandle_(self, v13, (uint64_t)v19, v15);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v16);
  }

  self->_needToCheckForWatchedIMHandles = 0;
}

- (void)watchBuddiesIfNecessary
{
  if (objc_msgSend_hasCapability_(self, a2, 0x200000000, v2) && !self->_needToCheckForWatchedIMHandles)
  {
    self->_needToCheckForWatchedIMHandles = 1;
    objc_msgSend_performSelector_withObject_afterDelay_(self, v4, (uint64_t)sel__watchBuddiesIfNecessary, 0, 1.0);
  }
}

- (void)startWatchingIMHandle:(id)a3
{
  long long v20 = (IMHandle *)a3;
  if (objc_msgSend_hasCapability_(self, v4, 0x200000000, v5)
    && (objc_msgSend_watchingIMHandle(v20, v6, v7, v8) & 1) == 0
    && self->_loginIMHandle != v20)
  {
    objc_msgSend_setHasTemporaryWatch_(v20, v9, 1, v10);
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
    uint64_t v18 = objc_msgSend_ID(v20, v15, v16, v17);
    objc_msgSend_startWatchingBuddy_account_(v14, v19, (uint64_t)v18, (uint64_t)self->_uniqueID);
  }
}

- (void)stopWatchingIMHandle:(id)a3
{
  uint64_t v18 = (IMHandle *)a3;
  if (objc_msgSend_watchingIMHandle(v18, v4, v5, v6) && self->_loginIMHandle != v18)
  {
    objc_msgSend_setHasTemporaryWatch_(v18, v7, 0, v8);
    uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11);
    uint64_t v16 = objc_msgSend_ID(v18, v13, v14, v15);
    objc_msgSend_stopWatchingBuddy_account_(v12, v17, (uint64_t)v16, (uint64_t)self->_uniqueID);
  }
}

- (void)forgetAllWatches
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_hasCapability_(self, a2, 0x200000000, v2))
  {
    uint64_t v7 = objc_msgSend_arrayOfAllIMHandles(self, v4, v5, v6);
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v11;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, (uint64_t)v24, 16);
    if (v14)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend_setHasTemporaryWatch_(*(void **)(*((void *)&v20 + 1) + 8 * v19++), v15, 0, v16, (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v20, (uint64_t)v24, 16);
      }
      while (v17);
    }
  }
}

- (void)unregisterIMHandleWithID:(id)a3
{
  locuint64_t k = self->_lock;
  id v5 = a3;
  objc_msgSend_lock(lock, v6, v7, v8);
  objc_msgSend_removeObjectForKey_(self->_imHandles, v9, (uint64_t)v5, v10);

  uint64_t v14 = self->_lock;

  objc_msgSend_unlock(v14, v11, v12, v13);
}

+ (id)arrayOfAllIMHandles
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = objc_msgSend_sharedInstance(IMAccountController, v3, v4, v5, 0);
  uint64_t v10 = objc_msgSend_accounts(v6, v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = objc_msgSend_arrayOfAllIMHandles(*(void **)(*((void *)&v26 + 1) + 8 * i), v13, v14, v15);
        if (objc_msgSend_count(v19, v20, v21, v22)) {
          objc_msgSend_addObjectsFromArray_(v2, v23, (uint64_t)v19, v24);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v16);
  }

  return v2;
}

+ (id)allBuddyListIMHandles
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = objc_msgSend_sharedInstance(IMAccountController, v3, v4, v5, 0);
  uint64_t v10 = objc_msgSend_accounts(v6, v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = objc_msgSend_buddyList(*(void **)(*((void *)&v27 + 1) + 8 * i), v13, v14, v15);
        long long v23 = objc_msgSend_people(v19, v20, v21, v22);
        objc_msgSend_addObjectsFromArray_(v2, v24, (uint64_t)v23, v25);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v16);
  }

  return v2;
}

- (void)disconnectAllIMHandles
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_login(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_imHandleWithID_(self, v6, (uint64_t)v5, v7);
  objc_msgSend_statusChanged_message_(v8, v9, 1, (uint64_t)&stru_1EF8E78C8);

  groups = self->_groups;
  self->_groups = 0;

  members = self->_members;
  self->_members = 0;

  sortOrders = self->_sortOrders;
  self->_sortOrders = 0;

  uint64_t v16 = objc_msgSend_arrayOfAllIMHandles(self, v13, v14, v15);
  long long v20 = objc_msgSend_copy(v16, v17, v18, v19);

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v21 = v20;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v23)
  {
    uint64_t v27 = v23;
    uint64_t v28 = *(void *)v42;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v21);
        }
        long long v30 = *(void **)(*((void *)&v41 + 1) + 8 * v29);
        uint64_t v31 = objc_msgSend_sharedInstance(IMHandleRegistrar, v24, v25, v26, (void)v41);
        objc_msgSend_clearSiblingCacheForIMHandle_(v31, v32, (uint64_t)v30, v33);

        long long v37 = objc_msgSend_buddyList(self, v34, v35, v36);
        objc_msgSend_removeIMHandle_(v37, v38, (uint64_t)v30, v39);

        objc_msgSend_statusChanged_message_(v30, v40, 0, (uint64_t)&stru_1EF8E78C8);
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v27);
  }
}

- (void)imHandle:(id)a3 buddyStatusChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v24 = a3;
  objc_msgSend_account(v24, v6, v7, v8);
  uint64_t v9 = (IMAccount *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    uint64_t v13 = objc_msgSend_buddyList(self, v10, v11, v12);
    if ((objc_msgSend_isLoginIMHandle(v24, v14, v15, v16) & 1) == 0)
    {
      if (v4)
      {
        objc_msgSend_setHasTemporaryWatch_(v24, v17, 0, v18);
        if (objc_msgSend_addIMHandle_(v13, v19, (uint64_t)v24, v20)
          && !objc_msgSend_status(v24, v21, v22, v23)
          && self->_hasReceivedSync)
        {
          objc_msgSend_statusChanged_(v24, v21, 1, v23);
        }
      }
      else
      {
        objc_msgSend_removeIMHandle_(v13, v17, (uint64_t)v24, v18);
      }
      objc_msgSend_postNotificationName_(v24, v21, @"__kIMHandleIsBuddyStatusChangedNotification", v23);
    }
  }
}

- (void)handleSubscriptionRequestFrom:(id)a3 withMessage:(id)a4
{
  id v15 = a4;
  uint64_t v8 = objc_msgSend_imHandleWithInfo_(self, v6, (uint64_t)a3, v7);
  if (objc_msgSend_isBuddy(v8, v9, v10, v11))
  {
    objc_msgSend_setBuddyListAuthorization_forIMHandle_(self, v12, 1, (uint64_t)v8);
  }
  else if (v15)
  {
    uint64_t v13 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v15, @"Message");
    objc_msgSend__postNotificationName_userInfo_(v8, v14, @"__kIMHandleAuthorizationRequestNotification", (uint64_t)v13);
  }
  else
  {
    objc_msgSend__postNotificationName_userInfo_(v8, v12, @"__kIMHandleAuthorizationRequestNotification", 0);
  }
}

- (void)nowLoggedOut
{
  objc_msgSend_disconnectAllIMHandles(self, a2, v2, v3);

  objc_msgSend_invalidSettings(self, v5, v6, v7);
}

- (id)chatIDForRoomName:(id)a3
{
  uint64_t v5 = objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v6, @" ", (uint64_t)&stru_1EF8E78C8);

  uint64_t v10 = objc_msgSend_componentsSeparatedByString_(v7, v8, @"@", v9);
  if (objc_msgSend_count(v10, v11, v12, v13))
  {
    uint64_t v17 = objc_msgSend___imFirstObject(v10, v14, v15, v16);
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ((unint64_t)objc_msgSend_count(v10, v14, v15, v16) < 2)
  {
    id v21 = 0;
    uint64_t v25 = objc_msgSend_length(0, v18, v19, v20);
  }
  else
  {
    id v21 = objc_msgSend_objectAtIndex_(v10, v18, 1, v20);
    uint64_t v25 = objc_msgSend_length(v21, v22, v23, v24);
  }
  if (!v25
    || (objc_msgSend_server(self, v26, v27, v28),
        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v21, v30, (uint64_t)v29, v31),
        v29,
        isEqualToString))
  {
    uint64_t v33 = objc_msgSend_defaultChatSuffix(self, v26, v27, v28);
    if (objc_msgSend_length(v33, v34, v35, v36))
    {
      id v37 = v33;

      id v21 = v37;
    }
  }
  if (objc_msgSend_length(v21, v26, v27, v28))
  {
    objc_msgSend_stringWithFormat_(NSString, v38, @"%@@%@", v39, v17, v21);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v40 = v17;
  }
  long long v41 = v40;

  return v41;
}

- (id)defaultChatSuffix
{
  if (objc_msgSend_hasCapability_(self, a2, 0x8000000000, v2))
  {
    uint64_t v6 = objc_msgSend_objectForKey_(self, v4, *MEMORY[0x1E4F6C6F8], v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (_FZChatRoomValidity)validityOfChatRoomName:(id)a3
{
  id v4 = a3;
  int v8 = objc_msgSend_length(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_service(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_serviceProperties(v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, *MEMORY[0x1E4F6BFF8], v18);
  int v23 = objc_msgSend_intValue(v19, v20, v21, v22);

  if (v23) {
    BOOL v27 = v8 < 1;
  }
  else {
    BOOL v27 = 1;
  }
  if (!v27)
  {
    uint64_t v28 = objc_msgSend_characterAtIndex_(v4, v24, 0, v26);
    if ((v28 - 58) > 0xFFFFFFF5)
    {
      uint64_t v77 = v28;
LABEL_30:
      uint64_t v80 = 2;
      goto LABEL_36;
    }
  }
  uint64_t v29 = objc_msgSend_service(self, v24, v25, v26);
  uint64_t v33 = objc_msgSend_serviceProperties(v29, v30, v31, v32);
  uint64_t v36 = objc_msgSend_objectForKey_(v33, v34, *MEMORY[0x1E4F6BFE8], v35);
  int v40 = objc_msgSend_intValue(v36, v37, v38, v39);

  long long v44 = objc_msgSend_service(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_serviceProperties(v44, v45, v46, v47);
  uint64_t v51 = objc_msgSend_objectForKey_(v48, v49, *MEMORY[0x1E4F6BFE0], v50);
  int v55 = objc_msgSend_intValue(v51, v52, v53, v54);

  uint64_t v59 = objc_msgSend_service(self, v56, v57, v58);
  uint64_t v63 = objc_msgSend_serviceProperties(v59, v60, v61, v62);
  uint64_t v66 = objc_msgSend_objectForKey_(v63, v64, *MEMORY[0x1E4F6BFF0], v65);
  int v70 = objc_msgSend_intValue(v66, v67, v68, v69);

  if (!(v40 | v70))
  {
LABEL_35:
    uint64_t v80 = 0;
    uint64_t v77 = 32;
    goto LABEL_36;
  }
  if (v8 < 1)
  {
    uint64_t v75 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
    if (v70)
    {
      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v82 = objc_msgSend_defaultChatSuffix(self, v71, v72, v73);
        uint64_t v86 = objc_msgSend_length(v82, v83, v84, v85);

        if (!v86)
        {
LABEL_37:
          uint64_t v77 = 64;
          uint64_t v80 = 3;
          goto LABEL_36;
        }
      }
    }
    goto LABEL_35;
  }
  uint64_t v74 = 0;
  uint64_t v75 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v76 = objc_msgSend_characterAtIndex_(v4, v71, v74, v73);
    uint64_t v77 = v76;
    if (v40)
    {
      BOOL v78 = !v55 && v76 == 32;
      BOOL v79 = v78;
      uint64_t v80 = 1;
      BOOL v81 = (v76 - 58) >= 0xFFFFFFF6 || (v76 & 0xFFFFFFDF) - 91 >= 0xFFFFFFE6;
      if (!v81 || v79) {
        break;
      }
    }
    if (v70 && v76 == 64)
    {
      uint64_t v77 = 64;
      if (!v74) {
        goto LABEL_30;
      }
      uint64_t v80 = 2;
      if (v75 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v75 = v74;
      if (v8 - 1 == v74) {
        goto LABEL_37;
      }
    }
    if (v8 == ++v74) {
      goto LABEL_32;
    }
  }
LABEL_36:

  return (_FZChatRoomValidity)(v80 | (v77 << 32));
}

- (NSString)authorizationToken
{
  if (objc_msgSend_supportsAuthorization(self, a2, v2, v3))
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = sub_1A4B3445C;
    uint64_t v39 = sub_1A4B34314;
    id v40 = 0;
    uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61760], v6, v7, v8);
    uint64_t v13 = objc_msgSend_authorizationID(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_login(self, v14, v15, v16);
    uint64_t v21 = objc_msgSend_internalName(self, v18, v19, v20);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_1A4B5FCF4;
    uint64_t v32 = &unk_1E5B7B850;
    uint64_t v34 = &v35;
    uint64_t v22 = v5;
    uint64_t v33 = v22;
    objc_msgSend_fetchAuthTokenForProfileID_username_service_outRequestID_completionBlock_(v9, v23, (uint64_t)v13, (uint64_t)v17, v21, 0, &v29);

    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    if (objc_msgSend_length((void *)v36[5], v24, v25, v26, v29, v30, v31, v32)) {
      id v27 = (id)v36[5];
    }
    else {
      id v27 = 0;
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v27 = 0;
  }

  return (NSString *)v27;
}

- (BOOL)requestNewAuthorizationCredentials
{
  return ((uint64_t (*)(IMAccount *, char *))MEMORY[0x1F4181798])(self, sel_authenticateAccount);
}

- (BOOL)authenticateAccount
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v8 = objc_msgSend_supportsAuthorization(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_uniqueID(self, v10, v11, v12);
      int v25 = 138412290;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_DEFAULT, "Client request to authenticate account: %@", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    uint64_t v21 = objc_msgSend_uniqueID(self, v18, v19, v20);
    objc_msgSend_authenticateAccount_(v17, v22, (uint64_t)v21, v23);
  }
  return v8;
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  id v4 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_uniqueID(self, v8, v9, v10);
  objc_msgSend_enrollDeviceForSMSRelay_account_(v13, v12, (uint64_t)v4, (uint64_t)v11);
}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  id v4 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_uniqueID(self, v8, v9, v10);
  objc_msgSend_unEnrollDeviceForSMSRelay_account_(v13, v12, (uint64_t)v4, (uint64_t)v11);
}

- (void)enrollSelfDeviceInSMSRelay
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  int v8 = objc_msgSend_uniqueID(self, v5, v6, v7);
  objc_msgSend_enrollSelfDeviceForSMSRelay_(v11, v9, (uint64_t)v8, v10);
}

- (BOOL)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v14 = objc_msgSend_supportsAuthorization(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12, v13);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = IMGetEnvironmentName();
      *(_DWORD *)buf = 138412802;
      id v42 = v6;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      uint64_t v46 = v16;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_DEFAULT, "Updating token for account %@:%@ (Environment: %@)", buf, 0x20u);
    }
    uint64_t v18 = *MEMORY[0x1E4F6C6C8];
    if (v6) {
      objc_msgSend__setObject_forKey_(self, v17, (uint64_t)v6, v18);
    }
    else {
      objc_msgSend__removeObjectForKey_(self, v17, *MEMORY[0x1E4F6C6C8], v18);
    }
    uint64_t v22 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61760], v19, v20, v21);
    uint64_t v26 = objc_msgSend_login(self, v23, v24, v25);
    uint64_t v30 = objc_msgSend_internalName(self, v27, v28, v29);
    objc_msgSend_setAuthTokenForProfileID_username_service_authToken_selfHandle_outRequestID_completionBlock_(v22, v31, (uint64_t)v6, (uint64_t)v26, v30, v7, 0, 0, &unk_1EF8E5B78);

    uint64_t v35 = objc_msgSend_sharedInstance(IMDaemonController, v32, v33, v34);
    objc_msgSend_updateAuthorizationCredentials_token_account_(v35, v36, (uint64_t)v6, (uint64_t)v7, self->_uniqueID);

    objc_msgSend_writeSettings(self, v37, v38, v39);
  }

  return v14;
}

- (NSString)regionID
{
  return (NSString *)objc_msgSend_profileValueForKey_(self, a2, @"Region", v2);
}

- (NSDictionary)profileInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend_count(self->_profile, v4, v5, v6)) {
    objc_msgSend_addEntriesFromDictionary_(v3, v7, (uint64_t)self->_profile, v9);
  }
  if (objc_msgSend_count(self->_profileChanges, v7, v8, v9)) {
    objc_msgSend_addEntriesFromDictionary_(v3, v10, (uint64_t)self->_profileChanges, v11);
  }

  return (NSDictionary *)v3;
}

- (id)profileStringForKey:(id)a3
{
  id v4 = objc_msgSend_profileValueForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)removeProfileValueForKey:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_profileValueForKey_(self, v5, (uint64_t)v4, v6);

  if (v7) {
    objc_msgSend_setProfileValue_forKey_(self, v8, 0, (uint64_t)v4);
  }

  return v7 != 0;
}

- (BOOL)setProfileValue:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    uint64_t v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEFAULT, "Setting profile value: %@   forKey: %@", (uint8_t *)&v26, 0x16u);
    }

    objc_msgSend_profileValueForKey_(self, v12, (uint64_t)v10, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 != v6)
    {
      if (v6)
      {
LABEL_10:
        if (!self->_profileChanges)
        {
          uint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          profileChanges = self->_profileChanges;
          self->_profileChanges = v22;
        }
        uint64_t v24 = self->_profileChanges;
        if (v6) {
          objc_msgSend_setObject_forKey_(v24, v14, (uint64_t)v6, (uint64_t)v10);
        }
        else {
          objc_msgSend_setObject_forKey_(v24, v14, (uint64_t)&stru_1EF8E78C8, (uint64_t)v10);
        }
        BOOL v20 = 1;
        goto LABEL_17;
      }
      uint64_t v17 = objc_msgSend_objectForKey_(self->_profile, v14, (uint64_t)v10, v15);
      if (v17)
      {

        goto LABEL_10;
      }
      uint64_t v21 = objc_msgSend_objectForKey_(self->_profileChanges, v18, (uint64_t)v10, v19);

      if (v21) {
        goto LABEL_10;
      }
    }
    BOOL v20 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)setProfileString:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = objc_msgSend_profileStringForKey_(self, v7, (uint64_t)v9, v8);
    uint64_t v13 = v10;
    if (v6 && v10 && (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)v6, v12) & 1) != 0) {
      char v14 = 0;
    }
    else {
      char v14 = objc_msgSend_setProfileValue_forKey_(self, v11, (uint64_t)v6, (uint64_t)v9);
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)validateProfile
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend_profileInfo(self, v6, v7, v8);
    int v21 = 138412290;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting validation of profile info: %@", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v13 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  uint64_t v17 = objc_msgSend_uniqueID(self, v14, v15, v16);
  objc_msgSend_validateProfileAccount_(v13, v18, (uint64_t)v17, v19);

  return 1;
}

- (NSArray)aliasesToRegister
{
  uint64_t v3 = objc_msgSend_objectForKey_(self, a2, *MEMORY[0x1E4F6C818], v2);
  id v4 = (void *)_IDSCopyOrderedAliasStrings();

  uint64_t v8 = objc_msgSend_array(v4, v5, v6, v7);

  return (NSArray *)v8;
}

- (BOOL)_aliasIsVisible:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasSuffix_(v4, v5, @"inbox.appleid.apple.com", v6))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    id v10 = objc_msgSend_objectForKey_(self, v7, *MEMORY[0x1E4F6B740], v8);
    int v9 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4, v12) ^ 1;
  }
  return v9;
}

- (id)_aliasInfoForAlias:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3);
  int v9 = objc_msgSend_trimmedString(v5, v6, v7, v8);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v13 = objc_msgSend__aliases(self, v10, v11, v12, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v37;
    uint64_t v20 = *MEMORY[0x1E4F6C698];
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_objectForKey_(v22, v16, v20, v17);
        id v27 = objc_msgSend_lowercaseString(v23, v24, v25, v26);
        uint64_t v31 = objc_msgSend_trimmedString(v27, v28, v29, v30);

        if (objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v9, v33))
        {
          id v34 = v22;

          goto LABEL_11;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v36, (uint64_t)v40, 16);
      if (v18) {
        continue;
      }
      break;
    }
  }
  id v34 = 0;
LABEL_11:

  return v34;
}

- (id)_statuses
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = objc_msgSend__aliases(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = *MEMORY[0x1E4F6C6A0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v4);
        }
        char v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        uint64_t v17 = objc_msgSend_objectForKey_(v14, v7, v12, v8);
        if (v17)
        {
          uint64_t v18 = objc_msgSend_objectForKey_(v14, v15, v12, v16);
          objc_msgSend_addObject_(v10, v19, (uint64_t)v18, v20);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isMakoAccount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend_aliasesToRegister(self, a2, v2, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend__aliasIsVisible_(self, v8, *(void *)(*((void *)&v15 + 1) + 8 * i), v9))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v15, (uint64_t)v19, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)hasAlias:(id)a3
{
  id v5 = objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_trimmedString(v5, v6, v7, v8);

  if (objc_msgSend_length(v9, v10, v11, v12))
  {
    long long v16 = objc_msgSend_aliases(self, v13, v14, v15);
    char v19 = objc_msgSend_containsObject_(v16, v17, (uint64_t)v9, v18);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (id)aliasesForType:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_aliases(self, a2, a3, v3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4B60CAC;
  v11[3] = &unk_1E5B7B898;
  v11[4] = self;
  v11[5] = a3;
  uint64_t v9 = objc_msgSend___imArrayByApplyingBlock_(v6, v7, (uint64_t)v11, v8);

  return v9;
}

- (BOOL)addAlias:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    int v18 = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    int v21 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to add alias: %@   account: %@", (uint8_t *)&v18, 0x16u);
  }
  if (v4)
  {
    BOOL v13 = IMSingleObjectArray();
    char v16 = objc_msgSend_addAliases_(self, v14, (uint64_t)v13, v15);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)addAliases:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    *(_DWORD *)buf = 138412546;
    id v71 = v4;
    __int16 v72 = 2112;
    uint64_t v73 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to add aliases: %@   account: %@", buf, 0x16u);
  }
  if (objc_msgSend_accountType(self, v13, v14, v15) == 2)
  {
    BOOL v18 = 0;
    id v19 = v4;
  }
  else
  {
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = sub_1A4B6117C;
    v68[3] = &unk_1E5B7B8C0;
    v68[4] = self;
    id v19 = objc_msgSend___imArrayByApplyingBlock_(v4, v16, (uint64_t)v68, v17);

    long long v23 = objc_msgSend__aliases(self, v20, v21, v22);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = sub_1A4B6127C;
    v66[3] = &unk_1E5B7B8C0;
    id v24 = v23;
    id v67 = v24;
    uint64_t v27 = objc_msgSend___imArrayByApplyingBlock_(v19, v25, (uint64_t)v66, v26);
    if (objc_msgSend_count(v27, v28, v29, v30))
    {
      id v34 = objc_msgSend__aliases(self, v31, v32, v33);
      id v38 = (id)objc_msgSend_mutableCopy(v34, v35, v36, v37);

      if (!v38) {
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v60 = v27;
      id v39 = v27;
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v62, (uint64_t)v69, 16);
      if (v41)
      {
        uint64_t v43 = v41;
        uint64_t v44 = *(void *)v63;
        uint64_t v45 = *MEMORY[0x1E4F6C698];
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v63 != v44) {
              objc_enumerationMutation(v39);
            }
            uint64_t v47 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v42, *(void *)(*((void *)&v62 + 1) + 8 * i), v45, v60);
            objc_msgSend_addObject_(v38, v48, (uint64_t)v47, v49);
          }
          uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v62, (uint64_t)v69, 16);
        }
        while (v43);
      }

      objc_msgSend__setLocalCachedObject_forKey_(self, v50, (uint64_t)v38, *MEMORY[0x1E4F6C6B8]);
      if (objc_msgSend_count(v19, v51, v52, v53))
      {
        uint64_t v57 = objc_msgSend_sharedInstance(IMDaemonController, v54, v55, v56);
        objc_msgSend_addAliases_account_(v57, v58, (uint64_t)v39, (uint64_t)self->_uniqueID);
      }
      BOOL v18 = objc_msgSend_count(v39, v54, v55, v56, v60) != 0;

      uint64_t v27 = v61;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  return v18;
}

- (BOOL)addAlias:(id)a3 type:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = objc_msgSend_uniqueID(self, v10, v11, v12);
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_DEFAULT, "Client request to add alias: %@   account: %@", (uint8_t *)&v18, 0x16u);
  }
  char v16 = objc_msgSend_addAlias_(self, v14, (uint64_t)v5, v15);

  return v16;
}

- (BOOL)removeAlias:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    int v18 = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to remove alias: %@  account: %@", (uint8_t *)&v18, 0x16u);
  }
  if (v4)
  {
    BOOL v13 = IMSingleObjectArray();
    char v16 = objc_msgSend_removeAliases_(self, v14, (uint64_t)v13, v15);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)removeAliases:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    *(_DWORD *)buf = 138412546;
    id v49 = v4;
    __int16 v50 = 2112;
    uint64_t v51 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to remove aliases: %@  account: %@", buf, 0x16u);
  }
  if (objc_msgSend_accountType(self, v13, v14, v15) == 2)
  {
    BOOL v18 = 0;
  }
  else
  {
    id v19 = objc_msgSend___imArrayByApplyingBlock_(v4, v16, (uint64_t)&unk_1EF8E3DB0, v17);
    long long v23 = objc_msgSend__aliases(self, v20, v21, v22);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = sub_1A4B617F4;
    v46[3] = &unk_1E5B7B8C0;
    id v24 = v19;
    id v47 = v24;
    uint64_t v27 = objc_msgSend___imArrayByApplyingBlock_(v23, v25, (uint64_t)v46, v26);

    uint64_t v31 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v28, v29, v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v27;
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_DEFAULT, "Final set of aliases after removes %@", buf, 0xCu);
    }

    if (v27 && objc_msgSend_count(v27, v32, v33, v34))
    {
      objc_msgSend__setObject_forKey_(self, v32, (uint64_t)v27, *MEMORY[0x1E4F6C6B8]);
    }
    else
    {
      id v38 = objc_msgSend_array(MEMORY[0x1E4F1C978], v32, v33, v34);
      objc_msgSend__setObject_forKey_(self, v39, (uint64_t)v38, *MEMORY[0x1E4F6C6B8]);
    }
    if (objc_msgSend_count(v4, v35, v36, v37))
    {
      uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v40, v41, v42);
      objc_msgSend_removeAliases_account_(v43, v44, (uint64_t)v4, (uint64_t)self->_uniqueID);
    }
    BOOL v18 = objc_msgSend_count(v4, v40, v41, v42) != 0;
  }
  return v18;
}

- (BOOL)removeAlias:(id)a3 type:(int64_t)a4
{
  return MEMORY[0x1F4181798](self, sel_removeAlias_, a3, a4);
}

- (int64_t)typeForAlias:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28E58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend_addCharactersInString_(v5, v6, @"+1234567890#* -().", v7);
  uint64_t v10 = objc_msgSend_stringByRemovingCharactersFromSet_(v4, v8, (uint64_t)v5, v9);

  uint64_t v14 = objc_msgSend_trimmedString(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);

  if (v18) {
    int64_t v19 = 1;
  }
  else {
    int64_t v19 = 2;
  }

  return v19;
}

- (BOOL)unvalidateAlias:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = IMSingleObjectArray();
  LOBYTE(self) = objc_msgSend_unvalidateAliases_(self, v5, (uint64_t)v4, v6);

  return (char)self;
}

- (BOOL)unvalidateAliases:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_accountType(self, v5, v6, v7) == 2)
  {
    BOOL v11 = 0;
    uint64_t v12 = v4;
  }
  else
  {
    uint64_t v13 = objc_msgSend_login(self, v8, v9, v10);
    uint64_t v14 = MEMORY[0x1A62639E0]();

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1A4B61ABC;
    v27[3] = &unk_1E5B7B8C0;
    id v15 = v14;
    id v28 = v15;
    uint64_t v12 = objc_msgSend___imArrayByApplyingBlock_(v4, v16, (uint64_t)v27, v17);

    if (objc_msgSend_count(v12, v18, v19, v20))
    {
      id v24 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      objc_msgSend_unvalidateAliases_account_(v24, v25, (uint64_t)v12, (uint64_t)self->_uniqueID);
    }
    BOOL v11 = objc_msgSend_count(v12, v21, v22, v23) != 0;
  }
  return v11;
}

- (BOOL)validateAlias:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    int v18 = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to validate alias: %@  account: %@", (uint8_t *)&v18, 0x16u);
  }
  if (v4)
  {
    uint64_t v13 = IMSingleObjectArray();
    char v16 = objc_msgSend_validateAliases_(self, v14, (uint64_t)v13, v15);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)validateAliases:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_uniqueID(self, v9, v10, v11);
    int v29 = 138412546;
    id v30 = v4;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Client request to validate aliases: %@  account: %@", (uint8_t *)&v29, 0x16u);
  }
  if (objc_msgSend_accountType(self, v13, v14, v15) == 2)
  {
    BOOL v18 = 0;
    id v19 = v4;
  }
  else
  {
    id v19 = objc_msgSend___imArrayByApplyingBlock_(v4, v16, (uint64_t)&unk_1EF8E3DD0, v17);

    if (objc_msgSend_count(v19, v20, v21, v22))
    {
      uint64_t v26 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
      objc_msgSend_validateAliases_account_(v26, v27, (uint64_t)v19, (uint64_t)self->_uniqueID);
    }
    BOOL v18 = objc_msgSend_count(v19, v23, v24, v25) != 0;
  }

  return v18;
}

- (int64_t)validationStatusForAlias:(id)a3
{
  id v5 = objc_msgSend__aliasInfoForAlias_(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = v5;
  if (v5)
  {
    uint64_t v9 = objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x1E4F6C6A0], v7);
    int v13 = objc_msgSend_intValue(v9, v10, v11, v12);

    if (v13 == 3
      || (objc_msgSend_objectForKey_(v8, v14, *MEMORY[0x1E4F6C698], v15),
          char v16 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_vettedAliases(self, v17, v18, v19),
          __int16 v20 = objc_claimAutoreleasedReturnValue(),
          char v23 = objc_msgSend_containsObject_(v20, v21, (uint64_t)v16, v22),
          v20,
          v16,
          (v23 & 1) == 0))
    {
      int64_t v24 = v13;
    }
    else
    {
      int64_t v24 = 3;
    }
  }
  else
  {
    int64_t v24 = 0;
  }

  return v24;
}

- (int64_t)validationErrorReasonForAlias:(id)a3
{
  id v4 = objc_msgSend__aliasInfoForAlias_(self, a2, (uint64_t)a3, v3);
  uint64_t v7 = v4;
  if (v4
    && (objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6C6B0], v6),
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = v8;
    int64_t v13 = (int)objc_msgSend_intValue(v8, v9, v10, v11);
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  int64_t v13 = (char *)a3;
  id v6 = a4;
  if (v6)
  {
    if (!self->_dataChanges)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dataChanges = self->_dataChanges;
      self->_dataChanges = v7;
    }
    uint64_t v9 = self->_dataChanges;
    if (v13) {
      objc_msgSend_setObject_forKey_(v9, v13, (uint64_t)v13, (uint64_t)v6);
    }
    else {
      objc_msgSend_setObject_forKey_(v9, 0, (uint64_t)&stru_1EF8E78C8, (uint64_t)v6);
    }
    objc_msgSend__invalidateCachedAliases(self, v10, v11, v12);
  }
}

- (void)_setLocalCachedObject:(id)a3 forKey:(id)a4
{
  int64_t v13 = (char *)a3;
  id v6 = a4;
  if (v6)
  {
    if (!self->_localCache)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      localCache = self->_localCache;
      self->_localCache = v7;
    }
    uint64_t v9 = self->_localCache;
    if (v13) {
      objc_msgSend_setObject_forKey_(v9, v13, (uint64_t)v13, (uint64_t)v6);
    }
    else {
      objc_msgSend_setObject_forKey_(v9, 0, (uint64_t)&stru_1EF8E78C8, (uint64_t)v6);
    }
    objc_msgSend__invalidateCachedAliases(self, v10, v11, v12);
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v8 = a4;
  if (qword_1E965E858 != -1) {
    dispatch_once(&qword_1E965E858, &unk_1EF8E3DF0);
  }
  if (objc_msgSend_containsObject_((void *)qword_1E965E850, v6, (uint64_t)v8, v7)) {
    objc_msgSend__setObject_forKey_(self, v9, (uint64_t)v10, (uint64_t)v8);
  }
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)_removeObjectForKey:(id)a3
{
}

- (id)stringForKey:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_1EF8E78C8;
  }

  return v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithBool_(v6, v8, v4, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithBool_(v6, v8, v4, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setObject_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);
}

- (int64_t)integerForKey:(id)a3
{
  BOOL v4 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v8 = objc_msgSend_integerValue(v4, v5, v6, v7);
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithInteger_(v6, v8, a3, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);
}

- (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithInteger_(v6, v8, a3, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setObject_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);
}

- (void)systemDidWake
{
  self->_asleep = 0;
}

- (void)systemWillSleep
{
  self->_asleep = 1;
}

- (BOOL)isAsleep
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class() && self->_asleep;
}

- (NSDictionary)_persistentProperties
{
  return self->_accountPersistentProperties;
}

- (id)_persistentPropertyForKey:(id)a3
{
  accountPersistentPropertiesChanges = self->_accountPersistentPropertiesChanges;
  id v5 = a3;
  int64_t v8 = objc_msgSend_objectForKey_(accountPersistentPropertiesChanges, v6, (uint64_t)v5, v7);

  uint64_t v11 = 312;
  if (!v8) {
    uint64_t v11 = 304;
  }
  uint64_t v12 = objc_msgSend_objectForKey_(*(void **)((char *)&self->super.isa + v11), v9, (uint64_t)v5, v10);

  return v12;
}

- (void)_setPersistentPropertyObject:(id)a3 forKey:(id)a4
{
  uint64_t v10 = (char *)a3;
  id v6 = a4;
  if (v6)
  {
    if (!self->_accountPersistentPropertiesChanges)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      accountPersistentPropertiesChanges = self->_accountPersistentPropertiesChanges;
      self->_accountPersistentPropertiesChanges = Mutable;
    }
    uint64_t v9 = self->_accountPersistentPropertiesChanges;
    if (v10) {
      objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)v10, (uint64_t)v6);
    }
    else {
      objc_msgSend_setObject_forKey_(v9, 0, (uint64_t)&stru_1EF8E78C8, (uint64_t)v6);
    }
  }
}

- (void)_removePersistentPropertyForKey:(id)a3
{
}

- (NSDictionary)accountPreferences
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend_count(self->_accountPreferences, v4, v5, v6)) {
    objc_msgSend_addEntriesFromDictionary_(v3, v7, (uint64_t)self->_accountPreferences, v9);
  }
  if (objc_msgSend_count(self->_accountPreferencesChanges, v7, v8, v9)) {
    objc_msgSend_addEntriesFromDictionary_(v3, v10, (uint64_t)self->_accountPreferencesChanges, v11);
  }

  return (NSDictionary *)v3;
}

- (id)objectForPreferenceKey:(id)a3
{
  accountPreferencesChanges = self->_accountPreferencesChanges;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(accountPreferencesChanges, v6, (uint64_t)v5, v7);

  uint64_t v11 = 296;
  if (!v8) {
    uint64_t v11 = 192;
  }
  uint64_t v12 = objc_msgSend_objectForKey_(*(void **)((char *)&self->super.isa + v11), v9, (uint64_t)v5, v10);

  return v12;
}

- (void)setObject:(id)a3 forPreferenceKey:(id)a4
{
  uint64_t v10 = (char *)a3;
  id v6 = a4;
  if (v6)
  {
    if (!self->_accountPreferencesChanges)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      accountPreferencesChanges = self->_accountPreferencesChanges;
      self->_accountPreferencesChanges = v7;
    }
    uint64_t v9 = self->_accountPreferencesChanges;
    if (v10) {
      objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)v10, (uint64_t)v6);
    }
    else {
      objc_msgSend_setObject_forKey_(v9, 0, (uint64_t)&stru_1EF8E78C8, (uint64_t)v6);
    }
  }
}

- (void)removeObjectForPreferenceKey:(id)a3
{
}

- (id)stringForPreferenceKey:(id)a3
{
  BOOL v4 = objc_msgSend_objectForPreferenceKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)BOOLForPreferenceKey:(id)a3
{
  BOOL v4 = objc_msgSend_objectForPreferenceKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v8 = objc_msgSend_BOOLValue(v4, v5, v6, v7);
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)setBool:(BOOL)a3 forPreferenceKey:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithBool_(v6, v8, v4, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forPreferenceKey_(self, v10, (uint64_t)v11, (uint64_t)v7);
}

- (int)integerForPreferenceKey:(id)a3
{
  BOOL v4 = objc_msgSend_objectForPreferenceKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = objc_msgSend_intValue(v4, v5, v6, v7);
  }
  else {
    int v8 = 0;
  }

  return v8;
}

- (void)setInteger:(int)a3 forPreferenceKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithInt_(v6, v8, v4, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forPreferenceKey_(self, v10, (uint64_t)v11, (uint64_t)v7);
}

- (NSString)displayName
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_aliases(self, a2, v2, v3);
  uint64_t v6 = (void *)_IDSCopyCallerID();
  uint64_t v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    displayName = self->_displayName;
    int v13 = 138412802;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    char v16 = displayName;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEFAULT, " => Returning Caller ID: %@   (Set: %@   Aliases: %@)", (uint8_t *)&v13, 0x20u);
  }

  return (NSString *)v6;
}

- (void)setDisplayName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = (NSString *)a3;
  if (self->_displayName != v7)
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5, v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      int v27 = 138412546;
      id v28 = displayName;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEFAULT, "Asked to change display name from: %@  to: %@", (uint8_t *)&v27, 0x16u);
    }

    if (((objc_msgSend__appearsToBeEmail(v7, v10, v11, v12) & 1) != 0
       || objc_msgSend__appearsToBePhoneNumber(v7, v13, v14, v15))
      && (objc_msgSend__appearsToBeDSID(v7, v13, v14, v15) & 1) == 0
      && objc_msgSend__updateDisplayName_(self, v16, (uint64_t)v7, v17))
    {
      uint64_t v21 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19, v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = self->_displayName;
        int v27 = 138412290;
        id v28 = v22;
        _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_DEFAULT, " Changed display name to: %@", (uint8_t *)&v27, 0xCu);
      }

      objc_msgSend__setObject_forKey_(self, v23, (uint64_t)self->_displayName, *MEMORY[0x1E4F6C708]);
      objc_msgSend_writeSettings(self, v24, v25, v26);
    }
  }
}

- (void)deregisterAsIDSIDQueryControllerDelegate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_service(self, a2, v2, v3);
  uint64_t v6 = sub_1A4B330DC(v5);

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_msgSend_keyTransparencyIDQueryListenerID(self, v11, v12, v13);
        int v21 = 138412546;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        int64_t v24 = self;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Removing IDSIDQueryControllerDelegate with listenerID %@ for %@", (uint8_t *)&v21, 0x16u);
      }
    }
    uint64_t v15 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6AB38], v7, v8, v9);
    uint64_t v19 = objc_msgSend_keyTransparencyIDQueryListenerID(self, v16, v17, v18);
    objc_msgSend_removeDelegate_forService_listenerID_(v15, v20, (uint64_t)self, (uint64_t)v6, v19);
  }
}

- (void)idsKTVerifierResultsUpdatedForDestinations:(id)a3 service:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v80 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_msgSend_accountDescription(self, v10, v11, v12);
      uint64_t v17 = objc_msgSend_allKeys(v5, v14, v15, v16);
      uint64_t v20 = objc_msgSend_componentsJoinedByString_(v17, v18, @", ", v19);
      *(_DWORD *)buf = 138412802;
      *(void *)uint64_t v90 = v80;
      *(_WORD *)&v90[8] = 2112;
      *(void *)&v90[10] = v13;
      __int16 v91 = 2112;
      uint64_t v92 = v20;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Received KTVerifierResult update from IDS for service %@, account %@, uris %@", buf, 0x20u);
    }
  }
  BOOL v81 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v6, v7, v8, self);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  int64_t v24 = objc_msgSend_allKeys(v5, v21, v22, v23);
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v82, (uint64_t)v88, 16);
  if (v29)
  {
    uint64_t v30 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v83 != v30) {
          objc_enumerationMutation(v24);
        }
        uint64_t v32 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        uint64_t v33 = objc_msgSend__stripFZIDPrefix(v32, v26, v27, v28);
        uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v5, v34, (uint64_t)v32, v35);
        id v40 = objc_msgSend_sharedController(IMKeyTransparencyController, v37, v38, v39);
        uint64_t v43 = objc_msgSend_ktVerifierResultForHandleID_(v40, v41, (uint64_t)v33, v42);

        if (v33)
        {
          if ((objc_msgSend_isEqual_(v43, v44, (uint64_t)v36, v45) & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              id v49 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                uint64_t v53 = objc_msgSend_uiStatus(v36, v50, v51, v52);
                *(_DWORD *)buf = 138412546;
                *(void *)uint64_t v90 = v33;
                *(_WORD *)&v90[8] = 2048;
                *(void *)&v90[10] = v53;
                _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "Updating status for URI: %@ to KTUIStatus: %lu", buf, 0x16u);
              }
            }
            uint64_t v54 = objc_msgSend_sharedController(IMKeyTransparencyController, v46, v47, v48);
            objc_msgSend_setKTVerifierResult_forHandleID_(v54, v55, (uint64_t)v36, (uint64_t)v33);

            objc_msgSend_addObject_(v81, v56, (uint64_t)v33, v57);
          }
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v58 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v90 = 0;
            _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "IDS tried to update the KTVerifierResult with no URI: %@. Skipping.", buf, 0xCu);
          }
        }
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v82, (uint64_t)v88, 16);
    }
    while (v29);
  }

  if (objc_msgSend_count(v81, v59, v60, v61))
  {
    if (IMOSLoggingEnabled())
    {
      long long v65 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        int v69 = objc_msgSend_count(v81, v66, v67, v68);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v90 = v69;
        *(_WORD *)&v90[4] = 2112;
        *(void *)&v90[6] = v81;
        _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "IDS callback triggered update UI for %d changed handles: %@", buf, 0x12u);
      }
    }
    uint64_t v86 = @"__kIMChatKTStatusChangedAffectedHandlesKey";
    int v70 = objc_msgSend_allObjects(v81, v62, v63, v64);
    uint64_t v87 = v70;
    __int16 v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)&v87, (uint64_t)&v86, 1);

    uint64_t v76 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v73, v74, v75);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v76, v77, @"__kIMChatKeyTransparencyStatusChangedNotification", v79, v72);
  }
}

- (void)setService:(id)a3
{
}

- (NSDictionary)accountSubtypeInfo
{
  return self->_accountSubtypeInfo;
}

- (void)setAccountSubtypeInfo:(id)a3
{
}

- (void)setRegistrationStatus:(int64_t)a3
{
  self->_int64_t registrationStatus = a3;
}

- (void)setRegistrationFailureReason:(int64_t)a3
{
  self->_registrationFailureReasouint64_t n = a3;
}

- (void)setCountryCode:(id)a3
{
}

- (void)setAliases:(id)a3
{
}

- (void)setVettedAliases:(id)a3
{
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (void)setLoginStatus:(unint64_t)a3
{
  self->_unint64_t loginStatus = a3;
}

- (void)setMyStatus:(unint64_t)a3
{
  self->_myStatus = a3;
}

- (void)setMyStatusMessage:(id)a3
{
}

- (void)setMyStatusDictionary:(id)a3
{
}

- (void)setMyIdleSince:(id)a3
{
}

- (void)setMyPictureData:(id)a3
{
}

- (NSAttributedString)myProfile
{
  return self->_myProfile;
}

- (void)setMyProfile:(id)a3
{
}

- (void)setStrippedLogin:(id)a3
{
}

- (BOOL)justLoggedIn
{
  return self->_justLoggedIn;
}

- (void)setJustLoggedIn:(BOOL)a3
{
  self->_justLoggedIuint64_t n = a3;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_unint64_t capabilities = a3;
}

- (IMPeople)buddyList
{
  return self->_buddyList;
}

- (void)setBuddyList:(id)a3
{
}

- (BOOL)blockIdleStatus
{
  return self->_blockIdleStatus;
}

- (void)setAccountPreferences:(id)a3
{
}

- (void)setLoginIMHandle:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMapTable)imHandles
{
  return self->_imHandles;
}

- (void)setImHandles:(id)a3
{
}

- (NSArray)cachedAllowList
{
  return self->_cachedAllowList;
}

- (NSArray)cachedBlockList
{
  return self->_cachedBlockList;
}

- (NSString)loginID
{
  return self->_loginID;
}

- (void)setLoginID:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSMutableDictionary)dataChanges
{
  return self->_dataChanges;
}

- (void)setDataChanges:(id)a3
{
}

- (NSMutableDictionary)localCache
{
  return self->_localCache;
}

- (void)setLocalCache:(id)a3
{
}

- (NSDictionary)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSMutableDictionary)profileChanges
{
  return self->_profileChanges;
}

- (void)setProfileChanges:(id)a3
{
}

- (int64_t)profileStatus
{
  return self->_profileStatus;
}

- (void)setProfileStatus:(int64_t)a3
{
  self->_profileStatus = a3;
}

- (NSMutableDictionary)accountPreferencesChanges
{
  return self->_accountPreferencesChanges;
}

- (void)setAccountPreferencesChanges:(id)a3
{
}

- (NSDictionary)accountPersistentProperties
{
  return self->_accountPersistentProperties;
}

- (void)setAccountPersistentProperties:(id)a3
{
}

- (NSMutableDictionary)accountPersistentPropertiesChanges
{
  return self->_accountPersistentPropertiesChanges;
}

- (void)setAccountPersistentPropertiesChanges:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSMutableDictionary)sortOrders
{
  return self->_sortOrders;
}

- (void)setSortOrders:(id)a3
{
}

- (NSDictionary)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (NSMutableDictionary)coalescedChanges
{
  return self->_coalescedChanges;
}

- (void)setCoalescedChanges:(id)a3
{
}

- (NSArray)targetGroupState
{
  return self->_targetGroupState;
}

- (void)setTargetGroupState:(id)a3
{
}

- (NSArray)lastReceivedGroupState
{
  return self->_lastReceivedGroupState;
}

- (void)setLastReceivedGroupState:(id)a3
{
}

- (NSDictionary)myNowPlaying
{
  return self->_myNowPlaying;
}

- (void)setMyNowPlaying:(id)a3
{
}

- (void)setDefaultHandleCapabilities:(unint64_t)a3
{
  self->_defaultHandleCapabilities = a3;
}

- (BOOL)hasCheckedDefaultHandleCapabilities
{
  return self->_hasCheckedDefaultHandleCapabilities;
}

- (void)setHasCheckedDefaultHandleCapabilities:(BOOL)a3
{
  self->_hasCheckedDefaultHandleCapabilities = a3;
}

- (NSDictionary)registrationAlertInfo
{
  return self->_registrationAlertInfo;
}

- (void)setRegistrationAlertInfo:(id)a3
{
}

- (BOOL)hasPostedOfflineNotification
{
  return self->_hasPostedOfflineNotification;
}

- (void)setHasPostedOfflineNotification:(BOOL)a3
{
  self->_hasPostedOfflineNotificatiouint64_t n = a3;
}

- (BOOL)useMeCardName
{
  return self->_useMeCardName;
}

- (void)setUseMeCardName:(BOOL)a3
{
  self->_useMeCardName = a3;
}

- (unsigned)cachedBlockingMode
{
  return self->_cachedBlockingMode;
}

- (BOOL)syncedWithRemoteBuddyList
{
  return self->_syncedWithRemoteBuddyList;
}

- (void)setSyncedWithRemoteBuddyList:(BOOL)a3
{
  self->_syncedWithRemoteBuddyList = a3;
}

- (BOOL)hasReceivedSync
{
  return self->_hasReceivedSync;
}

- (void)setHasReceivedSync:(BOOL)a3
{
  self->_hasReceivedSync = a3;
}

- (int)numHolding
{
  return self->_numHolding;
}

- (void)setNumHolding:(int)a3
{
  self->_int numHolding = a3;
}

- (int)coalesceCount
{
  return self->_coalesceCount;
}

- (void)setCoalesceCount:(int)a3
{
  self->_int coalesceCount = a3;
}

- (BOOL)needToCheckForWatchedIMHandles
{
  return self->_needToCheckForWatchedIMHandles;
}

- (void)setNeedToCheckForWatchedIMHandles:(BOOL)a3
{
  self->_needToCheckForWatchedIMHandles = a3;
}

- (BOOL)hasBeenRemoved
{
  return self->_hasBeenRemoved;
}

- (void)setHasBeenRemoved:(BOOL)a3
{
  self->_hasBeenRemoved = a3;
}

- (id)smallImage
{
  return self->_smallImage;
}

- (void)setSmallImage:(id)a3
{
}

- (id)accountImage
{
  return self->_accountImage;
}

- (void)setAccountImage:(id)a3
{
}

- (BOOL)asleep
{
  return self->_asleep;
}

- (void)setAsleep:(BOOL)a3
{
  self->_asleep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTransparencyIDQueryListenerID, 0);
  objc_storeStrong(&self->_accountImage, 0);
  objc_storeStrong(&self->_smallImage, 0);
  objc_storeStrong((id *)&self->_registrationAlertInfo, 0);
  objc_storeStrong((id *)&self->_myNowPlaying, 0);
  objc_storeStrong((id *)&self->_lastReceivedGroupState, 0);
  objc_storeStrong((id *)&self->_targetGroupState, 0);
  objc_storeStrong((id *)&self->_coalescedChanges, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_sortOrders, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_accountPersistentPropertiesChanges, 0);
  objc_storeStrong((id *)&self->_accountPersistentProperties, 0);
  objc_storeStrong((id *)&self->_accountPreferencesChanges, 0);
  objc_storeStrong((id *)&self->_profileChanges, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_storeStrong((id *)&self->_dataChanges, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_cachedBlockList, 0);
  objc_storeStrong((id *)&self->_cachedAllowList, 0);
  objc_storeStrong((id *)&self->_imHandles, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_loginIMHandle, 0);
  objc_storeStrong((id *)&self->_accountPreferences, 0);
  objc_storeStrong((id *)&self->_buddyList, 0);
  objc_storeStrong((id *)&self->_strippedLogin, 0);
  objc_storeStrong((id *)&self->_myProfile, 0);
  objc_storeStrong((id *)&self->_myPictureData, 0);
  objc_storeStrong((id *)&self->_myIdleSince, 0);
  objc_storeStrong((id *)&self->_myStatusDictionary, 0);
  objc_storeStrong((id *)&self->_myStatusMessage, 0);
  objc_storeStrong((id *)&self->_vettedAliases, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_accountSubtypeInfo, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end