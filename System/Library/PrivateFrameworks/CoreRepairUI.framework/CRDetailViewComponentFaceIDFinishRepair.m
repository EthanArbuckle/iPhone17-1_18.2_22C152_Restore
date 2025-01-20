@interface CRDetailViewComponentFaceIDFinishRepair
- (CRDetailViewComponentFaceIDFinishRepair)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentFaceIDFinishRepair

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [@"FaceID" stringByAppendingString:@"FinishRepair"];
    v7 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:v6];
    [v5 addObjectsFromArray:v7];

    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentFaceIDFinishRepair)init
{
  v25.receiver = self;
  v25.super_class = (Class)CRDetailViewComponentFaceIDFinishRepair;
  v2 = [(CRUDetailViewComponent *)&v25 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [(CRUDetailViewComponent *)v2 locale];
    v5 = [v4 localizedStringWithKey:@"NEW_TRUEDEPTH_CAMERA" defaultString:@"NEW_TRUEDEPTH_CAMERA"];
    [(CRUDetailViewComponent *)v3 setTitleText:v5];

    v6 = NSURL;
    v7 = [(CRUDetailViewComponent *)v3 locale];
    v8 = [v7 localizedStringWithKey:@"FINISH_REPAIR_KB_URL" defaultString:@"FINISH_REPAIR_KB_URL"];
    v9 = [v6 URLWithString:v8];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"FINISH_FACEID_DESC" defaultString:@"FINISH_FACEID_DESC"];

    v12 = [(CRUDetailViewComponent *)v3 locale];
    v13 = [v12 localizedStringWithKey:@"RESTART_FINISH_REPAIR" defaultString:@"RESTART_FINISH_REPAIR"];
    [(CRUDetailViewComponent *)v3 setButtonTitle:v13];

    v14 = [(CRUDetailViewComponent *)v3 locale];
    v15 = [v14 localizedStringWithKey:@"FACEID_FOOTER_LEARN_MORE" defaultString:@"FACEID_FOOTER_LEARN_MORE"];
    [(CRUDetailViewComponent *)v3 setFooterText:v15];

    if ([(CRUDetailViewComponent *)v3 deviceClass] == 3)
    {
      v16 = NSURL;
      v17 = [(CRUDetailViewComponent *)v3 locale];
      v18 = [v17 localizedStringWithKey:@"TRUEDEPTH_KB_URL_IPAD" defaultString:@"TRUEDEPTH_KB_URL_IPAD"];
      v19 = [v16 URLWithString:v18];
      [(CRUDetailViewComponent *)v3 setKbArticleURL:v19];

      v20 = [(CRUDetailViewComponent *)v3 locale];
      uint64_t v21 = [v20 localizedStringWithKey:@"FINISH_FACEID_DESC_IPAD" defaultString:@"FINISH_FACEID_DESC_IPAD"];

      v11 = (void *)v21;
    }
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];
    v22 = [(CRUDetailViewComponent *)v3 locale];
    v23 = [v22 localizedStringWithKey:@"TRUEDEPTH_COMPONENT" defaultString:@"TRUEDEPTH_COMPONENT"];
    [(CRUDetailViewComponent *)v3 setComponentName:v23];
  }
  return v3;
}

@end