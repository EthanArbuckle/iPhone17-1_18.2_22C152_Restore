@interface AXSDSecureControllerImplementation
- (NSSet)currentDetectionTypes;
- (_TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation)init;
- (void)addWithListenType:(id)a3;
- (void)dealloc;
- (void)removeAllListenTypes;
- (void)removeWithListenType:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDSecureControllerImplementation

- (NSSet)currentDetectionTypes
{
  v2 = self;
  sub_226F55990();

  type metadata accessor for AXSDSoundDetectionType();
  sub_226F573A0(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  v3 = (void *)sub_226F7ABF8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (_TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation)init
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162638);
  v4 = sub_226F7AA48();
  os_log_type_t v5 = sub_226F7AC58();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_226F20000, v4, v5, "Initializing Secure Sound Detection Controller", v6, 2u);
    MEMORY[0x22A66FDC0](v6, -1, -1);
  }

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  return [(AXSDSecureBaseControllerImplementation *)&v8 init];
}

- (void)dealloc
{
  uint64_t v2 = qword_268162050;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_226F7AA58();
  __swift_project_value_buffer(v4, (uint64_t)qword_268162638);
  os_log_type_t v5 = sub_226F7AA48();
  os_log_type_t v6 = sub_226F7AC58();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_226F20000, v5, v6, "Deinitializing Secure Sound Detection Controller", v7, 2u);
    MEMORY[0x22A66FDC0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  [(AXSDSecureBaseControllerImplementation *)&v8 dealloc];
}

- (void)addWithListenType:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = self;
  sub_226F56084(v4);
}

- (void)removeWithListenType:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = self;
  sub_226F561B8(v4);
}

- (void)removeAllListenTypes
{
  uint64_t v2 = self;
  sub_226F61688();
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