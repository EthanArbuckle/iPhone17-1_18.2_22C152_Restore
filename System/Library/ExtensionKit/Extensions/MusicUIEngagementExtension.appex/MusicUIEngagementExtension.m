BOOL ODJRequest.CodingKeys.init(rawValue:)(Swift::String a1)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &outlined read-only object #0 of ODJRequest.CodingKeys.init(rawValue:);
  return ODJRequest.CodingKeys.init(rawValue:)(a1, v1);
}

BOOL ODJRequest.CodingKeys.init(stringValue:)(Swift::String a1)
{
  v1._rawValue = &outlined read-only object #0 of ODJRequest.CodingKeys.init(rawValue:);
  return ODJRequest.CodingKeys.init(rawValue:)(a1, v1);
}

uint64_t ODJRequest.CodingKeys.init(intValue:)()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ODJRequest.CodingKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance ODJRequest.CodingKeys@<W0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of ODJRequest.CodingKeys.init(rawValue:);
  BOOL result = ODJRequest.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ODJRequest.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ODJRequest.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL protocol witness for CodingKey.init(stringValue:) in conformance ODJRequest.CodingKeys@<W0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  BOOL result = ODJRequest.CodingKeys.init(stringValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance ODJRequest.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance ODJRequest.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ODJRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ODJRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void ODJRequest.init(from:)()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ODJRequest.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_5();
  unint64_t v2 = lazy protocol witness table accessor for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys();
  OUTLINED_FUNCTION_3((uint64_t)&type metadata for ODJRequest.CodingKeys, v3, v2);
  if (!v1)
  {
    lazy protocol witness table accessor for type JSONPayload and conformance JSONPayload();
    OUTLINED_FUNCTION_20((uint64_t)&type metadata for JSONPayload, v4);
    uint64_t v5 = OUTLINED_FUNCTION_2();
    v6(v5);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12();
}

void JSONPayload.CodingKeys.hash(into:)()
{
}

uint64_t JSONPayload.CodingKeys.stringValue.getter()
{
  return 0x74736575716572;
}

void protocol witness for Decodable.init(from:) in conformance ODJRequest(void *a1@<X8>)
{
  ODJRequest.init(from:)();
  if (!v1) {
    *a1 = v3;
  }
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JSONPayload.CodingKeys()
{
  return JSONPayload.CodingKeys.hashValue.getter();
}

void JSONPayload.init(from:)()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JSONPayload.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_5();
  unint64_t v2 = lazy protocol witness table accessor for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys();
  OUTLINED_FUNCTION_3((uint64_t)&unk_100015220, v3, v2);
  if (!v1)
  {
    lazy protocol witness table accessor for type ODJRequestBatch and conformance ODJRequestBatch();
    OUTLINED_FUNCTION_14();
    uint64_t v4 = OUTLINED_FUNCTION_2();
    v5(v4);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12();
}

uint64_t ODJRequestBatch.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6863746162 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t ODJRequestBatch.CodingKeys.stringValue.getter()
{
  return 0x6863746162;
}

void ODJRequestBatch.init(from:)()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ODJRequestBatch.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_5();
  unint64_t v2 = lazy protocol witness table accessor for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys();
  OUTLINED_FUNCTION_3((uint64_t)&unk_1000152D8, v3, v2);
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : PropertyIdentifierRequest]);
    lazy protocol witness table accessor for type [String : PropertyIdentifierRequest] and conformance <> [A : B]();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v4 = OUTLINED_FUNCTION_2();
    v5(v4);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12();
}

uint64_t JSONPayload.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int JSONPayload.CodingKeys.hashValue.getter()
{
  return Hasher._finalize()();
}

void PropertyIdentifierRequest.init(from:)()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PropertyIdentifierRequest.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_5();
  unint64_t v2 = lazy protocol witness table accessor for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys();
  OUTLINED_FUNCTION_3((uint64_t)&unk_1000153E8, v3, v2);
  if (!v1)
  {
    lazy protocol witness table accessor for type JSONRequest and conformance JSONRequest();
    OUTLINED_FUNCTION_14();
    uint64_t v4 = OUTLINED_FUNCTION_2();
    v5(v4);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_12();
}

BOOL JSONRequest.Command.init(rawValue:)(Swift::String a1)
{
  v1._rawValue = &outlined read-only object #0 of JSONRequest.Command.init(rawValue:);
  return ODJRequest.CodingKeys.init(rawValue:)(a1, v1);
}

uint64_t JSONRequest.Command.rawValue.getter()
{
  return 0x6F72506863746566;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JSONPayload.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = JSONPayload.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance JSONPayload.CodingKeys()
{
  return protocol witness for CodingKey.intValue.getter in conformance ODJRequest.CodingKeys();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance JSONPayload.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ODJRequest.CodingKeys.init(intValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JSONPayload.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JSONPayload.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Decodable.init(from:) in conformance JSONPayload(void *a1@<X8>)
{
  JSONPayload.init(from:)();
  if (!v1) {
    *a1 = v3;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ODJRequestBatch.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ODJRequestBatch.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ODJRequestBatch.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ODJRequestBatch.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Decodable.init(from:) in conformance ODJRequestBatch(void *a1@<X8>)
{
  ODJRequestBatch.init(from:)();
  if (!v1) {
    *a1 = v3;
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JSONPayload.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PropertyIdentifierRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PropertyIdentifierRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Decodable.init(from:) in conformance PropertyIdentifierRequest(unsigned char *a1@<X8>)
{
  PropertyIdentifierRequest.init(from:)();
  if (!v1)
  {
    *a1 = v3 & 1;
    a1[1] = HIBYTE(v3);
  }
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JSONRequest.Command()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance JSONRequest.Command@<W0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of JSONRequest.Command.init(rawValue:);
  BOOL result = ODJRequest.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance JSONRequest.Command@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = JSONRequest.Command.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance JSONRequest.Command()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance JSONRequest.Command()
{
  return RawRepresentable<>.encode(to:)();
}

BOOL static JSONRequest.CodingKeys.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void JSONRequest.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

uint64_t JSONRequest.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79747265706F7270 && a2 == 0xEC000000656D614ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t JSONRequest.CodingKeys.init(intValue:)()
{
  return 2;
}

uint64_t JSONRequest.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x79747265706F7270;
  }
  else {
    return 0x646E616D6D6F63;
  }
}

void JSONRequest.encode(to:)()
{
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JSONRequest.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_8();
  lazy protocol witness table accessor for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys();
  OUTLINED_FUNCTION_13();
  lazy protocol witness table accessor for type JSONRequest.Command and conformance JSONRequest.Command();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v0)
  {
    lazy protocol witness table accessor for type Property and conformance Property();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  OUTLINED_FUNCTION_7();
  v1();
  OUTLINED_FUNCTION_12();
}

void JSONRequest.init(from:)()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JSONRequest.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_5();
  unint64_t v2 = lazy protocol witness table accessor for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys();
  OUTLINED_FUNCTION_3((uint64_t)&unk_100015190, v3, v2);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1(v0);
  }
  else
  {
    char v6 = 0;
    lazy protocol witness table accessor for type JSONRequest.Command and conformance JSONRequest.Command();
    OUTLINED_FUNCTION_20((uint64_t)&type metadata for JSONRequest.Command, (uint64_t)&v6);
    lazy protocol witness table accessor for type Property and conformance Property();
    OUTLINED_FUNCTION_14();
    uint64_t v4 = OUTLINED_FUNCTION_2();
    v5(v4);
    __swift_destroy_boxed_opaque_existential_1(v0);
  }
  OUTLINED_FUNCTION_12();
}

MusicUIEngagementExtension::Property_optional __swiftcall Property.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v1 >= 0x13) {
    return (MusicUIEngagementExtension::Property_optional)19;
  }
  else {
    return (MusicUIEngagementExtension::Property_optional)v1;
  }
}

MusicUIEngagementExtension::Property_optional __swiftcall Property.init(intValue:)(Swift::Int intValue)
{
  return (MusicUIEngagementExtension::Property_optional)19;
}

unint64_t Property.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000020;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 2:
    case 13:
    case 15:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000022;
      break;
    case 5:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 10:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 11:
      unint64_t result = 0xD000000000000017;
      break;
    case 12:
      unint64_t result = 0xD000000000000015;
      break;
    case 14:
      unint64_t result = 0xD000000000000011;
      break;
    case 16:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 17:
      unint64_t result = 0xD000000000000010;
      break;
    case 18:
      unint64_t result = 0x6574617453696C6DLL;
      break;
    default:
      return result;
  }
  return result;
}

BOOL ODJResponse.CodingKeys.init(rawValue:)(Swift::String a1)
{
  v1._rawValue = &outlined read-only object #0 of ODJResponse.CodingKeys.init(rawValue:);
  return ODJRequest.CodingKeys.init(rawValue:)(a1, v1);
}

BOOL ODJRequest.CodingKeys.init(rawValue:)(Swift::String string, Swift::OpaquePointer cases)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  return v5 != 0;
}

BOOL ODJResponse.CodingKeys.init(stringValue:)(Swift::String a1)
{
  v1._rawValue = &outlined read-only object #0 of ODJResponse.CodingKeys.init(rawValue:);
  return ODJRequest.CodingKeys.init(rawValue:)(a1, v1);
}

uint64_t ODJResponse.JSONPayload.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x726F727265;
  }
  else {
    return 0x65736E6F70736572;
  }
}

void ODJResponse.JSONPayload.encode(to:)()
{
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ODJResponse.JSONPayload.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_8();
  lazy protocol witness table accessor for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys();
  OUTLINED_FUNCTION_13();
  outlined init with take of ODJResponse.JSONPayload?(v0, (uint64_t)&v6, &demangling cache variable for type metadata for [String : ODJResponse.PropertyIdentifierResponse]?);
  outlined init with take of ODJResponse.JSONPayload?((uint64_t)&v6, (uint64_t)v3, &demangling cache variable for type metadata for [String : ODJResponse.PropertyIdentifierResponse]?);
  char v4 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : ODJResponse.PropertyIdentifierResponse]);
  lazy protocol witness table accessor for type [String : ODJResponse.PropertyIdentifierResponse] and conformance <> [A : B]();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v1)
  {
    outlined init with take of ODJResponse.JSONPayload?(v0 + 8, (uint64_t)v5, &demangling cache variable for type metadata for ODJResponse.JSONPayloadError?);
    outlined init with take of ODJResponse.JSONPayload?((uint64_t)v5, (uint64_t)v3, &demangling cache variable for type metadata for ODJResponse.JSONPayloadError?);
    char v4 = 1;
    lazy protocol witness table accessor for type ODJResponse.JSONPayloadError and conformance ODJResponse.JSONPayloadError();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  OUTLINED_FUNCTION_7();
  v2();
  OUTLINED_FUNCTION_12();
}

