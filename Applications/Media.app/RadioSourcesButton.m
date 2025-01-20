@interface RadioSourcesButton
- (_TtC5Media18RadioSourcesButton)initWithCoder:(id)a3;
- (_TtC5Media18RadioSourcesButton)initWithFrame:(CGRect)a3;
- (void)invalidate;
@end

@implementation RadioSourcesButton

- (_TtC5Media18RadioSourcesButton)initWithCoder:(id)a3
{
  id v4 = a3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    v5 = (objc_class *)sub_100004308((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Media18RadioSourcesButton_subscriptions) = v5;
  swift_weakInit();

  result = (_TtC5Media18RadioSourcesButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)invalidate
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Media18RadioSourcesButton_subscriptions);
  swift_beginAccess();
  void *v2 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (_TtC5Media18RadioSourcesButton)initWithFrame:(CGRect)a3
{
  result = (_TtC5Media18RadioSourcesButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_weakDestroy();
}

@end