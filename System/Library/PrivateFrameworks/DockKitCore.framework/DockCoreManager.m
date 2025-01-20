@interface DockCoreManager
+ (BOOL)debugAllowed;
+ (BOOL)diagnosticsCollectionEnabled;
+ (BOOL)ignoreStartupValidation;
+ (NSString)localFirmwarePath;
- (BOOL)getStateEventsWithDelegate:(id)a3 syncWithDaemon:(BOOL)a4 error:(id *)a5;
- (BOOL)monitorSystemTrackingStateWithDelegate:(id)a3 appID:(id)a4 error:(id *)a5;
- (NSError)_xpcConnectionError;
- (NSXPCConnection)_xpcConnection;
- (NSXPCConnection)_xpcConnection_CameraCapture;
- (NSXPCConnection)_xpcConnection_Certification;
- (NSXPCConnection)_xpcConnection_Debug;
- (OS_dispatch_queue)darwinQueue;
- (_TtC11DockKitCore15DockCoreManager)init;
- (_TtC11DockKitCore17DockCoreAccessory)_connected;
- (_TtC11DockKitCore18DeviceNotification)connectedNotification;
- (_TtC11DockKitCore18DeviceNotification)trackingButtonNotification;
- (_TtC11DockKitCore18DeviceNotification)trackingEnableNotification;
- (_TtP11DockKitCore18StateEventProtocol_)stateDelegate;
- (_TtP11DockKitCore22DockClientCertProtocol_)certDelegate;
- (_TtP11DockKitCore22SystemTrackingProtocol_)configDelegate;
- (_TtP11DockKitCore23DockClientDebugProtocol_)debugDelegate;
- (_TtP11DockKitCore33DockCoreManagerConnectionDelegate_)connectionDelegate;
- (_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_)clientConfigDelegate;
- (double)XPCTIMEOUT;
- (id)xpcConnection;
- (id)xpcConnection_CameraCapture;
- (id)xpcConnection_Cert;
- (id)xpcConnection_Debug;
- (id)xpcConnection_useEntitledIfOpen;
- (int64_t)_trackingButtonState;
- (void)_connectedClientsWithCompletion:(id)a3;
- (void)_connectedDockAccessoryWithCompletion:(id)a3;
- (void)_dockedDockAccessoryWithCompletion:(id)a3;
- (void)_dumpStateWithCompletion:(id)a3;
- (void)_dumpTrackerDiagsWithPath:(id)a3 completion:(id)a4;
- (void)_dumpTrackerStatesWithPath:(id)a3 completion:(id)a4;
- (void)_getAccessoryDescriptionWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)_getAccessoryDiagnosticsWithInfo:(id)a3 delegate:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_getClientConfigurationUpdatesWithDelegate:(id)a3 appID:(id)a4 completion:(id)a5;
- (void)_getDockTrackingButtonStateWithCompletion:(id)a3;
- (void)_getSystemTrackingEnabledWithAppID:(id)a3 completion:(id)a4;
- (void)_getTrackerDebugNotificationsWithDelegate:(id)a3 completion:(id)a4;
- (void)_haltWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)_manualFirmwareUpdateWithFilePath:(id)a3 sandboxExt:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)_migrateDataWithUpdate:(BOOL)a3 completion:(id)a4;
- (void)_pairedDockAccessoriesWithCompletion:(id)a3;
- (void)_rebootWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)_returnToBaseWithInfo:(id)a3 completion:(id)a4;
- (void)_searchWithCalibrate:(BOOL)a3 completion:(id)a4;
- (void)_selectSubjectAt:(CGPoint)a3 completion:(id)a4;
- (void)_selectSubjects:(id)a3 completion:(id)a4;
- (void)_setDockAccessoryStateWithInfo:(id)a3 docked:(int64_t)a4 completion:(id)a5;
- (void)_setDockTrackingButtonStateWithState:(int64_t)a3 completion:(id)a4;
- (void)_setFramingModeWithMode:(int64_t)a3 completion:(id)a4;
- (void)_setRectOfInterestWithRect:(CGRect)a3 completion:(id)a4;
- (void)_setSystemTrackingEnabledWithEnabled:(BOOL)a3 completion:(id)a4;
- (void)_stopSearchWithCalibrate:(BOOL)a3 completion:(id)a4;
- (void)_stopTrackerDebugNotificationsWithCompletion:(id)a3;
- (void)_triggerSystemEventWithInfo:(id)a3 event:(id)a4 completion:(id)a5;
- (void)_unpairAccessoryWithInfo:(id)a3 completion:(id)a4;
- (void)_updateCameraSessionWithSession:(id)a3 new:(BOOL)a4 completion:(id)a5;
- (void)_updateTrackingSummaryDebugWithData:(id)a3 completion:(id)a4;
- (void)_updateTrackingSummaryWithData:(id)a3 completion:(id)a4;
- (void)_versionsWithCompletion:(id)a3;
- (void)accessoryDescriptionFeedbackWithProcessID:(int)a3 info:(id)a4 accessoryDescription:(id)a5 err:(id)a6;
- (void)clearAllDelegates;
- (void)clearAllSavedObjects;
- (void)clearXPCError;
- (void)closeXPCNoReply;
- (void)closeXPCNoReply_CameraCapture;
- (void)closeXPCNoReply_Cert;
- (void)closeXPCNoReply_Debug;
- (void)connectedClientsWithCompletionHandler:(id)a3;
- (void)connectedDockAccessoryWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)diagnosticsFeedbackWithProcessID:(int)a3 info:(id)a4 path:(id)a5 err:(id)a6;
- (void)disconnect;
- (void)dockedDockAccessoryWithCompletionHandler:(id)a3;
- (void)dumpStateWithCompletionHandler:(id)a3;
- (void)dumpTrackerDiagnosticsWithPath:(id)a3;
- (void)dumpTrackerDiagsWithPath:(NSString *)a3 completionHandler:(id)a4;
- (void)dumpTrackerStateWithPath:(id)a3;
- (void)dumpTrackerStatesWithPath:(NSString *)a3 completionHandler:(id)a4;
- (void)fwUpdateFeedbackWithProcessID:(int)a3 info:(id)a4 message:(id)a5 complete:(BOOL)a6 err:(id)a7;
- (void)getAccessoryDescriptionWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore27XPCDataStreamClientProtocol_ *)a4 completionHandler:(id)a5;
- (void)getAccessoryDiagnosticsWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 options:(NSDictionary *)a5 completionHandler:(id)a6;
- (void)getAccessoryDiagnosticsWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 options:(NSDictionary *)a4 completionHandler:(id)a5;
- (void)getClientConfigurationUpdatesWithDelegate:(_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_ *)a3 appID:(NSString *)a4 completionHandler:(id)a5;
- (void)getDockTrackingButtonStateWithCompletionHandler:(id)a3;
- (void)getSystemTrackingEnabledWithAppID:(NSString *)a3 completionHandler:(id)a4;
- (void)getTrackerDebugNotificationsWithDelegate:(_TtP11DockKitCore23DockClientDebugProtocol_ *)a3 completionHandler:(id)a4;
- (void)haltFeedbackWithProcessID:(int)a3 info:(id)a4 success:(BOOL)a5 complete:(BOOL)a6 err:(id)a7;
- (void)haltWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 completionHandler:(id)a5;
- (void)handleUnexpectedDisconnect;
- (void)manualFirmwareUpdateWithFilePath:(NSString *)a3 sandboxExt:(NSString *)a4 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a5 completionHandler:(id)a6;
- (void)migrateDataWithUpdate:(BOOL)a3 completionHandler:(id)a4;
- (void)notifyConfigDelegateWithAppID:(id)a3;
- (void)pairedDockAccessoriesWithCompletionHandler:(id)a3;
- (void)rebootFeedbackWithProcessID:(int)a3 info:(id)a4 success:(BOOL)a5 complete:(BOOL)a6 err:(id)a7;
- (void)rebootWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 completionHandler:(id)a5;
- (void)returnToBase;
- (void)returnToBaseWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 completionHandler:(id)a4;
- (void)searchWithCalibrate:(BOOL)a3;
- (void)searchWithCalibrate:(BOOL)a3 completionHandler:(id)a4;
- (void)selectSubjectAt:(CGPoint)a3 completionHandler:(id)a4;
- (void)selectSubjectAtEventWithX:(id)a3 y:(id)a4;
- (void)selectSubjects:(NSArray *)a3 completionHandler:(id)a4;
- (void)selectSubjectsEvent:(id)a3;
- (void)sendCommandEventWithCommand:(id)a3;
- (void)setCachedButtonStateWithEnabled:(BOOL)a3;
- (void)setCachedConnectedWithConnected:(id)a3;
- (void)setCertDelegate:(id)a3;
- (void)setClientConfigDelegate:(id)a3;
- (void)setConfigDelegate:(id)a3;
- (void)setConnectedNotification:(id)a3;
- (void)setConnectionDelegate:(id)a3;
- (void)setDarwinQueue:(id)a3;
- (void)setDebugDelegate:(id)a3;
- (void)setDockAccessoryStateWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 docked:(int64_t)a4 completionHandler:(id)a5;
- (void)setDockTrackingButtonStateWithState:(int64_t)a3 completionHandler:(id)a4;
- (void)setFramingModeEventWithMode:(int64_t)a3;
- (void)setFramingModeWithMode:(int64_t)a3 completionHandler:(id)a4;
- (void)setRectOfInterestEventWithRect:(CGRect)a3;
- (void)setRectOfInterestWithRect:(CGRect)a3 completionHandler:(id)a4;
- (void)setStateDelegate:(id)a3;
- (void)setSystemTrackingEnabledWithEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setTrackingButtonNotification:(id)a3;
- (void)setTrackingEnableNotification:(id)a3;
- (void)setXPCTIMEOUT:(double)a3;
- (void)set_connected:(id)a3;
- (void)set_trackingButtonState:(int64_t)a3;
- (void)set_xpcConnection:(id)a3;
- (void)set_xpcConnectionError:(id)a3;
- (void)set_xpcConnection_CameraCapture:(id)a3;
- (void)set_xpcConnection_Certification:(id)a3;
- (void)set_xpcConnection_Debug:(id)a3;
- (void)stopReturnToBase;
- (void)stopSearchWithCalibrate:(BOOL)a3;
- (void)stopSearchWithCalibrate:(BOOL)a3 completionHandler:(id)a4;
- (void)stopStateEvents;
- (void)stopTrackerDebugNotificationsWithCompletionHandler:(id)a3;
- (void)syncStateAndGenerateStateEvents:(unint64_t)a3;
- (void)triggerSystemEventWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 event:(_TtC11DockKitCore20AccessorySystemEvent *)a4 completionHandler:(id)a5;
- (void)unpairAccessoryWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 completionHandler:(id)a4;
- (void)updateCameraSessionWithSession:(_TtC11DockKitCore24CameraSessionInformation *)a3 new:(BOOL)a4 completionHandler:(id)a5;
- (void)versionsWithCompletionHandler:(id)a3;
@end

