@interface CNPostalAddressEditorView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (CNPostalAddress)address;
- (CNPostalAddressEditorTableView)tableView;
- (CNPostalAddressEditorView)initWithFrame:(CGRect)a3;
- (CNPostalAddressFormattingSpecification)formatSpecification;
- (CNPresenterDelegate)delegate;
- (NSArray)cellsLayout;
- (NSDictionary)ab_textAttributes;
- (NSMutableDictionary)textFields;
- (NSString)ab_text;
- (UIColor)separatorColor;
- (id)_addressValueForKey:(id)a3;
- (id)_cellsLayoutForCountryCode:(id)a3;
- (id)_countryCode;
- (id)_normalizeCountryCodeToISO:(id)a3;
- (id)keyboardSettingsForAddress:(id)a3 component:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)lineCount;
- (void)_invalidateCellsLayout;
- (void)_setAddressValue:(id)a3 forKey:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)countryPicker:(id)a3 didPickCountryCode:(id)a4;
- (void)countryPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)keyboardWillShow:(id)a3;
- (void)setAb_textAttributes:(id)a3;
- (void)setAddress:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCellsLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFormatSpecification:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldChanged:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation CNPostalAddressEditorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_formatSpecification, 0);
  objc_storeStrong((id *)&self->_cellsLayout, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_valueTextAttributes, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

- (NSMutableDictionary)textFields
{
  return self->_textFields;
}

- (void)setFormatSpecification:(id)a3
{
}

- (CNPostalAddressFormattingSpecification)formatSpecification
{
  return self->_formatSpecification;
}

- (void)setCellsLayout:(id)a3
{
}

- (void)setTableView:(id)a3
{
}

- (CNPostalAddressEditorTableView)tableView
{
  return self->_tableView;
}

- (void)setDelegate:(id)a3
{
}

- (CNPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (id)keyboardSettingsForAddress:(id)a3 component:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 ISOCountryCode];
    v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = &stru_1ED8AC728;
    }
    v11 = v10;

    v12 = [v5 ISOCountryCode];
    int v13 = [v12 isEqualToString:&stru_1ED8AC728];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F5A498] defaultCountryCode];

      v11 = (__CFString *)v14;
    }
    v15 = [MEMORY[0x1E4F1BA88] formatPropertyKeyForPostalAddressPropertyKey:v6];
    v16 = [MEMORY[0x1E4F5A4A0] addressFormats];
    v17 = [v16 objectForKeyedSubscript:v11];
    v18 = [v17 objectForKeyedSubscript:@"kbdSettings"];
    v7 = [v18 objectForKeyedSubscript:v15];
    if (!v7)
    {
      v19 = [v16 objectForKeyedSubscript:@"defaultKbdSettings"];
      v7 = [v19 objectForKeyedSubscript:v15];
    }
  }

  return v7;
}

- (id)_cellsLayoutForCountryCode:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNPostalAddressEditorView *)self textFields];
  [v5 removeAllObjects];

  if (![v4 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F5A498] defaultCountryCode];

    id v4 = (id)v6;
  }
  v7 = [MEMORY[0x1E4F1BA88] specificationForCountry:v4];
  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1BA88];
    v9 = [MEMORY[0x1E4F5A498] defaultCountryCode];
    v7 = [v8 specificationForCountry:v9];
  }
  objc_storeStrong((id *)&self->_formatSpecification, v7);
  v10 = [v7 editingFieldArrangement];
  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    v11 = objc_msgSend(v10, "_cn_flatten");
    uint64_t v12 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_75_27026);

    v10 = (void *)v12;
  }
  v21[0] = *MEMORY[0x1E4F1B7C8];
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v14 = [v10 indexOfObject:v13];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)[v10 mutableCopy];
    [v15 removeObjectAtIndex:v14];
    [v15 insertObject:&unk_1ED915B30 atIndex:v14];
    [v15 insertObject:&unk_1ED915B48 atIndex:v14];

    v10 = v15;
  }
  uint64_t v16 = *MEMORY[0x1E4F5A298];
  v17 = [(CNPostalAddressEditorView *)self address];
  v18 = [v17 country];
  LODWORD(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v18);

  if (v16)
  {
    v19 = [MEMORY[0x1E4F1BA88] localizedCountryNameForISOCountryCode:v4];
    [(CNMutablePostalAddress *)self->_address setCountry:v19];

    [(CNMutablePostalAddress *)self->_address setISOCountryCode:v4];
  }

  return v10;
}

