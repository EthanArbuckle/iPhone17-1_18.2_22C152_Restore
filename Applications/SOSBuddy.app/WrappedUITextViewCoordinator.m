@interface WrappedUITextViewCoordinator
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC8SOSBuddy28WrappedUITextViewCoordinator)init;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)textViewDidChange:(id)a3;
@end

@implementation WrappedUITextViewCoordinator

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000FD418(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1000FE978(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_1000FECB8(a4, a5);
}

- (_TtC8SOSBuddy28WrappedUITextViewCoordinator)init
{
  result = (_TtC8SOSBuddy28WrappedUITextViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end