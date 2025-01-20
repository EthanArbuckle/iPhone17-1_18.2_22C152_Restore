@interface CUTResult
- (CUTResult)initWithError:(id)a3;
- (CUTResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5;
- (CUTResult)initWithSuccess:(id)a3;
- (NSError)error;
- (NSError)inError;
- (id)inValue;
- (id)value;
- (int64_t)state;
- (void)setInError:(id)a3;
- (void)setInValue:(id)a3;
@end

@implementation CUTResult

- (CUTResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CUTResult;
  v11 = [(CUTResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inError, a5);
    objc_storeStrong(&v12->_inValue, a4);
    v12->_state = a3;
  }

  return v12;
}

- (CUTResult)initWithError:(id)a3
{
  return (CUTResult *)MEMORY[0x1F4181798](self, sel_initWithState_value_error_);
}

- (CUTResult)initWithSuccess:(id)a3
{
  return (CUTResult *)MEMORY[0x1F4181798](self, sel_initWithState_value_error_);
}

- (id)value
{
  if ([(CUTResult *)self state])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CUTResult.m" lineNumber:39 description:@"Unexpected state: Success"];
  }
  id inValue = self->_inValue;
  return inValue;
}

- (NSError)error
{
  if ([(CUTResult *)self state] != 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CUTResult.m" lineNumber:44 description:@"Unexpected state: Fail"];
  }
  inError = self->_inError;
  return inError;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)inError
{
  return self->_inError;
}

- (void)setInError:(id)a3
{
}

- (id)inValue
{
  return self->_inValue;
}

- (void)setInValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inValue, 0);
  objc_storeStrong((id *)&self->_inError, 0);
}

@end