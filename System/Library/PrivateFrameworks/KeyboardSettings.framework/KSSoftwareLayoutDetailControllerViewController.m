@interface KSSoftwareLayoutDetailControllerViewController
- (BOOL)showingLanguagesSection;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)multilingualSet;
- (NSString)inputMode;
- (id)newSpecifiers;
- (id)newSpecifiersForChineseShuangpin;
- (id)newSpecifiersForChineseWubi;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)reloadKeyboardSpecifiers;
- (void)reloadSoftwareLayoutSpecifiersWithMultilingualSet:(id)a3;
- (void)removeInputModeInMultilingualSet:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setMultilingualSet:(id)a3;
- (void)setShowingLanguagesSection:(BOOL)a3;
- (void)setShuangpinType:(id)a3;
- (void)setSoftwareLayout:(id)a3;
- (void)setWubiStandard:(int)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTitle;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation KSSoftwareLayoutDetailControllerViewController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  [(KSSoftwareLayoutDetailControllerViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  [(KSSoftwareLayoutDetailControllerViewController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)updateTitle
{
  if ([(NSArray *)[(KSSoftwareLayoutDetailControllerViewController *)self multilingualSet] count] < 2)
  {
    [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
    id v3 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:TIInputModeGetLanguageWithRegion()];
  }
  else
  {
    id v3 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModes([(KSSoftwareLayoutDetailControllerViewController *)self multilingualSet]);
  }
  id v4 = v3;
  v5 = (void *)[(KSSoftwareLayoutDetailControllerViewController *)self navigationItem];
  [v5 setTitle:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  [(KSSoftwareLayoutDetailControllerViewController *)&v4 viewWillAppear:a3];
  [(KSSoftwareLayoutDetailControllerViewController *)self updateTitle];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    id result = [(KSSoftwareLayoutDetailControllerViewController *)self newSpecifiers];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)newSpecifiers
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
  if (KSInputModeIsChineseShuangpin())
  {
    return [(KSSoftwareLayoutDetailControllerViewController *)self newSpecifiersForChineseShuangpin];
  }
  else if (KSInputModeIsChineseWubi())
  {
    return [(KSSoftwareLayoutDetailControllerViewController *)self newSpecifiersForChineseWubi];
  }
  else
  {
    NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
    v60 = (void *)[(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"sw"];
    uint64_t v3 = [(KSSoftwareLayoutDetailControllerViewController *)self multilingualSet];
    if (_os_feature_enabled_impl()) {
      BOOL v4 = [(NSArray *)v3 count] > 1;
    }
    else {
      BOOL v4 = 0;
    }
    v5 = (void *)MEMORY[0x263EFF9B0];
    TIInputModeGetNormalizedIdentifier();
    obuint64_t j = (id)[v5 orderedSetWithArray:UIKeyboardGetSupportedSoftwareKeyboardsForInputMode()];
    v59 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count") + 1);
    if (_os_feature_enabled_impl()) {
      BOOL v6 = [TIUIGetAddableInputModesForMultilingualSet(v3) count] != 0;
    }
    else {
      BOOL v6 = 0;
    }
    [(KSSoftwareLayoutDetailControllerViewController *)self setShowingLanguagesSection:v6 | v4];
    int v54 = v6 || v4;
    if (v6 || v4)
    {
      if ((TIUIMultilingualSetContainsTransliterationInputModes(v3) & 1) == 0)
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        uint64_t v7 = [(NSArray *)v3 countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v78 != v9) {
                objc_enumerationMutation(v3);
              }
              TIInputModeGetNormalizedIdentifier();
              [obj addObjectsFromArray:UIKeyboardGetSupportedSoftwareKeyboardsForInputMode()];
            }
            uint64_t v8 = [(NSArray *)v3 countByEnumeratingWithState:&v77 objects:v85 count:16];
          }
          while (v8);
        }
      }
      v11 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_DETAIL_LANGUAGES_TITLE", &stru_2703C6C20, @"Keyboard"));
      BOOL v52 = v4;
      if (v4)
      {
        char v12 = [(NSArray *)v3 count] != 2 || v6;
        v13 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v12) {
          v14 = @"MULTILINGUAL_DETAIL_FOOTER_3";
        }
        else {
          v14 = @"MULTILINGUAL_DETAIL_FOOTER_2";
        }
      }
      else
      {
        v13 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = @"MULTILINGUAL_DETAIL_FOOTER_1";
      }
      uint64_t v15 = [v13 localizedStringForKey:v14 value:&stru_2703C6C20 table:@"Keyboard"];
      [v11 setProperty:v15 forKey:*MEMORY[0x263F600F8]];
      [v59 addObject:v11];
      [(NSArray *)v3 firstObject];
      [MEMORY[0x263EFF960] preferredLanguages];
      MultilingualSetFromInputModesWithPreferredLanguages = (void *)TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
      long long v73 = 0u;
      long long v74 = 0u;
      v53 = v3;
      if (![MultilingualSetFromInputModesWithPreferredLanguages count]) {
        MultilingualSetFromInputModesWithPreferredLanguages = v3;
      }
      long long v75 = 0uLL;
      long long v76 = 0uLL;
      uint64_t v17 = [MultilingualSetFromInputModesWithPreferredLanguages countByEnumeratingWithState:&v73 objects:v84 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v74;
        uint64_t v20 = *MEMORY[0x263F60138];
        uint64_t v21 = *MEMORY[0x263F60308];
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v74 != v19) {
              objc_enumerationMutation(MultilingualSetFromInputModesWithPreferredLanguages);
            }
            uint64_t v23 = *(void *)(*((void *)&v73 + 1) + 8 * j);
            if ((TIInputModeIsMultilingualOnly() & 1) == 0)
            {
              v24 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", TIInputModeGetLanguageWithRegion()), 0, 0, 0, 0, 3, 0);
              [v24 setProperty:v23 forKey:v20];
              [v24 setProperty:@"language" forKey:v21];
              [v59 addObject:v24];
            }
          }
          uint64_t v18 = [MultilingualSetFromInputModesWithPreferredLanguages countByEnumeratingWithState:&v73 objects:v84 count:16];
        }
        while (v18);
      }
      uint64_t v3 = v53;
      BOOL v4 = v52;
      if (v6)
      {
        v25 = (void *)MEMORY[0x263F5FC40];
        uint64_t v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_DETAIL_ADD_LANGUAGE", &stru_2703C6C20, @"Keyboard");
        v27 = (void *)[v25 preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        [v27 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
        [v59 addObject:v27];
      }
    }
    if (v4)
    {
      v28 = objc_msgSend(MEMORY[0x263F1C740], "multilingualSetsFromInputModeIdentifiers:", +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"));
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v69 objects:v83 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v70;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v70 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*((void *)&v69 + 1) + 8 * k) identifier];
            MultilingualSet = (void *)TIInputModeGetMultilingualSet();
            if (TIUIGetMultlingualSetsAreEqual(v3, MultilingualSet))
            {
              [MultilingualSet firstObject];
              v34 = (void *)[(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"sw"];
              if (([v34 isEqualToString:v60] & 1) == 0) {
                [obj removeObject:v34];
              }
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v69 objects:v83 count:16];
        }
        while (v30);
      }
    }
    else
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v35 = +[KSKeyboardListController inputModes];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v82 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v66;
        do
        {
          for (uint64_t m = 0; m != v37; ++m)
          {
            if (*(void *)v66 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v65 + 1) + 8 * m);
            if (!_os_feature_enabled_impl()
              || (unint64_t)[TIUIInputModeGetMultilingualSet(v40) count] <= 1)
            {
              if ([NormalizedIdentifier isEqualToString:TIInputModeGetNormalizedIdentifier()])
              {
                v41 = (void *)[(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"sw"];
                if (([v41 isEqualToString:v60] & 1) == 0) {
                  [obj removeObject:v41];
                }
              }
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:v82 count:16];
        }
        while (v37);
      }
    }
    if (v54) {
      v42 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_DETAIL_LAYOUTS_TITLE", &stru_2703C6C20, @"Keyboard"));
    }
    else {
      v42 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:0];
    }
    v43 = v42;
    [v42 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v56 = v43;
    [v59 addObject:v43];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v44 = [obj countByEnumeratingWithState:&v61 objects:v81 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v62;
      uint64_t v47 = *MEMORY[0x263F60138];
      uint64_t v48 = *MEMORY[0x263F60200];
      do
      {
        for (uint64_t n = 0; n != v45; ++n)
        {
          if (*(void *)v62 != v46) {
            objc_enumerationMutation(obj);
          }
          v50 = *(void **)(*((void *)&v61 + 1) + 8 * n);
          if (![v50 isEqualToString:@"Korean-With-QWERTY"]
            || _os_feature_enabled_impl())
          {
            v51 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v50, &stru_2703C6C20, @"KeyboardLayouts"), self, 0, 0, 0, 3, 0);
            [v51 setProperty:v50 forKey:v47];
            if ([v60 isEqualToString:v50]) {
              [v56 setProperty:v51 forKey:v48];
            }
            [v59 addObject:v51];
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v61 objects:v81 count:16];
      }
      while (v45);
    }
    return v59;
  }
}

