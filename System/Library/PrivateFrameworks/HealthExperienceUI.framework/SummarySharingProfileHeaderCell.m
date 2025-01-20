@interface SummarySharingProfileHeaderCell
- (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation SummarySharingProfileHeaderCell

- (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell *)sub_1AD32E868(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell)initWithCoder:(id)a3
{
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18HealthExperienceUI31SummarySharingProfileHeaderCell_sharingProfileView);
  type metadata accessor for SummarySharingProfileHeaderItem();
  swift_allocObject();
  id v6 = a3;
  sub_1AD32FF80();
  sub_1AD330BC0(&qword_1E9A2C528, (void (*)(uint64_t))type metadata accessor for SummarySharingProfileHeaderItem);
  uint64_t *v5 = sub_1AD73DFD0();
  v5[1] = v7;

  result = (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end