uint64_t ODJResponse.JSONPayloadError.ErrorCode.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance JSONRequest.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static JSONRequest.CodingKeys.__derived_enum_equals(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JSONRequest.CodingKeys()
{
  return JSONRequest.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance JSONRequest.CodingKeys(uint64_t a1)
{
  JSONRequest.CodingKeys.hash(into:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance JSONRequest.CodingKeys()
{
  return JSONRequest.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JSONRequest.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = JSONRequest.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance JSONRequest.CodingKeys()
{
  return protocol witness for CodingKey.intValue.getter in conformance ODJRequest.CodingKeys();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance JSONRequest.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = JSONRequest.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JSONRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JSONRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Decodable.init(from:) in conformance JSONRequest(unsigned char *a1@<X8>)
{
  JSONRequest.init(from:)();
  if (!v1)
  {
    *a1 = v3 & 1;
    a1[1] = HIBYTE(v3);
  }
}

void protocol witness for Encodable.encode(to:) in conformance JSONRequest()
{
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Property(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

MusicUIEngagementExtension::Property_optional protocol witness for RawRepresentable.init(rawValue:) in conformance Property@<W0>(Swift::String *a1@<X0>, MusicUIEngagementExtension::Property_optional *a2@<X8>)
{
  result.value = Property.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Property@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = Property.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Property()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Property(uint64_t a1)
{
  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Property(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance Property()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance Property()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance Property()
{
  return Property.stringValue.getter(*v0);
}

MusicUIEngagementExtension::Property_optional protocol witness for CodingKey.init(stringValue:) in conformance Property@<W0>(uint64_t a1@<X0>, MusicUIEngagementExtension::Property_optional *a2@<X8>)
{
  result.value = Property.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Property(unsigned char *a1@<X8>)
{
  *a1 = 19;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Property(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Property and conformance Property();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Property(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type Property and conformance Property();

  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance ODJResponse.CodingKeys@<W0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of ODJResponse.CodingKeys.init(rawValue:);
  BOOL result = ODJRequest.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

BOOL protocol witness for CodingKey.init(stringValue:) in conformance ODJResponse.CodingKeys@<W0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  BOOL result = ODJResponse.CodingKeys.init(stringValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ODJResponse.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ODJResponse.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ODJResponse.JSONPayload.CodingKeys()
{
  return ODJResponse.JSONPayload.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ODJResponse.JSONPayload.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ODJResponse.JSONPayload.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ODJResponse.JSONPayload.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ODJResponse.JSONPayload.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Encodable.encode(to:) in conformance ODJResponse.JSONPayload()
{
}

BOOL static ODJResponse.JSONPayloadError.CodingKeys.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void ODJResponse.JSONPayloadError.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t ODJResponse.JSONPayloadError.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701080931 && a2 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6567617373656DLL && a2 == 0xE700000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t ODJResponse.JSONPayloadError.CodingKeys.init(intValue:)()
{
  return 3;
}

Swift::Int ODJResponse.JSONPayloadError.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t ODJResponse.JSONPayloadError.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aCode_0[8 * a1];
}

void ODJResponse.JSONPayloadError.encode(to:)()
{
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ODJResponse.JSONPayloadError.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_8();
  lazy protocol witness table accessor for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys();
  OUTLINED_FUNCTION_13();
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v0)
  {
    KeyedEncodingContainer.encode(_:forKey:)();
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  OUTLINED_FUNCTION_7();
  v1();
  OUTLINED_FUNCTION_12();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ODJResponse.JSONPayloadError.CodingKeys(char *a1, char *a2)
{
  return static ODJResponse.JSONPayloadError.CodingKeys.__derived_enum_equals(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ODJResponse.JSONPayloadError.CodingKeys()
{
  return ODJResponse.JSONPayloadError.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ODJResponse.JSONPayloadError.CodingKeys(uint64_t a1)
{
  ODJResponse.JSONPayloadError.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ODJResponse.JSONPayloadError.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ODJResponse.JSONPayloadError.CodingKeys()
{
  return ODJResponse.JSONPayloadError.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ODJResponse.JSONPayloadError.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ODJResponse.JSONPayloadError.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ODJResponse.JSONPayloadError.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ODJResponse.JSONPayloadError.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ODJResponse.JSONPayloadError.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ODJResponse.JSONPayloadError.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

void protocol witness for Encodable.encode(to:) in conformance ODJResponse.JSONPayloadError()
{
}

uint64_t ODJResponse.PropertyIdentifierResponse.encode(to:)(void *a1)
{
  BOOL v3 = v1;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<Property>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_18();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ODJResponse.PropertyIdentifierResponse.CodingKeys>);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  __chkstk_darwin();
  OUTLINED_FUNCTION_18();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v36 = v3;
  uint64_t v11 = *v3;
  if (!v11)
  {
LABEL_36:
    outlined init with take of ODJResponse.JSONPayload?((uint64_t)(v36 + 1), (uint64_t)v46, &demangling cache variable for type metadata for ODJResponse.JSONPayloadError?);
    outlined init with take of ODJResponse.JSONPayload?((uint64_t)v46, (uint64_t)&v47, &demangling cache variable for type metadata for ODJResponse.JSONPayloadError?);
    if ((void)v48)
    {
      v44[0] = v47;
      v44[1] = v48;
      uint64_t v45 = v49;
      LOBYTE(v41) = 1;
      lazy protocol witness table accessor for type ODJResponse.JSONPayloadError and conformance ODJResponse.JSONPayloadError();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v10, v5);
  }
  LOBYTE(v44[0]) = 0;
  lazy protocol witness table accessor for type Property and conformance Property();
  swift_bridgeObjectRetain();
  uint64_t v35 = v5;
  uint64_t v34 = v10;
  uint64_t result = KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  int64_t v13 = 0;
  uint64_t v37 = v11 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v11 + 64);
  int64_t v38 = (unint64_t)(v14 + 63) >> 6;
  while (v16)
  {
    unint64_t v17 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v18 = v17 | (v13 << 6);
LABEL_7:
    uint64_t v19 = *(void *)(v11 + 56);
    LOBYTE(v41) = *(unsigned char *)(*(void *)(v11 + 48) + v18);
    outlined init with copy of Encodable?(v19 + 40 * v18, (uint64_t)&v41 + 8);
LABEL_17:
    outlined init with take of ODJResponse.JSONPayload?((uint64_t)&v41, (uint64_t)v44, &demangling cache variable for type metadata for (key: Property, value: Encodable?)?);
    if (v45 == 1)
    {
      swift_release();
      uint64_t v24 = OUTLINED_FUNCTION_6();
      v25(v24);
      uint64_t v5 = v35;
      uint64_t v10 = v34;
      goto LABEL_36;
    }
    char v22 = v44[0];
    outlined init with take of ODJResponse.JSONPayload?((uint64_t)v44 + 8, (uint64_t)&v39, &demangling cache variable for type metadata for Encodable?);
    if (v40)
    {
      outlined init with take of Encodable(&v39, (uint64_t)&v41);
      __swift_project_boxed_opaque_existential_1(&v41, *((uint64_t *)&v42 + 1));
      LOBYTE(v39) = v22;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      if (v2)
      {
        swift_release();
        uint64_t v26 = OUTLINED_FUNCTION_6();
        v27(v26);
        uint64_t v28 = OUTLINED_FUNCTION_9();
        v29(v28);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
      }
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    }
    else
    {
      outlined destroy of Encodable?((uint64_t)&v39);
      LOBYTE(v41) = v22;
      uint64_t result = KeyedEncodingContainer.encodeNil(forKey:)();
      if (v2)
      {
        swift_release();
        uint64_t v30 = OUTLINED_FUNCTION_6();
        v31(v30);
        uint64_t v32 = OUTLINED_FUNCTION_9();
        return v33(v32);
      }
    }
  }
  int64_t v20 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v20 >= v38) {
    goto LABEL_16;
  }
  unint64_t v21 = *(void *)(v37 + 8 * v20);
  if (v21)
  {
LABEL_11:
    unint64_t v16 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v20 << 6);
    int64_t v13 = v20;
    goto LABEL_7;
  }
  v13 += 2;
  if (v20 + 1 >= v38)
  {
    int64_t v13 = v20;
LABEL_16:
    unint64_t v16 = 0;
    long long v42 = 0u;
    long long v41 = 0u;
    long long v43 = xmmword_1000106E0;
    goto LABEL_17;
  }
  unint64_t v21 = *(void *)(v37 + 8 * v13);
  if (v21)
  {
    ++v20;
    goto LABEL_11;
  }
  if (v20 + 2 >= v38) {
    goto LABEL_16;
  }
  unint64_t v21 = *(void *)(v37 + 8 * (v20 + 2));
  if (v21)
  {
    v20 += 2;
    goto LABEL_11;
  }
  int64_t v23 = v20 + 3;
  if (v20 + 3 >= v38)
  {
    int64_t v13 = v20 + 2;
    goto LABEL_16;
  }
  unint64_t v21 = *(void *)(v37 + 8 * v23);
  if (v21)
  {
    v20 += 3;
    goto LABEL_11;
  }
  while (1)
  {
    int64_t v20 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v20 >= v38)
    {
      int64_t v13 = v38 - 1;
      goto LABEL_16;
    }
    unint64_t v21 = *(void *)(v37 + 8 * v20);
    ++v23;
    if (v21) {
      goto LABEL_11;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t ODJResponse.JSONPayload.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

Swift::Int JSONRequest.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

void ODJResponse.encode(to:)()
{
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ODJResponse.CodingKeys>);
  OUTLINED_FUNCTION_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_8();
  lazy protocol witness table accessor for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  outlined init with take of ODJResponse.JSONPayload?(v0, (uint64_t)v3, &demangling cache variable for type metadata for ODJResponse.JSONPayload?);
  outlined init with take of ODJResponse.JSONPayload?((uint64_t)v3, (uint64_t)&v2, &demangling cache variable for type metadata for ODJResponse.JSONPayload?);
  lazy protocol witness table accessor for type ODJResponse.JSONPayload and conformance ODJResponse.JSONPayload();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  OUTLINED_FUNCTION_7();
  v1();
  OUTLINED_FUNCTION_12();
}

void protocol witness for CodingKey.init(intValue:) in conformance ODJResponse.PropertyIdentifierResponse.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ODJResponse.PropertyIdentifierResponse.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ODJResponse.PropertyIdentifierResponse.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ODJResponse.PropertyIdentifierResponse(void *a1)
{
  return ODJResponse.PropertyIdentifierResponse.encode(to:)(a1);
}

void protocol witness for Encodable.encode(to:) in conformance ODJResponse()
{
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSJSONWritingOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSJSONReadingOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MPMediaLibraryContentGroups(uint64_t *a1, uint64_t *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MPMediaLibraryContentGroups(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t getEnumTag for JSONRequest.Command()
{
  return 0;
}

void type metadata accessor for JSONRequest.Command()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Property(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEE)
  {
    if (a2 + 18 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 18) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 19;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v5 = v6 - 19;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Property(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *uint64_t result = a2 + 18;
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
        JUMPOUT(0x100007344);
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
          *uint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

void type metadata accessor for Property()
{
}

uint64_t outlined destroy of ODJResponse.JSONPayloadError(uint64_t a1)
{
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

void type metadata accessor for ODJResponse.PropertyIdentifierResponse()
{
}

uint64_t destroy for ODJResponse.JSONPayloadError()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ODJResponse.JSONPayloadError(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ODJResponse.JSONPayloadError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
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

uint64_t assignWithTake for ODJResponse.JSONPayloadError(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ODJResponse.JSONPayloadError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ODJResponse.JSONPayloadError(uint64_t result, int a2, int a3)
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

void type metadata accessor for ODJResponse.JSONPayloadError()
{
}

void *initializeBufferWithCopyOfBuffer for ODJRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ODJRequest()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ODJRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *assignWithTake for ODJRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ODJRequest(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ODJRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

void type metadata accessor for ODJRequest()
{
}

uint64_t destroy for ODJResponse(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t result = a1[3];
    if (result)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t initializeWithCopy for ODJResponse(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    uint64_t v5 = *(void *)(a2 + 24);
    swift_bridgeObjectRetain();
    if (v5)
    {
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      uint64_t v6 = *(void *)(a2 + 32);
      uint64_t v7 = *(void *)(a2 + 40);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v6;
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v8 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a1 + 24) = v8;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
    }
  }
  return a1;
}

uint64_t assignWithCopy for ODJResponse(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *a2;
  if (v4 == 1)
  {
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)a2;
      long long v7 = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
      *(_OWORD *)(a1 + 32) = v7;
      *(_OWORD *)a1 = v6;
      return a1;
    }
    *(void *)a1 = v5;
    uint64_t v10 = a1 + 8;
    uint64_t v11 = a2[3];
    swift_bridgeObjectRetain();
    if (!v11)
    {
      long long v12 = *(_OWORD *)(a2 + 1);
      long long v13 = *(_OWORD *)(a2 + 3);
      uint64_t v14 = a2[5];
LABEL_15:
      *(void *)(v10 + 32) = v14;
      *(_OWORD *)uint64_t v10 = v12;
      *(_OWORD *)(v10 + 16) = v13;
      return a1;
    }
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    outlined destroy of ODJResponse.JSONPayload(a1);
    long long v9 = *((_OWORD *)a2 + 1);
    long long v8 = *((_OWORD *)a2 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    *(_OWORD *)(a1 + 32) = v8;
    return a1;
  }
  *(void *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a1 + 8;
  uint64_t v15 = (long long *)(a2 + 1);
  uint64_t v16 = a2[3];
  if (!*(void *)(a1 + 24))
  {
    if (!v16)
    {
      long long v12 = *v15;
      long long v13 = *(_OWORD *)(a2 + 3);
      uint64_t v14 = a2[5];
      goto LABEL_15;
    }
LABEL_12:
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (v16)
  {
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of ODJResponse.JSONPayloadError(a1 + 8);
    uint64_t v17 = a2[5];
    long long v18 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)uint64_t v10 = *v15;
    *(_OWORD *)(a1 + 24) = v18;
    *(void *)(a1 + 40) = v17;
  }
  return a1;
}

uint64_t outlined destroy of ODJResponse.JSONPayload(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for ODJResponse(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != 1)
  {
    if (*(void *)a2 != 1)
    {
      *(void *)a1 = *(void *)a2;
      swift_bridgeObjectRelease();
      if (*(void *)(a1 + 24))
      {
        uint64_t v6 = *(void *)(a2 + 24);
        if (v6)
        {
          *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
          *(void *)(a1 + 24) = v6;
          swift_bridgeObjectRelease();
          uint64_t v7 = *(void *)(a2 + 40);
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          *(void *)(a1 + 40) = v7;
          swift_bridgeObjectRelease();
          return a1;
        }
        outlined destroy of ODJResponse.JSONPayloadError(a1 + 8);
      }
      long long v8 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a1 + 24) = v8;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      return a1;
    }
    outlined destroy of ODJResponse.JSONPayload(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ODJResponse(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFD && *((unsigned char *)a1 + 48))
    {
      int v2 = *(_DWORD *)a1 + 2147483645;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v4 = v3 - 1;
      if (v4 < 0) {
        int v4 = -1;
      }
      BOOL v5 = __OFSUB__(v4, 1);
      int v2 = v4 - 1;
      if (v2 < 0 != v5) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ODJResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for ODJResponse()
{
}

uint64_t initializeBufferWithCopyOfBuffer for ODJResponse.JSONPayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ODJResponse.PropertyIdentifierResponse(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ODJResponse.PropertyIdentifierResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  int v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v5)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    uint64_t v6 = *(void *)(a2 + 32);
    uint64_t v7 = *(void *)(a2 + 40);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 24);
    *int v4 = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v8;
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
  }
  return a1;
}

uint64_t assignWithCopy for ODJResponse.PropertyIdentifierResponse(uint64_t a1, void *a2)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = a2 + 1;
  uint64_t v6 = a2[3];
  if (*(void *)(a1 + 24))
  {
    if (v6)
    {
      OUTLINED_FUNCTION_15();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      outlined destroy of ODJResponse.JSONPayloadError(a1 + 8);
      uint64_t v7 = a2[5];
      long long v8 = *(_OWORD *)(a2 + 3);
      *int v4 = *v5;
      *(_OWORD *)(a1 + 24) = v8;
      *(void *)(a1 + 40) = v7;
    }
  }
  else if (v6)
  {
    OUTLINED_FUNCTION_15();
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *v5;
    long long v10 = *(_OWORD *)(a2 + 3);
    *(void *)(a1 + 40) = a2[5];
    *int v4 = v9;
    *(_OWORD *)(a1 + 24) = v10;
  }
  return a1;
}

uint64_t assignWithTake for ODJResponse.PropertyIdentifierResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 24)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 24);
  if (!v4)
  {
    outlined destroy of ODJResponse.JSONPayloadError(a1 + 8);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v6;
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    return a1;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ODJResponse.PropertyIdentifierResponse(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 48)) {
      return OUTLINED_FUNCTION_19(*(_DWORD *)a1 + 2147483646);
    }
    uint64_t v3 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v3) = -1;
    }
    int v4 = v3 - 1;
    if (v4 < 0) {
      return OUTLINED_FUNCTION_19(-1);
    }
  }
  else
  {
    int v4 = -1;
  }
  return OUTLINED_FUNCTION_19(v4);
}

uint64_t storeEnumTagSinglePayload for ODJResponse.PropertyIdentifierResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

void type metadata accessor for ODJResponse.JSONPayload()
{
}

unint64_t lazy protocol witness table accessor for type Property and conformance Property()
{
  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Property and conformance Property;
  if (!lazy protocol witness table cache variable for type Property and conformance Property)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Property and conformance Property);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JSONRequest.Command and conformance JSONRequest.Command()
{
  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command;
  if (!lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command;
  if (!lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command;
  if (!lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command;
  if (!lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.Command and conformance JSONRequest.Command);
  }
  return result;
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

unint64_t lazy protocol witness table accessor for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.CodingKeys and conformance ODJResponse.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ODJResponse.JSONPayload and conformance ODJResponse.JSONPayload()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayload and conformance ODJResponse.JSONPayload;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayload and conformance ODJResponse.JSONPayload)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayload and conformance ODJResponse.JSONPayload);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequest.CodingKeys and conformance ODJRequest.CodingKeys);
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

unint64_t lazy protocol witness table accessor for type JSONPayload and conformance JSONPayload()
{
  unint64_t result = lazy protocol witness table cache variable for type JSONPayload and conformance JSONPayload;
  if (!lazy protocol witness table cache variable for type JSONPayload and conformance JSONPayload)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONPayload and conformance JSONPayload);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse.CodingKeys and conformance ODJResponse.PropertyIdentifierResponse.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ODJResponse.JSONPayloadError and conformance ODJResponse.JSONPayloadError()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError and conformance ODJResponse.JSONPayloadError;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError and conformance ODJResponse.JSONPayloadError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError and conformance ODJResponse.JSONPayloadError);
  }
  return result;
}

uint64_t outlined init with copy of Encodable?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Encodable?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with take of Encodable(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t lazy protocol witness table accessor for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayloadError.CodingKeys and conformance ODJResponse.JSONPayloadError.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.JSONPayload.CodingKeys and conformance ODJResponse.JSONPayload.CodingKeys);
  }
  return result;
}

uint64_t outlined init with take of ODJResponse.JSONPayload?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
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

unint64_t lazy protocol witness table accessor for type ODJResponse.PropertyIdentifierResponse and conformance ODJResponse.PropertyIdentifierResponse()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse and conformance ODJResponse.PropertyIdentifierResponse;
  if (!lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse and conformance ODJResponse.PropertyIdentifierResponse)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse.PropertyIdentifierResponse and conformance ODJResponse.PropertyIdentifierResponse);
  }
  return result;
}

void *type metadata accessor for ODJResponse.JSONPayload.CodingKeys()
{
  return &unk_100014E18;
}

uint64_t getEnumTagSinglePayload for ODJResponse.JSONPayloadError.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ODJResponse.JSONPayloadError.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000087D4);
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

uint64_t getEnumTag for ODJResponse.JSONPayloadError.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ODJResponse.JSONPayloadError.CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void *type metadata accessor for ODJResponse.JSONPayloadError.CodingKeys()
{
  return &unk_100014EA8;
}

void type metadata accessor for ODJResponse.PropertyIdentifierResponse.CodingKeys()
{
}

void type metadata accessor for ODJRequest.CodingKeys()
{
}

void type metadata accessor for ODJResponse.CodingKeys()
{
}

void type metadata accessor for JSONPayload()
{
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

void type metadata accessor for JSONRequest()
{
}

unint64_t lazy protocol witness table accessor for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONPayload.CodingKeys and conformance JSONPayload.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ODJRequestBatch and conformance ODJRequestBatch()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJRequestBatch and conformance ODJRequestBatch;
  if (!lazy protocol witness table cache variable for type ODJRequestBatch and conformance ODJRequestBatch)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequestBatch and conformance ODJRequestBatch);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest.CodingKeys and conformance JSONRequest.CodingKeys);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ODJResponse.JSONPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_19(-1);
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
      return OUTLINED_FUNCTION_19((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_19((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_19((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_19(v8);
}

unsigned char *storeEnumTagSinglePayload for ODJResponse.JSONPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009080);
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

unsigned char *destructiveInjectEnumTag for JSONRequest.CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for JSONRequest.CodingKeys()
{
  return &unk_100015190;
}

void *type metadata accessor for JSONPayload.CodingKeys()
{
  return &unk_100015220;
}

void type metadata accessor for ODJRequestBatch()
{
}

unint64_t lazy protocol witness table accessor for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys;
  if (!lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequestBatch.CodingKeys and conformance ODJRequestBatch.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PropertyIdentifierRequest and conformance PropertyIdentifierRequest()
{
  unint64_t result = lazy protocol witness table cache variable for type PropertyIdentifierRequest and conformance PropertyIdentifierRequest;
  if (!lazy protocol witness table cache variable for type PropertyIdentifierRequest and conformance PropertyIdentifierRequest)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PropertyIdentifierRequest and conformance PropertyIdentifierRequest);
  }
  return result;
}

void *type metadata accessor for ODJRequestBatch.CodingKeys()
{
  return &unk_1000152D8;
}

uint64_t getEnumTagSinglePayload for JSONRequest(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_19(-1);
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 65298 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65298 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_19((*a1 | (v4 << 16)) - 65299);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_19((*a1 | (v4 << 16)) - 65299);
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return OUTLINED_FUNCTION_19((*a1 | (v4 << 16)) - 65299);
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_19(v8);
}

uint64_t storeEnumTagSinglePayload for JSONRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65298 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65298 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 238;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100009538);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)(result + 1) = a2 + 18;
        break;
    }
  }
  return result;
}

void type metadata accessor for PropertyIdentifierRequest()
{
}

unint64_t lazy protocol witness table accessor for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PropertyIdentifierRequest.CodingKeys and conformance PropertyIdentifierRequest.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JSONRequest and conformance JSONRequest()
{
  unint64_t result = lazy protocol witness table cache variable for type JSONRequest and conformance JSONRequest;
  if (!lazy protocol witness table cache variable for type JSONRequest and conformance JSONRequest)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONRequest and conformance JSONRequest);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JSONRequest.Command(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for JSONRequest.Command(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000097E0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for PropertyIdentifierRequest.CodingKeys()
{
  return &unk_1000153E8;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return 0x7961702D6E6F736ALL;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)(a1, a1, a3, v3, v4);
}

void *OUTLINED_FUNCTION_5()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void *OUTLINED_FUNCTION_8()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return *(void *)(v0 - 392);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_15()
{
  v0[1] = v1[1];
  v0[2] = v1[2];
  uint64_t result = v1[3];
  v0[3] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2)
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(a1, a2, v2, a1);
}

uint64_t getEnumTagSinglePayload for ExtensionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x100009C94);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionError()
{
  return &type metadata for ExtensionError;
}

unint64_t lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError()
{
  unint64_t result = lazy protocol witness table cache variable for type ExtensionError and conformance ExtensionError;
  if (!lazy protocol witness table cache variable for type ExtensionError and conformance ExtensionError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtensionError and conformance ExtensionError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExtensionError and conformance ExtensionError;
  if (!lazy protocol witness table cache variable for type ExtensionError and conformance ExtensionError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtensionError and conformance ExtensionError);
  }
  return result;
}

uint64_t protocol witness for Error._domain.getter in conformance ExtensionError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance ExtensionError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance ExtensionError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ExtensionError()
{
  return Error._getEmbeddedNSError()();
}

BOOL specialized == infix<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  unint64_t v3 = Property.rawValue.getter(a1);
  uint64_t v5 = v4;
  if (v3 == Property.rawValue.getter(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  Property.rawValue.getter(a2);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  return Hasher._finalize()();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static MusicUIEngagementExtension.logger);
  __swift_project_value_buffer(v0, (uint64_t)static MusicUIEngagementExtension.logger);
  return Logger.init(subsystem:category:)();
}

uint64_t one-time initialization function for decoder(uint64_t a1)
{
  return one-time initialization function for decoder(a1, (void (*)(void))&type metadata accessor for JSONDecoder, (uint64_t (*)(void))&JSONDecoder.init(), &static MusicUIEngagementExtension.decoder);
}

uint64_t one-time initialization function for encoder(uint64_t a1)
{
  return one-time initialization function for decoder(a1, (void (*)(void))&type metadata accessor for JSONEncoder, (uint64_t (*)(void))&JSONEncoder.init(), &static MusicUIEngagementExtension.encoder);
}

uint64_t one-time initialization function for decoder(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

id one-time initialization function for userDefaults()
{
  uint64_t v0 = static UnifiedMessages.defaultsSuiteName.getter();
  uint64_t v2 = v1;
  id v3 = objc_allocWithZone((Class)NSUserDefaults);
  id result = @nonobjc NSUserDefaults.init(suiteName:)(v0, v2);
  static MusicUIEngagementExtension.userDefaults = (uint64_t)result;
  return result;
}

uint64_t static MusicUIEngagementExtension.performRequest(with:completion:)(void *a1, void (*a2)(long long *, uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin();
  long long v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [self sharedPrivacyInfo];
  unsigned __int8 v11 = [v10 privacyAcknowledgementRequiredForMusic];

  if ((v11 & 1) == 0)
  {
    uint64_t v30 = self;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    LODWORD(v30) = [v30 isValidJSONObject:_bridgeAnythingToObjectiveC<A>(_:)()];
    swift_unknownObjectRelease();
    if (v30)
    {
      uint64_t v31 = type metadata accessor for TaskPriority();
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v31);
      outlined init with copy of Any((uint64_t)a1, (uint64_t)&v77);
      type metadata accessor for MainActor();
      swift_retain();
      uint64_t v32 = static MainActor.shared.getter();
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = v32;
      *(void *)(v33 + 24) = &protocol witness table for MainActor;
      outlined init with take of Any(&v77, (_OWORD *)(v33 + 32));
      *(void *)(v33 + 64) = v4;
      *(void *)(v33 + 72) = a2;
      *(void *)(v33 + 80) = a3;
      *(void *)(v33 + 88) = v4;
      _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:), v33);
      return swift_release();
    }
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v35 = type metadata accessor for Logger();
    __swift_project_value_buffer(v35, (uint64_t)static MusicUIEngagementExtension.logger);
    v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_13_0(v37))
    {
      int64_t v38 = (_DWORD *)OUTLINED_FUNCTION_3_0();
      uint64_t v39 = OUTLINED_FUNCTION_4_0();
      *int64_t v38 = 136446210;
      *(void *)&long long v77 = v39;
      v76[0] = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000025, 0x80000001000119C0, (uint64_t *)&v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_29((void *)&_mh_execute_header, v36, v40, "🧩 %{public}s");
      OUTLINED_FUNCTION_32();
      OUTLINED_FUNCTION_0_0(v39);
      OUTLINED_FUNCTION_0_0((uint64_t)v38);
    }

    unint64_t v41 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v42 = OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v41);
    *long long v43 = 4;
    a2(&v77, v42);
    goto LABEL_20;
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static MusicUIEngagementExtension.logger);
  long long v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  v73 = a2;
  if (v15)
  {
    uint64_t v16 = OUTLINED_FUNCTION_17_0();
    uint64_t v17 = OUTLINED_FUNCTION_28();
    *(void *)&long long v77 = v17;
    *(_DWORD *)uint64_t v16 = 136446466;
    uint64_t v18 = OUTLINED_FUNCTION_40((uint64_t)"xtensionLoaderError");
    OUTLINED_FUNCTION_16_0(v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v16 + 12) = 2082;
    uint64_t v19 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ALL, 0x8000000100011AA0, (uint64_t *)&v77);
    OUTLINED_FUNCTION_37(v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_34((void *)&_mh_execute_header, v20, v21, "🧩 %{public}s: %{public}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0(v17);
    OUTLINED_FUNCTION_0_0(v16);
  }

  if (one-time initialization token for encoder != -1) {
    swift_once();
  }
  long long v77 = xmmword_1000116D0;
  *(void *)&long long v78 = 0xD00000000000004BLL;
  *((void *)&v78 + 1) = 0x80000001000119F0;
  unint64_t v79 = 0xD000000000000023;
  unint64_t v80 = 0x8000000100011A40;
  lazy protocol witness table accessor for type ODJResponse and conformance ODJResponse();
  uint64_t v48 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v50 = v49;
  self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v76[0] = 0;
  v52 = (void *)OUTLINED_FUNCTION_26();
  id v54 = [v52 v53];

  id v55 = v76[0];
  if (!v54)
  {
    v66 = v55;
    uint64_t v67 = _convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v48, v50);
    swift_errorRetain();
    swift_errorRetain();
    char v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      OUTLINED_FUNCTION_17_0();
      uint64_t v24 = (void *)OUTLINED_FUNCTION_31();
      uint64_t v25 = OUTLINED_FUNCTION_4_0();
      *(void *)&long long v77 = v25;
      *(_DWORD *)uint64_t v67 = 136446466;
      uint64_t v26 = OUTLINED_FUNCTION_40((uint64_t)"xtensionLoaderError");
      OUTLINED_FUNCTION_16_0(v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v67 + 12) = 2114;
      swift_errorRetain();
      uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_37(v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v24 = v27;
      swift_errorRelease();
      swift_errorRelease();
      OUTLINED_FUNCTION_34((void *)&_mh_execute_header, v28, v29, "🧩 %{public}s: %{public}@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_0((uint64_t)v24);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_0_0(v25);
      OUTLINED_FUNCTION_0_0(v67);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v44 = v73;
    unint64_t v45 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v46 = OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v45);
    *long long v47 = 3;
    v44(&v77, v46);
    swift_errorRelease();
LABEL_20:
    swift_errorRelease();
    return outlined destroy of Any?((uint64_t)&v77, &demangling cache variable for type metadata for Any?);
  }
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  outlined init with copy of Any((uint64_t)&v77, (uint64_t)v76);
  v56 = (void *)Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_13_0(v57))
  {
    uint64_t v58 = OUTLINED_FUNCTION_17_0();
    uint64_t v59 = OUTLINED_FUNCTION_28();
    uint64_t v75 = v59;
    *(_DWORD *)uint64_t v58 = 136446466;
    uint64_t v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, 0x8000000100011A70, &v75);
    OUTLINED_FUNCTION_23(v60);
    *(_WORD *)(v58 + 12) = 2082;
    outlined init with copy of Any((uint64_t)v76, (uint64_t)v74);
    uint64_t v61 = String.init<A>(describing:)();
    uint64_t v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v62, &v75);
    OUTLINED_FUNCTION_23(v63);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
    OUTLINED_FUNCTION_35((void *)&_mh_execute_header, v64, v65, "🧩 %{public}s Sending JSON to ODJ: %{public}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0(v59);
    OUTLINED_FUNCTION_0_0(v58);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
  }

  v68 = (void (*)(id *, uint64_t))v73;
  outlined init with copy of Any((uint64_t)&v77, (uint64_t)v76);
  unint64_t v69 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
  uint64_t v70 = OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v69);
  unsigned char *v71 = 3;
  v68(v76, v70);
  outlined consume of Data._Representation(v48, v50);
  swift_errorRelease();
  outlined destroy of Any?((uint64_t)v76, &demangling cache variable for type metadata for Any?);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v77);
}

uint64_t closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a4;
  v8[19] = a6;
  type metadata accessor for String.Encoding();
  v8[22] = swift_task_alloc();
  type metadata accessor for MainActor();
  v8[23] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v8[24] = v9;
  v8[25] = v10;
  return _swift_task_switch(closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:), v9, v10);
}

