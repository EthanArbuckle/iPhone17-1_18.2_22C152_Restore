@interface IMTranscriptPluginChatItem
- (BOOL)hasSetIsLastChatItemOfPluginType;
- (BOOL)isDataSourceInitialized;
- (BOOL)isLastChatItemOfPluginType;
- (BOOL)isPlayed;
- (BOOL)isSaved;
- (BOOL)parentChatHasKnownParticipants;
- (BOOL)supportsSuggestedActionsMenu;
- (BOOL)wantsAutoPlayback;
- (IMBalloonPluginDataSource)dataSource;
- (IMPluginPayload)initialPayload;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)pluginSessionGUID;
- (id)_initWithItem:(id)a3 initialPayload:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 parentChatHasKnownParticipants:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageSummaryInfo;
- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4;
- (unint64_t)playbackType;
- (unsigned)contentType;
- (void)setBundleIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHasSetIsLastChatItemOfPluginType:(BOOL)a3;
- (void)setInitialPayload:(id)a3;
- (void)setLastChatItemOfPluginType:(BOOL)a3;
@end

@implementation IMTranscriptPluginChatItem

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v40 = [IMReplyContextTranscriptPluginChatItem alloc];
  v11 = objc_msgSend__item(self, v8, v9, v10);
  v15 = objc_msgSend_guid(v7, v12, v13, v14);
  uint64_t v19 = objc_msgSend_isFromMe(v7, v16, v17, v18);
  v23 = objc_msgSend_initialPayload(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_index(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_messagePartRange(self, v28, v29, v30);
  v33 = v32;
  char HasKnownParticipants = objc_msgSend_parentChatHasKnownParticipants(self, v32, v34, v35);
  HasKnownParticipants_chatContext = objc_msgSend__initWithItem_parentItem_replyMessageGUID_replyIsFromMe_initialPayload_index_messagePartRange_parentChatHasKnownParticipants_chatContext_(v40, v36, (uint64_t)v11, (uint64_t)v7, v15, v19, v23, v27, v31, v33, HasKnownParticipants, v6);

  return HasKnownParticipants_chatContext;
}

- (NSString)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IMTranscriptPluginChatItem;
  v4 = [(IMMessagePartChatItem *)&v13 description];
  v8 = objc_msgSend_type(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"[{%@] type:%@ payload", v10, v4, v8);

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v12 = objc_msgSend_initialPayload(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_index(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_messagePartRange(self, v17, v18, v19);
  uint64_t v22 = v21;
  uint64_t HasKnownParticipants = objc_msgSend_parentChatHasKnownParticipants(self, v21, v23, v24);
  uint64_t v27 = objc_msgSend__initWithItem_initialPayload_index_messagePartRange_parentChatHasKnownParticipants_(v4, v26, (uint64_t)v8, (uint64_t)v12, v16, v20, v22, HasKnownParticipants);

  return v27;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (id)_initWithItem:(id)a3 initialPayload:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 parentChatHasKnownParticipants:(BOOL)a7
{
  uint64_t v8 = a7;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v14 = a3;
  id v15 = a4;
  uint64_t v19 = objc_msgSend_pluginBundleID(v15, v16, v17, v18);
  int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x1E4F6CC10], v21);
  char v64 = v8;
  if (isEqualToString)
  {
    uint64_t v7 = objc_msgSend_message(v14, v22, v23, v24);
    uint64_t v8 = objc_msgSend_subject(v7, v26, v27, v28);
    uint64_t v32 = objc_msgSend_isBusiness((void *)v8, v29, v30, v31) ^ 1;
    uint64_t v34 = objc_msgSend__initWithItem_index_messagePartRange_syndicationBehavior_(self, v33, (uint64_t)v14, a5, location, length, v32);
  }
  else
  {
    uint64_t v34 = objc_msgSend__initWithItem_index_messagePartRange_syndicationBehavior_(self, v22, (uint64_t)v14, a5, location, length, 0);
  }
  uint64_t v35 = (unsigned char *)v34;
  if (isEqualToString)
  {
  }
  if (v35)
  {
    v39 = objc_msgSend_guid(v14, v36, v37, v38);
    v40 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v35, v41, (uint64_t)v40, v42);
    objc_msgSend_setInitialPayload_(v35, v43, (uint64_t)v15, v44);
    v48 = objc_msgSend_pluginBundleID(v15, v45, v46, v47);
    objc_msgSend_setBundleIdentifier_(v35, v49, (uint64_t)v48, v50);

    v35[170] = v64;
    v54 = objc_msgSend__item(v35, v51, v52, v53);
    int isBreadcrumb = objc_msgSend_isBreadcrumb(v54, v55, v56, v57);

    if (isBreadcrumb) {
      id v62 = (id)objc_msgSend_dataSource(v35, v59, v60, v61);
    }
  }
  return v35;
}

