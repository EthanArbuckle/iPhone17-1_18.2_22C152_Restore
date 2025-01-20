@interface MockNSPersistentHistoryChange
- (NSDictionary)tombstone;
- (NSManagedObjectID)changedObjectID;
- (NSSet)updatedProperties;
- (NSString)description;
- (_TtC11HomeKitCore29MockNSPersistentHistoryChange)init;
- (int64_t)changeID;
- (int64_t)changeType;
@end

@implementation MockNSPersistentHistoryChange

- (int64_t)changeID
{
  if (self->mockChangeID[OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeID]) {
    return 0;
  }
  else {
    return *(int64_t *)((char *)&self->super.super.isa
  }
                             + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeID);
}

- (NSDictionary)tombstone
{
  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockTombstone))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_236DB9980();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (int64_t)changeType
{
  if (self->mockChangeID[OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeType]) {
    return 0;
  }
  else {
    return *(int64_t *)((char *)&self->super.super.isa
  }
                             + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeType);
}

- (NSManagedObjectID)changedObjectID
{
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangedObjectID);
  if (v3)
  {
    v4 = self;
    id v5 = v3;
  }
  else
  {
    id v6 = objc_allocWithZone(MEMORY[0x263EFF290]);
    v7 = self;
    id v5 = objc_msgSend(v6, sel_init);
  }
  id v8 = v3;

  return (NSManagedObjectID *)v5;
}

- (NSSet)updatedProperties
{
  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockUpdatedProperties))
  {
    sub_236D899F4();
    sub_236D745C8();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_236DB9E00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (_TtC11HomeKitCore29MockNSPersistentHistoryChange)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeID;
  *(void *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockTombstone) = 0;
  id v5 = (char *)self + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangeType;
  *(void *)id v5 = 0;
  v5[8] = 1;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangedObjectID) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockUpdatedProperties) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MockNSPersistentHistoryChange *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11HomeKitCore29MockNSPersistentHistoryChange_mockChangedObjectID));
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = (void *)sub_236DB9A00();
  return (NSString *)v2;
}

@end