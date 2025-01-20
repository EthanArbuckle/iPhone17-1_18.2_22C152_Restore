@interface IKJSKeyboard
- (BOOL)clearHintsOnSelection;
- (BOOL)showDefaultHint;
- (BOOL)showSearchHintPreview;
- (BOOL)updateSearchTextOnHintSelection;
- (IKAppKeyboardBridge)appBridge;
- (JSValue)hints;
- (JSValue)suggestions;
- (NSString)hintRowTitle;
- (NSString)text;
- (id)asPrivateIKJSKeyboard;
- (void)jsDidSelectHint:(id)a3;
- (void)jsTextDidChange;
- (void)setAppBridge:(id)a3;
- (void)setClearHintsOnSelection:(BOOL)a3;
- (void)setHintRowTitle:(id)a3;
- (void)setHints:(id)a3;
- (void)setShowDefaultHint:(BOOL)a3;
- (void)setShowSearchHintPreview:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setText:(id)a3;
- (void)setUpdateSearchTextOnHintSelection:(BOOL)a3;
@end

@implementation IKJSKeyboard

- (id)asPrivateIKJSKeyboard
{
  if ([(IKJSKeyboard *)self conformsToProtocol:&unk_1F3E45948]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSKeyboard *)self appBridge];
  [v5 setJSText:v4];
}

- (NSString)text
{
  v2 = [(IKJSKeyboard *)self appBridge];
  v3 = [v2 jsText];

  return (NSString *)v3;
}

- (void)setSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSKeyboard *)self appBridge];
  [v5 setJSHints:v4];
}

- (JSValue)suggestions
{
  v2 = [(IKJSKeyboard *)self appBridge];
  v3 = [v2 jsHints];

  return (JSValue *)v3;
}

- (void)setHints:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSKeyboard *)self appBridge];
  [v5 setJSHints:v4];
}

- (JSValue)hints
{
  v2 = [(IKJSKeyboard *)self appBridge];
  v3 = [v2 jsHints];

  return (JSValue *)v3;
}

- (void)setShowDefaultHint:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IKJSKeyboard *)self appBridge];
  [v4 setJSShowDefaultHint:v3];
}

- (BOOL)showDefaultHint
{
  v2 = [(IKJSKeyboard *)self appBridge];
  char v3 = [v2 jsShowDefaultHint];

  return v3;
}

- (void)setClearHintsOnSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IKJSKeyboard *)self appBridge];
  [v4 setJSClearHintsOnSelection:v3];
}

- (BOOL)clearHintsOnSelection
{
  v2 = [(IKJSKeyboard *)self appBridge];
  char v3 = [v2 jsClearHintsOnSelection];

  return v3;
}

- (void)setShowSearchHintPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IKJSKeyboard *)self appBridge];
  [v4 setJSShowHintPreview:v3];
}

- (BOOL)showSearchHintPreview
{
  v2 = [(IKJSKeyboard *)self appBridge];
  char v3 = [v2 jsShowHintPreview];

  return v3;
}

- (void)setUpdateSearchTextOnHintSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IKJSKeyboard *)self appBridge];
  [v4 setJSUpdateSearchTextOnHintSelection:v3];
}

- (BOOL)updateSearchTextOnHintSelection
{
  v2 = [(IKJSKeyboard *)self appBridge];
  char v3 = [v2 jsUpdateSearchTextOnHintSelection];

  return v3;
}

- (void)setHintRowTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSKeyboard *)self appBridge];
  [v5 setJSHintRowTitle:v4];
}

- (NSString)hintRowTitle
{
  v2 = [(IKJSKeyboard *)self appBridge];
  char v3 = [v2 jsHintRowTitle];

  return (NSString *)v3;
}

- (void)jsTextDidChange
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (+[IKUtilites isAppTrusted])
  {
    char v3 = [(IKJSKeyboard *)self appBridge];
    uint64_t v4 = [v3 jsText];
    id v5 = (void *)v4;
    v6 = &stru_1F3E09950;
    if (v4) {
      v6 = (__CFString *)v4;
    }
    v12[0] = v6;
    v7 = [(IKJSKeyboard *)self appBridge];
    v8 = [v7 jsSource];
    v9 = v8;
    if (!v8)
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
    }
    v12[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    if (!v8) {
  }
    }
  else
  {
    v10 = 0;
  }
  id v11 = [(IKJSObject *)self invokeMethod:@"onTextChange" withArguments:v10];
}

- (void)jsDidSelectHint:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onSuggestionSelected", v6, v9, v10 withArguments];
  id v8 = [(IKJSObject *)self invokeMethod:@"onHintSelected" withArguments:v6];
}

- (IKAppKeyboardBridge)appBridge
{
  return self->_appBridge;
}

- (void)setAppBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end