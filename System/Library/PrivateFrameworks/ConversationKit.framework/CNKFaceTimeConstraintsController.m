@interface CNKFaceTimeConstraintsController
- (CNKFaceTimeConstraintsController)init;
- (int64_t)inCallControlsState;
- (int64_t)localParticipantState;
- (void)removeEffectsConstraints;
- (void)setInCallControlsState:(int64_t)a3;
- (void)setLocalParticipantState:(int64_t)a3;
- (void)updateConstraintsWith:(id)a3 controlsViewController:(id)a4 localParticipantView:(id)a5 effectsView:(id)a6 effectsBrowserViewController:(id)a7;
- (void)updateFor:(CGRect)a3 deviceOrientation:(int64_t)a4;
@end

@implementation CNKFaceTimeConstraintsController

- (int64_t)localParticipantState
{
  return MultiwayViewConstraintsController.accessibilityLocalParticipantState.getter();
}

- (void)setLocalParticipantState:(int64_t)a3
{
  v4 = self;
  MultiwayViewConstraintsController.accessibilityLocalParticipantState.setter(a3);
}

- (int64_t)inCallControlsState
{
  return MultiwayViewConstraintsController.inCallControlsState.getter();
}

- (void)setInCallControlsState:(int64_t)a3
{
  v4 = self;
  MultiwayViewConstraintsController.inCallControlsState.setter(a3);
}

- (void)updateFor:(CGRect)a3 deviceOrientation:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = self;
  MultiwayViewConstraintsController.update(for:deviceOrientation:)(a4, x, y, width, height);
}

- (void)removeEffectsConstraints
{
  v2 = self;
  MultiwayViewConstraintsController.removeEffectsConstraints()();
}

- (void)updateConstraintsWith:(id)a3 controlsViewController:(id)a4 localParticipantView:(id)a5 effectsView:(id)a6 effectsBrowserViewController:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  MultiwayViewConstraintsController.updateConstraints(with:controlsViewController:localParticipantView:effectsView:effectsBrowserViewController:)((uint64_t)v12, v13, (uint64_t)a5, a6, a7);
}

- (CNKFaceTimeConstraintsController)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___CNKFaceTimeConstraintsController_viewControllerLayout);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CNKFaceTimeConstraintsController_bannerControlsWidthConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CNKFaceTimeConstraintsController_bannerControlsHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CNKFaceTimeConstraintsController_configurableRosterCellWidthConstraint));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNKFaceTimeConstraintsController_bannerDodgingLayoutGuide);
}

@end