@interface COSInternationalController
+ (id)currentLocale;
+ (id)deviceLanguageIdentifier;
+ (id)preferredLanguages;
+ (id)textColor;
- (BOOL)errorHasOccurred;
- (BOOL)hasFetchedLocalesInfo;
- (BOOL)shouldReloadSpecifiers;
- (COSInflectionSelector)inflectionSelector;
- (COSInternationalController)init;
- (COSLanguageSelector)languageSelector;
- (COSLocaleSelector)localeSelector;
- (COSMirrorController)mirrorController;
- (NSArray)availableLocaleIdentifiers;
- (NSArray)supportedCalendars;
- (NSArray)systemLanguages;
- (NSDictionary)defaultCalendars;
- (NSDictionary)numberingSystems;
- (NSSManager)nssManager;
- (PSSpecifier)remoteLoadingSpecifier;
- (id)calendar:(id)a3;
- (id)canonicalLocaleIdentifierWithValidCalendarForComponents:(id)a3;
- (id)currentInflectionDisplayString;
- (id)defaultCalendarForLocaleID:(id)a3;
- (id)effectiveCalendarFromLocale:(id)a3;
- (id)localizedDeviceDisplayLanguageNameFromPreferredLanguages:(id)a3;
- (id)localizedMirroringDetailFooter;
- (id)localizedRegionNameForLocale:(id)a3;
- (id)numberingSystemSpecifier;
- (id)numberingSystemsValues;
- (id)regionForCurrentLocale:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)specifiersInCustomSection;
- (id)validateLocale:(id)a3;
- (void)addNumberingSystemSpecifier:(id)a3;
- (void)changeLanguage:(id)a3;
- (void)handleLocalesInfo:(id)a3 error:(id)a4;
- (void)inflectionSettingViewController:(id)a3 shareSettingDidChange:(BOOL)a4;
- (void)inflectionSettingsViewController:(id)a3 inflectionDidChange:(id)a4;
- (void)queryGizmoForLocalesInfo;
- (void)reloadNumberingSystemSpecifier;
- (void)setAvailableLocaleIdentifiers:(id)a3;
- (void)setCalendar:(id)a3 specifier:(id)a4;
- (void)setErrorHasOccurred:(BOOL)a3;
- (void)setHasFetchedLocalesInfo:(BOOL)a3;
- (void)setInflectionSelector:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLanguageSelector:(id)a3;
- (void)setLocaleOnly:(id)a3;
- (void)setLocaleSelector:(id)a3;
- (void)setMirrorController:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setNumberingSystems:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setRemoteLoadingSpecifier:(id)a3;
- (void)setShouldReloadSpecifiers:(BOOL)a3;
- (void)setSystemLanguages:(id)a3;
- (void)startSpinnerInCellForSpecifier:(id)a3;
- (void)stopSpinner;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation COSInternationalController

- (COSInternationalController)init
{
  v10.receiver = self;
  v10.super_class = (Class)COSInternationalController;
  v2 = [(ISInternationalViewController *)&v10 init];
  if (v2)
  {
    v3 = +[COSMirrorController mirrorControllerWithInternationalController:v2];
    [(COSInternationalController *)v2 setMirrorController:v3];

    v4 = [[COSLanguageSelector alloc] initWithInternationalController:v2];
    [(COSInternationalController *)v2 setLanguageSelector:v4];

    v5 = [[COSLocaleSelector alloc] initWithInternationalController:v2];
    [(COSInternationalController *)v2 setLocaleSelector:v5];

    v6 = [[COSInflectionSelector alloc] initWithInternationalController:v2];
    [(COSInternationalController *)v2 setInflectionSelector:v6];

    uint64_t v7 = objc_opt_new();
    nssManager = v2->_nssManager;
    v2->_nssManager = (NSSManager *)v7;

    [(COSInternationalController *)v2 queryGizmoForLocalesInfo];
  }
  return v2;
}

