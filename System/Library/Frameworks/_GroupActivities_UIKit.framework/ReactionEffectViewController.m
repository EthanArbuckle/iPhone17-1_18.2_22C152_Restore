@interface ReactionEffectViewController
- (_TtC22_GroupActivities_UIKit28ReactionEffectViewController)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit28ReactionEffectViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ReactionEffectViewController

- (void)loadView
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22_GroupActivities_UIKit28ReactionEffectViewController_effectView);
  v3 = self;
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0);
  [(ReactionEffectViewController *)v3 setView:v2];
}

- (_TtC22_GroupActivities_UIKit28ReactionEffectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22_GroupActivities_UIKit28ReactionEffectViewController *)ReactionEffectViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC22_GroupActivities_UIKit28ReactionEffectViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22_GroupActivities_UIKit28ReactionEffectViewController_effectView;
  type metadata accessor for ReactionEffectView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  id v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for ReactionEffectViewController();
  v9 = [(ReactionEffectViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit28ReactionEffectViewController_effectView));
}

@end