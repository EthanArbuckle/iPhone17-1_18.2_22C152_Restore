@interface CPSPointsOfInterestPickerViewController
- (CGSize)buttonGlyphSize;
- (CGSize)buttonSize;
- (CPSActionButton)cancelButton;
- (CPSPointsOfInterestPickerDelegate)delegate;
- (CPSPointsOfInterestPickerInfoView)infoView;
- (CPSPointsOfInterestPickerViewController)initWithEntity:(id)a3 resourceProvider:(id)a4;
- (CPSPointsOfInterestTableView)tableView;
- (NSArray)layoutConstraints;
- (UIFocusEnvironment)requestedFocusItem;
- (UILabel)titleLabel;
- (UIViewPropertyAnimator)animator;
- (double)scrollHeight;
- (id)_linearFocusItems;
- (id)pointsOfInterest;
- (id)preferredFocusEnvironments;
- (id)selectedItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)template;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)pickerState;
- (void)_updateFocusedItem:(id)a3;
- (void)actionButtonPressed:(id)a3 forModel:(id)a4;
- (void)cancelButtonPressed:(id)a3;
- (void)completeTransition:(BOOL)a3;
- (void)didSelectButton:(id)a3;
- (void)didUpdateEntity:(id)a3;
- (void)loadView;
- (void)modelDidDeselect:(id)a3;
- (void)modelDidSelect:(id)a3;
- (void)resetLayoutConstraints;
- (void)setAnimator:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setPickerState:(unint64_t)a3;
- (void)setRequestedFocusItem:(id)a3;
- (void)setScrollHeight:(double)a3;
- (void)setSelectedItem:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToPrimaryCard;
- (void)transitionToSecondaryCard;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation CPSPointsOfInterestPickerViewController

- (CPSPointsOfInterestPickerViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSPointsOfInterestPickerViewController;
  v8 = [(CPSBaseEntityContentViewController *)&v9 initWithEntity:location[0] resourceProvider:v10];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8) {
    v12->_pickerState = 0;
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (id)pointsOfInterest
{
  return [(CPSBaseEntityContentViewController *)self entity];
}

- (id)template
{
  v3 = objc_opt_class();
  v5 = [(CPSBaseEntityContentViewController *)self resourceProvider];
  v4 = [(CPSEntityResourceProvider *)v5 entityTemplate];
  id v6 = CPSSafeCast_3(v3, v4);

  return v6;
}

- (void)didUpdateEntity:(id)a3
{
  objc_super v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSPointsOfInterestPickerViewController;
  [(CPSBaseEntityContentViewController *)&v7 didUpdateEntity:location[0]];
  [(CPSPointsOfInterestPickerViewController *)v9 transitionToPrimaryCard];
  id v5 = [(CPSPointsOfInterestPickerViewController *)v9 pointsOfInterest];
  id v4 = (id)[v5 title];
  v3 = [(CPSPointsOfInterestPickerViewController *)v9 titleLabel];
  [(UILabel *)v3 setText:v4];

  id v6 = [(CPSPointsOfInterestPickerViewController *)v9 tableView];
  [(CPSPointsOfInterestTableView *)v6 reloadData];

  objc_storeStrong(location, 0);
}

- (void)loadView
{
  id v6 = self;
  v5[1] = (id)a2;
  v2 = [CPSCardPlatterView alloc];
  v5[0] = -[CPSCardPlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5[0] setClipsToBounds:1];
  id v3 = v5[0];
  id v4 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  objc_msgSend(v3, "setBackgroundColor:");

  [(CPSPointsOfInterestPickerViewController *)v6 setView:v5[0]];
  objc_storeStrong(v5, 0);
}

- (void)viewDidLoad
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestPickerViewController;
  [(CPSPointsOfInterestPickerViewController *)&v2 viewDidLoad];
  [(CPSPointsOfInterestPickerViewController *)v4 setupViews];
}

