@interface MSCollectionPlaceItem
+ (Class)managedClass;
+ (id)optionsWith:(id)a3;
+ (id)strippedMapItemWith:(id)a3;
- (GEOMapItemStorage)mapItemStorage;
- (MSCollectionPlaceItem)initWithCustomName:(id)a3 droppedPinCoordinate:(id)a4 droppedPinFloorOrdinal:(int)a5 latitude:(id)a6 longitude:(id)a7 mapItemAddress:(id)a8 mapItemCategory:(id)a9 mapItemLastRefreshed:(id)a10 mapItemName:(id)a11 muid:(id)a12 origin:(signed __int16)a13 originalIdentifier:(id)a14 placeItemNote:(id)a15 type:(signed __int16)a16;
- (MSCollectionPlaceItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCollectionPlaceItem)initWithStore:(id)a3 customName:(id)a4 droppedPinCoordinate:(id)a5 droppedPinFloorOrdinal:(int)a6 latitude:(id)a7 longitude:(id)a8 mapItemAddress:(id)a9 mapItemCategory:(id)a10 mapItemLastRefreshed:(id)a11 mapItemName:(id)a12 muid:(id)a13 origin:(signed __int16)a14 originalIdentifier:(id)a15 placeItemNote:(id)a16 type:(signed __int16)a17;
- (NSData)droppedPinCoordinate;
- (NSDate)mapItemLastRefreshed;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSString)customName;
- (NSString)mapItemAddress;
- (NSString)mapItemCategory;
- (NSString)mapItemName;
- (NSString)placeItemNote;
- (NSUUID)originalIdentifier;
- (int)droppedPinFloorOrdinal;
- (signed)origin;
- (signed)type;
- (void)setCustomName:(id)a3;
- (void)setDroppedPinCoordinate:(id)a3;
- (void)setDroppedPinFloorOrdinal:(int)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapItemAddress:(id)a3;
- (void)setMapItemCategory:(id)a3;
- (void)setMapItemLastRefreshed:(id)a3;
- (void)setMapItemName:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuid:(id)a3;
- (void)setOrigin:(signed __int16)a3;
- (void)setOriginalIdentifier:(id)a3;
- (void)setPlaceItemNote:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setType:(signed __int16)a3;
@end

@implementation MSCollectionPlaceItem

- (MSCollectionPlaceItem)initWithCustomName:(id)a3 droppedPinCoordinate:(id)a4 droppedPinFloorOrdinal:(int)a5 latitude:(id)a6 longitude:(id)a7 mapItemAddress:(id)a8 mapItemCategory:(id)a9 mapItemLastRefreshed:(id)a10 mapItemName:(id)a11 muid:(id)a12 origin:(signed __int16)a13 originalIdentifier:(id)a14 placeItemNote:(id)a15 type:(signed __int16)a16
{
  id v83 = a6;
  id v84 = a7;
  unsigned int v81 = a5;
  v82 = self;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v19 - 8);
  v21 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v22 - 8);
  v79 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v24 = sub_1A709D438();
    uint64_t v77 = v25;
    uint64_t v78 = v24;
  }
  else
  {
    uint64_t v77 = 0;
    uint64_t v78 = 0;
  }
  id v80 = a12;
  if (a4)
  {
    id v26 = a4;
    id v27 = v83;
    id v28 = v84;
    id v29 = a8;
    id v30 = a9;
    id v31 = a10;
    id v32 = a11;
    id v33 = a12;
    id v34 = a14;
    id v35 = a15;
    uint64_t v76 = sub_1A709D198();
    unint64_t v37 = v36;

    if (a8)
    {
LABEL_6:
      uint64_t v38 = sub_1A709D438();
      uint64_t v74 = v39;
      uint64_t v75 = v38;

      goto LABEL_9;
    }
  }
  else
  {
    id v40 = v83;
    id v41 = v84;
    id v42 = a8;
    id v43 = a9;
    id v44 = a10;
    id v45 = a11;
    id v46 = a12;
    id v47 = a14;
    id v48 = a15;
    uint64_t v76 = 0;
    unint64_t v37 = 0xF000000000000000;
    if (a8) {
      goto LABEL_6;
    }
  }
  uint64_t v74 = 0;
  uint64_t v75 = 0;
LABEL_9:
  v49 = v21;
  v50 = v79;
  if (a9)
  {
    uint64_t v51 = sub_1A709D438();
    uint64_t v72 = v52;
    uint64_t v73 = v51;

    if (a10)
    {
LABEL_11:
      sub_1A709D1D8();

      uint64_t v53 = sub_1A709D1F8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v50, 0, 1, v53);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    if (a10) {
      goto LABEL_11;
    }
  }
  uint64_t v54 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v50, 1, 1, v54);
