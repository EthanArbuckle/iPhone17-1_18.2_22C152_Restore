@interface CRKConnectWithoutBeaconAssertionRequest
+ (BOOL)supportsSecureCoding;
- (CRKConnectWithoutBeaconAssertionRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKConnectWithoutBeaconAssertionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKConnectWithoutBeaconAssertionRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRKConnectWithoutBeaconAssertionRequest;
  return [(CATTaskRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRKConnectWithoutBeaconAssertionRequest;
  [(CATTaskRequest *)&v3 encodeWithCoder:a3];
}

@end