@interface AXHighlightContentSettingsController
- (BOOL)areContentHighlightItemsHidden;
- (BOOL)areSentenceHighlightItemsHidden;
- (BOOL)shouldShowFooterText;
- (BOOL)shouldShowSentenceItems;
- (BOOL)shouldShowWordColorItems;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (NSArray)colorHighlightItems;
- (NSArray)contentHighlightItems;
- (NSArray)sentenceColorHighlightItems;
- (NSArray)sentenceHighlightItems;
- (NSArray)wordColorHighlightItems;
- (id)_colorForStyle:(id)a3;
- (id)highlightEnabled:(id)a3;
- (id)specifiers;
- (void)_insertColorGroupingHeaderIfNecessary;
- (void)_reloadHighlightContentSpecifier;
- (void)loadView;
- (void)setColorHighlightItems:(id)a3;
- (void)setContentHighlightItems:(id)a3;
- (void)setContentHighlightItemsHidden:(BOOL)a3;
- (void)setHighlightEnabled:(id)a3 specifier:(id)a4;
- (void)setSentenceColorHighlightItems:(id)a3;
- (void)setSentenceHighlightItems:(id)a3;
- (void)setSentenceHighlightItemsHidden:(BOOL)a3;
- (void)setShowSentenceItems:(BOOL)a3;
- (void)setShowWordColorItems:(BOOL)a3;
- (void)setWordColorHighlightItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateLayout;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AXHighlightContentSettingsController

- (void)setContentHighlightItemsHidden:(BOOL)a3
{
  if (self->_contentHighlightItemsHidden != a3)
  {
    BOOL v3 = a3;
    self->_contentHighlightItemsHidden = a3;
    [(AXHighlightContentSettingsController *)self beginUpdates];
    if (v3)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v5 = [(AXHighlightContentSettingsController *)self sentenceColorHighlightItems];
      id v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v47;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v47 != v8) {
              objc_enumerationMutation(v5);
            }
            [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v46 + 1) + 8 * i) animated:1];
          }
          id v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v7);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v10 = [(AXHighlightContentSettingsController *)self wordColorHighlightItems];
      id v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v43;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v43 != v13) {
              objc_enumerationMutation(v10);
            }
            [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v42 + 1) + 8 * (void)j) animated:1];
          }
          id v12 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
        }
        while (v12);
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v15 = [(AXHighlightContentSettingsController *)self colorHighlightItems];
      id v16 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v39;
        do
        {
          for (k = 0; k != v17; k = (char *)k + 1)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v15);
            }
            [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v38 + 1) + 8 * (void)k) animated:1];
          }
          id v17 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v17);
      }

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v20 = [(AXHighlightContentSettingsController *)self sentenceHighlightItems];
      id v21 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v35;
        do
        {
          for (m = 0; m != v22; m = (char *)m + 1)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v34 + 1) + 8 * (void)m) animated:1];
          }
          id v22 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
        }
        while (v22);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v25 = [(AXHighlightContentSettingsController *)self contentHighlightItems];
      id v26 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v31;
        do
        {
          for (n = 0; n != v27; n = (char *)n + 1)
          {
            if (*(void *)v31 != v28) {
              objc_enumerationMutation(v25);
            }
            [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v30 + 1) + 8 * (void)n) animated:1];
          }
          id v27 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
        }
        while (v27);
      }
    }
    else
    {
      v25 = [(AXHighlightContentSettingsController *)self contentHighlightItems];
      [(AXHighlightContentSettingsController *)self insertContiguousSpecifiers:v25 afterSpecifierID:@"HighlightContent" animated:1];
    }

    [(AXHighlightContentSettingsController *)self endUpdates];
  }
}

- (void)_insertColorGroupingHeaderIfNecessary
{
  BOOL v3 = [(AXHighlightContentSettingsController *)self specifiers];
  id v4 = [v3 indexOfSpecifierWithID:@"COLOR_CHOICE"];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(AXHighlightContentSettingsController *)self colorHighlightItems];
    v5 = [(AXHighlightContentSettingsController *)self contentHighlightItems];
    id v6 = [v5 lastObject];
    id v7 = [v6 propertyForKey:PSIDKey];
    [(AXHighlightContentSettingsController *)self insertContiguousSpecifiers:v8 afterSpecifierID:v7 animated:1];
  }
}

