@interface MSAnonymousCredential
+ (Class)managedClass;
- (MSAnonymousCredential)initWithAnonymousId:(id)a3 mapsToken:(id)a4 mapsTokenCreatedAt:(id)a5 mapsTokenTTL:(int64_t)a6 positionIndex:(int64_t)a7;
- (MSAnonymousCredential)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSAnonymousCredential)initWithStore:(id)a3 anonymousId:(id)a4 mapsToken:(id)a5 mapsTokenCreatedAt:(id)a6 mapsTokenTTL:(int64_t)a7 positionIndex:(int64_t)a8;
- (NSData)anonymousId;
- (NSData)mapsToken;
- (NSDate)mapsTokenCreatedAt;
- (id)fetchReviewedPlaces;
- (int64_t)mapsTokenTTL;
- (int64_t)positionIndex;
- (void)addReviewedPlace:(id)a3;
- (void)flushChanges;
- (void)removeReviewedPlace:(id)a3;
- (void)setAnonymousId:(id)a3;
- (void)setMapsToken:(id)a3;
- (void)setMapsTokenCreatedAt:(id)a3;
- (void)setMapsTokenTTL:(int64_t)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
@end

@implementation MSAnonymousCredential

- (MSAnonymousCredential)initWithAnonymousId:(id)a3 mapsToken:(id)a4 mapsTokenCreatedAt:(id)a5 mapsTokenTTL:(int64_t)a6 positionIndex:(int64_t)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v12 - 8);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v15 = a4;
    id v16 = a5;
    id v17 = a3;
    a3 = (id)sub_1A709D198();
    unint64_t v19 = v18;

    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v20 = 0;
    unint64_t v22 = 0xF000000000000000;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v26 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v14, 1, 1, v26);
    goto LABEL_8;
  }
  id v24 = a4;
  id v25 = a5;
  unint64_t v19 = 0xF000000000000000;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v20 = sub_1A709D198();
  unint64_t v22 = v21;

  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  sub_1A709D1D8();

  uint64_t v23 = sub_1A709D1F8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v14, 0, 1, v23);
LABEL_8:
  v27 = (MSAnonymousCredential *)sub_1A6FAC0CC((uint64_t)a3, v19, v20, v22, (uint64_t)v14, a6, a7);
  sub_1A6EEF5F4(v20, v22);
  sub_1A6EEF5F4((uint64_t)a3, v19);
  return v27;
}

- (MSAnonymousCredential)initWithStore:(id)a3 anonymousId:(id)a4 mapsToken:(id)a5 mapsTokenCreatedAt:(id)a6 mapsTokenTTL:(int64_t)a7 positionIndex:(int64_t)a8
{
  uint64_t v33 = a8;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v16 = a3;
    id v17 = a5;
    id v18 = a6;
    id v19 = a4;
    uint64_t v20 = sub_1A709D198();
    unint64_t v22 = v21;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v23 = 0;
    unint64_t v25 = 0xF000000000000000;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v30 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v15, 1, 1, v30);
    return (MSAnonymousCredential *)AnonymousCredential.init(store:anonymousId:mapsToken:mapsTokenCreatedAt:mapsTokenTTL:positionIndex:)(a3, v20, v22, v23, v25, (uint64_t)v15, a7, v33);
  }
  id v27 = a3;
  id v28 = a5;
  id v29 = a6;
  uint64_t v20 = 0;
  unint64_t v22 = 0xF000000000000000;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v23 = sub_1A709D198();
  unint64_t v25 = v24;

  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  sub_1A709D1D8();

  uint64_t v26 = sub_1A709D1F8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v15, 0, 1, v26);
  return (MSAnonymousCredential *)AnonymousCredential.init(store:anonymousId:mapsToken:mapsTokenCreatedAt:mapsTokenTTL:positionIndex:)(a3, v20, v22, v23, v25, (uint64_t)v15, a7, v33);
}

- (void)flushChanges
{
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  void *v3 = MEMORY[0x1E4FBC860];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSAnonymousCredential__reviewedPlaceChanges);
  swift_beginAccess();
  void *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6FA8AD0(v6, a4);
}

- (NSData)anonymousId
{
  return (NSData *)sub_1A6FA92B0(self, (uint64_t)a2, sub_1A6FA8E88);
}

- (void)setAnonymousId:(id)a3
{
}

- (NSData)mapsToken
{
  return (NSData *)sub_1A6FA92B0(self, (uint64_t)a2, sub_1A6FA933C);
}

- (void)setMapsToken:(id)a3
{
}

- (NSDate)mapsTokenCreatedAt
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  sub_1A6FA9BF0((uint64_t)v5);

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

- (void)setMapsTokenCreatedAt:(id)a3
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
  sub_1A6FAA17C((uint64_t)v7);
}

- (int64_t)mapsTokenTTL
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSAnonymousCredential__mapsTokenTTL);
}

- (void)setMapsTokenTTL:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1A6FAAA5C(a3);
}

- (int64_t)positionIndex
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSAnonymousCredential__positionIndex);
}

- (void)setPositionIndex:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1A6FAAD10(a3);
}

- (id)fetchReviewedPlaces
{
  v2 = self;
  sub_1A6FAAFC8();

  type metadata accessor for ReviewedPlace();
  uint64_t v3 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addReviewedPlace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FAB918(v4, 0, (uint64_t)sub_1A6FAB7D0, 0);
}

- (void)removeReviewedPlace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FAB918(v4, 1, (uint64_t)sub_1A6FAB884, 0);
}

- (MSAnonymousCredential)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__anonymousId) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__mapsToken) = xmmword_1A70A4EA0;
  uint64_t v9 = (char *)self + OBJC_IVAR___MSAnonymousCredential__mapsTokenCreatedAt;
  uint64_t v10 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__mapsTokenTTL) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__reviewedPlaceChanges) = (Class)MEMORY[0x1E4FBC860];
  id v11 = a3;
  return (MSAnonymousCredential *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__anonymousId), *(void *)&self->super._store[OBJC_IVAR___MSAnonymousCredential__anonymousId]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnonymousCredential__mapsToken), *(void *)&self->super._store[OBJC_IVAR___MSAnonymousCredential__mapsToken]);
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSAnonymousCredential__mapsTokenCreatedAt);
  swift_bridgeObjectRelease();
}

@end