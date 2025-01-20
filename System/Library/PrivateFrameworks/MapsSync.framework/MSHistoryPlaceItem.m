@interface MSHistoryPlaceItem
+ (Class)managedClass;
+ (id)strippedMapItemWith:(id)a3;
- (GEOMapItemStorage)mapItemStorage;
- (MSHistoryPlaceItem)initWithLatitude:(id)a3 longitude:(id)a4 mapItemLastRefreshed:(id)a5 muid:(id)a6 supersededSearchId:(id)a7;
- (MSHistoryPlaceItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryPlaceItem)initWithStore:(id)a3 latitude:(id)a4 longitude:(id)a5 mapItemLastRefreshed:(id)a6 muid:(id)a7 supersededSearchId:(id)a8;
- (NSDate)mapItemLastRefreshed;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSUUID)supersededSearchId;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapItemLastRefreshed:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuid:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setSupersededSearchId:(id)a3;
@end

@implementation MSHistoryPlaceItem

- (MSHistoryPlaceItem)initWithLatitude:(id)a3 longitude:(id)a4 mapItemLastRefreshed:(id)a5 muid:(id)a6 supersededSearchId:(id)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v12 - 8);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v15 - 8);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1A709D1D8();
    uint64_t v18 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a7)
  {
    sub_1A709D238();
    uint64_t v20 = sub_1A709D258();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_1A709D258();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
  }
  id v22 = a3;
  id v23 = a4;
  id v24 = a6;
  v25 = (MSHistoryPlaceItem *)sub_1A6F48080((uint64_t)a3, (uint64_t)a4, (uint64_t)v17, (uint64_t)a6, (uint64_t)v14);

  return v25;
}

- (MSHistoryPlaceItem)initWithStore:(id)a3 latitude:(id)a4 longitude:(id)a5 mapItemLastRefreshed:(id)a6 muid:(id)a7 supersededSearchId:(id)a8
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_1A709D1D8();
    uint64_t v20 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
  }
  if (a8)
  {
    sub_1A709D238();
    uint64_t v22 = sub_1A709D258();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_1A709D258();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v16, 1, 1, v23);
  }
  id v24 = a3;
  id v25 = a4;
  id v26 = a5;
  id v27 = a7;
  return (MSHistoryPlaceItem *)HistoryPlaceItem.init(store:latitude:longitude:mapItemLastRefreshed:muid:supersededSearchId:)(v24, a4, a5, (uint64_t)v19, a7, (uint64_t)v16);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6F43AD4(v6, a4);
}

- (NSNumber)latitude
{
  v2 = self;
  v3 = (void *)sub_1A6F440E4();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6F483A0(a3);
}

- (NSNumber)longitude
{
  v2 = self;
  v3 = (void *)sub_1A6F4453C();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6F4858C(a3);
}

- (NSDate)mapItemLastRefreshed
{
  return (NSDate *)sub_1A6F45890(self, (uint64_t)a2, &qword_1EB670330, (void (*)(void))sub_1A6F44998, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (void)setMapItemLastRefreshed:(id)a3
{
}

- (NSNumber)muid
{
  v2 = self;
  v3 = (void *)sub_1A6F45230();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6F4883C(a3);
}

- (NSUUID)supersededSearchId
{
  return (NSUUID *)sub_1A6F45890(self, (uint64_t)a2, (uint64_t *)&unk_1EB670A40, (void (*)(void))sub_1A6F459D0, MEMORY[0x1E4F27990], MEMORY[0x1E4F27980]);
}

- (void)setSupersededSearchId:(id)a3
{
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  v3 = (void *)sub_1A6F46960();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v7 = a3;
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A6F47100((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);
}

- (MSHistoryPlaceItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSHistoryPlaceItem *)sub_1A6F47D80(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6F22460((uint64_t)self + OBJC_IVAR___MSHistoryPlaceItem__mapItemLastRefreshed, &qword_1EB670330);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR___MSHistoryPlaceItem__supersededSearchId, (uint64_t *)&unk_1EB670A40);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryPlaceItem__mapItemStorage);
  unint64_t v4 = *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryPlaceItem__mapItemStorage];
  sub_1A6EEF5F4(v3, v4);
}

+ (id)strippedMapItemWith:(id)a3
{
  unint64_t v4 = self;
  id v5 = a3;
  id result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 4);
  if (result)
  {
    id v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end