@interface FBKDevicePickerCoordinator
+ (void)showDevicePickerWithChoices:(id)a3 onViewController:(id)a4 completion:(id)a5;
- (_TtC12FeedbackCore26FBKDevicePickerCoordinator)init;
@end

@implementation FBKDevicePickerCoordinator

+ (void)showDevicePickerWithChoices:(id)a3 onViewController:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  sub_22A40F5A0(0, &qword_268376840);
  sub_22A4145B0();
  uint64_t v7 = sub_22A4B36B8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  id v9 = a4;
  _s12FeedbackCore26FBKDevicePickerCoordinatorC010showDeviceD07choices16onViewController10completionyShySo010FBKGroupedG0CG_So06UIViewK0CyAJctFZ_0(v7, v9, (uint64_t)sub_22A414650, v8);

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC12FeedbackCore26FBKDevicePickerCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBKDevicePickerCoordinator();
  return [(FBKDevicePickerCoordinator *)&v3 init];
}

@end