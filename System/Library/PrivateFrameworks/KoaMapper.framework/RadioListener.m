@interface RadioListener
- (NSString)appId;
- (RadioListener)init;
- (RadioListener)initWithSerialQueue:(id)a3;
- (id)radioStations;
- (id)updateHandler;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)dealloc;
- (void)donationUpdateTriggered;
- (void)setUpdateHandler:(id)a3;
- (void)teardownPublisherSubscriptions;
@end

@implementation RadioListener

- (id)updateHandler
{
  uint64_t v2 = RadioListener.updateHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = thunk for @escaping @callee_guaranteed (@guaranteed String) -> ();
    v6[3] = &block_descriptor_29;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setUpdateHandler:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()partial apply;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  RadioListener.updateHandler.setter((uint64_t)v4, v5);
}

- (NSString)appId
{
  uint64_t v2 = RadioListener.appId.getter();
  uint64_t v3 = (void *)MEMORY[0x22A6161C0](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (RadioListener)initWithSerialQueue:(id)a3
{
  return (RadioListener *)RadioListener.init(serialQueue:)(a3);
}

- (void)dealloc
{
  uint64_t v2 = self;
  RadioListener.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectUnownedDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___RadioListener_updateHandler);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(v3);
}

- (void)teardownPublisherSubscriptions
{
  uint64_t v2 = self;
  RadioListener.teardownPublisherSubscriptions()();
}

- (id)radioStations
{
  uint64_t v2 = self;
  RadioListener.radioStations()();

  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (void)donationUpdateTriggered
{
  uint64_t v2 = self;
  RadioListener.donationUpdateTriggered()();
}

- (RadioListener)init
{
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  RadioListener.accessoryDidUpdate(_:receivedAllValues:)();
}

@end