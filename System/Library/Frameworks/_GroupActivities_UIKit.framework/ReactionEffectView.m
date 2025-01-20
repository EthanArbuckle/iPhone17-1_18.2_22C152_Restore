@interface ReactionEffectView
- (_TtC22_GroupActivities_UIKit18ReactionEffectView)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit18ReactionEffectView)initWithFrame:(CGRect)a3;
@end

@implementation ReactionEffectView

- (_TtC22_GroupActivities_UIKit18ReactionEffectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionEffectView_reactions) = (Class)MEMORY[0x263F8EE88];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReactionEffectView();
  return -[ReactionEffectView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC22_GroupActivities_UIKit18ReactionEffectView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionEffectView_reactions) = (Class)MEMORY[0x263F8EE88];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ReactionEffectView();
  return [(ReactionEffectView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end