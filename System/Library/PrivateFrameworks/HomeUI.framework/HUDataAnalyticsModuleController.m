@interface HUDataAnalyticsModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUDataAnalyticsModuleController)initWithModule:(id)a3;
- (HUDataAnalyticsModuleControllerDelegate)dataAnalyticsModuleControllerDelegate;
- (id)module;
- (unint64_t)didSelectItem:(id)a3;
- (void)setDataAnalyticsModuleControllerDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUDataAnalyticsModuleController

- (HUDataAnalyticsModuleController)initWithModule:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUDataAnalyticsModuleController;
  return [(HUItemModuleController *)&v4 initWithModule:a3];
}

- (id)module
{
  v4.receiver = self;
  v4.super_class = (Class)HUDataAnalyticsModuleController;
  v2 = [(HUItemModuleController *)&v4 module];

  return v2;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = [v5 latestResults];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v8 = [v14 textLabel];
  [v8 setText:v7];

  [v14 setAccessoryType:1];
  v9 = [v5 latestResults];

  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  int v11 = [v10 BOOLValue];
  if (v11)
  {
    v12 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    v12 = 0;
  }
  v13 = [v14 textLabel];
  [v13 setTextColor:v12];

  if (v11) {
}
  }

- (BOOL)canSelectItem:(id)a3
{
  v3 = [a3 latestResults];
  objc_super v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  char v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  char v5 = [(HUDataAnalyticsModuleController *)self dataAnalyticsModuleControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(HUDataAnalyticsModuleController *)self dataAnalyticsModuleControllerDelegate];
    [v7 dataAnalyticsModuleController:self didSelectItem:v4];
  }
  return 0;
}

- (HUDataAnalyticsModuleControllerDelegate)dataAnalyticsModuleControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataAnalyticsModuleControllerDelegate);

  return (HUDataAnalyticsModuleControllerDelegate *)WeakRetained;
}

- (void)setDataAnalyticsModuleControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end