- (void)setupViews
{
  v28[3] = *MEMORY[0x263EF8340];
  v27 = self;
  v26[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F1C768]);
  v14 = (double *)MEMORY[0x263F001A8];
  v26[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v26[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = +[CPSEntityStyles pickerTitleFont];
  objc_msgSend(v26[0], "setFont:");

  [v26[0] setTextAlignment:4];
  id v5 = [(CPSPointsOfInterestPickerViewController *)v27 pointsOfInterest];
  id v4 = (id)[v5 title];
  objc_msgSend(v26[0], "setText:");

  [(CPSPointsOfInterestPickerViewController *)v27 setTitleLabel:v26[0]];
  id v6 = (id)[(CPSPointsOfInterestPickerViewController *)v27 view];
  [v6 addSubview:v26[0]];

  v25 = -[CPSPointsOfInterestTableView initWithFrame:style:]([CPSPointsOfInterestTableView alloc], "initWithFrame:style:", 0, *v14, v14[1], v14[2], v14[3]);
  [(CPSPointsOfInterestTableView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSPointsOfInterestTableView *)v25 setDataSource:v27];
  [(CPSPointsOfInterestTableView *)v25 setDelegate:v27];
  v8 = v25;
  uint64_t v7 = objc_opt_class();
  id v9 = +[CPSPointsOfInterestPickerCell identifier];
  -[CPSPointsOfInterestTableView registerClass:forCellReuseIdentifier:](v8, "registerClass:forCellReuseIdentifier:", v7);

  v11 = v25;
  uint64_t v10 = objc_opt_class();
  id v12 = +[CPSPointsOfInterestPickerExtendedCell identifier];
  -[CPSPointsOfInterestTableView registerClass:forCellReuseIdentifier:](v11, "registerClass:forCellReuseIdentifier:", v10);

  [(CPSPointsOfInterestPickerViewController *)v27 setTableView:v25];
  id v13 = (id)[(CPSPointsOfInterestPickerViewController *)v27 view];
  [v13 addSubview:v25];

  v24 = -[CPSPointsOfInterestPickerInfoView initWithFrame:]([CPSPointsOfInterestPickerInfoView alloc], "initWithFrame:", *v14, v14[1], v14[2], v14[3]);
  [(CPSPointsOfInterestPickerInfoView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[CPSPointsOfInterestPickerInfoView setAlpha:](v24, "setAlpha:");
  [(CPSPointsOfInterestPickerInfoView *)v24 setDelegate:v27];
  [(CPSPointsOfInterestPickerViewController *)v27 setInfoView:v24];
  id v15 = (id)[(CPSPointsOfInterestPickerViewController *)v27 view];
  [v15 addSubview:v24];

  v23 = objc_alloc_init(CPSActionButton);
  [(CPSActionButton *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSButton *)v23 setDelegate:v27];
  [(CPSActionButton *)v23 setLayoutDelegate:v27];
  [(CPSActionButton *)v23 setAlpha:0.0];
  id v19 = (id)CPUILocalizedStringForKey();
  v28[0] = v19;
  id v18 = (id)CPUILocalizedStringForKey();
  v28[1] = v18;
  id v17 = (id)CPUILocalizedStringForKey();
  v28[2] = v17;
  id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  -[CPSActionButton setAccessibilityUserInputLabels:](v23, "setAccessibilityUserInputLabels:");

  [(CPSPointsOfInterestPickerViewController *)v27 setCancelButton:v23];
  id v20 = (id)[(CPSPointsOfInterestPickerViewController *)v27 view];
  [v20 addSubview:v23];

  id v22 = (id)[(CPSPointsOfInterestPickerViewController *)v27 traitCollection];
  id v21 = (id)CPUIImageCancelGlyph();
  -[CPSActionButton setButtonImage:](v23, "setButtonImage:");

  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(v26, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointsOfInterestPickerViewController;
  [(CPSPointsOfInterestPickerViewController *)&v3 traitCollectionDidChange:location[0]];
  [(CPSPointsOfInterestPickerViewController *)v5 resetLayoutConstraints];
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  id v5 = [(CPSPointsOfInterestPickerViewController *)self layoutConstraints];
  uint64_t v6 = [(NSArray *)v5 count];

  if (v6)
  {
    id v2 = (void *)MEMORY[0x263F08938];
    objc_super v3 = [(CPSPointsOfInterestPickerViewController *)self layoutConstraints];
    objc_msgSend(v2, "deactivateConstraints:");

    [(CPSPointsOfInterestPickerViewController *)self setLayoutConstraints:0];
    id v4 = (id)[(CPSPointsOfInterestPickerViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  uint64_t v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointsOfInterestPickerViewController;
  [(CPSPointsOfInterestPickerViewController *)&v4 updateViewConstraints];
  id v2 = [(CPSPointsOfInterestPickerViewController *)v6 layoutConstraints];
  BOOL v3 = [(NSArray *)v2 count] != 0;

  if (!v3) {
    [(CPSPointsOfInterestPickerViewController *)v6 setupLayoutConstraints];
  }
}

- (void)setupLayoutConstraints
{
  v100[4] = *MEMORY[0x263EF8340];
  v96 = self;
  v95[1] = (id)a2;
  v95[0] = (id)objc_opt_new();
  id v94 = (id)objc_opt_new();
  id v6 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  [v6 addLayoutGuide:v94];

  id v93 = 0;
  id v92 = 0;
  v29 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  id v28 = (id)[(UILabel *)v29 topAnchor];
  id v27 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v26 = (id)[v27 safeAreaLayoutGuide];
  id v25 = (id)[v26 topAnchor];
  id v24 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:");
  v100[0] = v24;
  v23 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  id v22 = (id)[(UILabel *)v23 leadingAnchor];
  id v21 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v20 = (id)[v21 safeAreaLayoutGuide];
  id v19 = (id)[v20 leadingAnchor];
  id v18 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", 10.0);
  v100[1] = v18;
  id v17 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  id v16 = (id)[(UILabel *)v17 trailingAnchor];
  id v15 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v14 = (id)[v15 safeAreaLayoutGuide];
  id v13 = (id)[v14 trailingAnchor];
  id v12 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v100[2] = v12;
  v11 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  id v10 = (id)[(UILabel *)v11 heightAnchor];
  id v9 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  v8 = [(UILabel *)v9 font];
  [(UIFont *)v8 lineHeight];
  id v7 = (id)objc_msgSend(v10, "constraintEqualToConstant:");
  v100[3] = v7;
  id v2 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v100);
  id v3 = v93;
  id v93 = v2;

  v52 = [(CPSPointsOfInterestPickerViewController *)v96 tableView];
  id v51 = (id)[(CPSPointsOfInterestTableView *)v52 topAnchor];
  v50 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  id v49 = (id)[(UILabel *)v50 bottomAnchor];
  id v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:constant:", 8.0);
  v99[0] = v48;
  v47 = [(CPSPointsOfInterestPickerViewController *)v96 tableView];
  id v46 = (id)[(CPSPointsOfInterestTableView *)v47 leadingAnchor];
  id v45 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v44 = (id)[v45 safeAreaLayoutGuide];
  id v43 = (id)[v44 leadingAnchor];
  id v42 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
  v99[1] = v42;
  v41 = [(CPSPointsOfInterestPickerViewController *)v96 tableView];
  id v40 = (id)[(CPSPointsOfInterestTableView *)v41 trailingAnchor];
  id v39 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v38 = (id)[v39 safeAreaLayoutGuide];
  id v37 = (id)[v38 trailingAnchor];
  id v36 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v99[2] = v36;
  v35 = [(CPSPointsOfInterestPickerViewController *)v96 tableView];
  id v34 = (id)[(CPSPointsOfInterestTableView *)v35 bottomAnchor];
  id v33 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v32 = (id)[v33 safeAreaLayoutGuide];
  id v31 = (id)[v32 bottomAnchor];
  id v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
  v99[3] = v30;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:4];
  id v5 = v92;
  id v92 = v4;

  v63 = [(CPSPointsOfInterestPickerViewController *)v96 cancelButton];
  id v62 = (id)[(CPSActionButton *)v63 topAnchor];
  v61 = [(CPSPointsOfInterestPickerViewController *)v96 titleLabel];
  id v60 = (id)[(UILabel *)v61 topAnchor];
  id v59 = (id)objc_msgSend(v62, "constraintEqualToAnchor:");
  v98[0] = v59;
  v58 = [(CPSPointsOfInterestPickerViewController *)v96 cancelButton];
  id v57 = (id)[(CPSActionButton *)v58 trailingAnchor];
  id v56 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v55 = (id)[v56 safeAreaLayoutGuide];
  id v54 = (id)[v55 trailingAnchor];
  id v53 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:", -10.0);
  v98[1] = v53;
  id v91 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:2];

  v86 = [(CPSPointsOfInterestPickerViewController *)v96 infoView];
  id v85 = (id)[(CPSPointsOfInterestPickerInfoView *)v86 topAnchor];
  id v84 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v83 = (id)[v84 topAnchor];
  id v82 = (id)objc_msgSend(v85, "constraintEqualToAnchor:");
  v97[0] = v82;
  v81 = [(CPSPointsOfInterestPickerViewController *)v96 infoView];
  id v80 = (id)[(CPSPointsOfInterestPickerInfoView *)v81 leadingAnchor];
  id v79 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v78 = (id)[v79 safeAreaLayoutGuide];
  id v77 = (id)[v78 leadingAnchor];
  id v76 = (id)objc_msgSend(v80, "constraintEqualToAnchor:");
  v97[1] = v76;
  v75 = [(CPSPointsOfInterestPickerViewController *)v96 infoView];
  id v74 = (id)[(CPSPointsOfInterestPickerInfoView *)v75 trailingAnchor];
  id v73 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v72 = (id)[v73 safeAreaLayoutGuide];
  id v71 = (id)[v72 trailingAnchor];
  id v70 = (id)objc_msgSend(v74, "constraintEqualToAnchor:");
  v97[2] = v70;
  v69 = [(CPSPointsOfInterestPickerViewController *)v96 infoView];
  id v68 = (id)[(CPSPointsOfInterestPickerInfoView *)v69 bottomAnchor];
  id v67 = (id)[(CPSPointsOfInterestPickerViewController *)v96 view];
  id v66 = (id)[v67 safeAreaLayoutGuide];
  id v65 = (id)[v66 bottomAnchor];
  id v64 = (id)objc_msgSend(v68, "constraintEqualToAnchor:constant:", -8.0);
  v97[3] = v64;
  id v90 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:4];

  [v95[0] addObjectsFromArray:v93];
  [v95[0] addObjectsFromArray:v91];
  [v95[0] addObjectsFromArray:v92];
  [v95[0] addObjectsFromArray:v90];
  id v87 = (id)[v95[0] copy];
  [(CPSPointsOfInterestPickerViewController *)v96 setLayoutConstraints:"setLayoutConstraints:"];

  v88 = (void *)MEMORY[0x263F08938];
  v89 = [(CPSPointsOfInterestPickerViewController *)v96 layoutConstraints];
  objc_msgSend(v88, "activateConstraints:");

  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v92, 0);
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(v95, 0);
}

- (void)actionButtonPressed:(id)a3 forModel:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = [(CPSBaseEntityContentViewController *)v9 resourceProvider];
  id v6 = [(CPSEntityResourceProvider *)v5 actionDelegate];

  if (v6) {
    [v6 entityContentViewController:v6 didPressButton:location[0] forPOI:v7];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (CPSActionButton *)location[0];
  id v3 = [(CPSPointsOfInterestPickerViewController *)v7 cancelButton];
  BOOL v5 = v4 != v3;

  if (!v5) {
    [(CPSPointsOfInterestPickerViewController *)v7 cancelButtonPressed:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)cancelButtonPressed:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v5 = [(CPSPointsOfInterestPickerViewController *)v7 delegate];
  id v3 = v7;
  id v4 = [(CPSPointsOfInterestPickerViewController *)v7 selectedItem];
  -[CPSPointsOfInterestPickerDelegate picker:didUnhighlightModel:](v5, "picker:didUnhighlightModel:", v3);

  [(CPSPointsOfInterestPickerViewController *)v7 transitionToPrimaryCard];
  objc_storeStrong(location, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(CPSPointsOfInterestPickerViewController *)v9 pointsOfInterest];
  id v5 = (id)[v6 pointsOfInterest];
  int64_t v7 = [v5 count];

  objc_storeStrong(location, 0);
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = 0;
  id v34 = [(CPSPointsOfInterestPickerViewController *)v45 pointsOfInterest];
  id v33 = (id)[v34 pointsOfInterest];
  id v41 = (id)objc_msgSend(v33, "objectAtIndex:", objc_msgSend(v43, "row"));

  id v35 = (id)[v41 summary];
  BOOL v36 = [v35 length] != 0;

  BOOL v40 = v36;
  if (v36)
  {
    id v27 = location[0];
    id v28 = +[CPSPointsOfInterestPickerExtendedCell identifier];
    id v39 = (id)objc_msgSend(v27, "dequeueReusableCellWithIdentifier:");

    id v29 = (id)[v41 title];
    objc_msgSend(v39, "setTitle:");

    id v30 = (id)[v41 subtitle];
    objc_msgSend(v39, "setSubtitle:");

    id v31 = (id)[v41 summary];
    objc_msgSend(v39, "setText:");

    objc_storeStrong(&v42, v39);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v21 = location[0];
    id v22 = +[CPSPointsOfInterestPickerCell identifier];
    id v38 = (id)objc_msgSend(v21, "dequeueReusableCellWithIdentifier:");

    id v24 = (id)[v41 title];
    id v23 = (id)[v38 textLabel];
    [v23 setText:v24];

    id v26 = (id)[v41 subtitle];
    id v25 = (id)[v38 detailTextLabel];
    [v25 setText:v26];

    objc_storeStrong(&v42, v38);
    objc_storeStrong(&v38, 0);
  }
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v20 = (id)[v41 title];

  if (v20)
  {
    id v19 = (id)[v41 title];
    objc_msgSend(v37, "addObject:");
  }
  id v18 = (id)[v41 subtitle];

  if (v18)
  {
    id v17 = (id)[v41 subtitle];
    objc_msgSend(v37, "addObject:");
  }
  id v16 = (id)[v41 summary];

  if (v16)
  {
    id v15 = (id)[v41 summary];
    objc_msgSend(v37, "addObject:");
  }
  id v14 = (id)[v37 copy];
  objc_msgSend(v42, "setAccessibilityUserInputLabels:");

  [(CPSPointsOfInterestPickerViewController *)v45 scrollHeight];
  if (v4 == 0.0
    || ([(CPSPointsOfInterestPickerViewController *)v45 scrollHeight],
        double v13 = v5,
        [v42 frame],
        double Height = CGRectGetHeight(v47),
        double v7 = v13,
        v13 > Height))
  {
    [v42 frame];
    [(CPSPointsOfInterestPickerViewController *)v45 setScrollHeight:CGRectGetHeight(v48)];
  }
  id v10 = v42;
  id v11 = [(CPSPointsOfInterestPickerViewController *)v45 template];
  uint64_t v9 = [v11 selectedIndex];
  objc_msgSend(v10, "setChosen:", v9 == objc_msgSend(v43, "row"));

  id v12 = v42;
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v6 = [(CPSPointsOfInterestPickerViewController *)v10 pointsOfInterest];
  id v5 = (id)[v6 pointsOfInterest];
  id v7 = (id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v8, "row"));

  [location[0] scrollToNearestSelectedRowAtScrollPosition:2 animated:1];
  [(CPSPointsOfInterestPickerViewController *)v10 modelDidSelect:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v6 = [(CPSPointsOfInterestPickerViewController *)v10 pointsOfInterest];
  id v5 = (id)[v6 pointsOfInterest];
  id v7 = (id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v8, "row"));

  [location[0] scrollToNearestSelectedRowAtScrollPosition:2 animated:1];
  [(CPSPointsOfInterestPickerViewController *)v10 modelDidDeselect:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v15 = location[0];
  id v16 = (id)[v26 nextFocusedIndexPath];
  id v24 = (id)objc_msgSend(v15, "cellForRowAtIndexPath:");

  id v20 = (id)[v26 previouslyFocusedIndexPath];
  unint64_t v17 = [v20 row];
  id v19 = [(CPSPointsOfInterestPickerViewController *)v28 pointsOfInterest];
  id v18 = (id)[v19 pointsOfInterest];
  BOOL v21 = v17 >= [v18 count];

  if (!v21)
  {
    id v11 = [(CPSPointsOfInterestPickerViewController *)v28 pointsOfInterest];
    id v10 = (id)[v11 pointsOfInterest];
    id v9 = (id)[v26 previouslyFocusedIndexPath];
    id v23 = (id)objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));

    id v12 = [(CPSPointsOfInterestPickerViewController *)v28 delegate];
    [(CPSPointsOfInterestPickerDelegate *)v12 picker:v28 didUnhighlightModel:v23];

    objc_storeStrong(&v23, 0);
  }
  if ([v24 isHighlighted])
  {
    id v7 = [(CPSPointsOfInterestPickerViewController *)v28 pointsOfInterest];
    id v6 = (id)[v7 pointsOfInterest];
    id v5 = (id)[v26 nextFocusedIndexPath];
    id v22 = (id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "row"));

    id v8 = [(CPSPointsOfInterestPickerViewController *)v28 delegate];
    [(CPSPointsOfInterestPickerDelegate *)v8 picker:v28 didHighlightModel:v22];

    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)selectedItem
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  id v8 = [(CPSPointsOfInterestPickerViewController *)self tableView];
  id location = (id)[(CPSPointsOfInterestTableView *)v8 indexPathForSelectedRow];

  if (location)
  {
    id v7 = [(CPSPointsOfInterestPickerViewController *)v11 pointsOfInterest];
    id v6 = (id)[v7 pointsOfInterest];
    id v2 = (id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(location, "row"));
    id v3 = v10[0];
    v10[0] = v2;
  }
  id v5 = v10[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);

  return v5;
}