- (void)queryGizmoForLocalesInfo
{
  objc_initWeak(&location, self);
  nssManager = self->_nssManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_DF98;
  v4[3] = &unk_2CDA0;
  objc_copyWeak(&v5, &location);
  [(NSSManager *)nssManager getLocalesInfo:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleLocalesInfo:(id)a3 error:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  self->_hasFetchedLocalesInfo = 1;
  if (!v27 || v6)
  {
    self->_errorHasOccurred = 1;
    NSLog(@"Error has occured: %@", v6);
    systemLanguages = self->_systemLanguages;
    self->_systemLanguages = 0;

    availableLocaleIdentifiers = self->_availableLocaleIdentifiers;
    self->_availableLocaleIdentifiers = 0;

    numberingSystems = self->_numberingSystems;
    self->_numberingSystems = 0;

    supportedCalendars = self->_supportedCalendars;
    self->_supportedCalendars = 0;

    defaultCalendars = self->_defaultCalendars;
    self->_defaultCalendars = 0;

    BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
  }
  else
  {
    self->_errorHasOccurred = 0;
    uint64_t v7 = [v27 objectForKeyedSubscript:kNSSLocalesInfoSystemLanguagesKey];
    v8 = self->_systemLanguages;
    self->_systemLanguages = v7;

    v9 = [v27 objectForKeyedSubscript:kNSSLocalesInfoAvailableLocaleIdentifiers];
    objc_super v10 = self->_availableLocaleIdentifiers;
    self->_availableLocaleIdentifiers = v9;

    v11 = [v27 objectForKeyedSubscript:kNSSLocalesInfoDefaultNumberingSystems];
    v12 = self->_numberingSystems;
    self->_numberingSystems = v11;

    v13 = [v27 objectForKeyedSubscript:kNSSLocalesInfoSupportedCalendars];
    v14 = self->_supportedCalendars;
    self->_supportedCalendars = v13;

    v15 = [v27 objectForKeyedSubscript:kNSSLocalesInfoDefaultCalendars];
    v16 = self->_defaultCalendars;
    self->_defaultCalendars = v15;

    if (self->_remoteLoadingSpecifier)
    {
      v17 = -[COSInternationalController indexPathForSpecifier:](self, "indexPathForSpecifier:");
      v18 = [(COSInternationalController *)self table];
      [(COSInternationalController *)self tableView:v18 didSelectRowAtIndexPath:v17];
    }
    [(COSInternationalController *)self reloadNumberingSystemSpecifier];
    v19 = [(COSInternationalController *)self specifierForID:@"CALENDAR"];
    [(COSInternationalController *)self reloadSpecifier:v19];

    v20 = [(COSInternationalController *)self mirrorController];
    unsigned int v21 = [v20 shouldShowMirroringAsEnabled];

    if (v21) {
      [(COSInternationalController *)self reloadSpecifiers];
    }
  }
  [(COSInternationalController *)self stopSpinner];
}

- (void)addNumberingSystemSpecifier:(id)a3
{
  id v7 = a3;
  v4 = [(COSInternationalController *)self numberingSystemsValues];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2)
  {
    id v6 = [(COSInternationalController *)self numberingSystemSpecifier];
    objc_msgSend(v7, "insertObject:atIndex:", v6, (char *)objc_msgSend(v7, "indexOfSpecifierWithID:", @"LOCALE") + 1);
  }
}

- (void)reloadNumberingSystemSpecifier
{
  v3 = [(COSInternationalController *)self specifierForID:@"NUMBERING_SYSTEM"];
  v4 = [(COSInternationalController *)self numberingSystemsValues];
  id v5 = [v4 count];

  if ((unint64_t)v5 < 2)
  {
    if (v3) {
      [(COSInternationalController *)self removeSpecifierID:@"NUMBERING_SYSTEM"];
    }
  }
  else
  {
    id v6 = [(COSInternationalController *)self mirrorController];
    unsigned __int8 v7 = [v6 shouldShowMirroringAsEnabled];

    if ((v7 & 1) == 0 && !v3)
    {
      v8 = [(COSInternationalController *)self numberingSystemSpecifier];
      [(COSInternationalController *)self insertSpecifier:v8 afterSpecifierID:@"LOCALE" animated:1];
    }
  }
  id v9 = [(COSInternationalController *)self specifierForID:@"NUMBERING_SYSTEM"];

  [(COSInternationalController *)self reloadSpecifier:v9];
}

- (id)numberingSystemSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:@"NUMBERING_SYSTEM" target:self set:"setNumberingSystem:specifier:" get:"numberingSystem:" detail:objc_opt_class() cell:2 edit:0];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"NUMBERING_SYSTEM" value:&stru_2D040 table:@"CompanionCustom"];
  [v2 setName:v4];

  [v2 setIdentifier:@"NUMBERING_SYSTEM"];
  [v2 setProperty:@"numberingSystemsTitles" forKey:PSTitlesDataSourceKey];
  [v2 setProperty:@"numberingSystemsValues" forKey:PSValuesDataSourceKey];

  return v2;
}

