@interface SFUnifiedBarRegistration
- (BOOL)_isBarItemHidden:(int64_t)a3;
- (BOOL)containsBarItem:(int64_t)a3;
- (SFUnifiedBarRegistration)initWithBar:(id)a3 barManager:(id)a4 persona:(int64_t)a5;
- (_SWCollaborationButtonView)collaborationButton;
- (id)_imageForBarItem:(int64_t)a3;
- (id)_makeBarItemForSFBarItem:(int64_t)a3;
- (id)_unifiedBarItemsForSFBarItems:(id)a3;
- (id)popoverSourceInfoForItem:(int64_t)a3;
- (id)unifiedBarItemForSFBarItem:(int64_t)a3;
- (id)viewForBarItem:(int64_t)a3;
- (int64_t)_SFBarItemForUnifiedBarItem:(id)a3;
- (int64_t)contentMode;
- (int64_t)state;
- (void)_itemReceivedTap:(id)a3;
- (void)_setNeedsUpdateItems;
- (void)_updateEnabledBarItems;
- (void)_updateItems;
- (void)_updateItemsIfNeeded;
- (void)pulseBarItem:(int64_t)a3;
- (void)setAttributedTitle:(id)a3 forBarItem:(int64_t)a4;
- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 menu:(id)a4;
- (void)setCollaborationButton:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setImage:(id)a3 forBarItem:(int64_t)a4;
- (void)setProgress:(double)a3 forBarItem:(int64_t)a4;
- (void)setState:(int64_t)a3;
- (void)setTitle:(id)a3 forBarItem:(int64_t)a4;
- (void)updateBarAnimated:(BOOL)a3;
@end

@implementation SFUnifiedBarRegistration

- (SFUnifiedBarRegistration)initWithBar:(id)a3 barManager:(id)a4 persona:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SFUnifiedBarRegistration;
  v10 = [(SFUnifiedBarRegistration *)&v45 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_bar, v8);
    objc_storeWeak((id *)&v11->_barManager, v9);
    v11->_persona = a5;
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    disabledBarItems = v11->_disabledBarItems;
    v11->_disabledBarItems = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    hiddenBarItems = v11->_hiddenBarItems;
    v11->_hiddenBarItems = (NSMutableSet *)v14;

    uint64_t v16 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:3];
    bookmarksAndSidebarButton = v11->_bookmarksAndSidebarButton;
    v11->_bookmarksAndSidebarButton = (SFUnifiedBarButton *)v16;

    uint64_t v18 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:0];
    backButton = v11->_backButton;
    v11->_backButton = (SFUnifiedBarItem *)v18;

    uint64_t v20 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:1];
    forwardButton = v11->_forwardButton;
    v11->_forwardButton = (SFUnifiedBarItem *)v20;

    uint64_t v22 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:2];
    tabGroupButton = v11->_tabGroupButton;
    v11->_tabGroupButton = (SFUnifiedBarItem *)v22;

    uint64_t v24 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:6];
    shareButton = v11->_shareButton;
    v11->_shareButton = (SFUnifiedBarItem *)v24;

    uint64_t v26 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:7];
    newTabButton = v11->_newTabButton;
    v11->_newTabButton = (SFUnifiedBarItem *)v26;

    uint64_t v28 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:8];
    tabOverviewButton = v11->_tabOverviewButton;
    v11->_tabOverviewButton = (SFUnifiedBarItem *)v28;

    uint64_t v30 = [(SFUnifiedBarRegistration *)v11 _makeBarItemForSFBarItem:12];
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (SFUnifiedBarItem *)v30;

    v32 = (SFCollaborationUnifiedBarItem *)objc_alloc_init(MEMORY[0x1E4F78250]);
    collaborationButton = v11->_collaborationButton;
    v11->_collaborationButton = v32;

    objc_initWeak(&location, v11);
    v34 = [SFDownloadsUnifiedBarItem alloc];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __59__SFUnifiedBarRegistration_initWithBar_barManager_persona___block_invoke;
    v42 = &unk_1E5C789A0;
    objc_copyWeak(&v43, &location);
    uint64_t v35 = [(SFDownloadsUnifiedBarItem *)v34 initWithAction:&v39];
    downloadsButton = v11->_downloadsButton;
    v11->_downloadsButton = (SFDownloadsUnifiedBarItem *)v35;

    [(SFUnifiedBarRegistration *)v11 _updateItems];
    v37 = v11;
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __59__SFUnifiedBarRegistration_initWithBar_barManager_persona___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _itemReceivedTap:v5];
  }
}

- (void)_setNeedsUpdateItems
{
  self->_needsUpdateItems = 1;
}

- (void)_updateItemsIfNeeded
{
  if (self->_needsUpdateItems) {
    [(SFUnifiedBarRegistration *)self _updateItems];
  }
}

