@interface AXSpeechActionDetailController
- (BOOL)isActionAvailable:(int64_t)a3;
- (id)specifiers;
- (int64_t)actionForSpecifier:(id)a3;
- (int64_t)currentAction;
- (void)updateCurrentAction:(int64_t)a3;
@end

@implementation AXSpeechActionDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = settingsLocString(@"SPEECH_CONTROLLER_ACTIONS", @"SpeechSettings");
    v7 = +[PSSpecifier groupSpecifierWithName:v6];

    [v5 addObject:v7];
    v8 = AXLocalizedTitleForSpeechControllerAction(0);
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    noneActionSpecifier = self->_noneActionSpecifier;
    self->_noneActionSpecifier = v9;
    v11 = v9;

    [v5 addObject:v11];
    v12 = AXLocalizedTitleForSpeechControllerAction(1uLL);
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    readAllActionSpecifier = self->_readAllActionSpecifier;
    self->_readAllActionSpecifier = v13;
    v15 = v13;

    [v5 addObject:v15];
    v16 = AXLocalizedTitleForSpeechControllerAction(2uLL);
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

    speakFingerActionSpecifier = self->_speakFingerActionSpecifier;
    self->_speakFingerActionSpecifier = v17;
    v19 = v17;

    [v5 addObject:v19];
    v20 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    [(AXActionDetailController *)self updateSpecifierStateAndReload:0];
    v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (int64_t)actionForSpecifier:(id)a3
{
  v4 = (PSSpecifier *)a3;
  if (self->_noneActionSpecifier == v4)
  {
    int64_t v5 = 0;
  }
  else if (self->_readAllActionSpecifier == v4)
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v5 = 2 * (self->_speakFingerActionSpecifier == v4);
  }

  return v5;
}

- (BOOL)isActionAvailable:(int64_t)a3
{
  if (!a3 || [(AXSpeechActionDetailController *)self currentAction] == a3) {
    return 1;
  }
  int64_t v5 = +[AXSettings sharedInstance];
  if ([v5 speechControllerLongPressAction] == (id)a3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6 = +[AXSettings sharedInstance];
    BOOL v4 = [v6 speechControllerDoubleTapAction] != (id)a3;
  }
  return v4;
}

- (int64_t)currentAction
{
  v2 = [(AXSpeechActionDetailController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"ControllerGesture"];

  if ([v3 isEqualToString:@"LongPress"])
  {
    BOOL v4 = +[AXSettings sharedInstance];
    id v5 = [v4 speechControllerLongPressAction];
  }
  else
  {
    if (![v3 isEqualToString:@"DoubleTap"])
    {
      int64_t v6 = 0;
      goto LABEL_7;
    }
    BOOL v4 = +[AXSettings sharedInstance];
    id v5 = [v4 speechControllerDoubleTapAction];
  }
  int64_t v6 = (int64_t)v5;

LABEL_7:
  return v6;
}

- (void)updateCurrentAction:(int64_t)a3
{
  BOOL v4 = [(AXSpeechActionDetailController *)self specifier];
  id v7 = [v4 propertyForKey:@"ControllerGesture"];

  if ([v7 isEqualToString:@"LongPress"])
  {
    id v5 = +[AXSettings sharedInstance];
    [v5 setSpeechControllerLongPressAction:a3];
  }
  if ([v7 isEqualToString:@"DoubleTap"])
  {
    int64_t v6 = +[AXSettings sharedInstance];
    [v6 setSpeechControllerDoubleTapAction:a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakFingerActionSpecifier, 0);
  objc_storeStrong((id *)&self->_readAllActionSpecifier, 0);

  objc_storeStrong((id *)&self->_noneActionSpecifier, 0);
}

@end