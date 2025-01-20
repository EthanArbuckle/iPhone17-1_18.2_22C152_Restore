@interface CSEmbeddedContentActionManager
- (BOOL)_addAction:(id)a3;
- (BOOL)handleAction:(id)a3 forProvider:(id)a4;
- (BOOL)handlesActionWithClass:(Class)a3;
- (CSEmbeddedContentActionManager)initWithDelegate:(id)a3;
- (CSEmbeddedContentActionManagerDelegate)delegate;
- (NSMutableSet)activeActions;
- (id)validActionWithIdentifierIfExists:(id)a3;
- (void)_removeAction:(id)a3;
- (void)setActiveActions:(id)a3;
- (void)setContentActionProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSEmbeddedContentActionManager

- (CSEmbeddedContentActionManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSEmbeddedContentActionManager;
  v5 = [(CSEmbeddedContentActionManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    activeActions = v6->_activeActions;
    v6->_activeActions = (NSMutableSet *)v7;
  }
  return v6;
}

- (id)validActionWithIdentifierIfExists:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_activeActions;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isValid", (void)v13))
        {
          objc_super v10 = [v9 identifier];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)setContentActionProvider:(id)a3
{
  v5 = (SBFActionProviding *)a3;
  contentActionProvider = self->_contentActionProvider;
  if (contentActionProvider != v5)
  {
    uint64_t v7 = v5;
    [(SBFActionProviding *)contentActionProvider removeActionHandler:self];
    objc_storeStrong((id *)&self->_contentActionProvider, a3);
    contentActionProvider = (SBFActionProviding *)[(SBFActionProviding *)self->_contentActionProvider addActionHandler:self];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](contentActionProvider, v5);
}

- (BOOL)handlesActionWithClass:(Class)a3
{
  uint64_t v4 = objc_opt_class();

  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (BOOL)handleAction:(id)a3 forProvider:(id)a4
{
  id v5 = a3;
  if ([v5 isValid])
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v10 = v8;

    char v11 = [v10 slot];
    if ([v11 isEqualToString:*MEMORY[0x1E4FA7038]])
    {
      v12 = [v10 identifier];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4FA6D20]];

      if (v13)
      {
        BOOL v9 = [(CSEmbeddedContentActionManager *)self _addAction:v10];
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
    }
    BOOL v9 = 0;
    goto LABEL_13;
  }
  BOOL v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)_addAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __45__CSEmbeddedContentActionManager__addAction___block_invoke;
  char v11 = &unk_1E6AD87A8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  id v5 = (void *)MEMORY[0x1D9487300](&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v5, v8, v9, v10, v11);
  [(NSMutableSet *)self->_activeActions addObject:v4];
  uint64_t v6 = [(CSEmbeddedContentActionManager *)self delegate];
  [v6 actionManager:self addedAction:v4];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __45__CSEmbeddedContentActionManager__addAction___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__CSEmbeddedContentActionManager__addAction___block_invoke_2;
  v2[3] = &unk_1E6AD87A8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
}

void __45__CSEmbeddedContentActionManager__addAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAction:v2];
}

- (void)_removeAction:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(NSMutableSet *)self->_activeActions containsObject:v5])
  {
    [(NSMutableSet *)self->_activeActions removeObject:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained actionManager:self removedAction:v5];
  }
}

- (CSEmbeddedContentActionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSEmbeddedContentActionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)activeActions
{
  return self->_activeActions;
}

- (void)setActiveActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActions, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contentActionProvider, 0);
}

@end