@interface MapsSyncStore
+ (_TtC8MapsSync13MapsSyncStore)sharedStore;
+ (id)withStoreWithConfig:(id)a3;
+ (void)withDefaultStoreWithBlock:(void *)aBlock;
- (BOOL)deleteWithObjects:(id)a3 error:(id *)a4;
- (BOOL)saveWithObjects:(id)a3 error:(id *)a4;
- (_TtC8MapsSync13MapsSyncStore)init;
- (_TtC8MapsSync13MapsSyncStore)initWithConfig:(id)a3;
- (_TtC8MapsSync19MapsSyncStoreConfig)config;
- (void)deleteWithObjects:(NSArray *)a3 completionHandler:(id)a4;
- (void)resetContainer;
- (void)saveWithObjects:(NSArray *)a3 completionHandler:(id)a4;
- (void)setConfig:(id)a3;
- (void)subscribe:(id)a3;
- (void)unsubscribe:(id)a3;
- (void)withManagedObjects:(id)a3 block:(id)a4;
@end

@implementation MapsSyncStore

+ (_TtC8MapsSync13MapsSyncStore)sharedStore
{
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB670750;
  return (_TtC8MapsSync13MapsSyncStore *)v2;
}

- (_TtC8MapsSync19MapsSyncStoreConfig)config
{
  return (_TtC8MapsSync19MapsSyncStoreConfig *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config));
}

- (void)setConfig:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config) = (Class)a3;
  id v3 = a3;
}

+ (id)withStoreWithConfig:(id)a3
{
  id v4 = (objc_class *)type metadata accessor for MapsSyncStore();
  v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = OBJC_IVAR____TtC8MapsSync13MapsSyncStore_containerInstanceLock;
  id v7 = objc_allocWithZone(MEMORY[0x1E4F28E08]);
  id v8 = a3;
  v9 = v5;
  *(void *)&v5[v6] = objc_msgSend(v7, sel_init);
  *(void *)&v9[OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config] = v8;
  id v10 = v8;

  v13.receiver = v9;
  v13.super_class = v4;
  id v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

+ (void)withDefaultStoreWithBlock:(void *)aBlock
{
  id v3 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  v3[2](v3, qword_1EB670750, 0);
  _Block_release(v3);
}

- (_TtC8MapsSync13MapsSyncStore)initWithConfig:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8MapsSync13MapsSyncStore_containerInstanceLock;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F28E08]);
  id v7 = (objc_class *)a3;
  id v8 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config) = v7;
  v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for MapsSyncStore();
  id v10 = [(MapsSyncStore *)&v12 init];

  return v10;
}

- (void)resetContainer
{
  uint64_t v2 = qword_1EB6709F8;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (void *)sub_1A6F8C370(MEMORY[0x1E4FBC860]);
  swift_beginAccess();
  off_1EB6709F0 = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)saveWithObjects:(id)a3 error:(id *)a4
{
  return sub_1A6F863A0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1A6F85814);
}

- (BOOL)deleteWithObjects:(id)a3 error:(id *)a4
{
  return sub_1A6F863A0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1A6F85E30);
}

- (void)saveWithObjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  objc_super v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96E7BB0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96E7BB8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A709B8A0((uint64_t)v9, (uint64_t)&unk_1E96E7BC0, (uint64_t)v14);
  swift_release();
}

- (void)deleteWithObjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  objc_super v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96E7BA0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96E72B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A709B8A0((uint64_t)v9, (uint64_t)&unk_1E96E7178, (uint64_t)v14);
  swift_release();
}

- (void)withManagedObjects:(id)a3 block:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  type metadata accessor for MapsSyncObject();
  unint64_t v6 = sub_1A709D4D8();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_1A6F8D358(v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)subscribe:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1A6F8BD30((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)unsubscribe:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1A6F85198();
  sub_1A6F56910((uint64_t)a3);
  swift_release();
  sub_1A6F851A4();
  sub_1A6F56910((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC8MapsSync13MapsSyncStore)init
{
  result = (_TtC8MapsSync13MapsSyncStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_containerInstanceLock);
}

@end