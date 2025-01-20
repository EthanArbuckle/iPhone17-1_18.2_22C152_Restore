@interface CNContactInlineActionsViewController
+ (id)descriptorForRequiredKeys;
- (BOOL)_canShowWhileLocked;
- (BOOL)actionsView:(id)a3 shouldPresentDisambiguationUIForAction:(id)a4;
- (BOOL)displaysTitles;
- (BOOL)displaysUnavailableActionTypes;
- (BOOL)isGroupActionsView;
- (BOOL)shouldShowDisambiguationForAction:(id)a3;
- (CNActionsView)actionsView;
- (CNContact)contact;
- (CNContactActionsController)actionsController;
- (CNContactInlineActionsViewController)initWithActionListDataSource:(id)a3 environment:(id)a4;
- (CNContactInlineActionsViewController)initWithContactActionsContext:(id)a3;
- (CNContactInlineActionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactInlineActionsViewControllerDelegate)delegate;
- (CNCustomPresentation)actionsControllerPresentation;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIContactsEnvironment)environment;
- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate;
- (CNUIUserActionListDataSource)actionListDataSource;
- (NSArray)actionItems;
- (NSArray)contacts;
- (NSArray)supportedActionTypes;
- (NSArray)tokens;
- (NSDictionary)defaultActionPerType;
- (NSString)geminiChannelIdentifier;
- (UIColor)posterTintColor;
- (double)actionTypesInterspace;
- (double)throttleDelay;
- (id)actionImageTextStyleForViewStyle:(int64_t)a3;
- (id)allModelsObservable;
- (id)existingActionItemForType:(id)a3;
- (id)makeActionItemForType:(id)a3;
- (int64_t)viewStyle;
- (void)checkinLaunchTasksForUndiscoverableActionsForContact:(id)a3;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)dealloc;
- (void)didSelectAction:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5;
- (void)discoverAvailableActionTypes;
- (void)displayActionForType:(id)a3 withDefaultAction:(id)a4 enabled:(BOOL)a5;
- (void)displayAdditionalActionItems:(id)a3;
- (void)displayAllSupportedTypesDisabled;
- (void)generateActionsControllerForActionType:(id)a3;
- (void)loadCachedActions;
- (void)loadView;
- (void)notifyDelegateOfDisambiguationForActionType:(id)a3;
- (void)notifyDelegateOfPerformedActionType:(id)a3 fromDisambiguation:(BOOL)a4;
- (void)performAction:(id)a3;
- (void)performGroupActionForType:(id)a3;
- (void)processModels:(id)a3;
- (void)removeActionForType:(id)a3;
- (void)removeVisibleActionItems:(id)a3;
- (void)reset;
- (void)setActionItems:(id)a3;
- (void)setActionListDataSource:(id)a3;
- (void)setActionTypesInterspace:(double)a3;
- (void)setActionsController:(id)a3;
- (void)setActionsControllerPresentation:(id)a3;
- (void)setActionsView:(id)a3;
- (void)setContact:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDefaultActionPerType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaysTitles:(BOOL)a3;
- (void)setDisplaysUnavailableActionTypes:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setGeminiChannelIdentifier:(id)a3;
- (void)setObjectViewControllerDelegate:(id)a3;
- (void)setPosterTintColor:(id)a3;
- (void)setSchedulerProvider:(id)a3;
- (void)setSupportedActionTypes:(id)a3;
- (void)setTokens:(id)a3;
- (void)setViewStyle:(int64_t)a3;
- (void)setupGroupActions;
- (void)setupSingleContactActions;
- (void)updateActionItem:(id)a3 withDefaultAction:(id)a4;
- (void)updateDesiredTitleFontSizeIfNeeded;
- (void)updateVisibleActionItems:(id)a3;
- (void)viewDidLoad;
@end

@implementation CNContactInlineActionsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterTintColor, 0);
  objc_destroyWeak((id *)&self->_actionsView);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_actionListDataSource, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_actionsControllerPresentation, 0);
  objc_storeStrong((id *)&self->_defaultActionPerType, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_geminiChannelIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedActionTypes, 0);

  objc_destroyWeak((id *)&self->objectViewControllerDelegate);
}

- (UIColor)posterTintColor
{
  return self->_posterTintColor;
}

- (void)setActionsView:(id)a3
{
}

- (CNActionsView)actionsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsView);

  return (CNActionsView *)WeakRetained;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setActionListDataSource:(id)a3
{
}

- (CNUIUserActionListDataSource)actionListDataSource
{
  return self->_actionListDataSource;
}

