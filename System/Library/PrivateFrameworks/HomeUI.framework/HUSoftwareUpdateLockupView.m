@interface HUSoftwareUpdateLockupView
- (BOOL)isObservingPreferredContentSize;
- (HUItemCollectionViewController)gridViewController;
- (HUSoftwareUpdateLockupView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)gridHeightConstraint;
- (NSSet)affectedAccessories;
- (UILabel)tertiaryDetailLabel;
- (id)getAssociatedViewForGridViewController:(id)a3;
- (id)initializeIconViewWithSize:(unint64_t)a3;
- (id)item;
- (void)clearAssociatedViewForGridViewController:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAffectedAccessories:(id)a3;
- (void)setAssociatedViewForGridViewController:(id)a3;
- (void)setGridHeightConstraint:(id)a3;
- (void)setGridViewController:(id)a3;
- (void)setIsObservingPreferredContentSize:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setTertiaryDetailLabel:(id)a3;
- (void)updateDescriptionExpandableTextView:(id)a3 animate:(BOOL)a4;
- (void)updateIconView:(id)a3 animate:(BOOL)a4;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUSoftwareUpdateLockupView

- (HUSoftwareUpdateLockupView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HUSoftwareUpdateLockupView;
  v3 = -[HULockupView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUSoftwareUpdateLockupView *)v3 setTertiaryDetailLabel:v5];

    v6 = [(HUSoftwareUpdateLockupView *)v3 tertiaryDetailLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(HUSoftwareUpdateLockupView *)v3 tertiaryDetailLabel];
    [v7 setNumberOfLines:2];

    v8 = [(HUSoftwareUpdateLockupView *)v3 tertiaryDetailLabel];
    [v8 setLineBreakMode:0];

    v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
    v10 = [(HUSoftwareUpdateLockupView *)v3 tertiaryDetailLabel];
    [v10 setFont:v9];

    v11 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v12 = [(HUSoftwareUpdateLockupView *)v3 tertiaryDetailLabel];
    [v12 setTextColor:v11];

    v13 = [(HULockupView *)v3 stackView];
    v14 = [(HUSoftwareUpdateLockupView *)v3 tertiaryDetailLabel];
    [v13 addArrangedSubview:v14];
  }
  return v3;
}

- (void)dealloc
{
  if ([(HUSoftwareUpdateLockupView *)self isObservingPreferredContentSize])
  {
    v3 = [(HUSoftwareUpdateLockupView *)self gridViewController];
    [v3 removeObserver:self forKeyPath:@"preferredContentSize" context:HUSoftwareUpdateLockupCellContext];

    [(HUSoftwareUpdateLockupView *)self setIsObservingPreferredContentSize:0];
  }
  [(HUSoftwareUpdateLockupView *)self setGridViewController:0];
  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateLockupView;
  [(HUSoftwareUpdateLockupView *)&v4 dealloc];
}

- (id)getAssociatedViewForGridViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_super v4 = objc_getAssociatedObject(v3, (const void *)HUSoftwareUpdateLockupCellAssociatedViewKey);

  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setAssociatedViewForGridViewController:(id)a3
{
}

- (void)clearAssociatedViewForGridViewController:(id)a3
{
}

- (void)setGridViewController:(id)a3
{
  id v38 = a3;
  id v5 = [(HUSoftwareUpdateLockupView *)self gridViewController];

  if (v5 != v38)
  {
    uint64_t v6 = [(HUSoftwareUpdateLockupView *)self gridViewController];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      v9 = [v8 view];
      v10 = [v9 superview];
      v11 = [(HULockupView *)self stackView];

      if (v10 == v11)
      {
        v12 = [(HUSoftwareUpdateLockupView *)self gridViewController];
        v13 = [v12 view];
        [v13 removeFromSuperview];

        v14 = [(HUSoftwareUpdateLockupView *)self gridViewController];
        [(HUSoftwareUpdateLockupView *)self clearAssociatedViewForGridViewController:v14];
      }
    }
    if ([(HUSoftwareUpdateLockupView *)self isObservingPreferredContentSize])
    {
      v15 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      [v15 removeObserver:self forKeyPath:@"preferredContentSize" context:HUSoftwareUpdateLockupCellContext];

      [(HUSoftwareUpdateLockupView *)self setIsObservingPreferredContentSize:0];
    }
    objc_storeStrong((id *)&self->_gridViewController, a3);
    objc_super v16 = [(HUSoftwareUpdateLockupView *)self gridViewController];

    if (v16)
    {
      v17 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      v18 = [(HUSoftwareUpdateLockupView *)self getAssociatedViewForGridViewController:v17];

      if (!v18)
      {
        v19 = [0 gridViewController];
        v20 = [(HUSoftwareUpdateLockupView *)self gridViewController];

        if (v19 == v20) {
          [0 setGridViewController:0];
        }
      }
      v21 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      [(HUSoftwareUpdateLockupView *)self setAssociatedViewForGridViewController:v21];

      v22 = [(HULockupView *)self stackView];
      v23 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      v24 = [v23 view];
      [v22 addArrangedSubview:v24];

      [(HUSoftwareUpdateLockupView *)self setIsObservingPreferredContentSize:1];
      v25 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      [v25 addObserver:self forKeyPath:@"preferredContentSize" options:1 context:HUSoftwareUpdateLockupCellContext];

      v26 = [(HUSoftwareUpdateLockupView *)self gridHeightConstraint];

      if (v26)
      {
        v27 = [(HUSoftwareUpdateLockupView *)self gridHeightConstraint];
        [v27 setActive:0];
      }
      v28 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      v29 = [v28 view];
      uint64_t v30 = [v29 heightAnchor];
      v31 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      [v31 preferredContentSize];
      v33 = [(id)v30 constraintEqualToConstant:v32];
      [(HUSoftwareUpdateLockupView *)self setGridHeightConstraint:v33];

      v34 = [(HUSoftwareUpdateLockupView *)self gridHeightConstraint];
      [v34 setActive:1];

      v35 = [(HUSoftwareUpdateLockupView *)self gridViewController];
      v36 = [v35 view];
      LOBYTE(v30) = [v36 isHidden];

      if ((v30 & 1) == 0)
      {
        v37 = [(HULockupView *)self internalViewResizingDelegate];
        [v37 didUpdateRequiredHeightForLockupView:self];
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v24 = a5;
  if ([a3 isEqualToString:@"preferredContentSize"]) {
    BOOL v9 = HUSoftwareUpdateLockupCellContext == (void)a6;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v10 = [(HUSoftwareUpdateLockupView *)self affectedAccessories];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      objc_opt_class();
      v12 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
      id v14 = v13;

      [v14 CGSizeValue];
      double v16 = v15;

      v17 = [(HUSoftwareUpdateLockupView *)self gridHeightConstraint];
      [v17 constant];
      double v19 = v18;

      if (v19 != v16)
      {
        v20 = [(HUSoftwareUpdateLockupView *)self gridHeightConstraint];
        [v20 setConstant:v16];

        v21 = [(HUSoftwareUpdateLockupView *)self gridViewController];
        v22 = [v21 view];

        if (([v22 isHidden] & 1) == 0)
        {
          v23 = [(HULockupView *)self internalViewResizingDelegate];
          [v23 didUpdateRequiredHeightForLockupView:self];
        }
      }
    }
  }
}

- (id)initializeIconViewWithSize:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [v4 setContentMode:0];
  [v4 setIconSize:a3];

  return v4;
}

