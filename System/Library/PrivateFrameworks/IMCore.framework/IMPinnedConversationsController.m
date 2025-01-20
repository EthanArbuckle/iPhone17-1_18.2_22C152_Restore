@interface IMPinnedConversationsController
+ (id)_forceSyncDispatchQueue;
+ (id)_ubiquitousDispatchQueue;
+ (id)pinConfigurationMigrationKey;
+ (id)requiredKeys;
+ (id)sharedInstance;
+ (int64_t)currentPinConfigurationRevision;
+ (int64_t)currentPinConfigurationVersion;
+ (unint64_t)maximumNumberOfPinnedConversations;
- (BOOL)_canPostPinnedConversationsDidChangeNotification;
- (BOOL)_updateLocalStoreWithPinConfiguration:(id)a3;
- (BOOL)hasCompletedInitialization;
- (BOOL)hasDefferedPinnedConversationsDidChangeNotification;
- (BOOL)pinConfigurationHasCompatibleVersion:(id)a3;
- (BOOL)pinConfigurationHasCurrentVersion:(id)a3;
- (BOOL)pinConfigurationIsValid:(id)a3;
- (BOOL)pinnedConversationsContainsChat:(id)a3;
- (BOOL)shouldSync;
- (BOOL)shouldUpdateExistingPinConfig:(id)a3 withProposedPinConfig:(id)a4;
- (BOOL)shouldWriteProposedPinConfiguration:(id)a3 toUbiquitousStoreWithExistingPinConfiguration:(id)a4;
- (IMPinnedConversationsController)init;
- (NSDictionary)chatMetadata;
- (NSOrderedSet)pinnedConversationIdentifierSet;
- (NSUbiquitousKeyValueStore)dataStore;
- (id)_dictionaryWithPinnedConversationIdentifiers:(id)a3 chatMetadata:(id)a4 updateReason:(id)a5 timestamp:(id)a6;
- (id)_locallyStoredPinConfiguration;
- (id)_metadataDictionaryForChat:(id)a3;
- (id)_ubiquitousPinConfigurationInStore:(id)a3;
- (id)chatMetadataFromPinConfiguration:(id)a3;
- (id)dictionaryWithPinnedConversationIdentifiers:(id)a3 chatMetadata:(id)a4 updateReason:(id)a5;
- (id)matchingIdentifierForChat:(id)a3;
- (id)matchingIdentifierForChat:(id)a3 inIdentifierSet:(id)a4 withMetadata:(id)a5;
- (id)mostUpToDatePinConfigurationByComparingPinConfiguration:(id)a3 toOtherPinConfiguration:(id)a4;
- (id)pinnedConversationIdentifiers;
- (id)pinnedConversationIdentifiersFromPinConfiguration:(id)a3;
- (id)validatedPinConfigurationWithCurrentVersionForPinConfiguration:(id)a3;
- (int64_t)numberOfPendingForceSyncs;
- (unint64_t)pinIndexForChat:(id)a3 inIdentifierSet:(id)a4 withMetadata:(id)a5;
- (void)_fetchUbiquitousPinConfiguration:(id)a3;
- (void)_handleChatGroupIDDidChangeNotification:(id)a3;
- (void)_postDeferredPinnedConversationsDidChangeNotificationIfNecessary;
- (void)_postPinnedConversationsDidChangeNotification;
- (void)_setPinnedConversationIdentifiers:(id)a3 withChatMetadata:(id)a4 updateReason:(id)a5 shouldUpdateStores:(BOOL)a6;
- (void)_updateUbiquitousStoreWithPinConfiguration:(id)a3 completion:(id)a4;
- (void)conversationWasDeletedWithIdentifier:(id)a3;
- (void)conversationsWereDeletedWithIdentifiers:(id)a3;
- (void)fetchMostUpToDatePinConfiguration:(id)a3;
- (void)fetchPinnedConversationIdentifiersFromLocalStore;
- (void)forceSynchronizeUbiquitousStore;
- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3;
- (void)imCloudKitHooksSetEnabledDidReturn:(id)a3;
- (void)performPinConfigValidationAndMigrationIfNecessary;
- (void)setChatMetadata:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setHasCompletedInitialization:(BOOL)a3;
- (void)setHasDefferedPinnedConversationsDidChangeNotification:(BOOL)a3;
- (void)setNumberOfPendingForceSyncs:(int64_t)a3;
- (void)setPinnedChats:(id)a3 withUpdateReason:(id)a4;
- (void)setPinnedConversationIdentifierSet:(id)a3;
- (void)synchronizeLocalDataStore;
- (void)updateStoresWithPinConfiguration:(id)a3;
@end

@implementation IMPinnedConversationsController

- (id)pinnedConversationIdentifiersFromPinConfiguration:(id)a3
{
  v4 = objc_msgSend_objectForKey_(a3, a2, @"pP", v3);
  v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (BOOL)shouldSync
{
  v4 = objc_msgSend_sharedInstance(IMCloudKitHooks, a2, v2, v3);
  if (objc_msgSend_isEnabled(v4, v5, v6, v7))
  {
    v11 = objc_msgSend_sharedInstance(IMCloudKitHooks, v8, v9, v10);
    char v15 = objc_msgSend_mocAccountsMatch(v11, v12, v13, v14);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)performPinConfigValidationAndMigrationIfNecessary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_pinConfigurationMigrationKey(v3, v4, v5, v6);
  v11 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], v8, v9, v10);
  char BoolFromDomain_forKey = objc_msgSend_getBoolFromDomain_forKey_(v11, v12, @"com.apple.messages.pinning", (uint64_t)v7);

  if ((BoolFromDomain_forKey & 1) == 0)
  {
    v19 = objc_msgSend__locallyStoredPinConfiguration(self, v14, v15, v16);
    if (v19)
    {
      v20 = objc_msgSend_validatedPinConfigurationWithCurrentVersionForPinConfiguration_(self, v17, (uint64_t)v19, v18);
      v23 = objc_msgSend_pinnedConversationIdentifiersFromPinConfiguration_(self, v21, (uint64_t)v20, v22);
      v27 = objc_msgSend_chatMetadataFromPinConfiguration_(self, v24, (uint64_t)v20, v25);
      if (!v20)
      {
        v28 = IMLogHandleForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1A4CB6F58((uint64_t)v19, v28);
        }
      }
      objc_msgSend__setPinnedConversationIdentifiers_withChatMetadata_updateReason_shouldUpdateStores_(self, v26, (uint64_t)v23, (uint64_t)v27, @"migration", 1);
    }
    else if (IMOSLoggingEnabled())
    {
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        int v35 = 136315138;
        v36 = "-[IMPinnedConversationsController performPinConfigValidationAndMigrationIfNecessary]";
        _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "%s Not performing migration because the local pin config is nil", (uint8_t *)&v35, 0xCu);
      }
    }
    v33 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], v29, v30, v31);
    objc_msgSend_setBool_forDomain_forKey_(v33, v34, 1, @"com.apple.messages.pinning", v7);
  }
}

- (void)fetchPinnedConversationIdentifiersFromLocalStore
{
  objc_msgSend__locallyStoredPinConfiguration(self, a2, v2, v3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_pinnedConversationIdentifiersFromPinConfiguration_(self, v5, (uint64_t)v12, v6);
  uint64_t v10 = objc_msgSend_chatMetadataFromPinConfiguration_(self, v8, (uint64_t)v12, v9);
  objc_msgSend__setPinnedConversationIdentifiers_withChatMetadata_updateReason_shouldUpdateStores_(self, v11, (uint64_t)v7, (uint64_t)v10, @"fetchFromLocalStore", 0);
}

- (id)_locallyStoredPinConfiguration
{
  v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], a2, v2, v3);
  uint64_t v6 = objc_msgSend_getValueFromDomain_forKey_(v4, v5, @"com.apple.messages.pinning", @"pD");

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)_postPinnedConversationsDidChangeNotification
{
  if (objc_msgSend__canPostPinnedConversationsDidChangeNotification(self, a2, v2, v3))
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_copy(self->_pinnedConversationIdentifierSet, v8, v9, v10);
    objc_msgSend_postNotificationName_object_(v13, v12, @"__kIMPinnedConversationsDidChangeNotification", (uint64_t)v11);
  }
  else
  {
    self->_hasDefferedPinnedConversationsDidChangeNotification = 1;
  }
}

