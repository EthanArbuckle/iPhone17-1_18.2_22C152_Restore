@interface NotesMetadataActivityItemProvider
- (_TtC19AppStoreKitInternal33NotesMetadataActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
@end

@implementation NotesMetadataActivityItemProvider

- (id)item
{
  v2 = self;
  sub_1E178699C(v5);

  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  v3 = (void *)sub_1E1D5D398();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E1786A94((uint64_t)a4, (uint64_t)v17);

  uint64_t v9 = v18;
  if (v18)
  {
    v10 = __swift_project_boxed_opaque_existential_1Tm(v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __n128 v12 = MEMORY[0x1F4188790](v10);
    v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
    v15 = (void *)sub_1E1D5D398();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E1786E60(a4);

  uint64_t v9 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC19AppStoreKitInternal33NotesMetadataActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_1E1D5CDD8();
  swift_unknownObjectRelease();
  result = (_TtC19AppStoreKitInternal33NotesMetadataActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC19AppStoreKitInternal33NotesMetadataActivityItemProvider____lazy_storage___notesMetadata);
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super._iop.__prevOp
                           + OBJC_IVAR____TtC19AppStoreKitInternal33NotesMetadataActivityItemProvider____lazy_storage___notesMetadata);
  sub_1E1591D78(v3, v4);
}

@end