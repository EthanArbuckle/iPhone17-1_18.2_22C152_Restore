@interface AXVoiceOverPunctuationGroupController
- (AXSSPunctuationGroup)punctuationGroup;
- (BOOL)_isEditableTableCell:(id)a3;
- (BOOL)isListeningForNotifications;
- (BOOL)isSystemPunctuationGroup;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (NSUUID)punctuationGroupUUID;
- (id)_basePunctuationGroup:(id)a3;
- (id)_entryNameValue:(id)a3;
- (id)_pronunciationGroupName:(id)a3;
- (id)_systemReplacements:(int64_t)a3;
- (id)localizedNameForCharacter:(unsigned __int16)a3 languageId:(id)a4;
- (id)shareDataCallback;
- (id)specifiers;
- (int64_t)baseGroupToVerbosenessLevel:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addDoneButton;
- (void)_configureEditButton;
- (void)_donePressed;
- (void)_editPressed;
- (void)_keyboardHidden:(id)a3;
- (void)_keyboardShown:(id)a3;
- (void)_listenForNotifications;
- (void)_loadDefaultPunctuationReplacements;
- (void)_loadPunctuationReplacements;
- (void)_punctuationGroupChanged:(id)a3;
- (void)_punctuationGroupChangedFromCoreData:(id)a3;
- (void)_save;
- (void)_setPronunciationGroupName:(id)a3 specifier:(id)a4;
- (void)_sharePressed:(id)a3;
- (void)_updateGroupEntries;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)removeFromParentViewController;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsListeningForNotifications:(BOOL)a3;
- (void)setPunctuationGroup:(id)a3;
- (void)setShareDataCallback:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation AXVoiceOverPunctuationGroupController

- (AXSSPunctuationGroup)punctuationGroup
{
  punctuationGroup = self->_punctuationGroup;
  if (!punctuationGroup)
  {
    v4 = (AXSSPunctuationGroup *)[objc_alloc((Class)AXSSPunctuationGroup) init];
    v5 = self->_punctuationGroup;
    self->_punctuationGroup = v4;

    v6 = +[AXSSPunctuationManager sharedDatabase];
    v7 = [v6 nextDefaultGroupName];
    [(AXSSPunctuationGroup *)self->_punctuationGroup setName:v7];

    v8 = [(AXVoiceOverPunctuationGroupController *)self specifier];
    v9 = [v8 propertyForKey:@"PunctuationBaseGroup"];
    [(AXSSPunctuationGroup *)self->_punctuationGroup setBasePunctuationUUID:v9];

    [(AXVoiceOverPunctuationGroupController *)self _save];
    v10 = +[AXSSPunctuationManager sharedDatabase];
    v11 = [(AXSSPunctuationGroup *)self->_punctuationGroup basePunctuationUUID];
    unsigned __int8 v12 = [v10 isBasePunctuationGroup:v11];

    if ((v12 & 1) == 0)
    {
      v13 = +[NSMutableArray array];
      v14 = +[AXSSPunctuationManager sharedDatabase];
      v15 = [(AXSSPunctuationGroup *)self->_punctuationGroup basePunctuationUUID];
      v16 = [v14 punctuationGroupForUUID:v15];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v17 = [v16 entries];
      id v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v30;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = [*(id *)(*((void *)&v29 + 1) + 8 * i) copy];
            v23 = +[NSUUID UUID];
            [v22 setUuid:v23];

            [v13 addObject:v22];
            v24 = +[AXSSPunctuationManager sharedDatabase];
            [v24 updateEntry:v22];
          }
          id v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v19);
      }

      v25 = +[AXSSPunctuationManager sharedDatabase];
      v26 = [v25 mostBasePunctuationGroupForGroup:v16];
      [(AXSSPunctuationGroup *)self->_punctuationGroup setBasePunctuationUUID:v26];

      [(AXSSPunctuationGroup *)self->_punctuationGroup setEntries:v13];
      [(AXVoiceOverPunctuationGroupController *)self _save];
    }
    punctuationGroup = self->_punctuationGroup;
  }
  v27 = punctuationGroup;

  return v27;
}

- (BOOL)isSystemPunctuationGroup
{
  v3 = +[AXSSPunctuationManager sharedDatabase];
  v4 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroupUUID];
  unsigned __int8 v5 = [v3 isBasePunctuationGroup:v4];

  return v5;
}