uint64_t closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:)()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = self;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  uint64_t v3 = _bridgeAnythingToObjectiveC<A>(_:)();
  *(void *)(v0 + 128) = 0;
  id v4 = [v2 dataWithJSONObject:v3 options:0 error:v0 + 128];
  swift_unknownObjectRelease();
  id v5 = *(id *)(v0 + 128);
  if (!v4)
  {
    uint64_t v17 = v5;
    swift_release();
    uint64_t v18 = (_DWORD *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static MusicUIEngagementExtension.logger);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      OUTLINED_FUNCTION_3_0();
      uint64_t v35 = (void *)OUTLINED_FUNCTION_31();
      *uint64_t v18 = 138543362;
      swift_errorRetain();
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 120) = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v35 = v22;
      swift_errorRelease();
      swift_errorRelease();
      OUTLINED_FUNCTION_29((void *)&_mh_execute_header, v20, v23, "🧩 Failed to import JSON payload: %{public}@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_0((uint64_t)v35);
      OUTLINED_FUNCTION_0_0((uint64_t)v18);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v24 = *(void (**)(uint64_t))(v0 + 152);

    unint64_t v25 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    *(_OWORD *)(v0 + 64) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v25);
    *uint64_t v26 = 0;
    uint64_t v27 = OUTLINED_FUNCTION_27();
    v24(v27);
    swift_errorRelease();
    swift_errorRelease();
    outlined destroy of Any?(v0 + 48, &demangling cache variable for type metadata for Any?);
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_11_0();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  *(void *)(v0 + 208) = v6;
  *(void *)(v0 + 216) = v8;
  static String.Encoding.utf8.getter();
  uint64_t result = String.init(data:encoding:)();
  if (v10)
  {
    unint64_t v11 = v10;
    uint64_t v34 = result;
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)static MusicUIEngagementExtension.logger);
    swift_bridgeObjectRetain();
    long long v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      BOOL v15 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      uint64_t v16 = OUTLINED_FUNCTION_4_0();
      uint64_t v36 = v16;
      *(_DWORD *)BOOL v15 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v11, &v36);
      OUTLINED_FUNCTION_27();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "🧩 Received request: %{public}s", v15, 0xCu);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_0_0(v16);
      OUTLINED_FUNCTION_0_0((uint64_t)v15);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    if (one-time initialization token for decoder != -1) {
      swift_once();
    }
    lazy protocol witness table accessor for type ODJRequest and conformance ODJRequest();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    *(void *)(v0 + 224) = *(void *)(v0 + 112);
    uint64_t v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v30;
    *uint64_t v30 = v0;
    v30[1] = closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:);
    OUTLINED_FUNCTION_11_0();
    return static MusicUIEngagementExtension.parseRequest(request:completion:)(v31, v32);
  }
  else
  {
    __break(1u);
  }
  return result;
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
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 200);
  id v4 = *(void *)(v2 + 192);
  if (v0) {
    id v5 = closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:);
  }
  else {
    id v5 = closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:);
  }
  return _swift_task_switch(v5, v4, v3);
}

