@interface MAListSnippetView
- (BOOL)_checkAllItemsHaveSameTitle;
- (BOOL)isDisplayForSAR;
- (BOOL)shouldDisplayLocationDetail;
- (BOOL)showDisclosureIndicatorInCells;
- (CLLocation)userLocation;
- (MAListSnippetView)initWithFrame:(CGRect)a3 mapItems:(id)a4;
- (MAListSnippetViewDelegate)delegate;
- (NSArray)mapItems;
- (double)_preferredHeightForRow:(int64_t)a3;
- (double)desiredHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_mapItemForRow:(int64_t)a3;
- (id)_prepareTableViewCellForRow:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleTap:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDisplayForSAR:(BOOL)a3;
- (void)setShouldDisplayLocationDetail:(BOOL)a3;
- (void)setShowDisclosureIndicatorInCells:(BOOL)a3;
- (void)setUserLocation:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation MAListSnippetView

- (MAListSnippetView)initWithFrame:(CGRect)a3 mapItems:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MAListSnippetView;
  v10 = -[MAListSnippetView initWithFrame:](&v33, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = (NSArray *)[v9 copy];
    mapItems = v10->_mapItems;
    v10->_mapItems = v11;

    userLocation = v10->_userLocation;
    v10->_userLocation = 0;

    id v28 = v9;
    if ((unint64_t)[v9 count] < 2) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = [(MAListSnippetView *)v10 _checkAllItemsHaveSameTitle];
    }
    v10->_sameTitleForAllResults = v14;
    v15 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v10->_tableView;
    v10->_tableView = v15;

    [(UITableView *)v10->_tableView setScrollEnabled:0];
    [(UITableView *)v10->_tableView setSeparatorStyle:1];
    [(UITableView *)v10->_tableView setBackgroundView:0];
    [(UITableView *)v10->_tableView setOpaque:0];
    [(UITableView *)v10->_tableView _ma_updateSemanticContentAttribute];
    [(MAListSnippetView *)v10 addSubview:v10->_tableView];
    [(MAListSnippetView *)v10 setOpaque:0];
    v17 = +[UIColor clearColor];
    [(UITableView *)v10->_tableView setBackgroundColor:v17];

    [(UITableView *)v10->_tableView setDelegate:v10];
    [(UITableView *)v10->_tableView setDataSource:v10];
    [(UITableView *)v10->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[UIColor clearColor];
    [(MAListSnippetView *)v10 _mapkit_setBackgroundColor:v18];

    v19 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = [&off_43FD8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(&off_43FD8);
          }
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v25 = _NSDictionaryOfVariableBindings(@"_tableView", v10->_tableView, 0);
          v26 = +[NSLayoutConstraint constraintsWithVisualFormat:v24 options:0 metrics:0 views:v25];
          [v19 addObjectsFromArray:v26];
        }
        id v21 = [&off_43FD8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v21);
    }
    +[NSLayoutConstraint activateConstraints:v19];

    id v9 = v28;
  }

  return v10;
}

