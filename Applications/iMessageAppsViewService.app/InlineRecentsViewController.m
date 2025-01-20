@interface InlineRecentsViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)stickerRecentsController:(id)a3 didTapSticker:(id)a4;
- (void)stickerRecentsControllerDidRequestMemojiEditor:(id)a3;
- (void)stickerRecentsControllerDidTapAppButton:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation InlineRecentsViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)InlineRecentsViewController;
  [(InlineRecentsViewController *)&v12 viewDidLoad];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v3 = (void *)qword_1000167F8;
  uint64_t v21 = qword_1000167F8;
  if (!qword_1000167F8)
  {
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_10000A3E8;
    v16 = &unk_100010560;
    v17 = &v18;
    sub_10000A3E8((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 stickerRecentsController];
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v6 = (void *)qword_100016808;
    uint64_t v21 = qword_100016808;
    if (!qword_100016808)
    {
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_10000A5B0;
      v16 = &unk_100010560;
      v17 = &v18;
      sub_10000A5B0((uint64_t)&v13);
      v6 = (void *)v19[3];
    }
    v7 = v6;
    _Block_object_dispose(&v18, 8);
    id v8 = objc_alloc_init(v7);
    v5 = [v4 stickerRecentsControllerForStore:v8];
  }
  [v5 setDelegate:self];
  [(InlineRecentsViewController *)self addChildViewController:v5];
  v9 = [v5 view];
  v10 = [(InlineRecentsViewController *)self view];
  [v10 bounds];
  [v9 setFrame:];

  [v9 setAutoresizingMask:18];
  v11 = [(InlineRecentsViewController *)self view];
  [v11 addSubview:v9];

  [v5 didMoveToParentViewController:self];
}

- (void)stickerRecentsControllerDidRequestMemojiEditor:(id)a3
{
  +[AppCardViewController setNextPresentationIsFullscreenModal:1];
  id v4 = [(InlineRecentsViewController *)self _remoteViewControllerProxy];
  [v4 presentCard];
}

- (void)stickerRecentsControllerDidTapAppButton:(id)a3
{
  id v3 = [(InlineRecentsViewController *)self _remoteViewControllerProxy];
  [v3 presentCard];
}

- (void)stickerRecentsController:(id)a3 didTapSticker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 imageFileURL];
  v9 = [v8 path];
  v10 = +[NSFileHandle fileHandleForReadingAtPath:v9];

  v11 = [(InlineRecentsViewController *)self _remoteViewControllerProxy];
  if (objc_opt_respondsToSelector())
  {
    objc_super v12 = [v7 imageFileURL];
    uint64_t v13 = [v12 absoluteString];
    uint64_t v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = &stru_1000108B0;
    }
    v16 = v15;

    uint64_t v17 = [v7 localizedDescription];
    uint64_t v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = &stru_1000108B0;
    }
    uint64_t v20 = v19;

    [v11 stageStickerWithFileHandle:v10 url:v16 accessibilityLabel:v20];
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  uint64_t v21 = (void *)qword_100016810;
  uint64_t v28 = qword_100016810;
  if (!qword_100016810)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000A608;
    v24[3] = &unk_100010560;
    v24[4] = &v25;
    sub_10000A608((uint64_t)v24);
    uint64_t v21 = (void *)v26[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v25, 8);
  if (objc_opt_respondsToSelector())
  {
    v23 = [(InlineRecentsViewController *)self _hostApplicationBundleIdentifier];
    [v22 trackStickerSentFromHostBundleIdentifier:v23];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)InlineRecentsViewController;
  [(InlineRecentsViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(InlineRecentsViewController *)self _remoteViewControllerProxy];
  [v4 dismissCard];
}

+ (id)_remoteViewControllerInterface
{
  if (qword_1000167E0 != -1) {
    dispatch_once(&qword_1000167E0, &stru_100010818);
  }
  v2 = (void *)qword_1000167D8;

  return v2;
}

+ (id)_exportedInterface
{
  if (qword_1000167F0 != -1) {
    dispatch_once(&qword_1000167F0, &stru_100010838);
  }
  v2 = (void *)qword_1000167E8;

  return v2;
}

@end