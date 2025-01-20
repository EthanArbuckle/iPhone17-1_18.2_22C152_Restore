@interface NPHCSDataPolicySelectionViewController
- (BOOL)_isMusicApp;
- (BOOL)_isStreamingAllowedForRow:(int64_t)a3;
- (BOOL)isCellularSetup;
- (NPHCSAppCellularDataUsageItem)appDataUsageItem;
- (NPHCSDataPolicySelectionViewController)init;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)headerForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_streamingSwitchFlipped:(id)a3;
- (void)selectItemAtIndexPath:(id)a3;
- (void)setAppDataUsageItem:(id)a3;
- (void)setCellularSetup:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NPHCSDataPolicySelectionViewController

- (NPHCSDataPolicySelectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCSDataPolicySelectionViewController;
  v2 = [(NPHCSDataPolicySelectionViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NPHCSDataPolicySelectionViewController *)v2 setCellularSetup:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCSDataPolicySelectionViewController;
  [(NPHCSDataPolicySelectionViewController *)&v5 viewDidLoad];
  v3 = [(NPHCSDataPolicySelectionViewController *)self appDataUsageItem];
  v4 = [v3 displayName];
  [(NPHCSDataPolicySelectionViewController *)self setTitle:v4];
}

- (id)headerForSection:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = [(NPHCSDataPolicySelectionViewController *)self appDataUsageItem];
    objc_super v5 = [v4 displayName];

    if ([v5 length])
    {
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      v7 = [v6 localizedStringForKey:@"ALLOW_DATA_ACCESS_FORMAT" value:&stru_1CDE0 table:0];
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);
    }
    else
    {
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      v3 = [v6 localizedStringForKey:@"ALLOW_DATA_ACCESS" value:&stru_1CDE0 table:0];
    }
  }

  return v3;
}

- (void)selectItemAtIndexPath:(id)a3
{
  id v8 = a3;
  if (![v8 section])
  {
    v4 = (char *)[v8 row];
    BOOL v5 = v4 != (unsigned char *)&dword_0 + 1 && v4 == (unsigned char *)&dword_0 + 2;
    BOOL v6 = v4 == (unsigned char *)&dword_0 + 1 || v4 == (unsigned char *)&dword_0 + 2;
    v7 = [(NPHCSDataPolicySelectionViewController *)self appDataUsageItem];
    [v7 setUsagePoliciesForCellular:v5 andWifi:v6];
  }
}

- (int64_t)numberOfSections
{
  if ([(NPHCSDataPolicySelectionViewController *)self _isMusicApp]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NPHCSDataPolicySelectionViewController *)self numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v7 = 2;
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else if ([(NPHCSDataPolicySelectionViewController *)self isCellularSetup])
  {
    int64_t v7 = 3;
  }
  else
  {
    int64_t v7 = 2;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    if ([v7 section] != (char *)&dword_0 + 1)
    {
      id v8 = 0;
      goto LABEL_34;
    }
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"StreamingDataPolicyCell"];
    if (v8) {
      goto LABEL_34;
    }
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"StreamingDataPolicyCell"];
    id v9 = objc_alloc_init((Class)UISwitch);
    [v9 addTarget:self action:"_streamingSwitchFlipped:" forEvents:4096];
    objc_msgSend(v9, "setTag:", objc_msgSend(v7, "row"));
    objc_msgSend(v9, "setOn:", -[NPHCSDataPolicySelectionViewController _isStreamingAllowedForRow:](self, "_isStreamingAllowedForRow:", objc_msgSend(v7, "row")));
    [v8 setAccessoryView:v9];
    if ([v7 row])
    {
      if ([v7 row] != (char *)&dword_0 + 1)
      {
        v21 = 0;
        goto LABEL_32;
      }
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = v10;
      CFStringRef v12 = @"HQ_STREAMING";
    }
    else
    {
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = v10;
      CFStringRef v12 = @"STREAMING";
    }
    v21 = [v10 localizedStringForKey:v12 value:&stru_1CDE0 table:0];

