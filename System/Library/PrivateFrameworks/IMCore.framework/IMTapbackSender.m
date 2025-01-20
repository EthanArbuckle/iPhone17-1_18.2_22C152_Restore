@interface IMTapbackSender
+ (id)_metricIdentifierForTapback:(id)a3;
- (IMChat)chat;
- (IMTapback)tapback;
- (IMTapbackSender)initWithTapback:(id)a3 chat:(id)a4 messageGUID:(id)a5 messagePartRange:(_NSRange)a6 messageSummaryInfo:(id)a7 threadIdentifier:(id)a8;
- (IMTapbackSender)initWithTapback:(id)a3 chat:(id)a4 messagePartChatItem:(id)a5;
- (NSAttributedString)attributedContentString;
- (NSAttributedString)messageContent;
- (NSDictionary)messageSummaryInfo;
- (NSString)backwardCompatibilityString;
- (NSString)messageGUID;
- (NSString)threadIdentifier;
- (_NSRange)messagePartRange;
- (void)_trackSentTapbackWithContentType:(unsigned __int8)a3 serviceName:(id)a4;
- (void)send;
@end

@implementation IMTapbackSender

- (IMTapbackSender)initWithTapback:(id)a3 chat:(id)a4 messageGUID:(id)a5 messagePartRange:(_NSRange)a6 messageSummaryInfo:(id)a7 threadIdentifier:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a3;
  id v16 = a4;
  id v47 = a5;
  id v17 = a7;
  id v46 = a8;
  v52.receiver = self;
  v52.super_class = (Class)IMTapbackSender;
  id v21 = [(IMTapbackSender *)&v52 init];
  if (!v21) {
    goto LABEL_10;
  }
  if (!v15)
  {
    v41 = IMLogHandleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB87EC();
    }
    goto LABEL_19;
  }
  if (!v16)
  {
    v41 = IMLogHandleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8820();
    }
    goto LABEL_19;
  }
  if (!v47)
  {
    v41 = IMLogHandleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8854();
    }
    goto LABEL_19;
  }
  if (!v17)
  {
    v41 = IMLogHandleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8888();
    }
LABEL_19:

    goto LABEL_20;
  }
  id v45 = v16;
  v22 = objc_msgSend___im_associatedMessageContentType(v17, v18, v19, v20);

  if (v22)
  {
    objc_storeStrong((id *)v21 + 8, a4);
    objc_storeStrong((id *)v21 + 1, a3);
    objc_storeStrong((id *)v21 + 2, a5);
    *((void *)v21 + 9) = location;
    *((void *)v21 + 10) = length;
    objc_storeStrong((id *)v21 + 4, a8);
    uint64_t v25 = objc_msgSend_adjustMessageSummaryInfoForSending_(v15, v23, (uint64_t)v17, v24);
    v26 = (void *)*((void *)v21 + 3);
    *((void *)v21 + 3) = v25;

    v30 = objc_msgSend_sharedInstance(IMFileTransferCenter, v27, v28, v29);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4BC9440;
    aBlock[3] = &unk_1E5B7C150;
    id v31 = v30;
    id v51 = v31;
    v32 = _Block_copy(aBlock);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_1A4BC9480;
    v48[3] = &unk_1E5B7C150;
    id v33 = v31;
    id v49 = v33;
    v34 = _Block_copy(v48);
    uint64_t v36 = objc_msgSend_backwardCompatibilityStringWithMessageSummaryInfo_isAdaptiveImageGlyphProvider_isCommSafetySensitiveProvider_(v15, v35, *((void *)v21 + 3), (uint64_t)v32, v34);
    v37 = (void *)*((void *)v21 + 6);
    *((void *)v21 + 6) = v36;

    if (*((void *)v21 + 6))
    {
      uint64_t v38 = IMCreateSuperFormatStringFromPlainTextString();
      v39 = (void *)*((void *)v21 + 7);
      *((void *)v21 + 7) = v38;

      if (*((void *)v21 + 7))
      {

        id v16 = v45;
LABEL_10:
        v40 = (IMTapbackSender *)v21;
        goto LABEL_21;
      }
      v44 = IMLogHandleForCategory();
      id v16 = v45;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB8924();
      }
    }
    else
    {
      v44 = IMLogHandleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB88F0();
      }
      id v16 = v45;
    }

LABEL_20:
    v40 = 0;
    goto LABEL_21;
  }
  v43 = IMLogHandleForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    sub_1A4CB88BC();
  }

  v40 = 0;
  id v16 = v45;
LABEL_21:

  return v40;
}

- (IMTapbackSender)initWithTapback:(id)a3 chat:(id)a4 messagePartChatItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_originalMessagePartRange(v8, v11, v12, v13);
  id v16 = v15;
  uint64_t v19 = objc_msgSend_guid(v8, v15, v17, v18);
  v23 = objc_msgSend_messageSummaryInfo(v8, v20, v21, v22);
  v27 = objc_msgSend_threadIdentifierForTapback(v8, v24, v25, v26);

  uint64_t v29 = (IMTapbackSender *)objc_msgSend_initWithTapback_chat_messageGUID_messagePartRange_messageSummaryInfo_threadIdentifier_(self, v28, (uint64_t)v10, (uint64_t)v9, v19, v14, v16, v23, v27);
  return v29;
}

