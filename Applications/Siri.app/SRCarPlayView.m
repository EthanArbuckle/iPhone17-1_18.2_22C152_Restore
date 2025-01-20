@interface SRCarPlayView
- (_TtC4Siri13SRCarPlayView)initWithCoder:(id)a3;
- (_TtC4Siri13SRCarPlayView)initWithFrame:(CGRect)a3;
- (void)didTapToDismissWithSender:(id)a3;
@end

@implementation SRCarPlayView

- (_TtC4Siri13SRCarPlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B1A88();
}

- (void)didTapToDismissWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000B14B4(v4);
}

- (_TtC4Siri13SRCarPlayView)initWithFrame:(CGRect)a3
{
  result = (_TtC4Siri13SRCarPlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10007E630((uint64_t)self + OBJC_IVAR____TtC4Siri13SRCarPlayView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView);
}

@end