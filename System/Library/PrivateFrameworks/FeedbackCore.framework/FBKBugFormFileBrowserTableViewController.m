@interface FBKBugFormFileBrowserTableViewController
- (CGRect)documentInteractionControllerRectForPreview:(id)a3;
- (DEDAttachmentGroup)group;
- (FBKBugFormFileBrowserTableViewController)initWithGroup:(id)a3;
- (FBKBugFormFileBrowserTableViewController)initWithUrl:(id)a3;
- (NSArray)directoryList;
- (NSURL)url;
- (id)documentInteractionControllerViewForPreview:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)documentInteractionControllerDidEndPreview:(id)a3;
- (void)setDirectoryList:(id)a3;
- (void)setGroup:(id)a3;
- (void)setUrl:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBKBugFormFileBrowserTableViewController

- (FBKBugFormFileBrowserTableViewController)initWithGroup:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKBugFormFileBrowserTableViewController;
  v5 = [(FBKBugFormFileBrowserTableViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FBKBugFormFileBrowserTableViewController *)v5 setGroup:v4];
  }

  return v6;
}

- (FBKBugFormFileBrowserTableViewController)initWithUrl:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKBugFormFileBrowserTableViewController;
  v5 = [(FBKBugFormFileBrowserTableViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FBKBugFormFileBrowserTableViewController *)v5 setUrl:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)FBKBugFormFileBrowserTableViewController;
  [(FBKBugFormFileBrowserTableViewController *)&v11 viewDidLoad];
  v3 = [(FBKBugFormFileBrowserTableViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  id v4 = [(FBKBugFormFileBrowserTableViewController *)self group];

  if (v4)
  {
    v5 = [(FBKBugFormFileBrowserTableViewController *)self group];
    v6 = [v5 displayName];
    [(FBKBugFormFileBrowserTableViewController *)self setTitle:v6];
  }
  else
  {
    v7 = [(FBKBugFormFileBrowserTableViewController *)self url];
    objc_super v8 = [v7 lastPathComponent];
    [(FBKBugFormFileBrowserTableViewController *)self setTitle:v8];

    v5 = [MEMORY[0x263F08850] defaultManager];
    v6 = [(FBKBugFormFileBrowserTableViewController *)self url];
    v9 = [v5 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:0];
    [(FBKBugFormFileBrowserTableViewController *)self setDirectoryList:v9];
  }
  v10 = [(FBKBugFormFileBrowserTableViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"DEFileCell"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(FBKBugFormFileBrowserTableViewController *)self group];

  if (v5)
  {
    v6 = [(FBKBugFormFileBrowserTableViewController *)self group];
    v7 = [v6 attachmentItems];
    int64_t v8 = [v7 count];
  }
  else
  {
    v6 = [(FBKBugFormFileBrowserTableViewController *)self directoryList];
    int64_t v8 = [v6 count];
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"DEFileCell" forIndexPath:v6];
  int64_t v8 = [(FBKBugFormFileBrowserTableViewController *)self group];

  if (v8)
  {
    v9 = [(FBKBugFormFileBrowserTableViewController *)self group];
    v10 = [v9 attachmentItems];
    uint64_t v11 = [v6 row];

    v12 = [v10 objectAtIndexedSubscript:v11];

    v13 = [v12 displayName];
    if ([v12 isLocal])
    {
      v14 = [v12 attachedPath];
      int v15 = !+[FBKFileManager isDirectory:v14];
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    v16 = [(FBKBugFormFileBrowserTableViewController *)self directoryList];
    uint64_t v17 = [v6 row];

    v12 = [v16 objectAtIndexedSubscript:v17];

    v13 = [v12 lastPathComponent];
    int v15 = !+[FBKFileManager isDirectory:v12];
  }

  v18 = [v7 textLabel];
  [v18 setText:v13];

  [v7 setAccessoryType:1];
  if (v15) {
    v19 = FBKSystemImageNamePaper;
  }
  else {
    v19 = FBKSystemImageNameFolder;
  }
  v20 = [MEMORY[0x263F827E8] systemImageNamed:*v19];
  v21 = [v7 imageView];
  [v21 setImage:v20];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBKBugFormFileBrowserTableViewController *)self group];

  if (v6)
  {
    v7 = [(FBKBugFormFileBrowserTableViewController *)self group];
    int64_t v8 = [v7 attachmentItems];
    v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

    +[FBKAttachmentViewingControllerSelector controllerForItem:v9 useRedesign:0 deleteHandler:0];
  }
  else
  {
    v10 = [(FBKBugFormFileBrowserTableViewController *)self directoryList];
    v9 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

    +[FBKAttachmentViewingControllerSelector controllerForUrl:v9 useRedesign:0 deleteHandler:0];
  uint64_t v11 = };

  if (v11)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v13 = +[FBKLog appHandle];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (isKindOfClass)
    {
      if (v14) {
        -[FBKBugFormFileBrowserTableViewController tableView:didSelectRowAtIndexPath:](v13);
      }

      int v15 = v11;
      [v15 setDelegate:self];
      [v15 setAnnotation:v5];
      [v15 presentPreviewAnimated:1];
    }
    else
    {
      if (v14) {
        -[FBKBugFormFileBrowserTableViewController tableView:didSelectRowAtIndexPath:](v13);
      }

      int v15 = [(FBKBugFormFileBrowserTableViewController *)self navigationController];
      [v15 pushViewController:v11 animated:1];
    }
  }
  else
  {
    int v15 = +[FBKLog appHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FBKBugFormFileBrowserTableViewController tableView:didSelectRowAtIndexPath:](v15);
    }
  }
}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  id v4 = a3;
  id v6 = [(FBKBugFormFileBrowserTableViewController *)self tableView];
  id v5 = [v4 annotation];

  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (CGRect)documentInteractionControllerRectForPreview:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKBugFormFileBrowserTableViewController *)self tableView];
  id v6 = [v4 annotation];

  v7 = [v5 cellForRowAtIndexPath:v6];

  int64_t v8 = [v7 imageView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)documentInteractionControllerViewForPreview:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKBugFormFileBrowserTableViewController *)self tableView];
  id v6 = [v4 annotation];

  v7 = [v5 cellForRowAtIndexPath:v6];

  int64_t v8 = [v7 imageView];

  return v8;
}

- (DEDAttachmentGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSArray)directoryList
{
  return self->_directoryList;
}

- (void)setDirectoryList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryList, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "cannot display item", v1, 2u);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "will display document on detail view controller from file browser", v1, 2u);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "will display FBK file controller from file browser", v1, 2u);
}

@end