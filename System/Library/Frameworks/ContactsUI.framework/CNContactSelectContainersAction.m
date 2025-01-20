@interface CNContactSelectContainersAction
- (BOOL)containerPicker:(id)a3 shouldAllowDeselectionOfContainerWithIdentifier:(id)a4;
- (CNContactContainerPickerViewController)containerPicker;
- (CNUIContainerContext)containerContext;
- (void)cleanupForDismissal;
- (void)containerPicker:(id)a3 didFinishWithPickedContainers:(id)a4;
- (void)performActionWithContainerContext:(id)a3;
- (void)setContainerContext:(id)a3;
- (void)setContainerPicker:(id)a3;
@end

@implementation CNContactSelectContainersAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerContext, 0);

  objc_storeStrong((id *)&self->_containerPicker, 0);
}

- (void)setContainerContext:(id)a3
{
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (void)setContainerPicker:(id)a3
{
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (BOOL)containerPicker:(id)a3 shouldAllowDeselectionOfContainerWithIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [(CNContactSelectContainersAction *)self containerContext];
  v7 = [v6 originalContainers];
  v8 = [v7 allValues];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__CNContactSelectContainersAction_containerPicker_shouldAllowDeselectionOfContainerWithIdentifier___block_invoke;
  v12[3] = &unk_1E549BDA0;
  id v13 = v5;
  id v9 = v5;
  int v10 = objc_msgSend(v8, "_cn_any:", v12) ^ 1;

  return v10;
}

uint64_t __99__CNContactSelectContainersAction_containerPicker_shouldAllowDeselectionOfContainerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)containerPicker:(id)a3 didFinishWithPickedContainers:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(CNContactSelectContainersAction *)self containerContext];
  v7 = [v6 selectedContainers];
  v8 = (void *)[v7 copy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if (([v5 containsObject:v14] & 1) == 0)
        {
          v15 = [(CNContactSelectContainersAction *)self containerContext];
          [v15 removeContainer:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        v22 = [(CNContactSelectContainersAction *)self containerContext];
        [v22 addContainer:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }

  v23 = [(CNContactAction *)self delegate];
  v24 = [(CNContactSelectContainersAction *)self containerPicker];
  v25 = [v24 navigationController];
  [v23 action:self dismissViewController:v25 sender:self];

  [(CNContactSelectContainersAction *)self cleanupForDismissal];
  v26 = [(CNContactAction *)self delegate];
  [v26 actionDidFinish:self];
}

- (void)cleanupForDismissal
{
}

- (void)performActionWithContainerContext:(id)a3
{
  id v4 = a3;
  [(CNContactSelectContainersAction *)self setContainerContext:v4];
  id v5 = [v4 selectedContainers];

  objc_msgSend(v5, "_cn_map:", &__block_literal_global_51335);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [(CNContactSelectContainersAction *)self containerPicker];

  if (v6)
  {
    v7 = [(CNContactSelectContainersAction *)self containerPicker];
    [(CNContactContainerPickerViewController *)v7 setSelectedContainerIdentifiers:v15];
  }
  else
  {
    v8 = [CNContactContainerPickerViewController alloc];
    id v9 = [(CNContactAction *)self delegate];
    uint64_t v10 = [v9 contactViewCache];
    v7 = [(CNContactContainerPickerViewController *)v8 initWithContactViewCache:v10 selectedContainerIdentifiers:v15];

    [(CNContactContainerPickerViewController *)v7 setDelegate:self];
    [(CNContactSelectContainersAction *)self setContainerPicker:v7];
  }

  id v11 = objc_alloc(MEMORY[0x1E4FB19E8]);
  uint64_t v12 = [(CNContactSelectContainersAction *)self containerPicker];
  id v13 = (void *)[v11 initWithRootViewController:v12];

  uint64_t v14 = [(CNContactAction *)self delegate];
  [v14 action:self presentViewController:v13 sender:self];
}

uint64_t __69__CNContactSelectContainersAction_performActionWithContainerContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

@end