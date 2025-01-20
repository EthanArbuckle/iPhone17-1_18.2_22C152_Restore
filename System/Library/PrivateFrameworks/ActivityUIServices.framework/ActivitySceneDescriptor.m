@interface ActivitySceneDescriptor
- (NSData)activityDescriptor;
- (NSData)activityDescriptorData;
- (NSString)activityIdentifier;
- (NSString)payloadID;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)metrics;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)metricsRequest;
- (_TtC18ActivityUIServices23ActivitySceneDescriptor)init;
- (_TtC18ActivityUIServices23ActivitySceneDescriptor)initWithActivitySceneType:(int64_t)a3 activityDescriptor:(id)a4 metricsRequest:(id)a5 payloadID:(id)a6;
- (int64_t)activitySceneType;
@end

@implementation ActivitySceneDescriptor

- (NSString)activityIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)activitySceneType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType);
}

- (NSData)activityDescriptor
{
  sub_23C990C60();
  sub_23C9839DC((unint64_t *)&qword_26AF226B8);
  v2 = (void *)sub_23C990DE0();
  return (NSData *)v2;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)metricsRequest
{
  return (_TtC18ActivityUIServices22ActivityMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest);
}

- (NSString)payloadID
{
  if (*(void *)&self->activityIdentifier[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)activityDescriptorData
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData));
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)metrics
{
  v3 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = (void **)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  *(_OWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size] = xmmword_23C994F40;
  *(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = 0x4028000000000000;
  swift_beginAccess();
  v6 = *v5;
  *v5 = 0;
  v7 = self;

  v10.receiver = v4;
  v10.super_class = v3;
  v8 = [(ActivitySceneDescriptor *)&v10 init];

  return (_TtC18ActivityUIServices20ActivitySceneMetrics *)v8;
}

- (_TtC18ActivityUIServices23ActivitySceneDescriptor)initWithActivitySceneType:(int64_t)a3 activityDescriptor:(id)a4 metricsRequest:(id)a5 payloadID:(id)a6
{
  uint64_t v9 = sub_23C990C60();
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C9839DC((unint64_t *)&qword_26AF226B8);
  sub_23C990DD0();
  if (a6)
  {
    uint64_t v12 = sub_23C990FD0();
    a6 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v14 = a5;
  v15 = (_TtC18ActivityUIServices23ActivitySceneDescriptor *)sub_23C98368C(a3, (uint64_t)v11, v14, v12, (uint64_t)a6);

  return v15;
}

- (_TtC18ActivityUIServices23ActivitySceneDescriptor)init
{
  result = (_TtC18ActivityUIServices23ActivitySceneDescriptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor;
  uint64_t v4 = sub_23C990C60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData);
}

@end