@interface WKSelectPickerTableViewController
- (WKSelectPickerTableViewController)initWithView:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id).cxx_construct;
- (id)groupHeaderFont;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)findItemIndexAt:(id)a3;
- (int64_t)numberOfRowsInGroup:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)close:(id)a3;
- (void)didTapSelectPickerGroupHeaderView:(id)a3;
- (void)next:(id)a3;
- (void)optionItemAtIndexPath:(id)a3;
- (void)previous:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WKSelectPickerTableViewController

- (WKSelectPickerTableViewController)initWithView:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)WKSelectPickerTableViewController;
  v4 = [(WKSelectPickerTableViewController *)&v22 initWithStyle:1];
  v5 = v4;
  if (v4)
  {
    objc_msgSend((id)-[WKSelectPickerTableViewController tableView](v4, "tableView"), "_setSectionContentInsetFollowsLayoutMargins:", 1);
    objc_storeWeak((id *)&v5->_contentView, a3);
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    uint64_t v7 = objc_msgSend(v6, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.up"), 0, v5, sel_previous_);
    m_ptr = v5->_previousButton.m_ptr;
    v5->_previousButton.m_ptr = (void *)v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:6 target:0 action:0];
    [v9 setWidth:6.0];
    id v10 = objc_alloc(MEMORY[0x1E4F427C0]);
    uint64_t v11 = objc_msgSend(v10, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.down"), 0, v5, sel_next_);
    v12 = v5->_nextButton.m_ptr;
    v5->_nextButton.m_ptr = (void *)v11;
    if (v12)
    {
      CFRelease(v12);
      uint64_t v11 = (uint64_t)v5->_nextButton.m_ptr;
    }
    v23[0] = v5->_previousButton.m_ptr;
    v23[1] = v9;
    v23[2] = v11;
    objc_msgSend((id)-[WKSelectPickerTableViewController navigationItem](v5, "navigationItem"), "setLeftBarButtonItems:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 3));
    v13 = (const void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:24 target:v5 action:sel_close_];
    objc_msgSend((id)-[WKSelectPickerTableViewController navigationItem](v5, "navigationItem"), "setRightBarButtonItem:", v13);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v15 = v5->_collapsedSections.m_ptr;
    v5->_collapsedSections.m_ptr = v14;
    if (v15) {
      CFRelease(v15);
    }
    v5->_numberOfSections = 1;
    uint64_t v16 = [objc_loadWeak((id *)&v5->_contentView) focusedSelectElementOptions];
    uint64_t v17 = *(unsigned int *)(v16 + 12);
    if (v17)
    {
      uint64_t v18 = 16 * v17;
      v19 = (unsigned __int8 *)(*(void *)v16 + 8);
      do
      {
        int v20 = *v19;
        v19 += 16;
        if (v20) {
          ++v5->_numberOfSections;
        }
        v18 -= 16;
      }
      while (v18);
    }
    if (v13) {
      CFRelease(v13);
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return v5;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)WKSelectPickerTableViewController;
  [(WKSelectPickerTableViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKSelectPickerTableViewController;
  [(WKSelectPickerTableViewController *)&v4 viewWillAppear:a3];
  objc_msgSend(self->_previousButton.m_ptr, "setEnabled:", *(unsigned __int8 *)(objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedElementInformation") + 156));
  objc_msgSend(self->_nextButton.m_ptr, "setEnabled:", *(unsigned __int8 *)(objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedElementInformation") + 136));
}

- (int64_t)numberOfRowsInGroup:(int64_t)a3
{
  uint64_t v4 = [objc_loadWeak((id *)&self->_contentView) focusedSelectElementOptions];
  uint64_t v5 = *(unsigned int *)(v4 + 12);
  if (!v5) {
    return 0;
  }
  id v6 = (uint64_t *)v4;
  int64_t result = 0;
  uint64_t v8 = *v6;
  uint64_t v9 = 16 * v5;
  id v10 = (int *)(v8 + 12);
  do
  {
    if (!*((unsigned char *)v10 - 4))
    {
      int64_t v11 = *v10;
      if (v11 == a3) {
        ++result;
      }
      if (v11 > a3) {
        break;
      }
    }
    v10 += 4;
    v9 -= 16;
  }
  while (v9);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_numberOfSections;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!*(_DWORD *)([objc_loadWeak((id *)&self->_contentView) focusedSelectElementOptions] + 12)) {
    return 1;
  }
  if (objc_msgSend(self->_collapsedSections.m_ptr, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", a4)))return 0; {

  }
  return [(WKSelectPickerTableViewController *)self numberOfRowsInGroup:a4];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4
    && [-[WKSelectPickerTableViewController tableView:titleForHeaderInSection:](self tableView:a3) titleForHeaderInSection:"length"])
  {
    +[WKSelectPickerGroupHeaderView preferredHeight];
  }
  else
  {
    [a3 layoutMargins];
    return v6;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if (!a4
    && ![(WKSelectPickerTableViewController *)self numberOfRowsInGroup:0]
    && self->_numberOfSections > 1)
  {
    return 2.22507386e-308;
  }
  [a3 layoutMargins];
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v5 = [objc_loadWeak((id *)&self->_contentView) focusedSelectElementOptions];
  uint64_t v6 = *(unsigned int *)(v5 + 12);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (unsigned char *)(*(void *)v5 + 8);
  uint64_t v9 = 16 * v6;
  while (1)
  {
    if (*v8)
    {
      if (++v7 == a4) {
        break;
      }
    }
    v8 += 16;
    v9 -= 16;
    if (!v9) {
      return 0;
    }
  }
  if (!*((void *)v8 - 1)) {
    return &stru_1EEA10550;
  }

  return (id)WTF::StringImpl::operator NSString *();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (!a4) {
    return 0;
  }
  id v6 = -[WKSelectPickerTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3);
  if (![v6 length]) {
    return 0;
  }
  uint64_t v7 = [[WKSelectPickerGroupHeaderView alloc] initWithGroupName:v6 section:a4 isCollapsible:[(WKSelectPickerTableViewController *)self numberOfRowsInGroup:a4] > 0];
  -[WKSelectPickerGroupHeaderView setCollapsed:animated:](v7, "setCollapsed:animated:", objc_msgSend(self->_collapsedSections.m_ptr, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", a4)), 0);
  [(WKSelectPickerGroupHeaderView *)v7 setTableViewController:self];
  uint64_t v8 = (void *)CFMakeCollectable(v7);

  return v8;
}

- (void)didTapSelectPickerGroupHeaderView:(id)a3
{
  if ([a3 isCollapsible])
  {
    uint64_t v5 = [a3 section];
    uint64_t v6 = [(WKSelectPickerTableViewController *)self numberOfRowsInGroup:v5];
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    if (v6 >= 1)
    {
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", i, v5));
    }
    uint64_t v9 = [NSNumber numberWithInteger:v5];
    char v10 = [self->_collapsedSections.m_ptr containsObject:v9];
    m_ptr = self->_collapsedSections.m_ptr;
    if (v10)
    {
      [m_ptr removeObject:v9];
      v12 = (void *)[(WKSelectPickerTableViewController *)self tableView];
      [v12 insertRowsAtIndexPaths:v7 withRowAnimation:0];
    }
    else
    {
      [m_ptr addObject:v9];
      v13 = (void *)[(WKSelectPickerTableViewController *)self tableView];
      [v13 deleteRowsAtIndexPaths:v7 withRowAnimation:0];
    }
  }
}

- (int64_t)findItemIndexAt:(id)a3
{
  uint64_t v4 = [objc_loadWeak((id *)&self->_contentView) focusedSelectElementOptions];
  uint64_t v5 = *(unsigned int *)(v4 + 12);
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v6 = 0;
  int v7 = 0;
  uint64_t v8 = 16 * v5;
  for (uint64_t i = (int *)(*(void *)v4 + 12); *((unsigned char *)i - 4); i += 4)
  {
    int v7 = 0;
LABEL_8:
    v8 -= 16;
    if (!v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v10 = *i;
  if ([a3 section] != v10 || objc_msgSend(a3, "row") != v7)
  {
    ++v6;
    ++v7;
    goto LABEL_8;
  }
  return v6;
}

- (void)optionItemAtIndexPath:(id)a3
{
  uint64_t v4 = [objc_loadWeak((id *)&self->_contentView) focusedSelectElementOptions];
  uint64_t v5 = *(unsigned int *)(v4 + 12);
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v4;
    uint64_t v8 = 16 * v5;
    do
    {
      if (!*(unsigned char *)(v7 + 8))
      {
        uint64_t v9 = *(int *)(v7 + 12);
        if ([a3 section] == v9)
        {
          if (v6 == [a3 row]) {
            return (void *)v7;
          }
          ++v6;
        }
      }
      v7 += 16;
      v8 -= 16;
    }
    while (v8);
  }
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = (void *)[a3 dequeueReusableCellWithIdentifier:@"WKSelectPickerTableViewCell"];
  if (v6)
  {
    uint64_t v7 = v6;
    CFRetain(v6);
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"WKSelectPickerTableViewCell"];
  }
  if (*(_DWORD *)([objc_loadWeak((id *)&self->_contentView) focusedSelectElementOptions] + 12))
  {
    uint64_t v8 = [(WKSelectPickerTableViewController *)self optionItemAtIndexPath:a4];
    if (v8)
    {
      if (*(void *)v8) {
        uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v9 = &stru_1EEA10550;
      }
      objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v9);
      objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setEnabled:", v8[10] == 0);
      [v7 setUserInteractionEnabled:v8[10] == 0];
      objc_msgSend((id)objc_msgSend(v7, "imageView"), "setPreferredSymbolConfiguration:", objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithTextStyle:scale:", *MEMORY[0x1E4F43870], 3));
      if (v8[9])
      {
        uint64_t v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle.fill"];
        int64_t v11 = (void *)[v7 imageView];
      }
      else
      {
        if (v8[10])
        {
          uint64_t v16 = (void *)[MEMORY[0x1E4F42A80] systemImageNamed:@"circle"];
          uint64_t v10 = objc_msgSend(v16, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x1E4F428B8], "quaternaryLabelColor"), 1);
        }
        else
        {
          uint64_t v18 = (void *)[MEMORY[0x1E4F42A80] systemImageNamed:@"circle"];
          uint64_t v10 = objc_msgSend(v18, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x1E4F428B8], "tertiaryLabelColor"), 1);
        }
        int64_t v11 = (void *)[v7 imageView];
      }
      [v11 setImage:v10];
    }
    return (id)(id)CFMakeCollectable(v7);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setEnabled:", 0);
    WebCore::localizedString((uint64_t *)&v19, (WebCore *)@"No Options Select Popover", v12);
    if (v19) {
      v13 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v13 = &stru_1EEA10550;
    }
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v13);
    v15 = v19;
    v19 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v14);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    [v7 setUserInteractionEnabled:0];
    objc_msgSend((id)objc_msgSend(v7, "imageView"), "setImage:", 0);
    return (id)(id)CFMakeCollectable(v7);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", objc_msgSend(a3, "indexPathForSelectedRow"), 0);
  uint64_t v7 = (void *)[a3 cellForRowAtIndexPath:a4];
  if (objc_msgSend((id)objc_msgSend(v7, "textLabel"), "isEnabled"))
  {
    uint64_t v8 = [(WKSelectPickerTableViewController *)self optionItemAtIndexPath:a4];
    if (v8)
    {
      uint64_t v9 = v8;
      if (v8[9])
      {
        uint64_t v10 = (void *)[MEMORY[0x1E4F42A80] systemImageNamed:@"circle"];
        uint64_t v11 = objc_msgSend(v10, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x1E4F428B8], "tertiaryLabelColor"), 1);
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle.fill"];
      }
      objc_msgSend((id)objc_msgSend(v7, "imageView"), "setImage:", v11);
      objc_msgSend(objc_loadWeak((id *)&self->_contentView), "updateFocusedElementSelectedIndex:allowsMultipleSelection:", -[WKSelectPickerTableViewController findItemIndexAt:](self, "findItemIndexAt:", a4), 1);
      v9[9] ^= 1u;
    }
  }
}

- (id)groupHeaderFont
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)[MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F8]];
  uint64_t v7 = *MEMORY[0x1E4F43848];
  uint64_t v5 = *MEMORY[0x1E4F43940];
  uint64_t v6 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43930]];
  v8[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v3 = objc_msgSend(v2, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  return (id)[MEMORY[0x1E4F42A30] fontWithDescriptor:v3 size:0.0];
}

- (void)next:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __42__WKSelectPickerTableViewController_next___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c55_ZTSKZ42__WKSelectPickerTableViewController_next__E3__4_e5_v8__0l;
  id Weak = objc_loadWeak((id *)&self->_contentView);
  id v5 = 0;
  objc_initWeak(&v5, Weak);
  id v7 = 0;
  objc_copyWeak(&v7, &v5);
  [(WKSelectPickerTableViewController *)self dismissViewControllerAnimated:1 completion:v6];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __42__WKSelectPickerTableViewController_next___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v2 = WeakRetained;
    [WeakRetained accessoryTab:1];
    CFRelease(v2);
  }
}

