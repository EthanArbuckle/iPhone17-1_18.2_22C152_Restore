@interface CRUDetailViewComponent
- (BOOL)dataCollectionClassExist;
- (BOOL)isUsed;
- (CRRepairHistory)deviceHistory;
- (CRUDetailViewComponent)init;
- (MRLocalization)locale;
- (NSArray)rchlRepairHistory;
- (NSDictionary)caaRepairHistoryDict;
- (NSDictionary)claimCount;
- (NSString)buttonTitle;
- (NSString)componentName;
- (NSString)footerText;
- (NSString)informativeText;
- (NSString)repairDate;
- (NSString)titleText;
- (NSURL)kbArticleURL;
- (PSSpecifier)infoCollectionSpecifier;
- (id)componentRepairSpecifierForComponent:(id)a3 IsUsed:(BOOL)a4 repairDate:(id)a5;
- (id)componentSpecifierForComponent:(id)a3;
- (int)deviceClass;
- (void)handleNonGenuineComponentTap:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setCaaRepairHistoryDict:(id)a3;
- (void)setClaimCount:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setDataCollectionClassExist:(BOOL)a3;
- (void)setDeviceHistory:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setInfoCollectionSpecifier:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setIsUsed:(BOOL)a3;
- (void)setKbArticleURL:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRchlRepairHistory:(id)a3;
- (void)setRepairDate:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation CRUDetailViewComponent

- (CRUDetailViewComponent)init
{
  v28.receiver = self;
  v28.super_class = (Class)CRUDetailViewComponent;
  v2 = [(CRUDetailViewComponent *)&v28 init];
  if (v2)
  {
    v2->dataCollectionClassExist = objc_opt_class() != 0;
    kbArticleURL = v2->kbArticleURL;
    v2->kbArticleURL = 0;

    titleText = v2->titleText;
    v2->titleText = 0;

    componentName = v2->componentName;
    v2->componentName = 0;

    informativeText = v2->informativeText;
    v2->informativeText = 0;

    repairDate = v2->repairDate;
    v2->repairDate = 0;

    uint64_t v8 = objc_opt_new();
    locale = v2->locale;
    v2->locale = (MRLocalization *)v8;

    infoCollectionSpecifier = v2->infoCollectionSpecifier;
    v2->infoCollectionSpecifier = 0;

    v11 = (void *)MGCopyAnswer();
    v2->deviceClass = [v11 intValue];

    uint64_t v12 = objc_opt_new();
    deviceHistory = v2->deviceHistory;
    v2->deviceHistory = (CRRepairHistory *)v12;

    v14 = v2->deviceHistory;
    id v27 = 0;
    uint64_t v15 = [(CRRepairHistory *)v14 extractRCHLRepairHistoryAndClaimCount:&v27];
    id v16 = v27;
    rchlRepairHistory = v2->rchlRepairHistory;
    v2->rchlRepairHistory = (NSArray *)v15;

    uint64_t v18 = [v16 copy];
    claimCount = v2->claimCount;
    v2->claimCount = (NSDictionary *)v18;

    v20 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
    v21 = [v20 objectForKey:@"cachedCAACert"];
    caaRepairHistoryDict = v2->caaRepairHistoryDict;
    v2->caaRepairHistoryDict = 0;

    footerText = v2->footerText;
    v2->footerText = 0;

    if (v21 && [v21 length])
    {
      uint64_t v24 = [MEMORY[0x263F08AC0] propertyListWithData:v21 options:0 format:0 error:0];
      v25 = v2->caaRepairHistoryDict;
      v2->caaRepairHistoryDict = (NSDictionary *)v24;
    }
  }
  return v2;
}

- (void)handleNonGenuineComponentTap:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F352A8];
  id v4 = a3;
  id v7 = [v4 propertyForKey:v3];
  v5 = [v4 propertyForKey:*MEMORY[0x263F352A0]];

  v6 = [MEMORY[0x263F353C8] handlerWithItem:v7];
  [v6 handleAction:v5 completion:&unk_26ECC9418];
}

