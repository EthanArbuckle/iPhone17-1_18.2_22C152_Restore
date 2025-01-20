@interface MapsSyncObject
+ (Class)managedClass;
+ (id)findDuplicatesWithContext:(id)a3;
+ (id)mergeWithDuplicates:(id)a3;
+ (id)strippedMapItemWith:(id)a3;
- (BOOL)hasChanges;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStored;
- (BOOL)lazyLoad;
- (NSDate)createTime;
- (NSDate)modificationTime;
- (NSLock)propertyLock;
- (NSManagedObjectID)managedId;
- (NSString)description;
- (NSUUID)identifier;
- (_TtC8MapsSync13MapsSyncStore)store;
- (_TtC8MapsSync14MapsSyncObject)init;
- (_TtC8MapsSync14MapsSyncObject)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (_TtC8MapsSync14MapsSyncObject)initWithStore:(id)a3;
- (id)getManagedObjectOnContextWithLock:(id)a3 context:(id)a4;
- (id)getManagedObjectWithContext:(id)a3;
- (id)onDeleteWithManagedObject:(id)a3 context:(id)a4;
- (int64_t)hash;
- (void)addEdit:(id)a3 :(id)a4;
- (void)flushChanges;
- (void)performEditsOnContextWithLock:(id)a3 managedObject:(id)a4;
- (void)performEditsWithManagedObject:(id)a3;
- (void)setCreateTime:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setManagedId:(id)a3;
- (void)setModificationTime:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)withPropertyLock:(id)a3;
@end

@implementation MapsSyncObject

- (BOOL)lazyLoad
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad);
}

- (_TtC8MapsSync14MapsSyncObject)init
{
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EB670750;
  return [(MapsSyncObject *)self initWithObject:0 store:v3 lazyLoad:0];
}

- (_TtC8MapsSync14MapsSyncObject)initWithStore:(id)a3
{
  return [(MapsSyncObject *)self initWithObject:0 store:a3 lazyLoad:0];
}

- (_TtC8MapsSync14MapsSyncObject)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (_TtC8MapsSync14MapsSyncObject *)sub_1A6FBFBA0(a3, a4, v5);
}

- (NSLock)propertyLock
{
  return (NSLock *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock));
}

- (void)flushChanges
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  void *v2 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
}

- (id)onDeleteWithManagedObject:(id)a3 context:(id)a4
{
  sub_1A6EE80D0(0, (unint64_t *)&unk_1EB670260);
  v4 = (void *)sub_1A709D4C8();
  return v4;
}

- (NSManagedObjectID)managedId
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  id v4 = *(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  objc_msgSend(v2, sel_unlock);

  return (NSManagedObjectID *)v4;
}

- (void)setManagedId:(id)a3
{
  BOOL v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v6 = a3;
  v7 = self;
  objc_msgSend(v5, sel_lock);
  id v8 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId) = (Class)a3;
  id v9 = v6;

  objc_msgSend(v5, sel_unlock);
}

- (BOOL)isStored
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  id v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  id v5 = v4;
  objc_msgSend(v2, sel_unlock);

  if (v4) {
  return v4 != 0;
  }
}

- (_TtC8MapsSync13MapsSyncStore)store
{
  return (_TtC8MapsSync13MapsSyncStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store));
}

- (BOOL)hasChanges
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  id v4 = (char *)v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks;
  swift_beginAccess();
  LOBYTE(v4) = *(void *)(*(void *)v4 + 16) != 0;
  objc_msgSend(v2, sel_unlock);

  return (char)v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_1A6FC07F8((char *)self, (uint64_t)a2, (uint64_t *)&unk_1EB670A40, &OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier, MEMORY[0x1E4F27990], MEMORY[0x1E4F27980]);
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)createTime
{
  return (NSDate *)sub_1A6FC07F8((char *)self, (uint64_t)a2, &qword_1EB670330, &OBJC_IVAR____TtC8MapsSync14MapsSyncObject__createTime, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (void)setCreateTime:(id)a3
{
}

- (NSDate)modificationTime
{
  return (NSDate *)sub_1A6FC07F8((char *)self, (uint64_t)a2, &qword_1EB670330, &OBJC_IVAR____TtC8MapsSync14MapsSyncObject__modificationTime, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (void)setModificationTime:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = sub_1A6FC0E58((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  id v3 = sub_1A6FC10DC();

  return (int64_t)v3;
}

- (void)withPropertyLock:(id)a3
{
  id v4 = (void (**)(void *, void *))_Block_copy(a3);
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  char v6 = self;
  objc_msgSend(v5, sel_lock);
  v4[2](v4, v5);
  objc_msgSend(v5, sel_unlock);
  _Block_release(v4);
}

- (void)addEdit:(id)a3 :(id)a4
{
  char v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  sub_1A6FBEFF8((uint64_t)v8, (uint64_t)sub_1A6F022EC, v7);

  swift_release();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5 = a3;
  char v6 = self;
  sub_1A6FC1F80(v5);
}

+ (Class)managedClass
{
  return (Class)self;
}

- (id)getManagedObjectWithContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v5 = a3;
  char v6 = self;
  objc_msgSend(v4, sel_lock);
  id v7 = sub_1A6FBF144((uint64_t)v4, v5);
  objc_msgSend(v4, sel_unlock);

  return v7;
}

- (id)getManagedObjectOnContextWithLock:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1A6FBF144((uint64_t)v6, v7);

  return v9;
}

- (void)performEditsWithManagedObject:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v5 = a3;
  id v6 = self;
  objc_msgSend(v4, sel_lock);
  sub_1A6FBF408((uint64_t)v4, (uint64_t)v5);
  objc_msgSend(v4, sel_unlock);
}

- (void)performEditsOnContextWithLock:(id)a3 managedObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1A6FBF408((uint64_t)v6, (uint64_t)v7);
}

- (NSString)description
{
  v2 = self;
  sub_1A6FC15E4();

  id v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier, (uint64_t *)&unk_1EB670A40);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__createTime, &qword_1EB670330);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__modificationTime, &qword_1EB670330);
}

+ (id)mergeWithDuplicates:(id)a3
{
  sub_1A6EE80D0(0, (unint64_t *)&unk_1EB670260);
  uint64_t v3 = sub_1A709D4D8();
  id v4 = (void *)sub_1A70048D8(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)strippedMapItemWith:(id)a3
{
  return a3;
}

+ (id)findDuplicatesWithContext:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1A70019C4(v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670670);
  id v5 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v5;
}

@end