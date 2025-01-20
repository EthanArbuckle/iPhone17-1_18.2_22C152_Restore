id getActiveSimRegions()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  uint64_t vars8;

  v0 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  v16 = 0;
  v1 = [v0 getActiveContexts:&v16];
  v2 = v16;
  v3 = objc_alloc_init((Class)NSMutableArray);
  for (i = 1; i != 3; ++i)
  {
    v5 = [v1 findForSlot:i];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 context];
      if (v7)
      {
        v15 = v2;
        v8 = [v0 copyMobileSubscriberCountryCode:v7 error:&v15];
        v9 = v15;

        if (v8 && !v9)
        {
          v14 = 0;
          v10 = [v0 copyMobileSubscriberIsoCountryCode:v8 error:&v14];
          v11 = v14;
          v9 = v11;
          if (v10 && !v11 && [v10 length])
          {
            v12 = [v10 lowercaseString];

            [v3 addObject:v12];
            v10 = (id)v12;
          }
        }
        v2 = v9;
      }
    }
  }

  return v3;
}

id trialLogHandle()
{
  if (trialLogHandle_onceToken != -1) {
    dispatch_once(&trialLogHandle_onceToken, &__block_literal_global);
  }
  v0 = (void *)trialLogHandle_sLogHandle;

  return v0;
}

void sub_100006960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void __trialLogHandle_block_invoke(id a1)
{
  trialLogHandle_sLogHandle = (uint64_t)os_log_create("com.apple.smsFilter", "trialmanager");

  _objc_release_x1();
}

Swift::Bool __swiftcall String.isNumber()()
{
  unint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v8 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8) {
    return 0;
  }
  uint64_t v15 = v3;
  unint64_t v16 = v2;
  static CharacterSet.decimalDigits.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.rangeOfCharacter(from:options:range:)();
  char v10 = v9;
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  if (v10) {
    return 0;
  }
  uint64_t v15 = v3;
  unint64_t v16 = v2;
  static CharacterSet.letters.getter();
  StringProtocol.rangeOfCharacter(from:options:range:)();
  Swift::Bool v13 = v12 & 1;
  v11(v7, v4);
  return v13;
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

Swift::Bool __swiftcall String.isAlphanumeric()()
{
  unint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v10 = (char *)v16 - v9;
  uint64_t v11 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v11 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11) {
    return 0;
  }
  CharacterSet.init(charactersIn:)();
  v16[0] = v3;
  v16[1] = v2;
  CharacterSet.inverted.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.rangeOfCharacter(from:options:range:)();
  Swift::Bool v13 = v12 & 1;
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  v14(v10, v4);
  return v13;
}

Swift::Bool __swiftcall String.matches(_:)(Swift::String a1)
{
  BOOL v3 = v2;
  uint64_t v4 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[2] = v4;
  v13[3] = v3;
  v13[0] = countAndFlagsBits;
  v13[1] = object;
  uint64_t v10 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.range<A>(of:options:range:locale:)();
  LOBYTE(v3) = (v11 & 1) == 0;
  outlined destroy of Locale?((uint64_t)v9);
  return v3;
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

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall String.compare(_:)(Swift::String a1)
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)() == 0;
}

uint64_t += infix<A>(_:_:)(uint64_t a1)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for Array();
  return Array.append(_:)();
}

uint64_t variable initialization expression of RegionPropertiesReader._regions()
{
  return 0;
}

uint64_t variable initialization expression of SmsFilter._initDone()
{
  return 0;
}

uint64_t variable initialization expression of SmsFilter._regexSubclassificationFilter()
{
  return 1;
}

uint64_t variable initialization expression of SmsFilter._dateCheckpoint@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t variable initialization expression of SmsFilter._region@<X0>(uint64_t a1@<X8>)
{
  _s15extensionFilter6RegionVSgWOi0_(v3);
  return outlined init with take of Region?((uint64_t)v3, a1);
}

double variable initialization expression of SmsFilter._transactionalThreshold()
{
  return 0.5;
}

uint64_t variable initialization expression of SmsFilter._retryTransitionTimerForMainModel()
{
  return 1440;
}

void *variable initialization expression of RegexFilter.templateRegexList()
{
  return &_swiftEmptyArrayStorage;
}

unint64_t variable initialization expression of RegexFilter.regexDict()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DB50;
  *(void *)(inited + 32) = 0x246574614424;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = 0xD0000000000000B0;
  *(void *)(inited + 56) = 0x800000010001F9B0;
  *(void *)(inited + 64) = 0x746E756F63634124;
  *(void *)(inited + 72) = 0xEF247265626D754ELL;
  *(void *)(inited + 80) = 0xD00000000000005CLL;
  *(void *)(inited + 88) = 0x800000010001FA70;
  strcpy((char *)(inited + 96), "$PhoneNumber$");
  *(_WORD *)(inited + 110) = -4864;
  *(void *)(inited + 112) = 0xD000000000000068;
  *(void *)(inited + 120) = 0x800000010001FAD0;
  *(void *)(inited + 128) = 0x24746E756F6D4124;
  *(void *)(inited + 136) = 0xE800000000000000;
  *(void *)(inited + 144) = 0x100000000000004ALL;
  *(void *)(inited + 152) = 0x800000010001FB40;
  *(void *)(inited + 160) = 0x244C525524;
  *(void *)(inited + 168) = 0xE500000000000000;
  *(void *)(inited + 176) = 0xD0000000000000C1;
  *(void *)(inited + 184) = 0x800000010001FB90;
  return specialized Dictionary.init(dictionaryLiteral:)(inited);
}

double variable initialization expression of RegexMessageReader._regex@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double _s15extensionFilter6RegionVSgWOi0_(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t outlined init with take of Region?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Region?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for ILMessageFilterSubAction(uint64_t a1)
{
}

void type metadata accessor for ILMessageFilterAction(uint64_t a1)
{
}

uint64_t base witness table accessor for Equatable in ILMessageFilterAction()
{
  return lazy protocol witness table accessor for type ILMessageFilterAction and conformance ILMessageFilterAction(&lazy protocol witness table cache variable for type ILMessageFilterAction and conformance ILMessageFilterAction, type metadata accessor for ILMessageFilterAction);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NLLanguage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance ILMessageFilterAction@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ILMessageFilterAction(void *a1@<X8>)
{
  *a1 = *v1;
}

void protocol witness for Hashable.hash(into:) in conformance ILMessageFilterAction()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ILMessageFilterAction()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ILMessageFilterAction()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for SetAlgebra.init() in conformance NSMatchingOptions(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ILMessageFilterAction(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t base witness table accessor for Equatable in ILMessageFilterSubAction()
{
  return lazy protocol witness table accessor for type ILMessageFilterAction and conformance ILMessageFilterAction(&lazy protocol witness table cache variable for type ILMessageFilterSubAction and conformance ILMessageFilterSubAction, type metadata accessor for ILMessageFilterSubAction);
}

uint64_t lazy protocol witness table accessor for type ILMessageFilterAction and conformance ILMessageFilterAction(unint64_t *a1, void (*a2)(uint64_t))
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

void *protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for NSMatchingFlags(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _NSRange(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for _NSRange(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for ILMessageFilterSubAction(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void RegionPropertiesReader._regions.setter()
{
}

uint64_t RegionUtils._region.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  outlined init with take of Region?(v1 + 16, (uint64_t)v4);
  outlined retain of Region?(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of Region?);
  return outlined init with take of Region?((uint64_t)v4, a1);
}

uint64_t outlined copy of Region?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *RegionUtils._region.setter(void *a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  outlined init with take of Region?(v3, (uint64_t)v5);
  outlined init with take of Region?((uint64_t)a1, v3);
  outlined retain of Region?(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of Region?);
  outlined retain of Region?(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return outlined retain of Region?(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
}

void *outlined retain of Region?(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t outlined consume of Region?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*RegionUtils._region.modify())()
{
  return RegionUtils._region.modify;
}

uint64_t RegionUtils.__allocating_init(for:)(_OWORD *a1)
{
  uint64_t v2 = swift_allocObject();
  _s15extensionFilter6RegionVSgWOi0_(v10);
  outlined init with take of Region?((uint64_t)v10, v2 + 16);
  long long v3 = a1[5];
  v11[4] = a1[4];
  v11[5] = v3;
  long long v4 = a1[7];
  v11[6] = a1[6];
  v11[7] = v4;
  long long v5 = a1[1];
  v11[0] = *a1;
  v11[1] = v5;
  long long v6 = a1[3];
  v11[2] = a1[2];
  v11[3] = v6;
  Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v11, v7, v8);
  swift_beginAccess();
  outlined init with take of Region?(v2 + 16, (uint64_t)v12);
  outlined init with take of Region?((uint64_t)v11, v2 + 16);
  outlined retain of Region?(v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return v2;
}

uint64_t RegionUtils.init(for:)(_OWORD *a1)
{
  _s15extensionFilter6RegionVSgWOi0_(v10);
  outlined init with take of Region?((uint64_t)v10, v1 + 16);
  long long v3 = a1[5];
  v11[4] = a1[4];
  v11[5] = v3;
  long long v4 = a1[7];
  v11[6] = a1[6];
  v11[7] = v4;
  long long v5 = a1[1];
  v11[0] = *a1;
  v11[1] = v5;
  long long v6 = a1[3];
  v11[2] = a1[2];
  v11[3] = v6;
  Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v11, v7, v8);
  swift_beginAccess();
  outlined init with take of Region?(v1 + 16, (uint64_t)v12);
  outlined init with take of Region?((uint64_t)v11, v1 + 16);
  outlined retain of Region?(v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return v1;
}

Swift::Bool __swiftcall RegionUtils.shouldApplyFilter(sender:)(Swift::String sender)
{
  uint64_t v2 = v1;
  unint64_t object = (unint64_t)sender._object;
  uint64_t countAndFlagsBits = sender._countAndFlagsBits;
  uint64_t v5 = type metadata accessor for CharacterSet();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  char v11 = (char *)&v76 - v10;
  uint64_t v12 = (uint64_t)(v1 + 2);
  swift_beginAccess();
  outlined init with take of Region?(v12, (uint64_t)v97);
  outlined init with take of Region?((uint64_t)v97, (uint64_t)v98);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v98);
  if (v13 == 1)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v83 = v2[5];
  v87 = (void *)v2[6];
  outlined init with take of Region?(v12, (uint64_t)v95);
  outlined init with take of Region?((uint64_t)v95, (uint64_t)v96);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v96);
  if (v13 == 1)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  unint64_t v80 = v2[7];
  uint64_t v86 = v12;
  outlined init with take of Region?(v12, (uint64_t)v93);
  outlined init with take of Region?((uint64_t)v93, (uint64_t)v94);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v94);
  if (v13 == 1)
  {
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  uint64_t v14 = v2[10];
  uint64_t v15 = one-time initialization token for logger;
  swift_bridgeObjectRetain();
  uint64_t v84 = v14;
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  uint64_t v78 = v17;
  v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v85 = countAndFlagsBits;
  v79 = v9;
  if (v20)
  {
    v81 = v2;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v77 = v6;
    v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    v82 = v11;
    v92[0] = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v6 = v77;
    v91[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, object, v92);
    uint64_t v2 = v81;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "smsfilter: senderID: %s", v22, 0xCu);
    swift_arrayDestroy();
    char v11 = v82;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  outlined init with take of Region?(v86, (uint64_t)v91);
  outlined init with take of Region?((uint64_t)v91, (uint64_t)v92);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v92);
  if (v13 == 1) {
    goto LABEL_61;
  }
  uint64_t v24 = v85;
  if (v2[2] == 28259 && v2[3] == 0xE200000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = HIBYTE(object) & 0xF;
    if ((object & 0x2000000000000000) == 0) {
      uint64_t v25 = v24 & 0xFFFFFFFFFFFFLL;
    }
    if (v25)
    {
      uint64_t v89 = v24;
      unint64_t v90 = object;
      static CharacterSet.decimalDigits.getter();
      lazy protocol witness table accessor for type String and conformance String();
      StringProtocol.rangeOfCharacter(from:options:range:)();
      char v27 = v26;
      v28 = *(void (**)(char *, uint64_t))(v6 + 8);
      v28(v11, v5);
      if ((v27 & 1) == 0)
      {
        uint64_t v89 = v24;
        unint64_t v90 = object;
        static CharacterSet.letters.getter();
        StringProtocol.rangeOfCharacter(from:options:range:)();
        char v30 = v29;
        v28(v11, v5);
        if (v30)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
          uint64_t v55 = swift_allocObject();
          *(_OWORD *)(v55 + 16) = xmmword_10001DD50;
          *(void *)(v55 + 32) = 3551281;
          *(void *)(v55 + 40) = 0xE300000000000000;
          uint64_t v89 = v24;
          unint64_t v90 = object;
          swift_bridgeObjectRetain();
          String.init<A>(_:)();
          specialized Collection.prefix(_:)(3);
          swift_bridgeObjectRelease();
          uint64_t v56 = static String._fromSubstring(_:)();
          uint64_t v58 = v57;
          swift_bridgeObjectRelease();
          char v31 = specialized Sequence<>.contains(_:)(v56, v58, (void *)v55);
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          goto LABEL_19;
        }
      }
    }
    goto LABEL_18;
  }
  v32._uint64_t countAndFlagsBits = v83;
  v32._unint64_t object = v87;
  Swift::Bool v33 = String.hasPrefix(_:)(v32);
  swift_bridgeObjectRelease();
  if (!v33)
  {
    swift_bridgeObjectRelease();
    v44._uint64_t countAndFlagsBits = 43;
    v44._unint64_t object = (void *)0xE100000000000000;
    if (String.hasPrefix(_:)(v44))
    {
      swift_bridgeObjectRetain();
      specialized Collection.dropFirst(_:)(1uLL, v24, object);
      swift_bridgeObjectRelease();
      uint64_t v45 = static String._fromSubstring(_:)();
      unint64_t v47 = v46;
      swift_bridgeObjectRelease();
      uint64_t v48 = HIBYTE(v47) & 0xF;
      if ((v47 & 0x2000000000000000) == 0) {
        uint64_t v48 = v45 & 0xFFFFFFFFFFFFLL;
      }
      if (!v48) {
        goto LABEL_33;
      }
      uint64_t v89 = v45;
      unint64_t v90 = v47;
      static CharacterSet.decimalDigits.getter();
      lazy protocol witness table accessor for type String and conformance String();
      StringProtocol.rangeOfCharacter(from:options:range:)();
      char v50 = v49;
      v51 = v11;
      v52 = *(void (**)(char *, uint64_t))(v6 + 8);
      v52(v51, v5);
      if ((v50 & 1) != 0
        || (uint64_t v89 = v45,
            unint64_t v90 = v47,
            static CharacterSet.letters.getter(),
            StringProtocol.rangeOfCharacter(from:options:range:)(),
            char v54 = v53,
            v52(v51, v5),
            (v54 & 1) == 0))
      {
LABEL_33:
        swift_bridgeObjectRelease();
        char v31 = 0;
        goto LABEL_19;
      }
      uint64_t v71 = String.count.getter();
      swift_bridgeObjectRelease();
      if (v71 >= 11)
      {
        v72 = Logger.logObject.getter();
        os_log_type_t v73 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v72, v73))
        {
          v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v74 = 0;
          _os_log_impl((void *)&_mh_execute_header, v72, v73, "this is an international valid sms. so, do not classify", v74, 2u);
          swift_slowDealloc();
        }

        char v31 = 0;
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    uint64_t v59 = HIBYTE(object) & 0xF;
    if ((object & 0x2000000000000000) == 0) {
      uint64_t v59 = v24 & 0xFFFFFFFFFFFFLL;
    }
    if (!v59) {
      goto LABEL_18;
    }
    v60 = v79;
    CharacterSet.init(charactersIn:)();
    uint64_t v89 = v24;
    unint64_t v90 = object;
    CharacterSet.inverted.getter();
    lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.rangeOfCharacter(from:options:range:)();
    char v62 = v61;
    v63 = *(void (**)(char *, uint64_t))(v6 + 8);
    v63(v11, v5);
    v63(v60, v5);
    if ((v62 & 1) == 0)
    {
LABEL_18:
      char v31 = 0;
      goto LABEL_19;
    }
    outlined init with take of Region?(v86, (uint64_t)v88);
    outlined init with take of Region?((uint64_t)v88, (uint64_t)&v89);
    LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)&v89);
    if (v13 != 1)
    {
      char v31 = (v2[2] != 29557 || v2[3] != 0xE200000000000000)
         && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
         || String.count.getter() != 10;
      goto LABEL_19;
    }
LABEL_62:
    __break(1u);
    return v13;
  }
  v81 = v2;
  v82 = v11;
  swift_bridgeObjectRetain();
  specialized Collection.dropFirst(_:)(v80, v24, object);
  swift_bridgeObjectRelease();
  uint64_t v34 = static String._fromSubstring(_:)();
  unint64_t v36 = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = HIBYTE(v36) & 0xF;
  if ((v36 & 0x2000000000000000) == 0) {
    uint64_t v37 = v34 & 0xFFFFFFFFFFFFLL;
  }
  if (v37)
  {
    uint64_t v89 = v34;
    unint64_t v90 = v36;
    v38 = v82;
    static CharacterSet.decimalDigits.getter();
    v87 = (void *)lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.rangeOfCharacter(from:options:range:)();
    char v40 = v39;
    v41 = *(void (**)(char *, uint64_t))(v6 + 8);
    v41(v38, v5);
    if ((v40 & 1) == 0)
    {
      uint64_t v89 = v34;
      unint64_t v90 = v36;
      static CharacterSet.letters.getter();
      StringProtocol.rangeOfCharacter(from:options:range:)();
      char v43 = v42;
      v41(v38, v5);
      if (v43)
      {
        uint64_t v64 = v84;
        uint64_t v65 = *(void *)(v84 + 16);
        if (v65)
        {
          uint64_t v66 = *(void *)(v84 + 32);
          uint64_t v13 = String.count.getter();
          if (v13 == v66)
          {
LABEL_50:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v70._uint64_t countAndFlagsBits = v24;
            v70._unint64_t object = (void *)object;
            char v31 = RegionUtils.allowExceptions(sender:)(v70);
            goto LABEL_19;
          }
          uint64_t v67 = 0;
          uint64_t v68 = v65 - 1;
          while (v68 != v67)
          {
            if ((unint64_t)(v67 + 1) >= *(void *)(v64 + 16))
            {
              __break(1u);
              goto LABEL_58;
            }
            uint64_t v69 = *(void *)(v64 + 8 * v67 + 40);
            uint64_t v13 = String.count.getter();
            ++v67;
            if (v13 == v69) {
              goto LABEL_50;
            }
          }
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v31 = 1;
LABEL_19:
  LOBYTE(v13) = v31 & 1;
  return v13;
}

uint64_t _s15extensionFilter6RegionVSgWOg(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall RegionUtils.allowExceptions(sender:)(Swift::String sender)
{
  unint64_t object = sender._object;
  uint64_t countAndFlagsBits = sender._countAndFlagsBits;
  swift_beginAccess();
  outlined init with take of Region?(v1 + 16, (uint64_t)v12);
  outlined init with take of Region?((uint64_t)v12, (uint64_t)v13);
  int v4 = _s15extensionFilter6RegionVSgWOg((uint64_t)v13);
  if (v4 == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = *(void **)(v1 + 88);
    uint64_t v6 = v5[2];
    if (v6)
    {
      BOOL v7 = v5[4] == countAndFlagsBits && v5[5] == (void)object;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        BOOL v8 = 1;
      }
      else
      {
        uint64_t v9 = v5 + 7;
        do
        {
          BOOL v8 = --v6 != 0;
          if (!v6) {
            break;
          }
          if (*(v9 - 1) == countAndFlagsBits && *v9 == (void)object) {
            break;
          }
          v9 += 2;
        }
        while ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    LOBYTE(v4) = v8;
  }
  return v4;
}

Swift::Bool __swiftcall RegionUtils.dominantLanguageOfMessage(message:regionLanguage:)(Swift::String message, NLLanguage regionLanguage)
{
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 dominantLanguageForString:v3];

  if (v4)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
    if (v5 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v7 == v8) {
      char v10 = 1;
    }
    else {
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

Swift::Bool __swiftcall RegionUtils.dominantLanguageMatch(message:)(Swift::String message)
{
  swift_beginAccess();
  outlined init with take of Region?(v1 + 16, (uint64_t)v16);
  outlined init with take of Region?((uint64_t)v16, (uint64_t)v17);
  int v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v17);
  if (v2 == 1)
  {
    __break(1u);
    goto LABEL_18;
  }
  BOOL v3 = *(void *)(v1 + 16) == 29282 && *(void *)(v1 + 24) == 0xE200000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    outlined init with take of Region?(v1 + 16, (uint64_t)v14);
    outlined init with take of Region?((uint64_t)v14, (uint64_t)v15);
    int v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v15);
    if (v2 != 1)
    {
      swift_bridgeObjectRetain();
      NSString v4 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v5 = self;
      NSString v6 = String._bridgeToObjectiveC()();
      id v7 = [v5 dominantLanguageForString:v6];

      if (v7)
      {
        uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v10 = v9;
        if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v11) {
          char v12 = 1;
        }
        else {
          char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {

        char v12 = 0;
      }
      goto LABEL_16;
    }
LABEL_18:
    __break(1u);
    return v2;
  }
  char v12 = 1;
LABEL_16:
  LOBYTE(v2) = v12 & 1;
  return v2;
}

uint64_t RegionUtils.deinit()
{
  outlined init with take of Region?(v0 + 16, (uint64_t)v2);
  outlined retain of Region?(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return v0;
}

uint64_t RegionUtils.__deallocating_deinit()
{
  outlined init with take of Region?(v0 + 16, (uint64_t)v2);
  outlined retain of Region?(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return swift_deallocClassInstance();
}

Swift::OpaquePointer_optional __swiftcall getMySimRegions()()
{
  void (*v10)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  Swift::Bool v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  char *v24;
  void v25[16];
  unsigned char v26[136];
  Swift::OpaquePointer_optional result;

  id v0 = getActiveSimRegions();
  if (!v0)
  {
    if (one-time initialization token for logger != -1) {
      goto LABEL_37;
    }
    goto LABEL_30;
  }
  uint64_t v1 = v0;
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_34;
  }
  unint64_t v4 = 0;
  uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
  while (v4 < *(void *)(v2 + 16))
  {
    NSString v6 = (uint64_t *)(v2 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    uint64_t v9 = one-time initialization token for sharedRegionProperties;
    swift_bridgeObjectRetain();
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(*(void *)static RegionPropertiesReader.sharedRegionProperties
                                                                        + 136);
    swift_retain();
    v10(v25, v8, v7);
    swift_release();
    outlined retain of Region?(v25, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
    outlined init with take of Region?((uint64_t)v25, (uint64_t)v26);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v26) != 1)
    {
      uint64_t v11 = *((void *)v5 + 2);
      if (!v11) {
        goto LABEL_23;
      }
      if ((*((void *)v5 + 4) != v8 || *((void *)v5 + 5) != v7)
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        if (v11 == 1)
        {
LABEL_23:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11 + 1, 1, v5);
          }
          uint64_t v17 = *((void *)v5 + 2);
          uint64_t v16 = *((void *)v5 + 3);
          if (v17 >= v16 >> 1) {
            uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v16 > 1), v17 + 1, 1, v5);
          }
          *((void *)v5 + 2) = v17 + 1;
          v18 = &v5[16 * v17];
          *((void *)v18 + 4) = v8;
          *((void *)v18 + 5) = v7;
          goto LABEL_5;
        }
        char v12 = v5 + 56;
        uint64_t v13 = 1;
        while (1)
        {
          uint64_t v14 = *(v12 - 1) == v8 && *v12 == v7;
          if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t v15 = v13 + 1;
          if (__OFADD__(v13, 1)) {
            goto LABEL_36;
          }
          v12 += 2;
          ++v13;
          if (v15 == v11) {
            goto LABEL_23;
          }
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_5:
    if (++v4 == v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  swift_once();
LABEL_30:
  BOOL v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)logger);
  uint64_t v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "smsfilter: no supported active sim-region", v23, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = 0;
LABEL_34:
  uint64_t v24 = v5;
  result.value._rawValue = v24;
  result.is_nil = v19;
  return result;
}

Swift::Bool __swiftcall validSimRegion(currentSimRegion:)(Swift::String currentSimRegion)
{
  unint64_t object = currentSimRegion._object;
  uint64_t countAndFlagsBits = currentSimRegion._countAndFlagsBits;
  MySim = (void *)getMySimRegions()();
  if (MySim)
  {
    char v4 = specialized Sequence<>.contains(_:)(countAndFlagsBits, (uint64_t)object, MySim);
    swift_bridgeObjectRelease();
    LOBYTE(MySim) = v4 & 1;
  }
  return (char)MySim;
}

Swift::Bool __swiftcall simRegionSupported(for:)(Swift::String a1)
{
  void (*v3)(void *__return_ptr, uint64_t, void *);
  int v4;
  void v6[16];
  unsigned char v7[128];

  unint64_t object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (one-time initialization token for sharedRegionProperties != -1) {
    swift_once();
  }
  uint64_t v3 = *(void (**)(void *__return_ptr, uint64_t, void *))(*(void *)static RegionPropertiesReader.sharedRegionProperties
                                                                    + 136);
  swift_retain();
  v3(v6, countAndFlagsBits, object);
  swift_release();
  outlined init with take of Region?((uint64_t)v6, (uint64_t)v7);
  char v4 = _s15extensionFilter6RegionVSgWOg((uint64_t)v7);
  if (v4 != 1) {
    outlined retain of Region?(v6, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  }
  return v4 != 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<_NSRange>);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
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
    ObjectType = &type metadata for _StringGuts;
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

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
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
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    String.index(_:offsetBy:limitedBy:)();
    return String.subscript.getter();
  }
  return result;
}

unint64_t specialized Collection.dropFirst(_:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  uint64_t result = String.index(_:offsetBy:limitedBy:)();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }

  return String.subscript.getter();
}

uint64_t type metadata accessor for RegionUtils()
{
  return self;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
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

void *SmsFilter._basicModel.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void SmsFilter._basicModel.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;
}

uint64_t (*SmsFilter._basicModel.modify())()
{
  return SmsFilter._basicModel.modify;
}

void *SmsFilter._mainModel.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void SmsFilter._mainModel.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
}

uint64_t (*SmsFilter._mainModel.modify())()
{
  return SmsFilter._basicModel.modify;
}

void *SmsFilter._subClassificationModel.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void SmsFilter._subClassificationModel.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*SmsFilter._subClassificationModel.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._initDone.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t SmsFilter._initDone.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 40) = a1;
  return result;
}

uint64_t (*SmsFilter._initDone.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._checkForMainModel.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t SmsFilter._checkForMainModel.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 41) = a1;
  return result;
}

uint64_t (*SmsFilter._checkForMainModel.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regexPromotionalFilter.getter()
{
  return swift_retain();
}

uint64_t SmsFilter._regexPromotionalFilter.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 48) = a1;
  return swift_release();
}

uint64_t (*SmsFilter._regexPromotionalFilter.modify())()
{
  return RegionUtils._region.modify;
}

uint64_t SmsFilter._regexTransactionalFilter.getter()
{
  return swift_retain();
}

uint64_t SmsFilter._regexTransactionalFilter.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_release();
}

