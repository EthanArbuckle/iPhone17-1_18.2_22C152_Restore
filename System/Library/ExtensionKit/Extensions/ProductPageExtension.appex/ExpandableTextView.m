@interface ExpandableTextView
- (BOOL)hasContent;
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC20ProductPageExtension18ExpandableTextView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18ExpandableTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ExpandableTextView

- (_TtC20ProductPageExtension18ExpandableTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10074D03C();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExpandableTextView();
  [(ExpandableTextView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ExpandableTextView();
  v18.receiver = self;
  v18.super_class = v8;
  v9 = self;
  [(ExpandableTextView *)&v18 frame];
  double v11 = v10;
  double v13 = v12;
  v17.receiver = v9;
  v17.super_class = v8;
  -[ExpandableTextView setFrame:](&v17, "setFrame:", x, y, width, height);
  [(ExpandableTextView *)v9 frame];
  if (v11 != v15 || v13 != v14) {
    sub_10074B870();
  }
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ExpandableTextView();
  double v2 = [(ExpandableTextView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ExpandableTextView();
  id v4 = a3;
  double v5 = (char *)v10.receiver;
  [(ExpandableTextView *)&v10 setBackgroundColor:v4];
  objc_super v6 = *(void **)&v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel];
  id v7 = objc_msgSend(v5, "backgroundColor", v10.receiver, v10.super_class);
  [v6 setBackgroundColor:v7];

  v8 = *(void **)&v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton];
  id v9 = [v5 backgroundColor];
  [v8 setBackgroundColor:v9];
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_10074B20C();
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExpandableTextView();
  double v2 = (char *)v5.receiver;
  [(ExpandableTextView *)&v5 tintColorDidChange];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton];
  id v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  [v3 setTitleColor:v4 forState:0];
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  CGFloat width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  double v8 = width;
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExpandableTextView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ExpandableTextView *)&v6 traitCollectionDidChange:v4];
  sub_10074B870();
}

- (void)moreFrom:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreTapHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC20ProductPageExtension18ExpandableTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreTapHandler);

  sub_1000194B0(v3);
}

- (BOOL)hasContent
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) hasContent];
}

@end