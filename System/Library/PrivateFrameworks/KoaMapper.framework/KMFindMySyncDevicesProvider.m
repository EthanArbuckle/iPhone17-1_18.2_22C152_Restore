@interface KMFindMySyncDevicesProvider
- (_TtC9KoaMapper27KMFindMySyncDevicesProvider)init;
- (id)getSyncDevices:(id *)a3;
@end

@implementation KMFindMySyncDevicesProvider

- (id)getSyncDevices:(id *)a3
{
  v3 = self;
  KMFindMySyncDevicesProvider.getSyncDevices()();

  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v4.super.isa;
}

- (_TtC9KoaMapper27KMFindMySyncDevicesProvider)init
{
  return (_TtC9KoaMapper27KMFindMySyncDevicesProvider *)KMFindMySyncDevicesProvider.init()();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_itemBuilder);
}

@end