LABEL_14:
  if (a11)
  {
    uint64_t v55 = sub_1A709D438();
    uint64_t v57 = v56;

    if (a14)
    {
LABEL_16:
      sub_1A709D238();

      uint64_t v58 = sub_1A709D258();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v49, 0, 1, v58);
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v55 = 0;
    uint64_t v57 = 0;
    if (a14) {
      goto LABEL_16;
    }
  }
  uint64_t v59 = sub_1A709D258();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v49, 1, 1, v59);
LABEL_19:
  if (a15)
  {
    uint64_t v60 = sub_1A709D438();
    uint64_t v62 = v61;
  }
  else
  {
    uint64_t v60 = 0;
    uint64_t v62 = 0;
  }
  uint64_t v71 = (uint64_t)v49;
  id v63 = v80;
  uint64_t v70 = v57;
  uint64_t v69 = (uint64_t)v50;
  uint64_t v64 = v76;
  id v66 = v83;
  id v65 = v84;
  v67 = (MSCollectionPlaceItem *)sub_1A6F22050(v78, v77, v76, v37, v81, (uint64_t)v83, (uint64_t)v84, v75, v74, v73, v72, v69, v55, v70, (uint64_t)v80, a13, v71, v60, v62,
                                   a16);

  sub_1A6EEF5F4(v64, v37);
  return v67;
}

- (MSCollectionPlaceItem)initWithStore:(id)a3 customName:(id)a4 droppedPinCoordinate:(id)a5 droppedPinFloorOrdinal:(int)a6 latitude:(id)a7 longitude:(id)a8 mapItemAddress:(id)a9 mapItemCategory:(id)a10 mapItemLastRefreshed:(id)a11 mapItemName:(id)a12 muid:(id)a13 origin:(signed __int16)a14 originalIdentifier:(id)a15 placeItemNote:(id)a16 type:(signed __int16)a17
{
  id v76 = a7;
  id v77 = a8;
  int v75 = a6;
  uint64_t v74 = self;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v70 = (uint64_t)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v25 = sub_1A709D438();
    uint64_t v72 = v26;
    uint64_t v73 = v25;
  }
  else
  {
    uint64_t v72 = 0;
    uint64_t v73 = 0;
  }
  id v69 = a3;
  id v71 = a13;
  if (a5)
  {
    id v27 = a5;
    id v28 = v76;
    id v29 = v77;
    id v30 = a9;
    id v31 = a10;
    id v32 = a11;
    id v33 = a12;
    id v34 = a13;
    id v35 = a15;
    id v36 = a16;
    uint64_t v37 = sub_1A709D198();
    unint64_t v67 = v38;
    uint64_t v68 = v37;

    uint64_t v39 = (uint64_t)v22;
    if (a9) {
      goto LABEL_6;
    }
  }
  else
  {
    id v46 = v76;
    id v47 = v77;
    id v48 = a9;
    id v49 = a10;
    id v50 = a11;
    id v51 = a12;
    id v52 = a13;
    id v53 = a15;
    id v54 = a16;
    unint64_t v67 = 0xF000000000000000;
    uint64_t v68 = 0;
    uint64_t v39 = (uint64_t)v22;
    if (a9)
    {
LABEL_6:
      uint64_t v40 = sub_1A709D438();
      uint64_t v65 = v41;
      uint64_t v66 = v40;

      uint64_t v42 = v70;
      if (a10) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v70 = 0;
      uint64_t v44 = 0;
      if (a11) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v42 = v70;
  if (!a10) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v70 = sub_1A709D438();
  uint64_t v44 = v43;

  if (a11)
  {
LABEL_8:
    sub_1A709D1D8();

    uint64_t v45 = sub_1A709D1F8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v42, 0, 1, v45);
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v55 = sub_1A709D1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v42, 1, 1, v55);
LABEL_13:
  if (a12)
  {
    uint64_t v56 = sub_1A709D438();
    uint64_t v58 = v57;

    if (a15)
    {
LABEL_15:
      sub_1A709D238();

      uint64_t v59 = sub_1A709D258();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v39, 0, 1, v59);
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v56 = 0;
    uint64_t v58 = 0;
    if (a15) {
      goto LABEL_15;
    }
  }
  uint64_t v60 = sub_1A709D258();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v39, 1, 1, v60);
LABEL_18:
  if (a16)
  {
    uint64_t v61 = sub_1A709D438();
    uint64_t v63 = v62;
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v63 = 0;
  }
  return (MSCollectionPlaceItem *)CollectionPlaceItem.init(store:customName:droppedPinCoordinate:droppedPinFloorOrdinal:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:origin:originalIdentifier:placeItemNote:type:)(v69, v73, v72, v68, v67, v75, v76, v77, v66, v65, v70, v44, v42, v56, v58, v71, a14, v39, v61,
                                    v63,
                                    a17);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6F1A37C(v6, a4);
}

