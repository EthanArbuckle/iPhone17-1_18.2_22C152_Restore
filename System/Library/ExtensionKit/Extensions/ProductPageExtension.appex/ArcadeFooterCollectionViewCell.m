@interface ArcadeFooterCollectionViewCell
- (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
- (void)didTapFootnoteWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ArcadeFooterCollectionViewCell

- (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *)sub_10036EA34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100370E8C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10036F8E0();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003714B8();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100019840(0, (unint64_t *)&qword_100958EF0);
  sub_100284B04();
  uint64_t v6 = sub_10077C080();
  id v7 = a4;
  v8 = self;
  sub_100370134(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100019840(0, (unint64_t *)&qword_100958EF0);
  sub_100284B04();
  sub_10077C080();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteView);
  *(unsigned char *)(v6 + OBJC_IVAR____TtC20ProductPageExtension12FootnoteView_isHighlighted) = 0;
  uint64_t v7 = qword_100947DA8;
  id v8 = a4;
  v9 = self;
  if (v7 != -1) {
    swift_once();
  }
  [*(id *)(v6 + OBJC_IVAR____TtC20ProductPageExtension12FootnoteView_textLabel) setTextColor:qword_1009527E8];
  Class isa = sub_10077C070().super.isa;
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell();
  [(ArcadeFooterCollectionViewCell *)&v11 touchesEnded:isa withEvent:v8];

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteActionBlock));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_metrics, (uint64_t *)&unk_10095DA88);
}

@end