uint64_t (*SmsFilter._regexTransactionalFilter.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regexSubclassificationFilter.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  outlined copy of SmsFilter._regexSubclassification?(v1);
  return v1;
}

uint64_t outlined copy of SmsFilter._regexSubclassification?(uint64_t result)
{
  if (result != 1)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t SmsFilter._regexSubclassificationFilter.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = v3[8];
  _OWORD v3[8] = a1;
  v3[9] = a2;
  v3[10] = a3;
  return outlined consume of SmsFilter._regexSubclassification?(v7);
}

uint64_t outlined consume of SmsFilter._regexSubclassification?(uint64_t result)
{
  if (result != 1)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t (*SmsFilter._regexSubclassificationFilter.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._dateCheckpoint.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  swift_beginAccess();
  return outlined init with copy of Date?(v3, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t SmsFilter._dateCheckpoint.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  swift_beginAccess();
  outlined assign with take of Date?(a1, v3);
  return swift_endAccess();
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*SmsFilter._dateCheckpoint.modify())()
{
  return SmsFilter._basicModel.modify;
}

void *SmsFilter._trialManager.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void SmsFilter._trialManager.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*SmsFilter._trialManager.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regionUtils.getter()
{
  return swift_retain();
}

uint64_t SmsFilter._regionUtils.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  swift_beginAccess();
  *id v3 = a1;
  return swift_release();
}

uint64_t (*SmsFilter._regionUtils.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._region.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v3, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of Region?);
  return outlined init with take of Region?((uint64_t)v5, a1, &demangling cache variable for type metadata for Region?);
}

void *SmsFilter._region.setter(void *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v3, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)a1, v3, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of Region?);
  outlined retain of Region?(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return outlined retain of Region?(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
}

uint64_t (*SmsFilter._region.modify())()
{
  return SmsFilter._basicModel.modify;
}

double SmsFilter._promotionalThreshold.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SmsFilter._promotionalThreshold.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SmsFilter._promotionalThreshold.modify())()
{
  return SmsFilter._basicModel.modify;
}

double SmsFilter._transactionalThreshold.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SmsFilter._transactionalThreshold.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SmsFilter._transactionalThreshold.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._retryTransitionTimerForMainModel.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SmsFilter._retryTransitionTimerForMainModel.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SmsFilter._retryTransitionTimerForMainModel.modify())()
{
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regexSubclassification._regexFilterFinance.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.TrialParams.trialSupported.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t SmsFilter._regexSubclassification._regexFilterReminders.getter()
{
  return swift_retain();
}

uint64_t SmsFilter._regexSubclassification._regexFilterReminders.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.TrialParams.namespaceId.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t SmsFilter._regexSubclassification._regexFilterOrders.getter()
{
  return swift_retain();
}

uint64_t SmsFilter._regexSubclassification._regexFilterOrders.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 16) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.smsFilterSupported.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t SmsFilter._regexSubclassification.init()()
{
  type metadata accessor for RegexFilter();
  swift_allocObject();
  uint64_t v0 = RegexFilter.init()();
  swift_allocObject();
  swift_retain();
  RegexFilter.init()();
  swift_allocObject();
  swift_retain();
  RegexFilter.init()();
  swift_release();
  swift_release();
  return v0;
}

void one-time initialization function for kFinance()
{
  static SmsFilter.SubClasses.kFinance = 0x65636E616E6946;
  qword_10002ACA8 = 0xE700000000000000;
}

uint64_t *SmsFilter.SubClasses.kFinance.unsafeMutableAddressor()
{
  if (one-time initialization token for kFinance != -1) {
    swift_once();
  }
  return &static SmsFilter.SubClasses.kFinance;
}

uint64_t static SmsFilter.SubClasses.kFinance.getter()
{
  return static SmsFilter.SubClasses.kFinance.getter(&one-time initialization token for kFinance, &static SmsFilter.SubClasses.kFinance);
}

void one-time initialization function for kOrders()
{
  static SmsFilter.SubClasses.kOrders = 0x73726564724FLL;
  qword_10002ACB8 = 0xE600000000000000;
}

uint64_t *SmsFilter.SubClasses.kOrders.unsafeMutableAddressor()
{
  if (one-time initialization token for kOrders != -1) {
    swift_once();
  }
  return &static SmsFilter.SubClasses.kOrders;
}

uint64_t static SmsFilter.SubClasses.kOrders.getter()
{
  return static SmsFilter.SubClasses.kFinance.getter(&one-time initialization token for kOrders, &static SmsFilter.SubClasses.kOrders);
}

void one-time initialization function for kReminders()
{
  static SmsFilter.SubClasses.kReminders = 0x7265646E696D6552;
  qword_10002ACC8 = 0xE900000000000073;
}

uint64_t *SmsFilter.SubClasses.kReminders.unsafeMutableAddressor()
{
  if (one-time initialization token for kReminders != -1) {
    swift_once();
  }
  return &static SmsFilter.SubClasses.kReminders;
}

uint64_t static SmsFilter.SubClasses.kReminders.getter()
{
  return static SmsFilter.SubClasses.kFinance.getter(&one-time initialization token for kReminders, &static SmsFilter.SubClasses.kReminders);
}

uint64_t static SmsFilter.SubClasses.kFinance.getter(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t SmsFilter.__allocating_init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  SmsFilter.init(for:)(a1, a2);
  return v4;
}

uint64_t SmsFilter.init(for:)(uint64_t a1, uint64_t a2)
{
  void (*v11)(void *__return_ptr, void, void);
  id v12;
  void *v13;
  Swift::OpaquePointer v14;
  Swift::OpaquePointer v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  void v28[16];
  unsigned char v29[128];
  _OWORD v30[8];
  void v31[16];
  unsigned char v32[128];
  unsigned char v33[128];
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  void v42[16];
  _OWORD v43[8];
  _OWORD v44[8];

  uint64_t v3 = v2;
  *(void *)(v3 + 48) = 0;
  *(void *)(v3 + 56) = 0;
  *(void *)(v3 + 64) = 1;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(_WORD *)(v3 + 40) = 0;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 80) = 0;
  uint64_t v6 = v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  int64_t v8 = (void **)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  *(void *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager) = 0;
  int64_t v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  *(void *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils) = 0;
  uint64_t v10 = v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  _s15extensionFilter6RegionVSgWOi0_(v44);
  outlined init with take of Region?((uint64_t)v44, v10, &demangling cache variable for type metadata for Region?);
  *(void *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold) = 0x3FE0000000000000;
  *(void *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold) = 0x3FE0000000000000;
  *(void *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel) = 1440;
  if (one-time initialization token for sharedRegionProperties != -1) {
    swift_once();
  }
  size_t v11 = *(void (**)(void *__return_ptr, void, void))(*(void *)static RegionPropertiesReader.sharedRegionProperties
                                                                    + 136);
  swift_retain();
  v11(v42, a1, a2);
  swift_release();
  swift_bridgeObjectRelease();
  outlined init with take of Region?((uint64_t)v42, (uint64_t)v43, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v43) == 1) {
    return v3;
  }
  char v39 = v43[5];
  char v40 = v43[6];
  v41 = v43[7];
  uint64_t v34 = v43[0];
  unint64_t v35 = v43[1];
  unint64_t v36 = v43[2];
  uint64_t v37 = v43[3];
  v38 = v43[4];
  uint64_t v12 = [objc_allocWithZone((Class)SmsFilterTrialModelManager) init];
  swift_beginAccess();
  uint64_t v13 = *v8;
  *int64_t v8 = v12;

  if (!*v8)
  {
    outlined retain of Region?(v42, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    __swift_project_value_buffer(v24, (uint64_t)logger);
    uint64_t v25 = Logger.logObject.getter();
    char v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      char v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "smsfilter: _trialManager failed to init", v27, 2u);
      swift_slowDealloc();
    }

    return v3;
  }
  v30[4] = v38;
  v30[5] = v39;
  v30[6] = v40;
  v30[7] = v41;
  v30[0] = v34;
  v30[1] = v35;
  v30[2] = v36;
  v30[3] = v37;
  Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v30, v14, v15);
  swift_beginAccess();
  outlined init with take of Region?(v10, (uint64_t)v31, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v30, v10, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(v31, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  outlined init with take of Region?(v10, (uint64_t)v32, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v32, (uint64_t)v33, &demangling cache variable for type metadata for Region?);
  uint64_t result = _s15extensionFilter6RegionVSgWOg((uint64_t)v33);
  if (result != 1)
  {
    type metadata accessor for RegionUtils();
    uint64_t v17 = swift_allocObject();
    outlined init with take of Region?((uint64_t)v44, v17 + 16, &demangling cache variable for type metadata for Region?);
    swift_beginAccess();
    outlined init with take of Region?(v17 + 16, (uint64_t)v28, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v32, v17 + 16, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v32, (uint64_t)v29, &demangling cache variable for type metadata for Region?);
    outlined retain of Region((uint64_t)v29);
    outlined retain of Region?(v28, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
    swift_beginAccess();
    *int64_t v9 = v17;
    swift_release();
    type metadata accessor for RegexFilter();
    swift_allocObject();
    v18 = RegexFilter.init()();
    swift_beginAccess();
    *(void *)(v3 + 48) = v18;
    swift_release();
    swift_allocObject();
    os_log_type_t v19 = RegexFilter.init()();
    swift_beginAccess();
    *(void *)(v3 + 56) = v19;
    swift_release();
    swift_allocObject();
    BOOL v20 = RegexFilter.init()();
    swift_allocObject();
    swift_retain();
    uint64_t v21 = RegexFilter.init()();
    swift_allocObject();
    swift_retain();
    v22 = RegexFilter.init()();
    swift_release();
    swift_release();
    swift_beginAccess();
    uint64_t v23 = *(void *)(v3 + 64);
    *(void *)(v3 + 64) = v20;
    *(void *)(v3 + 72) = v21;
    *(void *)(v3 + 80) = v22;
    outlined consume of SmsFilter._regexSubclassification?(v23);
    SmsFilter.initSmsFilterModel()();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t SmsFilter.initSmsFilterModel()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v4, (uint64_t)v14, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v14, (uint64_t)v15, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v15) == 1)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned char *)(v4 + 88) == 1)
  {
    unint64_t v5 = (void **)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess();
    uint64_t v6 = *v5;
    if (v6)
    {
      outlined init with take of Region?(v4, (uint64_t)v12, &demangling cache variable for type metadata for Region?);
      outlined init with take of Region?((uint64_t)v12, (uint64_t)v13, &demangling cache variable for type metadata for Region?);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v13) != 1)
      {
        unint64_t v7 = *(void *)(v4 + 96);
        if ((v7 & 0x8000000000000000) == 0 && !HIDWORD(v7))
        {
          [v6 initializeWithNamespace:];
          SmsFilter.loadTrialMainModelWithThresholds()();
          SmsFilter.loadFallbackModel()();
          SmsFilter.loadTrialSubClassificationModel()();
          SmsFilter.loadRegexFromTrial()();
          goto LABEL_8;
        }
LABEL_14:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
LABEL_8:
  swift_beginAccess();
  uint64_t v8 = *(void *)(v0 + 24);
  swift_beginAccess();
  *(unsigned char *)(v0 + 41) = v8 == 0;
  if (!v8)
  {
    Date.init()();
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 0, 1, v9);
    uint64_t v10 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
    swift_beginAccess();
    outlined assign with take of Date?((uint64_t)v3, v10);
    swift_endAccess();
  }
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v0 + 40) = 1;
  return result;
}

Swift::Void __swiftcall SmsFilter.cleanup()()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v1, (uint64_t)v13, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v13, (uint64_t)v14, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v14) == 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned char *)(v1 + 88) != 1)
  {
LABEL_5:
    uint64_t v3 = (void **)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess();
    uint64_t v4 = *v3;
    *uint64_t v3 = 0;

    _s15extensionFilter6RegionVSgWOi0_(v11);
    outlined init with take of Region?(v1, (uint64_t)v12, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v11, v1, &demangling cache variable for type metadata for Region?);
    outlined retain of Region?(v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
    swift_beginAccess();
    unint64_t v5 = (void *)v0[3];
    v0[3] = 0;

    swift_beginAccess();
    uint64_t v6 = (void *)v0[2];
    v0[2] = 0;

    swift_beginAccess();
    unint64_t v7 = (void *)v0[4];
    v0[4] = 0;

    swift_beginAccess();
    v0[6] = 0;
    swift_release();
    swift_beginAccess();
    v0[7] = 0;
    swift_release();
    uint64_t v8 = (void *)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
    swift_beginAccess();
    *uint64_t v8 = 0;
    swift_release();
    uint64_t v9 = v0 + 8;
    swift_beginAccess();
    if (v0[8] != 1)
    {
      *uint64_t v9 = 0;
      swift_release();
      if (*v9 != 1)
      {
        v0[10] = 0;
        swift_release();
        if (v0[8] != 1)
        {
          v0[9] = 0;
          swift_release();
          uint64_t v10 = v0[8];
          v0[9] = 0;
          v0[10] = 0;
          v0[8] = 1;
          outlined consume of SmsFilter._regexSubclassification?(v10);
          return;
        }
        goto LABEL_12;
      }
LABEL_11:
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v2 = (id *)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess();
  if (*v2)
  {
    [*v2 prepareForTrialParamsUpdate];
    goto LABEL_5;
  }
LABEL_13:
  __break(1u);
}

Swift::Bool __swiftcall SmsFilter.trialSupportEnabled()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v1, (uint64_t)v4, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v4, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  int v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v5);
  if (v2 == 1) {
    __break(1u);
  }
  else {
    LOBYTE(v2) = *(unsigned char *)(v1 + 88);
  }
  return v2;
}

