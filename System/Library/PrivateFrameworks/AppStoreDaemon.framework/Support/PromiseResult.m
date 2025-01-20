@interface PromiseResult
- (PromiseResult)init;
@end

@implementation PromiseResult

- (PromiseResult)init
{
  return (PromiseResult *)sub_100209C88((id *)&self->super.isa, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end