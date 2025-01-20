@interface WKDataListSuggestionsPopover
- (WKDataListSuggestionsPopover)initWithInformation:(void *)a3 inView:(id)a4;
- (id).cxx_construct;
- (void)didSelectOptionAtIndex:(int64_t)a3;
- (void)invalidate;
- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4;
- (void)updateWithInformation:(void *)a3;
@end

@implementation WKDataListSuggestionsPopover

- (WKDataListSuggestionsPopover)initWithInformation:(void *)a3 inView:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WKDataListSuggestionsPopover;
  v5 = -[WKDataListSuggestionsControl initWithInformation:inView:](&v9, sel_initWithInformation_inView_, a3);
  if (v5)
  {
    v6 = [[WKFormRotatingAccessoryPopover alloc] initWithView:a4];
    m_ptr = v5->_popover.m_ptr;
    v5->_popover.m_ptr = v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v5;
}

- (void)updateWithInformation:(void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKDataListSuggestionsPopover;
  [(WKDataListSuggestionsControl *)&v4 updateWithInformation:a3];
  [self->_suggestionsViewController.m_ptr reloadData];
  [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestions:[(WKDataListSuggestionsControl *)self textSuggestions]];
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WKDataListSuggestionsPopover;
  [(WKDataListSuggestionsControl *)&v9 showSuggestionsDropdown:a3 activationType:a4];
  v5 = [[WKDataListSuggestionsViewController alloc] initWithStyle:0];
  m_ptr = self->_suggestionsViewController.m_ptr;
  self->_suggestionsViewController.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v5 = (WKDataListSuggestionsViewController *)self->_suggestionsViewController.m_ptr;
  }
  [(WKDataListSuggestionsViewController *)v5 setControl:self];
  [self->_suggestionsViewController.m_ptr reloadData];
  [(WKContentView *)[(WKDataListSuggestionsControl *)self view] setDataListTextSuggestions:[(WKDataListSuggestionsControl *)self textSuggestions]];
  v7 = self->_popover.m_ptr;
  v8 = (const void *)[objc_alloc(MEMORY[0x1E4F42CC8]) initWithContentViewController:self->_suggestionsViewController.m_ptr];
  [v7 setPopoverController:v8];
  if (v8) {
    CFRelease(v8);
  }
  [self->_popover.m_ptr presentPopoverAnimated:0];
}

- (void)invalidate
{
}

- (void)didSelectOptionAtIndex:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)WKDataListSuggestionsPopover;
  -[WKDataListSuggestionsControl didSelectOptionAtIndex:](&v8, sel_didSelectOptionAtIndex_);
  objc_msgSend((id)objc_msgSend(self->_popover.m_ptr, "popoverController"), "dismissPopoverAnimated:", 1);
  [(WKDataListSuggestionsControl *)self suggestionAtIndex:a3];
  if (v7) {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_1EEA10550;
  }
  v9[0] = +[WKDataListTextSuggestion textSuggestionWithInputText:v5];
  -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_suggestionsViewController.m_ptr;
  self->_suggestionsViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->_popover.m_ptr;
  self->_popover.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end