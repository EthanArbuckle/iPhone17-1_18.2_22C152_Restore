@interface CKRemotePeoplePickerViewController
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (CKRemotePeoplePickerViewController)initWithCoder:(id)a3;
- (CKRemotePeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerWithSuccess:(BOOL)a3;
- (void)loadView;
- (void)requestActivity:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CKRemotePeoplePickerViewController

- (void)loadView
{
  v2 = self;
  RemotePeoplePickerViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  RemotePeoplePickerViewController.viewDidLoad()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  RemotePeoplePickerViewController.viewDidDisappear(_:)(a3);
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = RemotePeoplePickerViewController.shouldAcceptXPCConnection(_:)((NSXPCConnection)v4);

  return self & 1;
}

- (CKRemotePeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (CKRemotePeoplePickerViewController *)RemotePeoplePickerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (CKRemotePeoplePickerViewController)initWithCoder:(id)a3
{
  return (CKRemotePeoplePickerViewController *)RemotePeoplePickerViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKRemotePeoplePickerViewController_connection));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CKRemotePeoplePickerViewController____lazy_storage___contentViewController);
  outlined consume of UIView??(v3);
}

- (void)requestActivity:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  RemotePeoplePickerViewController.requestActivity(completionHandler:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UIImage?) -> (), v5);

  swift_release();
}

- (void)dismissViewControllerWithSuccess:(BOOL)a3
{
  id v4 = self;
  RemotePeoplePickerViewController.dismissViewController(success:)(a3);
}

@end