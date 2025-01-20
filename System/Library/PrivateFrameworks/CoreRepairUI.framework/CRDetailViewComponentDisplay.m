@interface CRDetailViewComponentDisplay
- (CRDetailViewComponentDisplay)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentDisplay

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"Display"];
    [v5 addObjectsFromArray:v6];

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentDisplay)init
{
  v24.receiver = self;
  v24.super_class = (Class)CRDetailViewComponentDisplay;
  v2 = [(CRUDetailViewComponent *)&v24 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"NONGENUINE_DISPLAY_URL" defaultString:@"NONGENUINE_DISPLAY_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"UNKNOWN_PART" defaultString:@"UNKNOWN_PART"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"NONGENUINE_DISPLAY_DESC" defaultString:@"NONGENUINE_DISPLAY_DESC"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v13];

    if ([(CRUDetailViewComponent *)v3 deviceClass] == 3)
    {
      v14 = NSURL;
      v15 = [(CRUDetailViewComponent *)v3 locale];
      v16 = [v15 localizedStringWithKey:@"NONGENUINE_DISPLAY_URL_IPAD" defaultString:@"NONGENUINE_DISPLAY_URL_IPAD"];
      v17 = [v14 URLWithString:v16];
      [(CRUDetailViewComponent *)v3 setKbArticleURL:v17];

      v18 = [(CRUDetailViewComponent *)v3 locale];
      v19 = [v18 localizedStringWithKey:@"NONGENUINE_DISPLAY_DESC_IPAD" defaultString:@"NONGENUINE_DISPLAY_DESC_IPAD"];
      [(CRUDetailViewComponent *)v3 setInformativeText:v19];
    }
    v20 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
    uint64_t v21 = [v20 integerForKey:@"com.apple.mobilerepair.DisplayRepair"];

    if (v21 <= 1)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      [v22 setInteger:v21 + 1 forKey:@"com.apple.mobilerepair.DisplayRepair"];
    }
    notify_post("com.apple.mobilerepair.refreshui");
  }
  return v3;
}

@end