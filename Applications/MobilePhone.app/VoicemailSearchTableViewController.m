@interface VoicemailSearchTableViewController
+ (id)voicemailPredicate;
- (BOOL)hasContentToDisplay;
- (NSMutableArray)voicemails;
- (NSString)folderName;
- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithCoder:(id)a3;
- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithNavigationController:(id)a3 voicemailController:(id)a4;
- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)performTableViewDestructiveActionAtIndexPath:(id)a3;
- (void)setFolderName:(id)a3;
- (void)setVoicemails:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VoicemailSearchTableViewController

- (NSMutableArray)voicemails
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(MPVoicemailTableViewController *)&v4 voicemails];

  return v2;
}

- (void)setVoicemails:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  objc_super v4 = v5.receiver;
  [(MPVoicemailTableViewController *)&v5 setVoicemails:a3];
  v4[OBJC_IVAR____TtC11MobilePhone34VoicemailSearchTableViewController_dataSourceNeedsReload] = 1;
}

- (NSString)folderName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setFolderName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11MobilePhone34VoicemailSearchTableViewController_folderName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)hasContentToDisplay
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  v3 = [(MPVoicemailTableViewController *)&v6 voicemails];
  id v4 = [(NSMutableArray *)v3 count];

  return (uint64_t)v4 > 0;
}

+ (id)voicemailPredicate
{
  v4[4] = closure #1 in static VoicemailSearchTableViewController.voicemailPredicate.getter;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = thunk for @escaping @callee_guaranteed (@guaranteed Message) -> (@unowned Bool);
  v4[3] = &block_descriptor_11;
  id v2 = _Block_copy(v4);
  swift_release();

  return v2;
}

- (void)viewDidLoad
{
  id v2 = self;
  VoicemailSearchTableViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  VoicemailSearchTableViewController.viewWillAppear(_:)(a3);
}

- (void)performTableViewDestructiveActionAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  VoicemailSearchTableViewController.performTableViewDestructiveAction(at:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = VoicemailSearchTableViewController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  VoicemailSearchTableViewController.tableView(_:didSelectRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithNavigationController:(id)a3 voicemailController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (_TtC11MobilePhone34VoicemailSearchTableViewController *)specialized VoicemailSearchTableViewController.init(navigationController:voicemailController:)((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithStyle:(int64_t)a3
{
  return (_TtC11MobilePhone34VoicemailSearchTableViewController *)VoicemailSearchTableViewController.init(style:)(a3);
}

- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC11MobilePhone34VoicemailSearchTableViewController *)VoicemailSearchTableViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11MobilePhone34VoicemailSearchTableViewController)initWithCoder:(id)a3
{
  return (_TtC11MobilePhone34VoicemailSearchTableViewController *)VoicemailSearchTableViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone34VoicemailSearchTableViewController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone34VoicemailSearchTableViewController_featureFlags));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone34VoicemailSearchTableViewController____lazy_storage___contactAvatarCardController));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end