@interface LoggingCardCarouselCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout)init;
- (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)prepareLayout;
@end

@implementation LoggingCardCarouselCollectionViewFlowLayout

- (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_scaleFactor) = (Class)0x3FC999999999999ALL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_scaleAlphaFactor) = (Class)0x3FB999999999999ALL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_xScaleFactor) = (Class)0x3FF0000000000000;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *)sub_241633038();
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for LoggingCardCarouselLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)prepareLayout
{
  v2 = self;
  sub_2415E5828();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_2415E5918(x, y, width, height);

  if (v8)
  {
    sub_2415E60B0();
    v9 = (void *)sub_241631F18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = v13.receiver;
  id v8 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v13, sel_invalidationContextForBoundsChange_, x, y, width, height);
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = v8;
    objc_msgSend(v10, sel_setInvalidateFlowLayoutDelegateMetrics_, 0, v13.receiver, v13.super_class);
    objc_msgSend(v10, sel_setInvalidateFlowLayoutAttributes_, 0);

    id v7 = v11;
  }

  return v8;
}

- (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout)init
{
  result = (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super._deletedDecorationIndexPathsDict
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_configuration));
}

@end