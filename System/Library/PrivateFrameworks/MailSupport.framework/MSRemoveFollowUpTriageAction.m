@interface MSRemoveFollowUpTriageAction
- (EMFollowUp)followUp;
- (MSRemoveFollowUpTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 followUp:(id)a7;
- (id)_changeAction;
- (void)setFollowUp:(id)a3;
@end

@implementation MSRemoveFollowUpTriageAction

- (MSRemoveFollowUpTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 followUp:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MSRemoveFollowUpTriageAction;
  v14 = [(MSTriageAction *)&v17 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_followUp, a7);
  }

  return v15;
}

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F60368]);
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  int64_t v6 = [(MSTriageAction *)self origin];
  int64_t v7 = [(MSTriageAction *)self actor];
  v8 = [(MSRemoveFollowUpTriageAction *)self followUp];
  v9 = (void *)[v3 initWithMessageListItems:v5 origin:v6 actor:v7 followUp:v8];

  return v9;
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end