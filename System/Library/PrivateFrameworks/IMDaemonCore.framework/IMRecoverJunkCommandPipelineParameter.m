@interface IMRecoverJunkCommandPipelineParameter
- (BOOL)isFromMe;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMRecoverJunkCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
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

@implementation IMRecoverJunkCommandPipelineParameter

- (IMRecoverJunkCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IMRecoverJunkCommandPipelineParameter;
  v8 = [(IMRecoverJunkCommandPipelineParameter *)&v26 init];
  if (v8)
  {
    v9 = [v6 metadata];
    v10 = [v9 messageGUID];
    uint64_t v11 = [v10 UUIDString];
    GUID = v8->_GUID;
    v8->_GUID = (NSString *)v11;

    char v13 = objc_msgSend(v9, "has_timestamp");
    v14 = NSNumber;
    if (v13)
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "timestamp"));
      timestamp = v8->_timestamp;
      v8->_timestamp = (NSNumber *)v15;
    }
    else
    {
      timestamp = [MEMORY[0x1E4F1C9C8] date];
      [timestamp timeIntervalSince1970];
      uint64_t v17 = objc_msgSend(v14, "numberWithDouble:");
      v18 = v8->_timestamp;
      v8->_timestamp = (NSNumber *)v17;
    }
    v8->_isFromMe = [v7 isFromMe];
    v19 = [v9 storageContext];
    v8->_isFromStorage = [v19 isFromStorage];

    v20 = [v9 storageContext];
    v8->_isLastFromStorage = [v20 isLastFromStorage];

    uint64_t v21 = [v7 fromIdentifier];
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v21;

    uint64_t v23 = [v7 toIdentifier];
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v23;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMRecoverJunkCommandPipelineParameter *)self GUID];
  v5 = [(IMRecoverJunkCommandPipelineParameter *)self timestamp];
  id v6 = @"YES";
  if ([(IMRecoverJunkCommandPipelineParameter *)self isFromStorage]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(IMRecoverJunkCommandPipelineParameter *)self isLastFromStorage]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (![(IMRecoverJunkCommandPipelineParameter *)self isFromMe]) {
    id v6 = @"NO";
  }
  v9 = [(IMRecoverJunkCommandPipelineParameter *)self chat];
  objc_msgSend(v3, "stringWithFormat:", @"<IMRecoverJunkCommandPipelineParameter %p; GUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; isFromMe = %@; OUTPUT chat = %@;",
    self,
    v4,
    v5,
    v7,
    v8,
    v6,
  v10 = v9);

  return v10;
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

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);

  objc_storeStrong((id *)&self->_fromIdentifier, 0);
}

@end