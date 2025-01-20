@interface MSCachedCuratedCollection
+ (Class)managedClass;
- (BOOL)isTombstone;
- (MSCachedCuratedCollection)initWithCollectionDescription:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 image:(id)a5 imageUrl:(id)a6 isTombstone:(BOOL)a7 lastFetchedDate:(id)a8 lastSignificantChangeDate:(id)a9 placesCount:(int)a10 positionIndex:(int64_t)a11 publisherAttribution:(id)a12 resultProviderIdentifier:(int)a13 title:(id)a14 titleLocale:(id)a15;
- (MSCachedCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCachedCuratedCollection)initWithStore:(id)a3 collectionDescription:(id)a4 curatedCollectionIdentifier:(unint64_t)a5 image:(id)a6 imageUrl:(id)a7 isTombstone:(BOOL)a8 lastFetchedDate:(id)a9 lastSignificantChangeDate:(id)a10 placesCount:(int)a11 positionIndex:(int64_t)a12 publisherAttribution:(id)a13 resultProviderIdentifier:(int)a14 title:(id)a15 titleLocale:(id)a16;
- (NSData)image;
- (NSDate)lastFetchedDate;
- (NSDate)lastSignificantChangeDate;
- (NSString)collectionDescription;
- (NSString)imageUrl;
- (NSString)publisherAttribution;
- (NSString)title;
- (NSString)titleLocale;
- (int)placesCount;
- (int)resultProviderIdentifier;
- (int64_t)positionIndex;
- (unint64_t)curatedCollectionIdentifier;
- (void)setCollectionDescription:(id)a3;
- (void)setCuratedCollectionIdentifier:(unint64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setIsTombstone:(BOOL)a3;
- (void)setLastFetchedDate:(id)a3;
- (void)setLastSignificantChangeDate:(id)a3;
- (void)setPlacesCount:(int)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setPublisherAttribution:(id)a3;
- (void)setResultProviderIdentifier:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocale:(id)a3;
@end

@implementation MSCachedCuratedCollection

- (MSCachedCuratedCollection)initWithCollectionDescription:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 image:(id)a5 imageUrl:(id)a6 isTombstone:(BOOL)a7 lastFetchedDate:(id)a8 lastSignificantChangeDate:(id)a9 placesCount:(int)a10 positionIndex:(int64_t)a11 publisherAttribution:(id)a12 resultProviderIdentifier:(int)a13 title:(id)a14 titleLocale:(id)a15
{
  BOOL v72 = a7;
  unint64_t v70 = a4;
  v71 = self;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  v24 = (char *)&v61 - v23;
  if (a3)
  {
    uint64_t v25 = sub_1A709D438();
    uint64_t v68 = v26;
    uint64_t v69 = v25;
  }
  else
  {
    uint64_t v68 = 0;
    uint64_t v69 = 0;
  }
  if (a5)
  {
    id v27 = a5;
    id v28 = a6;
    id v29 = a8;
    id v30 = a9;
    id v31 = a12;
    id v32 = a14;
    id v33 = a15;
    uint64_t v34 = sub_1A709D198();
    unint64_t v66 = v35;
    uint64_t v67 = v34;

    if (a6) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    if (a8) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  id v39 = a6;
  id v40 = a8;
  id v41 = a9;
  id v42 = a12;
  id v43 = a14;
  id v44 = a15;
  unint64_t v66 = 0xF000000000000000;
  uint64_t v67 = 0;
  if (!a6) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v36 = sub_1A709D438();
  uint64_t v64 = v37;
  uint64_t v65 = v36;

  if (a8)
  {
LABEL_7:
    sub_1A709D1D8();

    uint64_t v38 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v24, 0, 1, v38);
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v45 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v24, 1, 1, v45);
LABEL_11:
  if (a9)
  {
    sub_1A709D1D8();

    uint64_t v46 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v22, 0, 1, v46);
  }
  else
  {
    uint64_t v47 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v22, 1, 1, v47);
  }
  if (a12)
  {
    uint64_t v48 = sub_1A709D438();
    uint64_t v62 = v49;
    uint64_t v63 = v48;
  }
  else
  {
    uint64_t v62 = 0;
    uint64_t v63 = 0;
  }
  uint64_t v50 = (uint64_t)v22;
  if (a14)
  {
    uint64_t v51 = sub_1A709D438();
    uint64_t v53 = v52;
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v53 = 0;
  }
  if (a15)
  {
    uint64_t v54 = sub_1A709D438();
    uint64_t v56 = v55;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v56 = 0;
  }
  unint64_t v58 = v66;
  uint64_t v57 = v67;
  v59 = (MSCachedCuratedCollection *)sub_1A6FE0934(v69, v68, v70, v67, v66, v65, v64, v72, (uint64_t)v24, v50, a10, a11, v63, v62, a13, v51, v53, v54, v56);
  sub_1A6EEF5F4(v57, v58);
  return v59;
}

