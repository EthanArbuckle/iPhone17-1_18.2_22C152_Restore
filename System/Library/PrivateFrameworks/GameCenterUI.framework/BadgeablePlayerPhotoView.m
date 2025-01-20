@interface BadgeablePlayerPhotoView
- (_TtC12GameCenterUI24BadgeablePlayerPhotoView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI24BadgeablePlayerPhotoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BadgeablePlayerPhotoView

- (_TtC12GameCenterUI24BadgeablePlayerPhotoView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI24BadgeablePlayerPhotoView *)sub_1AF6537B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF653C94();
}

- (_TtC12GameCenterUI24BadgeablePlayerPhotoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF653D70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24BadgeablePlayerPhotoView_photoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24BadgeablePlayerPhotoView_badgeContainerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI24BadgeablePlayerPhotoView_badgeLabel);
}

@end