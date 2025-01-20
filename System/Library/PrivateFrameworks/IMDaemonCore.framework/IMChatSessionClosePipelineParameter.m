@interface IMChatSessionClosePipelineParameter
- (BOOL)deleteConversation;
- (BOOL)isEmergencySOS;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMChatSessionClosePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (NSArray)messageItems;
- (NSNumber)timestamp;
- (NSNumber)version;
- (NSString)GUID;
- (NSString)conversationID;
- (NSString)fromIdentifier;
- (NSString)replicationSourceServiceName;
- (NSString)senderHandle;
- (NSString)senderName;
- (NSString)toIdentifier;
- (id)description;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDeleteConversation:(BOOL)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setGUID:(id)a3;
- (void)setIsEmergencySOS:(BOOL)a3;
- (void)setIsFromStorage:(BOOL)a3;
- (void)setIsLastFromStorage:(BOOL)a3;
- (void)setMessageItems:(id)a3;
- (void)setSenderHandle:(id)a3;
- (void)setSenderName:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToIdentifier:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation IMChatSessionClosePipelineParameter

- (IMChatSessionClosePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IMChatSessionClosePipelineParameter;
  v8 = [(IMChatSessionClosePipelineParameter *)&v28 init];
  if (v8)
  {
    v9 = [v6 metadata];
    v10 = [v9 messageGUID];
    v11 = [v10 UUIDString];

    uint64_t v12 = [v9 timestamp];
    -[IMChatSessionClosePipelineParameter setIsEmergencySOS:](v8, "setIsEmergencySOS:", [v6 isEmergencySOS]);
    -[IMChatSessionClosePipelineParameter setDeleteConversation:](v8, "setDeleteConversation:", [v6 deleteConversation]);
    v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "version"));
    [(IMChatSessionClosePipelineParameter *)v8 setVersion:v13];

    v14 = [v6 handle];
    [(IMChatSessionClosePipelineParameter *)v8 setSenderHandle:v14];

    v15 = [v6 name];
    [(IMChatSessionClosePipelineParameter *)v8 setSenderName:v15];

    v16 = [v6 conversationID];
    [(IMChatSessionClosePipelineParameter *)v8 setConversationID:v16];

    [(IMChatSessionClosePipelineParameter *)v8 setGUID:v11];
    char v17 = objc_msgSend(v9, "has_timestamp");
    v18 = NSNumber;
    if (v17)
    {
      v19 = [NSNumber numberWithUnsignedLongLong:v12];
      [(IMChatSessionClosePipelineParameter *)v8 setTimestamp:v19];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSince1970];
      v20 = objc_msgSend(v18, "numberWithDouble:");
      [(IMChatSessionClosePipelineParameter *)v8 setTimestamp:v20];
    }
    v21 = [v9 storageContext];
    -[IMChatSessionClosePipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", [v21 isFromStorage]);

    v22 = [v9 storageContext];
    -[IMChatSessionClosePipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", [v22 isLastFromStorage]);

    uint64_t v23 = [v7 fromIdentifier];
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v23;

    uint64_t v25 = [v7 toIdentifier];
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v25;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMChatSessionClosePipelineParameter *)self GUID];
  v5 = [(IMChatSessionClosePipelineParameter *)self timestamp];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IMChatSessionClosePipelineParameter isFromStorage](self, "isFromStorage"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IMChatSessionClosePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v8 = [(IMChatSessionClosePipelineParameter *)self messageItems];
  v9 = [v3 stringWithFormat:@"<IMChatSessionClosePipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, output messageItems: %lu}", self, v4, v5, v6, v7, objc_msgSend(v8, "count")];

  return v9;
}

- (NSString)replicationSourceServiceName
{
  return 0;
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

- (BOOL)isEmergencySOS
{
  return self->_isEmergencySOS;
}

- (void)setIsEmergencySOS:(BOOL)a3
{
  self->_isEmergencySOS = a3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (BOOL)deleteConversation
{
  return self->_deleteConversation;
}

- (void)setDeleteConversation:(BOOL)a3
{
  self->_deleteConversation = a3;
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
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_GUID, 0);
}

@end