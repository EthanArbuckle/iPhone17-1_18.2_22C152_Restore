@interface DOCActionManager
+ (BOOL)canCreateNewFolderIn:(id)a3;
+ (BOOL)canImportIn:(id)a3;
+ (BOOL)canMove:(id)a3 to:(id)a4;
+ (BOOL)canShowInfoIn:(id)a3;
- (NSArray)actions;
- (NSArray)associatedActionManagers;
- (NSArray)forbiddenActionIdentifiers;
- (_TtC14RecentsAvocado16DOCActionManager)init;
- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5;
- (void)setActions:(id)a3;
- (void)setAssociatedActionManagers:(id)a3;
- (void)setForbiddenActionIdentifiers:(id)a3;
@end

@implementation DOCActionManager

- (NSArray)forbiddenActionIdentifiers
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCActionManager_forbiddenActionIdentifiers) = (Class)sub_1004CDE30();
  swift_bridgeObjectRelease();
}

- (NSArray)associatedActionManagers
{
  type metadata accessor for DOCActionManager();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setAssociatedActionManagers:(id)a3
{
  type metadata accessor for DOCActionManager();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCActionManager_associatedActionManagers) = (Class)sub_1004CDE30();
  swift_bridgeObjectRelease();
}

- (NSArray)actions
{
  sub_1000333C8(0, (unint64_t *)&unk_100629AD0);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setActions:(id)a3
{
  sub_1000333C8(0, (unint64_t *)&unk_100629AD0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCActionManager_actions) = (Class)sub_1004CDE30();
  swift_bridgeObjectRelease();
}

- (_TtC14RecentsAvocado16DOCActionManager)init
{
  uint64_t ObjectType = swift_getObjectType();
  id v3 = [self defaultManager];
  id v4 = [self defaultPermission];
  v5 = (_TtC14RecentsAvocado16DOCActionManager *)(*(uint64_t (**)(id, id))(ObjectType + 248))(v3, v4);
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado16DOCActionManager_actionManagerDelegate);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCActionManager_managedPermission);
}

+ (BOOL)canMove:(id)a3 to:(id)a4
{
  sub_100031648(&qword_1006274C0);
  unint64_t v5 = sub_1004CDE30();
  v6 = (void *)FPActionReparent;
  swift_unknownObjectRetain();
  char v7 = sub_1002213B4(v6, v5);
  char v8 = v7;
  if (a4)
  {
    if ((v7 & 1) == 0)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      char v8 = 0;
      return v8 & 1;
    }
    v9 = (void *)FPActionImportHere;
    sub_100031648(&qword_100628240);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1004E5710;
    *(void *)(inited + 32) = a4;
    unint64_t v12 = inited;
    sub_1004CDE50();
    swift_unknownObjectRetain();
    char v8 = sub_1002213B4(v9, v12);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

+ (BOOL)canCreateNewFolderIn:(id)a3
{
  return sub_100216CCC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100220E60);
}

+ (BOOL)canImportIn:(id)a3
{
  return sub_100216CCC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100220DCC);
}

+ (BOOL)canShowInfoIn:(id)a3
{
  return a3 != 0;
}

- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1004CDB50();
  uint64_t v9 = v8;
  sub_1000333C8(0, (unint64_t *)&unk_10062F740);
  unint64_t v10 = sub_1004CDE30();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  unint64_t v12 = self;
  DOCActionManager.perform(actionWithIdentifier:with:completionHandler:)(v7, v9, v10, (uint64_t)sub_10009FA28, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end