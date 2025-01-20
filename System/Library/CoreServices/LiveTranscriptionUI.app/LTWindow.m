@interface LTWindow
+ (BOOL)_isSecure;
- (BOOL)_accessibilityIsIsolatedWindow;
- (_TtC19LiveTranscriptionUI8LTWindow)initWithCoder:(id)a3;
- (_TtC19LiveTranscriptionUI8LTWindow)initWithContentRect:(CGRect)a3;
- (_TtC19LiveTranscriptionUI8LTWindow)initWithFrame:(CGRect)a3;
- (_TtC19LiveTranscriptionUI8LTWindow)initWithWindowScene:(id)a3;
- (void)localeDidChangeWithNotification:(id)a3;
@end

@implementation LTWindow

- (_TtC19LiveTranscriptionUI8LTWindow)initWithWindowScene:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19LiveTranscriptionUI8LTWindow_screenshotsHidingChanged) = (Class)sub_10004AD48;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LTWindow();
  id v4 = a3;
  v5 = [(LTWindow *)&v7 initWithWindowScene:v4];
  sub_10004AA10();

  return v5;
}

- (_TtC19LiveTranscriptionUI8LTWindow)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19LiveTranscriptionUI8LTWindow_screenshotsHidingChanged) = (Class)sub_10004AD48;
  id v4 = a3;

  result = (_TtC19LiveTranscriptionUI8LTWindow *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (void)localeDidChangeWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = self;
  if (([v8 liveCaptionsSupported] & 1) == 0) {
    _AXSLiveTranscriptionSetEnabled();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19LiveTranscriptionUI8LTWindow)initWithFrame:(CGRect)a3
{
}

- (_TtC19LiveTranscriptionUI8LTWindow)initWithContentRect:(CGRect)a3
{
}

@end