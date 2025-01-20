@interface CRDetailViewComponentCameraRepair
- (CRDetailViewComponentCameraRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentCameraRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self locale];
    v7 = [v6 localizedStringWithKey:@"Camera" defaultString:@"Camera"];
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

- (CRDetailViewComponentCameraRepair)init
{
  v30.receiver = self;
  v30.super_class = (Class)CRDetailViewComponentCameraRepair;
  v2 = [(CRUDetailViewComponent *)&v30 init];
  uint64_t v3 = v2;
  if (!v2)
  {
LABEL_9:
    v4 = v3;
    goto LABEL_10;
  }
  if ([(CRUDetailViewComponent *)v2 deviceClass] != 3)
  {
    v5 = [(CRUDetailViewComponent *)v3 deviceHistory];
    v6 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v7 = [(CRUDetailViewComponent *)v3 claimCount];
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", [v5 checkUsedStatusFor:@"Camera" withHistory:v6 withClaimCount:v7]);

    if (_os_feature_enabled_impl()) {
      [(CRUDetailViewComponent *)v3 setIsUsed:1];
    }
    BOOL v8 = NSURL;
    v9 = [(CRUDetailViewComponent *)v3 locale];
    v10 = [v9 localizedStringWithKey:@"CAMERA_REPAIR_KB_URL" defaultString:@"CAMERA_REPAIR_KB_URL"];
    v11 = [v8 URLWithString:v10];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v11];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];
    [(CRUDetailViewComponent *)v3 setTitleText:v13];

    v14 = objc_opt_new();
    v15 = [(CRUDetailViewComponent *)v3 locale];
    v16 = [v15 localizedStringWithKey:@"GENUINE_CAMERA_DESC" defaultString:@"GENUINE_CAMERA_DESC"];
    v17 = (void *)[v16 mutableCopy];

    if ([(CRUDetailViewComponent *)v3 isUsed])
    {
      v18 = [(CRUDetailViewComponent *)v3 locale];
      v19 = [v18 localizedStringWithKey:@"USED" defaultString:@"USED"];
      [(CRUDetailViewComponent *)v3 setTitleText:v19];

      v20 = [(CRUDetailViewComponent *)v3 locale];
      v21 = [v20 localizedStringWithKey:@"USED_CAMERA_DESC" defaultString:@"USED_CAMERA_DESC"];
      uint64_t v22 = [v21 mutableCopy];

      v17 = (void *)v22;
    }
    v23 = [(CRUDetailViewComponent *)v3 deviceHistory];
    v24 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v25 = [(CRUDetailViewComponent *)v3 caaRepairHistoryDict];
    v26 = [v23 repairDateForComponent:@"Camera" withRCHLHistory:v24 withCAAHistory:v25];
    [(CRUDetailViewComponent *)v3 setRepairDate:v26];

    [(CRUDetailViewComponent *)v3 setInformativeText:v17];
    v27 = [(CRUDetailViewComponent *)v3 locale];
    v28 = [v27 localizedStringWithKey:@"CAMERA_FOOTER_LEARN_MORE" defaultString:@"CAMERA_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v28];

    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

@end