@interface AllMetricsViewCell
- (BOOL)isHighlighted;
- (_TtC13FTMInternal_418AllMetricsViewCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_418AllMetricsViewCell)initWithFrame:(CGRect)a3;
- (void)didTapActivityIndicator;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AllMetricsViewCell

- (_TtC13FTMInternal_418AllMetricsViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_418AllMetricsViewCell *)sub_100175F60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_418AllMetricsViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10017B49C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100176AFC();
}

- (void)prepareForReuse
{
}

- (void)didTapActivityIndicator
{
  id v3 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  v4 = self;
  id v5 = [v3 initWithStyle:1];
  [v5 impactOccurred];
}

- (BOOL)isHighlighted
{
  return sub_10017B094(self, (uint64_t)a2, type metadata accessor for AllMetricsViewCell);
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_10017B164(a3, type metadata accessor for AllMetricsViewCell, (uint64_t)&unk_10028BFC8, (uint64_t)sub_10017B608, (uint64_t)&unk_10028BFE0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell_container));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___metricNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___metricAvailabilityLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___activityIndicatorButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell____lazy_storage___bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell_timestampHiddenConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_418AllMetricsViewCell_timestampVisibleConstraint);
}

@end