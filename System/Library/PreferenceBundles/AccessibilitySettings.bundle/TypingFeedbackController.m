@interface TypingFeedbackController
- (PSSpecifier)feedbackDelayPickerSpecifier;
- (PSSpecifier)groupSpecifier;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)_characterFeedbackSpecifiers;
- (id)_delayPickerSpecifiers:(id)a3;
- (id)letterFeedbackEnabled:(id)a3;
- (id)phoneticFeedbackEnabled:(id)a3;
- (id)quickTypeWordFeedbackEnabled:(id)a3;
- (id)speakCorrectionsEnabled:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)wordFeedbackEnabled:(id)a3;
- (void)_updateDelayPickerSpecifiers:(id)a3 afterSpecifierWithIdentifier:(id)a4 enabled:(BOOL)a5;
- (void)setFeedbackDelayPickerSpecifier:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setLetterFeedbackEnabled:(id)a3 specifier:(id)a4;
- (void)setPhoneticFeedbackEnabled:(id)a3 specifier:(id)a4;
- (void)setQuickTypeWordFeedbackEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeakCorrectionsEnabled:(id)a3 specifier:(id)a4;
- (void)setWordFeedbackEnabled:(id)a3 specifier:(id)a4;
- (void)specifier:(id)a3 setValue:(double)a4;
@end

@implementation TypingFeedbackController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(TypingFeedbackController *)self loadSpecifiersFromPlistName:@"TypingFeedbackSettings" target:self];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    id v7 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] mutableCopy];
    v8 = +[AXSettings sharedInstance];
    if ([v8 letterFeedbackEnabled])
    {
      unsigned int v9 = 1;
    }
    else
    {
      v10 = +[AXSettings sharedInstance];
      unsigned int v9 = [v10 phoneticFeedbackEnabled];
    }
    v11 = [(TypingFeedbackController *)self _characterFeedbackSpecifiers];
    id v12 = [v11 count];

    if (v12 && v9)
    {
      v13 = [(TypingFeedbackController *)self specifierForKey:@"PhoneticFeedback"];
      v14 = (char *)[v7 indexOfObject:v13];
      v15 = [(TypingFeedbackController *)self _characterFeedbackSpecifiers];
      id v16 = [v15 count];

      id v17 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", v14 + 1, v16);
      v18 = [(TypingFeedbackController *)self _characterFeedbackSpecifiers];
      [v7 insertObjects:v18 atIndexes:v17];
    }
    v19 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v7;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (double)minimumValueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];

  if (v5 == v4) {
    double v6 = kAXSCharacterFeedbackDelayDurationMin;
  }
  else {
    double v6 = 0.0;
  }

  return v6;
}

- (double)maximumValueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];

  if (v5 == v4) {
    double v6 = kAXSCharacterFeedbackDelayDurationMax;
  }
  else {
    double v6 = 0.0;
  }

  return v6;
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.05;
}

- (double)valueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];

  double v6 = 0.0;
  if (v5 == v4)
  {
    id v7 = +[AXSettings sharedInstance];
    [v7 characterFeedbackDelayDuration];
    double v6 = v8;
  }
  return v6;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6 = a3;
  id v7 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];

  if (v7 == v6)
  {
    id v8 = +[AXSettings sharedInstance];
    [v8 setCharacterFeedbackDelayDuration:a4];
  }
}

- (id)stringValueForSpecifier:(id)a3
{
  [(TypingFeedbackController *)self valueForSpecifier:a3];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v4 = AXFormatNumberWithOptions();

  return v4;
}

- (void)setLetterFeedbackEnabled:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v5 = +[AXSettings sharedInstance];
  objc_msgSend(v5, "setLetterFeedbackEnabled:", objc_msgSend(v10, "BOOLValue"));

  id v6 = [(TypingFeedbackController *)self _characterFeedbackSpecifiers];
  if ([v10 BOOLValue])
  {
    [(TypingFeedbackController *)self _updateDelayPickerSpecifiers:v6 afterSpecifierWithIdentifier:@"PhoneticFeedback" enabled:1];
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    -[TypingFeedbackController _updateDelayPickerSpecifiers:afterSpecifierWithIdentifier:enabled:](self, "_updateDelayPickerSpecifiers:afterSpecifierWithIdentifier:enabled:", v6, @"PhoneticFeedback", [v7 phoneticFeedbackEnabled]);
  }
  if ([v10 BOOLValue])
  {
    id v8 = AXAssetAndDataClient();
    unsigned int v9 = +[AXAccessQueue mainAccessQueue];
    [v8 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v9 completion:0];
  }
}

- (id)letterFeedbackEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 letterFeedbackEnabled]);

  return v4;
}

