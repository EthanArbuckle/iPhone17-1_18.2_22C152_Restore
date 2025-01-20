@interface JSMediaTokensObject
- (_TtC19appstorecomponentsd19JSMediaTokensObject)init;
- (id)getTokenFor:(id)a3 :(id)a4;
- (void)resetTokenFor:(id)a3 :(id)a4;
@end

@implementation JSMediaTokensObject

- (id)getTokenFor:(id)a3 :(id)a4
{
  sub_10002EE34(0, &qword_1001A4098);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)static JSContext.requiredCurrent.getter();
  v11 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v11;
}

- (void)resetTokenFor:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000EBBFC(v6, v7);
}

- (_TtC19appstorecomponentsd19JSMediaTokensObject)init
{
  result = (_TtC19appstorecomponentsd19JSMediaTokensObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_bag;
  uint64_t v4 = type metadata accessor for Bag();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_cachedServices);
}

@end