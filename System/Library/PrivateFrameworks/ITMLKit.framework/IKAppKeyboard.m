@interface IKAppKeyboard
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (BOOL)_clearHintsOnSelection;
- (BOOL)_showDefaultHint;
- (BOOL)_showSearchHintPreview;
- (BOOL)_updateSearchTextOnHintSelection;
- (BOOL)jsClearHintsOnSelection;
- (BOOL)jsShowDefaultHint;
- (BOOL)jsShowHintPreview;
- (BOOL)jsUpdateSearchTextOnHintSelection;
- (IKAppContext)appContext;
- (IKAppKeyboard)initWithDOMNode:(id)a3 featureName:(id)a4;
- (IKAppKeyboardDelegate)delegate;
- (IKJSKeyboard)jsKeyboard;
- (JSValue)jsHints;
- (NSArray)hints;
- (NSString)_hintRowTitle;
- (NSString)_source;
- (NSString)featureName;
- (NSString)jsHintRowTitle;
- (NSString)jsSource;
- (NSString)jsText;
- (NSString)text;
- (void)_setClearHintsOnSelection:(BOOL)a3;
- (void)_setHintRowTitle:(id)a3;
- (void)_setShowDefaultHint:(BOOL)a3;
- (void)_setShowSearchHintPreview:(BOOL)a3;
- (void)_setSource:(id)a3;
- (void)_setText:(id)a3 then:(id)a4;
- (void)_setUpdateSearchTextOnHintSelection:(BOOL)a3;
- (void)didSelectHintWithText:(id)a3 searchTerm:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setJSClearHintsOnSelection:(BOOL)a3;
- (void)setJSHintRowTitle:(id)a3;
- (void)setJSHints:(id)a3;
- (void)setJSKeyboard:(id)a3;
- (void)setJSShowDefaultHint:(BOOL)a3;
- (void)setJSShowHintPreview:(BOOL)a3;
- (void)setJSSource:(id)a3;
- (void)setJSText:(id)a3;
- (void)setJSUpdateSearchTextOnHintSelection:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation IKAppKeyboard

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [IKJSKeyboard alloc];
  v5 = [v3 appContext];
  v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  [(IKJSKeyboard *)v6 setAppBridge:v3];
  [v3 setJSKeyboard:v6];

  return v6;
}

- (IKAppKeyboard)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKAppKeyboard;
  v8 = [(IKAppKeyboard *)&v13 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    uint64_t v10 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

    *(_DWORD *)&v8->_jsShowDefaultHint = 16843009;
    *(_DWORD *)&v8->_showDefaultHint = 16843009;
  }

  return v8;
}

- (void)setText:(id)a3
{
  v8 = (__CFString *)a3;
  text = (__CFString *)self->_text;
  if (!text) {
    text = &stru_1F3E09950;
  }
  v5 = text;
  if (v8) {
    id v6 = v8;
  }
  else {
    id v6 = &stru_1F3E09950;
  }
  id v7 = v6;
  if (([(__CFString *)v5 isEqualToString:v7] & 1) == 0) {
    [(IKAppKeyboard *)self _setText:v8 then:&__block_literal_global_10];
  }
}

void __25__IKAppKeyboard_setText___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 jsKeyboard];
  [v2 jsTextDidChange];
}

- (void)didSelectHintWithText:(id)a3 searchTerm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__IKAppKeyboard_didSelectHintWithText_searchTerm___block_invoke;
  v10[3] = &unk_1E6DE4FD8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(IKAppKeyboard *)self _setText:v8 then:v10];
}

void __50__IKAppKeyboard_didSelectHintWithText_searchTerm___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 jsKeyboard];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  id v5 = v3;
  [v3 jsDidSelectHint:v4];
}

- (void)setJSText:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  jsText = self->_jsText;
  if (jsText != v4 && ![(NSString *)jsText isEqualToString:v4])
  {
    id v6 = (void *)[(NSString *)v4 copy];
    objc_storeStrong((id *)&self->_jsText, v6);
    objc_initWeak(&location, self);
    id v7 = [(IKAppKeyboard *)self appContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__IKAppKeyboard_setJSText___block_invoke;
    v9[3] = &unk_1E6DE5000;
    objc_copyWeak(&v11, &location);
    id v8 = v6;
    id v10 = v8;
    [v7 evaluateDelegateBlockSync:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __27__IKAppKeyboard_setJSText___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 32));
    id v3 = [v4 delegate];
    [v3 textDidChangeForKeyboard:v4];

    WeakRetained = v4;
  }
}

