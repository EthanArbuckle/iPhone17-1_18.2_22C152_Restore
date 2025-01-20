@interface BuddyTableViewController
- (BFFLinkLabelFooterView)footerView;
- (BFFPaneHeaderView)headerView;
- (BOOL)isTitleAlignedByLastBaseline;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)useBottomEdgeInsetForTableView;
- (BOOL)useScreenFooter;
- (BOOL)useScreenHeader;
- (NSAttributedString)attributedSubTitleText;
- (NSString)subTitleText;
- (NSString)titleText;
- (UITableView)tableView;
- (double)heightForHeaderInTableView:(id)a3;
- (id)contentScrollView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)viewForHeaderInTableView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setAttributedSubTitleText:(id)a3;
- (void)setSubTitleText:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleText:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateHeaderView;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyTableViewController

- (void)loadView
{
  v2 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  containerView = self->_containerView;
  self->_containerView = v2;

  v4 = self->_containerView;
  id v5 = +[BFFStyle sharedStyle];
  id v6 = [v5 backgroundColor];
  [(UIView *)v4 setBackgroundColor:v6];

  [(BuddyTableViewController *)self setView:self->_containerView];
  v7 = [(BuddyTableViewController *)self tableView];
  LOBYTE(v4) = v7 == 0;

  if (v4)
  {
    v8 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = self->_tableView;
    self->_tableView = v8;
  }
  -[UITableView setDataSource:](self->_tableView, "setDataSource:");
  -[UITableView setDelegate:](self->_tableView, "setDelegate:");
  v10 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v10];

  [(UITableView *)self->_tableView setBackgroundView:0];
  [(UITableView *)self->_tableView setSeparatorStyle:0];
  id v11 = +[BFFStyle sharedStyle];
  id v12 = [v11 backgroundColor];
  [(UITableView *)self->_tableView setBackgroundColor:v12];

  id v13 = +[BFFStyle sharedStyle];
  [v13 edgeInsetsForTable:self->_tableView];
  uint64_t v33 = v14;
  uint64_t v34 = v15;
  uint64_t v35 = v16;
  uint64_t v36 = v17;

  double v18 = sub_10010BC60();
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v18, v19, v20, v21, *(void *)&v18, *(void *)&v19, *(void *)&v20, *(void *)&v21, *(void *)&v18, *(void *)&v19, *(void *)&v20, *(void *)&v21, v33, v34, v35, v36, a2);
  [(UITableView *)self->_tableView setClipsToBounds:0];
  [(UITableView *)self->_tableView setAlwaysBounceVertical:0];
  v22 = self->_containerView;
  id v23 = [(UITableView *)self->_tableView panGestureRecognizer];
  [(UIView *)v22 addGestureRecognizer:v23];

  [(UIView *)self->_containerView addSubview:self->_tableView];
  if ([(BuddyTableViewController *)self useScreenHeader])
  {
    id v24 = +[BFFStyle sharedStyle];
    id v25 = [v24 backgroundColor];
    v26 = [(BuddyTableViewController *)self headerView];
    [(BFFPaneHeaderView *)v26 setBackgroundColor:v25];

    v27 = self->_containerView;
    v28 = [(BuddyTableViewController *)self headerView];
    [(UIView *)v27 addSubview:v28];
  }
  if ([(BuddyTableViewController *)self useScreenFooter])
  {
    v29 = [objc_alloc((Class)BFFLinkLabelFooterView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    footerView = self->_footerView;
    self->_footerView = v29;

    id v31 = +[BFFStyle sharedStyle];
    id v32 = [v31 backgroundColor];
    [(BFFLinkLabelFooterView *)self->_footerView setBackgroundColor:v32];

    [(UIView *)self->_containerView addSubview:self->_footerView];
  }
  [(BuddyTableViewController *)self updateHeaderView];
}

- (void)viewDidLayoutSubviews
{
  v45 = self;
  SEL v44 = a2;
  v43.receiver = self;
  v43.super_class = (Class)BuddyTableViewController;
  [(BuddyTableViewController *)&v43 viewDidLayoutSubviews];
  long long v42 = 0u;
  long long v41 = 0u;
  [(UIView *)v45->_containerView bounds];
  *(void *)&long long v41 = v2;
  *(void *)&long long v42 = v3;
  id v4 = [(BuddyTableViewController *)v45 view];
  id v5 = [v4 safeAreaLayoutGuide];
  [v5 layoutFrame];
  __b[9] = v6;
  __b[8] = v7;
  __b[11] = v8;
  __b[10] = v9;
  *((void *)&v41 + 1) = v6;

  id v10 = [(BuddyTableViewController *)v45 view];
  id v11 = [v10 safeAreaLayoutGuide];
  [v11 layoutFrame];
  __b[5] = v12;
  __b[4] = v13;
  __b[7] = v14;
  __b[6] = v15;
  *((void *)&v42 + 1) = v14;

  memset(__b, 0, 0x20uLL);
  id v16 = +[BFFStyle sharedStyle];
  [v16 edgeInsetsForTable:v45->_tableView];
  __b[0] = v17;
  __b[1] = v18;
  __b[2] = v19;
  __b[3] = v20;

  if (BFFIsiPad())
  {
    *(double *)&long long v42 = *(double *)&v42 - (*(double *)&__b[1] + *(double *)&__b[3]);
    if ([(BuddyTableViewController *)v45 useBottomEdgeInsetForTableView]) {
      *((double *)&v42 + 1) = *((double *)&v42 + 1) - *(double *)&__b[2];
    }
    if ([(UITableView *)v45->_tableView _shouldReverseLayoutDirection])
    {
      [(UIView *)v45->_containerView bounds];
      double MaxX = CGRectGetMaxX(v46);
      v47.size.height = *((CGFloat *)&v42 + 1);
      *(void *)&v47.size.width = v42;
      v47.origin.y = *((CGFloat *)&v41 + 1);
      *(void *)&v47.origin.x = v41;
      *(double *)&long long v41 = MaxX - CGRectGetWidth(v47) - *(double *)&__b[1];
    }
    else
    {
      *(void *)&long long v41 = __b[1];
    }
  }
  -[UITableView setFrame:](v45->_tableView, "setFrame:", v41, v42);
  if (BFFIsiPad())
  {
    id v22 = +[BFFStyle sharedStyle];
    [v22 screenHeaderFooterSideInsetForView:v45->_containerView];
    double v24 = v23;

    if ([(BuddyTableViewController *)v45 useScreenHeader])
    {
      [(UIView *)v45->_containerView bounds];
      double v37 = v25;
      double v38 = v26 + v24 * -2.0;
      id v27 = +[BFFStyle sharedStyle];
      [v27 screenHeaderHeightForView:v45->_containerView];
      double v39 = v28;

      v29 = [(BuddyTableViewController *)v45 headerView];
      -[BFFPaneHeaderView setFrame:](v29, "setFrame:", v24, v37, v38, v39);

      v30 = [(BuddyTableViewController *)v45 tableView];
      [(UITableView *)v30 bounds];
      double v36 = v31;
      double v35 = v32;

      uint64_t v33 = [(BuddyTableViewController *)v45 headerView];
      -[BFFPaneHeaderView setBounds:](v33, "setBounds:", v35, v36, v38, v39);
    }
    if ([(BuddyTableViewController *)v45 useScreenFooter])
    {
      [(UIView *)v45->_containerView bounds];
      v48.size.width = v34 + v24 * -2.0;
      v48.origin.x = v24;
      -[BFFLinkLabelFooterView setFrame:](v45->_footerView, "setFrame:", v24, CGRectGetMaxY(v48) - *(double *)&__b[2], v48.size.width, *(double *)&__b[2]);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v15 = a3;
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v12.receiver = v14;
  v12.super_class = (Class)BuddyTableViewController;
  -[BuddyTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v15.width, v15.height);
  id v4 = location[0];
  tableView = v14->_tableView;
  uint64_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = sub_10010C2B0;
  id v10 = &unk_1002B3348;
  id v11 = v14;
  [v4 animateAlongsideTransitionInView:tableView animation:&v6 completion:&stru_1002B3368];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)contentScrollView
{
  return self->_tableView;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
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

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v5 = [(BuddyTableViewController *)v13 useScreenHeader];
  char v10 = 0;
  char v8 = 0;
  BOOL v6 = 0;
  if (v5)
  {
    id v11 = [(BuddyTableViewController *)v13 headerView];
    char v10 = 1;
    id v9 = [(BFFPaneHeaderView *)v11 bottomLineColor];
    char v8 = 1;
    BOOL v6 = 0;
    if (v9) {
      BOOL v6 = a4 == 0;
    }
  }
  BOOL v14 = !v6;
  if (v8) {

  }
  if (v10) {
  objc_storeStrong(location, 0);
  }
  return v14;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)viewForHeaderInTableView:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyTableViewController *)v6 useScreenHeader]) {
    id v7 = 0;
  }
  else {
    id v7 = [(BuddyTableViewController *)v6 headerView];
  }
  objc_storeStrong(location, 0);
  uint64_t v3 = v7;

  return v3;
}

