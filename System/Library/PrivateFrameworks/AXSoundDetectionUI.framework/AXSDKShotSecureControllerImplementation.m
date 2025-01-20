@interface AXSDKShotSecureControllerImplementation
- (NSSet)currentDetectionTypes;
- (_TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation)init;
- (void)addWithCustomDetector:(id)a3;
- (void)dealloc;
- (void)removeAllListenTypes;
- (void)removeWithCustomDetector:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDKShotSecureControllerImplementation

- (NSSet)currentDetectionTypes
{
  v2 = self;
  sub_226F49CBC();

  v3 = (void *)sub_226F7ABF8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (_TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *)AXSDKShotSecureControllerImplementation.init()();
}

- (void)dealloc
{
  type metadata accessor for AXSDKShotMonitor();
  v3 = self;
  swift_initStaticObject();
  sub_226F5E8F4();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AXSDKShotSecureControllerImplementation();
  [(AXSDSecureBaseControllerImplementation *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation_detectorQueueManager));
}

- (void)addWithCustomDetector:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F4A3A0(v4);
}

- (void)removeWithCustomDetector:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_226F4A428(v4);
}

- (void)removeAllListenTypes
{
  v2 = self;
  sub_226F61688();
}

- (void)startListening
{
  v2 = self;
  sub_226F618BC();
}

- (void)stopListening
{
  v2 = self;
  sub_226F61B10();
}

@end