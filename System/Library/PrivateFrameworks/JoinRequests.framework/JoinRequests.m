BOOL static RequesterCredentials.Errors.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void RequesterCredentials.Errors.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int RequesterCredentials.Errors.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RequesterCredentials.Errors(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance RequesterCredentials.Errors()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance RequesterCredentials.Errors()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RequesterCredentials.Errors()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance RequesterCredentials.Errors()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance RequesterCredentials.Errors()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance RequesterCredentials.Errors()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance RequesterCredentials.Errors()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t variable initialization expression of RequesterCredentials.localKey()
{
  return P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
}

uint64_t RequesterCredentials.localPublicKeyData.getter()
{
  uint64_t v0 = type metadata accessor for P256.KeyAgreement.PublicKey();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  P256.KeyAgreement.PrivateKey.publicKey.getter();
  uint64_t v4 = P256.KeyAgreement.PublicKey.compactRepresentation.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

BOOL RequesterCredentials.isExhausted.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v18 - v5;
  uint64_t v7 = type metadata accessor for RequestKeyAgreement();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v18 - v11;
  uint64_t v13 = v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement;
  swift_beginAccess();
  outlined init with copy of RequestKeyAgreement(v13, (uint64_t)v12);
  outlined init with copy of SymmetricKey?((uint64_t)v12, (uint64_t)v6);
  uint64_t v14 = type metadata accessor for SymmetricKey();
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  LODWORD(v13) = v15(v6, 1, v14);
  outlined destroy of SymmetricKey?((uint64_t)v6, &demangling cache variable for type metadata for SymmetricKey?);
  outlined init with copy of RequestKeyAgreement((uint64_t)v12, (uint64_t)v10);
  if (v13 == 1)
  {
    outlined init with copy of SymmetricKey?((uint64_t)&v10[*(int *)(v7 + 20)], (uint64_t)v4);
    outlined destroy of RequestKeyAgreement((uint64_t)v10);
    BOOL v16 = v15(v4, 1, v14) == 1;
    outlined destroy of SymmetricKey?((uint64_t)v4, &demangling cache variable for type metadata for SymmetricKey?);
  }
  else
  {
    outlined destroy of RequestKeyAgreement((uint64_t)v10);
    BOOL v16 = 0;
  }
  outlined destroy of RequestKeyAgreement((uint64_t)v12);
  return v16;
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

uint64_t outlined init with copy of RequestKeyAgreement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RequestKeyAgreement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RequestKeyAgreement(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RequestKeyAgreement();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RequesterCredentials.__allocating_init(ownerPublicKey:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  RequesterCredentials.init(ownerPublicKey:)(a1, a2);
  return v4;
}

uint64_t RequesterCredentials.init(ownerPublicKey:)(uint64_t a1, unint64_t a2)
{
  uint64_t v34 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  uint64_t v31 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RequestKeyAgreement();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.KeyAgreement.PublicKey?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for P256.KeyAgreement.PublicKey();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  BOOL v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v24 - v17;
  uint64_t v27 = v2;
  uint64_t v28 = v2 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_localKey;
  P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
  uint64_t v32 = a1;
  unint64_t v33 = a2;
  uint64_t v29 = a1;
  unint64_t v30 = a2;
  outlined copy of Data._Representation(a1, a2);
  v19 = v26;
  P256.KeyAgreement.PublicKey.init<A>(compactRepresentation:)();
  if (v19)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  else
  {
    uint64_t v20 = (uint64_t)v25;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v20, v28, v34);
      RequestKeyAgreement.init(publicKey:privateKey:)((uint64_t)v16, v20, (uint64_t)v8);
      outlined consume of Data._Representation(v29, v30);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      uint64_t v22 = v27;
      outlined init with take of RequestKeyAgreement((uint64_t)v8, v27 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement);
      return v22;
    }
  }
  outlined destroy of SymmetricKey?((uint64_t)v11, &demangling cache variable for type metadata for P256.KeyAgreement.PublicKey?);
  lazy protocol witness table accessor for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors();
  swift_allocError();
  unsigned char *v21 = 0;
  swift_willThrow();
  outlined consume of Data._Representation(v29, v30);
  uint64_t v22 = v27;
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v28, v34);
  type metadata accessor for RequesterCredentials();
  swift_deallocPartialClassInstance();
  return v22;
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

uint64_t outlined destroy of SymmetricKey?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors;
  if (!lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors;
  if (!lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors);
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

uint64_t type metadata accessor for RequesterCredentials()
{
  uint64_t result = type metadata singleton initialization cache for RequesterCredentials;
  if (!type metadata singleton initialization cache for RequesterCredentials) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined init with take of RequestKeyAgreement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RequestKeyAgreement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t RequesterCredentials.encrypt(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)v2 + 120))();
  if (v8 >> 60 == 15)
  {
    if (one-time initialization token for credentials != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Log.credentials);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2543C1000, v10, v11, "Failed to derive requester's public key from the locally-generated private key.", v12, 2u);
      MEMORY[0x25A277C50](v12, -1, -1);
    }

    lazy protocol witness table accessor for type RequesterCredentials.Errors and conformance RequesterCredentials.Errors();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
  }
  else
  {
    uint64_t v14 = v7;
    unint64_t v15 = v8;
    swift_beginAccess();
    uint64_t v16 = RequestKeyAgreement.encrypt(request:)(a1, a2);
    if (v3)
    {
      swift_endAccess();
      outlined consume of Data?(v14, v15);
    }
    else
    {
      uint64_t v4 = v16;
      swift_endAccess();
    }
  }
  return v4;
}

