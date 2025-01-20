@interface TIMultilingualInputModeTableCell
+ (int64_t)cellStyle;
- (BOOL)hasDownloadableAssets;
- (NSArray)inputModes;
- (TIMultilingualInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)subtitle;
- (id)title;
- (void)addDownloadIcon;
- (void)dealloc;
- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4;
- (void)setInputModes:(id)a3;
- (void)updateLabels;
@end

@implementation TIMultilingualInputModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TIMultilingualInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TIMultilingualInputModeTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    -[TIMultilingualInputModeTableCell setInputModes:](v6, "setInputModes:", [a5 propertyForKey:*MEMORY[0x263F60308]]);
    [(TIMultilingualInputModeTableCell *)v6 updateLabels];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TIMultilingualInputModeTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)updateLabels
{
  objc_msgSend((id)-[TIMultilingualInputModeTableCell textLabel](self, "textLabel"), "setText:", -[TIMultilingualInputModeTableCell title](self, "title"));
  objc_msgSend((id)-[TIMultilingualInputModeTableCell detailTextLabel](self, "detailTextLabel"), "setText:", -[TIMultilingualInputModeTableCell subtitle](self, "subtitle"));
  if ([(TIMultilingualInputModeTableCell *)self hasDownloadableAssets])
  {
    [(TIMultilingualInputModeTableCell *)self addDownloadIcon];
  }
}

- (id)title
{
  v2 = [(TIMultilingualInputModeTableCell *)self inputModes];

  return TIUIGetLocalizedConcatenatedLanguageNamesForInputModes(v2);
}

- (id)subtitle
{
  uint64_t LanguageCount = TIUIMultilingualSetGetLanguageCount([(TIMultilingualInputModeTableCell *)self inputModes]);
  objc_super v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (LanguageCount == 2) {
    v4 = @"BILINGUAL_KEYBOARD_TITLE_SHORT";
  }
  else {
    v4 = @"MULTILINGUAL_KEYBOARD_TITLE_SHORT";
  }

  return (id)[v3 localizedStringForKey:v4 value:&stru_26E29DC78 table:@"Keyboard"];
}

- (BOOL)hasDownloadableAssets
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TIMultilingualInputModeTableCell *)self inputModes];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "assetStatusForInputMode:", *(void *)(*((void *)&v8 + 1) + 8 * v6));
      if (v3 == 1) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        return v3;
      }
    }
  }
  return v3;
}

- (void)addDownloadIcon
{
  if (![(TIMultilingualInputModeTableCell *)self accessoryView])
  {
    uint64_t v3 = TIDownloadButton();
    [v3 addTarget:self action:sel_downloadButtonPressed_withEvent_ forControlEvents:64];
    [(TIMultilingualInputModeTableCell *)self setAccessoryView:v3];
  }
}

- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(TIMultilingualInputModeTableCell *)self inputModes];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "startDownloadingAssetsForInputMode:", *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSArray)inputModes
{
  return self->_inputModes;
}

- (void)setInputModes:(id)a3
{
}

@end