void SmsFilter.loadTrialMainModelWithThresholds()()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v2, (uint64_t)v34, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v34, (uint64_t)v35, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v35) == 1) {
    __break(1u);
  }
  if (*(unsigned char *)(v2 + 88) == 1)
  {
    uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess();
    uint64_t v4 = *v3;
    if (v4)
    {
      swift_beginAccess();
      unint64_t v5 = *(void **)(v1 + 16);
      *(void *)(v1 + 16) = 0;
      id v6 = v4;

      id v7 = [v6 getMainModel];
      if (v7)
      {
        uint64_t v8 = self;
        v33[0] = 0;
        id v9 = v7;
        id v10 = [v8 modelWithMLModel:v9 error:v33];
        id v11 = v33[0];
        if (v10)
        {

          swift_beginAccess();
          uint64_t v12 = *(void **)(v1 + 24);
          *(void *)(v1 + 24) = v10;
          id v13 = v10;

          if (one-time initialization token for logger != -1) {
            swift_once();
          }
          uint64_t v14 = type metadata accessor for Logger();
          __swift_project_value_buffer(v14, (uint64_t)logger);
          uint64_t v15 = Logger.logObject.getter();
          os_log_type_t v16 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v15, v16))
          {
            uint64_t v17 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v17 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "smsfilter: mainmodel initialized.", v17, 2u);
            swift_slowDealloc();
          }

          [v6 loadPromotionalThreshold];
          uint64_t v19 = v18;
          BOOL v20 = (void *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
          swift_beginAccess();
          *BOOL v20 = v19;
          [v6 loadTransactionalThreshold];
          uint64_t v22 = v21;

          uint64_t v23 = (void *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold);
          swift_beginAccess();
          *uint64_t v23 = v22;
        }
        else
        {
          uint64_t v24 = v11;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          if (one-time initialization token for logger != -1) {
            swift_once();
          }
          uint64_t v25 = type metadata accessor for Logger();
          __swift_project_value_buffer(v25, (uint64_t)logger);
          char v26 = Logger.logObject.getter();
          os_log_type_t v27 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v26, v27))
          {
            v28 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v28 = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, v27, "smsfilter error: trial _mainModel creation failed; missing linguistic-data?",
              v28,
              2u);
            swift_slowDealloc();
          }
          swift_errorRelease();
        }
      }
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v29 = type metadata accessor for Logger();
      __swift_project_value_buffer(v29, (uint64_t)logger);
      swift_retain_n();
      char v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = 134218240;
        swift_beginAccess();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        *(_WORD *)(v32 + 12) = 2048;
        swift_beginAccess();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "smsfilter thresholds: promo: %f, trans : %f", (uint8_t *)v32, 0x16u);
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
        id v6 = v7;
      }
    }
  }
}

void SmsFilter.loadFallbackModel()()
{
  uint64_t v1 = v0;
  swift_beginAccess();
  if (*(void *)(v0 + 24)) {
    return;
  }
  uint64_t v2 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v2, (uint64_t)v27, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v27, (uint64_t)v28, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v28) == 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if ((*(unsigned char *)(v2 + 88) & 1) == 0) {
    return;
  }
  outlined init with take of Region?(v2, (uint64_t)v25, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v25, (uint64_t)v26, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v26) == 1)
  {
LABEL_24:
    __break(1u);
    return;
  }
  if (*(unsigned char *)(v2 + 17))
  {
    uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess();
    if (*v3)
    {
      id v4 = *v3;
      id v5 = [v4 getBasicModel];
      if (!v5)
      {
LABEL_13:

        return;
      }
      id v6 = v5;
      id v7 = self;
      v24[0] = 0;
      id v8 = v6;
      id v9 = [v7 modelWithMLModel:v8 error:v24];
      id v10 = v24[0];
      if (v9)
      {

        swift_beginAccess();
        id v11 = *(void **)(v1 + 16);
        *(void *)(v1 + 16) = v9;
        id v12 = v9;

        id v13 = [v4 loadTransitionTimer];
        uint64_t v14 = (void *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel);
        swift_beginAccess();
        *uint64_t v14 = v13;
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v15 = type metadata accessor for Logger();
        __swift_project_value_buffer(v15, (uint64_t)logger);
        swift_retain();
        os_log_type_t v16 = Logger.logObject.getter();
        os_log_type_t v17 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v18 = 134217984;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "smsfilter: fallbasck to basic model, transitionTimer : %ld minutes", v18, 0xCu);
          swift_slowDealloc();

          goto LABEL_13;
        }

        swift_release();
      }
      else
      {
        uint64_t v19 = v10;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v20 = type metadata accessor for Logger();
        __swift_project_value_buffer(v20, (uint64_t)logger);
        uint64_t v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "smsfilter: basic-model creation failed", v23, 2u);
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {

          swift_errorRelease();
        }
      }
    }
  }
  else
  {
    SmsFilter.loadDefaultBasicModel()();
  }
}

void SmsFilter.loadTrialSubClassificationModel()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v1, (uint64_t)v24, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v24, (uint64_t)v25, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v25) == 1) {
    __break(1u);
  }
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    outlined init with take of Region?(v1, (uint64_t)v22, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v22, (uint64_t)v23, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v23) == 1)
    {
      __break(1u);
    }
    else if (*(unsigned char *)(v1 + 88))
    {
      uint64_t v2 = (id *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
      swift_beginAccess();
      if (*v2)
      {
        id v3 = *v2;
        id v4 = [v3 getSubClassificationModel];
        if (!v4)
        {
LABEL_12:

          return;
        }
        id v5 = v4;
        id v6 = self;
        v21[0] = 0;
        id v7 = v5;
        id v8 = [v6 modelWithMLModel:v7 error:v21];
        id v9 = v21[0];
        if (v8)
        {

          swift_beginAccess();
          id v10 = *(void **)(v0 + 32);
          *(void *)(v0 + 32) = v8;
          id v11 = v8;

          if (one-time initialization token for logger != -1) {
            swift_once();
          }
          uint64_t v12 = type metadata accessor for Logger();
          __swift_project_value_buffer(v12, (uint64_t)logger);
          id v13 = Logger.logObject.getter();
          os_log_type_t v14 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v15 = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, v14, "smsfilter: sub-classification initialized.", v15, 2u);
            swift_slowDealloc();

            goto LABEL_12;
          }
        }
        else
        {
          os_log_type_t v16 = v9;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          if (one-time initialization token for logger != -1) {
            swift_once();
          }
          uint64_t v17 = type metadata accessor for Logger();
          __swift_project_value_buffer(v17, (uint64_t)logger);
          uint64_t v18 = Logger.logObject.getter();
          os_log_type_t v19 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "smsfilter error: trial sub-classification model creation failed; missing linguistic-data?",
              v20,
              2u);
            swift_slowDealloc();

            swift_errorRelease();
          }
          else
          {

            swift_errorRelease();
          }
        }
      }
    }
  }
}

void SmsFilter.loadRegexFromTrial()()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v1, (uint64_t)v52, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v52, (uint64_t)v53, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v53) == 1) {
    goto LABEL_56;
  }
  if ((*(unsigned char *)(v1 + 88) & 1) == 0)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)logger);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_17;
    }
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v14 = 0;
    uint64_t v15 = "smsfilter: oops trial is not supported";
    goto LABEL_16;
  }
  uint64_t v2 = (id *)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess();
  if (!*v2)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)logger);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_17;
    }
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v14 = 0;
    uint64_t v15 = "smsfilter: trial manager is not valid";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v15, v14, 2u);
    swift_slowDealloc();
LABEL_17:

    return;
  }
  id v46 = *v2;
  id v3 = [v46 getRegexFilePath];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  unint64_t v47 = v0;
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    v49[0] = swift_slowAlloc();
    *(_DWORD *)id v10 = 136315138;
    swift_bridgeObjectRetain();
    v48[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v6, v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "smsfilter: loading regex from %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  type metadata accessor for RegexMessageReader();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 32) = 0u;
  *(void *)(inited + 48) = 0;
  *(_OWORD *)(inited + 16) = 0u;
  specialized RegexMessageReader.processRegexMessages(filePath:)((uint64_t)v50);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(inited + 16);
  outlined init with take of Region?((uint64_t)v50, inited + 16, &demangling cache variable for type metadata for Regex?);
  outlined consume of Regex?(v18);
  outlined init with take of Region?((uint64_t)v50, (uint64_t)v51, &demangling cache variable for type metadata for Regex?);
  if (v51[0])
  {
    v19._rawValue = *(void **)(inited + 16);
    if (!v19._rawValue) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "smsfiltter: no valid regex found", v22, 2u);
      swift_slowDealloc();
    }

    v19._rawValue = *(void **)(inited + 16);
    if (!v19._rawValue) {
      goto LABEL_29;
    }
  }
  v23._rawValue = *(void **)(inited + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  if (!v47[6])
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  swift_retain();
  RegexFilter.initRegexTemplates(initTemplateList:)(v19);
  swift_release();
  swift_bridgeObjectRelease();
  if (v23._rawValue)
  {
    swift_beginAccess();
    if (!v47[7])
    {
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    swift_retain();
    RegexFilter.initRegexTemplates(initTemplateList:)(v23);
    swift_release();
    swift_bridgeObjectRelease();
  }
LABEL_29:
  outlined init with take of Region?(v1, (uint64_t)v48, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v48, (uint64_t)v49, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v49) == 1)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (*(unsigned char *)(v1 + 104) != 1
    || (unint64_t v24 = (unint64_t)RegexMessageReader.getRegexMessagesForSubClassification()()) == 0)
  {

    goto LABEL_49;
  }
  unint64_t v25 = v24;
  char v26 = v47 + 8;
  swift_beginAccess();
  uint64_t v27 = v47[8];
  if (!v27) {
    goto LABEL_60;
  }
  if (v27 == 1)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  uint64_t v28 = one-time initialization token for kFinance;
  swift_retain();
  if (v28 == -1)
  {
    if (*(void *)(v25 + 16)) {
      goto LABEL_36;
    }
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  swift_once();
  if (!*(void *)(v25 + 16)) {
    goto LABEL_51;
  }
LABEL_36:
  uint64_t v29 = qword_10002ACA8;
  uint64_t v30 = static SmsFilter.SubClasses.kFinance;
  swift_bridgeObjectRetain();
  unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(v30, v29);
  if ((v32 & 1) == 0)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_63;
  }
  v33._rawValue = *(void **)(*(void *)(v25 + 56) + 8 * v31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  RegexFilter.initRegexTemplates(initTemplateList:)(v33);
  swift_bridgeObjectRelease();
  swift_release();
  if (*v26 == 1)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (!v47[10])
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  uint64_t v34 = one-time initialization token for kOrders;
  swift_retain();
  if (v34 == -1)
  {
    if (*(void *)(v25 + 16)) {
      goto LABEL_41;
    }
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
LABEL_52:
  swift_once();
  if (!*(void *)(v25 + 16)) {
    goto LABEL_53;
  }
LABEL_41:
  uint64_t v35 = qword_10002ACB8;
  uint64_t v36 = static SmsFilter.SubClasses.kOrders;
  swift_bridgeObjectRetain();
  unint64_t v37 = specialized __RawDictionaryStorage.find<A>(_:)(v36, v35);
  if ((v38 & 1) == 0)
  {
LABEL_65:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_66;
  }
  v39._rawValue = *(void **)(*(void *)(v25 + 56) + 8 * v37);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  RegexFilter.initRegexTemplates(initTemplateList:)(v39);
  swift_bridgeObjectRelease();
  swift_release();
  if (*v26 == 1)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (!v47[9])
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v40 = one-time initialization token for kReminders;
  swift_retain();
  if (v40 == -1)
  {
    if (*(void *)(v25 + 16)) {
      goto LABEL_46;
    }
    goto LABEL_55;
  }
LABEL_54:
  swift_once();
  if (!*(void *)(v25 + 16))
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
LABEL_46:
  uint64_t v41 = qword_10002ACC8;
  uint64_t v42 = static SmsFilter.SubClasses.kReminders;
  swift_bridgeObjectRetain();
  unint64_t v43 = specialized __RawDictionaryStorage.find<A>(_:)(v42, v41);
  if (v44)
  {
    v45._rawValue = *(void **)(*(void *)(v25 + 56) + 8 * v43);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    RegexFilter.initRegexTemplates(initTemplateList:)(v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_release();
LABEL_49:
    swift_release();
    return;
  }
LABEL_68:
  swift_bridgeObjectRelease();
  __break(1u);
}

Swift::Void __swiftcall SmsFilter.update()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 208;
  unint64_t v5 = (BOOL *)(v0 + 41);
  swift_beginAccess();
  if (*(unsigned char *)(v0 + 41) == 1 && (SmsFilter.retryTransitionTimerForMainModelExpired()() & 1) != 0)
  {
    swift_beginAccess();
    *(unsigned char *)(v0 + 40) = 0;
  }
  uint64_t v6 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v6, (uint64_t)v22, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v22, (uint64_t)v23, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v23) == 1)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (*(unsigned char *)(v6 + 88) != 1) {
    goto LABEL_10;
  }
  uint64_t v7 = (id *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess();
  if (!*v7)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if ([*v7 updateAvailable])
  {
    swift_beginAccess();
    *(unsigned char *)(v1 + 40) = 0;
    swift_beginAccess();
    id v8 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = 0;

    swift_beginAccess();
    os_log_type_t v9 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    swift_beginAccess();
    id v10 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = 0;

    if (!*v7)
    {
LABEL_28:
      __break(1u);
      return;
    }
    [*v7 prepareForTrialParamsUpdate];
  }
LABEL_10:
  uint64_t v11 = (uint64_t *)(v1 + 24);
  swift_beginAccess();
  if (!*(void *)(v1 + 24))
  {
    swift_beginAccess();
    if (!*(void *)(v1 + 16))
    {
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      __swift_project_value_buffer(v12, (uint64_t)logger);
      os_log_type_t v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "smsfilter: both models are nil, try loading them again...", v15, 2u);
        swift_slowDealloc();
      }

      swift_beginAccess();
      *(unsigned char *)(v1 + 40) = 0;
    }
  }
  swift_beginAccess();
  if ((*(unsigned char *)(v1 + 40) & 1) == 0)
  {
    outlined init with take of Region?(v6, (uint64_t)v20, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v20, (uint64_t)v21, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v21) != 1)
    {
      if (*(unsigned char *)(v6 + 88) == 1)
      {
        SmsFilter.loadTrialMainModelWithThresholds()();
        SmsFilter.loadFallbackModel()();
        SmsFilter.loadTrialSubClassificationModel()();
        SmsFilter.loadRegexFromTrial()();
      }
      uint64_t v16 = *v11;
      *unint64_t v5 = *v11 == 0;
      if (!v16)
      {
        Date.init()();
        uint64_t v17 = type metadata accessor for Date();
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 0, 1, v17);
        uint64_t v18 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
        swift_beginAccess();
        outlined assign with take of Date?((uint64_t)v4, v18);
        swift_endAccess();
      }
      *(unsigned char *)(v1 + 40) = 1;
      return;
    }
    goto LABEL_27;
  }
}

uint64_t SmsFilter.retryTransitionTimerForMainModelExpired()()
{
  uint64_t v1 = type metadata accessor for DateComponents();
  uint64_t v33 = *(void *)(v1 - 8);
  uint64_t v34 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Calendar();
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v30 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  uint64_t v35 = v0;
  uint64_t v16 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  swift_beginAccess();
  uint64_t v29 = v16;
  outlined init with copy of Date?(v16, (uint64_t)v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_8;
  }
  static Calendar.current.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Calendar.Component>);
  uint64_t v18 = type metadata accessor for Calendar.Component();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10001DD50;
  (*(void (**)(unint64_t, void, uint64_t))(v19 + 104))(v21 + v20, enum case for Calendar.Component.second(_:), v18);
  specialized Set.init(_nonEmptyArrayLiteral:)(v21);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  uint64_t result = DateComponents.second.getter();
  if (v22)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v23 = result / 60;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v3, v34);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v32);
  unint64_t v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  v24(v11, v12);
  unint64_t v25 = (uint64_t *)(v35 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel);
  swift_beginAccess();
  uint64_t v26 = *v25;
  if (v23 < v26)
  {
    v24(v15, v12);
  }
  else
  {
    uint64_t v27 = (uint64_t)v30;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v30, v15, v12);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v27, 0, 1, v12);
    uint64_t v28 = v29;
    swift_beginAccess();
    outlined assign with take of Date?(v27, v28);
    swift_endAccess();
  }
  return v23 >= v26;
}

Swift::Bool __swiftcall SmsFilter.trialBasicModelAvailable()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v1, (uint64_t)v4, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v4, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  int v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v5);
  if (v2 == 1) {
    __break(1u);
  }
  else {
    LOBYTE(v2) = *(unsigned char *)(v1 + 17);
  }
  return v2;
}

Swift::Bool __swiftcall SmsFilter.subClassificationModelAvailable()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v1, (uint64_t)v4, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v4, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  int v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v5);
  if (v2 == 1) {
    __break(1u);
  }
  else {
    LOBYTE(v2) = *(unsigned char *)(v1 + 104);
  }
  return v2;
}

uint64_t SmsFilter.getSubActionRegexListPredictionForMessage(messageBody:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (void *)(v2 + 64);
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 64);
  if (!v8)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 == 1)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_retain();
  v9._uint64_t countAndFlagsBits = a1;
  v9._unint64_t object = a2;
  Swift::Bool v10 = RegexFilter.isMessageInRegexList(message:)(v9);
  uint64_t result = swift_release();
  if (v10) {
    return 10001;
  }
  if (*v6 == 1) {
    goto LABEL_17;
  }
  if (!*(void *)(v3 + 72))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_retain();
  v11._uint64_t countAndFlagsBits = a1;
  v11._unint64_t object = a2;
  Swift::Bool v12 = RegexFilter.isMessageInRegexList(message:)(v11);
  uint64_t result = swift_release();
  if (v12) {
    return 10003;
  }
  if (*v6 == 1) {
    goto LABEL_19;
  }
  if (!*(void *)(v3 + 80))
  {
LABEL_20:
    __break(1u);
    return result;
  }
  swift_retain();
  v13._uint64_t countAndFlagsBits = a1;
  v13._unint64_t object = a2;
  Swift::Bool v14 = RegexFilter.isMessageInRegexList(message:)(v13);
  swift_release();
  if (v14) {
    return 10002;
  }
  else {
    return 0;
  }
}