- (IMPinnedConversationsController)init
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)IMPinnedConversationsController;
  uint64_t v5 = [(IMPinnedConversationsController *)&v32 init];
  if (v5)
  {
    if (objc_msgSend_processSupportsPinnedConversations(IMPinnedConversationsController, v2, v3, v4))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = objc_msgSend_currentPinConfigurationVersion(IMPinnedConversationsController, v10, v11, v12);
          *(_DWORD *)buf = 134217984;
          uint64_t v34 = v13;
          _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "currentPinConfigurationVersion == %li", buf, 0xCu);
        }
      }
      v5->_numberOfPendingForceSyncs = 0;
      uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
      objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)v5, (uint64_t)sel_imCloudKitHooksSetEnabledDidReturn_, @"com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned", 0);
      objc_msgSend_addObserver_selector_name_object_(v14, v16, (uint64_t)v5, (uint64_t)sel__handleChatGroupIDDidChangeNotification_, @"__kIMChatRegistryGroupIDChangedNotification", 0);
      objc_msgSend_addObserver_selector_name_object_(v14, v17, (uint64_t)v5, (uint64_t)sel__connectedToDaemon_, @"__kIMDaemonDidConnectNotification", 0);
      objc_msgSend_fetchPinnedConversationIdentifiersFromLocalStore(v5, v18, v19, v20);
      int shouldSync = objc_msgSend_shouldSync(v5, v21, v22, v23);
      int v25 = IMOSLoggingEnabled();
      if (shouldSync)
      {
        if (v25)
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "sync to local data store", buf, 2u);
          }
        }
        objc_msgSend_synchronizeLocalDataStore(v5, v26, v27, v28);
      }
      else if (v25)
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "cannot sync to local data store", buf, 2u);
        }
      }
      objc_msgSend_performPinConfigValidationAndMigrationIfNecessary(v5, v26, v27, v28);
      v5->_hasCompletedInitialization = 1;
    }
    else
    {
      uint64_t v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB6F14(v14);
      }
    }
  }
  return v5;
}

- (void)_setPinnedConversationIdentifiers:(id)a3 withChatMetadata:(id)a4 updateReason:(id)a5 shouldUpdateStores:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if (!v10)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_28;
    }
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v47 = 136315138;
      *(void *)&v47[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateRe"
                           "ason:shouldUpdateStores:]";
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "%s called with nil. Ignoring.", v47, 0xCu);
    }
    goto LABEL_6;
  }
  unint64_t v16 = objc_msgSend_count(v10, v12, v13, v14);
  v17 = objc_opt_class();
  unint64_t v21 = objc_msgSend_maximumNumberOfPinnedConversations(v17, v18, v19, v20);
  int v22 = IMOSLoggingEnabled();
  if (v16 <= v21)
  {
    if (v22)
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(void *)&v47[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:update"
                             "Reason:shouldUpdateStores:]";
        v29 = @"NO";
        *(_DWORD *)v47 = 136316162;
        if (v6) {
          v29 = @"YES";
        }
        *(_WORD *)&v47[12] = 2112;
        *(void *)&v47[14] = v15;
        __int16 v48 = 2112;
        v49 = v29;
        __int16 v50 = 2112;
        id v51 = v10;
        __int16 v52 = 2112;
        id v53 = v11;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "%s called with reason: %@, shouldUpdateStores: %@, pinnedConversationIdentifiers: %@, chatMetadata: %@", v47, 0x34u);
      }
    }
    if (v6)
    {
      uint64_t v30 = objc_msgSend_dictionaryWithPinnedConversationIdentifiers_chatMetadata_updateReason_(self, v23, (uint64_t)v10, (uint64_t)v11, v15);
      objc_msgSend_updateStoresWithPinConfiguration_(self, v31, (uint64_t)v30, v32);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v47 = 136315394;
        *(void *)&v47[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:update"
                             "Reason:shouldUpdateStores:]";
        *(_WORD *)&v47[12] = 2112;
        *(void *)&v47[14] = v10;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "%s Setting new cached pinned conversation identifiers %@", v47, 0x16u);
      }
    }
    objc_msgSend_orderedSetWithArray_(MEMORY[0x1E4F1CAA0], v33, (uint64_t)v10, v34, *(_OWORD *)v47);
    v36 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    pinnedConversationIdentifierSet = self->_pinnedConversationIdentifierSet;
    self->_pinnedConversationIdentifierSet = v36;

    if (IMOSLoggingEnabled())
    {
      v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v47 = 136315394;
        *(void *)&v47[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:update"
                             "Reason:shouldUpdateStores:]";
        *(_WORD *)&v47[12] = 2112;
        *(void *)&v47[14] = v11;
        _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "%s Setting new cached chat metadata %@", v47, 0x16u);
      }
    }
    v42 = (NSDictionary *)objc_msgSend_copy(v11, v38, v39, v40);
    chatMetadata = self->_chatMetadata;
    self->_chatMetadata = v42;

    objc_msgSend__postPinnedConversationsDidChangeNotification(self, v44, v45, v46);
  }
  else if (v22)
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v47 = 136315394;
      *(void *)&v47[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateRe"
                           "ason:shouldUpdateStores:]";
      *(_WORD *)&v47[12] = 2048;
      *(void *)&v47[14] = objc_msgSend_count(v10, v25, v26, v27);
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "%s called with %ld items. Ignoring.", v47, 0x16u);
    }
LABEL_6:
  }
LABEL_28:
}

+ (id)sharedInstance
{
  if (qword_1EB3F2328 != -1) {
    dispatch_once(&qword_1EB3F2328, &unk_1EF8E5078);
  }
  objc_msgSend__postDeferredPinnedConversationsDidChangeNotificationIfNecessary((void *)qword_1EB3F2498, a2, v2, v3);
  uint64_t v4 = (void *)qword_1EB3F2498;

  return v4;
}

- (void)_postDeferredPinnedConversationsDidChangeNotificationIfNecessary
{
  if (self->_hasDefferedPinnedConversationsDidChangeNotification
    && objc_msgSend__canPostPinnedConversationsDidChangeNotification(self, a2, v2, v3))
  {
    self->_hasDefferedPinnedConversationsDidChangeNotification = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Performing deffered pinned conversations did change notification.", v9, 2u);
      }
    }
    objc_msgSend__postPinnedConversationsDidChangeNotification(self, v5, v6, v7);
  }
}

