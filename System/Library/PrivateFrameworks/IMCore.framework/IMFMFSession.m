@interface IMFMFSession
+ (id)sharedInstance;
- (BOOL)_canShareLocationWithFMLHandle:(id)a3 isFromGroup:(BOOL)a4;
- (BOOL)allChatParticipantsFollowingMyLocation:(id)a3;
- (BOOL)allChatParticipantsSharingLocationWithMe:(id)a3;
- (BOOL)chatHasParticipantsFollowingMyLocation:(id)a3;
- (BOOL)chatHasParticipantsSharingLocationWithMe:(id)a3;
- (BOOL)chatHasSiblingParticipantsSharingLocationWithMe:(id)a3;
- (BOOL)disableLocationSharing;
- (BOOL)findMyHandleIsFollowingMyLocation:(id)a3;
- (BOOL)findMyHandleIsSharingLocationWithMe:(id)a3;
- (BOOL)handleIsFollowingMyLocation:(id)a3;
- (BOOL)handleIsSharingLocationWithMe:(id)a3;
- (BOOL)imIsProvisionedForLocationSharing;
- (BOOL)restrictLocationSharing;
- (Class)__FMFSessionClass;
- (Class)__FMLSessionClass;
- (FMFSession)session;
- (IMFMFSession)init;
- (IMFindMyDevice)activeDevice;
- (NSString)establishingAccountID;
- (id)_accountStore;
- (id)_bestAccountForAddresses:(id)a3;
- (id)_callerIDForChat:(id)a3;
- (id)_dateFromShareDuration:(int64_t)a3;
- (id)allSiblingFindMyHandlesForChat:(id)a3;
- (id)findMyHandlesForChat:(id)a3;
- (id)findMyHandlesSharingLocationWithMe;
- (id)findMyLocationForFindMyHandle:(id)a3;
- (id)findMyLocationForHandle:(id)a3;
- (id)findMyLocationForHandleOrSibling:(id)a3;
- (id)findMyURLForChat:(id)a3;
- (id)fmfGroupIdGroup;
- (id)fmfGroupIdOneToOne;
- (id)fmlSession;
- (id)timedOfferExpirationForChat:(id)a3;
- (unint64_t)fmfProvisionedState;
- (void)_accountStoreDidChangeNotification:(id)a3;
- (void)_configureFindMyLocateSession;
- (void)_initializeFindMySessionIfInAllowedProcess;
- (void)_postNotification:(id)a3 object:(id)a4 userInfo:(id)a5;
- (void)_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:(id)a3;
- (void)_setUpFindMyLocateSessionCallbacks;
- (void)_startFMLSessionMonitoring;
- (void)_startRefreshingLocationForFMLHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5;
- (void)_startSharingWithFMFHandles:(id)a3 inChat:(id)a4 untilDate:(id)a5;
- (void)_startSharingWithFMLHandles:(id)a3 inChat:(id)a4 withDuration:(int64_t)a5;
- (void)_stopSharingWithFMFHandles:(id)a3 inChat:(id)a4;
- (void)_stopSharingWithFMLHandles:(id)a3 inChat:(id)a4;
- (void)_stopTrackingLocationForFMLHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5;
- (void)_updateActiveDevice;
- (void)dealloc;
- (void)didChangeActiveLocationSharingDevice:(id)a3;
- (void)didReceiveLocation:(id)a3;
- (void)didReceiveLocationForHandle:(id)a3;
- (void)didStartAbilityToGetLocationForHandle:(id)a3;
- (void)didStartSharingMyLocationWithHandle:(id)a3;
- (void)didStopAbilityToGetLocationForHandle:(id)a3;
- (void)didStopSharingMyLocationWithHandle:(id)a3;
- (void)friendshipRequestReceived:(id)a3;
- (void)friendshipWasRemoved:(id)a3;
- (void)makeThisDeviceActiveDevice;
- (void)refreshLocationForChat:(id)a3;
- (void)refreshLocationForHandle:(id)a3 inChat:(id)a4;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4;
- (void)setActiveDevice:(id)a3;
- (void)setEstablishingAccountID:(id)a3;
- (void)setFmfProvisionedState:(unint64_t)a3;
- (void)setFmlSession:(id)a3;
- (void)setSession:(id)a3;
- (void)startSharingWithChat:(id)a3 withDuration:(int64_t)a4;
- (void)startSharingWithHandle:(id)a3 inChat:(id)a4 withDuration:(int64_t)a5;
- (void)startTrackingLocationForChat:(id)a3;
- (void)startTrackingLocationForHandle:(id)a3;
- (void)stopSharingWithChat:(id)a3;
- (void)stopSharingWithHandle:(id)a3 inChat:(id)a4;
- (void)stopTrackingLocationForChat:(id)a3;
- (void)stopTrackingLocationForHandle:(id)a3;
@end

@implementation IMFMFSession

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  v7.receiver = self;
  v7.super_class = (Class)IMFMFSession;
  [(IMFMFSession *)&v7 dealloc];
}

- (IMFMFSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMFMFSession;
  uint64_t v2 = [(IMFMFSession *)&v8 init];
  v6 = v2;
  if (v2) {
    objc_msgSend__initializeFindMySessionIfInAllowedProcess(v2, v3, v4, v5);
  }
  return v6;
}

- (void)_initializeFindMySessionIfInAllowedProcess
{
  char IsLockedDown = objc_msgSend_deviceIsLockedDown(MEMORY[0x1E4F6E730], a2, v2, v3);
  v9 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v6, v7, v8);
  int isWaldoEnabled = objc_msgSend_isWaldoEnabled(v9, v10, v11, v12);

  if (IMIsRunningInImagent())
  {
    int v17 = 1;
    if (IsLockedDown)
    {
LABEL_13:
      v36 = IMLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB998C();
      }
LABEL_15:

      return;
    }
  }
  else
  {
    int v17 = IMIsRunningInMessagesUIProcess();
    if (IsLockedDown) {
      goto LABEL_13;
    }
  }
  if (!(isWaldoEnabled ^ 1 | v17)) {
    goto LABEL_13;
  }
  v18 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v14, v15, v16);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v18, v19, v20, v21);

  int v23 = IMOSLoggingEnabled();
  if (SessionEnabled)
  {
    if (v23)
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "FindMyLocateSession is enabled. Attempting to configure the session.", buf, 2u);
      }
    }
    v28 = (objc_class *)objc_msgSend___FMLSessionClass(self, v24, v25, v26);
    if (v28)
    {
      id v29 = objc_alloc_init(v28);
      id fmlSession = self->_fmlSession;
      self->_id fmlSession = v29;

      objc_msgSend_setFmfProvisionedState_(self, v31, 0, v32);
      objc_msgSend__configureFindMyLocateSession(self, v33, v34, v35);
      return;
    }
    v36 = IMLogHandleForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9958();
    }
    goto LABEL_15;
  }
  if (v23)
  {
    v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "FindMyLocateSession is disabled. Attempting to configure the legacy FMFSession.", v56, 2u);
    }
  }
  v38 = (objc_class *)objc_msgSend___FMFSessionClass(self, v24, v25, v26);
  if (v38)
  {
    id v39 = [v38 alloc];
    v42 = (FMFSession *)objc_msgSend_initWithDelegate_(v39, v40, (uint64_t)self, v41);
    session = self->_session;
    self->_session = v42;

    v44 = self->_session;
    v48 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v45, v46, v47);
    objc_msgSend_setDelegateQueue_(v44, v49, (uint64_t)v48, v50);

    objc_msgSend__updateActiveDevice(self, v51, v52, v53);
    objc_msgSend_setFmfProvisionedState_(self, v54, 0, v55);
  }
}

- (void)_configureFindMyLocateSession
{
  objc_msgSend__setUpFindMyLocateSessionCallbacks(self, a2, v2, v3);

  MEMORY[0x1F4181798](self, sel__startFMLSessionMonitoring, v5, v6);
}