id __56__CNPostalAddressEditorView__cellsLayoutForCountryCode___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = a2;
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:v6 count:1];

  return v4;
}

- (id)_normalizeCountryCodeToISO:(id)a3
{
  id v3 = a3;
  if (_normalizeCountryCodeToISO__onceToken != -1) {
    dispatch_once(&_normalizeCountryCodeToISO__onceToken, &__block_literal_global_27038);
  }
  if (![v3 length]
    || ([v3 lowercaseString],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        [(id)_normalizeCountryCodeToISO__countryCodes objectForKeyedSubscript:v4],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        id v3 = v4,
        !v5))
  {
    id v5 = v3;
    id v4 = v5;
  }

  return v5;
}

void __56__CNPostalAddressEditorView__normalizeCountryCodeToISO___block_invoke()
{
  v0 = (void *)_normalizeCountryCodeToISO__countryCodes;
  _normalizeCountryCodeToISO__countryCodes = (uint64_t)&unk_1ED915D00;
}

- (id)_countryCode
{
  id v3 = [(CNPostalAddressEditorView *)self address];
  id v4 = [v3 ISOCountryCode];
  id v5 = [(CNPostalAddressEditorView *)self _normalizeCountryCodeToISO:v4];

  return v5;
}

- (id)_addressValueForKey:(id)a3
{
  id v4 = (void *)*MEMORY[0x1E4F1B7C8];
  id v5 = a3;
  if ([v5 rangeOfString:v4])
  {
    uint64_t v6 = [(CNPostalAddressEditorView *)self address];
    v7 = [v6 valueForKey:v5];
  }
  else
  {
    uint64_t v8 = [(CNMutablePostalAddress *)self->_address street];
    uint64_t v6 = [v8 componentsSeparatedByString:@"\n"];

    unsigned int v9 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v4, "length"));
    if ((unint64_t)v9 - 49 >= [v6 count])
    {
      v7 = &stru_1ED8AC728;
    }
    else
    {
      v7 = [v6 objectAtIndexedSubscript:v9 - 49];
    }
  }

  return v7;
}

