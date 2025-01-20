@interface CRDetailViewComponentBatteryRepair
- (CRDetailViewComponentBatteryRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentBatteryRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self locale];
    v7 = [v6 localizedStringWithKey:@"Battery" defaultString:@"Battery"];
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

- (CRDetailViewComponentBatteryRepair)init
{
  v23.receiver = self;
  v23.super_class = (Class)CRDetailViewComponentBatteryRepair;
  v2 = [(CRUDetailViewComponent *)&v23 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [(CRUDetailViewComponent *)v2 deviceHistory];
    v5 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v6 = [(CRUDetailViewComponent *)v3 claimCount];
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", [v4 checkUsedStatusFor:@"Battery" withHistory:v5 withClaimCount:v6]);

    if (_os_feature_enabled_impl()) {
      [(CRUDetailViewComponent *)v3 setIsUsed:1];
    }
    v7 = NSURL;
    BOOL v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"BATTERY_REPAIR_KB_URL" defaultString:@"BATTERY_REPAIR_KB_URL"];
    v10 = [v7 URLWithString:v9];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v10];

    v11 = [(CRUDetailViewComponent *)v3 locale];
    v12 = [v11 localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];
    [(CRUDetailViewComponent *)v3 setTitleText:v12];

    v13 = objc_opt_new();
    v14 = [(CRUDetailViewComponent *)v3 locale];
    v15 = [v14 localizedStringWithKey:@"GENUINE_BATTERY_DESC" defaultString:@"GENUINE_BATTERY_DESC"];
    [v13 appendString:v15];

    v16 = [(CRUDetailViewComponent *)v3 deviceHistory];
    v17 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v18 = [(CRUDetailViewComponent *)v3 caaRepairHistoryDict];
    v19 = [v16 repairDateForComponent:@"Battery" withRCHLHistory:v17 withCAAHistory:v18];
    [(CRUDetailViewComponent *)v3 setRepairDate:v19];

    [(CRUDetailViewComponent *)v3 setInformativeText:v13];
    v20 = [(CRUDetailViewComponent *)v3 locale];
    v21 = [v20 localizedStringWithKey:@"BATTERY_FOOTER_LEARN_MORE" defaultString:@"BATTERY_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v21];
  }
  return v3;
}

@end