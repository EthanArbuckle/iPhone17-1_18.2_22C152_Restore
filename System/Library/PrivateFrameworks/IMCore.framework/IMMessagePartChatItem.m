@interface IMMessagePartChatItem
+ (BOOL)_isAllowlistedRichLinkSender:(id)a3 isBusiness:(BOOL)a4;
+ (BOOL)_isAllowlistedURL:(id)a3;
+ (BOOL)_isPathExceptionToAllowlistedURL:(id)a3;
+ (BOOL)_shouldAggregateForTransferType:(id)a3;
+ (BOOL)_supportsRichLinkURL:(id)a3 forSender:(id)a4 isAllowlistedRichLinkSender:(BOOL)a5;
+ (BOOL)isChatBotContentOnly:(id)a3;
+ (BOOL)isSiriEnabled;
+ (id)_additionalSupportedRichLinkSchemesForAllowlistedSender:(id)a3;
+ (id)_defaultRichLinkAllowListExceptions;
+ (id)_defaultRichLinkAllowlist;
+ (id)_guidForMessage:(id)a3 url:(id)a4;
+ (id)_messageItemWithPartsDeleted:(id)a3 fromMessageItem:(id)a4 indexesOfItemsDeleted:(id *)a5 indexToRangeMapping:(id *)a6;
+ (id)_newAudioMessagePartsForMessageItem:(id)a3 text:(id)a4 chatContext:(id)a5 retractedPartIndexes:(id)a6 singlePart:(id)a7;
+ (id)_newDetonatedMessagePartsForMessageItem:(id)a3 chatContext:(id)a4 photosPluginPayload:(id)a5;
+ (id)_newMessagePartArrayForMessageItem:(id)a3;
+ (id)_newMessagePartsForMessageItem:(id)a3;
+ (id)_newMessagePartsForMessageItem:(id)a3 chatContext:(id)a4;
+ (id)_newMessagePartsForMessageItem:(id)a3 chatContext:(id)a4 photosPluginPayload:(id)a5;
+ (id)_processChatItemsForRichActions:(id)a3;
+ (id)_retractedMessagePartsForMessage:(id)a3 parts:(id)a4 retractedPartIndexes:(id)a5;
+ (id)_richLinkRangesForMessageText:(id)a3 sender:(id)a4 isAllowlistedRichLinkSender:(BOOL)a5;
+ (id)_singleChatItemForDeviceActionMessage:(id)a3 context:(id)a4 pluginPayload:(id)a5;
+ (id)aggregatePartsForParts:(id)a3 forMessage:(id)a4 context:(id)a5 text:(id)a6;
+ (id)chatItemGUIDForMessageGUID:(id)a3 partIndex:(int64_t)a4;
+ (id)messageBodyStringForAttachmentGUIDs:(id)a3;
+ (id)messageBodyStringForCMMMessage:(id)a3;
+ (id)richCardsChatItemsForMessageItem:(id)a3 text:(id)a4;
+ (id)standaloneChipListChatItemForMessageItem:(id)a3 text:(id)a4;
+ (id)suggestedActionsMessagePartChatItemForMessageItem:(id)a3 attributes:(id)a4;
+ (id)suggestedRepliesMessagePartChatItemForMessageItem:(id)a3 attributes:(id)a4;
+ (int64_t)_attachmentStackAggregationThreshold;
- (BOOL)_canDeleteForCurrentScheduleState;
- (BOOL)canDelete;
- (BOOL)canRetract;
- (BOOL)chatInScrutinyMode;
- (BOOL)hasSubject;
- (BOOL)isAllowlistedRichLinkSender;
- (BOOL)isBusiness;
- (BOOL)isCorrupt;
- (BOOL)isEditedMessagePart;
- (BOOL)isFailedEditMessagePart;
- (BOOL)isFailedRetractMessagePart;
- (BOOL)isHighlighted;
- (BOOL)isPendingSatelliteSend;
- (BOOL)isRetractedMessagePart;
- (BOOL)isStewie;
- (BOOL)requiresCriticalMessagingAPIAttribution;
- (BOOL)requiresFaceTimeAttribution;
- (BOOL)requiresSiriAttribution;
- (BOOL)supportsSuggestedActionsMenu;
- (IMMessageItem)threadOriginator;
- (IMMessagePartHighlightChatItem)messageHighlightChatItem;
- (NSArray)suggestedActionsList;
- (NSArray)visibleAssociatedMessageChatItems;
- (NSAttributedString)fallbackCorruptText;
- (NSAttributedString)text;
- (NSString)description;
- (NSString)threadIdentifier;
- (NSString)threadIdentifierForTapback;
- (_NSRange)messagePartRange;
- (_NSRange)originalMessagePartRange;
- (id)_initWithItem:(id)a3 index:(int64_t)a4 messagePartRange:(_NSRange)a5;
- (id)_initWithItem:(id)a3 index:(int64_t)a4 messagePartRange:(_NSRange)a5 syndicationBehavior:(int64_t)a6;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 visibleAssociatedMessageChatItems:(id)a7;
- (id)_visibleAssociatedChatItemsByFlatteningAggregateChatItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)extractAndSetChipListFrom:(id)a3;
- (id)messageSummaryInfo;
- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4;
- (int64_t)index;
- (int64_t)messagePartAttributeName;
- (int64_t)stewieConversationID;
- (int64_t)syndicationBehavior;
- (int64_t)syndicationStatus;
- (int64_t)syndicationType;
- (unint64_t)replyCount;
- (unint64_t)scheduleState;
- (unint64_t)scheduleType;
- (unsigned)contentType;
- (void)_setIndex:(int64_t)a3;
- (void)_setVisibleAssociatedMessageChatItems:(id)a3;
- (void)setAllowlistedRichLinkSender:(BOOL)a3;
- (void)setChatInScrutinyMode:(BOOL)a3;
- (void)setChipListFromText:(id)a3;
- (void)setIsBusiness:(BOOL)a3;
- (void)setIsStewie:(BOOL)a3;
- (void)setMessagePartRange:(_NSRange)a3;
- (void)setPendingSatelliteSend:(BOOL)a3;
- (void)setReplyCount:(unint64_t)a3;
- (void)setStewie:(BOOL)a3;
- (void)setStewieConversationID:(int64_t)a3;
- (void)setSuggestedActionsList:(id)a3;
@end

@implementation IMMessagePartChatItem

- (NSString)description
{
  v3 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)IMMessagePartChatItem;
  v4 = [(IMTranscriptChatItem *)&v18 description];
  v5 = IMLoggingStringForMessageData();
  v9 = objc_msgSend_description(self->_visibleAssociatedMessageChatItems, v6, v7, v8);
  v20.location = objc_msgSend_messagePartRange(self, v10, v11, v12);
  v13 = NSStringFromRange(v20);
  v16 = objc_msgSend_stringWithFormat_(v3, v14, @"[%@ text:%@, visibleAssociatedMessageChatItems: %@, messagePartRange: %@]", v15, v4, v5, v9, v13);

  return (NSString *)v16;
}

- (int64_t)messagePartAttributeName
{
  v4 = objc_msgSend_text(self, a2, v2, v3);
  v6 = objc_msgSend_attribute_atIndex_effectiveRange_(v4, v5, *MEMORY[0x1E4F6C1F8], 0, 0);
  int64_t v10 = objc_msgSend_integerValue(v6, v7, v8, v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend__item(self, v5, v6, v7);
  text = self->_text;
  int64_t index = self->_index;
  p_messagePartRange = &self->_messagePartRange;
  uint64_t v15 = objc_msgSend_visibleAssociatedMessageChatItems(self, v12, v13, v14);
  v17 = objc_msgSend__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_(v4, v16, (uint64_t)v8, (uint64_t)text, index, p_messagePartRange->location, p_messagePartRange->length, v15);

  return v17;
}

- (BOOL)canDelete
{
  v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  if (!objc_msgSend_isScheduledMessagesCoreEnabled(v5, v6, v7, v8))
  {

LABEL_7:
    v16 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v13, v14, v15);
    int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v16, v17, v18, v19);

    if (!isCarrierPigeonEnabled) {
      return 1;
    }
    v24 = objc_msgSend__item(self, v21, v22, v23);
    v28 = objc_msgSend_service(v24, v25, v26, v27);
    if (objc_msgSend_isEqualToString_(v28, v29, *MEMORY[0x1E4F6E1B8], v30))
    {
    }
    else
    {
      v38 = objc_msgSend_service(v24, v31, v32, v33);
      int isEqualToString = objc_msgSend_isEqualToString_(v38, v39, *MEMORY[0x1E4F6E1A8], v40);

      if (!isEqualToString) {
        goto LABEL_14;
      }
    }
    if (objc_msgSend_isFromMe(self, v34, v35, v36) && (objc_msgSend_isSent(v24, v42, v43, v44) & 1) == 0)
    {
      BOOL v37 = objc_msgSend_errorCode(v24, v45, v46, v47) != 0;
      goto LABEL_16;
    }
LABEL_14:
    BOOL v37 = 1;
LABEL_16:

    return v37;
  }
  uint64_t v12 = objc_msgSend_scheduleType(self, v9, v10, v11);

  if (v12 != 2) {
    goto LABEL_7;
  }

  return MEMORY[0x1F4181798](self, sel__canDeleteForCurrentScheduleState, v14, v15);
}

