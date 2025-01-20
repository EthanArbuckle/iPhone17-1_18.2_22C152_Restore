@interface GKCollectionDataSource
- (BOOL)breakSearchInputTextIntoMultipleTerms;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)isSearching;
- (BOOL)isValidAnalytics;
- (BOOL)onDarkBackground;
- (BOOL)searchMatchesItem:(id)a3 inSection:(int64_t)a4;
- (BOOL)useStandardHeaders;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (GKCollectionDataSource)init;
- (NSArray)searchTerms;
- (NSString)analyticsEvent;
- (NSString)analyticsEventType;
- (NSString)searchText;
- (NSString)sectionHeaderText;
- (UIViewController)presentationViewController;
- (double)preferredCollectionHeight;
- (id)alternateSearchKeyForSection:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)itemForIndexPath:(id)a3;
- (id)searchKeyForSection:(int64_t)a3;
- (int64_t)itemCount;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4;
- (void)dismissViewController:(id)a3;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)setAnalyticsEvent:(id)a3;
- (void)setAnalyticsEventType:(id)a3;
- (void)setBreakSearchInputTextIntoMultipleTerms:(BOOL)a3;
- (void)setOnDarkBackground:(BOOL)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setUseStandardHeaders:(BOOL)a3;
- (void)setupCollectionView:(id)a3;
- (void)showViewController:(id)a3 popoverSourceView:(id)a4;
@end

@implementation GKCollectionDataSource

- (GKCollectionDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionDataSource;
  v2 = [(GKCollectionDataSource *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKCollectionDataSource *)v2 setBreakSearchInputTextIntoMultipleTerms:1];
  }
  return v3;
}

- (void)setupCollectionView:(id)a3
{
  id v5 = a3;
  if (self->_useStandardHeaders)
  {
    v4 = +[NSObject _gkNib];
    [v5 registerNib:v4 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"GKCollectionDataSourceHeader"];
  }
  [v5 setDataSource:self];
  [v5 setDelegate:self];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (int64_t)itemCount
{
  return 0;
}

- (double)preferredCollectionHeight
{
  return 0.0;
}

- (NSString)sectionHeaderText
{
  return 0;
}

- (id)itemForIndexPath:(id)a3
{
  return 0;
}

- (void)showViewController:(id)a3 popoverSourceView:(id)a4
{
  id v5 = a3;
  id v6 = [(GKCollectionDataSource *)self presentationViewController];
  [v6 _gkShowViewController:v5];
}

- (void)dismissViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(GKCollectionDataSource *)self presentationViewController];
  [v5 _gkDismissViewController:v4 animated:1];
}

- (BOOL)isSearching
{
  return [(NSString *)self->_searchText length] != 0;
}

- (void)setSearchText:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_searchText isEqualToString:v4])
  {
    id v5 = (NSString *)[v4 copy];
    searchText = self->_searchText;
    self->_searchText = v5;

    v7 = [MEMORY[0x1E4F1CA48] array];
    if ([(GKCollectionDataSource *)self breakSearchInputTextIntoMultipleTerms])
    {
      v8 = self->_searchText;
      uint64_t v9 = [(NSString *)v8 length];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__GKCollectionDataSource_setSearchText___block_invoke;
      v10[3] = &unk_1E5F640C0;
      id v11 = v7;
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v10);
    }
    else if ([v4 length])
    {
      [v7 addObject:v4];
    }
    [(GKCollectionDataSource *)self setSearchTerms:v7];
    [(GKCollectionDataSource *)self searchTextHasChanged];
  }
}

uint64_t __40__GKCollectionDataSource_setSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)searchMatchesItem:(id)a3 inSection:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSArray *)self->_searchTerms count])
  {
    v7 = [(GKCollectionDataSource *)self searchKeyForSection:a4];
    v8 = [(GKCollectionDataSource *)self alternateSearchKeyForSection:a4];
    if ([v7 length])
    {
      uint64_t v9 = [v6 valueForKeyPath:v7];
      if (v8)
      {
        v10 = [v6 valueForKeyPath:v8];
      }
      else
      {
        v10 = 0;
      }
      if ([v9 length] || objc_msgSend(v10, "length"))
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v13 = self->_searchTerms;
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          v20 = v8;
          uint64_t v16 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              if ([v18 length]
                && ([v9 length]
                 && [v9 rangeOfString:v18 options:897] != 0x7FFFFFFFFFFFFFFFLL
                 || [v10 length]
                 && [v10 rangeOfString:v18 options:897] != 0x7FFFFFFFFFFFFFFFLL))
              {
                int v12 = 1;
                goto LABEL_24;
              }
            }
            uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v15) {
              continue;
            }
            break;
          }
          int v12 = 0;