- (id)newSpecifiersForChineseShuangpin
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = KSGetShuangpinTypes();
  int v4 = KSGetCurrentShuangpinType();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  BOOL v6 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:0];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  uint64_t v17 = v6;
  [v5 addObject:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v3;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x263F60138];
    uint64_t v16 = *MEMORY[0x263F60200];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v13 = [v12 integerValue];
        v14 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:KSGetShuangpinNameFromType(v13) target:self set:0 get:0 detail:0 cell:3 edit:0];
        objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v12, "stringValue"), v10);
        if (v4 == v13) {
          [v17 setProperty:v14 forKey:v16];
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)newSpecifiersForChineseWubi
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = KSGetWubiStandards();
  int v4 = KSGetCurrentWubiStandard();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  BOOL v6 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:0];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  uint64_t v17 = v6;
  [v5 addObject:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v3;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x263F60138];
    uint64_t v16 = *MEMORY[0x263F60200];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unsigned int v13 = [v12 integerValue];
        v14 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:KSGetWubiStandardName(v13) target:self set:0 get:0 detail:0 cell:3 edit:0];
        objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v12, "stringValue"), v10);
        if (v4 == v13) {
          [v17 setProperty:v14 forKey:v16];
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "specifier");
  return objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60308]), "isEqual:", @"language") ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  -[KSSoftwareLayoutDetailControllerViewController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_);
  uint64_t v7 = [a3 cellForRowAtIndexPath:a4];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
    if (KSInputModeIsChineseShuangpin())
    {
      uint64_t v9 = (void *)[v8 specifier];
      uint64_t v10 = (void *)[v9 propertyForKey:*MEMORY[0x263F60138]];
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
      if (v11) {
        [(KSSoftwareLayoutDetailControllerViewController *)self setShuangpinType:v11];
      }
    }
    else
    {
      [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
      IsChineseWubuint64_t i = KSInputModeIsChineseWubi();
      unsigned int v13 = (void *)[v8 specifier];
      v14 = (void *)[v13 propertyForKey:*MEMORY[0x263F60138]];
      uint64_t v15 = v14;
      if (IsChineseWubi)
      {
        if (v14) {
          -[KSSoftwareLayoutDetailControllerViewController setWubiStandard:](self, "setWubiStandard:", [v14 integerValue]);
        }
      }
      else if ([v14 length])
      {
        [(KSSoftwareLayoutDetailControllerViewController *)self setSoftwareLayout:v15];
      }
    }
  }
}

