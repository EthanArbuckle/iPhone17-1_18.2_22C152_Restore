@interface AXVoiceOverPunctuationReplacement
- (AXSSPunctuationEntry)punctuationEntry;
- (AXSSPunctuationGroup)punctuationGroup;
- (BOOL)_isValidPunctuationEntry;
- (id)_punctuation:(id)a3;
- (id)_replacement:(id)a3;
- (id)specifiers;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)_punctuationPickerTapped:(id)a3;
- (void)_saveIfPossible;
- (void)_setPunctuation:(id)a3 specifier:(id)a4;
- (void)_setReplacement:(id)a3 specifier:(id)a4;
- (void)_updateSelectedRuleChoice;
- (void)_updateTextAttributes;
- (void)buttonPickerWantsToInsertText:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)reloadSpecifiers;
- (void)removeFromParentViewController;
- (void)setPunctuationEntry:(id)a3;
- (void)setPunctuationGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AXVoiceOverPunctuationReplacement

- (AXSSPunctuationEntry)punctuationEntry
{
  punctuationEntry = self->_punctuationEntry;
  if (!punctuationEntry)
  {
    v4 = (AXSSPunctuationEntry *)[objc_alloc((Class)AXSSPunctuationEntry) init];
    v5 = self->_punctuationEntry;
    self->_punctuationEntry = v4;

    punctuationEntry = self->_punctuationEntry;
  }

  return punctuationEntry;
}

- (void)removeFromParentViewController
{
  v4.receiver = self;
  v4.super_class = (Class)AXVoiceOverPunctuationReplacement;
  [(AXVoiceOverPunctuationReplacement *)&v4 removeFromParentViewController];
  v3 = [(AXVoiceOverPunctuationReplacement *)self specifier];
  [v3 removePropertyForKey:@"PunctuationEntry"];
}

- (BOOL)_isValidPunctuationEntry
{
  v2 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  v3 = [v2 punctuation];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_updateTextAttributes
{
  v3 = [(AXVoiceOverPunctuationReplacement *)self cellForSpecifierID:@"replacement"];
  BOOL v4 = [v3 editableTextField];
  v5 = [v4 text];
  v6 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  [v6 setReplacement:v5];

  id v10 = [(AXVoiceOverPunctuationReplacement *)self cellForSpecifierID:@"punctuation"];
  v7 = [v10 editableTextField];
  v8 = [v7 text];
  v9 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  [v9 setPunctuation:v8];
}

- (void)_saveIfPossible
{
  [(AXVoiceOverPunctuationReplacement *)self _updateTextAttributes];
  v3 = [(AXVoiceOverPunctuationReplacement *)self punctuationGroup];
  if (([v3 inDatabase] & 1) == 0)
  {
    BOOL v4 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      v25[0] = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Group not in DB, adding: %@", (uint8_t *)&v24, 0xCu);
    }

    v5 = +[AXSSPunctuationManager sharedDatabase];
    [v5 updatePunctuationGroup:v3];
  }
  v6 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned int v7 = [(AXVoiceOverPunctuationReplacement *)self _isValidPunctuationEntry];
    v8 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
    int v24 = 67109378;
    LODWORD(v25[0]) = v7;
    WORD2(v25[0]) = 2112;
    *(void *)((char *)v25 + 6) = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Adding entry: valid:%d - %@", (uint8_t *)&v24, 0x12u);
  }
  if ([(AXVoiceOverPunctuationReplacement *)self _isValidPunctuationEntry])
  {
    v9 = [v3 uuid];
    id v10 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
    [v10 setGroupUUID:v9];

    v11 = +[AXSSPunctuationManager sharedDatabase];
    v12 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
    [v11 updateEntry:v12];

    v13 = [v3 entries];
    v14 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
    unsigned __int8 v15 = [v13 containsObject:v14];

    if ((v15 & 1) == 0)
    {
      v16 = [v3 entries];
      if (v16)
      {
        v17 = [v3 entries];
        id v18 = [v17 mutableCopy];
      }
      else
      {
        id v18 = +[NSMutableArray array];
      }

      v19 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
      [v18 addObject:v19];

      [v3 setEntries:v18];
      v20 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [v3 entries];
        int v24 = 138412290;
        v25[0] = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Associating entry: %@", (uint8_t *)&v24, 0xCu);
      }
      v22 = +[AXSSPunctuationManager sharedDatabase];
      [v22 updatePunctuationGroup:v3];
    }
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 postNotificationName:@"AXVoiceOverPunctuationGroupChangedNotification" object:0];
  }
}