- (void)send
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_tapback(self, a2, v2, v3);
  id v9 = objc_msgSend_chat(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_messageGUID(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_messagePartRange(self, v14, v15, v16);
  uint64_t v19 = v18;
  uint64_t v22 = objc_msgSend_messageSummaryInfo(self, v18, v20, v21);
  uint64_t v26 = objc_msgSend_threadIdentifier(self, v23, v24, v25);
  uint64_t v28 = objc_msgSend_messageForChat_messageGUID_messagePartRange_messageSummaryInfo_threadIdentifier_(v5, v27, (uint64_t)v9, (uint64_t)v13, v17, v19, v22, v26);

  v32 = objc_msgSend_chat(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_account(v32, v33, v34, v35);

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v40 = objc_msgSend_fileTransferGUIDs(v28, v37, v38, v39, 0);
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v71, (uint64_t)v75, 16);
  if (v42)
  {
    uint64_t v46 = v42;
    uint64_t v47 = *(void *)v72;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(v40);
        }
        uint64_t v49 = *(void *)(*((void *)&v71 + 1) + 8 * v48);
        v50 = objc_msgSend_sharedInstance(IMFileTransferCenter, v43, v44, v45);
        objc_msgSend_assignTransfer_toMessage_account_(v50, v51, v49, (uint64_t)v28, v36);

        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v71, (uint64_t)v75, 16);
    }
    while (v46);
  }

  v55 = objc_msgSend_chat(self, v52, v53, v54);
  objc_msgSend_sendMessage_(v55, v56, (uint64_t)v28, v57);

  v61 = objc_msgSend___im_associatedMessageContentType(self->_messageSummaryInfo, v58, v59, v60);
  unsigned __int8 v65 = objc_msgSend_integerValue(v61, v62, v63, v64);

  v69 = objc_msgSend_serviceName(v36, v66, v67, v68);
  objc_msgSend__trackSentTapbackWithContentType_serviceName_(self, v70, v65, (uint64_t)v69);
}

- (void)_trackSentTapbackWithContentType:(unsigned __int8)a3 serviceName:(id)a4
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F6E890];
  id v6 = a4;
  id v10 = objc_msgSend_sharedInstance(v5, v7, v8, v9);
  uint64_t v11 = *MEMORY[0x1E4F6DBD8];
  v28[0] = *MEMORY[0x1E4F6DBC8];
  uint64_t v12 = objc_opt_class();
  uint64_t v15 = objc_msgSend__metricIdentifierForTapback_(v12, v13, (uint64_t)self->_tapback, v14);
  v29[0] = v15;
  v28[1] = *MEMORY[0x1E4F6DBD0];
  uint64_t v16 = NSNumber;
  uint64_t isRemoved = objc_msgSend_isRemoved(self->_tapback, v17, v18, v19);
  v23 = objc_msgSend_numberWithBool_(v16, v21, isRemoved, v22);
  v29[1] = v23;
  v28[2] = *MEMORY[0x1E4F6DBC0];
  uint64_t v24 = IMMetricsValueForAssociatedMessageContentType();
  v28[3] = *MEMORY[0x1E4F6DBE0];
  v29[2] = v24;
  v29[3] = v6;
  uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v29, (uint64_t)v28, 4);

  objc_msgSend_trackEvent_withDictionary_(v10, v27, v11, (uint64_t)v26);
}

+ (id)_metricIdentifierForTapback:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_visibleTapbackCounterpart(v3, v4, v5, v6);
    uint64_t v11 = objc_msgSend_associatedMessageType(v7, v8, v9, v10);

    if ((unint64_t)(v11 - 2000) < 6)
    {
      uint64_t v12 = off_1E5B7D178[v11 - 2000];
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v12 = @"unknown";
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = @"emoji";
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v16 = objc_msgSend_transferGUID(v3, v13, v14, v15);
  uint64_t v20 = objc_msgSend_sharedInstance(IMFileTransferCenter, v17, v18, v19);
  v23 = objc_msgSend_transferForGUID_(v20, v21, (uint64_t)v16, v22);

  if (v23)
  {
    if (objc_msgSend_isSticker(v23, v24, v25, v26))
    {
      uint64_t v30 = objc_msgSend_stickerUserInfo(v23, v27, v28, v29);
      id v33 = objc_msgSend_objectForKeyedSubscript_(v30, v31, *MEMORY[0x1E4F6E3B8], v32);

      uint64_t v34 = IMBalloonBundleIDFromExtensionID();
      if (objc_msgSend_isEqualToString_(v34, v35, *MEMORY[0x1E4F6CAF8], v36))
      {
        uint64_t v12 = @"sticker-user-generated";
      }
      else if (objc_msgSend_isEqualToString_(v34, v37, *MEMORY[0x1E4F6CB78], v38))
      {
        uint64_t v12 = @"sticker-animoji";
      }
      else if (objc_msgSend_isAdaptiveImageGlyph(v23, v39, v40, v41))
      {
        uint64_t v12 = @"sticker-adaptive-glyph";
      }
      else
      {
        uint64_t v12 = @"sticker-other";
      }
    }
    else
    {
      uint64_t v12 = @"file-transfer-other";
    }
  }
  else
  {
    uint64_t v12 = @"file-transfer-missing";
  }

LABEL_21:
  return v12;
}

- (IMTapback)tapback
{
  return self->_tapback;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (_NSRange)messagePartRange
{
  NSUInteger length = self->_messagePartRange.length;
  NSUInteger location = self->_messagePartRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSAttributedString)messageContent
{
  return self->_messageContent;
}

- (NSString)backwardCompatibilityString
{
  return self->_backwardCompatibilityString;
}

- (NSAttributedString)attributedContentString
{
  return self->_attributedContentString;
}

- (IMChat)chat
{
  return self->_chat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_attributedContentString, 0);
  objc_storeStrong((id *)&self->_backwardCompatibilityString, 0);
  objc_storeStrong((id *)&self->_messageContent, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_tapback, 0);
}

@end