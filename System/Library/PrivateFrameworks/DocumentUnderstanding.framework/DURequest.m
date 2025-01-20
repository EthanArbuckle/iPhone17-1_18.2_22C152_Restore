@interface DURequest
- (NSArray)strategies;
- (_TtC21DocumentUnderstanding20DURequestContentType)contentType;
- (_TtC21DocumentUnderstanding8DUClient)client;
- (_TtC21DocumentUnderstanding9DURequest)init;
- (_TtC21DocumentUnderstanding9DURequest)initWithClient:(id)a3 contentType:(id)a4 strategies:(id)a5;
- (void)executeWithDocument:(id)a3 completion:(id)a4;
- (void)executeWithResultWithDocument:(_TtC21DocumentUnderstanding10DUDocument *)a3 completionHandler:(id)a4;
@end

@implementation DURequest

- (_TtC21DocumentUnderstanding8DUClient)client
{
  id v2 = sub_2367E8EAC();
  return (_TtC21DocumentUnderstanding8DUClient *)v2;
}

- (_TtC21DocumentUnderstanding20DURequestContentType)contentType
{
  id v2 = sub_2367E8EEC();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

- (NSArray)strategies
{
  if (sub_2367E8F5C())
  {
    type metadata accessor for DURequestStrategy();
    id v2 = (void *)sub_23697B1CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }
  return (NSArray *)v2;
}

- (_TtC21DocumentUnderstanding9DURequest)initWithClient:(id)a3 contentType:(id)a4 strategies:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (a5)
  {
    type metadata accessor for DURequestStrategy();
    uint64_t v5 = sub_23697B1DC();
  }
  return (_TtC21DocumentUnderstanding9DURequest *)DURequest.init(client:contentType:strategies:)((uint64_t)a3, (uint64_t)a4, v5);
}

- (void)executeWithResultWithDocument:(_TtC21DocumentUnderstanding10DUDocument *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_2367E9E0C((uint64_t)&unk_2688989F0, (uint64_t)v7);
}

- (void)executeWithDocument:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  DURequest.execute(document:completion:)(a3, (uint64_t)sub_2367ECB14, v7);

  swift_release();
}

- (_TtC21DocumentUnderstanding9DURequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end