- (void)_updateItems
{
  self->_needsUpdateItems = 0;
  int64_t persona = self->_persona;
  v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (!persona)
  {
    id v5 = &unk_1EFBDFA00;
    unint64_t state = self->_state;
    switch(self->_contentMode)
    {
      case 1:
        if (state >= 3) {
          goto LABEL_5;
        }
        id v5 = (void *)qword_1E5C78A38[state];
        break;
      case 2:
LABEL_5:
        id v5 = &unk_1EFBDFA30;
        break;
      case 3:
        id v5 = &unk_1EFBDFA48;
        BOOL v7 = state == 2;
        goto LABEL_8;
      case 6:
        id v5 = &unk_1EFBDFA60;
        BOOL v7 = state == 1;
LABEL_8:
        if (v7) {
          id v5 = (void *)MEMORY[0x1E4F1CBF0];
        }
        break;
      default:
        break;
    }
    v4 = v5;
  }
  leadingBarItems = self->_leadingBarItems;
  self->_leadingBarItems = v4;

  if (self->_persona)
  {
    id v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v10 = self->_state;
    switch(self->_contentMode)
    {
      case 1:
        if (v10 >= 3) {
          goto LABEL_16;
        }
        v11 = &unk_1E5C78A50;
        goto LABEL_19;
      case 2:
LABEL_16:
        uint64_t v12 = &unk_1EFBDFAC0;
        break;
      case 3:
        if (v10 >= 3) {
          goto LABEL_20;
        }
        v11 = &unk_1E5C78A68;
LABEL_19:
        uint64_t v12 = (void *)v11[v10];
        break;
      case 4:
LABEL_20:
        uint64_t v12 = &unk_1EFBDFB08;
        break;
      case 5:
        v13 = &unk_1EFBDFB20;
        uint64_t v14 = &unk_1EFBDFB38;
        goto LABEL_26;
      case 6:
        v13 = &unk_1EFBDFB50;
        if (v10 == 1) {
          v13 = &unk_1EFBDFB68;
        }
        uint64_t v14 = &unk_1EFBDFB80;
LABEL_26:
        if (v10 == 2) {
          uint64_t v12 = v14;
        }
        else {
          uint64_t v12 = v13;
        }
        break;
      default:
        uint64_t v12 = &unk_1EFBDFA78;
        break;
    }
    id v9 = v12;
  }
  trailingBarItems = self->_trailingBarItems;
  self->_trailingBarItems = v9;

  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v17 = [(NSArray *)self->_leadingBarItems arrayByAddingObjectsFromArray:self->_trailingBarItems];
  uint64_t v18 = [v16 setWithArray:v17];
  allBarItems = self->_allBarItems;
  self->_allBarItems = v18;

  id v22 = [(SFUnifiedBarRegistration *)self _imageForBarItem:3];
  [(SFUnifiedBarButton *)self->_bookmarksAndSidebarButton setImage:v22];
  uint64_t v20 = [(SFUnifiedBarButton *)self->_bookmarksAndSidebarButton view];
  [v20 setLargeContentImage:v22];
  if (self->_contentMode > 6uLL)
  {
    v21 = 0;
  }
  else
  {
    v21 = _WBSLocalizedString();
  }
  [v20 setLargeContentTitle:v21];
}

- (id)_makeBarItemForSFBarItem:(int64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [(SFUnifiedBarRegistration *)self _imageForBarItem:a3];
  id v6 = objc_alloc(MEMORY[0x1E4F784C8]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __53__SFUnifiedBarRegistration__makeBarItemForSFBarItem___block_invoke;
  v19 = &unk_1E5C789C8;
  objc_copyWeak(&v20, &location);
  BOOL v7 = (void *)[v6 initWithImage:v5 action:&v16];
  id v8 = objc_msgSend(v7, "view", v16, v17, v18, v19);
  id v9 = SFAccessibilityTitleForBarItem();
  objc_msgSend(v8, "sf_configureLargeContentViewerWithImage:title:", v5, v9);

  if (a3 == 2)
  {
    [v7 setSpacingOptions:10];
    v11 = [v7 view];
    uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
    [v11 setTintColor:v12];

    [v11 setShowsMenuAsPrimaryAction:1];
    v13 = [v11 titleLabel];
    [v13 setText:0];

    [v11 updateTitleFont];
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    [v7 setSpacingOptions:1];
    goto LABEL_8;
  }
  if (a3 != 12)
  {
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_9;
  }
  unint64_t v10 = _WBSLocalizedString();
  if (v10) {
    [v7 setTitle:v10];
  }
LABEL_9:
  uint64_t v14 = _SFAccessibilityIdentifierForBarItem();
  [v7 setAccessibilityIdentifier:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v7;
}

void __53__SFUnifiedBarRegistration__makeBarItemForSFBarItem___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _itemReceivedTap:v5];
  }
}

