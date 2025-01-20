@interface DynamicViewControllerDelegate
- (_TtC19AppStoreKitInternal29DynamicViewControllerDelegate)init;
- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
@end

@implementation DynamicViewControllerDelegate

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  v9 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_didDismissHandler);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  if (v9) {
    v9(a5);
  }
  else {
    id v13 = a5;
  }
  if (qword_1EBF295B8 != -1) {
    swift_once();
  }
  __swift_project_boxed_opaque_existential_1Tm(qword_1EBF646C0, qword_1EBF646D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36930);
  sub_1E1D59A58();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1E1D666B0;
  sub_1E1D59998();
  sub_1E1D5B508();

  swift_bridgeObjectRelease();
}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v11 = sub_1E1D5BCB8();
  v12 = *(uint64_t (**)(uint64_t, double, double, double, double))((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_contentViewConstructor);
  if (v12)
  {
    id v13 = a3;
    v14 = self;
    v15 = (void *)v12(v11, x, y, width, height);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = 0;
  }
  return v15;
}

- (_TtC19AppStoreKitInternal29DynamicViewControllerDelegate)init
{
  result = (_TtC19AppStoreKitInternal29DynamicViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_subscriptionManager));
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_purchaseSuccessHandler));
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_purchaseFailureHandler));
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_carrierLinkSuccessHandler));
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_carrierLinkFailureHandler));
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_didDismissHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_contentViewConstructor);
  sub_1E160EDD8(v3);
}

@end