- (id)validateLocale:(id)a3
{
  id v4 = a3;
  id v5 = +[NSLocale componentsFromLocaleIdentifier:v4];
  id v6 = [v5 objectForKeyedSubscript:NSLocaleLanguageCode];

  if ([(NSArray *)self->_availableLocaleIdentifiers containsObject:v6])
  {
    id v7 = v4;
  }
  else
  {
    v8 = [(COSLanguageSelector *)self->_languageSelector appleLanguages];
    if (![v8 count]) {
      sub_1F074();
    }
    v20 = v6;
    id v21 = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v15 = +[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", v14, v20);
          v16 = [v15 objectForKeyedSubscript:NSLocaleLanguageCode];

          if ([(NSArray *)self->_availableLocaleIdentifiers containsObject:v16])
          {
            id v4 = v21;
            id v7 = +[NSLocale canonicalLocaleIdentifier:v21 withNewLanguageIdentifier:v14];

            goto LABEL_14;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v17 = [(COSLocaleSelector *)self->_localeSelector currentLocale];
    v18 = [v17 localeIdentifier];
    id v7 = +[NSLocale canonicalLocaleIdentifierFromString:v18];

    id v4 = v21;
LABEL_14:
    id v6 = v20;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COSInternationalController *)self indexForIndexPath:v7];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_17;
  }
  id v9 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  id v10 = [v9 identifier];
  if ([v10 isEqualToString:@"MIRROR_MY_COMPANION_ID"])
  {
  }
  else
  {
    id v11 = [v9 identifier];
    unsigned int v12 = [v11 isEqualToString:@"CUSTOM_ID"];

    if (!v12) {
      goto LABEL_11;
    }
  }
  v13 = [v9 identifier];
  id v14 = [v13 isEqualToString:@"MIRROR_MY_COMPANION_ID"];

  v15 = [(COSInternationalController *)self mirrorController];
  [v15 setMirrorSettings:v14];

  if (v14)
  {
    v16 = [(COSInternationalController *)self languageSelector];
    v17 = +[NSLocale preferredLanguages];
    [v16 setLanguages:v17];

    v18 = [(COSInternationalController *)self localeSelector];
    v19 = +[NSLocale preferredLocale];
    v20 = [v19 localeIdentifier];
    [v18 setLocale:v20];

    id v21 = [(COSInternationalController *)self inflectionSelector];
    long long v22 = +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
    [v21 setInflection:v22];

    long long v23 = [(COSInternationalController *)self inflectionSelector];
    objc_msgSend(v23, "setCanShareInflectionWithApps:", +[_NSAttributedStringGrammarInflection _thirdPartyApplicationsCanAccessUserInflection](_NSAttributedStringGrammarInflection, "_thirdPartyApplicationsCanAccessUserInflection"));

    long long v24 = [(COSInternationalController *)self navigationItem];
    [v24 setRightBarButtonItem:0];
LABEL_9:

    goto LABEL_10;
  }
  long long v25 = [(id)objc_opt_class() preferredLanguages];
  id v26 = [v25 count];

  if ((unint64_t)v26 >= 2)
  {
    long long v24 = [(COSInternationalController *)self editButtonItem];
    id v27 = [(COSInternationalController *)self navigationItem];
    [v27 setRightBarButtonItem:v24];

    goto LABEL_9;
  }
LABEL_10:
  [(COSInternationalController *)self reloadSpecifiers];
LABEL_11:
  if (self->_hasFetchedLocalesInfo && !self->_errorHasOccurred)
  {
    [(COSInternationalController *)self stopSpinner];
    v28.receiver = self;
    v28.super_class = (Class)COSInternationalController;
    [(COSInternationalController *)&v28 tableView:v6 didSelectRowAtIndexPath:v7];
  }
  else
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    [(COSInternationalController *)self startSpinnerInCellForSpecifier:v9];
    if (self->_errorHasOccurred) {
      [(COSInternationalController *)self queryGizmoForLocalesInfo];
    }
  }

