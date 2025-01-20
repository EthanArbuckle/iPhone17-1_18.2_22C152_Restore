void type metadata accessor for CAFMediaSourceSemanticType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for CAFMediaSourceSemanticType)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for CAFMediaSourceSemanticType);
    }
  }
}

BOOL specialized == infix<A>(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CAFMediaSourceSemanticType@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = CAFMediaSourceSemanticType.init(rawValue:)(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t CAFMediaSourceSemanticType.init(rawValue:)(uint64_t result)
{
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance CAFMediaSourceSemanticType@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CAFMediaSourceSemanticType.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CAFMediaSourceSemanticType()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(Swift::UInt8 a1)
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CAFMediaSourceSemanticType(int a1)
{
  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(int a1, Swift::UInt8 a2)
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CAFMediaSourceSemanticType(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, Swift::UInt8 a2)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CAFMediaSourceSemanticType(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType()
{
  unint64_t result = lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType;
  if (!lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType)
  {
    type metadata accessor for CAFMediaSourceSemanticType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType);
  }
  return result;
}

uint64_t key path getter for CarPlayConnectionManager.car_queue : CarPlayConnectionManager@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
  *a2 = result;
  return result;
}

void key path setter for CarPlayConnectionManager.car_queue : CarPlayConnectionManager(id *a1)
{
}

id CarPlayConnectionManager.car_queue.getter()
{
  OUTLINED_FUNCTION_2();
  v1 = *v0;
  return v1;
}

void CarPlayConnectionManager.car_queue.setter(void *a1)
{
}

uint64_t key path getter for CarPlayConnectionManager.carManager : CarPlayConnectionManager@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

void key path setter for CarPlayConnectionManager.carManager : CarPlayConnectionManager(id *a1)
{
}

id CarPlayConnectionManager.carManager.getter()
{
  OUTLINED_FUNCTION_2();
  v1 = *v0;
  return v1;
}

void CarPlayConnectionManager.carManager.setter(void *a1)
{
}

uint64_t key path getter for CarPlayConnectionManager.carManagerObservable : CarPlayConnectionManager@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA8))();
  *a2 = result;
  return result;
}

void key path setter for CarPlayConnectionManager.carManagerObservable : CarPlayConnectionManager(id *a1)
{
}

id CarPlayConnectionManager.carManagerObservable.getter()
{
  OUTLINED_FUNCTION_2();
  v1 = *v0;
  return v1;
}

void CarPlayConnectionManager.carManagerObservable.setter(void *a1)
{
}

void CarPlayConnectionManager.car_queue.setter(void *a1, void *a2)
{
  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;
}

id CarPlayConnectionManager.carRadioListener.getter()
{
  uint64_t v1 = OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener;
  uint64_t v2 = *(void **)((char *)v0 + OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener);
  if (v2)
  {
    id v3 = *(id *)((char *)v0 + OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener);
  }
  else
  {
    v4 = v0;
    v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
    id v6 = objc_allocWithZone((Class)type metadata accessor for RadioListener());
    id v7 = RadioListener.init(serialQueue:)(v5);
    v8 = *(void **)((char *)v4 + v1);
    *(void *)((char *)v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id CarPlayConnectionManager.__deallocating_deinit()
{
  uint64_t v1 = (id *)&v0[OBJC_IVAR___CarPlayConnectionManager_carManager];
  swift_beginAccess();
  objc_msgSend(*v1, sel_unregisterObserver_, v0);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CarPlayConnectionManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for CarPlayConnectionManager()
{
  return self;
}

char *CarPlayConnectionManager.__allocating_init(carManager:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CarPlayConnectionManager.init(carManager:)(a1);
}

char *CarPlayConnectionManager.init(carManager:)(void *a1)
{
  v20 = a1;
  uint64_t v24 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388]();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388]();
  uint64_t v23 = OBJC_IVAR___CarPlayConnectionManager_car_queue;
  uint64_t v21 = type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  id v6 = v1;
  static DispatchQoS.unspecified.getter();
  uint64_t v25 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v24);
  *(void *)(v22 + v23) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t v7 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v7 = MEMORY[0x263F8EE88];
  }
  v8 = v20;
  *(void *)&v6[OBJC_IVAR___CarPlayConnectionManager_cancellables] = v7;
  *(void *)&v6[OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener] = 0;
  *(void *)&v6[OBJC_IVAR___CarPlayConnectionManager_carManager] = v8;
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for CAFCarManager);
  lazy protocol witness table accessor for type CAFCar and conformance CAFCar(&lazy protocol witness table cache variable for type CAFCarManager and conformance CAFCarManager, (unint64_t *)&lazy cache variable for type metadata for CAFCarManager);
  id v9 = v8;
  *(void *)&v6[OBJC_IVAR___CarPlayConnectionManager_carManagerObservable] = CAFObserved<>.observable.getter();

  v10 = (objc_class *)type metadata accessor for CarPlayConnectionManager();
  v26.receiver = v6;
  v26.super_class = v10;
  v11 = (char *)objc_msgSendSuper2(&v26, sel_init);
  v12 = (void **)&v11[OBJC_IVAR___CarPlayConnectionManager_carManager];
  swift_beginAccess();
  v13 = *v12;
  v14 = v11;
  objc_msgSend(v13, sel_registerObserver_, v14);
  v15 = (id *)&v14[OBJC_IVAR___CarPlayConnectionManager_carManagerObservable];
  swift_beginAccess();
  v16 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v14) + 0x110);
  id v17 = *v15;
  v16();

  return v14;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type CAFCar and conformance CAFCar(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OS_dispatch_queue(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

Swift::Void __swiftcall CarPlayConnectionManager.resetListeners()()
{
  v0 = CarPlayConnectionManager.carRadioListener.getter();
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();

  uint64_t v2 = CarPlayConnectionManager.carRadioListener.getter();
  (*(void (**)(void))((*v1 & *v2) + 0x150))();
}

void one-time initialization function for shared()
{
  closure #1 in variable initialization expression of static CarPlayConnectionManager.shared();
  static CarPlayConnectionManager.shared = v0;
}

void closure #1 in variable initialization expression of static CarPlayConnectionManager.shared()
{
  uint64_t v0 = (objc_class *)type metadata accessor for CarPlayConnectionManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = outlined bridged method (mbbnb) of @objc NSBundle.path(forResource:ofType:)(0x5379616C50726143, 0xED0000616D656863, 0x7473696C70, 0xE500000000000000, v2);
  uint64_t v5 = v4;

  if (v5)
  {
    id v6 = objc_allocWithZone(MEMORY[0x263F30A48]);
    id v7 = @nonobjc CAFCarManager.init(registrationFilePath:)(v3, v5);
    id v8 = objc_allocWithZone(v0);
    CarPlayConnectionManager.init(carManager:)(v7);
  }
  else
  {
    __break(1u);
  }
}

id static CarPlayConnectionManager.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static CarPlayConnectionManager.shared;
  return v0;
}

void CarPlayConnectionManager.registerUpdateHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CarPlayConnectionManager.carRadioListener.getter();
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x160))(a1, a2);
}

uint64_t CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFCar?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>, CAFCar>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v2 = dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  id v9 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v2);
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  OUTLINED_FUNCTION_13(v3);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Published<CAFCar?>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<CAFCar?>.Publisher);
  lazy protocol witness table accessor for type CAFCar and conformance CAFCar((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue and conformance OS_dispatch_queue, &lazy cache variable for type metadata for OS_dispatch_queue);
  OUTLINED_FUNCTION_3();
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v1);

  uint64_t v4 = OUTLINED_FUNCTION_10();
  v5(v4);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFCar);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue> and conformance Publishers.ReceiveOn<A, B>, (uint64_t *)&demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  v6();
  swift_allocObject();
  OUTLINED_FUNCTION_11();
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>, CAFCar> and conformance Publishers.CompactMap<A, B>, &demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFCar?>.Publisher, OS_dispatch_queue>, CAFCar>);
  OUTLINED_FUNCTION_12();
  swift_release();
  OUTLINED_FUNCTION_4();
  v7();
  OUTLINED_FUNCTION_7();
  AnyCancellable.store(in:)();
  swift_endAccess();
  return swift_release();
}

id closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(a1, (uint64_t *)&demangling cache variable for type metadata for CAFCar?, "#radio: Connecting to CarPlay — received CAFCar: %s", a2);
}

void closure #2 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x22A616EA0](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFCar);
    lazy protocol witness table accessor for type CAFCar and conformance CAFCar((unint64_t *)&lazy protocol witness table cache variable for type CAFCar and conformance CAFCar, &lazy cache variable for type metadata for CAFCar);
    uint64_t v5 = (void *)CAFObserved<>.observable.getter();
    CarPlayConnectionManager.setupCarMediaConnection(_:)();
  }
}

uint64_t CarPlayConnectionManager.setupCarMediaConnection(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFMedia?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>, CAFMedia>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v2 = dispatch thunk of CAFCarObservable.$media.getter();
  id v9 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v2);
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  OUTLINED_FUNCTION_13(v3);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Published<CAFMedia?>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<CAFMedia?>.Publisher);
  lazy protocol witness table accessor for type CAFCar and conformance CAFCar((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue and conformance OS_dispatch_queue, &lazy cache variable for type metadata for OS_dispatch_queue);
  OUTLINED_FUNCTION_3();
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v1);

  uint64_t v4 = OUTLINED_FUNCTION_10();
  v5(v4);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFMedia);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue> and conformance Publishers.ReceiveOn<A, B>, &demangling cache variable for type metadata for Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  v6();
  swift_allocObject();
  OUTLINED_FUNCTION_11();
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>, CAFMedia> and conformance Publishers.CompactMap<A, B>, &demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<Published<CAFMedia?>.Publisher, OS_dispatch_queue>, CAFMedia>);
  OUTLINED_FUNCTION_12();
  swift_release();
  OUTLINED_FUNCTION_4();
  v7();
  OUTLINED_FUNCTION_7();
  AnyCancellable.store(in:)();
  swift_endAccess();
  return swift_release();
}

id closure #1 in CarPlayConnectionManager.setupCarMediaConnection(_:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(a1, &demangling cache variable for type metadata for CAFMedia?, "#radio: received CAFMedia item from CAFCar %s", a2);
}

