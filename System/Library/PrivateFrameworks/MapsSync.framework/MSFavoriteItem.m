@interface MSFavoriteItem
+ (Class)managedClass;
+ (id)findDuplicatesWithContext:(id)a3;
+ (id)mergeWithDuplicates:(id)a3;
+ (id)optionsWith:(id)a3;
+ (id)strippedMapItemWith:(id)a3;
- (BOOL)hidden;
- (GEOMapItemStorage)mapItemStorage;
- (MSFavoriteItem)initWithCustomName:(id)a3 hidden:(BOOL)a4 latitude:(id)a5 longitude:(id)a6 mapItemAddress:(id)a7 mapItemCategory:(id)a8 mapItemLastRefreshed:(id)a9 mapItemName:(id)a10 muid:(id)a11 originatingAddressString:(id)a12 positionIndex:(int64_t)a13 shortcutIdentifier:(id)a14 source:(signed __int16)a15 type:(signed __int16)a16 version:(signed __int16)a17;
- (MSFavoriteItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSFavoriteItem)initWithStore:(id)a3 customName:(id)a4 hidden:(BOOL)a5 latitude:(id)a6 longitude:(id)a7 mapItemAddress:(id)a8 mapItemCategory:(id)a9 mapItemLastRefreshed:(id)a10 mapItemName:(id)a11 muid:(id)a12 originatingAddressString:(id)a13 positionIndex:(int64_t)a14 shortcutIdentifier:(id)a15 source:(signed __int16)a16 type:(signed __int16)a17 version:(signed __int16)a18;
- (NSDate)mapItemLastRefreshed;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSString)customName;
- (NSString)mapItemAddress;
- (NSString)mapItemCategory;
- (NSString)mapItemName;
- (NSString)originatingAddressString;
- (NSString)placeItemNote;
- (NSString)shortcutIdentifier;
- (id)fetchContactHandles;
- (int64_t)positionIndex;
- (signed)favoriteType;
- (signed)source;
- (signed)sourceType;
- (signed)type;
- (signed)version;
- (void)addContactHandle:(id)a3;
- (void)flushChanges;
- (void)moveAfterItem:(id)a3 completion:(id)a4;
- (void)moveBeforeItem:(id)a3 completion:(id)a4;
- (void)moveToBackWithCompletion:(id)a3;
- (void)moveToFrontWithCompletion:(id)a3;
- (void)onFirstSaveWithObject:(id)a3 context:(id)a4;
- (void)removeContactHandle:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setFavoriteType:(signed __int16)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapItemAddress:(id)a3;
- (void)setMapItemCategory:(id)a3;
- (void)setMapItemLastRefreshed:(id)a3;
- (void)setMapItemName:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuid:(id)a3;
- (void)setOriginatingAddressString:(id)a3;
- (void)setPlaceItemNote:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setShortcutIdentifier:(id)a3;
- (void)setSource:(signed __int16)a3;
- (void)setSourceType:(signed __int16)a3;
- (void)setType:(signed __int16)a3;
- (void)setVersion:(signed __int16)a3;
@end

@implementation MSFavoriteItem

- (signed)favoriteType
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unsigned __int16 v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__type);
  objc_msgSend(v2, sel_unlock);
  int v5 = sub_1A6F386EC(v4);

  if ((v5 & 0x10000) != 0) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)setFavoriteType:(signed __int16)a3
{
  unsigned __int16 v4 = self;
  _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(a3);
}

- (signed)sourceType
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unsigned __int16 v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__source);
  objc_msgSend(v2, sel_unlock);
  int v5 = sub_1A6F3879C(v4);

  if ((v5 & 0x10000) != 0) {
    return -1;
  }
  else {
    return v5;
  }
}

- (void)setSourceType:(signed __int16)a3
{
  unsigned __int16 v4 = self;
  _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(a3);
}

