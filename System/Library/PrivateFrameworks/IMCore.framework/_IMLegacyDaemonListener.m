@interface _IMLegacyDaemonListener
- (BOOL)_hidingDisconnect;
- (BOOL)hasPendingProcessChange;
- (BOOL)hasPostedSetupComplete;
- (BOOL)isHoldingChatMessages;
- (BOOL)isSetupComplete;
- (BOOL)shouldHoldChatMessages;
- (NSArray)allServices;
- (NSData)myPicture;
- (NSDate)myIdleSince;
- (NSMutableArray)deferredChatMessages;
- (NSMutableArray)handlers;
- (NSMutableDictionary)_contexts;
- (NSMutableDictionary)persistentProperties;
- (NSMutableDictionary)properties;
- (NSMutableDictionary)services;
- (NSProtocolChecker)protocol;
- (NSString)myNowPlayingString;
- (NSString)myStatusMessage;
- (_IMLegacyDaemonListener)init;
- (id)_stampForContext:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)serviceWithName:(id)a3;
- (id)valueOfPersistentProperty:(id)a3;
- (id)valueOfProperty:(id)a3;
- (unint64_t)myStatus;
- (unint64_t)vcCapabilities;
- (unsigned)myIdleTime;
- (void)_cacheValue:(id)a3 forPersistentProperty:(id)a4;
- (void)_cacheValue:(id)a3 forProperty:(id)a4;
- (void)_deferNotification:(id)a3;
- (void)_deferredSetup:(id)a3;
- (void)_noteDisconnected;
- (void)_processDeferredInvitationDictionary:(id)a3;
- (void)_processMyStatusChanged;
- (void)_reallyProcessMyStatusChanged;
- (void)_resetPostedSetupCompleted;
- (void)_setHidingDisconnect:(BOOL)a3;
- (void)_setStamp:(id)a3 forContext:(id)a4;
- (void)account:(id)a3 buddyPictureChanged:(id)a4 imageData:(id)a5 imageHash:(id)a6;
- (void)account:(id)a3 buddyProperties:(id)a4 buddyPictures:(id)a5;
- (void)account:(id)a3 buddyPropertiesChanged:(id)a4;
- (void)account:(id)a3 capabilitiesChanged:(unint64_t)a4;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageReceived:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesReceived:(id)a7;
- (void)account:(id)a3 defaults:(id)a4 blockList:(id)a5 allowList:(id)a6 blockingMode:(unsigned int)a7 blockIdleStatus:(BOOL)a8 status:(id)a9 capabilities:(unint64_t)a10 serviceLoginStatus:(unint64_t)a11 loginStatusMessage:(id)a12;
- (void)account:(id)a3 defaultsChanged:(id)a4;
- (void)account:(id)a3 groupsChanged:(id)a4 error:(id)a5;
- (void)account:(id)a3 handleSubscriptionRequestFrom:(id)a4 withMessage:(id)a5;
- (void)account:(id)a3 loginStatusChanged:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7;
- (void)account:(id)a3 postedError:(id)a4;
- (void)account:(id)a3 status:(id)a4 capabilities:(unint64_t)a5 serviceLoginStatus:(unint64_t)a6 loginStatusMessage:(id)a7;
- (void)account:(id)a3 statusChanged:(id)a4;
- (void)accountAdded:(id)a3 defaults:(id)a4 service:(id)a5;
- (void)accountRemoved:(id)a3;
- (void)activeAccountsChanged:(id)a3 forService:(id)a4;
- (void)addHandler:(id)a3;
- (void)databaseChatSpamUpdated:(id)a3;
- (void)databaseUpdated:(id)a3;
- (void)defaultsChanged:(id)a3 forService:(id)a4;
- (void)didAttemptToDisableAllDevicesResult:(BOOL)a3;
- (void)didAttemptToDisableiCloudBackups:(int64_t)a3 error:(id)a4;
- (void)didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4;
- (void)didFetchCloudKitSyncDebuggingInfo:(id)a3;
- (void)didFetchRampState:(id)a3;
- (void)didFetchSyncStateStats:(id)a3;
- (void)didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6;
- (void)displayPinCodeForAccount:(id)a3 pinCode:(id)a4 deviceName:(id)a5 deviceType:(id)a6 phoneNumber:(id)a7;
- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4;
- (void)fileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5;
- (void)fileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4;
- (void)fileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6;
- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4;
- (void)fileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4;
- (void)fileTransferDownloadedSucceededWithLocalURL:(id)a3;
- (void)fileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5;
- (void)fileTransferFinishedRemoteIntentDownload:(id)a3;
- (void)fileTransferHighQualityDownloadFailed:(id)a3;
- (void)fileTransfers:(id)a3 createdWithLocalPaths:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)holdChatMessages;
- (void)networkDataAvailabilityChanged:(BOOL)a3;
- (void)newSetupInfoAvailable;
- (void)oneTimeCodesDidChange:(id)a3;
- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5;
- (void)pinCodeAlertCompleted:(id)a3 deviceName:(id)a4 deviceType:(id)a5 phoneNumber:(id)a6 responseFromDevice:(BOOL)a7 wasCancelled:(BOOL)a8;
- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5;
- (void)qosClassWhileServicingRequestsResponse:(unsigned int)a3 identifier:(id)a4;
- (void)receivedUrgentRequestForMessages:(id)a3;
- (void)releaseHeldChatMessages;
- (void)removeHandler:(id)a3;
- (void)service:(id)a3 properties:(id)a4 defaults:(id)a5 defaultAccountSettings:(id)a6 allAccounts:(id)a7 activeAccounts:(id)a8;
- (void)services:(id)a3 properties:(id)a4 persistentProperties:(id)a5;
- (void)setDeferredChatMessages:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setHasPendingProcessChange:(BOOL)a3;
- (void)setMyIdleSince:(id)a3;
- (void)setMyNowPlayingString:(id)a3;
- (void)setMyPicture:(id)a3;
- (void)setMyStatus:(unint64_t)a3;
- (void)setMyStatusMessage:(id)a3;
- (void)setPersistentProperties:(id)a3;
- (void)setProperties:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setServices:(id)a3;
- (void)setupComplete:(BOOL)a3 info:(id)a4;
- (void)simSubscriptionsDidChange;
- (void)updateActiveNicknameRecords:(id)a3;
- (void)updateCloudKitProgressWithDictionary:(id)a3;
- (void)updateCloudKitState;
- (void)updateCloudKitStateWithDictionary:(id)a3;
- (void)updateIgnoredNicknameRecords:(id)a3;
- (void)updateNicknameHandlesForSharing:(id)a3 blocked:(id)a4;
- (void)updatePendingNicknameUpdates:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5;
- (void)updatePersonalNickname:(id)a3;
- (void)updateTransitionedNicknameHandles:(id)a3;
- (void)updateUnknownSenderRecords:(id)a3;
- (void)vcCapabilitiesChanged:(unint64_t)a3;
@end

@implementation _IMLegacyDaemonListener

- (_IMLegacyDaemonListener)init
{
  v15.receiver = self;
  v15.super_class = (Class)_IMLegacyDaemonListener;
  v2 = [(_IMLegacyDaemonListener *)&v15 init];
  v3 = v2;
  if (v2)
  {
    myIdleSince = v2->_myIdleSince;
    v2->_myIdleSince = 0;

    v3->_setupComplete = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v3->_properties;
    v3->_properties = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    persistentProperties = v3->_persistentProperties;
    v3->_persistentProperties = v7;

    id v9 = objc_alloc(MEMORY[0x1E4F28FA8]);
    uint64_t v12 = objc_msgSend_initWithProtocol_(v9, v10, (uint64_t)&unk_1EF968580, v11);
    protocol = v3->_protocol;
    v3->_protocol = (NSProtocolChecker *)v12;
  }
  return v3;
}

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_vcCapabilities = a3;
  v5 = objc_msgSend__copyForEnumerating(self->_handlers, a2, a3, v3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_vcCapabilitiesChanged_(v11, v12, a3, v13);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v8);
  }
}

- (void)addHandler:(id)a3
{
  id v11 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_handlers, v4, (uint64_t)v11, v5) & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10 = self->_handlers;
      self->_handlers = v9;

      handlers = self->_handlers;
    }
    objc_msgSend_addObject_(handlers, v6, (uint64_t)v11, v7);
  }
}

- (void)networkDataAvailabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v3) {
        uint64_t v8 = @"YES";
      }
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "MobileSMS thinks networkDataAvailable: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_sharedInstance(IMAccountController, v4, v5, v6);
  objc_msgSend_setNetworkDataAvailable_(v9, v10, v3, v11);
}

