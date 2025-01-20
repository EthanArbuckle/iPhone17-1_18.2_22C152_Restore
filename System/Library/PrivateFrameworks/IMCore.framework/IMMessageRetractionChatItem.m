@interface IMMessageRetractionChatItem
- (BOOL)canDelete;
- (BOOL)canRetryFailedRetraction;
- (BOOL)isFailedRetraction;
- (BOOL)isFromMe;
- (IMHandle)sender;
- (IMMessage)message;
- (NSArray)retractionUnsupportedByHandles;
- (NSString)messageGUID;
- (NSString)threadIdentifier;
- (id)_initWithItem:(id)a3 partIndex:(int64_t)a4 isFailedRetraction:(BOOL)a5 retractionUnsupportedByHandles:(id)a6 sender:(id)a7 isFromMe:(BOOL)a8;
- (int64_t)partIndex;
- (unint64_t)replyCount;
@end

@implementation IMMessageRetractionChatItem

- (id)_initWithItem:(id)a3 partIndex:(int64_t)a4 isFailedRetraction:(BOOL)a5 retractionUnsupportedByHandles:(id)a6 sender:(id)a7 isFromMe:(BOOL)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v53.receiver = self;
  v53.super_class = (Class)IMMessageRetractionChatItem;
  v17 = [(IMChatItem *)&v53 _initWithItem:v14];
  if (v17)
  {
    id v18 = [NSString alloc];
    v22 = objc_msgSend_guid(v14, v19, v20, v21);
    id v52 = v14;
    v25 = objc_msgSend_initWithFormat_(v18, v23, @"p:%ld/%@", v24, a4, v22);

    BOOL v51 = a8;
    v26 = NSNumber;
    uint64_t v30 = objc_msgSend_count(v17[10], v27, v28, v29);
    v33 = objc_msgSend_numberWithUnsignedInteger_(v26, v31, v30, v32);
    objc_msgSend_stringValue(v33, v34, v35, v36);
    id v37 = a7;
    int64_t v38 = a4;
    v39 = v15;
    v41 = id v40 = v16;
    v42 = (void *)sub_1A4C4EEE8();

    id v16 = v40;
    id v15 = v39;

    objc_msgSend__setGUID_(v17, v43, (uint64_t)v42, v44);
    v17[9] = (void *)v38;
    objc_storeStrong(v17 + 8, v37);
    *((unsigned char *)v17 + 56) = v51;
    *((unsigned char *)v17 + 57) = a5;
    uint64_t v48 = objc_msgSend_copy(v39, v45, v46, v47);
    v49 = v17[10];
    v17[10] = (void *)v48;

    id v14 = v52;
  }

  return v17;
}

- (BOOL)canRetryFailedRetraction
{
  v4 = objc_msgSend__retractedMessageItem(self, a2, v2, v3);
  char canRetryFailedRetraction = objc_msgSend_canRetryFailedRetraction(v4, v5, v6, v7);

  return canRetryFailedRetraction;
}

- (IMMessage)message
{
  v4 = objc_msgSend__retractedMessageItem(self, a2, v2, v3);
  v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (NSString)messageGUID
{
  v4 = objc_msgSend__retractedMessageItem(self, a2, v2, v3);
  v8 = objc_msgSend_guid(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (unint64_t)replyCount
{
  v5 = objc_msgSend__retractedMessageItem(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_partIndex(self, v6, v7, v8);
  v13 = objc_msgSend_replyCountsByPart(v5, v10, v11, v12);
  if (objc_msgSend_count(v13, v14, v15, v16))
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_1A4B344CC;
    uint64_t v29 = sub_1A4B3434C;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1A4BA7AA8;
    v24[3] = &unk_1E5B7CAB8;
    v24[4] = &v25;
    v24[5] = v9;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v17, (uint64_t)v24, v18);
    unint64_t v22 = objc_msgSend_unsignedIntegerValue((void *)v26[5], v19, v20, v21);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (NSString)threadIdentifier
{
  v4 = objc_msgSend__retractedMessageItem(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_threadIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (BOOL)canDelete
{
  return 0;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (int64_t)partIndex
{
  return self->_partIndex;
}

- (BOOL)isFailedRetraction
{
  return self->_isFailedRetraction;
}

- (NSArray)retractionUnsupportedByHandles
{
  return self->_retractionUnsupportedByHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retractionUnsupportedByHandles, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end