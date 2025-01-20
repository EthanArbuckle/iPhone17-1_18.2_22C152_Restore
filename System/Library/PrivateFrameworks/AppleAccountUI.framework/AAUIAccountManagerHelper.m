@interface AAUIAccountManagerHelper
- (AAUIAccountManagerHelper)init;
- (AIDAAccountManager)accountManager;
- (id)accountsForAccountManager:(id)a3;
- (void)setAccountManager:(id)a3;
@end

@implementation AAUIAccountManagerHelper

- (AAUIAccountManagerHelper)init
{
  return (AAUIAccountManagerHelper *)AccountManagerHelper.init()();
}

- (AIDAAccountManager)accountManager
{
  v2 = self;
  id v5 = sub_2098AACD4();

  return (AIDAAccountManager *)v5;
}

- (void)setAccountManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2098AAD8C(a3);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2098AB4F8();

  type metadata accessor for AIDAServiceType();
  sub_20980C484();
  sub_2098ABB08();
  v9 = (void *)sub_2098BF2B8();
  swift_bridgeObjectRelease();
  return v9;
}

- (void).cxx_destruct
{
  uint64_t v3 = OBJC_IVAR___AAUIAccountManagerHelper__account;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F04D0);
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
}

@end