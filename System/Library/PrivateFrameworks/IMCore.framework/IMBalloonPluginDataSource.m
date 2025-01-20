@interface IMBalloonPluginDataSource
+ (BOOL)isPayloadServiceManatee:(id)a3;
+ (BOOL)supportsIndividualPreviewSummaries;
+ (BOOL)supportsURL:(id)a3;
+ (id)URLForDugongShareURL:(id)a3 handle:(id)a4 metadata:(id)a5;
+ (id)URLForDugongShareURL:(id)a3 handle:(id)a4 payload:(id)a5;
+ (id)individualPreviewSummaryForPluginPayload:(id)a3;
+ (id)lastAddressedHandleIDFromChat:(id)a3;
+ (id)previewSummary;
+ (id)previewSummaryForPluginBundle:(id)a3;
+ (id)previewSummaryForPluginPayload:(id)a3 withBundleID:(id)a4 previewAttachmentURL:(id *)a5 previewAttachmentUTI:(id *)a6;
+ (id)replaceHandleWithContactNameInString:(id)a3 forAccount:(id)a4 additionalHandles:(id)a5;
+ (id)unlocalizedPreviewSummaryForPluginBundle:(id)a3 pluginDisplayName:(id)a4;
- (BOOL)_senderIsSameBetweenPayload:(id)a3 andOtherPayload:(id)a4;
- (BOOL)allowedByScreenTime;
- (BOOL)hasInvalidatedSize;
- (BOOL)initialMessageIsFromMe;
- (BOOL)isDeferredSend;
- (BOOL)isFromMe;
- (BOOL)isLast;
- (BOOL)isPlayed;
- (BOOL)isShowingLatestMessageAsBreadcrumb;
- (BOOL)parentChatHasAllUnknownRecipients;
- (BOOL)payloadInShelf;
- (BOOL)supportsDynamicSize;
- (BOOL)wantsReplyFromContentView;
- (BOOL)wantsStatusItem;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DDScannerResult)dataDetectedResult;
- (IMBalloonPluginDataSource)initWithPluginPayload:(id)a3;
- (IMBalloonPluginDataSourceDelegate)pluginDataSourceDelegate;
- (IMChat)chat;
- (IMMessage)imMessage;
- (IMPluginDataSourceStagingContext)stagingContext;
- (IMPluginPayload)pluginPayload;
- (LPLinkMetadata)richLinkMetadata;
- (NSArray)allPayloads;
- (NSArray)attachmentGUIDs;
- (NSArray)consumedPayloads;
- (NSArray)pendingAttachmentData;
- (NSAttributedString)statusAttributedString;
- (NSData)messagePayloadDataForSending;
- (NSData)payload;
- (NSMutableSet)temporaryAttachmentURLs;
- (NSString)_imMessageGUID;
- (NSString)bundleID;
- (NSString)guidOfLastMessageInSession;
- (NSString)messageGUID;
- (NSString)sessionGUID;
- (NSString)statusString;
- (NSURL)URLToOpenOnTapAction;
- (NSURL)url;
- (id)_overrideURLForOpeningURL:(id)a3;
- (id)_replaceHandleWithContactNameInString:(id)a3;
- (id)_summaryText;
- (id)description;
- (id)individualPreviewAttachmentFileAndUTI:(id *)a3;
- (id)individualPreviewSummary;
- (id)overrideURLForOpeningURL:(id)a3;
- (id)willOpenHandler;
- (int64_t)messageIDOfLastMessageInSession;
- (unint64_t)_updateWithPluginPayload:(id)a3 messageID:(int64_t)a4 messageGUID:(id)a5;
- (unint64_t)playbackType;
- (void)_dataSourceDidChange;
- (void)_reloadLatestUnconsumedBreadcrumb;
- (void)_removeTemporaryAttachmentURLs;
- (void)_updatePayload:(id)a3 messageID:(int64_t)a4 messageGUID:(id)a5;
- (void)_updateTemporaryAttachmentURLsForPluginPayload;
- (void)beginShowingLastConsumedBreadcrumbForOutgoingPayload:(id)a3;
- (void)checkForAllowedByScreenTime;
- (void)chooseOptions;
- (void)datasourceWasMovedToNewGuid:(id)a3;
- (void)endShowingLastConsumedBreadcrumb;
- (void)markAsPlayed;
- (void)needsResize;
- (void)payloadWillSendFromShelf;
- (void)playbackWithCompletionBlock:(id)a3;
- (void)pluginPayloadDidChange:(unint64_t)a3;
- (void)pluginPayloadShouldSendCollaboration;
- (void)pluginPayloadShouldSendCopy;
- (void)sendPayload:(id)a3;
- (void)sendPayload:(id)a3 attachments:(id)a4;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setAttachmentGUIDs:(id)a3;
- (void)setChat:(id)a3;
- (void)setConsumedPayloads:(id)a3;
- (void)setDataDetectedResult:(id)a3;
- (void)setHasInvalidatedSize:(BOOL)a3;
- (void)setInitialMessageIsFromMe:(BOOL)a3;
- (void)setLast:(BOOL)a3;
- (void)setMessageGUID:(id)a3;
- (void)setParentChatHasAllUnknownRecipients:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setPayload:(id)a3 attachments:(id)a4;
- (void)setPayloadInShelf:(BOOL)a3;
- (void)setPendingAttachmentData:(id)a3;
- (void)setPluginDataSourceDelegate:(id)a3;
- (void)setPluginPayload:(id)a3;
- (void)setSessionGUID:(id)a3;
- (void)setShowingLatestMessageAsBreadcrumb:(BOOL)a3;
- (void)setStagingContext:(id)a3;
- (void)setTemporaryAttachmentURLs:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWillOpenHandler:(id)a3;
- (void)set_imMessageGUID:(id)a3;
- (void)statusStringNeedsUpdate;
- (void)thumbnailURLWithSize:(CGSize)a3 completion:(id)a4;
- (void)updatePayload:(id)a3;
- (void)updatePayload:(id)a3 attachments:(id)a4;
- (void)updatePayloadForShelfAnimation:(id)a3;
@end

@implementation IMBalloonPluginDataSource

- (IMBalloonPluginDataSource)initWithPluginPayload:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_messageGUID(v4, v5, v6, v7);
  v12 = objc_msgSend_data(v4, v9, v10, v11);
  v16 = objc_msgSend_dataDetectedResult(v4, v13, v14, v15);
  v20 = objc_msgSend_url(v4, v17, v18, v19);
  v22 = (IMBalloonPluginDataSource *)objc_msgSend_initWithMessageGUID_payload_dataDetectedResult_url_(self, v21, (uint64_t)v8, (uint64_t)v12, v16, v20);

  if (v22
    || (v101.receiver = 0,
        v101.super_class = (Class)IMBalloonPluginDataSource,
        (v22 = [(IMBalloonPluginDataSource *)&v101 init]) != 0))
  {
    objc_msgSend_setPluginPayload_(v22, v23, (uint64_t)v4, v24);
    uint64_t v28 = objc_msgSend_pluginBundleID(v4, v25, v26, v27);
    bundleID = v22->_bundleID;
    v22->_bundleID = (NSString *)v28;

    uint64_t v33 = objc_msgSend_url(v4, v30, v31, v32);
    url = v22->_url;
    v22->_url = (NSURL *)v33;

    uint64_t v38 = objc_msgSend_dataDetectedResult(v4, v35, v36, v37);
    dataDetectedResult = v22->_dataDetectedResult;
    v22->_dataDetectedResult = (DDScannerResult *)v38;

    uint64_t v43 = objc_msgSend_consumedSessionPayloads(v4, v40, v41, v42);
    consumedPayloads = v22->_consumedPayloads;
    v22->_consumedPayloads = (NSArray *)v43;

    v48 = objc_msgSend_pluginBundleID(v4, v45, v46, v47);
    int isEqualToString = objc_msgSend_isEqualToString_(v48, v49, *MEMORY[0x1E4F6CBA0], v50);

    if (isEqualToString) {
      objc_msgSend__updateTemporaryAttachmentURLsForPluginPayload(v22, v52, v53, v54);
    }
    if (IMOSLoggingEnabled())
    {
      v55 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        id v56 = (id)objc_opt_class();
        objc_msgSend_messageGUID(v22, v57, v58, v59);
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleID(v22, v61, v62, v63);
        id v64 = (id)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend_payload(v22, v65, v66, v67);
        uint64_t v72 = objc_msgSend_length(v68, v69, v70, v71);
        v76 = objc_msgSend_pluginPayload(v22, v73, v74, v75);
        v80 = objc_msgSend_attachments(v76, v77, v78, v79);
        uint64_t v84 = objc_msgSend_count(v80, v81, v82, v83);
        *(_DWORD *)buf = 138413570;
        *(void *)&buf[4] = v56;
        __int16 v103 = 2112;
        id v104 = v60;
        __int16 v105 = 2112;
        id v106 = v64;
        __int16 v107 = 2048;
        uint64_t v108 = v72;
        __int16 v109 = 2048;
        uint64_t v110 = v84;
        __int16 v111 = 2048;
        v112 = v22;
        _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "Initialized %@(message guid: %@, bundle id: %@) with %tu byte payload, %tu attachments self pointer: %p", buf, 0x3Eu);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v22);
    v88 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v85, v86, v87);
    v92 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v89, v90, v91);
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = sub_1A4B44874;
    v99[3] = &unk_1E5B7B108;
    objc_copyWeak(&v100, (id *)buf);
    id v94 = (id)objc_msgSend_addObserverForName_object_queue_usingBlock_(v88, v93, @"com.apple.messages.IMDowntimeStateChangedForBundleID", 0, v92, v99);

    objc_msgSend_checkForAllowedByScreenTime(v22, v95, v96, v97);
    objc_destroyWeak(&v100);
    objc_destroyWeak((id *)buf);
  }

  return v22;
}

