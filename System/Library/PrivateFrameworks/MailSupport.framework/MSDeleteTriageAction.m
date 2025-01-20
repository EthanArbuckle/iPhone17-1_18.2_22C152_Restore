@interface MSDeleteTriageAction
- (BOOL)isUndoSupported;
- (id)_changeAction;
@end

@implementation MSDeleteTriageAction

- (id)_changeAction
{
  v3 = [(MSTriageAction *)self messageListItemSelection];
  int v4 = [v3 isSelectAll];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F60350]);
    v6 = [(MSTriageAction *)self messageListItemSelection];
    v7 = [v6 mailboxes];
    int64_t v8 = [(MSTriageAction *)self origin];
    int64_t v9 = [(MSTriageAction *)self actor];
    v10 = [(MSTriageAction *)self messageListItemSelection];
    v11 = [v10 messageListItems];
    v12 = (void *)[v5 initWithMailboxes:v7 origin:v8 actor:v9 messageListItemsToExclude:v11];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F60348]);
    v6 = [(MSTriageAction *)self messageListItemSelection];
    v7 = [v6 messageListItems];
    v12 = objc_msgSend(v13, "initWithMessageListItems:origin:actor:", v7, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
  }

  return v12;
}

- (BOOL)isUndoSupported
{
  return 0;
}

@end