@interface AuthenticateAccountsAuthViewController
- (_TtC18SharingViewService38AuthenticateAccountsAuthViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AuthenticateAccountsAuthViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AuthenticateAccountsAuthViewController();
  id v4 = v5.receiver;
  [(AuthenticateAccountsAuthViewController *)&v5 viewWillAppear:v3];
  sub_1000C28A0();
}

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1000C276C(v4);
}

- (_TtC18SharingViewService38AuthenticateAccountsAuthViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC18SharingViewService38AuthenticateAccountsAuthViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000181B0((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsAuthViewController_presenter]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end