uint64_t RequesterCredentials.decrypt(response:)(uint64_t a1, unint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = RequestKeyAgreement.decrypt(response:)(a1, a2);
  swift_endAccess();
  return v4;
}

uint64_t RequesterCredentials.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_localKey;
  uint64_t v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of RequestKeyAgreement(v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement);
  return v0;
}

uint64_t RequesterCredentials.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_localKey;
  uint64_t v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of RequestKeyAgreement(v0 + OBJC_IVAR____TtC12JoinRequests20RequesterCredentials_keyAgreement);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t variable initialization expression of RequestKeyAgreement.requestKey@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SymmetricKey();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t ObjC metadata update function for RequesterCredentials()
{
  return type metadata accessor for RequesterCredentials();
}

uint64_t type metadata completion function for RequesterCredentials()
{
  uint64_t result = type metadata accessor for P256.KeyAgreement.PrivateKey();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for RequestKeyAgreement();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequesterCredentials.Errors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RequesterCredentials.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x2543C42FCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for RequesterCredentials.Errors(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for RequesterCredentials.Errors(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RequesterCredentials.Errors()
{
  return &type metadata for RequesterCredentials.Errors;
}

void RequesterCredentials.keyAgreement.setter()
{
}

uint64_t Log.credentials.unsafeMutableAddressor()
{
  return Log.credentials.unsafeMutableAddressor(&one-time initialization token for credentials, (uint64_t)static Log.credentials);
}

BOOL Subsystem.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Subsystem.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Subsystem()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Subsystem()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Subsystem()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Subsystem()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Subsystem(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000002543CBB70;
}

uint64_t one-time initialization function for credentials()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.credentials);
  __swift_project_value_buffer(v0, (uint64_t)static Log.credentials);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init<A>(subsystem:category:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
}

uint64_t static Log.credentials.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.credentials.getter(&one-time initialization token for credentials, (uint64_t)static Log.credentials, a1);
}

uint64_t one-time initialization function for service()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.service);
  __swift_project_value_buffer(v0, (uint64_t)static Log.service);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.service.unsafeMutableAddressor()
{
  return Log.credentials.unsafeMutableAddressor(&one-time initialization token for service, (uint64_t)static Log.service);
}

uint64_t Log.credentials.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.service.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.credentials.getter(&one-time initialization token for service, (uint64_t)static Log.service, a1);
}

uint64_t static Log.credentials.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t >> prefix<A>(_:)(uint64_t a1, uint64_t a2)
{
  v4[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in >> prefix<A>(_:), (uint64_t)v4, MEMORY[0x263F8E628], MEMORY[0x263F8D310], v2, (uint64_t)v5);
  if (v5[1]) {
    return v5[0];
  }
  else {
    return 7104878;
  }
}

