@interface CNGroupIdentityInlineActionsViewController
+ (id)descriptorForRequiredKeys;
- (BOOL)contactInlineActionsViewController:(id)a3 canPerformGroupActionOfType:(id)a4;
- (BOOL)contactInlineActionsViewController:(id)a3 overrideEnabledStateForActionOfType:(id)a4;
- (BOOL)contactInlineActionsViewController:(id)a3 shouldOverrideEnabledStateForActionOfType:(id)a4;
- (BOOL)contactInlineActionsViewController:(id)a3 shouldPresentDisambiguationUIForActionOfType:(id)a4;
- (BOOL)shouldOverrideEnabledStateForActionItem:(id)a3;
- (CNContactInlineActionsViewController)inlineActionsViewController;
- (CNGroupIdentity)group;
- (CNGroupIdentityInlineActionsViewConfiguration)configuration;
- (CNGroupIdentityInlineActionsViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4;
- (CNGroupIdentityInlineActionsViewControllerDelegate)delegate;
- (double)actionsViewHeightThatFits:(CGSize)a3;
- (id)actionsContainerView;
- (id)actionsView;
- (id)contactInlineActionsViewController:(id)a3 overrideImageForActionOfType:(id)a4;
- (id)contactInlineActionsViewController:(id)a3 overrideTitleForActionOfType:(id)a4;
- (id)viewForActionAtIndex:(unint64_t)a3;
- (int64_t)style;
- (void)contactInlineActionsViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5;
- (void)contactInlineActionsViewController:(id)a3 didSelectActionOfType:(id)a4;
- (void)contactInlineActionsViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGroup:(id)a3;
- (void)setInlineActionsViewController:(id)a3;
- (void)setupActionsView;
- (void)updateActionsViewForUpdatedActionItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation CNGroupIdentityInlineActionsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inlineActionsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_group, 0);
}

- (CNGroupIdentityInlineActionsViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setInlineActionsViewController:(id)a3
{
}

- (CNContactInlineActionsViewController)inlineActionsViewController
{
  return self->_inlineActionsViewController;
}

- (void)setDelegate:(id)a3
{
}

- (CNGroupIdentityInlineActionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNGroupIdentityInlineActionsViewControllerDelegate *)WeakRetained;
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (BOOL)contactInlineActionsViewController:(id)a3 overrideEnabledStateForActionOfType:(id)a4
{
  id v5 = a4;
  v6 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v7 = [v6 actionsPerType];
  v8 = [v7 objectForKeyedSubscript:v5];

  LOBYTE(v6) = [v8 overrideEnabledState];
  return (char)v6;
}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldOverrideEnabledStateForActionOfType:(id)a4
{
  id v5 = a4;
  v6 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v7 = [v6 actionsPerType];
  v8 = [v7 objectForKeyedSubscript:v5];

  LOBYTE(self) = [(CNGroupIdentityInlineActionsViewController *)self shouldOverrideEnabledStateForActionItem:v8];
  return (char)self;
}

- (id)contactInlineActionsViewController:(id)a3 overrideTitleForActionOfType:(id)a4
{
  id v5 = a4;
  v6 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v7 = [v6 actionsPerType];
  v8 = [v7 objectForKeyedSubscript:v5];

  v9 = [v8 title];

  return v9;
}

- (id)contactInlineActionsViewController:(id)a3 overrideImageForActionOfType:(id)a4
{
  id v5 = a4;
  v6 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v7 = [v6 actionsPerType];
  v8 = [v7 objectForKeyedSubscript:v5];

  v9 = [v8 image];

  return v9;
}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldPresentDisambiguationUIForActionOfType:(id)a4
{
  id v5 = a4;
  v6 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v7 = [v6 actionsPerType];
  v8 = [v7 objectForKeyedSubscript:v5];

  LOBYTE(v6) = [v8 shouldPresentDisambiguationUI];
  return (char)v6;
}

- (BOOL)contactInlineActionsViewController:(id)a3 canPerformGroupActionOfType:(id)a4
{
  id v5 = a4;
  v6 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v7 = [v6 actionsPerType];
  v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    v9 = [v8 actionBlock];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)contactInlineActionsViewController:(id)a3 didSelectActionOfType:(id)a4
{
  id v10 = a4;
  id v5 = [(CNGroupIdentityInlineActionsViewController *)self configuration];
  v6 = [v5 actionsPerType];
  v7 = [v6 objectForKeyedSubscript:v10];

  if (v7)
  {
    v8 = [v7 actionBlock];

    if (v8)
    {
      v9 = [v7 actionBlock];
      ((void (**)(void, id))v9)[2](v9, v10);
    }
  }
}

- (void)contactInlineActionsViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4
{
  id v8 = a4;
  id v5 = [(CNGroupIdentityInlineActionsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CNGroupIdentityInlineActionsViewController *)self delegate];
    [v7 groupIdentityInlineActionsViewController:self willPresentDisambiguationUIForActionType:v8];
  }
}

- (void)contactInlineActionsViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  v7 = [(CNGroupIdentityInlineActionsViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CNGroupIdentityInlineActionsViewController *)self delegate];
    [v9 groupIdentityInlineActionsViewController:self didPerformActionOfType:v10 fromDisambiguation:v5];
  }
}

- (double)actionsViewHeightThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v5 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  char v6 = [v5 actionsView];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;

  return v8;
}

