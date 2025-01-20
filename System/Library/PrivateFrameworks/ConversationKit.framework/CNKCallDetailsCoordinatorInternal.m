@interface CNKCallDetailsCoordinatorInternal
- (BOOL)isCaptioningEnabled;
- (BOOL)shouldHideViewsFromScreenSharing;
- (CNKCallDetailsCoordinatorInternal)init;
- (CNKCallDetailsCoordinatorInternal)initWithHostViewController:(id)a3 controlsManager:(id)a4 deferredPresentationManager:(id)a5;
- (void)setShouldHideViewsFromScreenSharing:(BOOL)a3;
- (void)startWithReason:(id)a3;
- (void)stopWithReason:(id)a3;
- (void)wantsDismissal;
@end

@implementation CNKCallDetailsCoordinatorInternal

- (BOOL)isCaptioningEnabled
{
  v2 = self;
  unsigned __int8 v3 = CallDetailsCoordinator.isCaptioningEnabled.getter();

  return v3 & 1;
}

- (BOOL)shouldHideViewsFromScreenSharing
{
  return CallDetailsCoordinator.shouldHideViewsFromScreenSharing.getter() & 1;
}

- (void)setShouldHideViewsFromScreenSharing:(BOOL)a3
{
  v4 = self;
  CallDetailsCoordinator.shouldHideViewsFromScreenSharing.setter(a3);
}

- (CNKCallDetailsCoordinatorInternal)initWithHostViewController:(id)a3 controlsManager:(id)a4 deferredPresentationManager:(id)a5
{
  swift_getObjectType();
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();
  return (CNKCallDetailsCoordinatorInternal *)specialized CallDetailsCoordinator.init(hostViewController:controlsManager:deferredPresentationManager:)(v9, v10, (uint64_t)a5, self);
}

- (void)startWithReason:(id)a3
{
}

- (void)stopWithReason:(id)a3
{
}

- (void)wantsDismissal
{
  v2 = self;
  CallDetailsCoordinator.wantsDismissal()();
}

- (CNKCallDetailsCoordinatorInternal)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  outlined destroy of unowned CNKCallDetailsDeferredPresentationManager((uint64_t)self + OBJC_IVAR___CNKCallDetailsCoordinatorInternal_deferredPresentationManager);
  swift_unknownObjectUnownedDestroy();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNKCallDetailsCoordinatorInternal_detailsNavigationController);
}

@end