- (void)checkForAllowedByScreenTime
{
  v5 = objc_msgSend_sharedInstance(IMBalloonPluginManager, a2, v2, v3);
  v9 = objc_msgSend_bundleID(self, v6, v7, v8);
  objc_msgSend_systemBundleIdentifierForPluginIdentifier_(v5, v10, (uint64_t)v9, v11);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    uint64_t v15 = IMSharedDowntimeController((uint64_t)v26, v12, v13, v14);
    uint64_t v18 = objc_msgSend_allowedToShowAppExtensionWithBundleIdentifier_(v15, v16, (uint64_t)v26, v17);
    objc_msgSend_setAllowedByScreenTime_(self, v19, v18, v20);
  }
  else
  {
    objc_msgSend_setAllowedByScreenTime_(self, v12, 1, v14);
  }
  uint64_t v24 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v21, v22, v23);
  objc_msgSend___mainThreadPostNotificationName_object_(v24, v25, @"com.apple.messages.IMBalloonPluginDataSourceScreenTimeAllowedStateChanged", (uint64_t)self);
}

- (NSArray)allPayloads
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_payload(self, a2, v2, v3);
  v9 = objc_msgSend_consumedPayloads(self, v6, v7, v8);
  uint64_t v10 = v9;
  if (!v5)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      uint64_t v17 = v9;
    }
    id v16 = v17;
    goto LABEL_7;
  }

  if (v10)
  {
    uint64_t v10 = objc_msgSend_consumedPayloads(self, v11, v12, v13);
    objc_msgSend_arrayByAddingObject_(v10, v14, (uint64_t)v5, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    uint64_t v18 = v16;

    goto LABEL_9;
  }
  v20[0] = v5;
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v20, 1);
LABEL_9:

  return (NSArray *)v18;
}

- (NSString)messageGUID
{
  return (NSString *)objc_msgSend_messageGUID(self->_pluginPayload, a2, v2, v3);
}

- (NSString)sessionGUID
{
  return (NSString *)objc_msgSend_pluginSessionGUID(self->_pluginPayload, a2, v2, v3);
}

- (NSString)_imMessageGUID
{
  imMessageGUID = self->__imMessageGUID;
  if (!imMessageGUID)
  {
    uint64_t v6 = objc_msgSend_messageGUID(self, a2, v2, v3);
    if (objc_msgSend_containsString_(v6, v7, @":", v8))
    {
      uint64_t v11 = objc_msgSend_componentsSeparatedByString_(v6, v9, @":", v10);
      uint64_t v15 = objc_msgSend_firstObject(v11, v12, v13, v14);

      if (v15)
      {
        id v16 = v15;

        uint64_t v6 = v16;
      }
    }
    uint64_t v17 = self->__imMessageGUID;
    self->__imMessageGUID = (NSString *)v6;

    imMessageGUID = self->__imMessageGUID;
  }

  return imMessageGUID;
}

- (NSData)payload
{
  return (NSData *)objc_msgSend_data(self->_pluginPayload, a2, v2, v3);
}

- (void)setPayload:(id)a3
{
  objc_msgSend_setData_(self->_pluginPayload, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](self, sel__dataSourceDidChange, v5, v6);
}

- (void)setPayload:(id)a3 attachments:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = NSNumber;
      uint64_t v15 = objc_msgSend_length(v6, v11, v12, v13);
      uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v14, v16, v15, v17);
      uint64_t v19 = NSNumber;
      uint64_t v23 = objc_msgSend_count(v7, v20, v21, v22);
      id v26 = objc_msgSend_numberWithUnsignedInteger_(v19, v24, v23, v25);
      int v29 = 138412802;
      v30 = self;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "self:%@ set payload length %@ attachments count %@", (uint8_t *)&v29, 0x20u);
    }
  }
  objc_msgSend_setPendingAttachmentData_(self, v8, (uint64_t)v7, v9);
  objc_msgSend_setPayload_(self, v27, (uint64_t)v6, v28);
}

- (NSData)messagePayloadDataForSending
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = NSNumber;
      uint64_t v11 = objc_msgSend_payload(self, v7, v8, v9);
      uint64_t v15 = objc_msgSend_length(v11, v12, v13, v14);
      uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v10, v16, v15, v17);
      uint64_t v19 = NSNumber;
      uint64_t v23 = objc_msgSend_pendingAttachmentData(self, v20, v21, v22);
      uint64_t v27 = objc_msgSend_count(v23, v24, v25, v26);
      v30 = objc_msgSend_numberWithUnsignedInteger_(v19, v28, v27, v29);
      int v46 = 138412802;
      uint64_t v47 = self;
      __int16 v48 = 2112;
      v49 = v18;
      __int16 v50 = 2112;
      v51 = v30;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "messagePayloadDataForSending self:%@ payload length %@ attachments count %@", (uint8_t *)&v46, 0x20u);
    }
  }
  __int16 v31 = objc_msgSend_pendingAttachmentData(self, v3, v4, v5);
  BOOL v35 = objc_msgSend_count(v31, v32, v33, v34) == 0;

  uint64_t v42 = objc_msgSend_payload(self, v36, v37, v38);
  if (!v35)
  {
    uint64_t v43 = objc_msgSend_pendingAttachmentData(self, v39, v40, v41);
    uint64_t v44 = IMSharedHelperCombinedPluginPayloadDictionaryData();

    uint64_t v42 = (void *)v44;
  }

  return (NSData *)v42;
}

- (IMMessage)imMessage
{
  uint64_t v5 = objc_msgSend_chat(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__imMessageGUID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_messageForGUID_(v5, v10, (uint64_t)v9, v11);

  return (IMMessage *)v12;
}

- (IMChat)chat
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  chat = self->_chat;
  if (!chat)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = objc_msgSend_sharedRegistryIfAvailable(IMChatRegistry, a2, v2, v3, 0);
    uint64_t v10 = objc_msgSend__imMessageGUID(self, v7, v8, v9);
    uint64_t v13 = objc_msgSend__cachedChatsWithMessageGUID_(v6, v11, (uint64_t)v10, v12);

    uint64_t v18 = (IMChat *)objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v28, (uint64_t)v32, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v18; i = (IMChat *)((char *)i + 1))
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend__imMessageGUID(self, v15, v16, v17);
          uint64_t v25 = objc_msgSend_messageForGUID_(v21, v23, (uint64_t)v22, v24);

          if (v25)
          {
            uint64_t v18 = v21;
            goto LABEL_12;
          }
        }
        uint64_t v18 = (IMChat *)objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    uint64_t v26 = self->_chat;
    self->_chat = v18;

    chat = self->_chat;
  }

  return chat;
}

- (void)sendPayload:(id)a3
{
}

- (void)sendPayload:(id)a3 attachments:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v64 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = NSNumber;
      uint64_t v15 = objc_msgSend_length(v6, v11, v12, v13);
      uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v14, v16, v15, v17);
      uint64_t v19 = NSNumber;
      uint64_t v23 = objc_msgSend_count(v64, v20, v21, v22);
      uint64_t v26 = objc_msgSend_numberWithUnsignedInteger_(v19, v24, v23, v25);
      *(_DWORD *)buf = 138412802;
      uint64_t v71 = self;
      __int16 v72 = 2112;
      v73 = v18;
      __int16 v74 = 2112;
      uint64_t v75 = v26;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "self %@ sendPayload %@ attachments %@", buf, 0x20u);
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v27 = objc_msgSend_sharedRegistryIfAvailable(IMChatRegistry, v7, v8, v9);
  long long v31 = objc_msgSend__imMessageGUID(self, v28, v29, v30);
  uint64_t v34 = objc_msgSend__cachedChatsWithMessageGUID_(v27, v32, (uint64_t)v31, v33);

  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v65, (uint64_t)v69, 16);
  if (v39)
  {
    uint64_t v40 = *(void *)v66;
    uint64_t v41 = (uint64_t *)MEMORY[0x1E4F6E0C0];
    while (2)
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v66 != v40) {
          objc_enumerationMutation(v34);
        }
        uint64_t v43 = objc_msgSend_account(*(void **)(*((void *)&v65 + 1) + 8 * v42), v36, v37, v38);
        uint64_t v47 = objc_msgSend_service(v43, v44, v45, v46);
        char v50 = objc_msgSend_supportsCapability_(v47, v48, *v41, v49);

        if ((v50 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v63 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4AF7000, v63, OS_LOG_TYPE_INFO, "Bailing, chat wasn't iMessage", buf, 2u);
            }
          }
          objc_msgSend_updatePayload_attachments_(self, v62, (uint64_t)v6, (uint64_t)v64);
          goto LABEL_21;
        }
        ++v42;
      }
      while (v39 != v42);
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v65, (uint64_t)v69, 16);
      if (v39) {
        continue;
      }
      break;
    }
  }

  if (v6 && objc_msgSend_length(v6, v51, v52, v53))
  {
    uint64_t v34 = objc_msgSend_sharedInstance(IMDaemonController, v54, v55, v56);
    id v60 = objc_msgSend_messageGUID(self, v57, v58, v59);
    objc_msgSend_sendBalloonPayload_attachments_withMessageGUID_bundleID_(v34, v61, (uint64_t)v6, (uint64_t)v64, v60, self->_bundleID);

LABEL_21:
  }
}

- (void)updatePayloadForShelfAnimation:(id)a3
{
  uint64_t v5 = objc_msgSend__updateWithPluginPayload_messageID_messageGUID_(self, a2, (uint64_t)a3, 0, 0) | 0xB;

  objc_msgSend_pluginPayloadDidChange_(self, v4, v5, v6);
}

- (void)updatePayload:(id)a3
{
}

- (void)updatePayload:(id)a3 attachments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_messageGUID(self, v11, v12, v13);
  objc_msgSend_updateBalloonPayload_attachments_forMessageGUID_(v16, v15, (uint64_t)v7, (uint64_t)v6, v14);
}

- (void)_updatePayload:(id)a3 messageID:(int64_t)a4 messageGUID:(id)a5
{
  uint64_t v6 = objc_msgSend__updateWithPluginPayload_messageID_messageGUID_(self, a2, (uint64_t)a3, a4, a5);
  if (v6)
  {
    char v9 = v6;
    objc_msgSend_pluginPayloadDidChange_(self, v7, v6, v8);
    if (v9)
    {
      MEMORY[0x1F4181798](self, sel_payloadDidChange, v10, v11);
    }
  }
}