- (NSUUID)punctuationGroupUUID
{
  v2 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)_save
{
  v3 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Updating punctuation group from Prefs -> DB: %@", (uint8_t *)&v7, 0xCu);
  }
  unsigned __int8 v5 = +[AXSSPunctuationManager sharedDatabase];
  v6 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  [v5 updatePunctuationGroup:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v7 viewDidDisappear:a3];
  v4 = [(AXVoiceOverPunctuationGroupController *)self view];
  unsigned __int8 v5 = [v4 window];

  if (!v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self];

    [(AXVoiceOverPunctuationGroupController *)self setIsListeningForNotifications:0];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    objc_super v7 = +[NSMutableArray array];
    if (![(AXVoiceOverPunctuationGroupController *)self isSystemPunctuationGroup])
    {
      v8 = settingsLocString(@"PUNCTUATION_GROUP_NAME_LABEL", @"VoiceOverSettings");
      v9 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v8 target:self set:"_setPronunciationGroupName:specifier:" get:"_pronunciationGroupName:" detail:0 cell:8 edit:0];

      uint64_t v10 = PSIDKey;
      [v9 setObject:@"GroupName" forKeyedSubscript:PSIDKey];
      [v9 setKeyboardType:0 autoCaps:2 autoCorrection:1];
      [v7 addObject:v9];
      v11 = settingsLocString(@"BASE_GROUP_LABEL", @"VoiceOverSettings");
      unsigned __int8 v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"_basePunctuationGroup:" detail:0 cell:4 edit:0];

      v13 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
      [v12 setProperty:v13 forKey:@"PunctuationGroup"];

      [v12 setProperty:@"AXBasePunctuationGroup" forKey:v10];
      [v7 addObject:v12];
    }
    if ([(AXVoiceOverPunctuationGroupController *)self isSystemPunctuationGroup])
    {
      uint64_t v14 = PSIDKey;
    }
    else
    {
      v15 = settingsLocString(@"PUNCTUATION_REPLACEMENTS_CUSTOM", @"VoiceOverSettings");
      v16 = +[PSSpecifier groupSpecifierWithName:v15];

      uint64_t v14 = PSIDKey;
      [v16 setProperty:@"CustomPunctuationGroup" forKey:PSIDKey];
      [v7 addObject:v16];
      v17 = settingsLocString(@"CUSTOM_PUNCTUATION_ADD", @"VoiceOverSettings");
      id v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v18 setProperty:@"AddEntry" forKey:v14];
      id v19 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
      [v18 setProperty:v19 forKey:@"PunctuationGroup"];

      [v7 addObject:v18];
    }
    uint64_t v20 = settingsLocString(@"PUNCTUATION_REPLACEMENTS_DEFAULT", @"VoiceOverSettings");
    v21 = +[PSSpecifier groupSpecifierWithName:v20];

    [v21 setProperty:@"DefaultPunctuationGroup" forKey:v14];
    [v7 addObject:v21];
    id v22 = [v7 copy];
    v23 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v22;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)_basePunctuationGroup:(id)a3
{
  v4 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  uint64_t v5 = [v4 basePunctuationUUID];

  v6 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = AXSettingsNameForPunctuationGroupUUID(v5);
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Retrieved group name: %@ %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = AXSettingsNameForPunctuationGroupUUID(v5);

  return v8;
}

- (int64_t)baseGroupToVerbosenessLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:AXSSVoiceOverPunctuationGroupSome])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqual:AXSSVoiceOverPunctuationGroupAll])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqual:AXSSVoiceOverPunctuationGroupNone])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)_systemReplacements:(int64_t)a3
{
  return +[SCRCPunctuationVerboseness verbosenessDictionaryForLevel:a3];
}

- (id)localizedNameForCharacter:(unsigned __int16)a3 languageId:(id)a4
{
  int64_t v4 = AXVOLocalizedStringForCharacter();
  if (!v4) {
    int64_t v4 = (void *)AXCopyUnicodeDescriptionStringForCharacter();
  }

  return v4;
}