- (void)setEnvironment:(id)a3
{
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setSchedulerProvider:(id)a3
{
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setActionsControllerPresentation:(id)a3
{
}

- (CNCustomPresentation)actionsControllerPresentation
{
  return self->_actionsControllerPresentation;
}

- (void)setDefaultActionPerType:(id)a3
{
}

- (NSDictionary)defaultActionPerType
{
  return self->_defaultActionPerType;
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setActionItems:(id)a3
{
}

- (NSArray)actionItems
{
  return self->_actionItems;
}

- (void)setGeminiChannelIdentifier:(id)a3
{
}

- (NSString)geminiChannelIdentifier
{
  return self->_geminiChannelIdentifier;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactInlineActionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactInlineActionsViewControllerDelegate *)WeakRetained;
}

- (int64_t)viewStyle
{
  return self->_viewStyle;
}

- (double)actionTypesInterspace
{
  return self->_actionTypesInterspace;
}

- (NSArray)supportedActionTypes
{
  return self->_supportedActionTypes;
}

- (BOOL)displaysTitles
{
  return self->_displaysTitles;
}

- (BOOL)displaysUnavailableActionTypes
{
  return self->_displaysUnavailableActionTypes;
}

- (void)setObjectViewControllerDelegate:(id)a3
{
}

- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->objectViewControllerDelegate);

  return (CNUIObjectViewControllerDelegate *)WeakRetained;
}

- (id)actionImageTextStyleForViewStyle:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6) {
    v3 = (id *)MEMORY[0x1E4FB2998];
  }
  else {
    v3 = (id *)MEMORY[0x1E4FB28C8];
  }
  return *v3;
}

- (void)notifyDelegateOfDisambiguationForActionType:(id)a3
{
  id v7 = a3;
  v4 = [(CNContactInlineActionsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(CNContactInlineActionsViewController *)self delegate];
    [v6 contactInlineActionsViewController:self willPresentDisambiguationUIForActionType:v7];
  }
}

- (void)notifyDelegateOfPerformedActionType:(id)a3 fromDisambiguation:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v6 = [(CNContactInlineActionsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNContactInlineActionsViewController *)self delegate];
    [v8 contactInlineActionsViewController:self didPerformActionOfType:v9 fromDisambiguation:v4];
  }
}

- (BOOL)isGroupActionsView
{
  v3 = [(CNContactInlineActionsViewController *)self contact];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    char v5 = [(CNContactInlineActionsViewController *)self contacts];
    BOOL v4 = (unint64_t)[v5 count] > 1;
  }
  return v4;
}

- (void)performGroupActionForType:(id)a3
{
  id v7 = a3;
  if ([(CNContactInlineActionsViewController *)self isGroupActionsView])
  {
    BOOL v4 = [(CNContactInlineActionsViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [(CNContactInlineActionsViewController *)self delegate];
      [v6 contactInlineActionsViewController:self didSelectActionOfType:v7];

      [(CNContactInlineActionsViewController *)self notifyDelegateOfPerformedActionType:v7 fromDisambiguation:0];
    }
  }
}

- (void)setupGroupActions
{
  v3 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CNContactInlineActionsViewController_setupGroupActions__block_invoke;
  v4[3] = &unk_1E549B460;
  v4[4] = self;
  objc_msgSend(v3, "_cn_each:", v4);
}

void __57__CNContactInlineActionsViewController_setupGroupActions__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) delegate];
    uint64_t v6 = [v5 contactInlineActionsViewController:*(void *)(a1 + 32) canPerformGroupActionOfType:v7];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 32) displayActionForType:v7 withDefaultAction:0 enabled:v6];
}

- (BOOL)shouldShowDisambiguationForAction:(id)a3
{
  id v4 = a3;
  if ([(CNContactInlineActionsViewController *)self isGroupActionsView])
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [(CNContactInlineActionsViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(CNContactInlineActionsViewController *)self delegate];
      id v9 = [v4 type];
      char v5 = [v8 contactInlineActionsViewController:self shouldPresentDisambiguationUIForActionOfType:v9];
    }
    else
    {
      char v5 = 1;
    }
  }

  return v5;
}

