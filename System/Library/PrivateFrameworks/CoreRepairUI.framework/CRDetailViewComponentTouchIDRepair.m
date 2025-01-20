@interface CRDetailViewComponentTouchIDRepair
- (CRDetailViewComponentTouchIDRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentTouchIDRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self locale];
    v7 = [v6 localizedStringWithKey:@"TouchID" defaultString:@"TouchID"];
    BOOL v8 = [(CRUDetailViewComponent *)self isUsed];
    v9 = [(CRUDetailViewComponent *)self repairDate];
    v10 = [(CRUDetailViewComponent *)self componentRepairSpecifierForComponent:v7 IsUsed:v8 repairDate:v9];
    [v5 addObjectsFromArray:v10];

    v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentTouchIDRepair)init
{
  v25.receiver = self;
  v25.super_class = (Class)CRDetailViewComponentTouchIDRepair;
  v2 = [(CRUDetailViewComponent *)&v25 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(CRUDetailViewComponent *)v2 setIsUsed:0];
    if (_os_feature_enabled_impl()) {
      [(CRUDetailViewComponent *)v3 setIsUsed:1];
    }
    v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v3 locale];
    v6 = [v5 localizedStringWithKey:@"TOUCHID_REPAIR_KB_URL_IPAD" defaultString:@"TOUCHID_REPAIR_KB_URL_IPAD"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    BOOL v8 = objc_opt_new();
    LODWORD(v6) = [(CRUDetailViewComponent *)v3 isUsed];
    v9 = [(CRUDetailViewComponent *)v3 locale];
    v10 = v9;
    if (v6)
    {
      v11 = [v9 localizedStringWithKey:@"USED" defaultString:@"USED"];
      [(CRUDetailViewComponent *)v3 setTitleText:v11];

      v12 = [(CRUDetailViewComponent *)v3 locale];
      v13 = v12;
      v14 = @"USED_TOUCHID_DESC_IPAD";
    }
    else
    {
      v15 = [v9 localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];
      [(CRUDetailViewComponent *)v3 setTitleText:v15];

      v12 = [(CRUDetailViewComponent *)v3 locale];
      v13 = v12;
      v14 = @"GENUINE_TOUCHID_DESC_IPAD";
    }
    v16 = [v12 localizedStringWithKey:v14 defaultString:v14];
    v17 = (void *)[v16 mutableCopy];

    v18 = [(CRUDetailViewComponent *)v3 deviceHistory];
    v19 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v20 = [(CRUDetailViewComponent *)v3 caaRepairHistoryDict];
    v21 = [v18 repairDateForComponent:@"TouchID" withRCHLHistory:v19 withCAAHistory:v20];
    [(CRUDetailViewComponent *)v3 setRepairDate:v21];

    [(CRUDetailViewComponent *)v3 setInformativeText:v17];
    v22 = [(CRUDetailViewComponent *)v3 locale];
    v23 = [v22 localizedStringWithKey:@"TOUCHID_FOOTER_LEARN_MORE" defaultString:@"TOUCHID_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v23];
  }
  return v3;
}

@end