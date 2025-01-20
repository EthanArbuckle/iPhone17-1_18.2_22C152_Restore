@interface MCLViewControllerCollection
- (MCLViewControllerCollection)initWithFrame:(CGRect)a3;
- (NSArray)views;
- (UIViewController)owner;
- (double)spacing;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setOwner:(id)a3;
- (void)setSpacing:(double)a3;
- (void)setViews:(id)a3;
@end

@implementation MCLViewControllerCollection

- (MCLViewControllerCollection)initWithFrame:(CGRect)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  CGRect v27 = a3;
  SEL v25 = a2;
  v26 = 0;
  v24.receiver = self;
  v24.super_class = (Class)MCLViewControllerCollection;
  v26 = -[MCLViewControllerCollection initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    id v3 = objc_alloc(MEMORY[0x263F82BF8]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    contentView = v26->_contentView;
    v26->_contentView = (UIStackView *)v4;

    [(UIStackView *)v26->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v26->_contentView setAxis:1];
    -[UIStackView setDistribution:](v26->_contentView, "setDistribution:");
    [(UIStackView *)v26->_contentView setAlignment:0];
    [(UIStackView *)v26->_contentView setSpacing:1.0];
    v6 = (NSLayoutConstraint *)(id)objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26->_contentView, 7, 0, 0, 0.0, v27.size.width);
    widthConstraint = v26->_widthConstraint;
    v26->_widthConstraint = v6;

    [(MCLViewControllerCollection *)v26 setDelegate:v26];
    [(MCLViewControllerCollection *)v26 addSubview:v26->_contentView];
    v10 = (void *)MEMORY[0x263F08938];
    id v23 = (id)[(UIStackView *)v26->_contentView leftAnchor];
    id v22 = (id)[(MCLViewControllerCollection *)v26 leftAnchor];
    id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v28[0] = v21;
    id v20 = (id)[(UIStackView *)v26->_contentView rightAnchor];
    id v19 = (id)[(MCLViewControllerCollection *)v26 rightAnchor];
    id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v28[1] = v18;
    id v17 = (id)[(UIStackView *)v26->_contentView topAnchor];
    id v16 = (id)[(MCLViewControllerCollection *)v26 topAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v28[2] = v15;
    id v14 = (id)[(UIStackView *)v26->_contentView bottomAnchor];
    id v13 = (id)[(MCLViewControllerCollection *)v26 bottomAnchor];
    id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v28[3] = v12;
    id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
    objc_msgSend(v10, "activateConstraints:");
  }
  v9 = v26;
  objc_storeStrong((id *)&v26, 0);
  return v9;
}

- (void)setSpacing:(double)a3
{
}

- (double)spacing
{
  [(UIStackView *)self->_contentView spacing];
  return result;
}

- (void)setViews:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = (id)[MEMORY[0x263EFF9C0] setWithArray:location[0]];
  id v17 = (id)[MEMORY[0x263EFF9C0] setWithArray:v20->_views];
  [v18 minusSet:v17];
  id v6 = (id)[MEMORY[0x263EFFA08] setWithArray:location[0]];
  objc_msgSend(v17, "minusSet:");

  [v17 enumerateObjectsUsingBlock:&__block_literal_global_6];
  uint64_t v3 = [location[0] copy];
  views = v20->_views;
  v20->_views = (NSArray *)v3;

  id WeakRetained = objc_loadWeakRetained((id *)&v20->_owner);
  if (WeakRetained)
  {
    id v5 = location[0];
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    v10 = __40__MCLViewControllerCollection_setViews___block_invoke_2;
    id v11 = &unk_26485AD50;
    id v12 = v18;
    id v13 = WeakRetained;
    id v14 = v20;
    [v5 enumerateObjectsUsingBlock:&v7];
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    int v15 = 0;
  }
  else
  {
    int v15 = 1;
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __40__MCLViewControllerCollection_setViews___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[2] = a3;
  v9[1] = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9[0] = location[0];
    objc_msgSend(v9[0], "willMoveToParentViewController:");
    id v5 = (id)[v9[0] view];
    id v4 = (id)[v5 superview];
    [v4 removeFromSuperview];

    [v9[0] removeFromParentViewController];
    objc_storeStrong(v9, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = location[0];
      id v3 = (id)[v8 superview];
      [v3 removeFromSuperview];

      objc_storeStrong(&v8, 0);
    }
  }
  objc_storeStrong(location, 0);
}