- (void)generateActionsControllerForActionType:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CNContactInlineActionsViewController *)self actionsController];
  [v5 cancelModels];

  uint64_t v6 = [(CNContactInlineActionsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || ([(CNContactInlineActionsViewController *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 contactInlineActionsViewController:self shouldPresentDisambiguationUIForActionOfType:v4], v8, v9))
  {
    v10 = [CNContactActionsController alloc];
    v11 = [(CNContactInlineActionsViewController *)self contact];
    v12 = [(CNContactInlineActionsViewController *)self actionListDataSource];
    v18[0] = v4;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v14 = [(CNContactActionsController *)v10 initWithContact:v11 dataSource:v12 actionTypes:v13];
    [(CNContactInlineActionsViewController *)self setActionsController:v14];

    v15 = [(CNContactInlineActionsViewController *)self actionsController];
    [v15 setShouldUseOutlinedActionGlyphStyle:1];

    v16 = [(CNContactInlineActionsViewController *)self actionsController];
    [v16 setDisplayNonDefaultAppsMenuTitle:1];

    v17 = [(CNContactInlineActionsViewController *)self actionsController];
    [v17 setDelegate:self];
  }
}

- (void)performAction:(id)a3
{
  id v25 = a3;
  id v4 = [(CNContactInlineActionsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v6 = [(CNContactInlineActionsViewController *)self delegate];
  char v7 = [v25 type];
  v8 = [v25 contactProperty];
  int v9 = [v6 contactInlineActionsViewController:self shouldPerformActionOfType:v7 withContactProperty:v8];

  if (v9)
  {
LABEL_3:
    v10 = [(CNContactInlineActionsViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(CNContactInlineActionsViewController *)self delegate];
      v13 = [v25 type];
      [v12 contactInlineActionsViewController:self willPerformActionOfType:v13];
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F5A708]);
    uint64_t v15 = [(CNContactInlineActionsViewController *)self geminiChannelIdentifier];
    if (v15
      && (v16 = (void *)v15,
          [(CNContactInlineActionsViewController *)self geminiChannelIdentifier],
          v17 = objc_claimAutoreleasedReturnValue(),
          uint64_t v18 = [v17 length],
          v17,
          v16,
          v18))
    {
      v19 = [(CNContactInlineActionsViewController *)self geminiChannelIdentifier];
      [v14 setChannelIdentifier:v19];
    }
    else
    {
      v20 = [(CNContactInlineActionsViewController *)self delegate];
      char v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) == 0)
      {
LABEL_11:
        id v24 = (id)[v25 performActionWithContext:v14];

        goto LABEL_12;
      }
      v19 = [(CNContactInlineActionsViewController *)self delegate];
      v22 = [v19 geminiDataSource];
      v23 = [v22 channelIdentifier];
      [v14 setChannelIdentifier:v23];
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CNContactInlineActionsViewController *)self actionsControllerPresentation];
  char v7 = [v6 presentedViewController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CNContactInlineActionsViewController_contactActionsController_didSelectAction___block_invoke;
  v13[3] = &unk_1E549B488;
  v13[4] = self;
  [v7 dismissViewControllerAnimated:1 completion:v13];

  [(CNContactInlineActionsViewController *)self performAction:v5];
  v8 = [(CNContactInlineActionsViewController *)self actionsController];
  int v9 = [v8 actionTypes];
  v10 = [v9 firstObject];

  char v11 = [(CNContactInlineActionsViewController *)self actionListDataSource];
  v12 = [(CNContactInlineActionsViewController *)self contact];
  [v11 consumer:self didSelectItem:v5 forContact:v12 actionType:v10];

  [(CNContactInlineActionsViewController *)self notifyDelegateOfPerformedActionType:v10 fromDisambiguation:1];
  [(CNContactInlineActionsViewController *)self setActionsController:0];
}

uint64_t __81__CNContactInlineActionsViewController_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActionsControllerPresentation:0];
}

- (BOOL)actionsView:(id)a3 shouldPresentDisambiguationUIForAction:(id)a4
{
  return [(CNContactInlineActionsViewController *)self shouldShowDisambiguationForAction:a4];
}

- (void)didSelectAction:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5
{
  id v18 = a3;
  if (![(CNContactInlineActionsViewController *)self isGroupActionsView])
  {
    if (a5)
    {
      v8 = [v18 type];
      [(CNContactInlineActionsViewController *)self generateActionsControllerForActionType:v8];

      int v9 = [(CNContactInlineActionsViewController *)self actionsController];
      [v9 retrieveModels];

      char v7 = [v18 type];
      [(CNContactInlineActionsViewController *)self notifyDelegateOfDisambiguationForActionType:v7];
      goto LABEL_12;
    }
    v10 = [(CNContactInlineActionsViewController *)self defaultActionPerType];
    char v11 = [v18 type];
    v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      v13 = [(CNContactInlineActionsViewController *)self defaultActionPerType];
      id v14 = [v18 type];
      uint64_t v15 = [v13 objectForKeyedSubscript:v14];
      [(CNContactInlineActionsViewController *)self performAction:v15];
    }
    else
    {
      v16 = [(CNContactInlineActionsViewController *)self delegate];
      char v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0)
      {
LABEL_11:
        char v7 = [v18 type];
        [(CNContactInlineActionsViewController *)self notifyDelegateOfPerformedActionType:v7 fromDisambiguation:0];
        goto LABEL_12;
      }
      v13 = [(CNContactInlineActionsViewController *)self delegate];
      id v14 = [v18 type];
      [v13 contactInlineActionsViewController:self didSelectActionOfType:v14];
    }

    goto LABEL_11;
  }
  if (a5) {
    goto LABEL_13;
  }
  char v7 = [v18 type];
  [(CNContactInlineActionsViewController *)self performGroupActionForType:v7];
LABEL_12:

LABEL_13:
}

