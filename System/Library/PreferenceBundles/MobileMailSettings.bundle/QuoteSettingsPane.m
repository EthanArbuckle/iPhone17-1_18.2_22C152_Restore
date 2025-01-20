@interface QuoteSettingsPane
- (id)indentQuoteLevel:(id)a3;
- (id)specifiers;
- (void)setIndentQuoteLevel:(id)a3 withSpecifier:(id)a4;
@end

@implementation QuoteSettingsPane

- (void)setIndentQuoteLevel:(id)a3 withSpecifier:(id)a4
{
  id v8 = a3;
  unsigned int v5 = [v8 BOOLValue];
  v6 = +[NSUserDefaults em_userDefaults];
  [v6 setBool:v5 ^ 1 forKey:@"DisableQuoteIncrease"];

  v7 = [(QuoteSettingsPane *)self parentController];
  [v7 reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
}

- (id)indentQuoteLevel:(id)a3
{
  v3 = +[NSUserDefaults em_userDefaults];
  v4 = [v3 valueForKey:@"DisableQuoteIncrease"];

  LODWORD(v3) = [v4 BOOLValue];
  unsigned int v5 = +[NSNumber numberWithBool:v3 ^ 1];

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithName:0];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"QUOTE_SETTING_EXPLANATION" value:&stru_39200 table:@"Preferences"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"INCREASE_QUOTE_LEVEL" value:&stru_39200 table:@"Preferences"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setIndentQuoteLevel:withSpecifier:" get:"indentQuoteLevel:" detail:0 cell:6 edit:0];

    [v5 addObject:v11];
    v12 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

@end