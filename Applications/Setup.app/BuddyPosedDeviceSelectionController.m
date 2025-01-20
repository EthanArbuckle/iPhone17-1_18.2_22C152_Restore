@interface BuddyPosedDeviceSelectionController
- (BOOL)_buttonTrayInlined;
- (BuddyPosedDeviceSelectionView)selectionView;
- (NSLayoutConstraint)contentViewTopConstraint;
- (double)_contentViewHeight;
- (double)_headerToContentPadding;
- (double)_landscapeDefaultSize;
- (double)_portraitDefaultHeight;
- (id)selectionViewHeightChangeBlock;
- (void)_setPosedViewToBoundedHeight:(double)a3 animated:(BOOL)a4;
- (void)_setPosedViewToBoundedHeight:(double)a3 animated:(BOOL)a4 requireLayout:(BOOL)a5;
- (void)didSelectSegment:(int64_t)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setSelectionView:(id)a3;
- (void)setSelectionViewHeightChangeBlock:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyPosedDeviceSelectionController

- (void)viewDidLoad
{
  v44 = self;
  SEL v43 = a2;
  v42.receiver = self;
  v42.super_class = (Class)BuddyPosedDeviceSelectionController;
  [(BuddyPosedDeviceSelectionController *)&v42 viewDidLoad];
  v2 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  [(BuddyPosedDeviceSelectionView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  v3 = v44;
  v4 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  [(BuddyPosedDeviceSelectionView *)v4 setDelegate:v3];

  id v5 = [(BuddyPosedDeviceSelectionController *)v44 contentView];
  v6 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  [v5 addSubview:v6];

  id v7 = +[BYDevice currentDevice];
  if (objc_msgSend(v7, "posedDeviceSelection_largeSizeDevice")) {
    int v8 = 57;
  }
  else {
    int v8 = 37;
  }
  double v9 = (double)v8;

  double v41 = v9;
  id v10 = +[BYDevice currentDevice];
  id v11 = [v10 size];

  if (v11 == (id)2) {
    double v41 = 16.0;
  }
  v12 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  id v13 = [(BuddyPosedDeviceSelectionView *)v12 topAnchor];
  id v14 = [(BuddyPosedDeviceSelectionController *)v44 headerView];
  id v15 = [v14 bottomAnchor];
  id v16 = [v13 constraintEqualToAnchor:v15 constant:v41];
  [(BuddyPosedDeviceSelectionController *)v44 setContentViewTopConstraint:v16];

  v17 = +[UIDevice currentDevice];
  id v18 = [(UIDevice *)v17 userInterfaceIdiom];

  if (v18 == (id)1)
  {
    v19 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
    id v20 = [(BuddyPosedDeviceSelectionView *)v19 topAnchor];
    id v21 = [(BuddyPosedDeviceSelectionController *)v44 contentView];
    id v22 = [v21 topAnchor];
    id v23 = [v20 constraintEqualToAnchor:v22];
    [(BuddyPosedDeviceSelectionController *)v44 setContentViewTopConstraint:v23];
  }
  v40 = [(BuddyPosedDeviceSelectionController *)v44 contentViewTopConstraint];
  v45[0] = v40;
  v39 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  id v37 = [(BuddyPosedDeviceSelectionView *)v39 leftAnchor];
  id v38 = [(BuddyPosedDeviceSelectionController *)v44 contentView];
  id v36 = [v38 leftAnchor];
  id v35 = [v37 constraintEqualToAnchor:];
  v45[1] = v35;
  v34 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  id v24 = [(BuddyPosedDeviceSelectionView *)v34 rightAnchor];
  id v25 = [(BuddyPosedDeviceSelectionController *)v44 contentView];
  id v26 = [v25 rightAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26];
  v45[2] = v27;
  v28 = [(BuddyPosedDeviceSelectionController *)v44 selectionView];
  id v29 = [(BuddyPosedDeviceSelectionView *)v28 bottomAnchor];
  id v30 = [(BuddyPosedDeviceSelectionController *)v44 contentView];
  id v31 = [v30 bottomAnchor];
  id v32 = [v29 constraintEqualToAnchor:v31];
  v45[3] = v32;
  v33 = +[NSArray arrayWithObjects:v45 count:4];
  +[NSLayoutConstraint activateConstraints:v33];
}

- (void)viewDidLayoutSubviews
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyPosedDeviceSelectionController;
  [(BuddyPosedDeviceSelectionController *)&v3 viewDidLayoutSubviews];
  v2 = v5;
  [(BuddyPosedDeviceSelectionController *)v5 _contentViewHeight];
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:requireLayout:](v2, "_setPosedViewToBoundedHeight:animated:requireLayout:", 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  double v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyPosedDeviceSelectionController;
  [(BuddyPosedDeviceSelectionController *)&v6 viewWillAppear:a3];
  id v3 = [(BuddyPosedDeviceSelectionController *)v9 view];
  [v3 setNeedsLayout];

  id v4 = [(BuddyPosedDeviceSelectionController *)v9 view];
  [v4 layoutIfNeeded];

  id v5 = v9;
  [(BuddyPosedDeviceSelectionController *)v9 _contentViewHeight];
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:](v5, "_setPosedViewToBoundedHeight:animated:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)BuddyPosedDeviceSelectionController;
  [(BuddyPosedDeviceSelectionController *)&v4 traitCollectionDidChange:location[0]];
  id v3 = v6;
  [(BuddyPosedDeviceSelectionController *)v6 _contentViewHeight];
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:](v3, "_setPosedViewToBoundedHeight:animated:", 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v21 = a3;
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ([(BuddyPosedDeviceSelectionController *)v20 _buttonTrayInlined])
  {
    int v18 = 1;
  }
  else
  {
    objc_super v4 = +[UIScreen mainScreen];
    [(UIScreen *)v4 bounds];
    v15[2] = v5;
    v15[1] = v6;
    v15[4] = v7;
    v15[3] = v8;
    double v16 = *(double *)&v8;
    double v17 = *(double *)&v7;

    if (v16 - 88.0 < 820.0 || v17 - 88.0 < 820.0)
    {
      id v9 = location[0];
      id v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      id v13 = sub_10011413C;
      id v14 = &unk_1002B3348;
      v15[0] = v20;
      [v9 animateAlongsideTransition:&v10 completion:0];
      objc_storeStrong(v15, 0);
    }
    int v18 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_setPosedViewToBoundedHeight:(double)a3 animated:(BOOL)a4
{
}

- (void)_setPosedViewToBoundedHeight:(double)a3 animated:(BOOL)a4 requireLayout:(BOOL)a5
{
  id v26 = self;
  SEL v25 = a2;
  double v24 = a3;
  BOOL v23 = a4;
  BOOL v22 = a5;
  double v21 = 0.7;
  if (!a4) {
    double v21 = 0.0;
  }
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  double v16 = sub_100114418;
  double v17 = &unk_1002B33F8;
  v18[0] = v26;
  v18[1] = *(id *)&v24;
  BOOL v19 = v23;
  BOOL v20 = v22;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  SEL v8 = sub_1001145B4;
  id v9 = &unk_1002B3420;
  BOOL v11 = v23;
  BOOL v12 = v22;
  id v10 = v26;
  +[UIView animateWithDuration:&v13 animations:&v5 completion:v21];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v18, 0);
}

- (double)_landscapeDefaultSize
{
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 bounds];
  double v14 = v3;
  double v15 = v4;

  if (v14 >= v15) {
    double v5 = v15;
  }
  else {
    double v5 = v14;
  }
  double v6 = v5;
  int v7 = [(BuddyPosedDeviceSelectionController *)self selectionView];
  SEL v8 = [(BuddyPosedDeviceSelectionView *)v7 leftPosedView];
  [(BuddyPosedDeviceSelectionItemView *)v8 accessoryViewAndPaddingHeight];
  double v10 = v9 + v6 * 0.300000012;
  [(BuddyPosedDeviceSelectionController *)self _headerToContentPadding];
  double v12 = v10 + v11;

  return v12;
}

- (double)_portraitDefaultHeight
{
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 bounds];
  uint64_t v17 = v3;
  uint64_t v16 = v4;
  double v19 = v5;
  double v18 = v6;
  double v20 = v6;
  double v21 = v5;

  if (v20 - 88.0 <= 820.0 || v21 - 88.0 <= 820.0)
  {
    if (v20 <= v21) {
      double v8 = v21;
    }
    else {
      double v8 = v20;
    }
    double v9 = v8;
    double v10 = [(BuddyPosedDeviceSelectionController *)self selectionView];
    double v11 = [(BuddyPosedDeviceSelectionView *)v10 leftPosedView];
    [(BuddyPosedDeviceSelectionItemView *)v11 accessoryViewAndPaddingHeight];
    double v13 = v12 + v9 * 0.300000012;
    [(BuddyPosedDeviceSelectionController *)self _headerToContentPadding];
    double v23 = v13 + v14;
  }
  else
  {
    [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
    return v7;
  }
  return v23;
}

- (BOOL)_buttonTrayInlined
{
  id v2 = [(BuddyPosedDeviceSelectionController *)self buttonTray];
  id v3 = [v2 superview];
  id v4 = [(BuddyPosedDeviceSelectionController *)self view];
  BOOL v5 = v3 != v4;

  return v5;
}

- (double)_contentViewHeight
{
  id v2 = [(BuddyPosedDeviceSelectionController *)self buttonTray];
  [v2 frame];
  double v4 = v3;
  id v5 = [(BuddyPosedDeviceSelectionController *)self contentView];
  [v5 frame];
  double v7 = v4 - v6;
  [(BuddyPosedDeviceSelectionController *)self _headerToContentPadding];
  double v9 = v7 - v8;
  id v10 = [(BuddyPosedDeviceSelectionController *)self navigationController];
  id v11 = [v10 navigationBar];
  [v11 frame];
  uint64_t v46 = v12;
  uint64_t v45 = v13;
  double v48 = v14;
  uint64_t v47 = v15;
  double v16 = v9 - v14;

  double v49 = v16;
  uint64_t v43 = 0x3FD3333340000000;
  id v17 = +[BYDevice currentDevice];
  id v18 = [v17 type];

  if (v18 == (id)1) {
    uint64_t v43 = 0x3FDEB851E0000000;
  }
  id v19 = [(BuddyPosedDeviceSelectionController *)self navigationController];
  id v20 = [v19 view];
  id v21 = [v20 window];
  id v22 = [v21 windowScene];
  BOOL v23 = sub_100114C28((uint64_t)[v22 interfaceOrientation]);

  if (v23)
  {
    [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
    if (v16 >= v24 || [(BuddyPosedDeviceSelectionController *)self _buttonTrayInlined])
    {
      [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
      return v25;
    }
    else
    {
      [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
      double v27 = v26;
      [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
      if (v49 > v27 + -v28 * v44) {
        return v49;
      }
      [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
      double v31 = v30;
      [(BuddyPosedDeviceSelectionController *)self _landscapeDefaultSize];
      return v31 + -v32 * v44;
    }
  }
  else
  {
    [(BuddyPosedDeviceSelectionController *)self _portraitDefaultHeight];
    if (v16 >= v33 || [(BuddyPosedDeviceSelectionController *)self _buttonTrayInlined])
    {
      [(BuddyPosedDeviceSelectionController *)self _portraitDefaultHeight];
      return v34;
    }
    else
    {
      [(BuddyPosedDeviceSelectionController *)self _portraitDefaultHeight];
      double v36 = v35;
      [(BuddyPosedDeviceSelectionController *)self _portraitDefaultHeight];
      if (v49 > v36 + -v37 * v44) {
        return v49;
      }
      [(BuddyPosedDeviceSelectionController *)self _portraitDefaultHeight];
      double v40 = v39;
      [(BuddyPosedDeviceSelectionController *)self _portraitDefaultHeight];
      return v40 + -v41 * v44;
    }
  }
}

- (double)_headerToContentPadding
{
  id v2 = [(BuddyPosedDeviceSelectionController *)self contentViewTopConstraint];
  [(NSLayoutConstraint *)v2 constant];
  double v4 = v3;

  return v4;
}

- (void)didSelectSegment:(int64_t)a3
{
}

- (BuddyPosedDeviceSelectionView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
}

- (id)selectionViewHeightChangeBlock
{
  return self->_selectionViewHeightChangeBlock;
}

- (void)setSelectionViewHeightChangeBlock:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end