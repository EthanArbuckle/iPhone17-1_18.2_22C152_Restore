@interface SenderCell
- (GKDashboardPlayerPhotoView)playerAvatarView;
- (UIImageView)gameCenterPhoto;
- (UILabel)gameCenterLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (_TtC26GameCenterMessageExtension10SenderCell)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension10SenderCell)initWithFrame:(CGRect)a3;
- (void)setGameCenterLabel:(id)a3;
- (void)setGameCenterPhoto:(id)a3;
- (void)setPlayerAvatarView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SenderCell

- (UILabel)titleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (GKDashboardPlayerPhotoView *)Strong;
}

- (void)setPlayerAvatarView:(id)a3
{
}

- (UILabel)gameCenterLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setGameCenterLabel:(id)a3
{
}

- (UIImageView)gameCenterPhoto
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIImageView *)Strong;
}

- (void)setGameCenterPhoto:(id)a3
{
}

- (_TtC26GameCenterMessageExtension10SenderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SenderCell();
  return -[SenderCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension10SenderCell)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension10SenderCell *)sub_10001290C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end