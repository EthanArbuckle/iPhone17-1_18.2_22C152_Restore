@interface ScannerViewController
- (_TtC18SharingViewService21ScannerViewController)initWithScannerEngine:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ScannerViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScannerViewController();
  v4 = (char *)v7.receiver;
  [(ScannerViewController *)&v7 viewWillAppear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
  [v4 resetConfirmationRing];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScannerViewController();
  v4 = (char *)v7.receiver;
  [(ScannerViewController *)&v7 viewDidDisappear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(ObjectType, v5);
}

- (_TtC18SharingViewService21ScannerViewController)initWithScannerEngine:(id)a3
{
  id v3 = a3;
  result = (_TtC18SharingViewService21ScannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = &self->scannerEngineViewController[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_log];
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(void **)&self->scannerEngineViewController[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController];
}

@end