@interface BCActionsListViewController
- (BCActionsListViewController)initWithActionItems:(id)a3 brandedHeaderDelegate:(id)a4;
- (BCActionsListViewController)initWithCoder:(id)a3;
- (BCActionsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BCActionsListViewController)initWithStyle:(int64_t)a3;
- (BCBrandedHeaderViewControllerDelegate)brandedHeaderDelegate;
- (BCSBusinessItem)businessItem;
- (BOOL)initialTableLoadCompleted;
- (BOOL)lastActionItemPendingUpdate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CGSize)contentSize;
- (NSArray)actionItems;
- (NSArray)itemsToAdd;
- (UIImageView)headerImageView;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)cellSeparatorHeight;
- (double)maxActionCellHeight;
- (double)maxHeaderCellHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_computeMaxHeights;
- (void)_handleSizeClassDidChange;
- (void)_replaceActionItem:(id)a3 atIndex:(unint64_t)a4 reloadRowImmediately:(BOOL)a5;
- (void)_sizeAndLoadTable;
- (void)addActionItems:(id)a3;
- (void)dealloc;
- (void)reloadHeader;
- (void)reloadHeaderIcon;
- (void)replaceLastActionItem:(id)a3 reloadRowImmediately:(BOOL)a4;
- (void)setActionItems:(id)a3;
- (void)setBusinessItem:(id)a3;
- (void)setHeaderImageView:(id)a3;
- (void)setInitialTableLoadCompleted:(BOOL)a3;
- (void)setItemsToAdd:(id)a3;
- (void)setLastActionItemPendingUpdate:(BOOL)a3;
- (void)setMaxActionCellHeight:(double)a3;
- (void)setMaxHeaderCellHeight:(double)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateActionListViewWithAnimation;
- (void)updateContentIfNecessary;
- (void)updateLastActionItemWithAnimationIfNecessary;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BCActionsListViewController

- (BCActionsListViewController)initWithActionItems:(id)a3 brandedHeaderDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCActionsListViewController;
  v9 = [(BCActionsListViewController *)&v12 initWithStyle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionItems, a3);
    objc_storeWeak((id *)&v10->_brandedHeaderDelegate, v8);
  }

  return v10;
}

- (BCActionsListViewController)initWithStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCActionsListViewController;
  return [(BCActionsListViewController *)&v4 initWithStyle:a3];
}