- (id)componentRepairSpecifierForComponent:(id)a3 IsUsed:(BOOL)a4 repairDate:(id)a5
{
  BOOL v5 = a4;
  id v59 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  v10 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"REPAIR RECORD"];
  v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  [v10 setProperty:v12 forKey:*MEMORY[0x263F600C0]];

  v13 = [(CRUDetailViewComponent *)self kbArticleURL];
  [v10 setProperty:v13 forKey:*MEMORY[0x263F600F0]];

  v14 = [(CRUDetailViewComponent *)self footerText];
  [v10 setProperty:v14 forKey:*MEMORY[0x263F600E8]];

  uint64_t v15 = [(CRUDetailViewComponent *)self footerText];
  id v16 = [(CRUDetailViewComponent *)self footerText];
  v61.location = [v15 rangeOfString:v16];
  v17 = NSStringFromRange(v61);
  [v10 setProperty:v17 forKey:*MEMORY[0x263F600D0]];

  v57 = v10;
  [v9 addObject:v10];
  uint64_t v18 = (void *)MEMORY[0x263F5FC40];
  v19 = [(CRUDetailViewComponent *)self locale];
  v20 = [v19 localizedStringWithKey:@"TYPE" defaultString:@"TYPE"];
  v21 = [v18 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:3 edit:0];

  v22 = [(CRUDetailViewComponent *)self locale];
  v23 = [v22 localizedStringWithKey:@"TYPE" defaultString:@"TYPE"];
  [v21 setName:v23];

  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];
  v25 = v9;
  [v21 setProperty:v24 forKey:@"CRImageAlertKey"];

  uint64_t v26 = objc_opt_class();
  uint64_t v58 = *MEMORY[0x263F5FFE0];
  objc_msgSend(v21, "setProperty:forKey:", v26);
  v56 = v21;
  [v9 addObject:v21];
  id v27 = (void *)MEMORY[0x263F5FC40];
  objc_super v28 = [(CRUDetailViewComponent *)self locale];
  v29 = [v28 localizedStringWithKey:@"STATUS" defaultString:@"STATUS"];
  v30 = [v27 preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:3 edit:0];

  v31 = [(CRUDetailViewComponent *)self locale];
  v32 = [v31 localizedStringWithKey:@"STATUS" defaultString:@"STATUS"];
  [v30 setName:v32];

  v33 = [(CRUDetailViewComponent *)self locale];
  v34 = v33;
  if (v5)
  {
    uint64_t v35 = [v33 localizedStringWithKey:@"USED" defaultString:@"USED"];

    v36 = objc_opt_new();
    v37 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.3.trianglepath"];
    [MEMORY[0x263F825C8] systemBlueColor];
  }
  else
  {
    uint64_t v35 = [v33 localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];

    v36 = objc_opt_new();
    v37 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.seal.fill"];
    [MEMORY[0x263F825C8] systemGreenColor];
  v38 = };
  v39 = [v37 imageWithTintColor:v38];

  v40 = [v39 imageWithRenderingMode:1];

  v54 = [MEMORY[0x263F81678] textAttachmentWithImage:v40];
  v41 = objc_msgSend(MEMORY[0x263F086A0], "attributedStringWithAttachment:");
  [v36 appendAttributedString:v41];
  v42 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  [v36 appendAttributedString:v42];

  v55 = (void *)v35;
  v43 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v35];
  [v36 appendAttributedString:v43];

  [v30 setProperty:v36 forKey:@"CRImageAlertKey"];
  [v30 setProperty:objc_opt_class() forKey:v58];
  [v25 addObject:v30];
  v44 = v59;
  if (v59)
  {
    v45 = (void *)MEMORY[0x263F5FC40];
    [(CRUDetailViewComponent *)self locale];
    v47 = v46 = v25;
    v48 = [v47 localizedStringWithKey:@"DATE" defaultString:@"DATE"];
    v49 = [v45 preferenceSpecifierNamed:v48 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v44 = v59;
    v25 = v46;
    v50 = [(CRUDetailViewComponent *)self locale];
    v51 = [v50 localizedStringWithKey:@"DATE" defaultString:@"DATE"];
    [v49 setName:v51];

    v52 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v59];
    [v49 setProperty:v52 forKey:@"CRImageAlertKey"];

    [v49 setProperty:objc_opt_class() forKey:v58];
    [v46 addObject:v49];
  }

  return v25;
}

