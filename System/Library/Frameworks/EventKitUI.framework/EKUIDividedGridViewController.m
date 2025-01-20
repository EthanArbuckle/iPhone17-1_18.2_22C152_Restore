@interface EKUIDividedGridViewController
+ (id)dividerColor;
- (CGSize)intrinsicContentSize;
- (EKUIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 cellBackgroundColor:(id)a5;
- (EKUIDividedGridViewControllerDelegate)delegate;
- (NSArray)allCells;
- (NSArray)buttonTitles;
- (NSArray)weekViews;
- (double)_neededHeight;
- (double)_rowHeightForWidth:(double)a3;
- (double)preferredInset;
- (double)preferredWidth;
- (id)_newDividerView;
- (void)cellTapped:(id)a3;
- (void)loadView;
- (void)setAllCells:(id)a3;
- (void)setButtonTitles:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredInset:(double)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setWeekViews:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation EKUIDividedGridViewController

+ (id)dividerColor
{
  if (dividerColor_onceToken != -1) {
    dispatch_once(&dividerColor_onceToken, &__block_literal_global_65);
  }
  v2 = (void *)dividerColor___dividerColor;

  return v2;
}

void __45__EKUIDividedGridViewController_dividerColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] separatorColor];
  v1 = (void *)dividerColor___dividerColor;
  dividerColor___dividerColor = v0;
}

- (EKUIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 cellBackgroundColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKUIDividedGridViewController;
  v11 = [(EKUIDividedGridViewController *)&v14 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_buttonTitles, a4);
    objc_storeStrong((id *)&v12->_cellBackgroundColor, a5);
  }

  return v12;
}

