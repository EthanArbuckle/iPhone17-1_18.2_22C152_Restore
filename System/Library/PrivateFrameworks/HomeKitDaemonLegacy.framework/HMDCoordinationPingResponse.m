@interface HMDCoordinationPingResponse
+ (BOOL)supportsSecureCoding;
- (HMDCoordinationPingResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCoordinationPingResponse

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDCoordinationPingResponse;
  [(COMeshResponse *)&v3 encodeWithCoder:a3];
}

- (HMDCoordinationPingResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCoordinationPingResponse;
  return [(COMeshResponse *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end