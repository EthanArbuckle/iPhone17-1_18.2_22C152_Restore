@interface IMAttachmentMessagePartChatItem
- (BOOL)_wantsAttachmentContiguousForType:(id)a3;
- (BOOL)isAttachmentContiguousWithChatItem:(id)a3;
- (BOOL)parentChatIsSpam;
- (BOOL)supportsCommunicationSafety;
- (BOOL)supportsSuggestedActionsMenu;
- (BOOL)wantsAttachmentContiguous;
- (NSString)transferGUID;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUID:(id)a7 chatContext:(id)a8;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUID:(id)a7 chatContext:(id)a8 visibleAssociatedMessageChatItems:(id)a9;
- (id)commSafetyMessageGUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)layoutGroupIdentifier;
- (id)messageSummaryInfo;
- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4;
- (int64_t)syndicationBehavior;
- (unint64_t)numberOfMomentSharePhotos;
- (unint64_t)numberOfMomentShareSavedAssets;
- (unint64_t)numberOfMomentShareVideos;
- (unsigned)contentType;
- (void)setNumberOfMomentSharePhotos:(unint64_t)a3;
- (void)setNumberOfMomentShareSavedAssets:(unint64_t)a3;
- (void)setNumberOfMomentShareVideos:(unint64_t)a3;
@end

