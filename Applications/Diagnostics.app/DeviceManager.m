@interface DeviceManager
- (void)device:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6;
- (void)device:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5;
- (void)device:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5;
- (void)device:(id)a3 shouldStartTestWithTestId:(id)a4 fullscreen:(BOOL)a5 response:(id)a6;
@end

@implementation DeviceManager

- (void)device:(id)a3 shouldStartTestWithTestId:(id)a4 fullscreen:(BOOL)a5 response:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  swift_unknownObjectRetain();
  id v11 = a4;
  swift_retain();
  sub_1000B678C(a3, a5, (uint64_t)self, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)device:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_unknownObjectRetain();
  id v9 = a4;
  swift_retain();
  sub_1000B46F8((uint64_t)a3, (uint64_t)v9, (uint64_t)sub_1000B644C, v8);
  swift_unknownObjectRelease();

  swift_release();

  swift_release();
}

- (void)device:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  v6 = _Block_copy(a5);
  sub_10003C374(0, &qword_100185698);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1000B4920((uint64_t)a3, v7, (uint64_t)sub_1000B6438, v8);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)device:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6
{
  swift_unknownObjectRetain();
  id v10 = a4;
  id v11 = a5;
  swift_retain();
  id v12 = a6;
  sub_1000B4B00((uint64_t)a3, (uint64_t)v10, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();

  swift_release();
}

@end