- (void)_reallyProcessMyStatusChanged
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (self->_hasPendingProcessChange) {
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel__reallyProcessMyStatusChanged, 0);
  }
  self->_hasPendingProcessChange = 0;
  uint64_t v5 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  uint64_t v9 = objc_msgSend_bestAccountForStatus(v5, v6, v7, v8);

  unint64_t v83 = objc_msgSend_myStatus(v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_myStatusMessage(v9, v13, v14, v15);
  objc_msgSend_myIdleSince(v9, v17, v18, v19);
  obj = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_myPictureData(v9, v20, v21, v22);
  v23 = (NSData *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = objc_msgSend_myNowPlayingString(v9, v24, v25, v26);
  v31 = &stru_1EF8E78C8;
  if (v16) {
    v32 = (__CFString *)v16;
  }
  else {
    v32 = &stru_1EF8E78C8;
  }
  if (v27) {
    v31 = (__CFString *)v27;
  }
  v85 = v31;
  v86 = v32;
  if ((objc_msgSend_isNull(v23, v28, v29, v30) & 1) != 0 || !objc_msgSend_length(v23, v33, v34, v35))
  {

    v23 = 0;
  }
  v84 = v23;
  if (IMOSLoggingEnabled())
  {
    v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      int v93 = v83;
      __int16 v94 = 2112;
      v95 = v86;
      __int16 v96 = 2112;
      v97 = obj;
      _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_DEBUG, "Notified that my status is now %i, message '%@', idleSince %@", buf, 0x1Cu);
    }
  }
  myIdleSince = self->_myIdleSince;
  BOOL v82 = obj != myIdleSince;
  if (obj != myIdleSince) {
    objc_storeStrong((id *)&self->_myIdleSince, obj);
  }
  if (v9)
  {
    myPicture = self->_myPicture;
    if (v23 != myPicture && (objc_msgSend_isEqualToData_(v23, v36, (uint64_t)myPicture, v37) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          int v45 = objc_msgSend_length(v23, v42, v43, v44);
          *(_DWORD *)buf = 67109120;
          int v93 = v45;
          _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "Service: Received my new picture from daemon -- %d bytes", buf, 8u);
        }
      }
      objc_storeStrong((id *)&self->_myPicture, v23);
      v49 = objc_msgSend_me(IMMe, v46, v47, v48);
      objc_msgSend_myPictureChanged(v49, v50, v51, v52);

      v56 = objc_msgSend__copyForEnumerating(self->_handlers, v53, v54, v55);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v57 = v56;
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v88, (uint64_t)v98, 16);
      if (v59)
      {
        uint64_t v60 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v59; ++i)
          {
            if (*(void *)v89 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend_myPictureDataChanged_(v62, v63, (uint64_t)self->_myPicture, v64);
            }
          }
          uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v63, (uint64_t)&v88, (uint64_t)v98, 16);
        }
        while (v59);
      }
    }
  }
  if (self->_myStatus != v83)
  {
    self->_myStatus = v83;
    BOOL v82 = 1;
  }
  if (objc_msgSend_isEqualToString_(self->_myStatusMessage, v36, (uint64_t)v86, v37))
  {
    myNowPlayingString = self->_myNowPlayingString;
    p_myNowPlayingString = &self->_myNowPlayingString;
    if (objc_msgSend_isEqualToString_(v85, v65, (uint64_t)myNowPlayingString, v66))
    {
      if (!v82) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  objc_storeStrong((id *)&self->_myStatusMessage, v86);
  v72 = self->_myNowPlayingString;
  p_myNowPlayingString = &self->_myNowPlayingString;
  if ((objc_msgSend_isEqualToString_(v85, v73, (uint64_t)v72, v74) & 1) == 0) {
LABEL_41:
  }
    objc_storeStrong((id *)p_myNowPlayingString, v85);
LABEL_42:
  v75 = objc_msgSend_notificationCenter(IMService, v69, v70, v71);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v75, v76, @"__kIMMyStatusChangedNotification", 0, 0);

  v80 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v77, v78, v79);
  objc_msgSend___mainThreadPostNotificationName_object_(v80, v81, @"__kIMMeStatusChangedNotification", 0);

LABEL_43:
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1A6264150]();
  uint64_t v9 = objc_msgSend_copy(self->_handlers, v6, v7, v8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v9;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend_selector(v4, v12, v13, v14);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v19 = (void *)MEMORY[0x1A6264150]();
          objc_msgSend_invokeWithTarget_(v4, v20, v18, v21);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v15);
  }
}

- (BOOL)isSetupComplete
{
  return self->_setupComplete;
}

- (void)updateCloudKitStateWithDictionary:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMCloudKitHooks, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateCloudKitStateWithDictionary_(v9, v7, (uint64_t)v3, v8);
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  BOOL v4 = a3;
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v179 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"NO";
      if (v4) {
        uint64_t v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v197 = v6;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Setup complete with success %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_DEBUG, "Setup starting", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = MarcoLoggingStringForMessageData();
      *(_DWORD *)buf = 138412290;
      v197 = v11;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "Setup info: %@", buf, 0xCu);
    }
  }
  uint64_t v12 = objc_msgSend_objectForKey_(v179, v8, *MEMORY[0x1E4F6E2A8], v9);
  int v16 = objc_msgSend_intValue(v12, v13, v14, v15);

  v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
  objc_msgSend_setProcessCapabilities_(v20, v21, v16, v22);

  long long v25 = objc_msgSend_objectForKey_(v179, v23, *MEMORY[0x1E4F6E318], v24);
  v28 = objc_msgSend_objectForKey_(v179, v26, *MEMORY[0x1E4F6E310], v27);
  v31 = objc_msgSend_objectForKey_(v179, v29, *MEMORY[0x1E4F6E300], v30);
  objc_msgSend_services_properties_persistentProperties_(self, v32, (uint64_t)v25, (uint64_t)v28, v31);

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  objc_msgSend_objectForKey_(v179, v33, *MEMORY[0x1E4F6E320], v34);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v192, (uint64_t)v200, 16);
  if (v177)
  {
    uint64_t v176 = *(void *)v193;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v193 != v176)
        {
          uint64_t v37 = v36;
          objc_enumerationMutation(obj);
          uint64_t v36 = v37;
        }
        uint64_t v178 = v36;
        v38 = *(void **)(*((void *)&v192 + 1) + 8 * v36);
        if (IMOSLoggingEnabled())
        {
          v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v197 = v38;
            _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_DEBUG, "Service info: %@", buf, 0xCu);
          }
        }
        v42 = objc_msgSend_objectForKey_(v38, v39, *MEMORY[0x1E4F6E178], v40);
        int v45 = objc_msgSend_objectForKey_(v38, v43, *MEMORY[0x1E4F6E180], v44);
        uint64_t v48 = objc_msgSend_objectForKey_(v38, v46, *MEMORY[0x1E4F6E170], v47);
        uint64_t v51 = objc_msgSend_objectForKey_(v38, v49, *MEMORY[0x1E4F6E168], v50);
        uint64_t v54 = objc_msgSend_objectForKey_(v38, v52, *MEMORY[0x1E4F6E158], v53);
        id v57 = objc_msgSend_objectForKey_(v38, v55, *MEMORY[0x1E4F6E160], v56);
        objc_msgSend_service_properties_defaults_defaultAccountSettings_allAccounts_activeAccounts_(self, v58, (uint64_t)v42, (uint64_t)v45, v48, v51, v54, v57);

        long long v190 = 0u;
        long long v191 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        objc_msgSend_objectForKey_(v38, v59, *MEMORY[0x1E4F6E150], v60);
        id v180 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v61, (uint64_t)&v188, (uint64_t)v199, 16);
        if (v182)
        {
          uint64_t v181 = *(void *)v189;
          do
          {
            for (uint64_t i = 0; i != v182; ++i)
            {
              if (*(void *)v189 != v181) {
                objc_enumerationMutation(v180);
              }
              v63 = *(void **)(*((void *)&v188 + 1) + 8 * i);
              uint64_t v64 = (void *)MEMORY[0x1A6264150]();
              if (IMOSLoggingEnabled())
              {
                v67 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v197 = v63;
                  _os_log_impl(&dword_1A4AF7000, v67, OS_LOG_TYPE_DEBUG, "Account info: %@", buf, 0xCu);
                }
              }
              v68 = objc_msgSend_objectForKey_(v63, v65, *MEMORY[0x1E4F6CA30], v66);
              uint64_t v71 = objc_msgSend_objectForKey_(v63, v69, *MEMORY[0x1E4F6CA20], v70);
              objc_msgSend_account_defaultsChanged_(self, v72, (uint64_t)v68, (uint64_t)v71);

              v75 = objc_msgSend_objectForKey_(v63, v73, *MEMORY[0x1E4F6CA48], v74);
              uint64_t v78 = objc_msgSend_objectForKey_(v63, v76, *MEMORY[0x1E4F6CA18], v77);
              uint64_t v82 = objc_msgSend_unsignedLongLongValue(v78, v79, v80, v81);
              v85 = objc_msgSend_objectForKey_(v63, v83, *MEMORY[0x1E4F6CA38], v84);
              int v89 = objc_msgSend_intValue(v85, v86, v87, v88);
              v92 = objc_msgSend_objectForKey_(v63, v90, *MEMORY[0x1E4F6CA40], v91);
              objc_msgSend_account_status_capabilities_serviceLoginStatus_loginStatusMessage_(self, v93, (uint64_t)v68, (uint64_t)v75, v82, v89, v92);

              v97 = objc_msgSend_objectForKey_(v63, v94, *MEMORY[0x1E4F6CA28], v95);
              if (v97) {
                objc_msgSend_account_groupsChanged_error_(self, v96, (uint64_t)v68, (uint64_t)v97, 0);
              }
            }
            uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v98, (uint64_t)&v188, (uint64_t)v199, 16);
          }
          while (v182);
        }

        uint64_t v36 = v178 + 1;
      }
      while (v178 + 1 != v177);
      uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v99, (uint64_t)&v192, (uint64_t)v200, 16);
    }
    while (v177);
  }

  v102 = objc_msgSend_objectForKey_(v179, v100, *MEMORY[0x1E4F6E2C0], v101);
  objc_msgSend__setStamp_forContext_(self, v103, (uint64_t)v102, @"DBModificationStamp");
  v106 = objc_msgSend_objectForKey_(v179, v104, *MEMORY[0x1E4F6E2D0], v105);
  objc_msgSend__setStamp_forContext_(self, v107, (uint64_t)v106, @"fileTransfers");
  v111 = objc_msgSend_sharedInstance(IMDaemonController, v108, v109, v110);
  BOOL v114 = (*MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v111, v112, 0, v113)) == 0;

  if (v114)
  {
    if (IMOSLoggingEnabled())
    {
      v129 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v129, OS_LOG_TYPE_DEBUG, "Clearing file transfer center", buf, 2u);
      }
    }
    v117 = objc_msgSend_sharedInstance(IMFileTransferCenter, v126, v127, v128);
    objc_msgSend__handleAllFileTransfers_(v117, v130, 0, v131);
  }
  else
  {
    v117 = objc_msgSend_objectForKey_(v179, v115, *MEMORY[0x1E4F6E2C8], v116);
    int v118 = IMOSLoggingEnabled();
    if (v117)
    {
      if (v118)
      {
        v122 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v122, OS_LOG_TYPE_DEBUG, "Updating file transfers", buf, 2u);
        }
      }
      v123 = objc_msgSend_sharedInstance(IMFileTransferCenter, v119, v120, v121);
      objc_msgSend__handleAllFileTransfers_(v123, v124, (uint64_t)v117, v125);
    }
    else if (v118)
    {
      v132 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v132, OS_LOG_TYPE_DEBUG, "Not updating file transfers", buf, 2u);
      }
    }
    v133 = objc_msgSend_objectForKey_(v179, v119, *MEMORY[0x1E4F6E2E0], v121);
    int v134 = IMOSLoggingEnabled();
    if (v133)
    {
      if (v134)
      {
        v138 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v138, OS_LOG_TYPE_DEBUG, "Updating file transfers for group photo", buf, 2u);
        }
      }
      v139 = objc_msgSend_sharedInstance(IMFileTransferCenter, v135, v136, v137);
      objc_msgSend__handleAllFileTransfers_(v139, v140, (uint64_t)v133, v141);
    }
    else if (v134)
    {
      v142 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v142, OS_LOG_TYPE_DEBUG, "Not updating file transfers for group photo", buf, 2u);
      }
    }
  }

  self->_setupComplete = 1;
  v146 = objc_msgSend_sharedInstance(IMDaemonController, v143, v144, v145);
  BOOL v149 = (*MEMORY[0x1E4F6C550] & objc_msgSend_capabilitiesForListenerID_(v146, v147, 0, v148)) == 0;

  if (v149)
  {
    objc_msgSend__reallyProcessMyStatusChanged(self, v150, v151, v152);
    v156 = objc_msgSend_me(IMMe, v153, v154, v155);
    objc_msgSend_rebuildIMHandles(v156, v157, v158, v159);
  }
  if (IMOSLoggingEnabled())
  {
    v162 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
    {
      services = self->_services;
      *(_DWORD *)buf = 138412290;
      v197 = services;
      _os_log_impl(&dword_1A4AF7000, v162, OS_LOG_TYPE_DEBUG, "Setup is complete (Services: %@)", buf, 0xCu);
    }
  }
  objc_msgSend__deferredSetup_(self, v160, (uint64_t)v179, v161);
  v167 = objc_msgSend__copyForEnumerating(self->_handlers, v164, v165, v166);
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id v168 = v167;
  uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v184, (uint64_t)v198, 16);
  if (v170)
  {
    uint64_t v171 = *(void *)v185;
    do
    {
      for (uint64_t j = 0; j != v170; ++j)
      {
        if (*(void *)v185 != v171) {
          objc_enumerationMutation(v168);
        }
        v173 = *(void **)(*((void *)&v184 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_setupComplete_info_(v173, v174, 1, (uint64_t)v179);
        }
      }
      uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v174, (uint64_t)&v184, (uint64_t)v198, 16);
    }
    while (v170);
  }
}

