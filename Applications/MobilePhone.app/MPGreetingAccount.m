@interface MPGreetingAccount
+ (id)liveVoicemailAccount;
- (BOOL)customGreetingSupported;
- (MPGreetingAccount)init;
- (MPGreetingAccount)initWithAccount:(id)a3;
- (MPGreetingAccount)initWithSubscription:(id)a3;
- (id)accountDescription;
@end

@implementation MPGreetingAccount

- (BOOL)customGreetingSupported
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___MPGreetingAccount_accountType)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = self->accountType[OBJC_IVAR___MPGreetingAccount_accountType] == 2;
  }
  return !v2;
}

- (MPGreetingAccount)initWithAccount:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR___MPGreetingAccount_accountType;
  *(void *)v10 = a3;
  v10[8] = 0;
  id v11 = a3;
  v12 = self;
  id v13 = [v11 UUID];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v12 + OBJC_IVAR___MPGreetingAccount_uuid, v9, v6);
  v16.receiver = v12;
  v16.super_class = ObjectType;
  v14 = [(MPGreetingAccount *)&v16 init];

  return v14;
}

- (MPGreetingAccount)initWithSubscription:(id)a3
{
  return (MPGreetingAccount *)GreetingAccount.init(subscription:)(a3);
}

- (id)accountDescription
{
  BOOL v2 = self;
  object = GreetingAccount.accountDescription()().value._object;

  if (object)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

+ (id)liveVoicemailAccount
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassMetadata());
  id v3 = GreetingAccount.init(accountType:)(0, 2);

  return v3;
}

- (MPGreetingAccount)init
{
  result = (MPGreetingAccount *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___MPGreetingAccount_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end