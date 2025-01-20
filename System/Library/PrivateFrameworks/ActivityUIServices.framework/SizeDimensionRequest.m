@interface SizeDimensionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC18ActivityUIServices20SizeDimensionRequest)init;
- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4;
- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5;
- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithXPCDictionary:(id)a3;
- (double)maximum;
- (double)minimum;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SizeDimensionRequest

- (double)minimum
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
}

- (double)maximum
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5
{
  if (a3 <= 0.0) {
    a3 = 0.0;
  }
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type) = (Class)a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return [(SizeDimensionRequest *)&v6 init];
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4
{
  return [(SizeDimensionRequest *)self initWithMinimum:0 maximum:a3 type:a4];
}

- (int64_t)hash
{
  return sub_23C98F614();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_23C98F70C((uint64_t)v8);

  sub_23C952480((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  v2 = self;
  sub_23C98F8B0();

  v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_23C98FA94(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_23C9914E0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C98FBB4(v4);
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18ActivityUIServices20SizeDimensionRequest *)sub_23C99009C(v3);

  return v4;
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = (_TtC18ActivityUIServices20SizeDimensionRequest *)sub_23C9901CC(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    BSSerializeDoubleToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
    xpc_dictionary_set_int64(a3, "type", *(int64_t *)((char *)&v4->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type));
    swift_unknownObjectRelease();
  }
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)init
{
  result = (_TtC18ActivityUIServices20SizeDimensionRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end