- (void)setJSHints:(id)a3
{
  v24 = self;
  id v3 = a3;
  v26 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 isArray])
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"length"];
    id v5 = [v4 toNumber];
    uint64_t v6 = [v5 integerValue];

    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v25 = v6;
      do
      {
        id v8 = objc_msgSend(v3, "valueAtIndex:", v7, v24);
        if ([v8 isObject])
        {
          id v9 = v3;
          id v10 = [v8 objectForKeyedSubscript:@"badge"];
          id v11 = [v8 objectForKeyedSubscript:@"text"];
          id v12 = [v8 objectForKeyedSubscript:@"searchTerm"];
          if ([v10 isString])
          {
            objc_super v13 = [v10 toString];
          }
          else
          {
            objc_super v13 = 0;
          }
          v14 = &stru_1F3E09950;
          if ([v11 isString])
          {
            v14 = [v11 toString];
          }
          if ([v12 isString])
          {
            v15 = [v12 toString];
          }
          else
          {
            v15 = 0;
          }
          v16 = [[IKAppKeyboardHint alloc] initWithBadge:v13 text:v14 searchTerm:v15];
          [v26 addObject:v16];

          id v3 = v9;
          uint64_t v6 = v25;
        }

        ++v7;
      }
      while (v6 != v7);
    }
  }
  v17 = (void *)MEMORY[0x1E4F30928];
  v18 = v24;
  v19 = [(IKAppKeyboard *)v24 jsKeyboard];
  uint64_t v20 = [v17 managedValueWithValue:v3 andOwner:v19];
  jsHints = v18->_jsHints;
  v18->_jsHints = (JSManagedValue *)v20;

  objc_initWeak(&location, v18);
  v22 = [(IKAppKeyboard *)v18 appContext];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __28__IKAppKeyboard_setJSHints___block_invoke;
  v27[3] = &unk_1E6DE5000;
  objc_copyWeak(&v29, &location);
  id v23 = v26;
  id v28 = v23;
  [v22 evaluateDelegateBlockSync:v27];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __28__IKAppKeyboard_setJSHints___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v3 = [*(id *)(a1 + 32) copy];
      uint64_t v4 = (void *)v8[11];
      v8[11] = v3;
    }
    else
    {
      uint64_t v4 = (void *)v8[11];
      v8[11] = 0;
    }

    id v5 = [v8 delegate];
    char v6 = objc_opt_respondsToSelector();

    WeakRetained = v8;
    if (v6)
    {
      uint64_t v7 = [v8 delegate];
      [v7 hintsDidChangeForKeyboard:v8];

      WeakRetained = v8;
    }
  }
}

- (JSValue)jsHints
{
  return [(JSManagedValue *)self->_jsHints value];
}

