@interface MSRestoreModelCategoryForAllMessagesTriageAction
- (EMMessageRepository)messageRepository;
- (MSRestoreModelCategoryForAllMessagesTriageAction)initWithMessageRepository:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (id)_changeAction;
- (void)setMessageRepository:(id)a3;
@end

@implementation MSRestoreModelCategoryForAllMessagesTriageAction

- (MSRestoreModelCategoryForAllMessagesTriageAction)initWithMessageRepository:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8 = a3;
  [(MSRestoreModelCategoryForAllMessagesTriageAction *)self setMessageRepository:v8];
  v11.receiver = self;
  v11.super_class = (Class)MSRestoreModelCategoryForAllMessagesTriageAction;
  v9 = [(MSTriageAction *)&v11 initWithOrigin:a4 actor:a5];

  return v9;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (id)_changeAction
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F603C0]), "initWithOrigin:actor:", -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
  return v2;
}

- (void)setMessageRepository:(id)a3
{
}

- (void).cxx_destruct
{
}

@end