@interface CPSNameViewController
- (CPEntityNameProviding)entity;
- (CPSNameStackView)stackView;
- (CPSNameViewController)initWithEntity:(id)a3;
- (NSArray)layoutConstraints;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UILabel)tertiaryLabel;
- (void)resetLayoutConstraints;
- (void)setEntity:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)updateViews;
- (void)updateWithEntity:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CPSNameViewController

- (CPSNameViewController)initWithEntity:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)CPSNameViewController;
  v9 = -[CPSNameViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0);
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v12->_entity, location[0]);
    v4 = objc_alloc_init(CPSNameStackView);
    stackView = v12->_stackView;
    v12->_stackView = v4;

    -[CPSNameStackView setContentCompressionResistancePriority:forAxis:](v12->_stackView, "setContentCompressionResistancePriority:forAxis:", 0);
    LODWORD(v6) = 1144750080;
    [(CPSNameStackView *)v12->_stackView setContentCompressionResistancePriority:1 forAxis:v6];
  }
  v8 = v12;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v8;
}

- (void)updateWithEntity:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSNameViewController *)v4 setEntity:location[0]];
  [(CPSNameViewController *)v4 updateViews];
  [(CPSNameViewController *)v4 resetLayoutConstraints];
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNameViewController;
  [(CPSNameViewController *)&v2 viewDidLoad];
  [(CPSNameViewController *)v4 setupViews];
  [(CPSNameViewController *)v4 updateViews];
}

- (void)setupViews
{
  v56[1] = *MEMORY[0x263EF8340];
  v48 = self;
  v47[1] = (id)a2;
  v12 = [(CPSNameViewController *)self stackView];
  [(CPSNameStackView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(CPSNameViewController *)v48 stackView];
  -[CPSNameStackView setAlignment:](v13, "setAlignment:");

  v14 = [(CPSNameViewController *)v48 stackView];
  [(CPSNameStackView *)v14 setDistribution:3];

  v15 = [(CPSNameViewController *)v48 stackView];
  [(CPSNameStackView *)v15 setAxis:1];

  v16 = [(CPSNameViewController *)v48 stackView];
  [(CPSNameStackView *)v16 setBaselineRelativeArrangement:1];

  v17 = [(CPSNameViewController *)v48 stackView];
  [(CPSNameStackView *)v17 setSpacing:20.0];

  v18 = [(CPSNameViewController *)v48 stackView];
  objc_super v2 = (UILabel *)insertNewLabelToStackView(v18);
  primaryLabel = v48->_primaryLabel;
  v48->_primaryLabel = v2;

  v19 = [(CPSNameViewController *)v48 stackView];
  v4 = (UILabel *)insertNewLabelToStackView(v19);
  secondaryLabel = v48->_secondaryLabel;
  v48->_secondaryLabel = v4;

  v20 = [(CPSNameViewController *)v48 stackView];
  double v6 = (UILabel *)insertNewLabelToStackView(v20);
  tertiaryLabel = v48->_tertiaryLabel;
  v48->_tertiaryLabel = v6;

  v47[0] = (id)*MEMORY[0x263F1D300];
  id v46 = (id)*MEMORY[0x263F1D270];
  v22 = (void *)MEMORY[0x263F1C658];
  id v21 = v47[0];
  id v24 = (id)[(CPSNameViewController *)v48 traitCollection];
  id v23 = (id)objc_msgSend(v22, "preferredFontForTextStyle:compatibleWithTraitCollection:", v21);
  id v45 = (id)[v23 fontDescriptor];

  v33 = (uint64_t *)MEMORY[0x263F1D350];
  uint64_t v55 = *MEMORY[0x263F1D350];
  id v25 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v56[0] = v25;
  id v44 = (id)[NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];

  id v26 = v45;
  v35 = (uint64_t *)MEMORY[0x263F1D210];
  uint64_t v53 = *MEMORY[0x263F1D210];
  id v54 = v44;
  id v27 = (id)[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  id v8 = (id)objc_msgSend(v26, "fontDescriptorByAddingAttributes:");
  id v9 = v45;
  id v45 = v8;

  id v28 = (id)objc_msgSend(MEMORY[0x263F1C658], "fontWithDescriptor:size:", v45);
  -[UILabel setFont:](v48->_primaryLabel, "setFont:");

  v30 = (void *)MEMORY[0x263F1C658];
  id v29 = v46;
  id v32 = (id)[(CPSNameViewController *)v48 traitCollection];
  id v31 = (id)objc_msgSend(v30, "preferredFontForTextStyle:compatibleWithTraitCollection:", v29);
  id v43 = (id)[v31 fontDescriptor];

  uint64_t v51 = *v33;
  id v34 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D338]];
  id v52 = v34;
  id v42 = (id)[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];

  id v36 = v43;
  uint64_t v49 = *v35;
  id v50 = v42;
  id v37 = (id)[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  id v10 = (id)objc_msgSend(v36, "fontDescriptorByAddingAttributes:");
  id v11 = v43;
  id v43 = v10;

  id v38 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v43 size:0.0];
  -[UILabel setFont:](v48->_secondaryLabel, "setFont:");

  id v39 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v43 size:0.0];
  -[UILabel setFont:](v48->_tertiaryLabel, "setFont:");

  id v41 = (id)[(CPSNameViewController *)v48 view];
  v40 = [(CPSNameViewController *)v48 stackView];
  objc_msgSend(v41, "addSubview:");

  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
}

