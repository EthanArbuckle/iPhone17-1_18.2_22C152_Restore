@interface OfferButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferSubtitleLabel;
- (_TtC22SubscribePageExtension11OfferButton)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension11OfferButton)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OfferButton

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(OfferButton *)&v6 frame];
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
  ObjectType = (objc_class *)swift_getObjectType();
  v19.receiver = self;
  v19.super_class = ObjectType;
  v9 = self;
  [(OfferButton *)&v19 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = ObjectType;
  -[OfferButton setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_10016DEC0(v11, v13, v15, v17);
}

- (_TtC22SubscribePageExtension11OfferButton)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension11OfferButton *)sub_10016E40C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension11OfferButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10016FFF4();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  double v4 = self;
  double v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(OfferButton *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_effectShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_outlineShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_subtitleLabel));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_presenter, &qword_10093B5E8);
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_isEnabledObserver, &qword_1009360F0);
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton__configuration;

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v3);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(OfferButton *)&v5 layoutSubviews];
  uint64_t v3 = (uint64_t)v2 + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton__configuration;
  swift_beginAccess();
  sub_10000FE30(v3, (uint64_t)v4);
  sub_10000FE94(v4, v4[3]);
  [v2 bounds];
  [self areAnimationsEnabled];
  sub_10016FED4();
  sub_10075FB00();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = (char *)v4.receiver;
  [(OfferButton *)&v4 invalidateIntrinsicContentSize];
  uint64_t v3 = &v2[OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_cachedIntrinsicContentSize];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
}

- (CGSize)intrinsicContentSize
{
  id v2 = self;
  double v3 = sub_10016F594();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  double v4 = sub_10016F594();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_10016F898(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(OfferButton *)&v7 setHighlighted:v3];
  uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton__configuration;
  swift_beginAccess();
  sub_10000FE30(v5, (uint64_t)v6);
  sub_10000FE94(v6, v6[3]);
  [v4 bounds];
  sub_10016FED4();
  sub_10075FB00();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v6);
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(OfferButton *)&v5 tintColorDidChange];
  uint64_t v3 = (uint64_t)v2 + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton__configuration;
  swift_beginAccess();
  sub_10000FE30(v3, (uint64_t)v4);
  sub_10000FE94(v4, v4[3]);
  sub_10016FED4();
  sub_10075FB20();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (BOOL)isEnabled
{
  return sub_10016F898(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8.receiver = self;
  v8.super_class = ObjectType;
  double v6 = self;
  if ([(OfferButton *)&v8 isEnabled] != v3) {
    sub_10016F960(v3);
  }
  v7.receiver = v6;
  v7.super_class = ObjectType;
  [(OfferButton *)&v7 setEnabled:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10016FA90((uint64_t)a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_label));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension11OfferButton_subtitleLabel));
}

@end