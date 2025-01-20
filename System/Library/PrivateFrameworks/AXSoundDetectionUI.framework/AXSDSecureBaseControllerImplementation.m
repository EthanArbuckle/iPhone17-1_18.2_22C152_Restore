@interface AXSDSecureBaseControllerImplementation
- (BOOL)isListening;
- (BOOL)isSecure;
- (_TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation)init;
- (void)dealloc;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDSecureBaseControllerImplementation

- (BOOL)isListening
{
  v2 = (char *)self + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) != 0;
}

- (BOOL)isSecure
{
  return 1;
}

- (_TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation *)AXSDSecureBaseControllerImplementation.init()();
}

- (void)dealloc
{
  uint64_t v2 = qword_268162050;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_226F7AA58();
  __swift_project_value_buffer(v4, (uint64_t)qword_268162638);
  v5 = sub_226F7AA48();
  os_log_type_t v6 = sub_226F7AC58();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_226F20000, v5, v6, "Deinitializing Base Secure Sound Detection Controller", v7, 2u);
    MEMORY[0x22A66FDC0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AXSDSecureBaseControllerImplementation();
  [(AXSDSecureBaseControllerImplementation *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startListening
{
  uint64_t v2 = self;
  sub_226F618BC();
}

- (void)stopListening
{
  uint64_t v2 = self;
  sub_226F61B10();
}

@end