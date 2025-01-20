@interface DBWidgetStackViewController
- (NSArray)currentConstraints;
- (NSArray)widgetViewControllers;
- (id)linearFocusItems;
- (unint64_t)visibleCount;
- (void)_reloadConstraints;
- (void)_setAnchorPoint:(CGPoint)a3 forView:(id)a4;
- (void)animateUpdateForWidgetViewController:(id)a3 updateBlock:(id)a4 completion:(id)a5;
- (void)animateWithUpdates:(id)a3 completion:(id)a4;
- (void)setCurrentConstraints:(id)a3;
- (void)setWidgetViewControllers:(id)a3;
- (void)viewDidLoad;
@end

@implementation DBWidgetStackViewController

- (void)setWidgetViewControllers:(id)a3
{
  id v5 = a3;
  p_widgetViewControllers = &self->_widgetViewControllers;
  if (([v5 isEqualToArray:self->_widgetViewControllers] & 1) == 0)
  {
    [(NSArray *)*p_widgetViewControllers enumerateObjectsUsingBlock:&__block_literal_global_10];
    objc_storeStrong((id *)&self->_widgetViewControllers, a3);
    v7 = *p_widgetViewControllers;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__DBWidgetStackViewController_setWidgetViewControllers___block_invoke_2;
    v8[3] = &unk_2649B5480;
    v8[4] = self;
    [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
    [(DBWidgetStackViewController *)self _reloadConstraints];
  }
}

void __56__DBWidgetStackViewController_setWidgetViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 willMoveToParentViewController:0];
  v2 = [v3 view];
  [v2 removeFromSuperview];

  [v3 removeFromParentViewController];
}

void __56__DBWidgetStackViewController_setWidgetViewControllers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addChildViewController:v4];
  id v5 = [*(id *)(a1 + 32) view];
  v6 = [v4 view];
  [v5 addSubview:v6];

  [v4 didMoveToParentViewController:*(void *)(a1 + 32)];
  id v7 = [v4 view];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)animateWithUpdates:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  v8 = [(DBWidgetStackViewController *)self widgetViewControllers];
  v9 = objc_msgSend(v8, "db_map:", &__block_literal_global_20);

  if (v6) {
    v6[2](v6);
  }
  v10 = [(DBWidgetStackViewController *)self widgetViewControllers];
  v11 = objc_msgSend(v10, "db_map:", &__block_literal_global_20);

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = [v9 count];
  if (v12 == [v11 count])
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_2;
    v47[3] = &unk_2649B54C8;
    id v13 = v11;
    id v48 = v13;
    v49 = &v50;
    [v9 enumerateObjectsUsingBlock:v47];
    if (!*((unsigned char *)v51 + 24))
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_3;
      v44[3] = &unk_2649B54C8;
      id v45 = v13;
      v46 = &v54;
      [v9 enumerateObjectsUsingBlock:v44];
    }
    _Block_object_dispose(&v50, 8);
  }
  if (v55[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = (void *)MEMORY[0x263F82E00];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_8;
    v32[3] = &unk_2649B3E90;
    v32[4] = self;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_10;
    v30[3] = &unk_2649B3F00;
    id v31 = v7;
    [v14 _animateUsingSpringWithDuration:0 delay:v32 options:v30 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:350.0 animations:42.0 completion:0.0];
  }
  else
  {
    v15 = objc_msgSend(v9, "objectAtIndexedSubscript:");
    v16 = [v15 view];

    v17 = [v11 objectAtIndexedSubscript:v55[3]];
    v18 = [v17 view];

    v19 = [v16 snapshotViewAfterScreenUpdates:0];
    v20 = [(DBWidgetStackViewController *)self view];
    [v20 addSubview:v19];

    [v16 frame];
    objc_msgSend(v19, "setFrame:");
    v21 = [v19 layer];
    uint64_t v22 = *MEMORY[0x263F15B60];
    [v21 setMinificationFilter:*MEMORY[0x263F15B60]];

    v23 = [v19 layer];
    [v23 setMagnificationFilter:v22];

    [v16 setAlpha:0.0];
    [(DBWidgetStackViewController *)self _reloadConstraints];
    v24 = [(DBWidgetStackViewController *)self view];
    [v24 layoutIfNeeded];

    -[DBWidgetStackViewController _setAnchorPoint:forView:](self, "_setAnchorPoint:forView:", v19, 0.5, 0.0);
    -[DBWidgetStackViewController _setAnchorPoint:forView:](self, "_setAnchorPoint:forView:", v18, 0.5, 1.0);
    CGAffineTransformMakeScale(&v43, 0.01, 0.01);
    v25 = [v18 layer];
    CGAffineTransform v42 = v43;
    [v25 setAffineTransform:&v42];

    [v18 setAlpha:0.0];
    v26 = (void *)MEMORY[0x263F82E00];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_4;
    v40[3] = &unk_2649B3E90;
    id v41 = v18;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_5;
    v37[3] = &unk_2649B5328;
    id v27 = v41;
    id v38 = v27;
    id v39 = v7;
    [v26 _animateUsingSpringWithDuration:0 delay:v40 options:v37 mass:0.78 stiffness:0.02 damping:2.0 initialVelocity:350.0 animations:42.0 completion:0.0];
    v28 = (void *)MEMORY[0x263F82E00];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_6;
    v35[3] = &unk_2649B3E90;
    id v36 = v19;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_7;
    v33[3] = &unk_2649B3FA8;
    id v29 = v36;
    id v34 = v29;
    [v28 _animateUsingSpringWithDuration:0 delay:v35 options:v33 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:350.0 animations:42.0 completion:0.0];
  }
  _Block_object_dispose(&v54, 8);
}