- (BOOL)_canDeleteForCurrentScheduleState
{
  unint64_t v4 = objc_msgSend_scheduleState(self, a2, v2, v3);
  return (v4 < 6) & (0x39u >> v4);
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (BOOL)isBusiness
{
  if (self->_isBusiness) {
    return 1;
  }
  v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_message(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_subject(v9, v10, v11, v12);
  char isMapKitBusiness = objc_msgSend_isMapKitBusiness(v13, v14, v15, v16);

  return isMapKitBusiness;
}

- (void)setSuggestedActionsList:(id)a3
{
}

- (void)setChipListFromText:(id)a3
{
  id v4 = (id)objc_msgSend_extractAndSetChipListFrom_(self, a2, (uint64_t)a3, v3);
}

- (void)setIsStewie:(BOOL)a3
{
  v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, v3);
  int v9 = objc_msgSend_stewieEnabled(v5, v6, v7, v8);

  if (v9)
  {
    objc_msgSend__item(self, v10, v11, v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIsStewie_(v15, v13, 1, v14);
  }
}

- (BOOL)isStewie
{
  v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int v9 = objc_msgSend_stewieEnabled(v5, v6, v7, v8);

  if (!v9) {
    return 0;
  }
  uint64_t v13 = objc_msgSend__item(self, v10, v11, v12);
  if (objc_msgSend_isStewie(v13, v14, v15, v16))
  {
    char isStewie = 1;
  }
  else
  {
    v21 = objc_msgSend__item(self, v17, v18, v19);
    v25 = objc_msgSend_message(v21, v22, v23, v24);
    v29 = objc_msgSend_subject(v25, v26, v27, v28);
    char isStewie = objc_msgSend_isStewie(v29, v30, v31, v32);
  }
  return isStewie;
}

- (int64_t)stewieConversationID
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_stewieConversationID(v4, v5, v6, v7);

  return v8;
}

- (BOOL)canRetract
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_index(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_eligibilityForEditType_messagePartIndex_(v5, v10, 2, v9);
  uint64_t v12 = v11;
  if ((unint64_t)(v11 - 1) >= 8)
  {
    if (!v11 && IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 134217984;
        uint64_t v18 = 0;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Message can be retracted, message edit eligibility is %ld", (uint8_t *)&v17, 0xCu);
      }
    }
    BOOL v14 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 134217984;
        uint64_t v18 = v12;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Message cannot be retracted, message is not eligible to be edited. Edit Eligibility: %ld", (uint8_t *)&v17, 0xCu);
      }
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)hasSubject
{
  return 0;
}

- (BOOL)isCorrupt
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char isCorrupt = objc_msgSend_isCorrupt(v4, v5, v6, v7);

  return isCorrupt;
}

+ (id)_guidForMessage:(id)a3 url:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_guid(a3, v7, v8, v9);
  BOOL v14 = objc_msgSend_absoluteString(v6, v11, v12, v13);

  int v17 = objc_msgSend_stringWithFormat_(v5, v15, @"%@:%@", v16, v10, v14);

  return v17;
}

+ (id)_newMessagePartArrayForMessageItem:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__newMessagePartsForMessageItem_(a1, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
  }
  else
  {
    v9[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v9, 1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

+ (id)_newMessagePartsForMessageItem:(id)a3
{
  return (id)objc_msgSend__newMessagePartsForMessageItem_chatContext_(a1, a2, (uint64_t)a3, 0);
}

+ (id)_defaultRichLinkAllowlist
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], a2, @"icloud", @"com");
  v8[0] = v2;
  id v4 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], v3, @"appsto", @"re");
  v8[1] = v4;
  id v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, 2);

  return v6;
}

+ (id)_defaultRichLinkAllowListExceptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F6C3A8];
  uint64_t v3 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], a2, @"icloud", @"com");
  v5 = objc_msgSend_pairWithFirst_second_(v2, v4, (uint64_t)v3, (uint64_t)&unk_1EF914650);
  v9[0] = v5;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v9, 1);

  return v7;
}

+ (BOOL)_isPathExceptionToAllowlistedURL:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v5, 1, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v7, v8, @"richLink-whitelist-exceptions", v9);

  v79 = v10;
  if (objc_msgSend_count(v10, v11, v12, v13))
  {
    int v17 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v18 = v10;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v86, (uint64_t)v91, 16);
    if (v20)
    {
      uint64_t v24 = v20;
      uint64_t v25 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v87 != v25) {
            objc_enumerationMutation(v18);
          }
          uint64_t v27 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          if (objc_msgSend_count(v27, v21, v22, v23) == 3)
          {
            uint64_t v28 = (void *)MEMORY[0x1E4F6C3A8];
            v29 = objc_msgSend_objectAtIndexedSubscript_(v27, v21, 0, v23);
            uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v27, v30, 1, v31);
            v34 = objc_msgSend_pairWithFirst_second_(v28, v33, (uint64_t)v29, (uint64_t)v32);

            BOOL v37 = objc_msgSend_objectAtIndexedSubscript_(v27, v35, 2, v36);
            v39 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], v38, (uint64_t)v34, (uint64_t)v37);
            objc_msgSend_addObject_(v17, v40, (uint64_t)v39, v41);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v86, (uint64_t)v91, 16);
      }
      while (v24);
    }

    uint64_t v10 = v79;
  }
  else
  {
    int v17 = objc_msgSend__defaultRichLinkAllowListExceptions(a1, v14, v15, v16);
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v17;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v82, (uint64_t)v90, 16);
  if (v43)
  {
    uint64_t v47 = v43;
    uint64_t v48 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v83 != v48) {
          objc_enumerationMutation(obj);
        }
        v50 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        v51 = objc_msgSend_first(v50, v44, v45, v46);
        v55 = objc_msgSend_first(v51, v52, v53, v54);
        v59 = objc_msgSend_first(v50, v56, v57, v58);
        v63 = objc_msgSend_second(v59, v60, v61, v62);
        if (objc_msgSend___im_conformsToDomain_domainExtension_(v4, v64, (uint64_t)v55, (uint64_t)v63))
        {
          objc_msgSend_pathComponents(v4, v65, v66, v67);
          uint64_t v68 = v48;
          v70 = id v69 = v4;
          v74 = objc_msgSend_second(v50, v71, v72, v73);
          char isEqualToArray = objc_msgSend_isEqualToArray_(v70, v75, (uint64_t)v74, v76);

          id v4 = v69;
          uint64_t v48 = v68;

          if (isEqualToArray)
          {
            BOOL v77 = 1;
            goto LABEL_25;
          }
        }
        else
        {
        }
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v82, (uint64_t)v90, 16);
    }
    while (v47);
    BOOL v77 = 0;
LABEL_25:
    uint64_t v10 = v79;
  }
  else
  {
    BOOL v77 = 0;
  }

  return v77;
}

+ (BOOL)_isAllowlistedURL:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v5, 1, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v7, v8, @"richLink-whitelist", v9);

  if (objc_msgSend_count(v10, v11, v12, v13))
  {
    id v58 = a1;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v59 = v10;
    id v18 = v10;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v64, (uint64_t)v69, 16);
    if (v20)
    {
      uint64_t v24 = v20;
      uint64_t v25 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(v18);
          }
          uint64_t v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (objc_msgSend_count(v27, v21, v22, v23, v58) == 2)
          {
            uint64_t v28 = objc_msgSend_firstObject(v27, v21, v22, v23);
            uint64_t v32 = objc_msgSend_lastObject(v27, v29, v30, v31);
            v34 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], v33, (uint64_t)v28, (uint64_t)v32);
            objc_msgSend_addObject_(v17, v35, (uint64_t)v34, v36);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v64, (uint64_t)v69, 16);
      }
      while (v24);
    }

    a1 = v58;
    uint64_t v10 = v59;
  }
  else
  {
    objc_msgSend__defaultRichLinkAllowlist(a1, v14, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = v17;
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v60, (uint64_t)v68, 16);
  if (v39)
  {
    uint64_t v43 = v39;
    uint64_t v44 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v61 != v44) {
          objc_enumerationMutation(v37);
        }
        uint64_t v46 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        uint64_t v47 = objc_msgSend_first(v46, v40, v41, v42, v58);
        v51 = objc_msgSend_second(v46, v48, v49, v50);
        if (objc_msgSend___im_conformsToDomain_domainExtension_(v4, v52, (uint64_t)v47, (uint64_t)v51))
        {
          char isPathExceptionToAllowlistedURL = objc_msgSend__isPathExceptionToAllowlistedURL_(a1, v53, (uint64_t)v4, v54);

          if ((isPathExceptionToAllowlistedURL & 1) == 0)
          {
            BOOL v56 = 1;
            goto LABEL_25;
          }
        }
        else
        {
        }
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v60, (uint64_t)v68, 16);
    }
    while (v43);
  }
  BOOL v56 = 0;
LABEL_25:

  return v56;
}

+ (BOOL)_isAllowlistedRichLinkSender:(id)a3 isBusiness:(BOOL)a4
{
  int v4 = a4;
  id v5 = a3;
  if ((objc_msgSend_hasPrefix_(v5, v6, @"urn:biz:", v7) & 1) != 0 || v4)
  {
    if (objc_msgSend_length(v5, v8, v9, v10))
    {
      uint64_t v11 = IMSharedHelperBusinessAllowlist();
      LOBYTE(v4) = objc_msgSend_containsObject_(v11, v12, (uint64_t)v5, v13);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

+ (id)_additionalSupportedRichLinkSchemesForAllowlistedSender:(id)a3
{
  return &unk_1EF914668;
}

+ (id)_richLinkRangesForMessageText:(id)a3 sender:(id)a4 isAllowlistedRichLinkSender:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  if (v5)
  {
    uint64_t v11 = objc_msgSend__additionalSupportedRichLinkSchemesForAllowlistedSender_(a1, v8, (uint64_t)a4, v9);
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = IMRichLinkUtilitiesDetermineRichLinksInMessage(v10, v11);

  return v12;
}

+ (BOOL)_supportsRichLinkURL:(id)a3 forSender:(id)a4 isAllowlistedRichLinkSender:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v7 != 0;
  if (v7 && !a5)
  {
    if (IMIsRunningInUnitTesting()
      && (objc_msgSend_absoluteString(v7, v10, v11, v12),
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v16 = objc_msgSend_containsString_(v13, v14, @"split", v15),
          v13,
          (v16 & 1) != 0))
    {
      char v9 = 1;
    }
    else
    {
      id v17 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v10, v11, v12);
      uint64_t v20 = objc_msgSend_dataSourceClassForBundleID_(v17, v18, *MEMORY[0x1E4F6CC10], v19);

      char v9 = objc_msgSend_supportsURL_(v20, v21, (uint64_t)v7, v22);
    }
  }

  return v9;
}

+ (id)_newMessagePartsForMessageItem:(id)a3 chatContext:(id)a4
{
  return (id)objc_msgSend__newMessagePartsForMessageItem_chatContext_photosPluginPayload_(a1, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

+ (id)messageBodyStringForCMMMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v8 = objc_msgSend_fileTransferGUIDs(v3, v5, v6, v7);
  unint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);
  unint64_t CMMAssetOffset = objc_msgSend_getCMMAssetOffset(v3, v13, v14, v15);
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v38 = v12;
      __int16 v39 = 2048;
      unint64_t v40 = CMMAssetOffset;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "CMM has %lu transfers, ignoring %lu", buf, 0x16u);
    }
  }
  if (CMMAssetOffset < v12)
  {
    v21 = (const void *)*MEMORY[0x1E4F6C188];
    uint64_t v22 = *MEMORY[0x1E4F6C110];
    do
    {
      uint64_t v23 = objc_msgSend_objectAtIndex_(v8, v17, CMMAssetOffset, v19);
      uint64_t v24 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v25 = v24;
      if (v23) {
        CFDictionarySetValue(v24, v21, v23);
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
      uint64_t v28 = objc_msgSend_initWithString_attributes_(v26, v27, v22, (uint64_t)v25);
      objc_msgSend_appendAttributedString_(v4, v29, (uint64_t)v28, v30);

      ++CMMAssetOffset;
    }
    while (v12 != CMMAssetOffset);
  }
  uint64_t v31 = objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(v4, v17, v18, v19);
  uint64_t v35 = objc_msgSend_mutableCopy(v31, v32, v33, v34);

  return v35;
}