LABEL_17:
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers]
    || [(COSInternationalController *)self shouldReloadSpecifiers])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [(COSInternationalController *)self loadSpecifiersFromPlistName:@"Companion" target:self bundle:v4];

    id v6 = [v5 specifierForID:BPSMirrorGroupID];
    id v7 = [(COSInternationalController *)self mirrorController];
    unsigned int v8 = [v7 shouldShowMirroringAsEnabled];

    if (v8)
    {
      id v9 = [v5 specifierForID:BPSMirrorSwitchID];
      [v6 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
      id v10 = [(COSInternationalController *)self localizedMirroringDetailFooter];
      [v6 setProperty:v10 forKey:PSFooterTextGroupKey];

      id v11 = [(COSInternationalController *)self navigationItem];
      [v11 setRightBarButtonItem:0];
    }
    else
    {
      if (COSActivePairingIsTinker())
      {
        [v5 removeAllObjects];
      }
      else
      {
        unsigned int v12 = [v5 specifierForID:BPSMirrorSwitchCustomID];
        [v6 setProperty:v12 forKey:PSRadioGroupCheckedSpecifierKey];
      }
      id v9 = [(COSInternationalController *)self specifiersInCustomSection];
      [v5 addObjectsFromArray:v9];
      v13 = [(id)objc_opt_class() preferredLanguages];
      id v14 = [v13 count];

      if ((unint64_t)v14 < 2)
      {
        v15 = [(COSInternationalController *)self navigationItem];
        [v15 setRightBarButtonItem:0];
      }
      else
      {
        v15 = [(COSInternationalController *)self editButtonItem];
        v16 = [(COSInternationalController *)self navigationItem];
        [v16 setRightBarButtonItem:v15];
      }
      [(ISInternationalViewController *)self addLanguagesToSpecifiers:v5];
      if (self->_hasFetchedLocalesInfo) {
        [(COSInternationalController *)self addNumberingSystemSpecifier:v5];
      }
    }

    v17 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v5;
  }
  v18 = *(void **)&self->super.PSListController_opaque[v3];

  return v18;
}

- (id)specifiersInCustomSection
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(COSInternationalController *)self loadSpecifiersFromPlistName:@"CompanionCustom" target:self bundle:v3];

  id v5 = [(COSInternationalController *)self languageSelector];
  id v6 = [v5 appleLanguages];
  if (!+[_NSAttributedStringGrammarInflection _canSelectUserInflectionWithPreferredLanguages:v6])
  {

    goto LABEL_5;
  }
  unsigned __int8 v7 = COSActivePairingIsTinker();

  if (v7)
  {
LABEL_5:
    objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v4, "indexOfSpecifierWithID:", @"INFLECTION_GROUP"));
    objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v4, "indexOfSpecifierWithID:", @"INFLECTION_CELL"));
  }

  return v4;
}

- (void)startSpinnerInCellForSpecifier:(id)a3
{
  id v4 = a3;
  [(COSInternationalController *)self stopSpinner];
  id v8 = [v4 propertyForKey:PSTableCellKey];
  if (v8)
  {
    id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    [v8 setForceHideDisclosureIndicator:1];
    [v8 setAccessoryView:v5];
    id v6 = [v8 detailTextLabel];
    [v6 setHidden:1];

    [(COSInternationalController *)self reloadSpecifier:v4];
  }
  remoteLoadingSpecifier = self->_remoteLoadingSpecifier;
  self->_remoteLoadingSpecifier = (PSSpecifier *)v4;
}

- (void)stopSpinner
{
  remoteLoadingSpecifier = self->_remoteLoadingSpecifier;
  if (remoteLoadingSpecifier)
  {
    id v6 = [(PSSpecifier *)remoteLoadingSpecifier propertyForKey:PSTableCellKey];
    [v6 setAccessoryView:0];
    [v6 setForceHideDisclosureIndicator:0];
    id v4 = [v6 detailTextLabel];
    [v4 setHidden:0];

    id v5 = self->_remoteLoadingSpecifier;
    self->_remoteLoadingSpecifier = 0;
  }
}

- (id)localizedDeviceDisplayLanguageNameFromPreferredLanguages:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() deviceLanguageFrom:v4];

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1F0A0();
  }
  id v6 = [(COSInternationalController *)self localeSelector];
  unsigned __int8 v7 = [v6 currentLocale];
  id v8 = [v7 regionCode];

  id v9 = +[NSLocale localeWithLocaleIdentifier:v5];
  id v10 = [v9 regionCode];

  if ([v8 isEqualToString:v10])
  {
    uint64_t v11 = +[NSLocale baseLanguageFromLanguage:v5];

    id v5 = (void *)v11;
  }
  unsigned int v12 = +[IPLanguage languageWithIdentifier:v5];
  v13 = [v12 localizedStringForName];

  return v13;
}