- (void)_setUpFindMyLocateSessionCallbacks
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (SessionEnabled)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v13 = objc_msgSend_fmlSession(self, v10, v11, v12);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v18 = objc_msgSend_fmlSession(self, v15, v16, v17);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = sub_1A4C4F5BC;
      v50[3] = &unk_1E5B7EEA8;
      objc_copyWeak(&v51, &location);
      objc_msgSend_setLocationUpdateCallback_(v18, v19, (uint64_t)v50, v20);

      objc_destroyWeak(&v51);
    }
    else
    {
      v24 = IMLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9A28();
      }
    }
    uint64_t v25 = objc_msgSend_fmlSession(self, v21, v22, v23);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      v30 = objc_msgSend_fmlSession(self, v27, v28, v29);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = sub_1A4C4F6E8;
      v48[3] = &unk_1E5B7EEF8;
      objc_copyWeak(&v49, &location);
      objc_msgSend_setFriendshipUpdateCallback_(v30, v31, (uint64_t)v48, v32);

      objc_destroyWeak(&v49);
    }
    else
    {
      v36 = IMLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB99F4();
      }
    }
    v37 = objc_msgSend_fmlSession(self, v33, v34, v35);
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      v42 = objc_msgSend_fmlSession(self, v39, v40, v41);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = sub_1A4C4F960;
      v46[3] = &unk_1E5B7EF20;
      objc_copyWeak(&v47, &location);
      objc_msgSend_setMeDeviceUpdateCallback_(v42, v43, (uint64_t)v46, v44);

      objc_destroyWeak(&v47);
    }
    else
    {
      v45 = IMLogHandleForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB99C0();
      }
    }
    objc_destroyWeak(&location);
  }
}

- (void)_startFMLSessionMonitoring
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (SessionEnabled)
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "_startFMLSessionMonitoring: kicking off initial updates.", buf, 2u);
      }
    }
    char v14 = objc_msgSend_fmlSession(self, v10, v11, v12);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v19 = objc_msgSend_fmlSession(self, v16, v17, v18);
      objc_msgSend_startUpdatingFriendsWithInitialUpdates_completion_(v19, v20, 0, (uint64_t)&unk_1EF8E5818);
    }
    else
    {
      v19 = IMLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9B34();
      }
    }

    v24 = objc_msgSend_fmlSession(self, v21, v22, v23);
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      uint64_t v29 = objc_msgSend_fmlSession(self, v26, v27, v28);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = sub_1A4C4FF40;
      v55[3] = &unk_1E5B7EF68;
      v55[4] = self;
      objc_msgSend_getFriendsSharingLocationsWithMeWithCompletion_(v29, v30, (uint64_t)v55, v31);
    }
    else
    {
      uint64_t v29 = IMLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9B00();
      }
    }

    uint64_t v35 = objc_msgSend_fmlSession(self, v32, v33, v34);
    char v36 = objc_opt_respondsToSelector();

    if (v36)
    {
      uint64_t v40 = objc_msgSend_fmlSession(self, v37, v38, v39);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = sub_1A4C5011C;
      v54[3] = &unk_1E5B7EF68;
      v54[4] = self;
      objc_msgSend_getFriendsFollowingMyLocationWithCompletion_(v40, v41, (uint64_t)v54, v42);
    }
    else
    {
      uint64_t v40 = IMLogHandleForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9B00();
      }
    }

    uint64_t v46 = objc_msgSend_fmlSession(self, v43, v44, v45);
    char v47 = objc_opt_respondsToSelector();

    if (v47)
    {
      id v51 = objc_msgSend_fmlSession(self, v48, v49, v50);
      objc_msgSend_startMonitoringActiveLocationSharingDeviceChangeWithCompletion_(v51, v52, (uint64_t)&unk_1EF8E60B8, v53);
    }
    else
    {
      id v51 = IMLogHandleForCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9ACC();
      }
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1EB3F2500 != -1) {
    dispatch_once(&qword_1EB3F2500, &unk_1EF8E4370);
  }
  uint64_t v2 = (void *)qword_1EB3F2560;

  return v2;
}

- (BOOL)restrictLocationSharing
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (!SessionEnabled)
  {
    uint64_t v13 = objc_msgSend___FMFSessionClass(self, v10, v11, v12);
    if (v13) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v13 = objc_msgSend___FMLSessionClass(self, v10, v11, v12);
  if (!v13) {
    return 0;
  }
LABEL_3:

  return MEMORY[0x1F4181798](v13, sel_FMFRestricted, v14, v15);
}

- (BOOL)disableLocationSharing
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (!SessionEnabled)
  {
    uint64_t v18 = objc_msgSend___FMFSessionClass(self, v10, v11, v12);
    if (v18)
    {
      if (!objc_msgSend_FMFAllowed(v18, v14, v15, v16)) {
        goto LABEL_4;
      }
LABEL_7:
      int v17 = objc_msgSend_imIsProvisionedForLocationSharing(self, v14, v15, v16) ^ 1;
      return v17 | objc_msgSend_deviceIsLockedDown(MEMORY[0x1E4F6E730], v14, v15, v16);
    }
LABEL_8:
    LOBYTE(v17) = 0;
    return v17 | objc_msgSend_deviceIsLockedDown(MEMORY[0x1E4F6E730], v14, v15, v16);
  }
  uint64_t v13 = objc_msgSend___FMLSessionClass(self, v10, v11, v12);
  if (!v13) {
    goto LABEL_8;
  }
  if (objc_msgSend_FMFAllowed(v13, v14, v15, v16)) {
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v17) = 1;
  return v17 | objc_msgSend_deviceIsLockedDown(MEMORY[0x1E4F6E730], v14, v15, v16);
}

- (BOOL)imIsProvisionedForLocationSharing
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_fmfProvisionedState(self, a2, v2, v3)) {
    return objc_msgSend_fmfProvisionedState(self, v5, v6, v7) == 1;
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
  objc_msgSend_removeObserver_(v8, v9, (uint64_t)self, v10);

  uint64_t v14 = objc_msgSend__accountStore(self, v11, v12, v13);
  uint64_t v20 = objc_msgSend_aa_primaryAppleAccountWithPreloadedDataclasses(v14, v15, v16, v17);
  if (!v20) {
    goto LABEL_10;
  }
  id v21 = *(id *)MEMORY[0x1A6263B50]("ACAccountDataclassShareLocation", @"Accounts");
  if (!v21)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "IMFMFSession - Failed to weak link ACAccountDataclassShareLocation", (uint8_t *)&v37, 2u);
      }
    }
    goto LABEL_10;
  }
  v24 = v21;
  int isProvisionedForDataclass = objc_msgSend_isProvisionedForDataclass_(v20, v22, (uint64_t)v21, v23);

  if (isProvisionedForDataclass)
  {
LABEL_10:
    uint64_t v26 = 1;
    objc_msgSend_setFmfProvisionedState_(self, v18, 1, v19);
    goto LABEL_11;
  }
  uint64_t v26 = 2;
  objc_msgSend_setFmfProvisionedState_(self, v18, 2, v19);
LABEL_11:
  id v31 = *(id *)MEMORY[0x1A6263B50]("ACAccountStoreDidChangeNotification", @"Accounts");
  if (v31)
  {
    uint64_t v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v28, v29, v30);
    objc_msgSend_addObserver_selector_name_object_(v32, v33, (uint64_t)self, (uint64_t)sel__accountStoreDidChangeNotification_, v31, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "IMFMFSession - Failed to weak link ACAccountStoreDidChangeNotification", (uint8_t *)&v37, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "-[IMFMFSession imIsProvisionedForLocationSharing]";
      __int16 v39 = 2048;
      uint64_t v40 = v26;
      _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "%s provisioned state generated is %lu", (uint8_t *)&v37, 0x16u);
    }
  }
  return objc_msgSend_fmfProvisionedState(self, v5, v6, v7) == 1;
}

- (id)_accountStore
{
  if (qword_1E965DDD0 != -1) {
    dispatch_once(&qword_1E965DDD0, &unk_1EF8E59D8);
  }
  uint64_t v2 = (void *)qword_1E965DE00;

  return v2;
}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Account store did change, invalidating FMF provision state", v8, 2u);
    }
  }
  objc_msgSend_setFmfProvisionedState_(self, v5, 0, v6);
}

