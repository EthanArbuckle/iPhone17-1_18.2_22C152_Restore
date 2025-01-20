@interface WKDataListSuggestionsDropdown
- (WKDataListSuggestionsDropdown)initWithInformation:(void *)a3 inView:(id)a4;
- (id).cxx_construct;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)_displayWithActivationType:(unsigned __int8)a3;
- (void)_removeContextMenuInteraction;
- (void)_showSuggestions;
- (void)_suggestionsMenuDidDismiss;
- (void)_suggestionsMenuDidPresent;
- (void)_updateSuggestionsMenuElements;
- (void)_updateTextSuggestions;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didSelectOptionAtIndex:(int64_t)a3;
- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4;
- (void)updateWithInformation:(void *)a3;
@end

@implementation WKDataListSuggestionsDropdown

- (WKDataListSuggestionsDropdown)initWithInformation:(void *)a3 inView:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsDropdown;
  return [(WKDataListSuggestionsControl *)&v5 initWithInformation:a3 inView:a4];
}

- (void)updateWithInformation:(void *)a3
{
  uint64_t v4 = *(unsigned __int8 *)a3;
  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsDropdown;
  -[WKDataListSuggestionsControl updateWithInformation:](&v5, sel_updateWithInformation_);
  [(WKDataListSuggestionsDropdown *)self _displayWithActivationType:v4];
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)WKDataListSuggestionsDropdown;
  -[WKDataListSuggestionsControl showSuggestionsDropdown:activationType:](&v6, sel_showSuggestionsDropdown_activationType_, a3);
  [(WKDataListSuggestionsDropdown *)self _displayWithActivationType:v4];
}

- (void)didSelectOptionAtIndex:(int64_t)a3
{
  [(WKContentView *)[(WKDataListSuggestionsControl *)self view] updateFocusedElementFocusedWithDataListDropdown:0];
  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsDropdown;
  [(WKDataListSuggestionsControl *)&v5 didSelectOptionAtIndex:a3];
}

- (void)_displayWithActivationType:(unsigned __int8)a3
{
  char v4 = a3 - 1;
  if (a3 == 1)
  {
    uint64_t v5 = 1;
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v5 = 0;
LABEL_5:
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] updateFocusedElementFocusedWithDataListDropdown:v5];
  }
  [(WKDataListSuggestionsDropdown *)self _updateTextSuggestions];
  if (self->_suggestionsContextMenuPresenter.__ptr_.__value_
    || ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode] & 1) != 0
    || (v4 & 0xFD) == 0)
  {
    [(WKDataListSuggestionsDropdown *)self _showSuggestions];
  }
}

- (void)_showSuggestions
{
  [(WKDataListSuggestionsDropdown *)self _updateSuggestionsMenuElements];
  value = self->_suggestionsContextMenuPresenter.__ptr_.__value_;
  if (value)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke_269;
    v7[3] = &unk_1E5813698;
    v7[4] = self;
    objc_msgSend((id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction"), "updateVisibleMenuWithBlock:", v7);
  }
  else
  {
    char v4 = [(WKDataListSuggestionsControl *)self view];
    uint64_t v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, v4, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_suggestionsContextMenuPresenter, v5);
    objc_super v6 = [(WKDataListSuggestionsControl *)self view];
    id location = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke;
    v9[3] = &__block_descriptor_40_e8_32c62_ZTSKZ49__WKDataListSuggestionsDropdown__showSuggestions_E3__5_e5_v8__0l;
    objc_initWeak(&location, self);
    id v10 = 0;
    objc_copyWeak(&v10, &location);
    [(WKContentView *)v6 doAfterEditorStateUpdateAfterFocusingElement:v9];
    objc_destroyWeak(&location);
    objc_destroyWeak(&v10);
  }
}

void __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = (id *)WeakRetained[7];
    if (!v3)
    {
LABEL_13:
      CFRelease(v2);
      return;
    }
    char v4 = (void *)[WeakRetained view];
    uint64_t v5 = v4;
    if (v4) {
      CFRetain(v4);
    }
    uint64_t v6 = *(void *)([v5 focusedElementInformation] + 8);
    if ((int)v6 < 1 || SHIDWORD(v6) <= 0)
    {
      [v5 lastInteractionLocation];
      v10.x = v8;
      v10.y = v9;
      WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v11, &v10);
      if (!v5)
      {
LABEL_12:
        WebCore::IntRect::operator CGRect();
        WebKit::CompactContextMenuPresenter::present(v3, v12);
        goto LABEL_13;
      }
    }
    else if (!v5)
    {
      goto LABEL_12;
    }
    CFRelease(v5);
    goto LABEL_12;
  }
}

uint64_t __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke_269(uint64_t a1, void *a2)
{
  return [a2 menuByReplacingChildren:*(void *)(*(void *)(a1 + 32) + 48)];
}

- (void)_updateTextSuggestions
{
  id v3 = [(WKDataListSuggestionsControl *)self textSuggestions];
  char v4 = [(WKDataListSuggestionsControl *)self view];

  [(WKContentView *)v4 setDataListTextSuggestions:v3];
}

