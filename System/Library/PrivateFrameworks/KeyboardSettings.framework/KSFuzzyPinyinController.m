@interface KSFuzzyPinyinController
- (NSArray)fuzzyPinyinPairSpecifiers;
- (NSMutableSet)fuzzyPinyinPairs;
- (PSSpecifier)fuzzyPinyinSpecifier;
- (id)keyboardPreferenceValue:(id)a3;
- (id)readFuzzyPinyinPairs;
- (id)specifiers;
- (void)dealloc;
- (void)emitNavigationEventForFuzzyPinyinController;
- (void)fuzzyPinyinPairSpecifiers;
- (void)setFuzzyPinyinPairSpecifiers:(id)a3;
- (void)setFuzzyPinyinPairs:(id)a3;
- (void)setFuzzyPinyinSpecifier:(id)a3;
- (void)setKeyboardPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation KSFuzzyPinyinController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSFuzzyPinyinController;
  [(KSFuzzyPinyinController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSFuzzyPinyinController;
  [(KSFuzzyPinyinController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSFuzzyPinyinController;
  [(KSFuzzyPinyinController *)&v4 viewDidAppear:a3];
  [(KSFuzzyPinyinController *)self emitNavigationEventForFuzzyPinyinController];
}

- (NSArray)fuzzyPinyinPairSpecifiers
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  fuzzyPinyinPairSpecifiers = self->_fuzzyPinyinPairSpecifiers;
  if (!fuzzyPinyinPairSpecifiers)
  {
    [(KSFuzzyPinyinController *)self setFuzzyPinyinPairs:[(KSFuzzyPinyinController *)self readFuzzyPinyinPairs]];
    v2 = (void *)[MEMORY[0x263F7E528] validFuzzyPinyinPairs];
    fuzzyPinyinPairSpecifiers = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      unint64_t v5 = 0x263F08000uLL;
      uint64_t v6 = *(void *)v23;
      uint64_t v19 = *MEMORY[0x263F60138];
      uint64_t v18 = *MEMORY[0x263F60170];
      uint64_t v16 = *MEMORY[0x263F5FFE0];
      uint64_t v17 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v2);
          }
          v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 1760), "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"FUZZY_PINYIN_PAIR_FORMAT", &stru_2703C6C20, @"Keyboard");
          if ([v8 count] != 2) {
            -[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers]();
          }
          if ([v8 count] == 2)
          {
            uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, objc_msgSend(v8, "objectAtIndex:", 0), objc_msgSend(v8, "objectAtIndex:", 1));
            v11 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];
            [v11 setProperty:objc_msgSend(NSString, "stringWithFormat:", @"%@↔︎%@", objc_msgSend(v8, "objectAtIndexedSubscript:", 0), objc_msgSend(v8, "objectAtIndexedSubscript:", 1)), v19 forKey];
            [v11 setProperty:v8 forKey:@"TISpecifierKeyFuzzyPinyinPair"];
            [v11 setProperty:&unk_2703CE930 forKey:v18];
            v12 = NSNumber;
            uint64_t v13 = [(NSMutableSet *)[(KSFuzzyPinyinController *)self fuzzyPinyinPairs] containsObject:v8];
            v14 = v12;
            unint64_t v5 = 0x263F08000;
            objc_msgSend(v11, "setProperty:forKey:", objc_msgSend(v14, "numberWithBool:", v13), v17);
            [v11 setProperty:objc_opt_class() forKey:v16];
            [(NSArray *)fuzzyPinyinPairSpecifiers addObject:v11];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v4);
    }
    self->_fuzzyPinyinPairSpecifiers = fuzzyPinyinPairSpecifiers;
  }
  return fuzzyPinyinPairSpecifiers;
}

- (id)readFuzzyPinyinPairs
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v3 = (void *)[v2 valueForPreferenceKey:*MEMORY[0x263F7E738]];
  uint64_t v4 = (void *)[MEMORY[0x263F7E528] validFuzzyPinyinPairs];
  unint64_t v5 = (void *)[MEMORY[0x263EFF9C0] set];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if ([v4 containsObject:v10]) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v11 = (void *)[MEMORY[0x263F7E528] defaultFuzzyPinyinPairs];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [v5 addObject:*(void *)(*((void *)&v17 + 1) + 8 * j)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
  }
  return v5;
}

- (id)keyboardPreferenceValue:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController", a3);
  uint64_t v4 = *MEMORY[0x263F7E740];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setKeyboardPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "specifierForID:", @"FUZZY_PINYIN_PAIRS_GROUP", a4);
  int v7 = [a3 BOOLValue];
  uint64_t v8 = [(KSFuzzyPinyinController *)self fuzzyPinyinPairSpecifiers];
  if (v7)
  {
    [(KSFuzzyPinyinController *)self insertContiguousSpecifiers:v8 afterSpecifier:v6 animated:1];
  }
  else
  {
    [(KSFuzzyPinyinController *)self removeContiguousSpecifiers:v8 animated:1];
    [(KSFuzzyPinyinController *)self setFuzzyPinyinPairSpecifiers:0];
  }
  uint64_t v9 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v10 = *MEMORY[0x263F7E740];
  [v9 setValue:a3 forPreferenceKey:v10];
}