uint64_t partial apply for closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in >> prefix<A>(_:)(a1, a2);
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x263F8E628], MEMORY[0x263F8D310], v2, (uint64_t)&v8);
  if (v9) {
    uint64_t v3 = v8;
  }
  else {
    uint64_t v3 = 7104878;
  }
  if (v9) {
    unint64_t v4 = v9;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = String.init<A>(reflecting:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

unint64_t lazy protocol witness table accessor for type Subsystem and conformance Subsystem()
{
  unint64_t result = lazy protocol witness table cache variable for type Subsystem and conformance Subsystem;
  if (!lazy protocol witness table cache variable for type Subsystem and conformance Subsystem)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Subsystem and conformance Subsystem);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Subsystem(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Subsystem(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2543C4E44);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for Subsystem()
{
  return 0;
}

ValueMetadata *type metadata accessor for Subsystem()
{
  return &type metadata for Subsystem;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return partial apply for closure #1 in >> prefix<A>(_:)(a1, a2);
}

BOOL RequestKeyAgreement.isExhausted.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RequestKeyAgreement();
  MEMORY[0x270FA5388](v2);
  unsigned int v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  outlined init with copy of SymmetricKey?(v1, (uint64_t)&v16 - v9);
  uint64_t v11 = type metadata accessor for SymmetricKey();
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
  int v13 = v12(v10, 1, v11);
  outlined destroy of SymmetricKey?((uint64_t)v10, &demangling cache variable for type metadata for SymmetricKey?);
  outlined init with copy of RequestKeyAgreement(v1, (uint64_t)v4);
  if (v13 == 1)
  {
    outlined init with copy of SymmetricKey?((uint64_t)&v4[*(int *)(v2 + 20)], (uint64_t)v8);
    outlined destroy of RequestKeyAgreement((uint64_t)v4);
    BOOL v14 = v12(v8, 1, v11) == 1;
    outlined destroy of SymmetricKey?((uint64_t)v8, &demangling cache variable for type metadata for SymmetricKey?);
  }
  else
  {
    outlined destroy of RequestKeyAgreement((uint64_t)v4);
    return 0;
  }
  return v14;
}

uint64_t type metadata accessor for RequestKeyAgreement()
{
  uint64_t result = type metadata singleton initialization cache for RequestKeyAgreement;
  if (!type metadata singleton initialization cache for RequestKeyAgreement) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t RequestKeyAgreement.init(publicKey:privateKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x270FA5388](v6 - 8);
  v37 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SharedSecret();
  uint64_t v38 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SymmetricKey();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v14 = v12 + 56;
  v13(a3, 1, 1, v11);
  uint64_t v15 = *(int *)(type metadata accessor for RequestKeyAgreement() + 20);
  uint64_t v42 = a3;
  uint64_t v16 = a3 + v15;
  v13(v16, 1, 1, v11);
  uint64_t v17 = v39;
  P256.KeyAgreement.PrivateKey.sharedSecretFromKeyAgreement(with:)();
  if (v17)
  {
    uint64_t v18 = type metadata accessor for P256.KeyAgreement.PrivateKey();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a2, v18);
    uint64_t v19 = type metadata accessor for P256.KeyAgreement.PublicKey();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(a1, v19);
    return outlined destroy of RequestKeyAgreement(v42);
  }
  else
  {
    uint64_t v30 = v16;
    uint64_t v31 = v11;
    uint64_t v32 = v14;
    unint64_t v33 = v13;
    uint64_t v21 = v37;
    uint64_t v34 = v8;
    uint64_t v35 = a2;
    uint64_t v36 = 0;
    uint64_t v39 = a1;
    type metadata accessor for SHA256();
    long long v29 = xmmword_2543CB7C0;
    long long v41 = xmmword_2543CB7C0;
    if (one-time initialization token for requestSharedInfo != -1) {
      swift_once();
    }
    long long v40 = static RequestKeyAgreement.requestSharedInfo;
    lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x263F047F8]);
    lazy protocol witness table accessor for type Data and conformance Data();
    uint64_t v22 = (uint64_t)v21;
    SharedSecret.hkdfDerivedSymmetricKey<A, B, C>(using:salt:sharedInfo:outputByteCount:)();
    v23 = v21;
    uint64_t v24 = v31;
    uint64_t v25 = v33;
    v33((uint64_t)v23, 0, 1, v31);
    outlined assign with take of SymmetricKey?(v22, v42);
    long long v41 = v29;
    uint64_t v26 = v38;
    if (one-time initialization token for responseSharedInfo != -1) {
      swift_once();
    }
    long long v40 = static RequestKeyAgreement.responseSharedInfo;
    outlined copy of Data._Representation(static RequestKeyAgreement.responseSharedInfo, *((unint64_t *)&static RequestKeyAgreement.responseSharedInfo + 1));
    SharedSecret.hkdfDerivedSymmetricKey<A, B, C>(using:salt:sharedInfo:outputByteCount:)();
    uint64_t v27 = type metadata accessor for P256.KeyAgreement.PrivateKey();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(v35, v27);
    uint64_t v28 = type metadata accessor for P256.KeyAgreement.PublicKey();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(v39, v28);
    outlined consume of Data._Representation(v40, *((unint64_t *)&v40 + 1));
    outlined consume of Data._Representation(v41, *((unint64_t *)&v41 + 1));
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v34);
    v25(v22, 0, 1, v24);
    return outlined assign with take of SymmetricKey?(v22, v30);
  }
}

uint64_t RequestKeyAgreement.encrypt(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AES.GCM.SealedBox();
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SymmetricKey();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v2;
  outlined init with copy of SymmetricKey?(v2, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v12, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for credentials != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.credentials);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    uint64_t v2 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_2543C1000, v18, (os_log_type_t)v2, "Cannot encrypt request data because request key was already used (exhausted).", v20, 2u);
      MEMORY[0x25A277C50](v20, -1, -1);
    }

    lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
    swift_allocError();
    unsigned char *v21 = 0;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    uint64_t v36 = a1;
    uint64_t v37 = v35;
    uint64_t v22 = type metadata accessor for AES.GCM.Nonce();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
    lazy protocol witness table accessor for type Data and conformance Data();
    uint64_t v23 = v38;
    static AES.GCM.seal<A>(_:using:nonce:)();
    if (v23)
    {
      outlined destroy of SymmetricKey?((uint64_t)v6, &demangling cache variable for type metadata for AES.GCM.Nonce?);
    }
    else
    {
      outlined destroy of SymmetricKey?((uint64_t)v6, &demangling cache variable for type metadata for AES.GCM.Nonce?);
      uint64_t v2 = AES.GCM.SealedBox.combined.getter();
      unint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v7);
      if (v25 >> 60 != 15)
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
        uint64_t v31 = v33;
        outlined destroy of SymmetricKey?(v33, &demangling cache variable for type metadata for SymmetricKey?);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v31, 1, 1, v13);
        return v2;
      }
      if (one-time initialization token for credentials != -1) {
        swift_once();
      }
      uint64_t v26 = type metadata accessor for Logger();
      __swift_project_value_buffer(v26, (uint64_t)static Log.credentials);
      uint64_t v2 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled((os_log_t)v2, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_2543C1000, (os_log_t)v2, v27, "Failed to encrypt request.", v28, 2u);
        MEMORY[0x25A277C50](v28, -1, -1);
      }

      lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
      swift_allocError();
      *long long v29 = 2;
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return v2;
}

