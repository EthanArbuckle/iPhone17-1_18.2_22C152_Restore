@interface ISLanguageDetailController
- (id)specifiers;
- (void)changeLanguage:(id)a3;
- (void)viewDidLoad;
@end

@implementation ISLanguageDetailController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)ISLanguageDetailController;
  [(ISLanguageDetailController *)&v9 viewDidLoad];
  v3 = [(ISLanguageDetailController *)self specifier];
  v4 = [v3 name];
  v5 = +[NSLocale componentsFromLocaleIdentifier:v4];
  v6 = [v5 objectForKeyedSubscript:NSLocaleLanguageCode];

  v7 = +[IPLanguage languageWithIdentifier:v6];
  v8 = [v7 localizedStringForName];
  [(ISLanguageDetailController *)self setTitle:v8];
}

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v29 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(ISLanguageDetailController *)v2 specifier];
    uint64_t v6 = [v5 name];

    v7 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
    v8 = +[NSLocale localeWithLocaleIdentifier:v6];
    v28 = (void *)v6;
    v26 = +[NSLocale addLikelySubtagsForLocaleIdentifier:v6];
    objc_super v9 = +[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:");
    v46 = [v9 objectForKeyedSubscript:NSLocaleScriptCode];

    v10 = [v8 optionNameForSelectableScripts];
    v11 = +[PSSpecifier groupSpecifierWithID:@"SCRIPT" name:v10];

    v40 = v11;
    [v11 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v12 = [v8 explanationTextForSelectableScripts];

    if (v12)
    {
      v13 = [v8 explanationTextForSelectableScripts];
      [v40 setProperty:v13 forKey:PSFooterTextGroupKey];
    }
    [v4 addObject:v40];
    v27 = v8;
    [v8 selectableScriptCodes];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v47 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v47)
    {
      uint64_t v14 = *(void *)v49;
      uint64_t v37 = PSCellClassKey;
      uint64_t v34 = PSConfirmationTitleKey;
      uint64_t v35 = PSConfirmationPromptKey;
      uint64_t v32 = PSConfirmationCancelKey;
      uint64_t v33 = PSConfirmationOKKey;
      uint64_t v31 = PSConfirmationDestructiveKey;
      uint64_t v30 = PSRadioGroupCheckedSpecifierKey;
      v38 = v4;
      v39 = v2;
      uint64_t v36 = *(void *)v49;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v17 = [v7[243] displayNameForSelectableScriptCode:v16];
          if ([v16 isEqualToString:v46])
          {
            v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v2 set:0 get:0 detail:0 cell:3 edit:0];
            [v18 setIdentifier:v16];
            [v4 addObject:v18];
            [v40 setProperty:v18 forKey:v30];
          }
          else
          {
            v18 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v17 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
            [v18 setIdentifier:v16];
            [v18 setProperty:objc_opt_class() forKey:v37];
            v44 = +[ISInternationalViewController localizedRestartStringForCurrentDevice];
            v45 = v17;
            v53[0] = v44;
            v52[0] = v35;
            v52[1] = v34;
            v43 = +[NSBundle bundleForClass:objc_opt_class()];
            v42 = [v43 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
            v53[1] = v42;
            v52[2] = v33;
            v19 = +[NSBundle bundleForClass:objc_opt_class()];
            v20 = [v19 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
            v53[2] = v20;
            v52[3] = v32;
            v21 = +[NSBundle bundleForClass:objc_opt_class()];
            v22 = [v21 localizedStringForKey:@"CANCEL_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
            v53[3] = v22;
            v23 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];
            [v18 setupWithDictionary:v23];

            v17 = v45;
            uint64_t v14 = v36;

            id v4 = v38;
            v7 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;

            v2 = v39;
            [v18 setProperty:&__kCFBooleanTrue forKey:v31];
            [v18 setConfirmationAction:"changeLanguage:"];
            [v38 addObject:v18];
          }
        }
        id v47 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v47);
    }
    v24 = *(void **)&v2->PSListController_opaque[v29];
    *(void *)&v2->PSListController_opaque[v29] = v4;

    v3 = *(void **)&v2->PSListController_opaque[v29];
  }

  return v3;
}

- (void)changeLanguage:(id)a3
{
  id v4 = a3;
  v5 = [(ISLanguageDetailController *)self specifiers];
  uint64_t v6 = [v5 specifierForID:@"SCRIPT"];

  [v6 setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];
  [(ISLanguageDetailController *)self reloadSpecifier:v6];
  v7 = [(ISLanguageDetailController *)self specifier];
  v8 = [v7 name];

  objc_super v9 = +[NSLocale componentsFromLocaleIdentifier:v8];
  id v10 = [v9 mutableCopy];

  v11 = [v4 identifier];

  [v10 setObject:v11 forKeyedSubscript:NSLocaleScriptCode];
  v12 = +[NSLocale localeIdentifierFromComponents:v10];
  v13 = +[ISInternationalViewController preferredLanguages];
  id v14 = [v13 mutableCopy];

  objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "indexOfObject:", v8), v12);
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"CHANGE_UI_LANGUAGE_TEXT" value:&stru_31478 table:@"InternationalSettings"];
  v17 = +[NSLocale _deviceLanguage];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_14A9C;
  v19[3] = &unk_30D70;
  id v20 = v14;
  id v18 = v14;
  [(ISLanguageDetailController *)self showUpdatingLanguageViewWithLabel:v16 languageIdentifier:v17 completionBlock:v19];
}

@end