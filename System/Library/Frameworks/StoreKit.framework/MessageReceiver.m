@interface MessageReceiver
- (_TtC8StoreKit15MessageReceiver)init;
- (void)pendingMessages:(id)a3;
@end

@implementation MessageReceiver

- (void)pendingMessages:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B1B038);
    uint64_t v3 = sub_1B01DBDF0();
  }
  swift_retain();
  sub_1B015AFDC(v3);
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC8StoreKit15MessageReceiver)init
{
}

@end