- (void)setLanguage:(id)a3
{
  id v14 = a3;
  id v4 = +[NSLocale localeWithLocaleIdentifier:v14];
  id v5 = [v4 regionCode];

  id v6 = v14;
  if (!v5)
  {
    unsigned __int8 v7 = [(COSInternationalController *)self localeSelector];
    id v8 = [v7 currentLocale];
    id v9 = [v8 regionCode];
    id v6 = +[NSLocale languageFromLanguage:v14 byReplacingRegion:v9];
  }
  id v10 = [(COSInternationalController *)self languageSelector];
  uint64_t v11 = [v10 appleLanguages];

  unsigned int v12 = +[NSLocale languageArrayAfterSettingLanguage:v6 fallback:0 toLanguageArray:v11];
  if ([v12 count] && (objc_msgSend(v11, "isEqualToArray:", v12) & 1) == 0) {
    [(COSInternationalController *)self setPreferredLanguages:v12];
  }
  v13 = [(COSInternationalController *)self localeSelector];
  [v13 setLocaleFromLanguageIdentifier:v14];
}

- (void)setPreferredLanguages:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableOrderedSet orderedSet];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v10), (void)v16);
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    unsigned int v12 = [(COSInternationalController *)self languageSelector];
    v13 = [v5 array];
    [v12 setLanguages:v13];

    [(ISInternationalViewController *)self setUpdatedAppleLanguages:0];
  }
  id v14 = [(COSInternationalController *)self localeSelector];
  v15 = [v5 firstObject];
  [v14 setLocaleFromLanguageIdentifier:v15];
}

- (void)setLocaleOnly:(id)a3
{
  id v4 = a3;
  id v5 = [(COSInternationalController *)self localeSelector];
  [v5 setLocaleOnly:v4];
}

- (id)currentInflectionDisplayString
{
  v2 = [(COSInternationalController *)self inflectionSelector];
  uint64_t v3 = [v2 currentInflection];
  id v4 = [v3 localizedShortDescription];

  return v4;
}

- (id)selectSpecifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)COSInternationalController;
  id v4 = a3;
  id v5 = [(COSInternationalController *)&v12 selectSpecifier:v4];
  id v6 = objc_msgSend(v4, "detailControllerClass", v12.receiver, v12.super_class);

  if (v6 == (id)objc_opt_class())
  {
    id v7 = v5;
    id v8 = [(COSInternationalController *)self inflectionSelector];
    uint64_t v9 = [v8 currentInflection];
    [v7 setInflection:v9];

    id v10 = [(COSInternationalController *)self inflectionSelector];
    objc_msgSend(v7, "setCanShareInflection:", objc_msgSend(v10, "canShareInflectionWithApps"));

    [v7 setDelegate:self];
  }

  return v5;
}

- (void)inflectionSettingsViewController:(id)a3 inflectionDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(COSInternationalController *)self inflectionSelector];
  [v6 setInflection:v5];

  [(COSInternationalController *)self reloadSpecifiers];
}

- (void)inflectionSettingViewController:(id)a3 shareSettingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(COSInternationalController *)self inflectionSelector];
  [v6 setCanShareInflectionWithApps:v4];

  [(COSInternationalController *)self reloadSpecifiers];
}

- (id)localizedRegionNameForLocale:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 regionCode];
  }
  else
  {
    id v5 = 0;
  }
  if (![(__CFString *)v5 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1F128();
    }

    id v5 = @"US";
  }
  id v6 = +[NSLocale currentLocale];
  id v7 = [v6 localizedStringForRegion:v5 context:3 short:0];

  return v7;
}

- (id)regionForCurrentLocale:(id)a3
{
  BOOL v4 = [(COSInternationalController *)self localeSelector];
  id v5 = [v4 currentLocale];

  id v6 = [(COSInternationalController *)self localizedRegionNameForLocale:v5];

  return v6;
}

- (void)setCalendar:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(COSInternationalController *)self localeSelector];
  [v6 setLocaleFromCalendarID:v5];
}

