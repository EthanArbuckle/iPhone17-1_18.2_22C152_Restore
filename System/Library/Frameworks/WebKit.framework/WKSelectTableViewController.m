@interface WKSelectTableViewController
- (BOOL)shouldDismissWithAnimation;
- (WKSelectPopover)popover;
- (WKSelectTableViewController)initWithView:(id)a3 hasGroups:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)findItemIndexAt:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)findItemAt:(id)a3;
- (void)populateCell:(id)a3 withItem:(const void *)a4;
- (void)setPopover:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WKSelectTableViewController

- (WKSelectTableViewController)initWithView:(id)a3 hasGroups:(BOOL)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WKSelectTableViewController;
  v5 = -[WKSelectTableViewController initWithStyle:](&v16, sel_initWithStyle_, 0, a4);
  v6 = v5;
  if (v5)
  {
    v5->_contentView = (WKContentView *)a3;
    uint64_t v7 = [a3 focusedSelectElementOptions];
    int v8 = *(unsigned __int8 *)([(WKContentView *)v6->_contentView focusedElementInformation]
                            + 178);
    v6->_allowsMultipleSelection = v8;
    v6->_numberOfSections = 1;
    v6->_singleSelectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = *(unsigned int *)(v7 + 12);
    if (v9)
    {
      unint64_t v10 = 0;
      v11 = (int *)(*(void *)v7 + 12);
      do
      {
        if (*((unsigned char *)v11 - 4))
        {
          unint64_t v10 = 0;
          ++v6->_numberOfSections;
        }
        else
        {
          if (!v8 && *((unsigned char *)v11 - 3))
          {
            v6->_singleSelectionIndex = v10;
            v6->_singleSelectionSection = *v11;
          }
          ++v10;
        }
        v11 += 4;
        --v9;
      }
      while (v9);
    }
    uint64_t v12 = *(unsigned __int8 *)([(WKContentView *)v6->_contentView focusedElementInformation]
                             + 177);
    v6->_textAlignment = 2 * v12;
    if (v12) {
      objc_msgSend((id)-[WKSelectTableViewController view](v6, "view"), "setSemanticContentAttribute:", 4);
    }
    if (*(void *)([(WKContentView *)v6->_contentView focusedElementInformation] + 240)) {
      v13 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v13 = &stru_1EEA10550;
    }
    if ([(__CFString *)v13 length]
      && MEMORY[0x1997423A0]([(__CFString *)v13 characterAtIndex:0]) != v12)
    {
      uint64_t v14 = 8234;
      if (v12) {
        uint64_t v14 = 8235;
      }
      v13 = (__CFString *)[NSString stringWithFormat:@"%C%@%C", v14, v13, 8236];
    }
    [(WKSelectTableViewController *)v6 setTitle:v13];
  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKSelectTableViewController;
  [(WKSelectTableViewController *)&v6 viewWillAppear:a3];
  if (self->_singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t singleSelectionSection = self->_singleSelectionSection;
    if (singleSelectionSection < objc_msgSend((id)-[WKSelectTableViewController tableView](self, "tableView"), "numberOfSections"))
    {
      unint64_t singleSelectionIndex = self->_singleSelectionIndex;
      if (singleSelectionIndex < objc_msgSend((id)-[WKSelectTableViewController tableView](self, "tableView"), "numberOfRowsInSection:", self->_singleSelectionSection))objc_msgSend((id)-[WKSelectTableViewController tableView](self, "tableView"), "scrollToRowAtIndexPath:atScrollPosition:animated:", objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", self->_singleSelectionIndex, self->_singleSelectionSection), 2, 0); {
    }
      }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_numberOfSections;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!*(_DWORD *)([(WKContentView *)self->_contentView focusedSelectElementOptions]
                  + 12))
    return 1;
  if (*(_DWORD *)([(WKContentView *)self->_contentView focusedSelectElementOptions] + 12))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 0;
    while (1)
    {
      int64_t result = [(WKContentView *)self->_contentView focusedSelectElementOptions];
      if (v7 >= *(unsigned int *)(result + 12)) {
        break;
      }
      uint64_t v10 = *(void *)result + v6;
      if (*(unsigned char *)(v10 + 8)) {
        goto LABEL_17;
      }
      int64_t v11 = *(int *)(v10 + 12);
      if (v11 == a4) {
        ++v8;
      }
      if (v11 <= a4)
      {
LABEL_17:
        ++v7;
        v6 += 16;
        if (v7 < *(unsigned int *)([(WKContentView *)self->_contentView focusedSelectElementOptions]+ 12))continue; {
      }
        }
      return v8;
    }
    __break(0xC471u);
  }
  else
  {
    return 0;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (!a4
    || !*(_DWORD *)([(WKContentView *)self->_contentView focusedSelectElementOptions]
                  + 12))
  {
    return 0;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  int v8 = 0;
  while (1)
  {
    id result = [(WKContentView *)self->_contentView focusedSelectElementOptions];
    if (v7 >= *((unsigned int *)result + 3))
    {
      __break(0xC471u);
      return result;
    }
    if (*(unsigned char *)(*(void *)result + v6 + 8))
    {
      if (++v8 == a4) {
        break;
      }
    }
    ++v7;
    v6 += 16;
    if (v7 >= *(unsigned int *)([(WKContentView *)self->_contentView focusedSelectElementOptions]+ 12))return 0; {
  }
    }
  if (!*(void *)(*(void *)result + v6)) {
    return &stru_1EEA10550;
  }

  return (id)WTF::StringImpl::operator NSString *();
}

- (void)populateCell:(id)a3 withItem:(const void *)a4
{
  uint64_t v6 = (void *)[a3 textLabel];
  if (*(void *)a4) {
    unint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    unint64_t v7 = &stru_1EEA10550;
  }
  [v6 setText:v7];
  objc_msgSend((id)objc_msgSend(a3, "textLabel"), "setEnabled:", *((unsigned char *)a4 + 10) == 0);
  [a3 setSelectionStyle:*((unsigned char *)a4 + 10) == 0];
  if (*((unsigned char *)a4 + 9)) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }

  [a3 setAccessoryType:v8];
}