void __40__MCLViewControllerCollection_setViews___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v48[4] = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v45 = a3;
  uint64_t v44 = a4;
  uint64_t v43 = a1;
  if ([*(id *)(a1 + 32) containsObject:location[0]])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = location[0];
      id v40 = (id)[v41 view];
      [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(a1 + 40) addChildViewController:v41];
      id v4 = objc_alloc(MEMORY[0x263F82E00]);
      id v39 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v39 addSubview:v40];
      id v20 = (void *)MEMORY[0x263F08938];
      id v33 = (id)[v39 leadingAnchor];
      id v32 = (id)[v40 leadingAnchor];
      id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
      v48[0] = v31;
      id v30 = (id)[v39 trailingAnchor];
      id v29 = (id)[v40 trailingAnchor];
      id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
      v48[1] = v28;
      id v27 = (id)[v39 topAnchor];
      id v26 = (id)[v40 topAnchor];
      id v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v48[2] = v25;
      id v24 = (id)[v39 bottomAnchor];
      id v23 = (id)[v40 bottomAnchor];
      id v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
      v48[3] = v22;
      id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
      objc_msgSend(v20, "activateConstraints:");

      [*(id *)(*(void *)(a1 + 48) + 2064) insertArrangedSubview:v39 atIndex:v45];
      [v41 didMoveToParentViewController:*(void *)(a1 + 40)];
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = location[0];
        [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v5 = objc_alloc(MEMORY[0x263F82E00]);
        id v37 = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v37 addSubview:v38];
        id v6 = (void *)MEMORY[0x263F08938];
        id v19 = (id)[v37 leadingAnchor];
        id v18 = (id)[v38 leadingAnchor];
        id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
        v47[0] = v17;
        id v16 = (id)[v37 trailingAnchor];
        id v15 = (id)[v38 trailingAnchor];
        id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
        v47[1] = v14;
        id v13 = (id)[v37 topAnchor];
        id v12 = (id)[v38 topAnchor];
        id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
        v47[2] = v11;
        id v10 = (id)[v37 bottomAnchor];
        id v9 = (id)[v38 bottomAnchor];
        id v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
        v47[3] = v8;
        id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
        objc_msgSend(v6, "activateConstraints:");

        [*(id *)(*(void *)(a1 + 48) + 2064) insertArrangedSubview:v37 atIndex:v45];
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
      }
    }
    int v42 = 0;
  }
  else
  {
    int v42 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  id v18 = self;
  SEL v17 = a2;
  [(MCLViewControllerCollection *)self frame];
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  double v14 = v4;
  uint64_t v15 = v5;
  double v16 = v4;
  [(NSLayoutConstraint *)v18->_widthConstraint constant];
  if (v6 != v16)
  {
    [(NSLayoutConstraint *)v18->_widthConstraint setConstant:v16];
    [(NSLayoutConstraint *)v18->_widthConstraint setActive:1];
    [(MCLViewControllerCollection *)v18 contentOffset];
    double v10 = v7;
    double v11 = v8 - 1.0;
    -[MCLViewControllerCollection setContentOffset:animated:](v18, "setContentOffset:animated:", 1, v7, v8 - 1.0);
  }
  v9.receiver = v18;
  v9.super_class = (Class)MCLViewControllerCollection;
  [(MCLViewControllerCollection *)&v9 layoutSubviews];
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    [location[0] contentOffset];
    [location[0] contentInset];
    [location[0] frame];
    uint64_t v3 = [(UIStackView *)v5->_contentView arrangedSubviews];
    -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");
  }
  objc_storeStrong(location, 0);
}

void __51__MCLViewControllerCollection_scrollViewDidScroll___block_invoke(double *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  id v8 = (id)[location[0] subviews];
  v10[0] = (id)[v8 firstObject];

  if (v10[0])
  {
    [location[0] frame];
    CGRect rect = v12;
    BOOL v4 = 1;
    if (CGRectGetMaxY(v12) >= a1[4]) {
      BOOL v4 = CGRectGetMinY(rect) > a1[5];
    }
    if (([v10[0] isHidden] & 1) != v4) {
      [v10[0] setHidden:v4];
    }
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (UIViewController)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (UIViewController *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (NSArray)views
{
  return self->_views;
}

- (void).cxx_destruct
{
}

@end