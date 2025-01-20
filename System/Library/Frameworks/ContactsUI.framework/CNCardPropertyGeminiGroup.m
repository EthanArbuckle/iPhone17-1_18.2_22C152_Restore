@interface CNCardPropertyGeminiGroup
- (BOOL)shouldShowGemini;
- (id)_loadPropertyItems;
- (id)displayItems;
- (id)editingItems;
- (void)setGeminiResult:(id)a3;
- (void)setShouldShowGemini:(BOOL)a3;
@end

@implementation CNCardPropertyGeminiGroup

- (void)setShouldShowGemini:(BOOL)a3
{
  self->_shouldShowGemini = a3;
}

- (BOOL)shouldShowGemini
{
  return self->_shouldShowGemini;
}

- (id)displayItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)editingItems
{
  if ([(CNCardPropertyGeminiGroup *)self shouldShowGemini])
  {
    v3 = [(CNCardPropertyGroup *)self propertyItems];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)setGeminiResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(CNCardPropertyGroup *)self propertyItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setGeminiResult:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_loadPropertyItems
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNCardGroup *)self contact];
  uint64_t v4 = [v3 preferredChannel];
  v5 = (void *)v4;
  uint64_t v6 = &stru_1ED8AC728;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  uint64_t v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v7];

  uint64_t v9 = [(CNCardGroup *)self contact];
  long long v10 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v8 group:self contact:v9];
  v13[0] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

@end