@interface HUItemTableOBWelcomeController
- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 itemTableViewController:(id)a7;
- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (HUItemTableViewController)itemTableViewController;
- (NSLayoutConstraint)itemTableViewHeightConstraint;
- (id)hu_preloadContent;
- (void)setItemTableViewController:(id)a3;
- (void)setItemTableViewHeightConstraint:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HUItemTableOBWelcomeController

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 itemTableViewController:(id)a7
{
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HUItemTableOBWelcomeController;
  v14 = [(HUItemTableOBWelcomeController *)&v21 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemTableViewController, a7);
    v16 = [(HUItemTableViewController *)v15->_itemTableViewController tableView];
    v17 = [v16 heightAnchor];
    uint64_t v18 = [v17 constraintEqualToConstant:1.0];
    itemTableViewHeightConstraint = v15->_itemTableViewHeightConstraint;
    v15->_itemTableViewHeightConstraint = (NSLayoutConstraint *)v18;
  }
  return v15;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUItemTableOBWelcomeController.m", 47, @"%s is unavailable; use %@ instead",
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUItemTableOBWelcomeController.m", 54, @"%s is unavailable; use %@ instead",
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:icon:]",
    v8);

  return 0;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUItemTableOBWelcomeController.m", 61, @"%s is unavailable; use %@ instead",
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:symbolName:]",
    v8);

  return 0;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUItemTableOBWelcomeController.m", 69, @"%s is unavailable; use %@ instead",
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  v48[5] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)HUItemTableOBWelcomeController;
  [(OBBaseWelcomeController *)&v47 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v5 = [v4 tableView];
  [v5 setBackgroundColor:v3];

  v6 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  [v6 setWantsPreferredContentSize:1];

  v7 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v8 = [v7 tableView];
  [v8 setScrollEnabled:0];

  v9 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  [v9 setShouldUseAlternateCellColor:1];

  v10 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v11 = [v10 tableView];
  objc_msgSend(v11, "setLayoutMargins:", 0.0, 1.0, 0.0, 1.0);

  v12 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  [v12 setSectionContentInsetFollowsLayoutMargins:1];

  id v13 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  [(HUItemTableOBWelcomeController *)self addChildViewController:v13];

  v14 = [(HUItemTableOBWelcomeController *)self contentView];
  v15 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v16 = [v15 tableView];
  [v14 addSubview:v16];

  v17 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  uint64_t v18 = [v17 tableView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v35 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [(HUItemTableOBWelcomeController *)self contentView];
  v44 = [v46 topAnchor];
  v45 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v43 = [v45 tableView];
  v42 = [v43 topAnchor];
  v41 = [v44 constraintEqualToAnchor:v42];
  v48[0] = v41;
  v40 = [(HUItemTableOBWelcomeController *)self contentView];
  v38 = [v40 bottomAnchor];
  v39 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v37 = [v39 tableView];
  v36 = [v37 bottomAnchor];
  v34 = [v38 constraintEqualToAnchor:v36];
  v48[1] = v34;
  v33 = [(HUItemTableOBWelcomeController *)self contentView];
  v31 = [v33 leadingAnchor];
  v32 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v30 = [v32 tableView];
  v29 = [v30 leadingAnchor];
  v19 = [v31 constraintEqualToAnchor:v29];
  v48[2] = v19;
  v20 = [(HUItemTableOBWelcomeController *)self contentView];
  objc_super v21 = [v20 trailingAnchor];
  v22 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v23 = [v22 tableView];
  v24 = [v23 trailingAnchor];
  v25 = [v21 constraintEqualToAnchor:v24];
  v48[3] = v25;
  v26 = [(HUItemTableOBWelcomeController *)self itemTableViewHeightConstraint];
  v48[4] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:5];
  [v35 activateConstraints:v27];

  v28 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  [v28 didMoveToParentViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HUItemTableOBWelcomeController;
  [(HUItemTableOBWelcomeController *)&v4 viewWillLayoutSubviews];
  v3 = [(HUItemTableOBWelcomeController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
  v3 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  [v3 preferredContentSize];
  double v5 = v4;
  v6 = [(HUItemTableOBWelcomeController *)self itemTableViewHeightConstraint];
  [v6 setConstant:v5];

  v7.receiver = self;
  v7.super_class = (Class)HUItemTableOBWelcomeController;
  [(HUItemTableOBWelcomeController *)&v7 updateViewConstraints];
}

- (id)hu_preloadContent
{
  v2 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v3 = objc_msgSend(v2, "hu_preloadContent");
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v6 = v5;

  return v6;
}

- (HUItemTableViewController)itemTableViewController
{
  return self->_itemTableViewController;
}

- (void)setItemTableViewController:(id)a3
{
}

- (NSLayoutConstraint)itemTableViewHeightConstraint
{
  return self->_itemTableViewHeightConstraint;
}

- (void)setItemTableViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemTableViewHeightConstraint, 0);

  objc_storeStrong((id *)&self->_itemTableViewController, 0);
}

@end