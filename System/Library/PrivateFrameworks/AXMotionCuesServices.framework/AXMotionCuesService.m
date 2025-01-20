@interface AXMotionCuesService
+ (AXMotionCuesService)sharedInstance;
- (AXMotionCuesService)init;
- (id)registerMotionCuesMoving:(id)a3;
- (id)registerMotionCuesVisible:(id)a3;
- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(int64_t)a5 error:(id *)a6;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)disable:(id)a3;
- (void)enableWithCompletionBlock:(id)a3;
- (void)unregisterMotionCuesMoving:(id)a3;
- (void)unregisterMotionCuesVisible:(id)a3;
@end

@implementation AXMotionCuesService

+ (AXMotionCuesService)sharedInstance
{
  if (qword_26B129070 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B129068;
  return (AXMotionCuesService *)v2;
}

- (AXMotionCuesService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXMotionCuesService__client) = 0;
  uint64_t v4 = OBJC_IVAR___AXMotionCuesService_movingHandlers;
  v5 = self;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_2472206A8(MEMORY[0x263F8EE78]);
  uint64_t v7 = OBJC_IVAR___AXMotionCuesService_visibleHandlers;
  *(Class *)((char *)&v5->super.isa + v7) = (Class)sub_2472206A8(v6);

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return [(AXMotionCuesService *)&v9 init];
}

- (void)enableWithCompletionBlock:(id)a3
{
}

- (void)disable:(id)a3
{
}

- (id)registerMotionCuesMoving:(id)a3
{
  return sub_24722223C(self, (uint64_t)a2, a3, (uint64_t)&unk_26FB6B648, (uint64_t)sub_247225418, (void (*)(uint64_t, uint64_t))AXMotionCuesService.registerMotionCuesMoving(_:));
}

- (void)unregisterMotionCuesMoving:(id)a3
{
}

- (id)registerMotionCuesVisible:(id)a3
{
  return sub_24722223C(self, (uint64_t)a2, a3, (uint64_t)&unk_26FB6B620, (uint64_t)sub_247224F10, (void (*)(uint64_t, uint64_t))AXMotionCuesService.registerMotionCuesVisible(_:));
}

- (void)unregisterMotionCuesVisible:(id)a3
{
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(int64_t)a5 error:(id *)a6
{
  if (a4) {
    uint64_t v9 = sub_247225518();
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_2472249B8(v9, a5);

  swift_bridgeObjectRelease();
  v12 = (void *)sub_247225508();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  id v4 = objc_msgSend(self, sel_mainAccessQueue);
  return v4;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  AXMotionCuesService.connectionWithServiceWasInterrupted(forUserInterfaceClient:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end