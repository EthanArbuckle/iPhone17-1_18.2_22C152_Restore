@interface FBKPowerLogIndexViewController
+ (BOOL)canDisplayURL:(id)a3;
- (BOOL)enteringDetail;
- (NSArray)tableNames;
- (NSURL)logURL;
- (PLDatabaseReader)databaseReader;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setDatabaseReader:(id)a3;
- (void)setEnteringDetail:(BOOL)a3;
- (void)setLogURL:(id)a3;
- (void)setPowerLogURL:(id)a3;
- (void)setTableNames:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FBKPowerLogIndexViewController

+ (BOOL)canDisplayURL:(id)a3
{
  v3 = [a3 pathExtension];
  v4 = [v3 lowercaseString];
  char v5 = [v4 isEqualToString:@"plsql"];

  return v5;
}

- (void)setPowerLogURL:(id)a3
{
  [(FBKPowerLogIndexViewController *)self setLogURL:a3];
  v4 = [(FBKPowerLogIndexViewController *)self logURL];
  char v5 = [v4 lastPathComponent];
  v6 = [(FBKPowerLogIndexViewController *)self navigationItem];
  [v6 setTitle:v5];

  id v7 = objc_alloc((Class)getPLDatabaseReaderClass());
  v8 = [(FBKPowerLogIndexViewController *)self logURL];
  v9 = [v8 path];
  v10 = (void *)[v7 initWithDatabaseFile:v9];
  [(FBKPowerLogIndexViewController *)self setDatabaseReader:v10];

  v11 = [(FBKPowerLogIndexViewController *)self databaseReader];
  uint64_t v12 = [v11 tableNamesFromDatabase];
  v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = MEMORY[0x263EFFA68];
  }
  [(FBKPowerLogIndexViewController *)self setTableNames:v14];

  id v15 = [(FBKPowerLogIndexViewController *)self tableView];
  [v15 reloadData];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBKPowerLogIndexViewController;
  [(FBKPowerLogIndexViewController *)&v4 viewWillDisappear:a3];
  if (![(FBKPowerLogIndexViewController *)self enteringDetail]) {
    [(FBKPowerLogIndexViewController *)self setDatabaseReader:0];
  }
  [(FBKPowerLogIndexViewController *)self setEnteringDetail:0];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)FBKPowerLogIndexViewController;
  [(FBKPowerLogIndexViewController *)&v7 viewDidLoad];
  v3 = [(FBKPowerLogIndexViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  [(FBKPowerLogIndexViewController *)self setClearsSelectionOnViewWillAppear:1];
  double v4 = *MEMORY[0x263F839B8];
  char v5 = [(FBKPowerLogIndexViewController *)self tableView];
  [v5 setRowHeight:v4];

  v6 = [(FBKPowerLogIndexViewController *)self tableView];
  [v6 setEstimatedRowHeight:80.0];

  [(FBKPowerLogIndexViewController *)self setEnteringDetail:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char v5 = [(FBKPowerLogIndexViewController *)self tableNames];
  if (v5)
  {
    v6 = [(FBKPowerLogIndexViewController *)self tableNames];
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:v6];
  v8 = [(FBKPowerLogIndexViewController *)self tableNames];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  v11 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
  uint64_t v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"POWER_LOG_SECTION" value:&stru_26DDF6A30 table:0];

  return v5;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v13 = [a3 destinationViewController];
  char v5 = [(FBKPowerLogIndexViewController *)self tableView];
  id v6 = [v5 indexPathForSelectedRow];

  int64_t v7 = [(FBKPowerLogIndexViewController *)self tableNames];
  v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row"));

  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
  v10 = [v13 navigationItem];
  [v10 setTitle:v9];

  v11 = [(FBKPowerLogIndexViewController *)self databaseReader];
  uint64_t v12 = [v11 stringValueOfTable:v8];
  [v13 displayText:v12];

  [(FBKPowerLogIndexViewController *)self setEnteringDetail:1];
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setLogURL:(id)a3
{
}

- (PLDatabaseReader)databaseReader
{
  return (PLDatabaseReader *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setDatabaseReader:(id)a3
{
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setTableNames:(id)a3
{
}

- (BOOL)enteringDetail
{
  return self->_enteringDetail;
}

- (void)setEnteringDetail:(BOOL)a3
{
  self->_enteringDetail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_databaseReader, 0);

  objc_storeStrong((id *)&self->_logURL, 0);
}

@end