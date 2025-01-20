@interface LearnMoreFooterTextView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView)initWithFrame:(CGRect)a3;
@end

@implementation LearnMoreFooterTextView

- (_TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView *)sub_2411F4934(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView____lazy_storage___textView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView_text);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView_highlightedText);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView_tapCompletion);
  void *v6 = nullsub_1;
  v6[1] = 0;
  id v7 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length = a5.length;
  location = (void *)a5.location;
  uint64_t v10 = sub_24162B468();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162B438();
  id v14 = a3;
  v15 = self;
  LOBYTE(length) = sub_2411F5288((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreFooterTextView____lazy_storage___textView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end