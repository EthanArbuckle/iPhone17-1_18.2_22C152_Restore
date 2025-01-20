@interface AXSDNSBaseControllerImplementation
- (BOOL)isListening;
- (BOOL)isSecure;
- (_TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation)init;
- (void)listenEngineDidStartWithInputFormat:(id)a3;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDNSBaseControllerImplementation

- (BOOL)isListening
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_isListening);
}

- (BOOL)isSecure
{
  return 0;
}

- (_TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation *)AXSDNSBaseControllerImplementation.init()();
}

- (void)startListening
{
  v2 = self;
  sub_226F48518();
}

- (void)stopListening
{
  v2 = self;
  sub_226F487A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener));
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5 = a3;
  v6 = self;
  AXSDNSBaseControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  AXSDNSBaseControllerImplementation.listenEngineFailedToStartWithError(_:)(a3);
}

@end