- (MSCachedCuratedCollection)initWithStore:(id)a3 collectionDescription:(id)a4 curatedCollectionIdentifier:(unint64_t)a5 image:(id)a6 imageUrl:(id)a7 isTombstone:(BOOL)a8 lastFetchedDate:(id)a9 lastSignificantChangeDate:(id)a10 placesCount:(int)a11 positionIndex:(int64_t)a12 publisherAttribution:(id)a13 resultProviderIdentifier:(int)a14 title:(id)a15 titleLocale:(id)a16
{
  BOOL v67 = a8;
  unint64_t v68 = a5;
  uint64_t v69 = self;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  uint64_t v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v58 - v24;
  if (a4)
  {
    uint64_t v26 = sub_1A709D438();
    uint64_t v65 = v27;
    uint64_t v66 = v26;
  }
  else
  {
    uint64_t v65 = 0;
    uint64_t v66 = 0;
  }
  id v64 = a3;
  if (a6)
  {
    id v28 = a6;
    id v29 = a7;
    id v30 = a9;
    id v31 = a10;
    id v32 = a13;
    id v33 = a15;
    id v34 = a16;
    uint64_t v35 = sub_1A709D198();
    unint64_t v62 = v36;
    uint64_t v63 = v35;

    if (a7) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    if (a9) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  id v40 = a7;
  id v41 = a9;
  id v42 = a10;
  id v43 = a13;
  id v44 = a15;
  id v45 = a16;
  unint64_t v62 = 0xF000000000000000;
  uint64_t v63 = 0;
  if (!a7) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v37 = sub_1A709D438();
  uint64_t v60 = v38;
  uint64_t v61 = v37;

  if (a9)
  {
LABEL_7:
    sub_1A709D1D8();

    uint64_t v39 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v25, 0, 1, v39);
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v46 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v25, 1, 1, v46);
LABEL_11:
  if (a10)
  {
    sub_1A709D1D8();

    uint64_t v47 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v23, 0, 1, v47);
  }
  else
  {
    uint64_t v48 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v23, 1, 1, v48);
  }
  if (a13)
  {
    uint64_t v49 = sub_1A709D438();
    uint64_t v58 = v50;
    uint64_t v59 = v49;
  }
  else
  {
    uint64_t v58 = 0;
    uint64_t v59 = 0;
  }
  if (a15)
  {
    uint64_t v51 = sub_1A709D438();
    uint64_t v53 = v52;
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v53 = 0;
  }
  if (a16)
  {
    uint64_t v54 = sub_1A709D438();
    uint64_t v56 = v55;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v56 = 0;
  }
  return (MSCachedCuratedCollection *)CachedCuratedCollection.init(store:collectionDescription:curatedCollectionIdentifier:image:imageUrl:isTombstone:lastFetchedDate:lastSignificantChangeDate:placesCount:positionIndex:publisherAttribution:resultProviderIdentifier:title:titleLocale:)(v64, v66, v65, v68, v63, v62, v61, v60, v67, (uint64_t)v25, (uint64_t)v23, a11, a12, v59, v58, a14, v51, v53, v54,
                                        v56);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6FDB690(v6, a4);
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A6FDCC7C(self, (uint64_t)a2, (void (*)(void))sub_1A6FDBD68);
}

- (void)setCollectionDescription:(id)a3
{
}

- (unint64_t)curatedCollectionIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unint64_t v4 = *(unint64_t *)((char *)&v3->super.super.isa
                           + OBJC_IVAR___MSCachedCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_1A6FDC26C(a3);
}

- (NSData)image
{
  v2 = self;
  uint64_t v3 = sub_1A6FDC538();
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

- (void)setImage:(id)a3
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
  sub_1A6FE0F58((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (NSString)imageUrl
{
  return (NSString *)sub_1A6FDCC7C(self, (uint64_t)a2, (void (*)(void))sub_1A6FDCCFC);
}

- (void)setImageUrl:(id)a3
{
}

- (BOOL)isTombstone
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.super.isa + OBJC_IVAR___MSCachedCuratedCollection__isTombstone);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setIsTombstone:(BOOL)a3
{
  char v4 = self;
  sub_1A6FDD200(a3);
}

- (NSDate)lastFetchedDate
{
  return (NSDate *)sub_1A6FDDCA4(self, (uint64_t)a2, (void (*)(void))sub_1A6FDD4C8);
}

- (void)setLastFetchedDate:(id)a3
{
}

- (NSDate)lastSignificantChangeDate
{
  return (NSDate *)sub_1A6FDDCA4(self, (uint64_t)a2, (void (*)(void))sub_1A6FDDDD0);
}

- (void)setLastSignificantChangeDate:(id)a3
{
}

- (int)placesCount
{
  return sub_1A6FDF6B0((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCachedCuratedCollection__placesCount);
}

- (void)setPlacesCount:(int)a3
{
  char v4 = self;
  sub_1A6FDEC84(a3);
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCachedCuratedCollection__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6FDEFE8(a3);
}

- (NSString)publisherAttribution
{
  return (NSString *)sub_1A6FDCC7C(self, (uint64_t)a2, (void (*)(void))sub_1A6FDF2B8);
}

- (void)setPublisherAttribution:(id)a3
{
}

- (int)resultProviderIdentifier
{
  return sub_1A6FDF6B0((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCachedCuratedCollection__resultProviderIdentifier);
}

- (void)setResultProviderIdentifier:(int)a3
{
  int64_t v4 = self;
  sub_1A6FDF7DC(a3);
}

- (NSString)title
{
  return (NSString *)sub_1A6FDCC7C(self, (uint64_t)a2, (void (*)(void))sub_1A6FDFA40);
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleLocale
{
  return (NSString *)sub_1A6FDCC7C(self, (uint64_t)a2, (void (*)(void))sub_1A6FDFE44);
}

- (void)setTitleLocale:(id)a3
{
}

- (MSCachedCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSCachedCuratedCollection *)sub_1A6FE05B8(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSCachedCuratedCollection__image), *(void *)&self->super._store[OBJC_IVAR___MSCachedCuratedCollection__image]);
  swift_bridgeObjectRelease();
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSCachedCuratedCollection__lastFetchedDate);
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSCachedCuratedCollection__lastSignificantChangeDate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end