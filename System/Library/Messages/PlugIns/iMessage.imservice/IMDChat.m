@interface IMDChat
- (void)addGroupContextToSendMessageDictionary:(id)a3 callerID:(id)a4;
@end

@implementation IMDChat

- (void)addGroupContextToSendMessageDictionary:(id)a3 callerID:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = +[NSMutableDictionary dictionary];
  v8 = [(IMDChat *)self groupID];
  [v7 setObject:v8 forKeyedSubscript:@"gid"];

  v9 = [(IMDChat *)self participants];
  v10 = [v9 arrayByApplyingSelector:"ID"];
  id v11 = [v10 mutableCopy];

  v12 = [v6 _stripFZIDPrefix];

  [v11 addObject:v12];
  v13 = [v11 _URIsFromIDs];
  [v7 setObject:v13 forKeyedSubscript:@"p"];
  v14 = [(IMDChat *)self displayName];

  if (v14)
  {
    v15 = [(IMDChat *)self displayName];
    [v7 setObject:v15 forKeyedSubscript:@"n"];
  }
  v16 = [(IMDChat *)self properties];
  v17 = [v16 objectForKeyedSubscript:@"gv"];

  if (v17)
  {
    v18 = [v16 objectForKeyedSubscript:@"gv"];
    [v7 setObject:v18 forKeyedSubscript:@"gv"];
  }
  uint64_t v19 = IMDChatGroupParticipantVersionKey;
  v20 = [v16 objectForKeyedSubscript:IMDChatGroupParticipantVersionKey];

  if (v20)
  {
    v21 = [v16 objectForKeyedSubscript:v19];
    [v7 setObject:v21 forKeyedSubscript:v19];
  }
  [v22 setObject:v7 forKeyedSubscript:@"cprm"];
}

@end