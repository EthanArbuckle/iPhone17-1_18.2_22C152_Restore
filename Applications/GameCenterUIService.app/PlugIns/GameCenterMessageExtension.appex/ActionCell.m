@interface ActionCell
- (GKDashboardPlayerPhotoView)playerAvatarView;
- (UILabel)actionLabel;
- (UIVisualEffectView)effectsView;
- (_TtC26GameCenterMessageExtension10ActionCell)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension10ActionCell)initWithFrame:(CGRect)a3;
- (void)setActionLabel:(id)a3;
- (void)setEffectsView:(id)a3;
- (void)setPlayerAvatarView:(id)a3;
@end

@implementation ActionCell

- (UILabel)actionLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setActionLabel:(id)a3
{
}

- (UIVisualEffectView)effectsView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIVisualEffectView *)Strong;
}

- (void)setEffectsView:(id)a3
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

- (_TtC26GameCenterMessageExtension10ActionCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ActionCell();
  return -[ActionCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension10ActionCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionCell();
  return [(ActionCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end