- (void)_setAddressValue:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = (void *)*MEMORY[0x1E4F1B7C8];
  uint64_t v8 = [v6 rangeOfString:*MEMORY[0x1E4F1B7C8]];
  address = self->_address;
  if (v8)
  {
    [(CNMutablePostalAddress *)address setValue:v15 forKey:v6];
  }
  else
  {
    v10 = [(CNMutablePostalAddress *)address street];
    v11 = [v10 componentsSeparatedByString:@"\n"];
    uint64_t v12 = (void *)[v11 mutableCopy];

    if (!v12) {
      uint64_t v12 = objc_opt_new();
    }
    unint64_t v13 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v7, "length")) - 49;
    if (v13 >= [v12 count])
    {
      [v12 addObject:v15];
    }
    else if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      [v12 removeObjectAtIndex:v13];
    }
    else
    {
      [v12 setObject:v15 atIndexedSubscript:v13];
    }
    uint64_t v14 = [v12 componentsJoinedByString:@"\n"];
    [(CNMutablePostalAddress *)self->_address setStreet:v14];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNPostalAddressEditorView;
  id v4 = a3;
  [(CNPostalAddressEditorView *)&v6 setBackgroundColor:v4];
  id v5 = [(CNPostalAddressEditorView *)self tableView];
  [v5 setBackgroundColor:v4];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v11 = a3;
  id v4 = [(CNPostalAddressEditorView *)self textFields];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1B7A0]];

  if (v5 == v11)
  {
    objc_super v6 = objc_alloc_init(CNCountryPickerController);
    [(CNCountryPickerController *)v6 setDelegate:self];
    v7 = [(CNPostalAddressEditorView *)self address];
    uint64_t v8 = [v7 ISOCountryCode];
    [(CNCountryPickerController *)v6 setSelectedCountryCode:v8];

    unsigned int v9 = [(CNPostalAddressEditorView *)self delegate];
    v10 = [v11 superview];
    [v9 sender:v10 presentViewController:v6];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  uint64_t v8 = [(CNPostalAddressEditorView *)self backgroundColor];
  [v14 setBackgroundColor:v8];

  [v14 setPreservesSuperviewLayoutMargins:0];
  uint64_t v9 = [v7 row];

  objc_msgSend(v14, "setSeparatorStyle:", v9 != -[CNPostalAddressEditorView lineCount](self, "lineCount") - 1);
  [v14 _setShouldHaveFullLengthTopSeparator:1];
  [v14 setLayoutMarginsFollowReadableWidth:0];
  double v10 = *MEMORY[0x1E4FB2848];
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  objc_msgSend(v14, "setLayoutMargins:", *MEMORY[0x1E4FB2848], v11, v12, v13);
  objc_msgSend(v14, "setSeparatorInset:", v10, v11, v12, v13);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(CNPostalAddressEditorView *)self cellsLayout];
  double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

  double v11 = &off_1E5494E00;
  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    if ((unint64_t)[v10 count] >= 3)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"CNPostalAddressEditorView.m" lineNumber:324 description:@"Only one or two cells per line are supported."];
    }
    if ((unint64_t)[v10 count] > 1) {
      double v11 = off_1E5494DF8;
    }
  }
  [(__objc2_class *)*v11 cellIdentifier];
  v34 = v8;
  v33 = v35 = v7;
  double v12 = objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:");
  [v12 setTextAttributes:self->_valueTextAttributes];
  double v13 = [MEMORY[0x1E4FB1618] clearColor];
  [v12 setBackgroundColor:v13];

  v36 = v12;
  v38 = [v12 textFields];
  uint64_t v14 = [v38 count];
  if (v14 != [v10 count])
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"CNPostalAddressEditorView.m" lineNumber:337 description:@"We should have as many text fields as there are line parts."];
  }
  if ([v10 count])
  {
    unint64_t v15 = 0;
    v39 = (void *)*MEMORY[0x1E4F1B7C8];
    uint64_t v37 = *MEMORY[0x1E4F1B7A0];
    do
    {
      id v16 = [v10 objectAtIndexedSubscript:v15];
      v17 = [v38 objectAtIndexedSubscript:v15];
      v18 = [(CNPostalAddressEditorView *)self _addressValueForKey:v16];
      [v17 setText:v18];

      id v19 = v16;
      if (![v16 rangeOfString:v39])
      {
        id v19 = v39;
      }
      v20 = [(CNPostalAddressEditorView *)self formatSpecification];
      v21 = [v20 localizedPlaceholderForKey:v19];

      v22 = [v17 placeholder];
      char v23 = [v22 isEqualToString:v21];

      if ((v23 & 1) == 0) {
        [v17 setPlaceholder:v21];
      }
      v24 = [(CNPostalAddressEditorView *)self address];
      v25 = [(CNPostalAddressEditorView *)self keyboardSettingsForAddress:v24 component:v19];

      objc_msgSend(v17, "setKeyboardType:", +[CNKeyboardSettings keyboardTypeFromDictionary:](CNKeyboardSettings, "keyboardTypeFromDictionary:", v25));
      objc_msgSend(v17, "setAutocapitalizationType:", +[CNKeyboardSettings autocapitalizationTypeFromDictionary:](CNKeyboardSettings, "autocapitalizationTypeFromDictionary:", v25));
      objc_msgSend(v17, "setAutocorrectionType:", +[CNKeyboardSettings autocorrectionTypeFromDictionary:](CNKeyboardSettings, "autocorrectionTypeFromDictionary:", v25));
      objc_msgSend(v17, "_cnui_applyContactStyle");
      v26 = [v10 objectAtIndexedSubscript:v15];
      int v27 = [v26 isEqualToString:v37];

      if (v27)
      {
        [v36 setShowsChevron:1];
        v28 = self;
      }
      else
      {
        v28 = 0;
      }
      [v17 setDelegate:v28];
      v29 = [(CNPostalAddressEditorView *)self textFields];
      [v29 setObject:v17 forKeyedSubscript:v16];

      ++v15;
    }
    while (v15 < [v10 count]);
  }
  [v36 setNeedsUpdateConstraints];

  return v36;
}

- (void)countryPicker:(id)a3 didPickCountryCode:(id)a4
{
  address = self->_address;
  id v7 = a4;
  id v8 = a3;
  [(CNMutablePostalAddress *)address setISOCountryCode:v7];
  uint64_t v9 = [MEMORY[0x1E4F1BA88] localizedCountryNameForISOCountryCode:v7];

  [(CNMutablePostalAddress *)self->_address setCountry:v9];
  [(CNPostalAddressEditorView *)self _invalidateCellsLayout];
  [(CNPostalAddressEditorView *)self sendActionsForControlEvents:0x1000000];
  [(CNPostalAddressEditorView *)self sendActionsForControlEvents:4096];
  id v10 = [(CNPostalAddressEditorView *)self delegate];
  [v10 sender:self dismissViewController:v8];
}

