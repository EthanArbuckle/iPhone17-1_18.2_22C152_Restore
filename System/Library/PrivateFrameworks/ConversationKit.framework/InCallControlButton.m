@interface InCallControlButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC15ConversationKit19InCallControlButton)initWithCoder:(id)a3;
- (_TtC15ConversationKit19InCallControlButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)_controlEventsForActionTriggered;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation InCallControlButton

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = InCallControlButton.isSelected.getter();

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  InCallControlButton.isSelected.setter(a3);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = InCallControlButton.isHighlighted.getter();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  InCallControlButton.isHighlighted.setter(a3);
}

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = InCallControlButton.isEnabled.getter();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  InCallControlButton.isEnabled.setter(a3);
}

- (_TtC15ConversationKit19InCallControlButton)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlButton.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  InCallControlButton.layoutSubviews()();
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (_TtC15ConversationKit19InCallControlButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discBackgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discBackgroundFlatView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_paragraphStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_image));
  swift_release();
  outlined consume of SymbolImageDescription?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(void **)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super._traitChangeRegistry+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(void **)((char *)&self->super.super._layerRetained+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_menuDataSource;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  v9 = (void *)InCallControlButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v14 = (void *)InCallControlButton.pointerInteraction(_:regionFor:defaultRegion:)((UIPointerInteraction)v8, v12, v13);

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v10 = (void *)InCallControlButton.pointerInteraction(_:styleFor:)((UIPointerInteraction)v6, v9);

  return v10;
}

@end