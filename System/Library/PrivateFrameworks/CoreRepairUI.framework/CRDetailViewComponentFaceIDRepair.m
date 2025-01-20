@interface CRDetailViewComponentFaceIDRepair
- (CRDetailViewComponentFaceIDRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentFaceIDRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self locale];
    v7 = [v6 localizedStringWithKey:@"TRUEDEPTH_COMPONENT" defaultString:@"TRUEDEPTH_COMPONENT"];
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

- (CRDetailViewComponentFaceIDRepair)init
{
  v36.receiver = self;
  v36.super_class = (Class)CRDetailViewComponentFaceIDRepair;
  v2 = [(CRUDetailViewComponent *)&v36 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [(CRUDetailViewComponent *)v2 deviceHistory];
    v5 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v6 = [(CRUDetailViewComponent *)v3 claimCount];
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", [v4 checkUsedStatusFor:@"FaceID" withHistory:v5 withClaimCount:v6]);

    if (_os_feature_enabled_impl()) {
      [(CRUDetailViewComponent *)v3 setIsUsed:1];
    }
    v7 = NSURL;
    BOOL v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"FACEID_REPAIR_KB_URL" defaultString:@"FACEID_REPAIR_KB_URL"];
    v10 = [v7 URLWithString:v9];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v10];

    v11 = objc_opt_new();
    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"GENUINE_FACEID_DESC" defaultString:@"GENUINE_FACEID_DESC"];
    v14 = (void *)[v13 mutableCopy];

    if ([(CRUDetailViewComponent *)v3 deviceClass] == 3)
    {
      v15 = NSURL;
      v16 = [(CRUDetailViewComponent *)v3 locale];
      v17 = [v16 localizedStringWithKey:@"FACEID_REPAIR_KB_URL_IPAD" defaultString:@"FACEID_REPAIR_KB_URL_IPAD"];
      v18 = [v15 URLWithString:v17];
      [(CRUDetailViewComponent *)v3 setKbArticleURL:v18];

      v19 = [(CRUDetailViewComponent *)v3 locale];
      v20 = [v19 localizedStringWithKey:@"GENUINE_FACEID_DESC_IPAD" defaultString:@"GENUINE_FACEID_DESC_IPAD"];
      uint64_t v21 = [v20 mutableCopy];

      v14 = (void *)v21;
    }
    v22 = [(CRUDetailViewComponent *)v3 locale];
    v23 = [v22 localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];
    [(CRUDetailViewComponent *)v3 setTitleText:v23];

    if ([(CRUDetailViewComponent *)v3 isUsed])
    {
      v24 = [(CRUDetailViewComponent *)v3 locale];
      v25 = [v24 localizedStringWithKey:@"USED" defaultString:@"USED"];
      [(CRUDetailViewComponent *)v3 setTitleText:v25];

      v26 = [(CRUDetailViewComponent *)v3 locale];
      v27 = [v26 localizedStringWithKey:@"USED_FACEID_DESC" defaultString:@"USED_FACEID_DESC"];
      uint64_t v28 = [v27 mutableCopy];

      v14 = (void *)v28;
    }
    v29 = [(CRUDetailViewComponent *)v3 deviceHistory];
    v30 = [(CRUDetailViewComponent *)v3 rchlRepairHistory];
    v31 = [(CRUDetailViewComponent *)v3 caaRepairHistoryDict];
    v32 = [v29 repairDateForComponent:@"FaceID" withRCHLHistory:v30 withCAAHistory:v31];
    [(CRUDetailViewComponent *)v3 setRepairDate:v32];

    [(CRUDetailViewComponent *)v3 setInformativeText:v14];
    v33 = [(CRUDetailViewComponent *)v3 locale];
    v34 = [v33 localizedStringWithKey:@"FACEID_FOOTER_LEARN_MORE" defaultString:@"FACEID_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v34];
  }
  return v3;
}

@end