- (void)updateViews
{
  v17 = self;
  v16[1] = (id)a2;
  id v10 = [(CPSNameViewController *)self entity];
  v16[0] = (id)[(CPEntityNameProviding *)v10 name];

  id v11 = [(CPSNameViewController *)v17 entity];
  id v15 = (id)[(CPEntityNameProviding *)v11 subtitle];

  v12 = [(CPSNameViewController *)v17 entity];
  id location = (id)[(CPEntityNameProviding *)v12 informativeText];

  v13 = [(CPSNameViewController *)v17 primaryLabel];
  if (v13)
  {
    id v8 = [(CPSNameViewController *)v17 primaryLabel];
    [(UILabel *)v8 setText:v16[0]];

    id v9 = [(CPSNameViewController *)v17 primaryLabel];
    [(UILabel *)v9 sizeToFit];
  }
  v7 = [(CPSNameViewController *)v17 secondaryLabel];

  if (v7)
  {
    v5 = [(CPSNameViewController *)v17 secondaryLabel];
    [(UILabel *)v5 setText:v15];

    double v6 = [(CPSNameViewController *)v17 secondaryLabel];
    [(UILabel *)v6 sizeToFit];
  }
  v4 = [(CPSNameViewController *)v17 tertiaryLabel];

  if (v4)
  {
    objc_super v2 = [(CPSNameViewController *)v17 tertiaryLabel];
    [(UILabel *)v2 setText:location];

    SEL v3 = [(CPSNameViewController *)v17 tertiaryLabel];
    [(UILabel *)v3 sizeToFit];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSNameViewController;
  [(CPSNameViewController *)&v3 traitCollectionDidChange:location[0]];
  [(CPSNameViewController *)v5 resetLayoutConstraints];
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  v5 = [(CPSNameViewController *)self layoutConstraints];
  uint64_t v6 = [(NSArray *)v5 count];

  if (v6)
  {
    objc_super v2 = (void *)MEMORY[0x263F08938];
    objc_super v3 = [(CPSNameViewController *)self layoutConstraints];
    objc_msgSend(v2, "deactivateConstraints:");

    [(CPSNameViewController *)self setLayoutConstraints:0];
    id v4 = (id)[(CPSNameViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  uint64_t v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSNameViewController;
  [(CPSNameViewController *)&v4 updateViewConstraints];
  objc_super v2 = [(CPSNameViewController *)v6 layoutConstraints];
  BOOL v3 = [(NSArray *)v2 count] != 0;

  if (!v3) {
    [(CPSNameViewController *)v6 setupLayoutConstraints];
  }
}

- (void)setupLayoutConstraints
{
  v28[4] = *MEMORY[0x263EF8340];
  id v27 = self;
  v26[1] = (id)a2;
  v26[0] = (id)objc_opt_new();
  id v21 = (id)[(CPSNameViewController *)v27 view];
  id v20 = (id)[v21 leadingAnchor];
  v19 = [(CPSNameViewController *)v27 stackView];
  id v18 = (id)[(CPSNameStackView *)v19 leadingAnchor];
  id v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v28[0] = v17;
  id v16 = (id)[(CPSNameViewController *)v27 view];
  id v15 = (id)[v16 topAnchor];
  v14 = [(CPSNameViewController *)v27 stackView];
  id v13 = (id)[(CPSNameStackView *)v14 topAnchor];
  id v12 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v28[1] = v12;
  id v11 = (id)[(CPSNameViewController *)v27 view];
  id v10 = (id)[v11 trailingAnchor];
  id v9 = [(CPSNameViewController *)v27 stackView];
  id v8 = (id)[(CPSNameStackView *)v9 trailingAnchor];
  id v7 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v28[2] = v7;
  id v6 = (id)[(CPSNameViewController *)v27 view];
  id v5 = (id)[v6 bottomAnchor];
  objc_super v4 = [(CPSNameViewController *)v27 stackView];
  id v3 = (id)[(CPSNameStackView *)v4 bottomAnchor];
  id v2 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  v28[3] = v2;
  id v25 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];

  [v26[0] addObjectsFromArray:v25];
  v22 = (void *)[v26[0] copy];
  [(CPSNameViewController *)v27 setLayoutConstraints:"setLayoutConstraints:"];

  id v23 = (void *)MEMORY[0x263F08938];
  id v24 = [(CPSNameViewController *)v27 layoutConstraints];
  objc_msgSend(v23, "activateConstraints:");

  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
}

- (void)viewWillLayoutSubviews
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v25 = self;
  SEL v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)CPSNameViewController;
  [(CPSNameViewController *)&v23 viewWillLayoutSubviews];
  double v22 = 0.0;
  memset(__b, 0, sizeof(__b));
  id v17 = [(CPSNameViewController *)v25 stackView];
  id obj = (id)[(CPSNameStackView *)v17 arrangedSubviews];

  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v19)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v19;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v15);
      double v12 = v22;
      [v21 bounds];
      double Width = CGRectGetWidth(v28);
      double v3 = v12;
      if (v12 < Width)
      {
        objc_msgSend(v21, "bounds", v12);
        double v3 = CGRectGetWidth(v29);
        double v22 = v3;
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16, v3);
        if (!v16) {
          break;
        }
      }
    }
  }

  double v9 = v22;
  id v10 = [(CPSNameViewController *)v25 stackView];
  [(CPSNameStackView *)v10 fittingWidth];
  abs(v9 - v4);
  BOOL v11 = (double)v5 <= 20.0;

  if (!v11)
  {
    double v6 = v22 + 20.0;
    id v7 = [(CPSNameViewController *)v25 stackView];
    [(CPSNameStackView *)v7 setFittingWidth:v6];

    id v8 = [(CPSNameViewController *)v25 stackView];
    [(CPSNameStackView *)v8 invalidateIntrinsicContentSize];
  }
}

- (CPEntityNameProviding)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (CPSNameStackView)stackView
{
  return self->_stackView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end