@interface ObjectTrackingAgent
+ (BOOL)trackingSummaryDebugEnabled;
- (BOOL)customInferenceEnabled;
- (BOOL)docked;
- (NSDate)lastSummaryPublishTime;
- (ObjectTrackingAgent)init;
- (ObjectTrackingAgent)initWithAppID:(id)a3;
- (ObjectTrackingAgent)initWithConfig:(id)a3;
- (ObjectTrackingAgent)initWithTrackerConfig:(id)a3;
- (double)publishSummaryPeriod;
- (id)dockKitFocusObservationFrom:(id)a3;
- (id)getDockCoreObservationsFrom:(id)a3 cameraPort:(id)a4;
- (id)getSelectedBodyIds;
- (id)getSelectedFaceIds;
- (id)getTrackedObjects;
- (void)deRegisterForDebugNotificationsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)disconnectedWithErr:(id)a3;
- (void)dumpTrackerDiagnosticsWithPath:(id)a3;
- (void)dumpTrackerStateWithPath:(id)a3;
- (void)flip180WithClockwise:(BOOL)a3;
- (void)getConnectedTrackerWithCompletionHandler:(id)a3;
- (void)isTrackingWithCompletionHandler:(id)a3;
- (void)processImageWithImage:(CIImage *)a3 faces:(NSArray *)a4 completionHandler:(id)a5;
- (void)registerForDebugNotificationsWithCompletionHandler:(id)a3;
- (void)registerForTrackingConfigChangesWithCompletionHandler:(id)a3;
- (void)returnToBase;
- (void)searchWithCalibrate:(BOOL)a3;
- (void)selectSubjectAtEventWithX:(id)a3 y:(id)a4;
- (void)selectSubjectAtPoint:(CGPoint)a3 completionHandler:(id)a4;
- (void)selectSubjects:(NSArray *)a3 completionHandler:(id)a4;
- (void)selectSubjectsEvent:(id)a3;
- (void)sendCommandEventWithCommand:(id)a3;
- (void)sendTrackingSummary;
- (void)sendUsageMetricWithCompletionHandler:(id)a3;
- (void)setFramingModeEventWithMode:(int64_t)a3;
- (void)setLastSummaryPublishTime:(id)a3;
- (void)setRectOfInterestEventWithRect:(CGRect)a3;
- (void)setRectOfInterestLocallyWithRect:(CGRect)a3 completionHandler:(id)a4;
- (void)setRectOfInterestWithRect:(CGRect)a3 completionHandler:(id)a4;
- (void)setupAgentWithTrustNotifications:(BOOL)a3 completionHandler:(id)a4;
- (void)stateEventWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6 completionHandler:(id)a7;
- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6;
- (void)stop;
- (void)stopReturnToBase;
- (void)stopSearchWithCalibrate:(BOOL)a3;
- (void)trackWithFocusObservation:(DKFocusObservation *)a3 metadata:(NSArray *)a4 image:(CIImage *)a5 cameraPortType:(NSString *)a6 cameraIntrinsics:(NSArray *)a7 referenceDimensions:(CGSize)a8 orientation:(int)a9 completionHandler:(id)a10;
- (void)trackWithMetadata:(NSArray *)a3 image:(CIImage *)a4 cameraPortType:(NSString *)a5 cameraIntrinsics:(NSArray *)a6 referenceDimensions:(CGSize)a7 orientation:(int)a8 completionHandler:(id)a9;
- (void)trackingButtonEnabledWithCompletionHandler:(id)a3;
- (void)trackingButtonStateChangedWithInfo:(id)a3 state:(int64_t)a4;
- (void)trackingEnabledForAppWithCompletionHandler:(id)a3;
- (void)trackingEnabledWithEnabled:(BOOL)a3 appID:(id)a4;
- (void)updateCameraSessionWithSession:(_TtC11DockKitCore24CameraSessionInformation *)a3 new:(BOOL)a4 completionHandler:(id)a5;
- (void)xpcConnected;
- (void)xpcDisconnected;
@end

@implementation ObjectTrackingAgent

