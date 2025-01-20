@interface ProfileAvatarImageCell
- (_TtC18HealthExperienceUI22ProfileAvatarImageCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22ProfileAvatarImageCell)initWithFrame:(CGRect)a3;
@end

@implementation ProfileAvatarImageCell

- (_TtC18HealthExperienceUI22ProfileAvatarImageCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22ProfileAvatarImageCell *)ProfileAvatarImageCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22ProfileAvatarImageCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI22ProfileAvatarImageCell *)ProfileAvatarImageCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_bottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_topAnchorConstraint));
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

@end