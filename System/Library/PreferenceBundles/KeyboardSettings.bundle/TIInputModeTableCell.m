@interface TIInputModeTableCell
+ (int64_t)cellStyle;
- (BOOL)hasDownloadableAssets;
- (TIInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIKeyboardInputMode)inputMode;
- (id)subtitle;
- (id)title;
- (void)addDownloadIcon;
- (void)dealloc;
- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4;
- (void)setInputMode:(id)a3;
- (void)updateLabels;
@end

@implementation TIInputModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TIInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TIInputModeTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    -[TIInputModeTableCell setInputMode:](v6, "setInputMode:", objc_msgSend(MEMORY[0x263F1C740], "keyboardInputModeWithIdentifier:", objc_msgSend(a5, "propertyForKey:", *MEMORY[0x263F60138])));
    [(TIInputModeTableCell *)v6 updateLabels];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TIInputModeTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)updateLabels
{
  objc_msgSend((id)-[TIInputModeTableCell textLabel](self, "textLabel"), "setText:", -[TIInputModeTableCell title](self, "title"));
  objc_msgSend((id)-[TIInputModeTableCell detailTextLabel](self, "detailTextLabel"), "setText:", -[TIInputModeTableCell subtitle](self, "subtitle"));
  if ([(TIInputModeTableCell *)self hasDownloadableAssets])
  {
    [(TIInputModeTableCell *)self addDownloadIcon];
  }
}

- (id)title
{
  v8[2] = *MEMORY[0x263EF8340];
  int v3 = [(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] isExtensionInputMode];
  v4 = [(TIInputModeTableCell *)self inputMode];
  if (v3)
  {
    return [(UIKeyboardInputMode *)v4 safe__extendedDisplayName];
  }
  else
  {
    [(UIKeyboardInputMode *)v4 identifier];
    if ([(id)TIInputModeGetSWLayout() isEqualToString:@"Korean-With-QWERTY"])
    {
      v8[0] = +[TIKeyboardListController keyboardDisplayNameForIdentifier:TIInputModeGetLanguageWithRegion()];
      v8[1] = +[TIKeyboardListController keyboardDisplayNameForIdentifier:TIInputModeGetLanguageWithRegion()];
      return (id)[(id)objc_msgSend(MEMORY[0x263EFF8C0] arrayWithObjects:v8, 2), "componentsJoinedByString:", objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"LIST_SEPARATOR_2", &stru_26E29DC78, @"Keyboard" count];
    }
    else
    {
      id v6 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:[(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] languageWithRegion]];
      if (objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", @"kCFLocaleVariantCodeKey"), "length"))
      {
        v7 = (void *)TUIKeyboardTitle();
      }
      else
      {
        v7 = 0;
      }
      if ([v7 length]) {
        return (id)[NSString stringWithFormat:objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARD_LANGUAGE_%@_WITH_VARIANT_%@", &stru_26E29DC78, @"Keyboard", v6, v7];
      }
    }
    return v6;
  }
}

- (id)subtitle
{
  if ([(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] isExtensionInputMode])
  {
    int v3 = objc_msgSend(MEMORY[0x263EFF960], "localeForBundleLanguage:", objc_msgSend(MEMORY[0x263F086E0], "mainBundle"));
    uint64_t v4 = *MEMORY[0x263EFF508];
    uint64_t v5 = [(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] primaryLanguage];
    return (id)[v3 displayNameForKey:v4 value:v5];
  }
  uint64_t v7 = [(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] identifier];
  uint64_t NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
  id v9 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:[(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] languageWithRegion]];
  ComponentsFromIdentifier = (void *)TIInputModeGetComponentsFromIdentifier();
  if (objc_msgSend((id)objc_msgSend(ComponentsFromIdentifier, "objectForKey:", @"kCFLocaleVariantCodeKey"), "length"))
  {
    v11 = (void *)TUIKeyboardTitle();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)[ComponentsFromIdentifier objectForKey:@"sw"];
  if ([v12 isEqualToString:@"Korean-With-QWERTY"])
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BILINGUAL_KEYBOARD_TITLE_SHORT", &stru_26E29DC78, @"Keyboard");
  }
  else
  {
    if ([v12 length]) {
      v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v12, &stru_26E29DC78, @"KeyboardLayouts");
    }
    else {
      v14 = 0;
    }
    if (([v9 isEqualToString:v14] & 1) != 0
      || ([v11 isEqualToString:v14] & 1) != 0
      || (id v15 = +[TIKeyboardListController inputModes],
          v16[0] = MEMORY[0x263EF8330],
          v16[1] = 3221225472,
          v16[2] = __32__TIInputModeTableCell_subtitle__block_invoke,
          v16[3] = &unk_264A00FB8,
          v16[4] = NormalizedIdentifier,
          (unint64_t)objc_msgSend((id)objc_msgSend(v15, "indexesOfObjectsPassingTest:", v16), "count") <= 1)
      && (objc_msgSend((id)objc_msgSend(+[TIKeyboardListController softwareLayoutsForBaseInputMode:](TIKeyboardListController, "softwareLayoutsForBaseInputMode:", NormalizedIdentifier), "firstObject"), "isEqualToString:", v12) & 1) != 0)
    {
      v14 = 0;
    }
    if (TIInputModeIsChineseShuangpin()) {
      v14 = (void *)TIGetCurrentShuangpinName();
    }
    if (!TIInputModeIsChineseWubi()) {
      goto LABEL_23;
    }
    uint64_t v13 = TIGetCurrentWubiStandardName();
  }
  v14 = (void *)v13;
LABEL_23:
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "assetStatusForInputMode:", v7) == 2) {
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ASSETS_DOWNLOADING_PROGRESS_TITLE", &stru_26E29DC78, @"Keyboard");
  }
  return v14;
}

uint64_t __32__TIInputModeTableCell_subtitle__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)TIInputModeGetNormalizedIdentifier() isEqualToString:*(void *)(a1 + 32)];
  if (result) {
    return objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", @"sw"), "length") != 0;
  }
  return result;
}

- (BOOL)hasDownloadableAssets
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "assetStatusForInputMode:", -[UIKeyboardInputMode identifier](-[TIInputModeTableCell inputMode](self, "inputMode"), "identifier")) == 1;
}

- (void)addDownloadIcon
{
  if (![(TIInputModeTableCell *)self accessoryView])
  {
    int v3 = TIDownloadButton();
    [v3 addTarget:self action:sel_downloadButtonPressed_withEvent_ forControlEvents:64];
    [(TIInputModeTableCell *)self setAccessoryView:v3];
  }
}

- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F7E568], "sharedManager", a3, a4);
  uint64_t v6 = [(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] identifier];

  [v5 startDownloadingAssetsForInputMode:v6];
}

- (UIKeyboardInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
}

@end