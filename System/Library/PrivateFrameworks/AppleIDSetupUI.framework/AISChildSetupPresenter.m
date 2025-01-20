@interface AISChildSetupPresenter
- (AISChildSetupPresenter)init;
- (AISChildSetupPresenterDelegate)delegate;
- (AISChildSetupStoreProtocol)childSetupStore;
- (AISViewControllerPresentationHandlerProtocol)presentationHandler;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setPresentationHandler:(id)a3;
- (void)startFlowWithViewControllerPresentationHandler:(id)a3;
@end

@implementation AISChildSetupPresenter

- (AISChildSetupPresenterDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___AISChildSetupPresenter_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24C579D50](v2);
  return (AISChildSetupPresenterDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (AISViewControllerPresentationHandlerProtocol)presentationHandler
{
  return (AISViewControllerPresentationHandlerProtocol *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR___AISChildSetupPresenter_presentationHandler));
}

- (void)setPresentationHandler:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISChildSetupPresenter_presentationHandler);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISChildSetupPresenter_presentationHandler) = (Class)a3;
  id v3 = a3;
}

- (AISChildSetupStoreProtocol)childSetupStore
{
  v2 = (void *)swift_unknownObjectRetain();
  return (AISChildSetupStoreProtocol *)v2;
}

- (AISChildSetupPresenter)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone((Class)sub_24835C2E8()), sel_init);
  sub_24835BAE8();
  uint64_t v4 = sub_24835BAD8();
  sub_24835C598();
  uint64_t v5 = sub_24835C588();
  sub_24835C2D8();
  swift_allocObject();
  uint64_t v6 = sub_24835C2C8();
  sub_24835C4F8();
  swift_allocObject();
  uint64_t v7 = sub_24835C4E8();
  v8 = (AISChildSetupPresenter *)sub_248340430(v3, v4, v5, v6, v7, (char *)objc_allocWithZone(ObjectType));

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)startFlowWithViewControllerPresentationHandler:(id)a3
{
  swift_getObjectType();
  id v5 = a3;
  uint64_t v6 = self;
  sub_2483401DC(v5, (uint64_t)v6);
}

- (void)dealloc
{
  v2 = self;
  AISChildSetupPresenter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_2482C3D88((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_delegate);

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_analytics);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_biome);
  id v3 = (char *)self + OBJC_IVAR___AISChildSetupPresenter_familyCircleProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end