id __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHidden])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_opt_new();
    id v4 = [v2 view];
    [v3 setView:v4];

    objc_msgSend(v3, "setWantsLargeSize:", objc_msgSend(v2, "wantsLargeSize"));
  }

  return v3;
}

void __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectAtIndexedSubscript:a3];
  LODWORD(a3) = [v8 wantsLargeSize];

  if (a3 != [v9 wantsLargeSize])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v11 = [v7 objectAtIndexedSubscript:a3];
  id v9 = [v8 view];

  v10 = [v11 view];

  if (v9 != v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_4(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  id v2 = [*(id *)(a1 + 32) layer];
  CGAffineTransform v4 = v5;
  [v2 setAffineTransform:&v4];

  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "setAnchorPoint:", 0.5, 0.5);

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    CGAffineTransform v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_6(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.01, 0.01);
  id v2 = [*(id *)(a1 + 32) layer];
  CGAffineTransform v4 = v5;
  [v2 setAffineTransform:&v4];

  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadConstraints];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  id v3 = [*(id *)(a1 + 32) widgetViewControllers];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_26];
}

void __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHidden]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  id v4 = [v2 view];

  [v4 setAlpha:v3];
}

uint64_t __61__DBWidgetStackViewController_animateWithUpdates_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animateUpdateForWidgetViewController:(id)a3 updateBlock:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a4;
  id v10 = a5;
  id v11 = [v8 snapshotViewAfterScreenUpdates:0];
  uint64_t v12 = [(DBWidgetStackViewController *)self view];
  [v12 addSubview:v11];

  id v13 = [v8 view];
  [v13 frame];
  objc_msgSend(v11, "setFrame:");

  uint64_t v14 = *MEMORY[0x263F15B60];
  v15 = [v11 layer];
  [v15 setMinificationFilter:v14];

  v16 = [v11 layer];
  [v16 setMagnificationFilter:v14];

  if (v9) {
    v9[2](v9);
  }
  v17 = [v8 snapshotViewAfterScreenUpdates:1];
  v18 = [(DBWidgetStackViewController *)self view];
  [v18 addSubview:v17];

  v19 = [v8 view];
  [v19 frame];
  objc_msgSend(v17, "setFrame:");

  v20 = [v17 layer];
  [v20 setMinificationFilter:v14];

  v21 = [v17 layer];
  [v21 setMagnificationFilter:v14];

  -[DBWidgetStackViewController _setAnchorPoint:forView:](self, "_setAnchorPoint:forView:", v11, 0.5, 0.0);
  -[DBWidgetStackViewController _setAnchorPoint:forView:](self, "_setAnchorPoint:forView:", v17, 0.5, 1.0);
  CGAffineTransformMakeScale(&v41, 0.01, 0.01);
  uint64_t v22 = [v17 layer];
  CGAffineTransform v40 = v41;
  [v22 setAffineTransform:&v40];

  [v17 setAlpha:0.0];
  v23 = [v8 view];
  [v23 setHidden:1];

  v24 = (void *)MEMORY[0x263F82E00];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke;
  v38[3] = &unk_2649B3E90;
  id v39 = v17;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke_2;
  v34[3] = &unk_2649B54F0;
  id v35 = v39;
  id v36 = v8;
  id v37 = v10;
  id v25 = v10;
  id v26 = v8;
  id v27 = v39;
  [v24 _animateUsingSpringWithDuration:0 delay:v38 options:v34 mass:0.78 stiffness:0.02 damping:2.0 initialVelocity:350.0 animations:42.0 completion:0.0];
  v28 = (void *)MEMORY[0x263F82E00];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke_3;
  v32[3] = &unk_2649B3E90;
  id v33 = v11;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke_4;
  v30[3] = &unk_2649B3FA8;
  id v31 = v33;
  id v29 = v33;
  [v28 _animateUsingSpringWithDuration:0 delay:v32 options:v30 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:350.0 animations:42.0 completion:0.0];
}

