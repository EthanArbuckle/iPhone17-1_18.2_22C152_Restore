@interface IMMessageAcknowledgmentChatItem
- (BOOL)containsTransferGUID:(id)a3;
- (BOOL)isEqualToTapback:(id)a3;
- (BOOL)supportsCommunicationSafety;
- (IMMessage)message;
- (NSArray)fileTransferGUIDs;
- (id)_initWithItem:(id)a3 sender:(id)a4 tapback:(id)a5;
- (id)commSafetyTransferGUID;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMMessageAcknowledgmentChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v12 = objc_msgSend_sender(self, v9, v10, v11);
  v16 = objc_msgSend_tapback(self, v13, v14, v15);
  v18 = objc_msgSend__initWithItem_sender_tapback_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 tapback:(id)a5
{
  id v8 = a5;
  uint64_t v10 = objc_msgSend__initWithItem_sender_(self, v9, (uint64_t)a3, (uint64_t)a4);
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setTapback_(v10, v11, (uint64_t)v8, v12);
    uint64_t v17 = 10;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_msgSend__setGeometryDescriptor_(v13, v14, (uint64_t)&v17, v15);
  }

  return v13;
}

- (BOOL)isEqualToTapback:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_associatedMessageType(self, v5, v6, v7);
  if (v8 != objc_msgSend_associatedMessageType(v4, v9, v10, v11)) {
    goto LABEL_6;
  }
  if (objc_msgSend_associatedMessageType(self, v12, v13, v14) != 2006) {
    goto LABEL_5;
  }
  long long v18 = objc_msgSend_associatedMessageEmoji(self, v15, v16, v17);
  v22 = objc_msgSend_associatedMessageEmoji(v4, v19, v20, v21);

  if (v18 == v22
    || (objc_msgSend_associatedMessageEmoji(self, v23, v24, v25),
        v26 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_associatedMessageEmoji(v4, v27, v28, v29),
        v30 = objc_claimAutoreleasedReturnValue(),
        char isEqual = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32),
        v30,
        v26,
        (isEqual & 1) != 0))
  {
LABEL_5:
    BOOL v34 = 1;
  }
  else
  {
LABEL_6:
    BOOL v34 = 0;
  }

  return v34;
}

- (BOOL)containsTransferGUID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_fileTransferGUIDs(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (NSArray)fileTransferGUIDs
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_fileTransferGUIDs(v4, v5, v6, v7);

  return (NSArray *)v8;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (id)commSafetyTransferGUID
{
  v5 = objc_msgSend_tapback(self, a2, v2, v3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = objc_msgSend_tapback(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_transferGUID(v10, v11, v12, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (IMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end