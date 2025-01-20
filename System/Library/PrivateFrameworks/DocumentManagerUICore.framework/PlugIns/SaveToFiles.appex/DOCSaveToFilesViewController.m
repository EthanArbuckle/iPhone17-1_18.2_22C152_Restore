@interface DOCSaveToFilesViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtPath:(id)a5;
- (DOCConfiguration)configuration;
- (NSArray)keyCommands;
- (_TtC11SaveToFiles24DOCNamedLocationResolver)namedLocationResolver;
- (_TtC11SaveToFiles25DOCDefaultSourceUIManager)defaultSourceUIManager;
- (_TtC11SaveToFiles31DOCDocumentPickerViewController)documentPickerViewController;
- (id)loadItemProvider:(id)a3 error:(id *)a4;
- (void)__completeRequestWithError:(id)a3 completion:(id)a4;
- (void)_cleanTemporaryDirectory;
- (void)_completeRequestWithError:(id)a3;
- (void)_completeRequestWithError:(id)a3 completion:(id)a4;
- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4;
- (void)documentPickerDidCancel:(id)a3;
- (void)loadAttachments;
- (void)loadDataWithTypes:(id)a3 fromItemProvider:(id)a4 completionHandler:(id)a5;
- (void)loadFileURLFromItemProvider:(id)a3 completionHandler:(id)a4;
- (void)performDeselectAll:(id)a3;
- (void)performGoToDesktop:(id)a3;
- (void)performGoToDocuments:(id)a3;
- (void)performGoToDownloads:(id)a3;
- (void)performGoToEnclosingFolder:(id)a3;
- (void)performGoToICloudDrive:(id)a3;
- (void)performGoToRecents:(id)a3;
- (void)performGoToShared:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentDocumentPickerForURLs:(id)a3;
- (void)selectAll:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDefaultSourceUIManager:(id)a3;
- (void)setDocumentPickerViewController:(id)a3;
- (void)setNamedLocationResolver:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCSaveToFilesViewController

- (void)viewDidLoad
{
  setiopolicy_np(3, 0, 1);
  v5.receiver = self;
  v5.super_class = (Class)DOCSaveToFilesViewController;
  [(DOCSaveToFilesViewController *)&v5 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(DOCSaveToFilesViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(DOCSaveToFilesViewController *)self loadAttachments];
  self->_didLoadAttachments = 1;
}

- (void)loadAttachments
{
  if (!self->_urlsToRemoveOnCompletion)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    urlsToRemoveOnCompletion = self->_urlsToRemoveOnCompletion;
    self->_urlsToRemoveOnCompletion = v3;
  }
  objc_super v5 = [(DOCSaveToFilesViewController *)self extensionContext];
  v6 = [v5 inputItems];
  v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [v7 attachments];
    v9 = [v8 firstObject];

    if (v9)
    {
      v37 = v9;
      v10 = [v7 attachments];
      v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);

      v12 = [v7 attachments];
      v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v39 = v7;
      v14 = [v7 attachments];
      id v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v49;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v49 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            id v47 = 0;
            v20 = [(DOCSaveToFilesViewController *)self loadItemProvider:v19 error:&v47];
            id v21 = v47;
            if (v20) {
              [v11 addObject:v20];
            }
            if (v21) {
              [v13 addObject:v21];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v16);
      }
      v38 = self;

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v22 = v11;
      id obj = [v11 copy];
      id v23 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v44;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v44 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
            v28 = [v27 lastPathComponent];

            if (v28)
            {
              v29 = v13;
              id v41 = 0;
              id v42 = 0;
              unsigned __int8 v30 = [v27 getPromisedItemResourceValue:&v42 forKey:NSURLNameKey error:&v41];
              id v31 = v42;
              id v32 = v41;
              v33 = v32;
              if ((v30 & 1) == 0)
              {
                NSLog(@"Given a URL that is not pointing to an existing file: %@. Error: %@", v27, v32);
                [v22 removeObject:v27];
              }

              v13 = v29;
            }
            else
            {
              NSLog(@"Given invalid URL: %@", v27);
              [v22 removeObject:v27];
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v24);
      }

      if ([v22 count])
      {
        [(DOCSaveToFilesViewController *)v38 presentDocumentPickerForURLs:v22];
      }
      else
      {
        if ([v13 count])
        {
          [v13 firstObject];
        }
        else
        {
          NSLog(@"No valid URLs to present the picker for");
          +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        v36 = };
        [(DOCSaveToFilesViewController *)v38 _completeRequestWithError:v36];
      }
      v7 = v39;

      v9 = v37;
    }
    else
    {
      NSLog(@"no attachment found");
      v35 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      [(DOCSaveToFilesViewController *)self _completeRequestWithError:v35];
    }
  }
  else
  {
    NSLog(@"no input item found");
    v34 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    [(DOCSaveToFilesViewController *)self _completeRequestWithError:v34];
  }
}