uint64_t __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  id v2 = [*(id *)(a1 + 32) layer];
  CGAffineTransform v4 = v5;
  [v2 setAffineTransform:&v4];

  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 setHidden:0];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    CGAffineTransform v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.01, 0.01);
  id v2 = [*(id *)(a1 + 32) layer];
  CGAffineTransform v4 = v5;
  [v2 setAffineTransform:&v4];

  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __91__DBWidgetStackViewController_animateUpdateForWidgetViewController_updateBlock_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)linearFocusItems
{
  double v3 = objc_opt_new();
  CGAffineTransform v4 = [(DBWidgetStackViewController *)self widgetViewControllers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__DBWidgetStackViewController_linearFocusItems__block_invoke;
  v7[3] = &unk_2649B5480;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __47__DBWidgetStackViewController_linearFocusItems__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isHidden] & 1) == 0)
  {
    double v3 = *(void **)(a1 + 32);
    CGAffineTransform v4 = [v5 linearFocusItems];
    [v3 addObjectsFromArray:v4];
  }
}

- (unint64_t)visibleCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(DBWidgetStackViewController *)self widgetViewControllers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__DBWidgetStackViewController_visibleCount__block_invoke;
  v5[3] = &unk_2649B5518;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__DBWidgetStackViewController_visibleCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isHidden];
  if ((result & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DBWidgetStackViewController;
  [(DBWidgetStackViewController *)&v5 viewDidLoad];
  unint64_t v3 = [(DBWidgetStackViewController *)self widgetViewControllers];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__DBWidgetStackViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_2649B5480;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];

  [(DBWidgetStackViewController *)self _reloadConstraints];
}

