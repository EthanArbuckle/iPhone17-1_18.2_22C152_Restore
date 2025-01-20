@interface ServerClient
+ (_TtC14AudioAnalytics12ServerClient)shared;
+ (void)createSharedClientWithEndpoint:(id)a3;
+ (void)setShared:(id)a3;
- (_TtC14AudioAnalytics12ServerClient)init;
- (_TtC14AudioAnalytics12ServerClient)initWithEndpoint:(id)a3 injectedServerProtocol:(id)a4;
- (id)getConfigurationForReporterID:(int64_t)a3;
- (int64_t)createReportingSession;
- (int64_t)createReportingSessionFromSessionID:(unsigned int)a3;
- (unsigned)getServiceTypeForReporterID:(int64_t)a3;
- (void)destroyReporterID:(int64_t)a3;
- (void)requestMessageForReporterID:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 callback:(id)a6;
- (void)sendMessageForReporterID:(int64_t)a3 message:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6;
- (void)sendSingleMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5;
- (void)setConfiguration:(id)a3 reporterID:(int64_t)a4;
- (void)setServiceType:(unsigned __int16)a3 reporterID:(int64_t)a4;
- (void)startWithReporterID:(int64_t)a3;
- (void)stopWithReporterID:(int64_t)a3;
@end

@implementation ServerClient

+ (_TtC14AudioAnalytics12ServerClient)shared
{
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD78CD0;
  return (_TtC14AudioAnalytics12ServerClient *)v2;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_26AD78A08;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_26AD78CD0;
  qword_26AD78CD0 = (uint64_t)v4;
}

- (_TtC14AudioAnalytics12ServerClient)initWithEndpoint:(id)a3 injectedServerProtocol:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  return (_TtC14AudioAnalytics12ServerClient *)sub_22A5C9890(a3, (uint64_t)a4);
}

+ (void)createSharedClientWithEndpoint:(id)a3
{
  uint64_t v3 = qword_26AD78A08;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  id v5 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  id v6 = v4;
  v7 = sub_22A5C9890(v4, 0);
  id v8 = (id)qword_26AD78CD0;
  qword_26AD78CD0 = (uint64_t)v7;
}

- (int64_t)createReportingSession
{
  v2 = self;
  sub_22A5DA3C0();

  return v4;
}

- (int64_t)createReportingSessionFromSessionID:(unsigned int)a3
{
  uint64_t v3 = self;
  sub_22A5DA3C0();

  return v5;
}

- (void)startWithReporterID:(int64_t)a3
{
  int64_t v4 = self;
  sub_22A5CB698(a3);
}

- (void)stopWithReporterID:(int64_t)a3
{
  int64_t v4 = self;
  sub_22A5CB86C(a3);
}

- (unsigned)getServiceTypeForReporterID:(int64_t)a3
{
  type metadata accessor for AudioServiceType(0);
  int64_t v4 = self;
  sub_22A5DA3C0();

  return v6;
}

- (void)setServiceType:(unsigned __int16)a3 reporterID:(int64_t)a4
{
  unsigned __int16 v6 = self;
  sub_22A5CBDD0(a3, a4);
}

- (id)getConfigurationForReporterID:(int64_t)a3
{
  uint64_t v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF00);
  sub_22A5DA3C0();

  int64_t v4 = (void *)sub_22A5DA280();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)setConfiguration:(id)a3 reporterID:(int64_t)a4
{
  uint64_t v6 = sub_22A5DA2A0();
  v7 = self;
  sub_22A5CC474(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)sendMessageForReporterID:(int64_t)a3 message:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6
{
  uint64_t v10 = sub_22A5DA2A0();
  v11 = self;
  sub_22A5CC668(a3, v10, a5, a6);

  swift_bridgeObjectRelease();
}

- (void)sendSingleMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v8 = sub_22A5DA2A0();
  v9 = self;
  sub_22A5CC8B8(v8, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)destroyReporterID:(int64_t)a3
{
  int64_t v4 = self;
  sub_22A5CCAFC(a3);
}

- (void)requestMessageForReporterID:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 callback:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_22A5CCCD0(a3, a4, a5, (uint64_t)sub_22A5BDAA0, v11);

  swift_release();
}

- (_TtC14AudioAnalytics12ServerClient)init
{
  result = (_TtC14AudioAnalytics12ServerClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_logger;
  uint64_t v4 = sub_22A5DA1F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end