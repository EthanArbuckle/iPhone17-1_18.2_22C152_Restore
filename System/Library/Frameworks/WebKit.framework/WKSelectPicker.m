@interface WKSelectPicker
- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3;
- (WKSelectPicker)initWithView:(id)a3;
- (id).cxx_construct;
- (id)actionForOptionIndex:(int64_t)a3;
- (id)actionForOptionItem:(const void *)a3 withIndex:(int64_t)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)controlView;
- (id)createMenu;
- (id)menuItemTitles;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)controlBeginEditing;
- (void)controlEndEditing;
- (void)controlUpdateEditing;
- (void)dealloc;
- (void)didSelectOptionIndex:(int64_t)a3;
- (void)resetContextMenuPresenter;
- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5;
- (void)showSelectPicker;
@end

@implementation WKSelectPicker

- (WKSelectPicker)initWithView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKSelectPicker;
  v4 = [(WKSelectPicker *)&v9 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    [objc_loadWeak((id *)&v5->_view) lastInteractionLocation];
    v5->_interactionPoint.x = v6;
    v5->_interactionPoint.y = v7;
  }
  return v5;
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  p_view = &self->_view;
  [objc_loadWeak((id *)&self->_view) focusedElementInformation];
  WebCore::IntRect::operator CGRect();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [objc_loadWeak((id *)p_view) bounds];
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v14;
  v21.size.height = v15;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (CGRectIntersectsRect(v20, v21))
  {
    [objc_loadWeak((id *)p_view) startRelinquishingFirstResponderToFocusedElement];
    id v16 = [(WKSelectPicker *)self createMenu];
    v17 = v16;
    if (v16) {
      CFRetain(v16);
    }
    m_ptr = self->_selectMenu.m_ptr;
    self->_selectMenu.m_ptr = v17;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [(WKSelectPicker *)self showSelectPicker];
  }
}

