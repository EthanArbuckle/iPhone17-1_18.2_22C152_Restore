@interface CATIDSMessageMetadata
+ (id)instanceWithDictionary:(id)a3;
- (CATIDSMessageMetadata)initWithMessageIdentifier:(id)a3 messageType:(int64_t)a4 messagingVersion:(int64_t)a5;
- (CATIDSMessageMetadata)initWithMessageType:(int64_t)a3;
- (NSDictionary)dictionaryValue;
- (NSUUID)messageIdentifier;
- (int64_t)messageType;
- (unint64_t)messagingVersion;
@end

@implementation CATIDSMessageMetadata

- (CATIDSMessageMetadata)initWithMessageIdentifier:(id)a3 messageType:(int64_t)a4 messagingVersion:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CATIDSMessageMetadata;
  v10 = [(CATIDSMessageMetadata *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageIdentifier, a3);
    v11->_messageType = a4;
    v11->_messagingVersion = a5;
  }

  return v11;
}

- (CATIDSMessageMetadata)initWithMessageType:(int64_t)a3
{
  v5 = [MEMORY[0x263F08C38] UUID];
  v6 = [(CATIDSMessageMetadata *)self initWithMessageIdentifier:v5 messageType:a3 messagingVersion:2];

  return v6;
}

- (NSDictionary)dictionaryValue
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"MessageIdentifier";
  v3 = [(CATIDSMessageMetadata *)self messageIdentifier];
  v4 = [v3 UUIDString];
  v10[0] = v4;
  v9[1] = @"ContentType";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CATIDSMessageMetadata messageType](self, "messageType"));
  v10[1] = v5;
  v9[2] = @"MessagingVersion";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATIDSMessageMetadata messagingVersion](self, "messagingVersion"));
  v9[3] = @"MessageType";
  v10[2] = v6;
  v10[3] = &unk_26C4B5E08;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "cat_uuidForKey:", @"MessageIdentifier");
  v5 = [v3 objectForKeyedSubscript:@"ContentType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v3 objectForKeyedSubscript:@"MessagingVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  v11 = 0;
  if (v4)
  {
    if (v7 && v10 != 0) {
      v11 = -[CATIDSMessageMetadata initWithMessageIdentifier:messageType:messagingVersion:]([CATIDSMessageMetadata alloc], "initWithMessageIdentifier:messageType:messagingVersion:", v4, [v7 integerValue], objc_msgSend(v10, "unsignedIntegerValue"));
    }
  }

  return v11;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (unint64_t)messagingVersion
{
  return self->_messagingVersion;
}

- (void).cxx_destruct
{
}

@end