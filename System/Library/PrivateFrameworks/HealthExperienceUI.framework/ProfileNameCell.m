@interface ProfileNameCell
- (_TtC18HealthExperienceUI15ProfileNameCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI15ProfileNameCell)initWithFrame:(CGRect)a3;
@end

@implementation ProfileNameCell

- (_TtC18HealthExperienceUI15ProfileNameCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI15ProfileNameCell *)ProfileNameCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI15ProfileNameCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI15ProfileNameCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameCell_profileNameView));
  sub_1AD2071C4((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameCell_item, (uint64_t)&qword_1EB73E880, (uint64_t)&qword_1EB73E870, MEMORY[0x1E4F66028], (uint64_t (*)(void))sub_1AD1DE498);
}

@end