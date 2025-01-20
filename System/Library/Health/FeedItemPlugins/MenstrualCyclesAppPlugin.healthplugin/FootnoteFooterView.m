@interface FootnoteFooterView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView)initWithReuseIdentifier:(id)a3;
@end

@implementation FootnoteFooterView

- (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView)initWithReuseIdentifier:(id)a3
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
  return (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView *)sub_2412DD960(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin18FootnoteFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2412DEA54();
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
  LOBYTE(length) = sub_2412DEB40((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FootnoteFooterView_footerTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18FootnoteFooterView_headerSeparator));
  swift_bridgeObjectRelease();

  swift_release();
}

@end