Swift::UInt SmsFilter.classifyAction(sender:messageBody:)(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)logger);
  Swift::String v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    Swift::String v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "smsfilter: classifyAction", v13, 2u);
    swift_slowDealloc();
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(ILMessageFilterAction, String)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DB50;
  *(_OWORD *)(inited + 32) = xmmword_10001DDB0;
  *(void *)(inited + 48) = 0xE400000000000000;
  *(_OWORD *)(inited + 56) = xmmword_10001DDC0;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(_OWORD *)(inited + 80) = xmmword_10001DDD0;
  *(void *)(inited + 96) = 0xE400000000000000;
  *(_OWORD *)(inited + 104) = xmmword_10001DDE0;
  *(void *)(inited + 120) = 0xEB000000006C616ELL;
  *(_OWORD *)(inited + 128) = xmmword_10001DDF0;
  *(void *)(inited + 144) = 0xED00006C616E6F69;
  unint64_t v15 = specialized Dictionary.init(dictionaryLiteral:)((void *)inited, &demangling cache variable for type metadata for _DictionaryStorage<ILMessageFilterAction, String>);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ILMessageFilterAction, String));
  swift_arrayDestroy();
  Swift::UInt v43 = 1;
  uint64_t v16 = (void *)(v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  Swift::UInt result = swift_beginAccess();
  if (!*v16)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  swift_retain();
  v18._uint64_t countAndFlagsBits = a1;
  v18._unint64_t object = a2;
  Swift::Bool v19 = RegionUtils.shouldApplyFilter(sender:)(v18);
  swift_release();
  if (v19)
  {
    Swift::UInt result = swift_beginAccess();
    if (!*(void *)(v5 + 48))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    swift_retain();
    v20._uint64_t countAndFlagsBits = a3;
    v20._unint64_t object = a4;
    Swift::Bool v21 = RegexFilter.isMessageInRegexList(message:)(v20);
    swift_release();
    if (v21)
    {
      Swift::UInt v43 = 3;
LABEL_17:
      swift_bridgeObjectRetain();
      uint64_t v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v28, v29))
      {

        swift_bridgeObjectRelease_n();
LABEL_22:
        swift_beginAccess();
        Swift::UInt result = v43;
        if (v43 != 4) {
          return result;
        }
        uint64_t v34 = v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
        swift_beginAccess();
        outlined init with take of Region?(v34, (uint64_t)v41, &demangling cache variable for type metadata for Region?);
        outlined init with take of Region?((uint64_t)v41, (uint64_t)v42, &demangling cache variable for type metadata for Region?);
        Swift::UInt result = _s15extensionFilter6RegionVSgWOg((uint64_t)v42);
        if (result != 1)
        {
LABEL_24:
          if (*(unsigned char *)(v34 + 104) == 1) {
            SmsFilter.subClassifyAction(messageBody:)(a3, a4);
          }
          return 4;
        }
        goto LABEL_41;
      }
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138543362;
      Swift::UInt result = swift_beginAccess();
      if (*(void *)(v15 + 16))
      {
        Swift::UInt result = specialized __RawDictionaryStorage.find<A>(_:)(v43);
        if (v32)
        {
          swift_bridgeObjectRetain();
          NSString v33 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          v42[0] = v33;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *uint64_t v31 = v33;
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "smsfilter: regexfilter label: %{public}@", v30, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          goto LABEL_22;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_38;
    }
    Swift::UInt result = swift_beginAccess();
    if (!*(void *)(v5 + 56))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    swift_retain();
    v25._uint64_t countAndFlagsBits = a3;
    v25._unint64_t object = a4;
    Swift::Bool v26 = RegexFilter.isMessageInRegexList(message:)(v25);
    Swift::UInt result = swift_release();
    Swift::UInt v27 = 4;
    if (!v26) {
      Swift::UInt v27 = 1;
    }
    Swift::UInt v43 = v27;
    if (v27 - 3 <= 1) {
      goto LABEL_17;
    }
    if (!*v16)
    {
LABEL_42:
      __break(1u);
      return result;
    }
    swift_retain();
    v35._uint64_t countAndFlagsBits = a3;
    v35._unint64_t object = a4;
    Swift::Bool v36 = RegionUtils.dominantLanguageMatch(message:)(v35);
    swift_release();
    if (v36)
    {
      specialized closure #1 in SmsFilter.classifyAction(sender:messageBody:)((char *)v5, a3, (uint64_t)a4, (uint64_t *)&v43, v15);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      Swift::UInt result = v43;
      if (v43 != 4) {
        return result;
      }
      uint64_t v34 = v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
      swift_beginAccess();
      outlined init with take of Region?(v34, (uint64_t)v41, &demangling cache variable for type metadata for Region?);
      outlined init with take of Region?((uint64_t)v41, (uint64_t)v42, &demangling cache variable for type metadata for Region?);
      Swift::UInt result = _s15extensionFilter6RegionVSgWOg((uint64_t)v42);
      if (result == 1)
      {
        __break(1u);
        return result;
      }
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    Swift::UInt v43 = 4;
    char v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "smsfilter: message  doesn't have a dominant language, so label: Transactional", v40, 2u);
      swift_slowDealloc();
    }

    return v43;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "smsfilter: do not apply the smsfilter", v24, 2u);
      swift_slowDealloc();
    }

    return 1;
  }
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    Swift::String v11 = (uint64_t *)(v2[6] + 16 * result);
    *Swift::String v11 = v5;
    v11[1] = v6;
    os_log_type_t v12 = (void *)(v2[7] + 16 * result);
    *os_log_type_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Swift::UInt SmsFilter.subClassifyAction(messageBody:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)logger);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    Swift::String v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "smsfilter: sub-classifyAction", v9, 2u);
    swift_slowDealloc();
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(ILMessageFilterSubAction, String)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DE00;
  *(_OWORD *)(inited + 32) = xmmword_10001DE10;
  *(void *)(inited + 48) = 0xE600000000000000;
  *(_OWORD *)(inited + 56) = xmmword_10001DE20;
  *(void *)(inited + 72) = 0xE700000000000000;
  *(_OWORD *)(inited + 80) = xmmword_10001DE30;
  *(void *)(inited + 96) = 0xE600000000000000;
  *(_OWORD *)(inited + 104) = xmmword_10001DE40;
  *(void *)(inited + 120) = 0xE900000000000073;
  unint64_t v11 = specialized Dictionary.init(dictionaryLiteral:)((void *)inited, &demangling cache variable for type metadata for _DictionaryStorage<ILMessageFilterSubAction, String>);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ILMessageFilterSubAction, String));
  swift_arrayDestroy();
  Swift::UInt v20 = SmsFilter.getSubActionRegexListPredictionForMessage(messageBody:)(a1, a2);
  if (!v20)
  {
    specialized closure #1 in SmsFilter.subClassifyAction(messageBody:)(v3, a1, (uint64_t)a2, (uint64_t *)&v20, v11);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  os_log_type_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v12, v13))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  BOOL v14 = (uint8_t *)swift_slowAlloc();
  uint64_t v15 = (void *)swift_slowAlloc();
  *(_DWORD *)BOOL v14 = 138543362;
  Swift::UInt result = swift_beginAccess();
  if (*(void *)(v11 + 16))
  {
    Swift::UInt result = specialized __RawDictionaryStorage.find<A>(_:)(v20);
    if (v17)
    {
      swift_bridgeObjectRetain();
      NSString v18 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v15 = v18;
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "smsfilter: regexfilter label: %{public}@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_12:
      swift_beginAccess();
      return v20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void specialized closure #1 in SmsFilter.classifyAction(sender:messageBody:)(char *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  v95 = a4;
  uint64_t v91 = a3;
  uint64_t v8 = type metadata accessor for Logger();
  int64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v12 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  BOOL v14 = (char *)&v86 - v13;
  uint64_t v104 = 0;
  swift_beginAccess();
  uint64_t v15 = (void *)*((void *)a1 + 3);
  v96 = a1;
  if (!v15)
  {
    uint64_t v89 = v12;
    swift_beginAccess();
    os_log_type_t v39 = (void *)*((void *)a1 + 2);
    if (!v39)
    {
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v8, (uint64_t)logger);
      uint64_t v67 = Logger.logObject.getter();
      os_log_type_t v68 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v69 = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "smsfilter: no active smsfilter", v69, 2u);
        swift_slowDealloc();
      }

      return;
    }
    v93 = (void *)v8;
    uint64_t v94 = a5;
    int64_t v92 = v9;
    uint64_t v90 = v5;
    id v18 = v39;
    uint64_t v40 = NLModel.predictedLabelHypotheses(for:maximumCount:)();

    uint64_t v41 = v40 + 64;
    uint64_t v42 = 1 << *(unsigned char *)(v40 + 32);
    uint64_t v43 = -1;
    if (v42 < 64) {
      uint64_t v43 = ~(-1 << v42);
    }
    unint64_t v44 = v43 & *(void *)(v40 + 64);
    int64_t v23 = (unint64_t)(v42 + 63) >> 6;
    swift_bridgeObjectRetain();
    unint64_t j = 0;
    int64_t v24 = 0;
    for (unint64_t i = 0xE000000000000000; ; unint64_t i = (unint64_t)v18)
    {
      if (v44)
      {
        unint64_t v46 = __clz(__rbit64(v44));
        v44 &= v44 - 1;
        unint64_t v47 = v46 | (v24 << 6);
      }
      else
      {
        int64_t v50 = v24 + 1;
        if (__OFADD__(v24, 1))
        {
LABEL_96:
          __break(1u);
LABEL_97:
          __break(1u);
          goto LABEL_98;
        }
        if (v50 >= v23) {
          goto LABEL_71;
        }
        unint64_t v51 = *(void *)(v41 + 8 * v50);
        ++v24;
        if (!v51)
        {
          int64_t v24 = v50 + 1;
          if (v50 + 1 >= v23) {
            goto LABEL_71;
          }
          unint64_t v51 = *(void *)(v41 + 8 * v24);
          if (!v51)
          {
            int64_t v24 = v50 + 2;
            if (v50 + 2 >= v23) {
              goto LABEL_71;
            }
            unint64_t v51 = *(void *)(v41 + 8 * v24);
            if (!v51)
            {
              int64_t v52 = v50 + 3;
              if (v52 >= v23)
              {
LABEL_71:
                swift_release();
                if (j == 0x6F69746F6D6F7250 && i == 0xEB000000006C616ELL)
                {
                  swift_bridgeObjectRelease();
                  int64_t v23 = v92;
                  uint64_t v58 = (uint64_t)v93;
                  uint64_t v59 = v89;
                  goto LABEL_81;
                }
                char v70 = _stringCompareWithSmolCheck(_:_:expecting:)();
                int64_t v23 = v92;
                uint64_t v59 = v89;
                if (v70)
                {
                  swift_bridgeObjectRelease();
                  uint64_t v58 = (uint64_t)v93;
LABEL_81:
                  uint64_t v71 = 3;
LABEL_87:
                  os_log_type_t v73 = v95;
                  swift_beginAccess();
                  *os_log_type_t v73 = v71;
LABEL_88:
                  if (one-time initialization token for logger != -1) {
                    goto LABEL_102;
                  }
                  goto LABEL_89;
                }
                uint64_t v58 = (uint64_t)v93;
                if (j == 0x746361736E617254 && i == 0xED00006C616E6F69)
                {
                  swift_bridgeObjectRelease();
                }
                else
                {
                  char v72 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  swift_bridgeObjectRelease();
                  if ((v72 & 1) == 0) {
                    goto LABEL_88;
                  }
                }
                uint64_t v71 = 4;
                goto LABEL_87;
              }
              unint64_t v51 = *(void *)(v41 + 8 * v52);
              if (!v51)
              {
                while (1)
                {
                  int64_t v24 = v52 + 1;
                  if (__OFADD__(v52, 1)) {
                    break;
                  }
                  if (v24 >= v23) {
                    goto LABEL_71;
                  }
                  unint64_t v51 = *(void *)(v41 + 8 * v24);
                  ++v52;
                  if (v51) {
                    goto LABEL_55;
                  }
                }
LABEL_98:
                __break(1u);
LABEL_99:
                swift_once();
                goto LABEL_64;
              }
              int64_t v24 = v52;
            }
          }
        }
LABEL_55:
        unint64_t v44 = (v51 - 1) & v51;
        unint64_t v47 = __clz(__rbit64(v51)) + (v24 << 6);
      }
      uint64_t v48 = (unint64_t *)(*(void *)(v40 + 48) + 16 * v47);
      unint64_t j = *v48;
      id v18 = (id)v48[1];
      uint64_t v49 = *(void *)(*(void *)(v40 + 56) + 8 * v47);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v104 = v49;
    }
  }
  uint64_t v89 = v14;
  uint64_t v90 = v5;
  v93 = (void *)v8;
  uint64_t v94 = a5;
  int64_t v92 = v9;
  id v16 = v15;
  uint64_t v17 = NLModel.predictedLabelHypotheses(for:maximumCount:)();

  id v18 = (id)(v17 + 64);
  uint64_t v19 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & *(void *)(v17 + 64);
  int64_t v22 = (unint64_t)(v19 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v23 = 0;
  int64_t v24 = 0;
  double v25 = 0.0;
  for (unint64_t j = 0xE000000000000000; ; unint64_t j = v30)
  {
    if (v21)
    {
      unint64_t v27 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      unint64_t v28 = v27 | (v24 << 6);
      goto LABEL_6;
    }
    int64_t v31 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_96;
    }
    if (v31 >= v22) {
      break;
    }
    unint64_t v32 = *((void *)v18 + v31);
    ++v24;
    if (!v32)
    {
      int64_t v24 = v31 + 1;
      if (v31 + 1 >= v22) {
        break;
      }
      unint64_t v32 = *((void *)v18 + v24);
      if (!v32)
      {
        int64_t v24 = v31 + 2;
        if (v31 + 2 >= v22) {
          break;
        }
        unint64_t v32 = *((void *)v18 + v24);
        if (!v32)
        {
          int64_t v33 = v31 + 3;
          if (v33 >= v22) {
            break;
          }
          unint64_t v32 = *((void *)v18 + v33);
          if (!v32)
          {
            while (1)
            {
              int64_t v24 = v33 + 1;
              if (__OFADD__(v33, 1)) {
                goto LABEL_97;
              }
              if (v24 >= v22) {
                goto LABEL_22;
              }
              unint64_t v32 = *((void *)v18 + v24);
              ++v33;
              if (v32) {
                goto LABEL_21;
              }
            }
          }
          int64_t v24 = v33;
        }
      }
    }
LABEL_21:
    unint64_t v21 = (v32 - 1) & v32;
    unint64_t v28 = __clz(__rbit64(v32)) + (v24 << 6);
LABEL_6:
    os_log_type_t v29 = (int64_t *)(*(void *)(v17 + 48) + 16 * v28);
    int64_t v23 = *v29;
    unint64_t v30 = v29[1];
    double v25 = *(double *)(*(void *)(v17 + 56) + 8 * v28);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v104 = *(void *)&v25;
  }
LABEL_22:
  swift_release();
  BOOL v34 = v23 == 0x6F69746F6D6F7250 && j == 0xEB000000006C616ELL;
  int v35 = v34;
  int64_t v24 = v92;
  if (!v34 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
LABEL_32:
    if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
      goto LABEL_33;
    }
    goto LABEL_56;
  }
  Swift::Bool v36 = (double *)&v96[OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold];
  swift_beginAccess();
  if (*v36 <= v25)
  {
    uint64_t v38 = 3;
LABEL_61:
    id v18 = v93;
LABEL_62:
    char v53 = v95;
    swift_beginAccess();
    *char v53 = v38;
  }
  else
  {
    if (!v35) {
      goto LABEL_32;
    }
LABEL_33:
    unint64_t v37 = (double *)&v96[OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold];
    swift_beginAccess();
    if (v25 < *v37)
    {
      uint64_t v38 = 4;
      goto LABEL_61;
    }
LABEL_56:
    id v18 = v93;
    if (v23 == 0x746361736E617254 && j == 0xED00006C616E6F69
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      uint64_t v38 = 4;
      goto LABEL_62;
    }
  }
  if (one-time initialization token for logger != -1) {
    goto LABEL_99;
  }
LABEL_64:
  uint64_t v54 = __swift_project_value_buffer((uint64_t)v18, (uint64_t)logger);
  uint64_t v55 = v89;
  (*(void (**)(char *, uint64_t, id))(v24 + 16))(v89, v54, v18);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  int64_t v56 = v24;
  uint64_t v57 = Logger.logObject.getter();
  LODWORD(v91) = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v57, (os_log_type_t)v91))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, id))(v56 + 8))(v55, v18);
    goto LABEL_70;
  }
  os_log_t v88 = v57;
  uint64_t v58 = swift_slowAlloc();
  uint64_t v86 = (void *)swift_slowAlloc();
  uint64_t v87 = swift_slowAlloc();
  v99[0] = v87;
  *(_DWORD *)uint64_t v58 = 136315906;
  uint64_t v59 = v96;
  v60 = (uint64_t *)&v96[OBJC_IVAR____TtC15extensionFilter9SmsFilter__region];
  swift_beginAccess();
  outlined init with take of Region?((uint64_t)v60, (uint64_t)v102, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v102, (uint64_t)v103, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v103) == 1) {
    goto LABEL_105;
  }
  uint64_t v62 = *v60;
  unint64_t v61 = v60[1];
  swift_bridgeObjectRetain();
  uint64_t v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v62, v61, v99);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v58 + 12) = 2082;
  swift_bridgeObjectRetain();
  uint64_t v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, j, v99);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v58 + 22) = 2048;
  swift_beginAccess();
  uint64_t v100 = v104;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v58 + 32) = 2114;
  v63 = (Swift::UInt *)v95;
  swift_beginAccess();
  if (*(void *)(v94 + 16))
  {
    specialized __RawDictionaryStorage.find<A>(_:)(*v63);
    if (v64)
    {
      swift_bridgeObjectRetain();
      NSString v65 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      v98[3] = (uint64_t)v65;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v86 = v65;
      swift_bridgeObjectRelease_n();
      os_log_t v66 = v88;
      _os_log_impl((void *)&_mh_execute_header, v88, (os_log_type_t)v91, "[%s] smsfilter: mainmodel: (%{public}s, %f, %{public}@)", (uint8_t *)v58, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, void *))(v92 + 8))(v89, v93);
      goto LABEL_70;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_102:
  swift_once();
LABEL_89:
  uint64_t v74 = __swift_project_value_buffer(v58, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v59, v74, v58);
  v75 = v96;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v76 = v59;
  uint64_t v77 = Logger.logObject.getter();
  os_log_type_t v78 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v79 = swift_slowAlloc();
    os_log_t v88 = (os_log_t)swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    v98[0] = v91;
    *(_DWORD *)uint64_t v79 = 136315394;
    unint64_t v80 = (uint64_t *)&v75[OBJC_IVAR____TtC15extensionFilter9SmsFilter__region];
    swift_beginAccess();
    outlined init with take of Region?((uint64_t)v80, (uint64_t)v102, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v102, (uint64_t)v103, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v103) != 1)
    {
      uint64_t v82 = *v80;
      unint64_t v81 = v80[1];
      swift_bridgeObjectRetain();
      uint64_t v100 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v81, v98);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v79 + 12) = 2114;
      uint64_t v83 = (Swift::UInt *)v95;
      swift_beginAccess();
      if (*(void *)(v94 + 16))
      {
        specialized __RawDictionaryStorage.find<A>(_:)(*v83);
        if (v84)
        {
          swift_bridgeObjectRetain();
          uint64_t v85 = (objc_class *)String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          v97 = v85;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          v88->isa = v85;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v77, v78, "[%s] smsfilter: basicmodel: (%{public}@)", (uint8_t *)v79, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, void *))(v92 + 8))(v89, v93);
          goto LABEL_70;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
LABEL_105:
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __break(1u);
    }
    swift_release();
    swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v76, v58);
LABEL_70:
    swift_bridgeObjectRelease();
  }
}

Swift::String __swiftcall SmsFilter.getRegion()()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
  swift_beginAccess();
  outlined init with take of Region?((uint64_t)v1, (uint64_t)v7, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v7, (uint64_t)v8, &demangling cache variable for type metadata for Region?);
  uint64_t v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v8);
  if (v2 == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = *v1;
    uint64_t v4 = (void *)v1[1];
    swift_bridgeObjectRetain();
    uint64_t v2 = v5;
    uint64_t v3 = v4;
  }
  result._unint64_t object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t specialized closure #1 in SmsFilter.subClassifyAction(messageBody:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  v63 = a4;
  uint64_t v8 = type metadata accessor for Logger();
  unint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v62 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v54 - v12;
  swift_beginAccess();
  BOOL v14 = *(void **)(a1 + 32);
  if (v14)
  {
    uint64_t v58 = a1;
    uint64_t v59 = a5;
    uint64_t v60 = v5;
    unint64_t v61 = v9;
    uint64_t v64 = v8;
    id v15 = v14;
    uint64_t v16 = NLModel.predictedLabelHypotheses(for:maximumCount:)();

    uint64_t v17 = (char *)(v16 + 64);
    uint64_t v18 = 1 << *(unsigned char *)(v16 + 32);
    uint64_t v19 = -1;
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    unint64_t v20 = v19 & *(void *)(v16 + 64);
    int64_t v21 = (unint64_t)(v18 + 63) >> 6;
    swift_bridgeObjectRetain();
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    double v24 = 0.0;
    for (unint64_t i = 0xE000000000000000; ; unint64_t i = v29)
    {
      if (v20)
      {
        unint64_t v26 = __clz(__rbit64(v20));
        v20 &= v20 - 1;
        unint64_t v27 = v26 | (v23 << 6);
      }
      else
      {
        int64_t v30 = v23 + 1;
        if (__OFADD__(v23, 1))
        {
          __break(1u);
          goto LABEL_51;
        }
        if (v30 >= v21)
        {
LABEL_22:
          swift_release();
          if (v24 < 0.6)
          {
            uint64_t v33 = 0;
            uint64_t v23 = v64;
            unint64_t v20 = v61;
            uint64_t v17 = v62;
            goto LABEL_33;
          }
          uint64_t v23 = v64;
          unint64_t v20 = v61;
          uint64_t v17 = v62;
          if (v22 == 0x7265646E696D6552 && i == 0xE900000000000073
            || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t v33 = 10003;
            goto LABEL_33;
          }
          if (v22 == 0x73726564724FLL && i == 0xE600000000000000
            || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t v33 = 10002;
            goto LABEL_33;
          }
          if (v22 == 0x65636E616E6946 && i == 0xE700000000000000
            || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t v33 = 10001;
            goto LABEL_33;
          }
LABEL_51:
          uint64_t v33 = 0;
LABEL_33:
          uint64_t v42 = v63;
          swift_beginAccess();
          *uint64_t v42 = v33;
          if (one-time initialization token for logger == -1) {
            goto LABEL_34;
          }
LABEL_53:
          swift_once();
LABEL_34:
          uint64_t v43 = __swift_project_value_buffer(v23, (uint64_t)logger);
          (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v43, v23);
          uint64_t v44 = v58;
          swift_retain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          Swift::OpaquePointer v45 = Logger.logObject.getter();
          int v57 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v45, (os_log_type_t)v57))
          {
            os_log_t v56 = v45;
            uint64_t v46 = swift_slowAlloc();
            uint64_t v54 = (void *)swift_slowAlloc();
            uint64_t v55 = swift_slowAlloc();
            v68[0] = v55;
            *(_DWORD *)uint64_t v46 = 136315906;
            unint64_t v47 = (uint64_t *)(v44 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
            swift_beginAccess();
            outlined init with take of Region?((uint64_t)v47, (uint64_t)v69, &demangling cache variable for type metadata for Region?);
            outlined init with take of Region?((uint64_t)v69, (uint64_t)v70, &demangling cache variable for type metadata for Region?);
            if (_s15extensionFilter6RegionVSgWOg((uint64_t)v70) != 1)
            {
              uint64_t v49 = *v47;
              unint64_t v48 = v47[1];
              swift_bridgeObjectRetain();
              uint64_t v66 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v48, v68);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v46 + 12) = 2082;
              swift_bridgeObjectRetain();
              uint64_t v66 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, i, v68);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v46 + 22) = 2048;
              uint64_t v66 = *(void *)&v24;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v46 + 32) = 2114;
              int64_t v50 = (Swift::UInt *)v63;
              swift_beginAccess();
              if (*(void *)(v59 + 16))
              {
                specialized __RawDictionaryStorage.find<A>(_:)(*v50);
                if (v51)
                {
                  swift_bridgeObjectRetain();
                  NSString v52 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease();
                  NSString v65 = v52;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  *uint64_t v54 = v52;
                  swift_bridgeObjectRelease_n();
                  os_log_t v53 = v56;
                  _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v57, "[%s] smsfilter: sub-classification model: (%{public}s, %f, %{public}@)", (uint8_t *)v46, 0x2Au);
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v64);
                  return swift_bridgeObjectRelease();
                }
              }
              else
              {
                __break(1u);
              }
              __break(1u);
            }
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_57:
            uint64_t result = swift_release();
            __break(1u);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_release_n();
            (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v64);
            return swift_bridgeObjectRelease();
          }
          return result;
        }
        unint64_t v31 = *(void *)&v17[8 * v30];
        ++v23;
        if (!v31)
        {
          uint64_t v23 = v30 + 1;
          if (v30 + 1 >= v21) {
            goto LABEL_22;
          }
          unint64_t v31 = *(void *)&v17[8 * v23];
          if (!v31)
          {
            uint64_t v23 = v30 + 2;
            if (v30 + 2 >= v21) {
              goto LABEL_22;
            }
            unint64_t v31 = *(void *)&v17[8 * v23];
            if (!v31)
            {
              int64_t v32 = v30 + 3;
              if (v32 >= v21) {
                goto LABEL_22;
              }
              unint64_t v31 = *(void *)&v17[8 * v32];
              if (!v31)
              {
                while (1)
                {
                  uint64_t v23 = v32 + 1;
                  if (__OFADD__(v32, 1)) {
                    break;
                  }
                  if (v23 >= v21) {
                    goto LABEL_22;
                  }
                  unint64_t v31 = *(void *)&v17[8 * v23];
                  ++v32;
                  if (v31) {
                    goto LABEL_21;
                  }
                }
                __break(1u);
                goto LABEL_53;
              }
              uint64_t v23 = v32;
            }
          }
        }
