@interface MSCommunityID
+ (Class)managedClass;
- (BOOL)expired;
- (MSCommunityID)initWithCommunityIdentifier:(id)a3 expired:(BOOL)a4 positionIndex:(int64_t)a5 usedCount:(int64_t)a6;
- (MSCommunityID)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCommunityID)initWithStore:(id)a3 communityIdentifier:(id)a4 expired:(BOOL)a5 positionIndex:(int64_t)a6 usedCount:(int64_t)a7;
- (NSString)communityIdentifier;
- (id)fetchRapRecords;
- (id)fetchReviewedPlaces;
- (int64_t)positionIndex;
- (int64_t)usedCount;
- (void)addRapRecord:(id)a3;
- (void)addReviewedPlace:(id)a3;
- (void)flushChanges;
- (void)removeRapRecord:(id)a3;
- (void)removeReviewedPlace:(id)a3;
- (void)setCommunityIdentifier:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setUsedCount:(int64_t)a3;
@end

@implementation MSCommunityID

- (MSCommunityID)initWithCommunityIdentifier:(id)a3 expired:(BOOL)a4 positionIndex:(int64_t)a5 usedCount:(int64_t)a6
{
  BOOL v8 = a4;
  if (a3)
  {
    sub_1A709D438();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1EB670750;
  if (v11)
  {
    v13 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = [(MSCommunityID *)self initWithStore:v12 communityIdentifier:v13 expired:v8 positionIndex:a5 usedCount:a6];

  return v14;
}

- (MSCommunityID)initWithStore:(id)a3 communityIdentifier:(id)a4 expired:(BOOL)a5 positionIndex:(int64_t)a6 usedCount:(int64_t)a7
{
  if (a4)
  {
    uint64_t v11 = sub_1A709D438();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  v14 = sub_1A6FB0AA0(a3, v11, v13, a5, a6, a7);
  swift_bridgeObjectRelease();
  return (MSCommunityID *)v14;
}

- (void)flushChanges
{
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  void *v3 = MEMORY[0x1E4FBC860];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCommunityID__rapRecordChanges);
  swift_beginAccess();
  void *v6 = v4;
  swift_bridgeObjectRelease();
  v7 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCommunityID__reviewedPlaceChanges);
  swift_beginAccess();
  void *v7 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCommunityID();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6FADC74(v6, a4);
}

- (NSString)communityIdentifier
{
  v2 = self;
  sub_1A6FADE6C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setCommunityIdentifier:(id)a3
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
  v7 = self;
  sub_1A6FB0D44(v4, v6);

  swift_bridgeObjectRelease();
}

- (BOOL)expired
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.super.isa + OBJC_IVAR___MSCommunityID__expired);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setExpired:(BOOL)a3
{
  char v4 = self;
  sub_1A6FAE654(a3);
}

- (int64_t)positionIndex
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCommunityID__positionIndex);
}

- (void)setPositionIndex:(int64_t)a3
{
  char v4 = self;
  sub_1A6FAE970(a3);
}

- (int64_t)usedCount
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCommunityID__usedCount);
}

- (void)setUsedCount:(int64_t)a3
{
  char v4 = self;
  sub_1A6FAEC24(a3);
}

- (id)fetchRapRecords
{
  return sub_1A6FB0248(self, (uint64_t)a2, (void (*)(void))sub_1A6FAEEDC, (void (*)(void))type metadata accessor for RAPRecord);
}

- (void)addRapRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FAF7E4(v4, 0, (uint64_t)sub_1A6FAF69C, 0);
}

- (void)removeRapRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FAF7E4(v4, 1, (uint64_t)sub_1A6FAF750, 0);
}

- (id)fetchReviewedPlaces
{
  return sub_1A6FB0248(self, (uint64_t)a2, (void (*)(void))sub_1A6FAFA68, (void (*)(void))type metadata accessor for ReviewedPlace);
}

- (void)addReviewedPlace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FB040C(v4, 0, (uint64_t)sub_1A6FAB7D0, 0);
}

- (void)removeReviewedPlace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FB040C(v4, 1, (uint64_t)sub_1A6FAB884, 0);
}

- (MSCommunityID)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__communityIdentifier);
  *BOOL v8 = 0;
  v8[1] = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__expired) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__usedCount) = 0;
  v9 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__rapRecordChanges) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCommunityID__reviewedPlaceChanges) = v9;
  id v10 = a3;
  return (MSCommunityID *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end