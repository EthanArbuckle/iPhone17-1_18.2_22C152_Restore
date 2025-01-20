@interface KnosisServer
+ (id)initWithEntitySubgraphView;
- (_TtC20IntelligencePlatform12KnosisServer)init;
- (id)executeIntentsWithGraphObjectContextWithRequest:(id)a3;
- (id)executeIntentsWithRequest:(id)a3;
- (id)executeKGQWithGraphObjectContextWithRequest:(id)a3;
- (id)executeKGQWithRequest:(id)a3;
@end

@implementation KnosisServer

+ (id)initWithEntitySubgraphView
{
  v2 = (void *)static KnosisServer.withEntitySubgraphView()();

  return v2;
}

- (_TtC20IntelligencePlatform12KnosisServer)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)executeKGQWithRequest:(id)a3
{
  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeKGQ(request:)(v6, v4);
  v8 = v7;

  return v8;
}

- (id)executeKGQWithGraphObjectContextWithRequest:(id)a3
{
  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeKGQWithGraphObjectContext(request:)(v6, v4);
  v8 = v7;

  return v8;
}

- (id)executeIntentsWithRequest:(id)a3
{
  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeIntents(request:)(v6, v4);
  v8 = v7;

  return v8;
}

- (id)executeIntentsWithGraphObjectContextWithRequest:(id)a3
{
  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeIntentsWithGraphObjectContext(request:)(v6, v4);
  v8 = v7;

  return v8;
}

@end