@interface FBAPowerLogIndexViewController
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

@implementation FBAPowerLogIndexViewController

+ (BOOL)canDisplayURL:(id)a3
{
  v3 = [a3 pathExtension];
  v4 = [v3 lowercaseString];
  unsigned __int8 v5 = [v4 isEqualToString:@"plsql"];

  return v5;
}

- (void)setPowerLogURL:(id)a3
{
  [(FBAPowerLogIndexViewController *)self setLogURL:a3];
  v4 = [(FBAPowerLogIndexViewController *)self logURL];
  unsigned __int8 v5 = [v4 lastPathComponent];
  v6 = [(FBAPowerLogIndexViewController *)self navigationItem];
  [v6 setTitle:v5];

  id v7 = objc_alloc((Class)PLDatabaseReader);
  v8 = [(FBAPowerLogIndexViewController *)self logURL];
  v9 = [v8 path];
  id v10 = [v7 initWithDatabaseFile:v9];
  [(FBAPowerLogIndexViewController *)self setDatabaseReader:v10];

  v11 = [(FBAPowerLogIndexViewController *)self databaseReader];
  uint64_t v12 = [v11 tableNamesFromDatabase];
  v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = &__NSArray0__struct;
  }
  [(FBAPowerLogIndexViewController *)self setTableNames:v14];

  id v15 = [(FBAPowerLogIndexViewController *)self tableView];
  [v15 reloadData];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBAPowerLogIndexViewController;
  [(FBAPowerLogIndexViewController *)&v4 viewWillDisappear:a3];
  if (![(FBAPowerLogIndexViewController *)self enteringDetail]) {
    [(FBAPowerLogIndexViewController *)self setDatabaseReader:0];
  }
  [(FBAPowerLogIndexViewController *)self setEnteringDetail:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)FBAPowerLogIndexViewController;
  [(FBAPowerLogIndexViewController *)&v6 viewDidLoad];
  v3 = [(FBAPowerLogIndexViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  [(FBAPowerLogIndexViewController *)self setClearsSelectionOnViewWillAppear:1];
  objc_super v4 = [(FBAPowerLogIndexViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  unsigned __int8 v5 = [(FBAPowerLogIndexViewController *)self tableView];
  [v5 setEstimatedRowHeight:80.0];

  [(FBAPowerLogIndexViewController *)self setEnteringDetail:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned __int8 v5 = [(FBAPowerLogIndexViewController *)self tableNames];
  if (v5)
  {
    objc_super v6 = [(FBAPowerLogIndexViewController *)self tableNames];
    id v7 = [v6 count];
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:v6];
  v8 = [(FBAPowerLogIndexViewController *)self tableNames];
  id v9 = [v6 row];

  id v10 = [v8 objectAtIndex:v9];

  v11 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
  uint64_t v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v4 = +[NSBundle mainBundle];
  unsigned __int8 v5 = [v4 localizedStringForKey:@"POWER_LOG_SECTION" value:&stru_1000F6658 table:0];

  return v5;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v13 = [a3 destinationViewController];
  unsigned __int8 v5 = [(FBAPowerLogIndexViewController *)self tableView];
  id v6 = [v5 indexPathForSelectedRow];

  id v7 = [(FBAPowerLogIndexViewController *)self tableNames];
  v8 = [v7 objectAtIndex:[v6 row]];

  id v9 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
  id v10 = [v13 navigationItem];
  [v10 setTitle:v9];

  v11 = [(FBAPowerLogIndexViewController *)self databaseReader];
  uint64_t v12 = [v11 stringValueOfTable:v8];
  [v13 displayText:v12];

  [(FBAPowerLogIndexViewController *)self setEnteringDetail:1];
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogURL:(id)a3
{
}

- (PLDatabaseReader)databaseReader
{
  return (PLDatabaseReader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDatabaseReader:(id)a3
{
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
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