- (id)findMyHandlesForChat:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_participants(a3, a2, (uint64_t)a3, v3);
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = objc_msgSend_count(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_initWithCapacity_(v5, v10, v9, v11);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v4;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = objc_msgSend_ID(*(void **)(*((void *)&v29 + 1) + 8 * i), v16, v17, v18, (void)v29);
        char v25 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v23, (uint64_t)v22, v24);

        if (v25) {
          objc_msgSend_addObject_(v12, v26, (uint64_t)v25, v27);
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v19);
  }

  return v12;
}

- (id)findMyURLForChat:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_findMyHandlesForChat_(self, a2, (uint64_t)a3, v3);
  id v5 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_fmfHandle(v15, v9, v10, v11);

        if (v16)
        {
          uint64_t v17 = objc_msgSend_fmfHandle(v15, v9, v10, v11);
          id v21 = objc_msgSend_identifier(v17, v18, v19, v20);
          objc_msgSend_addObject_(v5, v22, (uint64_t)v21, v23);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v12);
  }

  if (objc_msgSend_count(v5, v24, v25, v26))
  {
    objc_msgSend_componentsJoinedByString_(v5, v27, @",", v29);
    long long v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v30 = &stru_1EF8E78C8;
  }
  long long v31 = NSString;
  long long v32 = objc_msgSend_URLPathAllowedCharacterSet(MEMORY[0x1E4F28B88], v27, v28, v29);
  uint64_t v35 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v30, v33, (uint64_t)v32, v34);
  uint64_t v38 = objc_msgSend_stringWithFormat_(v31, v36, @"findmy://fr/%@", v37, v35);

  uint64_t v41 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v39, (uint64_t)v38, v40);

  return v41;
}

- (id)allSiblingFindMyHandlesForChat:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_participants(a3, a2, (uint64_t)a3, v3);
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = objc_msgSend_count(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_initWithCapacity_(v5, v10, v9, v11);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v4;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = objc_msgSend_findMySiblingHandles(*(void **)(*((void *)&v26 + 1) + 8 * i), v16, v17, v18, (void)v26);
        objc_msgSend_unionSet_(v12, v23, (uint64_t)v22, v24);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v19);
  }

  return v12;
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Forwarding mapping packet: %@ to daemon for ID: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  uint64_t v16 = objc_msgSend_identifier(v7, v13, v14, v15);
  uint64_t v20 = objc_msgSend_establishingAccountID(self, v17, v18, v19);
  objc_msgSend_sendMappingPacket_toHandle_account_(v12, v21, (uint64_t)v6, (uint64_t)v16, v20);
}

- (void)_startRefreshingLocationForFMLHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v28 = v8;
      if (v5) {
        id v13 = @"YES";
      }
      __int16 v29 = 2048;
      int64_t v30 = a4;
      __int16 v31 = 2112;
      long long v32 = v13;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "_startRefreshingLocationForFMLHandles handles: %@, priority: %ld, isFromGroup: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_count(v8, v9, v10, v11)
    && (objc_msgSend_fmlSession(self, v14, v15, v16),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = objc_opt_respondsToSelector(),
        v17,
        (v18 & 1) != 0))
  {
    int v22 = objc_msgSend_fmlSession(self, v19, v20, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1A4C511F0;
    v25[3] = &unk_1E5B7EF90;
    uint64_t v26 = v8;
    objc_msgSend_startRefreshingLocationForHandles_priority_isFromGroup_reverseGeocode_completion_(v22, v23, (uint64_t)v26, 0, v5, 1, v25);

    __int16 v24 = v26;
  }
  else
  {
    __int16 v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9C38();
    }
  }
}

- (void)startTrackingLocationForHandle:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend_findMyHandle(a3, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v6, v7, v8);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v9, v10, v11, v12);

  if (SessionEnabled)
  {
    uint64_t v17 = objc_msgSend_fmlHandle(v5, v14, v15, v16);

    if (v17)
    {
      uint64_t v21 = objc_msgSend_fmlHandle(v5, v18, v19, v20);
      v40[0] = v21;
      id v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v40, 1);
      objc_msgSend__startRefreshingLocationForFMLHandles_priority_isFromGroup_(self, v24, (uint64_t)v23, 0, 0);
    }
  }
  else
  {
    id v25 = objc_msgSend_fmfHandle(v5, v14, v15, v16);

    if (v25)
    {
      __int16 v29 = objc_msgSend_session(self, v26, v27, v28);
      int64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v34 = objc_msgSend_fmfHandle(v5, v31, v32, v33);
      uint64_t v37 = objc_msgSend_setWithObjects_(v30, v35, (uint64_t)v34, v36, 0);
      objc_msgSend_addHandles_(v29, v38, (uint64_t)v37, v39);
    }
  }
}

- (void)startTrackingLocationForChat:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "", v42, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_allSiblingFindMyHandlesForChat_(self, v5, (uint64_t)v4, v6);
  uint64_t v12 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v9, v10, v11);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v12, v13, v14, v15);

  if (SessionEnabled)
  {
    uint64_t v20 = objc_msgSend___im_fmlHandles(v8, v17, v18, v19);
    int v24 = objc_msgSend_chatStyle(v4, v21, v22, v23);
    if (objc_msgSend_count(v20, v25, v26, v27))
    {
      BOOL v31 = v24 != 45;
      uint64_t v32 = objc_msgSend_allObjects(v20, v28, v29, v30);
      objc_msgSend__startRefreshingLocationForFMLHandles_priority_isFromGroup_(self, v33, (uint64_t)v32, 0, v31);
LABEL_10:
    }
  }
  else
  {
    uint64_t v20 = objc_msgSend___im_fmfHandles(v8, v17, v18, v19);
    if (objc_msgSend_count(v20, v34, v35, v36))
    {
      uint64_t v32 = objc_msgSend_session(self, v37, v38, v39);
      objc_msgSend_addHandles_(v32, v40, (uint64_t)v20, v41);
      goto LABEL_10;
    }
  }
}

- (void)_stopTrackingLocationForFMLHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v28 = v8;
      if (v5) {
        id v13 = @"YES";
      }
      __int16 v29 = 2048;
      int64_t v30 = a4;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "_stopTrackingLocationForFMLHandles handles: %@, priority: %ld, isFromGroup: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_count(v8, v9, v10, v11)
    && (objc_msgSend_fmlSession(self, v14, v15, v16),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = objc_opt_respondsToSelector(),
        v17,
        (v18 & 1) != 0))
  {
    uint64_t v22 = objc_msgSend_fmlSession(self, v19, v20, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1A4C517F4;
    v25[3] = &unk_1E5B7EF90;
    uint64_t v26 = v8;
    objc_msgSend_stopRefreshingLocationForHandles_priority_isFromGroup_completion_(v22, v23, (uint64_t)v26, a4, v5, v25);

    int v24 = v26;
  }
  else
  {
    int v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9C38();
    }
  }
}

- (void)stopTrackingLocationForHandle:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend_findMyHandle(a3, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v6, v7, v8);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v9, v10, v11, v12);

  if (SessionEnabled)
  {
    uint64_t v17 = objc_msgSend_fmlHandle(v5, v14, v15, v16);

    if (v17)
    {
      uint64_t v21 = objc_msgSend_fmlHandle(v5, v18, v19, v20);
      v40[0] = v21;
      uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v40, 1);
      objc_msgSend__stopTrackingLocationForFMLHandles_priority_isFromGroup_(self, v24, (uint64_t)v23, 0, 0);
    }
  }
  else
  {
    id v25 = objc_msgSend_fmfHandle(v5, v14, v15, v16);

    if (v25)
    {
      __int16 v29 = objc_msgSend_session(self, v26, v27, v28);
      int64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v34 = objc_msgSend_fmfHandle(v5, v31, v32, v33);
      uint64_t v37 = objc_msgSend_setWithObjects_(v30, v35, (uint64_t)v34, v36, 0);
      objc_msgSend_removeHandles_(v29, v38, (uint64_t)v37, v39);
    }
  }
}

