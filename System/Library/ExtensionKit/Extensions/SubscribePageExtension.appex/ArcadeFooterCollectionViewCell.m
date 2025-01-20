@interface ArcadeFooterCollectionViewCell
- (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
- (void)didTapFootnoteWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ArcadeFooterCollectionViewCell

- (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *)sub_100589464(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10058B904();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10058A310();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10058BF30();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_10001A860(0, (unint64_t *)&qword_10093B030);
  sub_100078CDC();
  uint64_t v6 = sub_1007679B0();
  id v7 = a4;
  v8 = self;
  sub_10058AB64(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_10001A860(0, (unint64_t *)&qword_10093B030);
  sub_100078CDC();
  sub_1007679B0();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteView);
  *(unsigned char *)(v6 + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_isHighlighted) = 0;
  uint64_t v7 = qword_100930670;
  id v8 = a4;
  v9 = self;
  if (v7 != -1) {
    swift_once();
  }
  [*(id *)(v6 + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLabel) setTextColor:qword_10093AED8];
  Class isa = sub_1007679A0().super.isa;
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell();
  [(ArcadeFooterCollectionViewCell *)&v11 touchesEnded:isa withEvent:v8];

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteActionBlock));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_metrics, &qword_100951008);
}

@end