- (MSFavoriteItem)initWithCustomName:(id)a3 hidden:(BOOL)a4 latitude:(id)a5 longitude:(id)a6 mapItemAddress:(id)a7 mapItemCategory:(id)a8 mapItemLastRefreshed:(id)a9 mapItemName:(id)a10 muid:(id)a11 originatingAddressString:(id)a12 positionIndex:(int64_t)a13 shortcutIdentifier:(id)a14 source:(signed __int16)a15 type:(signed __int16)a16 version:(signed __int16)a17
{
  v74 = self;
  id v75 = a5;
  BOOL v73 = a4;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v21 - 8);
  v23 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v24 = sub_1A709D438();
    uint64_t v70 = v25;
    uint64_t v71 = v24;
    id v26 = a6;
    if (a7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    id v29 = a9;
    if (a8) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  id v26 = a6;
  if (!a7) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v27 = sub_1A709D438();
  uint64_t v68 = v28;
  uint64_t v69 = v27;
  id v29 = a9;
  if (a8)
  {
LABEL_4:
    uint64_t v30 = sub_1A709D438();
    uint64_t v65 = v31;
    uint64_t v66 = v30;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v65 = 0;
  uint64_t v66 = 0;
LABEL_8:
  id v67 = a11;
  if (v29)
  {
    sub_1A709D1D8();
    uint64_t v32 = sub_1A709D1F8();
    v33 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
    id v34 = v75;
    uint64_t v35 = (uint64_t)v26;
    id v36 = v26;
    id v37 = a10;
    id v38 = a11;
    id v39 = a12;
    id v40 = a14;
    v33(v23, 0, 1, v32);
    if (a10)
    {
LABEL_10:
      uint64_t v41 = sub_1A709D438();
      uint64_t v63 = v42;
      uint64_t v64 = v41;

      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v43 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v23, 1, 1, v43);
    id v44 = v75;
    uint64_t v35 = (uint64_t)v26;
    id v45 = v26;
    id v46 = a10;
    id v47 = a11;
    id v48 = a12;
    id v49 = a14;
    if (a10) {
      goto LABEL_10;
    }
  }
  uint64_t v63 = 0;
  uint64_t v64 = 0;
LABEL_13:
  uint64_t v50 = (uint64_t)v23;
  v72 = (void *)v35;
  if (a12)
  {
    uint64_t v51 = sub_1A709D438();
    uint64_t v53 = v52;
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v53 = 0;
  }
  if (a14)
  {
    uint64_t v54 = sub_1A709D438();
    uint64_t v56 = v55;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v56 = 0;
  }
  HIWORD(v62) = a16;
  LOWORD(v62) = a15;
  id v57 = v67;
  id v58 = v75;
  v59 = v72;
  v60 = (MSFavoriteItem *)sub_1A705AE58(v71, v70, v73, (uint64_t)v75, (uint64_t)v72, v69, v68, v66, v65, v50, v64, v63, (uint64_t)v67, v51, v53, a13, v54, v56, v62,
                            a17);

  return v60;
}

- (MSFavoriteItem)initWithStore:(id)a3 customName:(id)a4 hidden:(BOOL)a5 latitude:(id)a6 longitude:(id)a7 mapItemAddress:(id)a8 mapItemCategory:(id)a9 mapItemLastRefreshed:(id)a10 mapItemName:(id)a11 muid:(id)a12 originatingAddressString:(id)a13 positionIndex:(int64_t)a14 shortcutIdentifier:(id)a15 source:(signed __int16)a16 type:(signed __int16)a17 version:(signed __int16)a18
{
  BOOL v73 = self;
  id v74 = a7;
  BOOL v72 = a5;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v25 = sub_1A709D438();
    uint64_t v68 = v26;
    uint64_t v69 = v25;
    id v27 = a9;
    if (a8) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    id v30 = a10;
    if (v27) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  id v27 = a9;
  if (!a8) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v28 = sub_1A709D438();
  uint64_t v66 = v29;
  uint64_t v67 = v28;
  id v30 = a10;
  if (v27)
  {
LABEL_4:
    uint64_t v31 = sub_1A709D438();
    uint64_t v64 = v32;
    uint64_t v65 = v31;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v64 = 0;
  uint64_t v65 = 0;
LABEL_8:
  uint64_t v70 = v24;
  id v63 = a12;
  if (v30)
  {
    sub_1A709D1D8();
    v33 = v24;
    uint64_t v34 = sub_1A709D1F8();
    uint64_t v35 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
    id v36 = a3;
    id v37 = a6;
    id v38 = v74;
    id v39 = a11;
    id v40 = a12;
    id v41 = a13;
    id v42 = a15;
    v35(v33, 0, 1, v34);
    if (a11)
    {
LABEL_10:
      uint64_t v43 = sub_1A709D438();
      uint64_t v61 = v44;
      uint64_t v62 = v43;

      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v45 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v24, 1, 1, v45);
    id v46 = a3;
    id v47 = a6;
    id v48 = v74;
    id v49 = a11;
    id v50 = a12;
    id v51 = a13;
    id v52 = a15;
    if (a11) {
      goto LABEL_10;
    }
  }
  uint64_t v61 = 0;
  uint64_t v62 = 0;
LABEL_13:
  id v71 = a6;
  if (a13)
  {
    uint64_t v53 = sub_1A709D438();
    uint64_t v55 = v54;
  }
  else
  {
    uint64_t v53 = 0;
    uint64_t v55 = 0;
  }
  if (a15)
  {
    uint64_t v56 = sub_1A709D438();
    uint64_t v58 = v57;
  }
  else
  {
    uint64_t v56 = 0;
    uint64_t v58 = 0;
  }
  return (MSFavoriteItem *)FavoriteItem.init(store:customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(a3, v69, v68, v72, v71, v74, v67, v66, v65, v64, (uint64_t)v70, v62, v61, v63, v53, v55, a14, v56, v58,
                             a16,
                             a17,
                             a18);
}

- (void)flushChanges
{
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  void *v3 = MEMORY[0x1E4FBC860];
  int v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSFavoriteItem__handleChanges);
  swift_beginAccess();
  void *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedFavoriteItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A705318C(v6, a4);
}

- (NSString)customName
{
  return (NSString *)sub_1A70548B8(self, (uint64_t)a2, (void (*)(void))sub_1A705382C);
}

- (void)setCustomName:(id)a3
{
}

- (BOOL)hidden
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__hidden);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setHidden:(BOOL)a3
{
  char v4 = self;
  sub_1A7053D30(a3);
}

- (NSNumber)latitude
{
  v2 = self;
  v3 = (void *)sub_1A7054034();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  id v6 = a3;
  int v5 = self;
  sub_1A705B3FC(a3);
}

- (NSNumber)longitude
{
  v2 = self;
  v3 = (void *)sub_1A705448C();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  id v6 = a3;
  int v5 = self;
  sub_1A705B5F8(a3);
}

- (NSString)mapItemAddress
{
  return (NSString *)sub_1A70548B8(self, (uint64_t)a2, (void (*)(void))sub_1A7054938);
}

- (void)setMapItemAddress:(id)a3
{
}

- (NSString)mapItemCategory
{
  return (NSString *)sub_1A70548B8(self, (uint64_t)a2, (void (*)(void))sub_1A7054D3C);
}

- (void)setMapItemCategory:(id)a3
{
}

- (NSDate)mapItemLastRefreshed
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  sub_1A705524C((uint64_t)v5);

  uint64_t v7 = sub_1A709D1F8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setMapItemLastRefreshed:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A709D1D8();
    uint64_t v8 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A70557D8((uint64_t)v7);
}