id closure #1 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, const char *a3@<X2>, void *a4@<X8>)
{
  id v7 = *a1;
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)Log);
  id v19 = v7;
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v18 = a4;
    v11 = a3;
    v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v13;
    *(_DWORD *)v12 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v14 = Optional.debugDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    v16 = v11;
    a4 = v18;
    _os_log_impl(&dword_22475B000, v9, v10, v16, v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A616E10](v13, -1, -1);
    MEMORY[0x22A616E10](v12, -1, -1);
  }
  else
  {
  }
  *a4 = v7;
  return v19;
}

void closure #2 in CarPlayConnectionManager.setupCarMediaConnection(_:)(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A616EA0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (one-time initialization token for Log != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)Log);
    id v7 = v2;
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = v11;
      *(_DWORD *)os_log_type_t v10 = 136315138;
      id v12 = objc_msgSend(v7, sel_debugDescription);
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v15, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22475B000, v8, v9, "#radio: Initializing radio listner with CAFMedia: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A616E10](v11, -1, -1);
      MEMORY[0x22A616E10](v10, -1, -1);
    }
    else
    {
    }
    v16 = CarPlayConnectionManager.carRadioListener.getter();
    (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v16) + 0x158))(v7);
  }
}

id CarPlayConnectionManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CarPlayConnectionManager.init()()
{
}

void CarPlayConnectionManager.carManager(_:didUpdateCurrentCar:)(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = v2;
    if (one-time initialization token for Log != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)Log);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22475B000, v5, v6, "#radio Car disconnected — resetting connection and attempting to await updates", v7, 2u);
      MEMORY[0x22A616E10](v7, -1, -1);
    }

    uint64_t v8 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0xF8);
    v8();
  }
}

id @nonobjc CAFCarManager.init(registrationFilePath:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x22A6161C0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithRegistrationFilePath_, v3);

  return v4;
}

unint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyCancellable>);
    uint64_t result = static _SetStorage.allocate(capacity:)();
    unint64_t v3 = result;
    goto LABEL_6;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v18 = v1 + 32;
  uint64_t v19 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v20 = v1;
  while (1)
  {
    if (v21)
    {
      uint64_t result = MEMORY[0x22A616460](v6, v1);
      unint64_t v8 = result;
    }
    else
    {
      if (v6 >= *(void *)(v19 + 16)) {
        goto LABEL_28;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v6);
      uint64_t result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    type metadata accessor for AnyCancellable();
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes((unint64_t *)&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, MEMORY[0x263EFDD18]);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v15 = ~v10;
      lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes((unint64_t *)&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, MEMORY[0x263EFDD18]);
      while (1)
      {
        uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if (result) {
          break;
        }
        unint64_t v11 = (v11 + 1) & v15;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          unint64_t v1 = v20;
          goto LABEL_21;
        }
      }
      uint64_t result = swift_release();
      unint64_t v1 = v20;
    }
    else
    {
LABEL_21:
      *(void *)(v7 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v8;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v9 = __OFADD__(v16, 1);
      uint64_t v17 = v16 + 1;
      if (v9) {
        goto LABEL_27;
      }
      *(void *)(v3 + 16) = v17;
    }
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t outlined destroy of OS_dispatch_queue.SchedulerOptions?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2247611D8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #2 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(uint64_t a1)
{
  closure #2 in CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)(a1, v1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t method lookup function for CarPlayConnectionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CarPlayConnectionManager);
}

uint64_t dispatch thunk of CarPlayConnectionManager.car_queue.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.carManager.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.carManagerObservable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.__allocating_init(carManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.resetListeners()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.radioStore()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.registerUpdateHandler(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CarPlayConnectionManager.attemptCarConnectionAndWaitForUpdates(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t type metadata accessor for OS_dispatch_queue(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void partial apply for closure #2 in CarPlayConnectionManager.setupCarMediaConnection(_:)(void **a1)
{
  closure #2 in CarPlayConnectionManager.setupCarMediaConnection(_:)(a1, v1);
}

uint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2247614B0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(uint64_t a1, uint64_t a2)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(a1, a2, *(void *)(v2 + 16));
}

uint64_t outlined bridged method (mbbnb) of @objc NSBundle.path(forResource:ofType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v8 = (void *)MEMORY[0x22A6161C0]();
  swift_bridgeObjectRelease();
  BOOL v9 = (void *)MEMORY[0x22A6161C0](a3, a4);
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a5, sel_pathForResource_ofType_, v8, v9);

  if (!v10) {
    return 0;
  }
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v11;
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

Swift::String __swiftcall CAFMediaSourceSemanticType.stringValue()()
{
  char v1 = v0;
  uint64_t v2 = type metadata accessor for UsoEntity_common_RadioBand.DefinedValues();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(v1)
  {
    case 1:
      unint64_t v6 = (unsigned int *)MEMORY[0x263F72C20];
      goto LABEL_6;
    case 2:
      unint64_t v6 = (unsigned int *)MEMORY[0x263F72C28];
      goto LABEL_6;
    case 3:
      unint64_t v6 = (unsigned int *)MEMORY[0x263F72C30];
      goto LABEL_6;
    case 6:
    case 8:
      unint64_t v6 = (unsigned int *)MEMORY[0x263F72C38];
LABEL_6:
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v6, v2);
      uint64_t v7 = UsoEntity_common_RadioBand.DefinedValues.rawValue.getter();
      unint64_t v9 = v8;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
    default:
      if (one-time initialization token for Log != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      __swift_project_value_buffer(v12, (uint64_t)Log);
      uint64_t v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_22475B000, v13, v14, "#radio: Received unsupported semantic type", v15, 2u);
        MEMORY[0x22A616E10](v15, -1, -1);
      }

      uint64_t v7 = 0;
      unint64_t v9 = 0xE000000000000000;
      break;
  }
  uint64_t v10 = v7;
  uint64_t v11 = (void *)v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t CAFMediaItem.siriFormattedStringFrequency(semanticType:)(unsigned __int8 a1)
{
  int v2 = a1;
  unsigned int v3 = objc_msgSend(v1, sel_frequency);
  if (v2 != 2) {
    return dispatch thunk of CustomStringConvertible.description.getter();
  }
  float v4 = (float)v3 / 1000.0;
  if (roundf(v4) != v4)
  {
    return MEMORY[0x270F9DDF8]();
  }
  if ((~LODWORD(v4) & 0x7F800000) != 0)
  {
    if (v4 > -9.2234e18)
    {
      if (v4 < 9.2234e18) {
        return dispatch thunk of CustomStringConvertible.description.getter();
      }
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return MEMORY[0x270F9DDF8]();
}

id RadioListener.__allocating_init(serialQueue:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return RadioListener.init(serialQueue:)(a1);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)MEMORY[0x22A6161C0]();
  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v4);
}

uint64_t RadioListener.mediaSourceObservers.setter(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___RadioListener_mediaSourceObservers) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RadioListener.radioStationSourcesByType.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_9_0();
  void *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RadioListener.updateHandler.getter()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(*v0);
  return v1;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String) -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t RadioListener.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9_0();
  uint64_t v5 = *v2;
  *uint64_t v2 = a1;
  v2[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(v5);
}

uint64_t key path getter for RadioListener.updateHandler : RadioListener@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x120))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed String) -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for RadioListener.updateHandler : RadioListener(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed String) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(void, uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x128);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t (*RadioListener.updateHandler.modify())()
{
  return RadioListener.updateHandler.modify;
}

uint64_t RadioListener.appId.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

id RadioListener.init(serialQueue:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___RadioListener_mediaSourceObservers] = 0;
  uint64_t v3 = v1;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t v4 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v4 = MEMORY[0x263F8EE88];
  }
  *(void *)&v3[OBJC_IVAR___RadioListener_cancellables] = v4;
  *(void *)&v3[OBJC_IVAR___RadioListener_allowedMediaSources] = &outlined read-only object #0 of RadioListener.init(serialQueue:);
  uint64_t v5 = OBJC_IVAR___RadioListener_radioStationSourcesByType;
  type metadata accessor for CAFMediaSourceSemanticType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<KVItem>);
  lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType(&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType, (void (*)(uint64_t))type metadata accessor for CAFMediaSourceSemanticType);
  *(void *)&v3[v5] = Dictionary.init(dictionaryLiteral:)();
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR___RadioListener_maxStationListSize] = 1500;
  uint64_t v6 = &v3[OBJC_IVAR___RadioListener_updateHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  swift_unknownObjectUnownedInit();

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for RadioListener();
  id v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for RadioListener()
{
  return self;
}

id RadioListener.__deallocating_deinit()
{
  uint64_t v1 = (void *)MEMORY[0x22A616EA0](&v0[OBJC_IVAR___RadioListener_media]);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_unregisterObserver_, v0);
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for RadioListener();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

Swift::Void __swiftcall RadioListener.clearDonatedStations()()
{
  uint64_t v1 = v0;
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)Log);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22475B000, v3, v4, "#radio: Clearing all donated radio stations.", v5, 2u);
    OUTLINED_FUNCTION_1_0();
  }

  type metadata accessor for CAFMediaSourceSemanticType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<KVItem>);
  lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType(&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType, (void (*)(uint64_t))type metadata accessor for CAFMediaSourceSemanticType);
  uint64_t v6 = Dictionary.init(dictionaryLiteral:)();
  RadioListener.radioStationSourcesByType.setter(v6);
  id v7 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x198);
  v7();
}

