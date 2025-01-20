@interface IMMarkUnreadRequestPipelineParameter
- (BOOL)isFromMe;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMMarkUnreadRequestPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
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
- (void)setGUID:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsFromStorage:(BOOL)a3;
- (void)setIsLastFromStorage:(BOOL)a3;
- (void)setMessageItems:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation IMMarkUnreadRequestPipelineParameter

- (IMMarkUnreadRequestPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IMMarkUnreadRequestPipelineParameter;
  v8 = [(IMMarkUnreadRequestPipelineParameter *)&v23 init];
  if (v8)
  {
    v9 = [v6 metadata];
    v10 = [v9 messageGUID];
    v11 = [v10 UUIDString];
    [(IMMarkUnreadRequestPipelineParameter *)v8 setGUID:v11];

    char v12 = objc_msgSend(v9, "has_timestamp");
    v13 = NSNumber;
    if (v12)
    {
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "timestamp"));
      [(IMMarkUnreadRequestPipelineParameter *)v8 setTimestamp:v14];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSince1970];
      v15 = objc_msgSend(v13, "numberWithDouble:");
      [(IMMarkUnreadRequestPipelineParameter *)v8 setTimestamp:v15];
    }
    -[IMMarkUnreadRequestPipelineParameter setIsFromMe:](v8, "setIsFromMe:", [v7 isFromMe]);
    v16 = [v9 storageContext];
    -[IMMarkUnreadRequestPipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", [v16 isFromStorage]);

    v17 = [v9 storageContext];
    -[IMMarkUnreadRequestPipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", [v17 isLastFromStorage]);

    uint64_t v18 = [v7 fromIdentifier];
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v18;

    uint64_t v20 = [v7 toIdentifier];
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v20;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMMarkUnreadRequestPipelineParameter *)self GUID];
  v5 = [(IMMarkUnreadRequestPipelineParameter *)self timestamp];
  id v6 = [(IMMarkUnreadRequestPipelineParameter *)self messageItems];
  id v7 = [v3 stringWithFormat:@"<IMMarkUnreadRequestPipelineParameter %p> { guid: %@, timestamp: %@, output messageItems: %lu}", self, v4, v5, objc_msgSend(v6, "count")];

  return v7;
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

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
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
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_GUID, 0);
}

@end