- (NSString)mapItemName
{
  return (NSString *)sub_1A70548B8(self, (uint64_t)a2, (void (*)(void))sub_1A7056074);
}

- (void)setMapItemName:(id)a3
{
}

- (NSNumber)muid
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A70564A4();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1A705BFD4(a3);
}

- (NSString)originatingAddressString
{
  return (NSString *)sub_1A70548B8(self, (uint64_t)a2, (void (*)(void))sub_1A7056AD4);
}

- (void)setOriginatingAddressString:(id)a3
{
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A7056FD8(a3);
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1A70548B8(self, (uint64_t)a2, (void (*)(void))sub_1A70572AC);
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (signed)source
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSFavoriteItem__source);
}

- (void)setSource:(signed __int16)a3
{
  int64_t v4 = self;
  _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(a3);
}

- (signed)type
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSFavoriteItem__type);
}

- (void)setType:(signed __int16)a3
{
  int64_t v4 = self;
  _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(a3);
}

- (signed)version
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSFavoriteItem__version);
}

- (void)setVersion:(signed __int16)a3
{
  int64_t v4 = self;
  sub_1A7057FD0(a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A70582E0();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  uint64_t v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v7 = a3;
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A7058A80((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);
}

- (id)fetchContactHandles
{
  v2 = self;
  sub_1A7059850();

  uint64_t v3 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addContactHandle:(id)a3
{
}

- (void)removeContactHandle:(id)a3
{
}

- (MSFavoriteItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSFavoriteItem *)sub_1A705A67C(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSFavoriteItem__mapItemStorage), *(void *)&self->super._store[OBJC_IVAR___MSFavoriteItem__mapItemStorage]);
  swift_bridgeObjectRelease();
}

- (void)onFirstSaveWithObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1A7083E50(v6, v7);
}