LABEL_21:
        unint64_t v20 = (v31 - 1) & v31;
        unint64_t v27 = __clz(__rbit64(v31)) + (v23 << 6);
      }
      unint64_t v28 = (uint64_t *)(*(void *)(v16 + 48) + 16 * v27);
      uint64_t v22 = *v28;
      unint64_t v29 = v28[1];
      double v24 = *(double *)(*(void *)(v16 + 56) + 8 * v27);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v8, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v34, v8);
  swift_retain();
  int v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v60 = v5;
    unint64_t v61 = v9;
    uint64_t v64 = v8;
    unint64_t v37 = (uint8_t *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v37 = 136315138;
    uint64_t v38 = (uint64_t *)(a1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
    swift_beginAccess();
    outlined init with take of Region?((uint64_t)v38, (uint64_t)v69, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v69, (uint64_t)v70, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v70) == 1) {
      goto LABEL_57;
    }
    uint64_t v39 = *v38;
    unint64_t v40 = v38[1];
    swift_bridgeObjectRetain();
    uint64_t v66 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%s] smsfilter: no active sub-classification-model", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v13, v64);
  }
  else
  {

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
}

ILMessageFilterCapabilitiesQueryResponse __swiftcall SmsFilter.subClassificationCapabilities()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)[objc_allocWithZone((Class)ILMessageFilterCapabilitiesQueryResponse) init];
  uint64_t v7 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v7, (uint64_t)v23, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v23, (uint64_t)v24, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v24) == 1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(unsigned char *)(v7 + 104))
  {
    outlined init with take of Region?(v7, (uint64_t)v21, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v21, (uint64_t)v22, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v22) != 1)
    {
      if (*(void *)v7 == 28265 && *(void *)(v7 + 8) == 0xE200000000000000
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter();
      }
      return (ILMessageFilterCapabilitiesQueryResponse)v6;
    }
    goto LABEL_16;
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  swift_retain();
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v9, v10))
  {

    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (ILMessageFilterCapabilitiesQueryResponse)v6;
  }
  uint64_t v17 = v3;
  v18.super.isa = v6;
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  uint64_t v16 = swift_slowAlloc();
  uint64_t v20 = v16;
  *(_DWORD *)uint64_t v11 = 136315138;
  outlined init with take of Region?(v7, (uint64_t)v21, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v21, (uint64_t)v22, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v22) != 1)
  {
    uint64_t v13 = *(void *)v7;
    unint64_t v12 = *(void *)(v7 + 8);
    swift_bridgeObjectRetain();
    uint64_t v19 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v12, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "smsfilter: sub-classification-model is not available for %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
    return v18;
  }
LABEL_17:
  result.super.isa = (Class)swift_release();
  __break(1u);
  return result;
}

uint64_t SmsFilter.deinit()
{
  swift_release();
  swift_release();
  outlined consume of SmsFilter._regexSubclassification?(*(void *)(v0 + 64));
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint);

  swift_release();
  outlined init with take of Region?(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, (uint64_t)v2, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of Region?);
  return v0;
}

uint64_t SmsFilter.__deallocating_deinit()
{
  SmsFilter.deinit();

  return swift_deallocClassInstance();
}

uint64_t outlined retain of Region(uint64_t a1)
{
  return a1;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    os_log_type_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Calendar.Component>);
    uint64_t v9 = static _SetStorage.allocate(capacity:)();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    int v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    unint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      lazy protocol witness table accessor for type Calendar.Component and conformance Calendar.Component(&lazy protocol witness table cache variable for type Calendar.Component and conformance Calendar.Component);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          lazy protocol witness table accessor for type Calendar.Component and conformance Calendar.Component(&lazy protocol witness table cache variable for type Calendar.Component and conformance Calendar.Component);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          double v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        double v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        unint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v4 = (void *)static _DictionaryStorage.allocate(capacity:)();
  Swift::UInt v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
  if (v9)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v4;
  }
  uint64_t v10 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v4[6] + 8 * result) = v5;
    uint64_t v11 = (void *)(v4[7] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    uint64_t v12 = v4[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      break;
    }
    v4[2] = v14;
    if (!--v2) {
      goto LABEL_8;
    }
    uint64_t v15 = v10 + 3;
    Swift::UInt v5 = *(v10 - 2);
    uint64_t v6 = *(v10 - 1);
    uint64_t v16 = *v10;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    uint64_t v10 = v15;
    uint64_t v7 = v16;
    if (v17) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ObjC metadata update function for SmsFilter()
{
  return type metadata accessor for SmsFilter();
}

uint64_t type metadata accessor for SmsFilter()
{
  uint64_t result = type metadata singleton initialization cache for SmsFilter;
  if (!type metadata singleton initialization cache for SmsFilter) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for SmsFilter()
{
  type metadata accessor for Date?();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void type metadata accessor for Date?()
{
  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
    }
  }
}

uint64_t destroy for SmsFilter._regexSubclassification()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeBufferWithCopyOfBuffer for SmsFilter._regexSubclassification(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SmsFilter._regexSubclassification(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SmsFilter._regexSubclassification(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SmsFilter._regexSubclassification(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SmsFilter._regexSubclassification(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SmsFilter._regexSubclassification()
{
  return &type metadata for SmsFilter._regexSubclassification;
}

ValueMetadata *type metadata accessor for SmsFilter.SubClasses()
{
  return &type metadata for SmsFilter.SubClasses;
}

uint64_t lazy protocol witness table accessor for type Calendar.Component and conformance Calendar.Component(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Calendar.Component();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of Region?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined consume of Regex?(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

void one-time initialization function for smsfilterVersion()
{
  smsfilterVersion._uint64_t countAndFlagsBits = 0x322E302E3631;
  smsfilterVersion._unint64_t object = (void *)0xE600000000000000;
}

Swift::String *smsfilterVersion.unsafeMutableAddressor()
{
  if (one-time initialization token for smsfilterVersion != -1) {
    swift_once();
  }
  return &smsfilterVersion;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
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

uint64_t RegexFilter.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  RegexFilter.init()();
  return v0;
}

Swift::Void __swiftcall RegexFilter.initRegexTemplates(initTemplateList:)(Swift::OpaquePointer initTemplateList)
{
  uint64_t v3 = (char **)(v1 + 16);
  swift_beginAccess();
  *(void *)(v1 + 16) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v4 = *((void *)initTemplateList._rawValue + 2);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (unint64_t *)((char *)initTemplateList._rawValue + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      unint64_t v6 = *v5;
      swift_bridgeObjectRetain();
      RegexFilter.replaceText(pattern:input:options:)(0x2D417A2D615B245CLL, 0xED0000245C2A5D5ALL, v7, v6, 16);
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      swift_beginAccess();
      uint64_t v12 = *(char **)(v1 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v1 + 16) = v12;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v12 + 2) + 1, 1, v12);
        *uint64_t v3 = v12;
      }
      unint64_t v15 = *((void *)v12 + 2);
      unint64_t v14 = *((void *)v12 + 3);
      if (v15 >= v14 >> 1)
      {
        uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v14 > 1), v15 + 1, 1, v12);
        *uint64_t v3 = v12;
      }
      v5 += 2;
      *((void *)v12 + 2) = v15 + 1;
      uint64_t v16 = &v12[16 * v15];
      *((void *)v16 + 4) = v9;
      *((void *)v16 + 5) = v11;
      swift_endAccess();
      swift_bridgeObjectRelease();
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
}

Swift::Bool __swiftcall RegexFilter.isMessageInRegexList(message:)(Swift::String message)
{
  Swift::String v19 = message;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = type metadata accessor for Locale();
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  swift_bridgeObjectRetain();
  uint64_t v9 = v6 - 1;
  uint64_t v18 = v5;
  uint64_t v10 = (uint64_t *)(v5 + 40);
  do
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(v10 - 1);
    uint64_t v13 = *v10;
    Swift::String v22 = v19;
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    v8(v4, 1, 1, v7);
    lazy protocol witness table accessor for type String and conformance String();
    swift_bridgeObjectRetain();
    StringProtocol.range<A>(of:options:range:locale:)();
    char v15 = v14;
    Swift::Bool v16 = (v14 & 1) == 0;
    outlined destroy of Locale?((uint64_t)v4);
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      break;
    }
    uint64_t v9 = v11 - 1;
    v10 += 2;
  }
  while (v11);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t RegexFilter.templateRegexList.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RegexFilter.templateRegexList.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RegexFilter.regexDict.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RegexFilter.init()()
{
  *(void *)(v0 + 16) = &_swiftEmptyArrayStorage;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DB50;
  *(void *)(inited + 32) = 0x246574614424;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = 0xD0000000000000B0;
  *(void *)(inited + 56) = 0x800000010001F9B0;
  *(void *)(inited + 64) = 0x746E756F63634124;
  *(void *)(inited + 72) = 0xEF247265626D754ELL;
  *(void *)(inited + 80) = 0xD00000000000005CLL;
  *(void *)(inited + 88) = 0x800000010001FA70;
  strcpy((char *)(inited + 96), "$PhoneNumber$");
  *(_WORD *)(inited + 110) = -4864;
  *(void *)(inited + 112) = 0xD000000000000068;
  *(void *)(inited + 120) = 0x800000010001FAD0;
  *(void *)(inited + 128) = 0x24746E756F6D4124;
  *(void *)(inited + 136) = 0xE800000000000000;
  *(void *)(inited + 144) = 0x100000000000004ALL;
  *(void *)(inited + 152) = 0x800000010001FB40;
  *(void *)(inited + 160) = 0x244C525524;
  *(void *)(inited + 168) = 0xE500000000000000;
  *(void *)(inited + 176) = 0xD0000000000000C1;
  *(void *)(inited + 184) = 0x800000010001FB90;
  *(void *)(v0 + 24) = specialized Dictionary.init(dictionaryLiteral:)(inited);
  return v0;
}

void RegexFilter.replaceText(pattern:input:options:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int v57 = (char *)&_swiftEmptyArrayStorage;
  objc_allocWithZone((Class)NSRegularExpression);
  swift_bridgeObjectRetain();
  id v10 = @nonobjc NSRegularExpression.init(pattern:options:)(a1, a2, a5);
  uint64_t v11 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v11 = a3;
  }
  uint64_t v12 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v12 = 11;
  }
  uint64_t aBlock = 15;
  uint64_t v50 = v12 | (v11 << 16);
  uint64_t v55 = a3;
  unint64_t v56 = a4;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v13 = _NSRange.init<A, B>(_:in:)();
  Swift::OpaquePointer v45 = v10;
  if (v10)
  {
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    id v17 = v10;
    NSString v18 = String._bridgeToObjectiveC()();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = &v57;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = partial apply for closure #1 in RegexFilter.replaceText(pattern:input:options:);
    *(void *)(v20 + 24) = v19;
    os_log_t v53 = partial apply for thunk for @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    uint64_t v54 = v20;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v50 = 1107296256;
    char v51 = thunk for @escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    NSString v52 = &block_descriptor;
    uint64_t v21 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v17 enumerateMatchesInString:v18 options:0 range:v15 usingBlock:v21];

    _Block_release(v21);
    LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v15)
    {
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      return;
    }
    Swift::String v22 = partial apply for closure #1 in RegexFilter.replaceText(pattern:input:options:);
    char v23 = v57;
    uint64_t v24 = *((void *)v57 + 2);
    if (v24)
    {
LABEL_8:
      uint64_t v44 = v22;
      uint64_t v46 = v24 - 1;
      swift_bridgeObjectRetain();
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      uint64_t v27 = 0;
      while (1)
      {
        uint64_t v28 = *(void *)&v23[v25 + 32];
        uint64_t v29 = v28 + v27;
        if (__OFADD__(v28, v27)) {
          break;
        }
        uint64_t v30 = *(void *)&v23[v25 + 40];
        Range<>.init(_:in:)();
        if (v31) {
          goto LABEL_31;
        }
        String.subscript.getter();
        uint64_t v32 = static String._fromSubstring(_:)();
        uint64_t v34 = v33;
        swift_bridgeObjectRelease();
        uint64_t v48 = v27;
        if (*(void *)(*(void *)(v47 + 24) + 16))
        {
          swift_bridgeObjectRetain();
          specialized __RawDictionaryStorage.find<A>(_:)(v32, v34);
          if (v35) {
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t v36 = String.count.getter();
        NSString v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        NSString v38 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v39 = [v37 stringByReplacingCharactersInRange:v29 withString:v30];

        static String._unconditionallyBridgeFromObjectiveC(_:)();
        char v23 = v57;
        unint64_t v40 = *((void *)v57 + 2);
        if (v26 >= v40) {
          goto LABEL_27;
        }
        uint64_t v41 = *(void *)&v57[v25 + 40];
        BOOL v42 = __OFSUB__(v36, v41);
        uint64_t v43 = v36 - v41;
        if (v42) {
          goto LABEL_28;
        }
        v27 += v43;
        if (__OFADD__(v48, v43)) {
          goto LABEL_29;
        }
        if (v46 == v26) {
          goto LABEL_22;
        }
        ++v26;
        v25 += 16;
        if (v26 >= v40)
        {
          __break(1u);
LABEL_22:

          Swift::String v22 = v44;
          goto LABEL_25;
        }
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  else
  {
    Swift::String v22 = 0;
    char v23 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v24 = *((void *)&_swiftEmptyArrayStorage + 2);
    if (v24) {
      goto LABEL_8;
    }
  }

  swift_bridgeObjectRetain();
LABEL_25:
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?((uint64_t)v22);
}

void closure #1 in RegexFilter.replaceText(pattern:input:options:)(void *a1, uint64_t a2, uint64_t a3, char **a4)
{
  if (a1)
  {
    id v13 = a1;
    id v5 = [v13 range];
    uint64_t v7 = v6;
    uint64_t v8 = *a4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v8 + 2) + 1, 1, v8);
      *a4 = v8;
    }
    unint64_t v11 = *((void *)v8 + 2);
    unint64_t v10 = *((void *)v8 + 3);
    if (v11 >= v10 >> 1) {
      uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v11 + 1;
    uint64_t v12 = &v8[16 * v11];
    *((void *)v12 + 4) = v5;
    *((void *)v12 + 5) = v7;
    *a4 = v8;
  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  id v8 = a2;
  v7(a2, a3, a4);
}

uint64_t RegexFilter.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RegexFilter.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

Swift::Void __swiftcall testRegexTemplate()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RegexFilter();
  uint64_t inited = swift_initStackObject();
  RegexFilter.init()();
  if (one-time initialization token for templateTestRegexList != -1) {
    goto LABEL_19;
  }
  while (1)
  {
    RegexFilter.initRegexTemplates(initTemplateList:)(templateTestRegexList);
    if (one-time initialization token for inputSmsList != -1) {
      swift_once();
    }
    rawValue = inputSmsList._rawValue;
    uint64_t v31 = *((void *)inputSmsList._rawValue + 2);
    if (!v31) {
      break;
    }
    uint64_t v29 = (char *)inputSmsList._rawValue + 32;
    swift_bridgeObjectRetain();
    uint64_t v30 = inited + 16;
    swift_beginAccess();
    unint64_t v5 = 0;
    long long v28 = xmmword_10001DD50;
    unint64_t v27 = 0x8000000100020150;
    unint64_t v24 = 0x8000000100020180;
    uint64_t v26 = inited;
    uint64_t v25 = rawValue;
    while (v5 < rawValue[2])
    {
      unint64_t v10 = (uint64_t *)&v29[16 * v5];
      uint64_t v12 = *v10;
      unint64_t v11 = (void *)v10[1];
      uint64_t v13 = *(void *)v30;
      uint64_t v14 = *(void *)(*(void *)v30 + 16);
      if (v14)
      {
        unint64_t v33 = v5;
        uint64_t v15 = type metadata accessor for Locale();
        uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v32 = v13;
        id v17 = (uint64_t *)(v13 + 40);
        do
        {
          uint64_t v18 = *(v17 - 1);
          uint64_t v19 = *v17;
          unint64_t v36 = v12;
          unint64_t v37 = (unint64_t)v11;
          uint64_t v34 = v18;
          uint64_t v35 = v19;
          v16(v2, 1, 1, v15);
          lazy protocol witness table accessor for type String and conformance String();
          swift_bridgeObjectRetain();
          StringProtocol.range<A>(of:options:range:locale:)();
          char v21 = v20;
          outlined destroy of Locale?((uint64_t)v2);
          swift_bridgeObjectRelease();
          if ((v21 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
            uint64_t v6 = swift_allocObject();
            *(_OWORD *)(v6 + 16) = v28;
            unint64_t v36 = 0;
            unint64_t v37 = 0xE000000000000000;
            _StringGuts.grow(_:)(27);
            swift_bridgeObjectRelease();
            unint64_t v36 = 0xD000000000000019;
            unint64_t v37 = v24;
            v7._uint64_t countAndFlagsBits = v12;
            v7._unint64_t object = v11;
            String.append(_:)(v7);
            swift_bridgeObjectRelease();
            unint64_t v9 = v36;
            unint64_t v8 = v37;
            *(void *)(v6 + 56) = &type metadata for String;
            *(void *)(v6 + 32) = v9;
            uint64_t inited = v26;
            rawValue = v25;
            unint64_t v5 = v33;
            goto LABEL_7;
          }
          v17 += 2;
          --v14;
        }
        while (v14);
        swift_bridgeObjectRelease();
        uint64_t inited = v26;
        rawValue = v25;
        unint64_t v5 = v33;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = v28;
      unint64_t v36 = 0;
      unint64_t v37 = 0xE000000000000000;
      _StringGuts.grow(_:)(35);
      swift_bridgeObjectRelease();
      unint64_t v36 = 0xD000000000000021;
      unint64_t v37 = v27;
      v22._uint64_t countAndFlagsBits = v12;
      v22._unint64_t object = v11;
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
      unint64_t v23 = v36;
      unint64_t v8 = v37;
      *(void *)(v6 + 56) = &type metadata for String;
      *(void *)(v6 + 32) = v23;
LABEL_7:
      ++v5;
      *(void *)(v6 + 40) = v8;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
      if (v5 == v31)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
    }
    __break(1u);
LABEL_19:
    swift_once();
  }
  swift_release();
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

uint64_t type metadata accessor for RegexFilter()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>;
  if (!lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<String.Index>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>);
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

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100012DCC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in RegexFilter.replaceText(pattern:input:options:)(void *a1, uint64_t a2, uint64_t a3)
{
  closure #1 in RegexFilter.replaceText(pattern:input:options:)(a1, a2, a3, *(char ***)(v3 + 16));
}

uint64_t sub_100012DE4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

extensionFilter::Region::CodingKeys_optional __swiftcall Region.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (extensionFilter::Region::CodingKeys_optional)14;
}

uint64_t Region.TrialParams.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t Region.CodingKeys.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
    case 3:
    case 4:
    case 7:
      return result;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0x6C61697254;
      break;
    case 11:
      unint64_t result = 0xD000000000000022;
      break;
    case 12:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000002BLL;
      break;
    default:
      unint64_t result = 0x614E6E6F69676552;
      break;
  }
  return result;
}

unint64_t Region.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
    case 3:
    case 4:
    case 7:
      return result;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0x6C61697254;
      break;
    case 11:
      unint64_t result = 0xD000000000000022;
      break;
    case 12:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000002BLL;
      break;
    default:
      unint64_t result = 0x614E6E6F69676552;
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Region.CodingKeys(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = Region.CodingKeys.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == Region.CodingKeys.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Region.CodingKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Region.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Region.CodingKeys()
{
  Region.CodingKeys.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Region.CodingKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Region.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Region.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized Region.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Region.CodingKeys@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = Region.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance Region.CodingKeys()
{
  return Region.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance Region.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized Region.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Region.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 14;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Region.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Region.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

extensionFilter::Region::TrialParams::CodingKeys_optional __swiftcall Region.TrialParams.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  unint64_t object = rawValue._object;
  v2._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._unint64_t object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.TrialParams.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = extensionFilter_Region_TrialParams_CodingKeys_namespaceId;
  }
  else {
    v4.value = extensionFilter_Region_TrialParams_CodingKeys_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

extensionFilter::Region::TrialParams::CodingKeys_optional __swiftcall Region.TrialParams.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (extensionFilter::Region::TrialParams::CodingKeys_optional)2;
}

uint64_t Region.TrialParams.CodingKeys.rawValue.getter(char a1)
{
  if (a1) {
    return 0x63617073656D614ELL;
  }
  else {
    return 0x7553206C61697254;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Region.TrialParams.CodingKeys(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = Region.TrialParams.CodingKeys.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == Region.TrialParams.CodingKeys.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Region.TrialParams.CodingKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Region.TrialParams.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Region.TrialParams.CodingKeys()
{
  Region.TrialParams.CodingKeys.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Region.TrialParams.CodingKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Region.TrialParams.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Region.TrialParams.CodingKeys@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.TrialParams.CodingKeys.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Region.TrialParams.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Region.TrialParams.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance Region.TrialParams.CodingKeys()
{
  return Region.TrialParams.CodingKeys.rawValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance Region.TrialParams.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  unint64_t object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._unint64_t object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.TrialParams.CodingKeys.init(rawValue:), v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Region.TrialParams.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Region.TrialParams.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Region.TrialParams.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t Region.TrialParams.trialSupported.getter(char a1)
{
  return a1 & 1;
}

uint64_t Region.TrialParams.trialSupported.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t Region.TrialParams.namespaceId.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Region.TrialParams.namespaceId.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t Region.TrialParams.init(from:)(void *a1)
{
  return specialized Region.TrialParams.init(from:)(a1) & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance Region.TrialParams@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = specialized Region.TrialParams.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t Region.regionName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Region.regionName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t Region.smsFilterSupported.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Region.smsFilterSupported.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t Region.basicModelAvailable.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t Region.basicModelAvailable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 17) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.basicModelAvailable.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.mainModelAvailable.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t Region.mainModelAvailable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 18) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.mainModelAvailable.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.countryCodePrefix.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Region.countryCodePrefix.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.countryCodePrefix.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.countryCodePrefixLength.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t Region.countryCodePrefixLength.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.countryCodePrefixLength.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.dominantLanguage.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Region.dominantLanguage.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.dominantLanguage.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.phoneNumberLength.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Region.phoneNumberLength.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.phoneNumberLength.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.testPhoneNumbers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Region.testPhoneNumbers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.testPhoneNumbers.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.retryTimerInMinutes.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t Region.retryTimerInMinutes.setter(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.retryTimerInMinutes.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.trial.getter()
{
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t Region.trial.setter(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(v2 + 88) = result;
  *(void *)(v2 + 96) = a2;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.trial.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.subClassificationSupported.getter()
{
  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t Region.subClassificationSupported.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 104) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.subClassificationSupported.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.transactionalCapabilities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Region.transactionalCapabilities.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.transactionalCapabilities.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.promotionalCapabilities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Region.promotionalCapabilities.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 120) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.promotionalCapabilities.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

double Region.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized Region.init(from:)(a1, v9);
  if (!v2)
  {
    long long v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    long long v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    long long v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    double result = *(double *)&v10;
    long long v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

void __swiftcall Region.init(regionName:smsFilterSupported:basicModelAvailable:mainModelAvailable:countryCodePrefix:countryCodePrefixLength:dominantLanguage:phoneNumberLength:testPhoneNumbers:retryTimerInMinutes:trial:subClassificationSupported:transactionalCapabilities:promotionalCapabilities:)(extensionFilter::Region *__return_ptr retstr, Swift::String regionName, Swift::Bool smsFilterSupported, Swift::Bool basicModelAvailable, Swift::Bool mainModelAvailable, Swift::String countryCodePrefix, Swift::Int countryCodePrefixLength, Swift::String dominantLanguage, Swift::OpaquePointer phoneNumberLength, Swift::OpaquePointer testPhoneNumbers, Swift::Int retryTimerInMinutes, extensionFilter::Region::TrialParams trial, Swift::Bool subClassificationSupported, Swift::OpaquePointer transactionalCapabilities, Swift::OpaquePointer promotionalCapabilities)
{
  retstr->regionName = regionName;
  retstr->smsFilterSupported = smsFilterSupported;
  retstr->basicModelAvailable = basicModelAvailable;
  retstr->mainModelAvailable = mainModelAvailable;
  retstr->countryCodePrefix = countryCodePrefix;
  retstr->countryCodePrefixLength = countryCodePrefixLength;
  retstr->dominantLanguage = dominantLanguage;
  *(_OWORD *)&retstr->phoneNumberLength._rawValue = *(_OWORD *)&phoneNumberLength._rawValue;
  retstr->retryTimerInMinutes = retryTimerInMinutes;
  retstr->trial.trialSupported = trial.trialSupported;
  retstr->trial.namespaceId = trial.namespaceId;
  retstr->subClassificationSupported = subClassificationSupported;
  retstr->transactionalCapabilities = transactionalCapabilities;
  retstr->promotionalCapabilities = promotionalCapabilities;
}

void *one-time initialization function for sharedRegionProperties()
{
  type metadata accessor for RegionPropertiesReader();
  uint64_t v0 = (void *)swift_allocObject();
  double result = RegionPropertiesReader.init()();
  static RegionPropertiesReader.sharedRegionProperties = v0;
  return result;
}

uint64_t RegionPropertiesReader.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  RegionPropertiesReader.init()();
  return v0;
}

uint64_t static RegionPropertiesReader.instance()()
{
  if (one-time initialization token for sharedRegionProperties != -1) {
    swift_once();
  }

  return swift_retain();
}

void *RegionPropertiesReader.init()()
{
  uint64_t v1 = v0;
  v0[2] = 0;
  v0[2] = (*(uint64_t (**)(void))(*v0 + 128))();
  uint64_t v2 = swift_bridgeObjectRelease();
  if (v0[2])
  {
    (*(void (**)(uint64_t))(*v0 + 144))(v2);
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)logger);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      long long v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "smsfiltter: no valid region found", v6, 2u);
      swift_slowDealloc();
    }
  }
  return v1;
}

Swift::OpaquePointer_optional __swiftcall RegionPropertiesReader.getRegionProperties()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  long long v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)v21 - v8;
  id v10 = [self mainBundle];
  NSString v11 = String._bridgeToObjectiveC()();
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v10 URLForResource:v11 withExtension:v12];

  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_5;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  long long v14 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v14(v2, v7, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_5:
    outlined destroy of URL?((uint64_t)v2);
    uint64_t v19 = 0;
    goto LABEL_6;
  }
  v14(v9, v2, v3);
  uint64_t v15 = Data.init(contentsOf:options:)();
  unint64_t v17 = v16;
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Region]);
  lazy protocol witness table accessor for type [Region] and conformance <A> [A]();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  swift_release();
  outlined consume of Data._Representation(v15, v17);
  uint64_t v19 = (void *)v21[0];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_6:
  uint64_t v18 = v19;
  result.value._rawValue = v18;
  result.is_nil = v20;
  return result;
}

void __swiftcall RegionPropertiesReader.getRegionPropertiesFor(regionName:)(extensionFilter::Region_optional *__return_ptr retstr, Swift::String regionName)
{
  unint64_t object = regionName._object;
  uint64_t countAndFlagsBits = regionName._countAndFlagsBits;
  uint64_t v6 = *(void *)(v2 + 16);
  if (v6 && (uint64_t v7 = *(void *)(v6 + 16)) != 0)
  {
    long long v8 = *(_OWORD *)(v6 + 32);
    long long v9 = *(_OWORD *)(v6 + 112);
    long long v35 = *(_OWORD *)(v6 + 96);
    long long v36 = v9;
    long long v10 = *(_OWORD *)(v6 + 144);
    long long v37 = *(_OWORD *)(v6 + 128);
    long long v38 = v10;
    long long v11 = *(_OWORD *)(v6 + 48);
    long long v12 = *(_OWORD *)(v6 + 64);
    long long v31 = v8;
    long long v32 = v11;
    long long v13 = *(_OWORD *)(v6 + 80);
    long long v33 = v12;
    long long v34 = v13;
    regionName._unint64_t object = (void *)*((void *)&v31 + 1);
    long long v14 = (long long *)(v6 + 160);
    for (uint64_t i = v7 - 1; ; --i)
    {
      BOOL v16 = (void)v31 == countAndFlagsBits && regionName._object == object;
      if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        v30[4] = v35;
        v30[5] = v36;
        v30[6] = v37;
        v30[7] = v38;
        v30[0] = v31;
        v30[1] = v32;
        char v17 = v32;
        v30[2] = v33;
        v30[3] = v34;
        *(extensionFilter::Regex::subCategories *)&regionName._uint64_t countAndFlagsBits = Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v30, (Swift::OpaquePointer)regionName._object, v18);
        if (v17) {
          break;
        }
      }
      if (!i) {
        goto LABEL_12;
      }
      long long v19 = v14[3];
      long long v21 = *v14;
      long long v20 = v14[1];
      long long v33 = v14[2];
      long long v34 = v19;
      long long v31 = v21;
      long long v32 = v20;
      long long v22 = v14[4];
      long long v23 = v14[5];
      long long v24 = v14[7];
      long long v37 = v14[6];
      long long v38 = v24;
      long long v35 = v22;
      long long v36 = v23;
      regionName._unint64_t object = (void *)*((void *)&v31 + 1);
      v14 += 8;
    }
    outlined retain of Region((uint64_t)&v31);
    uint64_t v29 = v30;
  }
  else
  {
LABEL_12:
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)logger);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      long long v28 = (uint8_t *)swift_slowAlloc();
      v39[0] = swift_slowAlloc();
      *(_DWORD *)long long v28 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "smsfilter: %s region is not supported", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    _s15extensionFilter6RegionVSgWOi0_(&v31);
    uint64_t v29 = &v31;
  }
  outlined init with take of Region?((uint64_t)v29, (uint64_t)v39);
  outlined init with take of Region?((uint64_t)v39, (uint64_t)retstr);
}

