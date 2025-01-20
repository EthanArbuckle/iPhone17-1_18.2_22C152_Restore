@interface MTRMessagesClusterMessageQueuedEvent
- (MTRMessagesClusterMessageQueuedEvent)init;
- (NSData)messageID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMessageID:(id)a3;
@end

@implementation MTRMessagesClusterMessageQueuedEvent

- (MTRMessagesClusterMessageQueuedEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRMessagesClusterMessageQueuedEvent;
  v4 = [(MTRMessagesClusterMessageQueuedEvent *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMessagesClusterMessageQueuedEvent);
  v7 = objc_msgSend_messageID(self, v5, v6);
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"<%@: messageID:%@ >", v5, v7);;

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end