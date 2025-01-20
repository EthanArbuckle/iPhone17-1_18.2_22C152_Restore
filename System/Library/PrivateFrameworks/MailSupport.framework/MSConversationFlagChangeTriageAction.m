@interface MSConversationFlagChangeTriageAction
+ (int64_t)conversationNotificationLevel;
- (EMMessage)referenceMessage;
- (MSConversationFlagChangeTriageAction)initWithReferenceMessage:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7;
- (id)_changeAction;
- (id)messageFlags;
- (void)_toggleFlagWithBuilder:(id)a3;
@end

@implementation MSConversationFlagChangeTriageAction

+ (int64_t)conversationNotificationLevel
{
}

- (MSConversationFlagChangeTriageAction)initWithReferenceMessage:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  v14 = [MSMessageListItemSelection alloc];
  v20[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v16 = [(MSMessageListItemSelection *)v14 initWithMessageListItems:v15];

  v19.receiver = self;
  v19.super_class = (Class)MSConversationFlagChangeTriageAction;
  v17 = [(MSFlagChangeTriageAction *)&v19 initWithMessageListSelection:v16 origin:a4 actor:a5 delegate:v13 reason:a7];

  return v17;
}

- (EMMessage)referenceMessage
{
  v2 = [(MSTriageAction *)self messageListItemSelection];
  v3 = [v2 messageListItems];
  v4 = [v3 firstObject];
  v5 = [v4 displayMessage];
  v6 = [v5 result];

  return (EMMessage *)v6;
}

- (id)messageFlags
{
  v2 = [(MSConversationFlagChangeTriageAction *)self referenceMessage];
  v3 = [v2 flags];

  return v3;
}

- (id)_changeAction
{
  v3 = [(MSConversationFlagChangeTriageAction *)self referenceMessage];
  if ([v3 conversationNotificationLevel]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [(id)objc_opt_class() conversationNotificationLevelToSet];
  }

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(MSTriageAction *)self messageListItemSelection];
  v7 = [v6 messageListItems];
  v8 = objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_2);
  v9 = [v5 setWithArray:v8];
  v10 = [v9 allObjects];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60340]), "initWithConversationIDs:origin:actor:conversationNotificationLevel:", v10, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), v4);
  return v11;
}

id __53__MSConversationFlagChangeTriageAction__changeAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  id v7 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v7 messageListItems];
  uint64_t v6 = objc_msgSend(v5, "em_messageListItemTotalCount");

  if (v6 != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSConversationFlagChangeTriageAction.m" lineNumber:51 description:@"This action only expects a single reference message"];
  }
}

@end