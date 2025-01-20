@interface LACUIAlertScenePresentationHandler
- (BOOL)canHandle:(id)a3;
- (_TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler)init;
- (void)handle:(id)a3 inContext:(id)a4;
@end

@implementation LACUIAlertScenePresentationHandler

- (BOOL)canHandle:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_userInterfaceRequest);
  unsigned int v7 = objc_msgSend(v6, sel_identifier);

  uint64_t v8 = *(uint64_t *)((char *)&v5->super.isa
                  + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration);

  return v8 == v7;
}

- (void)handle:(id)a3 inContext:(id)a4
{
  id v6 = (objc_class *)a3;
  unsigned int v7 = (LACUserInterfaceRequest *)a4;
  v11.super.Class isa = (Class)self;
  Class isa = v11.super.isa;
  v8.super.Class isa = v6;
  v8._userInterfaceRequest = v7;
  LACUIAlertScenePresentationHandler.handle(request:inContext:)(v8, v11);
}

- (_TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler)init
{
  result = (_TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end