Swift::Void __swiftcall RadioListener.teardownPublisherSubscriptions()()
{
  uint64_t v1 = (void *)MEMORY[0x22A616EA0](v0 + OBJC_IVAR___RadioListener_media);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_unregisterObserver_, v0);
  }
  RadioListener.mediaSourceObservers.setter(0);
  OUTLINED_FUNCTION_2();
  uint64_t v3 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v3);
  swift_bridgeObjectRelease();
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyCancellable();
    lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType((unint64_t *)&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, MEMORY[0x263EFDD18]);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v3 = v20;
    int64_t v4 = v21;
    unint64_t v5 = v22;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v4 = 0;
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      int64_t v12 = v4;
      goto LABEL_29;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v13 >= v9) {
      return outlined consume of Set<KVItem>.Iterator._Variant();
    }
    unint64_t v14 = *(void *)(v17 + 8 * v13);
    int64_t v12 = v4 + 1;
    if (!v14)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        return outlined consume of Set<KVItem>.Iterator._Variant();
      }
      unint64_t v14 = *(void *)(v17 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          return outlined consume of Set<KVItem>.Iterator._Variant();
        }
        unint64_t v14 = *(void *)(v17 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            return outlined consume of Set<KVItem>.Iterator._Variant();
          }
          unint64_t v14 = *(void *)(v17 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v9) {
              return outlined consume of Set<KVItem>.Iterator._Variant();
            }
            unint64_t v14 = *(void *)(v17 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v4 + 6;
              while (v15 < v9)
              {
                unint64_t v14 = *(void *)(v17 + 8 * v15++);
                if (v14)
                {
                  int64_t v12 = v15 - 1;
                  goto LABEL_28;
                }
              }
              return outlined consume of Set<KVItem>.Iterator._Variant();
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_29:
    uint64_t v16 = *(void *)(*(void *)(v1 + 48) + 8 * v11);
    swift_retain();
    if (!v16) {
      return outlined consume of Set<KVItem>.Iterator._Variant();
    }
    while (1)
    {
      AnyCancellable.cancel()();
      uint64_t result = swift_release();
      int64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        type metadata accessor for AnyCancellable();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        int64_t v12 = v4;
        uint64_t v10 = v5;
        if (v23) {
          continue;
        }
      }
      return outlined consume of Set<KVItem>.Iterator._Variant();
    }
  }
  __break(1u);
  return result;
}

void RadioListener.mediaConnectionEstablished(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v2 + OBJC_IVAR___RadioListener_media;
  swift_unknownObjectWeakAssign();
  if (objc_msgSend(a1, sel_receivedAllValues))
  {
    RadioListener.observeMediaSources(from:)(a1);
  }
  else
  {
    if (one-time initialization token for Log != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)Log);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22475B000, v6, v7, "#radio: Media received but waiting for receivedAllValues", v8, 2u);
      OUTLINED_FUNCTION_1_0();
    }

    int64_t v9 = (void *)MEMORY[0x22A616EA0](v4);
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(v9, sel_registerObserver_, v2);
    }
  }
}

void RadioListener.registerUpdateHandler(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_8_0();
  a23 = v25;
  a24 = v26;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  swift_getObjectType();
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  __swift_project_value_buffer(v31, (uint64_t)Log);
  v32 = v24;
  v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.info.getter();
  BOOL v35 = os_log_type_enabled(v33, v34);
  v36 = (void *)MEMORY[0x263F8EED0];
  if (v35)
  {
    uint64_t v44 = v28;
    uint64_t v37 = swift_slowAlloc();
    a12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v37 = 136315394;
    uint64_t v38 = _typeName(_:qualified:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, &a12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v40 = swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2080;
    uint64_t v41 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v32) + 0x138))(v40);
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, &a12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    v36 = (void *)MEMORY[0x263F8EED0];
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22475B000, v33, v34, "#radio: %s listening for %s updates.", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    uint64_t v28 = v44;
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
  }
  v43 = *(void (**)(uint64_t, uint64_t))((*v36 & *v32) + 0x128);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(v30);
  v43(v30, v28);
  OUTLINED_FUNCTION_10_0();
}

#error "224762CF0: call analysis failed (funcsize=44)"

void RadioListener.radioStations()()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = specialized Dictionary.subscript.getter(6u, *v0);
  if (v1)
  {
    specialized Set.count.getter(v1);
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = specialized Dictionary.subscript.getter(8u, *v0);
  if (v2)
  {
    specialized Set.count.getter(v2);
    swift_bridgeObjectRelease();
  }
  uint64_t v3 = specialized Dictionary.subscript.getter(2u, *v0);
  if (v3)
  {
    specialized Set.count.getter(v3);
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = specialized Dictionary.subscript.getter(1u, *v0);
  if (v4)
  {
    specialized Set.count.getter(v4);
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = specialized Dictionary.subscript.getter(3u, *v0);
  if (v5)
  {
    specialized Set.count.getter(v5);
    swift_bridgeObjectRelease();
  }
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)Log);
  os_log_type_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134219008;
    OUTLINED_FUNCTION_6_0();
    *(_WORD *)(v9 + 12) = 2048;
    OUTLINED_FUNCTION_6_0();
    *(_WORD *)(v9 + 22) = 2048;
    OUTLINED_FUNCTION_6_0();
    *(_WORD *)(v9 + 32) = 2048;
    OUTLINED_FUNCTION_6_0();
    *(_WORD *)(v9 + 42) = 2048;
    OUTLINED_FUNCTION_6_0();
    _os_log_impl(&dword_22475B000, v7, v8, "#radio Donating Radio KVItems — \n\tDAB: %ld\n\tFMDAB: %ld\n\tFM: %ld\n\tAM: %ld\n\tSiriusXM: %ld", (uint8_t *)v9, 0x34u);
    OUTLINED_FUNCTION_1_0();
  }

  uint64_t v10 = swift_bridgeObjectRetain();
  Dictionary<>.allValues.getter(v10);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
}

uint64_t specialized Dictionary.subscript.getter(Swift::UInt8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t specialized Set.count.getter(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return __CocoaSet.count.getter();
  }
  else {
    return *(void *)(a1 + 16);
  }
}

uint64_t Dictionary<>.allValues.getter(uint64_t a1)
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  specialized _NativeDictionary.makeIterator()(a1, v12);
  uint64_t v1 = v12[1];
  int64_t v2 = v12[3];
  uint64_t v3 = v12[4];
  int64_t v4 = (unint64_t)(v12[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  if (!v3) {
    goto LABEL_3;
  }
LABEL_2:
  v3 &= v3 - 1;
  while (1)
  {
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t result = specialized Array.append<A>(contentsOf:)(v10);
    if (v3) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v6 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      break;
    }
    if (v6 >= v4) {
      goto LABEL_23;
    }
    uint64_t v7 = *(void *)(v1 + 8 * v6);
    int64_t v8 = v2 + 1;
    if (!v7)
    {
      int64_t v8 = v2 + 2;
      if (v2 + 2 >= v4) {
        goto LABEL_23;
      }
      uint64_t v7 = *(void *)(v1 + 8 * v8);
      if (!v7)
      {
        int64_t v8 = v2 + 3;
        if (v2 + 3 >= v4) {
          goto LABEL_23;
        }
        uint64_t v7 = *(void *)(v1 + 8 * v8);
        if (!v7)
        {
          int64_t v8 = v2 + 4;
          if (v2 + 4 >= v4) {
            goto LABEL_23;
          }
          uint64_t v7 = *(void *)(v1 + 8 * v8);
          if (!v7)
          {
            int64_t v8 = v2 + 5;
            if (v2 + 5 >= v4) {
              goto LABEL_23;
            }
            uint64_t v7 = *(void *)(v1 + 8 * v8);
            if (!v7)
            {
              int64_t v8 = v2 + 6;
              if (v2 + 6 >= v4) {
                goto LABEL_23;
              }
              uint64_t v7 = *(void *)(v1 + 8 * v8);
              if (!v7)
              {
                int64_t v9 = v2 + 7;
                while (v9 < v4)
                {
                  uint64_t v7 = *(void *)(v1 + 8 * v9++);
                  if (v7)
                  {
                    int64_t v8 = v9 - 1;
                    goto LABEL_20;
                  }
                }
LABEL_23:
                swift_bridgeObjectRelease();
                swift_release();
                return v11;
              }
            }
          }
        }
      }
    }
LABEL_20:
    uint64_t v3 = (v7 - 1) & v7;
    int64_t v2 = v8;
  }
  __break(1u);
  return result;
}

