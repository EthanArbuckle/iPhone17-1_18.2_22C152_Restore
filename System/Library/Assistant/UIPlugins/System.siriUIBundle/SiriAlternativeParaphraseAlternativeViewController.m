@interface SiriAlternativeParaphraseAlternativeViewController
- (BOOL)removedAfterDialogProgresses;
- (BOOL)wantsConfirmationInsets;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)headerViewClass;
- (double)desiredHeightForHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (double)viewControllerExpectedWidth;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)configureReusableHeaderView:(id)a3;
- (void)createViewArray;
- (void)loadView;
- (void)performAceCommands:(id)a3 userUtterance:(id)a4;
- (void)setAceObject:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SiriAlternativeParaphraseAlternativeViewController

- (void)setAceObject:(id)a3
{
  v4 = (SAARParaphrasedAlternativeResultsPod *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SiriAlternativeParaphraseAlternativeViewController;
  [(SiriAlternativeParaphraseAlternativeViewController *)&v6 setAceObject:v4];
  resultsPod = self->_resultsPod;
  self->_resultsPod = v4;
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
  v5 = [(SAARParaphrasedAlternativeResultsPod *)self->_resultsPod alternativeResultViews];
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
        v10 = [[SiriAlternativeParaphraseAlternativeMultiResultsView alloc] initWithAlternativeResult:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)];
        [(SiriAlternativeParaphraseAlternativeMultiResultsView *)v10 setDelegate:self];
        [(NSMutableArray *)self->_viewArray addObject:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [(SiriAlternativeParaphraseAlternativeViewController *)self collectionView];
  [v11 reloadData];

  v12 = [(SiriAlternativeParaphraseAlternativeViewController *)self collectionViewLayout];
  [v12 invalidateLayout];
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SiriAlternativeParaphraseAlternativeViewController;
  [(SiriAlternativeParaphraseAlternativeViewController *)&v6 loadView];
  -[SiriAlternativeParaphraseAlternativeViewController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v3 = [(SiriAlternativeParaphraseAlternativeViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  [(SiriAlternativeParaphraseAlternativeViewController *)self createViewArray];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SiriAlternativeParaphraseAlternativeViewController;
  [(SiriAlternativeParaphraseAlternativeViewController *)&v3 viewWillAppear:a3];
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
  if (([(SiriAlternativeParaphraseAlternativeViewController *)self isViewLoaded] & 1) == 0) {
    [(SiriAlternativeParaphraseAlternativeViewController *)self loadView];
  }
  uint64_t v4 = [(SiriAlternativeParaphraseAlternativeViewController *)self collectionViewLayout];
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
  resultsPod = self->_resultsPod;
  id v5 = a3;
  id v8 = [(SAARParaphrasedAlternativeResultsPod *)resultsPod title];
  double v6 = [(SiriAlternativeParaphraseAlternativeViewController *)self _privateDelegate];
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
  [v9 setCustomView:v12];
  long long v13 = [(NSMutableArray *)self->_viewArray lastObject];
  BOOL v14 = v12 != v13;

  [v9 setKeylineType:v14];

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(SiriAlternativeParaphraseAlternativeViewController *)self delegate];
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

- (void)performAceCommands:(id)a3 userUtterance:(id)a4
{
  id v10 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = objc_alloc_init((Class)SAUIListItem);
    [v7 setSelectionText:v6];

    double v8 = [(SiriAlternativeParaphraseAlternativeViewController *)self delegate];
    [v8 siriViewController:self addSelectionResponse:v7];
  }
  double v9 = [(SiriAlternativeParaphraseAlternativeViewController *)self delegate];
  [v9 siriViewController:self performAceCommands:v10];
}

- (double)viewControllerExpectedWidth
{
  objc_super v3 = [(SiriAlternativeParaphraseAlternativeViewController *)self delegate];
  [v3 siriViewControllerExpectedWidth:self];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewArray, 0);

  objc_storeStrong((id *)&self->_resultsPod, 0);
}

@end