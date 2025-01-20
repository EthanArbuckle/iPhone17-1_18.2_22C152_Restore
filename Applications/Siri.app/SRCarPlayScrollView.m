@interface SRCarPlayScrollView
- (NSArray)preferredFocusEnvironments;
- (_TtC4Siri19SRCarPlayScrollView)initWithCoder:(id)a3;
- (_TtC4Siri19SRCarPlayScrollView)initWithFrame:(CGRect)a3;
@end

@implementation SRCarPlayScrollView

- (_TtC4Siri19SRCarPlayScrollView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10009EA48();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_10009E73C();

  sub_10007D3B4(&qword_100171660);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC4Siri19SRCarPlayScrollView)initWithFrame:(CGRect)a3
{
  result = (_TtC4Siri19SRCarPlayScrollView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint));
  NSArray v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint);
}

@end