- (void)loadView
{
  v2 = self;
  v98[1] = *MEMORY[0x1E4F143B8];
  int64_t type = self->_type;
  uint64_t v4 = 7;
  if (type != 1) {
    uint64_t v4 = 0;
  }
  BOOL v5 = type == 0;
  uint64_t v6 = 4;
  if (!v5) {
    uint64_t v6 = v4;
  }
  unint64_t v84 = v6;
  v82 = objc_opt_new();
  v81 = objc_opt_new();
  v97 = @"dividerWidth";
  v7 = NSNumber;
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  id v10 = [v7 numberWithDouble:1.0 / v9];
  v98[0] = v10;
  v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:&v97 count:1];

  v11 = [(EKUIDividedGridViewController *)v2 buttonTitles];
  uint64_t v12 = [v11 count];

  unint64_t v13 = 0x1E4F28000uLL;
  v90 = v2;
  if (v12)
  {
    objc_super v14 = 0;
    v15 = 0;
    v16 = 0;
    unint64_t v17 = 0;
    while (1)
    {
      v18 = [(EKUIDividedGridViewController *)v2 buttonTitles];
      uint64_t v19 = [v18 count];

      if (!(v17 % v84))
      {
        uint64_t v20 = objc_opt_new();

        uint64_t v21 = objc_opt_new();
        [v81 addObject:v20];
        v15 = (void *)v21;
        objc_super v14 = (void *)v20;
      }
      v86 = v14;
      v22 = [EKUIDividedGridViewCell alloc];
      v23 = v22;
      firstValue = v16;
      uint64_t v83 = v19;
      if (v2->_cellBackgroundColor)
      {
        v24 = -[EKUIDividedGridViewCell initWithBackgroundColor:](v22, "initWithBackgroundColor:");
      }
      else
      {
        v25 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
        v24 = [(EKUIDividedGridViewCell *)v23 initWithBackgroundColor:v25];
      }
      unint64_t v26 = v17 + 1;
      [(EKUIDividedGridViewCell *)v24 setViewController:v2];
      [(EKUIDividedGridViewCell *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
      v27 = [(EKUIDividedGridViewController *)v2 buttonTitles];
      v28 = [v27 objectAtIndexedSubscript:v17];
      [(EKUIDividedGridViewCell *)v24 label];
      v30 = v29 = v2;
      [v30 setText:v28];

      [v82 addObject:v24];
      objc_super v14 = v86;
      [v86 addSubview:v24];
      v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:8 relatedBy:0 toItem:v86 attribute:8 multiplier:1.0 constant:0.0];
      [v15 addObject:v31];

      v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:3 relatedBy:0 toItem:v86 attribute:3 multiplier:1.0 constant:0.0];
      [v15 addObject:v32];

      v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
      [(EKUIDividedGridViewCell *)v24 setWidthConstraint:v33];

      v34 = [(EKUIDividedGridViewCell *)v24 widthConstraint];
      LODWORD(v35) = 1148846080;
      [v34 setPriority:v35];

      v36 = [(EKUIDividedGridViewCell *)v24 widthConstraint];
      [v86 addConstraint:v36];

      if (!(v17 % v84)) {
        break;
      }
      unint64_t v37 = v26 % v84;
      id v38 = [(EKUIDividedGridViewController *)v29 _newDividerView];
      [v86 addSubview:v38];
      v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:v38 attribute:8 relatedBy:0 toItem:v86 attribute:8 multiplier:1.0 constant:0.0];
      [v15 addObject:v39];

      v40 = (void *)MEMORY[0x1E4F28DC8];
      v41 = firstValue;
      v42 = _NSDictionaryOfVariableBindings(&cfstr_Previousbutton.isa, firstValue, v38, v24, 0);
      v43 = [v40 constraintsWithVisualFormat:@"H:[previousButton][dividerView(==dividerWidth)][buttonView]" options:1024 metrics:v91 views:v42];
      [v15 addObjectsFromArray:v43];

      if (v17 == v83 - 1 && v37)
      {
        id v44 = [(EKUIDividedGridViewController *)v90 _newDividerView];
        [v86 addSubview:v44];
        v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:v44 attribute:8 relatedBy:0 toItem:v86 attribute:8 multiplier:1.0 constant:0.0];
        [v15 addObject:v45];

        v46 = (void *)MEMORY[0x1E4F28DC8];
        v47 = _NSDictionaryOfVariableBindings(&cfstr_ButtonviewEndo.isa, v24, v44, 0);
        v48 = [v46 constraintsWithVisualFormat:@"H:[buttonView][endOfWeekDivider(==dividerWidth)]|" options:1024 metrics:v91 views:v47];
        [v15 addObjectsFromArray:v48];

        goto LABEL_19;
      }
      objc_super v14 = v86;
      if (!v37)
      {
        v50 = (void *)MEMORY[0x1E4F28DC8];
        _NSDictionaryOfVariableBindings(&cfstr_Previousbutton.isa, firstValue, v38, v24, 0);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        v47 = [v50 constraintsWithVisualFormat:@"H:[buttonView]|" options:1024 metrics:v91 views:v44];
        [v15 addObjectsFromArray:v47];
LABEL_19:

        objc_super v14 = v86;
LABEL_20:
      }
      v2 = v90;

      v51 = [v14 buttonViews];
      [v51 addObject:v24];

      [v14 addConstraints:v15];
      v52 = [(EKUIDividedGridViewController *)v90 buttonTitles];
      unint64_t v53 = [v52 count];

      v16 = v24;
      ++v17;
      BOOL v54 = v26 >= v53;
      unint64_t v13 = 0x1E4F28000;
      if (v54)
      {

        goto LABEL_25;
      }
    }
    v49 = (void *)MEMORY[0x1E4F28DC8];
    _NSDictionaryOfVariableBindings(&cfstr_Buttonview.isa, v24, 0);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    id v44 = [v49 constraintsWithVisualFormat:@"H:|[buttonView]" options:1024 metrics:v91 views:v38];
    [v15 addObjectsFromArray:v44];
    v41 = firstValue;
    goto LABEL_20;
  }
  v15 = 0;
  objc_super v14 = 0;
