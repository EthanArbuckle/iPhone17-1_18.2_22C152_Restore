@interface MSReviewedPlace
+ (Class)managedClass;
+ (id)strippedMapItemWith:(id)a3;
- (BOOL)hasUserReviewed;
- (MSAnonymousCredential)anonymousCredential;
- (MSCommunityID)communityID;
- (MSReviewedPlace)initWithHasUserReviewed:(BOOL)a3 lastSuggestedReviewDate:(id)a4 latitude:(id)a5 longitude:(id)a6 mapItemIdComparableRepresentation:(id)a7 mapItemLastRefreshed:(id)a8 mapItemStorage:(id)a9 muid:(unint64_t)a10 positionIndex:(int64_t)a11 rating:(id)a12 resultProviderIdentifier:(id)a13 uploadedPhotosCount:(int)a14 version:(signed __int16)a15;
- (MSReviewedPlace)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSReviewedPlace)initWithStore:(id)a3 hasUserReviewed:(BOOL)a4 lastSuggestedReviewDate:(id)a5 latitude:(id)a6 longitude:(id)a7 mapItemIdComparableRepresentation:(id)a8 mapItemLastRefreshed:(id)a9 mapItemStorage:(id)a10 muid:(unint64_t)a11 positionIndex:(int64_t)a12 rating:(id)a13 resultProviderIdentifier:(id)a14 uploadedPhotosCount:(int)a15 version:(signed __int16)a16;
- (NSData)mapItemIdComparableRepresentation;
- (NSData)mapItemStorage;
- (NSDate)lastSuggestedReviewDate;
- (NSDate)mapItemLastRefreshed;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)rating;
- (NSNumber)resultProviderIdentifier;
- (int)uploadedPhotosCount;
- (int64_t)positionIndex;
- (signed)version;
- (unint64_t)muid;
- (void)setAnonymousCredential:(id)a3;
- (void)setCommunityID:(id)a3;
- (void)setHasUserReviewed:(BOOL)a3;
- (void)setLastSuggestedReviewDate:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapItemIdComparableRepresentation:(id)a3;
- (void)setMapItemLastRefreshed:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRating:(id)a3;
- (void)setResultProviderIdentifier:(id)a3;
- (void)setUploadedPhotosCount:(int)a3;
- (void)setVersion:(signed __int16)a3;
@end

@implementation MSReviewedPlace

- (MSReviewedPlace)initWithHasUserReviewed:(BOOL)a3 lastSuggestedReviewDate:(id)a4 latitude:(id)a5 longitude:(id)a6 mapItemIdComparableRepresentation:(id)a7 mapItemLastRefreshed:(id)a8 mapItemStorage:(id)a9 muid:(unint64_t)a10 positionIndex:(int64_t)a11 rating:(id)a12 resultProviderIdentifier:(id)a13 uploadedPhotosCount:(int)a14 version:(signed __int16)a15
{
  BOOL v57 = a3;
  v58 = self;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  v25 = (char *)&v51 - v24;
  uint64_t v56 = (uint64_t)&v51 - v24;
  if (a4)
  {
    sub_1A709D1D8();
    uint64_t v26 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
  }
  else
  {
    uint64_t v27 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v25, 1, 1, v27);
  }
  id v55 = a5;
  id v54 = a6;
  if (a7)
  {
    id v28 = a7;
    id v29 = a8;
    id v30 = a9;
    id v31 = a12;
    id v32 = a13;
    uint64_t v33 = sub_1A709D198();
    unint64_t v52 = v34;
    uint64_t v53 = v33;

    if (a8)
    {
LABEL_6:
      sub_1A709D1D8();

      uint64_t v35 = sub_1A709D1F8();
      uint64_t v36 = (uint64_t)v23;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v23, 0, 1, v35);
      goto LABEL_9;
    }
  }
  else
  {
    id v37 = a8;
    id v38 = a9;
    id v39 = a12;
    id v40 = a13;
    unint64_t v52 = 0xF000000000000000;
    uint64_t v53 = 0;
    if (a8) {
      goto LABEL_6;
    }
  }
  uint64_t v41 = sub_1A709D1F8();
  uint64_t v36 = (uint64_t)v23;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v23, 1, 1, v41);
LABEL_9:
  if (a9)
  {
    uint64_t v42 = sub_1A709D198();
    unint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    unint64_t v44 = 0xF000000000000000;
  }
  id v45 = v55;
  uint64_t v47 = v53;
  id v46 = v54;
  unint64_t v48 = v52;
  v49 = (MSReviewedPlace *)sub_1A6FD3FC0(v57, v56, (uint64_t)v55, (uint64_t)v54, v53, v52, v36, v42, v44, a10, a11, (uint64_t)a12, (uint64_t)a13, a14, a15);

  sub_1A6EEF5F4(v42, v44);
  sub_1A6EEF5F4(v47, v48);

  return v49;
}

