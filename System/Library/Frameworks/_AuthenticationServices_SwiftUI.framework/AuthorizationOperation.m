@interface AuthorizationOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation)init;
- (id)presentationAnchorForAuthorizationController:(id)a3;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)cancel;
- (void)start;
@end

@implementation AuthorizationOperation

- (void)start
{
  v2 = self;
  sub_234552218();
}

- (void)cancel
{
  v2 = self;
  sub_234552588();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v3 = (unsigned char *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2345531CC(v3, &v7);
  os_unfair_lock_unlock(v4);
  LODWORD(v3) = v7;

  return v3 == 1;
}

- (BOOL)isFinished
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v3 = (unsigned char *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2345531CC(v3, &v7);
  os_unfair_lock_unlock(v4);
  LODWORD(v3) = v7;

  return v3 == 2;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = objc_msgSend(v7, sel_credential);
  sub_23454C170((uint64_t)&v13);
  id v10 = v13;
  v11 = v13;
  char v12 = v14;
  sub_2345532D0((uint64_t)&v11);
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController) = 0;
  id v7 = a3;
  id v9 = a4;
  v8 = self;

  sub_234552A58(v9);
}

- (_TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation)init
{
  result = (_TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_234551854(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler));
  sub_234551854(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  v4 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.isa
                                         + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  if (!v4)
  {
    id v10 = a3;
    v11 = self;
    goto LABEL_7;
  }
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = sub_234553AD4((uint64_t)v4);
  v8 = (void *)v4(v7);
  sub_234551854((uint64_t)v4);
  if (!v8)
  {
LABEL_7:
    id result = (id)sub_234559D80();
    __break(1u);
    return result;
  }

  return v8;
}

@end