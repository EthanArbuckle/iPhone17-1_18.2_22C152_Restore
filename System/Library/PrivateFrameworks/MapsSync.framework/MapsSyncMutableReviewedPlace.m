@interface MapsSyncMutableReviewedPlace
- (BOOL)hasUserReviewed;
- (NSDate)lastSuggestedReviewDate;
- (NSNumber)rating;
- (_TtC8MapsSync19MapsSyncCommunityID)communityID;
- (_TtC8MapsSync27MapsSyncAnonymousCredential)anonymousCredential;
- (_TtC8MapsSync28MapsSyncMutableReviewedPlace)initWithProxyObject:(id)a3;
- (int)uploadedPhotosCount;
- (signed)version;
- (unint64_t)muid;
- (void)setAnonymousCredential:(id)a3;
- (void)setCommunityID:(id)a3;
- (void)setHasUserReviewed:(BOOL)a3;
- (void)setLastSuggestedReviewDate:(id)a3;
- (void)setMapItemIdentifier:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setRating:(id)a3;
- (void)setUploadedPhotosCount:(int)a3;
- (void)setVersion:(signed __int16)a3;
@end

@implementation MapsSyncMutableReviewedPlace

- (_TtC8MapsSync28MapsSyncMutableReviewedPlace)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedReviewedPlace();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
}

- (NSDate)lastSuggestedReviewDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject);
  v10 = self;
  id v11 = objc_msgSend(v9, sel_lastSuggestedReviewDate);
  if (v11)
  {
    v12 = v11;
    sub_1A709D1D8();

    uint64_t v13 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A6F0EF6C((uint64_t)v6, (uint64_t)v8);

  sub_1A709D1F8();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (void)setLastSuggestedReviewDate:(id)a3
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
  sub_1A7078B78((uint64_t)v7);
}

- (BOOL)hasUserReviewed
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_hasUserReviewed);
}

- (void)setHasUserReviewed:(BOOL)a3
{
}

- (NSNumber)rating
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_rating);
  return (NSNumber *)v2;
}

- (void)setRating:(id)a3
{
}

- (int)uploadedPhotosCount
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_uploadedPhotosCount);
}

- (void)setUploadedPhotosCount:(int)a3
{
}

- (signed)version
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_version);
}

- (void)setVersion:(signed __int16)a3
{
}

- (void)setMapItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A70796C8(v4);
}

- (_TtC8MapsSync27MapsSyncAnonymousCredential)anonymousCredential
{
  id v2 = self;
  id v3 = sub_1A707997C();

  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)v3;
}

- (void)setAnonymousCredential:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1A7079B04((char *)a3);
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityID
{
  id v2 = self;
  id v3 = sub_1A7079C1C();

  return (_TtC8MapsSync19MapsSyncCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1A7079D48((char *)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject));
}

@end