- (MSReviewedPlace)initWithStore:(id)a3 hasUserReviewed:(BOOL)a4 lastSuggestedReviewDate:(id)a5 latitude:(id)a6 longitude:(id)a7 mapItemIdComparableRepresentation:(id)a8 mapItemLastRefreshed:(id)a9 mapItemStorage:(id)a10 muid:(unint64_t)a11 positionIndex:(int64_t)a12 rating:(id)a13 resultProviderIdentifier:(id)a14 uploadedPhotosCount:(int)a15 version:(signed __int16)a16
{
  BOOL v52 = a4;
  uint64_t v53 = self;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  uint64_t v24 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v46 - v25;
  if (a5)
  {
    sub_1A709D1D8();
    uint64_t v27 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 0, 1, v27);
  }
  else
  {
    uint64_t v28 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v26, 1, 1, v28);
  }
  id v50 = a3;
  id v49 = a6;
  id v48 = a7;
  id v51 = a14;
  if (a8)
  {
    id v29 = a8;
    id v30 = a9;
    id v31 = a10;
    id v32 = a13;
    id v33 = a14;
    uint64_t v34 = sub_1A709D198();
    unint64_t v46 = v35;
    uint64_t v47 = v34;

    if (a9)
    {
LABEL_6:
      sub_1A709D1D8();

      uint64_t v36 = sub_1A709D1F8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v24, 0, 1, v36);
      goto LABEL_9;
    }
  }
  else
  {
    id v37 = a9;
    id v38 = a10;
    id v39 = a13;
    id v40 = a14;
    unint64_t v46 = 0xF000000000000000;
    uint64_t v47 = 0;
    if (a9) {
      goto LABEL_6;
    }
  }
  uint64_t v41 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v24, 1, 1, v41);
LABEL_9:
  if (a10)
  {
    uint64_t v42 = sub_1A709D198();
    unint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    unint64_t v44 = 0xF000000000000000;
  }
  return (MSReviewedPlace *)ReviewedPlace.init(store:hasUserReviewed:lastSuggestedReviewDate:latitude:longitude:mapItemIdComparableRepresentation:mapItemLastRefreshed:mapItemStorage:muid:positionIndex:rating:resultProviderIdentifier:uploadedPhotosCount:version:)(v50, v52, (uint64_t)v26, v49, v48, v47, v46, (unint64_t)v24, v42, v44, a11, a12, a13, v51, a15, a16);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedReviewedPlace();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6FCE490(v6, a4);
}

- (BOOL)hasUserReviewed
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__hasUserReviewed);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setHasUserReviewed:(BOOL)a3
{
  char v4 = self;
  sub_1A6FCEBD8(a3);
}

- (NSDate)lastSuggestedReviewDate
{
  return (NSDate *)sub_1A6FD0354(self, (uint64_t)a2, (void (*)(void))sub_1A6FCEEA0);
}

- (void)setLastSuggestedReviewDate:(id)a3
{
}

- (NSNumber)latitude
{
  v2 = self;
  v3 = (void *)sub_1A6FCF6A8();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6FD435C(a3);
}

- (NSNumber)longitude
{
  v2 = self;
  v3 = (void *)sub_1A6FCFB00();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6FD4548(a3);
}

- (NSData)mapItemIdComparableRepresentation
{
  return (NSData *)sub_1A6FD12E0(self, (uint64_t)a2, sub_1A6FCFF2C);
}

- (void)setMapItemIdComparableRepresentation:(id)a3
{
}

- (NSDate)mapItemLastRefreshed
{
  return (NSDate *)sub_1A6FD0354(self, (uint64_t)a2, (void (*)(void))sub_1A6FD0480);
}

- (void)setMapItemLastRefreshed:(id)a3
{
}

- (NSData)mapItemStorage
{
  return (NSData *)sub_1A6FD12E0(self, (uint64_t)a2, sub_1A6FD136C);
}

- (void)setMapItemStorage:(id)a3
{
}

- (unint64_t)muid
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unint64_t v4 = *(unint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__muid);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setMuid:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_1A6FD1C14(a3);
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6FD1F74(a3);
}

- (NSNumber)rating
{
  v2 = self;
  v3 = (void *)sub_1A6FD2270();

  return (NSNumber *)v3;
}

- (void)setRating:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6FD4D94(a3);
}

- (NSNumber)resultProviderIdentifier
{
  v2 = self;
  v3 = (void *)sub_1A6FD26C8();

  return (NSNumber *)v3;
}

- (void)setResultProviderIdentifier:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6FD4FC0(a3);
}

- (int)uploadedPhotosCount
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int v4 = *(_DWORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__uploadedPhotosCount);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setUploadedPhotosCount:(int)a3
{
  int v4 = self;
  sub_1A6FD2D88(a3);
}

- (signed)version
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  signed __int16 v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__version);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setVersion:(signed __int16)a3
{
  signed __int16 v4 = self;
  sub_1A6FD3150(a3);
}

- (MSAnonymousCredential)anonymousCredential
{
  v2 = self;
  v3 = (void *)sub_1A6FD3444();

  return (MSAnonymousCredential *)v3;
}

- (void)setAnonymousCredential:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1A6FD36A4(a3);
}

- (MSCommunityID)communityID
{
  v2 = self;
  v3 = (void *)sub_1A6FD37A8();

  return (MSCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1A6FD3A70(a3);
}

- (MSReviewedPlace)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSReviewedPlace *)sub_1A6FD3C68(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSReviewedPlace__lastSuggestedReviewDate);

  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSReviewedPlace__mapItemIdComparableRepresentation), *(void *)&self->super._store[OBJC_IVAR___MSReviewedPlace__mapItemIdComparableRepresentation]);
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSReviewedPlace__mapItemLastRefreshed);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSReviewedPlace__mapItemStorage), *(void *)&self->super._store[OBJC_IVAR___MSReviewedPlace__mapItemStorage]);

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSReviewedPlace__resultProviderIdentifier);
}

+ (id)strippedMapItemWith:(id)a3
{
  signed __int16 v4 = self;
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