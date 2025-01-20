@interface JSStoreMetricsObject
- (_TtC19appstorecomponentsd20JSStoreMetricsObject)init;
- (id)flushUnrecordedEvents;
- (id)recordEvent:(id)a3 :(id)a4;
@end

@implementation JSStoreMetricsObject

- (id)recordEvent:(id)a3 :(id)a4
{
  sub_10002EE34(0, &qword_1001A4098);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)static JSContext.requiredCurrent.getter();
  v11 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v11;
}

- (id)flushUnrecordedEvents
{
  sub_10002EE34(0, &qword_1001A4098);
  v3 = self;
  v4 = (void *)static JSContext.requiredCurrent.getter();
  v5 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v5;
}

- (_TtC19appstorecomponentsd20JSStoreMetricsObject)init
{
  result = (_TtC19appstorecomponentsd20JSStoreMetricsObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end