void RadioListener.observeMediaSources(from:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_dispatch_queue.SchedulerOptions?);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  uint64_t v37 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Map<Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>, (CAFMediaSourceSemanticType, [KVItem])>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_0();
  unint64_t v5 = outlined bridged method (pb) of @objc CAFMedia.mediaSources.getter(a1);
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >> 62)
    {
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v7)
      {
LABEL_4:
        uint64_t v41 = MEMORY[0x263F8EE78];
        specialized ContiguousArray.reserveCapacity(_:)();
        if ((v7 & 0x8000000000000000) == 0)
        {
          uint64_t v8 = 0;
          do
          {
            if ((v6 & 0xC000000000000001) != 0) {
              id v9 = (id)MEMORY[0x22A616460](v8, v6);
            }
            else {
              id v9 = *(id *)(v6 + 8 * v8 + 32);
            }
            uint64_t v10 = v9;
            ++v8;
            type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFMediaSource);
            lazy protocol witness table accessor for type CAFCar and conformance CAFCar(&lazy protocol witness table cache variable for type CAFMediaSource and conformance CAFMediaSource, &lazy cache variable for type metadata for CAFMediaSource);
            CAFObserved<>.observable.getter();

            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
          }
          while (v7 != v8);
          uint64_t v11 = v41;
          swift_bridgeObjectRelease();
LABEL_19:
          RadioListener.mediaSourceObservers.setter(v11);
          unint64_t v15 = *(void *)(v2 + OBJC_IVAR___RadioListener_mediaSourceObservers);
          if (!v15) {
            return;
          }
          swift_unknownObjectWeakInit();
          if (v15 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
            if (v16) {
              goto LABEL_22;
            }
          }
          else
          {
            uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain_n();
            if (v16)
            {
LABEL_22:
              if (v16 < 1)
              {
                __break(1u);
                return;
              }
              unint64_t v39 = v15 & 0xC000000000000001;
              swift_beginAccess();
              uint64_t v17 = 0;
              unint64_t v36 = v15;
              uint64_t v35 = v16;
              do
              {
                if (v39) {
                  id v18 = (id)MEMORY[0x22A616460](v17, v15);
                }
                else {
                  id v18 = *(id *)(v15 + 8 * v17 + 32);
                }
                uint64_t v19 = v18;
                uint64_t v20 = MEMORY[0x22A616EA0](v42);
                if (v20)
                {
                  uint64_t v21 = (void *)v20;
                  dispatch thunk of CAFMediaSourceObservable.$mediaItems.getter();
                  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
                  uint64_t v22 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
                  __swift_storeEnumTagSinglePayload(v37, 1, 1, v22);
                  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AnyPublisher<CAFMediaItems?, Never>);
                  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
                  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type AnyPublisher<CAFMediaItems?, Never> and conformance AnyPublisher<A, B>, (uint64_t *)&demangling cache variable for type metadata for AnyPublisher<CAFMediaItems?, Never>);
                  lazy protocol witness table accessor for type CAFCar and conformance CAFCar((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue and conformance OS_dispatch_queue, &lazy cache variable for type metadata for OS_dispatch_queue);
                  Publisher.receive<A>(on:options:)();
                  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v37);

                  swift_release();
                  *(void *)(OUTLINED_FUNCTION_11_0() + 16) = v19;
                  id v23 = v19;
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, CAFMediaItems));
                  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue> and conformance Publishers.ReceiveOn<A, B>, &demangling cache variable for type metadata for Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>);
                  Publisher.compactMap<A>(_:)();
                  swift_release();
                  OUTLINED_FUNCTION_4_0();
                  v24();
                  uint64_t v25 = OUTLINED_FUNCTION_11_0();
                  *(void *)(v25 + 16) = v21;
                  uint64_t v26 = swift_allocObject();
                  *(void *)(v26 + 16) = partial apply for closure #2 in closure #2 in RadioListener.observeMediaSources(from:);
                  *(void *)(v26 + 24) = v25;
                  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)> and conformance Publishers.CompactMap<A, B>, &demangling cache variable for type metadata for Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>);
                  id v27 = v21;
                  Publisher.filter(_:)();
                  swift_release();
                  OUTLINED_FUNCTION_4_0();
                  v28();
                  uint64_t v29 = OUTLINED_FUNCTION_11_0();
                  *(void *)(v29 + 16) = v27;
                  uint64_t v30 = swift_allocObject();
                  *(void *)(v30 + 16) = partial apply for closure #3 in closure #2 in RadioListener.observeMediaSources(from:);
                  *(void *)(v30 + 24) = v29;
                  id v31 = v27;
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, [KVItem]));
                  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>> and conformance Publishers.Filter<A>, &demangling cache variable for type metadata for Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>);
                  Publisher.map<A>(_:)();
                  swift_release();
                  OUTLINED_FUNCTION_4_0();
                  v32();
                  *(void *)(OUTLINED_FUNCTION_11_0() + 16) = v31;
                  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Map<Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>, (CAFMediaSourceSemanticType, [KVItem])> and conformance Publishers.Map<A, B>, &demangling cache variable for type metadata for Publishers.Map<Publishers.Filter<Publishers.CompactMap<Publishers.ReceiveOn<AnyPublisher<CAFMediaItems?, Never>, OS_dispatch_queue>, (CAFMediaSourceSemanticType, CAFMediaItems)>>, (CAFMediaSourceSemanticType, [KVItem])>);
                  id v33 = v31;
                  Publisher<>.sink(receiveValue:)();
                  swift_release();
                  OUTLINED_FUNCTION_4_0();
                  v34();
                  swift_beginAccess();
                  AnyCancellable.store(in:)();
                  swift_endAccess();

                  uint64_t v16 = v35;
                  unint64_t v15 = v36;
                  swift_release();
                }
                else
                {
                }
                ++v17;
              }
              while (v16 != v17);
            }
          }
          swift_bridgeObjectRelease_n();
          swift_unknownObjectWeakDestroy();
          return;
        }
        __break(1u);
        goto LABEL_34;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  if (one-time initialization token for Log != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)Log);
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v38, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    _os_log_impl(&dword_22475B000, v38, v13, "#radio Error: CAFMedia has no media sources.", v14, 2u);
    OUTLINED_FUNCTION_1_0();
  }
}

uint64_t closure #1 in closure #2 in RadioListener.observeMediaSources(from:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  char v4 = dispatch thunk of CAFMediaSourceObservable.mediaSourceSemanticType.getter();
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)Log);
  id v6 = v3;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v21 = a2;
    char v9 = v4;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    if (v3)
    {
      id v12 = objc_msgSend(v6, sel_mediaItems);
      type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFMediaItem);
      unint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v23 = v14;
    LOBYTE(v24) = v3 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int?);
    uint64_t v15 = String.init<A>(describing:)();
    uint64_t v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    Swift::String v17 = CAFMediaSourceSemanticType.stringValue()();
    uint64_t v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17._countAndFlagsBits, (unint64_t)v17._object, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22475B000, v7, v8, "#radio CarPlay has %s mediaItems of semanticType: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A616E10](v11, -1, -1);
    uint64_t v18 = v10;
    char v4 = v9;
    MEMORY[0x22A616E10](v18, -1, -1);

    a2 = v21;
  }
  else
  {
  }
  LOBYTE(v23) = v4;
  uint64_t v24 = v3;
  id v19 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, CAFMediaItems?));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAFMediaSourceSemanticType, CAFMediaItems));
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

BOOL closure #2 in closure #2 in RadioListener.observeMediaSources(from:)(BOOL a1, void *a2, uint64_t a3)
{
  BOOL v4 = specialized Sequence<>.contains(_:)(a1, *(void *)(a3 + OBJC_IVAR___RadioListener_allowedMediaSources));
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)Log);
  id v6 = a2;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 134218242;
    id v11 = objc_msgSend(v6, sel_mediaItems);
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFMediaItem);
    unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v9 + 12) = 2080;
    Swift::String v13 = CAFMediaSourceSemanticType.stringValue()();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13._countAndFlagsBits, (unint64_t)v13._object, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22475B000, v7, v8, "#radio: Received %ld mediaItems for semanticType: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A616E10](v10, -1, -1);
    MEMORY[0x22A616E10](v9, -1, -1);
  }
  else
  {
  }
  return v4;
}

BOOL specialized Sequence<>.contains(_:)(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t closure #3 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1, id a2, void *a3)
{
  id v5 = objc_msgSend(a2, sel_mediaItems);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFMediaItem);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Sequence.compactMap<A>(_:)(v6, a3, a1);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t closure #4 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1, void *a2)
{
  uint64_t v3 = RadioListener.saveItemsBy(semanticType:items:)(*(unsigned char *)a1, *(void *)(a1 + 8));
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a2) + 0x198))(v3);
}

uint64_t specialized Sequence.compactMap<A>(_:)(unint64_t a1, void *a2, int a3)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A616460](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      os_log_type_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = RadioListener.itemFrom(semanticType:mediaItem:)(a3, v7);

      if (v10)
      {
        MEMORY[0x22A616210]();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      ++v6;
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        uint64_t v11 = v14;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = MEMORY[0x263F8EE78];
LABEL_17:

  return v11;
}

id RadioListener.itemFrom(semanticType:mediaItem:)(int a1, void *a2)
{
  v56[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F510C0]), sel_init);
  uint64_t v5 = RadioListener.itemIdFrom(semanticType:mediaItem:)(a1, a2);
  uint64_t v6 = (void *)MEMORY[0x22A6161C0](v5);
  swift_bridgeObjectRelease();
  v56[0] = 0;
  id v7 = objc_msgSend(v4, sel_setItemType_itemId_error_, 9, v6, v56);

  if (v7)
  {
    id v8 = v56[0];

    uint64_t v9 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_mediaItemName);
    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x22A6161C0](v9);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = 0;
    }
    v56[0] = 0;
    Swift::String v13 = (void *)OUTLINED_FUNCTION_7_0();
    id v15 = objc_msgSend(v13, v14, 351, v11);

    id v16 = v56[0];
    if (v15)
    {
      id v17 = v56[0];

      CAFMediaSourceSemanticType.stringValue()();
      OUTLINED_FUNCTION_12_0();
      id v21 = outlined bridged method (mnbnnn) of @objc KVItemBuilder.addField(type:value:)(355, v18, v20, v19, v4);
      id v22 = v56[0];
      if (!v21) {
        goto LABEL_28;
      }

      uint64_t v23 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_mediaItemShortName);
      if (v24)
      {
        uint64_t v25 = (void *)MEMORY[0x22A6161C0](v23);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v25 = 0;
      }
      v56[0] = 0;
      uint64_t v26 = (void *)OUTLINED_FUNCTION_7_0();
      id v28 = objc_msgSend(v26, v27, 352, v25);

      id v16 = v56[0];
      if (v28)
      {
        id v29 = v56[0];

        if (a1 == 8 || a1 == 6)
        {
          uint64_t v31 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_identifier);
          if (v32)
          {
            id v33 = (void *)MEMORY[0x22A6161C0](v31);
            swift_bridgeObjectRelease();
          }
          else
          {
            id v33 = 0;
          }
          v56[0] = 0;
          uint64_t v40 = (void *)OUTLINED_FUNCTION_7_0();
          id v38 = objc_msgSend(v40, v41, 354, v33);

          if (!v38)
          {
            id v55 = v56[0];
            os_log_type_t v34 = (void *)_convertNSErrorToError(_:)();

            goto LABEL_29;
          }
          id v42 = v56[0];
        }
        else
        {
          CAFMediaItem.siriFormattedStringFrequency(semanticType:)(a1);
          OUTLINED_FUNCTION_12_0();
          id v38 = outlined bridged method (mnbnnn) of @objc KVItemBuilder.addField(type:value:)(353, v35, v37, v36, v4);
          id v39 = v56[0];
          if (!v38)
          {
            id v12 = v39;
            goto LABEL_20;
          }
        }

        v56[0] = 0;
        id v43 = objc_msgSend(v4, sel_buildItemWithError_, v56);
        id v22 = v56[0];
        if (v43)
        {

          return v43;
        }
LABEL_28:
        uint64_t v44 = v22;
        os_log_type_t v34 = (void *)_convertNSErrorToError(_:)();

        goto LABEL_29;
      }
    }
    id v12 = v16;
  }
  else
  {
    id v12 = v56[0];
  }
LABEL_20:
  os_log_type_t v34 = (void *)_convertNSErrorToError(_:)();

LABEL_29:
  swift_willThrow();

  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v45 = type metadata accessor for Logger();
  __swift_project_value_buffer(v45, (uint64_t)Log);
  id v46 = a2;
  v47 = Logger.logObject.getter();
  os_log_type_t v48 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v56[0] = (id)OUTLINED_FUNCTION_5_0();
    *(_DWORD *)v49 = 136315138;
    id v50 = objc_msgSend(v46, sel_debugDescription);
    uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v53 = v52;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v53, (uint64_t *)v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22475B000, v47, v48, "#radio: Could not create KVItem from mediaItem: %s", v49, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
  }
  return 0;
}

