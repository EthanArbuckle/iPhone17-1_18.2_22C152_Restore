@interface CKTranslationMenu
+ (id)translateActionForChatItem:(id)a3 forController:(id)a4;
+ (id)translateOrbActionForChatItem:(id)a3 forController:(id)a4;
+ (void)actionTranslateIsTappedForChatItem:(id)a3 forController:(id)a4;
@end

@implementation CKTranslationMenu

+ (id)translateActionForChatItem:(id)a3 forController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, v6);
  v7 = (void *)MEMORY[0x1E4F42AC8];
  v8 = CKFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"TRANSLATE_ORB_MENU" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CKTranslationMenu_translateActionForChatItem_forController___block_invoke;
  v13[3] = &unk_1E56232B0;
  id v10 = v5;
  id v14 = v10;
  objc_copyWeak(&v15, &location);
  v11 = [v7 actionWithTitle:v9 type:0 handler:v13];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);

  return v11;
}

void __62__CKTranslationMenu_translateActionForChatItem_forController___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[CKTranslationMenu actionTranslateIsTappedForChatItem:v4 forController:WeakRetained];

  *a3 = 1;
}

+ (id)translateOrbActionForChatItem:(id)a3 forController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, v6);
  v7 = (void *)MEMORY[0x1E4F426E8];
  v8 = CKFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"TRANSLATE_ORB_MENU" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v10 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"translate"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__CKTranslationMenu_translateOrbActionForChatItem_forController___block_invoke;
  v14[3] = &unk_1E56299E8;
  id v11 = v5;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  v12 = [v7 actionWithTitle:v9 image:v10 identifier:0 handler:v14];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);

  return v12;
}

void __65__CKTranslationMenu_translateOrbActionForChatItem_forController___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[CKTranslationMenu actionTranslateIsTappedForChatItem:v1 forController:WeakRetained];
}

+ (void)actionTranslateIsTappedForChatItem:(id)a3 forController:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 text];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (objc_class *)MEMORY[0x1E4F28B18];
      id v9 = v5;
      id v10 = [v8 alloc];
      id v11 = [v9 audioTranscriptionText];

      v12 = (void *)[v10 initWithString:v11];
      goto LABEL_8;
    }
    uint64_t v7 = [v5 transcriptText];
  }
  v12 = (void *)v7;
LABEL_8:
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FAFFF0]) initWithNibName:0 bundle:0];
  [v13 setIsSourceEditable:0];
  [v13 setText:v12];
  [v13 setModalPresentationStyle:7];
  v23[0] = *MEMORY[0x1E4F6D538];
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v13 setIgnoredAttributes:v14];

  id v15 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = [v6 collectionViewController];
    v18 = [v17 balloonViewForChatItem:v5];

    v19 = [v13 presentationController];
    [v19 setSourceView:v18];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__CKTranslationMenu_actionTranslateIsTappedForChatItem_forController___block_invoke;
  v21[3] = &unk_1E5620C40;
  id v20 = v6;
  id v22 = v20;
  [v13 setDismissCompletionHandler:v21];
  [v20 presentViewController:v13 animated:1 completion:0];

LABEL_12:
}

uint64_t __70__CKTranslationMenu_actionTranslateIsTappedForChatItem_forController___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) entryViewWasActiveOnContextMenuPresentation]) {
    [*(id *)(a1 + 32) showKeyboard];
  }
  v2 = *(void **)(a1 + 32);

  return [v2 reloadInputViews];
}

@end