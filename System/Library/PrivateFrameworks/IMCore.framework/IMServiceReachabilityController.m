@interface IMServiceReachabilityController
+ (IMServiceReachabilityController)sharedController;
- (IMServiceReachabilityController)init;
- (IMServiceReachabilityController)initWithDelegate:(id)a3;
- (id)reachabilityContextForChat:(id)a3;
- (void)calculateServiceForSendingToChat:(id)a3 completionBlock:(id)a4;
- (void)calculateServiceForSendingToHandles:(id)a3 withContext:(id)a4 completionBlock:(id)a5;
@end

@implementation IMServiceReachabilityController

+ (IMServiceReachabilityController)sharedController
{
  if (qword_1E965B668 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E965B658;

  return (IMServiceReachabilityController *)v2;
}

- (IMServiceReachabilityController)initWithDelegate:(id)a3
{
  uint64_t v5 = OBJC_IVAR___IMServiceReachabilityController_taskIDToTask;
  swift_unknownObjectRetain();
  v6 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1A4B032BC(MEMORY[0x1E4FBC860], &qword_1E965B6A8);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___IMServiceReachabilityController_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  v9.receiver = v6;
  v9.super_class = (Class)IMServiceReachabilityController;
  v7 = [(IMServiceReachabilityController *)&v9 init];
  swift_unknownObjectRelease();
  return v7;
}

- (id)reachabilityContextForChat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1A4C9C3B4(v4);

  return v6;
}

- (void)calculateServiceForSendingToChat:(id)a3 completionBlock:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  objc_super v9 = self;
  sub_1A4C99C74(v8, (uint64_t)sub_1A4C9D968, v7);

  swift_release();
}

- (void)calculateServiceForSendingToHandles:(id)a3 withContext:(id)a4 completionBlock:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A4CBB15C();
  _Block_copy(v7);
  id v9 = a4;
  v10 = self;
  sub_1A4C9D398(v8, v9, (char *)v10, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (IMServiceReachabilityController)init
{
  result = (IMServiceReachabilityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end