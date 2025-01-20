@interface CalBaseResponse
- (CalBaseResponse)initWithDictionary:(id)a3;
- (CalError)calError;
- (void)setCalError:(id)a3;
@end

@implementation CalBaseResponse

- (CalBaseResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalBaseResponse;
  v5 = [(CalBaseResponse *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[CalError alloc] initWithDictionary:v4];
    calError = v6->_calError;
    v6->_calError = v7;
  }
  return v6;
}

- (CalError)calError
{
  return self->_calError;
}

- (void)setCalError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end