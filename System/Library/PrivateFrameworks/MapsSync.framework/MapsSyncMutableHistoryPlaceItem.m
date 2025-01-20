@interface MapsSyncMutableHistoryPlaceItem
- (GEOMapItemStorage)mapItemStorage;
- (NSUUID)supersededSearchId;
- (_TtC8MapsSync31MapsSyncMutableHistoryPlaceItem)initWithProxyObject:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setSupersededSearchId:(id)a3;
@end

@implementation MapsSyncMutableHistoryPlaceItem

- (_TtC8MapsSync31MapsSyncMutableHistoryPlaceItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableHistoryPlaceItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  sub_1A6FCB864();
  v4 = v3;

  return (GEOMapItemStorage *)v4;
}

- (void)setMapItemStorage:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1A6FCBA08(a3);
}

- (NSUUID)supersededSearchId
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableHistoryPlaceItem__proxyHistory);
  v10 = self;
  id v11 = objc_msgSend(v9, sel_supersededSearchId);
  if (v11)
  {
    v12 = v11;
    sub_1A709D238();

    uint64_t v13 = sub_1A709D258();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_1A709D258();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A6FCCBF0((uint64_t)v6, (uint64_t)v8);

  sub_1A709D258();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A709D228();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSUUID *)v15;
}

- (void)setSupersededSearchId:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A709D238();
    uint64_t v8 = sub_1A709D258();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1A709D258();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A6FCC3D8((uint64_t)v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableHistoryPlaceItem__proxyHistory));
}

@end