- (void)stopTrackingLocationForChat:(id)a3
{
  id v45 = a3;
  uint64_t v6 = objc_msgSend_allSiblingFindMyHandlesForChat_(self, v4, (uint64_t)v45, v5);
  uint64_t v10 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v7, v8, v9);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v10, v11, v12, v13);

  if (!SessionEnabled)
  {
    char v18 = objc_msgSend___im_fmfHandles(v6, v15, v16, v17);
    if (!objc_msgSend_count(v18, v37, v38, v39)) {
      goto LABEL_8;
    }
    uint64_t v35 = objc_msgSend_session(self, v40, v41, v42);
    objc_msgSend_removeHandles_(v35, v43, (uint64_t)v18, v44);
    goto LABEL_7;
  }
  char v18 = objc_msgSend___im_fmlHandles(v6, v15, v16, v17);
  int v22 = objc_msgSend_chatStyle(v45, v19, v20, v21);
  if (objc_msgSend_count(v18, v23, v24, v25))
  {
    __int16 v29 = objc_msgSend_fmlSession(self, v26, v27, v28);
    char v30 = objc_opt_respondsToSelector();

    if (v30)
    {
      BOOL v34 = v22 != 45;
      uint64_t v35 = objc_msgSend_allObjects(v18, v31, v32, v33);
      objc_msgSend__stopTrackingLocationForFMLHandles_priority_isFromGroup_(self, v36, (uint64_t)v35, 0, v34);
LABEL_7:
    }
  }
LABEL_8:
}

- (id)_dateFromShareDuration:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], a2, 1, v3);
    uint64_t v9 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v6, v7, v8);
    id v4 = objc_msgSend_nextDateAfterDate_matchingUnit_value_options_(v5, v10, (uint64_t)v9, 32, 4, 1024);
  }
  else if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], a2, 0, v3, 3600.0);
  }

  return v4;
}

- (void)startSharingWithHandle:(id)a3 inChat:(id)a4 withDuration:(int64_t)a5
{
  id v43 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F6E778];
  id v9 = a4;
  uint64_t v13 = objc_msgSend_sharedFeatureFlags(v8, v10, v11, v12);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v13, v14, v15, v16);

  if (SessionEnabled)
  {
    uint64_t v21 = objc_msgSend_findMyHandle(v43, v18, v19, v20);
    uint64_t v25 = objc_msgSend_fmlHandle(v21, v22, v23, v24);

    if (v25) {
      objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v26, (uint64_t)v25, v28);
    }
    else {
    uint64_t v36 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v26, v27, v28);
    }
    objc_msgSend__startSharingWithFMLHandles_inChat_withDuration_(self, v40, (uint64_t)v36, (uint64_t)v9, a5);
  }
  else
  {
    uint64_t v25 = objc_msgSend__dateFromShareDuration_(self, v18, a5, v20);
    uint64_t v32 = objc_msgSend_findMyHandle(v43, v29, v30, v31);
    uint64_t v36 = objc_msgSend_fmfHandle(v32, v33, v34, v35);

    if (v36) {
      objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v37, (uint64_t)v36, v39);
    }
    else {
    uint64_t v41 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v37, v38, v39);
    }
    objc_msgSend__startSharingWithFMFHandles_inChat_untilDate_(self, v42, v41, (uint64_t)v9, v25);

    id v9 = (id)v41;
  }
}

- (void)stopSharingWithHandle:(id)a3 inChat:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F6E778];
  id v8 = a3;
  uint64_t v12 = objc_msgSend_sharedFeatureFlags(v7, v9, v10, v11);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v12, v13, v14, v15);

  uint64_t v20 = objc_msgSend_findMyHandle(v8, v17, v18, v19);

  if (SessionEnabled)
  {
    uint64_t v24 = objc_msgSend_fmlHandle(v20, v21, v22, v23);

    if (v24)
    {
      v32[0] = v24;
      uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v32, 1);
      objc_msgSend__stopSharingWithFMLHandles_inChat_(self, v27, (uint64_t)v26, (uint64_t)v6);
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F1CBF0];
      objc_msgSend__stopSharingWithFMLHandles_inChat_(self, v25, MEMORY[0x1E4F1CBF0], (uint64_t)v6);
    }
  }
  else
  {
    uint64_t v24 = objc_msgSend_fmfHandle(v20, v21, v22, v23);

    if (v24) {
      objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v28, (uint64_t)v24, v30);
    }
    else {
    uint64_t v26 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v28, v29, v30);
    }
    objc_msgSend__stopSharingWithFMFHandles_inChat_(self, v31, (uint64_t)v26, (uint64_t)v6);
  }
}

- (void)startSharingWithChat:(id)a3 withDuration:(int64_t)a4
{
  id v30 = a3;
  id v9 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v6, v7, v8);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v9, v10, v11, v12);

  uint64_t v16 = objc_msgSend_findMyHandlesForChat_(self, v14, (uint64_t)v30, v15);
  uint64_t v20 = v16;
  if (SessionEnabled)
  {
    uint64_t v21 = objc_msgSend___im_fmlHandles(v16, v17, v18, v19);

    objc_msgSend__startSharingWithFMLHandles_inChat_withDuration_(self, v22, (uint64_t)v21, (uint64_t)v30, a4);
  }
  else
  {
    uint64_t v21 = objc_msgSend___im_fmfHandles(v16, v17, v18, v19);

    if (objc_msgSend_count(v21, v23, v24, v25))
    {
      uint64_t v28 = objc_msgSend__dateFromShareDuration_(self, v26, a4, v27);
      objc_msgSend__startSharingWithFMFHandles_inChat_untilDate_(self, v29, (uint64_t)v21, (uint64_t)v30, v28);
    }
  }
}

- (void)stopSharingWithChat:(id)a3
{
  id v29 = a3;
  uint64_t v7 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v4, v5, v6);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v7, v8, v9, v10);

  uint64_t v14 = objc_msgSend_allSiblingFindMyHandlesForChat_(self, v12, (uint64_t)v29, v13);
  uint64_t v18 = v14;
  if (SessionEnabled)
  {
    uint64_t v19 = objc_msgSend___im_fmlHandles(v14, v15, v16, v17);

    uint64_t v23 = objc_msgSend_allObjects(v19, v20, v21, v22);
    objc_msgSend__stopSharingWithFMLHandles_inChat_(self, v24, (uint64_t)v23, (uint64_t)v29);
  }
  else
  {
    uint64_t v19 = objc_msgSend___im_fmfHandles(v14, v15, v16, v17);

    if (objc_msgSend_count(v19, v25, v26, v27)) {
      objc_msgSend__stopSharingWithFMFHandles_inChat_(self, v28, (uint64_t)v19, (uint64_t)v29);
    }
  }
}

- (id)findMyLocationForHandle:(id)a3
{
  uint64_t v5 = objc_msgSend_findMyHandle(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_findMyLocationForFindMyHandle_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)findMyLocationForFindMyHandle:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v8, v9, v10, v11);

  if (SessionEnabled)
  {
    uint64_t v16 = objc_msgSend_fmlHandle(v4, v13, v14, v15);

    if (v16)
    {
      uint64_t v20 = objc_msgSend_fmlSession(self, v17, v18, v19);
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        uint64_t v25 = objc_msgSend_fmlSession(self, v22, v23, v24);
        id v29 = objc_msgSend_fmlHandle(v4, v26, v27, v28);
        uint64_t v32 = objc_msgSend_cachedLocationForHandle_(v25, v30, (uint64_t)v29, v31);

        if (v32)
        {
          uint64_t v35 = objc_msgSend_locationWithFMLLocation_(IMFindMyLocation, v33, (uint64_t)v32, v34);
        }
        else
        {
          uint64_t v35 = 0;
        }

        goto LABEL_17;
      }
      uint64_t v50 = IMLogHandleForCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9D88();
      }
    }
    else
    {
      uint64_t v50 = IMLogHandleForCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9D54();
      }
    }
  }
  else
  {
    uint64_t v36 = objc_msgSend_fmfHandle(v4, v13, v14, v15);

    if (v36)
    {
      uint64_t v40 = objc_msgSend_session(self, v37, v38, v39);
      uint64_t v44 = objc_msgSend_fmfHandle(v4, v41, v42, v43);
      char v47 = objc_msgSend_cachedLocationForHandle_(v40, v45, (uint64_t)v44, v46);
      uint64_t v35 = objc_msgSend_locationWithFMFLocation_(IMFindMyLocation, v48, (uint64_t)v47, v49);

      goto LABEL_17;
    }
    uint64_t v50 = IMLogHandleForCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9DBC();
    }
  }

  uint64_t v35 = 0;
