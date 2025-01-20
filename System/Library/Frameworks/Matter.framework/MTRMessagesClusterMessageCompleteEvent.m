@interface MTRMessagesClusterMessageCompleteEvent
- (MTRMessagesClusterMessageCompleteEvent)init;
- (NSData)messageID;
- (NSNumber)futureMessagesPreference;
- (NSNumber)responseID;
- (NSString)reply;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFutureMessagesPreference:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setReply:(id)a3;
- (void)setResponseID:(id)a3;
@end

@implementation MTRMessagesClusterMessageCompleteEvent

- (MTRMessagesClusterMessageCompleteEvent)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRMessagesClusterMessageCompleteEvent;
  v4 = [(MTRMessagesClusterMessageCompleteEvent *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

    responseID = v4->_responseID;
    v4->_responseID = 0;

    reply = v4->_reply;
    v4->_reply = 0;

    futureMessagesPreference = v4->_futureMessagesPreference;
    v4->_futureMessagesPreference = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMessagesClusterMessageCompleteEvent);
  v7 = objc_msgSend_messageID(self, v5, v6);
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_responseID(self, v9, v10);
  objc_msgSend_setResponseID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_reply(self, v13, v14);
  objc_msgSend_setReply_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_futureMessagesPreference(self, v17, v18);
  objc_msgSend_setFutureMessagesPreference_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: messageID:%@; responseID:%@; reply:%@; futureMessagesPreference:%@; >",
    v5,
    v7,
    self->_responseID,
    self->_reply,
  v9 = self->_futureMessagesPreference);

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSNumber)responseID
{
  return self->_responseID;
}

- (void)setResponseID:(id)a3
{
}

- (NSString)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSNumber)futureMessagesPreference
{
  return self->_futureMessagesPreference;
}

- (void)setFutureMessagesPreference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureMessagesPreference, 0);
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_responseID, 0);

  objc_storeStrong((id *)&self->_messageID, 0);
}

@end