- (void)reset
{
  v3 = [(CNContactInlineActionsViewController *)self actionItems];
  char v4 = [v3 isEqual:MEMORY[0x1E4F1CBF0]];

  if ((v4 & 1) == 0)
  {
    id v5 = [(CNContactInlineActionsViewController *)self actionsView];
    [v5 resetActions];

    [(CNContactInlineActionsViewController *)self setActionItems:MEMORY[0x1E4F1CBF0]];
    uint64_t v6 = MEMORY[0x1E4F1CC08];
    [(CNContactInlineActionsViewController *)self setDefaultActionPerType:v6];
  }
}

- (id)existingActionItemForType:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactInlineActionsViewController *)self actionItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__CNContactInlineActionsViewController_existingActionItemForType___block_invoke;
  v9[3] = &unk_1E549B438;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __66__CNContactInlineActionsViewController_existingActionItemForType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 type];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)updateActionItem:(id)a3 withDefaultAction:(id)a4
{
  id v12 = a3;
  if ([(CNContactInlineActionsViewController *)self displaysTitles])
  {
    id v5 = [(CNContactInlineActionsViewController *)self actionListDataSource];
    uint64_t v6 = [v12 type];
    char v7 = [v5 consumer:self localizedButtonDisplayNameForActionType:v6];

    [v12 setTitle:v7];
    v8 = [(CNContactInlineActionsViewController *)self delegate];
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if (v6)
    {
      int v9 = [(CNContactInlineActionsViewController *)self delegate];
      id v10 = [v12 type];
      char v11 = [v9 contactInlineActionsViewController:self overrideTitleForActionOfType:v10];

      if (v11) {
        [v12 setTitle:v11];
      }
    }
  }
}

- (id)makeActionItemForType:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactInlineActionsViewController *)self actionImageTextStyleForViewStyle:[(CNContactInlineActionsViewController *)self viewStyle]];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_userActionSymbolImageForActionType:scale:withColor:compatibleWithTextStyle:", v4, -1, 0, v5);
  char v7 = [(CNContactInlineActionsViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(CNContactInlineActionsViewController *)self delegate];
    id v10 = [v9 contactInlineActionsViewController:self overrideImageForActionOfType:v4];

    if (v10) {
      char v11 = v10;
    }
    else {
      char v11 = v6;
    }
    id v12 = v11;

    uint64_t v6 = v12;
  }
  v13 = [[CNActionItem alloc] initWithImage:v6 type:v4];

  return v13;
}

- (void)removeActionForType:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CNContactInlineActionsViewController *)self existingActionItemForType:a3];
  if (v4)
  {
    id v5 = [(CNContactInlineActionsViewController *)self actionItems];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__CNContactInlineActionsViewController_removeActionForType___block_invoke;
    v9[3] = &unk_1E549B438;
    id v6 = v4;
    id v10 = v6;
    char v7 = objc_msgSend(v5, "_cn_filter:", v9);
    [(CNContactInlineActionsViewController *)self setActionItems:v7];

    v11[0] = v6;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(CNContactInlineActionsViewController *)self removeVisibleActionItems:v8];
  }
}

BOOL __60__CNContactInlineActionsViewController_removeActionForType___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (void)displayActionForType:(id)a3 withDefaultAction:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CNContactInlineActionsViewController *)self existingActionItemForType:v8];
  char v11 = (void *)v10;
  if (!v10)
  {
    char v11 = [(CNContactInlineActionsViewController *)self makeActionItemForType:v8];
  }
  [v11 setDisabled:!v5];
  id v12 = [(CNContactInlineActionsViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v13 = [(CNContactInlineActionsViewController *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [(CNContactInlineActionsViewController *)self delegate];
      int v16 = [v15 contactInlineActionsViewController:self shouldOverrideEnabledStateForActionOfType:v8];

      if (v16)
      {
        char v17 = [(CNContactInlineActionsViewController *)self delegate];
        int v18 = [v17 contactInlineActionsViewController:self overrideEnabledStateForActionOfType:v8];

        [v11 setDisabled:v18 ^ 1u];
      }
    }
  }
  else
  {
  }
  [(CNContactInlineActionsViewController *)self updateActionItem:v11 withDefaultAction:v9];
  if (v10)
  {
    v23[0] = v11;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(CNContactInlineActionsViewController *)self updateVisibleActionItems:v19];
  }
  else
  {
    v20 = [(CNContactInlineActionsViewController *)self actionItems];
    char v21 = [v20 arrayByAddingObject:v11];
    [(CNContactInlineActionsViewController *)self setActionItems:v21];

    v22 = v11;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [(CNContactInlineActionsViewController *)self displayAdditionalActionItems:v19];
  }
}

- (void)processModels:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactInlineActionsViewController *)self defaultActionPerType];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__CNContactInlineActionsViewController_processModels___block_invoke;
  char v11 = &unk_1E549B410;
  id v12 = v6;
  v13 = self;
  id v7 = v6;
  objc_msgSend(v4, "_cn_each:", &v8);

  -[CNContactInlineActionsViewController setDefaultActionPerType:](self, "setDefaultActionPerType:", v7, v8, v9, v10, v11);
}

