@interface FootnoteView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC22SubscribePageExtension12FootnoteView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension12FootnoteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FootnoteView

- (_TtC22SubscribePageExtension12FootnoteView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension12FootnoteView *)sub_100159570(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension12FootnoteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_chevronView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_hasChevron) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLightensOnHighlight) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_isHighlighted) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension12FootnoteView *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_100159B88();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100159E74();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_chevronView);
}

@end