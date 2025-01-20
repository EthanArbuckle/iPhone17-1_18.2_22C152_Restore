@interface BaseCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation BaseCollectionViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_10073E4E4((uint64_t)a3, (uint64_t)v7);

  sub_10000FE94(v7, v7[3]);
  v5 = (void *)sub_100768B30();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_100768710();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_10073E638((uint64_t)v8);

  sub_1000126F4((uint64_t)v8);
  return v6;
}

- (_TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BaseCollectionViewLayoutAttributes();
  return [(BaseCollectionViewLayoutAttributes *)&v3 init];
}

@end