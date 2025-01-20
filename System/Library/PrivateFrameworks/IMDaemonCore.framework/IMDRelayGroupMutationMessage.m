@interface IMDRelayGroupMutationMessage
+ (id)messageFromBlastDoorMessage:(id)a3;
+ (id)mutationMessageFromData:(id)a3 error:(id *)a4;
- (BOOL)failed;
- (BOOL)fromMe;
- (NSString)destinationCallerID;
- (NSString)groupID;
- (NSString)originalGroupID;
- (NSString)sender;
- (NSString)service;
- (NSUUID)guid;
- (id)_initWithBlastDoorMessage:(id)a3;
- (id)_initWithType:(unint64_t)a3 sender:(id)a4 service:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 guid:(id)a8 destinationCallerID:(id)a9 fromMe:(BOOL)a10;
- (id)createDictionary;
- (unint64_t)type;
- (void)setDestinationCallerID:(id)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setGroupID:(id)a3;
- (void)setGuid:(id)a3;
- (void)setOriginalGroupID:(id)a3;
- (void)setSender:(id)a3;
- (void)setService:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation IMDRelayGroupMutationMessage

+ (id)messageFromBlastDoorMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 mutation];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    v6 = IMDRelayGroupParticipantsUpdateMessage;
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = IMDRelayGroupDisplayNameMutationMessage;
LABEL_5:
    v7 = (void *)[[v6 alloc] _initWithBlastDoorMessage:v3];
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Dropping unknown relay group mutation", v10, 2u);
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)_initWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  HIDWORD(v15) = [v3 fromMe];
  v17 = [v3 mutation];
  uint64_t v4 = [v17 type];
  uint64_t v5 = [v3 sender];
  v6 = [v3 service];
  v7 = [v3 groupID];
  v8 = [v7 id];
  v9 = [v3 originalGroupID];
  v10 = [v9 id];
  v11 = [v3 guid];
  v12 = [v3 destinationCallerID];

  LOBYTE(v15) = BYTE4(v15);
  id v13 = [(IMDRelayGroupMutationMessage *)self _initWithType:v4 sender:v5 service:v6 groupID:v8 originalGroupID:v10 guid:v11 destinationCallerID:v12 fromMe:v15];

  return v13;
}

+ (id)mutationMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v5 = +[IMBlastdoor sendRelayGroupMutationData:a3 error:a4];
  v6 = [a1 messageFromBlastDoorMessage:v5];

  return v6;
}

- (id)_initWithType:(unint64_t)a3 sender:(id)a4 service:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 guid:(id)a8 destinationCallerID:(id)a9 fromMe:(BOOL)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)IMDRelayGroupMutationMessage;
  v22 = [(IMDRelayGroupMutationMessage *)&v25 init];
  v23 = v22;
  if (v22)
  {
    [(IMDRelayGroupMutationMessage *)v22 setType:a3];
    [(IMDRelayGroupMutationMessage *)v23 setSender:v16];
    [(IMDRelayGroupMutationMessage *)v23 setService:v17];
    [(IMDRelayGroupMutationMessage *)v23 setGroupID:v18];
    [(IMDRelayGroupMutationMessage *)v23 setOriginalGroupID:v19];
    [(IMDRelayGroupMutationMessage *)v23 setGuid:v20];
    [(IMDRelayGroupMutationMessage *)v23 setDestinationCallerID:v21];
    [(IMDRelayGroupMutationMessage *)v23 setFromMe:a10];
  }

  return v23;
}

- (BOOL)failed
{
  return ([(IMDRelayGroupMutationMessage *)self type] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)createDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMDRelayGroupMutationMessage type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"t"];

  uint64_t v5 = [(IMDRelayGroupMutationMessage *)self sender];

  if (v5)
  {
    v6 = [(IMDRelayGroupMutationMessage *)self sender];
    [v3 setObject:v6 forKeyedSubscript:@"s"];
  }
  v7 = [(IMDRelayGroupMutationMessage *)self service];
  [v3 setObject:v7 forKeyedSubscript:@"S"];

  v8 = [(IMDRelayGroupMutationMessage *)self groupID];
  [v3 setObject:v8 forKeyedSubscript:@"g"];

  v9 = [(IMDRelayGroupMutationMessage *)self originalGroupID];
  [v3 setObject:v9 forKeyedSubscript:@"o"];

  v10 = [(IMDRelayGroupMutationMessage *)self guid];
  v11 = [v10 UUIDString];
  [v3 setObject:v11 forKeyedSubscript:@"G"];

  v12 = [(IMDRelayGroupMutationMessage *)self destinationCallerID];

  if (v12)
  {
    id v13 = [(IMDRelayGroupMutationMessage *)self destinationCallerID];
    [v3 setObject:v13 forKeyedSubscript:@"d"];
  }
  if ([(IMDRelayGroupMutationMessage *)self fromMe])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDRelayGroupMutationMessage fromMe](self, "fromMe"));
    [v3 setObject:v14 forKeyedSubscript:@"m"];
  }
  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (void)setOriginalGroupID:(id)a3
{
}

- (NSUUID)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)destinationCallerID
{
  return self->_destinationCallerID;
}

- (void)setDestinationCallerID:(id)a3
{
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationCallerID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end