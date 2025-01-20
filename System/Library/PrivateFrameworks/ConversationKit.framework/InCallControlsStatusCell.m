@interface InCallControlsStatusCell
- (UIControl)actionButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (_TtC15ConversationKit24InCallControlsStatusCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit24InCallControlsStatusCell)initWithFrame:(CGRect)a3;
- (void)setActionButton:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InCallControlsStatusCell

- (UILabel)titleLabel
{
  v2 = self;
  id v3 = InCallControlsStatusCell.titleLabel.getter();

  return (UILabel *)v3;
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  InCallControlsStatusCell.titleLabel.setter((uint64_t)v4);
}

- (UILabel)subtitleLabel
{
  v2 = self;
  id v3 = InCallControlsStatusCell.subtitleLabel.getter();

  return (UILabel *)v3;
}

- (void)setSubtitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  InCallControlsStatusCell.subtitleLabel.setter((uint64_t)v4);
}

- (UIControl)actionButton
{
  v2 = InCallControlsStatusCell.actionButton.getter();
  return (UIControl *)v2;
}

- (void)setActionButton:(id)a3
{
  id v5 = a3;
  v6 = self;
  InCallControlsStatusCell.actionButton.setter(a3);
}

- (_TtC15ConversationKit24InCallControlsStatusCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit24InCallControlsStatusCell *)InCallControlsStatusCell.init(frame:)();
}

- (_TtC15ConversationKit24InCallControlsStatusCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsStatusCell.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  InCallControlsStatusCell.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  outlined consume of InCallControlsStatusCellViewModel?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(void *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(uint64_t *)((char *)&self->super.super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(uint64_t *)((char *)&self->super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(void **)((char *)&self->super.super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_menuHostViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_faceTimeSymbolImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_sharePlaySymbolImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___conversationStatusHStack));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___conversationStatusDetailsVStack);
}

@end