- (void)viewDidLoad
{
  v3 = [(AXVoiceOverPunctuationReplacement *)self specifier];
  uint64_t v4 = [v3 propertyForKey:@"PunctuationGroup"];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(AXVoiceOverPunctuationReplacement *)self punctuationGroup];

    if (v6) {
      goto LABEL_5;
    }
    v3 = [(AXVoiceOverPunctuationReplacement *)self specifier];
    unsigned int v7 = [v3 propertyForKey:@"PunctuationGroup"];
    [(AXVoiceOverPunctuationReplacement *)self setPunctuationGroup:v7];
  }
LABEL_5:
  v8 = [(AXVoiceOverPunctuationReplacement *)self specifier];
  v9 = [v8 propertyForKey:@"PunctuationEntry"];
  if (!v9)
  {
LABEL_8:

    goto LABEL_9;
  }
  punctuationEntry = self->_punctuationEntry;

  if (!punctuationEntry)
  {
    v8 = [(AXVoiceOverPunctuationReplacement *)self specifier];
    v11 = [v8 propertyForKey:@"PunctuationEntry"];
    [(AXVoiceOverPunctuationReplacement *)self setPunctuationEntry:v11];

    goto LABEL_8;
  }
LABEL_9:
  v12 = [(AXVoiceOverPunctuationReplacement *)self specifier];
  cachedSpecifier = self->_cachedSpecifier;
  self->_cachedSpecifier = v12;

  v14.receiver = self;
  v14.super_class = (Class)AXVoiceOverPunctuationReplacement;
  [(AXVoiceOverPunctuationReplacement *)&v14 viewDidLoad];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsListController_opaque[v3];
    *(void *)&self->AXUISettingsListController_opaque[v3] = v5;

    unsigned int v7 = +[NSMutableArray array];
    v8 = settingsLocString(@"PUNCTUATION_GROUP_PUNCTUATION_LABEL", @"VoiceOverSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_setPunctuation:specifier:" get:"_punctuation:" detail:0 cell:8 edit:0];

    uint64_t v10 = PSIDKey;
    [v9 setObject:@"punctuation" forKeyedSubscript:PSIDKey];
    [v9 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v7 addObject:v9];
    v11 = settingsLocString(@"PUNCTUATION_GROUP_REPLACEMENT_LABEL", @"VoiceOverSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"_setReplacement:specifier:" get:"_replacement:" detail:0 cell:8 edit:0];

    [v12 setObject:@"replacement" forKeyedSubscript:v10];
    [v12 setKeyboardType:0 autoCaps:2 autoCorrection:1];
    [v12 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v7 addObject:v12];
    v13 = settingsLocString(@"PUNCTUATION_GROUP_RULE_LABEL", @"VoiceOverSettings");
    objc_super v14 = +[PSSpecifier groupSpecifierWithName:v13];

    unsigned __int8 v15 = settingsLocString(@"PUNCTUATION_RULE_FOOTER", @"VoiceOverSettings");
    [v14 setProperty:v15 forKey:PSFooterTextGroupKey];

    [v14 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v14 setProperty:@"RuleGroup" forKey:v10];
    [v7 addObject:v14];
    v16 = settingsLocString(@"PUNCTUATION_GROUP_RULE_IGNORE", @"VoiceOverSettings");
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v17 setProperty:&off_229E28 forKey:@"RuleType"];
    [v17 setProperty:@"AXSSPunctuationEntryRuleIgnore" forKey:v10];
    [v7 addObject:v17];
    id v18 = settingsLocString(@"PUNCTUATION_GROUP_RULE_REPLACE", @"VoiceOverSettings");
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v19 setProperty:&off_229E40 forKey:@"RuleType"];
    [v19 setProperty:@"AXSSPunctuationEntryRuleReplace" forKey:v10];
    [v7 addObject:v19];
    v20 = settingsLocString(@"PUNCTUATION_GROUP_RULE_REMOVE", @"VoiceOverSettings");
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v21 setProperty:&off_229E58 forKey:@"RuleType"];
    [v21 setProperty:@"AXSSPunctuationEntryRuleRemove" forKey:v10];
    [v7 addObject:v21];
    id v22 = [v7 copy];
    v23 = *(void **)&self->AXUISettingsListController_opaque[v3];
    *(void *)&self->AXUISettingsListController_opaque[v3] = v22;

    uint64_t v4 = *(void **)&self->AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)reloadSpecifiers
{
  [(AXVoiceOverPunctuationReplacement *)self setSpecifier:self->_cachedSpecifier];
  v3.receiver = self;
  v3.super_class = (Class)AXVoiceOverPunctuationReplacement;
  [(AXVoiceOverPunctuationReplacement *)&v3 reloadSpecifiers];
  [(AXVoiceOverPunctuationReplacement *)self _updateSelectedRuleChoice];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXVoiceOverPunctuationReplacement;
  [(AXVoiceOverPunctuationReplacement *)&v3 willBecomeActive];
  [(AXVoiceOverPunctuationReplacement *)self _updateSelectedRuleChoice];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXVoiceOverPunctuationReplacement;
  [(AXVoiceOverPunctuationReplacement *)&v4 viewWillAppear:a3];
  [(AXVoiceOverPunctuationReplacement *)self _updateSelectedRuleChoice];
}

