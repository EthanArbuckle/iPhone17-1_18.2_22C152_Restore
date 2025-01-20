uint64_t static LocalizedStrings.confirmationAlertDeveloperModeMessage.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000029, (void *)0x80000002550583B0);
}

uint64_t static LocalizedStrings.confirmationAlertEnable.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000019, (void *)0x80000002550583E0);
}

uint64_t static LocalizedStrings.confirmationAlertInstall.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001ALL, (void *)0x8000000255058400);
}

uint64_t static LocalizedStrings.confirmationAlertTurnOn.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001ALL, (void *)0x8000000255058420);
}

uint64_t static LocalizedStrings.confirmationAlertNotTurnOn.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001ELL, (void *)0x8000000255058440);
}

uint64_t static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(uint64_t a1, uint64_t a2)
{
  return static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(a1, a2, 0xD00000000000002ALL, (void *)0x8000000255058460);
}

uint64_t static LocalizedStrings.confirmationAlertNotEnable.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001DLL, (void *)0x8000000255058490);
}

uint64_t static LocalizedStrings.confirmationAlertNotInstall.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001ELL, (void *)0x80000002550584B0);
}

uint64_t static LocalizedStrings.developerModeTitle.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000014, (void *)0x80000002550584D0);
}

uint64_t static LocalizedStrings.developerModeMessage.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000016, (void *)0x80000002550584F0);
}

uint64_t static LocalizedStrings.enterPasscode.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0x41505F5245544E45, (void *)0xEE0045444F435353);
}

uint64_t static LocalizedStrings.installProfileTitle.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000015, (void *)0x8000000255058510);
}

uint64_t static LocalizedStrings.installProfileMessage(teamName:)(uint64_t a1, uint64_t a2)
{
  return static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(a1, a2, 0xD000000000000017, (void *)0x8000000255058530);
}

uint64_t static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_255058350;
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v9 = specialized static LocalizedStrings.localizedString(tableSuffix:key:_:)(a3, a4);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t static LocalizedStrings.passcodeRequiredInstallProfile.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000021, (void *)0x8000000255058550);
}

uint64_t static LocalizedStrings.passcodeRequiredDeveloperMode.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000020, (void *)0x8000000255058580);
}

uint64_t static LocalizedStrings.passcodeRequiredTurnOnFeature.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000021, (void *)0x80000002550585B0);
}

uint64_t static LocalizedStrings.pressHomeToContinue.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000016, (void *)0x80000002550585E0);
}

uint64_t static LocalizedStrings.swipeUpToContinue.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000014, (void *)0x8000000255058600);
}

uint64_t static LocalizedStrings.pressHomeForOptions.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000016, (void *)0x8000000255058620);
}

uint64_t static LocalizedStrings.swipeUpForOptions.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000014, (void *)0x8000000255058640);
}

uint64_t NSBundle.Sentinel.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id one-time initialization function for current()
{
  type metadata accessor for NSBundle.Sentinel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

uint64_t specialized static LocalizedStrings.localizedString(tableSuffix:key:)(uint64_t a1, void *a2)
{
  v4._uint64_t countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  if (one-time initialization token for current != -1) {
    swift_once();
  }
  id v5 = (id)static NSBundle.current;
  v11._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = a1;
  v6._object = a2;
  v7.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._uint64_t countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v11._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, (NSBundle)v5, v8, v11)._countAndFlagsBits;
  swift_bridgeObjectRelease();

  return countAndFlagsBits;
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

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized static LocalizedStrings.localizedString(tableSuffix:key:_:)(uint64_t a1, void *a2)
{
  v4._uint64_t countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  if (one-time initialization token for current != -1) {
    swift_once();
  }
  id v5 = (id)static NSBundle.current;
  v11._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = a1;
  v6._object = a2;
  v7.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._uint64_t countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v11._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, (NSBundle)v5, v8, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  uint64_t v9 = String.init(format:_:)();
  swift_bridgeObjectRelease();
  return v9;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

uint64_t type metadata accessor for NSBundle.Sentinel()
{
  return self;
}

id LAPreboard.init(defaults:)()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_initWithDefaults);
}

