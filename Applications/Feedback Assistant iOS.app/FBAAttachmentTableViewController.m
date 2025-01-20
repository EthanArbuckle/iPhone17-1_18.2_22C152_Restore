@interface FBAAttachmentTableViewController
- (FBKDeviceDiagnosticsController)devicesController;
- (NSArray)extensions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismiss:(id)a3;
- (void)setDevicesController:(id)a3;
- (void)setExtensions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBAAttachmentTableViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)FBAAttachmentTableViewController;
  [(FBAAttachmentTableViewController *)&v19 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"ADD_FILES" value:&stru_1000F6658 table:0];
  [(FBAAttachmentTableViewController *)self setTitle:v4];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"dismiss:"];
  v6 = [(FBAAttachmentTableViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [(FBAAttachmentTableViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"extensionCell"];

  v8 = [(FBAAttachmentTableViewController *)self devicesController];

  if (v8)
  {
    [(FBAAttachmentTableViewController *)self setClearsSelectionOnViewWillAppear:1];
    *(void *)buf = 0;
    v14 = buf;
    uint64_t v15 = 0x3032000000;
    v16 = sub_100042B1C;
    v17 = sub_100042B2C;
    v18 = self;
    v9 = [(FBAAttachmentTableViewController *)v18 devicesController];
    v10 = [v9 currentDeviceBugSession];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100042B34;
    v12[3] = &unk_1000F3BE8;
    v12[4] = buf;
    [v10 listDiagnosticExtensionsWithCompletion:v12];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = +[FBALog appHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No attachment manager dismissing view", buf, 2u);
    }

    [(FBAAttachmentTableViewController *)self dismiss:self];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(FBAAttachmentTableViewController *)self extensions];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"extensionCell" forIndexPath:v6];
  v8 = [(FBAAttachmentTableViewController *)self extensions];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  v11 = [v10 name];
  if (v11)
  {
    v12 = [v10 name];
  }
  else
  {
    v12 = @"-";
  }
  v13 = [v7 textLabel];
  [v13 setText:v12];

  if (v11) {
  v14 = +[UIColor labelColor];
  }
  uint64_t v15 = [v7 textLabel];
  [v15 setTextColor:v14];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBAAttachmentTableViewController *)self extensions];
  id v7 = [v5 row];

  id v10 = [v6 objectAtIndexedSubscript:v7];

  v8 = [(FBAAttachmentTableViewController *)self devicesController];
  id v9 = [v8 currentDeviceAttachmentManager];
  [v9 gatherFilesWithDedExtension:v10 answers:&__NSDictionary0__struct];

  [(FBAAttachmentTableViewController *)self dismiss:self];
}

- (void)dismiss:(id)a3
{
  id v3 = [(FBAAttachmentTableViewController *)self parentViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (FBKDeviceDiagnosticsController)devicesController
{
  return self->_devicesController;
}

- (void)setDevicesController:(id)a3
{
}

- (NSArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_devicesController, 0);
}

@end