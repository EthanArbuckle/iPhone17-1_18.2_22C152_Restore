@interface PARBag
- (BOOL)configBoolForKey:(id)a3;
- (BOOL)isExpired;
- (NSString)searchURLString;
- (id)findConfigForUserAgent:(id)a3;
- (id)rawConfig;
- (id)valueForKey:(id)a3 ofType:(Class)a4;
- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4;
@end

@implementation PARBag

- (id)findConfigForUserAgent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  id v8 = PARBag.findConfig(forUserAgent:)(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)isExpired
{
  v2 = self;
  BOOL v3 = PARBag.isExpired.getter();

  return v3;
}

- (NSString)searchURLString
{
  v2 = self;
  PARBag.searchURLString.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (id)rawConfig
{
  v2 = self;
  unint64_t v3 = (unint64_t)PARBag.rawConfig()();

  if (v3)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (id)valueForKey:(id)a3 ofType:(Class)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  NSString v5 = self;
  PARBag.value(forKey:ofType:)((uint64_t)v14);

  swift_bridgeObjectRelease();
  uint64_t v6 = v15;
  if (v15)
  {
    v7 = sub_10001B620(v14, v15);
    uint64_t v8 = *(void *)(v6 - 8);
    double v9 = __chkstk_darwin(v7);
    v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v8 + 16))(v11, v9);
    v12 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    sub_10001CA50((uint64_t)v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  double v9 = self;
  PARBag.value(forKey:shouldConsiderOverrides:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  uint64_t v10 = v19;
  if (v19)
  {
    v11 = sub_10001B620(v18, v19);
    uint64_t v12 = *(void *)(v10 - 8);
    double v13 = __chkstk_darwin(v11);
    uint64_t v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v12 + 16))(v15, v13);
    v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
    sub_10001CA50((uint64_t)v18);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)configBoolForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = PARBag.configBool(forKey:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

@end