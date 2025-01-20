@interface MapsSyncQueryPredicate
+ (Class)classForKeyedUnarchiver;
+ (_TtC8MapsSync22MapsSyncQueryPredicate)queryPredicateWithFormat:(id)a3 argumentArray:(id)a4;
+ (id)mapsFavoritesPredicateWithHidden:(BOOL)a3 includeNearbyTransit:(BOOL)a4;
- (Class)classForCoder;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithAnd:(id)a3;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithCenterLatitude:(double)a3 centerLongitude:(double)a4 squareSideLengthMeters:(double)a5;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithCoder:(id)a3;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithFormat:(id)a3 args:(id)a4;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithMapItem:(id)a3 customName:(id)a4;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithNot:(id)a3;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithOr:(id)a3;
- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4;
- (id)not;
@end

@implementation MapsSyncQueryPredicate

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsSyncQueryPredicate();
  return [(MapsSyncQueryPredicate *)&v5 initWithCoder:a3];
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithAnd:(id)a3
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A70215D4(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithOr:(id)a3
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A70215D4(self, (uint64_t)a2, (uint64_t)a3, 2);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithNot:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A70A4E90;
  *(void *)(v5 + 32) = a3;
  uint64_t v11 = v5;
  sub_1A709D4F8();
  sub_1A6EE80D0(0, (unint64_t *)&qword_1EB6711D0);
  id v6 = a3;
  v7 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MapsSyncQueryPredicate();
  v8 = [(MapsSyncQueryPredicate *)&v10 initWithType:0 subpredicates:v7];

  return v8;
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4
{
  sub_1A6EE80D0(0, (unint64_t *)&qword_1EB6711D0);
  sub_1A709D4D8();
  id v6 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MapsSyncQueryPredicate();
  v7 = [(MapsSyncQueryPredicate *)&v9 initWithType:a3 subpredicates:v6];

  return v7;
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithCenterLatitude:(double)a3 centerLongitude:(double)a4 squareSideLengthMeters:(double)a5
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)MapsSyncQueryPredicate.init(centerLatitude:centerLongitude:squareSideLengthMeters:)(a3, a4, a5);
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithFormat:(id)a3 args:(id)a4
{
  uint64_t v5 = sub_1A709D438();
  uint64_t v7 = v6;
  if (a4) {
    uint64_t v8 = sub_1A709D4D8();
  }
  else {
    uint64_t v8 = 0;
  }
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A7021B58(v5, v7, v8);
}

+ (_TtC8MapsSync22MapsSyncQueryPredicate)queryPredicateWithFormat:(id)a3 argumentArray:(id)a4
{
  uint64_t v5 = sub_1A709D438();
  uint64_t v7 = v6;
  if (a4) {
    a4 = (id)sub_1A709D4D8();
  }
  id v8 = objc_allocWithZone((Class)type metadata accessor for MapsSyncQueryPredicate());
  id v9 = sub_1A7021B58(v5, v7, (uint64_t)a4);
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)v9;
}

- (id)not
{
  Predicate = (objc_class *)type metadata accessor for MapsSyncQueryPredicate();
  id v4 = objc_allocWithZone(Predicate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A70A4E90;
  *(void *)(v5 + 32) = self;
  uint64_t v11 = v5;
  sub_1A709D4F8();
  sub_1A6EE80D0(0, (unint64_t *)&qword_1EB6711D0);
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  v10.receiver = v4;
  v10.super_class = Predicate;
  id v8 = [(MapsSyncQueryPredicate *)&v10 initWithType:0 subpredicates:v7];

  return v8;
}

- (Class)classForCoder
{
  sub_1A6EE80D0(0, &qword_1EB670378);
  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)classForKeyedUnarchiver
{
  sub_1A6EE80D0(0, &qword_1EB670378);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8MapsSync22MapsSyncQueryPredicate)initWithMapItem:(id)a3 customName:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1A709D438();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = (void *)swift_unknownObjectRetain();
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)MapsSyncQueryPredicate.init(mapItem:customName:)(v7, v4, v6);
}

+ (id)mapsFavoritesPredicateWithHidden:(BOOL)a3 includeNearbyTransit:(BOOL)a4
{
  id PredicateC013mapsFavoritesD06hidden20includeNearbyTransitACSb_SbtFZ_0 = _s8MapsSync0aB14QueryPredicateC013mapsFavoritesD06hidden20includeNearbyTransitACSb_SbtFZ_0(a3, a4);
  return PredicateC013mapsFavoritesD06hidden20includeNearbyTransitACSb_SbtFZ_0;
}

@end