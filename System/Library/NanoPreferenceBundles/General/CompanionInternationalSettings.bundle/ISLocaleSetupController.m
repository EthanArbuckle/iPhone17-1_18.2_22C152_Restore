@interface ISLocaleSetupController
- (BOOL)disablesAutomaticKeyboardDismissal;
- (ISLocaleController)listController;
- (ISRegion)selectedRegion;
- (void)commitRegion;
- (void)handleAlertActionAndChangeLanguage:(BOOL)a3;
- (void)setListController:(id)a3;
- (void)setSelectedRegion:(id)a3;
- (void)setupController;
@end

@implementation ISLocaleSetupController

- (void)commitRegion
{
  v3 = [(ISLocaleSetupController *)self selectedRegion];

  if (v3)
  {
    v4 = +[NSLocale _deviceLanguage];
    v5 = +[NSLocale localeWithLocaleIdentifier:v4];
    v6 = [(ISLocaleSetupController *)self selectedRegion];
    v7 = [v6 regionCode];
    uint64_t v58 = [v5 localizedStringForRegion:v7 context:5 short:0];

    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v59 = [v8 localizedStringForKey:@"CHANGE_REGION_TITLE" value:&stru_2D040 table:@"InternationalSettings"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v56 = [v9 localizedStringForKey:@"CANCEL_CHANGE_REGION" value:&stru_2D040 table:@"InternationalSettings"];

    v10 = +[UIDevice currentDevice];
    unsigned int v54 = objc_msgSend(v10, "sf_isiPad");

    id v11 = objc_alloc((Class)IPLanguageListManager);
    v12 = +[COSInternationalController preferredLanguages];
    id v13 = [v11 initWithPreferredLanguages:v12];
    v14 = [v13 systemDisplayLanguage];
    uint64_t v15 = +[NSLocale _distinctiveLanguageIdentifierForLanguageIdentifier:v14];

    v16 = [(ISLocaleSetupController *)self selectedRegion];
    v17 = [v16 regionCode];
    uint64_t v18 = +[NSLocale languageFromLanguage:v15 byReplacingRegion:v17];

    id v19 = objc_alloc((Class)IPLanguageListManager);
    uint64_t v65 = v18;
    v20 = +[NSArray arrayWithObjects:&v65 count:1];
    id v21 = [v19 initWithPreferredLanguages:v20];
    uint64_t v22 = [v21 systemDisplayLanguage];
    v23 = (void *)v22;
    v55 = (void *)v18;
    if (v22) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v18;
    }
    uint64_t v25 = +[NSLocale _distinctiveLanguageIdentifierForLanguageIdentifier:v24];

    v57 = (void *)v15;
    if (+[NSLocale _language:v15 usesSameLocalizationAs:v25])
    {
      v26 = (void *)v25;
      v27 = +[ISInternationalViewController localizedRestartStringForCurrentDevice];
      if (v54) {
        v28 = v59;
      }
      else {
        v28 = v27;
      }
      if (v54) {
        v29 = v27;
      }
      else {
        v29 = 0;
      }
      v30 = +[UIAlertController alertControllerWithTitle:v28 message:v29 preferredStyle:v54];
      v31 = +[NSBundle bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:@"CHANGE_TO_%@_AS_REGION" value:&stru_2D040 table:@"InternationalSettings"];
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v58);

      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_13314;
      v61[3] = &unk_2CBD8;
      v61[4] = self;
      v34 = +[UIAlertAction actionWithTitle:v33 style:2 handler:v61];
      [v30 addAction:v34];

      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_13320;
      v60[3] = &unk_2CD78;
      v60[4] = self;
      v35 = +[UIAlertAction _actionWithTitle:v56 image:0 style:1 handler:0 shouldDismissHandler:v60];
      [v30 addAction:v35];

      v36 = (void *)v58;
      v37 = (void *)v56;
    }
    else
    {
      v38 = +[NSBundle bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"CHANGE_TO_%@_AS_PRIMARY_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
      v27 = +[NSLocale string:v39 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v25 secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      +[NSBundle bundleForClass:objc_opt_class()];
      v41 = v40 = (void *)v25;
      v42 = [v41 localizedStringForKey:@"KEEP_%@_AS_PRIMARY_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
      v33 = +[NSLocale string:v42 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v15 secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      v43 = +[NSBundle bundleForClass:objc_opt_class()];
      v44 = +[ISInternationalViewController modelSpecificLocalizedStringKeyForKey:@"ASK_USE_%@_AS_DEVICE_LANGUAGE"];
      v45 = [v43 localizedStringForKey:v44 value:&stru_2D040 table:@"InternationalSettings"];
      v26 = v40;
      v46 = +[NSLocale string:v45 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v40 secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      if (v54) {
        v47 = v59;
      }
      else {
        v47 = v46;
      }
      if (v54) {
        v48 = v46;
      }
      else {
        v48 = 0;
      }
      v30 = +[UIAlertController alertControllerWithTitle:v47 message:v48 preferredStyle:v54];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_132C4;
      v64[3] = &unk_2CD78;
      v64[4] = self;
      v37 = (void *)v56;
      v49 = +[UIAlertAction _actionWithTitle:v56 image:0 style:1 handler:0 shouldDismissHandler:v64];
      [v30 addAction:v49];

      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_132FC;
      v63[3] = &unk_2CBD8;
      v63[4] = self;
      v50 = +[UIAlertAction actionWithTitle:v27 style:0 handler:v63];
      [v30 addAction:v50];

      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_13308;
      v62[3] = &unk_2CBD8;
      v62[4] = self;
      v51 = +[UIAlertAction actionWithTitle:v33 style:0 handler:v62];
      [v30 addAction:v51];

      v36 = (void *)v58;
    }

    v52 = [(ISLocaleSetupController *)self presentedViewController];

    if (v52)
    {
      v53 = [(ISLocaleSetupController *)self presentedViewController];
      [v53 presentViewController:v30 animated:1 completion:0];
    }
    else
    {
      [(ISLocaleSetupController *)self presentViewController:v30 animated:1 completion:0];
    }
  }
}

- (void)handleAlertActionAndChangeLanguage:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ISLocaleSetupController *)self selectedRegion];
  id v8 = [v5 regionCode];

  v6 = [(ISLocaleSetupController *)self parentController];
  v7 = [v6 localeSelector];
  [v7 setRegion:v8 changeLanguageVariant:v3];

  [v6 reloadSpecifiers];
  [v6 updateSpecifiersForLocaleRegionChange:v8];
  [(ISLocaleSetupController *)self dismissAnimated:1];
}

- (void)setupController
{
  id v6 = objc_alloc_init((Class)PSSpecifier);
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"LOCALE" value:&stru_2D040 table:@"InternationalSettings"];
  [v6 setName:v4];

  v5 = objc_alloc_init(ISLocaleController);
  [(ISLocaleController *)v5 setRootController:self];
  [(ISLocaleController *)v5 setSpecifier:v6];
  [(ISLocaleController *)v5 setParentController:self];
  [(ISLocaleSetupController *)self setListController:v5];
  [(ISLocaleSetupController *)self showController:v5];
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 0;
}

- (ISLocaleController)listController
{
  return self->_listController;
}

- (void)setListController:(id)a3
{
}

- (ISRegion)selectedRegion
{
  return self->_selectedRegion;
}

- (void)setSelectedRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRegion, 0);

  objc_storeStrong((id *)&self->_listController, 0);
}

@end