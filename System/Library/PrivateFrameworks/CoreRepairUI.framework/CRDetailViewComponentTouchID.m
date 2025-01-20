@interface CRDetailViewComponentTouchID
- (CRDetailViewComponentTouchID)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentTouchID

- (id)specifiers
{
  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (!*v3)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"TouchID"];
    [v5 addObjectsFromArray:v6];

    objc_storeStrong(v3, v5);
    v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
    uint64_t v8 = [v7 integerForKey:@"com.apple.mobilerepair.TouchIDRepair"];

    if (v8 <= 1)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      [v9 setInteger:v8 + 1 forKey:@"com.apple.mobilerepair.TouchIDRepair"];

      notify_post("com.apple.mobilerepair.refreshui");
    }
    v10 = objc_opt_new();
    [v10 sendAsyncAnalyticsForEventIfNeeded:@"detailViewSeen" moduleName:@"TouchID"];

    id v4 = *v3;
  }

  return v4;
}

- (CRDetailViewComponentTouchID)init
{
  v15.receiver = self;
  v15.super_class = (Class)CRDetailViewComponentTouchID;
  v2 = [(CRUDetailViewComponent *)&v15 init];
  v3 = v2;
  if (v2 && [(CRUDetailViewComponent *)v2 deviceClass] == 3)
  {
    id v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v3 locale];
    v6 = [v5 localizedStringWithKey:@"TOUCHID_KB_URL_IPAD" defaultString:@"TOUCHID_KB_URL_IPAD"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    uint64_t v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"TOUCHID_DESC_IPAD" defaultString:@"TOUCHID_DESC_IPAD"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"TOUCHID_SETTINGS_TITLE" defaultString:@"TOUCHID_SETTINGS_TITLE"];
    [(CRUDetailViewComponent *)v3 setTitleText:v11];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v13];
  }
  return v3;
}

@end