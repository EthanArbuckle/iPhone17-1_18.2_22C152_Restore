@interface DigitalPresentmentRequest
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV25DigitalPresentmentRequest)init;
- (_TtC7CoreIDV25DigitalPresentmentRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DigitalPresentmentRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DigitalPresentmentRequest.encode(with:)((NSCoder)v4);
}

- (_TtC7CoreIDV25DigitalPresentmentRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC7CoreIDV25DigitalPresentmentRequest *)sub_21480D084();

  return v4;
}

- (_TtC7CoreIDV25DigitalPresentmentRequest)init
{
  result = (_TtC7CoreIDV25DigitalPresentmentRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end