@interface MOCompletion
+ (id)failureWithError:(id)a3;
+ (id)success;
- (MOCompletion)initWithState:(unint64_t)a3 error:(id)a4;
- (NSError)error;
- (unint64_t)state;
@end

@implementation MOCompletion

- (MOCompletion)initWithState:(unint64_t)a3 error:(id)a4
{
  v6 = (NSError *)a4;
  v10.receiver = self;
  v10.super_class = (Class)MOCompletion;
  v7 = [(MOCompletion *)&v10 init];
  error = v7->_error;
  v7->_state = a3;
  v7->_error = v6;

  return v7;
}

+ (id)success
{
  v2 = (void *)[objc_alloc((Class)a1) initWithState:0 error:0];
  return v2;
}

+ (id)failureWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithState:1 error:v4];

  return v5;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end