- (BCActionsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BCActionsListViewController;
  return [(BCActionsListViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (BCActionsListViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCActionsListViewController;
  return [(BCActionsListViewController *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  v3 = [(BCActionsListViewController *)self traitChangeRegistration];

  if (v3)
  {
    objc_super v4 = [(BCActionsListViewController *)self traitChangeRegistration];
    [(BCActionsListViewController *)self unregisterForTraitChanges:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)BCActionsListViewController;
  [(BCActionsListViewController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCActionsListViewController;
  [(BCActionsListViewController *)&v4 viewWillAppear:a3];
  [(BCActionsListViewController *)self _sizeAndLoadTable];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)BCActionsListViewController;
  [(BCActionsListViewController *)&v20 viewDidLoad];
  v3 = [(BCActionsListViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = +[BCAlertHeaderTableViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  v6 = [(BCActionsListViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellWithTitleAndIcon"];

  id v7 = [(BCActionsListViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellWithTitleSubTitleAndIcon"];

  id v8 = [(BCActionsListViewController *)self tableView];
  [v8 setScrollEnabled:1];

  v9 = [(BCActionsListViewController *)self tableView];
  [v9 setShowsVerticalScrollIndicator:1];

  v10 = [(BCActionsListViewController *)self tableView];
  [v10 setUserInteractionEnabled:1];

  v11 = [(BCActionsListViewController *)self tableView];
  [v11 setBounces:0];

  objc_super v12 = +[UIColor clearColor];
  v13 = [(BCActionsListViewController *)self tableView];
  [v13 setBackgroundColor:v12];

  v14 = [(BCActionsListViewController *)self tableView];
  [v14 setRowHeight:UITableViewAutomaticDimension];

  v15 = [(BCActionsListViewController *)self tableView];
  [v15 setEstimatedRowHeight:UITableViewAutomaticDimension];

  v16 = self;
  v21[0] = v16;
  v17 = self;
  v21[1] = v17;
  v18 = +[NSArray arrayWithObjects:v21 count:2];
  v19 = [(BCActionsListViewController *)self registerForTraitChanges:v18 withAction:"_handleSizeClassDidChange"];
  [(BCActionsListViewController *)self setTraitChangeRegistration:v19];

  [(BCActionsListViewController *)self _handleSizeClassDidChange];
}

- (void)_sizeAndLoadTable
{
  [(BCActionsListViewController *)self contentSize];
  -[BCActionsListViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  id v3 = [(BCActionsListViewController *)self tableView];
  [v3 reloadData];
}

- (void)_handleSizeClassDidChange
{
  if ([(BCActionsListViewController *)self initialTableLoadCompleted])
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_sizeAndLoadTable" object:0];
    [(BCActionsListViewController *)self performSelector:"_sizeAndLoadTable" withObject:0 afterDelay:0.1];
  }
  else
  {
    [(BCActionsListViewController *)self setInitialTableLoadCompleted:1];
    [(BCActionsListViewController *)self _sizeAndLoadTable];
  }
}

- (void)_computeMaxHeights
{
  id v3 = [(BCActionsListViewController *)self tableView];
  [v3 frame];
  double v5 = v4;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(BCActionsListViewController *)self actionItems];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 actionType] == (id)1)
        {
          v14 = [(BCActionsListViewController *)self businessItem];
          +[BCAlertHeaderTableViewCell heightForBusinessItem:v14 forWidth:v5];
          double v16 = v15;

          if (v16 > v10) {
            double v10 = v16;
          }
        }
        else if ([v13 actionType] == (id)2)
        {
          +[BCAlertActionTableViewCell heightForActionItem:v13 forWidth:v5];
          if (v17 > v11) {
            double v11 = v17;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }

  self->_maxHeaderCellHeight = v10;
  self->_maxActionCellHeight = v11;
}

- (CGSize)contentSize
{
  id v3 = [(BCActionsListViewController *)self tableView];
  [v3 frame];
  double v5 = v4;

  [(BCActionsListViewController *)self _computeMaxHeights];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = [(BCActionsListViewController *)self actionItems];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = [v12 actionType];
        v14 = &OBJC_IVAR___BCActionsListViewController__maxHeaderCellHeight;
        if (v13 == (id)1
          || (id v15 = [v12 actionType],
              double v16 = 0.0,
              v14 = &OBJC_IVAR___BCActionsListViewController__maxActionCellHeight,
              v15 == (id)2))
        {
          double v16 = *(double *)((char *)&self->super.super.super.super.isa + *v14);
        }
        double v10 = v10 + v16;
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  [(BCActionsListViewController *)self cellSeparatorHeight];
  double v18 = v17;
  long long v19 = [(BCActionsListViewController *)self actionItems];
  unsigned int v20 = [v19 count];

  double v21 = v10 - v18 * (double)(int)(v20 - 1);
  double v22 = v5;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BCActionsListViewController;
  id v7 = a4;
  -[BCActionsListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000036DC;
  v9[3] = &unk_100010370;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000036E4;
  v8[3] = &unk_100010370;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (double)cellSeparatorHeight
{
  v2 = [(BCActionsListViewController *)self tableView];
  id v3 = [v2 window];
  double v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;

  if (v6 > 0.0) {
    return 1.0 / v6;
  }
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  return v9;
}

- (void)reloadHeader
{
  id v3 = +[NSIndexPath indexPathForRow:0 inSection:0];
  double v4 = [(BCActionsListViewController *)self actionItems];
  double v5 = [v4 objectAtIndex:[v3 row]];

  if ([v5 actionType] == (id)1)
  {
    double v6 = [(BCActionsListViewController *)self tableView];
    double v8 = v3;
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [v6 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
  }
}

- (void)reloadHeaderIcon
{
  id v3 = [(BCActionsListViewController *)self actionItems];
  id v9 = [v3 firstObject];

  double v4 = v9;
  if (v9)
  {
    double v5 = [(BCActionsListViewController *)self actionItems];
    id v6 = [v5 count];

    double v4 = v9;
    if ((unint64_t)v6 >= 2)
    {
      id v7 = [v9 icon];
      double v8 = [(BCActionsListViewController *)self headerImageView];
      [v8 setImage:v7];

      double v4 = v9;
    }
  }
}

- (void)replaceLastActionItem:(id)a3 reloadRowImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BCActionsListViewController *)self actionItems];
  -[BCActionsListViewController _replaceActionItem:atIndex:reloadRowImmediately:](self, "_replaceActionItem:atIndex:reloadRowImmediately:", v6, (char *)[v7 count] - 1, v4);

  [(BCActionsListViewController *)self setLastActionItemPendingUpdate:1];
}

- (void)_replaceActionItem:(id)a3 atIndex:(unint64_t)a4 reloadRowImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(BCActionsListViewController *)self actionItems];
  id v10 = [v9 mutableCopy];

  if ((unint64_t)[v10 count] > a4) {
    [v10 replaceObjectAtIndex:a4 withObject:v8];
  }
  id v11 = [v10 copy];
  [(BCActionsListViewController *)self setActionItems:v11];

  [(BCActionsListViewController *)self contentSize];
  -[BCActionsListViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  if (v5)
  {
    objc_super v12 = +[NSIndexPath indexPathForRow:a4 inSection:0];
    id v13 = [(BCActionsListViewController *)self tableView];
    id v15 = v12;
    v14 = +[NSArray arrayWithObjects:&v15 count:1];
    [v13 reloadRowsAtIndexPaths:v14 withRowAnimation:0];
  }
}

- (void)updateContentIfNecessary
{
  [(BCActionsListViewController *)self contentSize];

  -[BCActionsListViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)addActionItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCActionsListViewController *)self actionItems];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];
  [(BCActionsListViewController *)self setActionItems:v6];

  [(BCActionsListViewController *)self setItemsToAdd:v4];

  [(BCActionsListViewController *)self updateContentIfNecessary];
}

- (void)setBusinessItem:(id)a3
{
  if (a3 && !self->_businessItem)
  {
    objc_storeStrong((id *)&self->_businessItem, a3);
    [(BCActionsListViewController *)self updateContentIfNecessary];
  }

  _objc_release_x1();
}

- (void)updateLastActionItemWithAnimationIfNecessary
{
  if ([(BCActionsListViewController *)self lastActionItemPendingUpdate])
  {
    [(BCActionsListViewController *)self setLastActionItemPendingUpdate:0];
    id v3 = [(BCActionsListViewController *)self actionItems];
    id v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v3 count] - 1, 0);

    BOOL v5 = [(BCActionsListViewController *)self tableView];
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 reloadRowsAtIndexPaths:v6 withRowAnimation:0];
  }
}

- (void)updateActionListViewWithAnimation
{
  id v3 = [(BCActionsListViewController *)self itemsToAdd];
  id v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(BCActionsListViewController *)self itemsToAdd];
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [(BCActionsListViewController *)self itemsToAdd];
    id v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = +[NSIndexPath indexPathForRow:v8 inSection:0];
        [v13 addObject:v9];

        ++v8;
        id v10 = [(BCActionsListViewController *)self itemsToAdd];
        id v11 = [v10 count];
      }
      while (v8 < (unint64_t)v11);
    }
    objc_super v12 = [(BCActionsListViewController *)self tableView];
    [v12 insertRowsAtIndexPaths:v13 withRowAnimation:0];

    [(BCActionsListViewController *)self setItemsToAdd:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(BCActionsListViewController *)self actionItems];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(BCActionsListViewController *)self actionItems];
  id v9 = [v8 objectAtIndex:[v7 row]];

  if ([v9 actionType] == (id)2)
  {
    id v10 = +[BCAlertActionTableViewCell reuseIdentifierForItem:v9];
    id v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

    objc_super v12 = [v9 title];
    id v13 = [v11 titleLabel];
    [v13 setText:v12];

    v14 = [v9 subTitle];
    id v15 = [v11 subTitleLabel];
    [v15 setText:v14];

    double v16 = [v9 icon];
    double v17 = [v11 mainImageView];
    [v17 setImage:v16];
  }
  else if ([v9 actionType] == (id)1)
  {
    double v18 = +[BCAlertHeaderTableViewCell reuseIdentifier];
    id v11 = [v6 dequeueReusableCellWithIdentifier:v18 forIndexPath:v7];

    long long v19 = [(BCActionsListViewController *)self businessItem];
    unsigned int v20 = [(BCActionsListViewController *)self brandedHeaderDelegate];
    [v11 updateContentViewUsingBusinessItem:v19 brandedHeaderDelegate:v20];

    double v21 = [v11 mainImageView];
    [(BCActionsListViewController *)self setHeaderImageView:v21];
  }
  else
  {
    id v11 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"defaultCellIdentifier"];
  }

  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(BCActionsListViewController *)self actionItems];
  id v7 = [v5 row];

  id v10 = [v6 objectAtIndex:v7];

  unint64_t v8 = [v10 handler];

  if (v8)
  {
    id v9 = [v10 handler];
    ((void (**)(void, id))v9)[2](v9, v10);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(BCActionsListViewController *)self tableView];
  [v6 frame];
  double v8 = v7;

  [(BCActionsListViewController *)self maxHeaderCellHeight];
  if (v9 == 0.0)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(BCActionsListViewController *)self maxActionCellHeight];
    BOOL v11 = v10 != 0.0;
  }
  objc_super v12 = [(BCActionsListViewController *)self actionItems];
  id v13 = [v5 row];

  v14 = [v12 objectAtIndex:v13];

  if ([v14 actionType] == (id)1)
  {
    if (!v11)
    {
      double v17 = [(BCActionsListViewController *)self businessItem];
      +[BCAlertHeaderTableViewCell heightForBusinessItem:v17 forWidth:v8];
      double v16 = v18;

      goto LABEL_13;
    }
    uint64_t v15 = 56;
    goto LABEL_10;
  }
  double v16 = 0.0;
  if ([v14 actionType] == (id)2)
  {
    if (!v11)
    {
      +[BCAlertActionTableViewCell heightForActionItem:v14 forWidth:v8];
      double v16 = v19;
      goto LABEL_13;
    }
    uint64_t v15 = 64;
LABEL_10:
    double v16 = *(double *)((char *)&self->super.super.super.super.isa + v15);
  }