uint64_t RequestKeyAgreement.decrypt(response:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for AES.GCM.SealedBox();
  uint64_t v36 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SymmetricKey();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v3 + *(int *)(type metadata accessor for RequestKeyAgreement() + 20);
  outlined init with copy of SymmetricKey?(v16, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v11, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for credentials != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.credentials);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    uint64_t v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_2543C1000, v18, (os_log_type_t)v20, "Cannot decrypt response data because response key was already used (exhausted).", v21, 2u);
      MEMORY[0x25A277C50](v21, -1, -1);
    }

    lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
    swift_allocError();
    *uint64_t v22 = 1;
    swift_willThrow();
  }
  else
  {
    uint64_t v35 = v13;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    outlined copy of Data._Representation(a1, a2);
    uint64_t v23 = v37;
    specialized AES.GCM.SealedBox.init<A>(combined:)(a1, a2);
    if (v23)
    {
      uint64_t v34 = v12;
      if (one-time initialization token for credentials != -1) {
        swift_once();
      }
      uint64_t v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Log.credentials);
      MEMORY[0x25A277B90](v23);
      MEMORY[0x25A277B90](v23);
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled((os_log_t)v20, v26))
      {
        os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = (void *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v27 = 138412290;
        MEMORY[0x25A277B90](v23);
        uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v38 = v29;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v28 = v29;

        _os_log_impl(&dword_2543C1000, (os_log_t)v20, v26, "Failed to decrypt response data with error: %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x25A277C50](v28, -1, -1);
        MEMORY[0x25A277C50](v27, -1, -1);
      }
      else
      {
      }
      uint64_t v30 = v35;

      lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
      swift_allocError();
      *uint64_t v31 = 3;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v34);
    }
    else
    {
      uint64_t v24 = v12;
      uint64_t v20 = static AES.GCM.open(_:using:)();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v6);
      uint64_t v33 = v35;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v24);
      outlined destroy of SymmetricKey?(v16, &demangling cache variable for type metadata for SymmetricKey?);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v16, 1, 1, v24);
    }
  }
  return v20;
}

