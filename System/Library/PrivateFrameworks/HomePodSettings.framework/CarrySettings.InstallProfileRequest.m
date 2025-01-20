@interface CarrySettings.InstallProfileRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest)init;
- (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CarrySettings.InstallProfileRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest *)sub_23D19F824(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CarrySettings.InstallProfileRequest.encode(with:)((NSCoder)v4);
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
  BOOL v6 = CarrySettings.InstallProfileRequest.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6;
}

- (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings21InstallProfileRequest_profileData);
  unint64_t v4 = *(unint64_t *)((char *)&self->super._networkActivity
                           + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings21InstallProfileRequest_profileData);
  sub_23D165FE8(v3, v4);
}

@end