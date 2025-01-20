@interface EKEventGenericDetailViewControllerOOPWrapperImpl
- (CGSize)preferredContentSize;
- (EKEventGenericDetailViewControllerOOPWrapperImpl)initWithTitle:(id)a3 viewID:(id)a4 event:(id)a5 leftBarButtonActions:(id)a6 rightBarButtonActions:(id)a7;
- (EKEventGenericDetailViewControllerOOPWrapperImpl)initWithTitle:(id)a3 viewID:(id)a4 leftBarButtonActions:(id)a5 rightBarButtonActions:(id)a6;
- (EKUIEmailCompositionManager)messageSendingManager;
- (NSArray)bottomStatusButtonActions;
- (NSArray)leftBarButtonActions;
- (NSArray)leftBarButtonItems;
- (NSArray)rightBarButtonActions;
- (NSArray)rightBarButtonItems;
- (UIColor)oopContentBackgroundColor;
- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)vc;
- (double)eventStatusButtonsViewButtonFontSize:(id)a3;
- (id)_statusButtonsContainerView;
- (id)_statusButtonsView;
- (void)_updateBottomButtons;
- (void)bottomStatusButtonTapped:(int64_t)a3;
- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4;
- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)leftBarButtonTapped:(id)a3;
- (void)rightBarButtonTapped:(id)a3;
- (void)setBottomStatusButtonActions:(id)a3;
- (void)setLeftBarButtonActions:(id)a3;
- (void)setLeftBarButtonItems:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setOopContentBackgroundColor:(id)a3;
- (void)setRightBarButtonActions:(id)a3;
- (void)setRightBarButtonItems:(id)a3;
- (void)setVc:(id)a3;
- (void)viewDidLoad;
@end

@implementation EKEventGenericDetailViewControllerOOPWrapperImpl

- (EKEventGenericDetailViewControllerOOPWrapperImpl)initWithTitle:(id)a3 viewID:(id)a4 leftBarButtonActions:(id)a5 rightBarButtonActions:(id)a6
{
  return [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self initWithTitle:a3 viewID:a4 event:0 leftBarButtonActions:a5 rightBarButtonActions:a6];
}

- (EKEventGenericDetailViewControllerOOPWrapperImpl)initWithTitle:(id)a3 viewID:(id)a4 event:(id)a5 leftBarButtonActions:(id)a6 rightBarButtonActions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)EKEventGenericDetailViewControllerOOPWrapperImpl;
  v17 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)&v20 init];
  if (v17)
  {
    EKUILogInitIfNeeded();
    [(EKEventGenericDetailViewControllerOOPWrapperImpl *)v17 setTitle:v12];
    objc_storeStrong((id *)&v17->_viewID, a4);
    objc_storeStrong((id *)&v17->_event, a5);
    [(EKEventGenericDetailViewControllerOOPWrapperImpl *)v17 setLeftBarButtonActions:v15];
    [(EKEventGenericDetailViewControllerOOPWrapperImpl *)v17 setRightBarButtonActions:v16];
    [(EKEventGenericDetailViewControllerOOPWrapperImpl *)v17 setBottomStatusButtonActions:MEMORY[0x1E4F1CBF0]];
    v18 = [[_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl alloc] initWithHostViewID:v17->_viewID];
    [(EKEventGenericDetailViewControllerOOPWrapperImpl *)v17 setVc:v18];
  }
  return v17;
}

- (void)viewDidLoad
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)EKEventGenericDetailViewControllerOOPWrapperImpl;
  [(EKEventGenericDetailViewControllerOOPWrapperImpl *)&v36 viewDidLoad];
  v3 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self addChildViewController:v3];

  v4 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self view];
  v5 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  v6 = [v5 view];
  [v4 addSubview:v6];

  v7 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  [v7 didMoveToParentViewController:self];

  v8 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  v9 = [v8 view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v35 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  v34 = [v35 view];
  v32 = [v34 leadingAnchor];
  v33 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self view];
  v31 = [v33 leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v37[0] = v30;
  v29 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  v28 = [v29 view];
  v26 = [v28 topAnchor];
  v27 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self view];
  v25 = [v27 topAnchor];
  v23 = [v26 constraintEqualToAnchor:v25];
  v37[1] = v23;
  v22 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  v21 = [v22 view];
  objc_super v20 = [v21 trailingAnchor];
  v10 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self view];
  v11 = [v10 trailingAnchor];
  id v12 = [v20 constraintEqualToAnchor:v11];
  v37[2] = v12;
  id v13 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  id v14 = [v13 view];
  id v15 = [v14 bottomAnchor];
  id v16 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v37[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v24 activateConstraints:v19];
}

