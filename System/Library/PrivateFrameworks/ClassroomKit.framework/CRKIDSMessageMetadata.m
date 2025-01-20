@interface CRKIDSMessageMetadata
+ (CRKIDSMessageMetadata)metadataWithMessageType:(int64_t)a3;
+ (id)instanceWithDictionary:(id)a3;
- (CRKIDSMessageMetadata)initWithMessageIdentifier:(id)a3 messageType:(int64_t)a4 messagingVersion:(int64_t)a5;
- (NSDictionary)dictionaryValue;
- (NSUUID)messageIdentifier;
- (int64_t)messageType;
- (int64_t)messagingVersion;
@end

@implementation CRKIDSMessageMetadata

- (CRKIDSMessageMetadata)initWithMessageIdentifier:(id)a3 messageType:(int64_t)a4 messagingVersion:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKIDSMessageMetadata;
  v10 = [(CRKIDSMessageMetadata *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageIdentifier, a3);
    v11->_messageType = a4;
    v11->_messagingVersion = a5;
  }

  return v11;
}

+ (CRKIDSMessageMetadata)metadataWithMessageType:(int64_t)a3
{
  v5 = [MEMORY[0x263F08C38] UUID];
  v6 = (void *)[objc_alloc((Class)a1) initWithMessageIdentifier:v5 messageType:a3 messagingVersion:1];

  return (CRKIDSMessageMetadata *)v6;
}

- (NSDictionary)dictionaryValue
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"MessageIdentifier";
  v3 = [(CRKIDSMessageMetadata *)self messageIdentifier];
  v4 = [v3 UUIDString];
  v10[0] = v4;
  v9[1] = @"MessageType";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKIDSMessageMetadata messageType](self, "messageType"));
  v10[1] = v5;
  v9[2] = @"MessagingVersion";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKIDSMessageMetadata messagingVersion](self, "messagingVersion"));
  v10[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v7;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"MessageType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"MessageIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  v11 = [v4 objectForKeyedSubscript:@"MessagingVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = 0;
  if (v7 && v10 && v13)
  {
    uint64_t v15 = [v7 integerValue];
    v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
    uint64_t v17 = [v13 integerValue];
    v14 = 0;
    if (v16 && (v15 & 0x8000000000000000) == 0 && v15 <= 2) {
      v14 = (void *)[objc_alloc((Class)a1) initWithMessageIdentifier:v16 messageType:v15 messagingVersion:v17];
    }
  }

  return v14;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (int64_t)messagingVersion
{
  return self->_messagingVersion;
}

- (void).cxx_destruct
{
}

@end