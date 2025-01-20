@interface Coordinator
- (_TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator)init;
- (id)presentationAnchorForAuthorizationController:(id)a3;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)buttonPressed;
@end

@implementation Coordinator

- (void)buttonPressed
{
  v2 = self;
  sub_23455438C();
}

- (_TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator)init
{
  result = (_TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button);
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_23455569C();

  return v6;
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  v6 = *(void (**)(id, uint64_t))&self->config[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config
                                                       + 16];
  id v7 = a3;
  id v9 = a4;
  v8 = self;
  v6(a4, 1);
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  v6 = *(void (**)(id, void))&self->config[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config
                                                      + 16];
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  v6(a4, 0);
}

@end