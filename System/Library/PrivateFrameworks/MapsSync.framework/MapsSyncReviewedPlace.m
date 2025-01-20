@interface MapsSyncReviewedPlace
+ (id)fetchWithMuids:(id)a3;
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8;
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completionWithError:(id)a8;
+ (void)fetchWithMuids:(id)a3 completion:(id)a4;
- (BOOL)hasUserReviewed;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSDate)lastSuggestedReviewDate;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)rating;
- (NSNumber)resultProviderIdentifier;
- (NSString)description;
- (_TtC8MapsSync19MapsSyncCommunityID)communityId;
- (_TtC8MapsSync21MapsSyncReviewedPlace)init;
- (_TtC8MapsSync21MapsSyncReviewedPlace)initWithAnonymousCredential:(id)a3;
- (_TtC8MapsSync21MapsSyncReviewedPlace)initWithObject:(id)a3;
- (_TtC8MapsSync27MapsSyncAnonymousCredential)anonymousCredential;
- (int)uploadedPhotosCount;
- (signed)version;
- (unint64_t)muid;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncReviewedPlace

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A6F13990(a3, a4, (uint64_t)v14, a6, a7, (void (**)(void, void, void))v13);
  _Block_release(v13);
  sub_1A6F00364((uint64_t)v14);
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completionWithError:(id)a8
{
  v11 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  sub_1A6F143E0(a3, a4, (uint64_t)v13, 2, 0, sub_1A6F15374, v12);
  swift_release();
  sub_1A6F00364((uint64_t)v13);
}

+ (id)fetchWithMuids:(id)a3
{
  uint64_t v3 = sub_1A709D4D8();
  _s8MapsSync0aB13ReviewedPlaceC14fetchWithMuidsyACSgSays6UInt64VGFZ_0(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (void)fetchWithMuids:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_1A709D4D8();
  v6[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB66F6B8);
  v6[0] = v5;
  _Block_copy(v4);
  swift_bridgeObjectRetain();
  sub_1A6F13990(3uLL, 1, (uint64_t)v6, 2, 0, (void (**)(void, void, void))v4);
  _Block_release(v4);
  sub_1A6F00364((uint64_t)v6);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

- (_TtC8MapsSync21MapsSyncReviewedPlace)initWithAnonymousCredential:(id)a3
{
  return (_TtC8MapsSync21MapsSyncReviewedPlace *)MapsSyncReviewedPlace.init(anonymousCredential:)((uint64_t)a3);
}

- (_TtC8MapsSync21MapsSyncReviewedPlace)init
{
  return (_TtC8MapsSync21MapsSyncReviewedPlace *)MapsSyncReviewedPlace.init()();
}

- (_TtC8MapsSync21MapsSyncReviewedPlace)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync21MapsSyncReviewedPlace *)sub_1A7077260(a3);
}

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid);
}

- (NSNumber)resultProviderIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier));
}

- (NSNumber)rating
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating));
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude));
}

- (NSDate)lastSuggestedReviewDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
  swift_beginAccess();
  sub_1A6F235F8((uint64_t)v6, (uint64_t)v5, &qword_1EB670330);
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

- (BOOL)hasUserReviewed
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed);
}

- (int)uploadedPhotosCount
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount);
}

- (signed)version
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version);
}

- (_TtC8MapsSync27MapsSyncAnonymousCredential)anonymousCredential
{
  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)sub_1A7077834(self, (uint64_t)a2, (uint64_t)sub_1A70777E0, (uint64_t (*)(void))sub_1A6FC51F8, &OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential);
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityId
{
  return (_TtC8MapsSync19MapsSyncCommunityID *)sub_1A7077834(self, (uint64_t)a2, (uint64_t)sub_1A7077928, (uint64_t (*)(void))sub_1A6FC54A0, &OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A70779F8((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A7077CEC(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedReviewedPlace();
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
  uint64_t v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A7078100, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1A7078234();

  uint64_t v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate, &qword_1EB670330);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredentialUnstored));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId);
}

@end