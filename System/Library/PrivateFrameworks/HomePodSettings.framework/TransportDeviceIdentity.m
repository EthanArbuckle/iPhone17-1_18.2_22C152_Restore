@interface TransportDeviceIdentity
+ (BOOL)supportsSecureCoding;
- (_TtC15HomePodSettings23TransportDeviceIdentity)init;
- (_TtC15HomePodSettings23TransportDeviceIdentity)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TransportDeviceIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D1DF7FC();
}

- (_TtC15HomePodSettings23TransportDeviceIdentity)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings23TransportDeviceIdentity *)TransportDeviceIdentity.init(coder:)(a3);
}

- (_TtC15HomePodSettings23TransportDeviceIdentity)init
{
}

- (void).cxx_destruct
{
}

@end