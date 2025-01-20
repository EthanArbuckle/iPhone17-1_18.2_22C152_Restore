@interface _LiveSpeechTextView
- (_TtC19LiveSpeechUIService19_LiveSpeechTextView)initWithCoder:(id)a3;
- (_TtC19LiveSpeechUIService19_LiveSpeechTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)layoutSubviews;
@end

@implementation _LiveSpeechTextView

- (_TtC19LiveSpeechUIService19_LiveSpeechTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView_lastReplayCancellable) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView____lazy_storage___textViewForSizing) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView____lazy_storage___placeholderOverlayLabel) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView_mode) = 0;
  id v4 = a3;

  result = (_TtC19LiveSpeechUIService19_LiveSpeechTextView *)sub_A7730();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5FDD4();
}

- (_TtC19LiveSpeechUIService19_LiveSpeechTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC19LiveSpeechUIService19_LiveSpeechTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView_store));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView_placeholderText));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView____lazy_storage___textViewForSizing));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC19LiveSpeechUIService19_LiveSpeechTextView____lazy_storage___placeholderOverlayLabel);
}

@end