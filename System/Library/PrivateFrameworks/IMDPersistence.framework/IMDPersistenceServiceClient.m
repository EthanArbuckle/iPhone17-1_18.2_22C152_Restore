@interface IMDPersistenceServiceClient
+ (IMDPersistenceServiceClient)sharedClient;
+ (void)setSharedClient:(id)a3;
- (IMDPersistenceServiceClient)init;
- (IMDRemoteDatabaseProtocol)remoteProxy;
- (IMDRemoteDatabaseProtocol)synchronousRemoteProxy;
@end

@implementation IMDPersistenceServiceClient

+ (IMDPersistenceServiceClient)sharedClient
{
  if (qword_1E9AF78D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (IMDPersistenceServiceClient *)(id)qword_1E9AF7E18;
}

+ (void)setSharedClient:(id)a3
{
  uint64_t v3 = qword_1E9AF78D0;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1E9AF7E18;
  qword_1E9AF7E18 = (uint64_t)v4;
}

- (IMDPersistenceServiceClient)init
{
  return (IMDPersistenceServiceClient *)MessagesPersistenceServiceClient.init()();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection);
}

- (IMDRemoteDatabaseProtocol)remoteProxy
{
  return (IMDRemoteDatabaseProtocol *)sub_1AFC5B71C(self);
}

- (IMDRemoteDatabaseProtocol)synchronousRemoteProxy
{
  return (IMDRemoteDatabaseProtocol *)sub_1AFC5B71C(self);
}

@end