@implementation DockCoreManager

- (_TtP11DockKitCore33DockCoreManagerConnectionDelegate_)connectionDelegate
{
  v2 = (void *)MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectionDelegate, a2);
  return (_TtP11DockKitCore33DockCoreManagerConnectionDelegate_ *)v2;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (NSXPCConnection)_xpcConnection
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection));
}

- (void)set_xpcConnection:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection) = (Class)a3;
  id v3 = a3;
}

- (NSError)_xpcConnectionError
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError);
  if (v2)
  {
    id v3 = v2;
    id v4 = (void *)sub_24CF3A7F0();
  }
  else
  {
    id v4 = 0;
  }
  return (NSError *)v4;
}

- (void)set_xpcConnectionError:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError) = (Class)a3;
  id v4 = a3;
}

- (double)XPCTIMEOUT
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_XPCTIMEOUT);
}

- (void)setXPCTIMEOUT:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_XPCTIMEOUT) = a3;
}

- (_TtP11DockKitCore18StateEventProtocol_)stateDelegate
{
  v2 = (void *)MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_stateDelegate, a2);
  return (_TtP11DockKitCore18StateEventProtocol_ *)v2;
}

- (void)setStateDelegate:(id)a3
{
}

- (_TtP11DockKitCore22SystemTrackingProtocol_)configDelegate
{
  v2 = (void *)MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_configDelegate, a2);
  return (_TtP11DockKitCore22SystemTrackingProtocol_ *)v2;
}

