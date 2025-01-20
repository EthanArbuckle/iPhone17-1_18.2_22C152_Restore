@interface DeveloperLinkView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension17DeveloperLinkView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension17DeveloperLinkView)initWithFrame:(CGRect)a3;
- (void)didTapLink:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DeveloperLinkView

- (_TtC20ProductPageExtension17DeveloperLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension17DeveloperLinkView *)sub_100321E90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension17DeveloperLinkView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_tapHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension17DeveloperLinkView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100322594();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[DeveloperLinkView measurementsWithFitting:in:](self, "measurementsWithFitting:in:", self, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = self;
  double v6 = sub_10032296C();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)didTapLink:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_tapHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1003233DC(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_primaryLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_secondaryLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_disclosureImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_secondaryLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension17DeveloperLinkView_tapHandler);

  sub_1000194B0(v3);
}

@end