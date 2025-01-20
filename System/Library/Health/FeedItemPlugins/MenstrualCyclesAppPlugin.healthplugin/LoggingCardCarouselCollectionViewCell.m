@interface LoggingCardCarouselCollectionViewCell
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LoggingCardCarouselCollectionViewCell

- (NSString)description
{
  v2 = self;
  sub_2412D51C0();

  v3 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2412D5A94(a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2412D5BDC((uint64_t)v4);
}

- (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *)sub_2412D6610(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell *)sub_2412D6738(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell_shadowView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LoggingCardCarouselCollectionViewCell_loggingCardViewController);
}

@end