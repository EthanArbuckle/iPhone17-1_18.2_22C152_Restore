@interface SiriAlternativeParaphraseAlternativeMultiResultsView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriAlternativeParaphraseAlternativeMultiResultsView)initWithAlternativeResult:(id)a3;
- (SiriAlternativeParaphraseAlternativeViewControllerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation SiriAlternativeParaphraseAlternativeMultiResultsView

- (SiriAlternativeParaphraseAlternativeMultiResultsView)initWithAlternativeResult:(id)a3
{
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SiriAlternativeParaphraseAlternativeMultiResultsView;
  v6 = [(SiriAlternativeParaphraseAlternativeMultiResultsView *)&v42 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    v8 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    [(SiriAlternativeParaphraseAlternativeMultiResultsView *)v7 addSubview:v7->_containerView];
    [(UIView *)v7->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v10 = +[NSMutableArray array];
    viewArray = v7->_viewArray;
    v7->_viewArray = (NSMutableArray *)v10;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v12 = [(SAARAlternativeResultsView *)v7->_result resultView];
    v13 = [v12 views];

    id obj = v13;
    id v14 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v19 = [[SiriAlternativeParaphraseAlternativeResultView alloc] initWithAlternativeResult:v18];
          v20 = v7;
          [(NSMutableArray *)v7->_viewArray addObject:v19];
          v21 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v21;
            v23 = [v18 displayText];
            *(_DWORD *)buf = 136315394;
            v44 = "-[SiriAlternativeParaphraseAlternativeMultiResultsView initWithAlternativeResult:]";
            __int16 v45 = 2112;
            v46 = v23;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%s Paraphrase alternatives: %@", buf, 0x16u);
          }
          v7 = v20;
        }
        id v15 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v15);
    }

    v24 = (SiriUICollectionViewFlowLayout *)objc_alloc_init((Class)SiriUICollectionViewFlowLayout);
    flowLayout = v7->_flowLayout;
    v7->_flowLayout = v24;

    [(SiriUICollectionViewFlowLayout *)v7->_flowLayout setMinimumLineSpacing:0.0];
    [(SiriUICollectionViewFlowLayout *)v7->_flowLayout setMinimumInteritemSpacing:0.0];
    v26 = [(SiriAlternativeParaphraseAlternativeMultiResultsView *)v7 delegate];
    [v26 viewControllerExpectedWidth];
    double v28 = v27;

    v29 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v7->_flowLayout, 0.0, 0.0, v28, 0.0);
    collectionView = v7->_collectionView;
    v7->_collectionView = v29;

    [(UICollectionView *)v7->_collectionView setScrollEnabled:0];
    [(UICollectionView *)v7->_collectionView setShowsVerticalScrollIndicator:0];
    v31 = v7->_collectionView;
    v32 = +[UIColor clearColor];
    [(UICollectionView *)v31 setBackgroundColor:v32];

    [(UICollectionView *)v7->_collectionView setDelegate:v7];
    [(UICollectionView *)v7->_collectionView setDataSource:v7];
    v33 = v7->_collectionView;
    uint64_t v34 = objc_opt_class();
    v35 = +[SiriUIContentCollectionViewCell reuseIdentifier];
    [(UICollectionView *)v33 registerClass:v34 forCellWithReuseIdentifier:v35];

    [(UICollectionView *)v7->_collectionView reloadData];
    [(UICollectionView *)v7->_collectionView setNeedsLayout];
    [(UIView *)v7->_containerView addSubview:v7->_collectionView];
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v5 = [(NSMutableArray *)self->_viewArray count];
  viewArray = self->_viewArray;
  if (v5)
  {
    v7 = [(NSMutableArray *)viewArray objectAtIndex:0];
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    double v9 = v8 * (double)(unint64_t)[(NSMutableArray *)self->_viewArray count];
  }
  else
  {
    double v9 = (double)(unint64_t)[(NSMutableArray *)viewArray count] * 44.0;
  }
  double v10 = width;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  containerView = self->_containerView;
  [(SiriAlternativeParaphraseAlternativeMultiResultsView *)self bounds];
  -[UIView setFrame:](containerView, "setFrame:");
  collectionView = self->_collectionView;
  [(UIView *)self->_containerView bounds];
  -[UICollectionView setFrame:](collectionView, "setFrame:");
  [(UICollectionView *)self->_collectionView reloadData];
  flowLayout = self->_flowLayout;

  [(SiriUICollectionViewFlowLayout *)flowLayout invalidateLayout];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  v7 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  double v8 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v6];

  [v8 setHasChevron:0];
  viewArray = self->_viewArray;
  id v10 = [v6 item];

  double v11 = [(NSMutableArray *)viewArray objectAtIndex:v10];
  [v11 edgeInsets];
  objc_msgSend(v8, "setCustomViewEdgeInsets:");
  [v8 setCustomView:v11];
  v12 = [(NSMutableArray *)self->_viewArray lastObject];
  BOOL v13 = v11 != v12;

  [v8 setKeylineType:v13];

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  viewArray = self->_viewArray;
  id v8 = [v6 row];

  id v12 = [(NSMutableArray *)viewArray objectAtIndex:v8];
  double v9 = [(SiriAlternativeParaphraseAlternativeMultiResultsView *)self delegate];
  id v10 = [v12 commands];
  double v11 = [v12 responseText];
  [v9 performAceCommands:v10 userUtterance:v11];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  v7 = [(SiriAlternativeParaphraseAlternativeMultiResultsView *)self delegate];
  [v7 viewControllerExpectedWidth];
  double v9 = v8;

  viewArray = self->_viewArray;
  id v11 = [v6 item];

  id v12 = [(NSMutableArray *)viewArray objectAtIndex:v11];
  objc_msgSend(v12, "sizeThatFits:", v9, 1.79769313e308);
  double v14 = v13;

  double v15 = v9;
  double v16 = v14;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (SiriAlternativeParaphraseAlternativeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriAlternativeParaphraseAlternativeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewArray, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end