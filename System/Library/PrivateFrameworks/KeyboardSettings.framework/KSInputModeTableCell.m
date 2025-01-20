@interface KSInputModeTableCell
+ (int64_t)cellStyle;
- (BOOL)hasDownloadableAssets;
- (KSInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIKeyboardInputMode)inputMode;
- (id)subtitle;
- (id)title;
- (void)addDownloadIcon;
- (void)dealloc;
- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4;
- (void)setInputMode:(id)a3;
- (void)updateLabels;
@end

@implementation KSInputModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (KSInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)KSInputModeTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    -[KSInputModeTableCell setInputMode:](v6, "setInputMode:", objc_msgSend(MEMORY[0x263F1C740], "keyboardInputModeWithIdentifier:", objc_msgSend(a5, "propertyForKey:", *MEMORY[0x263F60138])));
    [(KSInputModeTableCell *)v6 updateLabels];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSInputModeTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)updateLabels
{
  objc_msgSend((id)-[KSInputModeTableCell textLabel](self, "textLabel"), "setText:", -[KSInputModeTableCell title](self, "title"));
  objc_msgSend((id)-[KSInputModeTableCell detailTextLabel](self, "detailTextLabel"), "setText:", -[KSInputModeTableCell subtitle](self, "subtitle"));
  if ([(KSInputModeTableCell *)self hasDownloadableAssets])
  {
    [(KSInputModeTableCell *)self addDownloadIcon];
  }
}

- (id)title
{
  v8[2] = *MEMORY[0x263EF8340];
  int v3 = [(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] isExtensionInputMode];
  v4 = [(KSInputModeTableCell *)self inputMode];
  if (v3)
  {
    return [(UIKeyboardInputMode *)v4 safe__extendedDisplayName];
  }
  else
  {
    [(UIKeyboardInputMode *)v4 identifier];
    if ([(id)TIInputModeGetSWLayout() isEqualToString:@"Korean-With-QWERTY"])
    {
      v8[0] = +[KSKeyboardListController keyboardDisplayNameForIdentifier:TIInputModeGetLanguageWithRegion()];
      v8[1] = +[KSKeyboardListController keyboardDisplayNameForIdentifier:TIInputModeGetLanguageWithRegion()];
      return (id)[(id)objc_msgSend(MEMORY[0x263EFF8C0] arrayWithObjects:v8, 2), "componentsJoinedByString:", objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"LIST_SEPARATOR_2", &stru_2703C6C20, @"Keyboard" count];
    }
    else
    {
      id v6 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:[(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] languageWithRegion]];
      if (objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", @"kCFLocaleVariantCodeKey"), "length"))
      {
        v7 = (void *)TUIKeyboardTitle();
      }
      else
      {
        v7 = 0;
      }
      if ([v7 length]) {
        return (id)[NSString stringWithFormat:objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARD_LANGUAGE_%@_WITH_VARIANT_%@", &stru_2703C6C20, @"Keyboard", v6, v7];
      }
    }
    return v6;
  }
}

- (id)subtitle
{
  if ([(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] isExtensionInputMode])
  {
    int v3 = objc_msgSend(MEMORY[0x263EFF960], "localeForBundleLanguage:", objc_msgSend(MEMORY[0x263F086E0], "mainBundle"));
    uint64_t v4 = *MEMORY[0x263EFF508];
    uint64_t v5 = [(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] primaryLanguage];
    return (id)[v3 displayNameForKey:v4 value:v5];
  }
  uint64_t v7 = [(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] identifier];
  uint64_t NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
  id v9 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:[(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] languageWithRegion]];
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
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BILINGUAL_KEYBOARD_TITLE_SHORT", &stru_2703C6C20, @"Keyboard");
  }
  else
  {
    if ([v12 length]) {
      v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v12, &stru_2703C6C20, @"KeyboardLayouts");
    }
    else {
      v14 = 0;
    }
    if (([v9 isEqualToString:v14] & 1) != 0
      || ([v11 isEqualToString:v14] & 1) != 0
      || (id v15 = +[KSKeyboardListController inputModes],
          v16[0] = MEMORY[0x263EF8330],
          v16[1] = 3221225472,
          v16[2] = __32__KSInputModeTableCell_subtitle__block_invoke,
          v16[3] = &unk_2653A9468,
          v16[4] = NormalizedIdentifier,
          (unint64_t)objc_msgSend((id)objc_msgSend(v15, "indexesOfObjectsPassingTest:", v16), "count") <= 1)
      && (objc_msgSend((id)objc_msgSend(+[KSKeyboardListController softwareLayoutsForBaseInputMode:](KSKeyboardListController, "softwareLayoutsForBaseInputMode:", NormalizedIdentifier), "firstObject"), "isEqualToString:", v12) & 1) != 0)
    {
      v14 = 0;
    }
    if (KSInputModeIsChineseShuangpin()) {
      v14 = (void *)KSGetCurrentShuangpinName();
    }
    if (!KSInputModeIsChineseWubi()) {
      goto LABEL_23;
    }
    uint64_t v13 = KSGetCurrentWubiStandardName();
  }
  v14 = (void *)v13;
LABEL_23:
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "assetStatusForInputMode:", v7) == 2) {
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ASSETS_DOWNLOADING_PROGRESS_TITLE", &stru_2703C6C20, @"Keyboard");
  }
  return v14;
}

uint64_t __32__KSInputModeTableCell_subtitle__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)TIInputModeGetNormalizedIdentifier() isEqualToString:*(void *)(a1 + 32)];
  if (result) {
    return objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", @"sw"), "length") != 0;
  }
  return result;
}

- (BOOL)hasDownloadableAssets
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "assetStatusForInputMode:", -[UIKeyboardInputMode identifier](-[KSInputModeTableCell inputMode](self, "inputMode"), "identifier")) == 1;
}

- (void)addDownloadIcon
{
  if (![(KSInputModeTableCell *)self accessoryView])
  {
    int v3 = TIDownloadButton();
    [v3 addTarget:self action:sel_downloadButtonPressed_withEvent_ forControlEvents:64];
    [(KSInputModeTableCell *)self setAccessoryView:v3];
  }
}

- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F7E568], "sharedManager", a3, a4);
  uint64_t v6 = [(UIKeyboardInputMode *)[(KSInputModeTableCell *)self inputMode] identifier];
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