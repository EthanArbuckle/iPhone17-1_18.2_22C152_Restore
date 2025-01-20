@interface CRDetailViewComponentUWB
- (CRDetailViewComponentUWB)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentUWB

- (id)specifiers
{
  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (!*v3)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"UWB"];
    [v5 addObjectsFromArray:v6];

    objc_storeStrong(v3, v5);
    v7 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.mobilerepair"];
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = [NSString stringWithFormat:@"com.apple.mobilerepair.%@Repair", @"UWB"];
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
    [v14 sendAsyncAnalyticsForEventIfNeeded:@"detailViewSeen" moduleName:@"UWB"];

    id v4 = *v3;
  }

  return v4;
}

- (CRDetailViewComponentUWB)init
{
  v15.receiver = self;
  v15.super_class = (Class)CRDetailViewComponentUWB;
  v2 = [(CRUDetailViewComponent *)&v15 init];
  v3 = v2;
  if (v2)
  {
    id v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"UWB_KB_URL" defaultString:@"UWB_KB_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"UWB_SETTINGS_TITLE" defaultString:@"UWB_SETTINGS_TITLE"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    char v11 = [v10 localizedStringWithKey:@"UWB_DESC" defaultString:@"UWB_DESC"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];

    id v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v13];
  }
  return v3;
}

@end