@interface IMRepositionStickerCommandPipelineParameter
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (BlastDoorStickerAttachmentInfo)stickerAttachmentInfo;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMRepositionStickerCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
- (NSArray)messageItems;
- (NSString)GUID;
- (NSString)fromIdentifier;
- (NSString)replicationSourceServiceName;
- (NSString)stickerEditedMessageGuid;
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

@implementation IMRepositionStickerCommandPipelineParameter

- (IMRepositionStickerCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IMRepositionStickerCommandPipelineParameter;
  v8 = [(IMRepositionStickerCommandPipelineParameter *)&v24 init];
  if (v8)
  {
    v9 = [v6 metadata];
    uint64_t v10 = [v7 fromIdentifier];
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 toIdentifier];
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v12;

    v14 = [v9 messageGUID];
    uint64_t v15 = [v14 UUIDString];
    GUID = v8->_GUID;
    v8->_GUID = (NSString *)v15;

    uint64_t v17 = [v6 stickerMetadata];
    stickerAttachmentInfo = v8->_stickerAttachmentInfo;
    v8->_stickerAttachmentInfo = (BlastDoorStickerAttachmentInfo *)v17;

    uint64_t v19 = [v6 stickerEditedMessageGUID];
    stickerEditedMessageGuid = v8->_stickerEditedMessageGuid;
    v8->_stickerEditedMessageGuid = (NSString *)v19;

    v21 = [v9 storageContext];
    v8->_isFromStorage = [v21 isFromStorage];

    v22 = [v9 storageContext];
    v8->_isLastFromStorage = [v22 isLastFromStorage];
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMRepositionStickerCommandPipelineParameter *)self GUID];
  v5 = [(IMRepositionStickerCommandPipelineParameter *)self stickerEditedMessageGuid];
  id v6 = @"YES";
  if ([(IMRepositionStickerCommandPipelineParameter *)self isFromStorage]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if (![(IMRepositionStickerCommandPipelineParameter *)self isLastFromStorage]) {
    id v6 = @"NO";
  }
  v8 = [(IMRepositionStickerCommandPipelineParameter *)self chat];
  objc_msgSend(v3, "stringWithFormat:", @"<IMRepositionStickerCommandPipelineParameter %p; GUID = %@; stickerEditedMessageGUID = %@; isFromStorage = %@; isLastFromStorage = %@; OUTPUT chat = %@;",
    self,
    v4,
    v5,
    v7,
    v6,
  v9 = v8);

  return v9;
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

- (BlastDoorStickerAttachmentInfo)stickerAttachmentInfo
{
  return self->_stickerAttachmentInfo;
}

- (NSString)stickerEditedMessageGuid
{
  return self->_stickerEditedMessageGuid;
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
  objc_storeStrong((id *)&self->_stickerEditedMessageGuid, 0);
  objc_storeStrong((id *)&self->_stickerAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);

  objc_storeStrong((id *)&self->_fromIdentifier, 0);
}

@end