@interface DOCLazyActionManager
- (NSArray)actions;
- (_TtC33com_apple_DocumentManager_Service20DOCLazyActionManager)initWithActionsConstructor:(id)a3;
- (void)setActions:(id)a3;
@end

@implementation DOCLazyActionManager

- (_TtC33com_apple_DocumentManager_Service20DOCLazyActionManager)initWithActionsConstructor:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service20DOCLazyActionManager____lazy_storage____lazyActions) = 0;
  v6 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR____TtC33com_apple_DocumentManager_Service20DOCLazyActionManager_actionsClosure);
  *v6 = sub_1003DC490;
  v6[1] = (uint64_t (*)())v5;
  v7 = self;
  swift_retain();
  v8 = (objc_class *)[v7 defaultManager];
  v9 = (objc_class *)[self defaultPermission];
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_forbiddenActionIdentifiers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_associatedActionManagers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_actions) = (Class)_swiftEmptyArrayStorage;
  *(void *)&self->super.forbiddenActionIdentifiers[OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_actionManagerDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_fpItemManager) = v8;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_managedPermission) = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCActionManager();
  v10 = [(DOCActionManager *)&v12 init];
  swift_release();
  return v10;
}

- (NSArray)actions
{
  v2 = self;
  sub_1003CE678();

  sub_10003AE74(0, &qword_10062FD10);
  v3.super.isa = sub_1004CD5A0().super.isa;
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