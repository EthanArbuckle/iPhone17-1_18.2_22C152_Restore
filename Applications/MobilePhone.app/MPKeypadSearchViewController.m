@interface MPKeypadSearchViewController
- (MPKeypadSearchViewController)init;
- (MPKeypadSearchViewController)initWithCoder:(id)a3;
- (MPKeypadSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPKeypadSearchViewController)initWithOnDismissHandler:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchControllerBeginDragging;
- (void)searchControllerDidSelectRow;
- (void)updateSearchText:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MPKeypadSearchViewController

- (MPKeypadSearchViewController)init
{
  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_pendingText);
  void *v2 = 0;
  v2[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_searchBarWasFirstResponder) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___keypadSearchResultsController) = 0;

  result = (MPKeypadSearchViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (MPKeypadSearchViewController)initWithOnDismissHandler:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = (uint64_t)_Block_copy(a3);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v7;
    v8 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  }
  else
  {
    v8 = 0;
  }
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_pendingText);
  void *v9 = 0;
  v9[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_searchBarWasFirstResponder) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___keypadSearchResultsController) = 0;
  v10 = (uint64_t (**)())((char *)self + OBJC_IVAR___MPKeypadSearchViewController_onDismiss);
  *v10 = v8;
  v10[1] = (uint64_t (*)())v6;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return [(MPKeypadSearchViewController *)&v12 initWithNibName:0 bundle:0];
}

- (MPKeypadSearchViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_pendingText);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_searchBarWasFirstResponder) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___keypadSearchResultsController) = 0;
  id v5 = a3;

  result = (MPKeypadSearchViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(MPKeypadSearchViewController *)&v6 viewDidLoad];
  [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];

    KeypadSearchViewController.setupConstraints()();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  KeypadSearchViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(MPKeypadSearchViewController *)&v7 viewWillDisappear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    id v6 = v5;
    [v5 setNavigationBarHidden:0 animated:0];

    id v4 = v6;
  }
}

- (void)updateSearchText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
  }
  objc_super v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  KeypadSearchViewController.updateSearchText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)searchControllerBeginDragging
{
  id v5 = self;
  id v2 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.searchBar.getter);
  unsigned int v3 = [v2 isFirstResponder];

  if (v3)
  {
    id v4 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.searchBar.getter);
    [v4 resignFirstResponder];

    *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_searchBarWasFirstResponder) = 0;
  }
}

- (void)searchControllerDidSelectRow
{
  id v5 = self;
  id v2 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.searchBar.getter);
  unsigned int v3 = [v2 isFirstResponder];

  if (v3)
  {
    id v4 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.searchBar.getter);
    [v4 resignFirstResponder];

    *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_searchBarWasFirstResponder) = 1;
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized KeypadSearchViewController.searchBarCancelButtonClicked(_:)();
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  Swift::String_optional v8 = self;
  id v5 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.searchBar.getter);
  unsigned int v6 = [v5 isFirstResponder];

  if (v6)
  {
    id v7 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.searchBar.getter);
    [v7 resignFirstResponder];

    *((unsigned char *)&v8->super.super.super.isa + OBJC_IVAR___MPKeypadSearchViewController_searchBarWasFirstResponder) = 0;
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  unsigned int v6 = self;
  id v7 = KeypadSearchViewController.keypadSearchResultsController.getter(&OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___keypadSearchResultsController, (uint64_t (*)(uint64_t))closure #1 in KeypadSearchViewController.keypadSearchResultsController.getter);
  (*(void (**)(id))((swift_isaMask & *v7) + 0x1B8))(v5);
}

- (MPKeypadSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (MPKeypadSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR___MPKeypadSearchViewController_onDismiss));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___searchBar));
  unsigned int v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MPKeypadSearchViewController____lazy_storage___keypadSearchResultsController);
}

@end