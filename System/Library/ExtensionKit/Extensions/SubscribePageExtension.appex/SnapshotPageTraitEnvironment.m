@interface SnapshotPageTraitEnvironment
- (CGSize)pageContainerSize;
- (UIEdgeInsets)pageMarginInsets;
- (UITraitCollection)traitCollection;
- (_TtC22SubscribePageExtension28SnapshotPageTraitEnvironment)init;
@end

@implementation SnapshotPageTraitEnvironment

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC22SubscribePageExtension28SnapshotPageTraitEnvironment_traitCollection));
}

- (CGSize)pageContainerSize
{
  double v2 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension28SnapshotPageTraitEnvironment_pageContainerSize);
  double v3 = *(double *)&self->traitCollection[OBJC_IVAR____TtC22SubscribePageExtension28SnapshotPageTraitEnvironment_pageContainerSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)pageMarginInsets
{
  double v2 = self;
  sub_1004D1A2C();
  double v4 = v3;

  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v4;
  double v8 = v4;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (_TtC22SubscribePageExtension28SnapshotPageTraitEnvironment)init
{
  UIEdgeInsets result = (_TtC22SubscribePageExtension28SnapshotPageTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28SnapshotPageTraitEnvironment_traitCollection));
}

@end