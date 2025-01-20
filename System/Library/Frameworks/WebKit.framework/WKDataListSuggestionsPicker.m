@interface WKDataListSuggestionsPicker
- (WKDataListSuggestionsPicker)initWithInformation:(void *)a3 inView:(id)a4;
- (id).cxx_construct;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (void)invalidate;
- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4;
- (void)updateWithInformation:(void *)a3;
@end

@implementation WKDataListSuggestionsPicker

- (WKDataListSuggestionsPicker)initWithInformation:(void *)a3 inView:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WKDataListSuggestionsPicker;
  v5 = -[WKDataListSuggestionsControl initWithInformation:inView:](&v16, sel_initWithInformation_inView_, a3);
  if (v5)
  {
    v6 = [WKDataListSuggestionsPickerView alloc];
    v7 = -[WKDataListSuggestionsPickerView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    m_ptr = v5->_pickerView.m_ptr;
    v5->_pickerView.m_ptr = v7;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v7 = (WKDataListSuggestionsPickerView *)v5->_pickerView.m_ptr;
    }
    [(WKDataListSuggestionsPickerView *)v7 setAutoresizingMask:18];
    [v5->_pickerView.m_ptr setDataSource:v5];
    [v5->_pickerView.m_ptr setDelegate:v5];
    [v5->_pickerView.m_ptr setControl:v5];
    [v5->_pickerView.m_ptr frame];
    double v10 = v9;
    double v12 = v11;
    [a4 sizeForLegacyFormControlPickerViews];
    objc_msgSend(v5->_pickerView.m_ptr, "setFrame:", v10, v12, v13, v14);
  }
  return v5;
}

- (void)updateWithInformation:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsPicker;
  -[WKDataListSuggestionsControl updateWithInformation:](&v5, sel_updateWithInformation_);
  if (*(unsigned char *)a3 == 1)
  {
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestionsInputView:self->_pickerView.m_ptr];
    [self->_pickerView.m_ptr reloadAllComponents];
    [self->_pickerView.m_ptr selectRow:0 inComponent:0 animated:0];
  }
  else
  {
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestionsInputView:0];
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestions:[(WKDataListSuggestionsControl *)self textSuggestions]];
  }
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  int v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)WKDataListSuggestionsPicker;
  -[WKDataListSuggestionsControl showSuggestionsDropdown:activationType:](&v6, sel_showSuggestionsDropdown_activationType_, a3);
  if (v4 == 1)
  {
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestionsInputView:self->_pickerView.m_ptr];
    [self->_pickerView.m_ptr selectRow:0 inComponent:0 animated:0];
  }
  else
  {
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestions:[(WKDataListSuggestionsControl *)self textSuggestions]];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if (!self) {
    return &stru_1EEA10550;
  }
  [(WKDataListSuggestionsControl *)self suggestionAtIndex:a4];
  if (!v8) {
    return &stru_1EEA10550;
  }
  objc_super v6 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v8 == 2) {
    WTF::StringImpl::destroy(v8, v5);
  }
  else {
    *(_DWORD *)v8 -= 2;
  }
  return v6;
}

- (void)invalidate
{
  v3 = [(WKContentView *)[(WKDataListSuggestionsControl *)self view] dataListTextSuggestionsInputView];
  m_ptr = (WKFormControl *)self->_pickerView.m_ptr;
  if (v3 == m_ptr)
  {
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestionsInputView:0];
    m_ptr = (WKFormControl *)self->_pickerView.m_ptr;
  }
  [(WKFormControl *)m_ptr setDelegate:0];
  [self->_pickerView.m_ptr setDataSource:0];
  objc_super v5 = self->_pickerView.m_ptr;

  [v5 setControl:0];
}

- (void).cxx_destruct
{
  m_ptr = self->_pickerView.m_ptr;
  self->_pickerView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end