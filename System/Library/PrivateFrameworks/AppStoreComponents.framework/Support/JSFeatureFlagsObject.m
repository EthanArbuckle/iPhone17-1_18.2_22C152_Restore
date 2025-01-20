@interface JSFeatureFlagsObject
- (_TtC19appstorecomponentsd20JSFeatureFlagsObject)init;
- (id)isEnabled:(id)a3;
@end

@implementation JSFeatureFlagsObject

- (_TtC19appstorecomponentsd20JSFeatureFlagsObject)init
{
  return (_TtC19appstorecomponentsd20JSFeatureFlagsObject *)sub_1000DD558();
}

- (id)isEnabled:(id)a3
{
  sub_1000D70FC();
  id v5 = a3;
  v6 = self;
  v7 = (void *)static JSContext.requiredCurrent.getter();
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v8;
}

- (void).cxx_destruct
{
}

@end