- (void)setConfigDelegate:(id)a3
{
}

- (_TtP11DockKitCore23DockClientDebugProtocol_)debugDelegate
{
  v2 = (void *)MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_debugDelegate, a2);
  return (_TtP11DockKitCore23DockClientDebugProtocol_ *)v2;
}

- (void)setDebugDelegate:(id)a3
{
}

- (_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_)clientConfigDelegate
{
  v2 = (void *)MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  return (_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_ *)v2;
}

- (void)setClientConfigDelegate:(id)a3
{
}

- (_TtP11DockKitCore22DockClientCertProtocol_)certDelegate
{
  v2 = (void *)MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_certDelegate, a2);
  return (_TtP11DockKitCore22DockClientCertProtocol_ *)v2;
}

- (void)setCertDelegate:(id)a3
{
}

- (_TtC11DockKitCore18DeviceNotification)connectedNotification
{
  return (_TtC11DockKitCore18DeviceNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification));
}

- (void)setConnectedNotification:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification) = (Class)a3;
  id v3 = a3;
}

- (_TtC11DockKitCore18DeviceNotification)trackingEnableNotification
{
  return (_TtC11DockKitCore18DeviceNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification));
}

- (void)setTrackingEnableNotification:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification) = (Class)a3;
  id v3 = a3;
}

