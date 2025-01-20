@interface ImageDescriptionViewRepresentable.Coordinator
- (_TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator)init;
- (void)imageDescriptionViewControllerDidCancel:(id)a3;
- (void)imageDescriptionViewControllerDidSave:(id)a3;
@end

@implementation ImageDescriptionViewRepresentable.Coordinator

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  sub_2443BA950();
  v7[2] = self;
  id v5 = a3;
  v6 = self;
  sub_244232A00((uint64_t)sub_24418E9C0, (uint64_t)v7);
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  sub_2443BA950();
  v7[2] = a3;
  v7[3] = self;
  id v5 = a3;
  v6 = self;
  sub_244232A00((uint64_t)sub_24418E87C, (uint64_t)v7);
}

- (_TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator)init
{
  result = (_TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator_parent);
  v3 = *(void **)&self->parent[OBJC_IVAR____TtCV15ImagePlayground33ImageDescriptionViewRepresentable11Coordinator_parent];
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end