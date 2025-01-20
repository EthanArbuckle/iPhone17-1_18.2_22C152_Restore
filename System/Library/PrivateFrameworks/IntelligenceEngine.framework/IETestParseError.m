@interface IETestParseError
- (NSString)error;
- (NSString)flowId;
- (void)setError:(id)a3;
- (void)setFlowId:(id)a3;
@end

@implementation IETestParseError

- (NSString)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(id)a3
{
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_flowId, 0);
}

@end