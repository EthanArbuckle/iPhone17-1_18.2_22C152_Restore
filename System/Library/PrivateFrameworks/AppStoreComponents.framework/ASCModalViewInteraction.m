@interface ASCModalViewInteraction
- (ASCModalViewGestureRecognizer)cancelGestureRecognizer;
- (ASCModalViewInteraction)initWithView:(id)a3;
- (NSMutableArray)observers;
- (UIView)view;
- (id)cancelBlock;
- (void)cancelGestureDidChange:(id)a3;
- (void)dealloc;
- (void)installWithCancelBlock:(id)a3;
- (void)invalidate;
- (void)setCancelBlock:(id)a3;
- (void)setCancelGestureRecognizer:(id)a3;
@end

@implementation ASCModalViewInteraction

- (ASCModalViewInteraction)initWithView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCModalViewInteraction;
  v5 = [(ASCModalViewInteraction *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v6->_observers;
    v6->_observers = v7;
  }
  return v6;
}

- (void)dealloc
{
  [(ASCModalViewInteraction *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ASCModalViewInteraction;
  [(ASCModalViewInteraction *)&v3 dealloc];
}

- (void)installWithCancelBlock:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ASCModalViewInteraction *)self view];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 window];

    if (v7)
    {
      v8 = [(ASCModalViewInteraction *)self cancelGestureRecognizer];

      if (v8)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F1CA00]);
        objc_exception_throw((id)[v32 initWithName:*MEMORY[0x1E4F1C3B8] reason:@"Modal view interaction cannot be installed more than once" userInfo:0]);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v40 = self;
        _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Installing %{public}@", buf, 0xCu);
      }
      v9 = [[ASCModalViewGestureRecognizer alloc] initWithTargetView:v6 target:self action:sel_cancelGestureDidChange_];
      [(ASCModalViewInteraction *)self setCancelGestureRecognizer:v9];

      [(ASCModalViewInteraction *)self setCancelBlock:v4];
      objc_super v10 = [v6 window];
      v11 = [(ASCModalViewInteraction *)self cancelGestureRecognizer];
      [v10 addGestureRecognizer:v11];

      objc_initWeak((id *)buf, self);
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __50__ASCModalViewInteraction_installWithCancelBlock___block_invoke;
      v36 = &unk_1E645E740;
      objc_copyWeak(&v38, (id *)buf);
      id v37 = v4;
      v12 = (void *)MEMORY[0x1C8768F90](&v33);
      v13 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v33, v34, v35, v36);
      v14 = [(ASCModalViewInteraction *)self observers];
      v15 = [v13 addObserverForName:*MEMORY[0x1E4FB2738] object:0 queue:0 usingBlock:v12];
      [v14 addObject:v15];

      v16 = [(ASCModalViewInteraction *)self observers];
      v17 = [v13 addObserverForName:*MEMORY[0x1E4F28278] object:0 queue:0 usingBlock:v12];
      [v16 addObject:v17];

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[ASCModalViewInteraction installWithCancelBlock:]((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[ASCModalViewInteraction installWithCancelBlock:]((uint64_t)self, v18, v19, v20, v21, v22, v23, v24);
  }
}

uint64_t __50__ASCModalViewInteraction_installWithCancelBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Canceling %{public}@ for application entering background", (uint8_t *)&v4, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = self;
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Invalidating %{public}@", buf, 0xCu);
  }
  objc_super v3 = [(ASCModalViewInteraction *)self cancelGestureRecognizer];

  if (v3)
  {
    int v4 = [(ASCModalViewInteraction *)self cancelGestureRecognizer];
    id v5 = [v4 view];
    uint64_t v6 = [(ASCModalViewInteraction *)self cancelGestureRecognizer];
    [v5 removeGestureRecognizer:v6];
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(ASCModalViewInteraction *)self observers];
  v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v7 removeObserver:*(void *)(*((void *)&v15 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  v14 = [(ASCModalViewInteraction *)self observers];
  [v14 removeAllObjects];
}

- (void)cancelGestureDidChange:(id)a3
{
  if ([a3 state] == 3)
  {
    int v4 = [(ASCModalViewInteraction *)self cancelBlock];

    if (v4)
    {
      uint64_t v12 = [(ASCModalViewInteraction *)self cancelBlock];
      v12[2]();
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[ASCModalViewInteraction cancelGestureDidChange:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (ASCModalViewGestureRecognizer)cancelGestureRecognizer
{
  return self->_cancelGestureRecognizer;
}

- (void)setCancelGestureRecognizer:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_cancelGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_view);
}

- (void)installWithCancelBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)installWithCancelBlock:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cancelGestureDidChange:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end