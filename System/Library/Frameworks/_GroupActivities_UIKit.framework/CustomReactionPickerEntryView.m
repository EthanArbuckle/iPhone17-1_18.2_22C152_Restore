@interface CustomReactionPickerEntryView
- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)init;
- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)insertText:(id)a3;
@end

@implementation CustomReactionPickerEntryView

- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView_onReaction);
  v4 = (objc_class *)type metadata accessor for CustomReactionPickerEntryView();
  void *v3 = 0;
  v3[1] = 0;
  v7.receiver = self;
  v7.super_class = v4;
  v5 = -[CustomReactionPickerEntryView initWithFrame:textContainer:](&v7, sel_initWithFrame_textContainer_, 0, 0.0, 0.0, 0.0, 0.0);
  [(CustomReactionPickerEntryView *)v5 setKeyboardType:124];
  [(CustomReactionPickerEntryView *)v5 setForceDisableDictation:1];

  return v5;
}

- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView_onReaction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)insertText:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  objc_super v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  CustomReactionPickerEntryView.insertText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView_onReaction));
}

@end