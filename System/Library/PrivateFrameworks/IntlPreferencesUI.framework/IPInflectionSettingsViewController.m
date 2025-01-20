@interface IPInflectionSettingsViewController
+ (id)pronounDisplayStringForInflection:(id)a3;
- (BOOL)canShareInflection;
- (IPInflectionSettingsViewControllerDelegate)delegate;
- (_NSAttributedStringGrammarInflection)inflection;
- (id)specifiers;
- (id)thirdPartyCanAccessUserInflection;
- (void)setCanShareInflection:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInflection:(id)a3;
- (void)setThirdPartyCanAccessUserInflection:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation IPInflectionSettingsViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)IPInflectionSettingsViewController;
  [(IPInflectionSettingsViewController *)&v4 viewDidLoad];
  v3 = [(IPInflectionSettingsViewController *)self table];
  [v3 setKeyboardDismissMode:1];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(IPInflectionSettingsViewController *)self loadSpecifiersFromPlistName:@"InflectionSettings" target:self];
    v6 = [v5 specifierForID:@"INFLECTION_GROUP"];
    v7 = [(IPInflectionSettingsViewController *)self inflection];
    uint64_t v8 = [v7 gender];

    v9 = objc_msgSend(NSString, "stringWithFormat:", @"GENDER_%ld_ID", v8);
    v10 = [v5 specifierForID:v9];
    [v6 setProperty:v10 forKey:*MEMORY[0x263F60200]];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IPInflectionSettingsViewController;
  [(IPInflectionSettingsViewController *)&v19 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(IPInflectionSettingsViewController *)self inflection];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08DA0]);
    [(IPInflectionSettingsViewController *)self setInflection:v8];
  }
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  [(IPInflectionSettingsViewController *)self getGroup:&v18 row:0 ofSpecifierID:@"INFLECTION_GROUP"];
  uint64_t v9 = [v6 section];
  if (v9 == v18)
  {
    v10 = [(IPInflectionSettingsViewController *)self specifierAtIndexPath:v6];
    v11 = [v10 propertyForKey:*MEMORY[0x263F60308]];
    uint64_t v12 = [v11 integerValue];
    v13 = [(IPInflectionSettingsViewController *)self inflection];
    [v13 setGender:v12];

    v14 = [(IPInflectionSettingsViewController *)self inflection];
    [v14 setEnglishCustomPronoun:0];

    [(IPInflectionSettingsViewController *)self reloadSpecifiers];
    v15 = [(IPInflectionSettingsViewController *)self delegate];

    if (v15)
    {
      v16 = [(IPInflectionSettingsViewController *)self delegate];
      v17 = [(IPInflectionSettingsViewController *)self inflection];
      [v16 inflectionSettingsViewController:self inflectionDidChange:v17];
    }
  }
}

- (id)thirdPartyCanAccessUserInflection
{
  v2 = NSNumber;
  BOOL v3 = [(IPInflectionSettingsViewController *)self canShareInflection];
  return (id)[v2 numberWithBool:v3];
}

- (void)setThirdPartyCanAccessUserInflection:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  -[IPInflectionSettingsViewController setCanShareInflection:](self, "setCanShareInflection:", [v7 BOOLValue]);
  v5 = [(IPInflectionSettingsViewController *)self delegate];

  if (v5)
  {
    id v6 = [(IPInflectionSettingsViewController *)self delegate];
    objc_msgSend(v6, "inflectionSettingViewController:shareSettingDidChange:", self, objc_msgSend(v7, "BOOLValue"));
  }
}

+ (id)pronounDisplayStringForInflection:(id)a3
{
  return (id)[a3 localizedShortDescription];
}

- (_NSAttributedStringGrammarInflection)inflection
{
  return self->_inflection;
}

- (void)setInflection:(id)a3
{
}

- (BOOL)canShareInflection
{
  return self->_canShareInflection;
}

- (void)setCanShareInflection:(BOOL)a3
{
  self->_canShareInflection = a3;
}

- (IPInflectionSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IPInflectionSettingsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inflection, 0);
}

@end