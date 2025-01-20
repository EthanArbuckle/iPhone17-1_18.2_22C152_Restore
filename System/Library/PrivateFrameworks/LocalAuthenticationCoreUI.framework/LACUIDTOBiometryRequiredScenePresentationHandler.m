@interface LACUIDTOBiometryRequiredScenePresentationHandler
- (BOOL)canHandle:(id)a3;
- (_TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler)init;
- (void)handle:(id)a3 inContext:(id)a4;
@end

@implementation LACUIDTOBiometryRequiredScenePresentationHandler

- (BOOL)canHandle:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_userInterfaceRequest);
  unsigned int v7 = objc_msgSend(v6, sel_identifier);

  return v7 == 5;
}

- (void)handle:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(v7);
}

- (_TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler)init
{
  result = (_TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end