+ (id)_newDetonatedMessagePartsForMessageItem:(id)a3 chatContext:(id)a4 photosPluginPayload:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend_isCorrupt(v7, v10, v11, v12))
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v17 = IMCoreLocalizedString(@"CORRUPT_MESSAGE_FALLBACK_TEXT", @"Tap to show message");
    uint64_t v19 = objc_msgSend_initWithString_attributes_(v16, v18, (uint64_t)v17, 0);

    uint64_t v20 = [IMTextMessagePartChatItem alloc];
    uint64_t v24 = objc_msgSend_length(v19, v21, v22, v23);
    id isShowingEditHistory = (id)objc_msgSend__initWithItem_text_index_messagePartRange_subject_shouldDisplayLink_isShowingEditHistory_(v20, v25, (uint64_t)v7, (uint64_t)v19, 0, 0, v24, 0, 0);
  }
  else
  {
    uint64_t v27 = objc_msgSend_body(v7, v13, v14, v15);
    uint64_t v19 = objc_msgSend_mutableCopy(v27, v28, v29, v30);

    uint64_t v34 = objc_msgSend_mutableString(v19, v31, v32, v33);
    uint64_t v35 = *MEMORY[0x1E4F6C130];
    uint64_t v39 = objc_msgSend_length(v19, v36, v37, v38);
    objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v34, v40, v35, (uint64_t)&stru_1EF8E78C8, 0, 0, v39);

    uint64_t v82 = 0;
    long long v83 = &v82;
    uint64_t v84 = 0x3032000000;
    long long v85 = sub_1A4B344CC;
    long long v86 = sub_1A4B3434C;
    id v87 = 0;
    uint64_t v76 = 0;
    BOOL v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = sub_1A4B344CC;
    v80 = sub_1A4B3434C;
    id v81 = 0;
    uint64_t v44 = objc_msgSend_length(v19, v41, v42, v43);
    uint64_t v48 = objc_msgSend_subject(v7, v45, v46, v47);
    if (v48)
    {
      id v49 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v53 = objc_msgSend_subject(v7, v50, v51, v52);
      BOOL v56 = objc_msgSend_initWithString_(v49, v54, (uint64_t)v53, v55);
    }
    else
    {
      BOOL v56 = 0;
    }

    if (objc_msgSend_length(v19, v57, v58, v59))
    {
      uint64_t v60 = *MEMORY[0x1E4F6C1F8];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = sub_1A4B9737C;
      v68[3] = &unk_1E5B7C820;
      uint64_t v74 = 0;
      uint64_t v75 = v44;
      id v69 = v19;
      id v70 = v7;
      id v71 = v56;
      uint64_t v72 = &v82;
      uint64_t v73 = &v76;
      objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v69, v61, v60, 0, v44, 0, v68);

      long long v62 = v69;
    }
    else
    {
      long long v63 = [IMDetonatedMessagePartChatItem alloc];
      uint64_t v65 = objc_msgSend__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_(v63, v64, (uint64_t)v7, 0, 0, 0, 0, v56, 0);
      long long v62 = (void *)v83[5];
      v83[5] = v65;
    }

    long long v66 = (void *)v83[5];
    if (!v66) {
      long long v66 = (void *)v77[5];
    }
    id isShowingEditHistory = v66;

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(&v82, 8);
  }
  return isShowingEditHistory;
}

+ (id)_singleChatItemForDeviceActionMessage:(id)a3 context:(id)a4 pluginPayload:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_serviceType(v9, v10, v11, v12);
  int v17 = objc_msgSend_areSendersUnknown(v9, v14, v15, v16);

  v21 = [IMTranscriptPluginChatItem alloc];
  uint64_t v22 = 1;
  if (v17 && v13 != 3) {
    uint64_t v22 = objc_msgSend_isFromMe(v7, v18, v19, v20);
  }
  HasKnownParticipants = objc_msgSend__initWithItem_initialPayload_index_messagePartRange_parentChatHasKnownParticipants_(v21, v18, (uint64_t)v7, (uint64_t)v8, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v22);

  return HasKnownParticipants;
}

+ (id)_newMessagePartsForMessageItem:(id)a3 chatContext:(id)a4 photosPluginPayload:(id)a5
{
  uint64_t v390 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!objc_msgSend_wasDetonated(v8, v11, v12, v13))
  {
    id v329 = v10;
    uint64_t v328 = objc_msgSend_serviceType(v9, v14, v15, v16);
    BOOL v18 = v328 == 3;
    char v324 = objc_msgSend_areSendersUnknown(v9, v19, v20, v21);
    if (!v9 || objc_msgSend_serviceType(v9, v22, v23, v24) == 1) {
      goto LABEL_5;
    }
    if (objc_msgSend_serviceType(v9, v22, v23, v24) == 5)
    {
      long long v86 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v83, v84, v85);
      char isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v86, v87, v88, v89);

      BOOL v18 = v328 == 3;
    }
    else
    {
      if ((objc_msgSend_hasResponded(v9, v83, v84, v85) & 1) != 0
        || !objc_msgSend_filterCategory(v9, v22, v23, v24)
        || !objc_msgSend__isSenderUnknown(v8, v22, v23, v24))
      {
LABEL_5:
        char isTranscriptSharingEnabled = 1;
        goto LABEL_6;
      }
      if (IMOSLoggingEnabled())
      {
        v90 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v377 = 0;
          _os_log_impl(&dword_1A4AF7000, v90, OS_LOG_TYPE_INFO, "Not displaying link, sender is unknown and there's no reply in chat", v377, 2u);
        }
      }
      char isTranscriptSharingEnabled = 0;
    }
LABEL_6:
    *(void *)v377 = 0;
    v378 = v377;
    uint64_t v379 = 0x3032000000;
    v380 = sub_1A4B344CC;
    v381 = sub_1A4B3434C;
    id v382 = 0;
    uint64_t v371 = 0;
    v372 = &v371;
    uint64_t v373 = 0x3032000000;
    v374 = sub_1A4B344CC;
    v375 = sub_1A4B3434C;
    id v376 = 0;
    if (objc_msgSend_isCorrupt(v8, v22, v23, v24))
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28E48]);
      uint64_t v30 = IMCoreLocalizedString(@"CORRUPT_MESSAGE_FALLBACK_TEXT", @"Tap to show message");
      uint64_t v32 = objc_msgSend_initWithString_attributes_(v29, v31, (uint64_t)v30, 0);

      uint64_t v33 = [IMTextMessagePartChatItem alloc];
      uint64_t v37 = objc_msgSend_length(v32, v34, v35, v36);
      uint64_t isShowingEditHistory = objc_msgSend__initWithItem_text_index_messagePartRange_subject_shouldDisplayLink_isShowingEditHistory_(v33, v38, (uint64_t)v8, (uint64_t)v32, 0, 0, v37, 0, 0);
      unint64_t v40 = (void *)*((void *)v378 + 5);
      *((void *)v378 + 5) = isShowingEditHistory;

      id v17 = *((id *)v378 + 5);
