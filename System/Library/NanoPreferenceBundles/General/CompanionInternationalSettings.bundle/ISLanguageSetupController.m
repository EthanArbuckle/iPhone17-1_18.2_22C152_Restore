@interface ISLanguageSetupController
- (BOOL)disablesAutomaticKeyboardDismissal;
- (BOOL)isSettingDifferentLanguage;
- (ISLanguageSetupController)initWithOfficialLanguages;
- (ISLanguageViewController)listController;
- (int64_t)preferredStatusBarStyle;
- (void)commit;
- (void)handleAlertAction:(BOOL)a3;
- (void)saveLanguage:(BOOL)a3;
- (void)setLanguage:(id)a3 specifier:(id)a4;
- (void)setListController:(id)a3;
- (void)setupController;
@end

@implementation ISLanguageSetupController

- (ISLanguageSetupController)initWithOfficialLanguages
{
  return [(ISLanguageSetupController *)self init];
}

- (BOOL)isSettingDifferentLanguage
{
  v2 = self;
  v3 = [(ISLanguageSetupController *)self listController];
  v4 = [v3 checkedLanguageCode];
  LOBYTE(v2) = [v4 isEqualToString:v2->_languageToSet] ^ 1;

  return (char)v2;
}

- (void)commit
{
  if (self->_languageToSet)
  {
    if ([(ISLanguageSetupController *)self isSettingDifferentLanguage])
    {
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = [v3 localizedStringForKey:@"CHANGE_TO_%@_FOR_NEW_DEVICE_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
      v42 = +[NSLocale string:v4 withCapitalizedDisplayNamesForFirstLanguageIdentifier:self->_languageToSet secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      v5 = +[NSBundle bundleForClass:objc_opt_class()];
      v44 = [v5 localizedStringForKey:@"CANCEL_CHANGE_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];

      v6 = +[IPLanguageListManager manager];
      uint64_t v7 = [v6 systemDisplayLanguage];

      v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"USE_%@" value:&stru_2D040 table:@"InternationalSettings"];
      v46 = +[NSLocale string:v9 withCapitalizedDisplayNamesForFirstLanguageIdentifier:self->_languageToSet secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"USE_%@" value:&stru_2D040 table:@"InternationalSettings"];
      v45 = (void *)v7;
      id v47 = +[NSLocale string:v11 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v7 secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      id v12 = v42;
      uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
      v14 = [(id)v13 localizedStringForKey:@"WOULD_YOU_LIKE_TO_USE_%@_AS_PRIMARY_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
      v15 = +[NSLocale string:v14 withCapitalizedDisplayNamesForFirstLanguageIdentifier:self->_languageToSet secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      v16 = +[NSLocale baseSystemLanguages];
      v17 = +[NSLocale baseLanguageFromLanguage:self->_languageToSet];
      LOBYTE(v13) = [v16 containsObject:v17];

      if (v13)
      {
        v18 = v12;
        v19 = v12;
      }
      else
      {
        v20 = +[NSBundle bundleForClass:objc_opt_class()];
        v21 = +[ISInternationalViewController modelSpecificLocalizedStringKeyForKey:@"%@_IS_UNSUPPORTED_DEVICE_WILL_FALLBACK_TO_%@_WHERE_%@_IS_NOT_SUPPORTED"];
        [v20 localizedStringForKey:v21 value:&stru_2D040 table:@"InternationalSettings"];
        v22 = v41 = v12;
        uint64_t v43 = +[NSLocale string:v22 withCapitalizedDisplayNamesForFirstLanguageIdentifier:self->_languageToSet secondLanguageIdentifier:v45 thirdLanguageIdentifier:self->_languageToSet];

        v23 = +[NSBundle bundleForClass:objc_opt_class()];
        v24 = [v23 localizedStringForKey:@"PREFER_%@" value:&stru_2D040 table:@"InternationalSettings"];
        uint64_t v25 = +[NSLocale string:v24 withCapitalizedDisplayNamesForFirstLanguageIdentifier:self->_languageToSet secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

        v26 = +[NSBundle bundleForClass:objc_opt_class()];
        v27 = [v26 localizedStringForKey:@"PREFER_%@" value:&stru_2D040 table:@"InternationalSettings"];
        uint64_t v28 = +[NSLocale string:v27 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v45 secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

        v29 = +[NSBundle bundleForClass:objc_opt_class()];
        v19 = [v29 localizedStringForKey:@"ADD_PREFERRED_LANGUAGE_TITLE" value:&stru_2D040 table:@"InternationalSettings"];
        v18 = v41;

        v15 = (void *)v43;
        v46 = (void *)v25;
        id v47 = (id)v28;
      }
      v30 = +[UIDevice currentDevice];
      if (objc_msgSend(v30, "sf_isiPad")) {
        v31 = v19;
      }
      else {
        v31 = v15;
      }
      v32 = +[UIDevice currentDevice];
      if (objc_msgSend(v32, "sf_isiPad")) {
        v33 = v15;
      }
      else {
        v33 = 0;
      }
      v34 = +[UIDevice currentDevice];
      v35 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v31, v33, objc_msgSend(v34, "sf_isiPad"));

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_D588;
      v51[3] = &unk_2CBD8;
      v51[4] = self;
      v36 = +[UIAlertAction actionWithTitle:v46 style:2 handler:v51];
      [v35 addAction:v36];

      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_D594;
      v50[3] = &unk_2CBD8;
      v50[4] = self;
      v37 = +[UIAlertAction actionWithTitle:v47 style:2 handler:v50];
      [v35 addAction:v37];

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_D5A0;
      v49[3] = &unk_2CD78;
      v49[4] = self;
      v38 = +[UIAlertAction _actionWithTitle:v44 image:0 style:1 handler:0 shouldDismissHandler:v49];
      [v35 addAction:v38];

      v39 = [(ISLanguageSetupController *)self presentedViewController];

      if (v39)
      {
        v40 = [(ISLanguageSetupController *)self presentedViewController];
        [v40 presentViewController:v35 animated:1 completion:0];
      }
      else
      {
        [(ISLanguageSetupController *)self presentViewController:v35 animated:1 completion:0];
      }
    }
    else
    {
      id v48 = [(ISLanguageSetupController *)self listController];
      [v48 deselectHighlightedRow];
    }
  }
}

- (void)saveLanguage:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = +[COSInternationalController preferredLanguages];
  if (![v14 count]) {
    sub_1F01C();
  }
  if ([v14 count])
  {
    if (v3)
    {
      v5 = [(ISLanguageSetupController *)self parentController];
      [v5 setLanguage:self->_languageToSet];
    }
    else
    {
      if ([v14 containsObject:self->_languageToSet]) {
        sub_1F048();
      }
      v5 = +[NSMutableOrderedSet orderedSetWithArray:v14];
      v6 = self->_languageToSet;
      uint64_t v7 = +[NSLocale localeWithLocaleIdentifier:v6];
      v8 = [v7 regionCode];

      if (!v8)
      {
        v9 = +[COSInternationalController currentLocale];
        v10 = [v9 regionCode];
        uint64_t v11 = +[NSLocale languageFromLanguage:v6 byReplacingRegion:v10];

        v6 = (NSString *)v11;
      }
      [v5 addObject:v6];
      id v12 = [(ISLanguageSetupController *)self parentController];
      uint64_t v13 = [v5 array];
      [v12 setPreferredLanguages:v13];
    }
  }
}

- (void)setLanguage:(id)a3 specifier:(id)a4
{
  self->_languageToSet = (NSString *)[a3 copy];

  _objc_release_x1();
}

- (void)setupController
{
  id v6 = objc_alloc_init((Class)PSSpecifier);
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Language" value:&stru_2D040 table:@"InternationalSettings"];
  [v6 setName:v4];

  v5 = objc_alloc_init(ISLanguageViewController);
  [(ISLanguageViewController *)v5 setRootController:self];
  [(ISLanguageViewController *)v5 setSpecifier:v6];
  [(ISLanguageViewController *)v5 setParentController:self];
  [(ISLanguageSetupController *)self setListController:v5];
  [(ISLanguageSetupController *)self showController:v5];
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 0;
}

- (void)handleAlertAction:(BOOL)a3
{
  [(ISLanguageSetupController *)self saveLanguage:a3];
  v4 = [(ISLanguageSetupController *)self parentController];
  [v4 reloadSpecifiers];

  [(ISLanguageSetupController *)self dismissAnimated:1];
}

- (int64_t)preferredStatusBarStyle
{
  v2 = +[PSListController appearance];
  int64_t v3 = [v2 usesDarkTheme];

  return v3;
}

- (ISLanguageViewController)listController
{
  return self->_listController;
}

- (void)setListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listController, 0);

  objc_storeStrong((id *)&self->_languageToSet, 0);
}

@end