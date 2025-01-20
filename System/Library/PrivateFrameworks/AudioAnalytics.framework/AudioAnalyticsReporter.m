@interface AudioAnalyticsReporter
+ (void)sendSessionlessMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5;
- (AudioAnalyticsReporter)init;
- (AudioAnalyticsReporter)initWithNewReporterID;
- (AudioAnalyticsReporter)initWithReporterID:(int64_t)a3;
- (AudioAnalyticsReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4;
- (NSDictionary)configuration;
- (int64_t)reporterID;
- (unsigned)serviceType;
- (void)dealloc;
- (void)requestMessageForCategory:(unsigned int)a3 type:(unsigned __int16)a4 callback:(id)a5;
- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5;
- (void)setConfiguration:(id)a3;
- (void)setReporterID:(int64_t)a3;
- (void)setServiceType:(unsigned __int16)a3;
- (void)start;
- (void)stop;
@end

@implementation AudioAnalyticsReporter

- (AudioAnalyticsReporter)initWithNewReporterID
{
  return (AudioAnalyticsReporter *)AudioAnalyticsReporter.init(newReporterID:)();
}

- (AudioAnalyticsReporter)initWithReporterID:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioAnalyticsReporter_reporterID) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)AudioAnalyticsReporter;
  return [(AudioAnalyticsReporter *)&v4 init];
}

- (AudioAnalyticsReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4
{
  return (AudioAnalyticsReporter *)AudioAnalyticsReporter.init(sessionID:serviceType:)(*(uint64_t *)&a3, a4);
}

- (void)dealloc
{
  v2 = self;
  sub_22A5BB0F0();
}

- (int64_t)reporterID
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AudioAnalyticsReporter_reporterID);
  swift_beginAccess();
  return *v2;
}

- (void)setReporterID:(int64_t)a3
{
  objc_super v4 = (int64_t *)((char *)self + OBJC_IVAR___AudioAnalyticsReporter_reporterID);
  swift_beginAccess();
  *objc_super v4 = a3;
}

- (unsigned)serviceType
{
  uint64_t v2 = qword_26AD78A08;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26AD78CD0;
  int64_t v5 = [(AudioAnalyticsReporter *)v3 reporterID];
  MEMORY[0x270FA5388](v5);
  type metadata accessor for AudioServiceType(0);
  sub_22A5DA3C0();

  return v7;
}

- (NSDictionary)configuration
{
  uint64_t v2 = qword_26AD78A08;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26AD78CD0;
  int64_t v5 = [(AudioAnalyticsReporter *)v3 reporterID];
  MEMORY[0x270FA5388](v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF00);
  sub_22A5DA3C0();

  v6 = (void *)sub_22A5DA280();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v6;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v4 = sub_22A5DA2A0();
  int64_t v5 = self;
  AudioAnalyticsReporter.configuration.setter(v4);
}

- (AudioAnalyticsReporter)init
{
  result = (AudioAnalyticsReporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)setServiceType:(unsigned __int16)a3
{
  uint64_t v4 = self;
  AudioAnalyticsReporter.set(serviceType:)(a3);
}

- (void)start
{
  uint64_t v2 = self;
  AudioAnalyticsReporter.start()();
}

- (void)stop
{
  uint64_t v2 = self;
  AudioAnalyticsReporter.stop()();
}

- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v8 = sub_22A5DA2A0();
  v9 = self;
  AudioAnalyticsReporter.sendMessage(_:category:type:)(v8, a4, a5);

  swift_bridgeObjectRelease();
}

+ (void)sendSessionlessMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v7 = sub_22A5DA2A0();
  _sSo22AudioAnalyticsReporterC0aB0E22sendSessionlessMessage_8category4typeySDys11AnyHashableVypG_So0A13EventCategoryVSo0aK4TypeVtFZ_0(v7, a4, a5);
  swift_bridgeObjectRelease();
}

- (void)requestMessageForCategory:(unsigned int)a3 type:(unsigned __int16)a4 callback:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  AudioAnalyticsReporter.requestMessage(for:type:callback:)(a3, a4, (uint64_t)sub_22A5BDAA0, v9);

  swift_release();
}

@end