- (BOOL)customInferenceEnabled
{
  uint64_t v2 = qword_269839D40;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  char v4 = byte_269847F68;
  if (byte_269847F68 == 2)
  {
    char v5 = *((unsigned char *)&v3->super.isa + OBJC_IVAR___ObjectTrackingAgent_customInferenceEnabledConfig);
  }
  else
  {

    return v4 & 1;
  }
  return v5;
}

+ (BOOL)trackingSummaryDebugEnabled
{
  if (qword_26B1824C8 != -1) {
    swift_once();
  }
  return byte_26B182791;
}

- (double)publishSummaryPeriod
{
  return 0.05;
}

- (NSDate)lastSummaryPublishTime
{
  uint64_t v3 = sub_24CF3A960();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR___ObjectTrackingAgent_lastSummaryPublishTime, v3);
  v7 = (void *)sub_24CF3A8F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v7;
}

- (void)setLastSummaryPublishTime:(id)a3
{
  uint64_t v4 = sub_24CF3A960();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CF3A920();
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))((char *)self + OBJC_IVAR___ObjectTrackingAgent_lastSummaryPublishTime, v7, v4);
}

- (ObjectTrackingAgent)init
{
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init()();
}

- (ObjectTrackingAgent)initWithAppID:(id)a3
{
  uint64_t v3 = sub_24CF3B320();
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init(appID:)(v3, v4);
}

- (ObjectTrackingAgent)initWithConfig:(id)a3
{
  uint64_t v3 = sub_24CF3B2A0();
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init(config:)(v3);
}

- (ObjectTrackingAgent)initWithTrackerConfig:(id)a3
{
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init(trackerConfig:)(a3);
}

- (void)dealloc
{
  uint64_t v2 = self;
  ObjectTrackingAgent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR___ObjectTrackingAgent_delegate);

  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___ObjectTrackingAgent_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_release();

  uint64_t v5 = (char *)self + OBJC_IVAR___ObjectTrackingAgent_lastSummaryPublishTime;
  uint64_t v6 = sub_24CF3A960();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjectTrackingAgent__selectedIDsLock);
}

- (void)isTrackingWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983AD58;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983AD60;
  v12[5] = v11;
  v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983AD68, (uint64_t)v12);
  swift_release();
}

- (void)trackWithMetadata:(NSArray *)a3 image:(CIImage *)a4 cameraPortType:(NSString *)a5 cameraIntrinsics:(NSArray *)a6 referenceDimensions:(CGSize)a7 orientation:(int)a8 completionHandler:(id)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a9);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a3;
  *(void *)(v22 + 24) = a4;
  *(void *)(v22 + 32) = a5;
  *(void *)(v22 + 40) = a6;
  *(CGFloat *)(v22 + 48) = width;
  *(CGFloat *)(v22 + 56) = height;
  *(_DWORD *)(v22 + 64) = a8;
  *(void *)(v22 + 72) = v21;
  *(void *)(v22 + 80) = self;
  uint64_t v23 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_26983AD38;
  v24[5] = v22;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_26983AD40;
  v25[5] = v24;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = self;
  sub_24CF244A8((uint64_t)v20, (uint64_t)&unk_26983AD48, (uint64_t)v25);
  swift_release();
}

- (void)trackWithFocusObservation:(DKFocusObservation *)a3 metadata:(NSArray *)a4 image:(CIImage *)a5 cameraPortType:(NSString *)a6 cameraIntrinsics:(NSArray *)a7 referenceDimensions:(CGSize)a8 orientation:(int)a9 completionHandler:(id)a10
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v19 - 8);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = _Block_copy(a10);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a3;
  *(void *)(v23 + 24) = a4;
  *(void *)(v23 + 32) = a5;
  *(void *)(v23 + 40) = a6;
  *(void *)(v23 + 48) = a7;
  *(CGFloat *)(v23 + 56) = width;
  *(CGFloat *)(v23 + 64) = height;
  *(_DWORD *)(v23 + 72) = a9;
  *(void *)(v23 + 80) = v22;
  *(void *)(v23 + 88) = self;
  uint64_t v24 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v21, 1, 1, v24);
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_26983AD18;
  v25[5] = v23;
  v26 = (void *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = &unk_26983AD20;
  v26[5] = v25;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  uint64_t v31 = a7;
  v32 = self;
  sub_24CF244A8((uint64_t)v21, (uint64_t)&unk_26983AD28, (uint64_t)v26);
  swift_release();
}