BOOL static RequestKeyAgreement.Errors.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void RequestKeyAgreement.Errors.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int RequestKeyAgreement.Errors.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RequestKeyAgreement.Errors(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t one-time initialization function for requestSharedInfo()
{
  uint64_t result = specialized Data.init<A>(_:)(0xD00000000000001BLL, 0x80000002543CBC50);
  *(void *)&static RequestKeyAgreement.requestSharedInfo = result;
  *((void *)&static RequestKeyAgreement.requestSharedInfo + 1) = v1;
  return result;
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

uint64_t outlined assign with take of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t specialized Data.init<A>(_:)(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (swift_dynamicCast())
  {
    outlined init with take of ContiguousBytes(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  outlined destroy of SymmetricKey?((uint64_t)v38, &demangling cache variable for type metadata for ContiguousBytes?);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = specialized Data._Representation.init(_:)(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = specialized Data._Representation.init(count:)(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for specialized closure #3 in Data.init<A>(_:));
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    outlined consume of Data?(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  outlined consume of Data?((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      outlined copy of Data._Representation(a1, a2);
      outlined copy of Data._Representation(v5, v6);
      uint64_t v8 = (unsigned char *)__DataStorage._bytes.getter();
      if (v8)
      {
        uint64_t v9 = __DataStorage._offset.getter();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = __DataStorage._length.getter();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      closure #1 in Data.init<A>(_:)(v8, v13, &v27);
      outlined consume of Data._Representation(v5, v6);
LABEL_27:
      outlined consume of Data._Representation(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      outlined copy of Data._Representation(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)__DataStorage._bytes.getter();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = __DataStorage._offset.getter();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = __DataStorage._length.getter();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        BOOL v23 = v22;
      }
      else {
        BOOL v23 = 0;
      }
      closure #1 in Data.init<A>(_:)(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      outlined copy of Data._Representation(a1, a2);
      uint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      outlined copy of Data._Representation(a1, a2);
      uint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      closure #1 in Data.init<A>(_:)(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t one-time initialization function for responseSharedInfo()
{
  uint64_t result = specialized Data.init<A>(_:)(0xD00000000000001CLL, 0x80000002543CBC30);
  static RequestKeyAgreement.responseSharedInfo = result;
  unk_269DEE990 = v1;
  return result;
}

unint64_t lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors;
  if (!lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors;
  if (!lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors);
  }
  return result;
}

uint64_t specialized AES.GCM.SealedBox.init<A>(combined:)(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x2543C6C04);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 > 27)
      {
        outlined copy of Data._Representation(a1, a2);
        specialized Data.init<A>(_:)(a1, a2);
        AES.GCM.SealedBox.init(combined:)();
        return outlined consume of Data._Representation(a1, a2);
      }
      else
      {
LABEL_7:
        uint64_t v8 = type metadata accessor for CryptoKitError();
        lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type CryptoKitError and conformance CryptoKitError, MEMORY[0x263F04548]);
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F04538], v8);
        swift_willThrow();
        return outlined consume of Data._Representation(a1, a2);
      }
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t RequestKeyAgreement.retrieveKeyPair()(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - v9;
  outlined init with copy of SymmetricKey?(v2, (uint64_t)&v29 - v9);
  uint64_t v11 = type metadata accessor for SymmetricKey();
  uint64_t v12 = *(void *)(v11 - 8);
  unint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11) == 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v10, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for credentials != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Log.credentials);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_2543C1000, v15, v16, "Cannot retrieve key pair because request key was already used (exhausted).", v17, 2u);
      MEMORY[0x25A277C50](v17, -1, -1);
    }

    lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
    swift_allocError();
    *BOOL v18 = 0;
    return swift_willThrow();
  }
  else
  {
    uint64_t v29 = v3;
    uint64_t v20 = a1;
    uint64_t v21 = *(void (**)(void))(v12 + 32);
    uint64_t v30 = v20;
    v21();
    uint64_t v22 = v2 + *(int *)(type metadata accessor for RequestKeyAgreement() + 20);
    outlined init with copy of SymmetricKey?(v22, (uint64_t)v8);
    if (v13(v8, 1, v11) == 1)
    {
      outlined destroy of SymmetricKey?((uint64_t)v8, &demangling cache variable for type metadata for SymmetricKey?);
      if (one-time initialization token for credentials != -1) {
        swift_once();
      }
      uint64_t v23 = type metadata accessor for Logger();
      __swift_project_value_buffer(v23, (uint64_t)static Log.credentials);
      uint64_t v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v24, v25))
      {
        unsigned int v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned int v26 = 0;
        _os_log_impl(&dword_2543C1000, v24, v25, "Cannot retrieve key pair because response key was already used (exhausted).", v26, 2u);
        MEMORY[0x25A277C50](v26, -1, -1);
      }

      lazy protocol witness table accessor for type RequestKeyAgreement.Errors and conformance RequestKeyAgreement.Errors();
      swift_allocError();
      *uint64_t v27 = 1;
      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v30, v11);
    }
    else
    {
      ((void (*)(uint64_t, char *, uint64_t))v21)(v31, v8, v11);
      outlined destroy of SymmetricKey?(v2, &demangling cache variable for type metadata for SymmetricKey?);
      uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v28(v2, 1, 1, v11);
      outlined destroy of SymmetricKey?(v22, &demangling cache variable for type metadata for SymmetricKey?);
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v28)(v22, 1, 1, v11);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for RequestKeyAgreement(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SymmetricKey();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = *(int *)(a3 + 20);
    unint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    if (v9((uint64_t *)v14, 1, v7))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for RequestKeyAgreement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v4 - 8);
  int v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v5(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v5)(v6, 1, v4);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v6, v4);
  }
  return result;
}

char *initializeWithCopy for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(v12, 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

char *initializeWithTake for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(v12, 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for RequestKeyAgreement(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestKeyAgreement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2543C7C3C);
}

uint64_t sub_2543C7C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RequestKeyAgreement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2543C7CC0);
}

uint64_t sub_2543C7CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void type metadata completion function for RequestKeyAgreement()
{
  type metadata accessor for SymmetricKey?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for SymmetricKey?()
{
  if (!lazy cache variable for type metadata for SymmetricKey?)
  {
    type metadata accessor for SymmetricKey();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for SymmetricKey?);
    }
  }
}

