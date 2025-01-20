@interface HUCharacteristicTriggerServicePickerViewController
+ (BOOL)adoptsDefaultGridLayoutMargins;
+ (BOOL)canPickServicesFromSource:(unint64_t)a3 home:(id)a4;
+ (unint64_t)sourceForTriggerBuilder:(id)a3;
- (HFCharacteristicEventBuilderItem)eventBuilder;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUCharacteristicTriggerServicePickerContentViewController)servicePickerContentViewController;
- (HUCharacteristicTriggerServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 delegate:(id)a7;
- (HUCharacteristicTriggerServicePickerViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4;
- (HUTriggerEditorDelegate)delegate;
- (id)characteristicTriggerBuilder;
- (id)filter;
- (unint64_t)mode;
- (unint64_t)source;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUCharacteristicTriggerServicePickerViewController

+ (BOOL)canPickServicesFromSource:(unint64_t)a3 home:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    char v9 = +[HUCharacteristicEventOptionProvider hasOptionsForAnyServiceInHome:v5 allowingSensors:0];
  }
  else if (a3)
  {
    char v9 = 0;
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    v7 = [v5 accessories];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke;
    v11[3] = &unk_1E63869C8;
    id v12 = v6;
    id v8 = v6;
    char v9 = objc_msgSend(v7, "na_any:", v11);
  }
  return v9;
}

uint64_t __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 services];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_2;
  v6[3] = &unk_1E6387048;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_3;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 characteristicType];
  if ([v4 containsObject:v5])
  {
    v6 = [v3 properties];
    uint64_t v7 = [v6 containsObject:*MEMORY[0x1E4F2CE40]];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)sourceForTriggerBuilder:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F2E770];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hf_sensingCharacteristicTypes");
  v6 = [v4 characteristics];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__HUCharacteristicTriggerServicePickerViewController_sourceForTriggerBuilder___block_invoke;
  v9[3] = &unk_1E6387020;
  id v10 = v5;
  id v7 = v5;
  LODWORD(v4) = objc_msgSend(v6, "na_any:", v9);

  return v4 ^ 1;
}

uint64_t __78__HUCharacteristicTriggerServicePickerViewController_sourceForTriggerBuilder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (HUCharacteristicTriggerServicePickerViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithEventBuilderItem_triggerBuilder_mode_source_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCharacteristicTriggerServicePickerViewController.m", 70, @"%s is unavailable; use %@ instead",
    "-[HUCharacteristicTriggerServicePickerViewController initWithInstructionsItem:contentViewController:]",
    v7);

  return 0;
}

- (HUCharacteristicTriggerServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 delegate:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  id v15 = a3;
  v16 = [HUCharacteristicTriggerServicePickerContentViewController alloc];
  v17 = [(HUCharacteristicTriggerServicePickerViewController *)self navigationItem];
  v18 = [(HUCharacteristicTriggerServicePickerContentViewController *)v16 initWithTriggerBuilder:v13 eventBuilderItem:v15 mode:a5 source:a6 effectiveNavigationItem:v17 delegate:v14];

  [(HUServiceGridViewController *)v18 setContentMargins:1];
  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicTriggerServicePickerViewController;
  v19 = [(HUInstructionsTableViewController *)&v22 initWithInstructionsItem:0 contentViewController:v18];
  v20 = v19;
  if (v19) {
    objc_storeStrong((id *)&v19->_triggerBuilder, a4);
  }

  return v20;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUCharacteristicTriggerServicePickerViewController;
  [(HUInstructionsTableViewController *)&v8 viewDidLoad];
  unint64_t v3 = [(HUCharacteristicTriggerServicePickerViewController *)self source];
  if (v3 == 1)
  {
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerServicePickerTitleAccessory", @"HUCharacteristicTriggerServicePickerTitleAccessory", 1);
    id v5 = @"HUCharacteristicTriggerServicePickerInstructionsDescriptionAccessory";
  }
  else
  {
    if (v3)
    {
      uint64_t v4 = 0;
      v6 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerServicePickerTitleAlarm", @"HUCharacteristicTriggerServicePickerTitleAlarm", 1);
    id v5 = @"HUCharacteristicTriggerServicePickerInstructionsDescriptionAlarm";
  }
  v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
LABEL_7:
  [(HUCharacteristicTriggerServicePickerViewController *)self setTitle:v4];
  id v7 = [(HUCharacteristicTriggerServicePickerViewController *)self navigationItem];
  [v7 setPrompt:v6];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicTriggerServicePickerViewController;
  [(HUInstructionsTableViewController *)&v14 updateCell:v10 forItem:a4 indexPath:a5 animated:v6];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13) {
    [v13 removeMargins];
  }
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 1;
}

- (HUCharacteristicTriggerServicePickerContentViewController)servicePickerContentViewController
{
  objc_opt_class();
  unint64_t v3 = [(HUInstructionsTableViewController *)self contentViewController];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return (HUCharacteristicTriggerServicePickerContentViewController *)v5;
}

- (id)characteristicTriggerBuilder
{
  v2 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 triggerBuilder];

  return v3;
}

- (unint64_t)mode
{
  v2 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 mode];

  return v3;
}

- (unint64_t)source
{
  v2 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 source];

  return v3;
}

- (HUTriggerEditorDelegate)delegate
{
  v2 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 delegate];

  return (HUTriggerEditorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  [v5 setDelegate:v4];
}

- (id)filter
{
  v2 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 filter];

  return v3;
}

- (void)setFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCharacteristicTriggerServicePickerViewController *)self servicePickerContentViewController];
  [v5 setFilter:v4];
}

- (HFCharacteristicEventBuilderItem)eventBuilder
{
  return self->_eventBuilder;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilder, 0);
}

@end