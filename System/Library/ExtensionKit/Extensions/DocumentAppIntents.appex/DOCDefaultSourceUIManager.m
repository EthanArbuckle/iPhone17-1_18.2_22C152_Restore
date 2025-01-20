@interface DOCDefaultSourceUIManager
- (_TtC18DocumentAppIntents25DOCDefaultSourceUIManager)init;
- (_TtC18DocumentAppIntents25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)dealloc;
- (void)ubiquityIdentityDidChange:(id)a3;
@end

@implementation DOCDefaultSourceUIManager

- (_TtC18DocumentAppIntents25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5
{
  return (_TtC18DocumentAppIntents25DOCDefaultSourceUIManager *)sub_1002B270C(a3, a4, a5);
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
                     + OBJC_IVAR____TtC18DocumentAppIntents25DOCDefaultSourceUIManager_configuration));
  swift_unknownObjectWeakDestroy();

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents25DOCDefaultSourceUIManager_sourceObserver);
}

- (void)ubiquityIdentityDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002B86E8((uint64_t)&unk_1005F94D0, (uint64_t)sub_1002B8BF4, (uint64_t)&unk_1005F94E8);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002B86E8((uint64_t)&unk_1005F8FF8, (uint64_t)sub_1002B8CE0, (uint64_t)&unk_1005F9010);
}

- (_TtC18DocumentAppIntents25DOCDefaultSourceUIManager)init
{
  result = (_TtC18DocumentAppIntents25DOCDefaultSourceUIManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end