@interface FBAActionControllerAction
- (BOOL)destructive;
- (NSString)title;
- (UIImage)image;
- (_TtC18Feedback_Assistant25FBAActionControllerAction)init;
- (_TtC18Feedback_Assistant25FBAActionControllerAction)initWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (id)actionHandler;
- (void)setActionHandler:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FBAActionControllerAction

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_title);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_image));
}

- (void)setImage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_image);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_image) = (Class)a3;
  id v3 = a3;
}

- (BOOL)destructive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_destructive);
}

- (void)setDestructive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_destructive) = a3;
}

- (id)actionHandler
{
  uint64_t v2 = *(void *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler);
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10006B440;
  v5[3] = &unk_1000F5B10;
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
  uint64_t v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler);
  *uint64_t v6 = sub_10007A048;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (_TtC18Feedback_Assistant25FBAActionControllerAction)initWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  id v11 = a4;
  v12 = (_TtC18Feedback_Assistant25FBAActionControllerAction *)sub_100079C14(v7, v9, a4, (uint64_t)sub_10007A048, v10);

  swift_release();
  return v12;
}

- (_TtC18Feedback_Assistant25FBAActionControllerAction)init
{
  result = (_TtC18Feedback_Assistant25FBAActionControllerAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end