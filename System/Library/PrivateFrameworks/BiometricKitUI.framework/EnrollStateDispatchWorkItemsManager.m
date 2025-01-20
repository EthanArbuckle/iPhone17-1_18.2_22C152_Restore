@interface EnrollStateDispatchWorkItemsManager
- (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager)init;
- (void)removeAllWorkItems;
- (void)submitWorkItemFor:(int)a3 startState:(int)a4 work:(id)a5;
@end

@implementation EnrollStateDispatchWorkItemsManager

- (void)submitWorkItemFor:(int)a3 startState:(int)a4 work:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  sub_1E4BC7120(a3, a4, sub_1E4BC7ECC, v9);

  swift_release();
}

- (void)removeAllWorkItems
{
  v2 = self;
  sub_1E4BC7664();
}

- (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager)init
{
  return (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager *)sub_1E4BC783C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_stateQueue);
}

@end