uint64_t RadioListener.itemIdFrom(semanticType:mediaItem:)(int a1, id a2)
{
  objc_msgSend(a2, sel_frequency);
  uint64_t v3 = dispatch thunk of CustomStringConvertible.description.getter();
  Swift::String v4 = CAFMediaSourceSemanticType.stringValue()();
  swift_bridgeObjectRetain();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_mediaItemName);
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(a2, (SEL *)&selRef_mediaItemShortName);
  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v11) {
    Swift::String v13 = v11;
  }
  else {
    Swift::String v13 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = v12;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t RadioListener.saveItemsBy(semanticType:items:)(Swift::UInt8 a1, unint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = Dictionary<>.totalValueCount.getter(v5);
  swift_bridgeObjectRelease();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFADD__(v6, v7))
  {
    __break(1u);
LABEL_18:
    swift_once();
    goto LABEL_12;
  }
  p_info = &OBJC_METACLASS___RadioListener.info;
  if (v6 + v7 >= 1501)
  {
    if (one-time initialization token for Log != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)Log);
    swift_bridgeObjectRetain();
    uint64_t v10 = v2;
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = OUTLINED_FUNCTION_5_0();
      *(_DWORD *)uint64_t v13 = 134218496;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v13 + 12) = 2048;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      *(_WORD *)(v13 + 22) = 2048;
      v23[0] = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22475B000, v11, v12, "#radio: Something is wrong——Radio store will have %ld stations after current update which is more than the currently allowed limit of %ld. Clearing the store and adding %ld new items. ", (uint8_t *)v13, 0x20u);
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___RadioListener + 32);
      OUTLINED_FUNCTION_1_0();
    }
    else
    {

      swift_bridgeObjectRelease();
      uint64_t v11 = v10;
    }

    type metadata accessor for CAFMediaSourceSemanticType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<KVItem>);
    lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType(&lazy protocol witness table cache variable for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType, (void (*)(uint64_t))type metadata accessor for CAFMediaSourceSemanticType);
    uint64_t v14 = Dictionary.init(dictionaryLiteral:)();
    RadioListener.radioStationSourcesByType.setter(v14);
  }
  unint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v6 = specialized Set.init<A>(_:)(v15);
  if (p_info[18] != (__objc2_class_ro *)-1) {
    goto LABEL_18;
  }
LABEL_12:
  uint64_t v16 = type metadata accessor for Logger();
  __swift_project_value_buffer(v16, (uint64_t)Log);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = OUTLINED_FUNCTION_5_0();
    v23[0] = OUTLINED_FUNCTION_5_0();
    *(_DWORD *)uint64_t v19 = 134218498;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2048;
    specialized Set.count.getter(v6);
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    uint64_t v20 = CAFMediaSourceSemanticType.description.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v23);
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22475B000, v17, v18, "#radio: Total mediaItems: %ld — Donating unique %ld items of semanticType: %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  specialized Dictionary._Variant.setValue(_:forKey:)(v6, a1);
  return swift_endAccess();
}

uint64_t Dictionary<>.totalValueCount.getter(uint64_t a1)
{
  specialized _NativeDictionary.makeIterator()(a1, v16);
  uint64_t v1 = v16[0];
  uint64_t v2 = v16[1];
  int64_t v3 = v16[3];
  unint64_t v4 = v16[4];
  int64_t v5 = (unint64_t)(v16[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      unint64_t v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_22;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v10 >= v5) {
      goto LABEL_28;
    }
    unint64_t v11 = *(void *)(v2 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v5) {
        goto LABEL_28;
      }
      unint64_t v11 = *(void *)(v2 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v5) {
          goto LABEL_28;
        }
        unint64_t v11 = *(void *)(v2 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v5) {
            goto LABEL_28;
          }
          unint64_t v11 = *(void *)(v2 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v3 + 5;
            if (v3 + 5 >= v5) {
              goto LABEL_28;
            }
            unint64_t v11 = *(void *)(v2 + 8 * v12);
            if (!v11)
            {
              int64_t v12 = v3 + 6;
              if (v3 + 6 >= v5) {
                goto LABEL_28;
              }
              unint64_t v11 = *(void *)(v2 + 8 * v12);
              if (!v11)
              {
                int64_t v13 = v3 + 7;
                while (v13 < v5)
                {
                  unint64_t v11 = *(void *)(v2 + 8 * v13++);
                  if (v11)
                  {
                    int64_t v12 = v13 - 1;
                    goto LABEL_21;
                  }
                }
                goto LABEL_28;
              }
            }
          }
        }
      }
    }
LABEL_21:
    unint64_t v4 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v3 = v12;
LABEL_22:
    uint64_t v14 = *(void *)(*(void *)(v1 + 56) + 8 * v9);
    if ((v14 & 0xC000000000000001) != 0) {
      uint64_t result = __CocoaSet.count.getter();
    }
    else {
      uint64_t result = *(void *)(v14 + 16);
    }
    BOOL v15 = __OFADD__(v7, result);
    v7 += result;
    if (v15)
    {
      __break(1u);
LABEL_28:
      swift_release();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Set.init<A>(_:)(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  lazy protocol witness table accessor for type CAFCar and conformance CAFCar(&lazy protocol witness table cache variable for type KVItem and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v4 = result;
  uint64_t v9 = result;
  if (!v2)
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x22A616460](i, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * i + 32);
      }
      specialized Set._Variant.insert(_:)(&v8, v7);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall RadioListener.donationUpdateTriggered()()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0();
  v23[4] = v2;
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0();
  v23[2] = v6;
  uint64_t v23[3] = v5;
  MEMORY[0x270FA5388]();
  id v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)Log);
  int64_t v10 = v0;
  unint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    int64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = OUTLINED_FUNCTION_5_0();
    v23[1] = v1;
    *(_DWORD *)int64_t v13 = 136315138;
    aBlock[0] = v14;
    uint64_t v15 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v10) + 0x138))();
    uint64_t v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22475B000, v11, v12, "#radio triggering donation request for: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
  }
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  uint64_t v18 = OUTLINED_FUNCTION_11_0();
  *(void *)(v18 + 16) = v10;
  aBlock[4] = (uint64_t)partial apply for closure #1 in RadioListener.donationUpdateTriggered();
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = (uint64_t)&block_descriptor;
  uint64_t v19 = _Block_copy(aBlock);
  uint64_t v20 = v10;
  static DispatchQoS.unspecified.getter();
  uint64_t v24 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x22A616300](0, v8, v4, v19);
  _Block_release(v19);

  OUTLINED_FUNCTION_4_0();
  v21();
  OUTLINED_FUNCTION_4_0();
  v22();
  swift_release();
}

uint64_t closure #1 in RadioListener.donationUpdateTriggered()(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x120))();
  if (result)
  {
    uint64_t v4 = (void (*)(uint64_t))result;
    uint64_t v5 = (*(uint64_t (**)(void))((*v2 & *a1) + 0x138))();
    v4(v5);
    outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?((uint64_t)v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id RadioListener.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void RadioListener.init()()
{
}

void RadioListener.accessoryDidUpdate(_:receivedAllValues:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)Log);
  id v5 = v3;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    uint64_t v9 = v1;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v14 = v5;

    uint64_t v1 = v9;
    *(_WORD *)(v8 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_22475B000, v6, v7, "#radio: %@ received all values %{BOOL}d.", (uint8_t *)v8, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
  }
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    os_log_type_t v12 = (void *)v11;
    id v13 = v5;
    if (objc_msgSend(v12, sel_receivedAllValues))
    {
      RadioListener.observeMediaSources(from:)(v12);
      objc_msgSend(v12, sel_unregisterObserver_, v1);
    }
  }
  OUTLINED_FUNCTION_10_0();
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t result = specialized Set.count.getter(a1);
  uint64_t v7 = result;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v9 = v8 + v7;
  if (__OFADD__(v8, v7))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v10 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v10;
  uint64_t v12 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v10 & 0x8000000000000000) == 0
    && (v10 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v10 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_14;
    }
    uint64_t v12 = 1;
  }
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v14 <= v9) {
    uint64_t v14 = v9;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = MEMORY[0x22A616470](v12, v14, 1, v10);
  swift_bridgeObjectRelease();
  *uint64_t v3 = v15;
  uint64_t v13 = v15 & 0xFFFFFFFFFFFFFF8;
LABEL_14:
  uint64_t v16 = *(void *)(v13 + 16);
  uint64_t v17 = (*(void *)(v13 + 24) >> 1) - v16;
  uint64_t result = (uint64_t)specialized Sequence._copySequenceContents(initializing:)(&v45, (void *)(v13 + 8 * v16 + 32), v17, a1);
  if (result < v7)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (result >= 1)
  {
    uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v19 = __OFADD__(v18, result);
    uint64_t v20 = v18 + result;
    if (v19)
    {
      __break(1u);
LABEL_30:
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_19;
      }
      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v24 = v44;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v24) {
          goto LABEL_19;
        }
        while (1)
        {
          uint64_t v26 = *v3 & 0xFFFFFFFFFFFFFF8;
          if (v2 + 1 > *(void *)(v26 + 0x18) >> 1)
          {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            uint64_t v26 = *v3 & 0xFFFFFFFFFFFFFF8;
          }
          unint64_t v27 = *(void *)(v26 + 24);
          if (v2 < (uint64_t)(v27 >> 1)) {
            break;
          }
LABEL_69:
          *(void *)(v26 + 16) = v2;
        }
        int64_t v28 = v27 >> 1;
        uint64_t v29 = v26 + 32;
        while (1)
        {
          *(void *)(v29 + 8 * v2++) = v24;
          int64_t v30 = v48;
          if (v45 < 0)
          {
            if (!__CocoaSet.Iterator.next()()) {
              goto LABEL_70;
            }
            type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            uint64_t v24 = v44;
            swift_unknownObjectRelease();
            goto LABEL_44;
          }
          if (!v49) {
            break;
          }
          unint64_t v31 = (v49 - 1) & v49;
          unint64_t v32 = __clz(__rbit64(v49)) | (v48 << 6);
LABEL_40:
          uint64_t v24 = *(void **)(*(void *)(v45 + 48) + 8 * v32);
          id v33 = v24;
LABEL_41:
          int64_t v48 = v30;
          unint64_t v49 = v31;
LABEL_44:
          if (!v24)
          {
LABEL_70:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v2;
            goto LABEL_19;
          }
          if (v2 >= v28)
          {
            uint64_t v26 = *v3 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_69;
          }
        }
        int64_t v34 = v48 + 1;
        if (__OFADD__(v48, 1))
        {
          __break(1u);
LABEL_94:
          uint64_t v24 = 0;
          unint64_t v22 = 0;
          int64_t v21 = v6;
LABEL_27:
          int64_t v48 = v21;
          unint64_t v49 = v22;
          continue;
        }
        break;
      }
      int64_t v35 = (unint64_t)(v47 + 64) >> 6;
      if (v34 >= v35)
      {
        uint64_t v24 = 0;
        unint64_t v31 = 0;
        goto LABEL_41;
      }
      unint64_t v36 = *(void *)(v46 + 8 * v34);
      if (!v36)
      {
        int64_t v37 = v48 + 2;
        if (v48 + 2 >= v35) {
          goto LABEL_66;
        }
        unint64_t v36 = *(void *)(v46 + 8 * v37);
        if (!v36)
        {
          int64_t v6 = v48 + 3;
          if (v48 + 3 >= v35) {
            goto LABEL_67;
          }
          unint64_t v36 = *(void *)(v46 + 8 * v6);
          if (v36)
          {
            int64_t v34 = v48 + 3;
            goto LABEL_50;
          }
          int64_t v37 = v48 + 4;
          if (v48 + 4 >= v35)
          {
            uint64_t v24 = 0;
            unint64_t v31 = 0;
            int64_t v30 = v48 + 3;
            goto LABEL_41;
          }
          unint64_t v36 = *(void *)(v46 + 8 * v37);
          if (!v36)
          {
            int64_t v34 = v48 + 5;
            if (v48 + 5 >= v35)
            {
LABEL_67:
              uint64_t v24 = 0;
              unint64_t v31 = 0;
              int64_t v30 = v37;
              goto LABEL_41;
            }
            unint64_t v36 = *(void *)(v46 + 8 * v34);
            if (!v36)
            {
              int64_t v34 = v35 - 1;
              int64_t v38 = v48 + 6;
              while (v38 < v35)
              {
                unint64_t v36 = *(void *)(v46 + 8 * v38++);
                if (v36)
                {
                  int64_t v34 = v38 - 1;
                  goto LABEL_50;
                }
              }
LABEL_66:
              uint64_t v24 = 0;
              unint64_t v31 = 0;
              int64_t v30 = v34;
              goto LABEL_41;
            }
            goto LABEL_50;
          }
        }
        int64_t v34 = v37;
      }
