@interface CarrySettings.DataModelUpdateRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest)init;
- (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CarrySettings.DataModelUpdateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest *)sub_23D1D6E64(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CarrySettings.DataModelUpdateRequest.encode(with:)((NSCoder)v4);
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
  char v6 = CarrySettings.DataModelUpdateRequest.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6 & 1;
}

- (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest)init
{
}

- (void).cxx_destruct
{
  sub_23D165FE8(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest_data), *(unint64_t *)((char *)&self->super._networkActivity+ OBJC_IVAR____TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest_data));
  swift_bridgeObjectRelease();
}

@end