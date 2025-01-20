@interface IMPlayedReceiptPipelineParameter
- (BOOL)isFromDefaultPairedDevice;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMDiMessageIDSTrustedData)idsTrustedData;
- (IMPlayedReceiptPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4 isFromDefaultPairedDevice:(BOOL)a5;
- (IMPlayedReceiptPipelineParameter)initWithIdsTrustedData:(id)a3 GUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7 isFromDefaultPairedDevice:(BOOL)a8;
- (NSArray)messageItems;
- (NSNumber)timestamp;
- (NSString)GUID;
- (NSString)fromIdentifier;
- (NSString)replicationSourceServiceName;
- (NSString)toIdentifier;
- (id)description;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setMessageItems:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation IMPlayedReceiptPipelineParameter

- (IMPlayedReceiptPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4 isFromDefaultPairedDevice:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [a3 metadata];
  v10 = [v9 messageGUID];
  v11 = [v10 UUIDString];
  v12 = (void *)[v11 copy];

  char v13 = objc_msgSend(v9, "has_timestamp");
  v14 = NSNumber;
  if (v13)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "timestamp"));
  }
  else
  {
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSince1970];
    v15 = objc_msgSend(v14, "numberWithDouble:");
  }
  v17 = [v9 storageContext];
  uint64_t v18 = [v17 isFromStorage];

  v19 = [v9 storageContext];
  uint64_t v20 = [v19 isLastFromStorage];

  v21 = [(IMPlayedReceiptPipelineParameter *)self initWithIdsTrustedData:v8 GUID:v12 timestamp:v15 isFromStorage:v18 isLastFromStorage:v20 isFromDefaultPairedDevice:v5];
  return v21;
}

- (IMPlayedReceiptPipelineParameter)initWithIdsTrustedData:(id)a3 GUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7 isFromDefaultPairedDevice:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IMPlayedReceiptPipelineParameter;
  v17 = [(IMPlayedReceiptPipelineParameter *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    idsTrustedData = v17->_idsTrustedData;
    v17->_idsTrustedData = (IMDiMessageIDSTrustedData *)v18;

    uint64_t v20 = [v15 copy];
    GUID = v17->_GUID;
    v17->_GUID = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    timestamp = v17->_timestamp;
    v17->_timestamp = (NSNumber *)v22;

    v17->_isFromStorage = a6;
    v17->_isLastFromStorage = a7;
    v17->_isFromDefaultPairedDevice = a8;
    uint64_t v24 = [v14 toIdentifier];
    toIdentifier = v17->_toIdentifier;
    v17->_toIdentifier = (NSString *)v24;

    uint64_t v26 = [v14 fromIdentifier];
    fromIdentifier = v17->_fromIdentifier;
    v17->_fromIdentifier = (NSString *)v26;
  }
  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMPlayedReceiptPipelineParameter *)self GUID];
  BOOL v5 = [(IMPlayedReceiptPipelineParameter *)self timestamp];
  if ([(IMPlayedReceiptPipelineParameter *)self isFromStorage]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([(IMPlayedReceiptPipelineParameter *)self isLastFromStorage]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  id v8 = [(IMPlayedReceiptPipelineParameter *)self idsTrustedData];
  v9 = [(IMPlayedReceiptPipelineParameter *)self chat];
  v10 = [(IMPlayedReceiptPipelineParameter *)self messageItems];
  objc_msgSend(v3, "stringWithFormat:", @"<IMPlayedReceiptPipelineParameter %p; GUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; idsTrustedData = %@; OUTPUT chat = %@; numMessageItems = %lu}",
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = [v10 count]);

  return v11;
}

- (IMDiMessageIDSTrustedData)idsTrustedData
{
  return self->_idsTrustedData;
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

- (NSString)GUID
{
  return self->_GUID;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (BOOL)isFromDefaultPairedDevice
{
  return self->_isFromDefaultPairedDevice;
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
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);

  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end