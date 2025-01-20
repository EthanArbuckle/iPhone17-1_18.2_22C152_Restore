@interface MapsSyncBaseItem
+ (OS_dispatch_queue)_callbackQueue;
+ (OS_dispatch_queue)_queue;
- (BOOL)isDuplicateOfOther:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSDate)_createTime;
- (NSDate)_modificationTime;
- (NSDate)createTime;
- (NSDate)modificationTime;
- (NSManagedObjectContext)_readContext;
- (NSString)description;
- (NSUUID)_identifier;
- (NSUUID)identifier;
- (_TtC8MapsSync16MapsSyncBaseItem)init;
- (_TtC8MapsSync16MapsSyncBaseItem)initWithObject:(id)a3;
- (id)callCleanInObjc:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)mutableObject:(id)a3;
- (id)performEditsWithoutSavingWithCompletion:(id)a3;
- (id)validate;
- (int64_t)_positionIndex;
- (int64_t)positionIndex;
- (void)addEditWithBlock:(id)a3;
- (void)commitEditsWithCompletion:(id)a3;
- (void)deleteWithCompletion:(id)a3;
- (void)executeOnFirstSave:(id)a3;
- (void)persistObject:(id)a3 saveContext:(BOOL)a4 completion:(id)a5;
- (void)setPropertiesWithObject:(id)a3;
- (void)setReadContextWithContext:(id)a3;
- (void)set_createTime:(id)a3;
- (void)set_identifier:(id)a3;
- (void)set_modificationTime:(id)a3;
- (void)set_positionIndex:(int64_t)a3;
- (void)set_readContext:(id)a3;
@end

@implementation MapsSyncBaseItem

+ (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)sub_1A7019DA4((uint64_t)a1, (uint64_t)a2, &qword_1EB66F098, (void **)&qword_1EB671980);
}

+ (OS_dispatch_queue)_callbackQueue
{
  return (OS_dispatch_queue *)sub_1A7019DA4((uint64_t)a1, (uint64_t)a2, &qword_1E96E69D0, (void **)&qword_1E96EB360);
}

- (NSUUID)_identifier
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  sub_1A6F235F8((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1EB670A40);
  uint64_t v7 = sub_1A709D258();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A709D228();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (void)set_identifier:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A709D238();
    uint64_t v8 = sub_1A709D258();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1A709D258();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1A6FCD0AC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSDate)_createTime
{
  return (NSDate *)sub_1A701A09C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime);
}

- (void)set_createTime:(id)a3
{
}

- (NSDate)_modificationTime
{
  return (NSDate *)sub_1A701A09C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime);
}

- (void)set_modificationTime:(id)a3
{
}

- (int64_t)_positionIndex
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex);
}

- (void)set_positionIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex) = (Class)a3;
}

- (NSManagedObjectContext)_readContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext));
}

- (void)set_readContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext) = (Class)a3;
  id v3 = a3;
}

- (_TtC8MapsSync16MapsSyncBaseItem)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync16MapsSyncBaseItem *)sub_1A70198A0(a3);
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_1A7019374(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  id v4 = (void *)sub_1A709DCB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_TtC8MapsSync16MapsSyncBaseItem)init
{
  return [(MapsSyncBaseItem *)self initWithObject:0];
}

- (NSString)description
{
  v2 = self;
  sub_1A701A4F0();

  id v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isDuplicateOfOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1A7016220((uint64_t)v4);

  return self & 1;
}

- (NSUUID)identifier
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  sub_1A6F235F8((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1EB670A40);
  uint64_t v7 = sub_1A709D258();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_1A709D228();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (NSDate)createTime
{
  return (NSDate *)sub_1A701AB8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime);
}

- (NSDate)modificationTime
{
  return (NSDate *)sub_1A701AB8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime);
}

- (int64_t)positionIndex
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex);
}

- (void)executeOnFirstSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A701964C(v4);
}

- (void)setReadContextWithContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext) = (Class)a3;
  id v3 = a3;
}

- (void)persistObject:(id)a3 saveContext:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_1A701E974(v9, v5, v10, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)addEditWithBlock:(id)a3
{
}

- (void)commitEditsWithCompletion:(id)a3
{
}

- (id)performEditsWithoutSavingWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1A7016A84((uint64_t)sub_1A70202D8, v5);

  swift_release();
  return v7;
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
    uint64_t v5 = self;
  }
  char v6 = sub_1A701C010((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)deleteWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1A701F958(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (Class)managedObjectClass
{
  return (Class)self;
}

- (id)mutableObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = (void *)sub_1A70178DC(v4);

  return v6;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A7018C34(v4);
}

- (id)callCleanInObjc:(id)a3
{
  sub_1A709D438();
  id v4 = self;
  id v5 = sub_1A7017ADC();

  swift_bridgeObjectRelease();
  if (v5)
  {
    char v6 = (void *)sub_1A709D0C8();
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (id)validate
{
  v2 = self;
  if ([(MapsSyncBaseItem *)v2 respondsToSelector:sub_1A709D298()])
  {
    id v3 = sub_1A7017ADC();

    if (v3)
    {
      id v4 = (void *)sub_1A709D0C8();

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v4 = 0;
LABEL_6:
  return v4;
}

- (void).cxx_destruct
{
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier, (uint64_t *)&unk_1EB670A40);
  id v3 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime;
  uint64_t v4 = sub_1A709D1F8();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime, v4);
  swift_bridgeObjectRelease();

  char v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext);
}

@end