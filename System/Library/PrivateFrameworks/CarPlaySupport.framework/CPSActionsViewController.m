@interface CPSActionsViewController
- (CGSize)buttonGlyphSize;
- (CGSize)buttonSize;
- (CPEntityActionsProviding)entity;
- (CPSActionButtonLayoutDelegate)layoutDelegate;
- (CPSActionsViewController)initWithEntity:(id)a3 layoutDelete:(id)a4;
- (CPSEntityContentViewControllerDelegate)eventDelegate;
- (NSArray)layoutConstraints;
- (UIFocusGuide)focusGuide;
- (UIStackView)stackView;
- (double)buttonRadius;
- (void)didSelectButton:(id)a3;
- (void)resetLayoutConstraints;
- (void)setEntity:(id)a3;
- (void)setEventDelegate:(id)a3;
- (void)setFocusGuide:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setStackView:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)updateViews;
- (void)updateWithEntity:(id)a3;
- (void)viewDidLoad;
@end

@implementation CPSActionsViewController

- (CPSActionsViewController)initWithEntity:(id)a3 layoutDelete:(id)a4
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
  v9.super_class = (Class)CPSActionsViewController;
  v8 = -[CPSActionsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v12->_entity, location[0]);
    [(CPSActionsViewController *)v12 setLayoutDelegate:v10];
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)setLayoutDelegate:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_layoutDelegate);
  BOOL v4 = WeakRetained == location[0];

  if (!v4)
  {
    objc_storeWeak((id *)&v6->_layoutDelegate, location[0]);
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xFE | objc_opt_respondsToSelector() & 1;
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xFD | (2 * (objc_opt_respondsToSelector() & 1));
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xFB | (4 * (objc_opt_respondsToSelector() & 1));
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xF7 | (8 * (objc_opt_respondsToSelector() & 1));
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xEF | (16 * (objc_opt_respondsToSelector() & 1));
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xDF | (32 * (objc_opt_respondsToSelector() & 1));
    *(unsigned char *)&v6->_layoutflags = *(unsigned char *)&v6->_layoutflags & 0xBF | ((objc_opt_respondsToSelector() & 1) << 6);
  }
  objc_storeStrong(location, 0);
}

- (void)updateWithEntity:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSActionsViewController *)v4 setEntity:location[0]];
  [(CPSActionsViewController *)v4 updateViews];
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  BOOL v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSActionsViewController;
  [(CPSActionsViewController *)&v2 viewDidLoad];
  [(CPSActionsViewController *)v4 setupViews];
  [(CPSActionsViewController *)v4 updateViews];
}

