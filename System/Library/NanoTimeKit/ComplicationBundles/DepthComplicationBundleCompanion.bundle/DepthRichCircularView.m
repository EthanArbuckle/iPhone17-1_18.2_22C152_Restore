@interface DepthRichCircularView
- (CLKMonochromeFilterProvider)filterProvider;
- (UIFontDescriptor)fontDescriptor;
- (_TtC32DepthComplicationBundleCompanion21DepthRichCircularView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion21DepthRichCircularView)initWithFrame:(CGRect)a3;
- (double)fontSizeFactor;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)setFontDescriptor:(id)a3;
- (void)setFontSizeFactor:(double)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation DepthRichCircularView

- (CLKMonochromeFilterProvider)filterProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (CLKMonochromeFilterProvider *)v2;
}

- (void)setFilterProvider:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_filterProvider) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return sub_23D5C((uint64_t)a3);
}

- (_TtC32DepthComplicationBundleCompanion21DepthRichCircularView)initWithCoder:(id)a3
{
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_26F10(a3);
}

- (UIFontDescriptor)fontDescriptor
{
  return (UIFontDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor));
}

- (void)setFontDescriptor:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_24E20();
}

- (double)fontSizeFactor
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontSizeFactor);
}

- (void)setFontSizeFactor:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontSizeFactor) = a3;
  v3 = self;
  sub_24E20();
}

- (void)updateMonochromeColor
{
  v2 = self;
  sub_243D8(0, 1);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v4 = self;
  sub_243D8(*(uint64_t *)&a3, 0);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246CC();
}

- (_TtC32DepthComplicationBundleCompanion21DepthRichCircularView)initWithFrame:(CGRect)a3
{
  result = (_TtC32DepthComplicationBundleCompanion21DepthRichCircularView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_device));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  uint64_t v4 = sub_36858();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_13704((uint64_t)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_summary, &qword_48A60);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___icon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___labels));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor);
}

@end