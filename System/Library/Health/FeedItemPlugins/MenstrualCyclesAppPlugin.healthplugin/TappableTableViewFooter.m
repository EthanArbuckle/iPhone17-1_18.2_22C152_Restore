@interface TappableTableViewFooter
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter)initWithReuseIdentifier:(id)a3;
@end

@implementation TappableTableViewFooter

- (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter *)sub_241455B40(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_footerTextView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82D60]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_highlightedText);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_tapCompletion);
  void *v9 = nullsub_1;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter *)sub_241633038();
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
  LOBYTE(length) = sub_241456844((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23TappableTableViewFooter_footerTextView));
  swift_bridgeObjectRelease();

  swift_release();
}

@end