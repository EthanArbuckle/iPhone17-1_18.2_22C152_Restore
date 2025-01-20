@interface DOCDefaultSourceUIManager
- (_TtC17RecentsAppPopover25DOCDefaultSourceUIManager)init;
- (_TtC17RecentsAppPopover25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)dealloc;
- (void)ubiquityIdentityDidChange:(id)a3;
@end

@implementation DOCDefaultSourceUIManager

- (_TtC17RecentsAppPopover25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5
{
  return (_TtC17RecentsAppPopover25DOCDefaultSourceUIManager *)sub_1002A9B38(a3, a4, a5);
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
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCDefaultSourceUIManager_configuration));
  swift_unknownObjectWeakDestroy();

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover25DOCDefaultSourceUIManager_sourceObserver);
}

- (void)ubiquityIdentityDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002AFB14((uint64_t)&unk_1005B9040, (uint64_t)sub_1002B0020, (uint64_t)&unk_1005B9058);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002AFB14((uint64_t)&unk_1005B8B68, (uint64_t)sub_1002B010C, (uint64_t)&unk_1005B8B80);
}

- (_TtC17RecentsAppPopover25DOCDefaultSourceUIManager)init
{
  result = (_TtC17RecentsAppPopover25DOCDefaultSourceUIManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end