- (void)setSelectedItem:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSPointsOfInterestPickerViewController *)v9 pointsOfInterest];
  id v3 = (id)[v4 pointsOfInterest];
  id v5 = (void *)[v3 indexOfObject:location[0]];

  v7[1] = v5;
  v7[0] = (id)[MEMORY[0x263F088C8] indexPathForRow:v5 inSection:0];
  id v6 = [(CPSPointsOfInterestPickerViewController *)v9 tableView];
  [(CPSPointsOfInterestTableView *)v6 selectRowAtIndexPath:v7[0] animated:1 scrollPosition:2];

  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

- (void)modelDidSelect:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSPointsOfInterestPickerViewController *)v6 infoView];
  [(CPSPointsOfInterestPickerInfoView *)v3 updateWithModel:location[0]];

  [(CPSPointsOfInterestPickerViewController *)v6 transitionToSecondaryCard];
  id v4 = [(CPSPointsOfInterestPickerViewController *)v6 delegate];
  [(CPSPointsOfInterestPickerDelegate *)v4 picker:v6 didSelectModel:location[0]];

  objc_storeStrong(location, 0);
}

- (void)modelDidDeselect:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSPointsOfInterestPickerViewController *)v5 delegate];
  [(CPSPointsOfInterestPickerDelegate *)v3 picker:v5 didDeselectModel:location[0]];

  objc_storeStrong(location, 0);
}