{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  void (*v3)(void *, void);
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = (void (*)(void *, void))v0[19];
  swift_release();
  outlined init with copy of Any((uint64_t)(v0 + 10), (uint64_t)(v0 + 2));
  v3(v0 + 2, 0);
  outlined consume of Data._Representation(v2, v1);
  outlined destroy of Any?((uint64_t)(v0 + 2), &demangling cache variable for type metadata for Any?);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 10));
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_0();
  return v4();
}

{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  unsigned char *v11;
  uint64_t (*v12)(void);
  uint64_t v14;

  outlined consume of Data._Representation(*(void *)(v1 + 208), *(void *)(v1 + 216));
  swift_release();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MusicUIEngagementExtension.logger);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  id v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    OUTLINED_FUNCTION_3_0();
    id v5 = (void *)OUTLINED_FUNCTION_31();
    *uint64_t v0 = 138543362;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v1 + 120) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    OUTLINED_FUNCTION_29((void *)&_mh_execute_header, v3, v7, "🧩 Failed to import JSON payload: %{public}@");
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_0_0((uint64_t)v5);
    OUTLINED_FUNCTION_0_0((uint64_t)v0);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v1 + 152);

  uint64_t v9 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  unint64_t v10 = OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v9);
  *unint64_t v11 = 0;
  v8(v1 + 48, v10);
  swift_errorRelease();
  swift_errorRelease();
  outlined destroy of Any?(v1 + 48, &demangling cache variable for type metadata for Any?);
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_0();
  return v12();
}

uint64_t static MusicUIEngagementExtension.parseRequest(request:completion:)(uint64_t a1, uint64_t a2)
{
  v3[39] = a2;
  v3[40] = v2;
  v3[38] = a1;
  return _swift_task_switch(static MusicUIEngagementExtension.parseRequest(request:completion:), 0, 0);
}