LABEL_50:
      unint64_t v31 = (v36 - 1) & v36;
      unint64_t v32 = __clz(__rbit64(v36)) + (v34 << 6);
      int64_t v30 = v34;
      goto LABEL_40;
    }
    *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v20;
  }
  if (result != v17)
  {
LABEL_19:
    outlined consume of Set<KVItem>.Iterator._Variant();
    return specialized Array._endMutation()();
  }
LABEL_23:
  uint64_t v2 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int64_t v21 = v48;
  if (v45 < 0) {
    goto LABEL_30;
  }
  if (v49)
  {
    unint64_t v22 = (v49 - 1) & v49;
    unint64_t v23 = __clz(__rbit64(v49)) | (v48 << 6);
LABEL_26:
    uint64_t v24 = *(void **)(*(void *)(v45 + 48) + 8 * v23);
    id v25 = v24;
    goto LABEL_27;
  }
  int64_t v39 = v48 + 1;
  if (!__OFADD__(v48, 1))
  {
    int64_t v40 = (unint64_t)(v47 + 64) >> 6;
    if (v39 >= v40)
    {
      uint64_t v24 = 0;
      unint64_t v22 = 0;
      goto LABEL_27;
    }
    unint64_t v41 = *(void *)(v46 + 8 * v39);
    if (v41) {
      goto LABEL_75;
    }
    int64_t v42 = v48 + 2;
    if (v48 + 2 >= v40)
    {
LABEL_91:
      uint64_t v24 = 0;
      unint64_t v22 = 0;
      int64_t v21 = v39;
      goto LABEL_27;
    }
    unint64_t v41 = *(void *)(v46 + 8 * v42);
    if (v41) {
      goto LABEL_79;
    }
    int64_t v6 = v48 + 3;
    if (v48 + 3 < v40)
    {
      unint64_t v41 = *(void *)(v46 + 8 * v6);
      if (v41)
      {
        int64_t v39 = v48 + 3;
        goto LABEL_75;
      }
      int64_t v42 = v48 + 4;
      if (v48 + 4 >= v40) {
        goto LABEL_94;
      }
      unint64_t v41 = *(void *)(v46 + 8 * v42);
      if (v41)
      {
LABEL_79:
        int64_t v39 = v42;
LABEL_75:
        unint64_t v22 = (v41 - 1) & v41;
        unint64_t v23 = __clz(__rbit64(v41)) + (v39 << 6);
        int64_t v21 = v39;
        goto LABEL_26;
      }
      int64_t v39 = v48 + 5;
      if (v48 + 5 < v40)
      {
        unint64_t v41 = *(void *)(v46 + 8 * v39);
        if (!v41)
        {
          int64_t v39 = v40 - 1;
          int64_t v43 = v48 + 6;
          do
          {
            if (v43 >= v40) {
              goto LABEL_91;
            }
            unint64_t v41 = *(void *)(v46 + 8 * v43++);
          }
          while (!v41);
          int64_t v39 = v43 - 1;
        }
        goto LABEL_75;
      }
    }
    uint64_t v24 = 0;
    unint64_t v22 = 0;
    int64_t v21 = v42;
    goto LABEL_27;
  }
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = specialized _NativeSet.init(_:capacity:)(v7, result + 1);
    int64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      specialized _NativeSet.resize(capacity:)();
      unint64_t v23 = v28;
    }
    else
    {
      unint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    specialized _NativeSet._unsafeInsertNew(_:)((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v10 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v11 = NSObject._rawHashValue(seed:)(v10);
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = static NSObject.== infix(_:_:)();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v3 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = static NSObject.== infix(_:_:)();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(uint64_t a1, Swift::UInt8 a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;
  return swift_bridgeObjectRelease();
}

unint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, Swift::UInt8 a2, char a3)
{
  uint64_t v4 = (void **)v3;
  id v8 = (void *)*v3;
  unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _NativeDictionary<CAFMediaSourceSemanticType, Set<KVItem>>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    type metadata accessor for CAFMediaSourceSemanticType();
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  char v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7];
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    return specialized _NativeDictionary._insert(at:key:value:)(v14, a2, a1, v18);
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  uint64_t v2 = static _SetStorage.convert(_:capacity:)();
  uint64_t v14 = v2;
  __CocoaSet.makeIterator()();
  if (!__CocoaSet.Iterator.next()())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      specialized _NativeSet.resize(capacity:)();
      uint64_t v2 = v14;
    }
    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    int64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v28;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *unint64_t v6 = -1 << v27;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    unint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<KVItem>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    Swift::Int v18 = *(void *)(v4 + 40);
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = NSObject._rawHashValue(seed:)(v18);
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v4 + 48) + 8 * v23) = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t outlined bridged method (pb) of @objc CAFMedia.mediaSources.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_mediaSources);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CAFMediaSource);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id outlined bridged method (mnbnnn) of @objc KVItemBuilder.addField(type:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v8 = (void *)MEMORY[0x22A6161C0](a2, a3);
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(a5, sel_addFieldWithType_value_error_, a1, v8, a4);

  return v9;
}

uint64_t outlined bridged method (pb) of @objc CAFMediaItem.mediaItemName.getter(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  char v24 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
    lazy protocol witness table accessor for type CAFCar and conformance CAFCar(&lazy protocol witness table cache variable for type KVItem and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for KVItem);
    uint64_t result = (void *)Set.Iterator.init(_cocoa:)();
    uint64_t v4 = v27;
    uint64_t v7 = v28;
    uint64_t v8 = v29;
    int64_t v9 = v30;
    unint64_t v10 = v31;
    if (v6) {
      goto LABEL_3;
    }
LABEL_37:
    uint64_t v11 = 0;
    goto LABEL_39;
  }
  int64_t v9 = 0;
  uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v7 = a4 + 56;
  uint64_t v8 = ~v19;
  uint64_t v20 = -v19;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  else {
    uint64_t v21 = -1;
  }
  unint64_t v10 = v21 & *(void *)(a4 + 56);
  if (!a2) {
    goto LABEL_37;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v11 = 0;
LABEL_39:
    unint64_t v22 = v24;
LABEL_41:
    *unint64_t v22 = v4;
    v22[1] = v7;
    v22[2] = v8;
    v22[3] = v9;
    v22[4] = v10;
    return (void *)v11;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v11 = 0;
  int64_t v25 = (unint64_t)(v8 + 64) >> 6;
  uint64_t v23 = v8;
  while (1)
  {
    if (v4 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_40;
      }
      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v14 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_40;
      }
      goto LABEL_23;
    }
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_22;
    }
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v15 >= v25)
    {
      unint64_t v10 = 0;
      goto LABEL_40;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v15);
    if (v16) {
      goto LABEL_21;
    }
    int64_t v17 = v9 + 2;
    if (v9 + 2 >= v25)
    {
      unint64_t v10 = 0;
      ++v9;
      goto LABEL_40;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v17);
    if (!v16)
    {
      if (v9 + 3 >= v25) {
        goto LABEL_44;
      }
      unint64_t v16 = *(void *)(v7 + 8 * (v9 + 3));
      if (v16)
      {
        int64_t v15 = v9 + 3;
        goto LABEL_21;
      }
      int64_t v17 = v9 + 4;
      if (v9 + 4 >= v25)
      {
        unint64_t v10 = 0;
        v9 += 3;
        goto LABEL_40;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (!v16)
      {
        int64_t v15 = v9 + 5;
        if (v9 + 5 >= v25)
        {
LABEL_44:
          unint64_t v10 = 0;
          int64_t v9 = v17;
          goto LABEL_40;
        }
        unint64_t v16 = *(void *)(v7 + 8 * v15);
        if (!v16)
        {
          int64_t v18 = v9 + 6;
          while (v18 < v25)
          {
            unint64_t v16 = *(void *)(v7 + 8 * v18++);
            if (v16)
            {
              int64_t v15 = v18 - 1;
              goto LABEL_21;
            }
          }
          unint64_t v10 = 0;
          int64_t v9 = v25 - 1;
          goto LABEL_40;
        }
        goto LABEL_21;
      }
    }
    int64_t v15 = v17;
LABEL_21:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v15 << 6);
    int64_t v9 = v15;
