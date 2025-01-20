@interface AuthenticateAccountsPresenter
- (_TtC18SharingViewService29AuthenticateAccountsPresenter)init;
- (void)dealloc;
- (void)handleDeviceSetupWithNotification:(id)a3;
- (void)proxCardFlowDidDismiss;
@end

@implementation AuthenticateAccountsPresenter

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 removeObserver:v4 name:v6 object:0];

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AuthenticateAccountsPresenter();
  [(AuthenticateAccountsPresenter *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
}

- (_TtC18SharingViewService29AuthenticateAccountsPresenter)init
{
  result = (_TtC18SharingViewService29AuthenticateAccountsPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)handleDeviceSetupWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10007F4CC(v4);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_1000F9984();
}

@end