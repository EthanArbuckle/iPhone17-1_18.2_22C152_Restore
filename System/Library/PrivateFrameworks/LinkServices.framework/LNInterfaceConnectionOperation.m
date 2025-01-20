@interface LNInterfaceConnectionOperation
- (LNConnectionHostInterface)connectionInterface;
- (LNInterfaceConnectionOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7;
@end

@implementation LNInterfaceConnectionOperation

- (void).cxx_destruct
{
}

- (LNInterfaceConnectionOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNInterfaceConnectionOperation.m", 20, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"LNInterfaceConnectionOperation.m", 21, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)LNInterfaceConnectionOperation;
  v17 = [(LNConnectionOperation *)&v23 initWithIdentifier:v13 priority:a5 queue:v15 activity:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_connectionInterface, a4);
    v19 = v18;
  }

  return v18;
}

- (LNConnectionHostInterface)connectionInterface
{
  return self->_connectionInterface;
}

@end