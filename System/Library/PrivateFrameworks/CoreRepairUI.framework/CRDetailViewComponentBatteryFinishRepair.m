@interface CRDetailViewComponentBatteryFinishRepair
- (CRDetailViewComponentBatteryFinishRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentBatteryFinishRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [@"Battery" stringByAppendingString:@"FinishRepair"];
    v7 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:v6];
    [v5 addObjectsFromArray:v7];

    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentBatteryFinishRepair)init
{
  v19.receiver = self;
  v19.super_class = (Class)CRDetailViewComponentBatteryFinishRepair;
  v2 = [(CRUDetailViewComponent *)&v19 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [(CRUDetailViewComponent *)v2 locale];
    v5 = [v4 localizedStringWithKey:@"NEW_BATTERY" defaultString:@"NEW_BATTERY"];
    [(CRUDetailViewComponent *)v3 setTitleText:v5];

    v6 = NSURL;
    v7 = [(CRUDetailViewComponent *)v3 locale];
    v8 = [v7 localizedStringWithKey:@"FINISH_REPAIR_KB_URL" defaultString:@"FINISH_REPAIR_KB_URL"];
    v9 = [v6 URLWithString:v8];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"FINISH_BATTERY_DESC" defaultString:@"FINISH_BATTERY_DESC"];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"RESTART_FINISH_REPAIR" defaultString:@"RESTART_FINISH_REPAIR"];
    [(CRUDetailViewComponent *)v3 setButtonTitle:v13];

    [(CRUDetailViewComponent *)v3 setInformativeText:v11];
    v14 = [(CRUDetailViewComponent *)v3 locale];
    v15 = [v14 localizedStringWithKey:@"Battery" defaultString:@"Battery"];
    [(CRUDetailViewComponent *)v3 setComponentName:v15];

    v16 = [(CRUDetailViewComponent *)v3 locale];
    v17 = [v16 localizedStringWithKey:@"BATTERY_FOOTER_LEARN_MORE" defaultString:@"BATTERY_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v17];
  }
  return v3;
}

@end