- (BOOL)_canPostPinnedConversationsDidChangeNotification
{
  if (!self->_hasCompletedInitialization)
  {
    int v9 = IMOSLoggingEnabled();
    if (!v9) {
      return v9;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      id v11 = "Deffering pinned conversations did change notification until after initialization is completed.";
      uint64_t v12 = (uint8_t *)&v15;
LABEL_10:
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
    }
LABEL_11:

    LOBYTE(v9) = 0;
    return v9;
  }
  uint64_t v4 = objc_msgSend_sharedController(IMDaemonController, a2, v2, v3);
  char isConnected = objc_msgSend_isConnected(v4, v5, v6, v7);

  if ((isConnected & 1) == 0)
  {
    int v9 = IMOSLoggingEnabled();
    if (!v9) {
      return v9;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      id v11 = "Deffering pinned conversations did change notification until after connected to daemon.";
      uint64_t v12 = (uint8_t *)&v14;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (id)matchingIdentifierForChat:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pinnedConversationIdentifierSet(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_chatMetadata(self, v9, v10, v11);
  __int16 v14 = objc_msgSend_matchingIdentifierForChat_inIdentifierSet_withMetadata_(self, v13, (uint64_t)v4, (uint64_t)v8, v12);

  return v14;
}

- (NSOrderedSet)pinnedConversationIdentifierSet
{
  return self->_pinnedConversationIdentifierSet;
}

- (id)matchingIdentifierForChat:(id)a3 inIdentifierSet:(id)a4 withMetadata:(id)a5
{
  id v8 = a4;
  unint64_t v10 = objc_msgSend_pinIndexForChat_inIdentifierSet_withMetadata_(self, v9, (uint64_t)a3, (uint64_t)v8, a5);
  if (v10 >= objc_msgSend_count(v8, v11, v12, v13))
  {
    unint64_t v16 = 0;
  }
  else
  {
    unint64_t v16 = objc_msgSend_objectAtIndex_(v8, v14, v10, v15);
  }

  return v16;
}

- (unint64_t)pinIndexForChat:(id)a3 inIdentifierSet:(id)a4 withMetadata:(id)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_count(v8, v10, v11, v12);
  unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  v96 = v7;
  if (v7 && v13)
  {
    v95 = v9;
    v94 = objc_msgSend_pinningIdentifier(v7, v14, v15, v16);
    uint64_t v20 = objc_msgSend_indexOfObject_(v8, v18, (uint64_t)v94, v19);
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v17 = v20;
      if (IMOSLoggingEnabled())
      {
        v84 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          unint64_t v106 = v17;
          __int16 v107 = 2112;
          uint64_t v108 = (uint64_t)v7;
          _os_log_impl(&dword_1A4AF7000, v84, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using pinning identifier. chat: %@", buf, 0x16u);
        }
      }
      goto LABEL_44;
    }
    objc_msgSend_mergedPinningIdentifiers(v7, v21, v22, v23);
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v101, (uint64_t)v114, 16);
    if (v28)
    {
      uint64_t v29 = *(void *)v102;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v102 != v29) {
            objc_enumerationMutation(v24);
          }
          unint64_t v17 = objc_msgSend_indexOfObject_(v8, v26, *(void *)(*((void *)&v101 + 1) + 8 * i), v27);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {

            if (IMOSLoggingEnabled())
            {
              v85 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                unint64_t v106 = v17;
                __int16 v107 = 2112;
                uint64_t v108 = (uint64_t)v96;
                _os_log_impl(&dword_1A4AF7000, v85, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using merged pinning identifiers. chat: %@", buf, 0x16u);
              }
            }
            goto LABEL_44;
          }
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v101, (uint64_t)v114, 16);
        if (v28) {
          continue;
        }
        break;
      }
    }

    if (objc_msgSend_isGroupChat(v96, v31, v32, v33))
    {
      uint64_t v37 = objc_msgSend_displayName(v96, v34, v35, v36);
      if (!v37
        || (objc_msgSend_displayName(v96, v34, v35, v36),
            v38 = objc_claimAutoreleasedReturnValue(),
            int isEqualToString = objc_msgSend_isEqualToString_(v38, v39, (uint64_t)&stru_1EF8E78C8, v40),
            v38,
            v37,
            isEqualToString))
      {
        v42 = objc_msgSend_sharedRegistry(IMChatRegistry, v34, v35, v36);
        uint64_t v46 = objc_msgSend_participants(v96, v43, v44, v45);
        __int16 v48 = objc_msgSend__sortedParticipantIDHashForParticipants_usesPersonCentricID_(v42, v47, (uint64_t)v46, 0);

        unint64_t v17 = objc_msgSend_indexOfObject_(v8, v49, (uint64_t)v48, v50);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (IMOSLoggingEnabled())
          {
            v88 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218242;
              unint64_t v106 = v17;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v96;
              _os_log_impl(&dword_1A4AF7000, v88, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using participantHash to pinning identifier comparison. chat: %@", buf, 0x16u);
            }
          }
LABEL_51:

LABEL_44:
          id v9 = v95;
          goto LABEL_45;
        }
      }
    }
    if (!objc_msgSend_isGroupChat(v96, v34, v35, v36)) {
      goto LABEL_20;
    }
    __int16 v48 = objc_msgSend_originalGroupID(v96, v51, v52, v53);
    unint64_t v17 = objc_msgSend_indexOfObject_(v8, v54, (uint64_t)v48, v55);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {

LABEL_20:
      if (objc_msgSend_isGroupChat(v96, v51, v52, v53))
      {
        v92 = objc_msgSend_originalGroupID(v96, v56, v57, v58);
        v91 = objc_msgSend_identityHash(v96, v59, v60, v61);
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        objc_msgSend_allKeys(v95, v62, v63, v64);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v97, (uint64_t)v113, 16);
        if (v68)
        {
          uint64_t v93 = *(void *)v98;
          while (2)
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v98 != v93) {
                objc_enumerationMutation(obj);
              }
              uint64_t v70 = *(void *)(*((void *)&v97 + 1) + 8 * j);
              v71 = objc_msgSend_objectForKey_(v95, v66, v70, v67);
              v74 = objc_msgSend_objectForKey_(v71, v72, @"o", v73);
              v77 = v74;
              if (v74)
              {
                if (objc_msgSend_isEqualToString_(v74, v75, (uint64_t)v92, v76))
                {
                  unint64_t v17 = objc_msgSend_indexOfObject_(v8, v75, v70, v76);
                  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v81 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134218754;
                        unint64_t v106 = v17;
                        __int16 v107 = 2112;
                        uint64_t v108 = v70;
                        __int16 v109 = 2112;
                        v110 = v77;
                        __int16 v111 = 2112;
                        v112 = v96;
                        _os_log_impl(&dword_1A4AF7000, v81, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using originalGroupID. pinnedPinningIdentifier: %@, originalGroupID: %@, chat: %@", buf, 0x2Au);
                      }
LABEL_65:
                    }
                    goto LABEL_67;
                  }
                }
              }
              v78 = objc_msgSend_objectForKey_(v71, v75, @"h", v76);
              v81 = v78;
              if (v78)
              {
                if (objc_msgSend_isEqualToString_(v78, v79, (uint64_t)v91, v80))
                {
                  unint64_t v17 = objc_msgSend_indexOfObject_(v8, v82, v70, v83);
                  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v89 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134218754;
                        unint64_t v106 = v17;
                        __int16 v107 = 2112;
                        uint64_t v108 = v70;
                        __int16 v109 = 2112;
                        v110 = v81;
                        __int16 v111 = 2112;
                        v112 = v96;
                        _os_log_impl(&dword_1A4AF7000, v89, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using identityHash. pinnedPinningIdentifier: %@, identityHash: %@, chat: %@", buf, 0x2Au);
                      }
                    }
                    goto LABEL_65;
                  }
                }
              }
            }
            uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v97, (uint64_t)v113, 16);
            if (v68) {
              continue;
            }
            break;
          }
        }
        unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_67:
      }
      else
      {
        unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_44;
    }
    if (IMOSLoggingEnabled())
    {
      v87 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v106 = v17;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v96;
        _os_log_impl(&dword_1A4AF7000, v87, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using originalGroupID to pinning identifier comparison. chat: %@", buf, 0x16u);
      }
    }
    goto LABEL_51;
  }
LABEL_45:

  return v17;
}

- (NSDictionary)chatMetadata
{
  return self->_chatMetadata;
}

- (id)pinnedConversationIdentifiers
{
  return (id)objc_msgSend_array(self->_pinnedConversationIdentifierSet, a2, v2, v3);
}

- (id)chatMetadataFromPinConfiguration:(id)a3
{
  return (id)objc_msgSend_objectForKey_(a3, a2, @"pZ", v3);
}

+ (id)pinConfigurationMigrationKey
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_currentPinConfigurationVersion(a1, a2, v2, v3);
  uint64_t v10 = objc_msgSend_currentPinConfigurationRevision(a1, v7, v8, v9);
  return (id)objc_msgSend_stringWithFormat_(v5, v11, @"IMPinningPinConfigMigrationKey-v%li-r%li", v12, v6, v10);
}

+ (unint64_t)maximumNumberOfPinnedConversations
{
  return 9;
}

+ (int64_t)currentPinConfigurationVersion
{
  return 2;
}

+ (int64_t)currentPinConfigurationRevision
{
  return 2;
}

