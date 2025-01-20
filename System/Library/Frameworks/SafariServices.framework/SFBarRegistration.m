@interface SFBarRegistration
- (BOOL)_arrangedBarItemsNeedUpdate;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)containsBarItem:(int64_t)a3;
- (SFBarRegistration)initWithBar:(id)a3 barManager:(id)a4 layout:(int64_t)a5 persona:(int64_t)a6;
- (id)_UIBarButtonItemForBarItem:(int64_t)a3;
- (id)_UIBarButtonItemsForArrangedBarItems:(id)a3;
- (id)_effectiveArrangedBarItems;
- (id)_newBarButtonItemForSFBarItem:(int64_t)a3;
- (id)popoverSourceInfoForItem:(int64_t)a3;
- (int64_t)_barItemForUIBarButtonItem:(id)a3;
- (void)_itemReceivedLongPress:(id)a3;
- (void)_itemReceivedTap:(id)a3;
- (void)_itemReceivedTouchDown:(id)a3;
- (void)_updateTitlesAndMenus;
- (void)pulseBarItem:(int64_t)a3;
- (void)pulseDownloadsItem;
- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 menu:(id)a4;
- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4;
- (void)setCustomActivityImage:(id)a3 accessibilityLabel:(id)a4;
- (void)setDownloadsItemProgress:(double)a3;
- (void)setImage:(id)a3 forBarItem:(int64_t)a4;
- (void)setProgress:(double)a3 forBarItem:(int64_t)a4;
- (void)updateArrangedUIBarButtonItemsIfNeeded;
@end

@implementation SFBarRegistration

