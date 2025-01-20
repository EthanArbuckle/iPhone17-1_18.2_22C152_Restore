@interface MobileTimerAssistantWorldClockSnippetController
- (BOOL)_canShowWhileLocked;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MobileTimerAssistantWorldClockSnippetController)initWithClockSnippet:(id)a3;
- (double)_cellHeight;
- (double)desiredHeightForWidth:(double)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)sashItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
@end

@implementation MobileTimerAssistantWorldClockSnippetController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MobileTimerAssistantWorldClockSnippetController)initWithClockSnippet:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MobileTimerAssistantWorldClockSnippetController;
  v5 = [(MobileTimerAssistantWorldClockSnippetController *)&v25 init];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = objc_alloc((Class)NSMutableArray);
    v7 = [v4 clocks];
    v8 = (NSMutableArray *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));
    clocks = v5->_clocks;
    v5->_clocks = v8;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = objc_msgSend(v4, "clocks", 0);
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v14);
          id v16 = objc_alloc((Class)SAClockObject);
          v17 = [v15 dictionary];
          id v18 = [v16 initWithDictionary:v17];

          [(NSMutableArray *)v5->_clocks addObject:v18];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    -[MobileTimerAssistantWorldClockSnippetController setDefaultViewInsets:](v5, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v19 = v5;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)MobileTimerAssistantWorldClockSnippetController;
  [(MobileTimerAssistantWorldClockSnippetController *)&v6 loadView];
  v3 = [(MobileTimerAssistantWorldClockSnippetController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[MobileTimerAssistantWorldClockSnippetCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];
}

- (double)_cellHeight
{
  +[MTUIWorldClockCellView defaultHeight];
  return result;
}

- (double)desiredHeightForWidth:(double)a3
{
  double v4 = (double)(unint64_t)[(NSMutableArray *)self->_clocks count];
  [(MobileTimerAssistantWorldClockSnippetController *)self _cellHeight];
  return v5 * v4;
}

- (id)sashItem
{
  id v2 = objc_alloc((Class)SiriUISashItem);
  id v3 = [v2 initWithApplicationBundleIdentifier:MTClockBundleID];

  return v3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return (int64_t)[(NSMutableArray *)self->_clocks count];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v8 = 0;
  }
  else
  {
    v9 = +[MobileTimerAssistantWorldClockSnippetCell reuseIdentifier];
    v8 = [v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

    v10 = -[NSMutableArray objectAtIndex:](self->_clocks, "objectAtIndex:", [v7 row]);
    [v8 setClock:v10];
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  double v5 = +[NSURL mtURLForClockAppSection:](NSURL, "mtURLForClockAppSection:", 0, a4);
  id v6 = +[NAScheduler mtMainThreadScheduler];
  id v7 = [v5 reschedule:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6C98;
  v9[3] = &unk_105A0;
  v9[4] = self;
  id v8 = [v7 addSuccessBlock:v9];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = [(MobileTimerAssistantWorldClockSnippetController *)self delegate];
  [v6 siriViewControllerExpectedWidth:self];
  double v8 = v7;
  [(MobileTimerAssistantWorldClockSnippetController *)self _cellHeight];
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
}

@end