@interface APSUserDependencies
- (APSClientIdentityProvider)clientIdentityProvider;
- (APSSystemTokenStorage)systemTokenStorage;
- (APSUserAppIDManager)userAppIDManager;
- (APSUserDependencies)init;
- (APSUserDependencies)initWithClientIdentityProvider:(id)a3 systemTokenStorage:(id)a4 userPreferences:(id)a5 userAppIDManager:(id)a6;
- (APSUserPreferences)userPreferences;
- (NSString)description;
@end

@implementation APSUserDependencies

- (APSClientIdentityProvider)clientIdentityProvider
{
  v2 = (void *)swift_unknownObjectRetain();
  return (APSClientIdentityProvider *)v2;
}

- (APSSystemTokenStorage)systemTokenStorage
{
  v2 = (void *)swift_unknownObjectRetain();
  return (APSSystemTokenStorage *)v2;
}

- (APSUserPreferences)userPreferences
{
  v2 = (void *)swift_unknownObjectRetain();
  return (APSUserPreferences *)v2;
}

- (APSUserAppIDManager)userAppIDManager
{
  v2 = (void *)swift_unknownObjectRetain();
  return (APSUserAppIDManager *)v2;
}

- (APSUserDependencies)initWithClientIdentityProvider:(id)a3 systemTokenStorage:(id)a4 userPreferences:(id)a5 userAppIDManager:(id)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_clientIdentityProvider) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_systemTokenStorage) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_userPreferences) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_userAppIDManager) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for UserDependencies();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(APSUserDependencies *)&v7 init];
}

- (NSString)description
{
  v2 = self;
  sub_1000B9AAC();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (APSUserDependencies)init
{
  result = (APSUserDependencies *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end