- (NSString)customName
{
  return (NSString *)sub_1A6F1C410(self, (uint64_t)a2, (void (*)(void))sub_1A6F1ABE4);
}

- (void)setCustomName:(id)a3
{
}

- (NSData)droppedPinCoordinate
{
  v2 = self;
  uint64_t v3 = sub_1A6F1B054();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setDroppedPinCoordinate:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    unint64_t v4 = self;
    id v5 = v3;
    uint64_t v3 = (void *)sub_1A709D198();
    unint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1A6F22718((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (int)droppedPinFloorOrdinal
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int v4 = *(_DWORD *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSCollectionPlaceItem__droppedPinFloorOrdinal);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setDroppedPinFloorOrdinal:(int)a3
{
  int v4 = self;
  sub_1A6F1B898(a3);
}

- (NSNumber)latitude
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6F1BB8C();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_1A6F2293C(a3);
}

- (NSNumber)longitude
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6F1BFE4();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_1A6F22B28(a3);
}

- (NSString)mapItemAddress
{
  return (NSString *)sub_1A6F1C410(self, (uint64_t)a2, (void (*)(void))sub_1A6F1C490);
}

- (void)setMapItemAddress:(id)a3
{
}

- (NSString)mapItemCategory
{
  return (NSString *)sub_1A6F1C410(self, (uint64_t)a2, (void (*)(void))sub_1A6F1C894);
}

- (void)setMapItemCategory:(id)a3
{
}

- (NSDate)mapItemLastRefreshed
{
  return (NSDate *)sub_1A6F1E27C(self, (uint64_t)a2, &qword_1EB670330, (void (*)(void))sub_1A6F1CCC8, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (void)setMapItemLastRefreshed:(id)a3
{
}

- (NSString)mapItemName
{
  return (NSString *)sub_1A6F1C410(self, (uint64_t)a2, (void (*)(void))sub_1A6F1D534);
}

- (void)setMapItemName:(id)a3
{
}

- (NSNumber)muid
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6F1D964();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_1A6F233D8(a3);
}

- (signed)origin
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCollectionPlaceItem__origin);
}

- (void)setOrigin:(signed __int16)a3
{
  int v4 = self;
  sub_1A6F1DFE8(a3);
}

- (NSUUID)originalIdentifier
{
  return (NSUUID *)sub_1A6F1E27C(self, (uint64_t)a2, (uint64_t *)&unk_1EB670A40, (void (*)(void))sub_1A6F1E3BC, MEMORY[0x1E4F27990], MEMORY[0x1E4F27980]);
}

- (void)setOriginalIdentifier:(id)a3
{
}

- (NSString)placeItemNote
{
  return (NSString *)sub_1A6F1C410(self, (uint64_t)a2, (void (*)(void))sub_1A6F1F320);
}

- (void)setPlaceItemNote:(id)a3
{
}

- (signed)type
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCollectionPlaceItem__type);
}

- (void)setType:(signed __int16)a3
{
  int v4 = self;
  sub_1A6F1FAB4(a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6F1FDB4();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v7 = a3;
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A6F20D9C((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);
}

- (MSCollectionPlaceItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSCollectionPlaceItem *)sub_1A6F21BC8(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionPlaceItem__droppedPinCoordinate), *(void *)&self->super.super._store[OBJC_IVAR___MSCollectionPlaceItem__droppedPinCoordinate]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F22460((uint64_t)self + OBJC_IVAR___MSCollectionPlaceItem__mapItemLastRefreshed, &qword_1EB670330);
  swift_bridgeObjectRelease();

  sub_1A6F22460((uint64_t)self + OBJC_IVAR___MSCollectionPlaceItem__originalIdentifier, (uint64_t *)&unk_1EB670A40);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionPlaceItem__mapItemStorage);
  unint64_t v4 = *(void *)&self->super.super._store[OBJC_IVAR___MSCollectionPlaceItem__mapItemStorage];
  sub_1A6EEF5F4(v3, v4);
}

+ (id)optionsWith:(id)a3
{
  id v4 = a3;
  id PredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0 = _s8MapsSync0aB14QueryPredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0(0x206D65744970616DLL, 0xEE006C696E203D21, MEMORY[0x1E4FBC860]);
  id v6 = sub_1A7022EA4(a3, PredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0, 0);

  return v6;
}

+ (id)strippedMapItemWith:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 6);
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