LABEL_17:

  return v35;
}

- (id)findMyLocationForHandleOrSibling:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_findMyHandlesSharingLocationWithMe(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_cnContactWithKeys_(v4, v9, MEMORY[0x1E4F1CBF0], v10);
  uint64_t v14 = (void *)v11;
  if (!v11)
  {
    v79 = objc_msgSend_findMyLocationForHandle_(self, v12, (uint64_t)v4, v13);
    v83 = objc_msgSend_fmfLocation(v79, v80, v81, v82);
    v87 = objc_msgSend_location(v83, v84, v85, v86);
    if (v87)
    {
    }
    else
    {
      v91 = objc_msgSend_fmlLocation(v79, v88, v89, v90);

      if (!v91)
      {
        id v45 = 0;
        goto LABEL_40;
      }
    }
    id v45 = v79;
LABEL_40:

    goto LABEL_41;
  }
  id v93 = v4;
  uint64_t v94 = v11;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  objc_msgSend_phoneNumbersForCNContact_(MEMORY[0x1E4F6E6D8], v12, v11, v13);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v101, (uint64_t)v106, 16);
  v96 = self;
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v102;
  uint64_t v19 = &off_1E5B79000;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v102 != v18) {
        objc_enumerationMutation(obj);
      }
      char v21 = IMInternationalForPhoneNumberWithOptions();
      uint64_t v24 = objc_msgSend_handleWithIdentifier_(v19[442], v22, (uint64_t)v21, v23);
      if ((objc_msgSend_containsObject_(v8, v25, (uint64_t)v24, v26) & 1) == 0)
      {

        goto LABEL_14;
      }
      id v29 = v8;
      id v30 = v19;
      uint64_t v31 = objc_msgSend_findMyLocationForFindMyHandle_(self, v27, (uint64_t)v24, v28);
      uint64_t v35 = objc_msgSend_fmfLocation(v31, v32, v33, v34);
      uint64_t v39 = objc_msgSend_location(v35, v36, v37, v38);
      if (v39)
      {

LABEL_12:
        id v45 = v31;
        goto LABEL_13;
      }
      uint64_t v44 = objc_msgSend_fmlLocation(v31, v40, v41, v42);

      if (v44) {
        goto LABEL_12;
      }
      id v45 = 0;
LABEL_13:

      self = v96;
      uint64_t v19 = v30;
      uint64_t v8 = v29;
      if (v45) {
        goto LABEL_35;
      }
LABEL_14:
      ++v20;
    }
    while (v17 != v20);
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v101, (uint64_t)v106, 16);
    uint64_t v17 = v46;
  }
  while (v46);
LABEL_18:

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  objc_msgSend_emailsForCNContact_(MEMORY[0x1E4F6E6D8], v47, v94, v48);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v97, (uint64_t)v105, 16);
  if (!v50) {
    goto LABEL_34;
  }
  uint64_t v54 = v50;
  uint64_t v55 = *(void *)v98;
  while (2)
  {
    uint64_t v56 = 0;
    while (2)
    {
      if (*(void *)v98 != v55) {
        objc_enumerationMutation(obj);
      }
      v57 = objc_msgSend_lowercaseString(*(void **)(*((void *)&v97 + 1) + 8 * v56), v51, v52, v53);
      v60 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v58, (uint64_t)v57, v59);
      if (objc_msgSend_containsObject_(v8, v61, (uint64_t)v60, v62))
      {
        v65 = objc_msgSend_findMyLocationForFindMyHandle_(self, v63, (uint64_t)v60, v64);
        v69 = objc_msgSend_fmfLocation(v65, v66, v67, v68);
        v73 = objc_msgSend_location(v69, v70, v71, v72);
        if (v73)
        {

          goto LABEL_28;
        }
        v77 = objc_msgSend_fmlLocation(v65, v74, v75, v76);

        if (v77) {
LABEL_28:
        }
          id v45 = v65;
        else {
          id v45 = 0;
        }

        self = v96;
        if (v45) {
          goto LABEL_35;
        }
      }
      else
      {
      }
      if (v54 != ++v56) {
        continue;
      }
      break;
    }
    uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v97, (uint64_t)v105, 16);
    uint64_t v54 = v78;
    if (v78) {
      continue;
    }
    break;
  }
LABEL_34:
  id v45 = 0;
LABEL_35:

  id v4 = v93;
  uint64_t v14 = (void *)v94;
LABEL_41:

  return v45;
}

- (void)refreshLocationForHandle:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v8, v9, v10);
  char SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v11, v12, v13, v14);

  if ((SessionEnabled & 1) == 0)
  {
    uint64_t v18 = objc_msgSend__callerIDForChat_(self, v16, (uint64_t)v7, v17);
    uint64_t v25 = objc_msgSend_fmfHandle(v6, v19, v20, v21);
    if (v25)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_msgSend_fmfHandle(v6, v22, v23, v24);
      id v30 = objc_msgSend_setWithObject_(v26, v28, (uint64_t)v27, v29);

      uint64_t v34 = objc_msgSend_session(self, v31, v32, v33);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1A4C52978;
      v37[3] = &unk_1E5B7EFB8;
      id v38 = v30;
      id v39 = v18;
      uint64_t v40 = self;
      id v41 = v6;
      uint64_t v35 = v30;
      objc_msgSend_refreshLocationForHandles_callerId_priority_completion_(v34, v36, (uint64_t)v35, (uint64_t)v39, 1, v37);
    }
    else
    {
      uint64_t v35 = IMLogHandleForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9DF0();
      }
    }
  }
}

- (void)refreshLocationForChat:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  char SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v8, v9, v10, v11);

  if ((SessionEnabled & 1) == 0)
  {
    uint64_t v15 = objc_msgSend__callerIDForChat_(self, v13, (uint64_t)v4, v14);
    uint64_t v19 = objc_msgSend_allSiblingFindMyHandles(v4, v16, v17, v18);
    uint64_t v23 = objc_msgSend___im_fmfHandles(v19, v20, v21, v22);

    uint64_t v27 = objc_msgSend_session(self, v24, v25, v26);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1A4C52BE0;
    v31[3] = &unk_1E5B7EFB8;
    id v32 = v23;
    id v33 = v15;
    uint64_t v34 = self;
    id v35 = v4;
    id v28 = v15;
    id v29 = v23;
    objc_msgSend_refreshLocationForHandles_callerId_priority_completion_(v27, v30, (uint64_t)v29, (uint64_t)v28, 1, v31);
  }
}

- (BOOL)handleIsSharingLocationWithMe:(id)a3
{
  uint64_t v5 = objc_msgSend_findMyHandle(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_findMyHandleIsSharingLocationWithMe_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (id)findMyHandlesSharingLocationWithMe
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (SessionEnabled)
  {
    uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1C978], v10, v11, v12);
    uint64_t v17 = objc_msgSend_fmlSession(self, v14, v15, v16);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v22 = objc_msgSend_fmlSession(self, v19, v20, v21);
      uint64_t v26 = objc_msgSend_cachedFriendsSharingLocationsWithMe(v22, v23, v24, v25);
      id v30 = v26;
      if (v26)
      {
        id v31 = v26;
      }
      else
      {
        objc_msgSend_array(MEMORY[0x1E4F1C978], v27, v28, v29);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v45 = v31;

      uint64_t v13 = v45;
    }
    uint64_t v46 = (void *)MEMORY[0x1E4F1CAD0];
    char v47 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v19, (uint64_t)v13, v21);
    uint64_t v44 = objc_msgSend___im_findMyHandlesWithFMLFriends_(v46, v48, (uint64_t)v47, v49);
  }
  else
  {
    id v32 = objc_msgSend_session(self, v10, v11, v12);
    uint64_t v36 = objc_msgSend_getHandlesSharingLocationsWithMe(v32, v33, v34, v35);
    uint64_t v40 = v36;
    if (v36)
    {
      id v41 = v36;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E4F1CAD0], v37, v38, v39);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = v41;

    uint64_t v44 = objc_msgSend___im_findMyHandlesWithFMFHandles_(MEMORY[0x1E4F1CAD0], v42, (uint64_t)v13, v43);
  }

  return v44;
}