- (id)loadItemProvider:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10001A80C;
  v28 = sub_10001A81C;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10001A80C;
  v22 = sub_10001A81C;
  id v23 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A824;
  v12[3] = &unk_1005B8018;
  id v16 = &v24;
  v7 = dispatch_semaphore_create(0);
  v13 = v7;
  id v8 = v6;
  id v14 = v8;
  id v15 = self;
  uint64_t v17 = &v18;
  [(DOCSaveToFilesViewController *)self loadFileURLFromItemProvider:v8 completionHandler:v12];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v9 = (void *)v19[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (void)loadDataWithTypes:(id)a3 fromItemProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_10001A80C;
    uint64_t v24 = sub_10001A81C;
    id v25 = [v8 firstObject];
    uint64_t v11 = v21[5];
    uint64_t v26 = NSItemProviderOptionsDispatchModeKey;
    uint64_t v27 = NSItemProviderOptionsDispatchModeAsynchronous;
    v12 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001AD6C;
    v14[3] = &unk_1005B8040;
    id v18 = v10;
    uint64_t v19 = &v20;
    id v15 = v9;
    id v16 = self;
    id v17 = v8;
    [v15 loadItemForTypeIdentifier:v11 options:v12 completionHandler:v14];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)loadFileURLFromItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [UTTypeFileURL identifier];
  uint64_t v12 = NSItemProviderOptionsDispatchModeKey;
  uint64_t v13 = NSItemProviderOptionsDispatchModeAsynchronous;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B3D4;
  v10[3] = &unk_1005B7CD8;
  id v11 = v5;
  id v9 = v5;
  [v6 loadItemForTypeIdentifier:v7 options:v8 completionHandler:v10];
}

