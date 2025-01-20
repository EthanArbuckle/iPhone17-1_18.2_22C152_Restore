@interface AXKeyRepeatController
- (NSArray)keyRepeatSpecificSpecifiers;
- (PSSpecifier)keyRepeatDelaySpecifier;
- (PSSpecifier)keyRepeatIntervalSpecifier;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)keyRepeatEnabled:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (void)setKeyRepeatDelaySpecifier:(id)a3;
- (void)setKeyRepeatEnabled:(id)a3 specifier:(id)a4;
- (void)setKeyRepeatIntervalSpecifier:(id)a3;
- (void)setKeyRepeatSpecificSpecifiers:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
@end

@implementation AXKeyRepeatController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = settingsLocString(@"KEY_REPEAT_FOOTER", @"KeyboardsSettings");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    v22 = v6;
    [v5 addObject:v6];
    v8 = settingsLocString(@"KEY_REPEAT", @"KeyboardsSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setKeyRepeatEnabled:specifier:" get:"keyRepeatEnabled:" detail:0 cell:6 edit:0];

    uint64_t v10 = PSIDKey;
    [v9 setProperty:@"KeyRepeatEnabled" forKey:PSIDKey];
    v21 = v9;
    [v5 addObject:v9];
    v11 = settingsLocString(@"KEY_REPEAT_INTERVAL", @"KeyboardsSettings");
    v12 = +[PSSpecifier groupSpecifierWithName:v11];

    v13 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    [v13 setProperty:@"KeyRepeatInterval" forKey:v10];
    v14 = settingsLocString(@"KEY_REPEAT_DELAY", @"KeyboardsSettings");
    v15 = +[PSSpecifier groupSpecifierWithName:v14];

    v16 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    [v16 setProperty:@"KeyRepeatDelay" forKey:v10];
    [(AXKeyRepeatController *)self setKeyRepeatIntervalSpecifier:v13];
    [(AXKeyRepeatController *)self setKeyRepeatDelaySpecifier:v16];
    v23[0] = v12;
    v23[1] = v13;
    v23[2] = v15;
    v23[3] = v16;
    v17 = +[NSArray arrayWithObjects:v23 count:4];
    [(AXKeyRepeatController *)self setKeyRepeatSpecificSpecifiers:v17];

    if (_AXSKeyRepeatEnabled())
    {
      v18 = [(AXKeyRepeatController *)self keyRepeatSpecificSpecifiers];
      [v5 addObjectsFromArray:v18];
    }
    v19 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)setKeyRepeatEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  BOOL v6 = _AXSKeyRepeatEnabled() == 0;
  unsigned int v7 = [v5 BOOLValue];

  if (((v6 ^ v7) & 1) == 0)
  {
    _AXSSetKeyRepeatEnabled();
    if (v7)
    {
      id v18 = [(AXKeyRepeatController *)self keyRepeatSpecificSpecifiers];
      -[AXKeyRepeatController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:");
    }
    else
    {
      v8 = [(AXKeyRepeatController *)self keyRepeatIntervalSpecifier];
      v9 = [(AXKeyRepeatController *)self indexPathForSpecifier:v8];

      uint64_t v10 = [(AXKeyRepeatController *)self table];
      v11 = [v10 cellForRowAtIndexPath:v9];

      v12 = [v11 nameTextField];
      [v12 resignFirstResponder];

      v13 = [(AXKeyRepeatController *)self keyRepeatDelaySpecifier];
      id v18 = [(AXKeyRepeatController *)self indexPathForSpecifier:v13];

      v14 = [(AXKeyRepeatController *)self table];
      v15 = [v14 cellForRowAtIndexPath:v18];

      v16 = [v15 nameTextField];
      [v16 resignFirstResponder];

      v17 = [(AXKeyRepeatController *)self keyRepeatSpecificSpecifiers];
      [(AXKeyRepeatController *)self removeContiguousSpecifiers:v17 animated:1];
    }
  }
}

- (id)keyRepeatEnabled:(id)a3
{
  uint64_t v3 = _AXSKeyRepeatEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (double)valueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXKeyRepeatController *)self keyRepeatIntervalSpecifier];

  if (v5 == v4)
  {
    _AXSKeyRepeatInterval();
LABEL_6:
    double v7 = v8;
    goto LABEL_7;
  }
  id v6 = [(AXKeyRepeatController *)self keyRepeatDelaySpecifier];

  if (v6 == v4)
  {
    _AXSKeyRepeatDelay();
    goto LABEL_6;
  }
  _AXAssert();
  double v7 = 0.0;
LABEL_7:

  return v7;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v7 = a3;
  id v5 = [(AXKeyRepeatController *)self keyRepeatIntervalSpecifier];

  if (v5 == v7)
  {
    _AXSSetKeyRepeatInterval();
  }
  else
  {
    id v6 = [(AXKeyRepeatController *)self keyRepeatDelaySpecifier];

    if (v6 == v7) {
      _AXSSetKeyRepeatDelay();
    }
    else {
      _AXAssert();
    }
  }
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.01;
}

- (double)minimumValueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXKeyRepeatController *)self keyRepeatIntervalSpecifier];

  if (v5 == v4)
  {
    double v8 = (double *)&kAXSKeyRepeatIntervalMinimum;
LABEL_6:
    double v7 = *v8;
    goto LABEL_7;
  }
  id v6 = [(AXKeyRepeatController *)self keyRepeatDelaySpecifier];

  if (v6 == v4)
  {
    double v8 = (double *)&kAXSKeyRepeatDelayMinimum;
    goto LABEL_6;
  }
  _AXAssert();
  double v7 = 0.1;
LABEL_7:
  if (_AXSSlowKeysEnabled())
  {
    _AXSSlowKeysAcceptanceDelay();
    if (v7 < v9) {
      double v7 = v9;
    }
  }

  return v7;
}

- (double)maximumValueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXKeyRepeatController *)self keyRepeatIntervalSpecifier];

  if (v5 == v4)
  {
    double v8 = (double *)&kAXSKeyRepeatIntervalMaximum;
LABEL_6:
    double v7 = *v8;
    goto LABEL_7;
  }
  id v6 = [(AXKeyRepeatController *)self keyRepeatDelaySpecifier];

  if (v6 == v4)
  {
    double v8 = (double *)&kAXSKeyRepeatDelayMaximum;
    goto LABEL_6;
  }
  _AXAssert();
  double v7 = 1.0;
LABEL_7:

  return v7;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(AXKeyRepeatController *)self valueForSpecifier:a3];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v4 = AXFormatNumberWithOptions();

  return v4;
}

- (PSSpecifier)keyRepeatIntervalSpecifier
{
  return self->_keyRepeatIntervalSpecifier;
}

- (void)setKeyRepeatIntervalSpecifier:(id)a3
{
}

- (PSSpecifier)keyRepeatDelaySpecifier
{
  return self->_keyRepeatDelaySpecifier;
}

- (void)setKeyRepeatDelaySpecifier:(id)a3
{
}

- (NSArray)keyRepeatSpecificSpecifiers
{
  return self->_keyRepeatSpecificSpecifiers;
}

- (void)setKeyRepeatSpecificSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyRepeatSpecificSpecifiers, 0);
  objc_storeStrong((id *)&self->_keyRepeatDelaySpecifier, 0);

  objc_storeStrong((id *)&self->_keyRepeatIntervalSpecifier, 0);
}

@end