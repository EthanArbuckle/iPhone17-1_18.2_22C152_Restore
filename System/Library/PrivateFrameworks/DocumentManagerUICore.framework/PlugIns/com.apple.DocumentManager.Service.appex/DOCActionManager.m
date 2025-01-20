@interface DOCActionManager
+ (BOOL)canCreateNewFolderIn:(id)a3;
+ (BOOL)canImportIn:(id)a3;
+ (BOOL)canMove:(id)a3 to:(id)a4;
+ (BOOL)canShowInfoIn:(id)a3;
- (NSArray)actions;
- (NSArray)associatedActionManagers;
- (NSArray)forbiddenActionIdentifiers;
- (_TtC33com_apple_DocumentManager_Service16DOCActionManager)init;
- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5;
- (void)setActions:(id)a3;
- (void)setAssociatedActionManagers:(id)a3;
- (void)setForbiddenActionIdentifiers:(id)a3;
@end

@implementation DOCActionManager

- (NSArray)forbiddenActionIdentifiers
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_forbiddenActionIdentifiers) = (Class)sub_1004CD5C0();
  swift_bridgeObjectRelease();
}

- (NSArray)associatedActionManagers
{
  type metadata accessor for DOCActionManager();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setAssociatedActionManagers:(id)a3
{
  type metadata accessor for DOCActionManager();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_associatedActionManagers) = (Class)sub_1004CD5C0();
  swift_bridgeObjectRelease();
}

- (NSArray)actions
{
  sub_10003AE74(0, &qword_10062FD10);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setActions:(id)a3
{
  sub_10003AE74(0, &qword_10062FD10);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_actions) = (Class)sub_1004CD5C0();
  swift_bridgeObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service16DOCActionManager)init
{
  uint64_t ObjectType = swift_getObjectType();
  id v3 = [self defaultManager];
  id v4 = [self defaultPermission];
  v5 = (_TtC33com_apple_DocumentManager_Service16DOCActionManager *)(*(uint64_t (**)(id, id))(ObjectType + 248))(v3, v4);
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_actionManagerDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_fpItemManager));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCActionManager_managedPermission);
}

+ (BOOL)canMove:(id)a3 to:(id)a4
{
  sub_100027178((uint64_t *)&unk_10062BE80);
  unint64_t v5 = sub_1004CD5C0();
  v6 = (void *)FPActionReparent;
  swift_unknownObjectRetain();
  char v7 = sub_1003D55AC(v6, v5);
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
    sub_100027178((uint64_t *)&unk_10062C9C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1004E5180;
    *(void *)(inited + 32) = a4;
    unint64_t v12 = inited;
    sub_1004CD5E0();
    swift_unknownObjectRetain();
    char v8 = sub_1003D55AC(v9, v12);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

+ (BOOL)canCreateNewFolderIn:(id)a3
{
  return sub_1003CBA6C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1003D5200);
}

+ (BOOL)canImportIn:(id)a3
{
  return sub_1003CBA6C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1003D516C);
}

+ (BOOL)canShowInfoIn:(id)a3
{
  return a3 != 0;
}

- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1004CD2F0();
  uint64_t v9 = v8;
  sub_10003AE74(0, &qword_1006360E0);
  unint64_t v10 = sub_1004CD5C0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  unint64_t v12 = self;
  DOCActionManager.perform(actionWithIdentifier:with:completionHandler:)(v7, v9, v10, (uint64_t)sub_100055C14, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end