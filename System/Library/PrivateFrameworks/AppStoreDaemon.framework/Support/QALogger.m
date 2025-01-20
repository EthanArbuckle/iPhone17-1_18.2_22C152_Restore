@interface QALogger
+ (id)serializeLedger;
+ (void)assetWithUrl:(id)a3 variant:(id)a4 isDelta:(BOOL)a5 isParallel:(BOOL)a6 logKey:(id)a7;
+ (void)displayedSpeedWithThroughput:(id)a3 logKey:(id)a4;
+ (void)installWithDuration:(double)a3 logKey:(id)a4;
+ (void)linearDownloadWithLogKey:(id)a3 metrics:(id)a4 throughputMin:(double)a5 throughputMax:(double)a6;
- (_TtC9appstored8QALogger)init;
@end

@implementation QALogger

+ (id)serializeLedger
{
  sub_1000EB2B0();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

+ (void)assetWithUrl:(id)a3 variant:(id)a4 isDelta:(BOOL)a5 isParallel:(BOOL)a6 logKey:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v12 = sub_10001644C((uint64_t *)&unk_1005A5670);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  if (a4)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v19 = a7;
  sub_1000EB98C((uint64_t)v14, v17, (uint64_t)a4, v9, v8, a7);

  swift_bridgeObjectRelease();
  sub_100016714((uint64_t)v14, (uint64_t *)&unk_1005A5670);
}

+ (void)linearDownloadWithLogKey:(id)a3 metrics:(id)a4 throughputMin:(double)a5 throughputMax:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  sub_1000EC030(a3, a4, a5, a6);
}

+ (void)installWithDuration:(double)a3 logKey:(id)a4
{
  v6 = (int *)type metadata accessor for QALogger.Install(0);
  __chkstk_darwin(v6);
  BOOL v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = qword_1005A30A8;
  id v10 = (char *)a4;
  if (v9 != -1)
  {
    uint64_t v17 = v10;
    swift_once();
    id v10 = v17;
  }
  id v11 = (void *)qword_1005A6510;
  if (qword_1005A6510)
  {
    uint64_t v13 = *(void *)&v10[OBJC_IVAR____TtC9appstored6LogKey_value];
    uint64_t v12 = *(void *)&v10[OBJC_IVAR____TtC9appstored6LogKey_value + 8];
    uint64_t v17 = v10;
    swift_bridgeObjectRetain();
    static Date.now.getter();
    v14 = &v8[v6[5]];
    *(void *)v14 = 0x6C6C6174736E69;
    *((void *)v14 + 1) = 0xE700000000000000;
    uint64_t v15 = &v8[v6[6]];
    *(void *)uint64_t v15 = v13;
    *((void *)v15 + 1) = v12;
    *(double *)&v8[v6[7]] = a3;
    sub_1000E9D28((uint64_t)v8, v11);
    sub_1000ECF5C((uint64_t)v8, type metadata accessor for QALogger.Install);
  }
  else
  {
  }
}

+ (void)displayedSpeedWithThroughput:(id)a3 logKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1000ECC00((uint64_t)v5, (uint64_t)v6);
}

- (_TtC9appstored8QALogger)init
{
  return (_TtC9appstored8QALogger *)sub_1000E745C();
}

- (void).cxx_destruct
{
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC9appstored8QALogger_logger;
  uint64_t v4 = type metadata accessor for Logger();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end