- (void)_loadDefaultPunctuationReplacements
{
  v40 = +[NSMutableArray array];
  unsigned int v43 = [(AXVoiceOverPunctuationGroupController *)self isSystemPunctuationGroup];
  if (v43)
  {
    uint64_t v3 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroupUUID];
  }
  else
  {
    int64_t v4 = +[AXSSPunctuationManager sharedDatabase];
    uint64_t v5 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
    uint64_t v3 = [v4 mostBasePunctuationGroupForGroup:v5];
  }
  v38 = (void *)v3;
  v6 = [(AXVoiceOverPunctuationGroupController *)self _systemReplacements:[(AXVoiceOverPunctuationGroupController *)self baseGroupToVerbosenessLevel:v3]];
  objc_super v7 = +[SCRCPunctuationVerboseness userExposedPunctuationCharacters];
  v8 = +[AXLanguageManager sharedInstance];
  v9 = [v8 dialectForSystemLanguage];
  v41 = [v9 specificLanguageID];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
    v39 = v7;
    uint64_t v42 = *(void *)v50;
    do
    {
      v13 = 0;
      id v44 = v11;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v13);
        if ([v7 containsObject:v14])
        {
          id v15 = v14;
          v16 = (const char *)[v15 UTF8String];
          unsigned __int16 v48 = 0;
          unsigned __int16 v48 = strtol(v16, 0, 16);
          v17 = +[NSString stringWithCharacters:&v48 length:1];
          if ((v43 & 1) == 0)
          {
            id v18 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
            uint64_t v19 = [v18 entries];
            if (v19)
            {
              uint64_t v20 = (void *)v19;
              v21 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
              id v22 = [v21 entries];
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472;
              v46[2] = __76__AXVoiceOverPunctuationGroupController__loadDefaultPunctuationReplacements__block_invoke;
              v46[3] = &unk_2090D8;
              id v47 = v17;
              id v23 = [v22 indexOfObjectPassingTest:v46];

              objc_super v7 = v39;
              if (v23 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_30:

                id v11 = v44;
                uint64_t v12 = v42;
                goto LABEL_31;
              }
            }
            else
            {
            }
          }
          id v24 = [objc_alloc((Class)AXSSPunctuationEntry) init];
          [v24 setReplacement:&stru_20F6B8];
          [v24 setPunctuation:v17];
          v25 = [obj objectForKeyedSubscript:v15];
          uint64_t v26 = (int)[v25 intValue];

          if ((unint64_t)(v26 - 1) < 3)
          {
            v27 = [(AXVoiceOverPunctuationGroupController *)self localizedNameForCharacter:v48 languageId:v41];
            [v24 setReplacement:v27];

            uint64_t v26 = 1;
            goto LABEL_20;
          }
          if (v26)
          {
            if (v26 == 4)
            {
              uint64_t v26 = 2;
              goto LABEL_20;
            }
          }
          else
          {
LABEL_20:
            [v24 setRule:v26];
          }
          v28 = [v24 punctuation];
          long long v29 = +[NSCharacterSet whitespaceNewlineAndSpecialCharacterSet];
          unsigned int v30 = [v29 characterIsMember:v48];

          if (v30)
          {
            uint64_t v31 = [(AXVoiceOverPunctuationGroupController *)self localizedNameForCharacter:v48 languageId:v41];

            v28 = (void *)v31;
          }
          if ([(AXVoiceOverPunctuationGroupController *)self isSystemPunctuationGroup]) {
            uint64_t v32 = 0;
          }
          else {
            uint64_t v32 = objc_opt_class();
          }
          if ([(AXVoiceOverPunctuationGroupController *)self isSystemPunctuationGroup]) {
            uint64_t v33 = 4;
          }
          else {
            uint64_t v33 = 2;
          }
          v34 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:"_entryNameValue:" detail:v32 cell:v33 edit:0];
          [v34 setProperty:v24 forKey:@"PunctuationEntry"];
          [v34 setProperty:&__kCFBooleanTrue forKey:@"isSystemPunctuation"];
          v35 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
          [v34 setProperty:v35 forKey:@"PunctuationGroup"];

          [(NSMutableArray *)v40 addObject:v34];
          goto LABEL_30;
        }
LABEL_31:
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v11);
  }

  defaultSpecs = self->_defaultSpecs;
  self->_defaultSpecs = v40;
  v37 = v40;

  [(AXVoiceOverPunctuationGroupController *)self insertContiguousSpecifiers:v37 afterSpecifierID:@"DefaultPunctuationGroup"];
}