uint64_t getEnumTagSinglePayload for RequestKeyAgreement.Errors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RequestKeyAgreement.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2543C7F74);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for RequestKeyAgreement.Errors(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestKeyAgreement.Errors()
{
  return &type metadata for RequestKeyAgreement.Errors;
}

uint64_t lazy protocol witness table accessor for type SHA256 and conformance SHA256(unint64_t *a1, void (*a2)(uint64_t))
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

char *specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_2543CB7C0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25A277890](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unsigned char *specialized Data._Representation.init(_:)(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t outlined init with take of ContiguousBytes(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000010;
  }
  else {
    unint64_t v3 = 0x72656C676E617257;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0x80000002543CBBD0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000010;
  }
  else {
    unint64_t v5 = 0x72656C676E617257;
  }
  if (a2) {
    unint64_t v6 = 0x80000002543CBBD0;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
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

uint64_t JoinRequestError.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6E776F6E6B6E75;
  }
  if (a1 == 1) {
    return 0xD000000000000018;
  }
  return 0x5564696C61566F6ELL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance JoinRequestError(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = JoinRequestError.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == JoinRequestError.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JoinRequestError()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  JoinRequestError.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance JoinRequestError()
{
  JoinRequestError.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JoinRequestError()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  JoinRequestError.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance JoinRequestError@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized JoinRequestError.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance JoinRequestError@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = JoinRequestError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for IDSServiceProtocol.serviceIdentifier.getter in conformance IDSService()
{
  id v1 = objc_msgSend(*v0, sel_serviceIdentifier);
  if (!v1) {
    return 0;
  }
  char v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t protocol witness for IDSServiceProtocol.accounts.getter in conformance IDSService()
{
  id v1 = objc_msgSend(*v0, sel_accounts);
  if (!v1) {
    return 0;
  }
  char v2 = v1;
  type metadata accessor for IDSAccount();
  lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id protocol witness for IDSServiceProtocol.pseudonymProperties(withFeatureID:expiryDurationInSeconds:) in conformance IDSService(double a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)MEMORY[0x25A277820]();
  id v5 = objc_msgSend(v3, sel_pseudonymPropertiesWithFeatureID_expiryDurationInSeconds_, v4, a1);

  return v5;
}

uint64_t protocol witness for IDSServiceProtocol.provisionPseudonym(for:with:completion:) in conformance IDSService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *v4;
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@guaranteed IDSPseudonym?, @guaranteed Error?) -> ();
  v10[3] = &block_descriptor;
  char v8 = _Block_copy(v10);
  swift_retain();
  objc_msgSend(v7, sel_provisionPseudonymForURI_withProperties_completion_, a1, a2, v8);
  _Block_release(v8);
  return swift_release();
}

void thunk for @escaping @callee_guaranteed (@guaranteed IDSPseudonym?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t JoinRequestProvider.serviceName.getter()
{
  return 0xD000000000000030;
}

JoinRequests::JoinRequestProvider_optional __swiftcall JoinRequestProvider.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of JoinRequestProvider.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = JoinRequests_JoinRequestProvider_GroupTestService;
  }
  else {
    v4.value = JoinRequests_JoinRequestProvider_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t JoinRequestProvider.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x72656C676E617257;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance JoinRequestProvider(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JoinRequestProvider()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance JoinRequestProvider()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JoinRequestProvider()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance JoinRequestProvider@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of JoinRequestProvider.init(rawValue:), *a1);
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

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance JoinRequestProvider@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = JoinRequestProvider.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized JoinRequestError.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of JoinRequestError.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type JoinRequestError and conformance JoinRequestError()
{
  unint64_t result = lazy protocol witness table cache variable for type JoinRequestError and conformance JoinRequestError;
  if (!lazy protocol witness table cache variable for type JoinRequestError and conformance JoinRequestError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JoinRequestError and conformance JoinRequestError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JoinRequestProvider and conformance JoinRequestProvider()
{
  unint64_t result = lazy protocol witness table cache variable for type JoinRequestProvider and conformance JoinRequestProvider;
  if (!lazy protocol witness table cache variable for type JoinRequestProvider and conformance JoinRequestProvider)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JoinRequestProvider and conformance JoinRequestProvider);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JoinRequestError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for JoinRequestError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2543C924CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JoinRequestError()
{
  return &type metadata for JoinRequestError;
}

unsigned char *storeEnumTagSinglePayload for JoinRequestProvider(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x2543C9350);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JoinRequestProvider()
{
  return &type metadata for JoinRequestProvider;
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

unint64_t type metadata accessor for IDSAccount()
{
  unint64_t result = lazy cache variable for type metadata for IDSAccount;
  if (!lazy cache variable for type metadata for IDSAccount)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for IDSAccount);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type IDSAccount and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type IDSAccount and conformance NSObject;
  if (!lazy protocol witness table cache variable for type IDSAccount and conformance NSObject)
  {
    type metadata accessor for IDSAccount();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSAccount and conformance NSObject);
  }
  return result;
}

BOOL static OwnerCredentials.Errors.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void OwnerCredentials.Errors.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int OwnerCredentials.Errors.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t OwnerCredentials.publicKeyData.getter()
{
  uint64_t v0 = type metadata accessor for P256.KeyAgreement.PublicKey();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  P256.KeyAgreement.PrivateKey.publicKey.getter();
  uint64_t v4 = P256.KeyAgreement.PublicKey.compactRepresentation.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t OwnerCredentials.privateKeyData.getter()
{
  return P256.KeyAgreement.PrivateKey.rawRepresentation.getter();
}

uint64_t OwnerCredentials.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
  return v0;
}

uint64_t OwnerCredentials.init()()
{
  uint64_t v1 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  P256.KeyAgreement.PrivateKey.init(compactRepresentable:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey, v4, v1);
  return v0;
}

uint64_t OwnerCredentials.__allocating_init(privateKeyData:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  v11[0] = a1;
  v11[1] = a2;
  P256.KeyAgreement.PrivateKey.init<A>(rawRepresentation:)();
  if (v2) {
    swift_deallocPartialClassInstance();
  }
  else {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey, v8, v5);
  }
  return v9;
}

uint64_t OwnerCredentials.init(privateKeyData:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = a1;
  v11[1] = a2;
  P256.KeyAgreement.PrivateKey.init<A>(rawRepresentation:)();
  if (v3)
  {
    type metadata accessor for OwnerCredentials();
    swift_deallocPartialClassInstance();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v2 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey, v9, v6);
  }
  return v2;
}

uint64_t type metadata accessor for OwnerCredentials()
{
  uint64_t result = type metadata singleton initialization cache for OwnerCredentials;
  if (!type metadata singleton initialization cache for OwnerCredentials) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t OwnerCredentials.decrypt(request:publicKey:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  v72 = (char *)a4;
  uint64_t v61 = a1;
  unint64_t v62 = a2;
  uint64_t v5 = type metadata accessor for AES.GCM.SealedBox();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  MEMORY[0x270FA5388](v5);
  v63 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v64 = *(void *)(v7 - 8);
  uint64_t v65 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v67 = (uint64_t)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v66 = (uint64_t)&v57 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v57 - v13;
  MEMORY[0x270FA5388](v12);
  int v16 = (char *)&v57 - v15;
  uint64_t v17 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  uint64_t v68 = *(void *)(v17 - 8);
  v69 = (char *)v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for RequestKeyAgreement();
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for P256.KeyAgreement.PublicKey();
  uint64_t v71 = *(void *)(v23 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  unsigned int v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v57 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v57 - v30;
  uint64_t v73 = a3;
  unint64_t v74 = (unint64_t)v72;
  outlined copy of Data._Representation(a3, (unint64_t)v72);
  uint64_t v32 = v75;
  P256.KeyAgreement.PublicKey.init<A>(compactRepresentation:)();
  uint64_t v33 = (uint64_t)v32;
  if (v32)
  {
    if (one-time initialization token for credentials != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    __swift_project_value_buffer(v34, (uint64_t)static Log.credentials);
    MEMORY[0x25A277B90](v32);
    MEMORY[0x25A277B90](v32);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 138412290;
      MEMORY[0x25A277B90](v32);
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v73 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v38 = v39;

      _os_log_impl(&dword_2543C1000, v35, v36, "Failed to derive public key from requester public key data provided alongside request: %@", v37, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x25A277C50](v38, -1, -1);
      MEMORY[0x25A277C50](v37, -1, -1);
    }
    else
    {
    }
    lazy protocol witness table accessor for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors();
    swift_allocError();
    *uint64_t v42 = 0;
    swift_willThrow();
  }
  else
  {
    v72 = v14;
    v75 = v16;
    uint64_t v40 = v71;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v31, v29, v23);
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v26, v31, v23);
    (*(void (**)(char *, char *, char *))(v68 + 16))(v19, &v70[OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey], v69);
    RequestKeyAgreement.init(publicKey:privateKey:)((uint64_t)v26, (uint64_t)v19, (uint64_t)v22);
    uint64_t v41 = v23;
    v70 = v31;
    uint64_t v44 = v66;
    uint64_t v45 = v67;
    RequestKeyAgreement.retrieveKeyPair()(v66, v67);
    v69 = v22;
    uint64_t v46 = v64;
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 32);
    uint64_t v48 = v44;
    uint64_t v49 = v65;
    v47(v75, v48, v65);
    unint64_t v50 = (unint64_t)v72;
    v47(v72, v45, v49);
    uint64_t v52 = v61;
    unint64_t v51 = v62;
    outlined copy of Data._Representation(v61, v62);
    v53 = v63;
    specialized AES.GCM.SealedBox.init<A>(combined:)(v52, v51);
    uint64_t v58 = v41;
    uint64_t v33 = static AES.GCM.open(_:using:)();
    unint64_t v55 = v54;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v53, v60);
    outlined copy of Data._Representation(v33, v55);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined consume of Data._Representation(v33, v55);
    v56 = *(void (**)(unint64_t, uint64_t))(v46 + 8);
    v56(v50, v49);
    v56((unint64_t)v75, v49);
    outlined destroy of RequestKeyAgreement((uint64_t)v69);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v58);
  }
  return v33;
}

