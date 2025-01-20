@interface QLPreviewItemContainer
- (BOOL)isEqual:(id)a3;
- (NSURL)previewItemURL;
- (_TtC18_QuickLook_SwiftUI22QLPreviewItemContainer)init;
- (int64_t)hash;
- (void)setPreviewItemURL:(id)a3;
@end

@implementation QLPreviewItemContainer

- (NSURL)previewItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_2352D938C((uint64_t)v6, (uint64_t)v5, &qword_2687F5A28);
  uint64_t v7 = sub_2352DB458();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_2352DB438();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (void)setPreviewItemURL:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F5A28);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2352DB448();
    uint64_t v8 = sub_2352DB458();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_2352DB458();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_2352D93F0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_2352DB6C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_2352D6F30((uint64_t)v8);

  sub_2352D9800((uint64_t)v8, &qword_2687F5CC8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_2352D743C();

  return v3;
}

- (_TtC18_QuickLook_SwiftUI22QLPreviewItemContainer)init
{
  result = (_TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end