id __76__AXVoiceOverPunctuationGroupController__loadDefaultPunctuationReplacements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 punctuation];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_loadPunctuationReplacements
{
  long long v29 = +[NSMutableArray array];
  uint64_t v3 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
    uint64_t v5 = [v4 entries];
    *(_DWORD *)buf = 138412290;
    v36 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Have entries: %@", buf, 0xCu);
  }
  v6 = +[AXLanguageManager sharedInstance];
  objc_super v7 = [v6 dialectForSystemLanguage];
  v27 = [v7 specificLanguageID];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  v9 = [v8 entries];

  id obj = v9;
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v15 = [v14 punctuation];
        v16 = [v14 punctuation];
        id v17 = [v16 length];

        if (v17)
        {
          id v18 = [v14 punctuation];
          id v19 = [v18 characterAtIndex:0];

          uint64_t v20 = +[NSCharacterSet whitespaceNewlineAndSpecialCharacterSet];
          unsigned int v21 = [v20 characterIsMember:v19];

          if (v21)
          {
            uint64_t v22 = [(AXVoiceOverPunctuationGroupController *)self localizedNameForCharacter:v19 languageId:v27];

            id v15 = (void *)v22;
          }
          id v23 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"_entryNameValue:" detail:objc_opt_class() cell:2 edit:0];
          [v23 setProperty:v14 forKey:@"PunctuationEntry"];
          id v24 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
          [v23 setProperty:v24 forKey:@"PunctuationGroup"];

          [(NSMutableArray *)v29 addObject:v23];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }

  replacementSpecs = self->_replacementSpecs;
  self->_replacementSpecs = v29;
  uint64_t v26 = v29;

  [(AXVoiceOverPunctuationGroupController *)self insertContiguousSpecifiers:v26 afterSpecifierID:@"CustomPunctuationGroup"];
}

- (id)_entryNameValue:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"PunctuationEntry"];
  id v4 = (char *)[v3 rule];
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v5 = @"PUNCTUATION_GROUP_RULE_REMOVE";
    goto LABEL_6;
  }
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    objc_super v7 = [v3 replacement];
    v6 = [v7 localizedCapitalizedString];
  }
  else
  {
    if (!v4)
    {
      uint64_t v5 = @"PUNCTUATION_GROUP_RULE_IGNORE";
LABEL_6:
      v6 = settingsLocString(v5, @"VoiceOverSettings");
      goto LABEL_9;
    }
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v4 dealloc];
}

- (void)_updateGroupEntries
{
  [(AXVoiceOverPunctuationGroupController *)self removeContiguousSpecifiers:self->_replacementSpecs];
  [(AXVoiceOverPunctuationGroupController *)self removeContiguousSpecifiers:self->_defaultSpecs];
  [(AXVoiceOverPunctuationGroupController *)self _loadPunctuationReplacements];

  [(AXVoiceOverPunctuationGroupController *)self _loadDefaultPunctuationReplacements];
}

- (void)_punctuationGroupChanged:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __66__AXVoiceOverPunctuationGroupController__punctuationGroupChanged___block_invoke(uint64_t a1)
{
  v2 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Group changed: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) beginUpdates];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 specifierForID:@"GroupName"];
  [v4 reloadSpecifier:v5 animated:1];

  [*(id *)(a1 + 40) _updateGroupEntries];
  v6 = [*(id *)(a1 + 40) specifierForID:@"AXBasePunctuationGroup"];
  [*(id *)(a1 + 40) reloadSpecifier:v6 animated:1];
  objc_super v7 = [*(id *)(a1 + 40) specifierForID:@"AutoSwitch"];
  [*(id *)(a1 + 40) reloadSpecifier:v7 animated:1];
  [*(id *)(a1 + 40) endUpdates];
  v8 = [*(id *)(a1 + 40) table];
  v9 = [*(id *)(a1 + 40) indexPathForSpecifier:v6];
  id v10 = [*(id *)(a1 + 40) indexPathForSpecifier:v7];
  id v11 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v9, v10);
  [v8 reloadRowsAtIndexPaths:v11 withRowAnimation:5];
}

- (void)_punctuationGroupChangedFromCoreData:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

