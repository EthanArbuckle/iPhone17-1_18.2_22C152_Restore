@interface CNContactQuickActionsModalDisambiguationMenuPresentation
@end

@implementation CNContactQuickActionsModalDisambiguationMenuPresentation

void __148___CNContactQuickActionsModalDisambiguationMenuPresentation_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained presentingViewController];

  if (v2)
  {
    v3 = [WeakRetained presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
LABEL_3:

    v4 = WeakRetained;
    goto LABEL_4;
  }
  uint64_t v6 = [WeakRetained navigationController];
  v4 = WeakRetained;
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [WeakRetained navigationController];
    id v9 = [v8 topViewController];

    v4 = WeakRetained;
    if (v9 == WeakRetained)
    {
      v3 = [WeakRetained navigationController];
      id v10 = (id)[v3 popViewControllerAnimated:1];
      goto LABEL_3;
    }
  }
LABEL_4:
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = WeakRetained;
  }
}

@end