- (CGSize)preferredContentSize
{
  double v2 = EKUIContainedControllerIdealWidth();
  double v3 = EKUIContainedControllerIdealHeight();
  double v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (UIColor)oopContentBackgroundColor
{
  double v2 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  double v3 = [v2 oopContentBackgroundColor];

  return (UIColor *)v3;
}

- (void)setOopContentBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  [v5 setOopContentBackgroundColor:v4];
}

- (void)setLeftBarButtonActions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_leftBarButtonActions, a3);
  if ([(NSArray *)self->_leftBarButtonActions count])
  {
    [MEMORY[0x1E4F1CA48] array];
    id v19 = v5;
    objc_super v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          id v12 = +[EKRemoteUIButtonAction Done];
          LODWORD(v11) = [v11 isEqual:v12];

          if (v11)
          {
            uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_leftBarButtonTapped_];
            if (v13)
            {
              id v14 = (void *)v13;
              [(NSArray *)v20 addObject:v13];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    id v5 = v19;
    id v15 = v20;
  }
  else
  {
    id v15 = 0;
  }
  leftBarButtonItems = self->_leftBarButtonItems;
  self->_leftBarButtonItems = v15;
  v17 = v15;

  v18 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self navigationItem];
  [v18 setLeftBarButtonItems:v17];
}

- (void)setRightBarButtonActions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_rightBarButtonActions, a3);
  if (![(NSArray *)self->_rightBarButtonActions count])
  {
    id v19 = 0;
    goto LABEL_17;
  }
  [MEMORY[0x1E4F1CA48] array];
  id v23 = v5;
  long long v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v12 = +[EKRemoteUIButtonAction PresentShareSheet];
      int v13 = [v11 isEqual:v12];

      if (v13)
      {
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel_rightBarButtonTapped_];
        if (v14) {
          goto LABEL_12;
        }
      }
      else
      {
        id v15 = +[EKRemoteUIButtonAction PresentEmailCompose];
        int v16 = [v11 isEqual:v15];

        if (v16)
        {
          id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
          v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope"];
          id v14 = (void *)[v17 initWithImage:v18 style:0 target:self action:sel_rightBarButtonTapped_];

          if (v14)
          {
LABEL_12:
            [(NSArray *)v24 addObject:v14];

            continue;
          }
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v8);
LABEL_15:

  id v5 = v23;
  id v19 = v24;
LABEL_17:
  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = v19;
  long long v21 = v19;

  long long v22 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self navigationItem];
  [v22 setRightBarButtonItems:v21];
}

- (void)setBottomStatusButtonActions:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStatusButtonActions, a3);

  [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self _updateBottomButtons];
}

- (id)_statusButtonsView
{
  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    id v4 = [EKUIEventStatusButtonsView alloc];
    id v5 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", self->_bottomStatusButtonActions, self, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_statusButtonsView;
    self->_statusButtonsView = v5;

    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setDisableButtonHighlights:1];
    [(EKUIEventStatusButtonsView *)self->_statusButtonsView setTextSizeMode:1];
    statusButtonsView = self->_statusButtonsView;
  }

  return statusButtonsView;
}