- (NSString)inputMode
{
  id result = self->_inputMode;
  if (!result)
  {
    int v4 = (void *)[(KSSoftwareLayoutDetailControllerViewController *)self specifier];
    id result = (NSString *)objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60138]), "copy");
    self->_inputMode = result;
  }
  return result;
}

- (NSArray)multilingualSet
{
  v6[1] = *MEMORY[0x263EF8340];
  id result = self->_multilingualSet;
  if (!result)
  {
    int v4 = (void *)[(KSSoftwareLayoutDetailControllerViewController *)self specifier];
    v5 = (void *)[v4 propertyForKey:*MEMORY[0x263F60308]];
    if (!v5)
    {
      v6[0] = [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
      v5 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    }
    id result = v5;
    self->_multilingualSet = result;
  }
  return result;
}

- (void)setSoftwareLayout:(id)a3
{
  id v5 = (id)objc_msgSend(+[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"), "mutableCopy");
  if (![v5 count]) {
    -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:]();
  }
  if ([v5 count])
  {
    uint64_t v6 = objc_msgSend(v5, "indexOfObject:", -[KSSoftwareLayoutDetailControllerViewController inputMode](self, "inputMode"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:]();
    }
    uint64_t v7 = v6;
    if (!_os_feature_enabled_impl()
      || [(NSArray *)[(KSSoftwareLayoutDetailControllerViewController *)self multilingualSet] count] < 2)
    {
      [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
      id v11 = (id)[(id)TIInputModeGetComponentsFromIdentifier() mutableCopy];
      char v12 = (void *)[v11 objectForKey:@"sw"];
      if (v12 && ([v12 isEqualToString:a3] & 1) != 0) {
        return;
      }
      [v11 setObject:a3 forKey:@"sw"];
      uint64_t IdentifierFromComponents = UIKeyboardInputModeGetIdentifierFromComponents();
      [v5 replaceObjectAtIndex:v7 withObject:IdentifierFromComponents];
      [(KSSoftwareLayoutDetailControllerViewController *)self setInputMode:IdentifierFromComponents];
      goto LABEL_20;
    }
    [(KSSoftwareLayoutDetailControllerViewController *)self inputMode];
    MultilingualID = (void *)TIInputModeGetMultilingualID();
    if (![MultilingualID length]) {
      -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:]();
    }
    if ([MultilingualID length] && objc_msgSend(v5, "count"))
    {
      unint64_t v9 = 0;
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        [v5 objectAtIndexedSubscript:v9];
        if ([(id)TIInputModeGetMultilingualID() isEqualToString:MultilingualID])
        {
          if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v10 = v9;
          }
          [v5 objectAtIndexedSubscript:v9];
          TIInputModeGetNormalizedIdentifier();
          if ([(id)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode() containsObject:a3])break; {
        }
          }
        if (++v9 >= [v5 count]) {
          return;
        }
      }
      [v5 objectAtIndexedSubscript:v9];
      uint64_t v14 = UIKeyboardInputModeWithNewSWLayout();
      if (v9 == v10)
      {
        [v5 replaceObjectAtIndex:v9 withObject:v14];
      }
      else
      {
        if (v9 <= v10) {
          -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:].cold.4();
        }
        [v5 removeObjectAtIndex:v9];
        [v5 insertObject:v14 atIndex:v10];
      }
      [(KSSoftwareLayoutDetailControllerViewController *)self setInputMode:v14];
      [(KSSoftwareLayoutDetailControllerViewController *)self setMultilingualSet:TIInputModeGetMultilingualSetFromInputModes()];
LABEL_20:
      +[KSKeyboardListController setInputModes:v5];
    }
  }
}

