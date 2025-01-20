@interface HUTemperatureUnitPickerViewController
- (HFSimpleItemManager)itemManager;
- (HUTemperatureUnitPickerViewController)initWithUnitItem:(id)a3;
- (id)_controlItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_tableRowToTemperatureUnit:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)setItemManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUTemperatureUnitPickerViewController

- (HUTemperatureUnitPickerViewController)initWithUnitItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUTemperatureUnitPickerViewController;
  v6 = [(HUTemperatureUnitPickerViewController *)&v15 initWithStyle:2];
  if (v6)
  {
    v7 = _HULocalizedStringWithDefaultValue(@"HUTemperatureUnitTitle", @"HUTemperatureUnitTitle", 1);
    [(HUTemperatureUnitPickerViewController *)v6 setTitle:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F69590]);
    v9 = (void *)[v5 copy];
    v10 = (void *)[v8 initWithDelegate:v6 sourceItem:v9];
    [(HUTemperatureUnitPickerViewController *)v6 setItemManager:v10];

    v11 = [(HUTemperatureUnitPickerViewController *)v6 itemManager];
    [v11 setUseCustomDiffableDataSource:1];

    v12 = [(HUTemperatureUnitPickerViewController *)v6 itemManager];
    id v13 = (id)[v12 reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
  return v6;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUTemperatureUnitPickerViewController;
  [(HUTemperatureUnitPickerViewController *)&v7 viewDidLoad];
  v3 = [(HUTemperatureUnitPickerViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  uint64_t v11 = [v6 row];
  int64_t v12 = [(HUTemperatureUnitPickerViewController *)self _tableRowToTemperatureUnit:v11];
  id v13 = [(HUTemperatureUnitPickerViewController *)self _controlItem];
  v14 = [v13 latestResults];
  objc_super v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  if (v12) {
    v16 = @"HUTemperatureUnitDegreesFahrenheit";
  }
  else {
    v16 = @"HUTemperatureUnitDegreesCelsius";
  }
  v17 = _HULocalizedStringWithDefaultValue(v16, v16, 1);
  v18 = [v10 textLabel];
  [v18 setText:v17];

  if (v15 && [v15 integerValue] == v12) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [v10 setAccessoryType:v19];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int64_t v5 = -[HUTemperatureUnitPickerViewController _tableRowToTemperatureUnit:](self, "_tableRowToTemperatureUnit:", objc_msgSend(a4, "row", a3));
  id v8 = [(HUTemperatureUnitPickerViewController *)self _controlItem];
  id v6 = [NSNumber numberWithInteger:v5];
  id v7 = (id)[v8 writeValue:v6];
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v5 = [(HUTemperatureUnitPickerViewController *)self tableView];
  uint64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v5 reloadSections:v4 withRowAnimation:5];
}

- (id)_controlItem
{
  v2 = [(HUTemperatureUnitPickerViewController *)self itemManager];
  v3 = [v2 sourceItem];

  return v3;
}

- (int64_t)_tableRowToTemperatureUnit:(unint64_t)a3
{
  return a3 == 1;
}

- (HFSimpleItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end