- (BOOL)_senderIsSameBetweenPayload:(id)a3 andOtherPayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sender(v5, v7, v8, v9);
  if (v10)
  {
  }
  else
  {
    uint64_t v17 = objc_msgSend_sender(v6, v11, v12, v13);

    if (!v17)
    {
      LOBYTE(v21) = 1;
      goto LABEL_9;
    }
  }
  uint64_t v21 = objc_msgSend_sender(v5, v14, v15, v16);
  if (v21)
  {
    uint64_t v22 = objc_msgSend_sender(v6, v18, v19, v20);

    if (v22)
    {
      uint64_t v26 = objc_msgSend_sender(v5, v23, v24, v25);
      uint64_t v30 = objc_msgSend_sender(v6, v27, v28, v29);
      LOBYTE(v21) = objc_msgSend_isEqualToString_(v26, v31, (uint64_t)v30, v32);
    }
    else
    {
      LOBYTE(v21) = 0;
    }
  }
LABEL_9:

  return (char)v21;
}

- (void)_updateTemporaryAttachmentURLsForPluginPayload
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  if (!self->_temporaryAttachmentURLs)
  {
    uint64_t v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    temporaryAttachmentURLs = self->_temporaryAttachmentURLs;
    self->_temporaryAttachmentURLs = v4;
  }
  v99 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  uint64_t v9 = objc_msgSend_pluginPayload(self, v6, v7, v8);
  objc_msgSend_attachments(v9, v10, v11, v12);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v102, (uint64_t)v112, 16);
  if (v14)
  {
    uint64_t v16 = *(void *)v103;
    *(void *)&long long v15 = 138412802;
    long long v96 = v15;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v103 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v18;
          uint64_t v25 = objc_msgSend_path(v21, v22, v23, v24);
          uint64_t v26 = IMSafeTemporaryDirectory();
          uint64_t v30 = objc_msgSend_path(v26, v27, v28, v29);
          char hasPrefix = objc_msgSend_hasPrefix_(v25, v31, (uint64_t)v30, v32);

          if (hasPrefix)
          {
            uint64_t v36 = IMSafeTemporaryDirectory();
            uint64_t v40 = objc_msgSend_path(v36, v37, v38, v39);
            uint64_t v44 = objc_msgSend_stringGUID(NSString, v41, v42, v43);
            uint64_t v47 = objc_msgSend_stringByAppendingPathComponent_(v40, v45, (uint64_t)v44, v46);

            v51 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v48, v49, v50);
            id v101 = 0;
            LODWORD(v36) = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v51, v52, (uint64_t)v47, 1, 0, &v101);
            id v53 = v101;

            if (v36)
            {
              v57 = (void *)MEMORY[0x1E4F1CB10];
              uint64_t v58 = objc_msgSend_path(v21, v54, v55, v56);
              uint64_t v62 = objc_msgSend_lastPathComponent(v58, v59, v60, v61);
              long long v65 = objc_msgSend_stringByAppendingPathComponent_(v47, v63, (uint64_t)v62, v64);
              long long v68 = objc_msgSend_fileURLWithPath_(v57, v66, (uint64_t)v65, v67);

              __int16 v72 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v69, v70, v71);
              id v100 = 0;
              LODWORD(v65) = objc_msgSend_copyItemAtURL_toURL_error_(v72, v73, (uint64_t)v21, (uint64_t)v68, &v100);
              id v74 = v100;

              if (v65)
              {
                objc_msgSend_addObject_(v99, v75, (uint64_t)v68, v76);
                v80 = objc_msgSend_temporaryAttachmentURLs(self, v77, v78, v79);
                objc_msgSend_addObject_(v80, v81, (uint64_t)v68, v82);
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  v89 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v96;
                    id v107 = v21;
                    __int16 v108 = 2112;
                    id v109 = v68;
                    __int16 v110 = 2112;
                    id v111 = v74;
                    _os_log_impl(&dword_1A4AF7000, v89, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource failed to link temporary file URL %@ to %@ (error: %@)", buf, 0x20u);
                  }
                }
                objc_msgSend_addObject_(v99, v87, (uint64_t)v21, v88, v96);
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v86 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v107 = v47;
                  __int16 v108 = 2112;
                  id v109 = v53;
                  _os_log_impl(&dword_1A4AF7000, v86, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource failed to create temporary directory at %@ (error: %@)", buf, 0x16u);
                }
              }
              objc_msgSend_addObject_(v99, v84, (uint64_t)v21, v85, v96);
            }
          }
          else
          {
            objc_msgSend_addObject_(v99, v34, (uint64_t)v21, v35);
          }
        }
        else
        {
          objc_msgSend_addObject_(v99, v19, (uint64_t)v18, v20);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v83, (uint64_t)&v102, (uint64_t)v112, 16);
    }
    while (v14);
  }

  v93 = objc_msgSend_pluginPayload(self, v90, v91, v92);
  objc_msgSend_setAttachments_(v93, v94, (uint64_t)v99, v95);
}

- (void)_removeTemporaryAttachmentURLs
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_temporaryAttachmentURLs(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);

  if (v8)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v12 = objc_msgSend_pluginPayload(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_attachments(v12, v13, v14, v15);

    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v59, (uint64_t)v67, 16);
    if (!v18) {
      goto LABEL_23;
    }
    uint64_t v19 = *(void *)v60;
    while (1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v21;
          uint64_t v27 = objc_msgSend_temporaryAttachmentURLs(self, v24, v25, v26);
          int v30 = objc_msgSend_containsObject_(v27, v28, (uint64_t)v23, v29);

          if (v30)
          {
            uint64_t v34 = objc_msgSend_path(v23, v31, v32, v33);
            uint64_t v35 = IMSafeTemporaryDirectory();
            uint64_t v39 = objc_msgSend_path(v35, v36, v37, v38);
            int hasPrefix = objc_msgSend_hasPrefix_(v34, v40, (uint64_t)v39, v41);

            if (hasPrefix)
            {
              uint64_t v46 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v43, v44, v45);
              uint64_t v50 = objc_msgSend_path(v23, v47, v48, v49);
              id v58 = 0;
              char v52 = objc_msgSend_removeItemAtPath_error_(v46, v51, (uint64_t)v50, (uint64_t)&v58);
              id v53 = v58;

              if ((v52 & 1) == 0 && IMOSLoggingEnabled())
              {
                uint64_t v54 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v64 = v23;
                  __int16 v65 = 2112;
                  long long v66 = v53;
                  _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource failed to remove temporary file URL %@ (error: %@)", buf, 0x16u);
                }
              }
              goto LABEL_19;
            }
            if (IMOSLoggingEnabled())
            {
              id v53 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v64 = v23;
                _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource NOT removing non-temporary file URL %@", buf, 0xCu);
              }
LABEL_19:
            }
          }

          continue;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v22, (uint64_t)&v59, (uint64_t)v67, 16);
      if (!v18)
      {
LABEL_23:

        objc_msgSend_setTemporaryAttachmentURLs_(self, v55, 0, v56);
        return;
      }
    }
  }
}