void __42__DBWidgetStackViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addChildViewController:v4];
  objc_super v5 = [*(id *)(a1 + 32) view];
  uint64_t v6 = [v4 view];
  [v5 addSubview:v6];

  [v4 didMoveToParentViewController:*(void *)(a1 + 32)];
  id v7 = [v4 view];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_reloadConstraints
{
  id v2 = self;
  unint64_t v3 = [(DBWidgetStackViewController *)self currentConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08938];
    objc_super v5 = [(DBWidgetStackViewController *)v2 currentConstraints];
    [v4 deactivateConstraints:v5];

    [(DBWidgetStackViewController *)v2 setCurrentConstraints:0];
  }
  uint64_t v6 = objc_opt_new();
  id v48 = objc_opt_new();
  v47 = objc_opt_new();
  id v7 = [(DBWidgetStackViewController *)v2 widgetViewControllers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = 0;
    v49 = v2;
    id v50 = 0;
    unint64_t v10 = 0;
    do
    {
      id v11 = [(DBWidgetStackViewController *)v2 widgetViewControllers];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

      LODWORD(v11) = [v12 isHidden];
      id v13 = [v12 view];
      uint64_t v14 = [v13 topAnchor];
      if (v11)
      {
        if (v9)
        {
          v15 = [v9 view];
          [v15 bottomAnchor];
        }
        else
        {
          v15 = [(DBWidgetStackViewController *)v2 view];
          [v15 topAnchor];
        v18 = };
        v19 = [v14 constraintEqualToAnchor:v18];
        [v6 addObject:v19];

        v20 = [v12 view];
        v21 = [v20 heightAnchor];
        uint64_t v22 = [v21 constraintEqualToConstant:0.0];
        [v6 addObject:v22];
      }
      else
      {
        if (v50)
        {
          v16 = [v50 view];
          v17 = [v16 bottomAnchor];
          [v14 constraintEqualToSystemSpacingBelowAnchor:v17 multiplier:1.0];
        }
        else
        {
          v16 = [(DBWidgetStackViewController *)v49 view];
          v17 = [v16 topAnchor];
          [v14 constraintEqualToAnchor:v17];
        v23 = };
        [v6 addObject:v23];

        if ([v12 wantsLargeSize]) {
          v24 = v47;
        }
        else {
          v24 = v48;
        }
        [v24 addObject:v12];
        v20 = v50;
        id v50 = v12;
        id v2 = v49;
      }

      id v25 = [v12 view];
      id v26 = [v25 leadingAnchor];
      id v27 = [(DBWidgetStackViewController *)v2 view];
      v28 = [v27 leadingAnchor];
      id v29 = [v26 constraintEqualToAnchor:v28];
      [v6 addObject:v29];

      v30 = [v12 view];
      id v31 = [v30 trailingAnchor];
      v32 = [(DBWidgetStackViewController *)v2 view];
      id v33 = [v32 trailingAnchor];
      id v34 = [v31 constraintEqualToAnchor:v33];
      [v6 addObject:v34];

      ++v10;
      id v35 = [(DBWidgetStackViewController *)v2 widgetViewControllers];
      unint64_t v36 = [v35 count];

      uint64_t v9 = v12;
    }
    while (v10 < v36);
  }
  else
  {
    id v50 = 0;
    uint64_t v12 = 0;
  }
  id v37 = [v48 firstObject];
  if (v37)
  {
    id v38 = [(DBWidgetStackViewController *)v2 widgetViewControllers];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __49__DBWidgetStackViewController__reloadConstraints__block_invoke;
    v54[3] = &unk_2649B5540;
    id v55 = v37;
    id v56 = v6;
    [v38 enumerateObjectsUsingBlock:v54];

    id v39 = v55;
  }
  else
  {
    CGAffineTransform v40 = [v47 firstObject];
    CGAffineTransform v41 = [(DBWidgetStackViewController *)v2 widgetViewControllers];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __49__DBWidgetStackViewController__reloadConstraints__block_invoke_2;
    v51[3] = &unk_2649B5540;
    id v52 = v40;
    id v53 = v6;
    id v39 = v40;
    [v41 enumerateObjectsUsingBlock:v51];
  }
  if (v12)
  {
    CGAffineTransform v42 = [(DBWidgetStackViewController *)v2 view];
    CGAffineTransform v43 = [v42 bottomAnchor];
    v44 = [v12 view];
    id v45 = [v44 bottomAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    [v6 addObject:v46];
  }
  [MEMORY[0x263F08938] activateConstraints:v6];
  [(DBWidgetStackViewController *)v2 setCurrentConstraints:v6];
}