Swift::Void __swiftcall RegionPropertiesReader.printRegionProperties()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = v2 - 1;
      for (uint64_t i = 32; ; i += 128)
      {
        long long v5 = *(_OWORD *)(v1 + i);
        long long v6 = *(_OWORD *)(v1 + i + 16);
        long long v7 = *(_OWORD *)(v1 + i + 48);
        long long v19 = *(_OWORD *)(v1 + i + 32);
        long long v20 = v7;
        long long v17 = v5;
        long long v18 = v6;
        long long v8 = *(_OWORD *)(v1 + i + 64);
        long long v9 = *(_OWORD *)(v1 + i + 80);
        long long v10 = *(_OWORD *)(v1 + i + 112);
        long long v23 = *(_OWORD *)(v1 + i + 96);
        long long v24 = v10;
        long long v21 = v8;
        long long v22 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_10001DD50;
        *(void *)(v11 + 56) = &type metadata for Region;
        long long v12 = (_OWORD *)swift_allocObject();
        *(void *)(v11 + 32) = v12;
        long long v13 = v22;
        v12[5] = v21;
        v12[6] = v13;
        long long v14 = v24;
        v12[7] = v23;
        v12[8] = v14;
        long long v15 = v18;
        v12[1] = v17;
        v12[2] = v15;
        long long v16 = v20;
        uint64_t v12[3] = v19;
        v12[4] = v16;
        outlined retain of Region((uint64_t)&v17);
        print(_:separator:terminator:)();
        swift_bridgeObjectRelease();
        if (!v3) {
          break;
        }
        --v3;
      }
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t RegionPropertiesReader.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RegionPropertiesReader.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

unint64_t specialized Region.CodingKeys.init(rawValue:)(Swift::String string)
{
  unint64_t object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._unint64_t object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 0xE) {
    return 14;
  }
  else {
    return v3;
  }
}

uint64_t specialized Region.TrialParams.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Region.TrialParams.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v9[15] = 0;
    LOBYTE(v7) = KeyedDecodingContainer.decode(_:forKey:)();
    v9[14] = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v7 & 1;
}

uint64_t specialized Region.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Region.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  char v84 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v84);
  }
  uint64_t v10 = v6;
  LOBYTE(v58) = 0;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v13 = v12;
  uint64_t v47 = v11;
  LOBYTE(v58) = 1;
  swift_bridgeObjectRetain();
  int v46 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v58) = 2;
  int v45 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v58) = 3;
  LODWORD(v44) = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v58) = 4;
  uint64_t v43 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v58) = 5;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v49 = v15;
  uint64_t v42 = v16;
  LOBYTE(v58) = 6;
  uint64_t v39 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v18 = v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  LOBYTE(v50) = 7;
  uint64_t v20 = lazy protocol witness table accessor for type [Int] and conformance <A> [A](&lazy protocol witness table cache variable for type [Int] and conformance <A> [A], &demangling cache variable for type metadata for [Int]);
  uint64_t v48 = v18;
  swift_bridgeObjectRetain();
  uint64_t v40 = v20;
  uint64_t v41 = v19;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v21 = v58;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  LOBYTE(v50) = 8;
  lazy protocol witness table accessor for type [Int] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance <A> [A], &demangling cache variable for type metadata for [String]);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v38 = v21;
  uint64_t v22 = v58;
  LOBYTE(v58) = 9;
  swift_bridgeObjectRetain();
  uint64_t v37 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v50) = 10;
  lazy protocol witness table accessor for type Region.TrialParams and conformance Region.TrialParams();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v34 = v58;
  uint64_t v35 = v59;
  LOBYTE(v58) = 11;
  int v33 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v50) = 12;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v80 = 13;
  uint64_t v36 = v58;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  LODWORD(v41) = v46 & 1;
  LOBYTE(v19) = v44 & 1;
  LODWORD(v40) = v44 & 1;
  v45 &= 1u;
  int v46 = v33 & 1;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
  uint64_t v44 = v81;
  uint64_t v23 = v48;
  *(void *)&long long v50 = v47;
  *((void *)&v50 + 1) = v13;
  LOBYTE(v51) = v41;
  BYTE1(v51) = v45;
  BYTE2(v51) = v19;
  uint64_t v24 = v49;
  *((void *)&v51 + 1) = v43;
  *(void *)&long long v52 = v49;
  uint64_t v25 = v38;
  *((void *)&v52 + 1) = v42;
  *(void *)&long long v53 = v39;
  *((void *)&v53 + 1) = v48;
  *(void *)&long long v54 = v38;
  uint64_t v26 = v36;
  *((void *)&v54 + 1) = v22;
  *(void *)&long long v55 = v37;
  BYTE8(v55) = v34;
  *(void *)&long long v56 = v35;
  BYTE8(v56) = v46;
  *(void *)&long long v57 = v36;
  *((void *)&v57 + 1) = v81;
  outlined retain of Region((uint64_t)&v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v84);
  uint64_t v58 = v47;
  uint64_t v59 = v13;
  char v60 = v41;
  char v61 = v45;
  char v62 = v40;
  int v63 = *(_DWORD *)&v83[7];
  char v64 = v83[11];
  uint64_t v65 = v43;
  uint64_t v66 = v24;
  uint64_t v67 = v42;
  uint64_t v68 = v39;
  uint64_t v69 = v23;
  uint64_t v70 = v25;
  uint64_t v71 = v22;
  uint64_t v72 = v37;
  char v73 = v34;
  *(_DWORD *)&v74[3] = *(_DWORD *)&v83[3];
  *(_DWORD *)uint64_t v74 = *(_DWORD *)v83;
  uint64_t v75 = v35;
  char v76 = v46;
  *(_DWORD *)uint64_t v77 = *(_DWORD *)v82;
  *(_DWORD *)&v77[3] = *(_DWORD *)&v82[3];
  uint64_t v78 = v26;
  uint64_t v79 = v44;
  uint64_t result = outlined release of Region((uint64_t)&v58);
  long long v28 = v55;
  a2[4] = v54;
  a2[5] = v28;
  long long v29 = v57;
  a2[6] = v56;
  a2[7] = v29;
  long long v30 = v51;
  *a2 = v50;
  a2[1] = v30;
  long long v31 = v53;
  a2[2] = v52;
  a2[3] = v31;
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type [Region] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [Region] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [Region] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Region]);
    lazy protocol witness table accessor for type Region and conformance Region();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Region] and conformance <A> [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Region and conformance Region()
{
  unint64_t result = lazy protocol witness table cache variable for type Region and conformance Region;
  if (!lazy protocol witness table cache variable for type Region and conformance Region)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region and conformance Region);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1000153BC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 144, 7);
}

unint64_t lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Region(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Region()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Region(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Region(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for Region(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Region(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Region(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Region()
{
  return &type metadata for Region;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Region.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Region.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *__n128 result = a2 + 13;
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
        JUMPOUT(0x100015BC8);
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
          *__n128 result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for Region.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for Region.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Region.CodingKeys()
{
  return &type metadata for Region.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Region.TrialParams(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Region.TrialParams(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Region.TrialParams()
{
  return &type metadata for Region.TrialParams;
}

uint64_t getEnumTagSinglePayload for Region.TrialParams.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Region.TrialParams.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x100015E10);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for Region.TrialParams.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Region.TrialParams.CodingKeys()
{
  return &type metadata for Region.TrialParams.CodingKeys;
}

uint64_t type metadata accessor for RegionPropertiesReader()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t lazy protocol witness table accessor for type [Int] and conformance <A> [A](unint64_t *a1, uint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type Region.TrialParams and conformance Region.TrialParams()
{
  unint64_t result = lazy protocol witness table cache variable for type Region.TrialParams and conformance Region.TrialParams;
  if (!lazy protocol witness table cache variable for type Region.TrialParams and conformance Region.TrialParams)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams and conformance Region.TrialParams);
  }
  return result;
}

uint64_t outlined release of Region(uint64_t a1)
{
  return a1;
}

Swift::Void __swiftcall SmsFilter.loadDefaultBasicModel()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v33 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v14 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v14, (uint64_t)v38);
  outlined init with take of Region?((uint64_t)v38, (uint64_t)v39);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v39) == 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (*(unsigned char *)(v14 + 88) != 1) {
    goto LABEL_5;
  }
  outlined init with take of Region?(v14, (uint64_t)v36);
  outlined init with take of Region?((uint64_t)v36, (uint64_t)v37);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v37) == 1)
  {
LABEL_23:
    __break(1u);
    return;
  }
  if (*(unsigned char *)(v14 + 17)) {
    return;
  }
LABEL_5:
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v34 = v0;
  uint64_t v35 = v13;
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v33 = __swift_project_value_buffer(v15, (uint64_t)logger);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "smsfilter: trial-basicModel is not available. fallback to default basicModel.", v18, 2u);
    swift_slowDealloc();
  }

  id v19 = [self mainBundle];
  NSString v20 = String._bridgeToObjectiveC()();
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [v19 URLForResource:v20 withExtension:v21];

  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_13;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v23(v3, v11, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_13:
    outlined destroy of URL?((uint64_t)v3);
    return;
  }
  uint64_t v24 = v35;
  v23(v35, v3, v4);
  type metadata accessor for NLModel();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v24, v4);
  id v25 = @nonobjc NLModel.__allocating_init(contentsOf:)((uint64_t)v8);
  uint64_t v26 = v34;
  swift_beginAccess();
  os_log_type_t v27 = *(void **)(v26 + 16);
  *(void *)(v26 + 16) = v25;

  uint64_t v28 = *(void *)(v26 + 16);
  long long v29 = Logger.logObject.getter();
  if (v28)
  {
    LOBYTE(v30) = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, (os_log_type_t)v30))
    {
      long long v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v31 = 0;
      uint64_t v32 = "smsfilter: init default basic model.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v30, v32, v31, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, (os_log_type_t)v30))
    {
      long long v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v31 = 0;
      uint64_t v32 = "smsfilter: failed to load default basic model.";
      goto LABEL_19;
    }
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v24, v4);
}