{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v7;

  v1 = v0;
  type metadata accessor for LACPreboardACMContextProviderFactory();
  swift_allocObject();
  LACPreboardACMContextProviderFactory.init()();
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F52490]), sel_init);
  type metadata accessor for LACPreboardLauncher();
  type metadata accessor for LACPreboardPasscodeVerifier();
  swift_allocObject();
  LACPreboardPasscodeVerifier.init()();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F524A8]), sel_initWithBypassEntitlementChecks_, 1);
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F524A0]), sel_initWithConfig_, v2);

  type metadata accessor for LACPreboardUPPManager();
  swift_allocObject();
  LACPreboardUPPManager.init()();
  type metadata accessor for LACPreboardUseCaseProvider();
  swift_allocObject();
  Swift::String_optional v7 = LACPreboardUseCaseProvider.init()();
  v3 = objc_allocWithZone((Class)type metadata accessor for LACPreboardController());
  Swift::String v4 = (void *)LACPreboardController.init(contextProviderFactory:launcher:passcodeVerifier:secureStorage:uppManager:useCaseProvider:)();
  id v5 = objc_msgSend(v1, sel_initWithController_, v4, v7);

  return v5;
}

unint64_t type metadata accessor for LACPreboardLauncher()
{
  unint64_t result = lazy cache variable for type metadata for LACPreboardLauncher;
  if (!lazy cache variable for type metadata for LACPreboardLauncher)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for LACPreboardLauncher);
  }
  return result;
}

unint64_t LAPreboard.iconSystemName.getter()
{
  id v1 = objc_msgSend(v0, sel_useCase);
  uint64_t v2 = 1918985575;
  if (v1 != (id)3) {
    uint64_t v2 = 0;
  }
  if (v1 == (id)4) {
    return 0xD000000000000034;
  }
  else {
    return v2;
  }
}

uint64_t LAPreboard.title.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.installProfileTitle.getter, static LocalizedStrings.developerModeTitle.getter);
}

uint64_t LAPreboard.message.getter()
{
  return LAPreboard.message.getter((uint64_t (*)(uint64_t, unint64_t))static LocalizedStrings.installProfileMessage(teamName:), static LocalizedStrings.developerModeMessage.getter);
}

Swift::String __swiftcall LAPreboard.actionTitle(withHomeButton:)(Swift::Bool withHomeButton)
{
  objc_msgSend(v1, sel_useCase);
  if (withHomeButton)
  {
    uint64_t v3 = static LocalizedStrings.pressHomeToContinue.getter();
  }
  else
  {
    uint64_t v3 = static LocalizedStrings.swipeUpToContinue.getter();
  }
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t LAPreboard.confirmationTitle.getter()
{
  return 0;
}

id @objc LAPreboard.message.getter(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();
  uint64_t v7 = v6;

  if (v7)
  {
    Swift::String v8 = (void *)MEMORY[0x25A285620](v5, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v8 = 0;
  }
  return v8;
}

uint64_t LAPreboard.confirmationMessage.getter()
{
  return LAPreboard.message.getter((uint64_t (*)(uint64_t, unint64_t))static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:), static LocalizedStrings.confirmationAlertDeveloperModeMessage.getter);
}

uint64_t LAPreboard.message.getter(uint64_t (*a1)(uint64_t, unint64_t), uint64_t (*a2)(void))
{
  id v5 = objc_msgSend(v2, sel_useCase);
  if (v5 == (id)4) {
    return a2();
  }
  if (v5 != (id)3) {
    return 0;
  }
  id v6 = objc_msgSend(objc_msgSend(v2, sel_controller), sel_uppTeamName);
  swift_unknownObjectRelease();
  if (v6)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xE000000000000000;
  }
  uint64_t v10 = a1(v7, v9);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t LAPreboard.confirmationActionTitle.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.confirmationAlertInstall.getter, static LocalizedStrings.confirmationAlertEnable.getter);
}

uint64_t LAPreboard.confirmationCancelTitle.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.confirmationAlertNotInstall.getter, static LocalizedStrings.confirmationAlertNotEnable.getter);
}

id @objc LAPreboard.title.getter(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  id v6 = a1;
  id v7 = objc_msgSend(v6, sel_useCase);
  if (v7 == (id)-1) {
    goto LABEL_5;
  }
  if (v7 == (id)4)
  {
    uint64_t v8 = a4();
    goto LABEL_7;
  }
  if (v7 != (id)3)
  {
LABEL_5:

    uint64_t v10 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = a3();
LABEL_7:
  uint64_t v11 = v8;
  uint64_t v12 = v9;

  uint64_t v10 = (void *)MEMORY[0x25A285620](v11, v12);
  swift_bridgeObjectRelease();
LABEL_8:
  return v10;
}

uint64_t LAPreboard.passcodeSubtitle.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.passcodeRequiredInstallProfile.getter, static LocalizedStrings.passcodeRequiredDeveloperMode.getter);
}