- (_TtC11DockKitCore18DeviceNotification)trackingButtonNotification
{
  return (_TtC11DockKitCore18DeviceNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification));
}

- (void)setTrackingButtonNotification:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification) = (Class)a3;
  id v3 = a3;
}

- (OS_dispatch_queue)darwinQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_darwinQueue));
}

- (void)setDarwinQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_darwinQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_darwinQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtC11DockKitCore17DockCoreAccessory)_connected
{
  return (_TtC11DockKitCore17DockCoreAccessory *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__connected));
}

- (void)set_connected:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__connected);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__connected) = (Class)a3;
  id v3 = a3;
}

- (int64_t)_trackingButtonState
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__trackingButtonState);
}

- (void)set_trackingButtonState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__trackingButtonState) = (Class)a3;
}

- (_TtC11DockKitCore15DockCoreManager)init
{
  return (_TtC11DockKitCore15DockCoreManager *)DockCoreManager.init()();
}

- (void)dealloc
{
  v2 = self;
  DockCoreManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectionDelegate);

  swift_release();
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_stateDelegate);
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_configDelegate);
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_debugDelegate);
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate);
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_certDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification));

  swift_release();
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification));
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture);
}

+ (BOOL)debugAllowed
{
  return _s11DockKitCore0aC7ManagerC12debugAllowedSbvgZ_0() & 1;
}

+ (NSString)localFirmwarePath
{
  _s11DockKitCore0aC7ManagerC17localFirmwarePathSSSgvgZ_0();
  if (v2)
  {
    id v3 = (void *)sub_24CF3B300();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  return (NSString *)v3;
}

+ (BOOL)ignoreStartupValidation
{
  return _s11DockKitCore0aC7ManagerC23ignoreStartupValidationSbvgZ_0() & 1;
}

+ (BOOL)diagnosticsCollectionEnabled
{
  return _s11DockKitCore0aC7ManagerC28diagnosticsCollectionEnabledSbvgZ_0() & 1;
}

- (void)clearAllSavedObjects
{
  uint64_t v2 = self;
  sub_24CEE1FB0();
}

- (void)clearAllDelegates
{
  uint64_t v2 = self;
  sub_24CEE2134();
}

- (void)disconnect
{
  uint64_t v2 = self;
  DockCoreManager.disconnect()();
}

- (void)clearXPCError
{
  uint64_t v3 = OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionLock;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionLock);
  v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError) = 0;

  v7 = *(os_unfair_lock_s **)((char *)&self->super.isa + v3);
  swift_retain();
  os_unfair_lock_unlock(v7 + 4);

  swift_release();
}

- (id)xpcConnection
{
  uint64_t v2 = self;
  uint64_t v3 = sub_24CEE26FC();

  return v3;
}

- (id)xpcConnection_useEntitledIfOpen
{
  uint64_t v2 = self;
  uint64_t v3 = sub_24CEE398C();

  return v3;
}

- (void)handleUnexpectedDisconnect
{
  uint64_t v2 = self;
  sub_24CEE3578();
}

- (void)closeXPCNoReply
{
  uint64_t v2 = self;
  sub_24CEF60B4(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection);
}

- (void)pairedDockAccessoriesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C4E8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C4F0;
  v12[5] = v11;
  v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C4F8, (uint64_t)v12);
  swift_release();
}

- (void)_pairedDockAccessoriesWithCompletion:(id)a3
{
}

- (void)selectSubjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C4C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C4D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C4D8, (uint64_t)v14);
  swift_release();
}

- (void)_selectSubjects:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = (void *)sub_24CF3B470();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_24CF08998(v6, (uint64_t)v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();
}

- (void)selectSubjectAt:(CGPoint)a3 completionHandler:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  uint64_t v12 = (CGFloat *)swift_allocObject();
  v12[2] = x;
  v12[3] = y;
  *((void *)v12 + 4) = v11;
  *((void *)v12 + 5) = self;
  uint64_t v13 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C4A8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C4B0;
  v15[5] = v14;
  v16 = self;
  sub_24CF244A8((uint64_t)v10, (uint64_t)&unk_26983C4B8, (uint64_t)v15);
  swift_release();
}

