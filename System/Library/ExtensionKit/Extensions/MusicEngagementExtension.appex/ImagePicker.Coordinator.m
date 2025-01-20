@interface ImagePicker.Coordinator
- (_TtCV11MusicCoreUI11ImagePicker11Coordinator)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation ImagePicker.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for UIImagePickerControllerInfoKey(0);
  lazy protocol witness table accessor for type ImagePicker.Coordinator and conformance ImagePicker.Coordinator(&lazy protocol witness table cache variable for type UIImagePickerControllerInfoKey and conformance UIImagePickerControllerInfoKey, type metadata accessor for UIImagePickerControllerInfoKey);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id _ = a3;
  v7 = self;
  ImagePicker.Coordinator.imagePickerController(_:didFinishPickingMediaWithInfo:)((UIImagePickerController)_, (Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  ImagePicker.Coordinator.imagePickerControllerDidCancel(_:)((UIImagePickerController)v4);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id _ = a3;
  v7 = self;
  ImagePicker.Coordinator.documentPicker(_:didPickDocumentsAt:)((UIDocumentPickerViewController)_, (Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  uint64_t v5 = type metadata accessor for ImagePicker(0) - 8;
  __chkstk_darwin();
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  outlined init with copy of ImagePicker((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker, (uint64_t)v7);
  v8 = &v7[*(int *)(v5 + 40)];
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *((void *)v8 + 1);
  LOBYTE(v8) = v8[16];
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  char v16 = (char)v8;
  v13[7] = 0;
  id v11 = a3;
  v12 = self;
  __swift_instantiateConcreteTypeFromMangledName(&_s7SwiftUI7BindingVySbGMD_0);
  Binding.wrappedValue.setter();
  [v11 dismissViewControllerAnimated:1 completion:0];
  outlined destroy of ImagePicker((uint64_t)v7);
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (_TtCV11MusicCoreUI11ImagePicker11Coordinator)init
{
  result = (_TtCV11MusicCoreUI11ImagePicker11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of ImagePicker((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker);
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_pickHandler));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator____lazy_storage___downloadFailureAlertController);
}

@end