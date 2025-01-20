@interface BackgroundAssetTransparencySheetTaskHandleObserver
- (_TtC9appstoredP33_FD53C899C8A1CD94A26CE020D4F0482750BackgroundAssetTransparencySheetTaskHandleObserver)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation BackgroundAssetTransparencySheetTaskHandleObserver

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000C8678();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000C776C(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1000C79FC(v6, (uint64_t)a4);
}

- (_TtC9appstoredP33_FD53C899C8A1CD94A26CE020D4F0482750BackgroundAssetTransparencySheetTaskHandleObserver)init
{
  result = (_TtC9appstoredP33_FD53C899C8A1CD94A26CE020D4F0482750BackgroundAssetTransparencySheetTaskHandleObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC9appstoredP33_FD53C899C8A1CD94A26CE020D4F0482750BackgroundAssetTransparencySheetTaskHandleObserver_continuation;
  uint64_t v4 = sub_10001644C(&qword_1005A3C08);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9appstoredP33_FD53C899C8A1CD94A26CE020D4F0482750BackgroundAssetTransparencySheetTaskHandleObserver_logKey);
}

@end