- (void)setShowWordColorItems:(BOOL)a3
{
  BOOL v3 = a3;
  [(AXHighlightContentSettingsController *)self beginUpdates];
  if (!v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = [(AXHighlightContentSettingsController *)self wordColorHighlightItems];
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) animated:1];
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
    goto LABEL_11;
  }
  v5 = [(AXHighlightContentSettingsController *)self specifiers];
  id v6 = [(AXHighlightContentSettingsController *)self wordColorHighlightItems];
  id v7 = [v6 firstObject];
  unsigned __int8 v8 = [v5 containsObject:v7];

  if ((v8 & 1) == 0)
  {
    v9 = [(AXHighlightContentSettingsController *)self wordColorHighlightItems];
    [(AXHighlightContentSettingsController *)self insertContiguousSpecifiers:v9 afterSpecifierID:@"COLOR_CHOICE" animated:1];
LABEL_11:
  }
  [(AXHighlightContentSettingsController *)self endUpdates];
}

- (void)setShowSentenceItems:(BOOL)a3
{
  BOOL v3 = a3;
  [(AXHighlightContentSettingsController *)self beginUpdates];
  if (!v3)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v15 = [(AXHighlightContentSettingsController *)self sentenceColorHighlightItems];
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v28 + 1) + 8 * (void)v19) animated:1];
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v17);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v14 = [(AXHighlightContentSettingsController *)self sentenceHighlightItems];
    id v20 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v14);
          }
          [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v24 + 1) + 8 * (void)v23) animated:1];
          uint64_t v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v21);
    }
    goto LABEL_20;
  }
  v5 = [(AXHighlightContentSettingsController *)self specifiers];
  id v6 = [(AXHighlightContentSettingsController *)self sentenceHighlightItems];
  id v7 = [v6 firstObject];
  unsigned __int8 v8 = [v5 containsObject:v7];

  if ((v8 & 1) == 0)
  {
    v9 = [(AXHighlightContentSettingsController *)self sentenceHighlightItems];
    [(AXHighlightContentSettingsController *)self insertContiguousSpecifiers:v9 afterSpecifierID:@"HighlightSentenceOption" animated:1];
  }
  id v10 = [(AXHighlightContentSettingsController *)self specifiers];
  id v11 = [(AXHighlightContentSettingsController *)self sentenceColorHighlightItems];
  uint64_t v12 = [v11 firstObject];
  unsigned __int8 v13 = [v10 containsObject:v12];

  if ((v13 & 1) == 0)
  {
    long long v14 = [(AXHighlightContentSettingsController *)self sentenceColorHighlightItems];
    [(AXHighlightContentSettingsController *)self insertContiguousSpecifiers:v14 afterSpecifierID:@"WordHighlightColor" animated:1];
LABEL_20:
  }
  [(AXHighlightContentSettingsController *)self endUpdates];
}

