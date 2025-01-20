@interface FileImportExportBridge
- (_TtC7SwiftUI22FileImportExportBridge)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
@end

@implementation FileImportExportBridge

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_host);
  outlined destroy of FileImportExportBridge.Presentation((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentationState, type metadata accessor for FileImportExportBridge.PresentationState);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentedPicker);
}

- (_TtC7SwiftUI22FileImportExportBridge)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->host[OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_host] = 0;
  swift_unknownObjectWeakInit();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentationState;
  uint64_t v5 = type metadata accessor for FileImportExportBridge.Presentation(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = type metadata accessor for FileImportExportBridge.PresentationState(0);
  *(_DWORD *)&v4[*(int *)(v6 + 20)] = 0;
  *(_DWORD *)&v4[*(int *)(v6 + 24)] = 0;
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentedPicker);
  void *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(FileImportExportBridge *)&v9 init];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (UIDocumentPickerViewController *)a3;
  v8 = self;
  FileImportExportBridge.documentPicker(_:didPickDocumentsAt:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  v4 = (UIDocumentPickerViewController *)a3;
  uint64_t v5 = self;
  FileImportExportBridge.documentPickerWasCancelled(_:)(v4);
}

@end