- (id)_statusButtonsContainerView
{
  statusButtonsContainerView = self->_statusButtonsContainerView;
  if (!statusButtonsContainerView)
  {
    id v4 = [SingleToolbarItemContainerView alloc];
    id v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    [(SingleToolbarItemContainerView *)self->_statusButtonsContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    statusButtonsContainerView = self->_statusButtonsContainerView;
  }

  return statusButtonsContainerView;
}

- (void)_updateBottomButtons
{
  v29[4] = *MEMORY[0x1E4F143B8];
  bottomStatusButtonActions = self->_bottomStatusButtonActions;
  id v4 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self _statusButtonsView];
  [v4 setActions:bottomStatusButtonActions];

  NSUInteger v5 = [(NSArray *)self->_bottomStatusButtonActions count];
  id v6 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self navigationController];
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 setToolbarHidden:0];

    uint64_t v8 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self toolbarItems];
    if (!v8
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v8, !statusButtonsContainerView))
    {
      uint64_t v10 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self _statusButtonsContainerView];
      v11 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self _statusButtonsView];
      [v10 addSubview:v11];
      long long v22 = (void *)MEMORY[0x1E4F28DC8];
      long long v27 = [v11 leadingAnchor];
      long long v26 = [v10 leadingAnchor];
      long long v25 = [v27 constraintEqualToAnchor:v26];
      v29[0] = v25;
      long long v24 = [v11 trailingAnchor];
      id v23 = [v10 trailingAnchor];
      long long v21 = [v24 constraintEqualToAnchor:v23];
      v29[1] = v21;
      id v12 = [v11 topAnchor];
      int v13 = [v10 topAnchor];
      id v14 = [v12 constraintEqualToAnchor:v13];
      v29[2] = v14;
      id v15 = [v11 bottomAnchor];
      int v16 = [v10 bottomAnchor];
      id v17 = [v15 constraintEqualToAnchor:v16];
      v29[3] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
      [v22 activateConstraints:v18];

      id v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v10];
      long long v28 = v19;
      objc_super v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self setToolbarItems:v20 animated:1];
    }
  }
  else
  {
    [v6 setToolbarHidden:1];

    [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self setToolbarItems:0 animated:1];
  }
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_leftBarButtonActions count] && [(NSArray *)self->_leftBarButtonItems count])
  {
    unint64_t v5 = [(NSArray *)self->_leftBarButtonItems indexOfObject:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v6 = v5, v5 >= [(NSArray *)self->_leftBarButtonActions count]))
    {
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEventGenericDetailViewControllerOOPWrapperImpl leftBarButtonTapped:]();
      }
    }
    else
    {
      uint64_t v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEFAULT, "EKEventGenericDetailViewControllerOOPWrapperImpl leftBarButtonTapped", v10, 2u);
      }
      uint64_t v8 = [(NSArray *)self->_leftBarButtonActions objectAtIndexedSubscript:v6];
      uint64_t v9 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
      [v9 leftBarButtonTapped:v8];
    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventGenericDetailViewControllerOOPWrapperImpl leftBarButtonTapped:]();
  }
}

- (void)rightBarButtonTapped:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_rightBarButtonActions count] && [(NSArray *)self->_rightBarButtonItems count])
  {
    unint64_t v5 = [(NSArray *)self->_rightBarButtonItems indexOfObject:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v6 = v5, v5 >= [(NSArray *)self->_rightBarButtonActions count]))
    {
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEventGenericDetailViewControllerOOPWrapperImpl rightBarButtonTapped:]();
      }
    }
    else
    {
      uint64_t v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEFAULT, "EKEventGenericDetailViewControllerOOPWrapperImpl rightBarButtonTapped", v10, 2u);
      }
      uint64_t v8 = [(NSArray *)self->_rightBarButtonActions objectAtIndexedSubscript:v6];
      uint64_t v9 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
      [v9 rightBarButtonTapped:v8];
    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventGenericDetailViewControllerOOPWrapperImpl rightBarButtonTapped:]();
  }
}

- (void)bottomStatusButtonTapped:(int64_t)a3
{
  id v4 = [(EKEventGenericDetailViewControllerOOPWrapperImpl *)self vc];
  [v4 bottomStatusButtonTapped:a3];
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
}

- (double)eventStatusButtonsViewButtonFontSize:(id)a3
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_statusButtonsViewCachedFontSize = a4;
}

- (NSArray)leftBarButtonActions
{
  return self->_leftBarButtonActions;
}

- (NSArray)leftBarButtonItems
{
  return self->_leftBarButtonItems;
}

- (void)setLeftBarButtonItems:(id)a3
{
}

- (NSArray)rightBarButtonActions
{
  return self->_rightBarButtonActions;
}

- (NSArray)rightBarButtonItems
{
  return self->_rightBarButtonItems;
}

- (void)setRightBarButtonItems:(id)a3
{
}

- (NSArray)bottomStatusButtonActions
{
  return self->_bottomStatusButtonActions;
}

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->_bottomStatusButtonActions, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_rightBarButtonActions, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonActions, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_viewID, 0);
}

- (void)leftBarButtonTapped:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3F4C000, v0, v1, "leftBarButtonTapped: _leftBarButtonActions or _leftBarButtonItems is missing", v2, v3, v4, v5, v6);
}

- (void)leftBarButtonTapped:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3F4C000, v0, v1, "leftBarButtonTapped: the buttonIndex is out of bounds", v2, v3, v4, v5, v6);
}

- (void)rightBarButtonTapped:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3F4C000, v0, v1, "rightBarButtonTapped: _rightBarButtonActions or _rightBarButtonItems is missing", v2, v3, v4, v5, v6);
}

- (void)rightBarButtonTapped:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3F4C000, v0, v1, "rightBarButtonTapped: the buttonIndex is out of bounds", v2, v3, v4, v5, v6);
}

@end