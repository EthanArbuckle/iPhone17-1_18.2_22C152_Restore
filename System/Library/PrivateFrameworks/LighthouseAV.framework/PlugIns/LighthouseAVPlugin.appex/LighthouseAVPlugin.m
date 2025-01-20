void one-time initialization function for allValues()
{
  static AVLogColumns.allValues = (uint64_t)&outlined read-only object #0 of one-time initialization function for allValues;
}

uint64_t *AVLogColumns.allValues.unsafeMutableAddressor()
{
  if (one-time initialization token for allValues != -1) {
    swift_once();
  }
  return &static AVLogColumns.allValues;
}

void one-time initialization function for intValues()
{
  static AVLogColumns.intValues = (uint64_t)&outlined read-only object #0 of one-time initialization function for intValues;
}

uint64_t *AVLogColumns.intValues.unsafeMutableAddressor()
{
  if (one-time initialization token for intValues != -1) {
    swift_once();
  }
  return &static AVLogColumns.intValues;
}

void one-time initialization function for stringValues()
{
  static AVLogColumns.stringValues = (uint64_t)&outlined read-only object #0 of one-time initialization function for stringValues;
}

uint64_t *AVLogColumns.stringValues.unsafeMutableAddressor()
{
  if (one-time initialization token for stringValues != -1) {
    swift_once();
  }
  return &static AVLogColumns.stringValues;
}

void one-time initialization function for dateValues()
{
  static AVLogColumns.dateValues = (uint64_t)&outlined read-only object #0 of one-time initialization function for dateValues;
}

uint64_t *AVLogColumns.dateValues.unsafeMutableAddressor()
{
  if (one-time initialization token for dateValues != -1) {
    swift_once();
  }
  return &static AVLogColumns.dateValues;
}

uint64_t AVLogColumns.rawValue.getter(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 1702125924;
      break;
    case 2:
      uint64_t result = 0xD000000000000011;
      break;
    case 3:
      uint64_t result = 0x426463694D666572;
      break;
    case 4:
      uint64_t result = 0x426463694D666572;
      break;
    case 5:
      uint64_t result = 0x4142646D757264;
      break;
    case 6:
      uint64_t result = 0x4B42646D757264;
      break;
    case 7:
    case 18:
    case 25:
    case 35:
      uint64_t result = 0xD000000000000010;
      break;
    case 8:
      uint64_t result = 0x6B6E696C6E776F64;
      break;
    case 9:
      uint64_t result = 0xD000000000000011;
      break;
    case 10:
      uint64_t result = 0xD000000000000015;
      break;
    case 11:
      uint64_t result = 0x6E6F687064616568;
      break;
    case 12:
      uint64_t result = 0x79546D6165727473;
      break;
    case 13:
      uint64_t result = 0xD000000000000017;
      break;
    case 14:
      uint64_t result = 0xD000000000000019;
      break;
    case 15:
      uint64_t result = 0xD000000000000017;
      break;
    case 16:
      uint64_t result = 0xD00000000000001CLL;
      break;
    case 17:
      uint64_t result = 0x64654D457473616CLL;
      break;
    case 19:
      uint64_t result = 0xD000000000000011;
      break;
    case 20:
      uint64_t result = 0xD000000000000014;
      break;
    case 21:
      uint64_t result = 0x726953457473616CLL;
      break;
    case 22:
      unsigned int v3 = 1953718636;
      goto LABEL_26;
    case 23:
      uint64_t result = 0x614568746F6F6D73;
      break;
    case 24:
      uint64_t result = 0x4464657269736564;
      break;
    case 26:
      uint64_t result = 0xD000000000000014;
      break;
    case 27:
      unsigned int v3 = 1684370032;
LABEL_26:
      uint64_t result = v3 | 0x536C6F5600000000;
      break;
    case 28:
      uint64_t result = 0xD000000000000015;
      break;
    case 29:
      uint64_t result = 0xD000000000000013;
      break;
    case 30:
      uint64_t result = 0x754378614D6E696DLL;
      break;
    case 31:
      uint64_t result = 0x6F646E6957676962;
      break;
    case 32:
      uint64_t result = 0x6E69576C6C616D73;
      break;
    case 33:
      uint64_t result = 0x7041657669746361;
      break;
    case 34:
      uint64_t result = 0xD000000000000019;
      break;
    case 36:
      uint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AVLogColumns(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = AVLogColumns.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == AVLogColumns.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AVLogColumns()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  AVLogColumns.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AVLogColumns()
{
  AVLogColumns.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AVLogColumns()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  AVLogColumns.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AVLogColumns@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = specialized AVLogColumns.init(rawValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AVLogColumns@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AVLogColumns.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t specialized AVLogColumns.init(rawValue:)()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x25) {
    return 37;
  }
  else {
    return v0;
  }
}

unint64_t lazy protocol witness table accessor for type AVLogColumns and conformance AVLogColumns()
{
  unint64_t result = lazy protocol witness table cache variable for type AVLogColumns and conformance AVLogColumns;
  if (!lazy protocol witness table cache variable for type AVLogColumns and conformance AVLogColumns)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVLogColumns and conformance AVLogColumns);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AVLogColumns(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDC) {
    goto LABEL_17;
  }
  if (a2 + 36 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 36) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 36;
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
      return (*a1 | (v4 << 8)) - 36;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 36;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x25;
  int v8 = v6 - 37;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AVLogColumns(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 36 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 36) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDB)
  {
    unsigned int v6 = ((a2 - 220) >> 8) + 1;
    *unint64_t result = a2 + 36;
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
        JUMPOUT(0x100004E00);
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
          *unint64_t result = a2 + 36;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for AVLogColumns(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for AVLogColumns(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AVLogColumns()
{
  return &type metadata for AVLogColumns;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FunctionDescription.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void protocol witness for Hashable.hash(into:) in conformance FunctionDescription.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FunctionDescription.CodingKeys()
{
  if (*v0) {
    return 0x746E656D75677261;
  }
  else {
    return 1701667182;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FunctionDescription.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized FunctionDescription.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance FunctionDescription.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance FunctionDescription.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FunctionDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FunctionDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t FunctionDescription.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FunctionDescription.CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    v11[1] = v11[0];
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys);
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

uint64_t protocol witness for Decodable.init(from:) in conformance FunctionDescription@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance FunctionDescription((uint64_t (*)(void))specialized FunctionDescription.init(from:), a1);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FunctionDescription(void *a1)
{
  return FunctionDescription.encode(to:)(a1, *v1, v1[1], v1[2]);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance DataSampleFilterDescription.CodingKeys()
{
  if (*v0) {
    return 0x737265746C6966;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DataSampleFilterDescription.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized DataSampleFilterDescription.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DataSampleFilterDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DataSampleFilterDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t DataSampleFilterDescription.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DataSampleFilterDescription.CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    v11[1] = v11[0];
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FunctionDescription]);
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [FunctionDescription] and conformance <A> [A], &demangling cache variable for type metadata for [FunctionDescription], (void (*)(void))lazy protocol witness table accessor for type FunctionDescription and conformance FunctionDescription);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t protocol witness for Decodable.init(from:) in conformance DataSampleFilterDescription@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance FunctionDescription((uint64_t (*)(void))specialized DataSampleFilterDescription.init(from:), a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FunctionDescription@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance DataSampleFilterDescription(void *a1)
{
  return DataSampleFilterDescription.encode(to:)(a1, *v1, v1[1], v1[2]);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance VolumeChangeEventRetrievalDescription.CodingKeys()
{
  if (*v0) {
    return 0xD000000000000019;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance VolumeChangeEventRetrievalDescription.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized VolumeChangeEventRetrievalDescription.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance VolumeChangeEventRetrievalDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance VolumeChangeEventRetrievalDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

double protocol witness for Decodable.init(from:) in conformance VolumeChangeEventRetrievalDescription@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance VolumeChangeEventRetrievalDescription(a1, &demangling cache variable for type metadata for KeyedDecodingContainer<VolumeChangeEventRetrievalDescription.CodingKeys>, (void (*)(void))lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VolumeChangeEventRetrievalDescription(void *a1)
{
  return VolumeChangeEventRetrievalDescription.encode(to:)(a1, &demangling cache variable for type metadata for KeyedEncodingContainer<VolumeChangeEventRetrievalDescription.CodingKeys>, (void (*)(void))lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FunctionDescription.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FunctionDescription.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AggregatorDescription.CodingKeys()
{
  if (*v0) {
    return 0x6E6F6974636E7566;
  }
  else {
    return 0x614E63697274656DLL;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AggregatorDescription.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AggregatorDescription.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AggregatorDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AggregatorDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t VolumeChangeEventRetrievalDescription.encode(to:)(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v14) = 0;
  uint64_t v11 = v13[1];
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v11)
  {
    long long v14 = *(_OWORD *)(v5 + 16);
    uint64_t v15 = *(void *)(v5 + 32);
    char v16 = 1;
    lazy protocol witness table accessor for type FunctionDescription and conformance FunctionDescription();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

double protocol witness for Decodable.init(from:) in conformance AggregatorDescription@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance VolumeChangeEventRetrievalDescription(a1, &demangling cache variable for type metadata for KeyedDecodingContainer<AggregatorDescription.CodingKeys>, (void (*)(void))lazy protocol witness table accessor for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys, a2);
}

double protocol witness for Decodable.init(from:) in conformance VolumeChangeEventRetrievalDescription@<D0>(void *a1@<X0>, uint64_t *a2@<X3>, void (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  specialized VolumeChangeEventRetrievalDescription.init(from:)(a1, a2, a3, (uint64_t *)v8);
  if (!v4)
  {
    double result = *(double *)v8;
    long long v7 = v8[1];
    *(_OWORD *)a4 = v8[0];
    *(_OWORD *)(a4 + 16) = v7;
    *(void *)(a4 + 32) = v9;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AggregatorDescription(void *a1)
{
  return VolumeChangeEventRetrievalDescription.encode(to:)(a1, &demangling cache variable for type metadata for KeyedEncodingContainer<AggregatorDescription.CodingKeys>, (void (*)(void))lazy protocol witness table accessor for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance EvaluationJobDescription.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance EvaluationJobDescription.CodingKeys()
{
  unint64_t v1 = 0xD000000000000015;
  if (*v0 != 1) {
    unint64_t v1 = 0x7461676572676761;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EvaluationJobDescription.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized EvaluationJobDescription.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance EvaluationJobDescription.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EvaluationJobDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EvaluationJobDescription.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t EvaluationJobDescription.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EvaluationJobDescription.CodingKeys>);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v15 = a2;
  char v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DataSampleFilterDescription]);
  lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [DataSampleFilterDescription] and conformance <A> [A], &demangling cache variable for type metadata for [DataSampleFilterDescription], (void (*)(void))lazy protocol witness table accessor for type DataSampleFilterDescription and conformance DataSampleFilterDescription);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v4)
  {
    uint64_t v15 = v13;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [VolumeChangeEventRetrievalDescription]);
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [VolumeChangeEventRetrievalDescription] and conformance <A> [A], &demangling cache variable for type metadata for [VolumeChangeEventRetrievalDescription], (void (*)(void))lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v15 = a4;
    char v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AggregatorDescription]);
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [AggregatorDescription] and conformance <A> [A], &demangling cache variable for type metadata for [AggregatorDescription], (void (*)(void))lazy protocol witness table accessor for type AggregatorDescription and conformance AggregatorDescription);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t protocol witness for Decodable.init(from:) in conformance EvaluationJobDescription@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized EvaluationJobDescription.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance EvaluationJobDescription(void *a1)
{
  return EvaluationJobDescription.encode(to:)(a1, *v1, v1[1], v1[2]);
}

uint64_t specialized FunctionDescription.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E656D75677261 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized FunctionDescription.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FunctionDescription.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FunctionDescription.CodingKeys and conformance FunctionDescription.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    v9[15] = 1;
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t lazy protocol witness table accessor for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FunctionDescription and conformance FunctionDescription()
{
  unint64_t result = lazy protocol witness table cache variable for type FunctionDescription and conformance FunctionDescription;
  if (!lazy protocol witness table cache variable for type FunctionDescription and conformance FunctionDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionDescription and conformance FunctionDescription);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FunctionDescription and conformance FunctionDescription;
  if (!lazy protocol witness table cache variable for type FunctionDescription and conformance FunctionDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionDescription and conformance FunctionDescription);
  }
  return result;
}

uint64_t specialized DataSampleFilterDescription.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000100033670
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737265746C6966 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized DataSampleFilterDescription.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DataSampleFilterDescription.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DataSampleFilterDescription.CodingKeys and conformance DataSampleFilterDescription.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FunctionDescription]);
    v9[30] = 1;
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [FunctionDescription] and conformance <A> [A], &demangling cache variable for type metadata for [FunctionDescription], (void (*)(void))lazy protocol witness table accessor for type FunctionDescription and conformance FunctionDescription);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription.CodingKeys and conformance VolumeChangeEventRetrievalDescription.CodingKeys);
  }
  return result;
}

uint64_t specialized VolumeChangeEventRetrievalDescription.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x8000000100033690
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000001000336B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t lazy protocol witness table accessor for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AggregatorDescription.CodingKeys and conformance AggregatorDescription.CodingKeys);
  }
  return result;
}

uint64_t specialized AggregatorDescription.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x614E63697274656DLL && a2 == 0xEA0000000000656DLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6974636E7566 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized VolumeChangeEventRetrievalDescription.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  v21 = a4;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v22 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v4) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v10 = v7;
  char v12 = v21;
  uint64_t v11 = v22;
  LOBYTE(v23) = 0;
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v15 = v14;
  char v26 = 1;
  lazy protocol witness table accessor for type FunctionDescription and conformance FunctionDescription();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v11);
  uint64_t v17 = v23;
  uint64_t v16 = v24;
  uint64_t v18 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *char v12 = v13;
  v12[1] = v15;
  v12[2] = v17;
  v12[3] = v16;
  v12[4] = v18;
  return result;
}

unint64_t lazy protocol witness table accessor for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys;
  if (!lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DataSampleFilterDescription and conformance DataSampleFilterDescription()
{
  unint64_t result = lazy protocol witness table cache variable for type DataSampleFilterDescription and conformance DataSampleFilterDescription;
  if (!lazy protocol witness table cache variable for type DataSampleFilterDescription and conformance DataSampleFilterDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataSampleFilterDescription and conformance DataSampleFilterDescription);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DataSampleFilterDescription and conformance DataSampleFilterDescription;
  if (!lazy protocol witness table cache variable for type DataSampleFilterDescription and conformance DataSampleFilterDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataSampleFilterDescription and conformance DataSampleFilterDescription);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription()
{
  unint64_t result = lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription;
  if (!lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription;
  if (!lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AggregatorDescription and conformance AggregatorDescription()
{
  unint64_t result = lazy protocol witness table cache variable for type AggregatorDescription and conformance AggregatorDescription;
  if (!lazy protocol witness table cache variable for type AggregatorDescription and conformance AggregatorDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AggregatorDescription and conformance AggregatorDescription);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AggregatorDescription and conformance AggregatorDescription;
  if (!lazy protocol witness table cache variable for type AggregatorDescription and conformance AggregatorDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AggregatorDescription and conformance AggregatorDescription);
  }
  return result;
}

uint64_t specialized EvaluationJobDescription.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000001000336D0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001000336F0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7461676572676761 && a2 == 0xEB0000000073726FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t specialized EvaluationJobDescription.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EvaluationJobDescription.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  lazy protocol witness table accessor for type EvaluationJobDescription.CodingKeys and conformance EvaluationJobDescription.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DataSampleFilterDescription]);
    char v10 = 0;
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [DataSampleFilterDescription] and conformance <A> [A], &demangling cache variable for type metadata for [DataSampleFilterDescription], (void (*)(void))lazy protocol witness table accessor for type DataSampleFilterDescription and conformance DataSampleFilterDescription);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v7 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [VolumeChangeEventRetrievalDescription]);
    char v10 = 1;
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [VolumeChangeEventRetrievalDescription] and conformance <A> [A], &demangling cache variable for type metadata for [VolumeChangeEventRetrievalDescription], (void (*)(void))lazy protocol witness table accessor for type VolumeChangeEventRetrievalDescription and conformance VolumeChangeEventRetrievalDescription);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AggregatorDescription]);
    char v10 = 2;
    lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](&lazy protocol witness table cache variable for type [AggregatorDescription] and conformance <A> [A], &demangling cache variable for type metadata for [AggregatorDescription], (void (*)(void))lazy protocol witness table accessor for type AggregatorDescription and conformance AggregatorDescription);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for FunctionDescription()
{
  return &type metadata for FunctionDescription;
}

uint64_t destroy for FunctionDescription()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for FunctionDescription(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FunctionDescription(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FunctionDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FunctionDescription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FunctionDescription(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataSampleFilterDescription()
{
  return &type metadata for DataSampleFilterDescription;
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

ValueMetadata *type metadata accessor for VolumeChangeEventRetrievalDescription()
{
  return &type metadata for VolumeChangeEventRetrievalDescription;
}

uint64_t initializeBufferWithCopyOfBuffer for AggregatorDescription(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VolumeChangeEventRetrievalDescription()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for VolumeChangeEventRetrievalDescription(void *a1, void *a2)
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
  return a1;
}

void *assignWithCopy for VolumeChangeEventRetrievalDescription(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for VolumeChangeEventRetrievalDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VolumeChangeEventRetrievalDescription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VolumeChangeEventRetrievalDescription(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AggregatorDescription()
{
  return &type metadata for AggregatorDescription;
}

uint64_t destroy for EvaluationJobDescription()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for EvaluationJobDescription(void *a1, void *a2)
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

void *assignWithCopy for EvaluationJobDescription(void *a1, void *a2)
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

uint64_t assignWithTake for EvaluationJobDescription(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EvaluationJobDescription(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EvaluationJobDescription(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EvaluationJobDescription()
{
  return &type metadata for EvaluationJobDescription;
}

uint64_t getEnumTagSinglePayload for EvaluationJobDescription.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EvaluationJobDescription.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000793CLL);
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

void *type metadata accessor for EvaluationJobDescription.CodingKeys()
{
  return &unk_100039558;
}

void *type metadata accessor for AggregatorDescription.CodingKeys()
{
  return &unk_1000395E8;
}

void *type metadata accessor for VolumeChangeEventRetrievalDescription.CodingKeys()
{
  return &unk_100039678;
}

void *type metadata accessor for DataSampleFilterDescription.CodingKeys()
{
  return &unk_100039708;
}

uint64_t getEnumTagSinglePayload for AggregatorDescription.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AggregatorDescription.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100007B08);
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

unsigned char *destructiveInjectEnumTag for FunctionDescription.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

void *type metadata accessor for FunctionDescription.CodingKeys()
{
  return &unk_100039798;
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

uint64_t lazy protocol witness table accessor for type [FunctionDescription] and conformance <A> [A](unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t ExpectedAggregationFunctions.rawValue.getter(char a1)
{
  unint64_t result = 0x736F5065736C6166;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x67654E65736C6166;
      break;
    case 2:
      unint64_t result = 0x69736F5065757274;
      break;
    case 3:
      unint64_t result = 0x65676172657661;
      break;
    case 4:
      unint64_t result = 0x6D6153746E756F63;
      break;
    case 5:
      unint64_t result = 0x657645746E756F63;
      break;
    case 6:
      unint64_t result = 0xD000000000000031;
      break;
    case 7:
      unint64_t result = 0xD000000000000017;
      break;
    case 8:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpectedAggregationFunctions(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x736F5065736C6166;
  unint64_t v3 = 0xEE00736576697469;
  uint64_t v4 = a1;
  unint64_t v5 = 0x736F5065736C6166;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x67654E65736C6166;
      unint64_t v3 = 0xEE00736576697461;
      break;
    case 2:
      unint64_t v5 = 0x69736F5065757274;
      unint64_t v3 = 0xED00007365766974;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x65676172657661;
      break;
    case 4:
      unint64_t v5 = 0x6D6153746E756F63;
      unint64_t v3 = 0xEC00000073656C70;
      break;
    case 5:
      unint64_t v5 = 0x657645746E756F63;
      unint64_t v3 = 0xEB0000000073746ELL;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000031;
      unsigned int v6 = "countManualVolumeChangesInReactionToEnvVolChanges";
      goto LABEL_10;
    case 7:
      unint64_t v3 = 0x80000001000337A0;
      unint64_t v5 = 0xD000000000000017;
      break;
    case 8:
      unint64_t v5 = 0xD00000000000001CLL;
      unsigned int v6 = "manualVolumeChangeLikelihood";
LABEL_10:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xEE00736576697469;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x67654E65736C6166;
      unint64_t v7 = 0xEE00736576697461;
      break;
    case 2:
      unint64_t v2 = 0x69736F5065757274;
      unint64_t v7 = 0xED00007365766974;
      break;
    case 3:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v2 = 0x65676172657661;
      break;
    case 4:
      unint64_t v2 = 0x6D6153746E756F63;
      unint64_t v7 = 0xEC00000073656C70;
      break;
    case 5:
      unint64_t v2 = 0x657645746E756F63;
      unint64_t v7 = 0xEB0000000073746ELL;
      break;
    case 6:
      unint64_t v2 = 0xD000000000000031;
      int v8 = "countManualVolumeChangesInReactionToEnvVolChanges";
      goto LABEL_20;
    case 7:
      unint64_t v7 = 0x80000001000337A0;
      unint64_t v2 = 0xD000000000000017;
      break;
    case 8:
      unint64_t v2 = 0xD00000000000001CLL;
      int v8 = "manualVolumeChangeLikelihood";
LABEL_20:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpectedAggregationFunctions()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ExpectedAggregationFunctions()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpectedAggregationFunctions()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedAggregationFunctions@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized ExpectedAggregationFunctions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ExpectedAggregationFunctions@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ExpectedAggregationFunctions.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t ExpectedAggregationArguments.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x73746E657665;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0x6E6D756C6F63;
      break;
    case 5:
      unint64_t result = 0x6D614E6563696C73;
      break;
    case 6:
      unint64_t result = 0xD000000000000019;
      break;
    case 7:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000015;
      break;
    case 10:
      unint64_t result = 0xD000000000000017;
      break;
    case 11:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 12:
      unint64_t result = 0x456D756D696E696DLL;
      break;
    case 13:
      unint64_t result = 0xD000000000000012;
      break;
    case 14:
      unint64_t result = 0xD000000000000016;
      break;
    case 16:
      unint64_t result = 0xD000000000000012;
      break;
    case 17:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpectedAggregationArguments(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = ExpectedAggregationArguments.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == ExpectedAggregationArguments.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpectedAggregationArguments()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  ExpectedAggregationArguments.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ExpectedAggregationArguments()
{
  ExpectedAggregationArguments.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpectedAggregationArguments()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  ExpectedAggregationArguments.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedAggregationArguments@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = specialized ExpectedAggregationArguments.init(rawValue:)();
  *a1 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ExpectedAggregationArguments@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ExpectedAggregationArguments.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *static AggregationFunctions.run(aggregator:dataSlices:volumeChangeEventSets:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&long long v455 = a3;
  uint64_t v449 = a2;
  uint64_t v440 = 0;
  uint64_t v4 = type metadata accessor for Metric(0);
  uint64_t v446 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v425 = (uint64_t)&v423 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v426 = type metadata accessor for ManualVolumeChange();
  uint64_t v423 = *(void *)(v426 - 8);
  uint64_t v6 = __chkstk_darwin(v426);
  uint64_t v427 = (uint64_t)&v423 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v424 = (char *)&v423 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  v442 = (char *)&v423 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v444 = (char *)&v423 - v12;
  uint64_t v445 = type metadata accessor for DataFrame();
  uint64_t v443 = *(void *)(v445 - 8);
  __chkstk_darwin(v445);
  uint64_t v450 = (uint64_t)&v423 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DataSlice(0);
  uint64_t v451 = *(void *)(v14 - 8);
  uint64_t v452 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v432 = (uint64_t)&v423 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v436 = (uint64_t)&v423 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v439 = (uint64_t)&v423 - v20;
  __chkstk_darwin(v19);
  uint64_t v433 = (uint64_t)&v423 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  v434 = (char *)&v423 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  v437 = (char *)&v423 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v441 = (char *)&v423 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v435 = (uint64_t)&v423 - v30;
  __chkstk_darwin(v29);
  uint64_t v448 = (uint64_t)&v423 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EventSet?);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  v438 = (char *)&v423 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  v454 = (char *)&v423 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v39 = (char *)&v423 - v38;
  uint64_t v40 = __chkstk_darwin(v37);
  uint64_t v429 = (uint64_t)&v423 - v41;
  __chkstk_darwin(v40);
  uint64_t v431 = (uint64_t)&v423 - v42;
  v43 = (void (*)(uint64_t, uint64_t))type metadata accessor for EventSet(0);
  uint64_t v456 = *((void *)v43 - 1);
  v457 = v43;
  uint64_t v44 = __chkstk_darwin(v43);
  uint64_t v453 = (uint64_t)&v423 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __chkstk_darwin(v44);
  uint64_t v428 = (uint64_t)&v423 - v47;
  __chkstk_darwin(v46);
  uint64_t v430 = (uint64_t)&v423 - v48;
  uint64_t v50 = *(void *)(a1 + 16);
  uint64_t v49 = *(void *)(a1 + 24);
  v447 = (long long *)a1;
  uint64_t v51 = *(void *)(a1 + 32);
  if (!*(void *)(v51 + 16)) {
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x80000001000337E0);
  char v53 = v52;
  swift_bridgeObjectRelease();
  if (v53)
  {
    if (!*(void *)(v51 + 16)) {
      goto LABEL_31;
    }
    swift_bridgeObjectRetain();
    specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x8000000100033800);
    char v55 = v54;
    swift_bridgeObjectRelease();
    if (v55)
    {
      if (!*(void *)(v51 + 16)) {
        return (char *)&_swiftEmptyArrayStorage;
      }
      unint64_t v56 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x8000000100033800);
      if ((v57 & 1) == 0 || !*(void *)(v51 + 16)) {
        return (char *)&_swiftEmptyArrayStorage;
      }
      v58 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v56);
      uint64_t v60 = *v58;
      uint64_t v59 = v58[1];
      swift_bridgeObjectRetain();
      unint64_t v61 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x80000001000337E0);
      if ((v62 & 1) != 0 && *(void *)(v51 + 16))
      {
        v63 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v61);
        uint64_t v65 = *v63;
        uint64_t v64 = v63[1];
        swift_bridgeObjectRetain();
        unint64_t v66 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001BLL, 0x8000000100033820);
        if (v67)
        {
          v68 = (double *)(*(void *)(v51 + 56) + 16 * v66);
          double v70 = *v68;
          uint64_t v69 = *((void *)v68 + 1);
          double v461 = 0.0;
          uint64_t v71 = __chkstk_darwin(v66);
          *(&v423 - 2) = (uint64_t)&v461;
          if ((v69 & 0x1000000000000000) != 0
            || !(v69 & 0x2000000000000000 | *(void *)&v70 & 0x1000000000000000))
          {
            swift_bridgeObjectRetain();
            _StringGuts._slowWithCString<A>(_:)();
            swift_bridgeObjectRelease();
            if (v460) {
              goto LABEL_17;
            }
          }
          else
          {
            __chkstk_darwin(v71);
            *(&v423 - 2) = (uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:);
            *(&v423 - 1) = (uint64_t)(&v423 - 4);
            if ((v69 & 0x2000000000000000) != 0)
            {
              double v458 = v70;
              uint64_t v459 = v69 & 0xFFFFFFFFFFFFFFLL;
              swift_bridgeObjectRetain();
              if (LOBYTE(v70) <= 0x20u && ((1 << SLOBYTE(v70)) & 0x100003E01) != 0
                || (v382 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                int v383 = *v382;
                swift_bridgeObjectRelease();
                if (!v383) {
                  goto LABEL_17;
                }
              }
            }
            else
            {
              if ((*(void *)&v70 & 0x1000000000000000) != 0)
              {
                uint64_t v72 = (v69 & 0xFFFFFFFFFFFFFFFLL) + 32;
                uint64_t v73 = *(void *)&v70 & 0xFFFFFFFFFFFFLL;
              }
              else
              {
                uint64_t v72 = _StringObject.sharedUTF8.getter();
                uint64_t v73 = v416;
              }
              swift_bridgeObjectRetain();
              char v74 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(v72, v73, (void (*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
              swift_bridgeObjectRelease();
              if (v74)
              {
LABEL_17:
                double v75 = v461;
                uint64_t v76 = v455;
                if (*(void *)(v455 + 16))
                {
                  unint64_t v77 = specialized __RawDictionaryStorage.find<A>(_:)(v60, v59);
                  v78 = v457;
                  uint64_t v79 = v431;
                  uint64_t v81 = v456;
                  if (v80)
                  {
                    outlined init with copy of DataSlice(*(void *)(v76 + 56) + *(void *)(v456 + 72) * v77, v431, type metadata accessor for EventSet);
                    v82 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v81 + 56);
                    v82(v79, 0, 1, v78);
                  }
                  else
                  {
                    v82 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v456 + 56);
                    v82(v431, 1, 1, v457);
                  }
                }
                else
                {
                  uint64_t v81 = v456;
                  v78 = v457;
                  v82 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v456 + 56);
                  uint64_t v79 = v431;
                  v82(v431, 1, 1, v457);
                }
                swift_bridgeObjectRelease();
                v376 = *(unsigned int (**)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v81 + 48);
                if (v376(v79, 1, v78) == 1)
                {
                  swift_bridgeObjectRelease();
                  v131 = &demangling cache variable for type metadata for EventSet?;
                  uint64_t v272 = v79;
                  goto LABEL_167;
                }
                outlined init with take of DataSlice(v79, v430, type metadata accessor for EventSet);
                if (*(void *)(v76 + 16))
                {
                  unint64_t v377 = specialized __RawDictionaryStorage.find<A>(_:)(v65, v64);
                  if (v378)
                  {
                    uint64_t v81 = v456;
                    uint64_t v379 = *(void *)(v76 + 56) + *(void *)(v456 + 72) * v377;
                    uint64_t v380 = v429;
                    outlined init with copy of DataSlice(v379, v429, type metadata accessor for EventSet);
                    uint64_t v381 = 0;
LABEL_225:
                    v82(v380, v381, 1, v78);
                    swift_bridgeObjectRelease();
                    if (v376(v380, 1, v78) == 1)
                    {
                      outlined destroy of DataSlice?(v380, &demangling cache variable for type metadata for EventSet?);
                      v268 = type metadata accessor for EventSet;
                      v269 = &v461;
                      goto LABEL_148;
                    }
                    uint64_t v384 = v428;
                    outlined init with take of DataSlice(v380, v428, type metadata accessor for EventSet);
                    uint64_t v385 = v430;
                    v386 = v447;
                    specialized static AggregationFunctions.runVolumeChangeAggregation(aggregator:userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(v447, v430 + *((int *)v78 + 5), (v384 + *((int *)v78 + 5)), v75);
                    double v388 = v387;
                    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>);
                    unint64_t v389 = (*(unsigned __int8 *)(v446 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v446 + 80);
                    v248 = (char *)swift_allocObject();
                    *((_OWORD *)v248 + 1) = xmmword_100032B90;
                    v457 = (void (*)(uint64_t, uint64_t))&v248[v389];
                    uint64_t v390 = *(void *)v386;
                    uint64_t v391 = *((void *)v386 + 1);
                    uint64_t v456 = v390;
                    uint64_t v392 = v452;
                    swift_bridgeObjectRetain();
                    uint64_t v393 = specialized static AggregationFunctions.controllerVersion(from:)();
                    *(void *)&long long v455 = v394;
                    uint64_t v395 = v448;
                    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v451 + 56))(v448, 1, 1, v392);
                    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<EventSet>);
                    uint64_t v396 = *(void *)(v81 + 72);
                    unint64_t v397 = (*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
                    uint64_t v398 = swift_allocObject();
                    *(_OWORD *)(v398 + 16) = xmmword_100032BA0;
                    uint64_t v399 = v398 + v397;
                    outlined init with copy of DataSlice(v385, v399, type metadata accessor for EventSet);
                    outlined init with copy of DataSlice(v384, v399 + v396, type metadata accessor for EventSet);
                    Metric.init(metricName:metricValue:controllerVersion:originDataSlice:originEventSets:)(v456, v391, v393, v455, v395, v398, (uint64_t)v457, v388);
                    outlined destroy of DataSlice(v384, type metadata accessor for EventSet);
                    uint64_t v284 = v385;
                    v285 = type metadata accessor for EventSet;
                    goto LABEL_161;
                  }
                  uint64_t v381 = 1;
                  uint64_t v81 = v456;
                }
                else
                {
                  uint64_t v381 = 1;
                }
                uint64_t v380 = v429;
                goto LABEL_225;
              }
            }
          }
        }
        swift_bridgeObjectRelease();
      }
LABEL_153:
      swift_bridgeObjectRelease();
      return (char *)&_swiftEmptyArrayStorage;
    }
  }
  if (*(void *)(v51 + 16))
  {
    swift_bridgeObjectRetain();
    specialized __RawDictionaryStorage.find<A>(_:)(0x6E6D756C6F63, 0xE600000000000000);
    char v84 = v83;
    swift_bridgeObjectRelease();
    if (v84)
    {
      if (*(void *)(v51 + 16))
      {
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(0x6D614E6563696C73, 0xE900000000000065);
        char v86 = v85;
        swift_bridgeObjectRelease();
        if (v86)
        {
          if (!*(void *)(v51 + 16)) {
            return (char *)&_swiftEmptyArrayStorage;
          }
          unint64_t v87 = specialized __RawDictionaryStorage.find<A>(_:)(0x6D614E6563696C73, 0xE900000000000065);
          if ((v88 & 1) == 0 || !*(void *)(v51 + 16)) {
            return (char *)&_swiftEmptyArrayStorage;
          }
          v89 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v87);
          uint64_t v91 = *v89;
          uint64_t v90 = v89[1];
          swift_bridgeObjectRetain();
          unint64_t v92 = specialized __RawDictionaryStorage.find<A>(_:)(0x6E6D756C6F63, 0xE600000000000000);
          if ((v93 & 1) == 0) {
            goto LABEL_153;
          }
          v94 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v92);
          uint64_t v96 = *v94;
          v95 = (void *)v94[1];
          uint64_t v97 = v449;
          if (*(void *)(v449 + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v98 = specialized __RawDictionaryStorage.find<A>(_:)(v91, v90);
            uint64_t v100 = v451;
            if (v99)
            {
              uint64_t v101 = *(void *)(v97 + 56) + *(void *)(v451 + 72) * v98;
              uint64_t v102 = v435;
              outlined init with copy of DataSlice(v101, v435, type metadata accessor for DataSlice);
              v103 = *(void (**)(uint64_t, uint64_t))(v100 + 56);
              uint64_t v104 = v102;
              uint64_t v105 = 0;
            }
            else
            {
              v103 = *(void (**)(uint64_t, uint64_t))(v451 + 56);
              uint64_t v102 = v435;
              uint64_t v104 = v435;
              uint64_t v105 = 1;
            }
            uint64_t v271 = v452;
            ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v103)(v104, v105, 1, v452);
          }
          else
          {
            uint64_t v100 = v451;
            uint64_t v271 = v452;
            v103 = *(void (**)(uint64_t, uint64_t))(v451 + 56);
            uint64_t v102 = v435;
            ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v103)(v435, 1, 1, v452);
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v102, 1, v271) == 1)
          {
            swift_bridgeObjectRelease();
            v131 = &demangling cache variable for type metadata for DataSlice?;
            uint64_t v272 = v102;
LABEL_167:
            outlined destroy of DataSlice?(v272, v131);
            return (char *)&_swiftEmptyArrayStorage;
          }
          uint64_t v273 = v102;
          uint64_t v274 = v433;
          outlined init with take of DataSlice(v273, v433, type metadata accessor for DataSlice);
          double v275 = specialized static AggregationFunctions.runDescriptiveAggregation(aggregator:on:column:)(v50, v49, v274 + *(int *)(v271 + 20), v96, v95);
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>);
          uint64_t v276 = *(unsigned __int8 *)(v446 + 80);
          v457 = v103;
          uint64_t v277 = (v276 + 32) & ~v276;
          v248 = (char *)swift_allocObject();
          *((_OWORD *)v248 + 1) = xmmword_100032B90;
          uint64_t v278 = *(void *)v447;
          uint64_t v279 = *((void *)v447 + 1);
          swift_bridgeObjectRetain();
          uint64_t v280 = specialized static AggregationFunctions.controllerVersion(from:)();
          uint64_t v282 = v281;
          uint64_t v283 = v448;
          outlined init with copy of DataSlice(v274, v448, type metadata accessor for DataSlice);
          ((void (*)(uint64_t, void, uint64_t, uint64_t))v457)(v283, 0, 1, v452);
          Metric.init(metricName:metricValue:controllerVersion:originDataSlice:originEventSets:)(v278, v279, v280, v282, v283, 0, (uint64_t)&v248[v277], v275);
          uint64_t v284 = v274;
          goto LABEL_160;
        }
      }
    }
  }
LABEL_31:
  if ((v50 != 0x657645746E756F63 || v49 != 0xEB0000000073746ELL)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    if (v50 == 0xD000000000000031 && v49 == 0x8000000100033760
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      if (!*(void *)(v51 + 16)) {
        return (char *)&_swiftEmptyArrayStorage;
      }
      unint64_t v118 = specialized __RawDictionaryStorage.find<A>(_:)(0x6D614E6563696C73, 0xE900000000000065);
      if ((v119 & 1) == 0) {
        return (char *)&_swiftEmptyArrayStorage;
      }
      uint64_t v120 = v449;
      if (*(void *)(v449 + 16))
      {
        v121 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v118);
        uint64_t v123 = *v121;
        uint64_t v122 = v121[1];
        swift_bridgeObjectRetain();
        unint64_t v124 = specialized __RawDictionaryStorage.find<A>(_:)(v123, v122);
        uint64_t v125 = v451;
        v39 = v441;
        if (v126)
        {
          outlined init with copy of DataSlice(*(void *)(v120 + 56) + *(void *)(v451 + 72) * v124, (uint64_t)v441, type metadata accessor for DataSlice);
          v127 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v125 + 56);
          uint64_t v128 = (uint64_t)v39;
          uint64_t v129 = 0;
        }
        else
        {
          v127 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v451 + 56);
          uint64_t v128 = (uint64_t)v441;
          uint64_t v129 = 1;
        }
        uint64_t v163 = v452;
        v127(v128, v129, 1, v452);
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v125 + 48))(v39, 1, v163) != 1)
        {
          uint64_t v164 = v439;
          outlined init with take of DataSlice((uint64_t)v39, v439, type metadata accessor for DataSlice);
          if (!*(void *)(v51 + 16)) {
            goto LABEL_205;
          }
          unint64_t v165 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001DLL, 0x8000000100033870);
          if ((v166 & 1) == 0) {
            goto LABEL_205;
          }
          v167 = (double *)(*(void *)(v51 + 56) + 16 * v165);
          double v169 = *v167;
          uint64_t v168 = *((void *)v167 + 1);
          double v461 = 0.0;
          uint64_t v170 = __chkstk_darwin(v165);
          *(&v423 - 2) = (uint64_t)&v461;
          if ((v168 & 0x1000000000000000) != 0
            || !(v168 & 0x2000000000000000 | *(void *)&v169 & 0x1000000000000000))
          {
            swift_bridgeObjectRetain();
            _StringGuts._slowWithCString<A>(_:)();
            swift_bridgeObjectRelease();
            if (v460) {
              goto LABEL_77;
            }
          }
          else
          {
            __chkstk_darwin(v170);
            *(&v423 - 2) = (uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:);
            *(&v423 - 1) = (uint64_t)(&v423 - 4);
            if ((v168 & 0x2000000000000000) != 0)
            {
              double v458 = v169;
              uint64_t v459 = v168 & 0xFFFFFFFFFFFFFFLL;
              swift_bridgeObjectRetain();
              if (LOBYTE(v169) <= 0x20u && ((1 << SLOBYTE(v169)) & 0x100003E01) != 0
                || (v374 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                int v375 = *v374;
                swift_bridgeObjectRelease();
                if (!v375) {
                  goto LABEL_77;
                }
              }
            }
            else
            {
              if ((*(void *)&v169 & 0x1000000000000000) != 0)
              {
                uint64_t v171 = (v168 & 0xFFFFFFFFFFFFFFFLL) + 32;
                uint64_t v172 = *(void *)&v169 & 0xFFFFFFFFFFFFLL;
              }
              else
              {
                uint64_t v171 = _StringObject.sharedUTF8.getter();
                uint64_t v172 = v415;
              }
              swift_bridgeObjectRetain();
              char v173 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(v171, v172, (void (*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
              swift_bridgeObjectRelease();
              if (v173)
              {
LABEL_77:
                uint64_t v164 = v439;
                if (*(void *)(v51 + 16))
                {
                  double v174 = v461;
                  unint64_t v175 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001CLL, 0x8000000100033890);
                  if (v176)
                  {
                    v177 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v175);
                    uint64_t v178 = *v177;
                    uint64_t v179 = v177[1];
                    double v458 = 0.0;
                    __chkstk_darwin(v175);
                    *(&v423 - 2) = (uint64_t)&v458;
                    swift_bridgeObjectRetain();
                    LOBYTE(v178) = specialized String.withCString<A>(_:)((uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:), (uint64_t)(&v423 - 4), v178, v179);
                    swift_bridgeObjectRelease();
                    if (v178)
                    {
                      if (*(void *)(v51 + 16))
                      {
                        double v180 = v458;
                        unint64_t v181 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000015, 0x80000001000338B0);
                        if (v182)
                        {
                          v183 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v181);
                          uint64_t v184 = *v183;
                          unint64_t v185 = v183[1];
                          swift_bridgeObjectRetain();
                          uint64_t v186 = specialized FixedWidthInteger.init(_:)(v184, v185);
                          if ((v187 & 1) == 0)
                          {
                            if (*(void *)(v51 + 16))
                            {
                              uint64_t v188 = v186;
                              unint64_t v189 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000017, 0x80000001000338D0);
                              if (v190)
                              {
                                v191 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v189);
                                uint64_t v193 = *v191;
                                unint64_t v192 = v191[1];
                                swift_bridgeObjectRetain();
                                uint64_t v194 = specialized FixedWidthInteger.init(_:)(v193, v192);
                                if ((v195 & 1) == 0)
                                {
                                  uint64_t v196 = v194;
                                  uint64_t v197 = specialized Dictionary.subscript.getter(0xD00000000000001BLL, 0x80000001000338F0, v51);
                                  if (v198)
                                  {
                                    uint64_t v199 = specialized FixedWidthInteger.init(_:)(v197, v198);
                                    if ((v200 & 1) == 0)
                                    {
                                      uint64_t v201 = v199;
                                      type metadata accessor for ManualVolumeChangeFunctions();
                                      v202 = static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)((void (*)(uint64_t, uint64_t))(v439 + *(int *)(v452 + 20)), v188, v196, v201, v174);
                                      uint64_t v203 = v202[2];
                                      if (v203)
                                      {
                                        v204 = &v424[*(int *)(v426 + 24)];
                                        uint64_t v205 = (uint64_t)v202
                                             + ((*(unsigned __int8 *)(v423 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v423 + 80));
                                        uint64_t v206 = *(void *)(v423 + 72);
                                        double v207 = fabs(v180);
                                        double v208 = 0.0;
                                        uint64_t v209 = (uint64_t)v424;
                                        do
                                        {
                                          outlined init with copy of DataSlice(v205, v209, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
                                          double v210 = *(double *)v204;
                                          char v211 = v204[8];
                                          outlined destroy of DataSlice(v209, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
                                          if (!(v211 & 1 | (v207 >= v210))) {
                                            double v208 = v208 + 1.0;
                                          }
                                          v205 += v206;
                                          --v203;
                                        }
                                        while (v203);
                                        swift_bridgeObjectRelease();
                                      }
                                      else
                                      {
                                        swift_bridgeObjectRelease();
                                        double v208 = 0.0;
                                      }
                                      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>);
                                      unint64_t v417 = (*(unsigned __int8 *)(v446 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v446 + 80);
                                      v248 = (char *)swift_allocObject();
                                      *((_OWORD *)v248 + 1) = xmmword_100032B90;
                                      uint64_t v418 = *(void *)v447;
                                      uint64_t v419 = *((void *)v447 + 1);
                                      swift_bridgeObjectRetain();
                                      uint64_t v420 = specialized static AggregationFunctions.controllerVersion(from:)();
                                      uint64_t v336 = v421;
                                      uint64_t v328 = v439;
                                      uint64_t v337 = v448;
                                      outlined init with copy of DataSlice(v439, v448, type metadata accessor for DataSlice);
                                      v127(v337, 0, 1, v452);
                                      uint64_t v338 = (uint64_t)&v248[v417];
                                      uint64_t v339 = v418;
                                      uint64_t v340 = v419;
                                      double v341 = v208;
                                      uint64_t v342 = v420;
                                      goto LABEL_249;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    goto LABEL_147;
                  }
                }
LABEL_205:
                v268 = type metadata accessor for DataSlice;
                uint64_t v270 = v164;
                goto LABEL_206;
              }
            }
          }
LABEL_147:
          v268 = type metadata accessor for DataSlice;
          v269 = (double *)&v466;
          goto LABEL_148;
        }
LABEL_165:
        v131 = &demangling cache variable for type metadata for DataSlice?;
        goto LABEL_166;
      }
      v161 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v451 + 56);
      v162 = &v467;
LABEL_66:
      v39 = (char *)*(v162 - 32);
      v161(v39, 1, 1, v452);
      goto LABEL_165;
    }
    if ((v50 != 0xD000000000000017 || v49 != 0x80000001000337A0)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if ((v50 != 0xD00000000000001CLL || v49 != 0x80000001000337C0)
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        return (char *)&_swiftEmptyArrayStorage;
      }
      if (!*(void *)(v51 + 16)) {
        return (char *)&_swiftEmptyArrayStorage;
      }
      unint64_t v212 = specialized __RawDictionaryStorage.find<A>(_:)(0x6D614E6563696C73, 0xE900000000000065);
      if ((v213 & 1) == 0) {
        return (char *)&_swiftEmptyArrayStorage;
      }
      uint64_t v214 = v449;
      if (!*(void *)(v449 + 16))
      {
        v161 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v451 + 56);
        v162 = &v463;
        goto LABEL_66;
      }
      v215 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v212);
      uint64_t v217 = *v215;
      uint64_t v216 = v215[1];
      swift_bridgeObjectRetain();
      unint64_t v218 = specialized __RawDictionaryStorage.find<A>(_:)(v217, v216);
      uint64_t v219 = v451;
      v39 = v434;
      if (v220)
      {
        outlined init with copy of DataSlice(*(void *)(v214 + 56) + *(void *)(v451 + 72) * v218, (uint64_t)v434, type metadata accessor for DataSlice);
        v221 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v219 + 56);
        uint64_t v222 = (uint64_t)v39;
        uint64_t v223 = 0;
      }
      else
      {
        v221 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v451 + 56);
        uint64_t v222 = (uint64_t)v434;
        uint64_t v223 = 1;
      }
      uint64_t v286 = v452;
      v221(v222, v223, 1, v452);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v219 + 48))(v39, 1, v286) == 1) {
        goto LABEL_165;
      }
      uint64_t v164 = v432;
      outlined init with take of DataSlice((uint64_t)v39, v432, type metadata accessor for DataSlice);
      if (!*(void *)(v51 + 16)) {
        goto LABEL_205;
      }
      unint64_t v288 = specialized __RawDictionaryStorage.find<A>(_:)(0x456D756D696E696DLL, 0xEF61746C6544766ELL);
      if ((v289 & 1) == 0) {
        goto LABEL_205;
      }
      v290 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v288);
      uint64_t v291 = *v290;
      uint64_t v292 = v290[1];
      double v458 = 0.0;
      __chkstk_darwin(v288);
      *(&v423 - 2) = (uint64_t)&v458;
      swift_bridgeObjectRetain();
      LOBYTE(v291) = specialized String.withCString<A>(_:)((uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:), (uint64_t)(&v423 - 4), v291, v292);
      swift_bridgeObjectRelease();
      if (v291)
      {
        if (*(void *)(v51 + 16))
        {
          double v293 = v458;
          unint64_t v294 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000012, 0x8000000100033920);
          if (v295)
          {
            v296 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v294);
            uint64_t v297 = *v296;
            unint64_t v298 = v296[1];
            swift_bridgeObjectRetain();
            uint64_t v299 = specialized FixedWidthInteger.init(_:)(v297, v298);
            if ((v300 & 1) == 0)
            {
              if (*(void *)(v51 + 16))
              {
                uint64_t v301 = v299;
                unint64_t v302 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000016, 0x8000000100033940);
                if (v303)
                {
                  v304 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v302);
                  uint64_t v306 = *v304;
                  unint64_t v305 = v304[1];
                  swift_bridgeObjectRetain();
                  uint64_t v307 = specialized FixedWidthInteger.init(_:)(v306, v305);
                  if ((v308 & 1) == 0)
                  {
                    if (*(void *)(v51 + 16))
                    {
                      uint64_t v309 = v307;
                      unint64_t v310 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x8000000100033960);
                      if (v311)
                      {
                        v312 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v310);
                        uint64_t v314 = *v312;
                        unint64_t v313 = v312[1];
                        swift_bridgeObjectRetain();
                        uint64_t v315 = specialized FixedWidthInteger.init(_:)(v314, v313);
                        if ((v316 & 1) == 0)
                        {
                          uint64_t v317 = v315;
                          uint64_t v318 = specialized Dictionary.subscript.getter(0xD000000000000012, 0x8000000100033980, v51);
                          if (v319)
                          {
                            uint64_t v320 = specialized FixedWidthInteger.init(_:)(v318, v319);
                            if ((v321 & 1) == 0)
                            {
                              uint64_t v322 = v320;
                              uint64_t v323 = specialized Dictionary.subscript.getter(0xD000000000000017, 0x80000001000339A0, v51);
                              if (v324)
                              {
                                uint64_t v325 = specialized FixedWidthInteger.init(_:)(v323, v324);
                                if ((v326 & 1) == 0)
                                {
                                  uint64_t v327 = v325;
                                  type metadata accessor for ManualVolumeChangeFunctions();
                                  uint64_t v328 = v432;
                                  static ManualVolumeChangeFunctions.manualVolumeChangeLikelihood(in:minimumEnvDelta:beforeWindowLength:transitionWindowLength:afterWindowLength:searchWindowLength:envChangeCooldownPeriod:)(v432 + *(int *)(v452 + 20), v301, v309, v317, v322, v327, v293);
                                  double v330 = v329;
                                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>);
                                  unint64_t v331 = (*(unsigned __int8 *)(v446 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v446 + 80);
                                  v248 = (char *)swift_allocObject();
                                  *((_OWORD *)v248 + 1) = xmmword_100032B90;
                                  uint64_t v332 = *(void *)v447;
                                  uint64_t v333 = *((void *)v447 + 1);
                                  swift_bridgeObjectRetain();
                                  uint64_t v334 = specialized static AggregationFunctions.controllerVersion(from:)();
                                  uint64_t v336 = v335;
                                  uint64_t v337 = v448;
                                  outlined init with copy of DataSlice(v328, v448, type metadata accessor for DataSlice);
                                  v221(v337, 0, 1, v452);
                                  uint64_t v338 = (uint64_t)&v248[v331];
                                  uint64_t v339 = v332;
                                  uint64_t v340 = v333;
                                  double v341 = v330;
                                  uint64_t v342 = v334;
LABEL_249:
                                  Metric.init(metricName:metricValue:controllerVersion:originDataSlice:originEventSets:)(v339, v340, v342, v336, v337, 0, v338, v341);
                                  uint64_t v284 = v328;
LABEL_160:
                                  v285 = type metadata accessor for DataSlice;
LABEL_161:
                                  outlined destroy of DataSlice(v284, v285);
                                  return v248;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v268 = type metadata accessor for DataSlice;
      v269 = (double *)&v462;
LABEL_148:
      uint64_t v270 = *((void *)v269 - 32);
LABEL_206:
      outlined destroy of DataSlice(v270, v268);
      return (char *)&_swiftEmptyArrayStorage;
    }
    if (!*(void *)(v51 + 16)) {
      return (char *)&_swiftEmptyArrayStorage;
    }
    unint64_t v146 = specialized __RawDictionaryStorage.find<A>(_:)(0x6D614E6563696C73, 0xE900000000000065);
    if ((v147 & 1) == 0) {
      return (char *)&_swiftEmptyArrayStorage;
    }
    uint64_t v148 = v449;
    if (!*(void *)(v449 + 16))
    {
      v161 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v451 + 56);
      v162 = &v465;
      goto LABEL_66;
    }
    v149 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v146);
    uint64_t v151 = *v149;
    uint64_t v150 = v149[1];
    swift_bridgeObjectRetain();
    unint64_t v152 = specialized __RawDictionaryStorage.find<A>(_:)(v151, v150);
    uint64_t v153 = v451;
    v39 = v437;
    if (v154)
    {
      outlined init with copy of DataSlice(*(void *)(v148 + 56) + *(void *)(v451 + 72) * v152, (uint64_t)v437, type metadata accessor for DataSlice);
      v155 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v153 + 56);
      uint64_t v156 = (uint64_t)v39;
      uint64_t v157 = 0;
    }
    else
    {
      v155 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v451 + 56);
      uint64_t v156 = (uint64_t)v437;
      uint64_t v157 = 1;
    }
    uint64_t v259 = v452;
    v155(v156, v157, 1, v452);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v153 + 48))(v39, 1, v259) == 1) {
      goto LABEL_165;
    }
    uint64_t v164 = v436;
    outlined init with take of DataSlice((uint64_t)v39, v436, type metadata accessor for DataSlice);
    if (!*(void *)(v51 + 16)) {
      goto LABEL_205;
    }
    unint64_t v260 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001DLL, 0x8000000100033870);
    if ((v261 & 1) == 0) {
      goto LABEL_205;
    }
    v262 = (double *)(*(void *)(v51 + 56) + 16 * v260);
    double v264 = *v262;
    uint64_t v263 = *((void *)v262 + 1);
    double v461 = 0.0;
    uint64_t v265 = __chkstk_darwin(v260);
    *(&v423 - 2) = (uint64_t)&v461;
    if ((v263 & 0x1000000000000000) != 0 || !(v263 & 0x2000000000000000 | *(void *)&v264 & 0x1000000000000000))
    {
      swift_bridgeObjectRetain();
      _StringGuts._slowWithCString<A>(_:)();
    }
    else
    {
      __chkstk_darwin(v265);
      *(&v423 - 2) = (uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:);
      *(&v423 - 1) = (uint64_t)(&v423 - 4);
      if ((v263 & 0x2000000000000000) != 0)
      {
        double v458 = v264;
        uint64_t v459 = v263 & 0xFFFFFFFFFFFFFFLL;
        swift_bridgeObjectRetain();
        BOOL v344 = (LOBYTE(v264) >= 0x21u || ((0x100003E01uLL >> SLOBYTE(v264)) & 1) == 0)
            && (v343 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
            && *v343 == 0;
        char v460 = v344;
        swift_bridgeObjectRelease();
        goto LABEL_193;
      }
      if ((*(void *)&v264 & 0x1000000000000000) != 0)
      {
        uint64_t v266 = (v263 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v267 = *(void *)&v264 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v266 = _StringObject.sharedUTF8.getter();
        uint64_t v267 = v422;
      }
      swift_bridgeObjectRetain();
      char v460 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(v266, v267, (void (*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)) & 1;
    }
    swift_bridgeObjectRelease();
LABEL_193:
    uint64_t v164 = v436;
    if ((v460 & 1) == 0) {
      goto LABEL_205;
    }
    if (!*(void *)(v51 + 16)) {
      goto LABEL_205;
    }
    double v345 = v461;
    unint64_t v346 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000015, 0x80000001000338B0);
    if ((v347 & 1) == 0) {
      goto LABEL_205;
    }
    v348 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v346);
    uint64_t v349 = *v348;
    unint64_t v350 = v348[1];
    swift_bridgeObjectRetain();
    uint64_t v351 = specialized FixedWidthInteger.init(_:)(v349, v350);
    if ((v352 & 1) == 0)
    {
      if (*(void *)(v51 + 16))
      {
        uint64_t v353 = v351;
        unint64_t v354 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000017, 0x80000001000338D0);
        if (v355)
        {
          v356 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v354);
          uint64_t v358 = *v356;
          unint64_t v357 = v356[1];
          swift_bridgeObjectRetain();
          uint64_t v359 = specialized FixedWidthInteger.init(_:)(v358, v357);
          if ((v360 & 1) == 0)
          {
            if (*(void *)(v51 + 16))
            {
              uint64_t v361 = v359;
              unint64_t v362 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001BLL, 0x80000001000338F0);
              if (v363)
              {
                v364 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v362);
                uint64_t v365 = *v364;
                unint64_t v366 = v364[1];
                swift_bridgeObjectRetain();
                uint64_t v367 = specialized FixedWidthInteger.init(_:)(v365, v366);
                if ((v368 & 1) == 0)
                {
                  uint64_t v369 = v367;
                  type metadata accessor for ManualVolumeChangeFunctions();
                  v457 = (void (*)(uint64_t, uint64_t))(v436 + *(int *)(v452 + 20));
                  v454 = (char *)static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(v457, v353, v361, v369, v345);
                  uint64_t v370 = *((void *)v454 + 2);
                  if (v370)
                  {
                    uint64_t v371 = (uint64_t)&v454[(*(unsigned __int8 *)(v423 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v423 + 80)];
                    uint64_t v372 = *(void *)(v423 + 72);
                    v248 = (char *)&_swiftEmptyArrayStorage;
                    uint64_t v456 = v451 + 56;
                    *(void *)&long long v455 = 0x80000001000339C0;
                    uint64_t v373 = v448;
                    do
                    {
                      uint64_t v400 = v427;
                      outlined init with copy of DataSlice(v371, v427, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
                      uint64_t v401 = v400 + *(int *)(v426 + 24);
                      if ((*(unsigned char *)(v401 + 8) & 1) == 0)
                      {
                        double v402 = *(double *)v401;
                        double v458 = 0.0;
                        uint64_t v459 = 0xE000000000000000;
                        _StringGuts.grow(_:)(28);
                        double v403 = *(double *)v447;
                        uint64_t v404 = *((void *)v447 + 1);
                        swift_bridgeObjectRetain();
                        swift_bridgeObjectRelease();
                        double v458 = v403;
                        uint64_t v459 = v404;
                        v405._countAndFlagsBits = 0xD000000000000017;
                        v405._object = (void *)v455;
                        String.append(_:)(v405);
                        double v461 = *(double *)(v427 + *(int *)(v426 + 20));
                        v406._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                        String.append(_:)(v406);
                        swift_bridgeObjectRelease();
                        v407._countAndFlagsBits = 93;
                        v407._object = (void *)0xE100000000000000;
                        String.append(_:)(v407);
                        uint64_t v408 = *(void *)&v458;
                        uint64_t v409 = v459;
                        uint64_t v410 = specialized static AggregationFunctions.controllerVersion(from:)();
                        uint64_t v412 = v411;
                        outlined init with copy of DataSlice(v436, v373, type metadata accessor for DataSlice);
                        v155(v373, 0, 1, v452);
                        Metric.init(metricName:metricValue:controllerVersion:originDataSlice:originEventSets:)(v408, v409, v410, v412, v373, 0, v425, v402);
                        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                          v248 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v248 + 2) + 1, 1, (unint64_t)v248, &demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>, type metadata accessor for Metric, type metadata accessor for Metric);
                        }
                        unint64_t v414 = *((void *)v248 + 2);
                        unint64_t v413 = *((void *)v248 + 3);
                        if (v414 >= v413 >> 1) {
                          v248 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v413 > 1, v414 + 1, 1, (unint64_t)v248, &demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>, type metadata accessor for Metric, type metadata accessor for Metric);
                        }
                        *((void *)v248 + 2) = v414 + 1;
                        outlined init with take of DataSlice(v425, (uint64_t)&v248[((*(unsigned __int8 *)(v446 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v446 + 80))+ *(void *)(v446 + 72) * v414], type metadata accessor for Metric);
                      }
                      outlined destroy of DataSlice(v427, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
                      v371 += v372;
                      --v370;
                    }
                    while (v370);
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    v248 = (char *)&_swiftEmptyArrayStorage;
                  }
                  v285 = type metadata accessor for DataSlice;
                  uint64_t v284 = v436;
                  goto LABEL_161;
                }
              }
            }
          }
        }
      }
    }
    v268 = type metadata accessor for DataSlice;
    v269 = (double *)&v464;
    goto LABEL_148;
  }
  if (!*(void *)(v51 + 16)) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v106 = specialized __RawDictionaryStorage.find<A>(_:)(0x73746E657665, 0xE600000000000000);
  v107 = v457;
  if ((v108 & 1) == 0) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v109 = v455;
  if (!*(void *)(v455 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v456 + 56))(v39, 1, 1, v457);
LABEL_50:
    v131 = &demangling cache variable for type metadata for EventSet?;
LABEL_166:
    uint64_t v272 = (uint64_t)v39;
    goto LABEL_167;
  }
  v110 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v106);
  uint64_t v112 = *v110;
  uint64_t v111 = v110[1];
  swift_bridgeObjectRetain();
  unint64_t v113 = specialized __RawDictionaryStorage.find<A>(_:)(v112, v111);
  if (v114)
  {
    uint64_t v115 = *(void *)(v109 + 56);
    uint64_t v116 = v456;
    outlined init with copy of DataSlice(v115 + *(void *)(v456 + 72) * v113, (uint64_t)v39, type metadata accessor for EventSet);
    v117 = *(void (**)(char *, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v116 + 56);
    v117(v39, 0, 1, v107);
  }
  else
  {
    uint64_t v116 = v456;
    v117 = *(void (**)(char *, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))(v456 + 56);
    v117(v39, 1, 1, v107);
  }
  swift_bridgeObjectRelease();
  v130 = *(unsigned int (**)(char *, uint64_t, void (*)(uint64_t, uint64_t)))(v116 + 48);
  if (v130(v39, 1, v107) == 1) {
    goto LABEL_50;
  }
  uint64_t v132 = 3157552;
  outlined init with take of DataSlice((uint64_t)v39, v453, type metadata accessor for EventSet);
  uint64_t v133 = (uint64_t)v454;
  uint64_t v134 = ((uint64_t (*)(char *, uint64_t, uint64_t, void (*)(uint64_t, uint64_t)))v117)(v454, 1, 1, v107);
  if (*(void *)(v51 + 16))
  {
    uint64_t v134 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x80000001000337E0);
    if (v135)
    {
      uint64_t v136 = v455;
      if (*(void *)(v455 + 16))
      {
        v137 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v134);
        uint64_t v139 = *v137;
        uint64_t v138 = v137[1];
        swift_bridgeObjectRetain();
        unint64_t v140 = specialized __RawDictionaryStorage.find<A>(_:)(v139, v138);
        if (v141)
        {
          uint64_t v142 = *(void *)(v136 + 56) + *(void *)(v456 + 72) * v140;
          uint64_t v143 = (uint64_t)v438;
          outlined init with copy of DataSlice(v142, (uint64_t)v438, type metadata accessor for EventSet);
          uint64_t v144 = v143;
          uint64_t v145 = 0;
        }
        else
        {
          uint64_t v143 = (uint64_t)v438;
          uint64_t v144 = (uint64_t)v438;
          uint64_t v145 = 1;
        }
        v117((char *)v144, v145, 1, v107);
        swift_bridgeObjectRelease();
        uint64_t v133 = (uint64_t)v454;
      }
      else
      {
        uint64_t v143 = (uint64_t)v438;
        v117(v438, 1, 1, v107);
      }
      uint64_t v134 = outlined assign with take of EventSet?(v143, v133);
    }
    uint64_t v159 = v445;
    uint64_t v160 = v443;
    if (*(void *)(v51 + 16)
      && (uint64_t v134 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000019, 0x8000000100033850),
          (v224 & 1) != 0))
    {
      v225 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v134);
      uint64_t v132 = *v225;
      unint64_t v158 = v225[1];
      uint64_t v134 = swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v158 = 0xE300000000000000;
    }
  }
  else
  {
    unint64_t v158 = 0xE300000000000000;
    uint64_t v159 = v445;
    uint64_t v160 = v443;
  }
  double v461 = 0.0;
  uint64_t v226 = __chkstk_darwin(v134);
  *(&v423 - 2) = (uint64_t)&v461;
  if ((v158 & 0x1000000000000000) != 0 || !(v158 & 0x2000000000000000 | v132 & 0x1000000000000000))
  {
    v228 = v130;
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    char v231 = LOBYTE(v458);
  }
  else
  {
    __chkstk_darwin(v226);
    *(&v423 - 2) = (uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:);
    *(&v423 - 1) = v227;
    if ((v158 & 0x2000000000000000) != 0)
    {
      double v458 = *(double *)&v132;
      uint64_t v459 = v158 & 0xFFFFFFFFFFFFFFLL;
      if (v132 < 0x21u && ((0x100003E01uLL >> v132) & 1) != 0
        || (v232 = (unsigned char *)_swift_stdlib_strtod_clocale()) == 0)
      {
        v228 = v130;
        char v231 = 0;
      }
      else
      {
        v228 = v130;
        char v231 = *v232 == 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v228 = v130;
      if ((v132 & 0x1000000000000000) != 0)
      {
        uint64_t v229 = (v158 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v230 = v132 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v229 = _StringObject.sharedUTF8.getter();
      }
      char v231 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(v229, v230, (void (*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
      swift_bridgeObjectRelease();
    }
  }
  if (v231) {
    uint64_t v233 = *(void *)&v461;
  }
  else {
    uint64_t v233 = 0;
  }
  char v234 = v231 ^ 1;
  v235 = v457;
  v236 = *(void (**)(uint64_t, uint64_t, uint64_t))(v160 + 16);
  v236(v450, v453 + *((int *)v457 + 5), v159);
  v237 = v454;
  if (v228(v454, 1, v235))
  {
    v238 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56);
    uint64_t v239 = (uint64_t)v442;
    v238(v442, 1, 1, v159);
    uint64_t v240 = (uint64_t)v444;
  }
  else
  {
    v241 = &v237[*((int *)v235 + 5)];
    uint64_t v239 = (uint64_t)v442;
    v236((uint64_t)v442, (uint64_t)v241, v159);
    v238 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56);
    v238((char *)v239, 0, 1, v159);
    int v242 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v160 + 48))(v239, 1, v159);
    uint64_t v240 = (uint64_t)v444;
    if (v242 != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v160 + 32))(v444, v239, v159);
      v238((char *)v240, 0, 1, v159);
      goto LABEL_129;
    }
  }
  v238((char *)v240, 1, 1, v159);
  outlined destroy of DataSlice?(v239, &demangling cache variable for type metadata for DataFrame?);
LABEL_129:
  int v243 = v234 & 1;
  uint64_t v244 = v450;
  specialized static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(v450, v240, v233, v243);
  double v246 = v245;
  outlined destroy of DataSlice?(v240, &demangling cache variable for type metadata for DataFrame?);
  (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v244, v159);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>);
  unint64_t v247 = (*(unsigned __int8 *)(v446 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v446 + 80);
  v248 = (char *)swift_allocObject();
  long long v455 = xmmword_100032B90;
  *((_OWORD *)v248 + 1) = xmmword_100032B90;
  uint64_t v249 = *(void *)v447;
  uint64_t v250 = *((void *)v447 + 1);
  uint64_t v251 = v452;
  uint64_t v252 = v453;
  swift_bridgeObjectRetain();
  uint64_t v253 = specialized static AggregationFunctions.controllerVersion(from:)();
  uint64_t v255 = v254;
  uint64_t v256 = v448;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v451 + 56))(v448, 1, 1, v251);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<EventSet>);
  unint64_t v257 = (*(unsigned __int8 *)(v456 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v456 + 80);
  uint64_t v258 = swift_allocObject();
  *(_OWORD *)(v258 + 16) = v455;
  outlined init with copy of DataSlice(v252, v258 + v257, type metadata accessor for EventSet);
  Metric.init(metricName:metricValue:controllerVersion:originDataSlice:originEventSets:)(v249, v250, v253, v255, v256, v258, (uint64_t)&v248[v247], v246);
  outlined destroy of DataSlice(v252, type metadata accessor for EventSet);
  outlined destroy of DataSlice?((uint64_t)v454, &demangling cache variable for type metadata for EventSet?);
  return v248;
}

uint64_t specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t specialized FixedWidthInteger.init(_:)(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v7 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = a4;
  v23[1] = a3;
  uint64_t v5 = type metadata accessor for DataFrame.Rows();
  uint64_t v26 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DataFrame.Slice();
  uint64_t v24 = *(void *)(v8 - 8);
  uint64_t v25 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v30[3])
  {
    outlined destroy of DataSlice?((uint64_t)v30, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    return outlined destroy of DataSlice?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  int v18 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, v18 ^ 1u, 1, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  uint64_t v19 = AVLogColumns.rawValue.getter(1);
  __chkstk_darwin(v19);
  v23[-2] = v17;
  *(double *)&v23[-1] = a1;
  uint64_t v20 = v28;
  DataFrame.filter<A>(on:_:_:)();
  uint64_t v28 = v20;
  swift_bridgeObjectRelease();
  DataFrame.Slice.rows.getter();
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  uint64_t v21 = v30[0] != v29;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v25);
  if (__OFADD__(*v27, v21))
  {
    __break(1u);
  }
  else
  {
    *v27 += v21;
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  return result;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, uint64_t *a2, unsigned char *a3)
{
  v39 = a2;
  uint64_t v5 = type metadata accessor for DataFrame.Row();
  uint64_t v34 = *(void (***)(char *, uint64_t))(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v38 = (char *)&v30 - v9;
  uint64_t v10 = type metadata accessor for DataFrame.Rows();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = (void (**)(char *, uint64_t))v11;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v18 = v11 + 16;
  uint64_t v36 = v19;
  v19(v13, a1, v10);
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v37 = v13;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v20 = &v17[*(int *)(v15 + 44)];
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v35 = *(void *)v20;
  uint64_t v30 = v17;
  dispatch thunk of Collection.endIndex.getter();
  if (v35 == v40[0])
  {
    uint64_t v21 = (uint64_t)v30;
    return outlined destroy of DataSlice?(v21, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  }
  else
  {
    ++v32;
    uint64_t v33 = (void (**)(char *))(v34 + 2);
    uint64_t v31 = (void (**)(char *, char *, uint64_t))(v34 + 4);
    ++v34;
    uint64_t v35 = v18;
    uint64_t v21 = (uint64_t)v30;
    while (1)
    {
      char v22 = (void (*)(uint64_t *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v23 = v38;
      (*v33)(v38);
      v22(v40, 0);
      uint64_t v24 = v37;
      v36(v37, v21, v10);
      dispatch thunk of Collection.formIndex(after:)();
      (*v32)(v24, v10);
      (*v31)(v8, v23, v5);
      uint64_t v25 = v41;
      closure #2 in closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)((uint64_t)v8, v39, a3);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v34)(v8, v5);
      uint64_t v26 = a3;
      uint64_t v27 = *(void *)v20;
      dispatch thunk of Collection.endIndex.getter();
      BOOL v28 = v27 == v40[0];
      a3 = v26;
      if (v28) {
        return outlined destroy of DataSlice?(v21, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
      }
    }
    (*v34)(v8, v5);
    return outlined destroy of DataSlice?(v21, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  }
}

uint64_t specialized Sequence.forEach(_:)(void (*a1)(char *), uint64_t a2)
{
  uint64_t v36 = a2;
  uint64_t v34 = a1;
  uint64_t v3 = type metadata accessor for DataFrame.Row();
  uint64_t v32 = *(void (***)(char *, uint64_t))(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v39 = (char *)&v28 - v7;
  uint64_t v8 = type metadata accessor for DataFrame.Rows();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = (void (**)(char *, uint64_t))v9;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v16 = v9 + 16;
  uint64_t v35 = v17;
  v17(v11, v2, v8);
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v37 = v11;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v18 = v15;
  uint64_t v19 = &v15[*(int *)(v13 + 44)];
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v20 = *(void *)v19;
  dispatch thunk of Collection.endIndex.getter();
  if (v20 == v38[0])
  {
LABEL_5:
    uint64_t v26 = (uint64_t)v18;
  }
  else
  {
    ++v30;
    uint64_t v31 = (void (**)(char *))(v32 + 2);
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v32 + 4);
    ++v32;
    uint64_t v33 = v16;
    uint64_t v21 = v28;
    while (1)
    {
      char v22 = (void (*)(uint64_t *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v23 = (uint64_t)v18;
      (*v31)(v39);
      v22(v38, 0);
      uint64_t v24 = v37;
      v35(v37, v23, v8);
      dispatch thunk of Collection.formIndex(after:)();
      (*v30)(v24, v8);
      (*v29)(v6, v39, v3);
      v34(v6);
      if (v21) {
        break;
      }
      (*v32)(v6, v3);
      uint64_t v25 = *(void *)v19;
      uint64_t v18 = (char *)v23;
      dispatch thunk of Collection.endIndex.getter();
      if (v25 == v38[0]) {
        goto LABEL_5;
      }
    }
    (*v32)(v6, v3);
    uint64_t v26 = v23;
  }
  return outlined destroy of DataSlice?(v26, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
}

uint64_t closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = a4;
  v19[1] = a3;
  uint64_t v5 = type metadata accessor for DataFrame.Slice();
  uint64_t v20 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v23)
  {
    outlined destroy of DataSlice?((uint64_t)v22, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    return outlined destroy of DataSlice?((uint64_t)v10, &demangling cache variable for type metadata for Date?);
  }
  int v15 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, v15 ^ 1u, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v10, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  uint64_t v16 = AVLogColumns.rawValue.getter(1);
  __chkstk_darwin(v16);
  v19[-2] = v14;
  *(double *)&v19[-1] = a1;
  DataFrame.filter<A>(on:_:_:)();
  swift_bridgeObjectRelease();
  char v17 = DataFrameProtocol.isEmpty.getter();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v7, v5);
  if (__OFADD__(*v21, v17 & 1))
  {
    __break(1u);
  }
  else
  {
    *v21 += v17 & 1;
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return result;
}

BOOL closure #1 in closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1, double a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6, &demangling cache variable for type metadata for Date?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of DataSlice?((uint64_t)v6, &demangling cache variable for type metadata for Date?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    Date.timeIntervalSinceReferenceDate.getter();
    double v13 = v12;
    Date.timeIntervalSinceReferenceDate.getter();
    double v15 = v14;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return v13 - v15 >= 0.0 && v13 - v15 <= a2;
  }
}

uint64_t closure #1 in static AggregationFunctions.truePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = a4;
  v23[1] = a3;
  uint64_t v5 = type metadata accessor for DataFrame.Rows();
  uint64_t v26 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DataFrame.Slice();
  uint64_t v24 = *(void *)(v8 - 8);
  uint64_t v25 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v11 - 8);
  double v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  char v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v30[3])
  {
    outlined destroy of DataSlice?((uint64_t)v30, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    return outlined destroy of DataSlice?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  int v18 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, v18 ^ 1u, 1, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  uint64_t v19 = AVLogColumns.rawValue.getter(1);
  __chkstk_darwin(v19);
  v23[-2] = v17;
  *(double *)&v23[-1] = a1;
  uint64_t v20 = v28;
  DataFrame.filter<A>(on:_:_:)();
  uint64_t v28 = v20;
  swift_bridgeObjectRelease();
  DataFrame.Slice.rows.getter();
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  uint64_t v21 = v30[0] == v29;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v25);
  if (__OFADD__(*v27, v21))
  {
    __break(1u);
  }
  else
  {
    *v27 += v21;
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  return result;
}

BOOL closure #1 in closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1, double a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6, &demangling cache variable for type metadata for Date?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of DataSlice?((uint64_t)v6, &demangling cache variable for type metadata for Date?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    Date.timeIntervalSinceReferenceDate.getter();
    double v13 = v12;
    Date.timeIntervalSinceReferenceDate.getter();
    double v15 = v14;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return v13 - v15 >= 0.0 && v13 - v15 <= a2;
  }
}

uint64_t closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5, void *a6)
{
  uint64_t v37 = a5;
  uint64_t v38 = a6;
  int v30 = a4;
  uint64_t v29 = a3;
  v39 = (void *)a2;
  uint64_t v6 = type metadata accessor for DataFrame.Rows();
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  __chkstk_darwin(v6);
  uint64_t v33 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for DataFrame.Slice();
  uint64_t v32 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v31 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DataFrame();
  uint64_t v40 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  double v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v15 - 8);
  char v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v42)
  {
    outlined destroy of DataSlice?((uint64_t)v41, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    return outlined destroy of DataSlice?((uint64_t)v17, &demangling cache variable for type metadata for Date?);
  }
  int v22 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v17, v22 ^ 1u, 1, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v17, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  outlined init with copy of Date?((uint64_t)v39, (uint64_t)v11, &demangling cache variable for type metadata for DataFrame?);
  uint64_t v23 = v40;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v11, 1, v12) == 1)
  {
    uint64_t result = outlined destroy of DataSlice?((uint64_t)v11, &demangling cache variable for type metadata for DataFrame?);
    if (!__OFADD__(*v38, 1))
    {
      ++*v38;
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    }
    __break(1u);
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v14, v11, v12);
  uint64_t v25 = AVLogColumns.rawValue.getter(1);
  v39 = &v29;
  __chkstk_darwin(v25);
  *(&v29 - 4) = v29;
  *((unsigned char *)&v29 - 24) = v30 & 1;
  *(&v29 - 2) = (uint64_t)v21;
  uint64_t v26 = v31;
  uint64_t v27 = v43;
  DataFrame.filter<A>(on:_:_:)();
  uint64_t v43 = v27;
  swift_bridgeObjectRelease();
  v41[0] = 0;
  uint64_t v28 = (uint64_t)v33;
  DataFrame.Slice.rows.getter();
  specialized Sequence.forEach(_:)(v28, v37, v41);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v28, v36);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v34);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
  if (v41[0]) {
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  if (!__OFADD__(*v38, 1))
  {
    ++*v38;
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
LABEL_13:
  __break(1u);
  return result;
}

BOOL closure #1 in closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v8, &demangling cache variable for type metadata for Date?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of DataSlice?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    if (a3)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return 0;
    }
    else
    {
      Date.timeIntervalSinceReferenceDate.getter();
      double v15 = v14;
      Date.timeIntervalSinceReferenceDate.getter();
      double v17 = v16;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v15 - v17 >= 0.0 && v15 - v17 <= *(double *)&a2;
    }
  }
}

uint64_t closure #2 in closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(uint64_t a1, uint64_t *a2, unsigned char *a3)
{
  uint64_t v29 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  double v14 = (char *)v26 - v13;
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v28)
  {
    outlined destroy of DataSlice?((uint64_t)v27, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    return outlined destroy of DataSlice?((uint64_t)v7, &demangling cache variable for type metadata for Date?);
  }
  int v15 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, v15 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v7, &demangling cache variable for type metadata for Date?);
  }
  v26[0] = *(void *)(v9 + 32);
  uint64_t v16 = ((uint64_t (*)(char *, char *, uint64_t))v26[0])(v14, v7, v8);
  uint64_t v17 = *a2;
  __chkstk_darwin(v16);
  v26[-2] = v14;
  swift_bridgeObjectRetain();
  BOOL v18 = specialized Sequence.contains(where:)((uint64_t (*)(char *))partial apply for specialized closure #1 in Sequence<>.contains(_:), (uint64_t)&v26[-4], v17);
  v26[1] = v3;
  swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    *uint64_t v29 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    unint64_t v20 = *a2;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v20;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v20 + 16) + 1, 1, v20, &demangling cache variable for type metadata for _ContiguousArrayStorage<Date>, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&type metadata accessor for Date);
      *a2 = v20;
    }
    unint64_t v23 = *(void *)(v20 + 16);
    unint64_t v22 = *(void *)(v20 + 24);
    uint64_t v24 = (unsigned char *)(v23 + 1);
    if (v23 >= v22 >> 1)
    {
      uint64_t v29 = (unsigned char *)(v23 + 1);
      uint64_t v25 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1, v20, &demangling cache variable for type metadata for _ContiguousArrayStorage<Date>, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&type metadata accessor for Date);
      uint64_t v24 = v29;
      unint64_t v20 = v25;
      *a2 = v25;
    }
    *(void *)(v20 + 16) = v24;
    ((void (*)(unint64_t, char *, uint64_t))v26[0])(v20+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v23, v12, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    BOOL v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  BOOL v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

{
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  size_t v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t result;

  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    BOOL v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  BOOL v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
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

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
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
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
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
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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

BOOL specialized Sequence.contains(where:)(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v39 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  int64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v9 - 8);
  size_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  if (v12)
  {
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v37 = v14;
    uint64_t v15 = a3 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v34 = v8;
    uint64_t v35 = (uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v31 = v16;
    uint64_t v32 = (void (**)(char *))(v13 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v13 - 8);
    v29[2] = a3;
    swift_bridgeObjectRetain();
    uint64_t v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 40);
    v29[1] = (v13 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      uint64_t v17 = v39;
      uint64_t v18 = v13;
      v37(v11, v15, v39);
      size_t v19 = *v36;
      (*v36)(v11, 0, 1, v17);
      int v20 = (*v35)(v11, 1, v17);
      BOOL v21 = v20 != 1;
      if (v20 == 1) {
        break;
      }
      int v30 = v19;
      unint64_t v22 = v11;
      unint64_t v23 = v34;
      uint64_t v24 = v22;
      (*v32)(v34);
      char v25 = v38(v23);
      if (v4)
      {
        (*v33)(v23, v17);
        swift_bridgeObjectRelease();
        return v21;
      }
      char v26 = v25;
      (*v33)(v23, v17);
      if (v26) {
        break;
      }
      v15 += v31;
      --v12;
      uint64_t v4 = 0;
      uint64_t v13 = v18;
      size_t v11 = v24;
      if (!v12)
      {
        v30(v24, 1, 1, v39);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v27(v11, 1, 1, v39);
LABEL_9:
    BOOL v21 = 0;
  }
  swift_bridgeObjectRelease();
  return v21;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

{
  Swift::Int v4;
  uint64_t vars8;

  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = static String._copying(_:)();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  size_t v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0),
          unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4), swift_bridgeObjectRetain(), swift_bridgeObjectRelease(), v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t specialized Collection.count.getter(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v15;

  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v7)(uint64_t *__return_ptr, void *);
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  void v12[2];
  uint64_t v13;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    unint64_t v10 = _StringGuts._slowWithCString<A>(_:)();
    if (!v4) {
      unint64_t v10 = BYTE1(v13);
    }
  }
  else
  {
    __chkstk_darwin(a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v12[0] = v5;
      v12[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v10 = v7(&v13, v12);
      if (!v4) {
        unint64_t v10 = v13;
      }
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = _StringObject.sharedUTF8.getter();
      }
      unint64_t v10 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(v8, v9, (void (*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
    }
  }
  return v10 & 1;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unint64_t specialized ExpectedAggregationFunctions.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ExpectedAggregationFunctions.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 9) {
    return 9;
  }
  else {
    return v3;
  }
}

uint64_t specialized ExpectedAggregationArguments.init(rawValue:)()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x12) {
    return 18;
  }
  else {
    return v0;
  }
}

unsigned char *partial apply for closure #1 in closure #1 in Double.init<A>(_:)@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return partial apply for closure #1 in closure #1 in Double.init<A>(_:)(a1, a2);
}

uint64_t specialized static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1, NSObject *a2, double a3)
{
  double v70 = a2;
  uint64_t v5 = type metadata accessor for DataFrame();
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  v68 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v69 = (char *)&v56 - v8;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for DataFrame.Rows();
  uint64_t v65 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v64 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for AnyColumn();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v74 = DataFrame.indexOfColumn(_:)(v18);
  if (v74.is_nil) {
    return swift_bridgeObjectRelease();
  }
  unint64_t value = v74.value;
  uint64_t v59 = a1;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (value >= *(void *)(result + 16))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v60 = v12;
  uint64_t v61 = v5;
  uint64_t v62 = v10;
  uint64_t v63 = v9;
  unint64_t v21 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v22 = *(void *)(v15 + 72);
  unint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v23(v17, result + v21 + v22 * value, v14);
  swift_bridgeObjectRelease();
  uint64_t v24 = AnyColumn.wrappedElementType.getter();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v15 + 8);
  v25(v17, v14);
  swift_bridgeObjectRelease();
  uint64_t result = type metadata accessor for Date();
  if (v24 != result) {
    return result;
  }
  v58 = (uint64_t *)v24;
  v26._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  object = v26._object;
  Swift::Int_optional v75 = DataFrame.indexOfColumn(_:)(v26);
  if (v75.is_nil) {
    return swift_bridgeObjectRelease();
  }
  char v57 = object;
  unint64_t v28 = v75.value;
  uint64_t result = DataFrame.columns.getter();
  if ((v28 & 0x8000000000000000) != 0) {
    goto LABEL_18;
  }
  if (v28 >= *(void *)(result + 16))
  {
LABEL_19:
    __break(1u);
    return result;
  }
  v23(v17, result + v21 + v28 * v22, v14);
  swift_bridgeObjectRelease();
  uint64_t v29 = AnyColumn.wrappedElementType.getter();
  v25(v17, v14);
  uint64_t result = swift_bridgeObjectRelease();
  if ((uint64_t *)v29 == v58)
  {
    uint64_t v73 = 0;
    int v30 = v64;
    uint64_t v31 = v59;
    uint64_t v32 = DataFrame.rows.getter();
    __chkstk_darwin(v32);
    uint64_t v33 = v70;
    *(&v56 - 4) = (uint64_t)v70;
    *((double *)&v56 - 3) = a3;
    *(&v56 - 2) = (uint64_t)&v73;
    specialized Sequence.forEach(_:)((void (*)(char *))partial apply for closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:), (uint64_t)(&v56 - 6));
    uint64_t v65 = *(void *)(v65 + 8);
    ((void (*)(char *, uint64_t))v65)(v30, v67);
    uint64_t v34 = Logger.aggregationFunction.unsafeMutableAddressor();
    uint64_t v35 = v62;
    uint64_t v36 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v60, v34, v63);
    uint64_t v37 = v66;
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
    uint64_t v39 = v31;
    uint64_t v40 = v61;
    v38(v69, v39, v61);
    uint64_t v41 = v68;
    v38(v68, (uint64_t)v33, v40);
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.info.getter();
    int v44 = v43;
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 134218496;
      double v70 = v42;
      swift_beginAccess();
      uint64_t v71 = v73;
      v58 = &v72;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v45 + 12) = 2048;
      char v57 = (void *)(v45 + 14);
      uint64_t v46 = v69;
      DataFrame.rows.getter();
      uint64_t v47 = DataFrame.Rows.count.getter();
      uint64_t v48 = v67;
      LODWORD(v59) = v44;
      uint64_t v49 = (void (*)(char *, uint64_t))v65;
      ((void (*)(char *, uint64_t))v65)(v30, v67);
      uint64_t v50 = *(void (**)(char *, uint64_t))(v37 + 8);
      uint64_t v51 = v46;
      uint64_t v52 = v61;
      v50(v51, v61);
      uint64_t v71 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v45 + 22) = 2048;
      uint64_t v69 = (char *)(v45 + 24);
      char v53 = v68;
      DataFrame.rows.getter();
      uint64_t v54 = DataFrame.Rows.count.getter();
      v49(v30, v48);
      v50(v53, v52);
      uint64_t v35 = v62;
      uint64_t v71 = v54;
      uint64_t v42 = v70;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v59, "Found %ld false negatives in %ld user volume changes and %ld system volume changes.", (uint8_t *)v45, 0x20u);
      uint64_t v36 = v60;
      swift_slowDealloc();
    }
    else
    {
      char v55 = *(void (**)(char *, uint64_t))(v37 + 8);
      v55(v41, v40);
      v55(v69, v40);
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v63);
    return swift_beginAccess();
  }
  return result;
}

uint64_t specialized static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1, uint64_t a2, void (*a3)(char *), const char *a4, double a5)
{
  uint64_t v62 = a3;
  uint64_t v70 = a2;
  uint64_t v8 = type metadata accessor for DataFrame();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v65 = (char *)v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v69 = (char *)v55 - v11;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v66 = (char *)v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DataFrame.Rows();
  uint64_t v67 = *(void *)(v15 - 8);
  uint64_t v68 = v15;
  __chkstk_darwin(v15);
  uint64_t v63 = (char *)v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for AnyColumn();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  char v20 = (char *)v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v73 = DataFrame.indexOfColumn(_:)(v21);
  if (v73.is_nil) {
    return swift_bridgeObjectRelease();
  }
  unint64_t value = v73.value;
  uint64_t v59 = a1;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (value >= *(void *)(result + 16))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v58 = v8;
  uint64_t v60 = v13;
  uint64_t v61 = v12;
  char v57 = a4;
  unint64_t v24 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v25 = *(void *)(v18 + 72);
  Swift::String v26 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
  v26(v20, result + v24 + v25 * value, v17);
  swift_bridgeObjectRelease();
  uint64_t v27 = AnyColumn.wrappedElementType.getter();
  unint64_t v28 = *(void (**)(char *, uint64_t))(v18 + 8);
  v28(v20, v17);
  swift_bridgeObjectRelease();
  uint64_t result = type metadata accessor for Date();
  if (v27 != result) {
    return result;
  }
  uint64_t v56 = v27;
  v29._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  object = v29._object;
  Swift::Int_optional v74 = DataFrame.indexOfColumn(_:)(v29);
  if (v74.is_nil) {
    return swift_bridgeObjectRelease();
  }
  v55[1] = object;
  unint64_t v31 = v74.value;
  uint64_t result = DataFrame.columns.getter();
  if ((v31 & 0x8000000000000000) != 0) {
    goto LABEL_18;
  }
  if (v31 >= *(void *)(result + 16))
  {
LABEL_19:
    __break(1u);
    return result;
  }
  v26(v20, result + v24 + v31 * v25, v17);
  swift_bridgeObjectRelease();
  uint64_t v32 = AnyColumn.wrappedElementType.getter();
  v28(v20, v17);
  uint64_t result = swift_bridgeObjectRelease();
  if (v32 == v56)
  {
    uint64_t v72 = 0;
    uint64_t v33 = v63;
    uint64_t v34 = v70;
    uint64_t v35 = DataFrame.rows.getter();
    __chkstk_darwin(v35);
    uint64_t v36 = v59;
    v55[-4] = v59;
    *(double *)&v55[-3] = a5;
    v55[-2] = &v72;
    specialized Sequence.forEach(_:)(v62, (uint64_t)&v55[-6]);
    uint64_t v37 = v67 + 8;
    uint64_t v62 = *(void (**)(char *))(v67 + 8);
    ((void (*)(char *, uint64_t))v62)(v33, v68);
    uint64_t v38 = Logger.aggregationFunction.unsafeMutableAddressor();
    uint64_t v39 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v66, v38, v61);
    uint64_t v40 = v64;
    uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
    uint64_t v42 = v58;
    v41(v69, v36, v58);
    os_log_type_t v43 = v65;
    v41(v65, v34, v42);
    int v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.info.getter();
    int v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 134218496;
      LODWORD(v70) = v46;
      swift_beginAccess();
      uint64_t v71 = v72;
      uint64_t v67 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v47 + 12) = 2048;
      uint64_t v48 = v69;
      uint64_t v59 = v47 + 14;
      DataFrame.rows.getter();
      uint64_t v49 = DataFrame.Rows.count.getter();
      uint64_t v50 = v62;
      ((void (*)(char *, uint64_t))v62)(v33, v68);
      uint64_t v51 = *(void (**)(char *, uint64_t))(v40 + 8);
      v51(v48, v42);
      uint64_t v71 = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v47 + 22) = 2048;
      uint64_t v69 = (char *)(v47 + 24);
      uint64_t v52 = v65;
      DataFrame.rows.getter();
      uint64_t v53 = DataFrame.Rows.count.getter();
      ((void (*)(char *, uint64_t))v50)(v33, v68);
      v51(v52, v42);
      uint64_t v39 = v60;
      uint64_t v71 = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v70, v57, (uint8_t *)v47, 0x20u);
      swift_slowDealloc();
    }
    else
    {
      uint64_t v54 = *(void (**)(char *, uint64_t))(v40 + 8);
      v54(v43, v42);
      v54(v69, v42);
    }

    (*(void (**)(char *, uint64_t))(v39 + 8))(v66, v61);
    return swift_beginAccess();
  }
  return result;
}

uint64_t specialized static AggregationFunctions.runVolumeChangeAggregation(aggregator:userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(long long *a1, uint64_t a2, NSObject *a3, double a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *((void *)a1 + 2);
  unint64_t v12 = *((void *)a1 + 3);
  BOOL v14 = v13 == 0x736F5065736C6166 && v12 == 0xEE00736576697469;
  if (v14 || (uint64_t v15 = *((void *)a1 + 4), (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    uint64_t v16 = "Found %ld false positives in %ld user volume changes and %ld system volume changes.";
    uint64_t v17 = (void (*)(char *))partial apply for closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:);
    return specialized static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(a2, (uint64_t)a3, v17, v16, a4);
  }
  if (v13 == 0x67654E65736C6166 && v12 == 0xEE00736576697461
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return specialized static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(a2, a3, a4);
  }
  else
  {
    if (v13 == 0x69736F5065757274 && v12 == 0xED00007365766974
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      uint64_t v16 = "Found %ld true positives in %ld user volume changes and %ld system volume changes.";
      uint64_t v17 = (void (*)(char *))partial apply for closure #1 in static AggregationFunctions.truePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:);
      return specialized static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(a2, (uint64_t)a3, v17, v16, a4);
    }
    uint64_t v19 = Logger.aggregationFunction.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v19, v8);
    long long v27 = *a1;
    uint64_t v28 = v15;
    outlined retain of String((uint64_t)&v27);
    swift_bridgeObjectRetain();
    outlined retain of [String : String]((uint64_t)&v28);
    outlined retain of String((uint64_t)&v27);
    swift_bridgeObjectRetain();
    outlined retain of [String : String]((uint64_t)&v28);
    char v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v26 = v24;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v25 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v12, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined release of String((uint64_t)&v27);
      swift_bridgeObjectRelease();
      outlined release of [String : String]((uint64_t)&v28);
      outlined release of String((uint64_t)&v27);
      swift_bridgeObjectRelease();
      outlined release of [String : String]((uint64_t)&v28);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Aggregator function named '%s' does not exist.", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      outlined release of String((uint64_t)&v27);
      swift_bridgeObjectRelease();
      outlined release of [String : String]((uint64_t)&v28);
      outlined release of String((uint64_t)&v27);
      swift_bridgeObjectRelease();
      outlined release of [String : String]((uint64_t)&v28);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t specialized static AggregationFunctions.controllerVersion(from:)()
{
  unint64_t v54 = 0xD000000000000015;
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v52 = *(void *)(v0 - 8);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v50 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v51 = (char *)&v49 - v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v49 - v5;
  uint64_t v7 = type metadata accessor for AnyColumn();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11._countAndFlagsBits = AVLogColumns.rawValue.getter(2);
  Swift::Int_optional v58 = DataFrame.indexOfColumn(_:)(v11);
  if (v58.is_nil)
  {
    swift_bridgeObjectRelease();
    unint64_t v53 = 0x8000000100033CC0;
    goto LABEL_13;
  }
  unint64_t value = v58.value;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (value >= *(void *)(result + 16))
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, result+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * value, v7);
  swift_bridgeObjectRelease();
  BOOL v14 = (void *)AnyColumn.wrappedElementType.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  if (v14 == &type metadata for Int)
  {
    AVLogColumns.rawValue.getter(2);
    DataFrame.subscript.getter();
    swift_bridgeObjectRelease();
    if (String.count.getter() < 1)
    {
      unint64_t v53 = 0x8000000100033CC0;
    }
    else
    {
      lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type Column<Int> and conformance Column<A>, &demangling cache variable for type metadata for Column<Int>);
      char v15 = dispatch thunk of Collection.isEmpty.getter();
      unint64_t v53 = 0x8000000100033CC0;
      if ((v15 & 1) == 0)
      {
        dispatch thunk of Collection.endIndex.getter();
        lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type Column<Int> and conformance Column<A>, &demangling cache variable for type metadata for Column<Int>);
        dispatch thunk of BidirectionalCollection.index(before:)();
        uint64_t v16 = (void (*)(void *, void))dispatch thunk of Collection.subscript.read();
        uint64_t v18 = *v17;
        char v19 = *((unsigned char *)v17 + 8);
        v16(v56, 0);
        if ((v19 & 1) == 0)
        {
          v56[0] = 0;
          v56[1] = 0xE000000000000000;
          _StringGuts.grow(_:)(20);
          swift_bridgeObjectRelease();
          v56[0] = 0xD000000000000012;
          v56[1] = 0x8000000100033D60;
          uint64_t v57 = v18;
          v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v20);
          swift_bridgeObjectRelease();
          unint64_t v53 = v56[1];
          unint64_t v54 = v56[0];
        }
      }
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v6, v0);
  }
  else
  {
    unint64_t v53 = 0x8000000100033CC0;
  }
LABEL_13:
  v21._countAndFlagsBits = AVLogColumns.rawValue.getter(32);
  Swift::Int_optional v59 = DataFrame.indexOfColumn(_:)(v21);
  if (v59.is_nil)
  {
    swift_bridgeObjectRelease();
    unint64_t v24 = 0xD000000000000013;
    unint64_t v55 = 0x8000000100033CE0;
    goto LABEL_31;
  }
  unint64_t v22 = v59.value;
  uint64_t result = DataFrame.columns.getter();
  if ((v22 & 0x8000000000000000) != 0) {
    goto LABEL_45;
  }
  if (v22 >= *(void *)(result + 16))
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, result+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v22, v7);
  swift_bridgeObjectRelease();
  uint64_t v23 = (void *)AnyColumn.wrappedElementType.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  unint64_t v24 = 0xD000000000000013;
  unint64_t v55 = 0x8000000100033CE0;
  if (v23 == &type metadata for Int)
  {
    unint64_t v49 = 0xD000000000000013;
    AVLogColumns.rawValue.getter(32);
    uint64_t v25 = v51;
    DataFrame.subscript.getter();
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    if (Column.count.getter() < 1)
    {
      unint64_t v24 = v49;
    }
    else
    {
      lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type Column<Int> and conformance Column<A>, &demangling cache variable for type metadata for Column<Int>);
      char v27 = dispatch thunk of Collection.isEmpty.getter();
      unint64_t v55 = 0x8000000100033CE0;
      unint64_t v24 = v49;
      if ((v27 & 1) == 0)
      {
        dispatch thunk of Collection.endIndex.getter();
        lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type Column<Int> and conformance Column<A>, &demangling cache variable for type metadata for Column<Int>);
        dispatch thunk of BidirectionalCollection.index(before:)();
        uint64_t v28 = (void (*)(void *, void))dispatch thunk of Collection.subscript.read();
        uint64_t v30 = *v29;
        char v31 = *((unsigned char *)v29 + 8);
        v28(v56, 0);
        if ((v31 & 1) == 0)
        {
          if ((v30 & 2) != 0) {
            unint64_t v24 = 0xD000000000000017;
          }
          else {
            unint64_t v24 = 0xD000000000000018;
          }
          unint64_t v32 = 0x8000000100033D40;
          if ((v30 & 2) == 0) {
            unint64_t v32 = 0x8000000100033D20;
          }
          unint64_t v55 = v32;
        }
        uint64_t v26 = v51;
      }
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v26, v0);
  }
LABEL_31:
  v33._countAndFlagsBits = AVLogColumns.rawValue.getter(11);
  Swift::Int_optional v60 = DataFrame.indexOfColumn(_:)(v33);
  if (v60.is_nil)
  {
    swift_bridgeObjectRelease();
    unint64_t v36 = 0xD000000000000011;
    unint64_t v37 = 0x8000000100033D00;
    goto LABEL_41;
  }
  unint64_t v34 = v60.value;
  uint64_t result = DataFrame.columns.getter();
  if ((v34 & 0x8000000000000000) != 0) {
    goto LABEL_47;
  }
  if (v34 < *(void *)(result + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, result+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v34, v7);
    swift_bridgeObjectRelease();
    uint64_t v35 = (void *)AnyColumn.wrappedElementType.getter();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
    unint64_t v36 = 0xD000000000000011;
    unint64_t v37 = 0x8000000100033D00;
    if (v35 == &type metadata for Int)
    {
      AVLogColumns.rawValue.getter(11);
      uint64_t v38 = v50;
      DataFrame.subscript.getter();
      swift_bridgeObjectRelease();
      if (Column.count.getter() >= 1)
      {
        lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type Column<Int> and conformance Column<A>, &demangling cache variable for type metadata for Column<Int>);
        unint64_t v37 = 0x8000000100033D00;
        if ((dispatch thunk of Collection.isEmpty.getter() & 1) == 0)
        {
          dispatch thunk of Collection.endIndex.getter();
          lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type Column<Int> and conformance Column<A>, &demangling cache variable for type metadata for Column<Int>);
          dispatch thunk of BidirectionalCollection.index(before:)();
          uint64_t v39 = (void (*)(void *, void))dispatch thunk of Collection.subscript.read();
          uint64_t v41 = *v40;
          char v42 = *((unsigned char *)v40 + 8);
          v39(v56, 0);
          if ((v42 & 1) == 0)
          {
            v56[0] = 0;
            v56[1] = 0xE000000000000000;
            _StringGuts.grow(_:)(16);
            swift_bridgeObjectRelease();
            strcpy((char *)v56, "headphoneMode:");
            HIBYTE(v56[1]) = -18;
            uint64_t v57 = v41;
            v43._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
            String.append(_:)(v43);
            swift_bridgeObjectRelease();
            unint64_t v36 = v56[0];
            unint64_t v37 = v56[1];
          }
        }
      }
      unint64_t v44 = v54;
      unint64_t v45 = v55;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v38, v0);
      goto LABEL_42;
    }
LABEL_41:
    unint64_t v44 = v54;
    unint64_t v45 = v55;
LABEL_42:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_100032BB0;
    unint64_t v47 = v53;
    *(void *)(v46 + 32) = v44;
    *(void *)(v46 + 40) = v47;
    *(void *)(v46 + 48) = v24;
    *(void *)(v46 + 56) = v45;
    *(void *)(v46 + 64) = v36;
    *(void *)(v46 + 72) = v37;
    v56[0] = v46;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String]);
    uint64_t v48 = BidirectionalCollection<>.joined(separator:)();
    swift_bridgeObjectRelease();
    return v48;
  }
LABEL_48:
  __break(1u);
  return result;
}

void *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(unsigned char *a1@<X8>)
{
  return partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)(a1);
}

{
  uint64_t v1;
  uint64_t v2;
  void *result;
  uint64_t v5;

  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t outlined init with take of DataSlice(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

Swift::Int specialized static AggregationFunctions.average(of:column:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v17 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AnyColumn();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12._countAndFlagsBits = a2;
  v12._object = a3;
  Swift::Int_optional v18 = DataFrame.indexOfColumn(_:)(v12);
  if (v18.is_nil) {
    return v18.value;
  }
  unint64_t value = v18.value;
  v18.unint64_t value = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (value >= *(void *)(v18.value + 16))
  {
LABEL_8:
    __break(1u);
    return v18.value;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, v18.value+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * value, v8);
  swift_bridgeObjectRelease();
  BOOL v14 = (void *)AnyColumn.wrappedElementType.getter();
  v18.unint64_t value = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v14 == &type metadata for Int)
  {
    DataFrame.subscript.getter();
    lazy protocol witness table accessor for type Int and conformance Int();
    Column<A>.mean()();
    v18.unint64_t value = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v7, v5);
  }
  return v18.value;
}

double specialized static AggregationFunctions.runDescriptiveAggregation(aggregator:on:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v23 = a5;
  uint64_t v9 = type metadata accessor for DataFrame.Rows();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  DataFrame.rows.getter();
  lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  uint64_t v14 = v24;
  uint64_t v13 = v25;
  char v15 = *(void (**)(char *, uint64_t))(v10 + 8);
  v15(v12, v9);
  double v16 = 0.0;
  if (v13 != v14)
  {
    uint64_t v17 = a3;
    Swift::Int_optional v18 = v23;
    if (a1 == 0x65676172657661 && a2 == 0xE700000000000000
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      specialized static AggregationFunctions.average(of:column:)(v17, a4, v18);
      return v19;
    }
    else if (a1 == 0x6D6153746E756F63 && a2 == 0xEC00000073656C70 {
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    }
    {
      DataFrame.rows.getter();
      uint64_t v21 = DataFrame.Rows.count.getter();
      v15(v12, v9);
      return (double)v21;
    }
  }
  return v16;
}

uint64_t specialized static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v20 = a4;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v4 = type metadata accessor for DataFrame.Rows();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AnyColumn();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v23 = DataFrame.indexOfColumn(_:)(v12);
  if (v23.is_nil) {
    return swift_bridgeObjectRelease();
  }
  unint64_t value = v23.value;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (value >= *(void *)(result + 16))
  {
LABEL_9:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, result+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * value, v8);
  swift_bridgeObjectRelease();
  uint64_t v15 = AnyColumn.wrappedElementType.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  uint64_t result = type metadata accessor for Date();
  if (v15 == result)
  {
    uint64_t v22 = 0;
    uint64_t v21 = &_swiftEmptyArrayStorage;
    uint64_t v16 = DataFrame.rows.getter();
    __chkstk_darwin(v16);
    uint64_t v17 = v19;
    *(&v18 - 6) = v18;
    *(&v18 - 5) = v17;
    *((unsigned char *)&v18 - 32) = v20 & 1;
    *(&v18 - 3) = (uint64_t)&v21;
    *(&v18 - 2) = (uint64_t)&v22;
    specialized Sequence.forEach(_:)((void (*)(char *))partial apply for closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:), (uint64_t)(&v18 - 8));
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined init with copy of DataSlice(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of DataSlice(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined assign with take of EventSet?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EventSet?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unsigned char *partial apply for closure #1 in closure #1 in Double.init<A>(_:)@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (uint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpectedAggregationFunctions and conformance ExpectedAggregationFunctions()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpectedAggregationFunctions and conformance ExpectedAggregationFunctions;
  if (!lazy protocol witness table cache variable for type ExpectedAggregationFunctions and conformance ExpectedAggregationFunctions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpectedAggregationFunctions and conformance ExpectedAggregationFunctions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpectedAggregationArguments and conformance ExpectedAggregationArguments()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpectedAggregationArguments and conformance ExpectedAggregationArguments;
  if (!lazy protocol witness table cache variable for type ExpectedAggregationArguments and conformance ExpectedAggregationArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpectedAggregationArguments and conformance ExpectedAggregationArguments);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExpectedAggregationFunctions(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExpectedAggregationFunctions(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x100011FCCLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpectedAggregationFunctions()
{
  return &type metadata for ExpectedAggregationFunctions;
}

uint64_t getEnumTagSinglePayload for ExpectedAggregationArguments(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExpectedAggregationArguments(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *unint64_t result = a2 + 17;
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
        JUMPOUT(0x100012160);
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
          *unint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpectedAggregationArguments()
{
  return &type metadata for ExpectedAggregationArguments;
}

ValueMetadata *type metadata accessor for AggregationFunctions()
{
  return &type metadata for AggregationFunctions;
}

uint64_t outlined retain of String(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of String(uint64_t a1)
{
  return a1;
}

uint64_t partial apply for closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1)
{
  return closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(*(double *)(v1 + 24), a1, *(void *)(v1 + 16), *(void **)(v1 + 32));
}

uint64_t outlined destroy of DataSlice?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t partial apply for closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1)
{
  return closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(*(double *)(v1 + 24), a1, *(void *)(v1 + 16), *(void **)(v1 + 32));
}

BOOL partial apply for closure #1 in closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1)
{
  return closure #1 in closure #1 in static AggregationFunctions.falseNegatives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(a1, *(double *)(v1 + 24));
}

uint64_t partial apply for closure #1 in static AggregationFunctions.truePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1)
{
  return closure #1 in static AggregationFunctions.truePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(*(double *)(v1 + 24), a1, *(void *)(v1 + 16), *(void **)(v1 + 32));
}

BOOL partial apply for closure #1 in closure #1 in static AggregationFunctions.truePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1)
{
  return closure #1 in closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(a1, *(double *)(v1 + 24));
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t partial apply for closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(uint64_t a1)
{
  return closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(uint64_t **)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

BOOL partial apply for closure #1 in closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(uint64_t a1)
{
  return closure #1 in closure #1 in static AggregationFunctions.count(events:systemVolumeChanges:contradictionWindowLength:)(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t partial apply for specialized closure #1 in Sequence<>.contains(_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type DataFrame.Rows and conformance DataFrame.Rows(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type [String] and conformance [A](unint64_t *a1, uint64_t *a2)
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

BOOL partial apply for closure #1 in closure #1 in static AggregationFunctions.falsePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in static AggregationFunctions.truePositives(userVolumeChanges:systemVolumeChanges:maximumSecondsBetweenEvents:)(a1);
}

uint64_t type metadata accessor for ManualVolumeChange()
{
  uint64_t result = type metadata singleton initialization cache for ManualVolumeChange;
  if (!type metadata singleton initialization cache for ManualVolumeChange) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(void (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v60 = a2;
  uint64_t v61 = a3;
  uint64_t v62 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManualVolumeChange?);
  __chkstk_darwin(v7 - 8);
  uint64_t v55 = (uint64_t)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for ManualVolumeChange();
  uint64_t v9 = *(void *)(v54 - 8);
  uint64_t v10 = __chkstk_darwin(v54);
  unint64_t v12 = (void (*)(uint64_t, uint64_t))((char *)v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  unint64_t v53 = (char *)v50 - v13;
  uint64_t v14 = type metadata accessor for DataFrame.Rows();
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v58 = v14;
  __chkstk_darwin(v14);
  uint64_t v56 = (char *)v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DataFrame.Slice();
  uint64_t v64 = *(void *)(v16 - 8);
  uint64_t v65 = v16;
  __chkstk_darwin(v16);
  uint64_t v63 = (char *)v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v18 = type metadata accessor for AnyColumn();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for DataFrame();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)v50 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = a1;
  static EventSetGenerationFunctions.createVolumeChangeEventTable(from:)(a1, (uint64_t)v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) != 1)
  {
    uint64_t v51 = v12;
    uint64_t v52 = v9;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
    v29._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
    object = v29._object;
    Swift::Int_optional v69 = DataFrame.indexOfColumn(_:)(v29);
    if (!v69.is_nil)
    {
      unint64_t value = v69.value;
      uint64_t v32 = DataFrame.columns.getter();
      if ((value & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (value < *(void *)(v32 + 16))
      {
        (*(void (**)(char *, unint64_t, unint64_t))(v19 + 16))(v21, v32+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * value, v18);
        swift_bridgeObjectRelease();
        uint64_t v33 = AnyColumn.wrappedElementType.getter();
        (*(void (**)(char *, unint64_t))(v19 + 8))(v21, v18);
        swift_bridgeObjectRelease();
        if (v33 == type metadata accessor for Date())
        {
          v34._countAndFlagsBits = AVLogColumns.rawValue.getter(36);
          Swift::Int_optional v70 = DataFrame.indexOfColumn(_:)(v34);
          Swift::Bool is_nil = v70.is_nil;
          swift_bridgeObjectRelease();
          if (!is_nil)
          {
            AVLogColumns.rawValue.getter(36);
            unint64_t v36 = v63;
            DataFrame.filter<A>(on:_:_:)();
            swift_bridgeObjectRelease();
            uint64_t v67 = &_swiftEmptyArrayStorage;
            uint64_t v68 = &_swiftEmptyArrayStorage;
            unint64_t v37 = v56;
            uint64_t v38 = DataFrame.Slice.rows.getter();
            v50[1] = v50;
            __chkstk_darwin(v38);
            v50[-8] = &v67;
            *(double *)&v50[-7] = a5;
            uint64_t v39 = v60;
            uint64_t v40 = (uint64_t)v66;
            v50[-6] = v59;
            v50[-5] = v40;
            uint64_t v42 = v61;
            uint64_t v41 = v62;
            v50[-4] = v39;
            v50[-3] = v42;
            v50[-2] = v41;
            v50[-1] = &v68;
            specialized Sequence.forEach(_:)((void (*)(char *))partial apply for closure #2 in static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:), (uint64_t)&v50[-10]);
            (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v58);
            if (!v67[2])
            {
              (*(void (**)(char *, uint64_t))(v64 + 8))(v36, v65);
LABEL_20:
              (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
              goto LABEL_21;
            }
            Swift::String v43 = v36;
            unint64_t v44 = (unsigned int (*)(char *, uint64_t, uint64_t))swift_bridgeObjectRetain();
            uint64_t v45 = v55;
            static ManualVolumeChangeFunctions.generateVolumeChangeSummary(previousCoherentManualVolumeChanges:dataFrame:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(v44, (uint64_t)v66, v39, v42, v41, v55);
            swift_bridgeObjectRelease();
            uint64_t v19 = v52;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v45, 1, v54) == 1)
            {
              (*(void (**)(char *, uint64_t))(v64 + 8))(v36, v65);
              (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
              outlined destroy of DataSlice?(v45, &demangling cache variable for type metadata for ManualVolumeChange?);
LABEL_21:
              uint64_t v46 = v68;
              swift_bridgeObjectRelease();
              return v46;
            }
            uint64_t v21 = v53;
            outlined init with take of ManualVolumeChange(v45, (uint64_t)v53);
            a1 = v51;
            outlined init with copy of ManualVolumeChange((uint64_t)v21, (uint64_t)v51);
            unint64_t v18 = (unint64_t)v68;
            object = v43;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
LABEL_17:
              unint64_t v49 = *(void *)(v18 + 16);
              unint64_t v48 = *(void *)(v18 + 24);
              if (v49 >= v48 >> 1) {
                unint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1, v18, &demangling cache variable for type metadata for _ContiguousArrayStorage<ManualVolumeChange>, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
              }
              *(void *)(v18 + 16) = v49 + 1;
              outlined init with take of ManualVolumeChange((uint64_t)a1, v18+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v49);
              uint64_t v68 = (void *)v18;
              outlined destroy of ManualVolumeChange((uint64_t)v21);
              (*(void (**)(void *, uint64_t))(v64 + 8))(object, v65);
              goto LABEL_20;
            }
LABEL_24:
            unint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v18 + 16) + 1, 1, v18, &demangling cache variable for type metadata for _ContiguousArrayStorage<ManualVolumeChange>, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
            goto LABEL_17;
          }
        }
LABEL_12:
        (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
        return &_swiftEmptyArrayStorage;
      }
      __break(1u);
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  outlined destroy of DataSlice?((uint64_t)v24, &demangling cache variable for type metadata for DataFrame?);
  return &_swiftEmptyArrayStorage;
}

uint64_t closure #1 in static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(uint64_t a1)
{
  return (*(void *)a1 == 1) & ~*(unsigned __int8 *)(a1 + 8);
}

uint64_t closure #2 in static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t *a7, double a8)
{
  uint64_t v101 = a7;
  uint64_t v108 = a5;
  uint64_t v109 = a6;
  uint64_t v107 = a4;
  uint64_t v106 = a3;
  uint64_t v120 = a2;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManualVolumeChange?);
  __chkstk_darwin(v10 - 8);
  uint64_t v115 = (char *)v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = type metadata accessor for ManualVolumeChange();
  uint64_t v116 = *(void *)(v105 - 8);
  uint64_t v12 = __chkstk_darwin(v105);
  uint64_t v110 = (uint64_t)v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v112 = (uint64_t)v96 - v14;
  uint64_t v15 = type metadata accessor for DataFrame.Row();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v111 = (char *)v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v100 = (char *)v96 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  char v114 = (char *)v96 - v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v96 - v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v113 = (uint64_t)v96 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v30 = (char *)v96 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  v117 = (char *)v96 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  v121 = (char *)v96 - v34;
  __chkstk_darwin(v33);
  unint64_t v36 = (char *)v96 - v35;
  uint64_t v37 = type metadata accessor for Date();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v104 = (char *)v96 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  uint64_t v42 = (char *)v96 - v41;
  AVLogColumns.rawValue.getter(1);
  uint64_t v119 = a1;
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v123)
  {
    outlined destroy of DataSlice?((uint64_t)v122, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v36, 1, 1, v37);
    return outlined destroy of DataSlice?((uint64_t)v36, &demangling cache variable for type metadata for Date?);
  }
  unint64_t v118 = v42;
  uint64_t v102 = v16;
  uint64_t v103 = v15;
  int v43 = swift_dynamicCast();
  unint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56);
  v44(v36, v43 ^ 1u, 1, v37);
  uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
  if (v45(v36, 1, v37) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v36, &demangling cache variable for type metadata for Date?);
  }
  uint64_t v98 = v38;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
  v96[1] = v38 + 32;
  v96[0] = v46;
  v46(v118, v36, v37);
  uint64_t v47 = (uint64_t)v121;
  uint64_t v99 = v37;
  v44(v121, 1, 1, v37);
  unint64_t v48 = *v120;
  if (*(void *)(*v120 + 16))
  {
    uint64_t v97 = v45;
    uint64_t v49 = v102;
    uint64_t v50 = v103;
    (*(void (**)(char *, unint64_t, uint64_t))(v102 + 16))(v24, v48 + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80)), v103);
    AVLogColumns.rawValue.getter(1);
    DataFrame.Row.subscript.getter();
    swift_bridgeObjectRelease();
    outlined destroy of DataSlice?(v47, &demangling cache variable for type metadata for Date?);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v50);
    if (v123)
    {
      uint64_t v51 = (uint64_t)v117;
      uint64_t v52 = v99;
      uint64_t v53 = swift_dynamicCast() ^ 1;
      uint64_t v54 = (char *)v51;
      uint64_t v55 = v52;
    }
    else
    {
      outlined destroy of DataSlice?((uint64_t)v122, &demangling cache variable for type metadata for Any?);
      uint64_t v51 = (uint64_t)v117;
      uint64_t v54 = v117;
      uint64_t v53 = 1;
      uint64_t v55 = v99;
    }
    v44(v54, v53, 1, v55);
    outlined init with take of (offset: Int, element: DataFrame.Row)?(v51, v47, &demangling cache variable for type metadata for Date?);
    uint64_t v45 = v97;
  }
  outlined init with copy of Date?(v47, (uint64_t)v30);
  uint64_t v57 = v99;
  unsigned int v58 = v45(v30, 1, v99);
  outlined destroy of DataSlice?((uint64_t)v30, &demangling cache variable for type metadata for Date?);
  if (v58 == 1)
  {
    uint64_t v59 = v102;
    uint64_t v60 = v114;
    uint64_t v61 = v103;
    (*(void (**)(char *, uint64_t, uint64_t))(v102 + 16))(v114, v119, v103);
    uint64_t v62 = v120;
    unint64_t v63 = *v120;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v62 = v63;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v63 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v63 + 16) + 1, 1, v63, &demangling cache variable for type metadata for _ContiguousArrayStorage<DataFrame.Row>, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row);
      *uint64_t v62 = v63;
    }
    uint64_t v65 = v118;
    unint64_t v67 = *(void *)(v63 + 16);
    unint64_t v66 = *(void *)(v63 + 24);
    if (v67 >= v66 >> 1)
    {
      unint64_t v63 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v66 > 1, v67 + 1, 1, v63, &demangling cache variable for type metadata for _ContiguousArrayStorage<DataFrame.Row>, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row);
      *uint64_t v62 = v63;
    }
    *(void *)(v63 + 16) = v67 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v59 + 32))(v63+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v67, v60, v61);
LABEL_36:
    outlined destroy of DataSlice?((uint64_t)v121, &demangling cache variable for type metadata for Date?);
    return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v65, v57);
  }
  uint64_t v68 = v113;
  outlined init with copy of Date?(v47, v113);
  if (v45((char *)v68, 1, v57) == 1)
  {
    outlined destroy of DataSlice?(v68, &demangling cache variable for type metadata for Date?);
    Swift::Int_optional v69 = v120;
    uint64_t v70 = v98;
    uint64_t v65 = v118;
    uint64_t v71 = (uint64_t)v115;
    uint64_t v72 = v116;
LABEL_25:
    char v83 = (unsigned int (*)(char *, uint64_t, uint64_t))swift_bridgeObjectRetain();
    static ManualVolumeChangeFunctions.generateVolumeChangeSummary(previousCoherentManualVolumeChanges:dataFrame:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(v83, v106, v107, v108, v109, v71);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v71, 1, v105) == 1)
    {
      outlined destroy of DataSlice?((uint64_t)v121, &demangling cache variable for type metadata for Date?);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v65, v57);
      return outlined destroy of DataSlice?(v71, &demangling cache variable for type metadata for ManualVolumeChange?);
    }
    uint64_t v84 = v112;
    outlined init with take of ManualVolumeChange(v71, v112);
    outlined init with copy of ManualVolumeChange(v84, v110);
    char v85 = v101;
    unint64_t v86 = *v101;
    char v87 = swift_isUniquelyReferenced_nonNull_native();
    *char v85 = v86;
    uint64_t v88 = v103;
    uint64_t v89 = v102;
    if ((v87 & 1) == 0)
    {
      unint64_t v86 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v86 + 16) + 1, 1, v86, &demangling cache variable for type metadata for _ContiguousArrayStorage<ManualVolumeChange>, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
      *uint64_t v101 = v86;
    }
    unint64_t v91 = *(void *)(v86 + 16);
    unint64_t v90 = *(void *)(v86 + 24);
    if (v91 >= v90 >> 1)
    {
      unint64_t v86 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v90 > 1, v91 + 1, 1, v86, &demangling cache variable for type metadata for _ContiguousArrayStorage<ManualVolumeChange>, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange, (uint64_t (*)(void))type metadata accessor for ManualVolumeChange);
      *uint64_t v101 = v86;
    }
    *(void *)(v86 + 16) = v91 + 1;
    outlined init with take of ManualVolumeChange(v110, v86+ ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80))+ *(void *)(v72 + 72) * v91);
    *Swift::Int_optional v69 = (unint64_t)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v111, v119, v88);
    unint64_t v92 = *v69;
    char v93 = swift_isUniquelyReferenced_nonNull_native();
    *Swift::Int_optional v69 = v92;
    if ((v93 & 1) == 0)
    {
      unint64_t v92 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v92 + 16) + 1, 1, v92, &demangling cache variable for type metadata for _ContiguousArrayStorage<DataFrame.Row>, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row);
      *Swift::Int_optional v69 = v92;
    }
    unint64_t v95 = *(void *)(v92 + 16);
    unint64_t v94 = *(void *)(v92 + 24);
    if (v95 >= v94 >> 1)
    {
      unint64_t v92 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v94 > 1, v95 + 1, 1, v92, &demangling cache variable for type metadata for _ContiguousArrayStorage<DataFrame.Row>, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row);
      *Swift::Int_optional v69 = v92;
    }
    *(void *)(v92 + 16) = v95 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v89 + 32))(v92+ ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80))+ *(void *)(v89 + 72) * v95, v111, v88);
    outlined destroy of ManualVolumeChange(v112);
    goto LABEL_36;
  }
  Swift::Int_optional v73 = v104;
  ((void (*)(char *, uint64_t, uint64_t))v96[0])(v104, v68, v57);
  uint64_t v65 = v118;
  Date.timeIntervalSince(_:)();
  Swift::Int_optional v69 = v120;
  uint64_t v71 = (uint64_t)v115;
  uint64_t v72 = v116;
  if (v74 >= a8)
  {
    uint64_t v70 = v98;
    (*(void (**)(char *, uint64_t))(v98 + 8))(v73, v57);
    goto LABEL_25;
  }
  uint64_t v75 = v102;
  uint64_t v76 = v100;
  uint64_t v77 = v103;
  (*(void (**)(char *, uint64_t, uint64_t))(v102 + 16))(v100, v119, v103);
  unint64_t v78 = *v69;
  char v79 = swift_isUniquelyReferenced_nonNull_native();
  *Swift::Int_optional v69 = v78;
  if ((v79 & 1) == 0)
  {
    unint64_t v78 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v78 + 16) + 1, 1, v78, &demangling cache variable for type metadata for _ContiguousArrayStorage<DataFrame.Row>, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row);
    *Swift::Int_optional v69 = v78;
  }
  unint64_t v81 = *(void *)(v78 + 16);
  unint64_t v80 = *(void *)(v78 + 24);
  if (v81 >= v80 >> 1)
  {
    unint64_t v78 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v80 > 1, v81 + 1, 1, v78, &demangling cache variable for type metadata for _ContiguousArrayStorage<DataFrame.Row>, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row, (uint64_t (*)(void))&type metadata accessor for DataFrame.Row);
    *Swift::Int_optional v69 = v78;
  }
  *(void *)(v78 + 16) = v81 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v75 + 32))(v78+ ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80))+ *(void *)(v75 + 72) * v81, v76, v77);
  v82 = *(void (**)(char *, uint64_t))(v98 + 8);
  v82(v73, v57);
  outlined destroy of DataSlice?((uint64_t)v121, &demangling cache variable for type metadata for Date?);
  return ((uint64_t (*)(char *, uint64_t))v82)(v65, v57);
}

uint64_t partial apply for closure #2 in static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(uint64_t a1)
{
  return closure #2 in static ManualVolumeChangeFunctions.computeEnvironmentalAndManualVolumeChangeDeltaPairs(in:volumeChangeGroupingThreshold:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(a1, *(unint64_t **)(v1 + 16), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(unint64_t **)(v1 + 72), *(double *)(v1 + 24));
}

uint64_t static ManualVolumeChangeFunctions.generateVolumeChangeSummary(previousCoherentManualVolumeChanges:dataFrame:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)@<X0>(unsigned int (*a1)(char *, uint64_t, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v159 = a5;
  uint64_t v158 = a4;
  uint64_t v154 = a3;
  v183 = a1;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v164 = (char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = type metadata accessor for DataFrame();
  uint64_t v156 = *(void *)(v157 - 8);
  __chkstk_darwin(v157);
  v155 = (char *)&v140 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = type metadata accessor for DataFrame.Slice();
  uint64_t v162 = *(void *)(v163 - 8);
  uint64_t v12 = __chkstk_darwin(v163);
  uint64_t v153 = (char *)&v140 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v161 = (char *)&v140 - v14;
  uint64_t v178 = type metadata accessor for DataFrame.Row();
  uint64_t v181 = *(void *)(v178 - 8);
  uint64_t v15 = __chkstk_darwin(v178);
  double v180 = (char *)&v140 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v172 = (char *)&v140 - v17;
  uint64_t v18 = type metadata accessor for DataFrame.Rows();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v174 = v18;
  uint64_t v175 = v19;
  __chkstk_darwin(v18);
  char v173 = (char *)&v140 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  uint64_t v21 = __chkstk_darwin(v168);
  v167 = (void (**)(char *, char *, uint64_t))((char *)&v140 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v21);
  uint64_t v176 = (uint64_t)&v140 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v170 = (char *)&v140 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v25);
  v177 = (char *)&v140 - v28;
  __chkstk_darwin(v27);
  char v182 = (char *)&v140 - v29;
  uint64_t v30 = type metadata accessor for Date();
  uint64_t v184 = *(void *)(v30 - 8);
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v160 = (char *)&v140 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  char v166 = (char *)&v140 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  unint64_t v165 = (char *)&v140 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  double v169 = (char *)&v140 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v171 = (char *)&v140 - v40;
  __chkstk_darwin(v39);
  uint64_t v179 = (char *)&v140 - v41;
  uint64_t v42 = type metadata accessor for AnyColumn();
  uint64_t v43 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v45 = (char *)&v140 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46._countAndFlagsBits = AVLogColumns.rawValue.getter(0);
  Swift::Int_optional v189 = DataFrame.indexOfColumn(_:)(v46);
  uint64_t v185 = a6;
  if (v189.is_nil) {
    goto LABEL_24;
  }
  unint64_t value = v189.value;
  uint64_t v152 = a2;
  uint64_t v48 = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_35;
  }
  if (value >= *(void *)(v48 + 16))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v151 = v30;
  uint64_t v149 = v9;
  uint64_t v150 = v8;
  unint64_t v49 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  uint64_t v50 = *(void *)(v43 + 72);
  unint64_t v51 = v48 + v49 + v50 * value;
  uint64_t v52 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 16);
  v52(v45, v51, v42);
  swift_bridgeObjectRelease();
  uint64_t v53 = (void *)AnyColumn.wrappedElementType.getter();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v43 + 8);
  v54(v45, v42);
  swift_bridgeObjectRelease();
  if (v53 != &type metadata for Int)
  {
LABEL_25:
    uint64_t v89 = type metadata accessor for ManualVolumeChange();
    unint64_t v90 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56);
    uint64_t v91 = v185;
    return v90(v91, 1, 1, v89);
  }
  uint64_t v148 = v52;
  v55._countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v190 = DataFrame.indexOfColumn(_:)(v55);
  if (v190.is_nil)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  unint64_t v56 = v190.value;
  uint64_t v57 = DataFrame.columns.getter();
  if ((v56 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  if (v56 >= *(void *)(v57 + 16))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    AVLogColumns.rawValue.getter(9);
    DataFrame.Row.subscript.getter();
    swift_bridgeObjectRelease();
    if (*((void *)&v188 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v140 = v186;
        goto LABEL_43;
      }
      goto LABEL_70;
    }
    goto LABEL_68;
  }
  v148(v45, v57 + v49 + v56 * v50, v42);
  swift_bridgeObjectRelease();
  uint64_t v58 = AnyColumn.wrappedElementType.getter();
  v54(v45, v42);
  swift_bridgeObjectRelease();
  if (v58 != v151) {
    goto LABEL_25;
  }
  v59._countAndFlagsBits = AVLogColumns.rawValue.getter(9);
  Swift::Int_optional v191 = DataFrame.indexOfColumn(_:)(v59);
  if (v191.is_nil) {
    goto LABEL_24;
  }
  unint64_t v60 = v191.value;
  uint64_t v61 = DataFrame.columns.getter();
  if ((v60 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_72;
  }
  if (v60 >= *(void *)(v61 + 16))
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  v148(v45, v61 + v49 + v60 * v50, v42);
  swift_bridgeObjectRelease();
  uint64_t v62 = AnyColumn.wrappedElementType.getter();
  v54(v45, v42);
  swift_bridgeObjectRelease();
  uint64_t v30 = v151;
  if (v62 != v151) {
    goto LABEL_25;
  }
  uint64_t v63 = *((void *)v183 + 2);
  uint64_t v9 = v185;
  if (!v63)
  {
    long long v187 = 0u;
    long long v188 = 0u;
    uint64_t v65 = v184;
    unint64_t v66 = v182;
    goto LABEL_28;
  }
  uint64_t v64 = (char *)v183 + ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80));
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  uint64_t v65 = v184;
  unint64_t v66 = v182;
  if (!*((void *)&v188 + 1))
  {
LABEL_28:
    outlined destroy of DataSlice?((uint64_t)&v187, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v65 + 56))(v66, 1, 1, v30);
    goto LABEL_29;
  }
  int v67 = swift_dynamicCast();
  uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v65 + 56);
  v68(v66, v67 ^ 1u, 1, v30);
  Swift::Int_optional v69 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48);
  if (v69(v66, 1, v30) == 1)
  {
LABEL_29:
    uint64_t v93 = (uint64_t)v66;
LABEL_30:
    outlined destroy of DataSlice?(v93, &demangling cache variable for type metadata for Date?);
LABEL_31:
    uint64_t v89 = type metadata accessor for ManualVolumeChange();
    unint64_t v90 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56);
    uint64_t v91 = v9;
    return v90(v91, 1, 1, v89);
  }
  v183 = v69;
  uint64_t v70 = *(void (**)(char *, unint64_t, uint64_t))(v65 + 32);
  uint64_t v71 = v179;
  char v182 = (char *)(v65 + 32);
  uint64_t v148 = v70;
  v70(v179, (unint64_t)v66, v30);
  uint64_t v72 = &v64[*(void *)(v181 + 72) * (v63 - 1)];
  AVLogColumns.rawValue.getter(1);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!*((void *)&v188 + 1))
  {
    outlined destroy of DataSlice?((uint64_t)&v187, &demangling cache variable for type metadata for Any?);
    Swift::Int_optional v73 = v177;
    v68(v177, 1, 1, v30);
    goto LABEL_33;
  }
  Swift::Int_optional v73 = v177;
  int v74 = swift_dynamicCast();
  v68(v73, v74 ^ 1u, 1, v30);
  if (v183(v73, 1, v30) == 1)
  {
LABEL_33:
    (*(void (**)(char *, uint64_t))(v184 + 8))(v71, v30);
    uint64_t v93 = (uint64_t)v73;
    goto LABEL_30;
  }
  uint64_t v144 = v72;
  uint64_t v8 = (uint64_t)v171;
  v148(v171, (unint64_t)v73, v30);
  AVLogColumns.rawValue.getter(0);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!*((void *)&v188 + 1))
  {
LABEL_36:
    outlined destroy of DataSlice?((uint64_t)&v187, &demangling cache variable for type metadata for Any?);
LABEL_37:
    unint64_t v94 = *(void (**)(uint64_t, uint64_t))(v184 + 8);
    v94(v8, v30);
    v94((uint64_t)v179, v30);
    goto LABEL_31;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_37;
  }
  uint64_t v75 = v186;
  if (v186 < 0) {
    goto LABEL_37;
  }
  if (!v186) {
    goto LABEL_40;
  }
  uint64_t v76 = v173;
  DataFrame.rows.getter();
  uint64_t v78 = v174;
  uint64_t v77 = v175;
  char v79 = *(void (**)(char *, uint64_t, uint64_t))(v175 + 16);
  unint64_t v80 = v167;
  v177 = (char *)(v175 + 16);
  char v147 = v79;
  v79((char *)v167, (uint64_t)v76, v174);
  lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  dispatch thunk of Collection.startIndex.getter();
  unint64_t v81 = *(void (**)(char *, uint64_t))(v77 + 8);
  uint64_t v175 = v77 + 8;
  unint64_t v146 = v81;
  v81(v76, v78);
  uint64_t v82 = v168;
  *(void (**)(char *, char *, uint64_t))((char *)v80 + *(int *)(v168 + 36)) = (void (*)(char *, char *, uint64_t))v187;
  uint64_t v83 = (uint64_t)v80;
  uint64_t v84 = v176;
  outlined init with take of (offset: Int, element: DataFrame.Row)?(v83, v176, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  char v85 = (uint64_t *)(v84 + *(int *)(v82 + 36));
  uint64_t v86 = *v85;
  dispatch thunk of Collection.endIndex.getter();
  if (v86 == (void)v187)
  {
LABEL_23:
    char v87 = &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>;
    uint64_t v88 = (long long *)v84;
LABEL_69:
    outlined destroy of DataSlice?((uint64_t)v88, v87);
    goto LABEL_70;
  }
  uint64_t v168 = v181 + 16;
  v167 = (void (**)(char *, char *, uint64_t))(v181 + 32);
  uint64_t v142 = v75 - 1;
  char v141 = (void (**)(char *, char *, uint64_t))(v184 + 16);
  uint64_t v143 = (void (**)(char *, uint64_t))(v184 + 8);
  v181 += 8;
  uint64_t v145 = (char *)&type metadata for Any + 8;
  while (1)
  {
    uint64_t v113 = (void (*)(long long *, void))dispatch thunk of Collection.subscript.read();
    char v114 = v172;
    uint64_t v115 = v178;
    (*(void (**)(char *))v168)(v172);
    v113(&v187, 0);
    uint64_t v116 = v173;
    v147(v173, v84, v78);
    dispatch thunk of Collection.formIndex(after:)();
    v146(v116, v78);
    (*v167)(v180, v114, v115);
    AVLogColumns.rawValue.getter(0);
    DataFrame.Row.subscript.getter();
    swift_bridgeObjectRelease();
    if (!*((void *)&v188 + 1))
    {
      outlined destroy of DataSlice?((uint64_t)&v187, &demangling cache variable for type metadata for Any?);
      uint64_t v78 = v174;
      uint64_t v84 = v176;
LABEL_50:
      (*(void (**)(char *, uint64_t))v181)(v180, v178);
      goto LABEL_51;
    }
    char v117 = swift_dynamicCast();
    uint64_t v84 = v176;
    if ((v117 & 1) == 0)
    {
      uint64_t v78 = v174;
      goto LABEL_50;
    }
    uint64_t v118 = v186;
    AVLogColumns.rawValue.getter(1);
    DataFrame.Row.subscript.getter();
    swift_bridgeObjectRelease();
    if (!*((void *)&v188 + 1))
    {
      outlined destroy of DataSlice?((uint64_t)&v187, &demangling cache variable for type metadata for Any?);
      uint64_t v119 = (uint64_t)v170;
      v68(v170, 1, 1, v151);
LABEL_63:
      (*(void (**)(char *, uint64_t))v181)(v180, v178);
      outlined destroy of DataSlice?(v119, &demangling cache variable for type metadata for Date?);
      uint64_t v78 = v174;
      goto LABEL_51;
    }
    uint64_t v119 = (uint64_t)v170;
    uint64_t v120 = v151;
    int v121 = swift_dynamicCast();
    v68((char *)v119, v121 ^ 1u, 1, v120);
    if (v183((char *)v119, 1, v120) == 1) {
      goto LABEL_63;
    }
    v148(v169, v119, v151);
    AVLogColumns.rawValue.getter(9);
    DataFrame.Row.subscript.getter();
    swift_bridgeObjectRelease();
    if (!*((void *)&v188 + 1))
    {
      outlined destroy of DataSlice?((uint64_t)&v187, &demangling cache variable for type metadata for Any?);
LABEL_65:
      (*v143)(v169, v151);
LABEL_66:
      (*(void (**)(char *, uint64_t))v181)(v180, v178);
      uint64_t v78 = v174;
      uint64_t v84 = v176;
      goto LABEL_51;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_65;
    }
    uint64_t v140 = v186;
    uint64_t v122 = *v141;
    uint64_t v123 = v151;
    (*v141)(v165, v179, v151);
    v122(v166, v169, v123);
    if (v118 != v142)
    {
      v131 = *v143;
      uint64_t v132 = v151;
      (*v143)(v166, v151);
      v131(v165, v132);
      v131(v169, v132);
      goto LABEL_66;
    }
    unint64_t v124 = v166;
    uint64_t v125 = v165;
    Date.timeIntervalSince(_:)();
    double v127 = v126;
    uint64_t v128 = *v143;
    uint64_t v129 = v124;
    uint64_t v130 = v151;
    (*v143)(v129, v151);
    v128(v125, v130);
    v128(v169, v130);
    (*(void (**)(char *, uint64_t))v181)(v180, v178);
    uint64_t v78 = v174;
    uint64_t v84 = v176;
    if (v127 < 5.0) {
      break;
    }
LABEL_51:
    uint64_t v112 = *v85;
    dispatch thunk of Collection.endIndex.getter();
    if (v112 == (void)v187) {
      goto LABEL_23;
    }
  }
  outlined destroy of DataSlice?(v176, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
LABEL_43:
  AVLogColumns.rawValue.getter(9);
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!*((void *)&v188 + 1))
  {
LABEL_68:
    char v87 = &demangling cache variable for type metadata for Any?;
    uint64_t v88 = &v187;
    goto LABEL_69;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_70:
    uint64_t v133 = *(void (**)(char *, uint64_t))(v184 + 8);
    uint64_t v134 = v151;
    v133(v171, v151);
    v133(v179, v134);
    goto LABEL_25;
  }
  v183 = (unsigned int (*)(char *, uint64_t, uint64_t))(v186 - v140);
  if (__OFSUB__(v186, v140))
  {
    __break(1u);
  }
  else
  {
    uint64_t v95 = AVLogColumns.rawValue.getter(1);
    __chkstk_darwin(v95);
    uint64_t v96 = v179;
    uint64_t v97 = v171;
    *(&v140 - 4) = (uint64_t)v179;
    *(&v140 - 3) = (uint64_t)v97;
    *(&v140 - 2) = v154;
    uint64_t v98 = v161;
    uint64_t v99 = v151;
    DataFrame.filter<A>(on:_:_:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v153, v98, v163);
    uint64_t v100 = (uint64_t)v155;
    DataFrame.init(_:)();
    char v182 = (char *)specialized static ManualVolumeChangeFunctions.computestHighestEnvironmentalVolumeChange(in:windowSize:sideSize:)(v100, v158, v159);
    LODWORD(v181) = v101;
    (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v100, v157);
    uint64_t v102 = Logger.eventSetGenerator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v164, v102, v150);
    double v180 = *(char **)(v184 + 16);
    ((void (*)(char *, char *, uint64_t))v180)(v160, v96, v99);
    uint64_t v50 = Logger.logObject.getter();
    os_log_type_t v103 = static os_log_type_t.info.getter();
    LODWORD(v178) = v103;
    if (os_log_type_enabled((os_log_t)v50, v103))
    {
      uint64_t v104 = swift_slowAlloc();
      v177 = (char *)swift_slowAlloc();
      uint64_t v186 = (uint64_t)v177;
      *(_DWORD *)uint64_t v104 = 136315650;
      lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type Date and conformance Date, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v105 = v160;
      uint64_t v106 = v151;
      uint64_t v107 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)&long long v187 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v107, v108, &v186);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v109 = *(void (**)(char *, uint64_t))(v184 + 8);
      v109(v105, v106);
      *(_WORD *)(v104 + 12) = 2048;
      *(void *)&long long v187 = v183;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v104 + 22) = 2080;
      *(void *)&long long v187 = v182;
      BYTE8(v187) = v181 & 1;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
      uint64_t v110 = String.init<A>(describing:)();
      *(void *)&long long v187 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v110, v111, &v186);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v50, (os_log_type_t)v178, "Found manual volume change at %s. System volume changed by %ld, environmental audio exposure changed by %s.", (uint8_t *)v104, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_74;
    }
LABEL_73:

    uint64_t v109 = *(void (**)(char *, uint64_t))(v184 + 8);
    v109(v160, v151);
LABEL_74:
    (*(void (**)(char *, uint64_t))(v149 + 8))(v164, v150);
    (*(void (**)(char *, uint64_t))(v162 + 8))(v161, v163);
    uint64_t v135 = v185;
    uint64_t v136 = v179;
    uint64_t v137 = v151;
    ((void (*)(uint64_t, char *, uint64_t))v180)(v185, v179, v151);
    uint64_t v138 = type metadata accessor for ManualVolumeChange();
    *(void *)(v135 + *(int *)(v138 + 20)) = v183;
    uint64_t v139 = v135 + *(int *)(v138 + 24);
    *(void *)uint64_t v139 = v182;
    *(unsigned char *)(v139 + 8) = v181 & 1;
    v109(v171, v137);
    v109(v136, v137);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v138 - 8) + 56))(v135, 0, 1, v138);
  }
  return result;
}

uint64_t outlined init with take of ManualVolumeChange(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ManualVolumeChange();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ManualVolumeChange(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ManualVolumeChange();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ManualVolumeChangeFunctions.manualVolumeChangeLikelihood(in:minimumEnvDelta:beforeWindowLength:transitionWindowLength:afterWindowLength:searchWindowLength:envChangeCooldownPeriod:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v180 = a6;
  uint64_t v214 = a1;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v215 = (char *)v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DiscontiguousColumnSlice<Int>);
  uint64_t v205 = *(void **)(v200 - 8);
  __chkstk_darwin(v200);
  uint64_t v199 = (char *)v159 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = type metadata accessor for DataFrame.Slice();
  uint64_t v204 = *(void *)(v189 - 8);
  uint64_t v16 = __chkstk_darwin(v189);
  uint64_t v208 = (uint64_t)v159 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v213 = (uint64_t)v159 - v19;
  __chkstk_darwin(v18);
  uint64_t v216 = (uint64_t)v159 - v20;
  uint64_t v219 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: DataFrame.Row));
  double v207 = *(void **)(v219 - 8);
  __chkstk_darwin(v219);
  uint64_t v196 = (char *)v159 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = type metadata accessor for DataFrame.Row();
  uint64_t v203 = *(void (***)(char *, uint64_t))(v197 - 8);
  uint64_t v22 = __chkstk_darwin(v197);
  uint64_t v175 = (char *)v159 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  char v173 = (char *)v159 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v172 = (char *)v159 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  char v195 = (char *)v159 - v29;
  __chkstk_darwin(v28);
  uint64_t v194 = (char *)v159 - v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: DataFrame.Row)?);
  uint64_t v32 = __chkstk_darwin(v31 - 8);
  uint64_t v174 = (void *)((char *)v159 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v176 = (char *)v159 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  char v211 = (char *)v159 - v37;
  __chkstk_darwin(v36);
  double v210 = (void *)((char *)v159 - v38);
  uint64_t v218 = type metadata accessor for DataFrame.Rows();
  uint64_t v181 = *(void *)(v218 - 8);
  __chkstk_darwin(v218);
  uint64_t v217 = (char *)v159 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<DataFrame.Rows>);
  __chkstk_darwin(v40 - 8);
  uint64_t v179 = (char *)v159 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<DataFrame.Rows>.Iterator);
  uint64_t v42 = __chkstk_darwin(v178);
  v177 = (char *)v159 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  uint64_t v212 = (uint64_t)v159 - v44;
  uint64_t v45 = type metadata accessor for AnyColumn();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t result = __chkstk_darwin(v45);
  unint64_t v49 = (char *)v159 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v192 = a3;
  uint64_t v193 = a2;
  uint64_t v50 = a2 + a3;
  if (__OFADD__(a2, a3))
  {
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  if (a5 <= a4) {
    uint64_t v51 = a4;
  }
  else {
    uint64_t v51 = a5;
  }
  uint64_t v209 = v50 + v51;
  if (__OFADD__(v50, v51)) {
    goto LABEL_93;
  }
  uint64_t v191 = a4;
  uint64_t v190 = a5;
  v52._countAndFlagsBits = AVLogColumns.rawValue.getter(8);
  Swift::Int_optional v223 = DataFrame.indexOfColumn(_:)(v52);
  if (v223.is_nil)
  {
    swift_bridgeObjectRelease();
    goto LABEL_76;
  }
  unint64_t value = v223.value;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  if (value >= *(void *)(result + 16))
  {
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v46 + 16))(v49, result+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(void *)(v46 + 72) * value, v45);
  swift_bridgeObjectRelease();
  uint64_t v54 = (void *)AnyColumn.wrappedElementType.getter();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v45);
  swift_bridgeObjectRelease();
  if (v54 != &type metadata for Int)
  {
LABEL_76:
    uint64_t v154 = Logger.aggregationFunction.unsafeMutableAddressor();
    v155 = v215;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v215, v154, v12);
    uint64_t v156 = Logger.logObject.getter();
    os_log_type_t v157 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v156, v157))
    {
      uint64_t v158 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v158 = 0;
      _os_log_impl((void *)&_mh_execute_header, v156, v157, "Data Frame does not contain downlinkdBA column! Returning 0.0 as manual volume change likelihood.", v158, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v155, v12);
  }
  Swift::String v55 = v179;
  DataFrame.rows.getter();
  uint64_t v56 = v181 + 32;
  uint64_t v57 = v218;
  char v166 = *(void (**)(char *, char *, uint64_t))(v181 + 32);
  v166(v217, v55, v218);
  uint64_t v58 = lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v59 = v212;
  uint64_t v165 = v58;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v60 = *(int *)(v178 + 36);
  *(void *)(v59 + v60) = 0;
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  uint64_t v61 = (void *)(v59 + *(int *)(v164 + 36));
  uint64_t v62 = lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v170 = 0;
  uint64_t v168 = 0;
  uint64_t v171 = 0;
  long long v187 = (void (**)(char *))(v203 + 2);
  uint64_t v186 = (void (**)(char *, uint64_t, uint64_t))(v56 - 16);
  uint64_t v181 = v56;
  v215 = (char *)(v56 - 24);
  long long v188 = (void (**)(char *, char *, uint64_t))(v203 + 4);
  uint64_t v206 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v207 + 7);
  v207 += 6;
  ++v203;
  unint64_t v198 = (void (**)(char *, uint64_t))(v205 + 1);
  uint64_t v184 = (void (**)(uint64_t, uint64_t))(v204 + 8);
  double v169 = (char *)&_swiftEmptyArrayStorage;
  v167 = (char *)&type metadata for Any + 8;
  uint64_t v63 = v197;
  uint64_t v205 = v61;
  uint64_t v204 = v62;
  uint64_t v185 = v60;
  while (1)
  {
    uint64_t v65 = v211;
    uint64_t v64 = v212;
    while (1)
    {
      uint64_t v66 = *v61;
      uint64_t v67 = v64;
      dispatch thunk of Collection.endIndex.getter();
      if (v66 == v221)
      {
        uint64_t v68 = *v206;
        (*v206)((uint64_t)v65, 1, 1, v219);
      }
      else
      {
        Swift::Int_optional v69 = (void (*)(uint64_t *, void))dispatch thunk of Collection.subscript.read();
        uint64_t v70 = v195;
        (*v187)(v195);
        v69(&v221, 0);
        uint64_t v71 = v217;
        (*v186)(v217, v67, v57);
        dispatch thunk of Collection.formIndex(after:)();
        uint64_t v72 = v219;
        (*(void (**)(char *, uint64_t))v215)(v71, v57);
        Swift::Int_optional v73 = *v188;
        int v74 = v194;
        (*v188)(v194, v70, v63);
        uint64_t v75 = &v196[*(int *)(v72 + 48)];
        uint64_t v76 = v185;
        uint64_t v77 = *(void *)(v67 + v185);
        uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v73)(v75, v74, v63);
        if (__OFADD__(v77, 1)) {
          goto LABEL_81;
        }
        *(void *)(v67 + v76) = v77 + 1;
        uint64_t v78 = (char *)v65 + *(int *)(v72 + 48);
        *uint64_t v65 = v77;
        v73(v78, v75, v63);
        uint64_t v68 = *v206;
        (*v206)((uint64_t)v65, 0, 1, v72);
        uint64_t v61 = v205;
      }
      char v79 = v210;
      outlined init with take of (offset: Int, element: DataFrame.Row)?((uint64_t)v65, (uint64_t)v210, &demangling cache variable for type metadata for (offset: Int, element: DataFrame.Row)?);
      unint64_t v80 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))*v207;
      uint64_t result = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))*v207)(v79, 1, v219);
      if (result == 1)
      {
        outlined destroy of DataSlice?(v212, &demangling cache variable for type metadata for EnumeratedSequence<DataFrame.Rows>.Iterator);
        return swift_bridgeObjectRelease();
      }
      uint64_t v81 = *v79;
      uint64_t v82 = *v79 + v209;
      if (__OFADD__(*v79, v209))
      {
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
        goto LABEL_92;
      }
      v202 = (unsigned int (*)(char *, uint64_t, uint64_t))v80;
      uint64_t v83 = (char *)v79 + *(int *)(v219 + 48);
      uint64_t v84 = v217;
      DataFrame.rows.getter();
      uint64_t v85 = DataFrame.Rows.count.getter();
      uint64_t v86 = *(void (**)(char *, uint64_t))v215;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))v215)(v84, v218);
      if (v82 >= v85) {
        goto LABEL_34;
      }
      uint64_t v87 = v81 + v193;
      if (__OFADD__(v81, v193)) {
        goto LABEL_82;
      }
      uint64_t v88 = v87 - 1;
      if (__OFSUB__(v87, 1)) {
        goto LABEL_83;
      }
      if (v88 < v81) {
        goto LABEL_84;
      }
      char v182 = v86;
      v183 = v68;
      uint64_t result = specialized DataFrameProtocol.subscript.getter(v81, v88, v216);
      uint64_t v89 = v87 + v192;
      if (__OFADD__(v87, v192)) {
        goto LABEL_85;
      }
      uint64_t v90 = v89 + v191;
      if (__OFADD__(v89, v191)) {
        goto LABEL_86;
      }
      uint64_t v91 = v90 - 1;
      if (__OFSUB__(v90, 1)) {
        goto LABEL_87;
      }
      if (v91 < v89) {
        goto LABEL_88;
      }
      uint64_t result = specialized DataFrameProtocol.subscript.getter(v87 + v192, v91, v213);
      uint64_t v92 = v89 + v190;
      if (__OFADD__(v89, v190)) {
        goto LABEL_89;
      }
      uint64_t v93 = v92 - 1;
      if (__OFSUB__(v92, 1)) {
        goto LABEL_90;
      }
      if (v93 < v89) {
        goto LABEL_91;
      }
      uint64_t v201 = v83;
      specialized DataFrameProtocol.subscript.getter(v89, v93, v208);
      AVLogColumns.rawValue.getter(8);
      unint64_t v94 = v199;
      DataFrame.Slice.subscript.getter();
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type Int and conformance Int();
      uint64_t v95 = v200;
      uint64_t v96 = DiscontiguousColumnSlice<A>.mean()();
      char v98 = v97;
      uint64_t v99 = *v198;
      (*v198)(v94, v95);
      if (v98) {
        goto LABEL_32;
      }
      AVLogColumns.rawValue.getter(8);
      uint64_t v100 = v199;
      DataFrame.Slice.subscript.getter();
      swift_bridgeObjectRelease();
      uint64_t v101 = v200;
      uint64_t v102 = DiscontiguousColumnSlice<A>.mean()();
      char v104 = v103;
      v99(v100, v101);
      if ((v104 & 1) != 0 || vabdd_f64(*(double *)&v102, *(double *)&v96) < a7)
      {
LABEL_32:
        uint64_t v105 = *v184;
        uint64_t v106 = v189;
        (*v184)(v208, v189);
        v105(v213, v106);
        v105(v216, v106);
        uint64_t v63 = v197;
        uint64_t v61 = v205;
LABEL_33:
        uint64_t v83 = v201;
LABEL_34:
        (*v203)(v83, v63);
        goto LABEL_35;
      }
      uint64_t result = v208;
      uint64_t v63 = v197;
      uint64_t v61 = v205;
      if (__OFSUB__(v81, v171)) {
        goto LABEL_96;
      }
      if (v81 - v171 < v180)
      {
        uint64_t v107 = *v184;
        uint64_t v108 = v189;
        (*v184)(v208, v189);
        v107(v213, v108);
        v107(v216, v108);
        goto LABEL_33;
      }
      if (__OFADD__(v170, 1)) {
        goto LABEL_97;
      }
      ++v170;
      uint64_t v109 = AVLogColumns.rawValue.getter(35);
      unint64_t v111 = v110;
      uint64_t v163 = AVLogColumns.rawValue.getter(36);
      uint64_t v113 = v112;
      v114._countAndFlagsBits = v109;
      v114._object = v111;
      Swift::Int_optional v224 = DataFrame.indexOfColumn(_:)(v114);
      if (!v224.is_nil) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v115 = *v184;
      uint64_t v116 = v189;
      (*v184)(v208, v189);
      v115(v213, v116);
      v115(v216, v116);
      (*v203)(v201, v63);
LABEL_35:
      uint64_t v65 = v211;
      uint64_t v64 = v212;
      uint64_t v57 = v218;
    }
    v159[1] = v113;
    uint64_t v162 = v109;
    uint64_t v171 = (uint64_t)v111;
    char v117 = v179;
    DataFrame.Slice.rows.getter();
    v166(v217, v117, v218);
    uint64_t v118 = v177;
    dispatch thunk of Sequence.makeIterator()();
    v159[0] = 0;
    uint64_t v119 = *(int *)(v178 + 36);
    *(void *)&v118[v119] = 0;
    uint64_t v120 = &v118[*(int *)(v164 + 36)];
    v161 = v120;
    uint64_t v160 = v119;
LABEL_43:
    int v121 = v175;
    uint64_t v122 = (uint64_t)v174;
LABEL_46:
    uint64_t v123 = *(void *)v120;
    uint64_t v124 = v218;
    dispatch thunk of Collection.endIndex.getter();
    if (v123 == v221)
    {
      v183(v122, 1, 1, v219);
      uint64_t v125 = (uint64_t)v177;
    }
    else
    {
      double v126 = v177;
      double v127 = (void (*)(uint64_t *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v128 = v173;
      uint64_t v129 = v197;
      (*v187)(v173);
      v127(&v221, 0);
      uint64_t v130 = v217;
      (*v186)(v217, (uint64_t)v126, v124);
      dispatch thunk of Collection.formIndex(after:)();
      v182(v130, v124);
      v131 = *v188;
      uint64_t v132 = v172;
      (*v188)(v172, v128, v129);
      uint64_t v133 = &v196[*(int *)(v219 + 48)];
      uint64_t v134 = v160;
      uint64_t v135 = *(void *)&v126[v160];
      uint64_t v136 = v129;
      uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v131)(v133, v132, v129);
      if (__OFADD__(v135, 1)) {
        goto LABEL_98;
      }
      uint64_t v137 = v177;
      *(void *)&v177[v134] = v135 + 1;
      uint64_t v138 = v219;
      uint64_t v139 = v174;
      uint64_t v140 = (char *)v174 + *(int *)(v219 + 48);
      *uint64_t v174 = v135;
      uint64_t v141 = v136;
      uint64_t v122 = (uint64_t)v139;
      v131(v140, v133, v141);
      v183(v122, 0, 1, v138);
      int v121 = v175;
      uint64_t v125 = (uint64_t)v137;
    }
    uint64_t v142 = v176;
    outlined init with take of (offset: Int, element: DataFrame.Row)?(v122, (uint64_t)v176, &demangling cache variable for type metadata for (offset: Int, element: DataFrame.Row)?);
    if (v202(v142, 1, v219) != 1) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of DataSlice?(v125, &demangling cache variable for type metadata for EnumeratedSequence<DataFrame.Rows>.Iterator);
    uint64_t v151 = *v184;
    uint64_t v152 = v189;
    (*v184)(v208, v189);
    v151(v213, v152);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v151)(v216, v152);
    BOOL v153 = __OFADD__(v168, v159[0] & 1);
    v168 += v159[0] & 1;
    if (v153) {
      goto LABEL_99;
    }
    uint64_t v63 = v197;
    (*v203)(v201, v197);
    uint64_t v171 = v81;
    uint64_t v57 = v218;
    uint64_t v61 = v205;
  }
  uint64_t v143 = *(void *)v142;
  (*v188)(v121, &v142[*(int *)(v219 + 48)], v197);
  DataFrame.Row.subscript.getter();
  if (!v222) {
    goto LABEL_44;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_45;
  }
  uint64_t v144 = v220;
  DataFrame.Row.subscript.getter();
  if (!v222)
  {
LABEL_44:
    outlined destroy of DataSlice?((uint64_t)&v221, &demangling cache variable for type metadata for Any?);
LABEL_45:
    (*v203)(v121, v197);
    uint64_t v120 = v161;
    goto LABEL_46;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_45;
  }
  if (v144 != 1 || v220 != 1) {
    goto LABEL_65;
  }
  uint64_t v145 = *((void *)v169 + 2);
  if (!v145) {
    goto LABEL_60;
  }
  if (*((void *)v169 + 4) == v143) {
    goto LABEL_65;
  }
  if (v145 == 1) {
    goto LABEL_60;
  }
  if (*((void *)v169 + 5) == v143)
  {
LABEL_65:
    (*v203)(v175, v197);
    uint64_t v120 = v161;
    goto LABEL_43;
  }
  if (v145 == 2)
  {
LABEL_60:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      double v169 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v145 + 1, 1, v169);
    }
    unint64_t v147 = *((void *)v169 + 2);
    unint64_t v146 = *((void *)v169 + 3);
    if (v147 >= v146 >> 1) {
      double v169 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v146 > 1), v147 + 1, 1, v169);
    }
    uint64_t v148 = v169;
    *((void *)v169 + 2) = v147 + 1;
    *(void *)&v148[8 * v147 + 32] = v143;
    v159[0] = 1;
    goto LABEL_65;
  }
  uint64_t v149 = 6;
  while (1)
  {
    uint64_t v150 = v149 - 3;
    if (__OFADD__(v149 - 4, 1)) {
      break;
    }
    if (*(void *)&v169[8 * v149] == v143) {
      goto LABEL_65;
    }
    ++v149;
    if (v150 == v145) {
      goto LABEL_60;
    }
  }
LABEL_100:
  __break(1u);
  return result;
}

uint64_t specialized DataFrameProtocol.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v12[0] = a3;
  v12[1] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DefaultIndices<DataFrame.Rows>);
  __chkstk_darwin(v4);
  unsigned int v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DataFrame.Rows();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataFrame();
  dispatch thunk of DataFrameProtocol.rows.getter();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12[2] = a2;
  dispatch thunk of Collection.index(after:)();
  outlined destroy of DataSlice?((uint64_t)v6, &demangling cache variable for type metadata for DefaultIndices<DataFrame.Rows>);
  return dispatch thunk of DataFrameProtocol.subscript.getter();
}

uint64_t ManualVolumeChangeFunctions.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t ManualVolumeChangeFunctions.__allocating_init()()
{
  return swift_allocObject();
}

BOOL closure #1 in static ManualVolumeChangeFunctions.generateVolumeChangeSummary(previousCoherentManualVolumeChanges:dataFrame:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of DataSlice?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    Date.timeIntervalSince(_:)();
    double v15 = v14;
    Date.timeIntervalSince(_:)();
    if (v16 <= 2.0) {
      double v16 = 2.0;
    }
    BOOL v13 = v16 < v15 && v15 <= (double)a4;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v13;
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double>);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
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

uint64_t outlined destroy of ManualVolumeChange(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ManualVolumeChange();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t lazy protocol witness table accessor for type Date and conformance Date(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for ManualVolumeChange(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for Date();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    v9[8] = v10[8];
  }
  return a1;
}

uint64_t destroy for ManualVolumeChange(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for ManualVolumeChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t assignWithCopy for ManualVolumeChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  return a1;
}

uint64_t initializeWithTake for ManualVolumeChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t assignWithTake for ManualVolumeChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManualVolumeChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000179B8);
}

uint64_t sub_1000179B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ManualVolumeChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100017A38);
}

uint64_t sub_100017A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata completion function for ManualVolumeChange()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ManualVolumeChangeFunctions()
{
  return self;
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
    int v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
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

uint64_t specialized static ManualVolumeChangeFunctions.computestHighestEnvironmentalVolumeChange(in:windowSize:sideSize:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for AnyColumn();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DataFrame.Rows();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  DataFrame.rows.getter();
  uint64_t v13 = DataFrame.Rows.count.getter();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v13 < a2) {
    return 0;
  }
  v14._countAndFlagsBits = AVLogColumns.rawValue.getter(23);
  Swift::Int_optional v58 = DataFrame.indexOfColumn(_:)(v14);
  if (v58.is_nil)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t value = v58.value;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (value >= *(void *)(result + 16))
  {
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
    return result;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, result+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * value, v5);
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)AnyColumn.wrappedElementType.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  if (v17 != &type metadata for Int) {
    return 0;
  }
  AVLogColumns.rawValue.getter(23);
  uint64_t v18 = DataFrame.subscript.getter();
  swift_bridgeObjectRelease();
  int64_t v19 = *(void *)(v18 + 16);
  if (v19 && v19 >= a2)
  {
    uint64_t v21 = v18 + 32;
    char v22 = *(unsigned char *)(v18 + 40);
    uint64_t v23 = *(void *)(v18 + 32);
    uint64_t v56 = a2 - a3;
    BOOL v24 = __OFSUB__(a2, a3);
    BOOL v57 = v24;
    double v25 = (double)a3;
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v26 = 0;
    uint64_t v27 = (char *)&_swiftEmptyArrayStorage;
    double v20 = 0.0;
    unint64_t v28 = 1;
    uint64_t v29 = (char *)&_swiftEmptyArrayStorage;
    unint64_t v30 = v19;
    uint64_t v53 = v18 + 32;
    int64_t v54 = v19;
    while (1)
    {
      if ((v22 & 1) == 0)
      {
        if (v57) {
          goto LABEL_55;
        }
        BOOL v31 = __OFADD__(v26, v56);
        unint64_t v32 = v26 + v56;
        if (v31) {
          goto LABEL_56;
        }
        if (v32 >= v30) {
          goto LABEL_57;
        }
        uint64_t v33 = v21 + 16 * v32;
        if ((*(unsigned char *)(v33 + 8) & 1) == 0)
        {
          uint64_t v55 = *(void *)v33;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v27 + 2) + 1, 1, v27);
          }
          unint64_t v35 = *((void *)v27 + 2);
          unint64_t v34 = *((void *)v27 + 3);
          if (v35 >= v34 >> 1) {
            uint64_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v34 > 1), v35 + 1, 1, v27);
          }
          *((void *)v27 + 2) = v35 + 1;
          *(double *)&v27[8 * v35 + 32] = (double)v23;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v29 + 2) + 1, 1, v29);
            uint64_t v29 = (char *)result;
          }
          unint64_t v37 = *((void *)v29 + 2);
          unint64_t v36 = *((void *)v29 + 3);
          uint64_t v38 = v37 + 1;
          if (v37 >= v36 >> 1)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v36 > 1), v37 + 1, 1, v29);
            uint64_t v29 = (char *)result;
          }
          double v39 = (double)v55;
          *((void *)v29 + 2) = v38;
          uint64_t v40 = (double *)(v29 + 32);
          *(double *)&v29[8 * v37 + 32] = v39;
          uint64_t v41 = *((void *)v27 + 2);
          if (v41 > a3)
          {
            if (!v41) {
              goto LABEL_58;
            }
            --v41;
            uint64_t result = (uint64_t)memmove(v27 + 32, v27 + 40, 8 * v41);
            *((void *)v27 + 2) = v41;
            uint64_t v38 = *((void *)v29 + 2);
          }
          if (v38 > a3)
          {
            if (!v38) {
              goto LABEL_59;
            }
            --v38;
            uint64_t result = (uint64_t)memmove(v29 + 32, v29 + 40, 8 * v38);
            *((void *)v29 + 2) = v38;
            uint64_t v41 = *((void *)v27 + 2);
          }
          if (v41 == a3)
          {
            uint64_t v21 = v53;
            if (v38 == a3)
            {
              int64_t v19 = v54;
              if (a3)
              {
                uint64_t v42 = 0;
                double v43 = 0.0;
                do
                {
                  double v44 = *(double *)&v27[8 * v42++ + 32];
                  double v43 = v43 + v44;
                }
                while (a3 != v42);
                double v45 = 0.0;
                uint64_t v46 = a3;
                do
                {
                  double v47 = *v40++;
                  double v45 = v45 + v47;
                  --v46;
                }
                while (v46);
              }
              else
              {
                double v43 = 0.0;
                double v45 = 0.0;
              }
              double v48 = v43 / v25;
              double v49 = v45 / v25;
              if (fabs(v20) < vabdd_f64(v49, v48)) {
                double v20 = v49 - v48;
              }
            }
            else
            {
              int64_t v19 = v54;
            }
          }
          else
          {
            uint64_t v21 = v53;
            int64_t v19 = v54;
          }
        }
      }
      uint64_t v50 = v19 - v28;
      if (v19 == v28)
      {
LABEL_50:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        return *(void *)&v20;
      }
      unint64_t v30 = *(void *)(v18 + 16);
      if (v28 >= v30) {
        break;
      }
      unint64_t v51 = v21 + 16 * v28;
      unint64_t v26 = v28++;
      char v22 = *(unsigned char *)(v51 + 8);
      uint64_t v23 = *(void *)v51;
      if (v50 < a2) {
        goto LABEL_50;
      }
    }
    __break(1u);
    goto LABEL_53;
  }
  swift_bridgeObjectRelease();
  double v20 = 0.0;
  return *(void *)&v20;
}

BOOL partial apply for closure #1 in static ManualVolumeChangeFunctions.generateVolumeChangeSummary(previousCoherentManualVolumeChanges:dataFrame:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(uint64_t a1)
{
  return closure #1 in static ManualVolumeChangeFunctions.generateVolumeChangeSummary(previousCoherentManualVolumeChanges:dataFrame:envLookbackWindowSize:envDeltaTotalWindowSize:envDeltaAveragingWindowSize:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of (offset: Int, element: DataFrame.Row)?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpectedEventSetGenerationFunctions(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v3 = 0x696C537475706E69;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006563;
  }
  else {
    unint64_t v4 = 0x8000000100033E20;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v5 = 0x696C537475706E69;
  }
  if (a2) {
    unint64_t v6 = 0x8000000100033E20;
  }
  else {
    unint64_t v6 = 0xEA00000000006563;
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

{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001ALL;
  }
  else {
    unint64_t v3 = 0xD00000000000001BLL;
  }
  if (v2) {
    unint64_t v4 = 0x8000000100033DD0;
  }
  else {
    unint64_t v4 = 0x8000000100033DF0;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001ALL;
  }
  else {
    unint64_t v5 = 0xD00000000000001BLL;
  }
  if (a2) {
    unint64_t v6 = 0x8000000100033DF0;
  }
  else {
    unint64_t v6 = 0x8000000100033DD0;
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

{
  char v3;

  if (*(void *)&aPropertyvalue[8 * a1] == *(void *)&aPropertyvalue[8 * a2]
    && *(void *)&aOperatio[8 * a1 + 8] == *(void *)&aOperatio[8 * a2 + 8])
  {
    unint64_t v3 = 1;
  }
  else
  {
    unint64_t v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpectedEventSetGenerationFunctions()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ExpectedEventSetGenerationFunctions()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpectedEventSetGenerationFunctions()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedEventSetGenerationFunctions@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  v2._rawValue = &outlined read-only object #0 of ExpectedEventSetGenerationFunctions.init(rawValue:);
  return protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedEventSetGenerationFunctions(v2, a1, a2);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ExpectedEventSetGenerationFunctions(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD00000000000001ALL;
  }
  else {
    unint64_t v2 = 0xD00000000000001BLL;
  }
  unint64_t v3 = 0x8000000100033DD0;
  if (*v1) {
    unint64_t v3 = 0x8000000100033DF0;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t ExpectedEventSetGenerationArguments.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD00000000000001BLL;
  }
  else {
    return 0x696C537475706E69;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpectedEventSetGenerationArguments(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpectedEventSetGenerationArguments()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ExpectedEventSetGenerationArguments()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpectedEventSetGenerationArguments()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedEventSetGenerationArguments@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  v2._rawValue = &outlined read-only object #0 of ExpectedEventSetGenerationArguments.init(rawValue:);
  return protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedEventSetGenerationFunctions(v2, a1, a2);
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedEventSetGenerationFunctions@<X0>(Swift::OpaquePointer cases@<0:X3>, Swift::String *a2@<X0>, char *a3@<X8>)
{
  Swift::Int v4 = _findStringSwitchCase(cases:string:)(cases, *a2);
  uint64_t result = swift_bridgeObjectRelease();
  if (v4 == 1) {
    char v6 = 1;
  }
  else {
    char v6 = 2;
  }
  if (!v4) {
    char v6 = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ExpectedEventSetGenerationArguments@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ExpectedEventSetGenerationArguments.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t static EventSetGenerationFunctions.run(volumeChangeRetrieval:dataSlices:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v216 = a3;
  uint64_t v201 = type metadata accessor for DataFrame.Rows();
  uint64_t v195 = *(void *)(v201 - 8);
  __chkstk_darwin(v201);
  uint64_t v194 = (char *)&v180 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v214 = v6;
  uint64_t v215 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v180 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v180 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  long long v188 = (char *)&v180 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v193 = (char *)&v180 - v17;
  __chkstk_darwin(v16);
  uint64_t v203 = (char *)&v180 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v202 = (uint64_t)&v180 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v190 = (uint64_t)&v180 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  unint64_t v26 = (char *)&v180 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v207 = (uint64_t)&v180 - v28;
  __chkstk_darwin(v27);
  unint64_t v30 = (char *)&v180 - v29;
  uint64_t v209 = type metadata accessor for DataFrame();
  uint64_t v211 = *(void *)(v209 - 8);
  uint64_t v31 = __chkstk_darwin(v209);
  unint64_t v198 = (char *)&v180 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v197 = (void (*)(uint64_t, uint64_t))((char *)&v180 - v34);
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v191 = (char *)&v180 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v189 = (char *)&v180 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v192 = (char *)&v180 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v204 = (char *)&v180 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v200 = (char *)&v180 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  uint64_t v205 = (char *)&v180 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  double v210 = (char *)&v180 - v48;
  __chkstk_darwin(v47);
  uint64_t v212 = (void (*)(uint64_t, uint64_t))((char *)&v180 - v49);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
  __chkstk_darwin(v50 - 8);
  uint64_t v52 = (char *)&v180 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for DataSlice(0);
  uint64_t v54 = *(void *)(v53 - 8);
  uint64_t v55 = __chkstk_darwin(v53);
  uint64_t v196 = (uint64_t)&v180 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v55);
  uint64_t v213 = (uint64_t)&v180 - v57;
  uint64_t v208 = (uint64_t *)a1[2];
  uint64_t v58 = a1[4];
  uint64_t v206 = a1[3];
  uint64_t v199 = a1;
  uint64_t v220 = v58;
  if (!*(void *)(v58 + 16)
    || (unint64_t v59 = specialized __RawDictionaryStorage.find<A>(_:)(0x696C537475706E69, 0xEA00000000006563), (v60 & 1) == 0))
  {
    uint64_t v67 = Logger.eventSetGenerator.unsafeMutableAddressor();
    uint64_t v69 = v214;
    uint64_t v68 = v215;
    (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v10, v67, v214);
    uint64_t v70 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v72 = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Could not find input slice argument.", v72, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v68 + 8))(v10, v69);
    goto LABEL_9;
  }
  uint64_t v61 = (uint64_t *)(*(void *)(v58 + 56) + 16 * v59);
  uint64_t v63 = *v61;
  uint64_t v62 = v61[1];
  uint64_t v64 = *(void *)(a2 + 16);
  uint64_t v186 = v63;
  if (!v64)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v52, 1, 1, v53);
    swift_bridgeObjectRetain();
LABEL_13:
    outlined destroy of DataSlice?((uint64_t)v52, &demangling cache variable for type metadata for DataSlice?);
    uint64_t v77 = Logger.eventSetGenerator.unsafeMutableAddressor();
    uint64_t v79 = v214;
    uint64_t v78 = v215;
    (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v13, v77, v214);
    swift_bridgeObjectRetain();
    unint64_t v80 = v62;
    uint64_t v81 = Logger.logObject.getter();
    os_log_type_t v82 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v219 = swift_slowAlloc();
      *(_DWORD *)uint64_t v83 = 136315138;
      swift_bridgeObjectRetain();
      double v218 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v186, v80, (uint64_t *)&v219));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "Input slice '%s' does not exist.", v83, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v78 + 8))(v13, v79);
    uint64_t v84 = v216;
    uint64_t v73 = type metadata accessor for EventSet(0);
    int v74 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56);
    uint64_t v75 = v84;
    return v74(v75, 1, 1, v73);
  }
  swift_bridgeObjectRetain_n();
  uint64_t v187 = v62;
  unint64_t v65 = specialized __RawDictionaryStorage.find<A>(_:)(v63, v62);
  if (v66)
  {
    outlined init with copy of DataSlice(*(void *)(a2 + 56) + *(void *)(v54 + 72) * v65, (uint64_t)v52);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v52, 0, 1, v53);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v52, 1, 1, v53);
  }
  uint64_t v76 = v213;
  uint64_t v62 = v187;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53) == 1) {
    goto LABEL_13;
  }
  outlined init with take of DataSlice((uint64_t)v52, v76);
  uint64_t v86 = v76 + *(int *)(v53 + 20);
  uint64_t v88 = v211;
  uint64_t v87 = v212;
  uint64_t v90 = v211 + 16;
  uint64_t v89 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t))(v211 + 16);
  uint64_t v91 = v209;
  v89(v212, v86, v209);
  static EventSetGenerationFunctions.createVolumeChangeEventTable(from:)(v87, (uint64_t)v30);
  uint64_t v92 = v88 + 48;
  uint64_t v185 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v88 + 48);
  if (v185(v30, 1, v91) == 1)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(void, uint64_t))(v88 + 8))(v87, v91);
    outlined destroy of DataSlice(v76);
    outlined destroy of DataSlice?((uint64_t)v30, &demangling cache variable for type metadata for DataFrame?);
LABEL_9:
    uint64_t v73 = type metadata accessor for EventSet(0);
    int v74 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56);
    uint64_t v75 = v216;
    return v74(v75, 1, 1, v73);
  }
  char v182 = (void (*)(char *, void (*)(uint64_t, uint64_t), uint64_t))v89;
  uint64_t v93 = *(void (**)(char *, char *, uint64_t))(v88 + 32);
  uint64_t v183 = v88 + 32;
  uint64_t v184 = v93;
  v93(v210, v30, v91);
  uint64_t v94 = v207;
  uint64_t v181 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56);
  v181(v207, 1, 1, v91);
  if (v208 == (uint64_t *)0xD00000000000001BLL && v206 == 0x8000000100033DD0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v95 = v210;
    static EventSetGenerationFunctions.findModelVolumeChangeEvents(in:)((uint64_t)v26);
    unsigned int v96 = v185(v26, 1, v91);
    uint64_t v97 = v215;
    if (v96 == 1)
    {
      swift_bridgeObjectRelease();
      outlined destroy of DataSlice?(v94, &demangling cache variable for type metadata for DataFrame?);
      char v98 = *(void (**)(char *, uint64_t))(v88 + 8);
      v98(v95, v91);
      v98((char *)v212, v91);
      outlined destroy of DataSlice(v213);
      uint64_t v99 = (uint64_t)v26;
LABEL_59:
      outlined destroy of DataSlice?(v99, &demangling cache variable for type metadata for DataFrame?);
      goto LABEL_9;
    }
    uint64_t v208 = (uint64_t *)(v88 + 48);
    uint64_t v180 = v88 + 56;
    uint64_t v100 = (void (*)(uint64_t, uint64_t))v205;
    v184(v205, v26, v91);
    uint64_t v101 = Logger.eventSetGenerator.unsafeMutableAddressor();
    uint64_t v102 = v203;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v203, v101, v214);
    char v103 = v200;
    char v104 = v100;
    uint64_t v105 = v182;
    v182(v200, v104, v91);
    v105(v204, v212, v91);
    unint64_t v106 = v187;
    swift_bridgeObjectRetain();
    uint64_t v107 = Logger.logObject.getter();
    os_log_type_t v108 = static os_log_type_t.info.getter();
    int v109 = v108;
    uint64_t v206 = v107;
    if (os_log_type_enabled(v107, v108))
    {
      uint64_t v110 = swift_slowAlloc();
      uint64_t v193 = (char *)swift_slowAlloc();
      *(void *)&long long v219 = v193;
      *(_DWORD *)uint64_t v110 = 134218498;
      uint64_t v191 = (char *)(v110 + 4);
      uint64_t v190 = v90;
      unint64_t v111 = v194;
      LODWORD(v192) = v109;
      DataFrame.rows.getter();
      uint64_t v112 = DataFrame.Rows.count.getter();
      uint64_t v195 = *(void *)(v195 + 8);
      ((void (*)(char *, uint64_t))v195)(v111, v201);
      uint64_t v113 = *(void (**)(char *, uint64_t))(v211 + 8);
      v113(v103, v91);
      double v218 = *(double *)&v112;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v110 + 12) = 2080;
      swift_bridgeObjectRetain();
      double v218 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v186, v106, (uint64_t *)&v219));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v110 + 22) = 2048;
      Swift::String v114 = v204;
      DataFrame.rows.getter();
      uint64_t v115 = DataFrame.Rows.count.getter();
      ((void (*)(char *, uint64_t))v195)(v111, v201);
      v113(v114, v91);
      double v218 = *(double *)&v115;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v116 = v206;
      uint64_t v88 = v211;
      _os_log_impl((void *)&_mh_execute_header, v206, (os_log_type_t)v192, "Found %ld system volume change events in data slice set '%s' (%ld samples).", (uint8_t *)v110, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v215 + 8))(v203, v214);
    }
    else
    {
      uint64_t v130 = v103;
      uint64_t v88 = v211;
      v131 = *(void (**)(char *, uint64_t))(v211 + 8);
      v131(v204, v91);
      v131(v130, v91);
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v97 + 8))(v102, v214);
    }
    uint64_t v132 = v207;
    outlined destroy of DataSlice?(v207, &demangling cache variable for type metadata for DataFrame?);
    uint64_t v133 = v132;
    uint64_t v134 = v205;
LABEL_56:
    v184((char *)v133, v134, v91);
    uint64_t v142 = 0;
    goto LABEL_57;
  }
  uint64_t v180 = v88 + 56;
  uint64_t v117 = v215;
  uint64_t v118 = v206;
  if (v208 == (uint64_t *)0xD00000000000001ALL && v206 == 0x8000000100033DF0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    double v119 = 0.0;
    if (!*(void *)(v58 + 16)
      || (unint64_t v120 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001BLL, 0x8000000100033E20),
          (v121 & 1) == 0))
    {
      uint64_t v126 = (uint64_t)v210;
LABEL_50:
      uint64_t v143 = v193;
      uint64_t v144 = v190;
      static EventSetGenerationFunctions.findUserVolumeChangeEvents(in:minimumGapBetweenEvents:)(v126, v190, v119);
      uint64_t v208 = (uint64_t *)v92;
      unsigned int v145 = v185((char *)v144, 1, v91);
      unint64_t v146 = (void (*)(char *, char *, uint64_t))v182;
      unint64_t v147 = v187;
      if (v145 == 1)
      {
        swift_bridgeObjectRelease();
        outlined destroy of DataSlice?(v207, &demangling cache variable for type metadata for DataFrame?);
        uint64_t v148 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
        v148(v126, v91);
        v148((uint64_t)v212, v91);
        outlined destroy of DataSlice(v76);
        uint64_t v99 = v144;
        goto LABEL_59;
      }
      uint64_t v149 = v143;
      uint64_t v150 = v192;
      v184(v192, (char *)v144, v91);
      uint64_t v151 = Logger.eventSetGenerator.unsafeMutableAddressor();
      uint64_t v152 = v215;
      (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v149, v151, v214);
      BOOL v153 = v189;
      v146(v189, v150, v91);
      v146(v191, (char *)v212, v91);
      swift_bridgeObjectRetain();
      uint64_t v154 = Logger.logObject.getter();
      os_log_type_t v155 = static os_log_type_t.info.getter();
      int v156 = v155;
      uint64_t v206 = v154;
      if (os_log_type_enabled(v154, v155))
      {
        uint64_t v157 = swift_slowAlloc();
        uint64_t v205 = (char *)swift_slowAlloc();
        *(void *)&long long v219 = v205;
        *(_DWORD *)uint64_t v157 = 134218498;
        uint64_t v190 = v90;
        uint64_t v158 = v194;
        LODWORD(v204) = v156;
        DataFrame.rows.getter();
        uint64_t v159 = DataFrame.Rows.count.getter();
        uint64_t v203 = *(char **)(v195 + 8);
        ((void (*)(char *, uint64_t))v203)(v158, v201);
        uint64_t v160 = *(void (**)(char *, uint64_t))(v211 + 8);
        v160(v153, v91);
        double v218 = *(double *)&v159;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v157 + 12) = 2080;
        swift_bridgeObjectRetain();
        double v218 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v186, v147, (uint64_t *)&v219));
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v157 + 22) = 2048;
        v161 = v191;
        DataFrame.rows.getter();
        uint64_t v162 = DataFrame.Rows.count.getter();
        ((void (*)(char *, uint64_t))v203)(v158, v201);
        v160(v161, v209);
        double v218 = *(double *)&v162;
        uint64_t v91 = v209;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v163 = v206;
        uint64_t v88 = v211;
        _os_log_impl((void *)&_mh_execute_header, v206, (os_log_type_t)v204, "Found %ld user volume change events in data slice set '%s' (%ld samples).", (uint8_t *)v157, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v215 + 8))(v193, v214);
      }
      else
      {
        uint64_t v164 = v153;
        uint64_t v88 = v211;
        uint64_t v165 = *(void (**)(char *, uint64_t))(v211 + 8);
        v165(v191, v91);
        v165(v164, v91);
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v152 + 8))(v149, v214);
      }
      uint64_t v132 = v207;
      outlined destroy of DataSlice?(v207, &demangling cache variable for type metadata for DataFrame?);
      uint64_t v133 = v132;
      uint64_t v134 = v192;
      goto LABEL_56;
    }
    uint64_t v122 = (uint64_t *)(*(void *)(v58 + 56) + 16 * v120);
    uint64_t v124 = *v122;
    uint64_t v123 = v122[1];
    double v218 = 0.0;
    uint64_t v125 = __chkstk_darwin(v120);
    *(&v180 - 2) = (uint64_t)&v218;
    if ((v123 & 0x1000000000000000) != 0 || !(v123 & 0x2000000000000000 | v124 & 0x1000000000000000))
    {
      swift_bridgeObjectRetain();
      _StringGuts._slowWithCString<A>(_:)();
      swift_bridgeObjectRelease();
      uint64_t v126 = (uint64_t)v210;
      uint64_t v88 = v211;
      uint64_t v76 = v213;
      if ((v217 & 1) == 0) {
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v208 = &v180;
      __chkstk_darwin(v125);
      *(&v180 - 2) = (uint64_t)partial apply for closure #1 in closure #1 in Double.init<A>(_:);
      *(&v180 - 1) = (uint64_t)(&v180 - 4);
      if ((v123 & 0x2000000000000000) != 0)
      {
        *(void *)&long long v219 = v124;
        *((void *)&v219 + 1) = v123 & 0xFFFFFFFFFFFFFFLL;
        uint64_t v126 = (uint64_t)v210;
        uint64_t v88 = v211;
        if (v124 <= 0x20u && ((1 << v124) & 0x100003E01) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v76 = v213;
        }
        else
        {
          swift_bridgeObjectRetain();
          v177 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
          uint64_t v76 = v213;
          if (v177)
          {
            int v178 = *v177;
            swift_bridgeObjectRelease();
            if (v178) {
              goto LABEL_49;
            }
            goto LABEL_38;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
      uint64_t v126 = (uint64_t)v210;
      if ((v124 & 0x1000000000000000) != 0)
      {
        uint64_t v127 = (v123 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v128 = v124 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v127 = _StringObject.sharedUTF8.getter();
        uint64_t v128 = v179;
      }
      swift_bridgeObjectRetain();
      char v129 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5Sb_Tg507_sSRys4f5VGxs5E34_pIgyrzo_ACxsAD_pIegyrzr_lTRSb_TG5SRyAGGSbsAD_pIgyrzo_Tf1cn_n(v127, v128, (void (*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
      swift_bridgeObjectRelease();
      uint64_t v88 = v211;
      uint64_t v76 = v213;
      if ((v129 & 1) == 0) {
        goto LABEL_49;
      }
    }
LABEL_38:
    double v119 = v218;
LABEL_49:
    uint64_t v91 = v209;
    goto LABEL_50;
  }
  swift_bridgeObjectRelease();
  uint64_t v135 = Logger.eventSetGenerator.unsafeMutableAddressor();
  uint64_t v136 = *(void (**)(char *, uint64_t, uint64_t))(v117 + 16);
  uint64_t v137 = v117;
  uint64_t v138 = v188;
  v136(v188, v135, v214);
  long long v219 = *(_OWORD *)v199;
  outlined retain of String((uint64_t)&v219);
  swift_bridgeObjectRetain();
  outlined retain of [String : String]((uint64_t)&v220);
  outlined retain of String((uint64_t)&v219);
  swift_bridgeObjectRetain();
  outlined retain of [String : String]((uint64_t)&v220);
  uint64_t v139 = Logger.logObject.getter();
  os_log_type_t v140 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v139, v140))
  {
    uint64_t v141 = (uint8_t *)swift_slowAlloc();
    double v218 = COERCE_DOUBLE(swift_slowAlloc());
    *(_DWORD *)uint64_t v141 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v217 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v208, (unint64_t)v118, (uint64_t *)&v218);
    uint64_t v91 = v209;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined release of String((uint64_t)&v219);
    swift_bridgeObjectRelease();
    outlined release of [String : String]((uint64_t)&v220);
    outlined release of String((uint64_t)&v219);
    swift_bridgeObjectRelease();
    outlined release of [String : String]((uint64_t)&v220);
    _os_log_impl((void *)&_mh_execute_header, v139, v140, "Cannot find volume change retriever called '%s'.", v141, 0xCu);
    uint64_t v142 = 1;
    swift_arrayDestroy();
    uint64_t v88 = v211;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v215 + 8))(v138, v214);
    uint64_t v132 = v207;
    outlined destroy of DataSlice?(v207, &demangling cache variable for type metadata for DataFrame?);
  }
  else
  {

    outlined release of String((uint64_t)&v219);
    swift_bridgeObjectRelease();
    outlined release of [String : String]((uint64_t)&v220);
    outlined release of String((uint64_t)&v219);
    swift_bridgeObjectRelease();
    outlined release of [String : String]((uint64_t)&v220);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v214);
    uint64_t v132 = v207;
    outlined destroy of DataSlice?(v207, &demangling cache variable for type metadata for DataFrame?);
    uint64_t v142 = 1;
  }
LABEL_57:
  v181(v132, v142, 1, v91);
  uint64_t v166 = v202;
  outlined init with copy of Date?(v132, v202, &demangling cache variable for type metadata for DataFrame?);
  if (v185((char *)v166, 1, v91) == 1)
  {
    outlined destroy of DataSlice?(v132, &demangling cache variable for type metadata for DataFrame?);
    v167 = *(void (**)(char *, uint64_t))(v88 + 8);
    v167(v210, v91);
    v167((char *)v212, v91);
    outlined destroy of DataSlice(v213);
    uint64_t v99 = v166;
    goto LABEL_59;
  }
  uint64_t v168 = v197;
  v184((char *)v197, (char *)v166, v91);
  uint64_t v169 = *v199;
  uint64_t v170 = v199[1];
  uint64_t v171 = (uint64_t)v198;
  v182(v198, v168, v91);
  uint64_t v172 = v213;
  uint64_t v173 = v196;
  outlined init with copy of DataSlice(v213, v196);
  swift_bridgeObjectRetain();
  uint64_t v174 = v216;
  EventSet.init(eventSetName:dataFrame:originDataSlice:)(v169, v170, v171, v173, v216);
  uint64_t v175 = *(void (**)(char *, uint64_t))(v88 + 8);
  v175((char *)v168, v91);
  outlined destroy of DataSlice?(v132, &demangling cache variable for type metadata for DataFrame?);
  v175(v210, v91);
  v175((char *)v212, v91);
  outlined destroy of DataSlice(v172);
  uint64_t v176 = type metadata accessor for EventSet(0);
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v176 - 8) + 56))(v174, 0, 1, v176);
}

uint64_t static EventSetGenerationFunctions.createVolumeChangeEventTable(from:)@<X0>(void (*a1)(uint64_t, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DataFrame.Slice();
  __chkstk_darwin(v4 - 8);
  uint64_t v85 = (char *)v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DataFrame.Rows();
  uint64_t v89 = *(void *)(v6 - 8);
  uint64_t v90 = v6;
  __chkstk_darwin(v6);
  uint64_t v88 = (char *)v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DataFrame();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v87 = (char *)v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v78 - v12;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v91 = (char *)v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v86 = (char *)v78 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v79 = (char *)v78 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  os_log_type_t v82 = (char *)v78 - v23;
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)v78 - v24;
  uint64_t v26 = Logger.eventSetGenerator.unsafeMutableAddressor();
  uint64_t v98 = v15;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v94 = v26;
  uint64_t v95 = v27;
  unsigned int v96 = (uint8_t *)(v15 + 16);
  ((void (*)(char *))v27)(v25);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  uint64_t v97 = a1;
  uint64_t v83 = v28;
  v28((uint64_t)v13, (uint64_t)a1, v8);
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.info.getter();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v92 = v9;
  uint64_t v93 = a2;
  uint64_t v84 = v9 + 16;
  if (v31)
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    unint64_t v80 = (void (*)(char *, uint64_t))v14;
    uint64_t v33 = v8;
    uint64_t v34 = v32;
    *(_DWORD *)uint64_t v32 = 134217984;
    v78[1] = v32 + 4;
    uint64_t v35 = v88;
    DataFrame.rows.getter();
    uint64_t v36 = DataFrame.Rows.count.getter();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v35, v90);
    uint64_t v81 = *(void (**)(char *, uint64_t))(v9 + 8);
    v81(v13, v33);
    v99[0] = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Attempting to create a volume change event table from %ld data samples.", v34, 0xCu);
    uint64_t v8 = v33;
    uint64_t v14 = (uint64_t)v80;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v81 = *(void (**)(char *, uint64_t))(v9 + 8);
    v81(v13, v8);
  }
  uint64_t v37 = v98;

  uint64_t v40 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v39 = v37 + 8;
  uint64_t v38 = v40;
  v40(v25, v14);
  v41._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v101 = DataFrame.indexOfColumn(_:)(v41);
  Swift::Bool is_nil = v101.is_nil;
  swift_bridgeObjectRelease();
  if (is_nil)
  {
    uint64_t v55 = v91;
    v95(v91, v94, v14);
    uint64_t v56 = Logger.logObject.getter();
    os_log_type_t v57 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      v99[0] = swift_slowAlloc();
      unint64_t v80 = v38;
      *(_DWORD *)uint64_t v58 = 136315138;
      uint64_t v59 = AVLogColumns.rawValue.getter(1);
      uint64_t v100 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v60, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "Column '%s' does not exist.", v58, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v80(v91, v14);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v92 + 56))(v93, 1, 1, v8);
    }

    unint64_t v65 = v55;
    uint64_t v66 = v14;
LABEL_20:
    v38(v65, v66);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v92 + 56))(v93, 1, 1, v8);
  }
  uint64_t v43 = v14;
  v44._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(35);
  uint64_t countAndFlagsBits = v44._countAndFlagsBits;
  object = v44._object;
  Swift::Int_optional v102 = DataFrame.indexOfColumn(_:)(v44);
  if (v102.is_nil)
  {
    uint64_t v61 = v86;
    v95(v86, v94, v43);
    swift_bridgeObjectRetain();
    uint64_t v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v98 = v39;
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      v99[0] = swift_slowAlloc();
      unint64_t v80 = v38;
      *(_DWORD *)uint64_t v64 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v100 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Column '%s' does not exist.", v64, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v80(v86, v43);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v92 + 56))(v93, 1, 1, v8);
    }

    swift_bridgeObjectRelease_n();
    unint64_t v65 = v61;
    uint64_t v66 = v43;
    goto LABEL_20;
  }
  unint64_t v80 = v38;
  AVLogColumns.rawValue.getter(1);
  type metadata accessor for Date();
  DataFrame.filter<A>(on:_:_:)();
  swift_bridgeObjectRelease();
  uint64_t v47 = (uint64_t)v87;
  DataFrame.init(_:)();
  if (DataFrameProtocol.isEmpty.getter())
  {
    swift_bridgeObjectRelease();
    uint64_t v48 = v79;
    v95(v79, v94, v43);
    uint64_t v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "No samples available to create volume change event table.", v51, 2u);
      swift_slowDealloc();
    }

    v80(v48, v43);
    uint64_t v52 = v93;
    v83(v93, v47, v8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v92 + 56))(v52, 0, 1, v8);
    uint64_t v53 = v47;
    uint64_t v54 = v8;
  }
  else
  {
    uint64_t v98 = v8;
    uint64_t v67 = (uint64_t)v88;
    DataFrame.rows.getter();
    swift_bridgeObjectRetain();
    specialized Sequence.forEach(_:)(v67, countAndFlagsBits, (uint64_t)object, v47);
    swift_bridgeObjectRelease();
    uint64_t v68 = v90;
    uint64_t v97 = *(void (**)(uint64_t, uint64_t))(v89 + 8);
    v97(v67, v90);
    swift_bridgeObjectRelease();
    uint64_t v69 = v43;
    v95(v82, v94, v43);
    uint64_t v70 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = v68;
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v73 = 134217984;
      unsigned int v96 = v73 + 4;
      swift_beginAccess();
      DataFrame.rows.getter();
      swift_endAccess();
      uint64_t v74 = DataFrame.Rows.count.getter();
      v97(v67, v72);
      v99[0] = v74;
      uint64_t v69 = v43;
      uint64_t v47 = (uint64_t)v87;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Found %ld volume change events.", v73, 0xCu);
      swift_slowDealloc();
    }

    v80(v82, v69);
    swift_beginAccess();
    uint64_t v75 = v93;
    uint64_t v76 = v98;
    v83(v93, v47, v98);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v92 + 56))(v75, 0, 1, v76);
    uint64_t v53 = v47;
    uint64_t v54 = v76;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v81)(v53, v54);
}

uint64_t static EventSetGenerationFunctions.findModelVolumeChangeEvents(in:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DataFrame.Slice();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v22 - v10;
  v12._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(36);
  uint64_t countAndFlagsBits = v12._countAndFlagsBits;
  object = v12._object;
  Swift::Int_optional v26 = DataFrame.indexOfColumn(_:)(v12);
  if (v26.is_nil)
  {
    uint64_t v17 = Logger.eventSetGenerator.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v17, v23);
    swift_bridgeObjectRetain();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      v22[1] = v20 + 4;
      swift_bridgeObjectRetain();
      uint64_t v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Data frame does not contain '%s' column.", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v23);
    uint64_t v21 = type metadata accessor for DataFrame();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 1, 1, v21);
  }
  else
  {
    DataFrame.filter<A>(on:_:_:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    DataFrame.init(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    uint64_t v15 = type metadata accessor for DataFrame();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a1, 0, 1, v15);
  }
}

uint64_t static EventSetGenerationFunctions.findUserVolumeChangeEvents(in:minimumGapBetweenEvents:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void (***)(char *, uint64_t, uint64_t))(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v75 = (char *)v65 - v12;
  __chkstk_darwin(v11);
  uint64_t v72 = (char *)v65 - v13;
  uint64_t v68 = type metadata accessor for DataFrame.Rows();
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v66 = (char *)v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v15 - 8);
  uint64_t v73 = (uint64_t)v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DataFrame();
  uint64_t v77 = *(void *)(v17 - 8);
  uint64_t v78 = v17;
  __chkstk_darwin(v17);
  uint64_t v74 = (char *)v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DataFrame.Slice();
  uint64_t v69 = *(void *)(v19 - 8);
  uint64_t v70 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  v65[2] = (char *)v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  os_log_type_t v71 = (char *)v65 - v22;
  uint64_t v23 = type metadata accessor for AnyColumn();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  Swift::Int_optional v26 = (char *)v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(36);
  uint64_t countAndFlagsBits = v27._countAndFlagsBits;
  object = v27._object;
  Swift::Int_optional v83 = DataFrame.indexOfColumn(_:)(v27);
  uint64_t v79 = a2;
  if (v83.is_nil)
  {
    uint64_t v34 = Logger.eventSetGenerator.unsafeMutableAddressor();
    v7[2](v10, v34, v6);
    swift_bridgeObjectRetain();
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v82[0] = swift_slowAlloc();
      uint64_t v75 = (char *)v7;
      uint64_t v76 = v6;
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v81 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, v82);
      uint64_t v38 = v79;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Data frame does not contain '%s' column.", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*((void (**)(char *, uint64_t))v75 + 1))(v10, v76);
      uint64_t v39 = v78;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v7[1])(v10, v6);
      uint64_t v39 = v78;
      uint64_t v38 = v79;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v77 + 56))(v38, 1, 1, v39);
  }
  uint64_t v76 = v6;
  v30._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v84 = DataFrame.indexOfColumn(_:)(v30);
  if (v84.is_nil)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    swift_bridgeObjectRelease();
    uint64_t v40 = v79;
    uint64_t v41 = v76;
    uint64_t v42 = Logger.eventSetGenerator.unsafeMutableAddressor();
    uint64_t v43 = v75;
    v7[2](v75, v42, v41);
    Swift::String v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    BOOL v46 = os_log_type_enabled(v44, v45);
    uint64_t v47 = v78;
    if (v46)
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Data frame does not contain date column.", v48, 2u);
      swift_slowDealloc();
    }

    ((void (*)(char *, uint64_t))v7[1])(v43, v41);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v77 + 56))(v40, 1, 1, v47);
  }
  unint64_t value = v84.value;
  v65[1] = a1;
  uint64_t result = DataFrame.columns.getter();
  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (value >= *(void *)(result + 16))
  {
LABEL_20:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v24 + 16))(v26, result+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * value, v23);
  swift_bridgeObjectRelease();
  uint64_t v33 = AnyColumn.wrappedElementType.getter();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  swift_bridgeObjectRelease();
  if (v33 != type metadata accessor for Date()) {
    goto LABEL_10;
  }
  uint64_t v49 = v71;
  DataFrame.filter<A>(on:_:_:)();
  swift_bridgeObjectRelease();
  AVLogColumns.rawValue.getter(1);
  DataFrame.filter<A>(on:_:_:)();
  swift_bridgeObjectRelease();
  uint64_t v50 = (uint64_t)v74;
  DataFrame.init(_:)();
  uint64_t v51 = v73;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v73, 1, 1, v33);
  uint64_t v52 = (uint64_t)v66;
  DataFrame.Slice.rows.getter();
  specialized Sequence.forEach(_:)(v52, v51, v50, a3);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v52, v68);
  uint64_t v53 = Logger.eventSetGenerator.unsafeMutableAddressor();
  uint64_t v54 = v7;
  uint64_t v55 = v72;
  uint64_t v56 = v76;
  v7[2](v72, v53, v76);
  os_log_type_t v57 = Logger.logObject.getter();
  os_log_type_t v58 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    v82[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136315138;
    swift_beginAccess();
    _s11TabularData0B5FrameV4RowsVAESTAAWlTm_0(&lazy protocol witness table cache variable for type DataFrame and conformance DataFrame, (void (*)(uint64_t))&type metadata accessor for DataFrame);
    uint64_t v60 = v78;
    uint64_t v61 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v80 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v62, v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v57, v58, "INFO: %s", v59, 0xCu);
    swift_arrayDestroy();
    uint64_t v50 = (uint64_t)v74;
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v54[1])(v72, v56);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v70);
  }
  else
  {

    ((void (*)(char *, uint64_t))v7[1])(v55, v56);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v49, v70);
    uint64_t v60 = v78;
  }
  uint64_t v63 = v79;
  swift_beginAccess();
  uint64_t v64 = v77;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16))(v63, v50, v60);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v64 + 56))(v63, 0, 1, v60);
  outlined destroy of DataSlice?(v73, &demangling cache variable for type metadata for Date?);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 8))(v50, v60);
}

uint64_t closure #1 in static EventSetGenerationFunctions.createVolumeChangeEventTable(from:)()
{
  return 0;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v37 = a3;
  uint64_t v36 = a2;
  uint64_t v6 = type metadata accessor for DataFrame.Row();
  BOOL v31 = *(void (***)(char *, uint64_t))(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v35 = (char *)&v29 - v10;
  uint64_t v11 = type metadata accessor for DataFrame.Rows();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v33 = v12 + 16;
  v32(v14, a1, v11);
  _s11TabularData0B5FrameV4RowsVAESTAAWlTm_0(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v34 = v14;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v19 = &v18[*(int *)(v16 + 44)];
  _s11TabularData0B5FrameV4RowsVAESTAAWlTm_0(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v20 = *(void *)v19;
  dispatch thunk of Collection.endIndex.getter();
  if (v20 != v39[0])
  {
    uint64_t v29 = (void (**)(char *, uint64_t))(v12 + 8);
    Swift::String v30 = (void (**)(char *))(v31 + 2);
    uint64_t v21 = (void (**)(char *, char *, uint64_t))(v31 + 4);
    ++v31;
    while (1)
    {
      uint64_t v22 = (void (*)(uint64_t *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v23 = v35;
      (*v30)(v35);
      v22(v39, 0);
      uint64_t v24 = v34;
      v32(v34, (uint64_t)v18, v11);
      dispatch thunk of Collection.formIndex(after:)();
      (*v29)(v24, v11);
      (*v21)(v9, v23, v6);
      closure #3 in static EventSetGenerationFunctions.findUserVolumeChangeEvents(in:minimumGapBetweenEvents:)((uint64_t)v9, v36, v37, a4);
      if (v38) {
        break;
      }
      (*v31)(v9, v6);
      uint64_t v25 = v6;
      uint64_t v26 = *(void *)v19;
      dispatch thunk of Collection.endIndex.getter();
      BOOL v27 = v26 == v39[0];
      uint64_t v6 = v25;
      if (v27) {
        return outlined destroy of DataSlice?((uint64_t)v18, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
      }
    }
    (*v31)(v9, v6);
  }
  return outlined destroy of DataSlice?((uint64_t)v18, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
}

BOOL closure #1 in static EventSetGenerationFunctions.findModelVolumeChangeEvents(in:)(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 8) & 1) == 0 && *(void *)a1 == 0;
}

BOOL closure #1 in static EventSetGenerationFunctions.findUserVolumeChangeEvents(in:minimumGapBetweenEvents:)(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 8) & 1) == 0 && *(void *)a1 == 1;
}

uint64_t closure #3 in static EventSetGenerationFunctions.findUserVolumeChangeEvents(in:minimumGapBetweenEvents:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - v12;
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v30 - v19;
  AVLogColumns.rawValue.getter(1);
  uint64_t v35 = a1;
  DataFrame.Row.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v37)
  {
    outlined destroy of DataSlice?((uint64_t)v36, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    return outlined destroy of DataSlice?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  uint64_t v33 = a3;
  int v21 = swift_dynamicCast();
  uint64_t v34 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
  v34(v13, v21 ^ 1u, 1, v14);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v22(v13, 1, v14) == 1) {
    return outlined destroy of DataSlice?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  uint64_t v23 = *(void (**)(void))(v15 + 32);
  uint64_t v32 = v20;
  uint64_t v24 = v23;
  v23();
  uint64_t v31 = a2;
  outlined init with copy of Date?(a2, (uint64_t)v11, &demangling cache variable for type metadata for Date?);
  if (v22(v11, 1, v14) == 1)
  {
    outlined destroy of DataSlice?((uint64_t)v11, &demangling cache variable for type metadata for Date?);
    uint64_t v25 = v32;
LABEL_8:
    DataFrame.append(row:)();
    goto LABEL_9;
  }
  ((void (*)(char *, char *, uint64_t))v24)(v18, v11, v14);
  uint64_t v25 = v32;
  Date.timeIntervalSince(_:)();
  double v28 = v27;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v28 >= a4) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v29 = v31;
  outlined destroy of DataSlice?(v31, &demangling cache variable for type metadata for Date?);
  ((void (*)(uint64_t, char *, uint64_t))v24)(v29, v25, v14);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v34)(v29, 0, 1, v14);
}

uint64_t outlined init with take of DataSlice(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DataSlice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of DataSlice(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DataSlice(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of DataSlice(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DataSlice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v26[1] = a4;
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for DataFrame.Row();
  double v27 = *(char **)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v34 = (char *)v26 - v9;
  uint64_t v10 = type metadata accessor for DataFrame.Rows();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v32 = v11 + 16;
  v31(v13, a1, v10);
  _s11TabularData0B5FrameV4RowsVAESTAAWlTm_0(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v33 = v13;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v18 = &v17[*(int *)(v15 + 44)];
  _s11TabularData0B5FrameV4RowsVAESTAAWlTm_0(&lazy protocol witness table cache variable for type DataFrame.Rows and conformance DataFrame.Rows, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  uint64_t v19 = *(void *)v18;
  dispatch thunk of Collection.endIndex.getter();
  if (v19 != v37[0])
  {
    uint64_t v29 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v30 = (void (**)(char *))(v27 + 16);
    double v28 = (void (**)(char *, char *, uint64_t))(v27 + 32);
    int v21 = (void (**)(char *, uint64_t))(v27 + 8);
    double v27 = (char *)&type metadata for Any + 8;
    do
    {
      uint64_t v23 = (void (*)(void *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v24 = v34;
      (*v30)(v34);
      v23(v37, 0);
      uint64_t v25 = v33;
      v31(v33, (uint64_t)v17, v10);
      dispatch thunk of Collection.formIndex(after:)();
      (*v29)(v25, v10);
      (*v28)(v8, v24, v5);
      DataFrame.Row.subscript.getter();
      if (v37[3])
      {
        if ((swift_dynamicCast() & 1) != 0 && v37[5]) {
          DataFrame.append(row:)();
        }
      }
      else
      {
        outlined destroy of DataSlice?((uint64_t)v37, &demangling cache variable for type metadata for Any?);
      }
      (*v21)(v8, v5);
      uint64_t v22 = *(void *)v18;
      dispatch thunk of Collection.endIndex.getter();
    }
    while (v22 != v37[0]);
  }
  return outlined destroy of DataSlice?((uint64_t)v17, &demangling cache variable for type metadata for IndexingIterator<DataFrame.Rows>);
}

unint64_t lazy protocol witness table accessor for type ExpectedEventSetGenerationFunctions and conformance ExpectedEventSetGenerationFunctions()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpectedEventSetGenerationFunctions and conformance ExpectedEventSetGenerationFunctions;
  if (!lazy protocol witness table cache variable for type ExpectedEventSetGenerationFunctions and conformance ExpectedEventSetGenerationFunctions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpectedEventSetGenerationFunctions and conformance ExpectedEventSetGenerationFunctions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpectedEventSetGenerationArguments and conformance ExpectedEventSetGenerationArguments()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpectedEventSetGenerationArguments and conformance ExpectedEventSetGenerationArguments;
  if (!lazy protocol witness table cache variable for type ExpectedEventSetGenerationArguments and conformance ExpectedEventSetGenerationArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpectedEventSetGenerationArguments and conformance ExpectedEventSetGenerationArguments);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpectedEventSetGenerationFunctions()
{
  return &type metadata for ExpectedEventSetGenerationFunctions;
}

unsigned char *storeEnumTagSinglePayload for ExpectedEventSetGenerationFunctions(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001CC10);
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

ValueMetadata *type metadata accessor for ExpectedEventSetGenerationArguments()
{
  return &type metadata for ExpectedEventSetGenerationArguments;
}

ValueMetadata *type metadata accessor for EventSetGenerationFunctions()
{
  return &type metadata for EventSetGenerationFunctions;
}

uint64_t _s11TabularData0B5FrameV4RowsVAESTAAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

void one-time initialization function for shared()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100032BB0;
  *(void *)(inited + 32) = 0xD000000000000016;
  *(void *)(inited + 40) = 0x8000000100033E70;
  uint64_t v1 = type metadata accessor for Date();
  *(void *)(inited + 72) = v1;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
  Date.init()();
  *(void *)(inited + 80) = 0xD000000000000024;
  *(void *)(inited + 88) = 0x8000000100033E90;
  *(void *)(inited + 120) = v1;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 96));
  Date.init()();
  *(void *)(inited + 128) = 0xD000000000000023;
  *(void *)(inited + 136) = 0x8000000100033EC0;
  *(void *)(inited + 168) = v1;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 144));
  Date.init()();
  unint64_t v2 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v3 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v3 initWithSuiteName:v4];

  if (!v5) {
    id v5 = [self standardUserDefaults];
  }
  id v6 = v5;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v6 registerDefaults:isa];

  static UserDefaultsManager.shared = (uint64_t)v6;
  *(void *)algn_10003F128 = 0xD000000000000029;
  qword_10003F130 = 0x8000000100033E40;
  unk_10003F138 = v2;
}

uint64_t *UserDefaultsManager.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static UserDefaultsManager.shared;
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

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  id v3 = (void *)v2;
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
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, NSObject>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  id v3 = *(void *)(a1 + 16);
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
    uint64_t v8 = v7;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
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
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  void v25[2];

  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
  id v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CSVType>);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  char v10 = v6 + 64;
  uint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  BOOL v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of Date?(v12, (uint64_t)v5, &demangling cache variable for type metadata for (String, CSVType));
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(*v5, v15);
    if (v17) {
      break;
    }
    uint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    int v21 = type metadata accessor for CSVType();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    uint64_t v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

Swift::Void __swiftcall UserDefaultsManager.saveEvaluationDate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  NSString v7 = String._bridgeToObjectiveC()();
  [v1 setObject:isa forKey:v7];
}

uint64_t UserDefaultsManager.previousEvaluationDate()@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [a1 objectForKey:v4];

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  outlined init with take of Any?((uint64_t)v10, (uint64_t)v11);
  if (v12)
  {
    uint64_t v6 = type metadata accessor for Date();
    int v7 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a2, v7 ^ 1u, 1, v6);
  }
  else
  {
    outlined destroy of Any?((uint64_t)v11);
    uint64_t v9 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  }
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for UserDefaultsManager(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UserDefaultsManager(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserDefaultsManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for UserDefaultsManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDefaultsManager(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserDefaultsManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDefaultsManager()
{
  return &type metadata for UserDefaultsManager;
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
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

uint64_t protocol witness for Error._domain.getter in conformance PluginAssetError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance PluginAssetError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance PluginAssetError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance PluginAssetError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void one-time initialization function for recipeKey()
{
  static Plugin.recipeKey = 0x657069636572;
  unk_10003F160 = 0xE600000000000000;
}

void one-time initialization function for attachmentsKey()
{
  static Plugin.attachmentsKey = 0x736C65646F6DLL;
  unk_10003F170 = 0xE600000000000000;
}

unint64_t variable initialization expression of Plugin.userMetricEventName()
{
  return 0xD00000000000002DLL;
}

unint64_t Plugin.targetingKeyValuePairs(forKeys:)()
{
  return specialized Plugin.targetingKeyValuePairs(forKeys:)();
}

id Plugin.perform(_:)(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  unint64_t v149 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Metric(0);
  unint64_t v148 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v154 = (uint64_t *)((char *)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v130 = type metadata accessor for DataFrame();
  uint64_t v8 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  uint64_t v137 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v157 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v126 - v13;
  id v15 = [a1 triClient];
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v3, (uint64_t)logger);
  id v17 = v15;
  uint64_t v152 = v16;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  v131 = v14;
  uint64_t v132 = v1;
  uint64_t v129 = v8;
  uint64_t v136 = v3;
  uint64_t v138 = v5;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    p_Class isa = (void *)swift_slowAlloc();
    uint64_t v158 = swift_slowAlloc();
    v161[0] = v158;
    *(_DWORD *)uint64_t v21 = 138412546;
    uint64_t v163 = v17;
    id v22 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *p_Class isa = v17;

    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v163 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000025, 0x8000000100033F20, v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Running MLRTask with trialClient: %@ and trialNamespace: %s", (uint8_t *)v21, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v23 = (unint64_t)v17;
  NSString v24 = String._bridgeToObjectiveC()();
  id v25 = [v17 backgroundMLTaskIdentifiersWithNamespaceName:v24];

  if (!v25)
  {
    uint64_t v35 = Logger.logObject.getter();
    uint64_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, (os_log_type_t)v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v36, "Didn't find any trialIds", v37, 2u);
      swift_slowDealloc();
    }

    id v38 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];
    return v38;
  }
  uint64_t v158 = (uint64_t)"ouseAdaptiveVolume.UserMetric";
  id v26 = v25;
  double v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.info.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  unint64_t v150 = v23;
  if (v29)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    p_Class isa = (void *)swift_slowAlloc();
    v161[0] = (uint64_t)p_isa;
    os_log_type_t v155 = v30;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v153 = (uint64_t)(v30 + 4);
    id v31 = [v26 bmltTaskId];
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v34 = v33;

    uint64_t v163 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v34, v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Trial Task Id: %s", v155, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v39 = [v26 treatmentId];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v153 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v42 = v41;
  }
  else
  {
    uint64_t v42 = (uint8_t *)0xE700000000000000;
    uint64_t v153 = 0x74657320746F4ELL;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v43, v44))
  {
    os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    p_Class isa = v26;
    v161[0] = v46;
    *(_DWORD *)os_log_type_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v163 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v153, (unint64_t)v42, v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Trial Treatment Id: %s", v45, 0xCu);
    swift_arrayDestroy();
    id v26 = p_isa;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v47 = v26;
  uint64_t v48 = Logger.logObject.getter();
  os_log_type_t v49 = static os_log_type_t.info.getter();
  BOOL v50 = os_log_type_enabled(v48, v49);
  os_log_type_t v155 = v42;
  p_Class isa = &v47->isa;
  uint64_t v51 = (void *)v150;
  if (v50)
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 67109120;
    LODWORD(v161[0]) = [p_isa deploymentId];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Trial Deployment Id: %d", v52, 8u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v48 = v47;
  }

  id v53 = v51;
  id v54 = (id)v151;
  id v55 = v53;
  uint64_t v56 = v54;
  os_log_type_t v57 = Logger.logObject.getter();
  os_log_type_t v58 = static os_log_type_t.info.getter();
  BOOL v59 = os_log_type_enabled(v57, v58);
  *(void *)&long long v151 = v56;
  if (v59)
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    v161[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v60 = 136315138;
    unint64_t v150 = (unint64_t)(v60 + 4);
    uint64_t v61 = (*(uint64_t (**)(id, unint64_t, unint64_t))((swift_isaMask & *v56) + 0x68))(v55, 0xD000000000000025, v158 | 0x8000000000000000);
    uint64_t v163 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v62, v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v57, v58, "Attachment path: %s", v60, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v63 = v130;
  uint64_t v64 = v138;
  uint64_t v65 = (uint64_t)v157;
  type metadata accessor for AVLogReader();
  uint64_t v66 = ManualVolumeChangeFunctions.__allocating_init()();
  uint64_t v163 = &_swiftEmptyDictionarySingleton;
  uint64_t v67 = *(void (**)(void))(*(void *)v66 + 80);
  uint64_t v68 = (uint64_t)v131;
  uint64_t v128 = v66;
  v67();
  uint64_t v69 = v55;
  id v70 = specialized Plugin.getRecipePath(_:_:)(v55);
  unint64_t v72 = v71;
  outlined init with copy of Date?(v68, v65, &demangling cache variable for type metadata for DataFrame?);
  uint64_t v73 = v65;
  uint64_t v74 = v129;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v129 + 48))(v73, 1, v63) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of DataFrame?(v73);
LABEL_37:
    uint64_t v115 = Logger.logObject.getter();
    os_log_type_t v116 = static os_log_type_t.error.getter();
    BOOL v117 = os_log_type_enabled(v115, v116);
    id v118 = p_isa;
    if (v117)
    {
      double v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v119 = 0;
      _os_log_impl((void *)&_mh_execute_header, v115, v116, "No data or no job description available to run evaluation.", v119, 2u);
      swift_slowDealloc();
    }

LABEL_44:
    id v38 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

    swift_release();
    outlined destroy of DataFrame?(v68);
    swift_bridgeObjectRelease();
    return v38;
  }
  uint64_t v127 = v69;
  uint64_t v75 = (uint64_t)v137;
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v137, v73, v63);
  if (!v72)
  {
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v75, v63);
    swift_bridgeObjectRelease();
    uint64_t v69 = v127;
    goto LABEL_37;
  }
  uint64_t v76 = specialized Plugin.runEvaluationJob(dataFrame:evaluationJobPath:)(v75, (uint64_t)v70, v72);
  swift_bridgeObjectRelease();
  id v77 = (id)*UserDefaultsManager.shared.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  UserDefaultsManager.saveEvaluationDate()();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v78 = (char *)v76[2];
  uint64_t v79 = (char *)v75;
  if (!v78)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v120 = Logger.logObject.getter();
    os_log_type_t v121 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v120, v121))
    {
      uint64_t v122 = (uint8_t *)swift_slowAlloc();
      uint64_t v160 = swift_slowAlloc();
      *(_DWORD *)uint64_t v122 = 136315138;
      uint64_t v158 = (uint64_t)(v122 + 4);
      swift_beginAccess();
      type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for NSNumber);
      swift_bridgeObjectRetain();
      uint64_t v123 = Dictionary.description.getter();
      unint64_t v125 = v124;
      swift_bridgeObjectRelease();
      uint64_t v159 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v123, v125, &v160);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v120, v121, "Metrics to report: %s", v122, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v129 + 8))(v137, v130);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v129 + 8))(v79, v130);
    }
    uint64_t v68 = (uint64_t)v131;
    id v118 = p_isa;
    uint64_t v69 = v127;
    goto LABEL_44;
  }
  uint64_t v146 = v151 + OBJC_IVAR___LighthouseAVPlugin_userMetricEventName;
  unint64_t v80 = (*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80);
  uint64_t v126 = v76;
  uint64_t v81 = (uint64_t)v76 + v80;
  uint64_t v144 = (void (**)(char *, uint64_t))(v149 + 8);
  unsigned int v145 = (void (**)(char *, uint64_t, uint64_t))(v149 + 16);
  uint64_t v135 = v161;
  uint64_t v142 = *(void *)(v148 + 72);
  uint64_t v143 = v162;
  *((void *)&v82 + 1) = 14;
  long long v151 = xmmword_100032FC0;
  unint64_t v149 = 0x8000000100033F50;
  unint64_t v150 = 0xD000000000000012;
  unint64_t v147 = 0x8000000100033F70;
  unint64_t v148 = 0xD000000000000011;
  unint64_t v140 = 0x8000000100033FB0;
  unint64_t v141 = 0x8000000100033F90;
  *(void *)&long long v82 = 136315138;
  long long v134 = v82;
  uint64_t v133 = (char *)&type metadata for Any + 8;
  uint64_t v83 = (uint64_t)v154;
  uint64_t v84 = v136;
  while (1)
  {
    uint64_t v158 = v81;
    outlined init with copy of Metric(v81, v83);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, NSObject)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v151;
    *(void *)(inited + 32) = 0x614E63697274656DLL;
    *(void *)(inited + 40) = 0xEA0000000000656DLL;
    swift_bridgeObjectRetain();
    NSString v97 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    *(void *)(inited + 48) = v97;
    *(void *)(inited + 56) = 0x615663697274656DLL;
    *(void *)(inited + 64) = 0xEB0000000065756CLL;
    v98.super.super.Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    unint64_t v99 = v150;
    *(NSNumber *)(inited + 72) = v98;
    *(void *)(inited + 80) = v99;
    *(void *)(inited + 88) = v149;
    swift_bridgeObjectRetain();
    NSString v100 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    *(void *)(inited + 96) = v100;
    *(void *)(inited + 104) = 0x5573656C706D6173;
    *(void *)(inited + 112) = 0xEB00000000646573;
    Metric.samplesUsed()();
    v101.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
    unint64_t v102 = v147;
    unint64_t v103 = v148;
    *(NSNumber *)(inited + 120) = v101;
    *(void *)(inited + 128) = v103;
    *(void *)(inited + 136) = v102;
    id v104 = p_isa;
    id result = objc_msgSend(p_isa, "bmltTaskId", v126);
    if (!result) {
      break;
    }
    uint64_t v157 = v78;
    *(void *)(inited + 144) = result;
    *(void *)(inited + 152) = 0xD000000000000010;
    *(void *)(inited + 160) = v141;
    *(void *)(inited + 168) = String._bridgeToObjectiveC()();
    *(void *)(inited + 176) = v103;
    *(void *)(inited + 184) = v140;
    LODWORD(v161[0]) = [v104 deploymentId];
    dispatch thunk of CustomStringConvertible.description.getter();
    NSString v106 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    *(void *)(inited + 192) = v106;
    unint64_t v107 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    uint64_t v108 = Logger.metrics.unsafeMutableAddressor();
    (*v145)(v64, v108, v84);
    swift_bridgeObjectRetain_n();
    int v109 = Logger.logObject.getter();
    os_log_type_t v110 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v109, v110))
    {
      unint64_t v111 = (uint8_t *)swift_slowAlloc();
      v161[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v111 = v134;
      uint64_t v139 = v111 + 4;
      type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for NSObject);
      swift_bridgeObjectRetain();
      uint64_t v112 = Dictionary.description.getter();
      unint64_t v114 = v113;
      swift_bridgeObjectRelease();
      uint64_t v160 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v112, v114, v161);
      uint64_t v64 = v138;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v79 = v137;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v109, v110, "Submitting %s.", v111, 0xCu);
      swift_arrayDestroy();
      uint64_t v84 = v136;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*v144)(v64, v84);
    NSString v85 = String._bridgeToObjectiveC()();
    uint64_t v86 = swift_allocObject();
    *(void *)(v86 + 16) = v107;
    v162[2] = partial apply for closure #1 in Plugin.perform(_:);
    v162[3] = v86;
    v161[0] = (uint64_t)_NSConcreteStackBlock;
    v161[1] = 1107296256;
    v162[0] = thunk for @escaping @callee_guaranteed () -> (@owned [String : NSObject]?);
    v162[1] = &block_descriptor;
    uint64_t v87 = _Block_copy(v161);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v87);

    uint64_t v83 = (uint64_t)v154;
    uint64_t v88 = *v154;
    uint64_t v89 = v154[1];
    swift_bridgeObjectRetain();
    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    uint64_t v91 = (uint64_t)v163;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v161[0] = v91;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)isa, v88, v89, isUniquelyReferenced_nonNull_native);
    uint64_t v93 = v161[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Metric.samplesUsed()();
    Class v94 = Int._bridgeToObjectiveC()().super.super.isa;
    char v95 = swift_isUniquelyReferenced_nonNull_native();
    v161[0] = v93;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)v94, 0x5573656C706D6173, 0xEB00000000646573, v95);
    uint64_t v163 = (void *)v161[0];
    swift_bridgeObjectRelease();
    outlined destroy of Metric(v83);
    uint64_t v81 = v158 + v142;
    uint64_t v78 = v157 - 1;
    if (v157 == (char *)1) {
      goto LABEL_40;
    }
  }
  __break(1u);
  return result;
}

id Plugin.getAttachmentsPath(_:_:)(void *a1)
{
  if (one-time initialization token for attachmentsKey != -1) {
    swift_once();
  }
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a1 levelForFactor:v2 withNamespaceName:v3];

  if (!v4) {
    goto LABEL_7;
  }
  id result = [v4 directoryValue];
  if (result)
  {
    uint64_t v6 = result;
    id v7 = [result path];

    if (v7)
    {
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      return (id)v8;
    }
LABEL_7:

    return 0;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall Plugin.stop()()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    NSString v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Stopping task not implemented", v2, 2u);
    swift_slowDealloc();
  }
}

id Plugin.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id Plugin.init()()
{
  id v1 = &v0[OBJC_IVAR___LighthouseAVPlugin_userMetricEventName];
  *(void *)id v1 = 0xD00000000000002DLL;
  *((void *)v1 + 1) = 0x8000000100033EF0;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v3, "init");
}

id Plugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  objc_super v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, NSNumber>);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          objc_super v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
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
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  objc_super v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *objc_super v3 = v7;
  return result;
}

void specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  id v22 = (uint64_t *)(v18[6] + 16 * v12);
  *id v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id specialized _NativeDictionary.copy()()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, NSNumber>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

unint64_t specialized Plugin.targetingKeyValuePairs(forKeys:)()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  id v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v4 = Array.description.getter();
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v6, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Custom Targeting: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100032BA0;
  *(void *)(inited + 32) = 0x6D616E5F3179656BLL;
  *(void *)(inited + 40) = 0xE900000000000065;
  *(void *)(inited + 48) = 0x3165756C6176;
  *(void *)(inited + 56) = 0xE600000000000000;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x6D616E5F3279656BLL;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 88) = 0xE900000000000065;
  *(void *)(inited + 96) = 0x3265756C6176;
  *(void *)(inited + 104) = 0xE600000000000000;
  return specialized Dictionary.init(dictionaryLiteral:)(inited);
}

id specialized Plugin.getRecipePath(_:_:)(void *a1)
{
  if (one-time initialization token for recipeKey != -1) {
    swift_once();
  }
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a1 levelForFactor:v2 withNamespaceName:v3];

  if (!v4) {
    return 0;
  }
  id result = [v4 fileValue];
  if (result)
  {
    unint64_t v6 = result;
    id v7 = [result path];

    if (v7)
    {
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      return (id)v8;
    }

    return 0;
  }
  __break(1u);
  return result;
}

uint64_t outlined destroy of DataFrame?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *specialized Plugin.runEvaluationJob(dataFrame:evaluationJobPath:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DataFrame();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static EvaluationJobHelpers.evaluationJobFromJson(path:)();
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    uint64_t v18 = v15;
    type metadata accessor for EvaluationJobRunner(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
    uint64_t v19 = EvaluationJobRunner.__allocating_init(dataFrame:)((uint64_t)v12);
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*v19 + 192))(v16, v17, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    uint64_t v21 = Logger.evaluationJobRunner.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v8, v21, v27);
    swift_bridgeObjectRetain_n();
    int64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      int64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)int64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Could not load evaluation job from %s.", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v27);
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v20;
}

uint64_t outlined init with copy of Metric(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Metric(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000200AC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t partial apply for closure #1 in Plugin.perform(_:)()
{
  return swift_bridgeObjectRetain();
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

uint64_t outlined destroy of Metric(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Metric(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for NSNumber(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for Plugin()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type PluginAssetError and conformance PluginAssetError()
{
  unint64_t result = lazy protocol witness table cache variable for type PluginAssetError and conformance PluginAssetError;
  if (!lazy protocol witness table cache variable for type PluginAssetError and conformance PluginAssetError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PluginAssetError and conformance PluginAssetError);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PluginAssetError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000202E4);
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

ValueMetadata *type metadata accessor for PluginAssetError()
{
  return &type metadata for PluginAssetError;
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

uint64_t EvaluationJobRunner.dataSlices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationJobRunner.dataSlices.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationJobRunner.dataSlices.modify())()
{
  return EvaluationJobRunner.dataSlices.modify;
}

uint64_t EvaluationJobRunner.eventSets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationJobRunner.eventSets.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationJobRunner.eventSets.modify())()
{
  return EvaluationJobRunner.eventSets.modify;
}

uint64_t EvaluationJobRunner.metrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationJobRunner.metrics.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationJobRunner.metrics.modify())()
{
  return EvaluationJobRunner.eventSets.modify;
}

void *EvaluationJobRunner.__allocating_init(dataFrame:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  v2[2] = &_swiftEmptyDictionarySingleton;
  v2[3] = &_swiftEmptyDictionarySingleton;
  v2[4] = &_swiftEmptyArrayStorage;
  uint64_t v3 = (char *)v2 + OBJC_IVAR____TtC18LighthouseAVPlugin19EvaluationJobRunner_fullDataFrame;
  uint64_t v4 = type metadata accessor for DataFrame();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t EvaluationJobRunner.run(evaluationJob:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v150 = a3;
  uint64_t v151 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EventSet?);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v144 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v161 = (uint64_t)&v144 - v10;
  __chkstk_darwin(v9);
  unint64_t v12 = (uint64_t (*)(void))((char *)&v144 - v11);
  uint64_t v171 = type metadata accessor for EventSet(0);
  uint64_t v159 = *(void *)(v171 - 8);
  uint64_t v13 = __chkstk_darwin(v171);
  uint64_t v160 = (uint64_t)&v144 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v167 = (uint64_t)&v144 - v15;
  uint64_t v174 = type metadata accessor for DataSlice(0);
  uint64_t v163 = *(void *)(v174 - 8);
  __chkstk_darwin(v174);
  uint64_t v168 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))((char *)&v144 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v162 = (char *)&v144 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v169 = (char *)&v144 - v20;
  uint64_t v21 = type metadata accessor for Logger();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  unsigned int v145 = (char *)&v144 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  unint64_t v148 = (char *)&v144 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v144 - v27;
  uint64_t v29 = type metadata accessor for DataFrame();
  __chkstk_darwin(v29);
  uint64_t v175 = v3;
  uint64_t v146 = v31;
  uint64_t v32 = *(void (**)(void))(v31 + 16);
  uint64_t v170 = (uint64_t)&v144 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = v33;
  v32();
  uint64_t v34 = Logger.evaluationJobRunner.unsafeMutableAddressor();
  uint64_t v35 = v22;
  int64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v154 = v34;
  uint64_t v155 = v22 + 16;
  uint64_t v153 = v36;
  ((void (*)(char *))v36)(v28);
  uint64_t v37 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v37, v38))
  {
    id v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Running data sample filters.", v39, 2u);
    swift_slowDealloc();
  }

  uint64_t v40 = *(void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v157 = v21;
  uint64_t v156 = v35 + 8;
  uint64_t v152 = v40;
  v40(v28, v21);
  uint64_t v41 = *(void *)(v151 + 16);
  uint64_t v158 = v8;
  uint64_t v173 = v12;
  uint64_t v149 = a2;
  if (!v41) {
    goto LABEL_26;
  }
  uint64_t v42 = (uint64_t (**)(uint64_t *))(*v175 + 128);
  uint64_t v166 = *v42;
  uint64_t v165 = v42;
  uint64_t v172 = (char **)(v163 + 56);
  uint64_t v164 = (unsigned int (**)(void *, uint64_t, uint64_t))(v163 + 48);
  uint64_t v43 = (uint64_t *)(swift_bridgeObjectRetain() + 48);
  os_log_type_t v44 = v169;
  while (1)
  {
    uint64_t v47 = *(v43 - 2);
    uint64_t v48 = *(v43 - 1);
    uint64_t v49 = *v43;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    static FilterFunctions.run(dataSampleFilter:on:)(v47, v48, v49, v170, v44);
    BOOL v50 = *v172;
    uint64_t v51 = v174;
    ((void (*)(void *, void, uint64_t, uint64_t))*v172)(v44, 0, 1, v174);
    uint64_t v176 = (uint64_t (*)(void))v166(v179);
    id v53 = v52;
    if ((*v164)(v44, 1, v51) == 1)
    {
      outlined destroy of DataSlice?((uint64_t)v44, &demangling cache variable for type metadata for DataSlice?);
      swift_bridgeObjectRetain();
      unint64_t v54 = specialized __RawDictionaryStorage.find<A>(_:)(v47, v48);
      char v56 = v55;
      swift_bridgeObjectRelease();
      if (v56)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v178[0] = *v53;
        *id v53 = 0x8000000000000000;
        uint64_t v46 = (uint64_t)v162;
        if (!isUniquelyReferenced_nonNull_native) {
          specialized _NativeDictionary.copy()(type metadata accessor for DataSlice, &demangling cache variable for type metadata for _DictionaryStorage<String, DataSlice>, type metadata accessor for DataSlice);
        }
        uint64_t v58 = v178[0];
        swift_bridgeObjectRelease();
        outlined init with take of EventSet(*(void *)(v58 + 56) + *(void *)(v163 + 72) * v54, v46, type metadata accessor for DataSlice);
        specialized _NativeDictionary._delete(at:)(v54, v58, type metadata accessor for DataSlice);
        *id v53 = v58;
        swift_bridgeObjectRelease();
        uint64_t v45 = 0;
      }
      else
      {
        uint64_t v45 = 1;
        uint64_t v46 = (uint64_t)v162;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v50)(v46, v45, 1, v174);
      swift_bridgeObjectRelease();
      outlined destroy of DataSlice?(v46, &demangling cache variable for type metadata for DataSlice?);
      goto LABEL_7;
    }
    outlined init with take of EventSet((uint64_t)v44, (uint64_t)v168, type metadata accessor for DataSlice);
    int v59 = swift_isUniquelyReferenced_nonNull_native();
    v178[0] = *v53;
    uint64_t v60 = v178[0];
    *id v53 = 0x8000000000000000;
    unint64_t v62 = specialized __RawDictionaryStorage.find<A>(_:)(v47, v48);
    uint64_t v63 = *(void *)(v60 + 16);
    BOOL v64 = (v61 & 1) == 0;
    uint64_t v65 = v63 + v64;
    if (__OFADD__(v63, v64)) {
      break;
    }
    char v66 = v61;
    if (*(void *)(v60 + 24) >= v65)
    {
      if (v59)
      {
        uint64_t v69 = (void *)v178[0];
        if ((v61 & 1) == 0) {
          goto LABEL_22;
        }
      }
      else
      {
        specialized _NativeDictionary.copy()(type metadata accessor for DataSlice, &demangling cache variable for type metadata for _DictionaryStorage<String, DataSlice>, type metadata accessor for DataSlice);
        uint64_t v69 = (void *)v178[0];
        if ((v66 & 1) == 0) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v65, v59, type metadata accessor for DataSlice, &demangling cache variable for type metadata for _DictionaryStorage<String, DataSlice>, type metadata accessor for DataSlice);
      unint64_t v67 = specialized __RawDictionaryStorage.find<A>(_:)(v47, v48);
      if ((v66 & 1) != (v68 & 1)) {
        goto LABEL_65;
      }
      unint64_t v62 = v67;
      uint64_t v69 = (void *)v178[0];
      if ((v66 & 1) == 0)
      {
LABEL_22:
        v69[(v62 >> 6) + 8] |= 1 << v62;
        id v70 = (uint64_t *)(v69[6] + 16 * v62);
        *id v70 = v47;
        v70[1] = v48;
        outlined init with take of EventSet((uint64_t)v168, v69[7] + *(void *)(v163 + 72) * v62, type metadata accessor for DataSlice);
        uint64_t v71 = v69[2];
        BOOL v72 = __OFADD__(v71, 1);
        uint64_t v73 = v71 + 1;
        if (v72) {
          goto LABEL_62;
        }
        v69[2] = v73;
        swift_bridgeObjectRetain();
        goto LABEL_24;
      }
    }
    outlined assign with take of EventSet((uint64_t)v168, v69[7] + *(void *)(v163 + 72) * v62, type metadata accessor for DataSlice);
LABEL_24:
    *id v53 = (uint64_t)v69;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_7:
    unint64_t v12 = v173;
    os_log_type_t v44 = v169;
    ((void (*)(uint64_t *, void))v176)(v179, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v43 += 3;
    if (!--v41)
    {
      swift_bridgeObjectRelease();
      a2 = v149;
LABEL_26:
      uint64_t v74 = v148;
      uint64_t v75 = v157;
      v153(v148, v154, v157);
      uint64_t v76 = Logger.logObject.getter();
      os_log_type_t v77 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v76, v77))
      {
        uint64_t v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v78 = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, v77, "Running volume change event detectors.", v78, 2u);
        swift_slowDealloc();
      }

      v152(v74, v75);
      uint64_t v79 = *(void *)(a2 + 16);
      unint64_t v80 = (unint64_t)v175;
      if (!v79)
      {
LABEL_54:
        uint64_t v123 = v145;
        v153(v145, v154, v157);
        unint64_t v124 = Logger.logObject.getter();
        os_log_type_t v125 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v124, v125))
        {
          uint64_t v126 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v126 = 0;
          _os_log_impl((void *)&_mh_execute_header, v124, v125, "Running data aggregators.", v126, 2u);
          swift_slowDealloc();
        }

        v152(v123, v157);
        uint64_t v127 = v150;
        uint64_t v128 = *(void *)(v150 + 16);
        if (v128)
        {
          uint64_t v129 = *(void **)v80;
          uint64_t v171 = v80 & 0xFFFFFFFFFFFFLL | 0x6AE1000000000000;
          uint64_t v130 = (uint64_t (*)(void))v129[14];
          uint64_t v175 = v129 + 14;
          uint64_t v176 = v130;
          uint64_t v173 = (uint64_t (*)(void))v129[17];
          uint64_t v174 = (uint64_t)(v129 + 17);
          uint64_t v172 = (char **)v129[22];
          v131 = (uint64_t *)(swift_bridgeObjectRetain() + 64);
          do
          {
            uint64_t v132 = *(v131 - 4);
            uint64_t v133 = *(v131 - 3);
            uint64_t v134 = *(v131 - 2);
            uint64_t v135 = *(v131 - 1);
            uint64_t v136 = *v131;
            v131 += 5;
            v178[0] = v132;
            v178[1] = v133;
            v178[2] = v134;
            v178[3] = v135;
            v178[4] = v136;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v137 = swift_bridgeObjectRetain();
            uint64_t v138 = v176(v137);
            uint64_t v139 = v173();
            unint64_t v140 = static AggregationFunctions.run(aggregator:dataSlices:volumeChangeEventSets:)((uint64_t)v178, v138, v139);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v141 = (void (*)(void **, void))((uint64_t (*)(void **))v172)(&v177);
            specialized Array.append<A>(contentsOf:)((uint64_t)v140);
            v141(&v177, 0);
            --v128;
          }
          while (v128);
          uint64_t v127 = swift_bridgeObjectRelease();
        }
        uint64_t v142 = (*(uint64_t (**)(uint64_t))(*(void *)v80 + 160))(v127);
        (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v170, v147);
        return v142;
      }
      uint64_t v81 = (uint64_t (**)(void))(*v175 + 112);
      uint64_t v176 = *v81;
      uint64_t v174 = (uint64_t)v81;
      long long v82 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48);
      uint64_t v172 = (char **)(v159 + 56);
      swift_bridgeObjectRetain();
      uint64_t v83 = (uint64_t *)(a2 + 64);
      uint64_t v168 = v82;
      while (1)
      {
        uint64_t v85 = *(v83 - 4);
        uint64_t v84 = *(v83 - 3);
        uint64_t v86 = *(v83 - 2);
        uint64_t v87 = *(v83 - 1);
        uint64_t v88 = *v83;
        v179[0] = v85;
        v179[1] = v84;
        v179[2] = v86;
        v179[3] = v87;
        v179[4] = v88;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v89 = swift_bridgeObjectRetain();
        uint64_t v90 = v176(v89);
        static EventSetGenerationFunctions.run(volumeChangeRetrieval:dataSlices:)(v179, v90, v12);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v91 = (uint64_t)v12;
        uint64_t v92 = *v82;
        uint64_t v93 = v171;
        if ((*v82)(v91, 1, v171) != 1) {
          break;
        }
        swift_bridgeObjectRelease();
        outlined destroy of DataSlice?(v91, &demangling cache variable for type metadata for EventSet?);
        unint64_t v12 = (uint64_t (*)(void))v91;
LABEL_31:
        v83 += 5;
        if (!--v79)
        {
          swift_bridgeObjectRelease();
          goto LABEL_54;
        }
      }
      uint64_t v94 = v91;
      uint64_t v95 = v167;
      outlined init with take of EventSet(v94, v167, type metadata accessor for EventSet);
      uint64_t v96 = v161;
      outlined init with copy of EventSet(v95, v161, type metadata accessor for EventSet);
      uint64_t v169 = *v172;
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v169)(v96, 0, 1, v93);
      uint64_t v97 = (*(uint64_t (**)(void *))(*(void *)v80 + 152))(v178);
      uint64_t v98 = v93;
      unint64_t v99 = (void (*)(void *, void))v97;
      NSNumber v101 = v100;
      if (v92(v96, 1, v98) == 1)
      {
        outlined destroy of DataSlice?(v96, &demangling cache variable for type metadata for EventSet?);
        swift_bridgeObjectRetain();
        unint64_t v102 = specialized __RawDictionaryStorage.find<A>(_:)(v85, v84);
        char v104 = v103;
        swift_bridgeObjectRelease();
        if (v104)
        {
          int v105 = swift_isUniquelyReferenced_nonNull_native();
          v177 = (void *)*v101;
          *NSNumber v101 = 0x8000000000000000;
          if (!v105) {
            specialized _NativeDictionary.copy()(type metadata accessor for EventSet, &demangling cache variable for type metadata for _DictionaryStorage<String, EventSet>, type metadata accessor for EventSet);
          }
          uint64_t v106 = (uint64_t)v177;
          swift_bridgeObjectRelease();
          uint64_t v107 = (uint64_t)v158;
          outlined init with take of EventSet(*(void *)(v106 + 56) + *(void *)(v159 + 72) * v102, (uint64_t)v158, type metadata accessor for EventSet);
          specialized _NativeDictionary._delete(at:)(v102, v106, type metadata accessor for EventSet);
          *NSNumber v101 = v106;
          swift_bridgeObjectRelease();
          uint64_t v108 = 0;
        }
        else
        {
          uint64_t v108 = 1;
          uint64_t v107 = (uint64_t)v158;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v169)(v107, v108, 1, v171);
        swift_bridgeObjectRelease();
        outlined destroy of DataSlice?(v107, &demangling cache variable for type metadata for EventSet?);
        goto LABEL_52;
      }
      outlined init with take of EventSet(v96, v160, type metadata accessor for EventSet);
      int v109 = swift_isUniquelyReferenced_nonNull_native();
      v177 = (void *)*v101;
      os_log_type_t v110 = v177;
      *NSNumber v101 = 0x8000000000000000;
      unint64_t v112 = specialized __RawDictionaryStorage.find<A>(_:)(v85, v84);
      uint64_t v113 = v110[2];
      BOOL v114 = (v111 & 1) == 0;
      uint64_t v115 = v113 + v114;
      if (__OFADD__(v113, v114)) {
        goto LABEL_63;
      }
      char v116 = v111;
      if (v110[3] < v115)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v115, v109, type metadata accessor for EventSet, &demangling cache variable for type metadata for _DictionaryStorage<String, EventSet>, type metadata accessor for EventSet);
        unint64_t v117 = specialized __RawDictionaryStorage.find<A>(_:)(v85, v84);
        if ((v116 & 1) != (v118 & 1)) {
          goto LABEL_65;
        }
        unint64_t v112 = v117;
        double v119 = v177;
        if ((v116 & 1) == 0) {
          goto LABEL_49;
        }
LABEL_47:
        outlined assign with take of EventSet(v160, v119[7] + *(void *)(v159 + 72) * v112, type metadata accessor for EventSet);
LABEL_51:
        *NSNumber v101 = (uint64_t)v119;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_52:
        unint64_t v80 = (unint64_t)v175;
        unint64_t v12 = v173;
        long long v82 = v168;
        v99(v178, 0);
        outlined destroy of EventSet(v167, type metadata accessor for EventSet);
        goto LABEL_31;
      }
      if (v109)
      {
        double v119 = v177;
        if (v111) {
          goto LABEL_47;
        }
      }
      else
      {
        specialized _NativeDictionary.copy()(type metadata accessor for EventSet, &demangling cache variable for type metadata for _DictionaryStorage<String, EventSet>, type metadata accessor for EventSet);
        double v119 = v177;
        if (v116) {
          goto LABEL_47;
        }
      }
LABEL_49:
      v119[(v112 >> 6) + 8] |= 1 << v112;
      unint64_t v120 = (uint64_t *)(v119[6] + 16 * v112);
      *unint64_t v120 = v85;
      v120[1] = v84;
      outlined init with take of EventSet(v160, v119[7] + *(void *)(v159 + 72) * v112, type metadata accessor for EventSet);
      uint64_t v121 = v119[2];
      BOOL v72 = __OFADD__(v121, 1);
      uint64_t v122 = v121 + 1;
      if (v72) {
        goto LABEL_64;
      }
      v119[2] = v122;
      swift_bridgeObjectRetain();
      goto LABEL_51;
    }
  }
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for EventSet(uint64_t a1)
{
  return type metadata accessor for EventSet(a1, (uint64_t *)&type metadata singleton initialization cache for EventSet);
}

uint64_t type metadata accessor for DataSlice(uint64_t a1)
{
  return type metadata accessor for EventSet(a1, (uint64_t *)&type metadata singleton initialization cache for DataSlice);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for Metric(0) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t EvaluationJobRunner.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18LighthouseAVPlugin19EvaluationJobRunner_fullDataFrame;
  uint64_t v2 = type metadata accessor for DataFrame();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t DataSlice.init(dataSliceName:dataFrame:filterDescription:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  uint64_t v12 = type metadata accessor for DataSlice(0);
  unint64_t v13 = (char *)a7 + *(int *)(v12 + 20);
  uint64_t v14 = type metadata accessor for DataFrame();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a3, v14);
  uint64_t v16 = (void *)((char *)a7 + *(int *)(v12 + 24));
  *uint64_t v16 = a4;
  v16[1] = a5;
  v16[2] = a6;
  return result;
}

uint64_t EventSet.init(eventSetName:dataFrame:originDataSlice:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t v8 = type metadata accessor for EventSet(0);
  uint64_t v9 = (char *)a5 + *(int *)(v8 + 20);
  uint64_t v10 = type metadata accessor for DataFrame();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
  return outlined init with take of EventSet(a4, (uint64_t)a5 + *(int *)(v8 + 24), type metadata accessor for DataSlice);
}

Swift::Int __swiftcall Metric.samplesUsed()()
{
  uint64_t v1 = type metadata accessor for EventSet(0);
  v21[0] = *(void *)(v1 - 8);
  v21[1] = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DataFrame.Rows();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DataSlice(0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Metric(0);
  outlined init with copy of DataSlice?(v0 + *(int *)(v15 + 28), (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    outlined destroy of DataSlice?((uint64_t)v10, &demangling cache variable for type metadata for DataSlice?);
    uint64_t v16 = *(void *)(v0 + *(int *)(v15 + 32));
    if (!v16 || !*(void *)(v16 + 16)) {
      return 0;
    }
    outlined init with copy of EventSet(v16 + ((*(unsigned __int8 *)(v21[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21[0] + 80)), (uint64_t)v3, type metadata accessor for EventSet);
    DataFrame.rows.getter();
    Swift::Int v17 = DataFrame.Rows.count.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v18 = (uint64_t)v3;
    uint64_t v19 = type metadata accessor for EventSet;
  }
  else
  {
    outlined init with take of EventSet((uint64_t)v10, (uint64_t)v14, type metadata accessor for DataSlice);
    DataFrame.rows.getter();
    Swift::Int v17 = DataFrame.Rows.count.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v18 = (uint64_t)v14;
    uint64_t v19 = type metadata accessor for DataSlice;
  }
  outlined destroy of EventSet(v18, v19);
  return v17;
}

uint64_t Metric.init(metricName:metricValue:controllerVersion:originDataSlice:originEventSets:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(double *)(a7 + 16) = a8;
  *(void *)(a7 + 24) = a3;
  *(void *)(a7 + 32) = a4;
  uint64_t v11 = type metadata accessor for Metric(0);
  uint64_t result = outlined init with take of DataSlice?(a5, a7 + *(int *)(v11 + 28));
  *(void *)(a7 + *(int *)(v11 + 32)) = a6;
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Metric>);
  uint64_t v10 = *(void *)(type metadata accessor for Metric(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Metric(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, int a2, uint64_t (*a3)(void), uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v49 = a5;
  uint64_t v7 = v5;
  uint64_t v9 = a3(0);
  uint64_t v47 = *(void *)(v9 - 8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  int v48 = a2;
  uint64_t v13 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 64);
  uint64_t v46 = (void *)(v12 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  os_log_type_t v44 = v5;
  int64_t v45 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v19 = v13 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  while (1)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v45) {
      break;
    }
    uint64_t v27 = v46;
    unint64_t v28 = v46[v26];
    ++v21;
    if (!v28)
    {
      int64_t v21 = v26 + 1;
      if (v26 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v28 = v46[v21];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v7 = v44;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v46[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v21 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v45) {
              goto LABEL_34;
            }
            unint64_t v28 = v46[v21];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v21 << 6);
LABEL_22:
    uint64_t v30 = (uint64_t *)(*(void *)(v12 + 48) + 16 * v25);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    uint64_t v33 = *(void *)(v47 + 72);
    uint64_t v34 = *(void *)(v12 + 56) + v33 * v25;
    if (v48)
    {
      outlined init with take of EventSet(v34, (uint64_t)v11, v49);
    }
    else
    {
      outlined init with copy of EventSet(v34, (uint64_t)v11, v49);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v35 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v19 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    int64_t v23 = (void *)(*(void *)(v14 + 48) + 16 * v22);
    *int64_t v23 = v31;
    v23[1] = v32;
    uint64_t result = outlined init with take of EventSet((uint64_t)v11, *(void *)(v14 + 56) + v33 * v22, v49);
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v7 = v44;
  uint64_t v27 = v46;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v12 + 32);
  if (v42 >= 64) {
    bzero(v27, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v27 = -1 << v42;
  }
  *(void *)(v12 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v7 = v14;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v9 = ~v6;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v10 = (result + 1) & v9;
      while (1)
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v11 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v9;
        if (v4 >= (uint64_t)v10) {
          break;
        }
        if (v12 < v10) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (_OWORD *)(v13 + 16 * v4);
        uint64_t v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1) {
          *uint64_t v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(a3(0) - 8) + 72);
        int64_t v18 = v17 * v4;
        uint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v9;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v10) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *unint64_t v22 = v24 & v23;
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

void *specialized _NativeDictionary.copy()(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = a1(0);
  uint64_t v33 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v30 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v30 = v3;
  uint64_t v9 = *v3;
  uint64_t v10 = static _DictionaryStorage.copy(original:)();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v30 = v11;
    return result;
  }
  uint64_t result = (void *)(v10 + 64);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v13) {
    uint64_t result = memmove(result, (const void *)(v9 + 64), 8 * v13);
  }
  uint64_t v31 = v9 + 64;
  int64_t v15 = 0;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 64);
  int64_t v32 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v32) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v27);
    ++v15;
    if (!v28)
    {
      int64_t v15 = v27 + 1;
      if (v27 + 1 >= v32) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v31 + 8 * v15);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v20 = __clz(__rbit64(v28)) + (v15 << 6);
LABEL_12:
    uint64_t v21 = 16 * v20;
    unint64_t v22 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v20);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    unint64_t v25 = *(void *)(v33 + 72) * v20;
    outlined init with copy of EventSet(*(void *)(v9 + 56) + v25, (uint64_t)v8, a3);
    BOOL v26 = (void *)(*(void *)(v11 + 48) + v21);
    *BOOL v26 = v23;
    v26[1] = v24;
    outlined init with take of EventSet((uint64_t)v8, *(void *)(v11 + 56) + v25, a3);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v32) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v31 + 8 * v29);
  if (v28)
  {
    int64_t v15 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v15 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v15 >= v32) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v15);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t outlined init with take of EventSet(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined assign with take of EventSet(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of EventSet(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for Metric(uint64_t a1)
{
  return type metadata accessor for EventSet(a1, (uint64_t *)&type metadata singleton initialization cache for Metric);
}

uint64_t outlined init with copy of DataSlice?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of EventSet(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of DataSlice?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ObjC metadata update function for EvaluationJobRunner()
{
  return type metadata accessor for EvaluationJobRunner(0);
}

uint64_t type metadata accessor for EvaluationJobRunner(uint64_t a1)
{
  return type metadata accessor for EventSet(a1, (uint64_t *)&type metadata singleton initialization cache for EvaluationJobRunner);
}

uint64_t type metadata accessor for EventSet(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for EvaluationJobRunner()
{
  uint64_t result = type metadata accessor for DataFrame();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DataSlice(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DataFrame();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    int64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    v14[2] = v15[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for DataSlice(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for DataFrame();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DataSlice(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DataFrame();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  void v13[2] = v14[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DataSlice(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DataFrame();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v11[2] = v12[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for DataSlice(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DataFrame();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((void *)v11 + 2) = *((void *)v12 + 2);
  return a1;
}

void *assignWithTake for DataSlice(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DataFrame();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v12[2] = v13[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataSlice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100023398);
}

uint64_t sub_100023398(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for DataFrame();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DataSlice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002345C);
}

uint64_t sub_10002345C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for DataFrame();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for DataSlice()
{
  uint64_t result = type metadata accessor for DataFrame();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventSet(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DataFrame();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
    uint64_t v17 = *((void *)v15 + 1);
    *uint64_t v14 = v16;
    v14[1] = v17;
    uint64_t v18 = type metadata accessor for DataSlice(0);
    uint64_t v19 = *(int *)(v18 + 20);
    unint64_t v20 = (char *)v14 + v19;
    uint64_t v21 = &v15[v19];
    swift_bridgeObjectRetain();
    v12(v20, v21, v11);
    uint64_t v22 = *(int *)(v18 + 24);
    uint64_t v23 = (void *)((char *)v14 + v22);
    uint64_t v24 = &v15[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *uint64_t v23 = *(void *)v24;
    v23[1] = v25;
    void v23[2] = *((void *)v24 + 2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for EventSet(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for DataFrame();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for DataSlice(0);
  v6(v7 + *(int *)(v8 + 20), v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EventSet(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DataFrame();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)((char *)a2 + v12 + 8);
  *uint64_t v13 = *(void *)((char *)a2 + v12);
  v13[1] = v15;
  uint64_t v16 = type metadata accessor for DataSlice(0);
  uint64_t v17 = *(int *)(v16 + 20);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = &v14[v17];
  swift_bridgeObjectRetain();
  v11(v18, v19, v10);
  uint64_t v20 = *(int *)(v16 + 24);
  uint64_t v21 = (void *)((char *)v13 + v20);
  uint64_t v22 = &v14[v20];
  uint64_t v23 = *((void *)v22 + 1);
  void *v21 = *(void *)v22;
  v21[1] = v23;
  void v21[2] = *((void *)v22 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EventSet(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DataFrame();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = type metadata accessor for DataSlice(0);
  v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
  uint64_t v15 = *(int *)(v14 + 24);
  uint64_t v16 = &v12[v15];
  uint64_t v17 = &v13[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v16 + 2) = *((void *)v17 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for EventSet(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DataFrame();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)v13;
  uint64_t v14 = type metadata accessor for DataSlice(0);
  v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
  uint64_t v15 = *(int *)(v14 + 24);
  uint64_t v16 = &v12[v15];
  uint64_t v17 = &v13[v15];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((void *)v16 + 2) = *((void *)v17 + 2);
  return a1;
}

void *assignWithTake for EventSet(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DataFrame();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = type metadata accessor for DataSlice(0);
  v11(&v13[*(int *)(v16 + 20)], &v14[*(int *)(v16 + 20)], v10);
  uint64_t v17 = *(int *)(v16 + 24);
  uint64_t v18 = &v13[v17];
  uint64_t v19 = &v14[v17];
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  *((void *)v18 + 2) = *((void *)v19 + 2);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EventSet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100023C60);
}

uint64_t sub_100023C60(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for DataFrame();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for DataSlice(0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for EventSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100023DA0);
}

uint64_t sub_100023DA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for DataFrame();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for DataSlice(0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata completion function for EventSet()
{
  uint64_t result = type metadata accessor for DataFrame();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for DataSlice(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Metric(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(void *)(a1 + 32) = a2[4];
    uint64_t v8 = *(int *)(a3 + 28);
    __dst = (void *)(a1 + v8);
    uint64_t v9 = (uint64_t *)((char *)a2 + v8);
    uint64_t v10 = type metadata accessor for DataSlice(0);
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = v9[1];
      void *__dst = *v9;
      __dst[1] = v15;
      uint64_t v16 = *(int *)(v10 + 20);
      uint64_t v25 = (char *)v9 + v16;
      uint64_t v26 = (char *)__dst + v16;
      uint64_t v17 = type metadata accessor for DataFrame();
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
      swift_bridgeObjectRetain();
      v24(v26, v25, v17);
      uint64_t v18 = *(int *)(v10 + 24);
      uint64_t v19 = (void *)((char *)__dst + v18);
      uint64_t v20 = (void *)((char *)v9 + v18);
      uint64_t v21 = v20[1];
      *uint64_t v19 = *v20;
      v19[1] = v21;
      void v19[2] = v20[2];
      uint64_t v22 = *(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v22(__dst, 0, 1, v10);
    }
    *(void *)((char *)v4 + *(int *)(a3 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 32));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for Metric(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for DataSlice(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v4 + *(int *)(v5 + 20);
    uint64_t v7 = type metadata accessor for DataFrame();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metric(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for DataSlice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = v8[1];
    *uint64_t v7 = *v8;
    v7[1] = v13;
    uint64_t v14 = *(int *)(v9 + 20);
    uint64_t v23 = (char *)v8 + v14;
    uint64_t v24 = (char *)v7 + v14;
    uint64_t v15 = type metadata accessor for DataFrame();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v24, v23, v15);
    uint64_t v17 = *(int *)(v9 + 24);
    uint64_t v18 = (void *)((char *)v7 + v17);
    uint64_t v19 = (void *)((char *)v8 + v17);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    v18[2] = v19[2];
    uint64_t v21 = *(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v7, 0, 1, v9);
  }
  *(void *)(a1 + *(int *)(a3 + 32)) = *(void *)(a2 + *(int *)(a3 + 32));
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Metric(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for DataSlice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      *uint64_t v7 = *v8;
      v7[1] = v8[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v23 = *(int *)(v9 + 20);
      uint64_t v24 = (char *)v7 + v23;
      uint64_t v25 = (char *)v8 + v23;
      uint64_t v26 = type metadata accessor for DataFrame();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
      uint64_t v27 = *(int *)(v9 + 24);
      unint64_t v28 = (void *)((char *)v7 + v27);
      int64_t v29 = (void *)((char *)v8 + v27);
      *unint64_t v28 = *v29;
      v28[1] = v29[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      void v28[2] = v29[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    outlined destroy of EventSet((uint64_t)v7, type metadata accessor for DataSlice);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
    memcpy(v7, v8, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  uint64_t v14 = *(int *)(v9 + 20);
  uint64_t v30 = (char *)v8 + v14;
  uint64_t v31 = (char *)v7 + v14;
  uint64_t v15 = type metadata accessor for DataFrame();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v31, v30, v15);
  uint64_t v17 = *(int *)(v9 + 24);
  uint64_t v18 = (void *)((char *)v7 + v17);
  uint64_t v19 = (void *)((char *)v8 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  v18[2] = v19[2];
  uint64_t v20 = *(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(void *)((char *)a2 + *(int *)(a3 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Metric(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (_OWORD *)(a1 + v6);
  uint64_t v8 = (_OWORD *)(a2 + v6);
  uint64_t v9 = type metadata accessor for DataSlice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    *uint64_t v7 = *v8;
    uint64_t v12 = *(int *)(v9 + 20);
    int v13 = (char *)v7 + v12;
    uint64_t v14 = (char *)v8 + v12;
    uint64_t v15 = type metadata accessor for DataFrame();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    uint64_t v16 = *(int *)(v9 + 24);
    uint64_t v17 = (char *)v7 + v16;
    uint64_t v18 = (char *)v8 + v16;
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *((void *)v17 + 2) = *((void *)v18 + 2);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(void *)(a1 + *(int *)(a3 + 32)) = *(void *)(a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for Metric(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = a2[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  uint64_t v11 = type metadata accessor for DataSlice(0);
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      uint64_t v25 = v10[1];
      void *v9 = *v10;
      v9[1] = v25;
      swift_bridgeObjectRelease();
      uint64_t v26 = *(int *)(v11 + 20);
      uint64_t v27 = (char *)v9 + v26;
      unint64_t v28 = (char *)v10 + v26;
      uint64_t v29 = type metadata accessor for DataFrame();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 40))(v27, v28, v29);
      uint64_t v30 = *(int *)(v11 + 24);
      uint64_t v31 = (void *)((char *)v9 + v30);
      int64_t v32 = (void *)((char *)v10 + v30);
      uint64_t v33 = v32[1];
      *uint64_t v31 = *v32;
      v31[1] = v33;
      swift_bridgeObjectRelease();
      v31[2] = v32[2];
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    outlined destroy of EventSet((uint64_t)v9, type metadata accessor for DataSlice);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
    memcpy(v9, v10, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  uint64_t v16 = *(int *)(v11 + 20);
  uint64_t v17 = (char *)v9 + v16;
  uint64_t v18 = (char *)v10 + v16;
  uint64_t v19 = type metadata accessor for DataFrame();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = *(int *)(v11 + 24);
  uint64_t v21 = (char *)v9 + v20;
  uint64_t v22 = (char *)v10 + v20;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *((void *)v21 + 2) = *((void *)v22 + 2);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(void *)((char *)a2 + *(int *)(a3 + 32));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metric(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024BB4);
}

uint64_t sub_100024BB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Metric(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024C7C);
}

uint64_t sub_100024C7C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataSlice?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for Metric()
{
  type metadata accessor for DataSlice?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for DataSlice?()
{
  if (!lazy cache variable for type metadata for DataSlice?)
  {
    type metadata accessor for DataSlice(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for DataSlice?);
    }
  }
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
    uint64_t v8 = *(void *)(type metadata accessor for Metric(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t one-time initialization function for aggregationFunction(uint64_t a1)
{
  return one-time initialization function for aggregationFunction(a1, static Logger.aggregationFunction);
}

uint64_t Logger.aggregationFunction.unsafeMutableAddressor()
{
  return Logger.aggregationFunction.unsafeMutableAddressor(&one-time initialization token for aggregationFunction, (uint64_t)static Logger.aggregationFunction);
}

uint64_t one-time initialization function for evaluationJobRunner(uint64_t a1)
{
  return one-time initialization function for aggregationFunction(a1, static Logger.evaluationJobRunner);
}

uint64_t Logger.evaluationJobRunner.unsafeMutableAddressor()
{
  return Logger.aggregationFunction.unsafeMutableAddressor(&one-time initialization token for evaluationJobRunner, (uint64_t)static Logger.evaluationJobRunner);
}

uint64_t one-time initialization function for eventSetGenerator(uint64_t a1)
{
  return one-time initialization function for aggregationFunction(a1, static Logger.eventSetGenerator);
}

uint64_t Logger.eventSetGenerator.unsafeMutableAddressor()
{
  return Logger.aggregationFunction.unsafeMutableAddressor(&one-time initialization token for eventSetGenerator, (uint64_t)static Logger.eventSetGenerator);
}

uint64_t one-time initialization function for filterFunction(uint64_t a1)
{
  return one-time initialization function for aggregationFunction(a1, static Logger.filterFunction);
}

uint64_t Logger.filterFunction.unsafeMutableAddressor()
{
  return Logger.aggregationFunction.unsafeMutableAddressor(&one-time initialization token for filterFunction, (uint64_t)static Logger.filterFunction);
}

uint64_t one-time initialization function for metrics(uint64_t a1)
{
  return one-time initialization function for aggregationFunction(a1, static Logger.metrics);
}

uint64_t one-time initialization function for aggregationFunction(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.metrics.unsafeMutableAddressor()
{
  return Logger.aggregationFunction.unsafeMutableAddressor(one-time initialization token for metrics, (uint64_t)static Logger.metrics);
}

uint64_t Logger.aggregationFunction.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t AVLogReader.readFromBiome()@<X0>(uint64_t a1@<X8>)
{
  id v2 = [(id)BiomeLibrary() Device];
  swift_unknownObjectRelease();
  id v3 = [v2 Audio];
  swift_unknownObjectRelease();
  id v4 = [v3 AdaptiveVolume];
  swift_unknownObjectRelease();
  id v5 = [v4 publisher];

  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &_swiftEmptyArrayStorage;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  uint64_t v7 = swift_allocBox();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for DataFrame();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  unint64_t v11 = (void *)swift_allocObject();
  void v11[2] = v6;
  v11[3] = v7;
  v11[4] = v1;
  uint64_t v21 = partial apply for closure #1 in AVLogReader.readFromBiome();
  uint64_t v22 = v11;
  aBlock = _NSConcreteStackBlock;
  uint64_t v18 = 1107296256;
  uint64_t v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  uint64_t v20 = &block_descriptor_0;
  unint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v21 = partial apply for closure #2 in AVLogReader.readFromBiome();
  uint64_t v22 = (void *)v6;
  aBlock = _NSConcreteStackBlock;
  uint64_t v18 = 1107296256;
  uint64_t v19 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  uint64_t v20 = &block_descriptor_6;
  int v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v14 = [v5 sinkWithCompletion:v12 receiveInput:v13];

  _Block_release(v13);
  _Block_release(v12);

  swift_beginAccess();
  outlined init with copy of Date?(v9, a1, &demangling cache variable for type metadata for DataFrame?);
  swift_release();
  return swift_release();
}

uint64_t sub_1000254B8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t closure #1 in AVLogReader.readFromBiome()(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)(a1 + 16);
  uint64_t v10 = swift_projectBox();
  uint64_t v11 = Logger.evaluationJobRunner.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
  swift_retain();
  unint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v19 = v4;
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v14 = 134217984;
    swift_beginAccess();
    if (*v9 >> 62)
    {
      v18[1] = *v9;
      swift_bridgeObjectRetain();
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v20 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Completed reading from Biome. Found %ld events.", v14, 0xCu);
    swift_slowDealloc();

    id v4 = v19;
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  unint64_t v16 = swift_bridgeObjectRetain();
  AVLogReader.convertBiomeEventsToDataFrame(_:)(v16, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  return outlined assign with take of DataFrame?((uint64_t)v4, v10);
}

uint64_t sub_1000257A8()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t partial apply for closure #1 in AVLogReader.readFromBiome()()
{
  return closure #1 in AVLogReader.readFromBiome()(*(void *)(v0 + 16));
}

uint64_t AVLogReader.convertBiomeEventsToDataFrame(_:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v102 = a2;
  uint64_t v101 = type metadata accessor for Order();
  uint64_t v100 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  unint64_t v99 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<String>);
  int64_t v123 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  unint64_t v112 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  uint64_t v7 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Date>);
  uint64_t v106 = *(void *)(v114 - 8);
  uint64_t v8 = __chkstk_darwin(v114);
  int v109 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  os_log_type_t v110 = (char *)&v95 - v10;
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v105 = *(void *)(v120 - 8);
  uint64_t v11 = __chkstk_darwin(v120);
  double v119 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v14 = (char *)&v95 - v13;
  uint64_t v15 = type metadata accessor for DataFrame();
  uint64_t v97 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v95 = (char *)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v121 = (char *)&v95 - v18;
  DataFrame.init()();
  if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v20 = v19 - 1;
    if (v19 >= 1) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    goto LABEL_7;
  }
  uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v20 = v19 - 1;
  if (v19 < 1) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v21 = specialized _copyCollectionToContiguousArray<A>(_:)(0, v20);
LABEL_7:
  uint64_t v128 = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  uint64_t v117 = lazy protocol witness table accessor for type [Int] and conformance [A](&lazy protocol witness table cache variable for type [Int] and conformance [A], &demangling cache variable for type metadata for [Int]);
  uint64_t v118 = v22;
  Column.init<A>(name:contents:)();
  uint64_t v96 = v14;
  DataFrame.append<A>(column:)();
  uint64_t v23 = (unint64_t *)&_swiftEmptyArrayStorage;
  int64_t v24 = v19 & ~(v19 >> 63);
  unint64_t v127 = a1;
  uint64_t v98 = v15;
  if (v19)
  {
    uint64_t v128 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v19 & ~(v19 >> 63), 0);
    if (v19 < 0) {
      goto LABEL_86;
    }
    uint64_t v126 = v19 & ~(v19 >> 63);
    uint64_t v26 = v19;
    uint64_t v27 = 0;
    uint64_t v23 = v128;
    unint64_t v28 = a1 & 0xC000000000000001;
    uint64_t v29 = v115;
    do
    {
      if (v28) {
        id v30 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v30 = *(id *)(v127 + 8 * v27 + 32);
      }
      uint64_t v31 = v30;
      [v30 timestamp];
      Date.init(timeIntervalSinceReferenceDate:)();

      uint64_t v128 = v23;
      unint64_t v33 = v23[2];
      unint64_t v32 = v23[3];
      if (v33 >= v32 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1);
        uint64_t v29 = v115;
        uint64_t v23 = v128;
      }
      ++v27;
      void v23[2] = v33 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v23+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v33, v7, v29);
    }
    while (v26 != v27);
    int64_t v24 = v126;
    a1 = v127;
    uint64_t v19 = v26;
  }
  AVLogColumns.rawValue.getter(1);
  uint64_t v128 = v23;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Date]);
  uint64_t v35 = lazy protocol witness table accessor for type [Int] and conformance [A](&lazy protocol witness table cache variable for type [Date] and conformance [A], &demangling cache variable for type metadata for [Date]);
  uint64_t v108 = v34;
  uint64_t v107 = v35;
  Column.init<A>(name:contents:)();
  DataFrame.append<A>(column:)();
  if (v19)
  {
    uint64_t v128 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24, 0);
    if (v19 < 0) {
      goto LABEL_87;
    }
    uint64_t v36 = 0;
    unint64_t v37 = v128;
    unint64_t v38 = a1 & 0xC000000000000001;
    do
    {
      unint64_t v39 = v37;
      if (v38) {
        id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v40 = *(id *)(a1 + 8 * v36 + 32);
      }
      uint64_t v41 = v40;
      id v42 = [v40 jsonDictionary];
      uint64_t v43 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v37 = v39;
      uint64_t v128 = v39;
      unint64_t v44 = v39[2];
      unint64_t v45 = v37[3];
      if (v44 >= v45 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v44 + 1, 1);
        unint64_t v37 = v128;
      }
      ++v36;
      v37[2] = v44 + 1;
      v37[v44 + 4] = v43;
      a1 = v127;
    }
    while (v19 != v36);
    char v104 = v37;
  }
  else
  {
    char v104 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  uint64_t v46 = AVLogColumns.allValues.unsafeMutableAddressor();
  uint64_t v47 = *v46;
  uint64_t v126 = *(void *)(*v46 + 16);
  if (!v126)
  {
LABEL_84:
    swift_bridgeObjectRelease();
    AVLogColumns.rawValue.getter(1);
    uint64_t v87 = v100;
    uint64_t v88 = v99;
    uint64_t v89 = v101;
    (*(void (**)(char *, void, uint64_t))(v100 + 104))(v99, enum case for Order.ascending(_:), v101);
    uint64_t v90 = v95;
    uint64_t v91 = v98;
    uint64_t v92 = v121;
    DataFrameProtocol.sorted(on:order:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v89);
    (*(void (**)(char *, uint64_t))(v106 + 8))(v110, v114);
    (*(void (**)(char *, uint64_t))(v105 + 8))(v96, v120);
    uint64_t v93 = v97;
    (*(void (**)(char *, uint64_t))(v97 + 8))(v92, v91);
    uint64_t v94 = v102;
    (*(void (**)(uint64_t, char *, uint64_t))(v93 + 32))(v102, v90, v91);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v93 + 56))(v94, 0, 1, v91);
  }
  uint64_t v125 = v47 + 32;
  int64_t v48 = v104[2];
  uint64_t v122 = (uint64_t *)(v104 + 4);
  char v116 = (uint64_t (**)(char *, uint64_t))(v105 + 8);
  char v111 = (uint64_t (**)(char *, uint64_t))(v123 + 8);
  char v103 = (uint64_t (**)(char *, uint64_t))(v106 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v49 = 0;
  int64_t v123 = v48;
  uint64_t v124 = v47;
  while (v49 < *(void *)(v47 + 16))
  {
    unint64_t v127 = v49;
    char v51 = *(unsigned char *)(v125 + v49);
    if (v48)
    {
      v131 = &_swiftEmptyArrayStorage;
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v48, 0);
      uint64_t v52 = v122;
      while (1)
      {
        uint64_t v53 = *v52;
        swift_bridgeObjectRetain();
        *(void *)&long long v129 = AVLogColumns.rawValue.getter(v51);
        *((void *)&v129 + 1) = v54;
        AnyHashable.init<A>(_:)();
        if (*(void *)(v53 + 16))
        {
          specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)&v128);
          char v56 = v55;
          outlined destroy of AnyHashable((uint64_t)&v128);
          if (v56)
          {
            *(void *)&long long v129 = AVLogColumns.rawValue.getter(v51);
            *((void *)&v129 + 1) = v57;
            AnyHashable.init<A>(_:)();
            if (*(void *)(v53 + 16)
              && (unint64_t v58 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)&v128), (v59 & 1) != 0))
            {
              outlined init with copy of Any(*(void *)(v53 + 56) + 32 * v58, (uint64_t)&v129);
            }
            else
            {
              long long v129 = 0u;
              long long v130 = 0u;
            }
            outlined destroy of AnyHashable((uint64_t)&v128);
            goto LABEL_45;
          }
        }
        else
        {
          outlined destroy of AnyHashable((uint64_t)&v128);
        }
        long long v129 = 0u;
        long long v130 = 0u;
LABEL_45:
        swift_bridgeObjectRelease();
        uint64_t v60 = v131;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v60[2] + 1, 1);
          uint64_t v60 = v131;
        }
        unint64_t v62 = v60[2];
        unint64_t v61 = v60[3];
        if (v62 >= v61 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v61 > 1, v62 + 1, 1);
          uint64_t v60 = v131;
        }
        v60[2] = v62 + 1;
        outlined init with take of (offset: Int, element: DataFrame.Row)?((uint64_t)&v129, (uint64_t)&v60[4 * v62 + 4], &demangling cache variable for type metadata for Any?);
        ++v52;
        if (!--v48) {
          goto LABEL_52;
        }
      }
    }
    uint64_t v60 = &_swiftEmptyArrayStorage;
LABEL_52:
    uint64_t v63 = AVLogColumns.intValues.unsafeMutableAddressor();
    uint64_t v64 = *v63;
    uint64_t v65 = *(void *)(*v63 + 16);
    if (v65)
    {
      lazy protocol witness table accessor for type AVLogColumns and conformance AVLogColumns();
      swift_bridgeObjectRetain();
      uint64_t v66 = 0;
      while (1)
      {
        LOBYTE(v128) = *(unsigned char *)(v64 + v66 + 32);
        LOBYTE(v129) = v51;
        if (dispatch thunk of static Equatable.== infix(_:_:)()) {
          break;
        }
        if (v65 == ++v66)
        {
          swift_bridgeObjectRelease();
          goto LABEL_57;
        }
      }
      swift_bridgeObjectRelease();
      int64_t v75 = v60[2];
      v131 = &_swiftEmptyArrayStorage;
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v75, 0);
      uint64_t v76 = v60[2];
      if (v76)
      {
        uint64_t v77 = (uint64_t)(v60 + 4);
        while (1)
        {
          outlined init with copy of Date?(v77, (uint64_t)&v128, &demangling cache variable for type metadata for Any?);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
          if (!swift_dynamicCast()) {
            break;
          }
          unint64_t v78 = v129;
          uint64_t v79 = v131;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v79[2] + 1, 1);
            uint64_t v79 = v131;
          }
          unint64_t v81 = v79[2];
          unint64_t v80 = v79[3];
          if (v81 >= v80 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v80 > 1, v81 + 1, 1);
            uint64_t v79 = v131;
          }
          v79[2] = v81 + 1;
          v79[v81 + 4] = v78;
          v77 += 32;
          if (!--v76) {
            goto LABEL_81;
          }
        }
        *(void *)&long long v129 = 0;
        BYTE8(v129) = 1;
        swift_bridgeObjectRelease();
        uint64_t result = swift_release();
      }
      else
      {
        uint64_t v79 = v131;
LABEL_81:
        swift_bridgeObjectRelease();
        AVLogColumns.rawValue.getter(v51);
        uint64_t v128 = v79;
        uint64_t v86 = v119;
        Column.init<A>(name:contents:)();
        DataFrame.append<A>(column:)();
        uint64_t result = (*v116)(v86, v120);
      }
    }
    else
    {
LABEL_57:
      unint64_t v67 = AVLogColumns.stringValues.unsafeMutableAddressor();
      uint64_t v68 = *v67;
      uint64_t v69 = *(void *)(*v67 + 16);
      if (v69)
      {
        lazy protocol witness table accessor for type AVLogColumns and conformance AVLogColumns();
        swift_bridgeObjectRetain();
        uint64_t v70 = 0;
        while (1)
        {
          LOBYTE(v128) = *(unsigned char *)(v68 + v70 + 32);
          LOBYTE(v129) = v51;
          if (dispatch thunk of static Equatable.== infix(_:_:)()) {
            break;
          }
          if (v69 == ++v70)
          {
            swift_bridgeObjectRelease();
            goto LABEL_62;
          }
        }
        swift_bridgeObjectRelease();
        long long v82 = specialized _arrayConditionalCast<A, B>(_:)((uint64_t)v60);
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v48 = v123;
        uint64_t v47 = v124;
        unint64_t v50 = v127;
        if (v82)
        {
          AVLogColumns.rawValue.getter(v51);
          uint64_t v128 = v82;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
          lazy protocol witness table accessor for type [Int] and conformance [A](&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String]);
          uint64_t v83 = v112;
          Column.init<A>(name:contents:)();
          DataFrame.append<A>(column:)();
          uint64_t result = (*v111)(v83, v113);
        }
        goto LABEL_32;
      }
LABEL_62:
      uint64_t v71 = AVLogColumns.dateValues.unsafeMutableAddressor();
      uint64_t v72 = *v71;
      uint64_t v73 = *(void *)(*v71 + 16);
      if (v73)
      {
        lazy protocol witness table accessor for type AVLogColumns and conformance AVLogColumns();
        swift_bridgeObjectRetain();
        uint64_t v74 = 0;
        while (1)
        {
          LOBYTE(v128) = *(unsigned char *)(v72 + v74 + 32);
          LOBYTE(v129) = v51;
          if (dispatch thunk of static Equatable.== infix(_:_:)()) {
            break;
          }
          if (v73 == ++v74)
          {
            swift_bridgeObjectRelease();
            goto LABEL_30;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v84 = specialized _arrayConditionalCast<A, B>(_:)((uint64_t)v60);
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v48 = v123;
        uint64_t v47 = v124;
        unint64_t v50 = v127;
        if (v84)
        {
          AVLogColumns.rawValue.getter(v51);
          uint64_t v128 = v84;
          uint64_t v85 = v109;
          Column.init<A>(name:contents:)();
          DataFrame.append<A>(column:)();
          uint64_t result = (*v103)(v85, v114);
        }
        goto LABEL_32;
      }
LABEL_30:
      uint64_t result = swift_bridgeObjectRelease();
    }
    int64_t v48 = v123;
    uint64_t v47 = v124;
    unint64_t v50 = v127;
LABEL_32:
    unint64_t v49 = v50 + 1;
    if (v49 == v126)
    {
      swift_bridgeObjectRelease();
      goto LABEL_84;
    }
  }
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
  return result;
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

uint64_t partial apply for closure #2 in AVLogReader.readFromBiome()(void *a1)
{
  swift_beginAccess();
  id v3 = a1;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return swift_endAccess();
}

void thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ()(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t AVLogReader.readCSVLogs(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v156 = a1;
  uint64_t v158 = type metadata accessor for URL();
  uint64_t v152 = *(char **)(v158 - 8);
  __chkstk_darwin(v158);
  uint64_t v151 = (char *)&v118 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = type metadata accessor for DataFrame();
  uint64_t v119 = *(void *)(v155 - 8);
  uint64_t v150 = v119;
  __chkstk_darwin(v155);
  uint64_t v173 = (char *)&v118 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v3 - 8);
  uint64_t v171 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v149 = (uint64_t)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v157 = (uint64_t)&v118 - v8;
  uint64_t v9 = type metadata accessor for Date();
  __chkstk_darwin(v9 - 8);
  uint64_t v168 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = type metadata accessor for Calendar.Identifier();
  unint64_t v165 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v164 = (char *)&v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Calendar();
  __chkstk_darwin(v12 - 8);
  uint64_t v163 = (char *)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TimeZone();
  __chkstk_darwin(v14 - 8);
  uint64_t v162 = (char *)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v16 - 8);
  uint64_t v161 = (char *)&v118 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Date.FormatString();
  __chkstk_darwin(v18 - 8);
  uint64_t v160 = (void (**)(char *, char *, uint64_t))((char *)&v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v159 = (void *)type metadata accessor for Date.FormatStyle.Symbol.DayPeriod.Width();
  *(void *)&long long v154 = *(v159 - 1);
  __chkstk_darwin(v159);
  uint64_t v147 = (char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = type metadata accessor for Date.FormatStyle.Symbol.DayPeriod();
  unint64_t v148 = *(void ***)(v153 - 8);
  __chkstk_darwin(v153);
  unsigned int v145 = (char *)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = (void (**)(uint64_t, char *, uint64_t))type metadata accessor for Date.FormatStyle.Symbol.Second();
  uint64_t v143 = (void (**)(char *, uint64_t))*(v144 - 1);
  __chkstk_darwin(v144);
  uint64_t v142 = (char *)&v118 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = type metadata accessor for Date.FormatStyle.Symbol.Minute();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v138 = (char *)&v118 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour.HourCycle();
  uint64_t v134 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  uint64_t v132 = (char *)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour.Clock();
  uint64_t v131 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v128 = (char *)&v118 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour();
  uint64_t v129 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  unint64_t v127 = (char *)&v118 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = type metadata accessor for Date.FormatStyle.Symbol.Year();
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  uint64_t v124 = (char *)&v118 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = type metadata accessor for Date.FormatStyle.Symbol.Day();
  uint64_t v122 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  uint64_t v121 = (char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = type metadata accessor for Date.FormatStyle.Symbol.Month();
  uint64_t v29 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v31 = (char *)&v118 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for Date.FormatString.StringInterpolation();
  __chkstk_darwin(v32 - 8);
  uint64_t v139 = type metadata accessor for Date.ParseStrategy();
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v136 = (char *)&v118 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for CSVType();
  uint64_t v35 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  unint64_t v37 = (char *)&v118 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = type metadata accessor for CSVReadingOptions();
  uint64_t v146 = *(void *)(v170 - 8);
  uint64_t v38 = __chkstk_darwin(v170);
  uint64_t v167 = (char *)&v118 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  uint64_t v41 = (char *)&v118 - v40;
  id v42 = [self defaultManager];
  URL._bridgeToObjectiveC()(v43);
  unint64_t v45 = v44;
  unint64_t v175 = 0;
  id v46 = [v42 contentsOfDirectoryAtURL:v44 includingPropertiesForKeys:0 options:0 error:&v175];

  id v47 = (id)v175;
  if (v46)
  {
    id v169 = v42;
    uint64_t v172 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v48 = v47;

    default argument 1 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
    default argument 2 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
    default argument 3 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
    (*(void (**)(char *, void, uint64_t))(v35 + 104))(v37, enum case for CSVType.double(_:), v34);
    CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
    Date.FormatString.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v49._uint64_t countAndFlagsBits = 0;
    v49._object = (void *)0xE000000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v49);
    static Date.FormatStyle.Symbol.Month.twoDigits.getter();
    Date.FormatString.StringInterpolation.appendInterpolation(month:)();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v120);
    v50._uint64_t countAndFlagsBits = 47;
    v50._object = (void *)0xE100000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v50);
    char v51 = v121;
    static Date.FormatStyle.Symbol.Day.twoDigits.getter();
    Date.FormatString.StringInterpolation.appendInterpolation(day:)();
    (*(void (**)(char *, uint64_t))(v122 + 8))(v51, v123);
    v52._uint64_t countAndFlagsBits = 47;
    v52._object = (void *)0xE100000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v52);
    uint64_t v53 = v124;
    static Date.FormatStyle.Symbol.Year.defaultDigits.getter();
    Date.FormatString.StringInterpolation.appendInterpolation(year:)();
    (*(void (**)(char *, uint64_t))(v125 + 8))(v53, v126);
    v54._uint64_t countAndFlagsBits = 8236;
    v54._object = (void *)0xE200000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v54);
    char v55 = v128;
    static Date.FormatStyle.Symbol.VerbatimHour.Clock.twelveHour.getter();
    char v56 = v132;
    static Date.FormatStyle.Symbol.VerbatimHour.HourCycle.zeroBased.getter();
    uint64_t v57 = v127;
    static Date.FormatStyle.Symbol.VerbatimHour.defaultDigits(clock:hourCycle:)();
    (*(void (**)(char *, uint64_t))(v134 + 8))(v56, v135);
    (*(void (**)(char *, uint64_t))(v131 + 8))(v55, v133);
    Date.FormatString.StringInterpolation.appendInterpolation(hour:)();
    (*(void (**)(char *, uint64_t))(v129 + 8))(v57, v130);
    v58._uint64_t countAndFlagsBits = 58;
    v58._object = (void *)0xE100000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v58);
    char v59 = v138;
    static Date.FormatStyle.Symbol.Minute.defaultDigits.getter();
    Date.FormatString.StringInterpolation.appendInterpolation(minute:)();
    (*(void (**)(char *, uint64_t))(v140 + 8))(v59, v141);
    v60._uint64_t countAndFlagsBits = 58;
    v60._object = (void *)0xE100000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v60);
    unint64_t v61 = v142;
    static Date.FormatStyle.Symbol.Second.defaultDigits.getter();
    Date.FormatString.StringInterpolation.appendInterpolation(second:)();
    v143[1](v61, (uint64_t)v144);
    v62._uint64_t countAndFlagsBits = 32;
    v62._object = (void *)0xE100000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v62);
    uint64_t v63 = v154;
    uint64_t v64 = v147;
    uint64_t v65 = v159;
    (*(void (**)(char *, void, void *))(v154 + 104))(v147, enum case for Date.FormatStyle.Symbol.DayPeriod.Width.wide(_:), v159);
    uint64_t v66 = v145;
    static Date.FormatStyle.Symbol.DayPeriod.standard(_:)();
    (*(void (**)(char *, void *))(v63 + 8))(v64, v65);
    Date.FormatString.StringInterpolation.appendInterpolation(dayPeriod:)();
    ((void (*)(char *, uint64_t))v148[1])(v66, v153);
    v67._uint64_t countAndFlagsBits = 0;
    v67._object = (void *)0xE000000000000000;
    Date.FormatString.StringInterpolation.appendLiteral(_:)(v67);
    Date.FormatString.init(stringInterpolation:)();
    uint64_t v68 = type metadata accessor for Locale();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v161, 1, 1, v68);
    static TimeZone.current.getter();
    unint64_t v69 = v165;
    uint64_t v70 = v164;
    uint64_t v71 = v166;
    (*(void (**)(char *, void, uint64_t))(v165 + 104))(v164, enum case for Calendar.Identifier.gregorian(_:), v166);
    Calendar.init(identifier:)();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
    Date.init(timeIntervalSince1970:)();
    uint64_t v72 = v136;
    Date.ParseStrategy.init(format:locale:timeZone:calendar:isLenient:twoDigitStartDate:)();
    lazy protocol witness table accessor for type Date.ParseStrategy and conformance Date.ParseStrategy();
    uint64_t v73 = v139;
    uint64_t v168 = v41;
    CSVReadingOptions.addDateParseStrategy<A>(_:)();
    (*(void (**)(char *, uint64_t))(v137 + 8))(v72, v73);
    uint64_t v74 = AVLogColumns.allValues.unsafeMutableAddressor();
    uint64_t v75 = *v74;
    int64_t v76 = *(void *)(*v74 + 16);
    uint64_t v77 = &_swiftEmptyArrayStorage;
    if (v76)
    {
      unint64_t v175 = (unint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v76, 0);
      uint64_t v78 = 0;
      uint64_t v77 = (void *)v175;
      uint64_t v79 = v155;
      do
      {
        uint64_t v80 = AVLogColumns.rawValue.getter(*(unsigned char *)(v75 + v78 + 32));
        uint64_t v82 = v81;
        unint64_t v175 = (unint64_t)v77;
        unint64_t v84 = v77[2];
        unint64_t v83 = v77[3];
        if (v84 >= v83 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v83 > 1, v84 + 1, 1);
          uint64_t v77 = (void *)v175;
        }
        ++v78;
        v77[2] = v84 + 1;
        uint64_t v85 = &v77[2 * v84];
        v85[4] = v80;
        v85[5] = v82;
      }
      while (v76 != v78);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v79 = v155;
    }
    uint64_t v92 = v150 + 56;
    unsigned int v145 = *(char **)(v150 + 56);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v145)(v157, 1, 1, v79);
    uint64_t v94 = v171;
    uint64_t v93 = v172;
    uint64_t v95 = v156;
    uint64_t v96 = v151;
    uint64_t v97 = v169;
    uint64_t v166 = *(void *)(v172 + 16);
    if (v166)
    {
      uint64_t v150 = v92;
      unint64_t v98 = 0;
      unint64_t v99 = v152;
      unint64_t v165 = v172 + ((v99[80] + 32) & ~(unint64_t)v99[80]);
      uint64_t v164 = v152 + 16;
      uint64_t v162 = v152 + 48;
      uint64_t v161 = v152 + 32;
      uint64_t v160 = (void (**)(char *, char *, uint64_t))(v146 + 16);
      uint64_t v147 = (char *)(v119 + 48);
      uint64_t v143 = (void (**)(char *, uint64_t))(v119 + 8);
      uint64_t v144 = (void (**)(uint64_t, char *, uint64_t))(v119 + 32);
      unint64_t v148 = (void **)(v77 + 5);
      uint64_t v163 = v152 + 56;
      uint64_t v142 = (char *)((unint64_t)(v152 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000);
      long long v154 = xmmword_100032B90;
      uint64_t v153 = 0x8000000100034140;
      uint64_t v100 = v158;
      do
      {
        if (v98 >= *(void *)(v93 + 16)) {
          goto LABEL_29;
        }
        (*((void (**)(char *, unint64_t, uint64_t))v99 + 2))(v94, v165 + *((void *)v99 + 9) * v98, v100);
        uint64_t v159 = (void *)*((void *)v99 + 7);
        ((void (*)(char *, void, uint64_t, uint64_t))v159)(v94, 0, 1, v100);
        if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v99 + 6))(v94, 1, v100) == 1) {
          goto LABEL_27;
        }
        (*(void (**)(char *, char *, uint64_t))v161)(v96, v94, v100);
        (*v160)(v167, v168, v170);
        specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
        DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
        uint64_t v101 = *(void *)(DataFrame.columns.getter() + 16);
        swift_bridgeObjectRelease();
        if (!v101) {
          goto LABEL_30;
        }
        unint64_t v102 = 0;
        char v103 = v148;
        do
        {
          unint64_t v175 = 0x206E6D756C6F43;
          unint64_t v176 = 0xE700000000000000;
          unint64_t v174 = v102;
          v104._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v104);
          swift_bridgeObjectRelease();
          if (v102 >= v77[2])
          {
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
          }
          unint64_t v105 = v175;
          uint64_t v106 = (void *)v176;
          uint64_t v108 = (uint64_t)*(v103 - 1);
          uint64_t v107 = *v103;
          swift_bridgeObjectRetain();
          v109._uint64_t countAndFlagsBits = v105;
          v109._object = v106;
          v110._uint64_t countAndFlagsBits = v108;
          v110._object = v107;
          DataFrame.renameColumn(_:to:)(v109, v110);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          ++v102;
          v103 += 2;
        }
        while (v101 != v102);
        uint64_t v111 = v157;
        uint64_t v112 = v149;
        outlined init with copy of Date?(v157, v149, &demangling cache variable for type metadata for DataFrame?);
        uint64_t v113 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v147;
        uint64_t v114 = v155;
        int v115 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))v147)(v112, 1, v155);
        outlined destroy of DataSlice?(v112, &demangling cache variable for type metadata for DataFrame?);
        unint64_t v99 = v152;
        if (v115 == 1)
        {
          outlined destroy of DataSlice?(v111, &demangling cache variable for type metadata for DataFrame?);
          (*v144)(v111, v173, v114);
          ((void (*)(uint64_t, void, uint64_t, uint64_t))v145)(v111, 0, 1, v114);
          uint64_t v95 = v156;
          uint64_t v100 = v158;
          uint64_t v96 = v151;
        }
        else
        {
          int v116 = v113(v111, 1, v114);
          uint64_t v95 = v156;
          uint64_t v100 = v158;
          uint64_t v96 = v151;
          if (v116)
          {
            (*v143)(v173, v114);
          }
          else
          {
            uint64_t v117 = v173;
            DataFrame.append(_:)();
            (*v143)(v117, v114);
          }
        }
        uint64_t v94 = v171;
        ++v98;
        uint64_t v97 = v169;
        uint64_t v93 = v172;
      }
      while (v98 != v166);
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v159)(v171, 1, 1, v100);
    }
    else
    {
      (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v152 + 7))(v171, 1, 1, v158);
    }
LABEL_27:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v146 + 8))(v168, v170);
    return outlined init with take of (offset: Int, element: DataFrame.Row)?(v157, v95, &demangling cache variable for type metadata for DataFrame?);
  }
  else
  {
    id v86 = (id)v175;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_100032B90;
    unint64_t v175 = 0;
    unint64_t v176 = 0xE000000000000000;
    _StringGuts.grow(_:)(30);
    swift_bridgeObjectRelease();
    unint64_t v175 = 0xD00000000000001CLL;
    unint64_t v176 = 0x8000000100034120;
    swift_getErrorValue();
    v88._uint64_t countAndFlagsBits = Error.localizedDescription.getter();
    String.append(_:)(v88);
    swift_bridgeObjectRelease();
    unint64_t v89 = v175;
    unint64_t v90 = v176;
    *(void *)(v87 + 56) = &type metadata for String;
    *(void *)(v87 + 32) = v89;
    *(void *)(v87 + 40) = v90;
    print(_:separator:terminator:)();

    swift_errorRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v150 + 56))(v156, 1, 1, v155);
  }
}

Swift::Int default argument 1 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100033160;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0xE000000000000000;
  *(void *)(inited + 48) = 1093619235;
  *(void *)(inited + 56) = 0xE400000000000000;
  *(void *)(inited + 64) = 0x412F4E20412F4E23;
  *(void *)(inited + 72) = 0xE800000000000000;
  *(void *)(inited + 80) = 4279843;
  *(void *)(inited + 88) = 0xE300000000000000;
  *(void *)(inited + 96) = 4271950;
  *(void *)(inited + 104) = 0xE300000000000000;
  *(void *)(inited + 112) = 16718;
  *(void *)(inited + 120) = 0xE200000000000000;
  *(void *)(inited + 128) = 1280070990;
  *(void *)(inited + 136) = 0xE400000000000000;
  *(void *)(inited + 144) = 6369134;
  *(void *)(inited + 152) = 0xE300000000000000;
  *(void *)(inited + 160) = 7104878;
  *(void *)(inited + 168) = 0xE300000000000000;
  *(void *)(inited + 176) = 1819047278;
  *(void *)(inited + 184) = 0xE400000000000000;
  Swift::Int v1 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

Swift::Int default argument 2 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100033170;
  *(void *)(inited + 32) = 49;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 48) = 1702195796;
  *(void *)(inited + 56) = 0xE400000000000000;
  *(void *)(inited + 64) = 1163219540;
  *(void *)(inited + 72) = 0xE400000000000000;
  *(void *)(inited + 80) = 1702195828;
  *(void *)(inited + 88) = 0xE400000000000000;
  Swift::Int v1 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

Swift::Int default argument 3 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100033170;
  *(void *)(inited + 32) = 48;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 48) = 0x65736C6146;
  *(void *)(inited + 56) = 0xE500000000000000;
  *(void *)(inited + 64) = 0x45534C4146;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = 0x65736C6166;
  *(void *)(inited + 88) = 0xE500000000000000;
  Swift::Int v1 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

unint64_t lazy protocol witness table accessor for type Date.ParseStrategy and conformance Date.ParseStrategy()
{
  unint64_t result = lazy protocol witness table cache variable for type Date.ParseStrategy and conformance Date.ParseStrategy;
  if (!lazy protocol witness table cache variable for type Date.ParseStrategy and conformance Date.ParseStrategy)
  {
    type metadata accessor for Date.ParseStrategy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Date.ParseStrategy and conformance Date.ParseStrategy);
  }
  return result;
}

void *specialized _arrayConditionalCast<A, B>(_:)(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = &_swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      outlined init with copy of Date?(i, (uint64_t)v11, &demangling cache variable for type metadata for Any?);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v12;
      }
      v3[2] = v6 + 1;
      uint64_t v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  void (**v13)(char *, uint64_t, uint64_t, uint64_t);
  void (**v14)(char *, char *, uint64_t);
  int v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v24;
  uint64_t v25;
  char *v26;
  char v27[32];
  void *v28;

  int64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = type metadata accessor for Date();
  unint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v26 = (char *)&v24 - v10;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v28 = &_swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11, 0);
  if (!v11) {
    return v28;
  }
  uint64_t v12 = a1 + 32;
  uint64_t v13 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v14 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v24 = v9;
  uint64_t v25 = v6;
  while (1)
  {
    outlined init with copy of Date?(v12, (uint64_t)v27, &demangling cache variable for type metadata for Any?);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
    uint64_t v15 = swift_dynamicCast();
    uint64_t v16 = *v13;
    if (!v15) {
      break;
    }
    v16(v4, 0, 1, v5);
    uint64_t v17 = *v14;
    uint64_t v18 = v26;
    (*v14)(v26, v4, v5);
    v17(v9, v18, v5);
    uint64_t v19 = v28;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v19[2] + 1, 1);
      uint64_t v19 = v28;
    }
    uint64_t v21 = v19[2];
    uint64_t v20 = v19[3];
    if (v21 >= v20 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1);
      uint64_t v19 = v28;
    }
    void v19[2] = v21 + 1;
    uint64_t v22 = (unint64_t)v19
        + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))
        + *(void *)(v25 + 72) * v21;
    uint64_t v9 = v24;
    v17((char *)v22, v24, v5);
    uint64_t v28 = v19;
    v12 += 32;
    if (!--v11) {
      return v19;
    }
  }
  v16(v4, 1, 1, v5);
  swift_release();
  outlined destroy of DataSlice?((uint64_t)v4, &demangling cache variable for type metadata for Date?);
  return 0;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(void *result, uint64_t a2)
{
  uint64_t v2 = a2 - (void)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v2 == -1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v5 = (uint64_t)result;
  if (v3 <= 0)
  {
    unint64_t v6 = &_swiftEmptyArrayStorage;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
    unint64_t v6 = (void *)swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 25;
    }
    v6[2] = v3;
    v6[3] = 2 * (v8 >> 3);
  }
  unint64_t result = (void *)specialized Sequence._copyContents(initializing:)((uint64_t)&v9, (uint64_t)(v6 + 4), v3, v5, a2);
  if (result == (void *)v3) {
    return v6;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
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

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t type metadata accessor for AVLogReader()
{
  return self;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Date>);
  uint64_t v10 = *(void *)(type metadata accessor for Date() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Date() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any?>);
    uint64_t v10 = (void *)swift_allocObject();
    uint64_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 1;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  uint64_t v13 = (unint64_t)(v10 + 4);
  size_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
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
  void *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[AnyHashable : Any]>);
    uint64_t v10 = (void *)swift_allocObject();
    uint64_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  uint64_t v13 = (unint64_t)(v10 + 4);
  size_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
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
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
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

uint64_t specialized Sequence._copyContents(initializing:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    BOOL v7 = 0;
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    BOOL v7 = 0;
LABEL_14:
    uint64_t v8 = a4;
LABEL_15:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(void *)(result + 16) = v8;
    *(unsigned char *)(result + 24) = v7;
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_17;
  }
  uint64_t v5 = 0;
  uint64_t v6 = a4;
  while (1)
  {
    BOOL v7 = v6 == a5;
    if (v6 != a5) {
      break;
    }
    uint64_t v8 = 0;
LABEL_8:
    *(void *)(a2 + 8 * v5) = v6;
    if (a3 - 1 == v5) {
      goto LABEL_15;
    }
    ++v5;
    BOOL v9 = v6 == a5;
    uint64_t v6 = v8;
    if (v9)
    {
      BOOL v7 = 1;
      a3 = v5;
      goto LABEL_15;
    }
  }
  uint64_t v8 = v6 + 1;
  if (!__OFADD__(v6, 1)) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
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
    uint64_t v6 = a1 + 32;
    while (1)
    {
      BOOL v7 = (uint64_t *)(v6 + 16 * v4);
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v12 = result & ~v11;
      unint64_t v13 = v12 >> 6;
      uint64_t v14 = *(void *)(v5 + 8 * (v12 >> 6));
      uint64_t v15 = 1 << v12;
      if (((1 << v12) & v14) != 0)
      {
        uint64_t v16 = *(void *)(v3 + 48);
        unint64_t v17 = (void *)(v16 + 16 * v12);
        BOOL v18 = *v17 == v9 && v17[1] == v8;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v19 = ~v11;
        while (1)
        {
          unint64_t v12 = (v12 + 1) & v19;
          unint64_t v13 = v12 >> 6;
          uint64_t v14 = *(void *)(v5 + 8 * (v12 >> 6));
          uint64_t v15 = 1 << v12;
          if ((v14 & (1 << v12)) == 0) {
            break;
          }
          uint64_t v20 = (void *)(v16 + 16 * v12);
          if (*v20 != v9 || v20[1] != v8)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v13) = v15 | v14;
      unint64_t v22 = (void *)(*(void *)(v3 + 48) + 16 * v12);
      *unint64_t v22 = v9;
      v22[1] = v8;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v25;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t outlined assign with take of DataFrame?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t lazy protocol witness table accessor for type [Int] and conformance [A](unint64_t *a1, uint64_t *a2)
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

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ExpectedFilterFunctions.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x7265746C6966;
  }
  if (a1 == 1) {
    return 0xD00000000000001CLL;
  }
  return 0xD000000000000010;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpectedFilterFunctions(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD00000000000001CLL;
    }
    else {
      unint64_t v3 = 0xD000000000000010;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x80000001000341A0;
    }
    else {
      unint64_t v4 = 0x80000001000341C0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD00000000000001CLL;
      }
      else {
        unint64_t v6 = 0xD000000000000010;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x80000001000341A0;
      }
      else {
        unint64_t v7 = 0x80000001000341C0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    unint64_t v3 = 0x7265746C6966;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x7265746C6966)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpectedFilterFunctions()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ExpectedFilterFunctions()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpectedFilterFunctions()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedFilterFunctions@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of ExpectedFilterFunctions.init(rawValue:);
  unint64_t result = specialized ExpectedFilterFunctions.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ExpectedFilterFunctions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ExpectedFilterFunctions.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ExpectedFilterFunctionArguments.rawValue.getter(char a1)
{
  return *(void *)&aPropertyvalue[8 * a1];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpectedFilterFunctionArguments(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpectedFilterFunctionArguments()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ExpectedFilterFunctionArguments()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpectedFilterFunctionArguments()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ExpectedFilterFunctionArguments@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of ExpectedFilterFunctionArguments.init(rawValue:);
  unint64_t result = specialized ExpectedFilterFunctions.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ExpectedFilterFunctionArguments@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ExpectedFilterFunctionArguments.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t static FilterFunctions.run(dataSampleFilter:on:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for DataFrame();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = ((char *)&v25 - v15);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v32 = v11 + 16;
  v31((char *)&v25 - v15, a4, v10);
  uint64_t v17 = *(void *)(a3 + 16);
  if (v17)
  {
    uint64_t v26 = a5;
    uint64_t v27 = v11;
    uint64_t v28 = a1;
    uint64_t v29 = a2;
    BOOL v18 = (void (**)(NSObject *, uint64_t))(v11 + 8);
    uint64_t v19 = (void (**)(NSObject *, char *, uint64_t))(v11 + 32);
    swift_bridgeObjectRetain();
    uint64_t v30 = a3;
    uint64_t v20 = (uint64_t *)(a3 + 48);
    do
    {
      uint64_t v21 = (char *)*(v20 - 2);
      unint64_t v22 = *(v20 - 1);
      uint64_t v23 = *v20;
      v20 += 3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      static FilterFunctions.runFilter(function:on:)(v21, v22, v23, v16, (uint64_t)v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*v18)(v16, v10);
      (*v19)(v16, v14, v10);
      --v17;
    }
    while (v17);
    a3 = v30;
    swift_bridgeObjectRelease();
    a1 = v28;
    a2 = v29;
    a5 = v26;
    uint64_t v11 = v27;
  }
  v31(v14, (uint64_t)v16, v10);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  DataSlice.init(dataSliceName:dataFrame:filterDescription:)(a1, a2, (uint64_t)v14, a1, a2, a3, a5);
  return (*(uint64_t (**)(NSObject *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t static FilterFunctions.runFilter(function:on:)@<X0>(char *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, NSObject *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v121 = a5;
  os_log_t v122 = a4;
  uint64_t v8 = type metadata accessor for DataFrame.Rows();
  uint64_t v114 = *(void *)(v8 - 8);
  uint64_t v115 = v8;
  __chkstk_darwin(v8);
  uint64_t v113 = &v104[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = &v104[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = &v104[-v16];
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = &v104[-v19];
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = &v104[-v22];
  __chkstk_darwin(v21);
  uint64_t v117 = &v104[-v24];
  uint64_t v25 = type metadata accessor for DataFrame();
  uint64_t v119 = *(void *)(v25 - 8);
  uint64_t v120 = v25;
  uint64_t v26 = __chkstk_darwin(v25);
  int v116 = &v104[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v28 = __chkstk_darwin(v26);
  __chkstk_darwin(v28);
  uint64_t v118 = &v104[-v30];
  if (a1 == (char *)0x7265746C6966 && a2 == 0xE600000000000000
    || (v31 = v29, v32 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t v29 = v31, (v32 & 1) != 0))
  {
    if (!*(void *)(a3 + 16)
      || (uint64_t v33 = v29,
          unint64_t v34 = specialized __RawDictionaryStorage.find<A>(_:)(0x79747265706F7270, 0xE800000000000000),
          (v35 & 1) == 0))
    {
      uint64_t v118 = a1;
      uint64_t v75 = Logger.filterFunction.unsafeMutableAddressor();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v17, v75, v10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      int64_t v76 = Logger.logObject.getter();
      os_log_type_t v77 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v76, v77))
      {
        uint64_t v78 = (uint8_t *)swift_slowAlloc();
        v123[0] = swift_slowAlloc();
        uint64_t v112 = (unsigned char *)v10;
        *(_DWORD *)uint64_t v78 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v118, a2, v123);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v76, v77, "Missing 'property' argument in 'filter' named %s.", v78, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(unsigned char *, unsigned char *))(v11 + 8))(v17, v112);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v17, v10);
      }
      return (*(uint64_t (**)(uint64_t, os_log_t, uint64_t))(v119 + 16))(v121, v122, v120);
    }
    if (*(void *)(a3 + 16))
    {
      uint64_t v112 = v23;
      uint64_t v36 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v34);
      uint64_t v38 = *v36;
      unint64_t v37 = (void (**)(char *, void))v36[1];
      swift_bridgeObjectRetain();
      unint64_t v39 = specialized __RawDictionaryStorage.find<A>(_:)(0x65756C6176, 0xE500000000000000);
      if (v40)
      {
        if (*(void *)(a3 + 16))
        {
          uint64_t v41 = v38;
          id v42 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v39);
          uint64_t v43 = v42[1];
          uint64_t v110 = *v42;
          swift_bridgeObjectRetain();
          unint64_t v44 = specialized __RawDictionaryStorage.find<A>(_:)(0x6F6974617265706FLL, 0xE90000000000006ELL);
          if (v45)
          {
            id v46 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v44);
            uint64_t v47 = v10;
            uint64_t v49 = *v46;
            unint64_t v48 = v46[1];
            v123[3] = (uint64_t)&type metadata for String;
            v123[0] = v110;
            v123[1] = (uint64_t)v43;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            Swift::String v50 = v118;
            os_log_t v51 = v122;
            uint64_t v52 = v41;
            unint64_t v53 = v48;
            uint64_t v107 = (uint64_t *)v52;
            uint64_t v108 = v49;
            static FilterFunctions.filter(samples:on:value:operation:)((uint64_t)v122, v52, v37, (uint64_t)v123, v49, v48, v118);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v123);
            uint64_t v54 = Logger.filterFunction.unsafeMutableAddressor();
            char v55 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16);
            uint64_t v112 = (unsigned char *)v47;
            v55(v117, v54, v47);
            uint64_t v56 = v119;
            uint64_t v111 = v11;
            uint64_t v57 = *(void (**)(uint64_t, os_log_t, uint64_t))(v119 + 16);
            Swift::String v109 = v33;
            os_log_t v58 = v51;
            uint64_t v59 = v120;
            v57((uint64_t)v33, v58, v120);
            Swift::String v60 = v116;
            v57((uint64_t)v116, (os_log_t)v50, v59);
            swift_bridgeObjectRetain();
            os_log_t v122 = v43;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v61 = Logger.logObject.getter();
            os_log_type_t v62 = static os_log_type_t.info.getter();
            int v63 = v62;
            if (os_log_type_enabled(v61, v62))
            {
              uint64_t v64 = swift_slowAlloc();
              uint64_t v106 = swift_slowAlloc();
              v123[0] = v106;
              *(_DWORD *)uint64_t v64 = 136316162;
              int v105 = v63;
              swift_bridgeObjectRetain();
              uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v107, (unint64_t)v37, v123);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v64 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v108, v53, v123);
              uint64_t v107 = &v125;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v64 + 22) = 2080;
              os_log_t v65 = v122;
              swift_bridgeObjectRetain();
              uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v110, (unint64_t)v65, v123);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v64 + 32) = 2048;
              uint64_t v110 = v64 + 34;
              uint64_t v66 = v60;
              Swift::String v67 = v113;
              uint64_t v68 = v109;
              DataFrame.rows.getter();
              uint64_t v69 = DataFrame.Rows.count.getter();
              uint64_t v70 = *(void (**)(unsigned char *, uint64_t))(v114 + 8);
              os_log_t v122 = v61;
              uint64_t v71 = v115;
              v70(v67, v115);
              uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v119 + 8);
              v72((uint64_t)v68, v120);
              uint64_t v124 = v69;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v64 + 42) = 2048;
              uint64_t v114 = v64 + 44;
              DataFrame.rows.getter();
              uint64_t v73 = DataFrame.Rows.count.getter();
              v70(v67, v71);
              v72((uint64_t)v66, v120);
              uint64_t v124 = v73;
              uint64_t v59 = v120;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              os_log_t v74 = v122;
              _os_log_impl((void *)&_mh_execute_header, v122, (os_log_type_t)v105, "'%s %s %s' reduces data samples from %ld samples to %ld samples.", (uint8_t *)v64, 0x34u);
              swift_arrayDestroy();
              swift_slowDealloc();
              uint64_t v56 = v119;
              swift_slowDealloc();
            }
            else
            {
              char v103 = *(void (**)(unsigned char *, uint64_t))(v56 + 8);
              v103(v60, v59);
              v103(v109, v59);

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
            }
            (*(void (**)(unsigned char *, unsigned char *))(v111 + 8))(v117, v112);
            return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v56 + 32))(v121, v118, v59);
          }
          swift_bridgeObjectRelease();
        }
        uint64_t v118 = a1;
        swift_bridgeObjectRelease();
        uint64_t v91 = Logger.filterFunction.unsafeMutableAddressor();
        uint64_t v92 = v112;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v112, v91, v10);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v93 = Logger.logObject.getter();
        os_log_type_t v94 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v93, v94))
        {
          uint64_t v95 = (uint8_t *)swift_slowAlloc();
          v123[0] = swift_slowAlloc();
          uint64_t v111 = v11;
          *(_DWORD *)uint64_t v95 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v118, a2, v123);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v93, v94, "Missing 'operation' argument in 'filter' named %s.", v95, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(unsigned char *, uint64_t))(v111 + 8))(v92, v10);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v92, v10);
        }
        return (*(uint64_t (**)(uint64_t, os_log_t, uint64_t))(v119 + 16))(v121, v122, v120);
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v82 = Logger.filterFunction.unsafeMutableAddressor();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v20, v82, v10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v83 = Logger.logObject.getter();
    os_log_type_t v84 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = swift_slowAlloc();
      uint64_t v118 = (char *)a3;
      uint64_t v86 = (uint64_t)a1;
      uint64_t v87 = (uint8_t *)v85;
      uint64_t v88 = swift_slowAlloc();
      uint64_t v111 = v11;
      v123[0] = v88;
      *(_DWORD *)uint64_t v87 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v86, a2, v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Missing 'value' argument in 'filter' named %s.", v87, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v111 + 8))(v20, v10);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v20, v10);
    }
    return (*(uint64_t (**)(uint64_t, os_log_t, uint64_t))(v119 + 16))(v121, v122, v120);
  }
  if (a1 == (char *)0xD00000000000001CLL && a2 == 0x80000001000341A0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v81 = v121;
    os_log_t v80 = v122;
    return static FilterFunctions.newSamplesSinceLastPluginRun(samples:)(v80, v81);
  }
  else
  {
    if ((a1 != (char *)0xD000000000000010 || a2 != 0x80000001000341C0)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v96 = Logger.filterFunction.unsafeMutableAddressor();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v14, v96, v10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v97 = Logger.logObject.getter();
      os_log_type_t v98 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v97, v98))
      {
        uint64_t v99 = swift_slowAlloc();
        uint64_t v118 = (char *)a3;
        uint64_t v100 = (uint64_t)a1;
        uint64_t v101 = (uint8_t *)v99;
        uint64_t v102 = swift_slowAlloc();
        uint64_t v111 = v11;
        v123[0] = v102;
        *(_DWORD *)uint64_t v101 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v100, a2, v123);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v97, v98, "ERROR: Could not find filter function '%s'.", v101, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(unsigned char *, uint64_t))(v111 + 8))(v14, v10);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v14, v10);
      }
      return (*(uint64_t (**)(uint64_t, os_log_t, uint64_t))(v119 + 16))(v121, v122, v120);
    }
    uint64_t v90 = v121;
    os_log_t v89 = v122;
    return static FilterFunctions.samplesFromToday(samples:)((uint64_t)v89, v90);
  }
}

uint64_t static FilterFunctions.filter(samples:on:value:operation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (**a3)(char *, void)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, char *a7@<X8>)
{
  unint64_t v176 = a6;
  uint64_t v174 = a5;
  uint64_t v178 = a4;
  uint64_t v179 = a7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v10 - 8);
  uint64_t v171 = (char *)&v161 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = type metadata accessor for Date();
  uint64_t v168 = *(void *)(v169 - 8);
  __chkstk_darwin(v169);
  uint64_t v165 = (uint64_t)&v161 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = type metadata accessor for Logger();
  uint64_t v13 = *(void (***)(char *, void))(v177 - 8);
  uint64_t v14 = __chkstk_darwin(v177);
  uint64_t v173 = (char *)&v161 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v167 = (char *)&v161 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v164 = (char *)&v161 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v162 = (char *)&v161 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v170 = (char *)&v161 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v166 = (char *)&v161 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v163 = (char *)&v161 - v27;
  __chkstk_darwin(v26);
  unint64_t v175 = (char *)&v161 - v28;
  uint64_t v29 = AVLogColumns.stringValues.unsafeMutableAddressor();
  uint64_t v30 = *v29;
  int64_t v31 = *(void *)(*v29 + 16);
  char v32 = &_swiftEmptyArrayStorage;
  uint64_t v180 = a2;
  if (v31)
  {
    uint64_t v172 = a3;
    uint64_t v33 = v13;
    v184[0] = (uint64_t)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v31, 0);
    uint64_t v34 = 0;
    char v32 = (void *)v184[0];
    do
    {
      uint64_t v35 = AVLogColumns.rawValue.getter(*(unsigned char *)(v30 + v34 + 32));
      uint64_t v37 = v36;
      v184[0] = (uint64_t)v32;
      unint64_t v39 = v32[2];
      unint64_t v38 = v32[3];
      if (v39 >= v38 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
        char v32 = (void *)v184[0];
      }
      ++v34;
      v32[2] = v39 + 1;
      char v40 = &v32[2 * v39];
      uint64_t v40[4] = v35;
      v40[5] = v37;
    }
    while (v31 != v34);
    swift_bridgeObjectRelease();
    uint64_t v13 = v33;
    a3 = v172;
    a2 = v180;
  }
  char v41 = specialized Sequence<>.contains(_:)(a2, (uint64_t)a3, v32);
  swift_bridgeObjectRelease();
  if (v41)
  {
    uint64_t v42 = v178;
    outlined init with copy of Any(v178, (uint64_t)v184);
    if (swift_dynamicCast())
    {
      uint64_t v43 = v181;
      uint64_t v44 = v182;
      specialized static FilterFunctions.operatorFromString<A>(_:for:)(v174, v176);
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = specialized closure #1 in static FilterFunctions.operatorFromString<A>(_:for:);
      *(void *)(v45 + 24) = 0;
      uint64_t v46 = __chkstk_darwin(v45);
      *(&v161 - 2) = (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed String, @in_guaranteed String) -> (@unowned Bool);
      *(&v161 - 1) = v46;
      specialized static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(a1, a2, a3, v43, v44, (uint64_t)(&v161 - 4), (uint64_t)v179);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t v68 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v69 = v175;
    uint64_t v70 = v177;
    ((void (*)(char *, uint64_t, uint64_t))v13[2])(v175, v68, v177);
    outlined init with copy of Any(v42, (uint64_t)v184);
    uint64_t v71 = Logger.logObject.getter();
    os_log_type_t v72 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      uint64_t v74 = swift_slowAlloc();
      uint64_t v172 = v13;
      uint64_t v183 = v74;
      *(_DWORD *)uint64_t v73 = 136315138;
      outlined init with copy of Any((uint64_t)v184, (uint64_t)&v181);
      uint64_t v75 = String.init<A>(describing:)();
      uint64_t v181 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v76, &v183);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "Could not parse value '%s' as String.", v73, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v172[1](v175, v70);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);

      v13[1](v69, v70);
    }
    goto LABEL_56;
  }
  unint64_t v48 = AVLogColumns.intValues.unsafeMutableAddressor();
  uint64_t v49 = *v48;
  int64_t v50 = *(void *)(*v48 + 16);
  os_log_t v51 = &_swiftEmptyArrayStorage;
  if (v50)
  {
    uint64_t v172 = v13;
    v184[0] = (uint64_t)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v50, 0);
    uint64_t v52 = 0;
    os_log_t v51 = (void *)v184[0];
    do
    {
      uint64_t v53 = AVLogColumns.rawValue.getter(*(unsigned char *)(v49 + v52 + 32));
      uint64_t v55 = v54;
      v184[0] = (uint64_t)v51;
      unint64_t v57 = v51[2];
      unint64_t v56 = v51[3];
      if (v57 >= v56 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v56 > 1, v57 + 1, 1);
        os_log_t v51 = (void *)v184[0];
      }
      ++v52;
      v51[2] = v57 + 1;
      os_log_t v58 = &v51[2 * v57];
      v58[4] = v53;
      v58[5] = v55;
    }
    while (v50 != v52);
    swift_bridgeObjectRelease();
    a2 = v180;
    uint64_t v13 = v172;
  }
  char v59 = specialized Sequence<>.contains(_:)(a2, (uint64_t)a3, v51);
  swift_bridgeObjectRelease();
  if ((v59 & 1) == 0)
  {
    os_log_type_t v77 = AVLogColumns.dateValues.unsafeMutableAddressor();
    uint64_t v78 = *v77;
    int64_t v79 = *(void *)(*v77 + 16);
    os_log_t v80 = &_swiftEmptyArrayStorage;
    if (v79)
    {
      unint64_t v175 = (char *)a1;
      uint64_t v81 = a3;
      uint64_t v82 = v13;
      v184[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v79, 0);
      uint64_t v83 = 0;
      os_log_t v80 = (void *)v184[0];
      do
      {
        uint64_t v84 = AVLogColumns.rawValue.getter(*(unsigned char *)(v78 + v83 + 32));
        uint64_t v86 = v85;
        v184[0] = (uint64_t)v80;
        unint64_t v88 = v80[2];
        unint64_t v87 = v80[3];
        if (v88 >= v87 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v87 > 1, v88 + 1, 1);
          os_log_t v80 = (void *)v184[0];
        }
        ++v83;
        v80[2] = v88 + 1;
        os_log_t v89 = &v80[2 * v88];
        v89[4] = v84;
        v89[5] = v86;
      }
      while (v79 != v83);
      swift_bridgeObjectRelease();
      uint64_t v13 = v82;
      a3 = v81;
      a1 = (uint64_t)v175;
      a2 = v180;
    }
    char v90 = specialized Sequence<>.contains(_:)(a2, (uint64_t)a3, v80);
    swift_bridgeObjectRelease();
    uint64_t v91 = v177;
    uint64_t v92 = v173;
    uint64_t v93 = v171;
    if (v90)
    {
      uint64_t v94 = v178;
      outlined init with copy of Any(v178, (uint64_t)v184);
      if (swift_dynamicCast())
      {
        static FilterFunctions.convertStringToDate(_:)(v93);
        swift_bridgeObjectRelease();
        uint64_t v95 = v168;
        uint64_t v96 = v169;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v168 + 48))(v93, 1, v169) == 1)
        {
          outlined destroy of Date?((uint64_t)v93);
          uint64_t v97 = Logger.filterFunction.unsafeMutableAddressor();
          os_log_type_t v98 = v164;
          ((void (*)(char *, uint64_t, uint64_t))v13[2])(v164, v97, v91);
          uint64_t v99 = Logger.logObject.getter();
          os_log_type_t v100 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v99, v100))
          {
            uint64_t v101 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v101 = 0;
            _os_log_impl((void *)&_mh_execute_header, v99, v100, "Could not parse String value as Date value.", v101, 2u);
            swift_slowDealloc();
          }

          v13[1](v98, v91);
          goto LABEL_56;
        }
        (*(void (**)(uint64_t, char *, uint64_t))(v95 + 32))(v165, v93, v96);
        if (v174 == 15677)
        {
          uint64_t v130 = specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:);
          if (v176 == 0xE200000000000000) {
            goto LABEL_62;
          }
        }
        uint64_t v131 = v174;
        char v132 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v133 = specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:);
        if (v132) {
          goto LABEL_53;
        }
        if (v131 == 60)
        {
          uint64_t v130 = specialized closure #3 in static FilterFunctions.operatorFromString<A>(_:for:);
          if (v176 == 0xE100000000000000) {
            goto LABEL_62;
          }
        }
        char v148 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v133 = specialized closure #3 in static FilterFunctions.operatorFromString<A>(_:for:);
        if (v148) {
          goto LABEL_53;
        }
        if (v131 == 62)
        {
          uint64_t v130 = specialized closure #4 in static FilterFunctions.operatorFromString<A>(_:for:);
          if (v176 == 0xE100000000000000) {
            goto LABEL_62;
          }
        }
        char v149 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v133 = specialized closure #4 in static FilterFunctions.operatorFromString<A>(_:for:);
        if (v149) {
          goto LABEL_53;
        }
        if (v131 == 15676)
        {
          uint64_t v130 = specialized closure #5 in static FilterFunctions.operatorFromString<A>(_:for:);
          if (v176 == 0xE200000000000000) {
            goto LABEL_62;
          }
        }
        char v150 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v133 = specialized closure #5 in static FilterFunctions.operatorFromString<A>(_:for:);
        if (v150)
        {
LABEL_53:
          uint64_t v130 = v133;
        }
        else
        {
          if (v131 == 15678)
          {
            uint64_t v130 = specialized closure #6 in static FilterFunctions.operatorFromString<A>(_:for:);
            if (v176 == 0xE200000000000000) {
              goto LABEL_62;
            }
          }
          uint64_t v151 = a1;
          char v152 = _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t v153 = specialized closure #6 in static FilterFunctions.operatorFromString<A>(_:for:);
          if ((v152 & 1) == 0)
          {
            if (v174 == 15649)
            {
              uint64_t v130 = specialized closure #7 in static FilterFunctions.operatorFromString<A>(_:for:);
              if (v176 == 0xE200000000000000) {
                goto LABEL_62;
              }
            }
            char v154 = _stringCompareWithSmolCheck(_:_:expecting:)();
            uint64_t v153 = specialized closure #7 in static FilterFunctions.operatorFromString<A>(_:for:);
            if ((v154 & 1) == 0)
            {
              uint64_t v155 = Logger.filterFunction.unsafeMutableAddressor();
              ((void (*)(char *, uint64_t, uint64_t))v13[2])(v162, v155, v177);
              swift_bridgeObjectRetain_n();
              uint64_t v156 = Logger.logObject.getter();
              os_log_type_t v157 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v156, v157))
              {
                uint64_t v158 = (uint8_t *)swift_slowAlloc();
                v184[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v158 = 136315138;
                unint64_t v159 = v176;
                swift_bridgeObjectRetain();
                uint64_t v181 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v174, v159, v184);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease_n();
                _os_log_impl((void *)&_mh_execute_header, v156, v157, "Could not parse operator '%s'.", v158, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {
                swift_bridgeObjectRelease_n();
              }

              v13[1](v162, v177);
              (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v165, v169);
              uint64_t v160 = type metadata accessor for DataFrame();
              return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v160 - 8) + 16))(v179, v151, v160);
            }
          }
          uint64_t v130 = v153;
        }
LABEL_62:
        uint64_t v137 = v165;
        specialized static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(a1, a2, a3, v165, (uint64_t)v130, (uint64_t)v179);
        (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v137, v169);
        return _sxq_SbRi_zRi0_zRi__Ri0__r0_ly10Foundation4DateVACIsegnnd_SgWOe((uint64_t)v130);
      }
      uint64_t v123 = Logger.filterFunction.unsafeMutableAddressor();
      uint64_t v92 = v167;
      ((void (*)(char *, uint64_t, uint64_t))v13[2])(v167, v123, v91);
      outlined init with copy of Any(v94, (uint64_t)v184);
      uint64_t v124 = Logger.logObject.getter();
      os_log_type_t v125 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v124, v125))
      {
        uint64_t v126 = (uint8_t *)swift_slowAlloc();
        uint64_t v183 = swift_slowAlloc();
        *(_DWORD *)uint64_t v126 = 136315138;
        outlined init with copy of Any((uint64_t)v184, (uint64_t)&v181);
        uint64_t v127 = String.init<A>(describing:)();
        unint64_t v175 = (char *)a1;
        uint64_t v181 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v127, v128, &v183);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
        _os_log_impl((void *)&_mh_execute_header, v124, v125, "Could not parse value '%s' as String.", v126, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        a1 = (uint64_t)v175;
        v13[1](v167, v91);
        goto LABEL_56;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
    }
    else
    {
      uint64_t v111 = Logger.filterFunction.unsafeMutableAddressor();
      ((void (*)(char *, uint64_t, uint64_t))v13[2])(v92, v111, v91);
      swift_bridgeObjectRetain_n();
      uint64_t v112 = Logger.logObject.getter();
      os_log_type_t v113 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v112, v113))
      {
        uint64_t v114 = (uint8_t *)swift_slowAlloc();
        v184[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v114 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v181 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, (unint64_t)a3, v184);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "No field '%s' available for filtering.", v114, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v13[1](v173, v177);
LABEL_56:
        uint64_t v134 = type metadata accessor for DataFrame();
        return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v134 - 8) + 16))(v179, a1, v134);
      }

      swift_bridgeObjectRelease_n();
    }
    v13[1](v92, v91);
    goto LABEL_56;
  }
  uint64_t v60 = v178;
  outlined init with copy of Any(v178, (uint64_t)v184);
  if (swift_dynamicCast())
  {
    uint64_t v61 = specialized FixedWidthInteger.init(_:)(v181, v182);
    if (v62)
    {
      uint64_t v115 = Logger.filterFunction.unsafeMutableAddressor();
      int v116 = v13;
      uint64_t v117 = (void (*)(char *, uint64_t, uint64_t))v13[2];
      uint64_t v118 = v166;
      uint64_t v119 = v177;
      v117(v166, v115, v177);
      uint64_t v120 = Logger.logObject.getter();
      os_log_type_t v121 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v120, v121))
      {
        os_log_t v122 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_t v122 = 0;
        _os_log_impl((void *)&_mh_execute_header, v120, v121, "Could not parse String value as Int value.", v122, 2u);
        swift_slowDealloc();
      }

      v116[1](v118, v119);
      goto LABEL_56;
    }
    uint64_t v63 = v61;
    if (v174 == 15677)
    {
      uint64_t v64 = specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:);
      if (v176 == 0xE200000000000000) {
        goto LABEL_59;
      }
    }
    uint64_t v65 = v174;
    char v66 = _stringCompareWithSmolCheck(_:_:expecting:)();
    Swift::String v67 = specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:);
    if ((v66 & 1) == 0)
    {
      if (v65 == 60)
      {
        uint64_t v64 = specialized closure #3 in static FilterFunctions.operatorFromString<A>(_:for:);
        if (v176 == 0xE100000000000000) {
          goto LABEL_59;
        }
      }
      char v138 = _stringCompareWithSmolCheck(_:_:expecting:)();
      Swift::String v67 = specialized closure #3 in static FilterFunctions.operatorFromString<A>(_:for:);
      if ((v138 & 1) == 0)
      {
        if (v65 == 62)
        {
          uint64_t v64 = specialized closure #4 in static FilterFunctions.operatorFromString<A>(_:for:);
          if (v176 == 0xE100000000000000) {
            goto LABEL_59;
          }
        }
        char v139 = _stringCompareWithSmolCheck(_:_:expecting:)();
        Swift::String v67 = specialized closure #4 in static FilterFunctions.operatorFromString<A>(_:for:);
        if ((v139 & 1) == 0)
        {
          if (v65 == 15676)
          {
            uint64_t v64 = specialized closure #5 in static FilterFunctions.operatorFromString<A>(_:for:);
            if (v176 == 0xE200000000000000) {
              goto LABEL_59;
            }
          }
          char v140 = _stringCompareWithSmolCheck(_:_:expecting:)();
          Swift::String v67 = specialized closure #5 in static FilterFunctions.operatorFromString<A>(_:for:);
          if ((v140 & 1) == 0)
          {
            if (v65 == 15678)
            {
              uint64_t v64 = specialized closure #6 in static FilterFunctions.operatorFromString<A>(_:for:);
              if (v176 == 0xE200000000000000) {
                goto LABEL_59;
              }
            }
            char v141 = _stringCompareWithSmolCheck(_:_:expecting:)();
            Swift::String v67 = specialized closure #6 in static FilterFunctions.operatorFromString<A>(_:for:);
            if ((v141 & 1) == 0)
            {
              if (v65 == 15649)
              {
                uint64_t v64 = specialized closure #7 in static FilterFunctions.operatorFromString<A>(_:for:);
                if (v176 == 0xE200000000000000) {
                  goto LABEL_59;
                }
              }
              char v142 = _stringCompareWithSmolCheck(_:_:expecting:)();
              Swift::String v67 = specialized closure #7 in static FilterFunctions.operatorFromString<A>(_:for:);
              if ((v142 & 1) == 0)
              {
                uint64_t v143 = Logger.filterFunction.unsafeMutableAddressor();
                ((void (*)(char *, uint64_t, uint64_t))v13[2])(v163, v143, v177);
                swift_bridgeObjectRetain_n();
                uint64_t v144 = Logger.logObject.getter();
                os_log_type_t v145 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v144, v145))
                {
                  uint64_t v146 = (uint8_t *)swift_slowAlloc();
                  v184[0] = swift_slowAlloc();
                  *(_DWORD *)uint64_t v146 = 136315138;
                  unint64_t v147 = v176;
                  swift_bridgeObjectRetain();
                  uint64_t v181 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v174, v147, v184);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_bridgeObjectRelease_n();
                  _os_log_impl((void *)&_mh_execute_header, v144, v145, "Could not parse operator '%s'.", v146, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                }
                v13[1](v163, v177);
                goto LABEL_56;
              }
            }
          }
        }
      }
    }
    uint64_t v64 = v67;
LABEL_59:
    uint64_t v135 = swift_allocObject();
    *(void *)(v135 + 16) = v64;
    *(void *)(v135 + 24) = 0;
    uint64_t v136 = __chkstk_darwin(v135);
    *(&v161 - 2) = (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Int, @in_guaranteed Int) -> (@unowned Bool);
    *(&v161 - 1) = v136;
    specialized static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(a1, a2, a3, v63, (uint64_t)(&v161 - 4), v179);
    return swift_release();
  }
  unint64_t v175 = (char *)a1;
  uint64_t v102 = Logger.filterFunction.unsafeMutableAddressor();
  char v103 = v170;
  uint64_t v104 = v177;
  ((void (*)(char *, uint64_t, uint64_t))v13[2])(v170, v102, v177);
  outlined init with copy of Any(v60, (uint64_t)v184);
  int v105 = Logger.logObject.getter();
  uint64_t v106 = v13;
  os_log_type_t v107 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v105, v107))
  {
    uint64_t v108 = (uint8_t *)swift_slowAlloc();
    uint64_t v183 = swift_slowAlloc();
    *(_DWORD *)uint64_t v108 = 136315138;
    outlined init with copy of Any((uint64_t)v184, (uint64_t)&v181);
    uint64_t v109 = String.init<A>(describing:)();
    uint64_t v181 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v109, v110, &v183);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
    _os_log_impl((void *)&_mh_execute_header, v105, v107, "Could not parse value '%s' as String.", v108, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v106[1](v170, v104);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);

    v106[1](v103, v104);
  }
  uint64_t v129 = type metadata accessor for DataFrame();
  return (*(uint64_t (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 16))(v179, v175, v129);
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

uint64_t specialized static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = Logger.filterFunction.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v15 = a1;
    BOOL v12 = (uint8_t *)v11;
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)BOOL v12 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v16 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, a2, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "String values only support '==' operation, but '%s' provided. Defaulting to '=='.", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t specialized static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v49 = a6;
  uint64_t v13 = type metadata accessor for DataFrame.Slice();
  uint64_t v52 = *(void *)(v13 - 8);
  uint64_t v53 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  os_log_t v51 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  int64_t v50 = (char *)&v49 - v16;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v56 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v49 - v21;
  v62[0] = a4;
  v62[1] = a5;
  uint64_t v23 = AVLogColumns.allValues.unsafeMutableAddressor();
  uint64_t v24 = *v23;
  int64_t v25 = *(void *)(*v23 + 16);
  uint64_t v26 = &_swiftEmptyArrayStorage;
  uint64_t v58 = a2;
  uint64_t v59 = v17;
  if (v25)
  {
    uint64_t v54 = a3;
    uint64_t v55 = v18;
    uint64_t v57 = a1;
    uint64_t v61 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v25, 0);
    uint64_t v27 = 0;
    uint64_t v26 = v61;
    do
    {
      uint64_t v28 = AVLogColumns.rawValue.getter(*(unsigned char *)(v24 + v27 + 32));
      uint64_t v30 = v29;
      uint64_t v61 = v26;
      unint64_t v32 = v26[2];
      unint64_t v31 = v26[3];
      if (v32 >= v31 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
        uint64_t v26 = v61;
      }
      ++v27;
      void v26[2] = v32 + 1;
      uint64_t v33 = &v26[2 * v32];
      v33[4] = v28;
      v33[5] = v30;
    }
    while (v25 != v27);
    swift_bridgeObjectRelease();
    a1 = v57;
    a2 = v58;
    uint64_t v17 = v59;
    a3 = v54;
    uint64_t v18 = v55;
  }
  char v34 = specialized Sequence<>.contains(_:)(a2, (uint64_t)a3, v26);
  swift_bridgeObjectRelease();
  if (v34)
  {
    v35._uint64_t countAndFlagsBits = a2;
    v35._object = a3;
    Swift::Int_optional v63 = DataFrame.indexOfColumn(_:)(v35);
    if (!v63.is_nil)
    {
      __chkstk_darwin(v63.value);
      uint64_t v36 = v49;
      uint64_t v37 = v50;
      *(&v49 - 4) = (uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed String) -> (@unowned Bool);
      *(&v49 - 3) = v36;
      *(&v49 - 2) = (uint64_t)v62;
      DataFrame.filter<A>(on:_:_:)();
      uint64_t v38 = v52;
      uint64_t v39 = v53;
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v37, v53);
      DataFrame.init(_:)();
      return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v37, v39);
    }
    uint64_t v45 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v22 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v56, v45, v17);
    swift_bridgeObjectRetain_n();
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, (unint64_t)a3, (uint64_t *)&v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v42, v46, "Field '%s' is defined, but does not exist in data frame. Filtering skipped.", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v18 + 8))(v56, v59);
      goto LABEL_15;
    }
LABEL_14:

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
    goto LABEL_15;
  }
  uint64_t v41 = Logger.filterFunction.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v41, v17);
  swift_bridgeObjectRetain_n();
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v42, v43)) {
    goto LABEL_14;
  }
  uint64_t v57 = a1;
  uint64_t v44 = (uint8_t *)swift_slowAlloc();
  uint64_t v61 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v44 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, (unint64_t)a3, (uint64_t *)&v61);
  a1 = v57;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v42, v43, "Field '%s' is not defined. Filtering skipped.", v44, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v59);
LABEL_15:
  uint64_t v48 = type metadata accessor for DataFrame();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 16))(a7, a1, v48);
}

uint64_t specialized static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v50 = a5;
  uint64_t v11 = type metadata accessor for DataFrame.Slice();
  uint64_t v53 = *(void *)(v11 - 8);
  uint64_t v54 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v52 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  os_log_t v51 = (char *)&v49 - v14;
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v58 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v49 - v19;
  uint64_t v63 = a4;
  uint64_t v21 = AVLogColumns.allValues.unsafeMutableAddressor();
  uint64_t v22 = *v21;
  int64_t v23 = *(void *)(*v21 + 16);
  uint64_t v24 = &_swiftEmptyArrayStorage;
  uint64_t v59 = v15;
  uint64_t v60 = a1;
  if (v23)
  {
    uint64_t v55 = a2;
    unint64_t v56 = a3;
    uint64_t v57 = v16;
    char v62 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v23, 0);
    uint64_t v25 = 0;
    uint64_t v24 = v62;
    do
    {
      uint64_t v26 = AVLogColumns.rawValue.getter(*(unsigned char *)(v22 + v25 + 32));
      uint64_t v28 = v27;
      char v62 = v24;
      unint64_t v30 = v24[2];
      unint64_t v29 = v24[3];
      if (v30 >= v29 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1);
        uint64_t v24 = v62;
      }
      ++v25;
      v24[2] = v30 + 1;
      unint64_t v31 = &v24[2 * v30];
      v31[4] = v26;
      v31[5] = v28;
    }
    while (v23 != v25);
    swift_bridgeObjectRelease();
    uint64_t v15 = v59;
    a3 = v56;
    uint64_t v16 = v57;
    a2 = v55;
  }
  char v32 = specialized Sequence<>.contains(_:)(a2, (uint64_t)a3, v24);
  swift_bridgeObjectRelease();
  if (v32)
  {
    v33._uint64_t countAndFlagsBits = a2;
    v33._object = a3;
    Swift::Int_optional v64 = DataFrame.indexOfColumn(_:)(v33);
    if (!v64.is_nil)
    {
      __chkstk_darwin(v64.value);
      uint64_t v34 = v50;
      Swift::String v35 = v51;
      *(&v49 - 4) = (uint64_t)partial apply for thunk for @callee_guaranteed (@unowned Int, @unowned Int) -> (@unowned Bool);
      *(&v49 - 3) = v34;
      *(&v49 - 2) = (uint64_t)&v63;
      DataFrame.filter<A>(on:_:_:)();
      uint64_t v36 = v53;
      uint64_t v37 = v54;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v35, v54);
      DataFrame.init(_:)();
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v35, v37);
    }
    uint64_t v44 = a2;
    uint64_t v45 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v20 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v58, v45, v15);
    swift_bridgeObjectRetain_n();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      char v62 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, (unint64_t)a3, (uint64_t *)&v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v41, v46, "Field '%s' is defined, but does not exist in data frame. Filtering skipped.", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v16 + 8))(v58, v59);
      goto LABEL_15;
    }
LABEL_14:

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
    goto LABEL_15;
  }
  uint64_t v39 = a2;
  uint64_t v40 = Logger.filterFunction.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v20, v40, v15);
  swift_bridgeObjectRetain_n();
  uint64_t v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v41, v42)) {
    goto LABEL_14;
  }
  uint64_t v58 = a6;
  os_log_type_t v43 = (uint8_t *)swift_slowAlloc();
  char v62 = (void *)swift_slowAlloc();
  *(_DWORD *)os_log_type_t v43 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, (unint64_t)a3, (uint64_t *)&v62);
  a6 = v58;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v41, v42, "Field '%s' is not defined. Filtering skipped.", v43, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v59);
LABEL_15:
  uint64_t v48 = type metadata accessor for DataFrame();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 16))(a6, v60, v48);
}

uint64_t specialized static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a5;
  uint64_t v49 = a4;
  uint64_t v58 = a2;
  uint64_t v9 = type metadata accessor for DataFrame.Slice();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  os_log_t v51 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v50 = (char *)&v47 - v12;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v55 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v47 - v17;
  uint64_t v47 = type metadata accessor for Date();
  uint64_t v19 = AVLogColumns.allValues.unsafeMutableAddressor();
  uint64_t v20 = *v19;
  int64_t v21 = *(void *)(*v19 + 16);
  uint64_t v22 = &_swiftEmptyArrayStorage;
  uint64_t v59 = v13;
  if (v21)
  {
    uint64_t v54 = a3;
    uint64_t v56 = a1;
    uint64_t v57 = v14;
    uint64_t v61 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21, 0);
    uint64_t v23 = 0;
    uint64_t v22 = v61;
    do
    {
      uint64_t v24 = AVLogColumns.rawValue.getter(*(unsigned char *)(v20 + v23 + 32));
      uint64_t v26 = v25;
      uint64_t v61 = v22;
      unint64_t v28 = v22[2];
      unint64_t v27 = v22[3];
      if (v28 >= v27 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
        uint64_t v22 = v61;
      }
      ++v23;
      void v22[2] = v28 + 1;
      unint64_t v29 = &v22[2 * v28];
      v29[4] = v24;
      v29[5] = v26;
    }
    while (v21 != v23);
    swift_bridgeObjectRelease();
    a1 = v56;
    uint64_t v14 = v57;
    uint64_t v13 = v59;
    a3 = v54;
  }
  uint64_t v30 = v58;
  char v31 = specialized Sequence<>.contains(_:)(v58, (uint64_t)a3, v22);
  swift_bridgeObjectRelease();
  if (v31)
  {
    v32._uint64_t countAndFlagsBits = v30;
    v32._object = a3;
    Swift::Int_optional v62 = DataFrame.indexOfColumn(_:)(v32);
    if (!v62.is_nil)
    {
      __chkstk_darwin(v62.value);
      *(&v47 - 4) = v48;
      *(&v47 - 3) = 0;
      Swift::String v33 = v50;
      *(&v47 - 2) = v49;
      DataFrame.filter<A>(on:_:_:)();
      uint64_t v34 = v52;
      uint64_t v35 = v53;
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v33, v53);
      DataFrame.init(_:)();
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v33, v35);
    }
    uint64_t v56 = a6;
    uint64_t v41 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v18 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v55, v41, v13);
    swift_bridgeObjectRetain_n();
    unint64_t v42 = (unint64_t)a3;
    os_log_type_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v42, (uint64_t *)&v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Field '%s' is defined, but does not exist in data frame. Filtering skipped.", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v14 + 8))(v55, v59);
      goto LABEL_17;
    }

LABEL_16:
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
    goto LABEL_17;
  }
  uint64_t v56 = a6;
  uint64_t v37 = Logger.filterFunction.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v37, v13);
  swift_bridgeObjectRetain_n();
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v38, v39))
  {

    goto LABEL_16;
  }
  uint64_t v40 = (uint8_t *)swift_slowAlloc();
  uint64_t v61 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v40 = 136315138;
  uint64_t v57 = v14;
  swift_bridgeObjectRetain();
  uint64_t v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, (unint64_t)a3, (uint64_t *)&v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v38, v39, "Field '%s' is not defined. Filtering skipped.", v40, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v57 + 8))(v18, v59);
LABEL_17:
  uint64_t v46 = type metadata accessor for DataFrame();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v56, a1, v46);
}

uint64_t static FilterFunctions.convertStringToDate(_:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  uint64_t v30 = v3;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [objc_allocWithZone((Class)NSDateFormatter) init];
  NSString v14 = String._bridgeToObjectiveC()();
  [v13 setDateFormat:v14];

  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v13 dateFromString:v15];

  if (v16)
  {
    unint64_t v28 = v5;
    uint64_t v17 = a1;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v18(v12, v9, v6);
    uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    v19(v12, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
    {

      v18(v17, v12, v6);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v19)(v17, 0, 1, v6);
    }
    a1 = v17;
    uint64_t v5 = v28;
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    v19(v12, 1, 1, v6);
  }
  outlined destroy of Date?((uint64_t)v12);
  uint64_t v20 = Logger.filterFunction.unsafeMutableAddressor();
  uint64_t v22 = v29;
  uint64_t v21 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v5, v20, v29);
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Error: Could not parse date. Returning now.", v25, 2u);
    uint64_t v21 = v30;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(a1, 1, 1, v6);
}

uint64_t static FilterFunctions.newSamplesSinceLastPluginRun(samples:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v101 = a1;
  uint64_t v98 = a2;
  uint64_t v86 = type metadata accessor for DataFrame.Rows();
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v84 = &v80[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v90 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v94 = &v80[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  os_log_t v89 = &v80[-v6];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v99 = *(void *)(v7 - 8);
  uint64_t v100 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v87 = &v80[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  unint64_t v88 = &v80[-v10];
  uint64_t v11 = type metadata accessor for DataFrame();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v102 = v11;
  uint64_t v103 = v12;
  uint64_t v13 = __chkstk_darwin(v11);
  NSString v15 = &v80[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  uint64_t v93 = &v80[-v16];
  uint64_t v17 = type metadata accessor for DataFrame.Slice();
  uint64_t v91 = *(void *)(v17 - 8);
  uint64_t v92 = v17;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = &v80[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v18);
  uint64_t v22 = &v80[-v21];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v26 = &v80[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v24);
  unint64_t v28 = &v80[-v27];
  uint64_t v29 = type metadata accessor for TimeZone();
  __chkstk_darwin(v29 - 8);
  uint64_t v30 = type metadata accessor for Calendar();
  uint64_t v96 = *(void *)(v30 - 8);
  uint64_t v97 = v30;
  __chkstk_darwin(v30);
  Swift::String v32 = &v80[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Calendar.current.getter();
  static TimeZone.current.getter();
  uint64_t v95 = v32;
  Calendar.timeZone.setter();
  id v33 = (id)*UserDefaultsManager.shared.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  UserDefaultsManager.previousEvaluationDate()(v33, (uint64_t)v28);
  swift_bridgeObjectRelease();
  uint64_t v34 = v101;
  swift_bridgeObjectRelease();

  v35._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v106 = DataFrame.indexOfColumn(_:)(v35);
  Swift::Bool is_nil = v106.is_nil;
  swift_bridgeObjectRelease();
  if (is_nil)
  {
    uint64_t v45 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v46 = v90;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v90 + 16))(v94, v45, v3);
    uint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    uint64_t v49 = v34;
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v83 = v3;
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      v105[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v51 = AVLogColumns.rawValue.getter(1);
      uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Column '%s' does not exist. Return all samples.", v50, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v94, v83);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v94, v3);
    }
    (*(void (**)(unsigned char *, uint64_t))(v96 + 8))(v95, v97);
    uint64_t v74 = v98;
    uint64_t v75 = v102;
    uint64_t v76 = v103;
    outlined destroy of Date?((uint64_t)v28);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v76 + 16))(v74, v49, v75);
  }
  else
  {
    uint64_t v94 = v15;
    uint64_t v37 = AVLogColumns.rawValue.getter(1);
    __chkstk_darwin(v37);
    *(void *)&v80[-16] = v28;
    uint64_t v38 = v100;
    DataFrame.filter<A>(on:_:_:)();
    swift_bridgeObjectRelease();
    uint64_t v40 = v91;
    uint64_t v39 = v92;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v91 + 16))(v20, v22, v92);
    uint64_t v41 = v93;
    DataFrame.init(_:)();
    outlined init with copy of Date?((uint64_t)v28, (uint64_t)v26);
    unint64_t v42 = v41;
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v99 + 48))(v26, 1, v38) == 1)
    {
      (*(void (**)(unsigned char *, uint64_t))(v40 + 8))(v22, v39);
      (*(void (**)(unsigned char *, uint64_t))(v96 + 8))(v95, v97);
      outlined destroy of Date?((uint64_t)v28);
      uint64_t v44 = v102;
      uint64_t v43 = v103;
    }
    else
    {
      uint64_t v82 = v22;
      uint64_t v101 = v28;
      uint64_t v54 = v99;
      uint64_t v53 = v100;
      uint64_t v55 = v88;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v99 + 32))(v88, v26, v100);
      uint64_t v56 = Logger.filterFunction.unsafeMutableAddressor();
      uint64_t v57 = v89;
      uint64_t v58 = v90;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v90 + 16))(v89, v56, v3);
      uint64_t v43 = v103;
      uint64_t v59 = v94;
      uint64_t v60 = v42;
      uint64_t v61 = v55;
      uint64_t v44 = v102;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v103 + 16))(v94, v60, v102);
      Swift::Int_optional v62 = v87;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v54 + 16))(v87, v61, v53);
      uint64_t v63 = Logger.logObject.getter();
      os_log_type_t v64 = static os_log_type_t.info.getter();
      int v65 = v64;
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v66 = swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        uint64_t v83 = v3;
        v105[0] = v67;
        *(_DWORD *)uint64_t v66 = 134218242;
        int v81 = v65;
        uint64_t v68 = v84;
        DataFrame.rows.getter();
        uint64_t v69 = DataFrame.Rows.count.getter();
        (*(void (**)(unsigned char *, uint64_t))(v85 + 8))(v68, v86);
        (*(void (**)(unsigned char *, uint64_t))(v103 + 8))(v59, v44);
        uint64_t v104 = v69;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v66 + 12) = 2080;
        lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type Date and conformance Date);
        uint64_t v70 = v100;
        uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v72, v105);
        uint64_t v44 = v102;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v73 = *(void (**)(unsigned char *, uint64_t))(v99 + 8);
        v73(v62, v70);
        _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v81, "'newSamplesSinceLastPluginRun' found %ld samples since last plugin run on %s.", (uint8_t *)v66, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v43 = v103;
        swift_slowDealloc();

        (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v89, v83);
        v73(v88, v70);
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v59, v44);

        uint64_t v78 = v100;
        int64_t v79 = *(void (**)(unsigned char *, uint64_t))(v99 + 8);
        v79(v62, v100);
        (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v57, v3);
        v79(v61, v78);
      }
      (*(void (**)(unsigned char *, uint64_t))(v91 + 8))(v82, v92);
      (*(void (**)(unsigned char *, uint64_t))(v96 + 8))(v95, v97);
      uint64_t v26 = v101;
      unint64_t v42 = v93;
    }
    outlined destroy of Date?((uint64_t)v26);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v43 + 32))(v98, v42, v44);
  }
}

uint64_t static FilterFunctions.samplesFromToday(samples:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v122 = a1;
  uint64_t v107 = a2;
  uint64_t v97 = type metadata accessor for DataFrame.Rows();
  uint64_t v96 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  uint64_t v95 = (char *)&v94 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = type metadata accessor for Logger();
  uint64_t v114 = *(void *)(v121 - 8);
  uint64_t v3 = __chkstk_darwin(v121);
  os_log_t v100 = (os_log_t)((char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v101 = (char *)&v94 - v5;
  uint64_t v124 = type metadata accessor for DataFrame();
  uint64_t v113 = *(void *)(v124 - 8);
  uint64_t v6 = __chkstk_darwin(v124);
  uint64_t v99 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v111 = (char *)&v94 - v8;
  uint64_t v112 = type metadata accessor for DataFrame.Slice();
  uint64_t v110 = *(void *)(v112 - 8);
  uint64_t v9 = __chkstk_darwin(v112);
  uint64_t v108 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v109 = (char *)&v94 - v11;
  uint64_t v12 = type metadata accessor for Calendar.Component();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  NSString v15 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v117 = (char *)&v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v94 - v19;
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v119 = (char *)&v94 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v123 = (char *)&v94 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  os_log_type_t v125 = (char *)&v94 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v94 - v30;
  __chkstk_darwin(v29);
  id v33 = (char *)&v94 - v32;
  uint64_t v34 = type metadata accessor for TimeZone();
  __chkstk_darwin(v34 - 8);
  uint64_t v106 = type metadata accessor for Calendar();
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  uint64_t v36 = (char *)&v94 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.current.getter();
  static TimeZone.current.getter();
  Calendar.timeZone.setter();
  Date.init()();
  Calendar.startOfDay(for:)();
  uint64_t v37 = v22;
  uint64_t v38 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v104 = v22 + 8;
  uint64_t v103 = v38;
  v38(v31, v21);
  uint64_t v39 = *(void (**)(char *, void, uint64_t))(v13 + 104);
  v39(v15, enum case for Calendar.Component.day(_:), v12);
  uint64_t v120 = v33;
  Calendar.date(byAdding:value:to:wrappingComponents:)();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v118 = (char *)(v13 + 8);
  int v116 = v40;
  v40(v15, v12);
  uint64_t v115 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48);
  uint64_t result = v115(v20, 1, v21);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v98 = v37;
  uint64_t v102 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v102(v125, v20, v21);
  v39(v15, enum case for Calendar.Component.second(_:), v12);
  unint64_t v42 = v117;
  Calendar.date(byAdding:value:to:wrappingComponents:)();
  v116(v15, v12);
  uint64_t result = v115(v42, 1, v21);
  if (result == 1)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v43 = v21;
  uint64_t v44 = v123;
  v102(v123, v42, v21);
  v45._uint64_t countAndFlagsBits = AVLogColumns.rawValue.getter(1);
  Swift::Int_optional v128 = DataFrame.indexOfColumn(_:)(v45);
  Swift::Bool is_nil = v128.is_nil;
  swift_bridgeObjectRelease();
  uint64_t v47 = v124;
  os_log_type_t v48 = v119;
  if (is_nil)
  {
    uint64_t v75 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v76 = v114;
    os_log_t v77 = v100;
    uint64_t v78 = v121;
    (*(void (**)(os_log_t, uint64_t, uint64_t))(v114 + 16))(v100, v75, v121);
    int64_t v79 = Logger.logObject.getter();
    os_log_type_t v80 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v118 = v36;
      int v81 = (uint8_t *)swift_slowAlloc();
      uint64_t v127 = (void (*)(void, void, void))swift_slowAlloc();
      *(_DWORD *)int v81 = 136315138;
      uint64_t v82 = AVLogColumns.rawValue.getter(1);
      uint64_t v126 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v83, (uint64_t *)&v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v44 = v123;
      uint64_t v84 = v124;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Column '%s' does not exist. Return all samples.", v81, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(os_log_t, uint64_t))(v76 + 8))(v100, v121);
      uint64_t v85 = v103;
      v103(v125, v43);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v118, v106);
      uint64_t v86 = v107;
    }
    else
    {

      (*(void (**)(os_log_t, uint64_t))(v76 + 8))(v77, v78);
      uint64_t v85 = v103;
      v103(v125, v43);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v36, v106);
      uint64_t v86 = v107;
      uint64_t v84 = v124;
    }
    v85(v44, v43);
    v85(v120, v43);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v113 + 16))(v86, v122, v84);
  }
  else
  {
    uint64_t v118 = v36;
    uint64_t v49 = AVLogColumns.rawValue.getter(1);
    __chkstk_darwin(v49);
    uint64_t v50 = v120;
    *(&v94 - 2) = (uint64_t)v120;
    *(&v94 - 1) = (uint64_t)v44;
    uint64_t v51 = v109;
    DataFrame.filter<A>(on:_:_:)();
    swift_bridgeObjectRelease();
    unint64_t v52 = *(char **)(v110 + 16);
    uint64_t v122 = v110 + 16;
    uint64_t v117 = v52;
    ((void (*)(char *, char *, uint64_t))v52)(v108, v51, v112);
    uint64_t v53 = v111;
    DataFrame.init(_:)();
    uint64_t v54 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v55 = v114;
    uint64_t v56 = v101;
    uint64_t v57 = v121;
    (*(void (**)(char *, uint64_t, uint64_t))(v114 + 16))(v101, v54, v121);
    uint64_t v58 = v113;
    uint64_t v59 = v99;
    (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v99, v53, v47);
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v48, v50, v43);
    uint64_t v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = v47;
      uint64_t v63 = v59;
      uint64_t v64 = swift_slowAlloc();
      uint64_t v102 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
      uint64_t v127 = (void (*)(void, void, void))v102;
      *(_DWORD *)uint64_t v64 = 134218242;
      uint64_t v98 = v64 + 4;
      int v65 = v95;
      os_log_t v100 = v60;
      DataFrame.rows.getter();
      uint64_t v66 = DataFrame.Rows.count.getter();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v65, v97);
      uint64_t v67 = *(void (**)(char *, uint64_t))(v58 + 8);
      uint64_t v115 = (uint64_t (*)(char *, uint64_t, uint64_t))((v58 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
      int v116 = v67;
      v67(v63, v62);
      uint64_t v126 = v66;
      uint64_t v68 = v43;
      uint64_t v69 = v55;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v64 + 12) = 2080;
      lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type Date and conformance Date);
      uint64_t v70 = v119;
      uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v126 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v72, (uint64_t *)&v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v73 = v103;
      v103(v70, v68);
      os_log_t v74 = v100;
      _os_log_impl((void *)&_mh_execute_header, v100, v61, "'samplesFromToday' found %ld samples since last plugin run on %s.", (uint8_t *)v64, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v69 + 8))(v101, v121);
      uint64_t v43 = v68;
    }
    else
    {
      unint64_t v87 = *(void (**)(char *, uint64_t))(v58 + 8);
      uint64_t v115 = (uint64_t (*)(char *, uint64_t, uint64_t))((v58 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
      int v116 = v87;
      v87(v59, v47);
      unint64_t v88 = v103;
      v103(v119, v43);

      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
      uint64_t v73 = v88;
    }
    os_log_t v89 = v125;
    uint64_t v90 = v106;
    uint64_t v91 = v105;
    uint64_t v92 = v109;
    uint64_t v93 = v112;
    ((void (*)(char *, char *, uint64_t))v117)(v108, v109, v112);
    DataFrame.init(_:)();
    v116(v111, v124);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v92, v93);
    v73(v89, v43);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v118, v90);
    v73(v123, v43);
    return ((uint64_t (*)(char *, uint64_t))v73)(v120, v43);
  }
}

uint64_t specialized closure #2 in static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(uint64_t a1, uint64_t (*a2)(char *, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    outlined destroy of Date?((uint64_t)v9);
    char v14 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    char v14 = a2(v13, a4);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v14 & 1;
}

uint64_t specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(a1, a2, &lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t)&protocol conformance descriptor for Date, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of static Equatable.== infix(_:_:));
}

uint64_t specialized closure #3 in static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(a1, a2, &lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t)&protocol conformance descriptor for Date, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of static Comparable.< infix(_:_:));
}

uint64_t specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = lazy protocol witness table accessor for type Date and conformance Date(a3);
  return a5(a1, a2, v9, v10) & 1;
}

uint64_t specialized closure #4 in static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(a1, a2, &lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t)&protocol conformance descriptor for Date, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of static Comparable.> infix(_:_:));
}

uint64_t specialized closure #5 in static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(a1, a2, &lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t)&protocol conformance descriptor for Date, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of static Comparable.<= infix(_:_:));
}

uint64_t specialized closure #6 in static FilterFunctions.operatorFromString<A>(_:for:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(a1, a2, &lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t)&protocol conformance descriptor for Date, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of static Comparable.>= infix(_:_:));
}

BOOL specialized closure #7 in static FilterFunctions.operatorFromString<A>(_:for:)()
{
  return (dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0;
}

uint64_t closure #1 in static FilterFunctions.samplesFromToday(samples:)(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  NSString v15 = (char *)&v24 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v24 - v16;
  outlined init with copy of Date?(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    outlined destroy of Date?((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v17, v7, v8);
    char v18 = static Date.> infix(_:_:)();
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v19(v15, v17, v8);
    v19(v12, a3, v8);
    if (v18)
    {
      char v20 = static Date.< infix(_:_:)();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
      v21(v12, v8);
      v21(v15, v8);
      v21(v17, v8);
      if (v20) {
        return 1;
      }
    }
    else
    {
      uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
      v23(v12, v8);
      v23(v15, v8);
      v23(v17, v8);
    }
  }
  return 0;
}

uint64_t closure #1 in static FilterFunctions.newSamplesSinceLastPluginRun(samples:)(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v40 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v40 - v20;
  outlined init with copy of Date?(a1, (uint64_t)v14);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v22(v14, 1, v15) == 1)
  {
    outlined destroy of Date?((uint64_t)v14);
    uint64_t v23 = Logger.filterFunction.unsafeMutableAddressor();
    uint64_t v25 = v42;
    uint64_t v24 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v8, v23, v43);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Could not find date during filtering.", v28, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v24);
    char v29 = 0;
  }
  else
  {
    uint64_t v40 = v6;
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v30(v21, v14, v15);
    outlined init with copy of Date?(v41, (uint64_t)v12);
    if (v22(v12, 1, v15) == 1)
    {
      outlined destroy of Date?((uint64_t)v12);
      uint64_t v31 = Logger.filterFunction.unsafeMutableAddressor();
      uint64_t v33 = v42;
      uint64_t v32 = v43;
      uint64_t v34 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v40, v31, v43);
      uint64_t v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "No previous evaluation date stored. Skip filtering.", v37, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v32);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
      char v29 = 1;
    }
    else
    {
      v30(v19, v12, v15);
      char v29 = static Date.> infix(_:_:)();
      uint64_t v38 = *(void (**)(char *, uint64_t))(v16 + 8);
      v38(v19, v15);
      v38(v21, v15);
    }
  }
  return v29 & 1;
}

BOOL specialized closure #2 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL specialized closure #3 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL specialized closure #4 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  return *a2 < *a1;
}

BOOL specialized closure #5 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL specialized closure #6 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL specialized closure #7 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  return *a1 != *a2;
}

uint64_t specialized closure #2 in static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(uint64_t *a1, uint64_t (*a2)(void *, void *), uint64_t a3, void *a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a4[1];
  v11[0] = *a4;
  v11[1] = v6;
  if (v5)
  {
    v10[0] = v4;
    v10[1] = v5;
    swift_bridgeObjectRetain();
    char v8 = a2(v10, v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t specialized closure #1 in static FilterFunctions.operatorFromString<A>(_:for:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

unint64_t specialized ExpectedFilterFunctions.init(rawValue:)(Swift::String string, Swift::OpaquePointer cases)
{
  object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  if (v5 >= 3) {
    return 3;
  }
  else {
    return v5;
  }
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _sxq_SbRi_zRi0_zRi__Ri0__r0_ly10Foundation4DateVACIsegnnd_SgWOe(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100030A0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Int, @in_guaranteed Int) -> (@unowned Bool)(uint64_t a1, uint64_t a2)
{
  Swift::String v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5) & 1;
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Int, @unowned Int) -> (@unowned Bool)(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2) & 1;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed String, @in_guaranteed String) -> (@unowned Bool)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(void *, void *))(v4 + 16);
  v8[0] = a1;
  v8[1] = a2;
  v7[0] = a3;
  v7[1] = a4;
  return v5(v8, v7) & 1;
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed String) -> (@unowned Bool)(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(v2 + 16))(*a1, a1[1], *a2, a2[1]) & 1;
}

unint64_t lazy protocol witness table accessor for type ExpectedFilterFunctions and conformance ExpectedFilterFunctions()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpectedFilterFunctions and conformance ExpectedFilterFunctions;
  if (!lazy protocol witness table cache variable for type ExpectedFilterFunctions and conformance ExpectedFilterFunctions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpectedFilterFunctions and conformance ExpectedFilterFunctions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpectedFilterFunctionArguments and conformance ExpectedFilterFunctionArguments()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpectedFilterFunctionArguments and conformance ExpectedFilterFunctionArguments;
  if (!lazy protocol witness table cache variable for type ExpectedFilterFunctionArguments and conformance ExpectedFilterFunctionArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpectedFilterFunctionArguments and conformance ExpectedFilterFunctionArguments);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpectedFilterFunctions()
{
  return &type metadata for ExpectedFilterFunctions;
}

unsigned char *storeEnumTagSinglePayload for ExpectedFilterFunctions(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100030CCCLL);
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

ValueMetadata *type metadata accessor for ExpectedFilterFunctionArguments()
{
  return &type metadata for ExpectedFilterFunctionArguments;
}

ValueMetadata *type metadata accessor for FilterFunctions()
{
  return &type metadata for FilterFunctions;
}

uint64_t partial apply for specialized closure #2 in static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(uint64_t *a1)
{
  return specialized closure #2 in static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(a1, *(uint64_t (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32)) & 1;
}

{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *, uint64_t *);
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v7;
  uint64_t v8;

  uint64_t v2 = *(uint64_t (**)(uint64_t *, uint64_t *))(v1 + 16);
  int v3 = *a1;
  unsigned int v4 = *((unsigned char *)a1 + 8);
  char v8 = **(void **)(v1 + 32);
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v5 = v2(&v7, &v8);
  }
  return v5 & 1;
}

uint64_t partial apply for specialized closure #2 in static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(uint64_t a1)
{
  return specialized closure #2 in static FilterFunctions.filter<A>(samples:on:value:valueType:operation:)(a1, *(uint64_t (**)(char *, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32)) & 1;
}

uint64_t partial apply for closure #1 in static FilterFunctions.newSamplesSinceLastPluginRun(samples:)(uint64_t a1)
{
  return closure #1 in static FilterFunctions.newSamplesSinceLastPluginRun(samples:)(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t lazy protocol witness table accessor for type Date and conformance Date(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Date();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t partial apply for closure #1 in static FilterFunctions.samplesFromToday(samples:)(uint64_t a1)
{
  return closure #1 in static FilterFunctions.samplesFromToday(samples:)(a1, *(void *)(v1 + 16), *(char **)(v1 + 24)) & 1;
}

uint64_t static EvaluationJobHelpers.evaluationJobFromJson(path:)()
{
  uint64_t v0 = type metadata accessor for String.Encoding();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  unsigned int v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  static String.Encoding.utf8.getter();
  String.init(contentsOfFile:encoding:)();
  static String.Encoding.utf8.getter();
  uint64_t v5 = String.data(using:allowLossyConversion:)();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if (v7 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    lazy protocol witness table accessor for type EvaluationJobDescription and conformance EvaluationJobDescription();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    swift_release();
    outlined consume of Data?(v5, v7);
    return v9[1];
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EvaluationJobDescription and conformance EvaluationJobDescription()
{
  unint64_t result = lazy protocol witness table cache variable for type EvaluationJobDescription and conformance EvaluationJobDescription;
  if (!lazy protocol witness table cache variable for type EvaluationJobDescription and conformance EvaluationJobDescription)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EvaluationJobDescription and conformance EvaluationJobDescription);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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

ValueMetadata *type metadata accessor for EvaluationJobHelpers()
{
  return &type metadata for EvaluationJobHelpers;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.FormatStyle.Symbol.VerbatimHour.HourCycle.zeroBased.getter()
{
  return static Date.FormatStyle.Symbol.VerbatimHour.HourCycle.zeroBased.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour.HourCycle()
{
  return type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour.HourCycle();
}

uint64_t static Date.FormatStyle.Symbol.VerbatimHour.defaultDigits(clock:hourCycle:)()
{
  return static Date.FormatStyle.Symbol.VerbatimHour.defaultDigits(clock:hourCycle:)();
}

uint64_t static Date.FormatStyle.Symbol.VerbatimHour.Clock.twelveHour.getter()
{
  return static Date.FormatStyle.Symbol.VerbatimHour.Clock.twelveHour.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour.Clock()
{
  return type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour.Clock();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour()
{
  return type metadata accessor for Date.FormatStyle.Symbol.VerbatimHour();
}

uint64_t static Date.FormatStyle.Symbol.Day.twoDigits.getter()
{
  return static Date.FormatStyle.Symbol.Day.twoDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Day()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Day();
}

uint64_t static Date.FormatStyle.Symbol.Year.defaultDigits.getter()
{
  return static Date.FormatStyle.Symbol.Year.defaultDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Year()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Year();
}

uint64_t static Date.FormatStyle.Symbol.Month.twoDigits.getter()
{
  return static Date.FormatStyle.Symbol.Month.twoDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Month()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Month();
}

uint64_t static Date.FormatStyle.Symbol.Minute.defaultDigits.getter()
{
  return static Date.FormatStyle.Symbol.Minute.defaultDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Minute()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Minute();
}

uint64_t static Date.FormatStyle.Symbol.Second.defaultDigits.getter()
{
  return static Date.FormatStyle.Symbol.Second.defaultDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Second()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Second();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.DayPeriod.Width()
{
  return type metadata accessor for Date.FormatStyle.Symbol.DayPeriod.Width();
}

uint64_t static Date.FormatStyle.Symbol.DayPeriod.standard(_:)()
{
  return static Date.FormatStyle.Symbol.DayPeriod.standard(_:)();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.DayPeriod()
{
  return type metadata accessor for Date.FormatStyle.Symbol.DayPeriod();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(day:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(day:)();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(hour:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(hour:)();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(year:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(year:)();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(month:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(month:)();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(minute:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(minute:)();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(second:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(second:)();
}

uint64_t Date.FormatString.StringInterpolation.appendInterpolation(dayPeriod:)()
{
  return Date.FormatString.StringInterpolation.appendInterpolation(dayPeriod:)();
}

Swift::Void __swiftcall Date.FormatString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t Date.FormatString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return Date.FormatString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for Date.FormatString.StringInterpolation()
{
  return type metadata accessor for Date.FormatString.StringInterpolation();
}

uint64_t Date.FormatString.init(stringInterpolation:)()
{
  return Date.FormatString.init(stringInterpolation:)();
}

uint64_t type metadata accessor for Date.FormatString()
{
  return type metadata accessor for Date.FormatString();
}

uint64_t Date.ParseStrategy.init(format:locale:timeZone:calendar:isLenient:twoDigitStartDate:)()
{
  return Date.ParseStrategy.init(format:locale:timeZone:calendar:isLenient:twoDigitStartDate:)();
}

uint64_t type metadata accessor for Date.ParseStrategy()
{
  return type metadata accessor for Date.ParseStrategy();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t type metadata accessor for Calendar.Identifier()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t Calendar.init(identifier:)()
{
  return Calendar.init(identifier:)();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t Calendar.date(byAdding:value:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t Calendar.timeZone.setter()
{
  return Calendar.timeZone.setter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t dispatch thunk of DataFrameProtocol.rows.getter()
{
  return dispatch thunk of DataFrameProtocol.rows.getter();
}

uint64_t DataFrameProtocol.sorted(on:order:)()
{
  return DataFrameProtocol.sorted(on:order:)();
}

uint64_t DataFrameProtocol.isEmpty.getter()
{
  return DataFrameProtocol.isEmpty.getter();
}

uint64_t dispatch thunk of DataFrameProtocol.subscript.getter()
{
  return dispatch thunk of DataFrameProtocol.subscript.getter();
}

Swift::Void __swiftcall DataFrame.renameColumn(_:to:)(Swift::String _, Swift::String to)
{
}

Swift::Int_optional __swiftcall DataFrame.indexOfColumn(_:)(Swift::String a1)
{
  Swift::Int v1 = DataFrame.indexOfColumn(_:)(a1._countAndFlagsBits, a1._object);
  result.unint64_t value = v1;
  result.Swift::Bool is_nil = v2;
  return result;
}

uint64_t DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)()
{
  return DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
}

uint64_t type metadata accessor for DataFrame.Row()
{
  return type metadata accessor for DataFrame.Row();
}

uint64_t DataFrame.Row.subscript.getter()
{
  return DataFrame.Row.subscript.getter();
}

uint64_t DataFrame.Rows.count.getter()
{
  return DataFrame.Rows.count.getter();
}

uint64_t type metadata accessor for DataFrame.Rows()
{
  return type metadata accessor for DataFrame.Rows();
}

uint64_t DataFrame.rows.getter()
{
  return DataFrame.rows.getter();
}

uint64_t DataFrame.Slice.rows.getter()
{
  return DataFrame.Slice.rows.getter();
}

uint64_t type metadata accessor for DataFrame.Slice()
{
  return type metadata accessor for DataFrame.Slice();
}

uint64_t DataFrame.Slice.subscript.getter()
{
  return DataFrame.Slice.subscript.getter();
}

uint64_t DataFrame.append(row:)()
{
  return DataFrame.append(row:)();
}

uint64_t DataFrame.append<A>(column:)()
{
  return DataFrame.append<A>(column:)();
}

uint64_t DataFrame.append(_:)()
{
  return DataFrame.append(_:)();
}

uint64_t DataFrame.filter<A>(on:_:_:)()
{
  return DataFrame.filter<A>(on:_:_:)();
}

uint64_t DataFrame.columns.getter()
{
  return DataFrame.columns.getter();
}

uint64_t DataFrame.init()()
{
  return DataFrame.init()();
}

uint64_t type metadata accessor for DataFrame()
{
  return type metadata accessor for DataFrame();
}

uint64_t DataFrame.init(_:)()
{
  return DataFrame.init(_:)();
}

uint64_t DataFrame.subscript.getter()
{
  return DataFrame.subscript.getter();
}

{
  return DataFrame.subscript.getter();
}

uint64_t CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  return CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
}

uint64_t CSVReadingOptions.addDateParseStrategy<A>(_:)()
{
  return CSVReadingOptions.addDateParseStrategy<A>(_:)();
}

uint64_t type metadata accessor for CSVReadingOptions()
{
  return type metadata accessor for CSVReadingOptions();
}

uint64_t DiscontiguousColumnSlice<A>.mean()()
{
  return DiscontiguousColumnSlice<A>.mean()();
}

uint64_t type metadata accessor for Order()
{
  return type metadata accessor for Order();
}

uint64_t Column.init<A>(name:contents:)()
{
  return Column.init<A>(name:contents:)();
}

uint64_t Column.count.getter()
{
  return Column.count.getter();
}

uint64_t Column<A>.mean()()
{
  return Column<A>.mean()();
}

uint64_t type metadata accessor for CSVType()
{
  return type metadata accessor for CSVType();
}

uint64_t AnyColumn.wrappedElementType.getter()
{
  return AnyColumn.wrappedElementType.getter();
}

uint64_t type metadata accessor for AnyColumn()
{
  return type metadata accessor for AnyColumn();
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

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of BidirectionalCollection.index(before:)()
{
  return dispatch thunk of BidirectionalCollection.index(before:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init(contentsOfFile:encoding:)()
{
  return String.init(contentsOfFile:encoding:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
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

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
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

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return dispatch thunk of Collection.index(after:)();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return dispatch thunk of Collection.isEmpty.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
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

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
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

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
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