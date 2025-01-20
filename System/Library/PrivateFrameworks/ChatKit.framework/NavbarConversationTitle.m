@interface NavbarConversationTitle
- (CGSize)intrinsicContentSize;
- (_TtC7ChatKit23NavbarConversationTitle)initWithCoder:(id)a3;
- (_TtC7ChatKit23NavbarConversationTitle)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation NavbarConversationTitle

- (void)didMoveToWindow
{
  v2 = self;
  sub_18F54008C(type metadata accessor for NavbarConversationTitle);
}

- (_TtC7ChatKit23NavbarConversationTitle)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F540E20();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F5401FC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_18F5404A8();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_18F540ECC();
}

- (_TtC7ChatKit23NavbarConversationTitle)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23NavbarConversationTitle_titleLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit23NavbarConversationTitle_chevronImageView);
}

@end