- (SFBarRegistration)initWithBar:(id)a3 barManager:(id)a4 layout:(int64_t)a5 persona:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v53.receiver = self;
  v53.super_class = (Class)SFBarRegistration;
  v12 = [(SFBarRegistration *)&v53 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_bar, v10);
    objc_storeWeak((id *)&v13->_barManager, v11);
    switch(a6)
    {
      case 0:
        if ((unint64_t)a5 >= 3) {
          goto LABEL_10;
        }
        v14 = &unk_1E5C73BB8;
        goto LABEL_9;
      case 1:
      case 3:
        if ((unint64_t)a5 >= 3) {
          goto LABEL_10;
        }
        v14 = &unk_1E5C73BD0;
        goto LABEL_9;
      case 2:
        if ((unint64_t)a5 > 2) {
          goto LABEL_10;
        }
        v14 = &unk_1E5C73BE8;
LABEL_9:
        uint64_t v15 = v14[a5];
        break;
      default:
LABEL_10:
        uint64_t v15 = MEMORY[0x1E4F1CBF0];
        break;
    }
    uint64_t v16 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v15];
    arrangedBarItems = v13->_arrangedBarItems;
    v13->_arrangedBarItems = (NSOrderedSet *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hiddenBarItems = v13->_hiddenBarItems;
    v13->_hiddenBarItems = v18;

    v13->_layout = a5;
    if (a5 == 2) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = 3;
    }
    [v10 _setItemDistribution:v20];
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEAA0])
    {
      uint64_t v21 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:0];
      backItem = v13->_backItem;
      v13->_backItem = (UIBarButtonItem *)v21;

      v23 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_backItem setAccessibilityIdentifier:v23];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEAB8])
    {
      uint64_t v24 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:1];
      forwardItem = v13->_forwardItem;
      v13->_forwardItem = (UIBarButtonItem *)v24;

      v26 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_forwardItem setAccessibilityIdentifier:v26];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEAD0])
    {
      uint64_t v27 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:3];
      bookmarksItem = v13->_bookmarksItem;
      v13->_bookmarksItem = (UIBarButtonItem *)v27;

      v29 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_bookmarksItem setAccessibilityIdentifier:v29];

      _SFRoundEdgeInsetsToPixels();
      -[UIBarButtonItem _setAdditionalSelectionInsets:](v13->_bookmarksItem, "_setAdditionalSelectionInsets:");
      [(UIBarButtonItem *)v13->_bookmarksItem _sf_setTarget:v13 longPressAction:sel__itemReceivedLongPress_];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEAE8])
    {
      uint64_t v30 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:6];
      shareItem = v13->_shareItem;
      v13->_shareItem = (UIBarButtonItem *)v30;

      [(UIBarButtonItem *)v13->_shareItem setAccessibilityIdentifier:@"ShareButton"];
      v32 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_shareItem setAccessibilityIdentifier:v32];

      [(UIBarButtonItem *)v13->_shareItem _sf_setTarget:v13 touchDownAction:sel__itemReceivedTouchDown_ longPressAction:sel__itemReceivedLongPress_];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEB00])
    {
      uint64_t v33 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:7];
      newTabItem = v13->_newTabItem;
      v13->_newTabItem = (UIBarButtonItem *)v33;

      v35 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_newTabItem setAccessibilityIdentifier:v35];

      [(UIBarButtonItem *)v13->_newTabItem _sf_setTarget:v13 longPressAction:sel__itemReceivedLongPress_];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEB18])
    {
      uint64_t v36 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:8];
      tabExposeItem = v13->_tabExposeItem;
      v13->_tabExposeItem = (UIBarButtonItem *)v36;

      v38 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_tabExposeItem setAccessibilityIdentifier:v38];

      [(UIBarButtonItem *)v13->_tabExposeItem _sf_setTarget:v13 longPressAction:sel__itemReceivedLongPress_];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEB30])
    {
      uint64_t v39 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:9];
      openInSafariItem = v13->_openInSafariItem;
      v13->_openInSafariItem = (UIBarButtonItem *)v39;

      v41 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_openInSafariItem setAccessibilityIdentifier:v41];

      [(UIBarButtonItem *)v13->_openInSafariItem _sf_setTarget:v13 longPressAction:sel__itemReceivedLongPress_];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEB48])
    {
      uint64_t v42 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:10];
      customActivityItem = v13->_customActivityItem;
      v13->_customActivityItem = (UIBarButtonItem *)v42;

      v44 = _SFAccessibilityIdentifierForBarItem();
      [(UIBarButtonItem *)v13->_customActivityItem setAccessibilityIdentifier:v44];
    }
    if ([(NSOrderedSet *)v13->_arrangedBarItems containsObject:&unk_1EFBDEB60])
    {
      uint64_t v45 = [(SFBarRegistration *)v13 _newBarButtonItemForSFBarItem:11];
      downloadsItem = v13->_downloadsItem;
      v13->_downloadsItem = (SFDownloadsBarButtonItem *)v45;

      v47 = _SFAccessibilityIdentifierForBarItem();
      [(SFDownloadsBarButtonItem *)v13->_downloadsItem setAccessibilityIdentifier:v47];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SFBarRegistration_initWithBar_barManager_layout_persona___block_invoke;
    block[3] = &unk_1E5C724D8;
    v48 = v13;
    v52 = v48;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v49 = v48;
  }
  return v13;
}

- (id)_newBarButtonItemForSFBarItem:(int64_t)a3
{
  if (a3 == 10)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v7 = objc_opt_new();
    v8 = (void *)[v6 initWithImage:v7 style:0 target:self action:sel__itemReceivedTap_];

    return v8;
  }
  else if (a3 == 11)
  {
    v4 = [SFDownloadsBarButtonItem alloc];
    return [(SFDownloadsBarButtonItem *)v4 initWithTarget:self action:sel__itemReceivedTap_];
  }
  else
  {
    v9 = SFSystemImageNameForBarItem();
    id v10 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    id v11 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D8]];
    v12 = [v10 configurationWithTraitCollection:v11];

    v13 = [MEMORY[0x1E4FB1818] systemImageNamed:v9 withConfiguration:v12];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v13 style:0 target:self action:sel__itemReceivedTap_];
    uint64_t v15 = v14;
    if (self->_layout == 2) {
      [v14 _setWidth:60.0];
    }
    uint64_t v16 = _SFAccessibilityIdentifierForBarItem();
    [v15 setAccessibilityIdentifier:v16];

    return v15;
  }
}

