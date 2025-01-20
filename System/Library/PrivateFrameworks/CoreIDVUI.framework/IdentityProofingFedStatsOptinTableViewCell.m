@interface IdentityProofingFedStatsOptinTableViewCell
- (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setupBackgroundColor;
@end

@implementation IdentityProofingFedStatsOptinTableViewCell

- (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_21F5515A0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell *)sub_21F4BD864(a3, (uint64_t)a4, v6);
}

- (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F4BEAB4();
}

- (void)setupBackgroundColor
{
  v2 = self;
  sub_21F4BDD78();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_bulletList));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_divider));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_checkmarkImageView);
}

@end