@interface DKNotableUserDataCardView
- (BOOL)isExpanded;
- (DKNotableUserDataCardPrimaryCell)primaryCell;
- (DKNotableUserDataCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (NSLayoutConstraint)bottomStackViewConstraint;
- (NSMutableArray)cells;
- (UIStackView)secondaryStackView;
- (UIStackView)stackView;
- (void)_toggleExpanded;
- (void)addCardCell:(id)a3;
- (void)setBottomStackViewConstraint:(id)a3;
- (void)setCells:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setPrimaryCell:(id)a3;
- (void)setSecondaryStackView:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation DKNotableUserDataCardView

- (DKNotableUserDataCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  v48[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)DKNotableUserDataCardView;
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  v15 = -[DKNotableUserDataCardView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x263F001A8], v12, v13, v14);
  if (v15)
  {
    v16 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    [(DKNotableUserDataCardView *)v15 setBackgroundColor:v16];

    [(DKNotableUserDataCardView *)v15 _setContinuousCornerRadius:10.0];
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cells = v15->_cells;
    v15->_cells = v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", v11, v12, v13, v14);
    stackView = v15->_stackView;
    v15->_stackView = (UIStackView *)v19;

    [(UIStackView *)v15->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v15->_stackView setAxis:1];
    [(UIStackView *)v15->_stackView setSpacing:16.0];
    [(DKNotableUserDataCardView *)v15 addSubview:v15->_stackView];
    v21 = [(DKNotableUserDataCardView *)v15 bottomAnchor];
    [(UIStackView *)v15->_stackView bottomAnchor];
    v22 = id v45 = v8;
    uint64_t v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
    bottomStackViewConstraint = v15->_bottomStackViewConstraint;
    v15->_bottomStackViewConstraint = (NSLayoutConstraint *)v23;

    v42 = [(UIStackView *)v15->_stackView topAnchor];
    v41 = [(DKNotableUserDataCardView *)v15 topAnchor];
    v25 = [v42 constraintEqualToAnchor:v41];
    v48[0] = v25;
    v48[1] = v15->_bottomStackViewConstraint;
    [(UIStackView *)v15->_stackView leadingAnchor];
    v26 = id v44 = v9;
    [(DKNotableUserDataCardView *)v15 leadingAnchor];
    v27 = id v43 = v10;
    v28 = [v26 constraintEqualToAnchor:v27];
    v48[2] = v28;
    v29 = [(DKNotableUserDataCardView *)v15 trailingAnchor];
    v30 = [(UIStackView *)v15->_stackView trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v48[3] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
    [(DKNotableUserDataCardView *)v15 addConstraints:v32];

    id v10 = v43;
    id v9 = v44;

    id v8 = v45;
    v33 = [[DKNotableUserDataCardPrimaryCell alloc] initWithTitle:v45 subtitle:v44 icon:v43];
    primaryCell = v15->_primaryCell;
    v15->_primaryCell = v33;

    [(DKNotableUserDataCardPrimaryCell *)v15->_primaryCell setTranslatesAutoresizingMaskIntoConstraints:0];
    -[DKNotableUserDataCardPrimaryCell setDirectionalLayoutMargins:](v15->_primaryCell, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    [(DKNotableUserDataCardPrimaryCell *)v15->_primaryCell setHideChevron:1];
    [(UIStackView *)v15->_stackView addArrangedSubview:v15->_primaryCell];
    v35 = [(DKNotableUserDataCardPrimaryCell *)v15->_primaryCell heightAnchor];
    v36 = [v35 constraintGreaterThanOrEqualToConstant:60.0];
    v47 = v36;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
    [(DKNotableUserDataCardView *)v15 addConstraints:v37];

    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", v11, v12, v13, v14);
    secondaryStackView = v15->_secondaryStackView;
    v15->_secondaryStackView = (UIStackView *)v38;

    [(UIStackView *)v15->_secondaryStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v15->_secondaryStackView setAxis:1];
    [(UIStackView *)v15->_secondaryStackView setSpacing:16.0];
    [(UIStackView *)v15->_secondaryStackView setLayoutMarginsRelativeArrangement:1];
    [(DKNotableUserDataCardPrimaryCell *)v15->_primaryCell directionalLayoutMargins];
    [(UIStackView *)v15->_secondaryStackView setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
  }

  return v15;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  self->_expanded = a3;
  v5 = [(DKNotableUserDataCardView *)self primaryCell];
  [v5 setExpanded:v3];

  v6 = [(DKNotableUserDataCardView *)self bottomStackViewConstraint];
  v7 = v6;
  if (v3)
  {
    [v6 setConstant:20.0];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = [(DKNotableUserDataCardView *)self cells];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
          double v14 = [(DKNotableUserDataCardView *)self secondaryStackView];
          [v14 addArrangedSubview:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }

    v15 = [(DKNotableUserDataCardView *)self stackView];
    v16 = [(DKNotableUserDataCardView *)self secondaryStackView];
    [v15 addArrangedSubview:v16];
  }
  else
  {
    [v6 setConstant:0.0];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = [(DKNotableUserDataCardView *)self cells];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
          uint64_t v23 = [(DKNotableUserDataCardView *)self secondaryStackView];
          [v23 removeArrangedSubview:v22];

          [v22 removeFromSuperview];
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    v24 = [(DKNotableUserDataCardView *)self stackView];
    v25 = [(DKNotableUserDataCardView *)self secondaryStackView];
    [v24 removeArrangedSubview:v25];

    v15 = [(DKNotableUserDataCardView *)self secondaryStackView];
    [v15 removeFromSuperview];
  }
}

- (void)addCardCell:(id)a3
{
  id v4 = a3;
  v5 = [(DKNotableUserDataCardView *)self cells];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__toggleExpanded];
    [(DKNotableUserDataCardPrimaryCell *)self->_primaryCell addGestureRecognizer:v7];
  }
  [(DKNotableUserDataCardPrimaryCell *)self->_primaryCell setHideChevron:0];
  id v8 = [(DKNotableUserDataCardView *)self cells];
  [v8 addObject:v4];
}

- (void)_toggleExpanded
{
  uint64_t v3 = [(DKNotableUserDataCardView *)self isExpanded] ^ 1;
  [(DKNotableUserDataCardView *)self setExpanded:v3];
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)secondaryStackView
{
  return self->_secondaryStackView;
}

- (void)setSecondaryStackView:(id)a3
{
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSLayoutConstraint)bottomStackViewConstraint
{
  return self->_bottomStackViewConstraint;
}

- (void)setBottomStackViewConstraint:(id)a3
{
}

- (DKNotableUserDataCardPrimaryCell)primaryCell
{
  return self->_primaryCell;
}

- (void)setPrimaryCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCell, 0);
  objc_storeStrong((id *)&self->_bottomStackViewConstraint, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_secondaryStackView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end