- (id)_UIBarButtonItemsForArrangedBarItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if (self->_layout == 2) {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    }
    else {
      v5 = 0;
    }
    v7 = [v4 lastObject];
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = -[SFBarRegistration _UIBarButtonItemForBarItem:](self, "_UIBarButtonItemForBarItem:", [v14 integerValue]);
          [v8 addObject:v15];

          if (v5 && ([v14 isEqual:v7] & 1) == 0) {
            [v8 addObject:v5];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v6 = (void *)[v8 copy];
    id v4 = v17;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SFBarRegistration *)self _UIBarButtonItemForBarItem:a3];
  [v5 setEnabled:v4];
}

- (id)_UIBarButtonItemForBarItem:(int64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v4 = 72;
      goto LABEL_13;
    case 1:
      uint64_t v4 = 96;
      goto LABEL_13;
    case 2:
    case 4:
    case 5:
      break;
    case 3:
      uint64_t v4 = 80;
      goto LABEL_13;
    case 6:
      uint64_t v4 = 112;
      goto LABEL_13;
    case 7:
      uint64_t v4 = 104;
      goto LABEL_13;
    case 8:
      uint64_t v4 = 120;
      goto LABEL_13;
    case 9:
      uint64_t v4 = 128;
      goto LABEL_13;
    case 10:
      uint64_t v4 = 136;
      goto LABEL_13;
    case 11:
      uint64_t v4 = 88;
LABEL_13:
      id v3 = *(id *)((char *)&self->super.super.isa + v4);
      break;
    default:
      if ((unint64_t)(a3 + 101) < 2)
      {
        id v3 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:0 style:0 target:0 action:0];
        [v3 setWidth:44.0];
      }
      break;
  }

  return v3;
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  id v6 = a4;
  id v7 = [(SFBarRegistration *)self UIBarButtonItemForItem:a3];
  [v7 setMenu:v6];
}

- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4
{
  if (a3 == 3) {
    [(UIBarButtonItem *)self->_bookmarksItem setSelected:a4];
  }
}

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  int v4 = a4;
  arrangedBarItems = self->_arrangedBarItems;
  v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  LODWORD(arrangedBarItems) = [(NSOrderedSet *)arrangedBarItems containsObject:v8];

  if (arrangedBarItems)
  {
    hiddenBarItems = self->_hiddenBarItems;
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    LODWORD(hiddenBarItems) = [(NSMutableSet *)hiddenBarItems containsObject:v10];

    if (hiddenBarItems != v4)
    {
      uint64_t v11 = self->_hiddenBarItems;
      id v12 = [NSNumber numberWithInteger:a3];
      if (v4) {
        [(NSMutableSet *)v11 addObject:v12];
      }
      else {
        [(NSMutableSet *)v11 removeObject:v12];
      }
    }
  }
}

- (void)updateArrangedUIBarButtonItemsIfNeeded
{
  if ([(SFBarRegistration *)self _arrangedBarItemsNeedUpdate])
  {
    id v3 = [(SFBarRegistration *)self _effectiveArrangedBarItems];
    lastCommittedArrangedBarItems = self->_lastCommittedArrangedBarItems;
    self->_lastCommittedArrangedBarItems = v3;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
    id v5 = [(SFBarRegistration *)self _UIBarButtonItemsForArrangedBarItems:self->_lastCommittedArrangedBarItems];
    [WeakRetained setItems:v5];

    if (objc_opt_respondsToSelector()) {
      [WeakRetained didChangeArrangedBarItems:self];
    }
  }
}