void __49__DBWidgetStackViewController__reloadConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (([v11 isHidden] & 1) == 0 && *(id *)(a1 + 32) != v11)
  {
    if ([v11 wantsLargeSize]) {
      double v3 = 2.0;
    }
    else {
      double v3 = 1.0;
    }
    if ([v11 wantsLargeSize]) {
      double v4 = 8.0;
    }
    else {
      double v4 = 0.0;
    }
    objc_super v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v11 view];
    id v7 = [v6 heightAnchor];
    uint64_t v8 = [*(id *)(a1 + 32) view];
    uint64_t v9 = [v8 heightAnchor];
    unint64_t v10 = [v7 constraintEqualToAnchor:v9 multiplier:v3 constant:v4];
    [v5 addObject:v10];
  }
}

uint64_t __49__DBWidgetStackViewController__reloadConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 isHidden];
  id v4 = v12;
  if ((v3 & 1) == 0 && *(id *)(a1 + 32) != v12)
  {
    objc_super v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v12 view];
    id v7 = [v6 heightAnchor];
    uint64_t v8 = [*(id *)(a1 + 32) view];
    uint64_t v9 = [v8 heightAnchor];
    unint64_t v10 = [v7 constraintEqualToAnchor:v9 multiplier:1.0];
    [v5 addObject:v10];

    id v4 = v12;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_setAnchorPoint:(CGPoint)a3 forView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v5 = a4;
  [v5 bounds];
  double v7 = v6;
  [v5 bounds];
  double v41 = v8;
  [v5 bounds];
  double v42 = v9;
  unint64_t v10 = [v5 layer];
  [v10 anchorPoint];
  double v40 = v11;
  [v5 bounds];
  double v39 = v12;
  id v13 = [v5 layer];
  [v13 anchorPoint];
  double v38 = v14;

  if (v5)
  {
    [v5 transform];
    double v16 = v51;
    double v15 = v50;
    double v18 = v53;
    double v17 = v52;
    double v20 = v55;
    double v19 = v54;
    [v5 transform];
    double v21 = v45;
    double v22 = v44;
    double v23 = v47;
    double v24 = v46;
    double v25 = v49;
    double v26 = v48;
  }
  else
  {
    double v15 = 0.0;
    double v17 = 0.0;
    double v19 = 0.0;
    double v16 = 0.0;
    double v18 = 0.0;
    double v20 = 0.0;
    double v25 = 0.0;
    double v23 = 0.0;
    double v21 = 0.0;
    double v26 = 0.0;
    double v24 = 0.0;
    double v22 = 0.0;
  }
  double v27 = v20 + y * v41 * v18 + v16 * (x * v7);
  double v28 = v19 + y * v41 * v17 + v15 * (x * v7);
  double v29 = v26 + v39 * v38 * v24 + v22 * (v42 * v40);
  double v30 = v25 + v39 * v38 * v23 + v21 * (v42 * v40);
  id v31 = objc_msgSend(v5, "layer", *(void *)&v38);
  [v31 position];
  double v33 = v32;
  double v35 = v34;

  unint64_t v36 = [v5 layer];
  objc_msgSend(v36, "setPosition:", v28 + v33 - v29, v27 + v35 - v30);

  id v37 = [v5 layer];
  objc_msgSend(v37, "setAnchorPoint:", x, y);
}

- (NSArray)widgetViewControllers
{
  return self->_widgetViewControllers;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_widgetViewControllers, 0);
}

@end