+ (id)requiredKeys
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = @"pV";
  v8[1] = @"pT";
  v8[2] = @"pP";
  uint64_t v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v8, 3);
  uint64_t v6 = objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3, v5);

  return v6;
}

+ (id)_ubiquitousDispatchQueue
{
  if (qword_1E965E4E8 != -1) {
    dispatch_once(&qword_1E965E4E8, &unk_1EF8E5F78);
  }
  uint64_t v2 = (void *)qword_1E965E4F0;

  return v2;
}

- (NSUbiquitousKeyValueStore)dataStore
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  dataStore = v2->_dataStore;
  if (!dataStore)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29130]);
    uint64_t v6 = objc_msgSend__initWithStoreIdentifier_usingEndToEndEncryption_(v4, v5, @"com.apple.messages.pinning", 1);
    id v7 = v2->_dataStore;
    v2->_dataStore = (NSUbiquitousKeyValueStore *)v6;

    uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend_addObserver_selector_name_object_(v11, v12, (uint64_t)v2, (uint64_t)sel_handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification_, *MEMORY[0x1E4F28A30], v2->_dataStore);

    dataStore = v2->_dataStore;
  }
  uint64_t v13 = dataStore;
  objc_sync_exit(v2);

  return v13;
}

- (id)_dictionaryWithPinnedConversationIdentifiers:(id)a3 chatMetadata:(id)a4 updateReason:(id)a5 timestamp:(id)a6
{
  id v9 = a6;
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  uint64_t v15 = NSNumber;
  uint64_t v19 = objc_msgSend_currentPinConfigurationRevision(IMPinnedConversationsController, v16, v17, v18);
  uint64_t v22 = objc_msgSend_numberWithInteger_(v15, v20, v19, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v14, v23, (uint64_t)v22, @"pR");

  id v24 = NSNumber;
  uint64_t v28 = objc_msgSend_currentPinConfigurationVersion(IMPinnedConversationsController, v25, v26, v27);
  uint64_t v31 = objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  objc_msgSend_setObject_forKeyedSubscript_(v14, v32, (uint64_t)v31, @"pV");

  if (v9)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v14, v33, (uint64_t)v9, @"pT");
  }
  else
  {
    uint64_t v37 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v33, v34, v35);
    objc_msgSend_setObject_forKeyedSubscript_(v14, v38, (uint64_t)v37, @"pT");
  }
  if (v13) {
    objc_msgSend_setObject_forKeyedSubscript_(v14, v36, (uint64_t)v13, @"pP");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v14, v36, MEMORY[0x1E4F1CBF0], @"pP");
  }

  if (v12) {
    objc_msgSend_setObject_forKeyedSubscript_(v14, v39, (uint64_t)v12, @"pZ");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v14, v39, MEMORY[0x1E4F1CC08], @"pZ");
  }

  objc_msgSend_setObject_forKeyedSubscript_(v14, v40, (uint64_t)v11, @"pU");
  uint64_t v44 = objc_msgSend_copy(v14, v41, v42, v43);

  return v44;
}

- (id)dictionaryWithPinnedConversationIdentifiers:(id)a3 chatMetadata:(id)a4 updateReason:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v15 = objc_msgSend_date(v8, v12, v13, v14);
  uint64_t v17 = objc_msgSend__dictionaryWithPinnedConversationIdentifiers_chatMetadata_updateReason_timestamp_(self, v16, (uint64_t)v11, (uint64_t)v10, v9, v15);

  return v17;
}

- (id)_metadataDictionaryForChat:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_msgSend_originalGroupID(v3, v5, v6, v7);
  if (v11 && objc_msgSend_isGroupChat(v3, v8, v9, v10))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"o");
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      id v32 = v3;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "originalGroupID was nil for chat. Not including in chat metadata dictionary. chat: %@", (uint8_t *)&v31, 0xCu);
    }
  }
  uint64_t v20 = objc_msgSend_identityHash(v3, v13, v14, v15);
  if (v20 && objc_msgSend_isGroupChat(v3, v17, v18, v19))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v21, (uint64_t)v20, @"h");
  }
  else if (IMOSLoggingEnabled())
  {
    int v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      id v32 = v3;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "identityHash was nil for chat. Not including in chat metadata dictionary. chat: %@", (uint8_t *)&v31, 0xCu);
    }
  }
  if (objc_msgSend_count(v4, v22, v23, v24)) {
    uint64_t v29 = objc_msgSend_copy(v4, v26, v27, v28);
  }
  else {
    uint64_t v29 = 0;
  }

  return v29;
}

- (id)mostUpToDatePinConfigurationByComparingPinConfiguration:(id)a3 toOtherPinConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_objectForKey_(v5, v7, @"pT", v8);
  id v12 = objc_msgSend_objectForKey_(v6, v10, @"pT", v11);
  uint64_t v16 = v12;
  if (v12) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v9 == 0;
  }
  uint64_t v18 = v5;
  if (!v17) {
    goto LABEL_13;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15);
  double v20 = v19;
  objc_msgSend_timeIntervalSinceReferenceDate(v9, v21, v22, v23);
  uint64_t v18 = v5;
  if (v20 < v27) {
    goto LABEL_13;
  }
  BOOL v28 = v9 || v16 == 0;
  uint64_t v18 = v6;
  if (v28
    && (objc_msgSend_timeIntervalSinceReferenceDate(v9, v24, v25, v26),
        double v30 = v29,
        objc_msgSend_timeIntervalSinceReferenceDate(v16, v31, v32, v33),
        uint64_t v18 = v6,
        v30 >= v34))
  {
    id v35 = 0;
  }
  else
  {
LABEL_13:
    id v35 = v18;
  }

  return v35;
}

- (void)_handleChatGroupIDDidChangeNotification:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  id v12 = objc_msgSend_userInfo(v4, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, @"__kIMChatRegistryPreviousGroupIDKey", v14);

  double v19 = objc_msgSend_userInfo(v4, v16, v17, v18);
  uint64_t v22 = objc_msgSend_objectForKey_(v19, v20, @"__kIMChatRegistryUpdatedGroupIDKey", v21);

  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v63 = 138412802;
      uint64_t v64 = v15;
      __int16 v65 = 2112;
      v66 = v22;
      __int16 v67 = 2112;
      uint64_t v68 = v8;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Received group ID change notification for chat. previousGroupID: %@, newGroupID: %@, chat: %@", (uint8_t *)&v63, 0x20u);
    }
  }
  if (v8)
  {
    double v27 = objc_msgSend_pinnedConversationIdentifierSet(self, v23, v24, v25);
    int v30 = objc_msgSend_containsObject_(v27, v28, (uint64_t)v15, v29);

    if (v30)
    {
      if (IMOSLoggingEnabled())
      {
        double v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          int v63 = 138412802;
          uint64_t v64 = v15;
          __int16 v65 = 2112;
          v66 = v22;
          __int16 v67 = 2112;
          uint64_t v68 = v8;
          _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Chat with previousGroupID (%@) was pinned, but that group ID changed. Replacing previous group ID with new group ID (%@) in the pinning stores. chat: %@", (uint8_t *)&v63, 0x20u);
        }
      }
      id v35 = objc_msgSend_pinnedConversationIdentifierSet(self, v31, v32, v33);
      uint64_t v39 = objc_msgSend_mutableCopy(v35, v36, v37, v38);

      uint64_t v43 = objc_msgSend_indexOfObject_(v39, v40, (uint64_t)v15, v41);
      if (v43 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            LOWORD(v63) = 0;
            _os_log_impl(&dword_1A4AF7000, v44, OS_LOG_TYPE_INFO, "pinnedConversationIdentifierSet contained the previous groupID, but the index was NSNotFound!", (uint8_t *)&v63, 2u);
          }
LABEL_23:
        }
      }
      else
      {
        if (v22)
        {
          objc_msgSend_replaceObjectAtIndex_withObject_(v39, v42, v43, (uint64_t)v22);
          __int16 v48 = objc_msgSend_chatMetadata(self, v45, v46, v47);
          uint64_t v52 = objc_msgSend_mutableCopy(v48, v49, v50, v51);

          objc_msgSend_removeObjectForKey_(v52, v53, (uint64_t)v15, v54);
          uint64_t v60 = objc_msgSend__metadataDictionaryForChat_(self, v55, (uint64_t)v8, v56);
          if (v60) {
            objc_msgSend_setObject_forKey_(v52, v57, (uint64_t)v60, (uint64_t)v22);
          }
          uint64_t v61 = objc_msgSend_array(v39, v57, v58, v59);
          objc_msgSend__setPinnedConversationIdentifiers_withChatMetadata_updateReason_shouldUpdateStores_(self, v62, (uint64_t)v61, (uint64_t)v52, @"groupIDChange", 1);

          goto LABEL_24;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            int v63 = 138412546;
            uint64_t v64 = v15;
            __int16 v65 = 2112;
            v66 = v8;
            _os_log_impl(&dword_1A4AF7000, v44, OS_LOG_TYPE_INFO, "IMPinnedConversationsController received a groupID change notification, but the new groupID was nil! Not making changes to the pin config. previousGroupID: %@, chat: %@", (uint8_t *)&v63, 0x16u);
          }
          goto LABEL_23;
        }
      }
