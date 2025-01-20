@interface SingleAccountSharingChoiceController
- (_TtC21WalletPrivacySettings36SingleAccountSharingChoiceController)initWithCoder:(id)a3;
- (_TtC21WalletPrivacySettings36SingleAccountSharingChoiceController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)donePressed:(id)a3;
- (void)menuUpdated;
- (void)setAllAvailableActivity:(id)a3;
- (void)setNone:(id)a3;
- (void)setStartDate:(id)a3;
- (void)viewDidLoad;
@end

@implementation SingleAccountSharingChoiceController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(SingleAccountSharingChoiceController *)&v6 viewDidLoad];
  id v3 = objc_allocWithZone((Class)UIBarButtonItem);
  id v4 = objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", 0, v2, "donePressed:", v6.receiver, v6.super_class);
  id v5 = [v2 navigationItem];
  [v5 setRightBarButtonItem:v4];
}

- (id)specifiers
{
  id v2 = self;
  sub_1B650();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_27168().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

- (void)menuUpdated
{
  id v2 = self;
  sub_1DA14();
}

- (void)donePressed:(id)a3
{
  uint64_t v5 = sub_A070(&qword_31458);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_27228();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_27208();
  v10 = self;
  id v11 = a3;
  uint64_t v12 = sub_271F8();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  sub_1B080((uint64_t)v8, (uint64_t)&unk_31598, (uint64_t)v13);
  swift_release();
}

- (void)setStartDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1F668(v4);
}

- (void)setNone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23324();
}

- (void)setAllAvailableActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_234CC();
}

- (_TtC21WalletPrivacySettings36SingleAccountSharingChoiceController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC21WalletPrivacySettings36SingleAccountSharingChoiceController *)sub_20A10(v5, v7, a4);
}

- (_TtC21WalletPrivacySettings36SingleAccountSharingChoiceController)initWithCoder:(id)a3
{
  return (_TtC21WalletPrivacySettings36SingleAccountSharingChoiceController *)sub_20C4C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_E658((uint64_t)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_accountID], &qword_315B0);
  swift_release();
  sub_E658((uint64_t)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_initialAccountStartDate], &qword_312F8);
  sub_E658((uint64_t)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate], &qword_312F8);
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController____lazy_storage___applicationRecord];

  sub_1AA24(v3);
}

@end