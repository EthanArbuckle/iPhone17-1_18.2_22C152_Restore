@interface MUGroupedActionsRowView
- (BOOL)hasContent;
- (MUGroupedActionsRowView)initWithConfiguration:(id)a3;
- (MUPlaceCardActionsRowViewDelegate)delegate;
- (NSArray)actionButtons;
- (NSArray)viewModels;
- (id)_itemViewForViewModel:(id)a3;
- (id)_viewModelForItemView:(id)a3;
- (int64_t)preferredDistribution;
- (int64_t)preferredOrientation;
- (void)_setupStackLayout;
- (void)_updateLayoutIfNeeded;
- (void)actionRowItemPresentedMenu:(id)a3;
- (void)actionRowItemSelected:(id)a3;
- (void)actionRowItemViewModelDidUpdate:(id)a3;
- (void)createActionViews;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
- (void)setViewModels:(id)a3;
@end

@implementation MUGroupedActionsRowView

- (MUGroupedActionsRowView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUGroupedActionsRowView;
  v6 = -[MUGroupedActionsRowView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUGroupedActionsRowView *)v7 _setupStackLayout];
  }

  return v7;
}

- (void)_setupStackLayout
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [[MUCompositionalStackLayoutGroup alloc] initWithIdentifier:@"buttons" axis:[(MUGroupedActionsRowView *)self preferredOrientation]];
  buttonLayoutGroup = self->_buttonLayoutGroup;
  self->_buttonLayoutGroup = v3;

  [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup setSpacing:8.0];
  LODWORD(v5) = 1112276992;
  [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup setAlignmentFittingSizePriority:v5];
  v6 = [MUCompositionalStackLayout alloc];
  v7 = [(MUGroupedActionsRowView *)self layoutMarginsGuide];
  v8 = [(MUCompositionalStackLayout *)v6 initWithContainer:v7 group:self->_buttonLayoutGroup];
  containerStackLayout = self->_containerStackLayout;
  self->_containerStackLayout = v8;

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v16[0] = self->_containerStackLayout;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  objc_msgSend(v10, "_mapsui_activateLayouts:", v11);

  [(MUGroupedActionsRowView *)self _updateLayoutIfNeeded];
  v12 = self;
  v15 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v14 = (id)[(MUGroupedActionsRowView *)self registerForTraitChanges:v13 withAction:sel__updateLayoutIfNeeded];
}

- (void)setViewModels:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSArray *)self->_viewModels isEqual:v4] & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v5 = self->_viewModels;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v9++) removeObserver:self];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    v10 = (NSArray *)[v4 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v10;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = self->_viewModels;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "addObserver:", self, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(MUGroupedActionsRowView *)self createActionViews];
  }
}

- (NSArray)actionButtons
{
  v2 = (void *)[(NSArray *)self->_actionButtons copy];
  return (NSArray *)v2;
}

- (void)createActionViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_actionButtons = &self->_actionButtons;
  [(NSArray *)self->_actionButtons makeObjectsPerformSelector:sel_removeFromSuperview];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_viewModels count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [[MUActionRowItemView alloc] initWithStyle:[(MUGroupedActionsRowViewConfiguration *)self->_configuration style] useVibrancy:[(MUGroupedActionsRowViewConfiguration *)self->_configuration useVibrancy]];
      uint64_t v7 = [(MUGroupedActionsRowViewConfiguration *)self->_configuration tintColor];
      [(MUActionRowItemView *)v6 setTintColor:v7];

      uint64_t v8 = [(MUGroupedActionsRowViewConfiguration *)self->_configuration itemBackgroundColor];
      [(MUActionRowItemView *)v6 setContentBackgroundColor:v8];

      uint64_t v9 = [(MUGroupedActionsRowViewConfiguration *)self->_configuration itemHighlightColor];
      [(MUActionRowItemView *)v6 setHighlightedBackgroundColor:v9];

      [(MUActionRowItemView *)v6 setDelegate:self];
      [v4 addObject:v6];

      ++v5;
    }
    while (v5 < [(NSArray *)self->_viewModels count]);
  }
  objc_storeStrong((id *)p_actionButtons, v4);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_viewModels;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[MUGroupedActionsRowView actionRowItemViewModelDidUpdate:](self, "actionRowItemViewModelDidUpdate:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(MUGroupedActionsRowView *)self _updateLayoutIfNeeded];
}