unint64_t type metadata accessor for NLModel()
{
  unint64_t result = lazy cache variable for type metadata for NLModel;
  if (!lazy cache variable for type metadata for NLModel)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NLModel);
  }
  return result;
}

id @nonobjc NLModel.__allocating_init(contentsOf:)(uint64_t a1)
{
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  int v3 = v2;
  id v12 = 0;
  id v4 = [(id)swift_getObjCClassFromMetadata() modelWithContentsOfURL:v2 error:&v12];

  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = type metadata accessor for URL();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    id v8 = v5;
    v7(a1, v6);
  }
  else
  {
    id v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD00000000000001ALL;
  unint64_t v3 = 0x800000010001F870;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD00000000000001CLL;
    }
    else {
      unint64_t v5 = 0xD000000000000020;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x800000010001F890;
    }
    else {
      unint64_t v6 = 0x800000010001F8B0;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD00000000000001ALL;
  unint64_t v6 = 0x800000010001F870;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD00000000000001CLL;
    }
    else {
      unint64_t v2 = 0xD000000000000020;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x800000010001F890;
    }
    else {
      unint64_t v3 = 0x800000010001F8B0;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t RegexMessageReader.__allocating_init(filePath:)()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  specialized RegexMessageReader.processRegexMessages(filePath:)((uint64_t)v6);
  swift_bridgeObjectRelease();
  outlined init with take of Regex?((uint64_t)v6, v0 + 16);
  outlined consume of Regex?(0);
  outlined init with take of Regex?((uint64_t)v6, (uint64_t)v7);
  if (!v7[0])
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    __swift_project_value_buffer(v1, (uint64_t)logger);
    unint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      int v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "smsfiltter: no valid regex found", v4, 2u);
      swift_slowDealloc();
    }
  }
  return v0;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

extensionFilter::Regex::CodingKeys_optional __swiftcall Regex.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  v1._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(rawValue, v1);
}

extensionFilter::Regex::CodingKeys_optional __swiftcall Regex.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  v1._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(stringValue, v1);
}

extensionFilter::Regex::subCategories::CodingKeys_optional __swiftcall Regex.subCategories.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (extensionFilter::Regex::subCategories::CodingKeys_optional)3;
}

unint64_t Regex.CodingKeys.rawValue.getter(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000001CLL;
    }
    else {
      return 0xD000000000000020;
    }
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Regex.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Regex.CodingKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Regex.CodingKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Regex.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Regex.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  unint64_t result = Regex.CodingKeys.init(stringValue:)(*a1, v3);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Regex.CodingKeys@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = Regex.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance Regex.CodingKeys()
{
  return Regex.CodingKeys.rawValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance Regex.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  unint64_t result = Regex.CodingKeys.init(stringValue:)(a1, v3);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Regex.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Regex.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Regex.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

extensionFilter::Regex::subCategories::CodingKeys_optional __swiftcall Regex.subCategories.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  v1._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::subCategories::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(rawValue, v1);
}

extensionFilter::Regex::subCategories::CodingKeys_optional __swiftcall Regex.subCategories.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  v1._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::subCategories::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(stringValue, v1);
}

unint64_t Regex.CodingKeys.init(stringValue:)(Swift::String string, Swift::OpaquePointer cases)
{
  unint64_t object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._unint64_t object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  if (v5 >= 3) {
    return 3;
  }
  else {
    return v5;
  }
}

uint64_t Regex.subCategories.CodingKeys.rawValue.getter(char a1)
{
  return *(void *)&aFinance_1[8 * a1];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Regex.subCategories.CodingKeys(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = Regex.subCategories.CodingKeys.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == Regex.subCategories.CodingKeys.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Regex.subCategories.CodingKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Regex.subCategories.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Regex.subCategories.CodingKeys()
{
  Regex.subCategories.CodingKeys.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Regex.subCategories.CodingKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Regex.subCategories.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Regex.subCategories.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  unint64_t result = Regex.CodingKeys.init(stringValue:)(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Regex.subCategories.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Regex.subCategories.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance Regex.subCategories.CodingKeys()
{
  return Regex.subCategories.CodingKeys.rawValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance Regex.subCategories.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  unint64_t result = Regex.CodingKeys.init(stringValue:)(a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Regex.subCategories.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Regex.subCategories.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t Regex.subCategories.finance.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t Regex.subCategories.reminders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Regex.subCategories.reminders.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t Regex.subCategories.orders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Regex.subCategories.orders.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

void *Regex.subCategories.init(from:)(void *a1)
{
  uint64_t result = specialized Regex.subCategories.init(from:)(a1);
  if (v1) {
    return (void *)v3;
  }
  return result;
}

void *protocol witness for Decodable.init(from:) in conformance Regex.subCategories@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = specialized Regex.subCategories.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t Regex.promoRegex.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Regex.transRegex.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Regex.subClassificationRegex.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Regex.subClassificationRegex.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return result;
}

double Regex.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized Regex.init(from:)(a1, v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

void __swiftcall Regex.init(promoRegex:transRegex:subClassificationRegex:)(extensionFilter::Regex *__return_ptr retstr, Swift::OpaquePointer promoRegex, Swift::OpaquePointer transRegex, extensionFilter::Regex::subCategories subClassificationRegex)
{
  retstr->promoRegex = promoRegex;
  retstr->transRegex = transRegex;
  retstr->subClassificationRegex = subClassificationRegex;
}

uint64_t RegexMessageReader.init(filePath:)()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v2 = (void *)(v0 + 16);
  (*(void (**)(void *__return_ptr))(*(void *)v0 + 120))(v9);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v0 + 16);
  outlined init with take of Regex?((uint64_t)v9, (uint64_t)v2);
  outlined consume of Regex?(v3);
  if (!*v2)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)logger);
    long long v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "smsfiltter: no valid regex found", v7, 2u);
      swift_slowDealloc();
    }
  }
  return v1;
}

void __swiftcall RegexMessageReader.processRegexMessages(filePath:)(extensionFilter::Regex_optional *__return_ptr retstr, Swift::String filePath)
{
  specialized RegexMessageReader.processRegexMessages(filePath:)((uint64_t)v3);
  outlined init with take of Regex?((uint64_t)v3, (uint64_t)retstr);
}

Swift::OpaquePointer_optional __swiftcall RegexMessageReader.getRegexMessagesForPromo()()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1) {
    uint64_t v1 = (void *)swift_bridgeObjectRetain();
  }
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

Swift::OpaquePointer_optional __swiftcall RegexMessageReader.getRegexMessagesForTrans()()
{
  if (*(void *)(v0 + 16)) {
    uint64_t v1 = (void *)swift_bridgeObjectRetain();
  }
  else {
    uint64_t v1 = 0;
  }
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

Swift::OpaquePointer_optional __swiftcall RegexMessageReader.getRegexMessagesForSubClassification()()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[2];
  if (!v2)
  {
    long long v5 = 0;
    goto LABEL_12;
  }
  uint64_t v3 = v1[4];
  swift_bridgeObjectRetain();
  outlined copy of Regex?(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  NSString v20 = &_swiftEmptyDictionarySingleton;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, 0x65636E616E6946, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  NSString v21 = &_swiftEmptyDictionarySingleton;
  long long v5 = (void *)swift_bridgeObjectRelease();
  uint64_t v7 = v1[2];
  if (!v7)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v8 = v1[6];
  swift_bridgeObjectRetain();
  outlined copy of Regex?(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  NSString v20 = &_swiftEmptyDictionarySingleton;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v8, 0x73726564724FLL, 0xE600000000000000, v9);
  long long v5 = (void *)swift_bridgeObjectRelease();
  uint64_t v10 = v1[2];
  if (!v10)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v11 = v1[5];
  outlined copy of Regex?(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  NSString v20 = &_swiftEmptyDictionarySingleton;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v11, 0x7265646E696D6552, 0xE900000000000073, v12);
  NSString v21 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)logger);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    NSString v20 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    uint64_t v17 = Dictionary.description.getter();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, (uint64_t *)&v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "SMSfilter: SubRegex: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  long long v5 = v21;
LABEL_12:
  result.value._rawValue = v5;
  result.is_nil = v6;
  return result;
}

uint64_t RegexMessageReader.deinit()
{
  outlined consume of Regex?(*(void *)(v0 + 16));
  return v0;
}

uint64_t RegexMessageReader.__deallocating_deinit()
{
  outlined consume of Regex?(*(void *)(v0 + 16));

  return swift_deallocClassInstance();
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [String]>);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    long long v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [String]>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized RegexMessageReader.processRegexMessages(filePath:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v46 - 8);
  uint64_t v3 = __chkstk_darwin(v46);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v43 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v43 - v9;
  URL.init(fileURLWithPath:)();
  id v11 = [self defaultManager];
  URL.path.getter();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned __int8 v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)logger);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v10, v46);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v45 = a1;
      *(void *)&v47[0] = v19;
      uint64_t v43 = v15;
      uint64_t v44 = v2;
      *(_DWORD *)uint64_t v18 = 136315138;
      lazy protocol witness table accessor for type URL and conformance URL();
      uint64_t v20 = v46;
      uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, (uint64_t *)v47);
      uint64_t v23 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v24 = v20;
      BOOL v25 = *(void (**)(char *, uint64_t))(v23 + 8);
      v25(v5, v24);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "smsfilter: regex url: %s", v18, 0xCu);
      swift_arrayDestroy();
      a1 = v45;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      BOOL v25 = *(void (**)(char *, uint64_t))(v2 + 8);
      v25(v5, v46);
    }

    uint64_t v35 = Data.init(contentsOf:options:)();
    unint64_t v37 = v36;
    type metadata accessor for PropertyListDecoder();
    swift_allocObject();
    PropertyListDecoder.init()();
    lazy protocol witness table accessor for type Regex and conformance Regex();
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
    v25(v10, v46);
    swift_release();
    uint64_t result = outlined consume of Data._Representation(v35, v37);
    long long v40 = v47[0];
    long long v41 = v47[1];
    uint64_t v42 = v48;
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)logger);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v8, v10, v46);
    BOOL v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v44 = v2;
      long long v29 = (uint8_t *)swift_slowAlloc();
      *(void *)&v47[0] = swift_slowAlloc();
      uint64_t v30 = v46;
      uint64_t v45 = a1;
      *(_DWORD *)long long v29 = 136315138;
      lazy protocol witness table accessor for type URL and conformance URL();
      uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, (uint64_t *)v47);
      a1 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v44 + 8);
      v33(v8, v30);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "smsfilter: regex file %s doesn't exist.", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v10, v30);
    }
    else
    {

      uint64_t v38 = *(void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v39 = v46;
      v38(v8, v46);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v38)(v10, v39);
    }
    uint64_t v42 = 0;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
  }
  *(_OWORD *)a1 = v40;
  *(_OWORD *)(a1 + 16) = v41;
  *(void *)(a1 + 32) = v42;
  return result;
}

uint64_t outlined init with take of Regex?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Regex?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *specialized Regex.subCategories.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Regex.subCategories.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    char v10 = 0;
    lazy protocol witness table accessor for type [String] and conformance <A> [A]();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v8 = v11;
    char v10 = 1;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v9 = v8;
    char v10 = 2;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v9;
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t specialized Regex.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Regex.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v16 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  char v20 = 0;
  lazy protocol witness table accessor for type [String] and conformance <A> [A]();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v17;
  char v20 = 1;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v10 = v17;
  char v20 = 2;
  lazy protocol witness table accessor for type Regex.subCategories and conformance Regex.subCategories();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = v17;
  uint64_t v12 = v18;
  uint64_t v13 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = v16;
  *uint64_t v16 = v9;
  v15[1] = v10;
  v15[2] = v11;
  v15[3] = v12;
  v15[4] = v13;
  return result;
}

uint64_t outlined copy of Regex?(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

uint64_t destroy for Regex()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Regex(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Regex(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Regex(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Regex(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Regex(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Regex()
{
  return &type metadata for Regex;
}

ValueMetadata *type metadata accessor for Regex.CodingKeys()
{
  return &type metadata for Regex.CodingKeys;
}

uint64_t destroy for Regex.subCategories()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for Regex.subCategories(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Regex.subCategories(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Regex.subCategories(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Regex.subCategories(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Regex.subCategories(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Regex.subCategories()
{
  return &type metadata for Regex.subCategories;
}

uint64_t getEnumTagSinglePayload for Regex.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Regex.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x1000194CCLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Regex.subCategories.CodingKeys()
{
  return &type metadata for Regex.subCategories.CodingKeys;
}

uint64_t type metadata accessor for RegexMessageReader()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [String] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex.subCategories and conformance Regex.subCategories()
{
  unint64_t result = lazy protocol witness table cache variable for type Regex.subCategories and conformance Regex.subCategories;
  if (!lazy protocol witness table cache variable for type Regex.subCategories and conformance Regex.subCategories)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories and conformance Regex.subCategories);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex and conformance Regex()
{
  unint64_t result = lazy protocol witness table cache variable for type Regex and conformance Regex;
  if (!lazy protocol witness table cache variable for type Regex and conformance Regex)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex and conformance Regex);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

Swift::OpaquePointer *templateTestRegexList.unsafeMutableAddressor()
{
  if (one-time initialization token for templateTestRegexList != -1) {
    swift_once();
  }
  return &templateTestRegexList;
}

Swift::OpaquePointer *inputSmsList.unsafeMutableAddressor()
{
  if (one-time initialization token for inputSmsList != -1) {
    swift_once();
  }
  return &inputSmsList;
}

void one-time initialization function for promoTestData()
{
  promoTestData._rawValue = &outlined read-only object #0 of one-time initialization function for promoTestData;
}

Swift::OpaquePointer *promoTestData.unsafeMutableAddressor()
{
  if (one-time initialization token for promoTestData != -1) {
    swift_once();
  }
  return &promoTestData;
}

void one-time initialization function for inputSmsList()
{
  inputSmsList._rawValue = &outlined read-only object #0 of one-time initialization function for inputSmsList;
}

void one-time initialization function for templateTestRegexList()
{
  templateTestRegexList._rawValue = &outlined read-only object #0 of one-time initialization function for templateTestRegexList;
}

void one-time initialization function for _smsfilters()
{
  _smsfilters._rawValue = &_swiftEmptyArrayStorage;
}

id MessageFilterExtension.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id MessageFilterExtension.init()()
{
  v27.receiver = v0;
  v27.super_class = (Class)swift_getObjectType();
  [super init];
  uint64_t v2 = one-time initialization token for logger;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)logger);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    *(_DWORD *)BOOL v7 = 136446210;
    if (one-time initialization token for smsfilterVersion != -1) {
      swift_once();
    }
    uint64_t countAndFlagsBits = smsfilterVersion._countAndFlagsBits;
    unint64_t object = smsfilterVersion._object;
    swift_bridgeObjectRetain();
    uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "SMSfilter: init, ver: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t MySim = (unint64_t)getMySimRegions()();
  if (MySim)
  {
    unint64_t v11 = MySim;
    specialized MessageFilterExtension.handleSimRemoval()();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = (unint64_t *)(v11 + 40);
      do
      {
        uint64_t v14 = *(v13 - 1);
        unint64_t v15 = *v13;
        swift_bridgeObjectRetain();
        specialized MessageFilterExtension.initSMSFilter(for:)(v14, v15);
        swift_bridgeObjectRelease();
        v13 += 2;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v16, v17))
    {

      swift_bridgeObjectRelease_n();
      return v3;
    }
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v19 = Array.description.getter();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    v25[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2048;
    if (one-time initialization token for _smsfilters != -1) {
      swift_once();
    }
    swift_beginAccess();
    if ((unint64_t)_smsfilters._rawValue >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "SMSfilter: init done, sim-regions = %s, #filters = %ld", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_20;
  }
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v22, "smsfilter: no supported region", v23, 2u);
LABEL_20:
    swift_slowDealloc();
  }

  return v3;
}

uint64_t specialized Array.remove(at:)(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    unint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew()(v3);
    unint64_t *v1 = v3;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      specialized Array._endMutation()();
      return v10;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MessageFilterExtension.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

void MessageFilterExtension.handle(_:context:completion:)(uint64_t a1, uint64_t a2, void (*a3)(Class))
{
  if (one-time initialization token for logger == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)logger);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "smsfilter: capabilitiesQueryRequest", v7, 2u);
      swift_slowDealloc();
    }

    if (one-time initialization token for _smsfilters != -1) {
      swift_once();
    }
    swift_beginAccess();
    unint64_t rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62) {
      break;
    }
    uint64_t v9 = *(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v9) {
      goto LABEL_23;
    }
LABEL_8:
    uint64_t v10 = a3;
    uint64_t v11 = 4;
    uint64_t v12 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_12:
      uint64_t v13 = *(void *)(rawValue + 8 * v11);
      swift_retain();
      a3 = (void (*)(Class))(v12 + 1);
      if (__OFADD__(v12, 1)) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    while (1)
    {
      uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      a3 = (void (*)(Class))(v12 + 1);
      if (__OFADD__(v12, 1)) {
        break;
      }
LABEL_13:
      uint64_t v14 = v13 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
      swift_beginAccess();
      outlined init with take of Region?(v14, (uint64_t)v19);
      outlined init with take of Region?((uint64_t)v19, (uint64_t)v20);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v20) == 1)
      {
        __break(1u);
        return;
      }
      if (*(unsigned char *)(v14 + 104) == 1)
      {
        swift_bridgeObjectRelease();
        v15.super.isa = SmsFilter.subClassificationCapabilities()().super.isa;
        swift_release();
        v10(v15.super.isa);
        goto LABEL_27;
      }
      swift_release();
      if (a3 == (void (*)(Class))v9)
      {
        swift_bridgeObjectRelease();
        a3 = v10;
        goto LABEL_24;
      }
      uint64_t v12 = ++v11 - 4;
      if ((rawValue & 0xC000000000000001) == 0) {
        goto LABEL_12;
      }
    }
LABEL_20:
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  if (v9) {
    goto LABEL_8;
  }
LABEL_23:
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "smsfilter: sub-classification feature is not available", v18, 2u);
    swift_slowDealloc();
  }

  v15.super.isa = (Class)[objc_allocWithZone((Class)ILMessageFilterCapabilitiesQueryResponse) init];
  a3(v15.super.isa);
LABEL_27:
}

void MessageFilterExtension.handle(_:context:completion:)(void *a1, uint64_t a2, void (*a3)(id))
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)logger);
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "smsfilter: queryRequest", v8, 2u);
    swift_slowDealloc();
  }

  unint64_t v9 = specialized MessageFilterExtension.offlineAction(for:)(a1);
  uint64_t v11 = v10;
  id v18 = [objc_allocWithZone((Class)ILMessageFilterQueryResponse) init];
  [v18 setSubAction:0];
  if ((unint64_t)(v11 - 10001) >= 3 && v11)
  {
    ILMessageFilterCapabilitiesQueryResponse v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "unexpected offline sub-action", v17, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    [v18 setSubAction:v11];
  }
  if (v9 <= 4 && ((1 << v9) & 0x1A) != 0)
  {
    [v18 setAction:v9];
    a3(v18);
  }
  else
  {
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "unexpected offline action", v14, 2u);
      swift_slowDealloc();
    }
  }
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t specialized MessageFilterExtension.handleSimRemoval()()
{
  unint64_t v0 = type metadata accessor for Logger();
  id v1 = *(char **)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for _smsfilters != -1) {
    goto LABEL_79;
  }
  while (1)
  {
    swift_beginAccess();
    unint64_t rawValue = (unint64_t)_smsfilters._rawValue;
    if (!((unint64_t)_smsfilters._rawValue >> 62))
    {
      uint64_t v4 = *(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v4) {
        return swift_bridgeObjectRelease();
      }
      goto LABEL_4;
    }
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (!v4) {
      return swift_bridgeObjectRelease();
    }
LABEL_4:
    unint64_t v6 = 0;
    unint64_t v52 = rawValue & 0xC000000000000001;
    uint64_t v43 = (char *)(rawValue + 32);
    uint64_t v44 = rawValue & 0xFFFFFFFFFFFFFF8;
    uint64_t v47 = (void (**)(uint64_t, unint64_t))(v1 + 8);
    uint64_t v48 = (void (**)(uint64_t, uint64_t, unint64_t))(v1 + 16);
    *(void *)&long long v5 = 136315138;
    long long v42 = v5;
    v41[1] = (char *)&type metadata for Any + 8;
    uint64_t v51 = v4;
    unint64_t v45 = v0;
    uint64_t v46 = v3;
    while (1)
    {
      if (v52)
      {
        uint64_t v7 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v8 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_76;
        }
      }
      else
      {
        if (v6 >= *(void *)(v44 + 16)) {
          goto LABEL_77;
        }
        uint64_t v7 = *(void *)&v43[8 * v6];
        swift_retain();
        unint64_t v8 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_76;
        }
      }
      unint64_t v57 = v8;
      unint64_t v9 = (uint64_t *)(v7 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
      swift_beginAccess();
      outlined init with take of Region?((uint64_t)v9, (uint64_t)v62);
      outlined init with take of Region?((uint64_t)v62, (uint64_t)v63);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v63) == 1)
      {
        __break(1u);
LABEL_83:
        uint64_t result = swift_release();
        __break(1u);
        return result;
      }
      uint64_t v10 = v9[1];
      uint64_t v55 = *v9;
      swift_bridgeObjectRetain();
      uint64_t v11 = (char *)getActiveSimRegions();
      unint64_t v56 = v6;
      long long v54 = v9;
      if (!v11)
      {
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v0, (uint64_t)logger);
        uint64_t v24 = Logger.logObject.getter();
        os_log_type_t v25 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "smsfilter: no supported active sim-region", v26, 2u);
          swift_slowDealloc();
        }
        swift_bridgeObjectRelease();

        goto LABEL_56;
      }
      id v1 = v11;
      uint64_t v53 = v7;
      uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v13 = *(void *)(v12 + 16);
      if (v13) {
        break;
      }
      swift_bridgeObjectRelease();
      ILMessageFilterCapabilitiesQueryResponse v15 = (char *)_swiftEmptyArrayStorage;
