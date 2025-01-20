@interface CNWallpaperSuggestionsGalleryViewModel
- (_TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel)init;
- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4;
- (void)editingViewControllerDidFinishShowingContent:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
@end

@implementation CNWallpaperSuggestionsGalleryViewModel

- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_18B6D0B24(a4);
}

- (void)editingViewControllerDidFinishShowingContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18B6CBE6C(v4);
}

- (_TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel)init
{
  result = (_TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B66405C((uint64_t)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__layoutDirection, &qword_1E913A978);
  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__isConfiguringPosterEditor;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E913A8F0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__shouldPresentPosterEditor, v4);
  v5((char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__shouldPresentPosterPhotoPicker, v4);
  id v6 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__selectedSource;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913A890);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel_editorVC));
  v8 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__pickerType;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E913A878);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__pickedImage;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913A920);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__photoLibraryAssetID;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E913A8C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__posterConfiguration;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913A900);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  sub_18B66405C((uint64_t)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel_lastSelectedSource, &qword_1E913A678);
  v16 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__selectedSuggestedAvatar;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913A8A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__suggestedAvatars;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E913A8E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  v20 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel_contact);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_18B6CEB50();
  uint64_t v6 = sub_18B985D78();
  id v7 = a3;
  v8 = self;
  sub_18B6CE228(v7, v6);

  swift_bridgeObjectRelease();
}

@end