@interface CUFindMyLocateMeDeviceMonitor
+ (BOOL)supported;
- (CUFindMyLocateMeDeviceMonitor)init;
- (CUFindMyLocateMeDeviceMonitor)initWithDispatchQueue:(id)a3;
- (id)meDeviceUpdatedHandler;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setMeDeviceUpdatedHandler:(id)a3;
@end

@implementation CUFindMyLocateMeDeviceMonitor

- (id)meDeviceUpdatedHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22A30DACC;
    aBlock[3] = &block_descriptor_16;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMeDeviceUpdatedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22A31297C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_22A30DBDC(v7);
}

+ (BOOL)supported
{
  return 1;
}

- (CUFindMyLocateMeDeviceMonitor)initWithDispatchQueue:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask) = 0;
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler);
  *uint64_t v3 = 0;
  v3[1] = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__firstUnlockStarted) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__dispatchQueue) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)CUFindMyLocateMeDeviceMonitor;
  id v4 = a3;
  return [(CUFindMyLocateMeDeviceMonitor *)&v6 init];
}

- (void)dealloc
{
  v2 = self;
  sub_22A30DC7C();
  v3.receiver = v2;
  v3.super_class = (Class)CUFindMyLocateMeDeviceMonitor;
  [(CUFindMyLocateMeDeviceMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_22A30DBDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor);
}

- (void)activate
{
  v2 = self;
  sub_22A311798((uint64_t)&unk_26DDE0E08, (uint64_t)sub_22A30E014, (uint64_t)&block_descriptor);
}

- (void)invalidate
{
  v2 = self;
  sub_22A311798((uint64_t)&unk_26DDE0E58, (uint64_t)sub_22A311A24, (uint64_t)&block_descriptor_6);
}

- (CUFindMyLocateMeDeviceMonitor)init
{
  result = (CUFindMyLocateMeDeviceMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end