- (void)transitionToPrimaryCard
{
  id v41 = self;
  location[1] = (id)a2;
  if ([(CPSPointsOfInterestPickerViewController *)self pickerState])
  {
    [(CPSPointsOfInterestPickerViewController *)v41 setPickerState:0];
    objc_initWeak(location, v41);
    id v39 = (id)[objc_alloc(MEMORY[0x263F1C5A0]) initWithAnimationCurve:2];
    id v8 = (id)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v39 timingParameters:0.25];
    [(CPSPointsOfInterestPickerViewController *)v41 setAnimator:v8];

    id v7 = [(CPSPointsOfInterestPickerViewController *)v41 animator];
    uint64_t v33 = MEMORY[0x263EF8330];
    int v34 = -1073741824;
    int v35 = 0;
    BOOL v36 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke;
    id v37 = &unk_2648A3EC0;
    objc_copyWeak(&v38, location);
    [(UIViewPropertyAnimator *)v7 addAnimations:&v33];

    id v6 = [(CPSPointsOfInterestPickerViewController *)v41 animator];
    uint64_t v27 = MEMORY[0x263EF8330];
    int v28 = -1073741824;
    int v29 = 0;
    id v30 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_2;
    id v31 = &unk_2648A3EC0;
    objc_copyWeak(&v32, location);
    [(UIViewPropertyAnimator *)v6 addAnimations:&v27];

    id v5 = [(CPSPointsOfInterestPickerViewController *)v41 animator];
    uint64_t v21 = MEMORY[0x263EF8330];
    int v22 = -1073741824;
    int v23 = 0;
    id v24 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_3;
    id v25 = &unk_2648A3EC0;
    objc_copyWeak(&v26, location);
    [(UIViewPropertyAnimator *)v5 addAnimations:&v21];

    id v4 = [(CPSPointsOfInterestPickerViewController *)v41 animator];
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    id v18 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_4;
    id v19 = &unk_2648A3EC0;
    objc_copyWeak(&v20, location);
    [(UIViewPropertyAnimator *)v4 addAnimations:&v15];

    id v3 = [(CPSPointsOfInterestPickerViewController *)v41 animator];
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_5;
    double v13 = &unk_2648A3EE8;
    objc_copyWeak(&v14, location);
    [(UIViewPropertyAnimator *)v3 addCompletion:&v9];

    id v2 = [(CPSPointsOfInterestPickerViewController *)v41 animator];
    [(UIViewPropertyAnimator *)v2 startAnimation];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v38);
    objc_storeStrong(&v39, 0);
    objc_destroyWeak(location);
  }
}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained titleLabel];
  [v1 setAlpha:1.0];
}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained tableView];
  [v1 setAlpha:1.0];
}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained cancelButton];
  [v1 setAlpha:0.0];
}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained infoView];
  [v1 setAlpha:0.0];
}

