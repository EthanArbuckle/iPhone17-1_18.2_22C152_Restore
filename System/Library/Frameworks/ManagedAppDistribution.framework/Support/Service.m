@interface Service
- (_TtC28ManagedAppDistributionDaemon7Service)init;
- (void)addMessageRegistrations:(id)a3 reply:(id)a4;
- (void)addOrUpdateManagedApp:(id)a3 reply:(id)a4;
- (void)cancelInstall:(id)a3 reply:(id)a4;
- (void)cancelManagedApp:(id)a3 reply:(id)a4;
- (void)checkDeviceCabilityForADPInstallation:(id)a3 reply:(id)a4;
- (void)currentDeclarationKeysWithReply:(id)a3;
- (void)daemonInstanceIdentifierWithReply:(id)a3;
- (void)discoverRestores:(id)a3 reply:(id)a4;
- (void)distributorIDForCaller:(id)a3 reply:(id)a4;
- (void)fetchAvailableAppMetadata:(id)a3 reply:(id)a4;
- (void)fetchPrivateDataRequest:(id)a3 reply:(id)a4;
- (void)fetchPublicDataRequest:(id)a3 reply:(id)a4;
- (void)getDeclarationStatus:(id)a3 reply:(id)a4;
- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 reply:(id)a6;
- (void)handleDiagnostics:(id)a3 reply:(id)a4;
- (void)handleEmergencyResetRequestWithReply:(id)a3;
- (void)handleLaunchAppRequest:(id)a3 reply:(id)a4;
- (void)handleRestore:(id)a3 reply:(id)a4;
- (void)handleSecureButtonActionRequest:(id)a3 reply:(id)a4;
- (void)handleVPPInstallRequest:(id)a3 reply:(id)a4;
- (void)installEnterpriseManifest:(id)a3 reply:(id)a4;
- (void)installManagedApp:(id)a3 reply:(id)a4;
- (void)oauthAuthorize:(id)a3 reply:(id)a4;
- (void)oauthInvalidate:(id)a3 reply:(id)a4;
- (void)pauseInstall:(id)a3 reply:(id)a4;
- (void)performActionRequest:(id)a3 reply:(id)a4;
- (void)performPrivateActionRequest:(id)a3 reply:(id)a4;
- (void)pollForMediaAPIUpdates:(id)a3 reply:(id)a4;
- (void)prioritizeApp:(id)a3 reply:(id)a4;
- (void)promoteApps:(id)a3 reply:(id)a4;
- (void)removeManagedAppWithDeclarationIdentifier:(id)a3 reply:(id)a4;
- (void)removeMessageRegistrations:(id)a3 reply:(id)a4;
- (void)requestAppLaunch:(id)a3 reply:(id)a4;
- (void)requestEDPInstallation:(id)a3 reply:(id)a4;
- (void)requestUpdate:(id)a3 reply:(id)a4;
- (void)requestUpdateMetadata:(id)a3 reply:(id)a4;
- (void)requestUpdatesPoll:(id)a3 reply:(id)a4;
- (void)resetManagedAppInstallHistoryWithReply:(id)a3;
- (void)resumeInstall:(id)a3 reply:(id)a4;
- (void)runManifestValidation:(id)a3 reply:(id)a4;
- (void)setDistributorIDOverridableForStoreSignedApps:(id)a3 reply:(id)a4;
- (void)setPrivateDataRequest:(id)a3 reply:(id)a4;
- (void)setPublicDataRequest:(id)a3 reply:(id)a4;
@end

@implementation Service

- (void)addMessageRegistrations:(id)a3 reply:(id)a4
{
}

- (void)fetchPrivateDataRequest:(id)a3 reply:(id)a4
{
}

- (void)handleLaunchAppRequest:(id)a3 reply:(id)a4
{
}

- (void)discoverRestores:(id)a3 reply:(id)a4
{
}

- (void)prioritizeApp:(id)a3 reply:(id)a4
{
}

- (void)promoteApps:(id)a3 reply:(id)a4
{
}