LABEL_22:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v13);
    id v14 = result;
    if (!result) {
      goto LABEL_40;
    }
LABEL_23:
    ++v11;
    *v6++ = v14;
    if (v11 == a3)
    {
      uint64_t v11 = a3;
LABEL_40:
      uint64_t v8 = v23;
      unint64_t v22 = v24;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.makeIterator()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_224767BEC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in RadioListener.donationUpdateTriggered()()
{
  return closure #1 in RadioListener.donationUpdateTriggered()(*(void **)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t lazy protocol witness table accessor for type CAFMediaSourceSemanticType and conformance CAFMediaSourceSemanticType(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for RadioListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RadioListener);
}

uint64_t dispatch thunk of RadioListener.updateHandler.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of RadioListener.updateHandler.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of RadioListener.updateHandler.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of RadioListener.appId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of RadioListener.__allocating_init(serialQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of RadioListener.clearDonatedStations()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of RadioListener.teardownPublisherSubscriptions()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of RadioListener.mediaConnectionEstablished(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of RadioListener.registerUpdateHandler(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of RadioListener.radioStations()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of RadioListener.donationUpdateTriggered()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t sub_224767F18()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_224767F50()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed String) -> (@out ())(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed String) -> ()(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t outlined consume of Set<KVItem>.Iterator._Variant()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t partial apply for closure #1 in closure #2 in RadioListener.observeMediaSources(from:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return closure #1 in closure #2 in RadioListener.observeMediaSources(from:)(a1, a2);
}

BOOL partial apply for closure #2 in closure #2 in RadioListener.observeMediaSources(from:)(BOOL a1, void *a2)
{
  return closure #2 in closure #2 in RadioListener.observeMediaSources(from:)(a1, a2, *(void *)(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned CAFMediaSourceSemanticType, @guaranteed CAFMediaItems) -> (@unowned Bool)(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, *((void *)a1 + 1)) & 1;
}

uint64_t partial apply for closure #3 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1, void *a2)
{
  return closure #3 in closure #2 in RadioListener.observeMediaSources(from:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned CAFMediaSourceSemanticType, @guaranteed CAFMediaItems) -> (@unowned CAFMediaSourceSemanticType, @owned [KVItem])@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *((void *)a1 + 1));
  *(unsigned char *)a2 = result;
  *(void *)(a2 + 8) = v5;
  return result;
}

uint64_t partial apply for closure #4 in closure #2 in RadioListener.observeMediaSources(from:)(uint64_t a1)
{
  return closure #4 in closure #2 in RadioListener.observeMediaSources(from:)(a1, *(void **)(v1 + 16));
}

void OUTLINED_FUNCTION_1_0()
{
  JUMPOUT(0x22A616E10);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

BOOL static ProviderError.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void ProviderError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int ProviderError.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ProviderError(char *a1, char *a2)
{
  return static ProviderError.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ProviderError()
{
  return ProviderError.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ProviderError(uint64_t a1)
{
  ProviderError.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ProviderError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance ProviderError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance ProviderError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance ProviderError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ProviderError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t KMFindMySyncDevicesProvider.getSyncDevices()()
{
  Swift::UInt v1 = v0;
  uint64_t v56 = type metadata accessor for DispatchTimeInterval();
  OUTLINED_FUNCTION_0();
  uint64_t v51 = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_1_1();
  id v50 = (void *)(v4 - v3);
  type metadata accessor for DispatchTime();
  OUTLINED_FUNCTION_0();
  uint64_t v52 = v6;
  uint64_t v53 = v5;
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int64_t v48 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v49 = (char *)v42 - v9;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0();
  uint64_t v47 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_1();
  uint64_t v15 = v14 - v13;
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v17;
  uint64_t v46 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_1();
  uint64_t v20 = v19 - v18;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = MEMORY[0x263F8EE78];
  v42[1] = v22 + 16;
  uint64_t v23 = swift_allocObject();
  *(_DWORD *)(v23 + 16) = 0;
  (*(void (**)(void))(**(void **)&v0[OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_syncDeviceProvider]
                    + 136))();
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 3;
  v42[0] = v24 + 16;
  uint64_t v44 = *(void *)&v1[OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_queue];
  int64_t v25 = (void *)swift_allocObject();
  v25[2] = v1;
  v25[3] = v24;
  v25[4] = v23;
  v25[5] = v22;
  v25[6] = v21;
  aBlock[4] = partial apply for closure #1 in KMFindMySyncDevicesProvider.getSyncDevices();
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_0;
  BOOL v26 = _Block_copy(aBlock);
  uint64_t v27 = v1;
  v42[3] = v24;
  swift_retain();
  v42[4] = v23;
  swift_retain();
  uint64_t v43 = v22;
  swift_retain();
  uint64_t v28 = v21;
  static DispatchQoS.unspecified.getter();
  uint64_t v54 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x22A616300](0, v20, v15, v26);
  _Block_release(v26);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v15, v10);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v20, v46);
  swift_release();
  uint64_t v29 = v48;
  static DispatchTime.now()();
  int64_t v30 = v50;
  uint64_t v31 = v51;
  *id v50 = 10;
  uint64_t v32 = v56;
  (*(void (**)(void *, void, uint64_t))(v31 + 104))(v30, *MEMORY[0x263F8F018], v56);
  id v33 = v49;
  MEMORY[0x22A616180](v29, v30);
  (*(void (**)(void *, uint64_t))(v31 + 8))(v30, v32);
  int64_t v34 = *(void (**)(char *, uint64_t))(v52 + 8);
  int64_t v35 = v29;
  uint64_t v36 = v53;
  v34(v35, v53);
  LOBYTE(v32) = MEMORY[0x22A616320](v33);
  v34(v33, v36);
  if (v32)
  {
    uint64_t v38 = 1;
    goto LABEL_5;
  }
  int64_t v37 = (unsigned __int8 *)v42[0];
  swift_beginAccess();
  uint64_t v38 = *v37;
  uint64_t v39 = v43;
  if (v38 != 3)
  {
LABEL_5:
    lazy protocol witness table accessor for type ProviderError and conformance ProviderError();
    swift_allocError();
    *int64_t v40 = v38;
    swift_willThrow();

    swift_release();
    swift_release();
    swift_release();
    return v38;
  }

  swift_beginAccess();
  uint64_t v38 = *(void *)(v39 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v38;
}

uint64_t sub_22476891C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_224768954()
{
  return OUTLINED_FUNCTION_2_1(v0, 20);
}

uint64_t sub_224768960()
{
  return OUTLINED_FUNCTION_2_1(v0, 17);
}

uint64_t closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *(void *)&a1[OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_syncDeviceProvider];
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a1;
  v11[5] = a4;
  v11[6] = a5;
  uint64_t v12 = *(void (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t, char), void *))(*(void *)v10 + 128);
  swift_retain();
  swift_retain();
  uint64_t v13 = a1;
  swift_retain();
  id v14 = a5;
  v12(partial apply for closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices(), v11);
  return swift_release();
}

uint64_t sub_224768A5C()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()()
{
  return closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(*(char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type ProviderError and conformance ProviderError()
{
  unint64_t result = lazy protocol witness table cache variable for type ProviderError and conformance ProviderError;
  if (!lazy protocol witness table cache variable for type ProviderError and conformance ProviderError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProviderError and conformance ProviderError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ProviderError and conformance ProviderError;
  if (!lazy protocol witness table cache variable for type ProviderError and conformance ProviderError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProviderError and conformance ProviderError);
  }
  return result;
}

uint64_t closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unsigned char *)(a5 + 16);
  if (a4)
  {
    swift_beginAccess();
    unsigned char *v8 = 2;
    return OS_dispatch_semaphore.signal()();
  }
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (!v10)
  {
LABEL_7:
    uint64_t v18 = (void *)(a8 + 16);
    swift_beginAccess();
    void *v18 = v11;
    swift_bridgeObjectRelease();
    return OS_dispatch_semaphore.signal()();
  }
  uint64_t v19 = a8;
  uint64_t v12 = (_DWORD *)(a6 + 16);
  uint64_t v20 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  specialized ContiguousArray.reserveCapacity(_:)();
  uint64_t result = swift_beginAccess();
  uint64_t v14 = a3 + 40;
  while (1)
  {
    uint64_t v15 = *(void *)v14;
    uint64_t v16 = *(void *)(v14 + 8);
    uint64_t v17 = *(void *)(v14 + 32);
    v21[0] = *(void *)(v14 - 8);
    v21[1] = v15;
    v21[2] = v16;
    long long v22 = *(_OWORD *)(v14 + 16);
    uint64_t v23 = v17;
    if (*v12 == -1) {
      break;
    }
    ++*v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    KMFindMySyncDevicesProvider.itemFrom(syncDevice:itemCount:)(v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 += 48;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    uint64_t result = specialized ContiguousArray._endMutation()();
    if (!--v10)
    {
      uint64_t v11 = v20;
      swift_bridgeObjectRelease();
      a8 = v19;
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

id KMFindMySyncDevicesProvider.itemFrom(syncDevice:itemCount:)(uint64_t *a1)
{
  v27[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_itemBuilder);
  uint64_t v4 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v5 = (void *)MEMORY[0x22A6161C0](v4);
  swift_bridgeObjectRelease();
  id v23 = 0;
  id v6 = objc_msgSend(v3, sel_setItemType_itemId_error_, 21, v5, &v23);

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = v23;

  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  id v23 = 0;
  id v10 = outlined bridged method (mnbgnnn) of @objc KVItemBuilder.addField(type:value:)(950, v8, v9, (uint64_t)&v23, v3);
  id v11 = v23;
  if (!v10)
  {
    id v13 = v11;
    goto LABEL_7;
  }

  outlined init with take of String?((uint64_t)(a1 + 2), (uint64_t)v25);
  outlined init with take of String?((uint64_t)v25, (uint64_t)v26);
  if (v26[1]) {
    uint64_t v12 = (void *)MEMORY[0x22A6161C0](v26[0]);
  }
  else {
    uint64_t v12 = 0;
  }
  id v23 = 0;
  id v14 = objc_msgSend(v3, sel_addFieldWithType_value_error_, 951, v12, &v23);

  id v13 = v23;
  if (!v14) {
    goto LABEL_16;
  }
  id v15 = v23;

  outlined init with take of String?((uint64_t)(a1 + 4), (uint64_t)v24);
  outlined init with take of String?((uint64_t)v24, (uint64_t)v27);
  uint64_t v16 = v27[1] ? (void *)MEMORY[0x22A6161C0](v27[0]) : 0;
  id v23 = 0;
  id v17 = objc_msgSend(v3, sel_addFieldWithType_value_error_, 952, v16, &v23);

  id v13 = v23;
  if (!v17)
  {
LABEL_16:
    id v21 = v13;
    _convertNSErrorToError(_:)();

    goto LABEL_17;
  }
  id v18 = v23;

  id v23 = 0;
  id v19 = objc_msgSend(v3, sel_buildItemWithError_, &v23);
  if (!v19)
  {
LABEL_5:
    id v13 = v23;
LABEL_7:
    _convertNSErrorToError(_:)();

LABEL_17:
    swift_willThrow();
    return v13;
  }
  id v13 = v19;
  id v20 = v23;
  return v13;
}

id KMFindMySyncDevicesProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id KMFindMySyncDevicesProvider.init()()
{
  uint64_t v15 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  uint64_t v8 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v14 = OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_queue;
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  uint64_t v9 = v0;
  static DispatchQoS.unspecified.getter();
  uint64_t v17 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, *MEMORY[0x263F8F130], v15);
  *(void *)(v13 + v14) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v10 = OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_syncDeviceProvider;
  type metadata accessor for CachingSyncDeviceProvider();
  *(void *)&v9[v10] = CachingSyncDeviceProvider.__allocating_init()();
  uint64_t v11 = OBJC_IVAR____TtC9KoaMapper27KMFindMySyncDevicesProvider_itemBuilder;
  *(void *)&v9[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F510C0]), sel_init);

  v16.receiver = v9;
  v16.super_class = (Class)type metadata accessor for KMFindMySyncDevicesProvider();
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for KMFindMySyncDevicesProvider()
{
  return self;
}

id KMFindMySyncDevicesProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KMFindMySyncDevicesProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProviderError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProviderError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2247695F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for ProviderError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ProviderError(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProviderError()
{
  return &type metadata for ProviderError;
}

uint64_t method lookup function for KMFindMySyncDevicesProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for KMFindMySyncDevicesProvider);
}

uint64_t dispatch thunk of KMFindMySyncDevicesProvider.getSyncDevices()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

id outlined bridged method (mnbgnnn) of @objc KVItemBuilder.addField(type:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x22A6161C0](a2, a3);
  id v9 = objc_msgSend(a5, sel_addFieldWithType_value_error_, a1, v8, a4);

  return v9;
}

uint64_t outlined init with take of String?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2247697CC()
{
  swift_release();
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return closure #1 in closure #1 in KMFindMySyncDevicesProvider.getSyncDevices()(a1, a2, a3, a4 & 1, v4[2], v4[3], v4[4], v4[5]);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

uint64_t Log.unsafeMutableAddressor()
{
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)Log);
}

Swift::String *kmLoggingSubsystem.unsafeMutableAddressor()
{
  return &kmLoggingSubsystem;
}

void one-time initialization function for kmLoggingCategory()
{
  kmLoggingCategory._countAndFlagsBits = 0x657070614D616F4BLL;
  kmLoggingCategory._object = (void *)0xE900000000000072;
}

Swift::String *kmLoggingCategory.unsafeMutableAddressor()
{
  if (one-time initialization token for kmLoggingCategory != -1) {
    swift_once();
  }
  return &kmLoggingCategory;
}

uint64_t one-time initialization function for kmLog()
{
  type metadata accessor for OS_os_log();
  if (one-time initialization token for kmLoggingCategory != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  static OS_os_log.kmLog = result;
  return result;
}

uint64_t *OS_os_log.kmLog.unsafeMutableAddressor()
{
  if (one-time initialization token for kmLog != -1) {
    swift_once();
  }
  return &static OS_os_log.kmLog;
}

id static OS_os_log.kmLog.getter()
{
  if (one-time initialization token for kmLog != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static OS_os_log.kmLog;
  return v0;
}

uint64_t one-time initialization function for Log()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, Log);
  __swift_project_value_buffer(v0, (uint64_t)Log);
  if (one-time initialization token for kmLog != -1) {
    swift_once();
  }
  id v1 = (id)static OS_os_log.kmLog;
  return Logger.init(_:)();
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id ___getCustomVocabularyMap_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F64700];
  id v4 = a3;
  uint64_t v5 = [v3 aceObjectArrayWithDictionaryArray:v4 baseClass:objc_opt_class()];

  return v5;
}

void KMLogInit()
{
  if (KMLogInit_onceToken != -1) {
    dispatch_once(&KMLogInit_onceToken, &__block_literal_global_116);
  }
}

uint64_t __KMLogInit_block_invoke()
{
  KMLogContextCore = (uint64_t)os_log_create("com.apple.siri.vocabulary", "KoaMapper");
  return MEMORY[0x270F9A758]();
}

id _sharedQueue()
{
  if (_sharedQueue_onceToken != -1) {
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_153);
  }
  uint64_t v0 = (void *)_sharedQueue_sharedQueue;
  return v0;
}

void ___sharedQueue_block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("KMProviderHistoryLog", v2);
  id v1 = (void *)_sharedQueue_sharedQueue;
  _sharedQueue_sharedQueue = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_22476C144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__221(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__222(uint64_t a1)
{
}

void sub_22476D230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__435(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__436(uint64_t a1)
{
}

uint64_t _isDefaultLabel(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 length];
  uint64_t v3 = [@"_$!<" length];
  if (v2 >= [@">!$_" length] + v3 && objc_msgSend(v1, "hasPrefix:", @"_$!<")) {
    uint64_t v4 = [v1 hasSuffix:@">!$_"];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void KMMapperSetBuilderError(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F08608];
  v8[0] = *MEMORY[0x263F07F80];
  v8[1] = v3;
  v9[0] = @"Encountered error building item";
  v9[1] = a2;
  uint64_t v4 = NSDictionary;
  id v5 = a2;
  unsigned int v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];
  BOOL v7 = [v2 errorWithDomain:@"com.apple.siri.koa.mapper" code:6 userInfo:v6];

  KVSetError();
}

void sub_22476FD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__855(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__856(uint64_t a1)
{
}

void sub_224771E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_224772050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMMutableHomeManagerConfigurationClass_block_invoke(uint64_t a1)
{
  HomeKitLibrary();
  Class result = objc_getClass("HMMutableHomeManagerConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHMMutableHomeManagerConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getHMHomeManagerClass_block_invoke(v3);
  }
  return result;
}

void __getHMHomeManagerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HMHomeManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHMHomeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    HomeKitLibrary();
  }
}

void HomeKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HomeKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2646DBA88;
    uint64_t v3 = 0;
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
    dispatch_queue_t v0 = (void *)v1[0];
    if (HomeKitLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      dispatch_queue_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __HomeKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_224774204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1420(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1421(uint64_t a1)
{
}

void sub_2247774A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1709(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1710(uint64_t a1)
{
}

void sub_224778ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1911(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1912(uint64_t a1)
{
}

uint64_t CAFObserved<>.observable.getter()
{
  return MEMORY[0x270F12980]();
}

uint64_t dispatch thunk of CAFCarObservable.$media.getter()
{
  return MEMORY[0x270F129A0]();
}

uint64_t dispatch thunk of CAFCarManagerObservable.$currentCar.getter()
{
  return MEMORY[0x270F12A00]();
}

uint64_t dispatch thunk of CAFMediaSourceObservable.mediaSourceSemanticType.getter()
{
  return MEMORY[0x270F12A08]();
}

uint64_t dispatch thunk of CAFMediaSourceObservable.$mediaItems.getter()
{
  return MEMORY[0x270F12A10]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t CachingSyncDeviceProvider.__allocating_init()()
{
  return MEMORY[0x270F65220]();
}

uint64_t type metadata accessor for CachingSyncDeviceProvider()
{
  return MEMORY[0x270F65228]();
}

uint64_t UsoEntity_common_RadioBand.DefinedValues.rawValue.getter()
{
  return MEMORY[0x270F6D478]();
}

uint64_t type metadata accessor for UsoEntity_common_RadioBand.DefinedValues()
{
  return MEMORY[0x270F6D480]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t AnyCancellable.store(in:)()
{
  return MEMORY[0x270EE3B98]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t Publisher.map<A>(_:)()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t Publisher.filter(_:)()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x270EE4008]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x270FA0970]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return MEMORY[0x270FA0F00]();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t CAFMediaSourceSemanticType.description.getter()
{
  return MEMORY[0x270F12AE8]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270FA1170](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x270F9E800]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x270F9E848]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x270F9E858]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x270F9E968]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFKeyboardLMLocaleOverride()
{
  return MEMORY[0x270F0EDF8]();
}

uint64_t AFKeyboardResourcesDirectoryPath()
{
  return MEMORY[0x270F0EE00]();
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x270EE4598](bundle, resourceName, resourceType, subDirName, localizationName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t KVAdditionalFieldTypeToNumber()
{
  return MEMORY[0x270F468D0]();
}

uint64_t KVFieldTypeDescription()
{
  return MEMORY[0x270F468D8]();
}

uint64_t KVFieldTypeFromNumber()
{
  return MEMORY[0x270F468E8]();
}

uint64_t KVFieldTypeToNumber()
{
  return MEMORY[0x270F468F8]();
}

uint64_t KVHash64String()
{
  return MEMORY[0x270F46900]();
}

uint64_t KVSetError()
{
  return MEMORY[0x270F46918]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x270F46AE0]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x270F46AF0]();
}

uint64_t LMLanguageModelEnumerateDynamicTokensWithBlock()
{
  return MEMORY[0x270F46B08]();
}

uint64_t LMLanguageModelGetDynamicTokenIDRange()
{
  return MEMORY[0x270F46B20]();
}

uint64_t LMLanguageModelGetUsageCount()
{
  return MEMORY[0x270F46B48]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x270F46B78]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
}

uint64_t _CFBundleFlushBundleCaches()
{
  return MEMORY[0x270EE55D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}