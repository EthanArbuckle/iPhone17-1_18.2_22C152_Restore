@interface HUSiriLanguageOptionItem
+ (id)selectionKeyForLanguageOption:(id)a3 withOptionStyle:(unint64_t)a4;
- (HFAccessorySettingSiriLanguageAdapter)adapter;
- (HFSiriLanguageOption)languageOption;
- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager;
- (HUSiriLanguageOptionItem)initWithStyle:(unint64_t)a3 adapter:(id)a4 languageOption:(id)a5;
- (HUSiriLanguageOptionItem)initWithStyle:(unint64_t)a3 siriLanguageOptionsManager:(id)a4 languageOption:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)optionStyle;
- (void)setLanguageOption:(id)a3;
- (void)setSiriLanguageOptionsManager:(id)a3;
@end

@implementation HUSiriLanguageOptionItem

- (HUSiriLanguageOptionItem)initWithStyle:(unint64_t)a3 adapter:(id)a4 languageOption:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUSiriLanguageOptionItem;
  v11 = [(HUSiriLanguageOptionItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_optionStyle = a3;
    objc_storeStrong((id *)&v11->_adapter, a4);
    objc_storeStrong((id *)&v12->_languageOption, a5);
  }

  return v12;
}

- (HUSiriLanguageOptionItem)initWithStyle:(unint64_t)a3 siriLanguageOptionsManager:(id)a4 languageOption:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUSiriLanguageOptionItem;
  v11 = [(HUSiriLanguageOptionItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_optionStyle = a3;
    objc_storeStrong((id *)&v11->_siriLanguageOptionsManager, a4);
    objc_storeStrong((id *)&v12->_languageOption, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke;
  v25[3] = &unk_1E6387F48;
  v25[4] = self;
  v5 = __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke((uint64_t)v25);
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v6 = [(HUSiriLanguageOptionItem *)self siriLanguageOptionsManager];
  v7 = [v6 selectedLanguageOption];

  if (!v7)
  {
    v7 = [(HUSiriLanguageOptionItem *)self adapter];

    if (v7)
    {
      v8 = [(HUSiriLanguageOptionItem *)self adapter];
      v7 = [v8 selectedLanguageOption];
    }
  }
  id v9 = NSNumber;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke_2;
  v23[3] = &unk_1E6388F60;
  v23[4] = self;
  id v10 = v7;
  id v24 = v10;
  v11 = [v9 numberWithBool:__56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v23)];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  v12 = [(HUSiriLanguageOptionItem *)self adapter];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F1CA80];
    objc_super v14 = [(HUSiriLanguageOptionItem *)self adapter];
    v15 = [v14 homeKitSettingsVendor];
    v16 = [v13 setWithObject:v15];

    v17 = [(HUSiriLanguageOptionItem *)self adapter];
    v18 = [v17 settings];
    objc_msgSend(v16, "na_safeAddObject:", v18);

    [v4 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68908]];
    v19 = [(HUSiriLanguageOptionItem *)self adapter];
    v20 = [v19 keyPaths];
    [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68BF0]];
  }
  v21 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v21;
}

__CFString *__56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) optionStyle];
  switch(v2)
  {
    case 2:
      v3 = [*(id *)(a1 + 32) languageOption];
      uint64_t v4 = [v3 localizedOutputVoiceColor];
      goto LABEL_7;
    case 1:
      v3 = [*(id *)(a1 + 32) languageOption];
      uint64_t v4 = [v3 localizedOutputVoiceAccent];
      goto LABEL_7;
    case 0:
      v3 = [*(id *)(a1 + 32) languageOption];
      uint64_t v4 = [v3 localizedRecognitionLanguage];
LABEL_7:
      v5 = (__CFString *)v4;

      goto LABEL_9;
  }
  v5 = &stru_1F18F92B8;
LABEL_9:

  return v5;
}

uint64_t __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "selectionKeyForLanguageOption:withOptionStyle:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "optionStyle"));
  v3 = objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 32) languageOption];
  v5 = objc_msgSend(v3, "selectionKeyForLanguageOption:withOptionStyle:", v4, objc_msgSend(*(id *)(a1 + 32), "optionStyle"));

  uint64_t v6 = [v2 isEqual:v5];
  return v6;
}

+ (id)selectionKeyForLanguageOption:(id)a3 withOptionStyle:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  switch(a4)
  {
    case 2uLL:
      uint64_t v7 = [v5 localizedOutputVoiceColor];
      goto LABEL_7;
    case 1uLL:
      uint64_t v7 = [v5 outputLanguage];
      goto LABEL_7;
    case 0uLL:
      uint64_t v7 = [v5 recognitionLanguage];
LABEL_7:
      v8 = (void *)v7;
      goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (unint64_t)optionStyle
{
  return self->_optionStyle;
}

- (HFAccessorySettingSiriLanguageAdapter)adapter
{
  return self->_adapter;
}

- (HFSiriLanguageOption)languageOption
{
  return self->_languageOption;
}

- (void)setLanguageOption:(id)a3
{
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  return self->_siriLanguageOptionsManager;
}

- (void)setSiriLanguageOptionsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, 0);
  objc_storeStrong((id *)&self->_languageOption, 0);

  objc_storeStrong((id *)&self->_adapter, 0);
}

@end