- (id)specifiers
{
  BOOL v3 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v34 = OBJC_IVAR___PSListController__specifiers;
    long long v35 = self;
    id v4 = -[AXHighlightContentSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", @"HighlightContentSettings");
    long long v40 = +[NSMutableArray array];
    long long v39 = +[NSMutableArray array];
    long long v38 = +[NSMutableArray array];
    long long v37 = +[NSMutableArray array];
    long long v36 = +[NSMutableArray array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v43;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v11 = [v10 propertyForKey:@"id"];
          unsigned int v12 = [v11 isEqualToString:@"HighlightContentCell"];

          if (v12)
          {
            id v13 = v10;

            id v7 = v13;
          }
          long long v14 = [v10 propertyForKey:@"hideWhenHighlightContentDisabled"];
          unsigned int v15 = [v14 BOOLValue];

          if (v15) {
            [v40 addObject:v10];
          }
          id v16 = [v10 propertyForKey:@"hideWhenColorHighlightContentDisabled"];
          unsigned int v17 = [v16 BOOLValue];

          if (v17) {
            [v38 addObject:v10];
          }
          uint64_t v18 = [v10 propertyForKey:@"hideWhenWordColorHighlightContentDisabled"];
          unsigned int v19 = [v18 BOOLValue];

          if (v19) {
            [v36 addObject:v10];
          }
          id v20 = [v10 propertyForKey:@"hideWhenSentenceColorHighlightContentDisabled"];
          unsigned int v21 = [v20 BOOLValue];

          if (v21) {
            [v37 addObject:v10];
          }
          uint64_t v22 = [v10 propertyForKey:@"hideWhenSentenceHighlightDisabled"];
          unsigned int v23 = [v22 BOOLValue];

          if (v23) {
            [v39 addObject:v10];
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    [(AXHighlightContentSettingsController *)v35 setWordColorHighlightItems:v36];
    [(AXHighlightContentSettingsController *)v35 setSentenceColorHighlightItems:v37];
    [(AXHighlightContentSettingsController *)v35 setColorHighlightItems:v38];
    [(AXHighlightContentSettingsController *)v35 setContentHighlightItems:v40];
    [(AXHighlightContentSettingsController *)v35 setSentenceHighlightItems:v39];
    v35->_contentHighlightItemsHidden = _AXSQuickSpeakHighlightTextEnabled() == 0;
    v35->_sentenceHighlightItemsHidden = ![(AXHighlightContentSettingsController *)v35 shouldShowSentenceItems];
    unsigned __int8 v24 = [(AXHighlightContentSettingsController *)v35 shouldShowWordColorItems];
    if (v35->_contentHighlightItemsHidden)
    {
      long long v25 = [(AXHighlightContentSettingsController *)v35 contentHighlightItems];
      [obj removeObjectsInArray:v25];

      long long v26 = [(AXHighlightContentSettingsController *)v35 colorHighlightItems];
      [obj removeObjectsInArray:v26];
    }
    if (v35->_sentenceHighlightItemsHidden)
    {
      long long v27 = [(AXHighlightContentSettingsController *)v35 sentenceHighlightItems];
      [obj removeObjectsInArray:v27];

      long long v28 = [(AXHighlightContentSettingsController *)v35 sentenceColorHighlightItems];
      [obj removeObjectsInArray:v28];
    }
    if ((v24 & 1) == 0)
    {
      long long v29 = [(AXHighlightContentSettingsController *)v35 wordColorHighlightItems];
      [obj removeObjectsInArray:v29];
    }
    if ([(AXHighlightContentSettingsController *)v35 shouldShowFooterText] && v7)
    {
      long long v30 = settingsLocString(@"HighlightContentFooterText", @"HighlightContentSettings");
      [v7 setProperty:v30 forKey:PSFooterTextGroupKey];
    }
    [(AXHighlightContentSettingsController *)v35 setAllSpecifiersUnsearchable:obj];
    long long v31 = *(void **)&v35->AXUISettingsSetupCapableListController_opaque[v34];
    *(void *)&v35->AXUISettingsSetupCapableListController_opaque[v34] = obj;
    id v32 = obj;

    BOOL v3 = *(void **)&v35->AXUISettingsSetupCapableListController_opaque[v34];
  }

  return v3;
}

- (void)_reloadHighlightContentSpecifier
{
  id v3 = [(AXHighlightContentSettingsController *)self specifierForID:@"HighlightContent"];
  [(AXHighlightContentSettingsController *)self reloadSpecifier:v3];
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)AXHighlightContentSettingsController;
  [(AXHighlightContentSettingsController *)&v14 loadView];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_reloadHighlightContentSpecifier" name:kAXSQuickSpeakHighlightTextEnabledNotification object:0];

  objc_initWeak(&location, self);
  id v4 = +[AXSettings sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __48__AXHighlightContentSettingsController_loadView__block_invoke;
  v11[3] = &unk_208BB8;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [v4 registerUpdateBlock:v11 forRetrieveSelector:"quickSpeakHighlightOption" withListener:self];

  objc_destroyWeak(&v12);
  id v5 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __48__AXHighlightContentSettingsController_loadView__block_invoke_2;
  v9[3] = &unk_208BB8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [v5 registerUpdateBlock:v9 forRetrieveSelector:"quickSpeakWordHighlightColor" withListener:self];

  objc_destroyWeak(&v10);
  id v6 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__AXHighlightContentSettingsController_loadView__block_invoke_3;
  v7[3] = &unk_208BB8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"quickSpeakSentenceHighlightColor" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__AXHighlightContentSettingsController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForID:@"HighlightSentenceOption"];
  [WeakRetained reloadSpecifier:v2];
}

void __48__AXHighlightContentSettingsController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForID:@"WordHighlightColor"];
  [WeakRetained reloadSpecifier:v2];
}

