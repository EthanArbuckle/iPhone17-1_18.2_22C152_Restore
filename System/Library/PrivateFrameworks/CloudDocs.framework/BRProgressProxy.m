@interface BRProgressProxy
- (BRProgressProxy)initWithURL:(id)a3;
- (BRProgressProxyDelegate)delegate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BRProgressProxy

- (BRProgressProxy)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRProgressProxy;
  v6 = [(BRProgressProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _globalProgressSubscriber == nil%@", (uint8_t *)&v2, 0xCu);
}

- (void)start
{
  [(BRProgressProxy *)self setTotalUnitCount:-1];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v9 = _BRLocalizedStringWithFormat(@"PROGRESS_PROXY_INIT", @"Localizable", v3, v4, v5, v6, v7, v8, v13);
  [(BRProgressProxy *)self setLocalizedDescription:v9];

  [(BRProgressProxy *)self setLocalizedAdditionalDescription:0];
  [(BRProgressProxy *)self setCancellable:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __24__BRProgressProxy_start__block_invoke;
  v14[3] = &unk_1E59AE970;
  v14[4] = self;
  v10 = (void *)MEMORY[0x19F3C48D0](v14);
  v11 = [MEMORY[0x1E4F28F90] _addSubscriberForFileURL:self->_url withPublishingHandler:v10];
  id globalProgressSubscriber = self->_globalProgressSubscriber;
  self->_id globalProgressSubscriber = v11;
}

id __24__BRProgressProxy_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v4 progressProxy:*(void *)(a1 + 32) shouldProxyProgress:v3])
  {
    v11 = 0;
  }
  else
  {
    [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"localizedDescription" options:4 context:0];
    [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"localizedAdditionalDescription" options:4 context:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __24__BRProgressProxy_start__block_invoke_2;
    v13[3] = &unk_1E59AD648;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v14 = v5;
    uint64_t v15 = v6;
    uint64_t v7 = (void *)MEMORY[0x19F3C48D0](v13);
    v11 = (void *)MEMORY[0x19F3C48D0](v7, v8, v9, v10);
  }

  return v11;
}

uint64_t __24__BRProgressProxy_start__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"localizedDescription"];
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"localizedAdditionalDescription"];
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = _BRLocalizedStringWithFormat(@"PROGRESS_PROXY_FINAL", @"Localizable", v2, v3, v4, v5, v6, v7, v11);
  [*(id *)(a1 + 40) setLocalizedDescription:v8];

  [*(id *)(a1 + 40) setLocalizedAdditionalDescription:0];
  [*(id *)(a1 + 40) setTotalUnitCount:-1];
  [*(id *)(a1 + 40) setLocalizedDescription:0];
  uint64_t v9 = *(void **)(a1 + 40);

  return [v9 setLocalizedAdditionalDescription:0];
}

- (void)stop
{
  [MEMORY[0x1E4F28F90] _removeSubscriber:self->_globalProgressSubscriber];
  id globalProgressSubscriber = self->_globalProgressSubscriber;
  self->_id globalProgressSubscriber = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v11;
    id v14 = [(BRProgressProxy *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v14 progressProxy:self localizedDescriptionForProgress:v13],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v15 = [v13 localizedDescription];
    }
    v16 = (void *)v15;
    [(BRProgressProxy *)self setLocalizedDescription:v15];

    v17 = [v13 localizedAdditionalDescription];
    [(BRProgressProxy *)self setLocalizedAdditionalDescription:v17];

    -[BRProgressProxy setTotalUnitCount:](self, "setTotalUnitCount:", [v13 totalUnitCount]);
    -[BRProgressProxy setCompletedUnitCount:](self, "setCompletedUnitCount:", [v13 completedUnitCount]);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BRProgressProxy;
    [(BRProgressProxy *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BRProgressProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BRProgressProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_globalProgressSubscriber, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end