id __78__AXVoiceOverPunctuationGroupController__punctuationGroupChangedFromCoreData___block_invoke(uint64_t a1)
{
  v2 = +[AXSSPunctuationManager sharedDatabase];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 216) uuid];
  uint64_t v4 = [v2 punctuationGroupForUUID:v3];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 216);
  *(void *)(*(void *)(a1 + 32) + 216) = v4;

  v6 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __78__AXVoiceOverPunctuationGroupController__punctuationGroupChangedFromCoreData___block_invoke_cold_1((void *)(a1 + 32), 216, v6);
  }

  return [*(id *)(a1 + 32) _punctuationGroupChanged:*(void *)(a1 + 40)];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v5 viewDidLoad];
  id v3 = [(AXVoiceOverPunctuationGroupController *)self specifier];
  cachedSpecifier = self->_cachedSpecifier;
  self->_cachedSpecifier = v3;

  [(AXVoiceOverPunctuationGroupController *)self _listenForNotifications];
  [(AXVoiceOverPunctuationGroupController *)self _updateGroupEntries];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v4 viewWillAppear:a3];
  [(AXVoiceOverPunctuationGroupController *)self _listenForNotifications];
  [(AXVoiceOverPunctuationGroupController *)self _configureEditButton];
}

- (void)_listenForNotifications
{
  if (![(AXVoiceOverPunctuationGroupController *)self isListeningForNotifications])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_punctuationGroupChanged:" name:@"AXVoiceOverPunctuationGroupChangedNotification" object:0];

    objc_super v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_punctuationGroupChangedFromCoreData:" name:AXSSVoiceOverPunctuationGroupsChangedNotification object:0];

    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_keyboardShown:" name:UIKeyboardDidShowNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_keyboardHidden:" name:UIKeyboardDidHideNotification object:0];

    [(AXVoiceOverPunctuationGroupController *)self setIsListeningForNotifications:1];
    [(AXVoiceOverPunctuationGroupController *)self _punctuationGroupChanged:0];
  }
}

- (void)_keyboardShown:(id)a3
{
  id v8 = [a3 userInfo];
  objc_super v4 = [v8 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  double v6 = v5;
  objc_super v7 = [(AXVoiceOverPunctuationGroupController *)self table];
  objc_msgSend(v7, "setContentInset:", 0.0, 0.0, v6, 0.0);
}

- (void)_keyboardHidden:(id)a3
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v6 = [(AXVoiceOverPunctuationGroupController *)self table];
  objc_msgSend(v6, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
}

- (void)reloadSpecifiers
{
  [(AXVoiceOverPunctuationGroupController *)self setSpecifier:self->_cachedSpecifier];
  v3.receiver = self;
  v3.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v3 reloadSpecifiers];
  [(AXVoiceOverPunctuationGroupController *)self _updateGroupEntries];
}

- (void)removeFromParentViewController
{
  v4.receiver = self;
  v4.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v4 removeFromParentViewController];
  objc_super v3 = [(AXVoiceOverPunctuationGroupController *)self specifier];
  [v3 removePropertyForKey:@"PunctuationGroup"];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AXVoiceOverPunctuationGroupController;
  id v6 = a4;
  [(AXVoiceOverPunctuationGroupController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  objc_super v7 = -[AXVoiceOverPunctuationGroupController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v10.receiver, v10.super_class);

  id v8 = [v7 propertyForKey:PSIDKey];
  unsigned int v9 = [v8 isEqualToString:@"AddEntry"];

  if (v9) {
    [v7 removePropertyForKey:@"PunctuationEntry"];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

- (void)_setPronunciationGroupName:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = +[AXSSPunctuationManager sharedDatabase];
  objc_super v7 = [v6 punctuationGroups];

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      id v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v11) name];
        unsigned int v13 = [v5 isEqualToString:v12];

        if (v13)
        {
          id v15 = settingsLocString(@"PUNCTUATION", @"VoiceOverSettings");
          v16 = settingsLocString(@"PUNCTUATON_NAME_IN_USE", @"VoiceOverSettings");
          id v17 = +[UIAlertController alertControllerWithTitle:v15 message:v16 preferredStyle:1];

          id v18 = settingsLocString(@"OK", @"Accessibility");
          id v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:0];

          [v17 addAction:v19];
          [(AXVoiceOverPunctuationGroupController *)self presentViewController:v17 animated:1 completion:0];

          goto LABEL_12;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if ([v5 length])
  {
    uint64_t v14 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
    [v14 setName:v5];

    [(AXVoiceOverPunctuationGroupController *)self _save];
  }
LABEL_12:
}

