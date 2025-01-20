@interface AXSDNSControllerImplementation
- (AXSDDetectorManager)detectorManager;
- (BOOL)isListening;
- (NSSet)currentDetectionTypes;
- (_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation)init;
- (id)pipeInFilePath:(id)a3 error:(id *)a4;
- (id)pipeInFileURL:(id)a3 error:(id *)a4;
- (void)addWithListenType:(id)a3;
- (void)listenEngineDidStartWithInputFormat:(id)a3;
- (void)listenEngineFinishedAudioFile:(id)a3;
- (void)listenEngineReceivedAudioFile:(id)a3;
- (void)receivedBuffer:(id)a3 atTime:(id)a4;
- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5;
- (void)receivedCompletion:(id)a3;
- (void)receivedError:(id)a3 fromDetector:(id)a4;
- (void)receivedObservation:(id)a3 forDetector:(id)a4;
- (void)removeAllListenTypes;
- (void)removeWithListenType:(id)a3;
- (void)setDetectorManager:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDNSControllerImplementation

- (AXSDDetectorManager)detectorManager
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return (AXSDDetectorManager *)*v2;
}

- (void)setDetectorManager:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSSet)currentDetectionTypes
{
  v3 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  uint64_t v7 = sub_226F7AB58();

  sub_226F46CDC(v7);
  swift_bridgeObjectRelease();
  sub_226F75450(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  v8 = (void *)sub_226F7ABF8();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (BOOL)isListening
{
  v3 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  id v4 = *v3;
  v5 = self;
  if (objc_msgSend(v4, sel_containsListenDelegate_, v5)) {
    unsigned __int8 v6 = objc_msgSend(*v3, sel_isListening);
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *)sub_226F6FCA0();
}

- (void)addWithListenType:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F6FE5C(v4);
}

- (void)removeWithListenType:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F6FED8(v4);
}

- (void)removeAllListenTypes
{
  v2 = self;
  sub_226F701BC();
}

- (void)startListening
{
  v2 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC28assetsReadyAndDetectorsAddedyyF_0();
}

- (void)stopListening
{
  v2 = self;
  sub_226F70A00();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager));
  swift_bridgeObjectRelease();
}

- (id)pipeInFileURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_226F7A898();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226F7A878();
  v9 = self;
  AXSDNSControllerImplementation.pipe(inFileURL:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  type metadata accessor for AXSDSoundDetectionType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162738);
  sub_226F75450(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  v10 = (void *)sub_226F7AAA8();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)pipeInFilePath:(id)a3 error:(id *)a4
{
  uint64_t v5 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  unint64_t v7 = v6;
  v8 = self;
  AXSDNSControllerImplementation.pipe(inFilePath:)(v5, v7);
  swift_bridgeObjectRelease();

  type metadata accessor for AXSDSoundDetectionType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162738);
  sub_226F75450(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  v9 = (void *)sub_226F7AAA8();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  id v6 = a3;
  id v7 = a4;
  id v8 = v9.receiver;
  [(AXSDNSBaseControllerImplementation *)&v9 receivedBuffer:v6 atTime:v7];
  objc_msgSend(v8, sel_receivedBuffer_atTime_isFile_, v6, v7, 0, v9.receiver, v9.super_class);
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC14receivedBuffer_2at6isFileySo16AVAudioPCMBufferC_So0K4TimeCSbtF_0((uint64_t)v7, (uint64_t)v8);
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5 = a3;
  id v6 = self;
  AXSDNSControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);
}

- (void)listenEngineReceivedAudioFile:(id)a3
{
  id v4 = (objc_class *)a3;
  v5._id impl = self;
  id impl = v5._impl;
  v5.super.isa = v4;
  AXSDNSControllerImplementation.listenEngineReceivedAudioFile(_:)(v5);
}

- (void)listenEngineFinishedAudioFile:(id)a3
{
  id v4 = (objc_class *)a3;
  v5._id impl = self;
  id impl = v5._impl;
  v5.super.isa = v4;
  AXSDNSControllerImplementation.listenEngineFinishedAudioFile(_:)(v5);
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  AXSDNSControllerImplementation.receivedObservation(_:forDetector:)(v6, v7);
}

- (void)receivedCompletion:(id)a3
{
  id v4 = a3;
  AVAudioFile v5 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC18receivedCompletionyySo20SNDetectSoundRequestCF_0(v4);
}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC13receivedError_12fromDetectorys0G0_p_So20SNDetectSoundRequestCtF_0(v8, v6);
}

@end