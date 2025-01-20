@interface ArcadeFooterCollectionViewCell
- (_TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
- (void)didTapFootnoteWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ArcadeFooterCollectionViewCell

- (_TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell *)sub_427B04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_42A074();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4289B0();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_42A6A0();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_FE2C(0, (unint64_t *)&qword_952AA0);
  sub_63D00();
  uint64_t v6 = sub_77DA40();
  id v7 = a4;
  v8 = self;
  sub_429204(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_FE2C(0, (unint64_t *)&qword_952AA0);
  sub_63D00();
  sub_77DA40();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_footnoteView);
  *(unsigned char *)(v6 + OBJC_IVAR____TtC18ASMessagesProvider12FootnoteView_isHighlighted) = 0;
  uint64_t v7 = qword_94D888;
  id v8 = a4;
  v9 = self;
  if (v7 != -1) {
    swift_once();
  }
  [*(id *)(v6 + OBJC_IVAR____TtC18ASMessagesProvider12FootnoteView_textLabel) setTextColor:qword_958270];
  Class isa = sub_77DA30().super.isa;
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell();
  [(ArcadeFooterCollectionViewCell *)&v11 touchesEnded:isa withEvent:v8];

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_footnoteView));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_footnoteActionBlock));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_buttonActionBlock));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30ArcadeFooterCollectionViewCell_metrics, (uint64_t *)&unk_95C170);
}

@end