void __48__AXHighlightContentSettingsController_loadView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForID:@"SentenceHighlightColor"];
  [WeakRetained reloadSpecifier:v2];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXHighlightContentSettingsController;
  [(AXHighlightContentSettingsController *)&v3 willBecomeActive];
  [(AXHighlightContentSettingsController *)self updateLayout];
}

- (id)_colorForStyle:(id)a3
{
  objc_super v3 = [a3 propertyForKey:PSIDKey];
  unsigned __int8 v4 = [v3 isEqualToString:@"WordHighlightColor"];
  id v5 = +[AXSettings sharedInstance];
  id v6 = v5;
  if (v4) {
    id v7 = [v5 quickSpeakWordHighlightColor];
  }
  else {
    id v7 = [v5 quickSpeakSentenceHighlightColor];
  }
  id v8 = v7;

  return +[AXSpeakHighlightColorController nameForColor:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXHighlightContentSettingsController;
  [(AXHighlightContentSettingsController *)&v4 viewWillAppear:a3];
  [(AXHighlightContentSettingsController *)self updateLayout];
}

- (BOOL)shouldShowSentenceItems
{
  if (!_AXSQuickSpeakHighlightTextEnabled()) {
    return 0;
  }
  v2 = +[AXSettings sharedInstance];
  if ([v2 quickSpeakHighlightOption] == (char *)&dword_0 + 2)
  {
    char v3 = 1;
  }
  else
  {
    objc_super v4 = +[AXSettings sharedInstance];
    char v3 = [v4 quickSpeakHighlightOption] == (char *)&dword_0 + 3;
  }
  return v3;
}

- (BOOL)shouldShowWordColorItems
{
  if (!_AXSQuickSpeakHighlightTextEnabled()) {
    return 0;
  }
  v2 = +[AXSettings sharedInstance];
  if ([v2 quickSpeakHighlightOption] == (char *)&dword_0 + 1)
  {
    char v3 = 1;
  }
  else
  {
    objc_super v4 = +[AXSettings sharedInstance];
    char v3 = [v4 quickSpeakHighlightOption] == (char *)&dword_0 + 3;
  }
  return v3;
}

- (BOOL)shouldShowFooterText
{
  return _AXSSpeakThisEnabled() != 0;
}

- (void)updateLayout
{
  [(AXHighlightContentSettingsController *)self setContentHighlightItemsHidden:_AXSQuickSpeakHighlightTextEnabled() == 0];
  BOOL v3 = [(AXHighlightContentSettingsController *)self shouldShowWordColorItems];
  BOOL v4 = [(AXHighlightContentSettingsController *)self shouldShowSentenceItems];
  if (v4 || v3)
  {
    [(AXHighlightContentSettingsController *)self _insertColorGroupingHeaderIfNecessary];
    [(AXHighlightContentSettingsController *)self setShowWordColorItems:v3];
    [(AXHighlightContentSettingsController *)self setShowSentenceItems:v4];
    [(AXHighlightContentSettingsController *)self beginUpdates];
  }
  else
  {
    [(AXHighlightContentSettingsController *)self setShowWordColorItems:0];
    [(AXHighlightContentSettingsController *)self setShowSentenceItems:0];
    [(AXHighlightContentSettingsController *)self beginUpdates];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(AXHighlightContentSettingsController *)self colorHighlightItems];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(AXHighlightContentSettingsController *)self removeSpecifier:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) animated:1];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  [(AXHighlightContentSettingsController *)self endUpdates];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v5 = [v12 specifier];
  id v6 = [v5 propertyForKey:@"_highlightOption"];
  if (v6)
  {
    id v7 = +[AXSettings sharedInstance];
    id v8 = [v7 quickSpeakHighlightOption];

    objc_msgSend(v12, "setChecked:", v8 == (id)(int)objc_msgSend(v6, "intValue"));
  }
  v9 = [v5 propertyForKey:@"_sentenceHighlightOption"];
  if (v9)
  {
    long long v10 = +[AXSettings sharedInstance];
    id v11 = [v10 quickSpeakSentenceHighlightOption];

    objc_msgSend(v12, "setChecked:", v11 == (id)(int)objc_msgSend(v9, "intValue"));
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)AXHighlightContentSettingsController;
  [(AXHighlightContentSettingsController *)&v47 tableView:v6 didSelectRowAtIndexPath:v7];
  long long v36 = v7;
  id v8 = [(AXHighlightContentSettingsController *)self specifierAtIndex:[(AXHighlightContentSettingsController *)self indexForIndexPath:v7]];
  v9 = [v8 propertyForKey:@"_highlightOption"];
  long long v10 = v9;
  long long v37 = v9;
  long long v38 = v8;
  if (v9)
  {
    signed int v11 = [v9 intValue];
    id v12 = +[AXSettings sharedInstance];
    [v12 setQuickSpeakHighlightOption:v11];

    [(AXHighlightContentSettingsController *)self updateLayout];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v13 = [v6 visibleCells];
    id v14 = [v13 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v44;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v44 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          unsigned int v19 = [v18 specifier];
          id v20 = [v19 propertyForKey:@"_highlightOption"];
          unsigned int v21 = v20;
          if (v20) {
            objc_msgSend(v18, "setChecked:", objc_msgSend(v20, "intValue") == v11);
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v15);
    }

    long long v10 = v37;
    id v8 = v38;
  }
  uint64_t v22 = [v8 propertyForKey:@"_sentenceHighlightOption"];
  unsigned int v23 = v22;
  if (v22)
  {
    signed int v24 = [v22 intValue];
    long long v25 = +[AXSettings sharedInstance];
    [v25 setQuickSpeakSentenceHighlightOption:v24];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v35 = v6;
    long long v26 = [v6 visibleCells];
    id v27 = [v26 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v40;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          id v32 = [v31 specifier];
          long long v33 = [v32 propertyForKey:@"_sentenceHighlightOption"];
          uint64_t v34 = v33;
          if (v33) {
            objc_msgSend(v31, "setChecked:", objc_msgSend(v33, "intValue") == v24);
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v28);
    }

    id v6 = v35;
    long long v10 = v37;
    id v8 = v38;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)highlightEnabled:(id)a3
{
  uint64_t v3 = _AXSQuickSpeakHighlightTextEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setHighlightEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  _AXSQuickSpeakSetHighlightTextEnabled();

  [(AXHighlightContentSettingsController *)self updateLayout];
}