- (BOOL)findMyHandleIsSharingLocationWithMe:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v8 = objc_msgSend_findMyHandlesSharingLocationWithMe(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (BOOL)chatHasParticipantsSharingLocationWithMe:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_findMyHandlesSharingLocationWithMe(self, v5, v6, v7);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = objc_msgSend_findMyHandles(v4, v9, v10, v11, 0);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend_containsObject_(v8, v14, *(void *)(*((void *)&v20 + 1) + 8 * i), v15))
        {
          LOBYTE(v16) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v20, (uint64_t)v24, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v16;
}

- (BOOL)chatHasSiblingParticipantsSharingLocationWithMe:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_findMyHandlesSharingLocationWithMe(self, v5, v6, v7);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = objc_msgSend_allSiblingFindMyHandles(v4, v9, v10, v11, 0);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend_containsObject_(v8, v14, *(void *)(*((void *)&v20 + 1) + 8 * i), v15))
        {
          LOBYTE(v16) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v20, (uint64_t)v24, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v16;
}

- (BOOL)allChatParticipantsSharingLocationWithMe:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_findMyHandlesSharingLocationWithMe(self, v5, v6, v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = objc_msgSend_findMyHandles(v4, v9, v10, v11, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v12);
        }
        if (!objc_msgSend_containsObject_(v8, v15, *(void *)(*((void *)&v22 + 1) + 8 * i), v16))
        {
          BOOL v20 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

- (BOOL)handleIsFollowingMyLocation:(id)a3
{
  uint64_t v5 = objc_msgSend_findMyHandle(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_findMyHandleIsFollowingMyLocation_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (BOOL)findMyHandleIsFollowingMyLocation:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v8, v9, v10, v11);

  if (!SessionEnabled)
  {
    id v33 = objc_msgSend_session(self, v13, v14, v15);
    uint64_t v29 = objc_msgSend_getHandlesFollowingMyLocation(v33, v34, v35, v36);

    uint64_t v43 = objc_msgSend_fmfHandle(v4, v37, v38, v39);
    if (v43)
    {
      uint64_t v44 = objc_msgSend_fmfHandle(v4, v40, v41, v42);
      char v47 = objc_msgSend_containsObject_(v29, v45, (uint64_t)v44, v46);
    }
    else
    {
      char v47 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4)
  {
    uint64_t v16 = objc_msgSend_fmlSession(self, v13, v14, v15);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      long long v21 = (void *)MEMORY[0x1E4F1CAD0];
      long long v22 = objc_msgSend_fmlSession(self, v18, v19, v20);
      uint64_t v26 = objc_msgSend_cachedFriendsFollowingMyLocation(v22, v23, v24, v25);
      uint64_t v29 = objc_msgSend_setWithArray_(v21, v27, (uint64_t)v26, v28);

      if (v29) {
        objc_msgSend___im_findMyHandlesWithFMLFriends_(MEMORY[0x1E4F1CAD0], v30, (uint64_t)v29, v32);
      }
      else {
      uint64_t v43 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v30, v31, v32);
      }
      char v47 = objc_msgSend_containsObject_(v43, v48, (uint64_t)v4, v49);
      goto LABEL_12;
    }
  }
  char v47 = 0;
LABEL_13:

  return v47;
}

- (BOOL)_canShareLocationWithFMLHandle:(id)a3 isFromGroup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9
    && (objc_msgSend_fmlSession(self, v6, v7, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v15 = objc_msgSend_fmlSession(self, v12, v13, v14);
    uint64_t v17 = objc_msgSend_cachedCanShareLocationWithHandle_isFromGroup_(v15, v16, (uint64_t)v9, v4);

    BOOL v18 = v17 == 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = @"NO";
        int v24 = 138413058;
        id v25 = v9;
        if (v4) {
          long long v21 = @"YES";
        }
        else {
          long long v21 = @"NO";
        }
        uint64_t v27 = v21;
        __int16 v26 = 2112;
        if (!v17) {
          uint64_t v20 = @"YES";
        }
        __int16 v28 = 2048;
        uint64_t v29 = v17;
        __int16 v30 = 2112;
        uint64_t v31 = v20;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "FindMyLocateSession cachedCanShareLocationWithHandle: %@ isGroup: %@ shareState: %lu canShare: %@", (uint8_t *)&v24, 0x2Au);
      }
    }
  }
  else
  {
    long long v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9E58();
    }

    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)chatHasParticipantsFollowingMyLocation:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v11 = objc_msgSend_chatStyle(v4, v5, v6, v7);
  if (v11 == 45)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_fmfGroupIdGroup(self, v8, v9, v10);
  }
  uint64_t v13 = objc_msgSend__callerIDForChat_(self, v8, (uint64_t)v4, v10);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  objc_msgSend_participants(v4, v14, v15, v16);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v63, (uint64_t)v68, 16);
  if (v56)
  {
    uint64_t v57 = *(void *)v64;
    id v54 = v4;
    uint64_t v55 = v13;
    while (2)
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v64 != v57) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        long long v23 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v18, v19, v20);
        int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v23, v24, v25, v26);

        if (SessionEnabled)
        {
          uint64_t v31 = v12;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v32 = objc_msgSend_findMySiblingHandles(v22, v28, v29, v30);
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v59, (uint64_t)v67, 16);
          if (v34)
          {
            uint64_t v38 = v34;
            uint64_t v39 = *(void *)v60;
            while (2)
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v60 != v39) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v41 = objc_msgSend_fmlHandle(*(void **)(*((void *)&v59 + 1) + 8 * j), v35, v36, v37);
                char v43 = objc_msgSend__canShareLocationWithFMLHandle_isFromGroup_(self, v42, (uint64_t)v41, v11 != 45);

                if (v43)
                {

                  BOOL v52 = 1;
                  uint64_t v12 = v31;
                  id v4 = v54;
                  uint64_t v13 = v55;
                  goto LABEL_26;
                }
              }
              uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v59, (uint64_t)v67, 16);
              if (v38) {
                continue;
              }
              break;
            }
          }

          uint64_t v12 = v31;
          uint64_t v13 = v55;
        }
        else
        {
          uint64_t v44 = objc_msgSend_findMyHandle(v22, v28, v29, v30);
          uint64_t v48 = objc_msgSend_fmfHandle(v44, v45, v46, v47);

          if (v48)
          {
            uint64_t v49 = objc_msgSend_session(self, v18, v19, v20);
            char canShareLocationWithHandle_groupId_callerId = objc_msgSend_canShareLocationWithHandle_groupId_callerId_(v49, v50, (uint64_t)v48, (uint64_t)v12, v13);

            if (canShareLocationWithHandle_groupId_callerId)
            {
              BOOL v52 = 1;
              id v4 = v54;
              goto LABEL_26;
            }
          }
        }
      }
      BOOL v52 = 0;
      id v4 = v54;
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v63, (uint64_t)v68, 16);
      if (v56) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v52 = 0;
  }
LABEL_26:

  return v52;
}

- (BOOL)allChatParticipantsFollowingMyLocation:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v11 = objc_msgSend_chatStyle(v4, v5, v6, v7);
  if (v11 == 45)
  {
    long long v61 = 0;
  }
  else
  {
    long long v61 = objc_msgSend_fmfGroupIdGroup(self, v8, v9, v10);
  }
  long long v60 = objc_msgSend__callerIDForChat_(self, v8, (uint64_t)v4, v10);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  objc_msgSend_participants(v4, v12, v13, v14);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v67, (uint64_t)v72, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v68;
    unint64_t v22 = 0x1E4F6E000uLL;
    id v58 = v4;
    while (2)
    {
      uint64_t v23 = 0;
      uint64_t v59 = v20;
      do
      {
        if (*(void *)v68 != v21) {
          objc_enumerationMutation(obj);
        }
        int v24 = *(void **)(*((void *)&v67 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend_sharedFeatureFlags(*(void **)(v22 + 1912), v17, v18, v19);
        int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v25, v26, v27, v28);

        if (SessionEnabled)
        {
          uint64_t v33 = v21;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v34 = objc_msgSend_findMySiblingHandles(v24, v30, v31, v32);
          uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v63, (uint64_t)v71, 16);
          if (v36)
          {
            uint64_t v40 = v36;
            uint64_t v41 = *(void *)v64;
            while (2)
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v64 != v41) {
                  objc_enumerationMutation(v34);
                }
                char v43 = objc_msgSend_fmlHandle(*(void **)(*((void *)&v63 + 1) + 8 * i), v37, v38, v39);
                char v45 = objc_msgSend__canShareLocationWithFMLHandle_isFromGroup_(self, v44, (uint64_t)v43, v11 != 45);

                if (v45)
                {

                  uint64_t v21 = v33;
                  unint64_t v22 = 0x1E4F6E000;
                  uint64_t v20 = v59;
                  goto LABEL_23;
                }
              }
              uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v63, (uint64_t)v71, 16);
              if (v40) {
                continue;
              }
              break;
            }
          }

