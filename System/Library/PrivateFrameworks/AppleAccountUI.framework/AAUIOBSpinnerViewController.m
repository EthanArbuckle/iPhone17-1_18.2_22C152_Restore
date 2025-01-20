@interface AAUIOBSpinnerViewController
- (AAUIOBSpinnerViewController)init;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AAUIOBSpinnerViewController

- (AAUIOBSpinnerViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = @"UPDATING_APPLE_ID_LABEL";
  if (([@"UPDATING_APPLE_ID_LABEL" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v5 = 0;
  }
  else
  {
    v4 = [@"UPDATING_APPLE_ID_LABEL" stringByAppendingString:@"_REBRAND"];
    int v5 = 1;
  }
  v6 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];
  v9.receiver = self;
  v9.super_class = (Class)AAUIOBSpinnerViewController;
  v7 = [(OBSetupAssistantSpinnerController *)&v9 initWithSpinnerText:v6];

  if (v5) {
  return v7;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIOBSpinnerViewController;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:a3];
  if (self->_actionBlock)
  {
    v4 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__AAUIOBSpinnerViewController_viewDidAppear___block_invoke;
    block[3] = &unk_263F92168;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __45__AAUIOBSpinnerViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1032) + 16))();
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end