@interface SharingPausedCell
- (_TtC18HealthExperienceUI17SharingPausedCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI17SharingPausedCell)initWithFrame:(CGRect)a3;
@end

@implementation SharingPausedCell

- (_TtC18HealthExperienceUI17SharingPausedCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI17SharingPausedCell *)SharingPausedCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI17SharingPausedCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI17SharingPausedCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  id v6 = a3;

  result = (_TtC18HealthExperienceUI17SharingPausedCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17SharingPausedCell_tileView));
  sub_1AD207224((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI17SharingPausedCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870, MEMORY[0x1E4F66028]);
}

@end