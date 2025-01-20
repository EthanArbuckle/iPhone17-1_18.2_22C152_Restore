@interface MSCategoryFeedbackTriageAction
- (id)_changeAction;
@end

@implementation MSCategoryFeedbackTriageAction

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F60330]);
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  v6 = objc_msgSend(v3, "initWithMessageListItems:origin:actor:categoryType:changeOptions:", v5, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), -[MSCategoryTriageAction categoryType](self, "categoryType"), -[MSCategoryTriageAction changeOptions](self, "changeOptions"));

  return v6;
}

@end