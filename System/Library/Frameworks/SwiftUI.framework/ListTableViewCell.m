@interface ListTableViewCell
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7SwiftUI17ListTableViewCell)initWithCoder:(id)a3;
- (_TtC7SwiftUI17ListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutMarginsDidChange;
- (void)prepareForReuse;
@end

@implementation ListTableViewCell

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_delegate);
  _s7SwiftUI9FocusItemVSgWOhTm_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_cellConfiguration, (uint64_t (*)(void))type metadata accessor for CellConfiguration);
  outlined consume of ListSeparatorConfiguration?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_separatorConfiguration), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_separatorConfiguration));

  LOBYTE(v3) = *((unsigned char *)&self->super.super._subviewCache
               + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior);
  outlined copy of PlatformItemList.Item.SelectionBehavior?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._traitChangeRegistry+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), *(uint64_t *)((char *)&self->super.super._layerRetained+ OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_selectionBehavior), v3, (void (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?, (void (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?);
  swift_bridgeObjectRelease();
  _s7SwiftUI9FocusItemVSgWOhTm_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_focusItem, (uint64_t (*)(void))type metadata accessor for FocusItem?);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ListTableViewCell();
  id v6 = a3;
  id v7 = a4;
  v8 = (char *)v9.receiver;
  [(ListTableViewCell *)&v9 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC7SwiftUI17ListTableViewCell_host], sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7, v9.receiver, v9.super_class);
}

- (_TtC7SwiftUI17ListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC7SwiftUI17ListTableViewCell *)ListTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ListTableViewCell();
  id v2 = v3.receiver;
  [(ListTableViewCell *)&v3 layoutMarginsDidChange];
  ListTableViewCell.updateSeparatorsFromConfiguration()();
}

- (void)prepareForReuse
{
  id v2 = self;
  ListTableViewCell.prepareForReuse()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  CGSize v6 = ListTableViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  double v8 = self;
  ListTableViewCell.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC7SwiftUI17ListTableViewCell)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI17ListTableViewCell *)ListTableViewCell.init(coder:)(a3);
}

@end