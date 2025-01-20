@interface BankConnectAccountConsentManagementViewControllerProvider
+ (id)makeViewControllerWithAccountIdentifier:(id)a3 institutionIdentifier:(id)a4;
- (_TtC12FinanceKitUI57BankConnectAccountConsentManagementViewControllerProvider)init;
@end

@implementation BankConnectAccountConsentManagementViewControllerProvider

+ (id)makeViewControllerWithAccountIdentifier:(id)a3 institutionIdentifier:(id)a4
{
  uint64_t v4 = type metadata accessor for ConsentManagementView(0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243DFAEE0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243DFE910();
  sub_243DFE910();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_243DFAEC0();
  objc_allocWithZone((Class)type metadata accessor for BankConnectAccountConsentManagementViewController(0));
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  v11 = (void *)sub_243DFD060();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11;
}

- (_TtC12FinanceKitUI57BankConnectAccountConsentManagementViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectAccountConsentManagementViewControllerProvider();
  return [(BankConnectAccountConsentManagementViewControllerProvider *)&v3 init];
}

@end