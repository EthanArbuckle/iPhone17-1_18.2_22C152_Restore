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

    v7 = +[NSLocale localeWithLocaleIdentifier:v6];
    v28 = (void *)v6;
    v26 = +[NSLocale addLikelySubtagsForLocaleIdentifier:v6];
    v8 = +[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:");
    v45 = [v8 objectForKeyedSubscript:NSLocaleScriptCode];

    objc_super v9 = [v7 optionNameForSelectableScripts];
    v10 = +[PSSpecifier groupSpecifierWithID:@"SCRIPT" name:v9];

    v40 = v10;
    [v10 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v11 = [v7 explanationTextForSelectableScripts];

    if (v11)
    {
      v12 = [v7 explanationTextForSelectableScripts];
      [v40 setProperty:v12 forKey:PSFooterTextGroupKey];
    }
    [v4 addObject:v40];
    v27 = v7;
    [v7 selectableScriptCodes];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v46 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v46)
    {
      uint64_t v13 = *(void *)v48;
      uint64_t v36 = PSCellClassKey;
      uint64_t v34 = PSConfirmationTitleKey;
      uint64_t v35 = PSConfirmationPromptKey;
      uint64_t v32 = PSConfirmationCancelKey;
      uint64_t v33 = PSConfirmationOKKey;
      uint64_t v31 = PSConfirmationDestructiveKey;
      uint64_t v30 = PSRadioGroupCheckedSpecifierKey;
      v38 = v4;
      v39 = v2;
      uint64_t v37 = *(void *)v48;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v16 = +[NSLocale displayNameForSelectableScriptCode:v15];
          if ([v15 isEqualToString:v45])
          {
            v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:v2 set:0 get:0 detail:0 cell:3 edit:0];
            [v17 setIdentifier:v15];
            [v17 setButtonAction:"changeLanguage:"];
            [v4 addObject:v17];
            [v40 setProperty:v17 forKey:v30];
          }
          else
          {
            v17 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v16 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
            [v17 setIdentifier:v15];
            [v17 setProperty:objc_opt_class() forKey:v36];
            v43 = +[ISInternationalViewController localizedRestartStringForCurrentDevice];
            v44 = v16;
            v52[0] = v43;
            v51[0] = v35;
            v51[1] = v34;
            v42 = +[NSBundle bundleForClass:objc_opt_class()];
            v18 = [v42 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
            v52[1] = v18;
            v51[2] = v33;
            v19 = +[NSBundle bundleForClass:objc_opt_class()];
            v20 = [v19 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
            v52[2] = v20;
            v51[3] = v32;
            v21 = +[NSBundle bundleForClass:objc_opt_class()];
            v22 = [v21 localizedStringForKey:@"CANCEL_CHANGE_LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
            v52[3] = v22;
            v23 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
            [v17 setupWithDictionary:v23];

            v16 = v44;
            uint64_t v13 = v37;

            id v4 = v38;
            v2 = v39;

            [v17 setProperty:&__kCFBooleanTrue forKey:v31];
            [v17 setConfirmationAction:"changeLanguage:"];
            [v38 addObject:v17];
          }
        }
        id v46 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v46);
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
  id v15 = [v5 specifierForID:@"SCRIPT"];

  [v15 setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];
  [(ISLanguageDetailController *)self reloadSpecifier:v15];
  uint64_t v6 = [(ISLanguageDetailController *)self specifier];
  v7 = [v6 name];

  v8 = +[NSLocale componentsFromLocaleIdentifier:v7];
  id v9 = [v8 mutableCopy];

  v10 = [v4 identifier];

  [v9 setObject:v10 forKeyedSubscript:NSLocaleScriptCode];
  v11 = +[NSLocale localeIdentifierFromComponents:v9];
  v12 = +[COSInternationalController preferredLanguages];
  id v13 = [v12 mutableCopy];

  objc_msgSend(v13, "replaceObjectAtIndex:withObject:", objc_msgSend(v13, "indexOfObject:", v7), v11);
  v14 = [(ISLanguageDetailController *)self parentController];
  [v14 setPreferredLanguages:v13];
}

@end