- (void)_selectSubjectAt:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = _Block_copy(a4);
  _Block_copy(v7);
  uint64_t v8 = self;
  sub_24CF08F90((uint64_t)v8, (void (**)(void, void))v7, x, y);
  _Block_release(v7);
  _Block_release(v7);
}

- (void)setFramingModeWithMode:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C488;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C490;
  v14[5] = v13;
  v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C498, (uint64_t)v14);
  swift_release();
}

- (void)_setFramingModeWithMode:(int64_t)a3 completion:(id)a4
{
}

- (void)setRectOfInterestWithRect:(CGRect)a3 completionHandler:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  v14[2] = x;
  v14[3] = y;
  v14[4] = width;
  v14[5] = height;
  *((void *)v14 + 6) = v13;
  *((void *)v14 + 7) = self;
  uint64_t v15 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C468;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983C470;
  v17[5] = v16;
  v18 = self;
  sub_24CF244A8((uint64_t)v12, (uint64_t)&unk_26983C478, (uint64_t)v17);
  swift_release();
}

- (void)_setRectOfInterestWithRect:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = _Block_copy(a4);
  _Block_copy(v9);
  uint64_t v10 = self;
  sub_24CF09C14((uint64_t)v10, (void (**)(void, void))v9, x, y, width, height);
  _Block_release(v9);
  _Block_release(v9);
}

- (void)getClientConfigurationUpdatesWithDelegate:(_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_ *)a3 appID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C448;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C450;
  v16[5] = v15;
  swift_unknownObjectRetain();
  uint64_t v17 = a4;
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C458, (uint64_t)v16);
  swift_release();
}

- (void)_getClientConfigurationUpdatesWithDelegate:(id)a3 appID:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = (void *)sub_24CF3B320();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v12 = self;
  sub_24CF06754(a3, v8, v10, sub_24CF187D0, v11, v12);
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)setFramingModeEventWithMode:(int64_t)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  uint64_t v6 = MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  uint64_t v8 = self;
  swift_unknownObjectRelease();
  if (v6 && (uint64_t v7 = (void *)MEMORY[0x253318A80](v5)) != 0)
  {
    objc_msgSend(v7, sel_setFramingModeEventWithMode_, a3);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)selectSubjectAtEventWithX:(id)a3 y:(id)a4
{
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  uint64_t v8 = MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  id v12 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  swift_unknownObjectRelease();
  if (v8 && (uint64_t v11 = (void *)MEMORY[0x253318A80](v7)) != 0)
  {
    objc_msgSend(v11, sel_selectSubjectAtEventWithX_y_, v12, v9);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)selectSubjectsEvent:(id)a3
{
  sub_24CF3B470();
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  uint64_t v5 = MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate);
  uint64_t v6 = self;
  swift_unknownObjectRelease();
  if (v5 && (uint64_t v7 = MEMORY[0x253318A80](v4)) != 0)
  {
    uint64_t v8 = (void *)v7;
    id v9 = (void *)sub_24CF3B450();
    objc_msgSend(v8, sel_selectSubjectsEvent_, v9);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)setRectOfInterestEventWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  uint64_t v9 = MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  uint64_t v11 = self;
  swift_unknownObjectRelease();
  if (v9 && (uint64_t v10 = (void *)MEMORY[0x253318A80](v8)) != 0)
  {
    objc_msgSend(v10, sel_setRectOfInterestEventWithRect_, x, y, width, height);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)sendCommandEventWithCommand:(id)a3
{
  id v4 = a3;
  uint64_t v13 = self;
  uint64_t v5 = sub_24CF3A870();
  unint64_t v7 = v6;

  uint64_t v8 = (char *)v13 + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  uint64_t v9 = MEMORY[0x253318A80]((char *)v13 + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate);
  swift_unknownObjectRelease();
  if (v9)
  {
    uint64_t v10 = MEMORY[0x253318A80](v8);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = (void *)sub_24CF3A860();
      objc_msgSend(v11, sel_sendCommandEventWithCommand_, v12);

      swift_unknownObjectRelease();
    }
  }
  sub_24CE3D2EC(v5, v7);
}

- (void)connectedDockAccessoryWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C428;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C430;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C438, (uint64_t)v12);
  swift_release();
}