- (void)previous:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __46__WKSelectPickerTableViewController_previous___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c59_ZTSKZ46__WKSelectPickerTableViewController_previous__E3__5_e5_v8__0l;
  id Weak = objc_loadWeak((id *)&self->_contentView);
  id v5 = 0;
  objc_initWeak(&v5, Weak);
  id v7 = 0;
  objc_copyWeak(&v7, &v5);
  [(WKSelectPickerTableViewController *)self dismissViewControllerAnimated:1 completion:v6];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __46__WKSelectPickerTableViewController_previous___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v2 = WeakRetained;
    [WeakRetained accessoryTab:0];
    CFRelease(v2);
  }
}

- (void)close:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __43__WKSelectPickerTableViewController_close___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c56_ZTSKZ43__WKSelectPickerTableViewController_close__E3__6_e5_v8__0l;
  id Weak = objc_loadWeak((id *)&self->_contentView);
  id v5 = 0;
  objc_initWeak(&v5, Weak);
  id v7 = 0;
  objc_copyWeak(&v7, &v5);
  [(WKSelectPickerTableViewController *)self dismissViewControllerAnimated:1 completion:v6];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __43__WKSelectPickerTableViewController_close___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v2 = WeakRetained;
    [WeakRetained accessoryDone];
    CFRelease(v2);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_nextButton.m_ptr;
  self->_nextButton.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_previousButton.m_ptr;
  self->_previousButton.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  id v5 = self->_collapsedSections.m_ptr;
  self->_collapsedSections.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }

  objc_destroyWeak((id *)&self->_contentView);
}

- (id).cxx_construct
{
  *((void *)self + 130) = 0;
  *((void *)self + 131) = 0;
  *((void *)self + 132) = 0;
  return self;
}

@end