void __66__CPSPointsOfInterestPickerViewController_transitionToPrimaryCard__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeTransition:a2 == 0];
}

- (void)transitionToSecondaryCard
{
  CGRect v48 = self;
  location[1] = (id)a2;
  if ([(CPSPointsOfInterestPickerViewController *)self pickerState] != 1)
  {
    [(CPSPointsOfInterestPickerViewController *)v48 setPickerState:1];
    objc_initWeak(location, v48);
    id v46 = (id)[objc_alloc(MEMORY[0x263F1C5A0]) initWithAnimationCurve:2];
    id v12 = (id)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v46 timingParameters:0.15];
    [(CPSPointsOfInterestPickerViewController *)v48 setAnimator:v12];

    int v11 = [(CPSPointsOfInterestPickerViewController *)v48 animator];
    uint64_t v40 = MEMORY[0x263EF8330];
    int v41 = -1073741824;
    int v42 = 0;
    id v43 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke;
    id v44 = &unk_2648A3EC0;
    objc_copyWeak(v45, location);
    [(UIViewPropertyAnimator *)v11 addAnimations:&v40];

    int v10 = [(CPSPointsOfInterestPickerViewController *)v48 animator];
    uint64_t v34 = MEMORY[0x263EF8330];
    int v35 = -1073741824;
    int v36 = 0;
    id v37 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_2;
    id v38 = &unk_2648A3EC0;
    objc_copyWeak(&v39, location);
    [(UIViewPropertyAnimator *)v10 addAnimations:&v34];

    uint64_t v9 = [(CPSPointsOfInterestPickerViewController *)v48 animator];
    uint64_t v28 = MEMORY[0x263EF8330];
    int v29 = -1073741824;
    int v30 = 0;
    id v31 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_3;
    id v32 = &unk_2648A3EC0;
    objc_copyWeak(&v33, location);
    [(UIViewPropertyAnimator *)v9 addAnimations:&v28];

    id v8 = [(CPSPointsOfInterestPickerViewController *)v48 animator];
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    id v25 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_4;
    id v26 = &unk_2648A3EC0;
    objc_copyWeak(&v27, location);
    [(UIViewPropertyAnimator *)v8 addAnimations:&v22];

    id v7 = [(CPSPointsOfInterestPickerViewController *)v48 animator];
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    id v19 = __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_5;
    id v20 = &unk_2648A3EE8;
    objc_copyWeak(&v21, location);
    [(UIViewPropertyAnimator *)v7 addCompletion:&v16];

    id v6 = [(CPSPointsOfInterestPickerViewController *)v48 animator];
    [(UIViewPropertyAnimator *)v6 startAnimation];

    id v5 = [(CPSPointsOfInterestPickerViewController *)v48 infoView];
    id v4 = [(CPSPointsOfInterestPickerInfoView *)v5 _linearFocusItems];
    id v3 = (id)[v4 firstObject];
    char v13 = 0;
    if (v3)
    {
      id v2 = (CPSActionButton *)v3;
    }
    else
    {
      id v14 = [(CPSPointsOfInterestPickerViewController *)v48 cancelButton];
      char v13 = 1;
      id v2 = v14;
    }
    id v15 = v2;
    if (v13) {

    }
    [(CPSPointsOfInterestPickerViewController *)v48 _updateFocusedItem:v15];
    objc_storeStrong(&v15, 0);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v39);
    objc_destroyWeak(v45);
    objc_storeStrong(&v46, 0);
    objc_destroyWeak(location);
  }
}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained titleLabel];
  [v1 setAlpha:0.0];
}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained tableView];
  [v1 setAlpha:0.0];
}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained cancelButton];
  [v1 setAlpha:1.0];
}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained infoView];
  [v1 setAlpha:1.0];
}

