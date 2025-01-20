@interface DataTypeNoDataAvailableCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation DataTypeNoDataAvailableCell

- (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell *)DataTypeNoDataAvailableCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD4BFE84();
}

- (BOOL)isHighlighted
{
  return sub_1AD4BEB6C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isSelected
{
  return sub_1AD4BEB6C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeNoDataAvailableCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeNoDataAvailableCell_mainTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeNoDataAvailableCell_disclosure));
  swift_bridgeObjectRelease();
}

@end