LABEL_142:

      _Block_object_dispose(&v371, 8);
      _Block_object_dispose(v377, 8);

      id v10 = v329;
      goto LABEL_143;
    }
    BOOL v314 = v18;
    uint64_t v41 = objc_msgSend_service(v8, v26, v27, v28);
    uint64_t v45 = objc_msgSend_iMessageService(IMServiceImpl, v42, v43, v44);
    id v49 = objc_msgSend_internalName(v45, v46, v47, v48);
    int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v41, v50, (uint64_t)v49, v51);

    uint64_t v56 = 2000;
    if (isEqualToIgnoringCase) {
      uint64_t v56 = 4000;
    }
    obuint64_t j = (id)v56;
    unint64_t CMMState = objc_msgSend_getCMMState(v8, v53, v54, v55);
    if (CMMState
      || (objc_msgSend_balloonBundleID(v8, v57, v58, v59),
          long long v61 = objc_claimAutoreleasedReturnValue(),
          IMBalloonExtensionIDWithSuffix(),
          long long v62 = objc_claimAutoreleasedReturnValue(),
          char isEqualToString = objc_msgSend_isEqualToString_(v61, v63, (uint64_t)v62, v64),
          v62,
          v61,
          (isEqualToString & 1) != 0))
    {
      long long v66 = objc_msgSend_sharedInstance(IMCoreAccountsMonitor, v57, v58, v59);
      char isSignedIntoiCloud = objc_msgSend_isSignedIntoiCloud(v66, v67, v68, v69);

      if (CMMState < 4) {
        char v73 = isSignedIntoiCloud;
      }
      else {
        char v73 = 0;
      }
      char v312 = isSignedIntoiCloud ^ 1;
      char v310 = v73;
      if (CMMState)
      {
        uint64_t v32 = objc_msgSend_messageBodyStringForCMMMessage_(a1, v71, (uint64_t)v8, v72);
        if (IMOSLoggingEnabled())
        {
          BOOL v77 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_guid(v8, v78, v79, v80);
            id v81 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v81;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = CMMState;
            *(_WORD *)&buf[22] = 2112;
            v389 = v32;
            _os_log_impl(&dword_1A4AF7000, v77, OS_LOG_TYPE_INFO, "Using Dynamic body for CMM %@, state %lu: %@", buf, 0x20u);
          }
        }
        if (v32)
        {
          char v321 = 1;
          if (objc_msgSend_length(v32, v74, v75, v76)) {
            goto LABEL_43;
          }
          goto LABEL_38;
        }
      }
      else
      {
        v91 = IMLogHandleForCategory();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
          sub_1A4CB7A80();
        }

        uint64_t v32 = 0;
      }
      char v321 = 1;
    }
    else
    {
      uint64_t v32 = 0;
      char v312 = 0;
      char v321 = 0;
      char v310 = 0;
    }
LABEL_38:
    id v92 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v93 = v8;
    if (objc_msgSend_hasDataDetectorResults(v93, v94, v95, v96)
      && (objc_msgSend_body(v93, v97, v98, v99),
          v100 = objc_claimAutoreleasedReturnValue(),
          BOOL v104 = objc_msgSend_length(v100, v101, v102, v103) < (unint64_t)obj,
          v100,
          v104))
    {
      v105 = objc_msgSend_body(v93, v97, v98, v99);
      v106 = sub_1A4C3DD1C(v105);
    }
    else
    {
      v106 = objc_msgSend_body(v93, v97, v98, v99);
    }

    uint64_t v109 = objc_msgSend_initWithAttributedString_(v92, v107, (uint64_t)v106, v108);
    uint64_t v32 = (void *)v109;
LABEL_43:
    uint64_t v387 = *MEMORY[0x1E4F6C1D0];
    v110 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v82, (uint64_t)&v387, 1);
    int v113 = objc_msgSend___im_containsAttributedValue_(v32, v111, (uint64_t)v110, v112);

    if (v113) {
      IMRemoveTrackingInformationFromMutableAttributedString(v32);
    }
    v117 = objc_msgSend_sender(v8, v114, v115, v116);
    uint64_t isBusiness = objc_msgSend__isAllowlistedRichLinkSender_isBusiness_(a1, v118, (uint64_t)v117, v328 == 3);

    if (CMMState || !objc_msgSend_hasDataDetectorResults(v8, v120, v121, v122))
    {
      v327 = 0;
    }
    else
    {
      v123 = objc_msgSend_sender(v8, v120, v121, v122);
      v327 = objc_msgSend__richLinkRangesForMessageText_sender_isAllowlistedRichLinkSender_(a1, v124, (uint64_t)v32, (uint64_t)v123, isBusiness);
    }
    if (isTranscriptSharingEnabled)
    {
      BOOL v125 = 1;
    }
    else if (objc_msgSend_count(v327, v120, v121, v122))
    {
      v126 = objc_msgSend_string(v32, v120, v121, v122);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v389) = 0;
      v367[0] = MEMORY[0x1E4F143A8];
      v367[1] = 3221225472;
      v367[2] = sub_1A4B988B8;
      v367[3] = &unk_1E5B7C848;
      id v127 = v126;
      id v370 = a1;
      id v368 = v127;
      v369 = buf;
      objc_msgSend_enumerateObjectsUsingBlock_(v327, v128, (uint64_t)v367, v129);
      BOOL v125 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

      _Block_object_dispose(buf, 8);
    }
    else
    {
      BOOL v125 = 0;
    }
    if ((v321 & 1) == 0)
    {
      v130 = objc_msgSend_mutableString(v32, v120, v121, v122);
      uint64_t v134 = objc_msgSend_length(v32, v131, v132, v133);
      objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v130, v135, *MEMORY[0x1E4F6C130], (uint64_t)&stru_1EF8E78C8, 0, 0, v134);
    }
    unint64_t v316 = objc_msgSend_length(v32, v120, v121, v122);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v389) = 0;
    v320 = objc_msgSend_retractedPartIndexes(v8, v136, v137, v138);
    v140 = objc_msgSend_richCardsChatItemsForMessageItem_text_(a1, v139, (uint64_t)v8, (uint64_t)v32);
    v142 = v140;
    if (v140)
    {
      id v17 = v140;
LABEL_141:

      _Block_object_dispose(buf, 8);
      goto LABEL_142;
    }
    v143 = objc_msgSend_standaloneChipListChatItemForMessageItem_text_(a1, v141, (uint64_t)v8, (uint64_t)v32);
    v144 = v143;
    if (v143)
    {
      id v17 = v143;
LABEL_140:

      v142 = 0;
      goto LABEL_141;
    }
    char v308 = v324 ^ 1;
    uint64_t v325 = *MEMORY[0x1E4F6C1F8];
    v346[0] = MEMORY[0x1E4F143A8];
    v346[1] = 3221225472;
    v346[2] = sub_1A4B98988;
    v346[3] = &unk_1E5B7C898;
    uint64_t v355 = 0;
    unint64_t v356 = v316;
    id v347 = v32;
    id v145 = v8;
    id v348 = v145;
    id v357 = a1;
    char v360 = v310;
    char v361 = v312;
    id v309 = v320;
    id v349 = v309;
    v352 = buf;
    char v362 = v321;
    id v313 = v9;
    id v350 = v313;
    v353 = v377;
    v354 = &v371;
    unint64_t v358 = v316;
    id v359 = obj;
    BOOL v363 = v125;
    char v364 = isBusiness;
    id v351 = v327;
    BOOL v365 = v314;
    char v366 = v308;
    v311 = v347;
    objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v347, v146, v325, 0, v316, 0, v346);
    v326 = v145;
    v315 = objc_msgSend_subject(v145, v147, v148, v149);
    if (!v315)
    {
LABEL_79:
      if (v316 > (unint64_t)obj)
      {
        if (*((void *)v378 + 5))
        {
          id v219 = objc_alloc(MEMORY[0x1E4F1C978]);
          id obja = (id)objc_msgSend_initWithObjects_(v219, v220, *((void *)v378 + 5), v221, 0);
          v222 = [IMAggregateMessagePartChatItem alloc];
          uint64_t v224 = objc_msgSend__initWithItem_messagePartRange_subparts_(v222, v223, (uint64_t)v326, 0, v316, obja);
          v225 = (void *)*((void *)v378 + 5);
          *((void *)v378 + 5) = v224;

          objc_msgSend_setChipListFromText_(*((void **)v378 + 5), v226, (uint64_t)v311, v227);
        }
        else
        {
          if (!v372[5]) {
            goto LABEL_83;
          }
          long long v344 = 0u;
          long long v345 = 0u;
          long long v342 = 0u;
          long long v343 = 0u;
          id obja = (id)v372[5];
          uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v229, (uint64_t)&v342, (uint64_t)v386, 16);
          if (!v230)
          {
LABEL_96:

            v250 = [IMAggregateMessagePartChatItem alloc];
            uint64_t v252 = objc_msgSend__initWithItem_messagePartRange_subparts_(v250, v251, (uint64_t)v326, 0, v316, v372[5]);
            v253 = (void *)*((void *)v378 + 5);
            *((void *)v378 + 5) = v252;

            objc_msgSend_setChipListFromText_(*((void **)v378 + 5), v254, (uint64_t)v311, v255);
            id objb = (id)v372[5];
            v372[5] = 0;

            goto LABEL_83;
          }
          uint64_t v323 = *(void *)v343;
LABEL_89:
          uint64_t v231 = 0;
          while (1)
          {
            if (*(void *)v343 != v323) {
              objc_enumerationMutation(obja);
            }
            v232 = *(void **)(*((void *)&v342 + 1) + 8 * v231);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v236 = objc_msgSend_transferGUID(v232, v233, v234, v235);
              v240 = objc_msgSend_sharedInstance(IMFileTransferCenter, v237, v238, v239);
              v243 = objc_msgSend_transferForGUID_(v240, v241, (uint64_t)v236, v242);

              v247 = objc_msgSend_type(v243, v244, v245, v246);
              LODWORD(v240) = objc_msgSend__shouldAggregateForTransferType_(a1, v248, (uint64_t)v247, v249);

              if (!v240) {
                break;
              }
            }
            if (v230 == ++v231)
            {
              uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v233, (uint64_t)&v342, (uint64_t)v386, 16);
              if (v230) {
                goto LABEL_89;
              }
              goto LABEL_96;
            }
          }
        }
      }
