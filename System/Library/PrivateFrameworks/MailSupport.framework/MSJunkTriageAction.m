@interface MSJunkTriageAction
+ (BOOL)hasNonJunkMessagesInSelection:(id)a3;
- (BOOL)hasNonJunkMessages;
- (MSJunkTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6;
@end

@implementation MSJunkTriageAction

- (MSJunkTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([(id)objc_opt_class() hasNonJunkMessagesInSelection:v10])
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_5];
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_2];
    uint64_t v13 = 7;
  }
  v14 = (void *)v12;
  v18.receiver = self;
  v18.super_class = (Class)MSJunkTriageAction;
  char v17 = 0;
  v15 = [(MSMoveTriageAction *)&v18 initWithMessageListSelection:v10 origin:a4 actor:a5 delegate:v11 destinationMailboxType:v13 flagChange:v12 copyMessages:v17];

  return v15;
}

uint64_t __73__MSJunkTriageAction_initWithMessageListSelection_origin_actor_delegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 changesJunkLevelTo:1];
}

uint64_t __73__MSJunkTriageAction_initWithMessageListSelection_origin_actor_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 changesJunkLevelTo:2];
}

- (BOOL)hasNonJunkMessages
{
  v3 = objc_opt_class();
  v4 = [(MSTriageAction *)self messageListItemSelection];
  LOBYTE(v3) = [v3 hasNonJunkMessagesInSelection:v4];

  return (char)v3;
}

+ (BOOL)hasNonJunkMessagesInSelection:(id)a3
{
  id v3 = a3;
  if ([v3 isSelectAll])
  {
    v4 = [v3 mailboxes];
    char v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_5);
  }
  else
  {
    v4 = [v3 messageListItems];
    char v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_8);
  }
  BOOL v6 = v5;

  return v6;
}

BOOL __52__MSJunkTriageAction_hasNonJunkMessagesInSelection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 1;
}

uint64_t __52__MSJunkTriageAction_hasNonJunkMessagesInSelection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 mailboxes];
  uint64_t v3 = objc_msgSend(v2, "ef_any:", &__block_literal_global_10);

  return v3;
}

BOOL __52__MSJunkTriageAction_hasNonJunkMessagesInSelection___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 type] != 1;
}

@end