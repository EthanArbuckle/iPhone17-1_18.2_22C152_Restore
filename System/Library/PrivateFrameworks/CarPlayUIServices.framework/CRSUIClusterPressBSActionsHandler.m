@interface CRSUIClusterPressBSActionsHandler
- (CRSUIClusterPressBSActionActionDelegate)delegate;
- (CRSUIClusterPressBSActionsHandler)initWithDelegate:(id)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation CRSUIClusterPressBSActionsHandler

- (CRSUIClusterPressBSActionsHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIClusterPressBSActionsHandler;
  v5 = [(CRSUIClusterPressBSActionsHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7 = a3;
  objc_super v8 = [v7 objectsPassingTest:&__block_literal_global_12];
  if ([v8 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __99__CRSUIClusterPressBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
    v11[3] = &unk_264307CC0;
    v11[4] = self;
    [v8 enumerateObjectsUsingBlock:v11];
  }
  v9 = (void *)[v7 mutableCopy];
  [v9 minusSet:v8];

  return v9;
}

uint64_t __99__CRSUIClusterPressBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __99__CRSUIClusterPressBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 delegate];
  uint64_t v4 = [v3 actionType];

  [v5 selectButtonPressedWithType:v4];
}

- (CRSUIClusterPressBSActionActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIClusterPressBSActionActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end