- (void)_connectedDockAccessoryWithCompletion:(id)a3
{
}

- (void)dockedDockAccessoryWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C408;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C410;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C418, (uint64_t)v12);
  swift_release();
}

- (void)_dockedDockAccessoryWithCompletion:(id)a3
{
}

- (void)getDockTrackingButtonStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C3E8;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C3F0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C3F8, (uint64_t)v12);
  swift_release();
}

- (void)_getDockTrackingButtonStateWithCompletion:(id)a3
{
}

- (void)updateCameraSessionWithSession:(_TtC11DockKitCore24CameraSessionInformation *)a3 new:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C3C0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C3C8;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C3D0, (uint64_t)v16);
  swift_release();
}

- (void)_updateCameraSessionWithSession:(id)a3 new:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  uint64_t v10 = a3;
  uint64_t v9 = self;
  sub_24CF0B518(v10, v5, (uint64_t)v9, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)_updateTrackingSummaryDebugWithData:(id)a3 completion:(id)a4
{
}

- (void)_updateTrackingSummaryWithData:(id)a3 completion:(id)a4
{
}

- (void)setSystemTrackingEnabledWithEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C3A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C3A8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C3B0, (uint64_t)v14);
  swift_release();
}

- (void)_setSystemTrackingEnabledWithEnabled:(BOOL)a3 completion:(id)a4
{
}

- (void)getSystemTrackingEnabledWithAppID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C380;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C388;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C390, (uint64_t)v14);
  swift_release();
}

- (void)_getSystemTrackingEnabledWithAppID:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  uint64_t v6 = (uint8_t *)sub_24CF3B320();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_24CF0CD18(v6, v8, (char *)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();
}

- (BOOL)getStateEventsWithDelegate:(id)a3 syncWithDaemon:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  DockCoreManager.getStateEvents(delegate:syncWithDaemon:)((uint64_t)a3, v5);
  swift_unknownObjectRelease();

  return 1;
}

- (void)stopStateEvents
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification);
  if (v2)
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification) = 0;
    uint64_t v3 = self;
  }
  else
  {
    id v4 = self;
  }
  BOOL v5 = self;
  uint64_t v6 = *(_TtC11DockKitCore15DockCoreManager **)((char *)&self->super.isa
                                              + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification);
  if (v6)
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification) = 0;

    BOOL v5 = v6;
  }
}

- (BOOL)monitorSystemTrackingStateWithDelegate:(id)a3 appID:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_24CF3B320();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  DockCoreManager.monitorSystemTrackingState(delegate:appID:)((uint64_t)a3, v7, v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)notifyConfigDelegateWithAppID:(id)a3
{
  uint64_t v4 = sub_24CF3B320();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_24CEEF6C8(v4, v6);
  swift_bridgeObjectRelease();
}

- (void)setCachedConnectedWithConnected:(id)a3
{
  uint64_t v5 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_allocatedLock);
  id v6 = a3;
  uint64_t v7 = self;
  swift_retain();
  os_unfair_lock_lock(v5 + 5);
  sub_24CEEFD60((uint64_t)&v5[4], (uint64_t)v7, a3, "setCachedConnected: setting _connected to %@");
  os_unfair_lock_unlock(v5 + 5);

  swift_release();
}

- (void)setCachedButtonStateWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_allocatedLock);
  uint64_t v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 5);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__trackingButtonState) = (Class)v3;
  os_unfair_lock_unlock(v4 + 5);

  swift_release();
}

- (void)syncStateAndGenerateStateEvents:(unint64_t)a3
{
  BOOL v3 = self;
  sub_24CF0D388();
}

- (NSXPCConnection)_xpcConnection_Debug
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug));
}

- (void)set_xpcConnection_Debug:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug) = (Class)a3;
  id v3 = a3;
}

- (id)xpcConnection_Debug
{
  uint64_t v2 = self;
  id v3 = sub_24CEF1DA0();

  return v3;
}

- (void)closeXPCNoReply_Debug
{
  uint64_t v2 = self;
  sub_24CEF60B4(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug);
}

- (void)setDockAccessoryStateWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 docked:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C340;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C348;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C350, (uint64_t)v16);
  swift_release();
}

- (void)_setDockAccessoryStateWithInfo:(id)a3 docked:(int64_t)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v10 = a3;
  uint64_t v9 = self;
  sub_24CF0D5B8((uint64_t)v10, a4, (uint64_t)v9, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)triggerSystemEventWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 event:(_TtC11DockKitCore20AccessorySystemEvent *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C320;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C328;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C330, (uint64_t)v16);
  swift_release();
}