- (void)handleDiagnostics:(id)a3 reply:(id)a4
{
}

- (void)handleRestore:(id)a3 reply:(id)a4
{
}

- (void)handleVPPInstallRequest:(id)a3 reply:(id)a4
{
}

- (void)addOrUpdateManagedApp:(id)a3 reply:(id)a4
{
}

- (void)removeManagedAppWithDeclarationIdentifier:(id)a3 reply:(id)a4
{
}

- (void)currentDeclarationKeysWithReply:(id)a3
{
}

- (void)getDeclarationStatus:(id)a3 reply:(id)a4
{
}

- (void)resetManagedAppInstallHistoryWithReply:(id)a3
{
  uint64_t v5 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000172F8(&qword_10065C2E0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a3);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = type metadata accessor for LogKey.Prefix();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = self;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = &unk_10065CAB8;
  *(void *)(v15 + 24) = v14;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
  v17 = self;
  swift_retain();
  swift_retain();
  sub_100016EDC((uint64_t)"resetManagedAppInstallHistory", 29, 2, (uint64_t)sub_10000DDF8, v12, 0, (uint64_t)v10, (uint64_t)&_swiftEmptySetSingleton, 1u, (uint64_t)v7, (uint64_t)&unk_10065CAC0, v15, (uint64_t)&unk_10063B278, (uint64_t)&unk_10065C318);
  sub_10001729C((uint64_t)v7, &qword_10065B220);
  swift_release();
  swift_release();
  sub_10001729C((uint64_t)v10, &qword_10065C2E0);

  swift_release();
}

- (void)pollForMediaAPIUpdates:(id)a3 reply:(id)a4
{
}

- (void)installEnterpriseManifest:(id)a3 reply:(id)a4
{
}

- (void)installManagedApp:(id)a3 reply:(id)a4
{
}

- (void)cancelManagedApp:(id)a3 reply:(id)a4
{
}

- (void)daemonInstanceIdentifierWithReply:(id)a3
{
  uint64_t v5 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000172F8(&qword_10065C2E0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a3);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = type metadata accessor for LogKey.Prefix();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  uint64_t v16 = self;
  swift_retain();
  sub_100016EDC((uint64_t)"daemonInstanceIdentifier", 24, 2, (uint64_t)sub_10000DDF8, v12, 0, (uint64_t)v10, (uint64_t)&_swiftEmptySetSingleton, 1u, (uint64_t)v7, (uint64_t)&unk_10065C990, v14, (uint64_t)&unk_10063BDB8, (uint64_t)&unk_10065C8D0);
  sub_10001729C((uint64_t)v7, &qword_10065B220);
  swift_release();
  sub_10001729C((uint64_t)v10, &qword_10065C2E0);

  swift_release();
}

- (void)removeMessageRegistrations:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000172F8(&qword_10065C2E0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  id v14 = a3;
  uint64_t v15 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  uint64_t v20 = type metadata accessor for LogKey.Prefix();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = v16;
  v21[3] = v18;
  v21[4] = v15;
  uint64_t v22 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 1, 1, v22);
  v23 = v15;
  swift_retain();
  sub_100012670(v16, v18);
  sub_100016EDC((uint64_t)"removeMessageRegistrations", 26, 2, (uint64_t)sub_10000DDF8, v19, 0, (uint64_t)v12, (uint64_t)&_swiftEmptySetSingleton, 1u, (uint64_t)v9, (uint64_t)&unk_10065C8C0, (uint64_t)v21, (uint64_t)&unk_10063BDB8, (uint64_t)&unk_10065C8D0);
  sub_10001729C((uint64_t)v9, &qword_10065B220);
  swift_release();
  sub_10001729C((uint64_t)v12, &qword_10065C2E0);
  swift_release();
  sub_100013510(v16, v18);
}