- (id)specifiers
{
  v18[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    unint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:", @"FUZZY_PINYIN_GROUP"));
    uint64_t v6 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"FUZZY_PINYIN_OPTION", &stru_2703C6C20, @"Keyboard"), self, sel_setKeyboardPreferenceValue_forSpecifier_, sel_keyboardPreferenceValue_, 0, 6, 0);
    uint64_t v7 = *MEMORY[0x263F60068];
    v17[0] = *MEMORY[0x263F60070];
    v17[1] = v7;
    v18[0] = @"com.apple.InputModePreferences";
    v18[1] = @"0";
    uint64_t v8 = *MEMORY[0x263F60170];
    v17[2] = *MEMORY[0x263F60138];
    v17[3] = v8;
    v18[2] = @"FuzzyPinyin";
    v18[3] = @"FuzzyPinyin";
    objc_msgSend(v6, "setProperties:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
    [v5 addObject:v6];
    uint64_t v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FUZZY_PINYIN_PAIRS_GROUP"];
    [v5 addObject:v9];
    uint64_t v10 = [v5 indexOfObject:v9];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      uint64_t v12 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
      if ([v12 BOOLForPreferenceKey:*MEMORY[0x263F7E740]])
      {
        uint64_t v13 = v11 + 1;
        uint64_t v14 = (void *)[MEMORY[0x263F089C8] indexSetWithIndex:v11 + 1];
        NSUInteger v15 = [(NSArray *)[(KSFuzzyPinyinController *)self fuzzyPinyinPairSpecifiers] count];
        if (v15)
        {
          NSUInteger v16 = v15;
          do
          {
            [v14 addIndex:v13++];
            --v16;
          }
          while (v16);
        }
        objc_msgSend(v5, "insertObjects:atIndexes:", -[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers](self, "fuzzyPinyinPairSpecifiers"), v14);
      }
    }
    id result = v5;
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)KSFuzzyPinyinController;
  -[KSFuzzyPinyinController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_);
  if ([a4 section] == 1)
  {
    unint64_t v7 = [a4 row];
    if (v7 < [(NSArray *)[(KSFuzzyPinyinController *)self fuzzyPinyinPairSpecifiers] count])
    {
      id v8 = [(NSArray *)[(KSFuzzyPinyinController *)self fuzzyPinyinPairSpecifiers] objectAtIndex:v7];
      uint64_t v9 = (void *)[a3 cellForRowAtIndexPath:a4];
      uint64_t v10 = [v9 accessoryType];
      if (v10 == 3) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 3;
      }
      [v9 setAccessoryType:v11];
      uint64_t v12 = [v8 propertyForKey:@"TISpecifierKeyFuzzyPinyinPair"];
      uint64_t v13 = [(KSFuzzyPinyinController *)self fuzzyPinyinPairs];
      if (v10 == 3) {
        [(NSMutableSet *)v13 removeObject:v12];
      }
      else {
        [(NSMutableSet *)v13 addObject:v12];
      }
      uint64_t v14 = [NSNumber numberWithInt:v10 != 3];
      [v8 setProperty:v14 forKey:*MEMORY[0x263F60308]];
      NSUInteger v15 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
      uint64_t v16 = [(NSMutableSet *)[(KSFuzzyPinyinController *)self fuzzyPinyinPairs] allObjects];
      [v15 setValue:v16 forPreferenceKey:*MEMORY[0x263F7E738]];
    }
  }
}

- (void)emitNavigationEventForFuzzyPinyinController
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Keyboard/FUZZY_PINYIN_OPTION"];
  id v4 = +[KSKeyboardController localizedStringForGeneralKeyboardSpecifier];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
  v7[0] = v4;
  -[KSFuzzyPinyinController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", @"FUZZY_PINYIN_OPTION", @"Keyboard", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 2), v3);
}

- (PSSpecifier)fuzzyPinyinSpecifier
{
  return self->_fuzzyPinyinSpecifier;
}

- (void)setFuzzyPinyinSpecifier:(id)a3
{
}

- (NSMutableSet)fuzzyPinyinPairs
{
  return self->_fuzzyPinyinPairs;
}

- (void)setFuzzyPinyinPairs:(id)a3
{
}

- (void)setFuzzyPinyinPairSpecifiers:(id)a3
{
}

- (void)fuzzyPinyinPairSpecifiers
{
  __assert_rtn("-[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers]", "KSFuzzyPinyinController.m", 70, "[pair count] == 2");
}

@end