- (void)_triggerSystemEventWithInfo:(id)a3 event:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v11 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_24CF0DBF8((uint64_t)v11, (uint64_t)v9, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)getTrackerDebugNotificationsWithDelegate:(_TtP11DockKitCore23DockClientDebugProtocol_ *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C300;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C308;
  v14[5] = v13;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C310, (uint64_t)v14);
  swift_release();
}

- (void)_getTrackerDebugNotificationsWithDelegate:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_24CF073BC(a3, (void (*)(void, void))sub_24CF18798, v7, (char *)v8);
  swift_release();

  swift_unknownObjectRelease();
}

- (void)stopTrackerDebugNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C2E0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C2E8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C2F0, (uint64_t)v12);
  swift_release();
}

- (void)_stopTrackerDebugNotificationsWithCompletion:(id)a3
{
}

- (void)getAccessoryDescriptionWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore27XPCDataStreamClientProtocol_ *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C2C0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C2C8;
  v16[5] = v15;
  uint64_t v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C2D0, (uint64_t)v16);
  swift_release();
}

- (void)_getAccessoryDescriptionWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v10 = a3;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_24CF0E890(a3, (uint8_t *)a4, (uint64_t)v9, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_unknownObjectRelease();
}

- (NSXPCConnection)_xpcConnection_Certification
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification));
}

- (void)set_xpcConnection_Certification:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification) = (Class)a3;
  id v3 = a3;
}

- (id)xpcConnection_Cert
{
  uint64_t v2 = self;
  id v3 = sub_24CEF58E8();

  return v3;
}

- (void)closeXPCNoReply_Cert
{
  uint64_t v2 = self;
  sub_24CEF60B4(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification);
}

- (void)getAccessoryDiagnosticsWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 options:(NSDictionary *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983C2A0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983C2A8;
  v18[5] = v17;
  uint64_t v19 = a3;
  swift_unknownObjectRetain();
  uint64_t v20 = a5;
  v21 = self;
  sub_24CF244A8((uint64_t)v13, (uint64_t)&unk_26983C2B0, (uint64_t)v18);
  swift_release();
}

- (void)_getAccessoryDiagnosticsWithInfo:(id)a3 delegate:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  sub_24CE44BB4(0, (unint64_t *)&unk_26983A1E0);
  uint64_t v10 = sub_24CF3B2A0();
  _Block_copy(v9);
  id v12 = a3;
  swift_unknownObjectRetain();
  uint64_t v11 = self;
  sub_24CF0EE8C((uint8_t *)a3, (uint64_t)a4, v10, (uint64_t)v11, (void (**)(void, void))v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)getAccessoryDiagnosticsWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 options:(NSDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C280;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C288;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C290, (uint64_t)v16);
  swift_release();
}

- (void)_getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_24CE44BB4(0, (unint64_t *)&unk_26983A1E0);
  uint64_t v8 = (uint8_t *)sub_24CF3B2A0();
  _Block_copy(v7);
  id v10 = a3;
  uint64_t v9 = self;
  sub_24CF0F4D4(a3, v8, (uint64_t)v9, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
}

- (void)manualFirmwareUpdateWithFilePath:(NSString *)a3 sandboxExt:(NSString *)a4 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983C260;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983C268;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  swift_unknownObjectRetain();
  v21 = self;
  sub_24CF244A8((uint64_t)v13, (uint64_t)&unk_26983C270, (uint64_t)v18);
  swift_release();
}

- (void)_manualFirmwareUpdateWithFilePath:(id)a3 sandboxExt:(id)a4 delegate:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = (void *)sub_24CF3B320();
  uint64_t v11 = v10;
  uint64_t v12 = sub_24CF3B320();
  uint64_t v14 = v13;
  _Block_copy(v8);
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  sub_24CF0FB04(v9, v11, v12, v14, (uint64_t)a5, (uint64_t)v15, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)haltWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C240;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C248;
  v16[5] = v15;
  uint64_t v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C250, (uint64_t)v16);
  swift_release();
}

- (void)_haltWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5
{
}

- (NSXPCConnection)_xpcConnection_CameraCapture
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture));
}

- (void)set_xpcConnection_CameraCapture:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture) = (Class)a3;
  id v3 = a3;
}

- (id)xpcConnection_CameraCapture
{
  uint64_t v2 = self;
  id v3 = (void *)sub_24CEE3A44();

  return v3;
}

