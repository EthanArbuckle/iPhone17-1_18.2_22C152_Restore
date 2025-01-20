@interface SCATTapBehaviourController
- (NSDictionary)behaviorFooterTextMap;
- (PSSpecifier)descriptionGroupSpecifier;
- (PSSpecifier)pickerGroupSpecifier;
- (PSSpecifier)pickerSpecifier;
- (SCATTapBehaviourController)init;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (void)_updateSpecifierVisibility;
- (void)selectBehavior:(int64_t)a3;
- (void)selectSpecifierWithBehavior:(int64_t)a3;
- (void)setBehaviorFooterTextMap:(id)a3;
- (void)setDescriptionGroupSpecifier:(id)a3;
- (void)setPickerGroupSpecifier:(id)a3;
- (void)setPickerSpecifier:(id)a3;
- (void)showPicker:(BOOL)a3 animated:(BOOL)a4;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateFooterTextWithBehavior:(int64_t)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation SCATTapBehaviourController

- (SCATTapBehaviourController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCATTapBehaviourController;
  v2 = [(SCATTapBehaviourController *)&v8 init];
  if (v2)
  {
    v9[0] = &off_229060;
    v3 = AXParameterizedLocalizedString();
    v10[0] = v3;
    v9[1] = &off_229078;
    v4 = AXParameterizedLocalizedString();
    v10[1] = v4;
    v9[2] = &off_229090;
    v5 = AXParameterizedLocalizedString();
    v10[2] = v5;
    v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
    [(SCATTapBehaviourController *)v2 setBehaviorFooterTextMap:v6];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATTapBehaviourController;
  [(SCATTapBehaviourController *)&v4 viewWillAppear:a3];
  [(SCATTapBehaviourController *)self _updateSpecifierVisibility];
}

- (void)_updateSpecifierVisibility
{
  v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlTapBehavior];

  [(SCATTapBehaviourController *)self selectSpecifierWithBehavior:v4];

  [(SCATTapBehaviourController *)self updateFooterTextWithBehavior:v4 animated:0];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)SCATTapBehaviourController;
  [(SCATTapBehaviourController *)&v3 willBecomeActive];
  [(SCATTapBehaviourController *)self _updateSpecifierVisibility];
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)SCATTapBehaviourController;
  [(SCATTapBehaviourController *)&v3 willResignActive];
  [(SCATTapBehaviourController *)self showPicker:0 animated:0];
}

- (void)selectSpecifierWithBehavior:(int64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(SCATTapBehaviourController *)self specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:@"SCATBehaviorKey"];
        v12 = v11;
        if (v11 && [v11 integerValue] == (id)a3)
        {
          v13 = [(SCATTapBehaviourController *)self indexPathForSpecifier:v10];
          [(SCATTapBehaviourController *)self updateTableCheckedSelection:v13];

          if (a3 == 1) {
            [(SCATTapBehaviourController *)self showPicker:1 animated:0];
          }

          goto LABEL_14;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)selectBehavior:(int64_t)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setSwitchControlTapBehavior:a3];
}

- (void)showPicker:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingPicker != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showingPicker = a3;
    id v7 = [(SCATTapBehaviourController *)self specifierForID:@"AlwaysTap"];
    uint64_t v8 = (char *)[(SCATTapBehaviourController *)self indexOfSpecifier:v7];

    [(SCATTapBehaviourController *)self pickerGroupSpecifier];
    if (v5) {
      v9 = {;
    }
      [(SCATTapBehaviourController *)self insertSpecifier:v9 atIndex:v8 + 1 animated:v4];

      id v11 = [(SCATTapBehaviourController *)self pickerSpecifier];
      -[SCATTapBehaviourController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:");
    }
    else {
      v10 = {;
    }
      [(SCATTapBehaviourController *)self removeSpecifier:v10 animated:v4];

      id v11 = [(SCATTapBehaviourController *)self pickerSpecifier];
      -[SCATTapBehaviourController removeSpecifier:animated:](self, "removeSpecifier:animated:");
    }
  }
}