unint64_t lazy protocol witness table accessor for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors;
  if (!lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors;
  if (!lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors);
  }
  return result;
}

NSObject *OwnerCredentials.encrypt(response:responseKeyData:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AES.GCM.SealedBox();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SymmetricKey();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a3;
  unint64_t v33 = a4;
  outlined copy of Data._Representation(a3, a4);
  uint64_t v18 = MEMORY[0x263F06F78];
  SymmetricKey.init<A>(data:)();
  uint64_t v32 = a1;
  unint64_t v33 = a2;
  uint64_t v19 = type metadata accessor for AES.GCM.Nonce();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v10, 1, 1, v19);
  lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v20 = v34;
  static AES.GCM.seal<A>(_:using:nonce:)();
  if (v20)
  {
    outlined destroy of AES.GCM.Nonce?((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {
    uint64_t v21 = v14;
    outlined destroy of AES.GCM.Nonce?((uint64_t)v10);
    uint64_t v18 = AES.GCM.SealedBox.combined.getter();
    unint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
    if (v23 >> 60 == 15)
    {
      uint64_t v24 = v15;
      if (one-time initialization token for credentials != -1) {
        swift_once();
      }
      uint64_t v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Log.credentials);
      uint64_t v18 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl(&dword_2543C1000, v18, v26, "Failed to encrypt response.", v27, 2u);
        MEMORY[0x25A277C50](v27, -1, -1);
      }

      lazy protocol witness table accessor for type OwnerCredentials.Errors and conformance OwnerCredentials.Errors();
      swift_allocError();
      *uint64_t v28 = 2;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v21);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v21);
    }
  }
  return v18;
}