- (void)closeXPCNoReply_CameraCapture
{
  uint64_t v2 = self;
  sub_24CEF60B4(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture);
}

- (void)rebootWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C218;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983C220;
  v16[5] = v15;
  uint64_t v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983C228, (uint64_t)v16);
  swift_release();
}

- (void)_rebootWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5
{
}

- (void)connectedClientsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C1F8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C200;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C208, (uint64_t)v12);
  swift_release();
}

- (void)_connectedClientsWithCompletion:(id)a3
{
}

- (void)versionsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C1D8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C1E0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C1E8, (uint64_t)v12);
  swift_release();
}

- (void)_versionsWithCompletion:(id)a3
{
}

- (void)migrateDataWithUpdate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C1B8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C1C0;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C1C8, (uint64_t)v14);
  swift_release();
}

- (void)_migrateDataWithUpdate:(BOOL)a3 completion:(id)a4
{
}

- (void)dumpStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983C198;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983C1A0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983C1A8, (uint64_t)v12);
  swift_release();
}

- (void)_dumpStateWithCompletion:(id)a3
{
}

- (void)unpairAccessoryWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C178;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C180;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C188, (uint64_t)v14);
  swift_release();
}

- (void)_unpairAccessoryWithInfo:(id)a3 completion:(id)a4
{
}

- (void)returnToBaseWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C158;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C160;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C168, (uint64_t)v14);
  swift_release();
}

- (void)_returnToBaseWithInfo:(id)a3 completion:(id)a4
{
}

- (void)dumpTrackerDiagsWithPath:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C130;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C138;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C140, (uint64_t)v14);
  swift_release();
}

- (void)_dumpTrackerDiagsWithPath:(id)a3 completion:(id)a4
{
}

- (void)dumpTrackerStatesWithPath:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C110;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C118;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C120, (uint64_t)v14);
  swift_release();
}

- (void)_dumpTrackerStatesWithPath:(id)a3 completion:(id)a4
{
}

- (void)searchWithCalibrate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C0F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C0F8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C100, (uint64_t)v14);
  swift_release();
}

- (void)_searchWithCalibrate:(BOOL)a3 completion:(id)a4
{
}

- (void)stopSearchWithCalibrate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C0D0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C0D8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C0E0, (uint64_t)v14);
  swift_release();
}

- (void)_stopSearchWithCalibrate:(BOOL)a3 completion:(id)a4
{
}

- (void)setDockTrackingButtonStateWithState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C0C0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983BBD0;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983B880, (uint64_t)v14);
  swift_release();
}

- (void)_setDockTrackingButtonStateWithState:(int64_t)a3 completion:(id)a4
{
}

- (void)dumpTrackerDiagnosticsWithPath:(id)a3
{
}

- (void)dumpTrackerStateWithPath:(id)a3
{
}

- (void)searchWithCalibrate:(BOOL)a3
{
}

- (void)stopSearchWithCalibrate:(BOOL)a3
{
}

- (void)returnToBase
{
  sub_24CF05574((char *)self, (uint64_t)a2, (SEL *)&selRef_returnToBase);
}

- (void)stopReturnToBase
{
}

- (void)accessoryDescriptionFeedbackWithProcessID:(int)a3 info:(id)a4 accessoryDescription:(id)a5 err:(id)a6
{
}

- (void)diagnosticsFeedbackWithProcessID:(int)a3 info:(id)a4 path:(id)a5 err:(id)a6
{
}

- (void)fwUpdateFeedbackWithProcessID:(int)a3 info:(id)a4 message:(id)a5 complete:(BOOL)a6 err:(id)a7
{
  uint64_t v10 = sub_24CF3B320();
  uint64_t v12 = v11;
  uint64_t v13 = *(os_unfair_lock_s **)((char *)&self->super.isa
                             + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_fwUpdateFeedbackLock);
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = a7;
  swift_retain();
  os_unfair_lock_lock(v13 + 5);
  sub_24CF05B2C((uint64_t)&v13[4], (uint64_t)v15, a3, (uint64_t)v14, v10, v12, a6, (uint64_t)a7);
  os_unfair_lock_unlock(v13 + 5);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)haltFeedbackWithProcessID:(int)a3 info:(id)a4 success:(BOOL)a5 complete:(BOOL)a6 err:(id)a7
{
}

- (void)rebootFeedbackWithProcessID:(int)a3 info:(id)a4 success:(BOOL)a5 complete:(BOOL)a6 err:(id)a7
{
}

@end