- (id)effectiveCalendarFromLocale:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localeIdentifier];
  id v6 = +[NSLocale componentsFromLocaleIdentifier:v5];

  id v7 = [v6 objectForKey:@"calendar"];
  if (!v7)
  {
    id v8 = [v4 localeIdentifier];
    id v7 = [(COSInternationalController *)self defaultCalendarForLocaleID:v8];
  }
  if (![(NSArray *)self->_supportedCalendars containsObject:v7])
  {
    uint64_t v9 = NSCalendarIdentifierGregorian;

    id v7 = v9;
  }

  return v7;
}

- (id)calendar:(id)a3
{
  id v4 = [(COSInternationalController *)self localeSelector];
  id v5 = [v4 currentLocale];
  id v6 = [(COSInternationalController *)self effectiveCalendarFromLocale:v5];

  return v6;
}

- (id)defaultCalendarForLocaleID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSLocale localeWithLocaleIdentifier:v4];
  id v6 = [v5 regionCode];

  if (!v6
    || (defaultCalendars = self->_defaultCalendars,
        [@"*_" stringByAppendingString:v6],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(NSDictionary *)defaultCalendars objectForKeyedSubscript:v8],
        uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    id v10 = +[NSLocale componentsFromLocaleIdentifier:v4];
    uint64_t v11 = objc_opt_new();
    objc_super v12 = [v10 objectForKeyedSubscript:NSLocaleLanguageCode];
    [v11 setObject:v12 forKeyedSubscript:NSLocaleLanguageCode];

    if (v6) {
      [v11 setObject:v6 forKeyedSubscript:NSLocaleCountryCode];
    }
    v13 = [v10 objectForKeyedSubscript:NSLocaleScriptCode];

    if (v13)
    {
      id v14 = [v10 objectForKeyedSubscript:NSLocaleScriptCode];
      [v11 setObject:v14 forKeyedSubscript:NSLocaleScriptCode];
    }
    v15 = [v10 objectForKeyedSubscript:NSLocaleVariantCode];

    if (v15)
    {
      long long v16 = [v10 objectForKeyedSubscript:NSLocaleVariantCode];
      [v11 setObject:v16 forKeyedSubscript:NSLocaleVariantCode];
    }
    long long v17 = +[NSLocale canonicalLocaleIdentifierFromComponents:v11];
    uint64_t v9 = [(NSDictionary *)self->_defaultCalendars objectForKeyedSubscript:v17];

    if (!v9) {
      uint64_t v9 = NSCalendarIdentifierGregorian;
    }
  }

  return v9;
}

- (id)canonicalLocaleIdentifierWithValidCalendarForComponents:(id)a3
{
  id v4 = a3;
  id v5 = +[NSLocale canonicalLocaleIdentifierFromComponents:v4];
  id v6 = [(COSInternationalController *)self defaultCalendarForLocaleID:v5];
  id v7 = [v4 objectForKey:@"calendar"];

  if (v7)
  {
    id v8 = [v4 objectForKey:@"calendar"];
    unsigned int v9 = [v8 isEqualToString:v6];

    if (!v9) {
      goto LABEL_7;
    }
    [v4 removeObjectForKey:@"calendar"];
  }
  else
  {
    if ([(NSArray *)self->_supportedCalendars containsObject:v6]) {
      goto LABEL_7;
    }
    [v4 setObject:NSCalendarIdentifierGregorian forKey:@"calendar"];
  }
  uint64_t v10 = +[NSLocale canonicalLocaleIdentifierFromComponents:v4];

  id v5 = (void *)v10;
LABEL_7:

  return v5;
}

- (id)numberingSystemsValues
{
  id v3 = [(COSInternationalController *)self localeSelector];
  id v4 = [v3 currentLocale];
  id v5 = [v4 localeIdentifier];

  if ([v5 isEqualToString:@"root"])
  {
    id v6 = 0;
  }
  else
  {
    while (1)
    {
      id v7 = [(COSInternationalController *)self numberingSystems];
      id v6 = [v7 objectForKeyedSubscript:v5];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v8 = +[IntlUtility parentLocaleIdentifierForIdentifier:v5];

      id v5 = v8;
      if ([v8 isEqualToString:@"root"])
      {
        id v6 = 0;
        id v5 = v8;
        break;
      }
    }
  }

  return v6;
}