LABEL_83:
      if (v328 == 3)
      {
        v228 = (void *)*((void *)v378 + 5);
        if (v228)
        {
          objc_msgSend_setIsBusiness_(v228, v150, 1, v152);
        }
        else if (v372[5])
        {
          long long v340 = 0u;
          long long v341 = 0u;
          long long v338 = 0u;
          long long v339 = 0u;
          id v256 = (id)v372[5];
          uint64_t v260 = objc_msgSend_countByEnumeratingWithState_objects_count_(v256, v257, (uint64_t)&v338, (uint64_t)v385, 16);
          if (v260)
          {
            uint64_t v261 = *(void *)v339;
            do
            {
              for (uint64_t i = 0; i != v260; ++i)
              {
                if (*(void *)v339 != v261) {
                  objc_enumerationMutation(v256);
                }
                objc_msgSend_setIsBusiness_(*(void **)(*((void *)&v338 + 1) + 8 * i), v258, 1, v259);
              }
              uint64_t v260 = objc_msgSend_countByEnumeratingWithState_objects_count_(v256, v258, (uint64_t)&v338, (uint64_t)v385, 16);
            }
            while (v260);
          }
        }
      }
      if (objc_msgSend_serviceType(v313, v150, v151, v152) == 4)
      {
        v266 = (void *)*((void *)v378 + 5);
        if (v266)
        {
          objc_msgSend_setIsStewie_(v266, v263, 1, v265);
        }
        else if (v372[5])
        {
          long long v336 = 0u;
          long long v337 = 0u;
          long long v334 = 0u;
          long long v335 = 0u;
          id v267 = (id)v372[5];
          uint64_t v271 = objc_msgSend_countByEnumeratingWithState_objects_count_(v267, v268, (uint64_t)&v334, (uint64_t)v384, 16);
          if (v271)
          {
            uint64_t v272 = *(void *)v335;
            do
            {
              for (uint64_t j = 0; j != v271; ++j)
              {
                if (*(void *)v335 != v272) {
                  objc_enumerationMutation(v267);
                }
                objc_msgSend_setIsStewie_(*(void **)(*((void *)&v334 + 1) + 8 * j), v269, 1, v270);
              }
              uint64_t v271 = objc_msgSend_countByEnumeratingWithState_objects_count_(v267, v269, (uint64_t)&v334, (uint64_t)v384, 16);
            }
            while (v271);
          }
        }
      }
      if (objc_msgSend_isPendingSatelliteSend(v326, v263, v264, v265))
      {
        v276 = (void *)*((void *)v378 + 5);
        if (v276)
        {
          objc_msgSend_setPendingSatelliteSend_(v276, v274, 1, v275);
        }
        else if (v372[5])
        {
          long long v332 = 0u;
          long long v333 = 0u;
          long long v330 = 0u;
          long long v331 = 0u;
          id v277 = (id)v372[5];
          uint64_t v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v277, v278, (uint64_t)&v330, (uint64_t)v383, 16);
          if (v281)
          {
            uint64_t v282 = *(void *)v331;
            do
            {
              for (uint64_t k = 0; k != v281; ++k)
              {
                if (*(void *)v331 != v282) {
                  objc_enumerationMutation(v277);
                }
                objc_msgSend_setPendingSatelliteSend_(*(void **)(*((void *)&v330 + 1) + 8 * k), v279, 1, v280);
              }
              uint64_t v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v277, v279, (uint64_t)&v330, (uint64_t)v383, 16);
            }
            while (v281);
          }
        }
      }
      uint64_t v284 = objc_msgSend_aggregatePartsForParts_forMessage_context_text_(a1, v274, v372[5], (uint64_t)v326, v313, v311);
      v285 = (void *)v372[5];
      v372[5] = v284;

      if (objc_msgSend_count(v309, v286, v287, v288) && objc_msgSend_scheduleType(v326, v289, v290, v291) != 2)
      {
        v294 = v372;
        if (!v372[5])
        {
          id v295 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v296 = (void *)v372[5];
          v372[5] = (uint64_t)v295;

          v294 = v372;
        }
        uint64_t v297 = *((void *)v378 + 5);
        if (v297)
        {
          objc_msgSend_addObject_((void *)v294[5], v292, v297, v293);
          v298 = (void *)*((void *)v378 + 5);
          *((void *)v378 + 5) = 0;

          v294 = v372;
        }
        uint64_t v299 = objc_msgSend__retractedMessagePartsForMessage_parts_retractedPartIndexes_(a1, v292, (uint64_t)v326, v294[5], v309);
        v300 = (void *)v372[5];
        v372[5] = v299;
      }
      v301 = (void *)*((void *)v378 + 5);
      if (!v301) {
        v301 = (void *)v372[5];
      }
      id v302 = v301;
      v305 = objc_msgSend__processChatItemsForRichActions_(a1, v303, (uint64_t)v302, v304);

      id v17 = v305;
      v144 = 0;
      goto LABEL_140;
    }
    id v153 = objc_alloc(MEMORY[0x1E4F28B18]);
    v159 = objc_msgSend_initWithString_(v153, v154, (uint64_t)v315, v155);
    v160 = (void *)*((void *)v378 + 5);
    if (v160)
    {
      id v161 = v160;
    }
    else
    {
      if (!objc_msgSend_count((void *)v372[5], v156, v157, v158))
      {
        id v164 = 0;
        goto LABEL_66;
      }
      objc_msgSend_objectAtIndex_((void *)v372[5], v162, 0, v163);
      id v161 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v164 = v161;
LABEL_66:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend_index(v164, v165, v166, v167))
    {
      uint64_t v190 = objc_msgSend_index(v164, v165, v166, v167);
      v194 = objc_msgSend_guid(v326, v191, v192, v193);
      uint64_t v196 = objc_msgSend_chatItemGUIDForMessageGUID_partIndex_(IMMessagePartChatItem, v195, (uint64_t)v194, v190);
      uint64_t v322 = v190;

      v200 = objc_msgSend_showingEditHistoryForChatItemGUIDs(v313, v197, v198, v199);
      char v307 = objc_msgSend_containsObject_(v200, v201, v196, v202);

      v203 = [IMTextMessagePartChatItem alloc];
      v207 = objc_msgSend__item(v164, v204, v205, v206);
      v211 = objc_msgSend_text(v164, v208, v209, v210);
      v213 = objc_msgSend__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_(v203, v212, (uint64_t)v207, (uint64_t)v211, v322, 0, v316, v159, v307);

      objc_msgSend_setChipListFromText_(v213, v214, (uint64_t)v311, v215);
      v217 = (void *)v196;
      v218 = v378;
      if (!*((void *)v378 + 5))
      {
        objc_msgSend_replaceObjectAtIndex_withObject_((void *)v372[5], v216, 0, (uint64_t)v213);
        v170 = v217;
        goto LABEL_78;
      }
      id v164 = v213;
      v181 = (void *)*((void *)v218 + 5);
      *((void *)v218 + 5) = v164;
      v170 = v217;
    }
    else
    {
      v168 = objc_msgSend_guid(v326, v165, v166, v167);
      v170 = objc_msgSend_chatItemGUIDForMessageGUID_partIndex_(IMMessagePartChatItem, v169, (uint64_t)v168, -1);

      v174 = objc_msgSend_showingEditHistoryForChatItemGUIDs(v313, v171, v172, v173);
      LOBYTE(v168) = objc_msgSend_containsObject_(v174, v175, (uint64_t)v170, v176);

      v177 = [IMTextMessagePartChatItem alloc];
      v181 = objc_msgSend__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_(v177, v178, (uint64_t)v326, 0, -1, 0, v316, v159, (_BYTE)v168);
      v182 = (void *)v372[5];
      if (*((void *)v378 + 5))
      {
        if (!v182)
        {
          id v183 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v184 = (void *)v372[5];
          v372[5] = (uint64_t)v183;

          v182 = (void *)v372[5];
        }
        objc_msgSend_addObject_(v182, v179, (uint64_t)v181, v180);
        objc_msgSend_addObject_((void *)v372[5], v185, *((void *)v378 + 5), v186);
        v187 = (void *)*((void *)v378 + 5);
        *((void *)v378 + 5) = 0;
      }
      else
      {
        if (!v182)
        {
          id v188 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v189 = (void *)v372[5];
          v372[5] = (uint64_t)v188;

          v182 = (void *)v372[5];
        }
        objc_msgSend_insertObject_atIndex_(v182, v179, (uint64_t)v181, 0);
      }
    }

    v213 = v164;
LABEL_78:

    goto LABEL_79;
  }
  id v17 = (id)objc_msgSend__newDetonatedMessagePartsForMessageItem_chatContext_photosPluginPayload_(a1, v14, (uint64_t)v8, (uint64_t)v9, v10);
LABEL_143:

  return v17;
}

+ (id)_processChatItemsForRichActions:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    uint64_t v11 = v4;
LABEL_6:
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    uint64_t v12 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v5, v6, v7);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = sub_1A4B9A170;
    uint64_t v30 = &unk_1E5B7C8C0;
    id v14 = v11;
    id v31 = v14;
    id v15 = v13;
    id v32 = v15;
    id v16 = v12;
    id v33 = v16;
    uint64_t v34 = v35;
    objc_msgSend_enumerateObjectsUsingBlock_(v14, v17, (uint64_t)&v27, v18);
    objc_msgSend_insertObjects_atIndexes_(v14, v19, (uint64_t)v15, (uint64_t)v16, v27, v28, v29, v30);
    uint64_t v20 = v33;
    id v21 = v14;

    _Block_object_dispose(v35, 8);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)objc_msgSend_mutableCopy(v3, v8, v9, v10);
    goto LABEL_5;
  }
  if (v3)
  {
    v36[0] = v3;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v36, 1);
    uint64_t v11 = objc_msgSend_mutableCopy(v23, v24, v25, v26);

    goto LABEL_6;
  }
  id v21 = 0;
LABEL_7:

  return v21;
}