- (void)setupViews
{
  v17[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  -[CPSActionsViewController setStackView:](self, "setStackView:");

  SEL v3 = [(CPSActionsViewController *)self stackView];
  [(UIStackView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v4 = [(CPSActionsViewController *)self stackView];
  -[UIStackView setAlignment:](v4, "setAlignment:");

  v5 = [(CPSActionsViewController *)self stackView];
  [(UIStackView *)v5 setAxis:0];

  v6 = [(CPSActionsViewController *)self stackView];
  [(UIStackView *)v6 setDistribution:3];

  id v8 = (id)[(CPSActionsViewController *)self view];
  v7 = [(CPSActionsViewController *)self stackView];
  objc_msgSend(v8, "addSubview:");

  id v9 = objc_alloc_init(MEMORY[0x263F1C640]);
  -[CPSActionsViewController setFocusGuide:](self, "setFocusGuide:");

  v12 = [(CPSActionsViewController *)self stackView];
  v17[0] = v12;
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v10 = [(CPSActionsViewController *)self focusGuide];
  [(UIFocusGuide *)v10 setPreferredFocusEnvironments:v11];

  v13 = [(CPSActionsViewController *)self focusGuide];
  [(UIFocusGuide *)v13 setEnabled:1];

  id v15 = (id)[(CPSActionsViewController *)self view];
  v14 = [(CPSActionsViewController *)self focusGuide];
  objc_msgSend(v15, "addLayoutGuide:");
}

- (void)updateViews
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v49 = self;
  v48[1] = (id)a2;
  v48[0] = (id)[MEMORY[0x263EFF980] array];
  id v24 = (id)[v49 stackView];
  id v23 = (id)[v24 arrangedSubviews];
  uint64_t v42 = MEMORY[0x263EF8330];
  int v43 = -1073741824;
  int v44 = 0;
  v45 = __39__CPSActionsViewController_updateViews__block_invoke;
  v46 = &unk_2648A3BB8;
  id v47 = v48[0];
  [v23 enumerateObjectsUsingBlock:&v42];

  uint64_t v25 = [v48[0] count];
  id v27 = (id)[v49 entity];
  id v26 = (id)[v27 actionButtons];
  BOOL v28 = v25 != [v26 count];

  if (v28)
  {
    memset(__b, 0, sizeof(__b));
    id v19 = (id)[v49 stackView];
    id obj = (id)[v19 arrangedSubviews];

    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v51 count:16];
    if (v21)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0;
      unint64_t v18 = v21;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(obj);
        }
        id v35 = *(id *)(__b[1] + 8 * v17);
        id v14 = (id)[v49 stackView];
        [v14 removeArrangedSubview:v35];

        [v35 removeFromSuperview];
        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v51 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    memset(v32, 0, sizeof(v32));
    id v11 = (id)[v49 entity];
    id v12 = (id)[v11 actionButtons];

    uint64_t v13 = [v12 countByEnumeratingWithState:v32 objects:v50 count:16];
    if (v13)
    {
      uint64_t v8 = *(void *)v32[2];
      uint64_t v9 = 0;
      unint64_t v10 = v13;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)v32[2] != v8) {
          objc_enumerationMutation(v12);
        }
        id v33 = *(id *)(v32[1] + 8 * v9);
        v31 = +[CPSEntityButton buttonWithEntityButton:v33];
        id v6 = (id)[v33 identifier];
        -[CPSButton setIdentifier:](v31, "setIdentifier:");

        if ((*((unsigned char *)v49 + 976) & 0x40) != 0)
        {
          id v5 = (id)[v49 layoutDelegate];
          [v5 configureButton:v31];
        }
        [(CPSButton *)v31 setDelegate:v49];
        [(CPSActionButton *)v31 setLayoutDelegate:v49];
        id v4 = (id)[v49 stackView];
        [v4 addArrangedSubview:v31];

        objc_storeStrong((id *)&v31, 0);
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v12 countByEnumeratingWithState:v32 objects:v50 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v30 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v29 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v2 = (id)[v49 stackView];
    [v2 insertArrangedSubview:v30 atIndex:0];

    id v3 = (id)[v49 stackView];
    [v3 addArrangedSubview:v29];

    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    id v22 = v48[0];
    uint64_t v36 = MEMORY[0x263EF8330];
    int v37 = -1073741824;
    int v38 = 0;
    v39 = __39__CPSActionsViewController_updateViews__block_invoke_2;
    v40 = &unk_2648A4628;
    id v41 = v49;
    [v22 enumerateObjectsUsingBlock:&v36];
    objc_storeStrong(&v41, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v48, 0);
}

void __39__CPSActionsViewController_updateViews__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a1;
  id v4 = objc_opt_class();
  v8[0] = CPSSafeCast_5(v4, location[0]);
  if (v8[0]) {
    [a1[4] addObject:v8[0]];
  }
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
}

