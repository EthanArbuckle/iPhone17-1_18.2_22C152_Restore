@interface _SFBarManager
- (BOOL)allBarItemsAreDisabled;
- (BOOL)barRegistration:(id)a3 canHandleLongPressForBarItem:(int64_t)a4;
- (BOOL)isBarItemEnabled:(int64_t)a3;
- (BOOL)isBarItemHidden:(int64_t)a3;
- (BOOL)isBarItemSelected:(int64_t)a3;
- (CGRect)frameForBarItem:(int64_t)a3 inCoordinateSpace:(id)a4;
- (_SFBarManager)init;
- (_SFBarManagerDelegate)delegate;
- (_SWCollaborationButtonView)collaborationButton;
- (double)downloadsItemProgress;
- (id)menuForBarItem:(int64_t)a3;
- (id)test_registrationForBar:(id)a3;
- (int64_t)contentMode;
- (int64_t)state;
- (unint64_t)test_numberOfRegistrations;
- (void)_invalidateCoalescedUpdatesTimer;
- (void)_updateAllRegistrations;
- (void)_updateAllRegistrationsAnimated:(BOOL)a3;
- (void)_updateRegistrationWithToken:(id)a3 animated:(BOOL)a4;
- (void)barRegistration:(id)a3 didReceiveLongPressForBarItem:(int64_t)a4;
- (void)barRegistration:(id)a3 didReceiveTapForBarItem:(int64_t)a4;
- (void)barRegistration:(id)a3 didReceiveTouchDownForBarItem:(int64_t)a4;
- (void)performCoalescedUpdates:(id)a3;
- (void)performCoalescedUpdatesAnimated:(BOOL)a3 updates:(id)a4;
- (void)performCoalescedUpdatesNowAnimated:(BOOL)a3;
- (void)pulseDownloadsItem;
- (void)registerBar:(id)a3 withToken:(id)a4;
- (void)registerToolbar:(id)a3 withLayout:(int64_t)a4 persona:(int64_t)a5;
- (void)registerUnifiedBar:(id)a3 withPersona:(int64_t)a4;
- (void)setAllBarItemsAreDisabled:(BOOL)a3;
- (void)setBarItem:(int64_t)a3 attributedTitle:(id)a4;
- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 menu:(id)a4;
- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4;
- (void)setBarItem:(int64_t)a3 title:(id)a4;
- (void)setCollaborationButton:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setCustomActivityImage:(id)a3 accessibilityLabel:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDownloadsItemNeedsLayout;
- (void)setDownloadsItemProgress:(double)a3;
- (void)setImage:(id)a3 forBarItem:(int64_t)a4;
- (void)setState:(int64_t)a3;
- (void)visibleBarItemsNeedUpdate;
@end

