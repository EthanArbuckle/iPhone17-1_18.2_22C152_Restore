@interface MSRemoveHighImpactTriageAction
- (MSRemoveHighImpactTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 highImpactChange:(unint64_t)a7;
- (id)_changeAction;
- (unint64_t)highImpactChange;
- (void)setHighImpactChange:(unint64_t)a3;
@end

@implementation MSRemoveHighImpactTriageAction

- (MSRemoveHighImpactTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 highImpactChange:(unint64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)MSRemoveHighImpactTriageAction;
  result = [(MSTriageAction *)&v9 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  if (result) {
    result->_highImpactChange = a7;
  }
  return result;
}

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F603E8]);
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  v6 = objc_msgSend(v3, "initWithMessageListItems:origin:actor:highImpactChange:", v5, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), -[MSRemoveHighImpactTriageAction highImpactChange](self, "highImpactChange"));

  return v6;
}

- (unint64_t)highImpactChange
{
  return self->_highImpactChange;
}

- (void)setHighImpactChange:(unint64_t)a3
{
  self->_highImpactChange = a3;
}

@end