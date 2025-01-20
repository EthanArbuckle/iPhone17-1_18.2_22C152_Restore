@interface EditorsChoiceReviewView
- (BOOL)accessibilityShowsBadge;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension17EditorsChoiceView)accessibilityBadgeView;
- (_TtC20ProductPageExtension23EditorsChoiceReviewView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23EditorsChoiceReviewView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
@end

@implementation EditorsChoiceReviewView

- (_TtC20ProductPageExtension23EditorsChoiceReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23EditorsChoiceReviewView *)sub_100324998(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23EditorsChoiceReviewView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_isExpanded) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_showsBadge) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_pageTraits) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension23EditorsChoiceReviewView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100325ED8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1003274E0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)moreFrom:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (_TtC20ProductPageExtension17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC20ProductPageExtension17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_badgeView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_showsBadge);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_backgroundImageView));
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler);

  sub_1000194B0(v3);
}

@end