@interface BYODDomainSetupInstructionViewController
- (BYODDomainSetupInstructionViewController)initWithDnsRecords:(id)a3;
- (NSArray)dnsRecords;
- (id)dnsPropertyWithSpecifier:(id)a3;
- (id)specifiers;
- (void)_viewInstructionsOnWeb:(id)a3;
- (void)setDnsRecords:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODDomainSetupInstructionViewController

- (BYODDomainSetupInstructionViewController)initWithDnsRecords:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BYODDomainSetupInstructionViewController;
  result = [(BYODDomainSetupInstructionViewController *)&v5 init];
  if (result) {
    result->_dnsRecords = (NSArray *)a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BYODDomainSetupInstructionViewController;
  [(BYODDomainSetupInstructionViewController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_PAGE_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
  [(BYODDomainSetupInstructionViewController *)self setTitle:v4];
}

- (id)specifiers
{
  id v52 = objc_alloc_init((Class)NSMutableArray);
  v2 = +[PSSpecifier groupSpecifierWithID:@"DOMAIN_SETUP_VIEW_INSTRUCTION_PAGE_DESCRIPTION_GROUP_ID"];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v51 = v2;
  v4 = [v3 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_PAGE_DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v47 = PSFooterTextGroupKey;
  objc_msgSend(v2, "setProperty:forKey:", v4);

  [v52 addObject:v2];
  id v48 = objc_alloc_init((Class)NSMutableArray);
  objc_super v5 = +[PSSpecifier groupSpecifierWithID:@"DOMAIN_SETUP_VIEW_INSTRUCTION_ON_WEB_GROUP_ID"];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v50 = v5;
  v7 = [v6 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_ON_WEB_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v5 setProperty:v7 forKey:v47];

  [v48 addObject:v5];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_ON_WEB_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v10 setButtonAction:"_viewInstructionsOnWeb:"];
  [v48 addObject:v10];
  [v52 addObjectsFromArray:v48];
  v11 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
  id v12 = [v11 count];

  v49 = v10;
  if (v12)
  {
    unint64_t v13 = 0;
    uint64_t v59 = PSKeyNameKey;
    uint64_t v58 = PSIDKey;
    uint64_t v56 = PSCopyableCellKey;
    uint64_t v57 = PSCellClassKey;
    while (1)
    {
      v14 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
      v2 = v51;
      id v15 = [v14 count];

      if (v13 >= (unint64_t)v15) {
        break;
      }
      v16 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
      v55 = [v16 objectAtIndexedSubscript:v13];

      id v17 = objc_alloc_init((Class)NSMutableArray);
      v18 = [v55 dnsRecordType];
      uint64_t v19 = +[PSSpecifier groupSpecifierWithName:v18];

      v54 = (void *)v19;
      [v17 addObject:v19];
      v20 = +[NSBundle bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"BYOD_TYPE" value:&stru_B9F70 table:@"AccountPreferences"];
      v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:0 get:"dnsPropertyWithSpecifier:" detail:0 cell:4 edit:0];

      [v22 setProperty:@"DNSRecordType" forKey:v59];
      uint64_t v23 = +[NSString stringWithFormat:@"%@%lu", @"DNSRecordType", v13];
      [v22 setProperty:v23 forKey:v58];
      [v22 setProperty:objc_opt_class() forKey:v57];
      [v22 setProperty:&__kCFBooleanTrue forKey:v56];
      [v17 addObject:v22];
      v53 = (void *)v23;
      v24 = +[NSBundle bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"BYOD_HOST" value:&stru_B9F70 table:@"AccountPreferences"];
      v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:"dnsPropertyWithSpecifier:" detail:0 cell:4 edit:0];

      [v26 setProperty:@"DNSRecordHost" forKey:v59];
      v27 = +[NSString stringWithFormat:@"%@%lu", @"DNSRecordHost", v13];
      [v26 setProperty:v27 forKey:v58];
      [v26 setProperty:objc_opt_class() forKey:v57];
      [v26 setProperty:&__kCFBooleanTrue forKey:v56];
      [v17 addObject:v26];
      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"BYOD_VALUE" value:&stru_B9F70 table:@"AccountPreferences"];
      v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:"dnsPropertyWithSpecifier:" detail:0 cell:4 edit:0];

      [v30 setProperty:@"DNSRecordValue" forKey:v59];
      v31 = +[NSString stringWithFormat:@"%@%lu", @"DNSRecordValue", v13];
      [v30 setProperty:v31 forKey:v58];
      [v30 setProperty:objc_opt_class() forKey:v57];
      [v30 setProperty:&__kCFBooleanTrue forKey:v56];
      [v17 addObject:v30];
      v32 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
      v33 = [v32 objectAtIndexedSubscript:v13];
      unint64_t v34 = (unint64_t)[v33 priority];

      if ((v34 & 0x8000000000000000) == 0)
      {
        v35 = +[NSBundle bundleForClass:objc_opt_class()];
        v36 = [v35 localizedStringForKey:@"BYOD_PRIORITY" value:&stru_B9F70 table:@"AccountPreferences"];
        v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:0 get:"dnsPropertyWithSpecifier:" detail:0 cell:4 edit:0];

        [v37 setProperty:@"DNSRecordPriority" forKey:v59];
        v38 = +[NSString stringWithFormat:@"%@%lu", @"DNSRecordPriority", v13];
        [v37 setProperty:v38 forKey:v58];
        [v37 setProperty:objc_opt_class() forKey:v57];
        [v37 setProperty:&__kCFBooleanTrue forKey:v56];
        [v17 addObject:v37];
      }
      [v52 addObjectsFromArray:v17];

      ++v13;
      v10 = v49;
      objc_super v5 = v50;
    }
  }
  v39 = +[PSSpecifier groupSpecifierWithID:@"DOMAIN_SETUP_VIEW_INSTRUCTION_PAGE_NOTE_GROUP_ID"];
  v40 = +[NSBundle bundleForClass:objc_opt_class()];
  v41 = [v40 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_PAGE_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v39 setProperty:v41 forKey:v47];

  [v52 addObject:v39];
  id v42 = [v52 copy];
  uint64_t v43 = OBJC_IVAR___PSListController__specifiers;
  v44 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v42;

  id v45 = *(id *)&self->PSListController_opaque[v43];
  return v45;
}