void __39__CPSActionsViewController_updateViews__block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = (id)[a1[4] entity];
  id v6 = (id)[v7 actionButtons];
  id v5 = (id)[v6 objectAtIndex:a3];
  objc_msgSend(location[0], "setEntityButton:");

  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSActionsViewController;
  [(CPSActionsViewController *)&v3 traitCollectionDidChange:location[0]];
  [(CPSActionsViewController *)v5 resetLayoutConstraints];
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  id v5 = [(CPSActionsViewController *)self layoutConstraints];
  uint64_t v6 = [(NSArray *)v5 count];

  if (v6)
  {
    id v2 = (void *)MEMORY[0x263F08938];
    objc_super v3 = [(CPSActionsViewController *)self layoutConstraints];
    objc_msgSend(v2, "deactivateConstraints:");

    [(CPSActionsViewController *)self setLayoutConstraints:0];
    id v4 = (id)[(CPSActionsViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  uint64_t v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSActionsViewController;
  [(CPSActionsViewController *)&v4 updateViewConstraints];
  id v2 = [(CPSActionsViewController *)v6 layoutConstraints];
  BOOL v3 = [(NSArray *)v2 count] != 0;

  if (!v3) {
    [(CPSActionsViewController *)v6 setupLayoutConstraints];
  }
}

- (void)setupLayoutConstraints
{
  v82[4] = *MEMORY[0x263EF8340];
  v79 = self;
  v78[1] = (id)a2;
  v78[0] = (id)objc_opt_new();
  id v77 = 0;
  char v75 = 0;
  if ((*(unsigned char *)&v79->_layoutflags & 0x20) != 0)
  {
    v76 = [(CPSActionsViewController *)v79 layoutDelegate];
    char v75 = 1;
    int v73 = [(CPSActionButtonLayoutDelegate *)v76 buttonsShouldFill] & 1;
  }
  else
  {
    int v73 = 0;
  }
  if (v75) {

  }
  if (v73)
  {
    id v72 = (id)[(CPSActionsViewController *)v79 view];
    id v71 = (id)[v72 topAnchor];
    v70 = [(CPSActionsViewController *)v79 stackView];
    id v69 = (id)[(UIStackView *)v70 topAnchor];
    id v68 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
    v82[0] = v68;
    id v67 = (id)[(CPSActionsViewController *)v79 view];
    id v66 = (id)[v67 trailingAnchor];
    v65 = [(CPSActionsViewController *)v79 stackView];
    id v64 = (id)[(UIStackView *)v65 trailingAnchor];
    id v63 = (id)objc_msgSend(v66, "constraintEqualToAnchor:");
    v82[1] = v63;
    id v62 = (id)[(CPSActionsViewController *)v79 view];
    id v61 = (id)[v62 leadingAnchor];
    v60 = [(CPSActionsViewController *)v79 stackView];
    id v59 = (id)[(UIStackView *)v60 leadingAnchor];
    id v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v82[2] = v58;
    id v57 = (id)[(CPSActionsViewController *)v79 view];
    id v56 = (id)[v57 bottomAnchor];
    v55 = [(CPSActionsViewController *)v79 stackView];
    id v54 = (id)[(UIStackView *)v55 bottomAnchor];
    id v53 = (id)objc_msgSend(v56, "constraintEqualToAnchor:");
    v82[3] = v53;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:4];
    id v3 = v77;
    id v77 = v2;
  }
  else
  {
    id v33 = [(CPSActionsViewController *)v79 entity];
    id v32 = (id)[(CPEntityActionsProviding *)v33 actionButtons];
    uint64_t v34 = [v32 count];

    [(CPSActionsViewController *)v79 buttonSize];
    double v74 = 8.0 * (double)(v34 - 1) + v4 * (double)v34;
    id v52 = (id)[(CPSActionsViewController *)v79 view];
    id v51 = (id)[v52 topAnchor];
    v50 = [(CPSActionsViewController *)v79 stackView];
    id v49 = (id)[(UIStackView *)v50 topAnchor];
    id v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
    v81[0] = v48;
    id v47 = (id)[(CPSActionsViewController *)v79 view];
    id v46 = (id)[v47 centerXAnchor];
    v45 = [(CPSActionsViewController *)v79 stackView];
    id v44 = (id)[(UIStackView *)v45 centerXAnchor];
    id v43 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
    v81[1] = v43;
    uint64_t v42 = [(CPSActionsViewController *)v79 stackView];
    id v41 = (id)[(UIStackView *)v42 widthAnchor];
    id v40 = (id)[v41 constraintEqualToConstant:v74];
    v81[2] = v40;
    id v39 = (id)[(CPSActionsViewController *)v79 view];
    id v38 = (id)[v39 bottomAnchor];
    int v37 = [(CPSActionsViewController *)v79 stackView];
    id v36 = (id)[(UIStackView *)v37 bottomAnchor];
    id v35 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v81[3] = v35;
    id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    id v6 = v77;
    id v77 = v5;
  }
  [v78[0] addObjectsFromArray:v77];
  id v7 = v78[0];
  BOOL v28 = [(CPSActionsViewController *)v79 focusGuide];
  id v27 = (id)[(UIFocusGuide *)v28 topAnchor];
  id v26 = (id)[(CPSActionsViewController *)v79 view];
  id v25 = (id)[v26 topAnchor];
  id v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v80[0] = v24;
  id v23 = [(CPSActionsViewController *)v79 focusGuide];
  id v22 = (id)[(UIFocusGuide *)v23 leadingAnchor];
  id v21 = (id)[(CPSActionsViewController *)v79 view];
  id v20 = (id)[v21 leadingAnchor];
  id v19 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  v80[1] = v19;
  unint64_t v18 = [(CPSActionsViewController *)v79 focusGuide];
  id v17 = (id)[(UIFocusGuide *)v18 trailingAnchor];
  id v16 = (id)[(CPSActionsViewController *)v79 view];
  id v15 = (id)[v16 trailingAnchor];
  id v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v80[2] = v14;
  uint64_t v13 = [(CPSActionsViewController *)v79 focusGuide];
  id v12 = (id)[(UIFocusGuide *)v13 bottomAnchor];
  id v11 = (id)[(CPSActionsViewController *)v79 view];
  id v10 = (id)[v11 bottomAnchor];
  id v9 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v80[3] = v9;
  id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:4];
  objc_msgSend(v7, "addObjectsFromArray:");

  id v29 = (id)[v78[0] copy];
  [(CPSActionsViewController *)v79 setLayoutConstraints:"setLayoutConstraints:"];

  id v30 = (void *)MEMORY[0x263F08938];
  v31 = [(CPSActionsViewController *)v79 layoutConstraints];
  objc_msgSend(v30, "activateConstraints:");

  objc_storeStrong(&v77, 0);
  objc_storeStrong(v78, 0);
}

