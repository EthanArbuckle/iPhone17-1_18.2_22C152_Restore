@interface CNQuickDisambiguateAction
- (BOOL)ignoreMainAction;
- (BOOL)isEqual:(id)a3;
- (CNQuickAction)mainAction;
- (CNQuickDisambiguateAction)initWithActions:(id)a3;
- (NSOrderedSet)actions;
- (id)description;
- (id)subtitleForContext:(int64_t)a3;
- (id)titleForContext:(int64_t)a3;
- (void)performWithCompletionBlock:(id)a3;
- (void)setActions:(id)a3;
- (void)setIgnoreMainAction:(BOOL)a3;
- (void)setMainAction:(id)a3;
@end

@implementation CNQuickDisambiguateAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainAction);

  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)setIgnoreMainAction:(BOOL)a3
{
  self->_ignoreMainAction = a3;
}

- (BOOL)ignoreMainAction
{
  return self->_ignoreMainAction;
}

- (void)setMainAction:(id)a3
{
}

- (CNQuickAction)mainAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainAction);

  return (CNQuickAction *)WeakRetained;
}

- (void)setActions:(id)a3
{
}

- (NSOrderedSet)actions
{
  return self->_actions;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CNQuickDisambiguateAction;
  v4 = [(CNQuickAction *)&v8 description];
  v5 = [(CNQuickDisambiguateAction *)self actions];
  v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (void)performWithCompletionBlock:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v4 = [(CNQuickDisambiguateAction *)self mainAction];
  if ((unint64_t)[v4 score] < 0x3E9)
  {
  }
  else
  {
    BOOL v5 = [(CNQuickAction *)self isLongPress];

    if (!v5)
    {
      v6 = [(CNQuickDisambiguateAction *)self mainAction];
      [v6 performWithCompletionBlock:v28];

      goto LABEL_18;
    }
  }
  v27 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v7 = [(CNQuickDisambiguateAction *)self actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
        if (![(CNQuickDisambiguateAction *)self ignoreMainAction]
          || ([(CNQuickDisambiguateAction *)self mainAction],
              v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v12 isEqual:v13],
              v13,
              (v14 & 1) == 0))
        {
          v15 = [v12 titleForContext:4];
          v16 = [v12 subtitleForContext:4];
          v17 = (void *)MEMORY[0x1E4FB1410];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke;
          v31[3] = &unk_1E5499F98;
          v31[4] = v12;
          id v32 = v28;
          v18 = [v17 _actionWithTitle:v16 descriptiveText:v15 image:0 style:0 handler:v31 shouldDismissHandler:&__block_literal_global_369];
          [v27 addAction:v18];
          [(CNQuickDisambiguateAction *)self mainAction];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  v19 = (void *)MEMORY[0x1E4FB1410];
  v20 = CNContactsUIBundle();
  v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke_4;
  v29[3] = &unk_1E5497140;
  id v30 = v28;
  v22 = [v19 _actionWithTitle:v21 image:0 style:1 handler:&__block_literal_global_374 shouldDismissHandler:v29];
  [v27 addAction:v22];

  v23 = [v27 popoverPresentationController];
  if (v23)
  {
    v24 = [(CNQuickAction *)self sourceView];
    [v23 setSourceView:v24];

    v25 = [(CNQuickAction *)self sourceView];
    [v25 bounds];
    objc_msgSend(v23, "setSourceRect:");
  }
  v26 = [(CNQuickContactAction *)self delegate];
  [v26 contactAction:self presentViewController:v27];

LABEL_18:
}

uint64_t __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithCompletionBlock:*(void *)(a1 + 40)];
}

uint64_t __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1;
}

uint64_t __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke_2()
{
  return 1;
}

- (id)subtitleForContext:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    v4 = 0;
  }
  else
  {
    v3 = [(CNQuickDisambiguateAction *)self mainAction];
    v4 = [v3 subtitleForContext:1];
  }

  return v4;
}

- (id)titleForContext:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
    case 1:
      -[CNQuickPropertyAction titleForContext:](&v8, sel_titleForContext_, a3, v7.receiver, v7.super_class, self, CNQuickDisambiguateAction);
      goto LABEL_5;
    case 2:
    case 3:
      BOOL v5 = [(CNQuickDisambiguateAction *)self mainAction];
      v3 = [v5 titleForContext:a3];

      break;
    case 5:
      -[CNQuickAction defaultTitleForContext:](&v7, sel_defaultTitleForContext_, 5, self, CNQuickDisambiguateAction, v8.receiver, v8.super_class);
LABEL_5:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      v3 = @"•••";
      break;
    default:
      break;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)CNQuickDisambiguateAction;
    if (![(CNQuickAction *)&v12 isEqual:v6])
    {
      char v10 = 0;
LABEL_12:

      goto LABEL_13;
    }
    objc_super v7 = [(CNQuickDisambiguateAction *)self actions];
    if (v7 || ([v6 actions], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v8 = [(CNQuickDisambiguateAction *)self actions];
      uint64_t v9 = [v6 actions];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_11;
  }
  char v10 = 0;
LABEL_13:

  return v10;
}

- (CNQuickDisambiguateAction)initWithActions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNQuickDisambiguateAction;
  id v3 = a3;
  v4 = [(CNQuickPropertyAction *)&v6 initWithPropertyAction:0];
  -[CNQuickDisambiguateAction setActions:](v4, "setActions:", v3, v6.receiver, v6.super_class);

  return v4;
}

@end