LABEL_49:
      id v1 = (char *)*((void *)v15 + 2);
      uint64_t v3 = v46;
      uint64_t v27 = v55;
      if (v1)
      {
        if (*((void *)v15 + 4) == v55 && *((void *)v15 + 5) == v10
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_53:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v4 = v51;
          goto LABEL_7;
        }
        if (v1 != (char *)1)
        {
          if (*((void *)v15 + 6) == v27 && *((void *)v15 + 7) == v10
            || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            goto LABEL_53;
          }
          if (v1 != (char *)2)
          {
            unint64_t v36 = v15 + 72;
            uint64_t v37 = 2;
            do
            {
              uint64_t v38 = (char *)(v37 + 1);
              if (__OFADD__(v37, 1)) {
                goto LABEL_78;
              }
              BOOL v39 = *(v36 - 1) == v27 && *v36 == v10;
              if (v39 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
                goto LABEL_53;
              }
              v36 += 2;
              ++v37;
            }
            while (v38 != v1);
          }
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = v51;
      unint64_t v6 = v56;
LABEL_56:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v28 = __swift_project_value_buffer(v0, (uint64_t)logger);
      (*v48)(v3, v28, v0);
      swift_retain();
      long long v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        unint64_t v31 = v0;
        uint64_t v32 = swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = v42;
        uint64_t v33 = v54;
        outlined init with take of Region?((uint64_t)v54, (uint64_t)v60);
        outlined init with take of Region?((uint64_t)v60, (uint64_t)v61);
        if (_s15extensionFilter6RegionVSgWOg((uint64_t)v61) == 1) {
          goto LABEL_83;
        }
        uint64_t v34 = *v33;
        unint64_t v35 = v33[1];
        swift_bridgeObjectRetain();
        *(void *)(v32 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, &v59);
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "smsfilter: remove filter instance for (%s)", (uint8_t *)v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        unint64_t v0 = v31;
        (*v47)(v3, v31);
        uint64_t v4 = v51;
        unint64_t v6 = v56;
      }
      else
      {

        swift_release();
        (*v47)(v3, v0);
      }
      swift_beginAccess();
      id v1 = (char *)specialized Array.remove(at:)(v6);
      swift_endAccess();
      SmsFilter.cleanup()();
      swift_release();
LABEL_7:
      swift_release();
      unint64_t v6 = v57;
      if (v57 == v4) {
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v49 = v10;
    unint64_t v14 = 0;
    uint64_t v58 = v12 + 32;
    ILMessageFilterCapabilitiesQueryResponse v15 = (char *)_swiftEmptyArrayStorage;
    while (v14 < *(void *)(v12 + 16))
    {
      os_log_type_t v16 = (uint64_t *)(v58 + 16 * v14);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      uint64_t v19 = one-time initialization token for sharedRegionProperties;
      swift_bridgeObjectRetain();
      if (v19 != -1) {
        swift_once();
      }
      id v1 = (char *)static RegionPropertiesReader.sharedRegionProperties;
      unint64_t v0 = *(void *)(*(void *)static RegionPropertiesReader.sharedRegionProperties + 136);
      uint64_t v3 = *(void *)static RegionPropertiesReader.sharedRegionProperties + 136;
      swift_retain();
      ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v0)(v64, v18, v17);
      swift_release();
      outlined release of Region?(v64);
      outlined init with take of Region?((uint64_t)v64, (uint64_t)v65);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v65) != 1)
      {
        id v1 = (char *)*((void *)v15 + 2);
        if (!v1) {
          goto LABEL_37;
        }
        if ((*((void *)v15 + 4) != v18 || *((void *)v15 + 5) != v17)
          && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v1 == (char *)1)
          {
LABEL_37:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              ILMessageFilterCapabilitiesQueryResponse v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (int64_t)(v1 + 1), 1, v15);
            }
            unint64_t v0 = *((void *)v15 + 2);
            unint64_t v22 = *((void *)v15 + 3);
            id v1 = (char *)(v0 + 1);
            if (v0 >= v22 >> 1) {
              ILMessageFilterCapabilitiesQueryResponse v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v0 + 1, 1, v15);
            }
            *((void *)v15 + 2) = v1;
            uint64_t v23 = &v15[16 * v0];
            *((void *)v23 + 4) = v18;
            *((void *)v23 + 5) = v17;
            goto LABEL_19;
          }
          unint64_t v0 = (unint64_t)(v15 + 56);
          uint64_t v3 = 1;
          while (1)
          {
            BOOL v20 = *(void *)(v0 - 8) == v18 && *(void *)v0 == v17;
            if (v20 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              break;
            }
            unint64_t v21 = (char *)(v3 + 1);
            if (__OFADD__(v3, 1)) {
              goto LABEL_75;
            }
            v0 += 16;
            ++v3;
            if (v21 == v1) {
              goto LABEL_37;
            }
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_19:
      if (++v14 == v13)
      {
        swift_bridgeObjectRelease();
        unint64_t v0 = v45;
        uint64_t v10 = v49;
        goto LABEL_49;
      }
    }
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    swift_once();
  }
}

void specialized MessageFilterExtension.initSMSFilter(for:)(uint64_t a1, unint64_t a2)
{
  if (one-time initialization token for _smsfilters == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    swift_beginAccess();
    unint64_t rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    }
    else
    {
      uint64_t v5 = *(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    if (!v5) {
      break;
    }
    uint64_t v6 = 4;
    uint64_t v7 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_9:
      uint64_t v8 = *(void *)(rawValue + 8 * v6);
      swift_retain();
      uint64_t v9 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_41;
      }
      goto LABEL_10;
    }
    while (1)
    {
      uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v9 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        break;
      }
LABEL_10:
      uint64_t v10 = (void *)(v8 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
      swift_beginAccess();
      outlined init with take of Region?((uint64_t)v10, (uint64_t)v33);
      outlined init with take of Region?((uint64_t)v33, (uint64_t)v34);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v34) == 1)
      {
        __break(1u);
        return;
      }
      BOOL v11 = *v10 == a1 && v10[1] == a2;
      if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v16 = type metadata accessor for Logger();
        __swift_project_value_buffer(v16, (uint64_t)logger);
        swift_bridgeObjectRetain_n();
        uint64_t v17 = Logger.logObject.getter();
        os_log_type_t v18 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          v32[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v19 = 136315138;
          swift_bridgeObjectRetain();
          v30[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v32);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "smsfilter: found a matching smsfilter, update filter for region: (%s)", v19, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        SmsFilter.update()();
        goto LABEL_40;
      }
      swift_release();
      if (v9 == v5) {
        goto LABEL_19;
      }
      uint64_t v7 = ++v6 - 4;
      if ((rawValue & 0xC000000000000001) == 0) {
        goto LABEL_9;
      }
    }
LABEL_41:
    __break(1u);
  }
LABEL_19:
  swift_bridgeObjectRelease();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    ILMessageFilterCapabilitiesQueryResponse v15 = (uint8_t *)swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)ILMessageFilterCapabilitiesQueryResponse v15 = 136315138;
    swift_bridgeObjectRetain();
    v33[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "smsfilter: no matching smsfilter found for simRegion: (%s), so add one!", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = type metadata accessor for SmsFilter();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v21 = SmsFilter.init(for:)(a1, a2);
  uint64_t v22 = v21 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess();
  outlined init with take of Region?(v22, (uint64_t)v33);
  outlined init with take of Region?((uint64_t)v33, (uint64_t)v34);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v34) == 1)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "smsfilter: no active filter for sim region : (%s)", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      return;
    }

    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_beginAccess();
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "smsfilter: new filter instance for (%s) created.", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10001DD50;
    *(void *)(v29 + 56) = v20;
    *(void *)(v29 + 32) = v21;
    swift_retain();
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
LABEL_40:
  swift_release();
}

void specialized MessageFilterExtension.handle(_:context:completion:)(void (**a1)(void, void))
{
  if (one-time initialization token for logger == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v2 = type metadata accessor for Logger();
    __swift_project_value_buffer(v2, (uint64_t)logger);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "smsfilter: capabilitiesQueryRequest", v5, 2u);
      swift_slowDealloc();
    }

    if (one-time initialization token for _smsfilters != -1) {
      swift_once();
    }
    swift_beginAccess();
    unint64_t rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62) {
      break;
    }
    uint64_t v7 = *(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_22;
    }
LABEL_8:
    uint64_t v8 = 4;
    uint64_t v9 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_12:
      uint64_t v10 = *(void *)(rawValue + 8 * v8);
      swift_retain();
      uint64_t v11 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        goto LABEL_19;
      }
      goto LABEL_13;
    }
    while (1)
    {
      uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v11 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
LABEL_13:
      uint64_t v12 = v10 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
      swift_beginAccess();
      outlined init with take of Region?(v12, (uint64_t)v17);
      outlined init with take of Region?((uint64_t)v17, (uint64_t)v18);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v18) == 1)
      {
        _Block_release(a1);
        __break(1u);
        return;
      }
      if (*(unsigned char *)(v12 + 104))
      {
        swift_bridgeObjectRelease();
        v13.super.isa = SmsFilter.subClassificationCapabilities()().super.isa;
        swift_release();
        goto LABEL_25;
      }
      swift_release();
      if (v11 == v7) {
        goto LABEL_22;
      }
      uint64_t v9 = ++v8 - 4;
      if ((rawValue & 0xC000000000000001) == 0) {
        goto LABEL_12;
      }
    }
LABEL_19:
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  if (v7) {
    goto LABEL_8;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  os_log_type_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "smsfilter: sub-classification feature is not available", v16, 2u);
    swift_slowDealloc();
  }

  v13.super.isa = (Class)[objc_allocWithZone((Class)ILMessageFilterCapabilitiesQueryResponse) init];
LABEL_25:
  ((void (**)(void, Class))a1)[2](a1, v13.super.isa);
}

uint64_t specialized MessageFilterExtension.offlineAction(for:)(void *a1)
{
  if (one-time initialization token for logger == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v2 = type metadata accessor for Logger();
    __swift_project_value_buffer(v2, (uint64_t)logger);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "smsfilter: offlineAction", v5, 2u);
      swift_slowDealloc();
    }

    id v6 = [a1 messageBody];
    if (!v6) {
      return 1;
    }
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    id v11 = [a1 sender];
    if (!v11) {
      goto LABEL_27;
    }
    uint64_t v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    os_log_type_t v15 = v14;

    id v16 = [a1 receiverISOCountryCode];
    if (!v16)
    {
      swift_bridgeObjectRelease();
LABEL_27:
      swift_bridgeObjectRelease();
      return 1;
    }
    uint64_t v17 = v16;
    uint64_t v40 = v13;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a1 = v19;

    uint64_t v20 = one-time initialization token for _smsfilters;
    swift_bridgeObjectRetain();
    if (v20 != -1) {
      swift_once();
    }
    swift_beginAccess();
    unint64_t rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62) {
      break;
    }
    uint64_t v22 = *(void *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v22) {
      goto LABEL_35;
    }
LABEL_11:
    uint64_t v37 = v8;
    uint64_t v38 = v15;
    BOOL v39 = v10;
    uint64_t v23 = 4;
    uint64_t v24 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_15:
      uint64_t v25 = *(void *)(rawValue + 8 * v23);
      swift_retain();
      uint64_t v26 = v24 + 1;
      if (__OFADD__(v24, 1)) {
        goto LABEL_32;
      }
      goto LABEL_16;
    }
    while (1)
    {
      uint64_t v25 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v26 = v24 + 1;
      if (__OFADD__(v24, 1)) {
        break;
      }
LABEL_16:
      os_log_type_t v27 = (void *)(v25 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
      swift_beginAccess();
      outlined init with take of Region?((uint64_t)v27, (uint64_t)v41);
      outlined init with take of Region?((uint64_t)v41, (uint64_t)v42);
      uint64_t result = _s15extensionFilter6RegionVSgWOg((uint64_t)v42);
      if (result == 1)
      {
        __break(1u);
        return result;
      }
      BOOL v29 = *v27 == v18 && v27[1] == (void)a1;
      if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        Swift::UInt v30 = SmsFilter.classifyAction(sender:messageBody:)(v40, v38, v37, v39);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return v30;
      }
      swift_release();
      if (v26 == v22) {
        goto LABEL_35;
      }
      uint64_t v24 = ++v23 - 4;
      if ((rawValue & 0xC000000000000001) == 0) {
        goto LABEL_15;
      }
    }
LABEL_32:
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
  if (v22) {
    goto LABEL_11;
  }
LABEL_35:
  swift_bridgeObjectRelease();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "smsfilter: no smsfilter is found for sim region", v33, 2u);
    swift_slowDealloc();
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v34, v35))
  {

    swift_bridgeObjectRelease_n();
    return 1;
  }
  unint64_t v36 = (uint8_t *)swift_slowAlloc();
  v42[0] = swift_slowAlloc();
  *(_DWORD *)unint64_t v36 = 136315138;
  swift_bridgeObjectRetain();
  v41[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, (unint64_t)a1, v42);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v34, v35, "smsfilter: no smsfilter found for - %s", v36, 0xCu);
  Swift::UInt v30 = 1;
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  return v30;
}

uint64_t type metadata accessor for MessageFilterExtension()
{
  return self;
}

void specialized MessageFilterExtension.handle(_:context:completion:)(void *a1, uint64_t a2)
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)logger);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "smsfilter: queryRequest", v7, 2u);
    swift_slowDealloc();
  }

  unint64_t v8 = specialized MessageFilterExtension.offlineAction(for:)(a1);
  uint64_t v10 = v9;
  id v17 = [objc_allocWithZone((Class)ILMessageFilterQueryResponse) init];
  [v17 setSubAction:0];
  if ((unint64_t)(v10 - 10001) >= 3 && v10)
  {
    os_log_type_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "unexpected offline sub-action", v16, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    [v17 setSubAction:v10];
  }
  if (v8 > 4)
  {
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v11, v12)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (((1 << v8) & 0x1A) != 0)
  {
    [v17 setAction:v8];
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v17);
    goto LABEL_14;
  }
  id v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
LABEL_12:
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "unexpected offline action", v13, 2u);
    swift_slowDealloc();
  }
LABEL_13:

LABEL_14:
}

uint64_t *outlined release of Region?(uint64_t *a1)
{
  return a1;
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t static CharacterSet.decimalDigits.getter()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t static CharacterSet.letters.getter()
{
  return static CharacterSet.letters.getter();
}

uint64_t CharacterSet.inverted.getter()
{
  return CharacterSet.inverted.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t DateComponents.second.getter()
{
  return DateComponents.second.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter()
{
  return ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter();
}

uint64_t NLModel.predictedLabelHypotheses(for:maximumCount:)()
{
  return NLModel.predictedLabelHypotheses(for:maximumCount:)();
}

uint64_t _NSRange.init<A, B>(_:in:)()
{
  return _NSRange.init<A, B>(_:in:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.rangeOfCharacter(from:options:range:)()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addUpdateHandlerForNamespaceName:usingBlock:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_basicModel(void *a1, const char *a2, ...)
{
  return _[a1 basicModel];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_clientWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 clientWithIdentifier:];
}

id objc_msgSend_compileSpecificationAtURL_toURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 compileSpecificationAtURL:toURL:options:error:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtPath:toPath:error:];
}

id objc_msgSend_copyMobileSubscriberCountryCode_error_(void *a1, const char *a2, ...)
{
  return [a1 copyMobileSubscriberCountryCode:error:];
}

id objc_msgSend_copyMobileSubscriberIsoCountryCode_error_(void *a1, const char *a2, ...)
{
  return [a1 copyMobileSubscriberIsoCountryCode:error:];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return _[a1 defaultOptions];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_experimentIdWithNamespaceName_(void *a1, const char *a2, ...)
{
  return [a1 experimentIdWithNamespaceName:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:isDirectory:];
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPathComponents:];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return _[a1 fileValue];
}

id objc_msgSend_findForSlot_(void *a1, const char *a2, ...)
{
  return [a1 findForSlot:];
}

id objc_msgSend_getActiveContexts_(void *a1, const char *a2, ...)
{
  return [a1 getActiveContexts:];
}

id objc_msgSend_getRegexFileNameWithPath(void *a1, const char *a2, ...)
{
  return _[a1 getRegexFileNameWithPath];
}

id objc_msgSend_initWithDefaultsDomain_(void *a1, const char *a2, ...)
{
  return [a1 initWithDefaultsDomain:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return _[a1 isAbsolutePath];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_levelForFactor_withNamespaceName_(void *a1, const char *a2, ...)
{
  return [a1 levelForFactor:withNamespaceName:];
}

id objc_msgSend_loadModelFromPath_deleteExistingFiles_(void *a1, const char *a2, ...)
{
  return [a1 loadModelFromPath:deleteExistingFiles:];
}

id objc_msgSend_loadTrialBasicModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return [a1 loadTrialBasicModelByDeletingExistingModel];
}

id objc_msgSend_loadTrialMainModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return [a1 loadTrialMainModelByDeletingExistingModel];
}

id objc_msgSend_loadTrialModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return [a1 loadTrialModelByDeletingExistingModel];
}

id objc_msgSend_loadTrialModelTransitionTimer(void *a1, const char *a2, ...)
{
  return _[a1 loadTrialModelTransitionTimer];
}

id objc_msgSend_loadTrialPromoThreshold(void *a1, const char *a2, ...)
{
  return _[a1 loadTrialPromoThreshold];
}

id objc_msgSend_loadTrialSubClassificationModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return [a1 loadTrialSubClassificationModelByDeletingExistingModel:];
}

id objc_msgSend_loadTrialTransThreshold(void *a1, const char *a2, ...)
{
  return _[a1 loadTrialTransThreshold];
}

id objc_msgSend_loadTrialUpdates(void *a1, const char *a2, ...)
{
  return _[a1 loadTrialUpdates];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainModel(void *a1, const char *a2, ...)
{
  return _[a1 mainModel];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return _[a1 modelDescription];
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return [a1 modelWithContentsOfURL:error:];
}

id objc_msgSend_namespaceNameFromId_(void *a1, const char *a2, ...)
{
  return [a1 namespaceNameFromId:];
}

id objc_msgSend_newTrackingId(void *a1, const char *a2, ...)
{
  return _[a1 newTrackingId];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return [a1 pathWithComponents:];
}

id objc_msgSend_prepareForTrialParamsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 prepareForTrialParamsUpdate];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_setNewModelUpdateAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setNewModelUpdateAvailable:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subClassificationModel(void *a1, const char *a2, ...)
{
  return _[a1 subClassificationModel];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDirectory];
}

id objc_msgSend_treatmentIdWithNamespaceName_(void *a1, const char *a2, ...)
{
  return [a1 treatmentIdWithNamespaceName];
}

id objc_msgSend_trialClient(void *a1, const char *a2, ...)
{
  return _[a1 trialClient];
}

id objc_msgSend_trialFactor_(void *a1, const char *a2, ...)
{
  return [a1 trialFactor:];
}

id objc_msgSend_trialManager(void *a1, const char *a2, ...)
{
  return _[a1 trialManager];
}

id objc_msgSend_trialNamespaceName(void *a1, const char *a2, ...)
{
  return _[a1 trialNamespaceName];
}