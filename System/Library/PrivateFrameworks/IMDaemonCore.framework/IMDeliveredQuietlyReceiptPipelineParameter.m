@interface IMDeliveredQuietlyReceiptPipelineParameter
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMDeliveredQuietlyReceiptPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
- (IMDeliveredQuietlyReceiptPipelineParameter)initWithIdsTrustedData:(id)a3 GUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7;
- (IMDiMessageIDSTrustedData)idsTrustedData;
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

@implementation IMDeliveredQuietlyReceiptPipelineParameter

- (IMDeliveredQuietlyReceiptPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a4;
  v7 = [a3 metadata];
  v8 = [v7 messageGUID];
  v9 = [v8 UUIDString];
  v10 = (void *)[v9 copy];

  char v11 = objc_msgSend(v7, "has_timestamp");
  v12 = NSNumber;
  if (v11)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "timestamp"));
  }
  else
  {
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSince1970];
    v13 = objc_msgSend(v12, "numberWithDouble:");
  }
  v15 = [v7 storageContext];
  uint64_t v16 = [v15 isFromStorage];

  v17 = [v7 storageContext];
  uint64_t v18 = [v17 isLastFromStorage];

  v19 = [(IMDeliveredQuietlyReceiptPipelineParameter *)self initWithIdsTrustedData:v6 GUID:v10 timestamp:v13 isFromStorage:v16 isLastFromStorage:v18];
  return v19;
}

- (IMDeliveredQuietlyReceiptPipelineParameter)initWithIdsTrustedData:(id)a3 GUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMDeliveredQuietlyReceiptPipelineParameter;
  v15 = [(IMDeliveredQuietlyReceiptPipelineParameter *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    idsTrustedData = v15->_idsTrustedData;
    v15->_idsTrustedData = (IMDiMessageIDSTrustedData *)v16;

    uint64_t v18 = [v13 copy];
    GUID = v15->_GUID;
    v15->_GUID = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    timestamp = v15->_timestamp;
    v15->_timestamp = (NSNumber *)v20;

    v15->_isFromStorage = a6;
    v15->_isLastFromStorage = a7;
    uint64_t v22 = [v12 fromIdentifier];
    fromIdentifier = v15->_fromIdentifier;
    v15->_fromIdentifier = (NSString *)v22;

    uint64_t v24 = [v12 toIdentifier];
    toIdentifier = v15->_toIdentifier;
    v15->_toIdentifier = (NSString *)v24;
  }
  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMDeliveredQuietlyReceiptPipelineParameter *)self GUID];
  v5 = [(IMDeliveredQuietlyReceiptPipelineParameter *)self timestamp];
  if ([(IMDeliveredQuietlyReceiptPipelineParameter *)self isFromStorage]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if ([(IMDeliveredQuietlyReceiptPipelineParameter *)self isLastFromStorage]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [(IMDeliveredQuietlyReceiptPipelineParameter *)self idsTrustedData];
  v9 = [(IMDeliveredQuietlyReceiptPipelineParameter *)self chat];
  v10 = [(IMDeliveredQuietlyReceiptPipelineParameter *)self messageItems];
  objc_msgSend(v3, "stringWithFormat:", @"<IMDeliveredQuietlyReceiptPipelineParameter %p; GUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; idsTrustedData = %@; OUTPUT chat = %@; numMessageItems = %lu}",
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
  char v11 = [v10 count]);

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