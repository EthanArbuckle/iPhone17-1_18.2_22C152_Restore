@interface FakeAppleConnectAuthenticator
- (_TtC15ImagePlaygroundP33_D269C10191F2B449B931B82A2B76F81C29FakeAppleConnectAuthenticator)init;
- (void)authenticateIfNeededWithCompletion:(id)a3;
@end

@implementation FakeAppleConnectAuthenticator

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  v4 = (void (**)(void *, void *, void))_Block_copy(a3);
  v6 = self;
  v5 = (void *)sub_2443BA4B0();
  v4[2](v4, v5, 0);

  _Block_release(v4);
}

- (_TtC15ImagePlaygroundP33_D269C10191F2B449B931B82A2B76F81C29FakeAppleConnectAuthenticator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FakeAppleConnectAuthenticator *)&v3 init];
}

@end