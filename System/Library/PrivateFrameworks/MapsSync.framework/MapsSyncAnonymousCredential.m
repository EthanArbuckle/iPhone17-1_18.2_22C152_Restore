@interface MapsSyncAnonymousCredential
+ (_TtC8MapsSync27MapsSyncAnonymousCredential)fetchLatestAnonymousCredential;
+ (id)fetchWithAnonymousId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSData)anonymousId;
- (NSData)mapsToken;
- (NSDate)mapsTokenCreatedAt;
- (NSSet)_reviewedPlacesUnstored;
- (NSSet)reviewedPlaces;
- (NSString)description;
- (_TtC8MapsSync27MapsSyncAnonymousCredential)initWithObject:(id)a3;
- (unint64_t)mapsTokenTTL;
- (void)addEditWithBlock:(id)a3;
- (void)executeOnFirstSave:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
- (void)set_reviewedPlacesUnstored:(id)a3;
@end

@implementation MapsSyncAnonymousCredential

- (NSSet)_reviewedPlacesUnstored
{
  type metadata accessor for MapsSyncReviewedPlace();
  sub_1A7051AC8((unint64_t *)&unk_1E96E89D0, (void (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A709D618();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)set_reviewedPlacesUnstored:(id)a3
{
  type metadata accessor for MapsSyncReviewedPlace();
  sub_1A7051AC8((unint64_t *)&unk_1E96E89D0, (void (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored) = (Class)sub_1A709D648();
  swift_bridgeObjectRelease();
}

+ (_TtC8MapsSync27MapsSyncAnonymousCredential)fetchLatestAnonymousCredential
{
  _s8MapsSync0aB19AnonymousCredentialC011fetchLatestcD0ACSgvgZ_0();
  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)v2;
}

+ (id)fetchWithAnonymousId:(id)a3
{
  id v3 = a3;
  _s8MapsSync0aB19AnonymousCredentialC09fetchWithC2IdyACSgSo6NSDataCFZ_0(v3);
  v5 = v4;

  return v5;
}

- (NSData)anonymousId
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId);
}

- (NSData)mapsToken
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken);
}

- (NSDate)mapsTokenCreatedAt
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt;
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

- (unint64_t)mapsTokenTTL
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL);
}

- (NSSet)reviewedPlaces
{
  v2 = self;
  uint64_t v3 = sub_1A6FC4F50((uint64_t)v2, (uint64_t)sub_1A704DEDC, 0);
  uint64_t v4 = OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces) = (Class)v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncReviewedPlace();
    sub_1A7051AC8((unint64_t *)&unk_1E96E89D0, (void (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace);
    v6 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
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
  char v6 = sub_1A704DFDC((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)executeOnFirstSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A704E348(v4);
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A704EE58(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedAnonymousCredential();
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
  sub_1A7019234((uint64_t)sub_1A7051464, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1A704F314();

  uint64_t v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8MapsSync27MapsSyncAnonymousCredential)initWithObject:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken) = xmmword_1A70A4EA0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt;
  uint64_t v6 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored) = (Class)MEMORY[0x1E4FBC870];
  id v7 = a3;
  return (_TtC8MapsSync27MapsSyncAnonymousCredential *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken]);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt, &qword_1EB670330);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end