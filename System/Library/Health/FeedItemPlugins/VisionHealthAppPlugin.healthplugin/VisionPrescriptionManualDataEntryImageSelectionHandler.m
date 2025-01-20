@interface VisionPrescriptionManualDataEntryImageSelectionHandler
- (_TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler)init;
- (void)dealloc;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
@end

@implementation VisionPrescriptionManualDataEntryImageSelectionHandler

- (void)dealloc
{
  v2 = self;
  sub_241D85094();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler_fileManager));
  v3 = (char *)self
     + OBJC_IVAR____TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler__selectedImageURL;
  sub_241D86250(0, &qword_268D4BD18, (uint64_t (*)(uint64_t))sub_241D219B0, MEMORY[0x263EFDE58]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler)init
{
  result = (_TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_241D866AC(v6, v7);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_241DA96C0();
  uint64_t v6 = sub_241DAAB00();
  id v7 = a3;
  v8 = self;
  sub_241D88374(v6);

  swift_bridgeObjectRelease();
}

@end