- (void)_viewInstructionsOnWeb:(id)a3
{
  id v4 = objc_alloc((Class)SFSafariViewController);
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_ON_WEB_URL" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[NSURL URLWithString:v6];
  id v8 = [v4 initWithURL:v7];

  [v8 setDelegate:self];
  [v8 setModalPresentationStyle:2];
  [(BYODDomainSetupInstructionViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (id)dnsPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 properties];
  v6 = [v5 objectForKey:PSKeyNameKey];

  v7 = [v4 properties];
  id v8 = [v7 objectForKey:PSIDKey];

  v9 = objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v6, "length"));
  id v10 = [v9 integerValue];

  if (v6 == @"DNSRecordType")
  {
    id v12 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
    unint64_t v13 = [v12 objectAtIndexedSubscript:v10];
    uint64_t v14 = [v13 type];
  }
  else if (v6 == @"DNSRecordHost")
  {
    id v12 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
    unint64_t v13 = [v12 objectAtIndexedSubscript:v10];
    uint64_t v14 = [v13 host];
  }
  else if (v6 == @"DNSRecordValue")
  {
    id v12 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
    unint64_t v13 = [v12 objectAtIndexedSubscript:v10];
    uint64_t v14 = [v13 value];
  }
  else
  {
    if (v6 != @"DNSRecordPriority")
    {
      v11 = &stru_B9F70;
      goto LABEL_11;
    }
    id v12 = [(BYODDomainSetupInstructionViewController *)self dnsRecords];
    unint64_t v13 = [v12 objectAtIndexedSubscript:v10];
    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v13 priority]);
  }
  v11 = (__CFString *)v14;

LABEL_11:

  return v11;
}

- (NSArray)dnsRecords
{
  return self->_dnsRecords;
}

- (void)setDnsRecords:(id)a3
{
  self->_dnsRecords = (NSArray *)a3;
}

@end