@interface CarrySettings.InstallProfileResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtCO15HomePodSettings13CarrySettings22InstallProfileResponse)init;
- (_TtCO15HomePodSettings13CarrySettings22InstallProfileResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CarrySettings.InstallProfileResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings22InstallProfileResponse)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings22InstallProfileResponse *)CarrySettings.InstallProfileResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CarrySettings.InstallProfileResponse.encode(with:)((NSCoder)v4);
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
  BOOL v6 = CarrySettings.InstallProfileResponse.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6;
}

- (_TtCO15HomePodSettings13CarrySettings22InstallProfileResponse)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings22InstallProfileResponse_error));
}

- (NSString)description
{
  v2 = self;
  CarrySettings.InstallProfileResponse.description.getter();

  v3 = (void *)sub_23D244FC8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end