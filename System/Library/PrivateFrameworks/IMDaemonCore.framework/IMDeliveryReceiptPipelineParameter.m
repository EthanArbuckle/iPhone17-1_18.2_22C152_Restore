@interface IMDeliveryReceiptPipelineParameter
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMDeliveryReceiptPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (NSArray)messageItems;
- (NSNumber)timestamp;
- (NSSet)senderRegistrationProperties;
- (NSString)GUID;
- (NSString)fromIdentifier;
- (NSString)replicationSourceServiceName;
- (NSString)toIdentifier;
- (id)description;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setGUID:(id)a3;
- (void)setIsFromStorage:(BOOL)a3;
- (void)setIsLastFromStorage:(BOOL)a3;
- (void)setMessageItems:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setSenderRegistrationProperties:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation IMDeliveryReceiptPipelineParameter

- (IMDeliveryReceiptPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IMDeliveryReceiptPipelineParameter;
  v8 = [(IMDeliveryReceiptPipelineParameter *)&v24 init];
  if (v8)
  {
    v9 = [v6 metadata];
    v10 = [v9 messageGUID];
    v11 = [v10 UUIDString];

    uint64_t v12 = [v9 timestamp];
    [(IMDeliveryReceiptPipelineParameter *)v8 setGUID:v11];
    char v13 = objc_msgSend(v9, "has_timestamp");
    v14 = NSNumber;
    if (v13)
    {
      v15 = [NSNumber numberWithUnsignedLongLong:v12];
      [(IMDeliveryReceiptPipelineParameter *)v8 setTimestamp:v15];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSince1970];
      v16 = objc_msgSend(v14, "numberWithDouble:");
      [(IMDeliveryReceiptPipelineParameter *)v8 setTimestamp:v16];
    }
    v17 = [v9 storageContext];
    -[IMDeliveryReceiptPipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", [v17 isFromStorage]);

    v18 = [v9 storageContext];
    -[IMDeliveryReceiptPipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", [v18 isLastFromStorage]);

    uint64_t v19 = [v7 fromIdentifier];
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v19;

    uint64_t v21 = [v7 toIdentifier];
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v21;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMDeliveryReceiptPipelineParameter *)self GUID];
  v5 = [(IMDeliveryReceiptPipelineParameter *)self timestamp];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDeliveryReceiptPipelineParameter isFromStorage](self, "isFromStorage"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDeliveryReceiptPipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v8 = [(IMDeliveryReceiptPipelineParameter *)self messageItems];
  v9 = [v3 stringWithFormat:@"<IMDeliveryReceiptPipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, output messageItems: %lu}", self, v4, v5, v6, v7, objc_msgSend(v8, "count")];

  return v9;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (void)setIsFromStorage:(BOOL)a3
{
  self->_isFromStorage = a3;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (void)setIsLastFromStorage:(BOOL)a3
{
  self->_isLastFromStorage = a3;
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
}

- (NSSet)senderRegistrationProperties
{
  return self->_senderRegistrationProperties;
}

- (void)setSenderRegistrationProperties:(id)a3
{
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (void)setReplicationSourceServiceName:(id)a3
{
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (IMDServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_senderRegistrationProperties, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_GUID, 0);
}

@end