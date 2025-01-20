@interface CloudSecureManagerService
+ (BCCloudSecureManaging)sharedManager;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudSecureUserDataManager)userDataManager;
- (BDSSecureEngagementManaging)engagementManager;
- (_TtC14bookdatastored25CloudSecureManagerService)init;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
@end

@implementation CloudSecureManagerService

- (BCCloudSecureUserDataManager)userDataManager
{
  return (BCCloudSecureUserDataManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_userDataManagerImpl));
}

- (BDSSecureEngagementManaging)engagementManager
{
  return (BDSSecureEngagementManaging *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_engagementManagerImpl));
}

+ (BCCloudSecureManaging)sharedManager
{
  if (qword_100291108 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();
  return (BCCloudSecureManaging *)v2;
}

- (_TtC14bookdatastored25CloudSecureManagerService)init
{
  sub_10014D8A0();
  return result;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_userDataManagerImpl);
  v5 = self;
  [v4 setEnableCloudSync:v3];
  sub_1000C28E0(v3);
  [*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_changeTokenController) setEnableCloudSync:v3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_secureDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_changeTokenController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_saltVersionIdentifierManager));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_engagementManagerImpl));
  BOOL v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14bookdatastored25CloudSecureManagerService_userDataManagerImpl);
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10014E1C4((uint64_t)sub_1000C6638, v5);

  swift_release();
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1000C6638;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_10014E4A0(v7, v6);
  sub_1000B0100((uint64_t)v7);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  BOOL v3 = _Block_copy(a3);
  if (v3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    BOOL v3 = sub_1000C5324;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_10014E774((uint64_t)v3, v4);
  sub_1000B0100((uint64_t)v3);
}

@end