- (void)_updateSuggestionsMenuElements
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[WKDataListSuggestionsControl suggestionsCount](self, "suggestionsCount"));
  if ([(WKDataListSuggestionsControl *)self suggestionsCount] >= 1)
  {
    char v4 = 0;
    while (1)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F426E8];
      if (!self) {
        break;
      }
      [(WKDataListSuggestionsControl *)self suggestionAtIndex:v4];
      if (!v16) {
        goto LABEL_7;
      }
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_8:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3321888768;
      v14[2] = __63__WKDataListSuggestionsDropdown__updateSuggestionsMenuElements__block_invoke;
      v14[3] = &__block_descriptor_48_e8_32c76_ZTSKZ63__WKDataListSuggestionsDropdown__updateSuggestionsMenuElements_E3__6_e18_v16__0__UIAction_8l;
      id location = 0;
      objc_initWeak(&location, self);
      v13 = v4;
      v15[0] = 0;
      objc_copyWeak(v15, &location);
      v15[1] = v13;
      uint64_t v7 = [v5 actionWithTitle:v6 image:0 identifier:0 handler:v14];
      objc_destroyWeak(&location);
      CGFloat v9 = v16;
      v16 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v8);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
      [v3 addObject:v7];
      objc_destroyWeak(v15);
      if ((uint64_t)++v4 >= [(WKDataListSuggestionsControl *)self suggestionsCount]) {
        goto LABEL_13;
      }
    }
    v16 = 0;
LABEL_7:
    uint64_t v6 = &stru_1EEA10550;
    goto LABEL_8;
  }
LABEL_13:
  CGPoint v10 = (void *)[v3 copy];
  m_ptr = self->_suggestionsMenuElements.m_ptr;
  self->_suggestionsMenuElements.m_ptr = v10;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

void __63__WKDataListSuggestionsDropdown__updateSuggestionsMenuElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained didSelectOptionAtIndex:*(void *)(a1 + 40)];
    CFRelease(v3);
  }
}

- (void)_removeContextMenuInteraction
{
  p_suggestionsContextMenuPresenter = (id **)&self->_suggestionsContextMenuPresenter;
  value = self->_suggestionsContextMenuPresenter.__ptr_.__value_;
  if (value)
  {
    objc_msgSend((id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction"), "dismissMenu");
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_suggestionsContextMenuPresenter, 0);
    [(WKContentView *)[(WKDataListSuggestionsControl *)self view] _removeContextMenuHintContainerIfPossible];
    id v5 = [(WKContentView *)[(WKDataListSuggestionsControl *)self view] webView];
    [v5 _didDismissContextMenu];
  }
}

- (void)_suggestionsMenuDidPresent
{
  [(WKDataListSuggestionsControl *)self setIsShowingSuggestions:1];
  id v3 = [(WKContentView *)[(WKDataListSuggestionsControl *)self view] webView];

  [v3 _didShowContextMenu];
}

- (void)_suggestionsMenuDidDismiss
{
  [(WKDataListSuggestionsControl *)self setIsShowingSuggestions:0];
  [(WKContentView *)[(WKDataListSuggestionsControl *)self view] updateFocusedElementFocusedWithDataListDropdown:0];
  [(WKDataListSuggestionsDropdown *)self _updateTextSuggestions];

  [(WKDataListSuggestionsDropdown *)self _removeContextMenuInteraction];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v5 = [(WKDataListSuggestionsControl *)self view];

  return [(WKContentView *)v5 _createTargetedContextMenuHintPreviewForFocusedElement:1];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __87__WKDataListSuggestionsDropdown_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c100_ZTSKZ87__WKDataListSuggestionsDropdown_contextMenuInteraction_configurationForMenuAtLocation__E3__7_e25___UIMenu_16__0__NSArray_8l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_destroyWeak(&v6);
  char v4 = (void *)[MEMORY[0x1E4F428F0] configurationWithIdentifier:0 previewProvider:0 actionProvider:v7];
  objc_destroyWeak(&v8);
  return v4;
}

uint64_t __87__WKDataListSuggestionsDropdown_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return 0;
  }
  v2 = WeakRetained;
  uint64_t v3 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EEA10550 children:*((void *)WeakRetained + 6)];
  CFRelease(v2);
  return v3;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __97__WKDataListSuggestionsDropdown_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c110_ZTSKZ97__WKDataListSuggestionsDropdown_contextMenuInteraction_willDisplayMenuForConfiguration_animator__E3__8_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a5 addCompletion:v7];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __97__WKDataListSuggestionsDropdown_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _suggestionsMenuDidPresent];
    CFRelease(v2);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __89__WKDataListSuggestionsDropdown_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c102_ZTSKZ89__WKDataListSuggestionsDropdown_contextMenuInteraction_willEndForConfiguration_animator__E3__9_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a5 addCompletion:v7];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __89__WKDataListSuggestionsDropdown_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _suggestionsMenuDidDismiss];
    CFRelease(v2);
  }
}

- (void).cxx_destruct
{
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_suggestionsContextMenuPresenter, 0);
  m_ptr = self->_suggestionsMenuElements.m_ptr;
  self->_suggestionsMenuElements.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end