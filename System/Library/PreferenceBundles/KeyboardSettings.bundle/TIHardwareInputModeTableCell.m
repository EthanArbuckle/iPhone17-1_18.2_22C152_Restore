@interface TIHardwareInputModeTableCell
+ (int64_t)cellStyle;
- (id)subtitle;
@end

@implementation TIHardwareInputModeTableCell

+ (int64_t)cellStyle
{
  return 1;
}

- (id)subtitle
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] isExtensionInputMode])
  {
    v15.receiver = self;
    v15.super_class = (Class)TIHardwareInputModeTableCell;
    return [(TIInputModeTableCell *)&v15 subtitle];
  }
  else
  {
    v4 = (void *)[(UIKeyboardInputMode *)[(TIInputModeTableCell *)self inputMode] identifier];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = +[TIKeyboardListController inputModes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = 0;
      uint64_t v9 = *(void *)v12;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        if ([v4 isEqualToString:TIInputModeGetNormalizedIdentifier()])
        {
          v8 = (void *)[(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"hw"];
          if ([v8 length]) {
            break;
          }
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
          if (v7) {
            goto LABEL_5;
          }
          return +[TIKeyboardListController displayNameForHardwareLayout:v8 inputMode:[(TIInputModeTableCell *)self inputMode]];
        }
      }
    }
    else
    {
      v8 = 0;
    }
    return +[TIKeyboardListController displayNameForHardwareLayout:v8 inputMode:[(TIInputModeTableCell *)self inputMode]];
  }
}

@end