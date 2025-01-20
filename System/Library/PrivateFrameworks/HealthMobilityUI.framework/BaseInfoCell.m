@interface BaseInfoCell
- (_TtC16HealthMobilityUI12BaseInfoCell)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI12BaseInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BaseInfoCell

- (_TtC16HealthMobilityUI12BaseInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC16HealthMobilityUI12BaseInfoCell *)sub_1E0AFFEC0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1E0AFF110);
}

- (_TtC16HealthMobilityUI12BaseInfoCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E0B00118();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail);
}

@end