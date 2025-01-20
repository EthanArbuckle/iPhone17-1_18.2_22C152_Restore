@interface DOCDefaultSourceUIManager
- (_TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager)init;
- (_TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)dealloc;
- (void)ubiquityIdentityDidChange:(id)a3;
@end

@implementation DOCDefaultSourceUIManager

- (_TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5
{
  return (_TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager *)sub_100237FE4(a3, a4, a5);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  CFNotificationCenterRef DistributedCenter = CFNotificationCenterGetDistributedCenter();
  if (DistributedCenter)
  {
    v8 = DistributedCenter;
    CFNotificationCenterRemoveEveryObserver(v8, v5);

    v9.receiver = v5;
    v9.super_class = ObjectType;
    [(DOCDefaultSourceUIManager *)&v9 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager_configuration));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager_alert));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager_sourceObserver);
}

- (void)ubiquityIdentityDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10023DFC0((uint64_t)&unk_1005CB3D0, (uint64_t)sub_10023E4D4, (uint64_t)&unk_1005CB3E8);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10023DFC0((uint64_t)&unk_1005CAEF8, (uint64_t)sub_10023E608, (uint64_t)&unk_1005CAF10);
}

- (_TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager)init
{
  result = (_TtC33com_apple_DocumentManager_Service25DOCDefaultSourceUIManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end