- (void)controlUpdateEditing
{
  if (self->_selectContextMenuPresenter.__ptr_.__value_)
  {
    id v3 = [(WKSelectPicker *)self createMenu];
    double v4 = v3;
    if (v3) {
      CFRetain(v3);
    }
    m_ptr = self->_selectMenu.m_ptr;
    self->_selectMenu.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    value = self->_selectContextMenuPresenter.__ptr_.__value_;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__WKSelectPicker_controlUpdateEditing__block_invoke;
    v7[3] = &unk_1E5813698;
    v7[4] = self;
    objc_msgSend((id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction"), "updateVisibleMenuWithBlock:", v7);
  }
}

uint64_t __38__WKSelectPicker_controlUpdateEditing__block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

- (void)controlEndEditing
{
  [objc_loadWeak((id *)&self->_view) stopRelinquishingFirstResponderToFocusedElement];

  [(WKSelectPicker *)self resetContextMenuPresenter];
}

- (void)dealloc
{
  [(WKSelectPicker *)self resetContextMenuPresenter];
  v3.receiver = self;
  v3.super_class = (Class)WKSelectPicker;
  [(WKSelectPicker *)&v3 dealloc];
}

- (void)didSelectOptionIndex:(int64_t)a3
{
  p_view = &self->_view;
  uint64_t v5 = [objc_loadWeak((id *)&self->_view) focusedSelectElementOptions];
  uint64_t v6 = *(unsigned int *)(v5 + 12);
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 16 * v6;
    CGFloat v9 = (BOOL *)(*(void *)v5 + 9);
    do
    {
      if (!*(v9 - 1)) {
        *CGFloat v9 = v7++ == a3;
      }
      v9 += 16;
      v8 -= 16;
    }
    while (v8);
  }
  id Weak = objc_loadWeak((id *)p_view);

  [Weak updateFocusedElementSelectedIndex:a3 allowsMultipleSelection:0];
}

- (id)createMenu
{
  v28[1] = *MEMORY[0x1E4F143B8];
  p_view = &self->_view;
  if (*(_DWORD *)([objc_loadWeak((id *)&self->_view) focusedSelectElementOptions] + 12))
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (*(_DWORD *)([objc_loadWeak((id *)p_view) focusedSelectElementOptions] + 12))
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [objc_loadWeak((id *)p_view) focusedSelectElementOptions];
        if (v7 >= *(unsigned int *)(v8 + 12)) {
          goto LABEL_33;
        }
        uint64_t v9 = *(void *)v8 + 16 * v7;
        if (*(unsigned char *)(v9 + 8))
        {
          int v10 = *(_DWORD *)(v9 + 12);
          if (*(void *)v9) {
            CGFloat v11 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            CGFloat v11 = &stru_1EEA10550;
          }
          CGFloat v12 = (void *)[MEMORY[0x1E4F1CA48] array];
          unint64_t v13 = v7 + 1;
          if (v7 + 1 < *(unsigned int *)([objc_loadWeak((id *)p_view) focusedSelectElementOptions] + 12))
          {
            uint64_t v14 = 16 * v7;
            while (1)
            {
              uint64_t v15 = [objc_loadWeak((id *)p_view) focusedSelectElementOptions];
              if (v13 >= *(unsigned int *)(v15 + 12)) {
                break;
              }
              uint64_t v16 = *(void *)v15 + v14;
              int v17 = *(unsigned __int8 *)(v16 + 24);
              int v18 = *(_DWORD *)(v16 + 28);
              if (v17) {
                BOOL v19 = 0;
              }
              else {
                BOOL v19 = v18 == v10;
              }
              if (v19)
              {
                v14 += 16;
                objc_msgSend(v12, "addObject:", -[WKSelectPicker actionForOptionItem:withIndex:](self, "actionForOptionItem:withIndex:", v14 + *(void *)v15, v6++));
                if (++v13 < *(unsigned int *)([objc_loadWeak((id *)p_view) focusedSelectElementOptions]
                                             + 12))
                  continue;
              }
              goto LABEL_17;
            }
LABEL_33:
            __break(0xC471u);
            JUMPOUT(0x198DD5800);
          }
LABEL_17:
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F42B80], "menuWithTitle:image:identifier:options:children:", v11, 0, 0, 65, v12));
        }
        else
        {
          objc_msgSend(v5, "addObject:", -[WKSelectPicker actionForOptionItem:withIndex:](self, "actionForOptionItem:withIndex:"));
          ++v6;
          unint64_t v13 = v7 + 1;
        }
        unint64_t v7 = v13;
      }
      while (v13 < *(unsigned int *)([objc_loadWeak((id *)p_view) focusedSelectElementOptions] + 12));
    }
    CGRect v20 = (void *)MEMORY[0x1E4F42B80];
    return (id)[v20 menuWithTitle:&stru_1EEA10550 image:0 identifier:0 options:96 children:v5];
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F426E8];
    WebCore::localizedString((uint64_t *)&v27, (WebCore *)@"No Options Select Popover", v4);
    if (v27) {
      v23 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v23 = &stru_1EEA10550;
    }
    v25 = (void *)[v22 actionWithTitle:v23 image:0 identifier:0 handler:&__block_literal_global_30];
    v26 = v27;
    v27 = 0;
    if (v26)
    {
      if (*(_DWORD *)v26 == 2) {
        WTF::StringImpl::destroy(v26, v24);
      }
      else {
        *(_DWORD *)v26 -= 2;
      }
    }
    [v25 setAttributes:1];
    v28[0] = v25;
    return (id)objc_msgSend(MEMORY[0x1E4F42B80], "menuWithTitle:children:", &stru_1EEA10550, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 1));
  }
}

- (id)actionForOptionItem:(const void *)a3 withIndex:(int64_t)a4
{
  unint64_t v7 = (void *)MEMORY[0x1E4F426E8];
  if (*(void *)a3) {
    uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v8 = &stru_1EEA10550;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__WKSelectPicker_actionForOptionItem_withIndex___block_invoke;
  v12[3] = &unk_1E5813838;
  v12[4] = self;
  v12[5] = a4;
  uint64_t v9 = (void *)[v7 actionWithTitle:v8 image:0 identifier:0 handler:v12];
  int v10 = v9;
  if (*((unsigned char *)a3 + 10)) {
    [v9 setAttributes:1];
  }
  if (*((unsigned char *)a3 + 9)) {
    [v10 setState:1];
  }
  return v10;
}

uint64_t __48__WKSelectPicker_actionForOptionItem_withIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didSelectOptionIndex:*(void *)(a1 + 40)];
}