LABEL_25:
  v85 = v15;
  v87 = v14;
  v55 = objc_opt_new();
  [v55 setViewController:v2];
  v56 = objc_opt_new();
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id firstValuea = v81;
  uint64_t v57 = [firstValuea countByEnumeratingWithState:&v92 objects:v96 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    id v59 = 0;
    uint64_t v60 = *(void *)v93;
    do
    {
      uint64_t v61 = 0;
      v62 = v59;
      do
      {
        if (*(void *)v93 != v60) {
          objc_enumerationMutation(firstValuea);
        }
        v63 = *(void **)(*((void *)&v92 + 1) + 8 * v61);
        [v63 setTranslatesAutoresizingMaskIntoConstraints:0];
        v64 = [*(id *)(v13 + 3528) constraintWithItem:v63 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:43.5];
        [v63 setHeightConstraint:v64];

        v65 = [v63 heightConstraint];
        [v63 addConstraint:v65];

        [v55 addSubview:v63];
        v66 = *(void **)(v13 + 3528);
        v67 = _NSDictionaryOfVariableBindings(&cfstr_Weekview.isa, v63, 0);
        v68 = [v66 constraintsWithVisualFormat:@"H:|[weekView]" options:0 metrics:0 views:v67];
        [v56 addObjectsFromArray:v68];

        v69 = [*(id *)(v13 + 3528) constraintWithItem:v55 attribute:7 relatedBy:1 toItem:v63 attribute:7 multiplier:1.0 constant:0.0];
        [v56 addObject:v69];

        if (v62)
        {
          id v70 = [(EKUIDividedGridViewController *)v90 _newDividerView];
          [v55 addSubview:v70];
          v71 = *(void **)(v13 + 3528);
          v72 = _NSDictionaryOfVariableBindings(&cfstr_Dividerview.isa, v70, 0);
          v73 = [v71 constraintsWithVisualFormat:@"H:|[dividerView]|" options:0 metrics:0 views:v72];
          [v56 addObjectsFromArray:v73];

          v74 = (void *)MEMORY[0x1E4F28DC8];
          v75 = _NSDictionaryOfVariableBindings(&cfstr_PreviousviewWe.isa, v62, v63, v70, 0);
          v76 = [v74 constraintsWithVisualFormat:@"V:[previousView][dividerView(==dividerWidth)][weekView]" options:0 metrics:v91 views:v75];
          [v56 addObjectsFromArray:v76];

          unint64_t v13 = 0x1E4F28000;
        }
        id v59 = v63;

        ++v61;
        v62 = v59;
      }
      while (v58 != v61);
      uint64_t v58 = [firstValuea countByEnumeratingWithState:&v92 objects:v96 count:16];
    }
    while (v58);
  }
  else
  {
    id v59 = 0;
  }

  v77 = *(void **)(v13 + 3528);
  v78 = [firstValuea objectAtIndexedSubscript:0];
  v79 = [v77 constraintWithItem:v55 attribute:3 relatedBy:0 toItem:v78 attribute:3 multiplier:1.0 constant:0.0];
  [v56 addObject:v79];

  v80 = [*(id *)(v13 + 3528) constraintWithItem:v55 attribute:4 relatedBy:0 toItem:v59 attribute:4 multiplier:1.0 constant:0.0];
  [v56 addObject:v80];

  [v55 addConstraints:v56];
  [(EKUIDividedGridViewController *)v90 setView:v55];
  [(EKUIDividedGridViewController *)v90 setAllCells:v82];
  [(EKUIDividedGridViewController *)v90 setWeekViews:firstValuea];
}