- (id)localizedMirroringDetailFooter
{
  id v3 = +[NSLocale preferredLanguages];
  id v4 = [v3 count];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = v5;
  if ((unint64_t)v4 <= 1) {
    CFStringRef v7 = @"FOOTER_LINE_FORMAT_WITH_BULLET";
  }
  else {
    CFStringRef v7 = @"FOOTER_LINE_FORMAT";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_2D040 table:@"Companion"];

  v61 = self;
  uint64_t v9 = [(COSInternationalController *)self localizedDeviceDisplayLanguageNameFromPreferredLanguages:v3];
  uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"LANGUAGE" value:&stru_2D040 table:@"InternationalSettings"];
  objc_super v12 = (void *)v11;
  if (v9) {
    CFStringRef v13 = (const __CFString *)v9;
  }
  else {
    CFStringRef v13 = &stru_2D040;
  }
  v59 = (void *)v9;
  id v14 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", v8, v11, v13);

  v60 = v3;
  v62 = (void *)v8;
  v64 = v14;
  if ((unint64_t)[v3 count] >= 2)
  {
    [v14 appendString:@"\n"];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v16 = [v15 localizedStringForKey:@"PREFERRED_LANGUAGES" value:&stru_2D040 table:@"InternationalSettings"];
    objc_msgSend(v14, "appendFormat:", v8, v16, &stru_2D040);

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v3;
    id v17 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v66;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v66 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          long long v22 = +[NSLocale preferredLocale];
          long long v23 = [v22 regionCode];

          long long v24 = +[NSLocale localeWithLocaleIdentifier:v21];
          long long v25 = [v24 regionCode];

          if (v25)
          {
            id v26 = [v24 regionCode];
          }
          else
          {
            id v26 = v23;
          }
          id v27 = v26;
          id v28 = v21;
          if ([v27 isEqualToString:v23])
          {
            uint64_t v29 = +[NSLocale baseLanguageFromLanguage:v28];

            id v28 = (id)v29;
          }
          v30 = +[IPLanguage languageWithIdentifier:v28];
          v31 = [v30 localizedStringForName];
          [v64 appendFormat:@"• %@\n", v31];
        }
        id v18 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v18);
    }

    id v14 = v64;
    [v64 appendString:@"\n"];
    uint64_t v8 = (uint64_t)v62;
  }
  v32 = +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
  v33 = v32;
  if (v32)
  {
    v34 = [v32 localizedShortDescription];
    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 localizedStringForKey:@"INFLECTION" value:&stru_2D040 table:@"InternationalSettings"];
    objc_msgSend(v14, "appendFormat:", v8, v36, v34);
  }
  v37 = +[NSLocale preferredLocale];
  v38 = [(COSInternationalController *)v61 localizedRegionNameForLocale:v37];
  v39 = +[NSBundle bundleForClass:objc_opt_class()];
  v40 = [v39 localizedStringForKey:@"LOCALE" value:&stru_2D040 table:@"InternationalSettings"];
  objc_msgSend(v14, "appendFormat:", v8, v40, v38);

  v41 = [v37 localeIdentifier];
  v42 = +[IntlUtility numberingSystemsForLocaleID:v41];

  if ((unint64_t)[v42 count] >= 2)
  {
    v43 = [v37 localeIdentifier];
    v44 = +[NSLocale componentsFromLocaleIdentifier:v43];

    v45 = [v44 objectForKey:@"numbers"];
    if (!v45)
    {
      v46 = [v37 localeIdentifier];
      v45 = +[IntlUtility defaultNumberingSystemForLocaleID:v46];
    }
    v47 = [v37 localeIdentifier];
    v48 = +[IntlUtility shortDisplayNameForNumberingSystemWithIdentifier:v45 localeIdentifier:v47];

    v49 = +[NSBundle bundleForClass:objc_opt_class()];
    v50 = [v49 localizedStringForKey:@"NUMBERING_SYSTEM" value:&stru_2D040 table:@"InternationalSettings"];
    objc_msgSend(v64, "appendFormat:", v62, v50, v48);
  }
  if (qword_34608[0] != -1) {
    dispatch_once(qword_34608, &stru_2CDC0);
  }
  v51 = +[NSBundle bundleForClass:objc_opt_class()];
  v52 = (void *)qword_34600;
  v53 = [(COSInternationalController *)v61 effectiveCalendarFromLocale:v37];
  v54 = [v52 objectForKeyedSubscript:v53];
  v55 = [v51 localizedStringForKey:v54 value:&stru_2D040 table:@"InternationalCalendar"];

  v56 = +[NSBundle bundleForClass:objc_opt_class()];
  v57 = [v56 localizedStringForKey:@"CALENDAR" value:&stru_2D040 table:@"InternationalSettings"];
  objc_msgSend(v64, "appendFormat:", v62, v57, v55);

  return v64;
}