- (void)account:(id)a3 status:(id)a4 capabilities:(unint64_t)a5 serviceLoginStatus:(unint64_t)a6 loginStatusMessage:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v12 = a4;
  id v13 = a7;
  long long v17 = objc_msgSend_sharedInstance(IMAccountController, v14, v15, v16);
  uint64_t v40 = objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v41, v19);

  objc_msgSend_updateCapabilities_(v40, v20, a5, v21);
  objc_msgSend_setIMAccountLoginStatus_(v40, v22, a6, v23);
  objc_msgSend_setCurrentAccountStatus_(v40, v24, (uint64_t)v12, v25);
  objc_msgSend__processMyStatusChanged(self, v26, v27, v28);
  v32 = objc_msgSend__copyForEnumerating(self->_handlers, v29, v30, v31);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v33 = v32;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v42, (uint64_t)v46, 16);
  if (v35)
  {
    uint64_t v36 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_status_capabilities_serviceLoginStatus_loginStatusMessage_(v38, v39, (uint64_t)v41, (uint64_t)v12, a5, a6, v13);
        }
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v39, (uint64_t)&v42, (uint64_t)v46, 16);
    }
    while (v35);
  }
}

- (void)account:(id)a3 defaultsChanged:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10);
  uint64_t v14 = objc_msgSend_accountForUniqueID_(v11, v12, (uint64_t)v6, v13);

  objc_msgSend_loadFromDictionary_(v14, v15, (uint64_t)v7, v16);
  v20 = objc_msgSend__copyForEnumerating(self->_handlers, v17, v18, v19);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v20;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_defaultsChanged_(v26, v27, (uint64_t)v6, (uint64_t)v7);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v27, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v23);
  }
}

- (void)_processMyStatusChanged
{
  if (!self->_hasPendingProcessChange && self->_setupComplete) {
    objc_msgSend_performSelector_withObject_afterDelay_(self, a2, (uint64_t)sel__reallyProcessMyStatusChanged, 0, 0.0);
  }
}

- (void)_setStamp:(id)a3 forContext:(id)a4
{
  uint64_t v16 = (char *)a3;
  id v7 = a4;
  if (v7)
  {
    contexts = self->_contexts;
    uint64_t v9 = v16;
    if (v16)
    {
      if (!contexts)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v11 = self->_contexts;
        self->_contexts = Mutable;

        uint64_t v9 = v16;
        contexts = self->_contexts;
      }
      objc_msgSend_setObject_forKey_(contexts, v9, (uint64_t)v9, (uint64_t)v7);
    }
    else
    {
      objc_msgSend_removeObjectForKey_(contexts, 0, (uint64_t)v7, v6);
      if (!objc_msgSend_count(self->_contexts, v12, v13, v14))
      {
        uint64_t v15 = self->_contexts;
        self->_contexts = 0;
      }
    }
  }
}

- (void)services:(id)a3 properties:(id)a4 persistentProperties:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend_removeAllObjects(self->_properties, v11, v12, v13);
  v86 = v9;
  objc_msgSend_addEntriesFromDictionary_(self->_properties, v14, (uint64_t)v9, v15);
  objc_msgSend_removeAllObjects(self->_persistentProperties, v16, v17, v18);
  uint64_t v87 = self;
  v85 = v10;
  objc_msgSend_addEntriesFromDictionary_(self->_persistentProperties, v19, (uint64_t)v10, v20);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v21 = (NSMutableDictionary *)v8;
  uint64_t v26 = (NSMutableDictionary *)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v92, (uint64_t)v99, 16);
  if (!v26)
  {
    v75 = v21;
LABEL_48:

    goto LABEL_50;
  }
  os_log_t log = 0;
  uint64_t v27 = *(void *)v93;
  do
  {
    for (uint64_t i = 0; i != v26; uint64_t i = (NSMutableDictionary *)((char *)i + 1))
    {
      if (*(void *)v93 != v27) {
        objc_enumerationMutation(v21);
      }
      uint64_t v29 = *(void *)(*((void *)&v92 + 1) + 8 * i);
      long long v30 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25, log);
      uint64_t v34 = objc_msgSend__servicesToAllow(v30, v31, v32, v33);

      if (!objc_msgSend_count(v34, v35, v36, v37)) {
        goto LABEL_16;
      }
      if (IMOSLoggingEnabled())
      {
        long long v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v97 = (uint64_t)v34;
          _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "Allowing only services: %@", buf, 0xCu);
        }
      }
      char v44 = objc_msgSend_containsObject_(v34, v41, v29, v42);
      int v45 = IMOSLoggingEnabled();
      if (v44)
      {
        if (v45)
        {
          v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v97 = v29;
            _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "  Allowing: %@", buf, 0xCu);
          }
        }
LABEL_16:
        uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v38, v39, v40);
        uint64_t v51 = objc_msgSend__servicesToDeny(v47, v48, v49, v50);

        if (objc_msgSend_count(v51, v52, v53, v54))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v59 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v97 = (uint64_t)v51;
              _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "Denying services: %@", buf, 0xCu);
            }
          }
          int v60 = objc_msgSend_containsObject_(v51, v57, v29, v58);
          int v61 = IMOSLoggingEnabled();
          if (v60)
          {
            if (v61)
            {
              v62 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v97 = v29;
                _os_log_impl(&dword_1A4AF7000, v62, OS_LOG_TYPE_INFO, "  Skipping: %@", buf, 0xCu);
              }
              goto LABEL_41;
            }
            goto LABEL_42;
          }
          if (v61)
          {
            uint64_t v64 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v97 = v29;
              _os_log_impl(&dword_1A4AF7000, v64, OS_LOG_TYPE_INFO, "  Allowing: %@", buf, 0xCu);
            }
          }
        }
        v62 = objc_msgSend_objectForKey_(v87->_services, v55, v29, v56);
        if (!v62)
        {
          v62 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v65, v29, v66);
          if (v62)
          {
            id v70 = log;
            if (!log)
            {
              services = v87->_services;
              if (services) {
                id v70 = (id)objc_msgSend_mutableCopy(services, v67, v68, v69);
              }
              else {
                id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
            }
            objc_msgSend_setObject_forKey_(v70, v67, (uint64_t)v62, v29, v70);
          }
        }
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      if (v45)
      {
        v63 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v97 = v29;
          _os_log_impl(&dword_1A4AF7000, v63, OS_LOG_TYPE_INFO, "  Skipping: %@", buf, 0xCu);
        }
      }
LABEL_43:
    }
    uint64_t v26 = (NSMutableDictionary *)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v92, (uint64_t)v99, 16);
  }
  while (v26);

  if (log)
  {
    uint64_t v26 = log;
    v75 = v87->_services;
    v87->_services = v26;
    goto LABEL_48;
  }
  uint64_t v26 = 0;
LABEL_50:
  v76 = objc_msgSend__copyForEnumerating(v87->_handlers, v72, v73, v74);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v77 = v76;
  uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v88, (uint64_t)v98, 16);
  if (v79)
  {
    uint64_t v80 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v79; ++j)
      {
        if (*(void *)v89 != v80) {
          objc_enumerationMutation(v77);
        }
        uint64_t v82 = *(void **)(*((void *)&v88 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_services_properties_persistentProperties_(v82, v83, (uint64_t)v21, (uint64_t)v86, v85);
        }
      }
      uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v83, (uint64_t)&v88, (uint64_t)v98, 16);
    }
    while (v79);
  }
}

