@interface VNAsyncStatus
- (BOOL)completed;
- (NSError)error;
- (VNAsyncStatus)init;
- (VNAsyncStatus)initWithStatus:(BOOL)a3 error:(id)a4;
- (id)description;
@end

@implementation VNAsyncStatus

- (VNAsyncStatus)init
{
  return [(VNAsyncStatus *)self initWithStatus:1 error:0];
}

- (VNAsyncStatus)initWithStatus:(BOOL)a3 error:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VNAsyncStatus;
  v8 = [(VNAsyncStatus *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_completed = a3;
    objc_storeStrong((id *)&v8->_error, a4);
    id v18 = 0;
    BOOL v10 = +[VNValidationUtilities validateAsyncStatusState:v9 error:&v18];
    id v11 = v18;
    v12 = v11;
    if (!v10)
    {
      v13 = NSString;
      v14 = [v11 localizedDescription];
      v15 = [v13 stringWithFormat:@"Invalid async state - %@", v14];
      +[VNError VNAssert:0 log:v15];
    }
    v16 = v9;
  }
  return v9;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  BOOL v4 = [(VNAsyncStatus *)self completed];
  v5 = [(VNAsyncStatus *)self error];
  v6 = (void *)[v3 initWithFormat:@"completed: %d: error: %@", v4, v5];

  return v6;
}

@end