@interface EMOutgoingMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldEncrypt;
- (BOOL)shouldSign;
- (EMMessageObjectID)originalMessageID;
- (EMOutgoingMessage)initWithBuilder:(id)a3;
- (EMOutgoingMessage)initWithCoder:(id)a3;
- (EMOutgoingMessage)initWithMessageData:(id)a3;
- (NSData)messageData;
- (NSString)ef_publicDescription;
- (int64_t)action;
- (int64_t)conversationNotificationLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setConversationNotificationLevel:(int64_t)a3;
- (void)setMessageData:(id)a3;
- (void)setOriginalMessageID:(id)a3;
- (void)setShouldEncrypt:(BOOL)a3;
- (void)setShouldSign:(BOOL)a3;
@end

@implementation EMOutgoingMessage

- (EMOutgoingMessage)initWithMessageData:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__EMOutgoingMessage_initWithMessageData___block_invoke;
  v8[3] = &unk_1E63E5B40;
  id v9 = v4;
  id v5 = v4;
  v6 = [(EMOutgoingMessage *)self initWithBuilder:v8];

  return v6;
}

void __41__EMOutgoingMessage_initWithMessageData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setMessageData:*(void *)(a1 + 32)];
  [v3 setAction:0];
  [v3 setOriginalMessageID:0];
  [v3 setShouldSign:0];
  [v3 setShouldEncrypt:0];
  [v3 setConversationNotificationLevel:0];
}

- (EMOutgoingMessage)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, EMOutgoingMessage *))a3;
  v7.receiver = self;
  v7.super_class = (Class)EMOutgoingMessage;
  id v5 = [(EMOutgoingMessage *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMOutgoingMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__EMOutgoingMessage_initWithCoder___block_invoke;
  v8[3] = &unk_1E63E5B40;
  id v9 = v4;
  id v5 = v4;
  v6 = [(EMOutgoingMessage *)self initWithBuilder:v8];

  return v6;
}

void __35__EMOutgoingMessage_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_messageData"];
  [v5 setMessageData:v3];

  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_originalMessageID"];
  [v5 setOriginalMessageID:v4];

  objc_msgSend(v5, "setAction:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_action"));
  objc_msgSend(v5, "setShouldSign:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_shouldSign"));
  objc_msgSend(v5, "setShouldEncrypt:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_shouldEncrypt"));
  objc_msgSend(v5, "setConversationNotificationLevel:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_conversationNotificationLevel"));
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMOutgoingMessage *)self messageData];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_messageData"];

  id v5 = [(EMOutgoingMessage *)self originalMessageID];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_originalMessageID"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMOutgoingMessage action](self, "action"), @"EFPropertyKey_action");
  objc_msgSend(v6, "encodeBool:forKey:", -[EMOutgoingMessage shouldSign](self, "shouldSign"), @"EFPropertyKey_shouldSign");
  objc_msgSend(v6, "encodeBool:forKey:", -[EMOutgoingMessage shouldEncrypt](self, "shouldEncrypt"), @"EFPropertyKey_shouldEncrypt");
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMOutgoingMessage conversationNotificationLevel](self, "conversationNotificationLevel"), @"EFPropertyKey_conversationNotificationLevel");
}

- (NSString)ef_publicDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMOutgoingMessage *)self originalMessageID];
  int64_t v6 = [(EMOutgoingMessage *)self action];
  if ([(EMOutgoingMessage *)self shouldSign]) {
    objc_super v7 = @"YES";
  }
  else {
    objc_super v7 = @"NO";
  }
  BOOL v8 = [(EMOutgoingMessage *)self shouldEncrypt];
  int64_t v9 = [(EMOutgoingMessage *)self conversationNotificationLevel];
  if (v8) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = [v3 stringWithFormat:@"<%@: %p>\n\tOriginalMessageID: %@\n\tAction: %lu\n\tShouldSign: %@\n\tShouldEncrypt: %@\n\tConversationNotificationLevel: %lu", v4, self, v5, v6, v7, v10, v9];

  return (NSString *)v11;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (EMMessageObjectID)originalMessageID
{
  return self->_originalMessageID;
}

- (void)setOriginalMessageID:(id)a3
{
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessageID, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end