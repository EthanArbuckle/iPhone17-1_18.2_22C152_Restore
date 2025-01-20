@interface CRDetailViewComponentNFC
- (CRDetailViewComponentNFC)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentNFC

- (id)specifiers
{
  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (!*v3)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"NFC"];
    [v5 addObjectsFromArray:v6];

    objc_storeStrong(v3, v5);
    v7 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.mobilerepair"];
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = [NSString stringWithFormat:@"com.apple.mobilerepair.%@Repair", @"NFC"];
    v10 = objc_msgSend(v8, "arrayWithObjects:", v9, 0);
    id v16 = 0;
    char v11 = [v7 clearPendingFollowUpItemsWithUniqueIdentifiers:v10 error:&v16];
    id v12 = v16;

    if ((v11 & 1) == 0)
    {
      v13 = sub_239773918(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_239776AC4(v12);
      }
    }
    v14 = objc_opt_new();
    [v14 sendAsyncAnalyticsForEventIfNeeded:@"detailViewSeen" moduleName:@"NFC"];

    id v4 = *v3;
  }

  return v4;
}

- (CRDetailViewComponentNFC)init
{
  v21.receiver = self;
  v21.super_class = (Class)CRDetailViewComponentNFC;
  v2 = [(CRUDetailViewComponent *)&v21 init];
  v3 = v2;
  if (v2)
  {
    id v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"NFC_KB_URL" defaultString:@"NFC_KB_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"NFC_SETTINGS_TITLE" defaultString:@"NFC_SETTINGS_TITLE"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    char v11 = [v10 localizedStringWithKey:@"NFC_DESC" defaultString:@"NFC_DESC"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];

    id v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v13];

    if ([(CRUDetailViewComponent *)v3 deviceClass] == 3)
    {
      v14 = NSURL;
      v15 = [(CRUDetailViewComponent *)v3 locale];
      id v16 = [v15 localizedStringWithKey:@"NFC_KB_URL_IPAD" defaultString:@"NFC_KB_URL_IPAD"];
      v17 = [v14 URLWithString:v16];
      [(CRUDetailViewComponent *)v3 setKbArticleURL:v17];

      v18 = [(CRUDetailViewComponent *)v3 locale];
      v19 = [v18 localizedStringWithKey:@"NFC_DESC_IPAD" defaultString:@"NFC_DESC_IPAD"];
      [(CRUDetailViewComponent *)v3 setInformativeText:v19];
    }
  }
  return v3;
}

@end