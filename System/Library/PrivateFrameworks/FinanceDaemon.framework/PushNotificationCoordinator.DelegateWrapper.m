@interface PushNotificationCoordinator.DelegateWrapper
- (_TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5;
@end

@implementation PushNotificationCoordinator.DelegateWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v11 = self;
    id v7 = a4;
    uint64_t v8 = sub_1D740F918();
    unint64_t v10 = v9;

    sub_1D728FEA8(v8, v10);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    unint64_t v10 = self;
    id v11 = a4;
    uint64_t v12 = sub_1D740F918();
    unint64_t v14 = v13;
  }
  else
  {
    id v15 = a3;
    id v16 = a5;
    v17 = self;
    uint64_t v12 = 0;
    unint64_t v14 = 0xF000000000000000;
  }
  sub_1D73BDF00(v12, v14, a5);
  sub_1D7323134(v12, v14);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D73BE238(a4);
}

- (_TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PushNotificationCoordinator.DelegateWrapper *)&v5 init];
}

- (void).cxx_destruct
{
}

@end