+ (id)richCardsChatItemsForMessageItem:(id)a3 text:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v6, v7, v8, v9) == 1
    && (objc_msgSend_string(v6, v10, v11, v12),
        id v13 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_substringToIndex_(v13, v14, 1, v15),
        id v16 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x1E4F6DF68], v18),
        v16,
        v13,
        isEqualToString))
  {
    id v21 = objc_msgSend_attributesAtIndex_effectiveRange_(v6, v20, 0, 0);
    uint64_t v24 = objc_msgSend__arrayForKey_(v21, v22, *MEMORY[0x1E4F6DF60], v23);
    id v25 = objc_alloc(MEMORY[0x1E4F6E920]);
    if (v24) {
      uint64_t v28 = objc_msgSend_initWithCardArray_(v25, v26, (uint64_t)v24, v27);
    }
    else {
      uint64_t v28 = objc_msgSend_initWithCardArray_(v25, v26, MEMORY[0x1E4F1CBF0], v27);
    }
    if (v28)
    {
      id v31 = (void *)v28;
      id v127 = v21;
      uint64_t v32 = objc_msgSend__dictionaryForKey_(v21, v29, *MEMORY[0x1E4F6E4B8], v30);
      if (v32)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F6EAC0]);
        uint64_t v36 = objc_msgSend_initWithUrlToTransferGuids_(v33, v34, v32, v35);
        if (v36)
        {
          uint64_t v39 = (void *)v36;
          objc_msgSend_updateUrlToTransferMap_(v31, v37, v36, v38);
        }
      }
      uint64_t v125 = v32;
      unint64_t v40 = [IMRichLinkCardMessagePartChatItem alloc];
      uint64_t v44 = objc_msgSend_selectedRichCardIndex(v5, v41, v42, v43);
      uint64_t v46 = objc_msgSend_initWithItem_richCards_selectedIndex_(v40, v45, (uint64_t)v5, (uint64_t)v31, v44);
      v128 = objc_msgSend_suggestedRepliesList(v31, v47, v48, v49);
      uint64_t v50 = [IMRichActionFooterChatItem alloc];
      uint64_t v129 = objc_msgSend__initWithItem_(v50, v51, (uint64_t)v5, v52);
      id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v57 = objc_msgSend_richCards(v46, v54, v55, v56);
      long long v61 = objc_msgSend_cards(v57, v58, v59, v60);
      unint64_t v65 = objc_msgSend_count(v61, v62, v63, v64);

      if (v65 >= 2)
      {
        uint64_t v69 = [IMRichActionCarouselCountChatItem alloc];
        uint64_t v73 = objc_msgSend_selectedRichCardIndex(v5, v70, v71, v72);
        BOOL v77 = objc_msgSend_richCards(v46, v74, v75, v76);
        id v81 = objc_msgSend_cards(v77, v78, v79, v80);
        uint64_t v85 = objc_msgSend_count(v81, v82, v83, v84);
        id v87 = objc_msgSend__initWithItem_selectedIndex_totalCount_(v69, v86, (uint64_t)v5, v73, v85);

        objc_msgSend_addObject_(v53, v88, (uint64_t)v87, v89);
      }
      if (objc_msgSend_count(v128, v66, v67, v68, v125))
      {
        id v93 = [IMSuggestedRepliesMessagePartChatItem alloc];
        uint64_t v97 = objc_msgSend_selectedRichCardIndex(v5, v94, v95, v96);
        uint64_t v99 = objc_msgSend_initWithItem_suggestedRepliesList_selectedIndex_(v93, v98, (uint64_t)v5, (uint64_t)v128, v97);
        uint64_t v103 = objc_msgSend_suggestedActionsList(v31, v100, v101, v102);
        uint64_t v107 = objc_msgSend_count(v103, v104, v105, v106);

        objc_msgSend_addObject_(v53, v108, (uint64_t)v46, v109);
        objc_msgSend_addObject_(v53, v110, (uint64_t)v99, v111);
        if (v107) {
          objc_msgSend_addObject_(v53, v112, (uint64_t)v129, v113);
        }

        v114 = v126;
        id v21 = v127;
      }
      else
      {
        uint64_t v115 = objc_msgSend_suggestedActionsList(v31, v90, v91, v92);
        uint64_t v119 = objc_msgSend_count(v115, v116, v117, v118);

        objc_msgSend_addObject_(v53, v120, (uint64_t)v46, v121);
        v114 = v126;
        id v21 = v127;
        if (v119) {
          objc_msgSend_addObject_(v53, v122, (uint64_t)v129, v123);
        }
      }
    }
    else
    {
      id v53 = 0;
    }
  }
  else
  {
    id v53 = 0;
  }

  return v53;
}

+ (id)standaloneChipListChatItemForMessageItem:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_length(v7, v8, v9, v10) == 1
    && (objc_msgSend_string(v7, v11, v12, v13),
        id v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_substringToIndex_(v14, v15, 1, v16),
        id v17 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E4F6CE60], v19),
        v17,
        v14,
        isEqualToString))
  {
    uint64_t v22 = objc_msgSend_attributesAtIndex_effectiveRange_(v7, v21, 0, 0);
    if (objc_msgSend_isFromMe(v6, v23, v24, v25))
    {
      uint64_t v28 = objc_msgSend__dictionaryForKey_(v22, v26, *MEMORY[0x1E4F6E3E8], v27);
      id v29 = objc_alloc(MEMORY[0x1E4F6E698]);
      uint64_t v32 = objc_msgSend_initWithDictionary_(v29, v30, (uint64_t)v28, v31);
      if (v32)
      {
        id v33 = [IMSuggestedReplyMessagePartChatItem alloc];
        uint64_t v35 = objc_msgSend_initWithItem_suggestedReply_(v33, v34, (uint64_t)v6, (uint64_t)v32);
      }
      else
      {

        uint64_t v35 = 0;
      }
    }
    else
    {
      uint64_t v36 = objc_msgSend_suggestedRepliesMessagePartChatItemForMessageItem_attributes_(a1, v26, (uint64_t)v6, (uint64_t)v22);
      uint64_t v28 = v36;
      if (v36)
      {
        id v38 = v36;
        uint64_t v28 = v38;
      }
      else
      {
        objc_msgSend_suggestedActionsMessagePartChatItemForMessageItem_attributes_(a1, v37, (uint64_t)v6, (uint64_t)v22);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v35 = v38;
    }
  }
  else
  {
    uint64_t v35 = 0;
  }

  return v35;
}

+ (BOOL)isChatBotContentOnly:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6) == 1)
  {
    uint64_t v10 = objc_msgSend_string(v3, v7, v8, v9);
    uint64_t v13 = objc_msgSend_substringToIndex_(v10, v11, 1, v12);
    char isEqualToString = objc_msgSend_isEqualToString_(v13, v14, *MEMORY[0x1E4F6CE60], v15);

    uint64_t v20 = objc_msgSend_string(v3, v17, v18, v19);
    uint64_t v23 = objc_msgSend_substringToIndex_(v20, v21, 1, v22);
    char v26 = objc_msgSend_isEqualToString_(v23, v24, *MEMORY[0x1E4F6DF68], v25);

    char v27 = v26 | isEqualToString;
  }
  else
  {
    char v27 = 0;
  }

  return v27;
}

+ (id)suggestedRepliesMessagePartChatItemForMessageItem:(id)a3 attributes:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend__numberForKey_(v6, v7, *MEMORY[0x1E4F6CE68], v8);
  if (objc_msgSend_BOOLValue(v9, v10, v11, v12))
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend__arrayForKey_(v6, v13, *MEMORY[0x1E4F6CE58], v14);
    id v17 = objc_alloc(MEMORY[0x1E4F6E690]);
    uint64_t v20 = objc_msgSend_initWithChipArray_(v17, v18, (uint64_t)v16, v19);
    uint64_t v24 = objc_msgSend_suggestedReplies(v20, v21, v22, v23);
    if (objc_msgSend_count(v24, v25, v26, v27))
    {
      uint64_t v31 = objc_msgSend_suggestedReplies(v20, v28, v29, v30);
      v41[0] = v31;
      id v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v41, 1);

      uint64_t v34 = [IMSuggestedRepliesMessagePartChatItem alloc];
      uint64_t v38 = objc_msgSend_selectedRichCardIndex(v5, v35, v36, v37);
      uint64_t v15 = objc_msgSend_initWithItem_suggestedRepliesList_selectedIndex_(v34, v39, (uint64_t)v5, (uint64_t)v33, v38);
    }
    else
    {
      uint64_t v15 = 0;
    }
  }

  return v15;
}

+ (id)suggestedActionsMessagePartChatItemForMessageItem:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend__arrayForKey_(a4, v6, *MEMORY[0x1E4F6CE58], v7);
  id v9 = objc_alloc(MEMORY[0x1E4F6E690]);
  uint64_t v12 = objc_msgSend_initWithChipArray_(v9, v10, (uint64_t)v8, v11);
  uint64_t v16 = objc_msgSend_suggestedActions(v12, v13, v14, v15);
  if (objc_msgSend_count(v16, v17, v18, v19))
  {
    uint64_t v20 = [IMSuggestedActionsMessagePartChatItem alloc];
    uint64_t v22 = objc_msgSend_initWithItem_suggestedActionsList_(v20, v21, (uint64_t)v5, (uint64_t)v16);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)_newAudioMessagePartsForMessageItem:(id)a3 text:(id)a4 chatContext:(id)a5 retractedPartIndexes:(id)a6 singlePart:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v20 = objc_msgSend_length(v13, v17, v18, v19);
  uint64_t v24 = objc_msgSend_fileTransferGUIDs(v12, v21, v22, v23);
  uint64_t v28 = objc_msgSend_firstObject(v24, v25, v26, v27);

  if (v28 && !objc_msgSend_count(v15, v29, v30, v31))
  {
    uint64_t v38 = [IMAudioMessageChatItem alloc];
    uint64_t v35 = objc_msgSend__initWithItem_text_index_messagePartRange_transferGUID_chatContext_(v38, v39, (uint64_t)v12, (uint64_t)v13, 0, 0, v20, v28, v14);
    BOOL v43 = objc_msgSend_serviceType(v14, v40, v41, v42) == 3;
    objc_msgSend_setIsBusiness_(v35, v44, v43, v45);
    uint64_t v36 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v46, (uint64_t)v35, v47);
LABEL_9:
    uint64_t v37 = (void *)v36;

    goto LABEL_10;
  }
  if (objc_msgSend_count(v15, v29, v30, v31))
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v35 = v32;
    if (v16) {
      objc_msgSend_addObject_(v32, v33, (uint64_t)v16, v34);
    }
    uint64_t v36 = objc_msgSend__retractedMessagePartsForMessage_parts_retractedPartIndexes_(a1, v33, (uint64_t)v12, (uint64_t)v35, v15);
    goto LABEL_9;
  }
  uint64_t v37 = 0;
LABEL_10:

  return v37;
}

