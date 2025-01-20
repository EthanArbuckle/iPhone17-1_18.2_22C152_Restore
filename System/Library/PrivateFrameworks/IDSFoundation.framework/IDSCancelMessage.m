@interface IDSCancelMessage
- (IDSCancelMessage)initWithQueueOneIdentifier:(id)a3 fromID:(id)a4;
- (NSString)fromID;
- (NSString)queueOneIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messageBody;
- (int64_t)command;
- (void)setFromID:(id)a3;
- (void)setQueueOneIdentifier:(id)a3;
@end

@implementation IDSCancelMessage

- (IDSCancelMessage)initWithQueueOneIdentifier:(id)a3 fromID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCancelMessage;
  v9 = [(IDSMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromID, a4);
    objc_storeStrong((id *)&v10->_queueOneIdentifier, a3);
  }

  return v10;
}

- (int64_t)command
{
  return 103;
}

- (id)messageBody
{
  v17.receiver = self;
  v17.super_class = (Class)IDSCancelMessage;
  v3 = [(IDSMessage *)&v17 messageBody];
  id v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  v11 = objc_msgSend_fromID(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v7, @"sP", v11);
  }

  v15 = objc_msgSend_queueOneIdentifier(self, v12, v13, v14);
  if (v15)
  {
    CFDictionarySetValue(v7, @"qI", v15);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB82634();
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)IDSCancelMessage;
  id v4 = [(IDSMessage *)&v18 copyWithZone:a3];
  id v8 = objc_msgSend_fromID(self, v5, v6, v7);
  objc_msgSend_setFromID_(v4, v9, (uint64_t)v8, v10);

  double v14 = objc_msgSend_queueOneIdentifier(self, v11, v12, v13);
  objc_msgSend_setQueueOneIdentifier_(v4, v15, (uint64_t)v14, v16);

  return v4;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_fromID(self, a2, v2, v3);
  double v10 = objc_msgSend_queueOneIdentifier(self, v7, v8, v9);
  double v13 = objc_msgSend_stringWithFormat_(v5, v11, @"<IDSCancelMessage %p: %@ %@>", v12, self, v6, v10);

  return v13;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (NSString)queueOneIdentifier
{
  return self->_queueOneIdentifier;
}

- (void)setQueueOneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueOneIdentifier, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
}

@end