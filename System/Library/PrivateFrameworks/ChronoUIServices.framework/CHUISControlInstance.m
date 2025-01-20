@interface CHUISControlInstance
- (CHSControlDescriptor)descriptor;
- (CHSControlIdentity)control;
- (CHSControlInstanceIdentity)instanceIdentity;
- (CHUISControlIconView)iconView;
- (CHUISControlInstance)init;
- (CHUISControlInstance)initWithControl:(id)a3;
- (CHUISControlInstance)initWithControl:(id)a3 contentType:(unint64_t)a4;
- (CHUISControlInstance)initWithInstanceIdentity:(id)a3;
- (CHUISControlInstanceConfiguration)configuration;
- (CHUISControlInstanceDelegate)delegate;
- (NSString)title;
- (UIColor)tintColor;
- (unint64_t)contentType;
- (unint64_t)visibility;
- (void)activate;
- (void)invalidate;
- (void)modifyConfiguration:(id)a3;
- (void)performControlActionWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CHUISControlInstance

- (CHSControlInstanceIdentity)instanceIdentity
{
  return (CHSControlInstanceIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___CHUISControlInstance_instanceIdentity));
}

- (CHSControlIdentity)control
{
  v2 = self;
  v3 = [(CHUISControlInstance *)v2 instanceIdentity];
  id v4 = [(CHSControlInstanceIdentity *)v3 control];

  return (CHSControlIdentity *)v4;
}

- (unint64_t)contentType
{
  v2 = self;
  v3 = [(CHUISControlInstance *)v2 instanceIdentity];
  id v4 = [(CHSControlInstanceIdentity *)v3 contentType];

  return (unint64_t)v4;
}

- (unint64_t)visibility
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___CHUISControlInstance_visibility);
  swift_beginAccess();
  return *v2;
}

- (void)setVisibility:(unint64_t)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR___CHUISControlInstance_visibility);
  swift_beginAccess();
  unint64_t *v5 = a3;
  v6 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  uint64_t v7 = *((void *)v6 + 3);
  uint64_t v8 = *((void *)v6 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  v9 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 88);
  v10 = self;
  v9(a3, v7, v8);
  swift_endAccess();
}

- (CHUISControlInstanceConfiguration)configuration
{
  void (*v6)(void *__return_ptr, uint64_t, uint64_t);
  CHUISControlInstance *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void v16[2];
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t vars8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance__adapter);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 56);
  uint64_t v7 = self;
  v6(v16, v4, v5);
  LOBYTE(v5) = v16[0];
  uint64_t v8 = BYTE1(v16[0]);
  v9 = v16[1];
  v10 = v17;
  v11 = v18;
  v12 = v19;
  swift_endAccess();
  v13 = (char *)objc_msgSend(objc_allocWithZone((Class)CHUISControlInstanceConfiguration), sel_init);
  v14 = &v13[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  *v14 = v5;
  v14[1] = v8;
  *((void *)v14 + 1) = v9;
  v14[16] = v10;
  *((void *)v14 + 3) = v11;
  *((void *)v14 + 4) = v12;

  swift_bridgeObjectRelease();

  return (CHUISControlInstanceConfiguration *)v13;
}

- (void)setConfiguration:(id)a3
{
  char v5 = *((unsigned char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
  char v6 = *((unsigned char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
  uint64_t v7 = *(void *)((char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8);
  char v8 = *((unsigned char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 16);
  uint64_t v9 = *(void *)((char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 32);
  uint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 24);
  v10 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  uint64_t v11 = *((void *)v10 + 3);
  uint64_t v12 = *((void *)v10 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  v17[0] = v5;
  v17[1] = v6;
  uint64_t v18 = v7;
  char v19 = v8;
  uint64_t v20 = v16;
  uint64_t v21 = v9;
  v13 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 64);
  swift_bridgeObjectRetain();
  id v14 = a3;
  v15 = self;
  v13(v17, v11, v12);
  swift_endAccess();
}

- (CHSControlDescriptor)descriptor
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance__adapter);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  char v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  uint64_t v7 = self;
  char v8 = (void *)v6(v4, v5);
  swift_endAccess();

  return (CHSControlDescriptor *)v8;
}

- (CHUISControlInstanceDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___CHUISControlInstance_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C18715F0](v2);

  return (CHUISControlInstanceDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  result = (NSString *)sub_1BC488E98();
  __break(1u);
  return result;
}

- (CHUISControlIconView)iconView
{
  result = (CHUISControlIconView *)sub_1BC488E98();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  result = (UIColor *)sub_1BC488E98();
  __break(1u);
  return result;
}

- (CHUISControlInstance)initWithControl:(id)a3
{
  return (CHUISControlInstance *)CHUISControlInstance.init(control:)(a3);
}

- (CHUISControlInstance)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x1E4F58C90]);
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = [(CHUISControlInstance *)self initWithInstanceIdentity:v9];

  return v10;
}

- (CHUISControlInstance)initWithInstanceIdentity:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance__implicitlyActivateOnObserverRegistration) = 0;
  uint64_t v5 = type metadata accessor for EmptyControlInstanceAdapter();
  uint64_t v6 = swift_allocObject();
  id v7 = (uint64_t *)((char *)self + OBJC_IVAR___CHUISControlInstance__adapter);
  v7[3] = v5;
  v7[4] = (uint64_t)&off_1F15F8D98;
  *id v7 = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance_instanceIdentity) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance_visibility) = 0;
  v10.receiver = self;
  v10.super_class = (Class)CHUISControlInstance;
  id v8 = a3;
  return [(CHUISControlInstance *)&v10 init];
}

- (void)activate
{
  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 112);
  id v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)invalidate
{
  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 120);
  id v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)modifyConfiguration:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1BC45A4CC(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)performControlActionWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_1BC436768;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v8, (uint64_t)v13);
  uint64_t v9 = v14;
  uint64_t v10 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  uint64_t v11 = *(void (**)(void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v10 + 128);
  uint64_t v12 = self;
  v11(v7, v6, v9, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  sub_1BC436720((uint64_t)v7);
}

- (void)registerObserver:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  id v8 = *(void (**)(id, uint64_t, uint64_t))(v7 + 136);
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  swift_unknownObjectRelease();
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  id v8 = *(void (**)(id, uint64_t, uint64_t))(v7 + 144);
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  swift_unknownObjectRelease();
}

- (CHUISControlInstance)init
{
  result = (CHUISControlInstance *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC45A5E8((uint64_t)self + OBJC_IVAR___CHUISControlInstance_delegate);
  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end