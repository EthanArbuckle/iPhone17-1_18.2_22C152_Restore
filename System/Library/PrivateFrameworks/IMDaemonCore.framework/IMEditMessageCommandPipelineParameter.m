@interface IMEditMessageCommandPipelineParameter
- (BOOL)hasEditTypeAndPartIndex;
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (BOOL)shouldRetractMessageSubject;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMDiMessageIDSTrustedData)idsTrustedData;
- (IMEditMessageCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4;
- (IMEditMessageCommandPipelineParameter)initWithIdsTrustedData:(id)a3 editCommandGUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7 editedMessageGUID:(id)a8 editedMessagePartIndex:(int64_t)a9 editType:(unint64_t)a10 editedMessagePartBody:(id)a11 editedMessagePartFileTransferGUIDs:(id)a12 shouldRetractMessageSubject:(BOOL)a13 hasEditTypeAndPartIndex:(BOOL)a14;
- (NSArray)editedMessagePartFileTransferGUIDs;
- (NSArray)messageItems;
- (NSAttributedString)editedMessagePartBody;
- (NSNumber)timestamp;
- (NSString)editCommandGUID;
- (NSString)editedMessageGUID;
- (NSString)fromIdentifier;
- (NSString)replicationSourceServiceName;
- (NSString)toIdentifier;
- (id)_createSuperFormattedStringWithAttributedString:(id)a3;
- (id)_existingFileTransfersForMessageGuid:(id)a3;
- (id)description;
- (int64_t)editedMessagePartIndex;
- (unint64_t)_messageItemEditTypeForBlastdoorEditType:(int64_t)a3;
- (unint64_t)editType;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setMessageItems:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation IMEditMessageCommandPipelineParameter

- (IMEditMessageCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 metadata];
  v9 = [v8 messageGUID];
  v10 = [v9 UUIDString];
  v40 = (void *)[v10 copy];

  char v11 = objc_msgSend(v8, "has_timestamp");
  v12 = NSNumber;
  if (v11)
  {
    v39 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "timestamp"));
  }
  else
  {
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSince1970];
    v39 = objc_msgSend(v12, "numberWithDouble:");
  }
  v14 = [v8 storageContext];
  unsigned int v38 = [v14 isFromStorage];

  v36 = v8;
  v15 = [v8 storageContext];
  unsigned int v37 = [v15 isLastFromStorage];

  v16 = [v6 editedMessageGUID];
  v17 = [(IMEditMessageCommandPipelineParameter *)self _existingFileTransfersForMessageGuid:v16];
  uint64_t v18 = [v6 editType];
  int v19 = objc_msgSend(v6, "has_editedMessagePartIndex");
  if (v18) {
    int v20 = v19;
  }
  else {
    int v20 = 0;
  }
  if (v20 == 1)
  {
    uint64_t v33 = [v6 editedMessagePartIndex];
    unint64_t v32 = [(IMEditMessageCommandPipelineParameter *)self _messageItemEditTypeForBlastdoorEditType:v18];
    char v21 = [v6 shouldRetractSubject];
    [v6 editedMessagePartBody];
    v22 = id v35 = v7;
    [v22 content];
    v23 = v34 = self;
    v24 = +[IMTextMessagePipelineParameter convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:v23 supportingStickerAttributes:0 existingFileTransfersForMessage:v17];
    v25 = [v24 messageBodyWithNativeAttributes];
    v26 = [v24 fileTransferGuids];

    self = v34;
    uint64_t v28 = v32;
    uint64_t v27 = v33;
    id v7 = v35;
  }
  else
  {
    uint64_t v27 = 0;
    v25 = 0;
    v26 = 0;
    char v21 = 0;
    uint64_t v28 = 1;
  }
  BYTE1(v31) = v20;
  LOBYTE(v31) = v21;
  v29 = -[IMEditMessageCommandPipelineParameter initWithIdsTrustedData:editCommandGUID:timestamp:isFromStorage:isLastFromStorage:editedMessageGUID:editedMessagePartIndex:editType:editedMessagePartBody:editedMessagePartFileTransferGUIDs:shouldRetractMessageSubject:hasEditTypeAndPartIndex:](self, "initWithIdsTrustedData:editCommandGUID:timestamp:isFromStorage:isLastFromStorage:editedMessageGUID:editedMessagePartIndex:editType:editedMessagePartBody:editedMessagePartFileTransferGUIDs:shouldRetractMessageSubject:hasEditTypeAndPartIndex:", v7, v40, v39, v38, v37, v16, v27, v28, v25, v26, v31);

  return v29;
}

