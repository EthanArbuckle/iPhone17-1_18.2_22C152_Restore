@interface IMResult
- (IMResult)initWithError:(id)a3;
- (IMResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5;
- (IMResult)initWithSuccess:(id)a3;
- (NSError)error;
- (NSError)inError;
- (id)inValue;
- (id)value;
- (int64_t)state;
- (void)setInError:(id)a3;
- (void)setInValue:(id)a3;
@end

@implementation IMResult

- (IMResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMResult;
  v11 = [(IMResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inError, a5);
    objc_storeStrong(&v12->_inValue, a4);
    v12->_state = a3;
  }

  return v12;
}

- (IMResult)initWithError:(id)a3
{
  return (IMResult *)MEMORY[0x270F9A6D0](self, sel_initWithState_value_error_);
}

- (IMResult)initWithSuccess:(id)a3
{
  return (IMResult *)MEMORY[0x270F9A6D0](self, sel_initWithState_value_error_);
}

- (id)value
{
  return self->_inValue;
}

- (NSError)error
{
  return self->_inError;
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