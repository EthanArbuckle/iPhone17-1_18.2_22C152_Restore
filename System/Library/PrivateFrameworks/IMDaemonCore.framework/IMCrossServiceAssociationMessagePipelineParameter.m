@interface IMCrossServiceAssociationMessagePipelineParameter
- (BOOL)isFromMe;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (IMCrossServiceAssociationMessagePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (NSArray)messageItems;
- (NSArray)participantIdentifiers;
- (NSString)GUID;
- (NSString)currentGroupName;
- (NSString)fromDisplayID;
- (NSString)fromIdentifier;
- (NSString)groupID;
- (NSString)replacementGUID;
- (NSString)replicationSourceServiceName;
- (NSString)toIdentifier;
- (id)description;
- (unint64_t)crossServiceDeduplicationMechanism;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setMessageItems:(id)a3;
- (void)setServiceSession:(id)a3;
@end

@implementation IMCrossServiceAssociationMessagePipelineParameter

- (IMCrossServiceAssociationMessagePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)IMCrossServiceAssociationMessagePipelineParameter;
  v8 = [(IMCrossServiceAssociationMessagePipelineParameter *)&v33 init];
  v9 = v8;
  if (v8)
  {
    replicationSourceServiceName = v8->_replicationSourceServiceName;
    v8->_replicationSourceServiceName = 0;

    uint64_t v11 = [v7 toIdentifier];
    toIdentifier = v9->_toIdentifier;
    v9->_toIdentifier = (NSString *)v11;

    uint64_t v13 = [v7 fromIdentifier];
    fromIdentifier = v9->_fromIdentifier;
    v9->_fromIdentifier = (NSString *)v13;

    v9->_isFromMe = [v7 isFromMe];
    v15 = [(IMCrossServiceAssociationMessagePipelineParameter *)v9 fromIdentifier];
    uint64_t v16 = [v15 _stripFZIDPrefix];
    fromDisplayID = v9->_fromDisplayID;
    v9->_fromDisplayID = (NSString *)v16;

    groupID = v9->_groupID;
    v9->_groupID = 0;

    currentGroupName = v9->_currentGroupName;
    v9->_currentGroupName = 0;

    participantIdentifiers = v9->_participantIdentifiers;
    v9->_participantIdentifiers = 0;

    v9->_crossServiceDeduplicationMechanism = 1;
    v21 = [v6 replacementGUID];
    uint64_t v22 = [v21 UUIDString];
    replacementGUID = v9->_replacementGUID;
    v9->_replacementGUID = (NSString *)v22;

    v24 = [v6 metadata];
    v25 = [v24 messageGUID];
    uint64_t v26 = [v25 UUIDString];
    GUID = v9->_GUID;
    v9->_GUID = (NSString *)v26;

    v28 = [v6 metadata];
    v29 = [v28 storageContext];
    v9->_isFromStorage = [v29 isFromStorage];

    v30 = [v6 metadata];
    v31 = [v30 storageContext];
    v9->_isLastFromStorage = [v31 isLastFromStorage];
  }
  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMCrossServiceAssociationMessagePipelineParameter %p> { guid: %@, replacementGUID: %@ }", self, self->_GUID, self->_replacementGUID];
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
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

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (NSString)fromDisplayID
{
  return self->_fromDisplayID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)currentGroupName
{
  return self->_currentGroupName;
}

- (NSArray)participantIdentifiers
{
  return self->_participantIdentifiers;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (NSString)replacementGUID
{
  return self->_replacementGUID;
}

- (unint64_t)crossServiceDeduplicationMechanism
{
  return self->_crossServiceDeduplicationMechanism;
}

- (NSString)GUID
{
  return self->_GUID;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_replacementGUID, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_participantIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentGroupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_fromDisplayID, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);

  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
}

@end