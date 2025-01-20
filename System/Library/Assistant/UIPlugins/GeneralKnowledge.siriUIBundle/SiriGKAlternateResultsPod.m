@interface SiriGKAlternateResultsPod
- (SiriGKAlternateResultsPod)initWithPod:(id)a3;
- (UIEdgeInsets)headerInsets;
- (id)headerView;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKAlternateResultsPod

- (SiriGKAlternateResultsPod)initWithPod:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SiriGKAlternateResultsPod;
  v5 = [(SiriGKAlternateResultsPod *)&v28 init];
  if (v5)
  {
    v6 = [v4 alternateResults];
    uint64_t v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    viewArray = v5->_viewArray;
    v5->_viewArray = (NSMutableArray *)v7;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v9 = objc_msgSend(v4, "alternateResults", 0);
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[SiriGKAlternateResultView alloc] initWithAlternateResult:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13)];
          if (v14) {
            [(NSMutableArray *)v5->_viewArray addObject:v14];
          }

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    id v15 = objc_alloc((Class)SiriUIPlatterSectionHeaderView);
    v16 = [v4 title];
    id v17 = objc_alloc((Class)NSLocale);
    v18 = AFUIGetLanguageCode();
    id v19 = [v17 initWithLocaleIdentifier:v18];
    v20 = [v16 uppercaseStringWithLocale:v19];
    v21 = (SiriUIPlatterSectionHeaderView *)[v15 initWithText:v20];
    headerView = v5->_headerView;
    v5->_headerView = v21;

    [(SiriUIPlatterSectionHeaderView *)v5->_headerView setTextAlignment:4];
  }

  return v5;
}

- (int64_t)viewCount
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (id)viewAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_viewArray objectAtIndexedSubscript:a3];
}

- (int64_t)keylineType
{
  return 1;
}

- (id)headerView
{
  return self->_headerView;
}

- (UIEdgeInsets)headerInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_viewArray, 0);
}

@end