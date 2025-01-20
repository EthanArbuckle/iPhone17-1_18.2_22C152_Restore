@interface AssistantBridgeTriggerPhrasesController
- (AFBluetoothDeviceInfo)connectedDeviceInfo;
- (AssistantBridgeTriggerPhrasesController)init;
- (id)specifierPlistName;
- (id)specifiers;
- (id)triggerPhrasesGroupSpecifier;
- (void)_refreshFooters;
- (void)_setupPhraseChoiceSpecifiers;
- (void)_updateFootersWithFooterType:(int64_t)a3;
- (void)setConnectedDeviceInfo:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantBridgeTriggerPhrasesController

- (AssistantBridgeTriggerPhrasesController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AssistantBridgeTriggerPhrasesController;
  v2 = [(AssistantBridgeTriggerPhrasesController *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"preferencesDidChange" name:AFNanoPreferencesDidChangeNotification object:0];

    v4 = (AFSettingsConnection *)objc_alloc_init((Class)AFSettingsConnection);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v4;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AssistantBridgeTriggerPhrasesController;
  [(AssistantBridgeTriggerPhrasesController *)&v8 viewWillAppear:a3];
  objc_initWeak(&location, self);
  settingsConnection = self->_settingsConnection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_63B4;
  v5[3] = &unk_104F0;
  objc_copyWeak(&v6, &location);
  [(AFSettingsConnection *)settingsConnection getConnectedBluetoothDeviceInfoArrayWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setConnectedDeviceInfo:(id)a3
{
  v5 = (AFBluetoothDeviceInfo *)a3;
  if (self->_connectedDeviceInfo != v5)
  {
    objc_storeStrong((id *)&self->_connectedDeviceInfo, a3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_658C;
    block[3] = &unk_10518;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)specifierPlistName
{
  return @"AssistantBridgeTriggerPhrases";
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(AssistantBridgeTriggerPhrasesController *)self loadSpecifiersFromPlistName:@"AssistantBridgeTriggerPhrases" target:self];
    id v6 = [v5 copy];
    objc_super v7 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    [(AssistantBridgeTriggerPhrasesController *)self _setupPhraseChoiceSpecifiers];
    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_setupPhraseChoiceSpecifiers
{
  id v13 = [(AssistantBridgeTriggerPhrasesController *)self specifierForID:@"HS_JS_ID"];
  uint64_t v3 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHSJS];
  [v13 setName:v3];

  v4 = [(AssistantBridgeTriggerPhrasesController *)self specifierForID:@"HEY_SIRI_ID"];
  v5 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHS];
  [v4 setName:v5];

  id v6 = +[AFPreferences sharedPreferences];
  unsigned int v7 = [v6 nanoPhraseSpotterEnabled];

  if (v7)
  {
    objc_super v8 = +[AFPreferences sharedPreferences];
    v9 = (char *)[v8 nanoVTPhraseType];

    if (v9 == (unsigned char *)&dword_0 + 1)
    {
      id v10 = v13;
      uint64_t v11 = 2;
      goto LABEL_9;
    }
    if (!v9)
    {
      id v10 = v4;
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    id v10 = 0;
  }
  else
  {
    id v10 = [(AssistantBridgeTriggerPhrasesController *)self specifierForID:@"VOICE_TRIGGER_DISABLED_ID"];
  }
  uint64_t v11 = 0;
LABEL_9:
  v12 = [(AssistantBridgeTriggerPhrasesController *)self triggerPhrasesGroupSpecifier];
  [v12 setProperty:v10 forKey:PSRadioGroupCheckedSpecifierKey];

  [(AssistantBridgeTriggerPhrasesController *)self _updateFootersWithFooterType:v11];
}

- (void)_refreshFooters
{
  id v6 = +[AFPreferences sharedPreferences];
  if ([v6 nanoPhraseSpotterEnabled])
  {
    uint64_t v3 = (char *)[v6 nanoVTPhraseType];
    if (v3) {
      uint64_t v4 = 2 * (v3 == (unsigned char *)&dword_0 + 1);
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(AssistantBridgeTriggerPhrasesController *)self _updateFootersWithFooterType:v4];
  v5 = [(AssistantBridgeTriggerPhrasesController *)self triggerPhrasesGroupSpecifier];
  [(AssistantBridgeTriggerPhrasesController *)self reloadSpecifier:v5 animated:0];
}

- (void)_updateFootersWithFooterType:(int64_t)a3
{
  if (a3 == 2)
  {
    connectedDeviceInfo = self->_connectedDeviceInfo;
    if (connectedDeviceInfo
      && ![(AFBluetoothDeviceInfo *)connectedDeviceInfo supportsJustSiri])
    {
      uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
      id v6 = [v4 localizedStringForKey:@"TRIGGER_PHRASE_SETTING_FOOTER_ENABLED_WITH_UNSUPPORTED_CONNECTED_HEADPHONES" value:&stru_10A70 table:@"AssistantBridgeSettings"];
      objc_super v8 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHSJS];
      v9 = [(AFBluetoothDeviceInfo *)self->_connectedDeviceInfo name];
      id v10 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHS];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8, v9, v10);
LABEL_12:
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v4 localizedStringForKey:@"TRIGGER_PHRASE_SETTING_FOOTER_ENABLED" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    uint64_t v12 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHSJS];
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        id v15 = 0;
        goto LABEL_14;
      }
      uint64_t v4 = +[AssistantBridgeSettingsUtilities languageCode];
      v5 = +[VTPreferences sharedPreferences];
      id v6 = [v5 localizedTriggerPhraseForLanguageCode:v4];

      unsigned int v7 = +[VTPreferences sharedPreferences];
      objc_super v8 = [v7 localizedCompactTriggerPhraseForLanguageCode:v4];

      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = [v9 localizedStringForKey:@"TRIGGER_PHRASE_SETTING_FOOTER_DISABLED" value:&stru_10A70 table:@"AssistantBridgeSettings"];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, v6, v14);
      goto LABEL_12;
    }
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v4 localizedStringForKey:@"TRIGGER_PHRASE_SETTING_FOOTER_ENABLED" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    uint64_t v12 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHS];
  }
  objc_super v8 = (void *)v12;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v12);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  id v13 = [(AssistantBridgeTriggerPhrasesController *)self triggerPhrasesGroupSpecifier];
  [v13 setProperty:v15 forKey:PSFooterTextGroupKey];
}

