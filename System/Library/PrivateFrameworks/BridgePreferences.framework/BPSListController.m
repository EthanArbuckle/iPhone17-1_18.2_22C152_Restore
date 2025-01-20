@interface BPSListController
- (BOOL)_readyToReloadSpecifiers;
- (BOOL)deferringReloadSpecifiers;
- (int64_t)tableViewStyle;
- (void)prepareSpecifiersMetadata;
- (void)reloadSpecifiers;
- (void)setDeferringReloadSpecifiers:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BPSListController

- (void)prepareSpecifiersMetadata
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)BPSListController;
  [(BPSListController *)&v16 prepareSpecifiersMetadata];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      uint64_t v8 = *MEMORY[0x263F5FEF8];
      uint64_t v9 = MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "cellType", (void)v12) != 1) {
            [v11 setProperty:v9 forKey:v8];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (int64_t)tableViewStyle
{
  v2 = [MEMORY[0x263F1CBC8] keyWindow];
  int v3 = PSShouldInsetListView();

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BPSListController;
  [(BPSListController *)&v4 viewDidLayoutSubviews];
  if ([(BPSListController *)self deferringReloadSpecifiers])
  {
    NSLog(&cfstr_Bpslistcontrol_0.isa, "-[BPSListController viewDidLayoutSubviews]");
    v3.receiver = self;
    v3.super_class = (Class)BPSListController;
    [(BPSListController *)&v3 reloadSpecifiers];
    [(BPSListController *)self setDeferringReloadSpecifiers:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BPSListController;
  [(BPSListController *)&v6 viewWillAppear:a3];
  if ([(BPSListController *)self deferringReloadSpecifiers])
  {
    dispatch_time_t v4 = dispatch_time(0, 20000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__BPSListController_viewWillAppear___block_invoke;
    block[3] = &unk_264408700;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
}

- (BOOL)deferringReloadSpecifiers
{
  return self->_deferringReloadSpecifiers;
}

- (BOOL)_readyToReloadSpecifiers
{
  if (![(BPSListController *)self isViewLoaded]) {
    return 0;
  }
  objc_super v3 = [(BPSListController *)self view];
  dispatch_time_t v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)reloadSpecifiers
{
  if ([(BPSListController *)self _readyToReloadSpecifiers])
  {
    v5.receiver = self;
    v5.super_class = (Class)BPSListController;
    [(BPSListController *)&v5 reloadSpecifiers];
  }
  else
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    dispatch_time_t v4 = NSStringFromClass(v3);
    NSLog(&cfstr_Bpslistcontrol.isa, v4);

    [(BPSListController *)self setDeferringReloadSpecifiers:1];
  }
}

uint64_t __36__BPSListController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) deferringReloadSpecifiers];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _readyToReloadSpecifiers];
    if (result)
    {
      NSLog(&cfstr_Bpslistcontrol_0.isa, "-[BPSListController viewWillAppear:]_block_invoke");
      v3.receiver = *(id *)(a1 + 32);
      v3.super_class = (Class)BPSListController;
      objc_msgSendSuper2(&v3, sel_reloadSpecifiers);
      return [*(id *)(a1 + 32) setDeferringReloadSpecifiers:0];
    }
  }
  return result;
}

- (void)setDeferringReloadSpecifiers:(BOOL)a3
{
  self->_deferringReloadSpecifiers = a3;
}

@end