@implementation IMAttachmentMessagePartChatItem

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5 = a3;
  v42 = [IMReplyContextAttachmentMessagePartChatItem alloc];
  v9 = objc_msgSend__item(self, v6, v7, v8);
  v13 = objc_msgSend_guid(v5, v10, v11, v12);
  uint64_t v17 = objc_msgSend_isFromMe(v5, v14, v15, v16);
  v21 = objc_msgSend_text(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_index(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_messagePartRange(self, v26, v27, v28);
  v31 = v30;
  v34 = objc_msgSend_transferGUID(self, v30, v32, v33);
  v38 = objc_msgSend_chatContext(self, v35, v36, v37);
  v40 = objc_msgSend__initWithItem_parentItem_replyMessageGUID_replyIsFromMe_text_index_messagePartRange_transferGUID_chatContext_(v42, v39, (uint64_t)v9, (uint64_t)v5, v13, v17, v21, v25, v29, v31, v34, v38);

  return v40;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (BOOL)supportsSuggestedActionsMenu
{
  id v5 = objc_msgSend_sharedInstance(IMFileTransferCenter, a2, v2, v3);
  v9 = objc_msgSend_transferGUID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_transferForGUID_(v5, v10, (uint64_t)v9, v11);

  LOBYTE(v9) = objc_msgSend_isSticker(v12, v13, v14, v15) ^ 1;
  return (char)v9;
}

- (id)commSafetyMessageGUID
{
  v4 = objc_msgSend_message(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_guid(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMAttachmentMessagePartChatItem;
  v4 = [(IMMessagePartChatItem *)&v9 description];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] transferGUID: %@]", v6, v4, self->_transferGUID);

  return v7;
}

- (id)layoutGroupIdentifier
{
  v4.receiver = self;
  v4.super_class = (Class)IMAttachmentMessagePartChatItem;
  uint64_t v2 = [(IMTranscriptChatItem *)&v4 layoutGroupIdentifier];

  return v2;
}

- (BOOL)parentChatIsSpam
{
  objc_super v4 = objc_msgSend_chatContext(self, a2, v2, v3);
  char isSpam = objc_msgSend_isSpam(v4, v5, v6, v7);

  return isSpam;
}

- (int64_t)syndicationBehavior
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  int isFileAttachment = objc_msgSend_isFileAttachment(v5, v6, v7, v8);

  if (!isFileAttachment) {
    return 0;
  }
  v13 = objc_msgSend_sharedInstance(IMFileTransferCenter, v10, v11, v12);
  uint64_t v17 = objc_msgSend_transferGUID(self, v14, v15, v16);
  uint64_t v20 = objc_msgSend_transferForGUID_(v13, v18, (uint64_t)v17, v19);

  uint64_t v24 = objc_msgSend_filename(v20, v21, v22, v23);
  uint64_t v25 = IMUTITypeForFilename();

  if (objc_msgSend_isFromMomentShare(v20, v26, v27, v28))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  int64_t v30 = ((isKindOfClass | IMUTITypeIsSupportedByPhotos()) & 1) == 0;

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend__item(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_text(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_index(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_messagePartRange(self, v17, v18, v19);
  uint64_t v22 = v21;
  transferGUID = self->_transferGUID;
  v26 = objc_msgSend_chatContext(self, v21, v24, v25);
  int64_t v30 = objc_msgSend_visibleAssociatedMessageChatItems(self, v27, v28, v29);
  uint64_t v32 = objc_msgSend__initWithItem_text_index_messagePartRange_transferGUID_chatContext_visibleAssociatedMessageChatItems_(v4, v31, (uint64_t)v8, (uint64_t)v12, v16, v20, v22, transferGUID, v26, v30);

  return v32;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isContiguousWithChatItem_(self, v5, (uint64_t)v4, v6))
  {
    uint64_t v10 = objc_msgSend_sharedInstance(IMFileTransferCenter, v7, v8, v9);
    uint64_t v14 = objc_msgSend_transferGUID(self, v11, v12, v13);
    uint64_t v17 = objc_msgSend_transferForGUID_(v10, v15, (uint64_t)v14, v16);

    v21 = objc_msgSend_filename(v17, v18, v19, v20);
    uint64_t v22 = IMUTITypeForFilename();

    if (objc_msgSend_isFromMomentShare(v17, v23, v24, v25))
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    char IsSupportedByPhotos = IMUTITypeIsSupportedByPhotos();
    BOOL v27 = 0;
    if ((objc_msgSend_isEqualToString_(v22, v29, @"com.apple.pkpass", v30) & 1) == 0
      && (IsSupportedByPhotos & 1) == 0
      && (isKindOfClass & 1) == 0)
    {
      BOOL v27 = self->_wantsAttachmentContiguous && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && v4[168] != 0;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUID:(id)a7 chatContext:(id)a8
{
  return (id)objc_msgSend__initWithItem_text_index_messagePartRange_transferGUID_chatContext_visibleAssociatedMessageChatItems_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6.location, a6.length, a7, a8, 0);
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUID:(id)a7 chatContext:(id)a8 visibleAssociatedMessageChatItems:(id)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a7;
  id v16 = a8;
  v50.receiver = self;
  v50.super_class = (Class)IMAttachmentMessagePartChatItem;
  uint64_t v20 = -[IMMessagePartChatItem _initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:](&v50, sel__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_, a3, a4, a5, location, length, a9);
  if (v20)
  {
    uint64_t v21 = objc_msgSend_copy(v15, v17, v18, v19);
    uint64_t v22 = (void *)v20[22];
    v20[22] = v21;

    v26 = objc_msgSend_copy(v16, v23, v24, v25);
    objc_msgSend_setChatContext_(v20, v27, (uint64_t)v26, v28);

    uint64_t v32 = objc_msgSend_sharedInstance(IMFileTransferCenter, v29, v30, v31);
    v35 = objc_msgSend_transferForGUID_(v32, v33, (uint64_t)v15, v34);

    v39 = objc_msgSend_type(v35, v36, v37, v38);
    v43 = objc_msgSend_lowercaseString(v39, v40, v41, v42);

    *((unsigned char *)v20 + 168) = objc_msgSend__wantsAttachmentContiguousForType_(v20, v44, (uint64_t)v43, v45);
    if (!v20[22])
    {
      IMLogHandleForCategory();
      v46 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_FAULT)) {
        sub_1A4CB7CDC(v20, v46, v47, v48);
      }
    }
  }

  return v20;
}

- (BOOL)_wantsAttachmentContiguousForType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_hasSuffix_(v3, v4, @".gif", v5)) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = objc_msgSend_hasSuffix_(v3, v6, @".apng", v7) ^ 1;
  }

  return v8;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (unint64_t)numberOfMomentShareSavedAssets
{
  return self->_numberOfMomentShareSavedAssets;
}

- (void)setNumberOfMomentShareSavedAssets:(unint64_t)a3
{
  self->_numberOfMomentShareSavedAssets = a3;
}

- (unint64_t)numberOfMomentSharePhotos
{
  return self->_numberOfMomentSharePhotos;
}

- (void)setNumberOfMomentSharePhotos:(unint64_t)a3
{
  self->_numberOfMomentSharePhotos = a3;
}

- (unint64_t)numberOfMomentShareVideos
{
  return self->_numberOfMomentShareVideos;
}

- (void)setNumberOfMomentShareVideos:(unint64_t)a3
{
  self->_numberOfMomentShareVideos = a3;
}

- (BOOL)wantsAttachmentContiguous
{
  return self->_wantsAttachmentContiguous;
}

- (void).cxx_destruct
{
}

- (unsigned)contentType
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMFileTransferCenter, a2, v2, v3);
  uint64_t v9 = objc_msgSend_transferGUID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_transferForGUID_(v5, v10, (uint64_t)v9, v11);

  id v16 = objc_msgSend_type(v12, v13, v14, v15);
  if (IMUTTypeIsImage() & 1) != 0 || (IMUTTypeIsSupportedAnimatedImage())
  {
    unsigned __int8 v17 = 3;
  }
  else if (IMUTTypeIsMovie())
  {
    unsigned __int8 v17 = 7;
  }
  else if (IMUTTypeIsVCard())
  {
    unsigned __int8 v17 = 4;
  }
  else if (IMUTTypeIsAudio())
  {
    unsigned __int8 v17 = 2;
  }
  else if (IMUTTypeIsMap())
  {
    unsigned __int8 v17 = 6;
  }
  else if (IMUTTypeIsCalendar())
  {
    unsigned __int8 v17 = 5;
  }
  else if (IMUTTypeIsPass())
  {
    unsigned __int8 v17 = 8;
  }
  else if (IMUTTypeIsWalletOrder())
  {
    unsigned __int8 v17 = 10;
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)messageSummaryInfo
{
  if (objc_msgSend_contentType(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_balloonBundleID(self, v5, v6, v7);
    uint64_t v9 = (void *)*MEMORY[0x1E4F6CC00];
    uint64_t v10 = IMBalloonExtensionIDWithSuffix();
    int isEqualToString = objc_msgSend_isEqualToString_(v8, v11, (uint64_t)v10, v12);

    if (isEqualToString) {
      id v17 = v9;
    }
    else {
      id v17 = 0;
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v21 = objc_msgSend_contentType(self, v14, v15, v16);
    uint64_t v19 = objc_msgSend_dictionaryWithAssociatedMessageSummary_contentType_associatedMessagePartText_pluginBundleID_pluginDisplayName_(v20, v22, 0, v21, 0, v17, 0);
  }
  else
  {
    uint64_t v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB96D4();
    }

    uint64_t v19 = 0;
  }

  return v19;
}

@end