LABEL_32:
    v22 = [v8 textLabel];
    [v22 setText:v21];

    goto LABEL_33;
  }
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"WirelessDataPolicySubtitleCell"];
  if (!v8) {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"WirelessDataPolicySubtitleCell"];
  }
  v13 = [(NPHCSDataPolicySelectionViewController *)self appDataUsageItem];
  unsigned int v14 = [v13 isWiFiDataEnabled];

  if (v14)
  {
    v15 = [(NPHCSDataPolicySelectionViewController *)self appDataUsageItem];
    if ([v15 isCellularDataEnabled]) {
      id v16 = &dword_0 + 2;
    }
    else {
      id v16 = &dword_0 + 1;
    }
  }
  else
  {
    id v16 = 0;
  }
  if ([v7 row] == v16) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 0;
  }
  [v8 setAccessoryType:v17];
  if ([v7 row])
  {
    if ([v7 row] == (char *)&dword_0 + 1)
    {
      v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v19 = @"WIFI_ON";
    }
    else
    {
      if ([v7 row] != (char *)&dword_0 + 2)
      {
        id v9 = 0;
        goto LABEL_27;
      }
      v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v19 = @"ALL_ON";
    }
    v20 = NPHWiFiStringKey(v19);
    id v9 = [v18 localizedStringForKey:v20 value:&stru_1CDE0 table:0];
  }
  else
  {
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v18 localizedStringForKey:@"DATA_OFF" value:&stru_1CDE0 table:0];
  }

LABEL_27:
  v21 = [v8 textLabel];
  [v21 setText:v9];
LABEL_33:

LABEL_34:

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NPHCSDataPolicySelectionViewController *)self headerForSection:a4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [(NPHCSDataPolicySelectionViewController *)self selectItemAtIndexPath:a4];
  id v5 = [(NPHCSDataPolicySelectionViewController *)self tableView];
  [v5 reloadData];
}

- (BOOL)_isMusicApp
{
  v2 = [(NPHCSDataPolicySelectionViewController *)self appDataUsageItem];
  v3 = [v2 bundleID];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.NanoMusic"];

  return v4;
}

- (void)_streamingSwitchFlipped:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[NPHCSDataPolicySelectionViewController _streamingSwitchFlipped:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  if (![v3 tag])
  {
    id v5 = +[NMSGreenTeaStreamingDefaults sharedInstance];
    objc_msgSend(v5, "setGreenTeaMusicAllowCellularForStreaming:", objc_msgSend(v3, "isOn"));
    goto LABEL_7;
  }
  if ([v3 tag] == (char *)&dword_0 + 1)
  {
    id v5 = +[NMSGreenTeaStreamingDefaults sharedInstance];
    objc_msgSend(v5, "setGreenTeaMusicAllowCellularForHighQualityStreaming:", objc_msgSend(v3, "isOn"));
LABEL_7:
  }
}

- (BOOL)_isStreamingAllowedForRow:(int64_t)a3
{
  if (a3 == 1)
  {
    unsigned __int8 v4 = +[NMSGreenTeaStreamingDefaults sharedInstance];
    unsigned int v5 = [v4 greenTeaMusicAllowCellularForHighQualityStreaming];
    goto LABEL_5;
  }
  if (!a3)
  {
    unsigned __int8 v4 = +[NMSGreenTeaStreamingDefaults sharedInstance];
    unsigned int v5 = [v4 greenTeaMusicAllowCellularForStreaming];
LABEL_5:
    BOOL v6 = v5;

    goto LABEL_7;
  }
  BOOL v6 = 0;
LABEL_7:
  id v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    v10 = "-[NPHCSDataPolicySelectionViewController _isStreamingAllowedForRow:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: %ld - %d", (uint8_t *)&v9, 0x1Cu);
  }

  return v6;
}

- (NPHCSAppCellularDataUsageItem)appDataUsageItem
{
  return self->_appDataUsageItem;
}

- (void)setAppDataUsageItem:(id)a3
{
}

- (BOOL)isCellularSetup
{
  return self->_cellularSetup;
}

- (void)setCellularSetup:(BOOL)a3
{
  self->_cellularSetup = a3;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_appDataUsageItem, 0);
}

@end