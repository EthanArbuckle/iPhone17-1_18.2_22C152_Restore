@interface FitnessPlusCell
- (BOOL)isHighlighted;
- (_TtC17MobilityAppPlugin15FitnessPlusCell)initWithCoder:(id)a3;
- (_TtC17MobilityAppPlugin15FitnessPlusCell)initWithFrame:(CGRect)a3;
- (void)linkButtonPressed;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation FitnessPlusCell

- (_TtC17MobilityAppPlugin15FitnessPlusCell)initWithFrame:(CGRect)a3
{
  return (_TtC17MobilityAppPlugin15FitnessPlusCell *)sub_24171B258(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17MobilityAppPlugin15FitnessPlusCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24171D880();
}

- (void)linkButtonPressed
{
  v2 = self;
  sub_24171C474();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay));
  swift_bridgeObjectRelease();
  sub_24171D638((uint64_t)self + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton);
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessPlusCell();
  return [(FitnessPlusCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FitnessPlusCell();
  id v4 = v6.receiver;
  [(FitnessPlusCell *)&v6 setHighlighted:v3];
  objc_msgSend(v4, sel_isHighlighted);
  objc_msgSend(v4, sel_isHighlighted);
  sub_24171D81C(&qword_268D24E38, v5, (void (*)(uint64_t))type metadata accessor for FitnessPlusCell);
  sub_24171E608();
}

@end