- (id)_imageForBarItem:(int64_t)a3
{
  if (a3 == 3)
  {
    unint64_t v3 = self->_contentMode - 2;
    if (v3 > 4) {
      v4 = @"sidebar.leading";
    }
    else {
      v4 = off_1E5C78A80[v3];
    }
  }
  else
  {
    SFSystemImageNameForBarItem();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];

  return v5;
}

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  disabledBarItems = self->_disabledBarItems;
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  LODWORD(disabledBarItems) = [(NSMutableSet *)disabledBarItems containsObject:v8];

  if (disabledBarItems == v4)
  {
    if ((unint64_t)a3 <= 1) {
      self->_nextUpdateShouldPinScrollPositionToTrailingEdge = 1;
    }
    id v9 = self->_disabledBarItems;
    unint64_t v10 = [NSNumber numberWithInteger:a3];
    if (v4) {
      [(NSMutableSet *)v9 removeObject:v10];
    }
    else {
      [(NSMutableSet *)v9 addObject:v10];
    }

    if (a3 != 1 || self->_contentMode <= 3uLL)
    {
      id v11 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a3];
      [v11 setEnabled:v4];
    }
  }
}

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[SFUnifiedBarRegistration _isBarItemHidden:](self, "_isBarItemHidden:") != a4)
  {
    hiddenBarItems = self->_hiddenBarItems;
    id v8 = [NSNumber numberWithInteger:a3];
    if (v4) {
      [(NSMutableSet *)hiddenBarItems addObject:v8];
    }
    else {
      [(NSMutableSet *)hiddenBarItems removeObject:v8];
    }

    [(SFUnifiedBarRegistration *)self _setNeedsUpdateItems];
  }
}

- (BOOL)_isBarItemHidden:(int64_t)a3
{
  if (a3 || self->_contentMode < 4uLL)
  {
    hiddenBarItems = self->_hiddenBarItems;
    id v8 = [NSNumber numberWithInteger:a3];
    if ([(NSMutableSet *)hiddenBarItems containsObject:v8])
    {
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
      if (a3 == 1 && self->_contentMode >= 4uLL)
      {
        disabledBarItems = self->_disabledBarItems;
        id v11 = [NSNumber numberWithInteger:1];
        char v9 = [(NSMutableSet *)disabledBarItems containsObject:v11];
      }
    }

    return v9;
  }
  if (![(NSMutableSet *)self->_disabledBarItems containsObject:&unk_1EFBDF0E8]) {
    return 0;
  }
  id v5 = self->_disabledBarItems;

  return [(NSMutableSet *)v5 containsObject:&unk_1EFBDF100];
}

- (void)_updateEnabledBarItems
{
}

void __50__SFUnifiedBarRegistration__updateEnabledBarItems__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 40);
  id v5 = [NSNumber numberWithInteger:a2];
  LODWORD(v4) = [v4 containsObject:v5];

  id v6 = *(void **)(a1 + 32);
  if (v4) {
    BOOL v8 = a2 == 1 && v6[20] > 3uLL;
  }
  else {
    BOOL v8 = 1;
  }
  id v9 = [v6 unifiedBarItemForSFBarItem:a2];
  [v9 setEnabled:v8];
}

- (void)updateBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFUnifiedBarRegistration *)self _updateItemsIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  [WeakRetained setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:self->_nextUpdateShouldPinScrollPositionToTrailingEdge];
  id v5 = objc_alloc(MEMORY[0x1E4F784D8]);
  id v6 = [(SFUnifiedBarRegistration *)self _unifiedBarItemsForSFBarItems:self->_leadingBarItems];
  BOOL v7 = [(SFUnifiedBarRegistration *)self _unifiedBarItemsForSFBarItems:self->_trailingBarItems];
  BOOL v8 = (void *)[v5 initWithLeadingItems:v6 trailingItems:v7];

  [WeakRetained setItemArrangement:v8 animated:v3];
  [WeakRetained setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:0];
  self->_nextUpdateShouldPinScrollPositionToTrailingEdge = 0;
}

- (id)_unifiedBarItemsForSFBarItems:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SFUnifiedBarRegistration__unifiedBarItemsForSFBarItems___block_invoke;
  v5[3] = &unk_1E5C78A18;
  v5[4] = self;
  BOOL v3 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v5);

  return v3;
}

id __58__SFUnifiedBarRegistration__unifiedBarItemsForSFBarItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isBarItemHidden:", objc_msgSend(v3, "integerValue")))
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "unifiedBarItemForSFBarItem:", objc_msgSend(v3, "integerValue"));
  }

  return v4;
}