- (BOOL)isDataSourceInitialized
{
  v5 = objc_msgSend_sharedInstance(IMBalloonPluginManager, a2, v2, v3);
  uint64_t v9 = objc_msgSend_initialPayload(self, v6, v7, v8);
  objc_super v13 = objc_msgSend_pluginSessionGUID(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_bundleIdentifier(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_existingDataSourceForMessageGUID_bundleID_(v5, v18, (uint64_t)v13, (uint64_t)v17);

  return v19 != 0;
}

- (void)setLastChatItemOfPluginType:(BOOL)a3
{
  self->_hasSetIsLastChatItemOfPluginType = 1;
  self->_isLastChatItemOfPluginType = a3;
}

- (NSString)pluginSessionGUID
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_pluginSessionGUID(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (unint64_t)playbackType
{
  v5 = objc_msgSend_type(self, a2, v2, v3);
  char isEqualToString = objc_msgSend_isEqualToString_(v5, v6, *MEMORY[0x1E4F6CBA0], v7);

  if (isEqualToString) {
    return 1;
  }
  objc_super v13 = objc_msgSend_type(self, v9, v10, v11);
  if (objc_msgSend_isEqualToString_(v13, v14, *MEMORY[0x1E4F6CBD8], v15))
  {
    uint64_t v19 = objc_msgSend_message(self, v16, v17, v18);
    uint64_t v23 = objc_msgSend_expressiveSendStyleID(v19, v20, v21, v22);
    int v26 = objc_msgSend_isEqualToString_(v23, v24, *MEMORY[0x1E4F6D4E0], v25);

    if (v26) {
      return 0;
    }
    else {
      return 2;
    }
  }
  else
  {

    return 0;
  }
}

- (IMBalloonPluginDataSource)dataSource
{
  v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v6, v7, v8);
  objc_super v13 = objc_msgSend_initialPayload(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_dataSourceForPluginPayload_(v9, v14, (uint64_t)v13, v15);

  if (objc_msgSend_hasSetIsLastChatItemOfPluginType(self, v17, v18, v19))
  {
    uint64_t isLastChatItemOfPluginType = objc_msgSend_isLastChatItemOfPluginType(self, v20, v21, v22);
    objc_msgSend_setLast_(v16, v24, isLastChatItemOfPluginType, v25);
  }
  uint64_t isUpdatingDataSourcePayload = objc_msgSend_isUpdatingDataSourcePayload(v5, v20, v21, v22);
  uint64_t v30 = objc_msgSend_payloadData(v5, v27, v28, v29);
  if (v30) {
    int v31 = isUpdatingDataSourcePayload ^ 1;
  }
  else {
    int v31 = 0;
  }

  if (objc_msgSend_associatedMessageType(v5, v32, v33, v34) != 2)
  {
    objc_msgSend_setUpdatingDataSourcePayload_(v5, v35, 1, v37);
    if ((v31 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v38 = objc_msgSend_balloonBundleID(v5, v35, v36, v37);
  int isEqualToString = objc_msgSend_isEqualToString_(v38, v39, *MEMORY[0x1E4F6CBA0], v40);

  if (!isEqualToString)
  {
    objc_msgSend_setUpdatingDataSourcePayload_(v5, v42, 1, v44);
    if (!v31) {
      goto LABEL_15;
    }
LABEL_14:
    v51 = [IMPluginPayload alloc];
    v54 = objc_msgSend_initWithMessageItem_(v51, v52, (uint64_t)v5, v53);
    uint64_t v58 = objc_msgSend_messageID(v5, v55, v56, v57);
    id v62 = objc_msgSend_guid(v5, v59, v60, v61);
    objc_msgSend__updatePayload_messageID_messageGUID_(v16, v63, (uint64_t)v54, v58, v62);

    uint64_t v67 = objc_msgSend_isFromMe(v5, v64, v65, v66);
    objc_msgSend_setInitialMessageIsFromMe_(v16, v68, v67, v69);

    goto LABEL_15;
  }
  v45 = objc_msgSend_consumedSessionPayloads(v5, v42, v43, v44);
  if (v45) {
    char v46 = v31;
  }
  else {
    char v46 = 0;
  }

  objc_msgSend_setUpdatingDataSourcePayload_(v5, v47, 1, v48);
  if (v46) {
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend_setUpdatingDataSourcePayload_(v5, v49, isUpdatingDataSourcePayload, v50);
  if (objc_msgSend_parentChatHasKnownParticipants(self, v70, v71, v72))
  {
    objc_msgSend_setParentChatHasAllUnknownRecipients_(v16, v73, 0, v75);
  }
  else
  {
    uint64_t v76 = objc_msgSend_isFromMe(self, v73, v74, v75) ^ 1;
    objc_msgSend_setParentChatHasAllUnknownRecipients_(v16, v77, v76, v78);
  }

  return (IMBalloonPluginDataSource *)v16;
}

- (BOOL)isPlayed
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char isPlayed = objc_msgSend_isPlayed(v4, v5, v6, v7);

  return isPlayed;
}

- (BOOL)isSaved
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_expireState(v4, v5, v6, v7) == 3;

  return v8;
}

- (BOOL)wantsAutoPlayback
{
  v5 = objc_msgSend_message(self, a2, v2, v3);
  char isSenderUnknown = objc_msgSend_isSenderUnknown(v5, v6, v7, v8);

  if (isSenderUnknown) {
    return 0;
  }
  id v14 = objc_msgSend_dataSource(self, v10, v11, v12);
  uint64_t v18 = objc_msgSend_playbackType(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_bundleID(v14, v19, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x1E4F6CBA0], v24);

  int v32 = objc_msgSend_isPlayed(self, v26, v27, v28) & (isEqualToString ^ 1);
  BOOL v13 = v18 == 1 && !v32 || v18 == 2 && (objc_msgSend_isLast(v14, v29, v30, v31) ^ 1 | v32) != 1;

  return v13;
}

- (IMPluginPayload)initialPayload
{
  return self->_initialPayload;
}

- (void)setInitialPayload:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isLastChatItemOfPluginType
{
  return self->_isLastChatItemOfPluginType;
}

- (BOOL)hasSetIsLastChatItemOfPluginType
{
  return self->_hasSetIsLastChatItemOfPluginType;
}

- (void)setHasSetIsLastChatItemOfPluginType:(BOOL)a3
{
  self->_hasSetIsLastChatItemOfPluginType = a3;
}

- (BOOL)parentChatHasKnownParticipants
{
  return self->_parentChatHasKnownParticipants;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_initialPayload, 0);
}

- (unsigned)contentType
{
  id v4 = objc_msgSend_type(self, a2, v2, v3);
  int isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x1E4F6CC10], v6);

  if (isEqualToString) {
    return 1;
  }
  else {
    return 9;
  }
}

- (id)messageSummaryInfo
{
  uint64_t v8 = objc_msgSend_dataSource(self, a2, v2, v3);
  if (!v8)
  {
    uint64_t v19 = 0;
    id v20 = 0;
    uint64_t v21 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = objc_msgSend_type(self, v5, v6, v7);
  if (objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x1E4F6CC10], v11))
  {
    uint64_t v15 = objc_msgSend_url(v8, v12, v13, v14);
    uint64_t v19 = objc_msgSend_absoluteString(v15, v16, v17, v18);
  }
  else
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v19 = objc_msgSend_previewSummaryForPluginBundle_(v22, v23, (uint64_t)v9, v24);
  }
  id v20 = v9;
  id v25 = objc_alloc(MEMORY[0x1E4F28DC0]);
  uint64_t v29 = objc_msgSend_pluginPayload(v8, v26, v27, v28);
  uint64_t v33 = objc_msgSend_data(v29, v30, v31, v32);
  id v53 = 0;
  uint64_t v35 = objc_msgSend_initForReadingFromData_error_(v25, v34, (uint64_t)v33, (uint64_t)&v53);
  id v36 = v53;

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend__enableStrictSecureDecodingMode(v35, v37, v38, v39);
    uint64_t v40 = IMLogHandleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_1A4CB9870();
    }
  }
  v41 = IMExtensionPayloadUnarchivingClasses();
  uint64_t v43 = objc_msgSend_decodeObjectOfClasses_forKey_(v35, v42, (uint64_t)v41, *MEMORY[0x1E4F284E8]);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v46 = IMLogHandleForCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9780((uint64_t)v36, v46);
    }

    uint64_t v21 = 0;
    if (v19) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  uint64_t v21 = objc_msgSend_objectForKey_(v43, v44, *MEMORY[0x1E4F6D2E8], v45);
  if (!v19)
  {
LABEL_16:
    uint64_t v47 = IMLogHandleForCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9708((uint64_t)v20, v47);
    }
  }
LABEL_19:

LABEL_20:
  uint64_t v48 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v49 = objc_msgSend_contentType(self, v5, v6, v7);
  v51 = objc_msgSend_dictionaryWithAssociatedMessageSummary_contentType_associatedMessagePartText_pluginBundleID_pluginDisplayName_(v48, v50, (uint64_t)v19, v49, 0, v20, v21);

  return v51;
}

@end