@implementation _SFBarManager

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:");
  int v8 = [v7 isHidden];

  if (v8 != v4)
  {
    v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
    [v9 setHidden:v4];

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:");
  int v8 = [v7 isEnabled];

  if (v8 != v4)
  {
    v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
    [v9 setEnabled:v4];

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)setBarItem:(int64_t)a3 title:(id)a4
{
  id v11 = a4;
  if (v11)
  {
    v6 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
    v7 = [v6 title];
    char v8 = [v7 isEqualToString:v11];

    if ((v8 & 1) == 0)
    {
      v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
      [v9 setAttributedTitle:0];

      v10 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
      [v10 setTitle:v11];

      [(_SFBarManager *)self _updateAllRegistrations];
    }
  }
}

- (_SFBarManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)_SFBarManager;
  v2 = [(_SFBarManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    barToRegistrationMap = v2->_barToRegistrationMap;
    v2->_barToRegistrationMap = (NSMapTable *)v3;

    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:17];
    v6 = v5;
    if (v5 && (unint64_t)[v5 count] <= 0x10)
    {
      do
      {
        v7 = objc_alloc_init(_SFBarItemConfiguration);
        [v6 addObject:v7];
      }
      while ((unint64_t)[v6 count] < 0x11);
    }
    uint64_t v8 = [v6 copy];

    itemConfigurationMap = v2->_itemConfigurationMap;
    v2->_itemConfigurationMap = (NSArray *)v8;

    v10 = [(NSArray *)v2->_itemConfigurationMap objectAtIndexedSubscript:0];
    [v10 setEnabled:0];

    id v11 = [(NSArray *)v2->_itemConfigurationMap objectAtIndexedSubscript:1];
    [v11 setEnabled:0];

    v2->_downloadsItemProgress = -2.0;
    v12 = v2;
  }

  return v2;
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  id v10 = a4;
  v6 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
  v7 = [v6 menu];
  char v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
    [v9 setMenu:v10];

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (BOOL)isBarItemEnabled:(int64_t)a3
{
  if (self->_allBarItemsAreDisabled) {
    return 0;
  }
  BOOL v4 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
  char v5 = [v4 isEnabled];

  return v5;
}

- (void)_updateAllRegistrationsAnimated:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_deferUpdateAllRegistrations)
  {
    self->_needsUpdateAllRegistrations = 1;
  }
  else
  {
    BOOL v4 = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    char v5 = [(NSMapTable *)self->_barToRegistrationMap objectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(_SFBarManager *)self _updateRegistrationWithToken:*(void *)(*((void *)&v10 + 1) + 8 * i) animated:v4];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_updateAllRegistrations
{
}

- (void)_updateRegistrationWithToken:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    [v6 setContentMode:self->_contentMode];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setState:self->_state];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setCustomActivityImage:self->_customActivityImage accessibilityLabel:self->_customActivityAccessibilityLabel];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setCollaborationButton:self->_collaborationButton];
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  v9 = self;
  id v7 = v6;
  _SFBarItemEnumerateCases();
  objc_msgSend(v7, "updateBarAnimated:", v4, v8, 3221225472, __55___SFBarManager__updateRegistrationWithToken_animated___block_invoke, &unk_1E5C78978, v9);
}

- (_SFBarManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFBarManagerDelegate *)WeakRetained;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)setAllBarItemsAreDisabled:(BOOL)a3
{
  if (self->_allBarItemsAreDisabled != a3)
  {
    self->_allBarItemsAreDisabled = a3;
    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)performCoalescedUpdatesAnimated:(BOOL)a3 updates:(id)a4
{
  id v6 = a4;
  if (CFAbsoluteTimeGetCurrent() - self->_lastCoalescedUpdatesTime < 0.2) {
    [(_SFBarManager *)self _invalidateCoalescedUpdatesTimer];
  }
  id v7 = (void *)MEMORY[0x1AD0C36A0](v6);
  id coalescedUpdatesBlock = self->_coalescedUpdatesBlock;
  self->_id coalescedUpdatesBlock = v7;

  if (![(NSTimer *)self->_coalescedUpdatesTimer isValid])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57___SFBarManager_performCoalescedUpdatesAnimated_updates___block_invoke;
    v12[3] = &unk_1E5C78950;
    v12[4] = self;
    BOOL v13 = a3;
    v9 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:0 repeats:v12 block:0.04];
    coalescedUpdatesTimer = self->_coalescedUpdatesTimer;
    self->_coalescedUpdatesTimer = v9;

    long long v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v11 addTimer:self->_coalescedUpdatesTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)registerToolbar:(id)a3 withLayout:(int64_t)a4 persona:(int64_t)a5
{
  id v8 = a3;
  v9 = [[SFBarRegistration alloc] initWithBar:v8 barManager:self layout:a4 persona:a5];
  [(_SFBarManager *)self registerBar:v8 withToken:v9];
}

- (void)registerBar:(id)a3 withToken:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(_SFBarManager *)self _updateRegistrationWithToken:v6 animated:0];
  [(NSMapTable *)self->_barToRegistrationMap setObject:v6 forKey:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained barManager:self willRegisterBarWithToken:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [v8 didCompleteBarRegistrationWithToken:v6];
  }
}

- (void)performCoalescedUpdatesNowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = (id)MEMORY[0x1AD0C36A0](self->_coalescedUpdatesBlock, a2);
  [(_SFBarManager *)self _invalidateCoalescedUpdatesTimer];
  double Current = CFAbsoluteTimeGetCurrent();
  id v6 = v8;
  self->_lastCoalescedUpdatesTime = Current;
  if (v8)
  {
    BOOL deferUpdateAllRegistrations = self->_deferUpdateAllRegistrations;
    self->_BOOL deferUpdateAllRegistrations = 1;
    (*((void (**)(id))v8 + 2))(v8);
    id v6 = v8;
    self->_BOOL deferUpdateAllRegistrations = deferUpdateAllRegistrations;
    if (self->_needsUpdateAllRegistrations)
    {
      self->_needsUpdateAllRegistrations = 0;
      [(_SFBarManager *)self _updateAllRegistrationsAnimated:v3];
      id v6 = v8;
    }
  }
}

- (void)_invalidateCoalescedUpdatesTimer
{
  [(NSTimer *)self->_coalescedUpdatesTimer invalidate];
  coalescedUpdatesTimer = self->_coalescedUpdatesTimer;
  self->_coalescedUpdatesTimer = 0;

  id coalescedUpdatesBlock = self->_coalescedUpdatesBlock;
  self->_id coalescedUpdatesBlock = 0;
}

- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:");
  int v8 = [v7 isSelected];

  if (v8 != v4)
  {
    v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
    [v9 setSelected:v4];

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)setImage:(id)a3 forBarItem:(int64_t)a4
{
  id v10 = a3;
  id v6 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a4];
  id v7 = [v6 image];
  char v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a4];
    [v9 setImage:v10];

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)visibleBarItemsNeedUpdate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_barToRegistrationMap objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateBarAnimated:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setDownloadsItemProgress:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_downloadsItemProgress = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSMapTable *)self->_barToRegistrationMap objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 setProgress:11 forBarItem:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setCustomActivityImage:(id)a3 accessibilityLabel:(id)a4
{
  long long v10 = (UIImage *)a3;
  id v7 = a4;
  if (self->_customActivityImage != v10 || (WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_customActivityImage, a3);
    uint64_t v8 = (NSString *)[v7 copy];
    customActivityAccessibilityLabel = self->_customActivityAccessibilityLabel;
    self->_customActivityAccessibilityLabel = v8;

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (BOOL)isBarItemHidden:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
  char v4 = [v3 isHidden];

  return v4;
}

- (BOOL)isBarItemSelected:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
  char v4 = [v3 isSelected];

  return v4;
}

- (void)setBarItem:(int64_t)a3 attributedTitle:(id)a4
{
  if (a4)
  {
    itemConfigurationMap = self->_itemConfigurationMap;
    id v7 = a4;
    uint64_t v8 = [(NSArray *)itemConfigurationMap objectAtIndexedSubscript:a3];
    [v8 setTitle:0];

    long long v9 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
    [v9 setAttributedTitle:v7];

    [(_SFBarManager *)self _updateAllRegistrations];
  }
}

- (void)setCollaborationButton:(id)a3
{
  uint64_t v5 = (_SWCollaborationButtonView *)a3;
  if (self->_collaborationButton != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_collaborationButton, a3);
    [(_SFBarManager *)self _updateAllRegistrations];
    uint64_t v5 = v6;
  }
}

- (void)pulseDownloadsItem
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSMapTable *)self->_barToRegistrationMap objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 pulseBarItem:11];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setDownloadsItemNeedsLayout
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSMapTable *)self->_barToRegistrationMap objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          long long v8 = [v7 UIBarButtonItemForItem:11];
          long long v9 = [v8 customView];
          [v9 setNeedsLayout];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_11;
          }
          long long v8 = [v7 viewForBarItem:11];
          [v8 setNeedsLayout];
        }

LABEL_11:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)performCoalescedUpdates:(id)a3
{
}

- (void)registerUnifiedBar:(id)a3 withPersona:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[SFUnifiedBarRegistration alloc] initWithBar:v6 barManager:self persona:a4];
  [(_SFBarManager *)self registerBar:v6 withToken:v7];
}