- (unint64_t)_updateWithPluginPayload:(id)a3 messageID:(int64_t)a4 messageGUID:(id)a5
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v226 = (__CFString *)a5;
  uint64_t v12 = objc_msgSend_bundleID(self, v9, v10, v11);
  uint64_t v13 = *MEMORY[0x1E4F6CBA0];
  if (objc_msgSend_isEqualToString_(v12, v14, *MEMORY[0x1E4F6CBA0], v15))
  {
    if (!v8 || !a4)
    {

      goto LABEL_14;
    }
    int64_t MessageInSession = objc_msgSend_messageIDOfLastMessageInSession(self, v16, v17, v18);

    if (MessageInSession > a4) {
      goto LABEL_14;
    }
  }
  else
  {

    if (!v8) {
      goto LABEL_14;
    }
  }
  if (a4 < 1)
  {
LABEL_10:
    v227 = objc_msgSend_pluginPayload(self, v20, v21, v22);
    uint64_t v26 = objc_msgSend_copy(v227, v23, v24, v25);
    int v30 = objc_msgSend_messageGUID(v8, v27, v28, v29);
    objc_msgSend_setMessageGUID_(v26, v31, (uint64_t)v30, v32);

    uint64_t v36 = objc_msgSend_pluginSessionGUID(v8, v33, v34, v35);
    objc_msgSend_setPluginSessionGUID_(v26, v37, (uint64_t)v36, v38);

    uint64_t shouldExpire = objc_msgSend_shouldExpire(v8, v39, v40, v41);
    objc_msgSend_setShouldExpire_(v26, v43, shouldExpire, v44);
    if (objc_msgSend__senderIsSameBetweenPayload_andOtherPayload_(self, v45, (uint64_t)v8, (uint64_t)v26)
      && (int v49 = objc_msgSend_isFromMe(v8, v46, v47, v48), v49 == objc_msgSend_isFromMe(v26, v50, v51, v52)))
    {
      unint64_t v62 = 0;
    }
    else
    {
      id v53 = objc_msgSend_sender(v8, v46, v47, v48);
      objc_msgSend_setSender_(v26, v54, (uint64_t)v53, v55);

      uint64_t v59 = objc_msgSend_isFromMe(v8, v56, v57, v58);
      objc_msgSend_setIsFromMe_(v26, v60, v59, v61);
      unint64_t v62 = 8;
    }
    uint64_t v63 = objc_msgSend_attachments(v8, v46, v47, v48);
    if (objc_msgSend_count(v63, v64, v65, v66))
    {
      BOOL v70 = 1;
    }
    else
    {
      uint64_t v71 = objc_msgSend_attachments(v8, v67, v68, v69);
      uint64_t v75 = objc_msgSend_count(v71, v72, v73, v74);
      uint64_t v79 = objc_msgSend_attachments(v227, v76, v77, v78);
      BOOL v70 = v75 != objc_msgSend_count(v79, v80, v81, v82);
    }
    int isEqualAttachmentFileURLsToPluginPayload = objc_msgSend_isEqualAttachmentFileURLsToPluginPayload_(v227, v83, (uint64_t)v8, v84);
    if (IMOSLoggingEnabled())
    {
      v89 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        uint64_t v90 = @"NO";
        if (v70) {
          uint64_t v91 = @"YES";
        }
        else {
          uint64_t v91 = @"NO";
        }
        if (!isEqualAttachmentFileURLsToPluginPayload) {
          uint64_t v90 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v229 = v91;
        __int16 v230 = 2112;
        v231 = v90;
        _os_log_impl(&dword_1A4AF7000, v89, OS_LOG_TYPE_INFO, "payloadAttachmentCountChanged %@ needsPayloadAttachmentUpdate %@", buf, 0x16u);
      }
    }
    if (((!v70 | isEqualAttachmentFileURLsToPluginPayload) & 1) == 0)
    {
      uint64_t v92 = objc_msgSend_bundleID(self, v86, v87, v88);
      unsigned __int8 isEqualToString = objc_msgSend_isEqualToString_(v92, v93, v13, v94);

      if (((a4 > 0) & isEqualToString) != 0) {
        objc_msgSend__removeTemporaryAttachmentURLs(self, v96, v97, v98);
      }
      v99 = objc_msgSend_attachments(v8, v96, v97, v98);
      if (objc_msgSend_count(v99, v100, v101, v102))
      {
        id v106 = objc_msgSend_attachments(v8, v103, v104, v105);
      }
      else
      {
        id v106 = 0;
      }

      __int16 v110 = objc_msgSend_fileTransferGUIDs(v8, v107, v108, v109);
      if (objc_msgSend_count(v110, v111, v112, v113))
      {
        v117 = objc_msgSend_fileTransferGUIDs(v8, v114, v115, v116);
      }
      else
      {
        v117 = 0;
      }

      objc_msgSend_setAttachments_(v26, v118, (uint64_t)v106, v119);
      objc_msgSend_setFileTransferGUIDs_(v26, v120, (uint64_t)v117, v121);

      v62 |= 2uLL;
    }
    v122 = objc_msgSend_data(v227, v86, v87, v88);
    v126 = objc_msgSend_data(v8, v123, v124, v125);
    char isEqualToData = objc_msgSend_isEqualToData_(v122, v127, (uint64_t)v126, v128);

    if ((isEqualToData & 1) == 0)
    {
      objc_msgSend_consumedSessionPayloads(v8, v130, v131, v132);
      v133 = (NSArray *)objc_claimAutoreleasedReturnValue();
      consumedPayloads = self->_consumedPayloads;
      self->_consumedPayloads = v133;

      v138 = objc_msgSend_data(v8, v135, v136, v137);
      objc_msgSend_setData_(v26, v139, (uint64_t)v138, v140);

      v62 |= 1uLL;
    }
    if (!objc_msgSend_supportsCollaboration(v227, v130, v131, v132)
      || !objc_msgSend_supportsCollaboration(v8, v141, v142, v143))
    {
      goto LABEL_57;
    }
    v144 = objc_msgSend_collaborationMetadata(v227, v141, v142, v143);
    v148 = objc_msgSend_collaborationMetadata(v8, v145, v146, v147);
    if (objc_msgSend_isEqual_(v144, v149, (uint64_t)v148, v150))
    {
    }
    else
    {
      v154 = objc_msgSend_collaborationMetadata(v8, v151, v152, v153);
      BOOL v155 = v154 == 0;

      if (v155) {
        goto LABEL_47;
      }
      v144 = objc_msgSend_collaborationMetadata(v8, v156, v157, v158);
      objc_msgSend_setCollaborationMetadata_(v26, v159, (uint64_t)v144, v160);
    }

LABEL_47:
    v161 = objc_msgSend_datasource(v227, v156, v157, v158);
    v165 = objc_msgSend_datasource(v8, v162, v163, v164);
    if (objc_msgSend_isEqual_(v161, v166, (uint64_t)v165, v167))
    {
    }
    else
    {
      v171 = objc_msgSend_datasource(v8, v168, v169, v170);
      BOOL v172 = v171 == 0;

      if (v172)
      {
LABEL_52:
        v178 = objc_msgSend_collaborationOptionsSummary(v227, v173, v174, v175);
        v182 = objc_msgSend_collaborationOptionsSummary(v8, v179, v180, v181);
        if (objc_msgSend_isEqual_(v178, v183, (uint64_t)v182, v184))
        {
        }
        else
        {
          v188 = objc_msgSend_collaborationOptionsSummary(v8, v185, v186, v187);
          BOOL v189 = v188 == 0;

          if (v189) {
            goto LABEL_57;
          }
          v178 = objc_msgSend_collaborationOptionsSummary(v8, v141, v142, v143);
          objc_msgSend_setCollaborationOptionsSummary_(v26, v190, (uint64_t)v178, v191);
        }

LABEL_57:
        int isPlayed = objc_msgSend_isPlayed(v227, v141, v142, v143);
        if (isPlayed == objc_msgSend_isPlayed(v8, v193, v194, v195))
        {
          if (!v62)
          {
LABEL_70:

            goto LABEL_71;
          }
        }
        else
        {
          uint64_t v199 = objc_msgSend_isPlayed(v8, v196, v197, v198);
          objc_msgSend_setIsPlayed_(v26, v200, v199, v201);
          v62 |= 4uLL;
        }
        objc_msgSend_setPluginPayload_(self, v196, (uint64_t)v26, v198);
        if (IMOSLoggingEnabled())
        {
          v202 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_numberWithLongLong_(NSNumber, v203, a4, v204);
            v225 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v207 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v205, v62, v206);
            objc_msgSend_sender(v227, v208, v209, v210);
            id v211 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isFromMe(v227, v212, v213, v214)) {
              v218 = @"YES";
            }
            else {
              v218 = @"NO";
            }
            objc_msgSend_sender(v26, v215, v216, v217);
            id v219 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isFromMe(v26, v220, v221, v222)) {
              v223 = @"YES";
            }
            else {
              v223 = @"NO";
            }
            *(_DWORD *)buf = 138413826;
            v229 = v226;
            __int16 v230 = 2112;
            v231 = v225;
            __int16 v232 = 2112;
            v233 = v207;
            __int16 v234 = 2112;
            id v235 = v211;
            __int16 v236 = 2112;
            v237 = v218;
            __int16 v238 = 2112;
            id v239 = v219;
            __int16 v240 = 2112;
            v241 = v223;
            _os_log_impl(&dword_1A4AF7000, v202, OS_LOG_TYPE_INFO, "after update messageGUID %@ messageID %@ updateFlags %@ old payload sender %@ old payload isFromMe %@ new sender %@ new isFromMe %@", buf, 0x48u);
          }
        }
        goto LABEL_70;
      }
      v161 = objc_msgSend_datasource(v8, v173, v174, v175);
      objc_msgSend_setDatasource_(v26, v176, (uint64_t)v161, v177);
    }

    goto LABEL_52;
  }
  if (objc_msgSend_messageIDOfLastMessageInSession(self, v20, v21, v22) <= a4)
  {
    self->_messageIDOfLastint64_t MessageInSession = a4;
    objc_storeStrong((id *)&self->_guidOfLastMessageInSession, a5);
    goto LABEL_10;
  }
LABEL_14:
  unint64_t v62 = 0;
LABEL_71:

  return v62;
}

- (void)setPluginPayload:(id)a3
{
  id v5 = (const char *)a3;
  pluginPayload = self->_pluginPayload;
  if (pluginPayload != (IMPluginPayload *)v5)
  {
    uint64_t v11 = v5;
    objc_msgSend_setDatasource_(pluginPayload, v5, 0, v6);
    objc_storeStrong((id *)&self->_pluginPayload, a3);
    objc_msgSend_setDatasource_(self->_pluginPayload, v8, (uint64_t)self, v9);
    imMessageGUID = self->__imMessageGUID;
    self->__imMessageGUID = 0;

    id v5 = v11;
  }

  MEMORY[0x1F41817F8](pluginPayload, v5);
}

- (BOOL)isFromMe
{
  uint64_t v4 = objc_msgSend_pluginPayload(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isPlayed
{
  uint64_t v4 = objc_msgSend_pluginPayload(self, a2, v2, v3);
  char isPlayed = objc_msgSend_isPlayed(v4, v5, v6, v7);

  return isPlayed;
}

- (void)pluginPayloadDidChange:(unint64_t)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (id)objc_opt_class();
      objc_msgSend_messageGUID(self, v7, v8, v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleID(self, v11, v12, v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = objc_msgSend_payload(self, v15, v16, v17);
      uint64_t v22 = objc_msgSend_length(v18, v19, v20, v21);
      uint64_t v26 = objc_msgSend_pluginPayload(self, v23, v24, v25);
      int v30 = objc_msgSend_attachments(v26, v27, v28, v29);
      int v34 = 138413570;
      id v35 = v6;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      id v39 = v14;
      __int16 v40 = 2048;
      uint64_t v41 = v22;
      __int16 v42 = 2048;
      uint64_t v43 = objc_msgSend_count(v30, v31, v32, v33);
      __int16 v44 = 2048;
      unint64_t v45 = a3;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "pluginPayloadDidChange %@(message guid: %@, bundle id: %@) updated: %tu byte payload, %tu attachments (change flags: %tu)", (uint8_t *)&v34, 0x3Eu);
    }
  }
}

- (void)thumbnailURLWithSize:(CGSize)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, CGSize, __n128))a4 + 2))(a4, 0, a3, *(__n128 *)&a3.height);
  }
}

- (void)payloadWillSendFromShelf
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "payloadWillSendFromShelf: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)wantsStatusItem
{
  return 0;
}

- (NSString)statusString
{
  return 0;
}

- (NSAttributedString)statusAttributedString
{
  return 0;
}

- (BOOL)wantsReplyFromContentView
{
  return 0;
}