LABEL_24:
    }
  }
}

- (void)setPinnedChats:(id)a3 withUpdateReason:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v6;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v20 = objc_msgSend_pinningIdentifier(v17, v11, v12, v13);
        if (v20)
        {
          objc_msgSend_addObject_(v7, v18, (uint64_t)v20, v19);
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            double v34 = v17;
            _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "pinningIdentifier was nil for chat. Not including in new pinnedConversationIdentifiers. chat: %@", buf, 0xCu);
          }
        }
        uint64_t v25 = objc_msgSend__metadataDictionaryForChat_(self, v21, (uint64_t)v17, v22);
        if (v25) {
          BOOL v26 = v20 != 0;
        }
        else {
          BOOL v26 = 0;
        }
        if (v26) {
          objc_msgSend_setObject_forKey_(v8, v24, (uint64_t)v25, (uint64_t)v20);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v14);
  }

  objc_msgSend__setPinnedConversationIdentifiers_withChatMetadata_updateReason_shouldUpdateStores_(self, v27, (uint64_t)v7, (uint64_t)v8, v28, 1);
}

- (void)conversationWasDeletedWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v7 = objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v10, 1);

    objc_msgSend_conversationsWereDeletedWithIdentifiers_(self, v8, (uint64_t)v7, v9, v10, v11);
  }
}

- (void)conversationsWereDeletedWithIdentifiers:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v82 = a3;
  uint64_t v83 = self;
  id v8 = objc_msgSend_pinnedConversationIdentifierSet(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_pinnedConversationIdentifierSet(self, v13, v14, v15);
    double v20 = objc_msgSend_mutableCopy(v16, v17, v18, v19);

    uint64_t v24 = objc_msgSend_chatMetadata(self, v21, v22, v23);
    id v28 = objc_msgSend_mutableCopy(v24, v25, v26, v27);

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v29 = v82;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v84, (uint64_t)v96, 16);
    if (v33)
    {
      uint64_t v34 = *(void *)v85;
      id v3 = "Warning";
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v85 != v34) {
            objc_enumerationMutation(v29);
          }
          uint64_t v36 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          if (v36)
          {
            objc_msgSend_removeObject_(v20, v31, *(void *)(*((void *)&v84 + 1) + 8 * i), v32);
            objc_msgSend_removeObjectForKey_(v28, v37, v36, v38);
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v89 = "-[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:]";
              _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "%s Tried to delete a nil identifier.", buf, 0xCu);
            }
          }
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v84, (uint64_t)v96, 16);
      }
      while (v33);
    }

    uint64_t v46 = objc_msgSend_pinnedConversationIdentifierSet(v83, v40, v41, v42);
    if (v20 != v46)
    {
      objc_msgSend_pinnedConversationIdentifierSet(v83, v43, v44, v45);
      id v3 = (char *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToOrderedSet_(v20, v47, (uint64_t)v3, v48) & 1) == 0)
      {

LABEL_30:
        if (IMOSLoggingEnabled())
        {
          __int16 v67 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            v71 = objc_msgSend_pinnedConversationIdentifierSet(v83, v68, v69, v70);
            v75 = objc_msgSend_array(v71, v72, v73, v74);
            *(_DWORD *)buf = 136315906;
            v89 = "-[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:]";
            __int16 v90 = 2112;
            id v91 = v29;
            __int16 v92 = 2112;
            uint64_t v93 = v20;
            __int16 v94 = 2112;
            v95 = v75;
            _os_log_impl(&dword_1A4AF7000, v67, OS_LOG_TYPE_INFO, "%s Removing pinned conversations with identifers %@, resulting in pinnedConversationIdentifiers: %@ existing value: %@", buf, 0x2Au);
          }
        }
        uint64_t v76 = objc_msgSend_array(v20, v64, v65, v66);
        uint64_t v80 = objc_msgSend_copy(v28, v77, v78, v79);
        objc_msgSend__setPinnedConversationIdentifiers_withChatMetadata_updateReason_shouldUpdateStores_(v83, v81, (uint64_t)v76, (uint64_t)v80, @"conversationDelete", 1);

LABEL_35:
        goto LABEL_36;
      }
    }
    v49 = objc_msgSend_chatMetadata(v83, v43, v44, v45);
    uint64_t v53 = v49;
    if (v28 == v49)
    {

      uint64_t v58 = v20;
      if (v20 != v46)
      {

        uint64_t v58 = v46;
      }
    }
    else
    {
      uint64_t v54 = objc_msgSend_chatMetadata(v83, v50, v51, v52);
      char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v28, v55, (uint64_t)v54, v56);

      if (v20 == v46)
      {
      }
      else
      {
      }
      if ((isEqualToDictionary & 1) == 0) {
        goto LABEL_30;
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v59 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        int v63 = objc_msgSend_pinnedConversationIdentifierSet(v83, v60, v61, v62);
        *(_DWORD *)buf = 136315906;
        v89 = "-[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:]";
        __int16 v90 = 2112;
        id v91 = v29;
        __int16 v92 = 2112;
        uint64_t v93 = v20;
        __int16 v94 = 2112;
        v95 = v63;
        _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "Received call to %s with identifiers %@, but it resulted in no changes to the cached pinningIdentifiers. proposed: %@ existing value: %@", buf, 0x2Au);
      }
    }
    goto LABEL_35;
  }
LABEL_36:
}

