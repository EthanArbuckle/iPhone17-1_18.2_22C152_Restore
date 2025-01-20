@interface WKDataListSuggestionsPickerView
- (WKDataListSuggestionsControl)control;
- (void)controlEndEditing;
- (void)setControl:(id)a3;
@end

@implementation WKDataListSuggestionsPickerView

- (void)controlEndEditing
{
  v3 = [(WKDataListSuggestionsPickerView *)self control];
  uint64_t v4 = [(WKDataListSuggestionsPickerView *)self selectedRowInComponent:0];

  [(WKDataListSuggestionsControl *)v3 didSelectOptionAtIndex:v4];
}

- (WKDataListSuggestionsControl)control
{
  return (WKDataListSuggestionsControl *)objc_loadWeak((id *)&self->_control);
}

- (void)setControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end