- (void)statusStringNeedsUpdate
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_sharedRegistryIfAvailable(IMChatRegistry, a2, v2, v3);
  uint64_t v9 = objc_msgSend__imMessageGUID(self, v6, v7, v8);
  unint64_t v45 = objc_msgSend__cachedChatsWithMessageGUID_(v5, v10, (uint64_t)v9, v11);

  uint64_t v12 = v45;
  if (objc_msgSend_count(v45, v13, v14, v15))
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v16 = v45;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v46, (uint64_t)v52, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v29 = objc_msgSend__imMessageGUID(self, v26, v27, v28);
              *(_DWORD *)buf = 138412290;
              uint64_t v51 = v29;
              _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Updating status message for guid: %@", buf, 0xCu);
            }
          }
          int v30 = objc_msgSend__imMessageGUID(self, v22, v23, v24);
          uint64_t v33 = objc_msgSend_messageForGUID_(v21, v31, (uint64_t)v30, v32);

          id v37 = objc_msgSend__imMessageItem(v33, v34, v35, v36);
          objc_msgSend__handleIncomingItem_updateRecipient_(v21, v38, (uint64_t)v37, 0);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v39, (uint64_t)&v46, (uint64_t)v52, 16);
      }
      while (v18);
    }

LABEL_18:
    uint64_t v12 = v45;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      __int16 v44 = objc_msgSend__imMessageGUID(self, v41, v42, v43);
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v44;
      _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "No chat found for message guid: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)supportsDynamicSize
{
  return 0;
}

- (void)needsResize
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  objc_msgSend_setHasInvalidatedSize_(self, a2, 1, v2);
  uint64_t v7 = objc_msgSend_sharedRegistryIfAvailable(IMChatRegistry, v4, v5, v6);
  uint64_t v11 = objc_msgSend__imMessageGUID(self, v8, v9, v10);
  uint64_t v90 = objc_msgSend__cachedChatsWithMessageGUID_(v7, v12, (uint64_t)v11, v13);

  if (objc_msgSend_count(v90, v14, v15, v16))
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = v90;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v94, (uint64_t)v102, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v95 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v29 = objc_msgSend__imMessageGUID(self, v26, v27, v28);
              *(_DWORD *)buf = 138412290;
              uint64_t v101 = v29;
              _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Updating balloon size for guid: %@", buf, 0xCu);
            }
          }
          int v30 = objc_msgSend_inlineReplyController(v21, v22, v23, v24);
          BOOL v31 = v30 == 0;

          if (v31)
          {
            uint64_t v59 = objc_msgSend__imMessageGUID(self, v32, v33, v34);
            unint64_t v62 = objc_msgSend_messageForGUID_(v21, v60, (uint64_t)v59, v61);
            uint64_t v35 = objc_msgSend__imMessageItem(v62, v63, v64, v65);

            objc_msgSend__handleIncomingItem_updateRecipient_suppressNotification_updateReplyCounts_(v21, v66, (uint64_t)v35, 0, 0, 0);
          }
          else
          {
            uint64_t v35 = objc_msgSend_inlineReplyController(v21, v32, v33, v34);
            id v39 = objc_msgSend__imMessageGUID(self, v36, v37, v38);
            uint64_t v42 = objc_msgSend__itemForGUID_(v35, v40, (uint64_t)v39, v41);

            long long v46 = objc_msgSend__imMessageGUID(self, v43, v44, v45);
            long long v49 = objc_msgSend_messageForGUID_(v21, v47, (uint64_t)v46, v48);
            uint64_t v53 = objc_msgSend__imMessageItem(v49, v50, v51, v52);

            v92[0] = MEMORY[0x1E4F143A8];
            v92[1] = 3221225472;
            v92[2] = sub_1A4B471A0;
            v92[3] = &unk_1E5B7B130;
            v92[4] = v21;
            id v93 = v53;
            id v54 = v53;
            objc_msgSend_performActionDisallowingItemInsert_(v35, v55, (uint64_t)v92, v56);
            objc_msgSend_insertItem_(v35, v57, (uint64_t)v42, v58);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v67, (uint64_t)&v94, (uint64_t)v102, 16);
      }
      while (v18);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v71 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        uint64_t v75 = objc_msgSend__imMessageGUID(self, v72, v73, v74);
        *(_DWORD *)buf = 138412290;
        uint64_t v101 = v75;
        _os_log_impl(&dword_1A4AF7000, v71, OS_LOG_TYPE_INFO, "No chat found for message guid: %@", buf, 0xCu);
      }
    }
    uint64_t v76 = objc_msgSend_stagingContext(self, v68, v69, v70);
    v80 = objc_msgSend_transientIdentifier(v76, v77, v78, v79);

    if (v80)
    {
      uint64_t v98 = @"__kIMPluginDataSourceTransientIdentifierKey";
      v99 = v80;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v81, (uint64_t)&v99, (uint64_t)&v98, 1);
      id obj = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id obj = (id)MEMORY[0x1E4F1CC08];
    }
    uint64_t v84 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v81, v82, v83);
    uint64_t v88 = objc_msgSend__imMessageGUID(self, v85, v86, v87);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v84, v89, @"__kIMPayloadNeedsResizing", (uint64_t)v88, obj);
  }
}

- (void)markAsPlayed
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_allowedByScreenTime(self, a2, v2, v3)
    && (objc_msgSend_isPlayed(self, v5, v6, v7) & 1) == 0)
  {
    uint64_t v11 = objc_msgSend_bundleID(self, v8, v9, v10);
    int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x1E4F6CBA0], v13);

    if (isEqualToString)
    {
      uint64_t v21 = objc_msgSend__imMessageGUID(self, v15, v16, v17);
    }
    else
    {
      uint64_t v21 = objc_msgSend_guidOfLastMessageInSession(self, v15, v16, v17);
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v56 = v21;
          _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Marking message %@ as played for App Message", buf, 0xCu);
        }
      }
    }
    uint64_t v23 = objc_msgSend_sharedRegistryIfAvailable(IMChatRegistry, v18, v19, v20);
    long long v49 = objc_msgSend__cachedChatsWithMessageGUID_(v23, v24, (uint64_t)v21, v25);

    if (objc_msgSend_count(v49, v26, v27, v28))
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v29 = v49;
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v50, (uint64_t)v54, 16);
      if (v31)
      {
        uint64_t v32 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              uint64_t v37 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v56 = v21;
                _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "marking message as played guid: %@", buf, 0xCu);
              }
            }
            uint64_t v38 = objc_msgSend_messageForGUID_(v34, v35, (uint64_t)v21, v36);
            uint64_t v42 = v38;
            if (v38)
            {
              uint64_t v43 = objc_msgSend__imMessageItem(v38, v39, v40, v41);
              objc_msgSend__markItemAsPlayed_(v34, v44, (uint64_t)v43, v45);

              if (IMOSLoggingEnabled())
              {
                long long v46 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v56 = v21;
                  _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "Did mark message as played guid: %@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v47, (uint64_t)&v50, (uint64_t)v54, 16);
        }
        while (v31);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v56 = v21;
        _os_log_impl(&dword_1A4AF7000, v48, OS_LOG_TYPE_INFO, "No chat found for message guid to mark as played: %@", buf, 0xCu);
      }
    }
  }
}

+ (BOOL)supportsURL:(id)a3
{
  return 0;
}

- (unint64_t)playbackType
{
  return 0;
}

- (void)playbackWithCompletionBlock:(id)a3
{
  uint64_t v9 = (uint64_t (**)(id, void))a3;
  uint64_t v7 = objc_msgSend_playbackType(self, v4, v5, v6);
  uint64_t v8 = v9;
  if (v9 && !v7)
  {
    uint64_t v7 = v9[2](v9, 0);
    uint64_t v8 = v9;
  }

  MEMORY[0x1F41817F8](v7, v8);
}

