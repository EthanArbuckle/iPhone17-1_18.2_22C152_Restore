@interface CPSInformationTemplateButtonsViewController
- (CPSButtonDelegate)buttonDelegate;
- (CPSInformationTemplateButtonsViewController)initWithButtons:(id)a3 buttonDelegate:(id)a4;
- (NSArray)buttons;
- (NSLayoutConstraint)heightConstraint;
- (UIStackView)buttonStackView;
- (id)preferredFocusEnvironments;
- (unint64_t)preferredButtonIndex;
- (void)_updateButtons;
- (void)_updateHeight;
- (void)setButtonDelegate:(id)a3;
- (void)setButtonIdentifier:(id)a3 enabled:(BOOL)a4;
- (void)setButtonStackView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setPreferredButtonIndex:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation CPSInformationTemplateButtonsViewController

- (CPSInformationTemplateButtonsViewController)initWithButtons:(id)a3 buttonDelegate:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)CPSInformationTemplateButtonsViewController;
  v13 = -[CPSInformationTemplateButtonsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    uint64_t v5 = [location[0] copy];
    buttons = v13->_buttons;
    v13->_buttons = (NSArray *)v5;

    objc_storeWeak((id *)&v13->_buttonDelegate, v11);
    v13->_preferredButtonIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (void)setButtons:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  buttons = v6->_buttons;
  v6->_buttons = (NSArray *)v3;

  [(CPSInformationTemplateButtonsViewController *)v6 _updateButtons];
  [(CPSInformationTemplateButtonsViewController *)v6 _updateHeight];
  objc_storeStrong(location, 0);
}

- (void)setButtonIdentifier:(id)a3 enabled:(BOOL)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  v6 = [(CPSInformationTemplateButtonsViewController *)v11 buttonStackView];
  uint64_t v5 = [(UIStackView *)v6 arrangedSubviews];
  id v7 = location[0];
  BOOL v8 = v9;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSInformationTemplateButtonsViewController_setButtonIdentifier_enabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v12 = a3;
  id v11 = a4;
  v10[1] = (id)a1;
  v4 = objc_opt_class();
  v10[0] = CPSSafeCast_18(v4, location[0]);
  id v8 = (id)[v10[0] identifier];
  char v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    [v10[0] setEnabled:*(unsigned char *)(a1 + 40) & 1];
    *id v11 = 1;
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  v28[6] = *MEMORY[0x263EF8340];
  v27 = self;
  SEL v26 = a2;
  v25.receiver = self;
  v25.super_class = (Class)CPSInformationTemplateButtonsViewController;
  [(CPSInformationTemplateButtonsViewController *)&v25 viewDidLoad];
  id v24 = (id)[(CPSInformationTemplateButtonsViewController *)v27 view];
  id v23 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 setAxis:0];
  [v23 setSpacing:12.0];
  [v23 setDistribution:1];
  [v24 addSubview:v23];
  [(CPSInformationTemplateButtonsViewController *)v27 setButtonStackView:v23];
  v4 = [(CPSInformationTemplateButtonsViewController *)v27 buttonStackView];
  id v3 = (id)[(UIStackView *)v4 heightAnchor];
  id v2 = (id)[v3 constraintEqualToConstant:32.0];
  -[CPSInformationTemplateButtonsViewController setHeightConstraint:](v27, "setHeightConstraint:");

  uint64_t v5 = (void *)MEMORY[0x263F08938];
  id v22 = (id)[v24 leftAnchor];
  id v21 = (id)[v23 leftAnchor];
  id v20 = (id)objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:");
  v28[0] = v20;
  id v19 = (id)[v24 rightAnchor];
  id v18 = (id)[v23 rightAnchor];
  id v17 = (id)objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:");
  v28[1] = v17;
  id v16 = (id)[v24 topAnchor];
  id v15 = (id)[v23 topAnchor];
  id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v28[2] = v14;
  id v13 = (id)[v23 centerXAnchor];
  id v12 = (id)[v24 centerXAnchor];
  id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v28[3] = v11;
  id v10 = (id)[v24 bottomAnchor];
  id v9 = (id)[v23 bottomAnchor];
  id v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v28[4] = v8;
  id v7 = [(CPSInformationTemplateButtonsViewController *)v27 heightConstraint];
  v28[5] = v7;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:6];
  objc_msgSend(v5, "activateConstraints:");

  [(CPSInformationTemplateButtonsViewController *)v27 _updateButtons];
  [(CPSInformationTemplateButtonsViewController *)v27 _updateHeight];
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
}

