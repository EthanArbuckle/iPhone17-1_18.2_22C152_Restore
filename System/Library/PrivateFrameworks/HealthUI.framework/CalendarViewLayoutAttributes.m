@interface CalendarViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC8HealthUI28CalendarViewLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation CalendarViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1E0E8DEF8((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_0(v7, v7[3]);
  v5 = (void *)sub_1E0ECD9D0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  unsigned __int8 v6 = sub_1E0E8E0FC((uint64_t)v8);

  sub_1E0B32EE4((uint64_t)v8);
  return v6 & 1;
}

- (_TtC8HealthUI28CalendarViewLayoutAttributes)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8HealthUI28CalendarViewLayoutAttributes_horizontalSectionInset) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8HealthUI28CalendarViewLayoutAttributes_numberOfDaysPerWeek) = (Class)7;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8HealthUI28CalendarViewLayoutAttributes_weekdayRange) = xmmword_1E0F0A040;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CalendarViewLayoutAttributes();
  return [(UICollectionViewLayoutAttributes *)&v3 init];
}

@end