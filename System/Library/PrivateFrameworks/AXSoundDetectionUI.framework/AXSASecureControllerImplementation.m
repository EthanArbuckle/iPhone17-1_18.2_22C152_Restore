@interface AXSASecureControllerImplementation
- (BOOL)isListening;
- (BOOL)isSecure;
- (_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation)init;
- (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_)delegate;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)startListeningOnQueue:(id)a3;
- (void)stopListening;
@end

@implementation AXSASecureControllerImplementation

- (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isListening
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask) != 0;
}

- (BOOL)isSecure
{
  return 1;
}

- (_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation *)AXSASecureControllerImplementation.init()();
}

- (void)startListening
{
  v2 = self;
  sub_226F5A3E0();
}

- (void)startListeningOnQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F5A3E0();
}

- (void)stopListening
{
  v2 = self;
  sub_226F57938();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end