uint64_t LAPreboard.title.getter(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  id v5 = objc_msgSend(v2, sel_useCase);
  if (v5 == (id)4) {
    return a2();
  }
  if (v5 == (id)3) {
    return a1();
  }
  return 0;
}

id LAPreboard.isRequired.getter()
{
  id v1 = objc_msgSend(objc_msgSend(v0, sel_controller), sel_isRequired);
  swift_unknownObjectRelease();
  return v1;
}

id LAPreboard.useCase.getter()
{
  id v1 = objc_msgSend(objc_msgSend(v0, sel_controller), sel_useCase);
  swift_unknownObjectRelease();
  return v1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LAPreboard.launch()()
{
  v4[1] = *(id *)MEMORY[0x263EF8340];
  v4[0] = 0;
  unsigned int v1 = objc_msgSend(objc_msgSend(v0, sel_controller), sel_launchPreboardWithError_, v4);
  swift_unknownObjectRelease();
  if (v1)
  {
    id v2 = v4[0];
  }
  else
  {
    id v3 = v4[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t LAPreboard.launch(completion:)(uint64_t a1, uint64_t a2)
{
  return LAPreboard.launch(completion:)(a1, a2, (uint64_t)&block_descriptor, (SEL *)&selRef_launchPreboardWithCompletion_);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void LAPreboard.setEnvironmentVariableWithPasscode(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)MEMORY[0x25A285620]();
  v9[4] = a3;
  v9[5] = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v9[3] = &block_descriptor_3;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_enableCurrentUseCaseWithPasscode_completion_, v7, v8);
  _Block_release(v8);
}

void LAPreboard.enableCurrentUseCase(withPasscode:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_msgSend(v4, sel_controller);
  uint64_t v10 = (void *)MEMORY[0x25A285620](a1, a2);
  v12[4] = a3;
  v12[5] = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v12[3] = &block_descriptor_6;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_enableCurrentUseCaseWithPasscode_completion_, v10, v11);
  _Block_release(v11);
  swift_unknownObjectRelease();
}

uint64_t LAPreboard.terminate(completion:)(uint64_t a1, uint64_t a2)
{
  return LAPreboard.launch(completion:)(a1, a2, (uint64_t)&block_descriptor_9, (SEL *)&selRef_terminateWithCompletion_);
}

uint64_t LAPreboard.launch(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v9 = objc_msgSend(v4, sel_controller);
  v12[4] = a1;
  v12[5] = a2;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v12[3] = a3;
  uint64_t v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v9, *a4, v10);
  _Block_release(v10);
  return swift_unknownObjectRelease();
}

uint64_t sub_255057D98()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(uint64_t a1)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(a1, *(void *)(v1 + 16));
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = MEMORY[0x270EEEEC0](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t LACPreboardController.init(contextProviderFactory:launcher:passcodeVerifier:secureStorage:uppManager:useCaseProvider:)()
{
  return MEMORY[0x270F477C8]();
}

uint64_t type metadata accessor for LACPreboardController()
{
  return MEMORY[0x270F477D0]();
}

uint64_t LACPreboardUPPManager.init()()
{
  return MEMORY[0x270F477D8]();
}

uint64_t type metadata accessor for LACPreboardUPPManager()
{
  return MEMORY[0x270F477E0]();
}

uint64_t LACPreboardUseCaseProvider.init()()
{
  return MEMORY[0x270F477E8]();
}

uint64_t type metadata accessor for LACPreboardUseCaseProvider()
{
  return MEMORY[0x270F477F0]();
}

uint64_t LACPreboardPasscodeVerifier.init()()
{
  return MEMORY[0x270F477F8]();
}

uint64_t type metadata accessor for LACPreboardPasscodeVerifier()
{
  return MEMORY[0x270F47800]();
}

uint64_t LACPreboardACMContextProviderFactory.init()()
{
  return MEMORY[0x270F47808]();
}

uint64_t type metadata accessor for LACPreboardACMContextProviderFactory()
{
  return MEMORY[0x270F47810]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}