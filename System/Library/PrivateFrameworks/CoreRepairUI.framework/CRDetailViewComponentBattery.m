@interface CRDetailViewComponentBattery
- (CRDetailViewComponentBattery)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentBattery

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"Battery"];
    [v5 addObjectsFromArray:v6];

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentBattery)init
{
  v18.receiver = self;
  v18.super_class = (Class)CRDetailViewComponentBattery;
  v2 = [(CRUDetailViewComponent *)&v18 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"NONGENUINE_BATTERY_URL" defaultString:@"NONGENUINE_BATTERY_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"UNKNOWN_PART" defaultString:@"UNKNOWN_PART"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"NONGENUINE_BATTERY_DESC" defaultString:@"NONGENUINE_BATTERY_DESC"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v13];

    v14 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
    uint64_t v15 = [v14 integerForKey:@"com.apple.mobilerepair.BatteryRepair"];

    if (v15 <= 1)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      [v16 setInteger:v15 + 1 forKey:@"com.apple.mobilerepair.BatteryRepair"];

      notify_post("com.apple.mobilerepair.refreshui");
    }
  }
  return v3;
}

@end