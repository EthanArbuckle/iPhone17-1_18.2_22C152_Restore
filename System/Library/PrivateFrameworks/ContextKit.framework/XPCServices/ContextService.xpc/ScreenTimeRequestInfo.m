@interface ScreenTimeRequestInfo
- (NSDate)latestRequest;
- (unint64_t)allowance;
- (void)setAllowance:(unint64_t)a3;
- (void)setLatestRequest:(id)a3;
@end

@implementation ScreenTimeRequestInfo

- (NSDate)latestRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_latestRequest);
  return (NSDate *)WeakRetained;
}

- (void)setLatestRequest:(id)a3
{
}

- (unint64_t)allowance
{
  return self->_allowance;
}

- (void)setAllowance:(unint64_t)a3
{
  self->_allowance = a3;
}

- (void).cxx_destruct
{
}

@end