- (id)componentSpecifierForComponent:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  v6 = [(CRUDetailViewComponent *)self footerText];

  if (v6)
  {
    id v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x263F600C0]];

    v10 = [(CRUDetailViewComponent *)self kbArticleURL];
    [v7 setProperty:v10 forKey:*MEMORY[0x263F600F0]];

    v11 = [(CRUDetailViewComponent *)self footerText];
    [v7 setProperty:v11 forKey:*MEMORY[0x263F600E8]];

    uint64_t v12 = [(CRUDetailViewComponent *)self footerText];
    v13 = [(CRUDetailViewComponent *)self footerText];
    v32.location = [v12 rangeOfString:v13];
    v14 = NSStringFromRange(v32);
    [v7 setProperty:v14 forKey:*MEMORY[0x263F600D0]];

    [v5 addObject:v7];
  }
  id v15 = objc_alloc_init(MEMORY[0x263F35388]);
  id v16 = (void *)MEMORY[0x263F35378];
  buttonTitle = self->buttonTitle;
  uint64_t v18 = [(CRUDetailViewComponent *)self kbArticleURL];
  v19 = [v16 actionWithLabel:buttonTitle url:v18];

  v20 = [(CRUDetailViewComponent *)self titleText];
  [v15 setTitle:v20];

  v21 = [(CRUDetailViewComponent *)self informativeText];
  [v15 setInformativeText:v21];

  v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v19];
  [v15 setActions:v22];

  v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26ECCB650 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v23 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v23 setProperty:v15 forKey:*MEMORY[0x263F352A8]];
  [v5 addObject:v23];
  uint64_t v24 = [(CRUDetailViewComponent *)self infoCollectionSpecifier];

  if (v24)
  {
    v25 = sub_239773918(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_239757000, v25, OS_LOG_TYPE_DEFAULT, "Has infomation collection specifier for component: %@", buf, 0xCu);
    }

    uint64_t v26 = [(CRUDetailViewComponent *)self infoCollectionSpecifier];
    [v5 addObject:v26];
  }

  return v5;
}

- (BOOL)dataCollectionClassExist
{
  return self->dataCollectionClassExist;
}

- (void)setDataCollectionClassExist:(BOOL)a3
{
  self->dataCollectionClassExist = a3;
}

- (NSURL)kbArticleURL
{
  return self->kbArticleURL;
}

- (void)setKbArticleURL:(id)a3
{
}

- (NSString)titleText
{
  return self->titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)informativeText
{
  return self->informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (MRLocalization)locale
{
  return self->locale;
}

- (void)setLocale:(id)a3
{
}

- (int)deviceClass
{
  return self->deviceClass;
}

- (PSSpecifier)infoCollectionSpecifier
{
  return self->infoCollectionSpecifier;
}

- (void)setInfoCollectionSpecifier:(id)a3
{
}

- (NSString)footerText
{
  return self->footerText;
}

- (void)setFooterText:(id)a3
{
}

- (CRRepairHistory)deviceHistory
{
  return self->deviceHistory;
}

- (void)setDeviceHistory:(id)a3
{
}

- (NSArray)rchlRepairHistory
{
  return self->rchlRepairHistory;
}

- (void)setRchlRepairHistory:(id)a3
{
}

- (NSDictionary)caaRepairHistoryDict
{
  return self->caaRepairHistoryDict;
}

- (void)setCaaRepairHistoryDict:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)repairDate
{
  return self->repairDate;
}

- (void)setRepairDate:(id)a3
{
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
}

- (BOOL)isUsed
{
  return self->isUsed;
}

- (void)setIsUsed:(BOOL)a3
{
  self->isUsed = a3;
}

- (NSDictionary)claimCount
{
  return self->claimCount;
}

- (void)setClaimCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->claimCount, 0);
  objc_storeStrong((id *)&self->componentName, 0);
  objc_storeStrong((id *)&self->repairDate, 0);
  objc_storeStrong((id *)&self->buttonTitle, 0);
  objc_storeStrong((id *)&self->caaRepairHistoryDict, 0);
  objc_storeStrong((id *)&self->rchlRepairHistory, 0);
  objc_storeStrong((id *)&self->deviceHistory, 0);
  objc_storeStrong((id *)&self->footerText, 0);
  objc_storeStrong((id *)&self->infoCollectionSpecifier, 0);
  objc_storeStrong((id *)&self->locale, 0);
  objc_storeStrong((id *)&self->informativeText, 0);
  objc_storeStrong((id *)&self->titleText, 0);

  objc_storeStrong((id *)&self->kbArticleURL, 0);
}

@end