- (id)triggerPhrasesGroupSpecifier
{
  return [(AssistantBridgeTriggerPhrasesController *)self specifierForID:@"TRIGGER_PHRASE_GROUP_ID"];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(AssistantBridgeTriggerPhrasesController *)self specifierAtIndex:[(AssistantBridgeTriggerPhrasesController *)self indexForIndexPath:v7]];
  v9 = [v8 identifier];

  unsigned int v10 = +[AssistantBridgeSettingsUtilities voiceTriggerEnabled];
  unsigned int v11 = [v9 isEqualToString:@"VOICE_TRIGGER_DISABLED_ID"];
  uint64_t v12 = v11 ^ 1;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_6DBC;
  v20[3] = &unk_10540;
  id v13 = v6;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  v23 = self;
  id v15 = v9;
  id v24 = v15;
  v16 = objc_retainBlock(v20);
  if (+[AssistantBridgeSettingsUtilities raiseToSpeakEnabled](AssistantBridgeSettingsUtilities, "raiseToSpeakEnabled")|| +[AssistantBridgeSettingsUtilities digitalCrownEnabled]|| ((v10 ^ v11) & 1) != 0)
  {
    ((void (*)(void *, uint64_t))v16[2])(v16, v12);
  }
  else
  {
    objc_initWeak(&location, self);
    [v13 deselectRowAtIndexPath:v14 animated:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_6EB4;
    v17[3] = &unk_103F8;
    objc_copyWeak(&v18, &location);
    +[AssistantBridgeSettingsUtilities setAssistantEnabled:v12 alertPresenter:self confirmationAction:v16 alertPresentationCompletion:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (AFBluetoothDeviceInfo)connectedDeviceInfo
{
  return self->_connectedDeviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedDeviceInfo, 0);

  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

@end