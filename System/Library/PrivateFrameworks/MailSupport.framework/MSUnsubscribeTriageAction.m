@interface MSUnsubscribeTriageAction
- (id)_changeAction;
@end

@implementation MSUnsubscribeTriageAction

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F60510]);
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  v6 = objc_msgSend(v3, "initWithMessageListItems:origin:actor:", v5, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));

  return v6;
}

@end