- (void)_updateHeight
{
  id v6 = [(CPSInformationTemplateButtonsViewController *)self buttons];
  uint64_t v2 = [(NSArray *)v6 count];
  double v3 = 32.0;
  if (!v2) {
    double v3 = 0.0;
  }
  double v4 = v3;
  uint64_t v5 = [(CPSInformationTemplateButtonsViewController *)self heightConstraint];
  [(NSLayoutConstraint *)v5 setConstant:v4];
}

- (void)_updateButtons
{
  id v22 = self;
  v21[1] = (id)a2;
  id v8 = [(CPSInformationTemplateButtonsViewController *)self buttonStackView];
  id v7 = [(UIStackView *)v8 arrangedSubviews];
  v21[0] = (id)[(NSArray *)v7 copy];

  id v20 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v22];
  id v9 = objc_opt_class();
  id v10 = (id)[v20 focusedItem];
  id v19 = CPSSafeCast_18(v9, v10);

  uint64_t v18 = 0;
  if (v19) {
    uint64_t v6 = [v21[0] indexOfObject:v19];
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v18 = v6;
  [v21[0] enumerateObjectsUsingBlock:&__block_literal_global_14];
  uint64_t v5 = [(CPSInformationTemplateButtonsViewController *)v22 buttons];
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __61__CPSInformationTemplateButtonsViewController__updateButtons__block_invoke_2;
  id v16 = &unk_2648A5558;
  id v17 = v22;
  [(NSArray *)v5 enumerateObjectsUsingBlock:&v12];

  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v18;
    double v3 = [(CPSInformationTemplateButtonsViewController *)v22 buttons];
    unint64_t v4 = [(NSArray *)v3 count] - 1;

    if (v11 >= v4) {
      unint64_t v2 = v4;
    }
    else {
      unint64_t v2 = v11;
    }
    [(CPSInformationTemplateButtonsViewController *)v22 setPreferredButtonIndex:v2];
    [(CPSInformationTemplateButtonsViewController *)v22 setNeedsFocusUpdate];
  }
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
}

void __61__CPSInformationTemplateButtonsViewController__updateButtons__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] removeFromSuperview];
  objc_storeStrong(location, 0);
}

void __61__CPSInformationTemplateButtonsViewController__updateButtons__block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[3] = a3;
  v13[2] = a4;
  v13[1] = a1;
  v13[0] = +[CPSStyledTextButton buttonWithTextButton:location[0]];
  id v6 = (id)[a1[4] buttonDelegate];
  objc_msgSend(v13[0], "setDelegate:");

  id v7 = (void *)MEMORY[0x263F08938];
  id v10 = (id)[v13[0] widthAnchor];
  id v9 = (id)[v10 constraintEqualToConstant:182.0];
  v15[0] = v9;
  id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  objc_msgSend(v7, "activateConstraints:");

  id v12 = (id)[a1[4] buttonStackView];
  [v12 addArrangedSubview:v13[0]];

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  v15[1] = *MEMORY[0x263EF8340];
  char v11 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  if ([(CPSInformationTemplateButtonsViewController *)self preferredButtonIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = [(CPSInformationTemplateButtonsViewController *)self preferredButtonIndex];
    id v12 = [(CPSInformationTemplateButtonsViewController *)self buttonStackView];
    char v11 = 1;
    id v10 = [(UIStackView *)v12 arrangedSubviews];
    char v9 = 1;
    BOOL v8 = v7 < [(NSArray *)v10 count];
  }
  if (v9) {

  }
  if (v11) {
  if (v8)
  }
  {
    id v6 = [(CPSInformationTemplateButtonsViewController *)self buttonStackView];
    uint64_t v5 = [(UIStackView *)v6 arrangedSubviews];
    id v4 = [(NSArray *)v5 objectAtIndexedSubscript:[(CPSInformationTemplateButtonsViewController *)self preferredButtonIndex]];
    v15[0] = v4;
    int v14 = (NSArray *)(id)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    double v3 = [(CPSInformationTemplateButtonsViewController *)self buttonStackView];
    int v14 = [(UIStackView *)v3 arrangedSubviews];
  }

  return v14;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (CPSButtonDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);

  return (CPSButtonDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (unint64_t)preferredButtonIndex
{
  return self->_preferredButtonIndex;
}

- (void)setPreferredButtonIndex:(unint64_t)a3
{
  self->_preferredButtonIndex = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end