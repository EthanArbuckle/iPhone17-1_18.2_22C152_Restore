@interface CRSUIClimatePopoverBSActionsHandler
- (CRSUIClimatePopoverActionDelegate)delegate;
- (CRSUIClimatePopoverBSActionsHandler)initWithDelegate:(id)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation CRSUIClimatePopoverBSActionsHandler

- (CRSUIClimatePopoverBSActionsHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIClimatePopoverBSActionsHandler;
  v5 = [(CRSUIClimatePopoverBSActionsHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 objectsPassingTest:&__block_literal_global_14];
  if ([v10 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
      v18[3] = &unk_264307DD0;
      v18[4] = self;
      [v10 enumerateObjectsUsingBlock:v18];
    }
    else if ([v9 conformsToProtocol:&unk_26C95C470])
    {
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3;
      v16 = &unk_264307DD0;
      id v17 = v9;
      [v10 enumerateObjectsUsingBlock:&v13];
    }
  }
  v11 = objc_msgSend(v8, "mutableCopy", v13, v14, v15, v16);
  [v11 minusSet:v10];

  return v11;
}

uint64_t __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 handleTapOutsidePopoverFrames];
}

uint64_t __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTapOutsidePopoverFrames];
}

- (CRSUIClimatePopoverActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIClimatePopoverActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end