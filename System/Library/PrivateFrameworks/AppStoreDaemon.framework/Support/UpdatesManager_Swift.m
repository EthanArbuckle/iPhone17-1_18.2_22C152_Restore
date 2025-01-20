@interface UpdatesManager_Swift
+ (_TtC9appstored20UpdatesManager_Swift)shared;
- (_TtC9appstored20UpdatesManager_Swift)init;
- (uint64_t)postProcessBackgroundUpdateMetrics;
- (void)autoUpdateEnabled:(id)a3;
- (void)confirmAgentRequestedUpdateAll:(id)a3;
- (void)dropAllUpdatesIncludingVPP:(BOOL)a3;
- (void)getManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)getUpdateMetadataForBundleID:(NSString *)a3 replyHandler:(id)a4;
- (void)getUpdatesWithContext:(id)a3;
- (void)getUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)handleAccountChangeNotification;
- (void)hidePendingUpdatesBadge;
- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4;
- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4;
- (void)performBackgroundSoftwareUpdateCheck;
- (void)performPostRestoreUpdatesCheck;
- (void)refreshUpdateCountWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)refreshUpdateForApp:(int64_t)a3 token:(XPCRequestToken *)a4 replyHandler:(id)a5;
- (void)reloadApplicationBadgeWithReason:(id)a3;
- (void)reloadFromServerInBackgroundWithToken:(XPCRequestToken *)a3 completionBlock:(id)a4;
- (void)reloadFromServerWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)reloadManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)reloadUpdatesWithContext:(id)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4;
- (void)setupFollowingMigration;
- (void)showPendingUpdatesBadge;
- (void)updateAllWithOrder:(NSArray *)a3 requestToken:(XPCRequestToken *)a4 replyHandler:(id)a5;
- (void)verifyAllPendingUpdates;
- (void)verifyPendingUpdates:(id)a3;
- (void)verifyUpdatesFollowingExternalAppInstall:(id)a3;
@end

@implementation UpdatesManager_Swift

+ (_TtC9appstored20UpdatesManager_Swift)shared
{
  if (qword_1005A3030 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (_TtC9appstored20UpdatesManager_Swift *)v2;
}

- (void)getUpdatesWithContext:(id)a3
{
}

- (_TtC9appstored20UpdatesManager_Swift)init
{
  return (_TtC9appstored20UpdatesManager_Swift *)sub_100074328();
}

- (void)autoUpdateEnabled:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A5190;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A5198;
  v12[5] = v11;
  swift_retain();
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A51A0, (uint64_t)v12);
  swift_release();
}

- (void)confirmAgentRequestedUpdateAll:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A5170;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A5178;
  v12[5] = v11;
  swift_retain();
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A5180, (uint64_t)v12);
  swift_release();
}

- (void)dropAllUpdatesIncludingVPP:(BOOL)a3
{
}

- (void)hidePendingUpdatesBadge
{
}

- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A5140;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A5148;
  v14[5] = v13;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A5150, (uint64_t)v14);
  swift_release();
}

- (void)getManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A5120;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A5128;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A5130, (uint64_t)v14);
  swift_release();
}

- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4
{
  uint64_t v6 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = objc_allocWithZone((Class)type metadata accessor for UpdatesContext());
  id v13 = a4;
  swift_retain();
  id v14 = sub_1000B9258(0, 0, a4, 0, 0, 0, 0, 0, 0, 1);

  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = v14;
  v16[6] = v9;
  v16[7] = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100018FDC((uint64_t)v8, (uint64_t)&unk_1005A5110, (uint64_t)v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)performBackgroundSoftwareUpdateCheck
{
}

- (void)performPostRestoreUpdatesCheck
{
}

- (void)refreshUpdateCountWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A50E0;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A50E8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A50F0, (uint64_t)v14);
  swift_release();
}

- (void)refreshUpdateForApp:(int64_t)a3 token:(XPCRequestToken *)a4 replyHandler:(id)a5
{
  uint64_t v9 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1005A50A8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1005A50B0;
  v16[5] = v15;
  uint64_t v17 = a4;
  swift_retain();
  sub_1000DFAB0((uint64_t)v11, (uint64_t)&unk_1005A50B8, (uint64_t)v16);
  swift_release();
}

- (void)reloadApplicationBadgeWithReason:(id)a3
{
  uint64_t v4 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_1000EF8D0((uint64_t)v6, (uint64_t)&unk_1005A5098, (uint64_t)v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)reloadFromServerWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A5078;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A5080;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A5088, (uint64_t)v14);
  swift_release();
}

- (void)reloadFromServerInBackgroundWithToken:(XPCRequestToken *)a3 completionBlock:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A5058;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A5060;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A5068, (uint64_t)v14);
  swift_release();
}

- (void)reloadManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A5038;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A5040;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A5048, (uint64_t)v14);
  swift_release();
}

- (void)reloadUpdatesWithContext:(id)a3
{
}

- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A5010;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A5018;
  v14[5] = v13;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A5020, (uint64_t)v14);
  swift_release();
}

- (void)setupFollowingMigration
{
}

- (void)showPendingUpdatesBadge
{
}

- (void)updateAllWithOrder:(NSArray *)a3 requestToken:(XPCRequestToken *)a4 replyHandler:(id)a5
{
  uint64_t v9 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1005A4FF0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1005A4FF8;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1000DFAB0((uint64_t)v11, (uint64_t)&unk_1005A5000, (uint64_t)v16);
  swift_release();
}

- (void)getUpdateMetadataForBundleID:(NSString *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A4FD0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A4FD8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A4FE0, (uint64_t)v14);
  swift_release();
}

- (void)getUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A4FC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A35A0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A4930, (uint64_t)v14);
  swift_release();
}

- (void)verifyAllPendingUpdates
{
}

- (void)verifyPendingUpdates:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10007D560(v3);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)verifyUpdatesFollowingExternalAppInstall:(id)a3
{
  uint64_t v4 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v7;
  v9[5] = self;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_100018FDC((uint64_t)v6, (uint64_t)&unk_1005A4FB0, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)handleAccountChangeNotification
{
}

- (uint64_t)postProcessBackgroundUpdateMetrics
{
  uint64_t v0 = type metadata accessor for Date();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&aBlock[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v8 = 0;
  if (sub_10039B170())
  {
    static Logger.updates.getter();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Post processing update metrics", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    unint64_t v24 = (unint64_t)_swiftEmptyArrayStorage;
    self;
    id v12 = sub_10001A308();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = &v24;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_10008D9AC;
    *(void *)(v14 + 24) = v13;
    aBlock[4] = sub_10008E188;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100018DE4;
    aBlock[3] = &unk_1005147E0;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v12 readUsingSession:v15];

    _Block_release(v15);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v12)
    {
      __break(1u);
    }
    else if (!(v24 >> 62))
    {
      if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_8:
        swift_bridgeObjectRelease();
        uint64_t v8 = sub_10008D9AC;
        goto LABEL_9;
      }
LABEL_7:
      id v16 = sub_10039B090();
      sub_100018D68(0, &qword_1005A50F8);
      swift_bridgeObjectRetain();
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      sub_10039B1EC((uint64_t)v16, isa);

      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v21) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v18 = self;
  Date.init()();
  Class v19 = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1003F436C(v18, v19);

  return sub_100018DD4((uint64_t)v8);
}

@end