void __54__CNContactInlineActionsViewController_processModels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id v6 = [v5 defaultAction];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v18];

  int v7 = [v5 isEmpty];
  uint64_t v8 = *(void **)(a1 + 40);
  if (!v7)
  {
    char v11 = [v5 defaultAction];
    [v8 displayActionForType:v18 withDefaultAction:v11 enabled:1];

    id v12 = [*(id *)(a1 + 40) environment];
    v13 = [v12 launchCheckinRegistrar];

    if ([v18 isEqual:*MEMORY[0x1E4F1AD48]])
    {
      uint64_t v14 = 16;
    }
    else if ([v18 isEqual:*MEMORY[0x1E4F1AD38]])
    {
      uint64_t v14 = 32;
    }
    else
    {
      if (![v18 isEqual:*MEMORY[0x1E4F1AD20]])
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v14 = 8;
    }
    [v13 checkInLaunchTasks:v14];
    goto LABEL_12;
  }
  int v9 = [*(id *)(a1 + 40) displaysUnavailableActionTypes];
  uint64_t v10 = *(void **)(a1 + 40);
  if (v9) {
    [v10 displayActionForType:v18 withDefaultAction:0 enabled:0];
  }
  else {
    [v10 removeActionForType:v18];
  }
LABEL_13:
  uint64_t v15 = [v5 defaultAction];
  int v16 = [*(id *)(a1 + 40) actionsView];
  char v17 = [v16 actionViewForType:v18];
  [v17 setShowsMenuAsPrimaryAction:v15 == 0];
}

- (void)discoverAvailableActionTypes
{
  v3 = [(CNContactInlineActionsViewController *)self contact];
  v23 = [v3 shortDebugDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 387, 7, @"%@ canceling previous action discovering requests, contact now is %@", v4, v5, v6, v7, (uint64_t)self);

  uint64_t v8 = [(CNContactInlineActionsViewController *)self tokens];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke;
  v34[3] = &unk_1E549B398;
  v34[4] = self;
  [v8 enumerateObjectsUsingBlock:v34];

  [(CNContactInlineActionsViewController *)self setTokens:MEMORY[0x1E4F1CBF0]];
  int v9 = [(CNContactInlineActionsViewController *)self contact];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    objc_initWeak(&location, self);
    uint64_t v27 = 0;
    v28 = (id *)&v27;
    uint64_t v29 = 0x3042000000;
    v30 = __Block_byref_object_copy__62989;
    v31 = __Block_byref_object_dispose__62990;
    id v32 = 0;
    char v11 = [(CNContactInlineActionsViewController *)self contact];
    id v24 = [v11 shortDebugDescription];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 407, 7, @"%@ subscribing action discovering requests for contact %@.", v12, v13, v14, v15, (uint64_t)self);

    int v16 = [(CNContactInlineActionsViewController *)self allModelsObservable];
    char v17 = [(CNContactInlineActionsViewController *)self schedulerProvider];
    id v18 = [v17 backgroundScheduler];
    v19 = [v16 subscribeOn:v18];
    v20 = (void *)MEMORY[0x1E4F5A488];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_49;
    v25[3] = &unk_1E549B3E8;
    objc_copyWeak(&v26, &location);
    v25[4] = &v27;
    char v21 = [v20 observerWithResultBlock:v25];
    v22 = [v19 subscribe:v21];

    [v10 addObject:v22];
    objc_storeWeak(v28 + 5, v22);
    [(CNContactInlineActionsViewController *)self setTokens:v10];

    objc_destroyWeak(&v26);
    _Block_object_dispose(&v27, 8);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) schedulerProvider];
  uint64_t v5 = [v4 backgroundScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2;
  v7[3] = &unk_1E549B488;
  id v8 = v3;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2_50;
  aBlock[3] = &unk_1E549B3C0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v9 = *(void *)(a1 + 32);
  id v4 = v3;
  id v8 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  [v6 performBlock:v5];

  objc_destroyWeak(&v10);
}

void __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (v2)
  {
    id v3 = [WeakRetained tokens];
    int v4 = [v3 containsObject:v2];

    if (v4) {
      [WeakRetained processModels:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)loadCachedActions
{
  id v3 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CNContactInlineActionsViewController_loadCachedActions__block_invoke;
  v6[3] = &unk_1E549B370;
  v6[4] = self;
  int v4 = objc_msgSend(v3, "_cn_map:", v6);
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3];
  [(CNContactInlineActionsViewController *)self processModels:v5];
}

id __57__CNContactInlineActionsViewController_loadCachedActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 actionListDataSource];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 contact];
  id v8 = [v5 consumer:v6 currentActionModelForContact:v7 actionType:v4];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F5A728] emptyModel];
  }
  id v10 = v9;

  return v10;
}