- (BOOL)_arrangedBarItemsNeedUpdate
{
  if (self->_lastCommittedArrangedBarItems)
  {
    id v3 = [(SFBarRegistration *)self _effectiveArrangedBarItems];
    BOOL v4 = ![(NSOrderedSet *)self->_lastCommittedArrangedBarItems isEqualToOrderedSet:v3];
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)_effectiveArrangedBarItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barManager);
  BOOL v4 = [WeakRetained delegate];
  char v5 = objc_opt_respondsToSelector();
  arrangedBarItems = self->_arrangedBarItems;
  if (v5)
  {
    id v7 = [(NSOrderedSet *)arrangedBarItems set];
    v8 = [v4 barManager:WeakRetained visibleBarItemsForLayout:self->_layout availableItems:v7];
    if ([v7 isEqualToSet:v8]) {
      id v9 = 0;
    }
    else {
      id v9 = v8;
    }

    uint64_t v11 = (void *)[(NSOrderedSet *)self->_arrangedBarItems mutableCopy];
    uint64_t v10 = v11;
    if (v9)
    {
      [v11 intersectSet:v9];
    }
  }
  else
  {
    uint64_t v10 = (void *)[(NSOrderedSet *)arrangedBarItems mutableCopy];
  }
  [v10 minusSet:self->_hiddenBarItems];
  id v12 = (void *)[v10 copy];

  return v12;
}

- (void)setCustomActivityImage:(id)a3 accessibilityLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFBarRegistration *)self _UIBarButtonItemForBarItem:10];
  [v8 setImage:v7];

  [v8 setTitle:v6];
  [v8 setAccessibilityLabel:v6];
}

- (void)setImage:(id)a3 forBarItem:(int64_t)a4
{
  id v7 = a3;
  id v11 = v7;
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1E4FB1818];
    BOOL v4 = SFSystemImageNameForBarItem();
    id v7 = [v8 systemImageNamed:v4];
  }
  id v9 = [(SFBarRegistration *)self _UIBarButtonItemForBarItem:a4];
  [v9 setImage:v7];

  uint64_t v10 = v11;
  if (!v11)
  {

    uint64_t v10 = 0;
  }
}

- (void)_updateTitlesAndMenus
{
  if (self->_backItem)
  {
    id v3 = SFAccessibilityTitleForBarItem();
    [(UIBarButtonItem *)self->_backItem setTitle:v3];
  }
  if (self->_forwardItem)
  {
    BOOL v4 = SFAccessibilityTitleForBarItem();
    [(UIBarButtonItem *)self->_forwardItem setTitle:v4];
  }
  if (self->_bookmarksItem)
  {
    char v5 = SFAccessibilityTitleForBarItem();
    [(UIBarButtonItem *)self->_bookmarksItem setTitle:v5];
  }
  if (self->_shareItem)
  {
    id v6 = SFAccessibilityTitleForBarItem();
    [(UIBarButtonItem *)self->_shareItem setTitle:v6];
  }
  if (self->_newTabItem)
  {
    id v7 = SFAccessibilityTitleForBarItem();
    [(UIBarButtonItem *)self->_newTabItem setTitle:v7];
  }
  if (self->_tabExposeItem)
  {
    id v8 = SFAccessibilityTitleForBarItem();
    [(UIBarButtonItem *)self->_tabExposeItem setTitle:v8];
  }
  if (self->_openInSafariItem)
  {
    SFAccessibilityTitleForBarItem();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(UIBarButtonItem *)self->_openInSafariItem setTitle:v9];
  }
}

uint64_t __59__SFBarRegistration_initWithBar_barManager_layout_persona___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTitlesAndMenus];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__itemReceivedLongPress_ == a3)
  {
    id v8 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_barManager);
    int64_t v10 = [(SFBarRegistration *)self _barItemForUIBarButtonItem:v8];

    unsigned __int8 v7 = [WeakRetained barRegistration:self canHandleLongPressForBarItem:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SFBarRegistration;
    id v6 = a4;
    unsigned __int8 v7 = [(SFBarRegistration *)&v12 canPerformAction:a3 withSender:v6];
  }
  return v7;
}

- (void)setDownloadsItemProgress:(double)a3
{
}

- (void)pulseDownloadsItem
{
}

