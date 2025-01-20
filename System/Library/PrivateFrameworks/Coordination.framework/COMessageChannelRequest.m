@interface COMessageChannelRequest
+ (BOOL)supportsSecureCoding;
- (COMessageChannelRequest)init;
- (OS_nw_activity)networkActivity;
- (void)setNetworkActivity:(id)a3;
@end

@implementation COMessageChannelRequest

- (COMessageChannelRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageChannelRequest;
  return [(COMessageChannelRequest *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_nw_activity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end