- (id)allModelsObservable
{
  id v3 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke;
  v14[3] = &unk_1E549B328;
  v14[4] = self;
  id v4 = objc_msgSend(v3, "_cn_map:", v14);

  uint64_t v5 = (void *)MEMORY[0x1E4F5A480];
  id v6 = [(CNContactInlineActionsViewController *)self schedulerProvider];
  uint64_t v7 = [v5 merge:v4 schedulerProvider:v6];

  id v8 = [v7 scan:&__block_literal_global_38_63001 seed:MEMORY[0x1E4F1CC08]];
  [(CNContactInlineActionsViewController *)self throttleDelay];
  double v10 = v9;
  char v11 = [(CNContactInlineActionsViewController *)self schedulerProvider];
  uint64_t v12 = [v8 throttle:v11 schedulerProvider:v10];

  return v12;
}

id __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) actionListDataSource];
  uint64_t v5 = [*(id *)(a1 + 32) contact];
  id v6 = [v4 consumer:0 actionModelsForContact:v5 actionType:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke_2;
  v10[3] = &unk_1E549B300;
  id v11 = v3;
  id v7 = v3;
  id v8 = [v6 map:v10];

  return v8;
}

id __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)[a2 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  id v6 = (void *)[v5 copy];

  return v6;
}

id __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = a2;
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(CNContactInlineActionsViewController *)self actionsController];

    if (v7 == v12)
    {
      id v8 = [(CNContactInlineActionsViewController *)self actionsView];
      double v9 = [v12 actionTypes];
      double v10 = [v9 firstObject];
      id v11 = [v8 actionViewForType:v10];

      [v11 updateWithMenuItems:v6];
    }
  }
}

- (void)updateVisibleActionItems:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__CNContactInlineActionsViewController_updateVisibleActionItems___block_invoke;
  v3[3] = &unk_1E549B2D8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __65__CNContactInlineActionsViewController_updateVisibleActionItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionsView];
  [v4 updateActionItem:v3];
}

- (void)displayAdditionalActionItems:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__CNContactInlineActionsViewController_displayAdditionalActionItems___block_invoke;
  v3[3] = &unk_1E549B2D8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __69__CNContactInlineActionsViewController_displayAdditionalActionItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionsView];
  [v4 addActionItem:v3];
}

- (void)removeVisibleActionItems:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__CNContactInlineActionsViewController_removeVisibleActionItems___block_invoke;
  v3[3] = &unk_1E549B2D8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __65__CNContactInlineActionsViewController_removeVisibleActionItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionsView];
  [v4 removeActionItem:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactInlineActionsViewController;
  [(CNContactInlineActionsViewController *)&v4 viewDidLoad];
  [(CNContactInlineActionsViewController *)self updateDesiredTitleFontSizeIfNeeded];
  id v3 = [(CNContactInlineActionsViewController *)self actionItems];
  [(CNContactInlineActionsViewController *)self displayAdditionalActionItems:v3];
}

- (void)loadView
{
  id v7 = objc_alloc_init(CNActionsView);
  id v3 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
  [(CNActionsView *)v7 setSortedActionTypes:v3];

  [(CNActionsView *)v7 setActionsDelegate:self];
  [(CNContactInlineActionsViewController *)self actionTypesInterspace];
  -[CNActionsView setSpacing:](v7, "setSpacing:");
  [(CNActionsView *)v7 setStyle:[(CNContactInlineActionsViewController *)self viewStyle]];
  [(CNContactInlineActionsViewController *)self setView:v7];
  [(CNContactInlineActionsViewController *)self setActionsView:v7];
  objc_super v4 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v6 = [(CNContactInlineActionsViewController *)self actionsView];
    [v6 setHidden:1];
  }
}

- (double)throttleDelay
{
  BOOL v2 = [(CNContactInlineActionsViewController *)self displaysUnavailableActionTypes];
  double result = 0.025;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (void)setViewStyle:(int64_t)a3
{
  self->_viewStyle = a3;
  id v4 = [(CNContactInlineActionsViewController *)self actionsView];
  [v4 setStyle:a3];
}

- (void)setSupportedActionTypes:(id)a3
{
  id v18 = a3;
  char v4 = [v18 isEqual:self->_supportedActionTypes];
  uint64_t v5 = v18;
  if ((v4 & 1) == 0)
  {
    id v6 = (NSArray *)[v18 copy];
    supportedActionTypes = self->_supportedActionTypes;
    self->_supportedActionTypes = v6;

    [(CNContactInlineActionsViewController *)self reset];
    id v8 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
    BOOL v9 = [v8 count] == 0;
    double v10 = [(CNContactInlineActionsViewController *)self actionsView];
    [v10 setHidden:v9];

    id v11 = [(CNContactInlineActionsViewController *)self actionsView];
    [v11 setSortedActionTypes:v18];

    if ([(CNContactInlineActionsViewController *)self displaysUnavailableActionTypes]) {
      [(CNContactInlineActionsViewController *)self displayAllSupportedTypesDisabled];
    }
    id v12 = [(CNContactInlineActionsViewController *)self contact];
    char v17 = [v12 shortDebugDescription];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 261, 7, @"%@ just got new supportedActionTypes, contact is %@. Will discover action types…", v13, v14, v15, v16, (uint64_t)self);

    [(CNContactInlineActionsViewController *)self discoverAvailableActionTypes];
    uint64_t v5 = v18;
  }
}

