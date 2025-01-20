@interface IMDMSAMessage
- (BOOL)iMessageOnly;
- (BOOL)isCheckInMessage;
- (BOOL)isKeyTransparencyVerifiedMessage;
- (IMDMSAMessage)initWithMessage:(_IMDMessageRecordStruct *)a3 inChat:(_IMDChatRecordStruct *)a4;
- (NSArray)participants;
- (NSDate)date;
- (NSDate)dateDelivered;
- (NSDictionary)attachments;
- (NSDictionary)chatProperties;
- (NSString)GUID;
- (NSString)chatGUID;
- (NSString)lastAddressedHandle;
- (NSString)lastAddressedSIMID;
- (NSString)senderLogin;
- (NSString)service;
- (NSString)subject;
- (double)timeSinceSent;
- (int64_t)itemType;
- (int64_t)rowID;
- (unint64_t)flags;
- (unsigned)error;
- (void)dealloc;
@end

@implementation IMDMSAMessage

- (IMDMSAMessage)initWithMessage:(_IMDMessageRecordStruct *)a3 inChat:(_IMDChatRecordStruct *)a4
{
  v64.receiver = self;
  v64.super_class = (Class)IMDMSAMessage;
  v6 = [(IMDMSAMessage *)&v64 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (!a3) {
    goto LABEL_5;
  }
  if (!a4) {
    goto LABEL_5;
  }
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  p_itemType = &v6->_itemType;
  id v60 = 0;
  uint64_t v61 = 0;
  id v59 = 0;
  long long v51 = 0u;
  long long v46 = 0u;
  long long v49 = 0u;
  long long v42 = 0u;
  long long v44 = 0u;
  p_subject = &v6->_subject;
  p_error = &v6->_error;
  long long v37 = 0u;
  p_service = &v6->_service;
  p_senderLogin = &v6->_senderLogin;
  uint64_t v30 = 0;
  v32 = &v60;
  long long v28 = 0u;
  IMDMessageRecordBulkCopy();
  if (*p_itemType)
  {
LABEL_5:

    return 0;
  }
  if (v63 >= 1) {
    v7->_date = (NSDate *)objc_retain(+[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:](NSDate, "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v63, 0, 0, 0, &v60, p_service, p_senderLogin, 0, 0, p_subject, p_error, 0, 0, 0, 0, 0,
  }
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              &v61,
                              0,
                              &v59,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0,
                              0));
  if (v62 >= 1) {
    v7->_dateDelivered = (NSDate *)+[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:(double)v62];
  }
  v7->_flags = (unint64_t)objc_msgSend(v60, "unsignedLongLongValue", v28, v30, v32, p_service, p_senderLogin, v37, p_subject, p_error, v42, v44, v46, v49, v51);
  id v58 = 0;
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v48 = 0u;
  uint64_t v45 = 0;
  p_lastAddressedSIMID = &v7->_lastAddressedSIMID;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  p_lastAddressedHandle = &v7->_lastAddressedHandle;
  long long v29 = 0u;
  _IMDChatRecordBulkCopy();
  v7->_chatProperties = (NSDictionary *)(id)JWDecodeDictionary();

  id v58 = 0;
  CFArrayRef v10 = (const __CFArray *)IMDChatRecordCopyHandles();
  if (v10)
  {
    CFArrayRef v11 = v10;
    CFIndex Count = CFArrayGetCount(v10);
    uint64_t v13 = Count << 32;
    uint64_t v14 = (int)Count;
    id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (int)Count, 0, 0, p_lastAddressedHandle, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, p_lastAddressedSIMID, 0,
            0,
            0,
            0,
            0);
    if (v13 >= 1)
    {
      if (v14 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v14;
      }
      do
      {
        CFArrayGetValueAtIndex(v11, 0);
        v17 = (void *)IMDHandleRecordCopyID();
        [v15 addObject:v17];

        --v16;
      }
      while (v16);
    }
    v7->_participants = (NSArray *)[v15 copy];

    CFRelease(v11);
  }
  uint64_t v18 = IMDMessageRecordCopyAttachments();
  if (v18)
  {
    CFArrayRef v19 = (const __CFArray *)v18;
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    if ((int)CFArrayGetCount(v19) >= 1)
    {
      CFIndex v21 = 0;
      do
      {
        v22 = [[IMDMSAAttachment alloc] initWithAttachment:CFArrayGetValueAtIndex(v19, v21)];
        if ([(IMDMSAAttachment *)v22 GUID]) {
          objc_msgSend(v20, "setObject:forKey:", v22, -[IMDMSAAttachment GUID](v22, "GUID"));
        }

        ++v21;
      }
      while (v21 < (int)CFArrayGetCount(v19));
    }
    v7->_attachments = (NSDictionary *)objc_msgSend(v20, "copy", v29, p_lastAddressedHandle, v33, v36, v38, v41, v43, v45, p_lastAddressedSIMID, v48, v50, v52);

    CFRelease(v19);
  }
  v23 = &v57;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  if ((v7->_flags & 0x200000) != 0 || v61)
  {
    char v57 = 1;
    goto LABEL_28;
  }
  if ([v59 length])
  {
    unsigned __int8 v26 = [v59 isEqualToString:IMBalloonPluginIdentifierRichLinks];
    v27 = v55;
    if ((v26 & 1) == 0)
    {
      *((unsigned char *)v55 + 24) = 1;
      v23 = (char *)(v27 + 3);
      goto LABEL_28;
    }
  }
  else
  {
    v27 = v55;
  }
  v23 = (char *)(v27 + 3);
LABEL_28:
  if (!*v23 && [v59 isEqualToString:IMBalloonExtensionIDWithSuffix()]) {
    v7->_checkInMessage = 1;
  }
  if (*((unsigned char *)v55 + 24))
  {
    char v24 = 1;
  }
  else
  {
    attachments = v7->_attachments;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100008A58;
    v53[3] = &unk_100010730;
    v53[4] = &v54;
    [(NSDictionary *)attachments enumerateKeysAndObjectsUsingBlock:v53];
    char v24 = *((unsigned char *)v55 + 24);
  }
  v7->_iMessageOnly = v24;
  v7->_keyTransparencyVerifiedMessage = (v7->_flags & 0x2000000000) != 0;

  id v60 = 0;
  id v59 = 0;
  _Block_object_dispose(&v54, 8);
  return v7;
}

- (double)timeSinceSent
{
  [+[NSDate date] timeIntervalSince1970];
  double v4 = v3;
  [(NSDate *)[(IMDMSAMessage *)self date] timeIntervalSince1970];
  return v4 - v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDMSAMessage;
  [(IMDMSAMessage *)&v3 dealloc];
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)service
{
  return self->_service;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (NSDate)dateDelivered
{
  return self->_dateDelivered;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unsigned)error
{
  return self->_error;
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (NSDictionary)chatProperties
{
  return self->_chatProperties;
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (NSString)senderLogin
{
  return self->_senderLogin;
}

- (BOOL)iMessageOnly
{
  return self->_iMessageOnly;
}

- (BOOL)isKeyTransparencyVerifiedMessage
{
  return self->_keyTransparencyVerifiedMessage;
}

- (BOOL)isCheckInMessage
{
  return self->_checkInMessage;
}

@end