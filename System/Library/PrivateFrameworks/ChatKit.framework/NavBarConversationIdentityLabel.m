@interface NavBarConversationIdentityLabel
- (CGSize)intrinsicContentSize;
- (_TtC7ChatKit31NavBarConversationIdentityLabel)initWithCoder:(id)a3;
- (_TtC7ChatKit31NavBarConversationIdentityLabel)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation NavBarConversationIdentityLabel

- (_TtC7ChatKit31NavBarConversationIdentityLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F540D08();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_18F54008C(type metadata accessor for NavBarConversationIdentityLabel);
}

- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C120);
  id v9 = a3;
  id v7 = a4;
  v8 = self;
  if (sub_18F7B9FF0())
  {
    sub_18F53F5B4();
    [(NavBarConversationIdentityLabel *)v8 setNeedsLayout];
    [(NavBarConversationIdentityLabel *)v8 invalidateIntrinsicContentSize];
    [(NavBarConversationIdentityLabel *)v8 layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F53F268();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_18F53F53C();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC7ChatKit31NavBarConversationIdentityLabel)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31NavBarConversationIdentityLabel_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31NavBarConversationIdentityLabel_subtitleLabel));

  swift_bridgeObjectRelease();
}

@end