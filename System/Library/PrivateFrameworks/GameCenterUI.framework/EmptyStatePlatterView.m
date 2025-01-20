@interface EmptyStatePlatterView
- (_TtC12GameCenterUI21EmptyStatePlatterView)initWithCoder:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EmptyStatePlatterView

- (_TtC12GameCenterUI21EmptyStatePlatterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3F6570();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF3F69AC((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21EmptyStatePlatterView_arcadeImage));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI21EmptyStatePlatterView_emptyStateView);
}

@end