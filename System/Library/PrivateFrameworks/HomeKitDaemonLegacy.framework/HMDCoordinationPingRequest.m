@interface HMDCoordinationPingRequest
+ (BOOL)supportsSecureCoding;
+ (id)acceptableResponses;
- (HMDCoordinationPingRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCoordinationPingRequest

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDCoordinationPingRequest;
  [(COMeshCommand *)&v3 encodeWithCoder:a3];
}

- (HMDCoordinationPingRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCoordinationPingRequest;
  return [(COMeshCommand *)&v4 initWithCoder:a3];
}

+ (id)acceptableResponses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end