+ (id)_retractedMessagePartsForMessage:(id)a3 parts:(id)a4 retractedPartIndexes:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v13 = objc_msgSend_mutableCopy(v8, v10, v11, v12);
  if (objc_msgSend_count(v9, v14, v15, v16))
  {
    uint64_t v42 = v13;
    uint64_t v20 = objc_msgSend_failedRetractPartIndexes(v7, v17, v18, v19);
    uint64_t v24 = objc_msgSend_editUnsupportedByHandleIDs(v7, v21, v22, v23);
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v26 = v24;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v28)
    {
      uint64_t v31 = v28;
      uint64_t v32 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v26);
          }
          uint64_t v36 = objc_msgSend__imHandleWithID_(v7, v29, *(void *)(*((void *)&v49 + 1) + 8 * i), v30);
          if (v36) {
            objc_msgSend_addObject_(v25, v34, (uint64_t)v36, v35);
          }
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v49, (uint64_t)v53, 16);
      }
      while (v31);
    }

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1A4B9AF4C;
    v43[3] = &unk_1E5B7C910;
    id v44 = v7;
    id v45 = v20;
    id v46 = v25;
    id v47 = v8;
    id v13 = v42;
    id v48 = v42;
    id v37 = v25;
    id v38 = v20;
    objc_msgSend_enumerateIndexesUsingBlock_(v9, v39, (uint64_t)v43, v40);
  }

  return v13;
}

+ (int64_t)_attachmentStackAggregationThreshold
{
  id v4 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int v8 = objc_msgSend_threeAttachmentStackEnabled(v4, v5, v6, v7);

  if (v8) {
    return 2;
  }
  else {
    return 3;
  }
}

+ (id)aggregatePartsForParts:(id)a3 forMessage:(id)a4 context:(id)a5 text:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_mutableCopy(v9, v13, v14, v15);
  if (objc_msgSend_count(v16, v17, v18, v19))
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v24 = objc_msgSend_count(v16, v21, v22, v23);
    uint64_t v27 = objc_msgSend_initWithCapacity_(v20, v25, v24, v26);
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = sub_1A4B344CC;
    v58[4] = sub_1A4B3434C;
    id v59 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4B9B478;
    aBlock[3] = &unk_1E5B7C938;
    id v55 = v10;
    id v56 = v11;
    id v28 = v12;
    id v57 = v28;
    uint64_t v29 = _Block_copy(aBlock);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1A4B9B68C;
    v49[3] = &unk_1E5B7C960;
    id v53 = v58;
    id v30 = v29;
    id v52 = v30;
    id v31 = v27;
    id v50 = v31;
    id v51 = v28;
    uint64_t v32 = _Block_copy(v49);
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    id v44 = sub_1A4B9B868;
    id v45 = &unk_1E5B7C988;
    id v48 = v58;
    id v33 = v31;
    id v46 = v33;
    uint64_t v34 = v32;
    id v47 = v34;
    objc_msgSend_enumerateObjectsUsingBlock_(v16, v35, (uint64_t)&v42, v36);
    v34[2](v34);
    uint64_t v40 = objc_msgSend_copy(v33, v37, v38, v39, v42, v43, v44, v45);

    _Block_object_dispose(v58, 8);
    uint64_t v16 = (void *)v40;
  }

  return v16;
}

+ (id)messageBodyStringForAttachmentGUIDs:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v29;
    key = (void *)*MEMORY[0x1E4F6C188];
    id v11 = (const void *)*MEMORY[0x1E4F6C120];
    id v12 = (const void *)*MEMORY[0x1E4F6C1F8];
    uint64_t v13 = *MEMORY[0x1E4F6C110];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(const void **)(*((void *)&v28 + 1) + 8 * i);
        if (v15) {
          CFDictionarySetValue(v5, key, v15);
        }
        CFDictionarySetValue(v5, v11, &unk_1EF9144D0);
        uint64_t v18 = objc_msgSend_numberWithInt_(NSNumber, v16, v9 + i, v17);
        if (v18) {
          CFDictionarySetValue(v5, v12, v18);
        }

        id v19 = objc_alloc(MEMORY[0x1E4F28E48]);
        id v21 = objc_msgSend_initWithString_attributes_(v19, v20, v13, (uint64_t)v5);
        objc_msgSend_appendAttributedString_(v4, v22, (uint64_t)v21, v23);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v28, (uint64_t)v32, 16);
      uint64_t v9 = (v9 + i);
    }
    while (v8);
  }

  return v4;
}

+ (BOOL)_shouldAggregateForTransferType:(id)a3
{
  id v3 = a3;
  if (qword_1E965E8A0 != -1) {
    dispatch_once(&qword_1E965E8A0, &unk_1EF8E5318);
  }
  if (!qword_1E965E8A8)
  {
    id v4 = (void **)MEMORY[0x1A6263B50]("kUTTypeImage", @"CoreServices");
    if (v4) {
      id v5 = *v4;
    }
    else {
      id v5 = 0;
    }
    objc_storeStrong((id *)&qword_1E965E8A8, v5);
  }
  BOOL v6 = off_1E965E898(v3) != 0;

  return v6;
}

+ (id)_messageItemWithPartsDeleted:(id)a3 fromMessageItem:(id)a4 indexesOfItemsDeleted:(id *)a5 indexToRangeMapping:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v46 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v55 = v7;
      __int16 v56 = 2112;
      id v57 = v46;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Message with parts deleted: %@ from message: %@", buf, 0x16u);
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v7;
  BOOL v11 = 0;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_messagePartAttributeName(v18, v12, v13, v14);
        if (v19 == -1)
        {
          BOOL v11 = 1;
        }
        else
        {
          objc_msgSend_addIndex_(v9, v12, v19, v14);
          uint64_t v23 = objc_msgSend_messagePartRange(v18, v20, v21, v22);
          uint64_t v24 = (uint64_t)v12;
          if (!v19)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v25 = objc_msgSend_subject(v18, v12, v13, v14);
              BOOL v11 = objc_msgSend_length(v25, v26, v27, v28) != 0;
            }
          }
          if (v23 | v24)
          {
            long long v29 = objc_msgSend_numberWithInteger_(NSNumber, v12, v19, v14);
            objc_msgSend_objectForKey_(v47, v30, (uint64_t)v29, v31);
            id v32 = (id)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v34, v19, v35);
              objc_msgSend_setObject_forKey_(v47, v37, (uint64_t)v32, (uint64_t)v36);
            }
            uint64_t v38 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v33, v23, v24);
            objc_msgSend_addObject_(v32, v39, (uint64_t)v38, v40);
          }
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v15);
  }

  if (a5) {
    *a5 = v9;
  }
  if (a6) {
    *a6 = v47;
  }
  uint64_t v42 = objc_msgSend__messageItemWithIndexesDeleted_subRangesToDeleteMapping_deleteSubject_deleteTransferCallback_createItemCallback_fromMessageItem_(MEMORY[0x1E4F6E850], v41, (uint64_t)v9, (uint64_t)v47, v11, &unk_1EF8E35A8, &unk_1EF8E35C8, v46);

  return v42;
}

+ (id)chatItemGUIDForMessageGUID:(id)a3 partIndex:(int64_t)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v10 = objc_msgSend_initWithFormat_(v7, v8, @"p:%ld/%@", v9, a4, v6);

  return v10;
}

- (id)_initWithItem:(id)a3 index:(int64_t)a4 messagePartRange:(_NSRange)a5
{
  return (id)objc_msgSend__initWithItem_index_messagePartRange_syndicationBehavior_(self, a2, (uint64_t)a3, a4, a5.location, a5.length, 0);
}

- (id)_initWithItem:(id)a3 index:(int64_t)a4 messagePartRange:(_NSRange)a5 syndicationBehavior:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  uint64_t v14 = objc_msgSend__initWithItem_(self, v12, (uint64_t)v11, v13);
  uint64_t v17 = v14;
  if (v14)
  {
    v14[9] = a4;
    uint64_t v18 = v14 + 19;
    v14[19] = location;
    v14[20] = length;
    v14[18] = objc_msgSend_replyCountForPartIndex_(v11, v15, a4, v16);
    v17[15] = a6;
    uint64_t v23 = objc_msgSend_syndicationRanges(v11, v19, v20, v21);
    if (v23)
    {
      uint64_t v24 = objc_msgSend_messagePartSyndicationRangeForRange_inRangesArray_(MEMORY[0x1E4F6E880], v22, *v18, v17[20], v23);
      uint64_t v28 = v24;
      if (v24)
      {
        v17[12] = objc_msgSend_syndicationType(v24, v25, v26, v27);
        v17[13] = objc_msgSend_syndicationStatus(v28, v29, v30, v31);
        if (objc_msgSend_isHighlighted(v17, v32, v33, v34))
        {
          if (v17[15] == 1)
          {
            uint64_t v35 = [IMMessagePartHighlightChatItem alloc];
            uint64_t v39 = objc_msgSend_guid(v11, v36, v37, v38);
            uint64_t v41 = objc_msgSend__initWithItem_highlightedMessagePartGUID_highlightedMessagePartIndex_highlightedMessagePartRange_(v35, v40, (uint64_t)v11, (uint64_t)v39, a4, location, length);
            uint64_t v42 = (void *)v17[14];
            v17[14] = v41;
          }
        }
      }
    }
  }

  return v17;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 visibleAssociatedMessageChatItems:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  uint64_t v19 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v16, v17, v18);
  int isSWYAttachmentsEnabled = objc_msgSend_isSWYAttachmentsEnabled(v19, v20, v21, v22);

  if (isSWYAttachmentsEnabled)
  {
    unsigned int isFileAttachment = objc_msgSend_isFileAttachment(v13, v24, v25, v26);
    uint64_t v29 = objc_msgSend__initWithItem_index_messagePartRange_syndicationBehavior_(self, v28, (uint64_t)v13, a5, location, length, isFileAttachment);
  }
  else
  {
    uint64_t v29 = objc_msgSend__initWithItem_index_messagePartRange_(self, v24, (uint64_t)v13, a5, location, length);
  }
  uint64_t v33 = v29;
  if (v29)
  {
    uint64_t v34 = objc_msgSend_guid(v13, v30, v31, v32);
    uint64_t v36 = objc_msgSend_chatItemGUIDForMessageGUID_partIndex_(IMMessagePartChatItem, v35, (uint64_t)v34, a5);
    objc_msgSend__setGUID_((void *)v33, v37, (uint64_t)v36, v38);
    uint64_t v41 = objc_msgSend_extractAndSetChipListFrom_((void *)v33, v39, (uint64_t)v14, v40);
    uint64_t v42 = *(void **)(v33 + 64);
    *(void *)(v33 + 64) = v41;

    if (objc_msgSend_isCorrupt(v13, v43, v44, v45))
    {
      long long v49 = objc_msgSend_body(v13, v46, v47, v48);
      uint64_t v53 = objc_msgSend_copy(v49, v50, v51, v52);
      uint64_t v54 = *(void **)(v33 + 80);
      *(void *)(v33 + 80) = v53;
    }
    id v55 = objc_msgSend_copy(v15, v46, v47, v48);
    objc_msgSend__setVisibleAssociatedMessageChatItems_((void *)v33, v56, (uint64_t)v55, v57);

    long long v61 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v58, v59, v60);
    int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v61, v62, v63, v64);

    if (isCarrierPigeonEnabled) {
      *(unsigned char *)(v33 + 59) = objc_msgSend_isPendingSatelliteSend(v13, v66, v67, v68);
    }
  }
  return (id)v33;
}