- (void)_updateSelectedRuleChoice
{
  id v10 = [(AXVoiceOverPunctuationReplacement *)self specifierForID:@"RuleGroup"];
  objc_super v3 = [(AXVoiceOverPunctuationReplacement *)self specifierForID:@"replacement"];
  objc_super v4 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  uint64_t v5 = (char *)[v4 rule];

  if (!v5)
  {
    uint64_t v6 = 0;
    CFStringRef v7 = @"AXSSPunctuationEntryRuleIgnore";
    goto LABEL_7;
  }
  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v6 = 0;
    CFStringRef v7 = @"AXSSPunctuationEntryRuleRemove";
    goto LABEL_7;
  }
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v6 = 1;
    CFStringRef v7 = @"AXSSPunctuationEntryRuleReplace";
LABEL_7:
    v8 = [(AXVoiceOverPunctuationReplacement *)self specifierForID:v7];
    goto LABEL_9;
  }
  v8 = 0;
  uint64_t v6 = 1;
LABEL_9:
  v9 = +[NSNumber numberWithBool:v6];
  [v3 setProperty:v9 forKey:PSEnabledKey];

  [v10 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
  [(AXVoiceOverPunctuationReplacement *)self beginUpdates];
  [(AXVoiceOverPunctuationReplacement *)self reloadSpecifier:v10 animated:1];
  [(AXVoiceOverPunctuationReplacement *)self reloadSpecifier:v3 animated:1];
  [(AXVoiceOverPunctuationReplacement *)self endUpdates];
}

- (void)_setReplacement:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  [v6 setReplacement:v5];

  [(AXVoiceOverPunctuationReplacement *)self _saveIfPossible];
}

- (id)_replacement:(id)a3
{
  objc_super v3 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  objc_super v4 = [v3 replacement];
  id v5 = [v4 localizedCapitalizedString];

  return v5;
}

- (void)_setPunctuation:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  [v6 setPunctuation:v5];

  [(AXVoiceOverPunctuationReplacement *)self _saveIfPossible];
}

- (id)_punctuation:(id)a3
{
  objc_super v3 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
  objc_super v4 = [v3 punctuation];

  if ([v4 length] == (char *)&dword_0 + 1)
  {
    id v5 = [objc_alloc((Class)AXAttributedString) initWithString:v4];
    NSAttributedStringKey v8 = UIAccessibilitySpeechAttributePunctuation;
    v9 = &__kCFBooleanTrue;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v5 setAttributes:v6];

    objc_super v4 = v5;
  }

  return v4;
}

