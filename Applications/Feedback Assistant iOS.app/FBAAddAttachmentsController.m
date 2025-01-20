@interface FBAAddAttachmentsController
+ (void)handleErrorAttachingWithAttachment:(id)a3 viewController:(id)a4 devicesDiagnosticsController:(id)a5 error:(id)a6;
- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4;
- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)init;
- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)initWithDelegate:(id)a3;
- (id)menuForController:(id)a3;
- (id)sheetForController:(id)a3 selectedIndexPath:(id)a4 sender:(id)a5;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:(id)a3;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
@end

@implementation FBAAddAttachmentsController

- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)initWithDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  v4 = (char *)self
     + OBJC_IVAR____TtC18Feedback_Assistant27FBAAddAttachmentsController____lazy_storage___temporaryDirectory;
  uint64_t v5 = sub_10004DE60(&qword_100122790);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_unknownObjectWeakAssign();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAAddAttachmentsController();
  return [(FBAAddAttachmentsController *)&v7 init];
}

- (id)sheetForController:(id)a3 selectedIndexPath:(id)a4 sender:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  v15 = sub_10005CC58(v12, (uint64_t)v11, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v15;
}

- (id)menuForController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_10005AF0C(v4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for FBAActionMenuController());
  id v8 = sub_1000773E8(0, 0, 0, 0, v6);
  Class v9 = sub_10007773C();

  return v9;
}

- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)init
{
  result = (_TtC18Feedback_Assistant27FBAAddAttachmentsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_10006098C(v6);

  swift_bridgeObjectRelease();
}

+ (void)handleErrorAttachingWithAttachment:(id)a3 viewController:(id)a4 devicesDiagnosticsController:(id)a5 error:(id)a6
{
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  sub_10005DA28(v10, v11, v12, (uint64_t)v13);
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  char v8 = sub_100060A94(a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_10004DE60(&qword_100122880);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  id v16 = sub_10005E204((uint64_t)v14, (uint64_t)a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_100052464((uint64_t)v11, &qword_100122880);

  return v16;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
}

- (void)getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_10005E548((char *)a3);
  swift_unknownObjectRelease();
}

@end