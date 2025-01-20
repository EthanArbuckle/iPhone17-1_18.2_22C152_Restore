@interface ResultItemView
- (_TtC5Heart14ResultItemView)initWithCoder:(id)a3;
- (_TtC5Heart14ResultItemView)initWithFrame:(CGRect)a3;
- (void)learnMoreButtonTapped;
@end

@implementation ResultItemView

- (_TtC5Heart14ResultItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_240B47064();
}

- (void)learnMoreButtonTapped
{
  v2 = self;
  id v3 = sub_240B45958();
  objc_msgSend(v3, sel_setHidden_, 0);

  id v4 = sub_240B45A1C();
  objc_msgSend(v4, sel_setHidden_, 1);
}

- (_TtC5Heart14ResultItemView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___itemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___bodyStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart14ResultItemView____lazy_storage___stackView));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end