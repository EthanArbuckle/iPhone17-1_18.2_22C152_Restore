@interface UpsellBreakoutSizingTraitEnvironment
- (CGSize)pageContainerSize;
- (UIEdgeInsets)pageMarginInsets;
- (UITraitCollection)traitCollection;
- (_TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment)init;
- (_TtP22SubscribePageExtension20PageTraitEnvironment_)snapshotPageTraitEnvironment;
- (void)setTraitCollection:(id)a3;
@end

@implementation UpsellBreakoutSizingTraitEnvironment

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment_traitCollection));
}

- (void)setTraitCollection:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment_traitCollection);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment_traitCollection) = (Class)a3;
  id v3 = a3;
}

- (CGSize)pageContainerSize
{
  [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment_pageTraits) pageContainerSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)pageMarginInsets
{
  [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment_pageTraits) pageMarginInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtP22SubscribePageExtension20PageTraitEnvironment_)snapshotPageTraitEnvironment
{
  double v2 = (void *)swift_unknownObjectRetain();

  return (_TtP22SubscribePageExtension20PageTraitEnvironment_ *)v2;
}

- (_TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment)init
{
  UIEdgeInsets result = (_TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_63C99537259CB4BBA1C2F973322BF86736UpsellBreakoutSizingTraitEnvironment_traitCollection);
}

@end