- (id)extractAndSetChipListFrom:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_string(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_rangeOfString_(v9, v10, *MEMORY[0x1E4F6CE60], v11);
    uint64_t v14 = v13;

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1A4B9C830;
    v25[3] = &unk_1E5B7C9F0;
    v25[4] = self;
    objc_msgSend_enumerateAttributesInRange_options_usingBlock_(v8, v15, v12, v14, 0, v25);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = objc_msgSend_copy(v8, v16, v17, v18);
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
      uint64_t v19 = objc_msgSend_initWithAttributedString_(v20, v21, (uint64_t)v8, v22);
      objc_msgSend_replaceCharactersInRange_withString_(v19, v23, v12, v14, &stru_1EF8E78C8);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void)_setVisibleAssociatedMessageChatItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSArray *)a3;
  visibleAssociatedMessageChatItems = self->_visibleAssociatedMessageChatItems;
  if (visibleAssociatedMessageChatItems != v7
    && (objc_msgSend_isEqualToArray_(visibleAssociatedMessageChatItems, v5, (uint64_t)v7, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visibleAssociatedMessageChatItems, a3);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = self->_visibleAssociatedMessageChatItems;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v11)
    {
      uint64_t v15 = v11;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v9);
          }
          uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_isFromMe(self, v12, v13, v14, (void)v22);
          objc_msgSend__setParentMessageIsFromMe_(v18, v20, v19, v21);
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v15);
    }
  }
}

- (id)_visibleAssociatedChatItemsByFlatteningAggregateChatItems
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  objc_msgSend_visibleAssociatedMessageChatItems(self, v6, v7, v8);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v40, (uint64_t)v45, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v14;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v21 = objc_msgSend_acknowledgments(v17, v18, v19, v20);
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v36, (uint64_t)v44, 16);
          if (v23)
          {
            uint64_t v26 = v23;
            uint64_t v27 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v37 != v27) {
                  objc_enumerationMutation(v21);
                }
                objc_msgSend_addObject_(v5, v24, *(void *)(*((void *)&v36 + 1) + 8 * j), v25);
              }
              uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v36, (uint64_t)v44, 16);
            }
            while (v26);
          }
        }
        else
        {
          objc_msgSend_addObject_(v5, v15, (uint64_t)v14, v16);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v40, (uint64_t)v45, 16);
    }
    while (v11);
  }

  uint64_t v33 = objc_msgSend_copy(v5, v30, v31, v32);

  return v33;
}

- (NSString)threadIdentifier
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_threadIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (IMMessageItem)threadOriginator
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_threadOriginator(v4, v5, v6, v7);

  return (IMMessageItem *)v8;
}

- (unint64_t)scheduleType
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_scheduleType(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)scheduleState
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_scheduleState(v4, v5, v6, v7);

  return v8;
}

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  return 0;
}

- (_NSRange)originalMessagePartRange
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_messagePartAttributeName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_originalTextRangesByPartIndex(v5, v10, v11, v12);
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v14, v9, v15);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v13, v17, (uint64_t)v16, v18);

  if (v19) {
    uint64_t v23 = objc_msgSend_rangeValue(v19, v20, v21, v22);
  }
  else {
    uint64_t v23 = objc_msgSend_messagePartRange(self, v20, v21, v22);
  }
  NSUInteger v25 = v23;
  NSUInteger v26 = v24;

  NSUInteger v27 = v25;
  NSUInteger v28 = v26;
  result.NSUInteger length = v28;
  result.NSUInteger location = v27;
  return result;
}

- (BOOL)isEditedMessagePart
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_messagePartAttributeName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_editedPartIndexes(v5, v10, v11, v12);
  LOBYTE(v9) = objc_msgSend_containsIndex_(v13, v14, v9, v15);

  return v9;
}

- (BOOL)isFailedEditMessagePart
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_messagePartAttributeName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_failedEditPartIndexes(v5, v10, v11, v12);
  LOBYTE(v9) = objc_msgSend_containsIndex_(v13, v14, v9, v15);

  return v9;
}

- (BOOL)isRetractedMessagePart
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_messagePartAttributeName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_retractedPartIndexes(v5, v10, v11, v12);
  LOBYTE(v9) = objc_msgSend_containsIndex_(v13, v14, v9, v15);

  return v9;
}

- (BOOL)isFailedRetractMessagePart
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_messagePartAttributeName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_failedRetractPartIndexes(v5, v10, v11, v12);
  LOBYTE(v9) = objc_msgSend_containsIndex_(v13, v14, v9, v15);

  return v9;
}

- (BOOL)requiresSiriAttribution
{
  if (objc_msgSend_isFromMe(self, a2, v2, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_message(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_sourceApplicationID(v8, v9, v10, v11);
  int isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x1E4F6EB28], v14);

  if (!isEqualToString) {
    return 0;
  }
  uint64_t v16 = objc_opt_class();

  return MEMORY[0x1F4181798](v16, sel_isSiriEnabled, v17, v18);
}

- (BOOL)requiresFaceTimeAttribution
{
  id v4 = objc_msgSend_message(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_sourceApplicationID(v4, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"com.apple.FaceTime", v10);

  return isEqualToString;
}

- (BOOL)requiresCriticalMessagingAPIAttribution
{
  id v4 = objc_msgSend_message(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_messageSummaryInfo(v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, @"critical-messaging-app-name", v10);

  return v11 != 0;
}

+ (BOOL)isSiriEnabled
{
  if (qword_1E965E8B8 != -1) {
    dispatch_once(&qword_1E965E8B8, &unk_1EF8E63C8);
  }
  return byte_1E965E8B0;
}

- (BOOL)isHighlighted
{
  return self->_syndicationType & 1;
}

- (int64_t)syndicationType
{
  return self->_syndicationType;
}

- (int64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (IMMessagePartHighlightChatItem)messageHighlightChatItem
{
  return self->_messageHighlightChatItem;
}

- (int64_t)syndicationBehavior
{
  return self->_syndicationBehavior;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (int64_t)index
{
  return self->_index;
}

- (void)_setIndex:(int64_t)a3
{
  self->_int64_t index = a3;
}

- (_NSRange)messagePartRange
{
  p_messagePartRange = &self->_messagePartRange;
  NSUInteger location = self->_messagePartRange.location;
  NSUInteger length = p_messagePartRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMessagePartRange:(_NSRange)a3
{
  self->_messagePartRange = a3;
}

- (NSAttributedString)fallbackCorruptText
{
  return self->_fallbackCorruptText;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  return self->_visibleAssociatedMessageChatItems;
}

- (BOOL)chatInScrutinyMode
{
  return self->_chatInScrutinyMode;
}

- (void)setChatInScrutinyMode:(BOOL)a3
{
  self->_chatInScrutinyMode = a3;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return self->_supportsSuggestedActionsMenu;
}

- (NSArray)suggestedActionsList
{
  return self->_suggestedActionsList;
}

- (BOOL)isPendingSatelliteSend
{
  return self->_pendingSatelliteSend;
}

- (void)setPendingSatelliteSend:(BOOL)a3
{
  self->_pendingSatelliteSend = a3;
}

- (BOOL)isAllowlistedRichLinkSender
{
  return self->_allowlistedRichLinkSender;
}

- (void)setAllowlistedRichLinkSender:(BOOL)a3
{
  self->_allowlistedRichLinkSender = a3;
}

- (void)setStewie:(BOOL)a3
{
  self->_stewie = a3;
}

- (void)setStewieConversationID:(int64_t)a3
{
  self->_stewieConversationID = a3;
}

- (unint64_t)replyCount
{
  return self->_replyCount;
}

- (void)setReplyCount:(unint64_t)a3
{
  self->_replyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActionsList, 0);
  objc_storeStrong((id *)&self->_messageHighlightChatItem, 0);
  objc_storeStrong((id *)&self->_visibleAssociatedMessageChatItems, 0);
  objc_storeStrong((id *)&self->_fallbackCorruptText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)threadIdentifierForTapback
{
  objc_msgSend_threadIdentifier(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v12 = 0;
    int IsThreadOriginatorWithThreadIdentifier = objc_msgSend_itemIsThreadOriginatorWithThreadIdentifier_(self, v5, (uint64_t)&v12, v6);
    id v9 = v12;
    uint64_t v10 = v9;
    if (IsThreadOriginatorWithThreadIdentifier) {
      id v7 = v9;
    }
  }

  return (NSString *)v7;
}

- (id)messageSummaryInfo
{
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1A4CB966C();
  }

  return (id)MEMORY[0x1E4F1CC08];
}

- (unsigned)contentType
{
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1A4CB96A0();
  }

  return 0;
}

@end