- (id)actionForOptionIndex:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = (void *)[self->_selectMenu.m_ptr children];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v7 == a3) {
            return v10;
          }
          ++v7;
        }
        else
        {
          v7 += objc_msgSend((id)objc_msgSend(v10, "children"), "count");
          if (a3 < v7) {
            return (id)objc_msgSend((id)objc_msgSend(v10, "children"), "objectAtIndex:", a3 - v7 + objc_msgSend((id)objc_msgSend(v10, "children"), "count"));
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id Weak = objc_loadWeak((id *)&self->_view);

  return (id)[Weak _createTargetedContextMenuHintPreviewForFocusedElement:0];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __72__WKSelectPicker_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c85_ZTSKZ72__WKSelectPicker_contextMenuInteraction_configurationForMenuAtLocation__E3__0_e25___UIMenu_16__0__NSArray_8l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_destroyWeak(&v6);
  CFStringRef v4 = (void *)[MEMORY[0x1E4F428F0] configurationWithIdentifier:0 previewProvider:0 actionProvider:v7];
  objc_destroyWeak(&v8);
  return v4;
}

uint64_t __72__WKSelectPicker_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return 0;
  }
  uint64_t v2 = WeakRetained[4];
  CFRelease(WeakRetained);
  return v2;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __82__WKSelectPicker_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c95_ZTSKZ82__WKSelectPicker_contextMenuInteraction_willDisplayMenuForConfiguration_animator__E3__1_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a5 addCompletion:v7];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __82__WKSelectPicker_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    objc_msgSend((id)objc_msgSend(objc_loadWeak(WeakRetained + 1), "webView"), "_didShowContextMenu");
    CFRelease(v2);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  self->_isAnimatingContextMenuDismissal = 1;
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __74__WKSelectPicker_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c87_ZTSKZ74__WKSelectPicker_contextMenuInteraction_willEndForConfiguration_animator__E3__2_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a5 addCompletion:v7];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __74__WKSelectPicker_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    objc_super v3 = (id *)(WeakRetained + 8);
    [objc_loadWeak((id *)WeakRetained + 1) accessoryDone];
    objc_msgSend((id)objc_msgSend(objc_loadWeak(v3), "webView"), "_didDismissContextMenu");
    v2[48] = 0;
    CFRelease(v2);
  }
}

- (void)resetContextMenuPresenter
{
  value = self->_selectContextMenuPresenter.__ptr_.__value_;
  p_selectContextMenuPresenter = (id **)&self->_selectContextMenuPresenter;
  if (value)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_selectContextMenuPresenter, 0);
    [objc_loadWeak((id *)&self->_view) _removeContextMenuHintContainerIfPossible];
    if (!self->_isAnimatingContextMenuDismissal)
    {
      uint64_t v5 = (void *)[objc_loadWeak((id *)&self->_view) webView];
      [v5 _didDismissContextMenu];
    }
  }
}

- (void)showSelectPicker
{
  p_selectContextMenuPresenter = (id **)&self->_selectContextMenuPresenter;
  value = (id *)self->_selectContextMenuPresenter.__ptr_.__value_;
  if (!value)
  {
    uint64_t v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    id Weak = objc_loadWeak((id *)&self->_view);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, Weak, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_selectContextMenuPresenter, v5);
    value = *p_selectContextMenuPresenter;
  }
  CGFloat x = self->_interactionPoint.x;
  CGFloat y = self->_interactionPoint.y;
  uint64_t v9 = *MEMORY[0x1E4F1DB30];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1DB30] + 8);

  WebKit::CompactContextMenuPresenter::present(value, *(CGRect *)&x);
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  id v6 = -[WKSelectPicker actionForOptionIndex:](self, "actionForOptionIndex:", a3, a4, a5);
  if (v6)
  {
    [v6 performWithSender:0 target:0];
    id Weak = objc_loadWeak((id *)&self->_view);
    [Weak accessoryDone];
  }
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  id v3 = [(WKSelectPicker *)self actionForOptionIndex:a3];
  if (v3) {
    LOBYTE(v3) = [v3 state] == 1;
  }
  return (char)v3;
}

- (id)menuItemTitles
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFStringRef v4 = (void *)[self->_selectMenu.m_ptr children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "title"));
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v9)
            {
              long long v18 = 0u;
              long long v19 = 0u;
              long long v16 = 0u;
              long long v17 = 0u;
              uint64_t v10 = objc_msgSend(v9, "children", 0);
              uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v17;
                do
                {
                  uint64_t v14 = 0;
                  do
                  {
                    if (*(void *)v17 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14++), "title"));
                  }
                  while (v12 != v14);
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
                }
                while (v12);
              }
            }
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void).cxx_destruct
{
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_selectContextMenuPresenter, 0);
  m_ptr = self->_selectMenu.m_ptr;
  self->_selectMenu.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }

  objc_destroyWeak((id *)&self->_view);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end