- (void)setupActionsView
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  v4 = [v3 view];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v5 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  [(CNGroupIdentityInlineActionsViewController *)self addChildViewController:v5];

  char v6 = [(CNGroupIdentityInlineActionsViewController *)self view];
  [v6 addSubview:v4];

  v22 = [v4 topAnchor];
  v23 = [(CNGroupIdentityInlineActionsViewController *)self view];
  v21 = [v23 topAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  v18 = [v4 leadingAnchor];
  v19 = [(CNGroupIdentityInlineActionsViewController *)self view];
  v17 = [v19 leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v24[1] = v16;
  double v7 = [v4 trailingAnchor];
  double v8 = [(CNGroupIdentityInlineActionsViewController *)self view];
  v9 = [v8 trailingAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9];
  v24[2] = v10;
  v11 = [v4 bottomAnchor];
  v12 = [(CNGroupIdentityInlineActionsViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v24[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v15];
}

- (int64_t)style
{
  v2 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  int64_t v3 = [v2 viewStyle];

  return v3;
}

- (BOOL)shouldOverrideEnabledStateForActionItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNGroupIdentityInlineActionsViewController *)self group];
  char v6 = [v5 contacts];
  unint64_t v7 = [v6 count];

  double v8 = [MEMORY[0x1E4F5A720] allActionTypes];
  v9 = [v4 actionType];
  char v10 = objc_msgSend(v8, "_cn_containsObject:", v9);

  if (v7 <= 1 && (v10 & 1) != 0) {
    char v11 = 0;
  }
  else {
    char v11 = [v4 shouldOverrideEnabledState];
  }

  return v11;
}

- (void)updateActionsViewForUpdatedActionItem:(id)a3
{
  id v8 = a3;
  if (-[CNGroupIdentityInlineActionsViewController shouldOverrideEnabledStateForActionItem:](self, "shouldOverrideEnabledStateForActionItem:"))
  {
    id v4 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
    BOOL v5 = [v8 actionType];
    char v6 = [v4 existingActionItemForType:v5];

    if (v6)
    {
      objc_msgSend(v6, "setDisabled:", objc_msgSend(v8, "overrideEnabledState") ^ 1);
      unint64_t v7 = [(CNGroupIdentityInlineActionsViewController *)self actionsView];
      [v7 updateActionItem:v6];
    }
  }
}

- (id)actionsView
{
  v2 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  int64_t v3 = [v2 actionsView];

  return v3;
}

- (id)actionsContainerView
{
  v2 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  int64_t v3 = [v2 actionsView];
  id v4 = [v3 containerView];

  return v4;
}

- (id)viewForActionAtIndex:(unint64_t)a3
{
  id v4 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
  BOOL v5 = [v4 actionsView];
  char v6 = [v5 containerView];

  unint64_t v7 = [v6 arrangedSubviews];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    char v10 = 0;
  }
  else
  {
    v9 = [v6 arrangedSubviews];
    char v10 = [v9 objectAtIndex:a3];
  }

  return v10;
}

- (void)setGroup:(id)a3
{
  id v10 = a3;
  BOOL v5 = [(CNGroupIdentity *)self->_group contacts];
  char v6 = [v10 contacts];
  char v7 = objc_msgSend(v5, "_cn_isIdenticalToArray:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_group, a3);
    unint64_t v8 = [v10 contacts];
    v9 = [(CNGroupIdentityInlineActionsViewController *)self inlineActionsViewController];
    [v9 setContacts:v8];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNGroupIdentityInlineActionsViewController;
  [(CNGroupIdentityInlineActionsViewController *)&v3 viewDidLoad];
  [(CNGroupIdentityInlineActionsViewController *)self setupActionsView];
}

- (CNGroupIdentityInlineActionsViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CNGroupIdentityInlineActionsViewController;
  v9 = [(CNGroupIdentityInlineActionsViewController *)&v31 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    char v11 = objc_alloc_init(CNContactInlineActionsViewController);
    inlineActionsViewController = v10->_inlineActionsViewController;
    v10->_inlineActionsViewController = v11;

    -[CNContactInlineActionsViewController setViewStyle:](v10->_inlineActionsViewController, "setViewStyle:", [v8 actionViewStyle]);
    v13 = [v8 geminiChannelIdentifier];
    [(CNContactInlineActionsViewController *)v10->_inlineActionsViewController setGeminiChannelIdentifier:v13];

    [(CNContactInlineActionsViewController *)v10->_inlineActionsViewController setDelegate:v10];
    v14 = [MEMORY[0x1E4F5A720] allActionTypes];
    v15 = [MEMORY[0x1E4F5A720] allSupportedActionTypes];
    -[CNContactInlineActionsViewController setDisplaysUnavailableActionTypes:](v10->_inlineActionsViewController, "setDisplaysUnavailableActionTypes:", [v8 displaysUnavailableActionTypes]);
    v16 = [v8 supportedActionTypes];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke;
    v28[3] = &unk_1E549A6F8;
    id v29 = v14;
    id v30 = v15;
    id v17 = v15;
    id v18 = v14;
    v19 = objc_msgSend(v16, "_cn_filter:", v28);

    [(CNContactInlineActionsViewController *)v10->_inlineActionsViewController setSupportedActionTypes:v19];
    [(CNContactInlineActionsViewController *)v10->_inlineActionsViewController setObjectViewControllerDelegate:v10];
    [(CNContactInlineActionsViewController *)v10->_inlineActionsViewController setDisplaysTitles:1];
    v20 = [v7 contacts];
    [(CNContactInlineActionsViewController *)v10->_inlineActionsViewController setContacts:v20];

    v21 = [v8 actionsPerType];
    v22 = [v21 allValues];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke_2;
    v26[3] = &unk_1E5499710;
    v23 = v10;
    v27 = v23;
    objc_msgSend(v22, "_cn_each:", v26);

    v24 = v23;
  }

  return v10;
}

uint64_t __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_cn_containsObject:", v3)) {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_cn_containsObject:", v3);
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

+ (id)descriptorForRequiredKeys
{
  return +[CNContactInlineActionsViewController descriptorForRequiredKeys];
}

@end