- (void)updateFooterTextWithBehavior:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(SCATTapBehaviourController *)self behaviorFooterTextMap];
  uint64_t v8 = +[NSNumber numberWithInteger:a3];
  id v11 = [v7 objectForKeyedSubscript:v8];

  v9 = [(SCATTapBehaviourController *)self descriptionGroupSpecifier];
  [v9 setObject:v11 forKeyedSubscript:PSFooterTextGroupKey];

  v10 = [(SCATTapBehaviourController *)self descriptionGroupSpecifier];
  [(SCATTapBehaviourController *)self reloadSpecifier:v10 animated:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  BOOL v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = +[AXSettings sharedInstance];
    id v7 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v7];
    [(SCATTapBehaviourController *)self setDescriptionGroupSpecifier:v7];
    uint64_t v8 = AXParameterizedLocalizedString();
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v10 = PSIDKey;
    [v9 setProperty:@"TapBehaviorDefault" forKey:PSIDKey];
    [v9 setObject:&off_229060 forKeyedSubscript:@"SCATBehaviorKey"];
    [v5 addObject:v9];
    if ([v6 switchControlScanningStyle] != (char *)&dword_0 + 2)
    {
      id v11 = AXParameterizedLocalizedString();
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v12 setProperty:@"TapBehaviorAuto" forKey:v10];
      [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SCATShowPickerKey"];
      [v12 setObject:&off_229090 forKeyedSubscript:@"SCATBehaviorKey"];
      [v5 addObject:v12];
      v9 = v12;
    }
    v13 = AXParameterizedLocalizedString();
    long long v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setProperty:@"AlwaysTap" forKey:v10];
    [v14 setObject:&off_229078 forKeyedSubscript:@"SCATBehaviorKey"];
    [v5 addObject:v14];
    long long v15 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    BOOL v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (PSSpecifier)pickerGroupSpecifier
{
  pickerGroupSpecifier = self->_pickerGroupSpecifier;
  if (!pickerGroupSpecifier)
  {
    BOOL v4 = +[PSSpecifier emptyGroupSpecifier];
    id v5 = self->_pickerGroupSpecifier;
    self->_pickerGroupSpecifier = v4;

    pickerGroupSpecifier = self->_pickerGroupSpecifier;
  }

  return pickerGroupSpecifier;
}

- (PSSpecifier)pickerSpecifier
{
  pickerSpecifier = self->_pickerSpecifier;
  if (!pickerSpecifier)
  {
    BOOL v4 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    id v5 = self->_pickerSpecifier;
    self->_pickerSpecifier = v4;

    pickerSpecifier = self->_pickerSpecifier;
  }

  return pickerSpecifier;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SCATTapBehaviourController;
  id v6 = a4;
  [(SCATTapBehaviourController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  [(SCATTapBehaviourController *)self beginUpdates];
  id v7 = [(SCATTapBehaviourController *)self specifierAtIndexPath:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"SCATBehaviorKey"];
  id v9 = [v8 integerValue];

  [(SCATTapBehaviourController *)self selectBehavior:v9];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"SCATShowPickerKey"];
  id v11 = [v10 BOOLValue];

  [(SCATTapBehaviourController *)self showPicker:v11 animated:1];
  [(SCATTapBehaviourController *)self updateTableCheckedSelection:v6];

  [(SCATTapBehaviourController *)self updateFooterTextWithBehavior:v9 animated:1];
  [(SCATTapBehaviourController *)self endUpdates];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v10 = [v5 specifier];
  id v6 = [v10 propertyForKey:@"SCATBehaviorKey"];
  id v7 = +[AXSettings sharedInstance];
  uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 switchControlTapBehavior]);
  id v9 = [v6 isEqual:v8];

  [v5 setChecked:v9];
}

- (double)valueForSpecifier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 switchControlAutoTapTimeout];
  double v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlAutoTapTimeout:a4];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.2;
}

- (double)minimumValueForSpecifier:(id)a3
{
  return kSwitchControlAutoTapTimeoutMin;
}

- (double)maximumValueForSpecifier:(id)a3
{
  return kSwitchControlAutoTapTimeoutMax;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(SCATTapBehaviourController *)self valueForSpecifier:a3];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v4 = AXFormatNumberWithOptions();

  return v4;
}

- (void)setPickerSpecifier:(id)a3
{
}

- (void)setPickerGroupSpecifier:(id)a3
{
}

- (PSSpecifier)descriptionGroupSpecifier
{
  return self->_descriptionGroupSpecifier;
}

- (void)setDescriptionGroupSpecifier:(id)a3
{
}

- (NSDictionary)behaviorFooterTextMap
{
  return self->_behaviorFooterTextMap;
}

- (void)setBehaviorFooterTextMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorFooterTextMap, 0);
  objc_storeStrong((id *)&self->_descriptionGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_pickerSpecifier, 0);
}

@end