- (_TtC28ManagedAppDistributionDaemon7Service)init
{
  result = (_TtC28ManagedAppDistributionDaemon7Service *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)setDistributorIDOverridableForStoreSignedApps:(id)a3 reply:(id)a4
{
}

- (void)distributorIDForCaller:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000172F8(&qword_10065C2E0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  id v14 = a3;
  uint64_t v15 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  uint64_t v20 = enum case for LogKey.Prefix.general(_:);
  uint64_t v21 = type metadata accessor for LogKey.Prefix();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 104))(v12, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v12, 0, 1, v21);
  v23 = (void *)swift_allocObject();
  v23[2] = v15;
  v23[3] = v16;
  v23[4] = v18;
  uint64_t v24 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
  v25 = v15;
  swift_retain();
  sub_100012670(v16, v18);
  sub_100016EDC((uint64_t)"Get distributor ID", 18, 2, (uint64_t)sub_10000DDF8, v19, 1, (uint64_t)v12, (uint64_t)&_swiftEmptySetSingleton, 1u, (uint64_t)v9, (uint64_t)&unk_10065C848, (uint64_t)v23, (uint64_t)&unk_10063BCC8, (uint64_t)&unk_10065C858);
  sub_10001729C((uint64_t)v9, &qword_10065B220);
  swift_release();
  sub_10001729C((uint64_t)v12, &qword_10065C2E0);
  swift_release();
  sub_100013510(v16, v18);
}

- (void)pauseInstall:(id)a3 reply:(id)a4
{
}

- (void)resumeInstall:(id)a3 reply:(id)a4
{
}

- (void)cancelInstall:(id)a3 reply:(id)a4
{
}

- (void)handleSecureButtonActionRequest:(id)a3 reply:(id)a4
{
}

- (void)fetchAvailableAppMetadata:(id)a3 reply:(id)a4
{
}

- (void)setPrivateDataRequest:(id)a3 reply:(id)a4
{
}

- (void)fetchPublicDataRequest:(id)a3 reply:(id)a4
{
}

- (void)setPublicDataRequest:(id)a3 reply:(id)a4
{
}

- (void)performActionRequest:(id)a3 reply:(id)a4
{
}

- (void)performPrivateActionRequest:(id)a3 reply:(id)a4
{
}

- (void)handleEmergencyResetRequestWithReply:(id)a3
{
}

- (void)runManifestValidation:(id)a3 reply:(id)a4
{
}

- (void)oauthAuthorize:(id)a3 reply:(id)a4
{
}

- (void)oauthInvalidate:(id)a3 reply:(id)a4
{
}

- (void)requestAppLaunch:(id)a3 reply:(id)a4
{
}

- (void)requestEDPInstallation:(id)a3 reply:(id)a4
{
}

- (void)checkDeviceCabilityForADPInstallation:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000172F8(&qword_10065C2E0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  id v14 = a3;
  uint64_t v15 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  uint64_t v20 = enum case for LogKey.Prefix.adp(_:);
  uint64_t v21 = type metadata accessor for LogKey.Prefix();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 104))(v12, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v12, 0, 1, v21);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v16;
  *(void *)(v23 + 24) = v18;
  uint64_t v24 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
  swift_retain();
  sub_100012670(v16, v18);
  sub_100016EDC((uint64_t)"Check Device Capability for ADP Installation", 44, 2, (uint64_t)sub_10000DDF8, v19, 1, (uint64_t)v12, (uint64_t)&_swiftEmptySetSingleton, 1u, (uint64_t)v9, (uint64_t)&unk_10065C460, v23, (uint64_t)&unk_10063B3E0, (uint64_t)&unk_10065C470);
  sub_10001729C((uint64_t)v9, &qword_10065B220);
  swift_release();
  sub_10001729C((uint64_t)v12, &qword_10065C2E0);
  swift_release();
  sub_100013510(v16, v18);
}

- (void)requestUpdateMetadata:(id)a3 reply:(id)a4
{
}

- (void)requestUpdate:(id)a3 reply:(id)a4
{
}

- (void)requestUpdatesPoll:(id)a3 reply:(id)a4
{
}

- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 reply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  sub_100238940(a3, v11, v12, v13, (void (**)(void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

@end