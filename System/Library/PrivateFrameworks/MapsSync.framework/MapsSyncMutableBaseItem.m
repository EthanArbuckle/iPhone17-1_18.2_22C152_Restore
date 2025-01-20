@interface MapsSyncMutableBaseItem
- (NSDate)createTime;
- (NSManagedObject)proxyObject;
- (NSManagedObjectContext)context;
- (NSUUID)identifier;
- (_TtC8MapsSync23MapsSyncMutableBaseItem)init;
- (_TtC8MapsSync23MapsSyncMutableBaseItem)initWithProxyObject:(id)a3;
- (int64_t)positionIndex;
- (void)setCreateTime:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
@end

@implementation MapsSyncMutableBaseItem

- (_TtC8MapsSync23MapsSyncMutableBaseItem)initWithProxyObject:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v4 = a3;
  return [(MapsSyncMutableBaseItem *)&v6 init];
}

- (NSManagedObjectContext)context
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  v3 = self;
  result = (NSManagedObjectContext *)objc_msgSend(v2, sel_managedObjectContext);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSManagedObject)proxyObject
{
  return (NSManagedObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject));
}

- (NSUUID)identifier
{
  uint64_t v3 = sub_1A709D258();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  objc_super v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1A7017C20((uint64_t)v6);

  v8 = (void *)sub_1A709D228();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_1A709D258();
  MEMORY[0x1F4188790](v4 - 8);
  objc_super v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D238();
  v7 = self;
  sub_1A7017DD0((uint64_t)v6);
}

- (NSDate)createTime
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  objc_super v6 = v15;
  sub_1A6EE80D0(0, (unint64_t *)&unk_1EB670260);
  v7 = self;
  id v8 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670250);
  swift_dynamicCast();
  uint64_t v9 = v17;
  uint64_t v10 = v18;
  __swift_project_boxed_opaque_existential_0(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);

  uint64_t v11 = sub_1A709D1F8();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSDate *)v13;
}

- (void)setCreateTime:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  uint64_t v10 = self;
  sub_1A70184B8((uint64_t)v7);
}

- (int64_t)positionIndex
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  sub_1A6EE80D0(0, (unint64_t *)&unk_1EB670260);
  uint64_t v4 = self;
  id v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670250);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_0(v10, v11);
  int64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 80))(v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

  return v8;
}

- (void)setPositionIndex:(int64_t)a3
{
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  sub_1A6EE80D0(0, (unint64_t *)&unk_1EB670260);
  uint64_t v6 = self;
  id v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670250);
  swift_dynamicCast();
  uint64_t v8 = v11;
  uint64_t v9 = v12;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  (*(void (**)(int64_t, uint64_t, uint64_t))(v9 + 88))(a3, v8, v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
}

- (_TtC8MapsSync23MapsSyncMutableBaseItem)init
{
  result = (_TtC8MapsSync23MapsSyncMutableBaseItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end