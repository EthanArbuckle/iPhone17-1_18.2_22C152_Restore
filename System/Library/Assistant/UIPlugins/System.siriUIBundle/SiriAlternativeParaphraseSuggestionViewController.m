@interface SiriAlternativeParaphraseSuggestionViewController
- (BOOL)removedAfterDialogProgresses;
- (BOOL)wantsConfirmationInsets;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)headerViewClass;
- (double)desiredHeightForHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureReusableHeaderView:(id)a3;
- (void)createViewArray;
- (void)loadView;
- (void)setAceObject:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SiriAlternativeParaphraseSuggestionViewController

- (void)setAceObject:(id)a3
{
  v4 = self;
  v19.receiver = self;
  v19.super_class = (Class)SiriAlternativeParaphraseSuggestionViewController;
  id v14 = a3;
  -[SiriAlternativeParaphraseSuggestionViewController setAceObject:](&v19, "setAceObject:");
  v4 = (SiriAlternativeParaphraseSuggestionViewController *)((char *)v4 + 8);
  objc_storeStrong((id *)v4, a3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [*(id *)v4->SiriUISnippetCollectionViewController_opaque suggestedResults];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = v10;
          v13 = [v11 displayText];
          *(_DWORD *)buf = 136315394;
          v21 = "-[SiriAlternativeParaphraseSuggestionViewController setAceObject:]";
          __int16 v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s Paraphrase suggestion: %@", buf, 0x16u);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)createViewArray
{
  v3 = +[NSMutableArray array];
  viewArray = self->_viewArray;
  self->_viewArray = v3;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(SAARParaphrasedSuggestedResultsPod *)self->_suggestedResultsPod suggestedResults];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [[SiriAlternativeParaphraseSuggestionResultView alloc] initWithAlternativeSuggestionResult:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)];
        [(NSMutableArray *)self->_viewArray addObject:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [(SiriAlternativeParaphraseSuggestionViewController *)self collectionView];
  [v11 reloadData];

  v12 = [(SiriAlternativeParaphraseSuggestionViewController *)self collectionViewLayout];
  [v12 invalidateLayout];
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SiriAlternativeParaphraseSuggestionViewController;
  [(SiriAlternativeParaphraseSuggestionViewController *)&v6 loadView];
  -[SiriAlternativeParaphraseSuggestionViewController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v3 = [(SiriAlternativeParaphraseSuggestionViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  [(SiriAlternativeParaphraseSuggestionViewController *)self createViewArray];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SiriAlternativeParaphraseSuggestionViewController;
  [(SiriAlternativeParaphraseSuggestionViewController *)&v3 viewWillAppear:a3];
}

- (BOOL)wantsConfirmationInsets
{
  return 0;
}

- (BOOL)removedAfterDialogProgresses
{
  return 0;
}

- (double)desiredHeightForWidth:(double)a3
{
  if (([(SiriAlternativeParaphraseSuggestionViewController *)self isViewLoaded] & 1) == 0) {
    [(SiriAlternativeParaphraseSuggestionViewController *)self loadView];
  }
  uint64_t v4 = [(SiriAlternativeParaphraseSuggestionViewController *)self collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;

  return v6;
}

- (Class)headerViewClass
{
  return (Class)objc_opt_class();
}

- (void)configureReusableHeaderView:(id)a3
{
  suggestedResultsPod = self->_suggestedResultsPod;
  id v5 = a3;
  id v8 = [(SAARParaphrasedSuggestedResultsPod *)suggestedResultsPod title];
  double v6 = [(SiriAlternativeParaphraseSuggestionViewController *)self _privateDelegate];
  id v7 = [v6 localeForSiriViewController:self];
  [v5 configureWithText:v8 locale:v7];
}

- (double)desiredHeightForHeaderView
{
  v2 = objc_opt_class();

  [v2 defaultHeight];
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [v9 setHasChevron:0];
  viewArray = self->_viewArray;
  id v11 = [v6 item];

  v12 = [(NSMutableArray *)viewArray objectAtIndex:v11];
  [v12 edgeInsets];
  objc_msgSend(v9, "setCustomViewEdgeInsets:");
  [v9 setCustomView:v12];
  long long v13 = [(NSMutableArray *)self->_viewArray lastObject];
  BOOL v14 = v12 != v13;

  [v9 setKeylineType:v14];

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  viewArray = self->_viewArray;
  id v8 = [v6 row];

  id v14 = [(NSMutableArray *)viewArray objectAtIndex:v8];
  v9 = [v14 responseText];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)SAUIListItem);
    [v10 setSelectionText:v9];
    id v11 = [(SiriAlternativeParaphraseSuggestionViewController *)self delegate];
    [v11 siriViewController:self addSelectionResponse:v10];
  }
  v12 = [(SiriAlternativeParaphraseSuggestionViewController *)self delegate];
  long long v13 = [v14 commands];
  [v12 siriViewController:self performAceCommands:v13];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(SiriAlternativeParaphraseSuggestionViewController *)self delegate];
  [v7 siriViewControllerExpectedWidth:self];
  double v9 = v8;

  viewArray = self->_viewArray;
  id v11 = [v6 item];

  v12 = [(NSMutableArray *)viewArray objectAtIndex:v11];
  objc_msgSend(v12, "sizeThatFits:", v9, 1.79769313e308);
  double v14 = v13;

  double v15 = v9;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewArray, 0);

  objc_storeStrong((id *)&self->_suggestedResultsPod, 0);
}

@end