- (BOOL)containsBarItem:(int64_t)a3
{
  if (*MEMORY[0x1E4F788B8] == a3) {
    return 0;
  }
  [(SFBarRegistration *)self updateArrangedUIBarButtonItemsIfNeeded];
  lastCommittedArrangedBarItems = self->_lastCommittedArrangedBarItems;
  unsigned __int8 v7 = [NSNumber numberWithInteger:a3];
  LOBYTE(lastCommittedArrangedBarItems) = [(NSOrderedSet *)lastCommittedArrangedBarItems containsObject:v7];

  return (char)lastCommittedArrangedBarItems;
}

- (id)popoverSourceInfoForItem:(int64_t)a3
{
  id v3 = [(SFBarRegistration *)self _UIBarButtonItemForBarItem:a3];
  if (v3) {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F784A8]) initWithItem:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setProgress:(double)a3 forBarItem:(int64_t)a4
{
  if (a4 == 11) {
    [(SFBarRegistration *)self setDownloadsItemProgress:a3];
  }
}

- (void)pulseBarItem:(int64_t)a3
{
  if (a3 == 11) {
    [(SFBarRegistration *)self pulseDownloadsItem];
  }
}

- (int64_t)_barItemForUIBarButtonItem:(id)a3
{
  BOOL v4 = (SFDownloadsBarButtonItem *)a3;
  if ((SFDownloadsBarButtonItem *)self->_backItem == v4)
  {
    int64_t v5 = 0;
  }
  else if ((SFDownloadsBarButtonItem *)self->_forwardItem == v4)
  {
    int64_t v5 = 1;
  }
  else if ((SFDownloadsBarButtonItem *)self->_bookmarksItem == v4)
  {
    int64_t v5 = 3;
  }
  else if ((SFDownloadsBarButtonItem *)self->_shareItem == v4)
  {
    int64_t v5 = 6;
  }
  else if ((SFDownloadsBarButtonItem *)self->_newTabItem == v4)
  {
    int64_t v5 = 7;
  }
  else if ((SFDownloadsBarButtonItem *)self->_tabExposeItem == v4)
  {
    int64_t v5 = 8;
  }
  else if ((SFDownloadsBarButtonItem *)self->_openInSafariItem == v4)
  {
    int64_t v5 = 9;
  }
  else if ((SFDownloadsBarButtonItem *)self->_customActivityItem == v4)
  {
    int64_t v5 = 10;
  }
  else if (self->_downloadsItem == v4)
  {
    int64_t v5 = 11;
  }
  else
  {
    int64_t v5 = 17;
  }

  return v5;
}

- (void)_itemReceivedTouchDown:(id)a3
{
  p_barManager = &self->_barManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  int64_t v6 = [(SFBarRegistration *)self _barItemForUIBarButtonItem:v5];

  [WeakRetained barRegistration:self didReceiveTouchDownForBarItem:v6];
}

- (void)_itemReceivedTap:(id)a3
{
  p_barManager = &self->_barManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  int64_t v6 = [(SFBarRegistration *)self _barItemForUIBarButtonItem:v5];

  [WeakRetained barRegistration:self didReceiveTapForBarItem:v6];
}

- (void)_itemReceivedLongPress:(id)a3
{
  p_barManager = &self->_barManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  int64_t v6 = [(SFBarRegistration *)self _barItemForUIBarButtonItem:v5];

  [WeakRetained barRegistration:self didReceiveLongPressForBarItem:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customActivityItem, 0);
  objc_storeStrong((id *)&self->_openInSafariItem, 0);
  objc_storeStrong((id *)&self->_tabExposeItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_newTabItem, 0);
  objc_storeStrong((id *)&self->_forwardItem, 0);
  objc_storeStrong((id *)&self->_downloadsItem, 0);
  objc_storeStrong((id *)&self->_bookmarksItem, 0);
  objc_storeStrong((id *)&self->_backItem, 0);
  objc_storeStrong((id *)&self->_lastCommittedArrangedBarItems, 0);
  objc_storeStrong((id *)&self->_hiddenBarItems, 0);
  objc_destroyWeak((id *)&self->_barManager);
  objc_destroyWeak((id *)&self->_bar);

  objc_storeStrong((id *)&self->_arrangedBarItems, 0);
}

@end