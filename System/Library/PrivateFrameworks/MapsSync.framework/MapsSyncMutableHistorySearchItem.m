@interface MapsSyncMutableHistorySearchItem
- (GEOMapRegion)geoMapRegion;
- (NSString)language;
- (NSString)locationDisplay;
- (NSString)query;
- (_TtC8MapsSync32MapsSyncMutableHistorySearchItem)initWithProxyObject:(id)a3;
- (void)setGeoMapRegion:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocationDisplay:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation MapsSyncMutableHistorySearchItem

- (_TtC8MapsSync32MapsSyncMutableHistorySearchItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistorySearchItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync32MapsSyncMutableHistorySearchItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (GEOMapRegion)geoMapRegion
{
  v2 = self;
  id v3 = sub_1A6FD7AD4();

  return (GEOMapRegion *)v3;
}

- (void)setGeoMapRegion:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1A6FD7C1C(a3);
}

- (NSString)language
{
  return (NSString *)sub_1A6FD8160((char *)self, (uint64_t)a2, (SEL *)&selRef_language);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)locationDisplay
{
  return (NSString *)sub_1A6FD8160((char *)self, (uint64_t)a2, (SEL *)&selRef_locationDisplay);
}

- (void)setLocationDisplay:(id)a3
{
}

- (NSString)query
{
  return (NSString *)sub_1A6FD8160((char *)self, (uint64_t)a2, (SEL *)&selRef_query);
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync32MapsSyncMutableHistorySearchItem__proxyHistory));
}

@end