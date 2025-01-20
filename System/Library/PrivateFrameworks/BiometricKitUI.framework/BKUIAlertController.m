@interface BKUIAlertController
- (BKUIAlertControllerListener)alertListener;
- (void)addAction:(id)a3;
- (void)bkui_addPreferredAction:(id)a3;
- (void)setAlertListener:(id)a3;
@end

@implementation BKUIAlertController

- (void)addAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 handler];
  v6 = (void *)[v5 copy];

  v7 = (void *)MEMORY[0x1E4F42720];
  v8 = [v4 title];
  uint64_t v9 = [v4 style];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__BKUIAlertController_addAction___block_invoke;
  v13[3] = &unk_1E6EA2220;
  v13[4] = self;
  id v14 = v6;
  id v10 = v6;
  v11 = [v7 actionWithTitle:v8 style:v9 handler:v13];

  v12.receiver = self;
  v12.super_class = (Class)BKUIAlertController;
  [(BKUIAlertController *)&v12 addAction:v11];
}

void __33__BKUIAlertController_addAction___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) alertListener];
  [v3 alertActionTappedFromAlert];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)bkui_addPreferredAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 handler];
  v6 = (void *)[v5 copy];

  v7 = (void *)MEMORY[0x1E4F42720];
  v8 = [v4 title];
  uint64_t v9 = [v4 style];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__BKUIAlertController_bkui_addPreferredAction___block_invoke;
  v14[3] = &unk_1E6EA2220;
  v14[4] = self;
  id v15 = v6;
  id v10 = v6;
  v11 = [v7 actionWithTitle:v8 style:v9 handler:v14];

  v13.receiver = self;
  v13.super_class = (Class)BKUIAlertController;
  [(BKUIAlertController *)&v13 addAction:v11];
  v12.receiver = self;
  v12.super_class = (Class)BKUIAlertController;
  [(BKUIAlertController *)&v12 setPreferredAction:v11];
}

void __47__BKUIAlertController_bkui_addPreferredAction___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) alertListener];
  [v3 alertActionTappedFromAlert];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (BKUIAlertControllerListener)alertListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertListener);

  return (BKUIAlertControllerListener *)WeakRetained;
}

- (void)setAlertListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end