void __68__CPSPointsOfInterestPickerViewController_transitionToSecondaryCard__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeTransition:a2 == 0];
}

- (void)completeTransition:(BOOL)a3
{
  if (a3) {
    [(CPSPointsOfInterestPickerViewController *)self setAnimator:0];
  }
}

- (CGSize)buttonSize
{
  CGSizeMake_0();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)buttonGlyphSize
{
  CGSizeMake_0();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_linearFocusItems
{
  int v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)objc_opt_new();
  if ([(CPSPointsOfInterestPickerViewController *)v11 pickerState])
  {
    id v6 = [(CPSPointsOfInterestPickerViewController *)v11 cancelButton];

    if (v6)
    {
      id v5 = [(CPSPointsOfInterestPickerViewController *)v11 cancelButton];
      objc_msgSend(v10[0], "addObject:");
    }
    id v4 = [(CPSPointsOfInterestPickerViewController *)v11 infoView];
    id location = [(CPSPointsOfInterestPickerInfoView *)v4 _linearFocusItems];

    if (location) {
      [v10[0] addObjectsFromArray:location];
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v8 = [(CPSPointsOfInterestPickerViewController *)v11 tableView];
    id v7 = [(CPSPointsOfInterestTableView *)v8 visibleCells];
    objc_msgSend(v10[0], "addObjectsFromArray:");
  }
  id v3 = v10[0];
  objc_storeStrong(v10, 0);

  return v3;
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x263EF8340];
  id v6 = self;
  v5[1] = (id)a2;
  id v4 = [(CPSPointsOfInterestPickerViewController *)self requestedFocusItem];

  if (v4)
  {
    v5[0] = [(CPSPointsOfInterestPickerViewController *)v6 requestedFocusItem];
    -[CPSPointsOfInterestPickerViewController setRequestedFocusItem:](v6, "setRequestedFocusItem:");
    v8[0] = v5[0];
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    objc_storeStrong(v5, 0);
  }
  else
  {
    id v7 = MEMORY[0x263EFFA68];
  }
  double v2 = v7;

  return v2;
}

- (void)_updateFocusedItem:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSPointsOfInterestPickerViewController *)v7 setRequestedFocusItem:location[0]];
  id v3 = objc_alloc(MEMORY[0x263F1CCB0]);
  id v5 = (id)[v3 initWithEnvironment:v7];
  [v5 setAllowsDeferral:0];
  id v4 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v7];
  [v4 _requestFocusUpdate:v5];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (CPSPointsOfInterestPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSPointsOfInterestPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (CPSPointsOfInterestTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (CPSActionButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (double)scrollHeight
{
  return self->_scrollHeight;
}

- (void)setScrollHeight:(double)a3
{
  self->_scrolldouble Height = a3;
}

- (CPSPointsOfInterestPickerInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
}

- (unint64_t)pickerState
{
  return self->_pickerState;
}

- (void)setPickerState:(unint64_t)a3
{
  self->_pickerState = a3;
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (UIFocusEnvironment)requestedFocusItem
{
  return self->_requestedFocusItem;
}

- (void)setRequestedFocusItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end