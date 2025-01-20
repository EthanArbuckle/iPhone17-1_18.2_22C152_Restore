@interface BLTClientReplyTimeout
- (NSDate)timeout;
- (id)timeoutHandler;
- (void)setTimeout:(id)a3;
- (void)setTimeoutHandler:(id)a3;
@end

@implementation BLTClientReplyTimeout

- (NSDate)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
}

@end