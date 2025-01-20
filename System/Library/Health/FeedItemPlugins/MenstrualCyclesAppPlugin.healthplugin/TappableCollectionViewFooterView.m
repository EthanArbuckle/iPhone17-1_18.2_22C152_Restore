@interface TappableCollectionViewFooterView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView)initWithFrame:(CGRect)a3;
@end

@implementation TappableCollectionViewFooterView

- (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView;
  id v9 = objc_allocWithZone(MEMORY[0x263F82D60]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (Class *)((char *)&v10->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_highlightedText);
  void *v11 = 0;
  v11[1] = 0;
  v12 = (Class *)((char *)&v10->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_tapCompletion);
  void *v12 = nullsub_1;
  v12[1] = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for TappableCollectionViewFooterView();
  v13 = -[TappableCollectionViewFooterView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_2415FCE8C();

  return v13;
}

- (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82D60]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_highlightedText);
  *uint64_t v8 = 0;
  v8[1] = 0;
  id v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_tapCompletion);
  *id v9 = nullsub_1;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView *)sub_241633038();
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
  objc_super v15 = self;
  LOBYTE(length) = sub_2415FD888((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView));
  swift_bridgeObjectRelease();

  swift_release();
}

@end