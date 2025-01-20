@interface LoggingCardCarouselLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation LoggingCardCarouselLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_2411F73F4((uint64_t)a3, v7);

  sub_2411B6854(v7, v7[3]);
  v5 = (void *)sub_241633208();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_241632CE8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  unsigned __int8 v6 = sub_2411F7524((uint64_t)v8);

  sub_2411E0320((uint64_t)v8);
  return v6 & 1;
}

- (_TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_zoomLevel) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_xTranslationFactor) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_alphaValue) = (Class)0x3FF0000000000000;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(UICollectionViewLayoutAttributes *)&v5 init];
}

@end