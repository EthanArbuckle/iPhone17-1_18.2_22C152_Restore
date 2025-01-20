@interface WebAuthenticationOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation)init;
- (void)cancel;
- (void)start;
@end

@implementation WebAuthenticationOperation

- (void)start
{
  v2 = self;
  sub_234555A34();
}

- (void)cancel
{
  v2 = self;
  sub_23455631C();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
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
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  v3 = (unsigned char *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2345531CC(v3, &v7);
  os_unfair_lock_unlock(v4);
  LODWORD(v3) = v7;

  return v3 == 2;
}

- (_TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation)init
{
  result = (_TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_234551854(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler));
  sub_234551854(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider));
  sub_234557E1C((uint64_t)self + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_requestContext);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
}

@end