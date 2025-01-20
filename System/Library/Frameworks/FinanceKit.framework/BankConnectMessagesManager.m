@interface BankConnectMessagesManager
+ (id)makeManager;
- (BOOL)isAccountMessageDismissed:(int64_t)a3 forAccountIdentifier:(id)a4;
- (BOOL)isPassMessageDismissed:(int64_t)a3 forFPANIdentifier:(id)a4;
- (_TtC10FinanceKit26BankConnectMessagesManager)init;
- (id)shouldDisplayBackgroundRefreshConfirmationMessageWithFullyQualifiedAccountIdentifier:(id)a3 now:(id)a4;
- (void)dismissBackgroundRefreshConfirmationMessageWithToken:(id)a3;
- (void)resetMessagesForFPANIdentifier:(id)a3;
- (void)setIsDismissed:(BOOL)a3 forAccountMessage:(int64_t)a4 withAccountIdentifier:(id)a5;
- (void)setIsDismissed:(BOOL)a3 forPassMessage:(int64_t)a4 withFPANIdentifier:(id)a5;
@end

@implementation BankConnectMessagesManager

- (_TtC10FinanceKit26BankConnectMessagesManager)init
{
  result = (_TtC10FinanceKit26BankConnectMessagesManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)makeManager
{
  if (qword_26B0C8528 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B0C8520;
  v3 = (objc_class *)type metadata accessor for BankConnectMessagesManager();
  id v4 = objc_allocWithZone(v3);
  v9[3] = sub_2434D0CF4();
  v9[4] = &protocol witness table for NSUserDefaults;
  v9[0] = v2;
  sub_24338E428((uint64_t)v9, (uint64_t)v4 + OBJC_IVAR____TtC10FinanceKit26BankConnectMessagesManager_userDefaults);
  v8.receiver = v4;
  v8.super_class = v3;
  id v5 = v2;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v6;
}

- (void)resetMessagesForFPANIdentifier:(id)a3
{
  uint64_t v4 = sub_2439582D0();
  id v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BankConnectMessagesManager.resetMessages(forFPANIdentifier:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setIsDismissed:(BOOL)a3 forPassMessage:(int64_t)a4 withFPANIdentifier:(id)a5
{
  uint64_t v8 = sub_2439582D0();
  if (a4)
  {
    sub_243959540();
    __break(1u);
  }
  else
  {
    v11[0] = v8;
    v11[1] = v9;
    char v12 = 0;
    v10 = self;
    sub_2434CA9C0(a3, (uint64_t)v11);

    swift_bridgeObjectRelease();
  }
}

- (void)setIsDismissed:(BOOL)a3 forAccountMessage:(int64_t)a4 withAccountIdentifier:(id)a5
{
  uint64_t v8 = sub_2439582D0();
  uint64_t v10 = v9;
  v11 = self;
  BankConnectMessagesManager.setIsDismissed(_:for:with:)(a3, a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (BOOL)isPassMessageDismissed:(int64_t)a3 forFPANIdentifier:(id)a4
{
  return sub_2434CBB4C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BankConnectMessagesManager.isPassMessageDismissed(_:for:));
}

- (BOOL)isAccountMessageDismissed:(int64_t)a3 forAccountIdentifier:(id)a4
{
  return sub_2434CBB4C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BankConnectMessagesManager.isAccountMessageDismissed(_:for:));
}

- (id)shouldDisplayBackgroundRefreshConfirmationMessageWithFullyQualifiedAccountIdentifier:(id)a3 now:(id)a4
{
  uint64_t v6 = sub_243957400();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2439573A0();
  uint64_t v10 = qword_26B0C7F68;
  id v11 = a3;
  char v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  v13 = *(void **)(*((void *)off_26B0C7F60 + 2) + 16);
  swift_retain();
  id v14 = objc_msgSend(v13, sel_newBackgroundContext);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v18[-4] = v12;
  v18[-3] = v11;
  v18[-2] = v9;
  v18[-1] = v15;
  type metadata accessor for BankConnectMessagesManager.BackgroundRefreshConfirmationPromptDecision();
  sub_243958D90();

  swift_release();
  v16 = (void *)v18[1];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v16;
}

- (void)dismissBackgroundRefreshConfirmationMessageWithToken:(id)a3
{
  uint64_t v4 = qword_26B0C7F68;
  id v5 = a3;
  uint64_t v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void **)(*((void *)off_26B0C7F60 + 2) + 16);
  swift_retain();
  id v8 = objc_msgSend(v7, sel_newBackgroundContext);
  BankConnectMessagesManager.dismissBackgroundRefreshConfirmationMessage(token:context:)();

  swift_release();
}

@end