- (void)countryPickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPostalAddressEditorView *)self delegate];
  [v5 sender:self dismissViewController:v4];
}

- (void)keyboardWillShow:(id)a3
{
  id v3 = [(CNPostalAddressEditorView *)self textFields];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B7A0]];

  if ([v4 isFirstResponder]) {
    [v4 resignFirstResponder];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  int v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  double v5 = 44.0;
  if (v4) {
    double v5 = 33.0;
  }
  [v6 _scaledValueForValue:v5];
  -[CNPostalAddressEditorTableView setRowHeight:](self->_tableView, "setRowHeight:");
  [(CNPostalAddressEditorView *)self _invalidateCellsLayout];
}

- (void)textFieldChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 object];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = [(CNPostalAddressEditorView *)self textFields];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v12 = [(CNPostalAddressEditorView *)self textFields];
        double v13 = [v12 objectForKeyedSubscript:v11];

        if (v4 == v13)
        {
          uint64_t v14 = [v4 text];
          [(CNPostalAddressEditorView *)self _setAddressValue:v14 forKey:v11];

          [(CNPostalAddressEditorView *)self sendActionsForControlEvents:4096];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSArray)cellsLayout
{
  cellsLayout = self->_cellsLayout;
  if (!cellsLayout)
  {
    int v4 = [(CNPostalAddressEditorView *)self _countryCode];
    double v5 = [(CNPostalAddressEditorView *)self _cellsLayoutForCountryCode:v4];
    id v6 = (NSArray *)[v5 copy];
    uint64_t v7 = self->_cellsLayout;
    self->_cellsLayout = v6;

    cellsLayout = self->_cellsLayout;
  }

  return cellsLayout;
}

- (void)_invalidateCellsLayout
{
  [(CNPostalAddressEditorView *)self setCellsLayout:0];
  id v3 = [(CNPostalAddressEditorView *)self tableView];
  [v3 reloadData];

  id v4 = [(CNPostalAddressEditorView *)self tableView];
  [v4 invalidateIntrinsicContentSize];
}

- (void)setAddress:(id)a3
{
  id v9 = a3;
  char v4 = [v9 isEqual:self->_address];
  double v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = (CNMutablePostalAddress *)[v9 mutableCopy];
    address = self->_address;
    self->_address = v6;

    uint64_t v8 = [(CNPostalAddressEditorView *)self _countryCode];
    if (v8) {
      [(CNMutablePostalAddress *)self->_address setISOCountryCode:v8];
    }
    [(CNPostalAddressEditorView *)self _invalidateCellsLayout];

    double v5 = v9;
  }
}

- (CNPostalAddress)address
{
  address = self->_address;
  if (!address)
  {
    char v4 = (CNMutablePostalAddress *)objc_alloc_init(MEMORY[0x1E4F1BA58]);
    double v5 = self->_address;
    self->_address = v4;

    id v6 = [MEMORY[0x1E4F5A498] defaultCountryCode];
    [(CNMutablePostalAddress *)self->_address setISOCountryCode:v6];

    address = self->_address;
  }

  return (CNPostalAddress *)address;
}

- (UIColor)separatorColor
{
  v2 = [(CNPostalAddressEditorView *)self tableView];
  id v3 = [v2 separatorColor];

  return (UIColor *)v3;
}

- (void)setSeparatorColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPostalAddressEditorView *)self tableView];
  [v5 setSeparatorColor:v4];
}

- (void)setAb_textAttributes:(id)a3
{
  if (self->_valueTextAttributes != a3)
  {
    id v4 = (NSDictionary *)[a3 copy];
    valueTextAttributes = self->_valueTextAttributes;
    self->_valueTextAttributes = v4;

    id v6 = [(CNPostalAddressEditorView *)self tableView];
    [v6 reloadData];

    id v7 = [(CNPostalAddressEditorView *)self tableView];
    [v7 invalidateIntrinsicContentSize];
  }
}

- (NSDictionary)ab_textAttributes
{
  return self->_valueTextAttributes;
}

- (NSString)ab_text
{
  return 0;
}

