@interface MapsSyncMutableFavoriteItem
- (BOOL)hidden;
- (GEOMapItemStorage)mapItemStorage;
- (MapsSyncManagedFavoriteItem)_proxyFavorite;
- (NSSet)contactHandles;
- (NSString)customName;
- (NSString)originatingAddressString;
- (NSString)shortcutIdentifier;
- (_TtC8MapsSync27MapsSyncMutableFavoriteItem)initWithProxyObject:(id)a3;
- (id)addContactHandle:(id)a3;
- (id)moveAfterItem:(id)a3;
- (id)moveBeforeItem:(id)a3;
- (id)removeContactHandle:(id)a3;
- (signed)source;
- (signed)type;
- (signed)version;
- (void)moveToBack;
- (void)moveToFront;
- (void)setContactHandles:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setOriginatingAddressString:(id)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setSource:(signed __int16)a3;
- (void)setType:(signed __int16)a3;
- (void)setVersion:(signed __int16)a3;
- (void)set_proxyFavorite:(id)a3;
@end

@implementation MapsSyncMutableFavoriteItem

- (void)moveToFront
{
  v2 = self;
  MapsSyncMutableFavoriteItem.moveToFront()();
}

- (void)moveToBack
{
  v2 = self;
  MapsSyncMutableFavoriteItem.moveToBack()();
}

- (id)moveBeforeItem:(id)a3
{
  v4 = (char *)a3;
  v5 = self;
  id v6 = MapsSyncMutableFavoriteItem.moveBefore(item:)(v4);

  return v6;
}

- (id)moveAfterItem:(id)a3
{
  v4 = (char *)a3;
  v5 = self;
  id v6 = MapsSyncMutableFavoriteItem.moveAfter(item:)(v4);

  return v6;
}

- (MapsSyncManagedFavoriteItem)_proxyFavorite
{
  return (MapsSyncManagedFavoriteItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite));
}

- (void)set_proxyFavorite:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite) = (Class)a3;
  id v3 = a3;
}

- (_TtC8MapsSync27MapsSyncMutableFavoriteItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedFavoriteItem();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSSet)contactHandles
{
  v2 = self;
  uint64_t v3 = sub_1A7063498();

  if (v3)
  {
    id v4 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return (NSSet *)v4;
}

- (void)setContactHandles:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1A709D648();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_1A70635D0(v4);
}

- (id)addContactHandle:(id)a3
{
  sub_1A709D438();
  uint64_t v4 = self;
  id v5 = sub_1A7063D74();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)removeContactHandle:(id)a3
{
  sub_1A709D438();
  uint64_t v4 = self;
  sub_1A7064024();

  swift_bridgeObjectRelease();
  return 0;
}

- (NSString)customName
{
  return (NSString *)sub_1A7065048((char *)self, (uint64_t)a2, (SEL *)&selRef_customName);
}

- (void)setCustomName:(id)a3
{
}

- (BOOL)hidden
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_hidden);
}

- (void)setHidden:(BOOL)a3
{
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  sub_1A7064614();
  uint64_t v4 = v3;

  return (GEOMapItemStorage *)v4;
}

- (void)setMapItemStorage:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1A70647B8(a3);
}

- (NSString)originatingAddressString
{
  return (NSString *)sub_1A7065048((char *)self, (uint64_t)a2, (SEL *)&selRef_originatingAddressString);
}

- (void)setOriginatingAddressString:(id)a3
{
}

- (signed)type
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_type);
}

- (void)setType:(signed __int16)a3
{
}

- (signed)source
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_source);
}

- (void)setSource:(signed __int16)a3
{
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1A7065048((char *)self, (uint64_t)a2, (SEL *)&selRef_shortcutIdentifier);
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (signed)version
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_version);
}

- (void)setVersion:(signed __int16)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite));
}

@end