- (void)didSelectButton:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v4 = [(CPSActionsViewController *)v9 eventDelegate];
  char v6 = 0;
  char v5 = 0;
  if (v4)
  {
    id v7 = [(CPSActionsViewController *)v9 eventDelegate];
    char v6 = 1;
    char v5 = objc_opt_respondsToSelector();
  }
  if (v6) {

  }
  if (v5)
  {
    id v3 = [(CPSActionsViewController *)v9 eventDelegate];
    [(CPSEntityContentViewControllerDelegate *)v3 viewController:v9 didPressButton:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (CGSize)buttonSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_layoutDelegate);
    [v8 buttonSize];
    double v12 = v2;
    double v13 = v3;
  }
  else
  {
    CGSizeMake_3();
    double v12 = v4;
    double v13 = v5;
  }
  double v6 = v12;
  double v7 = v13;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)buttonGlyphSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_layoutDelegate);
    [v8 buttonSize];
    double v12 = v2;
    double v13 = v3;
  }
  else
  {
    CGSizeMake_3();
    double v12 = v4;
    double v13 = v5;
  }
  double v6 = v12;
  double v7 = v13;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)buttonRadius
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 8.0;
  }
  id v4 = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  [v4 buttonRadius];
  double v8 = v2;

  return v8;
}

- (CPSEntityContentViewControllerDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);

  return (CPSEntityContentViewControllerDelegate *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (CPEntityActionsProviding)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (CPSActionButtonLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (CPSActionButtonLayoutDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end