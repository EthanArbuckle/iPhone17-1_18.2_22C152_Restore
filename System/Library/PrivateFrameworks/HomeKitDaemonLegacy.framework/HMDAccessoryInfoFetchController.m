@interface HMDAccessoryInfoFetchController
- (HMDAccessoryInfoFetchController)init;
- (HMDAccessoryInfoFetchController)initWithHomeUUID:(id)a3 workQueue:(id)a4;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (void)configureWithMessageDispatcher:(id)a3 remoteEventRouterClientController:(id)a4;
- (void)handleFetchWithMessage:(id)a3;
- (void)setMessageReceiveQueue:(id)a3;
- (void)setMessageTargetUUID:(id)a3;
@end

@implementation HMDAccessoryInfoFetchController

- (NSUUID)messageTargetUUID
{
  uint64_t v3 = sub_1D5459878();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1D5459838();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setMessageTargetUUID:(id)a3
{
  uint64_t v4 = sub_1D5459878();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5459858();
  v8 = (char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue);
  swift_beginAccess();
  return (OS_dispatch_queue *)*v2;
}

- (void)setMessageReceiveQueue:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (HMDAccessoryInfoFetchController)initWithHomeUUID:(id)a3 workQueue:(id)a4
{
  uint64_t v6 = sub_1D5459878();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5459858();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageDispatcher) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_remoteEventRouterClientController) = 0;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID, v9, v6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue) = (Class)a4;
  Controller = (objc_class *)type metadata accessor for AccessoryInfoFetchController();
  v14.receiver = self;
  v14.super_class = Controller;
  id v11 = a4;
  v12 = [(HMDAccessoryInfoFetchController *)&v14 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)configureWithMessageDispatcher:(id)a3 remoteEventRouterClientController:(id)a4
{
  uint64_t v6 = (HMFMessageDispatcher *)a3;
  uint64_t v7 = (HMDHomeRemoteEventRouterClientController *)a4;
  uint64_t v8 = self;
  AccessoryInfoFetchController.configure(with:remoteEventRouterClientController:)(v6, v7);
}

- (void)handleFetchWithMessage:(id)a3
{
}

- (HMDAccessoryInfoFetchController)init
{
  result = (HMDAccessoryInfoFetchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___HMDAccessoryInfoFetchController_messageTargetUUID;
  uint64_t v4 = sub_1D5459878();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HMDAccessoryInfoFetchController_remoteEventRouterClientController));
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDAccessoryInfoFetchController_messageReceiveQueue);
}

@end