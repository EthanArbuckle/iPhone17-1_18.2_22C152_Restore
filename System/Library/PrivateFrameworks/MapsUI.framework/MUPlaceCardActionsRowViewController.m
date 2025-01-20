@interface MUPlaceCardActionsRowViewController
- (BOOL)_canShowWhileLocked;
- (MKPlaceActionManagerProtocol)actionManager;
- (MUPlaceCardActionsRowView)actionsRowView;
- (MUPlaceCardActionsRowViewController)initWithStyle:(unint64_t)a3;
- (MUPlaceCardActionsRowViewMenuProvider)menuProvider;
- (NSArray)actionButtons;
- (NSArray)items;
- (void)setActionManager:(id)a3;
- (void)setItems:(id)a3;
- (void)setMenuProvider:(id)a3;
- (void)updateActionsRowView;
- (void)viewDidLoad;
@end

@implementation MUPlaceCardActionsRowViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUPlaceCardActionsRowViewController)initWithStyle:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MUPlaceCardActionsRowViewController;
  v4 = [(MUPlaceCardActionsRowViewController *)&v10 initWithNibName:0 bundle:0];
  if (v4)
  {
    if (!a3)
    {
      v5 = [MEMORY[0x1E4F31038] sharedInstance];
      BOOL v6 = [v5 userInterfaceIdiom] == 2;

      a3 = 2 * v6;
    }
    v7 = [[MUPlaceCardActionsRowView alloc] initWithStyle:a3];
    actionsRowView = v4->_actionsRowView;
    v4->_actionsRowView = v7;
  }
  return v4;
}

- (void)updateActionsRowView
{
}

- (void)setActionManager:(id)a3
{
  p_actionManager = &self->_actionManager;
  id v5 = a3;
  objc_storeWeak((id *)p_actionManager, v5);
  [(MUPlaceCardActionsRowView *)self->_actionsRowView setActionManager:v5];
}

- (void)setMenuProvider:(id)a3
{
  p_menuProvider = &self->_menuProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_menuProvider, v5);
  [(MUPlaceCardActionsRowView *)self->_actionsRowView setMenuProvider:v5];
}

- (NSArray)actionButtons
{
  return [(MUGroupedActionsRowView *)self->_actionsRowView actionButtons];
}

- (void)viewDidLoad
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v3 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceCardActionsRowViewDidLoad", "", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)MUPlaceCardActionsRowViewController;
  [(MUPlaceCardActionsRowViewController *)&v26 viewDidLoad];
  v4 = [(MUPlaceCardActionsRowViewController *)self view];
  [v4 setPreservesSuperviewLayoutMargins:1];

  [(MUPlaceCardActionsRowView *)self->_actionsRowView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlaceCardActionsRowView *)self->_actionsRowView setPreservesSuperviewLayoutMargins:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  [(MUPlaceCardActionsRowView *)self->_actionsRowView setActionManager:WeakRetained];

  BOOL v6 = [(MUPlaceCardActionsRowViewController *)self view];
  [v6 addSubview:self->_actionsRowView];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v24 = [(MUPlaceCardActionsRowView *)self->_actionsRowView topAnchor];
  v25 = [(MUPlaceCardActionsRowViewController *)self view];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v28[0] = v22;
  v20 = [(MUPlaceCardActionsRowView *)self->_actionsRowView leadingAnchor];
  v21 = [(MUPlaceCardActionsRowViewController *)self view];
  v19 = [v21 leadingAnchor];
  v7 = [v20 constraintEqualToAnchor:v19];
  v28[1] = v7;
  v8 = [(MUPlaceCardActionsRowView *)self->_actionsRowView trailingAnchor];
  v9 = [(MUPlaceCardActionsRowViewController *)self view];
  objc_super v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v28[2] = v11;
  v12 = [(MUPlaceCardActionsRowView *)self->_actionsRowView bottomAnchor];
  v13 = [(MUPlaceCardActionsRowViewController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v28[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v18 activateConstraints:v16];

  v17 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceCardActionsRowViewDidLoad", "", buf, 2u);
  }
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
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

- (MUPlaceCardActionsRowView)actionsRowView
{
  return self->_actionsRowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsRowView, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_items, 0);
}

@end