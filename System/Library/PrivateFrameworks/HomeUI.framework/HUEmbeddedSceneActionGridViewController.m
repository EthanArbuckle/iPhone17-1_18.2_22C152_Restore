@interface HUEmbeddedSceneActionGridViewController
- (HUEmbeddedSceneActionGridViewController)initWithActionSetBuilder:(id)a3;
- (HUEmbeddedSceneActionGridViewControllerDelegate)sceneActionGridDelegate;
- (void)setSceneActionGridDelegate:(id)a3;
@end

@implementation HUEmbeddedSceneActionGridViewController

- (HUEmbeddedSceneActionGridViewControllerDelegate)sceneActionGridDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUEmbeddedSceneActionGridViewControllerDelegate *)v2;
}

- (void)setSceneActionGridDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUEmbeddedSceneActionGridViewController_sceneActionGridDelegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUEmbeddedSceneActionGridViewController)initWithActionSetBuilder:(id)a3
{
  return (HUEmbeddedSceneActionGridViewController *)EmbeddedSceneActionGridViewController.init(actionSetBuilder:)(a3);
}

- (void).cxx_destruct
{
}

@end