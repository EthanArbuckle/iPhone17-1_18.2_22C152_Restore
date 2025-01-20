@interface BPSMultipleWatchMigrationView
- (BPSMultipleWatchMigrationPickerTableView)devicesTable;
- (BPSMultipleWatchMigrationView)initWithFrame:(CGRect)a3 andStyle:(unint64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)migratableDevices;
- (NSMutableDictionary)selectedStates;
- (double)tableHeight;
- (id)selectedMigrationDevices;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)style;
- (void)layoutSubviews;
- (void)setDevicesTable:(id)a3;
- (void)setMigratableDevices:(id)a3;
- (void)setSelectedStates:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation BPSMultipleWatchMigrationView

- (BPSMultipleWatchMigrationView)initWithFrame:(CGRect)a3 andStyle:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BPSMultipleWatchMigrationView;
  v5 = -[BPSMultipleWatchMigrationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = [BPSMultipleWatchMigrationPickerTableView alloc];
    uint64_t v8 = -[BPSMultipleWatchMigrationPickerTableView initWithFrame:style:](v7, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    devicesTable = v6->_devicesTable;
    v6->_devicesTable = (BPSMultipleWatchMigrationPickerTableView *)v8;

    [(BPSMultipleWatchMigrationPickerTableView *)v6->_devicesTable setAlwaysBounceVertical:0];
    [(BPSMultipleWatchMigrationPickerTableView *)v6->_devicesTable registerClass:objc_opt_class() forCellReuseIdentifier:@"COSMultipleWatchViewCellID"];
    [(BPSMultipleWatchMigrationPickerTableView *)v6->_devicesTable setAutoresizingMask:18];
    [(BPSMultipleWatchMigrationPickerTableView *)v6->_devicesTable setDelegate:v6];
    [(BPSMultipleWatchMigrationPickerTableView *)v6->_devicesTable setDataSource:v6];
    [(BPSMultipleWatchMigrationView *)v6 addSubview:v6->_devicesTable];
  }
  return v6;
}

- (void)layoutSubviews
{
  [(BPSMultipleWatchMigrationView *)self bounds];
  devicesTable = self->_devicesTable;
  -[BPSMultipleWatchMigrationPickerTableView setFrame:](devicesTable, "setFrame:");
}

- (void)setMigratableDevices:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_migratableDevices, a3);
  uint64_t v5 = [(NSArray *)self->_migratableDevices count];
  v6 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v5];
  selectedStates = self->_selectedStates;
  self->_selectedStates = v6;

  if (v5 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x263EFFA88];
    do
    {
      v10 = self->_selectedStates;
      objc_super v11 = [NSNumber numberWithInteger:v8];
      [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];

      ++v8;
    }
    while (v5 != v8);
  }
  [(BPSMultipleWatchMigrationPickerTableView *)self->_devicesTable reloadData];
}

- (double)tableHeight
{
  return 80.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3.width, a3.height);
  uint64_t v5 = [v4 keyWindow];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  CGFloat Width = CGRectGetWidth(v22);
  v15 = [MEMORY[0x263F57730] sharedInstance];
  double v16 = (double)[v15 maxPairedDeviceCount];
  [(BPSMultipleWatchMigrationView *)self tableHeight];
  double v18 = v17 * v16;

  double v19 = Width;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  selectedStates = self->_selectedStates;
  CGFloat v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "row"));
  double v10 = [(NSMutableDictionary *)selectedStates objectForKeyedSubscript:v9];
  int v11 = [v10 BOOLValue];

  double v12 = self->_selectedStates;
  CGFloat v13 = [NSNumber numberWithInt:v11 ^ 1u];
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "row"));
  [(NSMutableDictionary *)v12 setObject:v13 forKey:v14];

  v16[0] = v6;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

  [v7 reloadRowsAtIndexPaths:v15 withRowAnimation:5];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_migratableDevices count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"COSMultipleWatchViewCellID" forIndexPath:v6];
  double v8 = v6;
  CGFloat v9 = -[NSArray objectAtIndex:](self->_migratableDevices, "objectAtIndex:", [v6 row]);
  uint64_t v10 = [v9 valueForProperty:*MEMORY[0x263F57540]];
  uint64_t v11 = [v9 valueForProperty:*MEMORY[0x263F57610]];
  double v12 = [v7 textLabel];
  v31 = (void *)v11;
  [v12 setText:v11];

  CGFloat v13 = [v9 valueForProperty:*MEMORY[0x263F57628]];
  v29 = [v9 valueForProperty:*MEMORY[0x263F57568]];
  v14 = BPSLocalizedShortEdition([MEMORY[0x263F5B978] materialFromDevice:v9], objc_msgSend(v29, "integerValue"), v13);
  v30 = v13;
  BPSShortLocalizedVariantSizeForProductType(v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v16 = v15;
  if ([v14 length])
  {
    double v17 = NSString;
    double v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
    [v18 localizedStringForKey:@"BIXBY_SIZE_EDITION_FORMATTER_%@_%@" value:&stru_26CCB36C8 table:@"Localizable"];
    v20 = double v19 = self;
    double v16 = objc_msgSend(v17, "stringWithFormat:", v20, v14, v15);

    self = v19;
  }
  v21 = [v7 deviceDetailLabel];
  [v21 setText:v16];

  CGRect v22 = [v7 watchView];
  [v22 setAdvertisingName:v10];

  v23 = [v7 checkmarkView];
  selectedStates = self->_selectedStates;
  v25 = (void *)v10;
  v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "row"));
  v27 = [(NSMutableDictionary *)selectedStates objectForKeyedSubscript:v26];
  objc_msgSend(v23, "setIsChecked:", objc_msgSend(v27, "BOOLValue"));

  return v7;
}

- (id)selectedMigrationDevices
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(NSMutableDictionary *)self->_selectedStates allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_selectedStates objectForKeyedSubscript:v9];
        int v11 = [v10 BOOLValue];

        if (v11)
        {
          double v12 = -[NSArray objectAtIndexedSubscript:](self->_migratableDevices, "objectAtIndexedSubscript:", [v9 integerValue]);
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)migratableDevices
{
  return self->_migratableDevices;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BPSMultipleWatchMigrationPickerTableView)devicesTable
{
  return self->_devicesTable;
}

- (void)setDevicesTable:(id)a3
{
}

- (NSMutableDictionary)selectedStates
{
  return self->_selectedStates;
}

- (void)setSelectedStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedStates, 0);
  objc_storeStrong((id *)&self->_devicesTable, 0);
  objc_storeStrong((id *)&self->_migratableDevices, 0);
}

@end