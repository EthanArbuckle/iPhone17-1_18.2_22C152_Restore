@interface CloudSecureManagerProxy
+ (BCCloudSecureManaging)sharedManager;
+ (void)setSharedManager:(id)a3;
- (BCCloudSecureUserDataManager)userDataManager;
- (BDSSecureEngagementManaging)engagementManager;
- (_TtC13BookDataStore23CloudSecureManagerProxy)init;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)handleRemoteCKNotification:(id)a3;
- (void)handleRemoteNotification:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setEngagementManager:(id)a3;
- (void)setUserDataManager:(id)a3;
@end

@implementation CloudSecureManagerProxy

- (_TtC13BookDataStore23CloudSecureManagerProxy)init
{
  id v3 = objc_allocWithZone((Class)BDSServiceProxy);
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy) = v5;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_engagementManager) = v5;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_userDataManager) = v5;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CloudSecureManagerProxy();
  return [(CloudSecureManagerProxy *)&v8 init];
}

- (void)setEnableCloudSync:(BOOL)a3
{
}

- (void)handleRemoteNotification:(id)a3
{
  uint64_t v4 = sub_2361FE7F8();
  v5 = self;
  sub_23619F5F4(v4);

  swift_bridgeObjectRelease();
}

- (void)handleRemoteCKNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23619F8D4(v4);
}

- (BDSSecureEngagementManaging)engagementManager
{
  return (BDSSecureEngagementManaging *)sub_23619FBE8();
}

- (void)setEngagementManager:(id)a3
{
}

- (BCCloudSecureUserDataManager)userDataManager
{
  return (BCCloudSecureUserDataManager *)sub_23619FBE8();
}

- (void)setUserDataManager:(id)a3
{
}

+ (BCCloudSecureManaging)sharedManager
{
  if (qword_26AD756D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (BCCloudSecureManaging *)v2;
}

+ (void)setSharedManager:(id)a3
{
  uint64_t v4 = qword_26AD756D0;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26AD756C0 = (uint64_t)a3;
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy);
    objc_super v8 = sub_2361A0700;
    v12[4] = sub_2361A0700;
    v12[5] = v6;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1107296256;
    v12[2] = sub_2361A0240;
    v12[3] = &unk_26E975330;
    v9 = _Block_copy(v12);
    v10 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy);
    v11 = self;
    v9 = 0;
    objc_super v8 = 0;
  }
  objc_msgSend(v7, sel_dissociateCloudDataFromSyncWithCompletion_, v9);
  _Block_release(v9);
  sub_236144558((uint64_t)v8);
}

@end