- (void)setActionTypesInterspace:(double)a3
{
  self->_actionTypesInterspace = a3;
  id v4 = [(CNContactInlineActionsViewController *)self actionsView];
  [v4 setSpacing:a3];
}

- (void)checkinLaunchTasksForUndiscoverableActionsForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactInlineActionsViewController *)self environment];
  id v17 = [v5 launchCheckinRegistrar];

  id v6 = [v4 emailAddresses];
  uint64_t v7 = [v6 count];

  id v8 = [v4 phoneNumbers];

  uint64_t v9 = [v8 count];
  uint64_t v10 = 32 * (v7 == 0);
  if (!v9) {
    goto LABEL_3;
  }
  id v11 = [(CNContactInlineActionsViewController *)self environment];
  id v12 = [v11 actionDiscoveringEnvironment];
  uint64_t v13 = [v12 capabilities];
  char v14 = [v13 areTelephonyCallsSupported];

  if ((v14 & 1) == 0) {
LABEL_3:
  }
    v10 |= 8uLL;
  if (v7 | v9) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v10 | 0x10;
  }
  uint64_t v16 = v17;
  if (v15)
  {
    objc_msgSend(v17, "checkInLaunchTasks:");
    uint64_t v16 = v17;
  }
}

- (void)setupSingleContactActions
{
  [(CNContactInlineActionsViewController *)self reset];
  if ([(CNContactInlineActionsViewController *)self displaysUnavailableActionTypes]) {
    [(CNContactInlineActionsViewController *)self displayAllSupportedTypesDisabled];
  }
  id v3 = [(CNContactInlineActionsViewController *)self contact];
  id v4 = [v3 shortDebugDescription];
  uint64_t v9 = [(CNContactInlineActionsViewController *)self actionListDataSource];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 216, 7, @"%@ just got new contact %@, dataSource is %@. Will discover action types…", v5, v6, v7, v8, (uint64_t)self);

  [(CNContactInlineActionsViewController *)self loadCachedActions];
  [(CNContactInlineActionsViewController *)self discoverAvailableActionTypes];
  id v10 = [(CNContactInlineActionsViewController *)self contact];
  [(CNContactInlineActionsViewController *)self checkinLaunchTasksForUndiscoverableActionsForContact:v10];
}

- (void)setContacts:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  if (self->_contacts != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_contacts, a3);
    if ([(NSArray *)v6 count] < 2) {
      [(CNContactInlineActionsViewController *)self setupSingleContactActions];
    }
    else {
      [(CNContactInlineActionsViewController *)self setupGroupActions];
    }
    uint64_t v5 = v6;
  }
}

- (CNContact)contact
{
  id v3 = [(CNContactInlineActionsViewController *)self contacts];
  if ((unint64_t)[v3 count] > 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = [(CNContactInlineActionsViewController *)self contacts];
    uint64_t v5 = [v4 firstObject];
  }

  return (CNContact *)v5;
}

- (void)setContact:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  -[CNContactInlineActionsViewController setContacts:](self, "setContacts:", v6, v7, v8);
}

- (void)setDisplaysTitles:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = [(CNContactInlineActionsViewController *)self contact];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"You must call %@ before a contact is set", v9 format];
  }
  if (self->_displaysTitles != v3)
  {
    self->_displaysTitles = v3;
    [(CNContactInlineActionsViewController *)self updateDesiredTitleFontSizeIfNeeded];
  }
}

- (void)displayAllSupportedTypesDisabled
{
  id v5 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
  BOOL v3 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_20_63017);
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v5];
  [(CNContactInlineActionsViewController *)self processModels:v4];
}

uint64_t __72__CNContactInlineActionsViewController_displayAllSupportedTypesDisabled__block_invoke()
{
  return [MEMORY[0x1E4F5A728] emptyModel];
}

- (void)setPosterTintColor:(id)a3
{
  uint64_t v6 = (UIColor *)a3;
  if (self->_posterTintColor != v6)
  {
    objc_storeStrong((id *)&self->_posterTintColor, a3);
    id v5 = [(CNContactInlineActionsViewController *)self actionsView];
    [v5 setPosterTintColor:v6];
  }
}

