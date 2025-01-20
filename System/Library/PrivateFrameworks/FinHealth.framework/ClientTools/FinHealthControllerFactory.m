@interface FinHealthControllerFactory
- (_TtC15finhealthclient26FinHealthControllerFactory)init;
- (void)didUpdateFeatures:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5 error:(id)a6;
@end

@implementation FinHealthControllerFactory

- (void)didUpdateFeatures:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5 error:(id)a6
{
  v10 = (void (*)(uint64_t))_Block_copy(a5);
  if (a3)
  {
    sub_100020058();
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = (void (*)(uint64_t))sub_100020048;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a6;
  v13 = self;
  sub_10001FD00((uint64_t)a3, a4, v10, v11, (uint64_t)a6);

  sub_100020000((uint64_t)v10);
  swift_bridgeObjectRelease();
}

- (_TtC15finhealthclient26FinHealthControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FinHealthControllerFactory();
  return [(FinHealthControllerFactory *)&v3 init];
}

@end