- (BOOL)pinnedConversationsContainsChat:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_pinnedConversationIdentifierSet(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_chatMetadata(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_pinIndexForChat_inIdentifierSet_withMetadata_(self, v13, (uint64_t)v4, (uint64_t)v8, v12);

  return v14 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)validatedPinConfigurationWithCurrentVersionForPinConfiguration:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v98 = a3;
  uint64_t v7 = objc_msgSend_currentPinConfigurationVersion(IMPinnedConversationsController, v4, v5, v6);
  uint64_t v11 = objc_msgSend_currentPinConfigurationRevision(IMPinnedConversationsController, v8, v9, v10);
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v105 = v7;
      __int16 v106 = 2112;
      uint64_t v107 = (uint64_t)v98;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Determining if pin config needs migration to version %li. %@", buf, 0x16u);
    }
  }
  uint64_t v97 = objc_msgSend_objectForKey_(v98, v12, @"pV", v13);
  if (v97)
  {
    v96 = objc_msgSend_objectForKey_(v98, v15, @"pR", v16);
    uint64_t v20 = objc_msgSend_integerValue(v96, v17, v18, v19);
    uint64_t v24 = objc_msgSend_integerValue(v97, v21, v22, v23);
    uint64_t v25 = v24;
    if (v24 > v7)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v105 = v25;
          __int16 v106 = 2048;
          uint64_t v107 = v7;
          __int16 v108 = 2112;
          uint64_t v109 = (uint64_t)v98;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Pin config has a version (%li) greater than the current version (%li). This pin config is not usable. %@", buf, 0x20u);
        }
      }
      id v27 = 0;
      goto LABEL_83;
    }
    BOOL v30 = v24 == v7 && v20 == v11;
    int v31 = IMOSLoggingEnabled();
    if (v30)
    {
      if (v31)
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v105 = v7;
          __int16 v106 = 2048;
          uint64_t v107 = v11;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Pin config has current version (%li) and revision (%li) already . No migration necessary.", buf, 0x16u);
        }
      }
      id v27 = v98;
      goto LABEL_83;
    }
    if (v31)
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v105 = v25;
        __int16 v106 = 2048;
        uint64_t v107 = v7;
        __int16 v108 = 2048;
        uint64_t v109 = v11;
        _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Pin config has a version (%li) less than the current version (%li) or revision (%li). Attempting migration.", buf, 0x20u);
      }
    }
    v95 = objc_msgSend_mutableCopy(v98, v32, v33, v34);
    if (v25 < 2)
    {
      uint64_t v39 = IMLogHandleForCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB70A0(v39);
      }

      uint64_t v42 = objc_msgSend_numberWithInteger_(NSNumber, v40, 2, v41);
      objc_msgSend_setObject_forKey_(v95, v43, (uint64_t)v42, @"pV");
    }
    if (v25 <= 2 && v20 <= 1)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = (uint64_t)v95;
          _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "The given pin config did not have chat metadata. Attempting to add some. pin config: %@", buf, 0xCu);
        }
      }
      __int16 v94 = objc_msgSend_pinnedConversationIdentifiersFromPinConfiguration_(self, v44, (uint64_t)v95, v45);
      v49 = objc_msgSend_orderedSetWithArray_(MEMORY[0x1E4F1CAA0], v47, (uint64_t)v94, v48);
      uint64_t v52 = objc_msgSend_chatMetadataFromPinConfiguration_(self, v50, (uint64_t)v95, v51);
      id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v57 = objc_msgSend_sharedRegistry(IMChatRegistry, v54, v55, v56);
      uint64_t v61 = objc_msgSend_cachedChats(v57, v58, v59, v60);

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v62 = v61;
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v99, (uint64_t)v103, 16);
      if (v65)
      {
        uint64_t v66 = *(void *)v100;
        do
        {
          for (uint64_t i = 0; i != v65; ++i)
          {
            if (*(void *)v100 != v66) {
              objc_enumerationMutation(v62);
            }
            uint64_t v68 = *(void *)(*((void *)&v99 + 1) + 8 * i);
            v71 = objc_msgSend_matchingIdentifierForChat_inIdentifierSet_withMetadata_(self, v64, v68, (uint64_t)v49, v52);
            if (v71)
            {
              uint64_t v73 = objc_msgSend__metadataDictionaryForChat_(self, v69, v68, v70);
              if (v73) {
                objc_msgSend_setObject_forKey_(v53, v72, (uint64_t)v73, (uint64_t)v71);
              }
            }
          }
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v64, (uint64_t)&v99, (uint64_t)v103, 16);
        }
        while (v65);
      }

      if (v53 && objc_msgSend_count(v53, v74, v75, v76)) {
        objc_msgSend_setObject_forKey_(v95, v74, (uint64_t)v53, @"pZ");
      }
      v77 = objc_msgSend_numberWithInteger_(NSNumber, v74, 2, v76);
      objc_msgSend_setObject_forKey_(v95, v78, (uint64_t)v77, @"pV");

      v81 = objc_msgSend_numberWithInteger_(NSNumber, v79, 2, v80);
      objc_msgSend_setObject_forKey_(v95, v82, (uint64_t)v81, @"pR");
    }
    if (objc_msgSend_pinConfigurationIsValid_(self, v37, (uint64_t)v95, v38))
    {
      if (objc_msgSend_pinConfigurationHasCurrentVersion_(self, v83, (uint64_t)v95, v84))
      {
        id v27 = (id)objc_msgSend_copy(v95, v85, v86, v87);
LABEL_82:

LABEL_83:
        goto LABEL_84;
      }
      id v91 = IMLogHandleForCategory();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB6FD0();
      }

      if (IMOSLoggingEnabled())
      {
        __int16 v92 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = (uint64_t)v98;
          _os_log_impl(&dword_1A4AF7000, v92, OS_LOG_TYPE_INFO, "Migrated pin config wrong version. pinConfigToMigrate: %@", buf, 0xCu);
        }
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_81:
        id v27 = 0;
        goto LABEL_82;
      }
      __int16 v90 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v105 = (uint64_t)v95;
        _os_log_impl(&dword_1A4AF7000, v90, OS_LOG_TYPE_INFO, "Migrated pin config wrong version. migratedPinConfig: %@", buf, 0xCu);
      }
    }
    else
    {
      v88 = IMLogHandleForCategory();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB7038();
      }

      if (IMOSLoggingEnabled())
      {
        v89 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = (uint64_t)v98;
          _os_log_impl(&dword_1A4AF7000, v89, OS_LOG_TYPE_INFO, "Invalid migrated pin config. pinConfigToMigrate: %@", buf, 0xCu);
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_81;
      }
      __int16 v90 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v105 = (uint64_t)v95;
        _os_log_impl(&dword_1A4AF7000, v90, OS_LOG_TYPE_INFO, "Invalid migrated pin config. migratedPinConfig: %@", buf, 0xCu);
      }
    }

    goto LABEL_81;
  }
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v105 = (uint64_t)v98;
      _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Pin config has nil version. This pin config is not valid. %@", buf, 0xCu);
    }
  }
  id v27 = 0;
LABEL_84:

  return v27;
}

+ (id)_forceSyncDispatchQueue
{
  if (qword_1E965E800 != -1) {
    dispatch_once(&qword_1E965E800, &unk_1EF8E59F8);
  }
  uint64_t v2 = (void *)qword_1E965E7F8;

  return v2;
}

- (void)imCloudKitHooksSetEnabledDidReturn:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Received IMCloudKitHooksSetEnabledReturned notification {notification %@}", (uint8_t *)&v27, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_userInfo(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, @"ResultKeyNewState", v11);
  int v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);

  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int shouldSync = objc_msgSend_shouldSync(self, v21, v22, v23);
      uint64_t v25 = @"NO";
      if (v16) {
        uint64_t v26 = @"YES";
      }
      else {
        uint64_t v26 = @"NO";
      }
      if (shouldSync) {
        uint64_t v25 = @"YES";
      }
      int v27 = 138412546;
      id v28 = v26;
      __int16 v29 = 2112;
      BOOL v30 = v25;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "New MiC enabled state is %@. [self shouldSync] == %@", (uint8_t *)&v27, 0x16u);
    }
  }
  objc_msgSend_synchronizeLocalDataStore(self, v17, v18, v19);
}

- (void)synchronizeLocalDataStore
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4B3D2B4;
  v5[3] = &unk_1E5B7ADF0;
  objc_copyWeak(&v6, &location);
  objc_msgSend_fetchMostUpToDatePinConfiguration_(self, v3, (uint64_t)v5, v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)forceSynchronizeUbiquitousStore
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_numberOfPendingForceSyncs(self, a2, v2, v3) < 4)
  {
    uint64_t v9 = objc_msgSend_numberOfPendingForceSyncs(self, v5, v6, v7);
    objc_msgSend_setNumberOfPendingForceSyncs_(self, v10, v9 + 1, v11);
    *(void *)uint64_t v18 = 0;
    objc_initWeak((id *)v18, self);
    uint64_t v15 = objc_msgSend__forceSyncDispatchQueue(IMPinnedConversationsController, v12, v13, v14);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1A4B3D774;
    v16[3] = &unk_1E5B7ADC8;
    objc_copyWeak(&v17, (id *)v18);
    dispatch_async(v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)v18);
  }
  else if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v18 = 136315394;
      *(void *)&v18[4] = "-[IMPinnedConversationsController forceSynchronizeUbiquitousStore]";
      __int16 v19 = 2048;
      uint64_t v20 = 3;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Blocking additional calls to %s because there are already at least %ld pending calls.", v18, 0x16u);
    }
  }
}

- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Received NSUbiquitousKeyValueStoreDidChangeExternallyNotification {notification: %@}", buf, 0xCu);
    }
  }
  if (objc_msgSend_shouldSync(self, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend_userInfo(v4, v9, v10, v11);
    uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x1E4F28A28], v14);

    if (objc_msgSend_containsObject_(v15, v16, @"pD", v17))
    {
      uint64_t v21 = objc_msgSend_userInfo(v4, v18, v19, v20);
      uint64_t v24 = objc_msgSend_objectForKey_(v21, v22, *MEMORY[0x1E4F28A20], v23);

      if (v24)
      {
        uint64_t v28 = objc_msgSend_integerValue(v24, v25, v26, v27);
        switch(v28)
        {
          case 0:
            if (IMOSLoggingEnabled())
            {
              __int16 v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreServerChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          case 1:
            if (IMOSLoggingEnabled())
            {
              __int16 v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreInitialSyncChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          case 2:
            if (IMOSLoggingEnabled())
            {
              __int16 v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreQuotaViolationChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          case 3:
            if (IMOSLoggingEnabled())
            {
              __int16 v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreAccountChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          default:
            if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_22;
            }
            if (IMOSLoggingEnabled())
            {
              __int16 v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v34 = v24;
                _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is %@", buf, 0xCu);
              }
              goto LABEL_25;
            }
            break;
        }
      }
      else
      {
LABEL_22:
        if (IMOSLoggingEnabled())
        {
          __int16 v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is nil.", buf, 2u);
          }
LABEL_25:
        }
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4B3DE3C;
      block[3] = &unk_1E5B7ACD0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] IMPinConfigurationTopLevelKey was not in NSUbiquitousKeyValueStoreChangedKeysKey. Ignoring notification.", buf, 2u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "[self shouldSync] == NO. Ignoring NSUbiquitousKeyValueStoreDidChangeExternallyNotification.", buf, 2u);
    }
  }
}

- (void)updateStoresWithPinConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[IMPinnedConversationsController updateStoresWithPinConfiguration:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "%s Updating stores %@", buf, 0x16u);
    }
  }
  objc_msgSend__updateLocalStoreWithPinConfiguration_(self, v5, (uint64_t)v4, v6);
  if (objc_msgSend_shouldSync(self, v8, v9, v10))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A4B3DFB8;
    v12[3] = &unk_1E5B7AE18;
    id v13 = v4;
    objc_msgSend__updateUbiquitousStoreWithPinConfiguration_completion_(self, v11, (uint64_t)v13, (uint64_t)v12);
  }
}

- (void)_updateUbiquitousStoreWithPinConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Attempting to save new pin configuration to ubiquitous store: %@", buf, 0xCu);
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4B3E284;
  v13[3] = &unk_1E5B7AE40;
  objc_copyWeak(&v16, (id *)buf);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  objc_msgSend__fetchUbiquitousPinConfiguration_(self, v11, (uint64_t)v13, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_updateLocalStoreWithPinConfiguration:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Received request to save new pin configuration to local store: %@", buf, 0xCu);
    }
  }
  objc_msgSend_validatedPinConfigurationWithCurrentVersionForPinConfiguration_(self, v5, (uint64_t)v4, v6);
  id v8 = (char *)objc_claimAutoreleasedReturnValue();
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v4;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Successfully migrated pin config to current version. before: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v8;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Successfully migrated pin config to current version. after: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v8;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Attempting to save the migrated pin config to local store: %@", buf, 0xCu);
      }
    }
    objc_msgSend__locallyStoredPinConfiguration(self, v12, v13, v14);
    id v16 = (char *)objc_claimAutoreleasedReturnValue();
    int shouldUpdateExistingPinConfig_withProposedPinConfig = objc_msgSend_shouldUpdateExistingPinConfig_withProposedPinConfig_(self, v17, (uint64_t)v16, (uint64_t)v8);
    int v19 = IMOSLoggingEnabled();
    if (shouldUpdateExistingPinConfig_withProposedPinConfig)
    {
      if (v19)
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v16;
          _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Saving new pin configuration to local store. Old: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v8;
          _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Saving new pin configuration to local store. New: %@", buf, 0xCu);
        }
      }
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        uint64_t v27 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], v22, v23, v24);
        objc_msgSend_setValue_forDomain_forKey_(v27, v28, (uint64_t)v8, @"com.apple.messages.pinning", @"pD");

        id v29 = objc_alloc_init((Class)MEMORY[0x1A6263B40](@"NPSManager", @"NanoPreferencesSync"));
        BOOL v30 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v39 = @"pD";
        uint64_t v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v31, (uint64_t)&v39, 1);
        uint64_t v35 = objc_msgSend_setWithArray_(v30, v33, (uint64_t)v32, v34);
        objc_msgSend_synchronizeUserDefaultsDomain_keys_(v29, v36, @"com.apple.messages.pinning", (uint64_t)v35);

        if (IMOSLoggingEnabled())
        {
          uint64_t v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "syncManager", buf, 2u);
          }
        }
        goto LABEL_46;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_46:

        goto LABEL_47;
      }
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v41 = "-[IMPinnedConversationsController _updateLocalStoreWithPinConfiguration:]";
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "%s Didn't actually update the local store because we're running a unit test.", buf, 0xCu);
      }
    }
    else
    {
      if (!v19) {
        goto LABEL_46;
      }
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v8;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "shouldUpdate == NO. Not saving new pin configuration to local store: %@", buf, 0xCu);
      }
    }

    goto LABEL_46;
  }
  if (v9)
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = v4;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Could not migrate the proposedConfig to the current version. Not saving new pin configuration to local store: %@", buf, 0xCu);
    }
  }
  LOBYTE(shouldUpdateExistingPinConfig_withProposedPinConfig) = 0;
LABEL_47:

  return shouldUpdateExistingPinConfig_withProposedPinConfig;
}

- (BOOL)shouldWriteProposedPinConfiguration:(id)a3 toUbiquitousStoreWithExistingPinConfiguration:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v9 = objc_msgSend_objectForKey_(v6, v7, @"pV", v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v5, v10, @"pV", v11);
  id v16 = v12;
  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v37 = 138413058;
        uint64_t v38 = 0;
        __int16 v39 = 2048;
        uint64_t v40 = (const char *)objc_msgSend_integerValue(0, v25, v26, v27);
        __int16 v41 = 2112;
        uint64_t v42 = v9;
        __int16 v43 = 2048;
        uint64_t v44 = objc_msgSend_integerValue(v9, v28, v29, v30);
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Could not definitively determine if proposed version (%@, %li) is greater than or equal to the existing ubiquitous data's (%@, %li), not writing to ubiquitous store", (uint8_t *)&v37, 0x2Au);
      }
    }
    goto LABEL_12;
  }
  if (v9)
  {
    uint64_t v17 = objc_msgSend_integerValue(v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_integerValue(v9, v18, v19, v20);
    int v22 = IMOSLoggingEnabled();
    if (v17 < v21)
    {
      if (v22)
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v37 = 134218240;
          uint64_t v38 = v17;
          __int16 v39 = 2048;
          uint64_t v40 = (const char *)v21;
          _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Proposed version (%li) is less than the existing ubiquitous data's (%li), not writing earlier version to ubiquitous store", (uint8_t *)&v37, 0x16u);
        }
      }
LABEL_12:
      BOOL v31 = 0;
      goto LABEL_22;
    }
    if (v22)
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        int v37 = 134218240;
        uint64_t v38 = v17;
        __int16 v39 = 2048;
        uint64_t v40 = (const char *)v21;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Proposed version (%li) is greater than or equal to the existing ubiquitous data's (%li), ok to write to ubiquitous store", (uint8_t *)&v37, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "There was no existing version in the ubiquitous store.", (uint8_t *)&v37, 2u);
    }
  }
  BOOL v31 = 1;
LABEL_22:
  if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = @"NO";
      if (v31) {
        uint64_t v35 = @"YES";
      }
      int v37 = 138412546;
      uint64_t v38 = (uint64_t)v35;
      __int16 v39 = 2080;
      uint64_t v40 = "-[IMPinnedConversationsController shouldWriteProposedPinConfiguration:toUbiquitousStoreWithExistingPinConfiguration:]";
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Returning %@ for %s", (uint8_t *)&v37, 0x16u);
    }
  }
  return v31;
}

