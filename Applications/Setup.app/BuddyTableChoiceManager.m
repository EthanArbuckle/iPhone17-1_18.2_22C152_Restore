@interface BuddyTableChoiceManager
- (BOOL)allowManualRowHeight;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)wantsNextButton;
- (BuddyChoice)selectedChoice;
- (BuddyTableChoiceManager)initWithCellConstructor:(id)a3 allowManualRowHeight:(BOOL)a4;
- (NSIndexPath)selectedChoiceIndexPath;
- (UIView)footerView;
- (double)fixedRowHeight;
- (double)heightForFooterInTableView:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)cellConstructor;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableViewDataSource;
- (id)tableViewDelegate;
- (id)viewForFooterInTableView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateSelectedChoiceCheckmarkWithtableView:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4;
- (void)setAllowManualRowHeight:(BOOL)a3;
- (void)setCellConstructor:(id)a3;
- (void)setChoices:(id)a3;
- (void)setFixedRowHeight:(double)a3;
- (void)setFooterView:(id)a3;
- (void)setSelectedChoice:(id)a3;
- (void)setSelectedChoiceIndex:(id)a3 tableView:(id)a4;
- (void)setSelectedChoiceIndexPath:(id)a3;
- (void)setWantsNextButton:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation BuddyTableChoiceManager

- (BuddyTableChoiceManager)initWithCellConstructor:(id)a3 allowManualRowHeight:(BOOL)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  id v5 = v14;
  id v14 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)BuddyTableChoiceManager;
  v6 = [(BuddyTableChoiceManager *)&v11 init];
  id v14 = v6;
  objc_storeStrong(&v14, v6);
  if (v6)
  {
    id v7 = objc_retainBlock(location[0]);
    v8 = (void *)*((void *)v14 + 9);
    *((void *)v14 + 9) = v7;

    *((unsigned char *)v14 + 33) = v12;
  }
  v9 = (BuddyTableChoiceManager *)v14;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v9;
}

