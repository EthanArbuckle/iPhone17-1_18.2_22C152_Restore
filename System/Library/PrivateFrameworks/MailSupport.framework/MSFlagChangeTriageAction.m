@interface MSFlagChangeTriageAction
- (BOOL)flagState;
- (BOOL)shouldOverrideFlagState;
- (ECMessageFlags)messageFlags;
- (MSFlagChangeTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7;
- (MSFlagChangeTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7;
- (id)_changeAction;
- (int64_t)reason;
- (void)_toggleFlagWithBuilder:(id)a3;
@end

@implementation MSFlagChangeTriageAction

- (MSFlagChangeTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)MSFlagChangeTriageAction;
  result = [(MSTriageAction *)&v9 initWithQuery:a3 origin:a4 actor:a5 delegate:a6];
  if (result) {
    result->_reason = a7;
  }
  return result;
}

- (MSFlagChangeTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)MSFlagChangeTriageAction;
  result = [(MSTriageAction *)&v9 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  if (result) {
    result->_reason = a7;
  }
  return result;
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  id v5 = a3;
  [(MSFlagChangeTriageAction *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MSFlagChangeTriageAction _toggleFlagWithBuilder:]", "MSFlagChangeTriageAction.m", 38, "0");
}

- (BOOL)flagState
{
}

- (ECMessageFlags)messageFlags
{
}

- (BOOL)shouldOverrideFlagState
{
  v3 = [(MSTriageAction *)self messageListItemSelection];
  char v4 = [v3 isSelectAll];

  if (v4) {
    return 1;
  }
  v6 = [(MSTriageAction *)self messageListItemSelection];
  if ([v6 isActingOnSender])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7 = [(MSTriageAction *)self query];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F608B8]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__MSFlagChangeTriageAction__changeAction__block_invoke;
  v17[3] = &unk_1E63FE9F8;
  v17[4] = self;
  char v4 = (void *)[v3 initWithBuilder:v17];
  BOOL v5 = [(MSTriageAction *)self messageListItemSelection];
  int v6 = [v5 isSelectAll];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F60360]);
    v8 = [(MSTriageAction *)self messageListItemSelection];
    objc_super v9 = [v8 mailboxes];
    v10 = [(MSTriageAction *)self messageListItemSelection];
    v11 = [v10 messageListItems];
    v12 = objc_msgSend(v7, "initWithMailboxes:messageListItemsToExclude:flagChange:origin:actor:", v9, v11, v4, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
  }
  else
  {
    v13 = [(MSTriageAction *)self query];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F60358]);
      v8 = [(MSTriageAction *)self query];
      v12 = objc_msgSend(v14, "initWithQuery:origin:actor:flagChange:", v8, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), v4);
      goto LABEL_7;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F60358]);
    v8 = [(MSTriageAction *)self messageListItemSelection];
    objc_super v9 = [v8 messageListItems];
    v12 = objc_msgSend(v15, "initWithMessageListItems:origin:actor:flagChange:", v9, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), v4);
  }

LABEL_7:
  return v12;
}

void __41__MSFlagChangeTriageAction__changeAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setReason:", objc_msgSend(*(id *)(a1 + 32), "reason"));
  [*(id *)(a1 + 32) _toggleFlagWithBuilder:v3];
}

- (int64_t)reason
{
  return self->_reason;
}

@end