+ (id)unlocalizedPreviewSummaryForPluginBundle:(id)a3 pluginDisplayName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x1E4F6CBD8], v8))
  {
    uint64_t v11 = @"a Handwritten Message";
  }
  else if ((objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x1E4F6CBF8], v10) & 1) != 0 {
         || (IMBalloonExtensionIDWithSuffix(),
  }
             uint64_t v12 = objc_claimAutoreleasedReturnValue(),
             char isEqualToString = objc_msgSend_isEqualToString_(v5, v13, (uint64_t)v12, v14),
             v12,
             (isEqualToString & 1) != 0))
  {
    uint64_t v11 = @"a Photo Message";
  }
  else if (objc_msgSend_isEqualToString_(v5, v16, *MEMORY[0x1E4F6CBA0], v17))
  {
    uint64_t v11 = @"a Digital Touch Message";
  }
  else
  {
    uint64_t v22 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v19, v20, v21);
    uint64_t v25 = objc_msgSend_balloonPluginForBundleID_(v22, v23, (uint64_t)v5, v24);

    id v29 = objc_msgSend_identifier(v25, v26, v27, v28);
    if (objc_msgSend_isEqualToString_(v29, v30, (uint64_t)v5, v31))
    {
      objc_msgSend_browserDisplayName(v25, v32, v33, v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v35 = v6;
    }
    uint64_t v36 = v35;

    if (objc_msgSend_length(v36, v37, v38, v39))
    {
      objc_msgSend_stringWithFormat_(NSString, v40, @"1 %@ Message", v41, v36);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

+ (id)previewSummaryForPluginBundle:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v4, v5, v6);
  uint64_t v10 = objc_msgSend_dataSourceClassForBundleID_(v7, v8, (uint64_t)v3, v9);

  uint64_t v16 = objc_msgSend_previewSummary(v10, v11, v12, v13);
  if (!v16)
  {
    if (objc_msgSend_isEqualToString_(v3, v14, *MEMORY[0x1E4F6CBD8], v15))
    {
      uint64_t v19 = sub_1A4C0ACE4();
      objc_msgSend_localizedStringForKey_value_table_(v19, v20, @"Handwritten Message", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    }
    else if ((objc_msgSend_isEqualToString_(v3, v17, *MEMORY[0x1E4F6CBF8], v18) & 1) != 0 {
           || (IMBalloonExtensionIDWithSuffix(),
    }
               uint64_t v21 = objc_claimAutoreleasedReturnValue(),
               int v24 = objc_msgSend_isEqualToString_(v3, v22, (uint64_t)v21, v23),
               v21,
               v24))
    {
      uint64_t v19 = sub_1A4C0ACE4();
      objc_msgSend_localizedStringForKey_value_table_(v19, v27, @"Photo Message", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    }
    else if (objc_msgSend_isEqualToString_(v3, v25, *MEMORY[0x1E4F6CBA0], v26))
    {
      uint64_t v19 = sub_1A4C0ACE4();
      objc_msgSend_localizedStringForKey_value_table_(v19, v51, @"Digital Touch Message", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v3, v49, *MEMORY[0x1E4F6CB28], v50) & 1) == 0)
      {
        long long v52 = IMBalloonExtensionIDWithSuffix();
        int isEqualToString = objc_msgSend_isEqualToString_(v3, v53, (uint64_t)v52, v54);

        if (!isEqualToString)
        {
LABEL_8:
          uint64_t v31 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v28, v29, v30);
          uint64_t v34 = objc_msgSend_balloonPluginForBundleID_(v31, v32, (uint64_t)v3, v33);

          uint64_t v38 = objc_msgSend_browserDisplayName(v34, v35, v36, v37);
          if (objc_msgSend_length(v38, v39, v40, v41))
          {
            uint64_t v42 = NSString;
            uint64_t v43 = sub_1A4C0ACE4();
            uint64_t v45 = objc_msgSend_localizedStringForKey_value_table_(v43, v44, @"1 %@ Message", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
            uint64_t v16 = objc_msgSend_stringWithFormat_(v42, v46, (uint64_t)v45, v47, v38);
          }
          else
          {
            uint64_t v16 = 0;
          }

          goto LABEL_12;
        }
      }
      uint64_t v19 = sub_1A4C0ACE4();
      objc_msgSend_localizedStringForKey_value_table_(v19, v56, @"CHECK_IN_MESSAGE", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    uint64_t v16 = };

    if (!v16) {
      goto LABEL_8;
    }
  }
LABEL_12:

  return v16;
}

+ (id)previewSummaryForPluginPayload:(id)a3 withBundleID:(id)a4 previewAttachmentURL:(id *)a5 previewAttachmentUTI:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v11, v12, v13);
  uint64_t v17 = (objc_class *)objc_msgSend_dataSourceClassForBundleID_(v14, v15, (uint64_t)v10, v16);

  if (v17)
  {
    if (objc_msgSend_supportsIndividualPreviewSummaries(v17, v18, v19, v20))
    {
      id v23 = [v17 alloc];
      uint64_t v26 = objc_msgSend_initWithPluginPayload_(v23, v24, (uint64_t)v9, v25);
      uint64_t v30 = v26;
      if (v26)
      {
        if (a5)
        {
          objc_msgSend_individualPreviewAttachmentFileAndUTI_(v26, v27, (uint64_t)a6, v29);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v31 = objc_msgSend_individualPreviewSummary(v30, v27, v28, v29);
        if (v31)
        {

          goto LABEL_35;
        }
      }
    }
    if (objc_msgSend_rangeOfString_(v10, v21, *MEMORY[0x1E4F6CBE8], v22)) {
      goto LABEL_33;
    }
    id v35 = objc_msgSend_data(v9, v32, v33, v34);
    if (!v35)
    {
LABEL_32:

LABEL_33:
      uint64_t v31 = objc_msgSend_previewSummaryForPluginBundle_(v17, v32, (uint64_t)v10, v34);
      goto LABEL_35;
    }
    char v36 = objc_opt_respondsToSelector();
    uint64_t v37 = (void *)MEMORY[0x1E4F28DC0];
    if (v36)
    {
      uint64_t v38 = IMExtensionPayloadUnarchivingClasses();
      id v52 = 0;
      uint64_t v40 = objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(v37, v39, (uint64_t)v38, (uint64_t)v35, &v52);
      id v41 = v52;

      if (IMOSLoggingEnabled())
      {
        uint64_t v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v41;
          _os_log_impl(&dword_1A4AF7000, v44, OS_LOG_TYPE_INFO, "strict-decoding 006 exception/error after _strictlyUnarchivedObjectOfClasses: [%@]", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v45 = IMExtensionPayloadUnarchivingClasses();
      id v51 = 0;
      uint64_t v40 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v37, v46, (uint64_t)v45, (uint64_t)v35, &v51);
      id v41 = v51;

      if (IMOSLoggingEnabled())
      {
        uint64_t v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v41;
          _os_log_impl(&dword_1A4AF7000, v47, OS_LOG_TYPE_INFO, "strict-decoding 006 exception/error after unarchivedObjectOfClasses: [%@]", buf, 0xCu);
        }
      }
    }
    if (v40)
    {
      uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v40, v42, *MEMORY[0x1E4F6D2E8], v43);
      if (v48)
      {
        uint64_t v31 = localizedTextForAppName();

        goto LABEL_35;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_31;
      }
      long long v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not obtain value for key IMExtensionPayloadAppNameKey", buf, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_31:

        goto LABEL_32;
      }
      long long v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v41;
        _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not unarchive plugin payload data due to the following error:%@", buf, 0xCu);
      }
    }

    goto LABEL_31;
  }
  uint64_t v31 = 0;
LABEL_35:

  return v31;
}

+ (id)previewSummary
{
  return 0;
}

+ (id)individualPreviewSummaryForPluginPayload:(id)a3
{
  return 0;
}

+ (BOOL)supportsIndividualPreviewSummaries
{
  return 1;
}

- (id)individualPreviewSummary
{
  uint64_t v5 = objc_msgSend__summaryText(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__replaceHandleWithContactNameInString_(self, v6, (uint64_t)v5, v7);
  uint64_t v12 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v9, v10, v11);
  uint64_t v15 = objc_msgSend_stringByTrimmingCharactersInSet_(v8, v13, (uint64_t)v12, v14);
  uint64_t v19 = objc_msgSend_length(v15, v16, v17, v18);

  id v23 = 0;
  if (objc_msgSend_length(v8, v20, v21, v22) && v19) {
    id v23 = v8;
  }

  return v23;
}

- (id)_summaryText
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_pluginPayload(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_data(v4, v5, v6, v7);

  if (!v8)
  {
    uint64_t v15 = 0;
    goto LABEL_23;
  }
  char v9 = objc_opt_respondsToSelector();
  uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
  if (v9)
  {
    uint64_t v11 = IMExtensionPayloadUnarchivingClasses();
    uint64_t v25 = 0;
    uint64_t v12 = (id *)&v25;
    uint64_t v14 = objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(v10, v13, (uint64_t)v11, (uint64_t)v8, &v25);
  }
  else
  {
    uint64_t v11 = IMExtensionPayloadUnarchivingClasses();
    uint64_t v24 = 0;
    uint64_t v12 = (id *)&v24;
    uint64_t v14 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v10, v16, (uint64_t)v11, (uint64_t)v8, &v24);
  }
  uint64_t v17 = (void *)v14;
  id v18 = *v12;

  if (v18 && IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v18;
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "strict-decoding 020 exception/error after unarchivedObjectOfClasses: [%@]", buf, 0xCu);
    }
  }
  if (!v17)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v18;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not unarchive plugin payload data due to the following error:%@", buf, 0xCu);
      }
      goto LABEL_20;
    }
LABEL_21:
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v17, v19, *MEMORY[0x1E4F6D318], v20);
  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not obtain value for key IMExtensionPayloadLocalizedDescriptionTextKey", buf, 2u);
      }
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_22:

LABEL_23:

  return v15;
}

- (id)individualPreviewAttachmentFileAndUTI:(id *)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)datasourceWasMovedToNewGuid:(id)a3
{
  id v9 = a3;
  objc_msgSend_setMessageGUID_(self, v4, (uint64_t)v9, v5);
  imMessageGUID = self->__imMessageGUID;
  self->__imMessageGUID = 0;

  objc_msgSend_setMessageGUID_(self->_pluginPayload, v7, (uint64_t)v9, v8);
}

- (LPLinkMetadata)richLinkMetadata
{
  return 0;
}

- (void)chooseOptions
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v5, v4, @"com.apple.messages.IMBalloonPluginDataSourceCollaborationLPTapped", 0);
}

