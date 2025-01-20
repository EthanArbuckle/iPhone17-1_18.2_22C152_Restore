@interface FBKActionControllerAction
- (BOOL)destructive;
- (NSString)title;
- (UIImage)image;
- (_TtC12FeedbackCore25FBKActionControllerAction)init;
- (_TtC12FeedbackCore25FBKActionControllerAction)initWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (id)actionHandler;
- (void)setActionHandler:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FBKActionControllerAction

- (NSString)title
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_22A4B3458();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_title);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_image));
}

- (void)setImage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_image);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_image) = (Class)a3;
  id v3 = a3;
}

- (BOOL)destructive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_destructive);
}

- (void)setDestructive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_destructive) = a3;
}

- (id)actionHandler
{
  uint64_t v2 = *(void *)&self->title[OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_actionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_actionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_22A439A80;
  v5[3] = &block_descriptor_5;
  id v3 = _Block_copy(v5);
  swift_retain();
  swift_release();

  return v3;
}

- (void)setActionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_actionHandler);
  *uint64_t v6 = sub_22A43C994;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (_TtC12FeedbackCore25FBKActionControllerAction)initWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_22A4B3458();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  id v11 = a4;
  v12 = (_TtC12FeedbackCore25FBKActionControllerAction *)sub_22A43C534(v7, v9, a4, (uint64_t)sub_22A43C994, v10);

  swift_release();
  return v12;
}

- (_TtC12FeedbackCore25FBKActionControllerAction)init
{
  result = (_TtC12FeedbackCore25FBKActionControllerAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end