LABEL_24:
          v8 = v20;
        }
        else
        {
          int v12 = 0;
        }
      }
      else
      {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }

    BOOL v11 = v12 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)searchKeyForSection:(int64_t)a3
{
  return 0;
}

- (id)alternateSearchKeyForSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v4 = NSString;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"subclass needs to override collectionView:cellForItemAtIndexPath:", a4);
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionDataSource.m"];
  id v7 = [v6 lastPathComponent];
  v8 = [v4 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v5, "-[GKCollectionDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v7, "UTF8String"), 199];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v8 format];
  return 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_useStandardHeaders
    && (uint64_t v11 = *MEMORY[0x1E4FB2770], [v9 isEqualToString:*MEMORY[0x1E4FB2770]]))
  {
    int v12 = [v8 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:@"GKCollectionDataSourceHeader" forIndexPath:v10];
    v13 = -[GKCollectionDataSource headerTextForSection:](self, "headerTextForSection:", [v10 section]);
    [v12 setTitle:v13];

    objc_msgSend(v12, "setOnDarkBackground:", -[GKCollectionDataSource onDarkBackground](self, "onDarkBackground"));
  }
  else
  {
    uint64_t v14 = NSString;
    uint64_t v15 = [NSString stringWithFormat:@"subclass needs to override collectionView:viewForSupplementaryElementOfKind:atIndexPath:"];
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionDataSource.m"];
    id v17 = [v16 lastPathComponent];
    v18 = [v14 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v15, "-[GKCollectionDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", objc_msgSend(v17, "UTF8String"), 218];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v18 format];
    int v12 = 0;
  }

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_useStandardHeaders && [(GKCollectionDataSource *)self itemCount])
  {
    id v10 = [(GKCollectionDataSource *)self headerTextForSection:a5];
    +[GKDashboardSectionHeaderView platformSizeForTitle:v10 withFont:0];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  id v9 = a4;
  id v5 = [a3 _gkFocusingLayout];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 focusedIndexPath];
    int v8 = [v7 isEqual:v9];

    if (v8) {
      [v6 setFocusedIndexPath:0];
    }
  }
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v9 = a4;
  id v5 = [a3 _gkFocusingLayout];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 focusedIndexPath];
    char v8 = [v7 isEqual:v9];

    if ((v8 & 1) == 0) {
      [v6 setFocusedIndexPath:v9];
    }
  }
}

- (BOOL)isValidAnalytics
{
  v3 = [(GKCollectionDataSource *)self analyticsEvent];
  if (v3)
  {
    id v4 = [(GKCollectionDataSource *)self analyticsEvent];
    if ([v4 length])
    {
      id v5 = [(GKCollectionDataSource *)self analyticsEventType];
      if (v5)
      {
        id v6 = [(GKCollectionDataSource *)self analyticsEventType];
        BOOL v7 = [v6 length] != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (UIViewController)presentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentationViewController:(id)a3
{
}

- (BOOL)onDarkBackground
{
  return self->_onDarkBackground;
}

- (void)setOnDarkBackground:(BOOL)a3
{
  self->_onDarkBackground = a3;
}

- (BOOL)useStandardHeaders
{
  return self->_useStandardHeaders;
}

- (void)setUseStandardHeaders:(BOOL)a3
{
  self->_useStandardHeaders = a3;
}

- (NSString)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  self->_analyticsEvent = (NSString *)a3;
}

- (NSString)analyticsEventType
{
  return self->_analyticsEventType;
}

- (void)setAnalyticsEventType:(id)a3
{
  self->_analyticsEventType = (NSString *)a3;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (BOOL)breakSearchInputTextIntoMultipleTerms
{
  return self->_breakSearchInputTextIntoMultipleTerms;
}

- (void)setBreakSearchInputTextIntoMultipleTerms:(BOOL)a3
{
  self->_breakSearchInputTextIntoMultipleTerms = a3;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_searchText, 0);

  objc_destroyWeak((id *)&self->_presentationViewController);
}

@end