- (int64_t)findItemIndexAt:(id)a3
{
  if (!*(_DWORD *)([(WKContentView *)self->_contentView focusedSelectElementOptions] + 12)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  while (1)
  {
    int64_t result = [(WKContentView *)self->_contentView focusedSelectElementOptions];
    if (v6 >= *(unsigned int *)(result + 12)) {
      break;
    }
    uint64_t v10 = *(void *)result + v5;
    if (*(unsigned char *)(v10 + 8))
    {
      int v7 = 0;
    }
    else
    {
      uint64_t v11 = *(int *)(v10 + 12);
      if ([a3 section] == v11 && objc_msgSend(a3, "row") == v7) {
        return v8;
      }
      ++v8;
      ++v7;
    }
    ++v6;
    v5 += 16;
    if (v6 >= *(unsigned int *)([(WKContentView *)self->_contentView focusedSelectElementOptions]+ 12))return 0x7FFFFFFFFFFFFFFFLL; {
  }
    }
  __break(0xC471u);
  return result;
}

- (void)findItemAt:(id)a3
{
  if (!*(_DWORD *)([(WKContentView *)self->_contentView focusedSelectElementOptions] + 12)) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  int v7 = 0;
  while (1)
  {
    int64_t result = [(WKContentView *)self->_contentView focusedSelectElementOptions];
    if (v6 >= *((unsigned int *)result + 3)) {
      break;
    }
    uint64_t v9 = *(void *)result;
    uint64_t v10 = *(void *)result + v5;
    if (!*(unsigned char *)(v10 + 8))
    {
      uint64_t v11 = *(int *)(v10 + 12);
      if ([a3 section] == v11)
      {
        if ([a3 row] == v7) {
          return (void *)(v9 + v5);
        }
        ++v7;
      }
    }
    ++v6;
    v5 += 16;
    if (v6 >= *(unsigned int *)([(WKContentView *)self->_contentView focusedSelectElementOptions]+ 12))return 0; {
  }
    }
  __break(0xC471u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  unint64_t v6 = (void *)[a3 dequeueReusableCellWithIdentifier:@"WKPopoverTableViewCellReuseIdentifier"];
  if (v6)
  {
    int v7 = v6;
    CFRetain(v6);
  }
  else
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"WKPopoverTableViewCellReuseIdentifier"];
  }
  objc_msgSend(v7, "setSemanticContentAttribute:", objc_msgSend((id)-[WKSelectTableViewController view](self, "view"), "semanticContentAttribute"));
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setTextAlignment:", self->_textAlignment);
  if (*(_DWORD *)([(WKContentView *)self->_contentView focusedElementInformation] + 212))
  {
    [v7 bounds];
    objc_msgSend(v7, "contentRectForBounds:");
    objc_msgSend(v7, "textRectForContentRect:");
    double v9 = v8;
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v7, "textLabel"), "font");
    [v10 pointSize];
    if (v9 != self->_maximumTextWidth || self->_fontSize == 0.0)
    {
      self->_maximumTextWidth = v9;
      self->_fontSize = adjustedFontSize((uint64_t)v10, (uint64_t)([(WKContentView *)self->_contentView focusedElementInformation]+ 200), v9, v11);
    }
    [(WKSelectTableViewController *)self populateCell:v7 withItem:[(WKSelectTableViewController *)self findItemAt:a4]];
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setFont:", objc_msgSend(v10, "fontWithSize:", self->_fontSize));
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setLineBreakMode:", 0);
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setNumberOfLines:", 2);
    return (id)(id)CFMakeCollectable(v7);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setEnabled:", 0);
    WebCore::localizedString((uint64_t *)&v17, (WebCore *)@"No Options Select Popover", v13);
    if (v17) {
      uint64_t v14 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v14 = &stru_1EEA10550;
    }
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v14);
    objc_super v16 = v17;
    v17 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v15);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    [v7 setAccessoryType:0];
    [v7 setSelectionStyle:0];
    return (id)(id)CFMakeCollectable(v7);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (!*(_DWORD *)([(WKContentView *)self->_contentView focusedElementInformation] + 212)) {
    return;
  }
  unint64_t v7 = [(WKSelectTableViewController *)self findItemIndexAt:a4];
  if (!self->_allowsMultipleSelection)
  {
    [a3 deselectRowAtIndexPath:a4 animated:0];
    unint64_t singleSelectionIndex = self->_singleSelectionIndex;
    if (singleSelectionIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForRow:singleSelectionIndex inSection:self->_singleSelectionSection];
      if ([a4 isEqual:v13])
      {
LABEL_24:
        popover = self->_popover;
        [(WKSelectPopover *)popover _userActionDismissedPopover:0];
        return;
      }
    }
    uint64_t v14 = (void *)[a3 cellForRowAtIndexPath:a4];
    if (!objc_msgSend((id)objc_msgSend(v14, "textLabel"), "isEnabled")) {
      return;
    }
    if (v13)
    {
      v15 = (void *)[a3 cellForRowAtIndexPath:v13];
      if (v15)
      {
        objc_super v16 = v15;
        if ([v15 accessoryType] == 3) {
          [v16 setAccessoryType:0];
        }
      }
    }
    if (v14 && ![v14 accessoryType])
    {
      [v14 setAccessoryType:3];
      self->_unint64_t singleSelectionIndex = [a4 row];
      self->_unint64_t singleSelectionSection = [a4 section];
      [(WKContentView *)self->_contentView updateFocusedElementSelectedIndex:v7 allowsMultipleSelection:0];
      v17 = [(WKContentView *)self->_contentView focusedSelectElementOptions];
      if (v7 >= v17[3]) {
        goto LABEL_28;
      }
      *(unsigned char *)(*(void *)v17 + 16 * v7 + 9) = 1;
    }
    if (v13)
    {
      v18 = [(WKSelectTableViewController *)self findItemAt:v13];
      if (v18) {
        v18[9] = 0;
      }
    }
    goto LABEL_24;
  }
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", objc_msgSend(a3, "indexPathForSelectedRow"), 0);
  double v8 = (void *)[a3 cellForRowAtIndexPath:a4];
  if (objc_msgSend((id)objc_msgSend(v8, "textLabel"), "isEnabled"))
  {
    uint64_t v9 = [v8 accessoryType];
    if (v9) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 3;
    }
    [v8 setAccessoryType:v10];
    [(WKContentView *)self->_contentView updateFocusedElementSelectedIndex:v7 allowsMultipleSelection:1];
    double v11 = [(WKContentView *)self->_contentView focusedSelectElementOptions];
    if (v7 < v11[3])
    {
      *(unsigned char *)(*(void *)v11 + 16 * v7 + 9) = v9 == 0;
      return;
    }
LABEL_28:
    __break(0xC471u);
    JUMPOUT(0x198DD8FE8);
  }
}

- (BOOL)shouldDismissWithAnimation
{
  return [(WKContentView *)self->_contentView _shouldUseLegacySelectPopoverDismissalBehavior];
}

- (WKSelectPopover)popover
{
  return self->_popover;
}

- (void)setPopover:(id)a3
{
  self->_popover = (WKSelectPopover *)a3;
}

@end