- (double)heightForHeaderInTableView:(id)a3
{
  char v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [(BuddyTableViewController *)v8 headerView];
  [location[0] bounds];
  -[BFFPaneHeaderView heightForWidth:inView:](v3, "heightForWidth:inView:", location[0], CGRectGetWidth(v9), *(void *)&v9.origin.x, *(void *)&v9.origin.y, *(void *)&v9.size.width, *(void *)&v9.size.height);
  double v5 = v4;

  objc_storeStrong(location, 0);
  return v5;
}

- (BFFPaneHeaderView)headerView
{
  if (!self->_headerView)
  {
    uint64_t v2 = [objc_alloc((Class)BFFPaneHeaderView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a2];
    headerView = self->_headerView;
    self->_headerView = v2;
  }
  double v4 = self->_headerView;

  return v4;
}

- (void)updateHeaderView
{
  objc_super v12 = self;
  v11[1] = (id)a2;
  v11[0] = [(BuddyTableViewController *)self titleText];
  id v10 = [(BuddyTableViewController *)v12 subTitleText];
  id location = [(BuddyTableViewController *)v12 attributedSubTitleText];
  if ([v11[0] length] || objc_msgSend(v10, "length") || objc_msgSend(location, "length"))
  {
    uint64_t v2 = [(BuddyTableViewController *)v12 headerView];
    [(BFFPaneHeaderView *)v2 setTitleText:v11[0]];

    if ([location length])
    {
      uint64_t v3 = [(BuddyTableViewController *)v12 headerView];
      id v4 = [(BFFPaneHeaderView *)v3 detailTextLabel];
      [v4 setAttributedText:location];
    }
    else
    {
      uint64_t v3 = [(BuddyTableViewController *)v12 headerView];
      id v4 = [(BFFPaneHeaderView *)v3 detailTextLabel];
      [v4 setText:v10];
    }

    if ([(BuddyTableViewController *)v12 useScreenHeader])
    {
      double v5 = [(BuddyTableViewController *)v12 headerView];
      [(BFFPaneHeaderView *)v5 setNeedsLayout];
    }
    else
    {
      id v6 = [(BuddyTableViewController *)v12 tableView];
      id v7 = [(UITableView *)v6 superview];

      if (v7)
      {
        char v8 = [(BuddyTableViewController *)v12 tableView];
        [(UITableView *)v8 reloadData];
      }
    }
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
}

- (void)setTitleText:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_titleText)
  {
    objc_storeStrong((id *)&v4->_titleText, location[0]);
    if ([(BuddyTableViewController *)v4 isViewLoaded]) {
      [(BuddyTableViewController *)v4 updateHeaderView];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setSubTitleText:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_subTitleText)
  {
    objc_storeStrong((id *)&v4->_subTitleText, location[0]);
    if ([(BuddyTableViewController *)v4 isViewLoaded]) {
      [(BuddyTableViewController *)v4 updateHeaderView];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setAttributedSubTitleText:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_attributedSubTitleText)
  {
    objc_storeStrong((id *)&v4->_attributedSubTitleText, location[0]);
    if ([(BuddyTableViewController *)v4 isViewLoaded]) {
      [(BuddyTableViewController *)v4 updateHeaderView];
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isTitleAlignedByLastBaseline
{
  return 0;
}

- (BOOL)useBottomEdgeInsetForTableView
{
  return 0;
}

- (BOOL)useScreenHeader
{
  return 0;
}

- (BOOL)useScreenFooter
{
  return 0;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subTitleText
{
  return self->_subTitleText;
}

- (NSAttributedString)attributedSubTitleText
{
  return self->_attributedSubTitleText;
}

- (BFFLinkLabelFooterView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
}

@end