- (id)_pronunciationGroupName:(id)a3
{
  if ([(AXVoiceOverPunctuationGroupController *)self isSystemPunctuationGroup])
  {
    objc_super v4 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroupUUID];
    uint64_t v5 = AXSettingsNameForPunctuationGroupUUID(v4);
  }
  else
  {
    id v6 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AXVoiceOverPunctuationGroupController _pronunciationGroupName:](self, v6);
    }

    objc_super v4 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
    uint64_t v5 = [v4 name];
  }
  objc_super v7 = (void *)v5;

  return v7;
}

- (BOOL)_isEditableTableCell:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 propertyForKey:@"PunctuationEntry"];
  if (v4)
  {
    uint64_t v5 = [v3 propertyForKey:@"isSystemPunctuation"];
    if ([v5 BOOLValue])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      objc_super v7 = [v3 propertyForKey:PSIDKey];
      unsigned int v6 = [v7 isEqualToString:@"AddEntry"] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  objc_super v4 = self;
  uint64_t v5 = [(AXVoiceOverPunctuationGroupController *)self specifierAtIndexPath:a4];
  LOBYTE(v4) = [(AXVoiceOverPunctuationGroupController *)v4 _isEditableTableCell:v5];

  return (char)v4;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(AXVoiceOverPunctuationGroupController *)self specifierAtIndexPath:a4];
  int64_t v6 = [(AXVoiceOverPunctuationGroupController *)self _isEditableTableCell:v5];

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    int64_t v6 = [(AXVoiceOverPunctuationGroupController *)self specifierAtIndexPath:a5];
    objc_super v7 = [v6 propertyForKey:@"PunctuationEntry"];
    if (v7)
    {
      id v8 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
      id v9 = [v8 entries];
      id v10 = [v9 mutableCopy];

      [v10 removeObject:v7];
      id v11 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
      [v11 setEntries:v10];

      uint64_t v12 = +[AXSSPunctuationManager sharedDatabase];
      [v12 removeEntry:v7];

      [(AXVoiceOverPunctuationGroupController *)self _save];
      unsigned int v13 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Remove entry: %@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v14 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v10;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Remaining entries: %@", (uint8_t *)&v15, 0xCu);
      }

      [(AXVoiceOverPunctuationGroupController *)self beginUpdates];
      [(AXVoiceOverPunctuationGroupController *)self removeSpecifier:v6 animated:1];
      [(NSMutableArray *)self->_replacementSpecs removeObject:v6];
      [(AXVoiceOverPunctuationGroupController *)self endUpdates];
    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  [(AXVoiceOverPunctuationGroupController *)self setEditing:1 animated:1];

  [(AXVoiceOverPunctuationGroupController *)self _configureEditButton];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  [(AXVoiceOverPunctuationGroupController *)self setEditing:0 animated:1];

  [(AXVoiceOverPunctuationGroupController *)self _configureEditButton];
}

- (void)_sharePressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  int64_t v6 = [v5 jsonRepresentation];

  objc_super v7 = [AXVoiceOverPunctuationShareSource alloc];
  id v8 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  id v9 = [v8 name];
  id v10 = [(AXVoiceOverPunctuationShareSource *)v7 initWithData:v6 fileName:v9];

  if (v10)
  {
    if (_AXSInUnitTestMode())
    {
      id v11 = [(AXVoiceOverPunctuationGroupController *)self shareDataCallback];

      if (v11)
      {
        uint64_t v12 = [(AXVoiceOverPunctuationGroupController *)self shareDataCallback];
        unsigned int v13 = [(AXVoiceOverPunctuationShareSource *)v10 path];
        ((void (**)(void, void *))v12)[2](v12, v13);
      }
    }
    else
    {
      id v14 = objc_alloc((Class)UIActivityViewController);
      long long v20 = v10;
      int v15 = +[NSArray arrayWithObjects:&v20 count:1];
      id v16 = [v14 initWithActivityItems:v15 applicationActivities:0];

      v19[0] = UIActivityTypePrint;
      v19[1] = UIActivityTypeMarkupAsPDF;
      v19[2] = UIActivityTypeAssignToContact;
      v19[3] = UIActivityTypeSaveToCameraRoll;
      v19[4] = UIActivityTypeAddToReadingList;
      v19[5] = UIActivityTypeOpenInIBooks;
      id v17 = +[NSArray arrayWithObjects:v19 count:6];
      [v16 setExcludedActivityTypes:v17];

      id v18 = [v16 popoverPresentationController];
      [v18 setBarButtonItem:v4];

      [(AXVoiceOverPunctuationGroupController *)self presentViewController:v16 animated:1 completion:&__block_literal_global_5];
    }
  }
}

