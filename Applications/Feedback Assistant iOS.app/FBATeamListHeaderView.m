@interface FBATeamListHeaderView
+ (NSString)reuseIdentifier;
- (UILabel)teamNameLabel;
- (UILabel)teamTypeLabel;
- (_TtC18Feedback_Assistant21FBATeamListHeaderView)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant21FBATeamListHeaderView)initWithFrame:(CGRect)a3;
- (void)configureForTeam:(id)a3;
- (void)hide;
- (void)setTeamNameLabel:(id)a3;
- (void)setTeamTypeLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FBATeamListHeaderView

+ (NSString)reuseIdentifier
{
  if (qword_100121E30 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UILabel)teamNameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel));
}

- (void)setTeamNameLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)teamTypeLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel));
}

- (void)setTeamTypeLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC18Feedback_Assistant21FBATeamListHeaderView)initWithFrame:(CGRect)a3
{
  sub_10008E600(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008F224();
}

- (_TtC18Feedback_Assistant21FBATeamListHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_stackView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBATeamListHeaderView();
  return [(FBATeamListHeaderView *)&v5 initWithCoder:a3];
}

- (void)configureForTeam:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10008EE8C(v4);
}

- (void)hide
{
  NSString v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_stackView);
  if (v2) {
    [v2 setHidden:1];
  }
  else {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_stackView);
}

@end