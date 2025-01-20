@interface IMSPIMessage
- (BOOL)allowedByScreenTime;
- (BOOL)hasDataDetectedResults;
- (BOOL)isAudioMessage;
- (BOOL)isGroupChat;
- (BOOL)isOutgoing;
- (BOOL)isRead;
- (IMSPIHandle)sender;
- (IMSPIMessage)referencedMessage;
- (LPLinkMetadata)richLinkMetadata;
- (NSArray)attachments;
- (NSArray)chatGuids;
- (NSArray)recipients;
- (NSAttributedString)attributedText;
- (NSDate)date;
- (NSDate)dateForLastReadMessageInChat;
- (NSDate)dateRead;
- (NSDate)lastReadDate;
- (NSString)associatedMessageEmoji;
- (NSString)body;
- (NSString)bundleId;
- (NSString)chatIdentifier;
- (NSString)displayAppName;
- (NSString)displayName;
- (NSString)effect;
- (NSString)groupID;
- (NSString)guid;
- (NSString)service;
- (NSString)subject;
- (NSString)summary;
- (NSString)text;
- (NSURL)extensionPayloadURL;
- (NSURL)url;
- (PKCurrencyAmount)peerPaymentAmount;
- (id)description;
- (id)spiChatWithQOS:(unsigned int)a3;
- (int64_t)itemType;
- (int64_t)messageID;
- (int64_t)messageType;
- (void)dealloc;
- (void)setAssociatedMessageEmoji:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setBody:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setChatGuids:(id)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateForLastReadMessageInChat:(id)a3;
- (void)setDateRead:(id)a3;
- (void)setDisplayAppName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEffect:(id)a3;
- (void)setExtensionPayloadURL:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasDataDetectedResults:(BOOL)a3;
- (void)setIsAudioMessage:(BOOL)a3;
- (void)setIsGroupChat:(BOOL)a3;
- (void)setIsOutgoing:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setItemType:(int64_t)a3;
- (void)setMessageID:(int64_t)a3;
- (void)setMessageType:(int64_t)a3;
- (void)setPeerPaymentAmount:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setReferencedMessage:(id)a3;
- (void)setRichLinkMetadata:(id)a3;
- (void)setSender:(id)a3;
- (void)setService:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSummary:(id)a3;
- (void)setText:(id)a3;
@end

@implementation IMSPIMessage

- (void)dealloc
{
  objc_msgSend_setText_(self, a2, 0, v2);
  objc_msgSend_setBody_(self, v4, 0, v5);
  objc_msgSend_setSummary_(self, v6, 0, v7);
  objc_msgSend_setDate_(self, v8, 0, v9);
  objc_msgSend_setDateRead_(self, v10, 0, v11);
  objc_msgSend_setDateForLastReadMessageInChat_(self, v12, 0, v13);
  objc_msgSend_setRecipients_(self, v14, 0, v15);
  objc_msgSend_setSender_(self, v16, 0, v17);
  objc_msgSend_setSubject_(self, v18, 0, v19);
  objc_msgSend_setAttributedText_(self, v20, 0, v21);
  objc_msgSend_setGuid_(self, v22, 0, v23);
  objc_msgSend_setChatGuids_(self, v24, 0, v25);
  objc_msgSend_setGroupID_(self, v26, 0, v27);
  objc_msgSend_setChatIdentifier_(self, v28, 0, v29);
  objc_msgSend_setDisplayName_(self, v30, 0, v31);
  objc_msgSend_setReferencedMessage_(self, v32, 0, v33);
  objc_msgSend_setBundleId_(self, v34, 0, v35);
  objc_msgSend_setDisplayAppName_(self, v36, 0, v37);
  objc_msgSend_setRichLinkMetadata_(self, v38, 0, v39);
  objc_msgSend_setPeerPaymentAmount_(self, v40, 0, v41);
  v42.receiver = self;
  v42.super_class = (Class)IMSPIMessage;
  [(IMSPIMessage *)&v42 dealloc];
}

- (id)description
{
  uint64_t v5 = NSString;
  if (objc_msgSend_isOutgoing(self, a2, v2, v3)) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if (objc_msgSend_isRead(self, v6, v7, v8)) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if (objc_msgSend_isAudioMessage(self, v10, v11, v12)) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  v18 = objc_msgSend_sender(self, v14, v15, v16);
  v22 = objc_msgSend_recipients(self, v19, v20, v21);
  v26 = objc_msgSend_guid(self, v23, v24, v25);
  v30 = objc_msgSend_chatGuids(self, v27, v28, v29);
  v34 = objc_msgSend_attachments(self, v31, v32, v33);
  uint64_t v37 = objc_msgSend_stringWithFormat_(v5, v35, @"IMSPIMessage: %p [Outgoing: %@  Read: %@  IsAudio: %@  Sender: %@  Recipients: %@  GUID: %@ ChatGUIDs: %@ Attachments: %@]", v36, self, v9, v13, v17, v18, v22, v26, v30, v34);

  return v37;
}