LABEL_28:
          LOBYTE(v50) = 0;
LABEL_29:
          id v4 = v58;
          goto LABEL_30;
        }
        uint64_t v46 = objc_msgSend_findMyHandle(v24, v30, v31, v32);
        uint64_t v50 = objc_msgSend_fmfHandle(v46, v47, v48, v49);

        if (!v50) {
          goto LABEL_29;
        }
        id v54 = objc_msgSend_session(self, v51, v52, v53);
        int canShareLocationWithHandle_groupId_callerId = objc_msgSend_canShareLocationWithHandle_groupId_callerId_(v54, v55, (uint64_t)v50, (uint64_t)v61, v60);

        if (!canShareLocationWithHandle_groupId_callerId) {
          goto LABEL_28;
        }
LABEL_23:
        ++v23;
      }
      while (v23 != v20);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v67, (uint64_t)v72, 16);
      LOBYTE(v50) = 1;
      id v4 = v58;
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v50) = 1;
  }
LABEL_30:

  return (char)v50;
}

- (id)timedOfferExpirationForChat:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_chatStyle(v4, v5, v6, v7) == 45) {
    objc_msgSend_fmfGroupIdOneToOne(self, v8, v9, v10);
  }
  else {
  int v11 = objc_msgSend_fmfGroupIdGroup(self, v8, v9, v10);
  }
  long long v61 = objc_msgSend__callerIDForChat_(self, v12, (uint64_t)v4, v13);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v60 = v4;
  objc_msgSend_participants(v4, v14, v15, v16);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v63, (uint64_t)v67, 16);
  if (!v18)
  {
    id v23 = 0;
    goto LABEL_23;
  }
  uint64_t v22 = v18;
  id v23 = 0;
  uint64_t v24 = *(void *)v64;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v64 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = objc_msgSend_findMyHandle(*(void **)(*((void *)&v63 + 1) + 8 * i), v19, v20, v21);
      uint64_t v30 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v27, v28, v29);
      int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v30, v31, v32, v33);

      if (!SessionEnabled)
      {
        uint64_t v46 = objc_msgSend_session(self, v35, v36, v37);
        uint64_t v50 = objc_msgSend_fmfHandle(v26, v53, v54, v55);
        uint64_t v52 = objc_msgSend_getOfferExpirationForHandle_groupId_callerId_(v46, v56, (uint64_t)v50, (uint64_t)v11, v61);
LABEL_14:
        uint64_t v57 = (void *)v52;

        if (!v23) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      uint64_t v38 = objc_msgSend_fmlHandle(v26, v35, v36, v37);
      if (v38)
      {
        uint64_t v42 = (void *)v38;
        char v43 = objc_msgSend_fmlSession(self, v39, v40, v41);
        char v44 = objc_opt_respondsToSelector();

        if (v44)
        {
          uint64_t v46 = objc_msgSend_fmlSession(self, v39, v45, v41);
          uint64_t v50 = objc_msgSend_fmlHandle(v26, v47, v48, v49);
          uint64_t v52 = objc_msgSend_cachedOfferExpirationForHandle_groupId_(v46, v51, (uint64_t)v50, (uint64_t)v11);
          goto LABEL_14;
        }
      }
      uint64_t v57 = 0;
      if (!v23)
      {
LABEL_18:
        id v23 = v57;
        goto LABEL_19;
      }
LABEL_15:
      if (objc_msgSend_compare_(v57, v39, (uint64_t)v23, v41) == 1)
      {
        id v58 = v57;

        id v23 = v58;
      }
LABEL_19:
    }
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v63, (uint64_t)v67, 16);
  }
  while (v22);
LABEL_23:

  return v23;
}

- (void)_updateActiveDevice
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (SessionEnabled)
  {
    uint64_t v13 = objc_msgSend_fmlSession(self, v10, v11, v12);
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      return;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Calling FindMyLocateSession getActiveLocationSharingDeviceWithCompletion", buf, 2u);
      }
    }
    uint64_t v19 = objc_msgSend_fmlSession(self, v15, v16, v17);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1A4C5404C;
    v25[3] = &unk_1E5B7EFE0;
    void v25[4] = self;
    objc_msgSend_getActiveLocationSharingDeviceWithCompletion_(v19, v20, (uint64_t)v25, v21);
  }
  else
  {
    uint64_t v19 = objc_msgSend_session(self, v10, v11, v12);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1A4C541CC;
    v24[3] = &unk_1E5B7F008;
    v24[4] = self;
    objc_msgSend_getActiveLocationSharingDevice_(v19, v22, (uint64_t)v24, v23);
  }
}

- (void)makeThisDeviceActiveDevice
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v5, v6, v7, v8);

  if (SessionEnabled)
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9F2C();
    }
  }
  else
  {
    objc_msgSend_session(self, v10, v11, v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActiveDevice_completion_(v15, v14, 0, (uint64_t)&unk_1EF8E3C90);
  }
}

- (void)didReceiveLocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "FMF didReceiveLocation %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_handle(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v10, (uint64_t)v9, v11);

  objc_msgSend_didReceiveLocationForHandle_(self, v13, (uint64_t)v12, v14);
}

- (void)didReceiveLocationForHandle:(id)a3
{
}

- (void)friendshipRequestReceived:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "FMF friendshipRequestReceived %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_fromHandle(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v10, (uint64_t)v9, v11);

  objc_msgSend__postRelationshipStatusDidChangeNotificationWithIMFindMyHandle_(self, v13, (uint64_t)v12, v14);
}

- (void)friendshipWasRemoved:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "FMF friendshipWasRemoved %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v5, (uint64_t)v4, v6);
  objc_msgSend__postRelationshipStatusDidChangeNotificationWithIMFindMyHandle_(self, v9, (uint64_t)v8, v10);
}

- (void)didStartSharingMyLocationWithHandle:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "FMF didStartSharingMyLocationWithHandle %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v5, (uint64_t)v4, v6);
  objc_msgSend__postRelationshipStatusDidChangeNotificationWithIMFindMyHandle_(self, v9, (uint64_t)v8, v10);
}

- (void)didStopSharingMyLocationWithHandle:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "FMF didStopSharingMyLocationWithHandle %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v5, (uint64_t)v4, v6);
  objc_msgSend__postRelationshipStatusDidChangeNotificationWithIMFindMyHandle_(self, v9, (uint64_t)v8, v10);
}

- (void)didStartAbilityToGetLocationForHandle:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "FMF didStartAbilityToGetLocationForHandle %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v5, (uint64_t)v4, v6);
  objc_msgSend__postRelationshipStatusDidChangeNotificationWithIMFindMyHandle_(self, v9, (uint64_t)v8, v10);
}

- (void)didStopAbilityToGetLocationForHandle:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "FMF didStopAbilityToGetLocationForHandle %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_handleWithFMFHandle_(IMFindMyHandle, v5, (uint64_t)v4, v6);
  objc_msgSend__postRelationshipStatusDidChangeNotificationWithIMFindMyHandle_(self, v9, (uint64_t)v8, v10);
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "FMF didChangeActiveLocationSharingDevice %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend__updateActiveDevice(self, v5, v6, v7);
}

