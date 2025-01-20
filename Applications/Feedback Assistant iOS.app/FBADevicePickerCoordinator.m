@interface FBADevicePickerCoordinator
+ (void)showDevicePickerWithChoices:(id)a3 onViewController:(id)a4 completion:(id)a5;
- (_TtC18Feedback_Assistant26FBADevicePickerCoordinator)init;
@end

@implementation FBADevicePickerCoordinator

+ (void)showDevicePickerWithChoices:(id)a3 onViewController:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  sub_100056B94(0, (unint64_t *)&unk_100122F70);
  sub_100060DE8();
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  id v9 = a4;
  sub_1000990D0(v7, v9, (uint64_t)sub_1000768B8, v8);

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC18Feedback_Assistant26FBADevicePickerCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBADevicePickerCoordinator();
  return [(FBADevicePickerCoordinator *)&v3 init];
}

@end