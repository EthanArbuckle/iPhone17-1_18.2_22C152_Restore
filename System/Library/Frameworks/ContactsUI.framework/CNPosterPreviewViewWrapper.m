@interface CNPosterPreviewViewWrapper
- (UIViewController)hostingController;
- (_TtC10ContactsUI26CNPosterPreviewViewWrapper)init;
- (_TtC10ContactsUI26CNPosterPreviewViewWrapper)initWithConfiguration:(id)a3 contact:(id)a4 editingState:(int64_t)a5 delegate:(id)a6 windowScene:(id)a7;
- (void)setHostingController:(id)a3;
@end

@implementation CNPosterPreviewViewWrapper

- (UIViewController)hostingController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC10ContactsUI26CNPosterPreviewViewWrapper)initWithConfiguration:(id)a3 contact:(id)a4 editingState:(int64_t)a5 delegate:(id)a6 windowScene:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  swift_unknownObjectRetain();
  id v13 = a7;
  v14 = (_TtC10ContactsUI26CNPosterPreviewViewWrapper *)sub_18B7280C0(v11, v12, a5, (uint64_t)a6, a7);

  swift_unknownObjectRelease();
  return v14;
}

- (_TtC10ContactsUI26CNPosterPreviewViewWrapper)init
{
  result = (_TtC10ContactsUI26CNPosterPreviewViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController));
}

@end