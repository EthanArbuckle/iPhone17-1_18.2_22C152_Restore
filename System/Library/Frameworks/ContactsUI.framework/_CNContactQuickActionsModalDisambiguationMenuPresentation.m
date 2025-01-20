@interface _CNContactQuickActionsModalDisambiguationMenuPresentation
- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5;
@end

@implementation _CNContactQuickActionsModalDisambiguationMenuPresentation

- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_CNContactQuickActionsModalDisambiguationMenuPresentation;
  v11 = [(CNContactQuickActionsDisambiguationMenuPresentation *)&v24 viewControllerForPresentingActionsController:v8 fromView:v9 dismissDisambiguationMenuHandler:v10];
  [v11 setModalPresentationStyle:3];
  v12 = [v11 traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 3)
  {
    v14 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
    v15 = [v11 view];
    [v15 setBackgroundColor:v14];
  }
  else
  {
    objc_initWeak(&location, v11);
    v16 = [CNUICancelBarButtonItem alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __148___CNContactQuickActionsModalDisambiguationMenuPresentation_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler___block_invoke;
    v20[3] = &unk_1E5497EC8;
    objc_copyWeak(&v22, &location);
    id v21 = v10;
    v17 = [(CNUICancelBarButtonItem *)v16 initWithDidTapHandler:v20];
    v18 = [v11 navigationItem];
    [v18 setLeftBarButtonItem:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v11;
}

@end