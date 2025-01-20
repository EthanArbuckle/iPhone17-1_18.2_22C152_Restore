@interface MUPlaceCardActionsRowView
- (MKPlaceActionManagerProtocol)actionManager;
- (MUPlaceCardActionsRowView)initWithConfiguration:(id)a3 style:(unint64_t)a4;
- (MUPlaceCardActionsRowView)initWithStyle:(unint64_t)a3;
- (MUPlaceCardActionsRowViewMenuProvider)menuProvider;
- (id)_buildModuleForAnalytics;
- (int)_buttonItemTypeFromActionItem:(id)a3;
- (void)_createActionsFromActionManager;
- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5;
- (void)reload;
- (void)setActionManager:(id)a3;
- (void)setMenuProvider:(id)a3;
@end

@implementation MUPlaceCardActionsRowView

- (MUPlaceCardActionsRowView)initWithStyle:(unint64_t)a3
{
  v5 = +[MUGroupedActionsRowViewConfiguration defaultConfiguration];
  v6 = [(MUPlaceCardActionsRowView *)self initWithConfiguration:v5 style:a3];

  return v6;
}

- (MUPlaceCardActionsRowView)initWithConfiguration:(id)a3 style:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceCardActionsRowView;
  v5 = [(MUGroupedActionsRowView *)&v8 initWithConfiguration:a3];
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    [(MUPlaceCardActionsRowView *)v5 setAccessibilityIdentifier:@"PlaceCardActionsRow"];
    [(MUGroupedActionsRowView *)v6 setDelegate:v6];
    v6->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
  }
  return v6;
}

- (void)setActionManager:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_actionManager, obj);
    viewModels = self->_viewModels;
    self->_viewModels = 0;

    [(MUPlaceCardActionsRowView *)self _createActionsFromActionManager];
    v5 = obj;
  }
}

- (void)reload
{
  viewModels = self->_viewModels;
  self->_viewModels = 0;

  [(MUPlaceCardActionsRowView *)self _createActionsFromActionManager];
}

- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [(MUPlaceCardActionsRowView *)self _buildModuleForAnalytics];
    v24[0] = *MEMORY[0x1E4F30DC8];
    v12 = [v10 sourceView];
    v24[1] = *MEMORY[0x1E4F30DC0];
    v25[0] = v12;
    v25[1] = v11;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v9 actionRowItem];
    v15 = [v14 selectedItem];

    if (v15) {
      [v14 setEnabled:0];
    }
    v16 = v14;
    if ([v14 selected])
    {
      v17 = [v14 selectedItem];

      v16 = v14;
      if (v17)
      {
        v16 = [v14 selectedItem];
      }
    }
    v18 = [(MUPlaceCardActionsRowView *)self actionManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__MUPlaceCardActionsRowView_actionsRowView_didSelectViewModel_presentationOptions___block_invoke;
    v21[3] = &unk_1E574EE08;
    id v22 = v16;
    id v23 = v14;
    id v19 = v14;
    id v20 = v16;
    [v18 performAction:v20 options:v13 completion:v21];
  }
}

uint64_t __83__MUPlaceCardActionsRowView_actionsRowView_didSelectViewModel_presentationOptions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:1];
  v2 = *(void **)(a1 + 40);
  return [v2 setEnabled:1];
}

- (void)setMenuProvider:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_menuProvider = &self->_menuProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_menuProvider, v4);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_viewModels;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          id v13 = objc_loadWeakRetained((id *)p_menuProvider);
          objc_msgSend(v12, "setMenuProvider:", v13, (void)v14);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)_createActionsFromActionManager
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(MUGroupedActionsRowView *)self viewModels];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v5 = [(MUPlaceCardActionsRowView *)self actionManager];
    v6 = [v5 createRowActionsWithStyle:self->_style];
    v7 = (void *)[v6 copy];

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    v27 = self;
    if (self->_myPlacesEnabled && MapKitIdiomIsMacCatalyst()) {
      [v8 addObjectsFromArray:&unk_1EE4050A8];
    }
    int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (IsMacCatalyst)
          {
            long long v16 = [*(id *)(*((void *)&v29 + 1) + 8 * i) resolvedActionItem];
            long long v17 = [v16 glyph];
            uint64_t v18 = [v17 length];

            if (!v18) {
              continue;
            }
          }
          uint64_t v19 = NSNumber;
          id v20 = [v15 resolvedActionItem];
          v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "type"));
          char v22 = [v8 containsObject:v21];

          if ((v22 & 1) == 0)
          {
            id v23 = [MUPlaceActionRowItemViewModel alloc];
            v24 = [(MUPlaceCardActionsRowView *)v27 menuProvider];
            v25 = [(MUPlaceActionRowItemViewModel *)v23 initWithActionRowItem:v15 menuProvider:v24 style:v27->_style];

            [v28 addObject:v25];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    v26 = (void *)[v28 copy];
    [(MUGroupedActionsRowView *)v27 setViewModels:v26];
  }
}

- (int)_buttonItemTypeFromActionItem:(id)a3
{
  v3 = [a3 resolvedActionItem];
  uint64_t v4 = [v3 type];

  int result = 0;
  switch(v4)
  {
    case 7:
    case 13:
      int result = 6;
      break;
    case 8:
    case 9:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
      return result;
    case 10:
      int result = 4;
      break;
    case 11:
      int result = 5;
      break;
    case 16:
      int result = 3;
      break;
    case 21:
      int result = 1;
      break;
    default:
      if (v4 == 34) {
        int v6 = 11;
      }
      else {
        int v6 = 0;
      }
      if ((unint64_t)(v4 - 1) >= 2) {
        int result = v6;
      }
      else {
        int result = 2;
      }
      break;
  }
  return result;
}

- (id)_buildModuleForAnalytics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F643A8] moduleFromModuleType:12];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_viewModels;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "actionRowItem", (void)v12);
        uint64_t v10 = [(MUPlaceCardActionsRowView *)self _buttonItemTypeFromActionItem:v9];

        if (v10) {
          [v3 addContent:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (MKPlaceActionManagerProtocol)actionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  return (MKPlaceActionManagerProtocol *)WeakRetained;
}

- (MUPlaceCardActionsRowViewMenuProvider)menuProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  return (MUPlaceCardActionsRowViewMenuProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end