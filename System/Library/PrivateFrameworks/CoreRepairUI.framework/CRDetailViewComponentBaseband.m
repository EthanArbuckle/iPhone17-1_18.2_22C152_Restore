@interface CRDetailViewComponentBaseband
- (CRDetailViewComponentBaseband)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentBaseband

- (id)specifiers
{
  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (!*v3)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"Baseband"];
    [v5 addObjectsFromArray:v6];

    objc_storeStrong(v3, v5);
    v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
    uint64_t v8 = [v7 integerForKey:@"com.apple.mobilerepair.BasebandRepair"];

    if (v8 <= 1)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      [v9 setInteger:v8 + 1 forKey:@"com.apple.mobilerepair.BasebandRepair"];

      notify_post("com.apple.mobilerepair.refreshui");
    }
    v10 = objc_opt_new();
    [v10 sendAsyncAnalyticsForEventIfNeeded:@"detailViewSeen" moduleName:@"Baseband"];

    id v4 = *v3;
  }

  return v4;
}

- (CRDetailViewComponentBaseband)init
{
  v21.receiver = self;
  v21.super_class = (Class)CRDetailViewComponentBaseband;
  v2 = [(CRUDetailViewComponent *)&v21 init];
  v3 = v2;
  if (v2)
  {
    id v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"BASEBAND_KB_URL" defaultString:@"BASEBAND_KB_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    uint64_t v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"BASEBAND_SETTINGS_TITLE" defaultString:@"BASEBAND_SETTINGS_TITLE"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"BASEBAND_DESC" defaultString:@"BASEBAND_DESC"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v13];

    if ([(CRUDetailViewComponent *)v3 deviceClass] == 3)
    {
      v14 = NSURL;
      v15 = [(CRUDetailViewComponent *)v3 locale];
      v16 = [v15 localizedStringWithKey:@"BASEBAND_KB_URL_IPAD" defaultString:@"BASEBAND_KB_URL_IPAD"];
      v17 = [v14 URLWithString:v16];
      [(CRUDetailViewComponent *)v3 setKbArticleURL:v17];

      v18 = [(CRUDetailViewComponent *)v3 locale];
      v19 = [v18 localizedStringWithKey:@"BASEBAND_DESC_IPAD" defaultString:@"BASEBAND_DESC_IPAD"];
      [(CRUDetailViewComponent *)v3 setInformativeText:v19];
    }
  }
  return v3;
}

@end