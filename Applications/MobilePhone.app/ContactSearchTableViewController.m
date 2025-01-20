@interface ContactSearchTableViewController
- (_TtC11MobilePhone32ContactSearchTableViewController)initWithCoder:(id)a3;
- (_TtC11MobilePhone32ContactSearchTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)handleTUIDSLookupManagerStatusChanged;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ContactSearchTableViewController

- (void)viewDidLoad
{
  v2 = self;
  ContactSearchTableViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  ContactSearchTableViewController.viewWillAppear(_:)(a3);
}

- (_TtC11MobilePhone32ContactSearchTableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ContactSearchTableViewController.init(coder:)();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xE8);
  id v6 = a3;
  v7 = self;
  unint64_t v8 = v5();
  if (v8 >> 62) {
    int64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    int64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)ContactSearchTableViewController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (uint64_t *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  ContactSearchTableViewController.tableView(_:didSelectRowAt:)(v10, v9);

  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)handleTUIDSLookupManagerStatusChanged
{
  v5 = self;
  v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "ContactSearchTableViewController: Handling TUIDSLookupManagerStatusChanged Notification", v4, 2u);
    swift_slowDealloc();
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PassthroughSubject<(), Never>);
  lazy protocol witness table accessor for type PassthroughSubject<(), Never> and conformance PassthroughSubject<A, B>((unint64_t *)&lazy protocol witness table cache variable for type PassthroughSubject<(), Never> and conformance PassthroughSubject<A, B>);
  Subject<>.send()();
}

- (_TtC11MobilePhone32ContactSearchTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MobilePhone32ContactSearchTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  os_log_type_t v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone32ContactSearchTableViewController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone32ContactSearchTableViewController____lazy_storage___contactAvatarCardController));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone32ContactSearchTableViewController_delegate));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobilePhone32ContactSearchTableViewController____lazy_storage___tableView);
}

@end