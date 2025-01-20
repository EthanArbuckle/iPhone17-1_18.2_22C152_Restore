@interface FinanceDataAuthorizationLevelController
- (_TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController)initWithCoder:(id)a3;
- (_TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accountLinked:(id)a3;
- (id)specifiers;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FinanceDataAuthorizationLevelController

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(FinanceDataAuthorizationLevelController *)&v9 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, "specifier", v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    Class isa = sub_271D8().super.super.isa;
    NSString v8 = sub_270B8();
    [v6 setProperty:isa forKey:v8];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1160C(a3);
}

- (id)specifiers
{
  v2 = self;
  BOOL v3 = sub_118F8();

  if (v3)
  {
    v4.super.Class isa = sub_27168().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

- (id)accountLinked:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_13F44(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_270B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (_TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_270C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController *)sub_14DDC(v5, v7, a4);
}

- (_TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController)initWithCoder:(id)a3
{
  return (_TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController *)sub_14FC4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  BOOL v3 = &self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_tccCoordinator];
  uint64_t v4 = sub_26AB8();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController____lazy_storage___applicationRecord];

  sub_1AA24(v5);
}

@end