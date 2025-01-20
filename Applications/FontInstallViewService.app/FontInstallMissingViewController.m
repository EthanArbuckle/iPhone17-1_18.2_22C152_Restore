@interface FontInstallMissingViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissViewWithMissingFonts:(id)a3;
- (void)doInstall:(id)a3;
- (void)doNotInstall:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)unwindSegue:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FontInstallMissingViewController

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)FontInstallMissingViewController;
  [(FontInstallMissingViewController *)&v6 viewDidLoad];
  uint64_t v2 = objc_opt_new();
  installable = v8->installable;
  v8->installable = (NSMutableArray *)v2;

  uint64_t v4 = objc_opt_new();
  notInstallable = v8->notInstallable;
  v8->notInstallable = (NSMutableArray *)v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v55 = self;
  SEL v54 = a2;
  BOOL v53 = a3;
  v52.receiver = self;
  v52.super_class = (Class)FontInstallMissingViewController;
  [(FontInstallMissingViewController *)&v52 viewWillAppear:a3];
  v40 = v55;
  id v41 = [(FontInstallMissingViewController *)v55 tableView];
  [v41 setDataSource:v40];

  v42 = v55;
  id v43 = [(FontInstallMissingViewController *)v55 tableView];
  [v43 setDelegate:v42];

  id v44 = [(FontInstallMissingViewController *)v55 tableView];
  [v44 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:headerReuseIdentifier];

  id v45 = [(FontInstallMissingViewController *)v55 tableView];
  [v45 setEstimatedSectionHeaderHeight:100.0];

  id v46 = [(FontInstallMissingViewController *)v55 tableView];
  [v46 setSectionHeaderHeight:UITableViewAutomaticDimension];

  id v48 = [(FontInstallMissingViewController *)v55 navigationController];
  id v47 = [v48 remoteController];
  objc_storeWeak((id *)&v55->remoteController, v47);

  objc_storeStrong((id *)&v55->output, &__NSArray0__struct);
  if (![(NSMutableArray *)v55->installable count] && ![(NSMutableArray *)v55->notInstallable count])
  {
    memset(__b, 0, sizeof(__b));
    id WeakRetained = objc_loadWeakRetained((id *)&v55->remoteController);
    id obj = [WeakRetained input];

    id v39 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
    if (v39)
    {
      uint64_t v34 = *(void *)__b[2];
      uint64_t v35 = 0;
      id v36 = v39;
      while (1)
      {
        uint64_t v33 = v35;
        if (*(void *)__b[2] != v34) {
          objc_enumerationMutation(obj);
        }
        id v51 = *(id *)(__b[1] + 8 * v35);
        id location = [v51 objectForKeyedSubscript:@"providers"];
        if ([location count])
        {
          installable = v55->installable;
          id v32 = [v51 mutableCopy];
          -[NSMutableArray addObject:](installable, "addObject:");
        }
        else
        {
          [(NSMutableArray *)v55->notInstallable addObject:v51];
        }
        objc_storeStrong(&location, 0);
        ++v35;
        if (v33 + 1 >= (unint64_t)v36)
        {
          uint64_t v35 = 0;
          id v36 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
          if (!v36) {
            break;
          }
        }
      }
    }
  }
  if ([(NSMutableArray *)v55->installable count])
  {
    v8 = +[NSBundle mainBundle];
    SEL v7 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", @"DONT_INSTALL_TITLE");
    id v6 = [(FontInstallMissingViewController *)v55 navigationItem];
    id v5 = [v6 leftBarButtonItem];
    [v5 setTitle:v7];

    id v10 = [(FontInstallMissingViewController *)v55 navigationItem];
    id v9 = [v10 leftBarButtonItem];
    [v9 setEnabled:1];

    v14 = +[NSBundle mainBundle];
    v13 = [(NSBundle *)v14 localizedStringForKey:@"DO_INSTALL_TITLE" value:&stru_100014650 table:0];
    id v12 = [(FontInstallMissingViewController *)v55 navigationItem];
    id v11 = [v12 rightBarButtonItem];
    [v11 setTitle:v13];

    v18 = +[NSBundle mainBundle];
    if ([(NSMutableArray *)v55->installable count] == (id)1) {
      CFStringRef v4 = @"INSTALLABLE_DETAIL_TITLE_SINGULAR";
    }
    else {
      CFStringRef v4 = @"INSTALLABLE_DETAIL_TITLE_PLURAL";
    }
    v17 = [(NSBundle *)v18 localizedStringForKey:v4 value:&stru_100014650 table:0];
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
    id v15 = [(FontInstallMissingViewController *)v55 navigationItem];
    [v15 setTitle:v16];
  }
  else
  {
    id v20 = [(FontInstallMissingViewController *)v55 navigationItem];
    id v19 = [v20 leftBarButtonItem];
    [v19 setTitle:];

    id v22 = [(FontInstallMissingViewController *)v55 navigationItem];
    id v21 = [v22 leftBarButtonItem];
    [v21 setEnabled:0];

    v26 = +[NSBundle mainBundle];
    v25 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", @"DONE_TITLE", &stru_100014650);
    id v24 = [(FontInstallMissingViewController *)v55 navigationItem];
    id v23 = [v24 rightBarButtonItem];
    [v23 setTitle:v25];

    v30 = +[NSBundle mainBundle];
    if ([(NSMutableArray *)v55->notInstallable count] == (id)1) {
      CFStringRef v3 = @"CANT_INSTALL_DETAIL_TITLE_SINGULAR";
    }
    else {
      CFStringRef v3 = @"CANT_INSTALL_DETAIL_TITLE_PLURAL";
    }
    v29 = [(NSBundle *)v30 localizedStringForKey:v3 value:&stru_100014650 table:0];
    v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
    id v27 = [(FontInstallMissingViewController *)v55 navigationItem];
    [v27 setTitle:v28];
  }
}

