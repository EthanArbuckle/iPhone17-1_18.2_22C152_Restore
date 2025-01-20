@interface CycleTimelineCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation CycleTimelineCollectionViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_241493428((uint64_t)a3, v7);

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
  unsigned __int8 v6 = sub_24149354C((uint64_t)v8);

  sub_2411E0320((uint64_t)v8);
  return v6 & 1;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes)init
{
  return (_TtC24MenstrualCyclesAppPlugin43CycleTimelineCollectionViewLayoutAttributes *)sub_241493838();
}

@end