- (int64_t)_SFBarItemForUnifiedBarItem:(id)a3
{
  BOOL v4 = (SFCollaborationUnifiedBarItem *)a3;
  if ((SFCollaborationUnifiedBarItem *)self->_backButton == v4)
  {
    int64_t v5 = 0;
  }
  else if (self->_bookmarksAndSidebarButton == v4)
  {
    int64_t v5 = 3;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_forwardButton == v4)
  {
    int64_t v5 = 1;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_tabGroupButton == v4)
  {
    int64_t v5 = 2;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_shareButton == v4)
  {
    int64_t v5 = 6;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_newTabButton == v4)
  {
    int64_t v5 = 7;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_tabOverviewButton == v4)
  {
    int64_t v5 = 8;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_downloadsButton == v4)
  {
    int64_t v5 = 11;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_cancelButton == v4)
  {
    int64_t v5 = 12;
  }
  else if (self->_collaborationButton == v4)
  {
    int64_t v5 = 16;
  }
  else
  {
    int64_t v5 = 17;
  }

  return v5;
}

- (id)unifiedBarItemForSFBarItem:(int64_t)a3
{
  if (unint64_t)a3 <= 0x10 && ((0x119CFu >> a3))
  {
    id v4 = *(id *)((char *)&self->super.isa + qword_1A6A8BA00[a3]);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_itemReceivedTap:(id)a3
{
  p_barManager = &self->_barManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  int64_t v6 = [(SFUnifiedBarRegistration *)self _SFBarItemForUnifiedBarItem:v5];

  [WeakRetained barRegistration:self didReceiveTapForBarItem:v6];
}

- (BOOL)containsBarItem:(int64_t)a3
{
  allBarItems = self->_allBarItems;
  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  if ([(NSSet *)allBarItems containsObject:v6]) {
    BOOL v7 = ![(SFUnifiedBarRegistration *)self _isBarItemHidden:a3];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)popoverSourceInfoForItem:(int64_t)a3
{
  uint64_t v3 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a3];
  id v4 = [v3 view];

  if (v4) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)viewForBarItem:(int64_t)a3
{
  uint64_t v3 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a3];
  id v4 = [v3 view];

  return v4;
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  id v6 = a4;
  id v8 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a3];
  BOOL v7 = [v8 view];
  [v7 setMenu:v6];
}

- (void)setProgress:(double)a3 forBarItem:(int64_t)a4
{
  if (a4 == 11) {
    [(SFDownloadsUnifiedBarItem *)self->_downloadsButton setProgress:a3];
  }
}

- (void)pulseBarItem:(int64_t)a3
{
  if (a3 == 11) {
    [(SFDownloadsUnifiedBarItem *)self->_downloadsButton pulse];
  }
}

- (void)setTitle:(id)a3 forBarItem:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    BOOL v7 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setTitle:v8];
    }

    id v6 = v8;
  }
}

- (void)setImage:(id)a3 forBarItem:(int64_t)a4
{
  id v8 = a3;
  id v6 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8)
    {
      [v6 setImage:v8];
    }
    else
    {
      BOOL v7 = [(SFUnifiedBarRegistration *)self _imageForBarItem:a4];
      [v6 setImage:v7];
    }
  }
}

- (void)setAttributedTitle:(id)a3 forBarItem:(int64_t)a4
{
  id v7 = a3;
  id v6 = [(SFUnifiedBarRegistration *)self unifiedBarItemForSFBarItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setAttributedTitle:v7];
  }
}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    [(SFUnifiedBarRegistration *)self _updateEnabledBarItems];
    [(SFUnifiedBarRegistration *)self _setNeedsUpdateItems];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_unint64_t state = a3;
    [(SFUnifiedBarRegistration *)self _setNeedsUpdateItems];
  }
}

- (_SWCollaborationButtonView)collaborationButton
{
  return (_SWCollaborationButtonView *)[(SFCollaborationUnifiedBarItem *)self->_collaborationButton collaborationButton];
}

- (void)setCollaborationButton:(id)a3
{
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_downloadsButton, 0);
  objc_storeStrong((id *)&self->_tabOverviewButton, 0);
  objc_storeStrong((id *)&self->_newTabButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_tabGroupButton, 0);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_bookmarksAndSidebarButton, 0);
  objc_storeStrong((id *)&self->_allBarItems, 0);
  objc_storeStrong((id *)&self->_trailingBarItems, 0);
  objc_storeStrong((id *)&self->_leadingBarItems, 0);
  objc_storeStrong((id *)&self->_hiddenBarItems, 0);
  objc_storeStrong((id *)&self->_disabledBarItems, 0);
  objc_destroyWeak((id *)&self->_barManager);

  objc_destroyWeak((id *)&self->_bar);
}

@end