- (id)dockKitFocusObservationFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_24CE70F54(v4);

  return v6;
}

- (id)getDockCoreObservationsFrom:(id)a3 cameraPort:(id)a4
{
  uint64_t v6 = sub_24CF3B320();
  uint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  sub_24CE4B028(v9, v6, v8);

  swift_bridgeObjectRelease();
  type metadata accessor for DockCoreObservation();
  v11 = (void *)sub_24CF3B450();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)getSelectedFaceIds
{
  return sub_24CE4D678(self, (uint64_t)a2, (void (*)(void))sub_24CE4C918);
}

- (id)getSelectedBodyIds
{
  return sub_24CE4D678(self, (uint64_t)a2, (void (*)(void))sub_24CE4CEEC);
}

- (void)stop
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ObjectTrackingAgent_expectingDisconnect) = 1;
  uint64_t v6 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  uint64_t v8 = self;
  sub_24CE45CB8((uint64_t)v5, (uint64_t)&unk_26983AD08, (uint64_t)v7);
  swift_release();
}

- (id)getTrackedObjects
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjectTrackingAgent_lastFaces);
  uint64_t v3 = self;
  id v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26983A920);
  sub_24CF3B460();

  uint64_t v5 = (void *)sub_24CF3B450();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)processImageWithImage:(CIImage *)a3 faces:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983ACF0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983ACF8;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983AD00, (uint64_t)v16);
  swift_release();
}

- (BOOL)docked
{
  uint64_t v2 = self;
  BOOL v3 = sub_24CE4EB2C();

  return v3;
}

- (void)trackingButtonEnabledWithCompletionHandler:(id)a3
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
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983ACD0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983ACD8;
  v12[5] = v11;
  v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983ACE0, (uint64_t)v12);
  swift_release();
}

- (void)selectSubjectAtPoint:(CGPoint)a3 completionHandler:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (CGFloat *)swift_allocObject();
  v12[2] = x;
  v12[3] = y;
  *((void *)v12 + 4) = v11;
  *((void *)v12 + 5) = self;
  uint64_t v13 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983ACB0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983ACB8;
  v15[5] = v14;
  v16 = self;
  sub_24CF244A8((uint64_t)v10, (uint64_t)&unk_26983ACC0, (uint64_t)v15);
  swift_release();
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
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983AC90;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983AC98;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983ACA0, (uint64_t)v14);
  swift_release();
}

- (void)setRectOfInterestLocallyWithRect:(CGRect)a3 completionHandler:(id)a4
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
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983AC70;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983AC78;
  v17[5] = v16;
  uint64_t v18 = self;
  sub_24CF244A8((uint64_t)v12, (uint64_t)&unk_26983AC80, (uint64_t)v17);
  swift_release();
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
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983AC50;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983AC58;
  v17[5] = v16;
  uint64_t v18 = self;
  sub_24CF244A8((uint64_t)v12, (uint64_t)&unk_26983AC60, (uint64_t)v17);
  swift_release();
}

- (void)setupAgentWithTrustNotifications:(BOOL)a3 completionHandler:(id)a4
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
  v13[4] = &unk_26983AC30;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983AC38;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983AC40, (uint64_t)v14);
  swift_release();
}

- (void)registerForTrackingConfigChangesWithCompletionHandler:(id)a3
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
  v11[4] = &unk_26983AC10;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983AC18;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983AC20, (uint64_t)v12);
  swift_release();
}

- (void)registerForDebugNotificationsWithCompletionHandler:(id)a3
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
  v11[4] = &unk_26983ABF0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983ABF8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983AC00, (uint64_t)v12);
  swift_release();
}

- (void)deRegisterForDebugNotificationsWithCompletionHandler:(id)a3
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
  v11[4] = &unk_26983ABD0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983ABD8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983ABE0, (uint64_t)v12);
  swift_release();
}