- (void)presentDocumentPickerForURLs:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B564;
  v4[3] = &unk_1005B7800;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DOCSaveToFilesViewController;
  id v4 = a3;
  [(DOCSaveToFilesViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[DOCSaveToFilesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)_completeRequestWithError:(id)a3
{
}

- (void)_completeRequestWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_didLoadAttachments)
  {
    [(DOCSaveToFilesViewController *)self __completeRequestWithError:v6 completion:v7];
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BE88;
    block[3] = &unk_1005B8068;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)__completeRequestWithError:(id)a3 completion:(id)a4
{
  CFStringRef v6 = (const __CFString *)a3;
  id v21 = a4;
  uint64_t v22 = (__CFString *)v6;
  CFStringRef v7 = @"with error: ";
  CFStringRef v8 = &stru_1005E06D0;
  if (v6) {
    CFStringRef v8 = v6;
  }
  else {
    CFStringRef v7 = &stru_1005E06D0;
  }
  NSLog(@"completing request%@%@", v7, v8);
  [(DOCSaveToFilesViewController *)self _cleanTemporaryDirectory];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_super v9 = self->_urlsToRemoveOnCompletion;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v15 = +[NSFileManager defaultManager];
        id v25 = 0;
        unsigned __int8 v16 = [v15 removeItemAtURL:v14 error:&v25];
        id v17 = v25;

        if ((v16 & 1) == 0) {
          NSLog(@"Failed to remove %@. Error: %@", v14, v17);
        }
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  id v18 = [(DOCSaveToFilesViewController *)self extensionContext];
  uint64_t v19 = v18;
  if (v22)
  {
    [v18 cancelRequestWithError:v22];
    uint64_t v20 = v21;
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001C0DC;
    v23[3] = &unk_1005B8090;
    uint64_t v20 = v21;
    id v24 = v21;
    [v19 completeRequestReturningItems:0 completionHandler:v23];

    uint64_t v19 = v24;
  }
}

- (void)_cleanTemporaryDirectory
{
  id v3 = objc_alloc_init((Class)NSFileManager);
  [v3 setDelegate:self];
  id v4 = NSTemporaryDirectory();
  double v5 = [v3 enumeratorAtPath:v4];

  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    CFStringRef v8 = (void *)v7;
    do
    {
      objc_super v9 = +[NSFileManager defaultManager];
      id v13 = 0;
      unsigned __int8 v10 = [v9 removeItemAtPath:v8 error:&v13];
      id v11 = v13;

      if ((v10 & 1) == 0) {
        NSLog(@"Unable to clean up %@. Error: %@", v8, v11);
      }
      [v5 skipDescendants];

      uint64_t v12 = [v5 nextObject];

      CFStringRef v8 = (void *)v12;
    }
    while (v12);
  }
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtPath:(id)a5
{
  return 1;
}

- (void)documentPickerDidCancel:(id)a3
{
  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  [(DOCSaveToFilesViewController *)self _completeRequestWithError:v4 completion:0];
}

- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4
{
}

- (_TtC11SaveToFiles31DOCDocumentPickerViewController)documentPickerViewController
{
  return (_TtC11SaveToFiles31DOCDocumentPickerViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDocumentPickerViewController:(id)a3
{
}

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (_TtC11SaveToFiles25DOCDefaultSourceUIManager)defaultSourceUIManager
{
  return (_TtC11SaveToFiles25DOCDefaultSourceUIManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDefaultSourceUIManager:(id)a3
{
}

- (_TtC11SaveToFiles24DOCNamedLocationResolver)namedLocationResolver
{
  return (_TtC11SaveToFiles24DOCNamedLocationResolver *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNamedLocationResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedLocationResolver, 0);
  objc_storeStrong((id *)&self->_defaultSourceUIManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_documentPickerViewController, 0);
  objc_storeStrong((id *)&self->_urlsToRemoveOnCompletion, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    CFStringRef v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  BOOL v8 = DOCSaveToFilesViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_10003D810((uint64_t)v10, &qword_10062D740);
  return v8;
}

- (NSArray)keyCommands
{
  id v3 = objc_allocWithZone((Class)DOCKeyCommandController);
  id v4 = self;
  id v5 = [v3 init];
  id v6 = [v5 allKeyCommands];
  sub_100036804(0, (unint64_t *)&unk_10062F4D0);
  sub_1004D1510();

  v7.super.isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v7.super.isa;
}

- (void)selectAll:(id)a3
{
  id v3 = self;
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = self;
  }
  id v6 = [(DOCSaveToFilesViewController *)v3 documentPickerViewController];
  if (v6)
  {
    NSArray v7 = v6;
    BOOL v8 = [(DOCSplitBrowserViewController *)v6 fullDocumentManagerViewController];

    sub_1003EB6FC((uint64_t)&v9, 0);
    id v3 = v8;
  }

  sub_10003D810((uint64_t)&v9, &qword_10062D740);
}

- (void)performDeselectAll:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1000E0424();

  sub_10003D810((uint64_t)v6, &qword_10062D740);
}

- (void)performGoToRecents:(id)a3
{
}

- (void)performGoToEnclosingFolder:(id)a3
{
  id v4 = (DOCSaveToFilesViewController *)a3;
  NSArray v7 = self;
  id v5 = [(DOCSaveToFilesViewController *)v7 documentPickerViewController];
  if (v5)
  {
    id v6 = (DOCSaveToFilesViewController *)v5;
    [(DOCSplitBrowserViewController *)v5 showSidebar];

    id v4 = v7;
    NSArray v7 = v6;
  }
}

- (void)performGoToDocuments:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000E1300();
}

- (void)performGoToDesktop:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000E1598();
}

- (void)performGoToDownloads:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000E1830();
}

- (void)performGoToICloudDrive:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000E192C();
}

- (void)performGoToShared:(id)a3
{
}

@end