- (NSArray)contentHighlightItems
{
  return self->_contentHighlightItems;
}

- (void)setContentHighlightItems:(id)a3
{
}

- (NSArray)sentenceHighlightItems
{
  return self->_sentenceHighlightItems;
}

- (void)setSentenceHighlightItems:(id)a3
{
}

- (NSArray)colorHighlightItems
{
  return self->_colorHighlightItems;
}

- (void)setColorHighlightItems:(id)a3
{
}

- (NSArray)sentenceColorHighlightItems
{
  return self->_sentenceColorHighlightItems;
}

- (void)setSentenceColorHighlightItems:(id)a3
{
}

- (NSArray)wordColorHighlightItems
{
  return self->_wordColorHighlightItems;
}

- (void)setWordColorHighlightItems:(id)a3
{
}

- (BOOL)areContentHighlightItemsHidden
{
  return self->_contentHighlightItemsHidden;
}

- (BOOL)areSentenceHighlightItemsHidden
{
  return self->_sentenceHighlightItemsHidden;
}

- (void)setSentenceHighlightItemsHidden:(BOOL)a3
{
  self->_sentenceHighlightItemsHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordColorHighlightItems, 0);
  objc_storeStrong((id *)&self->_sentenceColorHighlightItems, 0);
  objc_storeStrong((id *)&self->_colorHighlightItems, 0);
  objc_storeStrong((id *)&self->_sentenceHighlightItems, 0);

  objc_storeStrong((id *)&self->_contentHighlightItems, 0);
}

@end