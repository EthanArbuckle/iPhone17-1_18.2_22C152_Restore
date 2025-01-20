@interface _LSDispatchWithTimeoutResult
- (NSError)error;
- (id)result;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation _LSDispatchWithTimeoutResult

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_result, 0);
}

@end