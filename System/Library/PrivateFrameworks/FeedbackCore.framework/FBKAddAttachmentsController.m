@interface FBKAddAttachmentsController
+ (void)handleErrorAttachingWithAttachment:(id)a3 viewController:(id)a4 devicesDiagnosticsController:(id)a5 error:(id)a6;
- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4;
- (_TtC12FeedbackCore27FBKAddAttachmentsController)init;
- (_TtC12FeedbackCore27FBKAddAttachmentsController)initWithDelegate:(id)a3 supportsDragAndDrop:(BOOL)a4;
- (id)menuForController:(id)a3;
- (id)sheetForController:(id)a3 selectedIndexPath:(id)a4 sender:(id)a5;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:(id)a3;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
@end

@implementation FBKAddAttachmentsController

- (_TtC12FeedbackCore27FBKAddAttachmentsController)initWithDelegate:(id)a3 supportsDragAndDrop:(BOOL)a4
{
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC12FeedbackCore27FBKAddAttachmentsController____lazy_storage___temporaryDirectory;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_unknownObjectWeakAssign();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore27FBKAddAttachmentsController_supportsDragAndDrop) = a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBKAddAttachmentsController();
  return [(FBKAddAttachmentsController *)&v9 init];
}

- (id)sheetForController:(id)a3 selectedIndexPath:(id)a4 sender:(id)a5
{
  uint64_t v8 = sub_22A4B25F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  v15 = sub_22A442950(v12, (uint64_t)v11, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v15;
}

- (id)menuForController:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_22A440CDC(v4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for FBKActionMenuController());
  id v8 = sub_22A439CC0(0, 0, 0, 0, v6);
  uint64_t v9 = (void *)sub_22A43A014();

  return v9;
}

- (_TtC12FeedbackCore27FBKAddAttachmentsController)init
{
  result = (_TtC12FeedbackCore27FBKAddAttachmentsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_22A4B24C8();
  uint64_t v6 = sub_22A4B3628();
  id v7 = a3;
  id v8 = self;
  sub_22A446218(v6);

  swift_bridgeObjectRelease();
}

+ (void)handleErrorAttachingWithAttachment:(id)a3 viewController:(id)a4 devicesDiagnosticsController:(id)a5 error:(id)a6
{
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  static FBKAddAttachmentsController.handleErrorAttaching(attachment:viewController:devicesDiagnosticsController:error:)(v10, v11, v12, v13);
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  char v8 = sub_22A4463B0(a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683766F0);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_22A4B25B8();
    uint64_t v12 = sub_22A4B25F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_22A4B25F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  id v16 = FBKAddAttachmentsController.tableView(_:dropSessionDidUpdate:withDestinationIndexPath:)((uint64_t)v14, (uint64_t)a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_22A40A09C((uint64_t)v11, (uint64_t *)&unk_2683766F0);

  return v16;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
}

- (void)getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_22A4442CC((char *)a3);
  swift_unknownObjectRelease();
}

@end