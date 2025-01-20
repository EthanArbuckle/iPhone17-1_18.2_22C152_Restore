@interface AppStoreOverlayCoordinator
- (_TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator)init;
- (void)dealloc;
- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4;
- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4;
- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4;
@end

@implementation AppStoreOverlayCoordinator

- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22EBB3D00();
}

- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_22EBB3E74();
}

- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_22EBB3E74();
}

- (void)dealloc
{
  v2 = self;
  sub_22EBB3F84();
}

- (void).cxx_destruct
{
  sub_22EB86650(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator_isPresented), *(void *)&self->isPresented[OBJC_IVAR____TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator_isPresented]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator_overlay));

  swift_unknownObjectWeakDestroy();
}

- (_TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator)init
{
  return (_TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator *)sub_22EBB40A4();
}

@end