+ (id)preferredLanguages
{
  v2 = [[COSLanguageSelector alloc] initWithInternationalController:0];
  id v3 = [(COSLanguageSelector *)v2 appleLanguages];

  return v3;
}

+ (id)currentLocale
{
  v2 = [[COSLocaleSelector alloc] initWithInternationalController:0];
  id v3 = [(COSLocaleSelector *)v2 currentLocale];

  return v3;
}

+ (id)deviceLanguageIdentifier
{
  id v3 = [a1 preferredLanguages];
  id v4 = [a1 deviceLanguageFrom:v3];

  return v4;
}

- (void)changeLanguage:(id)a3
{
  id v4 = [(COSInternationalController *)self languageSelector];
  id v5 = [(ISInternationalViewController *)self updatedAppleLanguages];
  [v4 setLanguages:v5];

  id v6 = [(COSInternationalController *)self localeSelector];
  CFStringRef v7 = [(ISInternationalViewController *)self updatedAppleLanguages];
  uint64_t v8 = [v7 firstObject];
  [v6 setLocaleFromLanguageIdentifier:v8];

  [(ISInternationalViewController *)self setUpdatedAppleLanguages:0];
  [(ISInternationalViewController *)self setEditing:0 animated:1];

  [(COSInternationalController *)self reloadSpecifiers];
}

+ (id)textColor
{
  return (id)_BPSTextColor(a1, a2);
}

- (NSArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void)setSystemLanguages:(id)a3
{
}

- (NSArray)availableLocaleIdentifiers
{
  return self->_availableLocaleIdentifiers;
}

- (void)setAvailableLocaleIdentifiers:(id)a3
{
}

- (NSArray)supportedCalendars
{
  return self->_supportedCalendars;
}

- (NSDictionary)defaultCalendars
{
  return self->_defaultCalendars;
}

- (COSLanguageSelector)languageSelector
{
  return self->_languageSelector;
}

- (void)setLanguageSelector:(id)a3
{
}

- (COSLocaleSelector)localeSelector
{
  return self->_localeSelector;
}

- (void)setLocaleSelector:(id)a3
{
}

- (COSInflectionSelector)inflectionSelector
{
  return self->_inflectionSelector;
}

- (void)setInflectionSelector:(id)a3
{
}

- (COSMirrorController)mirrorController
{
  return self->_mirrorController;
}

- (void)setMirrorController:(id)a3
{
}

- (BOOL)hasFetchedLocalesInfo
{
  return self->_hasFetchedLocalesInfo;
}

- (void)setHasFetchedLocalesInfo:(BOOL)a3
{
  self->_hasFetchedLocalesInfo = a3;
}

- (BOOL)errorHasOccurred
{
  return self->_errorHasOccurred;
}

- (void)setErrorHasOccurred:(BOOL)a3
{
  self->_errorHasOccurred = a3;
}

- (NSDictionary)numberingSystems
{
  return (NSDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (void)setNumberingSystems:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (BOOL)shouldReloadSpecifiers
{
  return self->_shouldReloadSpecifiers;
}

- (void)setShouldReloadSpecifiers:(BOOL)a3
{
  self->_shouldReloadSpecifiers = a3;
}

- (PSSpecifier)remoteLoadingSpecifier
{
  return self->_remoteLoadingSpecifier;
}

- (void)setRemoteLoadingSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteLoadingSpecifier, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_numberingSystems, 0);
  objc_storeStrong((id *)&self->_mirrorController, 0);
  objc_storeStrong((id *)&self->_inflectionSelector, 0);
  objc_storeStrong((id *)&self->_localeSelector, 0);
  objc_storeStrong((id *)&self->_languageSelector, 0);
  objc_storeStrong((id *)&self->_defaultCalendars, 0);
  objc_storeStrong((id *)&self->_supportedCalendars, 0);
  objc_storeStrong((id *)&self->_availableLocaleIdentifiers, 0);

  objc_storeStrong((id *)&self->_systemLanguages, 0);
}

@end