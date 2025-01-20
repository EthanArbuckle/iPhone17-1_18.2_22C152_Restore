@interface GameModeButton
- (_TtC13GameOverlayUI14GameModeButton)initWithCoder:(id)a3;
- (_TtC13GameOverlayUI14GameModeButton)initWithFrame:(CGRect)a3;
- (void)accessibilityElementDidLoseFocus;
@end

@implementation GameModeButton

- (void)accessibilityElementDidLoseFocus
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    sub_10007B938(1.0);
  }
}

- (_TtC13GameOverlayUI14GameModeButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GameModeButton();
  return -[GameModeButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC13GameOverlayUI14GameModeButton)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GameModeButton();
  return [(GameModeButton *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end