uint64_t static MusicUIEngagementExtension.parseRequest(request:completion:)()
{
  uint64_t v118 = v0;
  uint64_t v1 = (uint64_t *)(v0 + 232);
  id v2 = [self sharedPrivacyInfo];
  unsigned int v3 = [v2 privacyAcknowledgementRequiredForMusic];

  if (v3)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static MusicUIEngagementExtension.logger);
    uint64_t v5 = (void *)Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_13_0(v6))
    {
      uint64_t v7 = OUTLINED_FUNCTION_17_0();
      uint64_t v8 = OUTLINED_FUNCTION_28();
      uint64_t v117 = v8;
      *(_DWORD *)uint64_t v7 = 136446466;
      *(void *)(v0 + 296) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000021, 0x8000000100011B30, &v117);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v7 + 12) = 2082;
      *(void *)(v0 + 224) = OUTLINED_FUNCTION_24(0xD00000000000001ALL, (uint64_t)"GDPR has not been accepted", v106, v107, v108, v110, v112, v114, v116);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_35((void *)&_mh_execute_header, v9, v10, "🧩 %{public}s %{public}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_0(v8);
      OUTLINED_FUNCTION_0_0(v7);
    }

    unint64_t v11 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v11);
    char v13 = 3;
LABEL_23:
    *uint64_t v12 = v13;
    swift_willThrow();
    goto LABEL_43;
  }
  uint64_t v14 = *(void *)(v0 + 312);
  if (!v14)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)static MusicUIEngagementExtension.logger);
    uint64_t v40 = (void *)Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_7_0(v41))
    {
      uint64_t v42 = (_DWORD *)OUTLINED_FUNCTION_3_0();
      uint64_t v43 = OUTLINED_FUNCTION_4_0();
      uint64_t v117 = v43;
      *uint64_t v42 = 136446210;
      *(void *)(v0 + 280) = OUTLINED_FUNCTION_24(0xD00000000000002ALL, (uint64_t)"The ODJ Request is missing a 'request' key", v106, v107, v108, v110, v112, v114, v116);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v44, v45, "🧩 %{public}s");
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_0_0(v43);
      OUTLINED_FUNCTION_0_0((uint64_t)v42);
    }

    unint64_t v46 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v46);
    char v13 = 7;
    goto LABEL_23;
  }
  BOOL v15 = (id *)(v0 + 256);
  uint64_t v16 = Dictionary.init(dictionaryLiteral:)();
  char v17 = *(unsigned char *)(v14 + 32);
  *(unsigned char *)(v0 + 385) = v17;
  uint64_t v18 = -1;
  uint64_t v19 = -1 << v17;
  if (-(-1 << v17) < 64) {
    uint64_t v18 = ~(-1 << -(char)v19);
  }
  unint64_t v20 = v18 & *(void *)(v14 + 64);
  uint64_t v115 = v16;
  *(void *)(v0 + 328) = v16;
  swift_bridgeObjectRetain();
  if (v20)
  {
    uint64_t v21 = 0;
    unint64_t v22 = __clz(__rbit64(v20));
    uint64_t v23 = (v20 - 1) & v20;
    uint64_t v24 = *(void *)(v0 + 312);
    goto LABEL_12;
  }
  unint64_t v74 = 63 - v19;
  uint64_t v75 = *(void **)(v0 + 312);
  if ((unint64_t)(63 - v19) <= 0x7F) {
    goto LABEL_57;
  }
  if (!v75[9])
  {
    if (v74 >= 0xC0)
    {
      if (v75[10]) {
        goto LABEL_37;
      }
      if (v74 >= 0x100)
      {
        if (v75[11]) {
          goto LABEL_37;
        }
        if (v74 >= 0x140)
        {
          if (v75[12]) {
            goto LABEL_37;
          }
          unint64_t v87 = v74 >> 6;
          uint64_t v88 = 13;
          while (v88 - 8 < v87)
          {
            if (v75[v88++]) {
              goto LABEL_37;
            }
          }
        }
      }
    }
LABEL_57:
    swift_release();
    if (one-time initialization token for encoder != -1) {
      swift_once();
    }
    *(void *)(v0 + 16) = v115;
    lazy protocol witness table accessor for type ODJResponse and conformance ODJResponse();
    OUTLINED_FUNCTION_30();
    uint64_t v90 = dispatch thunk of JSONEncoder.encode<A>(_:)();
    unint64_t v92 = v91;
    swift_bridgeObjectRelease();
    self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    *BOOL v15 = 0;
    v94 = (void *)OUTLINED_FUNCTION_26();
    id v96 = [v94 v95];

    id v97 = *v15;
    if (v96)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v98 = *(void *)(v0 + 304);
      uint64_t v99 = type metadata accessor for Logger();
      __swift_project_value_buffer(v99, (uint64_t)static MusicUIEngagementExtension.logger);
      outlined init with copy of Any(v98, v0 + 176);
      v100 = Logger.logObject.getter();
      os_log_type_t v101 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v102 = OUTLINED_FUNCTION_17_0();
        uint64_t v109 = OUTLINED_FUNCTION_28();
        uint64_t v117 = v109;
        *(_DWORD *)uint64_t v102 = 136446466;
        *(void *)(v0 + 272) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000021, 0x8000000100011B30, &v117);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v102 + 12) = 2082;
        outlined init with copy of Any(v0 + 176, v0 + 144);
        uint64_t v103 = String.init<A>(describing:)();
        *(void *)(v0 + 288) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v103, v104, &v117);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 176);
        _os_log_impl((void *)&_mh_execute_header, v100, v101, "🧩 %{public}s Sending JSON to ODJ: %{public}s", (uint8_t *)v102, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_0(v109);
        OUTLINED_FUNCTION_0_0(v102);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1(v0 + 176);
      }
      outlined consume of Data._Representation(v90, v92);

      OUTLINED_FUNCTION_18_0();
LABEL_44:
      OUTLINED_FUNCTION_11_0();
      __asm { BRAA            X1, X16 }
    }
    v105 = v97;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v90, v92);
LABEL_43:
    OUTLINED_FUNCTION_18_0();
    goto LABEL_44;
  }
LABEL_37:
  OUTLINED_FUNCTION_41();
  unint64_t v22 = v76 + (v21 << 6);
LABEL_12:
  *(void *)(v0 + 336) = v21;
  *(void *)(v0 + 344) = v23;
  unint64_t v25 = (uint64_t *)(*(void *)(v24 + 48) + 16 * v22);
  uint64_t v26 = *v25;
  *(void *)(v0 + 352) = *v25;
  uint64_t v27 = v25[1];
  *(void *)(v0 + 360) = v27;
  if (*(unsigned char *)(*(void *)(v24 + 56) + 2 * v22))
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    __swift_project_value_buffer(v28, (uint64_t)static MusicUIEngagementExtension.logger);
    uint64_t v29 = (void *)Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_7_0(v30))
    {
      uint64_t v31 = (_DWORD *)OUTLINED_FUNCTION_3_0();
      uint64_t v32 = OUTLINED_FUNCTION_4_0();
      uint64_t v117 = v32;
      *uint64_t v31 = 136315138;
      uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(5390674, 0xE300000000000000, &v117);
      OUTLINED_FUNCTION_21(v33);
      OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v34, v35, "🧩 %s, privacy: .public)");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_0(v32);
      OUTLINED_FUNCTION_0_0((uint64_t)v31);
    }

    unint64_t v36 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v36);
    char v38 = 5;
LABEL_42:
    *uint64_t v37 = v38;
    swift_willThrow();
    swift_release();
    goto LABEL_43;
  }
  uint64_t v47 = one-time initialization token for logger;
  swift_bridgeObjectRetain();
  if (v47 != -1) {
    swift_once();
  }
  v111 = (uint64_t *)(v0 + 240);
  uint64_t v48 = (uint64_t *)(v0 + 248);
  uint64_t v49 = type metadata accessor for Logger();
  uint64_t v113 = __swift_project_value_buffer(v49, (uint64_t)static MusicUIEngagementExtension.logger);
  unint64_t v50 = Logger.logObject.getter();
  os_log_type_t v51 = static os_log_type_t.default.getter();
  v52 = (void *)&unk_100011000;
  if (OUTLINED_FUNCTION_7_0(v51))
  {
    uint64_t v108 = v0 + 248;
    SEL v53 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    uint64_t v54 = OUTLINED_FUNCTION_4_0();
    uint64_t v117 = v54;
    *(_DWORD *)SEL v53 = 136446210;
    uint64_t v106 = (uint64_t)(v53 + 4);
    uint64_t v55 = String.init<A>(describing:)();
    uint64_t *v111 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v56, &v117);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v1 = (uint64_t *)(v0 + 232);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v20, "🧩 Command: %{public}s", v53, 0xCu);
    OUTLINED_FUNCTION_32();
    uint64_t v57 = v54;
    v52 = &unk_100011000;
    OUTLINED_FUNCTION_0_0(v57);
    uint64_t v58 = (uint64_t)v53;
    uint64_t v48 = (uint64_t *)(v0 + 248);
    OUTLINED_FUNCTION_0_0(v58);
  }

  if (!*(void *)(*(void *)(v0 + 312) + 16))
  {
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v77 = (void *)Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_7_0(v78))
    {
      uint64_t v79 = OUTLINED_FUNCTION_3_0();
      uint64_t v80 = OUTLINED_FUNCTION_4_0();
      uint64_t v117 = v80;
      unint64_t v81 = OUTLINED_FUNCTION_15_0(COERCE_FLOAT(v52[213]));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v82, v83, "🧩 %{public}s");
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_0_0(v80);
      OUTLINED_FUNCTION_0_0(v79);
    }

    unint64_t v84 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v84);
    char v38 = 6;
    goto LABEL_42;
  }
  swift_bridgeObjectRetain();
  unint64_t v59 = specialized __RawDictionaryStorage.find<A>(_:)(v26, v27);
  if ((v60 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  uint64_t v61 = v52;
  char v62 = *(unsigned char *)(*(void *)(*(void *)(v0 + 312) + 56) + 2 * v59 + 1);
  *(unsigned char *)(v0 + 386) = v62;
  swift_bridgeObjectRelease();
  uint64_t v63 = Logger.logObject.getter();
  os_log_type_t v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    uint64_t v66 = OUTLINED_FUNCTION_4_0();
    uint64_t v117 = v66;
    *(_DWORD *)uint64_t v65 = v61[213];
    *(unsigned char *)(v0 + 384) = v62;
    lazy protocol witness table accessor for type Property and conformance Property();
    uint64_t v67 = dispatch thunk of CustomStringConvertible.description.getter();
    *uint64_t v1 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v67, v68, &v117);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "🧩 Property: %{public}s", v65, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0(v66);
    OUTLINED_FUNCTION_0_0((uint64_t)v65);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  lazy protocol witness table accessor for type Property and conformance Property();
  *(void *)(v0 + 368) = Dictionary.init(dictionaryLiteral:)();
  unint64_t v69 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v69;
  *unint64_t v69 = v0;
  v69[1] = static MusicUIEngagementExtension.parseRequest(request:completion:);
  OUTLINED_FUNCTION_11_0();
  return static MusicUIEngagementExtension.fetchProperty(_:)(v70, v71);
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10();
  *id v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(static MusicUIEngagementExtension.parseRequest(request:completion:), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v4;
  char v5;
  uint64_t v6;
  BOOL v7;
  Swift::Int v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  Swift::Int v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  os_log_type_t v56;
  _DWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  int64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  void *v90;
  os_log_type_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v100;
  int64_t v101;
  int64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  Class isa;
  void *v107;
  SEL v108;
  id v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  os_log_type_t v114;
  NSObject *v115;
  os_log_type_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  void *v120;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;

  v126 = v0;
  uint64_t v1 = *(void *)(v0 + 368);
  id v2 = *(unsigned char *)(v0 + 386);
  outlined init with copy of Encodable?(v0 + 64, v0 + 104, &demangling cache variable for type metadata for Encodable?);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 208) = v1;
  uint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2);
  os_log_type_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = (v5 & 1) == 0;
  uint64_t v8 = v6 + v7;
  if (__OFADD__(v6, v7))
  {
    __break(1u);
    goto LABEL_71;
  }
  uint64_t v9 = v4;
  uint64_t v10 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<Property, Encodable?>);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v8))
  {
    unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(*(unsigned char *)(v0 + 386));
    if ((v10 & 1) != (v12 & 1))
    {
LABEL_12:
      OUTLINED_FUNCTION_25();
      return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    }
    uint64_t v9 = v11;
  }
  char v13 = *(void **)(v0 + 208);
  if (v10)
  {
    outlined assign with take of Encodable?(v0 + 104, v13[7] + 40 * v9);
  }
  else
  {
    uint64_t v14 = *(unsigned char *)(v0 + 386);
    v13[(v9 >> 6) + 8] |= 1 << v9;
    *(unsigned char *)(v13[6] + v9) = v14;
    outlined init with take of Encodable?(v0 + 104, v13[7] + 40 * v9, &demangling cache variable for type metadata for Encodable?);
    BOOL v15 = v13[2];
    uint64_t v16 = __OFADD__(v15, 1);
    char v17 = v15 + 1;
    if (v16)
    {
LABEL_72:
      __break(1u);
      goto LABEL_73;
    }
    v13[2] = v17;
  }
  uint64_t v19 = *(void *)(v0 + 352);
  uint64_t v18 = *(void *)(v0 + 360);
  unint64_t v20 = *(void *)(v0 + 328);
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + 64, &demangling cache variable for type metadata for Encodable?);
  uint64_t v21 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 216) = v20;
  unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(v19, v18);
  uint64_t v24 = *(void *)(v20 + 16);
  unint64_t v25 = (v23 & 1) == 0;
  uint64_t v26 = v24 + v25;
  if (__OFADD__(v24, v25))
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  uint64_t v27 = v22;
  uint64_t v28 = v23;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _NativeDictionary<String, ODJResponse.PropertyIdentifierResponse>);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v21, v26))
  {
    uint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(v0 + 352), *(void *)(v0 + 360));
    if ((v28 & 1) != (v30 & 1)) {
      goto LABEL_12;
    }
    uint64_t v27 = v29;
  }
  uint64_t v32 = *(void **)(v0 + 216);
  if (v28)
  {
    uint64_t v33 = (void *)(v32[7] + 48 * v27);
    uint64_t v34 = v33[1];
    uint64_t v35 = v33[2];
    unint64_t v36 = v33[3];
    swift_bridgeObjectRelease();
    outlined consume of ODJResponse.JSONPayloadError?(v34, v35, v36);
    *uint64_t v33 = v13;
    *(_OWORD *)(v33 + 1) = 0u;
    *(_OWORD *)(v33 + 3) = 0u;
    v33[5] = 0;
    goto LABEL_20;
  }
  char v38 = *(void *)(v0 + 352);
  uint64_t v37 = *(void *)(v0 + 360);
  v32[(v27 >> 6) + 8] |= 1 << v27;
  uint64_t v39 = (void *)(v32[6] + 16 * v27);
  *uint64_t v39 = v38;
  v39[1] = v37;
  uint64_t v40 = v32[7] + 48 * v27;
  *(void *)uint64_t v40 = v13;
  *(_OWORD *)(v40 + 8) = 0u;
  *(_OWORD *)(v40 + 24) = 0u;
  *(void *)(v40 + 40) = 0;
  os_log_type_t v41 = v32[2];
  uint64_t v16 = __OFADD__(v41, 1);
  uint64_t v42 = v41 + 1;
  if (v16)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v32[2] = v42;
  swift_bridgeObjectRetain();