- (void)_configureEditButton
{
  id v3 = [(AXVoiceOverPunctuationGroupController *)self punctuationGroup];
  unsigned __int8 v4 = [v3 isSystemPunctuationGroup];

  id v5 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"_sharePressed:"];
  int64_t v6 = [(AXVoiceOverPunctuationGroupController *)self specifiers];
  objc_super v7 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_392);
  id v8 = [v7 count];

  if ((uint64_t)v8 < 1)
  {
    if ((v4 & 1) == 0)
    {
      id v9 = [(AXVoiceOverPunctuationGroupController *)self navigationItem];
      [v9 setRightBarButtonItem:v5];
    }
    [(AXVoiceOverPunctuationGroupController *)self setEditing:0 animated:1];
  }
  else if ([(AXVoiceOverPunctuationGroupController *)self isEditing])
  {
    [(AXVoiceOverPunctuationGroupController *)self _addDoneButton];
  }
  else
  {
    id v10 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_editPressed"];
    if ((v4 & 1) == 0)
    {
      id v11 = [(AXVoiceOverPunctuationGroupController *)self navigationItem];
      v13[0] = v5;
      v13[1] = v10;
      uint64_t v12 = +[NSArray arrayWithObjects:v13 count:2];
      [v11 setRightBarButtonItems:v12];
    }
  }
}

BOOL __61__AXVoiceOverPunctuationGroupController__configureEditButton__block_invoke(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  unsigned __int8 v4 = [(PSSpecifier *)a2 propertyForKey:@"PunctuationEntry", a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_addDoneButton
{
  id v3 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
  unsigned __int8 v4 = [(AXVoiceOverPunctuationGroupController *)self navigationItem];
  id v6 = v3;
  BOOL v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 setRightBarButtonItems:v5];
}

- (void)_editPressed
{
  [(AXVoiceOverPunctuationGroupController *)self setEditing:1 animated:1];

  [(AXVoiceOverPunctuationGroupController *)self _addDoneButton];
}

- (void)_donePressed
{
  [(AXVoiceOverPunctuationGroupController *)self setEditing:0 animated:1];

  [(AXVoiceOverPunctuationGroupController *)self _configureEditButton];
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXVoiceOverPunctuationGroupController;
  [(AXVoiceOverPunctuationGroupController *)&v3 willResignActive];
  if ([(AXVoiceOverPunctuationGroupController *)self isEditing]) {
    [(AXVoiceOverPunctuationGroupController *)self _donePressed];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXVoiceOverPunctuationGroupController;
  -[AXVoiceOverPunctuationGroupController setEditing:animated:](&v11, "setEditing:animated:");
  objc_super v7 = [(AXVoiceOverPunctuationGroupController *)self specifierForID:@"AddEntry"];
  id v8 = +[NSNumber numberWithInt:!v5];
  [v7 setProperty:v8 forKey:PSEnabledKey];

  [(AXVoiceOverPunctuationGroupController *)self reloadSpecifier:v7 animated:v4];
  if (!v5)
  {
    id v9 = [(AXVoiceOverPunctuationGroupController *)self cellForSpecifierID:@"GroupName"];
    id v10 = [v9 editableTextField];
    [v10 resignFirstResponder];
  }
}

- (void)setPunctuationGroup:(id)a3
{
}

- (id)shareDataCallback
{
  return self->_shareDataCallback;
}

- (void)setShareDataCallback:(id)a3
{
}

- (BOOL)isListeningForNotifications
{
  return self->_isListeningForNotifications;
}

- (void)setIsListeningForNotifications:(BOOL)a3
{
  self->_isListeningForNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareDataCallback, 0);
  objc_storeStrong((id *)&self->_punctuationGroup, 0);
  objc_storeStrong((id *)&self->_defaultSpecs, 0);
  objc_storeStrong((id *)&self->_replacementSpecs, 0);

  objc_storeStrong((id *)&self->_cachedSpecifier, 0);
}

void __78__AXVoiceOverPunctuationGroupController__punctuationGroupChangedFromCoreData___block_invoke_cold_1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*a1 + a2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Re-retrieved group: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_pronunciationGroupName:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 punctuationGroup];
  int v4 = [v3 name];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Retrieve group name: %@", (uint8_t *)&v5, 0xCu);
}

@end