- (void)buttonPickerWantsToInsertText:(id)a3
{
  id v4 = a3;
  id v5 = [(AXVoiceOverPunctuationReplacement *)self cellForSpecifierID:@"punctuation"];
  uint64_t v6 = [v5 editableTextField];
  [v6 setText:v4];

  id v7 = [(AXVoiceOverPunctuationReplacement *)self specifierForID:@"punctuation"];
  [(AXVoiceOverPunctuationReplacement *)self _setPunctuation:v4 specifier:v7];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v23 = a4;
  id v7 = [(AXVoiceOverPunctuationReplacement *)self specifierAtIndexPath:a5];
  NSAttributedStringKey v8 = [v7 propertyForKey:PSIDKey];
  unsigned int v9 = [v8 isEqualToString:@"punctuation"];

  id v10 = v23;
  if (v9)
  {
    v11 = [v23 editableTextField];
    v12 = [v11 rightView];

    if (!v12)
    {
      [v11 setRightViewMode:3];
      v13 = [AXVoiceOverPunctuationPickerButtonSet alloc];
      [v11 bounds];
      objc_super v14 = -[AXVoiceOverPunctuationPickerButtonSet initWithFrame:](v13, "initWithFrame:", 0.0, 0.0, 100.0);
      [(AXVoiceOverPunctuationPickerButtonSet *)v14 layoutSubviews];
      [(AXVoiceOverPunctuationPickerButtonSet *)v14 frame];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(AXVoiceOverPunctuationPickerButtonSet *)v14 circle];
      CGRect BoundingBox = CGPathGetBoundingBox((CGPathRef)[v21 path]);
      double width = BoundingBox.size.width;

      -[AXVoiceOverPunctuationPickerButtonSet setFrame:](v14, "setFrame:", v16, v18, width, v20);
      [(AXVoiceOverPunctuationPickerButtonSet *)v14 addTarget:self action:"_punctuationPickerTapped:" forControlEvents:64];
      [v11 setRightView:v14];
    }
    id v10 = v23;
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  objc_msgSend(*a5, "frame", a3);
  AX_CGRectGetCenter();
  a4->origin.x = v6;
  a4->origin.y = v7;
}

- (void)_punctuationPickerTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(AXVoiceOverPunctuationReplacement *)self view];
  CGFloat v6 = [v5 window];
  CGFloat v7 = [v6 firstResponder];
  [v7 resignFirstResponder];

  double v15 = objc_alloc_init(AXVoiceOverPunctuationSelectionPicker);
  [(AXVoiceOverPunctuationSelectionPicker *)v15 setDelegate:self];
  [(AXVoiceOverPunctuationSelectionPicker *)v15 setModalPresentationStyle:7];
  NSAttributedStringKey v8 = [(AXVoiceOverPunctuationSelectionPicker *)v15 popoverPresentationController];
  [v8 setDelegate:self];
  [v8 setPermittedArrowDirections:1];
  unsigned int v9 = [v4 label];
  [v8 setSourceView:v9];

  id v10 = [v4 label];
  [v10 bounds];
  double v12 = v11;
  v13 = [v4 label];

  [v13 bounds];
  objc_msgSend(v8, "setSourceRect:", v12, v14, 1.0, 1.0);

  [v8 setCanOverlapSourceViewRect:0];
  [(AXVoiceOverPunctuationReplacement *)self presentViewController:v15 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSAttributedStringKey v8 = [(AXVoiceOverPunctuationReplacement *)self specifierForIndexPath:v6];
  v13.receiver = self;
  v13.super_class = (Class)AXVoiceOverPunctuationReplacement;
  [(AXVoiceOverPunctuationReplacement *)&v13 tableView:v7 didSelectRowAtIndexPath:v6];

  unsigned int v9 = [v8 propertyForKey:@"RuleType"];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 integerValue];
    double v12 = [(AXVoiceOverPunctuationReplacement *)self punctuationEntry];
    [v12 setRule:v11];

    [(AXVoiceOverPunctuationReplacement *)self _saveIfPossible];
    [(AXVoiceOverPunctuationReplacement *)self _updateSelectedRuleChoice];
  }
}

- (AXSSPunctuationGroup)punctuationGroup
{
  return self->_punctuationGroup;
}

- (void)setPunctuationGroup:(id)a3
{
}

- (void)setPunctuationEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuationEntry, 0);
  objc_storeStrong((id *)&self->_punctuationGroup, 0);

  objc_storeStrong((id *)&self->_cachedSpecifier, 0);
}

@end