@interface AXSANSControllerImplementation
- (BOOL)isListening;
- (_TtC18AXSoundDetectionUI30AXSANSControllerImplementation)init;
- (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_)delegate;
- (void)listenEngineDidStartWithInputFormat:(id)a3;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)listeningStoppedWithError:(id)a3;
- (void)receivedBuffer:(id)a3 atTime:(id)a4;
- (void)receivedError:(id)a3 fromDetector:(id)a4;
- (void)receivedObservation:(id)a3 forDetector:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)startListeningOnQueue:(id)a3;
- (void)stopListening;
@end

@implementation AXSANSControllerImplementation

- (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

- (_TtC18AXSoundDetectionUI30AXSANSControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI30AXSANSControllerImplementation *)AXSANSControllerImplementation.init()();
}

- (void)startListening
{
  v2 = self;
  sub_226F5B45C(0);
}

- (void)startListeningOnQueue:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_226F5B45C(a3);
}

- (void)stopListening
{
  v2 = self;
  sub_226F5BD94();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue));
  swift_unknownObjectRelease();
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  unsigned __int8 v6 = (objc_class *)a3;
  id v7 = a4;
  v9 = self;
  v8.super.super.isa = v6;
  v8.super._impl = v7;
  AXSANSControllerImplementation.receivedBuffer(_:at:)(v8, (AVAudioTime *)v9);
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  AXSANSControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  AXSANSControllerImplementation.listenEngineFailedToStartWithError(_:)(a3);
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  AVAudioPCMBuffer v8 = self;
  _s18AXSoundDetectionUI30AXSANSControllerImplementationC19receivedObservation_11forDetectorySo20SNSoundActionsResultC_So20SNDetectSoundRequestCtF_0(v6);
}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  AXSANSControllerImplementation.receivedError(_:fromDetector:)(v8, v6);
}

- (void)listeningStoppedWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  AXSANSControllerImplementation.listeningStoppedWithError(_:)(a3);
}

@end