- (void)dealloc
{
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)MAListSnippetView;
  [(MAListSnippetView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MAListSnippetView;
  [(MAListSnippetView *)&v7 layoutSubviews];
  objc_super v3 = [(MAListSnippetView *)self superview];
  [v3 frame];
  double v5 = v4;
  [(MAListSnippetView *)self desiredHeight];
  -[UITableView setFrame:](self->_tableView, "setFrame:", 0.0, 0.0, v5, v6);
}

- (CLLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  id v5 = a3;
  if ((-[CLLocation isEqual:](self->_userLocation, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userLocation, a3);
    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)setShowDisclosureIndicatorInCells:(BOOL)a3
{
  if (self->_showDisclosureIndicatorInCells != a3)
  {
    self->_showDisclosureIndicatorInCells = a3;
    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)setDisplayForSAR:(BOOL)a3
{
  if (self->_displayForSAR != a3)
  {
    self->_displayForSAR = a3;
    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)setShouldDisplayLocationDetail:(BOOL)a3
{
  if (self->_shouldDisplayLocationDetail != a3)
  {
    self->_shouldDisplayLocationDetail = a3;
    [(UITableView *)self->_tableView reloadData];
  }
}

- (BOOL)_checkAllItemsHaveSameTitle
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v3 = self->_mapItems;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    double v6 = 0;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [(NSArray *)self->_mapItems firstObject];

        if (v9 == v10)
        {
          uint64_t v14 = [v9 label];

          double v6 = (void *)v14;
        }
        else
        {
          v11 = [v9 label];
          v12 = v11;
          if (v6)
          {
            unsigned __int8 v13 = [v11 isEqualToString:v6];

            if ((v13 & 1) == 0) {
              goto LABEL_15;
            }
          }
          else
          {

            if (v12)
            {
LABEL_15:
              BOOL v15 = 0;
              goto LABEL_18;
            }
          }
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v6 = 0;
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

- (id)_prepareTableViewCellForRow:(int64_t)a3
{
  id v5 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"MAListSnippetTableViewCell"];
  if (!v5)
  {
    id v5 = [[MAListSnippetTableViewCell alloc] initWithReuseIdentifier:@"MAListSnippetTableViewCell"];
    double v6 = [(MAListSnippetTableViewCell *)v5 backgroundView];
    [v6 setContentMode:5];

    [(MAListSnippetTableViewCell *)v5 setOpaque:0];
    uint64_t v7 = [(MAListSnippetTableViewCell *)v5 resultView];
    objc_msgSend(v7, "_mapkit_setTarget:action:", self, "_handleTap:");
  }
  v8 = +[UIColor clearColor];
  [(MAListSnippetTableViewCell *)v5 _mapkit_setBackgroundColor:v8];

  id v9 = [(MAListSnippetView *)self _mapItemForRow:a3];
  v10 = [(MAListSnippetTableViewCell *)v5 resultView];
  [v10 setReferenceLocation:self->_userLocation];
  [v10 setMapItem:v9];
  BOOL v11 = (a3 & 0x8000000000000000) == 0 && (char *)[(NSArray *)self->_mapItems count] - 1 == (unsigned char *)a3;
  [v10 setHideBottomKeyline:v11];
  BOOL v12 = [(MAListSnippetView *)self shouldDisplayLocationDetail]
     || self->_sameTitleForAllResults;
  [v10 setLocationDetailPreferred:v12];
  [v10 setBlockOnButtonTappedForSARResult:0];
  if ([(MAListSnippetView *)self isDisplayForSAR])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_134A8;
    v15[3] = &unk_3D2B0;
    v15[4] = self;
    [v10 setBlockOnButtonTappedForSARResult:v15];
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v10 setDisplayFormat:v13];

  return v5;
}

- (id)_mapItemForRow:(int64_t)a3
{
  if (a3 < 0)
  {
    double v6 = 0;
  }
  else
  {
    if ([(NSArray *)self->_mapItems count] <= a3)
    {
      double v6 = 0;
    }
    else
    {
      double v6 = [(NSArray *)self->_mapItems objectAtIndex:a3];
    }
  }
  return v6;
}

- (double)_preferredHeightForRow:(int64_t)a3
{
  uint64_t v3 = [(MAListSnippetView *)self _mapItemForRow:a3];
  +[MAResultView preferredHeightForMapItem:v3];
  double v5 = v4;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "row", a3);

  return [(MAListSnippetView *)self _prepareTableViewCellForRow:v5];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "row", a3);

  [(MAListSnippetView *)self _preferredHeightForRow:v5];
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_mapItems count];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  id v5 = +[UIColor clearColor];
  [v6 setBackgroundColor:v5];

  [v6 setSeparatorStyle:0];
}

- (void)_handleTap:(id)a3
{
  id v5 = [a3 mapItem];
  double v4 = [(MAListSnippetView *)self delegate];
  [v4 listView:self didChooseMapItem:v5 accessoryButtonTapped:0];
}

- (double)desiredHeight
{
  double v3 = (double)[(NSArray *)self->_mapItems count];
  [(MAListSnippetView *)self _preferredHeightForRow:0];
  return v4 * v3;
}

- (BOOL)showDisclosureIndicatorInCells
{
  return self->_showDisclosureIndicatorInCells;
}

- (BOOL)shouldDisplayLocationDetail
{
  return self->_shouldDisplayLocationDetail;
}

- (BOOL)isDisplayForSAR
{
  return self->_displayForSAR;
}

- (MAListSnippetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MAListSnippetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userLocation, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end