@interface HMDNetworkInfoController
- (HMDNetworkInfoController)init;
- (id)obtainNetworkInfoProto;
- (void)dealloc;
- (void)start;
@end

@implementation HMDNetworkInfoController

- (HMDNetworkInfoController)init
{
  type metadata accessor for NetworkInfoSCDataSource();
  uint64_t v2 = swift_allocObject();
  v3 = (HMDNetworkInfoController *)sub_1D4A668A8(v2);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

- (void)dealloc
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDNetworkInfoController_store);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDNetworkInfoController_store) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for NetworkInfoController();
  [(HMDNetworkInfoController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___HMDNetworkInfoController_logger;
  uint64_t v4 = sub_1D5459AF8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR___HMDNetworkInfoController_dataSource;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (void)start
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HMDNetworkInfoController_dataSource);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_0(v3, v4);
  v10[2] = self;
  v6 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t (*)(), void *, uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  uint64_t v8 = v6(0xD000000000000015, 0x80000001D54C38E0, sub_1D4A669F8, v10, v4, v5);
  v9 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR___HMDNetworkInfoController_store);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___HMDNetworkInfoController_store) = (Class)v8;
}

- (id)obtainNetworkInfoProto
{
  uint64_t v2 = self;
  NetworkInfoController.obtainNetworkInfoProto()();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA70F7B8);
  v3 = (void *)sub_1D5459B88();
  swift_bridgeObjectRelease();
  return v3;
}

@end