- (void)pluginPayloadShouldSendCopy
{
  id v5 = objc_msgSend_pluginDataSourceDelegate(self, a2, v2, v3);

  if (v5)
  {
    objc_msgSend_pluginDataSourceDelegate(self, v6, v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_balloonPluginDataSource_shouldSendAsCopy_(v10, v9, (uint64_t)self, 1);
  }
}

- (void)pluginPayloadShouldSendCollaboration
{
  id v5 = objc_msgSend_pluginDataSourceDelegate(self, a2, v2, v3);

  if (v5)
  {
    objc_msgSend_pluginDataSourceDelegate(self, v6, v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_balloonPluginDataSource_shouldSendAsCopy_(v10, v9, (uint64_t)self, 0);
  }
}

- (void)_dataSourceDidChange
{
  uint64_t v5 = objc_msgSend_pluginDataSourceDelegate(self, a2, v2, v3);
  if (v5)
  {
    id v9 = (void *)v5;
    id v10 = objc_msgSend_pluginDataSourceDelegate(self, v6, v7, v8);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_msgSend_pluginDataSourceDelegate(self, v12, v13, v14);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_balloonPluginDataSourceDidChange_(v17, v15, (uint64_t)self, v16);
    }
  }
}

- (BOOL)isDeferredSend
{
  uint64_t v5 = objc_msgSend_imMessage(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_scheduleType(v5, v6, v7, v8);

  if (v9 != 2) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_imMessage(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_scheduleState(v13, v14, v15, v16);

  if (v17 <= 5) {
    return (0x36u >> v17) & 1;
  }
  else {
    return 0;
  }
}

- (id)_overrideURLForOpeningURL:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pluginPayload(self, v5, v6, v7);
  int isPayloadServiceManatee = objc_msgSend_isPayloadServiceManatee_(IMBalloonPluginDataSource, v9, (uint64_t)v8, v10);

  if (isPayloadServiceManatee)
  {
    uint64_t v15 = objc_msgSend_pluginPayload(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_url(v15, v16, v17, v18);
    id v23 = objc_msgSend_chat(self, v20, v21, v22);
    id v27 = objc_msgSend_lastAddressedHandleID(v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_pluginPayload(self, v28, v29, v30);
    objc_msgSend_URLForDugongShareURL_handle_payload_(IMBalloonPluginDataSource, v32, (uint64_t)v19, (uint64_t)v27, v31);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v33 = v4;
  }

  return v33;
}

- (id)overrideURLForOpeningURL:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend__overrideURLForOpeningURL_(self, v5, (uint64_t)v4, v6);
  willOpenHandler = (void (**)(void))self->_willOpenHandler;
  if (willOpenHandler) {
    willOpenHandler[2]();
  }
  uint64_t v12 = objc_msgSend_imMessage(self, v7, v8, v9);
  int v13 = _IMShouldProcessURLForPhotosExtension();

  if (v13)
  {
    uint64_t v17 = objc_msgSend_balloonBundleID(v12, v14, v15, v16);

    if (v17)
    {

      uint64_t v21 = objc_msgSend_chat(self, v18, v19, v20);
      uint64_t v25 = objc_msgSend_sharedInstance(IMDaemonController, v22, v23, v24);
      uint64_t v29 = objc_msgSend_guid(v12, v26, v27, v28);
      id v33 = objc_msgSend_guid(v21, v30, v31, v32);
      objc_msgSend_upgradeCompleteMyMomentLinkToStackWithMessageGUID_chatGUID_(v25, v34, (uint64_t)v29, (uint64_t)v33);

      uint64_t v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)isPayloadServiceManatee:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_containerSetupInfo(v3, v4, v5, v6);

  if (v7)
  {
    uint64_t v11 = objc_msgSend_containerSetupInfo(v3, v8, v9, v10);

    uint64_t v15 = objc_msgSend_containerOptions(v11, v12, v13, v14);
    char isServiceManatee = objc_msgSend_isServiceManatee(v15, v16, v17, v18);
  }
  else
  {
    uint64_t v11 = objc_msgSend_url(v3, v8, v9, v10);

    uint64_t v15 = objc_msgSend_host(v11, v20, v21, v22);
    if (qword_1E965E818 != -1) {
      dispatch_once(&qword_1E965E818, &unk_1EF8E50D8);
    }
    char isServiceManatee = objc_msgSend_containsObject_((void *)qword_1E965E810, v23, (uint64_t)v15, v24);
  }
  BOOL v25 = isServiceManatee;

  return v25;
}

+ (id)URLForDugongShareURL:(id)a3 handle:(id)a4 payload:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v13 = objc_msgSend_datasource(a5, v10, v11, v12);
  uint64_t v17 = objc_msgSend_richLinkMetadata(v13, v14, v15, v16);
  uint64_t v19 = objc_msgSend_URLForDugongShareURL_handle_metadata_(a1, v18, (uint64_t)v9, (uint64_t)v8, v17);

  return v19;
}

+ (id)URLForDugongShareURL:(id)a3 handle:(id)a4 metadata:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v94 = a4;
  id v8 = a5;
  uint64_t v12 = objc_msgSend_specialization(v8, v9, v10, v11);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v17 = objc_msgSend_specialization(v8, v14, v15, v16);
    id v93 = objc_msgSend_specialization(v17, v18, v19, v20);

    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend_encodedTokens(v93, v21, v22, v23), (uint64_t v92 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v99 = v94;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Getting token for current handle:%@", buf, 0xCu);
        }
      }
      uint64_t v90 = objc_msgSend_objectForKey_(v92, v24, (uint64_t)v94, v25);
      if (v90) {
        goto LABEL_10;
      }
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = sub_1A4B48EE0;
      v96[3] = &unk_1E5B7B158;
      id v97 = v92;
      uint64_t v90 = sub_1A4B48EE0((uint64_t)v96, v28, v29, v30);

      if (v90)
      {
LABEL_10:
        uint64_t v91 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E4F29088], v27, (uint64_t)v7, 0);
        id v31 = objc_alloc_init(MEMORY[0x1E4F29088]);
        id v35 = objc_msgSend_scheme(v91, v32, v33, v34);
        objc_msgSend_setScheme_(v31, v36, (uint64_t)v35, v37);

        id v41 = objc_msgSend_host(v91, v38, v39, v40);
        objc_msgSend_setHost_(v31, v42, (uint64_t)v41, v43);

        uint64_t v47 = objc_msgSend_path(v91, v44, v45, v46);
        objc_msgSend_setPath_(v31, v48, (uint64_t)v47, v49);

        long long v53 = objc_msgSend_fragment(v91, v50, v51, v52);
        objc_msgSend_setFragment_(v31, v54, (uint64_t)v53, v55);

        uint64_t v59 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E4F28B88], v56, v57, v58);
        uint64_t v63 = objc_msgSend_mutableCopy(v59, v60, v61, v62);

        objc_msgSend_removeCharactersInString_(v63, v64, @"+=/", v65);
        uint64_t v68 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(@"token", v66, (uint64_t)v63, v67);
        id v95 = 0;
        uint64_t v70 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v69, (uint64_t)v90, 1, &v95);
        id v89 = v95;
        uint64_t v73 = objc_msgSend_base64EncodedStringWithOptions_(v70, v71, 0, v72);
        uint64_t v76 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v73, v74, (uint64_t)v63, v75);
        uint64_t v79 = objc_msgSend_stringWithFormat_(NSString, v77, @"%@=%@", v78, v68, v76);
        objc_msgSend_setQuery_(v31, v80, (uint64_t)v79, v81);
        objc_msgSend_URL(v31, v82, v83, v84);
        id v85 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v88 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v99 = 0;
            _os_log_impl(&dword_1A4AF7000, v88, OS_LOG_TYPE_INFO, "Error while decoding the handle-to-token mapping to NSDictionary: %@", buf, 0xCu);
          }
        }
        id v85 = v7;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v86 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v99 = v7;
          _os_log_impl(&dword_1A4AF7000, v86, OS_LOG_TYPE_INFO, "No tokenMapping data found in URL query. Returning URL: %@", buf, 0xCu);
        }
      }
      id v85 = v7;
    }
  }
  else
  {
    id v85 = v7;
  }

  return v85;
}

+ (id)lastAddressedHandleIDFromChat:(id)a3
{
  return (id)objc_msgSend_lastAddressedHandleID(a3, a2, (uint64_t)a3, v3);
}

+ (id)replaceHandleWithContactNameInString:(id)a3 forAccount:(id)a4 additionalHandles:(id)a5
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v114 = a4;
  id v110 = a5;
  uint64_t v109 = v7;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v129 = "+[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:]";
        __int16 v130 = 2112;
        id v131 = v7;
        __int16 v132 = 2112;
        id v133 = v114;
        __int16 v134 = 2112;
        id v135 = v110;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "%s string: %@, account: %@, additionalHandles: %@", buf, 0x2Au);
      }
    }
    objc_msgSend___im_handleIdentifiers(v7, v8, v9, v10);
    uint64_t v12 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v116 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v13, (uint64_t)v7, v14);
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v129 = v12;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Identifiers to replace: %@", buf, 0xCu);
      }
    }
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id obj = v12;
    uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v122, (uint64_t)v127, 16);
    if (v113)
    {
      uint64_t v112 = *(void *)v123;
      do
      {
        for (uint64_t i = 0; i != v113; ++i)
        {
          if (*(void *)v123 != v112) {
            objc_enumerationMutation(obj);
          }
          uint64_t v115 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend___im_IDForHandleIdentifierString(v115, v17, v18, v19);
          if (v114)
          {
            objc_msgSend_existingIMHandleWithID_(v114, v20, (uint64_t)v23, v22);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              if (!objc_msgSend__appearsToBeEmail(v23, v24, v25, v26)
                || (objc_msgSend_stringByAppendingString_(@"e:", v62, (uint64_t)v23, v64),
                    uint64_t v65 = objc_claimAutoreleasedReturnValue(),
                    objc_msgSend_existingIMHandleWithID_alreadyCanonical_(v114, v66, (uint64_t)v65, 1),
                    id v27 = (id)objc_claimAutoreleasedReturnValue(),
                    v65,
                    !v27))
              {
                if (objc_msgSend__appearsToBePhoneNumber(v23, v62, v63, v64))
                {
                  uint64_t v69 = objc_msgSend_stringByAppendingString_(@"p:", v67, (uint64_t)v23, v68);
                  objc_msgSend_existingIMHandleWithID_alreadyCanonical_(v114, v70, (uint64_t)v69, 1);
                  id v27 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v27 = 0;
                }
              }
            }
            if (IMOSLoggingEnabled())
            {
              id v31 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v129 = (const char *)v23;
                __int16 v130 = 2112;
                id v131 = v27;
                _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Identifier was a uuid, identifierString %@, handle %@", buf, 0x16u);
              }
            }
            if (v27)
            {
              if (objc_msgSend_hasName(v27, v28, v29, v30))
              {
                objc_msgSend_name(v27, v32, v33, v34);
                id v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v71 = objc_msgSend_ID(v27, v32, v33, v34);
                objc_msgSend__stripFZIDPrefix(v71, v72, v73, v74);
                id v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v75 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                {
                  uint64_t v79 = objc_msgSend_callStackSymbols(MEMORY[0x1E4F29060], v76, v77, v78);
                  *(_DWORD *)buf = 136315394;
                  v129 = "+[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:]";
                  __int16 v130 = 2112;
                  id v131 = v79;
                  _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "%s Invalid handle, callstack: %@", buf, 0x16u);
                }
              }
              id v35 = 0;
            }
          }
          else
          {
            char v36 = objc_msgSend_sharedInstance(IMHandleRegistrar, v20, v21, v22);
            uint64_t v40 = objc_msgSend_allIMHandles(v36, v37, v38, v39);

            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id v27 = v40;
            id v35 = 0;
            uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v41, (uint64_t)&v118, (uint64_t)v126, 16);
            if (v45)
            {
              uint64_t v46 = *(void *)v119;
              do
              {
                for (uint64_t j = 0; j != v45; ++j)
                {
                  if (*(void *)v119 != v46) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v48 = *(void **)(*((void *)&v118 + 1) + 8 * j);
                  uint64_t v49 = objc_msgSend_ID(v48, v42, v43, v44);
                  uint64_t v50 = MEMORY[0x1A62639E0]();
                  int isEqualToString = objc_msgSend_isEqualToString_(v50, v51, (uint64_t)v23, v52);

                  if (isEqualToString)
                  {
                    if (objc_msgSend_hasName(v48, v42, v43, v44))
                    {
                      uint64_t v57 = objc_msgSend_name(v48, v54, v55, v56);
                    }
                    else
                    {
                      objc_msgSend_ID(v48, v54, v55, v56);
                      uint64_t v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      uint64_t v57 = objc_msgSend__stripFZIDPrefix(v58, v59, v60, v61);

                      id v35 = v58;
                    }

                    id v35 = (__CFString *)v57;
                  }
                }
                uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v42, (uint64_t)&v118, (uint64_t)v126, 16);
              }
              while (v45);
            }
          }
          int v82 = objc_msgSend_isEqualToString_(v23, v80, (uint64_t)kIMTranscriptPluginBreadcrumbTextSenderIdentifier, v81);
          int v85 = objc_msgSend_isEqualToString_(v23, v83, (uint64_t)kIMTranscriptPluginBreadcrumbTextReceiverIdentifier, v84);
          if (!objc_msgSend_length(v35, v86, v87, v88) && v82 | v85)
          {
            uint64_t v92 = objc_msgSend_objectForKey_(v110, v89, (uint64_t)v23, v91);

            id v35 = (__CFString *)v92;
          }
          if (objc_msgSend_length(v35, v89, v90, v91)) {
            int v96 = 1;
          }
          else {
            int v96 = v82;
          }
          if (((v96 | v85) & 1) == 0)
          {
            uint64_t v97 = objc_msgSend__stripFZIDPrefix(v23, v93, v94, v95);

            id v35 = (__CFString *)v97;
          }
          if (!objc_msgSend_length(v35, v93, v94, v95))
          {

            id v35 = &stru_1EF8E78C8;
          }
          uint64_t v101 = objc_msgSend_length(v116, v98, v99, v100);
          objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v116, v102, (uint64_t)v115, (uint64_t)v35, 0, 0, v101);
        }
        uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v122, (uint64_t)v127, 16);
      }
      while (v113);
    }

    if (IMOSLoggingEnabled())
    {
      id v106 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v129 = "+[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:]";
        __int16 v130 = 2112;
        id v131 = v116;
        _os_log_impl(&dword_1A4AF7000, v106, OS_LOG_TYPE_INFO, "%s updatedString: %@", buf, 0x16u);
      }
    }
    id v107 = objc_msgSend_copy(v116, v103, v104, v105);
  }
  else
  {
    id v107 = 0;
  }

  return v107;
}

