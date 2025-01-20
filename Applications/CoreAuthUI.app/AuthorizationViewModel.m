@interface AuthorizationViewModel
- (_TtC10CoreAuthUI22AuthorizationViewModel)init;
- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5;
- (void)biometricNoMatch;
- (void)biometryDidBecomeIdle;
@end

@implementation AuthorizationViewModel

- (_TtC10CoreAuthUI22AuthorizationViewModel)init
{
  result = (_TtC10CoreAuthUI22AuthorizationViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView;
  uint64_t v4 = sub_100028560(&qword_10009DFF0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused, v4);
  v6 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate;
  uint64_t v7 = sub_100028560(&qword_10009E008);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText;
  uint64_t v9 = sub_100028560(&qword_10009E020);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder;
  uint64_t v11 = sub_100028560(&qword_10009E030);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts;
  uint64_t v13 = sub_100028560(&qword_10009E040);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton, v4);
  sub_10002A998(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion));

  swift_bridgeObjectRelease();
  v14 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_log;
  uint64_t v15 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_unknownObjectRelease();

  sub_10002F0E8((uint64_t)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate);
  swift_bridgeObjectRelease();
  v16 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);

  sub_10004D2EC(v16);
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v10 = a4;
  id v8 = a5;
  uint64_t v9 = self;
  sub_10005F5A8((uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)biometricNoMatch
{
  v2 = self;
  sub_10005E3DC();
}

- (void)biometryDidBecomeIdle
{
  v2 = self;
  sub_10005E6E4();
}

@end