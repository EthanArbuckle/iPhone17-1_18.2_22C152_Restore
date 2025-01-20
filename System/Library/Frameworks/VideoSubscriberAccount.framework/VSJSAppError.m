@interface VSJSAppError
- (NSString)message;
- (unint64_t)code;
- (void)setCode:(unint64_t)a3;
- (void)setMessage:(id)a3;
@end

@implementation VSJSAppError

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end