@interface DOCLazyActionManager
- (NSArray)actions;
- (_TtC18DocumentAppIntents20DOCLazyActionManager)initWithActionsConstructor:(id)a3;
- (void)setActions:(id)a3;
@end

@implementation DOCLazyActionManager

- (_TtC18DocumentAppIntents20DOCLazyActionManager)initWithActionsConstructor:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents20DOCLazyActionManager____lazy_storage____lazyActions) = 0;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC18DocumentAppIntents20DOCLazyActionManager_actionsClosure);
  *v6 = sub_1002348A0;
  v6[1] = (uint64_t (*)())v5;
  v7 = self;
  swift_retain();
  v8 = (objc_class *)[v7 defaultManager];
  v9 = (objc_class *)[self defaultPermission];
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents16DOCActionManager_forbiddenActionIdentifiers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents16DOCActionManager_associatedActionManagers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCActionManager_actions) = (Class)_swiftEmptyArrayStorage;
  *(void *)&self->super.forbiddenActionIdentifiers[OBJC_IVAR____TtC18DocumentAppIntents16DOCActionManager_actionManagerDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCActionManager_fpItemManager) = v8;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCActionManager_managedPermission) = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCActionManager();
  v10 = [(DOCActionManager *)&v12 init];
  swift_release();
  return v10;
}

- (NSArray)actions
{
  v2 = self;
  sub_100221ECC();

  sub_100032070(0, (unint64_t *)&unk_1006593A0);
  v3.super.isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end