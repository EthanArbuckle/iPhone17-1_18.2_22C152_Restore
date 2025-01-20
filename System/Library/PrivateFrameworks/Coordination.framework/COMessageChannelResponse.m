@interface COMessageChannelResponse
+ (BOOL)supportsSecureCoding;
- (COMessageChannelResponse)init;
- (COMessageChannelResponse)initWithCoder:(id)a3;
@end

@implementation COMessageChannelResponse

- (COMessageChannelResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageChannelResponse;
  return [(COMessageChannelResponse *)&v3 init];
}

- (COMessageChannelResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COMessageChannelResponse;
  return [(COMessageChannelResponse *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end