- (id)_bestAccountForAddresses:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_iMessageService(IMServiceImpl, v4, v5, v6);
  uint64_t v8 = IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService(v3, 1, v7);

  if ((objc_msgSend__isUsableForSending(v8, v9, v10, v11) & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_smsService(IMServiceImpl, v12, v13, v14);
    if (v18)
    {
      uint64_t v19 = objc_msgSend_sharedInstance(IMAccountController, v15, v16, v17);
      uint64_t v22 = objc_msgSend_accountsForService_(v19, v20, (uint64_t)v18, v21);
      uint64_t v26 = objc_msgSend___imFirstObject(v22, v23, v24, v25);

      uint64_t v8 = (void *)v26;
    }
  }

  return v8;
}

- (void)_startSharingWithFMLHandles:(id)a3 inChat:(id)a4 withDuration:(int64_t)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_joinState(v9, v10, v11, v12))
  {
    uint64_t v16 = objc_msgSend_account(v9, v13, v14, v15);
    uint64_t v20 = objc_msgSend_uniqueID(v16, v17, v18, v19);
    objc_msgSend_setEstablishingAccountID_(self, v21, (uint64_t)v20, v22);

    int v26 = objc_msgSend_chatStyle(v9, v23, v24, v25);
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v47 = v8;
        __int16 v48 = 2048;
        int64_t v49 = a5;
        _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "_startSharingWithFMLHandles calling sendFriendshipOfferToHandles: %@, with duration: %ld", buf, 0x16u);
      }
    }
    uint64_t v31 = objc_msgSend_fmlSession(self, v27, v28, v29);
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      uint64_t v36 = objc_msgSend_fmlSession(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_allObjects(v8, v37, v38, v39);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = sub_1A4C55088;
      v43[3] = &unk_1E5B7F030;
      id v44 = v8;
      int64_t v45 = a5;
      objc_msgSend_sendFriendshipOfferToHandles_expiration_isFromGroup_completion_(v36, v41, (uint64_t)v40, a5, v26 != 45, v43);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_INFO, "_startSharingWithFMLHandles not sharing because we've left the chat", buf, 2u);
    }
  }
}

- (void)_startSharingWithFMFHandles:(id)a3 inChat:(id)a4 untilDate:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_joinState(v9, v11, v12, v13))
  {
    uint64_t v17 = objc_msgSend_account(v9, v14, v15, v16);
    uint64_t v21 = objc_msgSend_uniqueID(v17, v18, v19, v20);
    objc_msgSend_setEstablishingAccountID_(self, v22, (uint64_t)v21, v23);

    if (objc_msgSend_chatStyle(v9, v24, v25, v26) == 45) {
      objc_msgSend_fmfGroupIdOneToOne(self, v27, v28, v29);
    }
    else {
    uint64_t v31 = objc_msgSend_fmfGroupIdGroup(self, v27, v28, v29);
    }
    uint64_t v34 = objc_msgSend__callerIDForChat_(self, v32, (uint64_t)v9, v33);
    if (IMOSLoggingEnabled())
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v49 = v8;
        __int16 v50 = 2112;
        id v51 = v10;
        __int16 v52 = 2112;
        uint64_t v53 = v34;
        __int16 v54 = 2112;
        uint64_t v55 = v31;
        _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "willSendFriendshipOfferToHandles %@ untilDate %@ callerId %@ groupId %@", buf, 0x2Au);
      }
    }
    uint64_t v39 = objc_msgSend_session(self, v35, v36, v37);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1A4C554AC;
    v43[3] = &unk_1E5B7F058;
    id v44 = v8;
    id v45 = v10;
    id v46 = v34;
    id v47 = v31;
    id v40 = v31;
    id v41 = v34;
    objc_msgSend_sendFriendshipOfferToHandles_groupId_callerId_endDate_completion_(v39, v42, (uint64_t)v44, (uint64_t)v40, v41, v45, v43);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "_startSharingWithFMFHandles not sharing because we've left the chat", buf, 2u);
    }
  }
}

- (void)_stopSharingWithFMFHandles:(id)a3 inChat:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_chatStyle(v7, v8, v9, v10) == 45) {
    objc_msgSend_fmfGroupIdOneToOne(self, v11, v12, v13);
  }
  else {
  uint64_t v14 = objc_msgSend_fmfGroupIdGroup(self, v11, v12, v13);
  }
  uint64_t v17 = objc_msgSend__callerIDForChat_(self, v15, (uint64_t)v7, v16);
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v6;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v14;
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "willStopSharingMyLocationWithHandles %@ callerId %@ groupId %@", buf, 0x20u);
    }
  }
  uint64_t v22 = objc_msgSend_session(self, v18, v19, v20);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1A4C557E0;
  v27[3] = &unk_1E5B7F080;
  id v28 = v6;
  id v29 = v17;
  id v30 = v14;
  id v23 = v14;
  id v24 = v17;
  id v25 = v6;
  objc_msgSend_stopSharingMyLocationWithHandles_groupId_callerId_completion_(v22, v26, (uint64_t)v25, (uint64_t)v23, v24, v27);
}

- (void)_stopSharingWithFMLHandles:(id)a3 inChat:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "_stopSharingWithFMLHandles %@ inChat: %@", buf, 0x16u);
    }
  }
  int v12 = objc_msgSend_chatStyle(v7, v8, v9, v10);
  if (objc_msgSend_count(v6, v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_fmlSession(self, v16, v17, v18);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v24 = objc_msgSend_fmlSession(self, v21, v22, v23);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1A4C55ADC;
      v26[3] = &unk_1E5B7F0A8;
      id v27 = v6;
      BOOL v28 = v12 != 45;
      objc_msgSend_stopSharingLocationWith_isFromGroup_completion_(v24, v25, (uint64_t)v27, v12 != 45, v26);
    }
  }
}

- (id)_callerIDForChat:(id)a3
{
  id v3 = a3;
  uint64_t v10 = objc_msgSend_lastAddressedHandleID(v3, v4, v5, v6);
  if (!v10)
  {
    uint64_t v11 = objc_msgSend_account(v3, v7, v8, v9);
    uint64_t v10 = objc_msgSend_displayName(v11, v12, v13, v14);
  }
  uint64_t v15 = (void *)MEMORY[0x1A6263B40](@"FMFHandle", @"FMF");
  uint64_t v18 = 0;
  if (v10 && v15)
  {
    uint64_t v18 = objc_msgSend_handleWithId_(v15, v16, (uint64_t)v10, v17);
  }

  return v18;
}

- (void)_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:(id)a3
{
}

- (void)_postNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Posting FMF notification: %@  object: %@ userInfo: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11, v12);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v14, v15, (uint64_t)v7, (uint64_t)v8, v9);
}

- (Class)__FMFSessionClass
{
  if (qword_1E965E720 != -1) {
    dispatch_once(&qword_1E965E720, &unk_1EF8E3CD0);
  }
  uint64_t v2 = (void *)qword_1E965E718;

  return (Class)v2;
}

- (Class)__FMLSessionClass
{
  if (qword_1E965DDF8 != -1) {
    dispatch_once(&qword_1E965DDF8, &unk_1EF8E5AD8);
  }
  uint64_t v2 = (void *)qword_1E965DDC8;

  return (Class)v2;
}

- (id)fmfGroupIdOneToOne
{
  if (qword_1E965EB10 != -1) {
    dispatch_once(&qword_1E965EB10, &unk_1EF8E5B18);
  }
  uint64_t v2 = (void *)qword_1E965EB08;

  return v2;
}

- (id)fmfGroupIdGroup
{
  if (qword_1E965EB20 != -1) {
    dispatch_once(&qword_1E965EB20, &unk_1EF8E5B38);
  }
  uint64_t v2 = (void *)qword_1E965EB18;

  return v2;
}

- (FMFSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (IMFindMyDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (NSString)establishingAccountID
{
  return self->_establishingAccountID;
}

- (void)setEstablishingAccountID:(id)a3
{
}

- (id)fmlSession
{
  return self->_fmlSession;
}

- (void)setFmlSession:(id)a3
{
}

- (unint64_t)fmfProvisionedState
{
  return self->_fmfProvisionedState;
}

- (void)setFmfProvisionedState:(unint64_t)a3
{
  self->_fmfProvisionedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fmlSession, 0);
  objc_storeStrong((id *)&self->_establishingAccountID, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end