- (int64_t)lineCount
{
  v2 = [(CNPostalAddressEditorView *)self cellsLayout];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CNPostalAddressEditorView;
  -[CNPostalAddressEditorView setEnabled:](&v16, sel_setEnabled_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CNPostalAddressEditorView *)self textFields];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 setEnabled:v3];
        [v11 setUserInteractionEnabled:v3];
        objc_msgSend(v11, "_cnui_applyContactStyle");
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(CNPostalAddressEditorView *)self textFields];
  id v4 = [v3 objectForKeyedSubscript:@"street1"];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNPostalAddressEditorView *)self textFields];
  id v6 = [v5 objectForKeyedSubscript:@"street1"];
  char v7 = [v6 becomeFirstResponder];

  return v7;
}

- (BOOL)isFirstResponder
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CNPostalAddressEditorView *)self textFields];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isFirstResponder])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  BOOL v3 = [(CNPostalAddressEditorView *)self textFields];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"street1"];
  if (v4) {
    char v5 = [(CNPostalAddressEditorView *)self isEnabled];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNPostalAddressEditorView;
  [(CNPostalAddressEditorView *)&v4 dealloc];
}

- (CNPostalAddressEditorView)initWithFrame:(CGRect)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)CNPostalAddressEditorView;
  BOOL v3 = -[CNPostalAddressEditorView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    char v5 = [CNPostalAddressEditorTableView alloc];
    [(CNPostalAddressEditorView *)v3 bounds];
    uint64_t v6 = -[CNPostalAddressEditorTableView initWithFrame:style:](v5, "initWithFrame:style:", 0);
    tableView = v3->_tableView;
    v3->_tableView = (CNPostalAddressEditorTableView *)v6;

    [(CNPostalAddressEditorTableView *)v3->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNPostalAddressEditorTableView *)v3->_tableView setDelegate:v3];
    [(CNPostalAddressEditorTableView *)v3->_tableView setDataSource:v3];
    [(CNPostalAddressEditorTableView *)v3->_tableView _setMarginWidth:0.0];
    [(CNPostalAddressEditorTableView *)v3->_tableView setScrollEnabled:0];
    int v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    double v9 = 44.0;
    if (v8) {
      double v9 = 33.0;
    }
    [v4 _scaledValueForValue:v9];
    -[CNPostalAddressEditorTableView setRowHeight:](v3->_tableView, "setRowHeight:");
    [(CNPostalAddressEditorTableView *)v3->_tableView setSeparatorStyle:0];
    [(CNPostalAddressEditorTableView *)v3->_tableView setLayoutMarginsFollowReadableWidth:0];
    [(CNPostalAddressEditorTableView *)v3->_tableView setPreservesSuperviewLayoutMargins:0];
    [(CNPostalAddressEditorTableView *)v3->_tableView _setNeedsLayoutOnVisibleBoundsChange:1];
    [(CNPostalAddressEditorView *)v3 addSubview:v3->_tableView];
    long long v10 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = (void *)MEMORY[0x1E4F28DC8];
    v32 = @"tableView";
    v33[0] = v3->_tableView;
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v13 = [v11 constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:0 metrics:0 views:v12];
    [v10 addObjectsFromArray:v13];

    long long v14 = (void *)MEMORY[0x1E4F28DC8];
    v30 = @"tableView";
    v31 = v3->_tableView;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    objc_super v16 = [v14 constraintsWithVisualFormat:@"V:|-0-[tableView]-0-|" options:0 metrics:0 views:v15];
    [v10 addObjectsFromArray:v16];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
    long long v17 = v3->_tableView;
    uint64_t v18 = objc_opt_class();
    id v19 = +[CNAddressComponentTextFieldCell cellIdentifier];
    [(CNPostalAddressEditorTableView *)v17 registerClass:v18 forCellReuseIdentifier:v19];

    uint64_t v20 = v3->_tableView;
    uint64_t v21 = objc_opt_class();
    v22 = +[CNAddressComponentSplitTextFieldCell cellIdentifier];
    [(CNPostalAddressEditorTableView *)v20 registerClass:v21 forCellReuseIdentifier:v22];

    char v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v3 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v3 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    textFields = v3->_textFields;
    v3->_textFields = v25;

    int v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v3 selector:sel_textFieldChanged_ name:*MEMORY[0x1E4FB3018] object:0];
  }
  return v3;
}

@end