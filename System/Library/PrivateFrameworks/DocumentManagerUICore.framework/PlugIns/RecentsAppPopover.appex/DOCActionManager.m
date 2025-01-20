@interface DOCActionManager
+ (BOOL)canCreateNewFolderIn:(id)a3;
+ (BOOL)canImportIn:(id)a3;
+ (BOOL)canMove:(id)a3 to:(id)a4;
+ (BOOL)canShowInfoIn:(id)a3;
- (NSArray)actions;
- (NSArray)associatedActionManagers;
- (NSArray)forbiddenActionIdentifiers;
- (_TtC17RecentsAppPopover16DOCActionManager)init;
- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5;
- (void)setActions:(id)a3;
- (void)setAssociatedActionManagers:(id)a3;
- (void)setForbiddenActionIdentifiers:(id)a3;
@end

@implementation DOCActionManager

- (NSArray)forbiddenActionIdentifiers
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004BEDC0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCActionManager_forbiddenActionIdentifiers) = (Class)sub_1004BEDE0();
  swift_bridgeObjectRelease();
}

- (NSArray)associatedActionManagers
{
  type metadata accessor for DOCActionManager();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004BEDC0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setAssociatedActionManagers:(id)a3
{
  type metadata accessor for DOCActionManager();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCActionManager_associatedActionManagers) = (Class)sub_1004BEDE0();
  swift_bridgeObjectRelease();
}

- (NSArray)actions
{
  sub_1000338CC(0, (unint64_t *)&unk_100623230);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004BEDC0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setActions:(id)a3
{
  sub_1000338CC(0, (unint64_t *)&unk_100623230);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCActionManager_actions) = (Class)sub_1004BEDE0();
  swift_bridgeObjectRelease();
}

- (_TtC17RecentsAppPopover16DOCActionManager)init
{
  uint64_t ObjectType = swift_getObjectType();
  id v3 = [self defaultManager];
  id v4 = [self defaultPermission];
  v5 = (_TtC17RecentsAppPopover16DOCActionManager *)(*(uint64_t (**)(id, id))(ObjectType + 248))(v3, v4);
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover16DOCActionManager_actionManagerDelegate);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCActionManager_managedPermission);
}

+ (BOOL)canMove:(id)a3 to:(id)a4
{
  sub_100031860(&qword_100617B10);
  unint64_t v5 = sub_1004BEDE0();
  v6 = (void *)FPActionReparent;
  swift_unknownObjectRetain();
  char v7 = sub_100231484(v6, v5);
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
    sub_100031860(&qword_100617C10);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1004D67A0;
    *(void *)(inited + 32) = a4;
    unint64_t v12 = inited;
    sub_1004BEE00();
    swift_unknownObjectRetain();
    char v8 = sub_100231484(v9, v12);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

+ (BOOL)canCreateNewFolderIn:(id)a3
{
  return sub_100226C50((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100230F30);
}

+ (BOOL)canImportIn:(id)a3
{
  return sub_100226C50((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100230E9C);
}

+ (BOOL)canShowInfoIn:(id)a3
{
  return a3 != 0;
}

- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1004BEB10();
  uint64_t v9 = v8;
  sub_1000338CC(0, &qword_100624680);
  unint64_t v10 = sub_1004BEDE0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  unint64_t v12 = self;
  DOCActionManager.perform(actionWithIdentifier:with:completionHandler:)(v7, v9, v10, (uint64_t)sub_1000A6150, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end