- (void)updateDesiredTitleFontSizeIfNeeded
{
  v28[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactInlineActionsViewController *)self actionsView];
  id v4 = [v3 titleFont];

  if (!v4)
  {
    id v5 = [(CNContactInlineActionsViewController *)self actionsView];

    if (v5)
    {
      if ([(CNContactInlineActionsViewController *)self displaysTitles]
        && -[CNContactInlineActionsViewController displaysUnavailableActionTypes](self, "displaysUnavailableActionTypes")&& (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      {
        uint64_t v6 = [(CNContactInlineActionsViewController *)self supportedActionTypes];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __74__CNContactInlineActionsViewController_updateDesiredTitleFontSizeIfNeeded__block_invoke;
        v24[3] = &unk_1E549B290;
        v24[4] = self;
        id v7 = objc_msgSend(v6, "_cn_map:", v24);

        uint64_t v8 = [MEMORY[0x1E4F5A510] LongestString];
        uint64_t v9 = objc_msgSend(v7, "_cn_reduce:", v8);

        id v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v10 bounds];
        if (v11 <= 320.0) {
          double v12 = 46.0;
        }
        else {
          double v12 = 66.0;
        }

        uint64_t v13 = +[CNActionView defaultTitleFont];
        uint64_t v14 = *MEMORY[0x1E4FB06F8];
        uint64_t v27 = *MEMORY[0x1E4FB06F8];
        uint64_t v15 = +[CNActionView defaultTitleFont];
        v28[0] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v16, 0, 1.79769313e308, 1.79769313e308);
        double v18 = v17;

        if (v12 < v18)
        {
          v19 = [v13 fontWithSize:12.0];

          uint64_t v25 = v14;
          id v26 = v19;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, 1.79769313e308, 1.79769313e308);
          double v22 = v21;

          if (v12 >= v22)
          {
            uint64_t v13 = v19;
          }
          else
          {
            uint64_t v13 = [v19 fontWithSize:10.0];
          }
        }
        v23 = [(CNContactInlineActionsViewController *)self actionsView];
        [v23 setTitleFont:v13];
      }
    }
  }
}

__CFString *__74__CNContactInlineActionsViewController_updateDesiredTitleFontSizeIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 actionListDataSource];
  uint64_t v6 = [v5 consumer:*(void *)(a1 + 32) localizedButtonDisplayNameForActionType:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_1ED8AC728;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)setDisplaysUnavailableActionTypes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = [(CNContactInlineActionsViewController *)self contact];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"You must call %@ before a contact is set", v9 format];
  }
  self->_displaysUnavailableActionTypes = v3;
  if (v3)
  {
    [(CNContactInlineActionsViewController *)self updateDesiredTitleFontSizeIfNeeded];
    [(CNContactInlineActionsViewController *)self displayAllSupportedTypesDisabled];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  BOOL v3 = [(CNContactInlineActionsViewController *)self tokens];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_63027];

  v4.receiver = self;
  v4.super_class = (Class)CNContactInlineActionsViewController;
  [(CNContactInlineActionsViewController *)&v4 dealloc];
}

uint64_t __47__CNContactInlineActionsViewController_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (CNContactInlineActionsViewController)initWithActionListDataSource:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNContactInlineActionsViewController;
  uint64_t v9 = [(CNContactInlineActionsViewController *)&v23 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionListDataSource, a3);
    double v11 = [MEMORY[0x1E4F5A720] allSupportedActionTypes];
    uint64_t v12 = [v11 copy];
    supportedActionTypes = v10->_supportedActionTypes;
    v10->_supportedActionTypes = (NSArray *)v12;

    actionItems = v10->_actionItems;
    uint64_t v15 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v10->_actionItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    tokens = v10->_tokens;
    v10->_tokens = v15;

    defaultActionPerType = v10->_defaultActionPerType;
    v10->_defaultActionPerType = (NSDictionary *)MEMORY[0x1E4F1CC08];

    int v18 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    double v19 = 8.0;
    if (v18) {
      double v19 = 16.0;
    }
    v10->_actionTypesInterspace = v19;
    v10->_displaysUnavailableActionTypes = 0;
    v10->_displaysTitles = 0;
    uint64_t v20 = [v8 defaultSchedulerProvider];
    schedulerProvider = v10->_schedulerProvider;
    v10->_schedulerProvider = (CNSchedulerProvider *)v20;

    objc_storeStrong((id *)&v10->_environment, a4);
  }

  return v10;
}

- (CNContactInlineActionsViewController)initWithContactActionsContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dataSource];
  uint64_t v6 = [v4 environment];

  id v7 = [(CNContactInlineActionsViewController *)self initWithActionListDataSource:v5 environment:v6];
  return v7;
}

- (CNContactInlineActionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = objc_alloc(MEMORY[0x1E4F5A720]);
  id v7 = [v5 actionDiscoveringEnvironment];
  id v8 = (void *)[v6 initWithDiscoveringEnvironment:v7];

  uint64_t v9 = [(CNContactInlineActionsViewController *)self initWithActionListDataSource:v8 environment:v5];
  return v9;
}

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1E4F1B8F8];
  BOOL v3 = [MEMORY[0x1E4F5A720] descriptorForRequiredKeys];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [NSString stringWithUTF8String:"+[CNContactInlineActionsViewController descriptorForRequiredKeys]"];
  id v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

@end