- (IMEditMessageCommandPipelineParameter)initWithIdsTrustedData:(id)a3 editCommandGUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7 editedMessageGUID:(id)a8 editedMessagePartIndex:(int64_t)a9 editType:(unint64_t)a10 editedMessagePartBody:(id)a11 editedMessagePartFileTransferGUIDs:(id)a12 shouldRetractMessageSubject:(BOOL)a13 hasEditTypeAndPartIndex:(BOOL)a14
{
  id v19 = a3;
  id v37 = a4;
  id v36 = a5;
  id v20 = a8;
  id v21 = a11;
  id v22 = a12;
  v38.receiver = self;
  v38.super_class = (Class)IMEditMessageCommandPipelineParameter;
  v23 = [(IMEditMessageCommandPipelineParameter *)&v38 init];
  if (v23)
  {
    uint64_t v24 = [v19 copy];
    idsTrustedData = v23->_idsTrustedData;
    v23->_idsTrustedData = (IMDiMessageIDSTrustedData *)v24;

    uint64_t v26 = [v37 copy];
    editCommandGUID = v23->_editCommandGUID;
    v23->_editCommandGUID = (NSString *)v26;

    uint64_t v28 = [v36 copy];
    timestamp = v23->_timestamp;
    v23->_timestamp = (NSNumber *)v28;

    v23->_isFromStorage = a6;
    v23->_isLastFromStorage = a7;
    objc_storeStrong((id *)&v23->_editedMessageGUID, a8);
    v23->_editedMessagePartIndex = a9;
    v23->_editType = a10;
    objc_storeStrong((id *)&v23->_editedMessagePartBody, a11);
    objc_storeStrong((id *)&v23->_editedMessagePartFileTransferGUIDs, a12);
    v23->_shouldRetractMessageSubject = a13;
    v23->_hasEditTypeAndPartIndex = a14;
    uint64_t v30 = [v19 fromIdentifier];
    fromIdentifier = v23->_fromIdentifier;
    v23->_fromIdentifier = (NSString *)v30;

    uint64_t v32 = [v19 toIdentifier];
    toIdentifier = v23->_toIdentifier;
    v23->_toIdentifier = (NSString *)v32;
  }
  return v23;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMEditMessageCommandPipelineParameter *)self editCommandGUID];
  v5 = [(IMEditMessageCommandPipelineParameter *)self editedMessageGUID];
  id v6 = [(IMEditMessageCommandPipelineParameter *)self timestamp];
  if ([(IMEditMessageCommandPipelineParameter *)self isFromStorage]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(IMEditMessageCommandPipelineParameter *)self isLastFromStorage]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [(IMEditMessageCommandPipelineParameter *)self idsTrustedData];
  v10 = [(IMEditMessageCommandPipelineParameter *)self chat];
  char v11 = [(IMEditMessageCommandPipelineParameter *)self messageItems];
  objc_msgSend(v3, "stringWithFormat:", @"<IMEditMessageCommandPipelineParameter %p; editCommandGUID = %@; editedMessageGUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; idsTrustedData = %@; OUTPUT chat = %@; numMessageItems = %lu}",
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  v12 = [v11 count]);

  return v12;
}

- (id)_createSuperFormattedStringWithAttributedString:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "__im_attributedStringByAssigningMessagePartNumbers");
  v5 = v4;
  if (!v4) {
    v4 = v3;
  }
  id v6 = v4;

  return v6;
}

- (id)_existingFileTransfersForMessageGuid:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[IMDMessageStore sharedInstance];
  v5 = [v4 messageWithGUID:v3];
  id v6 = +[IMDFileTransferCenter sharedInstance];
  id v7 = [v5 fileTransferGUIDs];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(v6, "transferForGUID:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];

  return v15;
}

- (unint64_t)_messageItemEditTypeForBlastdoorEditType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
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

- (NSString)editCommandGUID
{
  return self->_editCommandGUID;
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

- (NSString)editedMessageGUID
{
  return self->_editedMessageGUID;
}

- (int64_t)editedMessagePartIndex
{
  return self->_editedMessagePartIndex;
}

- (unint64_t)editType
{
  return self->_editType;
}

- (NSAttributedString)editedMessagePartBody
{
  return self->_editedMessagePartBody;
}

- (NSArray)editedMessagePartFileTransferGUIDs
{
  return self->_editedMessagePartFileTransferGUIDs;
}

- (BOOL)shouldRetractMessageSubject
{
  return self->_shouldRetractMessageSubject;
}

- (BOOL)hasEditTypeAndPartIndex
{
  return self->_hasEditTypeAndPartIndex;
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
  objc_storeStrong((id *)&self->_editedMessagePartFileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_editedMessagePartBody, 0);
  objc_storeStrong((id *)&self->_editedMessageGUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_editCommandGUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);

  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end