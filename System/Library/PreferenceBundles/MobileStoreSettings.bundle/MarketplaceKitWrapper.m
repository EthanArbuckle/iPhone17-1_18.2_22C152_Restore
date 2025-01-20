@interface MarketplaceKitWrapper
+ (NSString)AppDistributorsOrTrustedDevelopersChangedNotification;
+ (void)setShouldShowInstallConfirmationsFor:(NSString *)a3 shouldShow:(BOOL)a4 completionHandler:(id)a5;
+ (void)shouldShowAppInstallationSettingsWithCompletionHandler:(id)a3;
+ (void)shouldShowInstallConfirmationsFor:(NSString *)a3 completionHandler:(id)a4;
- (_TtC19MobileStoreSettings21MarketplaceKitWrapper)init;
@end

@implementation MarketplaceKitWrapper

+ (void)setShouldShowInstallConfirmationsFor:(NSString *)a3 shouldShow:(BOOL)a4 completionHandler:(id)a5
{
  sub_4E50(&qword_19DA0);
  __chkstk_darwin();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(unsigned char *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = a1;
  uint64_t v13 = sub_DBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_19E10;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_19E18;
  v15[5] = v14;
  v16 = a3;
  sub_5398((uint64_t)v10, (uint64_t)&unk_19E20, (uint64_t)v15);
  swift_release();
}

+ (void)shouldShowInstallConfirmationsFor:(NSString *)a3 completionHandler:(id)a4
{
  sub_4E50(&qword_19DA0);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  uint64_t v11 = sub_DBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_19DF0;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_19DF8;
  v13[5] = v12;
  v14 = a3;
  sub_5398((uint64_t)v8, (uint64_t)&unk_19E00, (uint64_t)v13);
  swift_release();
}

+ (void)shouldShowAppInstallationSettingsWithCompletionHandler:(id)a3
{
  sub_4E50(&qword_19DA0);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a1;
  uint64_t v9 = sub_DBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_19DB0;
  v10[5] = v8;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_19DC0;
  v11[5] = v10;
  sub_5398((uint64_t)v6, (uint64_t)&unk_19DD0, (uint64_t)v11);
  swift_release();
}

+ (NSString)AppDistributorsOrTrustedDevelopersChangedNotification
{
  v2 = (void *)_s19MobileStoreSettings21MarketplaceKitWrapperC53AppDistributorsOrTrustedDevelopersChangedNotificationSo18NSNotificationNameavgZ_0();

  return (NSString *)v2;
}

- (_TtC19MobileStoreSettings21MarketplaceKitWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MarketplaceKitWrapper();
  return [(MarketplaceKitWrapper *)&v3 init];
}

@end