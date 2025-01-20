@interface AXSDKShotNSControllerImplementation
- (BOOL)isListening;
- (NSSet)currentDetectionTypes;
- (_TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation)init;
- (void)addWithCustomDetector:(id)a3;
- (void)dealloc;
- (void)listenEngineDidStartWithInputFormat:(id)a3;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)receivedBuffer:(id)a3 atTime:(id)a4;
- (void)receivedCompletion:(id)a3;
- (void)receivedError:(id)a3 fromDetector:(id)a4;
- (void)receivedObservation:(id)a3 forDetector:(id)a4;
- (void)removeAllListenTypes;
- (void)removeWithCustomDetector:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDKShotNSControllerImplementation

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

- (NSSet)currentDetectionTypes
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_currentDetectors);
  uint64_t v5 = sub_226F7AB58();

  sub_226F46544(v5);
  swift_bridgeObjectRelease();
  unsigned __int8 v6 = (void *)sub_226F7ABF8();
  swift_bridgeObjectRelease();
  return (NSSet *)v6;
}

- (_TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *)sub_226F41450();
}

- (void)dealloc
{
  type metadata accessor for AXSDKShotMonitor();
  v3 = self;
  swift_initStaticObject();
  sub_226F5E8F4();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AXSDKShotNSControllerImplementation();
  [(AXSDKShotNSControllerImplementation *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager));
}

- (void)startListening
{
  v2 = self;
  sub_226F41ADC();
}

- (void)stopListening
{
  v2 = self;
  sub_226F41F18();
}

- (void)addWithCustomDetector:(id)a3
{
}

- (void)removeWithCustomDetector:(id)a3
{
}

- (void)removeAllListenTypes
{
  v2 = self;
  sub_226F42668();
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  AXSDKShotNSControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  objc_super v4 = self;
  id v5 = a3;
  AXSDKShotNSControllerImplementation.listenEngineFailedToStartWithError(_:)(a3);
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  AXSDKShotNSControllerImplementation.receivedObservation(_:forDetector:)((SNClassificationResult)v6, (SNClassifySoundRequest)v7);
}

- (void)receivedCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AXSDKShotNSControllerImplementation.receivedCompletion(_:)((SNClassifySoundRequest)v4);
}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  AXSDKShotNSControllerImplementation.receivedError(_:fromDetector:)(v8, v6);
}

@end