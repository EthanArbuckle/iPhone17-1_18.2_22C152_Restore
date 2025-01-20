@interface IMReadReceiptPipelineParameter
- (BOOL)isFromDefaultPairedDevice;
- (BOOL)isFromMe;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMReadReceiptPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (NSArray)messageItems;
- (NSNumber)timestamp;
- (NSString)GUID;
- (NSString)fromIdentifier;
- (NSString)fromPushID;
- (NSString)replicationSourceServiceName;
- (NSString)toIdentifier;
- (id)description;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setFromPushID:(id)a3;
- (void)setGUID:(id)a3;
- (void)setIsFromDefaultPairedDevice:(BOOL)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsFromStorage:(BOOL)a3;
- (void)setIsLastFromStorage:(BOOL)a3;
- (void)setMessageItems:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation IMReadReceiptPipelineParameter

- (IMReadReceiptPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IMReadReceiptPipelineParameter;
  v8 = [(IMReadReceiptPipelineParameter *)&v24 init];
  if (v8)
  {
    v9 = [v6 metadata];
    v10 = [v9 messageGUID];
    v11 = [v10 UUIDString];

    uint64_t v12 = [v9 timestamp];
    [(IMReadReceiptPipelineParameter *)v8 setGUID:v11];
    char v13 = objc_msgSend(v9, "has_timestamp");
    v14 = NSNumber;
    if (v13)
    {
      v15 = [NSNumber numberWithUnsignedLongLong:v12];
      [(IMReadReceiptPipelineParameter *)v8 setTimestamp:v15];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSince1970];
      v16 = objc_msgSend(v14, "numberWithDouble:");
      [(IMReadReceiptPipelineParameter *)v8 setTimestamp:v16];
    }
    v17 = [v9 storageContext];
    -[IMReadReceiptPipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", [v17 isFromStorage]);

    v18 = [v9 storageContext];
    -[IMReadReceiptPipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", [v18 isLastFromStorage]);

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
  v4 = [(IMReadReceiptPipelineParameter *)self GUID];
  v5 = [(IMReadReceiptPipelineParameter *)self timestamp];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IMReadReceiptPipelineParameter isFromStorage](self, "isFromStorage"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IMReadReceiptPipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IMReadReceiptPipelineParameter isFromMe](self, "isFromMe"));
  v9 = [(IMReadReceiptPipelineParameter *)self messageItems];
  v10 = [v3 stringWithFormat:@"<IMReadReceiptPipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}", self, v4, v5, v6, v7, v8, objc_msgSend(v9, "count")];

  return v10;
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

- (NSString)fromPushID
{
  return self->_fromPushID;
}

- (void)setFromPushID:(id)a3
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

- (BOOL)isFromDefaultPairedDevice
{
  return self->_isFromDefaultPairedDevice;
}

- (void)setIsFromDefaultPairedDevice:(BOOL)a3
{
  self->_isFromDefaultPairedDevice = a3;
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

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
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
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_fromPushID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_GUID, 0);
}

@end