- (void)updateIconView:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = [(HUSoftwareUpdateLockupView *)self item];
  v7 = [v6 latestResults];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  [v9 updateWithIconDescriptor:v8 displayStyle:1 animated:v4];

  [v9 sizeToFit];
}

- (void)updateDescriptionExpandableTextView:(id)a3 animate:(BOOL)a4
{
  id v9 = a3;
  id v5 = [(HUSoftwareUpdateLockupView *)self item];
  uint64_t v6 = [v5 latestResults];

  v7 = [v6 objectForKeyedSubscript:@"releaseNotesAttributedString"];
  if (v7)
  {
    [v9 setAttributedText:v7];
  }
  else
  {
    v8 = [v6 objectForKeyedSubscript:@"releaseNotesString"];
    [v9 setText:v8];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)HUSoftwareUpdateLockupView;
  [(HULockupView *)&v28 updateUIWithAnimation:a3];
  uint64_t v6 = [(HUSoftwareUpdateLockupView *)self item];
  v7 = [v6 latestResults];

  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AA8]];
  id v9 = [(HUSoftwareUpdateLockupView *)self tertiaryDetailLabel];
  [v9 setText:v8];

  v10 = [v7 objectForKeyedSubscript:@"affectedAccessories"];
  [(HUSoftwareUpdateLockupView *)self setAffectedAccessories:v10];

  objc_opt_class();
  uint64_t v11 = [(HUSoftwareUpdateLockupView *)self gridViewController];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [(HUSoftwareUpdateLockupView *)self affectedAccessories];
    double v15 = objc_msgSend(v14, "na_flatMap:", &__block_literal_global_49);

    id v3 = [v13 visibleAccessories];
    char v16 = [v3 isEqualToSet:v15];

    if ((v16 & 1) == 0)
    {
      [v13 setVisibleAccessories:v15];
      id v3 = [v13 itemManager];
      id v17 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:a2];
    }
    double v18 = [v13 collectionView];
    [v18 layoutIfNeeded];
  }
  double v19 = [(HULockupView *)self descriptionExpandableTextView];
  int v20 = [v19 isExpanded];
  if (v20)
  {
    id v3 = [(HUSoftwareUpdateLockupView *)self affectedAccessories];
    uint64_t v21 = [v3 count] == 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  v22 = [(HUSoftwareUpdateLockupView *)self gridViewController];
  v23 = [v22 view];
  [v23 setHidden:v21];

  if (v20) {
  id v24 = [(HULockupView *)self descriptionExpandableTextView];
  }
  int v25 = [v24 isExpanded];
  if (v25)
  {
    id v3 = [(HUSoftwareUpdateLockupView *)self tertiaryDetailLabel];
    uint64_t v21 = [v3 text];
    BOOL v26 = v21 == 0;
  }
  else
  {
    BOOL v26 = 1;
  }
  v27 = [(HUSoftwareUpdateLockupView *)self tertiaryDetailLabel];
  [v27 setHidden:v26];

  if (v25)
  {
  }
}

uint64_t __52__HUSoftwareUpdateLockupView_updateUIWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryLikeObjects");
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUItemCollectionViewController)gridViewController
{
  return self->_gridViewController;
}

- (UILabel)tertiaryDetailLabel
{
  return self->_tertiaryDetailLabel;
}

- (void)setTertiaryDetailLabel:(id)a3
{
}

- (NSLayoutConstraint)gridHeightConstraint
{
  return self->_gridHeightConstraint;
}

- (void)setGridHeightConstraint:(id)a3
{
}

- (NSSet)affectedAccessories
{
  return self->_affectedAccessories;
}

- (void)setAffectedAccessories:(id)a3
{
}

- (BOOL)isObservingPreferredContentSize
{
  return self->_isObservingPreferredContentSize;
}

- (void)setIsObservingPreferredContentSize:(BOOL)a3
{
  self->_isObservingPreferredContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedAccessories, 0);
  objc_storeStrong((id *)&self->_gridHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryDetailLabel, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end