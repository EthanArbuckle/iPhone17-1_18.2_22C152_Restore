@interface JSArcadeObject
- (_TtC19appstorecomponentsd14JSArcadeObject)init;
- (id)getRecentlyPlayedGamesWithTimeout:(id)a3;
@end

@implementation JSArcadeObject

- (_TtC19appstorecomponentsd14JSArcadeObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSArcadeObject *)&v3 init];
}

- (id)getRecentlyPlayedGamesWithTimeout:(id)a3
{
  sub_10002EE34(0, &qword_1001A4098);
  id v5 = a3;
  v6 = self;
  v7 = (void *)static JSContext.requiredCurrent.getter();
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v8;
}

@end