@interface CNCardPropertyAddressingGrammarGroup
- (BOOL)canAddEditingItem;
- (BOOL)shouldKeepNoiseValue;
- (BOOL)shouldShowLanguageLabel;
- (Class)propertyGroupItemClass;
- (id)newEditingItemWithValue:(id)a3;
- (void)saveChanges;
@end

@implementation CNCardPropertyAddressingGrammarGroup

- (BOOL)canAddEditingItem
{
  v9.receiver = self;
  v9.super_class = (Class)CNCardPropertyAddressingGrammarGroup;
  unsigned int v3 = [(CNCardPropertyGroup *)&v9 canAddEditingItem];
  if (v3)
  {
    v4 = [(CNCardGroup *)self contact];
    uint64_t v5 = [v4 contactType];

    if (v5 == 1)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x2050000000;
      v6 = (void *)getIPPronounPickerViewControllerClass_softClass_57398;
      uint64_t v14 = getIPPronounPickerViewControllerClass_softClass_57398;
      if (!getIPPronounPickerViewControllerClass_softClass_57398)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __getIPPronounPickerViewControllerClass_block_invoke_57399;
        v10[3] = &unk_1E549AD00;
        v10[4] = &v11;
        __getIPPronounPickerViewControllerClass_block_invoke_57399((uint64_t)v10);
        v6 = (void *)v12[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v11, 8);
      LOBYTE(v3) = [v7 canDisplayPronounPicker];
    }
  }
  return v3;
}

- (BOOL)shouldKeepNoiseValue
{
  if ([(CNCardPropertyGroup *)self valueEditingItemsCount]) {
    return 0;
  }
  unsigned int v3 = [(CNCardGroup *)self contact];
  v4 = [v3 addressingGrammars];
  uint64_t v5 = [v4 count];

  if (v5 != 1) {
    return 0;
  }
  objc_opt_class();
  v6 = [(CNCardGroup *)self contact];
  id v7 = [v6 addressingGrammars];
  v8 = [v7 firstObject];
  objc_super v9 = [v8 value];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  char v12 = [v11 isUnspecified];
  return v12;
}

- (void)saveChanges
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  unsigned int v3 = [(CNCardGroup *)self contact];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v7 = [(CNCardPropertyGroup *)self editingItems];
    v23 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = [(CNCardPropertyGroup *)self editingItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      uint64_t v12 = *MEMORY[0x1E4F5A250];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          id v15 = v14;
          if (objc_opt_isKindOfClass()) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          v18 = [v17 labeledValue];
          v19 = [v18 value];

          if (((*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v19) & 1) == 0)
          {
            v20 = [v17 labeledValue];
            objc_msgSend(v23, "_cn_addNonNilObject:", v20);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    v21 = [v5 addressingGrammars];
    char v22 = [v21 isEqualToArray:v23];

    if ((v22 & 1) == 0 && ![(CNCardPropertyAddressingGrammarGroup *)self shouldKeepNoiseValue]) {
      [v5 setAddressingGrammars:v23];
    }
  }
}

- (BOOL)shouldShowLanguageLabel
{
  unsigned int v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v4 = [v3 firstObject];

  id v5 = [v4 componentsSeparatedByString:@"-"];
  id v6 = [v5 firstObject];
  id v7 = [(CNCardPropertyGroup *)self editingItems];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CNCardPropertyAddressingGrammarGroup_shouldShowLanguageLabel__block_invoke;
  v12[3] = &unk_1E549ACD8;
  id v13 = v6;
  id v14 = v4;
  id v8 = v4;
  id v9 = v6;
  char v10 = objc_msgSend(v7, "_cn_any:", v12);

  return v10;
}

uint64_t __63__CNCardPropertyAddressingGrammarGroup_shouldShowLanguageLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v7 = [v6 labeledValue];
  id v8 = [v7 value];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A250] + 16))())
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = [v10 languageIdentifier];
    if ([v12 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v11 = 0;
    }
    else
    {
      id v13 = [v10 languageIdentifier];
      uint64_t v11 = [v13 isEqualToString:*(void *)(a1 + 40)] ^ 1;
    }
  }

  return v11;
}

- (Class)propertyGroupItemClass
{
  return (Class)self;
}

- (id)newEditingItemWithValue:(id)a3
{
  id v4 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:a3];
  id v5 = [(CNCardGroup *)self contact];
  id v6 = +[CNPropertyGroupAddressingGrammarItem propertyGroupItemWithLabeledValue:v4 group:self contact:v5];

  [v6 setWasAdded:1];
  return v6;
}

@end