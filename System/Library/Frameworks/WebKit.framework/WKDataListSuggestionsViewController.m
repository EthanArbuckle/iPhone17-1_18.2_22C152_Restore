@interface WKDataListSuggestionsViewController
- (WKDataListSuggestionsControl)control;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)reloadData;
- (void)setControl:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WKDataListSuggestionsViewController

- (void)reloadData
{
  objc_msgSend((id)-[WKDataListSuggestionsViewController tableView](self, "tableView"), "reloadData");
  uint64_t v3 = [(WKDataListSuggestionsControl *)[(WKDataListSuggestionsViewController *)self control] suggestionsCount];
  double v4 = 242.0;
  if (v3 <= 5) {
    double v4 = (double)v3 * 44.0;
  }

  -[WKDataListSuggestionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(WKDataListSuggestionsViewController *)self control];

  return [(WKDataListSuggestionsControl *)v4 suggestionsCount];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6 = (void *)[a3 dequeueReusableCellWithIdentifier:@"WKDataListSuggestionCell"];
  if (v6)
  {
    v7 = v6;
    CFRetain(v6);
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"WKDataListSuggestionCell"];
  }
  v8 = [(WKDataListSuggestionsViewController *)self control];
  uint64_t v9 = [a4 row];
  if (v8)
  {
    [(WKDataListSuggestionsControl *)v8 suggestionAtIndex:v9];
    if (v13)
    {
      v10 = (__CFString *)WTF::StringImpl::operator NSString *();
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
  }
  v10 = &stru_1EEA10550;
LABEL_9:
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v10);
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setLineBreakMode:", 4);
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setTextAlignment:", -[WKDataListSuggestionsControl textAlignment](-[WKDataListSuggestionsViewController control](self, "control"), "textAlignment"));
  return (id)(id)CFMakeCollectable(v7);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5 = [(WKDataListSuggestionsViewController *)self control];
  uint64_t v6 = [a4 row];

  [(WKDataListSuggestionsControl *)v5 didSelectOptionAtIndex:v6];
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