- (void)setJSShowDefaultHint:(BOOL)a3
{
  if (self->_jsShowDefaultHint != a3)
  {
    self->_jsShowDefaultHint = a3;
    objc_initWeak(&location, self);
    id v5 = [(IKAppKeyboard *)self appContext];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__IKAppKeyboard_setJSShowDefaultHint___block_invoke;
    v6[3] = &unk_1E6DE5028;
    objc_copyWeak(&v7, &location);
    BOOL v8 = a3;
    [v5 evaluateDelegateBlockSync:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __38__IKAppKeyboard_setJSShowDefaultHint___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[32] = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)jsShowDefaultHint
{
  return self->_jsShowDefaultHint;
}

- (void)setJSClearHintsOnSelection:(BOOL)a3
{
  if (self->_jsClearHintsOnSelection != a3)
  {
    self->_jsClearHintsOnSelection = a3;
    objc_initWeak(&location, self);
    id v5 = [(IKAppKeyboard *)self appContext];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__IKAppKeyboard_setJSClearHintsOnSelection___block_invoke;
    v6[3] = &unk_1E6DE5028;
    objc_copyWeak(&v7, &location);
    BOOL v8 = a3;
    [v5 evaluateDelegateBlockSync:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __44__IKAppKeyboard_setJSClearHintsOnSelection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[33] = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)jsClearHintsOnSelection
{
  return self->_jsClearHintsOnSelection;
}

- (void)setJSShowHintPreview:(BOOL)a3
{
  if (self->_jsShowHintPreview != a3)
  {
    self->_jsShowHintPreview = a3;
    objc_initWeak(&location, self);
    id v5 = [(IKAppKeyboard *)self appContext];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__IKAppKeyboard_setJSShowHintPreview___block_invoke;
    v6[3] = &unk_1E6DE5028;
    objc_copyWeak(&v7, &location);
    BOOL v8 = a3;
    [v5 evaluateDelegateBlockSync:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __38__IKAppKeyboard_setJSShowHintPreview___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[34] = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)jsShowHintPreview
{
  return self->_jsShowHintPreview;
}

- (void)setJSUpdateSearchTextOnHintSelection:(BOOL)a3
{
  if (self->_jsUpdateSearchTextOnHintSelection != a3)
  {
    self->_jsUpdateSearchTextOnHintSelection = a3;
    objc_initWeak(&location, self);
    id v5 = [(IKAppKeyboard *)self appContext];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__IKAppKeyboard_setJSUpdateSearchTextOnHintSelection___block_invoke;
    v6[3] = &unk_1E6DE5028;
    objc_copyWeak(&v7, &location);
    BOOL v8 = a3;
    [v5 evaluateDelegateBlockSync:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __54__IKAppKeyboard_setJSUpdateSearchTextOnHintSelection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[35] = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)jsUpdateSearchTextOnHintSelection
{
  return self->_jsUpdateSearchTextOnHintSelection;
}

- (void)setJSHintRowTitle:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_jsHintRowTitle isEqualToString:v4])
  {
    id v5 = (NSString *)[v4 copy];
    jsHintRowTitle = self->_jsHintRowTitle;
    self->_jsHintRowTitle = v5;

    objc_initWeak(&location, self);
    id v7 = [(IKAppKeyboard *)self appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__IKAppKeyboard_setJSHintRowTitle___block_invoke;
    v8[3] = &unk_1E6DE5000;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v7 evaluateDelegateBlockSync:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __35__IKAppKeyboard_setJSHintRowTitle___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = (void *)WeakRetained[14];
    WeakRetained[14] = v2;
  }
}

- (NSString)jsHintRowTitle
{
  return self->_jsHintRowTitle;
}

- (void)_setText:(id)a3 then:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IKAppKeyboard *)self _source];
  id v9 = (void *)[v6 copy];
  objc_storeStrong((id *)&self->_text, v9);
  objc_initWeak(&location, self);
  id v10 = [(IKAppKeyboard *)self appContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__IKAppKeyboard__setText_then___block_invoke;
  v14[3] = &unk_1E6DE5050;
  objc_copyWeak(&v18, &location);
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  [v10 evaluate:v14 completionBlock:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __31__IKAppKeyboard__setText_then___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_storeStrong(WeakRetained + 5, *(id *)(a1 + 32));
    objc_storeStrong(v5 + 6, *(id *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, id *))(v3 + 16))(v3, v5);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (NSString)jsText
{
  return self->_jsText;
}

- (NSString)jsSource
{
  return self->_jsSource;
}

- (void)setJSSource:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKAppKeyboardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKAppKeyboardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)hints
{
  return self->_hints;
}

- (IKJSKeyboard)jsKeyboard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsKeyboard);
  return (IKJSKeyboard *)WeakRetained;
}

- (void)setJSKeyboard:(id)a3
{
}

- (NSString)_source
{
  return self->_source;
}

- (void)_setSource:(id)a3
{
}

- (BOOL)_showDefaultHint
{
  return self->_showDefaultHint;
}

- (void)_setShowDefaultHint:(BOOL)a3
{
  self->_showDefaultHint = a3;
}

- (BOOL)_clearHintsOnSelection
{
  return self->_clearHintsOnSelection;
}

- (void)_setClearHintsOnSelection:(BOOL)a3
{
  self->_clearHintsOnSelection = a3;
}

- (BOOL)_showSearchHintPreview
{
  return self->_showSearchHintPreview;
}

- (void)_setShowSearchHintPreview:(BOOL)a3
{
  self->_showSearchHintPreview = a3;
}

- (BOOL)_updateSearchTextOnHintSelection
{
  return self->_updateSearchTextOnHintSelection;
}

- (void)_setUpdateSearchTextOnHintSelection:(BOOL)a3
{
  self->_updateSearchTextOnHintSelection = a3;
}

- (NSString)_hintRowTitle
{
  return self->_hintRowTitle;
}

- (void)_setHintRowTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintRowTitle, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->_jsKeyboard);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_jsSource, 0);
  objc_storeStrong((id *)&self->_jsText, 0);
  objc_storeStrong((id *)&self->_jsHintRowTitle, 0);
  objc_storeStrong((id *)&self->_jsHints, 0);
}

@end