LABEL_20:
  uint64_t v43 = (id *)(v0 + 256);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v44 = *(void *)(v0 + 336);
  uint64_t v45 = *(void *)(v0 + 344);
  *(void *)(v0 + 328) = v32;
  if (v45)
  {
    OUTLINED_FUNCTION_41();
    uint64_t v49 = v48 | (v46 << 6);
    unint64_t v50 = *(void *)(v0 + 312);
    goto LABEL_22;
  }
  v73 = v44 + 1;
  if (__OFADD__(v44, 1))
  {
    __break(1u);
LABEL_76:
    swift_once();
LABEL_62:
    *(void *)(v0 + 16) = v32;
    lazy protocol witness table accessor for type ODJResponse and conformance ODJResponse();
    OUTLINED_FUNCTION_30();
    uint64_t v103 = dispatch thunk of JSONEncoder.encode<A>(_:)();
    v105 = v104;
    swift_bridgeObjectRelease();
    self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    *uint64_t v43 = 0;
    uint64_t v107 = (void *)OUTLINED_FUNCTION_26();
    uint64_t v109 = [v107 v108];

    uint64_t v110 = *v43;
    if (v109)
    {
      v111 = v0 + 176;
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v112 = *(void *)(v0 + 304);
      uint64_t v113 = type metadata accessor for Logger();
      uint64_t v114 = __swift_project_value_buffer(v113, (uint64_t)static MusicUIEngagementExtension.logger);
      outlined init with copy of Any(v112, v0 + 176);
      uint64_t v115 = Logger.logObject.getter();
      uint64_t v116 = static os_log_type_t.default.getter();
      if (OUTLINED_FUNCTION_13_0(v116))
      {
        uint64_t v117 = OUTLINED_FUNCTION_17_0();
        v124 = OUTLINED_FUNCTION_28();
        v125 = v124;
        *(_DWORD *)uint64_t v117 = 136446466;
        *(void *)(v0 + 272) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000021, 0x8000000100011B30, &v125);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v117 + 12) = 2082;
        outlined init with copy of Any(v111, v0 + 144);
        uint64_t v118 = String.init<A>(describing:)();
        *(void *)(v0 + 288) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v118, v119, &v125);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v111);
        _os_log_impl((void *)&_mh_execute_header, v115, v114, "🧩 %{public}s Sending JSON to ODJ: %{public}s", (uint8_t *)v117, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_0(v124);
        OUTLINED_FUNCTION_0_0(v117);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1(v0 + 176);
      }
      outlined consume of Data._Representation(v103, v105);
    }
    else
    {
      v120 = v110;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      outlined consume of Data._Representation(v103, v105);
    }
LABEL_48:
    OUTLINED_FUNCTION_25();
    __asm { BRAA            X1, X16 }
  }
  unint64_t v74 = (1 << *(unsigned char *)(v0 + 385)) + 63;
  unint64_t v50 = *(void *)(v0 + 312);
  if (v73 >= (uint64_t)(v74 >> 6))
  {
LABEL_61:
    swift_release();
    if (one-time initialization token for encoder == -1) {
      goto LABEL_62;
    }
    goto LABEL_76;
  }
  uint64_t v75 = v50 + 64;
  uint64_t v76 = *(void *)(v50 + 64 + 8 * v73);
  unint64_t v46 = v44 + 1;
  if (!v76)
  {
    os_log_type_t v101 = v74 >> 6;
    unint64_t v46 = v73 + 1;
    if (v73 + 1 < v101)
    {
      uint64_t v76 = *(void *)(v75 + 8 * v46);
      if (v76) {
        goto LABEL_34;
      }
      unint64_t v46 = v73 + 2;
      if (v73 + 2 < v101)
      {
        uint64_t v76 = *(void *)(v75 + 8 * v46);
        if (v76) {
          goto LABEL_34;
        }
        uint64_t v102 = v73 + 3;
        if (v102 < v101)
        {
          uint64_t v76 = *(void *)(v75 + 8 * v102);
          if (v76)
          {
            unint64_t v46 = v102;
            goto LABEL_34;
          }
          while (1)
          {
            unint64_t v46 = v102 + 1;
            if (__OFADD__(v102, 1)) {
              __break(1u);
            }
            if (v46 >= v101) {
              break;
            }
            uint64_t v76 = *(void *)(v75 + 8 * v46);
            ++v102;
            if (v76) {
              goto LABEL_34;
            }
          }
        }
      }
    }
    goto LABEL_61;
  }
LABEL_34:
  uint64_t v47 = (v76 - 1) & v76;
  uint64_t v49 = __clz(__rbit64(v76)) + (v46 << 6);
LABEL_22:
  *(void *)(v0 + 336) = v46;
  *(void *)(v0 + 344) = v47;
  os_log_type_t v51 = (uint64_t *)(*(void *)(v50 + 48) + 16 * v49);
  v52 = *v51;
  *(void *)(v0 + 352) = *v51;
  SEL v53 = v51[1];
  *(void *)(v0 + 360) = v53;
  if (*(unsigned char *)(*(void *)(v50 + 56) + 2 * v49))
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger == -1)
    {
LABEL_24:
      uint64_t v54 = type metadata accessor for Logger();
      __swift_project_value_buffer(v54, (uint64_t)static MusicUIEngagementExtension.logger);
      uint64_t v55 = (void *)Logger.logObject.getter();
      unint64_t v56 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_7_0(v56))
      {
        uint64_t v57 = (_DWORD *)OUTLINED_FUNCTION_3_0();
        uint64_t v58 = OUTLINED_FUNCTION_4_0();
        v125 = v58;
        *uint64_t v57 = 136315138;
        unint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(5390674, 0xE300000000000000, &v125);
        OUTLINED_FUNCTION_21(v59);
        OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v60, v61, "🧩 %s, privacy: .public)");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_0(v58);
        OUTLINED_FUNCTION_0_0((uint64_t)v57);
      }

      char v62 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
      OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v62);
      os_log_type_t v64 = 5;
LABEL_47:
      *uint64_t v63 = v64;
      swift_willThrow();
      swift_release();
      goto LABEL_48;
    }
LABEL_74:
    swift_once();
    goto LABEL_24;
  }
  v123 = v52;
  uint64_t v65 = one-time initialization token for logger;
  swift_bridgeObjectRetain();
  if (v65 != -1) {
    swift_once();
  }
  uint64_t v66 = type metadata accessor for Logger();
  __swift_project_value_buffer(v66, (uint64_t)static MusicUIEngagementExtension.logger);
  uint64_t v67 = Logger.logObject.getter();
  unint64_t v68 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v67, v68))
  {
    unint64_t v69 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v122 = OUTLINED_FUNCTION_4_0();
    v125 = v122;
    *(_DWORD *)unint64_t v69 = 136446210;
    uint64_t v70 = String.init<A>(describing:)();
    *(void *)(v0 + 240) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v71, &v125);
    uint64_t v72 = (uint64_t *)(v0 + 248);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v67, v68, "🧩 Command: %{public}s", v69, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0(v122);
    OUTLINED_FUNCTION_0_0((uint64_t)v69);
  }
  else
  {

    uint64_t v72 = (uint64_t *)(v0 + 248);
  }
  if (!*(void *)(*(void *)(v0 + 312) + 16))
  {
LABEL_44:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v90 = (void *)Logger.logObject.getter();
    unint64_t v91 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_7_0(v91))
    {
      unint64_t v92 = OUTLINED_FUNCTION_3_0();
      v93 = v72;
      v94 = OUTLINED_FUNCTION_4_0();
      v125 = v94;
      SEL v95 = OUTLINED_FUNCTION_15_0(4.8751e-34);
      *v93 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v95, 0x8000000100011B00, &v125);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v96, v97, "🧩 %{public}s");
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_0_0(v94);
      OUTLINED_FUNCTION_0_0(v92);
    }

    uint64_t v98 = lazy protocol witness table accessor for type ExtensionError and conformance ExtensionError();
    OUTLINED_FUNCTION_8_0((uint64_t)&type metadata for ExtensionError, v98);
    os_log_type_t v64 = 6;
    goto LABEL_47;
  }
  swift_bridgeObjectRetain();
  long long v77 = specialized __RawDictionaryStorage.find<A>(_:)(v123, v53);
  if ((v78 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  uint64_t v79 = *(unsigned char *)(*(void *)(*(void *)(v0 + 312) + 56) + 2 * v77 + 1);
  *(unsigned char *)(v0 + 386) = v79;
  swift_bridgeObjectRelease();
  uint64_t v80 = Logger.logObject.getter();
  unint64_t v81 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    uint64_t v83 = OUTLINED_FUNCTION_4_0();
    v125 = v83;
    *(_DWORD *)uint64_t v82 = 136446210;
    *(unsigned char *)(v0 + 384) = v79;
    lazy protocol witness table accessor for type Property and conformance Property();
    unint64_t v84 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 232) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v85, &v125);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v80, v81, "🧩 Property: %{public}s", v82, 0xCu);
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_0_0(v83);
    OUTLINED_FUNCTION_0_0((uint64_t)v82);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  lazy protocol witness table accessor for type Property and conformance Property();
  *(void *)(v0 + 368) = Dictionary.init(dictionaryLiteral:)();
  uint64_t v86 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v86;
  *uint64_t v86 = v0;
  v86[1] = static MusicUIEngagementExtension.parseRequest(request:completion:);
  OUTLINED_FUNCTION_25();
  return static MusicUIEngagementExtension.fetchProperty(_:)(v87, v88);
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    outlined destroy of Any?(a1, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject?, @unowned NSError?) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  outlined init with copy of Encodable?(a1, (uint64_t)v11, &demangling cache variable for type metadata for Any?);
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v10 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = __swift_project_boxed_opaque_existential_1(v11, v12);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6, v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = _bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if (a2) {
LABEL_3:
  }
    a2 = (void *)_convertErrorToNSError(_:)();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease();
}

