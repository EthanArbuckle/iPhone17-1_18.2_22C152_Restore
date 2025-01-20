void sub_32DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_372C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_39A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _IMIDSForceSetDelegate(void *a1, const char *a2)
{
  return [a1 setDelegate:a2];
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke(uint64_t a1)
{
  IDSLibrary();
  Class result = objc_getClass("IDSOffGridDeliveryHandlesDonationOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke_cold_1();
  }
  getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void IDSLibrary()
{
  v0[0] = 0;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    v0[1] = _NSConcreteStackBlock;
    v0[2] = (void *)3221225472;
    v0[3] = __IDSLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = off_554E0;
    uint64_t v2 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IDSLibraryCore_frameworkLibrary) {
    IDSLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __IDSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IDSLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getIDSOffGridServiceUpdateMessageClass_block_invoke(uint64_t a1)
{
  IDSLibrary();
  Class result = objc_getClass("IDSOffGridServiceUpdateMessage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getIDSOffGridServiceUpdateMessageClass_block_invoke_cold_1();
  }
  getIDSOffGridServiceUpdateMessageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t protocol witness for Error._domain.getter in conformance LiteMessageReceiveError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance LiteMessageReceiveError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance LiteMessageReceiveError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance LiteMessageReceiveError()
{
  return Error._getEmbeddedNSError()();
}

unint64_t LiteMessageReceiveError.errorDescription.getter(uint64_t a1, unint64_t a2, char a3)
{
  if (!a3)
  {
    _StringGuts.grow(_:)(34);
    swift_bridgeObjectRelease();
    unint64_t v14 = 0xD00000000000001FLL;
    v11._countAndFlagsBits = a1;
    v11._object = (void *)a2;
    String.append(_:)(v11);
    uint64_t v9 = 46;
    unint64_t v10 = 0xE100000000000000;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    unint64_t v14 = 0;
    _StringGuts.grow(_:)(58);
    v5._object = (void *)0x80000000000484E0;
    v5._countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v5);
    v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    v7._countAndFlagsBits = 0xD000000000000020;
    v7._object = (void *)0x8000000000048500;
    String.append(_:)(v7);
    v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    uint64_t v9 = 11817;
    unint64_t v10 = 0xE200000000000000;
LABEL_5:
    String.append(_:)(*(Swift::String *)&v9);
    return v14;
  }
  unint64_t v13 = 0xD000000000000031;
  if (!(a1 ^ 1 | a2)) {
    unint64_t v13 = 0xD00000000000002ELL;
  }
  if (a1 | a2) {
    return v13;
  }
  else {
    return 0xD000000000000040;
  }
}

unint64_t lazy protocol witness table accessor for type LiteMessageReceiveError and conformance LiteMessageReceiveError()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageReceiveError and conformance LiteMessageReceiveError;
  if (!lazy protocol witness table cache variable for type LiteMessageReceiveError and conformance LiteMessageReceiveError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageReceiveError and conformance LiteMessageReceiveError);
  }
  return result;
}

unint64_t protocol witness for LocalizedError.errorDescription.getter in conformance LiteMessageReceiveError()
{
  return LiteMessageReceiveError.errorDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance LiteMessageReceiveError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance LiteMessageReceiveError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance LiteMessageReceiveError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t outlined copy of LiteMessageReceiveError(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for LiteMessageReceiveError(uint64_t a1)
{
  return outlined consume of LiteMessageReceiveError(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t outlined consume of LiteMessageReceiveError(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LiteMessageReceiveError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of LiteMessageReceiveError(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LiteMessageReceiveError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of LiteMessageReceiveError(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of LiteMessageReceiveError(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LiteMessageReceiveError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of LiteMessageReceiveError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessageReceiveError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteMessageReceiveError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for LiteMessageReceiveError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t destructiveInjectEnumTag for LiteMessageReceiveError(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageReceiveError()
{
  return &type metadata for LiteMessageReceiveError;
}

void IMDChat.participantURI.getter()
{
  if ([v0 style] != 45) {
    return;
  }
  id v1 = [v0 participants];
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDHandle);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  }
  swift_bridgeObjectRelease();
  if (v4 != 1) {
    return;
  }
  id v5 = [v0 participants];
  if (!v5) {
    return;
  }
  char v6 = v5;
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_9;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_16;
  }
LABEL_9:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v8 = *(id *)(v7 + 32);
  }
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  id v10 = [v9 ID];

  if (v10)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v11 = objc_allocWithZone((Class)IDSURI);
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v11 initWithUnprefixedURI:v12];
  }
}

uint64_t IMDChat.bestSendingHandle.getter()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  char v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v76 - v7;
  id v9 = [v1 participants];
  if (!v9) {
    goto LABEL_26;
  }
  id v10 = v9;
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDHandle);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v11 >> 62))
  {
    id isa = *(id *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    if (isa) {
      goto LABEL_4;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  id isa = (id)_CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!isa) {
    goto LABEL_25;
  }
LABEL_4:
  if ((v11 & 0xC000000000000001) != 0)
  {
    id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
LABEL_30:
      unint64_t v48 = swift_bridgeObjectRetain();
      uint64_t v25 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v48);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    id v13 = *(id *)(v11 + 32);
  }
  id isa = v13;
  swift_bridgeObjectRelease();
  id v14 = [isa ID];

  if (!v14)
  {
LABEL_26:
    id v46 = [v1 lastAddressedLocalHandle];
    if (!v46) {
      return 0;
    }
LABEL_27:
    v47 = v46;
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    return v31;
  }
  uint64_t v78 = v3;
  uint64_t v79 = v2;
  uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v80 = v15;

  id v16 = [self sharedInstance];
  id v17 = [v1 chatIdentifier];
  if (!v17)
  {
LABEL_47:
    __break(1u);
LABEL_48:

    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_49;
  }
  v18 = v17;
  id v19 = [v1 style];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  long long v76 = xmmword_46FA0;
  *(_OWORD *)(inited + 16) = xmmword_46FA0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v21;
  *(void *)(inited + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 56) = v22;
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  id isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v23 = [v16 allChatsWithIdentifier:v18 style:v19 serviceNames:isa];

  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDChat);
  uint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v24 < 0 || (v24 & 0x4000000000000000) != 0) {
    goto LABEL_30;
  }
  uint64_t v25 = v24 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
LABEL_12:
  uint64_t v82 = v25;
  specialized MutableCollection<>.sort(by:)(&v82);
  swift_bridgeObjectRelease();
  uint64_t v26 = v82;
  if ((v82 & 0x8000000000000000) == 0 && (v82 & 0x4000000000000000) == 0)
  {
    if (*(void *)(v82 + 16)) {
      goto LABEL_15;
    }
LABEL_32:
    swift_release();
    goto LABEL_33;
  }
  swift_bridgeObjectRetain();
  uint64_t v49 = _CocoaArrayWrapper.endIndex.getter();
  swift_release();
  if (!v49) {
    goto LABEL_32;
  }
LABEL_15:
  if ((v26 & 0xC000000000000001) != 0)
  {
    id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_18;
  }
  if (!*(void *)(v26 + 16))
  {
    __break(1u);
    goto LABEL_47;
  }
  id v27 = *(id *)(v26 + 32);
LABEL_18:
  v28 = v27;
  swift_release();
  id v29 = [v28 lastAddressedLocalHandle];
  if (v29)
  {
    v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v33 = v32;

    uint64_t v34 = Logger.liteSession.unsafeMutableAddressor();
    uint64_t v36 = v78;
    uint64_t v35 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v8, v34, v79);
    id v37 = v28;
    swift_bridgeObjectRetain_n();
    id isa = v37;
    v38 = Logger.logObject.getter();
    int v39 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v38, (os_log_type_t)v39))
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v35);
      return v31;
    }
    LODWORD(v80) = v39;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v77 = swift_slowAlloc();
    uint64_t v82 = v77;
    *(_DWORD *)uint64_t v40 = 136315394;
    id v41 = [isa guid];
    if (v41)
    {
      v42 = v41;
      uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v45 = v44;

      uint64_t v81 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v45, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v81 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v33, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v38, (os_log_type_t)v80, "Best sending handle selected from chat %s as %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v78 + 8))(v8, v79);
      return v31;
    }
    goto LABEL_48;
  }

LABEL_33:
  id v50 = [self sharedInstance];
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_46FB0;
  uint64_t v52 = v80;
  *(void *)(v51 + 32) = v77;
  *(void *)(v51 + 40) = v52;
  Class v53 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = v76;
  *(void *)(v54 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v54 + 40) = v55;
  *(void *)(v54 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v54 + 56) = v56;
  Class v57 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v58 = [v50 lastMessageWithHandles:v53 onServices:v57];

  if (!v58) {
    goto LABEL_40;
  }
  id v59 = [v58 destinationCallerID];
  if (!v59)
  {

LABEL_40:
    id v46 = [v1 lastAddressedLocalHandle];
    if (!v46) {
      return 0;
    }
    goto LABEL_27;
  }
  v60 = v59;
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v62 = v61;

  uint64_t v63 = Logger.liteSession.unsafeMutableAddressor();
  uint64_t v65 = v78;
  uint64_t v64 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v6, v63, v79);
  id v66 = v58;
  swift_bridgeObjectRetain_n();
  id v8 = (char *)v66;
  v67 = Logger.logObject.getter();
  int v68 = static os_log_type_t.info.getter();
  if (!os_log_type_enabled(v67, (os_log_type_t)v68))
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v6, v64);
    return v31;
  }
  LODWORD(v80) = v68;
  uint64_t v69 = swift_slowAlloc();
  uint64_t v77 = swift_slowAlloc();
  uint64_t v82 = v77;
  *(_DWORD *)uint64_t v69 = 136315394;
  id v70 = [v8 guid];
  if (v70)
  {
    v71 = v70;
    uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v74 = v73;

    uint64_t v81 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v72, v74, &v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v69 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v81 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v62, &v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v67, (os_log_type_t)v80, "Best sending handle selected from most recent message %s as %s", (uint8_t *)v69, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v78 + 8))(v6, v79);
    return v31;
  }
LABEL_49:

  swift_bridgeObjectRelease();
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

Swift::Void __swiftcall IMDChat.updateLastAddressedHandleWithMatchingSIM(to:)(Swift::String to)
{
  uint64_t v2 = v1;
  object = to._object;
  uint64_t countAndFlagsBits = to._countAndFlagsBits;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = countAndFlagsBits;
  NSString v9 = String._bridgeToObjectiveC()();
  [v2 updateLastAddressedHandle:v9 forceUpdate:0];

  id v10 = [self sharedInstance];
  id v11 = [v10 ctSubscriptionInfo];
  if (!v11) {
    goto LABEL_8;
  }
  NSString v12 = v11;
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = objc_msgSend(v12, "__im_subscriptionContextForPhoneNumber:", v13);

  if (!v14) {
    goto LABEL_8;
  }
  id v15 = [v14 labelID];

  if (!v15) {
    goto LABEL_8;
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  id v19 = [v10 registeredSIMIDs];
  v20 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v19) = specialized Sequence<>.contains(_:)(v16, v18, v20);
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_8:

    goto LABEL_9;
  }

  if (v18)
  {
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_9:
  NSString v21 = 0;
LABEL_10:
  [v2 updateLastAddressedSIMID:v21];

  uint64_t v22 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v22, v5);
  id v23 = v2;
  swift_bridgeObjectRetain_n();
  id v24 = v23;
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v25, v26))
  {
    int v39 = v8;
    uint64_t v40 = v6;
    uint64_t v41 = v5;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315650;
    id v28 = [v24 guid];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v32 = v31;

      uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v32, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, (unint64_t)object, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 22) = 2080;
      id v33 = [v24 lastAddressedSIMID];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v37 = v36;
      }
      else
      {
        unint64_t v37 = 0xE300000000000000;
        uint64_t v35 = 7104878;
      }
      v38 = v39;
      uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v37, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v25, v26, "Updated chat %s last addressed handle to %s, SIM ID to %s", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v40 + 8))(v38, v41);
    }
    else
    {
      swift_bridgeObjectRelease();

      __break(1u);
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
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
  NSString v9 = a3 + 7;
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  NSString v13 = a4 + 32;
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

uint64_t specialized MutableCollection<>.sort(by:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v6);
  return specialized ContiguousArray._endMutation()();
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      unint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      unint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    specialized Array._copyContents(initializing:)((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

id specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  id result = (id)_minimumMergeRunLength(_:)(v4);
  Swift::Int v102 = v4;
  if ((uint64_t)result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v4 >= 2)
    {
      uint64_t v10 = (void *)*a1;
      uint64_t v11 = -1;
      uint64_t v12 = 1;
      NSString v13 = (void *)*a1;
      do
      {
        id result = (id)v10[v12];
        uint64_t v14 = v11;
        id v15 = v13;
        do
        {
          id result = [result isNewerThan:*v15];
          if (!result) {
            break;
          }
          if (!v10) {
            goto LABEL_141;
          }
          uint64_t v16 = *v15;
          id result = (id)v15[1];
          *id v15 = result;
          v15[1] = v16;
          --v15;
        }
        while (!__CFADD__(v14++, 1));
        ++v12;
        ++v13;
        --v11;
      }
      while (v12 != v102);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_146;
  }
  uint64_t v7 = (uint64_t)result;
  v98 = a1;
  if (v4 < 2)
  {
    uint64_t v18 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v105 = (uint64_t)&_swiftEmptyArrayStorage;
    __dst = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v22 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_103:
      v90 = v18;
      if (v22 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v22 - 2;
          if (v22 < 2) {
            goto LABEL_132;
          }
          if (!v91) {
            goto LABEL_145;
          }
          v93 = v90;
          uint64_t v94 = *(void *)&v90[16 * v92 + 32];
          uint64_t v95 = *(void *)&v90[16 * v22 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v91 + 8 * v94), (char *)(v91 + 8 * *(void *)&v90[16 * v22 + 16]), v91 + 8 * v95, __dst);
          if (v2) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v93 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v93);
          }
          if (v92 >= *((void *)v93 + 2)) {
            goto LABEL_134;
          }
          v96 = &v93[16 * v92 + 32];
          *(void *)v96 = v94;
          *((void *)v96 + 1) = v95;
          unint64_t v97 = *((void *)v93 + 2);
          if (v22 > v97) {
            goto LABEL_135;
          }
          memmove(&v93[16 * v22 + 16], &v93[16 * v22 + 32], 16 * (v97 - v22));
          v90 = v93;
          *((void *)v93 + 2) = v97 - 1;
          unint64_t v22 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_100:
      swift_bridgeObjectRelease();
      *(void *)((char *)&dword_10 + (v105 & 0xFFFFFFFFFFFFFF8)) = 0;
      specialized Array._endMutation()();
      return (id)swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDChat);
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)) = v8;
    __dst = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v105 = v9;
  }
  uint64_t v101 = v7;
  Swift::Int v19 = 0;
  uint64_t v20 = *a1;
  uint64_t v99 = *a1 - 8;
  uint64_t v100 = *a1 + 16;
  uint64_t v18 = (char *)&_swiftEmptyArrayStorage;
  NSString v21 = &selRef_currentHandler;
  while (1)
  {
    Swift::Int v23 = v19++;
    if (v19 < v4)
    {
      unsigned int v24 = objc_msgSend(*(id *)(v20 + 8 * v19), v21[63], *(void *)(v20 + 8 * v23));
      Swift::Int v19 = v23 + 2;
      if (v23 + 2 < v4)
      {
        uint64_t v25 = (id *)(v100 + 8 * v23);
        while (v24 == objc_msgSend(*v25, v21[63], *(v25 - 1)))
        {
          ++v19;
          ++v25;
          if (v4 == v19)
          {
            Swift::Int v19 = v4;
            break;
          }
        }
      }
      if (v24)
      {
        if (v19 < v23) {
          goto LABEL_138;
        }
        if (v23 < v19)
        {
          os_log_type_t v26 = (uint64_t *)(v99 + 8 * v19);
          Swift::Int v27 = v19;
          Swift::Int v28 = v23;
          id v29 = (uint64_t *)(v20 + 8 * v23);
          do
          {
            if (v28 != --v27)
            {
              if (!v20) {
                goto LABEL_144;
              }
              uint64_t v30 = *v29;
              *id v29 = *v26;
              *os_log_type_t v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v19 >= v4) {
      goto LABEL_52;
    }
    if (__OFSUB__(v19, v23)) {
      goto LABEL_136;
    }
    if (v19 - v23 >= v101) {
      goto LABEL_52;
    }
    if (__OFADD__(v23, v101)) {
      goto LABEL_139;
    }
    if (v23 + v101 < v4) {
      Swift::Int v4 = v23 + v101;
    }
    if (v4 < v23) {
      break;
    }
    if (v19 != v4)
    {
      unint64_t v31 = (void *)(v99 + 8 * v19);
      do
      {
        unint64_t v32 = *(void **)(v20 + 8 * v19);
        Swift::Int v33 = v23;
        uint64_t v34 = v31;
        do
        {
          if (!objc_msgSend(v32, v21[63], *v34)) {
            break;
          }
          if (!v20) {
            goto LABEL_142;
          }
          uint64_t v35 = *v34;
          unint64_t v32 = (void *)v34[1];
          *uint64_t v34 = v32;
          v34[1] = v35;
          --v34;
          ++v33;
        }
        while (v19 != v33);
        ++v19;
        ++v31;
      }
      while (v19 != v4);
      Swift::Int v19 = v4;
    }
LABEL_52:
    if (v19 < v23) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v18 + 2) + 1, 1, v18);
    }
    unint64_t v37 = *((void *)v18 + 2);
    unint64_t v36 = *((void *)v18 + 3);
    unint64_t v22 = v37 + 1;
    if (v37 >= v36 >> 1) {
      uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v36 > 1), v37 + 1, 1, v18);
    }
    *((void *)v18 + 2) = v22;
    v38 = v18 + 32;
    int v39 = &v18[16 * v37 + 32];
    *(void *)int v39 = v23;
    *((void *)v39 + 1) = v19;
    if (v37)
    {
      Swift::Int v103 = v19;
      while (1)
      {
        unint64_t v40 = v22 - 1;
        if (v22 >= 4)
        {
          unint64_t v45 = &v38[16 * v22];
          uint64_t v46 = *((void *)v45 - 8);
          uint64_t v47 = *((void *)v45 - 7);
          BOOL v51 = __OFSUB__(v47, v46);
          uint64_t v48 = v47 - v46;
          if (v51) {
            goto LABEL_120;
          }
          uint64_t v50 = *((void *)v45 - 6);
          uint64_t v49 = *((void *)v45 - 5);
          BOOL v51 = __OFSUB__(v49, v50);
          uint64_t v43 = v49 - v50;
          char v44 = v51;
          if (v51) {
            goto LABEL_121;
          }
          unint64_t v52 = v22 - 2;
          Class v53 = &v38[16 * v22 - 32];
          uint64_t v55 = *(void *)v53;
          uint64_t v54 = *((void *)v53 + 1);
          BOOL v51 = __OFSUB__(v54, v55);
          uint64_t v56 = v54 - v55;
          if (v51) {
            goto LABEL_123;
          }
          BOOL v51 = __OFADD__(v43, v56);
          uint64_t v57 = v43 + v56;
          if (v51) {
            goto LABEL_126;
          }
          if (v57 >= v48)
          {
            v75 = &v38[16 * v40];
            uint64_t v77 = *(void *)v75;
            uint64_t v76 = *((void *)v75 + 1);
            BOOL v51 = __OFSUB__(v76, v77);
            uint64_t v78 = v76 - v77;
            if (v51) {
              goto LABEL_130;
            }
            BOOL v68 = v43 < v78;
            goto LABEL_90;
          }
        }
        else
        {
          if (v22 != 3)
          {
            uint64_t v69 = *((void *)v18 + 4);
            uint64_t v70 = *((void *)v18 + 5);
            BOOL v51 = __OFSUB__(v70, v69);
            uint64_t v62 = v70 - v69;
            char v63 = v51;
            goto LABEL_84;
          }
          uint64_t v42 = *((void *)v18 + 4);
          uint64_t v41 = *((void *)v18 + 5);
          BOOL v51 = __OFSUB__(v41, v42);
          uint64_t v43 = v41 - v42;
          char v44 = v51;
        }
        if (v44) {
          goto LABEL_122;
        }
        unint64_t v52 = v22 - 2;
        id v58 = &v38[16 * v22 - 32];
        uint64_t v60 = *(void *)v58;
        uint64_t v59 = *((void *)v58 + 1);
        BOOL v61 = __OFSUB__(v59, v60);
        uint64_t v62 = v59 - v60;
        char v63 = v61;
        if (v61) {
          goto LABEL_125;
        }
        uint64_t v64 = &v38[16 * v40];
        uint64_t v66 = *(void *)v64;
        uint64_t v65 = *((void *)v64 + 1);
        BOOL v51 = __OFSUB__(v65, v66);
        uint64_t v67 = v65 - v66;
        if (v51) {
          goto LABEL_128;
        }
        if (__OFADD__(v62, v67)) {
          goto LABEL_129;
        }
        if (v62 + v67 >= v43)
        {
          BOOL v68 = v43 < v67;
LABEL_90:
          if (v68) {
            unint64_t v40 = v52;
          }
          goto LABEL_92;
        }
LABEL_84:
        if (v63) {
          goto LABEL_124;
        }
        v71 = &v38[16 * v40];
        uint64_t v73 = *(void *)v71;
        uint64_t v72 = *((void *)v71 + 1);
        BOOL v51 = __OFSUB__(v72, v73);
        uint64_t v74 = v72 - v73;
        if (v51) {
          goto LABEL_127;
        }
        if (v74 < v62) {
          goto LABEL_21;
        }
LABEL_92:
        unint64_t v79 = v40 - 1;
        if (v40 - 1 >= v22)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v20) {
          goto LABEL_143;
        }
        uint64_t v80 = v18;
        uint64_t v81 = v20;
        uint64_t v82 = &v38[16 * v79];
        uint64_t v83 = *(void *)v82;
        v84 = v38;
        unint64_t v85 = v40;
        v86 = &v38[16 * v40];
        uint64_t v87 = *((void *)v86 + 1);
        uint64_t v88 = v81;
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v81 + 8 * *(void *)v82), (char *)(v81 + 8 * *(void *)v86), v81 + 8 * v87, __dst);
        if (v1) {
          goto LABEL_100;
        }
        if (v87 < v83) {
          goto LABEL_117;
        }
        if (v85 > *((void *)v80 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v82 = v83;
        *(void *)&v84[16 * v79 + 8] = v87;
        unint64_t v89 = *((void *)v80 + 2);
        if (v85 >= v89) {
          goto LABEL_119;
        }
        uint64_t v18 = v80;
        unint64_t v22 = v89 - 1;
        memmove(v86, v86 + 16, 16 * (v89 - 1 - v85));
        v38 = v84;
        *((void *)v80 + 2) = v89 - 1;
        uint64_t v20 = v88;
        NSString v21 = &selRef_currentHandler;
        Swift::Int v19 = v103;
        if (v89 <= 2) {
          goto LABEL_21;
        }
      }
    }
    unint64_t v22 = 1;
LABEL_21:
    Swift::Int v4 = v102;
    if (v19 >= v102)
    {
      uint64_t v2 = v1;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__src, char *a2, unint64_t a3, char *__dst)
{
  Swift::Int v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  unsigned int v24 = __src;
  Swift::Int v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v16 = &v4[8 * v13];
      unint64_t v22 = v16;
      unsigned int v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v17 = (char *)(a3 - 8);
        uint64_t v18 = v6;
        while (1)
        {
          Swift::Int v19 = v17 + 8;
          uint64_t v20 = *((void *)v18 - 1);
          v18 -= 8;
          if ([*((id *)v16 - 1) isNewerThan:v20])
          {
            if (v19 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = *(void *)v18;
            }
            unsigned int v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            unint64_t v22 = v16 - 8;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            uint64_t v18 = v6;
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    unint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if ([*(id *)v6 isNewerThan:*(void *)v4])
        {
          id v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        else
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          Swift::Int v23 = v4;
          id v15 = v6;
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      unsigned int v24 = v7;
    }
LABEL_42:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
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
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
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

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*specialized protocol witness for Collection.subscript.read in conformance [A](void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*specialized Array.subscript.read(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)unint64_t v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

void Array.subscript.readspecialized (id *a1)
{
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

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        lazy protocol witness table accessor for type [IMDChat] and conformance [A]();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [IMDChat]);
          uint64_t v12 = specialized protocol witness for Collection.subscript.read in conformance [A](v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDChat);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          Swift::Int v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      NSString v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *NSString v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t type metadata accessor for IMDHandle(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type [IMDChat] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [IMDChat] and conformance [A];
  if (!lazy protocol witness table cache variable for type [IMDChat] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [IMDChat]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [IMDChat] and conformance [A]);
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

Swift::Void __swiftcall LiteMessageServiceSession.donateHandlesForKeyExchange()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  type metadata accessor for MainActor();
  id v5 = v0;
  uint64_t v6 = static MainActor.shared.getter();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = &protocol witness table for MainActor;
  v7[4] = v5;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange(), (uint64_t)v7);
  swift_release();
}

uint64_t closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  id v5 = (void *)swift_task_alloc();
  v4[5] = v5;
  *id v5 = v4;
  v5[1] = closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return LiteMessageServiceSession.donateInitialHandlesIfNeeded()();
}

uint64_t closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 48) = v3;
  *uint64_t v3 = v2;
  v3[1] = closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return LiteMessageServiceSession.donateEmergencyHandles()();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;

  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v3;
  *uint64_t v3 = v2;
  v3[1] = closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return LiteMessageServiceSession.donateFamilyHandles()();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange(), v1, v0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange()()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange()((uint64_t)v3, v4, v5, v2);
}

uint64_t LiteMessageServiceSession.donateInitialHandlesIfNeeded()()
{
  v1[10] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[17] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[18] = v4;
  v1[19] = v3;
  return _swift_task_switch(LiteMessageServiceSession.donateInitialHandlesIfNeeded(), v4, v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  NSString v39;
  uint64_t v40;
  NSString v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;

  char v63 = v0;
  if (donating)
  {
    uint64_t v2 = v0[12];
    uint64_t v1 = v0[13];
    uint64_t v3 = v0[11];
    swift_release();
    uint64_t v4 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
    uint64_t v5 = Logger.logObject.getter();
    uint64_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&def_3494C, v5, v6, "Already donating", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[12];
    uint64_t v8 = v0[13];
    uint64_t v10 = v0[11];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    goto LABEL_5;
  }
  uint64_t v13 = IDSCopyLocalDeviceUniqueID();
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    BOOL v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    BOOL v17 = 0;
  }
  v0[20] = v15;
  v0[21] = v17;
  uint64_t v18 = String._bridgeToObjectiveC()();
  Swift::Int v19 = String._bridgeToObjectiveC()();
  uint64_t v20 = IMGetDomainIntForKey();

  if (v20 == 2)
  {
    NSString v21 = specialized LiteMessageServiceSession.lastDonationDeviceIdentifier.getter();
    if (v22)
    {
      if (v17)
      {
        if (v21 == v15 && v22 == v17)
        {
          swift_bridgeObjectRelease();
LABEL_21:
          swift_release();
          swift_bridgeObjectRelease();
LABEL_22:
          uint64_t v24 = v0[14];
          uint64_t v25 = v0[11];
          os_log_type_t v26 = v0[12];
          Swift::Int v27 = (void *)v0[10];
          Swift::Int v28 = Logger.donations.unsafeMutableAddressor();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v28, v25);
          id v29 = v27;
          uint64_t v30 = Logger.logObject.getter();
          unint64_t v31 = static os_log_type_t.default.getter();
          unint64_t v32 = os_log_type_enabled(v30, v31);
          Swift::Int v33 = v0[14];
          uint64_t v35 = v0[11];
          uint64_t v34 = v0[12];
          unint64_t v36 = (void *)v0[10];
          if (v32)
          {
            BOOL v61 = v0[11];
            unint64_t v37 = swift_slowAlloc();
            uint64_t v62 = swift_slowAlloc();
            *(_DWORD *)unint64_t v37 = 134218242;
            v38 = v30;
            int v39 = String._bridgeToObjectiveC()();
            unint64_t v40 = v33;
            uint64_t v41 = String._bridgeToObjectiveC()();
            uint64_t v42 = IMGetDomainIntForKey();

            v0[8] = v42;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            *(_WORD *)(v37 + 12) = 2080;
            v0[4] = specialized LiteMessageServiceSession.lastDonationDeviceIdentifier.getter();
            v0[5] = v43;
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
            char v44 = String.init<A>(describing:)();
            v0[9] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, &v62);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            _os_log_impl(&def_3494C, v38, v31, "Skipping handle donation, already complete with version %ld from device %s", (uint8_t *)v37, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v40, v61);
          }
          else
          {

            (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
          }
LABEL_5:
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          unint64_t v11 = (uint64_t (*)(void))v0[1];
          return v11();
        }
        BOOL v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v23) {
          goto LABEL_21;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else if (!v17)
    {
      swift_release();
      goto LABEL_22;
    }
  }
  uint64_t v46 = v0[16];
  uint64_t v47 = v0[11];
  uint64_t v48 = v0[12];
  uint64_t v49 = Logger.donations.unsafeMutableAddressor();
  v0[22] = v49;
  uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  v0[23] = v50;
  v0[24] = (v48 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v50(v46, v49, v47);
  BOOL v51 = Logger.logObject.getter();
  unint64_t v52 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v51, v52))
  {
    Class v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Class v53 = 0;
    _os_log_impl(&def_3494C, v51, v52, "Donating initial handles to IDS", v53, 2u);
    swift_slowDealloc();
  }
  uint64_t v54 = v0[16];
  uint64_t v55 = v0[11];
  uint64_t v56 = v0[12];

  uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  v0[25] = v57;
  v0[26] = (v56 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v57(v54, v55);
  donating = 1;
  specialized LiteMessageServiceSession.lastAddressedHandleToRecentHandles()();
  uint64_t v59 = v58;
  v0[27] = v58;
  uint64_t v60 = (void *)swift_task_alloc();
  v0[28] = v60;
  void *v60 = v0;
  v60[1] = LiteMessageServiceSession.donateInitialHandlesIfNeeded();
  return LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:)(v59, 0, 1);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 152);
  uint64_t v3 = *(void *)(v1 + 144);
  return _swift_task_switch(LiteMessageServiceSession.donateInitialHandlesIfNeeded(), v3, v2);
}

{
  void *v0;
  uint64_t v1;
  NSString v2;
  NSString v3;
  NSString v4;
  NSString v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  os_log_type_t v26 = v0;
  uint64_t v1 = v0[21];
  swift_release();
  uint64_t v2 = String._bridgeToObjectiveC()();
  uint64_t v3 = String._bridgeToObjectiveC()();
  IMSetDomainIntForKey();

  swift_bridgeObjectRetain();
  uint64_t v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = String._bridgeToObjectiveC()();
  if (v1)
  {
    String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))v0[23];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[15];
  uint64_t v9 = v0[11];
  IMSetDomainValueForKey();
  swift_unknownObjectRelease();

  v6(v8, v7, v9);
  swift_bridgeObjectRetain();
  uint64_t v10 = Logger.logObject.getter();
  unint64_t v11 = static os_log_type_t.default.getter();
  unint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[25];
  if (v12)
  {
    uint64_t v15 = v0[20];
    uint64_t v14 = v0[21];
    BOOL v23 = v0[11];
    uint64_t v24 = v0[15];
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134218242;
    v0[6] = 2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v16 + 12) = 2080;
    v0[2] = v15;
    v0[3] = v14;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    BOOL v17 = String.init<A>(describing:)();
    v0[7] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v10, v11, "Updated donation version to %ld from device %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v13(v24, v23);
  }
  else
  {
    Swift::Int v19 = v0[15];
    uint64_t v20 = v0[11];
    swift_bridgeObjectRelease_n();

    v13(v19, v20);
  }
  donating = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  NSString v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t LiteMessageServiceSession.donateEmergencyHandles()()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[6] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[7] = v4;
  v1[8] = v3;
  return _swift_task_switch(LiteMessageServiceSession.donateEmergencyHandles(), v4, v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&def_3494C, v5, v6, "Donating emergency handles to IDS", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v10 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  unint64_t v11 = (void *)swift_task_alloc();
  v0[9] = v11;
  *unint64_t v11 = v0;
  v11[1] = LiteMessageServiceSession.donateEmergencyHandles();
  return specialized LiteMessageServiceSession.emergencyContactPhoneNumbers.getter();
}

{
  uint64_t *v0;
  void *v1;
  void *v2;
  uint64_t v4;

  uint64_t v1 = LiteMessageServiceSession.mapLastAddressedHandleToHandles(using:)(v0[10]);
  v0[11] = (uint64_t)v1;
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = LiteMessageServiceSession.donateEmergencyHandles();
  return LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:)((uint64_t)v1, 1, 0);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(LiteMessageServiceSession.donateEmergencyHandles(), v3, v2);
}

uint64_t LiteMessageServiceSession.donateEmergencyHandles()(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 56);
  return _swift_task_switch(LiteMessageServiceSession.donateEmergencyHandles(), v4, v3);
}

uint64_t LiteMessageServiceSession.donateFamilyHandles()()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[6] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[7] = v4;
  v1[8] = v3;
  return _swift_task_switch(LiteMessageServiceSession.donateFamilyHandles(), v4, v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&def_3494C, v5, v6, "Donating family handles to IDS", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v10 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  unint64_t v11 = (void *)swift_task_alloc();
  v0[9] = v11;
  *unint64_t v11 = v0;
  v11[1] = LiteMessageServiceSession.donateFamilyHandles();
  return specialized LiteMessageServiceSession.familyHandles.getter();
}

{
  uint64_t *v0;
  void *v1;
  void *v2;
  uint64_t v4;

  uint64_t v1 = LiteMessageServiceSession.mapLastAddressedHandleToHandles(using:)(v0[10]);
  v0[11] = (uint64_t)v1;
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = LiteMessageServiceSession.donateFamilyHandles();
  return LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:)((uint64_t)v1, 2, 0);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(LiteMessageServiceSession.donateFamilyHandles(), v3, v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LiteMessageServiceSession.donateFamilyHandles()(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 56);
  return _swift_task_switch(LiteMessageServiceSession.donateFamilyHandles(), v4, v3);
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 176) = a2;
  *(void *)(v4 + 184) = v3;
  *(unsigned char *)(v4 + 329) = a3;
  *(void *)(v4 + 168) = a1;
  uint64_t v5 = type metadata accessor for Logger();
  *(void *)(v4 + 192) = v5;
  *(void *)(v4 + 200) = *(void *)(v5 - 8);
  *(void *)(v4 + 208) = swift_task_alloc();
  *(void *)(v4 + 216) = swift_task_alloc();
  *(void *)(v4 + 224) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v4 + 232) = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v4 + 240) = v7;
  *(void *)(v4 + 248) = v6;
  return _swift_task_switch(LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:), v7, v6);
}

uint64_t LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:)()
{
  uint64_t v54 = v1;
  uint64_t v49 = (uint64_t *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 168);
  char v5 = *(unsigned char *)(v4 + 32);
  *(unsigned char *)(v1 + 330) = v5;
  uint64_t v6 = 1 << v5;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v10 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v16 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_49;
  }
  int64_t v17 = (unint64_t)((1 << *(unsigned char *)(v1 + 330)) + 63) >> 6;
  uint64_t v15 = *(void *)(v1 + 168);
  if (v16 < v17)
  {
    uint64_t v18 = v15 + 64;
    unint64_t v19 = *(void *)(v15 + 64 + 8 * v16);
    ++v9;
    if (v19) {
      goto LABEL_21;
    }
    int64_t v9 = v16 + 1;
    if (v16 + 1 >= v17) {
      goto LABEL_34;
    }
    unint64_t v19 = *(void *)(v18 + 8 * v9);
    if (v19) {
      goto LABEL_21;
    }
    int64_t v9 = v16 + 2;
    if (v16 + 2 >= v17) {
      goto LABEL_34;
    }
    unint64_t v19 = *(void *)(v18 + 8 * v9);
    if (v19)
    {
LABEL_21:
      unint64_t v8 = (v19 - 1) & v19;
      unint64_t v14 = __clz(__rbit64(v19)) + (v9 << 6);
      while (1)
      {
        *(void *)(v1 + 264) = v9;
        *(void *)(v1 + 272) = v8;
        NSString v21 = (uint64_t *)(*(void *)(v15 + 48) + 16 * v14);
        uint64_t v22 = *v21;
        unint64_t v23 = v21[1];
        unint64_t v2 = *(void *)(*(void *)(v15 + 56) + 8 * v14);
        *(void *)(v1 + 280) = v2;
        id v24 = objc_allocWithZone((Class)v10[452]);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        NSString v25 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        uint64_t v3 = (char *)[v24 initWithUnprefixedURI:v25];
        *(void *)(v1 + 288) = v3;

        if (v3) {
          break;
        }
        id v51 = (id)v9;
        uint64_t v26 = *(void *)(v1 + 216);
        uint64_t v27 = *(void *)(v1 + 192);
        uint64_t v28 = *(void *)(v1 + 200);
        uint64_t v29 = Logger.donations.unsafeMutableAddressor();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v29, v27);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v3 = (char *)swift_slowAlloc();
          uint64_t v0 = swift_slowAlloc();
          *uint64_t v49 = v0;
          *(_DWORD *)uint64_t v3 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)(v3 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, v49);
          swift_bridgeObjectRelease_n();
          *((_WORD *)v3 + 6) = 2048;
          if (v2 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v32 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
          }
          uint64_t v50 = *(void *)(v1 + 216);
          uint64_t v33 = *(void *)(v1 + 192);
          uint64_t v34 = *(void *)(v1 + 200);
          swift_bridgeObjectRelease();
          *(void *)(v3 + 14) = v32;
          swift_bridgeObjectRelease();
          _os_log_impl(&def_3494C, v30, v31, "Failed to make IDSURI for %s, cannot donate %ld handles", (uint8_t *)v3, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v50, v33);
          uint64_t v10 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
          int64_t v9 = (int64_t)v51;
          if (!v8) {
            goto LABEL_8;
          }
        }
        else
        {
          uint64_t v0 = *(void *)(v1 + 216);
          uint64_t v11 = *(void *)(v1 + 192);
          uint64_t v12 = *(void *)(v1 + 200);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();

          (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v11);
          int64_t v9 = (int64_t)v51;
          if (!v8) {
            goto LABEL_8;
          }
        }
LABEL_7:
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v9 << 6);
        uint64_t v15 = *(void *)(v1 + 168);
      }
      swift_bridgeObjectRelease();
      int64_t v9 = (int64_t)LiteMessageServiceSession.offGridMessenger.getter();
      *(void *)(v1 + 296) = v9;
      uint64_t v0 = v2 >> 62;
      if (!(v2 >> 62))
      {
        uint64_t v35 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        goto LABEL_31;
      }
LABEL_50:
      swift_bridgeObjectRetain_n();
      uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
LABEL_31:
      *(void *)(v1 + 304) = v35;
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      lazy protocol witness table accessor for type IDSURI and conformance NSObject();
      uint64_t v36 = Set.init(minimumCapacity:)();
      *(void *)(v1 + 144) = v36;
      if (v0)
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t v36 = swift_bridgeObjectRelease();
        id v52 = (id)v9;
        if (!v37) {
          goto LABEL_45;
        }
      }
      else
      {
        uint64_t v37 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
        id v52 = (id)v9;
        if (!v37) {
          goto LABEL_45;
        }
      }
      if (v37 < 1)
      {
        __break(1u);
        return _swift_continuation_await(v36);
      }
      if ((v2 & 0xC000000000000001) != 0)
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          uint64_t v42 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
          specialized Set._Variant.insert(_:)(&v53, v42);
        }
      }
      else
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          char v44 = *(void **)(v2 + 8 * j + 32);
          specialized Set._Variant.insert(_:)(&v53, v44);
        }
      }
LABEL_45:
      swift_bridgeObjectRelease();
      uint64_t v45 = *(unsigned __int8 *)(v1 + 329);
      uint64_t v46 = *(void *)(v1 + 176);
      Class isa = Set._bridgeToObjectiveC()().super.isa;
      *(void *)(v1 + 312) = isa;
      swift_bridgeObjectRelease();
      *(void *)(v1 + 16) = v1;
      *(void *)(v1 + 56) = v1 + 328;
      *(void *)(v1 + 24) = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
      uint64_t v48 = swift_continuation_init();
      *(void *)(v1 + 80) = _NSConcreteStackBlock;
      *(void *)(v1 + 88) = 0x40000000;
      *(void *)(v1 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type Bool;
      *(void *)(v1 + 104) = &block_descriptor_18;
      *(void *)(v1 + 112) = v48;
      objc_msgSend(v52, "__im_donateHandlesForMessagingKeys:fromURI:priority:isInitial:completion:", isa, v3, v46, v45, v1 + 80);
      uint64_t v36 = v1 + 16;
      return _swift_continuation_await(v36);
    }
    int64_t v20 = v16 + 3;
    if (v20 < v17)
    {
      unint64_t v19 = *(void *)(v18 + 8 * v20);
      if (v19)
      {
        int64_t v9 = v20;
        goto LABEL_21;
      }
      while (1)
      {
        int64_t v9 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        if (v9 >= v17) {
          goto LABEL_34;
        }
        unint64_t v19 = *(void *)(v18 + 8 * v9);
        ++v20;
        if (v19) {
          goto LABEL_21;
        }
      }
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
  }
LABEL_34:
  swift_release();
  v38 = (void *)swift_task_alloc();
  *(void *)(v1 + 256) = v38;
  void *v38 = v1;
  v38[1] = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
  uint64_t v39 = *(void *)(v1 + 168);
  return specialized LiteMessageServiceSession.inviteHandleMap(_:)(v39);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = *v0;
  swift_task_dealloc();
  unint64_t v2 = *(void *)(v1 + 248);
  uint64_t v3 = *(void *)(v1 + 240);
  return _swift_task_switch(LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:), v3, v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  unint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 320) = v2;
  if (v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v1 + 240);
    uint64_t v4 = *(void *)(v1 + 248);
    char v5 = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
  }
  else
  {
    uint64_t v3 = *(void *)(v1 + 240);
    uint64_t v4 = *(void *)(v1 + 248);
    char v5 = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
  }
  return _swift_task_switch(v5, v3, v4);
}

{
  uint64_t v0;
  unint64_t v1;
  char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  NSString v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t i;
  void *v48;
  uint64_t j;
  void *v50;
  uint64_t v51;
  Class isa;
  uint64_t v53;
  uint64_t *v54;
  unsigned int v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;

  uint64_t v60 = v0;
  uint64_t v3 = *(void **)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 224);
  char v5 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v7 = *(unsigned __int8 *)(v0 + 328);

  unint64_t v8 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v8, v5);
  swift_bridgeObjectRetain();
  int64_t v9 = Logger.logObject.getter();
  uint64_t v10 = static os_log_type_t.default.getter();
  uint64_t v11 = v10;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v1 = *(void *)(v0 + 304);
    uint64_t v12 = *(void **)(v0 + 288);
    unint64_t v13 = swift_slowAlloc();
    *(_DWORD *)unint64_t v13 = 134218240;
    swift_bridgeObjectRelease();
    *(void *)(v13 + 4) = v1;
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 1024;
    *(_DWORD *)(v13 + 14) = v7;
    _os_log_impl(&def_3494C, v9, (os_log_type_t)v11, "Completed donating %ld handles with success %{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_slowDealloc();
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 288);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v54 = (uint64_t *)(v0 + 160);

  (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 192));
  uint64_t v15 = *(void *)(v0 + 264);
  unint64_t v14 = *(void *)(v0 + 272);
  int64_t v16 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      int64_t v20 = v19 | (v15 << 6);
      NSString v21 = *(void *)(v0 + 168);
      goto LABEL_23;
    }
    uint64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    unint64_t v23 = (unint64_t)((1 << *(unsigned char *)(v0 + 330)) + 63) >> 6;
    NSString v21 = *(void *)(v0 + 168);
    if (v22 >= v23) {
      goto LABEL_34;
    }
    id v24 = v21 + 64;
    NSString v25 = *(void *)(v21 + 64 + 8 * v22);
    ++v15;
    if (!v25)
    {
      uint64_t v15 = v22 + 1;
      if (v22 + 1 >= v23) {
        goto LABEL_34;
      }
      NSString v25 = *(void *)(v24 + 8 * v15);
      if (!v25)
      {
        uint64_t v15 = v22 + 2;
        if (v22 + 2 >= v23) {
          goto LABEL_34;
        }
        NSString v25 = *(void *)(v24 + 8 * v15);
        if (!v25) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v14 = (v25 - 1) & v25;
    int64_t v20 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_23:
    *(void *)(v0 + 264) = v15;
    *(void *)(v0 + 272) = v14;
    uint64_t v27 = (uint64_t *)(*(void *)(v21 + 48) + 16 * v20);
    uint64_t v28 = *v27;
    uint64_t v29 = v27[1];
    uint64_t v1 = *(void *)(*(void *)(v21 + 56) + 8 * v20);
    *(void *)(v0 + 280) = v1;
    uint64_t v30 = objc_allocWithZone((Class)v16[452]);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    os_log_type_t v31 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unint64_t v2 = (char *)[v30 initWithUnprefixedURI:v31];
    *(void *)(v0 + 288) = v2;

    if (v2)
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = (int64_t)LiteMessageServiceSession.offGridMessenger.getter();
      *(void *)(v0 + 296) = v15;
      uint64_t v11 = v1 >> 62;
      if (!(v1 >> 62))
      {
        uint64_t v41 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        goto LABEL_31;
      }
LABEL_50:
      swift_bridgeObjectRetain_n();
      uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
LABEL_31:
      *(void *)(v0 + 304) = v41;
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      lazy protocol witness table accessor for type IDSURI and conformance NSObject();
      uint64_t v42 = Set.init(minimumCapacity:)();
      *(void *)(v0 + 144) = v42;
      if (v11)
      {
        swift_bridgeObjectRetain();
        uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t v42 = swift_bridgeObjectRelease();
        id v58 = (id)v15;
        if (v43) {
          goto LABEL_38;
        }
LABEL_45:
        swift_bridgeObjectRelease();
        uint64_t v55 = *(unsigned __int8 *)(v0 + 329);
        id v51 = *(void *)(v0 + 176);
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        *(void *)(v0 + 312) = isa;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 328;
        *(void *)(v0 + 24) = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
        id v53 = swift_continuation_init();
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type Bool;
        *(void *)(v0 + 104) = &block_descriptor_18;
        *(void *)(v0 + 112) = v53;
        objc_msgSend(v58, "__im_donateHandlesForMessagingKeys:fromURI:priority:isInitial:completion:", isa, v2, v51, v55, v0 + 80);
        uint64_t v42 = v0 + 16;
      }
      else
      {
        uint64_t v43 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
        id v58 = (id)v15;
        if (!v43) {
          goto LABEL_45;
        }
LABEL_38:
        if (v43 >= 1)
        {
          if ((v1 & 0xC000000000000001) != 0)
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              uint64_t v48 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
              specialized Set._Variant.insert(_:)(&v59, v48);
            }
          }
          else
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              uint64_t v50 = *(void **)(v1 + 8 * j + 32);
              specialized Set._Variant.insert(_:)(&v59, v50);
            }
          }
          goto LABEL_45;
        }
        __break(1u);
      }
      return _swift_continuation_await(v42);
    }
    uint64_t v57 = (id)v15;
    uint64_t v32 = *(void *)(v0 + 216);
    uint64_t v33 = *(void *)(v0 + 192);
    uint64_t v34 = *(void *)(v0 + 200);
    uint64_t v35 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v35, v33);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v36 = Logger.logObject.getter();
    uint64_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      unint64_t v2 = (char *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *uint64_t v54 = v11;
      *(_DWORD *)unint64_t v2 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v2 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, v54);
      swift_bridgeObjectRelease_n();
      *((_WORD *)v2 + 6) = 2048;
      if (v1 >> 62)
      {
        swift_bridgeObjectRetain();
        v38 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        v38 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
      }
      uint64_t v56 = *(void *)(v0 + 216);
      uint64_t v39 = *(void *)(v0 + 192);
      unint64_t v40 = *(void *)(v0 + 200);
      swift_bridgeObjectRelease();
      *(void *)(v2 + 14) = v38;
      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v36, v37, "Failed to make IDSURI for %s, cannot donate %ld handles", (uint8_t *)v2, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v56, v39);
      int64_t v16 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
    }
    else
    {
      uint64_t v11 = *(void *)(v0 + 216);
      int64_t v17 = *(void *)(v0 + 192);
      uint64_t v18 = *(void *)(v0 + 200);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v11, v17);
    }
    uint64_t v15 = (int64_t)v57;
  }
  uint64_t v26 = v22 + 3;
  if (v26 < v23)
  {
    NSString v25 = *(void *)(v24 + 8 * v26);
    if (!v25)
    {
      while (1)
      {
        uint64_t v15 = v26 + 1;
        if (__OFADD__(v26, 1)) {
          goto LABEL_49;
        }
        if (v15 >= v23) {
          goto LABEL_34;
        }
        NSString v25 = *(void *)(v24 + 8 * v15);
        ++v26;
        if (v25) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v15 = v26;
    goto LABEL_22;
  }
LABEL_34:
  swift_release();
  char v44 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v44;
  *char v44 = v0;
  v44[1] = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
  uint64_t v45 = *(void *)(v0 + 168);
  return specialized LiteMessageServiceSession.inviteHandleMap(_:)(v45);
}

{
  uint64_t v0;
  _DWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  NSString v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t i;
  void *v52;
  uint64_t j;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  Class isa;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65[2];
  uint64_t v66;
  uint64_t v67;

  uint64_t v66 = v0;
  uint64_t v1 = (_DWORD *)(v0 + 328);
  unint64_t v2 = *(void **)(v0 + 312);
  uint64_t v3 = *(void **)(v0 + 296);
  char v5 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 192);
  swift_willThrow();

  uint64_t v7 = Logger.donations.unsafeMutableAddressor();
  int64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  unint64_t v8 = v5 + 16;
  v9(v4, v7, v6);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.error.getter();
  uint64_t v12 = v11;
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v13 = *(void **)(v0 + 288);
    unint64_t v14 = *(void *)(v0 + 200);
    uint64_t v60 = *(void *)(v0 + 192);
    uint64_t v62 = *(id *)(v0 + 208);
    unint64_t v8 = swift_slowAlloc();
    uint64_t v1 = (_DWORD *)swift_slowAlloc();
    v65[0] = v1;
    *(_DWORD *)unint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v15 = Error.localizedDescription.getter();
    *(void *)(v8 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, (uint64_t *)v65);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v10, (os_log_type_t)v12, "Failed to donate handles: %s", (uint8_t *)v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(id, uint64_t))(v14 + 8))(v62, v60);
  }
  else
  {
    int64_t v17 = *(void *)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 208);
    uint64_t v18 = *(void *)(v0 + 192);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v12, v18);
  }
  uint64_t v59 = (uint64_t *)(v0 + 160);
  int64_t v20 = *(void *)(v0 + 264);
  unint64_t v19 = *(void *)(v0 + 272);
  while (1)
  {
    if (v19)
    {
      unint64_t v23 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      id v24 = v23 | (v20 << 6);
      NSString v25 = *(void *)(v0 + 168);
      goto LABEL_23;
    }
    uint64_t v26 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    uint64_t v27 = (unint64_t)((1 << *(unsigned char *)(v0 + 330)) + 63) >> 6;
    NSString v25 = *(void *)(v0 + 168);
    if (v26 >= v27) {
      goto LABEL_34;
    }
    uint64_t v28 = v25 + 64;
    uint64_t v29 = *(void *)(v25 + 64 + 8 * v26);
    ++v20;
    if (!v29)
    {
      int64_t v20 = v26 + 1;
      if (v26 + 1 >= v27) {
        goto LABEL_34;
      }
      uint64_t v29 = *(void *)(v28 + 8 * v20);
      if (!v29)
      {
        int64_t v20 = v26 + 2;
        if (v26 + 2 >= v27) {
          goto LABEL_34;
        }
        uint64_t v29 = *(void *)(v28 + 8 * v20);
        if (!v29) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v19 = (v29 - 1) & v29;
    id v24 = __clz(__rbit64(v29)) + (v20 << 6);
LABEL_23:
    *(void *)(v0 + 264) = v20;
    *(void *)(v0 + 272) = v19;
    os_log_type_t v31 = (uint64_t *)(*(void *)(v25 + 48) + 16 * v24);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    unint64_t v8 = *(void *)(*(void *)(v25 + 56) + 8 * v24);
    *(void *)(v0 + 280) = v8;
    uint64_t v34 = objc_allocWithZone((Class)IDSURI);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v1 = [v34 initWithUnprefixedURI:v35];
    *(void *)(v0 + 288) = v1;

    if (v1)
    {
      swift_bridgeObjectRelease();
      int64_t v20 = (int64_t)LiteMessageServiceSession.offGridMessenger.getter();
      *(void *)(v0 + 296) = v20;
      uint64_t v12 = v8 >> 62;
      if (!(v8 >> 62))
      {
        uint64_t v45 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        goto LABEL_31;
      }
LABEL_50:
      swift_bridgeObjectRetain_n();
      uint64_t v45 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
LABEL_31:
      *(void *)(v0 + 304) = v45;
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      lazy protocol witness table accessor for type IDSURI and conformance NSObject();
      uint64_t v46 = Set.init(minimumCapacity:)();
      *(void *)(v0 + 144) = v46;
      if (v12)
      {
        swift_bridgeObjectRetain();
        uint64_t v47 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t v46 = swift_bridgeObjectRelease();
        uint64_t v64 = (id)v20;
        if (v47) {
          goto LABEL_38;
        }
LABEL_45:
        swift_bridgeObjectRelease();
        uint64_t v55 = *(unsigned __int8 *)(v0 + 329);
        uint64_t v56 = *(void *)(v0 + 176);
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        *(void *)(v0 + 312) = isa;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 328;
        *(void *)(v0 + 24) = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
        id v58 = swift_continuation_init();
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type Bool;
        *(void *)(v0 + 104) = &block_descriptor_18;
        *(void *)(v0 + 112) = v58;
        objc_msgSend(v64, "__im_donateHandlesForMessagingKeys:fromURI:priority:isInitial:completion:", isa, v1, v56, v55, v0 + 80);
        uint64_t v46 = v0 + 16;
      }
      else
      {
        uint64_t v47 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
        uint64_t v64 = (id)v20;
        if (!v47) {
          goto LABEL_45;
        }
LABEL_38:
        if (v47 >= 1)
        {
          if ((v8 & 0xC000000000000001) != 0)
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              id v52 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
              specialized Set._Variant.insert(_:)(v65, v52);
            }
          }
          else
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              uint64_t v54 = *(void **)(v8 + 8 * j + 32);
              specialized Set._Variant.insert(_:)(v65, v54);
            }
          }
          goto LABEL_45;
        }
        __break(1u);
      }
      return _swift_continuation_await(v46);
    }
    char v63 = (id)v20;
    uint64_t v36 = *(void *)(v0 + 216);
    uint64_t v37 = *(void *)(v0 + 192);
    v38 = *(void *)(v0 + 200);
    uint64_t v39 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v36, v39, v37);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v40 = Logger.logObject.getter();
    uint64_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v1 = (_DWORD *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *uint64_t v59 = v12;
      *uint64_t v1 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v1 + 1) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v59);
      swift_bridgeObjectRelease_n();
      *((_WORD *)v1 + 6) = 2048;
      if (v8 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v42 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v42 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
      }
      BOOL v61 = *(void *)(v0 + 216);
      uint64_t v43 = *(void *)(v0 + 192);
      char v44 = *(void *)(v0 + 200);
      swift_bridgeObjectRelease();
      *(void *)((char *)v1 + 14) = v42;
      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v40, v41, "Failed to make IDSURI for %s, cannot donate %ld handles", (uint8_t *)v1, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v61, v43);
    }
    else
    {
      uint64_t v12 = *(void *)(v0 + 216);
      NSString v21 = *(void *)(v0 + 192);
      uint64_t v22 = *(void *)(v0 + 200);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v21);
    }
    int64_t v20 = (int64_t)v63;
  }
  uint64_t v30 = v26 + 3;
  if (v30 < v27)
  {
    uint64_t v29 = *(void *)(v28 + 8 * v30);
    if (!v29)
    {
      while (1)
      {
        int64_t v20 = v30 + 1;
        if (__OFADD__(v30, 1)) {
          goto LABEL_49;
        }
        if (v20 >= v27) {
          goto LABEL_34;
        }
        uint64_t v29 = *(void *)(v28 + 8 * v20);
        ++v30;
        if (v29) {
          goto LABEL_22;
        }
      }
    }
    int64_t v20 = v30;
    goto LABEL_22;
  }
LABEL_34:
  swift_release();
  uint64_t v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v48;
  *uint64_t v48 = v0;
  v48[1] = LiteMessageServiceSession.donateHandleMap(_:priority:isInitial:);
  uint64_t v49 = *(void *)(v0 + 168);
  return specialized LiteMessageServiceSession.inviteHandleMap(_:)(v49);
}

void *LiteMessageServiceSession.mapLastAddressedHandleToHandles(using:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  __chkstk_darwin(v4);
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7) {
    return &_swiftEmptyDictionarySingleton;
  }
  uint64_t v49 = (char *)v46 - v5;
  uint64_t v47 = v6;
  id v53 = self;
  uint64_t v50 = (void (**)(char *, uint64_t))(v3 + 8);
  id v51 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v46[1] = a1;
  unint64_t v8 = (unint64_t *)(a1 + 40);
  int64_t v9 = &_swiftEmptyDictionarySingleton;
  *(void *)&long long v10 = 136315138;
  long long v48 = v10;
  v46[2] = (char *)&type metadata for Any + 8;
  do
  {
    uint64_t v54 = v9;
    uint64_t v16 = *(v8 - 1);
    unint64_t v15 = *v8;
    swift_bridgeObjectRetain();
    id v17 = [v53 sharedInstance];
    NSString v18 = String._bridgeToObjectiveC()();
    id v19 = [v17 existingiMessageChatForID:v18];

    if (!v19
      || (id v20 = [v19 lastAddressedLocalHandle],
          v19,
          !v20))
    {
      id v21 = [v52 account];
      id v20 = [v21 loginID];

      if (!v20)
      {
        uint64_t v37 = Logger.donations.unsafeMutableAddressor();
        v38 = v47;
        (*v51)(v47, v37, v2);
        swift_bridgeObjectRetain();
        uint64_t v39 = Logger.logObject.getter();
        uint64_t v40 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v39, (os_log_type_t)v40))
        {
          uint64_t v41 = swift_slowAlloc();
          uint64_t v56 = swift_slowAlloc();
          *(_DWORD *)uint64_t v41 = v48;
          swift_bridgeObjectRetain();
          *(void *)(v41 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v56);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&def_3494C, v39, (os_log_type_t)v40, "Failed to find from handle for %s", (uint8_t *)v41, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*v50)(v38, v2);
          goto LABEL_5;
        }

        swift_bridgeObjectRelease_n();
        uint64_t v12 = *v50;
        unint64_t v13 = v38;
        goto LABEL_24;
      }
    }
    uint64_t v22 = v2;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    id v26 = objc_allocWithZone((Class)IDSURI);
    swift_bridgeObjectRetain();
    NSString v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v28 = [v26 initWithUnprefixedURI:v27];

    if (!v28)
    {
      swift_bridgeObjectRelease();
      uint64_t v33 = Logger.donations.unsafeMutableAddressor();
      uint64_t v34 = v49;
      uint64_t v2 = v22;
      (*v51)(v49, v33, v22);
      swift_bridgeObjectRetain();
      uint64_t v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v11 = swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = v48;
        swift_bridgeObjectRetain();
        *(void *)(v11 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v56);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_3494C, v35, v36, "Failed to create IDS URI for %s", (uint8_t *)v11, 0xCu);
        swift_arrayDestroy();
        uint64_t v2 = v22;
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v12 = *v50;
        unint64_t v13 = v34;
        uint64_t v14 = v22;
LABEL_4:
        v12(v13, v14);
LABEL_5:
        int64_t v9 = v54;
        goto LABEL_6;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v12 = *v50;
      unint64_t v13 = v34;
LABEL_24:
      uint64_t v14 = v2;
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    uint64_t v29 = v54;
    if (v54[2])
    {
      swift_bridgeObjectRetain();
      unint64_t v30 = specialized __RawDictionaryStorage.find<A>(_:)(v23, v25);
      os_log_type_t v31 = &_swiftEmptyArrayStorage;
      if (v32)
      {
        os_log_type_t v31 = *(void **)(v29[7] + 8 * v30);
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      os_log_type_t v31 = &_swiftEmptyArrayStorage;
    }
    uint64_t v56 = (uint64_t)v31;
    id v42 = v28;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    uint64_t v43 = v56;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v55 = v29;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v43, v23, v25, isUniquelyReferenced_nonNull_native);
    int64_t v9 = v55;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v22;
LABEL_6:
    v8 += 2;
    --v7;
  }
  while (v7);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type Bool(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

void closure #2 in LiteMessageServiceSession.inviteHandleMap(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v8 = &v36[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  long long v10 = &v36[-v9];
  id v11 = [self sharedInstance];
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v11 existingiMessageChatForID:v12];

  if (!v13)
  {
    uint64_t v25 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v10, v25, v4);
    swift_bridgeObjectRetain_n();
    id v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v39 = (void (**)(void, void))v5;
      uint64_t v28 = a1;
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v40 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, a2, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v26, v27, "No existing chat for %s, assuming not known contact", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (**)(unsigned char *, uint64_t))v39)[1](v10, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
    }
    return;
  }
  id v14 = [v13 participants];
  if (!v14) {
    goto LABEL_23;
  }
  unint64_t v15 = v14;
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDHandle);
  unint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
    uint64_t v39 = (void (**)(void, void))v13;
    if (v17) {
      goto LABEL_5;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v39 = (void (**)(void, void))v13;
  if (!v30) {
    goto LABEL_14;
  }
LABEL_5:
  if ((v16 & 0xC000000000000001) == 0)
  {
    if (*(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8)))
    {
      id v18 = *(id *)(v16 + 32);
      goto LABEL_8;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_8:
  id v19 = v18;
  swift_bridgeObjectRelease();
  id v20 = [v19 CNContactID];

  if (!v20)
  {
LABEL_15:
    uint64_t v24 = 0;
    unint64_t v23 = 0xE000000000000000;
    goto LABEL_16;
  }
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  uint64_t v24 = v21 & 0xFFFFFFFFFFFFLL;
LABEL_16:
  swift_bridgeObjectRelease();
  if ((v23 & 0x2000000000000000) != 0) {
    uint64_t v24 = HIBYTE(v23) & 0xF;
  }
  uint64_t v31 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, v31, v4);
  swift_bridgeObjectRetain_n();
  char v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v32, v33))
  {
    BOOL v37 = v24 != 0;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v38 = v4;
    uint64_t v41 = v35;
    *(_DWORD *)uint64_t v34 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v40 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 1024;
    LODWORD(v40) = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&def_3494C, v32, v33, "%s is known contact: %{BOOL}d", (uint8_t *)v34, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v38);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String) -> (@unowned Bool)(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  swift_retain();
  LOBYTE(v2) = v1(v2, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSSet) -> () with result type Set<String>(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v1 + 64) + 40) = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return _swift_continuation_resume(v1);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [_HKEmergencyContact](uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for _HKEmergencyContact);
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned FAFamilyCircle?, @unowned NSError?) -> () with result type FAFamilyCircle(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Void __swiftcall LiteMessageServiceSession.listenForContactsChangeNotifications()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  int64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v27 - v6;
  uint64_t v8 = (const char *)kHKMedicalIDEmergencyContactsDidChangeNotification;
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  unint64_t v9 = static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  char v32 = partial apply for closure #1 in LiteMessageServiceSession.listenForContactsChangeNotifications();
  uint64_t v33 = v10;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  uint64_t v30 = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  uint64_t v31 = &block_descriptor;
  uint64_t v11 = _Block_copy(&aBlock);
  id v12 = v0;
  swift_release();
  LODWORD(aBlock) = LiteMessageServiceSession.emergencyContactsNotificationToken.getter();
  uint32_t v13 = notify_register_dispatch(v8, (int *)&aBlock, v9, v11);
  _Block_release(v11);

  LiteMessageServiceSession.emergencyContactsNotificationToken.setter(aBlock);
  if (v13)
  {
    uint64_t v14 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v14, v1);
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 67109120;
      LODWORD(aBlock) = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&def_3494C, v15, v16, "Failed to register for emergency contacts change notification: %u", v17, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  }
  id v18 = static OS_dispatch_queue.main.getter();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v12;
  char v32 = partial apply for closure #2 in LiteMessageServiceSession.listenForContactsChangeNotifications();
  uint64_t v33 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  uint64_t v30 = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  uint64_t v31 = &block_descriptor_10;
  id v20 = _Block_copy(&aBlock);
  id v21 = v12;
  swift_release();
  LODWORD(aBlock) = LiteMessageServiceSession.familyContactsNotificationToken.getter();
  uint32_t v22 = notify_register_dispatch("com.apple.family.family_updated", (int *)&aBlock, v18, v20);
  _Block_release(v20);

  LiteMessageServiceSession.familyContactsNotificationToken.setter(aBlock);
  if (v22)
  {
    uint64_t v23 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v23, v1);
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v26 = 67109120;
      LODWORD(aBlock) = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&def_3494C, v24, v25, "Failed to register for family contacts change notification: %u", v26, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t sub_BCFC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.listenForContactsChangeNotifications()()
{
  return LiteMessageServiceSession.emergencyContactsDidChange()("Emergency contacts changed!", (uint64_t)&unk_55828, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.emergencyContactsDidChange());
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
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

uint64_t partial apply for closure #2 in LiteMessageServiceSession.listenForContactsChangeNotifications()()
{
  return LiteMessageServiceSession.emergencyContactsDidChange()("Family contacts changed!", (uint64_t)&unk_55790, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange());
}

uint64_t LiteMessageServiceSession.emergencyContactsDidChange()(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint32_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&def_3494C, v15, v16, a1, v17, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  type metadata accessor for MainActor();
  id v19 = v6;
  uint64_t v20 = static MainActor.shared.getter();
  id v21 = (void *)swift_allocObject();
  v21[2] = v20;
  v21[3] = &protocol witness table for MainActor;
  v21[4] = v19;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, a3, (uint64_t)v21);
  return swift_release();
}

uint64_t closure #1 in LiteMessageServiceSession.emergencyContactsDidChange()()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = closure #1 in LiteMessageServiceSession.emergencyContactsDidChange();
  return LiteMessageServiceSession.donateEmergencyHandles()();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.emergencyContactsDidChange(), v1, v0);
}

uint64_t closure #1 in LiteMessageServiceSession.familyContactsDidChange()()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return LiteMessageServiceSession.donateFamilyHandles()();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.familyContactsDidChange(), v1, v0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return closure #1 in LiteMessageServiceSession.familyContactsDidChange()();
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [IDSURI]>);
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
    uint32_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint32_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint32_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  void *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  id v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  uint64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      int64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint32_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    unint64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    char v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      char v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        unint64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        char v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            char v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    uint32_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    int64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    char v36 = *v35;
    BOOL v37 = v35[1];
    if ((v42 & 1) == 0)
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
      BOOL v27 = 0;
      uint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        uint64_t v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  long long v17;
  long long v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  long long v26;
  long long v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  long long v38;
  long long v39;
  uint64_t v40;

  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  uint64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint32_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      uint64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            uint64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        uint64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    char v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      unint64_t v26 = *(_OWORD *)v25;
      BOOL v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      uint64_t v38 = v26;
      uint64_t v39 = v27;
      outlined init with take of Any((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      outlined init with copy of AnyHashable(v25, (uint64_t)&v38);
      outlined init with copy of Any(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    uint64_t v29 = result & ~v28;
    uint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        uint64_t v33 = v30 == v32;
        if (v30 == v32) {
          uint64_t v30 = 0;
        }
        v31 |= v33;
        int64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    unint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    unint64_t v17 = v38;
    uint64_t v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)unint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)outlined init with take of Any(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint32_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint32_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
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
    uint64_t v18 = (void *)*v5;
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
  uint64_t v18 = (void *)*v5;
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [IDSURI]>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    BOOL v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    uint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      uint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    unint64_t v21 = *v20;
    int64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  BOOL v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  uint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  long long v19;
  long long v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    int64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      int64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    outlined init with copy of Any(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    uint64_t v19 = v25[0];
    uint64_t v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = outlined init with take of Any(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  unint64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  int64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    int64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
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

      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
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
    uint64_t v28 = (void *)v22;
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
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<IDSURI>);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      do
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
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      char v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<IDSURI>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      unint64_t v7 = ~(-1 << v5);
    }
    else {
      unint64_t v7 = -1;
    }
    int64_t v8 = v7 & *(void *)(v2 + 56);
    uint64_t v9 = (unint64_t)(v5 + 63) >> 6;
    unint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    unint64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          unint64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            unint64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                BOOL v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  unint64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              unint64_t v12 = v18;
            }
          }
        }
LABEL_23:
        int64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      char v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      uint64_t v21 = result & ~v20;
      uint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        uint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          char v25 = v22 == v24;
          if (v22 == v24) {
            uint64_t v22 = 0;
          }
          v23 |= v25;
          unint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        uint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
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

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  unint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
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
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
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

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<IDSURI>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  Swift::Int v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<IDSURI>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  uint64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  unint64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      unint64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        unint64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    unint64_t v19 = *(void *)(v4 + 40);
    uint64_t v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    uint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      int64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v24 = 0;
      char v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        unint64_t v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        BOOL v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      int64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    unint64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    unint64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    specialized getContiguousArrayStorageType<A>(for:)();
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized LiteMessageServiceSession.lastDonationDeviceIdentifier.getter()
{
  NSString v0 = String._bridgeToObjectiveC()();
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = (id)IMGetDomainValueForKey();

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)v6, &demangling cache variable for type metadata for Any?);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  else
  {
    outlined destroy of TaskPriority?((uint64_t)v6, &demangling cache variable for type metadata for Any?);
    return 0;
  }
}

void specialized LiteMessageServiceSession.lastAddressedHandleToRecentHandles()()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v70 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v70 - v8;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v80 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v85 = (char *)&v70 - v14;
  id v15 = [self sharedInstance];
  id v16 = [v15 cachedChats];

  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDChat);
  unint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_3;
    }
LABEL_49:
    swift_bridgeObjectRelease();
    uint64_t v65 = 0;
LABEL_50:
    uint64_t v66 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v66, v0);
    uint64_t v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 134217984;
      uint64_t v88 = v65;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&def_3494C, v67, v68, "Collected %ld handles to donate for initial donation", v69, 0xCu);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return;
  }
  uint64_t v18 = *(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8));
  if (!v18) {
    goto LABEL_49;
  }
LABEL_3:
  if (v18 >= 1)
  {
    uint64_t v86 = v10;
    uint64_t v81 = v7;
    uint64_t v74 = v3;
    uint64_t v75 = v1;
    uint64_t v78 = 0;
    uint64_t v19 = 0;
    uint64_t v83 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v84 = v9;
    uint64_t v82 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    uint64_t v76 = v0;
    uint64_t v77 = (void (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v20 = (void (**)(char *, uint64_t))(v11 + 8);
    unint64_t v79 = &_swiftEmptyDictionarySingleton;
    uint64_t v21 = &selRef_currentHandler;
    while (1)
    {
      if ((v17 & 0xC000000000000001) != 0) {
        id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v22 = *(id *)(v17 + 8 * v19 + 32);
      }
      unint64_t v23 = v22;
      id v24 = objc_msgSend(v22, v21[79], v70);
      if (v24)
      {
        char v25 = v24;
        unint64_t v26 = v20;
        uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v29 = v28;

        uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        if (v29)
        {
          if (v27 == v30 && v29 == v31)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_21;
          }
          char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v33)
          {
LABEL_21:
            if ([v23 style] == 45)
            {
              id v34 = [v23 lastMessage];
              uint64_t v35 = v85;
              if (v34)
              {
                char v36 = v34;
                id v37 = [v34 time];

                if (v37)
                {
                  uint64_t v38 = (uint64_t)v81;
                  static Date._unconditionallyBridgeFromObjectiveC(_:)();

                  uint64_t v39 = 0;
                }
                else
                {
                  uint64_t v39 = 1;
                  uint64_t v38 = (uint64_t)v81;
                }
                uint64_t v41 = v86;
                (*v83)(v38, v39, 1, v86);
                uint64_t v42 = v38;
                uint64_t v40 = (uint64_t)v84;
                outlined init with take of Any?(v42, (uint64_t)v84, &demangling cache variable for type metadata for Date?);
                if ((*v82)(v40, 1, v41) != 1)
                {
                  uint64_t v43 = v86;
                  (*v77)(v35, v40, v86);
                  char v44 = v80;
                  static Date.now.getter();
                  Date.timeIntervalSince(_:)();
                  double v46 = v45;
                  uint64_t v47 = v35;
                  uint64_t v20 = v26;
                  long long v48 = v44;
                  uint64_t v49 = *v26;
                  (*v26)(v48, v43);
                  if (v46 >= 2592000.0)
                  {
                    v49(v47, v43);

                    uint64_t v21 = &selRef_currentHandler;
                  }
                  else
                  {
                    uint64_t v73 = v49;
                    id v50 = [v23 lastAddressedLocalHandle];
                    if (v50)
                    {
                      id v51 = v50;
                      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                      uint64_t v53 = v52;

                      IMDChat.participantURI.getter();
                      uint64_t v20 = v26;
                      uint64_t v21 = &selRef_currentHandler;
                      if (v54)
                      {
                        uint64_t v55 = v79[2];
                        uint64_t v70 = v53;
                        if (v55)
                        {
                          uint64_t v56 = v54;
                          swift_bridgeObjectRetain();
                          unint64_t v57 = specialized __RawDictionaryStorage.find<A>(_:)(v72, v53);
                          id v58 = &_swiftEmptyArrayStorage;
                          if (v59)
                          {
                            id v58 = *(void **)(v79[7] + 8 * v57);
                            swift_bridgeObjectRetain();
                          }
                          swift_bridgeObjectRelease();
                          uint64_t v54 = v56;
                        }
                        else
                        {
                          id v58 = &_swiftEmptyArrayStorage;
                        }
                        uint64_t v88 = (uint64_t)v58;
                        id v71 = v54;
                        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                        if (*(void *)((char *)&dword_10 + (v88 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (v88 & 0xFFFFFFFFFFFFFF8)) >> 1) {
                          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                        }
                        uint64_t v60 = v71;
                        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                        specialized Array._endMutation()();
                        uint64_t v61 = v88;
                        uint64_t v62 = v79;
                        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                        uint64_t v87 = v62;
                        specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v61, v72, v70, isUniquelyReferenced_nonNull_native);
                        unint64_t v79 = v87;

                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        v73(v85, v86);
                        if (__OFADD__(v78++, 1)) {
                          goto LABEL_54;
                        }
                      }
                      else
                      {
                        v73(v85, v86);
                        swift_bridgeObjectRelease();
                      }
                    }
                    else
                    {

                      uint64_t v20 = v26;
                      v73(v85, v86);
                      uint64_t v21 = &selRef_currentHandler;
                    }
                  }
                  goto LABEL_7;
                }
              }
              else
              {
                uint64_t v40 = (uint64_t)v84;
                (*v83)((uint64_t)v84, 1, 1, v86);
              }

              outlined destroy of TaskPriority?(v40, &demangling cache variable for type metadata for Date?);
              goto LABEL_30;
            }
          }

LABEL_30:
          uint64_t v20 = v26;
          goto LABEL_7;
        }
        uint64_t v20 = v26;
      }
      else
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }

      swift_bridgeObjectRelease();
LABEL_7:
      if (v18 == ++v19)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v75;
        uint64_t v0 = v76;
        uint64_t v3 = v74;
        uint64_t v65 = v78;
        goto LABEL_50;
      }
    }
  }
  __break(1u);
LABEL_54:
  __break(1u);
}

uint64_t specialized LiteMessageServiceSession.inviteHandleMap(_:)(uint64_t a1)
{
  v1[27] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  v1[28] = v2;
  v1[29] = *(void *)(v2 - 8);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[32] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[33] = v4;
  v1[34] = v3;
  return _swift_task_switch(specialized LiteMessageServiceSession.inviteHandleMap(_:), v4, v3);
}

uint64_t specialized LiteMessageServiceSession.inviteHandleMap(_:)()
{
  uint64_t v60 = v0 + 23;
  uint64_t v61 = v0 + 21;
  uint64_t v62 = v0 + 26;
  char v63 = v0 + 25;
  uint64_t v3 = v0[27];
  char v4 = *(unsigned char *)(v3 + 32);
  *((unsigned char *)v0 + 336) = v4;
  uint64_t v5 = 1 << v4;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v3 + 64);
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  if (v7) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v16 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  int64_t v17 = (unint64_t)((1 << *((unsigned char *)v0 + 336)) + 63) >> 6;
  if (v16 < v17)
  {
    uint64_t v15 = v0[27];
    uint64_t v18 = v15 + 64;
    unint64_t v19 = *(void *)(v15 + 64 + 8 * v16);
    ++v8;
    if (v19) {
      goto LABEL_21;
    }
    int64_t v8 = v16 + 1;
    if (v16 + 1 >= v17) {
      goto LABEL_40;
    }
    unint64_t v19 = *(void *)(v18 + 8 * v8);
    if (v19) {
      goto LABEL_21;
    }
    int64_t v8 = v16 + 2;
    if (v16 + 2 >= v17) {
      goto LABEL_40;
    }
    unint64_t v19 = *(void *)(v18 + 8 * v8);
    if (v19)
    {
LABEL_21:
      unint64_t v7 = (v19 - 1) & v19;
      unint64_t v14 = __clz(__rbit64(v19)) + (v8 << 6);
      while (1)
      {
        v0[35] = v8;
        v0[36] = v7;
        uint64_t v21 = (uint64_t *)(*(void *)(v15 + 48) + 16 * v14);
        uint64_t v22 = *v21;
        unint64_t v23 = v21[1];
        unint64_t v2 = *(void *)(*(void *)(v15 + 56) + 8 * v14);
        id v24 = objc_allocWithZone((Class)v9[452]);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        NSString v25 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        uint64_t v1 = (char *)[v24 initWithUnprefixedURI:v25];
        v0[37] = v1;

        if (v1) {
          break;
        }
        int64_t v65 = v8;
        uint64_t v27 = v0[29];
        uint64_t v26 = v0[30];
        uint64_t v28 = v0[28];
        uint64_t v29 = Logger.donations.unsafeMutableAddressor();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v29, v28);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v1 = (char *)swift_slowAlloc();
          *uint64_t v62 = swift_slowAlloc();
          *(_DWORD *)uint64_t v1 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)(v1 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, v62);
          swift_bridgeObjectRelease_n();
          *((_WORD *)v1 + 6) = 2048;
          if (v2 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v32 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
          }
          uint64_t v33 = v0[29];
          uint64_t v64 = v0[30];
          uint64_t v34 = v0[28];
          swift_bridgeObjectRelease();
          *(void *)(v1 + 14) = v32;
          swift_bridgeObjectRelease();
          _os_log_impl(&def_3494C, v30, v31, "Failed to make IDSURI for %s, cannot donate %ld handles", (uint8_t *)v1, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v64, v34);
          uint64_t v9 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
          int64_t v8 = v65;
          if (!v7) {
            goto LABEL_8;
          }
        }
        else
        {
          uint64_t v11 = v0[29];
          uint64_t v10 = v0[30];
          uint64_t v12 = v0[28];
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();

          (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
          int64_t v8 = v65;
          if (!v7) {
            goto LABEL_8;
          }
        }
LABEL_7:
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v8 << 6);
        uint64_t v15 = v0[27];
      }
      swift_bridgeObjectRelease();
      if (!(v2 >> 62))
      {
        uint64_t v35 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
        char v36 = v0 + 25;
        if (v35)
        {
LABEL_31:
          *char v36 = &_swiftEmptyArrayStorage;
          uint64_t v37 = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v35 & ~(v35 >> 63), 0);
          if (v35 < 0)
          {
            __break(1u);
            return _swift_continuation_await(v37);
          }
          uint64_t v38 = 0;
          uint64_t v39 = (void *)*v36;
          uint64_t v66 = v35;
          do
          {
            if ((v2 & 0xC000000000000001) != 0) {
              id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v40 = *(id *)(v2 + 8 * v38 + 32);
            }
            uint64_t v41 = v40;
            id v42 = objc_msgSend(v40, "unprefixedURI", v60, v61);
            uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v45 = v44;

            *char v63 = v39;
            unint64_t v47 = v39[2];
            unint64_t v46 = v39[3];
            if (v47 >= v46 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v46 > 1, v47 + 1, 1);
              uint64_t v39 = (void *)*v63;
            }
            ++v38;
            v39[2] = v47 + 1;
            long long v48 = (char *)&v39[2 * v47];
            *((void *)v48 + 4) = v43;
            *((void *)v48 + 5) = v45;
          }
          while (v66 != v38);
          swift_bridgeObjectRelease();
LABEL_47:
          id v51 = [self sharedInstance];
          v0[38] = v51;
          v0[23] = Set.init(minimumCapacity:)();
          uint64_t v52 = v39[2];
          if (v52)
          {
            uint64_t v53 = v39 + 5;
            do
            {
              Swift::Int v55 = *(v53 - 1);
              Swift::Int v54 = *v53;
              swift_bridgeObjectRetain();
              specialized Set._Variant.insert(_:)(v61, v55, v54);
              swift_bridgeObjectRelease();
              v53 += 2;
              --v52;
            }
            while (v52);
          }
          swift_bridgeObjectRelease();
          v56.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
          v0[39] = v56.super.isa;
          swift_bridgeObjectRelease();
          NSString v57 = [v1 unprefixedURI];
          if (!v57)
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)();
            NSString v57 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
          }
          v0[40] = v57;
          v0[14] = closure #2 in LiteMessageServiceSession.inviteHandleMap(_:);
          v0[15] = 0;
          v0[10] = _NSConcreteStackBlock;
          v0[11] = 1107296256;
          v0[12] = thunk for @escaping @callee_guaranteed (@guaranteed String) -> (@unowned Bool);
          v0[13] = &block_descriptor_22;
          id v58 = _Block_copy(v0 + 10);
          v0[41] = v58;
          v0[2] = v0;
          v0[7] = v0 + 24;
          v0[3] = specialized LiteMessageServiceSession.inviteHandleMap(_:);
          uint64_t v59 = swift_continuation_init();
          v0[16] = _NSConcreteStackBlock;
          v0[17] = 0x40000000;
          v0[18] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSSet) -> () with result type Set<String>;
          v0[19] = &block_descriptor_23;
          v0[20] = v59;
          [v51 batchShareOffGridModeToHandleIDs:v56.super.isa fromHandleID:v57 isContact:v58 completion:v0 + 16];
          uint64_t v37 = (uint64_t)(v0 + 2);
          return _swift_continuation_await(v37);
        }
LABEL_46:
        swift_bridgeObjectRelease();
        uint64_t v39 = &_swiftEmptyArrayStorage;
        goto LABEL_47;
      }
LABEL_45:
      swift_bridgeObjectRetain();
      uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      char v36 = v0 + 25;
      if (v35) {
        goto LABEL_31;
      }
      goto LABEL_46;
    }
    int64_t v20 = v16 + 3;
    if (v20 < v17)
    {
      unint64_t v19 = *(void *)(v18 + 8 * v20);
      if (v19)
      {
        int64_t v8 = v20;
        goto LABEL_21;
      }
      while (1)
      {
        int64_t v8 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        if (v8 >= v17) {
          goto LABEL_40;
        }
        unint64_t v19 = *(void *)(v18 + 8 * v8);
        ++v20;
        if (v19) {
          goto LABEL_21;
        }
      }
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
  }
LABEL_40:
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v49 = (uint64_t (*)(void))v0[1];
  return v49();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 272);
  unint64_t v2 = *(void *)(*(void *)v0 + 264);
  return _swift_task_switch(specialized LiteMessageServiceSession.inviteHandleMap(_:), v2, v1);
}

{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  const void *v3;
  void *v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  _UNKNOWN **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  NSString v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t (*v56)(void);
  id v58;
  uint64_t v59;
  Swift::Int *v60;
  Swift::Int v61;
  Swift::Int v62;
  NSSet v63;
  NSString v64;
  void *v65;
  uint64_t v66;
  void *v67;
  Swift::Int *v68;
  void *v69;
  uint64_t *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  int64_t v74;
  uint64_t v75;
  uint64_t v76;

  uint64_t v1 = v0[24];
  unint64_t v2 = (unint64_t)(v0 + 21);
  uint64_t v67 = v0 + 23;
  char v4 = (void *)v0[40];
  uint64_t v3 = (const void *)v0[41];
  uint64_t v5 = (_DWORD *)v0[39];
  uint64_t v6 = v0[31];
  unint64_t v7 = v0[28];
  int64_t v8 = v0[29];

  _Block_release(v3);
  uint64_t v9 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
  swift_bridgeObjectRetain();
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.default.getter();
  uint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v69 = v0 + 24;
  unint64_t v13 = (void *)v0[37];
  if (v12)
  {
    unint64_t v14 = swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = 134217984;
    uint64_t v5 = *(_DWORD **)(v1 + 16);
    swift_bridgeObjectRelease();
    *(void *)(v14 + 4) = v5;
    swift_bridgeObjectRelease();
    _os_log_impl(&def_3494C, v10, v11, "Completed inviting %ld handles", (uint8_t *)v14, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v70 = v0 + 26;
  id v71 = v0 + 25;

  (*(void (**)(void, void))(v0[29] + 8))(v0[31], v0[28]);
  uint64_t v15 = v0[35];
  int64_t v16 = v0[36];
  int64_t v17 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  uint64_t v73 = v0;
  os_log_type_t v68 = v0 + 21;
  while (1)
  {
    if (v16)
    {
      uint64_t v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      uint64_t v22 = v21 | (v15 << 6);
      unint64_t v23 = v0[27];
      goto LABEL_23;
    }
    id v24 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    NSString v25 = (unint64_t)((1 << *((unsigned char *)v0 + 336)) + 63) >> 6;
    if (v24 >= v25) {
      goto LABEL_40;
    }
    unint64_t v23 = v0[27];
    uint64_t v26 = v23 + 64;
    uint64_t v27 = *(void *)(v23 + 64 + 8 * v24);
    ++v15;
    if (!v27)
    {
      uint64_t v15 = v24 + 1;
      if (v24 + 1 >= v25) {
        goto LABEL_40;
      }
      uint64_t v27 = *(void *)(v26 + 8 * v15);
      if (!v27)
      {
        uint64_t v15 = v24 + 2;
        if (v24 + 2 >= v25) {
          goto LABEL_40;
        }
        uint64_t v27 = *(void *)(v26 + 8 * v15);
        if (!v27) {
          break;
        }
      }
    }
LABEL_22:
    int64_t v16 = (v27 - 1) & v27;
    uint64_t v22 = __clz(__rbit64(v27)) + (v15 << 6);
LABEL_23:
    v0[35] = v15;
    v0[36] = v16;
    uint64_t v29 = (uint64_t *)(*(void *)(v23 + 48) + 16 * v22);
    uint64_t v30 = *v29;
    os_log_type_t v31 = v29[1];
    unint64_t v2 = *(void *)(*(void *)(v23 + 56) + 8 * v22);
    uint64_t v32 = objc_allocWithZone((Class)v17[452]);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v5 = [v32 initWithUnprefixedURI:v33];
    v0[37] = v5;

    if (v5)
    {
      swift_bridgeObjectRelease();
      if (!(v2 >> 62))
      {
        uint64_t v43 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
        if (v43) {
          goto LABEL_31;
        }
LABEL_46:
        swift_bridgeObjectRelease();
        unint64_t v46 = &_swiftEmptyArrayStorage;
LABEL_47:
        id v58 = [self sharedInstance];
        v0[38] = v58;
        v0[23] = Set.init(minimumCapacity:)();
        uint64_t v59 = v46[2];
        if (v59)
        {
          uint64_t v60 = v46 + 5;
          do
          {
            uint64_t v62 = *(v60 - 1);
            uint64_t v61 = *v60;
            swift_bridgeObjectRetain();
            specialized Set._Variant.insert(_:)(v68, v62, v61);
            swift_bridgeObjectRelease();
            v60 += 2;
            --v59;
          }
          while (v59);
        }
        swift_bridgeObjectRelease();
        v63.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
        v0[39] = v63.super.isa;
        swift_bridgeObjectRelease();
        uint64_t v64 = [v5 unprefixedURI];
        if (!v64)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v64 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
        }
        v0[40] = v64;
        v0[14] = closure #2 in LiteMessageServiceSession.inviteHandleMap(_:);
        v0[15] = 0;
        v0[10] = _NSConcreteStackBlock;
        v0[11] = 1107296256;
        v0[12] = thunk for @escaping @callee_guaranteed (@guaranteed String) -> (@unowned Bool);
        v0[13] = &block_descriptor_22;
        int64_t v65 = _Block_copy(v0 + 10);
        v0[41] = v65;
        v0[2] = v0;
        v0[7] = v69;
        v0[3] = specialized LiteMessageServiceSession.inviteHandleMap(_:);
        uint64_t v66 = swift_continuation_init();
        v0[16] = _NSConcreteStackBlock;
        v0[17] = 0x40000000;
        v0[18] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSSet) -> () with result type Set<String>;
        v0[19] = &block_descriptor_23;
        v0[20] = v66;
        [v58 batchShareOffGridModeToHandleIDs:v63.super.isa fromHandleID:v64 isContact:v65 completion:v0 + 16];
        uint64_t v44 = (uint64_t)(v0 + 2);
        return _swift_continuation_await(v44);
      }
LABEL_45:
      swift_bridgeObjectRetain();
      uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v43) {
        goto LABEL_46;
      }
LABEL_31:
      char *v71 = &_swiftEmptyArrayStorage;
      uint64_t v44 = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v43 & ~(v43 >> 63), 0);
      if ((v43 & 0x8000000000000000) == 0)
      {
        uint64_t v45 = 0;
        unint64_t v46 = (void *)*v71;
        uint64_t v75 = v43;
        do
        {
          if ((v2 & 0xC000000000000001) != 0) {
            unint64_t v47 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            unint64_t v47 = *(id *)(v2 + 8 * v45 + 32);
          }
          long long v48 = v47;
          uint64_t v49 = objc_msgSend(v47, "unprefixedURI", v67);
          id v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v52 = v51;

          char *v71 = v46;
          Swift::Int v54 = v46[2];
          uint64_t v53 = v46[3];
          if (v54 >= v53 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v53 > 1, v54 + 1, 1);
            unint64_t v46 = (void *)*v71;
          }
          ++v45;
          v46[2] = v54 + 1;
          Swift::Int v55 = (char *)&v46[2 * v54];
          *((void *)v55 + 4) = v50;
          *((void *)v55 + 5) = v52;
          uint64_t v0 = v73;
        }
        while (v75 != v45);
        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
      __break(1u);
      return _swift_continuation_await(v44);
    }
    uint64_t v74 = v15;
    uint64_t v35 = v0[29];
    uint64_t v34 = v0[30];
    char v36 = v0[28];
    uint64_t v37 = Logger.donations.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v34, v37, v36);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v38 = Logger.logObject.getter();
    uint64_t v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v5 = (_DWORD *)swift_slowAlloc();
      *uint64_t v70 = swift_slowAlloc();
      *uint64_t v5 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v5 + 1) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v70);
      swift_bridgeObjectRelease_n();
      *((_WORD *)v5 + 6) = 2048;
      if (v2 >> 62)
      {
        swift_bridgeObjectRetain();
        id v40 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v40 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
      }
      uint64_t v41 = v0[29];
      uint64_t v72 = v0[30];
      id v42 = v73[28];
      swift_bridgeObjectRelease();
      *(void *)((char *)v5 + 14) = v40;
      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v38, v39, "Failed to make IDSURI for %s, cannot donate %ld handles", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v0 = v73;
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v72, v42);
      int64_t v17 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
    }
    else
    {
      unint64_t v19 = v0[29];
      uint64_t v18 = v0[30];
      int64_t v20 = v0[28];
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    }
    uint64_t v15 = v74;
  }
  uint64_t v28 = v24 + 3;
  if (v28 < v25)
  {
    uint64_t v27 = *(void *)(v26 + 8 * v28);
    if (!v27)
    {
      while (1)
      {
        uint64_t v15 = v28 + 1;
        if (__OFADD__(v28, 1)) {
          goto LABEL_44;
        }
        if (v15 >= v25) {
          goto LABEL_40;
        }
        uint64_t v27 = *(void *)(v26 + 8 * v15);
        ++v28;
        if (v27) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v15 = v28;
    goto LABEL_22;
  }
LABEL_40:
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  NSSet v56 = (uint64_t (*)(void))v0[1];
  return v56();
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

uint64_t specialized LiteMessageServiceSession.emergencyContactPhoneNumbers.getter()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[22] = v1;
  v0[23] = *(void *)(v1 - 8);
  v0[24] = swift_task_alloc();
  v0[25] = swift_task_alloc();
  type metadata accessor for MainActor();
  v0[26] = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  v0[27] = v3;
  v0[28] = v2;
  return _swift_task_switch(specialized LiteMessageServiceSession.emergencyContactPhoneNumbers.getter, v3, v2);
}

{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = [objc_allocWithZone((Class)HKHealthStore) init];
  v0[29] = v1;
  uint64_t v2 = [objc_allocWithZone((Class)HKMedicalIDStore) initWithHealthStore:v1];
  v0[30] = v2;
  v0[2] = v0;
  v0[7] = v0 + 19;
  v0[3] = specialized LiteMessageServiceSession.emergencyContactPhoneNumbers.getter;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [_HKEmergencyContact];
  v0[13] = &block_descriptor_32;
  v0[14] = v3;
  [v2 fetchMedicalIDEmergencyContactsWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 248) = v2;
  uint64_t v3 = *(void *)(v1 + 224);
  uint64_t v4 = *(void *)(v1 + 216);
  if (v2) {
    uint64_t v5 = specialized LiteMessageServiceSession.emergencyContactPhoneNumbers.getter;
  }
  else {
    uint64_t v5 = specialized LiteMessageServiceSession.emergencyContactPhoneNumbers.getter;
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  NSString v29;
  id v30;
  NSString v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t (*v42)(char *);
  void *v44;
  uint64_t v45;

  uint64_t v2 = v0[22];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[23];
  swift_release();
  uint64_t v5 = v0[19];
  unint64_t v6 = Logger.donations.unsafeMutableAddressor();
  int64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  unint64_t v7 = (uint8_t *)(v4 + 16);
  v8(v3, v6, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  uint64_t v10 = static os_log_type_t.info.getter();
  uint64_t v11 = (unint64_t)v5 >> 62;
  if (!os_log_type_enabled(v9, v10))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_6;
  }
  uint64_t v1 = v0 + 21;
  unint64_t v7 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)unint64_t v7 = 134217984;
  if (v11) {
    goto LABEL_43;
  }
  uint64_t v12 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    swift_bridgeObjectRelease();
    *uint64_t v1 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&def_3494C, v9, v10, "Got %ld emergency contacts from medical ID", v7, 0xCu);
    swift_slowDealloc();
LABEL_6:

    (*(void (**)(void, void))(v0[23] + 8))(v0[25], v0[22]);
    if (v11)
    {
      if (v5 < 0) {
        uint64_t v9 = v5;
      }
      else {
        uint64_t v9 = (v5 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      unint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v44 = v0;
      if (!v13)
      {
LABEL_25:
        uint64_t v15 = (char *)&_swiftEmptyArrayStorage;
        goto LABEL_26;
      }
    }
    else
    {
      unint64_t v13 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      uint64_t v44 = v0;
      if (!v13) {
        goto LABEL_25;
      }
    }
    if (v13 >= 1) {
      break;
    }
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  unint64_t v14 = 0;
  uint64_t v15 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((v5 & 0xC000000000000001) != 0) {
      int64_t v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      int64_t v16 = *(id *)(v5 + 8 * v14 + 32);
    }
    int64_t v17 = v16;
    uint64_t v18 = objc_msgSend(v16, "phoneNumber", v44);
    if (v18)
    {
      unint64_t v19 = v18;
      int64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v15 + 2) + 1, 1, v15);
      }
      id v24 = *((void *)v15 + 2);
      unint64_t v23 = *((void *)v15 + 3);
      if (v24 >= v23 >> 1) {
        uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v23 > 1), v24 + 1, 1, v15);
      }
      *((void *)v15 + 2) = v24 + 1;
      NSString v25 = &v15[16 * v24];
      *((void *)v25 + 4) = v20;
      *((void *)v25 + 5) = v22;
    }
    else
    {
    }
    ++v14;
  }
  while (v13 != v14);
LABEL_26:
  swift_bridgeObjectRelease_n();
  uint64_t v26 = *((void *)v15 + 2);
  if (v26)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = v15 + 40;
    uint64_t v28 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = String._bridgeToObjectiveC()();
      uint64_t v30 = (id)IMChatCanonicalIDSIDsForAddress();

      if (v30
        && (static String._unconditionallyBridgeFromObjectiveC(_:)(),
            v30,
            os_log_type_t v31 = String._bridgeToObjectiveC()(),
            swift_bridgeObjectRelease(),
            uint64_t v32 = [v31 _stripFZIDPrefix],
            v31,
            v32))
      {
        uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v35 = v34;

        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v28 + 2) + 1, 1, v28);
        }
        uint64_t v37 = *((void *)v28 + 2);
        char v36 = *((void *)v28 + 3);
        if (v37 >= v36 >> 1) {
          uint64_t v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v36 > 1), v37 + 1, 1, v28);
        }
        *((void *)v28 + 2) = v37 + 1;
        uint64_t v38 = &v28[16 * v37];
        *((void *)v38 + 4) = v33;
        *((void *)v38 + 5) = v35;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v27 += 16;
      --v26;
    }
    while (v26);
    uint64_t v39 = v44;
    id v40 = (void *)v44[29];
    uint64_t v41 = (void *)v44[30];
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = v44;
    id v40 = (void *)v44[29];
    uint64_t v41 = (void *)v44[30];
    uint64_t v28 = (char *)&_swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v42 = (uint64_t (*)(char *))v39[1];
  return v42(v28);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)(void *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  int64_t v20 = v0;
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 176);
  swift_release();
  swift_willThrow();
  uint64_t v4 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  unint64_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v16 = *(void *)(v0 + 184);
    int64_t v17 = *(void *)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 192);
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v19 = swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 136315138;
    swift_getErrorValue();
    int64_t v8 = Error.localizedDescription.getter();
    *(void *)(v0 + 160) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v9, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v5, v6, "Failed to fetch medical ID for emergency contacts: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 184);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v12 = *(void *)(v0 + 176);
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  unint64_t v13 = *(void **)(v0 + 240);

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v14 = *(uint64_t (**)(void *))(v0 + 8);
  return v14(&_swiftEmptyArrayStorage);
}

uint64_t specialized LiteMessageServiceSession.familyHandles.getter()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[26] = v1;
  v0[27] = *(void *)(v1 - 8);
  v0[28] = swift_task_alloc();
  v0[29] = swift_task_alloc();
  type metadata accessor for MainActor();
  v0[30] = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  v0[31] = v3;
  v0[32] = v2;
  return _swift_task_switch(specialized LiteMessageServiceSession.familyHandles.getter, v3, v2);
}

{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = [objc_allocWithZone((Class)FAFetchFamilyCircleRequest) init];
  v0[33] = v1;
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = specialized LiteMessageServiceSession.familyHandles.getter;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned FAFamilyCircle?, @unowned NSError?) -> () with result type FAFamilyCircle;
  v0[13] = &block_descriptor_24;
  v0[14] = v2;
  [v1 startRequestWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 272) = v2;
  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  if (v2) {
    uint64_t v5 = specialized LiteMessageServiceSession.familyHandles.getter;
  }
  else {
    uint64_t v5 = specialized LiteMessageServiceSession.familyHandles.getter;
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  unint64_t v19 = v0;
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);
  swift_release();
  swift_willThrow();
  uint64_t v4 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  unint64_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v15 = *(void *)(v0 + 216);
    int64_t v16 = *(void *)(v0 + 208);
    int64_t v17 = *(void *)(v0 + 224);
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 136315138;
    swift_getErrorValue();
    int64_t v8 = Error.localizedDescription.getter();
    *(void *)(v0 + 176) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v9, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v5, v6, "Failed to fetch family circle: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 216);
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v12 = *(void *)(v0 + 208);
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = *(uint64_t (**)(void *))(v0 + 8);
  return v13(&_swiftEmptyArrayStorage);
}

void specialized LiteMessageServiceSession.familyHandles.getter()
{
  swift_release();
  v0[23] = &_swiftEmptyArrayStorage;
  uint64_t v1 = (void *)v0[21];
  id v2 = [v1 members];
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for FAFamilyMember);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v5 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5 + 32);
    }
    unint64_t v7 = v6;
    ++v5;
    uint64_t v8 = FAFamilyMember.allKnownHandles.getter();
    specialized Array.append<A>(contentsOf:)(v8);
  }
  while (v4 != v5);
LABEL_10:
  uint64_t v33 = v1;
  uint64_t v9 = v0[26];
  uint64_t v10 = v0[29];
  uint64_t v11 = v0[27];
  swift_bridgeObjectRelease();
  uint64_t v12 = Logger.donations.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v12, v9);
  uint64_t v13 = v0[23];
  swift_bridgeObjectRetain();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    int64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v16 = 134217984;
    v0[25] = *(void *)(v13 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&def_3494C, v14, v15, "Got %ld family contacts from family circle", v16, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(void, void))(v0[27] + 8))(v0[29], v0[26]);
  swift_beginAccess();
  uint64_t v17 = v0[23];
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v19 = v17 + 40;
    int64_t v20 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      swift_bridgeObjectRetain();
      NSString v21 = String._bridgeToObjectiveC()();
      id v22 = (id)IMChatCanonicalIDSIDsForAddress();

      if (v22
        && (static String._unconditionallyBridgeFromObjectiveC(_:)(),
            v22,
            NSString v23 = String._bridgeToObjectiveC()(),
            swift_bridgeObjectRelease(),
            id v24 = objc_msgSend(v23, "_stripFZIDPrefix", v33),
            v23,
            v24))
      {
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v27 = v26;

        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v20 + 2) + 1, 1, v20);
        }
        unint64_t v29 = *((void *)v20 + 2);
        unint64_t v28 = *((void *)v20 + 3);
        if (v29 >= v28 >> 1) {
          int64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v28 > 1), v29 + 1, 1, v20);
        }
        *((void *)v20 + 2) = v29 + 1;
        uint64_t v30 = &v20[16 * v29];
        *((void *)v30 + 4) = v25;
        *((void *)v30 + 5) = v27;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v19 += 16;
      --v18;
    }
    while (v18);
    os_log_type_t v31 = (void *)v0[33];
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v31 = (void *)v0[33];
    swift_bridgeObjectRetain();
    int64_t v20 = (char *)&_swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (void (*)(char *))v0[1];
  v32(v20);
}

unint64_t lazy protocol witness table accessor for type IDSURI and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type IDSURI and conformance NSObject;
  if (!lazy protocol witness table cache variable for type IDSURI and conformance NSObject)
  {
    type metadata accessor for IMDHandle(255, &lazy cache variable for type metadata for IDSURI);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSURI and conformance NSObject);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.emergencyContactsDidChange()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.emergencyContactsDidChange()();
}

uint64_t sub_11CD4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu);
  return v6(a1, v4);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t one-time initialization function for incomingMessageQueue()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<@Sendable ()>.Continuation.BufferingPolicy);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AsyncSerialQueue();
  __swift_allocate_value_buffer(v7, incomingMessageQueue);
  __swift_project_value_buffer(v7, (uint64_t)incomingMessageQueue);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v0);
  return AsyncSerialQueue.init(priority:bufferingPolicy:)();
}

uint64_t LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  return specialized LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)(a2, a3, a4, a5);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[9] = a3;
  v6[10] = a4;
  uint64_t v10 = type metadata accessor for Logger();
  v6[13] = v10;
  v6[14] = *(void *)(v10 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  v6[17] = type metadata accessor for MainActor();
  v6[18] = static MainActor.shared.getter();
  uint64_t v11 = (void *)swift_task_alloc();
  v6[19] = v11;
  *uint64_t v11 = v6;
  v11[1] = closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:);
  return LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:)(a2, a3, a4);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:);
  }
  else {
    uint64_t v4 = closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:);
  }
  return _swift_task_switch(v4, v3, v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  unint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  uint64_t v19 = v0;
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  swift_release();
  uint64_t v4 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v15 = *(void *)(v0 + 112);
    int64_t v16 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v7, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v5, v6, "Successfully processed received message %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 128);
    uint64_t v11 = *(void *)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 112);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  (*(void (**)(void))(v0 + 88))(0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  void *v16;
  uint64_t (*v17)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  NSString v23 = v0;
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  swift_release();
  uint64_t v4 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v19 = v0[14];
    int64_t v20 = v0[13];
    NSString v21 = v0[15];
    uint64_t v8 = v0[9];
    uint64_t v7 = v0[10];
    uint64_t v9 = swift_slowAlloc();
    id v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    v0[5] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v7, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v10 = Error.localizedDescription.getter();
    v0[7] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v5, v6, "Failed to process received message %s: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  }
  else
  {
    uint64_t v13 = v0[14];
    uint64_t v12 = v0[15];
    unint64_t v14 = v0[13];
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  os_log_type_t v15 = (void (*)(void))v0[11];
  int64_t v16 = (void *)_convertErrorToNSError(_:)();
  v15();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
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

void LiteMessageServiceSession.messenger(_:incomingMessage:context:clientAcknowledgementBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  v13[4] = partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientAcknowledgementBlock:);
  v13[5] = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v13[3] = &block_descriptor_0;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [v5 messenger:a1 incomingMessage:a2 context:a3 clientErrorAcknowledgementBlock:v12];
  _Block_release(v12);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for MainActor();
  swift_unknownObjectRetain();
  id v8 = v2;
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = a2;
  v10[5] = v8;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5Tm((uint64_t)v6, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:), (uint64_t)v10);
  return swift_release();
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[11] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:), v8, v7);
}

void closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)()
{
  uint64_t v59 = v0;
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  id v2 = [v1 pendingCounts];
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
  type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  lazy protocol witness table accessor for type IDSURI and conformance NSObject();
  unint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = __CocoaDictionary.makeIterator()();
    unint64_t v55 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v3 = v4 | 0x8000000000000000;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v55 = v3 + 64;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    uint64_t v5 = v8;
    unint64_t v6 = v10 & *(void *)(v3 + 64);
  }
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)(v0 + 72);
  uint64_t v50 = v5;
  int64_t v54 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v52 = (void (**)(uint64_t, uint64_t))(v12 + 8);
  uint64_t v53 = (void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  unint64_t v51 = v3;
  while ((v3 & 0x8000000000000000) != 0)
  {
    uint64_t v17 = __CocoaDictionary.Iterator.next()();
    if (!v17) {
      goto LABEL_36;
    }
    uint64_t v19 = v18;
    *(void *)(v0 + 24) = v17;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v20 = *(id *)(v0 + 16);
    swift_unknownObjectRelease();
    *(void *)(v0 + 40) = v19;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v21 = *(id *)(v0 + 32);
    swift_unknownObjectRelease();
    uint64_t v16 = v11;
    uint64_t v14 = v6;
    if (!v20) {
      goto LABEL_36;
    }
LABEL_31:
    unint64_t v57 = v14;
    uint64_t v27 = v16;
    id v28 = objc_msgSend(v21, "longLongValue", v50);
    id v29 = [v20 unprefixedURI];
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v32 = v31;

    id v33 = LiteMessageServiceSession.joinedChat(with:)(v30, v32);
    if (v33)
    {
      uint64_t v13 = v33;
      swift_bridgeObjectRelease();
      [v13 updatePendingIncomingSatelliteMessageCount:v28];
    }
    else
    {
      uint64_t v34 = *(void *)(v0 + 80);
      uint64_t v35 = *(void *)(v0 + 64);
      uint64_t v36 = Logger.liteSession.unsafeMutableAddressor();
      (*v53)(v34, v36, v35);
      swift_bridgeObjectRetain();
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      BOOL v39 = os_log_type_enabled(v37, v38);
      uint64_t v40 = *(void *)(v0 + 80);
      uint64_t v56 = *(void *)(v0 + 64);
      if (v39)
      {
        uint64_t v41 = swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v41 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v32, &v58);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_3494C, v37, v38, "Failed to find or join chat for handle %s to assign pending message count", (uint8_t *)v41, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v3 = v51;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*v52)(v40, v56);
    }
    uint64_t v11 = v27;
    unint64_t v6 = v57;
  }
  if (v6)
  {
    uint64_t v14 = (v6 - 1) & v6;
    unint64_t v15 = __clz(__rbit64(v6)) | (v11 << 6);
    uint64_t v16 = v11;
    goto LABEL_30;
  }
  int64_t v22 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_43;
  }
  if (v22 >= v54) {
    goto LABEL_36;
  }
  unint64_t v23 = *(void *)(v55 + 8 * v22);
  uint64_t v16 = v11 + 1;
  if (v23) {
    goto LABEL_29;
  }
  uint64_t v16 = v11 + 2;
  if (v11 + 2 >= v54) {
    goto LABEL_36;
  }
  unint64_t v23 = *(void *)(v55 + 8 * v16);
  if (v23) {
    goto LABEL_29;
  }
  uint64_t v16 = v11 + 3;
  if (v11 + 3 >= v54) {
    goto LABEL_36;
  }
  unint64_t v23 = *(void *)(v55 + 8 * v16);
  if (v23) {
    goto LABEL_29;
  }
  uint64_t v16 = v11 + 4;
  if (v11 + 4 >= v54) {
    goto LABEL_36;
  }
  unint64_t v23 = *(void *)(v55 + 8 * v16);
  if (v23)
  {
LABEL_29:
    uint64_t v14 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_30:
    uint64_t v25 = 8 * v15;
    uint64_t v26 = *(void **)(*(void *)(v3 + 56) + v25);
    id v20 = *(id *)(*(void *)(v3 + 48) + v25);
    id v21 = v26;
    if (!v20) {
      goto LABEL_36;
    }
    goto LABEL_31;
  }
  uint64_t v24 = v11 + 5;
  while (v54 != v24)
  {
    unint64_t v23 = *(void *)(v55 + 8 * v24++);
    if (v23)
    {
      uint64_t v16 = v24 - 1;
      goto LABEL_29;
    }
  }
LABEL_36:
  outlined consume of [IDSURI : NSNumber].Iterator._Variant();
  id v42 = [self sharedInstance];
  if (!v42)
  {
LABEL_43:
    __break(1u);
    return;
  }
  uint64_t v43 = v42;
  uint64_t v44 = *(void **)(v0 + 56);
  id v45 = [*(id *)(v0 + 48) totalPendingMessagesCount];
  id v46 = [v45 integerValue];

  id v47 = [v44 service];
  NSString v48 = [v47 internalName];

  if (!v48)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v48 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v43, "updateBadgeForPendingSatelliteMessagesIfNeeded:onService:", v46, v48, v50);

  swift_task_dealloc();
  uint64_t v49 = *(void (**)(void))(v0 + 8);
  v49();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  return specialized LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(a2, a3, a4);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  uint64_t v6[2] = a1;
  v6[3] = a4;
  uint64_t v7 = type metadata accessor for Date();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  type metadata accessor for MainActor();
  v6[9] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:), v9, v8);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = (unsigned char *)v0[2];
  uint64_t v4 = (void *)v0[3];
  swift_release();
  NSString v6 = String._bridgeToObjectiveC()();
  static Date.now.getter();
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  LOBYTE(v2) = [v4 didReceiveMessageDeliveryReceiptForMessageID:v6 date:isa];

  *uint64_t v5 = v2;
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return specialized LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)(a2, a4, a5);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v13;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v8[8] = swift_task_alloc();
  type metadata accessor for MainActor();
  v8[9] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:), v10, v9);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)()
{
  uint64_t v1 = (void *)v0[3];
  swift_release();
  uint64_t v2 = (char *)[v1 preferredServiceType];
  id v3 = [v1 expirationDate];
  if (v3)
  {
    uint64_t v4 = v3;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  NSString v6 = (void *)v0[8];
  unint64_t v7 = v0[5];
  uint64_t v8 = (void (*)(uint64_t))v0[6];
  uint64_t v9 = v0[4];
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, v5, 1, v10);
  LiteMessageServiceSession.processPreferredServiceType(_:for:expiresAfter:)(v2, v9, v7, v6);
  uint64_t v11 = outlined destroy of TaskPriority?((uint64_t)v6, &demangling cache variable for type metadata for Date?);
  v8(v11);
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRSb_TG5(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *id v3 = v2;
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRSb_TG5TQ0_;
  return v5(v2 + 32);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRSb_TG5TQ0_()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t specialized LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v75 = a3;
  uint64_t v9 = type metadata accessor for AsyncSerialQueue();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v76 = &v63[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v15 = &v63[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v16 = [a2 identifier];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v73 = v18;
  uint64_t v74 = v17;

  uint64_t v19 = Logger.liteSession.unsafeMutableAddressor();
  uint64_t v71 = v13;
  uint64_t v72 = v12;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(v15, v19, v12);
  id v20 = a1;
  id v21 = a2;
  id v22 = v20;
  id v23 = v21;
  id v24 = v22;
  id v25 = v23;
  id v26 = v24;
  id v27 = v25;
  uint64_t v70 = v15;
  id v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  int v30 = v29;
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v68 = a4;
    uint64_t v32 = v31;
    uint64_t v66 = swift_slowAlloc();
    uint64_t v78 = v66;
    *(_DWORD *)uint64_t v32 = 136316418;
    id v33 = [v27 identifier];
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v67 = v5;
    uint64_t v35 = v34;
    os_log_t v65 = v28;
    unint64_t v37 = v36;

    uint64_t v77 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v37, &v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    id v38 = [v26 senderURI];
    id v39 = [v38 unprefixedURI];

    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v69 = v9;
    unint64_t v42 = v41;

    uint64_t v77 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v42, &v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2080;
    id v43 = [v26 recipientURI];
    id v44 = [v43 unprefixedURI];

    uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v47 = v46;

    uint64_t v77 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v47, &v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 32) = 2048;
    id v48 = [v26 encryptionProperties];
    id v49 = [v48 segmentNumber];

    int v64 = v30;
    id v50 = [v49 integerValue];

    uint64_t v77 = (uint64_t)v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v32 + 42) = 2048;
    uint64_t v5 = v67;
    id v51 = [v26 encryptionProperties];
    id v52 = [v51 totalSegments];

    id v53 = [v52 integerValue];
    uint64_t v9 = v69;
    uint64_t v77 = (uint64_t)v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v32 + 52) = 1024;
    int64_t v54 = (char *)[v27 transportType];

    LODWORD(v77) = v54 == (unsigned char *)&def_3494C + 2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    os_log_t v55 = v65;
    _os_log_impl(&def_3494C, v65, (os_log_type_t)v64, "Received encrypted iMessage Lite message %s from %s to %s (segment %ld of %ld) (via satellite: %{BOOL}d)", (uint8_t *)v32, 0x3Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v68;
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(unsigned char *, uint64_t))(v71 + 8))(v70, v72);
  if (one-time initialization token for incomingMessageQueue != -1) {
    swift_once();
  }
  uint64_t v56 = __swift_project_value_buffer(v9, (uint64_t)incomingMessageQueue);
  unint64_t v57 = v76;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v76, v56, v9);
  uint64_t v58 = (void *)swift_allocObject();
  v58[2] = v5;
  v58[3] = v26;
  uint64_t v59 = v73;
  v58[4] = v74;
  v58[5] = v59;
  v58[6] = v75;
  v58[7] = a4;
  id v60 = v26;
  id v61 = v5;
  swift_retain();
  AsyncSerialQueue.perform(_:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v10 + 8))(v57, v9);
}

uint64_t sub_14688()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientAcknowledgementBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t specialized LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_bridgeObjectRetain_n();
  id v16 = a3;
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    unint64_t v41 = v10;
    uint64_t v21 = v20;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v44 = v39;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v40 = v4;
    swift_bridgeObjectRetain();
    uint64_t v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v44);
    uint64_t v42 = a1;
    uint64_t v43 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2080;
    v36[1] = v21 + 14;
    id v23 = [v16 unprefixedURI];
    int v37 = v19;
    id v24 = v23;
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v38 = v11;
    unint64_t v26 = a2;
    uint64_t v27 = v25;
    unint64_t v29 = v28;

    uint64_t v30 = v27;
    a2 = v26;
    uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v29, &v44);
    a1 = v42;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v4 = v40;
    swift_bridgeObjectRelease();
    _os_log_impl(&def_3494C, v17, (os_log_type_t)v37, "Received message delivery receipt for %s from %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v10 = v41;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v38);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v31 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 1, 1, v31);
  type metadata accessor for MainActor();
  swift_bridgeObjectRetain();
  id v32 = v4;
  uint64_t v33 = static MainActor.shared.getter();
  uint64_t v34 = (void *)swift_allocObject();
  v34[2] = v33;
  v34[3] = &protocol witness table for MainActor;
  v34[4] = v32;
  v34[5] = a1;
  v34[6] = a2;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5Tm((uint64_t)v10, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:), (uint64_t)v34);
  return swift_release();
}

uint64_t specialized LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v6 - 8);
  int v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [a1 senderURI];
  id v13 = [v12 unprefixedURI];

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v17, v8);
  unint64_t v39 = v16;
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain_n();
  os_log_type_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v41 = v33;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v34 = v8;
    uint64_t v35 = a2;
    unint64_t v21 = v39;
    swift_bridgeObjectRetain();
    uint64_t v40 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v21, &v41);
    uint64_t v36 = a3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2048;
    id v22 = [a1 preferredServiceType];
    swift_unknownObjectRelease();
    uint64_t v40 = (uint64_t)v22;
    a2 = v35;
    a3 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease();
    os_log_type_t v23 = v19;
    uint64_t v24 = v14;
    _os_log_impl(&def_3494C, v18, v23, "Received service update request from %s to switch to service to %ld", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v34);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v24 = v14;
  }
  uint64_t v25 = type metadata accessor for TaskPriority();
  uint64_t v26 = (uint64_t)v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v37, 1, 1, v25);
  type metadata accessor for MainActor();
  swift_unknownObjectRetain();
  id v27 = v38;
  swift_retain();
  uint64_t v28 = static MainActor.shared.getter();
  unint64_t v29 = (void *)swift_allocObject();
  v29[2] = v28;
  v29[3] = &protocol witness table for MainActor;
  v29[4] = v27;
  v29[5] = a1;
  unint64_t v30 = v39;
  v29[6] = v24;
  v29[7] = v30;
  v29[8] = a2;
  v29[9] = a3;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5Tm(v26, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:), (uint64_t)v29);
  return swift_release();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ()()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)partial apply()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_150C8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(uint64_t a1)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(a1, *(void *)(v1 + 16));
}

uint64_t sub_15108()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_15224()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(a1, v7, v8, v4, v5, v6);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRSb_TG5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRSb_TG5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRSb_TG5Tu);
  return v6(a1, v4);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA_0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu);
  return v6(a1, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_154D0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)(v2, v3, v4, v5, v7, v6);
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

uint64_t one-time initialization function for outgoingMessageQueue()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<@Sendable ()>.Continuation.BufferingPolicy);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AsyncSerialQueue();
  __swift_allocate_value_buffer(v7, outgoingMessageQueue);
  __swift_project_value_buffer(v7, (uint64_t)outgoingMessageQueue);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v0);
  return AsyncSerialQueue.init(priority:bufferingPolicy:)();
}

double variable initialization expression of LiteMessageServiceSession.State.lastSatelliteStateChange()
{
  return 0.0;
}

double variable initialization expression of LiteMessageServiceSession.State.minimumRecoveryCooldown()
{
  return 300.0;
}

uint64_t variable initialization expression of LiteMessageServiceSession.State.emergencyContactsNotificationToken()
{
  return 0;
}

id LiteMessageServiceSession.offGridMessenger.getter()
{
  return *(id *)(v0 + OBJC_IVAR___LiteMessageServiceSession_state);
}

uint64_t LiteMessageServiceSession.segmentStore.getter()
{
  return swift_retain();
}

id LiteMessageServiceSession.republishRateLimiter.getter()
{
  return *(id *)(v0 + OBJC_IVAR___LiteMessageServiceSession_state + 16);
}

double LiteMessageServiceSession.minimumRecoveryCooldown.getter()
{
  return *(double *)(v0 + OBJC_IVAR___LiteMessageServiceSession_state + 32);
}

double LiteMessageServiceSession.lastSatelliteStateChange.getter()
{
  return *(double *)(v0 + OBJC_IVAR___LiteMessageServiceSession_state + 24);
}

double key path getter for LiteMessageServiceSession.lastSatelliteStateChange : LiteMessageServiceSession@<D0>(void *a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(*a1 + OBJC_IVAR___LiteMessageServiceSession_state + 24);
  *a2 = result;
  return result;
}

double key path setter for LiteMessageServiceSession.lastSatelliteStateChange : LiteMessageServiceSession(double *a1, void *a2)
{
  double result = *a1;
  *(double *)(*a2 + OBJC_IVAR___LiteMessageServiceSession_state + 24) = *a1;
  return result;
}

void LiteMessageServiceSession.lastSatelliteStateChange.setter(double a1)
{
  *(double *)(v1 + OBJC_IVAR___LiteMessageServiceSession_state + 24) = a1;
}

double (*LiteMessageServiceSession.lastSatelliteStateChange.modify(void *a1))(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR___LiteMessageServiceSession_state;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = *(void *)(v1 + v2 + 24);
  return LiteMessageServiceSession.lastSatelliteStateChange.modify;
}

double LiteMessageServiceSession.lastSatelliteStateChange.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 24) = *(void *)a1;
  return result;
}

uint64_t LiteMessageServiceSession.emergencyContactsNotificationToken.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR___LiteMessageServiceSession_state + 40);
}

void *key path getter for LiteMessageServiceSession.emergencyContactsNotificationToken : LiteMessageServiceSession@<X0>(void *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*result + OBJC_IVAR___LiteMessageServiceSession_state + 40);
  return result;
}

_DWORD *key path setter for LiteMessageServiceSession.emergencyContactsNotificationToken : LiteMessageServiceSession(_DWORD *result, void *a2)
{
  *(_DWORD *)(*a2 + OBJC_IVAR___LiteMessageServiceSession_state + 40) = *result;
  return result;
}

uint64_t LiteMessageServiceSession.emergencyContactsNotificationToken.setter(uint64_t result)
{
  *(_DWORD *)(v1 + OBJC_IVAR___LiteMessageServiceSession_state + 40) = result;
  return result;
}

uint64_t (*LiteMessageServiceSession.emergencyContactsNotificationToken.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v2 = OBJC_IVAR___LiteMessageServiceSession_state;
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(v1 + v2 + 40);
  return LiteMessageServiceSession.emergencyContactsNotificationToken.modify;
}

uint64_t LiteMessageServiceSession.emergencyContactsNotificationToken.modify(uint64_t result)
{
  *(_DWORD *)(*(void *)result + *(void *)(result + 8) + 40) = *(_DWORD *)(result + 16);
  return result;
}

uint64_t LiteMessageServiceSession.familyContactsNotificationToken.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR___LiteMessageServiceSession_state + 44);
}

void *key path getter for LiteMessageServiceSession.familyContactsNotificationToken : LiteMessageServiceSession@<X0>(void *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*result + OBJC_IVAR___LiteMessageServiceSession_state + 44);
  return result;
}

_DWORD *key path setter for LiteMessageServiceSession.familyContactsNotificationToken : LiteMessageServiceSession(_DWORD *result, void *a2)
{
  *(_DWORD *)(*a2 + OBJC_IVAR___LiteMessageServiceSession_state + 44) = *result;
  return result;
}

uint64_t LiteMessageServiceSession.familyContactsNotificationToken.setter(uint64_t result)
{
  *(_DWORD *)(v1 + OBJC_IVAR___LiteMessageServiceSession_state + 44) = result;
  return result;
}

uint64_t (*LiteMessageServiceSession.familyContactsNotificationToken.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v2 = OBJC_IVAR___LiteMessageServiceSession_state;
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(v1 + v2 + 44);
  return LiteMessageServiceSession.familyContactsNotificationToken.modify;
}

uint64_t LiteMessageServiceSession.familyContactsNotificationToken.modify(uint64_t result)
{
  *(_DWORD *)(*(void *)result + *(void *)(result + 8) + 44) = *(_DWORD *)(result + 16);
  return result;
}

id LiteMessageServiceSession.init(account:service:replicatingFor:)(void *a1, void *a2, void *a3)
{
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithAccount:a1 service:a2 replicatingForSession:a3];

  return v6;
}

uint64_t LiteMessageServiceSession.init(account:service:replicatingFor:)(void *a1, void *a2, void *a3)
{
  uint64_t v7 = v3;
  uint64_t v8 = IMDService.idsServiceName.getter();
  uint64_t v10 = v9;
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  id v12 = objc_allocWithZone((Class)IDSOffGridMessenger);
  id v13 = specialized @nonobjc IDSOffGridMessenger.init(service:queue:)((uint64_t)v8, v10, (uint64_t)v11);

  type metadata accessor for LiteMessageSegmentStore();
  uint64_t v14 = LiteMessageSegmentStore.__allocating_init()();
  id v15 = [self sharedInstanceForBagType:1];
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v15 objectForKey:v16];

  if (v17)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  outlined init with take of Any?((uint64_t)v28, (uint64_t)v29);
  if (v30)
  {
    type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    if (swift_dynamicCast())
    {
      [v27 doubleValue];
      double v19 = v18;

      goto LABEL_10;
    }
  }
  else
  {

    outlined destroy of TaskPriority?((uint64_t)v29, &demangling cache variable for type metadata for Any?);
  }
  double v19 = 21600.0;
LABEL_10:
  id v20 = [objc_allocWithZone((Class)IDSRateLimiter) initWithLimit:2 timeLimit:v19];
  if (v20)
  {
    unint64_t v21 = &v7[OBJC_IVAR___LiteMessageServiceSession_state];
    *(void *)unint64_t v21 = v13;
    *((void *)v21 + 1) = v14;
    *((void *)v21 + 2) = v20;
    *(_OWORD *)(v21 + 24) = xmmword_47030;
    *((void *)v21 + 5) = 0;

    v26.receiver = v7;
    v26.super_class = (Class)LiteMessageServiceSession;
    id v22 = (char *)objc_msgSendSuper2(&v26, "initWithAccount:service:replicatingForSession:", a1, a2, a3);
    os_log_type_t v23 = *(void **)&v22[OBJC_IVAR___LiteMessageServiceSession_state];
    uint64_t v24 = v22;
    _IMIDSForceSetDelegate(v23, v24);
    LiteMessageServiceSession.listenForContactsChangeNotifications()();
    LiteMessageServiceSession.prepareForFirstUnlock()();

    return (uint64_t)v24;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

void LiteMessageServiceSession.sendMessage(_:toChat:style:)(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v36 = a4;
  uint64_t v35 = a2;
  uint64_t v6 = type metadata accessor for AsyncSerialQueue();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int v37 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  id v14 = a1;
  id v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v31 = v9;
    uint64_t v32 = a3;
    uint64_t v33 = v7;
    uint64_t v34 = v6;
    id v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v40 = v30;
    *(_DWORD *)id v17 = 136315138;
    id v18 = [v14 guid];
    if (!v18)
    {

      __break(1u);
      return;
    }
    double v19 = v18;
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    uint64_t v39 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v22, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_3494C, v15, v16, "Enqueuing message to send: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v31);
    uint64_t v7 = v33;
    uint64_t v6 = v34;
    a3 = v32;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  if (one-time initialization token for outgoingMessageQueue != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v6, (uint64_t)outgoingMessageQueue);
  uint64_t v24 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v37, v23, v6);
  uint64_t v25 = swift_allocObject();
  objc_super v26 = v38;
  *(void *)(v25 + 16) = v38;
  *(void *)(v25 + 24) = v14;
  *(void *)(v25 + 32) = v35;
  *(void *)(v25 + 40) = a3;
  *(unsigned char *)(v25 + 48) = v36;
  id v27 = v14;
  id v28 = v26;
  swift_bridgeObjectRetain();
  AsyncSerialQueue.perform(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v24, v6);
}

uint64_t closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 216) = a5;
  *(void *)(v5 + 136) = a3;
  *(void *)(v5 + 144) = a4;
  *(void *)(v5 + 120) = a1;
  *(void *)(v5 + 128) = a2;
  uint64_t v10 = type metadata accessor for Logger();
  *(void *)(v5 + 152) = v10;
  *(void *)(v5 + 160) = *(void *)(v10 - 8);
  *(void *)(v5 + 168) = swift_task_alloc();
  *(void *)(v5 + 176) = swift_task_alloc();
  *(void *)(v5 + 184) = type metadata accessor for MainActor();
  *(void *)(v5 + 192) = static MainActor.shared.getter();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 200) = v11;
  *uint64_t v11 = v5;
  v11[1] = closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:);
  return LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:)(a2, a3, a4, a5);
}

uint64_t closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:)()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:);
  }
  else {
    uint64_t v4 = closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:);
  }
  return _swift_task_switch(v4, v3, v2);
}

void closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:)()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void **)(v0 + 128);
  swift_release();
  uint64_t v5 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  id v6 = v4;
  swift_bridgeObjectRetain_n();
  id v7 = v6;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v37 = v9;
    uint64_t v10 = *(void **)(v0 + 128);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    id v12 = [v10 guid];
    if (!v12)
    {
      uint64_t v32 = *(void **)(v0 + 128);
      swift_bridgeObjectRelease();

      __break(1u);
      goto LABEL_12;
    }
    uint64_t v13 = v12;
    unint64_t v14 = *(void *)(v0 + 144);
    uint64_t v35 = *(void *)(v0 + 152);
    uint64_t v36 = *(void *)(v0 + 176);
    id v15 = *(void **)(v0 + 128);
    uint64_t v33 = *(void *)(v0 + 136);
    uint64_t v34 = *(void *)(v0 + 160);
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;

    *(void *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 112) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v14, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v8, v37, "Successfully sent message %s to %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v35);
  }
  else
  {
    uint64_t v19 = *(void *)(v0 + 176);
    uint64_t v21 = *(void *)(v0 + 152);
    uint64_t v20 = *(void *)(v0 + 160);
    unint64_t v22 = *(void **)(v0 + 128);

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  [*(id *)(v0 + 128) setErrorCode:0];
  uint64_t v23 = *(unsigned __int8 *)(v0 + 216);
  uint64_t v24 = *(void **)(v0 + 120);
  uint64_t v25 = *(void **)(v0 + 128);
  LiteMessageServiceSession.sendMessageSentMetric(for:)(v25);
  NSString v26 = String._bridgeToObjectiveC()();
  [v24 didSendMessage:v25 forChat:v26 style:v23];

  if (![v25 errorCode])
  {
    id v27 = [*(id *)(v0 + 128) guid];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void **)(v0 + 120);
      id v30 = [v29 account];
      [v29 notifyDidSendMessageID:v28 account:v30 shouldNotify:1];

      goto LABEL_8;
    }
LABEL_12:
    __break(1u);
    return;
  }
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = *(void (**)(void))(v0 + 8);
  v31();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSString v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSString v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void (*v38)(void);
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  unint64_t v46 = v0;
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void **)(v0 + 128);
  swift_release();
  uint64_t v5 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  id v6 = v4;
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v7 = v6;
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v44 = v9;
    uint64_t v10 = *(void **)(v0 + 128);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315650;
    id v12 = [v10 guid];
    if (!v12)
    {
LABEL_13:
      uint64_t v39 = *(void **)(v0 + 128);
      swift_errorRelease();
      swift_bridgeObjectRelease();

      __break(1u);
      goto LABEL_14;
    }
    uint64_t v13 = v12;
    uint64_t v41 = *(void *)(v0 + 160);
    unint64_t v14 = *(void *)(v0 + 144);
    uint64_t v42 = *(void *)(v0 + 152);
    uint64_t v43 = *(void *)(v0 + 168);
    id v15 = *(void **)(v0 + 128);
    uint64_t v40 = *(void *)(v0 + 136);
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;

    *(void *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 72) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v14, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2080;
    swift_getErrorValue();
    uint64_t v19 = Error.localizedDescription.getter();
    *(void *)(v0 + 96) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v8, v44, "Failed to send message %s to %s: %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v42);
  }
  else
  {
    unint64_t v22 = *(void *)(v0 + 160);
    uint64_t v21 = *(void *)(v0 + 168);
    uint64_t v23 = *(void *)(v0 + 152);
    uint64_t v24 = *(void **)(v0 + 128);

    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  }
  uint64_t v25 = *(void **)(v0 + 128);
  swift_getErrorValue();
  [v25 setErrorCode:Error.liteItemSendErrorCode.getter(*(void *)(v0 + 48))];
  NSString v26 = [self sharedInstance];
  if (!v26)
  {
    __break(1u);
    goto LABEL_13;
  }
  id v27 = v26;
  id v28 = String._bridgeToObjectiveC()();
  uint64_t v29 = (void *)_convertErrorToNSError(_:)();
  [v27 forceAutoBugCaptureWithSubType:v28 errorPayload:v29];

  swift_errorRelease();
  id v30 = *(unsigned __int8 *)(v0 + 216);
  uint64_t v31 = *(void **)(v0 + 120);
  uint64_t v32 = *(void **)(v0 + 128);
  LiteMessageServiceSession.sendMessageSentMetric(for:)(v32);
  uint64_t v33 = String._bridgeToObjectiveC()();
  [v31 didSendMessage:v32 forChat:v33 style:v30];

  if (![v32 errorCode])
  {
    uint64_t v34 = [*(id *)(v0 + 128) guid];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void **)(v0 + 120);
      os_log_type_t v37 = [v36 account];
      [v36 notifyDidSendMessageID:v35 account:v37 shouldNotify:1];

      goto LABEL_9;
    }
LABEL_14:
    __break(1u);
    return;
  }
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = *(void (**)(void))(v0 + 8);
  v38();
}

void LiteMessageServiceSession.joinChat(_:handleInfo:style:groupID:joinProperties:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, NSString a6, uint64_t a7)
{
  NSString v11 = String._bridgeToObjectiveC()();
  v12.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  if (a6) {
    a6 = String._bridgeToObjectiveC()();
  }
  if (a7) {
    v13.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else {
    v13.super.Class isa = 0;
  }
  Class isa = v13.super.isa;
  [v7 joinChat:v11 handleInfo:v12.super.isa style:a4 groupID:a6 lastAddressedHandle:0 lastAddressedSIMID:0 joinProperties:v13.super.isa];
}

void LiteMessageServiceSession.joinChat(_:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:)(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, void *a6, uint64_t a7, NSString a8, uint64_t a9, void *a10)
{
}

Swift::Void __swiftcall LiteMessageServiceSession.sessionDidBecomeActive()()
{
  id v1 = [self sharedDaemon];
  if (([v1 respondsToSelector:"isSetupComplete"] & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  unsigned __int8 v2 = [v1 isSetupComplete];
  swift_unknownObjectRelease();
  if ((v2 & 1) == 0)
  {
LABEL_5:
    id v3 = [self defaultCenter];
    [v3 addObserver:v0 selector:"handleDaemonFinishedLaunchingWithNotification:" name:kFZDaemonFinishedLaunchingNotification object:0];

    goto LABEL_6;
  }
  LiteMessageServiceSession.donateHandlesForKeyExchange()();
LABEL_6:
  v4.receiver = v0;
  v4.super_class = (Class)LiteMessageServiceSession;
  objc_msgSendSuper2(&v4, "sessionDidBecomeActive");
}

Swift::Void __swiftcall LiteMessageServiceSession.republishOffGridStatusIfNecessary()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v0 - 8);
  os_log_t v65 = (char *)&v65 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  __chkstk_darwin(v2);
  objc_super v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v66 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v73 = (char *)&v65 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v68 = (char *)&v65 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v67 = (char *)&v65 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v71 = (char *)&v65 - v16;
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v65 - v17;
  id v19 = [self sharedInstance];
  uint64_t v74 = [v19 offGridStateManager];

  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSString);
  uint64_t v75 = NSString.init(stringLiteral:)();
  uint64_t v20 = Logger.liteSession.unsafeMutableAddressor();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v21(v18, v20, v5);
  unint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&def_3494C, v22, v23, "Calculate whether to attempt recovery to republish off grid status", v24, 2u);
    swift_slowDealloc();
  }

  uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v18, v5);
  id v26 = [self sharedInstanceForBagType:1];
  NSString v27 = String._bridgeToObjectiveC()();
  id v28 = [v26 objectForKey:v27];

  if (v28)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v77, 0, sizeof(v77));
  }
  outlined init with take of Any?((uint64_t)v77, (uint64_t)v78);
  if (v79)
  {
    type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    if (swift_dynamicCast())
    {
      id v29 = v76;
      unsigned int v30 = [v76 BOOLValue];

      if (!v30)
      {
        uint64_t v31 = v66;
        v21(v66, v20, v5);
        uint64_t v32 = Logger.logObject.getter();
        os_log_type_t v33 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v34 = 0;
          _os_log_impl(&def_3494C, v32, v33, "Server bag key has disabled the recovery mechanism, not attempting to recover", v34, 2u);
          swift_slowDealloc();
          id v36 = v74;
          uint64_t v35 = (void *)v75;
        }
        else
        {
          uint64_t v35 = v32;
          uint64_t v32 = v74;
          id v36 = (id)v75;
        }

        id v60 = v31;
LABEL_33:
        v25(v60, v5);
        return;
      }
    }
    else
    {
    }
  }
  else
  {

    outlined destroy of TaskPriority?((uint64_t)v78, &demangling cache variable for type metadata for Any?);
  }
  os_log_type_t v37 = v74;
  if (![v74 publishStatus])
  {
    v21(v73, v20, v5);
    unint64_t v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.default.getter();
    BOOL v48 = os_log_type_enabled(v46, v47);
    id v49 = v75;
    if (v48)
    {
      id v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v50 = 0;
      _os_log_impl(&def_3494C, v46, v47, "We are already attempting to publish off grid status, not attempting to recover", v50, 2u);
      swift_slowDealloc();
      id v51 = v49;
      id v49 = v37;
    }
    else
    {
      id v51 = v46;
      unint64_t v46 = v37;
    }

    id v60 = v73;
    goto LABEL_33;
  }
  static Date.now.getter();
  Date.timeIntervalSince1970.getter();
  double v39 = v38;
  (*(void (**)(char *, uint64_t))(v69 + 8))(v4, v70);
  uint64_t v40 = v72 + OBJC_IVAR___LiteMessageServiceSession_state;
  uint64_t v41 = v75;
  if (v39 - *(double *)(v72 + OBJC_IVAR___LiteMessageServiceSession_state + 24) < *(double *)(v72
                                                                                             + OBJC_IVAR___LiteMessageServiceSession_state
                                                                                             + 32))
  {
    v21(v71, v20, v5);
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&def_3494C, v42, v43, "We have recently come back on grid, not immediately attempting to recover", v44, 2u);
      swift_slowDealloc();
      uint64_t v45 = v41;
      uint64_t v41 = v37;
    }
    else
    {
      uint64_t v45 = v42;
      uint64_t v42 = v37;
    }

    id v60 = v71;
    goto LABEL_33;
  }
  [*(id *)(v40 + 16) noteItem:v75];
  if (![*(id *)(v40 + 16) underLimitForItem:v41])
  {
    v21(v68, v20, v5);
    id v61 = Logger.logObject.getter();
    os_log_type_t v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v61, v62))
    {
      char v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v63 = 0;
      _os_log_impl(&def_3494C, v61, v62, "We have already republished our status as part of the recovery mechanism recently, not republishing", v63, 2u);
      swift_slowDealloc();
      int v64 = v41;
      uint64_t v41 = v37;
    }
    else
    {
      int v64 = v61;
      id v61 = v37;
    }

    id v60 = v68;
    goto LABEL_33;
  }
  v21(v67, v20, v5);
  id v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v52, v53))
  {
    int64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v54 = 0;
    _os_log_impl(&def_3494C, v52, v53, "Attempting to republish off grid status as part of recovery", v54, 2u);
    swift_slowDealloc();
  }

  v25(v67, v5);
  uint64_t v55 = type metadata accessor for TaskPriority();
  uint64_t v56 = (uint64_t)v65;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v65, 1, 1, v55);
  type metadata accessor for MainActor();
  unint64_t v57 = v37;
  uint64_t v58 = static MainActor.shared.getter();
  uint64_t v59 = (void *)swift_allocObject();
  v59[2] = v58;
  v59[3] = &protocol witness table for MainActor;
  v59[4] = v57;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v56, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary(), (uint64_t)v59);
  swift_release();
}

uint64_t closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[22] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[23] = v5;
  v4[24] = *(void *)(v5 - 8);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[27] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[28] = v7;
  v4[29] = v6;
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary(), v7, v6);
}

uint64_t closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary()()
{
  uint64_t v1 = (void *)v0[22];
  id v2 = [objc_allocWithZone((Class)IDSOffGridModeOptions) init];
  v0[30] = v2;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary();
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMode, @unowned IDSOffGridModePublishStatus, @unowned NSError?) -> () with result type (IDSOffGridMode, IDSOffGridModePublishStatus);
  v0[13] = &block_descriptor_1;
  v0[14] = v3;
  [v1 setOffGridMode:1 options:v2 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  id v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 248) = v2;
  uint64_t v3 = *(void *)(v1 + 232);
  objc_super v4 = *(void *)(v1 + 224);
  if (v2) {
    uint64_t v5 = closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary();
  }
  else {
    uint64_t v5 = closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary();
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v14;

  uint64_t v1 = (void *)v0[30];
  id v2 = v0[26];
  uint64_t v3 = v0[23];
  objc_super v4 = v0[24];
  swift_release();

  uint64_t v5 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  uint64_t v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&def_3494C, v6, v7, "Republished status as on grid", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[26];
  uint64_t v10 = v0[23];
  uint64_t v11 = v0[24];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[30];
  uint64_t v3 = v0[24];
  id v2 = v0[25];
  objc_super v4 = v0[23];
  swift_release();
  swift_willThrow();

  uint64_t v5 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v16 = v0[24];
    uint64_t v17 = v0[23];
    unint64_t v18 = v0[25];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    v0[21] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v6, v7, "Failed to republish status as on grid error: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    uint64_t v12 = v0[24];
    uint64_t v11 = v0[25];
    uint64_t v13 = v0[23];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMode, @unowned IDSOffGridModePublishStatus, @unowned NSError?) -> () with result type (IDSOffGridMode, IDSOffGridModePublishStatus)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    return _swift_continuation_throwingResumeWithError(v4, v6);
  }
  else
  {
    uint64_t v9 = *(void **)(*(void *)(v4 + 64) + 40);
    *uint64_t v9 = a2;
    v9[1] = a3;
    return _swift_continuation_throwingResume(v4);
  }
}

void LiteMessageServiceSession.networkMonitorDidUpdate(_:)(void *a1)
{
  v2.super_class = (Class)LiteMessageServiceSession;
  objc_msgSendSuper2(&v2, "networkMonitorDidUpdate:", a1);
  if ([a1 immediatelyReachable]) {
    LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()();
  }
}

uint64_t LiteMessageServiceSession.deleteAllData()()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[8] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[9] = v4;
  v1[10] = v3;
  return _swift_task_switch(LiteMessageServiceSession.deleteAllData(), v4, v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v16;

  uint64_t v1 = v0[7];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = Logger.liteSession.unsafeMutableAddressor();
  v0[11] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[12] = v5;
  v0[13] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&def_3494C, v6, v7, "deleteAllData for lite service session", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[7];
  uint64_t v10 = v0[4];
  uint64_t v11 = v0[5];
  uint64_t v12 = v0[3];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[14] = v13;
  v0[15] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v14 = *(void *)(v12 + OBJC_IVAR___LiteMessageServiceSession_state + 8);
  v0[16] = v14;
  swift_retain();
  return _swift_task_switch(LiteMessageServiceSession.deleteAllData(), v14, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  LiteMessageSegmentStore.deleteStore()();
  v0[17] = v1;
  if (v1)
  {
    uint64_t v2 = v0[9];
    uint64_t v3 = v0[10];
    uint64_t v4 = LiteMessageServiceSession.deleteAllData();
  }
  else
  {
    swift_release();
    uint64_t v2 = v0[9];
    uint64_t v3 = v0[10];
    uint64_t v4 = LiteMessageServiceSession.deleteAllData();
  }
  return _swift_task_switch(v4, v2, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  swift_release();
  swift_release();
  v1(v3, v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    id v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v5, v6, "deleteAllData for lite service session failed with %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(v0 + 112))(*(void *)(v0 + 48), *(void *)(v0 + 32));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t @objc closure #1 in LiteMessageServiceSession.deleteAllData()(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  type metadata accessor for MainActor();
  v2[4] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(@objc closure #1 in LiteMessageServiceSession.deleteAllData(), v4, v3);
}

uint64_t @objc closure #1 in LiteMessageServiceSession.deleteAllData()()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = @objc closure #1 in LiteMessageServiceSession.deleteAllData();
  return LiteMessageServiceSession.deleteAllData()();
}

{
  uint64_t *v0;
  void (**v1)(void);
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;
  uint64_t v6;

  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

id specialized @nonobjc IDSOffGridMessenger.init(service:queue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithService:v5 queue:a3 error:&v10];

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

uint64_t sub_19498()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:)()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  char v6 = *(unsigned char *)(v0 + 48);
  id v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *id v7 = v1;
  v7[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.sendMessage(_:toChat:style:)(v2, v3, v4, v5, v6);
}

void specialized LiteMessageServiceSession.joinChat(_:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:)(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, void *a6, uint64_t a7, NSString a8, uint64_t a9, void *a10)
{
  id v36 = a6;
  uint64_t v34 = a5;
  uint64_t v35 = a7;
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v19, v15);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v29[1] = a1;
    uint64_t v30 = v15;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v32 = a3;
    os_log_type_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    int v33 = a4;
    uint64_t v39 = v24;
    NSString v31 = a8;
    *(_DWORD *)os_log_type_t v23 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v39);
    a8 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v20, v21, "Joining chat %s", v23, 0xCu);
    swift_arrayDestroy();
    LOBYTE(a4) = v33;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v30);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  NSString v25 = v36;
  NSString v26 = String._bridgeToObjectiveC()();
  if (v25) {
    NSString v25 = String._bridgeToObjectiveC()();
  }
  NSString v27 = a10;
  if (a8) {
    a8 = String._bridgeToObjectiveC()();
  }
  if (a10) {
    NSString v27 = String._bridgeToObjectiveC()();
  }
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v37 didJoinChat:v26 style:a4 displayName:0 groupID:v25 lastAddressedHandle:a8 lastAddressedSIMID:v27 handleInfo:isa];
}

uint64_t sub_198C4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary()()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.republishOffGridStatusIfNecessary()((uint64_t)v3, v4, v5, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for LiteMessageServiceSession.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for LiteMessageServiceSession.State(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for LiteMessageServiceSession.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  id v6 = v3;
  swift_retain();
  id v7 = v5;
  return a1;
}

uint64_t assignWithCopy for LiteMessageServiceSession.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  id v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LiteMessageServiceSession.State(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessageServiceSession.State(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteMessageServiceSession.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageServiceSession.State()
{
  return &type metadata for LiteMessageServiceSession.State;
}

uint64_t type metadata accessor for LiteMessageServiceSession(uint64_t a1)
{
  return type metadata accessor for IMDHandle(a1, &lazy cache variable for type metadata for LiteMessageServiceSession);
}

void type metadata accessor for IMChatStyle()
{
  if (!lazy cache variable for type metadata for IMChatStyle)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for IMChatStyle);
    }
  }
}

uint64_t sub_19C80()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for @objc closure #1 in LiteMessageServiceSession.deleteAllData()()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to @objc closure #1 in LiteMessageServiceSession.deleteAllData()
                                                + async function pointer to @objc closure #1 in LiteMessageServiceSession.deleteAllData());
  return v5(v2, v3);
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  id v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_12Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu + _sIeAgH_ytIeAgHr_TRTu);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_19F40()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu);
  return v6(a1, v4);
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t one-time initialization function for liteSession(uint64_t a1)
{
  return one-time initialization function for liteSession(a1, static Logger.liteSession);
}

uint64_t Logger.liteSession.unsafeMutableAddressor()
{
  return Logger.liteSession.unsafeMutableAddressor(&one-time initialization token for liteSession, (uint64_t)static Logger.liteSession);
}

uint64_t static Logger.liteSession.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.liteSession.getter(&one-time initialization token for liteSession, (uint64_t)static Logger.liteSession, a1);
}

uint64_t one-time initialization function for donations(uint64_t a1)
{
  return one-time initialization function for liteSession(a1, static Logger.donations);
}

uint64_t Logger.donations.unsafeMutableAddressor()
{
  return Logger.liteSession.unsafeMutableAddressor(&one-time initialization token for donations, (uint64_t)static Logger.donations);
}

uint64_t static Logger.donations.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.liteSession.getter(&one-time initialization token for donations, (uint64_t)static Logger.donations, a1);
}

uint64_t one-time initialization function for availability(uint64_t a1)
{
  return one-time initialization function for liteSession(a1, static Logger.availability);
}

uint64_t Logger.availability.unsafeMutableAddressor()
{
  return Logger.liteSession.unsafeMutableAddressor(&one-time initialization token for availability, (uint64_t)static Logger.availability);
}

uint64_t static Logger.availability.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.liteSession.getter(&one-time initialization token for availability, (uint64_t)static Logger.availability, a1);
}

uint64_t one-time initialization function for liteSegmentStore(uint64_t a1)
{
  return one-time initialization function for liteSession(a1, static Logger.liteSegmentStore);
}

uint64_t Logger.liteSegmentStore.unsafeMutableAddressor()
{
  return Logger.liteSession.unsafeMutableAddressor(&one-time initialization token for liteSegmentStore, (uint64_t)static Logger.liteSegmentStore);
}

uint64_t static Logger.liteSegmentStore.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.liteSession.getter(&one-time initialization token for liteSegmentStore, (uint64_t)static Logger.liteSegmentStore, a1);
}

uint64_t one-time initialization function for bitPacker(uint64_t a1)
{
  return one-time initialization function for liteSession(a1, static Logger.bitPacker);
}

uint64_t one-time initialization function for liteSession(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  static Logger.messagesSubsystem.getter();
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.bitPacker.unsafeMutableAddressor()
{
  return Logger.liteSession.unsafeMutableAddressor(&one-time initialization token for bitPacker, (uint64_t)static Logger.bitPacker);
}

uint64_t Logger.liteSession.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.bitPacker.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.liteSession.getter(&one-time initialization token for bitPacker, (uint64_t)static Logger.bitPacker, a1);
}

uint64_t static Logger.liteSession.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t one-time initialization function for lastFetchDate()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __swift_allocate_value_buffer(v0, lastFetchDate);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)lastFetchDate);
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

Swift::Void __swiftcall LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)(Swift::OpaquePointer fromHandlesIDs)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [self sharedInstanceForBagType:1];
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 objectForKey:v11];

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  outlined init with take of Any?((uint64_t)v25, (uint64_t)v26);
  if (!v27)
  {
    outlined destroy of TaskPriority?((uint64_t)v26, &demangling cache variable for type metadata for Any?);
LABEL_11:
    uint64_t v19 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
    type metadata accessor for MainActor();
    id v20 = v1;
    swift_bridgeObjectRetain();
    uint64_t v21 = static MainActor.shared.getter();
    uint64_t v22 = (Swift::OpaquePointer *)swift_allocObject();
    v22[2]._rawValue = (void *)v21;
    v22[3]._rawValue = &protocol witness table for MainActor;
    v22[4]._rawValue = v20;
    v22[5]._rawValue = fromHandlesIDs._rawValue;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:), (uint64_t)v22);
    swift_release();
    return;
  }
  type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  id v13 = v24;
  unsigned __int8 v14 = [v24 BOOLValue];

  if ((v14 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v15 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v18 = 0;
    _os_log_impl(&def_3494C, v16, v17, "Satellite fetch disabled by server bag", v18, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[30] = a4;
  v5[31] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[32] = v6;
  v5[33] = *(void *)(v6 - 8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v5[41] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v5[42] = swift_task_alloc();
  v5[43] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  v5[44] = v7;
  v5[45] = *(void *)(v7 - 8);
  v5[46] = swift_task_alloc();
  v5[47] = swift_task_alloc();
  v5[48] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[49] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[50] = v9;
  v5[51] = v8;
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:), v9, v8);
}

uint64_t closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)()
{
  uint64_t v114 = v0;
  uint64_t v1 = (void *)v0;
  uint64_t v2 = v0 + 240;
  if ((LiteMessageServiceSession.isSatelliteConnectionActive.getter() & 1) == 0)
  {
    uint64_t v19 = *(void *)(v0 + 280);
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v21 = *(void *)(v0 + 264);
    swift_release();
    uint64_t v22 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v22, v20);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v23, v24))
    {
      NSString v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v25 = 0;
      _os_log_impl(&def_3494C, v23, v24, "Skipping satellite pending message fetch, not connected to satellite", v25, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = v1[35];
    goto LABEL_43;
  }
  uint64_t v3 = *(void *)(v0 + 248);
  id v4 = *(id *)(v0 + 240);
  unint64_t v5 = (unint64_t)specialized Sequence.compactMap<A>(_:)(v3, v4);

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_4;
    }
LABEL_39:
    swift_bridgeObjectRelease_n();
LABEL_40:
    uint64_t v87 = v1[36];
    uint64_t v88 = v1[32];
    uint64_t v89 = v1[33];
    swift_release();
    uint64_t v90 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 16))(v87, v90, v88);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v91 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v23, v91))
    {
      unint64_t v92 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v92 = 0;
      _os_log_impl(&def_3494C, v23, v91, "No incoming pending satellite messages, no reason to fetch", v92, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = v1[36];
    goto LABEL_43;
  }
LABEL_38:
  swift_bridgeObjectRetain();
  uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
  if (!v6) {
    goto LABEL_39;
  }
LABEL_4:
  if (v6 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    v112 = v1;
    type = (uint64_t *)(v2 - 24);
    v109 = (uint64_t *)(v2 - 16);
    uint64_t v105 = (void *)(v2 - 8);
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        uint64_t v9 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        uint64_t v9 = *(id *)(v5 + 8 * v7 + 32);
      }
      uint64_t v1 = v9;
      id v10 = [v9 pendingIncomingSatelliteMessageCount];

      BOOL v11 = __OFADD__(v8, v10);
      v8 += (uint64_t)v10;
      if (v11)
      {
        __break(1u);
        goto LABEL_38;
      }
      ++v7;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease_n();
    uint64_t v1 = v112;
    if (v8 < 1) {
      goto LABEL_40;
    }
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v13 = specialized Set.init<A>(_:)(v12);
    swift_bridgeObjectRelease();
    specialized Sequence.compactMap<A>(_:)(v13);
    unint64_t v5 = v14;
    swift_bridgeObjectRelease();
    if (!(v5 >> 62))
    {
      if (!*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_49;
      }
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v96 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v96)
  {
LABEL_49:
    uint64_t v97 = v1[37];
    uint64_t v98 = v1[32];
    uint64_t v99 = v1[33];
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v100 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 16))(v97, v100, v98);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v101 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v23, v101))
    {
      Swift::Int v102 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::Int v102 = 0;
      _os_log_impl(&def_3494C, v23, v101, "No handles to fetch pending messages for", v102, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = v1[37];
LABEL_43:
    uint64_t v93 = v1[32];
    uint64_t v94 = v1[33];

    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v26, v93);
    goto LABEL_44;
  }
LABEL_14:
  if (one-time initialization token for lastFetchDate != -1) {
    swift_once();
  }
  uint64_t v15 = v1[44];
  uint64_t v16 = v1[45];
  uint64_t v17 = v1[43];
  uint64_t v18 = __swift_project_value_buffer(v1[41], (uint64_t)lastFetchDate);
  swift_beginAccess();
  outlined init with copy of Date?(v18, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v15) == 1)
  {
    outlined destroy of TaskPriority?(v1[43], &demangling cache variable for type metadata for Date?);
  }
  else
  {
    uint64_t v27 = v1[47];
    uint64_t v29 = v1[44];
    uint64_t v28 = v1[45];
    (*(void (**)(void, void, uint64_t))(v28 + 32))(v1[48], v1[43], v29);
    static Date.now.getter();
    Date.timeIntervalSince(_:)();
    double v31 = v30;
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v32(v27, v29);
    if (v31 < 1.0)
    {
      v110 = v32;
      uint64_t v33 = v1[48];
      uint64_t v35 = v1[45];
      uint64_t v34 = v1[46];
      uint64_t v36 = v1[44];
      uint64_t v37 = v1[40];
      uint64_t v38 = v112[33];
      uint64_t v39 = v112[32];
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v40 = Logger.liteSession.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v37, v40, v39);
      uint64_t v1 = v112;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v34, v33, v36);
      uint64_t v41 = Logger.logObject.getter();
      os_log_type_t typea = static os_log_type_t.info.getter();
      BOOL v42 = os_log_type_enabled(v41, typea);
      uint64_t v43 = v112[48];
      uint64_t v44 = v112[46];
      uint64_t v45 = v112[44];
      uint64_t v46 = v112[40];
      uint64_t v48 = v112[32];
      uint64_t v47 = v112[33];
      if (v42)
      {
        uint64_t v104 = v112[32];
        uint64_t v49 = swift_slowAlloc();
        v113[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = 136315394;
        lazy protocol witness table accessor for type Date and conformance Date();
        uint64_t v50 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t *v109 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, v113);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v52 = v44;
        os_log_type_t v53 = v110;
        v110(v52, v45);
        *(_WORD *)(v49 + 12) = 2048;
        *uint64_t v105 = 0x3FF0000000000000;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&def_3494C, v41, typea, "Not fetching, last fetch performed at %s which is less than %f seconds ago", (uint8_t *)v49, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v104);
      }
      else
      {

        uint64_t v86 = v44;
        os_log_type_t v53 = v110;
        v110(v86, v45);
        (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
      }
      v53(v43, v45);
      goto LABEL_44;
    }
    v32(v1[48], v1[44]);
  }
  uint64_t v54 = v1[44];
  uint64_t v55 = v1[45];
  uint64_t v56 = v1[42];
  uint64_t v57 = v1[39];
  uint64_t v59 = v1[32];
  uint64_t v58 = v1[33];
  static Date.now.getter();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v56, 0, 1, v54);
  swift_beginAccess();
  outlined assign with take of Date?(v56, v18);
  swift_endAccess();
  uint64_t v60 = Logger.liteSession.unsafeMutableAddressor();
  v1[52] = v60;
  id v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16);
  v1[53] = v61;
  v1[54] = (v58 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v61(v57, v60, v59);
  swift_bridgeObjectRetain_n();
  os_log_type_t v62 = Logger.logObject.getter();
  os_log_type_t v63 = static os_log_type_t.info.getter();
  BOOL v64 = os_log_type_enabled(v62, v63);
  uint64_t v65 = v1[39];
  uint64_t v66 = v1[33];
  uint64_t v111 = v1[32];
  if (v64)
  {
    uint64_t v106 = v60;
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    v113[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v67 = 136315138;
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
    uint64_t v68 = v61;
    swift_bridgeObjectRetain();
    uint64_t v69 = Array.description.getter();
    unint64_t v71 = v70;
    swift_bridgeObjectRelease();
    uint64_t v72 = v69;
    id v61 = v68;
    uint64_t *type = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v72, v71, v113);
    uint64_t v1 = v112;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v62, v63, "Fetching pending messages for handles: %s", v67, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v60 = v106;
    swift_slowDealloc();

    uint64_t v73 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
    v73(v65, v111);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v73 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
    v73(v65, v111);
  }
  v1[55] = v73;
  id v74 = LiteMessageServiceSession.offGridMessenger.getter();
  unsigned int v75 = [v74 respondsToSelector:"sendFetchRequestForHandles:completions:"];

  if (v75)
  {
    id v76 = LiteMessageServiceSession.offGridMessenger.getter();
    v1[56] = v76;
    specialized Set.init<A>(_:)(v5);
    swift_bridgeObjectRelease();
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
    lazy protocol witness table accessor for type IDSURI and conformance NSObject();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    v1[57] = isa;
    swift_bridgeObjectRelease();
    v1[2] = v1;
    v1[7] = v1 + 25;
    v1[3] = closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:);
    uint64_t v78 = swift_continuation_init();
    v1[10] = _NSConcreteStackBlock;
    v1[11] = 0x40000000;
    v1[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSSet?, @unowned NSError?) -> () with result type Set<IDSURI>;
    v1[13] = &block_descriptor_2;
    v1[14] = v78;
    [v76 sendFetchRequestForHandles:isa completions:v1 + 10];
    return _swift_continuation_await(v1 + 2);
  }
  uint64_t v79 = v1[38];
  uint64_t v80 = v1[32];
  swift_release();
  swift_bridgeObjectRelease();
  v61(v79, v60, v80);
  uint64_t v81 = Logger.logObject.getter();
  os_log_type_t v82 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v81, v82))
  {
    uint64_t v83 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v83 = 0;
    _os_log_impl(&def_3494C, v81, v82, "Not sending fetch request, not supported by installed version of IDS client", v83, 2u);
    swift_slowDealloc();
  }
  uint64_t v84 = v1[38];
  uint64_t v85 = v1[32];

  v73(v84, v85);
LABEL_44:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v95 = (uint64_t (*)(void))v1[1];
  return v95();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 464) = v2;
  uint64_t v3 = *(void *)(v1 + 408);
  id v4 = *(void *)(v1 + 400);
  if (v2) {
    unint64_t v5 = closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:);
  }
  else {
    unint64_t v5 = closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = (void *)v0[56];
  uint64_t v2 = (void *)v0[57];
  swift_release();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

{
  void *v0;
  void *v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  void *v21;
  uint64_t v22;

  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[57];
  uint64_t v2 = (void *)v0[56];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t))v0[53];
  id v4 = v0[52];
  unint64_t v5 = v0[34];
  uint64_t v6 = v0[32];
  swift_release();
  swift_willThrow();

  v3(v5, v4, v6);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v18 = v0[34];
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[55];
    uint64_t v17 = v0[32];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    id v10 = Error.localizedDescription.getter();
    v0[26] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v7, v8, "Failed to send fetch request: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v19(v18, v17);
  }
  else
  {
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[55];
    uint64_t v13 = v0[34];
    unint64_t v14 = v0[32];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    v12(v13, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

void specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (v4)
  {
    v4 &= v4 - 1;
LABEL_22:
    id v10 = objc_allocWithZone((Class)IDSURI);
    swift_bridgeObjectRetain();
    NSString v11 = String._bridgeToObjectiveC()();
    id v12 = [v10 initWithUnprefixedURI:v11];
    swift_bridgeObjectRelease();

    if (v12)
    {
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
  }
  int64_t v7 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v7 >= v5) {
    goto LABEL_26;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v7);
  ++v6;
  if (v8) {
    goto LABEL_21;
  }
  int64_t v6 = v7 + 1;
  if (v7 + 1 >= v5) {
    goto LABEL_26;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v6);
  if (v8) {
    goto LABEL_21;
  }
  int64_t v6 = v7 + 2;
  if (v7 + 2 >= v5) {
    goto LABEL_26;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v6);
  if (v8) {
    goto LABEL_21;
  }
  int64_t v6 = v7 + 3;
  if (v7 + 3 >= v5) {
    goto LABEL_26;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v6);
  if (v8)
  {
LABEL_21:
    uint64_t v4 = (v8 - 1) & v8;
    goto LABEL_22;
  }
  int64_t v9 = v7 + 4;
  if (v9 >= v5)
  {
LABEL_26:
    swift_release();
    return;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v9);
  if (v8)
  {
    int64_t v6 = v9;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v6 >= v5) {
      goto LABEL_26;
    }
    uint64_t v8 = *(void *)(v1 + 8 * v6);
    ++v9;
    if (v8) {
      goto LABEL_21;
    }
  }
LABEL_28:
  __break(1u);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSSet?, @unowned NSError?) -> () with result type Set<IDSURI>(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *int64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
    lazy protocol witness table accessor for type IDSURI and conformance NSObject();
    **(void **)(*(void *)(v3 + 64) + 40) = static Set._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_1BF08()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return closure #1 in LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_1BFE8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void *specialized Sequence.compactMap<A>(_:)(uint64_t a1, void *a2)
{
  __n128 result = _swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      NSString v7 = String._bridgeToObjectiveC()();
      id v8 = [a2 chatForChatIdentifier:v7 style:45];
      swift_bridgeObjectRelease();

      if (v8)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v6 += 16;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
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
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
  lazy protocol witness table accessor for type IDSURI and conformance NSObject();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        Swift::Int v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        specialized Set._Variant.insert(_:)(&v9, v6);
      }
    }
    else
    {
      Swift::Int v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        specialized Set._Variant.insert(_:)(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type Date and conformance Date()
{
  unint64_t result = lazy protocol witness table cache variable for type Date and conformance Date;
  if (!lazy protocol witness table cache variable for type Date and conformance Date)
  {
    type metadata accessor for Date();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Date and conformance Date);
  }
  return result;
}

uint64_t static ConsolidationIdentifierError.__derived_enum_equals(_:_:)()
{
  return 1;
}

void ConsolidationIdentifierError.hash(into:)()
{
}

Swift::Int ConsolidationIdentifierError.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ConsolidationIdentifierError()
{
  return Hasher._finalize()();
}

uint64_t IDSOffGridEncryptedMessage.consolidationIdentifier.getter()
{
  uint64_t v1 = v0;
  id v2 = [v0 encryptionProperties];
  uint64_t countAndFlagsBits = (uint64_t)objc_msgSend(v2, "__im_encryptionKeyID");

  if (!countAndFlagsBits
    || (uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)(),
        unint64_t v6 = v5,
        (id)countAndFlagsBits,
        uint64_t countAndFlagsBits = specialized Collection.first.getter(v4, v6),
        outlined consume of Data._Representation(v4, v6),
        (countAndFlagsBits & 0x100) != 0))
  {
    lazy protocol witness table accessor for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    id v7 = [v1 encryptionProperties];
    id v8 = [v7 ratchetCounter];

    id v9 = [v8 integerValue];
    id v20 = v9;
    uint64_t v10 = specialized Data.InlineData.init(_:)(&v20, &v21);
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFLL;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_46FB0;
    *(unsigned char *)(v13 + 32) = countAndFlagsBits;
    uint64_t v14 = specialized Data.init<A>(_:)(v13);
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v21 = v14;
    unint64_t v22 = v16;
    Data.append(_:)();
    uint64_t v17 = v21;
    unint64_t v18 = v22;
    outlined copy of Data._Representation(v21, v22);
    uint64_t countAndFlagsBits = Data.base64EncodedString(options:)(0)._countAndFlagsBits;
    outlined consume of Data._Representation(v17, v18);
    outlined consume of Data._Representation(v10, v12);
    outlined consume of Data._Representation(v17, v18);
  }
  return countAndFlagsBits;
}

unint64_t lazy protocol witness table accessor for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError()
{
  unint64_t result = lazy protocol witness table cache variable for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError;
  if (!lazy protocol witness table cache variable for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError;
  if (!lazy protocol witness table cache variable for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConsolidationIdentifierError and conformance ConsolidationIdentifierError);
  }
  return result;
}

uint64_t specialized Collection.first.getter(uint64_t a1, unint64_t a2)
{
  int v2 = 1;
  unsigned __int8 v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)a1;
      if ((int)a1 != a1 >> 32) {
        goto LABEL_15;
      }
      unsigned __int8 v3 = 0;
      return v3 | (v2 << 8);
    case 2uLL:
      uint64_t v4 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      if (v4 != v5)
      {
        if (a2 >> 62 == 2)
        {
          if (v4 >= v5) {
            goto LABEL_23;
          }
          uint64_t v6 = __DataStorage._bytes.getter();
          if (!v6) {
            goto LABEL_25;
          }
          uint64_t v7 = v6;
          a1 = __DataStorage._offset.getter();
          uint64_t v8 = v4 - a1;
          if (!__OFSUB__(v4, a1)) {
            goto LABEL_19;
          }
          __break(1u);
        }
LABEL_15:
        if (v4 < (int)a1 || v4 >= a1 >> 32)
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
        }
        uint64_t v9 = __DataStorage._bytes.getter();
        if (v9)
        {
          uint64_t v7 = v9;
          uint64_t v10 = __DataStorage._offset.getter();
          uint64_t v8 = v4 - v10;
          if (!__OFSUB__(v4, v10))
          {
LABEL_19:
            int v2 = 0;
            unsigned __int8 v3 = *(unsigned char *)(v7 + v8);
            return v3 | (v2 << 8);
          }
          goto LABEL_22;
        }
        __break(1u);
LABEL_25:
        __break(1u);
        JUMPOUT(0x1C8CCLL);
      }
      unsigned __int8 v3 = 0;
      int v2 = 1;
      return v3 | (v2 << 8);
    case 3uLL:
      return v3 | (v2 << 8);
    default:
      int v2 = (a2 & 0xFF000000000000) == 0;
      if ((a2 & 0xFF000000000000) != 0) {
        unsigned __int8 v3 = a1;
      }
      else {
        unsigned __int8 v3 = 0;
      }
      return v3 | (v2 << 8);
  }
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

id IDSOffGridEncryptedMessage.segmentNumber.getter()
{
  return IDSOffGridEncryptedMessage.segmentNumber.getter((SEL *)&selRef_segmentNumber);
}

id IDSOffGridEncryptedMessage.totalSegments.getter()
{
  return IDSOffGridEncryptedMessage.segmentNumber.getter((SEL *)&selRef_totalSegments);
}

id IDSOffGridEncryptedMessage.segmentNumber.getter(SEL *a1)
{
  id v3 = [v1 encryptionProperties];
  id v4 = [v3 *a1];

  id v5 = [v4 integerValue];
  return v5;
}

unsigned char *closure #1 in Data.init<A>(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  unint64_t v10 = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  id v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  closure #1 in Data.init<A>(_:)(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t getEnumTagSinglePayload for ConsolidationIdentifierError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ConsolidationIdentifierError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1CE38);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConsolidationIdentifierError()
{
  return &type metadata for ConsolidationIdentifierError;
}

unint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void *IMDService.idsServiceNames.getter()
{
  id v1 = [v0 serviceProperties];
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v2 + 16) && (unint64_t v3 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7), (v4 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v7);
  if (*((void *)&v9 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    if (swift_dynamicCast()) {
      return (void *)v6;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
  }
  return &_swiftEmptyArrayStorage;
}

void *IMDService.idsServiceName.getter()
{
  unint64_t result = IMDService.idsServiceNames.getter();
  if (result[2])
  {
    uint64_t v1 = result[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return (void *)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall IMDService.hasAlias(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  id v4 = [self sharedInstance];
  if (!v4)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v5 = v4;
  id v6 = [v4 accountsForService:v1];

  if (!v6)
  {
LABEL_5:
    __break(1u);
    return (char)v4;
  }
  type metadata accessor for IMDAccount();
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  char v8 = specialized Sequence.contains(where:)(v7, countAndFlagsBits, (uint64_t)object);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v4) = v8 & 1;
  return (char)v4;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;
  uint64_t vars8;

  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for IMDAccount()
{
  unint64_t result = lazy cache variable for type metadata for IMDAccount;
  if (!lazy cache variable for type metadata for IMDAccount)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for IMDAccount);
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      outlined destroy of AnyHashable((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  uint64_t v3 = v2 + 64;
  unint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
    char v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    unint64_t v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      char v8 = ~v4;
      for (uint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; uint64_t i = (i + 1) & v8)
      {
        long long v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        unint64_t v10 = static NSObject.== infix(_:_:)();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t specialized Sequence.contains(where:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 & 0xC000000000000001;
    uint64_t v21 = v5 + 32;
    uint64_t v24 = v5;
    unint64_t v22 = v5 & 0xC000000000000001;
    uint64_t v23 = v6;
    while (1)
    {
      id v9 = v8 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v21 + 8 * v7);
      unint64_t v10 = v9;
      if (__OFADD__(v7++, 1)) {
        break;
      }
      id v12 = [v9 aliases];
      uint64_t v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v14 = v13[2];
      if (v14)
      {
        BOOL v15 = v13[4] == a2 && v13[5] == a3;
        if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_27:

          swift_bridgeObjectRelease();
          uint64_t v19 = 1;
          goto LABEL_32;
        }
        if (v14 != 1)
        {
          unint64_t v16 = v13 + 7;
          uint64_t v17 = 1;
          while (1)
          {
            uint64_t v5 = v17 + 1;
            if (__OFADD__(v17, 1)) {
              break;
            }
            BOOL v18 = *(v16 - 1) == a2 && *v16 == a3;
            if (v18 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_27;
            }
            v16 += 2;
            ++v17;
            if (v5 == v14) {
              goto LABEL_4;
            }
          }
          __break(1u);
          break;
        }
LABEL_4:

        swift_bridgeObjectRelease();
        uint64_t v5 = v24;
        unint64_t v8 = v22;
        uint64_t v6 = v23;
        if (v7 == v23) {
          goto LABEL_26;
        }
      }
      else
      {

        swift_bridgeObjectRelease();
        if (v7 == v6)
        {
LABEL_26:
          uint64_t v19 = 0;
          goto LABEL_32;
        }
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
  uint64_t v19 = 0;
LABEL_32:
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

void one-time initialization function for liteControlCharacters()
{
  liteControlCharacters = (uint64_t)&outlined read-only object #0 of one-time initialization function for liteControlCharacters;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> String.liteEscapedText.getter()
{
  uint64_t v0 = one-time initialization token for liteControlCharacters;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v1 = liteControlCharacters;
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; i != 272; i += 16)
  {
    uint64_t v4 = *(void *)(v1 + i + 32);
    uint64_t v3 = *(void *)(v1 + i + 40);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Character>);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_46FB0;
    *(void *)(v5 + 32) = v4;
    *(void *)(v5 + 40) = v3;
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_46FA0;
    *(void *)(v6 + 32) = 1;
    *(void *)(v6 + 40) = 0xE100000000000000;
    *(void *)(v6 + 48) = v4;
    *(void *)(v6 + 56) = v3;
    swift_bridgeObjectRetain_n();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Character]);
    lazy protocol witness table accessor for type String and conformance String();
    lazy protocol witness table accessor for type [Character] and conformance [A]();
    RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
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

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [Character] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [Character] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Character] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Character]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Character] and conformance [A]);
  }
  return result;
}

void static NSAttributedString.makeMessageBody(for:)()
{
  id v0 = objc_allocWithZone((Class)IMToSuperParserContext);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithContent:v1];

  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 appendString:v3];

    if ([v2 body])
    {

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[10] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[11] = v7;
  v4[12] = v6;
  return _swift_task_switch(LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:), v7, v6);
}

uint64_t LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:)()
{
  uint64_t v1 = v0[7];
  id v2 = IDSOffGridEncryptedMessage.totalSegments.getter();
  uint64_t v3 = Logger.liteSession.unsafeMutableAddressor();
  uint64_t v4 = *(void (**)(void, uint64_t, uint64_t))(v1 + 16);
  uint64_t v5 = v0[6];
  if ((uint64_t)v2 <= 1)
  {
    v4(v0[9], v3, v5);
    BOOL v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&def_3494C, v15, v16, "Message is a single segment, immediately decrypting", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = v0[9];
    uint64_t v19 = v0[6];
    uint64_t v20 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    uint64_t v21 = (void *)swift_task_alloc();
    v0[13] = v21;
    *uint64_t v21 = v0;
    v21[1] = LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:);
    uint64_t v22 = v0[4];
    uint64_t v24 = v0[2];
    uint64_t v23 = v0[3];
    return LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:)(v24, v23, v22);
  }
  else
  {
    v4(v0[8], v3, v5);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&def_3494C, v6, v7, "Message is one of several segments", v8, 2u);
      swift_slowDealloc();
    }
    uint64_t v10 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v11 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    id v12 = (void *)swift_task_alloc();
    v0[15] = v12;
    *id v12 = v0;
    v12[1] = LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:);
    uint64_t v13 = v0[2];
    return LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:)(v13);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  id v2 = *v1;
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  id v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.processReceivedEncryptedMessage(_:identifier:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[24] = a3;
  v4[25] = v3;
  v4[22] = a1;
  v4[23] = a2;
  type metadata accessor for Date();
  v4[26] = swift_task_alloc();
  type metadata accessor for LiteMessageContext();
  v4[27] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v4[28] = v5;
  v4[29] = *(void *)(v5 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[32] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[33] = v7;
  v4[34] = v6;
  return _swift_task_switch(LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:), v7, v6);
}

uint64_t LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:)()
{
  uint64_t v1 = v0[22];
  id v2 = LiteMessageServiceSession.offGridMessenger.getter();
  v0[35] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:);
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IDSOffGridMessage, String);
  v0[13] = &block_descriptor_3;
  v0[14] = v3;
  [v2 decryptOffGridMessage:v1 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  id v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 288) = v2;
  uint64_t v3 = *(void *)(v1 + 272);
  uint64_t v4 = *(void *)(v1 + 264);
  if (v2) {
    uint64_t v5 = LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  Swift::String v29;
  Swift::Bool v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  uint64_t v49;
  void *v50;
  unsigned __int8 v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t (*v59)(void);
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73[2];
  void *v74;
  uint64_t v75;

  id v74 = v0;
  uint64_t v1 = (void *)v0[35];
  id v2 = v0[31];
  uint64_t v3 = v0[29];
  uint64_t v5 = (void *)v0[15];
  uint64_t v4 = v0[16];
  v0[37] = v5;
  uint64_t v6 = v0[17];

  uint64_t v68 = Logger.liteSession.unsafeMutableAddressor();
  uint64_t v67 = *(void (**)(uint64_t))(v3 + 16);
  v67(v2);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  unint64_t v8 = static os_log_type_t.info.getter();
  uint64_t v72 = v5;
  BOOL v64 = v4;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v65 = v0[31];
    uint64_t v60 = v0[29];
    os_log_type_t v62 = v0[28];
    uint64_t v10 = v0[23];
    uint64_t v9 = v0[24];
    uint64_t v11 = swift_slowAlloc();
    v73[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    v0[20] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v9, v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[21] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v6, v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v7, v8, "Decrypted %s as %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v12 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
    v12(v65, v62);
  }
  else
  {
    uint64_t v13 = v0[31];
    uint64_t v14 = v0[28];
    BOOL v15 = v0[29];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    id v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }
  os_log_type_t v16 = [v5 senderURI];
  if (!v16)
  {
    swift_release();
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type LiteMessageReceiveError and conformance LiteMessageReceiveError();
    swift_allocError();
    double v31 = 0;
    *(void *)uint64_t v46 = 1;
    uint64_t v47 = 2;
LABEL_22:
    *(void *)(v46 + 8) = v31;
    *(unsigned char *)(v46 + 16) = v47;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v59 = (uint64_t (*)(void))v0[1];
LABEL_23:
    return v59();
  }
  uint64_t v17 = v16;
  uint64_t v66 = v6;
  id v61 = v12;
  uint64_t v18 = (void *)v0[25];
  uint64_t v19 = [v16 unprefixedURI];

  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  uint64_t v23 = [v5 recipientURI];
  uint64_t v24 = [v23 unprefixedURI];

  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v27 = v26;

  uint64_t v28 = [v18 service];
  v29._uint64_t countAndFlagsBits = v20;
  v29._object = v22;
  double v30 = IMDService.hasAlias(_:)(v29);

  if (v30) {
    double v31 = v27;
  }
  else {
    double v31 = (uint64_t)v22;
  }
  if (v30) {
    uint64_t v32 = v25;
  }
  else {
    uint64_t v32 = v20;
  }
  swift_bridgeObjectRetain();
  os_log_type_t v63 = v20;
  v33._uint64_t countAndFlagsBits = v20;
  v33._object = v22;
  if (LiteMessageServiceSession.hasBlockedFromHandleID(_:)(v33))
  {
    uint64_t v34 = v0[30];
    uint64_t v35 = v0[28];
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t, uint64_t))v67)(v34, v68, v35);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v36 = Logger.logObject.getter();
    uint64_t v37 = static os_log_type_t.default.getter();
    uint64_t v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = v0[30];
    uint64_t v40 = v0[28];
    uint64_t v41 = v0[24];
    if (v38)
    {
      uint64_t v69 = v0[28];
      BOOL v42 = v0[23];
      uint64_t v43 = swift_slowAlloc();
      v73[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136315394;
      swift_bridgeObjectRetain();
      v0[18] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v41, v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[19] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, (unint64_t)v22, v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v36, v37, "Dropping message %s, sender %s is blocked", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v44 = v69;
      uint64_t v45 = v39;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      uint64_t v45 = v39;
      uint64_t v44 = v40;
    }
    v61(v45, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v59 = (uint64_t (*)(void))v0[1];
    goto LABEL_23;
  }
  uint64_t v48 = LiteMessageServiceSession.joinedChat(with:)(v32, v31);
  v0[38] = v48;
  if (!v48)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type LiteMessageReceiveError and conformance LiteMessageReceiveError();
    swift_allocError();
    uint64_t v47 = 0;
    *(void *)uint64_t v46 = v32;
    uint64_t v5 = v72;
    goto LABEL_22;
  }
  uint64_t v49 = v0[26];
  unint64_t v70 = v0[27];
  unint64_t v71 = (uint64_t)v48;
  uint64_t v50 = (void *)v0[22];
  swift_bridgeObjectRelease();
  IDSOffGridEncryptedMessage.dateSent.getter();
  unint64_t v51 = LiteMessageServiceSession.isLiteMessageActiveOverSatellite.getter();
  LiteMessageContext.init(identifier:senderID:recipientID:isFromMe:date:sentOrReceivedOnSatellite:preferredService:)(v64, v66, v63, (uint64_t)v22, v25, v27, v30, v49, v70, v51 & 1, (uint64_t)objc_msgSend(v50, "__im__preferredServiceType"));
  uint64_t v52 = [v72 message];
  os_log_type_t v53 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v55 = v54;

  v0[39] = v53;
  v0[40] = v55;
  uint64_t v56 = (void *)swift_task_alloc();
  v0[41] = v56;
  *uint64_t v56 = v0;
  v56[1] = LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:);
  uint64_t v57 = v0[27];
  return LiteMessageServiceSession.storeAndBroadcastDecryptedMessageData(_:in:context:)(v53, v55, v71, v57);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  id v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  outlined consume of Data._Representation(v2[39], v2[40]);
  uint64_t v3 = v2[34];
  uint64_t v4 = v2[33];
  if (v0) {
    uint64_t v5 = LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 280);
  swift_release();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  id v2 = (void *)v0[37];
  uint64_t v1 = (void *)v0[38];
  uint64_t v3 = v0[27];
  swift_release();

  outlined destroy of LiteMessageContext(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:)()
{
  uint64_t v1 = *(void **)(v0 + 304);
  swift_release();
  id v2 = IDSOffGridEncryptedMessage.pendingMessageCountForHandle.getter((SEL *)&selRef_pendingCount);
  id v3 = IDSOffGridEncryptedMessage.pendingMessageCountForHandle.getter((SEL *)&selRef_pendingTotalCount);
  [v1 updateIsDownloadingPendingSatelliteMessages:(uint64_t)v2 > 0];
  [v1 updatePendingIncomingSatelliteMessageCount:v2];
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v5 = result;
    id v6 = [*(id *)(v0 + 200) service];
    NSString v7 = [v6 internalName];

    if (!v7)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v7 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    uint64_t v9 = *(void **)(v0 + 296);
    unint64_t v8 = *(void **)(v0 + 304);
    uint64_t v10 = *(void *)(v0 + 216);
    [v5 updateBadgeForPendingSatelliteMessagesIfNeeded:v3 onService:v7];

    outlined destroy of LiteMessageContext(v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v11();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:)(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[12] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[13] = v5;
  v2[14] = v4;
  return _swift_task_switch(LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:), v5, v4);
}

uint64_t LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:)()
{
  uint64_t v1 = LiteMessageServiceSession.segmentStore.getter();
  *(void *)(v0 + 120) = v1;
  return _swift_task_switch(LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:), v1, 0);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  LiteMessageSegmentStore.insertMessageSegment(_:)(v0[6]);
  v0[16] = 0;
  swift_release();
  uint64_t v1 = v0[13];
  id v2 = v0[14];
  return _swift_task_switch(LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:), v1, v2);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;

  uint64_t v1 = v0[16];
  id v2 = IDSOffGridEncryptedMessage.consolidationIdentifier.getter();
  v0[17] = v1;
  v0[18] = v2;
  v0[19] = v3;
  if (v1)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    id v6 = LiteMessageServiceSession.segmentStore.getter();
    v0[20] = v6;
    return _swift_task_switch(LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:), v6, 0);
  }
}

{
  Swift::String *v0;
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t (*v4)();
  uint64_t v6;

  v0[10]._object = (void *)LiteMessageSegmentStore.countMessageSegments(for:)(v0[9]);
  v0[11]._uint64_t countAndFlagsBits = v1;
  if (v1)
  {
    object = v0[6]._object;
    uint64_t countAndFlagsBits = v0[7]._countAndFlagsBits;
    uint64_t v4 = LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:);
  }
  else
  {
    swift_release();
    object = v0[6]._object;
    uint64_t countAndFlagsBits = v0[7]._countAndFlagsBits;
    uint64_t v4 = LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:);
  }
  return _swift_task_switch(v4, object, countAndFlagsBits);
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  unint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  uint64_t v43 = v0;
  uint64_t v1 = *(id *)(v0 + 168);
  if (v1 == IDSOffGridEncryptedMessage.totalSegments.getter())
  {
    id v2 = *(void *)(v0 + 88);
    uint64_t v4 = *(void *)(v0 + 64);
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v5 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    swift_bridgeObjectRetain_n();
    id v6 = Logger.logObject.getter();
    uint64_t v7 = static os_log_type_t.info.getter();
    unint64_t v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void *)(v0 + 152);
    if (v8)
    {
      uint64_t v34 = *(void *)(v0 + 144);
      uint64_t v36 = *(void *)(v0 + 72);
      uint64_t v38 = *(void *)(v0 + 64);
      uint64_t v40 = *(void *)(v0 + 88);
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      BOOL v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v9, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v6, v7, "Received all message segments for %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v40, v38);
    }
    else
    {
      uint64_t v23 = *(void *)(v0 + 88);
      uint64_t v24 = *(void *)(v0 + 64);
      uint64_t v25 = *(void *)(v0 + 72);
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    }
    uint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v26;
    *uint64_t v26 = v0;
    v26[1] = LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:);
    uint64_t v28 = *(void *)(v0 + 144);
    uint64_t v27 = *(void *)(v0 + 152);
    return LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:)(v28, v27);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v13 = *(void *)(v0 + 64);
    uint64_t v14 = *(void **)(v0 + 48);
    swift_release();
    BOOL v15 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v15, v13);
    swift_bridgeObjectRetain();
    os_log_type_t v16 = v14;
    uint64_t v17 = Logger.logObject.getter();
    uint64_t v18 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = *(void *)(v0 + 168);
      uint64_t v20 = *(void *)(v0 + 152);
      uint64_t v35 = *(void *)(v0 + 144);
      uint64_t v37 = *(void *)(v0 + 72);
      uint64_t v39 = *(void *)(v0 + 64);
      uint64_t v41 = *(void *)(v0 + 80);
      uint64_t v21 = *(void **)(v0 + 48);
      uint64_t v22 = swift_slowAlloc();
      BOOL v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134218498;
      *(void *)(v0 + 16) = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v22 + 12) = 2048;
      *(void *)(v0 + 24) = IDSOffGridEncryptedMessage.totalSegments.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      *(_WORD *)(v22 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v20, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v17, v18, "Has %ld of %ld segments for %s, awaiting more segments", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v41, v39);
    }
    else
    {
      double v31 = *(void *)(v0 + 72);
      double v30 = *(void *)(v0 + 80);
      uint64_t v32 = *(void *)(v0 + 64);

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
    return v33();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  id v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = LiteMessageServiceSession.processReceivedEncryptedMessageSegment(_:);
  }
  return _swift_task_switch(v5, v3, v4);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:)(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  type metadata accessor for MainActor();
  v3[16] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v3[17] = v6;
  v3[18] = v5;
  return _swift_task_switch(LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:), v6, v5);
}

uint64_t LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:)()
{
  uint64_t v1 = LiteMessageServiceSession.segmentStore.getter();
  *(void *)(v0 + 152) = v1;
  return _swift_task_switch(LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:), v1, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v0[20] = LiteMessageSegmentStore.messageSegments(for:)(v0[8], v0[9]);
  v0[21] = 0;
  swift_release();
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return _swift_task_switch(LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:), v1, v2);
}

{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  id v20;
  Class isa;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  uint64_t v30;

  uint64_t v1 = v0[20];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = _CocoaArrayWrapper.endIndex.getter();
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease_n();
    swift_release();
    lazy protocol witness table accessor for type LiteMessageReceiveError and conformance LiteMessageReceiveError();
    swift_allocError();
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 0;
    *(unsigned char *)(v28 + 16) = 2;
    swift_willThrow();
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  id result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_18;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = *(id *)(v0[20] + 32);
  }
  v0[22] = v4;
  swift_bridgeObjectRelease();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (id)_CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(id *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  }
  if (v5 == IDSOffGridEncryptedMessage.totalSegments.getter())
  {
    uint64_t v6 = v0[15];
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[12];
    uint64_t v9 = Logger.liteSession.unsafeMutableAddressor();
    v0[23] = v9;
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v0[24] = v10;
    v0[25] = (v8 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v10(v6, v9, v7);
    swift_bridgeObjectRetain();
    uint64_t v11 = Logger.logObject.getter();
    uint64_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134217984;
      v0[7] = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v11, v12, "Consolidating and decrypting %ld segments", v13, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    os_log_type_t v16 = v0[15];
    uint64_t v17 = v0[11];
    uint64_t v18 = v0[12];
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v0[26] = v19;
    v0[27] = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v19(v16, v17);
    uint64_t v20 = objc_allocWithZone((Class)IDSOffGridEncryptedMessage);
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSOffGridEncryptedMessage);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v22 = [v20 initWithSegments:isa];
    v0[28] = v22;

    uint64_t v23 = [v22 identifier];
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    v0[29] = v26;
    uint64_t v27 = (void *)swift_task_alloc();
    v0[30] = v27;
    *uint64_t v27 = v0;
    v27[1] = LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:);
    return LiteMessageServiceSession.decryptAndStoreMessage(_:identifier:)((uint64_t)v22, v24, v26);
  }
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v14 = IDSOffGridEncryptedMessage.totalSegments.getter();
  lazy protocol witness table accessor for type LiteMessageReceiveError and conformance LiteMessageReceiveError();
  swift_allocError();
  *(void *)BOOL v15 = v5;
  *(void *)(v15 + 8) = v14;
  *(unsigned char *)(v15 + 16) = 1;
  swift_willThrow();

LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 248) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:);
  }
  return _swift_task_switch(v5, v3, v4);
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  (*(void (**)(void, void, void))(v0 + 192))(*(void *)(v0 + 112), *(void *)(v0 + 184), *(void *)(v0 + 88));
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&def_3494C, v1, v2, "Successfully decrypted and stored consolidated message, removing parts from store", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 88);

  v4(v5, v6);
  uint64_t v7 = LiteMessageServiceSession.segmentStore.getter();
  *(void *)(v0 + 256) = v7;
  return _swift_task_switch(LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:), v7, 0);
}

{
  Swift::String *v0;
  void *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t (*v4)();
  uint64_t v6;

  LiteMessageSegmentStore.deleteMessageSegments(for:)(v0[4]);
  v0[16]._object = v1;
  if (v1)
  {
    object = v0[8]._object;
    uint64_t countAndFlagsBits = v0[9]._countAndFlagsBits;
    uint64_t v4 = LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:);
  }
  else
  {
    swift_release();
    object = v0[8]._object;
    uint64_t countAndFlagsBits = v0[9]._countAndFlagsBits;
    uint64_t v4 = LiteMessageServiceSession.consolidateMessageWithConsolidationIdentifier(_:);
  }
  return _swift_task_switch(v4, object, countAndFlagsBits);
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 176);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = (void *)v0[22];
  swift_release();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  uint64_t v22 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 88);
  swift_release();
  swift_release();
  v1(v3, v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
    os_log_type_t v16 = *(void **)(v0 + 224);
    uint64_t v17 = *(void **)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 104);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = Error.localizedDescription.getter();
    *(void *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v9, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v5, v6, "Failed to clean up message segments: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v20(v19, v18);
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
    uint64_t v11 = *(void **)(v0 + 176);
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v13 = *(void *)(v0 + 88);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    v10(v12, v13);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IDSOffGridMessage, String)(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    return _swift_continuation_throwingResumeWithError(v4, v6);
  }
  else
  {
    if (a2)
    {
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = *(void **)(*(void *)(v4 + 64) + 40);
      *uint64_t v11 = a2;
      v11[1] = v10;
      v11[2] = v12;
      id v13 = a2;
      a1 = v4;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

void IDSOffGridEncryptedMessage.dateSent.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v1 respondsToSelector:"date"])
  {
    id v12 = [v1 date];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v12;
  }
  else
  {
    uint64_t v7 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    id v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&def_3494C, v8, v9, "IDSOffGridEncryptedMessage does not have date", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    static Date.now.getter();
  }
}

uint64_t LiteMessageServiceSession.storeAndBroadcastDecryptedMessageData(_:in:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  v5[16] = swift_task_alloc();
  v5[17] = type metadata accessor for LiteMessageContext();
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  v5[23] = v7;
  v5[24] = *(void *)(v7 - 8);
  v5[25] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[26] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(LiteMessageServiceSession.storeAndBroadcastDecryptedMessageData(_:in:context:), v9, v8);
}

void LiteMessageServiceSession.storeAndBroadcastDecryptedMessageData(_:in:context:)()
{
  v144 = v0;
  v140 = v0 + 5;
  v141 = v0 + 6;
  uint64_t v1 = (uint64_t *)v0[9];
  swift_release();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v143[0] = 0x2D6574696CLL;
  v143[1] = 0xE500000000000000;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)v1[1];
  swift_bridgeObjectRetain();
  v5._uint64_t countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = self;
  v7._uint64_t countAndFlagsBits = 0x617461642ELL;
  v7._object = (void *)0xE500000000000000;
  String.append(_:)(v7);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 writeDataPayloadToDisk:isa fileName:v8];

  if (!LiteMessageServiceSession.hasExistingMessageWithLiteIdentifier(_:in:)())
  {
    uint64_t v28 = v0[9];
    char v132 = *(unsigned char *)(v28 + 48);
    uint64_t v29 = 40;
    if (v132) {
      uint64_t v29 = 24;
    }
    uint64_t v30 = 32;
    if (*(unsigned char *)(v28 + 48)) {
      uint64_t v30 = 16;
    }
    uint64_t v31 = v0[24];
    os_log_t logb = (os_log_t)v0[25];
    uint64_t v139 = v0[23];
    uint64_t v133 = v0[17];
    uint64_t v33 = v0[6];
    unint64_t v32 = v0[7];
    uint64_t v34 = *(void **)(v28 + v29);
    uint64_t v35 = *(void *)(v28 + v30);
    swift_bridgeObjectRetain();
    v36._uint64_t countAndFlagsBits = v35;
    v36._object = v34;
    IMDChat.updateLastAddressedHandleWithMatchingSIM(to:)(v36);
    swift_bridgeObjectRelease();
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMMessageItem);
    uint64_t v37 = *(void *)(v28 + 16);
    uint64_t v38 = *(void *)(v28 + 24);
    (*(void (**)(os_log_t, uint64_t, uint64_t))(v31 + 16))(logb, v28 + *(int *)(v133 + 32), v139);
    swift_bridgeObjectRetain();
    outlined copy of Data._Representation(v33, v32);
    swift_bridgeObjectRetain();
    id v39 = specialized @nonobjc IMMessageItem.init(liteIdentifier:liteData:senderID:date:)(v3, (uint64_t)v4, v33, v32, v37, v38, (uint64_t)logb);
    outlined consume of Data._Representation(v33, v32);
    uint64_t v41 = v0[9];
    if (v132)
    {
      uint64_t v42 = 0x80000009005;
      uint64_t v43 = 36869;
    }
    else
    {
      uint64_t v42 = 0x80000000001;
      uint64_t v43 = 1;
    }
    uint64_t v44 = v0;
    uint64_t v17 = (void *)v0[17];
    uint64_t v45 = (void *)v44[8];
    swift_bridgeObjectRetain();
    uint64_t v46 = v39;
    NSString v47 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v46 setDestinationCallerID:v47];

    int v48 = *(unsigned __int8 *)(v41 + *((int *)v17 + 9));
    if (v48) {
      uint64_t v49 = v42;
    }
    else {
      uint64_t v49 = v43;
    }
    [v46 setFlags:v49];
    uint64_t v50 = &selRef_currentHandler;
    id v51 = [v45 chatIdentifier];
    if (!v51)
    {
      __break(1u);
      goto LABEL_48;
    }
    uint64_t v52 = v51;
    [(id)v44[10] didReceiveMessage:v46 forChat:v51 style:45 fromIDSID:0];

    if (v48)
    {
      outlined init with copy of LiteMessageContext(v44[9], v44[22]);
    }
    else
    {
      id v53 = [(id)v44[8] recipient];
      if (!v53)
      {
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      uint64_t v54 = v53;
      uint64_t v55 = v44[22];
      uint64_t v56 = v44[9];
      unsigned __int8 v57 = [v53 cachedOffGridMode];

      outlined init with copy of LiteMessageContext(v56, v55);
      if ((v57 & 1) == 0)
      {
        uint64_t v78 = v44[21];
        uint64_t v77 = v44[22];
        uint64_t v79 = v44[9];
        uint64_t v80 = *(void *)(v77 + *(int *)(v44[17] + 40));
        outlined destroy of LiteMessageContext(v77);
        outlined init with copy of LiteMessageContext(v79, v78);
        if (v80)
        {
          uint64_t v81 = v44[21];
          char v82 = *(unsigned char *)(v81 + 48);
          outlined destroy of LiteMessageContext(v81);
          uint64_t v17 = v44;
          if ((v82 & 1) == 0)
          {
            uint64_t v83 = v44[20];
            uint64_t v84 = v44[16];
            uint64_t v85 = v44[12];
            uint64_t v86 = v44[11];
            uint64_t v87 = (void *)v44[8];
            uint64_t v88 = v44[9];
            uint64_t v89 = Logger.liteSession.unsafeMutableAddressor();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 16))(v84, v89, v86);
            outlined init with copy of LiteMessageContext(v88, v83);
            id v90 = v87;
            os_log_type_t v91 = Logger.logObject.getter();
            os_log_type_t v92 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v91, v92))
            {
              os_log_type_t v135 = v92;
              log = v91;
              uint64_t v93 = (void *)v44[8];
              uint64_t v94 = swift_slowAlloc();
              v143[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v94 = 136315394;
              id v95 = [v93 chatIdentifier];
              uint64_t v17 = v44;
              if (!v95)
              {
LABEL_51:

                __break(1u);
                return;
              }
              uint64_t v96 = v95;
              uint64_t v97 = (uint64_t *)v44[20];
              uint64_t v129 = v44[12];
              uint64_t v130 = v44[11];
              uint64_t v131 = v44[16];
              uint64_t v98 = (void *)v44[8];
              uint64_t v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              unint64_t v101 = v100;

              v44[3] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v99, v101, v143);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();

              *(_WORD *)(v94 + 12) = 2080;
              uint64_t v102 = *v97;
              unint64_t v103 = v97[1];
              swift_bridgeObjectRetain();
              v44[4] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v102, v103, v143);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              outlined destroy of LiteMessageContext((uint64_t)v97);
              _os_log_impl(&def_3494C, log, v135, "Downgrading chat: %s to iMessage Lite as we received a message while on-grid: %s", (uint8_t *)v94, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v131, v130);
              uint64_t v50 = &selRef_currentHandler;
            }
            else
            {
              uint64_t v124 = v44[20];
              uint64_t v125 = v44[16];
              uint64_t v127 = v44[11];
              uint64_t v126 = v44[12];
              v128 = (void *)v44[8];

              outlined destroy of LiteMessageContext(v124);
              (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v125, v127);
              uint64_t v17 = v44;
            }
            objc_msgSend((id)v17[8], "setWasDowngradedToLiteMessage:", 1, v129, v130, v131);
          }
LABEL_26:
          if ([(id)v17[8] wasDowngradedToLiteMessage])
          {
            uint64_t v60 = v17[9];
            if (!*(void *)(v60 + *(int *)(v17[17] + 40)))
            {
              uint64_t v61 = v17[19];
              uint64_t v62 = v17[15];
              os_log_type_t v63 = v17;
              uint64_t v64 = v17[12];
              uint64_t v65 = v63[11];
              uint64_t v66 = Logger.liteSession.unsafeMutableAddressor();
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v62, v66, v65);
              uint64_t v17 = v63;
              outlined init with copy of LiteMessageContext(v60, v61);
              uint64_t v67 = Logger.logObject.getter();
              os_log_type_t v68 = static os_log_type_t.default.getter();
              BOOL v69 = os_log_type_enabled(v67, v68);
              unint64_t v70 = (uint64_t *)v63[19];
              uint64_t v71 = v63[15];
              uint64_t v72 = v63[11];
              uint64_t v73 = v63[12];
              if (v69)
              {
                v134 = v141 - 4;
                uint64_t v142 = v63[11];
                id v74 = (uint8_t *)swift_slowAlloc();
                v143[0] = swift_slowAlloc();
                *(_DWORD *)id v74 = 136315138;
                uint64_t v17 = v63;
                uint64_t v75 = *v70;
                unint64_t v76 = v70[1];
                swift_bridgeObjectRetain();
                uint64_t *v134 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v76, v143);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();
                outlined destroy of LiteMessageContext((uint64_t)v70);
                _os_log_impl(&def_3494C, v67, v68, "Clearing downgrade flag as the preferred service is iMessage %s", v74, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v71, v142);
              }
              else
              {
                outlined destroy of LiteMessageContext(v63[19]);

                (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v71, v72);
              }
              [(id)v17[8] setWasDowngradedToLiteMessage:0];
              uint64_t v50 = &selRef_currentHandler;
            }
          }
          id v104 = [self sharedInstance];
          if (v104)
          {
            uint64_t v105 = v104;
            id v106 = [v104 anySessionForServiceName:IMServiceNameiMessage];

            if (!v106)
            {
              uint64_t v111 = v17[14];
              v112 = v17;
              uint64_t v113 = v17[12];
              uint64_t v114 = v112;
              uint64_t v115 = v112[11];
              uint64_t v116 = Logger.liteSession.unsafeMutableAddressor();
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 16))(v111, v116, v115);
              v117 = Logger.logObject.getter();
              os_log_type_t v118 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v117, v118))
              {
                v119 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v119 = 0;
                _os_log_impl(&def_3494C, v117, v118, "No iMessage service session found for preferred service request", v119, 2u);
                swift_slowDealloc();
                v120 = v46;
              }
              else
              {
                v120 = v117;
                v117 = v46;
              }
              uint64_t v121 = v114[14];
              uint64_t v122 = v114[11];
              uint64_t v123 = v114[12];

              (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v121, v122);
              uint64_t v17 = v114;
              goto LABEL_10;
            }
            v107 = (void *)v17[8];
            NSString v108 = String._bridgeToObjectiveC()();
            id v109 = [v107 v50[51]];
            if (v109)
            {
              v110 = v109;
              [v106 deleteExistingMessageAwaitingReplacementWithFallbackHash:v108 chatIdentifier:v109];

              goto LABEL_10;
            }
            goto LABEL_49;
          }
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }
LABEL_25:
        outlined destroy of LiteMessageContext(v44[21]);
        uint64_t v17 = v44;
        goto LABEL_26;
      }
    }
    uint64_t v58 = v44[21];
    uint64_t v59 = v44[9];
    outlined destroy of LiteMessageContext(v44[22]);
    outlined init with copy of LiteMessageContext(v59, v58);
    goto LABEL_25;
  }
  uint64_t v9 = v0[18];
  uint64_t v10 = v0;
  id v13 = v0 + 12;
  uint64_t v12 = v0[12];
  uint64_t v11 = v13[1];
  uint64_t v14 = v10[11];
  uint64_t v15 = v10[9];
  uint64_t v16 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v16, v14);
  uint64_t v17 = v10;
  outlined init with copy of LiteMessageContext(v15, v9);
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = (uint64_t *)v10[18];
  uint64_t v23 = v10[12];
  uint64_t v22 = v10[13];
  uint64_t v24 = v10[11];
  if (v20)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    v143[0] = swift_slowAlloc();
    os_log_t loga = v24;
    *(_DWORD *)uint64_t v25 = 136315138;
    uint64_t v17 = v10;
    uint64_t v26 = *v21;
    unint64_t v27 = v21[1];
    swift_bridgeObjectRetain();
    uint64_t *v140 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of LiteMessageContext((uint64_t)v21);
    _os_log_impl(&def_3494C, v18, v19, "Already received message with identifier %s, dropping incoming message", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, os_log_t))(v23 + 8))(v22, loga);
  }
  else
  {
    outlined destroy of LiteMessageContext(v10[18]);

    (*(void (**)(uint64_t, NSObject *))(v23 + 8))(v22, v24);
  }
LABEL_10:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (void (*)(void))v17[1];
  v40();
}

id IDSOffGridEncryptedMessage.pendingMessageCountForHandle.getter(SEL *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v3 respondsToSelector:*a1])
  {
    id v8 = [v3 *a1];
    id v9 = [v8 integerValue];

    return v9;
  }
  else
  {
    uint64_t v11 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&def_3494C, v12, v13, "IDSOffGridEncryptedMessage does not have pending message count", v14, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return 0;
  }
}

uint64_t outlined destroy of LiteMessageContext(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LiteMessageContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id specialized @nonobjc IMMessageItem.init(liteIdentifier:liteData:senderID:date:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class v11 = Date._bridgeToObjectiveC()().super.isa;
  id v20 = 0;
  id v12 = [(id)swift_getObjCClassFromMetadata() messageItemWithLiteIdentifier:v8 liteData:isa senderID:v10 date:v11 error:&v20];

  id v13 = v20;
  if (v12)
  {
    uint64_t v14 = type metadata accessor for Date();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
    id v16 = v13;
    v15(a7, v14);
  }
  else
  {
    id v17 = v20;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v18 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a7, v18);
  }
  return v12;
}

uint64_t outlined init with copy of LiteMessageContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LiteMessageContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

iMessageLite::LiteMessageEffect_optional __swiftcall LiteMessageEffect.init(expressiveSendStyleID:)(Swift::String_optional expressiveSendStyleID)
{
  object = expressiveSendStyleID.value._object;
  uint64_t countAndFlagsBits = expressiveSendStyleID.value._countAndFlagsBits;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!object)
  {
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)13;
  }
  if (v3 == countAndFlagsBits && v4 == object)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_11;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v8 == object)
  {
    swift_bridgeObjectRelease();
LABEL_19:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)1;
  }
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v10) {
    goto LABEL_19;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v11 == object)
  {
    swift_bridgeObjectRelease();
LABEL_27:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)2;
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_27;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v14 == object)
  {
    swift_bridgeObjectRelease();
LABEL_32:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)3;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_32;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v16 == object)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)4;
  }
  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_37;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v18 == object)
  {
    swift_bridgeObjectRelease();
LABEL_42:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)5;
  }
  char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v19) {
    goto LABEL_42;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v20 == object)
  {
    swift_bridgeObjectRelease();
LABEL_47:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)6;
  }
  char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v21) {
    goto LABEL_47;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v22 == object)
  {
    swift_bridgeObjectRelease();
LABEL_52:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)7;
  }
  char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v23) {
    goto LABEL_52;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v24 == object)
  {
    swift_bridgeObjectRelease();
LABEL_57:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)8;
  }
  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_57;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v26 == object)
  {
    swift_bridgeObjectRelease();
LABEL_62:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)9;
  }
  char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v27) {
    goto LABEL_62;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v28 == object)
  {
    swift_bridgeObjectRelease();
LABEL_67:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)10;
  }
  char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v29) {
    goto LABEL_67;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v30 == object)
  {
    swift_bridgeObjectRelease();
LABEL_72:
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)11;
  }
  char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_72;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == countAndFlagsBits && v32 == object)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (iMessageLite::LiteMessageEffect_optional)12;
  }
  char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0) {
    return (iMessageLite::LiteMessageEffect_optional)13;
  }
  return (iMessageLite::LiteMessageEffect_optional)12;
}

uint64_t LiteMessageEffect.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LiteMessageEffect(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LiteMessageEffect()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LiteMessageEffect()
{
  Hasher._combine(_:)(*v0 + 1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LiteMessageEffect()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LiteMessageEffect@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = specialized LiteMessageEffect.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LiteMessageEffect(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t specialized LiteMessageEffect.init(rawValue:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xD) {
    return 13;
  }
  else {
    return a1 - 1;
  }
}

unint64_t lazy protocol witness table accessor for type LiteMessageEffect and conformance LiteMessageEffect()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageEffect and conformance LiteMessageEffect;
  if (!lazy protocol witness table cache variable for type LiteMessageEffect and conformance LiteMessageEffect)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageEffect and conformance LiteMessageEffect);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LiteMessageEffect(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LiteMessageEffect(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x227DCLL);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for LiteMessageEffect(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for LiteMessageEffect(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageEffect()
{
  return &type metadata for LiteMessageEffect;
}

void IMMessageItem.canSendAsLiteMessage.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v76 = *(void *)(v2 - 8);
  uint64_t v77 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  int v8 = (char *)&v74 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  Class v11 = (char *)&v74 - v10;
  __chkstk_darwin(v9);
  char v13 = (char *)&v74 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = [v1 guid];
  if (!v17)
  {
    __break(1u);
LABEL_33:

    __break(1u);
LABEL_34:

    __break(1u);
LABEL_35:

    __break(1u);
LABEL_36:

    __break(1u);
    return;
  }
  uint64_t v18 = v17;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  UUID.init(uuidString:)();
  swift_bridgeObjectRelease();
  uint64_t v19 = type metadata accessor for UUID();
  LODWORD(v18) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v16, 1, v19);
  outlined destroy of UUID?((uint64_t)v16);
  if (v18 == 1)
  {
    uint64_t v20 = Logger.liteSession.unsafeMutableAddressor();
    uint64_t v21 = v76;
    uint64_t v22 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v5, v20, v77);
    Class v11 = v1;
    char v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v23, v24))
    {

      (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
      return;
    }
    uint64_t v1 = (_DWORD *)swift_slowAlloc();
    uint64_t v79 = swift_slowAlloc();
    *uint64_t v1 = 136315138;
    id v25 = [v11 guid];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v29 = v28;

      uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v29, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v23, v24, "IMItem invalid for sending, has malformed GUID %s", (uint8_t *)v1, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v76 + 8))(v5, v77);
      return;
    }
    goto LABEL_33;
  }
  id v30 = [v1 fileTransferGUIDs];
  uint64_t v31 = v77;
  if (v30)
  {
    unint64_t v32 = v30;
    uint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v34 = *(void *)(v33 + 16);
    swift_bridgeObjectRelease();
    if (v34)
    {
      uint64_t v35 = Logger.liteSession.unsafeMutableAddressor();
      uint64_t v36 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v8, v35, v31);
      Class v11 = v1;
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v37, v38))
      {

        (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v31);
        return;
      }
      uint64_t v1 = (_DWORD *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      uint64_t v79 = v75;
      *uint64_t v1 = 136315138;
      id v39 = [v11 guid];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v43 = v42;

        uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v43, &v79);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&def_3494C, v37, v38, "IMItem invalid for sending %s has file transfers", (uint8_t *)v1, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v76 + 8))(v8, v77);
        return;
      }
      goto LABEL_34;
    }
  }
  id v44 = [v1 balloonBundleID];
  if (!v44) {
    goto LABEL_26;
  }

  id v45 = [v1 balloonBundleID];
  if (!v45)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    goto LABEL_20;
  }
  uint64_t v46 = v45;
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v49 = v48;

  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!v49)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v47 == v50 && v49 == v51)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v62 & 1) == 0)
  {
LABEL_21:
    uint64_t v52 = Logger.liteSession.unsafeMutableAddressor();
    uint64_t v53 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v11, v52, v31);
    uint64_t v1 = v1;
    uint64_t v54 = Logger.logObject.getter();
    os_log_type_t v55 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v54, v55))
    {

      (*(void (**)(char *, uint64_t))(v53 + 8))(v11, v31);
      return;
    }
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    uint64_t v79 = v75;
    *(_DWORD *)uint64_t v56 = 136315138;
    id v57 = [v1 guid];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v61 = v60;

      uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v61, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&def_3494C, v54, v55, "IMItem invalid for sending %s has balloon plugin", v56, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v76 + 8))(v11, v77);
      return;
    }
    goto LABEL_35;
  }
LABEL_26:
  if ([v1 scheduleType])
  {
    uint64_t v63 = Logger.liteSession.unsafeMutableAddressor();
    uint64_t v64 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v13, v63, v31);
    uint64_t v1 = v1;
    uint64_t v65 = Logger.logObject.getter();
    os_log_type_t v66 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v65, v66))
    {

      (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v31);
      return;
    }
    uint64_t v67 = swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    uint64_t v79 = v75;
    *(_DWORD *)uint64_t v67 = 136315394;
    id v68 = [v1 guid];
    if (v68)
    {
      BOOL v69 = v68;
      uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v72 = v71;

      uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v72, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 12) = 2048;
      id v73 = [v1 scheduleType];

      uint64_t v78 = (uint64_t)v73;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&def_3494C, v65, v66, "IMItem invalid for sending %s, is a scheduled message of type: %lu", (uint8_t *)v67, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v76 + 8))(v13, v77);
      return;
    }
    goto LABEL_36;
  }
}

uint64_t outlined destroy of UUID?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t LiteMessageHeader.backwardsCompatibilityText.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t LiteMessageHeader.append(to:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned __int8 v6 = a2;
  uint64_t result = IMMessageItem.IMMessageItemContentType.rawValue.getter(a2);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = result;
    do
    {
      if (v8 >= 8) {
        Swift::UInt8 v9 = v8 & 7 | 8;
      }
      else {
        Swift::UInt8 v9 = v8 & 7;
      }
      BitCollection.appendLeastSignificantBits(from:count:)(v9, 4u);
      BOOL v10 = v8 > 7;
      v8 >>= 3;
    }
    while (v10);
    uint64_t result = LiteMessageType.isCoreType.getter(v6);
    if ((result & 1) == 0)
    {
      if (a4) {
        uint64_t v11 = a3;
      }
      else {
        uint64_t v11 = 0;
      }
      if (a4) {
        uint64_t v12 = a4;
      }
      else {
        uint64_t v12 = (void *)0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      v13._uint64_t countAndFlagsBits = v11;
      v13._object = v12;
      BitCollection.appendAsCompressedBytes(_:)(v13);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t protocol witness for BitPackable.append(to:) in conformance LiteMessageHeader(uint64_t a1)
{
  return LiteMessageHeader.append(to:)(a1, *v1, *((void *)v1 + 1), *((void **)v1 + 2));
}

uint64_t destroy for LiteMessageHeader()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for LiteMessageHeader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LiteMessageHeader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LiteMessageHeader(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessageHeader(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteMessageHeader(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageHeader()
{
  return &type metadata for LiteMessageHeader;
}

BOOL static LiteMessageSegmentStoreError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void LiteMessageSegmentStoreError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int LiteMessageSegmentStoreError.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LiteMessageSegmentStoreError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LiteMessageSegmentStoreError()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LiteMessageSegmentStoreError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t BitCollection.startIndex.getter()
{
  return 0;
}

uint64_t LiteMessageSegmentStore.context.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unsigned __int8 v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v18 - v7;
  if (*(void *)(v1 + 112)) {
    return swift_retain();
  }
  if (specialized static LiteMessageSegmentStore.makePersistentContainer()())
  {
    uint64_t v9 = Logger.liteSegmentStore.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v9, v2);
    BOOL v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&def_3494C, v10, v11, "Initializing model context", v12, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    type metadata accessor for ModelContext();
    swift_allocObject();
    *(void *)(v1 + 112) = ModelContext.init(_:)();
    swift_release();
    return swift_retain();
  }
  uint64_t v14 = Logger.liteSegmentStore.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v17 = 0;
    _os_log_impl(&def_3494C, v15, v16, "No container available for context", v17, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return 0;
}

uint64_t LiteMessageSegmentStore.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  return v0;
}

uint64_t LiteMessageSegmentStore.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  return v0;
}

uint64_t LiteMessageSegmentStore.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LiteMessageSegmentStore.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t LiteMessageSegmentStore.unownedExecutor.getter()
{
  return v0;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (AnyHashable, Any)(v6, (uint64_t)v15);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

{
  void *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, IMServiceReachabilityHandleResult>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    char v8 = v7;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

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
    char v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    BOOL v13 = v2[2];
    uint64_t v14 = __OFADD__(v13, 1);
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

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  long long v17;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, Any)(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    char v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t LiteMessageSegmentStore.insertMessageSegment(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v40 - v6;
  uint64_t v8 = type metadata accessor for Date();
  __chkstk_darwin(v8 - 8);
  long long v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!LiteMessageSegmentStore.context.getter())
  {
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    *uint64_t v14 = 0;
    return swift_willThrow();
  }
  BOOL v11 = LiteMessageSegmentStore.hasExistingMessageSegment(for:)();
  if (v1) {
    return swift_release();
  }
  if (v11)
  {
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    char v13 = 8;
LABEL_9:
    *uint64_t v12 = v13;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v45 = v4;
  uint64_t v16 = self;
  id v48 = 0;
  id v17 = [v16 archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v48];
  id v18 = v48;
  if (!v17)
  {
    uint64_t v22 = v18;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    char v13 = 1;
    goto LABEL_9;
  }
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v46 = v20;

  uint64_t v21 = IDSOffGridEncryptedMessage.consolidationIdentifier.getter();
  uint64_t v42 = v23;
  os_log_t v43 = v21;
  id v44 = (void *)type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
  id v24 = IDSOffGridEncryptedMessage.segmentNumber.getter();
  static Date.now.getter();
  unint64_t v25 = v46;
  outlined copy of Data._Representation(v19, v46);
  uint64_t v26 = LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.__allocating_init(consolidationIdentifier:segmentNumber:dateReceived:data:)((uint64_t)v43, v42, (uint64_t)v24, v10, v19, v25);
  lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  dispatch thunk of ModelContext.insert<A>(_:)();
  dispatch thunk of ModelContext.save()();
  uint64_t v27 = v19;
  uint64_t v28 = Logger.liteSegmentStore.unsafeMutableAddressor();
  uint64_t v29 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v7, v28, v3);
  swift_retain_n();
  id v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.default.getter();
  int v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v42 = v27;
    uint64_t v34 = v33;
    id v44 = (void *)swift_slowAlloc();
    id v48 = v44;
    *(_DWORD *)uint64_t v34 = 134218242;
    uint64_t v35 = *(uint64_t (**)(void))(*v26 + 200);
    os_log_t v43 = v30;
    uint64_t v47 = v35();
    LODWORD(v41) = v32;
    uint64_t v36 = UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v34 + 12) = 2080;
    uint64_t v37 = (*(uint64_t (**)(uint64_t))(*v26 + 152))(v36);
    uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, (uint64_t *)&v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v39 = v43;
    _os_log_impl(&def_3494C, v43, (os_log_type_t)v41, "Stored message segment %ld of %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();

    swift_release();
    outlined consume of Data._Representation(v42, v46);
    return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v7, v3);
  }
  else
  {
    outlined consume of Data._Representation(v27, v46);

    swift_release();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v7, v3);
  }
}

unint64_t lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError;
  if (!lazy protocol witness table cache variable for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError;
  if (!lazy protocol witness table cache variable for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError);
  }
  return result;
}

BOOL LiteMessageSegmentStore.hasExistingMessageSegment(for:)()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  __chkstk_darwin(v1);
  uint64_t v28 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FetchDescriptor<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>);
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (LiteMessageSegmentStore.context.getter())
  {
    uint64_t v26 = v7;
    uint64_t v27 = v6;
    uint64_t v13 = IDSOffGridEncryptedMessage.consolidationIdentifier.getter();
    if (v0)
    {
      swift_release();
    }
    else
    {
      uint64_t v17 = v13;
      uint64_t v18 = v14;
      id v19 = IDSOffGridEncryptedMessage.segmentNumber.getter();
      v25[3] = v25;
      uint64_t v20 = __chkstk_darwin(v19);
      v25[-4] = v17;
      v25[-3] = v18;
      v25[-2] = v20;
      uint64_t v33 = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
      Predicate.init(_:)();
      swift_bridgeObjectRelease();
      uint64_t v22 = v31;
      uint64_t v21 = v32;
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v5, v12, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v5, 0, 1, v21);
      lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
      FetchDescriptor.init(predicate:sortBy:)();
      uint64_t v23 = dispatch thunk of ModelContext.fetchCount<A>(_:)();
      swift_release();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v21);
      return v23 > 0;
    }
  }
  else
  {
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    *uint64_t v16 = 0;
    swift_willThrow();
  }
  return v15;
}

uint64_t closure #3 in LiteMessageSegmentStore.hasExistingMessageSegment(for:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v60 = a4;
  uint64_t v48 = a3;
  os_log_type_t v66 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Value<Int>);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v62 = v7;
  uint64_t v63 = v8;
  __chkstk_darwin(v7);
  uint64_t v58 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>);
  uint64_t v61 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v54 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v64 = v11;
  uint64_t v65 = v12;
  __chkstk_darwin(v11);
  id v57 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Value<String>);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v52 = v14;
  uint64_t v53 = v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v49 = v22;
  uint64_t v50 = v23;
  __chkstk_darwin(v22);
  unint64_t v25 = (char *)v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v55 = v26;
  uint64_t v56 = v27;
  __chkstk_darwin(v26);
  uint64_t v51 = (char *)v45 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = *a1;
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>, &demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v19 + 8);
  v45[1] = v19 + 8;
  unint64_t v46 = v29;
  v29(v21, v18);
  uint64_t v67 = a2;
  uint64_t v68 = v48;
  static PredicateExpressions.build_Arg<A>(_:)();
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String> and conformance PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<String>);
  uint64_t v30 = v49;
  uint64_t v31 = v52;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v17, v31);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v25, v30);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  uint64_t v32 = v54;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v46(v21, v18);
  uint64_t v67 = v60;
  uint64_t v33 = v58;
  static PredicateExpressions.build_Arg<A>(_:)();
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int> and conformance PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<Int> and conformance PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<Int>);
  uint64_t v34 = v57;
  uint64_t v35 = v33;
  uint64_t v36 = v59;
  uint64_t v37 = v62;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v35, v37);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v32, v36);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>>);
  os_log_t v39 = v66;
  v66[3] = v38;
  v39[4] = lazy protocol witness table accessor for type PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>> and conformance <> PredicateExpressions.Conjunction<A, B>();
  __swift_allocate_boxed_opaque_existential_1(v39);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance PredicateExpressions.Equal<A, B>, &demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>> and conformance PredicateExpressions.Equal<A, B>, &demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>);
  uint64_t v40 = v51;
  uint64_t v41 = v34;
  uint64_t v42 = v55;
  uint64_t v43 = v64;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v41, v43);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v40, v42);
}

uint64_t key path getter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 160);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t key path getter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 208))(*a1);
}

void *LiteMessageSegmentStore.messageSegments(for:)(uint64_t a1, unint64_t a2)
{
  unint64_t v76 = a2;
  uint64_t v74 = type metadata accessor for Logger();
  uint64_t v77 = *(void *)(v74 - 8);
  uint64_t v4 = __chkstk_darwin(v74);
  uint64_t v75 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v60 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FetchDescriptor<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  uint64_t v71 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = LiteMessageSegmentStore.context.getter();
  if (v18)
  {
    unint64_t v72 = (unint64_t)v7;
    uint64_t v70 = v11;
    uint64_t v19 = v18;
    os_log_type_t v66 = &v60;
    __chkstk_darwin(v18);
    unint64_t v20 = v76;
    *(&v60 - 2) = a1;
    *(&v60 - 1) = v20;
    v79[2] = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
    Predicate.init(_:)();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    uint64_t v67 = v17;
    v21(v10, v17, v14);
    uint64_t v64 = v15;
    uint64_t v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
    uint64_t v69 = v14;
    v22(v10, 0, 1, v14);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SortDescriptor<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>>);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SortDescriptor<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_46FB0;
    swift_getKeyPath();
    SortDescriptor.init<A>(_:order:)();
    lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
    FetchDescriptor.init(predicate:sortBy:)();
    uint64_t v68 = v13;
    uint64_t v65 = v19;
    unint64_t v23 = v73;
    uint64_t v24 = dispatch thunk of ModelContext.fetch<A>(_:)();
    if (v23)
    {
LABEL_22:
      uint64_t v44 = Logger.liteSegmentStore.unsafeMutableAddressor();
      uint64_t v45 = v77;
      uint64_t v46 = v74;
      (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v75, v44, v74);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v47 = Logger.logObject.getter();
      os_log_type_t v48 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        uint64_t v50 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = 138412290;
        swift_errorRetain();
        uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
        v79[0] = v51;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v50 = v51;
        uint64_t v45 = v77;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&def_3494C, v47, v48, "Failed to fetch segments: %@", v49, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v52 = v71;
      uint64_t v54 = v68;
      uint64_t v53 = v69;
      uint64_t v55 = v64;
      uint64_t v56 = v67;

      (*(void (**)(char *, uint64_t))(v45 + 8))(v75, v46);
      lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
      swift_allocError();
      *id v57 = 3;
      swift_willThrow();
      swift_release();
      swift_errorRelease();
      uint64_t v58 = *(void (**)(char *, uint64_t))(v52 + 8);
      uint64_t v2 = (void *)(v52 + 8);
      v58(v54, v70);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v53);
    }
    else
    {
      unint64_t v26 = v24;
      uint64_t v63 = a1;
      uint64_t v27 = Logger.liteSegmentStore.unsafeMutableAddressor();
      uint64_t v28 = v77;
      uint64_t v29 = v72;
      uint64_t v30 = v74;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v77 + 16))(v72, v27, v74);
      swift_bridgeObjectRetain_n();
      unint64_t v31 = v76;
      swift_bridgeObjectRetain_n();
      uint64_t v32 = Logger.logObject.getter();
      int v33 = static os_log_type_t.info.getter();
      BOOL v34 = os_log_type_enabled(v32, (os_log_type_t)v33);
      unint64_t v73 = v26 >> 62;
      if (!v34)
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
        goto LABEL_10;
      }
      int v62 = v33;
      unint64_t v35 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      v79[0] = v61;
      *(_DWORD *)unint64_t v35 = 134218242;
      if (v26 >> 62) {
        goto LABEL_32;
      }
      uint64_t v36 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8));
LABEL_8:
      uint64_t v37 = v63;
      swift_bridgeObjectRelease();
      uint64_t v78 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v31, v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v32, (os_log_type_t)v62, "Fetched %ld segments of %s", (uint8_t *)v35, 0x16u);
      unint64_t v31 = v61;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v29, v74);
LABEL_10:
      uint64_t v39 = v69;
      uint64_t v38 = v70;
      unint64_t v35 = (unint64_t)v67;
      uint64_t v40 = (uint64_t)v68;
      if (v73)
      {
        while (1)
        {
          swift_bridgeObjectRetain();
          uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v29) {
            break;
          }
LABEL_12:
          unint64_t v76 = v26;
          v79[0] = (uint64_t)&_swiftEmptyArrayStorage;
          uint64_t v32 = v79;
          specialized ContiguousArray.reserveCapacity(_:)();
          if (v29 < 0)
          {
            __break(1u);
LABEL_32:
            swift_bridgeObjectRetain();
            uint64_t v36 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            goto LABEL_8;
          }
          unint64_t v73 = type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
          unint64_t v26 = type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSOffGridEncryptedMessage);
          uint64_t v38 = 0;
          unint64_t v72 = v76 & 0xC000000000000001;
          while (v29 != v38)
          {
            if (v72)
            {
              uint64_t v39 = specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else
            {
              uint64_t v39 = *(void *)(v76 + 8 * v38 + 32);
              swift_retain();
            }
            uint64_t v41 = (*(uint64_t (**)(void))(*(void *)v39 + 296))();
            unint64_t v35 = v42;
            uint64_t v40 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
            outlined consume of Data._Representation(v41, v35);
            if (!v40)
            {
              lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
              swift_allocError();
              *uint64_t v43 = 4;
              swift_willThrow();
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_22;
            }
            ++v38;
            swift_release();
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v31 = *(void *)(v79[0] + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
            if (v29 == v38)
            {
              uint64_t v2 = (void *)v79[0];
              swift_release();
              uint64_t v39 = v69;
              uint64_t v38 = v70;
              unint64_t v35 = (unint64_t)v67;
              uint64_t v40 = (uint64_t)v68;
              goto LABEL_29;
            }
          }
          __break(1u);
        }
      }
      else
      {
        uint64_t v29 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8));
        if (v29) {
          goto LABEL_12;
        }
      }
      swift_release();
      uint64_t v2 = &_swiftEmptyArrayStorage;
LABEL_29:
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v40, v38);
      (*(void (**)(unint64_t, uint64_t))(v64 + 8))(v35, v39);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    *unint64_t v25 = 0;
    swift_willThrow();
  }
  return v2;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiteMessageSegmentStore.countMessageSegments(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  __chkstk_darwin(v3);
  uint64_t v36 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FetchDescriptor<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = LiteMessageSegmentStore.context.getter();
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v32 = (char *)v29;
    __chkstk_darwin(v15);
    v29[-2] = countAndFlagsBits;
    v29[-1] = object;
    uint64_t v40 = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
    Predicate.init(_:)();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v7, v14, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
    lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
    FetchDescriptor.init(predicate:sortBy:)();
    uint64_t v17 = v33;
    uint64_t v18 = dispatch thunk of ModelContext.fetchCount<A>(_:)();
    if (v17)
    {
      uint64_t v19 = Logger.liteSegmentStore.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v36, v19, v38);
      swift_errorRetain();
      swift_errorRetain();
      unint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v31 = v16;
        uint64_t v24 = (void *)v23;
        int v33 = v20;
        *(_DWORD *)uint64_t v22 = 138412290;
        v29[1] = v22 + 4;
        uint64_t v30 = v22;
        swift_errorRetain();
        uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v39 = v25;
        unint64_t v20 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v24 = v25;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&def_3494C, v20, v21, "Failed to fetch count: %@", v30, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v7 = v32;

      (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
      lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
      swift_allocError();
      *uint64_t v27 = 6;
      swift_willThrow();
      swift_release();
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    else
    {
      uint64_t v7 = (char *)v18;
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
  else
  {
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    *unint64_t v26 = 0;
    swift_willThrow();
  }
  return (Swift::Int)v7;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiteMessageSegmentStore.deleteMessageSegments(for:)(Swift::String a1)
{
  object = (uint8_t *)a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v43 = (char *)v39 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>);
  uint64_t v11 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = LiteMessageSegmentStore.context.getter();
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v45 = v39;
    uint64_t v46 = v3;
    __chkstk_darwin(v14);
    uint64_t v16 = object;
    v39[-2] = countAndFlagsBits;
    v39[-1] = v16;
    v51[2] = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
    Predicate.init(_:)();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v44 = v13;
    uint64_t v18 = v49;
    v17(v10, v13, v49);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v10, 0, 1, v18);
    lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
    dispatch thunk of ModelContext.delete<A>(model:where:includeSubclasses:)();
    if (v1)
    {
      uint64_t v42 = v11;
      outlined destroy of Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?((uint64_t)v10);
      uint64_t v19 = Logger.liteSegmentStore.unsafeMutableAddressor();
      uint64_t v20 = v46;
      uint64_t v21 = v47;
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v6, v19, v46);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = (void *)swift_slowAlloc();
        object = v24;
        *(_DWORD *)uint64_t v24 = 138412290;
        swift_errorRetain();
        uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
        v51[0] = v26;
        uint64_t v20 = v46;
        uint64_t v21 = v47;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v25 = v26;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&def_3494C, v22, v23, "Failed to delete segments: %@", object, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v37 = v44;

      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v20);
      lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
      swift_allocError();
      unsigned char *v38 = 3;
      swift_willThrow();
      swift_release();
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v37, v49);
    }
    else
    {
      uint64_t v40 = countAndFlagsBits;
      uint64_t v41 = v15;
      outlined destroy of Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?((uint64_t)v10);
      uint64_t v28 = Logger.liteSegmentStore.unsafeMutableAddressor();
      uint64_t v29 = v46;
      uint64_t v30 = v47;
      uint64_t v31 = v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v43, v28, v46);
      swift_bridgeObjectRetain_n();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v42 = v11;
        uint64_t v34 = v30;
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136315138;
        v39[1] = v35 + 4;
        uint64_t v36 = object;
        swift_bridgeObjectRetain();
        uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, (unint64_t)v36, v51);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_3494C, v32, v33, "Deleted segments of %s", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v46);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v49);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        swift_release();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v29);
        (*(void (**)(char *, uint64_t))(v11 + 8))(v44, v49);
      }
    }
  }
  else
  {
    lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
    swift_allocError();
    *uint64_t v27 = 0;
    swift_willThrow();
  }
}

uint64_t closure #4 in LiteMessageSegmentStore.messageSegments(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Value<String>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  uint64_t v21 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>, &demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  static PredicateExpressions.build_Arg<A>(_:)();
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>);
  a3[4] = lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>();
  __swift_allocate_boxed_opaque_existential_1(a3);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String> and conformance PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<String>);
  uint64_t v16 = v20;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

Swift::Void __swiftcall LiteMessageSegmentStore.deleteAbandonedMessageSegments()()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v60 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v51 - v5;
  __chkstk_darwin(v4);
  uint64_t v56 = (char *)&v51 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>);
  uint64_t v11 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for Date();
  uint64_t v59 = *(void *)(v61 - 8);
  uint64_t v14 = __chkstk_darwin(v61);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v19 = LiteMessageSegmentStore.context.getter();
  if (v19)
  {
    uint64_t v20 = (char *)v19;
    uint64_t v21 = Date.init(timeIntervalSinceNow:)();
    id v57 = &v51;
    __chkstk_darwin(v21);
    *(&v51 - 2) = (uint8_t *)v18;
    uint64_t v65 = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
    Predicate.init(_:)();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v58 = v13;
    uint64_t v23 = v62;
    v22(v10, v13, v62);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v10, 0, 1, v23);
    lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
    dispatch thunk of ModelContext.delete<A>(model:where:includeSubclasses:)();
    uint64_t v60 = v20;
    outlined destroy of Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?((uint64_t)v10);
    uint64_t v32 = Logger.liteSegmentStore.unsafeMutableAddressor();
    os_log_type_t v33 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v56, v32, v0);
    uint64_t v34 = v59;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v16, v18, v61);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    BOOL v37 = os_log_type_enabled(v35, v36);
    uint64_t v38 = v18;
    if (v37)
    {
      os_log_t v53 = v35;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v54 = v11;
      uint64_t v40 = (uint8_t *)v39;
      uint64_t v52 = swift_slowAlloc();
      uint64_t v64 = v52;
      *(_DWORD *)uint64_t v40 = 136315138;
      uint64_t v51 = v40 + 4;
      lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment((unint64_t *)&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v55 = v38;
      uint64_t v41 = v34;
      uint64_t v42 = v61;
      uint64_t v43 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, &v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v45 = *(void (**)(char *, uint64_t))(v41 + 8);
      uint64_t v46 = v16;
      uint64_t v47 = v55;
      v45(v46, v42);
      os_log_type_t v48 = v47;
      os_log_t v49 = v53;
      _os_log_impl(&def_3494C, v53, v36, "Deleted segments older than %s", v40, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v33, v0);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v58, v62);
      v45(v48, v61);
    }
    else
    {

      swift_release();
      uint64_t v50 = *(void (**)(char *, uint64_t))(v34 + 8);
      v50(v16, v61);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v33, v0);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v58, v62);
      v50(v18, v61);
    }
  }
  else
  {
    uint64_t v24 = Logger.liteSegmentStore.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v24, v0);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = v0;
      uint64_t v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 138412290;
      lazy protocol witness table accessor for type LiteMessageSegmentStoreError and conformance LiteMessageSegmentStoreError();
      swift_allocError();
      unsigned char *v30 = 0;
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v65 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v29 = v31;
      _os_log_impl(&def_3494C, v25, v26, "Failed to delete abandoned message segments: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      uint64_t v0 = v28;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  }
}

uint64_t closure #4 in LiteMessageSegmentStore.deleteAbandonedMessageSegments()@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  v22[1] = a1;
  uint64_t v24 = a2;
  uint64_t v23 = type metadata accessor for PredicateExpressions.ComparisonOperator();
  v22[0] = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Value<Date>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  uint64_t v26 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>, &demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for Date();
  static PredicateExpressions.build_Arg<A>(_:)();
  uint64_t v16 = v22[0];
  uint64_t v17 = v23;
  (*(void (**)(char *, void, uint64_t))(v22[0] + 104))(v3, enum case for PredicateExpressions.ComparisonOperator.lessThan(_:), v23);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>>);
  uint64_t v19 = v24;
  v24[3] = v18;
  v19[4] = lazy protocol witness table accessor for type PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>> and conformance <> PredicateExpressions.Comparison<A, B>();
  __swift_allocate_boxed_opaque_existential_1(v19);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date> and conformance PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>);
  lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<Date> and conformance PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<Date>);
  lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v20 = v25;
  static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t key path getter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 248))();
}

uint64_t key path setter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 256))(v6);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiteMessageSegmentStore.deleteStore()()
{
  uint64_t v97 = type metadata accessor for Logger();
  uint64_t v86 = *(void *)(v97 - 8);
  uint64_t v1 = __chkstk_darwin(v97);
  uint64_t v96 = (char *)&v77 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v78 = (char *)&v77 - v3;
  uint64_t v4 = type metadata accessor for URL.DirectoryHint();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v85 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v84 = (char *)&v77 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v77 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v77 - v17;
  *(void *)(v0 + 112) = 0;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_47290;
  id v19 = (id)IMSMSDirectoryURL();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v95 = (void (**)(char *, uint64_t))0x8000000000048D60;
  id v100 = (id)0xD000000000000013;
  unint64_t v101 = 0x8000000000048D60;
  LODWORD(v94) = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v20 = *(void (**)(char *))(v5 + 104);
  uint64_t v91 = v5 + 104;
  *(void *)&long long v93 = v20;
  uint64_t v87 = v4;
  v20(v7);
  unint64_t v90 = lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(path:directoryHint:)();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v88 = v5 + 8;
  uint64_t v89 = v21;
  v21(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v81 = v8;
  v22(v16, v8);
  uint64_t v23 = URL.path.getter();
  uint64_t v25 = v24;
  v22(v18, v8);
  uint64_t v26 = v9 + 8;
  uint64_t v27 = inited;
  uint64_t v28 = inited;
  *(void *)(inited + 32) = v23;
  uint64_t v79 = v28 + 32;
  *(void *)(v27 + 40) = v25;
  uint64_t v29 = v27 + 40;
  id v30 = (id)IMSMSDirectoryURL();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v100 = (id)0xD000000000000013;
  unint64_t v101 = (unint64_t)v95;
  uint64_t v31 = v87;
  ((void (*)(char *, void, uint64_t))v93)(v7, v94, v87);
  uint64_t v32 = v84;
  char v82 = v7;
  uint64_t v80 = v16;
  URL.appending<A>(path:directoryHint:)();
  v89(v7, v31);
  swift_bridgeObjectRelease();
  uint64_t v33 = v81;
  uint64_t v83 = v26;
  v22(v16, v81);
  uint64_t v34 = v32;
  uint64_t v35 = (void *)URL.path.getter();
  unint64_t v37 = v36;
  v22(v34, v33);
  id v100 = v35;
  unint64_t v101 = v37;
  swift_bridgeObjectRetain();
  v38._uint64_t countAndFlagsBits = 1835561773;
  v38._object = (void *)0xE400000000000000;
  String.append(_:)(v38);
  swift_bridgeObjectRelease();
  unint64_t v39 = v101;
  uint64_t v40 = inited;
  *(void *)(inited + 48) = v100;
  *(void *)(v40 + 56) = v39;
  id v41 = (id)IMSMSDirectoryURL();
  uint64_t v42 = v80;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v100 = (id)0xD000000000000013;
  unint64_t v101 = (unint64_t)v95;
  uint64_t v43 = v82;
  uint64_t v44 = v87;
  ((void (*)(char *, void, uint64_t))v93)(v82, v94, v87);
  uint64_t v45 = v85;
  URL.appending<A>(path:directoryHint:)();
  v89(v43, v44);
  swift_bridgeObjectRelease();
  v22(v42, v33);
  uint64_t v46 = v45;
  uint64_t v47 = (void *)URL.path.getter();
  unint64_t v49 = v48;
  v22(v46, v33);
  id v100 = v47;
  unint64_t v101 = v49;
  swift_bridgeObjectRetain();
  v50._uint64_t countAndFlagsBits = 1818326829;
  v50._object = (void *)0xE400000000000000;
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  unint64_t v51 = v101;
  uint64_t v52 = inited;
  *(void *)(inited + 64) = v100;
  *(void *)(v52 + 72) = v51;
  uint64_t v53 = v52;
  uint64_t v54 = self;
  unint64_t v55 = 0;
  uint64_t v94 = (void (**)(char *, uint64_t, uint64_t))(v86 + 16);
  id v95 = (void (**)(char *, uint64_t))(v86 + 8);
  *(void *)&long long v56 = 138412290;
  long long v93 = v56;
  while (1)
  {
    if (v55 >= *(void *)(v53 + 16)) {
      __break(1u);
    }
    swift_bridgeObjectRetain();
    id v58 = [v54 defaultManager];
    NSString v59 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v100 = 0;
    unsigned int v60 = [v58 removeItemAtPath:v59 error:&v100];

    if (!v60) {
      break;
    }
    id v57 = v100;
LABEL_3:
    ++v55;
    v29 += 16;
    if (v55 == 3)
    {
      swift_setDeallocating();
      swift_arrayDestroy();
      return;
    }
  }
  id v61 = v100;
  uint64_t v62 = (void *)_convertNSErrorToError(_:)();

  swift_willThrow();
  id v100 = v62;
  swift_errorRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSError);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  swift_errorRelease();
  id v63 = v99;
  if ([v99 code] == &dword_4)
  {
    uint64_t v64 = Logger.liteSegmentStore.unsafeMutableAddressor();
    (*v94)(v96, v64, v97);
    uint64_t v65 = v63;
    os_log_type_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      uint64_t v69 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v68 = v93;
      *(void *)(v68 + 4) = v65;
      *uint64_t v69 = v65;
      _os_log_impl(&def_3494C, v66, v67, "File not found, ignoring error: %@", (uint8_t *)v68, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      os_log_type_t v66 = v65;
    }

    (*v95)(v96, v97);
    swift_errorRelease();
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  uint64_t v70 = Logger.liteSegmentStore.unsafeMutableAddressor();
  (*v94)(v78, v70, v97);
  uint64_t v71 = v63;
  unint64_t v72 = Logger.logObject.getter();
  os_log_type_t v73 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v72, v73))
  {
    uint64_t v74 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v74 = v93;
    uint64_t v98 = v71;
    unint64_t v76 = v71;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v75 = v71;

    _os_log_impl(&def_3494C, v72, v73, "Error removing file: %@", v74, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    unint64_t v72 = v71;
  }

  (*v95)(v78, v97);
  swift_willThrow();
LABEL_18:
  swift_errorRelease();
}

uint64_t partial apply for closure #3 in LiteMessageSegmentStore.countMessageSegments(for:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #4 in LiteMessageSegmentStore.messageSegments(for:)(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t outlined destroy of Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{LiteMessageSegmentStoreSchemaV1.LiteMessageSegment}>?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t partial apply for closure #4 in LiteMessageSegmentStore.deleteAbandonedMessageSegments()@<X0>(uint64_t *a1@<X8>)
{
  return closure #4 in LiteMessageSegmentStore.deleteAbandonedMessageSegments()(*(void *)(v1 + 16), a1);
}

uint64_t getEnumTagSinglePayload for LiteMessageSegmentStoreError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LiteMessageSegmentStoreError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x287A4);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageSegmentStoreError()
{
  return &type metadata for LiteMessageSegmentStoreError;
}

uint64_t type metadata accessor for LiteMessageSegmentStore()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>> and conformance <> PredicateExpressions.Comparison<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>> and conformance <> PredicateExpressions.Comparison<A, B>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>> and conformance <> PredicateExpressions.Comparison<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>>);
    lazy protocol witness table accessor for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date> and conformance <> PredicateExpressions.KeyPath<A, B>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date> and conformance <> PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>);
    lazy protocol witness table accessor for type PredicateExpressions.Value<Date> and conformance <A> PredicateExpressions.Value<A>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Comparison<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date>, PredicateExpressions.Value<Date>> and conformance <> PredicateExpressions.Comparison<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Value<Date> and conformance <A> PredicateExpressions.Value<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Value<Date> and conformance <A> PredicateExpressions.Value<A>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Value<Date> and conformance <A> PredicateExpressions.Value<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Value<Date>);
    lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
    lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Value<Date> and conformance <A> PredicateExpressions.Value<A>);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>);
    lazy protocol witness table accessor for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date> and conformance <> PredicateExpressions.KeyPath<A, B>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String> and conformance <> PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>);
    lazy protocol witness table accessor for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<String>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date> and conformance <> PredicateExpressions.KeyPath<A, B>(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>, &demangling cache variable for type metadata for PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t partial apply for closure #3 in LiteMessageSegmentStore.hasExistingMessageSegment(for:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #3 in LiteMessageSegmentStore.hasExistingMessageSegment(for:)(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>> and conformance <> PredicateExpressions.Conjunction<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>> and conformance <> PredicateExpressions.Conjunction<A, B>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>> and conformance <> PredicateExpressions.Conjunction<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>>);
    lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>();
    lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>> and conformance <> PredicateExpressions.Equal<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Conjunction<PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, String>, PredicateExpressions.Value<String>>, PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>> and conformance <> PredicateExpressions.Conjunction<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>> and conformance <> PredicateExpressions.Equal<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>> and conformance <> PredicateExpressions.Equal<A, B>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>> and conformance <> PredicateExpressions.Equal<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>>);
    lazy protocol witness table accessor for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Date> and conformance <> PredicateExpressions.KeyPath<A, B>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int> and conformance <> PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>);
    lazy protocol witness table accessor for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<Int> and conformance <A> PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<Int>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment>, Int>, PredicateExpressions.Value<Int>> and conformance <> PredicateExpressions.Equal<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t specialized static LiteMessageSegmentStore.makePersistentContainer()()
{
  uint64_t v20 = type metadata accessor for Logger();
  v19[2] = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  v19[1] = (char *)v19 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = type metadata accessor for ModelConfiguration.CloudKitDatabase();
  __chkstk_darwin(v1 - 8);
  *(void *)&long long v23 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v21 - 8);
  uint64_t v8 = __chkstk_darwin(v21);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v25 = type metadata accessor for ModelConfiguration();
  uint64_t v22 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Schema();
  lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1 and conformance LiteMessageSegmentStoreSchemaV1();
  uint64_t v24 = Schema.__allocating_init(versionedSchema:)();
  id v13 = (id)IMSMSDirectoryURL();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v26 = 0xD000000000000013;
  unint64_t v27 = 0x8000000000048D60;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v3);
  lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(path:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  static ModelConfiguration.CloudKitDatabase.none.getter();
  ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
  type metadata accessor for ModelContainer();
  lazy protocol witness table accessor for type LiteMessageSegmentStoreMigrationPlan and conformance LiteMessageSegmentStoreMigrationPlan();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ModelConfiguration>);
  uint64_t v14 = v22;
  unint64_t v15 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v16 = swift_allocObject();
  long long v23 = xmmword_46FB0;
  *(_OWORD *)(v16 + 16) = xmmword_46FB0;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 16))(v16 + v15, v12, v25);
  swift_retain();
  uint64_t v17 = ModelContainer.__allocating_init(for:migrationPlan:configurations:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v25);
  swift_release();
  return v17;
}

unint64_t lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1 and conformance LiteMessageSegmentStoreSchemaV1()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1 and conformance LiteMessageSegmentStoreSchemaV1;
  if (!lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1 and conformance LiteMessageSegmentStoreSchemaV1)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1 and conformance LiteMessageSegmentStoreSchemaV1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LiteMessageSegmentStoreMigrationPlan and conformance LiteMessageSegmentStoreMigrationPlan()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageSegmentStoreMigrationPlan and conformance LiteMessageSegmentStoreMigrationPlan;
  if (!lazy protocol witness table cache variable for type LiteMessageSegmentStoreMigrationPlan and conformance LiteMessageSegmentStoreMigrationPlan)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageSegmentStoreMigrationPlan and conformance LiteMessageSegmentStoreMigrationPlan);
  }
  return result;
}

uint64_t outlined init with copy of (AnyHashable, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AnyHashable, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void LiteMessageSegmentStoreSchemaV1.LiteMessageSegment._data.setter()
{
}

Swift::Bool __swiftcall LiteMessageServiceSession.hasBlockedFromHandleID(_:)(Swift::String a1)
{
  NSString v1 = String._bridgeToObjectiveC()();
  uint64_t CMFItemFromString = CreateCMFItemFromString();

  if (CMFItemFromString)
  {
    int IsItemBlocked = CMFBlockListIsItemBlocked();
    swift_unknownObjectRelease();
    return IsItemBlocked != 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LiteMessage.header.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LiteMessage.content.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of LiteMessageContent(v1 + 24, a1);
}

uint64_t outlined init with copy of LiteMessageContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t LiteMessage.append(to:)(uint64_t a1)
{
  LOBYTE(v10) = *(unsigned char *)v1;
  long long v11 = *(_OWORD *)(v1 + 8);
  uint64_t result = protocol witness for BitPackable.append(to:) in conformance LiteMessageHeader(a1);
  if (!v2)
  {
    uint64_t v6 = *(void *)(v1 + 48);
    uint64_t v5 = *(void *)(v1 + 56);
    uint64_t v7 = __swift_project_boxed_opaque_existential_1((void *)(v1 + 24), v6);
    uint64_t v12 = v6;
    uint64_t v8 = *(void *)(v5 + 8);
    uint64_t v13 = v8;
    uint64_t v9 = __swift_allocate_boxed_opaque_existential_1(&v10);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(v9, v7, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, v6, v8);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v10);
  }
  return result;
}

uint64_t LiteMessage.init(header:content:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  return outlined init with take of LiteMessageContent(a4, a5 + 24);
}

uint64_t outlined init with take of LiteMessageContent(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t protocol witness for BitPackable.append(to:) in conformance LiteMessage(uint64_t a1)
{
  return LiteMessage.append(to:)(a1);
}

uint64_t destroy for LiteMessage(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0(a1 + 24);
}

uint64_t initializeWithCopy for LiteMessage(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = a2 + 24;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 24, v4, v6);
  return a1;
}

uint64_t assignWithCopy for LiteMessage(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LiteMessage(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessage()
{
  return &type metadata for LiteMessage;
}

unint64_t LiteMessageReachabilityError.errorDescription.getter(void *a1, void *a2, char a3)
{
  unint64_t result = 0xD000000000000054;
  switch(a3)
  {
    case 1:
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(33);
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xD00000000000001ELL;
      if (a2) {
        uint64_t v7 = a1;
      }
      else {
        uint64_t v7 = 0;
      }
      if (!a2) {
        a2 = (void *)0xE000000000000000;
      }
      uint64_t v8 = a2;
      String.append(_:)(*(Swift::String *)&v7);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    case 2:
      _StringGuts.grow(_:)(32);
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD00000000000001DLL;
      goto LABEL_10;
    case 3:
      _StringGuts.grow(_:)(35);
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xD000000000000021;
      goto LABEL_14;
    case 4:
      _StringGuts.grow(_:)(32);
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xD00000000000001ELL;
LABEL_14:
      uint64_t v10 = (uint64_t)a1;
      unint64_t v11 = (unint64_t)a2;
      goto LABEL_15;
    case 5:
      id v12 = a1;
      _StringGuts.grow(_:)(43);
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xD000000000000029;
      id v13 = [v12 description];
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;

      v17._uint64_t countAndFlagsBits = v14;
      v17._object = v16;
      String.append(_:)(v17);
      swift_bridgeObjectRelease();
      outlined consume of LiteMessageReachabilityError(a1, a2, 5);
      return v18;
    case 6:
      return result;
    default:
      _StringGuts.grow(_:)(38);
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD000000000000023;
LABEL_10:
      unint64_t v18 = v6;
      v9._uint64_t countAndFlagsBits = (uint64_t)a1;
      v9._object = a2;
      String.append(_:)(v9);
LABEL_11:
      uint64_t v10 = 46;
      unint64_t v11 = 0xE100000000000000;
LABEL_15:
      String.append(_:)(*(Swift::String *)&v10);
      return v18;
  }
}

void outlined consume of LiteMessageReachabilityError(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      swift_bridgeObjectRelease();
      break;
    case 5:

      break;
    default:
      return;
  }
}

unint64_t protocol witness for LocalizedError.errorDescription.getter in conformance LiteMessageReachabilityError()
{
  return LiteMessageReachabilityError.errorDescription.getter(*(void **)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t LiteMessageServiceSession.calculateReachability(with:responseHandler:)(void *a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  id v9 = v2;
  id v10 = a1;
  swift_unknownObjectRetain();
  uint64_t v11 = static MainActor.shared.getter();
  id v12 = (void *)swift_allocObject();
  v12[2] = v11;
  uint64_t v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  v12[5] = v10;
  v12[6] = a2;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:), (uint64_t)v12);
  return swift_release();
}

uint64_t closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  uint64_t v8 = type metadata accessor for Logger();
  v6[13] = v8;
  v6[14] = *(void *)(v8 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = type metadata accessor for MainActor();
  v6[17] = static MainActor.shared.getter();
  id v9 = (void *)swift_task_alloc();
  v6[18] = v9;
  *id v9 = v6;
  v9[1] = closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:);
  return LiteMessageServiceSession.calculateReachability(with:)(a5);
}

uint64_t closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 152) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v7 = v6;
    uint64_t v8 = closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:);
  }
  else
  {
    *(void *)(v4 + 160) = a1;
    uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v7 = v9;
    uint64_t v8 = closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:);
  }
  return _swift_task_switch(v8, v5, v7);
}

uint64_t closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v3 = v0[11];
  unint64_t v2 = (void *)v0[12];
  swift_release();
  [v2 reachabilityRequest:v3 updatedWithResult:v1];

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  NSObject *log;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  uint64_t v29 = v0;
  unint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void **)(v0 + 88);
  swift_release();
  uint64_t v5 = Logger.availability.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  uint64_t v6 = v4;
  swift_errorRetain();
  uint64_t v7 = v6;
  swift_errorRetain();
  uint64_t v8 = Logger.logObject.getter();
  uint64_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v25 = *(void *)(v0 + 112);
    unint64_t v26 = *(void *)(v0 + 104);
    unint64_t v27 = *(void *)(v0 + 120);
    id v10 = *(void **)(v0 + 88);
    uint64_t v11 = swift_slowAlloc();
    log = v8;
    id v12 = (void *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412546;
    *(void *)(v0 + 56) = v10;
    id v13 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v12 = v10;

    *(_WORD *)(v11 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v14 = Error.localizedDescription.getter();
    *(void *)(v0 + 72) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, log, v9, "Failed to determinate reachability for: %@ with error: %s", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    Swift::String v17 = *(void *)(v0 + 112);
    uint64_t v16 = *(void *)(v0 + 120);
    unint64_t v18 = *(void *)(v0 + 104);
    id v19 = *(void **)(v0 + 88);

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v21 = *(void *)(v0 + 96);
  *(void *)(v0 + 40) = *(void *)(v0 + 80);
  *(void *)(v0 + 48) = LiteMessageServiceSession;
  objc_msgSendSuper2((objc_super *)(v0 + 40), "calculateReachabilityWithRequest:responseHandler:", v20, v21);
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.donateHandlesForKeyExchange();
  return closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t LiteMessageServiceSession.calculateReachability(with:)(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  v2[10] = type metadata accessor for MainActor();
  v2[11] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[12] = v5;
  v2[13] = v4;
  return _swift_task_switch(LiteMessageServiceSession.calculateReachability(with:), v5, v4);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v9;

  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 168) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[12];
    uint64_t v6 = v4[13];
    uint64_t v7 = LiteMessageServiceSession.calculateReachability(with:);
  }
  else
  {
    swift_bridgeObjectRelease();
    v4[22] = a1;
    uint64_t v5 = v4[12];
    uint64_t v6 = v4[13];
    uint64_t v7 = LiteMessageServiceSession.calculateReachability(with:);
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t LiteMessageServiceSession.calculateReachability(with:)()
{
  uint64_t v57 = v0;
  id v1 = [*(id *)(v0 + 32) handleIDs];
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRelease();
  if (v3 == 1)
  {
    id v4 = [*(id *)(v0 + 32) handleIDs];
    uint64_t v5 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v5[2])
    {
      uint64_t v6 = *(void *)(v0 + 72);
      uint64_t v7 = *(void *)(v0 + 56);
      uint64_t v9 = *(void **)(v0 + 32);
      uint64_t v8 = *(void **)(v0 + 40);
      uint64_t v10 = v5[4];
      *(void *)(v0 + 112) = v10;
      uint64_t v11 = v5[5];
      *(void *)(v0 + 120) = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v54 = Logger.availability.unsafeMutableAddressor();
      uint64_t v53 = *(void (**)(uint64_t))(v7 + 16);
      v53(v6);
      id v12 = v8;
      id v13 = v9;
      id v14 = v12;
      id v15 = v13;
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v55 = static os_log_type_t.info.getter();
      BOOL v17 = os_log_type_enabled(v16, v55);
      uint64_t v18 = *(void *)(v0 + 72);
      uint64_t v19 = *(void *)(v0 + 48);
      uint64_t v20 = *(void *)(v0 + 56);
      uint64_t v22 = *(void **)(v0 + 32);
      uint64_t v21 = *(void **)(v0 + 40);
      if (v17)
      {
        uint64_t v52 = v10;
        uint64_t v23 = swift_slowAlloc();
        Swift::String v50 = (void *)swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 136315650;
        unsigned __int8 v24 = LiteMessageServiceSession.isLiteMessageActiveOverSatellite.getter();
        BOOL v25 = (v24 & 1) == 0;
        if (v24) {
          uint64_t v26 = 4605519;
        }
        else {
          uint64_t v26 = 20047;
        }
        uint64_t v51 = v11;
        if (v25) {
          unint64_t v27 = 0xE200000000000000;
        }
        else {
          unint64_t v27 = 0xE300000000000000;
        }
        *(void *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v56);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        *(_WORD *)(v23 + 12) = 2112;
        *(void *)(v0 + 24) = v22;
        log = v16;
        id v28 = v22;
        uint64_t v11 = v51;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *Swift::String v50 = v22;

        *(_WORD *)(v23 + 22) = 1024;
        LOBYTE(v28) = LiteMessageServiceSession.isLiteMessageActiveOverSatellite.getter();

        *(_DWORD *)(v0 + 184) = v28 & 1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl(&def_3494C, log, v55, "Calculating %s grid reachability for request: %@, isLiteMessageActiveOverSatellite: %{BOOL}d", (uint8_t *)v23, 0x1Cu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v10 = v52;
        swift_slowDealloc();

        uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
        v29(v18, v19);
      }
      else
      {

        uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
        v29(v18, v19);
      }
      if (LiteMessageServiceSession.isLiteMessageActiveOverSatellite.getter())
      {
        *(void *)(v0 + 128) = static MainActor.shared.getter();
        uint64_t v33 = (void *)swift_task_alloc();
        *(void *)(v0 + 136) = v33;
        *uint64_t v33 = v0;
        v33[1] = LiteMessageServiceSession.calculateReachability(with:);
        uint64_t v34 = *(void *)(v0 + 32);
        return LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:)(v10, v11, 0, 0xF000000000000000, v34);
      }
      else
      {
        id v35 = [*(id *)(v0 + 40) networkMonitor];
        if (v35)
        {
          unint64_t v36 = v35;
          unsigned __int8 v37 = [v35 immediatelyReachable];

          if (v37)
          {
            Swift::String v38 = (void *)swift_task_alloc();
            *(void *)(v0 + 160) = v38;
            void *v38 = v0;
            v38[1] = LiteMessageServiceSession.calculateReachability(with:);
            uint64_t v39 = *(void *)(v0 + 32);
            return LiteMessageServiceSession.calculateOnGridReachability(for:with:)(v10, v11, v39);
          }
          else
          {
            uint64_t v40 = *(void *)(v0 + 64);
            uint64_t v41 = *(void *)(v0 + 48);
            swift_release();
            ((void (*)(uint64_t, uint64_t, uint64_t))v53)(v40, v54, v41);
            uint64_t v42 = Logger.logObject.getter();
            os_log_type_t v43 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v42, v43))
            {
              uint64_t v44 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v44 = 0;
              _os_log_impl(&def_3494C, v42, v43, "No network available", v44, 2u);
              swift_slowDealloc();
            }
            uint64_t v45 = *(void *)(v0 + 64);
            uint64_t v46 = *(void *)(v0 + 48);

            v29(v45, v46);
            id v47 = LiteMessageServiceSession.result(for:reachable:)(v10, v11, 0);
            swift_bridgeObjectRelease();
            swift_task_dealloc();
            swift_task_dealloc();
            unint64_t v48 = *(uint64_t (**)(id))(v0 + 8);
            return v48(v47);
          }
        }
        else
        {
          return _assertionFailure(_:_:file:line:flags:)();
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_release();
  lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
  swift_allocError();
  *(void *)uint64_t v30 = 0;
  *(void *)(v30 + 8) = 0;
  *(unsigned char *)(v30 + 16) = 6;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  id v1 = *(unsigned char *)(v0 + 188);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 112);
  swift_release();
  *(void *)(v0 + 152) = LiteMessageServiceSession.result(for:reachable:)(v3, v2, v1);
  swift_bridgeObjectRelease();
  id v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 104);
  return _swift_task_switch(LiteMessageServiceSession.calculateReachability(with:), v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  swift_release();
  id v1 = *(void *)(v0 + 152);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  swift_release();
  id v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  return _swift_task_switch(LiteMessageServiceSession.calculateReachability(with:), v1, v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  swift_release();
  id v1 = *(void *)(v0 + 176);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LiteMessageServiceSession.calculateReachability(with:)(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v7 = v6;
    uint64_t v8 = LiteMessageServiceSession.calculateReachability(with:);
  }
  else
  {
    *(unsigned char *)(v4 + 188) = a1 & 1;
    uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v7 = v9;
    uint64_t v8 = LiteMessageServiceSession.calculateReachability(with:);
  }
  return _swift_task_switch(v8, v5, v7);
}

uint64_t LiteMessageServiceSession.networkDataAvailable.getter()
{
  id v1 = [v0 networkMonitor];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 immediatelyReachable];

    return (uint64_t)v3;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError;
  if (!lazy protocol witness table cache variable for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError);
  }
  return result;
}

id outlined copy of LiteMessageReachabilityError(id result, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 5:
      unint64_t result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for LiteMessageReachabilityError(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for LiteMessageReachabilityError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of LiteMessageReachabilityError(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LiteMessageReachabilityError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of LiteMessageReachabilityError(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of LiteMessageReachabilityError(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for LiteMessageReachabilityError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of LiteMessageReachabilityError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessageReachabilityError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteMessageReachabilityError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for LiteMessageReachabilityError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 5u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 6);
  }
}

uint64_t destructiveInjectEnumTag for LiteMessageReachabilityError(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(void *)unint64_t result = a2 - 6;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageReachabilityError()
{
  return &type metadata for LiteMessageReachabilityError;
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)partial apply()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)((uint64_t)v5, v6, v7, v2, v3, v4);
}

id LiteMessageServiceSession.result(for:reachable:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  id v8 = [v4 service];
  id v9 = [v8 internalName];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = objc_allocWithZone((Class)IMServiceReachabilityHandleResult);
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3 & 1;
  id v14 = [v10 initWithHandleID:v11 service:v12 isReachable:v13];

  id v15 = [v4 service];
  id v16 = [v15 internalName];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, IMServiceReachabilityHandleResult)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_46FB0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  *(void *)(inited + 48) = v14;
  swift_bridgeObjectRetain();
  id v18 = v14;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v19 = objc_allocWithZone((Class)IMServiceReachabilityResult);
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMServiceReachabilityHandleResult);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v22 = [v19 initWithService:v20 error:0 handleResults:isa isFinal:1 allAreReachable:v13 didCheckServer:0];

  return v22;
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[23] = v5;
  v4[24] = *(void *)(v5 - 8);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[28] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[29] = v7;
  v4[30] = v6;
  return _swift_task_switch(LiteMessageServiceSession.calculateOnGridReachability(for:with:), v7, v6);
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:)()
{
  uint64_t v55 = v0;
  id v1 = [*(id *)(v0 + 168) context];
  id v2 = [v1 chatIdentifier];

  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 216);
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v4 = *(void *)(v0 + 192);
    uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;
    uint64_t v8 = Logger.availability.unsafeMutableAddressor();
    *(void *)(v0 + 248) = v8;
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    *(void *)(v0 + 256) = v9;
    *(void *)(v0 + 264) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v9(v3, v8, v5);
    swift_bridgeObjectRetain();
    id v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.info.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v53 = *(void *)(v0 + 184);
    if (v12)
    {
      uint64_t v51 = v8;
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 144) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v7, &v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v10, v11, "Calculating on grid reachability for chat %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v8 = v51;
      swift_slowDealloc();

      id v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v16(v13, v53);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      id v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v16(v13, v53);
    }
    *(void *)(v0 + 272) = v16;
    id v22 = [*(id *)(v0 + 176) chatForChatIdentifier:v2 style:45];
    *(void *)(v0 + 280) = v22;

    if (v22)
    {
      *(unsigned char *)(v0 + 324) = 0;
      NSString v23 = String._bridgeToObjectiveC()();
      NSString v24 = String._bridgeToObjectiveC()();
      char v25 = IMGetCachedDomainBoolForKey();

      if ((v25 & 1) != 0
        || (id v26 = [v22 recipient],
            (*(void *)(v0 + 288) = v26) == 0))
      {
        (*(void (**)(void, void, void))(v0 + 256))(*(void *)(v0 + 208), *(void *)(v0 + 248), *(void *)(v0 + 184));
        uint64_t v29 = Logger.logObject.getter();
        os_log_type_t v30 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 67109120;
          *(_DWORD *)(v0 + 320) = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl(&def_3494C, v29, v30, "Calculating on grid reachability for off grid recipient: %{BOOL}d", v31, 8u);
          swift_slowDealloc();
        }
        uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
        uint64_t v33 = *(void *)(v0 + 208);
        uint64_t v34 = *(void *)(v0 + 184);

        v32(v33, v34);
        swift_beginAccess();
        char v35 = *(unsigned char *)(v0 + 324);
        unint64_t v36 = (void *)swift_task_alloc();
        *(void *)(v0 + 296) = v36;
        *unint64_t v36 = v0;
        v36[1] = LiteMessageServiceSession.calculateOnGridReachability(for:with:);
        uint64_t v37 = *(void *)(v0 + 168);
        uint64_t v39 = *(void *)(v0 + 152);
        uint64_t v38 = *(void *)(v0 + 160);
        return LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)(v39, v38, v37, v35);
      }
      else
      {
        unint64_t v27 = v26;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 325;
        *(void *)(v0 + 24) = LiteMessageServiceSession.calculateOnGridReachability(for:with:);
        uint64_t v28 = swift_continuation_init();
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool) -> () with result type Bool;
        *(void *)(v0 + 104) = &block_descriptor_20;
        *(void *)(v0 + 112) = v28;
        [v27 isOffGridModeWithCompletion:v0 + 80];
        return _swift_continuation_await(v0 + 16);
      }
    }
    else
    {
      uint64_t v40 = *(void *)(v0 + 200);
      uint64_t v41 = *(void *)(v0 + 184);
      swift_release();
      v9(v40, v8, v41);
      uint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&def_3494C, v42, v43, "Lite chat not found", v44, 2u);
        swift_slowDealloc();
      }
      uint64_t v45 = *(void *)(v0 + 200);
      uint64_t v46 = *(void *)(v0 + 184);
      uint64_t v48 = *(void *)(v0 + 152);
      uint64_t v47 = *(void *)(v0 + 160);

      v16(v45, v46);
      id v49 = LiteMessageServiceSession.result(for:reachable:)(v48, v47, 0);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      Swift::String v50 = *(uint64_t (**)(id))(v0 + 8);
      return v50(v49);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 152);
    uint64_t v17 = *(void *)(v0 + 160);
    swift_release();
    lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
    swift_allocError();
    *(void *)uint64_t v19 = v18;
    *(void *)(v19 + 8) = v17;
    *(unsigned char *)(v19 + 16) = 4;
    swift_bridgeObjectRetain();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    NSString v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  id v1 = *(void *)(*(void *)v0 + 240);
  id v2 = *(void *)(*(void *)v0 + 232);
  return _swift_task_switch(LiteMessageServiceSession.calculateOnGridReachability(for:with:), v2, v1);
}

{
  uint64_t v0;
  int v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  id v1 = *(unsigned __int8 *)(v0 + 325);
  *(unsigned char *)(v0 + 324) = v1;
  (*(void (**)(void, void, void))(v0 + 256))(*(void *)(v0 + 208), *(void *)(v0 + 248), *(void *)(v0 + 184));
  id v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    *(_DWORD *)(v0 + 320) = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&def_3494C, v2, v3, "Calculating on grid reachability for off grid recipient: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
  unint64_t v6 = *(void *)(v0 + 208);
  unint64_t v7 = *(void *)(v0 + 184);

  v5(v6, v7);
  swift_beginAccess();
  uint64_t v8 = *(unsigned char *)(v0 + 324);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v9;
  *uint64_t v9 = v0;
  v9[1] = LiteMessageServiceSession.calculateOnGridReachability(for:with:);
  id v10 = *(void *)(v0 + 168);
  BOOL v12 = *(void *)(v0 + 152);
  os_log_type_t v11 = *(void *)(v0 + 160);
  return LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)(v12, v11, v10, v8);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  swift_release();
  id v1 = *(void *)(v0 + 312);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:)(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 304) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[29];
    uint64_t v6 = v4[30];
    unint64_t v7 = LiteMessageServiceSession.calculateOnGridReachability(for:with:);
  }
  else
  {
    v4[39] = a1;
    uint64_t v5 = v4[29];
    uint64_t v6 = v4[30];
    unint64_t v7 = LiteMessageServiceSession.calculateOnGridReachability(for:with:);
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[29] = a5;
  v6[30] = v5;
  v6[27] = a3;
  v6[28] = a4;
  v6[25] = a1;
  v6[26] = a2;
  uint64_t v7 = type metadata accessor for Logger();
  v6[31] = v7;
  v6[32] = *(void *)(v7 - 8);
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  type metadata accessor for MainActor();
  v6[37] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v6[38] = v9;
  v6[39] = v8;
  return _swift_task_switch(LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:), v9, v8);
}

uint64_t LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:)()
{
  unint64_t v1 = *(void *)(v0 + 224);
  if (v1 >> 60 != 15)
  {
    outlined copy of Data._Representation(*(void *)(v0 + 216), v1);
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = (id)IMChatCanonicalIDSIDsForAddress();

    if (v3
      && (Class isa = Data._bridgeToObjectiveC()().super.isa,
          uint64_t v5 = (void *)IDSCopyIDForTokenWithID(),
          v3,
          isa,
          v5))
    {
      uint64_t v7 = *(void *)(v0 + 216);
      unint64_t v6 = *(void *)(v0 + 224);
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v8 = objc_allocWithZone((Class)IDSURI);
      NSString v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v10 = [v8 initWithPrefixedURI:v9];

      outlined consume of Data?(v7, v6);
      if (v10) {
        goto LABEL_8;
      }
    }
    else
    {
      outlined consume of Data?(*(void *)(v0 + 216), *(void *)(v0 + 224));
    }
  }
  id v11 = objc_allocWithZone((Class)IDSURI);
  swift_bridgeObjectRetain();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = [v11 initWithUnprefixedURI:v12];

  if (!v10)
  {
    uint64_t v30 = *(void *)(v0 + 200);
    uint64_t v29 = *(void *)(v0 + 208);
    swift_release();
    lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
    swift_allocError();
    *(void *)uint64_t v31 = v30;
    *(void *)(v31 + 8) = v29;
    *(unsigned char *)(v31 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    goto LABEL_18;
  }
LABEL_8:
  *(void *)(v0 + 320) = v10;
  id v13 = [*(id *)(v0 + 232) context];
  id v14 = [v13 senderLastAddressedHandle];

  if (v14)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v15 = objc_allocWithZone((Class)IDSURI);
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v17 = [v15 initWithUnprefixedURI:v16];
    *(void *)(v0 + 328) = v17;

    if (v17)
    {
      id v18 = LiteMessageServiceSession.offGridMessenger.getter();
      *(void *)(v0 + 336) = v18;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_47480;
      *(void *)(inited + 32) = v10;
      unint64_t v39 = inited;
      specialized Array._endMutation()();
      if (v39 >> 62)
      {
        id v34 = v10;
        swift_bridgeObjectRetain();
        uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v35) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v20 = *(void *)((char *)&dword_10 + (v39 & 0xFFFFFFFFFFFFFF8));
        id v21 = v10;
        if (!v20)
        {
LABEL_22:
          swift_bridgeObjectRelease();
          type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
          lazy protocol witness table accessor for type IDSURI and conformance NSObject();
          Class v36 = Set._bridgeToObjectiveC()().super.isa;
          *(void *)(v0 + 344) = v36;
          swift_bridgeObjectRelease();
          id v37 = [objc_allocWithZone((Class)IDSOffGridDeliveryQueryOptions) init];
          *(void *)(v0 + 352) = v37;
          *(void *)(v0 + 16) = v0;
          *(void *)(v0 + 56) = v0 + 160;
          *(void *)(v0 + 24) = LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:);
          uint64_t v38 = swift_continuation_init();
          *(void *)(v0 + 80) = _NSConcreteStackBlock;
          *(void *)(v0 + 88) = 0x40000000;
          *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary, @unowned NSError?) -> () with result type [IDSURI : IDSOffGridDeliveryQueryResult];
          *(void *)(v0 + 104) = &block_descriptor_4;
          *(void *)(v0 + 112) = v38;
          [v18 resultsForDestinationURIs:v36 senderURI:v17 options:v37 completion:v0 + 80];
          return _swift_continuation_await(v0 + 16);
        }
      }
      specialized Set.init(_nonEmptyArrayLiteral:)(v39);
      goto LABEL_22;
    }
  }
  id v22 = *(void **)(v0 + 232);
  swift_release();
  id v23 = [v22 context];
  id v24 = [v23 senderLastAddressedHandle];

  if (v24)
  {
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v27 = v26;

    lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
    swift_allocError();
    *(void *)uint64_t v28 = v25;
    *(void *)(v28 + 8) = v27;
  }
  else
  {
    lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
    swift_allocError();
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 0;
  }
  *(unsigned char *)(v28 + 16) = 1;
  swift_willThrow();

LABEL_18:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32(0);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  unint64_t v1 = *v0;
  NSString v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 360) = v2;
  id v3 = *(void *)(v1 + 312);
  uint64_t v4 = *(void *)(v1 + 304);
  if (v2) {
    uint64_t v5 = LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint8_t *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  void *v30;
  uint8_t *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  void *v52;
  uint8_t *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  void *v64;
  uint8_t *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *log;
  NSObject *loga;
  NSObject *logb;
  NSObject *logc;
  void *v82;
  uint64_t v83;

  NSString v2 = *(void **)(v0 + 344);
  unint64_t v1 = *(void **)(v0 + 352);
  id v3 = *(void **)(v0 + 336);
  swift_release();
  uint64_t v4 = *(void *)(v0 + 160);

  if ((v4 & 0xC000000000000001) == 0)
  {
    if (*(void *)(v4 + 16)) {
      goto LABEL_3;
    }
LABEL_13:
    id v34 = *(void **)(v0 + 320);
    uint64_t v7 = *(id *)(v0 + 328);
    Class v36 = *(void *)(v0 + 200);
    uint64_t v35 = *(void *)(v0 + 208);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
    swift_allocError();
    *(void *)id v37 = v36;
    *(void *)(v37 + 8) = v35;
    *(unsigned char *)(v37 + 16) = 3;
    swift_bridgeObjectRetain();
    swift_willThrow();
    goto LABEL_14;
  }
  if (!__CocoaDictionary.count.getter()) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v5 = (id *)(v0 + 320);
  unint64_t v6 = *(id *)(v0 + 320);
  uint64_t v7 = specialized Dictionary.subscript.getter(v6, v4);
  swift_bridgeObjectRelease();

  if (!v7 || ![v7 hasUsableSenderKey])
  {
    id v22 = *(void **)(v0 + 320);
    id v10 = (void *)(v0 + 264);
    id v24 = *(void *)(v0 + 256);
    id v23 = *(void *)(v0 + 264);
    uint64_t v25 = *(void *)(v0 + 248);
    uint64_t v26 = Logger.availability.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v26, v25);
    uint64_t v27 = v22;
    uint64_t v28 = Logger.logObject.getter();
    uint64_t v29 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = *(void **)(v0 + 320);
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138412290;
      *(void *)(v0 + 168) = v30;
      os_log_t loga = v28;
      uint64_t v33 = v30;
      id v10 = (void *)(v0 + 264);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v32 = v30;

      _os_log_impl(&def_3494C, loga, v29, "%@ does not have usable sender keys", v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v5 = (id *)(v0 + 328);
    }
    else
    {
      uint64_t v41 = *(void **)(v0 + 320);
      uint64_t v40 = *(void **)(v0 + 328);
    }
    uint64_t v42 = 0;
    goto LABEL_17;
  }
  id v8 = (char *)[v7 status];
  if (v8)
  {
    if (v8 != (unsigned char *)&def_3494C + 2)
    {
      if (v8 == (unsigned char *)&def_3494C + 1)
      {
        NSString v9 = *(void **)(v0 + 320);
        id v10 = (void *)(v0 + 288);
        id v11 = *(void *)(v0 + 288);
        NSString v12 = *(void *)(v0 + 248);
        id v13 = *(void *)(v0 + 256);
        id v14 = Logger.availability.unsafeMutableAddressor();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
        id v15 = v9;
        NSString v16 = Logger.logObject.getter();
        id v17 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v16, v17))
        {
          id v18 = *(void **)(v0 + 320);
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          log = v16;
          uint64_t v20 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v19 = 138412290;
          *(void *)(v0 + 192) = v18;
          id v21 = v18;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          char *v20 = v18;

          _os_log_impl(&def_3494C, log, v17, "%@ available for iMessage Lite", v19, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          id v10 = (void *)(v0 + 288);
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v5 = (id *)(v0 + 328);
        }
        else
        {
          os_log_type_t v73 = *(void **)(v0 + 320);
          unint64_t v72 = *(void **)(v0 + 328);
        }
        uint64_t v7 = *v5;
        uint64_t v42 = 1;
        goto LABEL_17;
      }
      uint64_t v68 = *(void **)(v0 + 320);
      id v34 = *(void **)(v0 + 328);
      uint64_t v70 = *(void *)(v0 + 200);
      uint64_t v69 = *(void *)(v0 + 208);
      lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
      swift_allocError();
      *(void *)uint64_t v71 = v70;
      *(void *)(v71 + 8) = v69;
      *(unsigned char *)(v71 + 16) = 2;
      swift_bridgeObjectRetain();
      swift_willThrow();

LABEL_14:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v38 = *(uint64_t (**)(uint64_t))(v0 + 8);
      unint64_t v39 = 0;
      goto LABEL_18;
    }
    uint64_t v56 = *(void **)(v0 + 320);
    char v82 = (void *)(v0 + 272);
    uint64_t v57 = *(void *)(v0 + 272);
    uint64_t v58 = *(void *)(v0 + 248);
    NSString v59 = *(void *)(v0 + 256);
    unsigned int v60 = Logger.availability.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16))(v57, v60, v58);
    id v61 = v56;
    uint64_t v62 = Logger.logObject.getter();
    id v63 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = *(void **)(v0 + 320);
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v66 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 138412290;
      *(void *)(v0 + 176) = v64;
      logc = v62;
      os_log_type_t v67 = v64;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v66 = v64;

      _os_log_impl(&def_3494C, logc, v63, "Invalid status for: %@", v65, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v5 = (id *)(v0 + 328);
    }
    else
    {
      uint64_t v77 = *(void **)(v0 + 320);
      unint64_t v76 = *(void **)(v0 + 328);
    }
  }
  else
  {
    uint64_t v44 = *(void **)(v0 + 320);
    char v82 = (void *)(v0 + 280);
    uint64_t v45 = *(void *)(v0 + 280);
    uint64_t v46 = *(void *)(v0 + 248);
    uint64_t v47 = *(void *)(v0 + 256);
    uint64_t v48 = Logger.availability.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v45, v48, v46);
    id v49 = v44;
    Swift::String v50 = Logger.logObject.getter();
    uint64_t v51 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = *(void **)(v0 + 320);
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = (void *)swift_slowAlloc();
      os_log_t logb = v50;
      *(_DWORD *)uint64_t v53 = 138412290;
      *(void *)(v0 + 184) = v52;
      uint64_t v55 = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v54 = v52;

      _os_log_impl(&def_3494C, logb, v51, "Unknown status for: %@", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v5 = (id *)(v0 + 328);
    }
    else
    {
      uint64_t v75 = *(void **)(v0 + 320);
      uint64_t v74 = *(void **)(v0 + 328);
    }
  }
  uint64_t v42 = 0;
  uint64_t v7 = *v5;
  id v10 = v82;
LABEL_17:

  (*(void (**)(void, void))(*(void *)(v0 + 256) + 8))(*v10, *(void *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = *(uint64_t (**)(uint64_t))(v0 + 8);
  unint64_t v39 = v42;
LABEL_18:
  return v38(v39);
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  unint64_t v1 = (void *)v0[44];
  id v3 = (void *)v0[42];
  NSString v2 = (void *)v0[43];
  uint64_t v5 = (void *)v0[40];
  uint64_t v4 = (void *)v0[41];
  swift_release();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6(0);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool) -> () with result type Bool(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 488) = a4;
  *(void *)(v5 + 264) = a3;
  *(void *)(v5 + 272) = v4;
  *(void *)(v5 + 248) = a1;
  *(void *)(v5 + 256) = a2;
  uint64_t v6 = type metadata accessor for Logger();
  *(void *)(v5 + 280) = v6;
  *(void *)(v5 + 288) = *(void *)(v6 - 8);
  *(void *)(v5 + 296) = swift_task_alloc();
  *(void *)(v5 + 304) = swift_task_alloc();
  *(void *)(v5 + 312) = swift_task_alloc();
  *(void *)(v5 + 320) = swift_task_alloc();
  *(void *)(v5 + 328) = swift_task_alloc();
  *(void *)(v5 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  *(void *)(v5 + 344) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  *(void *)(v5 + 352) = v7;
  *(void *)(v5 + 360) = *(void *)(v7 - 8);
  *(void *)(v5 + 368) = swift_task_alloc();
  *(void *)(v5 + 376) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v5 + 384) = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v5 + 392) = v9;
  *(void *)(v5 + 400) = v8;
  return _swift_task_switch(LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:), v9, v8);
}

void LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)()
{
  uint64_t v131 = v0;
  id v1 = [*(id *)(v0 + 264) context];
  id v2 = [v1 chatIdentifier];

  if (v2)
  {
    id v3 = [*(id *)(v0 + 272) chatForChatIdentifier:v2 style:45];
    *(void *)(v0 + 408) = v3;

    if (!v3)
    {
      uint64_t v9 = *(void *)(v0 + 288);
      uint64_t v8 = *(void *)(v0 + 296);
      uint64_t v10 = *(void *)(v0 + 280);
      swift_release();
      uint64_t v11 = Logger.availability.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
      NSString v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v12, v13))
      {
        id v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v14 = 0;
        _os_log_impl(&def_3494C, v12, v13, "Lite chat not found", v14, 2u);
        swift_slowDealloc();
      }
      uint64_t v16 = *(void *)(v0 + 288);
      uint64_t v15 = *(void *)(v0 + 296);
      uint64_t v17 = *(void *)(v0 + 280);
      uint64_t v19 = *(void *)(v0 + 248);
      uint64_t v18 = *(void *)(v0 + 256);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      id v20 = LiteMessageServiceSession.result(for:reachable:)(v19, v18, 0);
      goto LABEL_28;
    }
    if (*(unsigned char *)(v0 + 488) == 1)
    {
      [v3 setWasDowngradedToLiteMessage:0];
    }
    else if (([v3 wasDowngradedToLiteMessage] & 1) == 0)
    {
      uint64_t v49 = *(void *)(v0 + 248);
      uint64_t v48 = *(void *)(v0 + 256);
      swift_release();
      uint64_t v46 = v49;
      uint64_t v47 = v48;
      goto LABEL_22;
    }
    id v21 = [self sharedInstance];
    id v22 = objc_msgSend(v21, "lastMessageForChatWithRowID:", objc_msgSend(v3, "rowID"));
    *(void *)(v0 + 416) = v22;

    if (v22)
    {
      id v23 = [v22 time];
      if (v23)
      {
        id v24 = v23;
        uint64_t v26 = *(void *)(v0 + 360);
        uint64_t v25 = *(void *)(v0 + 368);
        uint64_t v28 = *(void *)(v0 + 344);
        uint64_t v27 = *(void *)(v0 + 352);
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32);
        v29(v28, v25, v27);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v28, 0, 1, v27);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v28, 1, v27) != 1)
        {
          int v30 = *(unsigned __int8 *)(v0 + 488);
          v29(*(void *)(v0 + 376), *(void *)(v0 + 344), *(void *)(v0 + 352));
          id v31 = [self sharedInstanceForBagType:1];
          if (v30 == 1)
          {
            NSString v32 = String._bridgeToObjectiveC()();
            id v33 = [v31 objectForKey:v32];

            if (v33)
            {
              _bridgeAnyObjectToAny(_:)();
              swift_unknownObjectRelease();
            }
            else
            {
              *(_OWORD *)(v0 + 80) = 0u;
              *(_OWORD *)(v0 + 96) = 0u;
            }
            outlined init with take of Any?(v0 + 80, v0 + 112);
            if (!*(void *)(v0 + 136))
            {

              outlined destroy of TaskPriority?(v0 + 112, &demangling cache variable for type metadata for Any?);
              goto LABEL_42;
            }
            os_log_type_t v66 = (id *)(v0 + 200);
            type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
            if ((swift_dynamicCast() & 1) == 0)
            {

LABEL_42:
              *(double *)&uint64_t v70 = 86400.0;
LABEL_46:
              double v69 = *(double *)&v70;
              goto LABEL_47;
            }
LABEL_40:
            id v67 = *v66;
            [*v66 doubleValue];
            double v69 = v68;

LABEL_47:
            Date.timeIntervalSinceNow.getter();
            double v72 = fabs(v71);
            if (v72 < v69)
            {
              if (specialized LiteMessageServiceSession.isLastMessageLite(for:with:)(v3, v72))
              {
                id v73 = [v3 recipient];
                *(void *)(v0 + 424) = v73;
                if (v73)
                {
                  uint64_t v74 = (uint64_t)v73;
                  uint64_t v75 = (void *)swift_task_alloc();
                  *(void *)(v0 + 432) = v75;
                  void *v75 = v0;
                  v75[1] = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
                  specialized LiteMessageServiceSession.lastActiveToken(for:)(v74);
                }
                else
                {
                  v117 = (void *)swift_task_alloc();
                  *(void *)(v0 + 472) = v117;
                  void *v117 = v0;
                  v117[1] = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
                  uint64_t v118 = *(void *)(v0 + 264);
                  uint64_t v120 = *(void *)(v0 + 248);
                  uint64_t v119 = *(void *)(v0 + 256);
                  LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:)(v120, v119, 0, 0xF000000000000000, v118);
                }
                return;
              }
              uint64_t v93 = *(void *)(v0 + 328);
              uint64_t v94 = *(void *)(v0 + 280);
              uint64_t v95 = *(void *)(v0 + 288);
              swift_release();
              [v3 setWasDowngradedToLiteMessage:0];
              uint64_t v96 = Logger.availability.unsafeMutableAddressor();
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 16))(v93, v96, v94);
              id v82 = v3;
              uint64_t v97 = Logger.logObject.getter();
              os_log_type_t v98 = static os_log_type_t.info.getter();
              if (!os_log_type_enabled(v97, v98))
              {
                uint64_t v111 = *(void *)(v0 + 328);
                uint64_t v112 = *(void *)(v0 + 280);
                uint64_t v113 = *(void *)(v0 + 288);

                (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v111, v112);
                goto LABEL_62;
              }
              id v99 = (uint8_t *)swift_slowAlloc();
              v130[0] = swift_slowAlloc();
              *(_DWORD *)id v99 = 136315138;
              id v100 = [v82 chatIdentifier];
              if (v100)
              {
                unint64_t v101 = v100;
                uint64_t v125 = *(void *)(v0 + 288);
                uint64_t v126 = *(void *)(v0 + 280);
                os_log_t loga = *(os_log_t *)(v0 + 328);
                uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v104 = v103;

                *(void *)(v0 + 232) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v102, v104, v130);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();

                _os_log_impl(&def_3494C, v97, v98, "Last message is not a Lite Message or not under the time limit for %s", v99, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                (*(void (**)(os_log_t, uint64_t))(v125 + 8))(loga, v126);
LABEL_62:
                uint64_t v114 = *(void *)(v0 + 376);
                uint64_t v115 = *(void *)(v0 + 352);
                uint64_t v116 = *(void *)(v0 + 360);
                id v20 = LiteMessageServiceSession.result(for:reachable:)(*(void *)(v0 + 248), *(void *)(v0 + 256), 0);

                (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v114, v115);
                goto LABEL_28;
              }
LABEL_67:

              __break(1u);
              return;
            }
            uint64_t v76 = *(void *)(v0 + 320);
            uint64_t v77 = *(void *)(v0 + 280);
            uint64_t v78 = *(void *)(v0 + 288);
            swift_release();
            uint64_t v79 = Logger.availability.unsafeMutableAddressor();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16))(v76, v79, v77);
            id v80 = v3;
            id v81 = v22;
            id v82 = v80;
            id v83 = v81;
            uint64_t v84 = Logger.logObject.getter();
            os_log_type_t v85 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v84, v85))
            {
              log = v84;
              uint64_t v129 = v83;
              uint64_t v86 = swift_slowAlloc();
              uint64_t v124 = (void *)swift_slowAlloc();
              v130[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v86 = 134218498;
              *(double *)(v0 + 208) = v69;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v86 + 12) = 2080;
              id v87 = [v82 chatIdentifier];
              if (!v87)
              {

                __break(1u);
                goto LABEL_67;
              }
              uint64_t v88 = v87;
              uint64_t v121 = *(void *)(v0 + 288);
              uint64_t v122 = *(void *)(v0 + 280);
              uint64_t v123 = *(void *)(v0 + 320);
              uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              unint64_t v91 = v90;

              *(void *)(v0 + 216) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v91, v130);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();

              *(_WORD *)(v86 + 22) = 2112;
              *(void *)(v0 + 224) = v129;
              id v92 = v129;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *uint64_t v124 = v22;

              _os_log_impl(&def_3494C, log, v85, "Found last iMessage Lite > %f for %s for %@ ", (uint8_t *)v86, 0x20u);
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_arrayDestroy();
              swift_slowDealloc();
              id v83 = v129;
              swift_slowDealloc();

              (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v123, v122);
            }
            else
            {
              uint64_t v105 = *(void *)(v0 + 320);
              uint64_t v106 = *(void *)(v0 + 280);
              uint64_t v107 = *(void *)(v0 + 288);

              (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v105, v106);
            }
            uint64_t v108 = *(void *)(v0 + 376);
            uint64_t v109 = *(void *)(v0 + 352);
            uint64_t v110 = *(void *)(v0 + 360);
            id v20 = LiteMessageServiceSession.result(for:reachable:)(*(void *)(v0 + 248), *(void *)(v0 + 256), 0);

            (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v108, v109);
LABEL_28:
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            id v63 = *(void (**)(id))(v0 + 8);
            v63(v20);
            return;
          }
          NSString v64 = String._bridgeToObjectiveC()();
          id v65 = [v31 objectForKey:v64];

          if (v65)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            *(_OWORD *)(v0 + 48) = 0u;
            *(_OWORD *)(v0 + 64) = 0u;
          }
          outlined init with take of Any?(v0 + 48, v0 + 16);
          if (*(void *)(v0 + 40))
          {
            os_log_type_t v66 = (id *)(v0 + 192);
            type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
            if (swift_dynamicCast()) {
              goto LABEL_40;
            }
          }
          else
          {

            outlined destroy of TaskPriority?(v0 + 16, &demangling cache variable for type metadata for Any?);
          }
          *(double *)&uint64_t v70 = 1800.0;
          goto LABEL_46;
        }
      }
      else
      {
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 360) + 56))(*(void *)(v0 + 344), 1, 1, *(void *)(v0 + 352));
      }
      uint64_t v50 = *(void *)(v0 + 344);
      uint64_t v51 = *(void *)(v0 + 312);
      uint64_t v52 = *(void *)(v0 + 280);
      uint64_t v53 = *(void *)(v0 + 288);
      swift_release();
      outlined destroy of TaskPriority?(v50, &demangling cache variable for type metadata for Date?);
      uint64_t v54 = Logger.availability.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v51, v54, v52);
      uint64_t v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v57 = 0;
        _os_log_impl(&def_3494C, v55, v56, "No time found for last lite message", v57, 2u);
        swift_slowDealloc();
      }
      uint64_t v58 = *(void *)(v0 + 312);
      uint64_t v59 = *(void *)(v0 + 280);
      uint64_t v60 = *(void *)(v0 + 288);
      uint64_t v62 = *(void *)(v0 + 248);
      uint64_t v61 = *(void *)(v0 + 256);

      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v59);
      id v20 = LiteMessageServiceSession.result(for:reachable:)(v62, v61, 0);

LABEL_27:
      goto LABEL_28;
    }
    uint64_t v34 = *(void *)(v0 + 304);
    uint64_t v35 = *(void *)(v0 + 280);
    uint64_t v36 = *(void *)(v0 + 288);
    swift_release();
    uint64_t v37 = Logger.availability.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v34, v37, v35);
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&def_3494C, v38, v39, "No Lite Message found in chat", v40, 2u);
      swift_slowDealloc();
    }
    uint64_t v41 = *(void *)(v0 + 304);
    uint64_t v42 = *(void *)(v0 + 280);
    uint64_t v43 = *(void *)(v0 + 288);
    uint64_t v45 = *(void *)(v0 + 248);
    uint64_t v44 = *(void *)(v0 + 256);

    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
    uint64_t v46 = v45;
    uint64_t v47 = v44;
LABEL_22:
    id v20 = LiteMessageServiceSession.result(for:reachable:)(v46, v47, 0);
    goto LABEL_27;
  }
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 256);
  swift_release();
  lazy protocol witness table accessor for type LiteMessageReachabilityError and conformance LiteMessageReachabilityError();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = v4;
  *(unsigned char *)(v6 + 16) = 4;
  swift_bridgeObjectRetain();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(void (**)(void))(v0 + 8);
  v7();
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 440) = a1;
  *(void *)(v4 + 448) = a2;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 400);
  uint64_t v6 = *(void *)(v3 + 392);
  return _swift_task_switch(LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:), v6, v5);
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)()
{
  uint64_t v30 = v0;
  unint64_t v1 = *(void *)(v0 + 448);
  if (v1 >> 60 == 15)
  {

    id v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v2;
    *id v2 = v0;
    v2[1] = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
    uint64_t v3 = *(void *)(v0 + 264);
    uint64_t v4 = *(void *)(v0 + 256);
    uint64_t v5 = *(void *)(v0 + 248);
    uint64_t v6 = 0;
    uint64_t v7 = 0xF000000000000000;
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 440);
    uint64_t v9 = *(void *)(v0 + 336);
    uint64_t v10 = *(void *)(v0 + 280);
    uint64_t v11 = *(void *)(v0 + 288);
    uint64_t v12 = Logger.availability.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v12, v10);
    outlined copy of Data._Representation(v8, v1);
    outlined copy of Data._Representation(v8, v1);
    os_log_type_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v17 = *(void *)(v0 + 440);
    unint64_t v16 = *(void *)(v0 + 448);
    uint64_t v18 = *(void *)(v0 + 336);
    uint64_t v19 = *(void *)(v0 + 280);
    uint64_t v20 = *(void *)(v0 + 288);
    if (v15)
    {
      uint64_t v28 = *(void *)(v0 + 280);
      uint64_t v27 = *(void *)(v0 + 336);
      id v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)id v21 = 136315138;
      outlined copy of Data._Representation(v17, v16);
      uint64_t v22 = Data.description.getter();
      unint64_t v24 = v23;
      outlined consume of Data?(v17, v16);
      *(void *)(v0 + 240) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v24, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined consume of Data?(v17, v16);
      outlined consume of Data?(v17, v16);
      _os_log_impl(&def_3494C, v13, v14, "Will determine iMessage Lite availability using last active token: %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v27, v28);
    }
    else
    {
      outlined consume of Data?(*(void *)(v0 + 440), *(void *)(v0 + 448));
      outlined consume of Data?(v17, v16);

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    }
    outlined copy of Data._Representation(*(void *)(v0 + 440), *(void *)(v0 + 448));
    uint64_t v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 456) = v25;
    *uint64_t v25 = v0;
    v25[1] = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
    uint64_t v6 = *(void *)(v0 + 440);
    uint64_t v7 = *(void *)(v0 + 448);
    uint64_t v3 = *(void *)(v0 + 264);
    uint64_t v4 = *(void *)(v0 + 256);
    uint64_t v5 = *(void *)(v0 + 248);
  }
  return LiteMessageServiceSession.isAvailableForLiteMessage(for:token:with:)(v5, v4, v6, v7, v3);
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t (*v12)(id);
  uint64_t v14;

  unint64_t v1 = *(void *)(v0 + 440);
  id v2 = *(void *)(v0 + 448);

  outlined consume of Data?(v1, v2);
  uint64_t v3 = *(unsigned char *)(v0 + 152);
  uint64_t v5 = *(void **)(v0 + 408);
  uint64_t v4 = *(void **)(v0 + 416);
  uint64_t v6 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 352);
  uint64_t v8 = *(void *)(v0 + 360);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v9 = *(void *)(v0 + 256);
  swift_release();
  uint64_t v11 = LiteMessageServiceSession.result(for:reachable:)(v10, v9, v3);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(id))(v0 + 8);
  return v12(v11);
}

{
  uint64_t v0;
  char v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t (*v10)(id);
  uint64_t v12;

  unint64_t v1 = *(unsigned char *)(v0 + 176);
  uint64_t v3 = *(void **)(v0 + 408);
  id v2 = *(void **)(v0 + 416);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 352);
  uint64_t v6 = *(void *)(v0 + 360);
  uint64_t v8 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 256);
  swift_release();
  uint64_t v9 = LiteMessageServiceSession.result(for:reachable:)(v8, v7, v1);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(id))(v0 + 8);
  return v10(v9);
}

{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v11;

  unint64_t v1 = v0[55];
  id v2 = v0[56];
  uint64_t v4 = (void *)v0[52];
  uint64_t v3 = (void *)v0[53];
  uint64_t v5 = (void *)v0[51];
  uint64_t v6 = v0[47];
  uint64_t v7 = v0[44];
  uint64_t v8 = v0[45];
  swift_release();

  outlined consume of Data?(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  id v2 = (void *)v0[51];
  unint64_t v1 = (void *)v0[52];
  uint64_t v3 = v0[47];
  uint64_t v4 = v0[44];
  uint64_t v5 = v0[45];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:)(char a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[20] = v1;
  *((unsigned char *)v4 + 152) = a1;
  v4[18] = v2;
  v4[58] = v1;
  swift_task_dealloc();
  outlined consume of Data?(v3[55], v3[56]);
  uint64_t v5 = v3[50];
  uint64_t v6 = v3[49];
  if (v1) {
    uint64_t v7 = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
  }
  else {
    uint64_t v7 = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
  }
  return _swift_task_switch(v7, v6, v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v9;

  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 184) = v1;
  *(unsigned char *)(v4 + 176) = a1;
  *(void *)(v4 + 168) = v2;
  *(void *)(v4 + 480) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 400);
  uint64_t v6 = *(void *)(v3 + 392);
  if (v1) {
    uint64_t v7 = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
  }
  else {
    uint64_t v7 = LiteMessageServiceSession.calculateOnGridReachability(for:with:isRecipientOffGrid:);
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSData?) -> () with result type (Bool, Data?)(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = (uint64_t)a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    id v6 = a3;
    uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    unint64_t v8 = 0xF000000000000000;
  }
  uint64_t v9 = *(void *)(*(void *)(v5 + 64) + 40);
  *(unsigned char *)uint64_t v9 = a2;
  *(void *)(v9 + 8) = v3;
  *(void *)(v9 + 16) = v8;

  return _swift_continuation_resume(v5);
}

void *specialized Dictionary.subscript.getter(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = __CocoaDictionary.lookup(_:)();

  if (!v4) {
    return 0;
  }
  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSOffGridDeliveryQueryResult);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_2FB80()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<IDSURI>);
      id v3 = (void *)static _SetStorage.allocate(capacity:)();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  id v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  char v7 = (char *)(v3 + 7);
  uint64_t v43 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v3[5]);
        uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)&v7[8 * v15] = v17 | v16;
        *(void *)(v3[6] + 8 * v14) = v11;
        uint64_t v23 = v3[2];
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        v3[2] = v24;
        if (v8 == v5) {
          return;
        }
      }
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = static NSObject.== infix(_:_:)();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v41 = a1 + 32;
  uint64_t v42 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (v25 != v42)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(v41 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = ~v29;
      while (1)
      {
        unint64_t v30 = (v30 + 1) & v36;
        unint64_t v31 = v30 >> 6;
        uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
        uint64_t v33 = 1 << v30;
        if ((v32 & (1 << v30)) == 0) {
          break;
        }
        id v37 = *(id *)(v3[6] + 8 * v30);
        char v38 = static NSObject.== infix(_:_:)();

        if (v38) {
          goto LABEL_24;
        }
      }
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

char *specialized LiteMessageServiceSession.isLastMessageLite(for:with:)(void *a1, double a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void (***)(char *, uint64_t, uint64_t))(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v8 - 8);
  os_log_type_t v56 = (void (**)(char *, uint64_t, uint64_t))((char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(char **)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v52 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v50 = (char *)&v45 - v14;
  id v15 = [self sharedInstance];
  unint64_t result = (char *)[a1 chatIdentifier];
  if (!result)
  {
LABEL_32:
    __break(1u);
    return result;
  }
  uint64_t v17 = result;
  id v18 = [v15 allExistingChatsWithIdentifier:result];

  type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMDChat);
  unint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v19 >> 62)
  {
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_4;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    return (unsigned char *)(&def_3494C + 1);
  }
  uint64_t v20 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8));
  if (!v20) {
    goto LABEL_30;
  }
LABEL_4:
  uint64_t v55 = (void *)v10;
  uint64_t v46 = v7;
  uint64_t v47 = v5;
  unint64_t v10 = v19 & 0xC000000000000001;
  uint64_t v53 = (id *)(v11 + 32);
  uint64_t v54 = (void (**)(id, uint64_t, uint64_t, void *))(v11 + 56);
  uint64_t v51 = (unsigned int (**)(id, uint64_t, void *))(v11 + 48);
  uint64_t v48 = v4;
  uint64_t v49 = (void (**)(char *, id))(v11 + 8);
  uint64_t v4 = 4;
  while (1)
  {
    if (v10) {
      id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v21 = *(id *)(v19 + 8 * v4);
    }
    char v22 = v21;
    char v7 = (char *)(v4 - 3);
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    unint64_t result = (char *)[v21 service];
    if (!result)
    {
      __break(1u);
      goto LABEL_32;
    }
    uint64_t v11 = result;
    uint64_t v5 = (void (**)(char *, uint64_t, uint64_t))[result internalName];

    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    if (v23 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v25 != v26) {
      break;
    }

    swift_bridgeObjectRelease_n();
LABEL_6:
    ++v4;
    if (v7 == (char *)v20) {
      goto LABEL_30;
    }
  }
  uint64_t v11 = v26;
  char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v56;
  if ((v28 & 1) != 0
    || (uint64_t v11 = (char *)[self sharedInstance],
        id v29 = objc_msgSend(v11, "lastMessageForChatWithRowID:", objc_msgSend(v22, "rowID")),
        v11,
        !v29))
  {
LABEL_22:

    goto LABEL_6;
  }
  id v30 = [v29 time];
  if (!v30)
  {
    (*v54)(v5, 1, 1, v55);
LABEL_24:

    outlined destroy of TaskPriority?((uint64_t)v5, &demangling cache variable for type metadata for Date?);
    goto LABEL_6;
  }
  unint64_t v31 = v30;
  uint64_t v32 = v52;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v11 = (char *)*v53;
  uint64_t v33 = v32;
  id v34 = v55;
  ((void (*)(id, char *, void *))*v53)(v5, v33, v55);
  (*v54)(v5, 0, 1, v34);
  if ((*v51)(v5, 1, v34) == 1) {
    goto LABEL_24;
  }
  char v35 = v50;
  uint64_t v36 = v5;
  uint64_t v5 = (void (**)(char *, uint64_t, uint64_t))v55;
  ((void (*)(char *, void, void *))v11)(v50, v36, v55);
  Date.timeIntervalSinceNow.getter();
  if (fabs(v37) >= a2)
  {
    (*v49)(v35, v5);

    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  uint64_t v38 = Logger.availability.unsafeMutableAddressor();
  uint64_t v40 = v46;
  uint64_t v39 = v47;
  uint64_t v41 = v48;
  v47[2](v46, v38, v48);
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&def_3494C, v42, v43, "We have a more recent message in chat that is not iMessage Lite", v44, 2u);
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v39[1])(v40, v41);
  (*v49)(v50, v55);
  return 0;
}

uint64_t specialized LiteMessageServiceSession.lastActiveToken(for:)(uint64_t a1)
{
  v1[18] = a1;
  type metadata accessor for MainActor();
  v1[19] = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[20] = v3;
  v1[21] = v2;
  return _swift_task_switch(specialized LiteMessageServiceSession.lastActiveToken(for:), v3, v2);
}

uint64_t specialized LiteMessageServiceSession.lastActiveToken(for:)()
{
  uint64_t v1 = (void *)v0[18];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = specialized LiteMessageServiceSession.lastActiveToken(for:);
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSData?) -> () with result type (Bool, Data?);
  v0[13] = &block_descriptor_25;
  v0[14] = v2;
  [v1 cachedOffGridModeAndLastPublisherWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  uint64_t v2 = *(void *)(*(void *)v0 + 160);
  return _swift_task_switch(specialized LiteMessageServiceSession.lastActiveToken(for:), v2, v1);
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t (*v3)(uint64_t, unint64_t);
  uint64_t v5;

  swift_release();
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  if (*(unsigned char *)(v0 + 120) != 1)
  {
LABEL_9:
    outlined consume of Data?(v1, v2);
    goto LABEL_10;
  }
  if (v2 >> 60 == 15)
  {
LABEL_10:
    uint64_t v1 = 0;
    uint64_t v2 = 0xF000000000000000;
    goto LABEL_11;
  }
  switch(v2 >> 62)
  {
    case 1uLL:
      if ((int)v1 == v1 >> 32) {
        goto LABEL_9;
      }
      break;
    case 2uLL:
      if (*(void *)(v1 + 16) == *(void *)(v1 + 24)) {
        goto LABEL_9;
      }
      break;
    case 3uLL:
      goto LABEL_9;
    default:
      if ((v2 & 0xFF000000000000) == 0) {
        goto LABEL_9;
      }
      break;
  }
LABEL_11:
  uint64_t v3 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v3(v1, v2);
}

id LiteMessageServiceSession.processPreferredServiceType(_:for:expiresAfter:)(char *a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v84 = a4;
  uint64_t v85 = a2;
  unint64_t v87 = a3;
  id v83 = a1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v88 = *(void *)(v4 - 8);
  uint64_t v89 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  char v7 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v86 = (char *)&v78 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v79 = (char *)&v78 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  id v80 = (char *)&v78 - v13;
  __chkstk_darwin(v12);
  uint64_t v78 = (char *)&v78 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v21 = (char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v22 = self;
  id result = [v22 sharedInstance];
  if (!result)
  {
    __break(1u);
LABEL_33:
    __break(1u);
    return result;
  }
  uint64_t v24 = result;
  id v25 = [result anySessionForServiceName:IMServiceNameiMessage];

  id v82 = v25;
  if (v25)
  {
    id result = [v22 sharedInstance];
    if (result)
    {
      Swift::Int v26 = result;
      id v27 = [result anySessionForServiceName:IMServiceNameRCS];

      outlined init with copy of Date?((uint64_t)v84, (uint64_t)v17);
      uint64_t v28 = v19;
      id v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
      id v30 = (char *)v18;
      unint64_t v31 = v21;
      if (v29(v17, 1, v18) == 1)
      {
        static Double.defaultSMSDowngradeTimeInterval.getter();
        Date.init(timeIntervalSinceNow:)();
        outlined destroy of TaskPriority?((uint64_t)v17, &demangling cache variable for type metadata for Date?);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v21, v17, v18);
      }
      uint64_t v38 = v89;
      uint64_t v39 = v86;
      if (v83 == (char *)-1)
      {
        id v83 = v21;
        uint64_t v53 = Logger.liteSession.unsafeMutableAddressor();
        uint64_t v54 = v88;
        uint64_t v39 = v79;
        (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v79, v53, v38);
        unint64_t v55 = v87;
        swift_bridgeObjectRetain_n();
        os_log_type_t v56 = Logger.logObject.getter();
        os_log_type_t v57 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          id v84 = v27;
          uint64_t v91 = v59;
          *(_DWORD *)uint64_t v58 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v90 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, v55, &v91);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&def_3494C, v56, v57, "Unspecified service preference, dropping selection %s", v58, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v60 = *(void (**)(char *, uint64_t))(v54 + 8);
          uint64_t v61 = v79;
LABEL_21:
          uint64_t v67 = v89;
LABEL_23:
          v60(v61, v67);
          return (id)(*(uint64_t (**)(char *, char *))(v28 + 8))(v83, v30);
        }
      }
      else
      {
        if (v83 == (unsigned char *)&def_3494C + 1)
        {
          id v83 = v21;
          id v84 = v27;
          uint64_t v86 = v30;
          uint64_t v46 = Logger.liteSession.unsafeMutableAddressor();
          uint64_t v47 = v88;
          uint64_t v48 = v80;
          (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v80, v46, v38);
          unint64_t v49 = v87;
          swift_bridgeObjectRetain_n();
          uint64_t v50 = Logger.logObject.getter();
          os_log_type_t v51 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = (uint8_t *)swift_slowAlloc();
            uint64_t v91 = swift_slowAlloc();
            *(_DWORD *)uint64_t v52 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v90 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, v49, &v91);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&def_3494C, v50, v51, "%s requested downgrade to SMS", v52, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v47 + 8))(v80, v89);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v38);
          }
          NSString v68 = String._bridgeToObjectiveC()();
          unint64_t v31 = v83;
          Class isa = Date._bridgeToObjectiveC()().super.isa;
          id v70 = v82;
          [v82 downgradeRequestedForHandleID:v68 expirationDate:isa preferredService:IMServiceNameSMS];

          id v71 = v84;
          if (!v84) {
            goto LABEL_31;
          }
          id v72 = v84;
          NSString v73 = String._bridgeToObjectiveC()();
          v74.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
          [v72 downgradeRequestedForHandleID:v73 expirationDate:v74.super.isa preferredService:IMServiceNameSMS];

          goto LABEL_30;
        }
        if (!v83)
        {
          id v84 = v27;
          uint64_t v86 = v30;
          uint64_t v40 = Logger.liteSession.unsafeMutableAddressor();
          uint64_t v41 = v88;
          uint64_t v42 = v78;
          (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v78, v40, v38);
          swift_bridgeObjectRetain_n();
          os_log_type_t v43 = Logger.logObject.getter();
          os_log_type_t v44 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v43, v44))
          {
            uint64_t v45 = (uint8_t *)swift_slowAlloc();
            uint64_t v91 = swift_slowAlloc();
            *(_DWORD *)uint64_t v45 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v90 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, v87, &v91);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&def_3494C, v43, v44, "%s requested upgrade to iMessage", v45, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v41 + 8))(v78, v89);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v38);
          }
          id v70 = v82;
          NSString v75 = String._bridgeToObjectiveC()();
          [v70 clearDowngradeRequestForHandleID:v75];

          id v71 = v84;
          if (!v84) {
            goto LABEL_31;
          }
          NSString v73 = v84;
          v74.super.Class isa = (Class)String._bridgeToObjectiveC()();
          [v73 clearDowngradeRequestForHandleID:v74.super.isa];
LABEL_30:

          id v71 = v84;
LABEL_31:
          id v76 = [v81 broadcasterForChatListeners];
          NSString v77 = String._bridgeToObjectiveC()();
          [v76 serviceSwitchRequestReceivedForChatWithIdentifier:v77];

          swift_unknownObjectRelease();
          return (id)(*(uint64_t (**)(char *, char *))(v28 + 8))(v31, v86);
        }
        id v83 = v21;
        uint64_t v62 = Logger.liteSession.unsafeMutableAddressor();
        uint64_t v54 = v88;
        (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v39, v62, v38);
        unint64_t v63 = v87;
        swift_bridgeObjectRetain_n();
        os_log_type_t v56 = Logger.logObject.getter();
        os_log_type_t v64 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v56, v64))
        {
          id v65 = (uint8_t *)swift_slowAlloc();
          uint64_t v66 = swift_slowAlloc();
          id v84 = v27;
          uint64_t v91 = v66;
          *(_DWORD *)id v65 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v90 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, v63, &v91);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&def_3494C, v56, v64, "Unknown service preference, dropping selection %s", v65, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v60 = *(void (**)(char *, uint64_t))(v54 + 8);
          uint64_t v61 = v86;
          goto LABEL_21;
        }
      }
      swift_bridgeObjectRelease_n();

      uint64_t v60 = *(void (**)(char *, uint64_t))(v54 + 8);
      uint64_t v61 = v39;
      uint64_t v67 = v38;
      goto LABEL_23;
    }
    goto LABEL_33;
  }
  uint64_t v32 = Logger.liteSession.unsafeMutableAddressor();
  uint64_t v33 = v88;
  uint64_t v34 = v89;
  (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v7, v32, v89);
  char v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v35, v36))
  {
    double v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v37 = 0;
    _os_log_impl(&def_3494C, v35, v36, "No iMessage service session found for preferred service request", v37, 2u);
    swift_slowDealloc();
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v7, v34);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Data?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(void *, unint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v4 = v2;
    uint64_t v2 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    swift_retain();
    unint64_t v6 = 0xF000000000000000;
  }
  v3(v2, v6);
  outlined consume of Data?((uint64_t)v2, v6);

  return swift_release();
}

Swift::Void __swiftcall LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  type metadata accessor for MainActor();
  id v5 = v0;
  uint64_t v6 = static MainActor.shared.getter();
  char v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = &protocol witness table for MainActor;
  v7[4] = v5;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded(), (uint64_t)v7);
  swift_release();
}

uint64_t closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[6] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[7] = v7;
  v4[8] = v6;
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded(), v7, v6);
}

uint64_t closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()()
{
  unint64_t v1 = specialized LiteMessageServiceSession.downgradeRequestedHandles.getter();
  *(void *)(v0 + 72) = v1;
  if (*(void *)(v1 + 16))
  {
    char v2 = *(unsigned char *)(v1 + 32);
    *(unsigned char *)(v0 + 120) = v2;
    uint64_t v3 = -1;
    uint64_t v4 = -1 << v2;
    if (-v4 < 64) {
      uint64_t v3 = ~(-1 << -(char)v4);
    }
    unint64_t v5 = v3 & *(void *)(v1 + 64);
    if (v5)
    {
      uint64_t v6 = 0;
      unint64_t v7 = __clz(__rbit64(v5));
      uint64_t v8 = (v5 - 1) & v5;
LABEL_6:
      *(void *)(v0 + 80) = v6;
      *(void *)(v0 + 88) = v8;
      uint64_t v9 = 16 * v7;
      uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + v9);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      *(void *)(v0 + 96) = v12;
      uint64_t v13 = (uint64_t *)(*(void *)(v1 + 56) + v9);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      *(void *)(v0 + 104) = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 112) = v16;
      *uint64_t v16 = v0;
      v16[1] = closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded();
      return LiteMessageServiceSession.sendUpgradeMessage(to:from:)(v11, v12, v15, v14);
    }
    unint64_t v28 = 63 - v4;
    if (v28 > 0x7F)
    {
      unint64_t v29 = *(void *)(v1 + 72);
      if (v29)
      {
        uint64_t v6 = 1;
LABEL_15:
        uint64_t v8 = (v29 - 1) & v29;
        unint64_t v7 = __clz(__rbit64(v29)) + (v6 << 6);
        goto LABEL_6;
      }
      if (v28 >= 0xC0)
      {
        unint64_t v29 = *(void *)(v1 + 80);
        if (v29)
        {
          uint64_t v6 = 2;
          goto LABEL_15;
        }
        if (v28 >= 0x100)
        {
          unint64_t v29 = *(void *)(v1 + 88);
          if (v29)
          {
            uint64_t v6 = 3;
            goto LABEL_15;
          }
          if (v28 >= 0x140)
          {
            unint64_t v29 = *(void *)(v1 + 96);
            if (v29)
            {
              uint64_t v6 = 4;
              goto LABEL_15;
            }
            uint64_t v30 = 0;
            uint64_t v31 = v28 >> 6;
            if (v31 <= 5) {
              uint64_t v31 = 5;
            }
            uint64_t v32 = v31 - 5;
            while (v32 != v30)
            {
              unint64_t v29 = *(void *)(v1 + 104 + 8 * v30++);
              if (v29)
              {
                uint64_t v6 = v30 + 4;
                goto LABEL_15;
              }
            }
          }
        }
      }
    }
    swift_release();
    swift_release();
    specialized Dictionary.init(dictionaryLiteral:)((uint64_t)_swiftEmptyArrayStorage);
    specialized LiteMessageServiceSession.downgradeRequestedHandles.setter();
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 40);
    uint64_t v19 = *(void *)(v0 + 24);
    uint64_t v20 = *(void *)(v0 + 32);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v21 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v21, v19);
    char v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&def_3494C, v22, v23, "No downgraded handles to upgrade", v24, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = *(void *)(v0 + 32);
    uint64_t v25 = *(void *)(v0 + 40);
    uint64_t v27 = *(void *)(v0 + 24);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  }
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  unint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded(), v3, v2);
}

void closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()()
{
  int64_t v1 = *(void *)(v0 + 80);
  unint64_t v2 = *(void *)(v0 + 88);
  if (v2)
  {
    unint64_t v3 = __clz(__rbit64(v2));
    uint64_t v4 = (v2 - 1) & v2;
    unint64_t v5 = v3 | (v1 << 6);
    uint64_t v6 = *(void *)(v0 + 72);
LABEL_3:
    *(void *)(v0 + 80) = v1;
    *(void *)(v0 + 88) = v4;
    unint64_t v7 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v5);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    *(void *)(v0 + 96) = v8;
    uint64_t v10 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v5);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    *(void *)(v0 + 104) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v13;
    *uint64_t v13 = v0;
    v13[1] = closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded();
    LiteMessageServiceSession.sendUpgradeMessage(to:from:)(v9, v8, v11, v12);
    return;
  }
  int64_t v14 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  int64_t v15 = (unint64_t)((1 << *(unsigned char *)(v0 + 120)) + 63) >> 6;
  uint64_t v6 = *(void *)(v0 + 72);
  if (v14 < v15)
  {
    uint64_t v16 = v6 + 64;
    unint64_t v17 = *(void *)(v6 + 64 + 8 * v14);
    ++v1;
    if (v17)
    {
LABEL_9:
      uint64_t v4 = (v17 - 1) & v17;
      unint64_t v5 = __clz(__rbit64(v17)) + (v1 << 6);
      goto LABEL_3;
    }
    int64_t v1 = v14 + 1;
    if (v14 + 1 < v15)
    {
      unint64_t v17 = *(void *)(v16 + 8 * v1);
      if (v17) {
        goto LABEL_9;
      }
      int64_t v1 = v14 + 2;
      if (v14 + 2 < v15)
      {
        unint64_t v17 = *(void *)(v16 + 8 * v1);
        if (v17) {
          goto LABEL_9;
        }
        int64_t v18 = v14 + 3;
        if (v18 < v15)
        {
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (v17)
          {
            int64_t v1 = v18;
            goto LABEL_9;
          }
          while (1)
          {
            int64_t v1 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              break;
            }
            if (v1 >= v15) {
              goto LABEL_20;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v1);
            ++v18;
            if (v17) {
              goto LABEL_9;
            }
          }
LABEL_24:
          __break(1u);
          return;
        }
      }
    }
  }
LABEL_20:
  swift_release();
  swift_release();
  specialized Dictionary.init(dictionaryLiteral:)((uint64_t)_swiftEmptyArrayStorage);
  specialized LiteMessageServiceSession.downgradeRequestedHandles.setter();
  swift_task_dealloc();
  uint64_t v19 = *(void (**)(void))(v0 + 8);
  v19();
}

uint64_t LiteMessageServiceSession.sendUpgradeMessage(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[30] = a4;
  v5[31] = v4;
  v5[28] = a2;
  v5[29] = a3;
  v5[27] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[32] = v6;
  v5[33] = *(void *)(v6 - 8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[38] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[39] = v8;
  v5[40] = v7;
  return _swift_task_switch(LiteMessageServiceSession.sendUpgradeMessage(to:from:), v8, v7);
}

uint64_t LiteMessageServiceSession.sendUpgradeMessage(to:from:)()
{
  uint64_t v59 = v0;
  id v1 = objc_allocWithZone((Class)IDSURI);
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithUnprefixedURI:v2];
  v0[41] = v3;

  if (v3)
  {
    id v4 = objc_allocWithZone((Class)IDSURI);
    swift_bridgeObjectRetain();
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v6 = [v4 initWithUnprefixedURI:v5];
    v0[42] = v6;

    if (v6)
    {
      uint64_t v7 = v0[37];
      uint64_t v8 = v0[32];
      uint64_t v9 = v0[33];
      uint64_t v10 = Logger.liteSession.unsafeMutableAddressor();
      v0[43] = v10;
      uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
      v0[44] = v11;
      v0[45] = (v9 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v11(v7, v10, v8);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.default.getter();
      BOOL v14 = os_log_type_enabled(v12, v13);
      uint64_t v15 = v0[37];
      uint64_t v16 = v0[32];
      uint64_t v17 = v0[33];
      unint64_t v18 = v0[30];
      if (v14)
      {
        uint64_t v52 = v0[29];
        uint64_t v56 = v0[32];
        unint64_t v19 = v0[28];
        uint64_t v51 = v0[27];
        os_log_type_t type = v13;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315394;
        swift_bridgeObjectRetain();
        v0[25] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v19, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v20 + 12) = 2080;
        swift_bridgeObjectRetain();
        v0[26] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v18, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_3494C, v12, type, "Sending upgrade message to %s from %s", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
        v21(v15, v56);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
        v21(v15, v16);
      }
      v0[46] = v21;
      id v47 = LiteMessageServiceSession.offGridMessenger.getter();
      v0[47] = v47;
      v0[2] = v0;
      v0[7] = v0 + 18;
      v0[3] = LiteMessageServiceSession.sendUpgradeMessage(to:from:);
      uint64_t v48 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IMIDSOffGridServiceUpdateMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IMIDSOffGridServiceUpdateMessage, String);
      v0[13] = &block_descriptor_5;
      v0[14] = v48;
      objc_msgSend(v47, "__im_sendServiceUpdateMessageWithPreferredService:recipientURI:fromURI:options:completion:", 0, v3, v6, 0, v0 + 10);
      return _swift_continuation_await(v0 + 2);
    }
    uint64_t v35 = v0[36];
    uint64_t v36 = v0[32];
    uint64_t v37 = v0[33];
    swift_release();
    uint64_t v38 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v35, v38, v36);
    swift_bridgeObjectRetain_n();
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v42 = v0[36];
    uint64_t v43 = v0[32];
    uint64_t v44 = v0[33];
    unint64_t v45 = v0[30];
    if (v41)
    {
      uint64_t typea = v0[29];
      uint64_t v57 = v0[32];
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315138;
      swift_bridgeObjectRetain();
      v0[21] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(typea, v45, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v39, v40, "Cannot send upgrade message from handle %s, got nil IDSURI", v46, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v57);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v43);
    }
  }
  else
  {
    uint64_t v22 = v0[35];
    uint64_t v23 = v0[32];
    uint64_t v24 = v0[33];
    swift_release();
    uint64_t v25 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v25, v23);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v29 = v0[35];
    uint64_t v30 = v0[32];
    uint64_t v31 = v0[33];
    unint64_t v32 = v0[28];
    if (v28)
    {
      uint64_t v33 = v0[27];
      uint64_t v55 = v0[35];
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      swift_bridgeObjectRetain();
      v0[23] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v32, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v26, v27, "Cannot send upgrade message to handle %s, got nil IDSURI", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v55, v30);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v49 = (uint64_t (*)(void))v0[1];
  return v49();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  id v1 = *v0;
  NSString v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 384) = v2;
  id v3 = *(void *)(v1 + 320);
  id v4 = *(void *)(v1 + 312);
  if (v2) {
    NSString v5 = LiteMessageServiceSession.sendUpgradeMessage(to:from:);
  }
  else {
    NSString v5 = LiteMessageServiceSession.sendUpgradeMessage(to:from:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  id v1 = *(void **)(v0 + 376);
  NSString v2 = *(void **)(v0 + 328);

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v23 = v0;
  id v1 = *(void **)(v0 + 376);
  NSString v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 352);
  id v3 = *(void *)(v0 + 344);
  id v4 = *(void *)(v0 + 272);
  NSString v5 = *(void *)(v0 + 256);
  swift_release();
  swift_willThrow();

  v2(v4, v3, v5);
  swift_errorRetain();
  swift_errorRetain();
  id v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v17 = *(void **)(v0 + 336);
    unint64_t v18 = *(void **)(v0 + 328);
    uint64_t v20 = *(void *)(v0 + 272);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
    unint64_t v19 = *(void *)(v0 + 256);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    *(void *)(v0 + 192) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&def_3494C, v6, v7, "Could not send service update message: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v21(v20, v19);
  }
  else
  {
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
    uint64_t v12 = *(void **)(v0 + 328);
    os_log_type_t v13 = *(void *)(v0 + 272);
    BOOL v14 = *(void *)(v0 + 256);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    v11(v13, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IMIDSOffGridServiceUpdateMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IMIDSOffGridServiceUpdateMessage, String)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    return _swift_continuation_throwingResumeWithError(v4, v6);
  }
  else
  {
    if (a2)
    {
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = *(void **)(*(void *)(v4 + 64) + 40);
      *uint64_t v11 = a2;
      v11[1] = v10;
      v11[2] = v12;
      swift_unknownObjectRetain();
      a1 = v4;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_32EFC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return closure #1 in LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()((uint64_t)v3, v4, v5, v2);
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v17, a5 & 1);
  unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

unint64_t specialized LiteMessageServiceSession.downgradeRequestedHandles.getter()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  id v1 = [self synchronousDatabase];
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = partial apply for closure #1 in LiteMessageServiceSession.downgradeRequestedHandles.getter;
  aBlock[5] = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed Data?) -> ();
  aBlock[3] = &block_descriptor_5;
  id v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v1 fetchDataForKey:v2 completionHandler:v3];
  _Block_release(v3);
  swift_unknownObjectRelease();

  swift_beginAccess();
  uint64_t v4 = *(void **)(v0 + 16);
  if (v4)
  {
    id v5 = v4;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  unint64_t v6 = specialized Dictionary.init(dictionaryLiteral:)((uint64_t)_swiftEmptyArrayStorage);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t specialized LiteMessageServiceSession.downgradeRequestedHandles.setter()
{
  uint64_t v0 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = 0;
  id v2 = [v0 archivedDataWithRootObject:isa requiringSecureCoding:1 error:&v12];

  id v3 = v12;
  if (v2)
  {
    uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;

    id v7 = [self synchronousDatabase];
    Class v8 = Data._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRetain();
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v7 storeData:v8 forKey:v9];
    swift_unknownObjectRelease();

    return outlined consume of Data._Representation(v4, v6);
  }
  else
  {
    uint64_t v11 = v3;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return swift_errorRelease();
  }
}

uint64_t specialized LiteMessageServiceSession.sentDowngradeRequest(toHandleID:fromID:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  char v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v8;
    uint64_t v16 = v15;
    uint64_t v22 = swift_slowAlloc();
    unint64_t v26 = v22;
    *(_DWORD *)uint64_t v16 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v17 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)&v26);
    uint64_t v24 = a1;
    uint64_t v25 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v25 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, (uint64_t *)&v26);
    a1 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v13, v14, "Noting chat %s was downgraded for fromID %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  unint64_t v18 = specialized LiteMessageServiceSession.downgradeRequestedHandles.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v26 = v18;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a3, a4, a1, a2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return specialized LiteMessageServiceSession.downgradeRequestedHandles.setter();
}

uint64_t sub_33CAC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in LiteMessageServiceSession.downgradeRequestedHandles.getter(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
  {
    uint64_t v14 = v2;
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    id v7 = (void **)(v2 + 16);
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_46FA0;
    *(void *)(v8 + 32) = type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSDictionary);
    *(void *)(v8 + 40) = type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSString);
    outlined copy of Data._Representation(a1, a2);
    static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
    outlined consume of Data?(a1, a2);
    swift_bridgeObjectRelease();
    if (v13)
    {
      if (swift_dynamicCast()) {
        uint64_t v9 = v11;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      outlined destroy of TaskPriority?((uint64_t)v12, &demangling cache variable for type metadata for Any?);
      uint64_t v9 = 0;
    }
    swift_beginAccess();
    uint64_t v10 = *v7;
    *id v7 = v9;
  }
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_33E9C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t LiteMessageContext.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LiteMessageContext.senderID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LiteMessageContext.recipientID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LiteMessageContext.isFromMe.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t LiteMessageContext.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LiteMessageContext() + 32);
  uint64_t v4 = type metadata accessor for Date();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for LiteMessageContext()
{
  uint64_t result = type metadata singleton initialization cache for LiteMessageContext;
  if (!type metadata singleton initialization cache for LiteMessageContext) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LiteMessageContext.sentOrReceivedOnSatellite.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for LiteMessageContext() + 36));
}

uint64_t LiteMessageContext.preferredService.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for LiteMessageContext() + 40));
}

uint64_t LiteMessageContext.init(identifier:senderID:recipientID:isFromMe:date:sentOrReceivedOnSatellite:preferredService:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 48) = a7;
  uint64_t v13 = (int *)type metadata accessor for LiteMessageContext();
  uint64_t v14 = a9 + v13[8];
  uint64_t v15 = type metadata accessor for Date();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a8, v15);
  *(unsigned char *)(a9 + v13[9]) = a10;
  *(void *)(a9 + v13[10]) = a11;
  return result;
}

void *initializeBufferWithCopyOfBuffer for LiteMessageContext(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[4];
    uint64_t v10 = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v11 = a3[8];
    uint64_t v18 = a1 + v11;
    uint64_t v12 = (uint64_t)a2 + v11;
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    uint64_t v13 = type metadata accessor for Date();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v18, v12, v13);
    uint64_t v15 = a3[10];
    *((unsigned char *)v4 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *(void *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
  }
  return v4;
}

uint64_t destroy for LiteMessageContext(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for Date();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t initializeWithCopy for LiteMessageContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v10 = a3[8];
  uint64_t v16 = a1 + v10;
  uint64_t v11 = a2 + v10;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v16, v11, v12);
  uint64_t v14 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  return a1;
}

uint64_t assignWithCopy for LiteMessageContext(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for LiteMessageContext(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for LiteMessageContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessageContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_34674);
}

uint64_t sub_34674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LiteMessageContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_34738);
}

uint64_t sub_34738(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for LiteMessageContext()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for IMIDSOffGridPreferredServiceType()
{
  if (!lazy cache variable for type metadata for IMIDSOffGridPreferredServiceType)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for IMIDSOffGridPreferredServiceType);
    }
  }
}

uint64_t LiteMessageAcknowledgement.init(associatedMessageType:)(uint64_t a1)
{
  uint64_t v3 = a1 - 2000;
  if (!v2 & v1)
  {
    switch(a1)
    {
      case 3000:
        uint64_t result = 7;
        break;
      case 3001:
        uint64_t result = 8;
        break;
      case 3002:
        uint64_t result = 9;
        break;
      case 3003:
        uint64_t result = 10;
        break;
      case 3004:
        uint64_t result = 11;
        break;
      case 3005:
        uint64_t result = 12;
        break;
      case 3006:
        uint64_t result = 13;
        break;
      default:
        uint64_t result = 14;
        break;
    }
  }
  else
  {
    uint64_t result = 0;
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = 1;
        break;
      case 2:
        uint64_t result = 2;
        break;
      case 3:
        uint64_t result = 3;
        break;
      case 4:
        uint64_t result = 4;
        break;
      case 5:
        uint64_t result = 5;
        break;
      case 6:
        uint64_t result = 6;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

uint64_t IMMessageItem.IMMessageItemContentType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LiteMessageAcknowledgement@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized LiteMessageAcknowledgement.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LiteMessageAcknowledgement(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t specialized LiteMessageAcknowledgement.init(rawValue:)(unint64_t result)
{
  if (result >= 0xE) {
    return 14;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement;
  if (!lazy protocol witness table cache variable for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement;
  if (!lazy protocol witness table cache variable for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LiteMessageAcknowledgement(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LiteMessageAcknowledgement(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x34BF8);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageAcknowledgement()
{
  return &type metadata for LiteMessageAcknowledgement;
}

uint64_t IMMessageItem.liteData.getter()
{
  uint64_t v5 = v1;
  unsigned int v6 = v0;
  long long v78 = xmmword_476E0;
  char v79 = 0;
  if ([v0 isAssociatedMessageItem]
    && LiteMessageAcknowledgement.init(associatedMessageType:)((uint64_t)[v0 associatedMessageType]) != 14)
  {
    id v7 = &def_3494C + 2;
  }
  else
  {
    id v7 = [v0 isReply];
  }
  if (LiteMessageType.isCoreType.getter(v7))
  {
    uint64_t result = LiteMessageHeader.messageType.getter(v7, 0, 0);
    char v3 = result;
    uint64_t v2 = v9;
    uint64_t v4 = v10;
    if (v1) {
      return result;
    }
  }
  else
  {
    lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError();
    uint64_t v5 = swift_allocError();
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 2;
    uint64_t result = swift_willThrow();
    if (v5) {
      return result;
    }
  }
  if ([v6 isAssociatedMessageItem]
    && LiteMessageAcknowledgement.init(associatedMessageType:)((uint64_t)[v6 associatedMessageType]) != 14)
  {
    unsigned int v12 = 2;
  }
  else
  {
    unsigned int v12 = [v6 isReply];
  }
  id v13 = [v6 expressiveSendStyleID];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  v18.value._uint64_t countAndFlagsBits = v15;
  v18.value._object = v17;
  LOBYTE(v19) = LiteMessageEffect.init(expressiveSendStyleID:)(v18);
  uint64_t v20 = v19;
  if (!v12)
  {
    id v36 = [v6 plainBody];
    if (!v36)
    {
      id v37 = [v6 body];
      uint64_t v38 = v37;
      if (!v37)
      {
        unint64_t v40 = 0xE000000000000000;
        goto LABEL_29;
      }
      id v36 = [v37 string];
    }
    uint64_t v38 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v40 = v39;

LABEL_29:
    NSString v75 = &type metadata for LiteTextMessageContent;
    id v76 = &protocol witness table for LiteTextMessageContent;
    associatedMessageGUID._object = (void *)LiteMessageHeader.messageType.getter(v38, v40, v20);
    uint64_t v73 = v41;
    char v74 = v42;
    goto LABEL_49;
  }
  if (v12 == 1)
  {
    uint64_t v21 = v4;
    id v22 = [v6 threadIdentifier];
    if (v22)
    {
      uint64_t v23 = v22;
      id v24 = (id)IMMessageThreadIdentifierGetOriginatorGUID();

      if (v24)
      {
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v86 = v26;

        id v27 = [v6 plainBody];
        if (!v27)
        {
          id v28 = [v6 body];
          uint64_t v29 = v28;
          if (!v28)
          {
            uint64_t v31 = (void *)0xE000000000000000;
            goto LABEL_24;
          }
          id v27 = [v28 string];
        }
        uint64_t v29 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v31 = v30;

LABEL_24:
        v32._uint64_t countAndFlagsBits = (uint64_t)v29;
        v32._object = v31;
        v33._uint64_t countAndFlagsBits = v25;
        v33._object = v86;
        LiteReplyMessageContent.init(text:threadOriginatorGUID:effect:)(&v84, v32, v33, (iMessageLite::LiteMessageEffect_optional)v20);
        NSString v75 = &type metadata for LiteReplyMessageContent;
        id v76 = &protocol witness table for LiteReplyMessageContent;
        uint64_t v34 = swift_allocObject();
        associatedMessageGUID._object = (void *)v34;
        Swift::String threadOriginatorGUID = v84.threadOriginatorGUID;
        *(Swift::String *)(v34 + 16) = v84.text;
        *(Swift::String *)(v34 + 32) = threadOriginatorGUID;
        *(unsigned char *)(v34 + 48) = v84.effect.value;
        uint64_t v4 = v21;
        goto LABEL_49;
      }
    }
    id v50 = [v6 threadIdentifier];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v54 = v53;

      lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError();
      uint64_t v5 = swift_allocError();
      *(void *)uint64_t v55 = v52;
      *(void *)(v55 + 8) = v54;
    }
    else
    {
      lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError();
      uint64_t v5 = swift_allocError();
      *(void *)uint64_t v55 = 0;
      *(void *)(v55 + 8) = 0;
    }
    *(unsigned char *)(v55 + 16) = 0;
    uint64_t v4 = v21;
    goto LABEL_48;
  }
  id v43 = [v6 associatedMessageGUID];
  id v44 = (id)IMAssociatedMessageDecodeGUID();

  if (!v44)
  {
    id v56 = [v6 associatedMessageGUID];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v60 = v59;

      lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError();
      uint64_t v5 = swift_allocError();
      *(void *)uint64_t v61 = v58;
      *(void *)(v61 + 8) = v60;
    }
    else
    {
      lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError();
      uint64_t v5 = swift_allocError();
      *(void *)uint64_t v61 = 0;
      *(void *)(v61 + 8) = 0;
    }
    *(unsigned char *)(v61 + 16) = 1;
    goto LABEL_48;
  }
  uint64_t v86 = (void *)v4;
  uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v47 = v46;

  iMessageLite::LiteMessageAcknowledgement v48 = LiteMessageAcknowledgement.init(associatedMessageType:)((uint64_t)[v6 associatedMessageType]);
  if (v48 != iMessageLite_LiteMessageAcknowledgement_unknownDefault)
  {
    iMessageLite::LiteMessageAcknowledgement v62 = v48;
    associatedMessageGUID._uint64_t countAndFlagsBits = v45;
    iMessageLite::LiteMessageAcknowledgement v83 = v48;
    char v82 = 6;
    lazy protocol witness table accessor for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement();
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v81 == v80)
    {
      id v63 = objc_msgSend(v6, "associatedMessageEmoji", v45);
      if (v63)
      {
        os_log_type_t v64 = v63;
        uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v67 = v66;

LABEL_44:
        v68._uint64_t countAndFlagsBits = associatedMessageGUID._countAndFlagsBits;
        v68._object = v47;
        v69.value._uint64_t countAndFlagsBits = v65;
        v69.value._object = v67;
        LiteAcknowledgmentMessageContent.init(associatedMessageType:associatedMessageGUID:emoji:)(&v85, v62, v68, v69);
        NSString v75 = &type metadata for LiteAcknowledgmentMessageContent;
        id v76 = &protocol witness table for LiteAcknowledgmentMessageContent;
        uint64_t v70 = swift_allocObject();
        associatedMessageGUID._object = (void *)v70;
        long long v71 = *(_OWORD *)&v85.associatedMessageGUID._object;
        *(_OWORD *)(v70 + 16) = *(_OWORD *)&v85.associatedMessageType;
        *(_OWORD *)(v70 + 32) = v71;
        *(void *)(v70 + 48) = v85.emoji.value._object;
        uint64_t v4 = (uint64_t)v86;
        goto LABEL_49;
      }
    }
    else
    {
      iMessageLite::LiteMessageAcknowledgement v83 = v62;
      char v82 = 13;
      dispatch thunk of RawRepresentable.rawValue.getter();
      dispatch thunk of RawRepresentable.rawValue.getter();
    }
    uint64_t v65 = 0;
    uint64_t v67 = 0;
    goto LABEL_44;
  }
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError();
  uint64_t v5 = swift_allocError();
  *(_OWORD *)uint64_t v49 = xmmword_476F0;
  *(unsigned char *)(v49 + 16) = 2;
  uint64_t v4 = (uint64_t)v86;
LABEL_48:
  swift_willThrow();
LABEL_49:
  if (v5) {
    return swift_bridgeObjectRelease();
  }
  LiteMessage.init(header:content:)(v3, v2, v4, (long long *)&associatedMessageGUID._object, (uint64_t)v77);
  protocol witness for BitPackable.append(to:) in conformance LiteMessage((uint64_t)&v78);
  outlined destroy of LiteMessage((uint64_t)v77);
  return v78;
}

uint64_t outlined destroy of LiteMessage(uint64_t a1)
{
  return a1;
}

uint64_t outlined copy of LiteMessageEncodingError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for LiteMessageEncodingError(uint64_t a1)
{
  return outlined consume of LiteMessageEncodingError(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t outlined consume of LiteMessageEncodingError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LiteMessageEncodingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of LiteMessageEncodingError(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LiteMessageEncodingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of LiteMessageEncodingError(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of LiteMessageEncodingError(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for LiteMessageEncodingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of LiteMessageEncodingError(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for LiteMessageEncodingError()
{
  return &type metadata for LiteMessageEncodingError;
}

unint64_t lazy protocol witness table accessor for type LiteMessageEncodingError and conformance LiteMessageEncodingError()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageEncodingError and conformance LiteMessageEncodingError;
  if (!lazy protocol witness table cache variable for type LiteMessageEncodingError and conformance LiteMessageEncodingError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageEncodingError and conformance LiteMessageEncodingError);
  }
  return result;
}

uint64_t sub_35564()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_355A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t LiteTextMessageContent.text.getter(uint64_t a1)
{
  return a1;
}

uint64_t LiteTextMessageContent.effect.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

void LiteTextMessageContent.append(to:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  v5._uint64_t countAndFlagsBits = a2;
  String.liteEscapedText.getter();
  BitCollection.appendAsCompressedBytes(_:)(v5);
  if (v6)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (a4 != 13)
    {
      uint64_t v7 = LiteMessageEffect.rawValue.getter(a4);
      if (v7 < 0)
      {
        __break(1u);
      }
      else
      {
        unint64_t v8 = v7;
        do
        {
          if (v8 >= 8) {
            Swift::UInt8 v9 = v8 & 7 | 8;
          }
          else {
            Swift::UInt8 v9 = v8 & 7;
          }
          BitCollection.appendLeastSignificantBits(from:count:)(v9, 4u);
          BOOL v10 = v8 > 7;
          v8 >>= 3;
        }
        while (v10);
      }
    }
  }
}

void protocol witness for BitPackable.append(to:) in conformance LiteTextMessageContent(uint64_t a1)
{
  LiteTextMessageContent.append(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

uint64_t LiteReplyMessageContent.effect.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

void LiteReplyMessageContent.append(to:)()
{
  v1._uint64_t countAndFlagsBits = *(void *)v0;
  String.liteEscapedText.getter();
  BitCollection.appendAsCompressedBytes(_:)(v1);
  if (v2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    BitCollection.append16UUIDBytes(_:)(*(Swift::String *)(v0 + 16));
    if (!v3)
    {
      int v4 = *(unsigned __int8 *)(v0 + 32);
      if (v4 != 13)
      {
        uint64_t v5 = LiteMessageEffect.rawValue.getter(v4);
        if (v5 < 0)
        {
          __break(1u);
        }
        else
        {
          unint64_t v6 = v5;
          do
          {
            if (v6 >= 8) {
              Swift::UInt8 v7 = v6 & 7 | 8;
            }
            else {
              Swift::UInt8 v7 = v6 & 7;
            }
            BitCollection.appendLeastSignificantBits(from:count:)(v7, 4u);
            BOOL v8 = v6 > 7;
            v6 >>= 3;
          }
          while (v8);
        }
      }
    }
  }
}

void __swiftcall LiteReplyMessageContent.init(text:threadOriginatorGUID:effect:)(iMessageLite::LiteReplyMessageContent *__return_ptr retstr, Swift::String text, Swift::String threadOriginatorGUID, iMessageLite::LiteMessageEffect_optional effect)
{
  retstr->text = text;
  retstr->Swift::String threadOriginatorGUID = threadOriginatorGUID;
  retstr->effect = effect;
}

void protocol witness for BitPackable.append(to:) in conformance LiteReplyMessageContent()
{
}

uint64_t LiteAcknowledgmentMessageContent.associatedMessageType.getter()
{
  return *v0;
}

uint64_t LiteAcknowledgmentMessageContent.associatedMessageGUID.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LiteAcknowledgmentMessageContent.emoji.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void LiteAcknowledgmentMessageContent.append(to:)()
{
  char v1 = *v0;
  unint64_t v2 = IMMessageItem.IMMessageItemContentType.rawValue.getter(*v0);
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v2 > 0xFF)
  {
LABEL_11:
    __break(1u);
    return;
  }
  BitCollection.appendLeastSignificantBits(from:count:)(v2, 4u);
  BitCollection.append16UUIDBytes(_:)(*(Swift::String *)(v0 + 8));
  if (!v3)
  {
    char v11 = v1;
    char v10 = 6;
    lazy protocol witness table accessor for type LiteMessageAcknowledgement and conformance LiteMessageAcknowledgement();
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v7 == v6)
    {
      outlined init with take of String?((uint64_t)(v0 + 24), (uint64_t)v8);
      outlined init with take of String?((uint64_t)v8, (uint64_t)&v9);
      object = v9._object;
      if (v9._object)
      {
        uint64_t countAndFlagsBits = v9._countAndFlagsBits;
        BitCollection.appendAsVarint8PrefixedUTF8Bytes(_:)(*(Swift::String *)(&object - 1));
      }
      else
      {
        lazy protocol witness table accessor for type LiteMessageContentError and conformance LiteMessageContentError();
        swift_allocError();
        swift_willThrow();
      }
    }
    else
    {
      char v11 = v1;
      char v10 = 13;
      dispatch thunk of RawRepresentable.rawValue.getter();
      dispatch thunk of RawRepresentable.rawValue.getter();
    }
  }
}

uint64_t outlined init with take of String?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type LiteMessageContentError and conformance LiteMessageContentError()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageContentError and conformance LiteMessageContentError;
  if (!lazy protocol witness table cache variable for type LiteMessageContentError and conformance LiteMessageContentError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageContentError and conformance LiteMessageContentError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LiteMessageContentError and conformance LiteMessageContentError;
  if (!lazy protocol witness table cache variable for type LiteMessageContentError and conformance LiteMessageContentError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageContentError and conformance LiteMessageContentError);
  }
  return result;
}

void __swiftcall LiteAcknowledgmentMessageContent.init(associatedMessageType:associatedMessageGUID:emoji:)(iMessageLite::LiteAcknowledgmentMessageContent *__return_ptr retstr, iMessageLite::LiteMessageAcknowledgement associatedMessageType, Swift::String associatedMessageGUID, Swift::String_optional emoji)
{
  retstr->associatedMessageType = associatedMessageType;
  retstr->Swift::String associatedMessageGUID = associatedMessageGUID;
  retstr->emojuint64_t i = emoji;
}

void protocol witness for BitPackable.append(to:) in conformance LiteAcknowledgmentMessageContent()
{
}

uint64_t LiteMultipackMessageContent.append(to:)(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    char v11 = (void (*)(uint64_t))protocol witness for BitPackable.append(to:) in conformance LiteMessage;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    while (1)
    {
      long long v9 = xmmword_476E0;
      unsigned __int8 v10 = 0;
      v11((uint64_t)&v9);
      long long v5 = v9;
      if (v2)
      {
        outlined consume of Data._Representation(v9, *((unint64_t *)&v9 + 1));
        return swift_bridgeObjectRelease();
      }
      unsigned __int8 v6 = v10;
      unint64_t result = BitCollection.endIndex.getter(v9, *((unint64_t *)&v9 + 1), v10);
      if (result < 0) {
        break;
      }
      unint64_t v7 = result;
      ++v4;
      do
      {
        BitCollection.appendLeastSignificantBits(from:count:)(v7 & 0x7F | ((v7 > 0x7F) << 7), 8u);
        BOOL v8 = v7 > 0x7F;
        v7 >>= 7;
      }
      while (v8);
      BitCollection.append(_:)(v5, *((unint64_t *)&v5 + 1), v6);
      outlined consume of Data._Representation(v5, *((unint64_t *)&v5 + 1));
      if (v4 == v3) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for BitPackable.append(to:) in conformance LiteMultipackMessageContent(uint64_t a1)
{
  return LiteMultipackMessageContent.append(to:)(a1, *v1);
}

unsigned char *storeEnumTagSinglePayload for LiteMessageContentError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x35D48);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageContentError()
{
  return &type metadata for LiteMessageContentError;
}

uint64_t destroy for LiteTextMessageContent()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for LiteTextMessageContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LiteTextMessageContent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for LiteTextMessageContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteTextMessageContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteTextMessageContent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteTextMessageContent()
{
  return &type metadata for LiteTextMessageContent;
}

uint64_t destroy for LiteReplyMessageContent()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LiteReplyMessageContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LiteReplyMessageContent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LiteReplyMessageContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteReplyMessageContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteReplyMessageContent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteReplyMessageContent()
{
  return &type metadata for LiteReplyMessageContent;
}

uint64_t destroy for LiteAcknowledgmentMessageContent()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LiteAcknowledgmentMessageContent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LiteAcknowledgmentMessageContent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
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

uint64_t assignWithTake for LiteAcknowledgmentMessageContent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteAcknowledgmentMessageContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteAcknowledgmentMessageContent(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteAcknowledgmentMessageContent()
{
  return &type metadata for LiteAcknowledgmentMessageContent;
}

ValueMetadata *type metadata accessor for LiteMultipackMessageContent()
{
  return &type metadata for LiteMultipackMessageContent;
}

uint64_t LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 400) = a4;
  *(void *)(v5 + 200) = a3;
  *(void *)(v5 + 208) = v4;
  *(void *)(v5 + 184) = a1;
  *(void *)(v5 + 192) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  *(void *)(v5 + 216) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  *(void *)(v5 + 224) = v6;
  *(void *)(v5 + 232) = *(void *)(v6 - 8);
  *(void *)(v5 + 240) = swift_task_alloc();
  *(void *)(v5 + 248) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v5 + 256) = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v5 + 264) = v8;
  *(void *)(v5 + 272) = v7;
  return _swift_task_switch(LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:), v8, v7);
}

uint64_t LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:)()
{
  uint64_t v86 = v0;
  char v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 400);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 chatForChatIdentifier:v3 style:v2];
  *(void *)(v0 + 280) = v4;

  if (v4)
  {
    if ([v4 style] == 45)
    {
      uint64_t v5 = (void **)(v0 + 184);
      IMMessageItem.canSendAsLiteMessage.getter();
      if (v6)
      {
        IMDChat.participantURI.getter();
        *(void *)(v0 + 288) = v7;
        if (v7)
        {
          uint64_t v8 = v7;
          IMDChat.bestSendingHandle.getter();
          if (!v9)
          {
            id v18 = [*(id *)(v0 + 208) account];
            id v19 = [v18 loginID];

            if (!v19)
            {
LABEL_21:
              swift_release();
              lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
              swift_allocError();
              *(_OWORD *)uint64_t v25 = xmmword_476F0;
              *(_WORD *)(v25 + 16) = 512;
              swift_willThrow();

              goto LABEL_12;
            }
            static String._unconditionallyBridgeFromObjectiveC(_:)();
          }
          id v20 = objc_allocWithZone((Class)IDSURI);
          NSString v21 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v22 = [v20 initWithUnprefixedURI:v21];
          *(void *)(v0 + 296) = v22;

          if (v22)
          {
            uint64_t v23 = IMMessageItem.liteData.getter();
            *(void *)(v0 + 304) = v23;
            *(void *)(v0 + 312) = v24;
            uint64_t v26 = v23;
            unint64_t v27 = v24;
            id v28 = *v5;
            v29.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
            v85[0] = 0x2D6574696CLL;
            v85[1] = 0xE500000000000000;
            id v30 = [v28 guid];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v78 = *(void *)(v0 + 232);
              os_log_t loga = *(os_log_t *)(v0 + 248);
              uint64_t v82 = *(void *)(v0 + 224);
              iMessageLite::LiteReplyMessageContent v84 = *(void **)(v0 + 184);
              uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v34 = v33;

              v35._uint64_t countAndFlagsBits = v32;
              v35._object = v34;
              String.append(_:)(v35);
              swift_bridgeObjectRelease();
              id v36 = self;
              v37._uint64_t countAndFlagsBits = 0x617461642ELL;
              v37._object = (void *)0xE500000000000000;
              String.append(_:)(v37);
              NSString v38 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
              [v36 writeDataPayloadToDisk:v29.super.isa fileName:v38];

              id v39 = objc_allocWithZone((Class)IDSOffGridMessage);
              outlined copy of Data._Representation(v26, v27);
              id v40 = v22;
              id v41 = v8;
              Class isa = Data._bridgeToObjectiveC()().super.isa;
              id v77 = [v39 initWithMessage:isa senderURI:v40 recipientURI:v41];
              *(void *)(v0 + 320) = v77;

              outlined consume of Data._Representation(v26, v27);
              uint64_t v43 = Logger.liteSession.unsafeMutableAddressor();
              *(void *)(v0 + 328) = v43;
              id v44 = *(void (**)(os_log_t, uint64_t, uint64_t))(v78 + 16);
              *(void *)(v0 + 336) = v44;
              *(void *)(v0 + 344) = (v78 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
              v44(loga, v43, v82);
              id v45 = v40;
              id v46 = v41;
              id v47 = v84;
              id v48 = v45;
              id v49 = v46;
              id v50 = v47;
              uint64_t v51 = Logger.logObject.getter();
              os_log_type_t v52 = static os_log_type_t.default.getter();
              if (!os_log_type_enabled(v51, v52))
              {
                uint64_t v64 = *(void *)(v0 + 248);
                uint64_t v65 = *(void *)(v0 + 224);
                uint64_t v66 = *(void *)(v0 + 232);
                uint64_t v67 = *(void **)(v0 + 184);

                id v63 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
                v63(v64, v65);
LABEL_27:
                *(void *)(v0 + 352) = v63;
                id v68 = LiteMessageServiceSession.offGridMessenger.getter();
                *(void *)(v0 + 360) = v68;
                *(void *)(v0 + 16) = v0;
                *(void *)(v0 + 56) = v0 + 120;
                *(void *)(v0 + 24) = LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:);
                uint64_t v69 = swift_continuation_init();
                *(void *)(v0 + 80) = _NSConcreteStackBlock;
                *(void *)(v0 + 88) = 0x40000000;
                *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IDSOffGridMessage, String);
                *(void *)(v0 + 104) = &block_descriptor_6;
                *(void *)(v0 + 112) = v69;
                [v68 encryptOffGridMessage:v77 completion:v0 + 80];
                uint64_t v70 = v0 + 16;
                return _swift_continuation_await(v70);
              }
              os_log_type_t v75 = v52;
              uint64_t v81 = v48;
              iMessageLite::LiteMessageAcknowledgement v83 = v49;
              log = v51;
              uint64_t v53 = *v5;
              uint64_t v54 = swift_slowAlloc();
              id v76 = (void *)swift_slowAlloc();
              v85[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v54 = 136315650;
              id v55 = [v53 guid];
              if (v55)
              {
                id v56 = v55;
                uint64_t v72 = *(void *)(v0 + 232);
                uint64_t v73 = *(void *)(v0 + 224);
                uint64_t v74 = *(void *)(v0 + 248);
                uint64_t v57 = *(void **)(v0 + 184);
                uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v60 = v59;

                *(void *)(v0 + 160) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v60, v85);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();

                *(_WORD *)(v54 + 12) = 2112;
                *(void *)(v0 + 168) = v81;
                id v61 = v81;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                *id v76 = v22;

                *(_WORD *)(v54 + 22) = 2112;
                *(void *)(v0 + 176) = v49;
                id v62 = v49;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                v76[1] = v8;

                _os_log_impl(&def_3494C, log, v75, "Encrypting message %s (senderURI: %@, recipientURI: %@", (uint8_t *)v54, 0x20u);
                __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                id v63 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
                v63(v74, v73);
                goto LABEL_27;
              }
            }
            else
            {
              __break(1u);
            }
            long long v71 = *v5;

            __break(1u);
            return _swift_continuation_await(v70);
          }
          goto LABEL_21;
        }
        swift_release();
        lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
        swift_allocError();
        *(void *)uint64_t v14 = 0;
        *(void *)(v14 + 8) = 0;
LABEL_11:
        *(_WORD *)(v14 + 16) = 512;
        swift_willThrow();
LABEL_12:

        goto LABEL_13;
      }
      swift_release();
      lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
      swift_allocError();
      long long v15 = xmmword_479A0;
    }
    else
    {
      swift_release();
      lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
      swift_allocError();
      long long v15 = xmmword_47990;
    }
    *(_OWORD *)uint64_t v14 = v15;
    goto LABEL_11;
  }
  char v10 = *(unsigned char *)(v0 + 400);
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v11 = *(void *)(v0 + 200);
  swift_release();
  lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
  swift_allocError();
  *(void *)uint64_t v13 = v12;
  *(void *)(v13 + 8) = v11;
  *(unsigned char *)(v13 + 16) = v10;
  *(unsigned char *)(v13 + 17) = 0;
  swift_bridgeObjectRetain();
  swift_willThrow();
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  char v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 368) = v2;
  NSString v3 = *(void *)(v1 + 272);
  id v4 = *(void *)(v1 + 264);
  if (v2) {
    uint64_t v5 = LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  NSString v3 = *(void *)(v2 + 272);
  id v4 = *(void *)(v2 + 264);
  if (v0) {
    uint64_t v5 = LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:);
  }
  else {
    uint64_t v5 = LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  void *v0;
  void *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  char v1 = (void *)v0[45];
  uint64_t v2 = v0[39];
  NSString v3 = (void *)v0[40];
  uint64_t v5 = (void *)v0[37];
  id v4 = v0[38];
  uint64_t v7 = (void *)v0[35];
  char v6 = (void *)v0[36];
  swift_release();
  swift_willThrow();
  outlined consume of Data._Representation(v4, v2);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

{
  void *v0;
  void *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  char v1 = (void *)v0[47];
  uint64_t v2 = v0[39];
  NSString v3 = (void *)v0[40];
  uint64_t v5 = (void *)v0[37];
  id v4 = v0[38];
  uint64_t v7 = (void *)v0[35];
  char v6 = (void *)v0[36];
  swift_release();

  outlined consume of Data._Representation(v4, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

void LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:)()
{
  id v68 = v0;
  char v1 = (void *)v0[45];
  uint64_t v2 = v0[27];
  id v4 = (void *)v0[15];
  uint64_t v3 = v0[16];
  v0[47] = v4;
  uint64_t v5 = v0[17];

  UUID.init(uuidString:)();
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v2, 1, v6) == 1)
  {
    unint64_t v8 = v0[39];
    uint64_t v9 = (void *)v0[40];
    uint64_t v11 = (void *)v0[37];
    uint64_t v10 = v0[38];
    uint64_t v12 = (void *)v0[36];
    uint64_t v65 = (void *)v0[35];
    uint64_t v13 = v0[27];
    swift_release();
    outlined destroy of UUID?(v13);
    lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
    swift_allocError();
    *(void *)uint64_t v14 = v3;
    *(void *)(v14 + 8) = v5;
    *(_WORD *)(v14 + 16) = 256;
    swift_willThrow();

    outlined consume of Data._Representation(v10, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v15 = (void (*)(void))v0[1];
    v15();
  }
  else
  {
    uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t))v0[42];
    uint64_t v64 = (uint64_t)v4;
    uint64_t v17 = v0[41];
    uint64_t v18 = v0[30];
    uint64_t v20 = v0[27];
    uint64_t v19 = v0[28];
    NSString v21 = (void *)v0[23];
    swift_bridgeObjectRelease();
    uint64_t v63 = UUID.uuidString.getter();
    unint64_t v23 = v22;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v20, v6);
    uint64_t v24 = v19;
    unint64_t v25 = v23;
    v16(v18, v17, v24);
    id v26 = v21;
    swift_bridgeObjectRetain_n();
    id v27 = v26;
    id v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    id v30 = &selRef_currentHandler;
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v66 = v25;
      uint64_t v31 = (void *)v0[23];
      uint64_t v32 = swift_slowAlloc();
      v67[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315394;
      id v33 = [v31 guid];
      if (!v33)
      {
        uint64_t v58 = (void *)v0[23];
        swift_bridgeObjectRelease();

        __break(1u);
        return;
      }
      uint64_t v34 = v33;
      uint64_t v61 = v0[30];
      id v62 = (void (*)(uint64_t, uint64_t))v0[44];
      uint64_t v59 = v0[29];
      uint64_t v60 = v0[28];
      Swift::String v35 = (void *)v0[23];
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v38 = v37;

      v0[18] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v38, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v32 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[19] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v66, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v28, v29, "Reassigning %s to %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v62(v61, v60);
      id v30 = &selRef_currentHandler;
    }
    else
    {
      id v39 = (void (*)(uint64_t, uint64_t))v0[44];
      uint64_t v40 = v0[30];
      uint64_t v41 = v0[28];
      char v42 = (void *)v0[23];

      swift_bridgeObjectRelease_n();
      v39(v40, v41);
    }
    uint64_t v43 = (void *)v0[37];
    id v44 = (void *)v0[23];
    LiteMessageServiceSession.removePreviousServiceOriginal(of:)(v44);
    id v45 = [v44 v30[55]];
    [v44 setFallbackHash:v45];

    NSString v46 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v44 setGuid:v46];

    NSString v47 = [v43 unprefixedURI];
    if (!v47)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v47 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    id v48 = (void *)v0[37];
    id v49 = (void *)v0[23];
    objc_msgSend(v49, "setDestinationCallerID:", v47, v59, v60, v61, v62);

    [v49 setErrorCode:0];
    [v49 setIsPendingSatelliteSend:0];
    id v50 = [v48 unprefixedURI];
    uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v53 = v52;

    v54._uint64_t countAndFlagsBits = v51;
    v54._object = v53;
    IMDChat.updateLastAddressedHandleWithMatchingSIM(to:)(v54);
    swift_bridgeObjectRelease();
    id v55 = (void *)swift_task_alloc();
    v0[48] = v55;
    *id v55 = v0;
    v55[1] = LiteMessageServiceSession.encryptAndSendMessageItem(_:chatIdentifier:chatStyle:);
    uint64_t v56 = v0[35];
    uint64_t v57 = v0[23];
    LiteMessageServiceSession.sendEncryptedMessage(_:to:item:)(v64, v56, v57);
  }
}

{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSString v9;
  NSString v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (*v21)(void);
  uint64_t v22;

  char v1 = *(void **)(v0 + 184);
  swift_release();
  uint64_t v2 = [v1 fallbackHash];
  if (v2)
  {
    uint64_t v3 = v2;
    if ([*(id *)(v0 + 184) isSatelliteMessageRetry])
    {
      id v4 = [self sharedInstance];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = [v4 anySessionForServiceName:IMServiceNameiMessage];

        if (v6)
        {
          uint64_t v7 = [*(id *)(v0 + 184) guid];
          if (v7)
          {
            unint64_t v8 = v7;
            uint64_t v9 = [*(id *)(v0 + 296) prefixedURI];
            if (!v9)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v9 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            uint64_t v10 = [*(id *)(v0 + 288) prefixedURI];
            if (!v10)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v10 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            uint64_t v12 = *(void *)(v0 + 304);
            uint64_t v11 = *(void *)(v0 + 312);
            [v6 sendCrossServiceAssociationMessageWithReplacementGUID:v8 messageGUID:v3 callerID:v9 toID:v10];
            outlined consume of Data._Representation(v12, v11);

            goto LABEL_14;
          }
LABEL_19:

          __break(1u);
          return;
        }
      }
      else
      {

        __break(1u);
      }

      __break(1u);
      goto LABEL_19;
    }
    uint64_t v16 = *(void *)(v0 + 304);
    long long v15 = *(void *)(v0 + 312);

    uint64_t v13 = v16;
    uint64_t v14 = v15;
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 304);
    uint64_t v14 = *(void *)(v0 + 312);
  }
  outlined consume of Data._Representation(v13, v14);
LABEL_14:
  uint64_t v17 = *(void **)(v0 + 376);
  uint64_t v18 = *(void **)(v0 + 320);
  uint64_t v19 = *(void **)(v0 + 288);
  uint64_t v20 = *(void **)(v0 + 280);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  NSString v21 = *(void (**)(void))(v0 + 8);
  v21();
}

unint64_t lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageSendError and conformance LiteMessageSendError;
  if (!lazy protocol witness table cache variable for type LiteMessageSendError and conformance LiteMessageSendError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageSendError and conformance LiteMessageSendError);
  }
  return result;
}

void LiteMessageServiceSession.removePreviousServiceOriginal(of:)(void *a1)
{
  uint64_t v64 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v64 - 8);
  uint64_t v4 = __chkstk_darwin(v64);
  uint64_t v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v61 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v61 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v61 - v13;
  id v15 = [a1 guid];
  if (!v15) {
    return;
  }
  uint64_t v16 = v15;
  uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;
  id v61 = self;
  id v19 = [v61 sharedInstance];
  id v20 = [v19 itemWithGUID:v16];

  if (v20)
  {
    uint64_t v62 = v3;
    id v21 = v20;
    id v22 = [v20 service];
    if (v22)
    {
      unint64_t v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v26 = v25;
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v26 = 0;
    }
    id v32 = [v1 service];
    id v33 = [v32 internalName];

    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v36 = v35;

    if (v26)
    {
      if (v24 == v34 && v26 == v36)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v37 = v21;
LABEL_16:
        uint64_t v39 = Logger.liteSession.unsafeMutableAddressor();
        uint64_t v40 = v62;
        uint64_t v41 = v64;
        (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v9, v39, v64);
        swift_bridgeObjectRetain();
        char v42 = Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v42, v43))
        {
          id v44 = (uint8_t *)swift_slowAlloc();
          uint64_t v66 = swift_slowAlloc();
          id v61 = v37;
          *(_DWORD *)id v44 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v65 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v18, &v66);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&def_3494C, v42, v43, "Existing item for %s is already iMessage Lite", v44, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v41);
        return;
      }
      char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v37 = v21;
      if (v38) {
        goto LABEL_16;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v37 = v21;
    }
    unsigned int v45 = [v37 isFromMe];
    uint64_t v46 = Logger.liteSession.unsafeMutableAddressor();
    NSString v47 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 16);
    if (v45)
    {
      uint64_t v48 = v64;
      v47(v14, v46, v64);
      swift_bridgeObjectRetain_n();
      id v49 = Logger.logObject.getter();
      os_log_type_t v50 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        *(_DWORD *)uint64_t v51 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v52 = v63;
        uint64_t v65 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v18, &v66);
        unint64_t v37 = v21;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_3494C, v49, v50, "Removing previous service record for %s", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v62 + 8))(v14, v64);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v62 + 8))(v14, v48);
        uint64_t v52 = v63;
      }
      id v57 = [v61 sharedInstance];
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = xmmword_46FB0;
      *(void *)(v58 + 56) = &type metadata for String;
      *(void *)(v58 + 32) = v52;
      *(void *)(v58 + 40) = v18;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v60 = [v57 deleteMessageGUIDs:isa];
    }
    else
    {
      uint64_t v53 = v64;
      v47(v12, v46, v64);
      swift_bridgeObjectRetain();
      Swift::String v54 = Logger.logObject.getter();
      os_log_type_t v55 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        *(_DWORD *)uint64_t v56 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v65 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v18, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&def_3494C, v54, v55, "Existing item for %s is not from me", v56, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v62 + 8))(v12, v53);
    }
  }
  else
  {
    uint64_t v27 = Logger.liteSession.unsafeMutableAddressor();
    uint64_t v28 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v27, v64);
    swift_bridgeObjectRetain();
    os_log_type_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v65 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v18, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&def_3494C, v29, v30, "No existing item found for %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v28);
  }
}

uint64_t LiteMessageServiceSession.sendEncryptedMessage(_:to:item:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[13] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[14] = v7;
  v4[15] = v6;
  return _swift_task_switch(LiteMessageServiceSession.sendEncryptedMessage(_:to:item:), v7, v6);
}

void LiteMessageServiceSession.sendEncryptedMessage(_:to:item:)()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void **)(v0 + 64);
  uint64_t v5 = *(void **)(v0 + 48);
  unsigned __int8 v6 = LiteMessageServiceSession.isSatelliteConnectionActive.getter();
  *(unsigned char *)(v0 + 156) = v6 & 1;
  uint64_t v7 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  id v8 = v4;
  id v9 = v5;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v12, v13))
  {
    uint64_t v28 = *(void *)(v0 + 88);
    uint64_t v27 = *(void *)(v0 + 96);
    uint64_t v29 = *(void *)(v0 + 80);
    os_log_type_t v30 = *(void **)(v0 + 64);
    uint64_t v31 = *(void **)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  os_log_type_t v46 = v13;
  log = v12;
  uint64_t v14 = *(void **)(v0 + 64);
  uint64_t v15 = swift_slowAlloc();
  uint64_t v48 = swift_slowAlloc();
  *(_DWORD *)uint64_t v15 = 136315650;
  id v16 = [v14 guid];
  if (!v16)
  {
LABEL_12:
    uint64_t v41 = *(void **)(v0 + 64);

    __break(1u);
    return;
  }
  unint64_t v17 = v16;
  uint64_t v43 = *(void *)(v0 + 88);
  uint64_t v44 = *(void *)(v0 + 80);
  uint64_t v45 = *(void *)(v0 + 96);
  unint64_t v18 = *(void **)(v0 + 64);
  id v42 = *(id *)(v0 + 48);
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  *(void *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v48);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();

  *(_WORD *)(v15 + 12) = 2080;
  id v22 = [v42 recipientURI];
  id v23 = [v22 unprefixedURI];

  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v26 = v25;

  *(void *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v26, &v48);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();

  *(_WORD *)(v15 + 22) = 1024;
  *(_DWORD *)(v0 + 152) = v6 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  _os_log_impl(&def_3494C, log, v46, "Sending message %s to %s (via satellite: %{BOOL}d)", (uint8_t *)v15, 0x1Cu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
  if (v6) {
LABEL_6:
  }
    objc_msgSend(*(id *)(v0 + 64), "setFlags:", (unint64_t)objc_msgSend(*(id *)(v0 + 64), "flags", v42) | 0x80000000000);
LABEL_7:
  id v32 = *(void **)(v0 + 56);
  id v33 = objc_msgSend(v32, "style", v42);
  id v34 = [v32 chatIdentifier];
  if (!v34)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)(v0 + 64);
  unint64_t v37 = *(void **)(v0 + 48);
  *(void *)(v0 + 16) = *(void *)(v0 + 72);
  *(void *)(v0 + 24) = LiteMessageServiceSession;
  objc_msgSendSuper2((objc_super *)(v0 + 16), "sendMessage:toChat:style:", v36, v34, v33);

  id v38 = specialized LiteMessageServiceSession.sendableMessageSegments(of:)(v37);
  *(void *)(v0 + 128) = v38;
  uint64_t v39 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v39;
  *uint64_t v39 = v0;
  v39[1] = LiteMessageServiceSession.sendEncryptedMessage(_:to:item:);
  uint64_t v40 = *(void *)(v0 + 64);
  specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:)((uint64_t)v38, v40, v6 & 1);
}

uint64_t LiteMessageServiceSession.sendEncryptedMessage(_:to:item:)()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 112);
    uint64_t v4 = *(void *)(v2 + 120);
    uint64_t v5 = LiteMessageServiceSession.sendEncryptedMessage(_:to:item:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 112);
    uint64_t v4 = *(void *)(v2 + 120);
    uint64_t v5 = LiteMessageServiceSession.sendEncryptedMessage(_:to:item:);
  }
  return _swift_task_switch(v5, v3, v4);
}

{
  uint64_t v0;
  id v1;
  unsigned int v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  swift_release();
  uint64_t v1 = [self sharedFeatureFlags];
  uint64_t v2 = [v1 isIMLLegacyRelayEnabled];

  if (v2) {
    LiteMessageServiceSession.relayMessage(item:to:viaSatellite:)(*(void *)(v0 + 64), *(void **)(v0 + 56), *(unsigned char *)(v0 + 156));
  }
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void LiteMessageServiceSession.relayMessage(item:to:viaSatellite:)(uint64_t a1, void *a2, char a3)
{
  if (a3)
  {
    [v3 markItemForOnGridRelay:a1];
    return;
  }
  id v6 = [self sharedInstance];
  if (!v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  id v8 = [v6 anySessionForServiceName:IMServiceNameiMessage];

  if (!v8) {
    return;
  }
  id v11 = v8;
  id v9 = [a2 chatIdentifier];
  if (!v9)
  {
LABEL_13:
    __break(1u);
    return;
  }
  id v10 = v9;
  [v11 relayLegacySatelliteMessage:a1 toChat:v9];
}

void LiteMessageServiceSession.sendMessageSentMetric(for:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v41[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = &v41[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  id v11 = &v41[-v10];
  id v12 = [a1 handle];
  IMStringIsPhoneNumber();

  LiteMessageServiceSession.isSatelliteConnectionActive.getter();
  v13.super.super.Class isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  Date.init()();
  id v14 = [a1 time];
  if (!v14) {
    goto LABEL_11;
  }
  uint64_t v15 = v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v4, v9, v5);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  Date.timeIntervalSince(_:)();
  double v17 = v16;
  unint64_t v18 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v6 += 8;
  v18(v11, v5);
  v18(v4, v5);
  if ((~*(void *)&v17 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_479B0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v20;
  [a1 errorCode];
  Class isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  uint64_t v22 = type metadata accessor for IMDHandle(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  *(void *)(inited + 72) = v22;
  *(void *)(inited + 48) = isa;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v23;
  [a1 errorCode];
  v24.super.super.Class isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  *(void *)(inited + 120) = v22;
  *(NSNumber *)(inited + 96) = v24;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v25;
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = 0;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v26;
  *(void *)(inited + 216) = &type metadata for Int;
  *(void *)(inited + 192) = 0;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v27;
  v28.super.super.Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  *(void *)(inited + 264) = v22;
  *(NSNumber *)(inited + 240) = v28;
  *(void *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 280) = v29;
  v30.super.super.Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  *(void *)(inited + 312) = v22;
  *(NSNumber *)(inited + 288) = v30;
  *(void *)(inited + 320) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 328) = v31;
  *(void *)(inited + 360) = &type metadata for Int;
  *(void *)(inited + 336) = 0;
  *(void *)(inited + 368) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 376) = v32;
  v33.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  *(void *)(inited + 408) = v22;
  *(NSNumber *)(inited + 384) = v33;
  *(void *)(inited + 416) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 424) = v34;
  *(void *)(inited + 456) = v22;
  *(NSNumber *)(inited + 432) = v13;
  uint64_t v35 = v13.super.super.isa;
  unint64_t v36 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v37 = [self sharedInstance];
  if (v37)
  {
    id v38 = v37;
    id v39 = IMMetricsCollectorEventIMessageSentMessageSingleComponent;
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v36);
    swift_bridgeObjectRelease();
    Class v40 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v38 trackEvent:v39 withDictionary:v40];

    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    double v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Any(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    outlined init with take of Any(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    outlined init with take of Any(v36, v37);
    outlined init with take of Any(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)outlined init with take of Any(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    outlined consume of [IDSURI : NSNumber].Iterator._Variant();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id specialized LiteMessageServiceSession.sendableMessageSegments(of:)(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v7 = result;
    unsigned __int8 v8 = [result isInternalInstall];

    if ((v8 & 1) != 0
      && (NSString v9 = String._bridgeToObjectiveC()(),
          NSString v10 = String._bridgeToObjectiveC()(),
          char v11 = IMGetDomainBoolForKey(),
          v10,
          v9,
          (v11 & 1) != 0))
    {
      uint64_t v12 = Logger.liteSession.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v12, v2);
      int64_t v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        int64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v15 = 0;
        _os_log_impl(&def_3494C, v13, v14, "Message splitting is disabled, will send as single encrypted message", v15, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else if ([a1 respondsToSelector:"splitMessageIntoMessagesThatFit"])
    {
      id v16 = [a1 splitMessageIntoMessagesThatFit];
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSOffGridEncryptedMessage);
      uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      return (id)v17;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_47480;
    *(void *)(v18 + 32) = a1;
    uint64_t v21 = v18;
    specialized Array._endMutation()();
    uint64_t v17 = v21;
    id v19 = a1;
    return (id)v17;
  }
  __break(1u);
  return result;
}

uint64_t specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 176) = a2;
  *(void *)(v4 + 184) = v3;
  *(unsigned char *)(v4 + 344) = a3;
  *(void *)(v4 + 168) = a1;
  uint64_t v5 = type metadata accessor for Logger();
  *(void *)(v4 + 192) = v5;
  *(void *)(v4 + 200) = *(void *)(v5 - 8);
  *(void *)(v4 + 208) = swift_task_alloc();
  *(void *)(v4 + 216) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v4 + 224) = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v4 + 232) = v7;
  *(void *)(v4 + 240) = v6;
  return _swift_task_switch(specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:), v7, v6);
}

uint64_t specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:)()
{
  uint64_t v49 = v0;
  unint64_t v1 = *(void *)(v0 + 168);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 248) = v41;
    if (v41)
    {
LABEL_3:
      uint64_t v3 = *(void *)(v0 + 216);
      uint64_t v4 = *(void *)(v0 + 192);
      uint64_t v5 = *(void *)(v0 + 200);
      uint64_t v6 = *(void **)(v0 + 176);
      uint64_t v7 = Logger.liteSession.unsafeMutableAddressor();
      *(void *)(v0 + 256) = v7;
      unsigned __int8 v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
      *(void *)(v0 + 264) = v8;
      *(void *)(v0 + 272) = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v8(v3, v7, v4);
      swift_bridgeObjectRetain_n();
      id v9 = v6;
      NSString v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v45 = v10;
        uint64_t v12 = *(void **)(v0 + 176);
        uint64_t v13 = swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315394;
        id v14 = [v12 guid];
        os_log_type_t v46 = *(void **)(v0 + 176);
        if (!v14)
        {
          swift_bridgeObjectRelease();

          __break(1u);
          return _swift_continuation_await(v40);
        }
        int64_t v15 = v14;
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v18 = v17;

        *(void *)(v0 + 152) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v48);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        *(_WORD *)(v13 + 12) = 2048;
        if (v1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v19 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
        }
        uint64_t v47 = *(void *)(v0 + 216);
        uint64_t v27 = *(void *)(v0 + 192);
        uint64_t v28 = *(void *)(v0 + 200);
        swift_bridgeObjectRelease();
        *(void *)(v0 + 160) = v19;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&def_3494C, v45, v11, "Sending %s using %ld message part(s)", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        long long v29 = *(void (**)(void, void))(v28 + 8);
        uint64_t v25 = v28 + 8;
        unint64_t v24 = v29;
        v29(v47, v27);
      }
      else
      {
        uint64_t v20 = *(void *)(v0 + 216);
        uint64_t v21 = *(void *)(v0 + 192);
        uint64_t v22 = *(void *)(v0 + 200);
        char v23 = *(void **)(v0 + 176);
        swift_bridgeObjectRelease_n();

        uint64_t v26 = *(void (**)(void, void))(v22 + 8);
        uint64_t v25 = v22 + 8;
        unint64_t v24 = v26;
        v26(v20, v21);
      }
      *(void *)(v0 + 280) = v25;
      *(void *)(v0 + 288) = v24;
      int v30 = *(unsigned __int8 *)(v0 + 344);
      id v31 = [objc_allocWithZone((Class)IDSOffGridDeliveryOptions) init];
      uint64_t v32 = v31;
      *(void *)(v0 + 296) = v31;
      if (v30) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 1;
      }
      [v31 setTransportType:v33];
      [v32 setCommand:100];
      *(void *)(v0 + 304) = v24;
      uint64_t v34 = *(void *)(v0 + 168);
      swift_bridgeObjectRetain();
      if ((v34 & 0xC000000000000001) != 0) {
        id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v35 = *(id *)(v34 + 32);
      }
      id v36 = v35;
      *(void *)(v0 + 312) = v35;
      *(void *)(v0 + 320) = 1;
      id v37 = *(void **)(v0 + 296);
      id v38 = LiteMessageServiceSession.offGridMessenger.getter();
      *(void *)(v0 + 328) = v38;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 120;
      *(void *)(v0 + 24) = specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:);
      uint64_t v39 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IDSOffGridMessage, String);
      *(void *)(v0 + 104) = &block_descriptor_5_0;
      *(void *)(v0 + 112) = v39;
      [v38 sendEncryptedOffGridMessage:v36 options:v37 completion:v0 + 80];
      uint64_t v40 = v0 + 16;
      return _swift_continuation_await(v40);
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    *(void *)(v0 + 248) = v2;
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_release();
  lazy protocol witness table accessor for type LiteMessageSendError and conformance LiteMessageSendError();
  swift_allocError();
  *(_OWORD *)uint64_t v42 = xmmword_479C0;
  *(_WORD *)(v42 + 16) = 512;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  unint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 336) = v2;
  if (v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v1 + 232);
    uint64_t v4 = *(void *)(v1 + 240);
    uint64_t v5 = specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:);
  }
  else
  {
    uint64_t v3 = *(void *)(v1 + 232);
    uint64_t v4 = *(void *)(v1 + 240);
    uint64_t v5 = specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:);
  }
  return _swift_task_switch(v5, v3, v4);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t (*v30)(void);
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;

  unint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void **)(v0 + 296);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 192);
  uint64_t v45 = *(void **)(v0 + 176);

  uint64_t v44 = *(void *)(v0 + 128);
  uint64_t v7 = *(void *)(v0 + 136);

  v3(v5, v4, v6);
  swift_bridgeObjectRetain_n();
  unsigned __int8 v8 = v45;
  swift_bridgeObjectRetain();
  id v9 = Logger.logObject.getter();
  NSString v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = *(void *)(v0 + 320);
    uint64_t v12 = *(void *)(v0 + 168);
    uint64_t v13 = swift_slowAlloc();
    *(void *)(v0 + 144) = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134218754;
    *(void *)(v13 + 4) = v11;
    *(_WORD *)(v13 + 12) = 2048;
    uint64_t v43 = v7;
    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      id v14 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v14 = *(void *)((char *)&dword_10 + (*(void *)(v0 + 168) & 0xFFFFFFFFFFFFFF8));
    }
    uint64_t v21 = *(void **)(v0 + 176);
    swift_bridgeObjectRelease();
    *(void *)(v13 + 14) = v14;
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2080;
    uint64_t v22 = [v21 guid];
    if (!v22) {
      goto LABEL_20;
    }
    char v23 = v22;
    uint64_t v40 = *(void **)(v0 + 312);
    os_log_type_t v46 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    uint64_t v42 = *(void *)(v0 + 208);
    uint64_t v41 = *(void *)(v0 + 192);
    unint64_t v24 = *(void **)(v0 + 176);
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v27 = v26;

    *(void *)(v13 + 24) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v27, (uint64_t *)(v0 + 144));
    swift_bridgeObjectRelease();

    *(_WORD *)(v13 + 32) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v13 + 34) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v43, (uint64_t *)(v0 + 144));
    swift_bridgeObjectRelease_n();
    _os_log_impl(&def_3494C, v9, v10, "Successfully sent part %ld (of %ld) of %s with part identifier %s", (uint8_t *)v13, 0x2Au);
    swift_arrayDestroy();
    int64_t v15 = (void *)(v0 + 288);
    swift_slowDealloc();
    swift_slowDealloc();

    v46(v42, v41);
  }
  else
  {
    int64_t v15 = (void *)(v0 + 304);
    unint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    uint64_t v16 = *(void **)(v0 + 312);
    unint64_t v18 = *(void *)(v0 + 208);
    uint64_t v19 = *(void *)(v0 + 192);
    uint64_t v20 = *(void **)(v0 + 176);
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    v17(v18, v19);
  }
  uint64_t v28 = *(void *)(v0 + 320);
  if (v28 != *(void *)(v0 + 248))
  {
    *(void *)(v0 + 304) = *v15;
    uint64_t v32 = *(void *)(v0 + 168);
    if ((v32 & 0xC000000000000001) != 0) {
      uint64_t v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      uint64_t v33 = *(id *)(v32 + 8 * v28 + 32);
    }
    uint64_t v34 = v33;
    *(void *)(v0 + 312) = v33;
    *(void *)(v0 + 320) = v28 + 1;
    if (!__OFADD__(v28, 1))
    {
      id v35 = *(void **)(v0 + 296);
      id v36 = LiteMessageServiceSession.offGridMessenger.getter();
      *(void *)(v0 + 328) = v36;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 120;
      *(void *)(v0 + 24) = specialized LiteMessageServiceSession.sendEncryptedMessageSegments(_:to:item:viaSatellite:);
      id v37 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSOffGridMessage?, @unowned NSString?, @unowned NSError?) -> () with result type (IDSOffGridMessage, String);
      *(void *)(v0 + 104) = &block_descriptor_5_0;
      *(void *)(v0 + 112) = v37;
      [v36 sendEncryptedOffGridMessage:v34 options:v35 completion:v0 + 80];
      id v38 = v0 + 16;
      return _swift_continuation_await(v38);
    }
    __break(1u);
LABEL_20:
    uint64_t v39 = *(void **)(v0 + 176);
    swift_bridgeObjectRelease();

    __break(1u);
    return _swift_continuation_await(v38);
  }
  long long v29 = *(void **)(v0 + 296);
  swift_bridgeObjectRelease();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  int v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  unint64_t v1 = (void *)v0[41];
  uint64_t v2 = (void *)v0[39];
  uint64_t v3 = (void *)v0[37];
  swift_release();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id LiteMessageServiceSession.joinedChat(with:)(uint64_t a1, uint64_t a2)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v2 chatForChatIdentifier:v5 style:45];

  if (!v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_46FB0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_46FA0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 48) = a1;
    *(void *)(inited + 56) = a2;
    *(void *)(inited + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 72) = v11;
    *(void *)(inited + 80) = a1;
    *(void *)(inited + 88) = a2;
    swift_bridgeObjectRetain_n();
    unint64_t v12 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    *(void *)(v8 + 32) = v12;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v2 joinChat:v7 handleInfo:isa style:45 groupID:0 joinProperties:0];

    NSString v14 = String._bridgeToObjectiveC()();
    id v6 = [v2 chatForChatIdentifier:v14 style:45];
  }
  return v6;
}

uint64_t one-time initialization function for versionIdentifier()
{
  uint64_t v0 = type metadata accessor for Schema.Version();
  __swift_allocate_value_buffer(v0, static LiteMessageSegmentStoreSchemaV1.versionIdentifier);
  __swift_project_value_buffer(v0, (uint64_t)static LiteMessageSegmentStoreSchemaV1.versionIdentifier);
  return Schema.Version.init(_:_:_:)();
}

uint64_t LiteMessageSegmentStoreSchemaV1.versionIdentifier.unsafeMutableAddressor()
{
  if (one-time initialization token for versionIdentifier != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Schema.Version();

  return __swift_project_value_buffer(v0, (uint64_t)static LiteMessageSegmentStoreSchemaV1.versionIdentifier);
}

uint64_t static LiteMessageSegmentStoreSchemaV1.versionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for versionIdentifier != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Schema.Version();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LiteMessageSegmentStoreSchemaV1.versionIdentifier);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static LiteMessageSegmentStoreSchemaV1.versionIdentifier.setter(uint64_t a1)
{
  if (one-time initialization token for versionIdentifier != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Schema.Version();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LiteMessageSegmentStoreSchemaV1.versionIdentifier);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static LiteMessageSegmentStoreSchemaV1.versionIdentifier.modify())()
{
  if (one-time initialization token for versionIdentifier != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Schema.Version();
  __swift_project_value_buffer(v0, (uint64_t)static LiteMessageSegmentStoreSchemaV1.versionIdentifier);
  swift_beginAccess();
  return static LiteMessageSegmentStoreSchemaV1.versionIdentifier.modify;
}

uint64_t static LiteMessageSegmentStoreSchemaV1.models.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PersistentModel.Type>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_46FB0;
  uint64_t v1 = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
  uint64_t v2 = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  return v0;
}

uint64_t type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  uint64_t result = type metadata singleton initialization cache for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment;
  if (!type metadata singleton initialization cache for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of LiteMessageContent(a3, (uint64_t)v4);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.getter()
{
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.setter()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.setter()
{
  return closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.setter();
}

void (*LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCO12iMessageLite31LiteMessageSegmentStoreSchemaV118LiteMessageSegment___observationRegistrar;
  v3[4] = v1;
  v3[5] = v4;
  v3[2] = v1;
  swift_getKeyPath();
  v3[6] = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  uint64_t v5 = v3[3];
  *uint64_t v3 = v3[2];
  v3[1] = v5;
  return LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.modify;
}

void LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.modify(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 16) = *(void *)(*(void *)a1 + 32);
  swift_getKeyPath();
  if (a2)
  {
    swift_bridgeObjectRetain();
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_bridgeObjectRelease();
    swift_release();
  }
  free(v3);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.init(uint64_t a1, uint64_t a2)
{
  outlined init with copy of LiteMessageContent(a2, (uint64_t)v3);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.getter()
{
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.setter()
{
  return swift_release();
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.setter()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.setter()
{
  return closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.setter();
}

void (*LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCO12iMessageLite31LiteMessageSegmentStoreSchemaV118LiteMessageSegment___observationRegistrar;
  v3[2] = v1;
  v3[3] = v4;
  v3[1] = v1;
  swift_getKeyPath();
  void v3[4] = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  *uint64_t v3 = v3[1];
  return LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.modify;
}

void LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.modify(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)(*(void *)a1 + 8) = *(void *)(*(void *)a1 + 16);
  swift_getKeyPath();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  free(v1);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.init(uint64_t a1, uint64_t a2)
{
  outlined init with copy of LiteMessageContent(a2, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  swift_getKeyPath();
  uint64_t v3 = type metadata accessor for Date();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.getter()
{
  return swift_release();
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.setter(uint64_t a1)
{
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v2 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.setter()
{
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
  PersistentModel.setValue<A>(forKey:to:)();

  return swift_release();
}

uint64_t partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.setter()
{
  return closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.setter();
}

void (*LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = type metadata accessor for Date();
  void v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[6] = malloc(v6);
  NSString v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCO12iMessageLite31LiteMessageSegmentStoreSchemaV118LiteMessageSegment___observationRegistrar;
  v3[7] = v7;
  v3[8] = v8;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[9] = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.modify;
}

void LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 56);
  uint64_t v5 = *(void *)(*(void *)a1 + 32);
  uint64_t v6 = *(void *)(*(void *)a1 + 40);
  uint64_t v7 = *(void *)(*(void *)a1 + 24);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 48), v4, v5);
    v2[1] = v7;
    uint64_t KeyPath = swift_getKeyPath();
    v11[0] = v11;
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    id v9 = *(void (**)(void *, uint64_t))(v6 + 8);
    v9(v3, v5);
    v9(v4, v5);
  }
  else
  {
    v2[2] = v7;
    uint64_t v10 = swift_getKeyPath();
    v11[0] = v11;
    __chkstk_darwin(v10);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t key path getter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 296))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))(**(void **)a2 + 304);
  outlined copy of Data._Representation(*a1, v3);
  return v4(v2, v3);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.init(uint64_t a1, unint64_t a2, uint64_t a3)
{
  outlined init with copy of LiteMessageContent(a3, (uint64_t)v6);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  swift_getKeyPath();
  lazy protocol witness table accessor for type Data and conformance Data();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  outlined consume of Data._Representation(a1, a2);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.getter()
{
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  lazy protocol witness table accessor for type Data and conformance Data();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.setter(uint64_t a1, unint64_t a2)
{
  return swift_release();
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.setter()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.setter()
{
  return closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.setter();
}

void (*LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.modify(void *a1))(uint64_t **a1, char a2)
{
  unint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCO12iMessageLite31LiteMessageSegmentStoreSchemaV118LiteMessageSegment___observationRegistrar;
  void v3[4] = v1;
  v3[5] = v4;
  v3[2] = v1;
  swift_getKeyPath();
  v3[6] = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  lazy protocol witness table accessor for type Data and conformance Data();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  *(_OWORD *)unint64_t v3 = *((_OWORD *)v3 + 1);
  return LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.modify;
}

void LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.modify(uint64_t **a1, char a2)
{
  unint64_t v3 = *a1;
  v3[2] = (*a1)[4];
  uint64_t v5 = *v3;
  unint64_t v4 = v3[1];
  swift_getKeyPath();
  if (a2)
  {
    outlined copy of Data._Representation(v5, v4);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    outlined consume of Data._Representation(v5, v4);
    swift_release();
    outlined consume of Data._Representation(*v3, v3[1]);
  }
  else
  {
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    outlined consume of Data._Representation(v5, v4);
    swift_release();
  }
  free(v3);
}

uint64_t *LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.__allocating_init(consolidationIdentifier:segmentNumber:dateReceived:data:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unint64_t a6)
{
  swift_allocObject();
  unint64_t v12 = specialized LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.init(consolidationIdentifier:segmentNumber:dateReceived:data:)(a1, a2, a3, a4, a5, a6);
  outlined consume of Data._Representation(a5, a6);
  return v12;
}

uint64_t *LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.init(consolidationIdentifier:segmentNumber:dateReceived:data:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = specialized LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.init(consolidationIdentifier:segmentNumber:dateReceived:data:)(a1, a2, a3, a4, a5, a6);
  outlined consume of Data._Representation(a5, a6);
  return v8;
}

uint64_t variable initialization expression of LiteMessageSegmentStoreSchemaV1.LiteMessageSegment._$backingData@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  a1[4] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(a1);
  return static PersistentModel.createBackingData<A>()();
}

uint64_t key path getter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 352))();
}

uint64_t key path setter for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData : LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t a1, uint64_t a2)
{
  outlined init with copy of LiteMessageContent(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 360))(v4);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return outlined init with copy of LiteMessageContent(v1 + 16, a1);
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData.setter(long long *a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  outlined init with take of LiteMessageContent(a1, v3);
  return swift_endAccess();
}

void (*LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  outlined init with copy of LiteMessageContent(v1 + 16, (uint64_t)v3);
  return LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData.modify;
}

void LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.persistentBackingData.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (long long *)(*a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void *)(v2 + 128) + 16;
    outlined init with copy of LiteMessageContent(*a1, (uint64_t)v3);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0(v4);
    outlined init with take of LiteMessageContent(v3, v4);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_0(v2);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128) + 16;
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0(v5);
    outlined init with take of LiteMessageContent((long long *)v2, v5);
    swift_endAccess();
  }

  free((void *)v2);
}

uint64_t *LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.__allocating_init(backingData:)(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)swift_allocObject();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  *(void *)&long long v5 = v1;
  *((void *)&v5 + 1) = v1;
  uint64_t v6 = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  uint64_t v7 = v6;
  v3[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v3 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  outlined init with copy of LiteMessageContent(a1, (uint64_t)&v5);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v3 + 2));
  outlined init with take of LiteMessageContent(&v5, (uint64_t)(v3 + 2));
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v3;
}

uint64_t *LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.init(backingData:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
  v1[5] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  v5[0] = v3;
  v5[1] = v3;
  uint64_t v6 = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  uint64_t v7 = v6;
  v1[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v1 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  outlined init with copy of LiteMessageContent(a1, (uint64_t)v5);
  (*(void (**)(void *))(*v1 + 360))(v5);
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v1;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.access<A>(keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.withMutation<A, B>(keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtCO12iMessageLite31LiteMessageSegmentStoreSchemaV118LiteMessageSegment___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtCO12iMessageLite31LiteMessageSegmentStoreSchemaV118LiteMessageSegment___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

Swift::Int LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for PersistentModel.init(backingData:) in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t protocol witness for PersistentModel.persistentBackingData.getter in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t protocol witness for PersistentModel.persistentBackingData.setter in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

void (*protocol witness for PersistentModel.persistentBackingData.modify in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void v3[4] = (*(uint64_t (**)(void))(*(void *)v1 + 368))();
  return protocol witness for PersistentModel.persistentBackingData.modify in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment;
}

void protocol witness for PersistentModel.persistentBackingData.modify in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return PersistentModel.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Identifiable.id.getter in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return PersistentModel.id.getter();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();

  return static PersistentModel.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t *specialized LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.init(consolidationIdentifier:segmentNumber:dateReceived:data:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
  v6[5] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  uint64_t v20 = v6;
  uint64_t v14 = _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
  v25[0] = v13;
  v25[1] = v13;
  _OWORD v25[2] = v14;
  uint64_t v26 = v14;
  v6[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v6 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  outlined init with copy of LiteMessageContent((uint64_t)(v6 + 2), (uint64_t)v25);
  __swift_project_boxed_opaque_existential_1(v25, v26);
  swift_getKeyPath();
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
  outlined init with copy of LiteMessageContent((uint64_t)(v6 + 2), (uint64_t)v25);
  __swift_project_boxed_opaque_existential_1(v25, v26);
  swift_getKeyPath();
  uint64_t v23 = v18;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
  int64_t v15 = v19;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v19, v9);
  outlined init with copy of LiteMessageContent((uint64_t)(v6 + 2), (uint64_t)v25);
  __swift_project_boxed_opaque_existential_1(v25, v26);
  swift_getKeyPath();
  _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v12, v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
  outlined init with copy of LiteMessageContent((uint64_t)(v6 + 2), (uint64_t)v25);
  __swift_project_boxed_opaque_existential_1(v25, v26);
  swift_getKeyPath();
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  lazy protocol witness table accessor for type Data and conformance Data();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
  v16(v15, v9);
  return v20;
}

uint64_t specialized static LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.schemaMetadata.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Schema.PropertyMetadata>);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_479E0;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t base witness table accessor for Observable in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
}

uint64_t base witness table accessor for Hashable in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
}

uint64_t base witness table accessor for Identifiable in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
}

uint64_t base witness table accessor for Equatable in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type LiteMessageSegmentStoreSchemaV1.LiteMessageSegment and conformance LiteMessageSegmentStoreSchemaV1.LiteMessageSegment, (void (*)(uint64_t))type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment);
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(&lazy protocol witness table cache variable for type PersistentIdentifier and conformance PersistentIdentifier, (void (*)(uint64_t))&type metadata accessor for PersistentIdentifier);
}

uint64_t _s12iMessageLite0bA20SegmentStoreSchemaV1O0baC0CAE9SwiftData15PersistentModelAAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for LiteMessageSegmentStoreSchemaV1()
{
  return &type metadata for LiteMessageSegmentStoreSchemaV1;
}

uint64_t ObjC metadata update function for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  return type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment();
}

uint64_t type metadata completion function for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment._SwiftDataNoType()
{
  return &type metadata for LiteMessageSegmentStoreSchemaV1.LiteMessageSegment._SwiftDataNoType;
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.setterpartial apply()
{
  return partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.segmentNumber.setter();
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.setterpartial apply()
{
  return partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.dateReceived.setter();
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.setterpartial apply()
{
  return partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.consolidationIdentifier.setter();
}

uint64_t closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.setterpartial apply()
{
  return partial apply for closure #1 in LiteMessageSegmentStoreSchemaV1.LiteMessageSegment.data.setter();
}

uint64_t LiteMessageType.init(associatedMessageType:)(uint64_t a1)
{
  if (a1 == 3007 || a1 == 1000) {
    return 0;
  }
  else {
    return 2;
  }
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LiteMessageType@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized LiteMessageType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

BOOL LiteMessageType.isCoreType.getter(unsigned __int8 a1)
{
  return a1 < 3u;
}

unint64_t specialized LiteMessageType.init(rawValue:)(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LiteMessageType and conformance LiteMessageType()
{
  unint64_t result = lazy protocol witness table cache variable for type LiteMessageType and conformance LiteMessageType;
  if (!lazy protocol witness table cache variable for type LiteMessageType and conformance LiteMessageType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LiteMessageType and conformance LiteMessageType);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LiteMessageType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LiteMessageType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x3DDA0);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageType()
{
  return &type metadata for LiteMessageType;
}

double static Double.defaultSMSDowngradeTimeInterval.getter()
{
  id v0 = [self sharedInstanceForBagType:1];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  outlined init with take of Any?((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    outlined destroy of Any?((uint64_t)v8);
    return 86400.0;
  }
  type metadata accessor for NSNumber();
  if ((swift_dynamicCast() & 1) == 0) {
    return 86400.0;
  }
  [v6 doubleValue];
  double v4 = v3;

  return v4;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

Swift::Void __swiftcall LiteMessageServiceSession.prepareForFirstUnlock()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  double v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  id v6 = [v5 sharedInstance];
  [v6 addListener:v0];

  id v7 = [v5 sharedInstance];
  LOBYTE(v6) = [v7 isUnderFirstDataProtectionLock];

  if (v6)
  {
    uint64_t v8 = Logger.liteSession.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v8, v1);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&def_3494C, v9, v10, "Deferring first unlock tasks", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    LiteMessageServiceSession.performFirstUnlockTasks()();
  }
}

Swift::Void __swiftcall LiteMessageServiceSession.performFirstUnlockTasks()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v2 - 8);
  double v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = Logger.liteSession.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&def_3494C, v10, v11, "Performing first unlock tasks", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  type metadata accessor for MainActor();
  id v14 = v1;
  uint64_t v15 = static MainActor.shared.getter();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v14;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v4, (uint64_t)&async function pointer to partial apply for closure #1 in LiteMessageServiceSession.performFirstUnlockTasks(), (uint64_t)v16);
  swift_release();
  LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()();
}

uint64_t closure #1 in LiteMessageServiceSession.performFirstUnlockTasks()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  type metadata accessor for MainActor();
  v4[3] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  void v4[4] = v6;
  v4[5] = v5;
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.performFirstUnlockTasks(), v6, v5);
}

uint64_t closure #1 in LiteMessageServiceSession.performFirstUnlockTasks()()
{
  uint64_t v1 = LiteMessageServiceSession.segmentStore.getter();
  *(void *)(v0 + 48) = v1;
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.performFirstUnlockTasks(), v1, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  LiteMessageSegmentStore.deleteAbandonedMessageSegments()();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  return _swift_task_switch(closure #1 in LiteMessageServiceSession.familyContactsDidChange(), v1, v2);
}

uint64_t sub_3E558()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t partial apply for closure #1 in LiteMessageServiceSession.performFirstUnlockTasks()()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = partial apply for closure #1 in LiteMessageServiceSession.familyContactsDidChange();
  return closure #1 in LiteMessageServiceSession.performFirstUnlockTasks()((uint64_t)v3, v4, v5, v2);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3E68C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

BOOL LiteMessageServiceSession.hasExistingMessageWithLiteIdentifier(_:in:)()
{
  id v0 = [self sharedInstance];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 messageWithGUID:v1];

  if (v2) {
  return v2 != 0;
  }
}

id LiteMessageServiceSession.isSatelliteConnectionActive.getter()
{
  return LiteMessageServiceSession.isSatelliteConnectionActive.getter((SEL *)&selRef_isSatelliteConnectionActive);
}

id LiteMessageServiceSession.isLiteMessageActiveOverSatellite.getter()
{
  return LiteMessageServiceSession.isSatelliteConnectionActive.getter((SEL *)&selRef_isLiteMessageActiveOverSatellite);
}

id LiteMessageServiceSession.isSatelliteConnectionActive.getter(SEL *a1)
{
  id result = [self sharedController];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = [result *a1];

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static LiteMessageSegmentStoreMigrationPlan.schemas.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedSchema.Type>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_46FB0;
  unint64_t v1 = lazy protocol witness table accessor for type LiteMessageSegmentStoreSchemaV1 and conformance LiteMessageSegmentStoreSchemaV1();
  *(void *)(v0 + 32) = &type metadata for LiteMessageSegmentStoreSchemaV1;
  *(void *)(v0 + 40) = v1;
  return v0;
}

void *static LiteMessageSegmentStoreMigrationPlan.stages.getter()
{
  return &_swiftEmptyArrayStorage;
}

ValueMetadata *type metadata accessor for LiteMessageSegmentStoreMigrationPlan()
{
  return &type metadata for LiteMessageSegmentStoreMigrationPlan;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance IMMessageItem.IMMessageItemContentType@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized IMMessageItem.IMMessageItemContentType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

id IMMessageItem.liteAssociatedMessageSummaryInfo()()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v103 = &_swiftEmptyDictionarySingleton;
  id v7 = [objc_allocWithZone((Class)IMPluginPayload) initWithMessageItem:v0];
  if (!v7)
  {
LABEL_6:
    if ([v0 type])
    {
LABEL_7:
      uint64_t v20 = 0;
      goto LABEL_8;
    }
    id v32 = [v0 fileTransferGUIDs];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (*(void *)(v34 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        id v35 = [self sharedInstance];
        if (!v35)
        {
          swift_bridgeObjectRelease();
          goto LABEL_7;
        }
        id v36 = v35;
        NSString v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v38 = [v36 transferForGUID:v37];

        if (!v38)
        {

          goto LABEL_7;
        }
        id v39 = [v38 type];
        if (IMUTTypeIsImage() || IMUTTypeIsSupportedAnimatedImage())
        {

          uint64_t v20 = 3;
        }
        else if (IMUTTypeIsMovie())
        {

          uint64_t v20 = 7;
        }
        else if (IMUTTypeIsVCard())
        {

          uint64_t v20 = 4;
        }
        else if (IMUTTypeIsAudio())
        {

          uint64_t v20 = 2;
        }
        else if (IMUTTypeIsMap())
        {

          uint64_t v20 = 6;
        }
        else if (IMUTTypeIsCalendar())
        {

          uint64_t v20 = 5;
        }
        else if (IMUTTypeIsPass())
        {

          uint64_t v20 = 8;
        }
        else
        {
          int IsWalletOrder = IMUTTypeIsWalletOrder();

          if (IsWalletOrder) {
            uint64_t v20 = 10;
          }
          else {
            uint64_t v20 = 0;
          }
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v20 = 1;
      }
    }
    else
    {
      uint64_t v20 = 1;
    }
LABEL_8:
    *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((void *)&v99 + 1) = v21;
    AnyHashable.init<A>(_:)();
    *((void *)&v100 + 1) = &type metadata for Int;
    *(void *)&long long v99 = v20;
    outlined init with take of Any(&v99, v98);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v97 = &_swiftEmptyDictionarySingleton;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, isUniquelyReferenced_nonNull_native);
    uint64_t v23 = v97;
    unint64_t v103 = v97;
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable((uint64_t)v101);
    id v24 = [v1 body];
    if (v24)
    {
      uint64_t v25 = v24;
      id v26 = [v24 string];

      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v29 = v28;

      *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *((void *)&v99 + 1) = v30;
      AnyHashable.init<A>(_:)();
      *((void *)&v100 + 1) = &type metadata for String;
      *(void *)&long long v99 = v27;
      *((void *)&v99 + 1) = v29;
      outlined init with take of Any(&v99, v98);
      char v31 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v97 = v23;
      specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, v31);
      unint64_t v103 = v97;
      swift_bridgeObjectRelease();
      outlined destroy of AnyHashable((uint64_t)v101);
    }
    return v103;
  }
  uint64_t v8 = v7;
  id v9 = [v7 data];
  if (!v9)
  {

    goto LABEL_6;
  }
  os_log_type_t v10 = v9;
  uint64_t v94 = v3;
  uint64_t v95 = v2;
  uint64_t v96 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v99 + 1) = v13;
  AnyHashable.init<A>(_:)();
  id v14 = [v8 pluginBundleID];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    *((void *)&v100 + 1) = &type metadata for String;
    *(void *)&long long v99 = v16;
    *((void *)&v99 + 1) = v18;
    outlined init with take of Any(&v99, v98);
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v97 = &_swiftEmptyDictionarySingleton;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, v19);
    unint64_t v103 = v97;
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable((uint64_t)v101);
  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)((uint64_t)v101, &v99);
    outlined destroy of AnyHashable((uint64_t)v101);
    outlined destroy of TaskPriority?((uint64_t)&v99, &demangling cache variable for type metadata for Any?);
  }
  *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v99 + 1) = v40;
  AnyHashable.init<A>(_:)();
  id v41 = [v8 pluginBundleID];
  if (!v41)
  {
    *((void *)&v100 + 1) = &type metadata for Int;
    *(void *)&long long v99 = 0;
    uint64_t v48 = v96;
    goto LABEL_29;
  }
  uint64_t v42 = v41;
  uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v45 = v44;

  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v96;
  if (v43 == v46 && v45 == v47)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v49 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v49 & 1) == 0)
    {
      uint64_t v50 = 9;
      goto LABEL_28;
    }
  }
  uint64_t v50 = 1;
LABEL_28:
  *((void *)&v100 + 1) = &type metadata for Int;
  *(void *)&long long v99 = v50;
LABEL_29:
  outlined init with take of Any(&v99, v98);
  uint64_t v51 = v103;
  char v52 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v97 = v51;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, v52);
  uint64_t v53 = v97;
  unint64_t v103 = v97;
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v101);
  *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v99 + 1) = v54;
  AnyHashable.init<A>(_:)();
  uint64_t v55 = specialized IMMessageItem.summary(from:)(v8);
  if (v56)
  {
    *((void *)&v100 + 1) = &type metadata for String;
    *(void *)&long long v99 = v55;
    *((void *)&v99 + 1) = v56;
    outlined init with take of Any(&v99, v98);
    char v57 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v97 = v53;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, v57);
    unint64_t v103 = v97;
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable((uint64_t)v101);
  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)((uint64_t)v101, &v99);
    outlined destroy of AnyHashable((uint64_t)v101);
    outlined destroy of TaskPriority?((uint64_t)&v99, &demangling cache variable for type metadata for Any?);
  }
  id result = (id)IMExtensionPayloadUnarchivingClasses();
  if (result)
  {
    uint64_t v59 = result;
    uint64_t v60 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    id v61 = specialized _copyCollectionToContiguousArray<A>(_:)(v60);
    swift_bridgeObjectRelease();
    uint64_t v62 = specialized _arrayConditionalCast<A, B>(_:)((uint64_t)v61);
    swift_release();
    id v63 = objc_allocWithZone((Class)NSKeyedUnarchiver);
    outlined copy of Data._Representation(v48, v12);
    id v64 = specialized @nonobjc NSKeyedUnarchiver.init(forReadingFrom:)();
    outlined consume of Data._Representation(v48, v12);
    if (v62)
    {
      specialized _arrayForceCast<A, B>(_:)((uint64_t)v62);
      swift_bridgeObjectRelease();
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v93 = v64;
    NSCoder.decodeObject(of:forKey:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v102)
    {
      type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for NSDictionary);
      if (swift_dynamicCast())
      {
        uint64_t v65 = (void *)v99;
        *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *((void *)&v99 + 1) = v66;
        swift_bridgeObjectRetain();
        id v67 = objc_msgSend(v65, "__swift_objectForKeyedSubscript:", _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)());
        swift_unknownObjectRelease();
        if (v67)
        {
          _bridgeAnyObjectToAny(_:)();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v99 = 0u;
          long long v100 = 0u;
        }
        outlined init with take of Any?((uint64_t)&v99, (uint64_t)v101, &demangling cache variable for type metadata for Any?);
        if (v102)
        {
          if (swift_dynamicCast())
          {
            long long v68 = v98[0];
            swift_bridgeObjectRelease();
            type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMChat);
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            id v70 = [self bundleForClass:ObjCClassFromMetadata];
            v104._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
            v104._object = (void *)0x8000000000049320;
            v71.value._object = (void *)0x8000000000049300;
            v72._uint64_t countAndFlagsBits = 0x73654D2040252031;
            v72._object = (void *)0xEC00000065676173;
            v71.value._uint64_t countAndFlagsBits = 0xD000000000000011;
            v73._uint64_t countAndFlagsBits = 0;
            v73._object = (void *)0xE000000000000000;
            NSLocalizedString(_:tableName:bundle:value:comment:)(v72, v71, (NSBundle)v70, v73, v104);
            unint64_t v92 = v12;

            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
            uint64_t v74 = swift_allocObject();
            *(_OWORD *)(v74 + 16) = xmmword_46FB0;
            *(void *)(v74 + 56) = &type metadata for String;
            *(void *)(v74 + 64) = lazy protocol witness table accessor for type String and conformance String();
            *(_OWORD *)(v74 + 32) = v68;
            swift_bridgeObjectRetain();
            uint64_t v75 = static String.localizedStringWithFormat(_:_:)();
            uint64_t v77 = v76;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            *((void *)&v99 + 1) = v78;
            AnyHashable.init<A>(_:)();
            *((void *)&v100 + 1) = &type metadata for String;
            long long v99 = v68;
            outlined init with take of Any(&v99, v98);
            char v79 = v103;
            char v80 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v97 = v79;
            specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, v80);
            uint64_t v81 = v97;
            swift_bridgeObjectRelease();
            outlined destroy of AnyHashable((uint64_t)v101);
            *(void *)&long long v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            *((void *)&v99 + 1) = v82;
            AnyHashable.init<A>(_:)();
            *((void *)&v100 + 1) = &type metadata for String;
            *(void *)&long long v99 = v75;
            *((void *)&v99 + 1) = v77;
            outlined init with take of Any(&v99, v98);
            char v83 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v97 = v81;
            specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, (uint64_t)v101, v83);
            unint64_t v103 = v97;
            swift_bridgeObjectRelease();
            outlined destroy of AnyHashable((uint64_t)v101);

            outlined consume of Data._Representation(v96, v92);
            return v103;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();

          outlined destroy of TaskPriority?((uint64_t)v101, &demangling cache variable for type metadata for Any?);
        }
      }
      uint64_t v48 = v96;
    }
    else
    {
      outlined destroy of TaskPriority?((uint64_t)v101, &demangling cache variable for type metadata for Any?);
    }
    uint64_t v84 = Logger.liteSession.unsafeMutableAddressor();
    uint64_t v86 = v94;
    uint64_t v85 = v95;
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v6, v84, v95);
    uint64_t v87 = Logger.logObject.getter();
    os_log_type_t v88 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v89 = 0;
      _os_log_impl(&def_3494C, v87, v88, "Failed to decode plugin payload dictionary.", v89, 2u);
      swift_slowDealloc();

      outlined consume of Data._Representation(v48, v12);
    }
    else
    {

      outlined consume of Data._Representation(v48, v12);
    }
    (*(void (**)(char *, uint64_t))(v86 + 8))(v6, v85);
    return v103;
  }
  __break(1u);
  return result;
}

void *specialized _arrayConditionalCast<A, B>(_:)(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  os_log_type_t v10 = _swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 40)
    {
      outlined init with copy of AnyHashable(i, (uint64_t)v9);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject.Type);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v6 + 1;
      v3[v6 + 4] = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    return 0;
  }
  return v3;
}

void *specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v3 = a1 + 32;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject.Type);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Swift.AnyObject.Type);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v5 = _swiftEmptyArrayStorage[2];
      unint64_t v4 = _swiftEmptyArrayStorage[3];
      if (v5 >= v4 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v4 > 1, v5 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + 1;
      _swiftEmptyArrayStorage[v5 + 4] = v7;
      v3 += 8;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t specialized getContiguousArrayStorageType<A>(for:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject.Type);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    int64_t v2 = &demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>;
  }
  else {
    int64_t v2 = (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<NSObject.Type>;
  }

  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      uint64_t v9 = v11;
    }
    outlined destroy of AnyHashable(*(void *)(v9 + 48) + 40 * v6);
    outlined init with take of Any((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    specialized _NativeDictionary._delete(at:)(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyHashable>);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 40);
  uint64_t v5 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of [IDSURI : NSNumber].Iterator._Variant();
  if (v5 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        outlined init with copy of AnyHashable(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        double result = outlined destroy of AnyHashable((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            uint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              _OWORD *v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a3 & 1);
    unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      outlined init with copy of AnyHashable(a2, (uint64_t)v21);
      return specialized _NativeDictionary._insert(at:key:value:)(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);

  return outlined init with take of Any(a1, v17);
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_36:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    void v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    double result = outlined init with copy of AnyHashable(*(void *)(a4 + 48) + 40 * v16, (uint64_t)v23);
    uint64_t v17 = v24;
    long long v18 = v23[1];
    *(_OWORD *)uint64_t v11 = v23[0];
    *(_OWORD *)(v11 + 16) = v18;
    *(void *)(v11 + 32) = v17;
    v11 += 40;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v22;
      goto LABEL_36;
    }
  }
  int64_t v19 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v19 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v19);
  if (v20) {
    goto LABEL_23;
  }
  int64_t v21 = v12 + 2;
  ++v12;
  if (v19 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v12 = v19 + 1;
  if (v19 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * (v19 + 2));
  if (v20)
  {
    v19 += 2;
    goto LABEL_23;
  }
  int64_t v12 = v19 + 2;
  if (v19 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * (v19 + 3));
  if (v20)
  {
    v19 += 3;
    goto LABEL_23;
  }
  int64_t v21 = v19 + 4;
  int64_t v12 = v19 + 3;
  if (v19 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
LABEL_16:
    int64_t v19 = v21;
LABEL_23:
    unint64_t v9 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v19 << 6);
    int64_t v12 = v19;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v19 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v19 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t specialized IMMessageItem.IMMessageItemContentType.init(rawValue:)(unint64_t result)
{
  if (result >= 0xB) {
    return 11;
  }
  return result;
}

uint64_t specialized IMMessageItem.summary(from:)(void *a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  unint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v57 - v10;
  id v12 = [a1 pluginBundleID];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = v15;

    if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v14 && v17 == v16)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
        if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v14 && v20 == v16)
        {
          swift_bridgeObjectRelease();
LABEL_19:
          swift_bridgeObjectRelease();
          type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMChat);
          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          id v26 = [self bundleForClass:ObjCClassFromMetadata];
          unint64_t v27 = 0xD000000000000013;
          unint64_t v28 = 0xD000000000000026;
          unint64_t v56 = 0x8000000000049430;
          uint64_t v29 = "Handwritten Message";
LABEL_20:
          unint64_t v30 = (unint64_t)(v29 - 32) | 0x8000000000000000;
          unint64_t v31 = 0x8000000000049300;
LABEL_26:
          unint64_t v35 = 0xD000000000000011;
          v36._uint64_t countAndFlagsBits = 0;
          v36._object = (void *)0xE000000000000000;
          uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v27, *(Swift::String_optional *)(&v31 - 1), (NSBundle)v26, v36, *(Swift::String *)&v28)._countAndFlagsBits;

          return countAndFlagsBits;
        }
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v24) {
          goto LABEL_19;
        }
        if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v14 && v32 == v16) {
          goto LABEL_23;
        }
        char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v33) {
          goto LABEL_25;
        }
        id v38 = (id)IMBalloonExtensionIDWithSuffix();
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v42 = v41;

          if (v40 == v14 && v42 == v16)
          {
LABEL_23:
            swift_bridgeObjectRelease();
LABEL_25:
            swift_bridgeObjectRelease();
            type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMChat);
            uint64_t v34 = swift_getObjCClassFromMetadata();
            id v26 = [self bundleForClass:v34];
            unint64_t v28 = 0xD00000000000001ALL;
            unint64_t v56 = 0x80000000000493F0;
            unint64_t v31 = 0x8000000000049300;
            unint64_t v27 = 0x654D206F746F6850;
            unint64_t v30 = 0xED00006567617373;
            goto LABEL_26;
          }
          char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v43) {
            goto LABEL_25;
          }
        }
        if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v14 && v44 == v16)
        {
          swift_bridgeObjectRelease();
LABEL_36:
          swift_bridgeObjectRelease();
          type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMChat);
          uint64_t v46 = swift_getObjCClassFromMetadata();
          id v26 = [self bundleForClass:v46];
          unint64_t v27 = 0xD000000000000015;
          unint64_t v28 = 0xD000000000000028;
          unint64_t v56 = 0x80000000000493C0;
          uint64_t v29 = "Digital Touch Message";
          goto LABEL_20;
        }
        char v45 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v45) {
          goto LABEL_36;
        }
        if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v14 && v47 == v16) {
          goto LABEL_39;
        }
        char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v48) {
          goto LABEL_41;
        }
        id v50 = (id)IMBalloonExtensionIDWithSuffix();
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v54 = v53;

          if (v52 == v14 && v54 == v16)
          {
LABEL_39:
            swift_bridgeObjectRelease();
LABEL_41:
            swift_bridgeObjectRelease();
LABEL_42:
            type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IMChat);
            uint64_t v49 = swift_getObjCClassFromMetadata();
            id v26 = [self bundleForClass:v49];
            unint64_t v27 = 0xD000000000000010;
            unint64_t v28 = 0xD000000000000023;
            unint64_t v56 = 0x8000000000049370;
            uint64_t v29 = "CHECK_IN_MESSAGE";
            goto LABEL_20;
          }
          char v55 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v55) {
            goto LABEL_42;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        return 0;
      }
    }
    swift_bridgeObjectRelease();
    id v21 = [a1 url];
    if (v21)
    {
      uint64_t v22 = v21;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v9, 0, 1, v2);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v9, 1, 1, v2);
    }
    outlined init with take of Any?((uint64_t)v9, (uint64_t)v11, &demangling cache variable for type metadata for URL?);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2))
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v11, v2);
      outlined destroy of TaskPriority?((uint64_t)v11, &demangling cache variable for type metadata for URL?);
      uint64_t countAndFlagsBits = URL.absoluteString.getter();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return countAndFlagsBits;
    }
    outlined destroy of TaskPriority?((uint64_t)v11, &demangling cache variable for type metadata for URL?);
  }
  return 0;
}

id specialized @nonobjc NSKeyedUnarchiver.init(forReadingFrom:)()
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = 0;
  id v2 = [v0 initForReadingFromData:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type IMMessageItem.IMMessageItemContentType and conformance IMMessageItem.IMMessageItemContentType()
{
  unint64_t result = lazy protocol witness table cache variable for type IMMessageItem.IMMessageItemContentType and conformance IMMessageItem.IMMessageItemContentType;
  if (!lazy protocol witness table cache variable for type IMMessageItem.IMMessageItemContentType and conformance IMMessageItem.IMMessageItemContentType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IMMessageItem.IMMessageItemContentType and conformance IMMessageItem.IMMessageItemContentType);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IMMessageItem.IMMessageItemContentType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for IMMessageItem.IMMessageItemContentType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x4141CLL);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IMMessageItem.IMMessageItemContentType()
{
  return &type metadata for IMMessageItem.IMMessageItemContentType;
}

unint64_t LiteMessageSendError.errorDescription.getter(uint64_t a1, unint64_t a2, __int16 a3)
{
  if (!HIBYTE(a3))
  {
    _StringGuts.grow(_:)(71);
    v9._uint64_t countAndFlagsBits = 0xD000000000000018;
    v9._object = (void *)0x80000000000495C0;
    String.append(_:)(v9);
    v10._uint64_t countAndFlagsBits = a1;
    v10._object = (void *)a2;
    String.append(_:)(v10);
    v11._uint64_t countAndFlagsBits = 0x79747320646E6120;
    v11._object = (void *)0xEB0000000020656CLL;
    String.append(_:)(v11);
    type metadata accessor for IMChatStyle();
    _print_unlocked<A, B>(_:_:)();
    unint64_t v7 = 0xD000000000000020;
    int v8 = " found on iMessage Lite service.";
    goto LABEL_5;
  }
  if (HIBYTE(a3) == 1)
  {
    _StringGuts.grow(_:)(56);
    v5._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
    v5._object = (void *)0x80000000000494A0;
    String.append(_:)(v5);
    v6._uint64_t countAndFlagsBits = a1;
    v6._object = (void *)a2;
    String.append(_:)(v6);
    unint64_t v7 = 0xD000000000000018;
    int v8 = ") has unexpected format.";
LABEL_5:
    unint64_t v12 = (unint64_t)(v8 - 32) | 0x8000000000000000;
    String.append(_:)(*(Swift::String *)&v7);
    return 0;
  }
  unint64_t result = 0xD000000000000017;
  if (!(a2 | a1) && !(_BYTE)a3) {
    return 0xD00000000000001ALL;
  }
  if (a1 != 1 || a2 || (_BYTE)a3)
  {
    if (a1 != 2 || a2 || (_BYTE)a3)
    {
      if (a1 != 3 || a2 || (_BYTE)a3)
      {
        BOOL v15 = a1 == 4 && a2 == 0;
        if (!v15 || a3 != 0) {
          return 0xD000000000000033;
        }
      }
      else
      {
        return 0xD000000000000036;
      }
    }
    else
    {
      return 0xD00000000000003ALL;
    }
  }
  return result;
}

unint64_t protocol witness for LocalizedError.errorDescription.getter in conformance LiteMessageSendError()
{
  return LiteMessageSendError.errorDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(_WORD *)(v0 + 16));
}

uint64_t Error.liteItemSendErrorCode.getter(uint64_t a1)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (swift_dynamicCast())
  {
    if (v11 == 2 && v8 == 4 && v9 == 0 && v10 == 0) {
      return 26;
    }
    outlined consume of LiteMessageSendError(v8, v9, v10, v11);
  }
  return 4;
}

uint64_t outlined consume of LiteMessageSendError(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined copy of LiteMessageSendError(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for LiteMessageSendError(uint64_t a1)
{
  return outlined consume of LiteMessageSendError(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(unsigned char *)(a1 + 17));
}

uint64_t initializeBufferWithCopyOfBuffer for LiteMessageSendError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(unsigned __int8 *)(a2 + 16);
  outlined copy of LiteMessageSendError(*(void *)a2, v4, v6, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 17) = v5;
  return a1;
}

uint64_t assignWithCopy for LiteMessageSendError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(unsigned __int8 *)(a2 + 16);
  outlined copy of LiteMessageSendError(*(void *)a2, v4, v6, v5);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 17);
  *(unsigned char *)(a1 + 17) = v5;
  outlined consume of LiteMessageSendError(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LiteMessageSendError(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(_WORD *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 17);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 16);
  *(_WORD *)(a1 + 16) = v3;
  outlined consume of LiteMessageSendError(v4, v5, v7, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteMessageSendError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiteMessageSendError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 17) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for LiteMessageSendError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 17) <= 1u) {
    return *(unsigned __int8 *)(a1 + 17);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t destructiveInjectEnumTag for LiteMessageSendError(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(unsigned char *)(result + 16) = 0;
  }
  *(unsigned char *)(result + 17) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageSendError()
{
  return &type metadata for LiteMessageSendError;
}

uint64_t variable initialization expression of BitCollection.bytes()
{
  return 0;
}

uint64_t BitCollection.bytes.getter(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t BitCollection.bytes.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*BitCollection.bytes.modify())()
{
  return LiteMessageHeader.messageType.getter;
}

uint64_t BitCollection.init()()
{
  return 0;
}

uint64_t BitCollection.init(bitsOf:)(void *a1)
{
  long long v6 = xmmword_476E0;
  char v7 = 0;
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(long long *, uint64_t, uint64_t))(v4 + 8))(&v6, v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  uint64_t result = v6;
  if (v1) {
    return outlined consume of Data._Representation(v6, *((unint64_t *)&v6 + 1));
  }
  return result;
}

Swift::Void __swiftcall BitCollection.appendLeastSignificantBits(from:count:)(Swift::UInt8 from, Swift::UInt8 count)
{
  if (!count) {
    return;
  }
  int v4 = 8 - count;
  if ((v4 & 0xFFFFFF00) != 0)
  {
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    JUMPOUT(0x41CF4);
  }
  if ((8 - count) <= 7u)
  {
    int v6 = from << v4;
    int v5 = *((unsigned __int8 *)v2 + 16);
    if ((v5 | 8) == 8) {
      goto LABEL_7;
    }
LABEL_12:
    uint64_t v7 = *v2;
    switch((unint64_t)v2[1] >> 62)
    {
      case 1uLL:
        if (!__OFSUB__(HIDWORD(v7), v7)) {
          goto LABEL_17;
        }
        goto LABEL_27;
      case 2uLL:
        uint64_t v9 = *(void *)(v7 + 16);
        uint64_t v8 = *(void *)(v7 + 24);
        BOOL v10 = __OFSUB__(v8, v9);
        uint64_t v11 = v8 - v9;
        if (v10) {
          goto LABEL_28;
        }
        if (__OFSUB__(v11, 1)) {
          goto LABEL_29;
        }
LABEL_17:
        Data.subscript.getter();
        Data._Representation.subscript.setter();
        char v12 = v5 + count;
        if ((((_WORD)v5 + count) & 0x100) != 0) {
          goto LABEL_25;
        }
        *((unsigned char *)v2 + 16) = v12;
        if ((v5 + count) <= 8u) {
          return;
        }
        unsigned __int8 v13 = v12 - 8;
        *((unsigned char *)v2 + 16) = v13;
        int v14 = count - v13;
        if ((v14 & 0xFFFFFF00) != 0) {
          goto LABEL_26;
        }
        if ((v14 & 0xF8) != 0) {
          LOBYTE(v6) = 0;
        }
        else {
          v6 <<= v14 & 7;
        }
        break;
      default:
        goto LABEL_17;
    }
    goto LABEL_8;
  }
  int v5 = *((unsigned __int8 *)v2 + 16);
  if ((v5 | 8) != 8)
  {
    int v6 = 0;
    goto LABEL_12;
  }
  LOBYTE(v6) = 0;
LABEL_7:
  *((unsigned char *)v2 + 16) = count;
LABEL_8:

  specialized RangeReplaceableCollection.append(_:)(v6);
}

uint64_t specialized RangeReplaceableCollection.append(_:)(char a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<UInt8>);
  uint64_t v5 = lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>((unint64_t *)&lazy protocol witness table cache variable for type CollectionOfOne<UInt8> and conformance <A> CollectionOfOne<A>, &demangling cache variable for type metadata for CollectionOfOne<UInt8>);
  LOBYTE(v3[0]) = a1;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  Data._Representation.replaceSubrange(_:with:count:)();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

uint64_t BitCollection.append(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Data.Iterator();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      outlined copy of Data._Representation(a1, a2);
      break;
    default:
      break;
  }
  Data.Iterator.init(_:at:)();
  while (1)
  {
    Swift::UInt8_optional v8 = Data.Iterator.next()();
    if ((*(_WORD *)&v8 & 0x100) != 0) {
      break;
    }
    BitCollection.appendLeastSignificantBits(from:count:)(v8.value, 8u);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Void __swiftcall BitCollection.appendVarint8(_:)(Swift::UInt a1)
{
  do
  {
    if (a1 >= 8) {
      Swift::UInt8 v2 = a1 & 7 | 8;
    }
    else {
      Swift::UInt8 v2 = a1 & 7;
    }
    BitCollection.appendLeastSignificantBits(from:count:)(v2, 4u);
    BOOL v3 = a1 >= 8;
    a1 >>= 3;
  }
  while (v3);
}

Swift::Void __swiftcall BitCollection.appendVarint64(_:)(Swift::UInt a1)
{
  do
  {
    if (a1 >= 0x40) {
      Swift::UInt8 v2 = a1 & 0x3F | 0x40;
    }
    else {
      Swift::UInt8 v2 = a1 & 0x3F;
    }
    BitCollection.appendLeastSignificantBits(from:count:)(v2, 7u);
    BOOL v3 = a1 >= 0x40;
    a1 >>= 6;
  }
  while (v3);
}

Swift::Void __swiftcall BitCollection.appendVarint128(_:)(Swift::UInt a1)
{
  do
  {
    BitCollection.appendLeastSignificantBits(from:count:)(a1 & 0x7F | ((a1 > 0x7F) << 7), 8u);
    BOOL v2 = a1 >= 0x80;
    a1 >>= 7;
  }
  while (v2);
}

Swift::Void __swiftcall BitCollection.append(_:)(Swift::Bool a1)
{
}

uint64_t BitCollection.append(_:)(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  unint64_t v6 = a2 >> 62;
  outlined copy of Data._Representation(a1, a2);
  unint64_t v7 = 0;
  BOOL v8 = __OFSUB__(HIDWORD(a1), a1);
  BOOL v26 = v8;
  uint64_t v27 = a2 & 0xFF000000000000;
  unint64_t v34 = BYTE6(a2);
  unint64_t v31 = a2 >> 16;
  unint64_t v32 = a2 >> 8;
  unint64_t v29 = HIDWORD(a2);
  unint64_t v30 = a2 >> 24;
  unint64_t v33 = a2;
  unint64_t v28 = a2 >> 40;
  while (2)
  {
    uint64_t v9 = a1 >> 32;
    uint64_t v10 = (int)a1;
    switch((int)v6)
    {
      case 1:
        goto LABEL_9;
      case 2:
        uint64_t v10 = *(void *)(a1 + 16);
        uint64_t v9 = *(void *)(a1 + 24);
LABEL_9:
        if (v10 == v9) {
          goto LABEL_10;
        }
        if (v6 == 2)
        {
          uint64_t v13 = *(void *)(a1 + 16);
          uint64_t v12 = *(void *)(a1 + 24);
          BOOL v14 = __OFSUB__(v12, v13);
          unint64_t v11 = v12 - v13;
          if (v14) {
            goto LABEL_50;
          }
        }
        else
        {
          unint64_t v11 = HIDWORD(a1) - (int)a1;
          if (v26) {
            goto LABEL_51;
          }
        }
LABEL_17:
        BOOL v14 = __OFSUB__(v11, 1);
        unint64_t v15 = v11 - 1;
        if (v14) {
          goto LABEL_41;
        }
        if ((v15 - 0x1000000000000000) >> 61 != 7) {
          goto LABEL_42;
        }
        BOOL v14 = __OFADD__(a3, 8 * v15);
        uint64_t v16 = a3 + 8 * v15;
        if (v14) {
          goto LABEL_43;
        }
        if (v7 != v16)
        {
LABEL_21:
          uint64_t v17 = v7 >> 3;
          switch((int)v6)
          {
            case 0:
              if (v17 >= v34) {
                goto LABEL_44;
              }
              uint64_t v35 = a1;
              char v36 = v33;
              char v37 = v32;
              char v38 = v31;
              char v39 = v30;
              char v40 = v29;
              char v41 = v28;
              unsigned int v18 = *((unsigned __int8 *)&v35 + v17);
              goto LABEL_35;
            case 1:
              if (v17 < (int)a1 || v17 >= a1 >> 32) {
                goto LABEL_46;
              }
              uint64_t v23 = __DataStorage._bytes.getter();
              if (!v23) {
                goto LABEL_54;
              }
              uint64_t v20 = v23;
              uint64_t v24 = __DataStorage._offset.getter();
              uint64_t v22 = v17 - v24;
              if (!__OFSUB__(v17, v24)) {
                goto LABEL_34;
              }
              goto LABEL_48;
            case 2:
              if (v17 < *(void *)(a1 + 16)) {
                goto LABEL_45;
              }
              if (v17 >= *(void *)(a1 + 24)) {
                goto LABEL_47;
              }
              uint64_t v19 = __DataStorage._bytes.getter();
              if (!v19) {
                goto LABEL_53;
              }
              uint64_t v20 = v19;
              uint64_t v21 = __DataStorage._offset.getter();
              uint64_t v22 = v17 - v21;
              if (__OFSUB__(v17, v21)) {
                goto LABEL_49;
              }
LABEL_34:
              unsigned int v18 = *(unsigned __int8 *)(v20 + v22);
LABEL_35:
              if (__OFADD__(v7, 1))
              {
                __break(1u);
LABEL_41:
                __break(1u);
LABEL_42:
                __break(1u);
LABEL_43:
                __break(1u);
LABEL_44:
                __break(1u);
LABEL_45:
                __break(1u);
LABEL_46:
                __break(1u);
LABEL_47:
                __break(1u);
LABEL_48:
                __break(1u);
LABEL_49:
                __break(1u);
LABEL_50:
                __break(1u);
LABEL_51:
                __break(1u);
LABEL_52:
                __break(1u);
LABEL_53:
                __break(1u);
LABEL_54:
                __break(1u);
              }
              BitCollection.appendLeastSignificantBits(from:count:)((v18 >> (v7++ & 7)) & 1, 1u);
              break;
            case 3:
              goto LABEL_52;
            default:
              JUMPOUT(0);
          }
          continue;
        }
LABEL_37:
        return outlined consume of Data._Representation(a1, v33);
      case 3:
        goto LABEL_10;
      default:
        unint64_t v11 = v34;
        if (v27) {
          goto LABEL_17;
        }
LABEL_10:
        if (!v7) {
          goto LABEL_37;
        }
        goto LABEL_21;
    }
  }
}

BOOL BitCollection.subscript.getter(uint64_t a1)
{
  if (a1 >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = a1 + 7;
  }
  uint64_t v2 = a1 - (v1 & 0xFFFFFFFFFFFFFFF8);
  char v3 = Data.subscript.getter();
  int v4 = 1 << v2;
  if (v2 < 0) {
    LOBYTE(v4) = 0;
  }
  return (v3 & v4) != 0;
}

uint64_t BitCollection.endIndex.getter(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (a1 ^ (unint64_t)(a1 << 32)) >> 32;
      if (v3) {
        goto LABEL_12;
      }
      return v3;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      if (v5 == v6) {
        return 0;
      }
      if (a2 >> 62 != 2) {
        goto LABEL_12;
      }
      BOOL v8 = __OFSUB__(v6, v5);
      uint64_t v4 = v6 - v5;
      if (!v8) {
        goto LABEL_14;
      }
      __break(1u);
LABEL_12:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_21;
      }
      uint64_t v4 = (int)v4;
      goto LABEL_14;
    case 3uLL:
      return v3;
    default:
      if ((a2 & 0xFF000000000000) == 0) {
        return 0;
      }
      uint64_t v4 = BYTE6(a2);
LABEL_14:
      BOOL v8 = __OFSUB__(v4, 1);
      uint64_t v9 = v4 - 1;
      if (v8)
      {
        __break(1u);
        goto LABEL_19;
      }
      if ((unint64_t)(v9 - 0x1000000000000000) >> 61 != 7)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v10 = 8 * v9;
      BOOL v8 = __OFADD__(v10, a3);
      uint64_t v3 = v10 + a3;
      if (v8)
      {
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x424F4);
      }
      return v3;
  }
}

Swift::Int __swiftcall BitCollection.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance BitCollection(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t protocol witness for Collection.endIndex.getter in conformance BitCollection@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = BitCollection.endIndex.getter(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *a1 = result;
  return result;
}

void (*protocol witness for Collection.subscript.read in conformance BitCollection(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  uint64_t v3 = BitCollection.subscript.read();
  v2[40] = v4 & 1;
  *((void *)v2 + 4) = v3;
  return protocol witness for Collection.subscript.read in conformance BitCollection;
}

void protocol witness for Collection.subscript.read in conformance BitCollection(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*BitCollection.subscript.read())(void, void, void)
{
  return LiteMessageHeader.messageType.getter;
}

uint64_t protocol witness for Collection.subscript.getter in conformance BitCollection@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = *(void *)v2;
  unint64_t v6 = *(void *)(v2 + 8);
  unsigned __int8 v8 = *(unsigned char *)(v2 + 16);
  uint64_t result = BitCollection.endIndex.getter(*(void *)v2, v6, v8);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result < v4)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  *(void *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v8;
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v4;

  return outlined copy of Data._Representation(v7, v6);
}

uint64_t protocol witness for Collection.indices.getter in conformance BitCollection@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = BitCollection.endIndex.getter(v2, v3, v4);

  return outlined copy of Data._Representation(v2, v3);
}

BOOL protocol witness for Collection.isEmpty.getter in conformance BitCollection()
{
  return BitCollection.endIndex.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16)) == 0;
}

uint64_t specialized Collection.count.getter(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (a1 ^ (unint64_t)(a1 << 32)) >> 32;
      if (v3) {
        goto LABEL_12;
      }
      return v3;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      if (v5 == v6) {
        return 0;
      }
      if (a2 >> 62 != 2) {
        goto LABEL_12;
      }
      BOOL v8 = __OFSUB__(v6, v5);
      uint64_t v4 = v6 - v5;
      if (!v8) {
        goto LABEL_14;
      }
      __break(1u);
LABEL_12:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_23;
      }
      uint64_t v4 = (int)v4;
      goto LABEL_14;
    case 3uLL:
      return v3;
    default:
      if ((a2 & 0xFF000000000000) == 0) {
        return 0;
      }
      uint64_t v4 = BYTE6(a2);
LABEL_14:
      BOOL v8 = __OFSUB__(v4, 1);
      uint64_t v9 = v4 - 1;
      if (v8) {
        goto LABEL_20;
      }
      if ((unint64_t)(v9 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_21;
      }
      uint64_t v10 = 8 * v9;
      BOOL v8 = __OFADD__(v10, a3);
      uint64_t v3 = v10 + a3;
      if (v8) {
        goto LABEL_22;
      }
      if (v3 < 0)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        JUMPOUT(0x42870);
      }
      return v3;
  }
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance BitCollection(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *protocol witness for Collection.index(_:offsetBy:) in conformance BitCollection@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = *result;
    if (!a2)
    {
LABEL_6:
      *a3 = v3;
      return result;
    }
    unint64_t v4 = v3 ^ 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = a2 - 1;
    while (v4 > v5)
    {
      ++v3;
      if (!--a2) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance BitCollection@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized Collection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection.distance(from:to:) in conformance BitCollection(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*a2 < *result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*a2 == *result) {
    return 0;
  }
  unint64_t v4 = (uint64_t *)(v3 - v2);
  if (v3 > v2)
  {
    uint64_t result = 0;
    unint64_t v5 = v3 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t result = (uint64_t *)((char *)result + 1);
      if (v4 == result) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance BitCollection(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance BitCollection(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection.index(after:) in conformance BitCollection@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance BitCollection(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

__n128 protocol witness for Sequence.makeIterator() in conformance BitCollection@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int8 v2 = v1[1].n128_u8[0];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u8[0] = v2;
  a1[1].n128_u64[1] = 0;
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance BitCollection()
{
  uint64_t result = BitCollection.endIndex.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
  if (result < 0) {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance BitCollection()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance BitCollection()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = specialized _copyCollectionToContiguousArray<A>(_:)(*(void *)v0, v2, *(unsigned char *)(v0 + 16));
  outlined consume of Data._Representation(v1, v2);
  return v3;
}

unint64_t protocol witness for Sequence._copyContents(initializing:) in conformance BitCollection(uint64_t a1, unsigned char *a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(void *)v3, *(void *)(v3 + 8), *(unsigned char *)(v3 + 16));
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance BitCollection()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t BitCollection.binaryString.getter(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  Swift::Int v3 = specialized Collection.count.getter(a1, a2, a3);

  return Data.binaryString(bitCount:)(v3)._countAndFlagsBits;
}

unint64_t lazy protocol witness table accessor for type BitCollection and conformance BitCollection()
{
  unint64_t result = lazy protocol witness table cache variable for type BitCollection and conformance BitCollection;
  if (!lazy protocol witness table cache variable for type BitCollection and conformance BitCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BitCollection and conformance BitCollection);
  }
  return result;
}

void *associated type witness table accessor for Collection.Index : Comparable in BitCollection()
{
  return &protocol witness table for Int;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in BitCollection()
{
  return lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type DefaultIndices<BitCollection> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<BitCollection>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in BitCollection()
{
  return lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type Slice<BitCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<BitCollection>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in BitCollection()
{
  return lazy protocol witness table accessor for type PredicateExpressions.Variable<LiteMessageSegmentStoreSchemaV1.LiteMessageSegment> and conformance PredicateExpressions.Variable<A>(&lazy protocol witness table cache variable for type IndexingIterator<BitCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<BitCollection>);
}

uint64_t destroy for BitCollection(uint64_t a1)
{
  return outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t initializeBufferWithCopyOfBuffer for BitCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for BitCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  outlined consume of Data._Representation(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for BitCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v4, v5);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitCollection(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for BitCollection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitCollection()
{
  return &type metadata for BitCollection;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  uint64_t result = BitCollection.endIndex.getter(a1, a2, a3);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v7 = result;
    if (result)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Bool>);
      uint64_t v8 = swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size((const void *)v8);
      *(void *)(v8 + 16) = v7;
      *(void *)(v8 + 24) = 2 * v9 - 64;
      outlined copy of Data._Representation(a1, a2);
      unint64_t v10 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v11, (unsigned char *)(v8 + 32), v7, a1, a2, a3);
      outlined consume of Data._Representation(v11[0], v11[1]);
      if (v10 == v7) {
        return v8;
      }
      __break(1u);
    }
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  __break(1u);
  return result;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, unsigned char *a2, unint64_t a3, uint64_t a4, unint64_t a5, unsigned __int8 a6)
{
  unsigned __int8 v6 = a6;
  if (!a2) {
    goto LABEL_43;
  }
  unint64_t v10 = a3;
  if (!a3) {
    goto LABEL_44;
  }
  if ((a3 & 0x8000000000000000) != 0) {
LABEL_60:
  }
    __break(1u);
  unint64_t v11 = a2;
  if (!BitCollection.endIndex.getter(a4, a5, a6))
  {
LABEL_43:
    unint64_t v10 = 0;
    goto LABEL_44;
  }
  *unint64_t v11 = Data.subscript.getter() & 1;
  if (v10 == 1) {
    goto LABEL_44;
  }
  unint64_t v12 = a5 >> 62;
  int64_t v13 = (int)a4;
  uint64_t v14 = a4 >> 32;
  BOOL v15 = __OFSUB__(HIDWORD(a4), a4);
  BOOL v36 = v15;
  unsigned __int8 v35 = v6;
  uint64_t v37 = v6;
  unint64_t v16 = 1;
  char v38 = v11;
  while (2)
  {
    if (v10 == v16)
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    unint64_t v17 = v16 + 1;
    uint64_t v18 = v14;
    int64_t v19 = v13;
    switch((int)v12)
    {
      case 1:
        goto LABEL_15;
      case 2:
        int64_t v19 = *(void *)(a4 + 16);
        uint64_t v18 = *(void *)(a4 + 24);
LABEL_15:
        if (v19 == v18) {
          goto LABEL_25;
        }
        if (v12 == 2)
        {
          uint64_t v23 = *(void *)(a4 + 16);
          uint64_t v22 = *(void *)(a4 + 24);
          BOOL v24 = __OFSUB__(v22, v23);
          uint64_t v20 = v22 - v23;
          if (v24) {
            goto LABEL_58;
          }
        }
        else
        {
          uint64_t v20 = HIDWORD(a4) - (int)a4;
          if (v36) {
            goto LABEL_59;
          }
        }
LABEL_21:
        BOOL v24 = __OFSUB__(v20, 1);
        uint64_t v25 = v20 - 1;
        if (v24) {
          goto LABEL_49;
        }
        if ((unint64_t)(v25 - 0x1000000000000000) >> 61 != 7) {
          goto LABEL_50;
        }
        BOOL v24 = __OFADD__(v37, 8 * v25);
        uint64_t v26 = v37 + 8 * v25;
        if (v24) {
          goto LABEL_51;
        }
        if (v16 != v26)
        {
LABEL_25:
          int64_t v21 = v16 >> 3;
          if (v12)
          {
            if (v12 == 1)
            {
              if (v21 < v13 || v21 >= v14) {
                goto LABEL_53;
              }
              uint64_t v27 = __DataStorage._bytes.getter();
              if (!v27)
              {
LABEL_62:
                __break(1u);
LABEL_63:
                __break(1u);
                JUMPOUT(0x43210);
              }
              uint64_t v28 = v27;
              uint64_t v29 = __DataStorage._offset.getter();
              int64_t v30 = v21 - v29;
              if (__OFSUB__(v21, v29)) {
                goto LABEL_55;
              }
            }
            else
            {
              if (v21 < *(void *)(a4 + 16)) {
                goto LABEL_54;
              }
              if (v21 >= *(void *)(a4 + 24)) {
                goto LABEL_56;
              }
              uint64_t v32 = __DataStorage._bytes.getter();
              if (!v32) {
                goto LABEL_63;
              }
              uint64_t v28 = v32;
              uint64_t v33 = __DataStorage._offset.getter();
              int64_t v30 = v21 - v33;
              if (__OFSUB__(v21, v33)) {
                goto LABEL_57;
              }
            }
            unsigned int v31 = *(unsigned __int8 *)(v28 + v30);
            unint64_t v11 = v38;
            uint64_t v14 = a4 >> 32;
            int64_t v13 = (int)a4;
          }
          else
          {
LABEL_33:
            if (v21 >= (unint64_t)BYTE6(a5)) {
              goto LABEL_52;
            }
            v39[0] = v13;
            v39[1] = BYTE1(a4);
            void v39[2] = BYTE2(a4);
            v39[3] = BYTE3(a4);
            v39[4] = BYTE4(a4);
            v39[5] = BYTE5(a4);
            v39[6] = BYTE6(a4);
            v39[7] = HIBYTE(a4);
            __int16 v40 = a5;
            char v41 = BYTE2(a5);
            char v42 = BYTE3(a5);
            char v43 = BYTE4(a5);
            char v44 = BYTE5(a5);
            unsigned int v31 = v39[v21];
          }
          if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_48;
          }
          v11[v16] = (v31 >> (v16 & 7)) & 1;
          ++v16;
          if (v10 == v17) {
            goto LABEL_46;
          }
          continue;
        }
        unint64_t v10 = v16;
LABEL_46:
        unsigned __int8 v6 = v35;
LABEL_44:
        *(void *)a1 = a4;
        *(void *)(a1 + 8) = a5;
        *(unsigned char *)(a1 + 16) = v6;
        *(void *)(a1 + 24) = v10;
        return v10;
      case 3:
        __break(1u);
        goto LABEL_62;
      default:
        uint64_t v20 = BYTE6(a5);
        if ((a5 & 0xFF000000000000) != 0) {
          goto LABEL_21;
        }
        int64_t v21 = v16 >> 3;
        goto LABEL_33;
    }
  }
}

uint64_t specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  if (a2)
  {
    unint64_t v3 = a3 - result;
    if (a3 - result >= (unint64_t)(a2 - 1)) {
      unint64_t v3 = a2 - 1;
    }
    if (v3 >= (result ^ 0x7FFFFFFFFFFFFFFFuLL)) {
      unint64_t v3 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v4 = v3 + 1;
    if (v4 >= 5)
    {
      uint64_t v7 = v4 & 3;
      if ((v4 & 3) == 0) {
        uint64_t v7 = 4;
      }
      unint64_t v5 = v4 - v7;
      int64x2_t v8 = 0uLL;
      int64x2_t v9 = (int64x2_t)(unint64_t)result;
      int64x2_t v10 = vdupq_n_s64(1uLL);
      unint64_t v11 = v5;
      do
      {
        int64x2_t v8 = vaddq_s64(v8, v10);
        int64x2_t v9 = vaddq_s64(v9, v10);
        v11 -= 4;
      }
      while (v11);
      uint64_t v6 = vaddvq_s64(vaddq_s64(vzip2q_s64(v9, v8), vzip1q_s64(v9, v8)));
    }
    else
    {
      unint64_t v5 = 0;
      uint64_t v6 = result;
    }
    uint64_t v12 = v5 + result - 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = v5 + result - a3;
    uint64_t v14 = a2 - v5;
    uint64_t result = v6;
    while (1)
    {
      if (!v13) {
        return 0;
      }
      if (!v12) {
        break;
      }
      ++result;
      ++v12;
      ++v13;
      if (!--v14) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  static Logger.messagesSubsystem.getter();
  return Logger.init(subsystem:category:)();
}

unint64_t BitCollectionMessageContentError.errorDescription.getter(uint64_t a1, void *a2, char a3)
{
  if (!a3)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease();
    unint64_t v9 = 0xD000000000000021;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    unint64_t v9 = 0;
    _StringGuts.grow(_:)(58);
    v5._uint64_t countAndFlagsBits = 0xD000000000000035;
    v5._object = (void *)0x8000000000049610;
    String.append(_:)(v5);
LABEL_5:
    v6._uint64_t countAndFlagsBits = a1;
    v6._object = a2;
    String.append(_:)(v6);
    v7._uint64_t countAndFlagsBits = 3025191;
    v7._object = (void *)0xE300000000000000;
    String.append(_:)(v7);
    return v9;
  }
  return 0xD000000000000027;
}

unint64_t protocol witness for LocalizedError.errorDescription.getter in conformance BitCollectionMessageContentError()
{
  return BitCollectionMessageContentError.errorDescription.getter(*(void *)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BitCollection.appendAsCompressedBytes(_:)(Swift::String a1)
{
  unint64_t object = (unint64_t)a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for Data.Iterator();
  uint64_t v43 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for String.Encoding();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  int64x2_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = HIBYTE(object) & 0xF;
  if ((object & 0x2000000000000000) == 0) {
    uint64_t v11 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (!v11)
  {
    BitCollection.appendLeastSignificantBits(from:count:)(0, 8u);
    return;
  }
  uint64_t v41 = v4;
  uint64_t v42 = v1;
  static String.Encoding.utf8.getter();
  uint64_t v12 = String.data(using:allowLossyConversion:)();
  unint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v14 >> 60 == 15)
  {
    lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError();
    swift_allocError();
    *(void *)uint64_t v15 = 0;
    *(void *)(v15 + 8) = 0;
    *(unsigned char *)(v15 + 16) = 2;
    swift_willThrow();
    return;
  }
  if ((specialized BitCollection.allowCompression.getter() & 1) == 0
    || (id v16 = [self sharedCompressor],
        uint64_t v17 = IMDLiteMessageCompressor.compress(_:)(),
        unint64_t v19 = v18,
        unint64_t v21 = v20,
        v16,
        v19 >> 60 == 15))
  {
    outlined copy of Data._Representation(v12, v14);
    unint64_t v21 = 0;
    uint64_t v17 = v12;
    unint64_t v19 = v14;
  }
  unint64_t v40 = v21;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)logger);
  outlined copy of Data?(v12, v14);
  unint64_t v23 = v19 >> 62;
  outlined copy of Data._Representation(v17, v19);
  BOOL v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v39 = v19 >> 62;
    unint64_t v23 = swift_slowAlloc();
    *(_DWORD *)unint64_t v23 = 134218496;
    unint64_t v44 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v23 + 12) = 2048;
    unint64_t v26 = 0;
    switch(v14 >> 62)
    {
      case 1uLL:
        LODWORD(v26) = HIDWORD(v12) - v12;
        if (__OFSUB__(HIDWORD(v12), v12)) {
          goto LABEL_42;
        }
        unint64_t v26 = (int)v26;
LABEL_19:
        unint64_t v44 = v26;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        outlined consume of Data?(v12, v14);
        *(_WORD *)(v23 + 22) = 2048;
        unint64_t v30 = 0;
        switch((int)v39)
        {
          case 1:
            LODWORD(v30) = HIDWORD(v17) - v17;
            if (__OFSUB__(HIDWORD(v17), v17)) {
              goto LABEL_44;
            }
            unint64_t v30 = (int)v30;
LABEL_24:
            unint64_t v44 = v30;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            outlined consume of Data._Representation(v17, v19);
            _os_log_impl(&def_3494C, v24, v25, "Compressor chose codec %ld, shrunk %ld bytes to %ld", (uint8_t *)v23, 0x20u);
            swift_slowDealloc();
            LODWORD(v23) = v39;
            break;
          case 2:
            uint64_t v32 = *(void *)(v17 + 16);
            uint64_t v31 = *(void *)(v17 + 24);
            BOOL v29 = __OFSUB__(v31, v32);
            unint64_t v30 = v31 - v32;
            if (!v29) {
              goto LABEL_24;
            }
            goto LABEL_45;
          case 3:
            goto LABEL_24;
          default:
            unint64_t v30 = BYTE6(v19);
            goto LABEL_24;
        }
        break;
      case 2uLL:
        uint64_t v28 = *(void *)(v12 + 16);
        uint64_t v27 = *(void *)(v12 + 24);
        BOOL v29 = __OFSUB__(v27, v28);
        unint64_t v26 = v27 - v28;
        if (!v29) {
          goto LABEL_19;
        }
        goto LABEL_43;
      case 3uLL:
        goto LABEL_19;
      default:
        unint64_t v26 = BYTE6(v14);
        goto LABEL_19;
    }
  }
  else
  {
    outlined consume of Data?(v12, v14);
    outlined consume of Data._Representation(v17, v19);
  }

  unint64_t v33 = 0;
  switch((int)v23)
  {
    case 0:
      unint64_t v33 = BYTE6(v19);
      goto LABEL_31;
    case 1:
      if (__OFSUB__(HIDWORD(v17), v17))
      {
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        JUMPOUT(0x43AE4);
      }
      unint64_t v33 = HIDWORD(v17) - (int)v17;
LABEL_30:
      if ((v33 & 0x8000000000000000) != 0) {
        goto LABEL_46;
      }
      do
      {
LABEL_31:
        BitCollection.appendLeastSignificantBits(from:count:)(v33 & 0x7F | ((v33 > 0x7F) << 7), 8u);
        BOOL v36 = v33 > 0x7F;
        v33 >>= 7;
      }
      while (v36);
      if ((v40 & 0x8000000000000000) != 0 || v40 >= 0x100) {
        goto LABEL_46;
      }
      BitCollection.appendLeastSignificantBits(from:count:)(v40, 4u);
      switch((int)v23)
      {
        case 1:
        case 2:
          outlined copy of Data._Representation(v17, v19);
          break;
        default:
          break;
      }
      Data.Iterator.init(_:at:)();
      while (1)
      {
        Swift::UInt8_optional v37 = Data.Iterator.next()();
        if ((*(_WORD *)&v37 & 0x100) != 0) {
          break;
        }
        BitCollection.appendLeastSignificantBits(from:count:)(v37.value, 8u);
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v41);
      outlined consume of Data._Representation(v17, v19);
      outlined consume of Data?(v12, v14);
      return;
    case 2:
      uint64_t v35 = *(void *)(v17 + 16);
      uint64_t v34 = *(void *)(v17 + 24);
      unint64_t v33 = v34 - v35;
      if (!__OFSUB__(v34, v35)) {
        goto LABEL_30;
      }
      goto LABEL_41;
    case 3:
      goto LABEL_31;
    default:
      JUMPOUT(0);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BitCollection.appendAsUTF8Bytes(_:)(Swift::String a1)
{
  uint64_t v14 = type metadata accessor for Data.Iterator();
  uint64_t v1 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  uint64_t v8 = String.data(using:allowLossyConversion:)();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10 >> 60 == 15)
  {
    lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError();
    swift_allocError();
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 2;
    swift_willThrow();
  }
  else
  {
    switch(v10 >> 62)
    {
      case 1uLL:
      case 2uLL:
        outlined copy of Data._Representation(v8, v10);
        break;
      default:
        break;
    }
    Data.Iterator.init(_:at:)();
    while (1)
    {
      Swift::UInt8_optional v12 = Data.Iterator.next()();
      if ((*(_WORD *)&v12 & 0x100) != 0) {
        break;
      }
      BitCollection.appendLeastSignificantBits(from:count:)(v12.value, 8u);
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v14);
    outlined consume of Data?(v8, v10);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BitCollection.appendAsVarint8PrefixedUTF8Bytes(_:)(Swift::String a1)
{
  uint64_t v21 = type metadata accessor for Data.Iterator();
  uint64_t v20 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for String.Encoding();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  uint64_t v7 = String.data(using:allowLossyConversion:)();
  unint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v9 >> 60 == 15)
  {
    lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError();
    swift_allocError();
    *(void *)uint64_t v10 = 0;
    *(void *)(v10 + 8) = 0;
    *(unsigned char *)(v10 + 16) = 2;
    swift_willThrow();
    return;
  }
  Swift::UInt8 v11 = 0;
  unint64_t v12 = 0;
  switch(v9 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v7), v7))
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        JUMPOUT(0x440F8);
      }
      unint64_t v12 = HIDWORD(v7) - (int)v7;
LABEL_8:
      if ((v12 & 0x8000000000000000) != 0) {
        goto LABEL_26;
      }
LABEL_9:
      Swift::UInt8 v11 = v12 & 7;
LABEL_10:
      if (v12 >= 8) {
        Swift::UInt8 v15 = v11 | 8;
      }
      else {
        Swift::UInt8 v15 = v11;
      }
      BitCollection.appendLeastSignificantBits(from:count:)(v15, 4u);
      if (v12 >= 8)
      {
        do
        {
          if (v12 >= 0x40) {
            Swift::UInt8 v16 = (v12 >> 3) & 7 | 8;
          }
          else {
            Swift::UInt8 v16 = (v12 >> 3) & 7;
          }
          BitCollection.appendLeastSignificantBits(from:count:)(v16, 4u);
          BOOL v17 = v12 > 0x3F;
          v12 >>= 3;
        }
        while (v17);
      }
      switch(v9 >> 62)
      {
        case 1uLL:
        case 2uLL:
          outlined copy of Data._Representation(v7, v9);
          break;
        default:
          break;
      }
      Data.Iterator.init(_:at:)();
      while (1)
      {
        Swift::UInt8_optional v18 = Data.Iterator.next()();
        if ((*(_WORD *)&v18 & 0x100) != 0) {
          break;
        }
        BitCollection.appendLeastSignificantBits(from:count:)(v18.value, 8u);
      }
      (*(void (**)(char *, uint64_t))(v20 + 8))(v2, v21);
      outlined consume of Data?(v7, v9);
      return;
    case 2uLL:
      uint64_t v14 = *(void *)(v7 + 16);
      uint64_t v13 = *(void *)(v7 + 24);
      unint64_t v12 = v13 - v14;
      if (!__OFSUB__(v13, v14)) {
        goto LABEL_8;
      }
      goto LABEL_25;
    case 3uLL:
      goto LABEL_10;
    default:
      unint64_t v12 = BYTE6(v9);
      goto LABEL_9;
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BitCollection.appendAsNullTerminatedUTF8Bytes(_:)(Swift::String a1)
{
  uint64_t v17 = type metadata accessor for Data.Iterator();
  uint64_t v1 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  uint64_t v8 = String.data(using:allowLossyConversion:)();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10 >> 60 == 15)
  {
    lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError();
    swift_allocError();
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 2;
    swift_willThrow();
  }
  else
  {
    uint64_t v20 = v8;
    unint64_t v21 = v10;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<UInt8>);
    void v19[3] = v12;
    v19[4] = lazy protocol witness table accessor for type CollectionOfOne<UInt8> and conformance <A> CollectionOfOne<A>();
    LOBYTE(v19[0]) = 0;
    char v18 = *(unsigned char *)__swift_project_boxed_opaque_existential_1(v19, v12);
    Data._Representation.replaceSubrange(_:with:count:)();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    uint64_t v13 = v20;
    unint64_t v14 = v21;
    switch(v21 >> 62)
    {
      case 1uLL:
      case 2uLL:
        outlined copy of Data._Representation(v20, v21);
        outlined copy of Data._Representation(v13, v14);
        break;
      default:
        break;
    }
    Data.Iterator.init(_:at:)();
    while (1)
    {
      Swift::UInt8_optional v15 = Data.Iterator.next()();
      if ((*(_WORD *)&v15 & 0x100) != 0) {
        break;
      }
      BitCollection.appendLeastSignificantBits(from:count:)(v15.value, 8u);
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v17);
    outlined consume of Data._Representation(v13, v14);
    outlined consume of Data._Representation(v20, v21);
  }
}

uint64_t BitCollection.append16UUIDBytes(_:)(unsigned char *a1)
{
  uint64_t v2 = type metadata accessor for Data.Iterator();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(*(void *)(type metadata accessor for UUID() - 8) + 64);
  if (v6 >= 16) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = specialized Data.init(bytes:count:)(a1, v7);
  uint64_t v10 = v8;
  unint64_t v11 = v9;
  switch(v9 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(v8) - v8;
      if (__OFSUB__(HIDWORD(v8), v8))
      {
        __break(1u);
LABEL_19:
        __break(1u);
        JUMPOUT(0x4468CLL);
      }
      uint64_t v12 = (int)v12;
LABEL_9:
      if (v12 == 16)
      {
        if (v9 >> 62) {
          outlined copy of Data._Representation(v8, v9);
        }
        Data.Iterator.init(_:at:)();
        while (1)
        {
          Swift::UInt8_optional v20 = Data.Iterator.next()();
          if ((*(_WORD *)&v20 & 0x100) != 0) {
            break;
          }
          BitCollection.appendLeastSignificantBits(from:count:)(v20.value, 8u);
        }
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      else
      {
LABEL_12:
        uint64_t v16 = UUID.uuidString.getter();
        uint64_t v18 = v17;
        lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError();
        swift_allocError();
        *(void *)uint64_t v19 = v16;
        *(void *)(v19 + 8) = v18;
        *(unsigned char *)(v19 + 16) = 1;
        swift_willThrow();
      }
      return outlined consume of Data._Representation(v10, v11);
    case 2uLL:
      uint64_t v14 = *(void *)(v8 + 16);
      uint64_t v13 = *(void *)(v8 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_9;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_12;
    default:
      uint64_t v12 = BYTE6(v9);
      goto LABEL_9;
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BitCollection.append16UUIDBytes(_:)(Swift::String a1)
{
  unint64_t object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init(uuidString:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    outlined destroy of UUID?((uint64_t)v5);
    lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError();
    swift_allocError();
    *(void *)uint64_t v10 = countAndFlagsBits;
    *(void *)(v10 + 8) = object;
    *(unsigned char *)(v10 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
  }
  else
  {
    (*(void (**)(unsigned char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    BitCollection.append16UUIDBytes(_:)(v9);
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

unint64_t lazy protocol witness table accessor for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError()
{
  unint64_t result = lazy protocol witness table cache variable for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError;
  if (!lazy protocol witness table cache variable for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BitCollectionMessageContentError and conformance BitCollectionMessageContentError);
  }
  return result;
}

id specialized BitCollection.allowCompression.getter()
{
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = [result isInternalInstall];

    if (v2)
    {
      NSString v3 = String._bridgeToObjectiveC()();
      NSString v4 = String._bridgeToObjectiveC()();
      int v5 = IMGetDomainBoolForKey();

      return (id)(v5 ^ 1u);
    }
    else
    {
      return &def_3494C + 1;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
}

unint64_t lazy protocol witness table accessor for type CollectionOfOne<UInt8> and conformance <A> CollectionOfOne<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type CollectionOfOne<UInt8> and conformance <A> CollectionOfOne<A>;
  if (!lazy protocol witness table cache variable for type CollectionOfOne<UInt8> and conformance <A> CollectionOfOne<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for CollectionOfOne<UInt8>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CollectionOfOne<UInt8> and conformance <A> CollectionOfOne<A>);
  }
  return result;
}

uint64_t specialized Data.init(bytes:count:)(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  type metadata accessor for Data.RangeReference();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BitCollectionMessageContentError()
{
  return &type metadata for BitCollectionMessageContentError;
}

Swift::String __swiftcall Data.binaryString(bitCount:)(Swift::Int bitCount)
{
  unint64_t v3 = v1;
  NSString v4 = (void *)0xE000000000000000;
  uint64_t v55 = 0;
  unint64_t v56 = 0xE000000000000000;
  unint64_t v50 = v2;
  unint64_t v5 = v2 >> 62;
  uint64_t v7 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v3), v3)) {
        goto LABEL_65;
      }
      uint64_t v8 = HIDWORD(v3) - (int)v3;
LABEL_6:
      if (v8 < 0) {
        goto LABEL_64;
      }
LABEL_7:
      uint64_t v7 = 0;
      if (!v8 || bitCount < 1) {
        goto LABEL_69;
      }
      int64_t v11 = 0;
      uint64_t v48 = (uint64_t)v3 >> 32;
      int64_t v49 = (int)v3;
      unint64_t v47 = HIDWORD(v3);
      BOOL v12 = __OFSUB__(HIDWORD(v3), v3);
      BOOL v35 = v12;
      uint64_t v34 = HIDWORD(v3) - (int)v3;
      uint64_t v13 = 1;
      unint64_t v45 = v3 >> 16;
      unint64_t v46 = v3 >> 8;
      unint64_t v43 = v3 >> 40;
      unint64_t v44 = v3 >> 24;
      unint64_t v41 = HIBYTE(v3);
      unint64_t v42 = HIWORD(v3);
      unint64_t v39 = v2 >> 16;
      unint64_t v40 = v2 >> 8;
      unint64_t v37 = HIDWORD(v2);
      unint64_t v38 = v2 >> 24;
      unint64_t v36 = v2 >> 40;
      unint64_t v52 = v2 >> 62;
      unint64_t v53 = v3;
      uint64_t v51 = v8;
      while (2)
      {
        if (v5)
        {
          if (v5 == 1)
          {
            if (v11 < v49 || v11 >= v48)
            {
LABEL_56:
              __break(1u);
              goto LABEL_57;
            }
            uint64_t v14 = __DataStorage._bytes.getter();
            if (!v14)
            {
LABEL_67:
              __break(1u);
LABEL_68:
              __break(1u);
            }
            uint64_t v15 = v14;
            uint64_t v16 = __DataStorage._offset.getter();
            int64_t v17 = v11 - v16;
            if (__OFSUB__(v11, v16)) {
              goto LABEL_59;
            }
          }
          else
          {
            if (v11 < *(void *)(v3 + 16))
            {
LABEL_58:
              __break(1u);
LABEL_59:
              __break(1u);
              goto LABEL_60;
            }
            if (v11 >= *(void *)(v3 + 24))
            {
LABEL_60:
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
LABEL_63:
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
              goto LABEL_67;
            }
            uint64_t v19 = __DataStorage._bytes.getter();
            if (!v19) {
              goto LABEL_68;
            }
            uint64_t v15 = v19;
            uint64_t v20 = __DataStorage._offset.getter();
            int64_t v17 = v11 - v20;
            if (__OFSUB__(v11, v20)) {
              goto LABEL_61;
            }
          }
          unsigned int v18 = *(unsigned __int8 *)(v15 + v17);
        }
        else
        {
          if (v11 >= (unint64_t)BYTE6(v50))
          {
LABEL_57:
            __break(1u);
            goto LABEL_58;
          }
          LOBYTE(v54._countAndFlagsBits) = v3;
          BYTE1(v54._countAndFlagsBits) = v46;
          BYTE2(v54._countAndFlagsBits) = v45;
          BYTE3(v54._countAndFlagsBits) = v44;
          BYTE4(v54._countAndFlagsBits) = v47;
          BYTE5(v54._countAndFlagsBits) = v43;
          BYTE6(v54._countAndFlagsBits) = v42;
          HIBYTE(v54._countAndFlagsBits) = v41;
          LOBYTE(v54._object) = v50;
          BYTE1(v54._object) = v40;
          BYTE2(v54._object) = v39;
          BYTE3(v54._object) = v38;
          BYTE4(v54._object) = v37;
          BYTE5(v54._object) = v36;
          unsigned int v18 = *((unsigned __int8 *)&v54._countAndFlagsBits + v11);
        }
        unsigned __int8 v21 = 0;
        if (bitCount >= 8) {
          Swift::Int v22 = 8;
        }
        else {
          Swift::Int v22 = bitCount;
        }
        v54._uint64_t countAndFlagsBits = 0;
        v54._unint64_t object = (void *)0xE000000000000000;
        do
        {
          if (v21 >= v22)
          {
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
            goto LABEL_56;
          }
          int v23 = 7 - v21;
          if ((v23 & 0xFFFFFF00) != 0) {
            goto LABEL_54;
          }
          ++v21;
          if ((v18 >> v23)) {
            uint64_t v24 = 49;
          }
          else {
            uint64_t v24 = 48;
          }
          if ((v23 & 0xF8) != 0) {
            uint64_t v25 = 48;
          }
          else {
            uint64_t v25 = v24;
          }
          unint64_t v26 = 0xE100000000000000;
          String.append(_:)(*(Swift::String *)&v25);
          swift_bridgeObjectRelease();
        }
        while (v21 != v22);
        String.append(_:)(v54);
        swift_bridgeObjectRelease();
        LODWORD(v5) = v52;
        unint64_t v3 = v53;
        uint64_t v27 = 0;
        switch((int)v52)
        {
          case 1:
            uint64_t v27 = v34;
            if (v35) {
              goto LABEL_62;
            }
            goto LABEL_46;
          case 2:
            uint64_t v29 = *(void *)(v53 + 16);
            uint64_t v28 = *(void *)(v53 + 24);
            BOOL v30 = __OFSUB__(v28, v29);
            uint64_t v27 = v28 - v29;
            if (!v30) {
              goto LABEL_46;
            }
            goto LABEL_63;
          case 3:
            goto LABEL_46;
          default:
            uint64_t v27 = BYTE6(v50);
LABEL_46:
            BOOL v30 = __OFSUB__(v27, 1);
            int64_t v31 = v27 - 1;
            if (v30) {
              goto LABEL_55;
            }
            if (v11 < v31)
            {
              v32._uint64_t countAndFlagsBits = 32;
              v32._unint64_t object = (void *)0xE100000000000000;
              String.append(_:)(v32);
            }
            if (v13 != v51)
            {
              bitCount -= v22;
              int64_t v11 = v13++;
              if (bitCount > 0) {
                continue;
              }
            }
            uint64_t v7 = v55;
            NSString v4 = (void *)v56;
            break;
        }
        break;
      }
LABEL_69:
      result._unint64_t object = v4;
      result._uint64_t countAndFlagsBits = v7;
      return result;
    case 2uLL:
      uint64_t v10 = *(void *)(v3 + 16);
      uint64_t v9 = *(void *)(v3 + 24);
      uint64_t v8 = v9 - v10;
      if (!__OFSUB__(v9, v10)) {
        goto LABEL_6;
      }
      goto LABEL_66;
    case 3uLL:
      goto LABEL_69;
    default:
      uint64_t v8 = BYTE6(v2);
      goto LABEL_7;
  }
}

uint64_t Data.binaryString.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v2) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_9;
      }
      uint64_t v2 = (int)v2;
LABEL_6:
      if ((unint64_t)(v2 - 0x1000000000000000) >> 61 != 7)
      {
        __break(1u);
LABEL_9:
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x44F68);
      }
      return Data.binaryString(bitCount:)(8 * v2)._countAndFlagsBits;
    case 2uLL:
      uint64_t v4 = *(void *)(a1 + 16);
      uint64_t v3 = *(void *)(a1 + 24);
      BOOL v5 = __OFSUB__(v3, v4);
      uint64_t v2 = v3 - v4;
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      return Data.binaryString(bitCount:)(8 * v2)._countAndFlagsBits;
    default:
      uint64_t v2 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t BitCollection.append(_:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(v1, v2, v3);
}

void __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke_cold_1()
{
}

void IDSLibrary_cold_1(void *a1)
{
}

void __getIDSOffGridServiceUpdateMessageClass_block_invoke_cold_1()
{
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t SortDescriptor.init<A>(_:order:)()
{
  return SortDescriptor.init<A>(_:order:)();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._unint64_t object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
}

uint64_t static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)()
{
  return static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
}

uint64_t static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
}

uint64_t type metadata accessor for PredicateExpressions.ComparisonOperator()
{
  return type metadata accessor for PredicateExpressions.ComparisonOperator();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.subscript.setter()
{
  return Data._Representation.subscript.setter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._unint64_t object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

Swift::UInt8_optional __swiftcall Data.Iterator.next()()
{
  return (Swift::UInt8_optional)Data.Iterator.next()();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return Data.Iterator.init(_:at:)();
}

uint64_t Data.subscript.getter()
{
  return Data.subscript.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Predicate.init(_:)()
{
  return Predicate.init(_:)();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t AsyncSerialQueue.perform(_:)()
{
  return AsyncSerialQueue.perform(_:)();
}

uint64_t AsyncSerialQueue.init(priority:bufferingPolicy:)()
{
  return AsyncSerialQueue.init(priority:bufferingPolicy:)();
}

uint64_t type metadata accessor for AsyncSerialQueue()
{
  return type metadata accessor for AsyncSerialQueue();
}

uint64_t static Logger.messagesSubsystem.getter()
{
  return static Logger.messagesSubsystem.getter();
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

uint64_t dispatch thunk of BackingData.setValue<A>(forKey:to:)()
{
  return dispatch thunk of BackingData.setValue<A>(forKey:to:)();
}

uint64_t dispatch thunk of ModelContext.fetchCount<A>(_:)()
{
  return dispatch thunk of ModelContext.fetchCount<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.save()()
{
  return dispatch thunk of ModelContext.save()();
}

uint64_t dispatch thunk of ModelContext.fetch<A>(_:)()
{
  return dispatch thunk of ModelContext.fetch<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.delete<A>(model:where:includeSubclasses:)()
{
  return dispatch thunk of ModelContext.delete<A>(model:where:includeSubclasses:)();
}

uint64_t dispatch thunk of ModelContext.insert<A>(_:)()
{
  return dispatch thunk of ModelContext.insert<A>(_:)();
}

uint64_t type metadata accessor for ModelContext()
{
  return type metadata accessor for ModelContext();
}

uint64_t ModelContext.init(_:)()
{
  return ModelContext.init(_:)();
}

uint64_t ModelContainer.__allocating_init(for:migrationPlan:configurations:)()
{
  return ModelContainer.__allocating_init(for:migrationPlan:configurations:)();
}

uint64_t type metadata accessor for ModelContainer()
{
  return type metadata accessor for ModelContainer();
}

uint64_t FetchDescriptor.init(predicate:sortBy:)()
{
  return FetchDescriptor.init(predicate:sortBy:)();
}

uint64_t static PersistentModel.createBackingData<A>()()
{
  return static PersistentModel.createBackingData<A>()();
}

uint64_t PersistentModel.id.getter()
{
  return PersistentModel.id.getter();
}

uint64_t PersistentModel.hash(into:)()
{
  return PersistentModel.hash(into:)();
}

uint64_t PersistentModel.getValue<A>(forKey:)()
{
  return PersistentModel.getValue<A>(forKey:)();
}

uint64_t PersistentModel.setValue<A>(forKey:to:)()
{
  return PersistentModel.setValue<A>(forKey:to:)();
}

uint64_t static ModelConfiguration.CloudKitDatabase.none.getter()
{
  return static ModelConfiguration.CloudKitDatabase.none.getter();
}

uint64_t type metadata accessor for ModelConfiguration.CloudKitDatabase()
{
  return type metadata accessor for ModelConfiguration.CloudKitDatabase();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return type metadata accessor for ModelConfiguration();
}

uint64_t ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)()
{
  return ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
}

uint64_t Schema.__allocating_init(versionedSchema:)()
{
  return Schema.__allocating_init(versionedSchema:)();
}

uint64_t Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)()
{
  return Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
}

uint64_t type metadata accessor for Schema.PropertyMetadata()
{
  return type metadata accessor for Schema.PropertyMetadata();
}

uint64_t type metadata accessor for Schema.Version()
{
  return type metadata accessor for Schema.Version();
}

uint64_t Schema.Version.init(_:_:_:)()
{
  return Schema.Version.init(_:_:_:)();
}

uint64_t type metadata accessor for Schema()
{
  return type metadata accessor for Schema();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)()
{
  return RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)();
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

uint64_t FAFamilyMember.allKnownHandles.getter()
{
  return FAFamilyMember.allKnownHandles.getter();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t IMDLiteMessageCompressor.compress(_:)()
{
  return IMDLiteMessageCompressor.compress(_:)();
}

uint64_t NSCoder.decodeObject(of:forKey:)()
{
  return NSCoder.decodeObject(of:forKey:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
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

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

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

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

NSNumber __swiftcall UInt32._bridgeToObjectiveC()()
{
  return (NSNumber)UInt32._bridgeToObjectiveC()();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return _CMFBlockListIsItemBlocked();
}

uint64_t CreateCMFItemFromString()
{
  return _CreateCMFItemFromString();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return _IDSCopyIDForTokenWithID();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return _IDSCopyLocalDeviceUniqueID();
}

uint64_t IMAssociatedMessageDecodeGUID()
{
  return _IMAssociatedMessageDecodeGUID();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return _IMBalloonExtensionIDWithSuffix();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return _IMChatCanonicalIDSIDsForAddress();
}

uint64_t IMExtensionPayloadUnarchivingClasses()
{
  return _IMExtensionPayloadUnarchivingClasses();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return _IMGetCachedDomainBoolForKey();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
}

uint64_t IMGetDomainIntForKey()
{
  return _IMGetDomainIntForKey();
}

uint64_t IMGetDomainValueForKey()
{
  return _IMGetDomainValueForKey();
}

uint64_t IMMessageThreadIdentifierGetOriginatorGUID()
{
  return _IMMessageThreadIdentifierGetOriginatorGUID();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMSMSDirectoryURL()
{
  return _IMSMSDirectoryURL();
}

uint64_t IMSetDomainIntForKey()
{
  return _IMSetDomainIntForKey();
}

uint64_t IMSetDomainValueForKey()
{
  return _IMSetDomainValueForKey();
}

uint64_t IMStringIsPhoneNumber()
{
  return _IMStringIsPhoneNumber();
}

uint64_t IMUTTypeIsAudio()
{
  return _IMUTTypeIsAudio();
}

uint64_t IMUTTypeIsCalendar()
{
  return _IMUTTypeIsCalendar();
}

uint64_t IMUTTypeIsImage()
{
  return _IMUTTypeIsImage();
}

uint64_t IMUTTypeIsMap()
{
  return _IMUTTypeIsMap();
}

uint64_t IMUTTypeIsMovie()
{
  return _IMUTTypeIsMovie();
}

uint64_t IMUTTypeIsPass()
{
  return _IMUTTypeIsPass();
}

uint64_t IMUTTypeIsSupportedAnimatedImage()
{
  return _IMUTTypeIsSupportedAnimatedImage();
}

uint64_t IMUTTypeIsVCard()
{
  return _IMUTTypeIsVCard();
}

uint64_t IMUTTypeIsWalletOrder()
{
  return _IMUTTypeIsWalletOrder();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend___im_visitMessageParts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_visitMessageParts:");
}

id objc_msgSend__associatedMessageItemWithGUID_senderID_date_liteTextMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associatedMessageItemWithGUID:senderID:date:liteTextMessage:");
}

id objc_msgSend__associatedMessageTypeFromBlastDoorLiteAssociatedMessageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associatedMessageTypeFromBlastDoorLiteAssociatedMessageType:");
}

id objc_msgSend__expressiveSendStyleIDForBlastDoorLiteTextMessageEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_expressiveSendStyleIDForBlastDoorLiteTextMessageEffect:");
}

id objc_msgSend__messageGUIDForLiteIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageGUIDForLiteIdentifier:");
}

id objc_msgSend__rangeOfSingleMessagePartForMessageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangeOfSingleMessagePartForMessageWithGUID:");
}

id objc_msgSend__threadIdentifierForThreadOriginatorUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_threadIdentifierForThreadOriginatorUUID:");
}

id objc_msgSend_associatedMessageEmoji(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageEmoji];
}

id objc_msgSend_associatedMessageType(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageType];
}

id objc_msgSend_associatedMessageUUID(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageUUID];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_contextWithKnownSender_serviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithKnownSender:serviceName:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_donateHandlesForMessagingKeys_fromURI_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateHandlesForMessagingKeys:fromURI:options:completion:");
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return _[a1 effect];
}

id objc_msgSend_encodedMessagePartGUID(void *a1, const char *a2, ...)
{
  return _[a1 encodedMessagePartGUID];
}

id objc_msgSend_encryptionKeyID(void *a1, const char *a2, ...)
{
  return _[a1 encryptionKeyID];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasKnownSenderChatWithChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasKnownSenderChatWithChatIdentifier:");
}

id objc_msgSend_initWithPreferredServiceType_senderURI_recipientURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredServiceType:senderURI:recipientURI:");
}

id objc_msgSend_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_associatedMessageGUID_associatedMessageType_associatedMessageRange_messageSummaryInfo_threadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:");
}

id objc_msgSend_initWithSender_time_guid_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSender:time:guid:type:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_liteAssociatedMessageSummaryInfo(void *a1, const char *a2, ...)
{
  return _[a1 liteAssociatedMessageSummaryInfo];
}

id objc_msgSend_messagePartBody(void *a1, const char *a2, ...)
{
  return _[a1 messagePartBody];
}

id objc_msgSend_messagePartGUIDForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagePartGUIDForMessageGUID:");
}

id objc_msgSend_messagePartRange(void *a1, const char *a2, ...)
{
  return _[a1 messagePartRange];
}

id objc_msgSend_messageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithGUID:");
}

id objc_msgSend_plainBody(void *a1, const char *a2, ...)
{
  return _[a1 plainBody];
}

id objc_msgSend_plainTextBody(void *a1, const char *a2, ...)
{
  return _[a1 plainTextBody];
}

id objc_msgSend_preferredServiceType(void *a1, const char *a2, ...)
{
  return _[a1 preferredServiceType];
}

id objc_msgSend_sendLiteData_senderContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLiteData:senderContext:error:");
}

id objc_msgSend_sendServiceUpdateMessage_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendServiceUpdateMessage:options:completion:");
}

id objc_msgSend_setAssociatedMessageEmoji_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociatedMessageEmoji:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExpressiveSendStyleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpressiveSendStyleID:");
}

id objc_msgSend_setIsInitialDonation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInitialDonation:");
}

id objc_msgSend_setPlainBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlainBody:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return _[a1 stringGUID];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_tapback(void *a1, const char *a2, ...)
{
  return _[a1 tapback];
}

id objc_msgSend_threadOriginatorUUID(void *a1, const char *a2, ...)
{
  return _[a1 threadOriginatorUUID];
}