@interface MFSnapshotProvider
- (_TtC16MagnifierSupport18MFSnapshotProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation MFSnapshotProvider

- (id)item
{
  uint64_t v3 = sub_2359477E8();
  __n128 v8 = MEMORY[0x270FA5388](v3, v4, v5, v6, v7);
  (*(void (**)(char *, char *, uint64_t, __n128))(v10 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC16MagnifierSupport18MFSnapshotProvider_url, v3, v8);
  v11 = (void *)sub_23594ABE8();
  return v11;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_2358E0638();

  return v6;
}

- (_TtC16MagnifierSupport18MFSnapshotProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_23594A6A8();
  swift_unknownObjectRelease();
  result = (_TtC16MagnifierSupport18MFSnapshotProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport18MFSnapshotProvider_url;
  uint64_t v4 = sub_2359477E8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport18MFSnapshotProvider_image);
}

@end