uint64_t static MusicUIEngagementExtension.fetchProperty(_:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 96) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = type metadata accessor for DefaultsKeys.LegacyDefaultsKeys();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = *(void *)(v4 - 8);
  *(void *)(v3 + 48) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for DefaultsKeys.Engagement();
  *(void *)(v3 + 56) = v5;
  *(void *)(v3 + 64) = *(void *)(v5 - 8);
  *(void *)(v3 + 72) = swift_task_alloc();
  return _swift_task_switch(static MusicUIEngagementExtension.fetchProperty(_:), 0, 0);
}

uint64_t static MusicUIEngagementExtension.fetchProperty(_:)()
{
  switch(*(unsigned char *)(v2 + 96))
  {
    case 5:
      if (one-time initialization token for userDefaults != -1) {
        swift_once();
      }
      uint64_t v7 = (void *)static MusicUIEngagementExtension.userDefaults;
      uint64_t v8 = *(void *)(v2 + 16);
      if (!static MusicUIEngagementExtension.userDefaults) {
        goto LABEL_49;
      }
      OUTLINED_FUNCTION_38();
LABEL_13:
      NSString v9 = String._bridgeToObjectiveC()();
      id v10 = [v7 integerForKey:v9];

      *(void *)(v8 + 24) = &type metadata for Int;
      *(void *)(v8 + 32) = &protocol witness table for Int;
      *(void *)uint64_t v8 = v10;
      goto LABEL_52;
    case 6:
      if (one-time initialization token for userDefaults != -1) {
        swift_once();
      }
      uint64_t v7 = (void *)static MusicUIEngagementExtension.userDefaults;
      uint64_t v8 = *(void *)(v2 + 16);
      if (static MusicUIEngagementExtension.userDefaults) {
        goto LABEL_13;
      }
LABEL_49:
      *(void *)(v8 + 32) = 0;
      *(_OWORD *)uint64_t v8 = 0u;
      *(_OWORD *)(v8 + 16) = 0u;
      goto LABEL_52;
    case 7:
      if (![self deviceMediaLibrary])
      {
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
        JUMPOUT(0x10000DB94);
      }
      OUTLINED_FUNCTION_20_0();
      unsigned __int8 v11 = [v0 hasAddedToLibraryAppleMusicContent];
      goto LABEL_24;
    case 8:
      if (![self deviceMediaLibrary]) {
        goto LABEL_60;
      }
      OUTLINED_FUNCTION_20_0();
      id v22 = [v21 filterAvailableContentGroups:128 withOptions:2];

      *(void *)(v1 + 24) = &type metadata for Bool;
      *(void *)(v1 + 32) = &protocol witness table for Bool;
      *(unsigned char *)uint64_t v1 = v22 != 0;
      goto LABEL_52;
    case 9:
      if (![self deviceMediaLibrary]) {
        goto LABEL_56;
      }
      OUTLINED_FUNCTION_20_0();
      unsigned __int8 v11 = [v0 hasUserPlaylists];
      goto LABEL_24;
    case 0xA:
      if (![self sharedCloudController]) {
        goto LABEL_57;
      }
      OUTLINED_FUNCTION_20_0();
      unsigned __int8 v11 = [v0 isAutomaticDownloadsEnabled];
      goto LABEL_24;
    case 0xB:
      id v12 = [self defaultWorkspace];
      if (!v12) {
        goto LABEL_58;
      }
      char v13 = v12;
      uint64_t v14 = *(void *)(v2 + 16);
      OUTLINED_FUNCTION_38();
      NSString v15 = String._bridgeToObjectiveC()();
      unsigned __int8 v16 = [v13 applicationIsInstalled:v15];

      *(void *)(v14 + 24) = &type metadata for Bool;
      *(void *)(v14 + 32) = &protocol witness table for Bool;
      *(unsigned char *)uint64_t v14 = v16;
      goto LABEL_52;
    case 0xC:
      if (![self sharedCloudController]) {
        goto LABEL_59;
      }
      OUTLINED_FUNCTION_20_0();
      unsigned __int8 v11 = [v0 isCloudLibraryEnabled];
LABEL_24:
      unsigned __int8 v17 = v11;

      *(void *)(v1 + 24) = &type metadata for Bool;
      *(void *)(v1 + 32) = &protocol witness table for Bool;
      *(unsigned char *)uint64_t v1 = v17;
      goto LABEL_52;
    case 0xD:
      type metadata accessor for ControlCenterServicesProxy();
      *(void *)(v2 + 80) = static ControlCenterServicesProxy.shared.getter();
      uint64_t v55 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of ControlCenterServicesProxy.isMusicRecognitionEnabled()
                              + async function pointer to dispatch thunk of ControlCenterServicesProxy.isMusicRecognitionEnabled());
      uint64_t v18 = (void *)swift_task_alloc();
      *(void *)(v2 + 88) = v18;
      *uint64_t v18 = v2;
      v18[1] = static MusicUIEngagementExtension.fetchProperty(_:);
      return v55();
    case 0xE:
      if (one-time initialization token for userDefaults != -1) {
        swift_once();
      }
      if (!static MusicUIEngagementExtension.userDefaults) {
        goto LABEL_50;
      }
      uint64_t v20 = *(void *)(v2 + 16);
      goto LABEL_38;
    case 0xF:
      if (one-time initialization token for userDefaults != -1) {
        swift_once();
      }
      if (static MusicUIEngagementExtension.userDefaults)
      {
        uint64_t v20 = *(void *)(v2 + 16);
LABEL_38:
        uint64_t v23 = OUTLINED_FUNCTION_9_0();
        v24(v23);
        char v25 = NSUserDefaults.BOOL(forKey:)();
        uint64_t v26 = OUTLINED_FUNCTION_27();
        v27(v26);
        *(void *)(v20 + 24) = &type metadata for Bool;
        *(void *)(v20 + 32) = &protocol witness table for Bool;
        if (v25 != 2)
        {
          **(unsigned char **)(v2 + 16) = v25 & 1;
          goto LABEL_52;
        }
      }
      else
      {
LABEL_50:
        uint64_t v53 = *(void *)(v2 + 16);
        *(void *)(v53 + 24) = &type metadata for Bool;
        *(void *)(v53 + 32) = &protocol witness table for Bool;
      }
      **(unsigned char **)(v2 + 16) = 0;
LABEL_52:
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_12_0();
      return v54();
    case 0x10:
      uint64_t v28 = static UnifiedMessages.legacyDefaultsSuiteName.getter();
      uint64_t v30 = v29;
      id v31 = objc_allocWithZone((Class)NSUserDefaults);
      id v32 = @nonobjc NSUserDefaults.init(suiteName:)(v28, v30);
      if (!v32) {
        goto LABEL_47;
      }
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)(v2 + 16);
      uint64_t v35 = OUTLINED_FUNCTION_9_0();
      v36(v35);
      id v37 = v33;
      DefaultsKeys.LegacyDefaultsKeys.rawValue.getter();
      uint64_t v38 = OUTLINED_FUNCTION_27();
      v39(v38);
      NSString v40 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      unsigned __int8 v41 = [v37 BOOLForKey:v40];

      *(void *)(v34 + 24) = &type metadata for Bool;
      *(void *)(v34 + 32) = &protocol witness table for Bool;

      *(unsigned char *)uint64_t v34 = v41 ^ 1;
      goto LABEL_52;
    case 0x11:
      if (one-time initialization token for userDefaults != -1) {
        swift_once();
      }
      if (!static MusicUIEngagementExtension.userDefaults) {
        goto LABEL_47;
      }
      uint64_t v42 = OUTLINED_FUNCTION_9_0();
      v43(v42);
      uint64_t v44 = NSUserDefaults.integer(forKey:)();
      char v46 = v45;
      uint64_t v47 = OUTLINED_FUNCTION_27();
      v48(v47);
      if (v46) {
        goto LABEL_47;
      }
      uint64_t v49 = *(uint64_t **)(v2 + 16);
      v49[3] = (uint64_t)&type metadata for Int;
      v49[4] = (uint64_t)&protocol witness table for Int;
      *uint64_t v49 = v44;
      goto LABEL_52;
    case 0x12:
      os_log_type_t v51 = *(uint64_t **)(v2 + 16);
      v51[3] = type metadata accessor for UnifiedMessages.MLI.State();
      v51[4] = lazy protocol witness table accessor for type UnifiedMessages.MLI.State and conformance UnifiedMessages.MLI.State();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
      static MusicUIEngagementExtension.mliState.getter((uint64_t)boxed_opaque_existential_1);
      goto LABEL_52;
    default:
      if (one-time initialization token for userDefaults != -1) {
        swift_once();
      }
      uint64_t v3 = (void *)static MusicUIEngagementExtension.userDefaults;
      if (static MusicUIEngagementExtension.userDefaults)
      {
        uint64_t v4 = *(void **)(v2 + 16);
        Property.rawValue.getter(*(unsigned char *)(v2 + 96));
        NSString v5 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v6 = [v3 integerForKey:v5];

        v4[3] = &type metadata for Int;
        v4[4] = &protocol witness table for Int;
        *uint64_t v4 = v6;
      }
      else
      {
LABEL_47:
        uint64_t v50 = *(void *)(v2 + 16);
        *(void *)(v50 + 32) = 0;
        *(_OWORD *)uint64_t v50 = 0u;
        *(_OWORD *)(v50 + 16) = 0u;
      }
      goto LABEL_52;
  }
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10();
  *uint64_t v2 = v1;
  *(unsigned char *)(v4 + 97) = v3;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(static MusicUIEngagementExtension.fetchProperty(_:), 0, 0);
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  OUTLINED_FUNCTION_14_0();
  uint64_t v1 = *(unsigned char *)(v0 + 97);
  uint64_t v2 = *(void *)(v0 + 16);
  *(void *)(v2 + 24) = &type metadata for Bool;
  *(void *)(v2 + 32) = &protocol witness table for Bool;
  *(unsigned char *)uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_0();
  return v3();
}

uint64_t NSUserDefaults.BOOL(forKey:)()
{
  DefaultsKeys.Engagement.rawValue.getter();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Encodable?((uint64_t)v5, (uint64_t)v6, &demangling cache variable for type metadata for Any?);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 2;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for Any?);
    return 2;
  }
}

uint64_t NSUserDefaults.integer(forKey:)()
{
  DefaultsKeys.Engagement.rawValue.getter();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Encodable?((uint64_t)v5, (uint64_t)v6, &demangling cache variable for type metadata for Any?);
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
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for Any?);
    return 0;
  }
}