+ (id)optionsWith:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1A70887B8(a3);

  return v5;
}

+ (id)strippedMapItemWith:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 5);
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

+ (id)mergeWithDuplicates:(id)a3
{
  sub_1A6EE80D0(0, (unint64_t *)&unk_1EB670260);
  uint64_t v3 = sub_1A709D4D8();
  id v4 = (void *)sub_1A70888F0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)findDuplicatesWithContext:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1A708469C((uint64_t)v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670670);
  id v5 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)moveToFrontWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A70A4E90;
  *(void *)(inited + 32) = self;
  unint64_t v9 = inited;
  sub_1A709D4F8();
  id v7 = self;
  swift_retain();
  id v8 = v5;
  sub_1A6F8F89C(v9, (uint64_t)v7, (void (*)(id))sub_1A7088B2C);

  swift_bridgeObjectRelease();
  swift_release_n();
}

- (void)moveToBackWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A70A4E90;
  *(void *)(inited + 32) = self;
  unint64_t v9 = inited;
  sub_1A709D4F8();
  id v7 = self;
  swift_retain();
  id v8 = v5;
  sub_1A6F8FBC4(v9, (uint64_t)v7, (void (*)(id))sub_1A7088B2C);

  swift_bridgeObjectRelease();
  swift_release_n();
}

- (void)moveBeforeItem:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A70A52B0;
  *(void *)(inited + 32) = self;
  *(void *)(inited + 40) = a3;
  unint64_t v13 = inited;
  sub_1A709D4F8();
  unint64_t v9 = self;
  id v10 = a3;
  uint64_t v11 = v9;
  swift_retain();
  id v12 = v7;
  sub_1A6F8FEEC(v13, (uint64_t)v11, (void (*)(id))sub_1A7088B2C);

  swift_bridgeObjectRelease();
  swift_release_n();
}

- (void)moveAfterItem:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A70A52B0;
  *(void *)(inited + 32) = self;
  *(void *)(inited + 40) = a3;
  unint64_t v13 = inited;
  sub_1A709D4F8();
  unint64_t v9 = self;
  id v10 = a3;
  uint64_t v11 = v9;
  swift_retain();
  id v12 = v7;
  sub_1A6F90214(v13, (uint64_t)v11, (void (*)(id))sub_1A7088B24);

  swift_bridgeObjectRelease();
  swift_release_n();
}

- (NSString)placeItemNote
{
  v2 = self;
  FavoriteItem.placeItemNote.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlaceItemNote:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1A709D438();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  FavoriteItem.placeItemNote.setter(v4, v6);
}

@end