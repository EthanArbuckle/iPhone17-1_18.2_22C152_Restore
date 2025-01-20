@interface SWCollaborationBarButtonItem
@end

@implementation SWCollaborationBarButtonItem

void __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  v6 = [v4 systemImageNamed:@"person.crop.circle.badge.checkmark" withConfiguration:v5];

  v7 = (void *)MEMORY[0x1E4FB13F0];
  v8 = SWFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"COLLABORATION" value:&stru_1EDF19D18 table:@"SharedWithYou"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke_2;
  v15 = &unk_1E56659E8;
  id v16 = *(id *)(a1 + 32);
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v10 = [v7 actionWithTitle:v9 image:v6 identifier:0 handler:&v12];

  v18[0] = v10;
  v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  v3[2](v3, v11);

  objc_destroyWeak(&v17);
}

void __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [_SWCollaborationDetailViewController alloc];
  v5 = [*(id *)(a1 + 32) buttonView];
  v6 = [v5 itemProvider];
  v15 = [(_SWCollaborationDetailViewController *)v4 initWithItemProvider_impl:v6];

  [(_SWCollaborationDetailViewController *)v15 setModalPresentationStyle:7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [(_SWCollaborationDetailViewController *)v15 popoverPresentationController];
  [v8 setDelegate:WeakRetained];

  v9 = [v3 presentationSourceItem];
  v10 = [v3 presentationSourceItem];

  v11 = [(_SWCollaborationDetailViewController *)v15 popoverPresentationController];
  [v11 setSourceItem:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FB1EC0];
    uint64_t v13 = [v9 view];
    v14 = [v12 _viewControllerForFullScreenPresentationFromView:v13];

    [v14 presentViewController:v15 animated:1 completion:0];
  }
}

@end