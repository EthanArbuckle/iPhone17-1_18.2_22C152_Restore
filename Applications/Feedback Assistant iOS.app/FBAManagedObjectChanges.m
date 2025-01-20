@interface FBAManagedObjectChanges
- (BOOL)invalidatedAllObjects;
- (NSManagedObjectContext)managedObjectContext;
- (NSSet)deletedObjects;
- (NSSet)insertedObjects;
- (NSSet)invalidatedObjects;
- (NSSet)refreshedObjects;
- (NSSet)updatedObjects;
- (_TtC18Feedback_Assistant23FBAManagedObjectChanges)init;
@end

@implementation FBAManagedObjectChanges

- (NSSet)insertedObjects
{
  return (NSSet *)sub_10009810C(self);
}

- (NSSet)updatedObjects
{
  return (NSSet *)sub_10009810C(self);
}

- (NSSet)deletedObjects
{
  return (NSSet *)sub_10009810C(self);
}

- (NSSet)refreshedObjects
{
  return (NSSet *)sub_10009810C(self);
}

- (NSSet)invalidatedObjects
{
  return (NSSet *)sub_10009810C(self);
}

- (BOOL)invalidatedAllObjects
{
  v2 = self;
  char v3 = sub_100098214();

  return v3 & 1;
}

- (NSManagedObjectContext)managedObjectContext
{
  v2 = self;
  char v3 = (void *)sub_100098374();

  return (NSManagedObjectContext *)v3;
}

- (_TtC18Feedback_Assistant23FBAManagedObjectChanges)init
{
  result = (_TtC18Feedback_Assistant23FBAManagedObjectChanges *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18Feedback_Assistant23FBAManagedObjectChanges_notification;
  uint64_t v3 = type metadata accessor for Notification();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end