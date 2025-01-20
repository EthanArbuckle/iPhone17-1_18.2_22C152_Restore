@interface MSTriageUndoAction
- (BOOL)isUndoSupported;
- (BOOL)isValid;
- (EFFuture)changeActionFuture;
- (EMMessageRepository)messageRepository;
- (MSTriageUndoAction)initWithChangeActionFuture:(id)a3 messageRepository:(id)a4;
@end

@implementation MSTriageUndoAction

- (MSTriageUndoAction)initWithChangeActionFuture:(id)a3 messageRepository:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MSTriageUndoAction.m", 16, @"Invalid parameter not satisfying: %@", @"changeActionFuture" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"MSTriageUndoAction.m", 17, @"Invalid parameter not satisfying: %@", @"messageRepository" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)MSTriageUndoAction;
  v11 = [(MSTriageUndoAction *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changeActionFuture, a3);
    objc_storeStrong((id *)&v12->_messageRepository, a4);
    id v20 = 0;
    id v13 = (id)[v8 resultIfAvailable:&v20];
    id v14 = v20;
    v15 = v14;
    if (v14) {
      char v16 = objc_msgSend(v14, "ef_isTimeoutError");
    }
    else {
      char v16 = 1;
    }
    v12->_isValid = v16;
  }
  return v12;
}

- (BOOL)isUndoSupported
{
  return 1;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (EFFuture)changeActionFuture
{
  return self->_changeActionFuture;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeActionFuture, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
}

@end