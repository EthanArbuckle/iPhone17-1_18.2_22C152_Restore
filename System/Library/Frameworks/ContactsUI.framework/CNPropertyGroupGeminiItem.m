@interface CNPropertyGroupGeminiItem
- (BOOL)canRemove;
- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4;
- (BOOL)isValidValue:(id)a3;
- (CNGeminiResult)geminiResult;
- (CNMutableContact)editingContact;
- (CNUIGeminiDataSourceDelegate)geminiUpdateDelegate;
- (NSString)description;
- (id)displayLabel;
- (id)displayStringForValue:(id)a3;
- (id)displayValue;
- (void)geminiDataSourceDidUpdate:(id)a3;
- (void)setEditingContact:(id)a3;
- (void)setGeminiResult:(id)a3;
- (void)setGeminiUpdateDelegate:(id)a3;
- (void)updateLabeledValueWithValue:(id)a3;
@end

@implementation CNPropertyGroupGeminiItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_destroyWeak((id *)&self->_geminiUpdateDelegate);

  objc_storeStrong((id *)&self->_geminiResult, 0);
}

- (void)setEditingContact:(id)a3
{
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setGeminiUpdateDelegate:(id)a3
{
}

- (CNUIGeminiDataSourceDelegate)geminiUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geminiUpdateDelegate);

  return (CNUIGeminiDataSourceDelegate *)WeakRetained;
}

- (void)setGeminiResult:(id)a3
{
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyGroupGeminiItem *)self geminiUpdateDelegate];
  [v5 geminiDataSourceDidUpdate:v4];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  v6 = [v5 value];
  v7 = [(CNPropertyGroupGeminiItem *)self geminiResult];
  v8 = [v7 channel];
  v9 = NSNumber;
  v10 = [(CNPropertyGroupGeminiItem *)self geminiResult];
  v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "usage"));
  v12 = [v3 stringWithFormat:@"<%@ %p> %@ %@ %@", v4, self, v6, v8, v11];

  return (NSString *)v12;
}

- (BOOL)canRemove
{
  return 0;
}

- (BOOL)isValidValue:(id)a3
{
  return (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() ^ 1;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v5 = a3;
  v6 = [(CNPropertyGroupItem *)self labeledValue];
  v7 = [v6 value];
  v8 = [v5 labeledValue];

  v9 = [v8 value];
  char v10 = [v7 isEqual:v9];

  return v10;
}

- (void)updateLabeledValueWithValue:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CNPropertyGroupGeminiItem;
  id v4 = a3;
  [(CNPropertyGroupItem *)&v13 updateLabeledValueWithValue:v4];
  id v5 = [(CNPropertyGroupGeminiItem *)self editingContact];

  if (!v5)
  {
    v6 = [(CNPropertyGroupItem *)self contact];
    v7 = (void *)[v6 mutableCopy];
    [(CNPropertyGroupGeminiItem *)self setEditingContact:v7];
  }
  v8 = [(CNPropertyGroupGeminiItem *)self editingContact];
  [v8 setPreferredChannel:v4];

  v9 = +[CNUIContactsEnvironment currentEnvironment];
  char v10 = [v9 geminiManager];
  v11 = [(CNPropertyGroupGeminiItem *)self editingContact];
  v12 = [v10 remoteGeminiResultForContact:v11 substituteDefaultForDangling:0 error:0];
  [(CNPropertyGroupGeminiItem *)self setGeminiResult:v12];
}

- (id)displayStringForValue:(id)a3
{
  id v4 = [(CNPropertyGroupGeminiItem *)self geminiResult];
  uint64_t v5 = [v4 usage];

  if (v5 == 2)
  {
    v11 = [(CNPropertyGroupGeminiItem *)self geminiResult];
    v12 = [v11 channel];
    int v13 = [v12 isAvailable];

    v9 = CNContactsUIBundle();
    if (v13) {
      char v10 = @"PREFERRED_LINE_EDIT_CONTACT_PROPERTY_LAST_USED_VALUE-%@";
    }
    else {
      char v10 = @"PREFERRED_LINE_EDIT_CONTACT_PROPERTY_LAST_USED_VALUE_UNAVAILABLE-%@";
    }
  }
  else
  {
    if (v5 != 1)
    {
      v14 = CNContactsUIBundle();
      v9 = v14;
      char v10 = @"PREFERRED_LINE_EDIT_CONTACT_PROPERTY_DEFAULT_VALUE-%@";
      goto LABEL_11;
    }
    v6 = [(CNPropertyGroupGeminiItem *)self geminiResult];
    v7 = [v6 channel];
    int v8 = [v7 isAvailable];

    v9 = CNContactsUIBundle();
    if (v8) {
      char v10 = @"PREFERRED_LINE_EDIT_CONTACT_PROPERTY_ALWAYS_USE_VALUE-%@";
    }
    else {
      char v10 = @"PREFERRED_LINE_EDIT_CONTACT_PROPERTY_ALWAYS_USE_VALUE_UNAVAILABLE-%@";
    }
  }
  v14 = v9;
LABEL_11:
  v15 = [v14 localizedStringForKey:v10 value:&stru_1ED8AC728 table:@"Localized-GEMINI"];

  v16 = NSString;
  v17 = [(CNPropertyGroupGeminiItem *)self geminiResult];
  v18 = [v17 channel];
  uint64_t v19 = [v18 localizedLabel];
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = &stru_1ED8AC728;
  }
  v22 = objc_msgSend(v16, "stringWithFormat:", v15, v21);

  return v22;
}

- (id)displayValue
{
  return [(CNPropertyGroupGeminiItem *)self displayStringForValue:0];
}

- (id)displayLabel
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"PREFERRED_LINE_EDIT_CONTACT_PROPERTY_LABEL" value:&stru_1ED8AC728 table:@"Localized-GEMINI"];

  return v3;
}

@end