uint64_t static MusicUIEngagementExtension.mliState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnifiedMessages.MLI.State?);
  __chkstk_darwin(v2 - 8, v3);
  NSString v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = static UnifiedMessages.defaultsSuiteName.getter();
  uint64_t v8 = v7;
  id v9 = objc_allocWithZone((Class)NSUserDefaults);
  id v10 = @nonobjc NSUserDefaults.init(suiteName:)(v6, v8);
  if (!v10) {
    goto LABEL_6;
  }
  id v11 = v10;
  static UnifiedMessages.MLI.userDefaultsKey.getter();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v13 = [v11 stringForKey:v12];

  if (!v13)
  {

    goto LABEL_6;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  UnifiedMessages.MLI.State.init(rawValue:)();
  uint64_t v14 = type metadata accessor for UnifiedMessages.MLI.State();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v14) == 1)
  {
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for UnifiedMessages.MLI.State?);
LABEL_6:
    uint64_t v15 = enum case for UnifiedMessages.MLI.State.unknown(_:);
    uint64_t v16 = type metadata accessor for UnifiedMessages.MLI.State();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(a1, v15, v16);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, v5, v14);
}

id MusicUIEngagementExtension.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id MusicUIEngagementExtension.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MusicUIEngagementExtension()
{
  return self;
}

uint64_t sub_10000E1EC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject?, @unowned NSError?) -> ()(uint64_t a1, void *a2)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned Swift.AnyObject?, @unowned NSError?) -> ()(a1, a2, *(void *)(v2 + 16));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id @nonobjc NSUserDefaults.init(suiteName:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithSuiteName:v3];

  return v4;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_0();
  return v3();
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
    uint64_t result = (uint64_t)_StringGuts._allocateForDeconstruct()(a5, a6);
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

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
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
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
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
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  NSString v12 = v10 + 32;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000ECF4()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t partial apply for closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t)(v1 + 4);
  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  uint64_t v10 = v1[10];
  uint64_t v9 = v1[11];
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *size_t v11 = v2;
  v11[1] = partial apply for closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:);
  return closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:)(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t partial apply for closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:)()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_0();
  return v3();
}

unint64_t lazy protocol witness table accessor for type ODJResponse and conformance ODJResponse()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJResponse and conformance ODJResponse;
  if (!lazy protocol witness table cache variable for type ODJResponse and conformance ODJResponse)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJResponse and conformance ODJResponse);
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000EFB4()
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
  v5[1] = partial apply for closure #1 in static MusicUIEngagementExtension.performRequest(with:completion:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu);
  return v6(a1, v4);
}

unint64_t lazy protocol witness table accessor for type ODJRequest and conformance ODJRequest()
{
  unint64_t result = lazy protocol witness table cache variable for type ODJRequest and conformance ODJRequest;
  if (!lazy protocol witness table cache variable for type ODJRequest and conformance ODJRequest)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ODJRequest and conformance ODJRequest);
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(char a1)
{
  Hasher.init(_seed:)();
  Property.rawValue.getter(a1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t outlined consume of ODJResponse.JSONPayloadError?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined assign with take of Encodable?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000020;
      unint64_t v8 = 0x8000000100011700;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xD00000000000001FLL;
          uint64_t v9 = "voritedInLibrary";
          goto LABEL_23;
        case 2:
          uint64_t v10 = "countOfDownloadedSongsInLibrary";
          goto LABEL_20;
        case 3:
          BOOL v11 = "countOfPlaylistsInLibrary";
          goto LABEL_16;
        case 4:
          unint64_t v7 = 0xD000000000000022;
          uint64_t v9 = "countOfSongsInLibrary";
          goto LABEL_23;
        case 5:
          unint64_t v7 = 0xD00000000000001CLL;
          uint64_t v9 = "PlaylistsInLibrary";
          goto LABEL_23;
        case 6:
          uint64_t v9 = "getCountOfPlaylistsInLibrary";
          unint64_t v7 = 0xD000000000000018;
          goto LABEL_23;
        case 7:
          unint64_t v7 = 0xD00000000000001BLL;
          uint64_t v9 = "getCountOfSongsInLibrary";
          goto LABEL_23;
        case 8:
          unint64_t v7 = 0xD00000000000001FLL;
          uint64_t v9 = "hasCatalogContentsInLibrary";
          goto LABEL_23;
        case 9:
          unint64_t v7 = 0xD00000000000001CLL;
          uint64_t v9 = "hasEverDownloadedCatalogContent";
          goto LABEL_23;
        case 0xA:
          unint64_t v7 = 0xD00000000000001BLL;
          uint64_t v9 = "hasOwnUserPlaylistsInLibrary";
          goto LABEL_23;
        case 0xB:
          unint64_t v7 = 0xD000000000000017;
          uint64_t v9 = "isAutomaticDownloadsEnabled";
          goto LABEL_23;
        case 0xC:
          BOOL v11 = "isClassicalAppInstalled";
LABEL_16:
          unint64_t v8 = (unint64_t)v11 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000015;
          break;
        case 0xD:
          uint64_t v10 = "isCloudLibraryEnabled";
          goto LABEL_20;
        case 0xE:
          unint64_t v7 = 0xD000000000000011;
          uint64_t v9 = "isMusicRecognitionEnabled";
          goto LABEL_23;
        case 0xF:
          uint64_t v10 = "isSocialOnboarded";
LABEL_20:
          unint64_t v8 = (unint64_t)v10 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000019;
          break;
        case 0x10:
          unint64_t v7 = 0xD00000000000001CLL;
          uint64_t v9 = "isSocialOnboardingAllowed";
          goto LABEL_23;
        case 0x11:
          unint64_t v7 = 0xD000000000000010;
          uint64_t v9 = "isSubscriptionContentAllowed";
LABEL_23:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          break;
        case 0x12:
          unint64_t v8 = 0xE800000000000000;
          unint64_t v7 = 0x6574617453696C6DLL;
          break;
        default:
          break;
      }
      unint64_t v12 = 0xD000000000000020;
      unint64_t v13 = 0x8000000100011700;
      switch(v6)
      {
        case 1:
          unint64_t v12 = 0xD00000000000001FLL;
          BOOL v14 = "voritedInLibrary";
          goto LABEL_45;
        case 2:
          uint64_t v15 = "countOfDownloadedSongsInLibrary";
          goto LABEL_42;
        case 3:
          uint64_t v16 = "countOfPlaylistsInLibrary";
          goto LABEL_38;
        case 4:
          unint64_t v12 = 0xD000000000000022;
          BOOL v14 = "countOfSongsInLibrary";
          goto LABEL_45;
        case 5:
          unint64_t v12 = 0xD00000000000001CLL;
          BOOL v14 = "PlaylistsInLibrary";
          goto LABEL_45;
        case 6:
          BOOL v14 = "getCountOfPlaylistsInLibrary";
          unint64_t v12 = 0xD000000000000018;
          goto LABEL_45;
        case 7:
          unint64_t v12 = 0xD00000000000001BLL;
          BOOL v14 = "getCountOfSongsInLibrary";
          goto LABEL_45;
        case 8:
          unint64_t v12 = 0xD00000000000001FLL;
          BOOL v14 = "hasCatalogContentsInLibrary";
          goto LABEL_45;
        case 9:
          unint64_t v12 = 0xD00000000000001CLL;
          BOOL v14 = "hasEverDownloadedCatalogContent";
          goto LABEL_45;
        case 10:
          unint64_t v12 = 0xD00000000000001BLL;
          BOOL v14 = "hasOwnUserPlaylistsInLibrary";
          goto LABEL_45;
        case 11:
          unint64_t v12 = 0xD000000000000017;
          BOOL v14 = "isAutomaticDownloadsEnabled";
          goto LABEL_45;
        case 12:
          uint64_t v16 = "isClassicalAppInstalled";
LABEL_38:
          unint64_t v13 = (unint64_t)v16 | 0x8000000000000000;
          unint64_t v12 = 0xD000000000000015;
          break;
        case 13:
          uint64_t v15 = "isCloudLibraryEnabled";
          goto LABEL_42;
        case 14:
          unint64_t v12 = 0xD000000000000011;
          BOOL v14 = "isMusicRecognitionEnabled";
          goto LABEL_45;
        case 15:
          uint64_t v15 = "isSocialOnboarded";
LABEL_42:
          unint64_t v13 = (unint64_t)v15 | 0x8000000000000000;
          unint64_t v12 = 0xD000000000000019;
          break;
        case 16:
          unint64_t v12 = 0xD00000000000001CLL;
          BOOL v14 = "isSocialOnboardingAllowed";
          goto LABEL_45;
        case 17:
          unint64_t v12 = 0xD000000000000010;
          BOOL v14 = "isSubscriptionContentAllowed";
LABEL_45:
          unint64_t v13 = (unint64_t)v14 | 0x8000000000000000;
          break;
        case 18:
          unint64_t v13 = 0xE800000000000000;
          unint64_t v12 = 0x6574617453696C6DLL;
          break;
        default:
          break;
      }
      if (v7 == v12 && v8 == v13) {
        break;
      }
      char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type UnifiedMessages.MLI.State and conformance UnifiedMessages.MLI.State()
{
  unint64_t result = lazy protocol witness table cache variable for type UnifiedMessages.MLI.State and conformance UnifiedMessages.MLI.State;
  if (!lazy protocol witness table cache variable for type UnifiedMessages.MLI.State and conformance UnifiedMessages.MLI.State)
  {
    type metadata accessor for UnifiedMessages.MLI.State();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnifiedMessages.MLI.State and conformance UnifiedMessages.MLI.State);
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

uint64_t outlined init with take of Encodable?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
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

uint64_t outlined init with copy of Encodable?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return String.hash(into:)();
}

Swift::Int OUTLINED_FUNCTION_6_0()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

BOOL OUTLINED_FUNCTION_7_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, uint64_t a2)
{
  return _swift_allocError(a1, a2, 0, 0);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0 + 8;
}

BOOL OUTLINED_FUNCTION_13_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

unint64_t OUTLINED_FUNCTION_15_0(float a1)
{
  *uint64_t v1 = a1;
  return 0xD00000000000002FLL;
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return v1 - 176;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  *uint64_t v1 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  *(void *)(v1 - 216) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, (a2 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_29(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

double OUTLINED_FUNCTION_30()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(void *)(v0 + 56) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return 0;
}

void OUTLINED_FUNCTION_34(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_35(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return v1 - 176;
}

unint64_t OUTLINED_FUNCTION_38()
{
  return 0xD000000000000019;
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X8>)
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, a1 | 0x8000000000000000, (uint64_t *)(v1 - 144));
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t DefaultsKeys.LegacyDefaultsKeys.rawValue.getter()
{
  return DefaultsKeys.LegacyDefaultsKeys.rawValue.getter();
}

uint64_t type metadata accessor for DefaultsKeys.LegacyDefaultsKeys()
{
  return type metadata accessor for DefaultsKeys.LegacyDefaultsKeys();
}

uint64_t DefaultsKeys.Engagement.rawValue.getter()
{
  return DefaultsKeys.Engagement.rawValue.getter();
}

uint64_t type metadata accessor for DefaultsKeys.Engagement()
{
  return type metadata accessor for DefaultsKeys.Engagement();
}

uint64_t static UnifiedMessages.defaultsSuiteName.getter()
{
  return static UnifiedMessages.defaultsSuiteName.getter();
}

uint64_t static UnifiedMessages.legacyDefaultsSuiteName.getter()
{
  return static UnifiedMessages.legacyDefaultsSuiteName.getter();
}

uint64_t static UnifiedMessages.MLI.userDefaultsKey.getter()
{
  return static UnifiedMessages.MLI.userDefaultsKey.getter();
}

uint64_t UnifiedMessages.MLI.State.init(rawValue:)()
{
  return UnifiedMessages.MLI.State.init(rawValue:)();
}

uint64_t type metadata accessor for UnifiedMessages.MLI.State()
{
  return type metadata accessor for UnifiedMessages.MLI.State();
}

uint64_t static ControlCenterServicesProxy.shared.getter()
{
  return static ControlCenterServicesProxy.shared.getter();
}

uint64_t type metadata accessor for ControlCenterServicesProxy()
{
  return type metadata accessor for ControlCenterServicesProxy();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
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

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
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

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeNil(forKey:)()
{
  return KeyedEncodingContainer.encodeNil(forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
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

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}