- (CGRect)frameForBarItem:(int64_t)a3 inCoordinateSpace:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(NSMapTable *)self->_barToRegistrationMap keyEnumerator];
  uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  CGFloat v8 = *MEMORY[0x1E4F1DB28];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v12 = v7;
  id v39 = v6;
  uint64_t v13 = *(void *)v42;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v16 = -[NSMapTable objectForKey:](self->_barToRegistrationMap, "objectForKey:", v15, v39);
      if (objc_opt_respondsToSelector())
      {
        v17 = [v16 UIBarButtonItemForItem:a3];
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v15;
            [v18 _frameOfBarButtonItem:v17];
            double x = v47.origin.x;
            double y = v47.origin.y;
            double width = v47.size.width;
            double height = v47.size.height;
            v50.origin.double x = v8;
            v50.origin.double y = v9;
            v50.size.double width = v10;
            v50.size.double height = v11;
            if (!CGRectEqualToRect(v47, v50))
            {
              id v6 = v39;
              objc_msgSend(v18, "convertRect:toCoordinateSpace:", v39, x, y, width, height);
              CGFloat v8 = v31;
              CGFloat v9 = v32;
              CGFloat v10 = v33;
              CGFloat v11 = v34;

              goto LABEL_19;
            }
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_14;
        }
        v17 = [v16 viewForBarItem:a3];
        [v17 bounds];
        double v23 = v48.origin.x;
        double v24 = v48.origin.y;
        double v25 = v48.size.width;
        double v26 = v48.size.height;
        v51.origin.double x = v8;
        v51.origin.double y = v9;
        v51.size.double width = v10;
        v51.size.double height = v11;
        if (!CGRectEqualToRect(v48, v51))
        {
          id v6 = v39;
          objc_msgSend(v17, "convertRect:toCoordinateSpace:", v39, v23, v24, v25, v26);
          CGFloat v8 = v27;
          CGFloat v9 = v28;
          CGFloat v10 = v29;
          CGFloat v11 = v30;
LABEL_19:

          goto LABEL_20;
        }
      }

LABEL_14:
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  id v6 = v39;
LABEL_20:

  double v35 = v8;
  double v36 = v9;
  double v37 = v10;
  double v38 = v11;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (void)barRegistration:(id)a3 didReceiveTapForBarItem:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained barManager:self didReceiveTapForBarItem:a4];
  }
}

- (BOOL)barRegistration:(id)a3 canHandleLongPressForBarItem:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v7 = [WeakRetained barManager:self canHandleLongPressForBarItem:a4];
  }
  else {
    char v7 = objc_opt_respondsToSelector();
  }
  char v8 = v7;

  return v8 & 1;
}

- (void)barRegistration:(id)a3 didReceiveLongPressForBarItem:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained barManager:self didReceiveLongPressForBarItem:a4];
  }
}

- (void)barRegistration:(id)a3 didReceiveTouchDownForBarItem:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained barManager:self didReceiveTouchDownForBarItem:a4];
  }
}

- (id)menuForBarItem:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_itemConfigurationMap objectAtIndexedSubscript:a3];
  uint64_t v4 = [v3 menu];

  return v4;
}

- (unint64_t)test_numberOfRegistrations
{
  v2 = [(NSMapTable *)self->_barToRegistrationMap objectEnumerator];
  uint64_t v3 = [v2 allObjects];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)test_registrationForBar:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_barToRegistrationMap objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)state
{
  return self->_state;
}

- (double)downloadsItemProgress
{
  return self->_downloadsItemProgress;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return self->_collaborationButton;
}

- (BOOL)allBarItemsAreDisabled
{
  return self->_allBarItemsAreDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customActivityAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customActivityImage, 0);
  objc_storeStrong((id *)&self->_itemConfigurationMap, 0);
  objc_storeStrong(&self->_coalescedUpdatesBlock, 0);
  objc_storeStrong((id *)&self->_coalescedUpdatesTimer, 0);

  objc_storeStrong((id *)&self->_barToRegistrationMap, 0);
}

@end