- (id)_replaceHandleWithContactNameInString:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_chat(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_account(v8, v9, v10, v11);
  uint64_t v14 = objc_msgSend_replaceHandleWithContactNameInString_forAccount_additionalHandles_(IMBalloonPluginDataSource, v13, (uint64_t)v4, (uint64_t)v12, 0);

  return v14;
}

- (void)beginShowingLastConsumedBreadcrumbForOutgoingPayload:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend_isShowingLatestMessageAsBreadcrumb(self, v5, v6, v7) & 1) == 0
    && objc_msgSend_isUpdate(v4, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_guidOfLastMessageInSession(self, v11, v12, v13);
    uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);

    if (v18)
    {
      objc_msgSend_setShowingLatestMessageAsBreadcrumb_(self, v19, 1, v20);
      objc_msgSend__reloadLatestUnconsumedBreadcrumb(self, v21, v22, v23);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        uint64_t v26 = self;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: %@ attempted to show consumed breadcrumb before the last unconsumed breadcrumb was known.", (uint8_t *)&v25, 0xCu);
      }
    }
  }
}

- (void)endShowingLastConsumedBreadcrumb
{
  if (objc_msgSend_isShowingLatestMessageAsBreadcrumb(self, a2, v2, v3))
  {
    objc_msgSend_setShowingLatestMessageAsBreadcrumb_(self, v5, 0, v6);
    objc_msgSend__reloadLatestUnconsumedBreadcrumb(self, v7, v8, v9);
  }
}

- (void)_reloadLatestUnconsumedBreadcrumb
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_guidOfLastMessageInSession(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_sharedRegistryIfAvailable(IMChatRegistry, v6, v7, v8);
  uint64_t v12 = objc_msgSend__cachedChatsWithMessageGUID_(v9, v10, (uint64_t)v5, v11);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v38, (uint64_t)v48, 16);
  if (v17)
  {
    uint64_t v19 = *(void *)v39;
    *(void *)&long long v18 = 138412802;
    long long v37 = v18;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_messageForGUID_(v21, v15, (uint64_t)v5, v16, v37, (void)v38);
        uint64_t v26 = objc_msgSend__imMessageItem(v22, v23, v24, v25);

        if (v26)
        {
          objc_msgSend__handleIncomingItem_updateRecipient_(v21, v27, (uint64_t)v26, 0);
          if (!IMOSLoggingEnabled()) {
            goto LABEL_15;
          }
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = objc_msgSend_chatIdentifier(v21, v29, v30, v31);
            *(_DWORD *)buf = v37;
            uint64_t v43 = self;
            __int16 v44 = 2112;
            uint64_t v45 = v5;
            __int16 v46 = 2112;
            uint64_t v47 = v32;
            _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "%@ refreshing most recent message guid: %@ for chat: %@ ", buf, 0x20u);
          }
        }
        else
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_15;
          }
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            char v36 = objc_msgSend_chatIdentifier(v21, v33, v34, v35);
            *(_DWORD *)buf = v37;
            uint64_t v43 = self;
            __int16 v44 = 2112;
            uint64_t v45 = v5;
            __int16 v46 = 2112;
            uint64_t v47 = v36;
            _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: %@ no message item with GUID %@ found in chat: %@", buf, 0x20u);
          }
        }

LABEL_15:
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v38, (uint64_t)v48, 16);
    }
    while (v17);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_messageGUID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_bundleID(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_payload(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_length(v16, v17, v18, v19);
  uint64_t v24 = objc_msgSend_pluginPayload(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_attachments(v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_count(v28, v29, v30, v31);
  objc_msgSend_stringWithFormat_(v3, v33, @"<%@ %p> [GUID: %@; bundleID: %@; Payload length: %lu; Num. attachments: %tu]",
    v34,
    v4,
    self,
    v8,
    v12,
    v20,
  uint64_t v35 = v32);

  return v35;
}

- (void)setChat:(id)a3
{
}

- (IMPluginPayload)pluginPayload
{
  return self->_pluginPayload;
}

- (void)setMessageGUID:(id)a3
{
}

- (void)setSessionGUID:(id)a3
{
}

- (BOOL)payloadInShelf
{
  return self->_payloadInShelf;
}

- (void)setPayloadInShelf:(BOOL)a3
{
  self->_payloadInShelf = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (DDScannerResult)dataDetectedResult
{
  return self->_dataDetectedResult;
}

- (void)setDataDetectedResult:(id)a3
{
}

- (NSArray)attachmentGUIDs
{
  return self->_attachmentGUIDs;
}

- (void)setAttachmentGUIDs:(id)a3
{
}

- (NSURL)URLToOpenOnTapAction
{
  return self->_URLToOpenOnTapAction;
}

- (id)willOpenHandler
{
  return self->_willOpenHandler;
}

- (void)setWillOpenHandler:(id)a3
{
}

- (BOOL)initialMessageIsFromMe
{
  return self->_initialMessageIsFromMe;
}

- (void)setInitialMessageIsFromMe:(BOOL)a3
{
  self->_initialMessageIsFromMe = a3;
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (BOOL)isLast
{
  return self->_isLast;
}

- (void)setLast:(BOOL)a3
{
  self->_isLast = a3;
}

- (NSArray)pendingAttachmentData
{
  return self->_pendingAttachmentData;
}

- (void)setPendingAttachmentData:(id)a3
{
}

- (NSMutableSet)temporaryAttachmentURLs
{
  return self->_temporaryAttachmentURLs;
}

- (void)setTemporaryAttachmentURLs:(id)a3
{
}

- (void)set_imMessageGUID:(id)a3
{
}

- (BOOL)isShowingLatestMessageAsBreadcrumb
{
  return self->_isShowingLatestMessageAsBreadcrumb;
}

- (void)setShowingLatestMessageAsBreadcrumb:(BOOL)a3
{
  self->_isShowingLatestMessageAsBreadcrumb = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)hasInvalidatedSize
{
  return self->_hasInvalidatedSize;
}

- (void)setHasInvalidatedSize:(BOOL)a3
{
  self->_hasInvalidatedSize = a3;
}

- (NSArray)consumedPayloads
{
  return self->_consumedPayloads;
}

- (void)setConsumedPayloads:(id)a3
{
}

- (BOOL)parentChatHasAllUnknownRecipients
{
  return self->_parentChatHasAllUnknownRecipients;
}

- (void)setParentChatHasAllUnknownRecipients:(BOOL)a3
{
  self->_parentChatHasAllUnknownRecipients = a3;
}

- (IMPluginDataSourceStagingContext)stagingContext
{
  return self->_stagingContext;
}

- (void)setStagingContext:(id)a3
{
}

- (IMBalloonPluginDataSourceDelegate)pluginDataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginDataSourceDelegate);

  return (IMBalloonPluginDataSourceDelegate *)WeakRetained;
}

- (void)setPluginDataSourceDelegate:(id)a3
{
}

- (NSString)guidOfLastMessageInSession
{
  return self->_guidOfLastMessageInSession;
}

- (int64_t)messageIDOfLastMessageInSession
{
  return self->_messageIDOfLastMessageInSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidOfLastMessageInSession, 0);
  objc_destroyWeak((id *)&self->_pluginDataSourceDelegate);
  objc_storeStrong((id *)&self->_stagingContext, 0);
  objc_storeStrong((id *)&self->_consumedPayloads, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->__imMessageGUID, 0);
  objc_storeStrong((id *)&self->_temporaryAttachmentURLs, 0);
  objc_storeStrong((id *)&self->_pendingAttachmentData, 0);
  objc_storeStrong(&self->_willOpenHandler, 0);
  objc_storeStrong((id *)&self->_URLToOpenOnTapAction, 0);
  objc_storeStrong((id *)&self->_attachmentGUIDs, 0);
  objc_storeStrong((id *)&self->_dataDetectedResult, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sessionGUID, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_pluginPayload, 0);

  objc_storeStrong((id *)&self->_chat, 0);
}

@end