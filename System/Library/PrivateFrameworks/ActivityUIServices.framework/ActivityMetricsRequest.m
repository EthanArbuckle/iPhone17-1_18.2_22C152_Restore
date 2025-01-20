@interface ActivityMetricsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)init;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithLockScreenMetrics:(id)a3 systemApertureMetrics:(id)a4;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithLockScreenMetrics:(id)a3 systemApertureMetrics:(id)a4 ambientMetrics:(id)a5;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithXPCDictionary:(id)a3;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)ambientMetrics;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)lockScreenMetrics;
- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)systemApertureMetrics;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setAmbientMetrics:(id)a3;
- (void)setLockScreenMetrics:(id)a3;
- (void)setSystemApertureMetrics:(id)a3;
@end

@implementation ActivityMetricsRequest

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)ambientMetrics
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
}

- (void)setAmbientMetrics:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_23C9521D4(a3, (void (*)(void))type metadata accessor for ActivityItemMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)lockScreenMetrics
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
}

- (void)setLockScreenMetrics:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  id v6 = *(Class *)((char *)&v5->super.isa
                + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics) = v7;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)systemApertureMetrics
{
  return (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
}

- (void)setSystemApertureMetrics:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_23C9521D4(a3, (void (*)(void))type metadata accessor for SystemApertureMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithLockScreenMetrics:(id)a3 systemApertureMetrics:(id)a4 ambientMetrics:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_23C95227C(v7, a4, a5);

  return v10;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithLockScreenMetrics:(id)a3 systemApertureMetrics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_23C952330(v5, a4);

  return v7;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_23C951548();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = sub_23C951610((uint64_t)v8);

  sub_23C952480((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_23C951894();

  int64_t v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  int64_t v3 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_23C952544();
  swift_unknownObjectRelease();
  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_23C951B0C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_23C951C04(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  id v4 = (void *)sub_23C9914E0();
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
  id v5 = self;
  sub_23C951D88(v4);
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_23C95278C(v3);

  return v4;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)init
{
  result = (_TtC18ActivityUIServices22ActivityMetricsRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
}

@end