- (void)service:(id)a3 properties:(id)a4 defaults:(id)a5 defaultAccountSettings:(id)a6 allAccounts:(id)a7 activeAccounts:(id)a8
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  id v157 = a3;
  id v155 = a4;
  id v154 = a5;
  id v153 = a6;
  id v149 = a7;
  id v156 = a8;
  uint64_t v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  v150 = objc_msgSend__servicesToAllow(v16, v17, v18, v19);

  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v191 = v157;
      __int16 v192 = 2112;
      id v193 = v149;
      __int16 v194 = 2112;
      id v195 = v156;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Service: %@   all accounts: %@   activeAccounts: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_count(v150, v20, v21, v22) && (objc_msgSend_containsObject_(v150, v24, (uint64_t)v157, v26) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v103 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v191 = v157;
        _os_log_impl(&dword_1A4AF7000, v103, OS_LOG_TYPE_INFO, "  Skipping: %@ (not allowed)", buf, 0xCu);
      }
    }
    goto LABEL_81;
  }
  uint64_t v27 = objc_msgSend_sharedInstance(IMDaemonController, v24, v25, v26);
  uint64_t v148 = objc_msgSend__servicesToDeny(v27, v28, v29, v30);

  if (objc_msgSend_count(v148, v31, v32, v33)
    && objc_msgSend_containsObject_(v148, v34, (uint64_t)v157, v35))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v191 = v157;
        _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "  Skipping: %@ (denied)", buf, 0xCu);
      }
    }
    goto LABEL_80;
  }
  uint64_t v158 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v34, (uint64_t)v157, v35);
  objc_msgSend_setServiceProperties_(v158, v37, (uint64_t)v155, v38);
  objc_msgSend_setServiceDefaults_(v158, v39, (uint64_t)v154, v40);
  objc_msgSend_setDefaultAccountSettings_(v158, v41, (uint64_t)v153, v42);
  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  obuint64_t j = v149;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v180, (uint64_t)v189, 16);
  if (v47)
  {
    uint64_t v48 = *(void *)v181;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v181 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = *(void *)(*((void *)&v180 + 1) + 8 * i);
        uint64_t v51 = objc_msgSend_sharedInstance(IMAccountController, v44, v45, v46);
        uint64_t v54 = objc_msgSend_accountForUniqueID_(v51, v52, v50, v53);

        if (!v54)
        {
          id v57 = objc_msgSend_serviceWithName_(self, v55, (uint64_t)v157, v56);
          uint64_t v58 = [IMAccount alloc];
          v63 = objc_msgSend_initWithUniqueID_service_(v58, v59, v50, (uint64_t)v57);
          if (v63)
          {
            uint64_t v64 = objc_msgSend_sharedInstance(IMAccountController, v60, v61, v62);
            objc_msgSend_addAccount_locally_(v64, v65, (uint64_t)v63, 1);
          }
        }
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v180, (uint64_t)v189, 16);
    }
    while (v47);
  }

  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  uint64_t v69 = objc_msgSend_sharedInstance(IMAccountController, v66, v67, v68);
  uint64_t v73 = objc_msgSend_accounts(v69, v70, v71, v72);

  v75 = 0;
  uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v176, (uint64_t)v188, 16);
  if (!v79)
  {
    id v151 = 0;
    uint64_t v80 = 0;
    goto LABEL_49;
  }
  id v151 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = *(void *)v177;
  do
  {
    for (uint64_t j = 0; j != v79; ++j)
    {
      if (*(void *)v177 != v81) {
        objc_enumerationMutation(v73);
      }
      unint64_t v83 = *(void **)(*((void *)&v176 + 1) + 8 * j);
      uint64_t v84 = objc_msgSend_service(v83, v76, v77, v78);
      BOOL v85 = v84 == v158;

      if (v85)
      {
        v86 = objc_msgSend_uniqueID(v83, v76, v77, v78);
        int v89 = objc_msgSend_containsObject_(v156, v87, (uint64_t)v86, v88);

        if (v89)
        {
          if (v75)
          {
            objc_msgSend_addObject_(v75, v90, (uint64_t)v83, v91);
            goto LABEL_37;
          }
          id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v75 = v95;
LABEL_36:
          objc_msgSend_addObject_(v95, v90, (uint64_t)v83, v91);
        }
        else
        {
          id v95 = v151;
          if (v151) {
            goto LABEL_36;
          }
          id v151 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend_addObject_(v151, v96, (uint64_t)v83, v97);
        }
LABEL_37:
        v98 = objc_msgSend_uniqueID(v83, v92, v93, v94);
        char v101 = objc_msgSend_containsObject_(obj, v99, (uint64_t)v98, v100);

        if ((v101 & 1) == 0)
        {
          id v102 = v80;
          if (!v80) {
            id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v80 = v102;
          objc_msgSend_addObject_(v102, v76, (uint64_t)v83, v78);
        }
        continue;
      }
    }
    uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v176, (uint64_t)v188, 16);
  }
  while (v79);
LABEL_49:

  long long v174 = 0u;
  long long v175 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id v104 = v75;
  uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v172, (uint64_t)v187, 16);
  if (v109)
  {
    uint64_t v110 = *(void *)v173;
    do
    {
      for (uint64_t k = 0; k != v109; ++k)
      {
        if (*(void *)v173 != v110) {
          objc_enumerationMutation(v104);
        }
        uint64_t v112 = *(void *)(*((void *)&v172 + 1) + 8 * k);
        uint64_t v113 = objc_msgSend_sharedInstance(IMAccountController, v106, v107, v108);
        objc_msgSend_activateAccount_locally_(v113, v114, v112, 1);
      }
      uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v106, (uint64_t)&v172, (uint64_t)v187, 16);
    }
    while (v109);
  }

  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v115 = v151;
  uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v168, (uint64_t)v186, 16);
  if (v120)
  {
    uint64_t v121 = *(void *)v169;
    do
    {
      for (uint64_t m = 0; m != v120; ++m)
      {
        if (*(void *)v169 != v121) {
          objc_enumerationMutation(v115);
        }
        uint64_t v123 = *(void *)(*((void *)&v168 + 1) + 8 * m);
        v124 = objc_msgSend_sharedInstance(IMAccountController, v117, v118, v119);
        objc_msgSend_deactivateAccount_withDisable_(v124, v125, v123, 0);
      }
      uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v117, (uint64_t)&v168, (uint64_t)v186, 16);
    }
    while (v120);
  }

  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v126 = v80;
  uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v127, (uint64_t)&v164, (uint64_t)v185, 16);
  if (v131)
  {
    uint64_t v132 = *(void *)v165;
    do
    {
      for (uint64_t n = 0; n != v131; ++n)
      {
        if (*(void *)v165 != v132) {
          objc_enumerationMutation(v126);
        }
        uint64_t v134 = *(void *)(*((void *)&v164 + 1) + 8 * n);
        v135 = objc_msgSend_sharedInstance(IMAccountController, v128, v129, v130);
        objc_msgSend_deleteAccount_locally_(v135, v136, v134, 1);
      }
      uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v128, (uint64_t)&v164, (uint64_t)v185, 16);
    }
    while (v131);
  }

  v140 = objc_msgSend__copyForEnumerating(self->_handlers, v137, v138, v139);
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v141 = v140;
  uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v142, (uint64_t)&v160, (uint64_t)v184, 16);
  if (v143)
  {
    uint64_t v144 = *(void *)v161;
    do
    {
      for (iuint64_t i = 0; ii != v143; ++ii)
      {
        if (*(void *)v161 != v144) {
          objc_enumerationMutation(v141);
        }
        v146 = *(void **)(*((void *)&v160 + 1) + 8 * ii);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_service_properties_defaults_defaultAccountSettings_allAccounts_activeAccounts_(v146, v147, (uint64_t)v157, (uint64_t)v155, v154, v153, obj, v156);
        }
      }
      uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v147, (uint64_t)&v160, (uint64_t)v184, 16);
    }
    while (v143);
  }

LABEL_80:
LABEL_81:
}

- (id)serviceWithName:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_services, a2, (uint64_t)a3, v3);
}

- (void)_deferredSetup:(id)a3
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v160 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Performing deferred setup", buf, 2u);
    }
  }
  id v8 = objc_msgSend_sharedRegistry(IMChatRegistry, v4, v5, v6);
  objc_msgSend__daemonBeganDeferredSetup(v8, v9, v10, v11);

  uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v12, v13, v14);
  int v18 = objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17);
  int v159 = *MEMORY[0x1E4F6C508];
  BOOL v19 = ((*MEMORY[0x1E4F6C560] | *MEMORY[0x1E4F6C4F8] | *MEMORY[0x1E4F6C508]) & v18) == 0;

  if (v19)
  {
    long long v28 = objc_msgSend_sharedRegistry(IMChatRegistry, v20, v21, v22);
    objc_msgSend__handleChatReconstructions_(v28, v50, 0, v51);
    goto LABEL_21;
  }
  uint64_t v23 = objc_msgSend_sharedController(IMKeyTransparencyController, v20, v21, v22);
  objc_msgSend_setupComplete_info_(v23, v24, 1, (uint64_t)v160);

  uint64_t v25 = (uint64_t *)MEMORY[0x1E4F6E2B8];
  long long v28 = objc_msgSend_objectForKey_(v160, v26, *MEMORY[0x1E4F6E2B8], v27);
  long long v31 = objc_msgSend_objectForKey_(v160, v29, *MEMORY[0x1E4F6E308], v30);
  uint64_t v34 = objc_msgSend_objectForKey_(v160, v32, *MEMORY[0x1E4F6E2A0], v33);
  uint64_t v37 = objc_msgSend_objectForKey_(v160, v35, *MEMORY[0x1E4F6E2B0], v36);
  long long v43 = objc_msgSend_objectForKey_(v160, v38, *MEMORY[0x1E4F6E2D8], v39);
  if (v34)
  {
    char v44 = objc_msgSend_sharedRegistry(IMChatRegistry, v40, v41, v42);
    objc_msgSend__handleCachingAliasToCNIDMap_(v44, v45, (uint64_t)v34, v46);
  }
  if (v31)
  {
    uint64_t v47 = objc_msgSend_sharedRegistry(IMChatRegistry, v40, v41, v42);
    objc_msgSend__handleMergedChatReconstructions_(v47, v48, (uint64_t)v31, v49);
LABEL_13:

    goto LABEL_14;
  }
  if (v28)
  {
    uint64_t v47 = objc_msgSend_sharedRegistry(IMChatRegistry, v40, v41, v42);
    uint64_t v54 = objc_msgSend_objectForKey_(v160, v52, *v25, v53);
    objc_msgSend__handleChatReconstructions_(v47, v55, (uint64_t)v54, v56);

    goto LABEL_13;
  }
LABEL_14:
  if (v37)
  {
    id v57 = objc_msgSend_sharedRegistry(IMChatRegistry, v40, v41, v42);
    uint64_t v61 = objc_msgSend_BOOLValue(v37, v58, v59, v60);
    objc_msgSend__updateBlackholedChatsExist_(v57, v62, v61, v63);
  }
  if (v43)
  {
    uint64_t v64 = objc_msgSend_sharedRegistry(IMChatRegistry, v40, v41, v42);
    uint64_t v68 = objc_msgSend_BOOLValue(v43, v65, v66, v67);
    objc_msgSend__updateFilterediMessageChatsExist_(v64, v69, v68, v70);
  }
  uint64_t v71 = objc_msgSend_sharedRegistry(IMChatRegistry, v40, v41, v42);
  objc_msgSend_updateRecoverableMessagesMetadataSynchronously_loadChats_completionHandler_(v71, v72, 0, 0, 0);

  uint64_t v78 = objc_msgSend_objectForKey_(v160, v73, *MEMORY[0x1E4F6E2F8], v74);
  if (v78)
  {
    uint64_t v79 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E7B0], v75, v76, v77);
    objc_msgSend__setCachedOverrideDatesByHandleID_(v79, v80, (uint64_t)v78, v81);
  }
