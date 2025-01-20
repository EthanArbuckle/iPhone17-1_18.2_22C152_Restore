@interface FBAFilter
- (BOOL)active;
- (NSPredicate)predicate;
- (NSString)title;
- (UIImage)image;
- (_TtC18Feedback_Assistant9FBAFilter)init;
- (_TtC18Feedback_Assistant9FBAFilter)initWithPredicate:(id)a3 title:(id)a4 image:(id)a5;
- (_TtC18Feedback_Assistant9FBAFilter)initWithPredicate:(id)a3 title:(id)a4 imageName:(id)a5;
- (void)setActive:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setTitle:(id)a3;
- (void)toggle;
@end

@implementation FBAFilter

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_predicate));
}

- (void)setPredicate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_predicate) = (Class)a3;
  id v3 = a3;
}

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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_title);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_image));
}

- (void)setImage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_image);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_image) = (Class)a3;
  id v3 = a3;
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant9FBAFilter_active);
}

- (void)setActive:(BOOL)a3
{
  id v4 = self;
  sub_10007EE38(a3);
}

- (_TtC18Feedback_Assistant9FBAFilter)initWithPredicate:(id)a3 title:(id)a4 image:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  id v10 = a3;
  id v11 = a5;
  v12 = (_TtC18Feedback_Assistant9FBAFilter *)sub_10007F4AC(v10, v7, v9, a5);

  return v12;
}

- (_TtC18Feedback_Assistant9FBAFilter)initWithPredicate:(id)a3 title:(id)a4 imageName:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC18Feedback_Assistant9FBAFilter *)sub_10007EFDC(a3, v7, v8, a5);
}

- (void)toggle
{
  swift_getKeyPath();
  id v3 = self;
  _KeyValueCodingAndObserving.willChangeValue<A>(for:)();
  [(FBAFilter *)v3 setActive:[(FBAFilter *)v3 active] ^ 1];
  swift_getKeyPath();
  _KeyValueCodingAndObserving.didChangeValue<A>(for:)();
  sub_10007F24C();
}

- (_TtC18Feedback_Assistant9FBAFilter)init
{
  result = (_TtC18Feedback_Assistant9FBAFilter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end