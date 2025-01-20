@interface FBASqliteIndexViewController
+ (BOOL)canDisplayExtension:(id)a3 strict:(BOOL)a4;
+ (BOOL)canDisplayURL:(id)a3;
+ (id)dbUrlForMetadataUrl:(id)a3;
+ (id)removeWalShm:(id)a3;
- (CGRect)documentInteractionControllerRectForPreview:(id)a3;
- (FBASqliteReader)reader;
- (NSArray)tableNames;
- (NSURL)dbUrl;
- (id)documentInteractionControllerViewForPreview:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didReceiveMemoryWarning;
- (void)documentInteractionControllerDidEndPreview:(id)a3;
- (void)setDbUrl:(id)a3;
- (void)setReader:(id)a3;
- (void)setTableNames:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBASqliteIndexViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)FBASqliteIndexViewController;
  [(FBASqliteIndexViewController *)&v5 viewDidLoad];
  v3 = [(FBASqliteIndexViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  [(FBASqliteIndexViewController *)self setClearsSelectionOnViewWillAppear:1];
  [(FBASqliteIndexViewController *)self setTableNames:&__NSArray0__struct];
  v4 = [(FBASqliteIndexViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"FBATableNameCell"];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FBASqliteIndexViewController;
  [(FBASqliteIndexViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FBASqliteIndexViewController;
  [(FBASqliteIndexViewController *)&v12 viewWillAppear:a3];
  v4 = [(FBASqliteIndexViewController *)self dbUrl];
  objc_super v5 = [v4 lastPathComponent];
  v6 = [(FBASqliteIndexViewController *)self navigationItem];
  [v6 setTitle:v5];

  v7 = [FBASqliteReader alloc];
  v8 = [(FBASqliteIndexViewController *)self dbUrl];
  v9 = [(FBASqliteReader *)v7 initWithFile:v8];
  [(FBASqliteIndexViewController *)self setReader:v9];

  v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045110;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_async(v10, block);
}

+ (BOOL)canDisplayURL:(id)a3
{
  v4 = [a3 pathExtension];
  objc_super v5 = [v4 lowercaseString];

  LOBYTE(a1) = [a1 canDisplayExtension:v5 strict:0];
  return (char)a1;
}

+ (id)dbUrlForMetadataUrl:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 pathExtension];
  v6 = [v5 lowercaseString];

  if ([a1 canDisplayExtension:v6 strict:1])
  {
    id v7 = v4;
  }
  else
  {
    uint64_t v8 = [v4 URLByDeletingPathExtension];
    if (v8)
    {
      id v9 = (id)v8;
      v10 = [a1 removeWalShm:v6];
      if (v10)
      {
        v11 = [v9 URLByAppendingPathExtension:v10];

        objc_super v12 = +[NSFileManager defaultManager];
        v13 = [v11 path];
        unsigned int v14 = [v12 fileExistsAtPath:v13 isDirectory:0];

        if (v14)
        {
          id v9 = v11;
          id v7 = v9;
        }
        else
        {
          id v7 = 0;
          id v9 = v11;
        }
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)canDisplayExtension:(id)a3 strict:(BOOL)a4
{
  if (a4)
  {
    return [&off_1000FAAE8 containsObject:a3];
  }
  else
  {
    id v6 = a1;
    id v7 = [a1 removeWalShm:a3];
    LOBYTE(v6) = [v6 canDisplayExtension:v7 strict:1];

    return (char)v6;
  }
}

+ (id)removeWalShm:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"-wal" withString:&stru_1000F6658];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"-shm" withString:&stru_1000F6658];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBASqliteIndexViewController *)self tableNames];
  [v6 objectAtIndexedSubscript:[v5 row]];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(FBASqliteIndexViewController *)self reader];
  uint64_t v8 = [v7 csvRepresentationForTable:v11];

  id v9 = +[FBABugFormAttachmentPreview textFileForString:v8 withFileName:v11];
  v10 = +[UIDocumentInteractionController interactionControllerWithURL:v9];
  [v10 setDelegate:self];
  [v10 setAnnotation:v5];

  [v10 presentPreviewAnimated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(FBASqliteIndexViewController *)self tableNames];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"FBATableNameCell" forIndexPath:v6];
  uint64_t v8 = [(FBASqliteIndexViewController *)self tableNames];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];
  id v11 = [v7 textLabel];
  [v11 setText:v10];

  return v7;
}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  id v4 = a3;
  id v6 = [(FBASqliteIndexViewController *)self tableView];
  id v5 = [v4 annotation];

  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (CGRect)documentInteractionControllerRectForPreview:(id)a3
{
  id v4 = a3;
  id v5 = [(FBASqliteIndexViewController *)self tableView];
  id v6 = [v4 annotation];

  id v7 = [v5 cellForRowAtIndexPath:v6];

  uint64_t v8 = [v7 imageView];
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
  id v5 = [(FBASqliteIndexViewController *)self tableView];
  id v6 = [v4 annotation];

  id v7 = [v5 cellForRowAtIndexPath:v6];

  uint64_t v8 = [v7 imageView];

  return v8;
}

- (NSURL)dbUrl
{
  return self->_dbUrl;
}

- (void)setDbUrl:(id)a3
{
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTableNames:(id)a3
{
}

- (FBASqliteReader)reader
{
  return (FBASqliteReader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_tableNames, 0);

  objc_storeStrong((id *)&self->_dbUrl, 0);
}

@end