- (int64_t)preferredOrientation
{
  if (MUIdiomInTraitEnvironment(self) == 5) {
    return 0;
  }
  id v4 = [(MUGroupedActionsRowView *)self traitCollection];
  unint64_t v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  return IsAccessibilityCategory;
}

- (int64_t)preferredDistribution
{
  if (MUIdiomInTraitEnvironment(self) == 5) {
    return 2;
  }
  else {
    return [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup axis] != 1;
  }
}

- (void)actionRowItemViewModelDidUpdate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MUGroupedActionsRowView *)self _itemViewForViewModel:v4];
  if (v5)
  {
    objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "isEnabled"));
    uint64_t v6 = [v4 titleText];
    [v5 setTitleText:v6];

    uint64_t v7 = [v4 symbolName];
    [v5 setGlyphName:v7];

    uint64_t v8 = [v4 accessoryView];
    [v5 setAccessoryView:v8];

    objc_msgSend(v5, "setTitleUsesMonospacedNumbersFont:", objc_msgSend(v4, "titleUsesMonospacedNumbersFont"));
    uint64_t v9 = [v4 accessibilityIdentifier];
    [v5 setAccessibilityIdentifier:v9];

    v10 = [v4 titleText];
    [v5 setAccessibilityLabel:v10];

    objc_initWeak(&location, v5);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke;
    aBlock[3] = &unk_1E574F8A0;
    objc_copyWeak(&v25, &location);
    uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v12 = v11[2]();
    uint64_t v13 = [v4 buildMenuWithPresentationOptions:v12];

    if (v13)
    {
      [v5 setShowsMenuAsPrimaryAction:1];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke_2;
      long long v21 = &unk_1E574F8C8;
      id v22 = v4;
      long long v23 = v11;
      [v5 _setMenuProvider:&v18];
    }
    if (!+[MUInfoCardStyle hasExternallyProvidedTintColor])
    {
      uint64_t v14 = [v4 preferredTintColor];

      if (v14)
      {
        long long v15 = [v4 preferredTintColor];
        [v5 setTintColor:v15];
      }
      long long v16 = [v4 preferredBackgroundColor];

      if (v16)
      {
        long long v17 = [v4 preferredBackgroundColor];
        [v5 setContentBackgroundColor:v17];
      }
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

MUPresentationOptions *__59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke(id *a1)
{
  v2 = objc_alloc_init(MUPresentationOptions);
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [(MUPresentationOptions *)v2 setSourceView:WeakRetained];

  id v4 = objc_loadWeakRetained(a1);
  unint64_t v5 = [v4 contextMenuInteraction];
  [(MUPresentationOptions *)v2 setContextMenuInteraction:v5];

  return v2;
}

id __59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = [v1 buildMenuWithPresentationOptions:v2];

  return v3;
}

- (id)_itemViewForViewModel:(id)a3
{
  unint64_t v4 = [(NSArray *)self->_viewModels indexOfObject:a3];
  if (v4 >= [(NSArray *)self->_actionButtons count])
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_actionButtons objectAtIndexedSubscript:v4];
  }
  return v5;
}

- (id)_viewModelForItemView:(id)a3
{
  unint64_t v4 = [(NSArray *)self->_actionButtons indexOfObject:a3];
  if (v4 >= [(NSArray *)self->_viewModels count])
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_viewModels objectAtIndexedSubscript:v4];
  }
  return v5;
}

- (void)_updateLayoutIfNeeded
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MUGroupedActionsRowViewConfiguration *)self->_configuration style];
  if (v3 == 1)
  {
    double v4 = 4.0;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    double v4 = 8.0;
  }
  [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup setSpacing:v4];
