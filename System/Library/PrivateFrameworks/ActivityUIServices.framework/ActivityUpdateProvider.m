@interface ActivityUpdateProvider
- (ACActivityDescriptor)descriptor;
- (NSString)identifier;
- (_TtC18ActivityUIServices22ActivityUpdateProvider)init;
- (_TtC18ActivityUIServices22ActivityUpdateProvider)initWithActivityDescriptor:(id)a3 activityState:(int64_t)a4 systemMetricsRequest:(id)a5;
- (int64_t)activityState;
- (void)setActivityState:(int64_t)a3;
- (void)setDescriptor:(id)a3;
@end

@implementation ActivityUpdateProvider

- (int64_t)activityState
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  swift_beginAccess();
  return *v2;
}

- (void)setActivityState:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ACActivityDescriptor)descriptor
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  return (ACActivityDescriptor *)*v2;
}

- (void)setDescriptor:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  v5 = *v4;
  int64_t *v4 = a3;
  id v6 = a3;
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC18ActivityUIServices22ActivityUpdateProvider)initWithActivityDescriptor:(id)a3 activityState:(int64_t)a4 systemMetricsRequest:(id)a5
{
  uint64_t v7 = sub_23C990C60();
  MEMORY[0x270FA5388](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C9550C8();
  sub_23C990DD0();
  id v10 = a5;
  v11 = (_TtC18ActivityUIServices22ActivityUpdateProvider *)sub_23C95D22C((uint64_t)v9, a4, v10);

  return v11;
}

- (_TtC18ActivityUIServices22ActivityUpdateProvider)init
{
  result = (_TtC18ActivityUIServices22ActivityUpdateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityDescriptor;
  uint64_t v4 = sub_23C990C60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_systemMetricsRequest);
}

@end