- (id)_newDividerView
{
  v2 = objc_opt_new();
  v3 = +[EKUIDividedGridViewController dividerColor];
  [v2 setBackgroundColor:v3];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (void)cellTapped:(id)a3
{
  id v4 = a3;
  id v6 = [(EKUIDividedGridViewController *)self delegate];
  BOOL v5 = [(EKUIDividedGridViewController *)self allCells];
  objc_msgSend(v6, "dividedGridViewController:didSelectCell:atIndex:", self, v4, objc_msgSend(v5, "indexOfObject:", v4));
}

- (void)viewWillLayoutSubviews
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(EKUIDividedGridViewController *)self preferredWidth];
  double v4 = v3;
  BOOL v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  double v7 = 1.0 / v6;

  int64_t type = self->_type;
  if (type == 1)
  {
    double v9 = v4 + v7 * -6.0;
    double v10 = 7.0;
  }
  else if (type)
  {
    double v10 = 0.0;
    double v9 = v4;
  }
  else
  {
    double v9 = v4 + v7 * -3.0;
    double v10 = 4.0;
  }
  [(EKUIDividedGridViewController *)self preferredInset];
  double v12 = (v4 - v11) / v10;
  double v13 = CalFloorToScreenScale(v12);
  double v14 = CalCeilToScreenScale(v12);
  v15 = objc_opt_new();
  if (v10 > 0.0)
  {
    int v16 = 1;
    do
    {
      unint64_t v17 = [NSNumber numberWithDouble:v13];
      [v15 addObject:v17];

      double v18 = (double)v16++;
    }
    while (v10 > v18);
  }
  uint64_t v19 = [v15 valueForKeyPath:@"@sum.self"];
  [v19 doubleValue];
  double v21 = v20;

  if (v21 < v9)
  {
    char v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = (uint64_t)(v10 + -1.0);
    do
    {
      if (v10 <= (double)v23 || v24 < 1 || v23 >= v24) {
        break;
      }
      v27 = [NSNumber numberWithDouble:v14];
      if (v22)
      {
        [v15 setObject:v27 atIndexedSubscript:v23];

        ++v23;
      }
      else
      {
        [v15 setObject:v27 atIndexedSubscript:v24];

        --v24;
      }
      v22 ^= 1u;
      v28 = [v15 valueForKeyPath:@"@sum.self"];
      [v28 doubleValue];
      double v30 = v29;
    }
    while (v30 < v9);
  }
  [(EKUIDividedGridViewController *)self _rowHeightForWidth:v14];
  double v32 = v31;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v33 = [(EKUIDividedGridViewController *)self weekViews];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v39 = [v38 buttonViews];
        uint64_t v40 = [v39 count];

        if (v40)
        {
          unint64_t v41 = 0;
          do
          {
            v42 = [v38 buttonViews];
            v43 = [v42 objectAtIndexedSubscript:v41];

            id v44 = [v15 objectAtIndexedSubscript:v41];
            [v44 doubleValue];
            double v46 = v45;
            v47 = [v43 widthConstraint];
            [v47 setConstant:v46];

            ++v41;
            v48 = [v38 buttonViews];
            unint64_t v49 = [v48 count];
          }
          while (v49 > v41);
        }
        v50 = [v38 heightConstraint];
        [v50 setConstant:v32];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v35);
  }
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(EKUIDividedGridViewController *)self delegate];
  [v3 dividedGridViewControllerDidLayout:self];
}

- (double)_neededHeight
{
  id v3 = [(EKUIDividedGridViewController *)self weekViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = (double)v4;
    double v6 = [(EKUIDividedGridViewController *)self weekViews];
    double v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v7 heightConstraint];
    [v8 constant];
    double v10 = v9;
    double v11 = (double)(v4 + 1);
    double v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 scale];
    double v14 = 1.0 / v13 * v11 + v5 * v10;
  }
  else
  {
    [(EKUIDividedGridViewController *)self preferredWidth];
    double v16 = v15;
    double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v14 = v16 + 1.0 / v17 * 2.0;
  }

  return v14;
}

- (double)_rowHeightForWidth:(double)a3
{
  CalRoundToScreenScale(43.5);
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(EKUIDividedGridViewController *)self preferredWidth];
  double v4 = v3;
  [(EKUIDividedGridViewController *)self _neededHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setPreferredWidth:(double)a3
{
  if (self->_preferredWidth != a3)
  {
    self->_preferredWidth = a3;
    double v4 = [(EKUIDividedGridViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(EKUIDividedGridViewController *)self view];
    [v5 invalidateIntrinsicContentSize];
  }
}

- (NSArray)buttonTitles
{
  return self->_buttonTitles;
}

- (void)setButtonTitles:(id)a3
{
}

- (NSArray)allCells
{
  return (NSArray *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setAllCells:(id)a3
{
}

- (EKUIDividedGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIDividedGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)weekViews
{
  return (NSArray *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setWeekViews:(id)a3
{
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (double)preferredInset
{
  return self->_preferredInset;
}

- (void)setPreferredInset:(double)a3
{
  self->_preferredInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allCells, 0);
  objc_storeStrong((id *)&self->_buttonTitles, 0);

  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
}

@end