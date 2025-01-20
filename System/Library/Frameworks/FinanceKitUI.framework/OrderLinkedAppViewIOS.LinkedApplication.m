@interface OrderLinkedAppViewIOS.LinkedApplication
- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)init;
- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithApplicationIdentifiers:(id)a3 storeIDs:(id)a4 defaultLaunchURL:(id)a5;
- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithPass:(id)a3;
- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithStoreIDs:(id)a3 defaultLaunchURL:(id)a4;
- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5;
- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4 launchURL:(id)a5;
@end

@implementation OrderLinkedAppViewIOS.LinkedApplication

- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4 launchURL:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19D10);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_243DFBB70();
    uint64_t v12 = sub_243DFBC00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_243DFBC00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  v15 = self;
  sub_243C6F5A8((uint64_t)a3, a4, (uint64_t)v11);

  sub_243A56808((uint64_t)v11, &qword_268E19D10);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithPass:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OrderLinkedAppViewIOS.LinkedApplication();
  return [(PKLinkedApplication *)&v5 initWithPass:a3];
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithStoreIDs:(id)a3 defaultLaunchURL:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19D10);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_243A8F888(0, &qword_268E19AE0);
    a3 = (id)sub_243DFEAE0();
  }
  if (a4)
  {
    sub_243DFBB70();
    uint64_t v9 = sub_243DFBC00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_243DFBC00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *)sub_243C6F8CC((uint64_t)a3, (uint64_t)v8);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19D10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_243A8F888(0, &qword_268E19AE0);
    a3 = (id)sub_243DFEAE0();
  }
  if (a4) {
    a4 = (id)sub_243DFEAE0();
  }
  if (a5)
  {
    sub_243DFBB70();
    uint64_t v11 = sub_243DFBC00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_243DFBC00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  return (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *)sub_243C6FBBC((uint64_t)a3, (uint64_t)a4, (uint64_t)v10);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithApplicationIdentifiers:(id)a3 storeIDs:(id)a4 defaultLaunchURL:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19D10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_243DFEAE0();
  }
  if (a4)
  {
    sub_243A8F888(0, &qword_268E19AE0);
    a4 = (id)sub_243DFEAE0();
  }
  if (a5)
  {
    sub_243DFBB70();
    uint64_t v11 = sub_243DFBC00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_243DFBC00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  return (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *)sub_243C6FF08((uint64_t)a3, (uint64_t)a4, (uint64_t)v10);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrderLinkedAppViewIOS.LinkedApplication();
  return [(PKLinkedApplication *)&v3 init];
}

@end