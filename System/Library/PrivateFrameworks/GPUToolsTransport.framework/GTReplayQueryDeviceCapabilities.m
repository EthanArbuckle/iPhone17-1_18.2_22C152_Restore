@interface GTReplayQueryDeviceCapabilities
+ (BOOL)supportsSecureCoding;
- (GTReplayQueryDeviceCapabilities)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTReplayQueryDeviceCapabilities

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayQueryDeviceCapabilities)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTReplayQueryDeviceCapabilities;
  return [(GTReplayRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTReplayQueryDeviceCapabilities;
  [(GTReplayRequest *)&v3 encodeWithCoder:a3];
}

@end