@interface ConversationDetailsView
- (CGRect)frame;
- (UILabel)chevronLabel;
- (UILabel)conversationSubtitleLabel;
- (UILabel)conversationTitleLabel;
- (UIStackView)conversationDetailsVStack;
- (_TtC15ConversationKit23ConversationDetailsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit23ConversationDetailsView)initWithFrame:(CGRect)a3;
- (void)setChevronLabel:(id)a3;
- (void)setConversationDetailsVStack:(id)a3;
- (void)setConversationSubtitleLabel:(id)a3;
- (void)setConversationTitleLabel:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ConversationDetailsView

- (UIStackView)conversationDetailsVStack
{
  v2 = self;
  id v3 = ConversationDetailsView.conversationDetailsVStack.getter();

  return (UIStackView *)v3;
}

- (void)setConversationDetailsVStack:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationDetailsView.conversationDetailsVStack.setter((uint64_t)v4);
}

- (UILabel)conversationTitleLabel
{
  v2 = self;
  id v3 = ConversationDetailsView.conversationTitleLabel.getter();

  return (UILabel *)v3;
}

- (void)setConversationTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationDetailsView.conversationTitleLabel.setter((uint64_t)v4);
}

- (UILabel)conversationSubtitleLabel
{
  v2 = self;
  id v3 = ConversationDetailsView.conversationSubtitleLabel.getter();

  return (UILabel *)v3;
}

- (void)setConversationSubtitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationDetailsView.conversationSubtitleLabel.setter((uint64_t)v4);
}

- (UILabel)chevronLabel
{
  v2 = self;
  id v3 = ConversationDetailsView.chevronLabel.getter();

  return (UILabel *)v3;
}

- (void)setChevronLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationDetailsView.chevronLabel.setter((uint64_t)v4);
}

- (CGRect)frame
{
  v2 = self;
  ConversationDetailsView.frame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double v3 = self;
  ConversationDetailsView.frame.setter();
}

- (_TtC15ConversationKit23ConversationDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationDetailsView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  ConversationDetailsView.traitCollectionDidChange(_:)(v9);
}

- (_TtC15ConversationKit23ConversationDetailsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_recipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationDetailsVStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationSubtitleHStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_leadingAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___chevronLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_conversationSubtitleBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_controlsManager));
  swift_release();
}

@end