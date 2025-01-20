@interface HomePodSetupProgressBarView
- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithCardStyle:(int64_t)a3;
- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithCoder:(id)a3;
- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation HomePodSetupProgressBarView

- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithCardStyle:(int64_t)a3
{
  return (_TtC14HDSViewService27HomePodSetupProgressBarView *)sub_10008F924(a3);
}

- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100090E0C();
}

- (void)updateConstraints
{
  v2 = self;
  sub_10008FCFC();
}

- (_TtC14HDSViewService27HomePodSetupProgressBarView)initWithFrame:(CGRect)a3
{
  result = (_TtC14HDSViewService27HomePodSetupProgressBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC14HDSViewService27HomePodSetupProgressBarView_bodyLabel];
}

@end