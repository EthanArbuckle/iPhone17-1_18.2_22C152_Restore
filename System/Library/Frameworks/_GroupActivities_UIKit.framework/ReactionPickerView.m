@interface ReactionPickerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22_GroupActivities_UIKit18ReactionPickerView)init;
- (_TtC22_GroupActivities_UIKit18ReactionPickerView)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit18ReactionPickerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)presentReactionPicker;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ReactionPickerView

- (_TtC22_GroupActivities_UIKit18ReactionPickerView)init
{
  return (_TtC22_GroupActivities_UIKit18ReactionPickerView *)ReactionPickerView.init()();
}

- (_TtC22_GroupActivities_UIKit18ReactionPickerView)initWithCoder:(id)a3
{
  return [(ReactionPickerView *)self init];
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ReactionPickerView();
  [(ReactionPickerView *)&v4 willMoveToWindow:a3];
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton), sel_intrinsicContentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton);
  v7 = self;
  [(ReactionPickerView *)v7 bounds];
  objc_msgSend(v2, sel_sizeThatFits_, v3, v4);
  objc_msgSend(v2, sel_setFrame_, 0.0, 0.0, v5, v6);
}

- (void)presentReactionPicker
{
  double v2 = self;
  id v3 = [(ReactionPickerView *)v2 window];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(_TtC22_GroupActivities_UIKit18ReactionPickerView *))((*MEMORY[0x263F8EED0] & (uint64_t)v2->super.super.super.isa)
                                                                               + 0x120))(v2);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC22_GroupActivities_UIKit18ReactionPickerView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC22_GroupActivities_UIKit18ReactionPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView__selectedReaction;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<String?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end