@interface HoverTextService
+ (_TtC17HoverTextServices16HoverTextService)sharedInstance;
- (BOOL)startHoverTextAndReturnError:(id *)a3;
- (BOOL)startHoverTextTypingAndReturnError:(id *)a3;
- (BOOL)stopHoverTextAndReturnError:(id *)a3;
- (BOOL)stopHoverTextTypingAndReturnError:(id *)a3;
- (_TtC17HoverTextServices16HoverTextService)init;
- (void)showAlert:(id)a3;
@end

@implementation HoverTextService

+ (_TtC17HoverTextServices16HoverTextService)sharedInstance
{
  if (qword_1EB9F1290 != -1) {
    swift_once();
  }
  v2 = (void *)static HoverTextService.sharedInstance;
  return (_TtC17HoverTextServices16HoverTextService *)v2;
}

- (_TtC17HoverTextServices16HoverTextService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)type metadata accessor for HoverTextServiceAXUIService();
  id v5 = objc_allocWithZone(v4);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_init);
  v8 = (Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl);
  v8[3] = v4;
  v8[4] = &off_1F2679FB8;
  void *v8 = v7;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return [(HoverTextService *)&v10 init];
}

- (void).cxx_destruct
{
}

- (BOOL)startHoverTextAndReturnError:(id *)a3
{
  sub_1CFDCD5F0((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

- (BOOL)stopHoverTextAndReturnError:(id *)a3
{
  sub_1CFDCD5F0((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

- (void)showAlert:(id)a3
{
  uint64_t v4 = sub_1CFDCDDB0();
  uint64_t v6 = v5;
  sub_1CFDCD5F0((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = self;
  v9(v4, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (BOOL)startHoverTextTypingAndReturnError:(id *)a3
{
  sub_1CFDCD5F0((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  uint64_t v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

- (BOOL)stopHoverTextTypingAndReturnError:(id *)a3
{
  sub_1CFDCD5F0((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 40);
  uint64_t v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

@end