- (void)trackingEnabledForAppWithCompletionHandler:(id)a3
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
  v11[4] = &unk_26983ABB0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983ABB8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983ABC0, (uint64_t)v12);
  swift_release();
}

- (void)getConnectedTrackerWithCompletionHandler:(id)a3
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
  v11[4] = &unk_26983AB90;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983AB98;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983ABA0, (uint64_t)v12);
  swift_release();
}

- (void)updateCameraSessionWithSession:(_TtC11DockKitCore24CameraSessionInformation *)a3 new:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
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
  v15[4] = &unk_26983AB70;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983AB78;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983AB80, (uint64_t)v16);
  swift_release();
}

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  id v16 = a3;
  uint64_t v17 = self;
  id v18 = v16;
  sub_24CE45CB8((uint64_t)v13, (uint64_t)&unk_26983AB60, (uint64_t)v15);
  swift_release();
}

- (void)stateEventWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_26983AB48;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_26983AB50;
  v20[5] = v19;
  v21 = a3;
  uint64_t v22 = self;
  sub_24CF244A8((uint64_t)v15, (uint64_t)&unk_26983AB58, (uint64_t)v20);
  swift_release();
}

- (void)trackingButtonStateChangedWithInfo:(id)a3 state:(int64_t)a4
{
  id v7 = a3;
  uint64_t v6 = self;
  sub_24CE5F0B4(v7, a4);
}

- (void)disconnectedWithErr:(id)a3
{
  uint64_t v5 = self;
  id v4 = a3;
  sub_24CE60444(a3);
}

- (void)xpcConnected
{
  uint64_t v2 = self;
  sub_24CE61B4C();
}

- (void)xpcDisconnected
{
  uint64_t v2 = self;
  sub_24CE61CEC();
}

- (void)dumpTrackerDiagnosticsWithPath:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_24CE655F0((uint64_t)&unk_26FF431D0, (uint64_t)&unk_26FF431F8, (uint64_t)&unk_26983ADE0);
}

- (void)dumpTrackerStateWithPath:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_24CE655F0((uint64_t)&unk_26FF43180, (uint64_t)&unk_26FF431A8, (uint64_t)&unk_26983ADC8);
}

- (void)searchWithCalibrate:(BOOL)a3
{
  id v4 = self;
  sub_24CE6384C(a3);
}

- (void)stopSearchWithCalibrate:(BOOL)a3
{
  id v4 = self;
  sub_24CE64154(a3);
}

- (void)returnToBase
{
  uint64_t v2 = self;
  sub_24CE64D28();
}

- (void)stopReturnToBase
{
  uint64_t v2 = self;
  sub_24CE655B4();
}

- (void)flip180WithClockwise:(BOOL)a3
{
  id v4 = self;
  sub_24CE66070(a3);
}

- (void)trackingEnabledWithEnabled:(BOOL)a3 appID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = sub_24CF3B320();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_24CE66A04(v4, v6, v8);
  swift_bridgeObjectRelease();
}

- (void)setFramingModeEventWithMode:(int64_t)a3
{
  BOOL v4 = self;
  sub_24CE67504(a3);
}

- (void)selectSubjectAtEventWithX:(id)a3 y:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t v7 = self;
  sub_24CE67E90(v8, v6);
}

- (void)selectSubjectsEvent:(id)a3
{
  uint64_t v4 = sub_24CF3B470();
  id v5 = self;
  sub_24CE69870(v4);
  swift_bridgeObjectRelease();
}

- (void)setRectOfInterestEventWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = self;
  sub_24CE6B260(x, y, width, height);
}

- (void)sendCommandEventWithCommand:(id)a3
{
  id v4 = a3;
  id v8 = self;
  uint64_t v5 = sub_24CF3A870();
  unint64_t v7 = v6;

  sub_24CE6C7F0();
  sub_24CE3D2EC(v5, v7);
}

- (void)sendUsageMetricWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983AB38;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BBD0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983B880, (uint64_t)v12);
  swift_release();
}

- (void)sendTrackingSummary
{
  uint64_t v2 = self;
  sub_24CE6E224();
}

@end