- (void)setShuangpinType:(id)a3
{
  id v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v5 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E860]];
  KSUpdateShuangpinSWLayout();
  [(KSSoftwareLayoutDetailControllerViewController *)self reloadKeyboardSpecifiers];
}

- (void)setWubiStandard:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setValue:v6 forPreferenceKey:*MEMORY[0x263F7E950]];
  [(KSSoftwareLayoutDetailControllerViewController *)self reloadKeyboardSpecifiers];
}

- (void)removeInputModeInMultilingualSet:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v4 = (void *)[MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = a3;
  NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
  obuint64_t j = TIUIGetPairedInputModesForInputMode(NormalizedIdentifier);
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * v9);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = [(KSSoftwareLayoutDetailControllerViewController *)self multilingualSet];
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
              if ([(id)TIInputModeGetNormalizedIdentifier() isEqualToString:v10]) {
                [v4 addObject:v16];
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v13);
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }
  uint64_t v17 = (void *)[(NSArray *)[(KSSoftwareLayoutDetailControllerViewController *)self multilingualSet] mutableCopy];
  [v17 removeObject:v19];
  [v17 removeObjectsInArray:v4];
  -[KSSoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", [v17 firstObject]);
  [(KSSoftwareLayoutDetailControllerViewController *)self setMultilingualSet:v17];
  uint64_t v18 = objc_msgSend(+[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"), "mutableCopy");
  [v18 removeObject:v19];
  [v18 removeObjectsInArray:v4];
  +[KSKeyboardListController setInputModes:v18];
  [(KSSoftwareLayoutDetailControllerViewController *)self reloadSpecifiers];
  [(KSSoftwareLayoutDetailControllerViewController *)self reloadKeyboardSpecifiers];
  [(KSSoftwareLayoutDetailControllerViewController *)self updateTitle];
}

- (void)reloadKeyboardSpecifiers
{
  v2 = objc_msgSend((id)-[KSSoftwareLayoutDetailControllerViewController parentController](self, "parentController"), "parentController");
  if (objc_opt_respondsToSelector())
  {
    [v2 setNeedsReloadSpecifiers:1];
  }
}

- (void)reloadSoftwareLayoutSpecifiersWithMultilingualSet:(id)a3
{
  -[KSSoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", [a3 firstObject]);
  [(KSSoftwareLayoutDetailControllerViewController *)self setMultilingualSet:a3];
  [(KSSoftwareLayoutDetailControllerViewController *)self reloadSpecifiers];
  [(KSSoftwareLayoutDetailControllerViewController *)self reloadKeyboardSpecifiers];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  int64_t result = 0;
  if ([(KSSoftwareLayoutDetailControllerViewController *)self showingLanguagesSection])
  {
    if (![a4 section] && objc_msgSend(a4, "row") >= 1)
    {
      uint64_t v7 = objc_msgSend(-[KSSoftwareLayoutDetailControllerViewController specifiers](self, "specifiers"), "objectAtIndex:", objc_msgSend(a4, "row") + 1);
      if (objc_msgSend((id)objc_msgSend(v7, "propertyForKey:", *MEMORY[0x263F60308]), "isEqual:", @"language")) {
        return 1;
      }
    }
  }
  return result;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    if ([(KSSoftwareLayoutDetailControllerViewController *)self showingLanguagesSection])
    {
      if (![a5 section] && objc_msgSend(a5, "row") >= 1)
      {
        uint64_t v7 = objc_msgSend(-[KSSoftwareLayoutDetailControllerViewController specifiers](self, "specifiers"), "objectAtIndex:", objc_msgSend(a5, "row") + 1);
        if (objc_msgSend((id)objc_msgSend(v7, "propertyForKey:", *MEMORY[0x263F60308]), "isEqual:", @"language"))
        {
          uint64_t v8 = [v7 propertyForKey:*MEMORY[0x263F60138]];
          [(KSSoftwareLayoutDetailControllerViewController *)self removeSpecifier:v7 animated:1];
          [(KSSoftwareLayoutDetailControllerViewController *)self removeInputModeInMultilingualSet:v8];
        }
      }
    }
  }
}

- (void)setInputMode:(id)a3
{
}

- (void)setMultilingualSet:(id)a3
{
}

- (BOOL)showingLanguagesSection
{
  return self->_showingLanguagesSection;
}

- (void)setShowingLanguagesSection:(BOOL)a3
{
  self->_showingLanguagesSectiouint64_t n = a3;
}

- (void)setSoftwareLayout:.cold.1()
{
}

- (void)setSoftwareLayout:.cold.2()
{
  __assert_rtn("-[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:]", "KSSoftwareLayoutDetailControllerViewController.m", 328, "indexOfInputMode != NSNotFound");
}

- (void)setSoftwareLayout:.cold.3()
{
}

- (void)setSoftwareLayout:.cold.4()
{
}

@end