LABEL_6:
  [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup setAxis:[(MUGroupedActionsRowView *)self preferredOrientation]];
  [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup setDistribution:[(MUGroupedActionsRowView *)self preferredDistribution]];
  [(MUFeatureDiscoveryAnnotationView *)self->_featureDiscoveryView removeFromSuperview];
  featureDiscoveryView = self->_featureDiscoveryView;
  self->_featureDiscoveryView = 0;

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v37 = 416;
  uint64_t v7 = self->_actionButtons;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v13 = -[MUGroupedActionsRowView _viewModelForItemView:](self, "_viewModelForItemView:", v12, v37);
        if ([v13 isHidden])
        {
          [v12 removeFromSuperview];
        }
        else
        {
          [(MUGroupedActionsRowView *)self addSubview:v12];
          [v6 addObject:v12];
        }
        uint64_t v14 = [v13 featureDiscoveryView];
        if (v14)
        {
          long long v15 = self->_featureDiscoveryView;

          if (!v15)
          {
            long long v16 = [v13 featureDiscoveryView];
            long long v17 = self->_featureDiscoveryView;
            self->_featureDiscoveryView = v16;

            [(MUFeatureDiscoveryAnnotationView *)self->_featureDiscoveryView setTranslatesAutoresizingMaskIntoConstraints:0];
            [(MUFeatureDiscoveryAnnotationView *)self->_featureDiscoveryView setShowBubbleIndicator:1];
            [(MUFeatureDiscoveryAnnotationView *)self->_featureDiscoveryView setSourceView:v12];
            [(MUGroupedActionsRowView *)self addSubview:self->_featureDiscoveryView];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v9);
  }

  [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup setArrangedLayoutItems:v6];
  uint64_t v18 = (void *)MEMORY[0x1E4F28DC8];
  containerStackLayout = self->_containerStackLayout;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&containerStackLayout count:1];
  objc_msgSend(v18, "_mapsui_deactivateLayouts:", v19);

  if (self->_featureDiscoveryView)
  {
    uint64_t v20 = [[MUCompositionalStackLayoutGroup alloc] initWithIdentifier:@"content" axis:1];
    [(MUCompositionalStackLayoutGroup *)v20 setSpacing:20.0];
    long long v21 = self->_featureDiscoveryView;
    v48[0] = self->_buttonLayoutGroup;
    v48[1] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    [(MUCompositionalStackLayoutGroup *)v20 setArrangedLayoutItems:v22];

    long long v23 = [MUCompositionalStackLayout alloc];
    long long v24 = [(MUGroupedActionsRowView *)self layoutMarginsGuide];
    id v25 = [(MUCompositionalStackLayout *)v23 initWithContainer:v24 group:v20];
    v26 = self->_containerStackLayout;
    self->_containerStackLayout = v25;
  }
  else
  {
    uint64_t v27 = [MUCompositionalStackLayout alloc];
    uint64_t v20 = [(MUGroupedActionsRowView *)self layoutMarginsGuide];
    v28 = [(MUCompositionalStackLayout *)v27 initWithContainer:v20 group:self->_buttonLayoutGroup];
    long long v24 = self->_containerStackLayout;
    self->_containerStackLayout = v28;
  }

  v29 = (void *)MEMORY[0x1E4F28DC8];
  v47 = self->_containerStackLayout;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  objc_msgSend(v29, "_mapsui_activateLayouts:", v30);

  int64_t v31 = [(MUCompositionalStackLayoutGroup *)self->_buttonLayoutGroup axis];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v32 = *(id *)((char *)&self->super.super.super.isa + v37);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v32);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * j) setFullWidthMode:v31 == 1];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v34);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MUGroupedActionsRowView;
  [(MUGroupedActionsRowView *)&v3 didMoveToWindow];
  [(MUGroupedActionsRowView *)self _updateLayoutIfNeeded];
}

- (void)actionRowItemSelected:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v7 setSourceView:v4];
  [v4 frame];
  -[MUPresentationOptions setSourceRect:](v7, "setSourceRect:");
  unint64_t v5 = [(MUGroupedActionsRowView *)self _viewModelForItemView:v4];

  if (v5)
  {
    uint64_t v6 = [(MUGroupedActionsRowView *)self delegate];
    [v6 actionsRowView:self didSelectViewModel:v5 presentationOptions:v7];
  }
}

- (void)actionRowItemPresentedMenu:(id)a3
{
  id v8 = a3;
  id v4 = [(MUGroupedActionsRowView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(MUGroupedActionsRowView *)self _viewModelForItemView:v8];
    if (v6)
    {
      uint64_t v7 = [(MUGroupedActionsRowView *)self delegate];
      [v7 actionsRowView:self didPresentMenuForViewModel:v6];
    }
  }
  MEMORY[0x1F4181820]();
}

- (BOOL)hasContent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_viewModels;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isHidden", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (MUPlaceCardActionsRowViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceCardActionsRowViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_buttonLayoutGroup, 0);
  objc_storeStrong((id *)&self->_containerStackLayout, 0);
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end