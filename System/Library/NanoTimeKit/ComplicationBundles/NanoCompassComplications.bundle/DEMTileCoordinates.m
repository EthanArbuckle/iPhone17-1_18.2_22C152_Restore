@interface DEMTileCoordinates
- (BOOL)isEqual:(id)a3;
- (BOOL)isInLookupRangeWithRange:(int64_t)a3 wrt:(id)a4;
- (NSString)description;
- (_TtC24NanoCompassComplications18DEMTileCoordinates)init;
- (_TtC24NanoCompassComplications18DEMTileCoordinates)initWithLocation:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)x;
- (int64_t)y;
@end

@implementation DEMTileCoordinates

- (int64_t)x
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x);
}

- (int64_t)y
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
}

- (_TtC24NanoCompassComplications18DEMTileCoordinates)init
{
  v2 = (objc_class *)type metadata accessor for DEMTileCoordinates();
  v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  v4 = [(DEMTileCoordinates *)&v6 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (_TtC24NanoCompassComplications18DEMTileCoordinates)initWithLocation:(id)a3
{
  id v3 = a3;
  sub_2375D78B8(v3);
  v5 = v4;

  return v5;
}

- (NSString)description
{
  v2 = self;
  DEMTileCoordinates.description.getter();

  id v3 = (void *)sub_2375D9E80();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)hash
{
  return sub_2375D9F40();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2375D9ED0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = DEMTileCoordinates.isEqual(_:)((uint64_t)v8);

  sub_2375D6BA0((uint64_t)v8);
  return v6;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
  v5 = (objc_class *)type metadata accessor for DEMTileCoordinates();
  BOOL v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x] = v3;
  *(void *)&v6[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y] = v4;
  v8.receiver = v6;
  v8.super_class = v5;
  return [(DEMTileCoordinates *)&v8 init];
}

- (BOOL)isInLookupRangeWithRange:(int64_t)a3 wrt:(id)a4
{
  return DEMTileCoordinates.isInLookupRange(range:wrt:)(a3, (uint64_t)a4);
}

@end