LABEL_13:

  return v16;
}

- (NSArray)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
}

- (BCSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (NSArray)itemsToAdd
{
  return self->_itemsToAdd;
}

- (void)setItemsToAdd:(id)a3
{
}

- (BOOL)lastActionItemPendingUpdate
{
  return self->_lastActionItemPendingUpdate;
}

- (void)setLastActionItemPendingUpdate:(BOOL)a3
{
  self->_lastActionItemPendingUpdate = a3;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
}

- (BOOL)initialTableLoadCompleted
{
  return self->_initialTableLoadCompleted;
}

- (void)setInitialTableLoadCompleted:(BOOL)a3
{
  self->_initialTableLoadCompleted = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (double)maxHeaderCellHeight
{
  return self->_maxHeaderCellHeight;
}

- (void)setMaxHeaderCellHeight:(double)a3
{
  self->_maxHeaderCellHeight = a3;
}

- (double)maxActionCellHeight
{
  return self->_maxActionCellHeight;
}

- (void)setMaxActionCellHeight:(double)a3
{
  self->_maxActionCellHeight = a3;
}

- (BCBrandedHeaderViewControllerDelegate)brandedHeaderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brandedHeaderDelegate);

  return (BCBrandedHeaderViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_brandedHeaderDelegate);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_itemsToAdd, 0);
  objc_storeStrong((id *)&self->_businessItem, 0);

  objc_storeStrong((id *)&self->_actionItems, 0);
}

@end