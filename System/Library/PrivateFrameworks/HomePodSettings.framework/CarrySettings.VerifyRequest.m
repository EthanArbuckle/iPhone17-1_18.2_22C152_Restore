@interface CarrySettings.VerifyRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtCO15HomePodSettings13CarrySettings13VerifyRequest)init;
- (_TtCO15HomePodSettings13CarrySettings13VerifyRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CarrySettings.VerifyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings13VerifyRequest)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings13VerifyRequest *)sub_23D1F648C(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CarrySettings.VerifyRequest.encode(with:)((NSCoder)v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23D2458B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = CarrySettings.VerifyRequest.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6;
}

- (_TtCO15HomePodSettings13CarrySettings13VerifyRequest)init
{
}

- (void).cxx_destruct
{
}

@end