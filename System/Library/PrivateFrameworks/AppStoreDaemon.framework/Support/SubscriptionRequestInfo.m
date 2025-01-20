@interface SubscriptionRequestInfo
@end

@implementation SubscriptionRequestInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end