- (BOOL)pinConfigurationHasCompatibleVersion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v6 = objc_msgSend_objectForKey_(v3, v4, @"pV", v5);
  id v10 = v6;
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v24 = 136315138;
        uint64_t v25 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "%s The pin config's version was nil.", (uint8_t *)&v24, 0xCu);
      }
    }
    goto LABEL_11;
  }
  uint64_t v11 = objc_msgSend_integerValue(v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_currentPinConfigurationVersion(IMPinnedConversationsController, v12, v13, v14);
  int v16 = IMOSLoggingEnabled();
  if (v11 > v15)
  {
    if (v16)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v24 = 136315650;
        uint64_t v25 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
        __int16 v26 = 2048;
        uint64_t v27 = (const char *)v11;
        __int16 v28 = 2048;
        uint64_t v29 = v15;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "%s The pin config's version (%li) was definitively greater than the current version (%li).", (uint8_t *)&v24, 0x20u);
      }
    }
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_17;
  }
  if (v16)
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v24 = 136315650;
      uint64_t v25 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
      __int16 v26 = 2048;
      uint64_t v27 = (const char *)v11;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "%s The pin config's version (%li) was definitively less than or equal to the current version (%li).", (uint8_t *)&v24, 0x20u);
    }
  }
  BOOL v19 = 1;
LABEL_17:
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = @"NO";
      if (v19) {
        int v22 = @"YES";
      }
      int v24 = 138412546;
      uint64_t v25 = (const char *)v22;
      __int16 v26 = 2080;
      uint64_t v27 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Returning %@ for %s", (uint8_t *)&v24, 0x16u);
    }
  }
  return v19;
}

- (BOOL)pinConfigurationIsValid:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_requiredKeys(IMPinnedConversationsController, v5, v6, v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v8);
        }
        int v16 = objc_msgSend_objectForKey_(v4, v11, *(void *)(*((void *)&v21 + 1) + 8 * i), v12, (void)v21);

        if (!v16)
        {

          char HasCompatibleVersion = 0;
          goto LABEL_11;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v21, (uint64_t)v25, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }

  char HasCompatibleVersion = objc_msgSend_pinConfigurationHasCompatibleVersion_(self, v17, (uint64_t)v4, v18);
LABEL_11:

  return HasCompatibleVersion;
}

- (BOOL)pinConfigurationHasCurrentVersion:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(a3, a2, @"pV", v3);
  uint64_t v8 = objc_msgSend_currentPinConfigurationVersion(IMPinnedConversationsController, v5, v6, v7);
  if (v4) {
    BOOL v12 = objc_msgSend_integerValue(v4, v9, v10, v11) == v8;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)shouldUpdateExistingPinConfig:(id)a3 withProposedPinConfig:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!objc_msgSend_pinConfigurationIsValid_(self, v8, (uint64_t)v7, v9))
  {
    BOOL v28 = 0;
    goto LABEL_25;
  }
  BOOL v12 = objc_msgSend_objectForKey_(v6, v10, @"pT", v11);
  uint64_t v18 = objc_msgSend_objectForKey_(v7, v13, @"pT", v14);
  if (!v18)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v33 = 136315138;
        uint64_t v34 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "%s The proposed timestamp was nil.", (uint8_t *)&v33, 0xCu);
      }
      goto LABEL_22;
    }
LABEL_23:
    BOOL v28 = 0;
    goto LABEL_24;
  }
  if (v12)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v12, v15, v16, v17);
    double v20 = v19;
    objc_msgSend_timeIntervalSinceReferenceDate(v18, v21, v22, v23);
    double v25 = v24;
    int v26 = IMOSLoggingEnabled();
    if (v20 < v25)
    {
      if (v26)
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v33 = 136315138;
          uint64_t v34 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
          _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "%s The proposed timestamp was definitively later than the existing timestamp.", (uint8_t *)&v33, 0xCu);
        }
LABEL_17:

        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if (v26)
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v33 = 136315138;
        uint64_t v34 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "%s The proposed timestamp was definitively earlier than or equivalent to the existing timestamp.", (uint8_t *)&v33, 0xCu);
      }
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v33 = 136315138;
      uint64_t v34 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
      _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "%s There was no existing timestamp.", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_18:
  BOOL v28 = 1;
LABEL_24:

LABEL_25:
  if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      BOOL v31 = @"NO";
      if (v28) {
        BOOL v31 = @"YES";
      }
      int v33 = 138412546;
      uint64_t v34 = (const char *)v31;
      __int16 v35 = 2080;
      uint64_t v36 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
      _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Returning %@ for %s", (uint8_t *)&v33, 0x16u);
    }
  }
  return v28;
}

- (void)_fetchUbiquitousPinConfiguration:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v8 = objc_msgSend__ubiquitousDispatchQueue(IMPinnedConversationsController, v5, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B3F858;
  block[3] = &unk_1E5B7AEB8;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)fetchMostUpToDatePinConfiguration:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B3FBBC;
  v8[3] = &unk_1E5B7AF08;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend__fetchUbiquitousPinConfiguration_(self, v6, (uint64_t)v8, v7);
}

- (id)_ubiquitousPinConfigurationInStore:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], v4, v5, v6);
  int BoolFromDomain_forKey = objc_msgSend_getBoolFromDomain_forKey_(v7, v8, @"com.apple.messages.pinning", @"IMPinningShouldTryFetchAgainIfNullKey");
  id v12 = objc_msgSend_dictionaryForKey_(v3, v10, @"pD", v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      long long v21 = v12;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Retrieved from iCloud: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  if (v12)
  {
    if ((BoolFromDomain_forKey & 1) == 0) {
      objc_msgSend_setBool_forDomain_forKey_(v7, v13, 1, @"com.apple.messages.pinning", @"IMPinningShouldTryFetchAgainIfNullKey");
    }
    goto LABEL_24;
  }
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Received nil when trying to fetch the pin configuration from the ubiquitous store because the NSUbiquitousKeyValueStore was nil.", (uint8_t *)&v20, 2u);
      }
      goto LABEL_22;
    }
LABEL_23:
    id v12 = 0;
    goto LABEL_24;
  }
  if (!BoolFromDomain_forKey) {
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Received nil when trying to fetch the pin configuration from the ubiquitous store even though the NSUbiquitousKeyValueStore is initialized and the user has already pinned something before. This is an issue in NSUbiquitousKeyValueStore. Trying again.", (uint8_t *)&v20, 2u);
    }
  }
  id v12 = objc_msgSend_dictionaryForKey_(v3, v15, @"pD", v16);
  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Received nil when trying to fetch the pin configuration from the ubiquitous store even after trying the fetch again. This is an issue in NSUbiquitousKeyValueStore.", (uint8_t *)&v20, 2u);
      }
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_24:

  return v12;
}

- (BOOL)hasCompletedInitialization
{
  return self->_hasCompletedInitialization;
}

- (void)setHasCompletedInitialization:(BOOL)a3
{
  self->_hasCompletedInitialization = a3;
}

- (BOOL)hasDefferedPinnedConversationsDidChangeNotification
{
  return self->_hasDefferedPinnedConversationsDidChangeNotification;
}

- (void)setHasDefferedPinnedConversationsDidChangeNotification:(BOOL)a3
{
  self->_hasDefferedPinnedConversationsDidChangeNotification = a3;
}

- (int64_t)numberOfPendingForceSyncs
{
  return self->_numberOfPendingForceSyncs;
}

- (void)setNumberOfPendingForceSyncs:(int64_t)a3
{
  self->_numberOfPendingForceSyncs = a3;
}

- (void)setDataStore:(id)a3
{
}

- (void)setPinnedConversationIdentifierSet:(id)a3
{
}

- (void)setChatMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatMetadata, 0);
  objc_storeStrong((id *)&self->_pinnedConversationIdentifierSet, 0);

  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end