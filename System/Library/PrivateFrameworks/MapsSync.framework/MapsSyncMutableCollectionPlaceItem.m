@interface MapsSyncMutableCollectionPlaceItem
- (GEOLatLng)droppedPinCoordinate;
- (GEOMapItemStorage)mapItemStorage;
- (NSString)customName;
- (_TtC8MapsSync34MapsSyncMutableCollectionPlaceItem)initWithProxyObject:(id)a3;
- (int)droppedPinFloorOrdinal;
- (signed)origin;
- (void)setCustomName:(id)a3;
- (void)setDroppedPinCoordinate:(id)a3;
- (void)setDroppedPinFloorOrdinal:(int)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setOrigin:(signed __int16)a3;
@end

@implementation MapsSyncMutableCollectionPlaceItem

- (_TtC8MapsSync34MapsSyncMutableCollectionPlaceItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedCollectionItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)customName
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_customName);
  if (v4)
  {
    id v5 = v4;
    sub_1A709D438();

    v6 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setCustomName:(id)a3
{
  if (a3)
  {
    sub_1A709D438();
    id v4 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
    if (v5)
    {
      v6 = self;
      id v7 = v4;
      id v10 = (id)sub_1A709D428();
      swift_bridgeObjectRelease();
      id v8 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
  }
  v9 = self;
  id v7 = v4;
  id v8 = 0;
LABEL_6:
  id v11 = v8;
  objc_msgSend(v7, sel_setCustomName_);
}

- (GEOLatLng)droppedPinCoordinate
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_droppedPinCoordinate);
  if (v4)
  {
    uint64_t v5 = sub_1A709D198();
    unint64_t v7 = v6;

    id v4 = (id)sub_1A709D188();
    sub_1A6EEF608(v5, v7);
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F64638]), sel_initWithData_, v4);

  return (GEOLatLng *)v8;
}

- (void)setDroppedPinCoordinate:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_1A6EFF4F4(a3);
}

- (int)droppedPinFloorOrdinal
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem), sel_droppedPinFloorOrdinal);
}

- (void)setDroppedPinFloorOrdinal:(int)a3
{
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  sub_1A6EFFA14();
  id v4 = v3;

  return (GEOMapItemStorage *)v4;
}

- (void)setMapItemStorage:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_1A6EFFBB8(a3);
}

- (signed)origin
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem), sel_origin);
}

- (void)setOrigin:(signed __int16)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem));
}

@end