- (void)setSelectedChoiceIndex:(id)a3 tableView:(id)a4
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v5 = [(BuddyChoiceManager *)v23 choices];
  id v6 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", [location[0] section]);
  id v20 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(location[0], "row"));

  char v19 = [(BuddyTableChoiceManager *)v23 wantsNextButton];
  if (v23->_selectedChoice && (v19 & 1) != 0)
  {
    id v18 = [v21 cellForRowAtIndexPath:v23->_selectedChoiceIndexPath];
    [v18 setAccessoryType:0];
    id v7 = [v18 textLabel];
    id v8 = +[UIColor _labelColor];
    [v7 setTextColor:v8];

    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong((id *)&v23->_selectedChoiceIndexPath, location[0]);
  objc_storeStrong((id *)&v23->_selectedChoice, v20);
  if (v19) {
    [(BuddyTableChoiceManager *)v23 _updateSelectedChoiceCheckmarkWithtableView:v21];
  }
  objc_initWeak(&from, v23);
  id v9 = v20;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_1000712A8;
  id v14 = &unk_1002B1500;
  objc_copyWeak(&v16, &from);
  v15 = v23;
  [v9 runConfirmationIfNeededCompletion:&v10];
  objc_storeStrong((id *)&v15, 0);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateSelectedChoiceCheckmarkWithtableView:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v8->_selectedChoice)
  {
    id v6 = [(BuddyTableChoiceManager *)v8 selectedChoiceIndexPath];
    if (v6)
    {
      id v5 = [location[0] cellForRowAtIndexPath:v6];
      [v5 setAccessoryType:3];
      id v3 = [v5 textLabel];
      id v4 = +[UIColor tableCellBlueTextColor];
      [v3 setTextColor:v4];

      [v5 setNeedsLayout];
      objc_storeStrong(&v5, 0);
    }
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyChoiceManager *)v7 choices];
  NSUInteger v4 = [(NSArray *)v3 count];

  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v9 = a4;
  id v5 = [(BuddyChoiceManager *)v11 choices];
  id v6 = [(NSArray *)v5 objectAtIndexedSubscript:v9];
  id v7 = [v6 count];

  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v5 = +[BFFStyle sharedStyle];
  [v5 applyThemeToTableCell:location[0]];

  id v6 = [location[0] textLabel];
  [v6 setLineBreakMode:0];

  id v7 = [location[0] textLabel];
  [v7 setNumberOfLines:0];

  id v8 = [location[0] textLabel];
  int64_t v9 = [(BuddyChoiceManager *)v21 choices];
  id v10 = -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", [v19 section]);
  id v11 = [v10 objectAtIndexedSubscript:[v19 row]];
  id v12 = [v11 title];
  [v8 setText:v12];

  char v17 = 0;
  BOOL v13 = 0;
  if ([(BuddyTableChoiceManager *)v21 wantsNextButton])
  {
    id v14 = [v19 row];
    id v18 = [(BuddyTableChoiceManager *)v21 selectedChoiceIndexPath];
    char v17 = 1;
    BOOL v13 = v14 == (id)[(NSIndexPath *)v18 row];
  }
  if (v17) {

  }
  if (v13)
  {
    [location[0] setAccessoryType:3];
    id v15 = [location[0] textLabel];
    id v16 = +[UIColor tableCellBlueTextColor];
    [v15 setTextColor:v16];
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [v8 setSeparatorStyle:1];
  [v8 _setShouldHaveFullLengthTopSeparator:0];
  [v8 _setShouldHaveFullLengthBottomSeparator:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  char v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v5 = [(BuddyTableChoiceManager *)v17 cellConstructor];

  if (v5)
  {
    id v6 = (uint64_t (**)(id, id, id, const __CFString *))[(BuddyTableChoiceManager *)v17 cellConstructor];
    id v7 = location[0];
    id v8 = [(BuddyChoiceManager *)v17 choices];
    id v9 = -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", [v15 section]);
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v15, "row"));
    id v18 = (id)v6[2](v6, v7, v10, @"com.apple.buddyTableChoice.cell");

    int v14 = 1;
  }
  else
  {
    id v13 = [location[0] dequeueReusableCellWithIdentifier:@"com.apple.buddyTableChoice.cell"];
    if (!v13)
    {
      id v13 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"com.apple.buddyTableChoice.cell"];
    }
    [(BuddyTableChoiceManager *)v17 configureCell:v13 atIndexPath:v15];
    id v18 = v13;
    int v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v11 = v18;

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v5 = [(BuddyTableChoiceManager *)v20 tableView:location[0] cellForRowAtIndexPath:v18];
  [v5 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v7 = v6;

  double v17 = v7;
  if ([(BuddyTableChoiceManager *)v20 allowManualRowHeight])
  {
    [(BuddyTableChoiceManager *)v20 fixedRowHeight];
    if (v7 <= v8) {
      [(BuddyTableChoiceManager *)v20 fixedRowHeight];
    }
    else {
      CGFloat v9 = UITableViewAutomaticDimension;
    }
    double v21 = v9;
  }
  else
  {
    id v10 = +[BFFStyle sharedStyle];
    [v10 tallRowHeight];
    double v12 = v11;

    if (v17 <= v12)
    {
      id v13 = +[BFFStyle sharedStyle];
      [v13 tallRowHeight];
      [location[0] setEstimatedRowHeight:];

      id v14 = +[BFFStyle sharedStyle];
      [v14 tallRowHeight];
      double v21 = v15;
    }
    else
    {
      double v21 = UITableViewAutomaticDimension;
    }
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyTableChoiceManager *)v7 setSelectedChoiceIndex:v5 tableView:location[0]];
  [location[0] deselectRowAtIndexPath:v5 animated:1];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setChoices:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyChoiceManager *)v20 choices];
  NSUInteger v4 = (NSArray *)location[0];

  if (v3 != v4)
  {
    memset(__b, 0, sizeof(__b));
    id v5 = v20->super._choices;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:__b objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(v5);
          }
          id v18 = *(id *)(__b[1] + 8 * i);
          [v18 makeObjectsPerformSelector:"setChoiceController:" withObject:0];
        }
        id v6 = [(NSArray *)v5 countByEnumeratingWithState:__b objects:v22 count:16];
      }
      while (v6);
    }

    objc_storeStrong((id *)&v20->super._choices, location[0]);
    memset(v15, 0, sizeof(v15));
    CGFloat v9 = v20->super._choices;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:v15 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15[2];
      do
      {
        for (unint64_t j = 0; j < (unint64_t)v10; ++j)
        {
          if (*(void *)v15[2] != v11) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(v15[1] + 8 * j);
          id v13 = v16;
          id v14 = [(BuddyChoiceManager *)v20 chooseableDelegate];
          [v13 makeObjectsPerformSelector:"setChoiceController:" withObject:v14];
        }
        id v10 = [(NSArray *)v9 countByEnumeratingWithState:v15 objects:v21 count:16];
      }
      while (v10);
    }
  }
  objc_storeStrong(location, 0);
}

- (id)viewForFooterInTableView:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyTableChoiceManager *)v6 footerView];
  objc_storeStrong(location, 0);

  return v3;
}

- (double)heightForFooterInTableView:(id)a3
{
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyTableChoiceManager *)v8 footerView];
  -[UIView systemLayoutSizeFittingSize:](v3, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v5 = v4;

  objc_storeStrong(location, 0);
  return v5;
}

- (id)tableViewDataSource
{
  return self;
}

- (id)tableViewDelegate
{
  return self;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (double)fixedRowHeight
{
  return self->_fixedRowHeight;
}

- (void)setFixedRowHeight:(double)a3
{
  self->_fixedRowHeight = a3;
}

- (BuddyChoice)selectedChoice
{
  return self->_selectedChoice;
}

- (void)setSelectedChoice:(id)a3
{
}

- (NSIndexPath)selectedChoiceIndexPath
{
  return self->_selectedChoiceIndexPath;
}

- (void)setSelectedChoiceIndexPath:(id)a3
{
}

- (BOOL)wantsNextButton
{
  return self->_wantsNextButton;
}

- (void)setWantsNextButton:(BOOL)a3
{
  self->_wantsNextButton = a3;
}

- (id)cellConstructor
{
  return self->_cellConstructor;
}

- (void)setCellConstructor:(id)a3
{
}

- (BOOL)allowManualRowHeight
{
  return self->_allowManualRowHeight;
}

- (void)setAllowManualRowHeight:(BOOL)a3
{
  self->_allowManualRowHeight = a3;
}

- (void).cxx_destruct
{
}

@end