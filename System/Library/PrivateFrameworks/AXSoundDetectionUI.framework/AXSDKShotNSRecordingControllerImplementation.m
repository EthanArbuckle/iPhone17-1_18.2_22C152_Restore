@interface AXSDKShotNSRecordingControllerImplementation
- (AXSDDetectorManager)detectorManager;
- (BOOL)isListening;
- (BOOL)isSecure;
- (BOOL)kickoffMLTrainingOfDetector:(id)a3 error:(id *)a4;
- (BOOL)retrainModelWithIdentifier:(id)a3;
- (NSSet)currentDetectionTypes;
- (_TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation)init;
- (void)addWithListenType:(id)a3;
- (void)assetsReadyAndDetectorsAdded;
- (void)deregisterWithListener:(id)a3;
- (void)hearingMLHelperService:(id)a3 eventOccurred:(int64_t)a4;
- (void)listenEngineDidStartWithInputFormat:(id)a3;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)receivedBuffer:(id)a3 atTime:(id)a4;
- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5;
- (void)receivedCompletion:(id)a3;
- (void)receivedError:(id)a3 fromDetector:(id)a4;
- (void)receivedObservation:(id)a3 forDetector:(id)a4;
- (void)registerWithListener:(id)a3 forRecordingUpdates:(id)a4;
- (void)removeAllListenTypes;
- (void)removeWithListenType:(id)a3;
- (void)savedTrainingRecordingForDetector:(id)a3;
- (void)setDetectorManager:(id)a3;
- (void)startListening;
- (void)startListeningToTrainDetector:(id)a3;
- (void)stopListening;
@end

@implementation AXSDKShotNSRecordingControllerImplementation

- (AXSDDetectorManager)detectorManager
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return (AXSDDetectorManager *)*v2;
}

- (void)setDetectorManager:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)isListening
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_isListening);
}

- (NSSet)currentDetectionTypes
{
  v3 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  uint64_t v7 = sub_226F7AB58();

  sub_226F46CDC(v7);
  swift_bridgeObjectRelease();
  sub_226F5581C(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  v8 = (void *)sub_226F7ABF8();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (BOOL)isSecure
{
  return 0;
}

- (_TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation)init
{
  AXSDKShotNSRecordingControllerImplementation.init()();
  return result;
}

- (void)startListening
{
  v2 = self;
  sub_226F4D9E0();
}

- (void)startListeningToTrainDetector:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F4DA58(v4);
}

- (void)stopListening
{
  v2 = self;
  sub_226F4DECC();
}

- (void)registerWithListener:(id)a3 forRecordingUpdates:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_226F4E44C(v8, (uint64_t)sub_226F55808, v7);

  swift_release();
}

- (void)deregisterWithListener:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F4EB0C(v4);
}

- (BOOL)retrainModelWithIdentifier:(id)a3
{
  uint64_t v4 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  LOBYTE(v4) = sub_226F4F16C(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)addWithListenType:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_226F4F738(v4);
}

- (void)removeWithListenType:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_226F4F7B4(v4);
}

- (void)removeAllListenTypes
{
  v2 = self;
  sub_226F4FA98();
}

- (BOOL)kickoffMLTrainingOfDetector:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_226F50B6C(v5);

  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer);
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  AXSDKShotNSRecordingControllerImplementation.listenEngineFailedToStartWithError(_:)(a3);
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self;
  AXSDKShotNSRecordingControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  unint64_t v6 = (objc_class *)a3;
  id v7 = a4;
  v9 = self;
  v8.super.super.isa = v6;
  v8.super._impl = v7;
  AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:)(v8, (AVAudioTime *)v9);
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  BOOL v5 = a5;
  AVAudioPCMBuffer v8 = (objc_class *)a3;
  id v9 = a4;
  v10 = self;
  char v11 = (char)v10;
  v13 = v10;
  v12.super.super.isa = v8;
  v12.super._impl = v9;
  AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:isFile:)(v12, (AVAudioTime *)v5, v11);
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  AVAudioPCMBuffer v8 = self;
  AXSDKShotNSRecordingControllerImplementation.receivedObservation(_:forDetector:)(v6, v7);
}

- (void)receivedCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  AXSDKShotNSRecordingControllerImplementation.receivedCompletion(_:)(v4);
}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  AXSDKShotNSRecordingControllerImplementation.receivedError(_:fromDetector:)(v8, v6);
}

- (void)assetsReadyAndDetectorsAdded
{
  v2 = self;
  AXSDKShotNSRecordingControllerImplementation.assetsReadyAndDetectorsAdded()();
}

- (void)savedTrainingRecordingForDetector:(id)a3
{
  id v5 = a3;
  id v6 = self;
  AXSDKShotNSRecordingControllerImplementation.savedTrainingRecording(for:)((AXSDKShotDetector_optional *)a3);
}

- (void)hearingMLHelperService:(id)a3 eventOccurred:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_226F54930();
}

@end