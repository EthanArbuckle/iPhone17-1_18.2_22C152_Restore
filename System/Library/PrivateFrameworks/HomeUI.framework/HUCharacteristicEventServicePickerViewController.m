@interface HUCharacteristicEventServicePickerViewController
+ (BOOL)adoptsDefaultGridLayoutMargins;
+ (BOOL)canPickServicesFromSource:(unint64_t)a3 home:(id)a4;
+ (unint64_t)sourceForTriggerBuilder:(id)a3;
- (HFCharacteristicEventBuilderItem)eventBuilder;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUCharacteristicEventServicePickerContentViewController)servicePickerContentViewController;
- (HUCharacteristicEventServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 source:(unint64_t)a5;
- (HUCharacteristicEventServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 source:(unint64_t)a5 flow:(id)a6 stepIdentifier:(id)a7;
- (HUCharacteristicEventServicePickerViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4;
- (HUCharacteristicEventServicePickerViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4;
- (HUEventUIFlow)flow;
- (NSString)stepIdentifier;
- (id)characteristicTriggerBuilder;
- (id)filter;
- (unint64_t)source;
- (void)_next:(id)a3;
- (void)characteristicEventServicePickerContentViewController:(id)a3 didChangeNumberOfSelectedItems:(unint64_t)a4;
- (void)setFilter:(id)a3;
- (void)setFlow:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUCharacteristicEventServicePickerViewController

+ (BOOL)canPickServicesFromSource:(unint64_t)a3 home:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    char v9 = +[HUCharacteristicEventOptionProvider hasOptionsForAnyServiceInHome:v5];
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
    v11[2] = __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke;
    v11[3] = &unk_1E63869C8;
    id v12 = v6;
    id v8 = v6;
    char v9 = objc_msgSend(v7, "na_any:", v11);
  }
  return v9;
}

uint64_t __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 services];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_2;
  v6[3] = &unk_1E6387048;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_3;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_3(uint64_t a1, void *a2)
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
  v9[2] = __76__HUCharacteristicEventServicePickerViewController_sourceForTriggerBuilder___block_invoke;
  v9[3] = &unk_1E6387020;
  id v10 = v5;
  id v7 = v5;
  LODWORD(v4) = objc_msgSend(v6, "na_any:", v9);

  return v4 ^ 1;
}

uint64_t __76__HUCharacteristicEventServicePickerViewController_sourceForTriggerBuilder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (HUCharacteristicEventServicePickerViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithEventBuilderItem_triggerBuilder_source_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCharacteristicEventServicePickerViewController.m", 74, @"%s is unavailable; use %@ instead",
    "-[HUCharacteristicEventServicePickerViewController initWithInstructionsItem:contentViewController:]",
    v7);

  return 0;
}

- (HUCharacteristicEventServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 source:(unint64_t)a5
{
  return [(HUCharacteristicEventServicePickerViewController *)self initWithEventBuilderItem:a3 triggerBuilder:a4 source:a5 flow:0 stepIdentifier:0];
}

- (HUCharacteristicEventServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 source:(unint64_t)a5 flow:(id)a6 stepIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc((Class)objc_opt_class());
  if (v14 && v15) {
    v17 = (void *)[v16 initWithFlow:v14 stepIdentifier:v15];
  }
  else {
    v17 = (void *)[v16 initWithTriggerBuilder:v13 eventBuilderItem:v12 source:a5];
  }
  v18 = v17;
  [v17 setContentMargins:1];
  [v18 setServicePickerDelegate:self];
  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicEventServicePickerViewController;
  v19 = [(HUInstructionsTableViewController *)&v22 initWithInstructionsItem:0 contentViewController:v18];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_triggerBuilder, a4);
    [(HUCharacteristicEventServicePickerViewController *)v20 setFlow:v14];
    [(HUCharacteristicEventServicePickerViewController *)v20 setStepIdentifier:v15];
  }

  return v20;
}

- (HUCharacteristicEventServicePickerViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 viewController:self servicePickerSourceForStep:v6];
  char v9 = [v7 eventBuilderItem];
  id v10 = [v7 triggerBuilder];
  v11 = [(HUCharacteristicEventServicePickerViewController *)self initWithEventBuilderItem:v9 triggerBuilder:v10 source:v8 flow:v7 stepIdentifier:v6];

  return v11;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)HUCharacteristicEventServicePickerViewController;
  [(HUInstructionsTableViewController *)&v17 viewDidLoad];
  unint64_t v3 = [(HUCharacteristicEventServicePickerViewController *)self source];
  if (v3 == 1)
  {
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerServicePickerTitleAccessory", @"HUCharacteristicTriggerServicePickerTitleAccessory", 1);
    id v5 = @"HUCharacteristicTriggerServicePickerInstructionsDescriptionAccessory";
    goto LABEL_5;
  }
  if (!v3)
  {
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerServicePickerTitleAlarm", @"HUCharacteristicTriggerServicePickerTitleAlarm", 1);
    id v5 = @"HUCharacteristicTriggerServicePickerInstructionsDescriptionAlarm";
LABEL_5:
    id v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
    goto LABEL_7;
  }
  uint64_t v4 = 0;
  id v6 = 0;
LABEL_7:
  [(HUCharacteristicEventServicePickerViewController *)self setTitle:v4];
  id v7 = [(HUCharacteristicEventServicePickerViewController *)self navigationItem];
  [v7 setPrompt:v6];

  uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
  char v9 = [(HUCharacteristicEventServicePickerViewController *)self navigationItem];
  [v9 setBackButtonTitle:v8];

  id v10 = [(HUCharacteristicEventServicePickerViewController *)self flow];
  v11 = [(HUCharacteristicEventServicePickerViewController *)self stepIdentifier];
  int v12 = [v10 shouldShowNextButtonForStep:v11];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v14 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerServicePickerNextButton", @"HUCharacteristicTriggerServicePickerNextButton", 1);
    id v15 = (void *)[v13 initWithTitle:v14 style:2 target:self action:sel__next_];
    id v16 = [(HUCharacteristicEventServicePickerViewController *)self navigationItem];
    [v16 setRightBarButtonItem:v15];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventServicePickerViewController;
  [(HUInstructionsTableViewController *)&v14 updateCell:v10 forItem:a4 indexPath:a5 animated:v6];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (v13) {
    [v13 removeMargins];
  }
}

- (void)_next:(id)a3
{
  id v5 = [(HUCharacteristicEventServicePickerViewController *)self flow];
  uint64_t v4 = [(HUCharacteristicEventServicePickerViewController *)self stepIdentifier];
  [v5 viewController:self didFinishStepWithIdentifier:v4];
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 1;
}

- (void)characteristicEventServicePickerContentViewController:(id)a3 didChangeNumberOfSelectedItems:(unint64_t)a4
{
  BOOL v4 = a4 != 0;
  id v6 = [(HUCharacteristicEventServicePickerViewController *)self navigationItem];
  id v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (HUCharacteristicEventServicePickerContentViewController)servicePickerContentViewController
{
  objc_opt_class();
  unint64_t v3 = [(HUInstructionsTableViewController *)self contentViewController];
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return (HUCharacteristicEventServicePickerContentViewController *)v5;
}

- (id)characteristicTriggerBuilder
{
  v2 = [(HUCharacteristicEventServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 triggerBuilder];

  return v3;
}

- (unint64_t)source
{
  v2 = [(HUCharacteristicEventServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 source];

  return v3;
}

- (id)filter
{
  v2 = [(HUCharacteristicEventServicePickerViewController *)self servicePickerContentViewController];
  unint64_t v3 = [v2 filter];

  return v3;
}

- (void)setFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCharacteristicEventServicePickerViewController *)self servicePickerContentViewController];
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

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilder, 0);
}

@end