- (void)dismissViewWithMissingFonts:(id)a3
{
  CFStringRef v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->output, location[0]);
  [(FontInstallMissingViewController *)v4 dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id v5 = [(FontInstallMissingViewController *)self navigationController];
  CFStringRef v3 = (FontInstallMissingViewController *)[v5 topViewController];
  BOOL v6 = v3 != v10;

  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v10->remoteController);
    [WeakRetained doneWithMissingFonts:v10->output withDismissAnimated:0];
  }
  v7.receiver = v10;
  v7.super_class = (Class)FontInstallMissingViewController;
  [(FontInstallMissingViewController *)&v7 viewDidDisappear:v8];
}

- (void)doInstall:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  id obj = v18->installable;
  id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v10);
      id v3 = v16;
      v19[0] = @"uniqueID";
      id v7 = [v15 objectForKeyedSubscript:];
      v20[0] = v7;
      v19[1] = @"installProvider";
      id v6 = [v15 objectForKeyedSubscript:@"providers"];
      id v5 = [v6 objectAtIndexedSubscript:0];
      v20[1] = v5;
      CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      [v3 addObject:];

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0;
        id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  [(FontInstallMissingViewController *)v18 dismissViewWithMissingFonts:v16];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)doNotInstall:(id)a3
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = &_os_log_default;
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    log = v7;
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "MissingFonts doNotInstall", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  [(FontInstallMissingViewController *)v9 dismissViewWithMissingFonts:&__NSArray0__struct];
  objc_storeStrong(location, 0);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = v10;
  id v8 = [location[0] destinationViewController];
  id v5 = [v9 font];
  [v8 setFont:];

  id v7 = [v9 font];
  id v6 = [v7 objectForKeyedSubscript:@"displayName"];
  [v8 setTitle:];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)unwindSegue:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(FontInstallMissingViewController *)v5 tableView];
  [v3 reloadData];

  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v5 = [(NSMutableArray *)v7->installable count] != 0;
  BOOL v4 = [(NSMutableArray *)v7->notInstallable count] != 0;
  objc_storeStrong(location, 0);
  return v5 + v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v7 = a4;
  id v6 = 0;
  if (![(NSMutableArray *)v9->installable count]) {
    int64_t v7 = a4 + 1;
  }
  if (v7)
  {
    if (v7 == 1) {
      id v6 = [(NSMutableArray *)v9->notInstallable count];
    }
  }
  else
  {
    id v6 = [(NSMutableArray *)v9->installable count];
  }
  objc_storeStrong(location, 0);
  return (int64_t)v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v19 = a4;
  v18 = &stru_100014650;
  if (![(NSMutableArray *)v21->installable count]) {
    ++v19;
  }
  if (v19)
  {
    if (v19 == 1)
    {
      v14 = +[NSBundle mainBundle];
      id v6 = [(NSBundle *)v14 localizedStringForKey:@"NOT_INSTALLABLE_HEADER" value:&stru_100014650 table:0];
      int64_t v7 = v18;
      v18 = v6;
    }
  }
  else
  {
    id v15 = +[NSBundle mainBundle];
    BOOL v4 = [(NSBundle *)v15 localizedStringForKey:@"INSTALLABLE_HEADER" value:&stru_100014650 table:0];
    BOOL v5 = v18;
    v18 = v4;
  }
  id v17 = [location[0] dequeueReusableHeaderFooterViewWithIdentifier:headerReuseIdentifier];
  id v9 = [v17 textLabel];
  [v9 setLineBreakMode:];

  id v10 = [v17 textLabel];
  [v10 setNumberOfLines:0];

  id v11 = v18;
  id v12 = [v17 textLabel];
  [v12 setText:v11];

  id v13 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(location, 0);

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  id v31 = 0;
  v30 = (char *)[v32 section];
  if (![(NSMutableArray *)v34->installable count]) {
    ++v30;
  }
  if (v30)
  {
    if (v30 == (char *)1)
    {
      id v4 = [location[0] dequeueReusableCellWithIdentifier:@"CannotInstall"];
      id v5 = v31;
      id v31 = v4;

      id v10 = -[NSMutableArray objectAtIndexedSubscript:](v34->notInstallable, "objectAtIndexedSubscript:", [v32 item]);
      id v9 = [v10 objectForKeyedSubscript:@"displayName"];
      id v8 = [v31 textLabel];
      [v8 setText:v9];
    }
  }
  else
  {
    id v29 = -[NSMutableArray objectAtIndexedSubscript:](v34->installable, "objectAtIndexedSubscript:", [v32 item]);
    id v28 = [location[0] dequeueReusableCellWithIdentifier:@"Installable"];
    [v28 setFont:v29];
    id v17 = [v29 objectForKeyedSubscript:@"displayName"];
    id v16 = [v28 fontName];
    [v16 setText:v17];

    id v27 = [v29 objectForKeyedSubscript:@"providers"];
    id v26 = [v27 objectAtIndexedSubscript:];
    id v20 = +[UIScreen mainScreen];
    [(UIScreen *)v20 scale];
    id v19 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v26);
    id v18 = [v28 providerIcon];
    [v18 setImage:v19];

    id v23 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v26 allowPlaceholder:0 error:0];
    id v22 = [v23 localizedName];
    id v21 = [v28 providerName];
    [v21 setText:v22];

    BOOL v25 = (unint64_t)[v27 count] > 1;
    [v28 setAccessoryType:v25];
    if (v25)
    {
      id v15 = +[NSBundle mainBundle];
      v14 = [(NSBundle *)v15 localizedStringForKey:@"PROVIDER_COUNT" value:&stru_100014650 table:0];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, (char *)[v27 count] - 1);
      id v12 = [v28 providerCount];
      [v12 setText:v13];
    }
    else
    {
      id v11 = [v28 providerCount];
      [v11 setText:&stru_100014650];
    }
    objc_storeStrong(&v31, v28);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  id v7 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = (char *)[v10 section];
  if (![(NSMutableArray *)v12->installable count]) {
    ++v9;
  }
  if (v9)
  {
    char v13 = 0;
  }
  else
  {
    id v8 = -[NSMutableArray objectAtIndexedSubscript:](v12->installable, "objectAtIndexedSubscript:", [v10 item]);
    id v7 = [v8 objectForKeyedSubscript:@"providers"];
    if ((unint64_t)[v7 count] >= 2)
    {
      int v6 = 0;
    }
    else
    {
      char v13 = 0;
      int v6 = 1;
    }
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    if (!v6) {
      char v13 = 1;
    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (void).cxx_destruct
{
}

@end