- (NSURL)url
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"x-apple-sms:guid=%@", v2, self->_guid);
  uint64_t v7 = objc_msgSend_URLWithString_(v3, v5, (uint64_t)v4, v6);

  return (NSURL *)v7;
}

- (NSDate)lastReadDate
{
  return self->_dateForLastReadMessageInChat;
}

- (id)spiChatWithQOS:(unsigned int)a3
{
  uint64_t v5 = sub_1A4C70D74((dispatch_qos_class_t)a3);
  uint64_t v9 = objc_msgSend_firstObject(self->_chatGuids, v6, v7, v8);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_1A4B3461C;
  uint64_t v25 = sub_1A4B343F4;
  id v26 = 0;
  if (objc_msgSend_length(v9, v10, v11, v12))
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1A4C70FC4;
    v18[3] = &unk_1E5B7F3D0;
    uint64_t v20 = &v21;
    v14 = v13;
    uint64_t v19 = v14;
    IMSPIQueryChatWithGuid(v9, (dispatch_qos_class_t)a3, v5, v18);
    dispatch_time_t v15 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v14, v15);
  }
  id v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGuid:(id)a3
{
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(int64_t)a3
{
  self->_messageID = a3;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAttributedText:(id)a3
{
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (void)setIsOutgoing:(BOOL)a3
{
  self->_isOutgoing = a3;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setText:(id)a3
{
}

- (IMSPIHandle)sender
{
  return (IMSPIHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSender:(id)a3
{
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecipients:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDate:(id)a3
{
}

- (BOOL)isAudioMessage
{
  return self->_isAudioMessage;
}

- (void)setIsAudioMessage:(BOOL)a3
{
  self->_isAudioMessage = a3;
}

- (NSArray)chatGuids
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setChatGuids:(id)a3
{
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAttachments:(id)a3
{
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSString)chatIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setChatIdentifier:(id)a3
{
}

- (BOOL)isGroupChat
{
  return self->_isGroupChat;
}

- (void)setIsGroupChat:(BOOL)a3
{
  self->_isGroupChat = a3;
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBody:(id)a3
{
}

- (NSString)summary
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSummary:(id)a3
{
}

- (NSString)effect
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEffect:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setService:(id)a3
{
}

- (NSDate)dateRead
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDateRead:(id)a3
{
}

- (NSDate)dateForLastReadMessageInChat
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDateForLastReadMessageInChat:(id)a3
{
}

- (NSURL)extensionPayloadURL
{
  return (NSURL *)objc_getProperty(self, a2, 176, 1);
}

- (void)setExtensionPayloadURL:(id)a3
{
}

- (IMSPIMessage)referencedMessage
{
  return (IMSPIMessage *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReferencedMessage:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (NSString)displayAppName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDisplayAppName:(id)a3
{
}

- (LPLinkMetadata)richLinkMetadata
{
  return (LPLinkMetadata *)objc_getProperty(self, a2, 216, 1);
}

- (void)setRichLinkMetadata:(id)a3
{
}

- (PKCurrencyAmount)peerPaymentAmount
{
  return (PKCurrencyAmount *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPeerPaymentAmount:(id)a3
{
}

- (BOOL)hasDataDetectedResults
{
  return self->_hasDataDetectedResults;
}

- (void)setHasDataDetectedResults:(BOOL)a3
{
  self->_hasDataDetectedResults = a3;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAssociatedMessageEmoji:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedMessageEmoji, 0);
  objc_storeStrong((id *)&self->_peerPaymentAmount, 0);
  objc_storeStrong((id *)&self->_richLinkMetadata, 0);
  objc_storeStrong((id *)&self->_displayAppName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_referencedMessage, 0);
  objc_storeStrong((id *)&self->_extensionPayloadURL, 0);
  objc_storeStrong((id *)&self->_dateForLastReadMessageInChat, 0);
  objc_storeStrong((id *)&self->_dateRead, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_chatGuids, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

- (BOOL)allowedByScreenTime
{
  if (!objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3)) {
    return 1;
  }
  uint64_t v14 = 0;
  dispatch_time_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4C71574;
  aBlock[3] = &unk_1E5B7BE20;
  aBlock[4] = self;
  aBlock[5] = &v14;
  uint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v6, v7, v8))
  {
    v5[2](v5);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C717D4;
    block[3] = &unk_1E5B7AE90;
    uint64_t v12 = v5;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  BOOL v9 = *((unsigned char *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

@end