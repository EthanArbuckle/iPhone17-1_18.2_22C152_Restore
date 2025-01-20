@interface CRDetailViewComponentMtubRepair
- (CRDetailViewComponentMtubRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentMtubRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self locale];
    v7 = [v6 localizedStringWithKey:@"REAR_SYSTEM" defaultString:@"REAR_SYSTEM"];
    v8 = [(CRUDetailViewComponent *)self repairDate];
    v9 = [(CRUDetailViewComponent *)self componentRepairSpecifierForComponent:v7 IsUsed:0 repairDate:v8];
    [v5 addObjectsFromArray:v9];

    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentMtubRepair)init
{
  v20.receiver = self;
  v20.super_class = (Class)CRDetailViewComponentMtubRepair;
  v2 = [(CRUDetailViewComponent *)&v20 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"REAR_SYSTEM_REPAIR_KB_URL" defaultString:@"REAR_SYSTEM_REPAIR_KB_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = objc_opt_new();
    v11 = [(CRUDetailViewComponent *)v3 locale];
    v12 = [v11 localizedStringWithKey:@"GENUINE_MTUB_DESC" defaultString:@"GENUINE_MTUB_DESC"];
    [v10 appendString:v12];

    v13 = [(CRUDetailViewComponent *)v3 deviceHistory];
    v14 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v15 = [(CRUDetailViewComponent *)v3 caaRepairHistoryDict];
    v16 = [v13 repairDateForComponent:@"MTUB" withRCHLHistory:v14 withCAAHistory:v15];
    [(CRUDetailViewComponent *)v3 setRepairDate:v16];

    [(CRUDetailViewComponent *)v3 setInformativeText:v10];
    v17 = [(CRUDetailViewComponent *)v3 locale];
    v18 = [v17 localizedStringWithKey:@"MTUB_FOOTER_LEARN_MORE" defaultString:@"MTUB_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v18];
  }
  return v3;
}

@end