- (void)setPhoneticFeedbackEnabled:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v5 = +[AXSettings sharedInstance];
  objc_msgSend(v5, "setPhoneticFeedbackEnabled:", objc_msgSend(v10, "BOOLValue"));

  id v6 = [(TypingFeedbackController *)self _characterFeedbackSpecifiers];
  if ([v10 BOOLValue])
  {
    [(TypingFeedbackController *)self _updateDelayPickerSpecifiers:v6 afterSpecifierWithIdentifier:@"PhoneticFeedback" enabled:1];
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    -[TypingFeedbackController _updateDelayPickerSpecifiers:afterSpecifierWithIdentifier:enabled:](self, "_updateDelayPickerSpecifiers:afterSpecifierWithIdentifier:enabled:", v6, @"PhoneticFeedback", [v7 letterFeedbackEnabled]);
  }
  if ([v10 BOOLValue])
  {
    id v8 = AXAssetAndDataClient();
    unsigned int v9 = +[AXAccessQueue mainAccessQueue];
    [v8 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v9 completion:0];
  }
}

- (id)phoneticFeedbackEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 phoneticFeedbackEnabled]);

  return v4;
}

- (id)_characterFeedbackSpecifiers
{
  uint64_t v3 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];

  if (!v3)
  {
    id v4 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    [(TypingFeedbackController *)self setFeedbackDelayPickerSpecifier:v4];
  }
  id v5 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];
  id v6 = [(TypingFeedbackController *)self _delayPickerSpecifiers:v5];

  return v6;
}

- (id)wordFeedbackEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 wordFeedbackEnabled]);

  return v4;
}

- (void)setWordFeedbackEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  objc_msgSend(v5, "setWordFeedbackEnabled:", objc_msgSend(v4, "BOOLValue"));

  LODWORD(v5) = [v4 BOOLValue];
  if (v5)
  {
    AXAssetAndDataClient();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = +[AXAccessQueue mainAccessQueue];
    [v7 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v6 completion:0];
  }
}

- (id)quickTypeWordFeedbackEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 quickTypeWordFeedbackEnabled]);

  return v4;
}

- (void)setQuickTypeWordFeedbackEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  objc_msgSend(v5, "setQuickTypeWordFeedbackEnabled:", objc_msgSend(v4, "BOOLValue"));

  LODWORD(v5) = [v4 BOOLValue];
  if (v5)
  {
    AXAssetAndDataClient();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = +[AXAccessQueue mainAccessQueue];
    [v7 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v6 completion:0];
  }
}

- (id)speakCorrectionsEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 speakCorrectionsEnabled]);

  return v4;
}

- (void)setSpeakCorrectionsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  objc_msgSend(v5, "setSpeakCorrectionsEnabled:", objc_msgSend(v4, "BOOLValue"));

  LODWORD(v5) = [v4 BOOLValue];
  if (v5)
  {
    AXAssetAndDataClient();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = +[AXAccessQueue mainAccessQueue];
    [v7 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v6 completion:0];
  }
}

- (void)_updateDelayPickerSpecifiers:(id)a3 afterSpecifierWithIdentifier:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  id v8 = a4;
  unsigned int v9 = [(TypingFeedbackController *)self specifiers];
  id v10 = [v17 firstObject];
  unsigned int v11 = [v9 containsObject:v10];

  if (v5)
  {
    if ((v11 & 1) == 0) {
      [(TypingFeedbackController *)self insertContiguousSpecifiers:v17 afterSpecifierID:v8 animated:1];
    }
  }
  else if (v11)
  {
    id v12 = [(TypingFeedbackController *)self feedbackDelayPickerSpecifier];
    v13 = [(TypingFeedbackController *)self indexPathForSpecifier:v12];

    v14 = [(TypingFeedbackController *)self table];
    v15 = [v14 cellForRowAtIndexPath:v13];

    id v16 = [v15 nameTextField];
    [v16 resignFirstResponder];

    [(TypingFeedbackController *)self removeContiguousSpecifiers:v17 animated:1];
  }
}

- (id)_delayPickerSpecifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray array];
  id v6 = [(TypingFeedbackController *)self groupSpecifier];

  if (!v6)
  {
    id v7 = settingsLocString(@"CHARACTER_FEEDBACK_DELAY", @"Accessibility");
    id v8 = +[PSSpecifier groupSpecifierWithName:v7];
    [(TypingFeedbackController *)self setGroupSpecifier:v8];

    unsigned int v9 = [(TypingFeedbackController *)self groupSpecifier];
    id v10 = settingsLocString(@"CHARACTER_FEEDBACK_DELAY_FOOTER", @"Accessibility");
    [v9 setProperty:v10 forKey:PSFooterTextGroupKey];
  }
  unsigned int v11 = [(TypingFeedbackController *)self groupSpecifier];

  if (v11)
  {
    id v12 = [(TypingFeedbackController *)self groupSpecifier];
    [v5 addObject:v12];
  }
  if (v4) {
    [v5 addObject:v4];
  }

  return v5;
}

- (PSSpecifier)feedbackDelayPickerSpecifier
{
  return self->_feedbackDelayPickerSpecifier;
}

- (void)setFeedbackDelayPickerSpecifier:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_feedbackDelayPickerSpecifier, 0);
}

@end