LABEL_21:

  uint64_t v84 = objc_msgSend_objectForKey_(v160, v82, *MEMORY[0x1E4F6E330], v83);
  uint64_t v88 = objc_msgSend_unsignedLongLongValue(v84, v85, v86, v87);
  objc_msgSend_vcCapabilitiesChanged_(self, v89, v88, v90);

  uint64_t v94 = objc_msgSend_sharedRegistry(IMChatRegistry, v91, v92, v93);
  objc_msgSend__daemonCompletedDeferredSetup(v94, v95, v96, v97);

  self->_postedSetupComplete = 1;
  char v101 = objc_msgSend__copyForEnumerating(self->_handlers, v98, v99, v100);
  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v102 = v101;
  uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v103, (uint64_t)&v165, (uint64_t)v171, 16);
  if (v104)
  {
    uint64_t v105 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v104; ++i)
      {
        if (*(void *)v166 != v105) {
          objc_enumerationMutation(v102);
        }
        uint64_t v107 = *(void **)(*((void *)&v165 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_setupComplete(v107, v108, v109, v110);
        }
      }
      uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v108, (uint64_t)&v165, (uint64_t)v171, 16);
    }
    while (v104);
  }

  if ((objc_msgSend__hidingDisconnect(self, v111, v112, v113) & 1) == 0)
  {
    v117 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v114, v115, v116);
    objc_msgSend___mainThreadPostNotificationName_object_(v117, v118, @"__kIMDaemonDidConnectNotification", 0);
  }
  uint64_t v119 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v114, v115, v116);
  objc_msgSend___mainThreadPostNotificationName_object_(v119, v120, @"__k_IMDaemonDidConnectNotification", 0);

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  v124 = objc_msgSend_allServicesNonBlocking(IMServiceImpl, v121, v122, v123);
  uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v161, (uint64_t)v170, 16);
  if (v129)
  {
    uint64_t v130 = *(void *)v162;
    do
    {
      for (uint64_t j = 0; j != v129; ++j)
      {
        if (*(void *)v162 != v130) {
          objc_enumerationMutation(v124);
        }
        uint64_t v132 = *(void *)(*((void *)&v161 + 1) + 8 * j);
        if ((objc_msgSend__hidingDisconnect(self, v126, v127, v128) & 1) == 0)
        {
          uint64_t v136 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v133, v134, v135);
          objc_msgSend___mainThreadPostNotificationName_object_(v136, v137, @"ServiceDidConnect", v132);
        }
        uint64_t v138 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v133, v134, v135);
        objc_msgSend___mainThreadPostNotificationName_object_(v138, v139, @"__k_IMServiceDidConnectNotification", v132);
      }
      uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v126, (uint64_t)&v161, (uint64_t)v170, 16);
    }
    while (v129);
  }

  uint64_t v143 = objc_msgSend_sharedInstance(IMDaemonController, v140, v141, v142);
  int v147 = objc_msgSend_capabilities(v143, v144, v145, v146);

  if ((v147 & v159) != 0)
  {
    if ((*MEMORY[0x1E4F6C568] & v147) == 0)
    {
      id v151 = objc_msgSend_sharedInstance(IMDaemonController, v148, v149, v150);
      objc_msgSend_requestPendingMessages(v151, v152, v153, v154);
    }
    IMSMSReportSpamActivateExtensions();
  }
  id v155 = objc_msgSend_sharedInstance(IMDaemonController, v148, v149, v150);
  objc_msgSend__noteSetupComplete(v155, v156, v157, v158);
}

- (BOOL)_hidingDisconnect
{
  return self->_hidingDisconnect;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend_methodSignatureForSelector_(self->_protocol, a2, (uint64_t)a3, v3);
}

- (NSArray)allServices
{
  return (NSArray *)objc_msgSend_allValues(self->_services, a2, v2, v3);
}

- (id)_stampForContext:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_contexts, a2, (uint64_t)a3, v3);
}

- (void)_noteDisconnected
{
  self->_setupComplete = 0;
  self->_postedSetupComplete = 0;
}

- (void)removeHandler:(id)a3
{
  objc_msgSend_removeObjectIdenticalTo_(self->_handlers, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_handlers, v5, v6, v7))
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (unint64_t)myStatus
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  id v9 = objc_msgSend_connectedAccounts(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

  if (v13) {
    return self->_myStatus;
  }
  else {
    return 1;
  }
}

- (unsigned)myIdleTime
{
  myIdleSince = self->_myIdleSince;
  if (myIdleSince)
  {
    objc_msgSend_timeIntervalSinceNow(myIdleSince, a2, v2, v3);
    LODWORD(myIdleSince) = -v5;
  }
  return myIdleSince;
}

- (void)_processDeferredInvitationDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"AccountUniqueID", v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v4, v8, @"ChatIdentifier", v9);
  uint64_t v13 = objc_msgSend_objectForKey_(v4, v11, @"Properties", v12);
  uint64_t v16 = objc_msgSend_objectForKey_(v4, v14, @"ChatStyle", v15);
  unsigned __int8 v20 = objc_msgSend_charValue(v16, v17, v18, v19);

  uint64_t v23 = objc_msgSend_objectForKey_(v4, v21, @"Message", v22);
  uint64_t v26 = objc_msgSend_objectForKey_(v4, v24, @"DeferType", v25);
  int v30 = objc_msgSend_intValue(v26, v27, v28, v29);

  if (v30 == 2)
  {
    uint64_t v33 = objc_msgSend_objectForKey_(v4, v31, @"Messages", v32);
    objc_msgSend_account_chat_style_chatProperties_messagesReceived_(self, v34, (uint64_t)v7, (uint64_t)v10, v20, v13, v33);
  }
  else if (v30 == 1)
  {
    objc_msgSend_account_chat_style_chatProperties_messageReceived_(self, v31, (uint64_t)v7, (uint64_t)v10, v20, v13, v23);
  }
  else if (v30)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Unknown defer type", v36, 2u);
      }
    }
  }
  else
  {
    objc_msgSend_account_chat_style_chatProperties_invitationReceived_(self, v31, (uint64_t)v7, (uint64_t)v10, v20, v13, v23);
  }
}

- (void)_deferNotification:(id)a3
{
  id v4 = (const char *)a3;
  deferredChatMessages = self->_deferredChatMessages;
  uint64_t v9 = (char *)v4;
  if (!deferredChatMessages)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_deferredChatMessages;
    self->_deferredChatMessages = v7;

    id v4 = v9;
    deferredChatMessages = self->_deferredChatMessages;
  }
  objc_msgSend_addObject_(deferredChatMessages, v4, (uint64_t)v4, v5);
}

- (BOOL)isHoldingChatMessages
{
  return objc_msgSend_count(self->_deferredChatMessages, a2, v2, v3) != 0;
}

- (void)holdChatMessages
{
  self->_holdingChatMessages = 1;
}

- (void)releaseHeldChatMessages
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_holdingChatMessages = 0;
  if (objc_msgSend_isHoldingChatMessages(self, a2, v2, v3))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_deferredChatMessages;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend__processDeferredInvitationDictionary_(self, v8, *(void *)(*((void *)&v13 + 1) + 8 * v12++), v9, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
      }
      while (v10);
    }
  }
}

- (void)defaultsChanged:(id)a3 forService:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v8, (uint64_t)v7, v9);
  long long v13 = v10;
  if (v10)
  {
    objc_msgSend_defaultsChanged_(v10, v11, (uint64_t)v6, v12);
    uint64_t v17 = objc_msgSend__copyForEnumerating(self->_handlers, v14, v15, v16);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v17;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v25, (uint64_t)v29, 16);
    if (v20)
    {
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_defaultsChanged_forService_(v23, v24, (uint64_t)v6, (uint64_t)v7);
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v24, (uint64_t)&v25, (uint64_t)v29, 16);
      }
      while (v20);
    }
  }
}

- (void)activeAccountsChanged:(id)a3 forService:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v5 = a4;
  uint64_t v81 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v6, (uint64_t)v5, v7);
  if (v81)
  {
    uint64_t v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10);
    long long v14 = objc_msgSend_accountsForService_(v11, v12, (uint64_t)v81, v13);
    id v18 = objc_msgSend_mutableCopy(v14, v15, v16, v17);

    uint64_t v22 = objc_msgSend_sharedInstance(IMAccountController, v19, v20, v21);
    objc_msgSend_setReadOnly_(v22, v23, 1, v24);

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v25 = v80;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v90, (uint64_t)v96, 16);
    if (v30)
    {
      uint64_t v31 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v91 != v31) {
            objc_enumerationMutation(v25);
          }
          uint64_t v33 = *(void *)(*((void *)&v90 + 1) + 8 * i);
          uint64_t v34 = objc_msgSend_sharedInstance(IMAccountController, v27, v28, v29);
          uint64_t v37 = objc_msgSend_accountForUniqueID_(v34, v35, v33, v36);

          uint64_t v41 = objc_msgSend_sharedInstance(IMAccountController, v38, v39, v40);
          objc_msgSend_activateAccount_locally_(v41, v42, (uint64_t)v37, 1);

          objc_msgSend_removeObject_(v18, v43, (uint64_t)v37, v44);
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v90, (uint64_t)v96, 16);
      }
      while (v30);
    }

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v45 = v18;
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v86, (uint64_t)v95, 16);
    if (v50)
    {
      uint64_t v51 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v87 != v51) {
            objc_enumerationMutation(v45);
          }
          uint64_t v53 = *(void *)(*((void *)&v86 + 1) + 8 * j);
          uint64_t v54 = objc_msgSend_sharedInstance(IMAccountController, v47, v48, v49);
          objc_msgSend__deactivateAccount_(v54, v55, v53, v56);
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v86, (uint64_t)v95, 16);
      }
      while (v50);
    }

    uint64_t v60 = objc_msgSend_sharedInstance(IMAccountController, v57, v58, v59);
    objc_msgSend_setReadOnly_(v60, v61, 0, v62);

    objc_msgSend_activeAccountsChanged_(v81, v63, (uint64_t)v25, v64);
    uint64_t v68 = objc_msgSend__copyForEnumerating(self->_handlers, v65, v66, v67);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v69 = v68;
    uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v82, (uint64_t)v94, 16);
    if (v71)
    {
      uint64_t v72 = *(void *)v83;
      do
      {
        for (uint64_t k = 0; k != v71; ++k)
        {
          if (*(void *)v83 != v72) {
            objc_enumerationMutation(v69);
          }
          uint64_t v74 = *(void **)(*((void *)&v82 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_activeAccountsChanged_forService_(v74, v75, (uint64_t)v25, (uint64_t)v5);
          }
        }
        uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v75, (uint64_t)&v82, (uint64_t)v94, 16);
      }
      while (v71);
    }

    objc_msgSend__processMyStatusChanged(self, v76, v77, v78);
  }
}

