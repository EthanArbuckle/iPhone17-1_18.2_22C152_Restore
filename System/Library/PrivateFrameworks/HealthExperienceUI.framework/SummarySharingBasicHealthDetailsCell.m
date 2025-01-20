@interface SummarySharingBasicHealthDetailsCell
- (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell)initWithFrame:(CGRect)a3;
@end

@implementation SummarySharingBasicHealthDetailsCell

- (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell *)sub_1AD60E908(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell)initWithCoder:(id)a3
{
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell_basicHealthDetailsView);
  type metadata accessor for SummarySharingBasicHealthDetailsItem();
  swift_allocObject();
  id v6 = a3;
  sub_1AD60F38C();
  sub_1AD60F9D4();
  uint64_t *v5 = sub_1AD73DFD0();
  v5[1] = v7;

  result = (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end