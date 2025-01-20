@interface RecentsCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)trailingAccessoryView;
- (_TtC15ConversationKit25RecentsCollectionViewCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit25RecentsCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didDoubleTapWithGesture:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RecentsCollectionViewCell

- (_TtC15ConversationKit25RecentsCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit25RecentsCollectionViewCell *)RecentsCollectionViewCell.init(frame:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  RecentsCollectionViewCell.traitCollectionDidChange(_:)(v9);
}

- (void)layoutSubviews
{
  v2 = self;
  RecentsCollectionViewCell.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  CGSize v6 = RecentsCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (UIView)trailingAccessoryView
{
  v2 = self;
  v3 = (void *)RecentsCollectionViewCell.trailingAccessoryView.getter();

  return (UIView *)v3;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v3 = type metadata accessor for UICellConfigurationState();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  CGSize v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC15ConversationKit25RecentsCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  RecentsCollectionViewCell.init(coder:)();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit25RecentsCollectionViewCell_joinButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC15ConversationKit25RecentsCollectionViewCell_doubleTapHandler);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(v3);
}

- (void)didDoubleTapWithGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  RecentsCollectionViewCell.didDoubleTap(gesture:)((uint64_t)v4);
}

@end