- (void)accountAdded:(id)a3 defaults:(id)a4 service:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  long long v14 = objc_msgSend_serviceWithName_(self, v9, (uint64_t)a5, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
    id v18 = objc_msgSend_accountForUniqueID_(v15, v16, (uint64_t)v30, v17);

    if (!v18)
    {
      uint64_t v19 = [IMAccount alloc];
      uint64_t v24 = objc_msgSend_initWithUniqueID_service_(v19, v20, (uint64_t)v30, (uint64_t)v14);
      if (v24)
      {
        if (v8) {
          objc_msgSend_account_defaultsChanged_(self, v21, (uint64_t)v30, (uint64_t)v8);
        }
        id v25 = objc_msgSend_sharedInstance(IMAccountController, v21, v22, v23);
        objc_msgSend_addAccount_locally_(v25, v26, (uint64_t)v24, 1);
      }
      objc_msgSend__processMyStatusChanged(self, v27, v28, v29);
    }
  }
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7);
  objc_msgSend_accountForUniqueID_(v8, v9, (uint64_t)v4, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    long long v14 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
    objc_msgSend_deleteAccount_locally_(v14, v15, (uint64_t)v16, 1);
  }
  objc_msgSend__processMyStatusChanged(self, v11, v12, v13);
}

- (void)account:(id)a3 loginStatusChanged:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v11 = a5;
  id v12 = a7;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = objc_msgSend_nameOfLoginStatus_(IMAccount, v17, a4, v18);
      *(_DWORD *)buf = 138412546;
      id v46 = v40;
      __int16 v47 = 2112;
      uint64_t v48 = v19;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Account: %@   Login Status Changed: %@", buf, 0x16u);
    }
  }
  uint64_t v20 = objc_msgSend_sharedInstance(IMAccountController, v13, v14, v15);
  uint64_t v38 = objc_msgSend_accountForUniqueID_(v20, v21, (uint64_t)v40, v22);

  objc_msgSend_loginStatusChanged_message_reason_properties_(v38, v23, a4, (uint64_t)v11, v8, v12);
  long long v27 = objc_msgSend__copyForEnumerating(self->_handlers, v24, v25, v26);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v28 = v27;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v41, (uint64_t)v49, 16);
  if (v30)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_loginStatusChanged_message_reason_properties_(v33, v34, (uint64_t)v40, a4, v11, v8, v12);
        }
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v34, (uint64_t)&v41, (uint64_t)v49, 16);
    }
    while (v30);
  }

  objc_msgSend__processMyStatusChanged(self, v35, v36, v37);
}

- (void)account:(id)a3 statusChanged:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10);
  uint64_t v14 = objc_msgSend_accountForUniqueID_(v11, v12, (uint64_t)v6, v13);
  objc_msgSend_setCurrentAccountStatus_(v14, v15, (uint64_t)v7, v16);

  objc_msgSend__processMyStatusChanged(self, v17, v18, v19);
  uint64_t v23 = objc_msgSend__copyForEnumerating(self->_handlers, v20, v21, v22);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v23;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_statusChanged_(v29, v30, (uint64_t)v6, (uint64_t)v7);
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v30, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v26);
  }
}

- (void)account:(id)a3 capabilitiesChanged:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(IMAccountController, v6, v7, v8);
  id v12 = objc_msgSend_accountForUniqueID_(v9, v10, (uint64_t)v5, v11);

  uint64_t v30 = objc_msgSend_capabilities(v12, v13, v14, v15);
  if (v30 != a4) {
    objc_msgSend_updateCapabilities_(v12, v16, a4, v18);
  }
  uint64_t v19 = objc_msgSend__copyForEnumerating(self->_handlers, v16, v17, v18);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v19;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v22)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_capabilitiesChanged_(v25, v26, (uint64_t)v5, a4);
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v26, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v22);
  }

  if (v30 != a4) {
    objc_msgSend__processMyStatusChanged(self, v27, v28, v29);
  }
}

- (void)account:(id)a3 buddyPropertiesChanged:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10);
  uint64_t v14 = objc_msgSend_accountForUniqueID_(v11, v12, (uint64_t)v6, v13);

  uint64_t v15 = (void *)MEMORY[0x1A6264150]();
  objc_msgSend_buddyPropertiesChanged_(v14, v16, (uint64_t)v7, v17);
  uint64_t v21 = objc_msgSend__copyForEnumerating(self->_handlers, v18, v19, v20);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = v21;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_buddyPropertiesChanged_(v27, v28, (uint64_t)v6, (uint64_t)v7);
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v28, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v24);
  }
}

- (void)account:(id)a3 buddyPictureChanged:(id)a4 imageData:(id)a5 imageHash:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(IMAccountController, v14, v15, v16);
  long long v33 = objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v10, v19);

  uint64_t v20 = (void *)MEMORY[0x1A6264150]();
  objc_msgSend_buddyPictureChanged_imageData_imageHash_(v33, v21, (uint64_t)v11, (uint64_t)v12, v13);
  uint64_t v25 = objc_msgSend__copyForEnumerating(self->_handlers, v22, v23, v24);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v26 = v25;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v28)
  {
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_buddyPictureChanged_imageData_imageHash_(v31, v32, (uint64_t)v10, (uint64_t)v11, v12, v13);
        }
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v28);
  }
}

- (void)displayPinCodeForAccount:(id)a3 pinCode:(id)a4 deviceName:(id)a5 deviceType:(id)a6 phoneNumber:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v18 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v12, v17, @"pinCode", v13, @"deviceName", v14, @"deviceType", v15, @"phoneNumber", 0);
  id v22 = objc_msgSend_sharedInstance(IMAccountController, v19, v20, v21);
  uint64_t v25 = objc_msgSend_accountForUniqueID_(v22, v23, (uint64_t)v11, v24);

  if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v33 = v25;
      _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "SMSPINRelay accountToBroadcast %@", buf, 0xCu);
    }
  }
  long long v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v28);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v30, v31, @"__kIMAccountSMSRelayPinAlertNotification", (uint64_t)v25, v18);
}

- (void)pinCodeAlertCompleted:(id)a3 deviceName:(id)a4 deviceType:(id)a5 phoneNumber:(id)a6 responseFromDevice:(BOOL)a7 wasCancelled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v18, v9, v19);
  uint64_t v23 = objc_msgSend_numberWithBool_(NSNumber, v21, v8, v22);
  id v26 = objc_msgSend_dictionaryWithObjectsAndKeys_(v17, v24, (uint64_t)v20, v25, @"responseFromDevice", v23, @"wasCancelled", v14, @"deviceName", v15, @"deviceType", v16, @"phoneNumber", 0);

  long long v30 = objc_msgSend_sharedInstance(IMAccountController, v27, v28, v29);
  long long v33 = objc_msgSend_accountForUniqueID_(v30, v31, (uint64_t)v13, v32);

  long long v37 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v34, v35, v36);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v37, v38, @"__kIMAccountSMSRelayPinDismissNotification", (uint64_t)v33, v26);
}

- (void)account:(id)a3 buddyProperties:(id)a4 buddyPictures:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v14 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
  long long v30 = objc_msgSend_accountForUniqueID_(v14, v15, (uint64_t)v8, v16);

  uint64_t v17 = (void *)MEMORY[0x1A6264150]();
  objc_msgSend_setBuddyProperties_buddyPictures_(v30, v18, (uint64_t)v9, (uint64_t)v10);
  uint64_t v22 = objc_msgSend__copyForEnumerating(self->_handlers, v19, v20, v21);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v22;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_buddyProperties_buddyPictures_(v28, v29, (uint64_t)v8, (uint64_t)v9, v10);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v29, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v25);
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id value = a6;
  id v14 = a7;
  uint64_t v21 = v13;
  if (objc_msgSend_shouldHoldChatMessages(self, v15, v16, v17))
  {
    uint64_t v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v25 = v22;
    if (v12) {
      CFDictionarySetValue(v22, @"AccountUniqueID", v12);
    }
    uint64_t v26 = v12;
    if (value) {
      CFDictionarySetValue(v25, @"Properties", value);
    }
    if (v21) {
      CFDictionarySetValue(v25, @"ChatIdentifier", v21);
    }
    uint64_t v27 = objc_msgSend_numberWithChar_(NSNumber, v23, (char)v9, v24);
    if (v27) {
      CFDictionarySetValue(v25, @"ChatStyle", v27);
    }

    if (v14) {
      CFDictionarySetValue(v25, @"Message", v14);
    }
    long long v30 = objc_msgSend_numberWithInt_(NSNumber, v28, 0, v29);
    if (v30) {
      CFDictionarySetValue(v25, @"DeferType", v30);
    }

    objc_msgSend__deferNotification_(self, v31, (uint64_t)v25, v32);
  }
  else
  {
    uint64_t v26 = v12;
    long long v33 = objc_msgSend__copyForEnumerating(self->_handlers, v18, v19, v20);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v34 = v33;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v36)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_account_chat_style_chatProperties_invitationReceived_(v39, v40, (uint64_t)v26, (uint64_t)v21, v9, value, v14);
          }
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v40, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v36);
    }
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageReceived:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id value = a6;
  id v14 = a7;
  uint64_t v21 = v13;
  if (objc_msgSend_shouldHoldChatMessages(self, v15, v16, v17))
  {
    uint64_t v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v25 = v22;
    if (v12) {
      CFDictionarySetValue(v22, @"AccountUniqueID", v12);
    }
    uint64_t v26 = v12;
    if (value) {
      CFDictionarySetValue(v25, @"Properties", value);
    }
    if (v21) {
      CFDictionarySetValue(v25, @"ChatIdentifier", v21);
    }
    uint64_t v27 = objc_msgSend_numberWithChar_(NSNumber, v23, (char)v9, v24);
    if (v27) {
      CFDictionarySetValue(v25, @"ChatStyle", v27);
    }

    if (v14) {
      CFDictionarySetValue(v25, @"Message", v14);
    }
    long long v30 = objc_msgSend_numberWithInt_(NSNumber, v28, 1, v29);
    if (v30) {
      CFDictionarySetValue(v25, @"DeferType", v30);
    }

    objc_msgSend__deferNotification_(self, v31, (uint64_t)v25, v32);
  }
  else
  {
    uint64_t v26 = v12;
    long long v33 = objc_msgSend__copyForEnumerating(self->_handlers, v18, v19, v20);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v34 = v33;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v36)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_account_chat_style_chatProperties_messageReceived_(v39, v40, (uint64_t)v26, (uint64_t)v21, v9, value, v14);
          }
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v40, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v36);
    }
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesReceived:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id value = a6;
  id v14 = a7;
  uint64_t v21 = v13;
  if (objc_msgSend_shouldHoldChatMessages(self, v15, v16, v17))
  {
    uint64_t v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v25 = v22;
    if (v12) {
      CFDictionarySetValue(v22, @"AccountUniqueID", v12);
    }
    uint64_t v26 = v12;
    if (value) {
      CFDictionarySetValue(v25, @"Properties", value);
    }
    if (v21) {
      CFDictionarySetValue(v25, @"ChatIdentifier", v21);
    }
    uint64_t v27 = objc_msgSend_numberWithChar_(NSNumber, v23, (char)v9, v24);
    if (v27) {
      CFDictionarySetValue(v25, @"ChatStyle", v27);
    }

    if (v14) {
      CFDictionarySetValue(v25, @"Messages", v14);
    }
    long long v30 = objc_msgSend_numberWithInt_(NSNumber, v28, 2, v29);
    if (v30) {
      CFDictionarySetValue(v25, @"DeferType", v30);
    }

    objc_msgSend__deferNotification_(self, v31, (uint64_t)v25, v32);
  }
  else
  {
    uint64_t v26 = v12;
    long long v33 = objc_msgSend__copyForEnumerating(self->_handlers, v18, v19, v20);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v34 = v33;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v36)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_account_chat_style_chatProperties_messagesReceived_(v39, v40, (uint64_t)v26, (uint64_t)v21, v9, value, v14);
          }
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v40, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v36);
    }
  }
}

- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  int v12 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_sharedInstance(IMFileTransferCenter, v13, v14, v15);
    objc_msgSend__handleFileTransfer_createdWithProperties_(v16, v17, (uint64_t)v18, (uint64_t)v5);
  }
}

- (void)fileTransfers:(id)a3 createdWithLocalPaths:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  int v12 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_sharedInstance(IMFileTransferCenter, v13, v14, v15);
    objc_msgSend__handleFileTransfers_createdWithLocalPaths_(v16, v17, (uint64_t)v18, (uint64_t)v5);
  }
}

- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  int v12 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_sharedInstance(IMFileTransferCenter, v13, v14, v15);
    objc_msgSend__handleFileTransfer_updatedWithProperties_(v16, v17, (uint64_t)v18, (uint64_t)v5);
  }
}

- (void)fileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6
{
  id v21 = a3;
  int v12 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11);
  int v15 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMFileTransferCenter, v16, v17, v18);
    objc_msgSend__handleFileTransfer_updatedWithCurrentBytes_totalBytes_averageTransferRate_(v19, v20, (uint64_t)v21, a4, a5, a6);
  }
}

- (void)fileTransferFinishedRemoteIntentDownload:(id)a3
{
  id v16 = a3;
  id v6 = objc_msgSend_sharedInstance(IMDaemonController, v3, v4, v5);
  int v9 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v6, v7, 0, v8);

  if (v9)
  {
    id v13 = objc_msgSend_sharedInstance(IMFileTransferCenter, v10, v11, v12);
    objc_msgSend__handleFileTransferFinishedRemoteIntentDownload_(v13, v14, (uint64_t)v16, v15);
  }
}

- (void)fileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  int v9 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  int v12 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11);

  if (v12)
  {
    id v16 = objc_msgSend_sharedInstance(IMFileTransferCenter, v13, v14, v15);
    objc_msgSend__handleFileTransfer_highQualityDownloadSucceededWithPath_(v16, v17, (uint64_t)v18, (uint64_t)v5);
  }
}

- (void)fileTransferHighQualityDownloadFailed:(id)a3
{
  id v16 = a3;
  id v6 = objc_msgSend_sharedInstance(IMDaemonController, v3, v4, v5);
  int v9 = *MEMORY[0x1E4F6C518] & objc_msgSend_capabilitiesForListenerID_(v6, v7, 0, v8);

  if (v9)
  {
    id v13 = objc_msgSend_sharedInstance(IMFileTransferCenter, v10, v11, v12);
    objc_msgSend__handleFileTransferHighQualityDownloadFailed_(v13, v14, (uint64_t)v16, v15);
  }
}

- (void)fileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5
{
  id v21 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11);
  int v15 = objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14);

  if ((v15 & 0x10000000) != 0)
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMFileTransferCenter, v16, v17, v18);
    objc_msgSend__handleFileTransfer_explicitDownloadSucceededWithPath_livePhotoBundlePath_(v19, v20, (uint64_t)v21, (uint64_t)v7, v8);
  }
}

- (void)fileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5
{
  id v21 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11);
  int v15 = objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14);

  if ((v15 & 0x10000000) != 0)
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMFileTransferCenter, v16, v17, v18);
    objc_msgSend__handleFileTransferExplicitDownloadFailed_suggestedRetryGUID_error_(v19, v20, (uint64_t)v21, (uint64_t)v7, v8);
  }
}

- (void)fileTransferDownloadedSucceededWithLocalURL:(id)a3
{
  id v16 = a3;
  id v6 = objc_msgSend_sharedInstance(IMDaemonController, v3, v4, v5);
  int v9 = objc_msgSend_capabilitiesForListenerID_(v6, v7, 0, v8);

  if ((v9 & 0x10000000) != 0)
  {
    id v13 = objc_msgSend_sharedInstance(IMFileTransferCenter, v10, v11, v12);
    objc_msgSend__handleFileTransferDownloadSucceededWithLocalURL_(v13, v14, (uint64_t)v16, v15);
  }
}

- (void)fileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  int v9 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  int v12 = objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11);

  if ((v12 & 0x10000000) != 0)
  {
    id v16 = objc_msgSend_sharedInstance(IMFileTransferCenter, v13, v14, v15);
    objc_msgSend__handleFileTransferDownloadFailedWithLocalURL_error_(v16, v17, (uint64_t)v18, (uint64_t)v5);
  }
}

- (void)account:(id)a3 groupsChanged:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
  long long v30 = objc_msgSend_accountForUniqueID_(v14, v15, (uint64_t)v8, v16);

  uint64_t v17 = (void *)MEMORY[0x1A6264150]();
  objc_msgSend_groupsChanged_error_(v30, v18, (uint64_t)v9, (uint64_t)v10);
  uint64_t v22 = objc_msgSend__copyForEnumerating(self->_handlers, v19, v20, v21);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v22;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_groupsChanged_error_(v28, v29, (uint64_t)v8, (uint64_t)v9, v10);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v29, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v25);
  }
}

- (void)account:(id)a3 handleSubscriptionRequestFrom:(id)a4 withMessage:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
  uint64_t v29 = objc_msgSend_accountForUniqueID_(v14, v15, (uint64_t)v8, v16);

  objc_msgSend_handleSubscriptionRequestFrom_withMessage_(v29, v17, (uint64_t)v9, (uint64_t)v10);
  uint64_t v21 = objc_msgSend__copyForEnumerating(self->_handlers, v18, v19, v20);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v21;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_handleSubscriptionRequestFrom_withMessage_(v27, v28, (uint64_t)v8, (uint64_t)v9, v10);
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v28, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v24);
  }
}

- (void)account:(id)a3 postedError:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v11, v12, *MEMORY[0x1E4F6C178], (uint64_t)v10, 0);
  }
  uint64_t v13 = objc_msgSend__copyForEnumerating(self->_handlers, v7, v8, v9);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v13;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_account_postedError_(v19, v20, (uint64_t)v6, (uint64_t)v10);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v20, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v16);
  }
}

- (id)valueOfProperty:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_properties, a2, (uint64_t)a3, v3);
}

- (void)_cacheValue:(id)a3 forProperty:(id)a4
{
  uint64_t v9 = (char *)a3;
  id v7 = a4;
  if (v7)
  {
    properties = self->_properties;
    if (v9) {
      objc_msgSend_setObject_forKey_(properties, v9, (uint64_t)v9, (uint64_t)v7);
    }
    else {
      objc_msgSend_removeObjectForKey_(properties, 0, (uint64_t)v7, v6);
    }
  }
}

- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend__cacheValue_forProperty_(self, v11, (uint64_t)v9, (uint64_t)v8);
  uint64_t v15 = objc_msgSend__copyForEnumerating(self->_handlers, v12, v13, v14);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v15;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_property_changedTo_from_(v21, v22, (uint64_t)v8, (uint64_t)v9, v10);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v22, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v18);
  }
}

- (id)valueOfPersistentProperty:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_persistentProperties, a2, (uint64_t)a3, v3);
}

- (void)_cacheValue:(id)a3 forPersistentProperty:(id)a4
{
  id v9 = (char *)a3;
  id v7 = a4;
  if (v7)
  {
    persistentProperties = self->_persistentProperties;
    if (v9) {
      objc_msgSend_setObject_forKey_(persistentProperties, v9, (uint64_t)v9, (uint64_t)v7);
    }
    else {
      objc_msgSend_removeObjectForKey_(persistentProperties, 0, (uint64_t)v7, v6);
    }
  }
}

- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend__cacheValue_forPersistentProperty_(self, v11, (uint64_t)v9, (uint64_t)v8);
  uint64_t v15 = objc_msgSend__copyForEnumerating(self->_handlers, v12, v13, v14);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v15;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_persistentProperty_changedTo_from_(v21, v22, (uint64_t)v8, (uint64_t)v9, v10);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v22, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v18);
  }
}

- (void)account:(id)a3 defaults:(id)a4 blockList:(id)a5 allowList:(id)a6 blockingMode:(unsigned int)a7 blockIdleStatus:(BOOL)a8 status:(id)a9 capabilities:(unint64_t)a10 serviceLoginStatus:(unint64_t)a11 loginStatusMessage:(id)a12
{
  id v15 = a12;
  id v16 = a9;
  id v19 = a3;
  objc_msgSend_account_defaultsChanged_(self, v17, (uint64_t)v19, (uint64_t)a4);
  objc_msgSend_account_status_capabilities_serviceLoginStatus_loginStatusMessage_(self, v18, (uint64_t)v19, (uint64_t)v16, a10, a11, v15);
}

- (void)newSetupInfoAvailable
{
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Received notice from daemon that setup info has been invalidated, re-requesting", v17, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_sharedController(IMDaemonController, v2, v3, v4);
  objc_msgSend_requestSetup(v6, v7, v8, v9);

  uint64_t v13 = objc_msgSend_sharedController(IMDaemonController, v10, v11, v12);
  objc_msgSend_blockUntilConnected(v13, v14, v15, v16);
}

