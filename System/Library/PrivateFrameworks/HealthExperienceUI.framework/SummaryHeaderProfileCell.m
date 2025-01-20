@interface SummaryHeaderProfileCell
- (_TtC18HealthExperienceUI24SummaryHeaderProfileCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI24SummaryHeaderProfileCell)initWithFrame:(CGRect)a3;
@end

@implementation SummaryHeaderProfileCell

- (_TtC18HealthExperienceUI24SummaryHeaderProfileCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI24SummaryHeaderProfileCell *)SummaryHeaderProfileCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI24SummaryHeaderProfileCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI24SummaryHeaderProfileCell *)SummaryHeaderProfileCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SummaryHeaderProfileCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24SummaryHeaderProfileCell_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24SummaryHeaderProfileCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24SummaryHeaderProfileCell____lazy_storage___profileNameView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end