@interface MapsSyncCollectionPlaceItem
+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6;
- (BOOL)isDuplicateOfOther:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (GEOLatLng)droppedPinCoordinate;
- (GEOMapItemStorage)mapItemStorage;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSString)customName;
- (NSString)description;
- (_TtC8MapsSync27MapsSyncCollectionPlaceItem)initWithCollection:(id)a3;
- (_TtC8MapsSync27MapsSyncCollectionPlaceItem)initWithObject:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int)droppedPinFloorOrdinal;
- (signed)origin;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncCollectionPlaceItem

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1A6EFC83C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A709DCB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  v2 = self;
  sub_1A6EFCA78();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)customName
{
  if (*(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__customName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (GEOLatLng)droppedPinCoordinate
{
  unint64_t v3 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate];
  if (v3 >> 60 == 15)
  {
    v4 = self;
    v5 = 0;
  }
  else
  {
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate);
    v7 = self;
    sub_1A6EEF588(v6, v3);
    v5 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v6, v3);
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F64638]), sel_initWithData_, v5);

  return (GEOLatLng *)v8;
}

- (int)droppedPinFloorOrdinal
{
  return *(_DWORD *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinFloorOrdinal);
}

- (GEOMapItemStorage)mapItemStorage
{
  unint64_t v2 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage];
  if (v2 >> 60 == 15)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage);
    id v6 = objc_allocWithZone(MEMORY[0x1E4F646E0]);
    v7 = self;
    sub_1A6EEF588(v5, v2);
    id v8 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v2);
    id v3 = objc_msgSend(v6, sel_initWithData_, v8);
  }
  return (GEOMapItemStorage *)v3;
}

- (signed)origin
{
  return *(_WORD *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__origin);
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__longitude));
}

- (NSNumber)muid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__muid));
}

- (BOOL)isDuplicateOfOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1A6EFD0EC(v4);

  return self & 1;
}

+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a5;
  sub_1A6EFD3D8(v11, (uint64_t)sub_1A6F02388, v10, a3, a4);

  swift_release();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A6EFDE30((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6EFE268(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1A6F022EC;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1A6F01B48;
  *(void *)(v7 + 24) = v6;
  id v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F0271C, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync27MapsSyncCollectionPlaceItem)initWithCollection:(id)a3
{
  return (_TtC8MapsSync27MapsSyncCollectionPlaceItem *)MapsSyncCollectionPlaceItem.init(collection:)(a3);
}

- (_TtC8MapsSync27MapsSyncCollectionPlaceItem)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync27MapsSyncCollectionPlaceItem *)sub_1A6EFEA04(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__latitude));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__longitude));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__muid);
}

@end