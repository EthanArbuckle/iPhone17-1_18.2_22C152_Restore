@interface HMDHomeManagerXPCClientConnectionsManagerFactory
+ (id)makeInstanceWithQueue:(id)a3 messageDispatcher:(id)a4 messageTargetUUID:(id)a5 accessoryBrowser:(id)a6 logEventSubmitter:(id)a7;
- (HMDHomeManagerXPCClientConnectionsManagerFactory)init;
@end

@implementation HMDHomeManagerXPCClientConnectionsManagerFactory

+ (id)makeInstanceWithQueue:(id)a3 messageDispatcher:(id)a4 messageTargetUUID:(id)a5 accessoryBrowser:(id)a6 logEventSubmitter:(id)a7
{
  uint64_t v11 = sub_1D5459878();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5459858();
  id v15 = a3;
  id v16 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v17 = sub_1D4A519D4(v15, v16, (uint64_t)v14, (uint64_t)a6, (uint64_t)a7);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v17;
}

- (HMDHomeManagerXPCClientConnectionsManagerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDHomeManagerXPCClientConnectionsManagerFactory;
  return [(HMDHomeManagerXPCClientConnectionsManagerFactory *)&v3 init];
}

@end