- (void)databaseUpdated:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7) {
    objc_msgSend__setStamp_forContext_(self, v4, (uint64_t)v7, @"DBModificationStamp");
  }
  uint64_t v8 = objc_msgSend__copyForEnumerating(self->_handlers, v4, v5, v6);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v8;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v39, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_databaseUpdated_(v14, v15, (uint64_t)v7, v16);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v15, (uint64_t)&v34, (uint64_t)v39, 16);
    }
    while (v11);
  }

  uint64_t v20 = objc_msgSend__copyForEnumerating(self->_handlers, v17, v18, v19);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v20;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v30, (uint64_t)v38, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_databaseUpdated(v26, v27, v28, v29);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v27, (uint64_t)&v30, (uint64_t)v38, 16);
    }
    while (v23);
  }
}

- (void)databaseChatSpamUpdated:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend__copyForEnumerating(self->_handlers, v5, v6, v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_databaseChatSpamUpdated_(v14, v15, (uint64_t)v4, v16);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v15, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v11);
  }
}

- (void)didFetchSyncStateStats:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "didFetchSyncStateStats %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    id v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
    uint64_t v14 = @"IMCloudKitSyncStatisticsKey";
    id v15 = v4;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v15, (uint64_t)&v14, 1);
    objc_msgSend_postNotificationName_object_userInfo_(v9, v12, @"IMCloudKitFetchedSyncStatsNotification", (uint64_t)self, v11);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Received nil sync state stats", buf, 2u);
    }
  }
}

- (void)didFetchRampState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "didFetchRampState %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    id v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
    uint64_t v14 = @"IMCloudKitRampStateKey";
    id v15 = v4;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v15, (uint64_t)&v14, 1);
    objc_msgSend_postNotificationName_object_userInfo_(v9, v12, @"IMCloudKitFetchedRampStateNotification", (uint64_t)self, v11);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Received nil rampState", buf, 2u);
    }
  }
}

- (void)didAttemptToDisableiCloudBackups:(int64_t)a3 error:(id)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    v31[0] = @"IMCloudKitBackupDisableBackupAttemptResultKey";
    id v9 = objc_msgSend_numberWithInteger_(NSNumber, v6, a3, v7);
    v31[1] = @"IMCloudKitBackupDisableBackupAttemptErrorKey";
    v32[0] = v9;
    v32[1] = v8;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v32, (uint64_t)v31, 2);

    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v19 = objc_msgSend_localizedDescription(v8, v16, v17, v18);
        *(_DWORD *)buf = 134218242;
        int64_t v28 = a3;
        __int16 v29 = 2112;
        long long v30 = v19;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Attempt to disable iCloud backups resulted in error. Result: %ld, error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v20 = objc_msgSend_numberWithInteger_(NSNumber, v6, a3, v7, @"IMCloudKitBackupDisableBackupAttemptResultKey");
    long long v26 = v20;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v26, (uint64_t)&v25, 1);

    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v28 = a3;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "did attempt to disable iCloud backups: %ld", buf, 0xCu);
      }
    }
  }
  uint64_t v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
  objc_msgSend_postNotificationName_object_userInfo_(v23, v24, @"IMCloudKitAttemptedToDisableiCloudBackupsNotification", (uint64_t)self, v11);
}

- (void)didFetchCloudKitSyncDebuggingInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "did fetch cloudkit sync state debugging info: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  id v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
  objc_msgSend_postNotificationName_object_userInfo_(v9, v10, @"IMCloudKitFetchedSyncDebuggingInfoNotification", (uint64_t)self, v4);
}

- (void)qosClassWhileServicingRequestsResponse:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  int v11 = objc_msgSend_defaultCenter(v6, v8, v9, v10);
  v18[0] = @"Identifier";
  v18[1] = @"QOSClass";
  v19[0] = v7;
  uint64_t v14 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, v4, v13);
  v19[1] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v19, (uint64_t)v18, 2);

  objc_msgSend_postNotificationName_object_userInfo_(v11, v17, @"IMDaemonListenerReceivedQOSClassWhileServicingRequestsResponseNotification", (uint64_t)self, v16);
}

- (void)didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_msgSend_sharedInstance(IMCloudKitHooks, a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__didAttemptToSetEnabledTo_result_(v7, v6, v5, v4);
}

- (void)didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6
{
  BOOL v8 = a3;
  id v9 = a6;
  id v10 = a5;
  objc_msgSend_sharedInstance(IMCloudKitHooks, v11, v12, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__didPerformAdditionalStorageRequiredCheckWithSuccess_additionalStorageRequired_forAccountId_error_(v15, v14, v8, a4, v10, v9);
}

- (void)didAttemptToDisableAllDevicesResult:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_sharedInstance(IMCloudKitHooks, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__didAttemptToDisableAllDevicesResult_(v7, v5, v4, v6);
}

- (void)updateCloudKitState
{
  objc_msgSend_sharedInstance(IMCloudKitHooks, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateCloudKitState(v7, v4, v5, v6);
}

- (void)updateCloudKitProgressWithDictionary:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMCloudKitHooks, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateCloudKitProgressWithDictionary_(v9, v7, (uint64_t)v3, v8);
}

- (void)receivedUrgentRequestForMessages:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend__copyForEnumerating(self->_handlers, v5, v6, v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_receivedUrgentRequestForMessages_(v14, v15, (uint64_t)v4, v16);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v15, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v11);
  }
}

- (void)updatePendingNicknameUpdates:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Got back pending nickname updates %@", buf, 0xCu);
    }
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = objc_msgSend_count(v7, v12, v13, v14);
  long long v18 = objc_msgSend_initWithCapacity_(v11, v16, v15, v17);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1A4B696EC;
  v55[3] = &unk_1E5B7B920;
  id v19 = v18;
  id v56 = v19;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v20, (uint64_t)v55, v21);
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v8;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Got back handled nicknames %@", buf, 0xCu);
    }
  }
  id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v27 = objc_msgSend_count(v8, v24, v25, v26);
  long long v30 = objc_msgSend_initWithCapacity_(v23, v28, v27, v29);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = sub_1A4B69778;
  v53[3] = &unk_1E5B7B920;
  id v31 = v30;
  id v54 = v31;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v32, (uint64_t)v53, v33);
  if (IMOSLoggingEnabled())
  {
    long long v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v9;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Got back archived nicknames %@", buf, 0xCu);
    }
  }
  id v35 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v39 = objc_msgSend_count(v9, v36, v37, v38);
  long long v42 = objc_msgSend_initWithCapacity_(v35, v40, v39, v41);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1A4B69804;
  v51[3] = &unk_1E5B7B920;
  id v52 = v42;
  id v43 = v42;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v44, (uint64_t)v51, v45);
  uint64_t v49 = objc_msgSend_sharedInstance(IMNicknameController, v46, v47, v48);
  objc_msgSend_updatePendingNicknames_handledNicknames_archivedNicknames_(v49, v50, (uint64_t)v19, (uint64_t)v31, v43);
}

- (void)updateNicknameHandlesForSharing:(id)a3 blocked:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedInstance(IMNicknameController, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateSharingAllowList_denyList_(v11, v10, (uint64_t)v6, (uint64_t)v5);
}

- (void)updateTransitionedNicknameHandles:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMNicknameController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateTransitionedNicknameHandles_(v9, v7, (uint64_t)v3, v8);
}

- (void)updateActiveNicknameRecords:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMNicknameController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateIsActiveList_(v9, v7, (uint64_t)v3, v8);
}

- (void)updateIgnoredNicknameRecords:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMNicknameController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateIsIgnoredList_(v9, v7, (uint64_t)v3, v8);
}

- (void)updateUnknownSenderRecords:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMNicknameController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateUnknownSenderRecords_(v9, v7, (uint64_t)v3, v8);
}

- (void)updatePersonalNickname:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMNicknameController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePersonalNickname_(v9, v7, (uint64_t)v3, v8);
}

- (void)oneTimeCodesDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v11 = NSNumber;
      uint64_t v12 = objc_msgSend_count(v3, v8, v9, v10);
      uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(v11, v13, v12, v14);
      *(_DWORD *)buf = 138412290;
      id v23 = v15;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Got the call back for validation codes count %@", buf, 0xCu);
    }
  }
  uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
  long long v20 = @"validCodes";
  id v21 = v3;
  long long v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)&v21, (uint64_t)&v20, 1);
  objc_msgSend_postNotificationName_object_userInfo_(v16, v19, @"com.apple.imcore.otcUpdated", 0, v18);
}

- (void)_resetPostedSetupCompleted
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Resetting posted setup complete after changing listener caps", v4, 2u);
    }
  }
  self->_postedSetupComplete = 0;
}

- (void)simSubscriptionsDidChange
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Raising notification that SIM subscriptions have changed.", v8, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v2, v3, v4);
  objc_msgSend___mainThreadPostNotificationName_object_(v6, v7, *MEMORY[0x1E4F6DF78], 0);
}

- (NSMutableDictionary)_contexts
{
  return self->_contexts;
}

- (void)_setHidingDisconnect:(BOOL)a3
{
  self->_hidingDisconnect = a3;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSString)myStatusMessage
{
  return self->_myStatusMessage;
}

- (void)setMyStatusMessage:(id)a3
{
}

- (unint64_t)vcCapabilities
{
  return self->_vcCapabilities;
}

- (BOOL)shouldHoldChatMessages
{
  return self->_holdingChatMessages;
}

- (BOOL)hasPostedSetupComplete
{
  return self->_postedSetupComplete;
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableDictionary)persistentProperties
{
  return self->_persistentProperties;
}

- (void)setPersistentProperties:(id)a3
{
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (NSMutableArray)deferredChatMessages
{
  return self->_deferredChatMessages;
}

- (void)setDeferredChatMessages:(id)a3
{
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSDate)myIdleSince
{
  return self->_myIdleSince;
}

- (void)setMyIdleSince:(id)a3
{
}

- (NSData)myPicture
{
  return self->_myPicture;
}

- (void)setMyPicture:(id)a3
{
}

- (void)setMyStatus:(unint64_t)a3
{
  self->_myStatus = a3;
}

- (NSString)myNowPlayingString
{
  return self->_myNowPlayingString;
}

- (void)setMyNowPlayingString:(id)a3
{
}

- (BOOL)hasPendingProcessChange
{
  return self->_hasPendingProcessChange;
}

- (void)setHasPendingProcessChange:(BOOL)a3
{
  self->_hasPendingProcessChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myNowPlayingString, 0);
  objc_storeStrong((id *)&self->_myPicture, 0);
  objc_storeStrong((id *)&self->_myIdleSince, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_deferredChatMessages, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_persistentProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_myStatusMessage, 0);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_contexts, 0);
}

@end