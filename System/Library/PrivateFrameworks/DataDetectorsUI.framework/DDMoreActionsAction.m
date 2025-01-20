@interface DDMoreActionsAction
- (id)alertActions;
- (id)iconName;
- (id)localizedName;
- (id)variantIconName;
- (id)viewController;
- (int)interactionType;
- (void)alertActions;
@end

@implementation DDMoreActionsAction

- (id)localizedName
{
  return DDLocalizedString(@"More…");
}

- (id)iconName
{
  return @"chevron.forward";
}

- (id)variantIconName
{
  return 0;
}

- (int)interactionType
{
  return 3;
}

- (id)alertActions
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[DDMoreActionsAction alertActions]();
  }
  return 0;
}

- (id)viewController
{
  viewController = self->super._viewController;
  if (!viewController)
  {
    v4 = +[DDDetectionController sharedController];
    v5 = [v4 titleForResult:self->super._result subResult:0 withURL:self->super._url context:self->super._context];

    v6 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v5 message:0 preferredStyle:0];
    v7 = (void *)MEMORY[0x1E4F42720];
    v8 = DDLocalizedString(@"Cancel");
    v9 = [v7 actionWithTitle:v8 style:1 handler:0];

    v10 = [(DDMoreActionsAction *)self alertActions];
    v11 = [v10 arrayByAddingObject:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __37__DDMoreActionsAction_viewController__block_invoke;
    v16[3] = &unk_1E5A85B88;
    v12 = v6;
    v17 = v12;
    [v11 enumerateObjectsUsingBlock:v16];

    v13 = self->super._viewController;
    self->super._viewController = v12;
    v14 = v12;

    viewController = self->super._viewController;
  }
  return viewController;
}

uint64_t __37__DDMoreActionsAction_viewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAction:a2];
}

- (void)alertActions
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v1, "Please override -alertActions in your DDMoreActionsAction subclass %@", v2, v3, v4, v5, 2u);
}

@end