uint64_t OwnerCredentials.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey;
  uint64_t v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t OwnerCredentials.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12JoinRequests16OwnerCredentials_privateKey;
  uint64_t v2 = type metadata accessor for P256.KeyAgreement.PrivateKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t outlined destroy of AES.GCM.Nonce?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ObjC metadata update function for OwnerCredentials()
{
  return type metadata accessor for OwnerCredentials();
}

uint64_t type metadata completion function for OwnerCredentials()
{
  uint64_t result = type metadata accessor for P256.KeyAgreement.PrivateKey();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OwnerCredentials.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2543CAA94);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OwnerCredentials.Errors()
{
  return &type metadata for OwnerCredentials.Errors;
}

uint64_t SymmetricKey.rawRepresentation.getter()
{
  SymmetricKey.withUnsafeBytes<A>(_:)();
  return v1;
}

uint64_t SymmetricKey.init<A>(rawRepresentation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  SymmetricKey.init<A>(data:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t closure #1 in SymmetricKey.rawRepresentation.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v14[3] = MEMORY[0x263F8D3E8];
  v14[4] = MEMORY[0x263F07B80];
  v14[0] = a1;
  v14[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v14, MEMORY[0x263F8D3E8]);
  uint64_t v5 = (unsigned char *)*v4;
  if (*v4 && (unsigned int v6 = (unsigned char *)v4[1], v7 = v6 - v5, v6 != v5))
  {
    if (v7 <= 14)
    {
      uint64_t v8 = specialized Data.InlineData.init(_:)(v5, v6);
      unint64_t v9 = v12 & 0xFFFFFFFFFFFFFFLL;
    }
    else if ((unint64_t)v7 >= 0x7FFFFFFF)
    {
      uint64_t v8 = specialized Data.LargeSlice.init(_:)((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v13 | 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = specialized Data.InlineSlice.init(_:)((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v11 | 0x4000000000000000;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0xC000000000000000;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  *a3 = v8;
  a3[1] = v9;
  return result;
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
  uint64_t v6 = *MEMORY[0x263EF8340];
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
  __DataStorage.init(bytes:length:)();
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
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x270EEE648]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x270EF0090]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t type metadata accessor for CryptoKitError()
{
  return MEMORY[0x270EEA9E8]();
}

uint64_t SharedSecret.hkdfDerivedSymmetricKey<A, B, C>(using:salt:sharedInfo:outputByteCount:)()
{
  return MEMORY[0x270EEAAD8]();
}

uint64_t type metadata accessor for SharedSecret()
{
  return MEMORY[0x270EEAAE8]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t static AES.GCM.open(_:using:)()
{
  return MEMORY[0x270EEAC48]();
}

uint64_t static AES.GCM.seal<A>(_:using:nonce:)()
{
  return MEMORY[0x270EEAC60]();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return MEMORY[0x270EEAC88]();
}

uint64_t AES.GCM.SealedBox.combined.getter()
{
  return MEMORY[0x270EEACB8]();
}

uint64_t AES.GCM.SealedBox.init(combined:)()
{
  return MEMORY[0x270EEACC8]();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return MEMORY[0x270EEACD8]();
}

uint64_t P256.KeyAgreement.PublicKey.compactRepresentation.getter()
{
  return MEMORY[0x270EEAEB8]();
}

uint64_t P256.KeyAgreement.PublicKey.init<A>(compactRepresentation:)()
{
  return MEMORY[0x270EEAEC0]();
}

uint64_t type metadata accessor for P256.KeyAgreement.PublicKey()
{
  return MEMORY[0x270EEAED8]();
}

uint64_t P256.KeyAgreement.PrivateKey.sharedSecretFromKeyAgreement(with:)()
{
  return MEMORY[0x270EEAEF0]();
}

uint64_t P256.KeyAgreement.PrivateKey.publicKey.getter()
{
  return MEMORY[0x270EEAEF8]();
}

uint64_t P256.KeyAgreement.PrivateKey.rawRepresentation.getter()
{
  return MEMORY[0x270EEAF10]();
}

uint64_t P256.KeyAgreement.PrivateKey.init<A>(rawRepresentation:)()
{
  return MEMORY[0x270EEAF18]();
}

uint64_t P256.KeyAgreement.PrivateKey.init(compactRepresentable:)()
{
  return MEMORY[0x270EEAF40]();
}

uint64_t type metadata accessor for P256.KeyAgreement.PrivateKey()
{
  return MEMORY[0x270EEAF50]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x270EEB090]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x270F9D600]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}