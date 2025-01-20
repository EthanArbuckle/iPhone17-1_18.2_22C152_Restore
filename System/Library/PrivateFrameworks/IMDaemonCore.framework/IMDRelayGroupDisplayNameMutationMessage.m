@interface IMDRelayGroupDisplayNameMutationMessage
- (IMDRelayGroupDisplayNameMutationMessage)initWithName:(id)a3 sender:(id)a4 service:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 guid:(id)a8 destinationCallerID:(id)a9 failed:(BOOL)a10 fromMe:(BOOL)a11;
- (NSString)updatedName;
- (id)_initWithBlastDoorMessage:(id)a3;
- (id)createDictionary;
- (void)setUpdatedName:(id)a3;
@end

@implementation IMDRelayGroupDisplayNameMutationMessage

- (id)_initWithBlastDoorMessage:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMDRelayGroupDisplayNameMutationMessage;
  id v5 = [(IMDRelayGroupMutationMessage *)&v11 _initWithBlastDoorMessage:v4];
  if (v5)
  {
    v6 = [v4 mutation];
    v7 = [v6 displayName];
    v8 = [v7 updatedName];
    v9 = [v8 displayName];
    [v5 setUpdatedName:v9];
  }
  return v5;
}

- (IMDRelayGroupDisplayNameMutationMessage)initWithName:(id)a3 sender:(id)a4 service:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 guid:(id)a8 destinationCallerID:(id)a9 failed:(BOOL)a10 fromMe:(BOOL)a11
{
  id v17 = a3;
  if (a10) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)IMDRelayGroupDisplayNameMutationMessage;
  v19 = [(IMDRelayGroupMutationMessage *)&v22 _initWithType:v18 sender:a4 service:a5 groupID:a6 originalGroupID:a7 guid:a8 destinationCallerID:a9 fromMe:a11];
  v20 = v19;
  if (v19) {
    [(IMDRelayGroupDisplayNameMutationMessage *)v19 setUpdatedName:v17];
  }

  return v20;
}

- (id)createDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayGroupDisplayNameMutationMessage;
  v3 = [(IMDRelayGroupMutationMessage *)&v9 createDictionary];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(IMDRelayGroupDisplayNameMutationMessage *)self updatedName];

  if (v5)
  {
    v6 = [(IMDRelayGroupDisplayNameMutationMessage *)self updatedName];
    [v4 setObject:v6 forKeyedSubscript:@"n"];
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (void)setUpdatedName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end