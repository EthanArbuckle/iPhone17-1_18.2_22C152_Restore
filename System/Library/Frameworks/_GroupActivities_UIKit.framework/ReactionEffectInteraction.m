@interface ReactionEffectInteraction
- (UIView)view;
- (_TtC22_GroupActivities_UIKit25ReactionEffectInteraction)init;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation ReactionEffectInteraction

- (UIView)view
{
  v2 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction_view;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230F80B10](v2);

  return (UIView *)v3;
}

- (void)setView:(id)a3
{
}

- (_TtC22_GroupActivities_UIKit25ReactionEffectInteraction)init
{
  return (_TtC22_GroupActivities_UIKit25ReactionEffectInteraction *)ReactionEffectInteraction.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction__reaction;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Reaction?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction__presentationContext);
  v6 = *(void **)&self->_anon_0[OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction__presentationContext];

  outlined consume of ReactionEffectInteraction.PresentationContext?(v5, v6);
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized ReactionEffectInteraction.willMove(to:)();
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  ReactionEffectInteraction.didMove(to:)((UIView_optional *)a3);
}

@end