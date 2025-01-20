@interface JSUserObject
- (BOOL)isManagedAppleID;
- (BOOL)isUnderThirteen;
- (NSNumber)userAgeIfAvailable;
- (NSString)accountIdentifier;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)lastName;
- (_TtC19appstorecomponentsd12JSUserObject)init;
- (id)cookieForUrlWithName:(id)a3 :(id)a4;
- (id)cookiesForUrl:(id)a3;
@end

@implementation JSUserObject

- (NSString)firstName
{
  return (NSString *)sub_1000FDAA4(self);
}

- (NSString)lastName
{
  return (NSString *)sub_1000FDAA4(self);
}

- (NSString)accountIdentifier
{
  return (NSString *)sub_1000FDAA4(self);
}

- (NSString)dsid
{
  v2 = self;
  sub_1000FDC70();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isManagedAppleID
{
  uint64_t v3 = sub_10002EB60(&qword_1001A19C0);
  __chkstk_darwin(v3 - 8);
  NSString v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts), *(void *)&self->accounts[OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 16]);
  v6 = self;
  dispatch thunk of AccountProvider.activeAccount.getter();
  uint64_t v7 = type metadata accessor for Account();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
  {
    sub_100034B8C((uint64_t)v5, &qword_1001A19C0);

    return 0;
  }
  else
  {
    swift_getKeyPath();
    Account.subscript.getter();
    swift_release();
    char v9 = v11[15];
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return v9;
}

- (BOOL)isUnderThirteen
{
  v2 = self;
  char v3 = sub_1000FDFCC();

  return v3 & 1;
}

- (NSNumber)userAgeIfAvailable
{
  return (NSNumber *)0;
}

- (id)cookiesForUrl:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  NSString v5 = sub_1000FE1D0();

  swift_bridgeObjectRelease();
  if (v5)
  {
    sub_10002EE34(0, (unint64_t *)&qword_1001A4140);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

- (id)cookieForUrlWithName:(id)a3 :(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v11 = self;
  Class v12 = sub_1000FE590(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (_TtC19appstorecomponentsd12JSUserObject)init
{
  result = (_TtC19appstorecomponentsd12JSUserObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end