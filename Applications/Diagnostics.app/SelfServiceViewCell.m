@interface SelfServiceViewCell
- (CGSize)intrinsicContentSize;
- (_TtC11Diagnostics19SelfServiceViewCell)initWithCoder:(id)a3;
- (_TtC11Diagnostics19SelfServiceViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SelfServiceViewCell

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_100091E40();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC11Diagnostics19SelfServiceViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC11Diagnostics19SelfServiceViewCell *)sub_100091F60(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics19SelfServiceViewCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics19SelfServiceViewCell *)sub_1000922B8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_descriptionStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleLabel));
  swift_bridgeObjectRelease();
  CGFloat v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_learnMoreLabel);
}

@end