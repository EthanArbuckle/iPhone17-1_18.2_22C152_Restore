@interface JSClientOrderingObject
- (_TtC19appstorecomponentsd22JSClientOrderingObject)init;
- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)visibilityForIAPs:(id)a3 :(id)a4;
@end

@implementation JSClientOrderingObject

- (_TtC19appstorecomponentsd22JSClientOrderingObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSClientOrderingObject *)&v3 init];
}

- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  if (a5) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a6) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v12 = a7;
  v13 = self;
  sub_1000D70FC();
  id v15 = (id)static JSContext.requiredCurrent.getter();
  v14 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)visibilityForIAPs:(id)a3 :(id)a4
{
  sub_1000D70FC();
  id v6 = a4;
  v7 = self;
  id v9 = (id)static JSContext.requiredCurrent.getter();
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)();
}

@end