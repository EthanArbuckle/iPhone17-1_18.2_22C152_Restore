@interface FBKAnnotatedFileBrowserTableViewController
- (DEDAttachmentGroup)group;
- (FBKAnnotatedFileBrowserTableViewController)initWithGroupAttachment:(id)a3;
- (FBKAnnotatedFileBrowserTableViewController)initWithUrl:(id)a3;
- (NSArray)attachments;
- (NSArray)directoryList;
- (NSURL)url;
- (id)_generateAttachments;
- (id)_generateDirectoryList;
- (id)_generateTitleForURL:(id)a3;
- (id)attachmentCellViewWithTableView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5 attachment:(id)a6;
- (id)displayNameForAttachment:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAttachments:(id)a3;
- (void)setDirectoryList:(id)a3;
- (void)setGroup:(id)a3;
- (void)setUrl:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBKAnnotatedFileBrowserTableViewController

- (FBKAnnotatedFileBrowserTableViewController)initWithGroupAttachment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKAnnotatedFileBrowserTableViewController;
  v5 = [(FBKAnnotatedFileBrowserTableViewController *)&v9 init];
  if (v5)
  {
    v6 = [v4 group];
    [(FBKAnnotatedFileBrowserTableViewController *)v5 setGroup:v6];

    v7 = [(FBKAnnotatedFileBrowserTableViewController *)v5 _generateTitleForAttachment:v4];
    [(FBKAnnotatedFileBrowserTableViewController *)v5 setTitle:v7];
  }
  return v5;
}

- (FBKAnnotatedFileBrowserTableViewController)initWithUrl:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBKAnnotatedFileBrowserTableViewController;
  v5 = [(FBKAnnotatedFileBrowserTableViewController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(FBKAnnotatedFileBrowserTableViewController *)v5 setUrl:v4];
    v7 = [(FBKAnnotatedFileBrowserTableViewController *)v6 url];
    v8 = [(FBKAnnotatedFileBrowserTableViewController *)v6 _generateTitleForURL:v7];
    [(FBKAnnotatedFileBrowserTableViewController *)v6 setTitle:v8];
  }
  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)FBKAnnotatedFileBrowserTableViewController;
  [(FBKAnnotatedFileBrowserTableViewController *)&v10 viewDidLoad];
  v3 = [(FBKAnnotatedFileBrowserTableViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  id v4 = [(FBKAnnotatedFileBrowserTableViewController *)self url];

  if (v4)
  {
    v5 = [(FBKAnnotatedFileBrowserTableViewController *)self _generateDirectoryList];
    [(FBKAnnotatedFileBrowserTableViewController *)self setDirectoryList:v5];
  }
  v6 = [(FBKAnnotatedFileBrowserTableViewController *)self _generateAttachments];
  [(FBKAnnotatedFileBrowserTableViewController *)self setAttachments:v6];

  v7 = [(FBKAnnotatedFileBrowserTableViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  objc_super v9 = +[FBKAttachmentCell reuseIdentifier];
  [v7 registerClass:v8 forCellReuseIdentifier:v9];
}

- (id)_generateDirectoryList
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(FBKAnnotatedFileBrowserTableViewController *)self url];
  v5 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:0];

  return v5;
}

- (id)_generateTitleForURL:(id)a3
{
  id v4 = FBKAttachmentFromURL((uint64_t)a3);
  v5 = [(FBKAnnotatedFileBrowserTableViewController *)self _generateTitleForAttachment:v4];

  return v5;
}

- (id)_generateAttachments
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(FBKAnnotatedFileBrowserTableViewController *)self group];

  if (v4)
  {
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    v5 = [(FBKAnnotatedFileBrowserTableViewController *)self group];
    v6 = [v5 attachmentItems];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = FBKAttachmentFromItem(*(void **)(*((void *)&v22 + 1) + 8 * i));
          [v3 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    *((void *)&v18 + 1) = 0;
    long long v19 = 0uLL;
    v6 = [(FBKAnnotatedFileBrowserTableViewController *)self directoryList];
    uint64_t v12 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v6);
          }
          v16 = FBKAttachmentFromURL(*(void *)(*((void *)&v18 + 1) + 8 * j));
          [v3 addObject:v16];
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }
  }

  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(FBKAnnotatedFileBrowserTableViewController *)self attachments];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FBKAnnotatedFileBrowserTableViewController *)self attachments];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  objc_super v10 = +[FBKAttachmentCell reuseIdentifier];
  v11 = [(FBKAnnotatedFileBrowserTableViewController *)self attachmentCellViewWithTableView:v7 indexPath:v6 reuseIdentifier:v10 attachment:v9];

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBKAnnotatedFileBrowserTableViewController *)self group];

  if (v6)
  {
    id v7 = [(FBKAnnotatedFileBrowserTableViewController *)self group];
    uint64_t v8 = [v7 attachmentItems];
    uint64_t v9 = [v5 row];

    objc_super v10 = [v8 objectAtIndexedSubscript:v9];

    +[FBKAttachmentViewingControllerSelector controllerForItem:v10 useRedesign:1 deleteHandler:0];
  }
  else
  {
    v11 = [(FBKAnnotatedFileBrowserTableViewController *)self directoryList];
    uint64_t v12 = [v5 row];

    objc_super v10 = [v11 objectAtIndexedSubscript:v12];

    +[FBKAttachmentViewingControllerSelector controllerForUrl:v10 useRedesign:1 deleteHandler:0];
  uint64_t v13 = };

  uint64_t v14 = +[FBKLog appHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[FBKAnnotatedFileBrowserTableViewController tableView:didSelectRowAtIndexPath:](v14);
  }

  v15 = [(FBKAnnotatedFileBrowserTableViewController *)self navigationController];
  [v15 pushViewController:v13 animated:1];
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

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_directoryList, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

- (id)attachmentCellViewWithTableView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5 attachment:(id)a6
{
  uint64_t v9 = sub_22A4B25F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  uint64_t v13 = sub_22A4B3458();
  uint64_t v15 = v14;
  id v16 = a3;
  id v17 = a6;
  long long v18 = self;
  id v19 = _sSo42FBKAnnotatedFileBrowserTableViewControllerC12FeedbackCoreE014attachmentCellE005tableE09indexPath15reuseIdentifier0I0So07UITableeJ0CSo0pE0C_10Foundation05IndexM0VSSSo13FBKAttachmentCtF_0(v16, (uint64_t)v12, v13, v15, (uint64_t)v17);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v19;
}

- (id)displayNameForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_annotation);
  if (v6)
  {
    id v7 = v6;
    swift_bridgeObjectRetain();
  }
  else
  {
    id v7 = objc_msgSend(v4, sel_displayName);
    sub_22A4B3458();
  }

  uint64_t v8 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "will display FBK file controller from annotated file browser", v1, 2u);
}

@end